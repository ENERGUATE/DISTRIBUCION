HA$PBExportHeader$u_indicadores_sum.sru
forward
global type u_indicadores_sum from nonvisualobject
end type
end forward

global type u_indicadores_sum from nonvisualobject
end type
global u_indicadores_sum u_indicadores_sum

type variables
long il_nis_rad
long il_saifi[3]

String is_tipo_area_sum

Long il_f_desde_hist
Long il_f_hasta_hist
Long il_nro_aco

int ii_causa_fm
int ii_causa_otros
int ii_causa_cf

Double idb_saidi[3]

Datetime idt_f_desde
Datetime idt_f_hasta

Boolean ib_grabar_aviso = true
end variables

forward prototypes
public function boolean of_indicadores_sum_actual ()
public subroutine of_det_causas ()
public function boolean of_indicadores_sum ()
public function boolean of_indicadores_sum_hist ()
public function boolean of_det_periodo ()
public function boolean of_det_area_sum ()
end prototypes

public function boolean of_indicadores_sum_actual ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_indicadores_sum_actual
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que genera obtiene el SAIFI y SAIDI de un suministro por Causa de Incidencia
//				 Se genera a partir del contenido de la tabla GI_INT_X_SUM
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:  
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-------		----------------------------------------
// 23/08/2004	LFE			Creaci$$HEX1$$f300$$ENDHEX$$n	
//
//////////////////////////////////////////////////////////////////////////////////////////////// 

Boolean lb_retorno = True
String ls_mensaje
long ll_saifi
Double ldb_saidi
int li_subtipo_causa

DECLARE LC_CUR_SUM_ACTUAL CURSOR FOR
SELECT COUNT(*) AS SAIFI, 
	    nvl(sum(tiempo_interrupcion), 0) / 60 as SAIDI, 
	    SUBTIPO_CAUSA 
FROM GI_INT_X_SUM 
WHERE NIS_RAD = :il_nis_rad AND 
		F_ALTA >= :idt_f_desde AND
		F_ALTA <= :idt_f_hasta AND 
		TIEMPO_INTERRUPCION > 3
GROUP BY SUBTIPO_CAUSA;

OPEN LC_CUR_SUM_ACTUAL;

IF SQLCA.SQLCode = 0 THEN
	FETCH LC_CUR_SUM_ACTUAL
	INTO :ll_saifi,
		  :ldb_saidi,
		  :li_subtipo_causa;
	
	DO WHILE SQLCA.SQLCode = 0
		CHOOSE CASE li_subtipo_causa
			CASE ii_causa_fm
				il_saifi[1] += ll_saifi
				idb_saidi[1] += ldb_saidi
			CASE ii_causa_cf
				il_saifi[2] += ll_saifi
				idb_saidi[2] += ldb_saidi
			CASE ii_causa_otros
				il_saifi[3] += ll_saifi
				idb_saidi[3] += ldb_saidi
		END CHOOSE
		
		FETCH LC_CUR_SUM_ACTUAL
		INTO :ll_saifi,
			  :ldb_saidi,
			  :li_subtipo_causa;
	LOOP
	
	IF SQLCA.SQLCode < 0 THEN
		lb_retorno = False
		ls_mensaje = "Se ha producido un error a la hora de obtener los datos de GI_INT_X_SUM: " + SQLCA.SQLERRText
	END IF
	
	CLOSE LC_CUR_SUM_ACTUAL;
ELSE
	lb_retorno = False
	ls_mensaje = "Se ha producido un error a la hora de abrir el cursor LC_CUR_SUM_ACTUAL: " + SQLCA.SQLERRText
END IF

IF lb_retorno = False THEN
	IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje + " . $$HEX1$$bf00$$ENDHEX$$Desea grabar el aviso de todas formas?", Question!, YesNo! ) = 2 THEN
		ib_grabar_aviso = FALSE
	END IF
END IF

return lb_retorno
end function

public subroutine of_det_causas ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_det_causas
// 
// Objetivo: Determina los distintos subtipos de causas definidos
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:  
//						
// Devuelve:	
//			ps_casua
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-------		----------------------------------------
// 23/08/2004	LFE			Creaci$$HEX1$$f300$$ENDHEX$$n	
//
//////////////////////////////////////////////////////////////////////////////////////////////// 

SELECT SUBTIPO
INTO :ii_causa_fm
FROM GI_SUBTIPOS 
WHERE UPPER(DESCRIPCION) LIKE 'FUERZA%' AND TIPO = 1;

SELECT SUBTIPO
INTO :ii_causa_cf
FROM GI_SUBTIPOS 
WHERE UPPER(DESCRIPCION) LIKE 'CASO%' AND TIPO = 1;

SELECT SUBTIPO
INTO :ii_causa_otros
FROM GI_SUBTIPOS 
WHERE UPPER(DESCRIPCION) LIKE 'OTRA%' AND TIPO = 1;
end subroutine

public function boolean of_indicadores_sum ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_indicadores_sum
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que se encarga de calcular el SAIFI y SAIDI de un suministro por Causa de Incidencia
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:  
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-------		----------------------------------------
// 23/08/2004	LFE			Creaci$$HEX1$$f300$$ENDHEX$$n	
//
//////////////////////////////////////////////////////////////////////////////////////////////// 
int li_contador
boolean lb_retorno = true
string ls_parametro

IF gi_pais = 4 THEN // Si el pa$$HEX1$$ed00$$ENDHEX$$s es Panam$$HEX2$$e1002000$$ENDHEX$$se calculan los indicadores por suministro
	IF il_nro_aco <> fgcdec_aviso_con_alimentacion AND il_nro_aco <> fgcdec_aviso_de_ayuda AND &
		il_nro_aco <> fgcdec_aviso_de_calidad_sin_alim AND il_nro_aco <> fgcdec_aviso_sin_alimentacion AND &
		il_nro_aco <> fgcdec_aviso_alumbrado_publico THEN
		lb_retorno = of_det_area_sum()
		
		IF lb_retorno THEN
	
			IF is_tipo_area_sum = 'R' THEN
				ls_parametro = 'INDICADORES_RUR'
			ELSE
				ls_parametro = 'INDICADORES_URB'
			END IF
			
			// Se comprueba si hay que calcular los indicadores para el $$HEX1$$e100$$ENDHEX$$rea al que pertenece el suministro
			IF fg_verifica_parametro(ls_parametro) THEN
				lb_retorno = of_det_periodo()
						
				IF lb_retorno THEN
					lb_retorno = of_indicadores_sum_hist()
				END IF
				
				IF lb_retorno THEN
					lb_retorno = of_indicadores_sum_actual()
				END IF
			END IF
		END IF
	END IF
	
	IF lb_retorno = FALSE AND ib_grabar_aviso THEN
		// No se ha podido calcular el SAIFI y SAIDI para el suministro, pero el usuario ha decidido guardar el aviso.
		// Se ponen a nulo los indicadores con el fin de saber a posteriori si se ha producido un error en el c$$HEX1$$e100$$ENDHEX$$lculo de
		// los indicadores, ya que si se pusieran a cero no habr$$HEX1$$ed00$$ENDHEX$$a forma de saber si el cero se obtiene del c$$HEX1$$e100$$ENDHEX$$lculo o es 
		// consecuencia de un error
		FOR li_contador = 1 TO UpperBound(il_saifi)
			SetNull(il_saifi[li_contador])
			SetNull(idb_saidi[li_contador])
		NEXT
	END IF
END IF

return ib_grabar_aviso
end function

public function boolean of_indicadores_sum_hist ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_indicadores_sum_hist
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que genera obtiene el SAIFI y SAIDI de un suministro por Causa de Incidencia
//				 Se genera a partir del contenido de la tabla hist$$HEX1$$f300$$ENDHEX$$rica GI_INDICADORES_SUM_DUR, que tiene los valores
//				 calculados del SAIFI y SAIDI por suministro para las interrupciones > 3 minutos
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:  
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-------		----------------------------------------
// 23/08/2004	LFE			Creaci$$HEX1$$f300$$ENDHEX$$n	
//
//////////////////////////////////////////////////////////////////////////////////////////////// 
Boolean lb_retorno = True

SELECT NVL(SUM(SAIFI_1_1 + SAIFI_1_2 + SAIFI_1_3),0) AS SAIFI_FM, 
	   NVL(SUM(SAIFI_2_1 + SAIFI_2_2 + SAIFI_2_3),0) AS SAIFI_CF, 
	   NVL(SUM(SAIFI_3_1 + SAIFI_3_2 + SAIFI_3_3),0) AS SAIFI_OC, 
	   NVL(SUM(SAIDI_1_1 + SAIDI_1_2 + SAIDI_1_3),0)/ 60 AS SAIDI_FM, 
	   NVL(SUM(SAIDI_2_1 + SAIDI_2_2 + SAIDI_2_3),0)/ 60 AS SAIDI_CF, 
	   NVL(SUM(SAIDI_3_1 + SAIDI_3_2 + SAIDI_3_3),0)/ 60 AS SAIDI_OC 
INTO :il_saifi[1],
	  :il_saifi[2],
	  :il_saifi[3],
	  :idb_saidi[1],
	  :idb_saidi[2],
	  :idb_saidi[3]
FROM GI_INDICADORES_SUM_DUR
WHERE NIS_RAD = :il_nis_rad AND
    	F_CIERRE >= :il_f_desde_hist AND
	  	F_CIERRE <= :il_f_hasta_hist;
	  
IF SQLCA.SQLCode < 0 THEN
	IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha producido un error a la hora de obtener los datos de la tabla GI_INDICADORES_SUM_SUR: " + SQLCA.SQLERRText + " . $$HEX1$$bf00$$ENDHEX$$Desea grabar el aviso de todas formas?", Question!, YesNo! ) = 2 THEN
		ib_grabar_aviso = FALSE
	END IF
	lb_retorno = False
END IF

return lb_retorno
end function

public function boolean of_det_periodo ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_det_periodo
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene las fechas de inicio y fin para buscar el la tabla GI_INT_X_SUM, as$$HEX2$$ed002000$$ENDHEX$$como 
//				 las fechas de inicio y fin para buescar en la tabla GI_INDICADORES_SUM_DUR teniendo en cuenta el
//				 actual periodo de penalizaci$$HEX1$$f300$$ENDHEX$$n
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-------		----------------------------------------
// 23/08/2004	LFE			Creaci$$HEX1$$f300$$ENDHEX$$n	
//
//////////////////////////////////////////////////////////////////////////////////////////////// 
Boolean lb_retorno = True
String ls_mensaje
Datetime ldt_fecha_actual

// Se obtiene la fecha actual sin segundos
SELECT to_date(to_char(sysdate, 'dd/mm/yyyy'), 'dd/mm/yyyy')
INTO :ldt_fecha_actual
FROM DUAL;


// Fecha de inicio para la tabla GI_INT_X_SUM
SELECT F_INICIO
INTO :idt_f_desde
FROM GI_PERIODOS_PENALIZACION
WHERE F_INICIO <= :ldt_fecha_actual and
 		F_FIN >= :ldt_fecha_actual AND 
		TIPO_AREA = :is_tipo_area_sum;


// Fecha de fin para la tabla GI_INT_X_SUM
IF SQLCA.SQLCODE = 0 THEN
	SELECT to_date (to_char(sysdate, 'dd/mm/yyyy') || ' 23:59:59', 'dd/mm/yyyy hh24:mi:ss') 
	INTO :idt_f_hasta
	FROM DUAL;
	 
	IF SQLCA.SQLCode <> 0 THEN
		lb_retorno = FALSE
		ls_mensaje = "No se ha podido determinar la fecha de fin del periodo de penalizaci$$HEX1$$f300$$ENDHEX$$n: " + SQLCA.SQLERRText
	END IF
	 
ELSE
	lb_retorno = FALSE
	ls_mensaje = "No se ha podido determinar el periodo de penalizaci$$HEX1$$f300$$ENDHEX$$n: " + SQLCA.SQLERRText
END IF

IF lb_retorno THEN
	// Fecha de inicio en la tabla GI_INDICADORES_SUM_DUR
	il_f_desde_hist = Year(Date(idt_f_desde)) * 100 + Month(Date(idt_f_desde))
	il_f_hasta_hist = Year(Date(idt_f_hasta)) * 100 + Month(Date(idt_f_hasta))
END IF

IF lb_retorno = FALSE THEN
	IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje + + " . $$HEX1$$bf00$$ENDHEX$$Desea grabar el aviso de todas formas?", Question!, YesNo! )  = 2 THEN
		ib_grabar_aviso = FALSE
	END IF
END IF

return lb_retorno


end function

public function boolean of_det_area_sum ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_det_area_sum
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene el $$HEX1$$e100$$ENDHEX$$rea del suministro a partir del CT que lo alimenta
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-------		----------------------------------------
// 23/08/2004	LFE			Creaci$$HEX1$$f300$$ENDHEX$$n	
//
//////////////////////////////////////////////////////////////////////////////////////////////// 

SELECT FGNU_TIPO_AREA(SGD_ACOMETIDA.INSTALACION_ORIGEN)
INTO :is_tipo_area_sum
FROM SGD_ACOMETIDA
WHERE CODIGO = :il_nro_aco AND BDI_JOB = 0;

IF SQLCA.SQLCOde <> 0 THEN
	IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido determinar el $$HEX1$$e100$$ENDHEX$$rea del suministro a partir de la acometida " + string(il_nro_aco) + " : " + SQLCA.SQLErrText + " . $$HEX1$$bf00$$ENDHEX$$Desea grabar el aviso de todas formas?", Question!, YesNo! ) = 2 THEN
		ib_grabar_aviso = FALSE
	END IF
	Return FALSE
ELSE
	IF is_tipo_area_sum <> 'R' AND is_tipo_area_sum <> 'C' AND is_tipo_area_sum <> 'U' THEN
		IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido determinar el $$HEX1$$e100$$ENDHEX$$rea del suministro a partir de la acometida " + string(il_nro_aco)+ ". $$HEX1$$bf00$$ENDHEX$$Desea grabar el aviso de todas formas?", Question!, YesNo! ) = 2 THEN
			ib_grabar_aviso = False
		END IF
		Return FALSE
	ELSEIF is_tipo_area_sum = 'U' OR is_tipo_area_sum = 'C' THEN
		is_tipo_area_sum = 'U'
	END IF

	Return TRUE
END IF
end function

on u_indicadores_sum.create
TriggerEvent( this, "constructor" )
end on

on u_indicadores_sum.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;int li_contador

FOR li_contador = 1 TO UpperBound(il_saifi)
	il_saifi[li_contador] = 0
	idb_saidi[li_contador] = 0
NEXT

of_det_causas()

end event


HA$PBExportHeader$u_avi_1002_nu_generico.sru
$PBExportComments$UserObject gen$$HEX1$$e900$$ENDHEX$$rico de n$$HEX1$$fa00$$ENDHEX$$cleo de avisos.
forward
global type u_avi_1002_nu_generico from nonvisualobject
end type
end forward

global type u_avi_1002_nu_generico from nonvisualobject
end type
global u_avi_1002_nu_generico u_avi_1002_nu_generico

type variables
u_avi_2004_pr_form_inf_resumen iu_avi_2004_pr
end variables

forward prototypes
public function integer fnu_asignar_brigada_inst (long pl_nro_ot, decimal pdec_nro_instalacion)
public function integer fnu_asignar_brigada_avi (long pl_nro_ot, long pl_nro_avi)
public function integer fnu_anular_ot_avi (long pl_nro_avi)
public function string fnu_dir_aviso (long pl_nro_aviso)
public function long fnu_tomar_nro_aviso ()
public function u_generico_comunicaciones fnu_datos_primer_aviso (ref datawindow pw_dw, u_generico_comunicaciones pu_comunic)
public function long fnu_primer_aviso (long pl_nro_instalacion)
public function integer fnu_cambiar_alim_avi (ref datawindow pdw_lista_avi, integer pi_fila_sel, ref datawindow pdw_lista_inst, long pl_nro_avi, decimal pdec_inst_padre, long pl_nis, long pl_nro_ot, datetime pdt_f_alta, string ps_fase, integer pi_tipo_llamada, decimal pdec_ind_leido)
public function integer fnu_anular_ot_inst (decimal pdec_nro_instalacion)
end prototypes

public function integer fnu_asignar_brigada_inst (long pl_nro_ot, decimal pdec_nro_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_asignar_brigada_inst
// 
// Objetivo: Asigna el nro. de OT a la instalaci$$HEX1$$f300$$ENDHEX$$n corresp. en 
//				 'avisos_res'.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pl_nro_ot, pdec_nro_instalacion 
//		Salida:	--						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	22/2/96		JH  			Versi$$HEX1$$f300$$ENDHEX$$n Original
//	24/04/96		HMA  			Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_fecha
int li_avi_brig

SetPointer(HourGlass!)

ldt_fecha   = fgnu_fecha_actual()
li_avi_brig = fgci_aviso_con_brigada

UPDATE "GI_AVISOS_INSTALACION"  
SET "NRO_OT"   = 1 ,
    "F_ACTUAL" = :ldt_fecha,
	"USUARIO"  = :gs_usuario,
	"PROGRAMA" = 'AS_OT_INST'
WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalacion and
			"GI_AVISOS_INSTALACION"."CLASE_AVISO" = :fgci_clase_avi_normal;


UPDATE GI_AVISOS_INSTALACION
SET F_ACTUAL = :ldt_fecha
WHERE NRO_AVISO in (select nro_Aviso from gi_avisos_instalacion  WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalacion and
			"GI_AVISOS_INSTALACION"."CLASE_AVISO" = :fgci_clase_avi_normal);

IF gnv_msg.f_error(8) = 1  THEN

//   UPDATE "AVISOS"  
//  	SET "F_ACTUAL"  = :ldt_fecha,
//		 "USUARIO"   = :gs_usuario,
//		 "EST_AVISO" = :li_avi_brig,
//		 "PROGRAMA"  = 'w_1105_avi'
//   WHERE "AVISOS"."NRO_AVISO" in (SELECT NRO_AVISO
//                                  FROM "AVISO_INS"  
//                                  WHERE "AVISO_INS"."NRO_INSTALACION" = :pdec_nro_instalacion  )  ;
//
//	IF gnv_msg.f_error(5) = 1  THEN
		//COMMIT USING sqlca;
		gnu_u_transaction.uf_commit()
//	END IF 

END IF

RETURN 1

end function

public function integer fnu_asignar_brigada_avi (long pl_nro_ot, long pl_nro_avi);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_asignar_brigada_avi
// 
// Objetivo: Asigna el nro. de OT al aviso corresp. y pone 
//				 al aviso con estado de brigada asignada.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: pl_nro_ot, pl_nro_avi 
//			Salida:							
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/05/96		HMA  			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_fecha
int li_avi_brig


SetPointer(HourGlass!)


ldt_fecha   = fgnu_fecha_actual()
li_avi_brig = fgci_aviso_con_brigada

UPDATE "GI_AVISOS"  
SET "NRO_OT"   = :pl_nro_ot , 
	 "F_ACTUAL"  = :ldt_fecha,
	 "USUARIO"   = :gs_usuario,
	 "EST_AVISO" = :li_avi_brig,
	 "PROGRAMA"  = 'AS_OT_AVI'
WHERE "GI_AVISOS"."NRO_AVISO"  = :pl_nro_avi;

UPDATE GI_AVISOS_INSTALACION
SET F_ACTUAL = :ldt_fecha,
	 EST_AVISO = :li_avi_brig
WHERE NRO_AVISO = :pl_nro_avi;
	
if sqlca.sqlcode = -1 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la acometida del aviso.")
	return -1
end if

//IF gnv_msg.f_error(5) = 1  THEN
//	//COMMIT USING sqlca;
//	gnu_u_transaction.uf_commit()
//END IF 

RETURN 1

end function

public function integer fnu_anular_ot_avi (long pl_nro_avi);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_anular_ot_avi
// 
// Objetivo: Se resetea el nro. de OT del aviso y 
//				 se vuelve el estado del aviso a pendiente.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: pl_nro_avi 
//			Salida:	--		
//				
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/05/96		HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_fecha
int li_avi_pend


SetPointer(HourGlass!)


ldt_fecha   = fgnu_fecha_actual()
li_avi_pend = fgci_aviso_pendiente

UPDATE "GI_AVISOS"  
SET "NRO_OT"    = 0,
	 "F_ACTUAL"  = :ldt_fecha,
 	 "USUARIO"   = :gs_usuario,
	 "PROGRAMA"  = 'AN_OT_AVI',
	 "EST_AVISO" = :li_avi_pend 
WHERE "GI_AVISOS"."NRO_AVISO"  = :pl_nro_avi;

IF gnv_msg.f_error(5) = 1  THEN
	//COMMIT USING sqlca;
	gnu_u_transaction.uf_commit()
END IF 

RETURN 1

end function

public function string fnu_dir_aviso (long pl_nro_aviso);///////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_dir_aviso
// 
// Objetivo: Obtiene la direccion de un aviso, Obtencion de el numero de 
//           puerta , duplicador y nombre de la calle.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  nro_ aviso
//		Salida:   string con la direccion
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int ii_num_puerta
string is_duplicador,is_nom_calle,is_calle

	SELECT A.num_puerta,A.duplicador,B.nom_calle 
			INTO :ii_num_puerta,:is_duplicador,:is_nom_calle
		FROM GI_Avisos A, Callejero B
		WHERE A.cod_calle = B.Cod_Calle;

is_calle=is_nom_calle+" "+String(ii_num_puerta)+" "+is_duplicador


	

Return (is_calle)
end function

public function long fnu_tomar_nro_aviso ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_tomar_nro_aviso
//
// Objetivo: Obtiene el $$HEX1$$fa00$$ENDHEX$$ltimo valor de n$$HEX1$$fa00$$ENDHEX$$mero de aviso.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

long ll_nro_aviso
string ls_tabla = "GI_AVISOS"

// Tomo el $$HEX1$$fa00$$ENDHEX$$ltimo valor de nro. de aviso
SELECT "GI_T_ULTIMO"."ULTIMO"  
INTO :ll_nro_aviso  
FROM "GI_T_ULTIMO"  
WHERE "GI_T_ULTIMO"."TABLA" = :ls_tabla
FOR UPDATE;

// Controlo la carrectitud de la operaci$$HEX1$$f300$$ENDHEX$$n anterior
IF sqlca.SqlCode = 0 THEN
	ll_nro_aviso = ll_nro_aviso + 1
ELSEIF sqlca.SqlCode = 100 THEN
	// Primer registro
	ll_nro_aviso = 1
ELSE
	gnv_msg.f_mensaje("ER01","","",OK!)
	//ROLLBACK USING sqlca;
	gnu_u_transaction.uf_rollback()
	RETURN -1
END IF

// Actualizo el archivo "t_ultimo"
// NO estoy actualizando todos los campos de la tabla
UPDATE "GI_T_ULTIMO"  
SET "ULTIMO" = :ll_nro_aviso  
WHERE "GI_T_ULTIMO"."TABLA" = :ls_tabla;

// Controlo la carrectitud de la operaci$$HEX1$$f300$$ENDHEX$$n anterior
IF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER02","","",OK!)
	//ROLLBACK USING sqlca;
	gnu_u_transaction.uf_rollback()
	RETURN -1
ELSE
	//COMMIT USING sqlca;
	gnu_u_transaction.uf_commit()
END IF

RETURN ll_nro_aviso


end function

public function u_generico_comunicaciones fnu_datos_primer_aviso (ref datawindow pw_dw, u_generico_comunicaciones pu_comunic);/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_datos_primer_aviso
// 
// Objetivo: Obtiene la fecha y la hora del aviso mas antiguo sobre una instalacion.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pd_dw    = d_inf_general
//					 longval1 = nro_ instalacion
//
//		Salida:	longval2 = nro_ aviso  
//			 	 	datval1  = fecha de alta primer aviso
//				   datval2  = hora de alta primer aviso
//						
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  	Fecha         Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// 	---------    			-------         	----------------------------------------
//	24/01/2001		FDO			Creaci$$HEX1$$f300$$ENDHEX$$n.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

datetime ld_f_alta,ld_h_alta
int li_num_puerta
long ll_nro_aviso,ll_tipo_inc,ll_clase_aviso
Decimal{0} ld_nro_instalacion
string ls_nom_calle,ls_duplicador,ls_fase_int

ld_nro_instalacion = pu_comunic.is_comunic.DecVal1

if pu_comunic.is_comunic.intval8 = fgci_clase_avi_calidad then
	ll_clase_aviso = fgci_clase_avi_calidad
	ls_fase_int = '111'
else
	IF IsNull(pu_comunic.is_comunic.strval1) THEN
		ls_fase_int = '111'
	ELSE
		ls_fase_int = '' 
		IF MATCH(pu_comunic.is_comunic.strval1, gs_fase_a) THEN
			ls_fase_int = '1'
		ELSE
			ls_fase_int = '0'
		END IF
		
		IF MATCH(pu_comunic.is_comunic.strval1, gs_fase_b) THEN
			ls_fase_int = ls_fase_int + '1'
		ELSE
			ls_fase_int = ls_fase_int + '0'
		END IF
		
		IF MATCH(pu_comunic.is_comunic.strval1, gs_fase_c) THEN
			ls_fase_int = ls_fase_int + '1'
		ELSE
			ls_fase_int = ls_fase_int + '0'
		END IF
	END IF
	//ls_fase_int = pu_comunic.is_comunic.strval1
	ll_clase_aviso = fgci_clase_avi_normal
end if



//Obtencion de la fecha y hora del aviso mas viejo

// Incidencia. Sustituye a las antiguas funciones recursivas y cursores- FDO

//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  SELECT MIN(GI_AVISOS_INSTALACION.F_ALTA),MIN(NRO_AVISO)
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  INTO :ld_f_alta,:ll_nro_aviso
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  FROM  GI_AVISOS_INSTALACION 
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  WHERE GI_AVISOS_INSTALACION.EST_AVISO <= :fgci_aviso_resuelto 
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD    AND GI_AVISOS_INSTALACION.CLASE_AVISO = :ll_clase_aviso
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD    AND GI_AVISOS_INSTALACION.NRO_INSTALACION = :ld_nro_instalacion
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD    AND ((SUBSTR(NVL(GI_AVISOS_INSTALACION.FASE,'111'),1,1) = '1' AND SUBSTR(:ls_fase_int,1,1) = '1')  OR 
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		(SUBSTR(NVL(GI_AVISOS_INSTALACION.FASE,'111'),2,1) = '1' AND SUBSTR(:ls_fase_int,2,1) = '1')  OR 
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		(SUBSTR(NVL(GI_AVISOS_INSTALACION.FASE,'111'),3,1) = '1' AND SUBSTR(:ls_fase_int,3,1) = '1'));


SELECT MIN(GI_AVISOS_INSTALACION.F_ALTA),MIN(NRO_AVISO)
INTO :ld_f_alta,:ll_nro_aviso
FROM  GI_AVISOS_INSTALACION 
WHERE GI_AVISOS_INSTALACION.EST_AVISO = :fgci_aviso_pendiente
  AND GI_AVISOS_INSTALACION.CLASE_AVISO = :ll_clase_aviso
  AND GI_AVISOS_INSTALACION.NRO_INSTALACION = :ld_nro_instalacion
  AND ((SUBSTR(NVL(GI_AVISOS_INSTALACION.FASE,'111'),1,1) = '1' AND SUBSTR(:ls_fase_int,1,1) = '1')  OR 
		(SUBSTR(NVL(GI_AVISOS_INSTALACION.FASE,'111'),2,1) = '1' AND SUBSTR(:ls_fase_int,2,1) = '1')  OR 
		(SUBSTR(NVL(GI_AVISOS_INSTALACION.FASE,'111'),3,1) = '1' AND SUBSTR(:ls_fase_int,3,1) = '1')) AND 
		( Trunc((sysdate-F_ALTA), 0) < :gi_dias_antiguedad Or :gi_dias_antiguedad = 0 ) ;  /*  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  */

//*******************************************
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//**  JPE 20020904  								 **
//*******************************************
//**  SE CAMBIO ESTE WHERE "WHERE GI_AVISOS_INSTALACION.EST_AVISO <= :fgci_aviso_resuelto"
//**  EN CONVERSACION SOSTENIDA CON LFE, SE DETERMINO QUE SOLO
//**  DEBEN EVALUARSE LOS REGISTROS DE LOS AVISOS PENDIENTES
//*******************************************
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//**  JPE 20020904  								 **
//*******************************************
//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************

//Actualizo los datos de pantalla	
ld_h_alta = ld_f_alta
pu_comunic.is_comunic.longval2 = ll_nro_aviso

if isnull(ld_f_alta) then ld_f_alta = fgnu_fecha_actual()

pu_comunic.is_comunic.datval1 = ld_f_alta
pu_comunic.is_comunic.datval2 = ld_h_alta
pu_comunic.is_comunic.strval2 = ls_nom_calle + " " + String(li_num_puerta) + " " + ls_duplicador

Return pu_comunic
end function

public function long fnu_primer_aviso (long pl_nro_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_primer_aviso
// 
// Objetivo: Obtiene rl aviso mas antiguo sobre un ainstalacion.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  nro_ instalacion
//		Salida:   nro del primer aviso
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_aviso

//Obtencion de la fecha y hora del aviso mas viejo



//*******************************************
//**  OSGI 2001.2  	08/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  	SELECT MIN(NRO_AVISO)
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  	INTO :ll_nro_aviso
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  	FROM  GI_AVISOS_INSTALACION 
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  	WHERE GI_AVISOS_INSTALACION.EST_AVISO <= 5 
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD    	AND GI_AVISOS_INSTALACION.CLASE_AVISO = 0
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD    	AND GI_AVISOS_INSTALACION.NRO_INSTALACION = :pl_nro_instalacion;


	SELECT MIN(NRO_AVISO)
	INTO :ll_nro_aviso
	FROM  GI_AVISOS_INSTALACION 
	WHERE GI_AVISOS_INSTALACION.EST_AVISO = :fgci_aviso_pendiente 
  	AND GI_AVISOS_INSTALACION.CLASE_AVISO = 0
  	AND GI_AVISOS_INSTALACION.NRO_INSTALACION = :pl_nro_instalacion AND 
		( Trunc((sysdate-F_ALTA), 0) < :gi_dias_antiguedad Or :gi_dias_antiguedad = 0 ) ;  /*  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  */

//*******************************************
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//**  JPE 20020904  								 **
//*******************************************
//**  SE CAMBIO ESTE WHERE "WHERE GI_AVISOS_INSTALACION.EST_AVISO <= 5"
//**  EN CONVERSACION SOSTENIDA CON LFE, SE DETERMINO QUE SOLO
//**  DEBEN EVALUARSE LOS REGISTROS DE LOS AVISOS PENDIENTES
//*******************************************
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//**  JPE 20020904  								 **
//*******************************************
//*******************************************
//**  OSGI 2001.2  	08/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************



Return ll_nro_aviso
end function

public function integer fnu_cambiar_alim_avi (ref datawindow pdw_lista_avi, integer pi_fila_sel, ref datawindow pdw_lista_inst, long pl_nro_avi, decimal pdec_inst_padre, long pl_nis, long pl_nro_ot, datetime pdt_f_alta, string ps_fase, integer pi_tipo_llamada, decimal pdec_ind_leido);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_cambiar_alim_avi (Reactivaci$$HEX1$$f300$$ENDHEX$$n de Avisos)
//
// Objetivo:    Implementa una conexi$$HEX1$$f300$$ENDHEX$$n con conectividad para 
//				  que devuelva la jerarqu$$HEX1$$ed00$$ENDHEX$$a en el Estado Real de la red.
//				  Dicha jerarqu$$HEX1$$ed00$$ENDHEX$$a se grabara en la tabla gi_avisos_instalacion.
//				  Si no grabara la jerarqu$$HEX1$$ed00$$ENDHEX$$a real, grabar$$HEX2$$e1002000$$ENDHEX$$la normal.
//				  Esta funci$$HEX1$$f300$$ENDHEX$$n se llama desde la ventana de gesti$$HEX1$$f300$$ENDHEX$$n de avisos e implementa
//				  tres maneras de funcionamiento: La primera cambiar$$HEX2$$e1002000$$ENDHEX$$la alimentaci$$HEX1$$f300$$ENDHEX$$n de un aviso como 
//				  se ven$$HEX1$$ed00$$ENDHEX$$a haciendo  hasta ahora, con la diferencia de la petici$$HEX1$$f300$$ENDHEX$$n a conectividad. La
//				  segunda genera una llamada a conectividad que devuelve la red real para la acometida
//				  de un aviso que estaba ingresado con la red normal.
//				  Y por $$HEX1$$fa00$$ENDHEX$$ltimo, la tercera asigna alimentaci$$HEX1$$f300$$ENDHEX$$n a un aviso sin alimentaci$$HEX1$$f300$$ENDHEX$$n que cuelga de gesti$$HEX1$$f300$$ENDHEX$$n de
//				  avisos, sustituyendo la funcion que exist$$HEX1$$ed00$$ENDHEX$$a anteriormente.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: 	pdw_lista_avi
//					pi_fila_sel
//					pdw_lista_inst
//					pl_nro_avi
//					pdec_inst_padre
//					pl_nis
//					pl_nro_ot
//					pdt_f_alta
//					pi_tipo_llamada, SI pi_tipo_llamada = 1 es el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n normal.
//										  SI pi_tipo_llamada = 2 es petici$$HEX1$$f300$$ENDHEX$$n para reconectar el aviso.
//										  SI pi_tipo_llamada = 3 es petici$$HEX1$$f300$$ENDHEX$$n para asignar alimentaci$$HEX1$$f300$$ENDHEX$$n al aviso.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  	Fecha         Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// 	---------    			-------         	----------------------------------------
//	24/01/2001		FDO			Creaci$$HEX1$$f300$$ENDHEX$$n.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_incidencia,ll_instalacion,ll_posicion_busqueda,ll_instalacion_referencia,ll_padre,ll_clase_aviso,ll_nis,ll_cant_av_ct,ll_ct
string ls_nombre_instalacion,ls_mensaje
int li_contador,li_tipo_instalacion,li_centro,li_mesa,li_cmd,li_ind_red
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup,ldt_f_alta,ldt_f_actual
string ls_t_interrupcion,ls_ci,ls_h_rep
int li_fin_cursor,li_tiempo_espera,li_tipo_red,li_clase_aviso,li_result_func,li_retorno
long ll_inst_padre, ll_nro_orden, ll_ot, ll_nro_incid, ll_nro_aviso,ll_fila=0,ll_ind_incidencia,ll_nro_inc
boolean lb_inc_asoc = False

/////////// Declaraci$$HEX1$$f300$$ENDHEX$$n de variables para la llamada a fnu_o_inf_comple_sum
long ll_orden_servicio
long ll_nro_inciden
boolean lb_incid_pos
string ls_nombre
ls_nombre = " "
///////////

// Reseteo la variable de comunicaciones para que con los mensajes, el activate no vuelva a llamar a la funci$$HEX1$$f300$$ENDHEX$$n

ldt_f_actual=fgnu_fecha_actual()

fgnu_resetear_s_comunicaciones(gu_comunic1) 

lb_incid_pos=false

iu_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen 

// Obtengo la instalaci$$HEX1$$f300$$ENDHEX$$n a la que est$$HEX2$$e1002000$$ENDHEX$$asociado el aviso.
SELECT "CLASE_AVISO"
INTO :ll_clase_aviso
FROM "GI_AVISOS"  
WHERE "NRO_AVISO" = :pl_nro_avi
FOR UPDATE;
	
ll_nro_aviso = pl_nro_avi
ldt_f_alta = pdt_f_alta
ll_nis=pl_nis

if ll_clase_aviso = fgci_clase_avi_calidad then
	iu_avi_2004_pr.is_avisos.gi_ind_calidad= 1
end if

iu_avi_2004_pr.is_avisos.gl_nro_aviso=ll_nro_aviso
iu_avi_2004_pr.is_avisos.gd_f_alta=ldt_f_alta
iu_avi_2004_pr.is_avisos.gl_nro_instalacion=pdec_inst_padre
iu_avi_2004_pr.is_avisos.gs_ventana_carga= "C_ALIM"
iu_avi_2004_pr.is_avisos.gs_fase = ps_fase
ll_instalacion = pdec_inst_padre
// llamo a inf comple sum para cargar conectividad y comprobar si me afecta alguna interrupcion

li_retorno = iu_avi_2004_pr.fpr_o_inf_comple_sum(ll_orden_servicio,ll_nro_inciden,ll_nis,lb_incid_pos,ls_nombre)

if  li_retorno = 1 then
	if upperbound(iu_avi_2004_pr.is_avisos.gl_instalaciones[]) = 0 OR iu_avi_2004_pr.is_avisos.gl_nro_instalacion = 0 then
		if pi_tipo_llamada = 3 then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No existe conectividad para la acometida seleccionada.")
			return -1
		end if
		if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No ha sido posible extraer la conectividad completa de la acometida seleccionada. El aviso se quedar$$HEX2$$e1002000$$ENDHEX$$sin alimentaci$$HEX1$$f300$$ENDHEX$$n, $$HEX1$$bf00$$ENDHEX$$Desea continuar?",Information!,okcancel!) = 2 then
			return -1
		else
			iu_avi_2004_pr.is_avisos.gl_nro_instalacion=fgcdec_aviso_sin_alimentacion
			iu_avi_2004_pr.is_avisos.gs_fase=""
		end if
	end if
end if

if li_retorno = 2 then
	
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Una interrupci$$HEX1$$f300$$ENDHEX$$n afecta a la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada el aviso se asociar$$HEX2$$e1002000$$ENDHEX$$a la incidencia.")
	iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_asociado
	ll_nro_inc = iu_avi_2004_pr.is_avisos.gl_nro_incidencia
	ll_ind_incidencia = 1
elseif li_retorno = 3 then
	
	iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_resuelto
	ll_nro_inc = iu_avi_2004_pr.is_avisos.gl_nro_incidencia
	ll_ind_incidencia = 1

elseif li_retorno = 1 then
	
	iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_pendiente
	
end if

IF gb_operaciones =  true then

	SELECT "GI_AVISOS_INSTALACION"."NRO_INSTALACION"  
		INTO :ll_ct
		FROM "GI_AVISOS_INSTALACION"  
		WHERE ( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_avi ) AND  
					( "GI_AVISOS_INSTALACION"."TIPO_INSTALACION" = :fgci_tipo_ct )   ;

	IF sqlca.SqlCode < 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el CT del aviso.")
	END IF

	SELECT COUNT(distinct NRO_AVISO)  
		INTO :ll_cant_av_ct
		FROM "GI_AVISOS_INSTALACION"  
		WHERE ( "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :ll_ct and  "GI_AVISOS_INSTALACION"."EST_AVISO" = :fgci_aviso_pendiente  ) ;
					
	IF sqlca.SqlCode < 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pueden contabilizar los avisos")
	END IF				
						
	IF ll_cant_av_ct = 1 then // Como vamos a dar de baja el $$HEX1$$fa00$$ENDHEX$$nico aviso del ct, generamos una tool de baja de aviso.
						
//		gu_rf_servidor_operacion.of_tool_aviso(ll_ct,fgnu_fecha_actual(),0,ls_mensaje,gi_ci_ct)
					
		IF ls_mensaje <> "" then
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al dar de alta el tool: " + ls_mensaje,information!,ok!)
		END IF	
						
	END IF

END IF
// Borro la informaci$$HEX1$$f300$$ENDHEX$$n del aviso antiguo

DELETE from gi_avisos_instalacion where nro_aviso=:ll_nro_aviso;

if sqlca.sqlcode = -1 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo eliminar la informaci$$HEX1$$f300$$ENDHEX$$n del aviso en la tabla GI_AVISOS_INSTALACION.")
	return -1
end if

// llamo a avisos instalacion

IF li_retorno <> 3 THEN
	if iu_avi_2004_pr.fpr_avisos_instalacion(ll_clase_aviso) = -1 then
		return -1
	end if
END IF
// Actualizo la tabla de avisos

UPDATE GI_AVISOS 
SET 	EST_AVISO = :iu_avi_2004_pr.is_avisos.gi_est_aviso,
		IND_IMPROCEDENTE = 0,
		PROGRAMA = 'ASIGNA_ALIM',
		NRO_INSTALACION = :ll_instalacion,
		F_ACTUAL = :ldt_f_actual,
		IND_INC_ASOC = :ll_ind_incidencia,
		NRO_INCIDENCIA = :ll_nro_inc,
		NRO_CENTRO = :iu_avi_2004_pr.is_avisos.gi_nro_centro,
		NRO_CMD = :iu_avi_2004_pr.is_avisos.gi_nro_cmd,
		NRO_MESA = :iu_avi_2004_pr.is_avisos.gi_nro_mesa
WHERE NRO_AVISO = :ll_nro_aviso;

if sqlca.sqlcode = -1 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la acometida del aviso.")
	return -1
end if

// GNU 8-5-2007. Incidencia Ezequiel
// Cambio el estado al mismo que GI_AVISOS
UPDATE GI_AVISOS_INSTALACION
SET F_ACTUAL = :ldt_f_actual,
EST_AVISO = :iu_avi_2004_pr.is_avisos.gi_est_aviso,
IND_AVISO_CONSULTADO = :pdec_ind_leido //LSH **** DDAG-255 **** 30/01/2014 **** 
WHERE NRO_AVISO = :ll_nro_aviso;
// FIN GNU

if sqlca.sqlcode = -1 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la acometida del aviso.")
	return -1
end if

if pi_tipo_llamada = 1 or pi_tipo_llamada = 3 then 
	
	if messagebox("Cuesti$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea asociar esta acometida con el suministro de ahora en adelante?",question!,yesno!) = 1 then
	
		// Actualizo la tabla de avisos
	
		UPDATE ACO_SUM 
		SET 	NRO_ACOMETIDA = :ll_instalacion
		WHERE NIS_RAD= :ll_nis;
		
		if sqlca.sqlcode = -1 then
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la acometida del suministro.")
		end if
		
	end if	
	
end if


RETURN 1
	

end function

public function integer fnu_anular_ot_inst (decimal pdec_nro_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_anular_ot_inst
// 
// Objetivo: Se resetea el nro. de OT de la instalaci$$HEX1$$f300$$ENDHEX$$n .
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//       Entrada: pdec_nro_instalacion (instalaci$$HEX1$$f300$$ENDHEX$$n afectada)
//			Salida:	--		
//				
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	22/2/96		JH  			Versi$$HEX1$$f300$$ENDHEX$$n Original
//	24/04/96		HMA  			Modificaci$$HEX1$$f300$$ENDHEX$$n
// 12/02/14    DSU 			Modificaci$$HEX1$$f300$$ENDHEX$$n
// 12/02/14    HLA 			Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_avi_pend, li_cant=0, li_retorno, li_cant_aviso
datetime ldt_fecha_actual
/*INI.FFB. DDAG-5358 28/07/16 */
datetime ldt_fecha_hasta_ot
/*FIN.FFB. DDAG-5358 28/07/16 */

SetPointer(HourGlass!)

ldt_fecha_actual = fgnu_fecha_actual()

/// TDA
/// Se revisa si ya se est$$HEX2$$e1002000$$ENDHEX$$trabajando en una OT para la instalaci$$HEX1$$f300$$ENDHEX$$n
/// afecatada y no se inici$$HEX2$$f3002000$$ENDHEX$$una incidencia.

SELECT COUNT(*)
INTO :li_cant
FROM "GI_OT"
WHERE "NRO_INSTALACION" = :pdec_nro_instalacion AND
		"NRO_INCIDENCIA" = 0 AND
		"EST_OT" = :fgci_ot_trabajando;

IF li_cant = 0 AND Sqlca.sqlcode = 0 THEN
	UPDATE "GI_AVISOS_INSTALACION" 
	SET "NRO_OT" = 0,
		 "F_ACTUAL" = :ldt_fecha_actual,
		 "USUARIO" = :gs_usuario,
		 "PROGRAMA" = 'AN_OT_INST'
	WHERE "NRO_INSTALACION" = :pdec_nro_instalacion;
	
	li_retorno = 0
ELSE
	li_retorno = 1
END IF

IF gnv_msg.f_error(8) = 1 THEN

//  UPDATE "AVISOS"  
//  SET "F_ACTUAL"  = :ldt_fecha,
//		"USUARIO"   = :gs_usuario,
//		"PROGRAMA"  = 'w_1105_avi',
//		"EST_AVISO" = :li_avi_pend 
//  WHERE "AVISOS"."NRO_AVISO" in (SELECT nro_aviso 
//                                 FROM "AVISO_INS"  
//                                 WHERE "AVISO_INS"."NRO_INSTALACION" = :pdec_nro_instalacion);
//
//	IF gnv_msg.f_error(5) = 1  THEN
		//COMMIT USING sqlca;
		
	/*SFP INI DEO13-00000855 DSU 14/02/2014 */
	/*INI.FFB. DDAG-5358 28/07/16  */
	/// comentamos el siguinte bloque
	//		 UPDATE "GI_AVISOS"
	//         SET      "EST_AVISO" = 5
	//       WHERE  "GI_AVISOS"."NRO_AVISO" IN
	//                                      (SELECT "GI_AVISOS_INSTALACION"."NRO_AVISO"
	//									              FROM "GI_AVISOS_INSTALACION"
	//                                        WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" =:pdec_nro_instalacion);
					
	/// Se obtiene la fecha de Resolucion de la OT
	SELECT "F_HASTA"
	INTO :ldt_fecha_hasta_ot
	FROM "GI_OT"
	WHERE "NRO_OT" = :gl_nro_ot;
	
	/// Se agrega la fecha de resoluci$$HEX1$$f300$$ENDHEX$$n y el numero de OT al finalizar los avisos		
	UPDATE "GI_AVISOS"
   SET "EST_AVISO" = :fgci_aviso_resuelto, 
		"NRO_OT" = :gl_nro_ot,
		"F_ACTUAL" = :ldt_fecha_actual,
		"FECHA_RES" = :ldt_fecha_hasta_ot,
		"USUARIO" = :gs_usuario,
		"PROGRAMA" = 'w_sgi_ot'
   WHERE "NRO_AVISO" IN(
		SELECT "NRO_AVISO"
		FROM "GI_AVISOS_INSTALACION"
      WHERE "NRO_INSTALACION" = :pdec_nro_instalacion
	);
	
	/*FIN.FFB. DDAG-5358 28/07/16 */
	
	/* INI.TDA. 02/09/17 */
	/* Se mejor$$HEX2$$f3002000$$ENDHEX$$este paso como parte de mejora del rendimiento,
		ya que se ejecutar$$HEX1$$e100$$ENDHEX$$n en el servidor menos consulta. */
	
	////BUSCA SI EXISTEN AVISOS EN BAJA TENSION
	//SELECT COUNT (*)
	//INTO :li_cant_aviso
   //FROM "GI_AVISOS", "GI_AVISOS_INSTALACION", "SGD_ACOMETIDA"
	//WHERE "GI_AVISOS"."NRO_AVISO" = "GI_AVISOS_INSTALACION"."NRO_AVISO"
   //	AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = "SGD_ACOMETIDA"."INSTALACION_ORIGEN"
	//	AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalacion;
				
	//IF (li_cant_aviso >0)	THEN
	//	DELETE "GI_AVISOS_INSTALACION"
 	//	WHERE "NRO_AVISO" IN (
	//		SELECT "GI_AVISOS_INSTALACION"."NRO_AVISO"
   //      FROM "GI_AVISOS", "GI_AVISOS_INSTALACION", "SGD_ACOMETIDA"
	//		WHERE "GI_AVISOS"."NRO_AVISO" = "GI_AVISOS_INSTALACION"."NRO_AVISO"
	//			AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = "SGD_ACOMETIDA"."INSTALACION_ORIGEN"
   //         AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalacion
	//		);
	//END IF
				
	////BUSCA SI EXISTEN AVISOS EN MEDIA TENSION
	//SELECT  COUNT (*)
	//INTO :li_cant_aviso
   //FROM "GI_AVISOS", "GI_AVISOS_INSTALACION"
	//WHERE "GI_AVISOS"."NRO_AVISO" = "GI_AVISOS_INSTALACION"."NRO_AVISO"
   //	AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalacion;
	//			
	//IF (li_cant_aviso >0)	THEN
	//	DELETE "GI_AVISOS_INSTALACION"
 	//	WHERE "NRO_AVISO" IN (
	//		SELECT "GI_AVISOS_INSTALACION"."NRO_AVISO"
   //   	FROM "GI_AVISOS", "GI_AVISOS_INSTALACION"
	//		WHERE "GI_AVISOS"."NRO_AVISO" = "GI_AVISOS_INSTALACION"."NRO_AVISO"
	//			AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalacion);
	//END IF
	
	// ELIMINA LOS AVISOS EN BAJA TENSION Y MEDIA TENSION
	DELETE "GI_AVISOS_INSTALACION"
 	WHERE "NRO_AVISO" IN (
		SELECT "GI_AVISOS_INSTALACION"."NRO_AVISO"
   	FROM "GI_AVISOS", "GI_AVISOS_INSTALACION"
		WHERE "GI_AVISOS"."NRO_AVISO" = "GI_AVISOS_INSTALACION"."NRO_AVISO"
			AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalacion
		);
	/* FIN.TDA. 02/09/17 */
	
	/*SFP-FIN DSU DEO13-00000855.*/
	gnu_u_transaction.uf_commit()
	//	END IF 
END IF

RETURN li_retorno

end function

on u_avi_1002_nu_generico.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_avi_1002_nu_generico.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


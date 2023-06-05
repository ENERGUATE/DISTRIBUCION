HA$PBExportHeader$u_bdg_lista_alarmas.sru
$PBExportComments$Objeto de usuario que contiene a la dw que muestra las alarmas
forward
global type u_bdg_lista_alarmas from datawindow
end type
end forward

global type u_bdg_lista_alarmas from datawindow
int Width=494
int Height=360
int TabOrder=10
string DataObject="d_bdg_alarmas"
boolean Border=false
boolean LiveScroll=true
end type
global u_bdg_lista_alarmas u_bdg_lista_alarmas

forward prototypes
public subroutine of_obtener_datos ()
public function integer of_obtener_incidencias_por_estado (integer pi_estado)
public function integer of_obtener_descargos_por_estado (integer pi_estado)
public function integer of_obtener_avisos_por_estado (integer pi_estado_aviso)
end prototypes

public subroutine of_obtener_datos ();////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_obtener_datos
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que carga el contenido de la datawindow de alarmas
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	--
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int li_num_alarma, li_estado, li_maximo, li_valor, li_intermedio
string ls_tipo_alarma

// Se obtienen los l$$HEX1$$ed00$$ENDHEX$$mites para cada alarma de la tabla GI_BDG_MALARMAS
This.Retrieve()

// Se obtiene de forma online los valores para cada alarma
FOR li_num_alarma=1 TO This.RowCount()
	ls_tipo_alarma = This.GetItemString(li_num_alarma, 'tipo_valor')
	li_estado = This.GetItemNumber(li_num_alarma, 'estado')
	li_maximo = This.GetItemNumber(li_num_alarma, 'maximo')
	li_intermedio = This.GetItemNumber(li_num_alarma, 'intermedio')
	CHOOSE CASE ls_tipo_alarma
		CASE 'avisos' // alarma de avisoso
			li_valor = of_obtener_avisos_por_estado(li_estado)
		CASE 'incidencias' // alarma de incidencias
			li_valor = of_obtener_incidencias_por_estado(li_estado)
		CASE 'descargos' // alarma de descargos
			li_valor = of_obtener_descargos_por_estado(li_estado)
	END CHOOSE
	
	This.SetItem(li_num_alarma, 'valor', li_valor)
	// Se le asocia la bandera a cada alarma
	IF li_valor >= li_maximo THEN
		// El valor de la alarma est$$HEX2$$e1002000$$ENDHEX$$por encima del m$$HEX1$$e100$$ENDHEX$$ximo, se pone una bandera roja
		This.SetItem(li_num_alarma, 'bandera_alarma', 'limit2.bmp')
	ELSE
		IF li_valor >= li_intermedio THEN
			// El valor de la alarma est$$HEX2$$e1002000$$ENDHEX$$por debajo del m$$HEX1$$e100$$ENDHEX$$ximo y por encima del 
			// intermedio, por lo que se pone una bandera amarilla
			This.SetItem(li_num_alarma, 'bandera_alarma', 'limit1.bmp')
		ELSE
			// El valor est$$HEX2$$e1002000$$ENDHEX$$por debajo del valor intermedia, se pone una bandera verde
			This.SetItem(li_num_alarma, 'bandera_alarma', 'limit0.bmp')
		END IF
	END IF
NEXT
end subroutine

public function integer of_obtener_incidencias_por_estado (integer pi_estado);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_obtener_incidencias_por_estado
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve el n$$HEX1$$fa00$$ENDHEX$$mero de incidencias que hay en un estado determinado
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  pi_estado, que contiene el estado sobre el que se quiere obtener el 
//									n$$HEX1$$fa00$$ENDHEX$$mero de incidencias
//		Salida:   --
//						
// Devuelve:	el n$$HEX1$$fa00$$ENDHEX$$mero de avisos
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_num_incidencias

SELECT COUNT(*) 
INTO :li_num_incidencias
FROM SGD_INCIDENCIA
WHERE EST_ACTUAL = :pi_estado;

IF SQLCA.SQLCode = 0 THEN
	Return li_num_incidencias
ELSE 
	Return 0
END IF
end function

public function integer of_obtener_descargos_por_estado (integer pi_estado);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_obtener_descargos_por_estado
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve el n$$HEX1$$fa00$$ENDHEX$$mero de descargos que hay en un estado determinado
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  pi_estado, que contiene el estado sobre el que se quiere obtener el 
//									n$$HEX1$$fa00$$ENDHEX$$mero de descargos
//		Salida:   --
//						
// Devuelve:	el n$$HEX1$$fa00$$ENDHEX$$mero de avisos
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_num_descargos

SELECT COUNT(*)
INTO :li_num_descargos
FROM SGD_DESCARGOS
WHERE ESTADO = :pi_estado;

IF SQLCA.SQLCode = 0 THEN
	Return li_num_descargos
ELSE
	Return 0
END IF
end function

public function integer of_obtener_avisos_por_estado (integer pi_estado_aviso);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_obtener_avisos_por_estado
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve el n$$HEX1$$fa00$$ENDHEX$$mero de avisos que hay en un estado determinado
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  pi_estado_aviso, que contiene el estado sobre el que se quiere obtener el 
//											n$$HEX1$$fa00$$ENDHEX$$mero de avisos
//		Salida:   --
//						
// Devuelve:	el n$$HEX1$$fa00$$ENDHEX$$mero de avisos
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_num_avisos

SELECT COUNT(*) 
INTO :li_num_avisos
FROM GI_AVISOS
WHERE EST_AVISO = :pi_estado_aviso;	

IF SQLCA.SQLCode = 0 THEN
	Return li_num_avisos
ELSE
	Return 0
END IF
end function


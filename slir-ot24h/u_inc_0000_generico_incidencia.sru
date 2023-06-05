HA$PBExportHeader$u_inc_0000_generico_incidencia.sru
$PBExportComments$UserObject gen$$HEX1$$e900$$ENDHEX$$rico para incidencias.
forward
global type u_inc_0000_generico_incidencia from datawindow
end type
end forward

global type u_inc_0000_generico_incidencia from datawindow
int Width=2414
int Height=360
int TabOrder=1
boolean LiveScroll=true
event ue_shiftclicked pbm_custom70
event ue_ctrlclicked pbm_custom71
end type
global u_inc_0000_generico_incidencia u_inc_0000_generico_incidencia

type variables
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
datawindowchild ddw_nom_ins_afectada
datawindowchild ddw_nom_ins_origen
datawindowchild ddw_tip_ins_afectada
datawindowchild ddw_tip_ins_origen
datawindowchild ddw_tension
datawindowchild ddw_estado_actual
datawindowchild ddw_brigada
datawindowchild ddw_ot
datawindowchild ddw_causa
datawindowchild ddw_material_averiado
//
s_incidencia is_incidencia
//s_incid istr_incidencia
end variables

forward prototypes
public function integer f_insertar_fila ()
public function integer fnu_insertar_fila ()
public subroutine f_seleccionar (integer pi_cant_filas)
public subroutine f_tabla_error (integer pi_tabla)
public function integer fnu_cargar_estructura ()
end prototypes

event ue_shiftclicked;//////////////////////////////////////////////////////////////////////
//
//	Evento:		ShiftClicked
//
//	Objetivo:	Este evento es triggeado por el RowFocusChanged
//					(si la dw permite seleccionar m$$HEX1$$e100$$ENDHEX$$s de una fila)
//					cuando el Shift es pulsado al mismo tiempo que el click
//					del rat$$HEX1$$f300$$ENDHEX$$n
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

int oldrow, newrow, i

oldrow = ii_selected_row
newrow = this.GetRow()

IF oldrow = 0 THEN oldrow =  newrow 

IF oldrow > newrow THEN
	FOR i = oldrow to newrow STEP -1
		this.SelectRow(i,true)
	NEXT
ELSE
	FOR i = oldrow to newrow
		this.SelectRow(i,true)
	NEXT
END IF


this.SetRow(newrow)
this.SetColumn(1)

end event

event ue_ctrlclicked;/////////////////////////////////////////////////////////////////////////
//
//	Evento:		CtrlClicked
//
//	Objetivo:	Este evento es triggeado por el RowFocusChanged
//					(si la dw permite seleccionar m$$HEX1$$e100$$ENDHEX$$s de una fila)
//					cuando el Ctrl es pulsado al mismo tiempo que el click
//					del rat$$HEX1$$f300$$ENDHEX$$n
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
/////////////////////////////////////////////////////////////////////////

int newrow

newrow=this.GetRow()

IF this.IsSelected(newrow) THEN
	this.SelectRow(newrow,False)
ELSE
	this.SelectRow(newrow,True)
END IF 

this.SetRow(newrow)
this.SetColumn(1)


end event

public function integer f_insertar_fila ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_insertar_fila
// 
// Objetivo: Inserta una fila en blanco en la dw
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//					
//
////////////////////////////////////////////////////////////////////////////////////////////////


RETURN this.InsertRow(0)
end function

public function integer fnu_insertar_fila ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_insertar_fila
// 
// Objetivo: Inserta una fila en blanco en la dw
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	
//
////////////////////////////////////////////////////////////////////////////////////////////////


RETURN This.InsertRow(0)
end function

public subroutine f_seleccionar (integer pi_cant_filas);//////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_seleccionar
//
//	Objetivo:	Indica la cantidad de filas que va a estar permitido
//					seleccionar.
//					Setea el valor de la variable ii_filas_selec donde se 
//					indica este hecho. 
//						0: no se seleccionar$$HEX1$$e100$$ENDHEX$$
//						1: una sola fila
//						2: una o m$$HEX1$$e100$$ENDHEX$$s filas
//					Por defecto, no permite seleccionar filas
//
//	Ambito:		P$$HEX1$$fa00$$ENDHEX$$blica
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pi_cant_filas
//					Salida:
//							
//	Devuelve:	Nada
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

integer	i_lim_sup = 2
integer	i_lim_inf = 0

IF IsNull(pi_cant_filas) OR (pi_cant_filas < i_lim_inf) OR &
			(pi_cant_filas > i_lim_sup) THEN
	ii_filas_selec = 0
ELSE
	ii_filas_selec = pi_cant_filas
END IF

RETURN

end subroutine

public subroutine f_tabla_error (integer pi_tabla);//////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_tabla_error
//
//	Objetivo:	Indica el n$$HEX1$$fa00$$ENDHEX$$mero de tabla de la que se deber$$HEX2$$e1002000$$ENDHEX$$desplegar su 
//					nombre en caso de producirse un error al grabar.
//
//	Ambito:		P$$HEX1$$fa00$$ENDHEX$$blica
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	ps_tabla
//					Salida:
//							
//	Devuelve:	Nada
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////


ii_tabla = pi_tabla

RETURN

end subroutine

public function integer fnu_cargar_estructura ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_cargar_estructura 
//
// Objetivo: Carga datos de la tabla incidencia.
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

// 	  SELECT "INCIDENCIA"."NRO_INCIDENCIA",   
//         "INCIDENCIA"."USUARIO",   
//         "INCIDENCIA"."F_ACTUAL",   
//         "INCIDENCIA"."H_ACTUAL",   
//         "INCIDENCIA"."PROGRAMA",   
//         "INCIDENCIA"."PRIMER_AVISO",   
//         "INCIDENCIA"."DESC_INCIDENCIA",   
//         "INCIDENCIA"."EST_ACTUAL",   
//         "INCIDENCIA"."F_DETECCION",   
//         "INCIDENCIA"."H_DETECCION",   
//         "INCIDENCIA"."F_EST_RES",   
//         "INCIDENCIA"."H_EST_RES",   
//         "INCIDENCIA"."TIP_TENSION",   
//         "INCIDENCIA"."TIP_INCIDENCIA",   
//         "INCIDENCIA"."COD_CAUSA",   
//         "INCIDENCIA"."F_ALTA",   
//         "INCIDENCIA"."H_ALTA",   
//         "INCIDENCIA"."NRO_CENTRO",   
//         "INCIDENCIA"."NRO_CMD",   
//         "INCIDENCIA"."NRO_MESA",   
//         "INCIDENCIA"."NRO_INST_AFECTADA",   
//         "INCIDENCIA"."NRO_INST_ORIGEN",   
//         "INCIDENCIA"."POT_AFECTADA",   
//         "INCIDENCIA"."POT_CONTRATADA",   
//         "INCIDENCIA"."NRO_BRIGADA",   
//         "INCIDENCIA"."NRO_BRIG_MANT",   
//         "INCIDENCIA"."IND_SUMINISTRO",   
//         "INCIDENCIA"."OBSERVACION",   
//         "INCIDENCIA"."OT",   
//         "INCIDENCIA"."COD_EST_CLIMA",   
//         "INCIDENCIA"."ESTADO_MANTENIMIENTO",   
//         "INCIDENCIA"."CENTRO_ALTA",   
//         "INCIDENCIA"."CMD_ALTA",   
//         "INCIDENCIA"."PUESTO_ALTA",   
//         "INCIDENCIA"."CANT_AVISOS",   
//         "INCIDENCIA"."CAN_CLI",   
//         "INCIDENCIA"."RESUELVE_MANT",   
//         "INCIDENCIA"."CCLI_AFEC",   
//         "INCIDENCIA"."MAT_AVERIADO"  
//    INTO :istr_incidencia.gstr_nro_incidencia,   
//         :istr_incidencia.gstr_usurio,   
//         :istr_incidencia.gstr_f_actual,   
//         :istr_incidencia.gstr_h_actual,   
//         :istr_incidencia.gstr_programa,   
//         :istr_incidencia.gstr_primer_aviso,   
//         :istr_incidencia.gstr_des_incidencia,   
//         :istr_incidencia.gstr_est_actual,   
//         :istr_incidencia.gstr_f_deteccion,   
//         :istr_incidencia.gstr_h_deteccion,   
//         :istr_incidencia.gstr_f_est_res,   
//         :istr_incidencia.gstr_h_est_res,   
//         :istr_incidencia.gstr_tip_tension,   
//         :istr_incidencia.gstr_tip_incidencia,   
//         :istr_incidencia.gstr_cod_causa,   
//         :istr_incidencia.gstr_f_alta,   
//         :istr_incidencia.gstr_h_alta,   
//         :istr_incidencia.gstr_nro_centro,   
//         :istr_incidencia.gstr_nro_cmd,   
//         :ist_incidencia.gstr_nro_mesa,   
//         :istr_incidencia.gstr_nro_inst_afectada,   
//         :istr_incidencia.gstr_nro_inst_origen,   
//         :istr_incidencia.gstr_pot_afectada,   
//         :istr_incidencia.gstr_pot_contratada,   
//         :istr_incidencia.gstr_nro_brigada,   
//         :istr_incidencia.gstr_nro_brigada_mant,   
//         :istr_incidencia.gstr_ind_suministro,   
//         :istr_incidencia.gstr_observacion,   
//         :istr_incidencia.gstr_ot,   
//         :istr_incidencia.gstr_cod_est_clima,   
//         :istr_incidencia.gstr_estado_mantenimiento,   
//         :istr_incidencia.gstr_centro_alta,   
//         :istr_incidencia.gstr_cmd_alta,   
//         :istr_incidencia.gstr_puesto_alta,   
//         :istr_incidencia.gstr_can_avisos,   
//         :istr_incidencia.gstr_can_cli,   
//         :istr_incidencia.gstr_resuelve_mant,   
//         :istr_incidencia.gstr_ccli_afec,   
//         :istr_incidencia.gstr_mat_averiado  
//    FROM "INCIDENCIA"  
//   WHERE "INCIDENCIA"."NRO_INCIDENCIA" = :pi_incidencia   ;
//
//
//	 gstr_nro_incidencia
//    gstr_usurio
//    gstr_programa
//    gstr_f_actual
//    gstr_primer_aviso
//    gstr_des_incidencia
//    gstr_est_actual
//    gstr_f_deteccion
//    gstr_h_deteccion
//    gstr_f_est_res
//    gstr_h_est_res
//    gstr_tip_tension
//    gstr_tip_incidencia
//    gstr_cod_causa
//    gstr_f_alta
//     gstr_h_alta
//     gstr_nro_centro
//    gstr_nro_cmd
//    gstr_mesa
//     gstr_nro_inst_afectada
//    gstr_nro_inst_origen
//   gstr_pot_afectada
//    gstr_pot_contratada
//     gstr_ccli_afec
//     gstr_mat_averiado
//     gstr_nro_brigada
//    gstr_nro_brigada_mant
//    integer gstr_ind_suministro
//    string gstr_observacion
//    long gstr_ot
//    integer gstr_cod_est_clima
//    integer gstr_estado_mantenimiento
//    long gstr_centro_alta
//    long gstr_cmd_alta
//    long gstr_ouesto_alta
//    long gstr_can_avisos
//    long gstr_can_cli
//    integer gstr_resuelve_mant


return 1
end function

event clicked;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Clicked
//
//	Objetivo:	Selecciona la fila clickeada 
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////





IF row > 0 THEN
	CHOOSE CASE ii_filas_selec
		CASE 1
			This.SelectRow(0, FALSE)
			This.SelectRow(Row, TRUE)
		CASE 2
			IF keydown(keycontrol!) THEN      //Check if control key is pressed
				This.TriggerEvent ("ue_ctrlclicked")
			ELSEIF keydown(keyshift!) THEN	         
				this.selectrow(0,false)			
				This.TriggerEvent ("ue_shiftclicked")
			ELSE
				This.SelectRow(0, FALSE)
				This.SelectRow(row,TRUE)
			END IF
	END CHOOSE
END IF

ii_Selected_row = row

	


end event

on rowfocuschanged;////////////////////////////////////////////////////////////////////////
////
////	Evento:		RowFocusChanged
////
////	Objetivo:	Selecciona la fila que tiene el foco
////
////	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
////
////				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
////				-------------			--------			-----------
////				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
////
////////////////////////////////////////////////////////////////////////
//
//ii_selected_row = This.GetRow()
//
//IF ii_Selected_row > 0 THEN
//	CHOOSE CASE ii_filas_selec
//		CASE 1
//	 		This.SelectRow(0, FALSE)
//	 		This.SelectRow(This.GetRow(), TRUE)
//		CASE 2
//			IF keydown(keycontrol!) THEN      //Check if control key is pressed
//				This.TriggerEvent ("ue_ctrlclicked")
//			ELSEIF keydown(keyshift!) THEN	         
//				this.selectrow(0,false)			
//				This.TriggerEvent ("ue_shiftclicked")
//			ELSE
//				This.SelectRow(0, FALSE)
//				This.SelectRow(This.GetRow(), TRUE)
//			END IF
//	END CHOOSE
//END IF
//
//
//
//		
//
//
end on

on itemerror;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Itemerror
//
//	Objetivo:	Si el dato ingresado no es correcto, despliega un mensaje
//					indic$$HEX1$$e100$$ENDHEX$$ndolo, y deja en el campo modioficado el valor 
//					anterior
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					27/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

string	ls_texto, ls_columna, ls_modstring, a

ls_texto = This.GetText()
ls_columna = This.GetColumnName()

This.Describe(This.GetColumnName()+".ValidationMsg")

ls_modstring = ls_columna + ".ValidationMsg='El item " + ls_texto &
					+ " no ha pasado las validaciones'"
a = This.Modify(ls_modstring)


end on

event dberror;//////////////////////////////////////////////////////////////////////
//
//	Evento:		DBerror
//
//	Objetivo:	Si hubo error al grabar la datawindow, se despliega un 
//					mensaje al usuario indicando en que tabla fue.
//					La tabla se setea a trav$$HEX1$$e900$$ENDHEX$$s de la funci$$HEX1$$f300$$ENDHEX$$n f_tabla_error(nro)
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

SQLCA.SQLCode = -1 
SQLCA.SQLDbCode = sqldbcode
SQLCA.SQLErrText = sqlerrtext
//gnv_msg.f_error(ii_tabla)

RETURN 1
end event

on constructor;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Constructor
//
//	Objetivo:	Si se permite posocionar en una fila para modificaci$$HEX1$$f300$$ENDHEX$$n,
//					se indica con la mano a la izquierda de la dw
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////





end on


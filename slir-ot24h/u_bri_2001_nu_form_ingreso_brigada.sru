HA$PBExportHeader$u_bri_2001_nu_form_ingreso_brigada.sru
forward
global type u_bri_2001_nu_form_ingreso_brigada from nonvisualobject
end type
end forward

global type u_bri_2001_nu_form_ingreso_brigada from nonvisualobject
end type
global u_bri_2001_nu_form_ingreso_brigada u_bri_2001_nu_form_ingreso_brigada

type variables
s_brigada is_brigada
s_brigada_trab is_brigada_trab
s_brigada_ot is_brigada_ot
           
// Nro. de la Fila seleccionada
integer ii_selected_row
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
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
// constantes
//int fgci_sin_seleccionar
//int fgci_disponible
//int fgci_en_turno
end variables

forward prototypes
public function integer fnu_grabar_estado_brigada ()
public function integer fnu_obtener_nro_brigada (ref datawindow pw_dw)
public function integer fnu_grabar_brigada_trab ()
public function integer fnu_cargar_brigada_trab (ref datawindow pw_dw, integer pi_nro_brigada)
public function integer fnu_cargar_estado_brigada (ref datawindow pw_dw, integer pi_estado)
public function integer fnu_cargar_brigada_ot (ref datawindow pw_dw, integer pi_nro_brigada)
public function integer fnu_grabar_brigada_ot ()
public function integer fnu_crea_dddw (ref datawindow pd_dw)
public function integer fnu_obtener_brigadas (ref datawindow pd_dw)
public function integer fnu_mostrar_brigada (ref datawindow pd_dw, integer pi_nro_brigada)
public function integer fnu_retorna_disponible (ref datawindow pd_dw)
end prototypes

public function integer fnu_grabar_estado_brigada ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_grabar_estado_brigada
// 
// Objetivo: Actualiza la tabla de brigada con el indicativo de brigada 
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: d_inc_2001_pr_form_orden de trabajo y nro de brigada
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


UPDATE brigada SET ind_disponible = :is_brigada.gstr_ind_disponible 
		WHERE nro_brigada = :is_brigada.gstr_nro_brigada ;

IF gnv_msg.f_error(11)= -1 THEN
		HALT
	END IF
Return 1
end function

public function integer fnu_obtener_nro_brigada (ref datawindow pw_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_nro_brigada
// 
// Objetivo: Obtiene el nro de la brigada 
//           
// Ambito:	p$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window de brigada
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


Return pw_dw.GetItemNumber(1,"nro_brigada")
end function

public function integer fnu_grabar_brigada_trab ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_grabar_brigada_trab
// 
// Objetivo: Actualiza la tabla de brigada_trab  
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

INSERT INTO brigada_trab (usuario, 
								  f_actual, 
									programa,
									f_alta,
									h_alta,
								  	nro_brigada,	
									nro_ot)
		VALUES(:is_brigada_trab.gstr_usuario,
				 :is_brigada_trab.gstr_f_actual,
				 :is_brigada_trab.gstr_programa,
				 :is_brigada_trab.gstr_f_alta,
				 :is_brigada_trab.gstr_h_alta,	
				 :is_brigada_trab.gstr_nro_brigada,
				 :is_brigada_trab.gstr_nro_ot);
	

Return 1
end function

public function integer fnu_cargar_brigada_trab (ref datawindow pw_dw, integer pi_nro_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_brigada_trab
// 
// Objetivo: Carga en la estructura los datos relacionados a el trabajo 
//           de la ventana en brigada_trab
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: data window de brigada
//				nro_brigada
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int li_nro_brigada

	is_brigada_trab.gstr_nro_brigada = pi_nro_brigada 
	is_brigada_trab.gstr_nro_ot =pw_dw.GetItemNumber(1,"nro_ot")  
	is_brigada_trab.gstr_usuario =" " 
	is_brigada_trab.gstr_f_actual = fgnu_fecha_actual() 
	//is_brigada_trab.gstr_h_actual = Today()					
	is_brigada_trab.gstr_programa = "u_bri_2001_nu"
	is_brigada_trab.gstr_f_alta = pw_dw.GetItemDateTime(1,"f_desde")
	is_brigada_trab.gstr_h_alta = pw_dw.GetItemDateTime(1,"h_desde")

Return 1
end function

public function integer fnu_cargar_estado_brigada (ref datawindow pw_dw, integer pi_estado);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_mostrar_datos
// 
// Objetivo: Carga en la estructura el nro de la brigada 
//           y el indicativo de disponible
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window de brigada
//					estado  (1=disponible y 0= No disponible)
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_nro_brigada

	li_nro_brigada = pw_dw.GetItemNumber(1,"nro_brigada")
	is_brigada.gstr_nro_brigada = li_nro_brigada 
	is_brigada.gstr_ind_disponible = pi_estado
					//brigada en estado = 0 no disponible
					//brigada en estado = 1 disponible

Return 1
end function

public function integer fnu_cargar_brigada_ot (ref datawindow pw_dw, integer pi_nro_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_brigada_ot
// 
// Objetivo: Carga en la estructura los datos relacionados con la orden de trabajo.
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window ,pi_nro_brigada
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

	is_brigada_ot.gstr_usuario=gs_usuario
	is_brigada_ot.gstr_f_actual=fgnu_fecha_actual()
	is_brigada_trab.gstr_h_actual = fgnu_fecha_actual() 
	is_brigada_ot.gstr_programa="u_bri_2001_nu"
	is_brigada_ot.gstr_f_desde=pw_dw.GetItemDateTime(1,"f_desde")
	is_brigada_ot.gstr_h_desde=pw_dw.GetItemDateTime(1,"h_desde")
	is_brigada_ot.gstr_f_hasta=DATETIME(DATE("131/12/2999"),TIME("00:00")) 
	is_brigada_ot.gstr_h_hasta=DATETIME(DATE("131/12/2999"),TIME("00:00"))
	is_brigada_ot.gstr_nro_brigada=pi_nro_brigada
	is_brigada_ot.gstr_nro_ot=pw_dw.GetItemNumber(1,"nro_ot")  
		
Return 1
end function

public function integer fnu_grabar_brigada_ot ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_grabar_brigada_ot
// 
// Objetivo: Actualiza la tabla de brigada_ot  
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_usuario
int li_existe

//SELECT usuario INTO :ls_usuario FROM brigada_ot WHERE (nro_ot=:is_brigada_ot.gstr_nro_ot) AND (nro_brigada=:is_brigada_ot.gstr_nro_brigada);
//IF SQLCA.SQLCODE=100 THEN
//	INSERT INTO brigada_ot (usuario, 
//								  f_actual, 
//								  h_actual,	
//								  programa,
//								  f_desde,
//								  h_desde,
//								  nro_brigada,	
//								  nro_ot)
//		VALUES(:is_brigada_ot.gstr_usuario,
//				 :is_brigada_ot.gstr_f_actual,
//				 :is_brigada_ot.gstr_h_actual,
//				 :is_brigada_ot.gstr_programa,
//				 :is_brigada_ot.gstr_f_desde,
//				 :is_brigada_ot.gstr_h_desde,
//				 :is_brigada_ot.gstr_nro_brigada,
//				 :is_brigada_ot.gstr_nro_ot);
//	
//ELSE
//	IF ( SQLCA.SQLCODE = 0 ) THEN
//	  UPDATE "BRIGADA_OT"  
//     		SET "USUARIO" = :is_brigada_ot.gstr_usuario,   
//         	"F_ACTUAL" = :is_brigada_ot.gstr_f_actual,   
//         	"H_ACTUAL" = :is_brigada_ot.gstr_h_actual,   
//         	"PROGRAMA" = :is_brigada_ot.gstr_programa,   
//         	"F_DESDE" = :is_brigada_ot.gstr_f_desde,   
//         	"H_DESDE" = :is_brigada_ot.gstr_h_desde,   
//         	"F_HASTA" = :is_brigada_ot.gstr_f_hasta,   
//         	"H_HASTA" = :is_brigada_ot.gstr_h_hasta  
//   		WHERE ( "BRIGADA_OT"."NRO_OT" = :is_brigada_ot.gstr_nro_ot ) AND  
//         		( "BRIGADA_OT"."NRO_BRIGADA" = :is_brigada_ot.gstr_nro_brigada )   ;
//
//
//	ELSE
//			MESSAGEBOX("Error al grabar",21312)
//	END IF
//END IF

Return 1
	




end function

public function integer fnu_crea_dddw (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crea_dddw
// 
// Objetivo: Crea la drop down data window de brigada
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: d_inc_2001_pr_form_orden de trabajo y nro de brigada
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pd_dw.GetChild('nro_brigada',ddw_brigada)	 //creo dropdown de nombre_bri
ddw_brigada.SetTransObject(SQLCA)
ddw_brigada.Retrieve()

Return 1
end function

public function integer fnu_obtener_brigadas (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_brigada
// 
// Objetivo: Obtiene todas las brigadas para filtrarlas despues 
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window de brigada
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

	pd_dw.SetTransObject(SQLCA)
	pd_dw.Retrieve()

Return 1
end function

public function integer fnu_mostrar_brigada (ref datawindow pd_dw, integer pi_nro_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_mostrar_brigada
// 
// Objetivo: Filtra Brigadas disponibles
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window 
//				nro de brigada
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

	pd_dw.SetFilter("")
	pd_dw.Filter()
	
	pd_dw.SetFilter("nro_brigada = "+string(pi_nro_brigada))
	pd_dw.Filter()

Return 1

end function

public function integer fnu_retorna_disponible (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//

// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_retorna_disponible
// 
// Objetivo: Retorna si se selecciona las brigadas disponibles o no
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window 				
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

return pd_dw. GetItemNumber(1,"Ind_disponible")
end function

on constructor;//fnu_def_constantes()
end on

on u_bri_2001_nu_form_ingreso_brigada.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2001_nu_form_ingreso_brigada.destroy
TriggerEvent( this, "destructor" )
end on


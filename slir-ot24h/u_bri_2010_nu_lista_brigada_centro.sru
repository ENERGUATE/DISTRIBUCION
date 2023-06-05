HA$PBExportHeader$u_bri_2010_nu_lista_brigada_centro.sru
forward
global type u_bri_2010_nu_lista_brigada_centro from nonvisualobject
end type
end forward

global type u_bri_2010_nu_lista_brigada_centro from nonvisualobject
end type
global u_bri_2010_nu_lista_brigada_centro u_bri_2010_nu_lista_brigada_centro

type variables

end variables

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public function integer fnu_crea_dddw (ref datawindow dw)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw);pd_dw.settransobject(sqlca)
//pd_dw.retrieve(pi_centro,pi_cmd,pi_puesto,pi_turno,pi_disponible)
pd_dw.retrieve()
return 1
end function

public function integer fnu_crea_dddw (ref datawindow dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crea_dddw
// 
// Objetivo: Crea las drop down datawindows internas del user object.
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
//	21/1/96		MLP			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
datawindowchild ddw_int_horario, ddw_tipo_brigada

dw.GetChild('pi_en_turno', ddw_int_horario)
ddw_int_horario.SetTransObject(sqlca)
ddw_int_horario.Retrieve()

dw.GetChild('pi_tipo_brig', ddw_tipo_brigada)
ddw_tipo_brigada.SetTransObject(sqlca)
ddw_tipo_brigada.Retrieve()

return 1
end function

on u_bri_2010_nu_lista_brigada_centro.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2010_nu_lista_brigada_centro.destroy
TriggerEvent( this, "destructor" )
end on


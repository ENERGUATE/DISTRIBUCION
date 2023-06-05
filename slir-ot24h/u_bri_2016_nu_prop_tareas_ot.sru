HA$PBExportHeader$u_bri_2016_nu_prop_tareas_ot.sru
forward
global type u_bri_2016_nu_prop_tareas_ot from nonvisualobject
end type
end forward

global type u_bri_2016_nu_prop_tareas_ot from nonvisualobject
end type
global u_bri_2016_nu_prop_tareas_ot u_bri_2016_nu_prop_tareas_ot

type variables


string is_prioridad
string is_estado
string is_tareas
string is_linea
end variables

forward prototypes
public function integer fnu_cargar_estructura (ref datawindow pd_dw, integer pi_tareas, integer pi_estado, integer pi_prioridad)
public function integer fnu_crea_dddw (ref datawindow dw)
end prototypes

public function integer fnu_cargar_estructura (ref datawindow pd_dw, integer pi_tareas, integer pi_estado, integer pi_prioridad);pd_dw.setitem(1,"pi_tareas",pi_tareas)
pd_dw.setitem(1,"pi_estado",pi_estado)
pd_dw.setitem(1,"pi_prioridad",pi_prioridad)
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
datawindowchild ddw_estado_ot

dw.GetChild('pi_estado', ddw_estado_ot)
ddw_estado_ot.SetTransObject(sqlca)
ddw_estado_ot.Retrieve()

return 1
end function

on u_bri_2016_nu_prop_tareas_ot.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2016_nu_prop_tareas_ot.destroy
TriggerEvent( this, "destructor" )
end on


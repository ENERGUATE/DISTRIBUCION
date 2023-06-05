HA$PBExportHeader$u_bri_2003_nu_list_brigadistas_ot.sru
forward
global type u_bri_2003_nu_list_brigadistas_ot from nonvisualobject
end type
end forward

global type u_bri_2003_nu_list_brigadistas_ot from nonvisualobject
end type
global u_bri_2003_nu_list_brigadistas_ot u_bri_2003_nu_list_brigadistas_ot

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_ot, long pl_nro_brigada)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_ot, long pl_nro_brigada);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtener_datos
//
// Objetivo: Hace el retrieve de la datawindow para obtener n$$HEX1$$fa00$$ENDHEX$$mero de ot y n$$HEX1$$fa00$$ENDHEX$$mero de brigada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pl_nro_ot, pi_nro_brigada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.SetTransObject(SQLCA)
pd_dw.Retrieve(pl_nro_ot,pl_nro_brigada)


Return 1
end function

on u_bri_2003_nu_list_brigadistas_ot.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2003_nu_list_brigadistas_ot.destroy
TriggerEvent( this, "destructor" )
end on


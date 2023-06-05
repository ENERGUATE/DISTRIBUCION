HA$PBExportHeader$u_eop_2002_nu_estados_operaciones.sru
forward
global type u_eop_2002_nu_estados_operaciones from nonvisualobject
end type
end forward

global type u_eop_2002_nu_estados_operaciones from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw, integer pi_t_incidencia)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw, integer pi_t_incidencia);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtener_datos
//
// Objetivo: Retrieve de la datawindow
//	
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

long ll_row
pd_dw.SetTransObject(SQLCA)

if pi_t_incidencia<3 then
	ll_row=pd_dw.Retrieve('E_OP')
else
	ll_row=pd_dw.Retrieve('E_CA')
end if

Return 1
end function

on u_eop_2002_nu_estados_operaciones.create
TriggerEvent( this, "constructor" )
end on

on u_eop_2002_nu_estados_operaciones.destroy
TriggerEvent( this, "destructor" )
end on


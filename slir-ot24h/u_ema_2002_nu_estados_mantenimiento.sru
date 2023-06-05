HA$PBExportHeader$u_ema_2002_nu_estados_mantenimiento.sru
forward
global type u_ema_2002_nu_estados_mantenimiento from nonvisualobject
end type
end forward

global type u_ema_2002_nu_estados_mantenimiento from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer fnu_devolver_estado_mant (ref datawindow pd_dw)
public function integer fnu_obtener_datos (ref datawindow pd_dw, integer pi_resuelve_mant)
end prototypes

public function integer fnu_devolver_estado_mant (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_devolver_estado_mant
//
// Objetivo: Devuelve el estado de mantenimiento
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



long ll_contador
boolean lb_encontre


lb_encontre=FALSE
ll_contador=1
DO WHILE ll_contador<= pd_dw.RowCount() AND NOT lb_encontre
	IF ISNULL(pd_dw.GetItemDateTime(ll_contador,"f_alta"))   THEN
		lb_encontre=TRUE
		ll_contador=ll_contador - 2
	END IF		
	ll_contador++
LOOP

IF lb_encontre THEN
	return ll_contador
ELSE
	ll_contador --
	IF NOT ISNULL(pd_dw.GetItemDateTime(ll_contador,"f_alta")) THEN
		return ll_contador
	ELSE
		return 0
	END IF
END IF
end function

public function integer fnu_obtener_datos (ref datawindow pd_dw, integer pi_resuelve_mant);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtener_datos   
//
// Objetivo: Retrieve en la datawindow 
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_resuelve_mant
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
pd_dw.Retrieve()

	//Si resuelve mantenimiento elimino estado  PR
	//de lo contrario elimino RM
//IF pi_resuelve_mant=1 THEN
//	pd_dw.DeleteRow(fgci_incidencia_mant_para_resolucion)
//ELSE
//	pd_dw.DeleteRow(fgci_incidencia_mant_resuelta)	
//END IF

Return 1
end function

on u_ema_2002_nu_estados_mantenimiento.create
TriggerEvent( this, "constructor" )
end on

on u_ema_2002_nu_estados_mantenimiento.destroy
TriggerEvent( this, "destructor" )
end on


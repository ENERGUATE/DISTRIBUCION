HA$PBExportHeader$u_ema_2002_pr_lista_estado_mantenimiento.sru
forward
global type u_ema_2002_pr_lista_estado_mantenimiento from datawindow
end type
end forward

global type u_ema_2002_pr_lista_estado_mantenimiento from datawindow
int Width=270
int Height=709
string DataObject="d_ema_2002_lista_estados_mantenimiento"
end type
global u_ema_2002_pr_lista_estado_mantenimiento u_ema_2002_pr_lista_estado_mantenimiento

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public function integer f_insertar_fila ()
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_obtener_datos
//
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base y retrieve de la datawindow.
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

pd_dw.SetTransObject(SQLCA)
pd_dw.Retrieve()

Return 1
end function

public function integer f_insertar_fila ();return this.insertrow(0)
end function


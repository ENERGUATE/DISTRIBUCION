HA$PBExportHeader$u_inc_2015_nu_lista_acciones.sru
forward
global type u_inc_2015_nu_lista_acciones from nonvisualobject
end type
end forward

global type u_inc_2015_nu_lista_acciones from nonvisualobject
end type
global u_inc_2015_nu_lista_acciones u_inc_2015_nu_lista_acciones

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public function integer fnu_accion_para_agregar (ref datawindow pd_dw, long ll_row)
public function string fnu_descripcion_para_agregar (ref datawindow pd_dw, long pl_row)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtener_datos
//
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base y Retrieve de la datawindow
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

public function integer fnu_accion_para_agregar (ref datawindow pd_dw, long ll_row);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_accion_para_agregar
//
// Objetivo: Obtiene el c$$HEX1$$f300$$ENDHEX$$digo de acci$$HEX1$$f300$$ENDHEX$$n
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

Return pd_dw.GetItemNumber(ll_row,"cod_accion")

end function

public function string fnu_descripcion_para_agregar (ref datawindow pd_dw, long pl_row);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_descripci$$HEX1$$f300$$ENDHEX$$n_para_agregar
//
// Objetivo: Obtengo descripci$$HEX1$$f300$$ENDHEX$$n de la acci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

Return pd_dw.GetItemstring(pl_row,"accion") //descripcion de la accion
end function


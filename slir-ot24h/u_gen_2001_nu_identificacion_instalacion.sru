HA$PBExportHeader$u_gen_2001_nu_identificacion_instalacion.sru
forward
global type u_gen_2001_nu_identificacion_instalacion from nonvisualobject
end type
end forward

global type u_gen_2001_nu_identificacion_instalacion from nonvisualobject
end type
global u_gen_2001_nu_identificacion_instalacion u_gen_2001_nu_identificacion_instalacion

type variables
int  ii_fila
datawindowchild idwc_tipo_instalacion

// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
end variables

forward prototypes
public function integer fnu_obtener_instalacion (datawindow uo_pr)
public function integer f_nu_obtener_tipo_instalacion (datawindow dw)
public function integer fnu_leer_bd_instalacion (ref datawindow dw, integer tipo_instalacion, string nombre_instalacion)
public function integer fnu_crear_dddw (ref datawindow dw)
public function integer fnu_filtrar_dddw (ref datawindow pdw_sel_inst)
end prototypes

public function integer fnu_obtener_instalacion (datawindow uo_pr);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Objetivo: Obtiene el campos nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n .
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

return uo_pr.getitemnumber(1,"nom_instalacion")
end function

public function integer f_nu_obtener_tipo_instalacion (datawindow dw);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_nu_obtener_tipo_instalaci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Obtiene el campo tipo de Instalaci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

return dw.getitemnumber(1,"tipo_instalacion")
//return 1

end function

public function integer fnu_leer_bd_instalacion (ref datawindow dw, integer tipo_instalacion, string nombre_instalacion);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_leer_bd_instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Objetivo: Retrieve de la datawindow
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: dw, tipo_instalacion, nombre_instalacion
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

dw.retrieve(tipo_instalacion,nombre_instalacion)
Return 1

end function

public function integer fnu_crear_dddw (ref datawindow dw);
/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crear_dddw
// 
// Objetivo: Retrieve de la datawindow y conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos.
//            (referencia a datawindow hija)	
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

dw.GetChild('tipo_instalacion',idwc_tipo_instalacion)

idwc_tipo_instalacion.SetTransObject(sqlca)
idwc_tipo_instalacion.Retrieve()

return 1
end function

public function integer fnu_filtrar_dddw (ref datawindow pdw_sel_inst);pdw_sel_inst.SetFilter("tipo_instalacion <> 0")
pdw_sel_inst.Filter()

RETURN 1
end function


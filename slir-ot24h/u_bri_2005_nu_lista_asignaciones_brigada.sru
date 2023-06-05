HA$PBExportHeader$u_bri_2005_nu_lista_asignaciones_brigada.sru
forward
global type u_bri_2005_nu_lista_asignaciones_brigada from nonvisualobject
end type
end forward

global type u_bri_2005_nu_lista_asignaciones_brigada from nonvisualobject
end type
global u_bri_2005_nu_lista_asignaciones_brigada u_bri_2005_nu_lista_asignaciones_brigada

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos
//
// Objetivo: Obtiene datos de la datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//   		 Salida: --
// 
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////

return pd_dw.retrieve(gi_nro_centro,gi_nro_cmd,gi_nro_puesto)

end function


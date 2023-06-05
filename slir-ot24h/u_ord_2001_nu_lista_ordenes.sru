HA$PBExportHeader$u_ord_2001_nu_lista_ordenes.sru
forward
global type u_ord_2001_nu_lista_ordenes from nonvisualobject
end type
end forward

global type u_ord_2001_nu_lista_ordenes from nonvisualobject
end type
global u_ord_2001_nu_lista_ordenes u_ord_2001_nu_lista_ordenes

forward prototypes
public function long fnu_conectar (ref datawindow pdw_lista_ord, long pl_nis)
end prototypes

public function long fnu_conectar (ref datawindow pdw_lista_ord, long pl_nis);/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_conectar
// 
// Objetivo: Retrieve de la base de datos y conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pdw_lista_ord, pl_nis
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pdw_lista_ord.SetTransObject(sqlca)

RETURN pdw_lista_ord.Retrieve(pl_nis)


end function


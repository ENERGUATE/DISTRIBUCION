HA$PBExportHeader$u_eop_2002_pr_lista_estados_operaciones.sru
forward
global type u_eop_2002_pr_lista_estados_operaciones from datawindow
end type
end forward

global type u_eop_2002_pr_lista_estados_operaciones from datawindow
int Width=371
int Height=753
string DataObject="d_eop_2002_lista_estados_operaciones"
end type
global u_eop_2002_pr_lista_estados_operaciones u_eop_2002_pr_lista_estados_operaciones

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public function integer f_insertar_fila ()
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_obtener_datos
//
// Objetivo: Conecta a la base de datos y retrieve de la datawindow.
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


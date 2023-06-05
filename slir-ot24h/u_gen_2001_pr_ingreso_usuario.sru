HA$PBExportHeader$u_gen_2001_pr_ingreso_usuario.sru
forward
global type u_gen_2001_pr_ingreso_usuario from datawindow
end type
end forward

global type u_gen_2001_pr_ingreso_usuario from datawindow
int Width=1532
int Height=569
string DataObject="d_2001_pr_ingreso_usuario"
end type
global u_gen_2001_pr_ingreso_usuario u_gen_2001_pr_ingreso_usuario

forward prototypes
public function integer fnu_insertar_fila ()
end prototypes

public function integer fnu_insertar_fila ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_insertar_fila 
//
// Objetivo: Insertrow en la data window actual.
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

return this.insertrow(0)
end function


HA$PBExportHeader$u_avi_2022_pr_impresion_aviso.sru
forward
global type u_avi_2022_pr_impresion_aviso from datawindow
end type
end forward

global type u_avi_2022_pr_impresion_aviso from datawindow
int Width=2309
string DataObject="d_2022_formulario_aviso"
end type
global u_avi_2022_pr_impresion_aviso u_avi_2022_pr_impresion_aviso

forward prototypes
public function integer fnu_impresion_aviso (datawindow p_dw, long pl_nro_aviso)
end prototypes

public function integer fnu_impresion_aviso (datawindow p_dw, long pl_nro_aviso);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_impresi$$HEX1$$f300$$ENDHEX$$n_aviso
// 
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n con la base de datos y retrieve de la datawindow.
//           (Revisar el resto esta en comentario).
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw, pi_nro_aviso
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int xx,yy
long job
//messagebox("ksdfsd",pi_nro_aviso)
//job = printopen()
p_dw.settransobject(sqlca)
xx = p_dw.retrieve(pl_nro_aviso)
//messagebox("xx",xx)
//return printdatawindow(job,p_dw)
//printclose(job)
//return p_dw.print()
//messagebox("ksdfsd","sali")

yy= p_dw.print()
//messagebox("yy",yy)
return yy
end function


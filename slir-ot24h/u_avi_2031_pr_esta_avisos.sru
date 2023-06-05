HA$PBExportHeader$u_avi_2031_pr_esta_avisos.sru
forward
global type u_avi_2031_pr_esta_avisos from u_avi_0000_generico_avisos
end type
end forward

global type u_avi_2031_pr_esta_avisos from u_avi_0000_generico_avisos
int Width=2496
int Height=908
string DataObject="d_avi_2031_pr_est_avisos"
end type
global u_avi_2031_pr_esta_avisos u_avi_2031_pr_esta_avisos

forward prototypes
public function integer fnu_despliego_datos (ref datawindow pd_dw, integer pn_centro, string ps_usuario, datetime pd_fecha, integer pi_tip_centro, long pl_clase_aviso, long pl_todos_ambitos, string ps_centro, integer pi_tipo_centro_padre)
end prototypes

public function integer fnu_despliego_datos (ref datawindow pd_dw, integer pn_centro, string ps_usuario, datetime pd_fecha, integer pi_tip_centro, long pl_clase_aviso, long pl_todos_ambitos, string ps_centro, integer pi_tipo_centro_padre);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_despliego_datos 
//
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n de la base de dato y retrieve de la datawindow.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pn_centro, ps_usuario
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.settransobject(sqlca)
pd_dw.retrieve(pn_centro,ps_usuario,pd_fecha,pi_tip_centro,pl_clase_aviso,&
pl_todos_ambitos,ps_centro, pi_tipo_centro_padre)
return 1
end function


HA$PBExportHeader$u_avi_2032_pr_esta_avisos_pend.sru
forward
global type u_avi_2032_pr_esta_avisos_pend from datawindow
end type
end forward

global type u_avi_2032_pr_esta_avisos_pend from datawindow
int Width=2871
int Height=908
string DataObject="d_avi_2032_pr_est_avisos_pend"
end type
global u_avi_2032_pr_esta_avisos_pend u_avi_2032_pr_esta_avisos_pend

forward prototypes
public function integer fnu_despliego_datos (ref datawindow pd_dw, integer pn_centro, string ps_usuario, integer pi_tip_centro, long pl_clase_aviso, long pl_todos_ambitos, string ps_nro_centro, integer ps_tipo_centro_padre)
end prototypes

public function integer fnu_despliego_datos (ref datawindow pd_dw, integer pn_centro, string ps_usuario, integer pi_tip_centro, long pl_clase_aviso, long pl_todos_ambitos, string ps_nro_centro, integer ps_tipo_centro_padre);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_despliego_datos 
//
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos y retrieve de la datawindow 
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
pd_dw.retrieve(pn_centro,ps_usuario,pi_tip_centro,&
pl_clase_aviso,pl_todos_ambitos,ps_nro_centro, ps_tipo_centro_padre)
return 1
end function


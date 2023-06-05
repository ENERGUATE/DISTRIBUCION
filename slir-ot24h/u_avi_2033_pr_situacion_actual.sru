HA$PBExportHeader$u_avi_2033_pr_situacion_actual.sru
forward
global type u_avi_2033_pr_situacion_actual from datawindow
end type
end forward

global type u_avi_2033_pr_situacion_actual from datawindow
int Width=2697
int Height=608
string DataObject="d_avi_2033_situacion_actual"
end type
global u_avi_2033_pr_situacion_actual u_avi_2033_pr_situacion_actual

forward prototypes
public function integer fnu_despliego_datos (ref datawindow pd_dw, integer pi_nro_centro, string ps_usuario, integer pi_tip_centro, long pl_todos_ambitos, string ps_nro_centro, integer pi_tip_centro_padre, integer pi_ind_calidad)
end prototypes

public function integer fnu_despliego_datos (ref datawindow pd_dw, integer pi_nro_centro, string ps_usuario, integer pi_tip_centro, long pl_todos_ambitos, string ps_nro_centro, integer pi_tip_centro_padre, integer pi_ind_calidad);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_despliego_datos
// 
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos y retrieve de la datawindow
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_nro_centro, ps_usuario
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

//pd_dw.settransobject(sqlca)
pd_dw.retrieve(pi_nro_centro,ps_usuario, pi_tip_centro &
,pl_todos_ambitos,ps_nro_centro,pi_tip_centro_padre,pi_ind_calidad) 
return 1
end function


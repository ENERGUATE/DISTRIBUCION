HA$PBExportHeader$u_avi_2034_pr_usuario_telegestiones.sru
forward
global type u_avi_2034_pr_usuario_telegestiones from datawindow
end type
end forward

global type u_avi_2034_pr_usuario_telegestiones from datawindow
int Width=1217
int Height=101
string DataObject="d_seleccion_usuario_teleg"
end type
global u_avi_2034_pr_usuario_telegestiones u_avi_2034_pr_usuario_telegestiones

type variables
datawindowchild dddw_usuarios_telegestiones
end variables

forward prototypes
public function integer fnu_crea_dropdown ()
end prototypes

public function integer fnu_crea_dropdown ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crea_dropdown
// 
// Objetivo: Crea las drop down datawindows internas del user object.
//	          carga todos los usuarios que pertenecen al centro,cdm,puesto
//				en el que esta trabajando el usario del sistema
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/5/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


												// dropdown de nombres ins afectadas
this.GetChild('nro_usuario',dddw_usuarios_telegestiones)
dddw_usuarios_telegestiones.SetTransObject(SQLCA)
dddw_usuarios_telegestiones.retrieve(gi_nro_centro,gi_nro_cmd)
												//dropdown de tipos ins afectadas
return 1
end function


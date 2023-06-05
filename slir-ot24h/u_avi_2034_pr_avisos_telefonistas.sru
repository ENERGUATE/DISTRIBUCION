HA$PBExportHeader$u_avi_2034_pr_avisos_telefonistas.sru
forward
global type u_avi_2034_pr_avisos_telefonistas from datawindow
end type
end forward

global type u_avi_2034_pr_avisos_telefonistas from datawindow
int Width=2085
int Height=885
string DataObject="d_avi_2034_avisos_telefonista"
end type
global u_avi_2034_pr_avisos_telefonistas u_avi_2034_pr_avisos_telefonistas

forward prototypes
public function integer fnu_despliego_datos (ref datawindow pd_dw, string ps_usuario, datetime pd_f_desde, datetime pd_f_hasta)
end prototypes

public function integer fnu_despliego_datos (ref datawindow pd_dw, string ps_usuario, datetime pd_f_desde, datetime pd_f_hasta);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_despliego_datos
// 
// Objetivo:  Despliega la cantidad de avisos de ayuda y comunes, para un 
//				   usuario determinado.
//				  Despliega un registro para cada mes , ordenado desde la fecha mas alta a la mas baja				
//				
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pd_dw datawindows
//					ps_usuario  //nombre del usuario
//	Entrada:  
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/5/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pd_dw.settransobject(sqlca)
pd_dw.retrieve(ps_usuario,pd_f_desde,pd_f_hasta)

RETURN 1
end function


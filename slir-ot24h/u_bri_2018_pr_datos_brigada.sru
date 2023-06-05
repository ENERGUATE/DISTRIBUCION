HA$PBExportHeader$u_bri_2018_pr_datos_brigada.sru
forward
global type u_bri_2018_pr_datos_brigada from UserObject
end type
type dw_datos_brigada from datawindow within u_bri_2018_pr_datos_brigada
end type
end forward

global type u_bri_2018_pr_datos_brigada from UserObject
int Width=1427
int Height=301
boolean Border=true
long PictureMaskColor=536870912
long TabBackColor=16777215
dw_datos_brigada dw_datos_brigada
end type
global u_bri_2018_pr_datos_brigada u_bri_2018_pr_datos_brigada

on u_bri_2018_pr_datos_brigada.create
this.dw_datos_brigada=create dw_datos_brigada
this.Control[]={ this.dw_datos_brigada}
end on

on u_bri_2018_pr_datos_brigada.destroy
destroy(this.dw_datos_brigada)
end on

type dw_datos_brigada from datawindow within u_bri_2018_pr_datos_brigada
int Width=1427
int Height=301
int TabOrder=1
string DataObject="d_bri_2018_datos_brigada"
boolean LiveScroll=true
end type


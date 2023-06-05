HA$PBExportHeader$u_bri_2016_pr_prop_tareas_ot.sru
forward
global type u_bri_2016_pr_prop_tareas_ot from UserObject
end type
type dw_prop_tareas_ots from datawindow within u_bri_2016_pr_prop_tareas_ot
end type
end forward

global type u_bri_2016_pr_prop_tareas_ot from UserObject
int Width=1015
int Height=353
long BackColor=79741120
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=16777215
dw_prop_tareas_ots dw_prop_tareas_ots
end type
global u_bri_2016_pr_prop_tareas_ot u_bri_2016_pr_prop_tareas_ot

type variables
datawindowchild  dddw_estado_ot


end variables

on u_bri_2016_pr_prop_tareas_ot.create
this.dw_prop_tareas_ots=create dw_prop_tareas_ots
this.Control[]={ this.dw_prop_tareas_ots}
end on

on u_bri_2016_pr_prop_tareas_ot.destroy
destroy(this.dw_prop_tareas_ots)
end on

type dw_prop_tareas_ots from datawindow within u_bri_2016_pr_prop_tareas_ot
int Y=5
int Width=1025
int Height=353
int TabOrder=1
string DataObject="d_bri_2016_pr_prop_tareas_ots"
boolean LiveScroll=true
end type


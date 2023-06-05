HA$PBExportHeader$w_dash0.srw
forward
global type w_dash0 from window
end type
type dw_graph1 from datawindow within w_dash0
end type
type st_1 from statictext within w_dash0
end type
end forward

global type w_dash0 from window
integer x = 1326
integer y = 600
integer width = 3493
integer height = 2064
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
dw_graph1 dw_graph1
st_1 st_1
end type
global w_dash0 w_dash0

on w_dash0.create
this.dw_graph1=create dw_graph1
this.st_1=create st_1
this.Control[]={this.dw_graph1,&
this.st_1}
end on

on w_dash0.destroy
destroy(this.dw_graph1)
destroy(this.st_1)
end on

event open;dw_graph1.retrieve()
end event

type dw_graph1 from datawindow within w_dash0
integer x = 709
integer y = 140
integer width = 654
integer height = 472
integer taborder = 10
string dataobject = "dw_ot24h1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca2)
end event

type st_1 from statictext within w_dash0
integer x = 251
integer y = 424
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type


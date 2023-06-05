HA$PBExportHeader$w_desborde_llamadas_depto.srw
forward
global type w_desborde_llamadas_depto from window
end type
type dw_desborde_depto from datawindow within w_desborde_llamadas_depto
end type
type st_1 from statictext within w_desborde_llamadas_depto
end type
type gb_1 from groupbox within w_desborde_llamadas_depto
end type
end forward

global type w_desborde_llamadas_depto from window
integer width = 5467
integer height = 2888
boolean titlebar = true
string title = "Desborde de llamadas (w_desborde_llamadas_depto)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
dw_desborde_depto dw_desborde_depto
st_1 st_1
gb_1 gb_1
end type
global w_desborde_llamadas_depto w_desborde_llamadas_depto

on w_desborde_llamadas_depto.create
this.dw_desborde_depto=create dw_desborde_depto
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.dw_desborde_depto,&
this.st_1,&
this.gb_1}
end on

on w_desborde_llamadas_depto.destroy
destroy(this.dw_desborde_depto)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;openwithparm(w_msg, "Cargando...")

dw_desborde_depto.settransobject(sqlca2)
dw_desborde_depto.retrieve()

close(w_msg)
end event

type dw_desborde_depto from datawindow within w_desborde_llamadas_depto
integer x = 114
integer y = 224
integer width = 2500
integer height = 1804
integer taborder = 20
string dataobject = "dw_desborde_depto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_desborde_llamadas_depto
integer x = 430
integer y = 76
integer width = 1833
integer height = 80
integer textsize = -13
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217731
long backcolor = 33554431
boolean enabled = false
string text = "DESBORDE DE LLAMADAS POR DEPARTAMENTO"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_desborde_llamadas_depto
integer x = 302
integer y = 8
integer width = 2094
integer height = 184
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type


HA$PBExportHeader$w_consultar_incidencia_new.srw
forward
global type w_consultar_incidencia_new from window
end type
type em_consult_incidencia from editmask within w_consultar_incidencia_new
end type
type st_1 from statictext within w_consultar_incidencia_new
end type
type cb_1 from commandbutton within w_consultar_incidencia_new
end type
type gb_1 from groupbox within w_consultar_incidencia_new
end type
end forward

global type w_consultar_incidencia_new from window
integer width = 2391
integer height = 1144
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_consult_incidencia em_consult_incidencia
st_1 st_1
cb_1 cb_1
gb_1 gb_1
end type
global w_consultar_incidencia_new w_consultar_incidencia_new

on w_consultar_incidencia_new.create
this.em_consult_incidencia=create em_consult_incidencia
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.em_consult_incidencia,&
this.st_1,&
this.cb_1,&
this.gb_1}
end on

on w_consultar_incidencia_new.destroy
destroy(this.em_consult_incidencia)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

type em_consult_incidencia from editmask within w_consultar_incidencia_new
integer x = 114
integer y = 196
integer width = 411
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

type st_1 from statictext within w_consultar_incidencia_new
integer x = 114
integer y = 112
integer width = 910
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217748
long backcolor = 128
string text = "Incidencia"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_consultar_incidencia_new
integer x = 110
integer y = 344
integer width = 466
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "consultar"
end type

type gb_1 from groupbox within w_consultar_incidencia_new
integer x = 37
integer y = 20
integer width = 1179
integer height = 496
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "CONSULTAR INCIDENCIA"
end type


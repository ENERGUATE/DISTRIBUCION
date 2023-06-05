HA$PBExportHeader$w_select_tipo_incidencia.srw
forward
global type w_select_tipo_incidencia from window
end type
type cb_2 from commandbutton within w_select_tipo_incidencia
end type
type cb_1 from commandbutton within w_select_tipo_incidencia
end type
end forward

global type w_select_tipo_incidencia from window
integer width = 1659
integer height = 952
boolean titlebar = true
string title = "Seleccion de Ventana"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "recursos/watcom.ico"
boolean center = true
cb_2 cb_2
cb_1 cb_1
end type
global w_select_tipo_incidencia w_select_tipo_incidencia

on w_select_tipo_incidencia.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on w_select_tipo_incidencia.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within w_select_tipo_incidencia
integer x = 133
integer y = 456
integer width = 1317
integer height = 112
integer taborder = 10
string dragicon = "recursos/watcom.ico"
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Historicos Incidencia"
end type

event clicked;OpenSheet(w_2301_hist_form_incidencia, w_genapp_frame, 1, layered!) 
close(w_select_tipo_incidencia)
end event

type cb_1 from commandbutton within w_select_tipo_incidencia
integer x = 133
integer y = 244
integer width = 1317
integer height = 112
integer taborder = 10
string dragicon = "recursos/watcom.ico"
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Incidencia"
end type

event clicked;OpenSheet(w_2301_form_incidencia, w_genapp_frame, 1, layered!)
close(w_select_tipo_incidencia)
end event


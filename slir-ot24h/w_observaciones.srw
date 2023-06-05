HA$PBExportHeader$w_observaciones.srw
forward
global type w_observaciones from window
end type
type st_25 from statictext within w_observaciones
end type
type mle_observaciones from multilineedit within w_observaciones
end type
type gb_1 from groupbox within w_observaciones
end type
end forward

global type w_observaciones from window
integer width = 2190
integer height = 1608
boolean titlebar = true
string title = "Observaciones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_25 st_25
mle_observaciones mle_observaciones
gb_1 gb_1
end type
global w_observaciones w_observaciones

type variables
string l_observaciones
end variables

on w_observaciones.create
this.st_25=create st_25
this.mle_observaciones=create mle_observaciones
this.gb_1=create gb_1
this.Control[]={this.st_25,&
this.mle_observaciones,&
this.gb_1}
end on

on w_observaciones.destroy
destroy(this.st_25)
destroy(this.mle_observaciones)
destroy(this.gb_1)
end on

event open;l_observaciones = message.stringparm

mle_observaciones.text = l_observaciones
end event

type st_25 from statictext within w_observaciones
integer x = 37
integer y = 52
integer width = 2075
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Observaciones  Telegestiones:"
boolean focusrectangle = false
end type

type mle_observaciones from multilineedit within w_observaciones
integer x = 37
integer y = 112
integer width = 2075
integer height = 1364
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
textcase textcase = upper!
boolean displayonly = true
end type

event getfocus;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Nombre: mle_observacion
//Evento: getfocus()
//DESCRIBCI$$HEX1$$d300$$ENDHEX$$N:  Se Activa el scroll vertical
//EDM-14
//Creado:27/02/2018
//TDA-RODOLFO GUTI$$HEX1$$c900$$ENDHEX$$RREZ
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


This.VScrollBar = true
end event

event losefocus;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Nombre: mle_observacion
//Evento: losefocus()
//DESCRIBCI$$HEX1$$d300$$ENDHEX$$N:  Se desactiva el scroll vertical
//EDM-14
//Creado:27/02/2018
//TDA-RODOLFO GUTI$$HEX1$$c900$$ENDHEX$$RREZ
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


This.VScrollBar = false
end event

type gb_1 from groupbox within w_observaciones
integer width = 2150
integer height = 1500
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type


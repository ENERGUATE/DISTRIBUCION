HA$PBExportHeader$w_seleccion_activo.srw
forward
global type w_seleccion_activo from window
end type
type cb_aceptar from commandbutton within w_seleccion_activo
end type
type uo_activo from u_activos within w_seleccion_activo
end type
end forward

global type w_seleccion_activo from window
integer width = 1563
integer height = 2100
boolean titlebar = true
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de activo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_aceptar cb_aceptar
uo_activo uo_activo
end type
global w_seleccion_activo w_seleccion_activo

type variables
long il_nro_instalacion = -1
end variables

on w_seleccion_activo.create
this.cb_aceptar=create cb_aceptar
this.uo_activo=create uo_activo
this.Control[]={this.cb_aceptar,&
this.uo_activo}
end on

on w_seleccion_activo.destroy
destroy(this.cb_aceptar)
destroy(this.uo_activo)
end on

event close;

closewithreturn(this, il_nro_instalacion)
end event

type cb_aceptar from commandbutton within w_seleccion_activo
integer x = 553
integer y = 1824
integer width = 379
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Aceptar"
end type

event clicked;

il_nro_instalacion = uo_activo.uf_get_nro_instalacion()

close(parent)
end event

type uo_activo from u_activos within w_seleccion_activo
integer width = 1541
integer taborder = 30
end type

on uo_activo.destroy
call u_activos::destroy
end on


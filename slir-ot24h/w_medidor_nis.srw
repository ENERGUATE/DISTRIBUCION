HA$PBExportHeader$w_medidor_nis.srw
forward
global type w_medidor_nis from window
end type
type st_medidor from statictext within w_medidor_nis
end type
type sle_medidor from singlelineedit within w_medidor_nis
end type
type cb_aceptar from commandbutton within w_medidor_nis
end type
type dw_nis from datawindow within w_medidor_nis
end type
end forward

global type w_medidor_nis from window
integer width = 1024
integer height = 1464
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_medidor st_medidor
sle_medidor sle_medidor
cb_aceptar cb_aceptar
dw_nis dw_nis
end type
global w_medidor_nis w_medidor_nis

on w_medidor_nis.create
this.st_medidor=create st_medidor
this.sle_medidor=create sle_medidor
this.cb_aceptar=create cb_aceptar
this.dw_nis=create dw_nis
this.Control[]={this.st_medidor,&
this.sle_medidor,&
this.cb_aceptar,&
this.dw_nis}
end on

on w_medidor_nis.destroy
destroy(this.st_medidor)
destroy(this.sle_medidor)
destroy(this.cb_aceptar)
destroy(this.dw_nis)
end on

event open;dw_nis.settransobject(sqlca)
dw_nis.insertrow(0)
dw_nis.retrieve(gu_comunic1.is_comunic.strval1)

sle_medidor.text= gu_comunic1.is_comunic.strval1
end event

type st_medidor from statictext within w_medidor_nis
integer x = 146
integer y = 64
integer width = 256
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medidor:"
boolean focusrectangle = false
end type

type sle_medidor from singlelineedit within w_medidor_nis
integer x = 402
integer y = 64
integer width = 439
integer height = 72
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_aceptar from commandbutton within w_medidor_nis
integer x = 329
integer y = 1152
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;gu_comunic1.is_comunic.longval1=dw_nis.getitemnumber(dw_nis.getselectedrow(0),'nis_rad')
close (parent)
end event

type dw_nis from datawindow within w_medidor_nis
integer x = 146
integer y = 160
integer width = 695
integer height = 960
integer taborder = 20
string title = "none"
string dataobject = "d_medidor"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.selectrow(0,false)
this.selectrow(row,true)
end event

event doubleclicked;this.selectrow(0,false)
this.selectrow(row,true)
cb_aceptar.triggerevent("clicked")
end event


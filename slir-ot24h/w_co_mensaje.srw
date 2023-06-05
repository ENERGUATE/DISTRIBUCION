HA$PBExportHeader$w_co_mensaje.srw
forward
global type w_co_mensaje from window
end type
type p_imagen from picture within w_co_mensaje
end type
type mle_mensaje from multilineedit within w_co_mensaje
end type
type cb_aceptar from commandbutton within w_co_mensaje
end type
type dw_clientes_imp from datawindow within w_co_mensaje
end type
end forward

global type w_co_mensaje from window
integer x = 174
integer y = 416
integer width = 2395
integer height = 1028
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
p_imagen p_imagen
mle_mensaje mle_mensaje
cb_aceptar cb_aceptar
dw_clientes_imp dw_clientes_imp
end type
global w_co_mensaje w_co_mensaje

event open;s_mensaje_salmt ls_mensaje_salmt



ls_mensaje_salmt = Message.PowerObjectParm



p_imagen.PictureName = ls_mensaje_salmt.imagen
mle_mensaje.Text = ls_mensaje_salmt.mensaje
This.Title = ls_mensaje_salmt.titulo


If ls_mensaje_salmt.opcion = 4 Then
	This.Height = This.Height + dw_clientes_imp.Height
	cb_aceptar.y = This.Height - 215
	p_imagen.y = cb_aceptar.y + 24
	dw_clientes_imp.Visible = True
	dw_clientes_imp.SetTransObject(SQLCA)
	dw_clientes_imp.Retrieve(ls_mensaje_salmt.nro_instalacion)
End If


fg_centrar_ventana(This)
	
	
end event

on w_co_mensaje.create
this.p_imagen=create p_imagen
this.mle_mensaje=create mle_mensaje
this.cb_aceptar=create cb_aceptar
this.dw_clientes_imp=create dw_clientes_imp
this.Control[]={this.p_imagen,&
this.mle_mensaje,&
this.cb_aceptar,&
this.dw_clientes_imp}
end on

on w_co_mensaje.destroy
destroy(this.p_imagen)
destroy(this.mle_mensaje)
destroy(this.cb_aceptar)
destroy(this.dw_clientes_imp)
end on

type p_imagen from picture within w_co_mensaje
integer x = 1317
integer y = 820
integer width = 73
integer height = 64
string picturename = "Avipen.bmp"
boolean focusrectangle = false
end type

event clicked;Close(Parent)
end event

type mle_mensaje from multilineedit within w_co_mensaje
integer x = 41
integer y = 32
integer width = 2272
integer height = 736
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_aceptar from commandbutton within w_co_mensaje
integer x = 933
integer y = 796
integer width = 485
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Close(Parent)
end event

type dw_clientes_imp from datawindow within w_co_mensaje
boolean visible = false
integer x = 41
integer y = 804
integer width = 2267
integer height = 736
integer taborder = 20
string dataobject = "dw_co_cliente_imp_salmt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


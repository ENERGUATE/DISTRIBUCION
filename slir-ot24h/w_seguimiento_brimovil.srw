HA$PBExportHeader$w_seguimiento_brimovil.srw
forward
global type w_seguimiento_brimovil from window
end type
type st_brigada from statictext within w_seguimiento_brimovil
end type
type st_nro_orden from statictext within w_seguimiento_brimovil
end type
type st_1 from statictext within w_seguimiento_brimovil
end type
type cb_1 from commandbutton within w_seguimiento_brimovil
end type
type dw_estado_orden from datawindow within w_seguimiento_brimovil
end type
type dw_avi_asoc from datawindow within w_seguimiento_brimovil
end type
type gb_1 from groupbox within w_seguimiento_brimovil
end type
type gb_2 from groupbox within w_seguimiento_brimovil
end type
type gb_3 from groupbox within w_seguimiento_brimovil
end type
type gb_4 from groupbox within w_seguimiento_brimovil
end type
end forward

global type w_seguimiento_brimovil from window
integer width = 3707
integer height = 2748
boolean titlebar = true
string title = "Seguimiento Brimovil"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_brigada st_brigada
st_nro_orden st_nro_orden
st_1 st_1
cb_1 cb_1
dw_estado_orden dw_estado_orden
dw_avi_asoc dw_avi_asoc
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_seguimiento_brimovil w_seguimiento_brimovil

on w_seguimiento_brimovil.create
this.st_brigada=create st_brigada
this.st_nro_orden=create st_nro_orden
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_estado_orden=create dw_estado_orden
this.dw_avi_asoc=create dw_avi_asoc
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.st_brigada,&
this.st_nro_orden,&
this.st_1,&
this.cb_1,&
this.dw_estado_orden,&
this.dw_avi_asoc,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_seguimiento_brimovil.destroy
destroy(this.st_brigada)
destroy(this.st_nro_orden)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_estado_orden)
destroy(this.dw_avi_asoc)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;//Ventana de informaci$$HEX1$$f300$$ENDHEX$$n, muestra los avisos asociados a la orden y los estados que ha transcurrido tal orden...
long ll_nro_aviso
long ll_nro_orden
string ls_brigada

ll_nro_aviso = Message.DoubleParm
dw_avi_asoc.SetTransObject(SQLCA)
dw_avi_asoc.retrieve(ll_nro_aviso)
IF dw_avi_asoc.rowcount() <> 0 THEN
 		ll_nro_orden = Long(dw_avi_asoc.Object.nro_orden[1])
		st_nro_orden.text = String(ll_nro_orden)
		dw_estado_orden.SetTransObject(SQLCA)
		dw_estado_orden.retrieve(ll_nro_orden)
		IF dw_estado_orden.rowcount() <> 0 THEN
			ls_brigada = dw_estado_orden.Object.brigada[1]
			st_brigada.text = ls_brigada
		ELSE
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No tiene ordenes asociadas")
			close(this)
		END IF	
ELSE
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Aviso sin orden asociada")
	close(this)
END IF
end event

type st_brigada from statictext within w_seguimiento_brimovil
integer x = 2432
integer y = 828
integer width = 663
integer height = 124
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 33554431
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nro_orden from statictext within w_seguimiento_brimovil
integer x = 2432
integer y = 388
integer width = 663
integer height = 124
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 33554431
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_seguimiento_brimovil
integer x = 55
integer y = 48
integer width = 1682
integer height = 184
integer textsize = -13
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Esta orden brimovil tiene asignado otros avisos en el mismo sector los cuales son:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_seguimiento_brimovil
integer x = 1637
integer y = 2460
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CERRAR"
boolean default = true
end type

event clicked;close(w_seguimiento_brimovil)
end event

type dw_estado_orden from datawindow within w_seguimiento_brimovil
integer x = 713
integer y = 1280
integer width = 2249
integer height = 1056
integer taborder = 20
string title = "none"
string dataobject = "dw_estado_orden"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_avi_asoc from datawindow within w_seguimiento_brimovil
integer x = 599
integer y = 352
integer width = 599
integer height = 660
integer taborder = 20
string title = "none"
string dataobject = "dw_avisos_asoci_bri"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_seguimiento_brimovil
integer x = 498
integer y = 236
integer width = 795
integer height = 852
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
end type

type gb_2 from groupbox within w_seguimiento_brimovil
integer x = 261
integer y = 1188
integer width = 3154
integer height = 1220
integer taborder = 10
integer textsize = -13
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Estado de la Orden en Campo"
end type

type gb_3 from groupbox within w_seguimiento_brimovil
integer x = 1915
integer y = 220
integer width = 1696
integer height = 400
integer taborder = 10
integer textsize = -13
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "No. de Orden BRIMOVIL asociada a este aviso."
end type

type gb_4 from groupbox within w_seguimiento_brimovil
integer x = 1915
integer y = 680
integer width = 1696
integer height = 400
integer taborder = 30
integer textsize = -13
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Brigada que atiende en Campo."
end type


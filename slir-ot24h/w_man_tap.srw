HA$PBExportHeader$w_man_tap.srw
forward
global type w_man_tap from w_sgigenerica
end type
type dw_datos from datawindow within w_man_tap
end type
type cb_1 from commandbutton within w_man_tap
end type
type cb_2 from commandbutton within w_man_tap
end type
type gb_1 from groupbox within w_man_tap
end type
end forward

global type w_man_tap from w_sgigenerica
integer x = 1499
integer y = 1000
integer width = 2272
integer height = 732
string title = "Mantenimiento de taps"
dw_datos dw_datos
cb_1 cb_1
cb_2 cb_2
gb_1 gb_1
end type
global w_man_tap w_man_tap

on w_man_tap.create
int iCurrent
call super::create
this.dw_datos=create dw_datos
this.cb_1=create cb_1
this.cb_2=create cb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_datos
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.gb_1
end on

on w_man_tap.destroy
call super::destroy
destroy(this.dw_datos)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.gb_1)
end on

event open;call super::open;datawindowchild	ldc_instalaciones		//DataWindowChild que contiene las instalaciones

//Insertamos una fila en el dw
dw_datos.insertRow(0)

dw_datos.setTransObject(SQLCA)

//Recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos del dataWindowChild
dw_datos.getChild("nro_instalacion", ldc_instalaciones)
ldc_instalaciones.setTransObject(SQLCA)
ldc_instalaciones.retrieve()



end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_man_tap
integer y = 336
end type

type dw_datos from datawindow within w_man_tap
integer x = 73
integer y = 64
integer width = 2053
integer height = 352
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mantenimiento_tap"
boolean border = false
boolean livescroll = true
end type

event itemchanged;IF dwo.name = "nro_instalacion" THEN
	dw_datos.retrieve(long(data))
END IF
end event

type cb_1 from commandbutton within w_man_tap
integer x = 1755
integer y = 484
integer width = 407
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;CLOSE(PARENT)
end event

type cb_2 from commandbutton within w_man_tap
integer x = 1221
integer y = 484
integer width = 407
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ace&ptar"
end type

event clicked;dw_datos.setItem(1, "usuario", gs_usuario)
dw_datos.setItem(1, "f_actual", fgnu_fecha_actual())
dw_datos.setItem(1, "programa", "w_man_tap")

dw_datos.update()

COMMIT;

CLOSE(PARENT)


end event

type gb_1 from groupbox within w_man_tap
integer x = 46
integer y = 4
integer width = 2117
integer height = 436
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


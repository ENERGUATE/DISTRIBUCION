HA$PBExportHeader$w_avisos.srw
forward
global type w_avisos from window
end type
type cb_4 from commandbutton within w_avisos
end type
type sle_aviso1 from singlelineedit within w_avisos
end type
type st_2 from statictext within w_avisos
end type
type cb_3 from commandbutton within w_avisos
end type
type st_1 from statictext within w_avisos
end type
type cb_2 from commandbutton within w_avisos
end type
type cb_1 from commandbutton within w_avisos
end type
type p_2 from picture within w_avisos
end type
type dw_avisos from datawindow within w_avisos
end type
type dw_region from datawindow within w_avisos
end type
type gb_1 from groupbox within w_avisos
end type
type p_1 from picture within w_avisos
end type
end forward

global type w_avisos from window
integer x = 1326
integer y = 652
integer width = 5696
integer height = 3360
boolean titlebar = true
string title = "Avisos  (w_avisos)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
cb_4 cb_4
sle_aviso1 sle_aviso1
st_2 st_2
cb_3 cb_3
st_1 st_1
cb_2 cb_2
cb_1 cb_1
p_2 p_2
dw_avisos dw_avisos
dw_region dw_region
gb_1 gb_1
p_1 p_1
end type
global w_avisos w_avisos

forward prototypes
public function integer f_update ()
end prototypes

public function integer f_update ();
openwithparm(w_msg, "Cargando...")


p_1.picturename=direccion_proyecto+"\pict\regiones1.bmp"
p_2.picturename=direccion_proyecto+"\pict\reload.bmp"

dw_region.retrieve()
//dw_avisos.retrieve()


close(w_msg)

return 1
end function

on w_avisos.create
this.cb_4=create cb_4
this.sle_aviso1=create sle_aviso1
this.st_2=create st_2
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_2=create p_2
this.dw_avisos=create dw_avisos
this.dw_region=create dw_region
this.gb_1=create gb_1
this.p_1=create p_1
this.Control[]={this.cb_4,&
this.sle_aviso1,&
this.st_2,&
this.cb_3,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.p_2,&
this.dw_avisos,&
this.dw_region,&
this.gb_1,&
this.p_1}
end on

on w_avisos.destroy
destroy(this.cb_4)
destroy(this.sle_aviso1)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.p_2)
destroy(this.dw_avisos)
destroy(this.dw_region)
destroy(this.gb_1)
destroy(this.p_1)
end on

event open;f_update()




end event

type cb_4 from commandbutton within w_avisos
integer x = 695
integer y = 1640
integer width = 274
integer height = 144
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Buscar"
boolean default = true
end type

event clicked;string aviso

if sle_aviso1.text ='' then
	messagebox('Info', 'Ingrese n$$HEX1$$fa00$$ENDHEX$$mero de aviso')
else
	
	aviso=sle_aviso1.text
	dw_avisos.dataobject='dw_avisos_6'
	dw_avisos.settransobject(sqlca)
	dw_avisos.retrieve(aviso)
	
	if dw_avisos.rowcount()<1 then
		messagebox('Info', 'No se encontr$$HEX2$$f3002000$$ENDHEX$$el aviso')
	end if
	
end if
end event

type sle_aviso1 from singlelineedit within w_avisos
integer x = 110
integer y = 1640
integer width = 553
integer height = 144
integer taborder = 20
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_avisos
integer x = 119
integer y = 1488
integer width = 736
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "O ingrese n$$HEX1$$fa00$$ENDHEX$$mero de aviso:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_avisos
integer x = 3566
integer y = 2656
integer width = 343
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Excel"
end type

event clicked;dw_avisos.SaveAs("", Excel! , TRUE)
end event

type st_1 from statictext within w_avisos
integer x = 105
integer y = 276
integer width = 526
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "Seleccionar sector:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_avisos
integer x = 2249
integer y = 2656
integer width = 343
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = ">"
end type

event clicked;dw_AVISOS.scrolltorow(dw_AVISOS.getrow()+1)
end event

type cb_1 from commandbutton within w_avisos
integer x = 1833
integer y = 2656
integer width = 343
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "<"
end type

event clicked;dw_AVISOS.scrolltorow(dw_AVISOS.getrow()-1)
end event

type p_2 from picture within w_avisos
integer x = 663
integer y = 232
integer width = 155
integer height = 164
string picturename = "pict/reload.bmp"
boolean focusrectangle = false
end type

event clicked;f_update()
end event

type dw_avisos from datawindow within w_avisos
integer x = 1184
integer y = 208
integer width = 3447
integer height = 2412
integer taborder = 70
string dataobject = "dw_avisos_4"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type dw_region from datawindow within w_avisos
integer x = 105
integer y = 428
integer width = 1001
integer height = 1000
integer taborder = 10
string dataobject = "dw_avisos_incidenciassector"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

openwithparm(w_msg,'Cargando...')

if row=0 then
	dw_avisos.retrieve('?')
	
else
	if row <= this.rowcount() then
		dw_avisos.dataobject='dw_avisos_4'
		dw_avisos.settransobject(sqlca)
		dw_avisos.retrieve(this.object.sector[row])
		sle_aviso1.text=''
		else 
	/*nothing*/
	end if
end if

close(w_msg)



end event

type gb_1 from groupbox within w_avisos
integer x = 114
integer y = 8
integer width = 5243
integer height = 184
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type p_1 from picture within w_avisos
integer x = 69
integer y = 1836
integer width = 1070
integer height = 996
string picturename = "pict/regiones1.bmp"
boolean focusrectangle = false
end type


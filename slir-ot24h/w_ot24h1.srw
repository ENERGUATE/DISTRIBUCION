HA$PBExportHeader$w_ot24h1.srw
forward
global type w_ot24h1 from window
end type
type pb_1 from picturebutton within w_ot24h1
end type
type tab_1 from tab within w_ot24h1
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tab_1 from tab within w_ot24h1
tabpage_1 tabpage_1
end type
type cb_1 from picturebutton within w_ot24h1
end type
type st_16 from statictext within w_ot24h1
end type
type em_hora from editmask within w_ot24h1
end type
type st_15 from statictext within w_ot24h1
end type
type st_14 from statictext within w_ot24h1
end type
type st_1 from statictext within w_ot24h1
end type
type em_1 from editmask within w_ot24h1
end type
type cbx_1 from checkbox within w_ot24h1
end type
type st_timer from statictext within w_ot24h1
end type
type gb_1 from groupbox within w_ot24h1
end type
end forward

global type w_ot24h1 from window
integer x = 489
integer y = 16
integer width = 5746
integer height = 3312
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 16777215
pb_1 pb_1
tab_1 tab_1
cb_1 cb_1
st_16 st_16
em_hora em_hora
st_15 st_15
st_14 st_14
st_1 st_1
em_1 em_1
cbx_1 cbx_1
st_timer st_timer
gb_1 gb_1
end type
global w_ot24h1 w_ot24h1

type variables
integer informe
end variables

forward prototypes
public function integer f_resize ()
end prototypes

public function integer f_resize ();gb_1.width=this.width - 150

//dw_1.height=this.height - 800
//dw_1.width=this.width - 200
//r_1.width=this.width - 200
//st_titulo.width=this.width - 200
//st_mensaje.width=this.width - 200
//
return 1
end function

on w_ot24h1.create
this.pb_1=create pb_1
this.tab_1=create tab_1
this.cb_1=create cb_1
this.st_16=create st_16
this.em_hora=create em_hora
this.st_15=create st_15
this.st_14=create st_14
this.st_1=create st_1
this.em_1=create em_1
this.cbx_1=create cbx_1
this.st_timer=create st_timer
this.gb_1=create gb_1
this.Control[]={this.pb_1,&
this.tab_1,&
this.cb_1,&
this.st_16,&
this.em_hora,&
this.st_15,&
this.st_14,&
this.st_1,&
this.em_1,&
this.cbx_1,&
this.st_timer,&
this.gb_1}
end on

on w_ot24h1.destroy
destroy(this.pb_1)
destroy(this.tab_1)
destroy(this.cb_1)
destroy(this.st_16)
destroy(this.em_hora)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cbx_1)
destroy(this.st_timer)
destroy(this.gb_1)
end on

event resize;f_resize()
end event

event open;time hora



this.title='Registros de la SLIR (w_OT24h1)'
//ST_TITULO.TEXT='Sector'
//st_mensaje.text='Listo.'



em_1.text='120'

hora=time('00:00:00')
hora=relativetime(hora,integer(em_1.text))
st_timer.Text = String(hora, "hh:mm:ss")

Timer(1)
informe = 1 /*tabla de porcentajes*/

cb_1.picturename=direccion_proyecto+"\pict\upd.bmp"
pb_1.picturename=direccion_proyecto+"\pict\excel.bmp"



cb_1.triggerevent(clicked!)/*primer load*/




end event

event timer;time hora

hora=time(st_timer.text)

IF hora=time('00:00:00') then
	
	if cbx_1.checked=true then
		cb_1.triggerevent(clicked!)
	end if
	
	
	hora=time('00:00:00')
   hora=relativetime(hora,integer(em_1.text))
   st_timer.Text = String(hora, "hh:mm:ss")

	
else
	hora=time(st_timer.text)
	hora=relativetime(hora, - 1)
end if	

	st_timer.Text = String(hora, "hh:mm:ss")
	
	
em_hora.text=string(datetime(today(),now()))

end event

event close;disconnect using sqlca2;
end event

type pb_1 from picturebutton within w_ot24h1
integer x = 2450
integer y = 8
integer width = 283
integer height = 232
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
string picturename = "pict/excel.bmp"
end type

event clicked;
tab_1.tabpage_1.dw_1.saveas("",Excel!,TRUE)

end event

type tab_1 from tab within w_ot24h1
integer x = 32
integer y = 320
integer width = 5527
integer height = 2508
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long backcolor = 16777215
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 124
integer width = 5490
integer height = 2368
long backcolor = 16777215
string text = "Causas m$$HEX1$$e100$$ENDHEX$$s frecuentes"
long tabtextcolor = 33554432
long tabbackcolor = 12639424
string picturename = "Custom067!"
long picturemaskcolor = 553648127
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer y = 120
integer width = 5458
integer height = 2212
integer taborder = 50
string dataobject = "dw_ot24h1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca2)
end event

type cb_1 from picturebutton within w_ot24h1
integer x = 1970
integer y = 12
integer width = 283
integer height = 232
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
string picturename = "pict/upd.bmp"
end type

event clicked;integer i


//st_16.visible=true



openwithparm(w_msg,'Espere...')


//dw_1.settransobject(sqlca)
tab_1.tabpage_1.dw_1.settransobject(sqlca2)


//dw_1.retrieve()
tab_1.tabpage_1.dw_1.retrieve()

close(w_msg)
end event

type st_16 from statictext within w_ot24h1
boolean visible = false
integer x = 2834
integer y = 140
integer width = 453
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 16777215
long backcolor = 8388608
boolean enabled = false
string text = "Actualizando..."
alignment alignment = center!
boolean focusrectangle = false
end type

type em_hora from editmask within w_ot24h1
integer x = 4261
integer y = 104
integer width = 891
integer height = 132
integer taborder = 40
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 8388608
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = styleraised!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type st_15 from statictext within w_ot24h1
integer x = 814
integer y = 44
integer width = 343
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Cada"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_14 from statictext within w_ot24h1
integer x = 1691
integer y = 44
integer width = 343
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "segs."
boolean focusrectangle = false
end type

type st_1 from statictext within w_ot24h1
integer x = 160
integer y = 140
integer width = 773
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Pr$$HEX1$$f300$$ENDHEX$$xima actualizaci$$HEX1$$f300$$ENDHEX$$n en:"
boolean focusrectangle = false
end type

type em_1 from editmask within w_ot24h1
integer x = 1184
integer y = 44
integer width = 430
integer height = 88
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 30
string minmax = "15~~999"
end type

event modified;time hora
hora=time('00:00:00')
hora=relativetime(hora,integer(em_1.text))
st_timer.Text = String(hora, "hh:mm:ss")

end event

type cbx_1 from checkbox within w_ot24h1
integer x = 151
integer y = 44
integer width = 562
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
string text = "Auto-Actualizar"
boolean checked = true
boolean lefttext = true
end type

event clicked;if this.checked=false then
	st_timer.visible=false
	st_1.visible=false
	st_14.visible=false
	st_15.visible=false
	em_1.visible=false
else
	st_timer.visible=true
	st_1.visible=true
	st_14.visible=true
	st_15.visible=true
	em_1.visible=true
end if
end event

type st_timer from statictext within w_ot24h1
integer x = 960
integer y = 144
integer width = 681
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_ot24h1
integer x = 37
integer width = 5440
integer height = 264
integer taborder = 30
integer textsize = -22
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 16777215
end type


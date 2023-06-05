HA$PBExportHeader$w_informe_xoperador.srw
forward
global type w_informe_xoperador from window
end type
type sle_2 from singlelineedit within w_informe_xoperador
end type
type sle_1 from singlelineedit within w_informe_xoperador
end type
type st_3 from statictext within w_informe_xoperador
end type
type cb_2 from commandbutton within w_informe_xoperador
end type
type cb_1 from commandbutton within w_informe_xoperador
end type
type st_2 from statictext within w_informe_xoperador
end type
type cbx_1 from checkbox within w_informe_xoperador
end type
type em_2 from editmask within w_informe_xoperador
end type
type em_1 from editmask within w_informe_xoperador
end type
type dw_index from datawindow within w_informe_xoperador
end type
type gb_1 from groupbox within w_informe_xoperador
end type
end forward

global type w_informe_xoperador from window
integer x = 1326
integer y = 652
integer width = 5467
integer height = 2888
boolean titlebar = true
string title = "Estad$$HEX1$$ed00$$ENDHEX$$sitica de operadores (w_informe_xoperador) "
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
sle_2 sle_2
sle_1 sle_1
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
cbx_1 cbx_1
em_2 em_2
em_1 em_1
dw_index dw_index
gb_1 gb_1
end type
global w_informe_xoperador w_informe_xoperador

type variables
string busqueda1, busqueda2
end variables

forward prototypes
public function integer f_update ()
end prototypes

public function integer f_update ();

if cbx_1.checked=true then
	//dw_index.retrieve(g_cod_usuario, em_1.text, em_2.text)
	dw_index.retrieve(g_cod_usuario, sle_1.text, sle_2.text)
else
	//dw_index.retrieve('?',em_1.text, em_2.text)
	dw_index.retrieve('?',sle_1.text, sle_2.text)
	
end if


//close(w_msg)

return 1


end function

on w_informe_xoperador.create
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.cbx_1=create cbx_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_index=create dw_index
this.gb_1=create gb_1
this.Control[]={this.sle_2,&
this.sle_1,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.cbx_1,&
this.em_2,&
this.em_1,&
this.dw_index,&
this.gb_1}
end on

on w_informe_xoperador.destroy
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_index)
destroy(this.gb_1)
end on

event open;//em_1.text=string(datetime(date('01/'+string(month(today()),'00') + '/'+string(year(today()),'0000')),time('00:00')),'dd/mm/yyyy hh:mm')+':00'

//em_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'

//sle_1.text=string(datetime(date('01/'+string(month(today()),'00') + '/'+string(year(today()),'0000')),time('00:00')),'dd/mm/yyyy hh:mm')+':00'

sle_1.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'00:00:00'

sle_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'


busqueda1=''
busqueda2='' /*variables para evitar llamadas a f_update en el evento others del sle_1*/

if g_credenciales<>'SPV' then
	cbx_1.enabled=false
	cbx_1.checked=true
else
	cbx_1.enabled=true
	cbx_1.checked=false
end if

f_update()


//dw_index.retrieve(g_cod_usuario,'?', em_1.text, em_2.text)

end event

type sle_2 from singlelineedit within w_informe_xoperador
integer x = 2272
integer y = 332
integer width = 699
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_informe_xoperador
integer x = 1499
integer y = 332
integer width = 699
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_informe_xoperador
integer x = 187
integer y = 64
integer width = 1906
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "ESTAD$$HEX1$$cd00$$ENDHEX$$STICA DE OPERADORES"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_informe_xoperador
integer x = 3461
integer y = 260
integer width = 343
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Excel"
end type

event clicked;dw_index.SaveAs("", Excel! , TRUE)
end event

type cb_1 from commandbutton within w_informe_xoperador
integer x = 3067
integer y = 264
integer width = 343
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
boolean default = true
end type

event clicked;f_update()
end event

type st_2 from statictext within w_informe_xoperador
integer x = 1504
integer y = 224
integer width = 1458
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Rango de b$$HEX1$$fa00$$ENDHEX$$squeda"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_informe_xoperador
integer x = 183
integer y = 304
integer width = 1161
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 81324524
string text = "Ver solo mis datos"
boolean lefttext = true
end type

event clicked;f_update()
end event

type em_2 from editmask within w_informe_xoperador
boolean visible = false
integer x = 4174
integer y = 380
integer width = 718
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type em_1 from editmask within w_informe_xoperador
boolean visible = false
integer x = 4174
integer y = 260
integer width = 718
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type dw_index from datawindow within w_informe_xoperador
integer x = 155
integer y = 496
integer width = 5088
integer height = 1992
integer taborder = 10
string dataobject = "dw_informes_xoperador"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca2)
end event

event clicked;//THIS.SelectRow(0, FALSE)
//
//THIS.SeLECTRow(row, TRUE)
//
end event

event doubleclicked;long fila
string registro


THIS.SelectRow(0, FALSE)

THIS.SeLECTRow(row, TRUE)


//fila=this.getrow()
//this.scrolltorow(fila)
//
//
//if fila>0 then
//
//
//		registro=this.object.seq[fila]
//		
//		openwithparm(w_consulta_det,registro)
//
//end if
end event

type gb_1 from groupbox within w_informe_xoperador
integer x = 133
integer y = 12
integer width = 5243
integer height = 184
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type


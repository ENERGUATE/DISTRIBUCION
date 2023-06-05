HA$PBExportHeader$w_prog_descargos.srw
forward
global type w_prog_descargos from window
end type
type sle_3 from singlelineedit within w_prog_descargos
end type
type sle_2 from singlelineedit within w_prog_descargos
end type
type st_4 from statictext within w_prog_descargos
end type
type st_3 from statictext within w_prog_descargos
end type
type cb_2 from commandbutton within w_prog_descargos
end type
type cb_1 from commandbutton within w_prog_descargos
end type
type st_2 from statictext within w_prog_descargos
end type
type st_1 from statictext within w_prog_descargos
end type
type sle_1 from singlelineedit within w_prog_descargos
end type
type em_2 from editmask within w_prog_descargos
end type
type em_1 from editmask within w_prog_descargos
end type
type dw_descargos from datawindow within w_prog_descargos
end type
type gb_1 from groupbox within w_prog_descargos
end type
end forward

global type w_prog_descargos from window
integer x = 1326
integer y = 652
integer width = 5467
integer height = 2888
boolean titlebar = true
string title = "Consulta de la programaci$$HEX1$$f300$$ENDHEX$$n de descargos (w_prog_descargos)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
sle_3 sle_3
sle_2 sle_2
st_4 st_4
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
sle_1 sle_1
em_2 em_2
em_1 em_1
dw_descargos dw_descargos
gb_1 gb_1
end type
global w_prog_descargos w_prog_descargos

type variables
string busqueda1, busqueda2
end variables

forward prototypes
public function integer f_update ()
end prototypes

public function integer f_update ();string buscar


//openwithparm(w_msg,"Buscando...")

if sle_1.text='' /*or len(sle_1.text)<= 3*/ then 
	buscar='?' 
else
	buscar='%'+sle_1.text+'%'
	//messagebox('info', buscar)
end if



	
	//dw_descargos.retrieve(buscar, em_1.text,em_2.text)
	
	dw_descargos.retrieve(buscar, sle_2.text, sle_3.text)


//close(w_msg)

return 1


end function

on w_prog_descargos.create
this.sle_3=create sle_3
this.sle_2=create sle_2
this.st_4=create st_4
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_descargos=create dw_descargos
this.gb_1=create gb_1
this.Control[]={this.sle_3,&
this.sle_2,&
this.st_4,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.em_2,&
this.em_1,&
this.dw_descargos,&
this.gb_1}
end on

on w_prog_descargos.destroy
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_descargos)
destroy(this.gb_1)
end on

event open;//em_1.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'00:00:00'

//em_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'

sle_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'00:00:00'

sle_3.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'


busqueda1=''
busqueda2='' /*variables para evitar llamadas a f_update en el evento others del sle_1*/

openwithparm(w_msg, "Cargando...")

//f_update()


dw_descargos.retrieve('?', em_1.text, em_2.text)

cb_1.TriggerEvent(Clicked!)




close(w_msg)

end event

type sle_3 from singlelineedit within w_prog_descargos
integer x = 2075
integer y = 324
integer width = 763
integer height = 100
integer taborder = 90
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

type sle_2 from singlelineedit within w_prog_descargos
integer x = 1298
integer y = 324
integer width = 763
integer height = 100
integer taborder = 80
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

type st_4 from statictext within w_prog_descargos
integer x = 187
integer y = 676
integer width = 891
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Doble click para m$$HEX1$$e100$$ENDHEX$$s informaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type st_3 from statictext within w_prog_descargos
integer x = 187
integer y = 76
integer width = 2217
integer height = 80
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "CONSULTA A LA PROGRAMACI$$HEX1$$d300$$ENDHEX$$N DE DESCARGOS"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_prog_descargos
integer x = 3328
integer y = 524
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

event clicked;dw_descargos.SaveAs("", Excel5! , TRUE)
end event

type cb_1 from commandbutton within w_prog_descargos
integer x = 2935
integer y = 520
integer width = 343
integer height = 144
integer taborder = 60
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

type st_2 from statictext within w_prog_descargos
integer x = 1303
integer y = 224
integer width = 1541
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

type st_1 from statictext within w_prog_descargos
integer x = 197
integer y = 448
integer width = 1129
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "Ingrese texto y presione bot$$HEX1$$f300$$ENDHEX$$n ~"Buscar~":"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_prog_descargos
integer x = 187
integer y = 528
integer width = 2656
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 15780518
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event other;//busqueda1=this.text
//
//if busqueda1<>busqueda2 then  /*solo ejecuta f_update() si la cadena ingresada en sle_1 ha cambiado*/
//	 f_update()
//	 busqueda2=busqueda1
//end if
//
end event

type em_2 from editmask within w_prog_descargos
boolean visible = false
integer x = 4256
integer y = 392
integer width = 718
integer height = 108
integer taborder = 40
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

type em_1 from editmask within w_prog_descargos
boolean visible = false
integer x = 4251
integer y = 264
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

type dw_descargos from datawindow within w_prog_descargos
integer x = 178
integer y = 780
integer width = 5088
integer height = 1860
integer taborder = 10
string dataobject = "dw_open_descargos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event clicked;//THIS.SelectRow(0, FALSE)
//
//THIS.SeLECTRow(row, TRUE)
//
end event

event doubleclicked;long fila
long registro


THIS.SelectRow(0, FALSE)

THIS.SeLECTRow(row, TRUE)


fila=this.getrow()
this.scrolltorow(fila)


if fila>0 then


		registro=this.object.descargo[fila]
		
		openwithparm(w_prog_descargos_det,string(registro))

end if
end event

type gb_1 from groupbox within w_prog_descargos
integer x = 114
integer y = 8
integer width = 5243
integer height = 184
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type


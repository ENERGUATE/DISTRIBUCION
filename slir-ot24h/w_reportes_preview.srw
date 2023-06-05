HA$PBExportHeader$w_reportes_preview.srw
forward
global type w_reportes_preview from w_sgigenerica
end type
type p_2 from picture within w_reportes_preview
end type
type p_1 from picture within w_reportes_preview
end type
type cb_2 from commandbutton within w_reportes_preview
end type
type st_4 from statictext within w_reportes_preview
end type
type cb_1 from commandbutton within w_reportes_preview
end type
type sle_1 from singlelineedit within w_reportes_preview
end type
type gb_1 from groupbox within w_reportes_preview
end type
type dw_1 from u_gen_0000_lista within w_reportes_preview
end type
end forward

global type w_reportes_preview from w_sgigenerica
integer x = 494
integer y = 776
integer width = 2898
integer height = 1132
string title = "Presentacion Preliminar"
windowtype windowtype = response!
long backcolor = 79741120
p_2 p_2
p_1 p_1
cb_2 cb_2
st_4 st_4
cb_1 cb_1
sle_1 sle_1
gb_1 gb_1
dw_1 dw_1
end type
global w_reportes_preview w_reportes_preview

type variables
s_print str_print
string is_picture
integer i_vez=1
end variables

on w_reportes_preview.create
int iCurrent
call super::create
this.p_2=create p_2
this.p_1=create p_1
this.cb_2=create cb_2
this.st_4=create st_4
this.cb_1=create cb_1
this.sle_1=create sle_1
this.gb_1=create gb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_2
this.Control[iCurrent+2]=this.p_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.sle_1
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.dw_1
end on

on w_reportes_preview.destroy
call super::destroy
destroy(this.p_2)
destroy(this.p_1)
destroy(this.cb_2)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;call super::open;string ls_error_create
string ls_colcount
long ll_conta
//w_reportes_preview.x=100
//w_reportes_preview.y=701

//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	01/05/2001  dw_1.Create(message.stringparm, ls_error_create)
//**  OSGI 2001.1  	01/05/2001  w_reportes.dw_1.sharedata(dw_1)
//**  OSGI 2001.1  	01/05/2001  sle_1.text=w_reportes.sle_1.text

window activesheet

activesheet = w_genapp_frame.GetActiveSheet()

dw_1.Create(message.stringparm, ls_error_create)

IF activesheet = w_reportes THEN
	w_reportes.dw_1.sharedata(dw_1)
	sle_1.text=w_reportes.sle_1.text
	str_print.titulo= w_reportes.st_titulo.text
ELSEIF activesheet = w_reportes_new THEN
	w_reportes_new.dw_1.sharedata(dw_1)
	sle_1.text=string(dw_1.RowCount())
	str_print.titulo= w_reportes_new.mle_titulo.text
END IF

str_print.dwprint=dw_1
str_print.PARM1=true

//w_reportes.dw_1.sharedata(dw_1)
//sle_1.text=w_reportes.sle_1.text
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


timer(1.4)
ls_colcount = dw_1.Object.DataWindow.Column.Count
for ll_conta=1 to long(ls_colcount)
	dw_1.settaborder(ll_conta,0)
next
	//        --Francisco Donato Bergia--
end event

event timer;i_vez=Rand(6) 
choose case i_vez
	case 1
	//	p_2.picturename="ojo1.bmp"
	case 2
	//	p_2.picturename="ojo2.bmp"	
	case 3
	//	p_2.picturename="ojo3.bmp"
	case 4
	//	p_2.picturename="ojo4.bmp"
	case 5
	//	p_2.picturename="ojo5.bmp"
	case 6
	//	p_2.picturename="ojo6.bmp"
end choose
//i_vez ++
//if i_vez=7 then i_vez=0

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_reportes_preview
end type

type p_2 from picture within w_reportes_preview
integer x = 2642
integer y = 108
integer width = 87
integer height = 76
string picturename = "BrowseClasses!"
boolean focusrectangle = false
end type

type p_1 from picture within w_reportes_preview
integer x = 2555
integer y = 36
integer width = 219
integer height = 192
string picturename = "DBAdmin!"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_reportes_preview
integer x = 2546
integer y = 544
integer width = 233
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	01/05/2001  	str_print.dwprint=dw_1
//**  OSGI 2001.1  	01/05/2001  	str_print.titulo=w_reportes.st_titulo.text
//**  OSGI 2001.1  	01/05/2001  	str_print.PARM1=true
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

	OpenWithParm(w_print_dialog,str_print)
	
		//        --Francisco Donato Bergia--
end event

type st_4 from statictext within w_reportes_preview
integer x = 2491
integer y = 276
integer width = 325
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Registros Encontrados"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_reportes_preview
integer x = 2546
integer y = 648
integer width = 233
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cerrar"
end type

event clicked;close(parent)

	//        --Francisco Donato Bergia--
end event

type sle_1 from singlelineedit within w_reportes_preview
integer x = 2519
integer y = 408
integer width = 274
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_reportes_preview
integer x = 2482
integer y = 228
integer width = 343
integer height = 272
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
end type

type dw_1 from u_gen_0000_lista within w_reportes_preview
integer x = 23
integer y = 16
integer width = 2427
integer height = 964
integer taborder = 20
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;string ls_nomcab
string ls_nomcol
string ls_tipo= " A"
string ls_sint
string ls_cab

// Se sobreescribe este evento para corregir un error de una externalidad
if dwo.name= "datawindow" OR dwo.name = "titulo" OR dwo.name = "subtitulo" OR &
	dwo.name = "fechaactual" then 
	return 0
END IF

if isvalid(dwo) or not isnull(dwo) then
	ls_cab=string(dwo.band)
	if ls_cab = "header" then	
		ls_nomcab=dwo.name
		ls_sint=ls_nomcab + ".Border='5'"
		this.Modify(ls_sint)
		is_nomcab_borde = ls_nomcab
		ls_nomcol = Mid(ls_nomcab,1 ,len(ls_nomcab) - 2)
		if is_nomcab = ls_nomcab and ii_orden=1 then
			ii_orden=2
			ls_tipo= " D"
			this.SetSort(ls_nomcol + ls_tipo)
		elseif is_nomcab = ls_nomcab and ii_orden=2 then
			ii_orden=1
			ls_tipo= " A"
			this.SetSort(ls_nomcol + ls_tipo)
		elseif is_nomcab <> ls_nomcab then
			ii_orden=1
			ls_tipo = " A"
			this.SetSort(ls_nomcol + ls_tipo)
	//		messagebox("1","nomcab=" + ls_nomcab + "nomcol=" + ls_nomcol + "tipo" + ls_tipo )
			is_nomcab=ls_nomcab
		end if
		this.sort()
	end if
end if

IF ypos > 12 OR ypos < 4  then return 1
IF dwo.name <> 'datawindow' OR row > 0 THEN  return 1



end event


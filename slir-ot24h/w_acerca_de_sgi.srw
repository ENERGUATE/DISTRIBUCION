HA$PBExportHeader$w_acerca_de_sgi.srw
forward
global type w_acerca_de_sgi from w_sgigenerica
end type
type st_1 from statictext within w_acerca_de_sgi
end type
type st_2 from statictext within w_acerca_de_sgi
end type
type st_3 from statictext within w_acerca_de_sgi
end type
type st_4 from statictext within w_acerca_de_sgi
end type
type p_1 from picture within w_acerca_de_sgi
end type
type st_version from statictext within w_acerca_de_sgi
end type
type st_id from statictext within w_acerca_de_sgi
end type
end forward

global type w_acerca_de_sgi from w_sgigenerica
integer x = 1120
integer y = 828
integer width = 1568
integer height = 956
string title = "Acerca del Open SGI"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 8421376
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
p_1 p_1
st_version st_version
st_id st_id
end type
global w_acerca_de_sgi w_acerca_de_sgi

on w_acerca_de_sgi.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.p_1=create p_1
this.st_version=create st_version
this.st_id=create st_id
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.p_1
this.Control[iCurrent+6]=this.st_version
this.Control[iCurrent+7]=this.st_id
end on

on w_acerca_de_sgi.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.p_1)
destroy(this.st_version)
destroy(this.st_id)
end on

event open;call super::open;string ls_version, ls_identificativo

if isvalid(gu_rf_servidor_operacion) then
	gu_rf_servidor_operacion.of_devuelve_version(ls_version,ls_identificativo)
	st_version.text = ls_version
	st_id.text = "Id: "+ ls_identificativo

end if

//AHM (16/06/2011) Cambio de log
//Si no est$$HEX2$$e1002000$$ENDHEX$$activo en el ini el logo de gas natural se muestra el de fenosa
IF  ProfileString("opensgi.ini","OPEN-SGI","gasnaturalfenosa","N") = "SI"  THEN
	st_1.text = 'Este producto ha sido concedido bajo licencia a Gas Natural Fenosa'
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_acerca_de_sgi
end type

type st_1 from statictext within w_acerca_de_sgi
integer x = 110
integer y = 576
integer width = 1573
integer height = 128
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Este producto ha sido concedido bajo licencia a ENERGUATE"
boolean focusrectangle = false
end type

type st_2 from statictext within w_acerca_de_sgi
integer x = 142
integer y = 48
integer width = 983
integer height = 240
boolean bringtotop = true
integer textsize = -36
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Open SGI"
boolean focusrectangle = false
end type

type st_3 from statictext within w_acerca_de_sgi
integer x = 5
integer y = 272
integer width = 1550
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Modulo de Gesti$$HEX1$$f300$$ENDHEX$$n de Incidencias "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_acerca_de_sgi
integer x = 274
integer y = 344
integer width = 1010
integer height = 184
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Sistema Open SGD"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_acerca_de_sgi
integer x = 1184
integer y = 72
integer width = 206
integer height = 180
boolean bringtotop = true
string picturename = "logo_sgd_1.bmp"
boolean focusrectangle = false
end type

type st_version from statictext within w_acerca_de_sgi
integer x = 5
integer y = 432
integer width = 1550
integer height = 96
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = " Versi$$HEX1$$f300$$ENDHEX$$n 2012.1.001"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_id from statictext within w_acerca_de_sgi
integer x = 302
integer y = 768
integer width = 1234
integer height = 76
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Id: 2001220020309"
alignment alignment = right!
boolean focusrectangle = false
end type


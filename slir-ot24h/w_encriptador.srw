HA$PBExportHeader$w_encriptador.srw
forward
global type w_encriptador from w_sgigenerica
end type
type st_3 from statictext within w_encriptador
end type
type st_2 from statictext within w_encriptador
end type
type st_1 from statictext within w_encriptador
end type
type sle_enc2 from singlelineedit within w_encriptador
end type
type st_usuario from statictext within w_encriptador
end type
type cb_2 from commandbutton within w_encriptador
end type
type sle_des2 from singlelineedit within w_encriptador
end type
type st_clave from statictext within w_encriptador
end type
type sle_des1 from singlelineedit within w_encriptador
end type
type sle_enc1 from singlelineedit within w_encriptador
end type
type cb_1 from commandbutton within w_encriptador
end type
type pb_1 from picturebutton within w_encriptador
end type
type pb_2 from picturebutton within w_encriptador
end type
type cb_3 from commandbutton within w_encriptador
end type
type gb_1 from groupbox within w_encriptador
end type
type gb_2 from groupbox within w_encriptador
end type
end forward

global type w_encriptador from w_sgigenerica
integer width = 1321
integer height = 1508
string title = "Encriptador/Desencriptador"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "clave.ico"
st_3 st_3
st_2 st_2
st_1 st_1
sle_enc2 sle_enc2
st_usuario st_usuario
cb_2 cb_2
sle_des2 sle_des2
st_clave st_clave
sle_des1 sle_des1
sle_enc1 sle_enc1
cb_1 cb_1
pb_1 pb_1
pb_2 pb_2
cb_3 cb_3
gb_1 gb_1
gb_2 gb_2
end type
global w_encriptador w_encriptador

on w_encriptador.create
int iCurrent
call super::create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_enc2=create sle_enc2
this.st_usuario=create st_usuario
this.cb_2=create cb_2
this.sle_des2=create sle_des2
this.st_clave=create st_clave
this.sle_des1=create sle_des1
this.sle_enc1=create sle_enc1
this.cb_1=create cb_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.cb_3=create cb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.sle_enc2
this.Control[iCurrent+5]=this.st_usuario
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.sle_des2
this.Control[iCurrent+8]=this.st_clave
this.Control[iCurrent+9]=this.sle_des1
this.Control[iCurrent+10]=this.sle_enc1
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.pb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.gb_2
end on

on w_encriptador.destroy
call super::destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_enc2)
destroy(this.st_usuario)
destroy(this.cb_2)
destroy(this.sle_des2)
destroy(this.st_clave)
destroy(this.sle_des1)
destroy(this.sle_enc1)
destroy(this.cb_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.cb_3)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_encriptador
integer x = 110
integer y = 1248
end type

type st_3 from statictext within w_encriptador
integer x = 192
integer y = 44
integer width = 914
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 134217729
long backcolor = 67108864
string text = "Encriptador/Desencriptador"
boolean focusrectangle = false
end type

type st_2 from statictext within w_encriptador
integer x = 119
integer y = 984
integer width = 475
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clave Desencriptada:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_encriptador
integer x = 119
integer y = 856
integer width = 379
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clave Encriptada"
boolean focusrectangle = false
end type

type sle_enc2 from singlelineedit within w_encriptador
integer x = 594
integer y = 824
integer width = 498
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_usuario from statictext within w_encriptador
integer x = 119
integer y = 280
integer width = 475
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clave Desencriptada:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_encriptador
integer x = 110
integer y = 1088
integer width = 343
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Desencriptar"
end type

event clicked;string ls_clave

ls_clave = fg_desencriptar(sle_enc2.text)

IF ls_clave = '' THEN
	MessageBox("Error","La clave no pudo ser desencriptada, verifique y vuelva a intentar", StopSign!)
END IF

sle_des2.text = ls_clave
end event

type sle_des2 from singlelineedit within w_encriptador
integer x = 594
integer y = 948
integer width = 498
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_clave from statictext within w_encriptador
integer x = 119
integer y = 408
integer width = 393
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clave Encriptada:"
boolean focusrectangle = false
end type

type sle_des1 from singlelineedit within w_encriptador
integer x = 594
integer y = 248
integer width = 498
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_enc1 from singlelineedit within w_encriptador
integer x = 594
integer y = 376
integer width = 498
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_encriptador
integer x = 110
integer y = 512
integer width = 343
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Encriptar"
end type

event clicked;string ls_clave

ls_clave = fg_encriptar(sle_des1.text)

sle_enc1.text = ls_clave
end event

type pb_1 from picturebutton within w_encriptador
integer x = 1097
integer y = 952
integer width = 101
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
string picturename = "Custom092!"
alignment htextalign = left!
string powertiptext = "Copiar texto"
end type

event clicked;string ls_data

ls_data = sle_des2.text

Clipboard(ls_data)
end event

type pb_2 from picturebutton within w_encriptador
integer x = 1097
integer y = 384
integer width = 101
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
boolean originalsize = true
string picturename = "Custom092!"
alignment htextalign = left!
string powertiptext = "Copiar texto"
end type

event clicked;string ls_data

ls_data = sle_enc1.text

Clipboard(ls_data)
end event

type cb_3 from commandbutton within w_encriptador
integer x = 878
integer y = 1248
integer width = 343
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Salir"
end type

event clicked;close(parent)
end event

type gb_1 from groupbox within w_encriptador
integer x = 73
integer y = 160
integer width = 1170
integer height = 480
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Encriptar"
end type

type gb_2 from groupbox within w_encriptador
integer x = 73
integer y = 736
integer width = 1170
integer height = 480
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desencriptar"
end type


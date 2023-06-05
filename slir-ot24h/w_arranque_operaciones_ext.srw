HA$PBExportHeader$w_arranque_operaciones_ext.srw
forward
global type w_arranque_operaciones_ext from w_arranque_operaciones
end type
type st_version_ext from statictext within w_arranque_operaciones_ext
end type
type p_bmp_ext from picture within w_arranque_operaciones_ext
end type
type st_titulo_1_ext from statictext within w_arranque_operaciones_ext
end type
type st_titulo_2_ext from statictext within w_arranque_operaciones_ext
end type
type p_2 from picture within w_arranque_operaciones_ext
end type
end forward

global type w_arranque_operaciones_ext from w_arranque_operaciones
integer width = 1344
integer height = 1588
long backcolor = 81324524
st_version_ext st_version_ext
p_bmp_ext p_bmp_ext
st_titulo_1_ext st_titulo_1_ext
st_titulo_2_ext st_titulo_2_ext
p_2 p_2
end type
global w_arranque_operaciones_ext w_arranque_operaciones_ext

on w_arranque_operaciones_ext.create
int iCurrent
call super::create
this.st_version_ext=create st_version_ext
this.p_bmp_ext=create p_bmp_ext
this.st_titulo_1_ext=create st_titulo_1_ext
this.st_titulo_2_ext=create st_titulo_2_ext
this.p_2=create p_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_version_ext
this.Control[iCurrent+2]=this.p_bmp_ext
this.Control[iCurrent+3]=this.st_titulo_1_ext
this.Control[iCurrent+4]=this.st_titulo_2_ext
this.Control[iCurrent+5]=this.p_2
end on

on w_arranque_operaciones_ext.destroy
call super::destroy
destroy(this.st_version_ext)
destroy(this.p_bmp_ext)
destroy(this.st_titulo_1_ext)
destroy(this.st_titulo_2_ext)
destroy(this.p_2)
end on

event open;call super::open;if isvalid(this) then st_version_ext.Text = ProfileString("opensgi.ini","EXTERNALIDAD","version","Versi$$HEX1$$f300$$ENDHEX$$n 2001.1")

//AHM (16/06/2011) Cambio de logo
//Si no est$$HEX2$$e1002000$$ENDHEX$$activo en el ini el logo de gas natural se muestra el de fenosa
IF ProfileString("opensgi.ini","OPEN-SGI","gasnaturalfenosa","NO") = "SI" THEN
	p_bmp_ext.visible = FALSE
ELSE
	p_2.visible = FALSE
END IF
end event

type cb_2 from w_arranque_operaciones`cb_2 within w_arranque_operaciones_ext
end type

type st_8 from w_arranque_operaciones`st_8 within w_arranque_operaciones_ext
end type

type st_7 from w_arranque_operaciones`st_7 within w_arranque_operaciones_ext
boolean visible = false
end type

type st_6 from w_arranque_operaciones`st_6 within w_arranque_operaciones_ext
end type

type st_3 from w_arranque_operaciones`st_3 within w_arranque_operaciones_ext
end type

type p_1 from w_arranque_operaciones`p_1 within w_arranque_operaciones_ext
end type

type p_uf from w_arranque_operaciones`p_uf within w_arranque_operaciones_ext
boolean visible = false
end type

type st_2 from w_arranque_operaciones`st_2 within w_arranque_operaciones_ext
boolean visible = false
end type

type cb_3 from w_arranque_operaciones`cb_3 within w_arranque_operaciones_ext
integer x = 800
integer y = 1268
end type

type cb_1 from w_arranque_operaciones`cb_1 within w_arranque_operaciones_ext
integer x = 165
integer y = 1268
end type

type st_1 from w_arranque_operaciones`st_1 within w_arranque_operaciones_ext
boolean visible = false
end type

type oval_1 from w_arranque_operaciones`oval_1 within w_arranque_operaciones_ext
end type

type st_5 from w_arranque_operaciones`st_5 within w_arranque_operaciones_ext
integer x = 178
integer y = 612
integer width = 983
integer height = 488
fontcharset fontcharset = ansi!
long backcolor = 81324524
end type

type st_4 from w_arranque_operaciones`st_4 within w_arranque_operaciones_ext
integer x = 178
integer y = 612
integer width = 983
integer height = 488
fontcharset fontcharset = ansi!
long backcolor = 81324524
end type

type d_usuario from w_arranque_operaciones`d_usuario within w_arranque_operaciones_ext
integer x = 178
integer y = 612
integer width = 983
integer height = 488
string dataobject = "d_2001_pr_ingreso_usuario_ext"
end type

type sle_nuevaclave from w_arranque_operaciones`sle_nuevaclave within w_arranque_operaciones_ext
end type

type st_version_ext from statictext within w_arranque_operaciones_ext
integer x = 617
integer y = 1408
integer width = 681
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 32768
long backcolor = 81324524
boolean enabled = false
string text = "Versi$$HEX1$$f300$$ENDHEX$$n: 1999.1"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_bmp_ext from picture within w_arranque_operaciones_ext
integer x = 155
integer y = 16
integer width = 987
integer height = 196
boolean originalsize = true
string picturename = "uf_corporativo.bmp"
boolean focusrectangle = false
end type

type st_titulo_1_ext from statictext within w_arranque_operaciones_ext
integer y = 204
integer width = 1339
integer height = 196
boolean bringtotop = true
integer textsize = -22
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 32768
long backcolor = 81324524
boolean enabled = false
string text = "S.G.I."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_titulo_2_ext from statictext within w_arranque_operaciones_ext
integer y = 352
integer width = 1339
integer height = 220
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 81324524
boolean enabled = false
string text = "Sistema de Gesti$$HEX1$$f300$$ENDHEX$$n de Incidencias"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_2 from picture within w_arranque_operaciones_ext
integer x = 421
integer y = 4
integer width = 457
integer height = 204
boolean bringtotop = true
string picturename = "gasNaturalFenosa.BMP"
boolean focusrectangle = false
end type


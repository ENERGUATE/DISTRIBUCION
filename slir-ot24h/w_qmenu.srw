HA$PBExportHeader$w_qmenu.srw
forward
global type w_qmenu from window
end type
type st_19 from statictext within w_qmenu
end type
type st_17 from statictext within w_qmenu
end type
type st_14 from statictext within w_qmenu
end type
type st_13 from statictext within w_qmenu
end type
type st_12 from statictext within w_qmenu
end type
type st_11 from statictext within w_qmenu
end type
type st_usuario from statictext within w_qmenu
end type
type st_10 from statictext within w_qmenu
end type
type st_8 from statictext within w_qmenu
end type
type st_7 from statictext within w_qmenu
end type
type st_6 from statictext within w_qmenu
end type
type st_5 from statictext within w_qmenu
end type
type st_4 from statictext within w_qmenu
end type
type st_3 from statictext within w_qmenu
end type
type st_2 from statictext within w_qmenu
end type
type st_1 from statictext within w_qmenu
end type
end forward

global type w_qmenu from window
integer x = 1326
integer y = 652
integer width = 1417
integer height = 1700
boolean titlebar = true
string title = "Bienvenid@ (w_qmenu)"
boolean controlmenu = true
long backcolor = 15793151
st_19 st_19
st_17 st_17
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_usuario st_usuario
st_10 st_10
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_qmenu w_qmenu

on w_qmenu.create
this.st_19=create st_19
this.st_17=create st_17
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_usuario=create st_usuario
this.st_10=create st_10
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.st_19,&
this.st_17,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_usuario,&
this.st_10,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_qmenu.destroy
destroy(this.st_19)
destroy(this.st_17)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_usuario)
destroy(this.st_10)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;long contador

st_10.visible=false
st_2.visible=false
st_3.visible=false
st_4.visible=false


st_usuario.text=g_nombre


select count(*)
into :contador
from registro
where cod_usuario=:g_cod_usuario
and fecha_resolucion is null
using sqlca2;


if contador<=0 then
	
	//messagebox(string(sqlca.sqlcode), SQLCA.SQLErrText)
else
		
	st_10.visible=true
	st_2.visible=true
	st_3.visible=true
	st_4.visible=true
	st_10.text=string(contador)
	
end if
	
end event

type st_19 from statictext within w_qmenu
integer x = 151
integer y = 996
integer width = 78
integer height = 96
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 32768
long backcolor = 33554431
boolean enabled = false
string text = ">"
boolean focusrectangle = false
end type

type st_17 from statictext within w_qmenu
integer x = 242
integer y = 1024
integer width = 645
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 33554431
string text = "Resolver registros"
boolean focusrectangle = false
end type

event clicked;OpenSheet (w_resolucion, w_genapp_frame, menu, layered!)
close(parent)
end event

type st_14 from statictext within w_qmenu
integer x = 151
integer y = 1112
integer width = 78
integer height = 96
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 32768
long backcolor = 33554431
boolean enabled = false
string text = ">"
boolean focusrectangle = false
end type

type st_13 from statictext within w_qmenu
integer x = 151
integer y = 888
integer width = 78
integer height = 96
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 32768
long backcolor = 33554431
boolean enabled = false
string text = ">"
boolean focusrectangle = false
end type

type st_12 from statictext within w_qmenu
integer x = 151
integer y = 772
integer width = 78
integer height = 96
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 32768
long backcolor = 33554431
boolean enabled = false
string text = ">"
boolean focusrectangle = false
end type

type st_11 from statictext within w_qmenu
integer x = 151
integer y = 672
integer width = 78
integer height = 96
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 32768
long backcolor = 33554431
boolean enabled = false
string text = ">"
boolean focusrectangle = false
end type

type st_usuario from statictext within w_qmenu
integer x = 119
integer y = 136
integer width = 1193
integer height = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_10 from statictext within w_qmenu
integer x = 357
integer y = 348
integer width = 283
integer height = 116
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_qmenu
integer x = 242
integer y = 1136
integer width = 1033
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 33554431
string text = "Consultar programaci$$HEX1$$f300$$ENDHEX$$n de descargos"
boolean focusrectangle = false
end type

event clicked;OpenSheet (w_prog_descargos, w_genapp_frame, menu, layered!)
close(parent)
end event

type st_7 from statictext within w_qmenu
integer x = 242
integer y = 912
integer width = 645
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 33554431
string text = "Consulta de avisos SGI"
boolean focusrectangle = false
end type

event clicked;OpenSheet (w_avisos, w_genapp_frame, menu, layered!)
close(parent)
end event

type st_6 from statictext within w_qmenu
integer x = 242
integer y = 800
integer width = 896
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 33554431
string text = "Consulta de llamadas capturadas"
boolean focusrectangle = false
end type

event clicked;OpenSheet (w_consulta, w_genapp_frame, menu, layered!)
close(parent)
end event

type st_5 from statictext within w_qmenu
integer x = 242
integer y = 688
integer width = 558
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 33554431
string text = "Captura de llamadas"
boolean focusrectangle = false
end type

event clicked;OpenSheet (w_frontend, w_genapp_frame, menu, layered!)
close(parent)
end event

type st_4 from statictext within w_qmenu
integer x = 123
integer y = 468
integer width = 983
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 33554431
string text = "Presiona aqu$$HEX2$$ed002000$$ENDHEX$$para resolverlos ahora"
boolean focusrectangle = false
end type

event clicked;OpenSheet (w_resolucion, w_genapp_frame, menu, layered!)
close(parent)
end event

type st_3 from statictext within w_qmenu
integer x = 654
integer y = 376
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "registros sin resolver."
boolean focusrectangle = false
end type

type st_2 from statictext within w_qmenu
integer x = 123
integer y = 376
integer width = 256
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Tienes "
boolean focusrectangle = false
end type

type st_1 from statictext within w_qmenu
integer x = 119
integer y = 72
integer width = 530
integer height = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "Bienvenid@ "
boolean focusrectangle = false
end type


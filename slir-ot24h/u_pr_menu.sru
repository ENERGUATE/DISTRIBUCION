HA$PBExportHeader$u_pr_menu.sru
forward
global type u_pr_menu from userobject
end type
type st_8 from statictext within u_pr_menu
end type
type p_7 from picture within u_pr_menu
end type
type p_6 from picture within u_pr_menu
end type
type p_5 from picture within u_pr_menu
end type
type st_7 from statictext within u_pr_menu
end type
type st_6 from statictext within u_pr_menu
end type
type st_5 from statictext within u_pr_menu
end type
type p_4 from picture within u_pr_menu
end type
type p_3 from picture within u_pr_menu
end type
type p_2 from picture within u_pr_menu
end type
type p_1 from picture within u_pr_menu
end type
type st_4 from statictext within u_pr_menu
end type
type st_3 from statictext within u_pr_menu
end type
type st_2 from statictext within u_pr_menu
end type
type st_1 from statictext within u_pr_menu
end type
type gb_1 from groupbox within u_pr_menu
end type
end forward

global type u_pr_menu from userobject
integer width = 1143
integer height = 692
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_8 st_8
p_7 p_7
p_6 p_6
p_5 p_5
st_7 st_7
st_6 st_6
st_5 st_5
p_4 p_4
p_3 p_3
p_2 p_2
p_1 p_1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global u_pr_menu u_pr_menu

on u_pr_menu.create
this.st_8=create st_8
this.p_7=create p_7
this.p_6=create p_6
this.p_5=create p_5
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.p_4=create p_4
this.p_3=create p_3
this.p_2=create p_2
this.p_1=create p_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.st_8,&
this.p_7,&
this.p_6,&
this.p_5,&
this.st_7,&
this.st_6,&
this.st_5,&
this.p_4,&
this.p_3,&
this.p_2,&
this.p_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_1}
end on

on u_pr_menu.destroy
destroy(this.st_8)
destroy(this.p_7)
destroy(this.p_6)
destroy(this.p_5)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

type st_8 from statictext within u_pr_menu
integer x = 219
integer y = 380
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Informe de Descargos"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type p_7 from picture within u_pr_menu
integer x = 78
integer y = 376
integer width = 73
integer height = 64
boolean enabled = false
boolean originalsize = true
string picturename = "descargo.bmp"
boolean focusrectangle = false
end type

type p_6 from picture within u_pr_menu
integer x = 78
integer y = 520
integer width = 78
integer height = 68
string picturename = "Instalac.bmp"
boolean focusrectangle = false
end type

type p_5 from picture within u_pr_menu
integer x = 78
integer y = 448
integer width = 73
integer height = 64
string picturename = "brigada4.bmp"
boolean focusrectangle = false
end type

type st_7 from statictext within u_pr_menu
integer x = 219
integer y = 524
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Informe de Instalaciones"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type st_6 from statictext within u_pr_menu
integer x = 219
integer y = 452
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Informe de Brigadas"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type st_5 from statictext within u_pr_menu
integer x = 219
integer y = 448
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Informe de Brigadas"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type p_4 from picture within u_pr_menu
integer x = 78
integer y = 160
integer width = 73
integer height = 64
string picturename = "ab_pref.bmp"
boolean focusrectangle = false
end type

type p_3 from picture within u_pr_menu
integer x = 78
integer y = 232
integer width = 73
integer height = 64
string picturename = "ab_avi.bmp"
boolean focusrectangle = false
end type

type p_2 from picture within u_pr_menu
integer x = 78
integer y = 304
integer width = 73
integer height = 64
string picturename = "ab_inc.bmp"
boolean focusrectangle = false
end type

type p_1 from picture within u_pr_menu
integer x = 78
integer y = 92
integer width = 91
integer height = 60
string picturename = "Carp_ab_G.bmp"
boolean focusrectangle = false
end type

type st_4 from statictext within u_pr_menu
integer x = 219
integer y = 308
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Informe de Incidencias"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type st_3 from statictext within u_pr_menu
integer x = 219
integer y = 236
integer width = 512
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Informe de Avisos"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type st_2 from statictext within u_pr_menu
integer x = 219
integer y = 164
integer width = 453
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Abrir Preferencia"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type st_1 from statictext within u_pr_menu
integer x = 219
integer y = 92
integer width = 453
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Abrir Informe"
long bordercolor = 8421504
boolean focusrectangle = false
end type

type gb_1 from groupbox within u_pr_menu
integer x = 37
integer width = 1061
integer height = 640
integer taborder = 1
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
string text = "Seleccione en el men$$HEX2$$fa002000$$ENDHEX$$superior..."
end type


HA$PBExportHeader$w_configuracion_datos_genericos.srw
forward
global type w_configuracion_datos_genericos from window
end type
type tab_1 from tab within w_configuracion_datos_genericos
end type
type tabpage_1 from userobject within tab_1
end type
type uo_1 from u_config_parametros_genericos_scic within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
uo_1 uo_1
gb_2 gb_2
end type
type tabpage_2 from userobject within tab_1
end type
type uo_2 from u_config_activos_datos_scic within tabpage_2
end type
type gb_3 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
uo_2 uo_2
gb_3 gb_3
end type
type tabpage_3 from userobject within tab_1
end type
type uo_6 from u_config_mhai_grupos_de_activos within tabpage_3
end type
type uo_5 from u_config_mhai_activos within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type st_1 from statictext within tabpage_3
end type
type gb_4 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
uo_6 uo_6
uo_5 uo_5
st_3 st_3
st_2 st_2
st_1 st_1
gb_4 gb_4
end type
type tabpage_4 from userobject within tab_1
end type
type uo_3 from u_config_coste_incremental_energia within tabpage_4
end type
type st_4 from statictext within tabpage_4
end type
type gb_5 from groupbox within tabpage_4
end type
type tabpage_4 from userobject within tab_1
uo_3 uo_3
st_4 st_4
gb_5 gb_5
end type
type tabpage_5 from userobject within tab_1
end type
type uo_4 from u_config_indicadores_referencia within tabpage_5
end type
type gb_1 from groupbox within tabpage_5
end type
type tabpage_5 from userobject within tab_1
uo_4 uo_4
gb_1 gb_1
end type
type tab_1 from tab within w_configuracion_datos_genericos
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
end forward

global type w_configuracion_datos_genericos from window
integer width = 3547
integer height = 2000
boolean titlebar = true
string title = "OPEN SGI - Configuraci$$HEX1$$f300$$ENDHEX$$n de par$$HEX1$$e100$$ENDHEX$$metros"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_configuracion_datos_genericos w_configuracion_datos_genericos

type variables
string is_virgin_datawindow
end variables

on w_configuracion_datos_genericos.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_configuracion_datos_genericos.destroy
destroy(this.tab_1)
end on

type tab_1 from tab within w_configuracion_datos_genericos
integer x = 160
integer y = 68
integer width = 3264
integer height = 1800
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3227
integer height = 1684
long backcolor = 67108864
string text = "Datos gen$$HEX1$$e900$$ENDHEX$$ricos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_1 uo_1
gb_2 gb_2
end type

on tabpage_1.create
this.uo_1=create uo_1
this.gb_2=create gb_2
this.Control[]={this.uo_1,&
this.gb_2}
end on

on tabpage_1.destroy
destroy(this.uo_1)
destroy(this.gb_2)
end on

type uo_1 from u_config_parametros_genericos_scic within tabpage_1
integer x = 165
integer y = 64
integer height = 1552
integer taborder = 30
end type

on uo_1.destroy
call u_config_parametros_genericos_scic::destroy
end on

type gb_2 from groupbox within tabpage_1
integer x = 46
integer y = 20
integer width = 3127
integer height = 1624
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3227
integer height = 1684
long backcolor = 67108864
string text = "Coste de los Activos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_2 uo_2
gb_3 gb_3
end type

on tabpage_2.create
this.uo_2=create uo_2
this.gb_3=create gb_3
this.Control[]={this.uo_2,&
this.gb_3}
end on

on tabpage_2.destroy
destroy(this.uo_2)
destroy(this.gb_3)
end on

type uo_2 from u_config_activos_datos_scic within tabpage_2
integer x = 133
integer y = 52
integer taborder = 50
end type

on uo_2.destroy
call u_config_activos_datos_scic::destroy
end on

type gb_3 from groupbox within tabpage_2
integer x = 46
integer y = 20
integer width = 3127
integer height = 1624
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3227
integer height = 1684
long backcolor = 67108864
string text = "M H A I A"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_6 uo_6
uo_5 uo_5
st_3 st_3
st_2 st_2
st_1 st_1
gb_4 gb_4
end type

on tabpage_3.create
this.uo_6=create uo_6
this.uo_5=create uo_5
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_4=create gb_4
this.Control[]={this.uo_6,&
this.uo_5,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_4}
end on

on tabpage_3.destroy
destroy(this.uo_6)
destroy(this.uo_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_4)
end on

type uo_6 from u_config_mhai_grupos_de_activos within tabpage_3
integer x = 1646
integer y = 204
integer width = 1472
integer height = 1424
integer taborder = 30
end type

on uo_6.destroy
call u_config_mhai_grupos_de_activos::destroy
end on

type uo_5 from u_config_mhai_activos within tabpage_3
integer x = 69
integer y = 204
integer width = 1472
integer height = 1424
integer taborder = 30
end type

on uo_5.destroy
call u_config_mhai_activos::destroy
end on

type st_3 from statictext within tabpage_3
integer x = 805
integer y = 60
integer width = 1490
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "M$$HEX1$$e100$$ENDHEX$$ximas Horas Anuales de Indisponibilidad Acumulada"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_3
integer x = 2071
integer y = 140
integer width = 745
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "GRUPOS DE ACTIVOS"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_3
integer x = 590
integer y = 140
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "ACTIVOS"
boolean focusrectangle = false
end type

type gb_4 from groupbox within tabpage_3
integer x = 46
integer y = 20
integer width = 3127
integer height = 1624
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3227
integer height = 1684
long backcolor = 67108864
string text = "Coste de Energ$$HEX1$$ed00$$ENDHEX$$a"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_3 uo_3
st_4 st_4
gb_5 gb_5
end type

on tabpage_4.create
this.uo_3=create uo_3
this.st_4=create st_4
this.gb_5=create gb_5
this.Control[]={this.uo_3,&
this.st_4,&
this.gb_5}
end on

on tabpage_4.destroy
destroy(this.uo_3)
destroy(this.st_4)
destroy(this.gb_5)
end on

type uo_3 from u_config_coste_incremental_energia within tabpage_4
integer x = 165
integer y = 124
integer width = 2880
integer height = 1484
integer taborder = 50
end type

on uo_3.destroy
call u_config_coste_incremental_energia::destroy
end on

type st_4 from statictext within tabpage_4
integer x = 814
integer y = 60
integer width = 1554
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Coste Incremental Operativo de Racionamiento de Energ$$HEX1$$ed00$$ENDHEX$$a"
boolean focusrectangle = false
end type

type gb_5 from groupbox within tabpage_4
integer x = 46
integer y = 20
integer width = 3127
integer height = 1624
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_5 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 100
integer width = 3227
integer height = 1684
long backcolor = 67108864
string text = "Indicadores de Referencia"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_4 uo_4
gb_1 gb_1
end type

on tabpage_5.create
this.uo_4=create uo_4
this.gb_1=create gb_1
this.Control[]={this.uo_4,&
this.gb_1}
end on

on tabpage_5.destroy
destroy(this.uo_4)
destroy(this.gb_1)
end on

type uo_4 from u_config_indicadores_referencia within tabpage_5
integer x = 151
integer y = 64
integer taborder = 50
end type

on uo_4.destroy
call u_config_indicadores_referencia::destroy
end on

type gb_1 from groupbox within tabpage_5
integer x = 46
integer y = 20
integer width = 3127
integer height = 1624
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type


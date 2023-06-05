HA$PBExportHeader$w_2303_historico_de_reenganches.srw
forward
global type w_2303_historico_de_reenganches from w_sgigenerica
end type
type st_1 from statictext within w_2303_historico_de_reenganches
end type
type sle_1 from singlelineedit within w_2303_historico_de_reenganches
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2303_historico_de_reenganches
end type
type rb_maniobras from radiobutton within w_2303_historico_de_reenganches
end type
type rb_interrupciones from radiobutton within w_2303_historico_de_reenganches
end type
type dw_datos_reenganche from datawindow within w_2303_historico_de_reenganches
end type
type st_titulo from statictext within w_2303_historico_de_reenganches
end type
type dw_lista_maniobras from u_inc_2052_lista_maniobras within w_2303_historico_de_reenganches
end type
type gb_2 from groupbox within w_2303_historico_de_reenganches
end type
type gb_1 from groupbox within w_2303_historico_de_reenganches
end type
end forward

global type w_2303_historico_de_reenganches from w_sgigenerica
integer x = 5
integer y = 148
integer width = 3657
integer height = 2120
string title = "OPEN SGI - Detalle de Reenganches"
windowtype windowtype = response!
string icon = "reenganche.ico"
st_1 st_1
sle_1 sle_1
d_ambito d_ambito
rb_maniobras rb_maniobras
rb_interrupciones rb_interrupciones
dw_datos_reenganche dw_datos_reenganche
st_titulo st_titulo
dw_lista_maniobras dw_lista_maniobras
gb_2 gb_2
gb_1 gb_1
end type
global w_2303_historico_de_reenganches w_2303_historico_de_reenganches

type variables
u_generico_comunicaciones  iu_gen_comunic_w_2303
end variables

on w_2303_historico_de_reenganches.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_1=create sle_1
this.d_ambito=create d_ambito
this.rb_maniobras=create rb_maniobras
this.rb_interrupciones=create rb_interrupciones
this.dw_datos_reenganche=create dw_datos_reenganche
this.st_titulo=create st_titulo
this.dw_lista_maniobras=create dw_lista_maniobras
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.d_ambito
this.Control[iCurrent+4]=this.rb_maniobras
this.Control[iCurrent+5]=this.rb_interrupciones
this.Control[iCurrent+6]=this.dw_datos_reenganche
this.Control[iCurrent+7]=this.st_titulo
this.Control[iCurrent+8]=this.dw_lista_maniobras
this.Control[iCurrent+9]=this.gb_2
this.Control[iCurrent+10]=this.gb_1
end on

on w_2303_historico_de_reenganches.destroy
call super::destroy
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.d_ambito)
destroy(this.rb_maniobras)
destroy(this.rb_interrupciones)
destroy(this.dw_datos_reenganche)
destroy(this.st_titulo)
destroy(this.dw_lista_maniobras)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: open w_2303_consulta_de_reenganches
//
// Objetivo: Recibo el c$$HEX1$$f300$$ENDHEX$$digo de reenganche como par$$HEX1$$e100$$ENDHEX$$metro y recupero los datos de los reenganches y las maniobras.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            	Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------        		------------------            	 --------------
// 13/12/2000	    	FDO
//		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////////
int li_filas

iu_gen_comunic_w_2303 = CREATE u_generico_comunicaciones 

iu_gen_comunic_w_2303.is_comunic  = gu_comunic.is_comunic

dw_lista_maniobras.settransobject(sqlca)

dw_lista_maniobras.reset()

dw_lista_maniobras.retrieve(iu_gen_comunic_w_2303.is_comunic.longval1)

dw_datos_reenganche.settransobject(sqlca)

dw_datos_reenganche.retrieve(iu_gen_comunic_w_2303.is_comunic.longval1)

d_ambito.fpr_crea_dddw()
d_ambito.f_insertar_fila()


d_ambito.object.nro_centro[1] = dw_datos_reenganche.object.nro_centro[1]
d_ambito.object.nro_cmd[1] = dw_datos_reenganche.object.nro_cmd[1]
d_ambito.object.nro_mesa[1] = dw_datos_reenganche.object.nro_mesa[1]

d_ambito.fnu_des_centro()
d_ambito.fnu_des_cmd()
d_ambito.fnu_des_puesto()

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2303_historico_de_reenganches
end type

type st_1 from statictext within w_2303_historico_de_reenganches
integer x = 2560
integer y = 720
integer width = 773
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Registros Recuperados"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_2303_historico_de_reenganches
integer x = 3333
integer y = 712
integer width = 187
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2303_historico_de_reenganches
integer x = 2546
integer y = 76
integer width = 1006
integer height = 392
integer taborder = 30
boolean border = false
end type

type rb_maniobras from radiobutton within w_2303_historico_de_reenganches
integer x = 2587
integer y = 504
integer width = 910
integer height = 76
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado de maniobras"
boolean checked = true
boolean lefttext = true
end type

event clicked;dw_lista_maniobras.dataobject = 'd_hist_maniobras_reen'

dw_lista_maniobras.settransobject(sqlca)

dw_lista_maniobras.retrieve(iu_gen_comunic_w_2303.is_comunic.longval1)

 st_titulo.text = ' Listado de maniobras.'
end event

type rb_interrupciones from radiobutton within w_2303_historico_de_reenganches
integer x = 2587
integer y = 596
integer width = 910
integer height = 76
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado de interrupciones"
boolean lefttext = true
end type

event clicked;dw_lista_maniobras.dataobject= 'd_hist_interrupciones_operacion_reen'

dw_lista_maniobras.settransobject(sqlca)

dw_lista_maniobras.retrieve(iu_gen_comunic_w_2303.is_comunic.longval1)

 st_titulo.text = ' Listado de interrupciones.'
end event

type dw_datos_reenganche from datawindow within w_2303_historico_de_reenganches
integer x = 73
integer y = 108
integer width = 1906
integer height = 704
integer taborder = 20
string dataobject = "d_detalle_hist_reenganches"
boolean border = false
boolean livescroll = true
end type

type st_titulo from statictext within w_2303_historico_de_reenganches
integer x = 32
integer y = 872
integer width = 3552
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 8421504
boolean enabled = false
string text = " Listado de maniobras."
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista_maniobras from u_inc_2052_lista_maniobras within w_2303_historico_de_reenganches
integer x = 32
integer y = 944
integer width = 3557
integer height = 1020
integer taborder = 40
string dataobject = "d_hist_maniobras_reen"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event retrieverow;call super::retrieverow;sle_1.text = string(this.rowcount())
end event

type gb_2 from groupbox within w_2303_historico_de_reenganches
integer x = 2560
integer y = 440
integer width = 960
integer height = 256
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_2303_historico_de_reenganches
integer x = 37
integer y = 36
integer width = 3547
integer height = 804
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Datos del Reenganche"
end type


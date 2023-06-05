HA$PBExportHeader$w_generica_peticion_impresion.srw
$PBExportComments$PM013.JCC. Ventana preliminar a la impresi$$HEX1$$f300$$ENDHEX$$n indicando el n$$HEX1$$fa00$$ENDHEX$$mero de copias y si quiere realizar una impresi$$HEX1$$f300$$ENDHEX$$n preliminar o no.
forward
global type w_generica_peticion_impresion from w_sgigenerica
end type
type st_15 from statictext within w_generica_peticion_impresion
end type
type st_14 from statictext within w_generica_peticion_impresion
end type
type st_13 from statictext within w_generica_peticion_impresion
end type
type st_4 from statictext within w_generica_peticion_impresion
end type
type st_3 from statictext within w_generica_peticion_impresion
end type
type st_2 from statictext within w_generica_peticion_impresion
end type
type st_1 from statictext within w_generica_peticion_impresion
end type
type cb_presentacion_preliminar from u_cb within w_generica_peticion_impresion
end type
type em_numero_copias from editmask within w_generica_peticion_impresion
end type
type cb_cancelar from u_cb within w_generica_peticion_impresion
end type
type cb_aceptar from u_cb within w_generica_peticion_impresion
end type
type r_5 from rectangle within w_generica_peticion_impresion
end type
type r_4 from rectangle within w_generica_peticion_impresion
end type
type r_12 from rectangle within w_generica_peticion_impresion
end type
type r_1 from rectangle within w_generica_peticion_impresion
end type
type r_2 from rectangle within w_generica_peticion_impresion
end type
type r_3 from rectangle within w_generica_peticion_impresion
end type
type r_11 from rectangle within w_generica_peticion_impresion
end type
type r_10 from rectangle within w_generica_peticion_impresion
end type
end forward

global type w_generica_peticion_impresion from w_sgigenerica
integer x = 914
integer y = 916
integer width = 1847
integer height = 596
string title = "Imprimir..."
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
st_15 st_15
st_14 st_14
st_13 st_13
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_presentacion_preliminar cb_presentacion_preliminar
em_numero_copias em_numero_copias
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
r_5 r_5
r_4 r_4
r_12 r_12
r_1 r_1
r_2 r_2
r_3 r_3
r_11 r_11
r_10 r_10
end type
global w_generica_peticion_impresion w_generica_peticion_impresion

type variables
// VARIABLES //
// Guarda el valor de vuelta de la ventana
// Valores:
// "-1" : Se cancel$$HEX2$$f3002000$$ENDHEX$$la impresi$$HEX1$$f300$$ENDHEX$$n
// "VXXX" : Presentaci$$HEX1$$f300$$ENDHEX$$n preliminar con un n$$HEX1$$fa00$$ENDHEX$$mero de 
// copias XXX
// "AXXX": Impresi$$HEX1$$f300$$ENDHEX$$n sin presentaci$$HEX1$$f300$$ENDHEX$$n preliminar con un
// n$$HEX1$$fa00$$ENDHEX$$mero de copias XXX
string is_Valor_Retorno = ""
end variables

event open;call super::open;////////////////////////////////////////////////////////////////////////
//
// Evento:	open para w_generica_peticion_impresion
//
// Objetivo:	Se trata de sabe si debemos realizar presentaci$$HEX1$$f300$$ENDHEX$$n preliminar o solo pedirle el n$$HEX1$$fa00$$ENDHEX$$mero
//			de copias.
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	8-10-96		JCC				PM013
//
////////////////////////////////////////////////////////////////////////

// Comprobamos si debemos presentar el bot$$HEX1$$f300$$ENDHEX$$n de presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
IF message.StringParm = "P" THEN

	cb_cancelar.Y = 313
	cb_presentacion_preliminar.Visible = TRUE

END IF
end event

on close;////////////////////////////////////////////////////////////////////////
//
// Evento:	close para w_generica_peticion_impresion.
//
// Objetivo:	Se trata de comprobar si se ha cancelado la impresi$$HEX1$$f300$$ENDHEX$$n 
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		-----			---------
//						Versi$$HEX1$$f300$$ENDHEX$$n original
//
////////////////////////////////////////////////////////////////////////

// Colocamos el valor de vuelta de la ventana
MESSAGE.STRINGPARM = is_valor_retorno
end on

on w_generica_peticion_impresion.create
int iCurrent
call super::create
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_presentacion_preliminar=create cb_presentacion_preliminar
this.em_numero_copias=create em_numero_copias
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.r_5=create r_5
this.r_4=create r_4
this.r_12=create r_12
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.r_11=create r_11
this.r_10=create r_10
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_15
this.Control[iCurrent+2]=this.st_14
this.Control[iCurrent+3]=this.st_13
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cb_presentacion_preliminar
this.Control[iCurrent+9]=this.em_numero_copias
this.Control[iCurrent+10]=this.cb_cancelar
this.Control[iCurrent+11]=this.cb_aceptar
this.Control[iCurrent+12]=this.r_5
this.Control[iCurrent+13]=this.r_4
this.Control[iCurrent+14]=this.r_12
this.Control[iCurrent+15]=this.r_1
this.Control[iCurrent+16]=this.r_2
this.Control[iCurrent+17]=this.r_3
this.Control[iCurrent+18]=this.r_11
this.Control[iCurrent+19]=this.r_10
end on

on w_generica_peticion_impresion.destroy
call super::destroy
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_presentacion_preliminar)
destroy(this.em_numero_copias)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.r_5)
destroy(this.r_4)
destroy(this.r_12)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.r_11)
destroy(this.r_10)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_generica_peticion_impresion
end type

type st_15 from statictext within w_generica_peticion_impresion
integer x = 443
integer y = 320
integer width = 37
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "1"
boolean focusrectangle = false
end type

type st_14 from statictext within w_generica_peticion_impresion
integer x = 485
integer y = 288
integer width = 37
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "2"
boolean focusrectangle = false
end type

type st_13 from statictext within w_generica_peticion_impresion
integer x = 526
integer y = 256
integer width = 37
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "3"
boolean focusrectangle = false
end type

type st_4 from statictext within w_generica_peticion_impresion
integer x = 311
integer y = 256
integer width = 37
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "3"
boolean focusrectangle = false
end type

type st_3 from statictext within w_generica_peticion_impresion
integer x = 270
integer y = 288
integer width = 37
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "2"
boolean focusrectangle = false
end type

type st_2 from statictext within w_generica_peticion_impresion
integer x = 229
integer y = 320
integer width = 37
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "1"
boolean focusrectangle = false
end type

type st_1 from statictext within w_generica_peticion_impresion
integer x = 69
integer y = 72
integer width = 571
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "N$$HEX1$$fa00$$ENDHEX$$mero de copias:"
boolean focusrectangle = false
end type

type cb_presentacion_preliminar from u_cb within w_generica_peticion_impresion
boolean visible = false
integer x = 1371
integer y = 172
integer width = 411
integer height = 96
integer taborder = 40
string text = "&Ver"
end type

on clicked;call u_cb::clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	clicked para cb_presentacion_preliminar
//
// Objetivo:	Se trata de realizar la impresi$$HEX1$$f300$$ENDHEX$$n preliminar
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	8-10-96		JCC				PM013
//
////////////////////////////////////////////////////////////////////////

// Indicamos como par$$HEX1$$e100$$ENDHEX$$metro de retorno de la ventana que se quiere realizar la impresi$$HEX1$$f300$$ENDHEX$$n preliminar y
// devolvemos adem$$HEX1$$e100$$ENDHEX$$s el n$$HEX1$$fa00$$ENDHEX$$mero de copias que necesita de todos los documentos a imprimir.
is_valor_retorno = "P" + em_numero_copias.text

// Cerramos la ventana
Close( PARENT )
end on

type em_numero_copias from editmask within w_generica_peticion_impresion
integer x = 640
integer y = 72
integer width = 530
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "1"
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "1~~999"
end type

type cb_cancelar from u_cb within w_generica_peticion_impresion
integer x = 1371
integer y = 172
integer width = 411
integer height = 96
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Cancelar"
boolean cancel = true
end type

on clicked;call u_cb::clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	clicked para cb_cancelar
//
// Objetivo:	Se trata de cancelar la impresi$$HEX1$$f300$$ENDHEX$$n
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	8-10-96		JCC				PM013
//
////////////////////////////////////////////////////////////////////////

// Indicamos que se va a cancelar la impresi$$HEX1$$f300$$ENDHEX$$n y cerramos con valor de retorno "-1"
is_valor_retorno = "-1"

// Cerramos la ventana
Close( PARENT )
end on

type cb_aceptar from u_cb within w_generica_peticion_impresion
integer x = 1371
integer y = 48
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

on clicked;call u_cb::clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	clicked para CB_ACEPTAR
//
// Objetivo:	Se trata de ACEPTAR la impresi$$HEX1$$f300$$ENDHEX$$n
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	8-10-96		JCC				PM013
//
////////////////////////////////////////////////////////////////////////

// Indicamos que se ha aceptado la impresi$$HEX1$$f300$$ENDHEX$$n y se va a imprimir con el n$$HEX1$$fa00$$ENDHEX$$mero de copias indicado
// por la caja de edici$$HEX1$$f300$$ENDHEX$$n
is_valor_retorno = "A" + em_numero_copias.text

// Cerramos la ventana
Close( PARENT )
end on

type r_5 from rectangle within w_generica_peticion_impresion
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 67108864
integer x = 41
integer y = 28
integer width = 1179
integer height = 408
end type

type r_4 from rectangle within w_generica_peticion_impresion
long linecolor = 16777215
integer linethickness = 4
long fillcolor = 81324524
integer x = 46
integer y = 32
integer width = 1170
integer height = 400
end type

type r_12 from rectangle within w_generica_peticion_impresion
integer linethickness = 4
long fillcolor = 16777215
integer x = 475
integer y = 200
integer width = 91
integer height = 112
end type

type r_1 from rectangle within w_generica_peticion_impresion
integer linethickness = 4
long fillcolor = 16777215
integer x = 261
integer y = 200
integer width = 91
integer height = 112
end type

type r_2 from rectangle within w_generica_peticion_impresion
integer linethickness = 4
long fillcolor = 16777215
integer x = 219
integer y = 232
integer width = 91
integer height = 112
end type

type r_3 from rectangle within w_generica_peticion_impresion
integer linethickness = 4
long fillcolor = 16777215
integer x = 178
integer y = 264
integer width = 91
integer height = 112
end type

type r_11 from rectangle within w_generica_peticion_impresion
integer linethickness = 4
long fillcolor = 16777215
integer x = 434
integer y = 232
integer width = 91
integer height = 112
end type

type r_10 from rectangle within w_generica_peticion_impresion
integer linethickness = 4
long fillcolor = 16777215
integer x = 393
integer y = 264
integer width = 91
integer height = 112
end type


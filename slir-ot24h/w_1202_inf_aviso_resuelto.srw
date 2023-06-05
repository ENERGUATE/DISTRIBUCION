HA$PBExportHeader$w_1202_inf_aviso_resuelto.srw
forward
global type w_1202_inf_aviso_resuelto from w_sgigenerica
end type
type cb_1 from commandbutton within w_1202_inf_aviso_resuelto
end type
type st_1 from statictext within w_1202_inf_aviso_resuelto
end type
type p_1 from picture within w_1202_inf_aviso_resuelto
end type
type mle_1 from multilineedit within w_1202_inf_aviso_resuelto
end type
type mle_2 from multilineedit within w_1202_inf_aviso_resuelto
end type
type cb_2 from commandbutton within w_1202_inf_aviso_resuelto
end type
end forward

global type w_1202_inf_aviso_resuelto from w_sgigenerica
integer x = 617
integer y = 740
integer width = 2505
integer height = 920
string title = "Posible Aviso Resuelto"
windowtype windowtype = response!
long backcolor = 79741120
cb_1 cb_1
st_1 st_1
p_1 p_1
mle_1 mle_1
mle_2 mle_2
cb_2 cb_2
end type
global w_1202_inf_aviso_resuelto w_1202_inf_aviso_resuelto

type variables
u_generico_comunicaciones	iu_gen_comunic
end variables

on w_1202_inf_aviso_resuelto.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_1=create st_1
this.p_1=create p_1
this.mle_1=create mle_1
this.mle_2=create mle_2
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.p_1
this.Control[iCurrent+4]=this.mle_1
this.Control[iCurrent+5]=this.mle_2
this.Control[iCurrent+6]=this.cb_2
end on

on w_1202_inf_aviso_resuelto.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.mle_1)
destroy(this.mle_2)
destroy(this.cb_2)
end on

event timer;st_1.text=string(today()) + " " + string(now())
end event

event open;call super::open;int	li_valorApertura
String ls_texto_1,ls_texto_2
iu_gen_comunic = CREATE u_generico_comunicaciones
iu_gen_comunic.is_comunic = gu_comunic1.is_comunic

timer(1)

st_1.text=string(today()) + " " + string(now())

//AHU 1/668310
li_valorApertura = Message.DoubleParm		//Captura del mensaje que se envia al abrir la ventana
// GNU 28/11/2005. Mejora 1/335502
if fg_verifica_parametro('NIC') then
	IF li_valorApertura = 1 THEN					//Comprueba si se ha abierto desde el objeto u_avi_2004_pr_form_inf_resumen
		ls_texto_1=	"    Se produjo el aviso " + string(iu_gen_comunic.is_comunic.longval2) + &
					" con n$$HEX1$$fa00$$ENDHEX$$mero de NIS " + string(iu_gen_comunic.is_comunic.longval1) + & 
						 ". Este aviso ha sido resuelto en la fecha " + &
					 iu_gen_comunic.is_comunic.strval2 + "."
	ELSE
				 
		ls_texto_1=	"    Se produjo una interrupci$$HEX1$$f300$$ENDHEX$$n perteneciente a la Incidencia " + string(iu_gen_comunic.is_comunic.longval2) + &
					" que afectaba al suministro " + iu_gen_comunic.is_comunic.strval1 + & 
						" con n$$HEX1$$fa00$$ENDHEX$$mero de NIC " + string(iu_gen_comunic.is_comunic.longval1) + ". Esta incidencia ha sido resuelta a las " + &
					 iu_gen_comunic.is_comunic.strval2 + "."
	END IF
else			
	IF li_valorApertura = 1 THEN					//Comprueba si se ha abierto desde el objeto u_avi_2004_pr_form_inf_resumen
		ls_texto_1=	"    Se produjo el aviso " + string(iu_gen_comunic.is_comunic.longval2) + &
						" con n$$HEX1$$fa00$$ENDHEX$$mero de NIS " + string(iu_gen_comunic.is_comunic.longval1) + & 
							". Este aviso ha sido resuelto en la fecha " + &
						 iu_gen_comunic.is_comunic.strval2 + "."
	ELSE
		ls_texto_1=	"    Se produjo una interrupci$$HEX1$$f300$$ENDHEX$$n perteneciente a la Incidencia " + string(iu_gen_comunic.is_comunic.longval2) + &
				" que afectaba al suministro " + iu_gen_comunic.is_comunic.strval1 + & 
					" con n$$HEX1$$fa00$$ENDHEX$$mero de NIS " + string(iu_gen_comunic.is_comunic.longval1) + ". Esta incidencia ha sido resuelta a las " + &
				 iu_gen_comunic.is_comunic.strval2 + "."
	END IF
end if				 
// FIN GNU
mle_1.text=ls_texto_1



IF li_valorApertura = 1 THEN					//Comprueba si se ha abierto desde el objeto u_avi_2004_pr_form_inf_resumen
	cb_1.text = "Ingresar improcedente"
	mle_2.text = "      El aviso se podr$$HEX2$$e1002000$$ENDHEX$$ingresar en estado Pendiente o improcedente."
	cb_1.width = cb_1.width + 100
END IF
//Fin AHU

cb_1.setfocus()

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1202_inf_aviso_resuelto
end type

type cb_1 from commandbutton within w_1202_inf_aviso_resuelto
integer x = 1358
integer y = 624
integer width = 677
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ingresar Resuelto"
boolean default = true
end type

event clicked;CloseWithReturn ( parent, 2 )
end event

type st_1 from statictext within w_1202_inf_aviso_resuelto
integer x = 1783
integer y = 16
integer width = 667
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "12/11/2000 12:17:33"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type p_1 from picture within w_1202_inf_aviso_resuelto
integer x = 14
integer y = 16
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "information.bmp"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_1202_inf_aviso_resuelto
integer x = 69
integer y = 156
integer width = 2341
integer height = 268
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
string text = "     Se produjo una inc. que afectaba al suministro Luis Antonio G$$HEX1$$f300$$ENDHEX$$mez L$$HEX1$$f300$$ENDHEX$$pez con n$$HEX1$$fa00$$ENDHEX$$mero de nis 17569. Esta incidencia ha sido resuelta a las 12:15. Asegurese que el suministro realmente contin$$HEX1$$fa00$$ENDHEX$$a con el problema."
boolean border = false
end type

type mle_2 from multilineedit within w_1202_inf_aviso_resuelto
integer x = 69
integer y = 416
integer width = 2341
integer height = 196
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
string text = "      El aviso se podr$$HEX2$$e1002000$$ENDHEX$$ingresar en estado Pendiente o se podr$$HEX2$$e1002000$$ENDHEX$$resolver directamente asoci$$HEX1$$e100$$ENDHEX$$ndolo a la incidencia."
boolean border = false
boolean displayonly = true
end type

type cb_2 from commandbutton within w_1202_inf_aviso_resuelto
integer x = 325
integer y = 624
integer width = 677
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ingresar Pendiente"
boolean default = true
end type

event clicked;CloseWithReturn( parent, 1 )
end event


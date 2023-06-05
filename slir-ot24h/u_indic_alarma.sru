HA$PBExportHeader$u_indic_alarma.sru
$PBExportComments$Mantenimiento de alarmas (banderas)
forward
global type u_indic_alarma from userobject
end type
type st_12 from statictext within u_indic_alarma
end type
type st_11 from statictext within u_indic_alarma
end type
type st_10 from statictext within u_indic_alarma
end type
type em_valor_maximo from editmask within u_indic_alarma
end type
type em_valor_medio from editmask within u_indic_alarma
end type
type st_3 from statictext within u_indic_alarma
end type
type st_8 from statictext within u_indic_alarma
end type
type st_7 from statictext within u_indic_alarma
end type
type st_6 from statictext within u_indic_alarma
end type
type st_5 from statictext within u_indic_alarma
end type
type st_4 from statictext within u_indic_alarma
end type
type p_2 from picture within u_indic_alarma
end type
type p_1 from picture within u_indic_alarma
end type
type st_9 from statictext within u_indic_alarma
end type
type r_marco from rectangle within u_indic_alarma
end type
type r_2 from rectangle within u_indic_alarma
end type
end forward

global type u_indic_alarma from userobject
integer width = 1851
integer height = 748
long backcolor = 67108864
long tabtextcolor = 33554432
st_12 st_12
st_11 st_11
st_10 st_10
em_valor_maximo em_valor_maximo
em_valor_medio em_valor_medio
st_3 st_3
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
p_2 p_2
p_1 p_1
st_9 st_9
r_marco r_marco
r_2 r_2
end type
global u_indic_alarma u_indic_alarma

type variables
boolean cambio1, cambio2
real em1, em2
int ii_bandera
end variables

forward prototypes
public function integer uf_actualiza (double alto, double medio, decimal actual, double maximo, string unidades)
end prototypes

public function integer uf_actualiza (double alto, double medio, decimal actual, double maximo, string unidades);///////////////////////////////////////////////////////////////////////
//
//	Function:	uf_actualiza
//
///////////////////////////////////////////////////////////////////////

//Actualiza la barra en funci$$HEX1$$f300$$ENDHEX$$n de los valores
int li_porc
long ll_rojo_oscuro,ll_amarillo,ll_verde_oscuro

IF medio = alto THEN
	gnv_msg.f_mensaje("ED23","","",ok!)	 		
	return 0
END IF

ll_rojo_oscuro = (65536*0+256*0+255)
ll_amarillo	= (65536*0+256*255+255)	
ll_verde_oscuro = (65536*0+256*128+0)



//IF Not (cambio1 or cambio2) THEN	//As$$HEX2$$ed002000$$ENDHEX$$s$$HEX1$$f300$$ENDHEX$$lo lo hace la primera vez

em1 = medio
em2 = alto
st_10.text = "Uds."
st_11.text = "Uds."
st_12.text = "Uds."

em_valor_medio.minmax = "0~~" + string(alto)
//em_valor_m$$HEX1$$e100$$ENDHEX$$ximo.minmax = "0~~" + string(maximo)
st_3.text = string(actual)


IF em_valor_medio.text <> string(medio) THEN  em_valor_medio.text = string(medio)
IF em_valor_maximo.text <> string(alto)	THEN	em_valor_maximo.text = string(alto)
IF st_7.text <> string(maximo)THEN	st_7.text = string(maximo)

li_porc = actual / (maximo)*100  

if actual > maximo then //MATO
   r_2.width = r_marco.width - 10 
else
	r_2.width = li_porc * r_marco.width /100
end if

CHOOSE CASE actual
	CASE IS < medio
		r_2.Fillcolor = ll_verde_oscuro	
		r_2.Linecolor = ll_verde_oscuro
	CASE 	medio to alto -1
		r_2.Fillcolor = ll_amarillo
		r_2.Linecolor = ll_amarillo
	CASE ELSE
		r_2.Fillcolor = ll_rojo_oscuro
		r_2.Linecolor = ll_rojo_oscuro
END CHOOSE

p_1.x = r_marco.x + medio / (maximo)* r_marco.width
p_2.x = r_marco.x +  alto / (maximo)* r_marco.width 

	
return 1
end function

on u_indic_alarma.create
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.em_valor_maximo=create em_valor_maximo
this.em_valor_medio=create em_valor_medio
this.st_3=create st_3
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.p_2=create p_2
this.p_1=create p_1
this.st_9=create st_9
this.r_marco=create r_marco
this.r_2=create r_2
this.Control[]={this.st_12,&
this.st_11,&
this.st_10,&
this.em_valor_maximo,&
this.em_valor_medio,&
this.st_3,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.p_2,&
this.p_1,&
this.st_9,&
this.r_marco,&
this.r_2}
end on

on u_indic_alarma.destroy
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.em_valor_maximo)
destroy(this.em_valor_medio)
destroy(this.st_3)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.st_9)
destroy(this.r_marco)
destroy(this.r_2)
end on

type st_12 from statictext within u_indic_alarma
integer x = 654
integer y = 80
integer width = 133
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_11 from statictext within u_indic_alarma
integer x = 1691
integer y = 224
integer width = 133
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_10 from statictext within u_indic_alarma
integer x = 736
integer y = 224
integer width = 178
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
end type

type em_valor_maximo from editmask within u_indic_alarma
event ue_keydown pbm_keydown
integer x = 1367
integer y = 216
integer width = 320
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 128
borderstyle borderstyle = stylelowered!
string mask = "######"
end type

event ue_keydown;// En este evento se controla que el ususario no pueda teclear el signo negativo como
// primer caracter del n$$HEX1$$fa00$$ENDHEX$$mero.  (LFE)

If this.text = "-"  then
	this.text=''
END IF
end event

event modified;IF (real(This.text) <= real(em_valor_medio.text) ) THEN
	gnv_msg.f_mensaje("ED23","","",ok!)	 		
	//MessageBox("Error","Las banderas no pueden superponerse",StopSign!)
	em_valor_maximo.text = string(em2)
	parent.setfocus()
	return
END IF


IF real(This.text) = 0 THEN
	em_valor_maximo.text = string(em2)
ELSE
	em2 = real(em_valor_maximo.text )
	cambio2 = true
	uf_actualiza(real(em_valor_maximo.text),real(em_valor_medio.text),dec(st_3.text),dec(em_valor_maximo.text)*3/2, st_10.text)
END IF

end event

type em_valor_medio from editmask within u_indic_alarma
event ue_keydown pbm_keydown
integer x = 411
integer y = 216
integer width = 320
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 32896
borderstyle borderstyle = stylelowered!
string mask = "######"
end type

event ue_keydown;// En este evento se controla que el ususario no pueda teclear el signo negativo como
// primer caracter del n$$HEX1$$fa00$$ENDHEX$$mero.  (LFE)

If this.text = "-"  then
	this.text=''
END IF
end event

event modified;
IF real(This.text) >= real(em_valor_maximo.text) THEN
	gnv_msg.f_mensaje("ED23","","",ok!)	 	
	//MessageBox("Error","Las Banderas no pueden estar superpuestas",StopSign!)
	em_valor_medio.text = string(em1)
	return
END IF
	
	
em1 = real(em_valor_medio.text)

cambio1 = true
uf_actualiza(real(em_valor_maximo.text),real(em_valor_medio.text),dec(st_3.text),dec(em_valor_maximo.text)*3/2, st_10.text)


end event

type st_3 from statictext within u_indic_alarma
integer x = 375
integer y = 80
integer width = 270
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within u_indic_alarma
integer x = 18
integer y = 636
integer width = 78
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within u_indic_alarma
integer x = 1495
integer y = 636
integer width = 270
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within u_indic_alarma
integer x = 27
integer y = 80
integer width = 402
integer height = 72
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Valor Actual:"
boolean focusrectangle = false
end type

type st_5 from statictext within u_indic_alarma
integer x = 992
integer y = 224
integer width = 347
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Valor M$$HEX1$$e100$$ENDHEX$$ximo"
boolean focusrectangle = false
end type

type st_4 from statictext within u_indic_alarma
integer x = 27
integer y = 224
integer width = 393
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Valor Medio"
boolean focusrectangle = false
end type

type p_2 from picture within u_indic_alarma
integer x = 1147
integer y = 416
integer width = 110
integer height = 96
integer taborder = 40
string dragicon = "LIMIT2.ICO"
string picturename = "limit2.bmp"
boolean focusrectangle = false
end type

event constructor;//p_2.DragIcon = "limit1.ico"
end event

event getfocus;ii_bandera = 2
p_2.DragIcon = "limit2.ico"
Parent.Setfocus()
This.Drag(Begin!)
end event

type p_1 from picture within u_indic_alarma
integer x = 649
integer y = 416
integer width = 110
integer height = 96
integer taborder = 30
string dragicon = "limit1.ico"
boolean originalsize = true
string picturename = "limit1.bmp"
boolean focusrectangle = false
end type

event constructor;p_1.DragIcon = "limit1.ico"
end event

event getfocus;ii_bandera = 1
p_1.DragIcon = "limit1.ico"
Parent.Setfocus()
this.Drag(Begin!)	

end event

type st_9 from statictext within u_indic_alarma
event aa pbm_dwnbuttonclicking
integer x = 59
integer y = 364
integer width = 1705
integer height = 144
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event dragdrop;picture pic
long caida
long valor
long ls_pos

Parent.Setfocus()
pic = DraggedObject()
ls_pos=this.pointerx()

This.Drag(End!)

caida = ls_pos + this.x

IF pic = p_1 AND caida >= p_2.x OR pic = p_2 AND caida <= p_1.x	THEN

		gnv_msg.f_mensaje("ED23","","",ok!)	 	
		//MessageBox("Error","Las banderas no pueden superponerse",StopSign!)
		Return
END IF
	

//Est$$HEX2$$e1002000$$ENDHEX$$todo bien
valor = (caida - r_marco.x) * dec(st_7.text) / r_marco.width


IF pic = p_1 THEN
	cambio1 = true
	uf_actualiza(real(em_valor_maximo.text),valor,dec(st_3.text),dec(em_valor_maximo.text)*3/2, st_10.text)
ELSE
	cambio2 = true
	uf_actualiza(valor,real(em_valor_medio.text),dec(st_3.text),valor*3/2, st_10.text)
END IF


end event

event dragenter;
	

IF ii_bandera = 1 and p_1.dragicon = 'no.ico' THEN
	p_1.DragIcon = "limit1.ico"
END IF

IF ii_bandera = 2 and p_2.dragicon = 'no.ico' THEN
	p_2.DragIcon = "limit2.ico"
END IF

end event

event dragleave;IF ii_bandera = 1 THEN
	p_1.DragIcon = "no.ico"
ELSE
	p_2.DragIcon = "no.ico"
END IF
end event

type r_marco from rectangle within u_indic_alarma
integer linethickness = 8
long fillcolor = 1086374080
integer x = 59
integer y = 512
integer width = 1705
integer height = 120
end type

type r_2 from rectangle within u_indic_alarma
long linecolor = 32768
integer linethickness = 4
long fillcolor = 32768
integer x = 69
integer y = 520
integer width = 1042
integer height = 104
end type


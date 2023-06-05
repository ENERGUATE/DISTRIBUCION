HA$PBExportHeader$w_1109_list_clientes_por_doc.srw
forward
global type w_1109_list_clientes_por_doc from w_sgigenerica
end type
type dw_1 from u_avi_2022_pr_lista_clientes_doc within w_1109_list_clientes_por_doc
end type
type cb_1 from u_cb within w_1109_list_clientes_por_doc
end type
type sle_3 from singlelineedit within w_1109_list_clientes_por_doc
end type
type sle_2 from singlelineedit within w_1109_list_clientes_por_doc
end type
type sle_1 from singlelineedit within w_1109_list_clientes_por_doc
end type
type st_1 from statictext within w_1109_list_clientes_por_doc
end type
type cb_2 from u_cb within w_1109_list_clientes_por_doc
end type
end forward

global type w_1109_list_clientes_por_doc from w_sgigenerica
integer x = 494
integer y = 752
integer width = 2711
integer height = 848
string title = "OPEN SGI - Suministros de Clientes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
dw_1 dw_1
cb_1 cb_1
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_1 st_1
cb_2 cb_2
end type
global w_1109_list_clientes_por_doc w_1109_list_clientes_por_doc

type variables
int 	FilaSelecc

string 	is_doc, is_tipo_doc, is_pais

u_generico_comunicaciones		iu_gen_comunic 

u_avi_2022_nu_lista_clientes_doc	iu_avi_2022_nu
end variables

on close;call w_sgigenerica::close;// Arreglar

//GU_COMUNIC.FNU_CERRAR(THIS)
//gu_comunic.fnu_cerrar_hijas(this)

destroy iu_avi_2022_nu
end on

event open;call super::open;
SetPointer(HourGlass!)

s_direccion_cliente lstru_direccion 

// Creo objetos necesarios para el procesamiento en la ventana
iu_avi_2022_nu = CREATE u_avi_2022_nu_lista_clientes_doc

// Recibo la estructura pasada como parametro y cargo variables de instancia.

lstru_direccion = Message.PowerObjectParm

is_doc = lstru_direccion.gs_doc
is_tipo_doc = lstru_direccion.gs_tipo_doc
is_pais = lstru_direccion.gs_pais



//Open Script para w_1109_list_clientes_por_doc
int filas

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

//// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
//This.Title = iu_gen_comunic.f_titulo_ventana("w_1109","Doc.Clientes")
//
dw_1.SetTransObject(SQLCA)

// Conecto las dddw.
iu_avi_2022_nu.fnu_conectar(dw_1)

// Hago retrieve con los par$$HEX1$$e100$$ENDHEX$$metro obtenidos.

filas = dw_1.Retrieve(is_doc, is_tipo_doc, is_pais)


IF filas < 0 THEN	
	gnv_msg.f_mensaje("ER48","","",OK!)
	Close(This)
ELSEIF filas = 0 THEN
	gnv_msg.f_mensaje("AR12","","",OK!)
	parnum1 = 0
	Close(This)
ELSEIF filas = 1 THEN
	parnum1 = 1										//Salida OK

	CloseWithReturn(This,dw_1.GetItemNumber(1,"cod_cli"))
ELSEIF filas > 1 THEN
	dw_1.setrow(1)
	//dw_1.TRIGGEREVENT(clicked!)
END IF

end event

on w_1109_list_clientes_por_doc.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.sle_3
this.Control[iCurrent+4]=this.sle_2
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_2
end on

on w_1109_list_clientes_por_doc.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_2)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1109_list_clientes_por_doc
end type

type dw_1 from u_avi_2022_pr_lista_clientes_doc within w_1109_list_clientes_por_doc
integer x = 9
integer y = 292
integer width = 2661
integer height = 420
integer taborder = 10
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;// Clicked Script para dw_1 

dw_1.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila

FilaSelecc = row
if FilaSelecc = 0 then
	FilaSelecc = dw_1.GetRow( )
end if

IF FilaSelecc > 0 THEN 
	dw_1.SelectRow(FilaSelecc, TRUE)		// Se selecciona la fila nueva
	sle_1.Text = dw_1.GetItemString(FilaSelecc,"ape1_cli")
	sle_2.Text = dw_1.GetItemString(FilaSelecc,"ape2_cli")
	sle_3.Text = dw_1.GetItemString(FilaSelecc,"nom_cli")
END IF


end event

on doubleclicked;call u_avi_2022_pr_lista_clientes_doc::doubleclicked;cb_1.TriggerEvent(Clicked!)
end on

type cb_1 from u_cb within w_1109_list_clientes_por_doc
integer x = 2258
integer y = 36
integer width = 411
integer height = 96
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

on clicked;call u_cb::clicked;//Clicked Script para cb_1

IF FilaSelecc = 0 THEN
	gnv_msg.f_mensaje("ER53","","",OK!)
	RETURN
END IF

parnum1 = 1					// Salida OK

CloseWithReturn(Parent,dw_1.GetItemNumber(FilaSelecc,"cod_cli"))

end on

type sle_3 from singlelineedit within w_1109_list_clientes_por_doc
integer x = 334
integer y = 164
integer width = 1280
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_1109_list_clientes_por_doc
integer x = 1006
integer y = 48
integer width = 608
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_1 from singlelineedit within w_1109_list_clientes_por_doc
integer x = 334
integer y = 48
integer width = 608
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_1109_list_clientes_por_doc
integer x = 14
integer y = 48
integer width = 320
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Cliente:"
boolean focusrectangle = false
end type

type cb_2 from u_cb within w_1109_list_clientes_por_doc
integer x = 2258
integer y = 148
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Salir"
end type

on clicked;call u_cb::clicked;int resp

Resp = 	gnv_msg.f_mensaje("CR01","","",OKCancel!)

IF Resp = 1 	THEN	
	parnum1 = 0
	Close(Parent)
END IF


end on


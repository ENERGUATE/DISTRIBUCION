HA$PBExportHeader$w_id0105.srw
$PBExportComments$Lista de inmuebles de la calle
forward
global type w_id0105 from w_sgigenerica
end type
type dw_1 from u_gen_id0105 within w_id0105
end type
type st_2 from statictext within w_id0105
end type
type sle_2 from singlelineedit within w_id0105
end type
type sle_1 from singlelineedit within w_id0105
end type
type cb_2 from u_cb within w_id0105
end type
type cb_1 from u_cb within w_id0105
end type
type st_1 from statictext within w_id0105
end type
end forward

global type w_id0105 from w_sgigenerica
integer x = 837
integer y = 700
integer width = 1984
integer height = 1004
string title = "OPEN SGI - Lista de Inmuebles de la Calle"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
dw_1 dw_1
st_2 st_2
sle_2 sle_2
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
st_1 st_1
end type
global w_id0105 w_id0105

type variables
long filaselecc

u_generico_comunicaciones		iu_gen_comunic
end variables

event open;call super::open;//Script del evento open de la ventana

int Fila,  retorno
long Numero, CodCalle
string Duplic, ls_filtro
long ll_Desde, ll_hasta

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_id0105","ListaInmuebles")

SetPointer(HourGlass!)

dw_1.SetTransObject(SQLCA)

sle_1.text = parmstr3
sle_2.text = parmstr6

CodCalle = long(String(dir.gl_codcalle))
retorno =  dw_1.Retrieve(CodCalle) 

IF gu_comunic.is_comunic.strval8 = '' OR IsNull(gu_comunic.is_comunic.strval8) THEN
	ll_desde = 0
ELSE
	ll_desde = long (gu_comunic.is_comunic.strval8)
END IF
IF gu_comunic.is_comunic.strval9 = '' OR IsNull(gu_comunic.is_comunic.strval9) THEN
	ll_hasta = 0
ELSE
	ll_hasta = long (gu_comunic.is_comunic.strval9)
END IF

IF (ll_desde<>0) AND (ll_hasta<>0) then // desde>0  hasta>0
	ls_filtro = ("num_puerta <= " + string(ll_hasta) + & 
					" and num_puerta >= " + string(ll_desde))
ELSEIF (ll_desde<>0) AND (ll_hasta=0)  THEN //desde>0 hasta=0
	ls_filtro = ("num_puerta >= " + string(ll_desde))
ELSEIF (ll_desde=0) AND (ll_hasta<>0) THEN // GNU 21-11-2006. Incidencia 0/464938
   ls_filtro = ("num_puerta <= " + string(ll_hasta))
END IF

//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_1.Text = fg_geografica("4", st_1.Text)
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

//***************************************
//**  OSGI 2001.1  	05/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fg_ventana_parametro(This.ClassName(), dw_1)
fg_alto_texto(dw_1, dw_1.ClassName(), 0)
//***************************************
//**  OSGI 2001.1  	05/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************	

 // GNU 11-5-2006. Incidencia 0/421756
//IF	gu_comunic.is_comunic.programa_llamante = "w_3111_mante_aco" THEN
IF	gu_comunic.is_comunic.programa_llamante = "w_3111_mante_aco"  OR &
	gu_comunic.is_comunic.programa_llamante = "w_3211" THEN
// FIN GNU
	dw_1.SetFilter(ls_filtro)
	dw_1.filter()
	
	IF dw_1.RowCount() = 0 THEN 
		gnv_msg.f_mensaje("AR23","","",OK!)
		close(this)
	END IF
END IF

If retorno = -1  THEN
	gnv_msg.f_mensaje("ER42","","",OK!)
	Close(This)
ELSEIF retorno = 1 THEN
	// AHM (13/05/2011) ASUR 1093853
	IF isValid(THIS) THEN
		dir.gl_nif    = dw_1.GetItemNumber(1,"nif")
		dir.gl_numero = dw_1.GetItemNumber(1,1)
		dir.gs_duplic = dw_1.GetItemString(1,2)
		dw_1.SetFocus()
		gu_comunic.is_comunic.intval5 = dir.gl_numero
		gu_comunic.is_comunic.strval6 = dir.gs_duplic
	ELSE
		setNull(gu_comunic.is_comunic.intval5)
		setNull(gu_comunic.is_comunic.strval6)
	END IF
	Close(This)
ELSEIF retorno = 0 THEN
	SetNull(dir.gl_nif)
	SetNull(parmstr3)
	SetNull(parmstr4)
	gu_comunic.is_comunic.intval5 = 0
	gu_comunic.is_comunic.strval6 = ""
	gnv_msg.f_mensaje("AR09","","",OK!)
	Close(This)
END IF
end event

on w_id0105.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_2=create st_2
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.sle_2
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.st_1
end on

on w_id0105.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
end on

event close;DESTROY iu_gen_comunic
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_id0105
end type

type dw_1 from u_gen_id0105 within w_id0105
integer x = 50
integer y = 288
integer width = 1847
integer height = 604
integer taborder = 60
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;// Clicked Script para dw
if row > 0 then
	
	This.SelectRow(FilaSelecc, FALSE)			// Se deselecciona la fila
	
	FilaSelecc = row
	
	IF FilaSelecc > 0 THEN 
		this.SelectRow(FilaSelecc, TRUE)		
	END IF												

END IF
end event

event doubleclicked;call super::doubleclicked;if row > 0 then
	cb_1.TriggerEvent(Clicked!)
END IF
end event

type st_2 from statictext within w_id0105
integer x = 50
integer y = 172
integer width = 352
integer height = 68
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Calle:"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_id0105
integer x = 402
integer y = 164
integer width = 997
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_id0105
integer x = 402
integer y = 52
integer width = 997
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from u_cb within w_id0105
integer x = 1477
integer y = 156
integer width = 411
integer height = 96
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Salir"
end type

on clicked;call u_cb::clicked;//Evento Clicked para el bot$$HEX1$$f300$$ENDHEX$$n Salir

SetNull(dir.gl_nif)
Close(parent)
end on

type cb_1 from u_cb within w_id0105
integer x = 1477
integer y = 44
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;call super::clicked;//Evento Clicked para bot$$HEX1$$f300$$ENDHEX$$n Confirmar

IF FilaSelecc <> 0 THEN
	dir.gl_nif    = dw_1.GetItemNumber(FilaSelecc,"nif")
	dir.gl_numero = dw_1.GetItemNumber(FilaSelecc,"num_puerta")
	dir.gs_duplic = dw_1.GetItemString(FilaSelecc,"duplicador")
	gu_comunic.is_comunic.intval5 = dir.gl_numero
	gu_comunic.is_comunic.strval6 = dir.gs_duplic


	//***************************************
	//**  OSGI 2001.1  	21/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	dir.gs_ref = fg_referencia(dir.gl_codloc, dir.gl_nif, dir.gs_ref)
	//***************************************
	//**  OSGI 2001.1  	21/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


	Close(parent)
ELSE
	SetNull(dir.gl_nif)
	SetNull(parmstr3)
	SetNull(parmstr4)
	gu_comunic.is_comunic.intval5 = 0
	gu_comunic.is_comunic.strval6 = ""
	gnv_msg.f_mensaje("ER44","","",OK!)
	RETURN
END IF




end event

type st_1 from statictext within w_id0105
integer x = 50
integer y = 60
integer width = 352
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
string text = "Localidad"
boolean focusrectangle = false
end type


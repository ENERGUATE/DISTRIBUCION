HA$PBExportHeader$w_id01041.srw
$PBExportComments$Lista de calles de la localidad, con n$$HEX1$$fa00$$ENDHEX$$mero y duplicador.
forward
global type w_id01041 from w_sgigenerica
end type
type dw_1 from u_gen_id0104_a1 within w_id01041
end type
type sle_1 from singlelineedit within w_id01041
end type
type cb_2 from u_cb within w_id01041
end type
type cb_1 from u_cb within w_id01041
end type
end forward

global type w_id01041 from w_sgigenerica
integer x = 663
integer y = 728
integer width = 2341
integer height = 948
string title = "OPEN SGI - Lista de Calles de la Localidad"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
dw_1 dw_1
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
end type
global w_id01041 w_id01041

type variables
int FilaSelecc

u_generico_comunicaciones		iu_gen_comunic 
end variables

event open;call super::open;//Script del evento open de la ventana

String Calle,Local, ls_num, ls_dup
int Fila, li_filas

Local 		= parmstr1
Calle 		= parmstr2
ls_num		= parmstr3
ls_dup		= parmstr4

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_id01041","ListaCalles2")

// Si no se ingres$$HEX2$$f3002000$$ENDHEX$$el nombre de una "Calle"


//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
String ls_cadena_titulo



fg_replace_text(ls_cadena_titulo, "Localidad", fg_geografica("4", "Localidad"))

This.Title = ls_cadena_titulo
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF calle = '' OR ISNULL(calle) OR calle = ' ' THEN
	dw_1.DataObject='d_id0104'
	dw_1.SetTransObject(SQLCA)
	li_filas = dw_1.Retrieve(parnum5) 
		
	IF li_filas = 1 THEN
		dir.gl_codcalle = dw_1.GetItemNumber(1,1)
		dir.gs_calle = dw_1.GetItemString(1,2)
		Close(This)
	ELSEIF li_filas = 0 THEN
		SetNull(dir.gl_codcalle)
		SetNull(parmstr3)
		SetNull(parmstr4)
		gnv_msg.f_mensaje("AR07","","",OK!)
		Close(This)
	END IF

ELSE

	IF (ls_dup <> '' AND NOT ISNULL(ls_dup) AND ls_dup <> ' ') THEN
		dw_1.DataObject = 'd_id0104_a2'
		dw_1.SetTransObject(SQLCA)
		li_filas = dw_1.Retrieve(parnum5,Calle,Integer(ls_num),ls_dup)
	ELSE
		dw_1.SetTransObject(SQLCA)
		li_filas = dw_1.Retrieve(parnum5,Calle,Integer(ls_num))
	END IF

	IF li_filas = 1 THEN
		dir.gl_nif    = dw_1.GetItemNumber(1,5)
		dir.gl_codcalle = dw_1.GetItemNumber(1,1)
		dir.gs_calle = dw_1.GetItemString(1,2)
		dir.gl_numero = dw_1.GetItemNumber(1,3)
		dir.gs_duplic = dw_1.GetItemString(1,4)
		Close(This)
	ELSEIF li_filas = 0 THEN
		gnv_msg.f_mensaje("AR11","","",OK!)
		Close(This)
		parnum1 = 1
//		SetNull(parmstr1)
//		SetNull(parmstr2)
		SetNull(parmstr3)
		SetNull(parmstr4)
		SetNull(dir.gl_numero)
		SetNull(dir.gs_duplic)
		Open(w_id0104)
	END IF
END IF




	
end event

on w_id01041.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
end on

on w_id01041.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event close;DESTROY iu_gen_comunic
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_id01041
end type

type dw_1 from u_gen_id0104_a1 within w_id01041
integer x = 32
integer y = 132
integer width = 1760
integer height = 680
integer taborder = 30
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;// Clicked Script para dw

if row > 0 then
	
	this.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila
	
	FilaSelecc = row
	
	
	IF FilaSelecc > 0 THEN 
		 this.SelectRow(FilaSelecc, TRUE)		
		 sle_1.text = dw_1.GetItemString(FilaSelecc, 2)
	END IF

end if
end event

event doubleclicked;call super::doubleclicked;if row > 0 then
	cb_1.TriggerEvent(Clicked!)
END IF
end event

type sle_1 from singlelineedit within w_id01041
event key_pressed pbm_char
event busqueda pbm_custom01
integer x = 32
integer y = 20
integer width = 1760
integer height = 84
integer taborder = 20
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

on key_pressed;this.postevent("busqueda")
end on

on busqueda;// Script for Busqueda event

long		found_row


if Len(this.text) > 0 then							// Search
	dw_1.Modify("DataWindow.Retrieve.AsNeeded=NO")	//Para que traiga todas las filas
	found_row = dw_1.Find("#2 >=~"" + this.text + "~"",1, 99999)
	if found_row > 0 then 
		dw_1.ScrollToRow(found_row)
		dw_1.SetRedraw(FALSE)
		dw_1.SelectRow(FilaSelecc, FALSE)
		dw_1.SelectRow(found_row, TRUE)
		dw_1.SetRedraw(TRUE)
	else	// Filter function did not find any matching row
	   Beep(1)
		dw_1.SelectRow(FilaSelecc, FALSE)
		message.processed = true

	end if
else		// Filter length is 0, so unhighlight former selected row
	dw_1.SelectRow(FilaSelecc, FALSE)
end if

FilaSelecc = found_row				// Remember number of highlighted row


end on

type cb_2 from u_cb within w_id01041
integer x = 1833
integer y = 132
integer width = 411
integer height = 96
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Salir"
end type

on clicked;call u_cb::clicked;//Evento Clicked para el bot$$HEX1$$f300$$ENDHEX$$n Salir

SetNull(dir.gl_codcalle)
Close(parent)
end on

type cb_1 from u_cb within w_id01041
integer x = 1838
integer y = 20
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;call super::clicked;string ls_data_object

//Evento Clicked para bot$$HEX1$$f300$$ENDHEX$$n Confirmar
ls_data_object = dw_1.dataObject
IF FilaSelecc <> 0 THEN
	
	if ls_data_object = 'd_id0104' then
		dir.gl_codcalle = dw_1.GetItemNumber(FilaSelecc,"cod_calle")
		dir.gs_calle = dw_1.GetItemString(FilaSelecc,"nom_calle")
		dir.gl_numero = 0
		dir.gs_duplic = '0'
	else
		dir.gl_nif    = dw_1.GetItemNumber(FilaSelecc,"fincas_nif")
		dir.gl_codcalle = dw_1.GetItemNumber(FilaSelecc,"callejero_cod_calle")
		dir.gs_calle = dw_1.GetItemString(FilaSelecc,"callejero_nom_calle")
		dir.gl_numero = dw_1.GetItemNumber(FilaSelecc,"fincas_num_puerta")
		dir.gs_duplic = dw_1.GetItemString(FilaSelecc,"fincas_duplicador")
		//***************************************
		//**  OSGI 2001.1  	21/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		dir.gs_ref = fg_referencia(dir.gl_codloc, dir.gl_nif, dir.gs_ref)
		//***************************************
		//**  OSGI 2001.1  	21/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	end if

	Close(parent)
ELSE
	SetNull(dir.gl_nif)
	SetNull(dir.gl_codcalle)
	SetNull(parmstr3)
	SetNull(parmstr4)
	gnv_msg.f_mensaje("ER40","","",OK!)
	Return
END IF




end event


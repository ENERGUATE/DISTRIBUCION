HA$PBExportHeader$w_id0104_ref.srw
$PBExportComments$Busqueda de una direcci$$HEX1$$f300$$ENDHEX$$n por la referencia del inmueble.
forward
global type w_id0104_ref from w_sgigenerica
end type
type sle_loca from singlelineedit within w_id0104_ref
end type
type st_2 from statictext within w_id0104_ref
end type
type st_1 from statictext within w_id0104_ref
end type
type sle_1 from singlelineedit within w_id0104_ref
end type
type cb_2 from u_cb within w_id0104_ref
end type
type cb_1 from u_cb within w_id0104_ref
end type
type dw_1 from u_gen_id0104_ref within w_id0104_ref
end type
end forward

global type w_id0104_ref from w_sgigenerica
int X=480
int Y=576
int Width=2711
int Height=1252
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Lista de Inmuebles de la Localidad"
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
sle_loca sle_loca
st_2 st_2
st_1 st_1
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_id0104_ref w_id0104_ref

type variables
int FilaSelecc

u_generico_comunicaciones iu_gen_comunic 

end variables

event open;call super::open;//////////////////////////////////////////////////////////////////////
//
// Ventana de identificacion por referencia
// Recibe : parmstr1 : Localidad
//				parmstr2 : Referencia
//				parnum5  : Codigo Localidad
//
// Devuelve : dir.codcalle 
//				: dir.calle 
//				: dir.numero 
//				: dir.duplic 
//				: dir.pisodepto 
//				: dir.nis 
//				: dir.nif 
//
//////////////////////////////////////////////////////////////////////

string s_referencia
long l_localidad
int li_filas

SetPointer(HourGlass!)

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_id0104_ref","ListaRef.")

dw_1.SetTransObject(SQLCA)

sle_loca.text = parmstr1

s_referencia = parmstr2 + '%'
l_localidad = parnum5

// Lee por codigo de localidad y referencia
li_filas = dw_1.Retrieve(l_localidad,s_referencia)


//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
String ls_cadena_titulo


st_2.Text = fg_geografica("4", st_2.Text)
fg_replace_text(ls_cadena_titulo, "Localidad", st_2.Text)

//This.Title = ls_cadena_titulo
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF li_filas = 1 THEN
	dir.gl_codcalle 	= dw_1.GetItemNumber(1,'cod_calle')
	dir.gs_calle 		= dw_1.GetItemString(1,'nom_calle') 
	dir.gs_ref        = dw_1.GetItemString(1,'ref_dir')  
	dir.gl_numero 		= dw_1.GetItemNumber(1,'fincas_num_puerta')
	dir.gs_duplic 		= dw_1.GetItemString(1,'fincas_duplicador')
	dir.gs_pisodpto 	= dw_1.GetItemString(1,'suministros_cgv_sum')
	dir.gl_nif			= dw_1.GetItemNumber(1,'nif')
//	dir.gl_nis			= dw_1.GetItemNumber(1,'nis_rad')
	Close(This)
ELSEIF li_filas = 0 THEN
	gnv_msg.f_mensaje("AR16","","",OK!)
	Close(This)
	parnum1 = 1
	SetNull(parmstr3)
	SetNull(parmstr4)
	SetNull(dir.gl_numero)
	SetNull(dir.gs_duplic)
	SetNull(dir.gl_nis)
	SetNull(dir.gl_nif)
	SetNull(dir.gl_codcalle)
END IF
end event

on w_id0104_ref.create
int iCurrent
call super::create
this.sle_loca=create sle_loca
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_loca
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.dw_1
end on

on w_id0104_ref.destroy
call super::destroy
destroy(this.sle_loca)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event close;DESTROY iu_gen_comunic
end event

type sle_loca from singlelineedit within w_id0104_ref
int X=453
int Y=36
int Width=1504
int Height=84
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
boolean DisplayOnly=true
long TextColor=8388608
long BackColor=81324524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_id0104_ref
int X=46
int Y=40
int Width=407
int Height=68
boolean Enabled=false
string Text="Localidad:"
boolean FocusRectangle=false
long TextColor=128
long BackColor=81324524
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_id0104_ref
int X=46
int Y=132
int Width=407
int Height=68
boolean Enabled=false
string Text="Referencia:"
boolean FocusRectangle=false
long BackColor=81324524
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_1 from singlelineedit within w_id0104_ref
event key_pressed pbm_char
event busqueda pbm_custom01
int X=453
int Y=128
int Width=1504
int Height=84
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=8388608
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on key_pressed;This.PostEvent("Busqueda")
end on

on busqueda;// Script for Busqueda event

long		found_row

if Len(this.text) > 0 then							// Search
	dw_1.Modify("DataWindow.Retrieve.AsNeeded=NO")	//Para que traiga todas las filas
	found_row = dw_1.Find("#1 >=~"" + this.text + "~"",1, 99999)
	if found_row > 0 then 
		dw_1.ScrollToRow(found_row)
		dw_1.SetRedraw(FALSE)
		dw_1.SelectRow(FilaSelecc, FALSE)
		dw_1.SelectRow(found_row, TRUE)
		dw_1.SetRedraw(TRUE)
		FilaSelecc = found_row
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

type cb_2 from u_cb within w_id0104_ref
int X=2016
int Y=128
int Width=352
int Height=92
int TabOrder=40
string Text="&Cancelar"
boolean Cancel=true
int TextSize=-8
string FaceName="MS Sans Serif"
end type

on clicked;call u_cb::clicked;//Evento Clicked para el bot$$HEX1$$f300$$ENDHEX$$n Salir

SetNull(dir.gl_codcalle)
Close(Parent)
end on

type cb_1 from u_cb within w_id0104_ref
int X=2016
int Y=28
int Width=352
int Height=92
int TabOrder=20
string Text="&Aceptar"
boolean Default=true
int TextSize=-8
string FaceName="MS Sans Serif"
end type

event clicked;call super::clicked;//Evento Clicked para bot$$HEX1$$f300$$ENDHEX$$n Confirmar

IF FilaSelecc > 0 THEN
	dir.gl_codcalle 	= dw_1.GetItemNumber(FilaSelecc,'cod_calle')
	dir.gs_calle 		= dw_1.GetItemString(FilaSelecc,'nom_calle') 
	dir.gs_ref        = dw_1.GetItemString(FilaSelecc,'ref_dir')  
	dir.gl_numero 		= dw_1.GetItemNumber(FilaSelecc,'fincas_num_puerta')
	dir.gs_duplic 		= dw_1.GetItemString(FilaSelecc,'fincas_duplicador')
	dir.gs_pisodpto 	= dw_1.GetItemString(FilaSelecc,'suministros_cgv_sum')
	dir.gl_nif			= dw_1.GetItemNumber(FilaSelecc,'nif')
//	dir.gl_nis			= dw_1.GetItemNumber(FilaSelecc,'nis_rad')
	Close(Parent)
ELSE
	SetNull(dir.gl_nis)
	SetNull(dir.gl_nif)
	SetNull(dir.gl_codcalle)
	SetNull(parmstr3)
	SetNull(parmstr4)
	gnv_msg.f_mensaje("ER40","","",OK!)
	RETURN
END IF




end event

type dw_1 from u_gen_id0104_ref within w_id0104_ref
int X=0
int Y=236
int Width=2688
int Height=868
int TabOrder=30
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
end type

event clicked;call super::clicked;
// Clicked Script para dw

if row > 0 then
	
	this.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila
	
	FilaSelecc = row
	
	
	IF FilaSelecc > 0 THEN 
		 this.SelectRow(FilaSelecc, TRUE)		
		 sle_1.text = dw_1.GetItemString(FilaSelecc, 1)
	END IF

end if
	
end event

event doubleclicked;call super::doubleclicked;// DoubleClicked Script for dw

IF FilaSelecc>0 Then cb_1.TriggerEvent(Clicked!)


end event


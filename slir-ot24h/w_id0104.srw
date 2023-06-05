HA$PBExportHeader$w_id0104.srw
$PBExportComments$Lista de calles de la localidad
forward
global type w_id0104 from w_sgigenerica
end type
type sle_1 from singlelineedit within w_id0104
end type
type cb_2 from u_cb within w_id0104
end type
type cb_1 from u_cb within w_id0104
end type
type dw_1 from u_gen_id0104_a within w_id0104
end type
end forward

global type w_id0104 from w_sgigenerica
int X=1047
int Y=728
int Width=1568
int Height=948
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Lista de Calles de la Localidad"
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_id0104 w_id0104

type variables
int FilaSelecc

u_generico_comunicaciones		iu_gen_comunic 
end variables

event open;call super::open;//Script del evento open de la ventana

String Calle,Local
int Fila, li_filas

Local 		= parmstr1
Calle 		= parmstr2


// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_id0104","ListaCalles")

// Si no se ingres$$HEX2$$f3002000$$ENDHEX$$el nombre de una "Calle".
// Al IF no entra nunca porque lo controlo antes.

IF calle = " " OR ISNULL(calle) OR calle = "" THEN
//**********************************************************************//
// LOC ABRIL/2001                                                       //
//**********************************************************************//

	If (parnum5 = 0 OR IsNull(parnum5)) AND fg_verifica_parametro('aviso_cuarto_nivel') Then
		dw_1.DataObject = 'd_id0104_11'
		dw_1.SetTransObject(SQLCA)
		
		This.Width += 696
		dw_1.Width += 635
		
		cb_1.x += 696
		cb_2.x += 696
		
		li_filas = dw_1.Retrieve(parnum2,parnum3,parnum4)
	Else
		dw_1.DataObject='d_id0104'
		dw_1.SetTransObject(SQLCA)
		This.Width += 696
		dw_1.Width += 635
		
		cb_1.x += 696
		cb_2.x += 696
		
		li_filas = dw_1.Retrieve(parnum5) 
	End If
	dw_1.Modify("localidades_nom_local_t.Text='" + fg_geografica('4', 'Localidad') + "'")
	
//***************************************************************************//
// LOC ABRIL/2001                                                            //
//***************************************************************************//

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

Else
//***************************************************************************//
// LOC ABRIL/2001                                                            //
//***************************************************************************//
	If parnum5 = 0 OR IsNull(parnum5) AND fg_verifica_parametro('aviso_cuarto_nivel') Then
		dw_1.DataObject = 'd_id0104_a_11'
		dw_1.SetTransObject(SQLCA)
		
		This.Width += 696
		dw_1.Width += 635
		
		cb_1.x += 696
		cb_2.x += 696
		
		li_filas = dw_1.Retrieve(parnum2,parnum3,parnum4,Calle)
	Else
		dw_1.SetTransObject(SQLCA)
		li_filas = dw_1.Retrieve(parnum5,Calle)
	End If
	dw_1.Modify("localidades_nom_local_t.Text= '" + fg_geografica('4', 'Localidad') + "'")
//**************************************************************************//
// LOC ABRIL/2001                                                           //
//**************************************************************************//

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
END IF
	
end event

on w_id0104.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_1
end on

on w_id0104.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event close;DESTROY iu_gen_comunic
end event

type sle_1 from singlelineedit within w_id0104
event key_pressed pbm_char
event busqueda pbm_custom01
int X=32
int Y=20
int Width=969
int Height=84
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
boolean DisplayOnly=true
TextCase TextCase=Upper!
long TextColor=8388608
long BackColor=81324524
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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

type cb_2 from u_cb within w_id0104
int X=1056
int Y=132
int TabOrder=30
string Text="&Cancelar"
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

on clicked;call u_cb::clicked;//Evento Clicked para el bot$$HEX1$$f300$$ENDHEX$$n Salir

SetNull(dir.gl_codcalle)
Close(parent)
end on

type cb_1 from u_cb within w_id0104
int X=1056
int Y=20
int TabOrder=10
string Text="&Aceptar"
boolean Default=true
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

event clicked;call super::clicked;string ls_data_object
//Evento Clicked para bot$$HEX1$$f300$$ENDHEX$$n Confirmar

IF FilaSelecc <> 0 THEN

	// Parche porque los nombres de campos de las datawindows son distintos.

	ls_data_object = dw_1.dataObject

	if ls_data_object = 'd_id0104' then
		dir.gl_codcalle = dw_1.GetItemDecimal(FilaSelecc,"cod_calle")
		dir.gs_calle = dw_1.GetItemString(FilaSelecc,"nom_calle")
	//****************
	//**  SAC 2001  **
	//****************
	elseif ls_data_object = 'd_id0104_11' then
		dir.gl_codcalle = dw_1.GetItemDecimal(FilaSelecc,"callejero_cod_calle")
		dir.gs_calle = dw_1.GetItemString(FilaSelecc,"callejero_nom_calle")
		If parnum5 = 0 Or IsNull(parnum5) Then
			parnum5 = dw_1.GetItemNumber(FilaSelecc,"callejero_cod_local")
		End If
	elseif ls_data_object = 'd_id0104_a_11' then
		dir.gl_codcalle = dw_1.GetItemDecimal(FilaSelecc,"callejero_cod_calle")
		dir.gs_calle = dw_1.GetItemString(FilaSelecc,"callejero_nom_calle")
		If parnum5 = 0 Or IsNull(parnum5) Then
			parnum5 = dw_1.GetItemNumber(FilaSelecc,"callejero_cod_local")
		End If
	//****************
	//**  SAC 2001  **
	//****************
	else
		dir.gl_codcalle = dw_1.GetItemDecimal(FilaSelecc,"callejero_cod_calle")
		dir.gs_calle = dw_1.GetItemString(FilaSelecc,"callejero_nom_calle")
	end if

	Close(parent)
ELSE
	SetNull(dir.gl_codcalle)
	SetNull(parmstr3)
	SetNull(parmstr4)
	gnv_msg.f_mensaje("ER40","","",OK!)
	Return
END IF





end event

type dw_1 from u_gen_id0104_a within w_id0104
int X=32
int Y=128
int Width=969
int Height=676
int TabOrder=40
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
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

event doubleclicked;call super::doubleclicked;// DoubleClicked Script for dw

//this.TriggerEvent(Clicked!)
if row > 0 then
	cb_1.TriggerEvent(Clicked!)
END IF
end event


HA$PBExportHeader$w_2402_busqueda_materiales.srw
forward
global type w_2402_busqueda_materiales from w_sgigenerica
end type
type cb_cancelar from commandbutton within w_2402_busqueda_materiales
end type
type cb_ok from commandbutton within w_2402_busqueda_materiales
end type
type cbx_completa from checkbox within w_2402_busqueda_materiales
end type
type cbx_case from checkbox within w_2402_busqueda_materiales
end type
type st_1 from statictext within w_2402_busqueda_materiales
end type
type sle_material from singlelineedit within w_2402_busqueda_materiales
end type
end forward

type s_datos_retorno from structure
	string		descripcion
	boolean		coincidir_case
	boolean		comparacion_completa
end type

global type w_2402_busqueda_materiales from w_sgigenerica
int X=864
int Y=700
int Width=1929
int Height=988
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - B$$HEX1$$fa00$$ENDHEX$$squeda de Materiales"
long BackColor=79741120
cb_cancelar cb_cancelar
cb_ok cb_ok
cbx_completa cbx_completa
cbx_case cbx_case
st_1 st_1
sle_material sle_material
end type
global w_2402_busqueda_materiales w_2402_busqueda_materiales

type variables
s_datos_retorno is_retorno
end variables

on w_2402_busqueda_materiales.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.cbx_completa=create cbx_completa
this.cbx_case=create cbx_case
this.st_1=create st_1
this.sle_material=create sle_material
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cbx_completa
this.Control[iCurrent+4]=this.cbx_case
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.sle_material
end on

on w_2402_busqueda_materiales.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.cbx_completa)
destroy(this.cbx_case)
destroy(this.st_1)
destroy(this.sle_material)
end on

event open;call super::open;sle_material.SetFocus()
end event

type cb_cancelar from commandbutton within w_2402_busqueda_materiales
int X=1065
int Y=728
int Width=448
int Height=96
int TabOrder=3
string Text="Cancelar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Reseteo la estructura de retorno de datos y cierro la ventana

// Descripcion
gu_comunic.is_comunic.strval3 = ""

// Coincidir case
gu_comunic.is_comunic.intval3 = 0

// Comparacion completa
gu_comunic.is_comunic.intval4 = 0

// Cierro la ventana
Close(Parent)
end event

type cb_ok from commandbutton within w_2402_busqueda_materiales
int X=297
int Y=728
int Width=448
int Height=96
int TabOrder=20
string Text="Aceptar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Recogo la informacion ingresada en la single line edit
// y en los checkbox y los cargo en la estructura que 
// devuelvo a la ventana llamante

// Por defecto seteo las variables de comparacion completa y 
// coincidir mayusculas/minusculas en FALSE
gu_comunic.is_comunic.intval3 = 0
gu_comunic.is_comunic.intval4 = 0

// Descripcion
gu_comunic.is_comunic.strval3 = sle_material.Text

// Coincidir case
IF cbx_case.Checked THEN
	gu_comunic.is_comunic.intval3 = 1
END IF

// Comparacion completa
IF cbx_completa.Checked THEN
	gu_comunic.is_comunic.intval4 = 1
END IF

// Cierro la ventana
Close(Parent)
end event

type cbx_completa from checkbox within w_2402_busqueda_materiales
int X=1134
int Y=504
int Width=599
int Height=76
string Text="Coincidir Texto    "
boolean LeftText=true
long BackColor=81324524
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_case from checkbox within w_2402_busqueda_materiales
int X=672
int Y=380
int Width=1061
int Height=76
string Text="Coincidir May$$HEX1$$fa00$$ENDHEX$$scula / Min$$HEX1$$fa00$$ENDHEX$$scula     "
boolean LeftText=true
long BackColor=81324524
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_2402_busqueda_materiales
int X=27
int Y=204
int Width=599
int Height=76
boolean Enabled=false
string Text="Material a Buscar:"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=81324524
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_material from singlelineedit within w_2402_busqueda_materiales
event ue_key pbm_keydown
int X=626
int Y=196
int Width=1106
int Height=92
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event ue_key;/////////////////////////////////////////////////////
//	Si se puls$$HEX2$$f3002000$$ENDHEX$$enter acepto el texto igual que 
// si hiciera click en el boton de aceptar
//
//////////////////////////////////////////////////////

IF keyflags = 0 THEN  // Controlo que no haya presionado
							// control ni shift
	IF KeyDown(KeyEnter!) THEN
		cb_ok.TriggerEvent(clicked!)

	END IF

END IF

end event


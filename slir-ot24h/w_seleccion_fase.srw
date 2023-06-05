HA$PBExportHeader$w_seleccion_fase.srw
$PBExportComments$Ventana que permite la selecci$$HEX1$$f300$$ENDHEX$$n de fases
forward
global type w_seleccion_fase from w_sgigenerica
end type
type cb_2 from commandbutton within w_seleccion_fase
end type
type cb_1 from commandbutton within w_seleccion_fase
end type
type cbx_fase_c from checkbox within w_seleccion_fase
end type
type cbx_fase_b from checkbox within w_seleccion_fase
end type
type cbx_fase_a from checkbox within w_seleccion_fase
end type
type gb_1 from groupbox within w_seleccion_fase
end type
end forward

global type w_seleccion_fase from w_sgigenerica
int X=823
int Y=360
int Width=955
int Height=820
WindowType WindowType=response!
boolean TitleBar=true
string Title="Selecci$$HEX1$$f300$$ENDHEX$$n de fases"
long BackColor=79741120
cb_2 cb_2
cb_1 cb_1
cbx_fase_c cbx_fase_c
cbx_fase_b cbx_fase_b
cbx_fase_a cbx_fase_a
gb_1 gb_1
end type
global w_seleccion_fase w_seleccion_fase

type variables
string is_accion ="No seleccion"
end variables

forward prototypes
public subroutine wf_iniciar_fases (string ps_fase_sugerida, string ps_fase_instalacion)
end prototypes

public subroutine wf_iniciar_fases (string ps_fase_sugerida, string ps_fase_instalacion);IF IsNull(ps_fase_instalacion) THEN
	ps_fase_instalacion = gs_fase_a + gs_fase_b + gs_fase_c
END IF
IF ps_fase_instalacion <> " " AND NOT isnull(ps_fase_instalacion) THEN
	// Se comprueba si est$$HEX2$$e1002000$$ENDHEX$$cada fase
	// FASE A
	IF Match(ps_fase_instalacion, gs_fase_a) = TRUE THEN
		cbx_fase_a.enabled = true
	END IF
	// FASE B
	IF Match(ps_fase_instalacion, gs_fase_b) = TRUE THEN
		cbx_fase_b.enabled = true
	END IF
	// FASE C
	IF Match(ps_fase_instalacion, gs_fase_c) = TRUE THEN
		cbx_fase_c.enabled = true
	END IF
END IF

IF ps_fase_sugerida <> " " AND NOT isnull(ps_fase_sugerida) THEN
	// Se comprueba si est$$HEX2$$e1002000$$ENDHEX$$cada fase
	// FASE A
	IF Match(ps_fase_sugerida, gs_fase_a) = TRUE THEN
		cbx_fase_a.checked = true
	END IF
	// FASE B
	IF Match(ps_fase_sugerida, gs_fase_b) = TRUE THEN
		cbx_fase_b.checked = true
	END IF
	// FASE C
	IF Match(ps_fase_sugerida, gs_fase_c) = TRUE THEN
		cbx_fase_c.checked = true
	END IF
END IF
end subroutine

on w_seleccion_fase.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_fase_c=create cbx_fase_c
this.cbx_fase_b=create cbx_fase_b
this.cbx_fase_a=create cbx_fase_a
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cbx_fase_c
this.Control[iCurrent+4]=this.cbx_fase_b
this.Control[iCurrent+5]=this.cbx_fase_a
this.Control[iCurrent+6]=this.gb_1
end on

on w_seleccion_fase.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_fase_c)
destroy(this.cbx_fase_b)
destroy(this.cbx_fase_a)
destroy(this.gb_1)
end on

event open;call super::open;wf_iniciar_fases(gu_comunic.is_comunic.strval1, gu_comunic.is_comunic.strval2)
gu_comunic.is_comunic.strval1 = ''
gu_comunic.is_comunic.strval1 = ''
//wf_iniciar_fases("AC", "AC")
end event

event close;gu_comunic.is_comunic.accion_retorno = is_accion
gu_comunic.is_comunic.programa_retorno = "w_seleccion_fase"
end event

type cb_2 from commandbutton within w_seleccion_fase
int X=507
int Y=536
int Width=329
int Height=108
int TabOrder=30
string Text="&Cancelar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;is_accion = "No seleccion"
gu_comunic.is_comunic.strval1 = ''

Close(Parent)
end event

type cb_1 from commandbutton within w_seleccion_fase
int X=96
int Y=536
int Width=320
int Height=108
int TabOrder=20
string Text="&Aceptar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_fase_sugerida=""

IF cbx_fase_a.Checked = TRUE THEN
	ls_fase_sugerida = ls_fase_sugerida + gs_fase_a
END IF
IF cbx_fase_b.Checked = TRUE THEN
	ls_fase_sugerida = ls_fase_sugerida + gs_fase_b
END IF
IF cbx_fase_c.Checked = TRUE THEN
	ls_fase_sugerida = ls_fase_sugerida + gs_fase_c
END IF

gu_comunic.is_comunic.strval1 = ls_fase_sugerida
is_accion = "Seleccion"

Close(Parent)
end event

type cbx_fase_c from checkbox within w_seleccion_fase
int X=251
int Y=312
int Width=334
int Height=124
boolean Enabled=false
string Text="Fase C   "
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;cbx_fase_c.text = "Fase " + gs_fase_c
end event

type cbx_fase_b from checkbox within w_seleccion_fase
int X=251
int Y=204
int Width=334
int Height=124
boolean Enabled=false
string Text="Fase B   "
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;cbx_fase_b.text = "Fase " + gs_fase_b
end event

type cbx_fase_a from checkbox within w_seleccion_fase
int X=251
int Y=100
int Width=334
int Height=124
boolean Enabled=false
string Text="Fase A   "
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;cbx_fase_a.text = "Fase " + gs_fase_a

end event

type gb_1 from groupbox within w_seleccion_fase
int X=101
int Y=32
int Width=736
int Height=448
int TabOrder=10
string Text="Fases"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


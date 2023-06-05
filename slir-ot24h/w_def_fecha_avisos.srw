HA$PBExportHeader$w_def_fecha_avisos.srw
forward
global type w_def_fecha_avisos from w_sgigenerica
end type
type rb_fecha_def_a from radiobutton within w_def_fecha_avisos
end type
type rb_fecha_aviso_a from radiobutton within w_def_fecha_avisos
end type
type gb_3 from groupbox within w_def_fecha_avisos
end type
type gb_2 from groupbox within w_def_fecha_avisos
end type
type gb_1 from groupbox within w_def_fecha_avisos
end type
type em_fecha_a_def from editmask within w_def_fecha_avisos
end type
type em_fecha_a_aviso from editmask within w_def_fecha_avisos
end type
type rb_fecha_def_b from radiobutton within w_def_fecha_avisos
end type
type rb_fecha_aviso_b from radiobutton within w_def_fecha_avisos
end type
type em_fecha_b_def from editmask within w_def_fecha_avisos
end type
type em_fecha_b_aviso from editmask within w_def_fecha_avisos
end type
type rb_fecha_def_c from radiobutton within w_def_fecha_avisos
end type
type rb_fecha_aviso_c from radiobutton within w_def_fecha_avisos
end type
type em_fecha_c_def from editmask within w_def_fecha_avisos
end type
type em_fecha_c_aviso from editmask within w_def_fecha_avisos
end type
type cb_1 from commandbutton within w_def_fecha_avisos
end type
end forward

global type w_def_fecha_avisos from w_sgigenerica
int Width=2336
int Height=1168
WindowType WindowType=response!
boolean TitleBar=true
string Title="Confirmaci$$HEX1$$f300$$ENDHEX$$n de Fechas"
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
rb_fecha_def_a rb_fecha_def_a
rb_fecha_aviso_a rb_fecha_aviso_a
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
em_fecha_a_def em_fecha_a_def
em_fecha_a_aviso em_fecha_a_aviso
rb_fecha_def_b rb_fecha_def_b
rb_fecha_aviso_b rb_fecha_aviso_b
em_fecha_b_def em_fecha_b_def
em_fecha_b_aviso em_fecha_b_aviso
rb_fecha_def_c rb_fecha_def_c
rb_fecha_aviso_c rb_fecha_aviso_c
em_fecha_c_def em_fecha_c_def
em_fecha_c_aviso em_fecha_c_aviso
cb_1 cb_1
end type
global w_def_fecha_avisos w_def_fecha_avisos

type variables
boolean ib_unica_fecha
end variables

forward prototypes
public function datetime wf_cadena_a_fecha (string pdt_cadena)
end prototypes

public function datetime wf_cadena_a_fecha (string pdt_cadena);Datetime ldt_fecha

SELECT TO_DATE(:pdt_cadena, 'DD/MM/YYYY hh24:mi:ss')
INTO :ldt_fecha
FROM DUAL;

Return ldt_fecha
end function

on w_def_fecha_avisos.create
int iCurrent
call super::create
this.rb_fecha_def_a=create rb_fecha_def_a
this.rb_fecha_aviso_a=create rb_fecha_aviso_a
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.em_fecha_a_def=create em_fecha_a_def
this.em_fecha_a_aviso=create em_fecha_a_aviso
this.rb_fecha_def_b=create rb_fecha_def_b
this.rb_fecha_aviso_b=create rb_fecha_aviso_b
this.em_fecha_b_def=create em_fecha_b_def
this.em_fecha_b_aviso=create em_fecha_b_aviso
this.rb_fecha_def_c=create rb_fecha_def_c
this.rb_fecha_aviso_c=create rb_fecha_aviso_c
this.em_fecha_c_def=create em_fecha_c_def
this.em_fecha_c_aviso=create em_fecha_c_aviso
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_fecha_def_a
this.Control[iCurrent+2]=this.rb_fecha_aviso_a
this.Control[iCurrent+3]=this.gb_3
this.Control[iCurrent+4]=this.gb_2
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.em_fecha_a_def
this.Control[iCurrent+7]=this.em_fecha_a_aviso
this.Control[iCurrent+8]=this.rb_fecha_def_b
this.Control[iCurrent+9]=this.rb_fecha_aviso_b
this.Control[iCurrent+10]=this.em_fecha_b_def
this.Control[iCurrent+11]=this.em_fecha_b_aviso
this.Control[iCurrent+12]=this.rb_fecha_def_c
this.Control[iCurrent+13]=this.rb_fecha_aviso_c
this.Control[iCurrent+14]=this.em_fecha_c_def
this.Control[iCurrent+15]=this.em_fecha_c_aviso
this.Control[iCurrent+16]=this.cb_1
end on

on w_def_fecha_avisos.destroy
call super::destroy
destroy(this.rb_fecha_def_a)
destroy(this.rb_fecha_aviso_a)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.em_fecha_a_def)
destroy(this.em_fecha_a_aviso)
destroy(this.rb_fecha_def_b)
destroy(this.rb_fecha_aviso_b)
destroy(this.em_fecha_b_def)
destroy(this.em_fecha_b_aviso)
destroy(this.rb_fecha_def_c)
destroy(this.rb_fecha_aviso_c)
destroy(this.em_fecha_c_def)
destroy(this.em_fecha_c_aviso)
destroy(this.cb_1)
end on

event open;call super::open;ib_unica_fecha = (gu_comunic.is_comunic.intval1 = 1)

IF gb_red_trifasica OR ib_unica_fecha THEN
	This.Height = 572
	IF NOT IsNull(gu_comunic.is_comunic.strval1) THEN
		em_fecha_a_def.Text = gu_comunic.is_comunic.strval1
		
		IF NOT IsNull(gu_comunic.is_comunic.datval1) THEN
			em_fecha_a_aviso.Text = String(gu_comunic.is_comunic.datval1)
		ELSE
			em_fecha_a_aviso.enabled = FALSE
			rb_fecha_aviso_a.enabled = FALSE
		END IF
//	ELSE
//		em_fecha_a_def.enabled = FALSE
//		rb_fecha_def_a.enabled = FALSE
//		em_fecha_a_aviso.enabled = FALSE
//		rb_fecha_aviso_a.enabled = FALSE
	END IF
ELSE
	
	// FASE A
	IF NOT IsNull(gu_comunic.is_comunic.strval1) THEN
		em_fecha_a_def.Text = gu_comunic.is_comunic.strval1
		
		IF NOT IsNull(gu_comunic.is_comunic.datval1) THEN
			em_fecha_a_aviso.Text = String(gu_comunic.is_comunic.datval1)
		ELSE
			em_fecha_a_aviso.enabled = FALSE
			rb_fecha_aviso_a.enabled = FALSE
		END IF
	ELSE
		em_fecha_a_def.enabled = FALSE
		rb_fecha_def_a.enabled = FALSE
		em_fecha_a_aviso.enabled = FALSE
		rb_fecha_aviso_a.enabled = FALSE
	END IF
	
	// FASE B
	IF NOT IsNull(gu_comunic.is_comunic.strval2) THEN
		em_fecha_b_def.Text = gu_comunic.is_comunic.strval2
		
		IF NOT IsNull(gu_comunic.is_comunic.datval2) THEN
			em_fecha_b_aviso.Text = String(gu_comunic.is_comunic.datval2)
		ELSE
			em_fecha_b_aviso.enabled = FALSE
			rb_fecha_aviso_b.enabled = FALSE
		END IF
	ELSE
		em_fecha_b_def.enabled = FALSE
		rb_fecha_def_b.enabled = FALSE
		em_fecha_b_aviso.enabled = FALSE
		rb_fecha_aviso_b.enabled = FALSE
	END IF
	
	// FASE C
	IF NOT IsNull(gu_comunic.is_comunic.strval3) THEN
		em_fecha_c_def.Text = gu_comunic.is_comunic.strval3
		
		IF NOT IsNull(gu_comunic.is_comunic.datval3) THEN
			em_fecha_c_aviso.Text = String(gu_comunic.is_comunic.datval3)
		ELSE
			em_fecha_c_aviso.enabled = FALSE
			rb_fecha_aviso_c.enabled = FALSE
		END IF
	ELSE
		em_fecha_c_def.enabled = FALSE
		rb_fecha_def_c.enabled = FALSE
		em_fecha_c_aviso.enabled = FALSE
		rb_fecha_aviso_c.enabled = FALSE
	END IF
END IF

end event

event close;call super::close;SetNull(gu_comunic.is_comunic.datval1)
SetNull(gu_comunic.is_comunic.datval2)
SetNull(gu_comunic.is_comunic.datval3)

IF gb_red_trifasica THEN
	IF	rb_fecha_def_a.checked THEN

		gu_comunic.is_comunic.datval1 = wf_cadena_a_fecha(em_fecha_a_def.Text)
	ELSE
		gu_comunic.is_comunic.datval1 = wf_cadena_a_fecha(em_fecha_a_aviso.Text)
		//Datetime(Date(em_fecha_a_aviso.Text), Time(em_fecha_a_aviso.Text))
	END IF
ELSE
	IF rb_fecha_def_a.enabled THEN
		IF	rb_fecha_def_a.checked THEN
			
			gu_comunic.is_comunic.datval1 = wf_cadena_a_fecha(em_fecha_a_def.Text)
			//Datetime(Date(Mid(em_fecha_a_def.Text,1,10)), Time(Mid(em_fecha_a_def.Text,11,5)))
		ELSE
			gu_comunic.is_comunic.datval1 = wf_cadena_a_fecha(em_fecha_a_aviso.Text)
			//Datetime(Date(Mid(em_fecha_a_aviso.Text,1,10)), Time(Mid(em_fecha_a_aviso.Text,11,5)))
		END IF
	END IF

	IF rb_fecha_def_b.enabled THEN
		IF	rb_fecha_def_b.checked THEN
			gu_comunic.is_comunic.datval2 = wf_cadena_a_fecha(em_fecha_b_def.Text)
//			Datetime(Date(Mid(em_fecha_b_def.Text,1,10)), Time(Mid(em_fecha_b_def.Text,11,5)))
		ELSE
			gu_comunic.is_comunic.datval2 = wf_cadena_a_fecha(em_fecha_b_aviso.Text)
			//Datetime(Date(Mid(em_fecha_b_aviso.Text,1,10)), Time(Mid(em_fecha_b_aviso.Text,11,5)))
		END IF
	END IF
	
	IF rb_fecha_def_c.enabled THEN
		IF	rb_fecha_def_c.checked THEN
			gu_comunic.is_comunic.datval3 = wf_cadena_a_fecha(em_fecha_c_def.Text)
			//Datetime(Date(Mid(em_fecha_c_def.Text,1,10)), Time(Mid(em_fecha_c_def.Text,11,5)))
		ELSE
			gu_comunic.is_comunic.datval3 = wf_cadena_a_fecha(em_fecha_c_aviso.Text)
			//Datetime(Date(Mid(em_fecha_c_aviso.Text,1,10)), Time(Mid(em_fecha_c_aviso.Text,11,5)))
		END IF
	END IF
	
END IF
			
	
end event

type rb_fecha_def_a from radiobutton within w_def_fecha_avisos
int X=59
int Y=160
int Width=539
int Height=76
boolean BringToTop=true
string Text="Fecha Definida: "
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_fecha_a_aviso.enabled = FALSE
em_fecha_a_def.enabled = TRUE
end event

type rb_fecha_aviso_a from radiobutton within w_def_fecha_avisos
int X=1088
int Y=156
int Width=677
int Height=76
boolean BringToTop=true
string Text="Fecha Primer Aviso: "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_fecha_a_aviso.enabled = TRUE
em_fecha_a_def.enabled = FALSE
end event

type gb_3 from groupbox within w_def_fecha_avisos
int X=41
int Y=636
int Width=2226
int Height=232
int TabOrder=40
string Text="Fase C"
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

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
ELSE
	This.Text = "Fase " + gs_fase_c
END IF


end event

type gb_2 from groupbox within w_def_fecha_avisos
int X=41
int Y=352
int Width=2226
int Height=232
int TabOrder=10
string Text="Fase B"
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

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
ELSE
	This.Text = "Fase " + gs_fase_b
END IF


end event

type gb_1 from groupbox within w_def_fecha_avisos
int X=41
int Y=72
int Width=2226
int Height=232
int TabOrder=20
string Text="Fase A "
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

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.Text = "Fecha de la Interrupci$$HEX1$$f300$$ENDHEX$$n"
ELSE
	This.Text = "Fase " + gs_fase_a
END IF


end event

type em_fecha_a_def from editmask within w_def_fecha_avisos
int X=585
int Y=148
int Width=485
int Height=88
int TabOrder=30
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy hh:mm"
MaskDataType MaskDataType=DateTimeMask!
boolean DisplayOnly=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_fecha_a_aviso from editmask within w_def_fecha_avisos
int X=1751
int Y=148
int Width=485
int Height=88
int TabOrder=100
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy hh:mm"
MaskDataType MaskDataType=DateTimeMask!
boolean DisplayOnly=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_fecha_def_b from radiobutton within w_def_fecha_avisos
int X=59
int Y=436
int Width=539
int Height=76
boolean BringToTop=true
string Text="Fecha Definida: "
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_fecha_b_aviso.enabled = FALSE
em_fecha_b_def.enabled = TRUE
end event

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type rb_fecha_aviso_b from radiobutton within w_def_fecha_avisos
int X=1088
int Y=436
int Width=677
int Height=76
boolean BringToTop=true
string Text="Fecha Primer Aviso: "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_fecha_b_aviso.enabled = TRUE
em_fecha_b_def.enabled = FALSE
end event

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type em_fecha_b_def from editmask within w_def_fecha_avisos
int X=585
int Y=428
int Width=485
int Height=88
int TabOrder=50
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy hh:mm"
MaskDataType MaskDataType=DateTimeMask!
boolean DisplayOnly=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type em_fecha_b_aviso from editmask within w_def_fecha_avisos
int X=1751
int Y=428
int Width=485
int Height=88
int TabOrder=90
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy hh:mm"
MaskDataType MaskDataType=DateTimeMask!
boolean DisplayOnly=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type rb_fecha_def_c from radiobutton within w_def_fecha_avisos
int X=59
int Y=720
int Width=539
int Height=76
boolean BringToTop=true
string Text="Fecha Definida: "
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_fecha_c_aviso.enabled = FALSE
em_fecha_c_def.enabled = TRUE
end event

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type rb_fecha_aviso_c from radiobutton within w_def_fecha_avisos
int X=1088
int Y=720
int Width=677
int Height=76
boolean BringToTop=true
string Text="Fecha Primer Aviso: "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_fecha_c_aviso.enabled = TRUE
em_fecha_c_def.enabled = FALSE
end event

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type em_fecha_c_def from editmask within w_def_fecha_avisos
int X=585
int Y=712
int Width=485
int Height=88
int TabOrder=60
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy hh:mm"
MaskDataType MaskDataType=DateTimeMask!
boolean DisplayOnly=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type em_fecha_c_aviso from editmask within w_def_fecha_avisos
int X=1751
int Y=712
int Width=485
int Height=88
int TabOrder=70
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy hh:mm"
MaskDataType MaskDataType=DateTimeMask!
boolean DisplayOnly=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;IF gb_red_trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.visible = False
END IF
end event

type cb_1 from commandbutton within w_def_fecha_avisos
int X=969
int Y=912
int Width=366
int Height=108
int TabOrder=80
boolean BringToTop=true
string Text="&Aceptar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(Parent)
end event

event constructor;IF gb_red_Trifasica OR gu_comunic.is_comunic.intval1 = 1 THEN
	This.y = 352
END IF
	

end event


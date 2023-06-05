HA$PBExportHeader$w_mensaje.srw
forward
global type w_mensaje from Window
end type
type p_1 from picture within w_mensaje
end type
type mle_1 from multilineedit within w_mensaje
end type
type cb_yesnocancel2 from commandbutton within w_mensaje
end type
type cb_yesno2 from commandbutton within w_mensaje
end type
type cb_yesnocancel3 from commandbutton within w_mensaje
end type
type cb_okcancel2 from commandbutton within w_mensaje
end type
type cb_ok1 from commandbutton within w_mensaje
end type
type cb_okcancel1 from commandbutton within w_mensaje
end type
type cb_yesno1 from commandbutton within w_mensaje
end type
type cb_yesnocancel1 from commandbutton within w_mensaje
end type
end forward

global type w_mensaje from Window
int X=823
int Y=360
int Width=2487
int Height=588
boolean TitleBar=true
string Title="Untitled"
long BackColor=79741120
WindowType WindowType=response!
p_1 p_1
mle_1 mle_1
cb_yesnocancel2 cb_yesnocancel2
cb_yesno2 cb_yesno2
cb_yesnocancel3 cb_yesnocancel3
cb_okcancel2 cb_okcancel2
cb_ok1 cb_ok1
cb_okcancel1 cb_okcancel1
cb_yesno1 cb_yesno1
cb_yesnocancel1 cb_yesnocancel1
end type
global w_mensaje w_mensaje

forward prototypes
public subroutine fw_centra_ventana (ref window pw_ventana)
public subroutine fw_boton (button pbt_boton)
public subroutine fw_icono (icon pi_icono)
end prototypes

public subroutine fw_centra_ventana (ref window pw_ventana);this.x =pw_ventana.x + ((pw_ventana.width / 2) - (this.width / 2))
this.y =pw_ventana.y + ((pw_ventana.height / 2) - (this.height / 2))

end subroutine

public subroutine fw_boton (button pbt_boton);long ll_desplaza

CHOOSE CASE pbt_boton
	CASE ok!
		cb_ok1.x = (this.width / 2) - (cb_ok1.width / 2)
		cb_ok1.visible = true
	CASE okcancel!
		ll_desplaza = (this.width / 2) - (((cb_okcancel2.x + cb_okcancel2.width) - cb_okcancel1.x ) / 2)
		cb_okcancel1.x = cb_okcancel1.x + ll_desplaza
		cb_okcancel2.x = cb_okcancel2.x + ll_desplaza
		cb_okcancel1.visible = true
		cb_okcancel2.visible = true
	CASE yesno!
		ll_desplaza = (this.width / 2) - (((cb_yesno2.x + cb_yesno2.width) - cb_yesno1.x ) / 2)
		cb_yesno1.x = cb_yesno1.x + ll_desplaza
		cb_yesno2.x = cb_yesno2.x + ll_desplaza
		cb_yesno1.visible = true
		cb_yesno2.visible = true
	CASE yesnocancel!
		ll_desplaza = (this.width / 2) - (((cb_yesnocancel3.x + cb_yesnocancel3.width) - cb_yesnocancel1.x ) / 2)
		cb_yesnocancel1.x = cb_yesnocancel1.x + ll_desplaza
		cb_yesnocancel2.x = cb_yesnocancel2.x + ll_desplaza
		cb_yesnocancel3.x = cb_yesnocancel3.x + ll_desplaza
		cb_yesnocancel1.visible = true
		cb_yesnocancel2.visible = true
		cb_yesnocancel3.visible = true
END CHOOSE
end subroutine

public subroutine fw_icono (icon pi_icono);CHOOSE CASE pi_icono
	CASE question!
		p_1.picturename = "question.bmp"
	case stopsign!
		p_1.picturename = "error.bmp"
	case information!
		p_1.picturename = "information.bmp"
	case exclamation!
		p_1.picturename = "exclamation.bmp"
END CHOOSE
end subroutine

on w_mensaje.create
this.p_1=create p_1
this.mle_1=create mle_1
this.cb_yesnocancel2=create cb_yesnocancel2
this.cb_yesno2=create cb_yesno2
this.cb_yesnocancel3=create cb_yesnocancel3
this.cb_okcancel2=create cb_okcancel2
this.cb_ok1=create cb_ok1
this.cb_okcancel1=create cb_okcancel1
this.cb_yesno1=create cb_yesno1
this.cb_yesnocancel1=create cb_yesnocancel1
this.Control[]={this.p_1,&
this.mle_1,&
this.cb_yesnocancel2,&
this.cb_yesno2,&
this.cb_yesnocancel3,&
this.cb_okcancel2,&
this.cb_ok1,&
this.cb_okcancel1,&
this.cb_yesno1,&
this.cb_yesnocancel1}
end on

on w_mensaje.destroy
destroy(this.p_1)
destroy(this.mle_1)
destroy(this.cb_yesnocancel2)
destroy(this.cb_yesno2)
destroy(this.cb_yesnocancel3)
destroy(this.cb_okcancel2)
destroy(this.cb_ok1)
destroy(this.cb_okcancel1)
destroy(this.cb_yesno1)
destroy(this.cb_yesnocancel1)
end on

event open;int li_tamano_texto
long ll_desplaza
s_mensaje is_mensaje
is_mensaje=message.PowerObjectParm

this.title = is_mensaje.title

mle_1.text=is_mensaje.text
li_tamano_texto=PixelsToUnits(len(is_mensaje.text) * abs(mle_1.textsize),XPixelsToUnits!) 
mle_1.width=li_tamano_texto
this.width=li_tamano_texto


//Coloco la ventana
if isvalid(w_operaciones) then
	fw_centra_ventana(w_operaciones)
elseif isvalid(w_arranque_operaciones) then
	fw_centra_ventana(w_arranque_operaciones)
end if

//Coloco los botones
fw_boton(is_mensaje.boton)

//Coloco icono
fw_icono(is_mensaje.icono)
end event

type p_1 from picture within w_mensaje
int X=55
int Y=64
int Width=165
int Height=144
boolean Enabled=false
boolean FocusRectangle=false
end type

type mle_1 from multilineedit within w_mensaje
int X=288
int Y=64
int Width=2162
int Height=172
boolean Border=false
boolean DisplayOnly=true
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_yesnocancel2 from commandbutton within w_mensaje
int X=635
int Y=384
int Width=366
int Height=88
int TabOrder=10
boolean Visible=false
string Text="N&o"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,2)
end event

type cb_yesno2 from commandbutton within w_mensaje
int X=891
int Y=384
int Width=366
int Height=88
int TabOrder=40
boolean Visible=false
string Text="N&o"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,2)
end event

type cb_yesnocancel3 from commandbutton within w_mensaje
int X=1161
int Y=384
int Width=366
int Height=88
int TabOrder=20
boolean Visible=false
string Text="C&ancel"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,3)
end event

type cb_okcancel2 from commandbutton within w_mensaje
int X=891
int Y=384
int Width=366
int Height=88
int TabOrder=60
boolean Visible=false
string Text="C&ancel"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,2)
end event

type cb_ok1 from commandbutton within w_mensaje
int X=635
int Y=384
int Width=366
int Height=88
int TabOrder=70
boolean Visible=false
string Text="A&ceptar"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;closewithreturn(parent,1)
end event

type cb_okcancel1 from commandbutton within w_mensaje
int X=375
int Y=384
int Width=366
int Height=88
int TabOrder=50
boolean Visible=false
string Text="A&ceptar"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,1)
end event

type cb_yesno1 from commandbutton within w_mensaje
int X=375
int Y=384
int Width=366
int Height=88
int TabOrder=30
boolean Visible=false
string Text="S&i"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,1)
end event

type cb_yesnocancel1 from commandbutton within w_mensaje
int X=119
int Y=384
int Width=366
int Height=88
int TabOrder=20
boolean Visible=false
string Text="S&i"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,1)
end event


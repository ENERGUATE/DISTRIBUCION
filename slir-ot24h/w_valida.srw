HA$PBExportHeader$w_valida.srw
forward
global type w_valida from Window
end type
type st_1 from statictext within w_valida
end type
type cb_1 from commandbutton within w_valida
end type
type mle_1 from multilineedit within w_valida
end type
end forward

global type w_valida from Window
int X=1326
int Y=652
int Width=1641
int Height=1680
boolean TitleBar=true
string Title="Validaci$$HEX1$$f300$$ENDHEX$$n de ingreso de datos (w_valida)"
long BackColor=33554431
boolean ControlMenu=true
st_1 st_1
cb_1 cb_1
mle_1 mle_1
end type
global w_valida w_valida

on w_valida.create
this.st_1=create st_1
this.cb_1=create cb_1
this.mle_1=create mle_1
this.Control[]={this.st_1,&
this.cb_1,&
this.mle_1}
end on

on w_valida.destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.mle_1)
end on

event open;// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )












mle_1.text = Message.StringParm
end event

type st_1 from statictext within w_valida
int X=78
int Y=84
int Width=837
int Height=80
boolean Enabled=false
string Text="Verificar los siguientes errores:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=33554431
int TextSize=-10
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_valida
int X=649
int Y=1372
int Width=343
int Height=144
int TabOrder=20
string Text="Cerrar"
int TextSize=-10
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type mle_1 from multilineedit within w_valida
int X=78
int Y=208
int Width=1454
int Height=1084
int TabOrder=10
boolean Border=false
boolean HScrollBar=true
boolean VScrollBar=true
boolean AutoHScroll=true
boolean AutoVScroll=true
boolean DisplayOnly=true
long TextColor=128
int TextSize=-8
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


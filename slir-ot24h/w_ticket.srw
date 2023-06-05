HA$PBExportHeader$w_ticket.srw
forward
global type w_ticket from Window
end type
type sle_nombre from statictext within w_ticket
end type
type sle_ticket from statictext within w_ticket
end type
type cb_2 from commandbutton within w_ticket
end type
type cb_1 from commandbutton within w_ticket
end type
type st_4 from statictext within w_ticket
end type
type st_3 from statictext within w_ticket
end type
type st_2 from statictext within w_ticket
end type
type st_1 from statictext within w_ticket
end type
type r_1 from rectangle within w_ticket
end type
end forward

global type w_ticket from Window
int X=1326
int Y=652
int Width=1856
int Height=1112
boolean TitleBar=true
string Title="Ticket de OT24h"
long BackColor=15793151
WindowType WindowType=response!
sle_nombre sle_nombre
sle_ticket sle_ticket
cb_2 cb_2
cb_1 cb_1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
r_1 r_1
end type
global w_ticket w_ticket

on w_ticket.create
this.sle_nombre=create sle_nombre
this.sle_ticket=create sle_ticket
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.r_1=create r_1
this.Control[]={this.sle_nombre,&
this.sle_ticket,&
this.cb_2,&
this.cb_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.r_1}
end on

on w_ticket.destroy
destroy(this.sle_nombre)
destroy(this.sle_ticket)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.r_1)
end on

event open;st_ticket tic




// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )










tic= Message.PowerObjectParm	

sle_nombre.text=tic.persona_que_reporta
sle_ticket.text=tic.ticket
end event

type sle_nombre from statictext within w_ticket
int X=553
int Y=236
int Width=1129
int Height=144
boolean Enabled=false
string Text="none"
boolean FocusRectangle=false
long TextColor=128
long BackColor=15780518
int TextSize=-10
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_ticket from statictext within w_ticket
int X=553
int Y=396
int Width=1129
int Height=120
boolean Enabled=false
string Text="none"
boolean FocusRectangle=false
long TextColor=128
long BackColor=15780518
int TextSize=-18
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_ticket
int X=914
int Y=784
int Width=343
int Height=144
int TabOrder=10
string Text="No"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(Parent, "NO")


end event

type cb_1 from commandbutton within w_ticket
int X=448
int Y=784
int Width=343
int Height=144
int TabOrder=20
string Text="S$$HEX1$$ed00$$ENDHEX$$"
int TextSize=-10
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(Parent, "SI")

end event

type st_4 from statictext within w_ticket
int X=59
int Y=664
int Width=1289
int Height=80
boolean Enabled=false
string Text="$$HEX1$$bf00$$ENDHEX$$Desea ingresar otro evento del mismo cliente?"
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

type st_3 from statictext within w_ticket
int X=224
int Y=428
int Width=343
int Height=120
boolean Enabled=false
string Text="C$$HEX1$$f300$$ENDHEX$$digo:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=15780518
int TextSize=-10
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_ticket
int X=59
int Y=84
int Width=873
int Height=80
boolean Enabled=false
string Text="El evento ha sido registrado."
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

type st_1 from statictext within w_ticket
int X=224
int Y=236
int Width=270
int Height=80
boolean Enabled=false
string Text="Nombre:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=15780518
int TextSize=-10
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type r_1 from rectangle within w_ticket
int X=59
int Y=180
int Width=1728
int Height=420
boolean Enabled=false
int LineThickness=4
long LineColor=15780518
long FillColor=15780518
end type


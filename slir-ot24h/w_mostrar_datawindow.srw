HA$PBExportHeader$w_mostrar_datawindow.srw
forward
global type w_mostrar_datawindow from Window
end type
type cb_1 from commandbutton within w_mostrar_datawindow
end type
type mle_1 from multilineedit within w_mostrar_datawindow
end type
end forward

global type w_mostrar_datawindow from Window
int X=494
int Y=676
int Width=2688
int Height=1052
long BackColor=79741120
WindowType WindowType=child!
cb_1 cb_1
mle_1 mle_1
end type
global w_mostrar_datawindow w_mostrar_datawindow

on w_mostrar_datawindow.create
this.cb_1=create cb_1
this.mle_1=create mle_1
this.Control[]={this.cb_1,&
this.mle_1}
end on

on w_mostrar_datawindow.destroy
destroy(this.cb_1)
destroy(this.mle_1)
end on

event open;fg_colocar_ventana (w_mostrar_datawindow)
end event

type cb_1 from commandbutton within w_mostrar_datawindow
int X=1230
int Y=832
int Width=247
int Height=108
int TabOrder=2
string Text="OK"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CLOSE(PARENT)
end event

type mle_1 from multilineedit within w_mostrar_datawindow
int X=55
int Y=32
int Width=2578
int Height=772
int TabOrder=1
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean AutoHScroll=true
boolean AutoVScroll=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


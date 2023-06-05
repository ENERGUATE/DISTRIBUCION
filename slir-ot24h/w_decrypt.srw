HA$PBExportHeader$w_decrypt.srw
forward
global type w_decrypt from Window
end type
type cb_2 from commandbutton within w_decrypt
end type
type sle_4 from singlelineedit within w_decrypt
end type
type sle_3 from singlelineedit within w_decrypt
end type
type cb_1 from commandbutton within w_decrypt
end type
type sle_2 from singlelineedit within w_decrypt
end type
type sle_1 from singlelineedit within w_decrypt
end type
end forward

global type w_decrypt from Window
int X=1326
int Y=652
int Width=3205
int Height=2012
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_2 cb_2
sle_4 sle_4
sle_3 sle_3
cb_1 cb_1
sle_2 sle_2
sle_1 sle_1
end type
global w_decrypt w_decrypt

on w_decrypt.create
this.cb_2=create cb_2
this.sle_4=create sle_4
this.sle_3=create sle_3
this.cb_1=create cb_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.Control[]={this.cb_2,&
this.sle_4,&
this.sle_3,&
this.cb_1,&
this.sle_2,&
this.sle_1}
end on

on w_decrypt.destroy
destroy(this.cb_2)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.cb_1)
destroy(this.sle_2)
destroy(this.sle_1)
end on

type cb_2 from commandbutton within w_decrypt
int X=1691
int Y=632
int Width=343
int Height=144
int TabOrder=30
string Text="decript"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;sle_4.text=f_desencriptar(sle_3.text)
end event

type sle_4 from singlelineedit within w_decrypt
int X=1559
int Y=896
int Width=933
int Height=100
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_3 from singlelineedit within w_decrypt
int X=1563
int Y=352
int Width=923
int Height=100
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_decrypt
int X=549
int Y=640
int Width=343
int Height=144
int TabOrder=50
string Text="encript"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;sle_2.text=f_encriptar(sle_1.text)
end event

type sle_2 from singlelineedit within w_decrypt
int X=357
int Y=900
int Width=795
int Height=100
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_1 from singlelineedit within w_decrypt
int X=366
int Y=384
int Width=786
int Height=100
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


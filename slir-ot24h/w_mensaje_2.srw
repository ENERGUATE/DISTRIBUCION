HA$PBExportHeader$w_mensaje_2.srw
forward
global type w_mensaje_2 from w_sgigenerica
end type
type st_1 from statictext within w_mensaje_2
end type
type dw_1 from datawindow within w_mensaje_2
end type
type cb_1 from commandbutton within w_mensaje_2
end type
end forward

global type w_mensaje_2 from w_sgigenerica
int X=827
int Y=588
int Width=2258
int Height=1256
WindowType WindowType=response!
boolean TitleBar=true
string Title="Atenci$$HEX1$$f300$$ENDHEX$$n"
long BackColor=79741120
st_1 st_1
dw_1 dw_1
cb_1 cb_1
end type
global w_mensaje_2 w_mensaje_2

on w_mensaje_2.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_1
end on

on w_mensaje_2.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;call super::open;//mle_mensaje.text = Message.StringParm
DataStore lds_inst_int

lds_inst_int = Message.PowerObjectParm	
st_1.Text = gu_comunic.is_comunic.strval1

dw_1.SetTransObject(SQLCA)
lds_inst_int.ShareData(dw_1)

end event

type st_1 from statictext within w_mensaje_2
int X=55
int Y=100
int Width=2121
int Height=88
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="Interrupciones de nivel superior que afectan a la instalaci$$HEX1$$f300$$ENDHEX$$n"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=79741120
long BackColor=276856960
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_1 from datawindow within w_mensaje_2
int X=55
int Y=192
int Width=2121
int Height=784
int TabOrder=10
string DataObject="d_instalaciones_interrumpidas"
BorderStyle BorderStyle=StyleRaised!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_1 from commandbutton within w_mensaje_2
int X=951
int Y=1020
int Width=293
int Height=108
int TabOrder=20
string Text="Aceptar"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event


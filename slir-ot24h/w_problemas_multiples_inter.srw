HA$PBExportHeader$w_problemas_multiples_inter.srw
forward
global type w_problemas_multiples_inter from w_sgigenerica
end type
type dw_problemas from datawindow within w_problemas_multiples_inter
end type
type cb_1 from commandbutton within w_problemas_multiples_inter
end type
type cb_2 from commandbutton within w_problemas_multiples_inter
end type
type st_1 from statictext within w_problemas_multiples_inter
end type
type gb_1 from groupbox within w_problemas_multiples_inter
end type
end forward

global type w_problemas_multiples_inter from w_sgigenerica
int Width=3223
int Height=1268
WindowType WindowType=response!
boolean TitleBar=true
string Title="Interrupciones en Grupo"
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
dw_problemas dw_problemas
cb_1 cb_1
cb_2 cb_2
st_1 st_1
gb_1 gb_1
end type
global w_problemas_multiples_inter w_problemas_multiples_inter

event open;call super::open;SetPointer(HourGlass!)
DataStore lds_lista

lds_lista = Message.PowerObjectParm

lds_lista.ShareData(dw_problemas)
gu_comunic.is_comunic.accion_retorno = "Cancelar"
end event

on w_problemas_multiples_inter.create
int iCurrent
call super::create
this.dw_problemas=create dw_problemas
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_1=create st_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_problemas
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.gb_1
end on

on w_problemas_multiples_inter.destroy
call super::destroy
destroy(this.dw_problemas)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

type dw_problemas from datawindow within w_problemas_multiples_inter
int X=27
int Y=180
int Width=3141
int Height=608
int TabOrder=10
boolean BringToTop=true
string DataObject="d_desc_problemas"
BorderStyle BorderStyle=StyleRaised!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_1 from commandbutton within w_problemas_multiples_inter
int X=1115
int Y=944
int Width=361
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="&Aceptar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;gu_comunic.is_comunic.accion_retorno = "Marcar"

close(Parent)
end event

type cb_2 from commandbutton within w_problemas_multiples_inter
int X=1810
int Y=944
int Width=352
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="&Cancelar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;gu_comunic.is_comunic.accion_retorno = "Cancelar"

close(Parent)
end event

type st_1 from statictext within w_problemas_multiples_inter
int X=27
int Y=96
int Width=3141
int Height=84
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="Instalaciones sobre las que no se pueden marcar Interrupciones"
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

type gb_1 from groupbox within w_problemas_multiples_inter
int X=773
int Y=824
int Width=1669
int Height=296
int TabOrder=30
string Text="Continuar con la definici$$HEX1$$f300$$ENDHEX$$n de Interrupciones"
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


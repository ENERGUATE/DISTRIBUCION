HA$PBExportHeader$w_brigadas_contr_maniobra.srw
forward
global type w_brigadas_contr_maniobra from w_sgigenerica
end type
type st_elemento from statictext within w_brigadas_contr_maniobra
end type
type dw_listado_trabajo from datawindow within w_brigadas_contr_maniobra
end type
end forward

global type w_brigadas_contr_maniobra from w_sgigenerica
int X=677
int Y=864
int Width=2345
int Height=728
WindowType WindowType=response!
boolean TitleBar=true
string Title="Brigadas/Contratas asociadas a la maniobra"
long BackColor=79741120
st_elemento st_elemento
dw_listado_trabajo dw_listado_trabajo
end type
global w_brigadas_contr_maniobra w_brigadas_contr_maniobra

on w_brigadas_contr_maniobra.create
int iCurrent
call super::create
this.st_elemento=create st_elemento
this.dw_listado_trabajo=create dw_listado_trabajo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_elemento
this.Control[iCurrent+2]=this.dw_listado_trabajo
end on

on w_brigadas_contr_maniobra.destroy
call super::destroy
destroy(this.st_elemento)
destroy(this.dw_listado_trabajo)
end on

event open;call super::open;dw_listado_trabajo.SetTransObject(SQLCA)

dw_listado_trabajo.Retrieve(Message.DoubleParm)
end event

type st_elemento from statictext within w_brigadas_contr_maniobra
int X=18
int Y=44
int Width=2277
int Height=84
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="Brigadas y Contratas asociadas a la maniobra "
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

type dw_listado_trabajo from datawindow within w_brigadas_contr_maniobra
int X=18
int Y=128
int Width=2277
int Height=444
int TabOrder=10
string DataObject="d_brigadas_contr_maniobra"
BorderStyle BorderStyle=StyleRaised!
boolean VScrollBar=true
boolean LiveScroll=true
end type


HA$PBExportHeader$w_7105_instalaciones_descargo.srw
forward
global type w_7105_instalaciones_descargo from Window
end type
type dw_lista_instalaciones from u_gen_0000_lista within w_7105_instalaciones_descargo
end type
type cb_aceptar from commandbutton within w_7105_instalaciones_descargo
end type
end forward

global type w_7105_instalaciones_descargo from Window
int X=850
int Y=664
int Width=1966
int Height=1056
boolean TitleBar=true
string Title="Instalaciones asociadas al descargo"
long BackColor=79741120
WindowType WindowType=response!
dw_lista_instalaciones dw_lista_instalaciones
cb_aceptar cb_aceptar
end type
global w_7105_instalaciones_descargo w_7105_instalaciones_descargo

type variables
int ii_retorno=1
end variables

on w_7105_instalaciones_descargo.create
this.dw_lista_instalaciones=create dw_lista_instalaciones
this.cb_aceptar=create cb_aceptar
this.Control[]={this.dw_lista_instalaciones,&
this.cb_aceptar}
end on

on w_7105_instalaciones_descargo.destroy
destroy(this.dw_lista_instalaciones)
destroy(this.cb_aceptar)
end on

event open;int li_retorno
long ll_descargo
dw_lista_instalaciones.SetTransObject(SQLCA)
ll_descargo=message.Doubleparm
li_retorno=dw_lista_instalaciones.retrieve(ll_descargo)
if dw_lista_instalaciones.rowcount()=0 then
	closewithreturn(this,0)
end if
	
	
end event

type dw_lista_instalaciones from u_gen_0000_lista within w_7105_instalaciones_descargo
int X=123
int Y=112
int Width=1605
int Height=580
int TabOrder=10
string DataObject="d_7005_lista_instalaciones_descargo"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
end type

type cb_aceptar from commandbutton within w_7105_instalaciones_descargo
int X=750
int Y=784
int Width=343
int Height=108
int TabOrder=10
string Text="&Aceptar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;closewithreturn(parent,1)
end event


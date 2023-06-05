HA$PBExportHeader$w_interrupciones_descargo.srw
forward
global type w_interrupciones_descargo from w_sgigenerica
end type
type dw_instalaciones from u_inc_int_descargos within w_interrupciones_descargo
end type
end forward

global type w_interrupciones_descargo from w_sgigenerica
int X=46
int Y=676
int Width=3506
int Height=1288
WindowType WindowType=response!
boolean TitleBar=true
string Title="Interrupciones definidas en el Descargo"
long BackColor=79741120
string Icon="descargo.ico"
dw_instalaciones dw_instalaciones
end type
global w_interrupciones_descargo w_interrupciones_descargo

on w_interrupciones_descargo.create
int iCurrent
call super::create
this.dw_instalaciones=create dw_instalaciones
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_instalaciones
end on

on w_interrupciones_descargo.destroy
call super::destroy
destroy(this.dw_instalaciones)
end on

event open;call super::open;IF gu_comunic.is_comunic.intval4 = 0 THEN
	dw_instalaciones.dataobject = 'd_inc_int_descargos_bt'
END IF

dw_instalaciones.SetTransObject(SQLCA)
dw_instalaciones.retrieve(gu_comunic.is_comunic.longval4, gu_comunic.is_comunic.longval3)	
end event

type dw_instalaciones from u_inc_int_descargos within w_interrupciones_descargo
int X=64
int Y=116
int Width=3369
int Height=988
int TabOrder=10
boolean HScrollBar=true
boolean VScrollBar=true
end type


HA$PBExportHeader$w_6209_consulta_ot_instalacion.srw
forward
global type w_6209_consulta_ot_instalacion from Window
end type
type dw_1 from datawindow within w_6209_consulta_ot_instalacion
end type
end forward

global type w_6209_consulta_ot_instalacion from Window
int X=827
int Y=716
int Width=2007
int Height=960
boolean TitleBar=true
string Title="Untitled"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
dw_1 dw_1
end type
global w_6209_consulta_ot_instalacion w_6209_consulta_ot_instalacion

on w_6209_consulta_ot_instalacion.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_6209_consulta_ot_instalacion.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_6209_consulta_ot_instalacion
int Y=8
int Width=1966
int Height=844
int TabOrder=1
string DataObject="d_consulta_ot_instalacion"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type


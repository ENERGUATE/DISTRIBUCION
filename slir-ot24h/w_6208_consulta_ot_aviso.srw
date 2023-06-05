HA$PBExportHeader$w_6208_consulta_ot_aviso.srw
forward
global type w_6208_consulta_ot_aviso from Window
end type
type dw_1 from datawindow within w_6208_consulta_ot_aviso
end type
end forward

global type w_6208_consulta_ot_aviso from Window
int X=887
int Y=716
int Width=1893
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
global w_6208_consulta_ot_aviso w_6208_consulta_ot_aviso

on w_6208_consulta_ot_aviso.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_6208_consulta_ot_aviso.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_6208_consulta_ot_aviso
int Y=8
int Width=1856
int Height=844
int TabOrder=1
string DataObject="d_consulta_ot_avisos"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type


HA$PBExportHeader$w_despliega_arbol.srw
forward
global type w_despliega_arbol from w_sgigenerica
end type
type uo_1 from u_gen_espere_arbol within w_despliega_arbol
end type
end forward

global type w_despliega_arbol from w_sgigenerica
int X=1134
int Y=992
int Width=1678
int Height=460
WindowType WindowType=popup!
boolean TitleBar=false
long BackColor=79741120
boolean ControlMenu=false
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
boolean Border=false
uo_1 uo_1
end type
global w_despliega_arbol w_despliega_arbol

on w_despliega_arbol.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on w_despliega_arbol.destroy
call super::destroy
destroy(this.uo_1)
end on

event open;call super::open;timer(.3)
end event

event timer;uo_1.fnu_cambia_bitmap()


end event

type uo_1 from u_gen_espere_arbol within w_despliega_arbol
int X=0
int Y=0
int Width=1673
int Height=456
int TabOrder=10
BorderStyle BorderStyle=StyleRaised!
end type

on uo_1.destroy
call u_gen_espere_arbol::destroy
end on


HA$PBExportHeader$w_barra.srw
forward
global type w_barra from w_sgigenerica
end type
type uo_barra from u_pr_gen_espera_act within w_barra
end type
end forward

global type w_barra from w_sgigenerica
int X=1134
int Y=992
int Width=1285
int Height=396
WindowType WindowType=popup!
boolean TitleBar=false
long BackColor=79741120
boolean ControlMenu=false
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
boolean Border=false
uo_barra uo_barra
end type
global w_barra w_barra

on w_barra.create
int iCurrent
call super::create
this.uo_barra=create uo_barra
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_barra
end on

on w_barra.destroy
call super::destroy
destroy(this.uo_barra)
end on

type uo_barra from u_pr_gen_espera_act within w_barra
int X=9
int Y=8
int Width=1266
int Height=380
int TabOrder=1
BorderStyle BorderStyle=StyleRaised!
long BackColor=79741120
end type

on uo_barra.destroy
call u_pr_gen_espera_act::destroy
end on


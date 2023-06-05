HA$PBExportHeader$w_prin.srw
$PBExportComments$Ventana falsa w_prin para que regenere el objeto u_generico de comunicaciones desde bdg
forward
global type w_prin from w_sgigenerica
end type
end forward

global type w_prin from w_sgigenerica
int Width=3657
int Height=2400
long BackColor=81324524
end type
global w_prin w_prin

on w_prin.create
call super::create
end on

on w_prin.destroy
call super::destroy
end on


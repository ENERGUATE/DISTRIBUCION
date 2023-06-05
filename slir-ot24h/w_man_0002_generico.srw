HA$PBExportHeader$w_man_0002_generico.srw
forward
global type w_man_0002_generico from w_sgigenerica
end type
end forward

global type w_man_0002_generico from w_sgigenerica
int Width=2080
int Height=1276
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Consulta del Alcance de Incidencias"
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
end type
global w_man_0002_generico w_man_0002_generico

type variables
u_man_0002_generico io_principal 
end variables

on w_man_0002_generico.create
call super::create
end on

on w_man_0002_generico.destroy
call super::destroy
end on

event open;call super::open;io_principal = Create u_man_0002_alcance_de_incid
OpenUserObject (io_principal)
this.width = io_principal.f_anchura() 
this.height = io_principal.f_altura() + 105
io_principal.f_retrieve ()
this.title = io_principal.f_titulo ()
This.X = ( PixelsToUnits(800, XPixelsToUnits! )  -  This.Width)/2
This.Y = ( PixelsToUnits(600, YPixelsToUnits! )  -  This.Height)/2
end event


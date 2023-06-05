HA$PBExportHeader$w_master.srw
forward
global type w_master from Window
end type
end forward

global type w_master from Window
int X=1490
int Y=556
int Width=3602
int Height=1784
boolean TitleBar=true
long BackColor=16777215
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
end type
global w_master w_master

on w_master.create
end on

on w_master.destroy
end on

event open;// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )


end event


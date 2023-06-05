HA$PBExportHeader$w_save.srw
forward
global type w_save from Window
end type
type r_1 from rectangle within w_save
end type
end forward

global type w_save from Window
int X=663
int Y=368
int Width=1248
int Height=188
long BackColor=82700779
WindowType WindowType=popup!
r_1 r_1
end type
global w_save w_save

on w_save.create
this.r_1=create r_1
this.Control[]={this.r_1}
end on

on w_save.destroy
destroy(this.r_1)
end on

event resize;// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )


end event

type r_1 from rectangle within w_save
int X=50
int Y=48
int Width=1138
int Height=84
boolean Enabled=false
FillPattern FillPattern=vertical!
int LineThickness=4
long LineColor=16777215
long FillColor=8388608
end type


HA$PBExportHeader$w_msg.srw
forward
global type w_msg from Window
end type
type st_1 from statictext within w_msg
end type
end forward

global type w_msg from Window
int X=1326
int Y=652
int Width=1262
int Height=276
boolean TitleBar=true
long BackColor=16777215
st_1 st_1
end type
global w_msg w_msg

event open;// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )



st_1.Text = Message.StringParm


end event

on w_msg.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_msg.destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_msg
int Y=40
int Width=1198
int Height=88
boolean Enabled=false
string Text="*****"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=33554431
int TextSize=-12
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


HA$PBExportHeader$w_back.srw
forward
global type w_back from Window
end type
type p_1 from picture within w_back
end type
end forward

global type w_back from Window
int X=1490
int Y=556
int Width=6176
int Height=1784
long BackColor=16777215
boolean Border=false
WindowType WindowType=popup!
p_1 p_1
end type
global w_back w_back

on w_back.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_back.destroy
destroy(this.p_1)
end on

event open;this.title='Logo'


end event

type p_1 from picture within w_back
int X=4379
int Y=140
int Width=1125
int Height=300
string PictureName="pict\ener1.bmp"
boolean FocusRectangle=false
end type


HA$PBExportHeader$bin_dash.sru
forward
global type bin_dash from UserObject
end type
type p_7 from picture within bin_dash
end type
type st_a3 from statictext within bin_dash
end type
type em_b3 from editmask within bin_dash
end type
type r_3 from rectangle within bin_dash
end type
end forward

global type bin_dash from UserObject
int Width=471
int Height=660
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
p_7 p_7
st_a3 st_a3
em_b3 em_b3
r_3 r_3
end type
global bin_dash bin_dash

on bin_dash.create
this.p_7=create p_7
this.st_a3=create st_a3
this.em_b3=create em_b3
this.r_3=create r_3
this.Control[]={this.p_7,&
this.st_a3,&
this.em_b3,&
this.r_3}
end on

on bin_dash.destroy
destroy(this.p_7)
destroy(this.st_a3)
destroy(this.em_b3)
destroy(this.r_3)
end on

type p_7 from picture within bin_dash
int X=37
int Y=160
int Width=347
int Height=308
boolean FocusRectangle=false
end type

type st_a3 from statictext within bin_dash
int X=9
int Y=4
int Width=416
int Height=148
boolean Enabled=false
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=81324524
int TextSize=-8
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_b3 from editmask within bin_dash
int X=37
int Y=484
int Width=343
int Height=124
int TabOrder=10
Alignment Alignment=Center!
boolean Border=false
string Mask="###,###"
long TextColor=33554432
long BackColor=15780518
int TextSize=-14
int Weight=400
string FaceName="Helvetica LT Std"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type r_3 from rectangle within bin_dash
int Width=430
int Height=632
boolean Enabled=false
int LineThickness=4
long LineColor=10789024
long FillColor=15793151
end type


HA$PBExportHeader$bin_clock.sru
forward
global type bin_clock from UserObject
end type
type rb_m23 from radiobutton within bin_clock
end type
type rb_m22 from radiobutton within bin_clock
end type
type rb_m21 from radiobutton within bin_clock
end type
type rb_m13 from radiobutton within bin_clock
end type
type rb_m12 from radiobutton within bin_clock
end type
type rb_m11 from radiobutton within bin_clock
end type
type rb_h24 from radiobutton within bin_clock
end type
type rb_h23 from radiobutton within bin_clock
end type
type rb_h22 from radiobutton within bin_clock
end type
type rb_h21 from radiobutton within bin_clock
end type
type rb_h14 from radiobutton within bin_clock
end type
type rb_h13 from radiobutton within bin_clock
end type
end forward

global type bin_clock from UserObject
int Width=3205
int Height=2012
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
rb_m23 rb_m23
rb_m22 rb_m22
rb_m21 rb_m21
rb_m13 rb_m13
rb_m12 rb_m12
rb_m11 rb_m11
rb_h24 rb_h24
rb_h23 rb_h23
rb_h22 rb_h22
rb_h21 rb_h21
rb_h14 rb_h14
rb_h13 rb_h13
end type
global bin_clock bin_clock

on bin_clock.create
this.rb_m23=create rb_m23
this.rb_m22=create rb_m22
this.rb_m21=create rb_m21
this.rb_m13=create rb_m13
this.rb_m12=create rb_m12
this.rb_m11=create rb_m11
this.rb_h24=create rb_h24
this.rb_h23=create rb_h23
this.rb_h22=create rb_h22
this.rb_h21=create rb_h21
this.rb_h14=create rb_h14
this.rb_h13=create rb_h13
this.Control[]={this.rb_m23,&
this.rb_m22,&
this.rb_m21,&
this.rb_m13,&
this.rb_m12,&
this.rb_m11,&
this.rb_h24,&
this.rb_h23,&
this.rb_h22,&
this.rb_h21,&
this.rb_h14,&
this.rb_h13}
end on

on bin_clock.destroy
destroy(this.rb_m23)
destroy(this.rb_m22)
destroy(this.rb_m21)
destroy(this.rb_m13)
destroy(this.rb_m12)
destroy(this.rb_m11)
destroy(this.rb_h24)
destroy(this.rb_h23)
destroy(this.rb_h22)
destroy(this.rb_h21)
destroy(this.rb_h14)
destroy(this.rb_h13)
end on

type rb_m23 from radiobutton within bin_clock
int X=942
int Y=484
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_m22 from radiobutton within bin_clock
int X=942
int Y=388
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_m21 from radiobutton within bin_clock
int X=942
int Y=296
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_m13 from radiobutton within bin_clock
int X=859
int Y=468
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_m12 from radiobutton within bin_clock
int X=859
int Y=380
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_m11 from radiobutton within bin_clock
int X=859
int Y=296
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_h24 from radiobutton within bin_clock
int X=695
int Y=476
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_h23 from radiobutton within bin_clock
int X=686
int Y=396
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_h22 from radiobutton within bin_clock
int X=686
int Y=284
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_h21 from radiobutton within bin_clock
int X=686
int Y=200
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_h14 from radiobutton within bin_clock
int X=567
int Y=448
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_h13 from radiobutton within bin_clock
int X=567
int Y=372
int Width=69
int Height=80
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


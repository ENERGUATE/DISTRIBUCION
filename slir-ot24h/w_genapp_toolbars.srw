HA$PBExportHeader$w_genapp_toolbars.srw
$PBExportComments$Generated toolbar configuration window
forward
global type w_genapp_toolbars from Window
end type
type rb_floating from radiobutton within w_genapp_toolbars
end type
type rb_bottom from radiobutton within w_genapp_toolbars
end type
type rb_right from radiobutton within w_genapp_toolbars
end type
type rb_top from radiobutton within w_genapp_toolbars
end type
type rb_left from radiobutton within w_genapp_toolbars
end type
type cb_done from commandbutton within w_genapp_toolbars
end type
type cb_visible from commandbutton within w_genapp_toolbars
end type
type cbx_showtips from checkbox within w_genapp_toolbars
end type
type cbx_showtext from checkbox within w_genapp_toolbars
end type
type gb_1 from groupbox within w_genapp_toolbars
end type
end forward

global type w_genapp_toolbars from Window
int X=850
int Y=468
int Width=1157
int Height=856
boolean TitleBar=true
string Title="Toolbars"
long BackColor=12632256
boolean ControlMenu=true
WindowType WindowType=response!
rb_floating rb_floating
rb_bottom rb_bottom
rb_right rb_right
rb_top rb_top
rb_left rb_left
cb_done cb_done
cb_visible cb_visible
cbx_showtips cbx_showtips
cbx_showtext cbx_showtext
gb_1 gb_1
end type
global w_genapp_toolbars w_genapp_toolbars

type variables
/* Current application */
Application	iapp_application

/* Owning toolbar window */
Window		iw_window
end variables

event open;// Open script for w_genapp_toolbars

// Owning toolbar window is passed as reference
iw_window = message.powerobjectparm

// Note the current application
iapp_application = GetApplication ()

// Set toolbar alignment status
choose case iw_window.toolbaralignment
	case alignatbottom! 
		rb_bottom.Checked = TRUE
	case alignatleft!
		rb_left.Checked = TRUE
	case alignatright! 
		rb_right.Checked = TRUE
	case alignattop! 
		rb_top.Checked = TRUE
	case floating!
		rb_floating.Checked = TRUE
end choose

// Set toolbar visible status
if iw_window.toolbarvisible then
	cb_visible.text = "&Hide"
else
	cb_visible.text = "&Show"
end if

// Set toolbar text mode status
cbx_showtext.checked = iapp_application.toolbartext 

// Set toolbar tips mode status
cbx_showtips.checked = iapp_application.toolbartips 

end event

on w_genapp_toolbars.create
this.rb_floating=create rb_floating
this.rb_bottom=create rb_bottom
this.rb_right=create rb_right
this.rb_top=create rb_top
this.rb_left=create rb_left
this.cb_done=create cb_done
this.cb_visible=create cb_visible
this.cbx_showtips=create cbx_showtips
this.cbx_showtext=create cbx_showtext
this.gb_1=create gb_1
this.Control[]={ this.rb_floating,&
this.rb_bottom,&
this.rb_right,&
this.rb_top,&
this.rb_left,&
this.cb_done,&
this.cb_visible,&
this.cbx_showtips,&
this.cbx_showtext,&
this.gb_1}
end on

on w_genapp_toolbars.destroy
destroy(this.rb_floating)
destroy(this.rb_bottom)
destroy(this.rb_right)
destroy(this.rb_top)
destroy(this.rb_left)
destroy(this.cb_done)
destroy(this.cb_visible)
destroy(this.cbx_showtips)
destroy(this.cbx_showtext)
destroy(this.gb_1)
end on

type rb_floating from radiobutton within w_genapp_toolbars
int X=119
int Y=476
int Width=334
int Height=72
string Text="&Floating"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Make toolbar float
iw_window.toolbaralignment = floating!
end event

type rb_bottom from radiobutton within w_genapp_toolbars
int X=119
int Y=388
int Width=315
int Height=72
string Text="&Bottom"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Align toolbar at bottom
iw_window.toolbaralignment = alignatbottom!
end event

type rb_right from radiobutton within w_genapp_toolbars
int X=119
int Y=300
int Width=261
int Height=72
string Text="&Right"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Align toolbar at right
iw_window.toolbaralignment = alignatright!
end event

type rb_top from radiobutton within w_genapp_toolbars
int X=119
int Y=212
int Width=247
int Height=72
string Text="&Top"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Align toolbar at top
iw_window.toolbaralignment = alignattop!
end event

type rb_left from radiobutton within w_genapp_toolbars
int X=119
int Y=116
int Width=247
int Height=72
string Text="&Left"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Align toolbar at left
iw_window.toolbaralignment = alignatleft!
end event

type cb_done from commandbutton within w_genapp_toolbars
int X=663
int Y=216
int Width=334
int Height=108
int TabOrder=30
string Text="&Done"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Close toolbar configuration window
Close (parent)
end event

type cb_visible from commandbutton within w_genapp_toolbars
int X=658
int Y=72
int Width=334
int Height=108
int TabOrder=20
string Text="&Hide"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Indicate opposite toolbar visible status
if this.text = "&Hide" then
	iw_window.toolbarvisible = FALSE
	this.text = "&Show"
else
	iw_window.toolbarvisible = TRUE
	this.text = "&Hide"
end if
end event

type cbx_showtips from checkbox within w_genapp_toolbars
int X=617
int Y=616
int Width=439
int Height=72
string Text="Show Ti&ps"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Set toolbar tips mode
iapp_application.toolbartips = this.checked 

end event

type cbx_showtext from checkbox within w_genapp_toolbars
int X=55
int Y=616
int Width=457
int Height=72
string Text="Show Te&xt"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Set toolbar text mode
iapp_application.toolbartext = this.checked 

end event

type gb_1 from groupbox within w_genapp_toolbars
int X=55
int Y=44
int Width=507
int Height=544
int TabOrder=10
string Text="Move"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


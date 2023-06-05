HA$PBExportHeader$w_genapp_about.srw
$PBExportComments$Generated About window
forward
global type w_genapp_about from window
end type
type st_3 from statictext within w_genapp_about
end type
type st_version from statictext within w_genapp_about
end type
type st_2 from statictext within w_genapp_about
end type
type st_1 from statictext within w_genapp_about
end type
type cb_ok from commandbutton within w_genapp_about
end type
end forward

global type w_genapp_about from window
integer x = 873
integer y = 428
integer width = 1211
integer height = 916
boolean titlebar = true
string title = "Acerca de..."
boolean controlmenu = true
windowtype windowtype = response!
st_3 st_3
st_version st_version
st_2 st_2
st_1 st_1
cb_ok cb_ok
end type
global w_genapp_about w_genapp_about

on w_genapp_about.create
this.st_3=create st_3
this.st_version=create st_version
this.st_2=create st_2
this.st_1=create st_1
this.cb_ok=create cb_ok
this.Control[]={this.st_3,&
this.st_version,&
this.st_2,&
this.st_1,&
this.cb_ok}
end on

on w_genapp_about.destroy
destroy(this.st_3)
destroy(this.st_version)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_ok)
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


st_version.text=g_version
end event

type st_3 from statictext within w_genapp_about
integer x = 795
integer y = 712
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "2001-2016"
boolean focusrectangle = false
end type

type st_version from statictext within w_genapp_about
integer x = 59
integer y = 360
integer width = 521
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "NONE"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_genapp_about
integer x = 59
integer y = 280
integer width = 805
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "Oficina Telef$$HEX1$$f300$$ENDHEX$$nica 24 horas"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_genapp_about
integer x = 197
integer y = 124
integer width = 786
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 16711680
boolean enabled = false
string text = "SLIR"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_genapp_about
integer x = 475
integer y = 548
integer width = 279
integer height = 108
integer taborder = 1
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "OK"
boolean default = true
end type

event clicked;// Close "About" window

Close (parent)
end event


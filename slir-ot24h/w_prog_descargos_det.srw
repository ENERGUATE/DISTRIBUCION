HA$PBExportHeader$w_prog_descargos_det.srw
forward
global type w_prog_descargos_det from window
end type
type cb_2 from commandbutton within w_prog_descargos_det
end type
type cb_1 from commandbutton within w_prog_descargos_det
end type
type st_2 from statictext within w_prog_descargos_det
end type
type st_1 from statictext within w_prog_descargos_det
end type
type dw_descargos_estados from datawindow within w_prog_descargos_det
end type
type dw_descargos_det from datawindow within w_prog_descargos_det
end type
end forward

global type w_prog_descargos_det from window
integer x = 1326
integer y = 652
integer width = 4101
integer height = 2724
boolean titlebar = true
string title = "Consulta de descargos (w_prog_descargos_det)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 33554431
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
dw_descargos_estados dw_descargos_estados
dw_descargos_det dw_descargos_det
end type
global w_prog_descargos_det w_prog_descargos_det

on w_prog_descargos_det.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_descargos_estados=create dw_descargos_estados
this.dw_descargos_det=create dw_descargos_det
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.dw_descargos_estados,&
this.dw_descargos_det}
end on

on w_prog_descargos_det.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_descargos_estados)
destroy(this.dw_descargos_det)
end on

event resize;
// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )



end event

event open;long descargo

descargo= long(Message.StringParm)

//messagebox('info',string(descargo))

dw_descargos_det.retrieve(descargo)
dw_descargos_estados.retrieve(Descargo)



end event

type cb_2 from commandbutton within w_prog_descargos_det
integer x = 603
integer y = 2444
integer width = 379
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Estado sig>"
end type

event clicked;dw_descargos_estados.scrolltorow(dw_descargos_estados.getrow()+1)
end event

type cb_1 from commandbutton within w_prog_descargos_det
integer x = 206
integer y = 2444
integer width = 379
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "<Estado ant"
end type

event clicked;dw_descargos_estados.scrolltorow(dw_descargos_estados.getrow()-1)
end event

type st_2 from statictext within w_prog_descargos_det
integer x = 78
integer y = 1136
integer width = 590
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Estados del descargo"
boolean focusrectangle = false
end type

type st_1 from statictext within w_prog_descargos_det
integer x = 82
integer y = 28
integer width = 891
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Informaci$$HEX1$$f300$$ENDHEX$$n general del descargo"
boolean focusrectangle = false
end type

type dw_descargos_estados from datawindow within w_prog_descargos_det
integer x = 50
integer y = 1216
integer width = 3918
integer height = 1208
integer taborder = 20
string dataobject = "dw_open_descargos_estados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_descargos_det from datawindow within w_prog_descargos_det
integer x = 50
integer y = 112
integer width = 3918
integer height = 1020
integer taborder = 10
string dataobject = "dw_open_descargos_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event


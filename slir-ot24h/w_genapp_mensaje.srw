HA$PBExportHeader$w_genapp_mensaje.srw
forward
global type w_genapp_mensaje from window
end type
type cb_1 from commandbutton within w_genapp_mensaje
end type
type pb_1 from picturebutton within w_genapp_mensaje
end type
end forward

global type w_genapp_mensaje from window
integer width = 1111
integer height = 772
boolean titlebar = true
string title = "Bienvenido"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Information!"
boolean center = true
cb_1 cb_1
pb_1 pb_1
end type
global w_genapp_mensaje w_genapp_mensaje

on w_genapp_mensaje.create
this.cb_1=create cb_1
this.pb_1=create pb_1
this.Control[]={this.cb_1,&
this.pb_1}
end on

on w_genapp_mensaje.destroy
destroy(this.cb_1)
destroy(this.pb_1)
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

type cb_1 from commandbutton within w_genapp_mensaje
integer x = 215
integer y = 536
integer width = 695
integer height = 108
integer taborder = 20
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Continuar"
end type

event clicked;gu_comunic.is_comunic.longval3 = 1154442
gu_comunic.is_comunic.Accion_llamada = "Consulta"
gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_genapp_frame,0)

end event

type pb_1 from picturebutton within w_genapp_mensaje
integer x = 210
integer y = 12
integer width = 704
integer height = 524
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\Users\jdavila\Desktop\RECURSOS\online\pict\reporte_new.png"
alignment htextalign = left!
end type


HA$PBExportHeader$w_generacion_reportes.srw
forward
global type w_generacion_reportes from window
end type
type cb_aceptar from commandbutton within w_generacion_reportes
end type
type dw_fechas_reporte from datawindow within w_generacion_reportes
end type
type st_2 from statictext within w_generacion_reportes
end type
type st_1 from statictext within w_generacion_reportes
end type
end forward

global type w_generacion_reportes from window
integer width = 1403
integer height = 1064
boolean titlebar = true
string title = "Generaci$$HEX1$$f300$$ENDHEX$$n de reportes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_aceptar cb_aceptar
dw_fechas_reporte dw_fechas_reporte
st_2 st_2
st_1 st_1
end type
global w_generacion_reportes w_generacion_reportes

type variables

end variables

on w_generacion_reportes.create
this.cb_aceptar=create cb_aceptar
this.dw_fechas_reporte=create dw_fechas_reporte
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_aceptar,&
this.dw_fechas_reporte,&
this.st_2,&
this.st_1}
end on

on w_generacion_reportes.destroy
destroy(this.cb_aceptar)
destroy(this.dw_fechas_reporte)
destroy(this.st_2)
destroy(this.st_1)
end on

type cb_aceptar from commandbutton within w_generacion_reportes
integer x = 914
integer y = 796
integer width = 370
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Aceptar"
end type

event clicked;


datetime ldt_fecha_desde, ldt_fecha_hasta
u_reportes_str  lu_reportes

dw_fechas_reporte.AcceptText()
ldt_fecha_desde = dw_fechas_reporte.object.fecha_desde[1]
ldt_fecha_hasta = dw_fechas_reporte.object.fecha_hasta[1]


lu_reportes = CREATE u_reportes_str

lu_reportes.uf_set_fechas(ldt_fecha_desde, ldt_fecha_hasta)
lu_reportes.uf_generar_reportes()

//messagebox("", "La generaci$$HEX1$$f300$$ENDHEX$$n de ficheros ha concluido", Exclamation!, ok!)

DESTROY lu_reportes

close(parent)

end event

type dw_fechas_reporte from datawindow within w_generacion_reportes
integer x = 105
integer y = 344
integer width = 1239
integer height = 312
integer taborder = 10
string title = "none"
string dataobject = "d_fechas_reporte"
boolean border = false
boolean livescroll = true
end type

event constructor;

this.InsertRow(0)

this.object.fecha_hasta[1] = datetime(today())
this.object.fecha_desde[1] = datetime(relativedate(today(), -1))

this.AcceptText()



end event

type st_2 from statictext within w_generacion_reportes
integer x = 110
integer y = 92
integer width = 1074
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generaci$$HEX1$$f300$$ENDHEX$$n de reportes STR"
boolean focusrectangle = false
end type

type st_1 from statictext within w_generacion_reportes
integer x = 110
integer y = 204
integer width = 1184
integer height = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Introduzca las fechas deseadas"
boolean focusrectangle = false
end type


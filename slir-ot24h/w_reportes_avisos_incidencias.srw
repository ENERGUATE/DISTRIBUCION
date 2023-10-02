HA$PBExportHeader$w_reportes_avisos_incidencias.srw
forward
global type w_reportes_avisos_incidencias from window
end type
type p_3 from picture within w_reportes_avisos_incidencias
end type
type st_2 from statictext within w_reportes_avisos_incidencias
end type
type st_1 from statictext within w_reportes_avisos_incidencias
end type
type p_2 from picture within w_reportes_avisos_incidencias
end type
type p_1 from picture within w_reportes_avisos_incidencias
end type
type r_1 from rectangle within w_reportes_avisos_incidencias
end type
type r_2 from rectangle within w_reportes_avisos_incidencias
end type
type r_3 from rectangle within w_reportes_avisos_incidencias
end type
end forward

global type w_reportes_avisos_incidencias from window
integer width = 2190
integer height = 1468
boolean titlebar = true
string title = "SLIR-Objeto de Creacion de Informes Dinamicos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_3 p_3
st_2 st_2
st_1 st_1
p_2 p_2
p_1 p_1
r_1 r_1
r_2 r_2
r_3 r_3
end type
global w_reportes_avisos_incidencias w_reportes_avisos_incidencias

on w_reportes_avisos_incidencias.create
this.p_3=create p_3
this.st_2=create st_2
this.st_1=create st_1
this.p_2=create p_2
this.p_1=create p_1
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.Control[]={this.p_3,&
this.st_2,&
this.st_1,&
this.p_2,&
this.p_1,&
this.r_1,&
this.r_2,&
this.r_3}
end on

on w_reportes_avisos_incidencias.destroy
destroy(this.p_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
end on

type p_3 from picture within w_reportes_avisos_incidencias
integer x = 1495
integer y = 496
integer width = 229
integer height = 204
string picturename = "C:\OT24\estable\pict\Detalle_incidencia_2.png"
boolean focusrectangle = false
end type

type st_2 from statictext within w_reportes_avisos_incidencias
integer x = 1211
integer y = 900
integer width = 645
integer height = 136
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "INFORME AVISOS CON INCIDENCIA"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_reportes_avisos_incidencias
integer x = 265
integer y = 900
integer width = 695
integer height = 128
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "INFORME AVISOS"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_2 from picture within w_reportes_avisos_incidencias
integer x = 1280
integer y = 288
integer width = 453
integer height = 440
string picturename = "C:\OT24\estable\pict\reporte_new.png"
boolean focusrectangle = false
end type

event clicked;gu_comunic.is_comunic.accion_llamada="gi_avisos"	
OpenSheet (w_reportes_avisos_incidencias_2, w_genapp_frame,3, layered!)
w_reportes_avisos_incidencias_2.is_tabla_consulta="gi_avisos"
w_reportes_avisos_incidencias_2.postevent("ue_post_open")
close(w_reportes_avisos_incidencias)
end event

type p_1 from picture within w_reportes_avisos_incidencias
integer x = 393
integer y = 288
integer width = 453
integer height = 440
string picturename = "C:\OT24\estable\pict\reporte_new.png"
boolean focusrectangle = false
end type

event clicked;gu_comunic.is_comunic.accion_llamada="gi_avisos"	
OpenSheet (w_reportes, w_genapp_frame,3, layered!)
w_reportes.is_tabla_consulta="gi_avisos"
w_reportes.postevent("ue_post_open")
close(w_reportes_avisos_incidencias)
end event

type r_1 from rectangle within w_reportes_avisos_incidencias
integer linethickness = 4
long fillcolor = 16777215
integer width = 2171
integer height = 1380
end type

type r_2 from rectangle within w_reportes_avisos_incidencias
long linecolor = 15780518
integer linethickness = 4
long fillcolor = 16777215
integer x = 1257
integer y = 232
integer width = 549
integer height = 552
end type

type r_3 from rectangle within w_reportes_avisos_incidencias
long linecolor = 15780518
integer linethickness = 4
long fillcolor = 16777215
integer x = 343
integer y = 232
integer width = 549
integer height = 552
end type


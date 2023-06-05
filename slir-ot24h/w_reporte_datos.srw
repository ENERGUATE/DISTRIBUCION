HA$PBExportHeader$w_reporte_datos.srw
forward
global type w_reporte_datos from window
end type
type st_4 from statictext within w_reporte_datos
end type
type hpb_infocarga from hprogressbar within w_reporte_datos
end type
type cb_refrescar from commandbutton within w_reporte_datos
end type
type st_3 from statictext within w_reporte_datos
end type
type dw_det_llamadas from datawindow within w_reporte_datos
end type
type dw_top_llamadas from datawindow within w_reporte_datos
end type
type mc_1 from monthcalendar within w_reporte_datos
end type
type cbx_fecha from checkbox within w_reporte_datos
end type
type cbx_dia from checkbox within w_reporte_datos
end type
type st_avi_resuelto from statictext within w_reporte_datos
end type
type st_avi_pendiente from statictext within w_reporte_datos
end type
type st_2 from statictext within w_reporte_datos
end type
type st_1 from statictext within w_reporte_datos
end type
type dw_causa_reclamo from datawindow within w_reporte_datos
end type
type dw_rep_llamadas from datawindow within w_reporte_datos
end type
type r_1 from rectangle within w_reporte_datos
end type
type r_2 from rectangle within w_reporte_datos
end type
type r_3 from rectangle within w_reporte_datos
end type
end forward

global type w_reporte_datos from window
integer width = 6071
integer height = 3180
boolean titlebar = true
string title = "Estad$$HEX1$$ed00$$ENDHEX$$sticas OT24H (w_reporte_datos)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean vscrollbar = true
boolean resizable = true
string icon = "AppIcon!"
boolean center = true
st_4 st_4
hpb_infocarga hpb_infocarga
cb_refrescar cb_refrescar
st_3 st_3
dw_det_llamadas dw_det_llamadas
dw_top_llamadas dw_top_llamadas
mc_1 mc_1
cbx_fecha cbx_fecha
cbx_dia cbx_dia
st_avi_resuelto st_avi_resuelto
st_avi_pendiente st_avi_pendiente
st_2 st_2
st_1 st_1
dw_causa_reclamo dw_causa_reclamo
dw_rep_llamadas dw_rep_llamadas
r_1 r_1
r_2 r_2
r_3 r_3
end type
global w_reporte_datos w_reporte_datos

forward prototypes
public subroutine f_estilo_grafica ()
public subroutine f_cargar_graficas (string ls_fecha_seleccionada)
end prototypes

public subroutine f_estilo_grafica ();// Set the background color
//RGB(135, 206, 235)) - CELESTE
int li_cant,li_i

//Reporte llamadas
li_cant = dw_rep_llamadas.rowcount()
FOR li_i=1 to li_cant
	dw_rep_llamadas.SetDataStyle("gr_llamadas_dia" , 1,	li_i,  foreground!, RGB(34, 113, 179))
NEXT

//Reporte causas
li_cant = dw_causa_reclamo.rowcount()
FOR li_i=1 to li_cant
	dw_causa_reclamo.SetDataStyle("gr_causas_r" , 1,	li_i,  foreground!, RGB(135, 206, 255))
NEXT

//Reporte top llamadas
li_cant = dw_top_llamadas.rowcount()
FOR li_i=1 to li_cant
	dw_top_llamadas.SetDataStyle("gr_top_llamadas" , 1,	li_i,  foreground!, RGB(135, 206, 255))
NEXT

//Reporte top llamadas
li_cant = dw_det_llamadas.rowcount()
FOR li_i=1 to li_cant
	if li_i = 1 then
		dw_det_llamadas.SetDataStyle("gr_det_llamada" , 1,	li_i,  foreground!, RGB(12, 183, 242))
	else
		if li_i = 3 then
			dw_det_llamadas.SetDataStyle("gr_det_llamada" , 1,	li_i,  foreground!, RGB(130, 130, 130))
		end if
	end if
NEXT

end subroutine

public subroutine f_cargar_graficas (string ls_fecha_seleccionada);long ll_cant_avi_p, ll_cant_avi_r
string ls_fecha1, ls_fecha2

//Definimos las propiedades en el Hprogressbar.
hpb_infocarga.minposition=0
//El total de registros devuelto por la consulta lo asignamos a su maxima posicion.
hpb_infocarga.maxposition=100
//Ponemos el Hprogressbar a una minima posicion.
hpb_infocarga.position=1
hpb_infocarga.visible=true
st_4.visible = TRUE

//concatenar la hora a la fecha
hpb_infocarga.position = hpb_infocarga.position + 1
ls_fecha1 = ls_fecha_seleccionada + ' 00:00:00'
hpb_infocarga.position = hpb_infocarga.position + 5
ls_fecha2 = ls_fecha_seleccionada + ' 23:59:50'
hpb_infocarga.position = hpb_infocarga.position + 5

//Ocultar graficas para cargarlas
dw_rep_llamadas.visible = false
hpb_infocarga.position = hpb_infocarga.position + 5
dw_causa_reclamo.visible = false
hpb_infocarga.position = hpb_infocarga.position + 5
dw_top_llamadas.visible = false
hpb_infocarga.position = hpb_infocarga.position + 5
dw_det_llamadas.visible = false
hpb_infocarga.position = hpb_infocarga.position + 5

//openwithparm(w_msg, "Cargando...")

hpb_infocarga.position = hpb_infocarga.position + 5

//Grafica de reporte de llamadas
dw_rep_llamadas.SetTransObject(sqlca)
dw_rep_llamadas.Retrieve(ls_fecha1,ls_fecha2)

hpb_infocarga.position = hpb_infocarga.position + 10

//Grafica de causas de llamadas
dw_causa_reclamo.SetTransObject(sqlca)
dw_causa_reclamo.Retrieve(ls_fecha1,ls_fecha2)

hpb_infocarga.position = hpb_infocarga.position + 10

//Grafica top llamadas <20
dw_top_llamadas.SetTransObject(sqlca)
dw_top_llamadas.Retrieve(ls_fecha1,ls_fecha2)

hpb_infocarga.position = hpb_infocarga.position + 10

//Grafica detalle llamadas
dw_det_llamadas.SetTransObject(sqlca)
dw_det_llamadas.Retrieve(ls_fecha1,ls_fecha2)

hpb_infocarga.position = hpb_infocarga.position + 10

f_estilo_grafica()

hpb_infocarga.position = hpb_infocarga.position + 10

//Cantidad de registros por avisos pendientes y resueltos
//AVISOS INGRESADOS EN EL D$$HEX1$$cd00$$ENDHEX$$A.
SELECT COUNT(*)
INTO :ll_cant_avi_p
FROM GI_AVISOS
WHERE TRUNC(F_ALTA) >= TO_DATE(:ls_fecha1,'DD/MM/YYYY HH24;MI:SS')
AND TRUNC(F_ALTA) <= TO_DATE(:ls_fecha2,'DD/MM/YYYY HH24;MI:SS');

hpb_infocarga.position = hpb_infocarga.position + 10

//AVISOS RESUELTOS EN EL D$$HEX1$$cd00$$ENDHEX$$A.
SELECT COUNT(*)
INTO :ll_cant_avi_r
FROM GI_AVISOS
WHERE TRUNC(F_ALTA) >= TO_DATE(:ls_fecha1,'DD/MM/YYYY HH24;MI:SS')
AND TRUNC(F_ALTA) <= TO_DATE(:ls_fecha2,'DD/MM/YYYY HH24;MI:SS')
AND (TRIM(OBS_CMD) IS NOT NULL);

hpb_infocarga.position = hpb_infocarga.position + 10

//Mostrar graficas
dw_rep_llamadas.visible = true
dw_causa_reclamo.visible = true
dw_top_llamadas.visible = true
dw_det_llamadas.visible = true

hpb_infocarga.position = hpb_infocarga.position + 10

// Mostrar datos
st_avi_pendiente.text = string(ll_cant_avi_p)

hpb_infocarga.visible = false
st_4.visible = false

st_avi_resuelto.text = string(ll_cant_avi_r)

//close(w_msg)
end subroutine

on w_reporte_datos.create
this.st_4=create st_4
this.hpb_infocarga=create hpb_infocarga
this.cb_refrescar=create cb_refrescar
this.st_3=create st_3
this.dw_det_llamadas=create dw_det_llamadas
this.dw_top_llamadas=create dw_top_llamadas
this.mc_1=create mc_1
this.cbx_fecha=create cbx_fecha
this.cbx_dia=create cbx_dia
this.st_avi_resuelto=create st_avi_resuelto
this.st_avi_pendiente=create st_avi_pendiente
this.st_2=create st_2
this.st_1=create st_1
this.dw_causa_reclamo=create dw_causa_reclamo
this.dw_rep_llamadas=create dw_rep_llamadas
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.Control[]={this.st_4,&
this.hpb_infocarga,&
this.cb_refrescar,&
this.st_3,&
this.dw_det_llamadas,&
this.dw_top_llamadas,&
this.mc_1,&
this.cbx_fecha,&
this.cbx_dia,&
this.st_avi_resuelto,&
this.st_avi_pendiente,&
this.st_2,&
this.st_1,&
this.dw_causa_reclamo,&
this.dw_rep_llamadas,&
this.r_1,&
this.r_2,&
this.r_3}
end on

on w_reporte_datos.destroy
destroy(this.st_4)
destroy(this.hpb_infocarga)
destroy(this.cb_refrescar)
destroy(this.st_3)
destroy(this.dw_det_llamadas)
destroy(this.dw_top_llamadas)
destroy(this.mc_1)
destroy(this.cbx_fecha)
destroy(this.cbx_dia)
destroy(this.st_avi_resuelto)
destroy(this.st_avi_pendiente)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_causa_reclamo)
destroy(this.dw_rep_llamadas)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
end on

event open;//string ls_fecha_hoy

hpb_infocarga.visible = false
st_4.visible = false
cbx_dia.enabled = false
cbx_fecha.enabled = false

r_1.fillcolor = RGB(13,67,105)
st_1.backcolor = RGB(13,67,105)
st_avi_pendiente.backcolor = RGB(13,67,105)
r_2.fillcolor = RGB(13,67,105)
st_2.backcolor = RGB(13,67,105)
st_avi_resuelto.backcolor = RGB(13,67,105)


//ls_fecha_hoy = string(today())

//f_cargar_graficas(ls_fecha_hoy)
end event

type st_4 from statictext within w_reporte_datos
integer x = 2112
integer y = 1288
integer width = 1399
integer height = 116
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 134217732
string text = "                           Cargando..."
boolean border = true
long bordercolor = 8421504
boolean focusrectangle = false
end type

type hpb_infocarga from hprogressbar within w_reporte_datos
integer x = 2112
integer y = 1192
integer width = 1403
integer height = 104
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_refrescar from commandbutton within w_reporte_datos
integer x = 2208
integer y = 84
integer width = 677
integer height = 136
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Consultar / Refrescar"
end type

event clicked;string ls_fecha_hoy

hpb_infocarga.visible = TRUE
st_4.visible = TRUE

ls_fecha_hoy = string(today())
f_cargar_graficas(ls_fecha_hoy)

cbx_dia.enabled = TRUE
cbx_fecha.enabled = TRUE
end event

type st_3 from statictext within w_reporte_datos
integer x = 2158
integer y = 356
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean focusrectangle = false
end type

type dw_det_llamadas from datawindow within w_reporte_datos
event ue_mousemove pbm_mousemove
integer x = 2697
integer y = 296
integer width = 1979
integer height = 1096
integer taborder = 40
string dataobject = "dw_01detalle_llamadas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_top_llamadas from datawindow within w_reporte_datos
event ue_mousemove pbm_mousemove
integer x = 2697
integer y = 1448
integer width = 2647
integer height = 1596
integer taborder = 30
string title = "dw_top_llamadas"
string dataobject = "dw_01top_llamadas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;grObjectType ClickedObject
string ls_grgraphname = "gr_top_llamadas", ls_porc, ls_help
int li_series, li_category
double ll_cant, ll_por
/************************************************************
Find out where the user clicked in the graph
***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
li_category)
/************************************************************
If user clicked on data or category, find out which one
***********************************************************/
If ClickedObject = TypeData! Then
st_3.x = parent.PointerX()
st_3.y = parent.PointerY() - 80
st_3.visible = TRUE
ls_help = STRING((this.GetData(ls_grgraphname, li_series, li_category)) , '###,###' )
st_3.text = ls_help
st_3.width = len(ls_help) * 33.4

else
st_3.VISIBLE = FALSE
End If
end event

type mc_1 from monthcalendar within w_reporte_datos
boolean visible = false
integer x = 4727
integer y = 32
integer width = 1184
integer height = 760
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event datechanged;Date ld_fecha
string ls_fecha_s
int li_return

li_return = mc_1.GetSelectedDate(ld_fecha)
ls_fecha_s = string(ld_fecha)

if li_return = 0 then
	f_cargar_graficas(ls_fecha_s)
else
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Seleccione un solo d$$HEX1$$ed00$$ENDHEX$$a")
end if
end event

type cbx_fecha from checkbox within w_reporte_datos
integer x = 4005
integer y = 56
integer width = 626
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Registros por Fecha"
end type

event clicked;cbx_dia.checked = false
cbx_fecha.checked = true
mc_1.visible = true
end event

type cbx_dia from checkbox within w_reporte_datos
integer x = 3442
integer y = 56
integer width = 549
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Registros del D$$HEX1$$ed00$$ENDHEX$$a"
boolean checked = true
end type

event clicked;string ls_fecha_hoy

cbx_fecha.checked = false
mc_1.visible = false
cbx_dia.checked = true

//Cargar los registros del dia
ls_fecha_hoy = string(today())
f_cargar_graficas(ls_fecha_hoy)
end event

type st_avi_resuelto from statictext within w_reporte_datos
integer x = 1134
integer y = 136
integer width = 709
integer height = 108
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "0000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_avi_pendiente from statictext within w_reporte_datos
integer x = 178
integer y = 136
integer width = 709
integer height = 108
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "0000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_reporte_datos
integer x = 1033
integer y = 44
integer width = 910
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "AVISOS RESUELTOS EN EL DIA"
alignment alignment = center!
long bordercolor = 8421504
boolean focusrectangle = false
end type

type st_1 from statictext within w_reporte_datos
integer x = 78
integer y = 48
integer width = 910
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "AVISOS INGRESADOS EN EL D$$HEX1$$cd00$$ENDHEX$$A"
alignment alignment = center!
long bordercolor = 8421504
boolean focusrectangle = false
end type

type dw_causa_reclamo from datawindow within w_reporte_datos
event ue_mousemove pbm_mousemove
integer x = 73
integer y = 1448
integer width = 2560
integer height = 1596
integer taborder = 30
string dataobject = "dw_01causa_reclamos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;grObjectType ClickedObject
string ls_grgraphname = "gr_causas_r", ls_porc, ls_help
int li_series, li_category
double ll_cant, ll_por
/************************************************************
Find out where the user clicked in the graph
***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
li_category)
/************************************************************
If user clicked on data or category, find out which one
***********************************************************/
If ClickedObject = TypeData! Then
st_3.x = parent.PointerX()
st_3.y = parent.PointerY() - 80
st_3.visible = TRUE
ls_help = STRING((this.GetData(ls_grgraphname, li_series, li_category)) , '###,###' )
st_3.text = ls_help
st_3.width = len(ls_help) * 33.4

else
st_3.VISIBLE = FALSE
End If
end event

type dw_rep_llamadas from datawindow within w_reporte_datos
event ue_mousemove pbm_mousemove
integer x = 73
integer y = 296
integer width = 2560
integer height = 1096
integer taborder = 20
string dataobject = "dw_01reporte_llamadas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;grObjectType ClickedObject
string ls_grgraphname = "gr_llamadas_dia", ls_porc, ls_help
int li_series, li_category
double ll_cant, ll_por
/************************************************************
Find out where the user clicked in the graph
***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
li_category)
/************************************************************
If user clicked on data or category, find out which one
***********************************************************/
If ClickedObject = TypeData! Then
st_3.x = parent.PointerX()
st_3.y = parent.PointerY() - 80
st_3.visible = TRUE
ls_help = STRING((this.GetData(ls_grgraphname, li_series, li_category)) , '###,###' )
st_3.text = ls_help
st_3.width = len(ls_help) * 33.4

else
st_3.VISIBLE = FALSE
End If
end event

type r_1 from rectangle within w_reporte_datos
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 134217730
integer x = 69
integer y = 24
integer width = 937
integer height = 232
end type

type r_2 from rectangle within w_reporte_datos
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 134217730
integer x = 1019
integer y = 24
integer width = 937
integer height = 232
end type

type r_3 from rectangle within w_reporte_datos
long linecolor = 8388608
integer linethickness = 4
long fillcolor = 16777215
integer x = 3410
integer y = 32
integer width = 1266
integer height = 164
end type


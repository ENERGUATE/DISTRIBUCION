HA$PBExportHeader$w_desborde_llamadas.srw
forward
global type w_desborde_llamadas from window
end type
type mc_1 from monthcalendar within w_desborde_llamadas
end type
type cbx_fecha from checkbox within w_desborde_llamadas
end type
type cbx_dia from checkbox within w_desborde_llamadas
end type
type hpb_infocarga from hprogressbar within w_desborde_llamadas
end type
type st_4 from statictext within w_desborde_llamadas
end type
type cb_obtener_datos from commandbutton within w_desborde_llamadas
end type
type st_help from statictext within w_desborde_llamadas
end type
type dw_desborde_all_nomdepto from datawindow within w_desborde_llamadas
end type
type ddlb_deptos from dropdownlistbox within w_desborde_llamadas
end type
type st_3 from statictext within w_desborde_llamadas
end type
type dw_desborde_causa from datawindow within w_desborde_llamadas
end type
type dw_desborde_depto from datawindow within w_desborde_llamadas
end type
type r_1 from rectangle within w_desborde_llamadas
end type
end forward

global type w_desborde_llamadas from window
integer width = 5998
integer height = 2908
boolean titlebar = true
string title = "Desborde de llamadas (w_desborde_llamadas)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
mc_1 mc_1
cbx_fecha cbx_fecha
cbx_dia cbx_dia
hpb_infocarga hpb_infocarga
st_4 st_4
cb_obtener_datos cb_obtener_datos
st_help st_help
dw_desborde_all_nomdepto dw_desborde_all_nomdepto
ddlb_deptos ddlb_deptos
st_3 st_3
dw_desborde_causa dw_desborde_causa
dw_desborde_depto dw_desborde_depto
r_1 r_1
end type
global w_desborde_llamadas w_desborde_llamadas

type variables
string is_deptoActive, ls_fecha1,ls_fecha2
end variables
forward prototypes
public subroutine f_carga_datos (string ls_fecha_seleccionada)
public subroutine f_carga_grafica_detalle_causa ()
end prototypes

public subroutine f_carga_datos (string ls_fecha_seleccionada);int li_punt, li_punt2
integer li_seriesNbr
long ll_total

//openwithparm(w_msg, "Cargando...")
st_help.visible = false

//Definimos las propiedades en el Hprogressbar.
hpb_infocarga.minposition=0
//El total de registros devuelto por la consulta lo asignamos a su maxima posicion.
hpb_infocarga.maxposition=100
//Ponemos el Hprogressbar a una minima posicion.
hpb_infocarga.position = 1
hpb_infocarga.visible=true
st_4.visible = TRUE

//Concatenar la hora a la fecha
hpb_infocarga.position = hpb_infocarga.position + 1
ls_fecha1 = ls_fecha_seleccionada + ' 00:00:00'
hpb_infocarga.position = hpb_infocarga.position + 5
ls_fecha2 = ls_fecha_seleccionada + ' 23:59:50'
hpb_infocarga.position = hpb_infocarga.position + 5

hpb_infocarga.position = hpb_infocarga.position + 5

// Desborde de llamadas por departamento
dw_desborde_depto.settransobject(sqlca2)
dw_desborde_depto.retrieve(ls_fecha1, ls_fecha2)

hpb_infocarga.position = hpb_infocarga.position + 5

dw_desborde_depto.visible = false

hpb_infocarga.position = hpb_infocarga.position + 10

FOR li_punt2 = 1 to dw_desborde_depto.RowCount()		
		// Modificamos el color de barra del gr$$HEX1$$e100$$ENDHEX$$fico
		dw_desborde_depto.SetdataStyle("gr_desborde", 1, li_punt2, Foreground!, RGB(9, 132, 227))
		dw_desborde_depto.SetdataStyle("gr_desborde", 1, li_punt2, Background!, RGB(9, 132, 227))
		hpb_infocarga.position = hpb_infocarga.position + 1
NEXT

dw_desborde_depto.visible = true
hpb_infocarga.visible=true
st_4.visible = TRUE

hpb_infocarga.position = hpb_infocarga.position + 60

// Desborde de llamadas por causa
f_carga_grafica_detalle_causa()
//ddlb_deptos.Event selectionchanged(li_punt)

hpb_infocarga.visible = FALSE
st_4.visible = FALSE

//close(w_msg)
end subroutine

public subroutine f_carga_grafica_detalle_causa ();int li_punt

//openwithparm(w_msg, "Cargando...")

//Definimos las propiedades en el Hprogressbar.
hpb_infocarga.minposition=0
//El total de registros devuelto por la consulta lo asignamos a su maxima posicion.
hpb_infocarga.maxposition=100
//Ponemos el Hprogressbar a una minima posicion.
hpb_infocarga.position=1
hpb_infocarga.visible = TRUE
st_4.visible = TRUE
hpb_infocarga.position = hpb_infocarga.position + 10

IF ddlb_deptos.text = 'TODOS' THEN
	dw_desborde_causa.dataobject = "dw_desborde_causa_all_depto"
ELSE
	dw_desborde_causa.dataobject = "dw_desborde_causa"
END IF

hpb_infocarga.position = hpb_infocarga.position + 20

dw_desborde_causa.settransobject(sqlca2)	
IF ddlb_deptos.text = 'TODOS' THEN
	dw_desborde_causa.retrieve(ls_fecha1, ls_fecha2)
ELSE
	dw_desborde_causa.retrieve(ddlb_deptos.text, ls_fecha1, ls_fecha2)
END IF
hpb_infocarga.position = hpb_infocarga.position + 60

dw_desborde_causa.visible = false
FOR li_punt = 1 to dw_desborde_causa.RowCount()		
	// Modificamos el color de barra del gr$$HEX1$$e100$$ENDHEX$$fico para causa
	dw_desborde_causa.SetdataStyle("gr_desborde", 1, li_punt, Foreground!, RGB(9, 132, 227))
	dw_desborde_causa.SetdataStyle("gr_desborde", 1, li_punt, Background!, RGB(9, 132, 227))
NEXT

dw_desborde_causa.visible = true
ddlb_deptos.enabled = true
hpb_infocarga.visible = false
st_4.visible = false

//close(w_msg)
end subroutine

on w_desborde_llamadas.create
this.mc_1=create mc_1
this.cbx_fecha=create cbx_fecha
this.cbx_dia=create cbx_dia
this.hpb_infocarga=create hpb_infocarga
this.st_4=create st_4
this.cb_obtener_datos=create cb_obtener_datos
this.st_help=create st_help
this.dw_desborde_all_nomdepto=create dw_desborde_all_nomdepto
this.ddlb_deptos=create ddlb_deptos
this.st_3=create st_3
this.dw_desborde_causa=create dw_desborde_causa
this.dw_desborde_depto=create dw_desborde_depto
this.r_1=create r_1
this.Control[]={this.mc_1,&
this.cbx_fecha,&
this.cbx_dia,&
this.hpb_infocarga,&
this.st_4,&
this.cb_obtener_datos,&
this.st_help,&
this.dw_desborde_all_nomdepto,&
this.ddlb_deptos,&
this.st_3,&
this.dw_desborde_causa,&
this.dw_desborde_depto,&
this.r_1}
end on

on w_desborde_llamadas.destroy
destroy(this.mc_1)
destroy(this.cbx_fecha)
destroy(this.cbx_dia)
destroy(this.hpb_infocarga)
destroy(this.st_4)
destroy(this.cb_obtener_datos)
destroy(this.st_help)
destroy(this.dw_desborde_all_nomdepto)
destroy(this.ddlb_deptos)
destroy(this.st_3)
destroy(this.dw_desborde_causa)
destroy(this.dw_desborde_depto)
destroy(this.r_1)
end on

event open;int li_punt
string ls_datosdepto

dw_desborde_all_nomdepto.visible = FALSE
hpb_infocarga.visible = FALSE
st_4.visible = FALSE
//ddlb_deptos.enabled = FALSE
//cbx_dia.enabled = FALSE
//cbx_fecha.enabled = FALSE
mc_1.visible = FALSE

// Extracci$$HEX1$$f300$$ENDHEX$$n de todos los departamentos
dw_desborde_all_nomdepto.settransobject(sqlca2)
dw_desborde_all_nomdepto.retrieve()

// Desborde de llamadas por causa
IF dw_desborde_all_nomdepto.RowCount() > 0 THEN
	ddlb_deptos.AddItem('TODOS')
	FOR li_punt = 1 to dw_desborde_all_nomdepto.RowCount()		
		// Graficamos el primer departamento y lo asignamos por defecto
		//IF li_punt = 1 THEN
			//is_deptoActive = dw_desborde_all_nomdepto.object.nom_depto[li_punt]	
			//ddlb_deptos.Event selectionchanged(li_punt)		
			//ddlb_deptos.tag = is_deptoActive
			//ddlb_deptos.text = is_deptoActive
		//END IF
		
		// Obtenemos todos los departamentos y los llenamos en el dropdownlistbox
		ls_datosDepto = dw_desborde_all_nomdepto.object.nom_depto[li_punt]
		IF ls_datosDepto = 'EL PETEN' THEN
				ls_datosDepto = 'PETEN'
		END IF
		ddlb_deptos.AddItem(ls_datosDepto)
		hpb_infocarga.position = hpb_infocarga.position + 40
		
		// Modificamos el color de barra del gr$$HEX1$$e100$$ENDHEX$$fico para causa
		//dw_desborde_causa.SetdataStyle("gr_desborde", 1, li_punt, Foreground!, RGB(9, 132, 227))
		//dw_desborde_causa.SetdataStyle("gr_desborde", 1, li_punt, Background!, RGB(9, 132, 227))
	NEXT
END IF
end event

type mc_1 from monthcalendar within w_desborde_llamadas
integer x = 2185
integer y = 100
integer width = 1061
integer height = 676
integer taborder = 30
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

event datechanged;//Date ld_fecha
//string ls_fecha_s
//int li_return
//
//li_return = mc_1.GetSelectedDate(ld_fecha)
//ls_fecha_s = string(ld_fecha)
//
//if li_return = 0 then
//	//dw_desborde_causa.visible = FALSE
//	//f_carga_datos(ls_fecha_s)
//else
//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Seleccione un solo d$$HEX1$$ed00$$ENDHEX$$a")
//end if

end event

type cbx_fecha from checkbox within w_desborde_llamadas
integer x = 1499
integer y = 128
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

event clicked;cbx_dia.checked = FALSE
cbx_fecha.checked = TRUE
mc_1.visible = TRUE
end event

type cbx_dia from checkbox within w_desborde_llamadas
integer x = 910
integer y = 128
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

cbx_fecha.checked = FALSE
mc_1.visible = FALSE
cbx_dia.checked = TRUE

//Cargar los registros del dia
ls_fecha_hoy = string(today())
//dw_desborde_causa.visible = FALSE
//f_carga_datos(ls_fecha_hoy)
end event

type hpb_infocarga from hprogressbar within w_desborde_llamadas
integer x = 2112
integer y = 1192
integer width = 1403
integer height = 104
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_4 from statictext within w_desborde_llamadas
integer x = 2112
integer y = 1288
integer width = 1399
integer height = 116
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 134217732
string text = "                           Cargando..."
boolean border = true
long bordercolor = 8421504
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_obtener_datos from commandbutton within w_desborde_llamadas
integer x = 3342
integer y = 92
integer width = 677
integer height = 164
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar / Refrescar"
end type

event clicked;int li_punt, li_return
string ls_fecha_hoy, ls_datosdepto, ls_fecha_s
Date ld_fecha

IF ddlb_deptos.text = "" THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Seleccione un departamento.")
ELSE
	st_help.visible = FALSE
	hpb_infocarga.visible = TRUE
	st_4.visible = TRUE
	
	ls_fecha_hoy = string(today())
	
	if cbx_dia.checked = TRUE then
		f_carga_datos(ls_fecha_hoy)
	else
		li_return = mc_1.GetSelectedDate(ld_fecha)
		ls_fecha_s = string(ld_fecha)
		f_carga_datos(ls_fecha_s)
	end if
	
	
	
	
//	IF li_return = 0 THEN
//		li_return = mc_1.GetSelectedDate(ld_fecha)
//		ls_fecha_s = string(ld_fecha)
//		f_carga_datos(ls_fecha_s)
//	ELSE
//		f_carga_datos(ls_fecha_hoy)
//	END IF
END IF

//cbx_dia.enabled = TRUE
//cbx_fecha.enabled = TRUE
//ddlb_deptos.enabled = TRUE
end event

type st_help from statictext within w_desborde_llamadas
integer x = 736
integer y = 28
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean focusrectangle = false
end type

type dw_desborde_all_nomdepto from datawindow within w_desborde_llamadas
boolean visible = false
integer x = 3653
integer y = 104
integer width = 686
integer height = 68
integer taborder = 20
string title = "none"
string dataobject = "dw_desborde_all_nomdepto"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_deptos from dropdownlistbox within w_desborde_llamadas
integer x = 37
integer y = 140
integer width = 699
integer height = 460
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;/*int li_punt

//openwithparm(w_msg, "Cargando...")

//Definimos las propiedades en el Hprogressbar.
hpb_infocarga.minposition=0
//El total de registros devuelto por la consulta lo asignamos a su maxima posicion.
hpb_infocarga.maxposition=100
//Ponemos el Hprogressbar a una minima posicion.
hpb_infocarga.position=1
hpb_infocarga.visible = TRUE
st_4.visible = TRUE
hpb_infocarga.position = hpb_infocarga.position + 10

IF ddlb_deptos.text = 'TODOS' THEN
	dw_desborde_causa.dataobject = "dw_desborde_causa_all_depto"
ELSE
	dw_desborde_causa.dataobject = "dw_desborde_causa"
END IF

hpb_infocarga.position = hpb_infocarga.position + 10*/

// Cambiando el nombre de EL PETEN por error en BD.
IF ddlb_deptos.text = 'EL PETEN' THEN
	ddlb_deptos.text = 'PETEN'
END IF	

/*hpb_infocarga.position = hpb_infocarga.position + 10

dw_desborde_causa.settransobject(sqlca2)	
IF ddlb_deptos.text = 'TODOS' THEN
	dw_desborde_causa.retrieve(ls_fecha1, ls_fecha2)
ELSE
	dw_desborde_causa.retrieve(ddlb_deptos.text, ls_fecha1, ls_fecha2)
END IF
hpb_infocarga.position = hpb_infocarga.position + 60

dw_desborde_causa.visible = false
FOR li_punt = 1 to dw_desborde_causa.RowCount()		
	// Modificamos el color de barra del gr$$HEX1$$e100$$ENDHEX$$fico para causa
	dw_desborde_causa.SetdataStyle("gr_desborde", 1, li_punt, Foreground!, RGB(9, 132, 227))
	dw_desborde_causa.SetdataStyle("gr_desborde", 1, li_punt, Background!, RGB(9, 132, 227))
NEXT

dw_desborde_causa.visible = true
ddlb_deptos.enabled = true
hpb_infocarga.visible = false
st_4.visible = false*/

//close(w_msg)
end event

type st_3 from statictext within w_desborde_llamadas
integer x = 41
integer y = 64
integer width = 690
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Seleccione Departamento"
boolean focusrectangle = false
end type

type dw_desborde_causa from datawindow within w_desborde_llamadas
event mousemove pbm_dwnmousemove
integer x = 37
integer y = 792
integer width = 2336
integer height = 1912
integer taborder = 30
string title = "none"
string dataobject = "dw_desborde_causa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;grObjectType ClickedObject
string ls_grgraphname = "gr_desborde", ls_porc, ls_help
int li_series, li_category
double ll_cant, ll_por

/************************************************************
Find out where the user clicked in the graph
***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, li_category)

/************************************************************
If user clicked on data or category, find out which one
***********************************************************/
If ClickedObject = TypeData! Then
	st_help.x = parent.PointerX()
	st_help.y = parent.PointerY() - 80
	st_help.visible = TRUE
	ls_help = STRING(this.GetData(ls_grgraphname, li_series, li_category))
	st_help.text = ls_help
	st_help.width = len(ls_help) * 33.4
else
	st_HELP.VISIBLE = FALSE
End If
end event

event retrieverow;//Asignamos cada registro que se carga a la posici$$HEX1$$f300$$ENDHEX$$n del Hprogressbar control.
hpb_infocarga.position = hpb_infocarga.position + 1
end event

type dw_desborde_depto from datawindow within w_desborde_llamadas
event pbm_dwnmousemove ( )
event mousemove pbm_dwnmousemove
integer x = 2469
integer y = 796
integer width = 2400
integer height = 1920
integer taborder = 20
string dataobject = "dw_desborde_depto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;grObjectType ClickedObject
string ls_grgraphname = "gr_desborde", ls_porc, ls_help
int li_series, li_category
double ll_cant, ll_por

/************************************************************
Find out where the user clicked in the graph
***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, li_category)

/************************************************************
If user clicked on data or category, find out which one
***********************************************************/
If ClickedObject = TypeData! Then
	st_help.x = parent.PointerX()
	st_help.y = parent.PointerY() - 80
	st_help.visible = TRUE
	ls_help = STRING(this.GetData(ls_grgraphname, li_series, li_category))
	st_help.text = ls_help
	st_help.width = len(ls_help) * 33.4
else
	st_HELP.VISIBLE = FALSE
End If
end event

event retrievestart;//Variable que almacena el total de registros de la consulta a la base datos.
//long ll_total

//Hacemos la consulta a la base de datos.
//select count(*) into :ll_total from REGISTRO
//using sqlca;

//Definimos las propiedades en el Hprogressbar.
//hpb_infocarga.minposition=0
//El total de registros devuelto por la consulta lo asignamos a su maxima posicion.
//hpb_infocarga.maxposition=ll_total
//Ponemos el Hprogressbar a una minima posicion.
//hpb_infocarga.position=1
end event

event retrieverow;//Asignamos cada registro que se carga a la posici$$HEX1$$f300$$ENDHEX$$n del Hprogressbar control.
hpb_infocarga.position = hpb_infocarga.position + 1
end event

event retrieveend;//Cuando se termina de cargar todos los registros, volvemos a ocultar el Hprogressabar control.
//hpb_infocarga.visible=false
end event

type r_1 from rectangle within w_desborde_llamadas
long linecolor = 8388608
integer linethickness = 4
long fillcolor = 16777215
integer x = 869
integer y = 100
integer width = 1285
integer height = 164
end type


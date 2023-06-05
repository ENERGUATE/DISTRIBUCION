HA$PBExportHeader$w_6208_seleccionar_ot.srw
forward
global type w_6208_seleccionar_ot from w_sgigenerica
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_6208_seleccionar_ot
end type
type dw_lista_ots from u_bri_2017_pr_datos_cons_ot within w_6208_seleccionar_ot
end type
type em_desde from editmask within w_6208_seleccionar_ot
end type
type st_desde from statictext within w_6208_seleccionar_ot
end type
type em_hasta from editmask within w_6208_seleccionar_ot
end type
type st_hasta from statictext within w_6208_seleccionar_ot
end type
type cb_buscar from commandbutton within w_6208_seleccionar_ot
end type
type dw_fechas from u_inc_2013_pr_desde_hasta within w_6208_seleccionar_ot
end type
type gb_1 from groupbox within w_6208_seleccionar_ot
end type
end forward

global type w_6208_seleccionar_ot from w_sgigenerica
integer x = 1001
integer y = 1000
integer width = 2985
integer height = 1580
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de OTs"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_armar_sql ( )
dw_ambito dw_ambito
dw_lista_ots dw_lista_ots
em_desde em_desde
st_desde st_desde
em_hasta em_hasta
st_hasta st_hasta
cb_buscar cb_buscar
dw_fechas dw_fechas
gb_1 gb_1
end type
global w_6208_seleccionar_ot w_6208_seleccionar_ot

type variables
int 				ii_filaAnt				//Fila anteriormente seleccionada
string			is_modificacion		//Instrucci$$HEX1$$f300$$ENDHEX$$n de creaci$$HEX1$$f300$$ENDHEX$$n del dw de ots
string			is_selectOriginal		//Select original del dw
end variables

event ue_armar_sql();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_armar_sql
//
// Objetivo:
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 09/02/1999	    AHM
/////////////////////////////////////////////////////////// 

SetPointer(HourGlass!)

datetime		ldt_desde						//Fecha desde del filtro
datetime		ldt_hasta						//Fecha hasta del filtro
long			ll_ambito						//C$$HEX1$$f300$$ENDHEX$$digo del filtro del ambito
long			ll_posicion						//Posici$$HEX1$$f300$$ENDHEX$$n desde la que comienza el union de la select del dw de ots
string		ls_criteriosSeleccion		//Criterios de selecci$$HEX1$$f300$$ENDHEX$$n por los que se va a filtrar
string		ls_retorno						//Retorno de la asignaci$$HEX1$$f300$$ENDHEX$$n de la sintaxis del dw con el listado de ots
string		ls_selectModificada			//Select con los nuevos criterios de selecci$$HEX1$$f300$$ENDHEX$$n

ls_criteriosSeleccion = ""

dw_ambito.AcceptText()
dw_fechas.AcceptText()

// Se valida el contenido del filtro del n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
IF Long(em_desde.Text) < 0 OR Long(em_hasta.Text) < 0  THEN
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de ots no pueden ser menores que 0.")
	RETURN
END IF
IF Long(em_hasta.Text) = 0 AND Long(em_desde.Text) <> 0  THEN
   em_hasta.Text =  em_desde.Text
END IF
IF Long(em_desde.Text) = 0  AND Long(em_hasta.Text) <> 0  THEN
  	em_desde.Text = em_hasta.Text
END IF
IF Long(em_hasta.Text) - Long(em_desde.Text) > 100 THEN
   em_hasta.Text = String(Long(em_desde.Text) + 100)
END IF
IF Long(em_hasta.Text) < Long(em_desde.Text) THEN
	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de ots no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
	RETURN
END IF

//Se validan las fechas
ldt_desde = dw_fechas.getItemDatetime(1, "desde")
ldt_hasta = dw_fechas.getItemDatetime(1, "hasta")

//ls_criteriosSeleccion = " AND gi_ot.f_hasta is null AND  gi_ot.nro_instalacion <> 0 "		//S$$HEX1$$f300$$ENDHEX$$lo se pueden seleccionar las ots que no est$$HEX1$$e900$$ENDHEX$$n finalizadas o canceladas y las ots generadas desde el $$HEX1$$e100$$ENDHEX$$rbol de instalaciones
ls_criteriosSeleccion += " AND gi_ot.nro_aviso <> 0 "		//Selecciona aquellas que ya tengan alg$$HEX1$$fa00$$ENDHEX$$n aviso asociado

//Procesamiento de las fechas
IF NOT (isNull(ldt_desde)) THEN
	ls_criteriosSeleccion += " AND gi_ot.f_desde >= to_date('" + string(ldt_desde) + "', 'dd/mm/yyyy hh24:mi:ss') "
END IF

IF NOT (isNull(ldt_hasta)) THEN
	ls_criteriosSeleccion += " AND gi_ot.f_desde <= to_date('" + string(ldt_hasta) + "', 'dd/mm/yyyy hh24:mi:ss') "
END IF


//Procesamiento del n$$HEX1$$fa00$$ENDHEX$$mero de OT
IF Long(em_desde.Text) > 0 THEN
	ls_criteriosSeleccion += " AND (gi_ot.nro_ot >= " + em_desde.Text + " AND gi_ot.nro_ot <= " + em_hasta.Text +") "
END IF

//Procesamiento de ambito
ll_ambito = dw_ambito.getItemNumber(1, "nro_centro")

IF ll_ambito > 0 THEN		//Se ha seleccionado un determinado centro
	ls_criteriosSeleccion = " AND gi_ot.nro_centro = " + String(ll_ambito)
END IF

ll_ambito = dw_ambito.getItemNumber(1, "nro_cmd")

IF ll_ambito > 0 THEN		//Se ha seleccionado un determinado centro
	ls_criteriosSeleccion = " AND gi_ot.nro_cmd = " + String(ll_ambito)
END IF

ll_ambito = dw_ambito.getItemNumber(1, "nro_mesa")

IF ll_ambito > 0 THEN		//Se ha seleccionado un determinado centro
	ls_criteriosSeleccion = " AND gi_ot.nro_mesa = " + String(ll_ambito)
END IF

ll_posicion = pos(is_selectOriginal, "UNION", 1)

ls_selectModificada = left(is_selectOriginal, ll_posicion - 1) 
ls_selectModificada += ls_criteriosSeleccion + " "
ls_selectModificada += mid(is_selectOriginal, ll_posicion, len(is_selectOriginal))
ls_selectModificada += ls_criteriosSeleccion

dw_lista_ots.setsqlselect(ls_selectModificada)

dw_lista_ots.retrieve()

IF dw_lista_ots.RowCount()>0 THEN
	dw_lista_ots.SelectRow(0,FALSE)
	dw_lista_ots.SelectRow(1,TRUE)
ELSE
	messageBox("Aviso", "No se han encontrado registros " + string(dw_lista_ots.RowCount()))
END IF
end event

on w_6208_seleccionar_ot.create
int iCurrent
call super::create
this.dw_ambito=create dw_ambito
this.dw_lista_ots=create dw_lista_ots
this.em_desde=create em_desde
this.st_desde=create st_desde
this.em_hasta=create em_hasta
this.st_hasta=create st_hasta
this.cb_buscar=create cb_buscar
this.dw_fechas=create dw_fechas
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_ambito
this.Control[iCurrent+2]=this.dw_lista_ots
this.Control[iCurrent+3]=this.em_desde
this.Control[iCurrent+4]=this.st_desde
this.Control[iCurrent+5]=this.em_hasta
this.Control[iCurrent+6]=this.st_hasta
this.Control[iCurrent+7]=this.cb_buscar
this.Control[iCurrent+8]=this.dw_fechas
this.Control[iCurrent+9]=this.gb_1
end on

on w_6208_seleccionar_ot.destroy
call super::destroy
destroy(this.dw_ambito)
destroy(this.dw_lista_ots)
destroy(this.em_desde)
destroy(this.st_desde)
destroy(this.em_hasta)
destroy(this.st_hasta)
destroy(this.cb_buscar)
destroy(this.dw_fechas)
destroy(this.gb_1)
end on

event open;call super::open;is_selectOriginal = dw_lista_ots.getsqlselect()		//Captura de la select original del listado de ots

dw_ambito.insertRow(0)
dw_ambito.setItem(1, "nro_centro", 0)
dw_ambito.setItem(1, "nro_cmd", 0)
dw_ambito.setItem(1, "nro_mesa", 0)

dw_fechas.f_insertar_fila()
dw_fechas.setItem(1, "desde", 0)
dw_fechas.setItem(1, "hasta", fgnu_fecha_actual())

dw_lista_ots.settransobject(sqlca)

//TriggerEvent("ue_armar_sql")

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_6208_seleccionar_ot
integer x = 594
integer y = 400
end type

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_6208_seleccionar_ot
integer x = 37
integer y = 32
integer taborder = 10
boolean bringtotop = true
end type

type dw_lista_ots from u_bri_2017_pr_datos_cons_ot within w_6208_seleccionar_ot
integer x = 37
integer y = 544
integer width = 2880
integer height = 740
integer taborder = 11
boolean bringtotop = true
boolean hscrollbar = true
end type

event clicked;call super::clicked;IF row > 0 THEN
	THIS.selectrow(0,FALSE)
	ii_filaAnt = row
	THIS.selectrow(row,TRUE)
END IF

end event

event doubleclicked;call super::doubleclicked;if row > 0 then
	gu_comunic.is_comunic.longval1 = this.getitemnumber(this.getrow(),"nro_ot")
	IF gu_comunic.is_comunic.longval1 <> 0 THEN
		SetPointer(HourGlass!)
		gu_comunic.is_comunic.longval2 = this.getitemnumber(this.getrow(),"nro_instalacion")
		gu_comunic.is_comunic.accion_retorno = "Seleccionada"
		gu_comunic.is_comunic.programa_retorno = "w_6208"
		CLOSE(PARENT)	
	END IF
end if

end event

type em_desde from editmask within w_6208_seleccionar_ot
integer x = 1449
integer y = 100
integer width = 421
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##########"
boolean spin = true
double increment = 1
string minmax = "1~~"
end type

type st_desde from statictext within w_6208_seleccionar_ot
integer x = 1152
integer y = 116
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 8388608
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type em_hasta from editmask within w_6208_seleccionar_ot
integer x = 1449
integer y = 208
integer width = 421
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##########"
boolean spin = true
double increment = 1
string minmax = "1~~"
end type

type st_hasta from statictext within w_6208_seleccionar_ot
integer x = 1152
integer y = 220
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "MANOOK.CUR"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type cb_buscar from commandbutton within w_6208_seleccionar_ot
integer x = 2496
integer y = 1336
integer width = 421
integer height = 96
integer taborder = 21
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Buscar"
end type

event clicked;dw_lista_ots.Reset()
PARENT.TriggerEvent("ue_armar_sql")
end event

type dw_fechas from u_inc_2013_pr_desde_hasta within w_6208_seleccionar_ot
integer x = 1998
integer y = 64
integer width = 914
integer taborder = 20
boolean bringtotop = true
end type

type gb_1 from groupbox within w_6208_seleccionar_ot
integer x = 1097
integer y = 20
integer width = 878
integer height = 312
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "N$$HEX1$$fa00$$ENDHEX$$mero de OT"
end type


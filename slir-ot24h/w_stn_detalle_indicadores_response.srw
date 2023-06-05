HA$PBExportHeader$w_stn_detalle_indicadores_response.srw
forward
global type w_stn_detalle_indicadores_response from window
end type
type dw_fecha from datawindow within w_stn_detalle_indicadores_response
end type
type dw_indicadores from datawindow within w_stn_detalle_indicadores_response
end type
end forward

global type w_stn_detalle_indicadores_response from window
integer width = 2094
integer height = 1980
boolean titlebar = true
string title = "Detalle de Indicadores y Compensaciones"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_fecha dw_fecha
dw_indicadores dw_indicadores
end type
global w_stn_detalle_indicadores_response w_stn_detalle_indicadores_response

event open;

long ll_row_selected
datawindow pdw_stn

pdw_stn = Message.PowerObjectParm

ll_row_selected = pdw_stn.getrow()

if  ll_row_selected > 0 then 
	
	 
	dw_fecha.InsertRow(0)
	dw_fecha.object.anio[1] = pdw_stn.object.anio[ll_row_selected]
	dw_fecha.object.mes[1]  = pdw_stn.object.mes[ll_row_selected]

	dw_indicadores.InsertRow(0)
	dw_indicadores.object.codigo_activo[1] = pdw_stn.object.codigo_activo[ll_row_selected]
//	dw_indicadores.object.codigo_activo_1[1] = pdw_stn.object.codigo_activo[ll_row_selected]
//	dw_indicadores.object.codigo_activo_2[1] = pdw_stn.object.codigo_activo[ll_row_selected]
	dw_indicadores.object.anio[1] = pdw_stn.object.anio[ll_row_selected]
	dw_indicadores.object.mes[1] = pdw_stn.object.mes[ll_row_selected]
	dw_indicadores.object.enr[1] = pdw_stn.object.enr[ll_row_selected]
	dw_indicadores.object.sce[1] = pdw_stn.object.sce[ll_row_selected]
	dw_indicadores.object.cpsm[1] = pdw_stn.object.cpsm[ll_row_selected]
	dw_indicadores.object.mhai[1] = pdw_stn.object.mhai[ll_row_selected]
	dw_indicadores.object.mida[1] = pdw_stn.object.mida[ll_row_selected]
	dw_indicadores.object.indice_disponibilidad[1] = pdw_stn.object.indice_disponibilidad[ll_row_selected]
	dw_indicadores.object.imr[1] = pdw_stn.object.imr[ll_row_selected]
	dw_indicadores.object.horas_indisp_a_compensar[1] = pdw_stn.object.horas_indisp_a_compensar[ll_row_selected]
	dw_indicadores.object.horas_mes[1] = pdw_stn.object.horas_mes[ll_row_selected]
	dw_indicadores.object.ind_indisp_mensual_tycn[1] = pdw_stn.object.ind_indisp_mensual_tycn[ll_row_selected]
	dw_indicadores.object.imrt_compensacion_tycn[1] = pdw_stn.object.imrt_compensacion_tycn[ll_row_selected]
	dw_indicadores.object.cano[1] = pdw_stn.object.cano[ll_row_selected]
	dw_indicadores.object.cano_pendiente[1] = pdw_stn.object.cano_pendiente[ll_row_selected]

end if

end event

on w_stn_detalle_indicadores_response.create
this.dw_fecha=create dw_fecha
this.dw_indicadores=create dw_indicadores
this.Control[]={this.dw_fecha,&
this.dw_indicadores}
end on

on w_stn_detalle_indicadores_response.destroy
destroy(this.dw_fecha)
destroy(this.dw_indicadores)
end on

type dw_fecha from datawindow within w_stn_detalle_indicadores_response
integer x = 73
integer y = 28
integer width = 608
integer height = 196
integer taborder = 20
string title = "none"
string dataobject = "d_indicadores_anio_mes"
boolean border = false
boolean livescroll = true
end type

type dw_indicadores from datawindow within w_stn_detalle_indicadores_response
integer x = 64
integer y = 232
integer width = 1961
integer height = 1588
integer taborder = 10
string title = "none"
string dataobject = "d_stn_detalle_indicadores_compensaciones"
boolean border = false
boolean livescroll = true
end type

event constructor;
datawindowchild ldwc_mhai, ldwc_descripcion_activo


this.GetChild("codigo_activo", ldwc_descripcion_activo)
ldwc_descripcion_activo.SetTransObject(SQLCA)
ldwc_descripcion_activo.Retrieve()

//this.GetChild("codigo_activo_2", ldwc_mhai)
//ldwc_mhai.SetTransObject(SQLCA)
//ldwc_mhai.Retrieve()
//
end event


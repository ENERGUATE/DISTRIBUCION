HA$PBExportHeader$w_2038_consulta_incidencias.srw
forward
global type w_2038_consulta_incidencias from w_sgigenerica
end type
type dw_listado_incidencias from u_inc_2021_pr_lista_incidencia within w_2038_consulta_incidencias
end type
type cb_imprimir from commandbutton within w_2038_consulta_incidencias
end type
type dw_1 from datawindow within w_2038_consulta_incidencias
end type
end forward

global type w_2038_consulta_incidencias from w_sgigenerica
integer x = 407
integer y = 612
integer width = 2848
integer height = 1312
string title = "OPEN SGI - Lista de Incidencias"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_postopen pbm_custom10
dw_listado_incidencias dw_listado_incidencias
cb_imprimir cb_imprimir
dw_1 dw_1
end type
global w_2038_consulta_incidencias w_2038_consulta_incidencias

type variables
u_generico_comunicaciones iu_comunic
u_avi_2004_pr_form_inf_resumen iu_avi_2004_pr
int ii_fila_ant
// constantes
//int fgci_incidencia_resuelta
end variables

event ue_postopen;close(this)

end event

event open;call super::open;DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
// Consulta de Incidencias

// Definicion de consultas

//fw_def_constantes()
// Estructura de comunicaciones

// Entrada
	 //gu_comunic.is_comunic.longval1 // nis_rad
	 //gu_comunic.is_comunic.decval1 // nro_instalacion

// Salida

iu_comunic = CREATE u_generico_comunicaciones
iu_comunic.is_comunic = gu_comunic.is_comunic
iu_avi_2004_pr = CREATE  u_avi_2004_pr_form_inf_resumen

CHOOSE CASE iu_comunic.is_comunic.programa_llamante
	CASE "w_3107"
		string rc, mod_string, original_select, where_clause, order_clause
		dw_listado_incidencias.SetTransObject(SQLCA)
		original_select = dw_listado_incidencias.Describe("DataWindow.Table.Select")
// DSA 08/05/2000	
//		where_clause = ' WHERE SGD_INSTALACION.NRO_INSTALACION = SGD_INCIDENCIA.NRO_INST_AFECTADA AND &
//										SGD_INSTALACION.BDI_JOB = 0   AND 
//										SGD_INCIDENCIA.NRO_INST_AFECTADA = '+ String(iu_comunic.is_comunic.decval1) +' '

		where_clause = ' AND SGD_INCIDENCIA.NRO_INST_AFECTADA = '+ String(iu_comunic.is_comunic.decval1) +' '

		order_clause = ' ORDER BY SGD_INCIDENCIA.EST_ACTUAL, SGD_INCIDENCIA.F_DETECCION DESC '
		mod_string = "DataWindow.Table.Select=~""  &
			+ original_select + where_clause + order_clause + "~""
		rc = dw_listado_incidencias.Modify(mod_string)

		IF rc = "" THEN
			dw_listado_incidencias.Retrieve()
		ELSE
			gnv_msg.f_mensaje("AI68"," "," ",OK!)
			postevent("ue_postopen")
		END IF

	CASE ELSE

		iu_avi_2004_pr.fpr_o_inc_nis(dw_listado_incidencias,iu_comunic.is_comunic.longval1)
END CHOOSE

This.Title = gu_comunic.f_titulo_ventana("w_2038","List.Incid.")

DESTROY iu_comunic
DESTROY iu_avi_2004_pr

dw_1.modify("data_1.DataObject ='" + dw_listado_incidencias.DataObject + "'")

//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista Incidencias'
ll_longitud = len (ls_titulo)*100

dw_1.modify("nulo_desde.visible = '0")
dw_1.modify("f_desde.visible='0'")
dw_1.modify("desde.Visible='0'")
dw_1.modify("nulo_hasta.visible = '0'")
dw_1.modify("f_hasta.visible='0'")
dw_1.modify("hasta.Visible='0'")

// si no son nulas las inserto
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")

//dw_listado_incidencias.ShareData(dw_datos)
dw_listado_incidencias.setredraw(true)

IF dw_listado_incidencias.RowCount() = 0 THEN  // si no trajo nada
	gnv_msg.f_mensaje("AI24"," "," ",OK!)
	this.visible=false
	postevent("ue_postopen")
else
	ii_fila_ant = 1 
	dw_listado_incidencias.SelectRow(ii_fila_ant,True) 
end if

end event

on w_2038_consulta_incidencias.create
int iCurrent
call super::create
this.dw_listado_incidencias=create dw_listado_incidencias
this.cb_imprimir=create cb_imprimir
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_listado_incidencias
this.Control[iCurrent+2]=this.cb_imprimir
this.Control[iCurrent+3]=this.dw_1
end on

on w_2038_consulta_incidencias.destroy
call super::destroy
destroy(this.dw_listado_incidencias)
destroy(this.cb_imprimir)
destroy(this.dw_1)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;IF dw_listado_incidencias.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_listado_incidencias

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2038_consulta_incidencias
end type

type dw_listado_incidencias from u_inc_2021_pr_lista_incidencia within w_2038_consulta_incidencias
integer x = 23
integer y = 8
integer width = 2743
integer height = 1012
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;if row > 0 then
	SETPOINTER(HOURGLASS!)
	this.SelectRow(ii_fila_ant,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant = row
	gu_comunic.is_comunic.longval3 = this.getitemnumber(row,"nro_incidencia")
//	gu_comunic.is_comunic.longval5 = 1
	gu_comunic.is_comunic.accion_llamada = "Consulta"
	gu_comunic.is_comunic.programa_llamante = "w_2038_consulta_incidencias"
	
	if this.getitemnumber(row,"est_actual") = 5 then
		gu_comunic.is_comunic.programa_llamante="Hist_Inci"
	end if
	
	gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
	
	//if gs_programa_principal = "w_prin" then
	//	opensheet(w_2301_form_incidencia,w_prin,4,layered!)
	//	gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",0,1,w_2038_consulta_incidencias,"w_2038_consulta_incidencias")	
	//else
	//	opensheet(w_2301_form_incidencia,w_operaciones,7,layered!)
	//	gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",0,1,w_2038_consulta_incidencias,"w_2038_consulta_incidencias")	
	//end if
	close(parent)	
	
end if

end event

event clicked;call super::clicked;if row > 0 then
	this.selectrow(ii_fila_ant,False)
	ii_fila_ant = row
	this.selectrow(row,true)
end if

end event

type cb_imprimir from commandbutton within w_2038_consulta_incidencias
integer x = 1198
integer y = 1056
integer width = 393
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_2038_consulta_incidencias
boolean visible = false
integer x = 73
integer y = 288
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


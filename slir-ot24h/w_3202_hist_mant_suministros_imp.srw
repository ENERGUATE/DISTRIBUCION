HA$PBExportHeader$w_3202_hist_mant_suministros_imp.srw
$PBExportComments$Ventana que muestra los suministros importantes de una incidencia que se encuentra en hist$$HEX1$$f300$$ENDHEX$$ricos
forward
global type w_3202_hist_mant_suministros_imp from w_3202_mantenimiento_suministros_imp
end type
end forward

global type w_3202_hist_mant_suministros_imp from w_3202_mantenimiento_suministros_imp
end type
global w_3202_hist_mant_suministros_imp w_3202_hist_mant_suministros_imp

on w_3202_hist_mant_suministros_imp.create
call super::create
end on

on w_3202_hist_mant_suministros_imp.destroy
call super::destroy
end on

event open;/////////////////////////////////////////////////////////////
//
//	Event:	Open
//
//Parametro de entrada
//					gu_comunic.is_comunic.longval1=nro_incidencia
//					(w_2301 y w_1234)
/////////////////////////////////////////////////////////////

fw_llamada_incidencias()

//***CREACI$$HEX1$$d300$$ENDHEX$$N DE OBJETOS DE TRABAJO***********************
lu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
iu_man_2036_rn = CREATE u_man_2036_rn_sum_imp
iu_cen_2001_nu = CREATE u_cen_2001_nu_form_centro_cmd_mesa

//***OBTENGO y VALIDO PAR$$HEX1$$c100$$ENDHEX$$METROS DE ENTRADA***************

lu_comunic.is_comunic = gu_comunic.is_comunic // Recibo valores de entrada desde globales

cb_agregar.visible = false
cb_eliminar.visible = false
cb_consultar.visible = False

//***PREPARACI$$HEX1$$d300$$ENDHEX$$N DE PRESENTACI$$HEX1$$d300$$ENDHEX$$N DE LA VENTANA************
ii_fila_seleccionada = 1
d_ambito.settransobject(sqlca) // Conexi$$HEX1$$f300$$ENDHEX$$n a la base
d_ambito.fpr_crea_dddw()
d_ambito.insertrow(0)
d_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1,lu_comunic.is_comunic.intval2,lu_comunic.is_comunic.intval3,0)
//***INICIALIZACI$$HEX1$$d300$$ENDHEX$$N DE VALORES POR DEFECTO*******************

d_ambito.fpr_habilitar_campos(FALSE)

//***EFECTUO EL RETRIVE A LA BASE DE DATOS*******************
// Conexi$$HEX1$$f300$$ENDHEX$$n a la base
dw_mant_sum_imp.settransobject(sqlca)
//// Obtengo la clausula select original de la datawindow

this.TriggerEvent("ue_armar_sql")

//***BOT$$HEX1$$d300$$ENDHEX$$N DE CONSULTA***************************************
//	Deshabilitado los botones ya que no hay registros
IF dw_mant_sum_imp.RowCount() <= 0 THEN
	dw_mant_sum_imp.Reset()
	cb_agregar.enabled = true
	cb_consultar.enabled = False
	cb_eliminar.Enabled=False
END IF

d_ambito.setcolumn("nro_centro")
//This.SetReDraw(True)
dw_1.modify("data_1.DataObject ='" + dw_mant_sum_imp.DataObject + "'")
cb_buscar.setfocus()
end event

event ue_armar_sql;
long ll_nro_incidencia
string ls_filtro, ls_filtro2


integer li_centro, li_cmd, li_puesto, li_vigente

SetPointer(HourGlass!)
d_ambito.accepttext()
dw_vigente.accepttext()

li_centro =d_ambito.getitemnumber(1,"nro_centro")
li_cmd =d_ambito.getitemnumber(1,"nro_cmd")
li_puesto = d_ambito.getitemnumber(1,"nro_mesa")
ll_nro_incidencia = lu_comunic.is_comunic.longval1


is_select_original =  "SELECT GI_HIST_SUM_IMP.NIS_RAD, " + &  
         						  "GI_HIST_SUM_IMP.F_DESDE,  " + & 
         						  "GI_HIST_SUM_IMP.F_EXPIRACION,  " + & 
									  "GI_HIST_SUM_IMP.OBSERVACION,   " + &
									  "GI_HIST_SUM_IMP.NOM_CLI,   " + &
									  "GI_HIST_SUM_IMP.APE1_CLI,   " + &
									  "GI_HIST_SUM_IMP.APE2_CLI,   " + &
									  "GI_HIST_SUM_IMP.CONTACTO,   " + &
									  "GI_HIST_SUM_IMP.TELEFONO  " + &
								"FROM GI_HIST_SUM_IMP " +&
								"WHERE GI_HIST_SUM_IMP.NRO_INCIDENCIA = " + string(lu_comunic.is_comunic.longval1)


is_modificacion = "DataWindow.Table.Select= '" + is_select_original + "'"

retorno = dw_mant_sum_imp.Modify(is_modificacion)

IF retorno = "" THEN
	this.triggerevent("ue_retrieve")
END IF

d_ambito.accepttext()
end event

type st_bloqueo from w_3202_mantenimiento_suministros_imp`st_bloqueo within w_3202_hist_mant_suministros_imp
end type

type cb_eliminar from w_3202_mantenimiento_suministros_imp`cb_eliminar within w_3202_hist_mant_suministros_imp
end type

type cb_consultar from w_3202_mantenimiento_suministros_imp`cb_consultar within w_3202_hist_mant_suministros_imp
end type

type dw_mant_sum_imp from w_3202_mantenimiento_suministros_imp`dw_mant_sum_imp within w_3202_hist_mant_suministros_imp
end type

event dw_mant_sum_imp::doubleclicked;//
end event

type d_ambito from w_3202_mantenimiento_suministros_imp`d_ambito within w_3202_hist_mant_suministros_imp
end type

type cb_buscar from w_3202_mantenimiento_suministros_imp`cb_buscar within w_3202_hist_mant_suministros_imp
end type

type cb_agregar from w_3202_mantenimiento_suministros_imp`cb_agregar within w_3202_hist_mant_suministros_imp
end type

type dw_vigente from w_3202_mantenimiento_suministros_imp`dw_vigente within w_3202_hist_mant_suministros_imp
end type

type gb_1 from w_3202_mantenimiento_suministros_imp`gb_1 within w_3202_hist_mant_suministros_imp
end type

type dw_1 from w_3202_mantenimiento_suministros_imp`dw_1 within w_3202_hist_mant_suministros_imp
end type

type cb_imprimir from w_3202_mantenimiento_suministros_imp`cb_imprimir within w_3202_hist_mant_suministros_imp
end type


HA$PBExportHeader$u_gen_7002_pr_filtro_reporte_avi.sru
forward
global type u_gen_7002_pr_filtro_reporte_avi from datawindow
end type
end forward

global type u_gen_7002_pr_filtro_reporte_avi from datawindow
int Width=2309
int Height=657
string DataObject="d_bdg_7002_pr_filtro_reporte_avisos"
end type
global u_gen_7002_pr_filtro_reporte_avi u_gen_7002_pr_filtro_reporte_avi

type variables
string is_alimentacion = " "
string is_estado = " "
string is_estado_mant = " "
string is_tipo = " "
string is_alcance = " "
string is_suministro = " "
string is_linea = " "

datawindowchild ddw_tipo_aviso
datawindowchild ddw_alcance_aviso
datawindowchild ddw_estado_incidencia_t
datawindowchild ddw_estado_mantenimiento_t
datawindowchild ddw_tipo_incidencia_t
datawindowchild ddw_tension_incid_t
//hjhgjgjgj
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
datawindowchild ddw_nom_ins_afectada
datawindowchild ddw_nom_ins_origen
datawindowchild ddw_tip_ins_afectada
datawindowchild ddw_tip_ins_origen
datawindowchild ddw_tension
datawindowchild ddw_estado_actual
datawindowchild ddw_brigada
datawindowchild ddw_ot
datawindowchild ddw_causa
datawindowchild ddw_material_averiado
//
s_incidencia is_incidencia
//s_incid istr_incidencia

// constantes
//int fgci_perfil_tele_telefonista
//int fgci_perfil_tele_encargado_turno
//int fgci_perfil_tele_gerente
//int fgci_perfil_tele_consulta
//int fgci_perfil_oper_alta_media
//int fgci_perfil_oper_encargado_turno
//int fgci_perfil_oper_gerente
//int fgci_perfil_oper_consulta
//int fgci_perfil_oper_baja
//int fgci_incidencia_resuelta
//int fgci_todos
//int fgci_hasta_sr
//int fgci_incidencia_pendiente
//int fgci_hasta_para_resolucion
//int fgci_incidencia_mant_sin_atender
//int fgci_hasta_serv_repuesto
//int fgci_perfil_oper_mante_red
//int fgci_perfil_mante_encargado_turno
//int fgci_perfil_mante_consulta
//int fgci_perfil_mante_gerente
//int fgci_perfil_mante_operador_alta
//int fgci_perfil_mante_operador_baja
//int fgci_perfil_mantenimiento
///int fgci_incidencia_imprevista
//int fgci_media_tension
//int fgci_baja_tension
//int fgci_incidencia_de_instalacion
//int fgci_incidencia_causa_localizada
//int fgci_incidencia_de_suministro
//int fgci_perfil_operaciones_ini
//int fgci_perfil_operaciones_fin
//int fgci_perfil_tele_ini
//int fgci_perfil_tele_fin
//int fgci_perfil_mante_ini
//int fgci_perfil_mante_fin

end variables

forward prototypes
public subroutine fnu_cargar_dddw ()
end prototypes

public subroutine fnu_cargar_dddw ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
//
// Responsable: FDB .- Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: -- 
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int ii
this.GetChild("ai_estado",ddw_estado_incidencia_t)
ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)


//ddw_estado_incidencia_T.SetTransObject(SQLCA)
//ddw_estado_incidencia_t.Retrieve()

//ddw_estado_incidencia_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
//ddw_estado_incidencia_t.filter()



this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)


//ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
//ddw_estado_mantenimiento_t.Retrieve()
////ddw_estado_mantenimiento_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
////ddw_estado_mantenimiento_t.filter()
//


this.GetChild("ai_tipo",ddw_tipo_aviso)
ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
ddw_tipo_aviso.setsort("tip_aviso A")
ddw_tipo_aviso.sort()
//this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
//
//ii=ddw_tipo_incidencia_t_shared.sharedata(ddw_tipo_incidencia_t)

//this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
//ddw_tipo_incidencia_t.SetTransObject(SQLCA)
//ddw_tipo_incidencia_t.Retrieve()
//ddw_tipo_incidencia_t.setsort("tip_aviso A")
//ddw_tipo_incidencia_t.sort()
//
//  la linea de abajo es la que da el problema !!! //////////////////////////////

//
//This.GetChild("ai_alcance",ddw_tension_incid_t)
//ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)
//
//this.GetChild("ai_alcance",ddw_tension_incidencia_t)
//ddw_tension_incidencia_t.SetTransObject(SQLCA)
//ddw_tension_incidencia_t.Retrieve()
//ddw_tension_incidencia_t.setsort("co_alcance A")
//ddw_tension_incidencia_t.sort()
//
//
//




//this.GetChild("ai_estado",ddw_estado_aviso)
//ddw_estado_aviso.SetTransObject(SQLCA)
//ddw_estado_aviso.Retrieve()
//ddw_estado_aviso.setfilter("est_aviso <> " + string(fgci_aviso_resuelto))
//ddw_estado_Aviso.filter()


//this.GetChild("ai_tipo",ddw_tipo_aviso)
//ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
//ddw_tipo_aviso.setsort("tip_aviso A")
//ddw_tipo_aviso.sort()


this.GetChild("ai_alcance",ddw_alcance_aviso)
ddw_alcance_aviso_t_shared.shareData(ddw_alcance_aviso)
ddw_alcance_aviso.setsort("co_alcance A")
ddw_alcance_aviso.sort()

end subroutine


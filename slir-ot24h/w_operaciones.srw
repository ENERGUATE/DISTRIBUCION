HA$PBExportHeader$w_operaciones.srw
forward
global type w_operaciones from window
end type
type mdi_1 from mdiclient within w_operaciones
end type
end forward

global type w_operaciones from window
boolean visible = false
integer x = 521
integer y = 336
integer width = 3666
integer height = 2400
boolean titlebar = true
string title = "OPEN SGI - Operaciones"
string menuname = "md_operaciones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
long backcolor = 67108864
event ue_gestion_avisos pbm_custom32
event ue_consulta_avisos_pendientes pbm_custom33
event ue_consulta_avisos_resueltos pbm_custom34
event ue_avisos_ing_int_horario pbm_custom35
event ue_avisos_pen_duracion pbm_custom36
event ue_ingreso_reclamos pbm_custom37
event ue_actualizacion_incidencias pbm_custom38
event ue_incidencias_imprevistas pbm_custom40
event ue_descargos pbm_custom41
event ue_carga_trabajo_zona pbm_custom42
event ue_ordenes_de_trabajo pbm_custom43
event ue_brigadas_puesto pbm_custom44
event ue_situacion_climatologica pbm_custom45
event ue_suministros_importantes pbm_custom46
event ue_informacion_clientes pbm_custom47
event ue_consulta_instalaciones pbm_custom48
event ue_brigadistas pbm_custom49
event ue_alc_avi pbm_custom50
event ue_tip_avi pbm_custom51
event ue_causa_inc pbm_custom52
event ue_incidencia pbm_custom53
event ue_mat_averiado pbm_custom54
event ue_accion pbm_custom55
event ue_est_clima pbm_custom56
event ue_prioridad pbm_custom57
event ue_tip_ins pbm_custom58
event ue_int_hora pbm_custom59
event ue_problema pbm_custom60
event ue_turno pbm_custom61
event ue_propiedad pbm_custom62
event ue_centro pbm_custom63
event ue_mante_instalac pbm_custom65
event ue_mante_aco pbm_custom66
event ue_mante_sum pbm_custom67
event ue_materiales pbm_custom68
event ue_tareas pbm_custom69
event ue_control_trabajo pbm_custom70
event ue_estadisticas pbm_custom21
event ue_empresa pbm_custom22
event ue_profesion pbm_custom23
event ue_reportes pbm_custom24
event ue_reactivar_avisos pbm_custom25
event ue_error_alta pbm_custom28
event ue_refrescar pbm_custom29
event ue_consulta_ots ( )
event ue_instalac_pro ( )
event ue_grupo_causas ( )
event ue_interface pbm_custom11
event ue_fam_causas_inc ( )
event ue_mant_perfiles ( )
event ue_mant_usuarios ( )
event ue_mant_contratas ( )
event ue_indices ( )
event ue_icono pbm_custom01
event ue_repinta pbm_ncpaint
event ue_icono_operaciones pbm_custom02
event ue_tipos_tension ( )
event ue_agentes ( )
event ue_unidades ( )
event ue_desbloqueo ( )
event ue_motivos ( )
event ue_man_ct_fases ( )
event ue_reportes_diarios ( )
event ue_man_pais ( )
event ue_periodo_penalizacion ( )
event ue_sum_x_instal ( )
event ue_mensualdecausas ( )
event ue_mensualdeinterrupciones ( )
event ue_consulta_avisos_historico ( )
event ue_mant_t_descargos ( )
event ue_serv_ejec pbm_custom50
event ue_mantenimientotap ( )
event ue_mant_accion_inc ( )
event ue_mant_categorias_sum_imp ( )
event ue_mant_suministros_cat ( )
mdi_1 mdi_1
end type
global w_operaciones w_operaciones

type prototypes
Function Long SetForegroundWindow  (Long hwnd) Library "user32" Alias For "SetForegroundWindow"
end prototypes

type variables
int ii_cmd_dep
int ii_centro_dep
int ii_puesto_dep
int ii_perfil
long il_departamento
long il_provincia
long il_municipio
long il_localidad
string is_provincia
string is_departamento
string is_municipio
string is_localidad

// constantes
//int fgci_perfil_oper_baja
//int fgci_perfil_oper_encargado_turno
//int fgci_perfil_oper_alta_media
//int fgci_perfil_oper_gerente
//int fgci_perfil_oper_consulta
//int fgci_perfil_oper_mante_red
//int fgci_perfil_operaciones_ini
//int fgci_perfil_operaciones_fin
//int fgci_perfil_tele_telefonista
//int fgci_perfil_tele_consulta
//int fgci_perfil_tele_ini
//int fgci_perfil_tele_fin
//int fgci_perfil_mante_ini
//int fgci_perfil_mante_fin
//int fgci_perfil_mante_operador_baja
//int fgci_perfil_mante_encargado_turno
//int fgci_perfil_mante_consulta
//int fgci_perfil_mante_gerente
//int fgci_perfil_mante_operador_alta
//int fgci_perfil_mantenimiento
//int fgci_incidencia_causa_localizada
//int fgci_incidencia_de_suministro
//int fgci_incidencia_servicio_repuesto
//int fgci_hasta_serv_repuesto
//int fgci_incidencia_imprevista
//int fgci_todos
//int fgci_cero
//int fgci_aviso_resuelto
//int fgci_incidencia_programada
//int fgci_aviso_pendiente
window iw_seleccion
Constant Long WM_MOUSEMOVE = 512
constant Long WM_LBUTTONDOWN=513
constant Long WM_LBUTTONUP=514
constant Long WM_LBUTTONDBLCLK=515
constant Long WM_RBUTTONDOWN=516
constant Long WM_RBUTTONUP=517
constant Long WM_RBUTTONDBLCLK=518

long il_sesion_operacion 

end variables

forward prototypes
public function integer fnu_presentar_menu (integer pi_perfil)
public function integer fnu_obtener_centros_dep ()
end prototypes

event ue_gestion_avisos;// GNU 10/1/2007. Mejora 1/311530
SetPointer(HourGlass!)
w_1105_avisos_con_alim ventana

gu_comunic.is_comunic.accion_llamada = "Actualizacion"


if fg_verifica_parametro("ventana gestion avisos") then
	OPENSHEET(ventana,W_OPERACIONES,7,layered!)
else
//	gu_comunic.fnu_abrir(w_1105_avisos_con_alim,"w_1105_avisos_con_alim"&
//		,0,0,w_shared,"w_shared")
	OPENSHEET(w_1105_avisos_con_alim,W_OPERACIONES,7,layered!)
end if
//OPENSHEET(w_1105_avisos_con_alim,W_OPERACIONES,7,layered!)
//OPENSHEET(ventana,W_OPERACIONES,7,layered!)

end event

event ue_consulta_avisos_pendientes;datetime ldt_fecha
SetNull(ldt_fecha)
gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto
gu_comunic.is_comunic.datval1 = ldt_fecha
gu_comunic.is_comunic.datval2 = fgcd_fecha_del_dia()
gu_comunic.is_comunic.intval4 = fgci_aviso_pendiente
gu_comunic.is_comunic.intval5 = fgci_todos
gu_comunic.is_comunic.intval6 = 0
gu_comunic.is_comunic.intval7 = fgci_todos
gu_comunic.is_comunic.intval8	= fgci_todos
gu_comunic.is_comunic.Accion_llamada = "Consulta"
//open(w_1233_consulta_avisos)
opensheet(w_1233_consulta_avisos,w_operaciones,0,layered!)
/////////////////
//
// Caso de consulta de avisos resueltos
//		gu_comunic.is_comunic.datval1 = DateTime(Today())
//		gu_comunic.is_comunic.intval4 = fgci_aviso_resuelto
//
/////////////////
end event

event ue_consulta_avisos_resueltos;//		gu_comunic.is_comunic.intval1 = gi_nro_centro
//		gu_comunic.is_comunic.intval2 = gi_nro_cmd
// 	   gu_comunic.is_comunic.intval3 = gi_nro_puesto
//		gu_comunic.is_comunic.datval1 = DateTime(Today())
//    	gu_comunic.is_comunic.datval2 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4 = fgci_aviso_resuelto
//		gu_comunic.is_comunic.intval5 = fgci_todos
// 		gu_comunic.is_comunic.intval6 = 0
// 		gu_comunic.is_comunic.intval7 = fgci_todos
//		gu_comunic.is_comunic.intval8	= fgci_todos
//  	   gu_comunic.is_comunic.Accion_llamada = "Consulta"
//		gu_comunic.fnu_abrir(w_1233_consulta_avisos,"w_1233_consulta_avisos",&
//					0,0,w_SHARED,"W_SHARED")
//
//
//
//
//
end event

event ue_avisos_ing_int_horario;
//open(w_2031_estadisticas_avisos)
//gu_comunic.fnu_abrir(w_2031_estadisticas_avisos,"w_2031_estadisticas_avisos",&
//			1,1,w_SHARED,"W_SHARED")
end event

event ue_avisos_pen_duracion;//open(w_2032_estadisticas_avisos_pend)
//gu_comunic.fnu_abrir(w_2032_estadisticas_avisos_pend,&
//	"w_2032_estadisticas_avisos_pend",1,1,w_SHARED,"W_SHARED")
end event

event ue_ingreso_reclamos;SetPointer(HourGlass!)
int li_cod_prov, li_cod_depto
long ll_cod_munic, ll_cod_local
string ls_prov, ls_depto, ls_munic, ls_local

gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto

//SELECT COD_PROV, COD_DEPTO, COD_MUNIC, COD_LOCAL 
//INTO :li_cod_prov, :li_cod_depto, :ll_cod_munic, :ll_cod_local  
//FROM SGD_CENTRO
//WHERE NRO_CENTRO = :gi_nro_puesto ;
//
//SELECT NOM_PROV INTO :ls_prov FROM PROVINCIAS WHERE COD_PROV = :li_cod_prov;
//SELECT NOM_DEPTO INTO :ls_depto FROM DEPTOS WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto;
//SELECT NOM_MUNIC INTO :ls_munic FROM MUNICIPIOS WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto AND COD_MUNIC = :ll_cod_munic;
//SELECT NOM_LOCAL INTO :ls_local FROM LOCALIDADES WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto AND COD_MUNIC = :ll_cod_munic AND COD_LOCAL =:ll_cod_local;
//
gu_comunic.is_comunic.intval1 = gi_cod_provincia	 // Cod. Provincia 
gu_comunic.is_comunic.intval2 = gi_cod_departamento // Cod. Departamento
gu_comunic.is_comunic.longval4 = gl_cod_municipio	 // Cod. Municipio
gu_comunic.is_comunic.longval5 = gl_cod_localidad   // Cod. Localidad
gu_comunic.is_comunic.strval1 = gs_provincia      	 // Provincia 
gu_comunic.is_comunic.strval2 = gs_departamento   	 // Departamento
gu_comunic.is_comunic.strval3 = gs_municipio	       // Municipio
gu_comunic.is_comunic.strval4 = gs_localidad 	    // Localidad

gu_comunic.is_comunic.programa_llamante = "m_recepcion_de_avisos_m_agregar"
OPENSHEET(w_1201_recepcion_aviso,w_operaciones,3,layered!)

//ParentWindow.TriggerEvent("ue_arch_agregar")
end event

event ue_actualizacion_incidencias;	int li_nulo

	datetime ld_fecha
	setnull(ld_fecha)	

	fgnu_resetear_s_comunicaciones(gu_comunic)
	gu_comunic.is_comunic.intval1 =  gi_nro_centro
	gu_comunic.is_comunic.intval2 =  gi_nro_cmd
 	gu_comunic.is_comunic.intval3  = gi_nro_puesto
	gu_comunic.is_comunic.intval5 =  fgci_todos // tipo 

 	gu_comunic.is_comunic.intval6  = fgci_todos // duracion
 	gu_comunic.is_comunic.intval7  = fgci_todos // tension
	gu_comunic.is_comunic.intval8	=  fgci_todos // estado mant
	gu_comunic.is_comunic.intval10 = 0 // suministro

//////////////////
//
// Imprevistas
//	gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//	gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//	gu_comunic.is_comunic.intval5 =  fgci_incidencia_imprevista // tipo 
//	gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//	gu_comunic.is_comunic.Accion_llamada = "Consulta"
//////////////////

/////////////////
//
// Programadas
//	gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
// gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//	gu_comunic.is_comunic.intval4  = fgci_todos // Estado
//	gu_comunic.is_comunic.intval5 =  fgci_incidencia_programada // tipo 
//	gu_comunic.is_comunic.Accion_llamada = "Consulta"
////////////////

IF gu_perfiles.of_acceso_perfil(gi_perfil, 'INC_GENERAL', "ACC_MANTEN") = 1 THEN
	gu_comunic.is_comunic.datval1 = ld_fecha
  	gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
	gu_comunic.is_comunic.intval4  = fgci_todos // Estado
	gu_comunic.is_comunic.intval5 =  fgci_incidencia_imprevista // tipo 
	gu_comunic.is_comunic.Accion_llamada = "Actualizacion"
ELSE
	gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
	gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
	gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
	gu_comunic.is_comunic.Accion_llamada = "Consulta"
END IF


//
//CHOOSE CASE ii_perfil
//	CASE fgci_perfil_oper_alta_media
//		gu_comunic.is_comunic.datval1 = ld_fecha
//   	gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_todos // Estado
//		gu_comunic.is_comunic.intval5 =  fgci_incidencia_imprevista // tipo 
//  		gu_comunic.is_comunic.Accion_llamada = "Actualizacion"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.datval1 = ld_fecha
//   	gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_todos // Estado
//		gu_comunic.is_comunic.intval5 =  fgci_incidencia_imprevista // tipo 
//	  	gu_comunic.is_comunic.Accion_llamada = "Actualizacion"
//	CASE fgci_perfil_oper_Consulta
//		gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//		gu_comunic.is_comunic.Accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_encargado_turno
//		gu_comunic.is_comunic.datval1 = ld_fecha
//	   gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_todos // Estado
//		gu_comunic.is_comunic.intval5 =  fgci_incidencia_imprevista // tipo 
//  		gu_comunic.is_comunic.Accion_llamada = "Actualizacion"
//	CASE fgci_perfil_oper_Gerente
//		gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//		gu_comunic.is_comunic.Accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.datval1 = ld_fecha
//	   gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_todos // Estado
//		gu_comunic.is_comunic.intval5 =  fgci_incidencia_imprevista // tipo 
//  		gu_comunic.is_comunic.Accion_llamada = "Actualizacion"
//	CASE fgci_perfil_tele_encargado_turno
//		gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//		gu_comunic.is_comunic.Accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_telefonista
//		gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//		gu_comunic.is_comunic.Accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_consulta
//		gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//		gu_comunic.is_comunic.Accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_gerente
//		gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//		gu_comunic.is_comunic.Accion_llamada = "Consulta"
//	CASE ELSE
//		gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
//		gu_comunic.is_comunic.intval4  = fgci_hasta_serv_repuesto // Estado
//		gu_comunic.is_comunic.Accion_llamada = "Consulta"
//END CHOOSE
//
opensheet(w_1234_consulta_incidencias,w_operaciones,7,layered!)
//	opensheet(w_1234_consulta_incidencias,w_operaciones,7,layered!)

end event

event ue_descargos;	gu_comunic.is_comunic.intval1 =  gi_nro_centro
	gu_comunic.is_comunic.intval2 =  gi_nro_cmd
 	gu_comunic.is_comunic.intval3  = gi_nro_puesto
	gu_comunic.is_comunic.datval1 = fgcd_fecha_del_dia()
   gu_comunic.is_comunic.datval2  = fgcd_fecha_del_dia()
	gu_comunic.is_comunic.intval4  = fgci_todos // Estado
	gu_comunic.is_comunic.intval5 =  fgci_incidencia_programada // tipo 
 	gu_comunic.is_comunic.intval6  = fgci_todos // duracion
 	gu_comunic.is_comunic.intval7  = fgci_todos // tension
	gu_comunic.is_comunic.intval8	=  fgci_todos // estado mant
	gu_comunic.is_comunic.intval10 = 0 // suministro
  	gu_comunic.is_comunic.Accion_llamada = "Consulta"

//opensheet(w_1234_consulta_incidencias,w_operaciones,7,layered!)


opensheet(w_7101_consulta_descargos,w_operaciones,5,Layered!)
end event

event ue_carga_trabajo_zona;OpenSheet(w_2033_situacion_actual,w_operaciones,8,Original!)
//gu_comunic.fnu_abrir(w_2033_situacion_actual,"w_2033_situacion_actual",1,1,w_SHARED,"W_SHARED")

end event

event ue_brigadas_puesto;IF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRI_ACCESO', "ACC_MANTEN") = 1 AND &
	gu_perfiles.of_acceso_perfil(gi_perfil, 'BRI_ACCESO', "ACC_CONSULTA") = 1 THEN
	gu_comunic.is_comunic.accion_llamada = "Consult/Manten"
ELSEIF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRI_ACCESO', "ACC_MANTEN") = 1  THEN
	gu_comunic.is_comunic.accion_llamada = "Actualizacion"
ELSE
	gu_comunic.is_comunic.accion_llamada = "Consulta"
END IF
//CHOOSE CASE ii_perfil
//	CASE fgci_perfil_oper_alta_media
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_Consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Actualizacion"
//	CASE fgci_perfil_oper_Gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//// Comienza usuarios de Telegestiones
//	CASE fgci_perfil_tele_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_telefonista
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE ELSE
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//END CHOOSE

gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto
//gu_comunic.fnu_abrir(w_2270_lista_brigadas_centro,&
//			"w_2270_lista_brigadas_centro",1,1,w_SHARED,"W_SHARED")
//

OpenSheet(w_2270_lista_brigadas_centro,w_operaciones,8,Layered!)
end event

event ue_situacion_climatologica;IF gu_perfiles.of_acceso_perfil(gi_perfil, 'SIT_CLIMA', "ACC_MANTEN") = 1 THEN
	gu_comunic.is_comunic.accion_llamada = "Actualizacion"
ELSE
	gu_comunic.is_comunic.accion_llamada = "Consulta"
END IF


//CHOOSE CASE ii_perfil
//	CASE fgci_perfil_oper_alta_media
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_Consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Actualizacion"
//	CASE fgci_perfil_oper_Gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//// Comienza usuarios de Telegestiones
//	CASE fgci_perfil_tele_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_telefonista
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE ELSE
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//END CHOOSE
//
//
gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
//gu_comunic.fnu_abrir(w_3201_consulta_situacion_climatologica, &
//	"w_3201_consulta_situacion_climatologica",1,1,w_shared,"w_shared")
opensheet(w_3201_consulta_situacion_climatologica,w_operaciones,8)
//open(w_3201_consulta_situacion_climatologica)

end event

event ue_suministros_importantes;
if gu_perfiles.of_acceso_perfil(gi_perfil,'SUM_IMP','ACC_MANTEN')=1 then  
	gu_comunic.is_comunic.accion_llamada = "Actualizacion"	
elseif gu_perfiles.of_acceso_perfil(gi_perfil,'SUM_IMP','ACC_CONSULTA')=1 then  
	gu_comunic.is_comunic.accion_llamada = "Consulta"
end if

gu_comunic.is_comunic.intval1  = gi_nro_centro
gu_comunic.is_comunic.intval2  = gi_nro_cmd
gu_comunic.is_comunic.intval3  = gi_nro_puesto

gu_comunic.is_comunic.programa_llamante = "w_oper"

//OpenSheet(w_3201_mantenimiento_suministros_imp,W_operaciones, 2, Original!)

//fg_colocar_ventana_main(w_3201_mantenimiento_suministros_imp)
opensheet(w_3201_mantenimiento_suministros_imp,w_operaciones,8)
end event

event ue_informacion_clientes;SetPointer(HourGlass!)

gu_comunic.is_comunic.intval1 = gi_cod_provincia    // 1  Cod. Provincia 
gu_comunic.is_comunic.intval2 = gi_cod_departamento // 20 Cod. Departamento
gu_comunic.is_comunic.longval4 = gl_cod_municipio    //160 Cod. Municipio
gu_comunic.is_comunic.longval5 = gl_cod_localidad    //286 Cod. Localidad
gu_comunic.is_comunic.strval1 = gs_provincia    // "SAN LUIS"	Provincia 
gu_comunic.is_comunic.strval2 = gs_departamento // "GENERAL PEDERNERA"	Departamento
gu_comunic.is_comunic.strval3 = gs_municipio    //"JUSTO DARACT" Municipio
gu_comunic.is_comunic.strval4 = gs_localidad    //"JUSTO DARACT"				// Localidad
gu_comunic.is_comunic.programa_llamante = "w_operaciones"

//gu_comunic.fnu_abrir(w_1211_identificar_suministro,"w_1211_identificar_suministro",0,0,w_SHARED,"W_SHARED")
//Opensheet(w_1211_identificar_suministro,w_operaciones)



opensheet(w_1211_identificar_suministro,w_operaciones,8,layered!)
end event

event ue_brigadistas;IF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRIGADISTA', "ACC_MANTEN") = 1 AND &
	gu_perfiles.of_acceso_perfil(gi_perfil, 'BRIGADISTA', "ACC_CONSULTA") = 1 THEN
	gu_comunic.is_comunic.accion_llamada = "Consult/Manten"
ELSEIF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRIGADISTA', "ACC_MANTEN") = 1  THEN
	gu_comunic.is_comunic.accion_llamada = "Actualizacion"
ELSE
	gu_comunic.is_comunic.accion_llamada = "Consulta"
END IF
//CHOOSE CASE ii_perfil
//	CASE fgci_perfil_oper_alta_media
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_Consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Actualizacion"
//	CASE fgci_perfil_oper_Gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//// Comienza usuarios de Telegestiones
//	CASE fgci_perfil_tele_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_telefonista
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE ELSE
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//END CHOOSE

gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto
//gu_comunic.fnu_abrir(w_6203_mantenimiento_brigadistas,"w_6203_mantenimiento_brigadistas",1,1,w_shared,"W_SHARED")
OpenSheet(w_6203_mantenimiento_brigadistas,W_operaciones,8,Original!)
end event

event ue_alc_avi;gu_comunic.is_comunic.programa_llamante = "alc_avi" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)




end event

event ue_tip_avi;gu_comunic.is_comunic.programa_llamante = "tip_avi" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)


end event

event ue_causa_inc;OpenSheet(w_mant_causa,w_operaciones,8,Original!)


end event

event ue_incidencia;gu_comunic.is_comunic.programa_llamante = "incidencia" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,4,Original!)

end event

event ue_mat_averiado;OpenSheet(w_mat_averiado,w_operaciones,8,Original!)
//gu_comunic.is_comunic.programa_llamante = "mat_averiado" 

//gu_comunic.fnu_abrir(w_mat_averiado,"w_generica_mant",1,1,w_shared,"w_shared")

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")


end event

event ue_accion;
gu_comunic.is_comunic.programa_llamante = "accion" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)


end event

event ue_est_clima;
gu_comunic.is_comunic.programa_llamante = "est_clima" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)



end event

event ue_prioridad;
gu_comunic.is_comunic.programa_llamante = "prioridad" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)

end event

event ue_tip_ins;gu_comunic.is_comunic.programa_llamante = "tip_ins" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)

end event

event ue_int_hora;
gu_comunic.is_comunic.programa_llamante = "int_hora" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)

end event

event ue_problema;
gu_comunic.is_comunic.programa_llamante = "problema" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)

end event

event ue_turno;
gu_comunic.is_comunic.programa_llamante = "turno" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)

end event

event ue_propiedad;
gu_comunic.is_comunic.programa_llamante = "propiedad" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)

end event

on ue_centro;//u_man_2029_pr_lista_centro miuserobj
//miuserobj = create u_man_2029_pr_lista_centro
//OpenSheetWithParm(w_generica_mant,miuserobj,w_operaciones,7,original!)
//
end on

event ue_mante_instalac;long ll_valor
integer li_posicion
string ls_ventana

setpointer(HourGlass!)


ls_ventana = "w_man_instalacion"
li_posicion=8

//if not isvalid(iw_seleccion) then
// OpenSheet(iw_seleccion,ls_ventana,w_operaciones,li_posicion,Layered!)
// setpointer(HourGlass!)
//else 
//	iw_seleccion.BringToTop= TRUE
//end if

//***********************************************************************************//
// Parametrizacion: Mantenimiento de instalaciones, solamente como consulta        **//
// Luis Eduardo Ortiz Junio/2001                                                   **//
//***********************************************************************************//

If fg_verifica_parametro('mante_instalacion') Then
	OpenSheet(w_man_instalacion_param,w_operaciones,li_posicion,Layered!)
Else
	OpenSheet(w_man_instalacion,w_operaciones,li_posicion,Layered!)
End If

//***********************************************************************************//
// Luis Eduardo Ortiz Junio/2001                                                   **//
//***********************************************************************************//

//CHOOSE CASE ii_perfil
//	CASE fgci_perfil_oper_alta_media
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_Consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Modificacion"
//	CASE fgci_perfil_oper_Gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_operador_alta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_operador_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//// Comienza usuarios de Telegestiones
//	CASE fgci_perfil_tele_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_telefonista
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE ELSE
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//END CHOOSE
//
//gu_comunic.fnu_abrir(w_3107_lista_mante_instalaciones,"w_3107_lista_mante_instalaciones",0,0,w_shared,"w_shared")
end event

event ue_mante_aco;SetPointer(HourGlass!)

int li_cod_prov, li_cod_depto
string ls_prov, ls_depto, ls_munic, ls_local
long ll_cod_local,ll_cod_munic

gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto

//SELECT COD_PROV, COD_DEPTO, COD_MUNIC, COD_LOCAL 
//INTO :li_cod_prov, :li_cod_depto, :ll_cod_munic, :ll_cod_local
//FROM SGD_CENTRO
//WHERE NRO_CENTRO = :gi_nro_puesto ;
//
//SELECT NOM_PROV INTO :ls_prov FROM PROVINCIAS WHERE COD_PROV = :li_cod_prov;
//SELECT NOM_DEPTO INTO :ls_depto FROM DEPTOS WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto;
//SELECT NOM_MUNIC INTO :ls_munic FROM MUNICIPIOS WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto AND COD_MUNIC = :ll_cod_munic;
//SELECT NOM_LOCAL INTO :ls_local FROM LOCALIDADES WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto AND COD_MUNIC = :ll_cod_munic AND COD_LOCAL =:ll_cod_local;

gu_comunic.is_comunic.intval1 = gi_cod_provincia    // Cod. Provincia 
gu_comunic.is_comunic.intval2 = gi_cod_departamento // Cod. Departamento
gu_comunic.is_comunic.longval4 = gl_cod_municipio   // Cod. Municipio
gu_comunic.is_comunic.longval5 = gl_cod_localidad   // Cod. Localidad
gu_comunic.is_comunic.strval1 = gs_provincia        // Provincia 
gu_comunic.is_comunic.strval2 = gs_departamento     // Departamento
gu_comunic.is_comunic.strval3 = gs_municipio        // Municipio
gu_comunic.is_comunic.strval4 = gs_localidad        // Localidad

//COMO EN LA ACTUALIDAD DEL MANTENIMIENTO SE ENCARGA SGC
//SE INGRESARA A LA VENTANA SIEMPRE COMO CONSULTA

gu_comunic.is_comunic.accion_llamada = "Consulta"

//CHOOSE CASE ii_perfil
//	CASE fgci_perfil_oper_alta_media
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_Consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Actualizacion"
//	CASE fgci_perfil_oper_Gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_operador_alta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_operador_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_mante_gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//// Comienza usuarios de Telegestiones
//	CASE fgci_perfil_tele_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_telefonista
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_consulta
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//	CASE fgci_perfil_tele_gerente
//		gu_comunic.is_comunic.accion_llamada = "Consulta"



//	CASE ELSE
//		gu_comunic.is_comunic.accion_llamada = "Consulta"
//END CHOOSE


IF gu_comunic.is_comunic.programa_llamante = "SinAlimentacion" THEN
//	gu_comunic.fnu_abrir(w_3109_consulta_acometidas,"w_3109_consulta_acometidas",1,1,w_shared,"w_shared")
	OpenSheet(w_3109_consulta_acometidas,W_operaciones,8,Layered!)
ELSEIF gu_comunic.is_comunic.programa_llamante = "PorDireccion" THEN
//	gu_comunic.fnu_abrir(w_3111_lista_mante_acometidas,"w_3111_lista_mante_acometidas",0,0,w_shared,"w_shared")
	OpenSheet(w_3111_lista_mante_acometidas,W_operaciones,8,Layered!)
END IF


end event

event ue_mante_sum;SetPointer(HourGlass!)

int li_cod_prov, li_cod_depto
string ls_prov, ls_depto, ls_munic, ls_local
long ll_cod_munic, ll_cod_local
gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto

//SELECT COD_PROV, COD_DEPTO, COD_MUNIC, COD_LOCAL 
//INTO :li_cod_prov, :li_cod_depto, :ll_cod_munic, :ll_cod_local  
//FROM SGD_CENTRO
//WHERE NRO_CENTRO = :gi_nro_puesto ;
//
//SELECT NOM_PROV INTO :ls_prov FROM PROVINCIAS WHERE COD_PROV = :li_cod_prov;
//SELECT NOM_DEPTO INTO :ls_depto FROM DEPTOS WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto;
//SELECT NOM_MUNIC INTO :ls_munic FROM MUNICIPIOS WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto AND COD_MUNIC = :ll_cod_munic;
//SELECT NOM_LOCAL INTO :ls_local FROM LOCALIDADES WHERE COD_PROV = :li_cod_prov AND COD_DEPTO = :li_cod_depto AND COD_MUNIC = :ll_cod_munic AND COD_LOCAL =:ll_cod_local;

gu_comunic.is_comunic.intval1  = gi_cod_provincia    // Cod. Provincia 
gu_comunic.is_comunic.intval2  = gi_cod_departamento // Cod. Departamento
gu_comunic.is_comunic.longval4 = gl_cod_municipio    // Cod. Municipio
gu_comunic.is_comunic.longval5 = gl_cod_localidad    // Cod. Localidad
gu_comunic.is_comunic.strval1  = gs_provincia        // Provincia 
gu_comunic.is_comunic.strval2  = gs_departamento     // Departamento
gu_comunic.is_comunic.strval3  = gs_municipio        // Municipio
gu_comunic.is_comunic.strval4  = gs_localidad        // Localidad
//Open(w_3113_lista_mante_suministros)

OpenSheet(w_3113_lista_mante_suministros,w_operaciones, 8, Layered!)


end event

event ue_materiales;
gu_comunic.is_comunic.programa_llamante = "materiales" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)


end event

event ue_tareas;gu_comunic.is_comunic.programa_llamante = "tareas" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)


end event

event ue_control_trabajo;SetPointer(HourGlass!)
OpenSheet(w_2034_avisos_por_telefon,W_operaciones,8,Layered!)

end event

event ue_estadisticas;//gu_comunic.fnu_abrir(w_2030_estadisticas,"w_2030_estadisticas",&
//			1,1,w_SHARED,"W_SHARED")

OpenSheet(W_2030_estadisticas,w_operaciones,8,Original!)

end event

event ue_empresa;gu_comunic.is_comunic.programa_llamante = "empresa" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")
opensheet(w_generica_mant,w_operaciones,8,Layered!)

end event

event ue_profesion;gu_comunic.is_comunic.programa_llamante = "profesion" 

OpenSheet(w_generica_mant,w_operaciones,8,Original!)


end event

event ue_reportes;SetPointer(HourGlass!)

If isValid(w_reportes) OR IsValid(w_reportes_new) Then Return

OpenSheet(W_reportes,W_operaciones,3,Layered!)
end event

event ue_reactivar_avisos;IF gu_perfiles.of_acceso_perfil(gi_perfil, 'RAV_REACTIVAR', "ACC_MANTEN") = 1 THEN
	gu_comunic.is_comunic.accion_llamada = "Actualizacion"
ELSE
	gu_comunic.is_comunic.accion_llamada = "Consulta"
END IF

//CHOOSE CASE ii_perfil
//	CASE fgci_perfil_oper_alta_media
//		gu_comunic.is_comunic.accion_llamada = "CMD"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "CMD"
//	CASE fgci_perfil_oper_Consulta
//		gu_comunic.is_comunic.accion_llamada = "Puesto"
//	CASE fgci_perfil_oper_encargado_turno
//		gu_comunic.is_comunic.accion_llamada = "Centro"
//	CASE fgci_perfil_oper_Gerente
//		gu_comunic.is_comunic.accion_llamada = "Puesto"
//	CASE fgci_perfil_oper_baja
//		gu_comunic.is_comunic.accion_llamada = "CMD"
//END CHOOSE

gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto

OpenSheet(w_2309_reactivar_avisos,w_operaciones,8)
end event

event ue_error_alta;window hija
 // Envia a la ventana  de mantenimiento de instalaciones de la BDI el evento 
 // ue_error_alta
  hija=getActiveSheet()
  if Isvalid(hija) then 
	    hija.TriggerEvent("ue_error_alta")
end if 
end event

event ue_refrescar;window hija
 // Envia a la ventana  de mantenimiento de instalaciones de la BDI el evento 
 // ue_refrescar
  hija=getActiveSheet()
  hija.TriggerEvent("ue_refrescar")
 

end event

event ue_consulta_ots;opensheet(w_6208_consulta_ot,w_operaciones,0,layered!)
end event

event ue_instalac_pro;//Opensheet(w_2121_instalaciones_con_problemas,w_operaciones)
end event

event ue_grupo_causas;OpenSheet(w_mant_causa,w_operaciones,4,Original!)
end event

event ue_interface;string ls_mensaje
ls_mensaje = space(1024)
long ll_incidencia
int ll_longitud
ll_longitud=1024
gb_mensaje = true
if isvalid(gu_operaciones) then
	
	
	
	
	
	if isvalid(gu_control_v_incidencias) then
		// OBTENEMOS LA INCIDENCIA
			ll_incidencia= wparam
			if ll_incidencia > 0 then 
		//	messagebox("Aviso",ls_mensaje)
			// ACTUALIZA EL ICONO
			fw_escribe_log(string(NOW()) + ": Lanzando Of_actualiza_operaciones (" + string(ll_incidencia) + " )(w_operaciones,ue_interface)")
	   	gu_control_v_incidencias.of_actualiza_operaciones(ll_incidencia,true,-1)
			if lparam= 0 then // ES OPERACION --> AVISAMOS AL RESTO DE SGI
				fw_escribe_log(string(NOW()) + ": Lanzando Of_avisar_sgi (" + string(ll_incidencia) + " )(w_operaciones,ue_interface)")
				gu_operaciones.of_Avisar_sgi(ll_incidencia)
			end if
		end if
	end if
	
end if
end event

event ue_fam_causas_inc;OpenSheet(w_mant_fam_causas,w_operaciones,8,Original!)

end event

event ue_mant_perfiles;OpenSheet(w_mantenimiento_perfiles,W_operaciones,8,Layered!)
end event

event ue_mant_usuarios;OpenSheet(w_mantenimiento_usuarios,W_operaciones,8,Layered!)
end event

event ue_mant_contratas;OpenSheet(w_con_0001_mant_contratas,W_operaciones,8,Layered!)
end event

event ue_indices;OpenSheet(w_indices_calidad,w_operaciones,8,Layered!)

end event

event ue_icono;Choose case Message.LongParm
	case WM_MOUSEMOVE
		
	case WM_LBUTTONDOWN
		
	case WM_LBUTTONUP

	case WM_LBUTTONDBLCLK
	SetForegroundWindow  (handle(this))
	w_operaciones.show()
	if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea verificar la conexi$$HEX1$$f300$$ENDHEX$$n con S. Conectividad?",Question!,YesNo!)=1 then 	
	if isvalid(gu_rf) then 
//		gu_rf.of_conecta()
		gu_rf.of_Actualiza_icono()
	end if
end if

	case WM_RBUTTONUP			
		
	case WM_RBUTTONDOWN
//		char(13)+char(10)+ char(13)+char(10)
if gu_rf.ib_opensgi_ini then
		messagebox("Configuraci$$HEX1$$f300$$ENDHEX$$n S. Conectividad (SGI)",+ char(13)+char(10)+"Servidor: " + upper(gu_rf.is_ip)+ +"      Puerto :"+string(gu_rf.il_puerto))
	else
		messagebox("Configuraci$$HEX1$$f300$$ENDHEX$$n S. Conectividad (SGI/Operaci$$HEX1$$f300$$ENDHEX$$n)",+ char(13)+char(10)+"Servidor: " + upper(gu_rf.is_ip)+ +"      Puerto: "+string(gu_rf.il_puerto))
	end if
	case WM_RBUTTONDBLCLK
//		If ib_timer Then Return
//		
//		If Not ib_animate_icon Then
//			ib_animate_icon = True
//			Timer(.1, This)
//		End If
	case else
		
end choose
end event

event ue_repinta;
if isvalid(w_operaciones.getactiveSheet()) then 
	md_operaciones.m_archivo.m_salir.enabled= false
	md_operaciones.m_archivo.m_cerrar.enabled= true
else
		md_operaciones.m_archivo.m_salir.enabled= true
		md_operaciones.m_archivo.m_cerrar.enabled= false
end if
end event

event ue_icono_operaciones;
Choose case Message.LongParm
	case WM_MOUSEMOVE
		
	case WM_LBUTTONDOWN
		
	case WM_LBUTTONUP

	case WM_LBUTTONDBLCLK
	SetForegroundWindow  (handle(this))
	w_operaciones.show()
	if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea verificar la conexi$$HEX1$$f300$$ENDHEX$$n con S. Operaciones?",Question!,YesNo!)=1 then 	
		setpointer(hourglass!)
	if isvalid(gu_rf_servidor_operacion) then
		if gu_rf_servidor_operacion.of_Actualiza_icono()> 0 then 
			if il_sesion_operacion <> gu_rf_servidor_operacion.of_devuelve_sesion() then 
				gu_rf_servidor_operacion.of_reavisar_consulta_incidencia()
				il_sesion_operacion = gu_rf_servidor_operacion.of_devuelve_sesion()  
			end if
		end if
		setpointer(Arrow!)
	end if
end if

	case WM_RBUTTONUP			
		
	case WM_RBUTTONDOWN
//		char(13)+char(10)+ char(13)+char(10)
	
if gu_rf_servidor_operacion.ib_opensgi_ini then
		messagebox("Configuraci$$HEX1$$f300$$ENDHEX$$n S. Operaciones (SGI)",+ char(13)+char(10)+"Servidor: " + upper(gu_rf_servidor_operacion.is_ip)+ +"      Puerto :"+string(gu_rf_servidor_operacion.il_puerto))
	else
		messagebox("Configuraci$$HEX1$$f300$$ENDHEX$$n S. Operaciones (SGI/Operaci$$HEX1$$f300$$ENDHEX$$n)",+ char(13)+char(10)+"Servidor: " + upper(gu_rf_servidor_operacion.is_ip)+ +"      Puerto: "+string(gu_rf_servidor_operacion.il_puerto))
	end if
	setpointer(Arrow!)
	case WM_RBUTTONDBLCLK
//		If ib_timer Then Return
//		
//		If Not ib_animate_icon Then
//			ib_animate_icon = True
//			Timer(.1, This)
//		End If
	case else
		
end choose
end event

event ue_tipos_tension;//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
gu_comunic.is_comunic.programa_llamante = "tipos_tension" 

OpenSheet(w_generica_mant,w_operaciones,8,Original!)
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_agentes;//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
gu_comunic.is_comunic.programa_llamante = "agentes" 

OpenSheet(w_generica_mant,w_operaciones,8,Original!)
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_unidades;//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
gu_comunic.is_comunic.programa_llamante = "unidades" 

OpenSheet(w_generica_mant,w_operaciones,8,Original!)
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_desbloqueo;// LLama a la funcion del rf operaciones para desbloquear todos los usuarios que esten conectados

string ps_mensaje
int pi_posicion
if isvalid(gu_rf_servidor_operacion) then 
if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n seleccionada elimina registros que han quedado incorrectamente bloqueados por usuarios por motivos ajenos al sistema. $$HEX1$$bf00$$ENDHEX$$Desea continuar?",information!,yesno!) = 1 then
	setpointer(Hourglass!)
	if gu_rf_servidor_operacion.of_desbloquea_usuarios(ps_mensaje) = 0 then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No es posible la conexi$$HEX1$$f300$$ENDHEX$$n con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
	else
		setpointer(Hourglass!)
		pi_posicion = pos(ps_mensaje,":",1)
	
		Do while pi_posicion <> 0
			
			ps_mensaje = replace(ps_mensaje,pi_posicion,1,", ")
			pi_posicion = pos(ps_mensaje,":",pi_posicion)
			
		loop
		
		if trim(ps_mensaje) = "" or isnull(trim(ps_mensaje)) then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No se han detectado bloqueos por parte de usuarios que no esten utilizando el sistema.")
		else
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n se ha realizado correctamente. Los siguientes usuarios ten$$HEX1$$ed00$$ENDHEX$$an registros bloqueados: " + ps_mensaje + ".")
		end if
	
	end if

end if
end if
setpointer(Arrow!)
end event

event ue_motivos;gu_comunic.is_comunic.programa_llamante = "anulacion" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)


end event

event ue_man_ct_fases;OPEN(w_man_ct_fases)
end event

event ue_reportes_diarios;opensheet(w_rep_diarios, w_operaciones, 8, Layered!)
end event

event ue_man_pais;
open(w_mant_paises)
end event

event ue_periodo_penalizacion();Open(w_mante_periodo_penalizacion)
end event

event ue_sum_x_instal();// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
SetPointer(HourGlass!)
open(w_asig_alim_sum_ct)
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
end event

event ue_mensualdecausas();//// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. 25/05/2005. Mejora de Moldavia.
OpenSheet(w_mensualdecausas,w_operaciones,8,Layered!)
end event

event ue_mensualdeinterrupciones();// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. 25/05/2005. Mejora de Moldavia.
OpenSheet(w_mensualdeinterrupciones,w_operaciones,8,Layered!)
end event

event ue_consulta_avisos_historico();datetime ldt_fecha
SetNull(ldt_fecha)
gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto
gu_comunic.is_comunic.datval1 = ldt_fecha
gu_comunic.is_comunic.datval2 = fgcd_fecha_del_dia()
gu_comunic.is_comunic.intval4 = fgci_aviso_pendiente
gu_comunic.is_comunic.intval5 = fgci_todos
gu_comunic.is_comunic.intval6 = 0
gu_comunic.is_comunic.intval7 = fgci_todos
gu_comunic.is_comunic.intval8	= fgci_todos
gu_comunic.is_comunic.Accion_llamada = "Historico"
//open(w_1233_consulta_avisos)
opensheet(w_1233_consulta_avisos,w_operaciones,0,layered!)
end event

event ue_mant_t_descargos();gu_comunic.is_comunic.programa_llamante = "descargos" 

//gu_comunic.fnu_abrir(w_generica_mant,"w_generica_mant",1,1,w_shared,"w_shared")

OpenSheet(w_generica_mant,w_operaciones,8,Original!)
end event

event ue_serv_ejec;//23/10/2008 YAF

gu_comunic.is_comunic.programa_llamante = "servicio_ejecutor" 

OpenSheet(w_generica_mant,w_operaciones,8,Original!)

end event

event ue_mantenimientotap;//AHM (21/04/2009)
OPEN(w_man_tap)

end event

event ue_mant_accion_inc();OpenSheet(w_mant_accion_inc,w_operaciones,8,Original!)
end event

event ue_mant_categorias_sum_imp;OpenSheet(w_mant_categorias_sum_imp,w_operaciones,8,Original!)
end event

event ue_mant_suministros_cat();OpenSheet(w_mant_suministros_cat,w_operaciones,8,Original!)
end event

public function integer fnu_presentar_menu (integer pi_perfil);////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_presentar_menu
//// 
//// Objetivo: Habilita acciones de menu.
////
//// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//// 
//// Par$$HEX1$$e100$$ENDHEX$$metros:
////			Entrada: pi_perfil
////       Salida: --
////
//// Devuelve:
////
//// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//// -----		-----------		---------
////
//////////////////////////////////////////////////////////////
//
//CHOOSE CASE pi_perfil
//	CASE fgci_perfil_oper_alta_media
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		CASE fgci_perfil_oper_baja
//
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		md_operaciones.m_consultas.m_infdelcliente.enabled = false
//		md_operaciones.m_consultas.m_infdelcliente.toolbaritemvisible = false
//
//
//		CASE fgci_perfil_oper_Consulta
//			// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false		
//
//
//		// actualizacion de incidencias
//
//		md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.visible = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.toolbaritemvisible = false
//
//
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//
//		CASE fgci_perfil_oper_encargado_turno
//	
//
//		CASE fgci_perfil_oper_Gerente
//
//		md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.visible = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.toolbaritemvisible = false
//
//
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//// comienza mantenimiento
//
//		CASE fgci_perfil_mante_operador_alta
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		// gestion de avisos
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.enabled = false
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.toolbaritemvisible = false
//		
//		// Consulta de Avisos Pendientes
//
//		md_operaciones.m_gestindeavisos.m_pendientes2.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientes2.toolbaritemvisible = false
//		
//		// Consulta de Avisos Resueltos
//		md_operaciones.m_gestindeavisos.m_resueltos3.enabled = false
//		md_operaciones.m_gestindeavisos.m_resueltos3.toolbaritemvisible = false
//		
//
//		// ingreso intervalo horario
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.toolbaritemvisible = false
//		
//
//		// ingreso duracion 
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.toolbaritemvisible = false
//
//		// situacion climatologica
//		md_operaciones.m_consultas.m_situacionclimatologica.enabled = false
//		md_operaciones.m_consultas.m_situacionclimatologica.toolbaritemvisible = false
//
//		// suministros importantes
//		md_operaciones.m_consultas.m_sumimp.enabled = false
//		md_operaciones.m_consultas.m_sumimp.toolbaritemvisible = false
//
//		// informacion del clientes
//		md_operaciones.m_consultas.m_infdelcliente.enabled = false
//		md_operaciones.m_consultas.m_infdelcliente.toolbaritemvisible = false
//
//		CASE fgci_perfil_mante_operador_baja
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		// gestion de avisos
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.enabled = false
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.toolbaritemvisible = false
//		
//		// Consulta de Avisos Pendientes
//
//		md_operaciones.m_gestindeavisos.m_pendientes2.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientes2.toolbaritemvisible = false
//		
//		// Consulta de Avisos Resueltos
//		md_operaciones.m_gestindeavisos.m_resueltos3.enabled = false
//		md_operaciones.m_gestindeavisos.m_resueltos3.toolbaritemvisible = false
//		
//
//		// ingreso intervalo horario
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.toolbaritemvisible = false
//		
//
//		// ingreso duracion 
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.toolbaritemvisible = false
//
//		// situacion climatologica
//		md_operaciones.m_consultas.m_situacionclimatologica.enabled = false
//		md_operaciones.m_consultas.m_situacionclimatologica.toolbaritemvisible = false
//
//		// suministros importantes
//		md_operaciones.m_consultas.m_sumimp.enabled = false
//		md_operaciones.m_consultas.m_sumimp.toolbaritemvisible = false
//
//		// informacion del clientes
//		md_operaciones.m_consultas.m_infdelcliente.enabled = false
//		md_operaciones.m_consultas.m_infdelcliente.toolbaritemvisible = false
//
//		CASE fgci_perfil_mante_encargado_turno
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		// gestion de avisos
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.enabled = false
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.toolbaritemvisible = false
//		
//		// Consulta de Avisos Pendientes
//
//		md_operaciones.m_gestindeavisos.m_pendientes2.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientes2.toolbaritemvisible = false
//		
//		// Consulta de Avisos Resueltos
//		md_operaciones.m_gestindeavisos.m_resueltos3.enabled = false
//		md_operaciones.m_gestindeavisos.m_resueltos3.toolbaritemvisible = false
//		
//
//		// ingreso intervalo horario
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.toolbaritemvisible = false
//		
//
//		// ingreso duracion 
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.toolbaritemvisible = false
//
//		// situacion climatologica
//		md_operaciones.m_consultas.m_situacionclimatologica.enabled = false
//		md_operaciones.m_consultas.m_situacionclimatologica.toolbaritemvisible = false
//
//		// suministros importantes
//		md_operaciones.m_consultas.m_sumimp.enabled = false
//		md_operaciones.m_consultas.m_sumimp.toolbaritemvisible = false
//
//		// informacion del clientes
//		md_operaciones.m_consultas.m_infdelcliente.enabled = false
//		md_operaciones.m_consultas.m_infdelcliente.toolbaritemvisible = false
//
//
//		CASE fgci_perfil_mante_consulta
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		// gestion de avisos
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.enabled = false
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.toolbaritemvisible = false
//		
//		// Consulta de Avisos Pendientes
//
//		md_operaciones.m_gestindeavisos.m_pendientes2.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientes2.toolbaritemvisible = false
//		
//		// Consulta de Avisos Resueltos
//		md_operaciones.m_gestindeavisos.m_resueltos3.enabled = false
//		md_operaciones.m_gestindeavisos.m_resueltos3.toolbaritemvisible = false
//		
//
//		// ingreso intervalo horario
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.toolbaritemvisible = false
//		
//
//		// ingreso duracion 
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.toolbaritemvisible = false
//
//		// situacion climatologica
//		md_operaciones.m_consultas.m_situacionclimatologica.enabled = false
//		md_operaciones.m_consultas.m_situacionclimatologica.toolbaritemvisible = false
//
//		// suministros importantes
//		md_operaciones.m_consultas.m_sumimp.enabled = false
//		md_operaciones.m_consultas.m_sumimp.toolbaritemvisible = false
//
//		// informacion del clientes
//		md_operaciones.m_consultas.m_infdelcliente.enabled = false
//		md_operaciones.m_consultas.m_infdelcliente.toolbaritemvisible = false
//
//		// Actualizacion de incidencias
//		md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.toolbaritemvisible = false
//
//
//		CASE fgci_perfil_mante_gerente
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		// gestion de avisos
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.enabled = false
//		md_operaciones.m_gestindeavisos.m_gestindereclamos.toolbaritemvisible = false
//		
//		// Consulta de Avisos Pendientes
//
//		md_operaciones.m_gestindeavisos.m_pendientes2.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientes2.toolbaritemvisible = false
//		
//		// Consulta de Avisos Resueltos
//		md_operaciones.m_gestindeavisos.m_resueltos3.enabled = false
//		md_operaciones.m_gestindeavisos.m_resueltos3.toolbaritemvisible = false
//		
//
//		// ingreso intervalo horario
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresadosinthorario.toolbaritemvisible = false
//		
//
//		// ingreso duracion 
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.enabled = false
//		md_operaciones.m_gestindeavisos.m_pendientesinthorario.toolbaritemvisible = false
//
//		// situacion climatologica
//		md_operaciones.m_consultas.m_situacionclimatologica.enabled = false
//		md_operaciones.m_consultas.m_situacionclimatologica.toolbaritemvisible = false
//
//		// suministros importantes
//		md_operaciones.m_consultas.m_sumimp.enabled = false
//		md_operaciones.m_consultas.m_sumimp.toolbaritemvisible = false
//
//		// informacion del clientes
//		md_operaciones.m_consultas.m_infdelcliente.enabled = false
//		md_operaciones.m_consultas.m_infdelcliente.toolbaritemvisible = false
//
//		// Actualizacion de incidencias
//		md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.toolbaritemvisible = false
//
//		
//		CASE fgci_perfil_oper_baja
//
//		// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false
//
//		// Mantenimientos
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//		md_operaciones.m_consultas.m_infdelcliente.enabled = false
//		md_operaciones.m_consultas.m_infdelcliente.toolbaritemvisible = false
//
//
//		CASE fgci_perfil_mante_Consulta
//			// Ingreso de avisos
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = false
//		md_operaciones.m_gestindeavisos.m_ingresodeavisos.toolbaritemvisible = false		
//
//
//		// actualizacion de incidencias
//
//		md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.visible = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.toolbaritemvisible = false
//
//
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//
//		CASE fgci_perfil_mante_encargado_turno
//	
//
//		CASE fgci_perfil_mante_Gerente
//
//		md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.visible = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.toolbaritemvisible = false
//
//
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//
//	
//	CASE ELSE
//		md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.visible = false
//		md_operaciones.m_incidencias1.m_altayactualizacin.toolbaritemvisible = false
//
//
//		md_operaciones.m_mantenimientos.enabled = false
//		md_operaciones.m_mantenimientos.visible = false
//		md_operaciones.m_mantenimientos.toolbaritemvisible = false
//END CHOOSE
//
return 1
end function

public function integer fnu_obtener_centros_dep ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_obtener_centros_dep
// 
// Objetivo: Obtiene centros y departamentos de tablas.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada:--
//       Salida:--
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

int li_tipo

IF GI_NRO_CENTRO = fgci_todos AND GI_NRO_CMD = fgci_todos AND GI_NRO_PUESTO = fgci_todos THEN
	li_tipo = 1
ELSE
	li_tipo = 3
END IF

  SELECT "SGD_CENTRO"."CENTRO_DEP",   
         "SGD_CENTRO"."CMD_DEP",   
         "SGD_CENTRO"."MESA_DEP",   
         "SGD_CENTRO"."COD_PROV",   
         "SGD_CENTRO"."COD_DEPTO",   
         "SGD_CENTRO"."COD_MUNIC",   
         "SGD_CENTRO"."COD_LOCAL",   
         "PROVINCIAS"."NOM_PROV",   
         "DEPTOS"."NOM_DEPTO",   
         "MUNICIPIOS"."NOM_MUNIC",   
         "LOCALIDADES"."NOM_LOCAL"  
    INTO :II_CENTRO_DEP,   
         :II_CMD_DEP,   
         :II_PUESTO_DEP,   
         :IL_PROVINCIA,   
         :IL_DEPARTAMENTO,   
         :IL_MUNICIPIO,   
         :IL_LOCALIDAD,   
         :IS_PROVINCIA,   
         :IS_DEPARTAMENTO,   
         :IS_MUNICIPIO,   
         :IS_LOCALIDAD  
    FROM "DEPTOS",   
         "LOCALIDADES",   
         "MUNICIPIOS",   
         "PROVINCIAS" ,
			"SGD_CENTRO" 
   WHERE ( "SGD_CENTRO"."COD_PROV" = "PROVINCIAS"."COD_PROV" ) and  
         ( "SGD_CENTRO"."COD_DEPTO" = "DEPTOS"."COD_DEPTO" ) and  
         ( "SGD_CENTRO"."COD_MUNIC" = "MUNICIPIOS"."COD_MUNIC" ) and  
         ( "SGD_CENTRO"."COD_LOCAL" = "LOCALIDADES"."COD_LOCAL" ) and 
			( "SGD_CENTRO"."TIP_CENTRO" = :li_tipo ) and 
         ( ( "SGD_CENTRO"."NRO_CENTRO" = :gi_nro_puesto ) )   ;



//
//SELECT "CENTRO"."CENTRO_DEP","CENTRO"."CMD_DEP","CENTRO"."MESA_DEP" ,
//"CENTRO"."COD_PROV","CENTRO"."COD_DEPTO","CENTRO"."COD_MUNIC",
//"CENTRO"."COD_LOCAL"
//INTO :II_CENTRO_DEP,:II_CMD_DEP,:II_PUESTO_DEP,:IL_PROVINCIA,:IL_DEPARTAMENTO,
//:IL_MUNICIPIO,:IL_LOCALIDAD
//FROM CENTRO 
//WHERE "CENTRO"."NRO_CENTRO" = :GI_NRO_CMD;
//
if sqlca.sqlcode <> 0 then
		ii_centro_dep = gi_nro_centro
		ii_cmd_dep = gi_nro_cmd
		ii_puesto_dep = gi_nro_puesto
end if
gi_nro_centro_dep = ii_centro_dep
gi_nro_cmd_dep = ii_cmd_dep
gi_nro_puesto_dep = ii_puesto_dep


RETURN 1

end function

event open;long ll_hand,ll_valor,ll_posicion_busqueda
int pi_perfil, li_nro_aviso, li_codigo,li_op_inst,li_valor
string ls_ci, ls_basedatos
long px,py,pw,ph
long tx,ty
environment le_env

IF (This.WindowType <> Main!  and This.WindowType <> MDI!) and isvalid(w_operaciones) then

	px = This.x
	py = This.y
	pw = This.width
	ph = this.height
		
	getenvironment(le_env)
	
	IF le_env.ScreenHeight = 600 AND le_env.ScreenWidth = 800 THEN
		This.resizable = True 
	END IF
	
	if pw > this.width then
		tx =px +  (pw - this.width) / 2
	else
		tx =px - ( this.width - pw) / 2
	end if
	
	if ph > this.height then
		ty =py + (ph - this.height) / 2
	else
		ty =py - ( this.height - ph) / 2
	end if
	
	if unitstopixels(tx + this.width,Xunitstopixels!) > le_env.screenwidth then
		tx = pixelstounits(le_env.screenwidth,xpixelstounits!) - this.width
	end if
	
	if unitstopixels(ty + this.height,yunitstopixels!) > le_env.screenheight then
		ty = pixelstounits(le_env.screenheight,ypixelstounits!) - this.height
	end if
	
	if unitstopixels(tx,Xunitstopixels!) < 0 then
		tx = 0
	end if

	this.y = ty
	this.x = tx

End if

//This.title = gu_comunic.f_titulo_ventana("w_oper","Modul_oper")

// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008) A$$HEX1$$f100$$ENDHEX$$adimos la base de datos que esta utilizando la aplicaci$$HEX1$$f300$$ENDHEX$$n.
ls_basedatos=ProfileString("opensgi.ini", "database", "Database", "")
This.title = " OPEN - SGI (" + gs_version + ") - M$$HEX1$$f300$$ENDHEX$$dulo de Operaciones.                                            Base de Datos - "+ls_basedatos  
//This.title = " OPEN - SGI (V.U.1.5) - M$$HEX1$$f300$$ENDHEX$$dulo de Operaciones.                                            Base de Datos - "+ls_basedatos  

// Parametrizaci$$HEX1$$f300$$ENDHEX$$n del N$$HEX1$$fa00$$ENDHEX$$mero de Aviso

SELECT "VALOR"
INTO :li_nro_aviso
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 1 AND
		"SISTEMA" like  '%SGI%' ;

SELECT "VALOR"
INTO :fgci_con_acometidas
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 46 AND
		"SISTEMA" like  '%SGI%' ;
		
IF li_nro_aviso = 1 THEN
	gl_nro_aviso_visible = TRUE
ELSE
	gl_nro_aviso_visible = FALSE
END IF	
	
SELECT "VALOR"
INTO :li_nro_aviso
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 10 ;

IF li_nro_aviso = 1 THEN
	gb_obs_obligatorias = TRUE
ELSE
	gb_obs_obligatorias = FALSE
END IF	

// NORMALIZACION

SELECT "SGD_PARAMETROS"."VALOR"
INTO :li_codigo
FROM "SGD_PARAMETROS"
WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = 51;

IF li_codigo = 0 THEN
	gb_normalizacion = false
ELSE
	gb_normalizacion = true
END IF

// Tablas de decision FDO

if fg_verifica_parametro('TABLA_DECISION') = false then
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_fasesdect.visible = false
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_-10.visible = false
	gb_tabla_decision = false
else
	gb_tabla_decision = true
end if

IF gb_operaciones then
	
	// Miramos el parametro de las instalaciones digitalizadas
	
	SELECT "GI_PARAMETROS"."VALOR"  
     INTO :li_op_inst  
     FROM "GI_PARAMETROS"  
     WHERE "GI_PARAMETROS"."COD_PARAMETRO" = 82   ;
	  
	if sqlca.sqlcode = 0 then
		gb_operaciones_inst = true
	else
		IF sqlca.SqlCode <> 0 THEN
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se encuentra el par$$HEX1$$e100$$ENDHEX$$metro que determina sobre que instalaciones se opera desde SGI (gi_parametros - Cod Par$$HEX1$$e100$$ENDHEX$$metro 82).")
			return -1
		END IF
	end if
	// Recupera CI FDO
	
	SELECT "SGD_ENTIDADES"."CLASS_ID"
	INTO :gi_ci_subestac
	FROM "SGD_ENTIDADES"
	WHERE "SGD_ENTIDADES"."TABLA_ALFA" = 'sgd_subestac';
	
	IF sqlca.SqlCode <> 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase. CI de la Subestaci$$HEX1$$f300$$ENDHEX$$n")
		return -1
	END IF
	
	SELECT "SGD_ENTIDADES"."CLASS_ID"
	INTO :gi_ci_linea_mt
	FROM "SGD_ENTIDADES"
	WHERE "SGD_ENTIDADES"."TABLA_ALFA" = 'sgd_salmt';
	
	IF sqlca.SqlCode <> 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase. CI de la L$$HEX1$$ed00$$ENDHEX$$nea de media.")
		return -1
	END IF
	
	// GNU 23-8-2007. Mejora EPSA indisponibilidades operaci$$HEX1$$f300$$ENDHEX$$n
	SELECT "SGD_ENTIDADES"."CLASS_ID"
	INTO :gi_ci_linea_at
	FROM "SGD_ENTIDADES"
	WHERE "SGD_ENTIDADES"."TABLA_ALFA" = 'sgd_salat';
	// FIN GNU
	
	IF sqlca.SqlCode <> 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase. CI de la L$$HEX1$$ed00$$ENDHEX$$nea de alta.")
		return -1
	END IF
	
	SELECT "SGD_ENTIDADES"."CLASS_ID"
	INTO :gi_ci_ct
	FROM "SGD_ENTIDADES"
	WHERE "SGD_ENTIDADES"."TABLA_ALFA" = 'sgd_ct';
	
	IF sqlca.SqlCode <> 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase. CI del CT")
		return -1
	END IF
	
	SELECT "SGD_ENTIDADES"."CLASS_ID"
	INTO :gi_ci_centroref
	FROM "SGD_ENTIDADES"
	WHERE "SGD_ENTIDADES"."TABLA_ALFA" = 'sgd_centroalim';
	
	IF sqlca.SqlCode <> 0 and gi_pais = 8 THEN // si no se encuentra el CI del Centro de Reflexion y el Pa$$HEX1$$ed00$$ENDHEX$$s es Moldavia.
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase. CI del Centro de reflexion")
		return -1
	END IF
	
	SELECT "SGD_ENTIDADES"."CLASS_ID_ESQ"
	INTO :gi_ci_trafo_esq
	FROM "SGD_ENTIDADES"
	WHERE "SGD_ENTIDADES"."TABLA_ALFA" = 'sgd_trafo_mb';
		
	IF sqlca.SqlCode <> 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase. CI del Esquema del Trafo MB.")
		return -1
	END IF
	
	SELECT "SGD_ENTIDADES"."CLASS_ID"
	INTO :gi_ci_trafo
	FROM "SGD_ENTIDADES"
	WHERE "SGD_ENTIDADES"."TABLA_ALFA" = 'sgd_trafo_mb';
		
	IF sqlca.SqlCode <> 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase. CI del Esquema del Trafo")
		return -1
	END IF
	
End if

// EL USUARIO NO TIENE ACCESO A ENVIAR A MANTENIMIENTO
if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_DER_MANT','')=1 then 
       gb_mantenimiento = FALSE
else  // VERIFICAMOS SI PUEDE TENERLO
			SELECT "VALOR"
		INTO :li_nro_aviso
		FROM "SGD_PARAMETROS"
		WHERE "COD_PARAMETRO" = 13 ;
		
		IF li_nro_aviso = 1 THEN
			gb_mantenimiento = TRUE
		ELSE
			gb_mantenimiento = FALSE
		END IF
end if

SELECT "VALOR"
INTO :li_nro_aviso
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 14 ;

IF li_nro_aviso = 1 THEN
	gb_ole = TRUE
	gb_obs_obligatorias = FALSE
ELSE
	gb_ole = FALSE
END IF	

SELECT "VALOR"
INTO :li_nro_aviso
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 2 ;

IF li_nro_aviso = 1 THEN
	gb_sgt = TRUE
ELSE
	gb_sgt = FALSE
END IF	

SELECT "VALOR"
INTO :li_nro_aviso
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 3 ;

IF li_nro_aviso = 1 THEN
	gb_openbdi = TRUE
ELSE
	gb_openbdi = FALSE
END IF	

//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 13/06//2002  **
//**************************************************
   gb_tipos_de_via = fg_verifica_parametro('TIPOS VIA')
//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 13/06//2002  **
//**************************************************


/// RECUPERAR LOS TIPOS DE INSTALACIONES

// SUBESTACION AT

SELECT CODIGO
INTO :fgci_tipo_subestacion_at
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'SUBA';

// SALIDA AT

SELECT CODIGO
INTO :fgci_tipo_salida_at
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'SAT';

// SUBESTACION MT

SELECT CODIGO
INTO :fgci_tipo_subestacion
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'SUB';
			
// SALIDA MT

SELECT CODIGO
INTO :fgci_tipo_salida_mt
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'SMT';
			
// CT

SELECT CODIGO
INTO :fgci_tipo_ct
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'CT';
			
// TRAFO MB

SELECT CODIGO
INTO :fgci_tipo_transformador
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'TMB';
			
// SALIDA BT

SELECT CODIGO
INTO :fgci_tipo_salida_de_baja
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'SBT';
			
// ACOMETIDA

SELECT CODIGO
INTO :fgci_tipo_acometida
FROM SGD_VALOR
WHERE CODIF = 'T_IN' AND
			VALOR = 'ACO';
			
/// FDO - TIPOS DE INSTALACION

// FDO - LOGS 

// LOG DE AVISOS

SELECT VALOR
INTO :LI_VALOR
FROM GI_PARAMETROS
WHERE COD_PARAMETRO =  96 ;

IF LI_VALOR = 1 THEN gb_log_avisos = TRUE;

LI_VALOR = 0

// LOG DE COMUNICACIONES

SELECT VALOR
INTO :LI_VALOR
FROM GI_PARAMETROS
WHERE COD_PARAMETRO =  97 ;

IF LI_VALOR = 1 THEN gb_log_comunica = TRUE;
			
//gb_usuario_mant=FALSE 	//POR DEFECTO SE INDICA QUE NO ES UN USUARIO DE MANTENIMIENTO
								// EN CASO DE SERLO SE SETEA LA VARIABLE gb_usuario_mant en TRUE
gb_usuario_tele=FALSE
fnu_obtener_centros_dep()

//if gu_perfiles.of_acceso_perfil(gi_perfil, 'GAV_M_OPER',"SIN_ACCESO") <> 1  and gb_operaciones = FALSE THEN
//   messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","En estos momentos no esta disponible Open Operacion")
//	halt close
//	return
//end if




// Habilito opciones del menu segun perfil

// Gestion avisos
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'GAV_ACCESO',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_gestindeavisos.m_gestindereclamos.enabled = false
	md_operaciones.m_gestindeavisos.m_gestindereclamos.ToolbarItemvisible = false
END IF

// Consulta avisos
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'CAV_GENERAL',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_gestindeavisos.m_pendientes2.enabled = false
	md_operaciones.m_gestindeavisos.m_pendientes2.ToolbarItemvisible = false
END IF

// Estadistica avisos
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'EAV_GENERAL',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_gestindeavisos.m_estadisticas.enabled = False
	md_operaciones.m_gestindeavisos.m_estadisticas.ToolbarItemvisible = False
END IF

// Ingreso avisos
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'IAV_GENERAL',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_gestindeavisos.m_ingresodeavisos.enabled = False
	md_operaciones.m_gestindeavisos.m_ingresodeavisos.ToolbarItemvisible = False
END IF

// Reactivar avisos
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'RAV_REACTIVAR',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_gestindeavisos.m_reactivaravisos.enabled = False
	md_operaciones.m_gestindeavisos.m_reactivaravisos.ToolbarItemvisible = False
END IF

// Consulta incidencias
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'INC_GENERAL',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_incidencias1.m_altayactualizacin.enabled = false
	md_operaciones.m_incidencias1.m_altayactualizacin.ToolbarItemvisible = false
END IF

// Situacion actual por CMD
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'INC_SITUACION',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_incidencias1.m_cargadetrabajo.enabled = false
	md_operaciones.m_incidencias1.m_cargadetrabajo.ToolbarItemvisible = false
END IF

// Historico incidencias
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'INC_HIST',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_incidencias1.m_historico.enabled = false
	md_operaciones.m_incidencias1.m_historico.ToolbarItemvisible = false
END IF

// Gestion descargos
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'DES_ACCESO',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_descargos1.m_consulta.enabled = false
	md_operaciones.m_descargos1.m_consulta.ToolbarItemvisible = false
END IF

// Historico descargos
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'DES_HIST',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_descargos1.m_historico1.enabled = false
	md_operaciones.m_descargos1.m_historico1.ToolbarItemvisible = false
END IF

// Mantenim. red
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'RED_ACCESO',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_estructuradelared.enabled = false
	md_operaciones.m_mantenimientos.m_estructuradelared.ToolbarItemvisible = false
ELSEIF gu_perfiles.of_acceso_perfil(gi_perfil, 'RED_ACCESO',"ACC_CONSULTA") = 1 THEN
	
	//***************************************
	//**  OSGI 2001.1  	11/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
		
	if gb_openbdi = true and Not fg_verifica_parametro('mante_instalacion') then
	
			md_operaciones.m_mantenimientos.m_estructuradelared.enabled = False
			md_operaciones.m_mantenimientos.m_estructuradelared.visible = False
			md_operaciones.m_mantenimientos.m_estructuradelared.ToolbarItemvisible = False
	
	//		md_operaciones.m_mantenimientos.m_acometidas.enabled = False
	//		md_operaciones.m_mantenimientos.m_acometidas.visible = False
	
	end if	
ELSE	
	md_operaciones.m_mantenimientos.m_estructuradelared.enabled = False
	md_operaciones.m_mantenimientos.m_estructuradelared.visible = False
	md_operaciones.m_mantenimientos.m_estructuradelared.ToolbarItemvisible = False
END IF

// Mantenim. instalciones con prob.
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'CINSP_ACCESO',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_instalacionesconproblemas.enabled = false
	md_operaciones.m_mantenimientos.m_instalacionesconproblemas.ToolbarItemvisible = false
END IF

// Mantenim. acometidas por direccion
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'ACO_DIR',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_acometidas.m_alimentacindesuministros.enabled = false
	md_operaciones.m_mantenimientos.m_acometidas.m_alimentacindesuministros.ToolbarItemvisible = false
END IF

// Mantenim. alimentacion suministros
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'ACO_SUMIN',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_acometidas.m_pordireccin.enabled = false
	md_operaciones.m_mantenimientos.m_acometidas.m_pordireccin.ToolbarItemvisible = false
	// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	md_operaciones.m_mantenimientos.m_suministrosporinstalacion.enabled = false
	// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
END IF

IF gu_perfiles.of_acceso_perfil(gi_perfil, 'ACO_DIR',"SIN_ACCESO") = 1 and gu_perfiles.of_acceso_perfil(gi_perfil, 'ACO_SUMIN',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_acometidas.enabled = false
	md_operaciones.m_mantenimientos.m_acometidas.ToolbarItemvisible = false
END IF

//IF gu_perfiles.of_acceso_perfil(gi_perfil, 'ACO_DIR',"SIN_ACCESO") = 1 and 

// Mantenim. brigadas
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRI_ACCESO',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_brigadas.enabled = false
	md_operaciones.m_mantenimientos.m_brigadas.ToolbarItemvisible = false
END IF

// Mantenim. brigadistas
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRIGADISTA',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_lineros1.enabled = false
	md_operaciones.m_mantenimientos.m_lineros1.ToolbarItemvisible = false
END IF

// Mantenim. suministros importantes
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'SUM_IMP',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_suministrosimportantes.enabled = false
	md_operaciones.m_mantenimientos.m_suministrosimportantes.ToolbarItemvisible = false
END IF

// Mantenim. situacion clima
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'SIT_CLIMA',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_estadosdelclima.enabled = false
	md_operaciones.m_mantenimientos.m_estadosdelclima.ToolbarItemvisible = false
END IF

// Mantenim. tablas basicas
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'TBAS_BASICAS',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_tablasbsicas.enabled = false
	md_operaciones.m_mantenimientos.m_tablasbsicas.ToolbarItemvisible = false
	
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Else
	If fg_verifica_parametro(This.ClassName()) Then
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_agrupacindecausasportipodeincid.Enabled = True
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_agrupacindecausasportipodeincid.Visible = True
	End If
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
END IF

// Mantenim. opciones personalizadas
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'OP_PERS',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_opcionespersonalizadas.enabled = false
	md_operaciones.m_mantenimientos.m_opcionespersonalizadas.ToolbarItemvisible = false
END IF

// Consultas OT
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'CONS_OT',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_consultas.m_consultadeots.enabled = false
	md_operaciones.m_consultas.m_consultadeots.ToolbarItemvisible = false
END IF

// Info del cliente
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'INFO_CLI',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_consultas.m_infdelcliente.enabled = false
	md_operaciones.m_consultas.m_infdelcliente.ToolbarItemvisible = false
END IF

// Reportes personalizados
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'REPORTES_P',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_consultas.m_reportes.enabled = false
	md_operaciones.m_consultas.m_reportes.ToolbarItemvisible = false
	md_operaciones.m_consultas.m_ediciondeinformes.enabled = false
	md_operaciones.m_consultas.m_ediciondeinformes.ToolbarItemvisible = false
END IF

// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. 25/05/2005. Mejora de Moldavia.
If gi_pais <> 8 Or &
	gu_perfiles.of_acceso_perfil(gi_perfil, 'REPORTES_P',"SIN_ACCESO") = 1 Then
	md_operaciones.m_consultas.m_otrosinformes.Enabled = False
	md_operaciones.m_consultas.m_otrosinformes.Visible = False
	md_operaciones.m_consultas.m_otrosinformes.m_mensualdeinterrupciones.Enabled = False
	md_operaciones.m_consultas.m_otrosinformes.m_mensualdeinterrupciones.ToolbarItemvisible = False
	md_operaciones.m_consultas.m_otrosinformes.m_mensualdecausas.Enabled = False
	md_operaciones.m_consultas.m_otrosinformes.m_mensualdecausas.ToolbarItemvisible = False
End If
// Fin. Sgo.

// Control de telefonistas
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'CONT_TELEF',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_consultas.m_controldetelefonistas.enabled = false
	md_operaciones.m_consultas.m_controldetelefonistas.ToolbarItemvisible = false
END IF

//LSH INI 17/10/2013 Mejora DEO13-00000754
/* encriptador/desencriptador */
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'ENC_DES',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_encriptardesencriptar.enabled = false
	md_operaciones.m_mantenimientos.m_encriptardesencriptar.ToolbarItemvisible = false
END IF
//LSH FIN 17/10/2013 Mejora DEO13-00000754


// Mantenimiento de perfiles
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'TBAS_BASICAS',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_gestiondeperfiles.enabled = false
	md_operaciones.m_mantenimientos.m_gestiondeperfiles.ToolbarItemvisible = false
END IF

// Mantenimiento de Contratas
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'CON_MANT',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_contratas.enabled = false
	md_operaciones.m_mantenimientos.m_contratas.ToolbarItemvisible = false
END IF

// Mantenim. opciones personalizadas
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'DES_USU',"SIN_ACCESO") = 1 THEN
	md_operaciones.m_mantenimientos.m_desbloqueoglobaldeusuarios.enabled = false
	md_operaciones.m_mantenimientos.m_desbloqueoglobaldeusuarios.ToolbarItemvisible = false
END IF

// LFE - Mejora 1/262335 
// Mantenimiento de los periodos de penalizaci$$HEX1$$f300$$ENDHEX$$n
IF gi_pais <> 4 THEN
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_periodosdepenalizacin.visible = False
END IF
// LFE - Fin Mejora 1/262335 

//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If fg_verifica_parametro('CONS_SALMT_DEFICIT') Then
// Consulta de Indicativos de SMT
	If gu_perfiles.of_acceso_perfil(gi_perfil, 'CON_SMT',"ACC_CONSULTA") = 1 Then
		md_operaciones.m_incidencias1.m_consultadesmtinterrumpibles.Enabled = True
		md_operaciones.m_incidencias1.m_consultadesmtinterrumpibles.Visible = True
	End If

// Mantenimiento de Indicativos de SMT
	If gu_perfiles.of_acceso_perfil(gi_perfil, 'SMT_MANT',"ACC_CONSULTA") = 1 Or &
		gu_perfiles.of_acceso_perfil(gi_perfil, 'SMT_MANT',"ACC_MANTEN") = 1 Then
		md_operaciones.m_mantenimientos.m_indicativossmtinterrumpibles.Enabled = True
		md_operaciones.m_mantenimientos.m_indicativossmtinterrumpibles.Visible = True
	End If
End If

If fg_verifica_parametro('pestana_otros') Then
//	If fg_verifica_parametro('MAN_TENS_AGEN') Then
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_separador_otros.Enabled = True
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_separador_otros.Visible = True
	
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_tiposdetensin.Visible = True
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_tiposdetensin.Enabled = True
	
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_agentes.Visible = True
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_agentes.Enabled = True
//	End If
End If

If fg_verifica_parametro('solicitud_descargos_extra') Then
//	If fg_verifica_parametro('MAN_UNIDAD') Then
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_separador_otros.Enabled = True
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_separador_otros.Visible = True
	
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_unidades.Enabled = True
		md_operaciones.m_mantenimientos.m_tablasbsicas.m_unidades.Visible = True
//	End If
End If


IF not gb_operaciones THEN
		md_operaciones.m_mantenimientos.m_-111.visible = false
		md_operaciones.m_mantenimientos.m_desbloqueoglobaldeusuarios.visible = false
end if



IF ProfileString("opensgi.ini","EXPLICACION","SQL","NO") = 'SI' THEN
	md_operaciones.m_depurar.m_trazasql.toolbaritemvisible  = true
	md_operaciones.m_depurar.m_trazasql.visible  = true
	md_operaciones.m_depurar.m_optimizador.visible  = true
	md_operaciones.m_depurar.visible = TRUE
	IF ProfileString("opensgi.ini","EXPLICACION","Depurar","NO") = 'NO' THEN
		md_operaciones.m_depurar.m_interfazconoperaciones.visible  = false
		md_operaciones.m_depurar.m_niveldetensiondigitalizada.visible  = false
		md_operaciones.m_depurar.m_tipodered.visible  = false
		md_operaciones.m_depurar.m_interfazconscada.visible  = false
		md_operaciones.m_depurar.m_perfiles.visible  = false
		md_operaciones.m_depurar.m_pb60.visible  = false
		md_operaciones.m_depurar.m_pb601.visible  = false

	
	END IF

end if


IF ProfileString("opensgi.ini","EXPLICACION","Depurar","NO") = 'SI' THEN
	md_operaciones.m_depurar.visible = TRUE
	gb_log_comunica= true
	IF gb_operaciones THEN
		md_operaciones.m_depurar.m_interfazconoperaciones.checked = True
	END IF
	IF gi_tension_nivel_min = 1 THEN
		md_operaciones.m_depurar.m_niveldetensiondigitalizada.m_altatensi$$HEX1$$f300$$ENDHEX$$n.checked = true
	ELSEIF gi_tension_nivel_min = 2 THEN
		md_operaciones.m_depurar.m_niveldetensiondigitalizada.m_mediatensi$$HEX1$$f300$$ENDHEX$$n.checked = true
	ELSEIF gi_tension_nivel_min = 1 THEN
		md_operaciones.m_depurar.m_niveldetensiondigitalizada.m_bajatensi$$HEX1$$f300$$ENDHEX$$n.checked = true
	END IF
	IF gb_red_trifasica THEN
		md_operaciones.m_depurar.m_tipodered.m_redtrifsica.checked = true
	ELSE
		md_operaciones.m_depurar.m_tipodered.m_redmonofsica.checked = true
	END IF
	IF gb_scada THEN
		md_operaciones.m_depurar.m_interfazconscada.checked = true
	ELSE
		md_operaciones.m_depurar.m_interfazconscada.checked = false
	END IF
	
END IF

//*************************************************************
// PM REPORTES DIARIOS VERSION UNIFICADA AMR 12/09/2002
//*************************************************************
if fg_verifica_parametro('REPORTES DIARIOS') then 
	if not (gu_perfiles.of_acceso_perfil(gi_perfil, 'REPORTES_P',"SIN_ACCESO") = 1  )then
			md_operaciones.m_consultas.m_reportesdiarios.Enabled = true			
	else
			md_operaciones.m_consultas.m_reportesdiarios.Enabled = false
	end if
	md_operaciones.m_consultas.m_reportesdiarios.visible = true

else
	md_operaciones.m_consultas.m_reportesdiarios.enabled = false
	md_operaciones.m_consultas.m_reportesdiarios.visible = false
end if

// GNU 19-9-2006. Mejora 1/426921
if fg_verifica_parametro('descripcion descargos') then 
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_tiposdedescargos.enabled=true
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_tiposdedescargos.visible=true
else	
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_tiposdedescargos.enabled=false
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_tiposdedescargos.visible=false
end if
	
//**************************************************************

//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************
gb_inc_antig = fg_verifica_parametro('RESTRICCION_INC')

If gb_inc_antig Then
	SELECT "SGD_VALOR"."CODIGO"  
	  INTO :gi_dias_antiguedad  
	  FROM "SGD_VALOR"  
	 WHERE ( "SGD_VALOR"."CODIF" = 'INCA' ) AND  
			 ( "SGD_VALOR"."VALOR" = '1' )   ;
			 
	If sqlca.sqlcode <> 0 Or IsNull(gi_dias_antiguedad) Or gi_dias_antiguedad < 0 Or Not gb_inc_antig Then
		gi_dias_antiguedad = 0
	End If
	
	If gi_dias_antiguedad = 0 Then gb_inc_antig = False
Else
	gi_dias_antiguedad = 0
End If

If IsNull(gi_dias_antiguedad) Then gi_dias_antiguedad = 0
//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************

//AHM(22/03/2010) Esta opci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$obsoleta
///*AHM 21/04/2009 Mantenimiento de taps*/
//IF fg_verifica_parametro('MANTENIMIENTO TAP') THEN
//   md_operaciones.m_mantenimientos.m_tablasbsicas.m_mantenimientodetaps.visible = TRUE
//ELSE
//   md_operaciones.m_mantenimientos.m_tablasbsicas.m_mantenimientodetaps.visible = FALSE
//END IF




OPEN(w_shared)


w_operaciones.visible=true

if gb_bdi = true then
	this.setmicrohelp("Activando M$$HEX1$$f300$$ENDHEX$$dulo Gr$$HEX1$$e100$$ENDHEX$$fico")
end if

	
//JME 18/06/09
// Verifica que el tratamiento de los ficheros STR est$$HEX2$$e1002000$$ENDHEX$$activo (con el correspondiente 
// tratamiento de disponibilidades e indisponibilidades).

SELECT NVL(VALOR, 1)
  INTO :gi_ind_tratar_disp_indisp
  FROM GI_PARAMETROS
 WHERE DESCRIPCION = 'INDICADOR FICHEROS STR'; 

IF sqlca.sqlcode < 0 then 
	gi_ind_tratar_disp_indisp = 1
end if

if gi_ind_tratar_disp_indisp = 0 then 
	
	md_operaciones.m_incidencias1.m_generarreportesstr.enabled=false
	md_operaciones.m_incidencias1.m_generarreportesstr.visible=false
	md_operaciones.m_incidencias1.m_generarreportesstr.ToolbarItemVisible = false
	
end if
//Fin JME


// JME 15/12/2009
IF	fg_verifica_parametro("Indisponibilidades activas") = FALSE THEN

	md_operaciones.m_incidencias1.m_cambiodeoperatividaddeactivos.enabled=false
	md_operaciones.m_incidencias1.m_cambiodeoperatividaddeactivos.visible=false
	md_operaciones.m_incidencias1.m_cambiodeoperatividaddeactivos.ToolbarItemVisible = false

	md_operaciones.m_incidencias1.m_generarreportesstr.enabled=false
	md_operaciones.m_incidencias1.m_generarreportesstr.visible=false
	md_operaciones.m_incidencias1.m_generarreportesstr.ToolbarItemVisible = false
		
	//AHM (22/03/2010) La generaci$$HEX1$$f300$$ENDHEX$$n de indices es visible
	md_operaciones.m_moduloCompensaciones.enabled=false
	md_operaciones.m_moduloCompensaciones.visible=false
	md_operaciones.m_moduloCompensaciones.ToolbarItemVisible = false
	md_operaciones.m_moduloCompensaciones.m_configuraci$$HEX1$$f300$$ENDHEX$$npar$$HEX1$$e100$$ENDHEX$$metros.ToolbarItemVisible = false
	md_operaciones.m_moduloCompensaciones.m_indicadoresymetas.ToolbarItemVisible = false
	
END IF



//JME 19/06/09
// Determinar las subestaciones en SGD_INSTALACION_AT
n_subestacionesdeactivos lnv_subestacionesactivos
lnv_subestacionesactivos = create n_subestacionesdeactivos
DESTROY lnv_subestacionesactivos
//Fin JME

//AHM (02/07/2010) ASUR 645615
IF	fg_verifica_parametro("OCEN") = FALSE THEN
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_ocenservicioejecutor.enabled=FALSE
	md_operaciones.m_mantenimientos.m_tablasbsicas.m_ocenservicioejecutor.visible=FALSE
END IF
end event

event closequery;//close(w_shared)
//close(w_arranque_operaciones)
// EVITA QUE SE CIERRE MIENTRAS NO SE LEVANTE TODO
if not gb_se_puede_cerrar then return 1
end event

event close;

if isvalid(gu_rf) then
	destroy gu_rf
end if

if isvalid(gu_rf_servidor_operacion) then
	destroy gu_rf_servidor_operacion
end if
close(w_shared)

destroy gu_comunic
destroy gu_comunic1
destroy gu_comunic2


end event

on w_operaciones.create
if this.MenuName = "md_operaciones" then this.MenuID = create md_operaciones
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_operaciones.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event timer;datetime ld_fecha
long ll_valor_anterior,ll_valor_anterior2

if not gb_se_puede_cerrar then 
	gb_se_puede_cerrar = true
	md_operaciones.m_archivo.m_salir.enabled = true
	timer(900) // salta el timer en 15 minutos
end if

ll_valor_anterior=sqlca.sqlcode
select sysdate into :ld_fecha from dual;
sqlca.sqlcode=ll_valor_anterior

end event

event resize;if isvalid(w_operaciones) then
	open(w_operaciones)
	w_operaciones.setredraw(true)
end if
end event

type mdi_1 from mdiclient within w_operaciones
long BackColor=67108864
end type


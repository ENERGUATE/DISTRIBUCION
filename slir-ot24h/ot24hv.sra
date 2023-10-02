HA$PBExportHeader$ot24hv.sra
forward
global type ot24hv from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
transaction sqlca2
transaction sqlca3
transaction sqlca4
integer menu
string g_nombre
string g_cod_usuario
string g_credenciales
string g_version
String tituloDBSGI 
String tituloDBOT 

string direccion_proyecto  //direccion del proyecto

long param_nro_incidencia

string ls_path

datetime devuelve    /*fecha de resolucion global*/

long cod_depto, cod_muni, cod_local, cod_oficina, cod_region
string nom_depto, nom_muni, nom_local, oficina, nom_region

int li_nro_aviso

boolean DESOT24H


//TEST

boolean double_click
boolean gb_bdi
boolean gb_entre = FALSE
boolean gb_hay_sesion
boolean gb_mantenimiento = false
boolean gb_mensaje = false
boolean gb_normalizacion = false
boolean gb_obs_obligatorias = false
boolean gb_ole = false
boolean gb_openbdi = false
boolean gb_operaciones = false
boolean gb_operaciones_inst = false
boolean gb_operador_cmd
boolean gb_red_trifasica
boolean gb_scada = false
boolean gb_sgt=false
boolean gb_usuario_mant = false
boolean gb_usuario_tele
boolean gi_entre
boolean gb_se_puede_cerrar = false
boolean gl_nro_aviso_visible
boolean l_grabo_inc
boolean l_incid
boolean saliendo=false
Boolean gb_usuario_correcto = true
Constant long gl_cant_dias = 15
datawindow ddw_alcance_aviso_t_shared
datawindow ddw_causa_incidencia_t_shared
datawindow ddw_centro_shared
datawindow ddw_cmd_shared
datawindow ddw_estado_aviso_t_shared
datawindow ddw_estado_incidencia_t_shared
datawindow ddw_estado_mantenimiento_t_shared
datawindow ddw_estados_descargo_t_shared
datawindow ddw_int_horario_shared
datawindow ddw_material_averiado_shared
datawindow ddw_mesa_shared
datawindow ddw_prioridad_t_shared
datawindow ddw_tension_incidencia_t_shared
datawindow ddw_tension_incidencia_total // ANG
datawindow ddw_tipo_aviso_t_shared
datawindow ddw_tipo_incidencia_t_shared
datawindow ddw_tipo_ins_t_shared
datetime gd_fecha_revision
datetime gd_ultima_inf // Es la $$HEX1$$fa00$$ENDHEX$$ltima informaci$$HEX1$$f300$$ENDHEX$$n que se dispone on-line en el sistema
dec {2} gdec_borrar  //ANG
dec {2} gdec_med
decimal{0} fgcdec_aviso_alumbrado_publico = 66666666. 
decimal{0} fgcdec_aviso_con_alimentacion = 99999999.    
decimal{0} fgcdec_aviso_de_ayuda  = 77777777.             
decimal{0} fgcdec_aviso_sin_alimentacion = 88888888.
decimal{0} fgcdec_incidencia_de_suministro = 99999998.
decimal{0} fgcdec_instalacion_eliminadas = 99999997.

decimal{0} fgcdec_aviso_de_calidad = 55555555.
decimal{0} fgcdec_aviso_de_calidad_sin_alim = 55555558.
decimal{0} fgcdec_aviso_de_calidad_con_alim = 55555559.

int  fgci_clase_avi_normal=0
int  fgci_clase_avi_ayuda=1
int  fgci_clase_avi_alum_publ=2
int  fgci_clase_avi_calidad=3

int fg_nivel_max_cambio_inst = 1
int fg_padre_centros = 98
int fgci_acceso_cmd = 4
int fgci_acceso_total = 0
int fgci_acceso_puesto = 3
int fgci_alguna_interrupcion_repuesta = 2
int fgci_alta_tension = 1
int fgci_alumbrado_publico = 2
int fgci_anulada = 4
int fgci_aviso_asoc_incidencia = 3
int fgci_aviso_asociado = 3
int fgci_aviso_con_brigada = 2
int fgci_aviso_enviado_brigada = 2
int fgci_aviso_filtro_pendiente = 1
int fgci_aviso_filtro_resuelto = 2
int fgci_aviso_filtro_todos = 0
int fgci_aviso_improcedente = 6
int fgci_aviso_pendiente = 1
int fgci_aviso_reactivado = 4
int fgci_aviso_resuelto = 5
int fgci_ayuda = 1
int fgci_baja_tension = 3
int fgci_cod_calle_ficticia = 9999
int fgci_descargo_activado= 6
int fgci_descargo_actualizado_BDI = 10
int fgci_descargo_agrupado = 11
int fgci_descargo_anulado = 13
int fgci_descargo_aplazado= 16
int fgci_descargo_aprobado = 3
int fgci_descargo_asociado_BDI = 14
int fgci_descargo_definido = 1
int fgci_descargo_finalizado= 8
int fgci_descargo_modificado = 5
int fgci_descargo_no_activado = 7
int fgci_descargo_ordinario = 1
int fgci_descargo_pendiente_BDI = 9
int fgci_descargo_pendiente_pta_servicio = 12
int fgci_descargo_rechazado = 4
int fgci_descargo_rechazado_BDI = 15
int fgci_descargo_solicitado= 2
int fgci_disponible = 1
int fgci_en_turno = 1
int fgci_entrada = 2
int fgci_entrada_salida = 3
int fgci_estado_anulado = 11
int fgci_existen_registro = 0
int fgci_grabar = 0
int fgci_hasta_para_resolucion = 99
int fgci_hasta_serv_repuesto = 99
int fgci_hasta_sr = 99
int fgci_incidencia_calidad=3
int fgci_incidencia_de_suministro = 1
int fgci_incidencia_con_interrupcion=2
int fgci_incidencia_sin_interrupcion=3
int fgci_incidencia_de_instalacion = 4
int fgci_incidencia_causa_localizada = 3
int fgci_incidencia_cerrada=7
int fgci_incidencia_en_reposicion = 3
int fgci_incidencia_env_mto = 8
int fgci_incidencia_enviado_brigada = 2
int fgci_incidencia_imprevista = 1
int fgci_incidencia_mant_averia_localizada = 3
int fgci_incidencia_mant_enviado_brigada = 2
int fgci_incidencia_mant_para_resolucion = 5
int fgci_incidencia_mant_reparando = 4
int fgci_incidencia_mant_resuelta_mant= 6
int fgci_incidencia_mant_sin_atender = 1
int fgci_incidencia_para_resolucion = 5
int fgci_incidencia_pendiente = 1
int fgci_incidencia_pte_explotacion = 10
int fgci_incidencia_programada = 2
int fgci_incidencia_reenganche = 5
int fgci_incidencia_resuelta = 5
int fgci_incidencia_scada = 4
int fgci_incidencia_servicio_repuesto = 4
int fgci_incidencia_ot_finalizada = 4
int fgci_incidencia_trabajando = 3
int fgci_incidencia_alum_pub = 6
int fgci_incidencia_obligada = 5 
int fgci_media_tension = 2
int fgci_ninguna_interrupcion_repuesta = 1
int fgci_ninguna_interrupcion_seleccionada = 0
int fgci_nivel_hasta = 3
int fgci_no_disponible = 0
int fgci_num_puerta_ficticio = 9999
int fgci_ordenar_est_aviso = 9
int fgci_ordenar_fecha_res = 7
int fgci_ordenar_nro_aviso = 10
int fgci_ordenar_nro_instalacion = 6
int fgci_ordenar_por_cli_imp = 4
int fgci_ordenar_por_direccion = 3
int fgci_ordenar_por_duracion = 1
int fgci_ordenar_por_peligro = 5
int fgci_ordenar_por_prioridad = 2
int fgci_ot_anulada = 4
int fgci_ot_pendiente = 1
int fgci_ot_resuelta = 3
int fgci_ot_trabajando = 2


int fgci_prioridad_baja = 21
int fgci_prioridad_media = 11
int fgci_resuelve_mantenimiento = 1
int fgci_salida = 5
int fgci_sin_alimentacion = 0
int fgci_sin_seleccionar = 99
int fgci_tipo_aco_at = 10
int fgci_tipo_aco_bt = 12
int fgci_tipo_aco_mt = 11
int fgci_tipo_caja_mt = 9
int fgci_tipo_caja_bt = 6
int fgci_tipo_direccion = 0
int fgci_tipo_estacion = 1
int fgci_tipo_estacion_aa = 8
int fgci_tipo_salida_de_estacion = 2
int fgci_tipo_subestacion_mm = 3

// TIPOS DE INSTALACION//

int fgci_tipo_subestacion = 3
int fgci_tipo_salida_mt = 4
int fgci_tipo_ct = 5
int fgci_tipo_transformador = 6
int fgci_tipo_salida_de_baja = 7
int fgci_tipo_acometida = 8
int fgci_tipo_centro_reflexion = 9
int fgci_tipo_tramo = 10
int fgci_tipo_subramal = 11

// TIPOS DE INSTALACION_AT//
int fgci_tipo_subestacion_at= 1
int fgci_tipo_salida_at = 2
int fgci_tipo_barra_at= 3
int fgci_tipo_celda_at= 4
int fgci_tipo_interruptor_at= 5
int fgci_tipo_int_cabecera_at= 6
int fgci_tipo_trafo_at= 7
int fgci_tipo_banco_at= 8
int fgci_tipo_trafo_pot= 9
int fgci_tipo_subestacion_mt= 10
int fgci_tipo_sal_mt = 11
int fgci_tipo_barra_mt= 12
int fgci_tipo_celda_mt= 13
int fgci_tipo_interruptor_mt= 14
int fgci_tipo_int_cabecera_mt= 15
int fgci_tipo_trafo_mt= 16
int fgci_tipo_banco_mt= 17
int fgci_tipo_parque_at= 20
int fgci_tipo_parque_mt= 21
int fgci_tipo_seccionador_at = 22
int fgci_tipo_seccionador_mt = 23
int fgci_tipo_activos = 24
int fgci_tipo_grupos_activos = 25
int fgci_tipo_condensadores = 26
int fgci_tipo_condensador = 26



///////////////////////////////

int fgci_todas_interrupcion_repuesta = 3
int fgci_todos = 0
int fgci_trabajo_anulado = 18
int fgci_trabajo_aprobado = 6
int fgci_trabajo_definido = 1
int fgci_trabajo_pendiente_pta_servicio = 7
int fgci_trabajo_rechazado_alfa = 17
int fgci_trabajo_rechazado_bdi = 5
int fgci_trabajo_solicitado= 4
int fgci_trabajo_pto_servicio= 12
int fgci_usuario_alta = 1
int fgci_usuario_baja = 3
int fgci_usuario_media = 2
int gi_acometida_sin_alim = 0
int gi_bandera
int gi_cod_departamento   // Codigo de departamento
int gi_cod_provincia         // Codigo de provincia
int gi_con_material_averiado
int gi_cont_idle = 0
int gi_est_mant
int gi_est_oper
int gi_fila_actual
int gi_frontera_tipo_inst = 4
int gi_incidencia_suministro
int gi_nro_centro // Centro del usuario conectado
int gi_nro_centro_Dep
int gi_nro_cmd    // CMD del usuario conectado
int gi_nro_cmd_dep
int gi_nro_puesto // Puesto del usuario Conectado
int gi_nro_puesto_dep
int gi_perfil
int gi_pais
//int gi_perfil_ok[16]
int gi_resuelve_mant
int gi_tension_nivel_max
int gi_tension_nivel_min
int gi_ultima_posicion 
int gi_usuario_mant = 2
int gi_usuario_oper = 1
//int gi_usuario_perfil[16]
integer gi_grid[6,3]
long class_mem
long gl_cod_localidad         // Codigo de Localidad
long gl_cod_municipio         // Codigo de Municipio
long gl_codigo
long gl_instalacion_afectada
long gl_start
long gl_tipo
long parmnum1
long parnum1
long parnum2
long parnum3
long parnum4
long parnum5
n_msg_std_sgi gnv_msg
s_cliente	cli
s_direccion_cliente dir
s_inf_nis g_inf_nis
string class_id
string fgcs_duplicador_ficticio = "F"
string fgcs_nom_desc_activado = "AC"
string fgcs_nom_desc_improcedente = "IM"
string fgcs_nom_desc_modificado = "MO"
string fgcs_nom_desc_rechazado = "RE"
string fgcs_nom_desc_resuelto = "RS"
string fgcs_nom_desc_solicitado = "SO"
string fgcs_nomenclatura_an = "AN"
string fgcs_nomenclatura_cl = "CL"
string fgcs_nomenclatura_eb = "EB"
string fgcs_nomenclatura_er = "ER"
string fgcs_nomenclatura_pr = "PR"
string fgcs_nomenclatura_pt = "PT"
string fgcs_nomenclatura_rs = "RS"
string fgcs_nomenclatura_sr = "SR"
string fgcs_nomenclatura_st = "ST"
string fgcs_palabra_brigada = "Brigada"
string gs_blanco = '16777215'
string gs_comando
string gs_departamento  
string gs_fase_a
string gs_fase_b
string gs_fase_c
// Modificaci$$HEX1$$f300$$ENDHEX$$n por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//string gs_gris = '12632256'
string gs_gris = '81324524'
// Fin. Sgo.
string gs_localidad       
string gs_municipio       
string gs_padre_response
string gs_programa
string gs_programa_principal
string gs_provincia        
string gs_response_activa
string gs_response_activa_ante
string gs_usuario
string gs_ventana_nombre 
string parmstr1
string parmstr2
string parmstr3
string parmstr4
string parmstr5
string parmstr6
string parmstr7
string parmstr8
string parmstr9

u_enlace onis
u_generico_comunicaciones gu_comunic
u_generico_comunicaciones gu_comunic1
u_generico_comunicaciones gu_comunic2
u_inc_2030_nu_filtro_incidencia iu_inc_2030_nu
u_transaction gnu_u_transaction
rf gu_rf
rf_servidor_operacion  gu_rf_servidor_operacion
u_interface gu_operaciones
u_perfil  gu_perfiles
u_control_v_incidencias gu_control_v_incidencias
w_operaciones iw_mdi
w_prin gw_w_prin
window w_lista

int fgci_con_acometidas
s_print str_print
long gl_tipo_aviso

w_2301_hist_inc_desc gw_2301_hist_inc
w_2301_hist_inc_desc gw_2301_hist_desc

////// PARA COMPILACION DE LIBRERIAS DE BDG
window w_bdg
w_4001_estadisticas_zonas_geografica gw_incidencias_relevantes
int fgci_con_operaciones
int fgci_con_scada
boolean lb_avance
////////////////////////

boolean gb_potencia
window w_arranque_bdg,w_arranque_bdg_ext

//////  Objeto de Bloqueos
int fgci_bloqueo_incidencia= 1
int fgci_bloqueo_ot = 2
int fgci_bloqueo_descargo = 3
int fgci_bloqueo_disponibilidad = 3


int fgci_bloq_inc_suministro = 1
int fgci_bloq_cam_alim = 2
int fgci_bloq_asig_alim = 3
int fgci_bloq_ot_suministro = 4
int fgci_bloq_av_improc = 5
int fgci_bloq_al_red_real = 6
int fgci_bloq_asoc_manual = 7
int fgci_bloq_datos_aviso = 8
int fgci_bloq_cambio_salidas_mt = 9
int fgci_bloq_reactivar_avisos = 10
int fgci_bloq_desasociar_avisos = 11

int fgci_cod_causa_desconocida = 49
int fgci_cod_fam_causa_desconocida = 5

////// log de comunicaciones
boolean gb_log_comunica = false
boolean gb_log_avisos = false
////// 
int fgci_cod_motivo_otros = 1

// Unificadas Tipos de Calles 2002 AMR
boolean gb_tipos_de_via
int gi_clientes_afec
string gs_ventana_llamante

///////////////////////////////////////////
boolean gb_inc_antig  //** JPE V2002 20020716
integer gi_dias_antiguedad  //** JPE V2002 20020716

boolean gb_tabla_decision

// Variable que controla un posible error a la hora de cargar
// iconos en el $$HEX1$$e100$$ENDHEX$$rbol de instalaciones. Se emplea para
// mostrar el mensaje una $$HEX1$$fa00$$ENDHEX$$nica vez (LFE)
Boolean gb_mensaje_instalac_error = FALSE

/// DEFINICION DE Codigos de Instalacion CI
int gi_ci_subestac
int gi_ci_linea_mt
int gi_ci_centroref
int gi_ci_ct
int gi_ci_trafo_esq
int gi_ci_trafo
int gi_ci_linea_at

//AHM(12/05/2008)
int	gi_traduccion

//AHM (02/12/2008)

//TDA - EDM-11
string gs_version = '09/03/2018'

//JME 18/06/09
int gi_ind_tratar_disp_indisp = 1

//AHM windows XP (18/02/2010)
u_interface_rf		gu_operacionSgi

//AHM Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
boolean		gb_interfaseOsgm


/*INI.FFB. DDAG-5358 28/07/16 */
long gl_nro_ot
/*FIN.FFB. DDAG-5358 28/07/16 */

//2018  Variable para el llenado de la tabla registros_geo-avisos de ayuda
long aux_coddepto
long aux_codmun
long aux_codloc
long aux_codprov

//2019 variable auxiliar para llenar Historicos

long auxiliar_nro_incidencia_historico

boolean estamos_historicos=false  ////Fase 4 Ot24h 08/01/2019 Nos dira si estamos en historicos o no

//2019 variable para imagenes que almacena el path original del proyecto
String pathOriginal



end variables

global type ot24hv from application
string appname = "ot24hv"
end type
global ot24hv ot24hv

type prototypes
FUNCTION long GetCurrentDirectoryA( long length , ref string path) LIBRARY "KERNEL32"
FUNCTION BOOLEAN MoveFileA(STRING oldfile, STRING newfile) LIBRARY "KERNEL32.DLL"
FUNCTION long GetShortPathNameA(string longfile, ref string shortfile, long cash) LIBRARY "KERNEL32.DLL"
FUNCTION boolean SetCurrentDirectoryA(ref string cdir) LIBRARY "kernel32.dll"

//boolean DESOT24H

//TEST
Function long SetWindowLong (long hwnd,int nIndex, long dwNewLong) Library "user32.dll"
Function long SendMessage  ( long hw, long  wMsg ,  int wParam ,long lParam)  Library "user32.dll" Alias for "SendMessageA"
Function long FindWindow  ( string lpClassName ,  string lpWindowName ) Library "user32.dll" Alias for"FindWindowA;Ansi"
Function long EnableWindow (long hw ,  Long ena)  Library "user32.dll"
Function long SetWindowPos (long hw, long hWndInsertAfter,long xx,long yy,long cx,long cy,long wFlags) Library "user32.dll"
Function long GetWindow   (long hw,long  wCmd )  Library "user32.dll"
Function long ShowWindow  (long hw, long  nCmdShow )  Library "user32.dll"
Function long MoveWindow  ( long  hw, long  xx , long yy,  long nWidth, long nHeight , long bRepain)  Library "user32.dll"
Function long SetWindowTextA  (long hw, String Titulo) Library "user32.dll" alias for "SetWindowTextA;Ansi"
FUNCTION long GetWindowLongA(ulong whand, int index) LIBRARY "user32.dll"
Function long SetParent (long WndChild , long  hWndNewParent ) Library  "user32.dll"

FUNCTION int  muestraventana (REF string titulo,int muestra, int tamx, int tamy, int x, int y)  LIBRARY  "ventanax.dll" alias for "muestraventana;Ansi"


FUNCTION boolean sndPlaySoundA (string SoundName, uint Flags) LIBRARY "WINMM.DLL" alias for "sndPlaySoundA;Ansi"
FUNCTION uint waveOutGetNumDevs () LIBRARY "WINMM.DLL"

end prototypes

type variables
String DBMSOT, LogPassOT, ServerNameOT, LogIdOT , DBParmOT
String DBMSSGI, LogPassSGI, ServerNameSGI, LogIdSGI, DBParmSGI
String DBMSSGD, LogPassSGD, ServerNameSGD, LogIdSGD, DBParmSGD
Boolean AutoCommitOT, AutoCommitSGI, AutoCommitSGD

Boolean id_alarmas_levantada = false




end variables

forward prototypes
public subroutine f_db_connection ()
public function integer fw_operacion ()
end prototypes

public subroutine f_db_connection ();sqlca2= CREATE transaction
sqlca4= CREATE transaction

//DESOT24H = (String(ProfileString("OT24H.INI", "databaseOT24hDES", "DESOT24H", "OT24H")) ="true")

//if  DESOT24H then 
//	DBMSOT = ProfileString("OT24H.INI", "databaseOT24hDES", "DBMS", "OT24H")
//	LogPassOT = ProfileString("OT24H.INI", "databaseOT24hDES", "LogPass", "OT24H")
//	ServerNameOT = ProfileString("OT24H.INI", "databaseOT24hDES", "ServerName", "OT24H")
//	LogIdOT = ProfileString("OT24H.INI", "databaseOT24hDES", "LogId", "OT24H")
//	AutoCommitOT = (String(ProfileString("OT24H.INI", "databaseOT24hDES", "Autocommit", "OT24H")) ="true")
//	DBParmOT = ProfileString("OT24H.INI", "databaseOT24hDES", "DBParm", "OT24H")
//else
	DBMSOT = ProfileString("OT24H.INI", "databaseOT24H", "DBMS", "OT24H")
	LogPassOT = ProfileString("OT24H.INI", "databaseOT24H", "LogPass", "OT24H")
	ServerNameOT = ProfileString("OT24H.INI", "databaseOT24H", "ServerName", "OT24H")
	LogIdOT = ProfileString("OT24H.INI", "databaseOT24H", "LogId", "OT24H")
	AutoCommitOT = (String(ProfileString("OT24H.INI", "databaseOT24H", "Autocommit", "OT24H")) ="true")
	DBParmOT = ProfileString("OT24H.INI", "databaseOT24H", "DBParm", "OT24H")
//end if

DBMSSGI = ProfileString("OT24H.INI", "databaseSGI", "DBMS", "OT24H")
LogPassSGI = ProfileString("OT24H.INI", "databaseSGI", "LogPass", "OT24H")
ServerNameSGI = ProfileString("OT24H.INI", "databaseSGI", "ServerName", "OT24H")
LogIdSGI = ProfileString("OT24H.INI", "databaseSGI", "LogId", "OT24H")
AutoCommitSGI = (String(ProfileString("OT24H.INI", "databaseSGI", "Autocommit", "OT24H"))="true")
DBParmSGI = ProfileString("OT24H.INI", "databaseSGI", "DBParm", "OT24H")

//HESPINOZA
DBMSSGD = ProfileString("OT24H.INI", "databaseSGD", "DBMS", "OT24H")
LogPassSGD = ProfileString("OT24H.INI", "databaseSGD", "LogPass", "OT24H")
ServerNameSGD = ProfileString("OT24H.INI", "databaseSGD", "ServerName", "OT24H")
LogIdSGD = ProfileString("OT24H.INI", "databaseSGD", "LogId", "OT24H")
AutoCommitSGD = (String(ProfileString("OT24H.INI", "databaseSGD", "Autocommit", "OT24H"))="true")
DBParmSGD = ProfileString("OT24H.INI", "databaseSGD", "DBParm", "OT24H")


////// Profile GID01E
SQLCA.DBMS = DBMSSGI
SQLCA.LogPass = LogPassSGI
SQLCA.ServerName = ServerNameSGI
SQLCA.LogId = LogIdSGI
SQLCA.AutoCommit = AutoCommitSGI
SQLCA.DBParm = DBParmSGI

////Profile OT24H
SQLCA2.DBMS = DBMSOT
SQLCA2.LogPass = LogPassOT
SQLCA2.ServerName = ServerNameOT
SQLCA2.LogId = LogIdOt
SQLCA2.AutoCommit = AutoCommitOt
SQLCA2.DBParm = DBParmOT

////Profile SGD
SQLCA4.DBMS = DBMSSGD
SQLCA4.LogPass = LogPassSGD
SQLCA4.ServerName = ServerNameSGD
SQLCA4.LogId = LogIdSGD
SQLCA4.AutoCommit = AutoCommitSGD
SQLCA4.DBParm = DBParmSGD


tituloDBSGI =  ServerNameSGI
tituloDBOT =   ServerNameOT

connect using sqlca;
connect using sqlca2;
connect using sqlca4;

if sqlca4.SQLCode = 0 then
//  MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Conexi$$HEX1$$f300$$ENDHEX$$n establecida a la B.D SGDCONEC.WORLD ")
elseif sqlca4.SQLCode = -1 then
//   MessageBox("Error", "No hay conexion a la B.D. SGDCONEC.WORLD" + sqlca.SQLErrText  )
end if

end subroutine

public function integer fw_operacion ();int li_op_inst

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

return 0
end function

on ot24hv.create
appname="ot24hv"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ot24hv.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;////////////////////////////////////////////////////////
//     Application Open Script
//             Selects start-up file according to Operating System
//             Populates sqlca from start-up file
//             Connects to DB (if uncommented)
//             Opens frame window
////////////////////////////////////////////////////////

openwithparm(w_msg,"Iniciando SLIR...")

environment    lenv_env                                // holds environment information
string         ls_startupfile          // holds name of start-up file
string acceso
string lo_version

//Agregado quitar mas tarde/
gu_comunic= create u_generico_comunicaciones
gu_comunic1 = create u_generico_comunicaciones
gu_comunic2 = create u_generico_comunicaciones
///////////////////////////////////////////////////////////


// Get the environment information
if ( GetEnvironment(lenv_env) <> 1 ) then
       MessageBox( "Application: Open", &
               "Unable to get environment information.~nHalting ..." )
       halt
end if

// Select start-up file by operating system
choose case lenv_env.ostype
       case windows!, windowsnt!
               ls_startupfile = "pb.ini"
               if ( lenv_env.charset = charsetunicode! ) then
                  ls_startupfile = "pbu.ini"
               end if
       case sol2!, aix!, hpux!
               ls_startupfile = ".pb.ini"
       case macintosh!
               ls_startupfile = "PowerBuilder Preferences"
       case else
               MessageBox( "Application: Open", &
                       "Unrecognized operating system.~nHalting ..." )
               halt
end choose

/**versi$$HEX1$$f300$$ENDHEX$$n*/
/*15/08/2013*/

//g_version="2013.11"

//g_version="2014.04"

//g_version="2015.01"

//g_version="2015.07b"

g_version="2016.08"

//TDA-EDM-14
//g_version="2018.03"


/**fin versi$$HEX1$$f300$$ENDHEX$$n***/



//variable de conexi$$HEX1$$f300$$ENDHEX$$n a sgpdro9

//TDA--EDM14
//sqlca2= CREATE transaction
//TDA--EDM14
datetime hoy

						
//directorio actual


integer li_FileNum
string ls_Emp_Input
long ll_FLength


long ll_ret

ls_path = Space(250)
ll_ret = GetCurrentDirectoryA(250, ls_path)
IF ll_ret > 0 THEN
   ls_path = Left(ls_path,ll_ret)
ELSE
   Messagebox("Error","Err GetCurrentDirectory " + String(ll_ret))
END IF

/*******/
							
							


//n$$HEX1$$fa00$$ENDHEX$$mero de men$$HEX2$$fa002000$$ENDHEX$$window
menu=0


//TDA-EDM-14
f_db_connection()
gnu_u_transaction = CREATE u_transaction
gnv_msg = CREATE n_msg_std_sgi

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


//TDA--EDM14

// Profile ot24hpro9
////SQLCA.DBMS = "OR8 ORACLE 8.0"
//SQLCA.DBMS = "O90 Oracle9i (9.0.1)"
//SQLCA.LogPass = "VCAYH8H"
////SQLCA.LogPass = "OT24H"
////SQLCA.ServerName = "sgddes9"
//SQLCA.ServerName = "OT9I"
//SQLCA.LogId = "OT24H"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "PBCatalogOwner='OT24H'"

//// Profile GID01E
//SQLCA2.DBMS = "O90 Oracle9i (9.0.1)"
//SQLCA2.LogPass = "G91D0L3"
////SQLCA2.LogPass = "G91D0L3"
//SQLCA2.ServerName = "SGDPRO9"
////SQLCA2.ServerName = "SGDDES9"
//SQLCA2.LogId = "GID01E"
//SQLCA2.AutoCommit = False
//SQLCA2.DBParm = "PBCatalogOwner='GID01E'"

//TDA--EDM14

// Profile GID01E
//SQLCA2.DBMS = "OR8 ORACLE 8.0"
//SQLCA2.LogPass = "gid01e"
//SQLCA2.LogPass = "G91D0L3"
//SQLCA2.ServerName = "SGDPRO9"
//SQLCA2.ServerName = "SGDDES9"
//SQLCA2.LogId = "gid01e"
//SQLCA2.AutoCommit = False
//SQLCA2.DBParm = "PBCatalogOwner='GID01E'"

//
//// Profile ot24hpro9
//SQLCA.DBMS = "OR8 ORACLE 8.0"
//SQLCA.LogPass = "ot24h"
//SQLCA.ServerName = "sgddes9"
//SQLCA.LogId = "ot24h"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "PBCatalogOwner='OT24H'"
//
//
//
//
//// Profile GID01E
//SQLCA2.DBMS = "OR8 ORACLE 8.0"
////SQLCA2.LogPass = "gid01e"
//SQLCA2.LogPass = "G91D0L3"
//SQLCA2.ServerName = "SGDDES9"
//SQLCA2.LogId = "gid01e"
//SQLCA2.AutoCommit = False
//SQLCA2.DBParm = "PBCatalogOwner='GID01E'"
//
//

//TDA--EDM14
//connect using sqlca;
//connect using sqlca2;
//TDA--EDM14

close(w_msg)

if sqlca2.sqlcode <>0 then
     MessageBox ("SLIR--No se puede establecer conexi$$HEX1$$f300$$ENDHEX$$n a  BD ", sqlca2.sqlerrtext)
     return
else
   //  Okay
	
		if sqlca.sqlcode <>0 then
     		MessageBox ("SGI--No se puede establecer conexi$$HEX1$$f300$$ENDHEX$$n a  BD ", sqlca.sqlerrtext)
     		return
		else
			close(w_msg)	
			
			
			/***verificar versi$$HEX1$$f300$$ENDHEX$$n actual*/
			
			select version
			into :lo_version
			from version
			where estado='#ACT14'
			and version=:g_version
			using sqlca2;
			
			if g_version<>lo_version then
				messagebox('ERROR', 'Est$$HEX2$$e1002000$$ENDHEX$$ejecutando una versi$$HEX1$$f300$$ENDHEX$$n de SLIR inv$$HEX1$$e100$$ENDHEX$$lida. LO:'+lo_version+' g:'+g_version)
				halt
			end if
			
			
			open(w_logon)
			
			acceso = Message.StringParm
			
			if acceso="1" then
				
				/*actualizar tabla de usuarios*/
				
					select sysdate
							into :hoy
							from dual
							using sqlca2;
							
							if isnull(hoy) then
								hoy=datetime(today(),now())
							end if
				
				
				
				update usuario
				set lastlogin=:hoy,
				    ensesion=1
				where usuario=:g_cod_usuario
				using sqlca2;
				
				commit using sqlca2;
				
				
				Open (w_genapp_frame)
				
				
			end if
	
		end if  //sqlca2

end if //sqlca

fw_operacion()

//Extrayendo la direccion original
pathOriginal = GetCurrentDirectory()

close(w_msg)
end event

event close;update usuario
	set ensesion=0
	where usuario=:g_cod_usuario
	using sqlca2;
	
	commit using sqlca2;
end event


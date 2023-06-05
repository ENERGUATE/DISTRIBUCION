HA$PBExportHeader$opensgi.sra
$PBExportComments$Inicializaci$$HEX1$$f300$$ENDHEX$$n Apl. y Conexion  a BD.   -TN-
forward
global type opensgi from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
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


end variables

global type opensgi from application
string appname = "opensgi"
end type
global opensgi opensgi

type prototypes
Function long SetWindowLong (long hwnd,int nIndex, long dwNewLong) Library "user32.dll"
Function long SendMessage  ( long hw, long  wMsg ,  int wParam ,long lParam)  Library "user32.dll" Alias for "SendMessageA"
Function long FindWindow  ( string lpClassName ,  string lpWindowName ) Library "user32.dll" Alias for"FindWindowA;Ansi"
PRIVATE FUNCTION int send ( int socket, ref blob buf, int len, int flags ) LIBRARY "wsock32.dll"
FUNCTION int WSAGetLastError (  ) LIBRARY "wsock32.dll"
Function long EnableWindow (long hw ,  Long ena)  Library "user32.dll"
Function long SetWindowPos (long hw, long hWndInsertAfter,long xx,long yy,long cx,long cy,long wFlags) Library "user32.dll"
Function long GetWindow   (long hw,long  wCmd )  Library "user32.dll"
Function long ShowWindow  (long hw, long  nCmdShow )  Library "user32.dll"
Function long MoveWindow  ( long  hw, long  xx , long yy,  long nWidth, long nHeight , long bRepain)  Library "user32.dll"
Function long SetWindowTextA  (long hw, String Titulo) Library "user32.dll" alias for "SetWindowTextA;Ansi"
FUNCTION long GetWindowLongA(ulong whand, int index) LIBRARY "user32.dll"
Function long SetParent (long WndChild , long  hWndNewParent ) Library  "user32.dll"
FUNCTION int  muestraventana (REF string titulo,int muestra, int tamx, int tamy, int x, int y)  LIBRARY  "ventanax.dll" alias for "muestraventana;Ansi"
// Funci$$HEX1$$f300$$ENDHEX$$n incluida para el Registro de los OCX en vista a usarlo a la hora de gene-
// rar un EJECUTABLE.
FUNCTION LONG DllRegisterServer() Library "CTMETR32.OCX"

FUNCTION boolean sndPlaySoundA (string SoundName, uint Flags) LIBRARY "WINMM.DLL" alias for "sndPlaySoundA;Ansi"
FUNCTION uint waveOutGetNumDevs () LIBRARY "WINMM.DLL"
end prototypes

type variables
boolean ib_alarmas_levantanda = false

end variables

event open;string ls_error, ls_bdi, caminox, nula, nombre_ejecutable
// Aplicacion de alarmas de descargos
string ls_ruta_descargos, ls_nombre_descargos
long ll_handle
datetime ldt_fecha_usuario

long ll_hand,ll_valor, ll_handle_emulador
int li_retorno,li_resultado
environment le_env

//*** LSH *** INI *** DDAG-3917 *** 11/09/2015
int li_sesion
//*** LSH *** FIN *** DDAG-3917 *** 11/09/2015

//getenvironment(le_env)

// SE DEBE VERIFICAR EL SISTEMA OPERATIVO YA QUE SOLO SE PUEDE EJECUTAR EN WINDOWS NT O EN 
// WINDOWS 2000

//rodlof
//IF ProfileString("opensgi.ini","EXPLICACION","Depurar","NO") <> 'SI' THEN
//	if isvalid (le_env) then 
//// AHM (14/04/2010) Certificaci$$HEX1$$f300$$ENDHEX$$n windows XP
////		if NOT (le_env.ostype = windowsnt! AND &
////			(le_env.osmajorrevision <= 4 OR (le_env.osmajorrevision = 5 and le_env.osminorrevision= 0))) then
//		if NOT (le_env.ostype = windowsnt! AND &
//			(le_env.osmajorrevision <= 4 OR (le_env.osmajorrevision = 5 and (le_env.osminorrevision = 0 or le_env.osminorrevision =1)))) then
//			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El Sistema Operativo debe ser Windows NT, Windows 2000 o WindowsXP para poder ejecutar la aplicaci$$HEX1$$f300$$ENDHEX$$n")
//			return
//		end if
//	end if
//END IF
//rodlof

gw_w_prin = w_prin
gu_comunic  = create u_generico_comunicaciones
gu_comunic1 = create u_generico_comunicaciones
gu_comunic2 = create u_generico_comunicaciones

// MODIFICADO JCARLOS 23/04/97
// Instanciar la variable global openlink, y configurar 
//guo_OpenLink = CREATE u_OpenLink
//guo_OpenLink.of_Configuracion("USD002GC")
//
////////
gnu_u_transaction = CREATE u_transaction

gnv_msg = CREATE n_msg_std_sgi

gs_programa_principal = "w_operaciones"  //cambiar

//iw_mdi = CREATE w_operaciones

gd_fecha_revision = datetime(today(),now())

//setnull(gw_response_activa)
setnull(gs_response_activa)
// COMENTADO POR ACO ---NO HAY SGI GRAFICO  10/2002
//ls_bdi=ProfileString("opensgi.ini", "SIV_SERVER", "bdi", "no")
//
//if ls_bdi="si" then
//	gb_bdi=true
//// CREAMOS EL OBJETO DE COMUNICACION CON EL ONIS
//	onis=create u_enlace 
//	if not isvalid(onis) then 
//		gnv_msg.f_mensaje("EX16","","",Ok!)
//	else
//		// COMPROBAMOS QUE HAY SOPORTE GRAFICO
//		if onis.ib_hay_bdi=false then // NO HAY SOPORTE GRAFICO
//			gnv_msg.f_mensaje("EX18","","",Ok!)
//			destroy onis
//			return
//		end if
//		
//	 	//li_retorno = onis.of_establece_sesion()	// Con actualizacion de puerto
//	 	li_retorno = onis.of_establece_ses()		//Sin actualizacion de puerto
//
//		if li_retorno > 0 then // COMPROBAMOS LA CONEXION CON EL ONIS
//			setnull(nula)
//			caminox=ProfileString("opensgi.ini","EMULADOR","ruta_servidor_x","0")
//			run(caminox,Minimized!) //EJECUTA EL EMULADOR
//			setpointer(HourGlass!)
//			nombre_ejecutable= ProfileString("opensgi.ini","EMULADOR","nombre_ejecutable","ss")
//			If ProfileString("opensgi.ini","EXTERNALIDAD","ventana_inicio","N") = "S" Then
//				Open(w_arranque_operaciones_ext)
//			else
//				Open(w_arranque_operaciones)
//			end if
//
//			ll_handle_emulador=FindWindow(nula,nombre_ejecutable)
//		   if isvalid(w_operaciones) then  // PULSA ACEPTAR
//				if gu_perfiles.of_acceso_perfil(gi_perfil,"MOD_GRAF","")>1 then // PERFIL OK
//					onis.of_cierra_sesion() // CIERRA LA SESION SIN DISPLAY
//					gb_hay_sesion=false
//					if gb_operaciones = false then
//						SetWindowPos(ll_handle_emulador,0,0,0,0,0,128)
//						if onis.of_abre_ventana()>0 then 
//							onis.of_trata_capa()
//							gb_hay_sesion=true
//							w_operaciones.setmicrohelp("Listo")
//						else 
//							gb_hay_sesion=false
//							onis.of_cierra_sesion() //  NO OPERACIONES Y GRAFICO
//							SendMessage(ll_handle_emulador,16,0,0)
//						end if
//					else
//						SendMessage(ll_handle_emulador,16,0,0)
//						gnv_msg.f_mensaje("EX40","","",Ok!)
//						gb_usuario_correcto = FALSE
//						HALT CLOSE
//					end if
//									
//				else		
//					onis.of_cierra_sesion() // Acceso no permitido por Perfil 
//					SendMessage(ll_handle_emulador,16,0,0)
//					gb_bdi=false
//				end if						
//													
//									
//			else
//				onis.of_cierra_sesion() // Pulsado cancel o error al arrancar
//				SendMessage(ll_handle_emulador,16,0,0)
//			end if
//					
//		else 
//			gnv_msg.f_mensaje("EX17","","",Ok!)
//			gnv_msg.f_mensaje("AX07","","",Ok!)
//			gb_bdi=false	//Solo para el caso de Uruguay
//			If ProfileString("opensgi.ini","EXTERNALIDAD","ventana_inicio","N") = "S" Then
//				Open(w_arranque_operaciones_ext)
//			else
//				Open(w_arranque_operaciones)
//			end if
//
//			//Solo para el caso de Uruguay
//		end if
//	end if
//else
	gb_bdi=false
	If ProfileString("opensgi.ini","EXTERNALIDAD","ventana_inicio","N") = "S" Then
		Open(w_arranque_operaciones_ext)
	else
		Open(w_arranque_operaciones)
	end if
	if isvalid(w_operaciones) then
		md_operaciones.m_archivo.m_salir.enabled = false	
		gu_operaciones = CREATE u_interface
	
		//AHM (17/02/2010) WindowsXP
		gu_operacionSgi = CREATE u_interface_rf
		
		//*** LSH *** INI *** DDAG-3917 *** 11/09/2015
		/* Se parametriza la validacion de sesion de usuario, para que se
		valide el acceso de mas de un mismo usuario*/
		SELECT "VALOR"
		INTO :li_sesion
		FROM "GI_PARAMETROS"
		WHERE "COD_PARAMETRO" = 123;
		
		IF li_sesion = 1 THEN //*** LSH *** *** DDAG-3917 *** 11/09/2015
			li_resultado = gu_operaciones.of_verifica_ip_sgi(ldt_fecha_usuario)
			if li_resultado= 0 then 
				// COMPRUEBA LA IP ---> SI EL USUARIO ESTA EJECUTANDO ALGUN SGI
				gnv_msg.f_mensaje("AG07","","",Ok!)
				//		messagebox("Aviso","Usuario de SGI con sesi$$HEX1$$f300$$ENDHEX$$n abierta")
				gb_usuario_correcto = FALSE
				halt close
			elseif li_resultado = -1 then 
				// COMPRUEBA LA IP ---> SI HAY OTRO SGI EJECUTANDOSE SE SALE
				gnv_msg.f_mensaje("AG08","","",Ok!)
				//		messagebox("Aviso","M$$HEX1$$e100$$ENDHEX$$quina con sesi$$HEX1$$f300$$ENDHEX$$n abierta")
				gb_usuario_correcto = FALSE
				halt close
			end if
		END IF
		//*** LSH *** FIN *** DDAG-3917 *** 11/09/2015
		
		if gb_operaciones = true then
		
			w_operaciones.setmicrohelp("Estableciendo conexi$$HEX1$$f300$$ENDHEX$$n con  S. Operaci$$HEX1$$f300$$ENDHEX$$n")
			gu_rf_servidor_operacion = CREATE rf_servidor_operacion
			w_operaciones.setmicrohelp("Activando Interface con Operaciones")
			
			IF gu_operaciones.of_activa_servidor() = 0 then
				gnv_msg.f_mensaje("EZ03","","",Ok!)
				gb_usuario_correcto = FALSE
				HALT CLOSE
			else
				//AHM(18/02/2010) Windows XP
				gu_operacionSgi.of_activa_servidor() 
				
				gu_rf_servidor_operacion.of_actualiza_icono()
			
				LI_RETORNO = gu_operaciones.comonconexion(handle(w_operaciones),10)
				
				IF LI_RETORNO = 0 then
					gnv_msg.f_mensaje("EZ03","","",Ok!)
					gb_usuario_correcto = FALSE
					HALT CLOSE
				end if
			
				w_operaciones.il_sesion_operacion = gu_rf_servidor_operacion.of_devuelve_sesion()
				gnu_u_transaction.uf_unlock_brigadas_usuario()
				w_operaciones.setmicrohelp("Estableciendo conexi$$HEX1$$f300$$ENDHEX$$n con  Conectividad")
				 
			end if
		else // SI NO HAY OPERACIONES TAMBIEN HAY QUE LEVANTAR LAS COMUNICACIONES DEL SGI
			if gu_operaciones.of_activa_servidor() = 0 then
				gnv_msg.f_mensaje("EZ03","","",Ok!)
				gb_usuario_correcto = FALSE
				HALT CLOSE
			end if
			if gu_operaciones.comonconexion(handle(w_operaciones),10) <> 1 then
				gnv_msg.f_mensaje("EZ03","","",Ok!)
				gb_usuario_correcto = FALSE
				HALT CLOSE
			end if
		
		end if
		
		gu_rf = CREATE rf
		gu_rf.of_actualiza_icono() 

		IF li_sesion = 1 THEN //*** LSH *** *** DDAG-3917 *** 11/09/2015
			if gu_operaciones.of_actualiza_registro_usuario(ldt_fecha_usuario)	= 0 then 
				gnu_u_transaction.uf_rollback()
				gnv_msg.f_mensaje("AG07","","",Ok!)
				//	messagebox("Aviso","Usuario de SGI con sesi$$HEX1$$f300$$ENDHEX$$n abierta")
				destroy gu_operaciones
				
				//AHM (18/02/2010) Windowss XP
				DESTROY gu_operacionSgi
				
				gb_usuario_correcto = FALSE
				halt close
				return 
			else
		
				if isvalid(gnu_u_transaction) AND gb_usuario_correcto = TRUE then
					gnu_u_transaction.uf_commit()
					gnu_u_transaction.uf_desbloquea_av_usuario()
					gnu_u_transaction.uf_unlock_brigadas_usuario()
					// BORRAMOS LOS REGISTROS CORRESPONDIENTES A ESA IP
					gu_operaciones.of_borra_ip(-1)
				end if
			end if
		END IF //*** LSH *** *** DDAG-3917 *** 11/09/2015

		// Compruebo que no haya ninguna aplicacion de alarmas levantada
		setnull(nula)
		ls_nombre_descargos = ProfileString("opensgi.ini","DESCARGOS","nombre_descargo","0")
		ll_handle = FindWindow(nula,ls_nombre_descargos)
		IF ll_handle > 0 THEN
			ib_alarmas_levantanda = true
			md_operaciones.m_archivo.m_salir.enabled = true
			gb_se_puede_cerrar = true
		ELSE	
			md_operaciones.m_archivo.m_salir.enabled = false
			timer(5,w_operaciones)
			ls_ruta_descargos = ProfileString("opensgi.ini","DESCARGOS","ruta_descargos","0")
			ls_ruta_descargos = ls_ruta_descargos + ' SGI'
			run(ls_ruta_descargos,Minimized!)
			w_operaciones.setfocus()
		END IF

		//AHM(12/05/2008)
		//Captura del par$$HEX1$$e100$$ENDHEX$$metro que indica si se debe traducir
		SELECT valor
		INTO   :gi_traduccion
		FROM	 gi_parametros
		WHERE  cod_parametro = 109;

		w_operaciones.setmicrohelp("Ready")
	end if	
//end if


//JME 18/06/09
// Verifica que el tratamiento de los ficheros STR est$$HEX2$$e1002000$$ENDHEX$$activo con el tratamiento de disponibilidades 
// e indisponibilidades. 

//	SELECT NVL(VALOR, 1)
//	  INTO :gl_ind_tratar_disp_indisp
//	  FROM GI_PARAMETROS
//	 WHERE COD_PARAMETRO = 'INDICADOR FICHEROS STR'; 



//AHM (28/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
gb_interfaseOsgm = fg_verifica_parametro("OSGM ACTIVO")
end event

event systemerror;integer li_filenum
long ll_handle
string ls_nombre_descargos, nula


li_filenum = fileopen("C:\SYSTEM.LOG",LineMode!,Write!,LockReadWrite!,Append!)

filewrite(li_filenum,"Fecha: " + String(Today( ), "dd/mm/yyyy hh:mm:ss"))
filewrite(li_filenum,"Usuario/Clave: " + sqlca.logid + "/" + sqlca.logpass + "   DataBase/ServerName: " + sqlca.database + "/" + sqlca.servername)
filewrite(li_filenum,"Error: " + error.text)
filewrite(li_filenum,"Menu: " + error.windowmenu)
filewrite(li_filenum,"Objeto: " + error.object)
filewrite(li_filenum,"Evento: " + error.objectevent)
filewrite(li_filenum,"Linea: " + string(error.line))
filewrite(li_filenum,"********")
filewrite(li_filenum,"********")
filewrite(li_filenum,"********")
fileclose(li_filenum)

messagebox("Error del Sistema","Ha ocurrido un error inesperado en el Sistema- ~n"+error.text+"~nVentana : "+error.windowmenu+"~nObject :"+error.object+"~nEvento : "+error.objectevent+"~nlinea :"+string(error.line))

rollback;

IF NOT (ib_alarmas_levantanda) THEN
	setnull(nula)
	ls_nombre_descargos = ProfileString("opensgi.ini","DESCARGOS","nombre_descargo","0")
	ll_handle = FindWindow(nula,ls_nombre_descargos)
	SendMessage(ll_handle,16,0,0)
END IF

if isvalid(gu_operaciones) then
	destroy gu_operaciones
end if

//AHM (18/02/2010) Windowss XP
IF isValid(gu_operacionSgi) THEN
	DESTROY gu_operacionSgi
END IF

if isvalid(gu_rf_Servidor_operacion) then
	destroy gu_rf_servidor_operacion
end if
if isvalid(gu_rf) then
	destroy gu_rf
end if
if isvalid(onis) then
	if onis.trabajo>0 then
		onis.of_sal_trabajo()
	end if
	onis.of_cierra_ventana()
	destroy onis
end if
if isvalid(gu_perfiles) then 
		destroy gu_perfiles
end if

if isvalid(gnu_u_transaction) AND gb_usuario_correcto = TRUE then 
	gnu_u_transaction.uf_unlock_brigadas_usuario()
	gnu_u_transaction.uf_desbloquea_av_usuario()
	destroy gnu_u_transaction
end if

halt close;

end event

event close;long ll_handle
string ls_nombre_descargos, nula

IF NOT (ib_alarmas_levantanda) THEN
	setnull(nula)
	ls_nombre_descargos = ProfileString("opensgi.ini","DESCARGOS","nombre_descargo","0")
	ll_handle = FindWindow(nula,ls_nombre_descargos)
	SendMessage(ll_handle,16,0,0)
END IF

if gb_entre then
RollBack;
Disconnect;
end if

// Destruyo los objetos creados en 
// el open de la aplicaci$$HEX1$$f300$$ENDHEX$$n.

DESTROY gu_comunic  
DESTROY gu_comunic1 
DESTROY gu_comunic2 

DESTROY gnv_msg 

if isvalid(gu_operaciones) then
	destroy gu_operaciones
end if
//AHM (18/02/2010) Windowss XP
IF isValid(gu_operacionSgi) THEN
	DESTROY gu_operacionSgi
END IF

if isvalid(gu_rf_servidor_operacion) then
	destroy gu_rf_servidor_operacion
end if
if isvalid(gu_rf) then
	destroy gu_rf
end if

if isvalid(onis) then
	if onis.trabajo>0 then
		onis.of_sal_trabajo()
	end if
	onis.of_cierra_ventana()
	destroy onis
end if

if isvalid(gu_perfiles) then 
		destroy gu_perfiles
end if

destroy gnu_u_transaction
// MODIFICADO JCARLOS 23/04/97
// Destruir la variable global openlink
//DESTROY guo_OpenLink 
//
////////

end event

on opensgi.create
appname="opensgi"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on opensgi.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on


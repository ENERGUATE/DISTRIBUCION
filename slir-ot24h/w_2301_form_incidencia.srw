HA$PBExportHeader$w_2301_form_incidencia.srw
$PBExportComments$comment - new object
forward
global type w_2301_form_incidencia from w_sgigenerica
end type
type d_ambito from u_cen_2002_pr_form_centro_cmd_mesa_oc within w_2301_form_incidencia
end type
type dw_brigadas_calendario_rango from datawindow within w_2301_form_incidencia
end type
type uo_barra from u_pr_gen_espera_act within w_2301_form_incidencia
end type
type tab_1 from u_tab_2301_form_incidencias within w_2301_form_incidencia
end type
type tab_1 from u_tab_2301_form_incidencias within w_2301_form_incidencia
end type
type cb_1 from commandbutton within w_2301_form_incidencia
end type
type em_incidencia from editmask within w_2301_form_incidencia
end type
type st_1 from statictext within w_2301_form_incidencia
end type
type cbx_historicos from checkbox within w_2301_form_incidencia
end type
type gb_1 from groupbox within w_2301_form_incidencia
end type
end forward

global type w_2301_form_incidencia from w_sgigenerica
integer x = 5
integer y = 4
integer width = 6368
integer height = 2976
string title = "Incidencias"
string menuname = "md_ingreso_incidencias"
boolean maxbox = false
boolean resizable = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "recursos/watcom.ico"
event ue_sit_clima pbm_custom37
event ue_suministros_importantes pbm_custom41
event ue_consulta_avisos pbm_custom44
event ue_pos_activate pbm_custom47
event ue_open pbm_custom50
event ue_instalacion_afectada pbm_custom45
event ue_grabar pbm_custom53
event ue_operacion ( )
event ue_minimizar pbm_windowposchanged
event ue_refresca ( )
event ue_agrupacion ( )
event ue_refresca_mante ( )
event ue_int_descargos ( )
event ue_descargos ( )
event ue_alta_int_descargos ( )
event ue_open2 ( )
d_ambito d_ambito
dw_brigadas_calendario_rango dw_brigadas_calendario_rango
uo_barra uo_barra
tab_1 tab_1
cb_1 cb_1
em_incidencia em_incidencia
st_1 st_1
cbx_historicos cbx_historicos
gb_1 gb_1
end type
global w_2301_form_incidencia w_2301_form_incidencia

type variables
datawindowchild ddch_estado

u_generico_comunicaciones lu_comunic
u_generico_comunicaciones lu_comunic1

u_inc_2003_rn_form_inf_general iu_inc_2003_rn
u_inc_2003_nu_form_inf_general iu_inc_2003_nu
u_inc_2004_nu_form_inf_general iu_inc_2004_nu
u_inc_2004_rn_form_inf_general iu_inc_2004_rn
u_avi_1002_nu_generico lu_avi_1002_nu 
u_inc_2005_nu_detalle_interrup iu_inc_2005_nu
u_ema_2002_nu_estados_mantenimiento iu_ema_2002_nu
u_eop_2002_nu_estados_operaciones iu_eop_2002_nu

long il_nro_incidencia
long il_nro_ot
long il_aviso_sum
long il_sesion_operacion

int ii_co_nivel
int ii_causa_ant
int i_hay_datos
int ii_tipo_instalacion = 0
int i_vez=2 // Grafico del reloj
int ii_estado_red = 0
int ii_incidencia_de_op = -1

boolean l_si_valido
boolean ib_grabo_bien
boolean ib_post_activate = False
boolean ib_valido
boolean ib_hubo_cambios
boolean ib_primera_vez
boolean ib_resuelta = false
boolean ib_mostrar_mensaje = true

DateTime idt_f_deteccion
DateTime idt_fec_est_res
datetime idt_fec_prim_aviso
datetime idt_f_actual

string is_title

//AHM (09/12/2009) Problemas con el bloqueo de las indisponibilidades
datastore	ids_disponibilidades

boolean buscar_x_hist_incidencia,buscar_x_incidencia  //Fase 4 Ot24h 08/01/2019


boolean consulta_hecha=false // nos dira si ya hicimos alguna consulta
datawindowchild ldwc_reset

int inicio = -1

long numeroIncidencia

st_params st_parametros
boolean bandera = false

end variables
forward prototypes
public function integer fnu_resetear_var_comunicaciones ()
public subroutine fnu_destruir_objetos ()
public function integer fw_borrar_registros_dw_nulos (ref datawindow pd_dw)
public function datetime fw_o_fecha_eb ()
public function integer fw_asociar_suministro (long pl_nro_aviso)
public function integer fnu_liberar_brigadas ()
public function integer fw_evaluar_brig_desdrag ()
public function integer fw_cambia_bitmap ()
public function integer fw_asociar_avisos_calidad (long pl_nro_instalacion, datetime pdt_fecha_1, datetime pdt_fecha_2)
public subroutine fw_evaluo_inc_calidad (integer pi_tipo_incidencia, boolean pb_ya_generada, integer pi_alcance)
public function integer fnu_crea_objetos (window pw_ventana)
public function integer fw_inst_afectadas_operaciones ()
public function integer fw_comp_inst_int ()
public function boolean fw_incidencia_de_operaciones ()
public function integer fw_bloquear_brigadas_asignadas (integer pi_ind_bloqueo)
public function integer fw_desbloq_brig_fin_trab ()
public function boolean fw_enviar_operacion (integer pi_tipo_incidencia)
public function integer fw_verifica_otros_graba ()
public subroutine fw_aviso_alum_pub ()
public subroutine fw_open_ext ()
public function integer fw_lib_av_pos_asoc ()
public function datetime fw_obtener_f_actual (long pl_nro_incidencia)
public function boolean fw_incidencia_modif_anidadas (long pl_nro_incidencia, datetime pdt_f_actual)
public subroutine fw_cambiar_tab_indisponibilidades (boolean pb_es_operaciones)
public subroutine fw_modificar_select_maniobras_at (integer ind_act)
public function string fw_ponernumeroincidencia (string ps_sql, long pl_nroincidencia)
public function integer fw_maniobras (long pl_nroincidencia)
public function string fw_maniobrasresto (string ps_sql)
public function string fw_maniobrasmoldavia (string ps_sql)
public function string fw_maniobrasnicaragua (string ps_sql)
public subroutine fw_actualizaestadoocen ()
public function integer fw_bloqueaobsseguimiento ()
public function integer fw_cargarobservacionesenviadobrigada ()
public function integer fw_cargarobservacionesestadopendiente ()
public function integer fw_cargarobservacionesseguimiento ()
public function integer fw_cargarobservacionesserviciorepuesto ()
public function integer wf_crearordentrabajo (long pl_instalacionafectada)
public function integer fw_desbloqueoinstalacion ()
public function integer wf_cargadisponibilidades ()
public function integer limpiar_data_window_incidencia (integer numero)
public function integer mostrar_datawindow (integer argumento_nuevo)
public subroutine fw_limpiar_variables ()
public subroutine fw_bloquear_dw ()
public subroutine fw_inicializar_componentes ()
end prototypes

event ue_sit_clima;int li_cantidad
SetPointer(HourGlass!)

//llamada a la ventana de situacion climatologica
fgnu_resetear_s_comunicaciones(gu_comunic)

gu_comunic.is_comunic.longval1=tab_1.ii_nro_cmd

IF ISNULL(tab_1.idt_fec_deteccion) THEN
	gu_comunic.is_comunic.Datval1 = fgnu_fecha_actual()
ELSE
	gu_comunic.is_comunic.Datval1=tab_1.idt_fec_deteccion
END IF

gu_comunic.is_comunic.Accion_llamada="Consulta"

SELECT count(*) into :li_cantidad  FROM "GI_SIT_CLIMA"  
WHERE "GI_SIT_CLIMA"."NRO_CMD" =: gu_comunic.is_comunic.longval1 AND  
		"GI_SIT_CLIMA"."FECHA" =: gu_comunic.is_comunic.Datval1;    

IF li_cantidad=0 THEN
	gnv_msg.f_mensaje("AI17",STRING(DATE(gu_comunic.is_comunic.datval1))," ",OK!)
ELSE
	OPEN(W_2304_SITUACION_CLIMATOLOGICA)
END IF



end event

event ue_suministros_importantes;long ll_nro_incidencia

SetPointer(HourGlass!)

ll_nro_incidencia=tab_1.il_nro_incidencia

fgnu_resetear_s_comunicaciones(gu_comunic)	
gu_comunic.is_comunic.longval1=ll_nro_incidencia
gu_comunic.is_comunic.Datval1 = tab_1.tabpage_formulario.d_inf_general.GetItemDateTime(1, 'f_deteccion')
gu_comunic.is_comunic.programa_llamante="iw_1234"
gu_comunic.is_comunic.intval1=tab_1.ii_nro_centro
gu_comunic.is_comunic.intval2=tab_1.ii_nro_cmd
gu_comunic.is_comunic.intval3=tab_1.ii_nro_mesa
gu_comunic.is_comunic.Accion_llamada="Consulta"

Open(w_3202_mantenimiento_suministros_imp)

end event

event ue_consulta_avisos;long ll_nro_incidencia
long ll_cantidad
ll_cantidad=0
SetPointer(HourGlass!)

	ll_nro_incidencia= tab_1.il_nro_incidencia
	gu_comunic.is_comunic.longval1=0
	gu_comunic.is_comunic.longval2=ll_nro_incidencia
	//gu_comunic.is_comunic.programa_llamante="iw_1234"
	gu_comunic.is_comunic.Accion_llamada=lu_comunic.is_comunic.Accion_llamada
	SELECT count(*) INTO :ll_cantidad FROM gi_avisos WHERE nro_incidencia=:ll_nro_incidencia;
	IF ll_cantidad>0 THEN
		open(w_2307_consulta_avisos)
	ELSE
		gnv_msg.f_mensaje("AI26"," "," ",OK!)
	END IF

end event

event ue_pos_activate;long ll_nro_ot,ll_nro_incidencia, ll_incidencia_existente,ll_nro_inst
string ls_nom_brigada, ls_fase_sugerida
long  ll_nro_brigada
int li_grabe, li_con_interrupciones
int li_estado_ot, li_lock_status
long ll_ot_existente = 0
int a
datetime ldt_fecha_brigada_mas_vieja
Boolean lb_cerrar_ventana = False
md_ingreso_incidencias lm_menu

ib_post_activate = True

////////////////Retorna de w 2120 identifificacion de instalaciones //////

IF lu_comunic.is_comunic.programa_Retorno="iw_2120" THEN

	// Si seleccione una instalacion y no vengo de la seleccion de otras instalaciones a interrumpir

	IF not isnull(lu_comunic.is_comunic.decval1) AND lu_comunic.is_comunic.decval1 <> 0 THEN  
	
		tab_1.il_inst_dig[] = gu_rf.il_instalaciones[]
		
		// Se le pregunta al usuario si desea que la incidencia sea con o sin perdida en el 
		// caso de haber seleccionado una instalacion valida

		//***************************************
		//**  OSGI 2001.1  	17/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		//**  OSGI 2001.1  	17/05/2001  		li_con_interrupciones=messagebox("Atencion", " Desea asignar interrupciones a la incidencia?", Question!,YesNo!)
		///////////////////////////////////////////////////////////
		// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 06/09/2002
		////////////////////////////////////////////////////////////
		//		If tab_1.ib_nuevos_tip_inc AND tab_1.ii_tipo_incid = fgci_incidencia_obligada  Then
		//			li_con_interrupciones = 1
		//			
		//		Else
		
		li_con_interrupciones=messagebox("Atencion", " Desea asignar interrupciones a la incidencia?", Question!,YesNo!)
		
		//		End If
		////////////////////////////////////////////////////////////////
		//***************************************
		//**  OSGI 2001.1  	17/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************

		idt_f_deteccion = tab_1.tabpage_formulario.d_inf_general.getitemdatetime(1,"f_deteccion")

		//Obtengo la fecha del primer aviso que afecte a dicha instalacion
		IF li_con_interrupciones = 1 THEN
			IF gb_red_trifasica = FALSE THEN
				tab_1.tabpage_formulario.st_fases.visible = TRUE
				tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida.visible = TRUE
				tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida_t.visible = TRUE
				ls_fase_sugerida = ''
				IF Mid(lu_comunic.is_comunic.strval4, 1, 1) = '1' THEN
					ls_fase_sugerida = gs_fase_a
				END IF
				IF Mid(lu_comunic.is_comunic.strval4, 2, 1) = '1' THEN
					ls_fase_sugerida = ls_fase_sugerida + gs_fase_b
				END IF
				IF Mid(lu_comunic.is_comunic.strval4, 3, 1) = '1' THEN
					ls_fase_sugerida = ls_fase_sugerida + gs_fase_c
				END IF
				tab_1.tabpage_formulario.d_inf_general.setitem(1,"fase_sugerida",ls_fase_sugerida)
			END IF
			idt_fec_prim_aviso = iu_inc_2004_rn.fnu_obtener_fec_p_aviso(lu_comunic.is_comunic.decval1,tab_1.ii_tipo_incid)
		ELSE
			IF gb_red_trifasica = FALSE THEN
				tab_1.tabpage_formulario.st_fases.visible = FALSE
				tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida.visible = FALSE
				tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida_t.visible = FALSE
			END IF
		END IF 
		ii_co_nivel = lu_comunic.is_comunic.intval5
		tab_1.tabpage_formulario.d_inf_general.setcolumn("f_deteccion")		

		// Si tengo la fecha del aviso mas viejo sobre la instalacion,
		// seteo la fecha de deteccion con dicha fecha

		//***************************************
		//**  OSGI 2001.1  	17/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		//**  OSGI 2001.1  	17/05/2001  
		//////////////////////////////////////////////////////////////
		// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 06/09/2002
		//////////////////////////////////////////////////////////////
		if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia") = fgci_incidencia_imprevista THEN 
//		If tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia") = fgci_incidencia_imprevista  Or &
//			tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia") = fgci_incidencia_obligada Then
       //////////////////////////////////////////////////////////////
		//***************************************
		//**  OSGI 2001.1  	17/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************

			IF NOT ISNULL(idt_fec_prim_aviso) THEN
				tab_1.tabpage_formulario.d_inf_general.setitem(1,"f_deteccion",idt_fec_prim_aviso)
				idt_f_deteccion = idt_fec_prim_aviso
				
			END IF
			// actualizar_seguimiento
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(1,"f_alta",Datetime(Date(idt_f_deteccion),Time(String(Time(idt_f_deteccion), "hh:mm"))))
			tab_1.idt_fec_deteccion = idt_f_deteccion
		END IF
		
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"co_nivel",ii_co_nivel)		
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_centro",lu_comunic.is_comunic.intval1)
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_cmd",lu_comunic.is_comunic.intval2)
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_mesa",lu_comunic.is_comunic.intval3)
			// GNU 22-6-2007. Mejora 1/339347
	IF fg_verifica_parametro("ambito ot") THEN
		tab_1.tabpage_ot.dw_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1,&
							lu_comunic.is_comunic.intval2, lu_comunic.is_comunic.intval3,0)
	END IF
	// FIN GNU
		ib_hubo_cambios = TRUE
		
		///////////////
		// Agregado por AFS para setear el nombre y tipo de instalacion
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"tipo_instalacion",lu_comunic.is_comunic.intval4)
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"nombre_instalacion",lu_comunic.is_comunic.strval2)
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"nombre_ins",lu_comunic.is_comunic.decval1)
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"tip_tension",lu_comunic.is_comunic.intval6)
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"dir_instalacion",lu_comunic.is_comunic.strval1)
		tab_1.tabpage_formulario.d_inf_general.setitem(1,"instalacion_origen",0)
		
		lm_menu= This.menuid
		lm_menu.m_consultar.m_instalacionafectada.enabled = false
		IF li_con_interrupciones = 2 THEN // El usuario ha elegido incidencia sin perdida
			tab_1.ii_alcance = fgci_incidencia_sin_interrupcion
			tab_1.tabpage_formulario.d_inf_general.setitem(1,"alcance",fgci_incidencia_sin_interrupcion)			
			tab_1.of_iniciar_estados_oper()
			// FDO Mejora 1/244594
			IF gi_pais = 4 then // Si el pais es Panama
				tab_1.tabpage_interrupciones.enabled = False
			END IF
			// FDO Mejora 1/244594
			tab_1.tabpage_interrupciones.enabled = TRUE

			lm_menu.m_consultar.m_avisos.enabled = False
			lm_menu.m_consultar.m_suministrosimportantes.enabled = False
			fw_evaluo_inc_calidad(fgci_incidencia_imprevista, False, fgci_incidencia_sin_interrupcion)
		ELSE
			lm_menu.m_consultar.m_suministrosimportantes.enabled = True
			lm_menu.m_consultar.m_avisos.enabled = True
		END IF
		
		tab_1.tabpage_formulario.d_inf_general.AcceptText()
		
		tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.protect=1
		tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.background.color=gs_gris

      gu_control_v_incidencias.of_actualiza_nro_incidencia(handle(this),tab_1.il_nro_incidencia,lu_comunic.is_comunic.strval2)
		gu_control_v_incidencias.of_Actualiza_lista()
		tab_1.ib_cambio_instalacion=true
		// Si la tension de la instalacion es de alumbrado publico
		// actalizo el formulario
		IF lu_comunic.is_comunic.intval6 = 4 THEN
			tab_1.tabpage_formulario.d_inf_general.setitem(1,"incidencia_ind_alum_pub",fgci_alumbrado_publico)
		ELSE
			tab_1.tabpage_formulario.d_inf_general.setitem(1,"incidencia_ind_alum_pub",0)
		END IF
		
		//
		///////////////

		tab_1.idec_nro_instalacion_afectada = lu_comunic.is_comunic.decval1
		tab_1.tabpage_interrupciones.tv_1.deleteitem(0)
		tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.idec_nro_instalacion_afectada,0,2)

		IF tab_1.is_accion_llamada = "Alta" THEN
	
			SELECT count(*)
			INTO :ll_incidencia_existente 
			FROM sgd_incidencia
			WHERE est_actual < :fgci_incidencia_servicio_repuesto AND
					nro_inst_afectada = :lu_comunic.is_comunic.decval1 ;
			
			IF sqlca.sqlcode = 0 THEN	
				IF ll_incidencia_existente > 0 THEN
					gu_comunic.is_comunic.intval1 = 1 
					gu_comunic.is_comunic.longval1 = lu_comunic.is_comunic.decval1
					Open(w_1106_selec_incid)
					
					IF  Message.doubleParm > 0 then
						ib_post_activate = true
						lb_cerrar_ventana = True
						this.postevent("ue_preclose")
					END IF
					
				END IF
				
			END IF
			
		END IF
// PACHO
		IF NOT lb_cerrar_ventana THEN
			// Si la instalacion retornada tiene una OT asignada en estado pendiente,
			// y esa OT no corresponde a otra incidencia en estado SR, esto es, es una OT
			// generada sobre esa instalacion no asociada a incidencia
			// se asigna esa OT a la incidencia y se pasa la incidencia a enviado brigada.
			Select COUNT(gi_ot.nro_ot)
			into :ll_ot_existente
			from gi_ot
			where ( gi_ot.nro_incidencia = 0 or gi_ot.nro_incidencia is null ) and 
					  gi_ot.est_ot < 3 and
					  gi_ot.nro_instalacion = :lu_comunic.is_comunic.decval1;
			
			IF sqlca.sqlcode = 0 THEN
				IF ll_ot_existente > 0 THEN
					// La instalacion seleccionada tiene OT's asignadas.
					// Se permite al usuario seleccionar una OT o definir una nueva
					gu_comunic.is_comunic.intval1 = 2 
					gu_comunic.is_comunic.longval1 = lu_comunic.is_comunic.decval1
					gu_comunic.is_comunic.accion_llamada = 'Alta_nivel_instalacion'
					gu_comunic.is_comunic.strval1 = lu_comunic.is_comunic.strval2 
							
					Open(w_1106_selec_incid)
					IF gu_comunic.is_comunic.longval4 > 0 THEN
						// Acepto la ot pasada como parametro
						tab_1.il_nro_ot = gu_comunic.is_comunic.longval4
						
						// Cambio el estado de la incidencia y recupero los
						// datos correspondientes a la ot existente
						tab_1.ii_estado_oper = fgci_incidencia_enviado_brigada
						tab_1.tabpage_ot.d_datos_ot.Retrieve(gu_comunic.is_comunic.longval4)
						if tab_1.tabpage_ot.d_datos_ot.RowCount() > 0 then
							if tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2 then
								tab_1.fnu_cambiar_ot_tipo('CO')
							else								
								tab_1.fnu_cambiar_ot_tipo('BR')
							end if
						else
							tab_1.fnu_cambiar_ot_tipo('BR')
						end if
						tab_1.tabpage_ot.d_lista_brigadas_ot.Retrieve(gu_comunic.is_comunic.longval4)
						fw_bloquear_brigadas_asignadas(1)
						
						IF tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount() > 0 THEN
							ldt_fecha_brigada_mas_vieja = fw_o_fecha_eb()
						ELSE
							SetNull(ldt_fecha_brigada_mas_vieja)
						END IF
						tab_1.tabpage_formulario.d_inf_general.SetItem(1,"f_deteccion",ldt_fecha_brigada_mas_vieja)
						tab_1.tabpage_formulario.d_inf_general.SetItem(1,"estado_actual",tab_1.ii_estado_oper)
						tab_1.tabpage_formulario.d_inf_general.SetItem(1,"ot",gu_comunic.is_comunic.longval4)
						// estaba comentado en el open
						tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_pendiente,"f_alta",ldt_fecha_brigada_mas_vieja)
						tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"f_alta",ldt_fecha_brigada_mas_vieja)
						tab_1.tabpage_ot.enabled = true
						//tab_1.tabpage_cuadrillas.enabled = true
						//tab_1.f_deshab_tabs(true)
					END IF
				END IF
				
			END IF
		END IF

	END IF
	
	// GNU 16-10-2006. Mejora EPSA
	if	fg_verifica_parametro("Indisponibilidades activas") = true then	
		gu_comunic1.is_comunic.intval9=0
		IF tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,'tip_tension')=fgci_alta_tension or &
		lu_comunic.is_comunic.intval4= fgci_tipo_subestacion or &
		lu_comunic.is_comunic.intval4= fgci_tipo_salida_mt THEN
			tab_1.tabpage_indisponibilidades.enabled = true
			tab_1.of_cargar_indisponibilidad(lu_comunic.is_comunic.decval1)
		END IF
		
	end if
	// FIN GNU
	
END IF


//////////////////////////RETORNO DE CONSULTA DE AVISOS /////////////////
IF lu_comunic.is_comunic.programa_retorno="iw_2307_consulta_avisos" THEN
		IF lu_comunic.is_comunic.accion_llamada="Actualizacion" THEN // SI SE LIBERO ALGUN AVISO
			iu_inc_2004_nu.fnu_actualizar_aviso_viejo(tab_1.tabpage_formulario.d_inf_general)
			ib_hubo_cambios=TRUE
		END IF // calculo el aviso mas viejo
		
		// GNU 14-02-2007. Incidencia Ezequiel
		IF not isnull(lu_comunic.is_comunic.longval4) THEN
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"primer_aviso",lu_comunic.is_comunic.longval4)
			ib_hubo_cambios=TRUE
		END IF
		// FIN GNU
END IF
///////////////// RETORNO DE LA SELECCION DE FASES //////////////////////
IF lu_comunic.is_comunic.programa_Retorno="w_seleccion_fase" AND &
	lu_comunic.is_comunic.accion_retorno = 'Seleccion' AND &
	gu_comunic.is_comunic.accion_llamada <> "Interrupcion" THEN
	tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'fase_sugerida', lu_comunic.is_comunic.strval1)
END IF

//frn_habilitar_opciones_menu(lu_comunic.is_comunic.accion_llamada)
IF ib_primera_vez=TRUE THEN
	IF lu_comunic.is_comunic.Accion_llamada="Consulta" or lu_comunic.is_comunic.Accion_llamada="Mantenimiento" THEN
//		iu_inc_2005_nu.fnu_cargo_det_interr(dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),gr_1,gr_2)   //LLENAR ESTADISTICAS DE INTERRUPCIONES
		ib_primera_vez=FALSE
	END IF
END IF
fnu_resetear_var_comunicaciones()
THIS.SETREDRAW(TRUE)
tab_1.tabpage_formulario.d_inf_general.SetRedraw(TRUE)

// Seteo en nulo la variable programa retorno para prevenir que al cambiar cada tabpage
// entre en los IF ... THEN del evento
SetNull(lu_comunic.is_comunic.programa_Retorno)

//anto$$HEX1$$b400$$ENDHEX$$s addition
//LLENAR ESTADISTICAS DE INTERRUPCIONES
//iu_inc_2005_nu.fnu_cargo_det_interr(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3)  
//if  Message.doubleParm > 0 then
//	ib_post_activate = true
//else
	ib_post_activate = false
//end if

if lu_comunic.is_comunic.Accion_llamada<>"Consulta" then
	tab_1.f_deshab_tabs(false)
else
	this.triggerevent("ue_post_activate")
end if


//ACO
end event

event ue_open;// Cargar ii_ind_suministro en la variable del tab
long ll_codigo, ll_codigo_aco
string ls_nom_instalacion, ls_dir_aviso
datetime ldt_fecha_brigada_mas_vieja, ldt_f_detec
int li_cant_brigadas,li_conta,li_cont2
String ls_fase_afectada
long ll_fila_primera = 1 
string ls_mensaje
md_ingreso_incidencias lm_menu
W_BARRA lw_barra
long ll_fila

l_si_valido = True 
ib_primera_vez = TRUE 
iu_inc_2003_rn.iw_contenedora= this
SetNull(ldt_fecha_brigada_mas_vieja)

//uo_barra.barra.f_resetea_barra()
lm_menu = This.MenuId 

//OPEN(lw_barra,this)
//lw_barra.UO_BARRA.gb_1.text="Abriendo Incidencia..."
//lw_barra.UO_BARRA.BARRA.visible=true
//lw_barra.uo_barra.barra.f_amplia(1)

//Maneja las variables globales
//			gu_comunic para trabajo y para comunicarse con la ventana llamante 
//			gu_comunic1 para comunicarse con la ventana iw_6201(asignacion de brigada) 
//			gu_comunic2 para comunicarse con la ventana iw_2120 (seleccion_insts)
//Parametros de entrada:
//			Decval1 = nro instalacion afectada 
//			longval2 = nro_aviso
//			longval3 = nro_incidencia
//			strval1 = direccion del aviso			
//			strval3 = fase de la instalacion
//			intval1 = tipo de instalacion
//			intval2 = tipo de tension
//			intval3 = centro			
//			intval4 = cmd
//			intval5 = puesto
//			intval6 = co-nivel
//			datval1 = fecha de alta del aviso 			
//			datval2 = hora de alta del aviso
//			programa_llamante = nombre de la venta o opcion del menu
//			accion_llamada		= Alta nivel suministro
//									  Alta nivel instalacion
//									  Alta							 
//									  Modificacion 
//
//		Parametros de salida
//				intval9 = estado de la incidencia (utilizado por la w_1105_avisos_con_alim
//															para refrescar el arbol o no.)
//
//
//Dependera del perfil del usuario que pueda consultar o modificar
//Si el usuario es de baja no podra modificar el centro , cmd y puesto

//This.title = gu_comunic.f_titulo_ventana("w_2301","Info.Incid.")
This.title="Informaci$$HEX1$$f300$$ENDHEX$$n de Incidencias"
is_title=this.title
SetPointer(HourGlass!)
this.setredraw(false)
tab_1.tabpage_formulario.d_inf_general.SetRedraw(False)
openwithparm(w_msg,"Cargando...")

//////////////////////// CREACION DE OBJETOS////////////////////////////

this.fnu_crea_objetos(this)
//lw_barra.uo_barra.barra.f_amplia(3)

//////////////////CARGA LOS DATOS DE COMUNICACIONES //////////////////
/////////////////////A LA ESTRUCTURA DE TRABAJO				////////////

lu_comunic.is_comunic = gu_comunic.is_comunic 
//idt_f_actual = fw_obtener_f_actual(lu_comunic.is_comunic.longval3)--Agregar mas tarde

// Si estoy dando de alta una incidencia sobre una instalacion y 
// ya existe una incidencia en estado < que SR, abro dicha incidencia 
//	y no creo ninguna nueva
//lw_barra.uo_barra.barra.f_amplia(5)

//IF lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" THEN
//	lw_barra.UO_BARRA.gb_1.text="Generando Alta..."
//	
//END IF--Agregar mas tarde

//lw_barra.uo_barra.barra.f_amplia(7)
// Seteo las variables de instancia del tab
tab_1.is_accion_llamada = lu_comunic.is_comunic.accion_llamada

////////////////ACTIVO LAS DATAWINDOWS DE INF GENERAL//////////////////

// La ventana es de tipo w_2301_form_incidencia. Esto se hace para diferenciarla de la
// de historicos
tab_1.is_tipo_ventana ="w_2301"	

tab_1.tabpage_formulario.d_inf_general.fnu_crea_dddw() 
tab_1.tabpage_formulario.d_inf_general.insertrow(0)
tab_1.ii_nro_cmd=gi_nro_cmd
d_ambito.f_insertar_fila()
//lw_barra.uo_barra.barra.f_amplia(9)
ib_hubo_cambios = FALSE
dw_brigadas_calendario_rango.SetTransObject(SQLCA)
dw_brigadas_calendario_rango.Retrieve(Datetime(Date(fgnu_fecha_actual())), fgnu_fecha_actual())

//////////////// PREPARO LA PRESENTACION SEGUN LA ACCION LLAMADA/////////
// Se deshabilita el checkbox de 'BlackOut'
tab_1.tabpage_formulario.cbx_blackout.Enabled = False

SETNULL(idt_fec_prim_aviso)
//lw_barra.uo_barra.barra.f_amplia(11)

// Recupero la lista de acciones
tab_1.tabpage_acciones.d_lista_acciones.Retrieve()

//lw_barra.uo_barra.barra.f_amplia(13)

// Agnadido por Sgo. 28/04/2005. Mejora Moldavia.
// En Moldavia se entrara por defecto en la pestagna de OT.
If gi_pais = 8 Then
	tab_1.tabpage_ot.d_crit_seleccion.SetItem(1,"pi_brigadas_en_turno",0)

	tab_1.tabpage_ot.d_datos_ot.Object.nro_ot_t.Text = "Estado:"
	IF lu_comunic.is_comunic.accion_llamada = "Alta" Or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" Or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" Then
		tab_1.tabpage_ot.d_datos_ot.Object.nro_ot_t.Visible = False
	End If
	
	tab_1.tabpage_ot.d_datos_ot.Object.nro_ot.Visible = False
	tab_1.tabpage_ot.d_datos_ot.Object.est_ot_t.Text = "Prepara. LM:"
	tab_1.tabpage_ot.d_datos_ot.Object.est_ot.Y = 20

	IF lu_comunic.is_comunic.accion_llamada = "Alta" Or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" Or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" Then
		tab_1.tabpage_ot.d_datos_ot.Object.f_prepara_lm.Visible = False
	Else //lu_comunic.is_comunic.accion_llamada <> "Alta"
		tab_1.tabpage_ot.d_datos_ot.Object.f_prepara_lm.Visible = True
	End IF

	tab_1.tabpage_ot.d_datos_ot.Object.f_desde_t.Text = "Admision:"
	tab_1.tabpage_ot.d_datos_ot.Object.f_hasta_t.Text = "Finalizacion:"

	IF lu_comunic.is_comunic.accion_llamada <> "Alta" Then tab_1.Post Event ue_selecttab(3)
End If
// Fin. Sgo.

//IF lu_comunic.is_comunic.accion_llamada = "Alta" or &
//		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" or &
//		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" THEN
//	
//
//	// Si se da de alta desde SGI se fija este campo -10 para diferenciarla de las incidencias que pueden dar de alta tanto SGI como OOP.
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,'c_estado_red',-10)
//	
//	this.title="OPEN SGI - Ingreso de una Incidencia"
//	is_title=this.title
//	i_hay_datos=1  // es para ver si hay datos para grabar
//	ib_hubo_cambios = TRUE   //BANDERA QUE INDICA QUE HAY CAMBIOS EN LA INFORMACION
//
//
//	//lw_barra.UO_BARRA.gb_1.text="Generando Alta..."
//	//lw_barra.uo_barra.barra.f_amplia(15)
//	
//	/************************   OBTENGO NUMERO DE INCIDENCIA **************/
//
//	tab_1.il_nro_incidencia = tab_1.fnu_actualizar_ultima_inc()
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_incidencia",tab_1.il_nro_incidencia)
//	
//	//lw_barra.uo_barra.barra.f_amplia(17)
//
//	// Le asigno un numero de OT desde el principio para evitar tener que 
//	// hacer un commit en el tabpage
//	// Si la incidencia se esta dando de alta sobre una instalacion o suministro que
//	// ya tiene una ot asignada, la tomo por defecto y no creo ninguna nueva.
//	
//	IF lu_comunic.is_comunic.longval4 > 0 THEN
//		// Acepto la ot pasada como parametro
//		tab_1.il_nro_ot = lu_comunic.is_comunic.longval4 
//		
//		// Cambio el estado de la incidencia y recupero los
//		// datos correspondientes a la ot existente
//		tab_1.ii_estado_oper = fgci_incidencia_enviado_brigada
//		tab_1.tabpage_ot.d_datos_ot.Retrieve(tab_1.il_nro_ot)
//			
//		// DSA INI 29/03/2000	
//		if tab_1.tabpage_ot.d_datos_ot.RowCount() > 0 then
//			if tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2 then
//				tab_1.fnu_cambiar_ot_tipo('CO')
//			else								
//				tab_1.fnu_cambiar_ot_tipo('BR')
//			end if
//		else
//			tab_1.fnu_cambiar_ot_tipo('BR')
//		end if
//		
//		tab_1.tabpage_ot.d_lista_brigadas_ot.Retrieve(tab_1.il_nro_ot)	
//		
//		// DSA FIN 29/03/2000	
//		IF tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 1 THEN
//			IF fw_bloquear_brigadas_asignadas(1) = -1 THEN
//				This.PostEvent('ue_postopen')
//				//this.postevent("ue_preclose")
//			END IF
//		END IF
//
//		// Compruebo el estado en el que esta la ot para poner el estado 
//		// correcto en la incidencia.
//		if tab_1.tabpage_ot.d_datos_ot.object.est_ot[1] > 1 then
//			tab_1.ii_estado_oper = fgci_incidencia_enviado_brigada
//			ldt_fecha_brigada_mas_vieja = fw_o_fecha_eb()
//		else
//			tab_1.ii_estado_oper = fgci_incidencia_pendiente
//			SetNull(ldt_fecha_brigada_mas_vieja)
//		end if
//		
//		tab_1.tabpage_observaciones.mle_observaciones.text= &
//			"Incidencia creada con OT generada en Gestion de Avisos."
//			
//		tab_1.tabpage_formulario.d_inf_general.SetItem(1,"observacion",tab_1.tabpage_observaciones.mle_observaciones.Text)
//		
//		//lw_barra.uo_barra.barra.f_amplia(19)
//	
//	ELSE
//		// Genero un nuevo numero de ot
//		lw_barra.UO_BARRA.gb_1.text="Recuperando Incidencia..."
//		//tab_1.il_nro_ot = tab_1.f_actualizar_ultima_ot()
//		tab_1.ii_estado_oper = fgci_incidencia_pendiente
//		//lw_barra.uo_barra.barra.f_amplia(21)
//	END IF
//	
//	gnu_u_transaction.uf_commit()
// //lw_barra.uo_barra.barra.f_amplia(23)
//
//	// El alta siempre es de incidencias imprevistas, los descargos se dan de alta
//	// desde una funcion en la ventana de descargos
//	tab_1.ii_tipo_incid = fgci_incidencia_imprevista
//
//	iu_inc_2003_rn.frn_ini_campos_por_defecto(tab_1.tabpage_formulario.d_inf_general,lu_comunic)
//	
//	   //DBE 16/03/2000 9:21 ini //Calidad		
//		if lower(lu_comunic.is_comunic.accion_llamada)=lower('Alta_nivel_suministro')  then 
//			
//			// Creado para aviso de Ayuda  
//			  if  lu_comunic.is_comunic.decval1=fgcdec_aviso_de_ayuda then
//		       tab_1.tabpage_formulario.d_inf_general.setitem(1,'nombre_ins',fgcdec_incidencia_de_suministro)
//         	 tab_1.tabpage_formulario.d_inf_general.setitem(1,'alcance',fgci_incidencia_de_suministro)
//			  end if
//			  
//		elseif lower(lu_comunic.is_comunic.accion_llamada)=lower('Alta_nivel_instalacion') or &
//			lu_comunic.is_comunic.accion_llamada = "Alta" 	then
//				
//				IF gb_operaciones AND gi_tension_nivel_min = fgci_baja_tension THEN
//				ELSE
//			      tab_1.tabpage_formulario.d_inf_general.setitem(1,'tipo_incidencia',fgci_incidencia_imprevista)
//					tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.protect = 1 // ACO
//				END IF
//   	end if
//		//DBE 16/03/2000 9:21 fin
//	// inserto fila en dw de interrupciones
//	//lw_barra.uo_barra.barra.f_amplia(25)
//	// Si la tension de la instalacion es de alumbrado publico
//	// actalizo el formulario
//	IF lu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim" THEN
//		IF lu_comunic.is_comunic.intval10 = 4 THEN
//			tab_1.tabpage_formulario.d_inf_general.setitem(1,"incidencia_ind_alum_pub",fgci_alumbrado_publico)
//		ELSE
//			tab_1.tabpage_formulario.d_inf_general.setitem(1,"incidencia_ind_alum_pub",0)
//		END IF
//	END IF
//		
//END IF  --Agregar mas tarde

////////////////////////// ACCION LLAMADA Alta /////////////////////////
//IF lu_comunic.is_comunic.accion_llamada="Alta" THEN
//	lw_barra.UO_BARRA.gb_1.text="Generando Alta..."
//	iu_inc_2003_rn.fnu_ini_centros_alta(tab_1.tabpage_formulario.d_inf_general)
//	
//	//AHU Estado ot ocen por defecto es no enviado (01/04/2009)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"estado_mantenimiento",1)
//	
//	IF tab_1.ii_tipo_incid = fgci_incidencia_calidad THEN
//		tab_1.ii_alcance = fgci_incidencia_de_instalacion		// Indica que es sobre instalacion
//	ELSE
//		tab_1.ii_alcance = fgci_incidencia_con_interrupcion
//	END IF
//	
//	lm_menu.m_consultar.m_suministrosimportantes.enabled=false
//	lm_menu.m_consultar.m_avisos.enabled=false
//	// Se Habilita el checkbox de 'BlackOut'
//	tab_1.tabpage_formulario.cbx_blackout.Enabled = True
//	
//	// Inicializo el seguimiento por defecto, como incidencia normal.
//	tab_1.of_iniciar_estados_oper()
//	fw_evaluo_inc_calidad(tab_1.ii_tipo_incid,false,tab_1.ii_alcance) 
//	
//END IF--Agregar mas tarde
//lw_barra.uo_barra.barra.f_amplia(27)

/////////////////////// ACCION LLAMADA Alta_nivel_instalacion ///////////

//IF lu_comunic.is_comunic.Accion_llamada="Alta_nivel_instalacion" THEN
//	lw_barra.UO_BARRA.gb_1.text="Generando Alta..."
//	ls_fase_afectada = lu_comunic.is_comunic.strval1
//	lu_comunic.is_comunic.strval1 = lu_comunic.is_comunic.strval3
//	lu_comunic = lu_avi_1002_nu.fnu_datos_primer_aviso(tab_1.tabpage_formulario.d_inf_general,lu_comunic)
//	lu_comunic.is_comunic.strval1 = ls_fase_afectada
//	IF NOT ISNULL(ldt_fecha_brigada_mas_vieja) THEN
//		IF ldt_fecha_brigada_mas_vieja < lu_comunic.is_comunic.datval1 THEN
//			lu_comunic.is_comunic.datval1 = ldt_fecha_brigada_mas_vieja
//		END IF
//	END IF	
//	IF NOT gb_red_trifasica AND NOT ISNULL(lu_comunic.is_comunic.strval3) THEN
//		tab_1.tabpage_formulario.d_inf_general.setitem(1,"fase_sugerida",lu_comunic.is_comunic.strval3)
//	END IF
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_centro",lu_comunic.is_comunic.intval3)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_cmd",lu_comunic.is_comunic.intval4)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_mesa",lu_comunic.is_comunic.intval5)
//	
//	// GNU 27-6-2007. Mejora 1/339347
//	IF fg_verifica_parametro("ambito ot") THEN
//		tab_1.tabpage_ot.dw_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval3,&
//							lu_comunic.is_comunic.intval4,&
//							lu_comunic.is_comunic.intval5,0)
//	END IF 
//	 //FIN GNU
//	if lu_comunic.is_comunic.intval8 = fgci_incidencia_calidad then
//		tab_1.ii_alcance = fgci_incidencia_de_instalacion // Incidencia de calidad
//	else
//		tab_1.ii_alcance = fgci_incidencia_con_interrupcion		// Por defecto es con perdida
//	end if
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"tipo_incidencia",lu_comunic.is_comunic.intval8)
//	tab_1.ii_tipo_incid = lu_comunic.is_comunic.intval8
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"f_deteccion",lu_comunic.is_comunic.datval1)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"primer_aviso",lu_comunic.is_comunic.longval2)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"incidencia_dir_aviso",lu_comunic.is_comunic.strval2)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"dir_instalacion",lu_comunic.is_comunic.strval2)
//	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(1,"f_alta",lu_comunic.is_comunic.datval1)
//
//	// Inicializo la Incidencia segun el tipo que me venga desde Gestion de Avisos
//	tab_1.of_iniciar_estados_oper()
//	fw_evaluo_inc_calidad(lu_comunic.is_comunic.intval8,true,tab_1.ii_alcance)
//		
//	il_aviso_sum = lu_comunic.is_comunic.longval2
//	tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),0,2)
//	// GNU 1-12-2006. Indisponibilidades
//	ii_tipo_instalacion=lu_comunic.is_comunic.intval7
//	// FIN GNU
//END IF
////lw_barra.uo_barra.barra.f_amplia(29)
/////////////////////// ACCION LLAMADA Alta_nivel_suministro ////////////////
//IF lu_comunic.is_comunic.Accion_llamada="Alta_nivel_suministro" THEN
//	lw_barra.UO_BARRA.gb_1.text="Recuperando Aviso..."
//	// GNU 30-11-2006. EPSA
//	//tab_1.tabpage_formulario.d_inf_general.setitem(1,"f_deteccion",lu_comunic.is_comunic.datval1)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"dir_instalacion",lu_comunic.is_comunic.strval2)
//	// FIN GNU
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_centro",lu_comunic.is_comunic.intval1)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_cmd",lu_comunic.is_comunic.intval2)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"nro_mesa",lu_comunic.is_comunic.intval3)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"incidencia_ind_alum_pub",lu_comunic.is_comunic.intval10)
//	tab_1.tabpage_formulario.d_inf_general.setitem(1,"tip_tension",fgci_baja_tension)
//	tab_1.ii_alcance = fgci_incidencia_de_suministro
//	lm_menu.m_consultar.m_instalacionafectada.enabled=false
//	il_aviso_sum = lu_comunic.is_comunic.longval2 //DSA 18/01/2000
//	
//	// GNU 22-6-2007. Mejora 1/339347
////	IF fg_verifica_parametro("ambito ot") THEN
////		tab_1.tabpage_ot.dw_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval3,lu_comunic.is_comunic.intval4,lu_comunic.is_comunic.intval5,0)
////	END IF --agregar mas tarde
//	// FIN GNU
//
//	// Inicializo la incidencia como incidencia de Suministro y si es Sin alimentacion como de calidad.
//	tab_1.of_iniciar_estados_oper()
//	fw_evaluo_inc_calidad(lu_comunic.is_comunic.intval8,true,tab_1.ii_alcance) 
//	
//END IF
////lw_barra.uo_barra.barra.f_amplia(31)
//tab_1.tabpage_formulario.d_inf_general.setitem(1,"alcance",tab_1.ii_alcance) 
// --Agregar mas tarde
/////////////////////////////MODIFICACION////////////////////////////////

// MODIFICACION Y	CONSULTA DE INCIDENCIA    
IF lu_comunic.is_comunic.Accion_llamada = "Modificacion" THEN
	lw_barra.UO_BARRA.gb_1.text="Recuperando Incidencia..."
	this.title="OPEN SGI - Actualizacion de la Incidencia"
	is_title=this.title
	tab_1.il_nro_incidencia = lu_comunic.is_comunic.longval3

	lm_menu.m_consultar.m_instalacionafectada.enabled=false
	//lw_barra.uo_barra.barra.f_amplia(33)
	i_hay_datos=iu_inc_2003_nu.fnu_obtener_datos(tab_1.tabpage_formulario.d_inf_general,lu_comunic.is_comunic.longval3)	
	tab_1.ii_alcance 		= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
	tab_1.ii_tipo_incid	= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")
	if tab_1.tabpage_formulario.d_inf_general.object.ind_scada[1] = 1 then
		tab_1.ib_ind_scada = true
	end if
	
	tab_1.of_iniciar_estados_oper()
	
	tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")
	
	if tab_1.ii_estado_oper > fgci_incidencia_pendiente then
		tab_1.tabpage_ot.d_lista_brigadas_ot.&
				Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))	
	end if
	
	// GNU 22-6-2007. Mejora 1/339347
//	IF fg_verifica_parametro("ambito ot") THEN
//		tab_1.tabpage_ot.dw_ambito.fnu_insertar_datos(tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_centro"),&
//							tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_cmd"),&
//							tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_mesa"),0)
//	END IF   --agregar mas tarde
	// FIN GNU
	
	// Si la incidencia es si perdida o un reenganche SCADA no se podran
	// consultar los avisos asociados a la incidencia ni los suministros importantes
	// ya que no existiran
	
	IF tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
		lm_menu.m_consultar.m_avisos.enabled=false
		lm_menu.m_consultar.m_suministrosimportantes.enabled = false
	END IF

	IF	tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
		// Se asigna a la datawindow d_datos_interrup el dataobject adecuado
		// en funcion de si en operaciones se han interrumpido acometidas o CT, y de si
		// se esta o no en la ventana de historicos
		tab_1.of_componer_dw_interrupciones()
	END IF
		
	IF i_hay_datos=0 THEN
		if isvalid(lw_barra) then
			close(lw_barra)
		end if
		CLOSE(THIS)
		return
	
	ELSE
	
		ll_codigo = this.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")
		SELECT nom_instalacion into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_codigo
		and sgd_instalacion.bdi_job =0  //DBE 11/01/2000
		;
		IF SQLCA.SQLCode = 100 THEN
			ls_nom_instalacion = string(ll_codigo)
		END IF
		ls_nom_instalacion = fg_remplaza(ls_nom_instalacion, '"', ' ')	
		this.tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ls_nom_instalacion
		
		If tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"estado_actual")=fgci_incidencia_resuelta  THEN
			lu_comunic.is_comunic.Accion_llamada = "Consulta"
			tab_1.is_accion_llamada="Consulta"
		End if
		
		tab_1.tabpage_formulario.d_inf_general.fpr_habilitar_campos(lu_comunic.is_comunic.Accion_llamada) 
		tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")

		// Miro si la Incidencia es de calidad
		fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.tabpage_formulario.d_inf_general.object.alcance[1]) 
		IF fw_incidencia_de_operaciones() THEN
			fw_inst_afectadas_operaciones()
		END IF	
	END IF
//	lw_barra.uo_barra.barra.f_amplia(35)
ELSE
	IF lu_comunic.is_comunic.Accion_llamada="Consulta" or lu_comunic.is_comunic.Accion_llamada="Mantenimiento" THEN
		this.title="Consulta de la Incidencia"	
		is_title=this.title
		tab_1.il_nro_incidencia = lu_comunic.is_comunic.longval3
		i_hay_datos=iu_inc_2003_nu.fnu_obtener_datos(tab_1.tabpage_formulario.d_inf_general,lu_comunic.is_comunic.longval3)	
		tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
		tab_1.ii_tipo_incid	= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")		
		tab_1.of_iniciar_estados_oper()
		
		tab_1.tabpage_ot.d_lista_brigadas_ot.&
				Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))	
		 
		IF	tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
			// Se asigna a la datawindow d_datos_interrup el dataobject adecuado
			// en funcion de si en operaciones se han interrumpido acometidas o CT, y de si
			// se esta o no en la ventana de historicos
			tab_1.of_componer_dw_interrupciones()
		END IF
		
		IF i_hay_datos=0 THEN
			if isvalid(lw_barra) then
				close(lw_barra)
			end if
			CLOSE(THIS)
			RETURN
	
		ELSE
			ll_codigo = this.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")
			SELECT NVL(nom_instalacion, :ll_codigo) into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_codigo 
			and sgd_instalacion.bdi_job = 0 //DBE 11/01/2000
			;
			
			IF SQLCA.SQLCode = 100 THEN
				ls_nom_instalacion = string(ll_codigo)
			END IF
			ls_nom_instalacion = fg_remplaza(ls_nom_instalacion, '"', ' ')	
			this.tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ls_nom_instalacion
			
			tab_1.of_iniciar_estados_oper()		
			fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.tabpage_formulario.d_inf_general.object.alcance[1]) 
			IF fw_incidencia_de_operaciones() THEN
				fw_inst_afectadas_operaciones()
			END IF

			tab_1.tabpage_formulario.d_inf_general.fpr_habilitar_campos(lu_comunic.is_comunic.Accion_llamada) 
			tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")
		END IF
	END IF
END IF

//lw_barra.uo_barra.barra.f_amplia(37)
//SFP-JHE DEO12-00000219 
//Cargamos el valor de tiempo maximo parametrizado 
tab_1.ii_valtiempomax = integer(fg_valor_parametro("TIEMPO_MAX")	)
if tab_1.ii_valtiempomax < 0 then
	tab_1.ii_valtiempomax = 0
end if
//SFP-JHE DEO12-00000219

IF lu_comunic.is_comunic.Accion_llamada="Consulta" or &
	lu_comunic.is_comunic.Accion_llamada="Mantenimiento" or &
	lu_comunic.is_comunic.Accion_llamada="Modificacion" THEN

	tab_1.il_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia")

	
	//  CARGO DE DROPDOWN CON LOS TIPOS DE INCIDENCIAS,
	//	 PROGRAMADA INCLUIDA
	DataWindowChild ldw_child
	tab_1.tabpage_formulario.d_inf_general.GetChild ('tipo_incidencia', ldw_child)
	ldw_child.SetTransObject (SQLCA)
	ldw_child.Retrieve (0) //Con parametro 0 para sacar todos tipos

	tab_1.ii_estado_mant = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"estado_mantenimiento")
	gi_est_mant = tab_1.ii_estado_mant
	
	//lw_barra.uo_barra.barra.f_amplia(39)
	tab_1.ii_tipo_incid = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")
	tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"ot")
	tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
	tab_1.of_iniciar_estados_oper()
	
	if tab_1.ii_estado_oper > fgci_incidencia_pendiente then
		tab_1.tabpage_ot.d_datos_ot.Retrieve( &
				tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))
	end if

	//lw_barra.uo_barra.barra.f_amplia(41)

	IF tab_1.ii_alcance = fgci_incidencia_de_suministro THEN
		
		ls_dir_aviso =  tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"incidencia_dir_aviso") 
		
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,"nombre_instalacion",ls_dir_aviso)
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,"dir_instalacion",ls_dir_aviso)
		il_aviso_sum = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"primer_aviso")
		
		// Inicializo la incidencia como incidencia de Suministro.
		fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.ii_alcance) 
		
	END IF
	//lw_barra.uo_barra.barra.f_amplia(43)

// Se recuperan los datos de todos los tabpages
		
	// DSA INI 29/03/2000	
	if tab_1.tabpage_ot.d_datos_ot.RowCount() > 0 then
		if tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2 then
			tab_1.fnu_cambiar_ot_tipo('CO')
		else								
			tab_1.fnu_cambiar_ot_tipo('BR')
		end if
	else
		tab_1.fnu_cambiar_ot_tipo('BR')		
	end if
	
	IF lu_comunic.is_comunic.Accion_llamada<>"Consulta" AND &
		tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 1 THEN
		// Se bloquean las brigadas asignadas a la OT que no hayan finalizado su trabajo			
		IF fw_bloquear_brigadas_asignadas(1) = -1 THEN
			// No se han podido bloquear las brigadas
			This.PostEvent('ue_postopen')
			//this.postevent("ue_preclose")
		END IF
	END IF


	tab_1.tabpage_cuadrillas.d_materiales.Retrieve(tab_1.il_nro_incidencia) 
	tab_1.tabpage_acciones.d_lista_acciones_incidencia.Retrieve(tab_1.il_nro_incidencia) 
	//lw_barra.uo_barra.barra.f_amplia(45)
	
	IF tab_1.tabpage_cuadrillas.d_materiales.rowcount() > 0 THEN 
		gi_con_material_averiado = 1
	ELSE
		gi_con_material_averiado = 0
	END IF
	
	// Valida para ver si solo hay una brigada trabajando para mostrar o no el 
	// boton brigada encargada
	li_cant_brigadas= this.tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount()
		
	if li_cant_brigadas > 1 then
		for li_conta= 1 to li_cant_brigadas
			if isnull(this.tab_1.tabpage_ot.d_lista_brigadas_ot.object.f_hasta[li_conta]) then
				li_cont2 ++
			end if
		next
	end if

	if this.tab_1.tipo_ot = 'BR' and li_cont2>1 then 
		this.tab_1.tabpage_ot.bmp_brigada_responsable.visible=true	
	end if
	
	IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
		tab_1.tabpage_interrupciones.dw_afec_parcial_sum.retrieve(tab_1.il_nro_incidencia)
	END IF
	
	//lw_barra.uo_barra.barra.f_amplia(47)
	
	/////////////////   INTERRUPCIONES   ////////////////

	//	accion llamada distinta de "Alta"
	//	tab_1.tabpage_interrupciones.d_lista_otras_inst.Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),tab_1.il_nro_incidencia) 	
//  Comentado por Pacho, la Datawindow d_lista_otras_inst solo traera datos cuando tenga marcada una interrupcion
	IF	tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
		// Se asigna a la datawindow d_datos_interrup el dataobject adecuado
		// en funcion de si en operaciones se han interrumpido acometidas o CT, y de si
		// se esta o no en la ventana de historicos
		//tab_1.of_componer_dw_interrupciones()
		
		IF fw_incidencia_de_operaciones() THEN
			// La incidencia se ha dado de alta desde operaciones
			IF tab_1.tabpage_interrupciones.dw_lista_acometidas.RowCount() > 0 THEN
				// Si hay acometidas interrumpidas se obtienen los datos de la acometida
				// interrumpida sobre d_datos_interrup
				ll_codigo_aco = tab_1.tabpage_interrupciones.dw_lista_acometidas.GetItemNumber(1,"codigo")
				tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,ll_codigo_aco)
				IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 1 AND gi_tension_nivel_min = fgci_baja_tension THEN
					// Si la acometida ha sido interrumpida mas de una vez se
					// habilitan los botones de avanzar y retroceder para que se puedan
					// consultar todas las acometidas
					tab_1.tabpage_interrupciones.pb_avanzar.visible = True
					tab_1.tabpage_interrupciones.pb_avanzar.enabled = True
					tab_1.tabpage_interrupciones.pb_anterior.visible = True
					tab_1.tabpage_interrupciones.pb_anterior.enabled = False
				ELSE
					tab_1.tabpage_interrupciones.pb_avanzar.visible = False
					tab_1.tabpage_interrupciones.pb_anterior.visible = False
				END IF
				IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 THEN //AND gi_tension_nivel_min = fgci_baja_tension THEN
					ls_fase_afectada = tab_1.tabpage_interrupciones.d_datos_interrup.GetItemString(1, 'sgd_valor_descripcion')
					tab_1.of_mostrar_fases_int(ll_fila_primera, ls_fase_afectada)
				END IF
			END IF
			
		ELSE
			// La incidencia con perdida se ha dado de alta desde el OpenSgi.
			// Se obtienen sobre d_datos_interrup todos los datos de todas las interrupciones
			tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,0)
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Retrieve(tab_1.il_nro_incidencia, fgci_tipo_ct, &
													fgci_tipo_subestacion_at,fgci_tipo_salida_at, fgci_tipo_subestacion, &
													fgci_tipo_salida_mt,fgci_tipo_ct,fgci_tipo_transformador,fgci_tipo_salida_de_baja)
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Setsort("c_icono_num D")
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.sort()
			IF NOT fw_incidencia_de_operaciones() THEN
				IF lu_comunic.is_comunic.accion_llamada <> "Consulta" THEN
					IF tab_1.of_bloquea_interrupciones() = -1 THEN
						ib_post_activate = True
						this.postevent("ue_preclose")
					END IF
				END IF
			END IF
	
			// Inserto en la dw_interrup_ant las interrupciones existentes al momento de abrir
			//lw_barra.uo_barra.barra.f_amplia(49)
		
			//	Inserto en el arbol las interrupciones existentes
			tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),0,2)
			tab_1.tabpage_interrupciones.tv_1.fw_buscar_interrupciones(tab_1.il_nro_incidencia)	
		END IF
		
	END IF
				
	//lw_barra.uo_barra.barra.f_amplia(51)
	tab_1.l_si_valido=0

END IF

IF lu_comunic.is_comunic.accion_llamada = "Consulta" THEN
	tab_1.tabpage_formulario.d_inf_general.Modify("f_deteccion.background.color = " + gs_gris)
	tab_1.tabpage_observaciones.mle_observaciones.displayonly = True
	tab_1.tabpage_observaciones.mle_observaciones.pointer = "Arrow!"
ELSE
	tab_1.tabpage_observaciones.mle_observaciones.displayonly = False
END IF		

//lw_barra.uo_barra.barra.f_amplia(53)
// Carga las datawindows de seguimiento con los estado existentes
// El 1 es porque desde el open de la ventana no se si resuelve mant, le paso 1 por 
// defecto y en el selectionchanged del tabpage lo evaluo
iu_ema_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_mantenimientos,0)

//iu_eop_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_operaciones,tab_1.ii_ind_calidad)
//tab_1.fnu_obte_estados_oper() PACHO
tab_1.fnu_obte_estados_mant()
//lw_barra.uo_barra.barra.f_amplia(55)

// Si estoy dando de alta una incidencia sobre una instalacion 
// que ya tiene una OT asignada, seteo los estados en operaciones
// Esto se debe hacer aqui porque ya cargue la dw de seguimiento

IF lu_comunic.is_comunic.accion_llamada = "Alta" or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" THEN
 		//lw_barra.uo_barra.barra.f_amplia(57)
	IF lu_comunic.is_comunic.longval4 > 0 THEN
		ldt_f_detec = tab_1.tabpage_formulario.d_inf_general.GetItemDateTime(1,"f_deteccion")
		
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_pendiente,"f_alta",ldt_f_detec)
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_pendiente,"nomenclatura","PT")
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_pendiente,"est_oper",1)
		
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"f_alta",ldt_fecha_brigada_mas_vieja)
		
	END IF

	//lw_barra.uo_barra.barra.f_amplia(59)

	// Actualizo variables globales
	gi_resuelve_mant = 0
	gi_est_mant = 0
	gi_est_oper = tab_1.ii_estado_oper
	
END IF
//lw_barra.uo_barra.barra.f_amplia(61)		

// Cargo las fechas de los estados 
//tab_1.idt_fec_deteccion = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_pendiente,"f_alta")

// En el caso de que ii_incidencia_enviado_brigada = 0, es que se trata de una incidencia
// procedente de SCADA sin tener estado EB. Si no hay estado EB no se obtiene la fecha
IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
	tab_1.idt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_enviado_brigada,"f_alta")
END IF

// Si la incidencia es imprevista sin perdidas y se ha dado de alta desde operaciones se
// hace invisible el tabpage de interrupciones. En el caso de que la incidencia se haya 
// dado de alta desde el OpenSgi, no se hace invisible para permitir que la incidencia
// pueda convertirse en una incidencia imprevista con perdida
IF tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
	
	IF fw_incidencia_de_operaciones() THEN
		tab_1.tabpage_interrupciones.visible = False
	ELSE
		tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),0,2)
	END IF
	
// Para el resto de las incidencias sin perdidas se hace el tabpage invisible
ELSEIF tab_1.ii_alcance = fgci_incidencia_de_suministro or tab_1.ii_tipo_incid = fgci_incidencia_calidad &
	or (tab_1.ii_alcance = fgci_incidencia_sin_interrupcion AND tab_1.ii_tipo_incid <> fgci_incidencia_imprevista &
		 AND tab_1.ii_tipo_incid <> fgci_incidencia_programada) THEN

	// Deshabilito la opcion de marcar interrupciones
	tab_1.tabpage_interrupciones.visible = False
	//tab_1.of_iniciar_estados_oper()
END IF

if tab_1.ii_alcance=fgci_incidencia_con_interrupcion then // si es incidencia con perdida
	tab_1.idt_fecha_er = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_en_reposicion,"f_alta")
	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
else
//	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
//	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
	SetNull(tab_1.idt_fecha_er)
end if










//lw_barra.uo_barra.barra.f_amplia(63)
IF lu_comunic.is_comunic.Accion_llamada = "Alta_nivel_suministro" OR &
		lu_comunic.is_comunic.Accion_llamada = "Alta_nivel_instalacion"THEN
	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(1,"f_alta",lu_comunic.is_comunic.datval1)

END IF

// Cargo fechas de estados mantenimiento
tab_1.idec_nro_instalacion_afectada = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins")
//tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot")
//lw_barra.uo_barra.barra.f_amplia(65)
IF tab_1.tabpage_acciones.mle_observacion_accion_incidencia.Text = '' OR &
	IsNull(tab_1.tabpage_acciones.mle_observacion_accion_incidencia.Text) THEN
	tab_1.frn_habilitar_obs_accion(False)
END IF

// Solo para eliminar el problema de que aparece el formulario en blanco
tab_1.tabpage_formulario.d_inf_general.SetRedraw(True)

// Pregunto por si la incidencia viene del modulo de descargos, para visualizar la opcion
// de menu de interrupciones del descargo
if tab_1.ii_tipo_incid=fgci_incidencia_programada then
	lm_menu.m_consultar.m_interrupcionesdeldescargo.visible = TRUE
	lm_menu.m_consultar.m_interrupcionesdeldescargo.toolbaritemvisible = TRUE
	lm_menu.m_consultar.m_interrupcionesdeldescargo.enabled = true
	lm_menu.m_consultar.m_descargoasociado.visible = TRUE
	lm_menu.m_consultar.m_descargoasociado.toolbaritemvisible = TRUE
	lm_menu.m_consultar.m_descargoasociado.enabled = true
	// LFE: Mejora Incidencia: 1/276978 se cambia la validacion que controla la visibilidad de la opcion de menu, ya que no era correcta
	lm_menu.m_consultar.m_generarintdescargo.visible = (lu_comunic.is_comunic.Accion_llamada <> "Consulta") AND tab_1.ii_alcance = fgci_incidencia_con_interrupcion AND fg_verifica_parametro("INT_DESC_INCIDENCIAS") AND fw_incidencia_de_operaciones()=FALSE
	lm_menu.m_consultar.m_generarintdescargo.toolbaritemvisible = lm_menu.m_consultar.m_generarintdescargo.visible
else
	lm_menu.m_consultar.m_interrupcionesdeldescargo.visible = FALSE
	lm_menu.m_consultar.m_interrupcionesdeldescargo.toolbaritemvisible = FALSE
	lm_menu.m_consultar.m_interrupcionesdeldescargo.enabled = false
	lm_menu.m_consultar.m_descargoasociado.visible = false
	lm_menu.m_consultar.m_descargoasociado.toolbaritemvisible = false
	lm_menu.m_consultar.m_descargoasociado.enabled = false
end if

if lu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim" then
	lm_menu.m_consultar.m_instalacionafectada.enabled=false
end if

tab_1.tabpage_observaciones.mle_observaciones.Text = tab_1.f_devolver_observaciones(tab_1.tabpage_formulario.d_inf_general)	
tab_1.tabpage_observaciones.mle_observaciones_mnto.Text = tab_1.f_devolver_observaciones_mnto(tab_1.tabpage_formulario.d_inf_general)	

if tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada &
	and NOT isnull(tab_1.tabpage_formulario.d_inf_general.object.st_causa.text) &
	and tab_1.tabpage_formulario.d_inf_general.object.st_causa.text <> "" &
	and lu_comunic.is_comunic.Accion_llamada<> "Consulta" then
	
	//tab_1.tabpage_formulario.st_2.visible = true
end if



/////////////////////////////////////////////////////////////////////////////////////

//Solo muestro el TAB de Maniobras cuando exista alguna y este OPERACION integrado
if fw_incidencia_de_operaciones() then
	if tab_1.ii_alcance = fgci_incidencia_con_interrupcion then
		tab_1.tabpage_maniobras.visible = true
	END IF
	
	// solo muestro tabpage de indisponibilidades en el caso de que la incidencia sea de operacion, de alta y el parametro este on
//	if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension") = fgci_alta_tension and &	
//	fg_verifica_parametro("Indisponibilidades activas") = true then
//		gu_comunic1.is_comunic.intval9=0
////		fw_cambiar_tab_indisponibilidades(true)
//		if lu_comunic.is_comunic.Accion_llamada="Consulta" then
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 1
//		else
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 0
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = true
//		end if
//	end if  --Agregar mas tarde


	//lw_barra.uo_barra.barra.f_amplia(67) //JME 15/07/09


//	AHM(19/05/2008)
//	if fg_verifica_parametro("Indisponibilidades activas") = true then
////		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_causa'
//		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_causa_nuevo'
//	//JME 12/05/09
//		datawindowchild ldwchild_causa
//		tab_1.tabpage_maniobras.dw_maniobras.GetChild('cod_causa', ldwchild_causa)
//		ldwchild_causa.SetTransObject(SQLCA)
//		ldwchild_causa.Retrieve()
//	else
////		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras'
//		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_nuevo'
//	end if //Agregar mas tarde
//	lw_barra.uo_barra.barra.f_amplia(69) //JME 15/07/09

	//fw_maniobras(tab_1.il_nro_incidencia)														//Se modifica la sql del dw de maniobras para que aparezcan las maniobras que correspondan en cada pais

	//lw_barra.uo_barra.barra.f_amplia(71) //JME 15/07/09


// GNU 17-4-2006. Incidencia 0/422579
if tab_1.ii_estado_oper > fgci_incidencia_pendiente then
		tab_1.tabpage_ot.d_datos_ot.Retrieve( &
				tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))
	end if
		
	IF fw_incidencia_de_operaciones() and fw_enviar_operacion(tab_1.ii_tipo_incid) and tab_1.ii_estado_oper<> fgci_estado_anulado  then

		lm_menu.m_consultar.m_operacion.enabled=false
		lm_menu.m_consultar.m_operacion.visible=false
		lm_menu.m_consultar.m_operacion.toolbaritemvisible=false
	end if
	tab_1.tabpage_maniobras.enabled = true
	
	//lw_barra.uo_barra.barra.f_amplia(73) //JME 15/07/09

end if
//else // GNU 6-10-2006
//	if	fg_verifica_parametro("Indisponibilidades activas") = true then
//		gu_comunic1.is_comunic.intval9=0
//
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.InsertRow(0)
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.settransobject(sqlca)
//		
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.InsertRow(0)
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.settransobject(sqlca)
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
//	
//		//lw_barra.uo_barra.barra.f_amplia(75) //JME 15/07/09
//
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.settransobject(sqlca)
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.retrieve(tab_1.il_nro_incidencia)
//
//		tab_1.tabpage_indisponibilidades.visible = true
//		if lu_comunic.is_comunic.Accion_llamada = "Alta" then// GNU 6-10-2006
//			tab_1.tabpage_indisponibilidades.enabled = false
//		else
//		SELECT tipo_instalacion into :ii_tipo_instalacion from sgd_instalacion where nro_instalacion = :tab_1.idec_nro_instalacion_afectada;
//  		 if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,'tip_tension')=fgci_alta_tension or &
//			 ii_tipo_instalacion= fgci_tipo_subestacion or &
//			 ii_tipo_instalacion= fgci_tipo_salida_mt then
//			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
//			tab_1.of_cargar_indisponibilidad(tab_1.idec_nro_instalacion_afectada)
//
//			//lw_barra.uo_barra.barra.f_amplia(77) //JME 15/07/09
//			
//			ll_fila= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.find("nro_incidencia= " + string(tab_1.il_nro_incidencia) + " and nro_instalacion = " + string (tab_1.idec_nro_instalacion_afectada), 1, tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.RowCount())
//			if ll_fila >0 then
//				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.SetRow(ll_fila)
//				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.ScrollToRow(ll_fila)
////				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
//				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
//			else
//				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
//			end if
//			else
//			tab_1.tabpage_indisponibilidades.enabled = false	
//		  END IF
//		  
//		  SELECT ENR
//		  INTO :tab_1.il_ENR
//		  FROM SGD_INCIDENCIA
//		  WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
//		  using sqlca;
//		  
//		  IF sqlca.sqlcode<0 THEN
//			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se ha podido obtener datos de SGD_INCIDENCIA")
//		  ELSE
//			tab_1.tabpage_indisponibilidades.em_1.text= string(tab_1.il_ENR)
//		  END IF
//		end if
//		long ll_res
//		ll_res=tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTabOrder("tip_interrupcion",0)
////		fw_cambiar_tab_indisponibilidades(false)
//		if lu_comunic.is_comunic.Accion_llamada="Consulta" then
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 1
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = false
//			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.enabled=false
//		else
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 0
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = true
//			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
//		end if
////	end if // FIN GNU
//end if  --Agregar mas tarde
//
///////////////////////////////////////////////////////////////////////////////////////

//lw_barra.uo_barra.barra.f_amplia(79) //JME 15/07/09

//iu_inc_2005_nu.fnu_cargo_det_interr(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  
// Agregar mas tarde

if tab_1.f_inserta_datos_brig() = false then
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=0")
else
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=1")
end if

if gb_mantenimiento = true & 
	and tab_1.ii_tipo_incid <> fgci_incidencia_programada &
	and tab_1.ii_alcance <> fgci_incidencia_de_suministro Then

	tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible = true
	tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = true
end if

//lw_barra.uo_barra.barra.f_amplia(81) //JME 15/07/09

//tab_1.f_deshab_tabs(true)--agregar mas tarde

//IF tab_1.ii_estado_oper = fgci_estado_anulado THEN
//	lu_comunic.is_comunic.Accion_llamada="Consulta"
//	tab_1.is_accion_llamada = "Consulta"
//END IF --Agregar mas tarde


if	lu_comunic.is_comunic.Accion_llamada="Consulta" then
	tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("desc.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("desc.Edit.DisplayOnly=yes")
	tab_1.tabpage_formulario.d_inf_general.modify("desc.protect=0")
	tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.background.color="+gs_gris)

	tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.protect=1")
	tab_1.tabpage_formulario.st_1.visible= false
	lm_menu.m_consultar.m_instalacionafectada.enabled = false
	lm_menu.m_archivo.m_grabar.enabled = false
	tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.protect=1")
	tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.background.color="+gs_gris)
	tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.protect=1")
	tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.background.color="+gs_gris)
// Modificado por Sgo. Unificacion.
//	tab_1.tabpage_observaciones.mle_observaciones.backcolor = rgb(192,192,192)
	tab_1.tabpage_observaciones.mle_observaciones.backcolor = long(gs_gris)
// Fin. Sgo.
	tab_1.tabpage_observaciones.mle_observaciones.textcolor = rgb(0,0,255)
	tab_1.tabpage_ot.rb_1.enabled = FALSE
	tab_1.tabpage_ot.rb_2.enabled = FALSE
	tab_1.tabpage_ot.tab_lista_brigadas.enabled = false
	tab_1.tabpage_ot.dw_lista_contratas.enabled = false
	tab_1.tabpage_ot.dw_ambito.visible=false
	tab_1.tabpage_acciones.mle_observacion_accion_incidencia.DisplayOnly = True
	tab_1.tabpage_acciones.mle_observacion_accion_incidencia.BackColor = long(gs_gris)
end if 
//lw_barra.uo_barra.barra.f_amplia(83)

// Se comprueba si se trata de una incidencia agrupada.  En caso
// de ser asi se hace visible la opcion de menu que permite consultar las incidencias
// agrupadas
IF tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"sgd_incidencia_nro_agrupacion") > 0 THEN 
	
	lm_menu.m_consultar.m_incidenciasagrupadas.visible = TRUE
	lm_menu.m_consultar.m_incidenciasagrupadas.toolbaritemvisible = true
ELSE
	lm_menu.m_consultar.m_incidenciasagrupadas.visible = FALSE
	lm_menu.m_consultar.m_incidenciasagrupadas.toolbaritemvisible = FALSE
END IF

IF lu_comunic.is_comunic.accion_llamada <> "Consulta" & 
	AND tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada AND tab_1.ii_estado_oper <= fgci_incidencia_en_reposicion  then

	IF tab_1.tabpage_ot.d_lista_brigadas_ot.Find("isnull(f_hasta)", 1, tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount()) <= 0 and tab_1.ib_ind_scada=false THEN
		//w_operaciones.setfocus()
		w_genapp_frame.setfocus()
		gnv_msg.f_mensaje("AI104","","",ok!)
	END IF
END IF 

IF lu_comunic.is_comunic.Accion_llamada="Consulta" AND fg_verifica_parametro('nuevos_tip_inc') then
   tab_1.tabpage_formulario.d_inf_general.modify("sgd_incidencia_ind_obligada.protect=1")
end if

//lw_barra.uo_barra.barra.f_amplia(85)

fw_open_ext()

//if NOT isvalid(lw_barra) then OPEN(lw_barra,THIS)

//lw_barra.uo_barra.barra.f_amplia(89)
//IF fw_incidencia_de_operaciones() THEN	
//	il_sesion_operacion =  gu_rf_servidor_operacion.of_devuelve_sesion() 
//	if tab_1.is_accion_llamada="Consulta" then 
//			if gu_rf_servidor_operacion.of_avisar_consulta_incidencia(tab_1.il_nro_incidencia,ls_mensaje) = 0 then 
//			//	w_operaciones.setfocus()
//			w_genapp_frame.setfocus()
//			 messagebox("Atencion","No se puede refrescar la incidencia debido al siguiente error:"+ char(10)+char(13)+ls_mensaje)
//			end if
//	end if
//end if// --Agregar mas tarde

//lw_barra.uo_barra.barra.f_amplia(91)


int			li_nroOt					//N$$HEX1$$fa00$$ENDHEX$$mero de la OT
string		ls_estado				//Estado Wireless del aviso 

//AHM (19/12/2007)
IF gi_pais = 6 THEN					//Comprobamos que est$$HEX2$$e1002000$$ENDHEX$$en EPSA
	IF tab_1.tabpage_ot.d_datos_ot.rowCount() > 0 THEN			//Comprobamos que hay OT
		li_nroOt = tab_1.tabpage_ot.d_datos_ot.getItemNumber(1, "nro_ot")
		
		SELECT gi_avisos.est_wireless
		INTO	 :ls_estado
		FROM	 gi_avisos, gi_ot
		WHERE	 gi_avisos.nro_aviso = gi_ot.nro_aviso AND
				 gi_ot.nro_ot = (SELECT ot
				 					  FROM sgd_incidencia
									  WHERE nro_incidencia = :tab_1.il_nro_incidencia);
									  

		IF ls_estado = 'A' OR ls_estado = 'S' THEN			//El estado wireless del aviso es aceptado o resuelto
			tab_1.tabpage_formulario.d_inf_general.enabled = FALSE
			tab_1.tabpage_observaciones.mle_observaciones.enabled = FALSE
			tab_1.tabpage_ot.dw_ambito.enabled = FALSE
			tab_1.tabpage_ot.d_crit_seleccion.enabled = FALSE
			tab_1.tabpage_ot.rb_1.enabled = FALSE
			tab_1.tabpage_ot.rb_2.enabled = FALSE
			tab_1.tabpage_ot.d_lista_brigadas_ot.enabled = FALSE
			tab_1.tabpage_ot.d_datos_ot.enabled = FALSE
			tab_1.tabpage_ot.dw_lista_contratas.enabled = FALSE
			tab_1.tabpage_cuadrillas.d_materiales.enabled = FALSE 
			tab_1.tabpage_interrupciones.tv_1.enabled = FALSE
			tab_1.tabpage_interrupciones.d_lista_otras_inst.enabled = FALSE
			tab_1.tabpage_interrupciones.d_datos_interrup.enabled = FALSE
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.enabled = FALSE
//			tab_1.tabpage_acciones.mle_observaciones_accion_incidencia.enabled = FALSE
//			tab_1.tabpage_acciones.d_lista_acciones_incidencias.enabled = FALSE
			tab_1.tabpage_acciones.d_lista_acciones.enabled = FALSE
//			tab_1.tabpage_materiales.d_materiales.enabled = FALSE
//			tab_1.tabpage_materiales.cb_agregar.enabled = FALSE
			tab_1.tabpage_otros.dw_otros.enabled = FALSE
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.enabled = FALSE
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.enabled = FALSE
			tab_1.tabpage_indisponibilidades.em_1.enabled = FALSE
			tab_1.tabpage_indisponibilidades.tv_2.enabled = FALSE
		END IF
		
	END IF
END IF
tab_1.tabpage_interrupciones.visible=false
tab_1.tabpage_maniobras.visible=false
lm_menu.m_consultar.m_situacinclimatolgica.visible=false
lm_menu.m_consultar.m_situacinclimatolgica.enabled=false
THIS.triggerEvent("ue_open2")

//lw_barra.uo_barra.barra.f_amplia(100)
//lw_barra.visible=false
//CLOSE (lw_barra)
//this.setredraw(true)
//this.setfocus

close(w_msg)









	
end event

event ue_instalacion_afectada;//Estructura para comunicarse con w_2120 (seleccion de instalaciones) //  gu_comunic.is_comunic.intval1    numero de centro
//  gu_comunic.is_comunic.intval2    numero de cmd
//  gu_comunic.is_comunic.intval3    numero de mesa

Boolean lb_instalacion_afectada=False
SetPointer(Hourglass!)

THIS.fnu_resetear_var_comunicaciones()
l_si_valido=True
fgnu_resetear_s_comunicaciones(gu_comunic)
ib_valido=true
tab_1.tabpage_formulario.d_inf_general.accepttext()
Yield()  //ingresa al evento itemchange para ver si existe un error.
IF ib_valido=False THEN    //si existio un error en los campos 
	Return
END IF


////////////////////// Instalacion afectada//////////////////////////
IF tab_1.tabpage_formulario.cbx_blackout.Checked = True THEN
	lb_instalacion_afectada=False
Else
	IF isnull(tab_1.tabpage_formulario.d_inf_general.getitemdecimal(1,"nombre_ins")) then
		IF tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")=fgci_incidencia_de_suministro THEN		
			tab_1.tabpage_formulario.cbx_blackout.enabled = false
		ELSE
			tab_1.tabpage_formulario.cbx_blackout.enabled = true
		END IF
	ELSE
		tab_1.tabpage_formulario.cbx_blackout.enabled = false
	END IF
	IF	iu_inc_2003_rn.frn_menu_hab_instalacion_afectada&
		(tab_1.tabpage_formulario.d_inf_general,lu_comunic.is_comunic.accion_llamada) THEN
		lb_instalacion_afectada=True
	ELSE
		lb_instalacion_afectada=False
	END IF
END IF

IF lb_instalacion_afectada=False THEN
	return
END IF

gu_comunic.is_comunic.intval1=gi_nro_centro
gu_comunic.is_comunic.intval2=gi_nro_cmd
gu_comunic.is_comunic.intval3=gi_nro_puesto

IF gb_operador_cmd THEN		// filtra por centro y cmd solo
	gu_comunic.is_comunic.intval4 = 2
ELSE
	gu_comunic.is_comunic.intval4 = 1
END IF
gu_comunic.is_comunic.intval6 = tab_1.ii_tipo_incid

tab_1.tabpage_formulario.d_inf_general.accepttext()
gu_comunic.is_comunic.Accion_Llamada="Seleccion"
gu_comunic.is_comunic.Programa_Retorno=" "
gu_comunic.is_comunic.Accion_Retorno=" "
gu_comunic.is_comunic.longval1=0
gu_comunic.is_comunic.longval2=0
gu_comunic.is_comunic.longval3=0
gu_comunic.is_comunic.strval1=""
gu_comunic.is_comunic.strval2=""
gu_comunic.is_comunic.intval5=0
gu_comunic.is_comunic.programa_llamante="iw_2301"

OpenWithParm(w_2120_identificacion_instalacion, gu_comunic.is_comunic.programa_llamante)

//AHM (21/07/2009) Mejora 1/446555
IF fg_verifica_parametro('CARGA AUTOMATICA OBSERVACIONES SEGUIMIENTO') THEN
	fw_bloqueaObsSeguimiento()
END IF

end event

event ue_grabar;//Evento ue_grabar
//Graba la incidencia.
//Condiciones que se deben cumplir, que tenga perfil de
//	operador de alta 0
//	encargado de turno
// operador de baja 
int i, li_estado_der,li_hay_error, li_der_mant_en_corte, li_clase_aviso, li_estado_bd,li_conta,li_modificado 
string ls_prim_nom_calle,ls_retorna,ls_modificado
long ll_duracion_rs, ll_duracion_sr, ll_duracion_er, ll_duracion_eb,ll_inst_int,ll_nro_instalacion
long ll_duracion_mant, ll_duracion_mant_corte,ll_incidencia_inst,ll_contador
long ll_cantidad_avisos = 0, ll_prim_nro_aviso, ll_prim_nro_puerta, ll_incidencias[]
long ll_cod_causa,ll_nro_ot, ll_nro_agrupacion, ll_nro_incid_agrup;
DateTime ldt_fecha_st, ldt_fecha_ultimo_estado_mant, ldt_fec_deteccion2,ldt_f_alta_int,ldt_f_actual_int
datetime ldt_f_actual
string ls_observaciones, ls_mensaje
long ll_dur_st_al, ll_dur_eb_al
md_ingreso_incidencias lm_menu
this.triggerevent(activate!)

datetime ldt_f_rep_indisponibilidad, ldt_f_maniobra
long ll_cod_maniobra, ll_fila, ll_nro_descargo

int li_codigocausa

//NCA-INICIO.DDAG-1783.20150304.
integer li_cod_accion_incidencia
//NCA-FIN.DDAG-1783.20150304.

//VMC.INI.DDAG-6453.14/07/2016
integer li_lista_elem_operador, li_lista_elem_fallado
//VMC.FIN.DDAG-6453.14/07/2016

//TDA.INI.EDM1.25042017
string li_lista_rep_red, li_lista_origen_incidencia
//TDA.FIN.EDM1.25042017

//TDA.INI.EDM-2.03052017
string li_desc_causa_subtipo
//TDA.FIN.EDM-2.03052017

lm_menu = This.menuid

// SI  ES INCIDENCIA DE OPERACIONES ES NECESARIO COMPROBAR SI SE HA CAIDO EL SERVIDOR O HA HABIDO UN CORTE EN LA COMUNICACION,QUE PUEDA HACER
// QUE LA INCIDENCIA NO ESTE BLOQUEADA

IF fw_incidencia_de_operaciones() THEN	
	if gu_rf_servidor_operacion.of_actualiza_icono() = 0  then
		messagebox("Atencion","Se va a cerrar la ventana, debido a que no se puede conectar con el servidor de Operacion")
		ib_post_activate  = TRUE
		//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
		tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
		close(this)
		RETURN
	elseif gu_rf_servidor_operacion.of_devuelve_sesion() <> il_sesion_operacion then // SE HA PRODUCIDO UN CORTE 
		messagebox("Atencion","Se va a cerrar la ventana, debido a que se ha producido un corte en la comunicacion con el servidor de Operacion")
		ib_post_activate  = TRUE
		//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
		tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
		close(this)

		RETURN
	end if
end if

if IsNull(This.tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa')) AND &
	tab_1.ii_estado_oper = fgci_incidencia_resuelta THEN
	
	tab_1.ib_error_en_causa = TRUE
	Messagebox("Atencion", "Debe seleccionar una causa")
	This.tab_1.SelectTab(1)
	This.tab_1.tabpage_formulario.st_1.visible = TRUE
	//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
	Return
END IF

if tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa') = fgci_cod_causa_desconocida AND &
	tab_1.ii_estado_oper = fgci_incidencia_resuelta  THEN
	
	tab_1.ib_error_en_causa = TRUE
	Messagebox("Atencion", "Debe seleccionar una causa que no sea desconocida")
	This.tab_1.SelectTab(1)
	This.tab_1.tabpage_formulario.st_1.visible = TRUE
	//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
	Return
END IF

//TDA.INI.EDM-2.03052017 Validar que la sub causa no se guarde vac$$HEX1$$ed00$$ENDHEX$$a cuando la incidencia va a quedar como resuelta
IF (IsNull(This.tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa_subtipo')) OR &
This.tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa_subtipo') = 0) THEN
	
	tab_1.ib_error_en_causa_subtipo = TRUE
	Messagebox("Atencion", "Debe seleccionar una sub causa")
	This.tab_1.SelectTab(1)
	This.tab_1.tabpage_formulario.st_18.visible = TRUE
	//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
	Return
END IF
tab_1.ib_error_en_causa_subtipo = FALSE

//TDA.FIN.EDM-2.03052017

//NCA-INICIO.DDAG-1783.20150304.Validamos que se escoja una acci$$HEX1$$f300$$ENDHEX$$n de incidencia antes de grabar.
li_cod_accion_incidencia = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'cod_accion_inc')

IF li_cod_accion_incidencia = 0 Or IsNull(li_cod_accion_incidencia) THEN	
//	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar una acci$$HEX1$$f300$$ENDHEX$$n de incidencia")
	gnv_msg.f_mensaje("AI04","acci$$HEX1$$f300$$ENDHEX$$n de incidencia","",ok!)
	This.tab_1.SelectTab(1)
	RETURN 
END IF
//NCA-FIN.DDAG-1783.20150304.

//VMC.INI.DDAG-6453.14/07/2016
li_lista_elem_operador = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'cod_elem_operado')

IF li_lista_elem_operador = 0 Or IsNull(li_lista_elem_operador) THEN	
	Messagebox("Atencion", "Debe seleccionarse previamente un elemento operador")
	This.tab_1.SelectTab(1)
	RETURN 
END IF

li_lista_elem_fallado = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'cod_elem_fallado')

IF li_lista_elem_fallado = 0 Or IsNull(li_lista_elem_fallado) THEN	
	Messagebox("Atencion", "Debe seleccionarse previamente un elemento fallado")	
	This.tab_1.SelectTab(1)
	RETURN 
END IF
//VMC.FIN.DDAG-6453.14/07/2016

//TDA.INI.EDM1.25042017
li_lista_rep_red = tab_1.tabpage_formulario.d_inf_general.GetItemString(1, 'rep_red')

IF li_lista_rep_red = "" Or IsNull(li_lista_rep_red) THEN	
	Messagebox("Atencion", "Debe indicar Rtro Obj/Rpro Red")
	This.tab_1.SelectTab(1)
	RETURN 
END IF

li_lista_origen_incidencia = tab_1.tabpage_formulario.d_inf_general.GetItemString(1, 'origen_incidencia')

IF li_lista_origen_incidencia = "" Or IsNull(li_lista_origen_incidencia) THEN	
	Messagebox("Atencion", "Debe indicar el origen de la incidencia")
	This.tab_1.SelectTab(1)
	RETURN 
END IF
//TDA.FIN.EDM1.25042017

//AHU (02/03/2008)
int li_causaGenerica

SELECT to_number(valor)
INTO   :li_causaGenerica
FROM   sgd_valor
WHERE  codif = 'C_GN';

//AHM (30/06/2008)
li_codigoCausa = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa')
IF li_codigoCausa = li_causaGenerica THEN					//Comprueba que es la causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.ib_error_en_causa = TRUE
	Messagebox("Atencion", "Debe seleccionar una causa que no sea la gen$$HEX1$$e900$$ENDHEX$$rica")
	THIS.tab_1.SelectTab(1)
	THIS.tab_1.tabpage_formulario.st_1.visible = TRUE
	//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
	RETURN
END IF
tab_1.ib_error_en_causa = FALSE

if tab_1.tabpage_ot.d_lista_brigadas_ot.accepttext() <> 1 then
	tab_1.tabpage_ot.setfocus()
	//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
	return
end if

if tab_1.tabpage_ot.d_datos_ot.accepttext() <> 1 then
	tab_1.tabpage_ot.setfocus()
	//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
	return
end if

if tab_1.tabpage_formulario.d_inf_general.accepttext() <> 1 then
	tab_1.tabpage_formulario.setfocus()
	//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
	tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
	return
end if

This.SetFocus()

//AHM (31/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
IF gb_interfaseOsgm AND tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt THEN
	IF tab_1.of_validacionesSolicitudMant() = -1 THEN
		tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
		RETURN
	END IF
END IF

//SRE OCEN 22/04/2008
IF fg_valor_parametro("OCEN")=1 OR gb_interfaseOsgm THEN
	//AHU (12/11/2009) Error al insertar OCEN por causa gen$$HEX1$$e900$$ENDHEX$$rica
	//IF tab_1.tabpage_ocen.uo_ot_ocen.ib_cambios=TRUE OR  tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt THEN
	IF tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt THEN
		//IF tab_1.tabpage_ocen.uo_ot_ocen.dw_ot_ocen.RowCount()=0 THEN
		tab_1.tabpage_ocen.uo_ot_ocen.wf_inserta_solicitud(0)
		tab_1.tabpage_ocen.uo_ot_ocen.triggerEvent("ue_carga_datos")
		//END IF
		tab_1.tabpage_ocen.uo_ot_ocen.ib_cambios=FALSE
		IF gb_interfaseOsgm THEN
//			This.tab_1.tabpage_formulario.d_inf_general.setItem(1, 'estado_mantenimiento', 2)	
//			This.tab_1.ii_estado_mant = 2
//			gi_resuelve_mant = 1
//			This.tab_1.tabpage_seguimiento.chk_resolucion_mant.Checked = TRUE
			tab_1.tabpage_ocen.uo_ot_ocen.wf_cargaSolicitud()
		END IF
	END IF 
END IF
//FIN SRE OCEN 22/04/2008
ldt_f_actual = fgnu_fecha_actual()

// Selecciono todos los tabpages
// para ejecutar todas la opciones del selectionchanged
// y luego me posiciono en el tabpage que estaba
int li_seleccionado
int li_oldindex,li_newindex,li_ret

if tab_1.ii_estado_oper=fgci_incidencia_pendiente then
	ls_observaciones = tab_1.tabpage_observaciones.mle_observaciones.text
	if len(trim(ls_observaciones)) = 0 or isnull(ls_observaciones) and gb_obs_obligatorias = true then
		
		//MessageBox("Atencion","Debe ingresar alguna observacion.")
		gnv_msg.f_mensaje("AI46","","",ok!)
		//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
		tab_1.tabpage_ocen.uo_ot_ocen.ib_insertarOt = FALSE
		Return 
	end if
end if

//// Se comprueba que en SR se haya seleccionado una causa para las incidencias 
//// que no proceden de SCADA
//IF tab_1.ii_estado_oper=fgci_incidencia_servicio_repuesto AND &
//	tab_1.ib_ind_scada = false THEN
//	
//	IF ISNULL(tab_1.tabpage_formulario.d_inf_general.object.st_causa.text) OR &
//		tab_1.tabpage_formulario.d_inf_general.object.st_causa.text="" THEN
//		
//		gnv_msg.f_mensaje("AI57","","",ok!)
//		return
//	END IF
//END IF

li_ret = tab_1.f_changing(tab_1.ii_viejo_index,0)

if not isvalid(this) then
	return
end if

if li_ret=-1 then
//	uo_barra.visible=false
	if tab_1.ib_mensaje=true then
		tab_1.fnu_habilito_f_hasta()
	end if
	return
end if


//***************************************

//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If fw_verifica_otros_graba() = 0 Then Return
//***************************************
//**  OSGI 2001.1  	15/05/2001			**

//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//uo_barra.barra.f_resetea_barra()
//uo_barra.barra.f_amplia(0)
//uo_barra.gb_1.text="Actualizando Incidencia..."
//uo_barra.visible=true
//uo_barra.barra.f_amplia(3)
SetPointer(HourGlass!)

This.SetRedraw(False)
tab_1.SetRedraw(False)
tab_1.tabpage_formulario.SetRedraw(False)
tab_1.tabpage_ot.SetRedraw(False)
tab_1.tabpage_cuadrillas.SetRedraw(False)
tab_1.tabpage_interrupciones.SetRedraw(False)
tab_1.tabpage_seguimiento.SetRedraw(False)
//uo_barra.barra.f_amplia(10)

FOR li_oldindex = 1 to 7
	//uo_barra.barra.f_amplia(10 + (li_oldindex * 3))
	li_newindex = li_oldindex + 1
	if li_newindex = 8 then
		li_newindex = 1
	end if

	li_ret = tab_1.f_changing(li_oldindex,0)//pacho
	if li_ret = -1 then
	//	uo_barra.visible=false
		This.SetRedraw(true)
		tab_1.SetRedraw(true)
		tab_1.tabpage_formulario.SetRedraw(true)
		tab_1.tabpage_ot.SetRedraw(true)
		tab_1.tabpage_cuadrillas.SetRedraw(true)
		tab_1.tabpage_interrupciones.SetRedraw(true)
		tab_1.tabpage_seguimiento.SetRedraw(true)
		if tab_1.ib_mensaje=true then
			tab_1.fnu_habilito_f_hasta()
		end if
		return
	end if

	tab_1.f_changed(li_oldindex,li_newindex)
NEXT
tab_1.tabpage_formulario.SetRedraw(True)

tab_1.tabpage_ot.SetRedraw(True)
tab_1.tabpage_cuadrillas.SetRedraw(True)
tab_1.tabpage_interrupciones.SetRedraw(True)
tab_1.tabpage_seguimiento.SetRedraw(True)

tab_1.SetRedraw(True)
This.SetRedraw(True)

// Si llamaron solamente para consultar, no se graba la incidencia.
IF tab_1.is_accion_llamada <> "Consulta" OR tab_1.ii_estado_oper = fgci_incidencia_pte_explotacion THEN 
	// Si viene de gestion de avisos, comprueba que no tubiera una ot y actualiza
	if lu_comunic.is_comunic.longval4=0 and tab_1.is_accion_llamada = "Alta_nivel_instalacion" or &
		tab_1.is_accion_llamada = "Alta_nivel_suministro" then
//		tab_1.f_grabar_ultima_ot()
	end if
	
	if isvalid(gu_rf_servidor_operacion) then
	
		if	fg_verifica_parametro("Indisponibilidades activas") = true then
			for ll_contador= 1 to tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.rowcount() 
				ll_nro_instalacion= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.object.nro_instalacion[ll_contador]	
				ll_fila= tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.find("nro_instalacion= " + string (ll_nro_instalacion) + " and not isnull (f_reposicion_origen)", 1, tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.RowCount())
				if ll_fila> 0 then
					do while ll_fila <> 0 
						tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.deleterow(ll_fila)
						ll_fila= tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.find("nro_instalacion= " + string (ll_nro_instalacion) + " and not isnull (f_reposicion_origen)", ll_fila + 1, tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.RowCount())
					loop
				else
					ldt_f_rep_indisponibilidad= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.object.f_reposicion[ll_contador]	
					if isnull(ldt_f_rep_indisponibilidad) then
						ll_fila= tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.find("nro_instalacion= " + string (ll_nro_instalacion) + " and isnull (f_reposicion_origen)", 1, tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.RowCount())
						if ll_fila= 0 then
							ll_cod_maniobra= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.object.t_mapertura[ll_contador]	
						
							IF NOT isnull(ll_cod_maniobra) THEN
								SELECT fecha_maniobra
								INTO :ldt_f_maniobra
								FROM SGD_MANIOBRA
								WHERE cod_maniobra= :ll_cod_maniobra;
							ELSE
								ll_cod_maniobra= 0
							END IF
							// Dar de alta la incidencia a operaci$$HEX1$$f300$$ENDHEX$$n
							if gu_rf_servidor_operacion.of_abrir_indisponibilidad (ll_nro_instalacion, tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"), ll_cod_maniobra, ldt_f_maniobra, ls_retorna) = 0 then
								messagebox("Atencion",ls_retorna,Exclamation!,ok!)
								ib_grabo_bien = false
							//	uo_barra.visible=false
								lm_menu.m_archivo.m_grabar.enabled=false
								return
							end if
						end if
					else
						if gu_rf_servidor_operacion.of_resuelve_indisponibilidad (ll_nro_instalacion, ls_retorna) = 0 then
							messagebox("Atencion",ls_retorna,Exclamation!,ok!)
							ib_grabo_bien = false
					//		uo_barra.visible=false
							lm_menu.m_archivo.m_grabar.enabled=false
							return
						end if
					end if
				end if
			next
			
			for ll_contador= 1 to tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.RowCount()
				ldt_f_rep_indisponibilidad= tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.object.f_reposicion[ll_contador]
				if not isnull(ldt_f_rep_indisponibilidad) then
					if gu_rf_servidor_operacion.of_resuelve_indisponibilidad (ll_nro_instalacion, ls_retorna) = 0 then
						messagebox("Atencion",ls_retorna,Exclamation!,ok!)
						ib_grabo_bien = false
//						uo_barra.visible=false
						lm_menu.m_archivo.m_grabar.enabled=false
						return
					end if
				end if
			next							
	end if
end if
	
//	uo_barra.barra.f_amplia(33)
	
	// Desbloqueamos los registros de interrupciones, como esta en otro objeto de transaccion desbloqueo todo lo bloq	ueado con el tab
	gnu_u_transaction.uf_rollback(this.tab_1,true) 
	
	//JME 17/02/2010 Volvemos al c$$HEX1$$f300$$ENDHEX$$digo anterior: AMH Inc100169742
//	//AHM 08/09/2009 Creaci$$HEX1$$f300$$ENDHEX$$n orden 
//   wf_crearOrdenTrabajo(tab_1.idec_nro_instalacion_afectada)
//
//	////AHM(13/07/2009) Mejora 1/446555
//	//fw_cargarObservacionesSeguimiento()
	
   //AHM(13/07/2009) Mejora 1/446555
   fw_cargarObservacionesSeguimiento()
	
	//Fin JME
	
	//Se aceptan los cambios en la datawindows.
	tab_1.tabpage_formulario.d_inf_general.AcceptText() 
	tab_1.tabpage_ot.d_datos_ot.AcceptText()
	tab_1.tabpage_ot.d_lista_brigadas_ot.AcceptText() 
	tab_1.tabpage_cuadrillas.d_materiales.AcceptText() 
	tab_1.tabpage_interrupciones.d_datos_interrup.AcceptText()
	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.AcceptText()
	tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.AcceptText()
	tab_1.tabpage_acciones.d_lista_acciones_incidencia.AcceptText()
	IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
		tab_1.tabpage_interrupciones.dw_afec_parcial_sum.AcceptText()
	END IF

	// Se borran de la datawindow de interrupciones los registros
	// que se insertaron solo para mostrarlos, o sea que no son 
	// interrupciones

	// Solo entra cuando sean incidencias con perdida	
	IF (tab_1.ii_alcance = fgci_incidencia_con_interrupcion) and &
	    tab_1.ii_tipo_incid <> fgci_incidencia_calidad THEN
		//HSE
		IF NOT fw_incidencia_de_operaciones() THEN
			//li_total_interrup = fw_borrar_registros_dw_nulos(tab_1.tabpage_interrupciones.d_datos_interrup)
			tab_1.tabpage_interrupciones.d_datos_interrup.update()
			
			//PACHO
			if gb_operaciones_inst = true then
				if tab_1.tabpage_interrupciones.dw_lista_int_comunes.rowcount() > 0 then
					for li_conta = 1 to tab_1.tabpage_interrupciones.dw_lista_int_comunes.rowcount() 
						ldt_f_alta_int = tab_1.tabpage_interrupciones.dw_lista_int_comunes.object.f_alta[li_conta]
						ldt_f_actual_int = tab_1.tabpage_interrupciones.dw_lista_int_comunes.object.f_actual[li_conta]
						ll_inst_int = tab_1.tabpage_interrupciones.dw_lista_int_comunes.object.nro_instalacion[li_conta]
						ll_incidencia_inst= tab_1.tabpage_interrupciones.dw_lista_int_comunes.object.nro_incidencia[li_conta]
						update sgd_interrupcion 
						set int_duplicada = 1
						where f_actual = :ldt_f_actual_int and 
								 f_alta = :ldt_f_alta_int and 
								 nro_instalacion = :ll_inst_int and 
								 nro_incidencia = :ll_incidencia_inst ;
					next
				end if
			end if
			
		END IF
	END IF

//	uo_barra.barra.f_amplia(35)

	// Esta funcion hace comprobaciones, no actualiza en BD

	// LLENAR ESTADISTICAS DE INTERRUPCIONES
	iu_inc_2005_nu.fnu_cargo_det_interr(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  
	
//	uo_barra.barra.f_amplia(36)
	IF iu_inc_2003_nu.fnu_grabar_incidencia(tab_1.tabpage_formulario.d_inf_general,lu_comunic.is_comunic.accion_llamada) THEN

		if (tab_1.ii_estado_oper = fgci_incidencia_resuelta or tab_1.ii_estado_oper = fgci_incidencia_pte_explotacion) and tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia") = 2  then
			IF tab_1.ii_tipo_incid = fgci_incidencia_programada and ((tab_1.ii_ind_Act_grafica = 1 and tab_1.ii_cant_trabajos > 0) OR (tab_1.ii_pe > 0)) then 
				if tab_1.of_pasar_explotacion(tab_1.il_nro_incidencia) = -1 then
					ib_grabo_bien = false
					gnv_msg.f_mensaje('EX39',"","",Ok!)
//					uo_barra.visible=false
					gnu_u_transaction.uf_rollback()
					return
				end if
			else
				tab_1.fnu_finalizar_descargo()
			end if
		end if

		IF fw_incidencia_de_operaciones() THEN

			IF tab_1.ii_modifica_causa = 1 THEN
				// Actualiza maniobras
				tab_1.tabpage_maniobras.dw_maniobras.update()
			END IF

			IF isvalid(gu_rf_servidor_operacion) then

				ll_cod_causa = 	tab_1.tabpage_formulario.d_inf_general.object.causa[1]
				ll_nro_ot = tab_1.il_nro_ot
				
				if isnull(ll_cod_causa) then ll_cod_causa = 0
				if isnull(ll_nro_ot) then ll_nro_ot = 0
		
				// indisponibilidades.
				
				tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.accepttext()
				
////				if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension") = fgci_alta_tension and &
//				// GNU 7-8-2007. Indisponibilidades operacion
//				// Tengo que mandar todas a operaci$$HEX1$$f300$$ENDHEX$$n. 
//				// Miro una a una si tiene fecha de reposici$$HEX1$$f300$$ENDHEX$$n.
//				// Si tiene fecha de reposici$$HEX1$$f300$$ENDHEX$$n --> Cerrar indisponibilidad
//				// Si no tiene fecha de reposici$$HEX1$$f300$$ENDHEX$$n --> Se d$$HEX2$$e1002000$$ENDHEX$$de alta o se modifica la indisponibilidad
//				if	fg_verifica_parametro("Indisponibilidades activas") = true then
//					for ll_contador = 1 to tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.rowcount() 
//						ll_nro_instalacion= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.object.nro_instalacion[ll_contador]	
//						ldt_f_rep_indisponibilidad= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.object.f_reposicion[ll_contador]	
//						if not isnull(ldt_f_rep_indisponibilidad) then
//							if gu_rf_servidor_operacion.of_resuelve_indisponibilidad (ll_nro_instalacion, ls_retorna) = 0 then
//								messagebox("Atencion",ls_retorna,Exclamation!,ok!)
//								ib_grabo_bien = false
//								uo_barra.visible=false
//								lm_menu.m_archivo.m_grabar.enabled=false
//								return
//							end if
//						else
//							gu_rf_servidor_operacion.of_resuelve_indisponibilidad (ll_nro_instalacion, ls_retorna)
////							ldt_f_maniobra= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.object.f_reposicion[ll_contador]	
//						   ll_cod_maniobra= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.object.t_mapertura[ll_contador]	
//							
//							IF NOT isnull(ll_cod_maniobra) THEN
//								SELECT fecha_maniobra
//								INTO :ldt_f_maniobra
//								FROM SGD_MANIOBRA
//								WHERE cod_maniobra= :ll_cod_maniobra;
//							ELSE
//								ll_cod_maniobra= 0
//							END IF
//							// Dar de alta la incidencia a operaci$$HEX1$$f300$$ENDHEX$$n
//							if gu_rf_servidor_operacion.of_abrir_indisponibilidad (ll_nro_instalacion, il_nro_incidencia, ll_cod_maniobra, ldt_f_maniobra, ls_retorna) = 0 then

//								messagebox("Atencion",ls_retorna,Exclamation!,ok!)
//								ib_grabo_bien = false
//								uo_barra.visible=false
//								lm_menu.m_archivo.m_grabar.enabled=false
//								return
//							end if
//							end if
//						next
////					for ll_contador = 1 to tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.rowcount()
////						ll_nro_instalacion = tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.nro_instalacion[ll_contador]
////						ls_modificado = tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.modificado[ll_contador]
////						li_modificado = integer(ls_modificado)
////						if li_modificado = 2 and (tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.f_alta[ll_contador] <> &
////							tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.f_reposicion[ll_contador]) then
////							if gu_rf_servidor_operacion.of_resuelve_indisponibilidad (ll_nro_instalacion, ls_retorna) = 0 then
////								messagebox("Atencion",ls_retorna,Exclamation!,ok!)
////								ib_grabo_bien = false
////								uo_barra.visible=false
////								lm_menu.m_archivo.m_grabar.enabled=false
////								return
////							else
////								tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.modificado[ll_contador] = '1'
////							end if
////						end if
////					next
//				end if
		
				if tab_1.ii_estado_oper < fgci_incidencia_resuelta or tab_1.ii_estado_oper = fgci_incidencia_pte_explotacion then
					
					if gu_rf_servidor_operacion.of_avisar_mod_incidencia(tab_1.il_nro_incidencia,tab_1.ii_estado_oper,ll_nro_ot,ll_cod_causa,ls_retorna) = 0 then
						messagebox("Atencion",ls_retorna,Exclamation!,ok!)
						ib_grabo_bien = false
//						uo_barra.visible=false
						lm_menu.m_archivo.m_grabar.enabled=false
						return
					end if
					
					if tab_1.ii_avisar_oop_eb <> 2 then
						if gu_rf_servidor_operacion.of_avisar_poner_eb(tab_1.il_nro_incidencia,tab_1.ii_estado_oper,ls_retorna,tab_1.ii_avisar_oop_eb) = 0 then
							messagebox("Atencion",ls_retorna,Exclamation!,ok!)
							ib_grabo_bien = false
//							uo_barra.visible=false
							lm_menu.m_archivo.m_grabar.enabled=false
							tab_1.ii_avisar_oop_eb = 2
							return
						end if
					end if
					
				else
					
					SELECT est_actual 
					INTO :li_estado_bd
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia;
					
					IF SQLCA.SQLCODE = 0 THEN
						if li_estado_bd <> fgci_incidencia_resuelta then
																				
							// Se da de baja la simulacion asociada a la incidencia
							if tab_1.ii_estado_oper = fgci_incidencia_resuelta AND ib_grabo_bien THEN
								IF gu_rf_servidor_operacion.of_baja_simulacion_incidencia(tab_1.il_nro_incidencia, ls_mensaje) = 0 THEN
									Messagebox("Atencion", "No se ha podido grabar la incidencia debido al siguiente error: " + ls_mensaje)
											
									ib_grabo_bien = false
//									uo_barra.visible=false
									return
								ELSE
						
									// Si se trata de una agrupacion de Incidencias se dan de baja las simulaciones
									// de todas las incidencias contenidas en la agrupacion
									ll_nro_agrupacion = tab_1.tabpage_formulario.d_inf_general.GetitemNumber(1, 'sgd_incidencia_nro_agrupacion')
									
									IF ll_nro_agrupacion > 0 AND NOT IsNull(ll_nro_agrupacion) THEN
										DECLARE lc_inc_agrupadas CURSOR FOR
										SELECT NRO_INCIDENCIA 
										FROM GI_INCIDENCIA_AGRUPADA
										WHERE NRO_AGRUPACION = :ll_nro_agrupacion;
											
										OPEN lc_inc_agrupadas;
											
										IF SQLCA.SQLCode = 0 THEN
						
											FETCH lc_inc_agrupadas 
											INTO :ll_nro_incid_agrup;
													
											DO WHILE SQLCA.SQLCode = 0 AND ib_grabo_bien
												IF gu_rf_servidor_operacion.of_baja_simulacion_incidencia(ll_nro_incid_agrup, ls_mensaje) = 0 THEN
													Messagebox("Atencion", "No se ha podido grabar la incidencia debido al siguiente error: " + ls_mensaje)
													ib_grabo_bien = FALSE
//													uo_barra.visible=false
													CLOSE lc_inc_agrupadas;
													return
												END IF
													
												FETCH lc_inc_agrupadas 
												INTO :ll_nro_incid_agrup;
											LOOP
												
											CLOSE lc_inc_agrupadas;

										ELSE
											Messagebox("Atencion", "No se ha podido grabar la incidencia debido que no se han podido dar de baja todas las simulaciones de la incidencia agrupada.")
											ib_grabo_bien = FALSE
//											uo_barra.visible=false
											return
										END IF
									END IF
								END IF
							END IF

								
							if gu_rf_servidor_operacion.of_avisar_baja_incidencia(tab_1.il_nro_incidencia,ls_retorna) = 0 then
								messagebox("Atencion",ls_retorna,Exclamation!,ok!)
								ib_grabo_bien = false
//								uo_barra.visible=false
								return
							end if	
						end if
					end if	
	
				end if
			END IF
		END IF
	
//	IF iu_inc_2003_nu.fnu_grabar_incidencia(tab_1.tabpage_formulario.d_inf_general,lu_comunic.is_comunic.accion_llamada) THEN
	   
//		uo_barra.barra.f_amplia(38)
	// Si esta resuelta, calculo las potencias afectada, contratada y 
	// cantidad de clientes afectados por las interrupciones 
	// y actualizo el formulario (necesario para el batch)
	//
	// NOTA
	// En el campo "pot_afectada" estoy grabando la suma de las potencias
	// instaladas de las instalaciones con interrupcion, y en el campo
	// "pot_contratada" la suma de las potencias contratadas de 
	// las instalaciones con interrupcion.
		
		ib_grabo_bien = True
		//AHM(01/03/20010)
		IF tab_1.ii_estado_oper = fgci_incidencia_servicio_repuesto OR tab_1.ii_estado_oper = fgci_incidencia_pte_explotacion THEN
			ldt_fec_deteccion2 = tab_1.tabpage_formulario.d_inf_general.GetItemDateTime(1,"f_deteccion")
			ll_duracion_sr = fg_duracion_minutos(ldt_fec_deteccion2,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta"))
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"incidencia_duracion_sr",ll_duracion_sr)
		END IF
		//AHM (01/03/2010)
		IF tab_1.ii_estado_oper = fgci_incidencia_resuelta OR tab_1.ii_estado_oper = fgci_incidencia_pte_explotacion THEN
			
			ldt_fec_deteccion2 = tab_1.tabpage_formulario.d_inf_general.GetItemDateTime(1,"f_deteccion")

			IF tab_1.ii_incidencia_enviado_brigada = fgci_incidencia_enviado_brigada THEN
				ll_duracion_eb = fg_duracion_minutos(ldt_fec_deteccion2,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(fgci_incidencia_enviado_brigada,"f_alta"))
			ELSE
				ll_duracion_eb = 0 
			END IF

//			if This.tab_1.ii_tipo_incid = fgci_incidencia_calidad &
//				or This.tab_1.ii_alcance = fgci_incidencia_de_suministro &
//				or This.tab_1.ii_alcance = fgci_incidencia_sin_interrupcion then
				
			ll_duracion_sr = fg_duracion_minutos(ldt_fec_deteccion2,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta"))
			ll_duracion_rs = fg_duracion_minutos(ldt_fec_deteccion2,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta"))


			IF tab_1.ii_incidencia_en_reposicion > 0 THEN
				ll_duracion_er = fg_duracion_minutos(ldt_fec_deteccion2,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_en_reposicion,"f_alta"))
			ELSE
				ll_duracion_er = 0				
			END IF
			ll_duracion_rs = fg_duracion_minutos(ldt_fec_deteccion2,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta"))
			
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"incidencia_tiempo_oper",ll_duracion_rs)
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"duracion_rs",ll_duracion_rs)

			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"duracion_er",ll_duracion_er)
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"duracion_env_brigada",ll_duracion_eb)
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"incidencia_duracion_sr",ll_duracion_sr)
			IF (This.tab_1.ii_alcance = fgci_incidencia_con_interrupcion) THEN
				tab_1.tabpage_formulario.d_inf_general.SetItem(1,"sgd_incidencia_duracion_eb_er",ll_duracion_er - ll_duracion_eb)
				tab_1.tabpage_formulario.d_inf_general.SetItem(1,"sgd_incidencia_duracion_er_sr",ll_duracion_sr - ll_duracion_er)
			ELSE
				tab_1.tabpage_formulario.d_inf_general.SetItem(1,"sgd_incidencia_duracion_eb_er",0)
				tab_1.tabpage_formulario.d_inf_general.SetItem(1,"sgd_incidencia_duracion_er_sr",ll_duracion_sr - ll_duracion_eb)
			END IF		
			
//			uo_barra.barra.f_amplia(40)
			// Si fue derivada a mantenimiento calculo los tiempos en mantenimiento
			//AHU (03/04/2009) Estados mantenimiento ocen
			/*IF tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_mantenimiento") > 0 THEN
				ldt_fecha_st = tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.GetItemDateTime(1,"f_alta")
				uo_barra.barra.f_amplia(42)

				//	Obtengo el estado en oper cuando derive a mant
				li_estado_der = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Find("ind_env_mant=1 or ind_env_mant=3",1,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.RowCount())
				uo_barra.barra.f_amplia(43)
				//	Verifico si fue derivada a mantenimiento en corte
				IF li_estado_der < fgci_incidencia_servicio_repuesto THEN
					IF ldt_fecha_st > tab_1.idt_fecha_sr THEN
						li_der_mant_en_corte = 0
					ELSE
						li_der_mant_en_corte = 1
					END IF
				ELSE
					li_der_mant_en_corte = 0
				END IF
			
				tab_1.tabpage_formulario.d_inf_general.SetItem(1,"der_mant_en_corte",li_der_mant_en_corte)
				uo_barra.barra.f_amplia(45)
				
				// Si fue derivada a mantenimiento en corte
				IF li_der_mant_en_corte = 1 THEN
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"corte_st_al",ll_dur_st_al)
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"corte_eb_al",ll_dur_eb_al)
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"corte_sr",ll_duracion_sr)
				
					IF tab_1.idt_fecha_sr > ldt_fecha_ultimo_estado_mant THEN
						ll_duracion_mant_corte = fg_duracion_minutos(ldt_fecha_st,ldt_fecha_ultimo_estado_mant)
					ELSE
						ll_duracion_mant_corte = fg_duracion_minutos(ldt_fecha_st,tab_1.idt_fecha_sr)
					END IF
					uo_barra.barra.f_amplia(48)
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"duracion_mant_corte",ll_duracion_mant_corte)
				
				// Si no fue derivada en corte	
				ELSEIF li_der_mant_en_corte = 0 THEN
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"sincorte_st_al",ll_dur_st_al)
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"sincorte_eb_al",ll_dur_eb_al)
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"sincorte_sr",ll_duracion_sr)
					tab_1.tabpage_formulario.d_inf_general.SetItem(1,"duracion_mant",ll_duracion_mant)
					
				END IF		// Fin de derivada en corte
				uo_barra.barra.f_amplia(50)
			END IF		// Fin de incid. derivada a mantenimiento*/
		
//			string ls_propiedad, ls_fenosa
//			// OBTENEMOS EL CODIGO DE PROPIEDAD DE FENOSA
//			
//			  SELECT "SGD_VALOR"."VALOR"  
//   			 INTO :ls_fenosa  
//			   FROM "SGD_VALOR"  
//			   WHERE ( "SGD_VALOR"."CODIF" = 'PROP' ) AND  
//         	("SGD_VALOR"."CODIGO" = 3 )   ;
//				if isnull(ls_fenosa) then ls_fenosa=" "
						

//			uo_barra.barra.f_amplia(55)
			
			// Cantidad de clientes afectados que no fueron por instalaciones
//			IF (tab_1.ii_alcance = fgci_incidencia_con_interrupcion) THEN
//					 
//				SELECT count(*) INTO :ll_cant_cli_no_x_inst FROM GI_AVISOS &
//					where gi_avisos.nro_instalacion is null &
//					and gi_avisos.nis_rad is not null &
//					and gi_avisos.nro_incidencia = :tab_1.il_nro_incidencia;
//			END IF
//			uo_barra.barra.f_amplia(57)
//			uo_barra.barra.f_amplia(58)
//			uo_barra.barra.f_amplia(67)
		
			///////////////////  FIN DE CALCULO INCIDENCIAS CALIDAD ////////////////////////
		
			// Cantidad de avisos, primer aviso y direccion del primer aviso
			IF (tab_1.ii_alcance = fgci_incidencia_con_interrupcion) THEN
				select count(*) into :ll_cantidad_avisos  from gi_avisos &
					where gi_avisos.nro_incidencia = :tab_1.il_nro_incidencia;
			END IF
//			uo_barra.barra.f_amplia(69)
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"cant_avisos",ll_cantidad_avisos)
			if ll_cantidad_avisos > 0 THEN
				
				select nro_aviso,nom_calle,num_puerta &
				into :ll_prim_nro_aviso, :ls_prim_nom_calle, :ll_prim_nro_puerta &
				from gi_avisos &
				where f_alta = (select min(f_alta) from gi_avisos where nro_incidencia=:tab_1.il_nro_incidencia);
				
				tab_1.tabpage_formulario.d_inf_general.setitem(1,"primer_aviso",ll_prim_nro_aviso)                   
				tab_1.tabpage_formulario.d_inf_general.setitem(1,"incidencia_dir_aviso",ls_prim_nom_calle+" "+string(ll_prim_nro_puerta))
			end if
//			uo_barra.barra.f_amplia(70)
		
		END IF		// Fin de incidencia resuelta
	
		//	Se borran los registros de las datawindow de seguimiento
		// que tengan fecha de alta nula (la incidencia no paso por ese estado)
	
		fw_borrar_registros_dw_nulos(tab_1.tabpage_seguimiento.d_seguimiento_operaciones)
		fw_borrar_registros_dw_nulos(tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento)
//		uo_barra.barra.f_amplia(72)
	
		///////////
		// Solo para pruebas	
		// seteo hora de alta con la fecha de alta porque no acepta nulo
		// y las observaciones que estaban en nulo con espacio en blanco
		For i = 1 to tab_1.tabpage_seguimiento.d_seguimiento_operaciones.RowCount()
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(i,"h_alta",tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(i,"f_alta"))
			if isnull(tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemString(i,"observacion")) then 
				tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(i,"observacion"," ")
			end if
		next
//		uo_barra.barra.f_amplia(75)
	
		For i = 1 to tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.RowCount()
			if isnull(tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.GetItemString(i,"observacion")) then 
				tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.SetItem(i,"observacion"," ")

			end if
		
			if isnull(tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.GetItemString(i,"descripcion")) then 
				tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.SetItem(i,"descripcion"," ")
			end if
		
		next
//		uo_barra.barra.f_amplia(80)
		//////////

		IF fw_incidencia_de_operaciones() THEN
			IF fw_incidencia_modif_anidadas(tab_1.il_nro_incidencia, idt_f_actual) THEN
				// La incidencia ha sido modificada por el trigger de incidencias anidadas
				Messagebox("Atencion", "No se han grabado la modificaciones debido a que el estado de la Incidencia ~r~n" + &
											  "se ha modificado como consecuencia de Maniobras en otras Incidencias o por SCADA~r~n.Se " + & 
											  "refrescaran los datos de la Incidencia.")	
				
				gnu_u_transaction.uf_rollback()  // Se deshacen los cambios
				gu_rf_servidor_operacion.of_fin_cambio(tab_1.il_nro_incidencia,ls_retorna)
				ib_grabo_bien = false
				ib_mostrar_mensaje = false
				This.PostEvent("ue_refresca_mante")
				Return
			END IF
		END IF

		//JME 17/02/2010 Volvemos al c$$HEX1$$f300$$ENDHEX$$digo anterior: AMH Inc100169742
//	   //AHM(13/07/2009) Mejora 1/446555
//	   fw_cargarObservacionesSeguimiento()
		//Fin JME

      //AHM 08/09/2009 Creaci$$HEX1$$f300$$ENDHEX$$n orden 
      wf_crearOrdenTrabajo(tab_1.idec_nro_instalacion_afectada)
      
      //AHM (16/02/2010) Incidencia 0/100169742

		// Grabo en gi_estado_oper y gi_estado_mant
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Update()
		
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.Update()

		tab_1.tabpage_formulario.d_inf_general.Update()
		
		// Se graban las acciones
		tab_1.tabpage_acciones.d_lista_acciones_incidencia.Update()
		
		// Se graban los eltos corte.
		tab_1.fw_grabar_eltos_corte()
		
		// Se graban los posibles cambios sobre las indisponibilidades
			// solo muestro tabpage de indisponibilidades en el caso de que la incidencia sea de operacion, de alta y el parametro este on
//		if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension") = fgci_alta_tension and &

// GNU 17-10-2006. Mejora EPSA
//		if	fg_verifica_parametro("Indisponibilidades activas") = true and tab_1.ib_primera_vez_indisponibilidades = false then
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.update()
//			
//		end if
		if	fg_verifica_parametro("Indisponibilidades activas") = true &
			and tab_1.ib_primera_vez_indisponibilidades = false &
			and fw_incidencia_de_operaciones() then
			// GNU 7-8-2007. Indisponibilidades Operaci$$HEX1$$f300$$ENDHEX$$n
			// Voy a guardar siempre la de datos, la lista la dejo como consulta
//			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.update()
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.update()
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.retrieve(tab_1.il_nro_incidencia)
			UPDATE sgd_incidencia
			SET ENR= :tab_1.il_enr
			WHERE nro_incidencia= :tab_1.il_nro_incidencia
			USING sqlca;
			
			IF sqlca.sqlcode<0 THEN
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ha habido un error al guardar los datos en SGD_INCIDENCIA")
			END IF
		elseif fg_verifica_parametro("Indisponibilidades activas") = true then
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.update()
			
			UPDATE sgd_incidencia
			SET ENR= :tab_1.il_enr
			WHERE nro_incidencia= :tab_1.il_nro_incidencia
			USING sqlca;
			
			IF sqlca.sqlcode<0 THEN
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ha habido un error al guardar los datos en SGD_INCIDENCIA")
			END IF
		end if
		
		// Se graban los suministros asociados a las interrupciones con afectacion parcial
		IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
			tab_1.tabpage_interrupciones.dw_afec_parcial_sum.update()
		END IF
		
		// Se refresca la fecha actual
		idt_f_actual = fw_obtener_f_actual(tab_1.il_nro_incidencia)
		
		// Verifico la existencia de interrupciones anteriores que ahora 
		// no existen para liberar los avisos asociados a dichas interrupciones.
		//uo_barra.barra.f_amplia(82)
		
		IF tab_1.ii_estado_oper=fgci_incidencia_resuelta THEN
			//long ll1, ll2
			//ll1 = Gu_comunic.is_comunic.longval1 
			//ll2 = Gu_comunic.is_comunic.longval2  
			Gu_comunic.is_comunic.longval1 = tab_1.il_nro_incidencia
			Gu_comunic.is_comunic.longval2 = tab_1.ii_estado_oper
		END IF
		
		IF Not fw_incidencia_de_operaciones() THEN
			// LLamo a la funcion que me actualiza otras interrupciones de otras incidencias 
			tab_1.fw_act_otras_inc(ll_incidencias)
		END IF

		//uo_barra.barra.f_amplia(87)
		
		// Si la incidencia es de calidad se procedera a asociar/resolver los avisos.
		fw_asociar_avisos_calidad(tab_1.idec_nro_instalacion_afectada,tab_1.idt_fec_deteccion,tab_1.idt_fecha_sr) //FDO
		// Si la incidencia esta en EB o superior
		IF	 tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount() > 0 then
			
			// Actualizo la tabla gi_ot y gi_brigada_ot
			if tab_1.tipo_ot = 'BR' then		//DSA 23/02/2000
				this.fw_evaluar_brig_desdrag()
			end if				
			li_hay_error=tab_1.tabpage_ot.d_datos_ot.Update()
			li_hay_error=tab_1.of_grabar_ot()
			
			if tab_1.tipo_ot = 'BR' then		//DSA 23/02/2000
				// Libero las brigadas que finalizaron tareas
				// y pongo no disponibles a las que se asignaron
				This.fnu_liberar_brigadas() 
			end if

		END IF		// Fin de incidencia EB
		
		IF NOT fw_incidencia_de_operaciones() THEN	
			// Si hay operaciones no hay que comprobar los valores nulos de la interrupcion
			tab_1.fnu_comprueba_valores_nulos_interrup(tab_1.tabpage_interrupciones.d_datos_interrup)
		END IF
		//uo_barra.barra.f_amplia(88)
		
		IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 THEN		// si tiene alguna interrupcion
			//uo_barra.barra.f_amplia(89)
			//uo_barra.gb_1.text="Asociando Avisos..."
			yield()
//			uo_barra.gb_1.text="Actualizando Incidencia..."
//			uo_barra.p_1.visible=false
			timer(0,this)
//			uo_barra.barra.f_amplia(95)
			
		END IF		// Fin de tiene interrupciones


	
//		uo_barra.barra.f_amplia(96)
		
		// Si es incidencia de suministro, asocio el aviso correspondiente
		IF tab_1.ii_alcance = fgci_incidencia_de_suministro THEN
			fw_asociar_suministro(il_aviso_sum)
		END IF
		
//		uo_barra.p_1.visible=false
		i_vez=2
		
		// Seteo la clase del aviso segun el tipo_incid de la incidencia
		
		if tab_1.ii_tipo_incid=1 then
			li_clase_aviso= 0
		else
			li_clase_aviso = 3
		end if		
		// Si esta en estado EB o superior
		IF  tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada THEN
			// Actualizo los materiales
			tab_1.tabpage_cuadrillas.d_materiales.Update()
			
			// Reseteo la Datawindow donde esta la informacion de las interrupciones parciales
			tab_1.tabpage_interrupciones.dw_sin_interrupcion.reset()
		END IF
		
		// Si vine de gestion de avisos o creo una incidencia que tenga
		// la instalacion en Gest. Avisos, actualizo gi_avisos_res
		// El nro de ot -1 significa que la instalacion tiene una incidencia
		// y es para colocarle el indicativo correspondiente en el arbol
		
		IF (tab_1.is_accion_llamada = "Alta_nivel_instalacion" or &
			 tab_1.is_accion_llamada = "Alta" or &
			 tab_1.is_accion_llamada = "Modificacion") and &
			 tab_1.ii_estado_oper < fgci_incidencia_servicio_repuesto THEN
			
			// Se modifica los registros de la instalacion afectada (una unica instalacion)
			UPDATE "GI_AVISOS_INSTALACION"  
    			SET "IND_INCIDENCIA" = 1,  
				   "F_ACTUAL" = :ldt_f_actual,
					programa='w_2301_asoc'
 			WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :tab_1.idec_nro_instalacion_afectada and 
			 			"GI_AVISOS_INSTALACION"."CLASE_AVISO" = :li_clase_aviso;

			// Se modifican todas la jerarquia de instalaciones de todos los avisos modificados arriba
			UPDATE GI_AVISOS_INSTALACION
				SET F_ACTUAL = :ldt_f_actual
				WHERE NRO_AVISO in (select nro_Aviso from gi_avisos_instalacion WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :tab_1.idec_nro_instalacion_afectada and
						"GI_AVISOS_INSTALACION"."CLASE_AVISO" = :li_clase_aviso);
		
		// GNU 25-6-2007. Incidencia 0/470595
		elseif(tab_1.is_accion_llamada = "Alta_nivel_instalacion" or &
			 tab_1.is_accion_llamada = "Alta" or &
			 tab_1.is_accion_llamada = "Modificacion") and &
			 tab_1.ii_estado_oper >= fgci_incidencia_servicio_repuesto THEN 
		
		long ll_nro_incidencias_instalacion
			 SELECT COUNT(*)
			 INTO :ll_nro_incidencias_instalacion
			 FROM SGD_INCIDENCIA
			 WHERE est_actual< :fgci_incidencia_servicio_repuesto and
			 nro_incidencia<> :tab_1.il_nro_incidencia and 
			 nro_inst_afectada =:tab_1.idec_nro_instalacion_afectada and
			 tip_incidencia= :tab_1.ii_tipo_incid; 
			 if ll_nro_incidencias_instalacion =0 then
			 			// Se modifica los registros de la instalacion afectada (una unica instalacion)
				UPDATE "GI_AVISOS_INSTALACION"  
    			SET "IND_INCIDENCIA" = 0,  
				   "F_ACTUAL" = :ldt_f_actual,
					programa='w_2301_des'
 				WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :tab_1.idec_nro_instalacion_afectada and 
			 			"GI_AVISOS_INSTALACION"."CLASE_AVISO" = :li_clase_aviso;

			// Se modifican todas la jerarquia de instalaciones de todos los avisos modificados arriba
				UPDATE GI_AVISOS_INSTALACION
				SET F_ACTUAL = :ldt_f_actual
				WHERE NRO_AVISO in (select nro_Aviso from gi_avisos_instalacion WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :tab_1.idec_nro_instalacion_afectada and
						"GI_AVISOS_INSTALACION"."CLASE_AVISO" = :li_clase_aviso);

			end if
		// FIN GNU
		END IF
		
	//	uo_barra.barra.f_amplia(97)
		
		// Realizo el retrieve y completo los registros

		// que fueron borrados para hacer el Update
		
		tab_1.fnu_obte_estados_oper()
		tab_1.fnu_obte_estados_mant()
		
	ELSE			// Si no se pudo grabar
		ib_grabo_bien = False
		
	END IF		// Fin de grabar incidencia
	
	//Calculo los clientes afectados
		
	//fw_cal_potencias(tab_1.il_nro_incidencia)
	
	IF (tab_1.ii_tipo_incid = fgci_incidencia_imprevista OR tab_1.ii_tipo_incid = fgci_incidencia_calidad)  THEN

		if ib_resuelta = true or tab_1.ib_derivada_mante = true and gb_mantenimiento = true then
			tab_1.of_deriv_mante(tab_1.il_nro_incidencia,tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta"),tab_1.ib_derivada_mante)
			ib_resuelta = false
			tab_1.ib_derivada_mante = false
		end if
	END IF
	//AHU (02/04/2009) EStado ocen
	fw_actualizaestadoocen()
	
//	uo_barra.barra.f_amplia(98)	
	
	// Si grabo bien, actualizo en la base

	IF ib_grabo_bien THEN
		
		//COMMIT;
		
		gnu_u_transaction.uf_commit()
		
/*		//AHU (09/03/2009) SGI no debe enviar directamente los cambios de estados de los descargos a OCEN
		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (09-06-2008) 
		SELECT NVL("SGD_DESCARGOS"."NRO_DESCARGO",0)
		INTO :ll_nro_descargo
		FROM "SGD_DESCARGOS"  
		WHERE "SGD_DESCARGOS"."NRO_INCIDENCIA" = :il_nro_incidencia   ;

		// Compruebo si se han enviado los ultimos estados del descargo, si no es asi ha habido algun
		// error en el servidor o en la conexion, por eso abrimos la ventana de envio de estado del descargo
		if tab_1.ib_necesita_enviar_estados=TRUE then
			openwithparm(w_7107_envio_estado_descargo_ocen, ll_nro_descargo)
			tab_1.ib_necesita_enviar_estados=FALSE
		end if
		// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (09-06-2008)*/
		
		
		IF fw_incidencia_de_operaciones() and tab_1.ii_estado_oper < fgci_incidencia_resuelta THEN
			if gu_rf_servidor_operacion.of_fin_cambio(tab_1.il_nro_incidencia,ls_retorna) = 0 then
				messagebox("Atencion",ls_retorna)
			end if
		END IF
		
		if isvalid(gu_operaciones) then
			gu_operaciones.of_avisar_sgi(tab_1.il_nro_incidencia)
			
			IF isvalid(gu_control_v_incidencias) THEN
				FOR i = 1 TO UpperBound(ll_incidencias) 
					w_2301_form_incidencia ls_ventana
					ls_ventana = gu_control_v_incidencias.of_busca_ventana(ll_incidencias[i],-1)
					if  not isnull(ls_ventana) then // ESTA ABIERTA
						if ls_ventana.lu_comunic.is_comunic.Accion_llamada = "Consulta" then // SOLO PARA CONSULTA
							gu_control_v_incidencias.of_actualiza_operaciones(ll_incidencias[i],true,-1)	
						end if
					end if			   																														
					
					gu_operaciones.of_avisar_sgi(ll_incidencias[i])
				NEXT
			END IF
		end if
		
		IF NOT fw_incidencia_de_operaciones() THEN

			IF tab_1.tabpage_interrupciones.visible = TRUE THEN
				long ll_item
				//tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,0)
				ll_item = tab_1.tabpage_interrupciones.tv_1.FindItem(RootTreeItem!,0)
				IF ll_item > 0 THEN
					tab_1.tabpage_interrupciones.tv_1.Event clicked(ll_item)
				END IF
			END IF
		END IF

	END IF
	
	fw_desbloq_brig_fin_trab()
	if tab_1.is_accion_llamada = "Alta_nivel_instalacion" or &
		tab_1.is_accion_llamada = "Alta_nivel_suministro" or &
		tab_1.is_accion_llamada = "Alta" then
		IF lu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" THEN
			// si el programa llamante es w_1234_consulta_incidencia se bloquea con este objeto
			gnu_u_transaction.uf_lock(w_1234_consulta_incidencias,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia), fgci_bloqueo_incidencia, tab_1.il_nro_incidencia)
		ELSE
			// el programa llamante es w_1105_avisos_con_alim, se bloquea con este objeto
			gnu_u_transaction.uf_lock(w_1105_avisos_con_alim,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia))
		END IF
		// La incidencia dada de alta se ha grabado. Hay que bloquearla, por si la ventana 
		// no se cierra
		
//		tab_1.f_grabar_ultima_ot()
		tab_1.is_accion_llamada = "Modificacion"
	end if


END IF		// Fin de accion llamada <> consulta
	if tab_1.ib_mensaje=true then
	tab_1.fnu_habilito_f_hasta()
end if
// se desbloquean las brigadas que hayan finalizado su trabajo
//uo_barra.visible=false
tab_1.selecttab(tab_1.control[tab_1.ii_indice])

IF tab_1.ii_Estado_oper = fgci_incidencia_resuelta THEN

//////////// ACA UPDATE 23 MAR 2006
// SI LA INCIDENCIA ES RESUELTA Y TIENE UNA OT ASOCIADA SE ACTUALIZA EN EL ARBOL
  	SELECT NRO_OT
	INTO :ll_nro_ot
	FROM GI_AVISOS_INSTALACION
	WHERE NRO_INSTALACION = :tab_1.idec_nro_instalacion_afectada and 
			 			CLASE_AVISO = :li_clase_aviso;


							 
   IF ll_nro_ot > 0 then
	
	    ll_nro_ot = ll_nro_ot - 1
				
				UPDATE GI_AVISOS_INSTALACION
         	SET NRO_OT = :ll_nro_ot
	         WHERE NRO_INSTALACION = :tab_1.idec_nro_instalacion_afectada 
				AND CLASE_AVISO = :li_clase_aviso;
	
   END IF
	
//////////// FIN ACA UPDATE
	
	lm_menu.m_consultar.m_operacion.enabled = FALSE
	
	IF tab_1.tabpage_otros.visible = FALSE THEN
		lm_menu.m_archivo.m_grabar.enabled = False
	END IF
END IF

//AHU (06/03/2009) -> Desactiva incidencia cuando se ha enviado a OCEN
tab_1.f_deshab_tabs(TRUE)


//uo_barra.barra.f_amplia(100)
end event

event ue_operacion();//AHM 18/02/2010 Certificacion windows XP
//IF isvalid(gu_operaciones) THEN
//				gu_operaciones.of_consultar_incidencia(tab_1.il_nro_incidencia)
IF isvalid(gu_operacionSgi) THEN
				gu_operacionSgi.of_consultar_incidencia(tab_1.il_nro_incidencia)
END IF
end event

event ue_minimizar;if newwidth<1600 then 
  this.title="I-"+string(tab_1.il_nro_incidencia)
else
	this.title= is_title
end if

end event

event ue_refresca();//// Cargar ii_ind_suministro en la variable del tab
int i, li_cant_brigadas, li_conta,li_cont2
long ll_codigo, ll_codigo_aco
string ls_nom_instalacion, lsnull, ls_dir_aviso, ls_fase_afectada
datetime ldt_fecha_brigada_mas_vieja
long ll_fila_primera = 1
md_ingreso_incidencias lm_menu

lm_menu = This.MenuId
setnull(lsnull)
l_si_valido = True
ib_primera_vez = TRUE 
iu_inc_2003_rn.iw_contenedora= this
SetNull(ldt_fecha_brigada_mas_vieja)
//uo_barra.barra.f_resetea_barra()


//if not isvalid(w_barra) then OPEN(W_BARRA,this)

// Lo primero que se hace es comprobar si existe la incidencia
SELECT COUNT(*)
INTO :i
FROM SGD_INCIDENCIA 
WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia;

IF SQLCA.SQLCode <> 0 OR i=0 THEN
	// La incidencia ha sido eliminada
	//w_operaciones.setfocus()
	w_genapp_frame.setfocus()
	Messagebox("Atencion", "Se va a proceder a cerrar la ventana debido a que la incidencia ha sido eliminada por otro usuario.")
	if isvalid(w_barra) then 
//		w_barra.visible=false
//		CLOSE (W_BARRA)
	end if
	
	Close(This)
	Return
END IF

//W_BARRA.UO_BARRA.gb_1.text="Refrescando Incidencia..."
//W_BARRA.UO_BARRA.BARRA.visible=true
//W_BARRA.uo_barra.barra.f_amplia(3)

//Maneja las variables globales:
//			gu_comunic para trabajo y para comunicarse con la ventana llamante 
//			gu_comunic1 para comunicarse con la ventana iw_6201(asignacion de brigada) 
//			gu_comunic2 para comunicarse con la ventana iw_2120 (seleccion_insts)

//Parametros de entrada:
//			Decval1 = nro instalacion afectada 
//			longval2 = nro_aviso
//			longval3 = nro_incidencia
//			strval1 = direccion del aviso			
//			strval3 = fase de la instalacion
//			intval1 = tipo de instalacion
//			intval2 = tipo de tension
//			intval3 = centro			
//			intval4 = cmd
//			intval5 = puesto
//			intval6 = co-nivel
//			datval1 = fecha de alta del aviso 			
//			datval2 = hora de alta del aviso
//			programa_llamante = nombre de la venta o opcion del menu
//			accion_llamada		= Alta nivel suministro
//									  Alta nivel instalacion
//									  Alta							 
//									  Modificacion 
//
//		Parametros de salida
//				intval9 = estado de la incidencia (utilizado por la w_1105_avisos_con_alim
//															para refrescar el arbol o no.)
//
//

//Dependera del perfil del usuario que pueda consultar o modificar
//Si el usuario es de baja no podra modificar el centro , cmd y puesto

SetPointer(HourGlass!)

this.setredraw(false)
tab_1.tabpage_formulario.d_inf_general.SetRedraw(False)
tab_1.tabpage_seguimiento.d_estados_operaciones.Reset()
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Reset()
SetNull(tab_1.idt_fecha_er)
SetNull(tab_1.idt_fecha_sr)
//W_BARRA.uo_barra.barra.f_amplia(8)

dw_brigadas_calendario_rango.SetTransObject(SQLCA)
dw_brigadas_calendario_rango.Retrieve(Datetime(Date(fgnu_fecha_actual())), fgnu_fecha_actual())

// Se deshabilita el checkbox de 'BlackOut'
tab_1.tabpage_formulario.cbx_blackout.Enabled = False

//W_BARRA.uo_barra.barra.f_amplia(10)

// Recupero la lista de acciones
tab_1.tabpage_acciones.d_lista_acciones.Retrieve()

tab_1.tabpage_formulario.d_inf_general.setitem(1,"alcance",tab_1.ii_alcance)

	i_hay_datos=iu_inc_2003_nu.fnu_obtener_datos(tab_1.tabpage_formulario.d_inf_general,tab_1.il_nro_incidencia)	
	tab_1.ii_alcance 		= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
	tab_1.ii_tipo_incid	= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")
	tab_1.of_iniciar_estados_oper()

	tab_1.tabpage_ot.d_lista_brigadas_ot.&
				Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))	

	
	
	IF i_hay_datos=0 THEN
//		if isvalid(W_BARRA) then
//			close(W_BARRA)
//		end if
		CLOSE(THIS)
		return
	// FINAL ALE
	ELSE
	
		ll_codigo = this.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")
		SELECT nom_instalacion into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_codigo
		and sgd_instalacion.bdi_job =0  //DBE 11/01/2000
		;
		IF SQLCA.SQLCode = 100 THEN
			ls_nom_instalacion = string(ll_codigo)
		END IF
		ls_nom_instalacion = fg_remplaza(ls_nom_instalacion, '"', ' ')	
		this.tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ls_nom_instalacion
		
		tab_1.tabpage_formulario.d_inf_general.fpr_habilitar_campos(lu_comunic.is_comunic.Accion_llamada) 
		tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")

		// Miro si la Incidencia es de calidad
		fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.tabpage_formulario.d_inf_general.object.alcance[1]) 
		IF fw_incidencia_de_operaciones() THEN
			fw_inst_afectadas_operaciones()
		END IF	
	END IF
	//if NOT isvalid(W_BARRA) then OPEN(W_BARRA,THIS)
	
	//W_BARRA.uo_barra.barra.f_amplia(15)
	tab_1.il_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia")
	
	//  CARGO DE DROPDOWN CON LOS TIPOS DE INCIDENCIAS,
	//	 PROGRAMADA INCLUIDA
	DataWindowChild ldw_child
	tab_1.tabpage_formulario.d_inf_general.GetChild ('tipo_incidencia', ldw_child)
	ldw_child.SetTransObject (SQLCA)
	ldw_child.Retrieve (0) //Con parametro 0 para sacar todos tipos

	tab_1.ii_estado_mant = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"estado_mantenimiento")
	gi_est_mant = tab_1.ii_estado_mant
	
	//W_BARRA.uo_barra.barra.f_amplia(20)
	tab_1.ii_tipo_incid = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")
	tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"ot")
	tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
	tab_1.of_iniciar_estados_oper()
	
	if tab_1.ii_estado_oper > fgci_incidencia_pendiente then
		tab_1.tabpage_ot.d_datos_ot.Retrieve( &
				tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))
	end if
			
	//W_BARRA.uo_barra.barra.f_amplia(25)

	IF tab_1.ii_alcance = fgci_incidencia_de_suministro THEN
		
		ls_dir_aviso =  tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"incidencia_dir_aviso") 
		
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,"nombre_instalacion",ls_dir_aviso)
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,"dir_instalacion",ls_dir_aviso)
		il_aviso_sum = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"primer_aviso")
		
		// Inicializo la incidencia como incidencia de Suministro.
	
		fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.ii_alcance) 
		
	END IF
//	W_BARRA.uo_barra.barra.f_amplia(30)

// Se recuperan los datos de todos los tabpages
		
	// DSA INI 29/03/2000	
	if tab_1.tabpage_ot.d_datos_ot.RowCount() > 0 then
		if tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2 then
			tab_1.fnu_cambiar_ot_tipo('CO')
		else								
			tab_1.fnu_cambiar_ot_tipo('BR')
		end if
	else
		tab_1.fnu_cambiar_ot_tipo('BR')		
	end if
	
	tab_1.tabpage_cuadrillas.d_materiales.Retrieve(tab_1.il_nro_incidencia)
	tab_1.tabpage_acciones.d_lista_acciones_incidencia.Retrieve(tab_1.il_nro_incidencia)
//	W_BARRA.uo_barra.barra.f_amplia(35)
	
	IF tab_1.tabpage_cuadrillas.d_materiales.rowcount() > 0 THEN
		gi_con_material_averiado = 1
	ELSE
		gi_con_material_averiado = 0
	END IF

	// Valida para ver si solo hay una brigada trabajando para mostrar o no el 
	// boton brigada encargada
	li_cant_brigadas= this.tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount()
		
	if li_cant_brigadas > 1 then
		for li_conta= 1 to li_cant_brigadas
			if isnull(this.tab_1.tabpage_ot.d_lista_brigadas_ot.object.f_hasta[li_conta]) then
				li_cont2 ++
			end if
		next
	end if

	if this.tab_1.tipo_ot = 'BR' and li_cont2>1 then 
		this.tab_1.tabpage_ot.bmp_brigada_responsable.visible=true	
	end if
	
	IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
		tab_1.tabpage_interrupciones.dw_afec_parcial_sum.retrieve(tab_1.il_nro_incidencia)
	END IF

	//W_BARRA.uo_barra.barra.f_amplia(40)
	
	/////////////////   INTERRUPCIONES   ////////////////
	//	tab_1.tabpage_interrupciones.d_lista_otras_inst.Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),tab_1.il_nro_incidencia) 	

//  Comentado por Pacho, la Datawindow d_lista_otras_inst solo traera datos cuando tenga marcada una interrupcion
	IF	tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
		// Se asigna a la datawindow d_datos_interrup el dataobject adecuado
		// en funcion de si en operaciones se han interrumpido acometidas o CT, y de si
		// se esta o no en la ventana de historicos
		tab_1.of_componer_dw_interrupciones()
		
		IF fw_incidencia_de_operaciones() THEN
			// La incidencia se ha dado de alta desde operaciones
			IF tab_1.tabpage_interrupciones.dw_lista_acometidas.RowCount() > 0 THEN
				// Si hay acometidas interrumpidas se obtienen los datos de la acometida
				// interrumpida sobre d_datos_interrup
				ll_codigo_aco = tab_1.tabpage_interrupciones.dw_lista_acometidas.GetItemNumber(1,"codigo")
				tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,ll_codigo_aco)
				IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 1 AND gi_tension_nivel_min = fgci_baja_tension THEN
					// Si la acometida ha sido interrumpida mas de una vez se
					// habilitan los botones de avanzar y retroceder para que se puedan
					// consultar todas las acometidas
					tab_1.tabpage_interrupciones.pb_avanzar.visible = True
					tab_1.tabpage_interrupciones.pb_avanzar.enabled = True
					tab_1.tabpage_interrupciones.pb_anterior.visible = True
					tab_1.tabpage_interrupciones.pb_anterior.enabled = False
				ELSE
					tab_1.tabpage_interrupciones.pb_avanzar.visible = False
					tab_1.tabpage_interrupciones.pb_anterior.visible = False
				END IF
				IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 THEN //AND gi_tension_nivel_min = fgci_baja_tension THEN
					ls_fase_afectada = tab_1.tabpage_interrupciones.d_datos_interrup.GetItemString(1, 'sgd_valor_descripcion')
					tab_1.of_mostrar_fases_int(ll_fila_primera, ls_fase_afectada)
				END IF
			END IF
		
		ELSE
			// La incidencia con perdida se ha dado de alta desde el OpenSgi.
			// Se obtienen sobre d_datos_interrup todos los datos de todas las interrupciones
			tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,0)
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Retrieve(tab_1.il_nro_incidencia, fgci_tipo_ct, &
													fgci_tipo_subestacion_at,fgci_tipo_salida_at, fgci_tipo_subestacion, &
													fgci_tipo_salida_mt,fgci_tipo_ct,fgci_tipo_transformador,fgci_tipo_salida_de_baja)
			
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Setsort("c_icono_num D")
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.sort()
					
			//	Inserto en el arbol las interrupciones existentes
			tab_1.tabpage_interrupciones.tv_1.deleteItem(0)
			tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),0,2)
			tab_1.tabpage_interrupciones.tv_1.fw_buscar_interrupciones(tab_1.il_nro_incidencia)	
		END IF
		
	END IF
				
//	W_BARRA.uo_barra.barra.f_amplia(45)
	tab_1.l_si_valido=0
	

	tab_1.tabpage_formulario.d_inf_general.Modify("f_deteccion.background.color = " + gs_gris)
	tab_1.tabpage_observaciones.mle_observaciones.displayonly = True
	tab_1.tabpage_observaciones.mle_observaciones.pointer = "Arrow!"
	
// Carga las datawindows de seguimiento con los estado existentes
// El 1 es porque desde el open de la ventana no se si resuelve mant, le paso 1 por 
// defecto y en el selectionchanged del tabpage lo evaluo
iu_ema_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_mantenimientos,0)

//W_BARRA.uo_barra.barra.f_amplia(50)

//iu_eop_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_operaciones,tab_1.ii_ind_calidad)
//tab_1.fnu_obte_estados_oper() PACHO
tab_1.fnu_obte_estados_mant()
//W_BARRA.uo_barra.barra.f_amplia(55)

// Cargo las fechas de los estados 
	tab_1.idt_fec_deteccion = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_pendiente,"f_alta")

// En el caso de que ii_incidencia_enviado_brigada = 0, es que se trata de una incidencia
// procedente de SCADA sin tener estado EB. Si no hay estado EB no se obtiene la fecha
IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
	tab_1.idt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_enviado_brigada,"f_alta")
END IF

// Si la incidencia es imprevista sin perdidas y se ha dado de alta desde operaciones se
// hace invisible el tabpage de interrupciones. En el caso de que la incidencia se haya 
// dado de alta desde el OpenSgi, no se hace invisible para permitir que la incidencia
// pueda convertirse en una incidencia imprevista con perdida
IF tab_1.ii_tipo_incid = fgci_incidencia_imprevista &
	AND tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
	
	IF fw_incidencia_de_operaciones() THEN
		tab_1.tabpage_interrupciones.visible = False
	ELSE
		tab_1.tabpage_interrupciones.tv_1.deleteItem(0)
		tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),0,2)
	END IF
	
// Para el resto de las incidencias sin perdidas se hace el tabpage invisible
ELSEIF tab_1.ii_alcance = fgci_incidencia_de_suministro or tab_1.ii_tipo_incid = fgci_incidencia_calidad &
	or (tab_1.ii_alcance = fgci_incidencia_sin_interrupcion AND tab_1.ii_tipo_incid <> fgci_incidencia_imprevista) THEN

	// Deshabilito la opcion de marcar interrupciones
	tab_1.tabpage_interrupciones.visible = False
	//tab_1.of_iniciar_estados_oper()
END IF
//W_BARRA.uo_barra.barra.f_amplia(60)

if tab_1.ii_alcance=fgci_incidencia_con_interrupcion then // si es incidencia con perdida
	tab_1.idt_fecha_er = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_en_reposicion,"f_alta")
	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
else
	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
	SetNull(tab_1.idt_fecha_er)
end if

//W_BARRA.uo_barra.barra.f_amplia(65)
// Cargo fechas de estados mantenimiento

tab_1.idec_nro_instalacion_afectada = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins")
//tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot")

tab_1.frn_habilitar_obs_accion(False)

// Solo para eliminar el problema de que aparece el formulario en blanco
tab_1.tabpage_formulario.d_inf_general.SetRedraw(True)

// Pregunto por si la incidencia viene del modulo de descargos
if tab_1.ii_tipo_incid=fgci_incidencia_programada then
	tab_1.fnu_inc_descargos()
end if

tab_1.tabpage_observaciones.mle_observaciones.Text = tab_1.f_devolver_observaciones(tab_1.tabpage_formulario.d_inf_general)	
tab_1.tabpage_observaciones.mle_observaciones_mnto.Text = tab_1.f_devolver_observaciones_mnto(tab_1.tabpage_formulario.d_inf_general)	

//W_BARRA.uo_barra.barra.f_amplia(70)
/////////////////////////////////////////////////////////////////////////////////////

//Solo muestro el TAB de Maniobras cuando exista alguna y este OPERACION integrado
if fw_incidencia_de_operaciones() then

	if tab_1.ii_alcance = fgci_incidencia_con_interrupcion then
			tab_1.tabpage_maniobras.visible = true
	END IF
	//		fw_carga_maniobras(tab_1.il_nro_incidencia) // COMENTADO FDO SI SE PONE
																  // ARBOL VOLVER A DESCOMENTAR
//	W_BARRA.uo_barra.barra.f_amplia(75)
	
	tab_1.tabpage_maniobras.dw_maniobras.settransobject(Sqlca) // FDO
	tab_1.tabpage_maniobras.dw_maniobras.retrieve(tab_1.il_nro_incidencia) //FDO
	tab_1.tabpage_maniobras.enabled = true
end if

if tab_1.f_inserta_datos_brig() = false then
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=0")
else
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=1")
end if

//and tab_1.ii_tipo_incid<>fgci_incidencia_calidad &
//***************************************
//**  OSGI 2001.1  	17/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	17/05/2001  if gb_mantenimiento = true & 
//**  OSGI 2001.1  	17/05/2001  	and tab_1.ii_tipo_incid<>fgci_incidencia_programada &
//**  OSGI 2001.1  	17/05/2001  	and tab_1.ii_alcance <> fgci_incidencia_de_suministro and &
//**  OSGI 2001.1  	17/05/2001  	tab_1.ii_alcance <> fgci_incidencia_reenganche then
/////////////////////////////////////////////////////////////
// INDICATIVO DE OBLIGADA VERSION UNIFICADA AMR 06/09/2002
////////////////////////////////////////////////////////////
//If gb_mantenimiento = True &
//	And tab_1.ii_tipo_incid <> fgci_incidencia_programada &
//	And tab_1.ii_tipo_incid <> fgci_incidencia_obligada &
//	And tab_1.ii_alcance <> fgci_incidencia_de_suministro Then
	
If gb_mantenimiento = True &
	And tab_1.ii_tipo_incid <> fgci_incidencia_programada &
	And tab_1.ii_alcance <> fgci_incidencia_de_suministro Then
//////////////////////////////////////////////////////////////
//***************************************
//**  OSGI 2001.1  	17/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

	tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible = true
	tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = true
end if
//W_BARRA.uo_barra.barra.f_amplia(80)
tab_1.f_deshab_tabs(true)

	tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("desc.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("desc.edit.displayonly=yes")
	tab_1.tabpage_formulario.d_inf_general.modify("desc.protect=0")
	tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.protect=1")
	tab_1.tabpage_formulario.st_1.visible= false
	tab_1.tabpage_formulario.st_2.visible= false
	
	lm_menu.m_consultar.m_instalacionafectada.enabled = false
	lm_menu.m_archivo.m_grabar.enabled = false
	tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.protect=1")
	tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.background.color="+gs_gris)
	tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.protect=1")
	tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.background.color="+gs_gris)
// Modificado por Sgo. Unificacion.
//	tab_1.tabpage_observaciones.mle_observaciones.backcolor = rgb(192,192,192)
	tab_1.tabpage_observaciones.mle_observaciones.backcolor = long(gs_gris)
// Fin. Sgo.
	tab_1.tabpage_observaciones.mle_observaciones.textcolor = rgb(0,0,255)
	tab_1.tabpage_ot.rb_1.enabled = FALSE
	tab_1.tabpage_ot.rb_2.enabled = FALSE
	tab_1.frn_h_seguimiento_segun_perfil(tab_1.ii_incid_suministro,tab_1.tabpage_seguimiento.d_seguimiento_operaciones,tab_1.is_accion_llamada)

// Se comprueba si se trata de una incidencia agrupada con perdida en estado SR. En caso
// de ser asi se hace visible la opcion de menu que permite consultar las incidencias
// agrupadas
IF tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"sgd_incidencia_nro_agrupacion") > 0 THEN 
	lm_menu.m_consultar.m_incidenciasagrupadas.visible = TRUE
	lm_menu.m_consultar.m_incidenciasagrupadas.toolbaritemvisible = true
ELSE
	lm_menu.m_consultar.m_incidenciasagrupadas.visible = FALSE
	lm_menu.m_consultar.m_incidenciasagrupadas.toolbaritemvisible = FALSE
END IF
//W_BARRA.uo_barra.barra.f_amplia(85)

//***************************************
//**  OSGI 2001.1  	20/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_open_ext()

//***************************************
//**  OSGI 2001.1  	20/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

//if not isvalid(w_barra) then OPEN(W_BARRA,this)

//W_BARRA.uo_barra.barra.f_amplia(90)

// LLENAR ESTADISTICAS DE INTERRUPCIONES
iu_inc_2005_nu.fnu_cargo_det_interr(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  

// indisponibilidades
//W_BARRA.uo_barra.barra.f_amplia(92)

if	fg_verifica_parametro("Indisponibilidades activas") = true and tab_1.ib_primera_vez_indisponibilidades = false then

	//FDO Inicializaci$$HEX1$$f300$$ENDHEX$$n de los filtros.
	// GNU 6-10-2006. Mejora EPSA
	
	tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
	tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.retrieve(tab_1.il_nro_incidencia)

//	W_BARRA.uo_barra.barra.f_amplia(94)

	if fw_incidencia_de_operaciones() then
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.visible=true
//		tab_1.tabpage_indisponibilidades.tv_2.visible=false
//		tab_1.tabpage_indisponibilidades.p_1.visible=false
//		tab_1.tabpage_indisponibilidades.p_2.visible=false
//		tab_1.tabpage_indisponibilidades.p_3.visible=false
//		tab_1.tabpage_indisponibilidades.p_4.visible=false
//		tab_1.tabpage_indisponibilidades.p_5.visible=false
//		tab_1.tabpage_indisponibilidades.p_6.visible=false
//		tab_1.tabpage_indisponibilidades.p_7.visible=false
//		tab_1.tabpage_indisponibilidades.p_8.visible=false
//		tab_1.tabpage_indisponibilidades.p_9.visible=false
//		tab_1.tabpage_indisponibilidades.p_10.visible=false
//		tab_1.tabpage_indisponibilidades.st_5.visible=false
//		tab_1.tabpage_indisponibilidades.st_6.visible=false
//		tab_1.tabpage_indisponibilidades.st_7.visible=false
//		tab_1.tabpage_indisponibilidades.st_8.visible=false
//		tab_1.tabpage_indisponibilidades.st_9.visible=false
//		tab_1.tabpage_indisponibilidades.st_10.visible=false
//		tab_1.tabpage_indisponibilidades.st_11.visible=false
//		tab_1.tabpage_indisponibilidades.st_12.visible=false
//		tab_1.tabpage_indisponibilidades.st_13.visible=false
//		tab_1.tabpage_indisponibilidades.st_14.visible=false
//	fw_cambiar_tab_indisponibilidades(true)
		
		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.settransobject(sqlca)
		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.retrieve()
		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.insertrow(0)
		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.object.tip_instalacion[1] = '0'
			
		for li_conta = 1 to tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.rowcount() 
			if tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.f_reposicion[li_conta] > &
				tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.f_alta[li_conta] then
			
				tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.modificado[li_conta] = '1'
			
			end if
		next 
	
		if lu_comunic.is_comunic.Accion_llamada="Consulta" then
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 1
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = false
		else
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 0
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = true
		end if
	else
//		W_BARRA.uo_barra.barra.f_amplia(95)

  	  if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,'tip_tension')=fgci_alta_tension or &
			 integer(tab_1.tabpage_formulario.d_inf_general.getitemstring(1,'tipo_instalacion'))= fgci_tipo_subestacion or &
			 integer(tab_1.tabpage_formulario.d_inf_general.getitemstring(1,'tipo_instalacion'))= fgci_tipo_salida_mt then

//		tab_1.tabpage_indisponibilidades.tv_2.visible=true
//		tab_1.tabpage_indisponibilidades.p_1.visible=true
//		tab_1.tabpage_indisponibilidades.p_2.visible=true
//		tab_1.tabpage_indisponibilidades.p_3.visible=true
//		tab_1.tabpage_indisponibilidades.p_4.visible=true
//		tab_1.tabpage_indisponibilidades.p_5.visible=true
//		tab_1.tabpage_indisponibilidades.p_6.visible=true
//		tab_1.tabpage_indisponibilidades.p_7.visible=true
//		tab_1.tabpage_indisponibilidades.p_8.visible=true
//		tab_1.tabpage_indisponibilidades.p_9.visible=true
//		tab_1.tabpage_indisponibilidades.p_10.visible=true
//		tab_1.tabpage_indisponibilidades.st_5.visible=true
//		tab_1.tabpage_indisponibilidades.st_6.visible=true
//		tab_1.tabpage_indisponibilidades.st_7.visible=true
//		tab_1.tabpage_indisponibilidades.st_8.visible=true
//		tab_1.tabpage_indisponibilidades.st_9.visible=true
//		tab_1.tabpage_indisponibilidades.st_10.visible=true
//		tab_1.tabpage_indisponibilidades.st_11.visible=true
//		tab_1.tabpage_indisponibilidades.st_12.visible=true
//		tab_1.tabpage_indisponibilidades.st_13.visible=true
//		tab_1.tabpage_indisponibilidades.st_14.visible=true
//		fw_cambiar_tab_indisponibilidades(false)
		
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.insertrow(0)
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
		tab_1.of_cargar_indisponibilidad(tab_1.idec_nro_instalacion_afectada)
//		W_BARRA.uo_barra.barra.f_amplia(96)
	else
		tab_1.tabpage_indisponibilidades.enabled=false
	end if
	end if
end if

//if isvalid(w_barra) then W_BARRA.uo_barra.barra.f_amplia(100)

if tab_1.il_nro_ot > 0 then
	tab_1.tabpage_ot.cb_ot.visible=false
	tab_1.tabpage_ot.st_sin_ot.visible=false
end if

//if isvalid(w_barra) then 
//	w_barra.visible=false
//	CLOSE (W_BARRA)
//end if

this.setredraw(true)

if isvalid(w_1234_consulta_incidencias) then
	w_1234_consulta_incidencias.visible = False
	w_1234_consulta_incidencias.enabled = False
	gl_instalacion_afectada=0
	w_1234_consulta_incidencias.li_primera_vez=0
	w_1234_consulta_incidencias.d_filtro_aviso.object.nro_incid_desde[1]=tab_1.il_nro_incidencia
	w_1234_consulta_incidencias.d_filtro_aviso.object.nro_incid_hasta[1]=tab_1.il_nro_incidencia
	w_1234_consulta_incidencias.triggerevent("ue_armar_sql")
	w_1234_consulta_incidencias.visible = True
	w_1234_consulta_incidencias.enabled = True
end if

if isvalid(this) then this.setfocus()

end event

event ue_agrupacion;SetPointer(HourGlass!)
	
gu_comunic.is_comunic.accion_llamada="Seleccion"
gu_comunic.is_comunic.programa_llamante="w_2301" 
gu_comunic.is_comunic.longval3 = tab_1.il_nro_incidencia
gu_comunic.is_comunic.longval4 = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'sgd_incidencia_nro_agrupacion')
gu_comunic.is_comunic.intval4 = tab_1.ii_estado_oper


IF gu_comunic.is_comunic.longval3 <> 0 THEN
	ib_post_activate=FALSE
	open(w_desagrupacion_incidencias)
//	ib_post_activate=TRUE
END IF
	

end event

event ue_refresca_mante();long ll_codigo, ll_codigo_aco, ll_cod_causa, ll_cod_fam, ll_ot, ll_brigada
string ls_nom_instalacion, ls_nom_brigada
String ls_fase_afectada
String ls_obs_estados[], ls_desc, ls_causa, ls_cod_material, ls_material
long ll_fila_primera = 1
int li_contador, li_alcance_anterior, li_fila, li_hay_eb_en_bd
DateTime ldt_fecha_res, ldt_fecha_causa, ldt_fecha_eb
Boolean lb_existia_eb, lb_hay_brigadas = FALSE


Datastore lds_brigadas

md_ingreso_incidencias lm_menu

lm_menu = This.MenuId

IF ib_mostrar_mensaje THEN
	messagebox("Atencion", "La incidencia ha sido modificada por SCADA. Los datos se refrescaran")
END IF

SetPointer(HourGlass!)

uo_barra.barra.f_resetea_barra()
uo_barra.visible = true
uo_barra.bringtotop = true
UO_BARRA.gb_1.text="Refrescando Incidencia..."
UO_BARRA.BARRA.visible=true
uo_barra.barra.f_amplia(3)

tab_1.tabpage_formulario.d_inf_general.AcceptText()
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.AcceptText()

IF tab_1.ii_estado_oper > fgci_incidencia_pendiente THEN
	IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
		lb_existia_eb = TRUE
		ldt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDatetime(tab_1.ii_incidencia_enviado_brigada, 'f_alta')
		
		SELECT COUNT(*)
		INTO :li_hay_eb_en_bd
		FROM SGD_ESTADO_OPER
		WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia AND COD_ESTADO = :fgci_incidencia_enviado_brigada;
		
	ELSE
		lb_existia_eb = FALSE
	END IF
ELSE
	lb_existia_eb = FALSE
END IF

uo_barra.barra.f_amplia(10)
// Guardamos la informacion que ha podido modificar el usuario para no perderla
FOR li_contador=1 TO tab_1.tabpage_seguimiento.d_seguimiento_operaciones.RowCount()
	ls_obs_estados[li_contador] = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemString(li_contador, 'observacion')
NEXT

SetNull(tab_1.idt_fecha_eb)
SetNull(tab_1.idt_fecha_er)
SetNull(tab_1.idt_fecha_sr)

ldt_fecha_res = tab_1.tabpage_formulario.d_inf_general.GetItemDateTime(1, 'f_est_res')
ls_desc = tab_1.tabpage_formulario.d_inf_general.GetItemString(1, 'desc')
ll_cod_causa = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa')
ls_causa = tab_1.tabpage_formulario.d_inf_general.object.st_causa.text 
ldt_fecha_causa = tab_1.tabpage_formulario.d_inf_general.getitemdatetime(1,"fec_causa")
ll_cod_fam = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'incidencia_fam_causa')
ls_cod_material = tab_1.tabpage_formulario.d_inf_general.GetItemString(1, 'material_averiado')
ls_material = tab_1.tabpage_formulario.d_inf_general.object.st_mat_averiado.Text
li_alcance_anterior = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'alcance')
ll_ot = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'ot')
ll_brigada = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'brigada')
ls_nom_brigada = tab_1.tabpage_formulario.d_inf_general.GetItemString(1, 'nom_brigada')



//this.setredraw(false)

uo_barra.barra.f_amplia(15)

tab_1.tabpage_formulario.d_inf_general.SetRedraw(False)
tab_1.tabpage_seguimiento.d_estados_operaciones.Reset()
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Reset()


uo_barra.barra.f_amplia(28)

i_hay_datos=iu_inc_2003_nu.fnu_obtener_datos(tab_1.tabpage_formulario.d_inf_general,tab_1.il_nro_incidencia)	
// Una vez obtenidos los datos se agnaden los datos que potencialmente ha podido cambiar 
// el usuario








tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'f_est_res', ldt_fecha_res) 
tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'desc', ls_desc)
tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'causa', ll_cod_causa)
tab_1.tabpage_formulario.d_inf_general.object.st_causa.text = ls_causa 
tab_1.tabpage_formulario.d_inf_general.SetItem(1,"fec_causa", ldt_fecha_causa)
tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'incidencia_fam_causa', ll_cod_fam)
tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'material_averiado', ls_cod_material)
tab_1.tabpage_formulario.d_inf_general.object.st_mat_averiado.Text = ls_material
tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'ot', ll_ot)
tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'brigada', ll_brigada)
tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'nom_brigada', ls_nom_brigada)

tab_1.tabpage_formulario.d_inf_general.AcceptText()

	ll_codigo = this.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")
		SELECT nom_instalacion into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_codigo
		and sgd_instalacion.bdi_job =0  //DBE 11/01/2000
		;
		IF SQLCA.SQLCode = 100 THEN
			ls_nom_instalacion = string(ll_codigo)
		END IF
		ls_nom_instalacion = fg_remplaza(ls_nom_instalacion, '"', ' ')	
		this.tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ls_nom_instalacion
		
tab_1.tabpage_formulario.d_inf_general.fpr_habilitar_campos(lu_comunic.is_comunic.Accion_llamada) 
tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")
tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")

tab_1.ib_anadir_eb = false
tab_1.of_iniciar_estados_oper()
// Miro si la Incidencia es de calidad
uo_barra.barra.f_amplia(32)

fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.tabpage_formulario.d_inf_general.object.alcance[1]) 

IF fw_incidencia_de_operaciones() THEN
	IF tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount() > 0 THEN
		// Almacenamos las brigadas que ha podido modificar el usuario para ponerlas luego
		// ya que la funcion fw_inst_afectadas_operaciones() hace un retrieve sobre d_lista_brigadas_ot
		lds_brigadas = CREATE datastore
		lds_brigadas.dataobject = 'd_bri_2002_pr_list_brigadas_ot'
		tab_1.tabpage_ot.d_lista_brigadas_ot.RowsCopy(1, tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount(), Primary!, &
																		lds_brigadas, 1, Primary!)
		lb_hay_brigadas = true
		
	END IF
	uo_barra.barra.f_amplia(34)
	fw_inst_afectadas_operaciones()

END IF	

// Se comprueba si hay que agnadir entre medias el estado EB
IF lb_existia_eb THEN
	IF tab_1.ii_estado_oper >= fgci_incidencia_en_reposicion THEN
		// Hay que comprobar si la fecha de ER es inferior a la fecha de EB.

		// En este caso no debe existir el estado EB
		IF tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
			IF ldt_fecha_eb <= tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_en_reposicion,"f_alta") THEN
				// El estado EB es valido 
				// Hay que comprobar si hay que agnadirlo o modificarlo
				IF li_hay_eb_en_bd = 0  THEN
					tab_1.fnu_anadir_eb(ldt_fecha_eb)
					// Hay que agnadirlo en la Datawindow la fila para el estado EB
					// puesto que no existe
				ELSE
					tab_1.idt_fecha_eb = ldt_fecha_eb
					tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"f_alta",tab_1.idt_fecha_eb)
					tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"h_alta",tab_1.idt_fecha_eb)
				END IF
						
			END IF
		ELSE // La incidencia es sin perdida. El estado EB existe en la datawindow. Solo hay que agnadir la fecha
			tab_1.idt_fecha_eb = ldt_fecha_eb
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"f_alta",tab_1.idt_fecha_eb)
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"h_alta",tab_1.idt_fecha_eb)
		END IF
	ELSE // La incidencia esta en estado PT o EB. El estado EB existe en la datawindow. Solo hay que agnadir la fecha
		// Se modifica la fecha de alta
		tab_1.idt_fecha_eb = ldt_fecha_eb
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"f_alta",tab_1.idt_fecha_eb)
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"h_alta",tab_1.idt_fecha_eb)
		
		// Hay que agnadir el estado EB si no existe
		IF tab_1.ii_estado_oper = fgci_incidencia_pendiente THEN
			tab_1.ii_estado_oper = fgci_incidencia_enviado_brigada
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,"estado_actual", tab_1.ii_estado_oper)
		END IF
	END IF
END IF

uo_barra.barra.f_amplia(57)

IF lb_hay_brigadas THEN
	tab_1.tabpage_ot.d_lista_brigadas_ot.Reset()
	IF lds_brigadas.RowCount() > 0 THEN
		lds_brigadas.RowsCopy(1, lds_brigadas.RowCount(), Primary!, &
										tab_1.tabpage_ot.d_lista_brigadas_ot, 1, Primary!)
	END IF										
	
	DESTROY (lds_brigadas)
END IF


// Se restablecen las observaciones que tenian los estados antes de la actualizacion
FOR li_contador=1 TO UpperBound(ls_obs_estados)
	IF li_contador >= fgci_incidencia_en_reposicion AND &
		li_alcance_anterior = fgci_incidencia_sin_interrupcion AND &
		tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
		
		// La incidencia anteriormente era sin perdida y ahora es con perdida
		// con lo que la observacion a partir del estado SR queda desplazada una posicion
		// en ls_obs_estados, ya que se ha agnadido el estado ER
		IF li_contador <> fgci_incidencia_en_reposicion THEN
			IF NOT IsNull(tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(li_contador, 'f_alta')) THEN
				tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(li_contador, 'observacion', ls_obs_estados[li_contador -1])
			END IF
		END IF
	ELSE // PT,EB,ER,SR,RS --> PT,ER,SR,RS
		
		if li_contador <=Tab_1.tabpage_seguimiento.d_seguimiento_operaciones.rowcount() then 
				if  li_contador > fgci_incidencia_pendiente and tab_1.ii_incidencia_enviado_brigada = 0 &
					and upperbound(ls_obs_estados)<> Tab_1.tabpage_seguimiento.d_seguimiento_operaciones.rowcount() then // NO TIENE EB 
		
							IF NOT IsNull(tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(li_contador, 'f_alta')) THEN
								tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(li_contador, 'observacion', ls_obs_estados[li_contador + 1])
							END IF
					else 
						IF  NOT IsNull(tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(li_contador, 'f_alta')) THEN
							tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(li_contador, 'observacion', ls_obs_estados[li_contador])
						END IF
				end if
		end if
 END IF
NEXT

uo_barra.barra.f_amplia(60)
	
DataWindowChild ldw_child
tab_1.tabpage_formulario.d_inf_general.GetChild ('tipo_incidencia', ldw_child)
ldw_child.SetTransObject (SQLCA)
ldw_child.Retrieve (0) //Con parametro 0 para sacar todos tipos

IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
	tab_1.tabpage_interrupciones.dw_afec_parcial_sum.retrieve(tab_1.il_nro_incidencia)
END IF

uo_barra.barra.f_amplia(74)
	
IF	tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
	// Se asigna a la datawindow d_datos_interrup el dataobject adecuado
	// en funcion de si en operaciones se han interrumpido acometidas o CT, y de si
	// se esta o no en la ventana de historicos
	tab_1.of_componer_dw_interrupciones()
		
	IF fw_incidencia_de_operaciones() THEN
		// La incidencia se ha dado de alta desde operaciones
		IF tab_1.tabpage_interrupciones.dw_lista_acometidas.RowCount() > 0 THEN
			// Si hay acometidas interrumpidas se obtienen los datos de la acometida
			// interrumpida sobre d_datos_interrup
			ll_codigo_aco = tab_1.tabpage_interrupciones.dw_lista_acometidas.GetItemNumber(1,"codigo")
			tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,ll_codigo_aco)
			IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 1 AND gi_tension_nivel_min = fgci_baja_tension THEN
				// Si la acometida ha sido interrumpida mas de una vez se

				// habilitan los botones de avanzar y retroceder para que se puedan
				// consultar todas las acometidas
				tab_1.tabpage_interrupciones.pb_avanzar.visible = True
				tab_1.tabpage_interrupciones.pb_avanzar.enabled = True
				tab_1.tabpage_interrupciones.pb_anterior.visible = True
				tab_1.tabpage_interrupciones.pb_anterior.enabled = False
			ELSE
				tab_1.tabpage_interrupciones.pb_avanzar.visible = False
				tab_1.tabpage_interrupciones.pb_anterior.visible = False
			END IF

			IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 THEN //AND gi_tension_nivel_min = fgci_baja_tension THEN
				ls_fase_afectada = tab_1.tabpage_interrupciones.d_datos_interrup.GetItemString(1, 'sgd_valor_descripcion')
				tab_1.of_mostrar_fases_int(ll_fila_primera, ls_fase_afectada)
			END IF
		END IF
	END IF
END IF

uo_barra.barra.f_amplia(83)

IF tab_1.tabpage_interrupciones.dw_lista_int_operaciones.RowCount() = 0 THEN
	tab_1.tabpage_interrupciones.visible = FALSE
END IF

uo_barra.barra.f_amplia(93)

// En el caso de que ii_incidencia_enviado_brigada = 0, es que se trata de una incidencia
// procedente de SCADA sin tener estado EB. Si no hay estado EB no se obtiene la fecha
IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
	tab_1.idt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_enviado_brigada,"f_alta")
END IF

if tab_1.ii_alcance=fgci_incidencia_con_interrupcion then // si es incidencia con perdida
	tab_1.idt_fecha_er = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_en_reposicion,"f_alta")
	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
else
	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
	SetNull(tab_1.idt_fecha_er)
end if

uo_barra.barra.f_amplia(96)

tab_1.tabpage_formulario.d_inf_general.SetRedraw(True)


//Solo muestro el TAB de Maniobras cuando exista alguna y este OPERACION integrado
if fw_incidencia_de_operaciones() then
	if tab_1.ii_alcance = fgci_incidencia_con_interrupcion then
		tab_1.tabpage_maniobras.visible = true
	END IF
	tab_1.tabpage_maniobras.dw_maniobras.settransobject(Sqlca) // FDO
	tab_1.tabpage_maniobras.dw_maniobras.retrieve(tab_1.il_nro_incidencia) //FDO
	tab_1.tabpage_maniobras.enabled = true
end if

uo_barra.barra.f_amplia(97)

tab_1.f_deshab_tabs(true)
// LLENAR ESTADISTICAS DE INTERRUPCIONES
iu_inc_2005_nu.fnu_cargo_det_interr(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  

if tab_1.il_nro_ot > 0 then
	tab_1.tabpage_ot.cb_ot.visible=false
	tab_1.tabpage_ot.st_sin_ot.visible=false
end if

idt_f_actual = fw_obtener_f_actual(tab_1.il_nro_incidencia)

uo_barra.barra.f_amplia(100)


this.setredraw(true)

uo_barra.visible = FALSE

if isvalid(this) then 
	this.setfocus()
	ib_mostrar_mensaje = TRUE
	lm_menu.m_archivo.m_grabar.enabled=true
end if


end event

event ue_int_descargos;long ll_nro_descargo

SELECT NRO_DESCARGO
INTO :ll_nro_descargo
FROM SGD_DESCARGOS
WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia;

IF SQLCA.SQLCode = 0 THEN
	
	IF fw_incidencia_de_operaciones() THEN
		gu_comunic.is_comunic.intval4 = 1
	ELSE
		gu_comunic.is_comunic.intval4 = 0
	END IF
	gu_comunic.is_comunic.programa_llamante="w_2301" 
	gu_comunic.is_comunic.longval3 = tab_1.il_nro_incidencia
	gu_comunic.is_comunic.longval4 = ll_nro_descargo
	
	open(w_interrupciones_descargo)
ELSE
	Messagebox("Atencion", "No se ha podido obtener el codigo del Descargo asociado a la incidencia programada")
END IF
end event

event ue_descargos;long ll_nro_descargo,ll_nro_instalacion
string ls_nombre_inst

SELECT SGD_DESCARGOS.NRO_DESCARGO,
			SGD_DESCARGOS.COD_INST_ORIGEN,
			SGD_INSTALACION.NOM_INSTALACION
INTO :ll_nro_descargo,:ll_nro_instalacion,:ls_nombre_inst
FROM SGD_DESCARGOS,SGD_INSTALACION
WHERE SGD_DESCARGOS.NRO_INCIDENCIA = :tab_1.il_nro_incidencia and
			SGD_INSTALACION.NRO_INSTALACION = SGD_DESCARGOS.COD_INST_ORIGEN;

gu_comunic.is_comunic.accion_llamada="Consulta" // Accion a ejecutar
gu_comunic.is_comunic.longval1 = ll_nro_descargo
gu_comunic.is_comunic.decval1 = ll_nro_instalacion
gu_comunic.is_comunic.strval5 = ls_nombre_inst
gu_comunic.is_comunic.strval6 = "lista_descargos"
open (w_7102_mantenimiento_descargos)

gu_comunic.is_comunic.strval6 = ""

end event

event ue_alta_int_descargos;IF this.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 THEN
	Messagebox("Atencion", "Esta accion solo esta permitida cuando la incidencia no tiene interrupciones definidas.")
ELSE
	This.tab_1.tabpage_interrupciones.tv_1.il_handle_seleccionado = 1
	This.tab_1.il_handle_instalacion = 1
	This.tab_1.tabpage_interrupciones.tv_1.ib_int_descargo = True
	This.tab_1.tabpage_interrupciones.tv_1.TriggerEvent("ue_interr_agrup")
	IF fg_verifica_parametro("Otras Interrupciones") THEN
		This.tab_1.tabpage_interrupciones.tv_1.triggerEvent("ue_otras_interr")
	END IF
	This.tab_1.tabpage_interrupciones.tv_1.ib_int_descargo = FALSE
END IF

end event

event ue_open2();//NCA-INICIO.DDAG-1783.20150304.
int li_cod_accion_inci_ingreso
//NCA-FIN.DDAG-1783.20150304.

//VMC.INI.DDAG-6453.14/07/2016
long ll_cod_causa_subtipo
string ls_desc_causa_subtipo
//VMC.FIN.DDAG-6453.14/07/2016


//AHU  0/100038003 (17/02/2009)
IF gi_pais = 8 THEN			//Comprobamos que estamos en Moldavia
	tab_1.tabpage_otros.Text = 'SEC'
END IF
//Fin AHU

//AHM (09/12/2009) Problemas bloqueo disponibilidades
//IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
//	wf_cargaDisponibilidades()
//END IF  --Agregar mas tarde

//AHM (13/07/2009) Mejora 1/446555
fw_bloqueaObsSeguimiento()

//AHM(02/11/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
IF gb_interfaseOsgm AND lu_comunic.is_comunic.accion_llamada <> "Alta" THEN
	THIS.tab_1.ii_estado_mant = tab_1.tabpage_formulario.d_inf_general.getItemNumber(1, "estado_mantenimiento")
	THIS.tab_1.tabpage_ocen.uo_ot_ocen.il_incidencia_nro = THIS.tab_1.tabpage_formulario.d_inf_general.getItemNumber(1, "nro_incidencia")
	THIS.tab_1.tabpage_ocen.uo_ot_ocen.wf_cargaSolicitud()	
END IF

IF lu_comunic.is_comunic.accion_llamada<>"Alta" AND isNull(tab_1.tabpage_formulario.d_inf_general.getItemNumber(1, "estado_mantenimiento")) THEN
	tab_1.tabpage_formulario.d_inf_general.setItem(1, "estado_mantenimiento", 1)
END IF

//20/12/2011
IF gb_interfaseOsgm AND THIS.tab_1.ii_tipo_incid = 2 THEN
	THIS.tab_1.tabpage_ocen.uo_ot_ocen.enabled = FALSE
END IF



//NCA-INICIO.DDAG-1783.20150312. Hago el retreieve del datawindows child filtrando solamente los activos.
	DataWindowChild ldw_child_cod_accion
	tab_1.tabpage_formulario.d_inf_general.GetChild ('cod_accion_inc', ldw_child_cod_accion)
	ldw_child_cod_accion.SetTransObject (SQLCA)
	ldw_child_cod_accion.Retrieve () 
	ldw_child_cod_accion.SetFilter("activo = 1")
	ldw_child_cod_accion.Filter()
//NCA-FIN.DDAG-1783.20150312.



//NCA-INICIO.DDAG-1783.20150304.En la ventana de ingreso de incidencias como es un nuevo registro es null
//si encuentra que el registro es null que asigne (cero) que corresponde a la descripci$$HEX1$$f300$$ENDHEX$$n "No Asignada".
li_cod_accion_inci_ingreso = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'cod_accion_inc')

IF IsNull(li_cod_accion_inci_ingreso) THEN	
	tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'cod_accion_inc',0)	
END IF
//NCA-FIN.DDAG-1783.20150304.

//VMC.INI.DDAG-6453.14/07/2016
ll_cod_causa_subtipo = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa_subtipo')
select descripcion into :ls_desc_causa_subtipo from gi_causa_subtipo where cod_causa_subtipo = :ll_cod_causa_subtipo;
tab_1.tabpage_formulario.d_inf_general.object.st_causa_subtipo.text = ls_desc_causa_subtipo

Datawindowchild dddwo, dddwf

tab_1.tabpage_formulario.d_inf_general.GetChild("lista_elem_operador",dddwo)
dddwo.SetTransObject(SQLCA)
dddwo.retrieve()

tab_1.tabpage_formulario.d_inf_general.GetChild("lista_elem_fallado",dddwf)
dddwf.SetTransObject(SQLCA)
dddwf.retrieve()

if	lu_comunic.is_comunic.Accion_llamada="Consulta" then
	tab_1.tabpage_formulario.st_18.visible= false
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.background.color="+gs_gris)
	
	//TDA-EDM1-27-04-2017
	tab_1.tabpage_formulario.d_inf_general.modify("rep_red.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("rep_red.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.protect=1")
	//END-TDA-EDM1-27-04-2017
end if

//VMC.FIN.DDAG-6453.14/07/2016

fw_bloquear_dw()
	
	
	
	


end event

public function integer fnu_resetear_var_comunicaciones ();////////////////////////////////////////////////////////////
////
//// Funcion: fnu_resetear_var_comunicaciones
////
//// Objetivo:  Llamada a la funcion global que Resetea todas 
////            las variables de comunicacion usadas en la window.
////
//// Ambito: Publico
////
//// Parametros:
////        Entrada: --
////        Salida : --
////
//// Devuelve: 
////
//// Fecha		Responsable		Actuacion
//// -----	 	-----------		---------
////
/////////////////////////////////////////////////////////////

fgnu_resetear_s_comunicaciones(gu_comunic)
fgnu_resetear_s_comunicaciones(gu_comunic1)
// fgnu_resetear_s_comunicaciones(gu_comunic2)

return 1
end function

public subroutine fnu_destruir_objetos ();////////////////////////////////////////////////////////////////////////////////////////////////
//

// Funcion: fnu_destruir_objetos
// 
// Objetivo: Destruye Objetos utilizados en la ventana.
//
//	Ambito:	Publico
//
// Parametros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuacion
// ---------	-------		----------------------------------------
//		
//
////////////////////////////////////////////////////////////////////////////////////////////////



DESTROY lu_comunic
//DESTROY iu_resetea
DESTROY lu_comunic1
//DESTROY lu_comunic2
DESTROY iu_inc_2003_nu
DESTROY iu_inc_2004_nu
DESTROY iu_inc_2004_rn
DESTROY lu_avi_1002_nu
//DESTROY iu_cen_2001_nu
//DESTROY iu_ot_2001_nu
DESTROY iu_inc_2005_nu
//DESTROY iu_inc_2003_rn

end subroutine

public function integer fw_borrar_registros_dw_nulos (ref datawindow pd_dw);//////////////////////
//	Borra de las datawindow 
//	los registros con fecha de alta nulo
//
//
//////////////////////

int i
int li_filas_viejas, li_filas_nuevas



li_filas_viejas = 1
li_filas_nuevas = 0

DO WHILE li_filas_viejas > li_filas_nuevas
	li_filas_viejas = pd_dw.RowCount()
	
	FOR i = 1 to pd_dw.RowCount()
		IF IsNull(pd_dw.GetItemDateTime(i,"f_alta")) THEN
			pd_dw.DeleteRow(i)		// Borro el registro
			
		END IF
			
	NEXT

	li_filas_nuevas = pd_dw.RowCount()
	
LOOP

return li_filas_nuevas
end function

public function datetime fw_o_fecha_eb ();///////////////////
//	Obtiene la fecha menor de todas las brigadas
//	asignadas a la OT
//
//////////////////

datetime ldt_fecha_retorno
int li_cont

ldt_fecha_retorno = fgnu_fecha_actual()

FOR li_cont = 1 to tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount()
	IF tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemDateTime(li_cont,"f_desde") < ldt_fecha_retorno THEN
		ldt_fecha_retorno = tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemDateTime(li_cont,"f_desde")
	END IF
NEXT

return ldt_fecha_retorno
end function

public function integer fw_asociar_suministro (long pl_nro_aviso);///////////////////////////
//
//	Funcion : fw_asociar_suministro
//
//	Objetivo :	Si se trata de una incidencia de suministro asocia el aviso
//					a la incidencia y dependiendo del estado de la misma
//					resuelve o no el aviso
//
//	Parametros : pl_nro_aviso
//
//	Retorna : 1
//
//
//	Fecha				Responsable			Actuacion
//---------			------------		------------
//	03/10/97				AFS				Creacion
//
//
//////////////////////////////
long ll_cant_avi
datetime ldt_fecha_nula,ldt_fecha

ldt_fecha = fgnu_fecha_actual()

SetNull(ldt_fecha_nula)

IF tab_1.ii_estado_oper >= fgci_incidencia_pendiente and &
		tab_1.ii_estado_oper < fgci_incidencia_servicio_repuesto THEN

	UPDATE "GI_AVISOS"  
		SET "USUARIO" = :gs_usuario,   
			 "F_ACTUAL" = :ldt_fecha,
			 "PROGRAMA" = 'w_2301',
			 "EST_AVISO" = :fgci_aviso_asociado,  
			 "NRO_INCIDENCIA" = :tab_1.il_nro_incidencia,   
			 "IND_INC_MANUAL" = 1,
			 "FECHA_RES" = :ldt_fecha_nula
		WHERE "GI_AVISOS"."NRO_AVISO" = :pl_nro_aviso ;	

	IF sqlca.sqlcode < 0 THEN
		RETURN -1
	END IF

	// Obtengo el valor del campo que contiene la cantidad de 
	// avisos asociado a la incidencia, y lo actualizo 
	// incrementado en 1.
	
	UPDATE "SGD_INCIDENCIA"  
	SET "CANT_AVISOS" = NVL("CANT_AVISOS",0) + 1 
	WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" =:tab_1.il_nro_incidencia;
	
	IF sqlca.SqlCode <> 0 THEN
		gnv_msg.f_mensaje("EA10","","",OK!)
		RETURN -1
	END IF
	
	IF sqlca.SqlCode = 0 THEN
	
		// Actualizo 'Avisos_Res'
		UPDATE "GI_AVISOS_INSTALACION"  
		SET "USUARIO" = :gs_usuario,   
			 "F_ACTUAL" = :ldt_fecha,   
			 "PROGRAMA" = 'ASOC_MAN',   
			 "EST_AVISO" = :fgci_aviso_asociado
		WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_aviso; 
	
		IF sqlca.SqlCode <> 0 THEN
			gnv_msg.f_mensaje("EA06","","",OK!)
			RETURN -1
		END IF

	END IF

ELSEIF tab_1.ii_estado_oper >= fgci_incidencia_servicio_repuesto THEN
	
  UPDATE "GI_AVISOS"  
     SET "EST_AVISO" = :fgci_aviso_resuelto,   
         "NRO_INCIDENCIA" = :tab_1.il_nro_incidencia,   
         "FECHA_RES" = :tab_1.idt_fecha_sr,   
         "IND_INC_ASOC" = 1  
   WHERE "GI_AVISOS"."NRO_AVISO" = :pl_nro_aviso   ;

	IF sqlca.sqlcode < 0 THEN
		RETURN -1
	END IF
	
	DELETE FROM "GI_AVISOS_INSTALACION" WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_aviso;
	
	IF sqlca.sqlcode < 0 THEN
		RETURN -1
	END IF
	
END IF

//AHM (03/07/2009) Mejora 1/446555
IF fg_verifica_parametro('CARGA AUTOMATICA OBSERVACIONES SEGUIMIENTO') THEN
	fw_cargarObservacionesEstadoPendiente()
END IF


Return 1

end function

public function integer fnu_liberar_brigadas ();////////////////////////
////
////	Libera las brigadas que finalizaron tareas
////	siempre y cuando no esten asociadas a otra OT
////
////
////	
////
/////////////////////

int li_disponible
int li_no_disponible,li_contador
datetime ld_desde,ld_hasta
long ll_nro_brigada

li_disponible = fgci_disponible
li_no_disponible = fgci_no_disponible

for li_contador=1 to tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount()

	ld_desde = tab_1.tabpage_ot.d_lista_brigadas_ot.object.f_desde[li_contador]
	ld_hasta = tab_1.tabpage_ot.d_lista_brigadas_ot.object.f_hasta[li_contador]
	ll_nro_brigada = tab_1.tabpage_ot.d_lista_brigadas_ot.object.nro_brigada[li_contador]
	
	if not isnull(ld_desde) and not isnull(ld_hasta) then
		UPDATE "GI_BRIGADA"  
			SET "IND_DISPONIBLE" = :li_disponible  
			WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;	
	end if

	if not isnull(ld_desde) and isnull(ld_hasta) then
		UPDATE "GI_BRIGADA"  
			SET "IND_DISPONIBLE" = :li_no_disponible  
			WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;	
	end if
next	

Return 1

end function

public function integer fw_evaluar_brig_desdrag ();
tab_1.tabpage_ot.d_datos_ot.SetItem(1,"ult_brigada",tab_1.fnu_devolver_brigada_resp(tab_1.tabpage_ot.d_lista_brigadas_ot)) 
RETURN 1
end function

public function integer fw_cambia_bitmap ();uo_barra.p_1.visible=true
choose case i_vez
		case 1
			uo_barra.p_1.picturename="reloj1.bmp"
		case 2
			uo_barra.p_1.picturename="reloj2.bmp"
		case 3
			uo_barra.p_1.picturename="reloj3.bmp"
		case 4
			uo_barra.p_1.picturename="reloj4.bmp"
		case 5
			uo_barra.p_1.picturename="reloj5.bmp"
		case 6
			uo_barra.p_1.picturename="reloj6.bmp"
		case 7
			uo_barra.p_1.picturename="reloj7.bmp"
		case 8
			uo_barra.p_1.picturename="reloj8.bmp"
			i_vez=0
end choose
i_vez ++
return 1
end function

public function integer fw_asociar_avisos_calidad (long pl_nro_instalacion, datetime pdt_fecha_1, datetime pdt_fecha_2);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion/Evento: fw_asociar_avisos_calidad
//
// Objetivo: La forma en que la funcion asocia los avisos de calidad es muy sencilla, cuando se genera una Incidencia de 
//			   calidad, los avisos que dependan de la instalacion sobre la que se esta dando de alta la Incidencia quedaran
//              asociados automaticamente a ella desde el estado PT. hasta el estado OF que es donde quedarian resueltos. 
//              Aparte de esta asociacion automatica inicial, los avisos podran asociarse posteriormente, solo de forma manual-
//         
// Ambito:  Publico

//
// Parametros:
//
//        Entrada:
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuacion
// --------             -------------------             --------------
// 27/04/2000	    FDO
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_aviso
datetime ldt_fecha_nula, ldt_fecha_actual
int li_aviso_asociado=3,li_aviso_resuelto=5

setnull (ldt_fecha_nula)

ldt_fecha_actual = fgnu_fecha_actual()



// Creo un cursor que extrae los datos unicamente de Gi_avisos, Gi_avisos_res, Gi_aviso_ins pues en estas tablas tengo 
// todos los datos iniciales para poder asociar los avisos.

DECLARE lcur_avisos CURSOR FOR 
SELECT GI_AVISOS_INSTALACION.NRO_AVISO
FROM  GI_AVISOS_INSTALACION 
WHERE GI_AVISOS_INSTALACION.F_ALTA >= :pdt_fecha_1 
  AND GI_AVISOS_INSTALACION.CLASE_AVISO= :fgci_clase_avi_calidad 
  AND GI_AVISOS_INSTALACION.NRO_INSTALACION = :pl_nro_instalacion
  AND GI_AVISOS_INSTALACION.EST_AVISO < :fgci_aviso_asociado
FOR UPDATE NOWAIT;

// Compruebo antes que nada que la incidencia sea de calidad instalacion
IF tab_1.ii_tipo_incid=fgci_incidencia_calidad and tab_1.ii_alcance = fgci_incidencia_de_instalacion  then
	
	// Debo saber si he asociado previamente o no, para lo cual tengo que comprobar si estoy dando de alta en este momento
	// la incidencia o previamente la he dado de alta.
	
	IF	tab_1.is_accion_llamada = "Alta" or &
		tab_1.is_accion_llamada = "Alta_nivel_instalacion" then

		// Muestro el Indicador Grafico.
		timer(.1,this)
		fw_cambia_bitmap()			
			
		OPEN lcur_avisos;

		IF SQLCA.SQLCODE=-1 THEN
			gnv_msg.f_mensaje("EA23","","",OK!)
			RETURN -1
		END IF
			
		FETCH 	lcur_avisos INTO :ll_nro_aviso;

		DO WHILE sqlca.sqlcode = 0 

			fw_cambia_bitmap()

			// Dependiendo del estado en el que se encuentre la incidencia, voy a asociar o resolver
							
			IF tab_1.ii_estado_oper < fgci_incidencia_ot_finalizada then	
			
				 // Lo asocio
		
				UPDATE "GI_AVISOS"  
				SET 	"EST_AVISO" = :li_aviso_asociado,   
						"FECHA_RES" = :ldt_fecha_nula,   
						"HORA_RES" = :ldt_fecha_nula ,
						"F_ACTUAL" = :ldt_fecha_actual,
						"NRO_INCIDENCIA" = :tab_1.il_nro_incidencia,
						"IND_INC_ASOC" = 1,
						"PROGRAMA" = 'W_2301'				
				WHERE "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso   ;
	
				IF SQLCA.SQLCODE=-1 THEN
					gnv_msg.f_mensaje("EA23","","",OK!)
					RETURN -1
				END IF
						
				UPDATE "GI_AVISOS_INSTALACION"  
				 SET  "EST_AVISO" = :li_aviso_asociado,   
					"F_ACTUAL" = :ldt_fecha_actual,
					"PROGRAMA" = 'W_2301'    
				 WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso;  

				 IF SQLCA.SQLCODE=-1 THEN
					gnv_msg.f_mensaje("EA23","","",OK!)
					RETURN -1
				 END IF
						
				 UPDATE "GI_AVISOS_INSTALACION"  
				 SET  "IND_INCIDENCIA" = 1    
				 WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso  
					AND "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pl_nro_instalacion; 

		
				IF SQLCA.SQLCODE=-1 THEN
					gnv_msg.f_mensaje("EA23","","",OK!)
					RETURN -1
				END IF
			
//				tab_1.fnu_v_sum_imp4(ll_nro_instalacion,tab_1.il_nro_incidencia)
				
			ELSE

				// Muestro el Indicador Grafico.
		
				fw_cambia_bitmap()			
								
				// En este caso voy a resolver los avisos.
		
				UPDATE "GI_AVISOS"  
				SET 	"EST_AVISO" = :li_aviso_resuelto,   
						"FECHA_RES" = :pdt_fecha_2,   
						"HORA_RES" = :pdt_fecha_2 ,
						"F_ACTUAL" = :ldt_fecha_actual,
						"NRO_INCIDENCIA" = :tab_1.il_nro_incidencia,
						"IND_INC_ASOC" = 1,
						"PROGRAMA" = 'W_2301'				
				WHERE "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso   ;
	
				IF SQLCA.SQLCODE=-1 THEN
					gnv_msg.f_mensaje("EA23","","",OK!)
					RETURN -1
				END IF
		
				DELETE "GI_AVISOS_INSTALACION" 
				WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso;
				
				IF SQLCA.SQLCODE=-1 THEN
					gnv_msg.f_mensaje("EA23","","",OK!)
					RETURN -1
				END IF
				
//				tab_1.fnu_b_sum_imp4(ll_nro_instalacion,tab_1.il_nro_incidencia,pl_nro_instalacion)
	
			END IF	

				FETCH 	lcur_avisos INTO :ll_nro_aviso ;
	
		LOOP

		CLOSE lcur_avisos;
		
		//AHM (03/07/2009) Mejora 1/446555
		
		IF fg_verifica_parametro('CARGA AUTOMATICA OBSERVACIONES SEGUIMIENTO') THEN
			fw_cargarObservacionesEstadoPendiente()
		END IF
					
	ELSE 
		
		IF tab_1.ii_estado_oper >= fgci_incidencia_ot_finalizada then
		
			// Esto significa que previamente he asociado luego tengo que resolver.

			// Muestro el Indicador Grafico.
			
			timer(.1,this)
			fw_cambia_bitmap()

			UPDATE "GI_AVISOS"  
			SET 	"EST_AVISO" = :li_aviso_resuelto,   
					"FECHA_RES" = :pdt_fecha_2,   
					"HORA_RES" = :pdt_fecha_2  ,
					"F_ACTUAL" = :ldt_fecha_actual,
					"PROGRAMA" = 'W_2301'
			WHERE "GI_AVISOS"."NRO_INCIDENCIA" = :tab_1.il_nro_incidencia;
			
			IF SQLCA.SQLCODE=-1 THEN
				gnv_msg.f_mensaje("EA23","","",OK!)
				RETURN -1
			END IF
						
			DELETE "GI_AVISOS_INSTALACION" 
			WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" IN 
			(SELECT "GI_AVISOS"."NRO_AVISO" FROM "GI_AVISOS" 
			WHERE "GI_AVISOS"."NRO_INCIDENCIA" = :tab_1.il_nro_incidencia);
			
			IF SQLCA.SQLCODE=-1 THEN
				gnv_msg.f_mensaje("EA23","","",OK!)
				RETURN -1
			END IF
	
//			tab_1.fnu_b_sum_imp4(ll_nro_instalacion,tab_1.il_nro_incidencia,pl_nro_instalacion)
	
		END IF
	
	END IF

END IF

return 1
end function

public subroutine fw_evaluo_inc_calidad (integer pi_tipo_incidencia, boolean pb_ya_generada, integer pi_alcance);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion/Evento: fw_evaluo_inc_calidad
//
// Objetivo: Realiza las opciones de entrada dependiendo del tipo de incidencia que sea
//			   (Normal, Descargo) o bien (Calidad, Suministro, Descargo sin interrupcion) y teniendo en cuenta que
//               la incidencia ha sido abierta desde Gestion de avisos o esta siendo abierta o
//			   por el contrario esta siendo generada desde Incidencias, la funcion se comportara de distinta
//			   manera. 
//         
// Ambito:  Publico
//
// Parametros:
//
//        Entrada: pi_tipo_incidencia -> 0 = Normal
//												1 = Calidad, Suministro, Descargo sin interrupcion.
//					 pi_ind_suministro -> 1 = Incidencia de suministro
//												2 = Incidencia normal
//
//					 pb_ya_generada -> true, deshabilita el poder elegir
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuacion
// --------             -------------------             --------------
// 07/04/2000	    FDO
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string ls_est_op,ls_select,ls_rc,ls_mod_string, ls_filtro_estados
int li_valido, li_ind_act_grafica

//if not isvalid(w_barra) then OPEN(W_BARRA,this)

//W_BARRA.uo_barra.barra.f_amplia(1)

li_valido = tab_1.tabpage_formulario.d_inf_general.GetChild ( "estado_actual",ddch_estado )

li_valido = ddch_estado.settransobject(sqlca)

//W_BARRA.uo_barra.barra.f_amplia(2)

// Setea la dropdown del datawindows general de la incidencia y la variable del tab, siempre que la incidencia
// no sea de suministro

tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1]=pi_tipo_incidencia
tab_1.ii_tipo_incid = pi_tipo_incidencia

if pi_tipo_incidencia = fgci_incidencia_calidad &
	or pi_alcance = fgci_incidencia_de_suministro &
	or pi_alcance = fgci_incidencia_sin_interrupcion then
//W_BARRA.uo_barra.barra.f_amplia(3)
	// La incidencia es de Calidad, Suministro, Imprevista, de Scada o Descargo sin interrupcion,
	// o un reenganche de Scada
	// Setea el seguimiento como incidencias de Calidad, Suministro, Descargo.
	tab_1.tabpage_seguimiento.chk_resolucion_mant.visible=false
	
	// En este tipo de incidencias la fase sugerida no se hace visible
	tab_1.tabpage_formulario.st_fases.visible = FALSE
	tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida.visible = FALSE
	tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida_t.visible = FALSE
	
	if pi_alcance <> fgci_incidencia_sin_interrupcion THEN
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible=FALSE	
	END IF
	
	tab_1.tabpage_seguimiento.d_estados_operaciones.visible=false
	tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible=false
	
	// Si la incidencia es imprevista sin perdidas pero la ha dado de alta el OPEN-SGI, el
	// tab de interrupciones permanecera visible para permitir que se pueda convertir en 
	// una incidencia imprevista con perdida. En el caso de que la incidencia se haya dado de
	// alta desde operaciones el tab se hace invisible
//W_BARRA.uo_barra.barra.f_amplia(4)
	IF pi_alcance = fgci_incidencia_sin_interrupcion &
		AND fw_incidencia_de_operaciones() then
		// Incidencia imprevista sin perdida dada de alta desde operaciones
		tab_1.tabpage_interrupciones.visible = false
		// El tabpage de maniobras se hace visible
		tab_1.tabpage_maniobras.visible = TRUE
//W_BARRA.uo_barra.barra.f_amplia(5)
	//ELSEIF pi_tipo_incidencia = fgci_incidencia_scada AND pi_alcance = fgci_incidencia_sin_interrupcion THEN
		// Incidencia scada sin perdida. Se hace visible el tabpage de maniobras
	//	tab_1.tabpage_maniobras.visible = TRUE
	ELSE
		tab_1.tabpage_maniobras.visible = FALSE
	END IF
		  
	// Si el estado de la incididencia es mayor o igual que enviado brigada y del tipo sin interrupcion,
	// el chekbox Finalizar OT se mostrara.
//W_BARRA.uo_barra.barra.f_amplia(6)
	if tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada THEN
//		IF pi_tipo_incidencia <> fgci_incidencia_imprevista AND NOT fw_incidencia_de_operaciones() THEN
		
		// El checkbox de fin de OT se hara visible en el caso de las incidencias:

		//			--> todas las de calidad
		//			--> las incidencias imprevistas de suministro
		//			--> las incidencias imprevistas sin perdidas dadas de alta desde el OpenSgi
//		IF pi_tipo_incidencia = fgci_incidencia_calidad OR pi_alcance = fgci_incidencia_de_suministro &
//			OR (pi_alcance = fgci_incidencia_sin_interrupcion AND pi_tipo_incidencia <> fgci_incidencia_scada AND &
//				 NOT fw_incidencia_de_operaciones()) THEN
//		
//			//tab_1.tabpage_ot.cbx_fin_ot.visible=true (comentado por LFE)
//			
//			if tab_1.ii_estado_oper > fgci_incidencia_enviado_brigada then
//				// La OT se encuentra finalizada
//				tab_1.tabpage_ot.cbx_fin_ot.checked=true
//				tab_1.tabpage_ot.cbx_fin_ot.enabled=false
//			END IF
//		ELSE
//			tab_1.tabpage_ot.cbx_fin_ot.visible=false
//		END IF (comentado por LFE)
		
		if tab_1.ii_estado_oper >= fgci_incidencia_en_reposicion then
//W_BARRA.uo_barra.barra.f_amplia(7)
			// Se deshabilitan los controles del tabpage de brigadas
			tab_1.tabpage_ot.d_crit_seleccion.enabled=false
			tab_1.tabpage_ot.d_crit_seleccion.object.pi_tipo_brig.background.color=gs_gris
			tab_1.tabpage_ot.d_crit_seleccion.object.pdt_fecha_turno.background.color=gs_gris


			tab_1.tabpage_ot.d_crit_seleccion.object.pi_brigadas_en_turno.background.color=gs_gris
			tab_1.tabpage_ot.tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.enabled=false
			tab_1.tabpage_ot.tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.enabled=false
			tab_1.tabpage_ot.dw_lista_contratas.enabled = false
		END IF
		
	end if
	
	// Cambio el dataobject y posiciono la datawindows en la ventana
//	if pi_tipo_incidencia = fgci_incidencia_calidad &
//W_BARRA.uo_barra.barra.f_amplia(8)
	IF pi_alcance = fgci_incidencia_de_suministro or gb_mantenimiento = FALSE then 
//		or (pi_tipo_incidencia = fgci_incidencia_imprevista and pi_alcance = fgci_incidencia_sin_interrupcion) then
		
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seg_sin_int'

//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.x=142
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.y=184
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.width=3410
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.height=1248
	else
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seguimiento_operacion'

	end if
//W_BARRA.uo_barra.barra.f_amplia(9)
else
	//tab_1.tabpage_ot.cbx_fin_ot.visible=false (comentado por LFE)
	// Setea el seguimiento como incidencias normales
	tab_1.tabpage_interrupciones.visible = TRUE
//W_BARRA.uo_barra.barra.f_amplia(10)
	IF fw_incidencia_de_operaciones() THEN
//W_BARRA.uo_barra.barra.f_amplia(11)
		tab_1.tabpage_maniobras.visible = TRUE
		// si la incidencia se ha dado de alta desde operacion, no se muestra la fase sugerida
		tab_1.tabpage_formulario.st_fases.visible = FALSE
		tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida.visible = FALSE
		tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida_t.visible = FALSE
	ELSE
		// En este tipo de incidencias se hace invisible la fase sugerida si la red se opera en trifasico
//W_BARRA.uo_barra.barra.f_amplia(12)
		IF gb_red_trifasica THEN 
			tab_1.tabpage_formulario.st_fases.visible = FALSE
			tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida.visible = FALSE
			tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida_t.visible = FALSE
		ELSEIF lu_comunic.is_comunic.Accion_llamada = "Consulta" THEN
			tab_1.tabpage_formulario.st_fases.visible = FALSE
		END IF
	END IF
//W_BARRA.uo_barra.barra.f_amplia(13)
	IF pi_tipo_incidencia = fgci_incidencia_programada THEN 
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = FALSE
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seg_sin_int'
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.x=142
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.y=184
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.width=3410
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.height=1248
		
	ELSE
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = gb_mantenimiento
		IF gb_mantenimiento = FALSE THEN
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seg_sin_int'
//			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.x=142
//			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.y=184
//			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.width=3410
//			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.height=1248
		ELSE
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seguimiento_operacion'
		END IF

	END IF
	
end if
//W_BARRA.uo_barra.barra.f_amplia(14)
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.settransobject(sqlca)

if pb_ya_generada then
	// Deshabilita la drop para elegir el tipo de incidencia
	tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.background.color=gs_gris
	tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.protect=1

end if
//W_BARRA.uo_barra.barra.f_amplia(15)
	
ls_est_op="'E_OP'"
li_valido = ddch_estado.retrieve('E_OP')
if pi_tipo_incidencia=fgci_incidencia_calidad OR pi_alcance = fgci_incidencia_sin_interrupcion then
	
	ddch_estado.SetFilter("codigo <> " + string(fgci_incidencia_en_reposicion) )
	ddch_estado.Filter()

end if
//W_BARRA.uo_barra.barra.f_amplia(16)

if pi_tipo_incidencia = fgci_incidencia_calidad &
	or pi_alcance = fgci_incidencia_de_suministro &
	or pi_alcance = fgci_incidencia_sin_interrupcion then

	ls_filtro_estados = " AND SGD_VALOR.CODIF = 'E_OP' AND SGD_VALOR.CODIGO <> " + STRING(fgci_incidencia_en_reposicion) 
	
	ls_filtro_estados =	ls_filtro_estados + " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_resuelta)
else
	if gb_mantenimiento = TRUE and pi_tipo_incidencia <> fgci_incidencia_programada then
		ls_filtro_estados = " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_cerrada) + " AND SGD_VALOR.CODIF = 'E_OP' "
	else
		ls_filtro_estados = " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_resuelta) + " AND SGD_VALOR.CODIF = 'E_OP' "
	end if
	// Si la incidencia es programada, entonces no tendra estado pendiente
end if
//ACO-DESCARGOS
//W_BARRA.uo_barra.barra.f_amplia(17)
if pi_tipo_incidencia = fgci_incidencia_programada then
	  SELECT "SGD_DESCARGOS"."IND_ACT_GRAFICA"  
    INTO :li_ind_act_grafica  
    FROM "SGD_DESCARGOS"  
   WHERE "SGD_DESCARGOS"."NRO_INCIDENCIA" = :tab_1.il_nro_incidencia   ;
    if li_ind_Act_grafica = 1 then 
		if pi_alcance = fgci_incidencia_sin_interrupcion then
				ls_filtro_estados = " AND (SGD_VALOR.CODIGO <= " + string(fgci_incidencia_resuelta) +" OR  SGD_VALOR.CODIGO = " + string(fgci_incidencia_pte_explotacion) +") AND SGD_VALOR.CODIF = 'E_OP' AND SGD_VALOR.CODIGO <> " + STRING(fgci_incidencia_en_reposicion)			
			else
				ls_filtro_estados = " AND (SGD_VALOR.CODIGO <= " + string(fgci_incidencia_resuelta) +" OR  SGD_VALOR.CODIGO = " + string(fgci_incidencia_pte_explotacion) +") AND SGD_VALOR.CODIF = 'E_OP' "
			end if				
	end if	
end if	
//W_BARRA.uo_barra.barra.f_amplia(19)

ls_select = " SELECT  SGD_VALOR.VALOR, SGD_VALOR.CODIGO " + &
				" FROM SGD_VALOR " + &      
				" WHERE SGD_VALOR.CODIGO <> 0 AND SGD_VALOR.CODIGO <> 99 " + ls_filtro_estados + " " + &
				" ORDER BY SGD_VALOR.CODIGO"  	

ls_mod_string = "DataWindow.Table.Select=~" " + ls_select + "~""

ls_rc = tab_1.tabpage_seguimiento.d_estados_operaciones.Modify(ls_mod_string)
//W_BARRA.uo_barra.barra.f_amplia(20)

IF ls_rc <> "" THEN
	MessageBox("Status", "Modify Failed" + ls_rc)
END IF
//W_BARRA.uo_barra.barra.f_amplia(21)

iu_eop_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_operaciones,tab_1.ii_tipo_incid)
//W_BARRA.uo_barra.barra.f_amplia(22)

tab_1.fnu_obte_estados_oper()
//W_BARRA.uo_barra.barra.f_amplia(23)

tab_1.fnu_obte_estados_mant()
//W_BARRA.uo_barra.barra.f_amplia(24)

//CLOSE(W_BARRA)

end subroutine

public function integer fnu_crea_objetos (window pw_ventana);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_crea_objetos
// 
// Objetivo: Crea los objetos de comunicaciones a utilizar en la ventana
//
//	Ambito:	Publico
//
// Parametros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuacion
// ---------	-------		----------------------------------------
//		
//
////////////////////////////////////////////////////////////////////////////////////////////////

								//ESTRUCTURA DE COMUNICACIONES PARA TRABAJO
lu_comunic = CREATE u_generico_comunicaciones
lu_comunic1 = CREATE u_generico_comunicaciones
 						   //NUCLEO DE INF GENERAL
iu_inc_2003_nu = CREATE u_inc_2003_nu_form_inf_general
iu_inc_2004_nu = CREATE u_inc_2004_nu_form_inf_general
iu_inc_2004_nu.iw_contenedora= pw_ventana

iu_inc_2004_rn = CREATE u_inc_2004_rn_form_inf_general
				 		//NUCLEO AVISOS
lu_avi_1002_nu =	CREATE u_avi_1002_nu_generico
iu_inc_2005_nu = create u_inc_2005_nu_detalle_interrup
iu_inc_2003_nu.iw_contenedora= this
Return 1

end function

public function integer fw_inst_afectadas_operaciones ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion/Evento: fw_inst_afectadas_operaciones
//
// Objetivo: Funcion que carga en la dw dw_lista_inst_operaciones un listado con los CT's
// 				afectados, y en la dw dw_lista_acometidas, las acometidas interrumpidas
//					asociadas al CT seleccionado en dw_lista_inst_operaciones
//		
//         
// Ambito:  Publico
//
// Parametros:
//
//        Entrada:
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuacion
// --------       -------------------             --------------
// 10/08/2000	    LFE
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int li_codigo_nivel, li_tension
string ls_tipo_inst, ls_select, ls_mod_string, ls_rc, ls_tension, ls_nom_ct
long ll_nro_incidencia, ll_codigo_ct, ll_fila, ll_codigo
long ll_pendientes, ll_resueltas

long ll_altas_a, ll_altas_b, ll_altas_c, ll_bajas_a, ll_bajas_b, ll_bajas_c

tab_1.tabpage_formulario.d_inf_general.Modify("f_deteccion.background.color = " + gs_gris)
tab_1.tabpage_formulario.d_inf_general.Modify("f_deteccion.protect = 1")

if tab_1.ii_estado_oper > fgci_incidencia_pendiente then
	tab_1.tabpage_ot.d_lista_brigadas_ot.&
					Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))		
end if

// Si la incidencia es con perdida se debe de transformar el tab de interrupciones para 
// que en vez de mostrar el arbol muestre datawindows con los datos de las interrupciones
// dadas de alta desde el modulo de operaciones
IF ((tab_1.ii_tipo_incid = fgci_incidencia_imprevista) &
	AND tab_1.ii_alcance = fgci_incidencia_con_interrupcion) &
	OR tab_1.ii_tipo_incid = fgci_incidencia_programada  THEN

	// Se comprueba si la instalacion afectada tiene representacion grafica
	li_tension = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension")

	IF li_tension <= gi_tension_nivel_min THEN
		
		
		IF (li_tension <= gi_tension_nivel_min) OR &
			(gi_tension_nivel_min = fgci_media_tension AND ii_tipo_instalacion <> fgci_tipo_ct) THEN
			
			tab_1.tabpage_formulario.st_fases.visible = FALSE
			IF string(This.classname()) <> "w_2301_hist_form_incidencia" THEN
				// En el caso de no estar en la ventana de historicos se comprueba si la 
				// incidencia dada de alta desde operaciones ha interrumpido CT's o acometidas
				fw_comp_inst_int()
			END IF
			
			tab_1.tabpage_interrupciones.dw_lista_int_operaciones.visible = true
			tab_1.tabpage_interrupciones.st_lista_int_operaciones.visible = true
			
			tab_1.tabpage_interrupciones.dw_lista_int_operaciones.SetTransObject(SQLCA)
	
			ll_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,'nro_incidencia')
			tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Retrieve(ll_nro_incidencia)
	
			IF gi_tension_nivel_min < fgci_baja_tension AND tab_1.is_tipo_ventana = "w_2301_hist" THEN
				// Si estamos en la ventana de historicos y operaciones ha interrumpido CT's se
				// traen los datos de los CT's interrumpidos de la incidencia
				tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(ll_nro_incidencia)
			END IF
			
			tab_1.tabpage_interrupciones.tv_1.visible = FALSE
			tab_1.tabpage_interrupciones.rb_otras_inc.visible = FALSE
			tab_1.tabpage_interrupciones.rb_misma_inc.visible = FALSE
			tab_1.tabpage_interrupciones.d_lista_otras_inst.visible = FALSE
			tab_1.tabpage_interrupciones.d_lista_otras_inst.visible = FALSE
			
			IF tab_1.tabpage_interrupciones.dw_lista_int_operaciones.RowCount() = 0 OR &
				(gi_tension_nivel_min < fgci_baja_tension &
				 AND tab_1.is_tipo_ventana = "w_2301_hist")  THEN 
				// Si operaciones ha interrumpido CT's y la ventana es la de historicos o 
				// no se han encontrado CT's interrumpidos asociados a la incidencia
				// no se hace visible la datawindow que muestra las acometidas
								
				// En el historico no se muestran acometidas en el caso de que operaciones
				// haya interrumpido CT's, ya que estas no se almacenan en ninguna tabla
				tab_1.tabpage_interrupciones.dw_lista_acometidas.visible = False
				tab_1.tabpage_interrupciones.st_otras_inst.Visible = False
	
				IF tab_1.tabpage_interrupciones.dw_lista_int_operaciones.RowCount() > 0 THEN
					tab_1.tabpage_interrupciones.st_datos_interrup.visible = true
				END IF
				
			ELSE
				// Si operaciones ha interrumpido acometidas, o ha interrumpido CT's pero la 
				// ventana no es la de historicos entonces se hace visible la dw de acometidas
				tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Selectrow(1,True)
				tab_1.tabpage_interrupciones.dw_lista_acometidas.visible = True
				tab_1.tabpage_interrupciones.st_datos_interrup.visible = true
				ls_nom_ct = tab_1.tabpage_interrupciones.dw_lista_int_operaciones.GetItemString(1, "nom_instalacion")
				tab_1.tabpage_interrupciones.st_otras_inst.Text=" Acometidas interrumpidas del CT " + ls_nom_ct
				ll_codigo_ct = tab_1.tabpage_interrupciones.dw_lista_int_operaciones.GetItemNumber(1, "codigo")
				tab_1.tabpage_interrupciones.dw_lista_acometidas.Retrieve(ll_codigo_ct,ll_nro_incidencia)
				tab_1.tabpage_interrupciones.st_durac.text="Duracion Int.:"
				
				IF tab_1.tabpage_interrupciones.dw_lista_acometidas.RowCount() > 0 THEN
					tab_1.tabpage_interrupciones.st_otras_inst.Width = 2336
					tab_1.tabpage_interrupciones.d_datos_interrup.visible = TRUE
					tab_1.tabpage_interrupciones.st_datos_interrup.visible = TRUE
					tab_1.tabpage_interrupciones.dw_lista_acometidas.SelectRow(0, False)
					tab_1.tabpage_interrupciones.dw_lista_acometidas.SelectRow(1,True)
					tab_1.tabpage_interrupciones.st_durac.visible = true
					tab_1.tabpage_interrupciones.st_duracion.visible = true
				ELSE
//					tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Width = 3429 Agregar mas tarde
//					tab_1.tabpage_interrupciones.st_lista_int_operaciones.Width = 3429
//					tab_1.tabpage_interrupciones.dw_lista_acometidas.width = 3429
//					tab_1.tabpage_interrupciones.st_otras_inst.Width = 3429
//					tab_1.tabpage_interrupciones.d_datos_interrup.visible = FALSE
//					tab_1.tabpage_interrupciones.st_datos_interrup.visible = FALSE
				END IF
				
				IF gi_tension_nivel_min = fgci_media_tension THEN
					SELECT COUNT(DISTINCT(NRO_INSTALACION))
					INTO :ll_resueltas
					FROM SGD_INTERRUPCION
					WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia;
										
					SELECT COUNT(DISTINCT(NRO_INSTALACION))
					INTO :ll_pendientes
					FROM SGD_INTERRUPCION
					WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia
						AND F_REPOSICION IS NULL;
									
//					ll_resueltas = ll_resueltas - ll_pendientes	
					
					IF gb_red_trifasica THEN
						select count(DISTINCT(NRO_INSTALACION)) 
						into :ll_pendientes
						from sgd_interrupcion
						where nro_incidencia=:tab_1.il_nro_incidencia
						and ((not (f_alta_fase_a is null) and 
						f_reposicion_fase_a is null) or
						(not (f_alta_fase_b is null) and 
						f_reposicion_fase_b is null) or
						(not (f_alta_fase_c is null) and 
						f_reposicion_fase_c is null));
					END IF
					ll_resueltas = ll_resueltas - ll_pendientes
									
					tab_1.tabpage_interrupciones.st_lista_int_operaciones.Text = "CT's afectados por la Incidencia." + " (Pendientes:" &
										+ string(ll_pendientes) + ") (Resueltos:" + string(ll_resueltas) + ")" 
				END IF
							
			END IF
					
		END IF
	END IF

// Si la incidencia es sin perdida no se modifica el tab de interrupciones
ELSEIF (tab_1.ii_tipo_incid = fgci_incidencia_imprevista) &
		 AND tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
	
		tab_1.tabpage_formulario.st_fases.visible = FALSE
		tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida.visible = FALSE

END IF

return 1
end function

public function integer fw_comp_inst_int ();///////////////////////////
//
//	Funcion : fw_comp_inst_int
//
//	Objetivo :	Funcion que modifica:
//						-> la select asociada a la datawindow dw_lista_int_operaciones en el caso
//							de que exista interfaz con operaciones, y operaciones interrumpa CT.
//							El motivo del cambio es que los CT's se obtienen directamente de la
//							tabla SGD_INTERRUPCION
//			
//						-> la select asociada a la datawindow dw_lista_acometidas en el mismo caso 
//							anterior, ya que las acometidas hay que obtenerlas de SGD_ACOMETIDA, en
//							lugar de SGD_INTERRUPCION
//
//
//	Parametros : 
//
//	Retorna : 
//
//
//	Fecha				Responsable			Actuacion
//---------			------------		------------
//	16/02/01				LFE				Creacion
//
//

//////////////////////////////

string ls_select_ct, ls_select_aco,ls_filtro_acom

IF gi_tension_nivel_min < fgci_baja_tension THEN
	// No existe representacion grafica en Baja tension. Operaciones ha interrumpido CT's. 
	// Hay que cambiar las SELECT de las datawindows para que obtengan las instalaciones
	// de otra manera

ls_select_ct = ' SELECT DISTINCT(SGD_INSTALACION.NRO_INSTALACION),  ' +&
						'			SGD_INSTALACION.NOM_INSTALACION,  ' +&
						'			NVL(SGD_INTERRUPCION.CCLI_AFEC, 0), ' +&
						'			NVL(SGD_INSTALACION.CANT_CLI,0),  ' +&
						'			NVL(SGD_INSTALACION.POT_INSTALADA,0), ' +&
						'			NVL(SGD_INTERRUPCION.POT_INST_AFEC,0),  ' +&
						'			NVL(SGD_INSTALACION.POT_CONTRATADA,0), ' +&
						'			NVL(SGD_INTERRUPCION.POT_CONTR_AFEC,0), ' +&
						'			SGD_INTERRUPCION.NOMBRE_SALMT,  ' +&
						'        sgd_valor.descripcion, ' +&
						'			SGD_INTERRUPCION.F_ALTA,  ' +&
						'			SGD_INTERRUPCION.F_REPOSICION,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE_FASE_A,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE_FASE_B,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE_FASE_C  ' +&
						'FROM SGD_INTERRUPCION, SGD_INSTALACION, sgd_valor ' +&
						'WHERE SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia  ' +&
						'  AND SGD_INTERRUPCION.NRO_INSTALACION = SGD_INSTALACION.NRO_INSTALACION  ' +&
						'  AND SGD_INSTALACION.BDI_JOB = 0 ' +&
						'  AND SGD_VALOR.CODIF = '+ "'FASE'" +  &
						'  AND SGD_VALOR.VALOR=SGD_INTERRUPCION.FASE_AFECTADA'
						
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Object.DataWindow.Table.Select = ls_select_ct
	
	ls_select_aco = 	'SELECT DISTINCT(SGD_ACOMETIDA.CODIGO), ' +&
							' NVL(SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.CODIGO) NOM_ACOMETIDA, ' +&
							' fgnu_calle_referencia(callejero.nom_calle, SGD_ACOMETIDA.num_puerta, SGD_ACOMETIDA.duplicador, SGD_ACOMETIDA.nif, SGD_ACOMETIDA.cod_calle, 0, ~'~', 0, ~'~') cdireccion, ' + &
							' sgd_valor.descripcion, ' +& 
							' FGNU_FASE_AFECTADA(SGD_ACOMETIDA.TIPO_CONEXION, SGD_INTERRUPCION.FASE_AFECTADA) fase_afectada' +&
							' FROM SGD_ACOMETIDA, ' +&
							' SGD_INTERRUPCION, ' +&
							' CALLEJERO, ' +&
							' SGD_VALOR' +&
							' WHERE SGD_INTERRUPCION.NRO_INSTALACION = :pl_codigo_ct ' +&
							' AND SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia ' +&
							' AND SGD_ACOMETIDA.INSTALACION_ORIGEN IN (select nro_instalacion FROM SGD_instalacion  ' +&		
							' START WITH SGD_INSTALACION.NRO_INSTALACION = :pl_codigo_ct ' +&
			 				' CONNECT BY PRIOR NRO_INSTALACION = NRO_INST_PADRE) ' +&
							' AND SGD_ACOMETIDA.BDI_JOB = 0 ' +&
							' AND SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE ' +&
						'  AND SGD_VALOR.CODIF = '+ "'FASE'" +  &
						'  AND SGD_VALOR.VALOR=SGD_INTERRUPCION.FASE_AFECTADA'
							
	tab_1.tabpage_interrupciones.dw_lista_acometidas.Object.DataWindow.Table.Select = ls_select_aco
	
	ls_filtro_acom = " fase_afectada = 1"
	tab_1.tabpage_interrupciones.dw_lista_acometidas.setfilter(ls_filtro_acom)
	tab_1.tabpage_interrupciones.dw_lista_acometidas.filter()

END IF


return 1
end function

public function boolean fw_incidencia_de_operaciones ();long ll_nro_instalacion, ll_cant_maniobras, ll_cant_int

IF ii_incidencia_de_op = 0 THEN
	Return FALSE
ELSEIF ii_incidencia_de_op = 1 THEN
	Return TRUE
ELSE

IF lu_comunic.is_comunic.accion_llamada = "Alta" or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" or &
		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" THEN
	ii_incidencia_de_op = 0
	return false
END IF

	If tab_1.ii_tipo_incid = fgci_incidencia_calidad Or tab_1.ii_alcance = fgci_incidencia_de_suministro Then 
		ii_incidencia_de_op = 0
		Return False
	END IF

	
	////////////////////////////////////////////////////////////////////////////////////
	// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
	// conversion de los datos. Esto ocurre cuando el campo Estado_Red es -10
	SELECT NVL(ESTADO_RED,0)
	INTO :ii_estado_red
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia;
	
	IF SQLCA.SQLCode = 100 AND tab_1.is_tipo_ventana ="w_2301_hist"	THEN
		SELECT NVL(ESTADO_RED,0)
		INTO :ii_estado_red
		FROM GI_HIST_INCIDENCIAS
		WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia;
	END IF
	
	IF SQLCA.SQLCode = 0 AND ii_estado_red = -10 Then 
		ii_incidencia_de_op = 0
		return false
	ELSE
		IF gb_operaciones_inst THEN
			ii_incidencia_de_op = 1
			return true
		END IF
	END IF
	
	/////////////////////////////////////////////////////////////////////
	
	IF ii_tipo_instalacion = 0 THEN
		ll_nro_instalacion = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nombre_ins")
		
		IF IsNull(ll_nro_instalacion) THEN 
			ii_incidencia_de_op = 0
			RETURN False
		END IF
		
		SELECT TIPO_INSTALACION
		INTO :ii_tipo_instalacion
		FROM SGD_INSTALACION 
		WHERE NRO_INSTALACION = :ll_nro_instalacion
				AND BDI_JOB = 0;
				
		IF SQLCA.SQLCode <> 0 THEN
			ii_incidencia_de_op = 1
			return TRUE
		END IF
	
	END IF
	
	IF gb_operaciones = TRUE AND gb_operaciones_inst = FALSE AND &
		tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min THEN
		
		IF gi_tension_nivel_min = fgci_media_tension AND ii_tipo_instalacion = fgci_tipo_ct THEN
	
				ii_incidencia_de_op = 0
				return False
		
		ELSEIF gi_tension_nivel_min = fgci_alta_tension AND ii_tipo_instalacion = fgci_tipo_subestacion THEN
				ii_incidencia_de_op = 0
				return FALSE
		ELSE
				ii_incidencia_de_op = 1
				return TRUE
		END IF
			
	ELSEIF gb_operaciones = TRUE AND gb_operaciones_inst = TRUE THEN
		IF tab_1.ii_resul_dig = 1 THEN //digitalizada luego la incidencia es de oop.
			ii_incidencia_de_op = 1
			return true
		ELSEIF  tab_1.ii_resul_dig = 0 OR  tab_1.ii_resul_dig = 2 THEN //NO digitalizada luego la incidencia NO es de oop.
			ii_incidencia_de_op = 0
			return false
		END IF
	ELSE
		ii_incidencia_de_op = 0
		Return FALSE
	END IF
END IF


end function

public function integer fw_bloquear_brigadas_asignadas (integer pi_ind_bloqueo);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion: fw_bloquear_brigadas_asignadas
// 
// Objetivo: Bloquea todas las brigadas que esten trabajando en la incidencia
//
//	Ambito:	Publico
//
// Parametros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//   Fecha	   Responsable			Actuacion
// ----------	-----------		----------------------------------------
//	08/11/2000	   LFE			Creacion de la funcion
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_brigada
int li_indice, li_lock_status

li_indice = 1

DO WHILE li_indice <= tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount() AND li_lock_status = 0
	// Se bloquea/desbloquea cada brigada que se encuentre trabajando en la OT asociada a la incidencia
	// Las brigadas que han finalizado su trabajo ya han sido desbloqueadas en el ue_grabar
	IF (tab_1.tabpage_ot.d_lista_brigadas_ot.getitemnumber(li_indice,'est_brigada') <= fgci_ot_trabajando &
		 AND tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemString(li_indice,'tipo') = 'Brig.') THEN
		
		ll_nro_brigada=tab_1.tabpage_ot.d_lista_brigadas_ot.getitemnumber(li_indice,'nro_brigada')
		
		IF pi_ind_bloqueo = 1 THEN
			// Estamos bloqueando las brigadas
			li_lock_status=gnu_u_transaction.uf_lock_brigada(ll_nro_brigada)
		ELSE
			li_lock_status=gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
		END IF
	END IF
	li_indice ++
LOOP

IF pi_ind_bloqueo = 1 AND li_lock_status<>0 THEN
  	gnv_msg.f_mensaje("AI96","Una de las Brigadas asociadas a la incidencia","modificada",OK!)
	Return -1
ELSE
	Return 1	
END IF

end function

public function integer fw_desbloq_brig_fin_trab ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion: fw_desbloq_brig_fin_trab
// 

// Objetivo: Desbloquea todas las brigadas cuyo trabajo se haya finalizado en la incidencia
//
//	Ambito:	Publico
//
// Parametros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//   Fecha	   Responsable			Actuacion
// ----------	-----------		----------------------------------------
//	03/05/2001	   LFE			Creacion de la funcion
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_brigada
int li_indice, li_lock_status=0

li_indice = 1

DO WHILE li_indice <= tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount() AND li_lock_status = 0
	// Se desbloquean las brigadas cuyo valor en el campo 'trabajo_resuelto' sea uno
	IF tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemString(li_indice,'trabajo_resuelto') = '1' THEN
		tab_1.tabpage_ot.d_lista_brigadas_ot.SetItem(li_indice, 'trabajo_resuelto', '0')
		ll_nro_brigada=tab_1.tabpage_ot.d_lista_brigadas_ot.getitemnumber(li_indice,'nro_brigada')
		li_lock_status=gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
	END IF
	li_indice ++
LOOP

Return 1
end function

public function boolean fw_enviar_operacion (integer pi_tipo_incidencia);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : fw_enviar_operacion
//
//  Argumentos : pi_tipo_incidencia --> tipo de la incidencia
//													
//  Funcion:	Determina si la incidencia se puede enviar a Operacion 								
//	
//
//  Valores de retorno :  false --> No se envia
//				  				  true  --> Se envia
//
//  Realizado por Alfonso Coto
//
//  Fecha : 10/05/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



CHOOSE CASE pi_tipo_incidencia
	CASE fgci_incidencia_calidad
			return false
	CASE ELSE
			return true
END CHOOSE


end function

public function integer fw_verifica_otros_graba ();//Actualizacion de otros
Int li_ten_or, li_ten_af, li_agte, li_codigo
String ls_area_afec
long ll_nro_centro
dwItemStatus ldwists_area_afec
int		li_valor		//Valor que recuperamos para saber si el agente es obligatorio
int		li_registro	//Registro de la carpeta seguimiento en el que se almacenan los datos del estado resuelto
string	ls_usuarioModificaAgente	//Usuario que ha cambiado el agente

If tab_1.is_accion_llamada <> "Consulta" And tab_1.ib_pestana_otros And tab_1.tabpage_otros.dw_otros.RowCount() > 0 Then
	tab_1.tabpage_otros.dw_otros.AcceptText()
	
	li_ten_or = tab_1.tabpage_otros.dw_otros.GetItemNumber(1, 'tension_origen')
	li_ten_af = tab_1.tabpage_otros.dw_otros.GetItemNumber(1, 'tension_afectada')
	li_agte   = tab_1.tabpage_otros.dw_otros.GetItemNumber(1, 'agente')
	ls_area_afec = tab_1.tabpage_otros.dw_otros.GetItemString(1,'area_afec')
	//AHM (04/05/2009) Almacena nombre del usuario que ha modificado el campo agente
	ls_usuarioModificaAgente = tab_1.tabpage_otros.dw_otros.GetItemString(1,'usuario_agente')
	
	//AHM (19/05/2008)
	li_registro = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.rowCount()
	IF NOT isNull(tab_1.tabpage_seguimiento.d_seguimiento_operaciones.getItemDateTime(li_registro, "f_alta")) THEN		//Se est$$HEX2$$e1002000$$ENDHEX$$resolviendo la incidencia

/*		SELECT valor
		  INTO :li_valor
		  FROM gi_parametros
		 WHERE cod_parametro = 110;*/
		IF fg_verifica_parametro('SELEC_AGENTE') THEN
			li_valor = 1
		ELSE
			li_valor = 2
		END IF
		 
		//JME 28/04/08 FAT24. Comprueba la obligatoriedad del campo agente de la capeta otros y que este campo est$$HEX2$$e9002000$$ENDHEX$$relleno
		
		IF li_valor = 1 and (isnull(tab_1.tabpage_otros.dw_otros.getitemnumber(1,"agente")) or &
								  tab_1.tabpage_otros.dw_otros.getitemnumber(1,"agente") = 0) then
			
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Es necesario rellenar el campo agente en la pesta$$HEX1$$f100$$ENDHEX$$a OTROS")

			
			return  0
		end if
		//Fin JME FAT24.
	END IF	
	If IsNull(ls_area_afec) Or Trim(ls_area_afec) = "" Then
		ls_area_afec = " "
		tab_1.tabpage_otros.dw_otros.SetItem(1, 'area_afec', ls_area_afec)
		tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'area_afec', ls_area_afec)
		tab_1.tabpage_otros.dw_otros.AcceptText()
		tab_1.tabpage_formulario.d_inf_general.AcceptText()
	End If
	
	
	ldwists_area_afec = tab_1.tabpage_otros.dw_otros.GetItemStatus(1, "area_afec", Primary!)


	If ldwists_area_afec <> NotModified! Then
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,'area_afec', ls_area_afec)
	End If

////////////////////////////////////////////////////////
// AGENTES POR DEFECTO VERSION UNIFICADA AMR 16/09/2002
////////////////////////////////////////////////////////
	
	if fg_verifica_parametro('AGENTE POR DEFECTO') then
		If isnull(tab_1.tabpage_otros.dw_otros.getitemnumber(1,"agente")) or &
		   tab_1.tabpage_otros.dw_otros.getitemnumber(1,"agente") = 0 then
			
		   ll_nro_centro = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1, 'nro_centro')
		
			select codigo
			into :li_codigo
			from sgd_valor
			where codif = 'TAGT' and descripcion in (select nom_centro from sgd_centro
																  where nro_centro = :ll_nro_centro and tip_centro = 1);
			
			tab_1.tabpage_otros.dw_otros.SetItem(1,"agente",li_codigo)
			
	      li_agte = li_codigo
			
		end if
	
	end if
////////////////////////////////////////////////////////


////////////////////////////////////////////////
// PM_U002 OBLIGATORIEDAD_OTROS AMR 01/08/2002
///////////////////////////////////////////////
	IF IsNull(li_ten_or) THEN
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,'tension_origen',0)
		tab_1.tabpage_otros.dw_otros.SetItem(1,'tension_origen',0)
	ELSE
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,'tension_origen',li_ten_or)
	END IF
	
	IF IsNull(li_ten_af) THEN
		 tab_1.tabpage_formulario.d_inf_general.SetItem(1,'tension_afectada',0)
		 tab_1.tabpage_otros.dw_otros.SetItem(1,'tension_afectada',0)
	ELSE
		 tab_1.tabpage_formulario.d_inf_general.SetItem(1,'tension_afectada',li_ten_af)
	END IF
	
	IF IsNull(li_agte) THEN
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,'agente',0)
		tab_1.tabpage_otros.dw_otros.SetItem(1,'agente',0)
	ELSE
		tab_1.tabpage_formulario.d_inf_general.SetItem(1,'agente',li_agte)
	END IF
	
////////////////////////////////////////////////
// PM_U002 OBLIGATORIEDAD_OTROS AMR 01/08/2002
///////////////////////////////////////////////

	//AHM (04/05/2009) Almacena nombre del usuario que ha modificado el campo agente
	IF gi_pais = 8 THEN		//Comprobamos que estamos en Moldavia
		IF IsNull(ls_usuarioModificaAgente) THEN
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,'usuario_agente','')
			tab_1.tabpage_otros.dw_otros.SetItem(1,'usuario_agente','')
		ELSE
			tab_1.tabpage_formulario.d_inf_general.SetItem(1,'usuario_agente', ls_usuarioModificaAgente)
		END IF
	END IF

End If

Return 1
end function

public subroutine fw_aviso_alum_pub ();//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
///////////////////////////////////////////////////////
//								
// Funcion/Evento: fw_aviso_alum_pub
// 
// Objetivo: Verfica si la incidencia es de alumbrado publico
//	     y despliega un ventana para seleccionar si es o no 
//	     una incidencia de Luminarias encEndidas o apagadas.
//
// Responsable: JPE
//
//    Parametros:
//    Entrada: --
//    Salida : --
//
// Devuelve:
//
// Fecha       Responsable   Actuacion
// ------	   -----------   ---------
// 19/05/2001  JPE
//
///////////////////////////////////////////////////////


If tab_1.ib_nuevos_tip_inc Then
	If gl_tipo_aviso = fgcdec_aviso_alumbrado_publico Then
		tab_1.tabpage_formulario.d_inf_general.Modify("tipo_incidencia.protect=1 tipo_incidencia.background.color="+gs_gris)
		
		If (tab_1.ii_estado_oper <= fgci_incidencia_pEndiente OR IsNull(tab_1.ii_estado_oper)) Then
			If MessageBox("Pregunta", "La incidencia que esta generando es por Luminarias EncEndidas/Apagadas.", Question!, YesNo!, 2) = 1 Then
				tab_1.tabpage_formulario.d_inf_general.SetItem(tab_1.tabpage_formulario.d_inf_general.GetRow(), "tipo_incidencia",  fgci_incidencia_alum_pub)
				tab_1.tabpage_formulario.d_inf_general.AcceptText()
				tab_1.ii_tipo_incid = fgci_incidencia_alum_pub
			End IF
		End If
	End If
End If

gl_tipo_aviso = 0  //**  PARA USO DE INCIDENCIAS GENERADAS POR AVISOS  **
//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public subroutine fw_open_ext ();//***************************************
//**  OSGI 2001.1  	20/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Double ld_pxt, ld_cxt

//if not isvalid(w_barra) then OPEN(W_BARRA,this)

//W_BARRA.uo_barra.barra.f_amplia(28)


If tab_1.ib_pestana_otros Then
	tab_1.tabpage_otros.dw_otros.SetTransObject(SQLCA)
	
	tab_1.tabpage_formulario.dw_informe_tecnico.SetTransObject(SQLCA)

//	W_BARRA.uo_barra.barra.f_amplia(30)

	If tab_1.tabpage_otros.dw_otros.Retrieve(tab_1.il_nro_incidencia) <= 0 Then
		tab_1.tabpage_otros.dw_otros.InsertRow(0)
	End If
	
	If tab_1.tabpage_formulario.dw_informe_tecnico.Retrieve(tab_1.il_nro_incidencia) <= 0 Then
		tab_1.tabpage_formulario.dw_informe_tecnico.InsertRow(0)
	End If
	
	
//	W_BARRA.uo_barra.barra.f_amplia(32)

	tab_1.fu_perfil_consulta(tab_1.tabpage_otros.dw_otros)
	
	tab_1.fu_perfil_consulta(tab_1.tabpage_formulario.dw_informe_tecnico)
	
//	W_BARRA.uo_barra.barra.f_amplia(34)

	//AHU  0/100038003 (17/02/2009)
	IF gi_pais = 8 THEN			//Comprobamos que estamos en Moldavia
		tab_1.tabpage_otros.dw_otros.object.agente_t.text = 'Soluci$$HEX1$$f300$$ENDHEX$$n:'
		tab_1.tabpage_otros.dw_otros.modify("t_area.text = 'Descripci$$HEX1$$f300$$ENDHEX$$n Medidas:'")
		
		tab_1.tabpage_formulario.dw_informe_tecnico.object.agente_t.text = 'Soluci$$HEX1$$f300$$ENDHEX$$n:'
	     tab_1.tabpage_formulario.dw_informe_tecnico.modify("t_area.text = 'Descripci$$HEX1$$f300$$ENDHEX$$n Medidas:'")
		
		
	END IF
	//Fin AHU
//	W_BARRA.uo_barra.barra.f_amplia(36)

End If
//W_BARRA.uo_barra.barra.f_amplia(38)

If tab_1.ib_nuevos_tip_inc Then
	fw_aviso_alum_pub()
/////////////////////////////////////////////////////
// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 06/09/2002
/////////////////////////////////////////////////////
//	If tab_1.ii_tipo_incid <> fgci_incidencia_alum_pub And &
//		( tab_1.is_accion_llamada = "Alta_nivel_instalacion" Or &
//		tab_1.is_accion_llamada = "Alta" )  and &
//		tab_1.ii_tipo_incid <> fgci_incidencia_calidad Then
//
//		tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.Protect = 0
//		tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.BackGround.Color = gs_blanco
//		
//		fg_filtro_ext(tab_1.tabpage_formulario.d_inf_general, "nuevos_tip_inc", "tipo_incidencia")
//	End If
////////////////////////////////////////////////////////////
//Else
//	fg_filtro_ext(tab_1.tabpage_formulario.d_inf_general, "not_nuevos_tip_inc", "tipo_incidencia")
End If

//W_BARRA.uo_barra.barra.f_amplia(40)

If tab_1.ib_pxt_cxt Then
	ld_pxt = Round(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, "c_ext_paxtc") / 60, 1)
	ld_cxt = Round(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, "c_ext_duracion") / 60, 1)

	tab_1.tabpage_formulario.st_pxt_valor.Text = String(ld_pxt, "###,##0.0")
	tab_1.tabpage_formulario.st_cxt_valor.Text = String(ld_cxt, "###,##0.0")
End If

//W_BARRA.uo_barra.barra.f_amplia(42)

IF (tab_1.is_accion_llamada = 'Modificacion' OR tab_1.is_accion_llamada = 'Consulta' ) AND &
	tab_1.ii_alcance = fgci_incidencia_con_interrupcion AND &
	fw_incidencia_de_operaciones() THEN 
	
//	W_BARRA.uo_barra.barra.f_amplia(44)

	IF tab_1.tabpage_interrupciones.dw_lista_int_operaciones.RowCount() = 0 THEN
		//w_operaciones.setfocus()
		w_genapp_frame.setfocus()
		Messagebox("Atencion", "La Incidencia con perdida todavia no tiene instalaciones interrumpidas afectadas por maniobras")
		tab_1.tabpage_interrupciones.visible = FALSE
	END IF
END IF
//***************************************
//**  OSGI 2001.1  	20/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//W_BARRA.uo_barra.barra.f_amplia(46)

//close(W_BARRA)
end subroutine

public function integer fw_lib_av_pos_asoc ();Datetime ldt_f_actual

ldt_F_actual = fgnu_fecha_actual()


IF tab_1.ii_estado_oper >= fgci_incidencia_servicio_repuesto THEN
		DELETE GI_AVISOS_INSTALACION
		WHERE NRO_AVISO IN (SELECT NRO_AVISO
								  FROM GI_AVISOS
								  WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia);
				
		UPDATE GI_AVISOS
		SET EST_AVISO = :fgci_aviso_resuelto,
			 FECHA_RES = :ldt_f_actual,
			 HORA_RES = :ldt_f_actual,
			 F_ACTUAL = :ldt_f_actual
		WHERE NRO_INCIDENCIA = :tab_1.il_nro_incidencia AND
				IND_INC_MANUAL = 1;
						
						
		IF SQLCA.SQLCode < 0 THEN
			return -1
		ELSE
			return 1
		END IF
ELSE
	Return 1		
END IF


end function

public function datetime fw_obtener_f_actual (long pl_nro_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion: fw_obtener_f_actual
// 
// Objetivo: Funcion que obtiene la fecha actual de la incidencia de la BD
//
//	Ambito:	Publico
//
// Parametros: 
//		Entrada: pl_nro_incidencia
//		Salida:  --
//						
// Devuelve:	
//		El contenido del campo F_ACTUAL de la tabla SGD_INCIDENCIA para la incidencia pl_nro_incidencia
//
//  Fecha	  Responsable	Actuacion
// ---------	-------		----------------------------------------
//	04/02/2002	  LFE				Creacion
//
////////////////////////////////////////////////////////////////////////////////////////////////


Datetime ldt_f_actual

SELECT F_ACTUAL
INTO :ldt_f_actual
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;



return ldt_f_actual

end function

public function boolean fw_incidencia_modif_anidadas (long pl_nro_incidencia, datetime pdt_f_actual);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion: fw_incidencia_modif_anidadas
// 
// Objetivo: Funcion que comprueba si ha pasado el trigger de incidencias anidadas 
//				 modificando el estado de la incidencia. La comprobacion se realiza comparando 
//				 la Fecha Actual de la  incidencia en el momento de abrirla con el valor 
//				 que tiene actualmente.
//
//	Ambito:	Publico
//
// Parametros: 
//		Entrada: pl_nro_incidencia, pdt_f_Actual
//		Salida:  --
//						
// Devuelve:	
//				TRUE  -> La incidencia ha sido modificada por el trigger de incidencias anidadas.
//				FALSE -> La incidencia no ha sido modificada por el trigger
//
//  Fecha	  Responsable	Actuacion
// ---------	-------		----------------------------------------
//	04/02/2002	 LFE				Creacion		
//
////////////////////////////////////////////////////////////////////////////////////////////////

Datetime ldt_f_actual
long ll_nro_incidencia

IF tab_1.is_accion_llamada = "Modificacion" THEN
	// Se bloquean los registros a nivel de BD, para que no se cuele el trigger en
	// la comprobacion
	
	// Con este UPDATE se bloquean todos los registros de SGD_ESTADO_OPER asociados a 
	// la incidencia
	UPDATE SGD_ESTADO_OPER
	SET NRO_INCIDENCIA = :pl_nro_incidencia
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
	
	// **** LSH **** INI **** DDAG-2020 **** 31/07/2015 ****
	// Se bloquea la Incidencia en SGD_INCIDENCIA
	SELECT NRO_INCIDENCIA
	INTO :ll_nro_incidencia
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
//	// Se bloquea la Incidencia en SGD_INCIDENCIA
//	SELECT NRO_INCIDENCIA
//	INTO :ll_nro_incidencia
//	FROM SGD_INCIDENCIA
//	WHERE NRO_INCIDENCIA = :pl_nro_incidencia FOR UPDATE NOWAIT;
	
	// **** LSH **** FIN **** DDAG-2020 **** 31/07/2015 ****
	
	IF SQLCA.SQLCode <> 0 THEN
		// La incidencia no existe en BD o ya esta bloqueada
		Return TRUE
	ELSE
	
		SELECT F_ACTUAL 
		INTO :ldt_f_actual 
		FROM SGD_INCIDENCIA
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
		
		IF SQLCA.SQLCode = 0 THEN
			return ldt_f_actual <> pdt_f_actual
		ELSE
			return TRUE
		END IF
	END IF
ELSE
	return FALSE
END IF
end function

public subroutine fw_cambiar_tab_indisponibilidades (boolean pb_es_operaciones);if pb_es_operaciones then
		tab_1.tabpage_indisponibilidades.visible = true
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.visible=true
		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.visible=true
		tab_1.tabpage_indisponibilidades.tv_2.visible=false
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
		tab_1.tabpage_indisponibilidades.p_1.visible=false
		tab_1.tabpage_indisponibilidades.p_2.visible=false
		tab_1.tabpage_indisponibilidades.p_3.visible=false
		tab_1.tabpage_indisponibilidades.p_4.visible=false
		tab_1.tabpage_indisponibilidades.p_5.visible=false
		tab_1.tabpage_indisponibilidades.p_6.visible=false
		tab_1.tabpage_indisponibilidades.p_7.visible=false
		tab_1.tabpage_indisponibilidades.p_8.visible=false
		tab_1.tabpage_indisponibilidades.p_9.visible=false
		tab_1.tabpage_indisponibilidades.p_10.visible=false
		tab_1.tabpage_indisponibilidades.st_5.visible=false
		tab_1.tabpage_indisponibilidades.st_6.visible=false
		tab_1.tabpage_indisponibilidades.st_7.visible=false
		tab_1.tabpage_indisponibilidades.st_8.visible=false
		tab_1.tabpage_indisponibilidades.st_9.visible=false
		tab_1.tabpage_indisponibilidades.st_10.visible=false
		tab_1.tabpage_indisponibilidades.st_11.visible=false
		tab_1.tabpage_indisponibilidades.st_12.visible=false
		tab_1.tabpage_indisponibilidades.st_13.visible=false
		tab_1.tabpage_indisponibilidades.st_14.visible=false
else
		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.visible=false
		tab_1.tabpage_indisponibilidades.tv_2.visible=true
		tab_1.tabpage_indisponibilidades.p_1.visible=true
		tab_1.tabpage_indisponibilidades.p_2.visible=true
		tab_1.tabpage_indisponibilidades.p_3.visible=true
		tab_1.tabpage_indisponibilidades.p_4.visible=true
		tab_1.tabpage_indisponibilidades.p_5.visible=true
		tab_1.tabpage_indisponibilidades.p_6.visible=true
		tab_1.tabpage_indisponibilidades.p_7.visible=true
		tab_1.tabpage_indisponibilidades.p_8.visible=true
		tab_1.tabpage_indisponibilidades.p_9.visible=true
		tab_1.tabpage_indisponibilidades.p_10.visible=true
		tab_1.tabpage_indisponibilidades.st_5.visible=true
		tab_1.tabpage_indisponibilidades.st_6.visible=true
		tab_1.tabpage_indisponibilidades.st_7.visible=true
		tab_1.tabpage_indisponibilidades.st_8.visible=true
		tab_1.tabpage_indisponibilidades.st_9.visible=true
		tab_1.tabpage_indisponibilidades.st_10.visible=true
		tab_1.tabpage_indisponibilidades.st_11.visible=true
		tab_1.tabpage_indisponibilidades.st_12.visible=true
		tab_1.tabpage_indisponibilidades.st_13.visible=true
		tab_1.tabpage_indisponibilidades.st_14.visible=true
end if
end subroutine

public subroutine fw_modificar_select_maniobras_at (integer ind_act);string ls_select

ls_select= tab_1.tabpage_maniobras.dw_maniobras.getsqlselect()
// AHM (0/100019444)
IF fg_verifica_parametro("indisponibilidades activas") THEN
	ls_select +=  " UNION ALL" + &
	" SELECT  SGD_MANIOBRA.COD_MANIOBRA, " + &
			  " SGD_MANIOBRA.TIPO_MANIOBRA, " + &  
		   " SGD_MANIOBRA.COD_ELEMENTO,   " + &
         " SGD_MANIOBRA.COD_INSTALACION, " + &  
         " SGD_MANIOBRA.FECHA_MANIOBRA," + &   
         " SGD_MANIOBRA.ESTADO," + &
			" NVL(SGD_INSTALACION_AT.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ," + &
			" Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT," + &
			" A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO," + &
	" SGD_INTERR_AT.MATRICULA, GI_CAUSA.DESCRIPCION,SGD_MANIOBRA.COD_CAUSA" + &
    " FROM SGD_MANIOBRA,SGD_INSTALACION_AT, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_INTERR_AT, GI_CAUSA" + &
	" WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION_AT.NRO_INSTALACION (+) AND" + &
			" SGD_INSTALACION_AT.BDI_JOB (+) = 0 AND" + &
			" SGD_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND" + &
			" A.CODIF (+) = 'T_IN' AND" + &
			" A.CODIGO (+) = SGD_INSTALACION_AT.TIPO_INSTALACION AND" + &
			" B.CODIF (+) = 'FASE' AND" + &
			" B.VALOR (+) = SGD_MANIOBRA.FASES AND" + &
			" C.CODIF (+) = 'T_MA' AND" + &
			" C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND" + &
			" SGD_INTERR_AT.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND " + &
			" SGD_MANIOBRA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND " + &
			" SGD_INTERR_AT.BDI_JOB = 0 " + &
			 " UNION ALL" + &
	" SELECT  SGD_MANIOBRA.COD_MANIOBRA, " + &
			  " SGD_MANIOBRA.TIPO_MANIOBRA, " + &  
		   " SGD_MANIOBRA.COD_ELEMENTO,   " + &
         " SGD_MANIOBRA.COD_INSTALACION, " + &  
         " SGD_MANIOBRA.FECHA_MANIOBRA," + &   
         " SGD_MANIOBRA.ESTADO," + &
			" NVL(SGD_INSTALACION_AT.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ," + &
			" Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT," + &
			" A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO," + &
	" SGD_SECCI_AT.MATRICULA, GI_CAUSA.DESCRIPCION,SGD_MANIOBRA.COD_CAUSA" + &
    " FROM SGD_MANIOBRA,SGD_INSTALACION_AT, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_SECCI_AT, GI_CAUSA" + &
	" WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION_AT.NRO_INSTALACION (+) AND" + &
			" SGD_INSTALACION_AT.BDI_JOB (+) = 0 AND" + &
			" SGD_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND" + &
			" A.CODIF (+) = 'T_IN' AND" + &
			" A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND" + &
			" B.CODIF (+) = 'FASE' AND" + &
			" B.VALOR (+) = SGD_MANIOBRA.FASES AND" + &
			" C.CODIF (+) = 'T_MA' AND" + &
			" C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND" + &
			" SGD_SECCI_AT.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND " + &
			" SGD_MANIOBRA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND " + &
			" SGD_SECCI_AT.BDI_JOB = 0 " + &
			 " UNION ALL" + &
	" SELECT  SGD_MANIOBRA.COD_MANIOBRA, " + &
			  " SGD_MANIOBRA.TIPO_MANIOBRA, " + &  
		   " SGD_MANIOBRA.COD_ELEMENTO,   " + &
         " SGD_MANIOBRA.COD_INSTALACION, " + &  
         " SGD_MANIOBRA.FECHA_MANIOBRA," + &   
         " SGD_MANIOBRA.ESTADO," + &
			" NVL(SGD_INSTALACION_AT.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ," + &
			" Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT," + &
			" A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO," + &
	" SGD_PUENTE_ALTA.MATRICULA, GI_CAUSA.DESCRIPCION,SGD_MANIOBRA.COD_CAUSA" + &
    " FROM SGD_MANIOBRA,SGD_INSTALACION_AT, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_PUENTE_ALTA, GI_CAUSA" + &
	" WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION_AT.NRO_INSTALACION (+) AND" + &
			" SGD_INSTALACION_AT.BDI_JOB (+) = 0 AND" + &
			" SGD_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND" + &
			" A.CODIF (+) = 'T_IN' AND" + &
			" A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND" + &
			" B.CODIF (+) = 'FASE' AND" + &
			" B.VALOR (+) = SGD_MANIOBRA.FASES AND" + &
			" C.CODIF (+) = 'T_MA' AND" + &
			" C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND" + &
			" SGD_PUENTE_ALTA.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND " + &
			" SGD_MANIOBRA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND " + &
			" SGD_PUENTE_ALTA.BDI_JOB = 0  " + &
			 " UNION ALL" + &
	" SELECT  SGD_MANIOBRA.COD_MANIOBRA, " + &
			  " SGD_MANIOBRA.TIPO_MANIOBRA, " + &  
		   " SGD_MANIOBRA.COD_ELEMENTO,   " + &
         " SGD_MANIOBRA.COD_INSTALACION, " + &  
         " SGD_MANIOBRA.FECHA_MANIOBRA," + &   
         " SGD_MANIOBRA.ESTADO," + &
			" NVL(SGD_INSTALACION_AT.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ," + &
			" Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT," + &
			" A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO," + &
	" SGD_DISYUN_AT.MATRICULA, GI_CAUSA.DESCRIPCION,SGD_MANIOBRA.COD_CAUSA" + &
    " FROM SGD_MANIOBRA,SGD_INSTALACION_AT, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_DISYUN_AT, GI_CAUSA" + &
	" WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION_AT.NRO_INSTALACION (+) AND" + &
			" SGD_INSTALACION_AT.BDI_JOB (+) = 0 AND" + &
			" SGD_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND" + &
			" A.CODIF (+) = 'T_IN' AND" + &
			" A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND" + &
			" B.CODIF (+) = 'FASE' AND" + &
			" B.VALOR (+) = SGD_MANIOBRA.FASES AND" + &
			" C.CODIF (+) = 'T_MA' AND" + &
			" C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND" + &
			" SGD_DISYUN_AT.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND " + &
			" SGD_MANIOBRA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND " + &
			" SGD_DISYUN_AT.BDI_JOB = 0 " + &
			 " UNION ALL" + &
	" SELECT  SGD_MANIOBRA.COD_MANIOBRA, " + &
			  " SGD_MANIOBRA.TIPO_MANIOBRA, " + &  
		   " SGD_MANIOBRA.COD_ELEMENTO,   " + &
         " SGD_MANIOBRA.COD_INSTALACION, " + &  
         " SGD_MANIOBRA.FECHA_MANIOBRA," + &   
         " SGD_MANIOBRA.ESTADO," + &
			" NVL(SGD_INSTALACION_AT.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ," + &
			" Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT," + &
			" A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO," + &
	" SGD_TRAMO_AT.MATRICULA, GI_CAUSA.DESCRIPCION,SGD_MANIOBRA.COD_CAUSA" + &
    " FROM SGD_MANIOBRA,SGD_INSTALACION_AT, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_TRAMO_AT, GI_CAUSA" + &
	" WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION_AT.NRO_INSTALACION (+) AND" + &
			" SGD_INSTALACION_AT.BDI_JOB (+) = 0 AND" + &
			" SGD_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND" + &
			" A.CODIF (+) = 'T_IN' AND" + &
			" A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND" + &
			" B.CODIF (+) = 'FASE' AND" + &
			" B.VALOR (+) = SGD_MANIOBRA.FASES AND" + &
			" C.CODIF (+) = 'T_MA' AND" + &
			" C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND" + &
			" SGD_TRAMO_AT.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND " + &
			" SGD_MANIOBRA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND " + &
			" SGD_TRAMO_AT.BDI_JOB = 0  " + &
			 " UNION ALL" + &
	" SELECT  SGD_MANIOBRA.COD_MANIOBRA, " + &
			  " SGD_MANIOBRA.TIPO_MANIOBRA, " + &  
		   " SGD_MANIOBRA.COD_ELEMENTO,   " + &
         " SGD_MANIOBRA.COD_INSTALACION, " + &  
         " SGD_MANIOBRA.FECHA_MANIOBRA," + &   
         " SGD_MANIOBRA.ESTADO," + &
			" NVL(SGD_INSTALACION_AT.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ," + &
			" Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT," + &
			" A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO," + &
	" SGD_PUENTE.MATRICULA, GI_CAUSA.DESCRIPCION,SGD_MANIOBRA.COD_CAUSA" + &
    " FROM SGD_MANIOBRA,SGD_INSTALACION_AT, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_PUENTE, GI_CAUSA" + &
	" WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION_AT.NRO_INSTALACION (+) AND" + &
			" SGD_INSTALACION_AT.BDI_JOB (+) = 0 AND" + &
			" SGD_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND" + &
			" A.CODIF (+) = 'T_IN' AND" + &
			" A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND" + &
			" B.CODIF (+) = 'FASE' AND" + &
			" B.VALOR (+) = SGD_MANIOBRA.FASES AND" + &
			" C.CODIF (+) = 'T_MA' AND" + &
			" C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND" + &
			" SGD_PUENTE.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND " + &
			" SGD_MANIOBRA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND " + &
			" SGD_PUENTE.BDI_JOB = 0 "
		END IF
			
tab_1.tabpage_maniobras.dw_maniobras.modify(	"Datawindow.table.select= ~"" +ls_select + "~"")
//
//ls_select= tab_1.tabpage_maniobras.dw_maniobras.getsqlselect()
//ls_select += ' UNION ALL' +&
//' SELECT  SGD_MANIOBRA.COD_MANIOBRA,' +& 
//'			   SGD_MANIOBRA.TIPO_MANIOBRA, ' +&
//'		   SGD_MANIOBRA.COD_ELEMENTO, ' +&
//'         SGD_MANIOBRA.COD_INSTALACION,' +& 
//'         SGD_MANIOBRA.FECHA_MANIOBRA,' +& 
//'         SGD_MANIOBRA.ESTADO, ' +&
//'			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION , ' +&
//'			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT, ' +&
//'			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO, ' +&
//'	SGD_SECCI_CARGA.MATRICULA' +&
//'    FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_SECCI_CARGA ' +&
//'	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND ' +&
//'			SGD_INSTALACION.BDI_JOB (+) = 0 AND ' +&
//'			SGD_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND ' +&
//'			A.CODIF (+) = '+'T_IN'+' AND ' +&
//'			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND ' +&
//'			B.CODIF (+) = '+'FASE'+' AND ' +&
//'			B.VALOR (+) = SGD_MANIOBRA.FASES AND ' +&
//'			C.CODIF (+) = '+'T_MA'+' AND ' +&
//'			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND ' +&
//'			SGD_SECCI_CARGA.CODIGO= SGD_MANIOBRA.COD_ELEMENTO' 
end subroutine

public function string fw_ponernumeroincidencia (string ps_sql, long pl_nroincidencia);/*
Descripci$$HEX1$$f300$$ENDHEX$$n : Busca en el string la clausula "WHERE" y a$$HEX1$$f100$$ENDHEX$$ade el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia en la clausula
Par$$HEX1$$e100$$ENDHEX$$metros  :
				ps_sql			  -> Sentencia sql que hay que modificar
 				pl_nroIncidencia -> n$$HEX1$$fa00$$ENDHEX$$mero de la incidencia de la que se quieren recuperar las maniobras
				 
Devuelve    : 1
			
			
			Nombre  							Fecha
Autor:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas			19/05/2008
*/

int		li_posicion		//Posici$$HEX1$$f300$$ENDHEX$$n en la que se encuentra el siguiente UNION ALL dentro de la sql del dw
string	ls_sql			//String a modificar


li_posicion = 1
ls_sql = ps_sql
li_posicion = pos(ls_sql, "WHERE", li_posicion)
//Bucle que recorre todos los UNION ALL de la sql
DO WHILE li_posicion > 0 
		//Ponemos en las sentencias where el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
	ls_sql = left(ls_sql, li_posicion + len("WHERE")) + " SGD_MANIOBRA.NRO_INCIDENCIA = " + string(pl_nroIncidencia) + " AND " + &
				right (ls_sql, len(ls_sql) - (li_posicion + len("WHERE"))) 
	li_posicion = li_posicion + 1	
	li_posicion = pos(ls_sql, "WHERE", li_posicion)
LOOP

li_posicion = 1
li_posicion = pos(ls_sql, "where", li_posicion)
//Bucle que recorre todos los UNION ALL de la sql
DO WHILE li_posicion > 0 
		//Ponemos en las sentencias where el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
	ls_sql = left(ls_sql, li_posicion + len("where")) + " OOP_ELTOS_TMP_HIST.cod_inc_alta = " + string(pl_nroIncidencia) + " AND " + &
				right (ls_sql, len(ls_sql) - (li_posicion + len("WHERE"))) 
	li_posicion = li_posicion + 1	
	li_posicion = pos(ls_sql, "where", li_posicion)
LOOP




RETURN ls_sql
end function

public function integer fw_maniobras (long pl_nroincidencia);/*
Descripci$$HEX1$$f300$$ENDHEX$$n : Modifica el dw que muestra las maniobras que deben aparecer
Par$$HEX1$$e100$$ENDHEX$$metros  :
 				pl_nroIncidencia -> n$$HEX1$$fa00$$ENDHEX$$mero de la incidencia de la que se quieren recuperar las maniobras
				 
Devuelve    : 1
			
			
			Nombrels_sql  +=  			Fechals_sql  +=  	
Autor:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas			19/05/2008
					AHM							22/04/210				Visulizaci$$HEX1$$f300$$ENDHEX$$n bot$$HEX1$$f300$$ENDHEX$$n causa
*/

long		ll_cod			//C$$HEX1$$f300$$ENDHEX$$digo de la maniobra que estamos tratando
long		ll_contador		//Recorre los registros
long		ll_indis			//N$$HEX1$$fa00$$ENDHEX$$mero de indisponibilidades encontradas a las que se las ha asociado la maniobra
string	ls_sql			//Sql de la dw que debe recuperar los datos de las maniobras

ls_sql = tab_1.tabpage_maniobras.dw_maniobras.GetSQLSelect()//Recupera la sentencia SQL de la dw

IF fg_verifica_parametro("Indisponibilidades activas") = FALSE THEN
	IF gi_pais = 8 THEN		//El pais es Moldavia
		ls_sql= fw_maniobrasMoldavia(ls_sql)							//Modifica la sql para que aparezcan las maniobras de Moldavia
	ELSE
		ls_sql= fw_maniobrasResto(ls_sql)							//Modifica la sql para que aparezcan las maniobras del resto de paises
		IF gi_pais = 3 THEN	//El pais es Nicaragua
			ls_sql= fw_maniobrasNicaragua(ls_sql)							//Modifica la sql para que aparezcan las maniobras del resto de paises
		END IF
	END IF
END IF

ls_sql = fw_ponerNumeroIncidencia(ls_sql, pl_nroIncidencia)

IF fg_verifica_parametro("Indisponibilidades activas") THEN
	tab_1.tabpage_maniobras.dw_maniobras.settransobject(Sqlca)
//	tab_1.tabpage_maniobras.dw_maniobras.retrieve()
END IF

tab_1.tabpage_maniobras.dw_maniobras.Reset()
tab_1.tabpage_maniobras.dw_maniobras.setSQLSelect(ls_sql)	//Asigna la nueva sentencia SQL de la dw

//AHM (22/04/2010) Bot$$HEX1$$f300$$ENDHEX$$n de causa en AT
IF fg_verifica_parametro("Indisponibilidades activas") = FALSE THEN
	tab_1.tabpage_maniobras.dw_maniobras.settransobject(Sqlca)
	
END IF

tab_1.tabpage_maniobras.dw_maniobras.retrieve()

//	FOR ll_contador = 1 to tab_1.tabpage_maniobras.dw_maniobras.rowCount()
//
//		ll_cod = tab_1.tabpage_maniobras.dw_maniobras.getItemNumber(ll_contador, "cod_maniobra")
//		
//		SELECT count(*)
//		INTO :ll_contador
//		FROM sgd_indisponibilidad
//		WHERE (maniobra_apertura = :ll_cod
//				OR maniobra_cierre = :ll_cod)
//				AND class_id = 5555;
//				
//		IF ll_contador > 0 THEN
//			ll_contador = 1
//		ELSE
//			ll_contador = 0
//		END IF
//
//		tab_1.tabpage_maniobras.dw_maniobras.setItem(ll_contador, "visible", ll_contador)
//	
//	NEXT

RETURN 1

end function

public function string fw_maniobrasresto (string ps_sql);/*
Descripci$$HEX1$$f300$$ENDHEX$$n : Modifica la dw de maniobras para los paises que no son Moldavia
Par$$HEX1$$e100$$ENDHEX$$metros  :
 				  ps_sql -> sentencia que tenemos que modificar
				 
Devuelve    : sentencia modificada
			
			
				Nombre  						Fecha	
Autor:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas			19/05/2008
*/

string	ls_sql			//Sql de la dw que debe recuperar los datos de las maniobras


ls_sql = ps_sql

//Modificamos la sql para que sea la adecuada para Moldavia

ls_sql  += " UNION ALL "
ls_sql  += " SELECT  	SGD_MANIOBRA.COD_MANIOBRA, "
ls_sql  += " SGD_MANIOBRA.TIPO_MANIOBRA, "
ls_sql  += " SGD_MANIOBRA.COD_ELEMENTO, "
ls_sql  += " SGD_MANIOBRA.COD_INSTALACION, "
ls_sql  += " SGD_MANIOBRA.FECHA_MANIOBRA, "
ls_sql  += " SGD_MANIOBRA.ESTADO, "
ls_sql  += " NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION , "
ls_sql  += " Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT, "
ls_sql  += " A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO, "
ls_sql  += " OOP_ELTOS_TMP_HIST.TEXTO "
ls_sql  += " FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, OOP_ELTOS_TMP_HIST "
ls_sql  += " WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND "
ls_sql  += " SGD_INSTALACION.BDI_JOB (+) = 0 AND "
ls_sql  += " A.CODIF (+) = 'T_IN' AND "
ls_sql  += " A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND "
ls_sql  += " B.CODIF (+) = 'FASE' AND "
ls_sql  += " B.VALOR (+) = SGD_MANIOBRA.FASES AND "
ls_sql  += " C.CODIF (+) = 'T_MA' AND "
ls_sql  += " C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND "
ls_sql  += " OOP_ELTOS_TMP_HIST.CLASS_MEMB= SGD_MANIOBRA.COD_ELEMENTO "


RETURN ls_sql
end function

public function string fw_maniobrasmoldavia (string ps_sql);/*
Descripci$$HEX1$$f300$$ENDHEX$$n : Modifica el dw que muestra las maniobras que deben aparecer en la carpeta de Moldavia
Par$$HEX1$$e100$$ENDHEX$$metros  :
 				ps_string -> select de la dw de maniobras que hay que modificar
				 
Devuelve    : string modificado
			
			
				Nombre			  			Fecha
Autor:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas			19/05/2008
*/

string	ls_sql			//Sql de la dw que debe recuperar los datos de las maniobras

ls_sql = ps_sql

//AHM (17/06/2009) Incidencia 0/100094029
//AHM (09/06/2009) sql not properly ended
//Modificamos la sql para que sea la adecuada para Moldavia
//AHM (21/04/2009) incidencia 0/100067828 a$$HEX1$$f100$$ENDHEX$$adir bdi_job = 0 para cada una de las tablas de bdi
ls_sql  +=  " UNION ALL " 
ls_sql  +=  " SELECT  SGD_MANIOBRA.COD_MANIOBRA, "
ls_sql  +=  "			SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "			SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "		   SEC.MATRICULA  "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_SECCI_CARGA SEC "
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "

ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "
ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			SEC.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			SEC.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_SECCI_CARGA F WHERE F.BDI_JOB = 0 AND F.CODIGO = SEC.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_SECCI_CARGA Z WHERE Z.CODIGO = SEC.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_SECCI_CARGA U WHERE U.BDI_JOB = 0)))"
ls_sql  +=  " UNION ALL  "
ls_sql  +=  " SELECT  SGD_MANIOBRA.COD_MANIOBRA,  "
ls_sql  +=  "  SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "			SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "		  CUCH.MATRICULA  "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_CUCHILLA  CUCH"
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "
ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "
ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			CUCH.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			CUCH.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_CUCHILLA F WHERE F.BDI_JOB = 0 AND F.CODIGO = CUCH.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_CUCHILLA Z WHERE Z.CODIGO = CUCH.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_CUCHILLA U WHERE U.BDI_JOB = 0)))"
ls_sql  +=  " UNION ALL "
ls_sql  +=  " SELECT  SGD_MANIOBRA.COD_MANIOBRA,  "
ls_sql  +=  " SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "			SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "			SAU.MATRICULA "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_SECCI_AUTOMATICO SAU"
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "
ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "
ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			SAU.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			SAU.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_SECCI_AUTOMATICO F WHERE F.BDI_JOB = 0 AND F.CODIGO = SAU.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_SECCI_AUTOMATICO Z WHERE Z.CODIGO = SAU.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_SECCI_AUTOMATICO U WHERE U.BDI_JOB = 0)))"
ls_sql  +=  " UNION ALL "
ls_sql  +=  " SELECT  SGD_MANIOBRA.COD_MANIOBRA,  "
ls_sql  +=  "  SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "			SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "			INTER.MATRICULA "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_INTERR_BT INTER"
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "
ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "
ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			INTER.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			INTER.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_INTERR_BT F WHERE F.BDI_JOB = 0 AND F.CODIGO = INTER.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_INTERR_BT Z WHERE Z.CODIGO = INTER.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_INTERR_BT U WHERE U.BDI_JOB = 0)))"
ls_sql  +=  " UNION ALL "
ls_sql  +=  " SELECT  SGD_MANIOBRA.COD_MANIOBRA,  "
ls_sql  +=  " SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "			SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "		   CORTO.MATRICULA "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_CORTOCIRC CORTO"
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "
ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "
ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			CORTO.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			CORTO.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_CORTOCIRC F WHERE F.BDI_JOB = 0 AND F.CODIGO = CORTO.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_CORTOCIRC Z WHERE Z.CODIGO = CORTO.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_CORTOCIRC U WHERE U.BDI_JOB = 0)))"
ls_sql  +=  " UNION ALL "
ls_sql  +=  " SELECT  SGD_MANIOBRA.COD_MANIOBRA,  "
ls_sql  +=  "  SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "			SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "	      INT.MATRICULA "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_INTERR_AT INT"
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "
ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "

ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			INT.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			INT.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_INTERR_AT F WHERE F.BDI_JOB = 0 AND F.CODIGO = INT.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_INTERR_AT Z WHERE Z.CODIGO = INT.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_INTERR_AT U WHERE U.BDI_JOB = 0)))"
ls_sql  +=  " UNION ALL "
ls_sql  +=  " SELECT SGD_MANIOBRA.COD_MANIOBRA,  "
ls_sql  +=  " 	      SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "        SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "        SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  " 			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "        NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "	      SEA.MATRICULA "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_SECCI_AT SEA"
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "
ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "
ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			SEA.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			SEA.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_SECCI_AT F WHERE F.BDI_JOB = 0 AND F.CODIGO = SEA.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_SECCI_AT Z WHERE Z.CODIGO = SEA.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_SECCI_AT U WHERE U.BDI_JOB = 0)))"
ls_sql  +=  " UNION ALL "
ls_sql  +=  " SELECT  SGD_MANIOBRA.COD_MANIOBRA,  "
ls_sql  +=  " SGD_MANIOBRA.TIPO_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_ELEMENTO,  "
ls_sql  +=  "			SGD_MANIOBRA.COD_INSTALACION,  "
ls_sql  +=  "			SGD_MANIOBRA.FECHA_MANIOBRA,  "
ls_sql  +=  "			SGD_MANIOBRA.ESTADO,  "
ls_sql  +=  "			NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  "
ls_sql  +=  "			Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  "
ls_sql  +=  "			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  "
ls_sql  +=  "		   SCA.MATRICULA "
ls_sql  +=  "	 FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_CUCHILLA_AT SCA"
ls_sql  +=  "	WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  "
ls_sql  +=  "			SGD_INSTALACION.BDI_JOB (+) = 0 AND  "
ls_sql  +=  "			A.CODIF (+) = 'T_IN' AND  "
ls_sql  +=  "			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  "
ls_sql  +=  "			B.CODIF (+) = 'FASE' AND  "
ls_sql  +=  "			B.VALOR (+) = SGD_MANIOBRA.FASES AND  "
ls_sql  +=  "			C.CODIF (+) = 'T_MA' AND  "
ls_sql  +=  "			C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND  "
ls_sql  +=  "			SCA.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  +=  "			SCA.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_CUCHILLA_AT F WHERE F.BDI_JOB = 0 AND F.CODIGO = SCA.CODIGO "
ls_sql  +=  "			UNION SELECT MAX(Z.ONIS_VER) FROM SGD_CUCHILLA_AT Z WHERE Z.CODIGO = SCA.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_CUCHILLA_AT U WHERE U.BDI_JOB = 0)))"


RETURN ls_sql

end function

public function string fw_maniobrasnicaragua (string ps_sql);/*
Descripci$$HEX1$$f300$$ENDHEX$$n : Modifica la dw de maniobras para Nicaragua
Par$$HEX1$$e100$$ENDHEX$$metros  :
 				  ps_sql -> sentencia que tenemos que modificar
				 
Devuelve    : sentencia modificada
			
			

				Nombre  						Fecha	
Autor:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas			19/05/2008
*/

string	ls_sql			//Sql de la dw que debe recuperar los datos de las maniobras


ls_sql = ps_sql

//AHM (17/06/2009) Incidencia 0/100094029
//Modificamos la sql para que sea la adecuada para Moldavia
//AHM(21/04/2009) Incidencia 0/100067828 A$$HEX1$$f100$$ENDHEX$$adimos bdi_job a la tablas de bdi
ls_sql  += " UNION ALL "
ls_sql  += "  SELECT  SGD_MANIOBRA.COD_MANIOBRA, "
ls_sql  += " SGD_MANIOBRA.TIPO_MANIOBRA,   "
ls_sql  += " SGD_MANIOBRA.COD_ELEMENTO,   "
ls_sql  += " SGD_MANIOBRA.COD_INSTALACION, "  
ls_sql  += " SGD_MANIOBRA.FECHA_MANIOBRA,   "
ls_sql  += " SGD_MANIOBRA.ESTADO, "
ls_sql  += " NVL(SGD_INSTALACION.NOM_INSTALACION,SGD_MANIOBRA.COD_INSTALACION) NOM_INSTALACION , "
ls_sql  += " Fgci_Nombre_BrigCont_Maniobra(SGD_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT, "
ls_sql  += " A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO, "
ls_sql  += " IT.MATRICULA "
ls_sql  += " FROM SGD_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C,SGD_ITC IT "
ls_sql  += " WHERE SGD_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND "
ls_sql  += " SGD_INSTALACION.BDI_JOB (+) = 0 AND "
ls_sql  += " A.CODIF (+) = 'T_IN' AND "
ls_sql  += " A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND "
ls_sql  += " B.CODIF (+) = 'FASE' AND "
ls_sql  += " B.VALOR (+) = SGD_MANIOBRA.FASES AND "
ls_sql  += " C.CODIF (+) = 'T_MA' AND "
ls_sql  += " C.CODIGO (+) = SGD_MANIOBRA.TIPO_MANIOBRA AND "
ls_sql  += " IT.CODIGO= SGD_MANIOBRA.COD_ELEMENTO AND "
ls_sql  += " IT.ONIS_VER IN (SELECT F.ONIS_VER FROM SGD_ITC F WHERE F.BDI_JOB = 0 AND F.CODIGO = IT.CODIGO "
ls_sql  += " UNION SELECT MAX(Z.ONIS_VER) FROM SGD_ITC Z WHERE Z.CODIGO = IT.CODIGO AND Z.BDI_JOB = -1 AND (Z.CODIGO NOT IN (SELECT U.CODIGO FROM SGD_ITC U WHERE U.BDI_JOB = 0)))"

RETURN ls_sql
end function

public subroutine fw_actualizaestadoocen ();/************************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Actualiza el campo estadoMantenimiento que almacena el estado de   */
/*					  la solicitud ocen cuando se graba la incidencia.							*/
/* Par$$HEX1$$e100$$ENDHEX$$metros  : -																						*/
/* Devuelve    : -																						*/
/*	Fecha       : 04/01/2009																			*/
/*	Autor			: AHU																						*/
/************************************************************************************/

int		li_estadoOcen			//Valor num$$HEX1$$e900$$ENDHEX$$rico del estado de mantenimiento
string	ls_estado				//Estado de mantenimiento

IF fg_valor_parametro("OCEN") = 1 THEN
	
	IF tab_1.tabpage_ocen.uo_ot_ocen.dw_ot_ocen.rowCount() > 0 THEN
		
		ls_estado = tab_1.tabpage_ocen.uo_ot_ocen.dw_ot_ocen.getItemString(1, "estado")
		
		SELECT CODIGO
		INTO   :li_estadoOcen
		FROM	 SGD_VALOR
		WHERE	 CODIF = 'E_MA'
				 AND VALOR = :ls_estado;
				 
		tab_1.tabpage_formulario.d_inf_general.setItem(1, "estado_mantenimiento", li_estadoOcen);
		
	END IF
	
END IF
end subroutine

public function integer fw_bloqueaobsseguimiento ();/***************************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Bloquea las observaciones del tabpage seguimiento si est$$HEX2$$e1002000$$ENDHEX$$activo el 	*/
/*					  par$$HEX1$$e100$$ENDHEX$$metro 'CARGA AUTOMATICA OBSERVACIONES SEGUIMIENTO'. 					*/
/*					  Mejora 1/446555																			*/
/* Par$$HEX1$$e100$$ENDHEX$$metros	:	-																							*/
/* Devuelve		:	 0 Correcto																				*/
/*						-1 Incorrecto																			*/
/*																													*/
/*							Autor			  Fecha							Descripci$$HEX1$$f300$$ENDHEX$$n						*/
/*           -----------------------------------------------------------------------	*/
/*				 			AHM			13/07/2009						Creaci$$HEX1$$f300$$ENDHEX$$n							*/
/***************************************************************************************/


int	li_contador		//Variable de control del bucle que recorre los estados del tab seguimiento para desactivar el campo observaciones
int i
IF fg_verifica_parametro('CARGA AUTOMATICA OBSERVACIONES SEGUIMIENTO') THEN
	
	i = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.rowCount()
//	FOR li_contador = 1 TO 	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.rowCount()
		
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.modify("observacion.protect = 1")
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.modify("observacion.background.color = " + gs_gris)
//	NEXT
	
END IF

RETURN 0
end function

public function integer fw_cargarobservacionesenviadobrigada ();/***************************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Carga las observaciones del estado enviado brigada del seguimiento. 	*/
/*					  Mejora 1/446555																			*/
/* Par$$HEX1$$e100$$ENDHEX$$metros	:	-																							*/
/* Devuelve		:	 0 Correcto																				*/
/*						-1 Incorrecto																			*/
/*																													*/
/*							Autor			  Fecha							Descripci$$HEX1$$f300$$ENDHEX$$n						*/
/*           -----------------------------------------------------------------------	*/
/*				 			AHM			10/07/2009						Creaci$$HEX1$$f300$$ENDHEX$$n							*/
/***************************************************************************************/

int		li_contador			//Variable de control del bucle
string	ls_observaciones	//Observaciones del estado que estamos tratando


//Inicializaci$$HEX1$$f300$$ENDHEX$$n de las observaciones					
ls_observaciones = ''

//Generaci$$HEX1$$f300$$ENDHEX$$n de las observaciones del estado EB
FOR li_contador = 1 TO tab_1.tabpage_ot.d_lista_brigadas_ot.rowCount()
	
	IF ls_observaciones = '' THEN
		ls_observaciones = tab_1.tabpage_ot.d_lista_brigadas_ot.getItemString(li_contador, "brigada")
	ELSE
		ls_observaciones = ls_observaciones + ";" + tab_1.tabpage_ot.d_lista_brigadas_ot.getItemString(li_contador, "brigada")
	END IF
	
NEXT

IF isNull(ls_observaciones) OR ls_observaciones = '' THEN
	ls_observaciones = ' '
END IF

//Asignaci$$HEX1$$f300$$ENDHEX$$n de las observaciones del estado EB
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.setItem(2, "observacion", left(ls_observaciones, 2000));


RETURN 0
end function

public function integer fw_cargarobservacionesestadopendiente ();/*************************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n: Carga las observaciones del estado pendiente en el tab seguimiento.  */
/*					 Mejora 1/446555																		 */
/* Par$$HEX1$$e100$$ENDHEX$$metros : -																							 */
/* Retorno	  :  1 Correcto																			 */
/*					 -1 Incorrecto																			 */
/* Autor : AHM																								 */
/* Fecha : 03/07/2009																					 */
/*************************************************************************************/

string	ls_obsAviso					//Observaciones del aviso que estamos tratando
string	ls_observaciones			//Cadena que contiene las observaciones que deben almacenarse en el campo observaciones del seguimiento

ls_obsAviso = ""
ls_observaciones = ""


DECLARE avisos CURSOR FOR
   SELECT obs_telegestiones
   FROM gi_avisos
   WHERE nro_incidencia = :tab_1.il_nro_incidencia ;
	
OPEN avisos;

IF sqlca.sqlcode < 0 THEN		//Comprobamos la apertura del cursor
	messageBox("Error", "Error en la apertura del cursor de avisos")
	RETURN -1
END IF

FETCH avisos INTO :ls_obsAviso;

IF sqlca.sqlcode < 0 THEN		//Comprobamos la lectura del cursor
	messageBox("Error", "Error en la lectura del cursor de datos")
	RETURN -1
END IF

//Generamos las observaciones
DO WHILE (sqlca.sqlcode = 0)	
	
	IF ls_observaciones = "" THEN
		ls_observaciones = left(ls_obsAviso, 2000)	
	ELSE
		ls_observaciones = left(ls_observaciones + ";" + ls_obsAviso, 2000)
	END IF
	
	FETCH avisos INTO :ls_obsAviso;
	
	IF sqlca.sqlcode < 0 THEN		//Comprobamos la lectura del cursor
		messageBox("Error", "Error en la lectura del cursor de datos")
		RETURN -1
	END IF

LOOP

//Cierre del cursor
CLOSE avisos;

IF sqlca.sqlcode < 0 THEN		//Comprobamos la apertura del cursor
	messageBox("Error", "Error en el cierre del cursor de datos")
	RETURN -1
END IF

IF isNull(ls_observaciones) OR ls_observaciones = '' THEN
	ls_observaciones = ' '
END IF
		
//Actualizamos el tab seguimiento
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(1, "observacion", ls_observaciones)
		
RETURN 1
end function

public function integer fw_cargarobservacionesseguimiento ();/***************************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Carga las observaciones del seguimiento si est$$HEX1$$e100$$ENDHEX$$n vacias pero tienen 	*/
/*					  fecha y el par$$HEX1$$e100$$ENDHEX$$metro 113 est$$HEX2$$e1002000$$ENDHEX$$activo. Mejora 1/446555						*/
/* Par$$HEX1$$e100$$ENDHEX$$metros	:	-																							*/
/* Devuelve		:	 0 Correcto																				*/
/*						-1 Incorrecto																			*/
/*																													*/
/*							Autor			  Fecha							Descripci$$HEX1$$f300$$ENDHEX$$n						*/
/*           -----------------------------------------------------------------------	*/
/*				 			AHM			09/07/2009						Creaci$$HEX1$$f300$$ENDHEX$$n							*/
/***************************************************************************************/
datetime	ldt_fecha			//Fecha de alta del estado que estamos tratando
int		li_contador			//Variable de control del bucle
int		li_contadorAux		//Variable de control de los bucles del case
int		li_numeroFilas		//N$$HEX1$$fa00$$ENDHEX$$mero de estados que tiene la incidencia
string	ls_obsAviso			//Observaciones del aviso que estamos tratando


IF fg_verifica_parametro('CARGA AUTOMATICA OBSERVACIONES SEGUIMIENTO') THEN
	
	li_numeroFilas = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.rowCount()
	
	FOR li_contador = 1 TO li_numeroFilas
		ldt_fecha = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.getItemDateTime(li_contador, "f_alta")
		
		IF NOT(isNull(ldt_fecha)) THEN
			
			CHOOSE CASE li_contador
				CASE 1 //Estado pendiente
					fw_cargarObservacionesEstadoPendiente()							
					
				CASE 2 //Estado enviado brigada
					fw_cargarObservacionesEnviadoBrigada()							
					
				CASE 3 //Estado servicio repuesto
					fw_cargarObservacionesServicioRepuesto()							
					
			END CHOOSE
			
		END IF
		
	NEXT
	
	
END IF

RETURN 0
end function

public function integer fw_cargarobservacionesserviciorepuesto ();/***************************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Carga las observaciones del estado servicio repuesto del seguimiento	*/
/*					  Mejora 1/446555																			*/
/* Par$$HEX1$$e100$$ENDHEX$$metros	:	-																							*/
/* Devuelve		:	 0 Correcto																				*/
/*						-1 Incorrecto																			*/
/*																													*/
/*							Autor			  Fecha							Descripci$$HEX1$$f300$$ENDHEX$$n						*/
/*           -----------------------------------------------------------------------	*/
/*				 			AHM			10/07/2009						Creaci$$HEX1$$f300$$ENDHEX$$n							*/
/***************************************************************************************/

int		li_contador			//Variable de control del bucle
int		li_posicion			//Fila del dw en la que se encuentra el estado servicio repuesto
string	ls_observaciones	//Observaciones del estado que estamos tratando


//Inicializaci$$HEX1$$f300$$ENDHEX$$n de las observaciones					
ls_observaciones = ''

//Generaci$$HEX1$$f300$$ENDHEX$$n de las observaciones del estado SR
FOR li_contador = 1 TO tab_1.tabpage_acciones.d_lista_acciones_incidencia.rowCount()
	
	IF ls_observaciones = '' THEN
		ls_observaciones = tab_1.tabpage_acciones.d_lista_acciones_incidencia.getItemString(li_contador, "accion") + ":" + tab_1.tabpage_acciones.d_lista_acciones_incidencia.getItemString(li_contador, "observacion")
	ELSE
		ls_observaciones = ls_observaciones + ";" + tab_1.tabpage_acciones.d_lista_acciones_incidencia.getItemString(li_contador, "accion") + ":" + tab_1.tabpage_acciones.d_lista_acciones_incidencia.getItemString(li_contador, "observacion")
	END IF
	
NEXT

IF isNull(ls_observaciones) OR ls_observaciones = '' THEN
	ls_observaciones = ' '
END IF

//Busqueda de la fila del seguimiento en la que se encuentra el estado servicio repuesto
li_posicion = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.find("nomenclatura = 'SR'", 1, tab_1.tabpage_seguimiento.d_seguimiento_operaciones.rowCount())

//Asignaci$$HEX1$$f300$$ENDHEX$$n de las observaciones del estado EB
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(li_posicion, "observacion", left(ls_observaciones, 2000))


RETURN 0
end function

public function integer wf_crearordentrabajo (long pl_instalacionafectada);/********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Creaci$$HEX1$$f300$$ENDHEX$$n de la orden de trabajo mediante llamada a funci$$HEX1$$f300$$ENDHEX$$n de  */
/*               negocio v$$HEX1$$ed00$$ENDHEX$$a openlink.														  */
/* Argumentos  : pl_instalacion_afectada -> C$$HEX1$$f300$$ENDHEX$$digo de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada   */
/*                                          en la incidencia.						  */
/* Devuelve    : -1    Error																	  */
/*					   1    OK																		  */
/*																										  */
/*   Nombre						Fecha								Acci$$HEX1$$f300$$ENDHEX$$n						  */
/*------------------------------------------------------------------------------*/
/*   AHM						06/09/2009							Creaci$$HEX1$$f300$$ENDHEX$$n						  */
/********************************************************************************/
string					ls_numeroOrden		//N$$HEX1$$fa00$$ENDHEX$$mero de orden que se ha generado
string					ls_descripcion		//Descripci$$HEX1$$f300$$ENDHEX$$n de la incidencia
u_crearOrdenes			lu_ordenes			//Objeto que realiza el openlink


//Comprobamos si el registro se va a dar de alta, estamos en Nicaragua y la instalaci$$HEX1$$f300$$ENDHEX$$n afectada es 99999998
IF ((tab_1.tabpage_formulario.d_inf_general.GetItemStatus (1, 0, Primary!) =  New!) OR &
	(tab_1.tabpage_formulario.d_inf_general.GetItemStatus (1, 0, Primary!) =  NewModified!))  &
	AND (gi_pais = 3) AND (pl_instalacionAfectada = 99999998) THEN
		
		//AHM (14/01/2011) ASUR 835227
		IF fg_verifica_parametro("OT OPENLINK") THEN
			//Conexi$$HEX1$$f300$$ENDHEX$$n v$$HEX1$$ed00$$ENDHEX$$a openlink
			lu_ordenes = CREATE u_crearOrdenes
			
			ls_descripcion = tab_1.tabpage_formulario.d_inf_general.GetItemString(1, "desc")
			
			lu_ordenes.uf_generarorden(il_aviso_sum, il_nro_incidencia, ls_descripcion, ls_numeroOrden) 
			
			DESTROY(lu_ordenes)
			
			IF  NOT(isNull(ls_numeroOrden)) THEN
				ls_descripcion = left(ls_descripcion, 50) + ' --> Nro OS: ' + ls_numeroOrden
				tab_1.tabpage_formulario.d_inf_general.setItem(1, "desc", ls_descripcion)
			END IF
		END IF
END IF

RETURN 1 



end function

public function integer fw_desbloqueoinstalacion ();/************************************************************************************/
/*   Descripcion : Desbloque la salida de baja que se ha bloqueado al generar la       */
/*                 incidencia, si la instalaci$$HEX1$$f300$$ENDHEX$$n afectada es una salida de baja.      */
/*   Parmetros   : -                                                                  */
/* Devuelve    :  1 -> correcto                                                      */
/*       Autor         Fecha         Acci$$HEX1$$f300$$ENDHEX$$n                                             */
/*     ---------------------------------------------------------------------            */
/*         AHM       03/11/2009   Creaci$$HEX1$$f300$$ENDHEX$$n                                             */
/************************************************************************************/

dwItemStatus   ldis_status            //Status del dw que contiene la informaci$$HEX1$$f300$$ENDHEX$$n general
int            li_indiceBloqueo      //Indice de bloqueo de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada
int            li_tension            //Tensi$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n que ha sido seleccionada
string         ls_usuarioBloqueo      //Usuario que ha bloqueado la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada



//AHM (02/11/2009) Mejora 1/565472
ldis_status = tab_1.tabpage_formulario.d_inf_general.getItemStatus(1, 0, Primary!) 

//IF ((ldis_status = New! OR ldis_status = NewModified!) AND NOT (isNull(tab_1.idec_nro_instalacion_afectada))) THEN
IF NOT (isNull(tab_1.idec_nro_instalacion_afectada)) THEN
         
   SELECT ind_bloqueo, usuario_bloqueo, tension
   INTO :li_indiceBloqueo, :ls_usuarioBloqueo, :li_tension
   FROM sgd_instalacion
   WHERE nro_instalacion = :tab_1.idec_nro_instalacion_afectada;

   
   //Si la instalaci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$bloqueada y hay instalaci$$HEX1$$f300$$ENDHEX$$n asignada es que la hemos bloqueado nosotros
   IF li_tension = 3 THEN   //Comprobamos que es una instalaci$$HEX1$$f300$$ENDHEX$$n de baja
      
         UPDATE sgd_instalacion
         SET ind_bloqueo = 0, 
            usuario_bloqueo = ' '
         WHERE nro_instalacion = :tab_1.idec_nro_instalacion_afectada;
         
         COMMIT;
         
   END IF
END IF

RETURN 1

end function

public function integer wf_cargadisponibilidades ();/********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : carga las disponibilidades bloqueadas							     */
/*	Argumentos  :	-																				  */
/* Devuelve    :  1 correcto																	  */
/*					  -1 incorrecto																  */
/*					Autor					Fecha							Accion					  */
/*				  	 AHM             09/12/2009				  Creaci$$HEX1$$f300$$ENDHEX$$n					  */
/********************************************************************************/
long 	ll_cont				// Variable de control del bucle
long	ll_fila				// Fila insertada
long	ll_rows				// N$$HEX1$$fa00$$ENDHEX$$mero de filas que almacena el datastore de disponibilidades

ids_disponibilidades = CREATE datastore
ids_disponibilidades.dataobject = "d_bloquear_activos_de_incidencia"
ids_disponibilidades.SetTransObject(SQLCA)

ll_rows = gnu_u_transaction.ids_activos.RowCount()

FOR ll_cont = 1 TO ll_rows
	ll_fila = ids_disponibilidades.insertrow(0)
	ids_disponibilidades.setItem(ll_fila, "nro_instalacion", gnu_u_transaction.ids_activos.getitemNumber(ll_cont, "nro_instalacion"))
	
NEXT

RETURN 1

end function

public function integer limpiar_data_window_incidencia (integer numero);////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funcion que realiza la limpieza de los Datawindows                                                                          ///
// Realizado por Jeffry Davila TDA                                                                                                       ///
// Fecha 20/03/2019                                                                                                                         ///                 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
openwithparm(w_msg,"Limpiando...")
String ls_null 
SetNull(ls_null)

tab_1.tabpage_formulario.d_inf_general.SetTransObject(SQLCA)

If tab_1.tabpage_formulario.d_inf_general.Retrieve(0) <= 0 Then
	    tab_1.tabpage_formulario.d_inf_general.InsertRow(0)
	    tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text=''
	    tab_1.tabpage_formulario.d_inf_general.object.st_causa.text=''
         tab_1.tabpage_formulario.d_inf_general.object.st_causa_subtipo.text=''
End If

tab_1.tabpage_formulario.dw_informe_tecnico.SetTransObject(SQLCA)

If tab_1.tabpage_formulario.dw_informe_tecnico.Retrieve(0) <= 0 Then
	   tab_1.tabpage_formulario.dw_informe_tecnico.InsertRow(0)
End If


tab_1.tabpage_acciones.d_lista_acciones.SetTransObject(SQLCA)

If tab_1.tabpage_acciones.d_lista_acciones.Retrieve(0) <= 0 Then
	   tab_1.tabpage_acciones.d_lista_acciones.InsertRow(0)
End If

tab_1.tabpage_ot.d_lista_brigadas_ot.SetTransObject(SQLCA)

If tab_1.tabpage_ot.d_lista_brigadas_ot.Retrieve(0) <= 0 Then
	   tab_1.tabpage_ot.d_lista_brigadas_ot.InsertRow(0)
End If

//tab_1.tabpage_ot.d_datos_ot.SetTransObject(SQLCA)
//
//If tab_1.tabpage_ot.d_datos_ot.Retrieve(0) <= 0 Then
//	   tab_1.tabpage_ot.d_datos_ot.InsertRow(0)
//End If

tab_1.tabpage_ot.d_datos_ot.visible=true

//tab_1.tabpage_acciones.d_lista_acciones_incidencia.SetTransObject(SQLCA)

//If tab_1.tabpage_acciones.d_lista_acciones_incidencia.Retrieve(0) <= 0 Then
//	   tab_1.tabpage_acciones.d_lista_acciones_incidencia.InsertRow(0)
//End If
//
//tab_1.tabpage_acciones.d_lista_acciones.SetTransObject(SQLCA)
//
//If tab_1.tabpage_acciones.d_lista_acciones.Retrieve(0) <= 0 Then
//	   tab_1.tabpage_acciones.d_lista_acciones.InsertRow(0)
//End If

//tab_1.tabpage_acciones.mle_observacion_accion_incidencia.text=''

//tab_1.tabpage_observaciones.mle_observaciones.text=''
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.reset()

tab_1.tabpage_interrupciones.visible=false
tab_1.tabpage_maniobras.visible=false
 
tab_1.ii_estado_oper=0
 
close(w_msg)

return 1
end function

public function integer mostrar_datawindow (integer argumento_nuevo);string ls_select_ct, ls_select_aco,ls_filtro_acom


ls_select_ct = ' SELECT DISTINCT(SGD_INSTALACION.NRO_INSTALACION),  ' +&
						'			SGD_INSTALACION.NOM_INSTALACION,  ' +&
						'			NVL(SGD_INTERRUPCION.CCLI_AFEC, 0), ' +&
						'			NVL(SGD_INSTALACION.CANT_CLI,0),  ' +&
						'			NVL(SGD_INSTALACION.POT_INSTALADA,0), ' +&
						'			NVL(SGD_INTERRUPCION.POT_INST_AFEC,0),  ' +&
						'			NVL(SGD_INSTALACION.POT_CONTRATADA,0), ' +&
						'			NVL(SGD_INTERRUPCION.POT_CONTR_AFEC,0), ' +&
						'			SGD_INTERRUPCION.NOMBRE_SALMT,  ' +&
						'        sgd_valor.descripcion, ' +&
						'			SGD_INTERRUPCION.F_ALTA,  ' +&
						'			SGD_INTERRUPCION.F_REPOSICION,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE_FASE_A,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE_FASE_B,  ' +&
						'			SGD_INTERRUPCION.MANIOBRA_CIERRE_FASE_C  ' +&
						'FROM SGD_INTERRUPCION, SGD_INSTALACION, sgd_valor ' +&
						'WHERE SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia  ' +&
						'  AND SGD_INTERRUPCION.NRO_INSTALACION = SGD_INSTALACION.NRO_INSTALACION  ' +&
						'  AND SGD_INSTALACION.BDI_JOB = 0 ' +&
						'  AND SGD_VALOR.CODIF = '+ "'FASE'" +  &
						'  AND SGD_VALOR.VALOR=SGD_INTERRUPCION.FASE_AFECTADA'
						
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Object.DataWindow.Table.Select = ls_select_ct
	
	ls_select_aco = 	'SELECT DISTINCT(SGD_ACOMETIDA.CODIGO), ' +&
							' NVL(SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.CODIGO) NOM_ACOMETIDA, ' +&
							' fgnu_calle_referencia(callejero.nom_calle, SGD_ACOMETIDA.num_puerta, SGD_ACOMETIDA.duplicador, SGD_ACOMETIDA.nif, SGD_ACOMETIDA.cod_calle, 0, ~'~', 0, ~'~') cdireccion, ' + &
							' sgd_valor.descripcion, ' +& 
							' FGNU_FASE_AFECTADA(SGD_ACOMETIDA.TIPO_CONEXION, SGD_INTERRUPCION.FASE_AFECTADA) fase_afectada' +&
							' FROM SGD_ACOMETIDA, ' +&
							' SGD_INTERRUPCION, ' +&
							' CALLEJERO, ' +&
							' SGD_VALOR' +&
							' WHERE SGD_INTERRUPCION.NRO_INSTALACION = :pl_codigo_ct ' +&
							' AND SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia ' +&
							' AND SGD_ACOMETIDA.INSTALACION_ORIGEN IN (select nro_instalacion FROM SGD_instalacion  ' +&		
							' START WITH SGD_INSTALACION.NRO_INSTALACION = :pl_codigo_ct ' +&
							 ' CONNECT BY PRIOR NRO_INSTALACION = NRO_INST_PADRE) ' +&
							' AND SGD_ACOMETIDA.BDI_JOB = 0 ' +&
							' AND SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE ' +&
						'  AND SGD_VALOR.CODIF = '+ "'FASE'" +  &
						'  AND SGD_VALOR.VALOR=SGD_INTERRUPCION.FASE_AFECTADA'
							
	tab_1.tabpage_interrupciones.dw_lista_acometidas.Object.DataWindow.Table.Select = ls_select_aco
	
	ls_filtro_acom = " fase_afectada = 1"
	tab_1.tabpage_interrupciones.dw_lista_acometidas.setfilter(ls_filtro_acom)
	tab_1.tabpage_interrupciones.dw_lista_acometidas.filter()

return 1
end function

public subroutine fw_limpiar_variables ();
tab_1.ib_open = True
tab_1.ib_primera_vez_formulario = True
tab_1.ib_primera_vez_observaciones =  True
tab_1.ib_primera_vez_ot =  True
tab_1.ib_primera_vez_cuadrillas =  True
tab_1.ib_primera_vez_interrupciones =  True
tab_1.ib_primera_vez_seguimiento =  True
tab_1.ib_primera_vez_acciones =  True
tab_1.ib_primera_vez_maniobras =True
tab_1.ib_primera_vez_indisponibilidades =True
tab_1.ib_derivada_mante = false
tab_1.ib_valido_ot=false
tab_1.ib_mensaje=false
tab_1.ib_hay_brig_trab=false
tab_1.ib_retorno_segumiento=false
tab_1.ib_hubo_cambios=false
tab_1.ib_error_en_causa = FALSE
tab_1.ib_error_en_causa_subtipo = FALSE
tab_1.ib_inc_finalizada = FALSE
tab_1.ib_ind_scada = FALSE
tab_1.ib_anadir_eb =false
tab_1.ii_alcance=0
tab_1.ii_modifica_causa = 0
tab_1.ii_ind_act_grafica =0
tab_1.ii_avisar_oop_eb = 2
tab_1.il_handle_instalacion=0
tab_1.tipo_ot = 'BR'
tab_1.is_sqlcontratas = ""
tab_1.ib_dejo_cambiar = TRUE
tab_1.ll_row_acc_inc_acc=1
tab_1.ib_hubo_error= false
tab_1.ib_observ=true
tab_1.ii_cant_trabajos = 0
tab_1.ii_pe = 0
tab_1.ii_eliminar_pe = 0
tab_1.ib_mensaje_resuelta= false
tab_1.ii_valtiempomax = 0

//DATAWINDOWS

tab_1.tabpage_acciones.d_lista_acciones_incidencia.Reset()
tab_1.tabpage_acciones.mle_observacion_accion_incidencia.text = ""
tab_1.tabpage_interrupciones.d_datos_interrup.Reset()
tab_1.tabpage_interrupciones.d_datos_interrup.DataObject = 'd_ins_2010_lista_interrupciones'
tab_1.tabpage_interrupciones.d_datos_interrup.Object.fase_a.Text='Fase ' + gs_fase_a
tab_1.tabpage_interrupciones.d_datos_interrup.Object.fase_b.Text='Fase ' + gs_fase_b
tab_1.tabpage_interrupciones.d_datos_interrup.Object.fase_c.Text='Fase ' + gs_fase_c
tab_1.tabpage_interrupciones.d_datos_interrup.SetTransObject(SQLCA)

tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida.visible = TRUE
tab_1.tabpage_formulario.d_inf_general.object.fase_sugerida_t.visible = TRUE

tab_1.tabpage_formulario.dw_informe_tecnico.reset( )
tab_1.tabpage_formulario.dw_informe_tecnico.dataobject = 'd_inc_2051_otros'
tab_1.tabpage_formulario.dw_informe_tecnico.SetTransObject(SQLCA)

tab_1.tabpage_interrupciones.st_duracion.text = " "
tab_1.tabpage_interrupciones.st_durac.text = "Dur. Ultima Int.:"


int ll_rootitem
ll_rootitem = tab_1.tabpage_interrupciones.tv_1.findItem(RootTreeItem!,0)

DO UNTIL ll_rootitem = -1
	tab_1.tabpage_interrupciones.tv_1.deleteitem(ll_rootitem)
	ll_rootitem  = tab_1.tabpage_interrupciones.tv_1.findItem(RootTreeItem!,0)
LOOP

ii_tipo_instalacion = 0
i_vez=2
ii_estado_red = 0
ii_incidencia_de_op = -1
ib_post_activate = False
ib_resuelta = false
ib_mostrar_mensaje = true
consulta_hecha=false
inicio = -1


tab_1.ii_estado_oper = 0
tab_1.ii_estado_mant  = 0
tab_1.ii_nro_centro  = 0
tab_1.ii_nro_cmd = 0
tab_1.ii_nro_mesa = 0
tab_1.ii_incid_suministro = 0
tab_1.ii_resuelve_mant = 0
tab_1.ii_viejo_index = 0
tab_1.ii_indice = 0
tab_1.ii_alcance = 0
tab_1.ii_tipo_incid = 0
tab_1.ii_modifica_causa = 0
tab_1.ii_incidencia_pendiente  = 0
tab_1.ii_incidencia_enviado_brigada  = 0
tab_1.ii_incidencia_en_reposicion  = 0
tab_1.ii_incidencia_servicio_repuesto  = 0
tab_1.ii_incidencia_resuelta  = 0
tab_1.ii_incidencia_cerrada = 0
tab_1.ii_incidencia_pte_pta_explotacion = 0
tab_1.ii_ind_act_grafica = 0
tab_1.ii_avisar_oop_eb = 2
tab_1.ii_tipo_inst  = 0
tab_1.il_nro_incidencia = 0
tab_1.il_nro_ot = 0
tab_1.il_handle_instalacion=0
tab_1.ii_causa_ant = 0
tab_1.ii_fila_selec_mat = 0
tab_1.click_row = 0
tab_1.click_row_brig_ot = 0
tab_1.i_grabo_ot = 0
tab_1.ii_brigada_resp = 0
tab_1.l_si_valido = 0
tab_1.il_click_mant_seg = 0
tab_1.il_click_oper_seg = 0
tab_1.il_ultima_fila_clickeada_seg = 0
tab_1.il_ultima_fila_click_mant_seg = 0
tab_1.ll_row_acc_inc_acc = 1
tab_1.ll_row_accion_acc = 0
tab_1.ii_resul_dig = 0
tab_1.ii_cant_trabajos = 0
tab_1.ii_pe = 0
tab_1.ii_eliminar_pe = 0
tab_1.ii_fila_clickeada = 0
tab_1.il_handle_indisponibilidad = 0
tab_1.il_ENR = 0
tab_1.il_nro_inst_indisponibilidad = 0
tab_1.il_row_datos_indisponibilidad = 0
tab_1.ii_estActualAnterior = 0
tab_1.ii_valtiempomax = 0
tab_1.ii_causa = 0

SetNull(tab_1.idt_fec_deteccion)
SetNull(tab_1.idt_fec_deteccion_nueva)
SetNull(tab_1.idt_fecha_eb)
SetNull(tab_1.idt_fecha_cl)
SetNull(tab_1.idt_fecha_er)
SetNull(tab_1.idt_fecha_sr)
SetNull(tab_1.idt_fecha_resuelta)
SetNull(tab_1.idt_fecha_nueva_repos)
SetNull(tab_1.idt_fecha_vieja_repos)
SetNull(tab_1.idt_fecha_pt_pex)
SetNull(tab_1.idt_fecha_st_mant)
SetNull(tab_1.idt_fecha_eb_mant)
SetNull(tab_1.idt_fecha_al_mant)
SetNull(tab_1.idt_fecha_rp_mant)
SetNull(tab_1.idt_fecha_pr_mant)
SetNull(tab_1.idt_fecha_rm_mant)
SetNull(tab_1.idt_f_actual)
SetNull(tab_1.idt_fec_est_res)
SetNull(tab_1.idt_f_brigada_old)
SetNull(tab_1.idt_fecha_ant_mant_seg)
SetNull(tab_1.il_ind_desmarcadas)
SetNull(tab_1.il_inst_dig)

tab_1.is_accion_llamada = ""
tab_1.tipo_ot = 'BR'
tab_1.is_sqlcontratas = ""
tab_1.is_tipo_ventana = ""
tab_1.ls_columna = ""
tab_1.is_nom_brig_res = ""

tab_1.ib_open = True
tab_1.ib_primera_vez_formulario = True
tab_1.ib_primera_vez_observaciones =  True
tab_1.ib_primera_vez_ot =  True
tab_1.ib_primera_vez_cuadrillas =  True
tab_1.ib_primera_vez_interrupciones =  True
tab_1.ib_primera_vez_seguimiento =  True
tab_1.ib_primera_vez_acciones =  True
tab_1.ib_primera_vez_maniobras =True
tab_1.ib_primera_vez_indisponibilidades =True
tab_1.ib_cambio_instalacion = false
tab_1.ib_derivada_mante = false
tab_1.ib_valido_ot=false
tab_1.ib_mensaje=false
tab_1.ib_hay_brig_trab=false
tab_1.ib_retorno_segumiento=false
tab_1.ib_hubo_cambios=false
tab_1.ib_inst_int = false
tab_1.ib_pestana_otros = false
tab_1.ib_nuevos_tip_inc= false
tab_1.ib_pxt_cxt= false
tab_1.ib_afect_parcial= false
tab_1.ib_error_en_causa = FALSE
tab_1.ib_error_en_causa_subtipo = FALSE
tab_1.ib_inc_finalizada = FALSE
tab_1.ib_ind_scada = FALSE
tab_1.ib_anadir_eb =false
tab_1.ib_error_fec_deteccion = false
tab_1.ib_necesita_enviar_estados= false
tab_1.ib_valido_mat = false
tab_1.ib_modif_mat = false
tab_1.ib_dejo_cambiar = TRUE
tab_1.ib_cancelo_seg = false
tab_1.ib_hubo_error= false
tab_1.ib_observ=true
tab_1.ib_mensaje_resuelta= false

tab_1.ib_pestana_otros = fg_verifica_parametro('pestana_otros')
tab_1.ib_nuevos_tip_inc = fg_verifica_parametro('nuevos_tip_inc')
tab_1.ib_pxt_cxt = fg_verifica_parametro('pxt_cxt') 
end subroutine

public subroutine fw_bloquear_dw ();tab_1.tabpage_formulario.d_inf_general.modify("cod_accion_inc.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("cod_accion_inc.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("f_elim_peligro.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("f_elim_peligro.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("desc.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("desc.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("rep_red.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("rep_red.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.protect=1")

tab_1.tabpage_formulario.dw_informe_tecnico.modify("tension_origen.background.color="+gs_gris)
tab_1.tabpage_formulario.dw_informe_tecnico.modify("tension_origen.protect=1")
tab_1.tabpage_formulario.dw_informe_tecnico.modify("tension_afectada.background.color="+gs_gris)
tab_1.tabpage_formulario.dw_informe_tecnico.modify("tension_afectada.protect=1")
tab_1.tabpage_formulario.dw_informe_tecnico.modify("agente.background.color="+gs_gris)
tab_1.tabpage_formulario.dw_informe_tecnico.modify("agente.protect=1")
tab_1.tabpage_formulario.dw_informe_tecnico.modify("area_afec.background.color="+gs_gris)
tab_1.tabpage_formulario.dw_informe_tecnico.modify("area_afec.protect=1")


tab_1.tabpage_seguimiento.d_seguimiento_operaciones.modify("observacion.background.color="+gs_gris)
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.modify("observacion.protect=1")
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.modify("f_alta.background.color="+gs_gris)
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.modify("f_alta.protect=1")


tab_1.tabpage_ot.d_datos_ot.modify("f_elim_peligro.background.color="+gs_gris)
tab_1.tabpage_ot.d_datos_ot.modify("f_elim_peligro.protect=1")
tab_1.tabpage_ot.d_datos_ot.modify("f_hasta.background.color="+gs_gris)
tab_1.tabpage_ot.d_datos_ot.modify("f_hasta.protect=1")
tab_1.tabpage_ot.d_datos_ot.modify("descripcion.background.color="+gs_gris)
tab_1.tabpage_ot.d_datos_ot.modify("descripcion.protect=1")
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Modify("observacion.Edit.DisplayOnly=Yes")

end subroutine

public subroutine fw_inicializar_componentes ();tab_1.tabpage_ot.d_crit_seleccion.visible = false
tab_1.tabpage_interrupciones.d_datos_interrup.visible = true
tab_1.tabpage_ot.d_datos_ot.visible = true
tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible = false
tab_1.tabpage_seguimiento.d_estados_operaciones.visible = false
tab_1.tabpage_formulario.d_inf_general.visible = true
tab_1.tabpage_acciones.d_lista_acciones.visible = true
tab_1.tabpage_acciones.d_lista_acciones_incidencia.visible = true
tab_1.tabpage_ot.d_lista_brigadas_ot.visible = true
tab_1.tabpage_interrupciones.d_lista_otras_inst.visible = false
tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.visible = false
tab_1.tabpage_cuadrillas.d_materiales.visible = true
tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = false
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.visible = true
tab_1.tabpage_formulario.dw_1.visible = false
tab_1.tabpage_formulario.dw_2.visible = false
tab_1.tabpage_formulario.dw_3.visible = false
tab_1.tabpage_interrupciones.dw_afec_parcial_sum.visible = false
tab_1.tabpage_ot.dw_ambito.visible = false
tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible = true
tab_1.tabpage_formulario.dw_detalle_interr.visible = false
tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.visible = false
tab_1.tabpage_formulario.gb_3.visible = true
tab_1.tabpage_formulario.dw_informe_tecnico.visible = true
tab_1.tabpage_interrupciones.dw_lista_acometidas.visible = false
tab_1.tabpage_ot.dw_lista_contratas.visible = false
tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.visible = true
tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.visible = false
tab_1.tabpage_interrupciones.dw_lista_int_comunes.visible = false
tab_1.tabpage_interrupciones.dw_lista_int_operaciones.visible = false
tab_1.tabpage_maniobras.dw_maniobras.visible = true
tab_1.tabpage_otros.dw_otros.visible = true
tab_1.tabpage_interrupciones.dw_sin_interrupcion.visible = false



tab_1.tabpage_ot.bmp_brigada_responsable.visible = false
tab_1.tabpage_indisponibilidades.p_1.visible = true
tab_1.tabpage_indisponibilidades.p_10.visible = true
tab_1.tabpage_indisponibilidades.p_2.visible = true
tab_1.tabpage_indisponibilidades.p_3.visible = true
tab_1.tabpage_indisponibilidades.p_4.visible = true
tab_1.tabpage_indisponibilidades.p_5.visible = true
tab_1.tabpage_indisponibilidades.p_6.visible = true
tab_1.tabpage_indisponibilidades.p_7.visible = true
tab_1.tabpage_indisponibilidades.p_8.visible = true
tab_1.tabpage_indisponibilidades.p_9.visible = true
//tab_1.tabpage_formulario.st_1.visible = true
tab_1.tabpage_indisponibilidades.st_10.visible = true
tab_1.tabpage_indisponibilidades.st_11.visible = true
tab_1.tabpage_indisponibilidades.st_12.visible = true
tab_1.tabpage_indisponibilidades.st_13.visible = true
tab_1.tabpage_indisponibilidades.st_14.visible = true
tab_1.tabpage_indisponibilidades.st_15.visible = true
tab_1.tabpage_indisponibilidades.st_16.visible = false
tab_1.tabpage_indisponibilidades.st_17.visible = true
//tab_1.tabpage_formulario.st_18.visible = true
tab_1.tabpage_formulario.st_2.visible = false
tab_1.tabpage_observaciones.st_3.visible = true
tab_1.tabpage_observaciones.st_4.visible = false
tab_1.tabpage_indisponibilidades.st_5.visible = true
tab_1.tabpage_indisponibilidades.st_6.visible = true
tab_1.tabpage_indisponibilidades.st_7.visible = true
tab_1.tabpage_indisponibilidades.st_8.visible = true
tab_1.tabpage_indisponibilidades.st_9.visible = true
tab_1.tabpage_formulario.st_cxt_t.visible = false
tab_1.tabpage_formulario.st_cxt_valor.visible = false
tab_1.tabpage_interrupciones.st_datos_interrup.visible = true
tab_1.tabpage_interrupciones.st_durac.visible = false
tab_1.tabpage_interrupciones.st_durac_total.visible = false
tab_1.tabpage_interrupciones.st_duracion.visible = false
tab_1.tabpage_interrupciones.st_duracion_total.visible = false
//tab_1.tabpage_formulario.st_fases.visible = true
tab_1.tabpage_interrupciones.st_fases_afect.visible = false
tab_1.tabpage_interrupciones.st_lista_int_operaciones.visible = false
tab_1.tabpage_interrupciones.st_otras_inst.visible = false
tab_1.tabpage_formulario.st_pxt_cxt_fondo.visible = false
tab_1.tabpage_formulario.st_pxt_t.visible = false
tab_1.tabpage_formulario.st_pxt_valor.visible = false
tab_1.tabpage_ot.st_sin_ot.visible = false
tab_1.tabpage_acciones.st_titulo.visible = true
tab_1.tabpage_formulario.cbx_blackout.visible = false
tab_1.tabpage_interrupciones.cbx_fase_a.visible = false
tab_1.tabpage_interrupciones.cbx_fase_b.visible = false
tab_1.tabpage_interrupciones.cbx_fase_c.visible = false
tab_1.tabpage_seguimiento.chk_resolucion_mant.visible = false
tab_1.tabpage_seguimiento.chk_resolucion_mant.visible = false
//tab_1.tabpage_interrupciones.cb_1.visible = true
tab_1.tabpage_interrupciones.tv_1.visible = true
tab_1.tabpage_observaciones.cb_14.visible = false
tab_1.tabpage_observaciones.cb_2.visible = false
tab_1.tabpage_cuadrillas.cb_agregar.visible = true
tab_1.tabpage_cuadrillas.cb_eliminar.visible = true
tab_1.tabpage_indisponibilidades.cb_maniobras.visible = true
tab_1.tabpage_ot.cb_ot.visible = false
tab_1.tabpage_maniobras.cb_otras_man.visible = false
tab_1.tabpage_interrupciones.cb_separador.visible = false
tab_1.tabpage_indisponibilidades.gb_1.visible = true
tab_1.tabpage_ot.gb_11.visible = false
tab_1.tabpage_ot.gb_2.visible = false

tab_1.tabpage_acciones.mle_observacion_accion_incidencia.visible = true
tab_1.tabpage_observaciones.mle_observaciones.visible = true
tab_1.tabpage_observaciones.mle_observaciones_mnto.visible = false
tab_1.tabpage_observaciones.ole_1.visible = false
tab_1.tabpage_ot.rb_1.visible = false
tab_1.tabpage_ot.rb_2.visible = false
tab_1.tabpage_interrupciones.rb_misma_inc.visible = false
tab_1.tabpage_interrupciones.rb_otras_inc.visible = false
tab_1.tabpage_ot.tab_lista_brigadas.visible = false
tab_1.tabpage_indisponibilidades.tv_2.visible = true
tab_1.tabpage_indisponibilidades.em_1.visible = true
tab_1.tabpage_interrupciones.pb_anterior.visible = false
tab_1.tabpage_interrupciones.pb_avanzar.visible = false
end subroutine

event activate;string ls_prog_llamante, ls_accion_llamada

//AHM 30/09/2009 (Mejora 1/535253)
IF gu_comunic.is_comunic.programa_llamante = "w_1203_inf_aviso" OR gu_comunic.is_comunic.programa_llamante = "w_1203_inf_aviso_hist"  THEN
     w_2307_consulta_avisos.setFocus()
   RETURN   
END IF
//Fin AHM

 
if isvalid(gu_control_v_incidencias) then
	fw_escribe_log(string(NOW()) + ":  Activate de la ventana de incidencias (" + string(tab_1.il_nro_incidencia) + ") (activate,w_2301)")
	gu_control_v_incidencias.of_ventana_activada(handle(this),true)
	gu_control_v_incidencias.of_actualiza_operaciones(-1,false,handle(this))
end if

IF NOT IsValid(This) Then Return

IF NOT ib_post_activate THEN
	///////////////////////// retorno de identificacion de instalaciones///////
	// Si retorne de seleccion de instalacion pero llamado desde
	// otras instalaciones, el programa retorno es "Otras_inst" controlando
	// que no se ejecute el pos_activate
	IF gu_comunic1.is_comunic.programa_retorno = "iw_2120" THEN
				
		lu_comunic1.is_comunic = gu_comunic1.is_comunic
		
		IF not isnull(gu_comunic1.is_comunic.decval1) THEN
			ls_prog_llamante = lu_comunic.is_comunic.programa_llamante			
			lu_comunic.is_comunic = gu_comunic1.is_comunic
			lu_comunic.is_comunic.programa_llamante = ls_prog_llamante
		END IF
		
		this.postevent("ue_pos_activate")
	
	END IF
		
	////////////////////// Retorna de consulta de avisos asociados /////////////
	// Desde esta ventana se liberan avisos, no es solo consulta
	
	IF gu_comunic.is_comunic.programa_Retorno="iw_2307_consulta_avisos" THEN
		
		ls_prog_llamante = lu_comunic.is_comunic.programa_llamante
		lu_comunic.is_comunic = gu_comunic.is_comunic
		
		lu_comunic.is_comunic.programa_llamante = ls_prog_llamante
	
		this.postevent("ue_pos_activate")
	
	END IF
	
	IF gu_comunic.is_comunic.programa_Retorno="w_seleccion_fase" THEN
		lu_comunic.is_comunic.strval1 = '' 
		
		IF gu_comunic.is_comunic.accion_retorno = "Seleccion" THEN			
		
			ls_prog_llamante = lu_comunic.is_comunic.programa_llamante
			ls_accion_llamada = lu_comunic.is_comunic.accion_llamada
			

			lu_comunic.is_comunic = gu_comunic.is_comunic

			
			lu_comunic.is_comunic.programa_llamante = ls_prog_llamante
			lu_comunic.is_comunic.accion_llamada = ls_accion_llamada
			lu_comunic.is_comunic.strval1 = gu_comunic.is_comunic.strval1
			this.postevent("ue_pos_activate")
		END IF
	END IF
	
//	Yield()

END IF
end event

event close;call super::close;//DESTRUCCION DE OBJETOS CREADOS EN EL OPEN DE LA VENTANA
This.visible = False
// GNU 23/01/2007. Mejora 1/311530
IF lu_comunic.is_comunic.programa_llamante="w_1105_avisos_con_alim" AND &
	lu_comunic.is_comunic.accion_llamada="Alta_nivel_suministro" THEN
	gnu_u_transaction.uf_desbloquea_avisos( lu_comunic.is_comunic.longval2, 1)
END IF

//AHM 03/1/2009 Mejora 1/565472
fw_desbloqueoInstalacion();

if not isnull(gu_control_v_incidencias) then 
	gu_control_v_incidencias.of_cierra_ventana(tab_1.il_nro_incidencia, handle(this))
end if
gnu_u_transaction.uf_rollback(THIS)
fnu_destruir_objetos()

end event

event closequery;long ll_row, ll_contador, ll_brigada
int li_respuesta
md_ingreso_incidencias lm_menu
string ls_mensaje	

This.tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Accepttext()
//This.tab_1.ib_inc_finalizada=FALSE

lm_menu = This.menuid
tab_1.tabpage_seguimiento.d_seguimiento_operaciones.triggerEvent("losefocus")

IF NOT ib_post_activate THEN
	
	if (tab_1.is_accion_llamada <> "Consulta" AND gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_MANTEN') = 1) or &
		(tab_1.is_accion_llamada = "Consulta" AND  tab_1.ii_estado_oper = fgci_incidencia_pte_explotacion) THEN
		
		if lm_menu.m_archivo.m_grabar.enabled = true and tab_1.ii_estado_oper <> fgci_incidencia_pte_explotacion then
			li_respuesta = gnv_msg.f_mensaje('CG001',"","",YesNoCancel!)
		elseif  tab_1.ii_estado_oper = fgci_incidencia_pte_explotacion then//and tab_1.is_accion_llamada <> "Consulta" then //GNU 22-11-2006. Incidencia 0/466424
			li_respuesta = 1
		else
			li_respuesta = 2
		end if
		
		CHOOSE CASE li_respuesta
			CASE 1
				lm_menu.m_archivo.m_grabar.enabled = False
				lm_menu.m_consultar.m_situacinclimatolgica.enabled = False
				lm_menu.m_consultar.m_suministrosimportantes.enabled = False
				lm_menu.m_consultar.m_operacion.enabled = False
				lm_menu.m_consultar.m_avisos.enabled = False
				this.triggerevent("ue_grabar") 
				IF ib_grabo_bien THEN
					fw_bloquear_brigadas_asignadas(0)
					gu_comunic.is_comunic.programa_retorno = 'iw_2301'
					gu_comunic.is_comunic.accion_retorno = 'Alta efectuada'
					gu_comunic.is_comunic.intval9 = tab_1.ii_estado_oper
					
					gi_con_material_averiado = 0
					// COMMIT;
					// Se desbloquean los registros bloqueados
					// se desbloquean las brigadas bloqueadas
										
					IF lu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" THEN
						gnu_u_transaction.uf_commit(this.tab_1)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
						//gnu_u_transaction.uf_commit(this.tab_1,true)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
						gnu_u_transaction.uf_commit(this.st_bloqueo,true) // Desbloqueo las instalaciones.
						//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
						//Desbloqueo de las indisponibilidades
						IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
							gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
							IF isValid(ids_disponibilidades) THEN
								DESTROY (ids_disponibilidades)
							END IF

//							gf_bloquear_activos(tab_1.il_nro_incidencia, FALSE) 
						END IF
						// Desbloqueo de la incidencia
						gnu_u_transaction.uf_commit(w_1234_consulta_incidencias,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia), fgci_bloqueo_incidencia, tab_1.il_nro_incidencia)
						// Desbloqueo de la OT
						gnu_u_transaction.uf_commit(w_1106_selec_incid,"GI_OT","NRO_OT=" + string(tab_1.il_nro_ot), fgci_bloqueo_ot, tab_1.il_nro_ot)

					ELSEIF lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" THEN
						// Se desbloquea el aviso
						gnu_u_transaction.uf_commit(w_1105_avisos_con_alim, "GI_AVISOS", "NRO_AVISO = " + STRING(lu_comunic.is_comunic.longval2))
						//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
						//Desbloqueo de las indisponibilidades
						IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
							gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
							IF isValid(ids_disponibilidades) THEN
								DESTROY (ids_disponibilidades)
							END IF
						END IF
						gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia))
					ELSEIF lu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim" AND &
							 (lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" OR &
							  lu_comunic.is_comunic.accion_llamada = "Modificacion") THEN
					   gnu_u_transaction.uf_commit(this.tab_1)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
						//gnu_u_transaction.uf_commit(this.tab_1,true)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
						gnu_u_transaction.uf_commit(this.st_bloqueo,true) // Desbloqueo las instalaciones.
						//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
						//Desbloqueo de las indisponibilidades
						IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
							gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
							IF isValid(ids_disponibilidades) THEN
								DESTROY (ids_disponibilidades)
							END IF
//							gf_bloquear_activos(tab_1.il_nro_incidencia, FALSE) 
						END IF
					  // Desbloqueo de la incidencia
						gnu_u_transaction.uf_commit(w_1105_avisos_con_alim,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia),fgci_bloqueo_incidencia, tab_1.il_nro_incidencia)
						// Desbloqueo de la OT
						gnu_u_transaction.uf_commit(w_1106_selec_incid,"GI_OT","NRO_OT=" + string(tab_1.il_nro_ot), fgci_bloqueo_ot, tab_1.il_nro_ot)
					ELSE
						gnu_u_transaction.uf_commit()	 	
					END IF
				
				ELSE
			
					Message.returnvalue=1
					lm_menu.m_archivo.m_grabar.enabled = TRUE
					lm_menu.m_consultar.m_situacinclimatolgica.enabled = TRUE
					lm_menu.m_consultar.m_suministrosimportantes.enabled = TRUE
					lm_menu.m_consultar.m_operacion.enabled = TRUE
					lm_menu.m_consultar.m_avisos.enabled = TRUE
					
				END IF
				gnu_u_transaction.uf_rollback(this.st_bloqueo) // Desbloqueo lo bloqueado por la incidencia		
					
			CASE 2
				lm_menu.m_archivo.m_grabar.enabled = False
				lm_menu.m_consultar.m_situacinclimatolgica.enabled = False
				lm_menu.m_consultar.m_suministrosimportantes.enabled = False
				lm_menu.m_consultar.m_operacion.enabled = False
				lm_menu.m_consultar.m_avisos.enabled = False
				gu_comunic.is_comunic=lu_comunic.is_comunic
				gu_comunic.is_comunic.programa_retorno = 'iw_2301'
				gu_comunic.is_comunic.accion_retorno = 'cancelado'
				gi_con_material_averiado = 0
				//ROLLBACK;
				fw_bloquear_brigadas_asignadas(0)
				fw_desbloq_brig_fin_trab()
				//gnu_u_transaction.uf_rollback(tab_1.tabpage_ot.d_lista_brigadas_ot, TRUE)
				IF lu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" THEN
					// se desbloquea la incidencia
					gnu_u_transaction.uf_rollback(this.tab_1)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
					//gnu_u_transaction.uf_rollback(this.tab_1,true)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
					gnu_u_transaction.uf_rollback(this.st_bloqueo,true) // Desbloqueo las instalaciones.
					//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
					//Desbloqueo de las indisponibilidades
					IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
						gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
						IF isValid(ids_disponibilidades) THEN
							DESTROY (ids_disponibilidades)
						END IF
					END IF
					// Desbloqueo de la incidencia
					gnu_u_transaction.uf_rollback(w_1234_consulta_incidencias,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia),fgci_bloqueo_incidencia, tab_1.il_nro_incidencia)
					// Desbloqueo de la OT
					gnu_u_transaction.uf_rollback(w_1234_consulta_incidencias,"GI_OT","NRO_OT=" + string(tab_1.il_nro_ot), fgci_bloqueo_ot, tab_1.il_nro_ot)
				ELSEIF lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" THEN
					// se debloquea el aviso
					gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim, "GI_AVISOS", "NRO_AVISO = " + STRING(lu_comunic.is_comunic.longval2))
					//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
					//Desbloqueo de las indisponibilidades
					IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
						gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
						IF isValid(ids_disponibilidades) THEN
							DESTROY (ids_disponibilidades)
						END IF
					END IF
					gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia))
				ELSEIF lu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim" AND &
							 (lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" OR &
							  lu_comunic.is_comunic.accion_llamada = "Modificacion") THEN
						 //AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
						//Desbloqueo de las indisponibilidades
						IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
							gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
							IF isValid(ids_disponibilidades) THEN
								DESTROY (ids_disponibilidades)
							END IF
						END IF
					// Desbloqueo de la incidencia
					gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia), fgci_bloqueo_incidencia, tab_1.il_nro_incidencia)
					gnu_u_transaction.uf_rollback(this.tab_1)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
					//gnu_u_transaction.uf_rollback(this.tab_1,true)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
					gnu_u_transaction.uf_rollback(this.st_bloqueo,true) // Desbloqueo las instalaciones.
					// Desbloqueo de la OT
					gnu_u_transaction.uf_rollback(w_1106_selec_incid,"GI_OT","NRO_OT=" + string(tab_1.il_nro_ot), fgci_bloqueo_ot, tab_1.il_nro_ot)
				ELSE
					gnu_u_transaction.uf_rollback()
				END IF	
					gnu_u_transaction.uf_rollback(this.st_bloqueo) // Desbloqueo lo bloqueado por la incidencia
			CASE 3, -1
				Message.returnvalue=1
		END CHOOSE
	
	END IF
ELSE
	//gnu_u_transaction.uf_rollback(this.tab_1.tabpage_ot.d_lista_brigadas_ot, TRUE)
	if tab_1.is_accion_llamada<>"Consulta" AND gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_MANTEN') = 1 THEN
		fw_bloquear_brigadas_asignadas(0)
		fw_desbloq_brig_fin_trab()
	end if
	IF lu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" THEN
		// se desbloquea la incidencia
		gnu_u_transaction.uf_rollback(this.tab_1)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
		//gnu_u_transaction.uf_rollback(this.tab_1,true)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
		gnu_u_transaction.uf_rollback(this.st_bloqueo,true) // Desbloqueo las instalaciones.
		//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
		//Desbloqueo de las indisponibilidades
		IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
			gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
			IF isValid(ids_disponibilidades) THEN
				DESTROY (ids_disponibilidades)
			END IF
		END IF
		// Desbloqueo de la incidencia
		gnu_u_transaction.uf_rollback(w_1234_consulta_incidencias,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia), fgci_bloqueo_incidencia, tab_1.il_nro_incidencia)
		// Desbloqueo de la OT
		gnu_u_transaction.uf_rollback(w_1106_selec_incid,"GI_OT","NRO_OT=" + string(tab_1.il_nro_ot), fgci_bloqueo_ot, tab_1.il_nro_ot)
	ELSEIF lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" THEN
		// se debloquea el aviso
		gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim, "GI_AVISOS", "NRO_AVISO = " + STRING(lu_comunic.is_comunic.longval2))
		//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
		//Desbloqueo de las indisponibilidades
		IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
			gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
			IF isValid(ids_disponibilidades) THEN
				DESTROY (ids_disponibilidades)
			END IF
		END IF
		gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia))
	ELSEIF lu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim" AND &
			 (lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" OR &
			  lu_comunic.is_comunic.accion_llamada = "Modificacion") THEN
		// se desbloquea la instalacion
		gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim, "SGD_INSTALACION", "NRO_INSTALACION = " + STRING(lu_comunic.is_comunic.decval1))
		gnu_u_transaction.uf_rollback(this.tab_1)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
		gnu_u_transaction.uf_rollback(this.st_bloqueo,true) // Desbloqueo las instalaciones.
		//gnu_u_transaction.uf_rollback(this.tab_1,true)  // Desbloqueo la dw de otras interrupciones en el caso de que la hubiera bloqueado.
		// Desbloqueo de la incidencia
		//AHM (09/12/2009) Problemas en el desbloqueo de las indisponibilidades
		//Desbloqueo de las indisponibilidades
		IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
			gnu_u_transaction.uf_desbloqueo_disponibilidades(ids_disponibilidades)
			IF isValid(ids_disponibilidades) THEN
				DESTROY (ids_disponibilidades)
			END IF
		END IF
		gnu_u_transaction.uf_rollback(w_1105_avisos_con_alim,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(tab_1.il_nro_incidencia),fgci_bloqueo_incidencia, tab_1.il_nro_incidencia)
		// Desbloqueo de la OT
		gnu_u_transaction.uf_rollback(w_1106_selec_incid,"GI_OT","NRO_OT=" + string(tab_1.il_nro_ot), fgci_bloqueo_ot, tab_1.il_nro_ot)
	ELSE
		gnu_u_transaction.uf_rollback()
	END IF
	
		
END IF

if tab_1.is_accion_llamada="Consulta" and fw_incidencia_de_operaciones() then 
	if isvalid(gu_operaciones) then 
		gu_rf_servidor_operacion.of_avisar_salida_consulta_incidencia(tab_1.il_nro_incidencia,ls_mensaje)
	end if 
end if

//AHM (09/12/2009)
//JME 05/06/09 Se desbloquean los activos.
//gf_bloquear_activos(tab_1.il_nro_incidencia, FALSE) 

end event

on w_2301_form_incidencia.create
int iCurrent
call super::create
if this.MenuName = "md_ingreso_incidencias" then this.MenuID = create md_ingreso_incidencias
this.d_ambito=create d_ambito
this.dw_brigadas_calendario_rango=create dw_brigadas_calendario_rango
this.uo_barra=create uo_barra
this.tab_1=create tab_1
this.cb_1=create cb_1
this.em_incidencia=create em_incidencia
this.st_1=create st_1
this.cbx_historicos=create cbx_historicos
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_ambito
this.Control[iCurrent+2]=this.dw_brigadas_calendario_rango
this.Control[iCurrent+3]=this.uo_barra
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.em_incidencia
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cbx_historicos
this.Control[iCurrent+9]=this.gb_1
end on

on w_2301_form_incidencia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.d_ambito)
destroy(this.dw_brigadas_calendario_rango)
destroy(this.uo_barra)
destroy(this.tab_1)
destroy(this.cb_1)
destroy(this.em_incidencia)
destroy(this.st_1)
destroy(this.cbx_historicos)
destroy(this.gb_1)
end on

event open;call super::open;////JME 19/06/09
//// Determinar las subestaciones de los activos en SGD_INSTALACION_AT
//n_subestacionesdeactivos lnv_subestacionesactivos
//lnv_subestacionesactivos = create n_subestacionesdeactivos
//DESTROY lnv_subestacionesactivos
////Fin JME
setFocus(em_incidencia)
estamos_historicos=false

st_parametros = Message.PowerObjectParm

This.TriggerEvent("ue_open")

if isValid(st_parametros) then
	bandera = true
else
	bandera = false
end if


if(bandera) then
	numeroIncidencia = st_parametros.l_nro_incidencia
	em_incidencia.text = String(numeroIncidencia)
	if not st_parametros.historico then
		cb_1.triggerevent(Clicked!)
	end if
end if


end event

event timer;call super::timer;choose case i_vez
		case 1
			uo_barra.p_1.picturename="reloj1.bmp"
		case 2
			uo_barra.p_1.picturename="reloj2.bmp"
		case 3
			uo_barra.p_1.picturename="reloj3.bmp"
		case 4
			uo_barra.p_1.picturename="reloj4.bmp"
		case 5
			uo_barra.p_1.picturename="reloj5.bmp"
		case 6
			uo_barra.p_1.picturename="reloj6.bmp"
		case 7
			uo_barra.p_1.picturename="reloj7.bmp"
		case 8
			uo_barra.p_1.picturename="reloj8.bmp"
			i_vez=0
end choose
i_vez ++
end event

event deactivate;call super::deactivate;if isvalid(gu_control_v_incidencias) then gu_control_v_incidencias.of_ventana_activada(handle(this),false)
end event

event ue_postopen;call super::ue_postopen;fnu_resetear_var_comunicaciones()
gu_comunic.is_comunic.programa_retorno = 'iw_2301'
gu_comunic.is_comunic.accion_retorno = 'cancelado'
gnu_u_transaction.uf_rollback()
ib_post_activate  =true	

//close(w_barra)
Close(this)

return


end event

event ue_preclose;call super::ue_preclose;close(this)
return 1
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2301_form_incidencia
end type

type d_ambito from u_cen_2002_pr_form_centro_cmd_mesa_oc within w_2301_form_incidencia
boolean visible = false
integer x = 297
integer y = 1336
integer taborder = 30
end type

type dw_brigadas_calendario_rango from datawindow within w_2301_form_incidencia
boolean visible = false
integer x = 841
integer y = 1572
integer width = 864
integer height = 212
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_brigadas_calendario_rango_fechas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_barra from u_pr_gen_espera_act within w_2301_form_incidencia
boolean visible = false
integer x = 960
integer y = 640
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

on uo_barra.destroy
call u_pr_gen_espera_act::destroy
end on

type tab_1 from u_tab_2301_form_incidencias within w_2301_form_incidencia
integer x = 581
integer y = 32
integer width = 5755
integer height = 2604
integer taborder = 10
boolean bringtotop = true
integer weight = 700
long backcolor = 67108864
end type

event selectionchanging;call super::selectionchanging;call super::selectionchanging;//AHM (13/07/2009) Mejora 1/446555
IF (newIndex = 6) THEN
   fw_cargarObservacionesSeguimiento()
END IF







end event

event selectionchanged;call super::selectionchanged;oldindex=this.SelectedTab

if oldindex=3 or oldindex=5 or oldindex=6 then
	cbx_historicos.enabled=false  //Deshabilito el check para no ocacionar problemas a la hora de ir a historicos
end if

end event

type cb_1 from commandbutton within w_2301_form_incidencia
integer x = 78
integer y = 332
integer width = 416
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;/////////////////////////////////////
//     Fase 4 OT24H             ////
//   TDA   21/12/2018         ////
//      Jeffry Davila              ////
///////////////////////////////////
int existe_nro_incidencia
long ll_codigo,ll_codigo_aco
string ls_nom_instalacion,ls_dir_aviso,ls_fase_afectada
int li_cant_brigadas,li_conta,li_cont2
long ll_fila_primera = 1
long ll_fila
string ls_mensaje
string mensage_ventana
int no_existe_en_ambos=0
int capturar_tension=0
int li_cod_accion_inci_ingreso
long ll_cod_causa_subtipo,ll_nro_incidencia,ll_codigo_ct,ll_codigo_inst
string ls_desc_causa_subtipo

tab_1.is_accion_llamada="Consulta"

if len(em_incidencia.text) = 0 then
	messageBox("Error","Campo Vaci$$HEX2$$f3002000$$ENDHEX$$")
	close(w_msg)
	return 0
elseif  len(em_incidencia.Text) < 5 then
	messageBox("Error","Utilice un numero de Incidencia v$$HEX1$$e100$$ENDHEX$$lido")
	close(w_msg)		
	return 0
else
	
	Select count(*)
	into :existe_nro_incidencia
	from sgd_incidencia 
	where nro_incidencia=:em_incidencia.text
	AND (EST_ACTUAL <> 5 AND EST_ACTUAL <> 11)
	using sqlca;
	
if existe_nro_incidencia<1 then
	mensage_ventana="Incidencia"
end if

   
   if existe_nro_incidencia>0 and cbx_historicos.checked=false then

		openwithparm(w_msg,"Realizando Consulta...")
		tab_1.tabpage_ot.d_datos_ot.visible=true
		
		ii_incidencia_de_op = -1
		
		IF tab_1.SelectedTab <> 1 then
			tab_1.SelectedTab = 1
		END IF
 		fw_inicializar_componentes()	
		fw_limpiar_variables()
		fw_bloquear_dw()

		
//		limpiar_data_window_incidencia(1)	
		tab_1.il_nro_incidencia = long(em_incidencia.text)
		i_hay_datos=iu_inc_2003_nu.fnu_obtener_datos(tab_1.tabpage_formulario.d_inf_general,long(em_incidencia.text))	
		tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
		tab_1.ii_tipo_incid	= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")		
		tab_1.of_iniciar_estados_oper()
		
		tab_1.tabpage_ot.d_lista_brigadas_ot.&
				Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))	

	    		IF	tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
			// Se asigna a la datawindow d_datos_interrup el dataobject adecuado
			// en funcion de si en operaciones se han interrumpido acometidas o CT, y de si
			// se esta o no en la ventana de historicos
			tab_1.of_componer_dw_interrupciones()
		    END IF
			 
			IF i_hay_datos=0 THEN
		

	         ELSE
					
			ll_codigo = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")
			SELECT NVL(nom_instalacion, :ll_codigo) into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_codigo 
			and sgd_instalacion.bdi_job = 0 //DBE 11/01/2000
			;
			
			
			IF SQLCA.SQLCode = 100 THEN
				ls_nom_instalacion = string(ll_codigo)
			END IF
			ls_nom_instalacion = fg_remplaza(ls_nom_instalacion, '"', ' ')	
			tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ls_nom_instalacion
			
			tab_1.of_iniciar_estados_oper()		
			fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.tabpage_formulario.d_inf_general.object.alcance[1]) 

			ii_incidencia_de_op = -1
             IF fw_incidencia_de_operaciones() THEN
                          fw_inst_afectadas_operaciones()
             END IF


			tab_1.tabpage_formulario.d_inf_general.fpr_habilitar_campos(lu_comunic.is_comunic.Accion_llamada) 
			tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")
		 END IF

		    tab_1.il_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia")
			
			//  CARGO DE DROPDOWN CON LOS TIPOS DE INCIDENCIAS,
	         //	 PROGRAMADA INCLUIDA
	        DataWindowChild ldw_child
	        tab_1.tabpage_formulario.d_inf_general.GetChild ('tipo_incidencia', ldw_child)
	        ldw_child.SetTransObject (SQLCA)
	        ldw_child.Retrieve (0) //Con parametro 0 para sacar todos tipos

	        tab_1.ii_estado_mant = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"estado_mantenimiento")
	        gi_est_mant = tab_1.ii_estado_mant
	
	        tab_1.ii_tipo_incid = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")
	        tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"ot")
	        tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
	        tab_1.of_iniciar_estados_oper()
			
			if tab_1.ii_estado_oper > fgci_incidencia_pendiente then
		                    tab_1.tabpage_ot.d_datos_ot.Retrieve( &
				           tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))
	        end if
			  
            IF tab_1.ii_alcance = fgci_incidencia_de_suministro THEN
		
		         ls_dir_aviso =  tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"incidencia_dir_aviso") 
		
		        tab_1.tabpage_formulario.d_inf_general.SetItem(1,"nombre_instalacion",ls_dir_aviso)
		        tab_1.tabpage_formulario.d_inf_general.SetItem(1,"dir_instalacion",ls_dir_aviso)
		        il_aviso_sum = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"primer_aviso")
		
		        // Inicializo la incidencia como incidencia de Suministro.
		        fw_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.ii_alcance) 
		   END IF

            // Se recuperan los datos de todos los tabpages
		   if tab_1.tabpage_ot.d_datos_ot.RowCount() > 0 then
		         if tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2 then
			    tab_1.fnu_cambiar_ot_tipo('CO')
		   else								
			    tab_1.fnu_cambiar_ot_tipo('BR')
		   end if
	       else
		        tab_1.fnu_cambiar_ot_tipo('BR')		
	       end if
	
	       	IF lu_comunic.is_comunic.Accion_llamada<>"Consulta" AND &
		          tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 1 THEN
		           // Se bloquean las brigadas asignadas a la OT que no hayan finalizado su trabajo			
		          IF fw_bloquear_brigadas_asignadas(1) = -1 THEN
			         // No se han podido bloquear las brigadas
			         This.PostEvent('ue_postopen')
			         //this.postevent("ue_preclose")
		           END IF
	         END IF

	tab_1.tabpage_cuadrillas.d_materiales.Retrieve(tab_1.il_nro_incidencia)
	tab_1.tabpage_acciones.d_lista_acciones_incidencia.Retrieve(tab_1.il_nro_incidencia)

	
	    	IF tab_1.tabpage_cuadrillas.d_materiales.rowcount() > 0 THEN
		         gi_con_material_averiado = 1
	    ELSE
		         gi_con_material_averiado = 0
	    END IF
	
	// Valida para ver si solo hay una brigada trabajando para mostrar o no el 
	// boton brigada encargada
	  li_cant_brigadas= tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount()
		
	  if li_cant_brigadas > 1 then
		 for li_conta= 1 to li_cant_brigadas
			 if isnull(tab_1.tabpage_ot.d_lista_brigadas_ot.object.f_hasta[li_conta]) then
				 li_cont2 ++
			 end if
		 next
	  end if
	  
	  if tab_1.tipo_ot = 'BR' and li_cont2>1 then 
		     tab_1.tabpage_ot.bmp_brigada_responsable.visible=true	
	  end if
	
	  IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
		     tab_1.tabpage_interrupciones.dw_afec_parcial_sum.retrieve(tab_1.il_nro_incidencia)
	  END IF
		  
	
	/////////////////   INTERRUPCIONES   ////////////////

	 //	accion llamada distinta de "Alta"
	//	tab_1.tabpage_interrupciones.d_lista_otras_inst.Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),tab_1.il_nro_incidencia) 	
    //  Comentado por Pacho, la Datawindow d_lista_otras_inst solo traera datos cuando tenga marcada una interrupcion
	IF	tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
		// Se asigna a la datawindow d_datos_interrup el dataobject adecuado
		// en funcion de si en operaciones se han interrumpido acometidas o CT, y de si
		// se esta o no en la ventana de historicos
		tab_1.of_componer_dw_interrupciones()

	END IF
		IF fw_incidencia_de_operaciones() THEN
			// La incidencia se ha dado de alta desde operaciones
			IF tab_1.tabpage_interrupciones.dw_lista_acometidas.RowCount() > 0 THEN
				// Si hay acometidas interrumpidas se obtienen los datos de la acometida
				// interrumpida sobre d_datos_interrup
				ll_codigo_aco = tab_1.tabpage_interrupciones.dw_lista_acometidas.GetItemNumber(1,"codigo")
				tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,ll_codigo_aco)
				IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 1 AND gi_tension_nivel_min = fgci_baja_tension THEN
					// Si la acometida ha sido interrumpida mas de una vez se
					// habilitan los botones de avanzar y retroceder para que se puedan
					// consultar todas las acometidas
					tab_1.tabpage_interrupciones.pb_avanzar.visible = True
					tab_1.tabpage_interrupciones.pb_avanzar.enabled = True
					tab_1.tabpage_interrupciones.pb_anterior.visible = True
					tab_1.tabpage_interrupciones.pb_anterior.enabled = False
				ELSE
					tab_1.tabpage_interrupciones.pb_avanzar.visible = False
					tab_1.tabpage_interrupciones.pb_anterior.visible = False
				END IF
				IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 THEN //AND gi_tension_nivel_min = fgci_baja_tension THEN
					ls_fase_afectada = tab_1.tabpage_interrupciones.d_datos_interrup.GetItemString(1, 'sgd_valor_descripcion')
					tab_1.of_mostrar_fases_int(ll_fila_primera, ls_fase_afectada)
				END IF
			END IF
			
		ELSE
			// La incidencia con perdida se ha dado de alta desde el OpenSgi.
			// Se obtienen sobre d_datos_interrup todos los datos de todas las interrupciones
			tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,0)
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Retrieve(tab_1.il_nro_incidencia, fgci_tipo_ct, &
													fgci_tipo_subestacion_at,fgci_tipo_salida_at, fgci_tipo_subestacion, &
													fgci_tipo_salida_mt,fgci_tipo_ct,fgci_tipo_transformador,fgci_tipo_salida_de_baja)
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Setsort("c_icono_num D")
			tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.sort()
			IF NOT fw_incidencia_de_operaciones() THEN
				IF lu_comunic.is_comunic.accion_llamada <> "Consulta" THEN
					IF tab_1.of_bloquea_interrupciones() = -1 THEN
						ib_post_activate = True
						this.postevent("ue_preclose")
					END IF
				END IF
			END IF
	
			// Inserto en la dw_interrup_ant las interrupciones existentes al momento de abrir

		
			//	Inserto en el arbol las interrupciones existentes
			tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),0,2)
			tab_1.tabpage_interrupciones.tv_1.fw_buscar_interrupciones(tab_1.il_nro_incidencia)	
		END IF
		
//	END IF
				
	tab_1.l_si_valido=0
  
    	tab_1.tabpage_formulario.d_inf_general.Modify("f_deteccion.background.color = " + gs_gris)
	tab_1.tabpage_observaciones.mle_observaciones.displayonly = True
	tab_1.tabpage_observaciones.mle_observaciones.pointer = "Arrow!"
		
   // Carga las datawindows de seguimiento con los estado existentes
   // El 1 es porque desde el open de la ventana no se si resuelve mant, le paso 1 por 
   // defecto y en el selectionchanged del tabpage lo evaluo
   iu_ema_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_mantenimientos,0)
   tab_1.fnu_obte_estados_mant()	
	
   IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
	  tab_1.idt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_enviado_brigada,"f_alta")
   END IF
	
// Si estoy dando de alta una incidencia sobre una instalacion 
// que ya tiene una OT asignada, seteo los estados en operaciones
// Esto se debe hacer aqui porque ya cargue la dw de seguimiento
	
//IF lu_comunic.is_comunic.accion_llamada = "Alta" or &
//		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion" or &
//		lu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro" THEN
// 		lw_barra.uo_barra.barra.f_amplia(57)
//	IF lu_comunic.is_comunic.longval4 > 0 THEN
//		ldt_f_detec = tab_1.tabpage_formulario.d_inf_general.GetItemDateTime(1,"f_deteccion")
//		
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_pendiente,"f_alta",ldt_f_detec)
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_pendiente,"nomenclatura","PT")
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_pendiente,"est_oper",1)
//		
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(tab_1.ii_incidencia_enviado_brigada,"f_alta",ldt_fecha_brigada_mas_vieja)
//		
//	END IF
//
//	lw_barra.uo_barra.barra.f_amplia(59)
//
//	// Actualizo variables globales
//	gi_resuelve_mant = 0
//	gi_est_mant = 0
//	gi_est_oper = tab_1.ii_estado_oper
//	
//END IF	
	
// Cargo las fechas de los estados 
tab_1.idt_fec_deteccion = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_pendiente,"f_alta")

// En el caso de que ii_incidencia_enviado_brigada = 0, es que se trata de una incidencia
// procedente de SCADA sin tener estado EB. Si no hay estado EB no se obtiene la fecha
IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
	tab_1.idt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_enviado_brigada,"f_alta")
END IF

// Si la incidencia es imprevista sin perdidas y se ha dado de alta desde operaciones se
// hace invisible el tabpage de interrupciones. En el caso de que la incidencia se haya 
// dado de alta desde el OpenSgi, no se hace invisible para permitir que la incidencia
// pueda convertirse en una incidencia imprevista con perdida
IF tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
	
	IF fw_incidencia_de_operaciones() THEN
		tab_1.tabpage_interrupciones.visible = False
	ELSE
		tab_1.tabpage_interrupciones.tv_1.of_carga_elemento(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins"),0,2)
	END IF
	
// Para el resto de las incidencias sin perdidas se hace el tabpage invisible
ELSEIF tab_1.ii_alcance = fgci_incidencia_de_suministro or tab_1.ii_tipo_incid = fgci_incidencia_calidad &
	or (tab_1.ii_alcance = fgci_incidencia_sin_interrupcion AND tab_1.ii_tipo_incid <> fgci_incidencia_imprevista &
		 AND tab_1.ii_tipo_incid <> fgci_incidencia_programada) THEN

	// Deshabilito la opcion de marcar interrupciones
	tab_1.tabpage_interrupciones.visible = False

END IF	
	
	if tab_1.ii_alcance=fgci_incidencia_con_interrupcion then // si es incidencia con perdida
	tab_1.idt_fecha_er = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_en_reposicion,"f_alta")
	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
    else
          SetNull(tab_1.idt_fecha_er)
   end if
	
	IF lu_comunic.is_comunic.Accion_llamada = "Alta_nivel_suministro" OR &
		lu_comunic.is_comunic.Accion_llamada = "Alta_nivel_instalacion"THEN
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetItem(1,"f_alta",lu_comunic.is_comunic.datval1)

	END IF
	
// Cargo fechas de estados mantenimiento
tab_1.idec_nro_instalacion_afectada = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins")

IF tab_1.tabpage_acciones.mle_observacion_accion_incidencia.Text = '' OR &
	IsNull(tab_1.tabpage_acciones.mle_observacion_accion_incidencia.Text) THEN
	tab_1.frn_habilitar_obs_accion(False)
END IF

// Solo para eliminar el problema de que aparece el formulario en blanco
tab_1.tabpage_formulario.d_inf_general.SetRedraw(True)

tab_1.tabpage_observaciones.mle_observaciones.Text = tab_1.f_devolver_observaciones(tab_1.tabpage_formulario.d_inf_general)	
tab_1.tabpage_observaciones.mle_observaciones_mnto.Text = tab_1.f_devolver_observaciones_mnto(tab_1.tabpage_formulario.d_inf_general)	

if tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada &
	and NOT isnull(tab_1.tabpage_formulario.d_inf_general.object.st_causa.text) &
	and tab_1.tabpage_formulario.d_inf_general.object.st_causa.text <> "" &
	and lu_comunic.is_comunic.Accion_llamada<> "Consulta" then
	
	//tab_1.tabpage_formulario.st_2.visible = true
end if

///////////////////////////////////////////////////////////////////////////////////
//Solo muestro el TAB de Maniobras cuando exista alguna y este OPERACION integrado

if fw_incidencia_de_operaciones() then
	if tab_1.ii_alcance = fgci_incidencia_con_interrupcion then
		tab_1.tabpage_maniobras.visible = true
	END IF
	
	// solo muestro tabpage de indisponibilidades en el caso de que la incidencia sea de operacion, de alta y el parametro este on
	if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension") = fgci_alta_tension and &	
	fg_verifica_parametro("Indisponibilidades activas") = true then
		gu_comunic1.is_comunic.intval9=0
		
		if lu_comunic.is_comunic.Accion_llamada="Consulta" then
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 1
		else
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 0
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = true
		end if
	end if

	if fg_verifica_parametro("Indisponibilidades activas") = true then
		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_causa_nuevo'
		datawindowchild ldwchild_causa
		tab_1.tabpage_maniobras.dw_maniobras.GetChild('cod_causa', ldwchild_causa)
		ldwchild_causa.SetTransObject(SQLCA)
		ldwchild_causa.Retrieve()
	else
		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_nuevo'
	end if

	fw_maniobras(tab_1.il_nro_incidencia)									//Se modifica la sql del dw de maniobras para que aparezcan las maniobras que correspondan en cada pais

    if tab_1.ii_estado_oper > fgci_incidencia_pendiente then
		tab_1.tabpage_ot.d_datos_ot.Retrieve( &
				tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))
    end if
	 
	tab_1.tabpage_maniobras.enabled = true
end if

/////////////////////////////////////////////////

	if	fg_verifica_parametro("Indisponibilidades activas") = true then
		gu_comunic1.is_comunic.intval9=0

		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.InsertRow(0)
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.settransobject(sqlca)
		
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.InsertRow(0)
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.settransobject(sqlca)
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
	
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.settransobject(sqlca)
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades_batch.retrieve(tab_1.il_nro_incidencia)

		tab_1.tabpage_indisponibilidades.visible = true
		if lu_comunic.is_comunic.Accion_llamada = "Alta" then// GNU 6-10-2006
			tab_1.tabpage_indisponibilidades.enabled = false
		else
		SELECT tipo_instalacion into :ii_tipo_instalacion from sgd_instalacion where nro_instalacion = :tab_1.idec_nro_instalacion_afectada;
  		 if tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,'tip_tension')=fgci_alta_tension or &
			 ii_tipo_instalacion= fgci_tipo_subestacion or &
			 ii_tipo_instalacion= fgci_tipo_salida_mt then
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
			tab_1.of_cargar_indisponibilidad(tab_1.idec_nro_instalacion_afectada)
			
			ll_fila= tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.find("nro_incidencia= " + string(tab_1.il_nro_incidencia) + " and nro_instalacion = " + string (tab_1.idec_nro_instalacion_afectada), 1, tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.RowCount())
			if ll_fila >0 then
				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.SetRow(ll_fila)
				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.ScrollToRow(ll_fila)
				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
			else
				tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
			end if
			else
			tab_1.tabpage_indisponibilidades.enabled = false	
		  END IF
		  
		  SELECT ENR
		  INTO :tab_1.il_ENR
		  FROM SGD_INCIDENCIA
		  WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
		  using sqlca;
		  
		  IF sqlca.sqlcode<0 THEN
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se ha podido obtener datos de SGD_INCIDENCIA")
		  ELSE
			tab_1.tabpage_indisponibilidades.em_1.text= string(tab_1.il_ENR)
		  END IF
		end if
		long ll_res
		ll_res=tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTabOrder("tip_interrupcion",0)
		if lu_comunic.is_comunic.Accion_llamada="Consulta" then
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 1
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = false
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.enabled=false
		else
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.tip_interrupcion.protect = 0
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.object.cb_fechas.visible = true
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
		end if
end if

///////////////////////////////////////////////////////////////
  
 iu_inc_2005_nu.fnu_cargo_det_interr(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  

if tab_1.f_inserta_datos_brig() = false then
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=0")
else
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=1")
end if

if gb_mantenimiento = true & 
	and tab_1.ii_tipo_incid <> fgci_incidencia_programada &
	and tab_1.ii_alcance <> fgci_incidencia_de_suministro Then

	tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible = true
	tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = true
end if

tab_1.f_deshab_tabs(true)

IF tab_1.ii_estado_oper = fgci_estado_anulado THEN
	lu_comunic.is_comunic.Accion_llamada="Consulta"
	tab_1.is_accion_llamada = "Consulta"
END IF

////////////////////////////////////////////////////

	tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("desc.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("desc.Edit.DisplayOnly=yes")
	tab_1.tabpage_formulario.d_inf_general.modify("desc.protect=0")
	tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.background.color="+gs_gris)

	tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.protect=1")
	tab_1.tabpage_formulario.st_1.visible= false
	tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.protect=1")
	tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.background.color="+gs_gris)
	tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.protect=1")
	tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.background.color="+gs_gris)
// Modificado por Sgo. Unificacion.
//	tab_1.tabpage_observaciones.mle_observaciones.backcolor = rgb(192,192,192)
	tab_1.tabpage_observaciones.mle_observaciones.backcolor = long(gs_gris)
// Fin. Sgo.
	tab_1.tabpage_observaciones.mle_observaciones.textcolor = rgb(0,0,255)
	tab_1.tabpage_ot.rb_1.enabled = FALSE
	tab_1.tabpage_ot.rb_2.enabled = FALSE
	tab_1.tabpage_ot.tab_lista_brigadas.enabled = false
	tab_1.tabpage_ot.dw_lista_contratas.enabled = false
	tab_1.tabpage_ot.dw_ambito.visible=false
	tab_1.tabpage_acciones.mle_observacion_accion_incidencia.DisplayOnly = True
	tab_1.tabpage_acciones.mle_observacion_accion_incidencia.BackColor = long(gs_gris)

////////////////////////////////////////////////////

    IF lu_comunic.is_comunic.accion_llamada <> "Consulta" & 
	AND tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada AND tab_1.ii_estado_oper <= fgci_incidencia_en_reposicion  then

	        IF tab_1.tabpage_ot.d_lista_brigadas_ot.Find("isnull(f_hasta)", 1, tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount()) <= 0 and tab_1.ib_ind_scada=false THEN
		            //w_operaciones.setfocus()
				   w_genapp_frame.setfocus()
		            gnv_msg.f_mensaje("AI104","","",ok!)
	        END IF
			  
     END IF

////////////////////////////////////////////////

IF lu_comunic.is_comunic.Accion_llamada="Consulta" AND fg_verifica_parametro('nuevos_tip_inc') then
   tab_1.tabpage_formulario.d_inf_general.modify("sgd_incidencia_ind_obligada.protect=1")
end if

fw_open_ext()

//IF fw_incidencia_de_operaciones() THEN	
//	il_sesion_operacion =  gu_rf_servidor_operacion.of_devuelve_sesion() 
//	if tab_1.is_accion_llamada="Consulta" then 
//			if gu_rf_servidor_operacion.of_avisar_consulta_incidencia(tab_1.il_nro_incidencia,ls_mensaje) = 0 then 
//			 //w_operaciones.setfocus()
//			 w_genapp_frame.setfocus()
//			 messagebox("Atencion","No se puede refrescar la incidencia debido al siguiente error:"+ char(10)+char(13)+ls_mensaje)
//			end if
//	end if
//end if

//////////////////////////////////////////////////////////

int			li_nroOt					//N$$HEX1$$fa00$$ENDHEX$$mero de la OT
string		ls_estado				//Estado Wireless del aviso 

//AHM (19/12/2007)
IF gi_pais = 6 THEN					//Comprobamos que est$$HEX2$$e1002000$$ENDHEX$$en EPSA
	IF tab_1.tabpage_ot.d_datos_ot.rowCount() > 0 THEN			//Comprobamos que hay OT
		li_nroOt = tab_1.tabpage_ot.d_datos_ot.getItemNumber(1, "nro_ot")
		
		SELECT gi_avisos.est_wireless
		INTO	 :ls_estado
		FROM	 gi_avisos, gi_ot
		WHERE	 gi_avisos.nro_aviso = gi_ot.nro_aviso AND
				 gi_ot.nro_ot = (SELECT ot
				 					  FROM sgd_incidencia
									  WHERE nro_incidencia = :tab_1.il_nro_incidencia);
									  

		IF ls_estado = 'A' OR ls_estado = 'S' THEN			//El estado wireless del aviso es aceptado o resuelto
			tab_1.tabpage_formulario.d_inf_general.enabled = FALSE
			tab_1.tabpage_observaciones.mle_observaciones.enabled = FALSE
			tab_1.tabpage_ot.dw_ambito.enabled = FALSE
			tab_1.tabpage_ot.d_crit_seleccion.enabled = FALSE
			tab_1.tabpage_ot.rb_1.enabled = FALSE
			tab_1.tabpage_ot.rb_2.enabled = FALSE
			tab_1.tabpage_ot.d_lista_brigadas_ot.enabled = FALSE
			tab_1.tabpage_ot.d_datos_ot.enabled = FALSE
			tab_1.tabpage_ot.dw_lista_contratas.enabled = FALSE
			tab_1.tabpage_cuadrillas.d_materiales.enabled = FALSE
			tab_1.tabpage_interrupciones.tv_1.enabled = FALSE
			tab_1.tabpage_interrupciones.d_lista_otras_inst.enabled = FALSE
			tab_1.tabpage_interrupciones.d_datos_interrup.enabled = FALSE
			tab_1.tabpage_seguimiento.d_seguimiento_operaciones.enabled = FALSE
			tab_1.tabpage_acciones.d_lista_acciones.enabled = FALSE
			tab_1.tabpage_otros.dw_otros.enabled = FALSE
			tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.enabled = FALSE
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.enabled = FALSE
			tab_1.tabpage_indisponibilidades.em_1.enabled = FALSE
			tab_1.tabpage_indisponibilidades.tv_2.enabled = FALSE
		END IF
		
	END IF
END IF

     //////////////////////////////////////////////////////
	//NCA-INICIO.DDAG-1783.20150312. Hago el retreieve del datawindows child filtrando solamente los activos.
	DataWindowChild ldw_child_cod_accion
	tab_1.tabpage_formulario.d_inf_general.GetChild ('cod_accion_inc', ldw_child_cod_accion)
	ldw_child_cod_accion.SetTransObject (SQLCA)
	ldw_child_cod_accion.Retrieve () 
	ldw_child_cod_accion.SetFilter("activo = 1")
	ldw_child_cod_accion.Filter()
	
	//NCA-INICIO.DDAG-1783.20150304.En la ventana de ingreso de incidencias como es un nuevo registro es null
    //si encuentra que el registro es null que asigne (cero) que corresponde a la descripci$$HEX1$$f300$$ENDHEX$$n "No Asignada".
     li_cod_accion_inci_ingreso = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'cod_accion_inc')

     IF IsNull(li_cod_accion_inci_ingreso) THEN	
	       tab_1.tabpage_formulario.d_inf_general.SetItem(1, 'cod_accion_inc',0)	
     END IF
     //NCA-FIN.DDAG-1783.20150304.

    //VMC.INI.DDAG-6453.14/07/2016
    ll_cod_causa_subtipo = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, 'causa_subtipo')
    select descripcion into :ls_desc_causa_subtipo from gi_causa_subtipo where cod_causa_subtipo = :ll_cod_causa_subtipo;
    tab_1.tabpage_formulario.d_inf_general.object.st_causa_subtipo.text = ls_desc_causa_subtipo

    Datawindowchild dddwo, dddwf

    tab_1.tabpage_formulario.d_inf_general.GetChild("lista_elem_operador",dddwo)
    dddwo.SetTransObject(SQLCA)
    dddwo.retrieve()

    tab_1.tabpage_formulario.d_inf_general.GetChild("lista_elem_fallado",dddwf)
    dddwf.SetTransObject(SQLCA)
    dddwf.retrieve()
	 
	///////////////////////////////////////////
	
	tab_1.tabpage_formulario.st_18.visible= false
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.background.color="+gs_gris)
	
	//TDA-EDM1-27-04-2017
	tab_1.tabpage_formulario.d_inf_general.modify("rep_red.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("rep_red.protect=1")
	tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.background.color="+gs_gris)
	tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.protect=1")
	//END-TDA-EDM1-27-04-2017
     tab_1.tabpage_ot.tab_lista_brigadas.visible=false
	   
	  
	 Select tip_tension
	 into :capturar_tension
	 from sgd_incidencia 
	 where nro_incidencia=:em_incidencia.text
	 using sqlca;
	 
	 if capturar_tension=2 then
		 tab_1.tabpage_maniobras.visible=true
		 
		 if fg_verifica_parametro("Indisponibilidades activas") = true then
		       tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_causa_nuevo'
		       tab_1.tabpage_maniobras.dw_maniobras.GetChild('cod_causa', ldwchild_causa)
		       ldwchild_causa.SetTransObject(SQLCA)
		       ldwchild_causa.Retrieve()
	     else
		       tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_nuevo'
	     end if
		 
		 fw_maniobras(tab_1.il_nro_incidencia)
	else
		 tab_1.tabpage_maniobras.visible=false
	end if
	

	
//	tab_1.tabpage_interrupciones.tv_1.visible = FALSE
//    //mostrar_datawindow(1)
//fw_comp_inst_int()
//    tab_1.tabpage_interrupciones.st_datos_interrup.text=" Datos de la Interrupci$$HEX1$$f300$$ENDHEX$$n."
//    tab_1.tabpage_interrupciones.dw_lista_int_operaciones.visible = true
//    tab_1.tabpage_interrupciones.st_lista_int_operaciones.visible = true
//    tab_1.tabpage_interrupciones.dw_lista_int_operaciones.SetTransObject(SQLCA)
//    ll_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,'nro_incidencia')
//    tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Retrieve(ll_nro_incidencia)
//	
//     tab_1.tabpage_ot.dw_lista_contratas.visible=false
//     tab_1.tabpage_interrupciones.d_datos_interrup.visible=true
//     tab_1.tabpage_interrupciones.d_datos_interrup.SetTransObject(SQLCA)
//     tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia)

	IF tab_1.tabpage_interrupciones.dw_lista_int_operaciones.RowCount() > 0 THEN
			tab_1.tabpage_interrupciones.st_datos_interrup.visible = true
	END IF
	
	String ll_instalacion,ldt_f_actual
	
//    ll_instalacion = this.GetItemNumber(currentrow,'nro_instalacion')
//	ldt_f_actual = this.GetItemDatetime(currentrow,'f_actual')
//	ll_fila = tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_instalacion = " + string(ll_instalacion) + " and f_actual = datetime('" + string(ldt_f_actual) + "')" &
//																					,1,tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
//	
	
    //IF ll_fila > 0 THEN
		//tab_1.of_mostrar_fases_int(ll_fila, this.GetItemString(currentrow,'fase_afectada'))
		//IF NOT gb_red_trifasica THEN
		//tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(1, 'fase_seleccionada', 1)
		//END IF
		
	    tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.background.color = gs_gris
		
		tab_1.tabpage_interrupciones.d_datos_interrup.SetRow(ll_fila)
		tab_1.tabpage_interrupciones.d_datos_interrup.scrolltorow(ll_fila)
		tab_1.tabpage_interrupciones.d_datos_interrup.SetRedraw(TRUE)
		
         tab_1.tabpage_interrupciones.d_datos_interrup.object.fase_seleccionada.visible=true
			
		//tab_1.tabpage_interrupciones.dw_lista_acometidas.visible = false
			
   //  END IF

	consulta_hecha=true


     close(w_msg)
	 
	  
//elseif existe_nro_incidencia_hist>0 and cbx_historicos.checked=true then
//		estamos_historicos=true
else
	int revisa_historico
	Select count(*)
	into :revisa_historico
	from (
		select nro_incidencia
		from sgd_incidencia
		where nro_incidencia=:em_incidencia.text
			AND est_actual in( 5, 11)
		union all
		select nro_incidencia
		from gi_hist_incidencias
		where  nro_incidencia=:em_incidencia.text
	)
	using sqlca;
	
	if revisa_historico > 0 then
		Messagebox("Atencion","La Incidencia est$$HEX2$$e1002000$$ENDHEX$$en Historico",StopSign!)
	else
		Messagebox("Atencion","Nro Incidencia no Existe",StopSign!)
	end if
end if
end if
	 







end event

type em_incidencia from editmask within w_2301_form_incidencia
event click_enter pbm_keydown
event pegar pbm_paste
integer x = 14
integer y = 208
integer width = 553
integer height = 104
integer taborder = 33
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "##########"
end type

event click_enter;if estamos_historicos=false then
IF KeyDown(KeyEnter!)=true then
           cb_1.postevent('clicked')
end if


IF consulta_hecha=true THEN
    IF KeyDown(KeyBack!)=true then
	     if len(this.text)=1 then
			 limpiar_data_window_incidencia(1)
		 end if
    end if
END IF
end if
end event

type st_1 from statictext within w_2301_form_incidencia
integer x = 14
integer y = 140
integer width = 553
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217748
long backcolor = 128
string text = "Nro Incidencia"
boolean focusrectangle = false
end type

type cbx_historicos from checkbox within w_2301_form_incidencia
boolean visible = false
integer x = 110
integer y = 460
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historicos"
end type

event clicked;if this.checked=true then

messagebox("Atencion","Ahora la busqueda se realizara en Historicos Incidencias")

OpenSheet (w_2301_hist_form_incidencia, w_genapp_frame, menu, layered!)	
this.checked=false

elseif this.checked=false then
	
messagebox("Atencion","Ahora la busqueda se realizara en Incidencias")

end if





end event

type gb_1 from groupbox within w_2301_form_incidencia
integer y = 12
integer width = 585
integer height = 544
integer taborder = 12
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 67108864
string text = "Buscar Incidencia"
borderstyle borderstyle = styleraised!
end type


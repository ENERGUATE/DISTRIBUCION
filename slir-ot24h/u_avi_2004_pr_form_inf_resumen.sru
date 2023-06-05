HA$PBExportHeader$u_avi_2004_pr_form_inf_resumen.sru
$PBExportComments$No borrar, cambiar para SGI
forward
global type u_avi_2004_pr_form_inf_resumen from u_avi_1001_pr_generico
end type
end forward

global type u_avi_2004_pr_form_inf_resumen from u_avi_1001_pr_generico
integer width = 3543
integer height = 828
string dataobject = "d_avi_2004_pr_form_inf_resumen"
event type integer ue_finalizaraviso ( )
end type
global u_avi_2004_pr_form_inf_resumen u_avi_2004_pr_form_inf_resumen

type variables
datawindowchild		idwch_tipo_avi 
string is_sql_statement


//AHM (12/01/2010) Incidencia 0/100157617
long il_nroAviso  //N$$HEX1$$fa00$$ENDHEX$$mero de aviso que se quiere finalizar
end variables

forward prototypes
public function integer fpr_limpiar_campos ()
public function integer fpr_llenar_campos (ref s_avisos pstr_avisos)
public function integer fpr_habilitar_campos (boolean pb_telefono, boolean pb_esquina, boolean pb_alcance_aviso, boolean pb_tipo_aviso, boolean pb_observacion_tel, boolean pb_nro_aviso, boolean pb_nro_llamadas)
public function integer fpr_o_inc_nis (ref datawindow pd_dw, long pl_nro_nis)
public function integer fpr_insertar_incidencia (long pl_nro_inc, ref datawindow pd_dw)
public function integer fpr_c_cgv_y_cods (ref s_direccion_cliente pstr_dir_cli)
public function character fpr_v_interrup_total (long pl_nro_incid)
public function integer fpr_o_indice_de_peligro (integer pi_tip_aviso)
public function integer fpr_v_importante (long pl_nis)
public function long fpr_v_os (long pl_nis)
public function datawindowchild fpr_conectar (ref datawindow pdw_inf_resumen)
public function integer fpr_o_incid (ref datawindow pd_dw, long pl_nro_nis, ref datawindow p_interrupciones, string ps_select_original)
public function integer fpr_busco_localidad (long pl_nis)
public function integer fpr_act_avi_por_fin_ot (long pl_nro_avi, long pl_avis_nro_ins, integer pi_cli_imp_lista, integer pi_ind_pel_lista)
public function long fpr_o_nro_aviso ()
public function integer fpr_c_estructura_avisos (s_direccion_cliente psrt_dir_cli, long pl_nro_aviso, ref datawindow pdw_inf_resumen)
public function integer fpr_o_centro_cmd_mesa (ref integer pi_centro, ref integer pi_cmd, ref integer pi_mesa, long pl_cod_loc)
public function long fpr_o_inf_comple_sum (ref long pl_ord_servicio, ref long pl_nro_incid, long pl_nis, ref boolean pb_incidencia_pos, string ps_nombre)
public function long fpr_v_aviso_pendiente (ref long pl_ex_avi_pend, long pl_nis)
public function long fpr_v_aviso_pendiente (ref long pl_ex_avi_pend, long pl_nis, boolean pb_ind_calidad, ref long pl_nro_incidencia, ref integer pi_est_aviso)
public function integer fpr_v_aviso_ayuda (ref datawindow pdw_cli, ref datawindow pdw_dir, ref datawindow pdw_avi, multilineedit psle_esq, singlelineedit psle_tel, long pl_nro_aviso, integer pi_clase_avi)
public function integer fuo_avisossuministros (long pl_tiempo, long pl_nis, string ps_nombre, ref long pl_nroincidencia, ref boolean pb_incidenciapos)
public function integer uf_finalizaraviso (long pl_nroaviso)
public function integer fpr_avisos_instalacion (integer pi_clase_aviso)
public function integer fpr_g_aviso (integer pi_clase_aviso)
public function integer fpr_g_aviso ()
public function integer fpr_g_causa_ot24h (string tipo)
public function integer fpr_g_causa_ot24hdes ()
public function any fpr_aviso_gestion_ot24h (long l_nis_rad_param)
public function string f_truncar (string cadena, integer tamano)
end prototypes

event type integer ue_finalizaraviso();/**********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n: Finalizaci$$HEX1$$f300$$ENDHEX$$n del aviso															 */
/* Par$$HEX1$$e100$$ENDHEX$$metros : -																						 */
/* Devuelve   : -1 Error																			 */
/*               0 Correcto																		 */
/*            Autor 					Fecha					Acci$$HEX1$$f300$$ENDHEX$$n					 		 	 */
/*            AHM               12/01/2010   Creaci$$HEX1$$f300$$ENDHEX$$n (Incidencia 0/100157617)	 */
/**********************************************************************************/
int li_cant_avisos,li_aviso_res
long ldec_nro_instalacion
long	ll_nroOt						//N$$HEX1$$fa00$$ENDHEX$$mero de ot
datetime ldt_fecha

li_aviso_res=fgci_aviso_resuelto
ldt_fecha=fgnu_fecha_actual()

UPDATE "GI_AVISOS"  
  SET "USUARIO" = :gs_usuario,   
	     "F_ACTUAL" = :ldt_fecha,
		"PROGRAMA" = 'FIN_OT',
		"EST_AVISO" = :li_aviso_res,
		"FECHA_RES" = :ldt_fecha,
		"HORA_RES" = :ldt_fecha
  WHERE "GI_AVISOS"."NRO_AVISO" = :il_nroAviso ;

IF SQLCA.SQLCODE = -1 THEN	
	gnv_msg.f_mensaje("EA24","","",OK!)
	//messagebox ("Aviso","No se pudieron actualizar las tablas")
	RETURN -1
END IF
				  	
DELETE FROM "GI_AVISOS_INSTALACION"  
WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :il_nroAviso;

IF SQLCA.SQLCODE = -1 THEN	
	gnv_msg.f_mensaje("EA24","","",OK!)
	//messagebox ("Aviso","No se pudieron actualizar las tablas")
	RETURN -1
END IF

//AHM (17/02/2010) Incidencia 0/100169930
SELECT nro_ot
INTO   :ll_nroOt
FROM   gi_avisos
WHERE  nro_aviso =:il_nroAviso;
//INI.SEV. 20/03/2013. DEO13-00000203
IF ll_nroOt = 0 THEN
	messagebox("","Atencion, N$$HEX1$$fa00$$ENDHEX$$mero de OT = 0")
END IF
//   messagebox("","Numero OT: "+STRING(ll_nroOt))
IF ll_nroOt <> 0 OR fg_verifica_parametro("update_masivo_gi_avisos") THEN

UPDATE "GI_AVISOS"  
  SET "USUARIO" = :gs_usuario,   
	     "F_ACTUAL" = :ldt_fecha,
		"PROGRAMA" = 'FIN_OT',
		"EST_AVISO" = :li_aviso_res,
		"FECHA_RES" = :ldt_fecha,
		"HORA_RES" = :ldt_fecha
  WHERE "GI_AVISOS"."NRO_OT" = :ll_nroOt;

IF SQLCA.SQLCODE = -1 THEN	
	gnv_msg.f_mensaje("EA24","","",OK!)
	//messagebox ("Aviso","No se pudieron actualizar las tablas")
	RETURN -1
END IF
				  	
DELETE FROM "GI_AVISOS_INSTALACION"  
WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" IN (SELECT nro_aviso
															 FROM gi_avisos
															 WHERE nro_ot = :ll_nroOt);

IF SQLCA.SQLCODE = -1 THEN	
	gnv_msg.f_mensaje("EA24","","",OK!)
	//messagebox ("Aviso","No se pudieron actualizar las tablas")
	RETURN -1
END IF

END IF
//FIN.SEV. 20/03/2013. DEO13-00000203
IF NOT SQLCA.SQLCODE < 0 THEN
	//COMMIT;  
	gnu_u_transaction.uf_commit()
ELSE  
   RETURN -1
END IF

RETURN 1
end event

public function integer fpr_limpiar_campos ();/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fpr_limpiar_campos
// 
// Objetivo: Resetea la datawindow de informaci$$HEX1$$f300$$ENDHEX$$n de resumen de aviso.
//	 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int 		li_fila
long 		ll_nulo
string	ls_nulo
datetime ldt_nulo

li_fila = This.GetRow()
SetNull(ll_nulo)
SetNull(ls_nulo)
setnull(ldt_nulo)

IF li_fila > 0 THEN
	IF Len(Trim(String(This.GetItemNumber(li_fila,"co_alcance")))) > 0 THEN
		This.SetItem(li_fila,"co_alcance",ll_nulo)
	ELSE
		This.SetItem(li_fila,"co_alcance",ls_nulo)
	END IF
	IF Len(Trim(String(This.GetItemNumber(li_fila,"tip_aviso")))) > 0 THEN
		This.SetItem(li_fila,"tip_aviso",ll_nulo)
	ELSE
		This.SetItem(li_fila,"tip_aviso",ls_nulo)
	END IF

	This.SetItem(li_fila,"obs_telegestiones",ls_nulo)
	This.SetItem(1,"nro_aviso",ll_nulo)
	This.SetItem(1,"nro_llamadas",ll_nulo)
	This.SetItem(1,"fecha_problema",ldt_nulo)
	This.AcceptText()

END IF

RETURN 1

end function

public function integer fpr_llenar_campos (ref s_avisos pstr_avisos);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fpr_llenar_campos
// 
// Objetivo: Setea campos en la datawindow.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pstr_avisos
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


SetRedraw(false)

This.SetItem(This.GetRow(),"co_alcance",pstr_avisos.gi_co_alcance)
This.SetItem(This.GetRow(),"tip_aviso",pstr_avisos.gi_tip_aviso)
This.SetItem(This.GetRow(),"obs_telegestiones",pstr_avisos.gs_obs_telegestiones)
This.SetItem(This.GetRow(),"fecha_problema",pstr_avisos.gdt_f_problema)

SetRedraw(true)

RETURN 1
end function

public function integer fpr_habilitar_campos (boolean pb_telefono, boolean pb_esquina, boolean pb_alcance_aviso, boolean pb_tipo_aviso, boolean pb_observacion_tel, boolean pb_nro_aviso, boolean pb_nro_llamadas);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos del resto de la informaci$$HEX1$$f300$$ENDHEX$$n de avisos  en funci$$HEX1$$f300$$ENDHEX$$n del
// valor de los par$$HEX1$$e100$$ENDHEX$$metros que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//	en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: pb_esquina (boolean que habilita la esquina)
//          pb_telefono(boolean que habilita el telefono)
//				pb_observacion_tel (boolean que habilita las observaciones del telefonista)
//				pb_tipo_aviso(boolean que habilita el tipo de avisos)
//				Pb_alcance (boolean que habilita el alcance del aviso)
//

//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	19/12/95		AQ	       	Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
	IF pb_telefono THEN

       this.Modify("tfno_cli.background.color=" + gs_blanco)
       this.SetTabOrder("tfno_cli",60)
   ELSE
	    this.Modify("tfno_cli.background.color=" + gs_gris)
       this.SetTabOrder("tfno_cli",0)

   END IF

   IF pb_esquina THEN

       this.Modify("esquina.background.color=" + gs_blanco)
       this.SetTabOrder("esquina",40)
   ELSE
	    this.Modify("esquina.background.color=" + gs_gris)
       this.SetTabOrder("esquina",0)

   END IF

   IF pb_alcance_aviso THEN

       this.Modify("co_alcance.background.color=" + gs_blanco)
       this.SetTabOrder("co_alcance",410)
   ELSE
	    this.Modify("co_alcance.background.color=" + gs_gris)
       this.SetTabOrder("co_alcance",0)
   END IF



   IF pb_tipo_aviso THEN

       this.Modify("tip_aviso.background.color=" + gs_blanco)
       this.SetTabOrder("tip_aviso",420)
   ELSE
	    this.Modify("tip_aviso.background.color=" + gs_gris)
       this.SetTabOrder("tip_aviso",0)

   END IF

   IF pb_observacion_tel THEN

       this.Modify("obs_telegestiones.background.color=" + gs_blanco)
       this.SetTabOrder("obs_telegestiones",430)
		 This.Modify("obs_telegestiones.Edit.DisplayOnly = no")
		 
		 this.Modify("fecha_problema.background.color=" + gs_blanco)
       this.SetTabOrder("fecha_problema",445)
	ELSE
	    this.Modify("obs_telegestiones.background.color=" + gs_gris)
		 This.Modify("obs_telegestiones.Edit.DisplayOnly = yes")
	   this.Modify("fecha_problema.background.color=" + gs_gris)
       this.SetTabOrder("fecha_problema",0)
				 
   END IF
	
	IF pb_nro_aviso THEN

       this.Modify("nro_aviso.background.color=" + gs_blanco)
       this.SetTabOrder("nro_aviso",440)
   ELSE
	    this.Modify("nro_aviso.background.color=" + gs_gris)
       this.SetTabOrder("nro_aviso",0)
		 
	END IF
	
	IF pb_nro_llamadas THEN

       this.Modify("nro_llamadas.background.color=" + gs_blanco)
       this.SetTabOrder("nro_llamadas",450)
   ELSE
	    this.Modify("nro_llamadas.background.color=" + gs_gris)
       this.SetTabOrder("nro_llamadas",0)
		 
	END IF
	
//Parametrizo el n$$HEX1$$fa00$$ENDHEX$$mero de Aviso //MERC

	IF gl_nro_aviso_visible THEN
       This.Object.nro_aviso.Visible = 1
	ELSE
		 This.Object.nro_aviso.Visible = 0
		 This.Object.st_nro_aviso.Visible = 0
	END IF
RETURN 1
end function

public function integer fpr_o_inc_nis (ref datawindow pd_dw, long pl_nro_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_o_inc_nis
//
// Objetivo:    Obtener todas las incidencias sobre el nis
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pd_dw (data windows)
//      Entrada:         pl_nro_nis (numero de instalacion)
//                              
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      11/05/96                AAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_orden, ll_incidencia  
long ll_nro_incid
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup
string ls_t_interrupcion 
int li_centro, li_mesa, li_cmd ,li_fin_cursor   
decimal{0} ll_instalacion, ll_inst_padre
decimal{0} ld_nro_inst
boolean lb_inc_asoc = False

// Puntero a "reloj de arena"
SetPointer(HourGlass!)

// Leo "Ordenes de Servicio" por Nis_Rad, tipo y estado
// Si tipo de O/S es de corte y est$$HEX2$$e1002000$$ENDHEX$$pendiente
// est:O/S = ord:numero de orden

// Leo "Aco_Sum" por Nis_Rad
// Leo "SGD_ACOMETIDA" por clave_aco = Aco_Sum:clave_aco
// est:instalacion = SGD_ACOMETIDA.instalacion

SetNull(ll_instalacion)

SELECT "SGD_ACOMETIDA"."INSTALACION_ORIGEN"  
INTO :ld_nro_inst  
FROM "SGD_ACOMETIDA"  
WHERE "SGD_ACOMETIDA"."CODIGO" = (  SELECT "ACO_SUM"."NRO_ACOMETIDA"  
				     FROM "ACO_SUM"  
				     WHERE "ACO_SUM"."NIS_RAD" = :pl_nro_nis)
AND "SGD_ACOMETIDA"."BDI_JOB"=0
USING sqlca;

//**********************************************************************

IF sqlca.SqlCode = 0 THEN
	SELECT "SGD_INSTALACION"."NRO_CENTRO",   
	  "SGD_INSTALACION"."NRO_MESA",   
	  "SGD_INSTALACION"."NRO_CMD"  
   INTO :li_centro, :li_mesa, :li_cmd  
   FROM "SGD_INSTALACION"  
   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ld_nro_inst
	AND "SGD_INSTALACION"."BDI_JOB"=0
	USING sqlca;
	IF sqlca.SqlCode = 0 THEN
		is_avisos.gl_nro_instalacion = ld_nro_inst
	ELSEIF sqlca.SqlCode = -1 THEN
		gnv_msg.f_mensaje("ER19","","",OK!)
		RETURN -1
	ELSE
		is_avisos.gl_nro_instalacion = 0
	END IF
ELSEIF sqlca.SqlCode = 100 THEN
	is_avisos.gl_nro_instalacion = 0
ELSE
	gnv_msg.f_mensaje("ER20","","",OK!)
	RETURN -1
END IF


// Si est:instalacion <> 0
//      Leo "Interrupciones" por Int:instalacion = est:instalacion
//      Si Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
//              Si Int:seleccion = "X" (Marcado)
//                              est:incidencia_confirmada = Int:incidencia
//      SinoSi Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
//              Si Int:seleccion = "P" (Marcado)
//                              posible_incid_asoc = Verdadero
//              Sino
//                      Leo "Instalaciones" por est:instalacion
//                      padre = Ins:instalacion_padre
//              FinSi
// FinSi
//      Verifico_Instalacion_Padre(padre)

is_avisos.gl_nro_incidencia = 0
ll_nro_incid = 0
ldt_fecha_actual = fgnu_fecha_actual()
//ldt_fecha_actual = today()

IF      is_avisos.gl_nro_instalacion <> 0 THEN

	// Declaro y cargo cursor con todas las instalaciones de la jerarqu$$HEX1$$ed00$$ENDHEX$$a
	DECLARE lc_cur_jerar_inst CURSOR FOR
	(SELECT "SGD_INSTALACION"."NRO_INSTALACION"
	FROM "SGD_INSTALACION"
	START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :ld_nro_inst AND "SGD_INSTALACION"."BDI_JOB"=0
	CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" AND "SGD_INSTALACION"."BDI_JOB"=0)
	USING sqlca;

	OPEN lc_cur_jerar_inst;

	FETCH lc_cur_jerar_inst INTO :ll_instalacion ;
	
	li_fin_cursor = 0

	DO

		// Declaro y cargo cursor con todas las interrupciones sobre la instalacion
		DECLARE lc_cur_interrup CURSOR FOR
		(SELECT  "SGD_INTERRUPCION"."F_REPOSICION",
					"SGD_INTERRUPCION"."TIP_INTERRUPCION",
					"SGD_INTERRUPCION"."NRO_INCIDENCIA",
					"SGD_INTERRUPCION"."F_ALTA"
	   FROM "SGD_INTERRUPCION"  
	WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" = :ll_instalacion)
		USING sqlca;

		OPEN lc_cur_interrup;

		SetNull(ldt_f_reposicion);

		FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
				:ll_incidencia, :ldt_f_alta_interrup ;
	
		DO 
			IF sqlca.SqlCode = 0 THEN
				IF NOT IsNull(Date(ldt_f_reposicion)) AND&
						ldt_fecha_actual >= ldt_f_alta_interrup AND&
						ls_t_interrupcion ="X" THEN

					int li_estado                                           

					SELECT "SGD_INCIDENCIA"."EST_ACTUAL"  
					INTO :li_estado  
					FROM "SGD_INCIDENCIA"  
					WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :ll_incidencia   ;

					IF li_estado = fgci_incidencia_resuelta THEN

						// INSERTO EN LA DATAWINDOWS LA INFORMACION DE LA INCIDENCIA
					This.fpr_insertar_incidencia(ll_incidencia,pd_dw)
					END IF
				END IF

				SetNull(ldt_f_reposicion);
	
				FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
						:ll_incidencia, :ldt_f_alta_interrup ;
			END IF
		LOOP UNTIL (sqlca.SqlCode <> 0)                         

		CLOSE lc_cur_interrup;

		FETCH lc_cur_jerar_inst INTO :ll_instalacion;

		IF (sqlca.SqlCode <> 0) THEN
			li_fin_cursor = 1
		END IF

	LOOP UNTIL (li_fin_cursor = 1) 

//OR (IsNull(Date(ldt_f_reposicion)) AND&
//                      ldt_fecha_actual >= ldt_f_alta_interrup AND&
//                      ls_t_interrupcion = "X")

	CLOSE lc_cur_jerar_inst ;
END IF

RETURN 1

end function

public function integer fpr_insertar_incidencia (long pl_nro_inc, ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_insertar_incidencia
//
// Objetivo:    Insertar en la datawindow toda la informaci$$HEX1$$f300$$ENDHEX$$n referente
//                                      a la incidencia pasada como parametro
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pd_dw (datawindow)
//      Entrada:         pl_nro_inc (numero de incidencia)
//                              
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      11/05/96                AAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
String ls_desc_incidencia
DateTime ldt_f_deteccion , ldt_f_resol
Int li_nro_centro
Int li_nro_cmd
Int li_nro_mesa
Decimal ll_pot_afectada
String ls_nombre_instalacion
Decimal ldec_nro_inst_afectada
Decimal ll_pot_contratada
Long ll_ccli_afec
Int li_tip_tension
Int li_est_actual
Int li_estado_mantenimiento
DateTime ldt_h_deteccion
Long ll_nro_incidencia
DateTime ldt_f_est_res
Int li_tip_incidencia
Int li_alcance
Int li_resuelve_mant
Long li_nro_row
SELECT "SGD_INCIDENCIA"."DESC_INCIDENCIA",
		 "SGD_INCIDENCIA"."F_DETECCION",
		 "SGD_INCIDENCIA"."NRO_CENTRO",
		 "SGD_INCIDENCIA"."NRO_CMD", 
		 "SGD_INCIDENCIA"."NRO_MESA",
		 "SGD_INCIDENCIA"."POT_AFECTADA",
		 "SGD_INCIDENCIA"."NRO_INST_AFECTADA", 
		 "SGD_INCIDENCIA"."POT_CONTRATADA",
		 "SGD_INCIDENCIA"."CCLI_AFEC",
		 "SGD_INCIDENCIA"."TIP_TENSION",
		 "SGD_INCIDENCIA"."EST_ACTUAL",
		 "SGD_INCIDENCIA"."ESTADO_MANTENIMIENTO",
		 "SGD_INCIDENCIA"."H_DETECCION", 
		 "SGD_INCIDENCIA"."NRO_INCIDENCIA",
		 "SGD_INCIDENCIA"."F_EST_RES",
		 "SGD_INCIDENCIA"."TIP_INCIDENCIA",
		 "SGD_INCIDENCIA"."FEC_RESOLUCION",
		 "SGD_INCIDENCIA"."ALCANCE"    INTO
			 :ls_desc_incidencia,
			:ldt_f_deteccion,
			:li_nro_centro,
			:li_nro_cmd,
			:li_nro_mesa,
			:ll_pot_afectada,
			:ldec_nro_inst_afectada,
			:ll_pot_contratada,
			:ll_ccli_afec,
			:li_tip_tension,
			:li_est_actual,
			:li_estado_mantenimiento,
			:ldt_h_deteccion,
			:ll_nro_incidencia,
			:ldt_f_est_res,
			:li_tip_incidencia,
			:ldt_f_resol,
			:li_alcance
	FROM "SGD_INCIDENCIA" 
	WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_inc;

IF SQLCA.SQLCODE=0 THEN
li_nro_row = pd_dw.insertrow(0);
//li_nro_row = pd_dw.rowcount();
pd_dw.SETITEM(li_nro_row,"INCIDENCIA_DESC_INCIDENCIA",ls_desc_incidencia)
pd_dw.SETITEM(li_nro_row,"F_DETECCION",ldt_f_deteccion)

pd_dw.SETITEM(li_nro_row,"NRO_CENTRO",li_nro_centro)
pd_dw.SETITEM(li_nro_row,"NRO_CMD",li_nro_cmd)
pd_dw.SETITEM(li_nro_row,"NRO_MESA",li_nro_mesa)
pd_dw.SETITEM(li_nro_row,"POT_AFECTADA",ll_pot_afectada)
pd_dw.SETITEM(li_nro_row,"NRO_INST_AFECTADA",ldec_nro_inst_afectada)
pd_dw.SETITEM(li_nro_row,"POT_CONTRATADA",ll_pot_contratada)
pd_dw.SETITEM(li_nro_row,"CCLI_AFEC",ll_ccli_afec)
pd_dw.SETITEM(li_nro_row,"TIP_TENSION",li_tip_tension)
pd_dw.SETITEM(li_nro_row,"INCIDENCIA_EST_ACTUAL",li_est_actual)
pd_dw.SETITEM(li_nro_row,"ESTADO_MANTENIMIENTO",li_estado_mantenimiento)
pd_dw.SETITEM(li_nro_row,"H_DETECCION",ldt_h_deteccion)
pd_dw.SETITEM(li_nro_row,"NRO_INCIDENCIA",ll_nro_incidencia)
pd_dw.SETITEM(li_nro_row,"F_EST_RES",ldt_f_est_res)
pd_dw.SETITEM(li_nro_row,"TIP_INCIDENCIA",li_tip_incidencia)
pd_dw.SETITEM(li_nro_row,"FEC_RESOLUCION",ldt_f_resol)
pd_dw.SETITEM(li_nro_row,"ALCANCE",li_alcance)

SELECT NOM_INSTALACION into :ls_nombre_instalacion FROM SGD_INSTALACION WHERE NRO_INSTALACION=:ldec_nro_inst_afectada;
pd_dw.SETITEM(li_nro_row,"INSTALACION_NOM_INSTALACION",ls_nombre_instalacion)
END IF
return 1
end function

public function integer fpr_c_cgv_y_cods (ref s_direccion_cliente pstr_dir_cli);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_c_cgv_y_cods
// 
// Objetivo:    Carga en la estructura de avisos los c$$HEX1$$f300$$ENDHEX$$digos de la direcci$$HEX1$$f300$$ENDHEX$$n
//                                      que est$$HEX1$$e100$$ENDHEX$$n en la estructura pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pstr_dir_cli (estructura con toda la informaci$$HEX1$$f300$$ENDHEX$$n del cliente)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_fecha

IF IsNull(pstr_dir_cli.gs_pisodpto) THEN
	This.is_avisos.gs_cgv_sum = " "
ELSE
	This.is_avisos.gs_cgv_sum = pstr_dir_cli.gs_pisodpto
END IF
This.is_avisos.gl_cod_calle = pstr_dir_cli.gl_codcalle
This.is_avisos.gl_cod_loc = pstr_dir_cli.gl_codloc
This.is_avisos.gl_cod_munic =pstr_dir_cli.gl_codmun
This.is_avisos.gi_cod_prov = pstr_dir_cli.gl_codprov
This.is_avisos.gi_cod_depto = pstr_dir_cli.gl_coddepto
This.is_avisos.gs_co_pais = pstr_dir_cli.gs_co_pais

ldt_fecha   = fgnu_fecha_actual()
//ldt_fecha   = today()

is_avisos.gi_cod_hor = fgrn_intervalo_horario(ldt_fecha)

IF is_avisos.gi_cod_hor = -1 THEN
	gnv_msg.f_mensaje("ER59","","",OK!)
	RETURN -1
END IF


RETURN 1


end function

public function character fpr_v_interrup_total (long pl_nro_incid);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_v_interrup_total
//
// Objetivo:    Verifico si el nro. de incidencia pasado como par$$HEX1$$e100$$ENDHEX$$metro 
//                                      tiene una instalaci$$HEX1$$f300$$ENDHEX$$n asociada en la tabla 'Interrupci$$HEX1$$f300$$ENDHEX$$n'.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nro_incid (nro. de incidencia asignada a la inst.)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    tipo de instalaci$$HEX1$$f300$$ENDHEX$$n
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

char lc_tipo_inst

SELECT "SGD_INTERRUPCION"."TIP_INTERRUPCION"  
INTO :lc_tipo_inst  
FROM "SGD_INTERRUPCION"  
WHERE ( "SGD_INTERRUPCION"."NRO_INCIDENCIA" = :pl_nro_incid );

IF sqlca.SqlCode = 0 THEN
	RETURN lc_tipo_inst 
ELSEIF sqlca.SqlCode = 100 THEN
	RETURN "X"
ELSE
	gnv_msg.f_mensaje("ER17","","",OK!)
	RETURN "-1"
END IF
		
end function

public function integer fpr_o_indice_de_peligro (integer pi_tip_aviso);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_o_indice_de_peligro
//
// Objetivo:    Obtengo el valor del $$HEX1$$ed00$$ENDHEX$$ndice de peligro para el tipo
//                                      de aviso pasado como par$$HEX1$$e100$$ENDHEX$$metro, de la tabla 'T_Tip_Aviso'
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pi_tip_aviso (por el que busco el indice de peligro)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    indice de peligro
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_ind_peligro

SetPointer(HourGlass!)

SELECT "GI_T_TIP_AVISO"."IND_PELIGRO"  
INTO :li_ind_peligro  
FROM "GI_T_TIP_AVISO"  
WHERE "GI_T_TIP_AVISO"."TIP_AVISO" = :pi_tip_aviso   
USING sqlca;

IF sqlca.SqlCode = 0 THEN
	RETURN li_ind_peligro
ELSE
	gnv_msg.f_mensaje("ER12","","",OK!)
	RETURN -1
END IF

end function

public function integer fpr_v_importante (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_v_importante
//
// Objetivo:    Verifico si el cliente al que pertenece el suministro
//                                      pasado como par$$HEX1$$e100$$ENDHEX$$metro es importante.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nis (id. del suministro del cliente)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (cliente importante o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Leo Suministros_Imp por Nis_Rad
// Si S_I.fecha_expiracion >= Today()
//      est:importante = 1.

SetPointer(HourGlass!)

/* ** LSH *** INI *** DEO14-00001064 *** 22/09/2014 */
//datetime ldt_f_expiracion
string ls_tipo, ls_carga, ls_img_carga

//SELECT "GI_SUMINISTROS_IMP"."F_EXPIRACION"  
//INTO :ldt_f_expiracion  
//FROM "GI_SUMINISTROS_IMP"  
//WHERE "GI_SUMINISTROS_IMP"."NIS_RAD" = :pl_nis AND
//		"GI_SUMINISTROS_IMP"."F_EXPIRACION" > sysdate
//USING sqlca;

SELECT "GI_SUMINISTROS_IMP"."CARGA_ES", "GI_SUMINISTROS_IMP"."TIPO_CARGA_ES", "SGD_VALOR"."DESCRIPCION"
INTO :ls_carga, :ls_tipo, :ls_img_carga
FROM "GI_SUMINISTROS_IMP",   "SGD_VALOR"
WHERE "GI_SUMINISTROS_IMP"."NIS_RAD" = :pl_nis AND
		"GI_SUMINISTROS_IMP"."F_EXPIRACION" > sysdate AND
		"SGD_VALOR"."CODIF"(+) = 'ESEN' AND 
		"SGD_VALOR"."VALOR"(+) = "GI_SUMINISTROS_IMP"."TIPO_CARGA_ES"
USING sqlca;
/* ** LSH *** FIN *** DEO14-00001064 *** 22/09/2014 */

IF sqlca.SqlCode = 0 THEN
	is_avisos.gi_ind_cli_imp = 1
	/* ** LSH *** INI *** DEO14-00001064 *** 22/09/2014 */
	IF ls_carga = 'N' THEN
		is_avisos.gi_ind_cli_esen = 0
	ELSEIF ls_carga = 'S' THEN
		is_avisos.gi_ind_cli_esen = 1
		is_avisos.gs_tip_carga = ls_tipo
		is_avisos.gs_img_carga = ls_img_carga 
	END IF
	/* ** LSH *** FIN *** DEO14-00001064 *** 22/09/2014 */

//	IF ldt_f_expiracion >= fgnu_fecha_actual() OR IsNull(ldt_f_expiracion) THEN
//		is_avisos.gi_ind_cli_imp = 1
//		RETURN 1
//	ELSE
//		is_avisos.gi_ind_cli_imp = 0
//		RETURN 0
//	END IF
ELSEIF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER05","","",OK!)
	RETURN -1
ELSE
	is_avisos.gi_ind_cli_imp = 0
	RETURN 0
END IF

RETURN 1


end function

public function long fpr_v_os (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_v_os
//
// Objetivo:    Verifico si el suministro pasado como par$$HEX1$$e100$$ENDHEX$$metro tiene
//                                      una orden de servicio asignada y esta es de corte. En caso 
//                                      afirmativo devuelvo el c$$HEX1$$f300$$ENDHEX$$digo de la orden.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nis (n$$HEX1$$fa00$$ENDHEX$$mero del suministro)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    c$$HEX1$$f300$$ENDHEX$$digo de orden de servicio o 0
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/03/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
// 14/08/96             HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_orden
datetime ldt_fec_o_s
SELECT "ORDENES"."NUM_OS" ,"ORDENES"."F_GEN"
INTO :ll_nro_orden  , :ldt_fec_o_s
FROM "ORDENES" 
WHERE (( "ORDENES"."NIS_RAD" = :pl_nis ) AND  
      (( "ORDENES"."TIP_OS" = 'TO501' ) OR  
       ( "ORDENES"."TIP_OS" = 'TO504' )) AND  
      (( "ORDENES"."EST_OS" = 'EO001' ) OR  
       ( "ORDENES"."EST_OS" = 'EO004' ) OR  
       ( "ORDENES"."EST_OS" = 'EO009' )) AND ROWNUM=1) ORDER BY "ORDENES"."F_GEN" ;



//WHERE (( "ORDENES"."NIS_RAD" = :pl_nis ) AND  
//      (( "ORDENES"."TIP_OS" = 'TO501' ) OR ( "ORDENES"."TIP_OS" = 'TO504' ) OR 
//		( "ORDENES"."TIP_OS" = 'TO515' ) OR ( "ORDENES"."TIP_OS" = 'TO516' ) OR 
//		( "ORDENES"."TIP_OS" = 'TO526' ) OR ( "ORDENES"."TIP_OS" = 'TO528' ) OR
//		( "ORDENES"."TIP_OS" = 'TO530' ) OR ( "ORDENES"."TIP_OS" = 'TO533' )) AND  
//      (( "ORDENES"."EST_OS" = 'EO001' ) OR ( "ORDENES"."EST_OS" = 'EO004' ) OR  
//      ( "ORDENES"."EST_OS" = 'EO009' ) OR ("ORDENES"."EST_OS" = 'EO011')) AND ROWNUM=1) ORDER BY "ORDENES"."F_GEN" 
//USING sqlca;

IF sqlca.SqlCode = 0 THEN
	gnv_msg.f_mensaje("AR21","","",OK!)
	//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Orden de Corte pendiente de ejecuci$$HEX1$$f300$$ENDHEX$$n",Exclamation!)
	RETURN ll_nro_orden
ELSEIF sqlca.SqlCode = 100 THEN
	RETURN 0
ELSE
	gnv_msg.f_mensaje("ER18","","",OK!)
	RETURN -1
END IF


end function

public function datawindowchild fpr_conectar (ref datawindow pdw_inf_resumen);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_conectar
// 
// Objetivo:    Conecta las DropDownDW de la DW pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pdw_inf_resumen (datawindow con la inf. resumen del aviso)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datawindowchild ldwch_co_alc, ldwch_tip_avi

pdw_inf_resumen.GetChild('co_alcance',ldwch_co_alc)
pdw_inf_resumen.GetChild('tip_aviso',ldwch_tip_avi)

ldwch_co_alc.SetTransObject(sqlca)
ldwch_tip_avi.SetTransObject(sqlca)

ldwch_co_alc.Retrieve()
ldwch_tip_avi.Retrieve()

ldwch_co_alc.SetFilter("co_alcance <> 0")
ldwch_tip_avi.SetFilter("tip_aviso <> 0")

ldwch_co_alc.Filter()
ldwch_tip_avi.Filter()

RETURN ldwch_tip_avi
end function

public function integer fpr_o_incid (ref datawindow pd_dw, long pl_nro_nis, ref datawindow p_interrupciones, string ps_select_original);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_o_incid
//
// Objetivo:    Obtener todas las incidencias sobre el nis
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pd_dw (data windows)
//      Entrada:         pl_nro_nis (numero de instalacion)
//                              
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//  -----    		-----------   ----------------------------------------
//  26/09/96         Ad         Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_orden, ll_incidencia  
long ll_nro_incid
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup
string ls_t_interrupcion, ls_clausula_where, ls_modificacion
int li_centro, li_mesa, li_cmd ,li_fin_cursor   
decimal{0} ll_instalacion, ll_inst_padre
decimal{0} ld_nro_inst
boolean lb_inc_asoc = False

// Puntero a "reloj de arena"
SetPointer(HourGlass!)

// Leo "Ordenes de Servicio" por Nis_Rad, tipo y estado
// Si tipo de O/S es de corte y est$$HEX2$$e1002000$$ENDHEX$$pendiente
// est:O/S = ord:numero de orden

// Leo "Aco_Sum" por Nis_Rad
// Leo "SGD_ACOMETIDA" por clave_aco = Aco_Sum:clave_aco
// est:instalacion = SGD_ACOMETIDA.INSTALACION_ORIGEN

ls_clausula_where =     "  WHERE SGD_INSTALACION.NRO_INSTALACION = INCIDENCIA.NRO_INST_AFECTADA AND "+ &
								"	NRO_INCIDENCIA IN ( SELECT NRO_INCIDENCIA " + &
								"	FROM INTERRUPCION WHERE NRO_INSTALACION IN ( " + & 
								"	SELECT NRO_INSTALACION FROM SGD_INSTALACION START WITH "+ & 
								"	NRO_INSTALACION = ( " + & 
								"	SELECT SGD_ACOMETIDA.INSTALACION_ORIGEN FROM SGD_ACOMETIDA " + & 
								"	WHERE SGD_ACOMETIDA.CODIGO = ( " + & 
								"	SELECT ACO_SUM.CODIGO FROM ACO_SUM " + & 
								"	WHERE ACO_SUM.NIS_RAD = " + String(pl_nro_nis) + & 
								"	) AND SGD_ACOMETIDA.BDI_JOB=0 ) AND SGD_INSTALACION.BDI_JOB=0 CONNECT 	BY PRIOR NRO_INST_PADRE = NRO_INSTALACION AND SGD_INSTALACION.BDI_JOB=0 ) ) "
ls_modificacion = "DataWindow.table.Select=~"" + ps_select_original + ls_clausula_where + "~""

ls_modificacion = pd_dw.Modify(ls_modificacion)
pd_dw.Retrieve()
RETURN 1

end function

public function integer fpr_busco_localidad (long pl_nis);long ll_cant, ll_cod_loc

select "ACO_SUM"."COD_LOC" INTO :ll_cod_loc from "ACO_SUM" where "ACO_SUM"."NIS_RAD" = :pl_nis;

IF sqlca.sqlcode = 100 THEN
	ll_cant = 1
	Return ll_cant
END IF

select count (*) into :ll_cant from "GI_CENTRO_LOC"
where "GI_CENTRO_LOC"."COD_LOC" = :ll_cod_loc;

return ll_cant
end function

public function integer fpr_act_avi_por_fin_ot (long pl_nro_avi, long pl_avis_nro_ins, integer pi_cli_imp_lista, integer pi_ind_pel_lista);int li_cant_avisos,li_aviso_res
long ldec_nro_instalacion
datetime ldt_fecha

li_aviso_res=fgci_aviso_resuelto
ldt_fecha=fgnu_fecha_actual()

UPDATE "GI_AVISOS"  
  SET "USUARIO" = :gs_usuario,   
	     "F_ACTUAL" = :ldt_fecha,
		"PROGRAMA" = 'FIN_OT',
		"EST_AVISO" = :li_aviso_res,
		"FECHA_RES" = :ldt_fecha,
		"HORA_RES" = :ldt_fecha
  WHERE "GI_AVISOS"."NRO_AVISO" = :pl_nro_avi ;

IF SQLCA.SQLCODE = -1 THEN	
	gnv_msg.f_mensaje("EA24","","",OK!)
	//messagebox ("Aviso","No se pudieron actualizar las tablas")
	RETURN -1
END IF
				  	
DELETE FROM "GI_AVISOS_INSTALACION"  
WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_avi;

IF SQLCA.SQLCODE = -1 THEN	
	gnv_msg.f_mensaje("EA24","","",OK!)
	//messagebox ("Aviso","No se pudieron actualizar las tablas")
	RETURN -1
END IF

IF NOT SQLCA.SQLCODE < 0 THEN
	//COMMIT;  
	gnu_u_transaction.uf_commit()
ELSE  
   RETURN -1
END IF

RETURN 1
end function

public function long fpr_o_nro_aviso ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_o_nro_aviso
//
// Objetivo:    Obtengo el n$$HEX1$$fa00$$ENDHEX$$mero de aviso siguiente al $$HEX1$$fa00$$ENDHEX$$ltimo dado
//                                      de alta.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:        --      
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    nro. de aviso
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_aviso
string ls_tabla = "AVISOS"

// Tomo el $$HEX1$$fa00$$ENDHEX$$ltimo valor de nro. de aviso
SELECT "GI_T_ULTIMO"."ULTIMO"  
INTO :ll_nro_aviso  
FROM "GI_T_ULTIMO"  
WHERE "GI_T_ULTIMO"."TABLA" = :ls_tabla
FOR UPDATE
USING sqlca;

// Controlo la carrectitud de la operaci$$HEX1$$f300$$ENDHEX$$n anterior
IF sqlca.SqlCode = 0 THEN
	ll_nro_aviso = ll_nro_aviso + 1
ELSEIF sqlca.SqlCode = 100 THEN
	// Primer registro

	ll_nro_aviso = 1
ELSE
	gnv_msg.f_mensaje("ER01","","",OK!)
	RETURN -1
END IF

// Actualizo el archivo "t_ultimo"
// NO estoy actualizando todos los campos de la tabla
UPDATE "GI_T_ULTIMO"  
SET "ULTIMO" = :ll_nro_aviso  
WHERE "GI_T_ULTIMO"."TABLA" = :ls_tabla
USING sqlca;

// Controlo la carrectitud de la operaci$$HEX1$$f300$$ENDHEX$$n anterior
IF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER02","","",OK!)
	//ROLLBACK ;
	gnu_u_transaction.uf_rollback()
	RETURN -1
ELSE
	//COMMIT ;
	gnu_u_transaction.uf_commit()
END IF

RETURN ll_nro_aviso
end function

public function integer fpr_c_estructura_avisos (s_direccion_cliente psrt_dir_cli, long pl_nro_aviso, ref datawindow pdw_inf_resumen);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_c_estructura_avisos
// 
// Objetivo:    Carga en la estructura de avisos los datos que traen
//                                      cargados los par$$HEX1$$e100$$ENDHEX$$metros, y algunos que calcula en base a 
//                                      los anteriores.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico

//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pstr_dir_cli     (estructura con toda la informaci$$HEX1$$f300$$ENDHEX$$n del cliente)
//                                      pi_nro_aviso     (nro. del aviso)       
//                                      pdw_inf_resumen (datawindow con la inf. resumen del aviso)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      24/02/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime    ldt_fecha, ldt_f_nula, ldt_f_inicial
string  ls_programa

SetPointer(HourGlass!)
setnull(ldt_f_nula)

//ldt_fecha   = today()
ldt_fecha   = fgnu_fecha_actual()
ls_programa = "c_estruc_avi"

// Acepto el texto ingresado en inf. resumen del aviso
pdw_inf_resumen.AcceptText()

// Cargo estructura de avisos
is_avisos.gl_nro_aviso = pl_nro_aviso
is_avisos.gs_usuario = gs_usuario
is_avisos.gd_f_actual = ldt_fecha
If Trim(is_avisos.gs_programa) = '' or IsNull(is_avisos.gs_programa) Then
	is_avisos.gs_programa = ls_programa
End If

IF NOT IsNull(psrt_dir_cli.gl_nis) THEN
	is_avisos.gl_nis_rad = psrt_dir_cli.gl_nis
END IF
IF NOT IsNull(psrt_dir_cli.gs_nom) THEN
	is_avisos.gs_nombre = psrt_dir_cli.gs_nom
END IF
IF NOT IsNull(psrt_dir_cli.gs_ape1) THEN
	is_avisos.gs_ape1 = psrt_dir_cli.gs_ape1
END IF
IF NOT IsNull(psrt_dir_cli.gs_ape2) AND psrt_dir_cli.gs_ape2 <> "" AND &
		psrt_dir_cli.gs_ape2 <> " " THEN
	is_avisos.gs_ape2 = psrt_dir_cli.gs_ape2
ELSE
	is_avisos.gs_ape2 = " "
END IF
IF NOT IsNull(psrt_dir_cli.gs_doc) THEN
	is_avisos.gs_doc_id = psrt_dir_cli.gs_doc
END IF
IF NOT IsNull(psrt_dir_cli.gs_tipo_doc) THEN
	is_avisos.gs_tip_doc = psrt_dir_cli.gs_tipo_doc
END IF
IF NOT IsNull(pdw_inf_resumen.GetItemNumber(1,"co_alcance")) THEN
	is_avisos.gi_co_alcance = pdw_inf_resumen.GetItemNumber(1,"co_alcance")
ELSE
	is_avisos.gi_co_alcance = 1
END IF
IF NOT IsNull(pdw_inf_resumen.GetItemNumber(1,"tip_aviso")) THEN
	is_avisos.gi_tip_aviso = pdw_inf_resumen.GetItemNumber(1,"tip_aviso")
ELSE
	is_avisos.gi_tip_aviso = 1
END IF
is_avisos.gi_ind_peligro = fpr_o_indice_de_peligro(is_avisos.gi_tip_aviso)
IF is_avisos.gi_ind_peligro = 1 THEN
	is_avisos.gi_prioridad = fgci_prioridad_media
ELSEIF is_avisos.gi_ind_peligro = 0 THEN
	is_avisos.gi_prioridad = fgci_prioridad_baja
END IF
IF isnull(is_avisos.gd_f_alta) or (is_avisos.gd_f_alta = ldt_f_inicial) then //GNU 23-09-2005 Incidencia: 0/373010
	is_avisos.gd_f_alta = ldt_fecha
END IF
IF NOT IsNull(psrt_dir_cli.gs_telefono) AND psrt_dir_cli.gs_telefono <> ""&
		AND psrt_dir_cli.gs_telefono <> " " THEN
	is_avisos.gs_tfno_cli = psrt_dir_cli.gs_telefono
ELSE
	is_avisos.gs_tfno_cli = "0"
END IF
IF is_avisos.gl_nro_incidencia = 0 THEN
	is_avisos.gi_est_aviso = fgci_aviso_pendiente
	is_avisos.gi_inc_asoc  = 0
ELSE
	IF is_avisos.gi_est_aviso < fgci_aviso_resuelto THEN
		is_avisos.gi_est_aviso = fgci_aviso_asociado
	END IF
	is_avisos.gi_inc_asoc  = 1
END IF

IF NOT IsNull(pdw_inf_resumen.GetItemDatetime(1,"fecha_problema")) then 
	is_avisos.gdt_f_problema = pdw_inf_resumen.GetItemDatetime(1,"fecha_problema")
else
	is_avisos.gdt_f_problema = ldt_f_nula
end if

IF NOT IsNull(pdw_inf_resumen.GetItemString(1,"obs_telegestiones")) AND& 
		pdw_inf_resumen.GetItemString(1,"obs_telegestiones") <> "" AND& 
		pdw_inf_resumen.GetItemString(1,"obs_telegestiones") <> " " THEN
	is_avisos.gs_obs_telegestiones = pdw_inf_resumen.GetItemString(1,"obs_telegestiones")
ELSE
	is_avisos.gs_obs_telegestiones = " "
END IF
is_avisos.gs_obs_cmd = " "
is_avisos.gi_ind_ayuda = 0
IF NOT IsNull(psrt_dir_cli.gs_duplic) AND psrt_dir_cli.gs_duplic <> ""&
		AND psrt_dir_cli.gs_duplic <> " " THEN
	is_avisos.gs_duplicador = psrt_dir_cli.gs_duplic
ELSE
	is_avisos.gs_duplicador = " "
END IF
IF NOT IsNull(psrt_dir_cli.gl_numero) THEN
	is_avisos.gl_num_puerta = psrt_dir_cli.gl_numero
ELSE
	is_avisos.gl_num_puerta = 0
END IF
IF NOT IsNull(psrt_dir_cli.gs_calle) AND psrt_dir_cli.gs_calle <> "" AND&
		psrt_dir_cli.gs_calle <> " " THEN
	is_avisos.gs_nom_calle = LeftTrim(psrt_dir_cli.gs_calle)                        // Calle sin espacios al principio
ELSE
	is_avisos.gs_nom_calle = " "
END IF
is_avisos.gl_nro_brigada = 0
IF NOT IsNull(psrt_dir_cli.gs_esq_cond) AND psrt_dir_cli.gs_esq_cond <> ""&
		AND psrt_dir_cli.gs_esq_cond <> " " THEN
	is_avisos.gs_esquina = psrt_dir_cli.gs_esq_cond
ELSE
	is_avisos.gs_esquina = " "
END IF


// Si se tiene instalaci$$HEX1$$f300$$ENDHEX$$n que alimente al suministro nos quedamos con
// los valores obtenidos del registro de la misma.
// Sino se obtienen de la tabla de localidad por cod_local.

IF is_avisos.gl_nro_instalacion = 0 THEN

	IF This.fpr_o_centro_cmd_mesa(is_avisos.gi_nro_centro,is_avisos.gi_nro_cmd,&
			is_avisos.gi_nro_mesa,is_avisos.gl_cod_loc) = 0 THEN
		RETURN 0
	END IF
END IF

is_avisos.gi_nro_telegestiones = gi_nro_centro
is_avisos.gs_nro_telefonista = gs_usuario

IF NOT IsNull(psrt_dir_cli.gs_prov) THEN
	is_avisos.gs_nom_prov  = psrt_dir_cli.gs_prov  
END IF
IF NOT IsNull(psrt_dir_cli.gs_depto) THEN
	is_avisos.gs_nom_depto = psrt_dir_cli.gs_depto
END IF
IF NOT IsNull(psrt_dir_cli.gs_munic) THEN
	is_avisos.gs_nom_munic = psrt_dir_cli.gs_munic
END IF
IF NOT IsNull(psrt_dir_cli.gs_local) THEN
	is_avisos.gs_nom_loc   = psrt_dir_cli.gs_local
END IF
IF NOT IsNull(psrt_dir_cli.gi_nro_area) THEN
	is_avisos.gi_nro_area   = psrt_dir_cli.gi_nro_area
END IF
IF NOT IsNull(psrt_dir_cli.gs_poblacion) THEN
	is_avisos.gs_poblacion   = psrt_dir_cli.gs_poblacion
END IF

//if NOT IS NULL 
//SetNull(is_avisos.gdt_f_res)
//SetNull(is_avisos.gdt_h_res)

is_avisos.gs_ref_dir = " "

//is_avisos.gi_est_batch
//is_avisos.gdt_f_batch

is_avisos.gi_cod_hor = fgrn_intervalo_horario(ldt_fecha)
IF is_avisos.gi_cod_hor = -1 THEN
	gnv_msg.f_mensaje("ER59","","",OK!)
	RETURN -1
END IF

RETURN 1


end function

public function integer fpr_o_centro_cmd_mesa (ref integer pi_centro, ref integer pi_cmd, ref integer pi_mesa, long pl_cod_loc);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_o_centro_cmd_mesa
// Objetivo:    Obtiene el nro. de centro, nro. de cmd y nro. de mesa, 
//                                      de la tabla 'Centro_Loc' por el c$$HEX1$$f300$$ENDHEX$$digo de localidad.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pi_centro       (donde retorno el cod_centro)
//                                      pi_cmd          (donde retorno el cod_cmd)
//                                      pi_mesa         (donde retorno el cod_mesa)
//                                      pl_cod_loc      (me pasa el valor del c$$HEX1$$f300$$ENDHEX$$digo de localidad)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


///////////////DBE 24/03/2000 12:33
int li_centro, li_cmd, li_mesa

		 DECLARE centros_locos CURSOR FOR  
			SELECT "GI_CENTRO_LOC"."NRO_CENTRO",   
       "GI_CENTRO_LOC"."NRO_CMD",   
       "GI_CENTRO_LOC"."NRO_PUESTO"  
       FROM "GI_CENTRO_LOC"  
       WHERE "GI_CENTRO_LOC"."COD_LOC" = :pl_cod_loc
		 and rownum<3;


		open centros_locos;
	
		fetch centros_locos into :li_centro,   :li_cmd,   :li_mesa;

			

 pi_centro=li_centro
 pi_cmd=li_cmd
 pi_mesa=li_mesa

IF sqlca.SqlCode = 0 THEN
	fetch centros_locos into :li_centro,   :li_cmd,   :li_mesa;
	     choose case  sqlca.SqlCode
			      case 0 //Hay registros mas que uno
						pi_mesa=0
					case 100 //Solo uno
				
					case else //Malo
					close centros_locos;
					gnv_msg.f_mensaje("ER10","","",OK!)
					RETURN -1	
		  end choose
		  
		  close centros_locos;
        RETURN 1
ELSEIF sqlca.SqlCode = 100 THEN
      	close centros_locos;
        gnv_msg.f_mensaje("AR10","","",OK!)
        RETURN 0
ELSE
        close centros_locos;
        gnv_msg.f_mensaje("ER10","","",OK!)
        RETURN -1
END IF
/////////////// DBE 24/03/2000 12:33
end function

public function long fpr_o_inf_comple_sum (ref long pl_ord_servicio, ref long pl_nro_incid, long pl_nis, ref boolean pb_incidencia_pos, string ps_nombre);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_o_inf_comple_sum
//
// Objetivo:    Obtengo el resto de la informaci$$HEX1$$f300$$ENDHEX$$n sobre el suministro,
//                  necesaria para completar los datos del aviso.
//                  Esta funci$$HEX1$$f300$$ENDHEX$$n realiza la mayor parte del procesamiento en
//                  lo que a la obtenci$$HEX1$$f300$$ENDHEX$$n de la inf. anterior se refiere.
//				  Se ha implementado una conexi$$HEX1$$f300$$ENDHEX$$n con conectividad para 
//				  que devuelva la jerarqu$$HEX1$$ed00$$ENDHEX$$a en el Estado Real de la red.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:     pl_ord_servicio (cargo la orden de servicio del sum.)
//                       pl_nro_incid             (cargo la instalaci$$HEX1$$f300$$ENDHEX$$n del sum.)
//                       pl_nis                   (nis_rad para obtener los datos restantes)
//                       gb_hay_sesionetorno si no est$$HEX2$$e1002000$$ENDHEX$$afectado por incidencia
//						   2 Aviso asociado a Incidencia                             
// 					      >2 posiblemente afectado por la incidencia que afecta a la 
//                                instalacion nro li_inst_afect_inc
//
//  	Fecha         Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// 	---------    			-------         	----------------------------------------
//	15/02/96         	HMA     		Versi$$HEX1$$f300$$ENDHEX$$n Original
//	27/04/2000		FDO			Av. de Calidad.
// 	29/08/2000		GSH     		Eliminar referencia al estado posiblemente asociada
//	23/01/2001		FDO			Conectividad- Instalaci$$HEX1$$f300$$ENDHEX$$n afectada=acometida 
//										Eliminaci$$HEX1$$f300$$ENDHEX$$n de Petsum. Adaptacion Gi_avisos_instalacion
//										Y de paso la he comentado, tabulado...
//	05/09/2002		FDO			Tablas de decisi$$HEX1$$f300$$ENDHEX$$n a la hora de asociar avisos
//	10/11/2002		FDO			Log de seguimiento del aviso
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_orden, ll_incidencia, ll_ot, ll_padre,ll_instalacion_aviso,ll_ct
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup,ldt_f_rep_fase_a,ldt_f_rep_fase_b,ldt_f_rep_fase_c,ldt_f_rep, ldt_f_res
string ls_t_interrupcion,ls_ci,ls_h_rep,ls_fase_suministro,ls_fase,ls_instalaciones,ls_fase_a,ls_fase_b,ls_fase_c
int li_centro, li_mesa, li_cmd ,li_fin_cursor,li_contador,li_tipo_instalacion,li_tiempo_espera,li_tipo_conexion,li_refaseo,li_tb_dec,li_devuelve = 1,li_conta_log = 0
long ll_instalacion, ll_inst_padre,ll_posicion_busqueda,ll_instalacion_referencia,ll_inst_comp,LL_FASE_REFASEO
boolean lb_inc_asoc = False
string ls_operador_b,ls_operador_c,ls_h_rep_a,ls_h_rep_b,ls_h_rep_c,ls_fase_afect,ls_ind_dec,ls_inst_oop

/////////// Declaraci$$HEX1$$f300$$ENDHEX$$n de variables para la conexion con el RF
long ll_instalaciones[],ll_instalaciones_nulas[],ll_inst_int
boolean lb_real ,lb_conexion
long ll_salidas_mt[]
long ll_fases[]
///////////

int li_tipo_ct

//AHM 02/03/2010
long		ll_instalacionAux			//Intalaci$$HEX1$$f300$$ENDHEX$$n origen de la acometida
long		ll_acometida				//N$$HEX1$$fa00$$ENDHEX$$mero de la acometida

ldt_fecha_actual = fgnu_fecha_actual()

//AHM (Incidencia 0/586533)
//if is_avisos.gs_ventana_carga <> "C_ALIM" then
//	is_avisos.gd_f_alta = ldt_fecha_actual
//end if

setnull(is_avisos.gdt_f_res)

fw_escribe_log_avisos(" INGRESO DEL AVISO NIS: " + string(pl_nis))
//AHU
SELECT "SGD_VALOR"."VALOR"  
INTO :li_tiempo_espera  
FROM "SGD_VALOR"  
WHERE 	( "SGD_VALOR"."CODIF" = 'T_AA');
	
IF sqlca.SqlCode <> 0 THEN
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el par$$HEX1$$e100$$ENDHEX$$metro del tiempo de espera.")
	return -1
END IF	

//FIN AHU

fw_escribe_log_avisos(" TIEMPO DE ESPERA PARA INGRESO: " + string(li_tiempo_espera))

IF gb_tabla_decision = true then
	li_tb_dec = 1
ELSE
	li_tb_dec = 0
END IF

fw_escribe_log_avisos(" TABLA DE DECISION: " + string(li_tb_dec))

// Puntero a "reloj de arena"
SetPointer(HourGlass!)

// Leo "Ordenes de Servicio" por Nis_Rad, tipo y estado
// Si tipo de O/S es de corte y est$$HEX2$$e1002000$$ENDHEX$$pendiente est:O/S = ord:numero de orden

pl_ord_servicio = This.fpr_v_os(pl_nis)

// Compruebo si el aviso est$$HEX2$$e1002000$$ENDHEX$$dado de alta 

SELECT NRO_INSTALACION,
		 NRO_INCIDENCIA,
		 NRO_CENTRO,
		 NRO_CMD,
		 NRO_MESA
INTO	:ll_instalacion_aviso,
		:ll_incidencia,
		:li_centro,
		:li_cmd,
		:li_mesa
FROM GI_AVISOS
WHERE NIS_RAD = :pl_nis AND
		EST_AVISO < :fgci_aviso_resuelto AND
		IND_CALIDAD = :is_avisos.gi_ind_calidad;
		
// el aviso ya existe en gi_avisos, depende de la ventana llamante.

if sqlca.sqlcode = 0 and is_avisos.gs_ventana_carga = "C_ALIM" then
	ll_instalacion=is_avisos.gl_nro_instalacion
else
	ll_instalacion=ll_instalacion_aviso
end if
	
IF sqlca.SqlCode = 0 and is_avisos.gs_ventana_carga <> "C_ALIM" and 	is_avisos.gs_ventana_carga <> "w_anul" THEN 
	IF ll_instalacion <> fgcdec_aviso_sin_alimentacion AND &
		ll_instalacion <> fgcdec_aviso_alumbrado_publico AND &
		ll_instalacion <> fgcdec_aviso_de_ayuda AND &
		ll_instalacion <> fgcdec_aviso_de_calidad_sin_alim THEN
		
		is_avisos.gl_nro_instalacion = ll_instalacion_aviso
		
		fw_escribe_log_avisos(" NIS CON AVISO PENDIENTE." )
		
		// GNU 7-6-2007. Incidencia reactivar avisos con est_aviso=0
		IF is_avisos.gs_ventana_carga = "w_2309" THEN
			RETURN 4
		END IF
		// FIN GNU
		
	ELSE
		
		is_avisos.gl_nro_instalacion = 0
		
	END IF
	
	is_avisos.gi_nro_centro = li_centro  
	is_avisos.gi_nro_cmd    = li_cmd  
	is_avisos.gi_nro_mesa   = li_mesa 
	is_avisos.gl_nro_incidencia = ll_incidencia
	pl_nro_incid = ll_incidencia
	
	IF ll_incidencia > 0 THEN
		RETURN 2
	END IF
	
ELSE

	IF is_avisos.gs_ventana_carga = "C_ALIM" OR &
		is_avisos.gs_ventana_carga = "w_2309" OR &
		is_avisos.gs_ventana_carga = "w_anul" THEN
		
		ll_instalacion =	is_avisos.gl_nro_instalacion
		ls_fase_suministro = is_avisos.gs_fase
		
	ELSE
		
		SELECT "ACO_SUM"."NRO_ACOMETIDA"
		  INTO :ll_instalacion
		  FROM "ACO_SUM"  
		WHERE "ACO_SUM"."NIS_RAD" = :pl_nis 
		USING sqlca;
		
		fw_escribe_log_avisos(" ACOMETIDA QUE ALIMENTA AL SUMINISTRO: " + string(ll_instalacion))
		
	END IF

	IF not isnull(ll_instalacion) THEN
		
		SELECT "SGD_ACOMETIDA"."NRO_CENTRO",   
		  "SGD_ACOMETIDA"."NRO_MESA",   
		  "SGD_ACOMETIDA"."NRO_CMD",
		  NVL("SGD_ACOMETIDA"."TIPO_CONEXION",0)
		INTO :li_centro, :li_mesa, :li_cmd,:li_tipo_conexion
		FROM "SGD_ACOMETIDA"  
		WHERE "SGD_ACOMETIDA"."CODIGO" = :ll_instalacion AND "SGD_ACOMETIDA"."BDI_JOB" =0
		USING sqlca;
		
		IF sqlca.SqlCode = -1 THEN
			fw_escribe_log_avisos(" ERROR AL RECUPERAR LOS DATOS DE LA ACOMETIDA: " + string(ll_instalacion))
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pueden recuperar los datos de la acometida.")
			return -1
		END IF	
		
		IF sqlca.sqlcode = 100 THEN 
			if  is_avisos.gi_ind_calidad = 1 then 
				ll_instalacion_referencia = fgcdec_aviso_de_calidad_sin_alim
				// A la ventana de ingreso de avisos hay que devolverle un '0' mientras que a las dem$$HEX1$$e100$$ENDHEX$$s la generica de calidad sin alimentaci$$HEX1$$f300$$ENDHEX$$n.
					IF is_avisos.gs_ventana_carga = "w_2309" or is_avisos.gs_ventana_carga = "w_anul" THEN
							is_avisos.gl_nro_instalacion =  fgcdec_aviso_de_calidad_sin_alim
					ELSE
							is_avisos.gl_nro_instalacion = 0
							fw_escribe_log_avisos(" La acometida encontrada en ACO_SUM no se encuentra en SGD_ACOMETIDA, aviso sin alimentaci$$HEX1$$f300$$ENDHEX$$n.")
					END IF
			else
				ll_instalacion_referencia = fgcdec_aviso_sin_alimentacion
				// A la ventana de ingreso de avisos hay que devolverle un '0' mientras que a las dem$$HEX1$$e100$$ENDHEX$$s la generica sin alimentaci$$HEX1$$f300$$ENDHEX$$n.
				IF 	is_avisos.gs_ventana_carga = "w_2309" or is_avisos.gs_ventana_carga = "w_anul" THEN
					is_avisos.gl_nro_instalacion =  fgcdec_aviso_sin_alimentacion
				ELSE
					is_avisos.gl_nro_instalacion = 0
					fw_escribe_log_avisos(" La acometida encontrada en ACO_SUM no se encuentra en SGD_ACOMETIDA, aviso sin alimentaci$$HEX1$$f300$$ENDHEX$$n.")
				END IF
			end if
		END IF
		
		//	 Ahora que se dispone de los datos necesarios intento la conexi$$HEX1$$f300$$ENDHEX$$n con conectividad. 
		fw_escribe_log_avisos(" LLAMADA A CONECTIVIDAD. ")
		
		gu_rf = CREATE rf

		IF gu_rf.of_jerarquia(long(ls_ci),ll_instalacion,ll_instalaciones[],lb_real,ll_salidas_mt[],ll_fases[],ll_ct,ls_fase_suministro, lb_conexion)= 1 THEN 
			
			// Si la clase del aviso es de calidad colgamos los avisos del tipo de avisos de calidad y 
			// si no colgamos los avisos del tipo avisos con alimentaci$$HEX1$$f300$$ENDHEX$$n.
			
			if  is_avisos.gi_ind_calidad = 1 then 
				ll_instalacion_referencia = fgcdec_aviso_de_calidad_con_alim
			else
				ll_instalacion_referencia = fgcdec_aviso_con_alimentacion
			end if
			
			// Insertamos en el array como elemento del que cuelgan todos el tipo que corresponda
			
			ll_instalaciones[upperbound(ll_instalaciones[]) + 1] = ll_instalacion_referencia
			
			if  is_avisos.gi_ind_calidad = 1 then 
				ll_instalaciones[upperbound(ll_instalaciones[]) + 1] = fgcdec_aviso_de_calidad
			end if

			if gb_log_avisos = true then
				for li_conta_log = 1 to upperbound(ll_instalaciones[])
					ls_inst_oop = ls_inst_oop + " " + string(ll_instalaciones[li_conta_log])
				next
				fw_escribe_log_avisos(" JERARQU$$HEX1$$cd00$$ENDHEX$$A MONTADA: " + ls_inst_oop ) 
			end if			
			
			is_avisos.gl_instalaciones = ll_instalaciones
			is_avisos.gl_sal_mt = ll_salidas_mt
			is_avisos.gl_sal_mt_fases = ll_fases
			// Funcion$$HEX2$$f3002000$$ENDHEX$$correctamente, verificamos la situaci$$HEX1$$f300$$ENDHEX$$n real de la red.	
			
			IF lb_real= true then
				is_avisos.gi_tipo_red = 1 // Se tratar$$HEX2$$e1002000$$ENDHEX$$de un aviso ingresado en el estado real de la red
			ELSE
				if lb_conexion then 
					is_avisos.gi_tipo_red = 0 // En este caso el aviso ingresado es un aviso del estado normal de la red
				else
					fw_escribe_log_avisos(" NO HAY CONEXION CON CONECTIVIDAD. " ) 
					is_avisos.gi_tipo_red = 2 // No hay conexion con conectividad
				end if
			END IF
			
			IF gi_pais = 8 then // Si el pais es Moldavia, cargo el $$HEX1$$e100$$ENDHEX$$mbito de los CT. FDO
			
					//AHM (02/03/2010)
					SELECT INSTALACION_ORIGEN
					INTO :ll_instalacionAux
					FROM SGD_ACOMETIDA
					WHERE CODIGO = :ll_instalacion;
					
					IF sqlca.sqlcode = 0 THEN
						ll_acometida = ll_instalacion
						ll_instalacion = ll_instalacionAux
					END IF
					
					SELECT "SGD_INSTALACION"."NRO_CENTRO",   
		  						"SGD_INSTALACION"."NRO_MESA",   
		  						"SGD_INSTALACION"."NRO_CMD"
		  			INTO :li_centro, :li_mesa, :li_cmd 
					  FROM "SGD_INSTALACION"
					WHERE "TIPO_INSTALACION" = 5
					START WITH "NRO_INSTALACION" = :ll_instalacion AND 
								"SGD_INSTALACION"."BDI_JOB" =0 AND
								"SGD_INSTALACION"."ESTADO" = 0 
					CONNECT BY PRIOR "NRO_INST_PADRE" = "NRO_INSTALACION";
					
					IF sqlca.sqlcode = 100 THEN
						SELECT "SGD_INSTALACION"."NRO_CENTRO",   
									"SGD_INSTALACION"."NRO_MESA",   
									"SGD_INSTALACION"."NRO_CMD"
						INTO :li_centro, :li_mesa, :li_cmd
						FROM "SGD_INSTALACION"  
						WHERE "TIPO_INSTALACION" = 5
						START WITH "NRO_INSTALACION" = :ll_instalacion AND 
									"SGD_INSTALACION"."BDI_JOB" =0 AND
									"SGD_INSTALACION"."ESTADO" = 0 
						CONNECT BY PRIOR "NRO_INSTALACION" = "NRO_INST_PADRE"
						USING sqlca;
					END IF
					
					ll_instalacion = ll_acometida
			
			END IF
			
			is_avisos.gl_nro_instalacion = ll_instalacion
			is_avisos.gi_nro_centro = li_centro  
			is_avisos.gi_nro_cmd            = li_cmd  
			is_avisos.gi_nro_mesa   = li_mesa 			
		
		ELSE 
					
			// No funcion$$HEX2$$f3002000$$ENDHEX$$correctamente, El aviso va a ser sin alimentacion

			if  is_avisos.gi_ind_calidad = 1 then 
				ll_instalacion_referencia = fgcdec_aviso_de_calidad_sin_alim
			else
				ll_instalacion_referencia = fgcdec_aviso_sin_alimentacion
			end if
			
			ll_instalaciones[] = ll_instalaciones_nulas[]
			
			is_avisos.gl_instalaciones = ll_instalaciones			
			
			// Pongo a nulo el array para cargar las instalaciones nuevas, la acometida y la gen$$HEX1$$e900$$ENDHEX$$rica sin alimentaci$$HEX1$$f300$$ENDHEX$$n.
						
			ll_instalaciones[upperbound(ll_instalaciones[]) + 1] = ll_instalacion_referencia
			
			if  is_avisos.gi_ind_calidad = 1 then 
				ll_instalaciones[upperbound(ll_instalaciones[]) + 1] = fgcdec_aviso_de_calidad
			end if
			
							
		END IF
		
		if ls_fase_suministro <> '000' and not isnull(ls_fase_suministro) and ls_fase_suministro <> '' and ll_instalacion <> fgcdec_aviso_sin_alimentacion then //utiliza fase del suministro
			
			select "SGD_VALOR"."CODIGO"
			into :li_tipo_conexion
			from "SGD_VALOR"
			where "SGD_VALOR"."CODIF"='FASE' AND
					"SGD_VALOR"."VALOR" = :ls_fase_suministro;
			IF sqlca.SqlCode <> 0 THEN
				fw_escribe_log_avisos(" No se encuentran las fases en SGD_VALOR. " ) 
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al convertir la fase del suministro.")
				return -1
			END IF	
		else
			select "GI_CAMBIO_FORMATO_FASE"."FASE_AFECTADA"
			into :ls_fase_suministro
			from "GI_CAMBIO_FORMATO_FASE"
			where "GI_CAMBIO_FORMATO_FASE"."TIPO_CONEXION"=nvl(:li_tipo_conexion,0) ;
		
			IF sqlca.SqlCode <> 0 THEN
				fw_escribe_log_avisos(" No se encuentran las fases en GI_CAMBIO_FORMATO FASE. " ) 
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al convertir la fase de la acometida.")
				return -1
			END IF	
		end if

		is_avisos.gi_est_aviso = fgci_aviso_pendiente
		
		is_avisos.gs_fase=ls_fase_suministro		

		is_avisos.gl_nro_incidencia = 0
		pl_nro_incid = 0
		
	END IF
	
END IF

// Debo chequear si el aviso es Normal o de Calidad

fw_escribe_log_avisos("")
fw_escribe_log_avisos(" ****************************************************************************************************" )
fw_escribe_log_avisos("")

IF is_avisos.gi_ind_calidad <> 1 THEN

	IF  is_avisos.gl_nro_instalacion <> 0 THEN
		
		FOR li_contador = 1 to upperbound(ll_instalaciones[])
			if ls_instalaciones = "" then
				ls_instalaciones = string(ll_instalaciones[li_contador])
			else 
				ls_instalaciones = ls_instalaciones + "," + string(ll_instalaciones[li_contador])
			end if
		NEXT
		
		
		if gb_red_trifasica = FALSE then
		
			SELECT FASES_NUEVAS 
				INTO :LL_FASE_REFASEO
				FROM OOP_REFASEO
				WHERE CM = :LL_CT;
		
			SELECT NVL(SGD_INSTALACION.TIPO_CT,0), NVL(GI_CAMBIO_FORMATO_FASE.FASE_AFECTADA,'111')
				INTO :li_tipo_ct,:ls_fase_afect
				FROM SGD_INSTALACION, GI_CAMBIO_FORMATO_FASE
				WHERE SGD_INSTALACION.NRO_INSTALACION = :ll_ct AND
							GI_CAMBIO_FORMATO_FASE.TIPO_CONEXION = SGD_INSTALACION.TIPO_CONEXION;
					
		end if
		
		if isnull(ls_fase_afect) or trim(ls_fase_afect) = "" then
			ls_fase_afect = "111"
		end if
		
		DECLARE LC_INTERRUPCIONES DYNAMIC CURSOR FOR SQLSA;
		
		is_sql_statement= "SELECT TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_A,'hh24:mi'), " + &
		"TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_B,'hh24:mi'), " + &
		"TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_C,'hh24:mi'), " + &
		"TO_CHAR(SGD_INTERRUPCION.F_REPOSICION,'hh24:mi'), " + &
		"SGD_INTERRUPCION.TIP_INTERRUPCION, " + &
		"SGD_INTERRUPCION.NRO_INCIDENCIA, " + &
		"SGD_INTERRUPCION.NRO_INSTALACION, " + &
		"SGD_INTERRUPCION.F_REPOSICION_FASE_A, " + &
		"SGD_INTERRUPCION.F_REPOSICION_FASE_B, " + &
		"SGD_INTERRUPCION.F_REPOSICION_FASE_C, " + &
		"SGD_INTERRUPCION.F_REPOSICION, " + &
		"Fgci_int_suministro( " + string(li_tipo_conexion)   + &
		 					" ,F_REPOSICION_FASE_A, "+ &
							" F_ALTA_FASE_A, "+ &
							" F_REPOSICION_FASE_B, "+ &
							" F_ALTA_FASE_B, "+ &
							" F_REPOSICION_FASE_C, " + &
							" F_ALTA_FASE_C, " + &
							" F_REPOSICION," + &
							" F_ALTA," + &
							string(li_tipo_ct) + "," + string(li_tb_dec) + "," + ls_fase_afect + ") DECISION"

		is_sql_statement= is_sql_statement + &
		" FROM SGD_INTERRUPCION  " + &
		" WHERE SGD_INTERRUPCION.NRO_INSTALACION IN (" + ls_instalaciones + ") "
				
	
		is_avisos.gs_fase=ls_fase_suministro			
			
				
		is_sql_statement= is_sql_statement + &
		" AND (((SGD_INTERRUPCION.F_REPOSICION IS NULL AND SGD_INTERRUPCION.F_ALTA IS NOT NULL) OR " + & 
		" SGD_INTERRUPCION.F_REPOSICION + (" + string(li_tiempo_espera) + "/(24*60))  >= SYSDATE)" + &
		" OR SGD_INTERRUPCION.F_REPOSICION_FASE_A + (" + string(li_tiempo_espera) + "/(24*60))  >= SYSDATE  " + &
		"OR SGD_INTERRUPCION.F_REPOSICION_FASE_B + (" + string(li_tiempo_espera) + "/(24*60))  >= SYSDATE " + &
		" OR SGD_INTERRUPCION.F_REPOSICION_FASE_C + (" + string(li_tiempo_espera) + "/(24*60))  >= SYSDATE)"

		
		PREPARE SQLSA FROM :is_sql_statement;
		
		OPEN DYNAMIC LC_INTERRUPCIONES ;
		
//		IF SQLCA.SQLCODE <> 0 THEN
//			Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No se puede abrir el cursor de b$$HEX1$$fa00$$ENDHEX$$squeda de interrupciones",information!,ok!)
//			return -1
//		END IF


		FETCH LC_INTERRUPCIONES 
		INTO :ls_h_rep_a,
				 :ls_h_rep_b,
				 :ls_h_rep_c,
				 :ls_h_rep,
				 :ls_t_interrupcion,
				 :ll_incidencia,
				 :ll_inst_int,
				 :ldt_f_rep_fase_a,
				 :ldt_f_rep_fase_b,
				 :ldt_f_rep_fase_c,
				 :ldt_f_rep,
				 :ls_ind_dec;
		
//		IF SQLCA.SQLCODE < 0 THEN
//			Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Error al recuperar el cursor de b$$HEX1$$fa00$$ENDHEX$$squeda de interrupciones.",information!,ok!)
//			return -1
//		END IF

		
		DO WHILE SQLCA.SQLCODE = 0 
			
			IF ls_ind_dec = '1' THEN
				// Esto significa que la interrupcion est$$HEX2$$e1002000$$ENDHEX$$abierta
				is_avisos.gl_nro_incidencia = ll_incidencia
				is_avisos.gi_est_aviso = fgci_aviso_asociado
				is_avisos.gl_instalacion_int = ll_inst_int
				pl_nro_incid = ll_incidencia
				
				CLOSE LC_INTERRUPCIONES;
				
				param_nro_incidencia = ll_incidencia
				li_devuelve =  2
				
				RETURN li_devuelve
				
			ELSEIF ls_ind_dec <> '0' THEN
				
				is_avisos.gi_est_aviso = fgci_aviso_pendiente
				gu_comunic1.is_comunic.longval1= pl_nis
				gu_comunic1.is_comunic.longval2= ll_incidencia
				gu_comunic1.is_comunic.strval1= ps_nombre
				
				Select to_date(:ls_ind_dec,'DD/MM/YYYY hh24:mi:ss') into :ldt_f_res from dual;
				Select to_char(:ldt_f_res,'hh24:mi:ss') into :gu_comunic1.is_comunic.strval2 from dual;					
				
				gu_comunic1.is_comunic.strval3= string(li_tiempo_espera)
				is_avisos.gl_nro_incidencia = ll_incidencia
				pl_nro_incid = ll_incidencia

					
				IF is_avisos.gs_ventana_carga <> "w_2309" AND & 
					is_avisos.gs_ventana_carga <> "C_ALIM" AND is_avisos.gs_ventana_carga <> "w_anul" THEN
					//GNU 26-10-2005. Mejora: 1/335502
					if fg_verifica_parametro('NIC') then
						SELECT NIC
						INTO :gu_comunic1.is_comunic.longval1
						FROM SUMCON
						WHERE NIS_RAD= :pl_nis;
					end if
					//FIN GNU
				
						Open(w_1202_inf_aviso_resuelto)
						
						if message.doubleparm = 1 then
							is_avisos.gl_nro_incidencia = 0
							is_avisos.gi_est_aviso = fgci_aviso_pendiente
							is_avisos.gl_instalacion_int = 0
							pl_nro_incid = 0
							pb_incidencia_pos= false		
							
							li_devuelve  = 1
							CLOSE LC_INTERRUPCIONES;
							
							return li_devuelve
						elseif  message.doubleparm = 2 then
							 is_avisos.gdt_f_res = ldt_f_res
							is_avisos.gd_f_alta =  ldt_f_res
							is_avisos.gl_nro_incidencia = ll_incidencia
							is_avisos.gi_est_aviso = fgci_aviso_resuelto
							is_avisos.gl_instalacion_int = ll_inst_int
							pl_nro_incid = ll_incidencia
							pb_incidencia_pos= true	
			
							CLOSE LC_INTERRUPCIONES;
							
							param_nro_incidencia = ll_incidencia
							li_devuelve = 3
							
							return li_devuelve
						end if		
				ELSE
					
					if is_avisos.gs_ventana_carga <> "w_anul" then 

						Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n que ha escogido tiene la incidencia " + string(ll_incidencia) + &
									 " asociada, esta incidencia acaba de pasar a servicio repuesto con lo que tambi$$HEX1$$e900$$ENDHEX$$n se resolver$$HEX2$$e1002000$$ENDHEX$$el aviso.")
					end if
					
					CLOSE LC_INTERRUPCIONES;
					
					param_nro_incidencia = ll_incidencia
					li_devuelve = 3
					
					RETURN li_devuelve
					
				END IF
					
			END IF
			
			FETCH LC_INTERRUPCIONES 
			INTO :ls_h_rep_a,
					 :ls_h_rep_b,
					 :ls_h_rep_c,
					 :ls_h_rep,
					 :ls_t_interrupcion,
					 :ll_incidencia,
					 :ll_inst_int,
					 :ldt_f_rep_fase_a,
					 :ldt_f_rep_fase_b,
					 :ldt_f_rep_fase_c,
					 :ldt_f_rep,
					 :ls_ind_dec;
		
		LOOP
		// **** LSH **** INI **** DDAG-2020 **** 31/07/2015 ****
		CLOSE LC_INTERRUPCIONES;
		// **** LSH **** FIN **** DDAG-2020 **** 31/07/2015 ****
	END IF

END IF
// **** LSH **** INI **** DDAG-2020 **** 31/07/2015 ****
//CLOSE LC_INTERRUPCIONES;
// **** LSH **** FIN **** DDAG-2020 **** 31/07/2015 ****
//AHU

fuo_avisosSuministros(li_tiempo_espera, pl_nis, ps_nombre, pl_nro_incid, pb_incidencia_pos)

//FIN AHU
param_nro_incidencia = ll_incidencia
RETURN li_devuelve

end function

public function long fpr_v_aviso_pendiente (ref long pl_ex_avi_pend, long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_v_aviso_pendiente
//
// Objetivo:    Verifico la existencia de un aviso pendiente para el
//                                      suministro pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pi_ex_avi_pend (cargo si existe aviso pendiente o n$$HEX1$$f300$$ENDHEX$$)
//                                      pl_nis                  (id. del suministro a verificar)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (existe aviso pendiente o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      22/04/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Leo Avisos por Nis_Rad
// Si Avisos.estado = Pendiente (1)
// est:Existe_Aviso_Pendiente = 1
// Y guardo el nro. del aviso

int li_avi_res


SetPointer(HourGlass!)


li_avi_res = fgci_aviso_resuelto

// GNU 21-6-2007. Incidencia 0/513806
//SELECT DISTINCT "GI_AVISOS"."NRO_AVISO"
//INTO :pl_ex_avi_pend
//FROM "GI_AVISOS"
//WHERE ( "GI_AVISOS"."NIS_RAD" = :pl_nis ) AND  
//      NOT ( "GI_AVISOS"."EST_AVISO" = :li_avi_res ) AND
//		( "GI_AVISOS"."IND_IMPROCEDENTE" = 0)
//USING sqlca;
SELECT DISTINCT "GI_AVISOS"."NRO_AVISO"
INTO :pl_ex_avi_pend
FROM "GI_AVISOS"
WHERE ( "GI_AVISOS"."NIS_RAD" = :pl_nis ) AND  
      ( "GI_AVISOS"."EST_AVISO" <:li_avi_res ) AND
		( "GI_AVISOS"."IND_IMPROCEDENTE" = 0)
USING sqlca;
// FIN GNU


IF sqlca.SqlCode = 0 THEN
	RETURN pl_ex_avi_pend
ELSEIF sqlca.SqlCode = 100 THEN
	RETURN 0
ELSE
	gnv_msg.f_mensaje("ER03","~n"+sqlca.SqlErrText,"",OK!)
	RETURN -1
END IF


 
end function

public function long fpr_v_aviso_pendiente (ref long pl_ex_avi_pend, long pl_nis, boolean pb_ind_calidad, ref long pl_nro_incidencia, ref integer pi_est_aviso);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_v_aviso_pendiente
//
// Objetivo:    Verifico la existencia de un aviso pendiente para el
//                                      suministro pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pi_ex_avi_pend (cargo si existe aviso pendiente o n$$HEX1$$f300$$ENDHEX$$)
//                                      pl_nis                  (id. del suministro a verificar)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (existe aviso pendiente o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      22/04/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Leo Avisos por Nis_Rad
// Si Avisos.estado = Pendiente (1)
// est:Existe_Aviso_Pendiente = 1
// Y guardo el nro. del aviso

int li_avi_res

int li_ind_calidad

if pb_ind_calidad then li_ind_calidad=1;

SetPointer(HourGlass!)

//if li_ind_calidad=0 then
	li_avi_res = fgci_aviso_resuelto
//else
//	li_avi_res = fgci_aviso_asociado
//end if

SELECT DISTINCT "GI_AVISOS"."NRO_AVISO",
"GI_AVISOS"."NRO_INCIDENCIA","GI_AVISOS"."EST_AVISO" //DBE 02/03/2000
INTO :pl_ex_avi_pend, :pl_nro_incidencia , :pi_est_aviso
FROM "GI_AVISOS"
WHERE ( "GI_AVISOS"."NIS_RAD" = :pl_nis ) AND  
      NOT ( "GI_AVISOS"."EST_AVISO" >= :li_avi_res ) AND
		( "GI_AVISOS"."IND_IMPROCEDENTE" = 0)
		and "GI_AVISOS"."IND_CALIDAD" = :li_ind_calidad //DBE 02/03/2000
USING sqlca;


IF sqlca.SqlCode = 0 THEN
	RETURN pl_ex_avi_pend
ELSEIF sqlca.SqlCode = 100 THEN
	RETURN 0
ELSE
	gnv_msg.f_mensaje("ER03","~n"+sqlca.SqlErrText,"",OK!)
	RETURN -1
END IF


 
end function

public function integer fpr_v_aviso_ayuda (ref datawindow pdw_cli, ref datawindow pdw_dir, ref datawindow pdw_avi, multilineedit psle_esq, singlelineedit psle_tel, long pl_nro_aviso, integer pi_clase_avi);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_v_aviso_ayuda
//
// Objetivo:    Carga en la estructura de avisos los datos que traen
//                                      cargados los par$$HEX1$$e100$$ENDHEX$$metros, y algunos que calcula en base a 
//                                      los anteriores, valid$$HEX1$$e100$$ENDHEX$$ndolos.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pdw_cli (datawindow con la informaci$$HEX1$$f300$$ENDHEX$$n del cliente)
//                                      pdw_dir (datawindow con la inf. de la direcci$$HEX1$$f300$$ENDHEX$$n)        
//                                      pdw_avi (datawindow con la inf. resumen del aviso)
//                                      psle_esq (Campo con la Esquina/Condominio)
//                                      psle_tel (Campo con el tel$$HEX1$$e900$$ENDHEX$$fono del cliente)
//                                      pi_nro_aviso (Nro. del aviso asignado)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (correcto o err$$HEX1$$f300$$ENDHEX$$neo)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      14/04/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_prov, ls_munic, ls_local, ls_depto, ls_programa
decimal{0} ldec_nro_inst_ayu, ldec_nro_inst_alum
datetime ldt_fecha
int li_ccm

SetPointer(HourGlass!)


ldt_fecha                        = fgnu_fecha_actual()

//ldt_fecha                        = today()
ls_programa                      = "v_avi_ayuda"
ldec_nro_inst_ayu  = fgcdec_aviso_de_ayuda
ldec_nro_inst_alum = fgcdec_aviso_alumbrado_publico


is_avisos.gs_nom_prov  = pdw_dir.GetItemString(1,"provincia")
is_avisos.gs_nom_depto = pdw_dir.GetItemString(1,"depto")
is_avisos.gs_nom_munic = pdw_dir.GetItemString(1,"municipio")
is_avisos.gs_nom_loc      = pdw_dir.GetItemString(1,"localidad")

IF Len(String(parnum2)) <= 3 THEN
	is_avisos.gi_cod_prov   = parnum2
END IF

is_avisos.gi_cod_depto  = parnum3
is_avisos.gl_cod_munic  = parnum4
is_avisos.gl_cod_loc    = parnum5

IF NOT IsNull(pdw_dir.GetItemString(1,"duplic")) AND&
		pdw_dir.GetItemString(1,"duplic") <> "" THEN
	is_avisos.gs_duplicador = pdw_dir.GetItemString(1,"duplic")
ELSE
	is_avisos.gs_duplicador = " "
END IF
IF NOT IsNull(pdw_dir.GetItemString(1,"numero")) AND&
		pdw_dir.GetItemString(1,"numero") <> "" THEN
	is_avisos.gl_num_puerta = Integer(pdw_dir.GetItemString(1,"numero"))
ELSE
	is_avisos.gl_num_puerta = 0
END IF
IF NOT IsNull(pdw_dir.GetItemString(1,"calle")) AND&
		pdw_dir.GetItemString(1,"calle") <> "" THEN
	is_avisos.gs_nom_calle = pdw_dir.GetItemString(1,"calle")
	//is_avisos.gl_cod_calle = is_direccion.gl_codcalle
ELSE
	is_avisos.gs_nom_calle = " "
END IF
IF NOT psle_esq.text = "" THEN
	is_avisos.gs_esquina = psle_esq.text
ELSE
	is_avisos.gs_esquina = " "
END IF

is_avisos.gl_nro_aviso = pl_nro_aviso
is_avisos.gs_usuario = gs_usuario
is_avisos.gd_f_actual = ldt_fecha
is_avisos.gs_programa = ls_programa
is_avisos.gl_nis_rad = 0
is_avisos.gl_nro_brigada = 0

IF NOT IsNull(pdw_cli.GetItemString(1,"nombre")) AND&
		pdw_cli.GetItemString(1,"nombre") <> "" THEN
	is_avisos.gs_nombre = pdw_cli.GetItemString(1,"nombre")
ELSE
	is_avisos.gs_nombre = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"ap1")) AND&
		pdw_cli.GetItemString(1,"ap1") <> "" THEN
	is_avisos.gs_ape1 = pdw_cli.GetItemString(1,"ap1")
ELSE
	is_avisos.gs_ape1 = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"ap2")) AND&
		pdw_cli.GetItemString(1,"ap2") <> "" THEN
	is_avisos.gs_ape2 = pdw_cli.GetItemString(1,"ap2")
ELSE
	is_avisos.gs_ape2 = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"doc_id")) AND&
		pdw_cli.GetItemString(1,"doc_id") <> "" THEN
	is_avisos.gs_doc_id = pdw_cli.GetItemString(1,"doc_id")
ELSE
	is_avisos.gs_doc_id = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"tip_doc")) AND&
		pdw_cli.GetItemString(1,"tip_doc") <> "" THEN
	is_avisos.gs_tip_doc = pdw_cli.GetItemString(1,"tip_doc")
ELSE
	is_avisos.gs_tip_doc = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"co_pais")) AND&
		pdw_cli.GetItemString(1,"co_pais") <> "" THEN
	is_avisos.gs_co_pais = pdw_cli.GetItemString(1,"co_pais")
ELSE
	is_avisos.gs_co_pais = " "
END IF
IF NOT IsNull(psle_tel.text) AND psle_tel.text <> "" THEN
	is_avisos.gs_tfno_cli = psle_tel.text
ELSE
	is_avisos.gs_tfno_cli = "0"
END IF
IF NOT IsNull(pdw_avi.GetItemNumber(1,"co_alcance")) THEN
	is_avisos.gi_co_alcance = pdw_avi.GetItemNumber(1,"co_alcance")
ELSE
	is_avisos.gi_co_alcance = 1
END IF
IF NOT IsNull(pdw_avi.GetItemNumber(1,"tip_aviso")) THEN
	is_avisos.gi_tip_aviso = pdw_avi.GetItemNumber(1,"tip_aviso")
ELSE
	is_avisos.gi_tip_aviso = 1
END IF

IF NOT IsNull(pdw_avi.GetItemdatetime(1,"fecha_problema")) THEN
	is_avisos.gdt_f_problema = pdw_avi.GetItemdatetime(1,"fecha_problema")
ELSE
	setnull(is_avisos.gdt_f_problema)
END IF

IF NOT IsNull(pdw_avi.GetItemString(1,"obs_telegestiones")) THEN
	is_avisos.gs_obs_telegestiones = pdw_avi.GetItemString(1,"obs_telegestiones")
ELSE
	is_avisos.gs_obs_telegestiones = " "
END IF
is_avisos.gi_ind_peligro = fpr_o_indice_de_peligro(is_avisos.gi_tip_aviso)
IF is_avisos.gi_ind_peligro = 1 THEN
	is_avisos.gi_prioridad = fgci_prioridad_media
ELSEIF is_avisos.gi_ind_peligro = 0 THEN
	is_avisos.gi_prioridad = fgci_prioridad_baja
END IF
is_avisos.gd_f_alta = ldt_fecha
is_avisos.gi_est_aviso = fgci_aviso_pendiente
is_avisos.gs_obs_cmd = " "
is_avisos.gi_ind_ayuda = pi_clase_avi
IF pi_clase_avi = 1 THEN
	is_avisos.gl_nro_instalacion = ldec_nro_inst_ayu  
ELSEIF pi_clase_avi = 2 THEN
	is_avisos.gl_nro_instalacion = ldec_nro_inst_alum
END IF
is_avisos.gs_cgv_sum = " "
is_avisos.gi_ind_cli_imp = 0
is_avisos.gl_nro_incidencia = 0

li_ccm = This.fpr_o_centro_cmd_mesa(is_avisos.gi_nro_centro,is_avisos.gi_nro_cmd,&
		is_avisos.gi_nro_mesa,is_avisos.gl_cod_loc) 
IF li_ccm = 0 THEN
	RETURN 0
ELSEIF li_ccm = -1 THEN
	RETURN -1
END IF

is_avisos.gi_nro_telegestiones = gi_nro_centro
is_avisos.gi_ind_improcedente = 0
is_avisos.gs_nro_telefonista = gs_usuario


is_avisos.gi_cod_hor = fgrn_intervalo_horario(ldt_fecha)
IF is_avisos.gi_cod_hor = -1 THEN
	gnv_msg.f_mensaje("ER59","","",OK!)
	RETURN -1
END IF
SetNull(is_avisos.gdt_f_res)


RETURN 1
end function

public function integer fuo_avisossuministros (long pl_tiempo, long pl_nis, string ps_nombre, ref long pl_nroincidencia, ref boolean pb_incidenciapos);/********************************************************************************************************************************
Funci$$HEX1$$f300$$ENDHEX$$n    : fuo_avisosSuministros()
Descripcion: Busca si un NIS ha tenido un aviso anterior resuelto en menos de un determinado tiempo, y le ingresa como improcedente si el usuario quiere
Argumentos : pl_tiempo -> Tiempo m$$HEX1$$e100$$ENDHEX$$ximo que debe haber trancurrido desde la resoluci$$HEX1$$f300$$ENDHEX$$n del aviso
				 pl_nis	  -> NIS del que se busca el aviso anterior resuelto
				 ps_nombre ->
Devuelve	  : 1 -> No se ha encontrado aviso anterior o no se ha marcado como improcedente
				 3 -> Se ha marcado como improcedente
				-1 -> Error
				
				Fecha				Usuario				Acci$$HEX1$$f300$$ENDHEX$$n
       --------------------------------------------------
         12/02/2009         AHU              Creaci$$HEX1$$f300$$ENDHEX$$n
			
*********************************************************************************************************************************/

dateTime	ldt_fechaActual		//Fecha actual del sistema
dateTime ldt_fechaResolucion	//Fecha de resoluci$$HEX1$$f300$$ENDHEX$$n del aviso
int		li_retorno				//Valor que devuelve la funci$$HEX1$$f300$$ENDHEX$$n
long		ll_nroIncidencia		//N$$HEX1$$fa00$$ENDHEX$$mero de incidencia a la que el aviso ha sido asociado
long		ll_nroOT					//N$$HEX1$$fa00$$ENDHEX$$mero de OT a la que el aviso ha sido asociado
long		ll_nroAviso				//N$$HEX1$$fa00$$ENDHEX$$mero del aviso
string	ls_sentencia			//Sentencia que va a definir el cursor de avisos


li_retorno = 1

ldt_fechaActual = fgnu_fecha_actual()

fw_escribe_log_avisos(" BUSQUEDA AVISO CON IGUAL NIS: " + string(pl_nis))

//AHM Incidencia 0/100117405
//Buscamos si el mismo nis ha tenido un aviso resuelto hace poco en un tiempo menor que el establecido en sgd_valor, los avisos que buscamos son normales o de calidad
ls_sentencia = " SELECT NRO_INCIDENCIA, "
ls_sentencia += " NRO_OT, "
ls_sentencia += " NRO_AVISO, "
ls_sentencia += " FECHA_RES "
ls_sentencia += " FROM GI_AVISOS "
ls_sentencia += " WHERE NIS_RAD = " + string(pl_nis)				
ls_sentencia += " AND (FECHA_RES + (" + string(pl_tiempo/(24*60)) + ")) >= SYSDATE"
ls_sentencia += " AND CLASE_AVISO IN (3 , 0)"
ls_sentencia += " AND EST_AVISO = 5"
ls_sentencia += " AND NRO_INCIDENCIA NOT IN (SELECT NRO_INCIDENCIA FROM SGD_INTERRUPCION) "

DECLARE lc_avisos DYNAMIC CURSOR FOR SQLSA;
PREPARE SQLSA FROM :ls_sentencia;
		
fw_escribe_log_avisos(" APERTURA DEL CURSOR DE AVISOS")
OPEN DYNAMIC lc_avisos;


IF SQLCA.SQLCODE <> 0 THEN
	
	li_retorno = -1 
	
ELSE


	FETCH lc_avisos
	INTO  :ll_nroIncidencia,
			:ll_nroOt,
		   :ll_nroAviso,
			:ldt_fechaResolucion;
			
	DO WHILE SQLCA.SQLCODE = 0 
		fw_escribe_log_avisos(" SE HAN ENCONTRADO DATOS")
		is_avisos.gi_est_aviso = fgci_aviso_pendiente
		gu_comunic1.is_comunic.longval1= pl_nis
		gu_comunic1.is_comunic.longval2= ll_nroAviso
		gu_comunic1.is_comunic.strval1= ps_nombre
		gu_comunic1.is_comunic.strval2= string(ldt_fechaResolucion, 'dd/mm/yyyy hh:mm:ss')
		
//				Select to_date(:ls_ind_dec,'DD/MM/YYYY hh24:mi:ss') into :ldt_f_res from dual;
//				Select to_char(:ldt_f_res,'hh24:mi:ss') into :gu_comunic1.is_comunic.strval2 from dual;					
//		SELECT to_date(:ldt_fechaResolucion,'DD/MM/YYYY hh24:mi:ss') INTO :ldt_fechaResolucion FROM dual;
		SELECT to_char(:ldt_fechaResolucion,'dd/mm/yyyy hh24:mi:ss') INTO :gu_comunic1.is_comunic.strval2 FROM dual;					

		SELECT sysdate
		INTO :ldt_fechaActual
		FROM DUAL;
		
		gu_comunic1.is_comunic.strval3= string(pl_tiempo)
		is_avisos.gl_nro_incidencia = 0
//		is_avisos.gl_nro_incidencia = ll_nroIncidencia
		pl_nroIncidencia = 0

			
		IF is_avisos.gs_ventana_carga <> "w_2309" AND & 
			is_avisos.gs_ventana_carga <> "C_ALIM" AND is_avisos.gs_ventana_carga <> "w_anul" THEN
			IF fg_verifica_parametro('NIC') THEN
				SELECT NIC
				INTO :gu_comunic1.is_comunic.longval1
				FROM SUMCON
				WHERE NIS_RAD= :pl_nis;
			END IF
		
			openWithParm(w_1202_inf_aviso_resuelto, 1)
				
			IF message.doubleparm = 1 THEN
					is_avisos.gl_nro_incidencia = 0
					is_avisos.gl_nro_ot = ll_nroOt
					is_avisos.gi_est_aviso = fgci_aviso_pendiente
					is_avisos.gl_instalacion_int = 0
					pl_nroIncidencia = 0
					pb_incidenciaPos= FALSE		
					
					li_retorno  = 1
					
					fw_escribe_log_avisos(" AVISO PENDIENTE")
					
					CLOSE lc_avisos;
					
					fw_escribe_log_avisos(" CIERRE DEL CURSOR")
					
					RETURN li_retorno
			ELSEIF message.doubleparm = 2 THEN
				
					is_avisos.gdt_f_res = ldt_fechaActual
					is_avisos.gd_f_alta = ldt_fechaActual
					is_avisos.gl_nro_ot = ll_nroOt
					IF ll_nroOt > 0 THEN
						is_avisos.gl_nro_incidencia = 1
						pl_nroIncidencia = 1
					ELSE
						is_avisos.gl_nro_incidencia = ll_nroIncidencia
						pl_nroIncidencia = ll_nroIncidencia
					END IF
					is_avisos.gi_est_aviso = fgci_aviso_improcedente
					is_avisos.gl_instalacion_int = 0
					
//					pl_nroIncidencia = 0
					pb_incidenciaPos= TRUE	
				
					fw_escribe_log_avisos(" AVISO IMPROCEDENTE")
					
					CLOSE lc_avisos;
					
					fw_escribe_log_avisos(" CIERRE DEL CURSOR")
					
					li_retorno = 3
					
					RETURN li_retorno
				END IF
							
		END IF
	
		FETCH lc_avisos
		INTO  :ll_nroIncidencia,
				:ll_nroOt,
				:ll_nroAviso,
				:ldt_fechaResolucion;
	
	LOOP
	
END IF

CLOSE lc_avisos;

fw_escribe_log_avisos(" NO SE HAN ENCONTRADO AVISOS")

RETURN li_retorno





end function

public function integer uf_finalizaraviso (long pl_nroaviso);/**********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n: Finalizaci$$HEX1$$f300$$ENDHEX$$n del aviso															 */
/* Par$$HEX1$$e100$$ENDHEX$$metros : -																						 */
/* Devuelve   : -1 Error																			 */
/*               0 Correcto																		 */
/*            Autor 					Fecha					Acci$$HEX1$$f300$$ENDHEX$$n					 		 	 */
/*            AHM               12/01/2010   Creaci$$HEX1$$f300$$ENDHEX$$n (Incidencia 0/100157617)	 */
/**********************************************************************************/

il_nroAviso = pl_nroAviso


RETURN triggerEvent("ue_finalizarAviso")
end function

public function integer fpr_avisos_instalacion (integer pi_clase_aviso);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_avisos_instalacion
//
// Objetivo:    Implementa una conexi$$HEX1$$f300$$ENDHEX$$n con conectividad para 
//				  que devuelva la jerarqu$$HEX1$$ed00$$ENDHEX$$a en el Estado Real de la red.
//				  Dicha jerarqu$$HEX1$$ed00$$ENDHEX$$a se grabara en la tabla gi_avisos_instalacion.
//				  Si no grabara la jerarqu$$HEX1$$ed00$$ENDHEX$$a real, grabar$$HEX2$$e1002000$$ENDHEX$$la normal.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:     Pi_clase_aviso
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  	Fecha         Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// 	---------    			-------         	----------------------------------------
//	24/01/2001		FDO			Creaci$$HEX1$$f300$$ENDHEX$$n.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_incidencia,ll_instalacion,ll_posicion_busqueda,ll_instalacion_referencia,ll_padre,ll_ind_incidencia=0,ll_ind_ot=0,ll_ct,ll_cant_avisos,ll_subestac
datetime  ldt_fecha_actual
string ls_ci,ls_nombre_instalacion,ls_nom_ct,ls_fase,ls_mensaje
int li_contador,li_tipo_instalacion,li_centro,li_mesa,li_cmd,li_ind_red,li_tipo_inst,li_ind_smt,li_ind_instal,li_tipo_ct,li_tip_ct,li_tension

ldt_fecha_actual = fgnu_fecha_actual()
ll_instalacion = is_avisos.gl_nro_instalacion   

IF is_avisos.gi_est_aviso = fgci_aviso_resuelto then return 1

IF gb_red_trifasica = TRUE then
	
	is_avisos.gs_fase = '111'
	ls_fase = '111'
	
ELSE
	
	IF 	ll_instalacion = fgcdec_aviso_sin_alimentacion OR &
		ll_instalacion = fgcdec_aviso_de_ayuda OR &
		ll_instalacion = fgcdec_aviso_alumbrado_publico OR &
		ll_instalacion = fgcdec_aviso_de_calidad_sin_alim THEN
		
		is_avisos.gs_fase = '111'
		ls_fase = '111'
		
	END IF
	
END IF

// Puntero a "reloj de arena"
SetPointer(HourGlass!)

//	 Ahora que se dispone de los datos necesarios intento la conexi$$HEX1$$f300$$ENDHEX$$n con conectividad. 
//   Primero chequeamos Si el aviso es con alimentaci$$HEX1$$f300$$ENDHEX$$n. Ya sea de Calidad o Normal.

IF ll_instalacion <> fgcdec_aviso_sin_alimentacion AND &
	ll_instalacion <> fgcdec_aviso_de_ayuda AND &
	ll_instalacion <> fgcdec_aviso_alumbrado_publico AND &
	ll_instalacion <> fgcdec_aviso_de_calidad_sin_alim THEN //DBE 03/03/2000

	ls_nombre_instalacion = "ACOMETIDA - " + string(ll_instalacion)
	
	// Ingresamos la acometida que no devuelve la funci$$HEX1$$f300$$ENDHEX$$n dentro de la tabla Gi_avisos_instalacion
	
	  INSERT INTO "GI_AVISOS_INSTALACION"  
				( "F_ACTUAL",   
				  "USUARIO",   
				  "PROGRAMA",   
				  "TIPO_INSTALACION",   
				  "NRO_AVISO",   
				  "NRO_INSTALACION",   
				  "NRO_INST_PADRE",  
				  "EST_AVISO",   
				  "TIPO_AVISO",   
				  "NRO_ZONA",   
				  "NRO_CMD",   
				  "NRO_SECTOR",   
				  "F_ALTA",   
				  "IND_RED",   
				  "FASE",   
				  "CLASE_AVISO",   
				  "NOM_INSTALACION",
				  "TENSION",
				  "CO_ALCANCE")  
	  VALUES ( 
				  :ldt_fecha_actual,   
				  :gs_usuario,   
				  'w_1201',   
				  :fgci_tipo_acometida,   
				  :is_avisos.gl_nro_aviso,   
				  :ll_instalacion,   
				  :is_avisos.gl_instalaciones[1],   
				  :is_avisos.gi_est_aviso,   
				  :is_avisos.gi_tip_aviso,   
				  :is_avisos.gi_nro_centro,
				  :is_avisos.gi_nro_cmd,     
				  :is_avisos.gi_nro_mesa,   
				  :is_avisos.gd_f_alta,   
				  :is_avisos.gi_tipo_red,   
				  :is_avisos.gs_fase,   
				  :pi_clase_aviso,
				  :ls_nombre_instalacion,
				  3,
				  :is_avisos.gi_co_alcance)  ;

	IF sqlca.sqlcode<> 0 then
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ingresar la informaci$$HEX1$$f300$$ENDHEX$$n de la acometida: " + sqlca.sqlerrtext ,information!,ok!)
		Return -1
	END IF
	
ELSE
	
	is_avisos.gl_instalaciones[Upperbound(is_avisos.gl_instalaciones[]) +1] = ll_instalacion
		
	IF ll_instalacion = fgcdec_aviso_de_calidad_sin_alim THEN
		//AHM ASUR 623684
//		is_avisos.gl_instalaciones[Upperbound(is_avisos.gl_instalaciones[]) +1] = fgcdec_aviso_de_calidad
	END IF

END IF

For li_contador = 1 to Upperbound(is_avisos.gl_instalaciones[]) 
	
	
	IF  is_avisos.gi_ind_calidad = 1 then
	
	  SELECT MIN("SGD_INCIDENCIA"."NRO_INCIDENCIA")  
    		INTO :ll_ind_incidencia
    		FROM "SGD_INCIDENCIA"  
   		WHERE ( "SGD_INCIDENCIA"."EST_ACTUAL" < :fgci_incidencia_servicio_repuesto ) AND  
        				( "SGD_INCIDENCIA"."TIP_INCIDENCIA" = :fgci_incidencia_calidad ) AND  
         			( "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :is_avisos.gl_instalaciones[li_contador] )   ;
						
	ELSE
		
	  SELECT MIN("SGD_INCIDENCIA"."NRO_INCIDENCIA")  
    		INTO :ll_ind_incidencia
    		FROM "SGD_INCIDENCIA"  
   		WHERE ( "SGD_INCIDENCIA"."EST_ACTUAL" < :fgci_incidencia_servicio_repuesto ) AND  
        				( "SGD_INCIDENCIA"."TIP_INCIDENCIA" <> :fgci_incidencia_calidad ) AND  
         			( "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :is_avisos.gl_instalaciones[li_contador] )   ;

	END IF

	IF NOT ISNULL(ll_ind_incidencia) then
		ll_ind_incidencia = 1
	ELSE
		ll_ind_incidencia = 0
	END IF
	
	IF is_avisos.gl_instalaciones[li_contador] = is_avisos.gl_instalacion_int THEN
		li_ind_instal = 1 
	ELSE
		li_ind_instal = 0
	END IF
	
	SELECT MIN("GI_OT"."NRO_OT")  
   		INTO :ll_ind_ot
    		FROM "GI_OT"  
   		WHERE ( "GI_OT"."EST_OT" < 3 ) AND  
        				( "GI_OT"."NRO_INCIDENCIA" = 0 ) AND  
         			( "GI_OT"."NRO_INSTALACION" = :is_avisos.gl_instalaciones[li_contador] )   ;
	
	IF NOT ISNULL(ll_ind_ot) then
		ll_ind_ot = 1
	ELSE
		ll_ind_ot = 0
	END IF
	
	IF li_contador = (Upperbound(is_avisos.gl_instalaciones[]))  then 
		ll_padre = 0
		ELSE
		ll_padre= is_avisos.gl_instalaciones[li_contador + 1]
	END IF
	
	// Trabajamos con la Situaci$$HEX1$$f300$$ENDHEX$$n Real de la Red
	
	SELECT "SGD_INSTALACION"."TIPO_INSTALACION",
				"SGD_INSTALACION"."NOM_INSTALACION",
				"SGD_INSTALACION"."NRO_CENTRO",
				"SGD_INSTALACION"."NRO_CMD",
				"SGD_INSTALACION"."NRO_MESA",
				"SGD_INSTALACION"."TIPO_CT",
				"SGD_INSTALACION"."TENSION"
	INTO :li_tipo_instalacion,:ls_nombre_instalacion,:li_centro,:li_cmd,:li_mesa,:li_tip_ct,:li_tension
	FROM "SGD_INSTALACION"
	WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :is_avisos.gl_instalaciones[li_contador];
	
	IF li_tipo_instalacion = fgci_tipo_ct and is_avisos.gi_est_aviso = fgci_aviso_pendiente and gi_pais <> 8  then
		
		select count(*) 
		into :ll_cant_avisos
		from gi_avisos_instalacion 
		where nro_instalacion = :is_avisos.gl_instalaciones[li_contador];
		
//		IF gb_operaciones =  true and ll_cant_avisos = 0 then
//			
//			gu_rf_servidor_operacion.of_tool_aviso(is_avisos.gl_instalaciones[li_contador],is_avisos.gd_f_alta,1,ls_mensaje,gi_ci_ct)
//			
//			IF ls_mensaje <> "" then
//				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo dar de alta el tool en Operaci$$HEX1$$f300$$ENDHEX$$n, pero se ingresa el aviso: " + ls_mensaje,information!,ok!)
//			END IF	
//
//		END IF
		
		li_tipo_ct = li_tip_ct
		ll_ct = is_avisos.gl_instalaciones[li_contador]
		ls_nom_ct = ls_nombre_instalacion
		if Upperbound(is_avisos.gl_sal_mt[])> 1 then 
			li_ind_smt = 1
		else
			setnull(li_ind_smt)
		end if
	ELSEIF li_tipo_instalacion = fgci_tipo_subestacion and is_avisos.gi_est_aviso = fgci_aviso_pendiente and gi_pais = 8 then // subestaciones moldavia
		if Upperbound(is_avisos.gl_sal_mt[])> 1 then 
			li_ind_smt = 1
		else
			setnull(li_ind_smt)
		end if
	ELSE
		setnull(li_ind_smt)
	END IF
	
	IF li_tipo_instalacion = fgci_tipo_subestacion and is_avisos.gi_est_aviso = fgci_aviso_pendiente then
		ll_subestac =  is_avisos.gl_instalaciones[li_contador]
	END IF

	INSERT INTO "GI_AVISOS_INSTALACION"  
		( "F_ACTUAL",   
		  "USUARIO",   
		  "PROGRAMA",   
		  "TIPO_INSTALACION",   
		  "NRO_AVISO",   
		  "NRO_INSTALACION",   
		  "NRO_INST_PADRE",  
		  "EST_AVISO",   
		  "TIPO_AVISO",   
		  "NRO_ZONA",   
		  "NRO_CMD",   
		  "NRO_SECTOR",   
		  "F_ALTA",   
		  "IND_RED",   
		  "FASE",   
		  "CLASE_AVISO",   
		  "NOM_INSTALACION",
		  "IND_INCIDENCIA",
		  "NRO_OT",
		  "IND_OTRAS_SMT",
		  "INSTALACION_CON_INT",
		  "TIPO_CT",
		  "TENSION",
		  "CO_ALCANCE")  
  VALUES ( 
			  :ldt_fecha_actual,   
			  :gs_usuario,   
			  'w_1201',   
			  :li_tipo_instalacion,   
			  :is_avisos.gl_nro_aviso,   
			  :is_avisos.gl_instalaciones[li_contador],   
			  :ll_padre,   
			  :is_avisos.gi_est_aviso,   
			  :is_avisos.gi_tip_aviso,   
			  :is_avisos.gi_nro_centro,   
			  :is_avisos.gi_nro_cmd,
			  :is_avisos.gi_nro_mesa,  
			  :is_avisos.gd_f_alta,   
			  :is_avisos.gi_tipo_red,   
			  :is_avisos.gs_fase,   
			  :pi_clase_aviso,
			  :ls_nombre_instalacion,
			  :ll_ind_incidencia,
			  :ll_ind_ot,
			  :li_ind_smt,
			  :li_ind_instal,
			  :li_tipo_ct,
			  :li_tension,
			  :is_avisos.gi_co_alcance)  ;
			  
	IF sqlca.sqlcode<> 0 then
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ingresar la informaci$$HEX1$$f300$$ENDHEX$$n de las instalaciones: " + sqlca.sqlerrtext ,information!,ok!)
		Return -1
	END IF	
	
Next

UPDATE GI_AVISOS_INSTALACION SET TIPO_CT = :li_tipo_ct
WHERE NRO_AVISO = :is_avisos.gl_nro_aviso;

// Salvamos los datos de otras salidas de media

IF  Upperbound(is_avisos.gl_sal_mt[]) > 1 then
	
	if is_avisos.gl_sal_mt[1] = 2 then
		
			 INSERT INTO "GI_AVISOS_OTRAS_INSTAL"  
						( "USUARIO",   
						  "PROGRAMA",   
						  "F_ACTUAL",   
						  "COD_SMT",   
						  "COD_CT",   
						  "NOM_INSTALACION",
						  "TIPO_INSTALACION",
						  "FASE")  
				  VALUES ( :gs_usuario,  
							  'w_1201',   
							  :ldt_fecha_actual,   
							  2,
							  :ll_subestac,
							  'Gen$$HEX1$$e900$$ENDHEX$$rico - Otra alimentaci$$HEX1$$f300$$ENDHEX$$n',
							  0,
							  '111')  ;
		
	else
	
		For li_contador = 1 to Upperbound(is_avisos.gl_sal_mt[]) 
		
			// Recuperamos el nombre de la instalacion
			
			SELECT "SGD_INSTALACION"."NOM_INSTALACION","SGD_INSTALACION"."TIPO_INSTALACION"
			INTO :ls_nombre_instalacion,:li_tipo_inst
			FROM "SGD_INSTALACION"
			WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :is_avisos.gl_sal_mt[li_contador];
			
			// Recuperamos la fase de la salida de media tensi$$HEX1$$f300$$ENDHEX$$n en formato varchar2
		
			SELECT "GI_FASE_CHAR"."FASE_NOM"  
			INTO :ls_fase  
			FROM "GI_FASE_CHAR"  
			WHERE "GI_FASE_CHAR"."FASE_NUM" =  :is_avisos.gl_sal_mt_fases[li_contador];
						
			// Nos saltamos el primero ya que es la propia salida de media del CT
			
			// Es posible que aqu$$HEX2$$ed002000$$ENDHEX$$devuelva el sqlca primary key violated. En ese caso no pasa nada ya que los registros
			// Pueden estar de otro aviso
	
		
			 INSERT INTO "GI_AVISOS_OTRAS_INSTAL"  
						( "USUARIO",   
						  "PROGRAMA",   
						  "F_ACTUAL",   
						  "COD_SMT",   
						  "COD_CT",   
						  "NOM_INSTALACION",
						  "TIPO_INSTALACION",
						  "FASE")  
				  VALUES ( :gs_usuario,  
							  'w_1201',   
							  :ldt_fecha_actual,   
							  :is_avisos.gl_sal_mt[li_contador],
							  :ll_ct,
							  :ls_nombre_instalacion,
							  :li_tipo_inst,
							  :ls_fase)  ;
		Next	
	end if
end if
RETURN 1
	
				
end function

public function integer fpr_g_aviso (integer pi_clase_aviso);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_g_aviso
// 
// Objetivo:    Graba los datos del aviso contenidos en la estructura.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)
//NCA-INICIO.DDAG-4730.20160225.		
		long ll_existe_nis, ll_cod_cat
		string ls_color
//NCA-FIN.DDAG-4730.20160225.	

//NCA-INICIO.DDAG-4746.20160302.  
      string ls_descrip_tabla_coord
      long ll_nis_coord
      double  ld_coor_x, ld_coor_y  
//NCA-FINI.DDAG-4746.20160302.
string ls_select

//TDA-EDM-11 
// se a$$HEX1$$f100$$ENDHEX$$adio l_v_ins_ot24h 
int li_ind_calidad, l_v_ins_ot24h 

long ll_aviso_pend // Se usa pq est$$HEX2$$e1002000$$ENDHEX$$mal definida la funci$$HEX1$$f300$$ENDHEX$$n fpr_v_aviso_pendiente. 
						 // Retorna el n$$HEX1$$fa00$$ENDHEX$$mero del aviso pendiente

string ls_tipo_via
// LFE - Mejora 1/262335
u_indicadores_sum luo_indicadores
// LFE - Fin Mejora 1/262335

//si no existe un aviso pendiente grabo los datos del aviso
//de lo contrario muestro los datos previamente ingresados
if is_avisos.gi_ind_ayuda= 0 then //si es un aviso de ayuda no busco 
											 //que exista en el sistema
	ll_aviso_pend = this.fpr_v_aviso_pendiente(ll_aviso_pend,is_avisos.gl_nis_rad)
	ll_aviso_pend = 0
else
	ll_aviso_pend = 0
end if
IF  ll_aviso_pend = 0 THEN
	// LFE - Mejora 1/262335
	luo_indicadores = CREATE u_indicadores_sum
	// LFE - Fin Mejora 1/262335

	if pi_clase_aviso= fgci_clase_avi_calidad then //DBE 25/03/2000 20:11
		li_ind_calidad=1
   end if

	// LFE - Mejora 1/262335
	luo_indicadores.il_nis_rad = is_avisos.gl_nis_rad	
	luo_indicadores.il_nro_aco = is_avisos.gl_nro_instalacion

	IF luo_indicadores.of_indicadores_sum() THEN
		
	//AHU 1/668310
	IF is_avisos.gi_est_aviso = fgci_aviso_improcedente THEN
		is_avisos.gi_ind_improcedente = 1
//		is_avisos.gi_inc_asoc = 1	
//		is_avisos.gl_nro_incidencia = 0
		IF is_avisos.gl_nro_ot > 0 THEN
			is_avisos.gi_inc_asoc = 0
			is_avisos.gl_nro_incidencia = 0
			is_avisos.gs_obs_improc = "Marcado automaticamente por resoluci$$HEX1$$f300$$ENDHEX$$n de la OT " + string(is_avisos.gl_nro_ot)
		ELSE
			is_avisos.gl_nro_ot = is_avisos.gl_nro_brigada
			is_avisos.gs_obs_improc = "Marcado automaticamente por resoluci$$HEX1$$f300$$ENDHEX$$n de la incidencia " + string(is_avisos.gl_nro_incidencia)
		END IF
	ELSE
		is_avisos.gs_obs_improc = ""
		is_avisos.gl_nro_ot = is_avisos.gl_nro_brigada
	END IF

	
	// LFE - Fin Mejora 1/262335
		SELECT NVL("TIPOS"."DESC_TIPO", '')
		INTO :ls_tipo_via	
		FROM "TIPOS" ,  "CALLEJERO"
		WHERE ("CALLEJERO"."TIP_VIA" = "TIPOS"."TIPO" (+)) 

				AND "CALLEJERO"."COD_CALLE" = :is_avisos.gl_cod_calle;
				
				
  
    //NCA-INICIO.DDAG-4746.20160302.Consultamos si el Nis existe y obtenemos las coordenadas a insertar.
	 //Cambio de orden de consultas
	 
	 //Priemero se realiza una b$$HEX1$$fa00$$ENDHEX$$squeda en sumcoordenadas
	 //TDA - Validar coordenadas en otra tabla para garantizarnos que todos los nises les aparezca su coordenada. INI
		SELECT  nis_rad, latitud,longitud
		INTO :ll_nis_coord, :ld_coor_x, :ld_coor_y
		FROM sum_coordenadas@dblsgc
		WHERE nis_rad = :is_avisos.gl_nis_rad 
		AND rownum = 1;
						
		If ISnull(ll_nis_coord)  OR ll_nis_coord = 0 Then 
								
			select nis,coor_x,coor_y
			into :ll_nis_coord, :ld_coor_x, :ld_coor_y
			from envios_gps@DBLISGLGUA where nis = :is_avisos.gl_nis_rad
			and f_actual = (select max (f_actual)
			from envios_gps@DBLISGLGUA where nis = :is_avisos.gl_nis_rad);

			If ISnull(ll_nis_coord)  OR ll_nis_coord = 0 Then 
				ld_coor_x = 0
				ld_coor_y = 0
			end if
							
		end if
					
						
        
//             //Buscamos el nombre de la tabla que esta parametrizada.
//				  SELECT DESCRIPCION
//					 INTO :ls_descrip_tabla_coord
//					 FROM SGD_VALOR 
//					 WHERE CODIF = 'XY' 
//					 AND VALOR = 'XY';			
//					 
//					 If IsNull(ls_descrip_tabla_coord) OR ls_descrip_tabla_coord = '' Then 
//						 IF messagebox("Aviso","Tabla de coordenadas no Parametrizada, estas no se agregar$$HEX1$$e100$$ENDHEX$$n al aviso. $$HEX1$$bf00$$ENDHEX$$Desea continuar?",question!,YesNo!) = 1 THEN
//						 else 
//							RETURN -1
//						End If
//					 End If 
//					 
//	
//					//declaro un cursor para llenar las variables de las coordenadas a insertar.
//					
//					DECLARE cur_coordenadas DYNAMIC CURSOR FOR SQLSA;	 
//				 
//					ls_select =	 " SELECT NIS, coor_x, coor_y " +&
//										 "FROM " + ls_descrip_tabla_coord +" " +&   
//										 "WHERE NIS = '" + string(is_avisos.gl_nis_rad) +"' " +&
//										 "AND COOR_X <> 0 "
//						
//					PREPARE SQLSA FROM :ls_select;
//
//					OPEN DYNAMIC cur_coordenadas;
//					
//					FETCH cur_coordenadas 
//					INTO :ll_nis_coord, :ld_coor_x, :ld_coor_y;
//					
//               CLOSE cur_coordenadas;	
//					
//					
//					//Validamos si existe el suministro.					
//					If ISnull(ll_nis_coord)  OR ll_nis_coord = 0 Then 
//						
//						//TDA - Validar coordenadas en otra tabla para garantizarnos que todos los nises les aparezca su coordenada. INI
//						SELECT  nis_rad, latitud,longitud
//						INTO :ll_nis_coord, :ld_coor_x, :ld_coor_y
//						FROM sum_coordenadas@dblsgc
//						WHERE nis_rad = :is_avisos.gl_nis_rad 
//						AND rownum = 1;
//						
//						If ISnull(ll_nis_coord)  OR ll_nis_coord = 0 Then 
//							messagebox("Aviso","No existen coordenadas para este suministro, se registraran en 0 en el aviso") 	
//						end if
//						
//						//TDA - FIN
//								 
//				   End If 

    //NCA-FIN.DDAG-4746.20160302.	
				

	//NCA-INICIO.DDAG-4730.20160225.Validamos si el suministro ya esta categorizado para fondo/color.	
	
								 SELECT NIS_RAD
										 INTO :ll_existe_nis
										 FROM GI_AVI_F_COLOR
										 WHERE NIS_RAD = :is_avisos.gl_nis_rad;											 

							   If ll_existe_nis <> 0 Then
									
											SELECT COD_CATEGORIA 
											  INTO :ll_cod_cat
											FROM  GI_AVI_F_COLOR 
											WHERE NIS_RAD = :is_avisos.gl_nis_rad;	
											
											
											SELECT COLOR
											  INTO :ls_color
											FROM GI_CATEGORIA 
											WHERE COD_CATEGORIA = :ll_cod_cat;								
									
									Else
										ll_cod_cat = 0
									   ls_color  = '(null)'
								End If 
	
	//NCA-FIN.DDAG-4730.20160225.	
	
		//INSERT A AVISOS_INCIDENCIAS INI ***************
			
			string ls_name_tabla, ls_insert, ls_query
			int li_activo
			string estado
			long nro_aviso,nis_rad
			decimal coordenada_x,coordenada_y
			date f_alta
			
			SELECT DESCRIPCION, ACTIVO
			INTO :ls_name_tabla,:li_activo
			FROM SGD_VALOR
			WHERE CODIF = 'INAR';
			
			if li_activo = 0 then
				
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se van a insertar en la tabla "+ls_name_tabla+" los valores: "+string(is_avisos.gl_nro_aviso)+","+string(is_avisos.gl_nis_rad)+","+string(ld_coor_x)+&
								","+string(ld_coor_y)+", '"+string(is_avisos.gd_f_alta)+"', "+"'OPEN'")
			
				ls_insert = "INSERT INTO "+ls_name_tabla+" "+&
								"(NRO_AVISO, NIS_RAD, COORDENADA_X, COORDENADA_Y, F_ALTA_AVISO, ESTADO_AVISO)"+&
								"VALUES ("+string(is_avisos.gl_nro_aviso)+","+string(is_avisos.gl_nis_rad)+","+string(ld_coor_x)+&
								","+string(ld_coor_y)+", '"+string(is_avisos.gd_f_alta)+"', "+"'OPEN')"
								
				execute immediate :ls_insert using sqlca4; // ejecutar el insert
				commit using sqlca4;
				
				if sqlca4.sqlcode = 0 then
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se insertaron correctamente los datos en: "+ls_name_tabla)
				else 
					if sqlca4.sqlcode<>0 then
						messagebox("Error al insertar", sqlca4.sqlerrtext)
					end if
				end if
				
//				ls_query = "SELECT NRO_AVISO,  NIS_RAD, COORDENADA_X, COORDENADA_Y,F_ALTA_AVISO, ESTADO_AVISO FROM "+ ls_name_tabla +" WHERE NRO_AVISO = "+string(is_avisos.gl_nro_aviso) + " USING sqlca4;"
//				
//				DECLARE cur_incidencia CURSOR FOR :ls_query	 
//			
//					OPEN cur_incidencia;
//					
//					if sqlca4.sqlcode < 0 then
//						MessageBox("Error de Base de datos!", sqlca4.sqlerrtext)
//					end if
//
//					FETCH cur_incidencia 
//					INTO :nro_aviso, :nis_rad, :coordenada_x, :coordenada_y, :f_alta, :estado;
//					//Cuando no hay m$$HEX1$$e100$$ENDHEX$$s registros que leer,
//					//la variable SqlCode toma el valor 100
//					DO While sqlca4.SqlCode<>100
//						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Valores insertados: "+string(nro_aviso)+","+string(nis_rad)+","+&
//									string(coordenada_x)+","+string(coordenada_y)+","+string(f_alta)+","+estado)
//					
//					FETCH cur_incidencia 
//					INTO :nro_aviso, :nis_rad, :coordenada_x, :coordenada_y, :f_alta, :estado;
//
//					Loop
					
					

//               CLOSE cur_incidencia;	


				SELECT NRO_AVISO, NIS_RAD, COORDENADA_X, COORDENADA_Y, F_ALTA_AVISO, ESTADO_AVISO 
				INTO :nro_aviso, :nis_rad, :coordenada_x, :coordenada_y, :f_alta, :estado
				FROM AVISOS_INCIDENCIAS2
				WHERE NRO_AVISO =:is_avisos.gl_nro_aviso
				USING sqlca4;
				
				if sqlca4.sqlcode = 0 then
					MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Valores insertados: "+string(nro_aviso)+","+string(nis_rad)+","+&
									string(coordenada_x)+","+string(coordenada_y)+","+string(f_alta)+","+estado)
				end if
				
				
			end if
			
			//INSERT A AVISOS_INCIDENCIAS FIN ***************

				
	
		INSERT INTO "GI_AVISOS"  
			("NRO_AVISO" ,"USUARIO" ,"F_ACTUAL" ,"H_ACTUAL" ,"PROGRAMA" ,"NIS_RAD" ,   
			 "NOMBRE" ,"APE1" ,"APE2" ,"DOC_ID" , "TIP_DOC" , "CO_PAIS" ,"CO_ALCANCE" ,   
			 "TIP_AVISO" ,"IND_PELIGRO" ,"PRIORIDAD","F_ALTA" ,"H_ALTA" 
			 ,"TFNO_CLI" ,   "COD_LOC" ,
			 "EST_AVISO" ,"OBS_TELEGESTIONES" ,"OBS_CMD" ,"CLASE_AVISO","IND_AYUDA" ,"DUPLICADOR" ,   
			 "NUM_PUERTA" ,"COD_CALLE" , "COD_MUNIC" ,"COD_PROV" ,"COD_DEPTO" ,   
			 "NRO_OT" ,"ESQUINA" ,"CGV_SUM" ,"NRO_CENTRO" ,"NRO_TELEGESTIONES" ,   
			 "NRO_INSTALACION" ,"NRO_CMD" ,"NRO_MESA" ,"NRO_INCIDENCIA" ,"IND_IMPROCEDENTE" ,   
			 "IND_CLI_IMP" ,"NRO_TELEFONISTA" ,"NOM_CALLE" ,"NOM_PROV" ,"NOM_DEPTO" ,
			 "NOM_MUNIC" ,"NOM_LOC", "FECHA_RES", "HORA_RES", "REF_DIR", "EB4005",
			 "FECHA_BATCH", "COD_HORARIO", "IND_INC_ASOC", "NRO_LLAMADAS", 
			 "IND_CALIDAD", "FECHA_PROBLEMA","TIPO_VIA","AREA_REP","POBLACION", "F_ULTIMO_AVISO", "OBS_IMPROC", "COD_CATEGORIA", "COD_COLOR_CATEGORIA",
			 //"COORDENADA_X", "COORDENADA_Y","OT_CAUSA")
			 //TDA - Mejora 09/2019
			 "COORDENADA_X", "COORDENADA_Y","OT_CAUSA","US_REGISTRO")
		VALUES
			(:is_avisos.gl_nro_aviso, :g_cod_usuario, :is_avisos.gd_f_actual,   
			 :is_avisos.gt_h_actual, :is_avisos.gs_programa, :is_avisos.gl_nis_rad,   
			 :is_avisos.gs_nombre, :is_avisos.gs_ape1, :is_avisos.gs_ape2,   
			 :is_avisos.gs_doc_id, :is_avisos.gs_tip_doc, :is_avisos.gs_co_pais,   
			 :is_avisos.gi_co_alcance, :is_avisos.gi_tip_aviso, :is_avisos.gi_ind_peligro,   
			 :is_avisos.gi_prioridad, :is_avisos.gd_f_alta, :is_avisos.gt_h_alta, 
			 :is_avisos.gs_tfno_cli, :is_avisos.gl_cod_loc,
			 :is_avisos.gi_est_aviso, :is_avisos.gs_obs_telegestiones, :is_avisos.gs_obs_cmd,   
			 :pi_clase_aviso,:is_avisos.gi_ind_ayuda, 
			 :is_avisos.gs_duplicador, :is_avisos.gl_num_puerta,   
			 :is_avisos.gl_cod_calle,  :is_avisos.gl_cod_munic,   
			 :is_avisos.gi_cod_prov, :is_avisos.gi_cod_depto, :is_avisos.gl_nro_ot,   
			 :is_avisos.gs_esquina, :is_avisos.gs_cgv_sum, :is_avisos.gi_nro_centro,   
			 :is_avisos.gi_nro_telegestiones, :is_avisos.gl_nro_instalacion,   
			 :is_avisos.gi_nro_cmd, :is_avisos.gi_nro_mesa, :is_avisos.gl_nro_incidencia,   
			 :is_avisos.gi_ind_improcedente, :is_avisos.gi_ind_cli_imp,   
			 :is_avisos.gs_nro_telefonista, :is_avisos.gs_nom_calle,
			 :is_avisos.gs_nom_prov, :is_avisos.gs_nom_depto, 
			 :is_avisos.gs_nom_munic, :is_avisos.gs_nom_loc, :is_avisos.gdt_f_res,
			 :is_avisos.gdt_h_res, :is_avisos.gs_ref_dir, :is_avisos.gi_est_batch,
			 :is_avisos.gdt_f_batch, :is_avisos.gi_cod_hor, :is_avisos.gi_inc_asoc, :is_avisos.gl_nro_llamadas,
			 :li_ind_calidad, :is_avisos.gdt_f_problema,:ls_tipo_via,:is_avisos.gi_nro_area,:is_avisos.gs_poblacion,:is_avisos.gd_f_alta, :is_avisos.gs_obs_improc, :ll_cod_cat, :ls_color, 
			 :ld_coor_x, :ld_coor_Y,:is_avisos.gs_causa_ot24h, :g_cod_usuario)  
			USING sqlca;
				
			//Commit;
			
		//Fin AHU	
		IF SQLCA.SQLCode = -1 then
			//RollBack;
			gnu_u_transaction.uf_rollback()
			gnv_msg.f_mensaje("ER03","~n"+sqlca.SqlErrText,"",OK!)
			RETURN -1
		ELSE
	//			gnu_u_transaction.uf_commit() //DBE ha commentado 03/03/2000
			// LFE - Mejora 1/262335 
			// Se insertan los indicadores en la tabla GI_INDICES_AVISO si el pais es Panam$$HEX1$$e100$$ENDHEX$$
			IF gi_pais = 4 AND is_avisos.gl_nro_instalacion <> fgcdec_aviso_con_alimentacion AND is_avisos.gl_nro_instalacion <> fgcdec_aviso_de_ayuda AND &
				is_avisos.gl_nro_instalacion <> fgcdec_aviso_de_calidad_sin_alim AND is_avisos.gl_nro_instalacion <> fgcdec_aviso_sin_alimentacion AND &
				is_avisos.gl_nro_instalacion <> fgcdec_aviso_alumbrado_publico THEN
				
				INSERT INTO GI_INDICES_AVISO
				(NRO_AVISO, 
			    USUARIO, 
  				 F_ACTUAL, 
  				 PROGRAMA, 
			  	 SAIFI_FM, 
				 SAIFI_CF, 
				 SAIFI_OC, 
				 SAIDI_FM, 
				 SAIDI_CF, 
			    SAIDI_OC )
				VALUES
				(:is_avisos.gl_nro_aviso, 
				 :is_avisos.gs_usuario, 
				 :is_avisos.gd_f_actual,   
			 	 :is_avisos.gs_programa,
				 :luo_indicadores.il_saifi[1], :luo_indicadores.il_saifi[2], :luo_indicadores.il_saifi[3],
			 	 :luo_indicadores.idb_saidi[1], :luo_indicadores.idb_saidi[2], :luo_indicadores.idb_saidi[3] );
		
				IF SQLCA.SQLCode <> 0 THEN
					gnu_u_transaction.uf_rollback()
					Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ha sido imposible almacenar los indicadores de calidad por aviso para este suministro." + sqlca.SqlErrText,information!,OK!)
					RETURN -1
				ELSE
			//		gnu_u_transaction.uf_commit() //DBE ha commentado 03/03/2000
			
					
					RETURN 0 // retorna que insert$$HEX2$$f3002000$$ENDHEX$$el aviso
				END IF
			ELSE
				//TDA-EDM-11
				
				if DESOT24H then
						l_v_ins_ot24h = this.fpr_g_causa_ot24hdes()
					else
						l_v_ins_ot24h = this.fpr_g_causa_ot24h('RT')						
					end if
				
			   //l_v_ins_ot24h = this.fpr_g_causa_ot24h('RT')				
				IF l_v_ins_ot24h = 1 then
					gnu_u_transaction.uf_rollback()					
					gnv_msg.f_mensaje("ER03","~n"+sqlca.SqlErrText,"",OK!)
					RETURN -1
				ELSE											
					RETURN 0
				END IF	
				//TDA-EDM-11
			END IF
			// LFE - Fin Mejora 1/262335 
		END IF
	ELSE
		gnu_u_transaction.uf_rollback()
		RETURN -1
	END IF	  
	
	// LFE - Mejora 1/262335	
	DESTROY luo_indicadores
	// LFE - Fin Mejora 1/262335
	
ELSEIF ll_aviso_pend > 0 THEN
	gnv_msg.f_mensaje("AR20","","",OK!)
	//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Fue ingresado un aviso para este suministro por otro usuario")
	return ll_aviso_pend //muestro los datos previos		
END IF

RETURN -1

 
end function

public function integer fpr_g_aviso ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_g_aviso
// 
// Objetivo:    Graba los datos del aviso contenidos en la estructura.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

string ls_tipo_via
int li_ind_calidad

long ll_aviso_pend // Se usa pq est$$HEX2$$e1002000$$ENDHEX$$mal definida la funci$$HEX1$$f300$$ENDHEX$$n fpr_v_aviso_pendiente. 
						 // Retorna el n$$HEX1$$fa00$$ENDHEX$$mero del aviso pendiente
// LFE - Mejora 1/262335 
u_indicadores_sum luo_indicadores
// LFE - Fin Mejora 1/262335 
 
//si no existe un aviso pendiente grabo los datos del aviso
//de lo contrario muestro los datos previamente ingresados
if is_avisos.gi_ind_ayuda= 0 then //si es un aviso de ayuda no busco 
											 //que exista en el sistema
	ll_aviso_pend = this.fpr_v_aviso_pendiente(ll_aviso_pend,is_avisos.gl_nis_rad)
	ll_aviso_pend = 0
else
	ll_aviso_pend = 0
end if

IF  ll_aviso_pend = 0 THEN
	// LFE - Mejora 1/262335 
	luo_indicadores = CREATE u_indicadores_sum
	// LFE - Fin Mejora 1/262335 
	
	if is_avisos.gl_nro_instalacion=fgcdec_aviso_de_calidad then //DBE 03/03/2000
		li_ind_calidad=1
	end if
	// LFE - Mejora 1/262335 
	luo_indicadores.il_nis_rad = is_avisos.gl_nis_rad	
	luo_indicadores.il_nro_aco = is_avisos.gl_nro_instalacion
	IF luo_indicadores.of_indicadores_sum() THEN
	// LFE - Fin Mejora 1/262335 	
	
		SELECT NVL("TIPOS"."DESC_TIPO", '')
		INTO :ls_tipo_via	
		FROM "TIPOS" ,  "CALLEJERO"
		WHERE ("CALLEJERO"."TIP_VIA" = "TIPOS"."TIPO" (+)) 
			AND "CALLEJERO"."COD_CALLE" = :is_avisos.gl_cod_calle;
		
		INSERT INTO "GI_AVISOS"  
			("NRO_AVISO" ,"USUARIO" ,"F_ACTUAL" ,"H_ACTUAL" ,"PROGRAMA" ,"NIS_RAD" ,   
			 "NOMBRE" ,"APE1" ,"APE2" ,"DOC_ID" ,        "TIP_DOC" ,     "CO_PAIS" ,"CO_ALCANCE" ,   
			 "TIP_AVISO" ,"IND_PELIGRO" ,"PRIORIDAD","F_ALTA" ,"H_ALTA" 
			 ,"TFNO_CLI" ,   "COD_LOC" ,
			 "EST_AVISO" ,"OBS_TELEGESTIONES" ,"OBS_CMD" ,"IND_AYUDA" ,"DUPLICADOR" ,   
			 "NUM_PUERTA" ,"COD_CALLE" , "COD_MUNIC" ,"COD_PROV" ,"COD_DEPTO" ,   
			 "NRO_OT" ,"ESQUINA" ,"CGV_SUM" ,"NRO_CENTRO" ,"NRO_TELEGESTIONES" ,   
			 "NRO_INSTALACION" ,"NRO_CMD" ,"NRO_MESA" ,"NRO_INCIDENCIA" ,"IND_IMPROCEDENTE" ,   
			 "IND_CLI_IMP" ,"NRO_TELEFONISTA" ,"NOM_CALLE" ,"NOM_PROV" ,"NOM_DEPTO" ,
			 "NOM_MUNIC" ,"NOM_LOC", "FECHA_RES", "HORA_RES", "REF_DIR", "EB4005",
			 "FECHA_BATCH", "COD_HORARIO", "IND_INC_ASOC", "NRO_LLAMADAS", 
			 "IND_CALIDAD", "FECHA_PROBLEMA","TIPO_VIA","AREA_REP","POBLACION", "F_ULTIMO_AVISO","OT_CAUSA")
		VALUES
			(:is_avisos.gl_nro_aviso, :g_cod_usuario, :is_avisos.gd_f_actual,   
			 :is_avisos.gt_h_actual, :is_avisos.gs_programa, :is_avisos.gl_nis_rad,   
			 :is_avisos.gs_nombre, :is_avisos.gs_ape1, :is_avisos.gs_ape2,   
			 :is_avisos.gs_doc_id, :is_avisos.gs_tip_doc, :is_avisos.gs_co_pais,   
			 :is_avisos.gi_co_alcance, :is_avisos.gi_tip_aviso, :is_avisos.gi_ind_peligro,   
			 :is_avisos.gi_prioridad, :is_avisos.gd_f_alta, :is_avisos.gt_h_alta, 
			 :is_avisos.gs_tfno_cli, :is_avisos.gl_cod_loc,
			 :is_avisos.gi_est_aviso, :is_avisos.gs_obs_telegestiones, :is_avisos.gs_obs_cmd,   
			 :is_avisos.gi_ind_ayuda, :is_avisos.gs_duplicador, :is_avisos.gl_num_puerta,   
			 :is_avisos.gl_cod_calle,  :is_avisos.gl_cod_munic,   
			 :is_avisos.gi_cod_prov, :is_avisos.gi_cod_depto, :is_avisos.gl_nro_brigada,   
			 :is_avisos.gs_esquina, :is_avisos.gs_cgv_sum, :is_avisos.gi_nro_centro,   
			 :is_avisos.gi_nro_telegestiones, :is_avisos.gl_nro_instalacion,   
			 :is_avisos.gi_nro_cmd, :is_avisos.gi_nro_mesa, :is_avisos.gl_nro_incidencia,   
			 :is_avisos.gi_ind_improcedente, :is_avisos.gi_ind_cli_imp,   
			 :is_avisos.gs_nro_telefonista, :is_avisos.gs_nom_calle,
			 :is_avisos.gs_nom_prov, :is_avisos.gs_nom_depto, 
			 :is_avisos.gs_nom_munic, :is_avisos.gs_nom_loc, :is_avisos.gdt_f_res,
			 :is_avisos.gdt_h_res, :is_avisos.gs_ref_dir, :is_avisos.gi_est_batch,
			 :is_avisos.gdt_f_batch, :is_avisos.gi_cod_hor, :is_avisos.gi_inc_asoc, :is_avisos.gl_nro_llamadas,
			 :li_ind_calidad, :is_avisos.gdt_f_problema,:ls_tipo_via,:is_avisos.gi_nro_area,:is_avisos.gs_poblacion, :is_avisos.gd_f_alta,
			 :is_avisos.gs_causa_ot24h)	USING sqlca;			
			//Commit;
				
			
		IF SQLCA.SQLCode = -1 then
			//RollBack;
			gnu_u_transaction.uf_rollback()
			gnv_msg.f_mensaje("ER03","~n"+sqlca.SqlErrText,"",OK!)
			RETURN -1
		ELSE
			// LFE - Mejora 1/262335 
			// Se insertan los indicadores en la tabla GI_INDICES_AVISO si el pais es Panam$$HEX1$$e100$$ENDHEX$$
			IF gi_pais = 4 AND is_avisos.gl_nro_instalacion <> fgcdec_aviso_con_alimentacion AND is_avisos.gl_nro_instalacion <> fgcdec_aviso_de_ayuda AND &
				is_avisos.gl_nro_instalacion <> fgcdec_aviso_de_calidad_sin_alim AND is_avisos.gl_nro_instalacion <> fgcdec_aviso_sin_alimentacion AND &
				is_avisos.gl_nro_instalacion <> fgcdec_aviso_alumbrado_publico THEN
				
				INSERT INTO GI_INDICES_AVISO
				(NRO_AVISO, 
			    USUARIO, 
  				 F_ACTUAL, 
  				 PROGRAMA, 
			  	 SAIFI_FM, 
				 SAIFI_CF, 
				 SAIFI_OC, 
				 SAIDI_FM, 
				 SAIDI_CF, 
			    SAIDI_OC )
				VALUES
				(:is_avisos.gl_nro_aviso, 
				 :is_avisos.gs_usuario, 
				 :is_avisos.gd_f_actual,   
			 	 :is_avisos.gs_programa,
				 :luo_indicadores.il_saifi[1], :luo_indicadores.il_saifi[2], :luo_indicadores.il_saifi[3],
			 	 :luo_indicadores.idb_saidi[1], :luo_indicadores.idb_saidi[2], :luo_indicadores.idb_saidi[3] );
		
				IF SQLCA.SQLCode <> 0 THEN
					gnu_u_transaction.uf_rollback()
					Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ha sido imposible almacenar los indicadores de calidad por aviso para este suministro." + sqlca.SqlErrText,information!,OK!)
					RETURN -1
				ELSE
					
			//		gnu_u_transaction.uf_commit() //DBE ha commentado 03/03/2000
					//TDA-EDM-11
					int l_v_ins_ot24h 
					
					if DESOT24H then						
						l_v_ins_ot24h = this.fpr_g_causa_ot24hdes()
					else
						l_v_ins_ot24h = this.fpr_g_causa_ot24h('RT')						
					end if

					if l_v_ins_ot24h = 1 then
								gnu_u_transaction.uf_rollback()
								return -1
					ELSE			

						RETURN 0 // retorna que insert$$HEX2$$f3002000$$ENDHEX$$el aviso
					END IF	
					//TDA-EDM-11
				END IF
			ELSE
				RETURN 0
			END IF
			// LFE - Fin Mejora 1/262335 
		END IF
	ELSE
		gnu_u_transaction.uf_rollback()
		RETURN -1
	END IF		  

	// LFE - Mejora 1/262335 
	DESTROY luo_indicadores
	// LFE - Fin Mejora 1/262335 
ELSEIF ll_aviso_pend > 0 THEN
	gnv_msg.f_mensaje("AR20","","",OK!)
	//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Fue ingresado un aviso para este suministro por otro usuario")
	return ll_aviso_pend //muestro los datos previos		
END IF

RETURN -1

 
end function

public function integer fpr_g_causa_ot24h (string tipo);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_g_aviso
// 
// Objetivo:    Graba los datos del aviso contenidos en la estructura.
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:  tipo              
//
//      Salida:  -- 
//                                              
// Devuelve:    1 (si hay error)
//              0 (no hay error)
//
////////////////////////////////////////////////////////////////////////////////////////////////

string l_nom_prov, l_nom_depto, l_nom_munic, l_nom_local, l_nom_unicom, l_nombre, l_direccion, l_email1, l_cod_estado, l_desc_estado

string l_causa, l_observaciones, l_tipo, l_region,l_tfno_cli

string l_varchar2,l_fecha,l_nis_rad, l_aviso

long  l_cod_unicom, l_tfno_cel, l_sig_id 

long l_cod_causa, l_correlativo, l_historico,l_cod_region, l_pin

long l_sig_seq, l_cod_prov, l_codigosmt, l_codssee, l_cod_depto ,l_cod_munic

l_region = ''

l_cod_region = 0

l_pin = 0

l_cod_unicom = 0

l_codssee = 0

l_cod_munic = 0

l_cod_prov = 0

l_cod_depto = 0

l_codigosmt = 0

l_tipo = tipo

l_correlativo = 1

l_historico = 0

l_nis_rad = String(is_avisos.gl_nis_rad)

if l_nis_rad = "0" then
	l_direccion = is_avisos.gs_esquina
	l_nom_local = is_avisos.gs_nom_loc	
end if

l_aviso = string(is_avisos.gl_nro_aviso)

l_cod_causa = is_avisos.gs_causa_ot24h

l_observaciones = is_avisos.gs_obs_telegestiones + " SGI"

l_tfno_cli = is_avisos.gs_tfno_cli

select TO_CHAR(sysdate, 'YYYYMMDD HH:MI:SS pm')
INTO :l_fecha
FROM DUAL 
USING SQLCA2;

SELECT DESCRIPCION 
INTO :l_causa
FROM CAUSA
WHERE ACTIVA_RECLAMO = 1 
AND CODIGO = :l_cod_causa 
USING sqlca2;

select SEQ_ID.NextVal
into :l_sig_id 
FROM DUAL
USING sqlca2;

select SEQ_INC.NextVal
into :l_sig_seq
FROM DUAL
USING sqlca2;

SELECT 
    case
        when A.USR_VARCHAR2 is null or A.USR_VARCHAR2 like '*%%*' or A.USR_VARCHAR2 like ' '
        then '0'
        else A.USR_VARCHAR2
    end as USR_VARCHAR2,
    D.COD_PROV,
    D.NOM_PROV,
    E.COD_DEPTO,
    E.NOM_DEPTO,
    F.COD_MUNIC,
    F.NOM_MUNIC,
    G.NOM_LOCAL,
    I.COD_UNICOM,
    I.NOM_UNICOM,
    H.NOM_CLI||' '||H.APE1_CLI||' '||H.APE2_CLI,
    C.NOM_CALLE||' '||DECODE(LTRIM(RTRIM(B.DUPLICADOR)),'','',' ' || B.NUM_PUERTA || B.DUPLICADOR) || ' '
    || DECODE(G.NOM_LOCAL,'ZONA 0', '' ,G.NOM_LOCAL || ', ')||LTRIM(A.CGV_SUM    || ' ' ||
    F.NOM_MUNIC || DECODE(D.NOM_PROV,F.NOM_MUNIC,'',  (', ' || D.NOM_PROV) ))||' '||B.ACC_FINCA,
    H.TFNO_CEL,
    H.EMAIL1,
    A.EST_SUM,
    upper(J.DESC_EST)
INTO 
      :l_varchar2,
      :l_cod_prov,
      :l_nom_prov,
      :l_cod_depto,
      :l_nom_depto,
      :l_cod_munic,
      :l_nom_munic,
      :l_nom_local,
      :l_cod_unicom,
      :l_nom_unicom,
      :l_nombre,
      :l_direccion,
      :l_tfno_cel,
      :l_email1,
      :l_cod_estado,
      :l_desc_estado
FROM SGCPRO.SUMCON@DBLSGC A,
    SGCPRO.FINCAS@DBLSGC B,
    SGCPRO.CALLEJERO@DBLSGC C,
    SGCPRO.PROVINCIAS@DBLSGC D,
    SGCPRO.DEPTOS@DBLSGC E,
    SGCPRO.MUNICIPIOS@DBLSGC F,
    SGCPRO.LOCALIDADES@DBLSGC G,
    SGCPRO.CLIENTES@DBLSGC H,
    SGCPRO.UNICOM@DBLSGC I,
    SGCPRO.ESTADOS@DBLSGC J
WHERE  A.NIF = B.NIF
AND B.COD_CALLE = C.COD_CALLE
AND C.COD_PROV = D.COD_PROV
AND C.COD_DEPTO = E.COD_DEPTO
AND C.COD_MUNIC = F.COD_MUNIC
and C.COD_LOCAL = G.COD_LOCAL
and H.COD_CLI = A.COD_CLI
and A.COD_UNICOM = I.COD_UNICOM
and A.EST_SUM = J.ESTADO
and A.NIS_RAD = :l_nis_rad
USING sqlca2;

select REGION
into :l_region
from REGION
where unicom=:l_cod_unicom 
USING sqlca2;

SELECT f.CODIGO,       
       g.codigo
INTO  :l_codigosmt, :l_codssee
                    from aco_sum a,
                    sgd_acometida b,
                    sgd_salbt c,
                    sgd_ct d,
                    sgd_salmt f,
                    sgd_subestac g
                    where a.nis_rad = :l_nis_rad
                    and d.instalacion_origen = f.codigo
                    and f.instalacion_origen = g.codigo
                    and a.NRO_ACOMETIDA = b.codigo
                    and b.INSTALACION_ORIGEN = c.codigo
                    and c.INSTALACION_ORIGEN = d.codigo
                    and d.bdi_job = 0
                    and f.bdi_job = 0
                    and g.bdi_job = 0
                    and rownum=1
USING sqlca;

st_gestion st_gestion_param

st_gestion_param = fpr_aviso_gestion_ot24h(long(l_nis_rad))

l_nombre= 					f_truncar(l_nombre, 200)
l_desc_estado= 			f_truncar(l_desc_estado,25)
l_direccion= 				f_truncar(l_direccion,200)
l_nom_local=				f_truncar(l_nom_local,25)
//l_persona_que_reporta= 	f_truncar(l_persona_que_reporta,200)
l_aviso= 					f_truncar(l_aviso,12)
//l_reclamo= 					f_truncar(l_reclamo,25)
l_causa= 					f_truncar(l_causa, 200)
l_observaciones= 			f_truncar(l_observaciones,2000)
l_cod_estado= 				f_truncar(l_cod_estado,25)
l_varchar2= 				f_truncar(l_varchar2,100)
g_cod_usuario=				f_truncar(g_cod_usuario, 100)
g_nombre=					f_truncar(g_nombre, 100)


//Nuevo codigo 2018 para obtener el codigo de oficina y region
if l_nis_rad = "0" then
          l_nombre=is_avisos.gs_nombre+ " " +is_avisos.gs_ape1 +" "+is_avisos.gs_ape2
		 
	 	  select u.cod_unicom,U.NOM_UNICOM
		  INTO :l_cod_unicom,:l_nom_unicom
           from SGCPRO.unicom@DBLSGC u,
			  SGCPRO.deptos@DBLSGC d,
			  SGCPRO.callejero@DBLSGC c,
			  SGCPRO.provincias@DBLSGC p,
                SGCPRO.municipios@DBLSGC m,
			  SGCPRO.localidades@DBLSGC l
           where u.cod_calle=c.cod_calle
           and c.cod_depto=d.cod_depto and p.cod_prov=c.cod_prov
           and c.cod_munic=m.cod_munic and c.cod_local=l.cod_local
           and c.cod_prov=:aux_codprov and d.cod_depto=:aux_coddepto and m.cod_munic=:aux_codmun
           and l.cod_local=:aux_codloc
		  USING sqlca2;
		  
	     select REGION
          into :l_region
          from REGION
          where unicom=:l_cod_unicom 
          USING sqlca2;
		 //obtiene el cod de region
end if


INSERT INTO REGISTRO (ID,SEQ,TIPO,CORRELATIVO,NIS,CLIENTE,ESTADO,DIRECCION,ZONA,PERSONA_QUE_REPORTA,TEL1,TEL2,EMAIL,NO_AVISO,NO_RECLAMO,COD_CAUSA,NOM_CAUSA,OBSERVACIONES,FECHA_ALTA,FECHA_RESOLUCION,COD_USUARIO,NOM_USUARIO,HISTORICO,COD_ESTADO,MATRICULA) 
values (to_number(:l_sig_id),
    to_number(:l_sig_seq),
    to_char(:l_tipo),
    to_number(:l_correlativo),
    to_number(:l_nis_rad),
    to_char(:l_nombre),
    to_char(:l_desc_estado),
    to_char(:l_direccion),
    to_char(:l_nom_local),
    null,
    to_char(:l_tfno_cli),
    to_char(:l_tfno_cel),
    to_char(:l_email1),
    to_char(:l_aviso),
    null,
    to_number(:l_cod_causa),
    to_char(:l_causa),
    to_char(:l_observaciones),
    TO_DATE(:l_fecha,'YYYYMMDD HH:MI:SS pm'),
    null,
    to_char(:g_cod_usuario),
    to_char(:g_nombre),
    to_number(0),
    to_char(:l_cod_estado),
    to_char(:l_varchar2)
)
USING sqlca2;  		

if sqlca2.sqlcode <> 0 then
	MessageBox("SQL error" + String(sqlca2.sqldbcode), sqlca2.sqlerrtext)
else 
	commit using sqlca2;
end if

if l_nis_rad = "0" then
	l_cod_prov = is_avisos.gi_cod_prov
	l_nom_prov = is_avisos.gs_nom_prov
	l_cod_depto = is_avisos.gi_cod_depto
	l_nom_depto = is_avisos.gs_nom_depto
	l_cod_munic = is_avisos.gl_cod_munic
	l_nom_munic = is_avisos.gs_nom_munic
//	COD_PROV, NOM_PROV, COD_DEPTO, NOM_DEPTO, COD_MUNIC, NOM_MUNIC
end if


INSERT INTO REGISTRO_GEO (ID,COD_DEPTO,NOM_DEPTO,COD_MUNIC,NOM_MUNIC, COD_LOCAL, NOM_LOCAL, COD_OFICINA,NOM_OFICINA,COD_REGION,NOM_REGION,COD_SMT,NOM_SMT,COD_SE,NOM_SE,COD_PIN,NOM_PIN,HISTORICO,SEQ,TIPO,CORRELATIVO) 
values (to_number(:l_sig_id),
	to_number(:l_cod_prov),
	to_char(:l_nom_prov),
	to_number(:l_cod_depto),
	to_char(:l_nom_depto),
	to_number(:l_cod_munic),
to_char(:l_nom_munic),
to_number(:l_cod_unicom),
to_char(:l_nom_unicom),
to_number(:l_cod_region),
to_char(:l_region),
to_number(:l_codigosmt),
null,
to_number(:l_codssee),
null,
to_number(0),
null,
to_number(1),
to_number(:l_sig_seq),
to_char(:l_tipo),
to_number(0))
USING sqlca2;

if sqlca2.sqlcode <> 0 then
	MessageBox("SQL error" + String(sqlca2.sqldbcode), sqlca2.sqlerrtext)
else 
	commit using sqlca2;
end if

INSERT INTO REGISTRO_GESTION (ID,SEQ,TIPO,CORRELATIVO, ID_GESTION, DESC_GESTION) 
values (to_number(:l_sig_id),
	to_number(:l_sig_seq),
	to_char(:l_tipo),
	to_number(:l_correlativo),
	:st_gestion_param.l_id_gestion,
	:st_gestion_param.l_desc_gestion
)
USING sqlca2;

if sqlca2.sqlcode <> 0 then
	MessageBox("SQL error" + String(sqlca2.sqldbcode), sqlca2.sqlerrtext)
else 
	commit using sqlca2;
end if

if sqlca2.sqlcode <> 0 then
	return 1
else 
	return 0
end if
end function

public function integer fpr_g_causa_ot24hdes ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_g_aviso
// 
// Objetivo:    Graba los datos del aviso contenidos en la estructura.
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:  tipo              
//
//      Salida:  -- 
//                                              
// Devuelve:    1 (si hay error)
//              0 (no hay error)
//
////////////////////////////////////////////////////////////////////////////////////////////////

string l_nom_prov, l_nom_depto, l_nom_munic, l_nom_local, l_nom_unicom, l_nombre, l_direccion, l_email1, l_cod_estado, l_desc_estado

string l_causa, l_observaciones, g_cod_usuario, g_nombre, l_tipo, l_region,l_tfno_cli

string l_varchar2,l_fecha,l_nis_rad

long  l_cod_unicom, l_tfno_cel, l_aviso, l_sig_id 

long l_cod_causa, l_correlativo, l_historico,l_cod_region, l_pin

long l_sig_seq, l_cod_prov, l_codigosmt, l_codssee, l_cod_depto ,l_cod_munic

l_region = ''

l_cod_region = 0

l_pin = 0

l_cod_unicom = 0

l_codssee = 0

l_cod_munic = 0

l_cod_prov = 0

l_cod_depto = 0

l_codigosmt = 0

l_tipo = "RT"

l_correlativo = 1

l_historico = 0

l_nis_rad = String(is_avisos.gl_nis_rad)

if l_nis_rad = "0" then
	l_direccion = is_avisos.gs_esquina
	l_nom_local = is_avisos.gs_nom_loc
	
end if

g_cod_usuario = is_avisos.gs_usuario

l_aviso = is_avisos.gl_nro_aviso

l_cod_causa = is_avisos.gs_causa_ot24h

l_observaciones = is_avisos.gs_obs_telegestiones + " SGI"

l_tfno_cli = is_avisos.gs_tfno_cli

select TO_CHAR(sysdate, 'YYYYMMDD HH:MI:SS pm')
INTO :l_fecha
FROM DUAL 
USING SQLCA;

SELECT DESCRIPCION 
INTO :l_causa
FROM CAUSA
WHERE ACTIVA_RECLAMO = 1 
AND CODIGO = :l_cod_causa 
USING sqlca;

SELECT NOM_USUARIO 
INTO :g_nombre
FROM GI_USUARIO_SGI 
where usuario = upper(:g_cod_usuario)
USING sqlca;

select OT24H.SEQ_ID.NextVal
into :l_sig_id 
FROM DUAL
USING sqlca;

select OT24H.SEQ_INC.NextVal
into :l_sig_seq
FROM DUAL
USING sqlca;

SELECT /*A.NIS_RAD,*/
    case
        when A.USR_VARCHAR2 is null or A.USR_VARCHAR2 like '*%%*' or A.USR_VARCHAR2 like ' '
        then '0'
        else A.USR_VARCHAR2
    end as USR_VARCHAR2,
    D.COD_PROV,
    D.NOM_PROV,
    E.COD_DEPTO,
    E.NOM_DEPTO,
    F.COD_MUNIC,
    F.NOM_MUNIC,
    G.NOM_LOCAL,
    I.COD_UNICOM,
    I.NOM_UNICOM,
    H.NOM_CLI||' '||H.APE1_CLI||' '||H.APE2_CLI,
    C.NOM_CALLE||' '||DECODE(LTRIM(RTRIM(B.DUPLICADOR)),'','',' ' || B.NUM_PUERTA || B.DUPLICADOR) || ' '
    || DECODE(G.NOM_LOCAL,'ZONA 0', '' ,G.NOM_LOCAL || ', ')||LTRIM(A.CGV_SUM    || ' ' ||
    F.NOM_MUNIC || DECODE(D.NOM_PROV,F.NOM_MUNIC,'',  (', ' || D.NOM_PROV) ))||' '||B.ACC_FINCA,
    H.TFNO_CEL,
    H.EMAIL1,
    A.EST_SUM,
    upper(J.DESC_EST)
INTO //:l_nis_rad,
      :l_varchar2,
      :l_cod_prov,
      :l_nom_prov,
      :l_cod_depto,
      :l_nom_depto,
      :l_cod_munic,
      :l_nom_munic,
      :l_nom_local,
      :l_cod_unicom,
      :l_nom_unicom,
      :l_nombre,
      :l_direccion,
      :l_tfno_cel,
      :l_email1,
      :l_cod_estado,
      :l_desc_estado
FROM SGCPRO.SUMCON@DBLSGC A,
    SGCPRO.FINCAS@DBLSGC B,
    SGCPRO.CALLEJERO@DBLSGC C,
    SGCPRO.PROVINCIAS@DBLSGC D,
    SGCPRO.DEPTOS@DBLSGC E,
    SGCPRO.MUNICIPIOS@DBLSGC F,
    SGCPRO.LOCALIDADES@DBLSGC G,
    SGCPRO.CLIENTES@DBLSGC H,
    SGCPRO.UNICOM@DBLSGC I,
    SGCPRO.ESTADOS@DBLSGC J
WHERE  A.NIF = B.NIF
AND B.COD_CALLE = C.COD_CALLE
AND C.COD_PROV = D.COD_PROV
AND C.COD_DEPTO = E.COD_DEPTO
AND C.COD_MUNIC = F.COD_MUNIC
and C.COD_LOCAL = G.COD_LOCAL
and H.COD_CLI = A.COD_CLI
and A.COD_UNICOM = I.COD_UNICOM
and A.EST_SUM = J.ESTADO
and A.NIS_RAD = :l_nis_rad
USING sqlca;

select REGION
into :l_region
from REGION
where unicom=:l_cod_unicom 
USING sqlca;				
//TDA

SELECT f.CODIGO,       
       g.codigo
INTO  :l_codigosmt, :l_codssee
                    from aco_sum a,
                    sgd_acometida b,
                    sgd_salbt c,
                    sgd_ct d,
                    sgd_salmt f,
                    sgd_subestac g
                    where a.nis_rad = :l_nis_rad
                    and d.instalacion_origen = f.codigo
                    and f.instalacion_origen = g.codigo
                    and a.NRO_ACOMETIDA = b.codigo
                    and b.INSTALACION_ORIGEN = c.codigo
                    and c.INSTALACION_ORIGEN = d.codigo
                    and d.bdi_job = 0
                    and f.bdi_job = 0
                    and g.bdi_job = 0
                    and rownum=1
USING sqlca;

//Nuevo codigo 2018 para obtener el codigo de oficina y region
if l_nis_rad = "0" then
          l_nombre=is_avisos.gs_nombre+ " " +is_avisos.gs_ape1 +" "+is_avisos.gs_ape2
		 
	 	  select u.cod_unicom,U.NOM_UNICOM
		  INTO :l_cod_unicom,:l_nom_unicom
           from unicom u,deptos d,callejero c,provincias p,
           municipios m,localidades l
           where u.cod_calle=c.cod_calle
           and c.cod_depto=d.cod_depto and p.cod_prov=c.cod_prov
           and c.cod_munic=m.cod_munic and c.cod_local=l.cod_local
           and c.cod_prov=:aux_codprov and d.cod_depto=:aux_coddepto and m.cod_munic=:aux_codmun
           and l.cod_local=:aux_codloc
		  USING sqlca;
		  
		  select REGION
           into :l_region
           from REGION
           where unicom=:l_cod_unicom 
           USING sqlca;
		 
		 //obtiene el cod de region
end if

st_gestion st_gestion_param

st_gestion_param = fpr_aviso_gestion_ot24h(long(l_nis_rad))

INSERT INTO REGISTRO (ID,SEQ,TIPO,CORRELATIVO,NIS,CLIENTE,ESTADO,DIRECCION,ZONA,PERSONA_QUE_REPORTA,TEL1,TEL2,EMAIL,NO_AVISO,NO_RECLAMO,COD_CAUSA,NOM_CAUSA,OBSERVACIONES,FECHA_ALTA,FECHA_RESOLUCION,COD_USUARIO,NOM_USUARIO,HISTORICO,COD_ESTADO,MATRICULA) values (
										to_number(:l_sig_id),
										to_number(:l_sig_seq),
										to_char(:l_tipo),
										to_number(:l_correlativo),
										to_number(:l_nis_rad),
										to_char(:l_nombre),
										to_char(:l_desc_estado),
										to_char(:l_direccion),
										to_char(:l_nom_local),
										null,
										to_char(:l_tfno_cli),
										to_char(:l_tfno_cel),
										to_char(:l_email1),
										to_char(:l_aviso),
									   null,
										to_number(:l_cod_causa),
										to_char(:l_causa),
										to_char(:l_observaciones),
										TO_DATE(:l_fecha,'YYYYMMDD HH:MI:SS pm'),
										null,
										to_char(:g_cod_usuario),
										to_char(:g_nombre),
										to_number(0),
										to_char(:l_cod_estado),
										to_char(:l_varchar2))
							USING sqlca;							
													
							
INSERT INTO REGISTRO_GEO(ID,COD_DEPTO,NOM_DEPTO,COD_MUNIC,NOM_MUNIC, COD_LOCAL, NOM_LOCAL, COD_OFICINA,NOM_OFICINA,COD_REGION,NOM_REGION,COD_SMT,NOM_SMT,COD_SE,NOM_SE,COD_PIN,NOM_PIN,HISTORICO,SEQ,TIPO,CORRELATIVO) values (
to_number(:l_sig_id),
to_number(:l_cod_prov),
to_char(:l_nom_prov),
to_number(:l_cod_depto),
to_char(:l_nom_depto),
to_number(:l_cod_munic),
to_char(:l_nom_munic),
to_number(:l_cod_unicom),
to_char(:l_nom_unicom),
to_number(:l_cod_region),
to_char(:l_region),
to_number(:l_codigosmt),
null,
to_number(:l_codssee),
null,
to_number(0),
null,
to_number(1),
to_number(:l_sig_seq),
to_char(:l_tipo),
to_number(0))
USING sqlca;

INSERT INTO REGISTRO_GESTION(ID,SEQ,TIPO,CORRELATIVO, ID_GESTION, DESC_GESTION) values (
to_number(:l_sig_id),
to_number(:l_sig_seq),
to_char(:l_tipo),
to_number(:l_correlativo),
:st_gestion_param.l_id_gestion,
:st_gestion_param.l_desc_gestion
)
USING sqlca;

if sqlca.sqlcode <> 0 then
	return 1
else 
	return 0
end if
end function

public function any fpr_aviso_gestion_ot24h (long l_nis_rad_param);String l_gdif=""
String s_gestion = ""
			
SELECT tip_gest 
into :l_gdif
FROM gest_imp_munic@dblsgc 
WHERE cod_munic =( 
		 	SELECT c.cod_munic 
              		FROM callejero@dblsgc c 
	              WHERE cod_calle IN ( 
			 	SELECT cod_calle 
   		               FROM fincas@dblsgc 
         		         WHERE nif in (
						SELECT nif 
                  			        FROM sumcon@dblsgc 
			                       WHERE nis_rad =:l_nis_rad_param
				)
			)
		)
and est_gest ='GD001'														  
USING sqlca2;
		
SELECT descripcion
into :s_gestion
from gestion
where id=:l_gdif
using sqlca2;
					
if sqlca2.sqlcode<>0 then
	s_gestion='GESTION NORMAL'
	l_gdif='GD000'
end if

st_gestion st_gestion_param

st_gestion_param.l_id_gestion = l_gdif

st_gestion_param.l_desc_gestion = s_gestion

return st_gestion_param
end function

public function string f_truncar (string cadena, integer tamano);return trim(left(cadena,tamano))
end function

on u_avi_2004_pr_form_inf_resumen.create
call super::create
end on

on u_avi_2004_pr_form_inf_resumen.destroy
call super::destroy
end on


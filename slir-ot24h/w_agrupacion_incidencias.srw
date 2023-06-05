HA$PBExportHeader$w_agrupacion_incidencias.srw
$PBExportComments$Ventana de agrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias
forward
global type w_agrupacion_incidencias from w_sgigenerica
end type
type st_2 from statictext within w_agrupacion_incidencias
end type
type em_incid_hasta from editmask within w_agrupacion_incidencias
end type
type em_incid_desde from editmask within w_agrupacion_incidencias
end type
type st_hasta from statictext within w_agrupacion_incidencias
end type
type st_desde from statictext within w_agrupacion_incidencias
end type
type dw_filtro_inst from datawindow within w_agrupacion_incidencias
end type
type cb_buscar from commandbutton within w_agrupacion_incidencias
end type
type st_ins_afect from statictext within w_agrupacion_incidencias
end type
type d_deteccion from u_inc_2013_pr_desde_hasta within w_agrupacion_incidencias
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_agrupacion_incidencias
end type
type uo_barra from u_pr_gen_espera_act within w_agrupacion_incidencias
end type
type dw_lista_incidencias from u_inc_2021_pr_lista_incidencia within w_agrupacion_incidencias
end type
type cb_agrupar from commandbutton within w_agrupacion_incidencias
end type
type st_1 from statictext within w_agrupacion_incidencias
end type
type gb_2 from groupbox within w_agrupacion_incidencias
end type
type gb_1 from groupbox within w_agrupacion_incidencias
end type
end forward

global type w_agrupacion_incidencias from w_sgigenerica
integer x = 197
integer y = 348
integer width = 3264
integer height = 1680
string title = "OPEN SGI - Agrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias"
windowtype windowtype = response!
long backcolor = 79741120
event ue_post_open ( )
event ue_armar_sql ( )
event ue_retrieve ( )
st_2 st_2
em_incid_hasta em_incid_hasta
em_incid_desde em_incid_desde
st_hasta st_hasta
st_desde st_desde
dw_filtro_inst dw_filtro_inst
cb_buscar cb_buscar
st_ins_afect st_ins_afect
d_deteccion d_deteccion
dw_ambito dw_ambito
uo_barra uo_barra
dw_lista_incidencias dw_lista_incidencias
cb_agrupar cb_agrupar
st_1 st_1
gb_2 gb_2
gb_1 gb_1
end type
global w_agrupacion_incidencias w_agrupacion_incidencias

type variables
long il_incidencia_contenedora
long il_nro_inst_afectada
long il_int_no_resueltas
long il_int_pendientes
long il_nro_agrupacion
Long  il_ind_scada_cont, il_tip_incidencia_cont  // GNU 13-2-2006. Mejora 1
long il_nro_incidencias[] // GNU 4-4-2006. Incidencia 0/409568

int ii_estado_inc_cont
int ii_estado_agrupado
int ii_tip_incid_cont
int ii_alcance_incid_agrup
int ii_estado_indefinido = 100
int ii_orden_agrup
int ii_alcance_inc_cont
integer ii_estados[4,3]

Datetime idt_f_deteccion_inc_cont
Datetime idt_f_res_estimada
Datetime idt_f_actual
DateTime idt_fecha_desde
DateTime idt_fecha_hasta
DateTime idt_fec_resolucion

Boolean ib_existe_eb
Boolean ib_reenganche_visible = False
Boolean ib_existe_ot
Boolean ib_agrupado = False
Boolean lb_contenedora_nueva = False
Boolean ib_incidencia_bloqueada = False

String is_select_original

boolean ib_agrupando = False							//Variable que nos indica si se est$$HEX2$$e1002000$$ENDHEX$$agrupando
end variables

forward prototypes
public function integer wf_agrupar_incidencia (integer pi_fila)
public function boolean wf_agrupacion_permitida (integer pi_fila)
public function integer wf_obtener_estado (integer pi_fila)
public function integer wf_agrupar_datos_sgd_incidencia (integer pi_fila)
public function integer wf_insertar_seguimiento (long pl_nro_incidencia)
public function integer wf_agrupar_interrupciones (long pl_nro_incidencia)
public function integer wf_agrupar_maniobras (long pl_nro_incidencia)
public function integer wf_alta_gi_estado_oper_desagrup (long pl_nro_incidencia)
public function integer wf_agrupar_seguimiento (integer pi_fila)
public function integer wf_agrupar_avisos (long pl_nro_incidencia)
public function integer wf_analizar_eb ()
public function boolean wf_incidencia_de_operaciones (long pl_nro_incidencia)
public subroutine wf_deshacer_cambios ()
public function integer wf_alta_gi_incidencia_agrupada (long pl_nro_incidencia, integer pi_estado)
public function boolean wf_cambia_f_actual (long pl_nro_incidencia)
private function boolean wf_valido_fechas ()
protected function string wf_filtro_desde_hasta ()
public function integer wf_agrupar_inst_afect (long pl_nro_incidencia, long pl_nro_inst_afec)
public function integer wf_agrupar_simulaciones (long pl_nro_incidencia)
public function integer wf_agrupar_indisponibilidades (long pl_nro_incidencia)
public function integer wf_agrupar ()
protected function long wf_obtener_nro_agrup ()
public subroutine wf_inserta_registro_log (long pl_nro_incidencia, long pl_nro_agrupadora, string ps_observaciones)
end prototypes

event ue_post_open;int li_lock_status

// Se bloquea la incidencia contenedora
li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(il_incidencia_contenedora), fgci_bloqueo_incidencia, il_incidencia_contenedora)

IF li_lock_status <> 0 THEN
	Close(This)
	return
END IF

ib_incidencia_bloqueada = TRUE

is_select_original = dw_lista_incidencias.Describe("DataWindow.table.Select")

This.TriggerEvent("ue_armar_sql")
end event

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
// 20/11/2001	    	LFE					  		
/////////////////////////////////////////////////////////// 
Int li_estado
long ll_nro_inst_afectada
String ls_clausula_where, ls_modificacion, ls_filtro_ambito="", ls_filtro_deteccion=""
String ls_filtro_desde_hasta="", ls_filtro_tension=""

SetPointer(HourGlass!)

dw_ambito.AcceptText()
d_deteccion.AcceptText()

// Se validan los datos de los filtros
// En primer lugar se valida el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
If Long(em_incid_desde.Text) < 0 or Long(st_hasta) < 0  then 
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de incidencias no pueden ser menores que 0.")
	return
end if
If Long(em_incid_hasta.Text) = 0 and Long(em_incid_desde.Text) <> 0  then
   em_incid_hasta.Text =  em_incid_desde.Text
end if	
If Long(em_incid_desde.Text) = 0  and Long(em_incid_hasta.Text) <> 0  then
  	em_incid_desde.Text = em_incid_hasta.Text
end if	
If Long(em_incid_hasta.Text) - Long(em_incid_desde.Text) > 100 then
   em_incid_hasta.Text = String(Long(em_incid_desde.Text) + 100)
end if	
If Long(em_incid_hasta.Text) < Long(em_incid_desde.Text) then
	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de incidencias no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
	return
end if

// Se valida el filtro de fechas
IF wf_valido_fechas() THEN
	// Si las fechas son adecuadas se contin$$HEX1$$fa00$$ENDHEX$$a generando la SELECT
	
	// Reseteo las variables.
	ls_clausula_where = " "
	ls_modificacion=" "
	
	ls_filtro_desde_hasta = wf_filtro_desde_hasta()
	
	if trim(ls_filtro_desde_hasta) = ""  then
		// Si el filtro del N$$HEX1$$fa00$$ENDHEX$$mero de Incidencia est$$HEX2$$e1002000$$ENDHEX$$vac$$HEX1$$ed00$$ENDHEX$$o se filtra por $$HEX1$$e100$$ENDHEX$$mbito
		ls_filtro_ambito = dw_ambito.fnu_filtro_ambito_2(dw_ambito.getitemnumber(1,"nro_centro"), & 
																	 dw_ambito.getitemnumber(1,"nro_cmd") ,     &
																	 dw_ambito.getitemnumber(1,"nro_mesa"),0) // Parte del where para el ambito
		
		IF wf_incidencia_de_operaciones(il_incidencia_contenedora) THEN
			// Si el filtro del N$$HEX1$$fa00$$ENDHEX$$mero de Incidencia est$$HEX2$$e1002000$$ENDHEX$$vac$$HEX1$$ed00$$ENDHEX$$o se filtra por $$HEX1$$e100$$ENDHEX$$mbito y por
			// el filtro de fechas
			ls_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_2(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) // Parte del where para deteccion
		END IF
		
		ll_nro_inst_afectada = il_nro_inst_afectada
	else
		// El filtro del n$$HEX1$$fa00$$ENDHEX$$mero de incidencia tiene datos, por lo que no se tiene en cuenta
		// el resto de los filtros
		ll_nro_inst_afectada = 0 
		dw_ambito.fnu_insertar_datos(fgci_todos, fgci_todos, fgci_todos, 0)
	end if
		
	// Se traen aquellas incidencias que cumplan los criterios de los filtros
	IF ii_estado_agrupado = fgci_incidencia_resuelta THEN
		ls_clausula_where = " AND SGD_INCIDENCIA.EST_ACTUAL = " + string(fgci_incidencia_resuelta) 
	ELSE
		ls_clausula_where = " AND SGD_INCIDENCIA.EST_ACTUAL <= " + string(fgci_incidencia_servicio_repuesto) 
	END IF
	
	// GNU 13-2-2006. Mejora 1
	SELECT IND_SCADA, TIP_INCIDENCIA
	INTO :il_ind_scada_cont, :il_tip_incidencia_cont
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA= :il_incidencia_contenedora;
	
	IF ((il_ind_scada_cont= 1) OR (il_tip_incidencia_cont= 2)) AND ii_alcance_inc_cont =  fgci_incidencia_sin_interrupcion  THEN
	ls_clausula_where += " AND ( (SGD_INCIDENCIA.IND_SCADA = 1   AND SGD_INCIDENCIA.ALCANCE =3 ) "&
							 + " OR SGD_INCIDENCIA.NRO_INST_AFECTADA = DECODE(" + string(ll_nro_inst_afectada) + ",0 ,SGD_INCIDENCIA.NRO_INST_AFECTADA, " + string(il_nro_inst_afectada) + ")) " &
							 +	" AND SGD_INCIDENCIA.ALCANCE <>  " + String(fgci_incidencia_de_suministro) &
							 + " AND SGD_INCIDENCIA.NRO_INCIDENCIA <> " + string(il_incidencia_contenedora) &
							 + " AND NVL(SGD_INCIDENCIA.OT,0) NOT IN " &
							 + "      (SELECT NRO_OT FROM GI_OT WHERE NRO_INCIDENCIA = SGD_INCIDENCIA.NRO_INCIDENCIA) " 
	ELSEIF ((il_ind_scada_cont= 1) OR (il_tip_incidencia_cont= 2)) AND ii_alcance_inc_cont <> fgci_incidencia_sin_interrupcion   THEN
	ls_clausula_where += " AND ( SGD_INCIDENCIA.IND_SCADA = 1 " &
							 + " OR SGD_INCIDENCIA.NRO_INST_AFECTADA = DECODE(" + string(ll_nro_inst_afectada) + ",0 ,SGD_INCIDENCIA.NRO_INST_AFECTADA, " + string(il_nro_inst_afectada) + ")) " &
							 +	" AND SGD_INCIDENCIA.ALCANCE <>  " + String(fgci_incidencia_de_suministro) &
							 + " AND SGD_INCIDENCIA.NRO_INCIDENCIA <> " + string(il_incidencia_contenedora) &
							 + " AND NVL(SGD_INCIDENCIA.OT,0) NOT IN " &
							 + "      (SELECT NRO_OT FROM GI_OT WHERE NRO_INCIDENCIA = SGD_INCIDENCIA.NRO_INCIDENCIA) " 
	ELSE // FIN GNU
	ls_clausula_where += " AND SGD_INCIDENCIA.TIP_INCIDENCIA = " + String(fgci_incidencia_imprevista) &
							 +	" AND SGD_INCIDENCIA.ALCANCE <>  " + String(fgci_incidencia_de_suministro) &
							 + " AND SGD_INCIDENCIA.NRO_INCIDENCIA <> " + string(il_incidencia_contenedora) &
							 + " AND SGD_INCIDENCIA.NRO_INST_AFECTADA = DECODE(" + string(ll_nro_inst_afectada) + ",0 ,SGD_INCIDENCIA.NRO_INST_AFECTADA, " + string(il_nro_inst_afectada) + ")"&
							 + " AND NVL(SGD_INCIDENCIA.OT,0) NOT IN " &
							 + "      (SELECT NRO_OT FROM GI_OT WHERE NRO_INCIDENCIA = SGD_INCIDENCIA.NRO_INCIDENCIA) " 
	END IF
	
	
	//AHM(09/12/2010)	 No se puede agrupar una incidencia programada, la incidencia programada s$$HEX1$$f300$$ENDHEX$$lo puede ser la contenedora
	ls_clausula_where += " AND SGD_INCIDENCIA.TIP_INCIDENCIA <> " + String(fgci_incidencia_programada) 
	
	if trim(ls_filtro_ambito) <> "" then
		ls_clausula_where = ls_clausula_where + " and " + ls_filtro_ambito 
	end if
	
	if trim(ls_filtro_deteccion) <> ""  then
		ls_clausula_where = ls_clausula_where +" AND "+ ls_filtro_deteccion 
	end if						

	if trim(ls_filtro_desde_hasta) <> ""  then
		ls_clausula_where = ls_clausula_where +" AND "+ ls_filtro_desde_hasta
	end if						
	
	IF NOT ib_existe_ot THEN
		// La incidencia contenedora no tiene OT.
		// No se deben mostrar las incidencias agrupadas sin OT
		ls_clausula_where = ls_clausula_where + " AND NVL(NRO_AGRUPACION,0) = 0 "
	END IF
	
	IF wf_incidencia_de_operaciones(il_incidencia_contenedora) AND &
		gi_tension_nivel_min = fgci_media_tension THEN
		
		ls_filtro_tension = " AND SGD_INSTALACION.TIPO_INSTALACION < " + string (fgci_tipo_ct) + " " 
	END IF
		
	// Forma la cl$$HEX1$$e100$$ENDHEX$$usula where
	
	ls_modificacion = "DataWindow.table.Select=~"" + is_select_original + ls_clausula_where + ls_filtro_tension + "~""
		
	dw_lista_incidencias.modify(ls_modificacion)
	
	dw_lista_incidencias.settransobject(sqlca)
	
	this.triggerevent("ue_retrieve")
END IF

end event

event ue_retrieve;DataWindowChild dw_datos

long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

this.setredraw(false)
dw_lista_incidencias.setredraw(false)
dw_lista_incidencias.retrieve(il_nro_inst_afectada)

dw_lista_incidencias.selectrow(0,False)

dw_lista_incidencias.setredraw(true)	
this.setredraw(true)				

if dw_lista_incidencias.rowcount()=0 then
	gnv_msg.f_mensaje("AI75","","",OK!)
end if


end event

public function integer wf_agrupar_incidencia (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_incidencia
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa UNA incidencia con la incidencia seleccionada en la ventana
//				 w_1234_consulta_incidencias
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//				  -1  -->  el trigger de incidencias anidadas ha modificado la incidencia 
//							  contenedora, con lo que no se puede continuar con la agrupaci$$HEX1$$f300$$ENDHEX$$n.
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 20/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
long ll_nro_interrupciones, ll_nro_incidencia
int li_lock_status, li_retorno = 1
string ls_mensaje
Boolean lb_inc_operacion
w_2301_form_incidencia ls_ventana

This.SetFocus()
uo_barra.visible=true
uo_barra.barra.f_resetea_barra()
uo_barra.barra.f_amplia(0)
SetPointer(Hourglass!)
uo_barra.gb_1.text="Agrupando Incidencia..."

ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_incidencia')
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_incidencia")						

lb_inc_operacion = wf_incidencia_de_operaciones(ll_nro_incidencia)

// En primer lugar se bloquea la incidencia
uo_barra.barra.f_amplia(10)
uo_barra.gb_1.text="Bloqueando Incidencia " + string(ll_nro_incidencia)

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Bloqueo de la incidencia")
li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)

IF li_lock_status <> 0 THEN
	// La incidencia ya se encuentra bloqueada
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Incidencia bloqueada anteriormente no se puede agrupar")
	li_retorno = 0
ELSE
	// Si la incidencia que se desea agrupar es una incidencia con p$$HEX1$$e900$$ENDHEX$$rdida se obtienen las
	// interrupciones pendientes
	IF dw_lista_incidencias.GetItemNumber(pi_fila, 'sgd_incidencia_alcance') = fgci_incidencia_con_interrupcion THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(ll_nro_incidencia) + " es una incidencia con p$$HEX1$$e900$$ENDHEX$$rdida")
		// Interrupciones resueltas
		SELECT COUNT(*) 
		INTO :ll_nro_interrupciones
		FROM SGD_INTERRUPCION
		WHERE NRO_INCIDENCIA = :ll_nro_incidencia
			AND ( (F_ALTA_FASE_A IS NOT NULL AND F_REPOSICION_FASE_A IS NULL)
				OR (F_ALTA_FASE_B IS NOT NULL AND F_REPOSICION_FASE_B IS NULL)
				OR (F_ALTA_FASE_C IS NOT NULL AND F_REPOSICION_FASE_C IS NULL) 
				OR (F_ALTA IS NOT NULL AND F_REPOSICION IS NULL));

		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "N$$HEX1$$fa00$$ENDHEX$$mero de interrupciones resueltas " + string(ll_nro_interrupciones))
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		
		IF SQLCA.SQLCode <> 0 THEN
			ll_nro_interrupciones = 0 
		END IF
		
		il_int_no_resueltas += ll_nro_interrupciones
		
		// Total de interrupciones
		SELECT COUNT(*) 
		INTO :ll_nro_interrupciones
		FROM SGD_INTERRUPCION
		WHERE NRO_INCIDENCIA = :ll_nro_incidencia;
	
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "N$$HEX1$$fa00$$ENDHEX$$mero total de interrupciones " + string(ll_nro_interrupciones))
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

		IF SQLCA.SQLCode <> 0 THEN
			ll_nro_interrupciones = 0 
		END IF
		
		il_int_pendientes += ll_nro_interrupciones
	END IF
	
	// Se obtiene el estado de la incidencia agrupada
	ii_estado_agrupado = wf_obtener_estado(pi_fila)
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Estado de la agrupaci$$HEX1$$f300$$ENDHEX$$n " + string(ii_estado_agrupado))
	uo_barra.barra.f_amplia(20)
	uo_barra.gb_1.text="A$$HEX1$$f100$$ENDHEX$$adiendo Incidencia..." 
	// Se a$$HEX1$$f100$$ENDHEX$$ade un registro con los datos de la incidencia que se desea agrupar en la
	// tabla GI_SEGUIMIENTO_AGRUPACION
	li_retorno = wf_insertar_seguimiento(ll_nro_incidencia)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se ha podido dar de alta la Incidencia " + String(ll_nro_incidencia) + " en la Agrupaci$$HEX1$$f300$$ENDHEX$$n."
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)
	END IF
	
	uo_barra.barra.f_amplia(30)
	uo_barra.gb_1.text="Agrupando datos Incidencia..." 
	// Se agrupa la incidencia
	IF li_retorno > 0 THEN
		li_retorno = wf_agrupar_datos_sgd_incidencia(pi_fila)
		IF li_retorno = 0 THEN
			ls_mensaje = "No se ha podido agrupar la informaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incidencia) + "." 
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)			
		END IF
	END IF	
	
	uo_barra.barra.f_amplia(40)
	uo_barra.gb_1.text="Agrupando Interrupciones..." 
	// Se agrupan las interrupciones. Los reenganches no tienen interrupciones
	IF li_retorno > 0 THEN
		li_retorno = wf_agrupar_interrupciones(ll_nro_incidencia)
		IF li_retorno = 0 THEN
			ls_mensaje = "No se han podido agrupar las interrupciones de la Incidencia " + String(ll_nro_incidencia) + "."
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)
		END IF
	END IF
	
//LSH INI 26/07/2013 DEO12-00000054 
//	// GNU 23-8-2007. Mejora EPSA Indisponibilidades
//	IF fg_verifica_parametro("indisponibilidades activas") THEN
//		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Indisponibilidades activas")
//		uo_barra.barra.f_amplia(45)
//		uo_barra.gb_1.text="Agrupando Indisponibilidades..." 
//		IF li_retorno > 0 THEN
//			li_retorno = wf_agrupar_indisponibilidades(ll_nro_incidencia)
//			IF li_retorno = 0 THEN
//				ls_mensaje = "No se han podido agrupar las indisponibilidades de la Incidencia " + String(ll_nro_incidencia) + "."
//				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)				
//			END IF
//		END IF
//	END IF
//LSH INI 26/07/2013 DEO12-00000054 
	
	uo_barra.barra.f_amplia(50)
	uo_barra.gb_1.text="Agrupando Maniobras..." 
	// Se agrupan las maniobras. 
	IF li_retorno > 0 THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Agrupaci$$HEX1$$f300$$ENDHEX$$n de las maniobras")
		li_retorno = wf_agrupar_maniobras(ll_nro_incidencia)
		IF li_retorno = 0 THEN
			ls_mensaje = "No se han podido agrupar las maniobras de la Incidencia " + String(ll_nro_incidencia) + "."
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)				
		END IF
	END IF
	
	uo_barra.barra.f_amplia(60)
	uo_barra.gb_1.text="Agrupando Estados..." 
	// Se agrupan los estados. Los reenganches no tienen estados.
	IF li_retorno > 0 THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Agrupaci$$HEX1$$f300$$ENDHEX$$n de los estados")				
		li_retorno = wf_agrupar_seguimiento(pi_fila)
		IF li_retorno = 0 THEN
			ls_mensaje = "No se ha podido agrupar la informaci$$HEX1$$f300$$ENDHEX$$n asociada a los estados de la Incidencia " + String(ll_nro_incidencia) + "."
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)
		END IF
	END IF
	
	uo_barra.barra.f_amplia(70)
	uo_barra.gb_1.text="Agrupando Avisos..." 
	// Se agrupan los avisos. Los reenganches no tienen avisos
	IF li_retorno > 0 THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Agrupaci$$HEX1$$f300$$ENDHEX$$n de los avisos")
		li_retorno = wf_agrupar_avisos(ll_nro_incidencia)
		IF li_retorno = 0 THEN
			ls_mensaje = "No se han podido agrupar los aasociados a la Incidencia " + String(ll_nro_incidencia) + "."
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)
		END IF
	END IF
	
	uo_barra.barra.f_amplia(80)
	uo_barra.gb_1.text="Analizando Estado..." 
	// Se comprueba si hay que eliminar el estado EB
	IF li_retorno > 0 THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Analizando estados")
		li_retorno = wf_analizar_eb()
		IF li_retorno = 0 THEN
			ls_mensaje = "No se ha podido analizar el nuevo estado de la Agrupaci$$HEX1$$f300$$ENDHEX$$n al asociar la Incidencia ~r~n" + String(ll_nro_incidencia) + "."
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)
		END IF
	END IF
	
	uo_barra.barra.f_amplia(90)
	uo_barra.gb_1.text="Desbloqueando Incidencia " + string(ll_nro_incidencia) 
	// Se desbloquea la incidencia
	uo_barra.barra.f_amplia(100)
	
	// Antes de realizar el commit se comprueba que no haya cambiado la fecha actual
	// de la incidencia contenedora
	IF li_retorno = 1 THEN
		IF wf_cambia_f_actual(il_incidencia_contenedora) THEN
			li_retorno = -1
			ls_mensaje = "No se ha podido realizar de manera completa la agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias debido a que ~r~nmaniobras de otra incidencia han modificado el estado de la incidencia " + string(il_incidencia_contenedora) + "."
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)
		END IF
	END IF
	
	// Se da de baja la incidencia
	IF li_retorno = 1 AND lb_inc_operacion AND ii_estado_agrupado <> fgci_incidencia_resuelta THEN		
		uo_barra.gb_1.text="Notificando Serv. Operaci$$HEX1$$f300$$ENDHEX$$n "
		il_nro_incidencias[Upperbound(il_nro_incidencias)+1]=ll_nro_incidencia
 		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Se da de baja incidencia")
		// Se notifica al servidor de Operaci$$HEX1$$f300$$ENDHEX$$n que se da de baja la incidencia
		// GNU 6-4-2006
//		IF gu_rf_servidor_operacion.of_avisar_baja_incidencia(ll_nro_incidencia, ls_mensaje) = 0 THEN
//			li_retorno = 0
//		END IF
// FIN GNU
	END IF
	
	IF li_retorno = 1 AND lb_inc_operacion AND ii_estado_agrupado <> fgci_incidencia_resuelta THEN		
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Agrupando simulaciones")
		li_retorno = wf_agrupar_simulaciones(ll_nro_incidencia)	
		IF li_retorno = 0 THEN
			ls_mensaje = "No se han podido agrupar los datos de la simulaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incidencia) + "."
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)
		END IF
	END IF
	
	IF li_retorno = 1 THEN	
		gnu_u_transaction.uf_commit(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)
		
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Realizaci$$HEX1$$f300$$ENDHEX$$n del commit ")
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		
		// AVISAMOS A OTROS SGI de que la incidencia se ha eliminado
		if isvalid(gu_operaciones) AND ii_estado_agrupado <> fgci_incidencia_resuelta then
			gu_operaciones.of_avisar_sgi(ll_nro_incidencia)
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Avisa a otros sgi ")			
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)			
		end if
		// AVISAMOS AL PROPIO SGI de que la incidencia se ha eliminado, por si la tuviera
		// abierta en modo consulta
		if isvalid(gu_control_v_incidencias) AND ii_estado_agrupado <> fgci_incidencia_resuelta then
			ls_ventana = gu_control_v_incidencias.of_busca_ventana(ll_nro_incidencia,-1)
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Busca la ventana para refrescar")						
			if not isnull(ls_ventana) then // ESTA ABIERTA
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Ventana abierta")						
				if ls_ventana.lu_comunic.is_comunic.Accion_llamada = "Consulta" then // SOLO PARA CONSULTA
					gu_control_v_incidencias.of_actualiza_operaciones(ll_nro_incidencia,true,-1)
					wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Ventana se refresca")						
				end if
			end if
		end if
	ELSE
		gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, ls_mensaje)						
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje,StopSign!)
	END IF
END IF

uo_barra.visible = false
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_incidencia")						
return li_retorno
end function

public function boolean wf_agrupacion_permitida (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupacion_permitida
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que indica si se permite agrupar dos incidencias: la incidencia 
//			    seleccionada en la ventana w_1234_consulta_incidencias (I1) y la incidencia
//				 que se pretende agrupar desde esta ventana (I2).
//				 Condiciones de la agrupaci$$HEX1$$f300$$ENDHEX$$n:
//
//			- 1$$HEX1$$aa00$$ENDHEX$$: Si I1 tiene OT entonces la Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n de I1 tiene que ser menor
//				   que la Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n de I2.
//
//			- 2$$HEX1$$ba00$$ENDHEX$$: Si I1 es una Incidencia Programada, el estado de I1 tiene que ser igual o
//					superior a EB. Adem$$HEX1$$e100$$ENDHEX$$s, las posibles maniobras e interrupciones de I2 tienen
//					que tener una fecha de alta superior a la Fecha de EB de I1. Si I2 fuera una
//					incidencia programada, $$HEX1$$e900$$ENDHEX$$sta no puede tener definidas interrupciones.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  
//   
//    Devuelve: 
//					TRUE  -->  Agrupaci$$HEX1$$f300$$ENDHEX$$n permitida
//					FALSE -->  Agrupaci$$HEX1$$f300$$ENDHEX$$n no permitida
//
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 20/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

Boolean lb_retorno = TRUE
long ll_nro_incid, ll_tip_incid, ll_num
String ls_mensaje = ""
DateTime ldt_fecha_eb, ldt_fec_resolucion

long ll_nro_indisponibilidades

ll_nro_incid = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_incidencia')
ll_tip_incid = dw_lista_incidencias.GetItemNumber(pi_fila, 'tip_incidencia')

// Si las incidencias est$$HEX1$$e100$$ENDHEX$$n en estado RS se comprueba que no se haya efectuado el cierre del MCI
// para el mes de la incidencia

// GNU 23-8-2007. Mejora EPSA-operaci$$HEX1$$f300$$ENDHEX$$n. Ahora permito agrupar incidencias con indisponibilidades
// GNU 31-10-2006. Mejora EPSA
//IF fg_verifica_parametro("indisponibilidades activas") THEN
//	SELECT COUNT(*)
//	INTO :ll_nro_indisponibilidades
//	FROM SGD_INDISPONIBILIDAD
//	WHERE nro_incidencia= :ll_nro_incid;
//	
//	IF ll_nro_indisponibilidades > 0 THEN
//		ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incid) +&
//						 " sobre la Incidencia " + String(il_incidencia_contenedora) + &
//						 ", ~r~n debido a que tiene indisponibilidades"
//		lb_retorno = FALSE
//	END IF
//END IF
// FIN GNU

IF ii_estado_agrupado = fgci_incidencia_resuelta THEN
	wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "El estado de la agrupaci$$HEX1$$f300$$ENDHEX$$n es resuelto")
	ldt_fec_resolucion = dw_lista_incidencias.GetItemDateTime(pi_fila, 'fec_resolucion')
	
	SELECT COUNT(*)
	INTO :ll_num
	FROM SCI_IND_TEC_HIST
	WHERE SCI_IND_TEC_HIST.ANNO * 100 + SCI_IND_TEC_HIST.MES = to_number(to_char(:ldt_fec_resolucion,'yyyymm'));

	wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Comprueba si ha sido contabilizada en cierre de MCI ")
	wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

	IF SQLCA.SQLCode <> 0 THEN
		ll_num = 0
	END IF
	
	IF ll_num > 0 THEN
		ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incid) +&
					 " sobre la Incidencia " + String(il_incidencia_contenedora) + &
					 ", ~r~ndebido a que la primera ha sido contabilizada en el cierre del MCI."
						
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Incidencia contabilizada en el cierre del MCI")
			
		lb_retorno = FALSE
	END IF
	
	ll_num = 0
END IF

// Se comprueba el nivel de tensi$$HEX1$$f300$$ENDHEX$$n de la incidencia seleccionada
IF lb_retorno AND wf_incidencia_de_operaciones(il_incidencia_contenedora) <> wf_incidencia_de_operaciones(ll_nro_incid) THEN
	ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incid) +&
					 " sobre la Incidencia " + String(il_incidencia_contenedora) + &
					 ", ~r~ndebido a que los niveles de tensi$$HEX1$$f300$$ENDHEX$$n son incompatibles." 
   wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Niveles de tensi$$HEX1$$f300$$ENDHEX$$n incompatibles")
	lb_retorno = FALSE
END IF

// Se comprueba si la incidencia I1 tiene OT
IF ii_estado_inc_cont >= fgci_incidencia_enviado_brigada AND ib_existe_ot AND lb_retorno THEN
	wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "La incidencia tiene ot")
	// La incidencia I1 tiene OT. Hay que comparar las fechas de detecci$$HEX1$$f300$$ENDHEX$$n
	lb_retorno =  idt_f_deteccion_inc_cont <= dw_lista_incidencias.GetItemDatetime(pi_fila, 'f_deteccion') 
	IF NOT lb_retorno THEN
		ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incid) +&
						 " sobre la Incidencia " + String(il_incidencia_contenedora) + &
						 ", ~r~ndebido a que la fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + + String(ll_nro_incid) + &
						 " es inferior a la de la ~r~nIncidencia con OT " + String(il_incidencia_contenedora) + "."
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, ls_mensaje)
	END IF
END IF

IF lb_retorno and ii_tip_incid_cont = fgci_incidencia_programada THEN
	wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Una de las incidencias es programada")
	// Una de las incidencias es programada
	IF ii_estado_inc_cont = fgci_incidencia_pendiente THEN
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Incidencia programada en estado pendiente, no se puede agrupar")		
		lb_retorno = FALSE
		ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incid) +&
						 " sobre la Incidencia ~r~nProgramada " + String(il_incidencia_contenedora) + &
						 ", debido a que la Incidencia Programada est$$HEX2$$e1002000$$ENDHEX$$en estado Pendiente."
		
	END IF
	
	// Se comprueba a continuaci$$HEX1$$f300$$ENDHEX$$n que la incidencia que se desea agrupar es programada tambi$$HEX1$$e900$$ENDHEX$$n.
	// En este caso no debe tener definidas interrupciones
	IF ll_tip_incid = fgci_incidencia_programada THEN
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "La incidencia que se desea agrupar es programada")
		
		SELECT COUNT(*)
		INTO :ll_num
		FROM SGD_INTERRUPCION
		WHERE NRO_INCIDENCIA = :ll_nro_incid;
		
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "N$$HEX1$$fa00$$ENDHEX$$mero de interrupciones " + string(ll_num))
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		
		lb_retorno = (SQLCA.SQLCode = 0) AND (ll_num = 0)
		
		IF NOT lb_retorno THEN
			ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia Programada " + String(ll_nro_incid) +&
						 " sobre la ~r~nIncidencia Programada " + String(il_incidencia_contenedora) + &
						 ", debido a que la primera incidencia tiene definidas ~r~ninterrupciones."
			wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, ls_mensaje)
		END IF
	END IF
	
	// Hay que comprobar las fechas de alta de las interrupciones y maniobras de la 
	// incidencia I2
	IF lb_retorno THEN
		// Se comprueba que no existan interrupciones con fecha inferior a la fecha de EB de I1
		// Se obtiene en primer lugar la fecha de EB de la incidencia contenedora
		SELECT F_ALTA 
		INTO :ldt_fecha_eb
		FROM SGD_ESTADO_OPER
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
				AND COD_ESTADO = :fgci_incidencia_enviado_brigada;
		
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Captura de la fecha de estado eb de la incidencia contenedora ")
		wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		
		IF SQLCA.SQLCode <> 0 THEN
			lb_retorno = FALSE
			ls_mensaje = "No se ha podido determinar la fecha de EB de la Incidencia Programada " + String(il_incidencia_contenedora) + "."
			wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, ls_mensaje)
			wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		END IF	
		
		IF lb_retorno THEN
			// Se buscan interrupciones anteriores a la fecha de EB de la incidencia contenedora
			SELECT COUNT(*) 
			INTO :ll_num
			FROM SGD_INTERRUPCION
			WHERE NRO_INCIDENCIA = :ll_nro_incid
				AND F_ALTA < :ldt_fecha_eb;
				
			wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Busqueda de interrupciones anteriores a la fecha de EB ")
			wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

			lb_retorno =  (SQLCA.SQLCode = 0) AND (ll_num = 0)
			
			IF NOT lb_retorno THEN
				ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incid) +&
							 " sobre la Incidencia " + String(il_incidencia_contenedora) + &
							 ",~r~ndebido a que existen interrupciones en la Incidencia " + + String(ll_nro_incid) + &
							 " con fecha inferior a la fecha~r~nde EB a la de la Incidencia Programada " + String(il_incidencia_contenedora) + "."
				wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, ls_mensaje)
			END IF
			
			IF lb_retorno THEN
				// Se comprueba ahora que no existan maniobras con fecha inferior a la 
				// fecha de EB de I1
				SELECT COUNT(*) 
				INTO :ll_num
				FROM SGD_MANIOBRA
				WHERE NRO_INCIDENCIA = :ll_nro_incid
					AND FECHA < :ldt_fecha_eb;
				wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, "Comprueba que no existan maniobras con fecha inferior a la fecha de EB de incidencia " + string(ll_nro_incid))
				wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
					
				lb_retorno =  (SQLCA.SQLCode = 0) AND (ll_num = 0)
				
				IF NOT lb_retorno THEN
					ls_mensaje = "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(ll_nro_incid) +&
							 " sobre la Incidencia " + String(il_incidencia_contenedora) + &
							 ",~r~ndebido a que existen maniobras en la Incidencia " + + String(ll_nro_incid) + &
							 " con fecha inferior a la fecha ~r~nde EB a la de la Incidencia Programada " + String(il_incidencia_contenedora) + "."
					wf_inserta_registro_log(ll_nro_incid, il_incidencia_contenedora, ls_mensaje)
				END IF
			END IF
		END IF			

	END IF
END IF

IF len(ls_mensaje) > 0 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
END IF

return lb_retorno
end function

public function integer wf_obtener_estado (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_obtener_estado
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve el estado resultante de la incidencia agrupada a partir de
//				 la agrupaci$$HEX1$$f300$$ENDHEX$$n de dos incidencias
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  
//
// Devuelve: 
//			El estado de la incidencia agrupada
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 20/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
int li_estado_incidencia, li_alcance

SetPointer(Hourglass!)
wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "wf_obtener_estado")

IF ii_estado_agrupado <> fgci_incidencia_resuelta THEN
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Estado de la agrupacion no es resuelta")	

	li_alcance = dw_lista_incidencias.GetItemNumber(pi_fila, 'sgd_incidencia_alcance')
	li_estado_incidencia = dw_lista_incidencias.GetItemNumber(pi_fila, 'est_actual')
	
	IF li_estado_incidencia > fgci_incidencia_enviado_brigada THEN
		wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Estado de la agrupaci$$HEX1$$f300$$ENDHEX$$n > eb se reduce en uno el acceso a la matriz")
		li_estado_incidencia -- // Se reduce en uno el acceso a la matriz
	END IF
	
	IF ii_estados[ii_estado_agrupado, li_estado_incidencia] = ii_estado_indefinido THEN
		wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "La incidencia puede estar en estado PT, EB, ER, o SR, dependiendo de la existencia o " +&
		 "no de OT y del estado de las posibles interrupciones")
		// La incidencia puede estar en estado PT, EB, ER, o SR, dependiendo de la existencia o
		// no de OT y del estado de las posibles interrupciones
		IF il_int_pendientes = 0 OR il_int_no_resueltas = 0 THEN 
			wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "No existen interrupciones o de las que existen todas est$$HEX1$$e100$$ENDHEX$$n resueltas")				
			// No existen interrupciones o de las que existen todas est$$HEX1$$e100$$ENDHEX$$n resueltas		
			IF il_int_pendientes = 0 THEN
				wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "No existen interrupciones")				
				// La dos incidencias son sin p$$HEX1$$e900$$ENDHEX$$rdida. El estado es el de la incidencia contenedora
				IF ii_alcance_incid_agrup = fgci_incidencia_sin_interrupcion AND &
					li_alcance = fgci_incidencia_sin_interrupcion THEN
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Las dos incidencias son sin p$$HEX1$$e900$$ENDHEX$$rdida, el estado es el de la incidencia contenedora")	
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
					return ii_estado_agrupado
				ELSE		
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "No se cumple que las dos incidencias sean sin p$$HEX1$$e900$$ENDHEX$$rdida")	
					IF ib_existe_eb THEN
						wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Alguna tiene estado eb -> estado eb")	
						wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
						return fgci_incidencia_enviado_brigada
					ELSE
						wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Ninguna tiene estado eb -> estado incidencia pendiente")	
						wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
						return fgci_incidencia_pendiente
					END IF
				END IF
			ELSE
				wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Las interrupciones que existen est$$HEX1$$e100$$ENDHEX$$n resueltas -> estado servicio repuesto")				
				wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
				return fgci_incidencia_servicio_repuesto
			END IF
		ELSE
			wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "no cumple que no existan interrupciones o de las que existen todas est$$HEX1$$e100$$ENDHEX$$n resueltas")				
			IF il_int_no_resueltas = il_int_pendientes THEN
				wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Todas las interrupciones est$$HEX1$$e100$$ENDHEX$$n pendientes")				
				// todas las interrupciones pendientes
				IF ib_existe_eb THEN
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Alguna tiene estado eb -> estado eb")	
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
					return fgci_incidencia_enviado_brigada
				ELSE
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Ninguna tiene estado eb -> estado incidencia pendiente")	
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
					return fgci_incidencia_pendiente
				END IF
			ELSE
				wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "No todas las interrupciones est$$HEX1$$e100$$ENDHEX$$n pendientes -> estado en reposici$$HEX1$$f300$$ENDHEX$$n")				
				wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
				return fgci_incidencia_en_reposicion
			END IF
		END IF
	ELSE
		wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "No cumple que la incidencia puede estar en estado PT, EB, ER, o SR, dependiendo de la existencia o " +&
		 "no de OT y del estado de las posibles interrupciones -> estado " + string(ii_estados[ii_estado_agrupado, li_estado_incidencia]))
		wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
		Return ii_estados[ii_estado_agrupado, li_estado_incidencia]
	END IF
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")	
	return 1
ELSE
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Estado de la agrupacion no es resuelta -> estado resuelta")	
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_obtener_estado")
	return fgci_incidencia_resuelta
END IF
end function

public function integer wf_agrupar_datos_sgd_incidencia (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_datos_sgd_incidencia
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa los datos de SGD_INCIDENCIA de dos incidencias sobre la 
//				 incidendencia contenedora. Antes de agrupar los datos se insertar$$HEX1$$e100$$ENDHEX$$n las
//				 incidencias agrupadas en la tabla GI_INCIDENCIA_AGRUPADA.
//				 En el caso de querer agrupar un reeganche se insertar$$HEX2$$e1002000$$ENDHEX$$la incidencia en la
//				 tabla GI_REENGANCHE_AGRUPADO
//				 
//		 		Los datos agrupados ser$$HEX1$$e100$$ENDHEX$$n:
//			
//				 --> Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n: m$$HEX1$$ed00$$ENDHEX$$nima de las fechas de detecci$$HEX1$$f300$$ENDHEX$$n.
//				 --> Fecha de Resoluci$$HEX1$$f300$$ENDHEX$$n: m$$HEX1$$e100$$ENDHEX$$xima de las fechas de resoluci$$HEX1$$f300$$ENDHEX$$n.
//				 --> Descripci$$HEX1$$f300$$ENDHEX$$n: uni$$HEX1$$f300$$ENDHEX$$n de las descripciones.
//				 --> Observaciones: uni$$HEX1$$f300$$ENDHEX$$n de las observaciones.
//				 --> Instalaci$$HEX1$$f300$$ENDHEX$$n Origen: la instalaci$$HEX1$$f300$$ENDHEX$$n origen de la incidencia contenedora.
//				 --> Tipo de incidencia: Imprevista - Imprevista = Imprevista
//												 Imprevista - Programada = Programada
//				 --> Alcance: si al menos una de las incidencias es con p$$HEX1$$e900$$ENDHEX$$rdida, la incidencia
//								  agrupada ser$$HEX2$$e1002000$$ENDHEX$$una incidencia con p$$HEX1$$e900$$ENDHEX$$rdida
//				 --> Causa y Fecha de Causa: causa y fecha de la incidencia contenedora.
// 			 --> Material Averiado: material de la incidencia contenedora.
//				 --> Tensi$$HEX1$$f300$$ENDHEX$$n Origen, Tensi$$HEX1$$f300$$ENDHEX$$n Afectada, Agente y $$HEX1$$c100$$ENDHEX$$rea Afectada: las de la 
//									incidencia contenedora
//
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 21/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
long ll_nro_incidencia, ll_nro_inst_origen
int li_retorno = 1, li_ind_scada, li_ind_obligada 
DateTime  ldt_f_nula
String ls_descripcion='', ls_observacion='', ls_salto = '~r~n'

SetPointer(Hourglass!)
ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_incidencia')
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_datos_sgd_incidencia")

//////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////  Fecha de detecci$$HEX1$$f300$$ENDHEX$$n /////////////////////////////////////
IF idt_f_deteccion_inc_cont > dw_lista_incidencias.GetItemDateTime(pi_fila, 'f_deteccion') THEN
	idt_f_deteccion_inc_cont = dw_lista_incidencias.GetItemDateTime(pi_fila, 'f_deteccion')
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la agrupacion" + string(idt_f_deteccion_inc_cont))
END IF
//////////////////////////////////////////////////////////////////////////////////////////

// En el caso de los reenganches no hay que tener en cuenta estos datos
li_ind_scada = dw_lista_incidencias.GetItemNumber(pi_fila, 'ind_scada')

//// INDICADOR OBLIGADA VERSION UNIFICADA AMR 29/08/2002////////////////////////////////////
li_ind_obligada = dw_lista_incidencias.GetItemNumber(pi_fila, 'sgd_incidencia_ind_obligada')
////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////// Fecha de Resoluci$$HEX1$$f300$$ENDHEX$$n estimada /////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
IF IsNull(idt_f_res_estimada) OR &
	idt_f_res_estimada < dw_lista_incidencias.GetItemDateTime(pi_fila, 'f_est_res') THEN
	
	idt_f_res_estimada = dw_lista_incidencias.GetItemDateTime(pi_fila, 'f_est_res')
	
	IF idt_f_res_estimada = ldt_f_nula THEN
		SetNull(idt_f_res_estimada)
	END IF
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Fecha de resoluci$$HEX1$$f300$$ENDHEX$$n estimada" + string(idt_f_res_estimada))
END IF

//////////////////////////////////////////////////////////////////////////////////////////
////////////////////// Descripci$$HEX1$$f300$$ENDHEX$$n de la incidencia. Limitado a 80 ///////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

SELECT DESC_INCIDENCIA
INTO :ls_descripcion
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

IF IsNull(ls_descripcion) OR SQLCA.SQLCode <> 0 THEN
	ls_descripcion = ''
END IF

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Descripci$$HEX1$$f300$$ENDHEX$$n de la incidencia contenedora " + string(ls_descripcion))
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

SELECT :ls_descripcion || :ls_salto || NVL(DESC_INCIDENCIA, ' ')
INTO :ls_descripcion
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :ll_nro_incidencia;

IF IsNull(ls_descripcion) THEN
	ls_descripcion = ''
END IF

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Nueva descripci$$HEX1$$f300$$ENDHEX$$n de la incidencia contenedora " + string(ls_descripcion))
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora,  string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF Len(ls_descripcion) > 80 THEN
	ls_descripcion = Mid(ls_descripcion, 1, 80)
	// Hay que limitar el campo a 80 caracteres
END IF

//////////////////////////////////////////////////////////////////////////////////////////
/////////////////// Observaciones de la incidencia. Limitado a 2000 //////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
SELECT OBSERVACION
INTO :ls_observacion
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

IF IsNull(ls_observacion) OR SQLCA.SQLCode <> 0 THEN
	ls_observacion = ''
END IF

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Observaciones de la incidencia contenedora " + string(ls_observacion))
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

SELECT :ls_observacion || :ls_salto || NVL(OBSERVACION, ' '),
		 INSTALACION_ORIGEN
INTO :ls_observacion, :ll_nro_inst_origen
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :ll_nro_incidencia;

IF IsNull(ls_observacion) THEN
	ls_observacion = ''
END IF

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Nuevas observaciones de la incidencia contenedora " + string(ls_observacion))
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF Len(ls_observacion) > 2000 THEN
	ls_observacion = Mid(ls_observacion, 1, 2000)
	// Hay que limitar el campo a 2000 caracteres
END IF
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// Tipo de Incidencia /////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

IF ii_tip_incid_cont <> fgci_incidencia_programada THEN
	ii_tip_incid_cont = dw_lista_incidencias.GetItemNumber(pi_fila, 'tip_incidencia') 
END IF
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////// Alcance ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
IF ii_alcance_incid_agrup <> fgci_incidencia_con_interrupcion AND &
	dw_lista_incidencias.GetItemNumber(pi_fila, 'sgd_incidencia_alcance') <> fgci_incidencia_reenganche THEN
	
	ii_alcance_incid_agrup = dw_lista_incidencias.GetItemNumber(pi_fila, 'sgd_incidencia_alcance')
END IF
//////////////////////////////////////////////////////////////////////////////////////////

// Se actualizan los datos de SGD_INCIDENCIA
UPDATE SGD_INCIDENCIA
SET F_DETECCION = :idt_f_deteccion_inc_cont,
	 F_EST_RES = :idt_f_res_estimada,
	 DESC_INCIDENCIA = :ls_descripcion,
	 OBSERVACION = :ls_observacion,
	 TIP_INCIDENCIA = :ii_tip_incid_cont ,
	 ALCANCE = :ii_alcance_incid_agrup,
	 PROGRAMA = 'W_AGRUP',
	 USUARIO = :gs_usuario,
	 INSTALACION_ORIGEN = DECODE(NVL(INSTALACION_ORIGEN,0),0,:ll_nro_inst_origen, INSTALACION_ORIGEN),
	 IND_SCADA = DECODE(IND_SCADA, 1, 1, :li_ind_scada),
	 IND_OBLIGADA = DECODE(IND_OBLIGADA, 1, 1, :li_ind_obligada)
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n de los datos de sgd_incidencia ")
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF SQLCA.SQLCode <> 0 THEN
	li_retorno = 0 
ELSE
	li_retorno = wf_agrupar_inst_afect(ll_nro_incidencia, dw_lista_incidencias.GetitemNumber(pi_fila, 'nro_inst_afectada'))
	
	IF li_retorno > 0 THEN
		li_retorno = wf_alta_gi_incidencia_agrupada(ll_nro_incidencia, dw_lista_incidencias.GetitemNumber(pi_fila, 'est_actual'))
	END IF
END IF

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_datos_sgd_incidencia")
return li_retorno 

end function

public function integer wf_insertar_seguimiento (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_insertar_seguimiento
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que da de alta un registro en la tabla GI_SEGUIMIENTO_AGRUPACION
//				 con los datos de la incidencia que se desea 
//				 agrupar con la incidencia contenedora, con el fin de poder desagrupar sin
//				 problemas la informaci$$HEX1$$f300$$ENDHEX$$n de las maniobras, interrupciones y avisos asociados
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 20/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
DateTime ldt_f_actual
int li_retorno = 1
int li_orden_ant
long ll_nro_agrup = 0

SetPointer(Hourglass!)

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_insertar_seguimiento")

ldt_f_actual = fgnu_fecha_actual()


// Se obtiene el orden que va a tener la incidencia dentro de la agrupaci$$HEX1$$f300$$ENDHEX$$n
SELECT MAX(ORDEN_AGRUPACION)
INTO :ii_orden_agrup
FROM GI_SEGUIMIENTO_AGRUPACION
WHERE NRO_AGRUPACION = :il_nro_agrupacion;

IF SQLCA.SQLCode <> 0 OR IsNull(ii_orden_agrup) THEN
	ii_orden_agrup = 1
ELSE
	ii_orden_agrup ++
END IF
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Orden de la incidencia dentro de la agrupaci$$HEX1$$f300$$ENDHEX$$n " + string(ii_orden_agrup))
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF pl_nro_incidencia <> il_incidencia_contenedora THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "No es la incidencia contenedora")		
	// Se comprueba si la incidencia que se desea agrupar es una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias
	SELECT NVL(NRO_AGRUPACION,0)
	INTO :ll_nro_agrup
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
	// Al final se realiza la comprobaci$$HEX1$$f300$$ENDHEX$$n para insertar m$$HEX1$$e100$$ENDHEX$$s registros en GI_SEGUIMIENTO_AGRUPACION
	IF SQLCA.SQLCode <> 0 THEN
		ll_nro_agrup = 0
	END IF
	
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Se comprueba si la incidencia que se desea agrupar es una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias " + string(ll_nro_agrup))
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
END IF	
//	
//		
//	
//	
//	SELECT MAX(ORDEN_ANTIGUO)
//	INTO :li_orden_ant
//	FROM GI_SEGUIMIENTO_AGRUPACION
//	WHERE NRO_INCIDENCIA = :pl_nro_incidencia
//		AND NRO_AGRUPACION = :il_nro_agrupacion;
//
IF SQLCA.SQLCode <> 0 OR IsNull(li_orden_ant) THEN
	SetNull(li_orden_ant)
END IF
	
//ELSE
//	ii_orden_agrup = li_orden_ant + 1
//END IF

INSERT INTO GI_SEGUIMIENTO_AGRUPACION
	(NRO_AGRUPACION, 
 	 ORDEN_AGRUPACION, 		
  	 NRO_INCIDENCIA, 
	 ORDEN_ANTIGUO, 
	 USUARIO, 
	 PROGRAMA,
	 F_ACTUAL)
VALUES 
	(:il_nro_agrupacion,
 	 :ii_orden_agrup,	
	 :pl_nro_incidencia, 
	 NULL,
	 :gs_usuario,
	 'W_AGRUP',
	 :ldt_f_actual);
	 
IF SQLCA.SQLCode <> 0 THEN
	li_retorno = 0
END IF

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Insertamos en la tabla GI_SEGUIMIENTO_AGRUPACION " + string(ll_nro_agrup))
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF ll_nro_agrup > 0 THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia agrupada es a su vez una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias")
	// La incidencia agrupada es a su vez una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias.
	// Se a$$HEX1$$f100$$ENDHEX$$aden los registros con los $$HEX1$$f300$$ENDHEX$$rdenes antiguos, para poder volver atr$$HEX1$$e100$$ENDHEX$$s en el caso
	// de desagrupar esta incidencia de la desagrupaci$$HEX1$$f300$$ENDHEX$$n.
	INSERT INTO GI_SEGUIMIENTO_AGRUPACION
	(SELECT :il_nro_agrupacion,
			  :ii_orden_agrup + ORDEN_AGRUPACION,
			  :pl_nro_incidencia,
			  ORDEN_AGRUPACION,
			  :gs_usuario,
			  'W_AGRUP',
	 		  :ldt_f_actual
	 FROM GI_SEGUIMIENTO_AGRUPACION
	 WHERE NRO_AGRUPACION = :ll_nro_agrup);
				
	IF SQLCA.SQLCode < 0 THEN
		li_retorno = 0
	END IF

	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Insertamos en la tabla GI_SEGUIMIENTO_AGRUPACION " + string(ll_nro_agrup))
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

END IF
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, " fin wf_insertar_seguimiento")
return li_retorno
end function

public function integer wf_agrupar_interrupciones (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_interrupciones
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa los datos de la interrupciones. No cambia las maniobras
//				asociadas a las interrupciones.
//				 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 21/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

// Se le cambia a las interrupciones el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
SetPointer(Hourglass!)
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_interrupciones")

UPDATE SGD_INTERRUPCION
SET NRO_INCIDENCIA = :il_incidencia_contenedora,
	 PROGRAMA = 'W_AGRUP',
	 USUARIO = :gs_usuario,
	 NRO_AGRUPACION = :il_nro_agrupacion,
	 ORDEN_AGRUPACION = (SELECT NVL(MAX(GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION),:ii_orden_agrup)
	 							FROM GI_SEGUIMIENTO_AGRUPACION
								WHERE NRO_AGRUPACION = :il_nro_agrupacion
									AND ORDEN_ANTIGUO = SGD_INTERRUPCION.ORDEN_AGRUPACION)
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Cambio del n$$HEX1$$fa00$$ENDHEX$$mero de incidencia a las interrupciones ")
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF SQLCA.SQLCode < 0 THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_interrupciones")
	return 0
ELSE
	IF ii_estado_inc_cont = fgci_incidencia_resuelta THEN
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Incidencia resuelta ")
		UPDATE SGD_INTERRUPCION_RS
		SET NRO_INCIDENCIA = :il_incidencia_contenedora,
			 PROGRAMA = 'W_AGRUP',
			 USUARIO = :gs_usuario,
			 NRO_AGRUPACION = :il_nro_agrupacion,
			 ORDEN_AGRUPACION = (SELECT NVL(MAX(GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION),:ii_orden_agrup)
										FROM GI_SEGUIMIENTO_AGRUPACION
										WHERE NRO_AGRUPACION = :il_nro_agrupacion
											AND ORDEN_ANTIGUO = SGD_INTERRUPCION_RS.ORDEN_AGRUPACION)
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
		
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Cambio del numero de incidenca a las interrupciones ")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		
		IF SQLCA.SQLCode < 0 THEN
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_interrupciones")
			return 0
		END IF
			
	END IF
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_interrupciones")	
	return 1
END IF

end function

public function integer wf_agrupar_maniobras (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_maniobras
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa los datos de las maniobras. Cambia tambi$$HEX1$$e900$$ENDHEX$$n las maniobras
//				asociadas a las interrupciones.
//				 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 21/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

long ll_cod_maniobra, ll_cod_maniobra_nuevo
int li_retorno = 1

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_maniobras")
SetPointer(Hourglass!)
// Se define un cursor con el que cambiar los c$$HEX1$$f300$$ENDHEX$$digos de maniobra en SGD_MANIOBRA y
// en SGD_INTERRUPCION. Este cursor obtiene todas las maniobras asociadas a la incidencia
// que se desea agrupar
DECLARE lc_maniobras CURSOR FOR
	SELECT COD_MANIOBRA
	FROM SGD_MANIOBRA
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
// Se obtiene el nuevo c$$HEX1$$f300$$ENDHEX$$digo de maniobra de la incidencia contenedora.
SELECT (nvl(MAX(COD_MANIOBRA),:il_incidencia_contenedora * 1000)) + 1
INTO :ll_cod_maniobra_nuevo
FROM SGD_MANIOBRA
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Obtenci$$HEX1$$f300$$ENDHEX$$n del nuevo c$$HEX1$$f300$$ENDHEX$$digo de maniobra de la incidencia contenedora ")
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora,  string(sqlca.sqlcode) + sqlca.sqlerrtext)
IF SQLCA.SQLCode = 0 THEN
	OPEN lc_maniobras;
	
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Ejecuci$$HEX1$$f300$$ENDHEX$$n del cursor que obtiene todas las maniobras asociadas a la incidencia " + &
   "que se desea agrupar")
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	IF SQLCA.SQLCode <> 0 THEN
		li_retorno = 0
	ELSE
		FETCH lc_maniobras INTO :ll_cod_maniobra;
		
		DO WHILE SQLCA.SQLCode = 0 AND li_retorno = 1
			// Se actualizan los c$$HEX1$$f300$$ENDHEX$$digos de maniobra de las interrupciones con los nuevos
			// c$$HEX1$$f300$$ENDHEX$$digos de maniobra
			UPDATE SGD_INTERRUPCION SET
			MANIOBRA_APERT_FASE_A = DECODE(MANIOBRA_APERT_FASE_A, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																											MANIOBRA_APERT_FASE_A),
			MANIOBRA_APERT_FASE_B = DECODE(MANIOBRA_APERT_FASE_B, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																											MANIOBRA_APERT_FASE_B),
			MANIOBRA_APERT_FASE_C = DECODE(MANIOBRA_APERT_FASE_C, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																											MANIOBRA_APERT_FASE_C),
			MANIOBRA_CIERRE_FASE_A = DECODE(MANIOBRA_CIERRE_FASE_A, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																											  MANIOBRA_CIERRE_FASE_A),
			MANIOBRA_CIERRE_FASE_B = DECODE(MANIOBRA_CIERRE_FASE_B, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																											  MANIOBRA_CIERRE_FASE_B),
			MANIOBRA_CIERRE_FASE_C = DECODE(MANIOBRA_CIERRE_FASE_C, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																											  MANIOBRA_CIERRE_FASE_C),
			MANIOBRA_APERTURA = DECODE(MANIOBRA_APERTURA, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																								 MANIOBRA_APERTURA),
			MANIOBRA_CIERRE = DECODE(MANIOBRA_CIERRE, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																							MANIOBRA_CIERRE),
			PROGRAMA = 'W_AGRUP',
			USUARIO = :gs_usuario
			WHERE MANIOBRA_APERT_FASE_A = :ll_cod_maniobra OR
					MANIOBRA_APERT_FASE_B = :ll_cod_maniobra OR
					MANIOBRA_APERT_FASE_C = :ll_cod_maniobra OR
					MANIOBRA_APERTURA = :ll_cod_maniobra OR
					MANIOBRA_CIERRE_FASE_A = :ll_cod_maniobra OR
					MANIOBRA_CIERRE_FASE_B = :ll_cod_maniobra OR
					MANIOBRA_CIERRE_FASE_C = :ll_cod_maniobra OR
					MANIOBRA_CIERRE = :ll_cod_maniobra; 
					
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n de los c$$HEX1$$f300$$ENDHEX$$digos de maniobra de SGD_INTERRUPCION ")
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)


			//AHM(03/06/2009) Incidencia:No se actualiza el c$$HEX1$$f300$$ENDHEX$$digo de maniobra en la indisponibilidades
			IF fg_verifica_parametro("indisponibilidades activas") THEN
				UPDATE SGD_INDISPONIBILIDAD SET
				MANIOBRA_APERTURA = DECODE(MANIOBRA_APERTURA, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																									 MANIOBRA_APERTURA),
				MANIOBRA_CIERRE = DECODE(MANIOBRA_CIERRE, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																								MANIOBRA_CIERRE),
				PROGRAMA = 'W_AGRUP',
				USUARIO = :gs_usuario
				WHERE MANIOBRA_APERTURA = :ll_cod_maniobra OR
						MANIOBRA_CIERRE = :ll_cod_maniobra; 
				
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n de los c$$HEX1$$f300$$ENDHEX$$digos de maniobra de SGD_INDISPONIBILIDAD ")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
			END IF
			//Fin AHM (03/06/2009)

			IF ii_estado_agrupado = fgci_incidencia_resuelta AND SQLCA.SQLCode = 0 THEN
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Incidencia resuelta")				
				UPDATE SGD_INTERRUPCION_RS SET
				MANIOBRA_APERT_FASE_A = DECODE(MANIOBRA_APERT_FASE_A, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																												MANIOBRA_APERT_FASE_A),
				MANIOBRA_APERT_FASE_B = DECODE(MANIOBRA_APERT_FASE_B, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																												MANIOBRA_APERT_FASE_B),
				MANIOBRA_APERT_FASE_C = DECODE(MANIOBRA_APERT_FASE_C, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																												MANIOBRA_APERT_FASE_C),
				MANIOBRA_CIERRE_FASE_A = DECODE(MANIOBRA_CIERRE_FASE_A, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																												  MANIOBRA_CIERRE_FASE_A),
				MANIOBRA_CIERRE_FASE_B = DECODE(MANIOBRA_CIERRE_FASE_B, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																												  MANIOBRA_CIERRE_FASE_B),
				MANIOBRA_CIERRE_FASE_C = DECODE(MANIOBRA_CIERRE_FASE_C, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																												  MANIOBRA_CIERRE_FASE_C),
				MANIOBRA_APERTURA = DECODE(MANIOBRA_APERTURA, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																									 MANIOBRA_APERTURA),
				MANIOBRA_CIERRE = DECODE(MANIOBRA_CIERRE, :ll_cod_maniobra, :ll_cod_maniobra_nuevo,
																								MANIOBRA_CIERRE),
				PROGRAMA = 'W_AGRUP',
				USUARIO = :gs_usuario
				WHERE MANIOBRA_APERT_FASE_A = :ll_cod_maniobra OR
						MANIOBRA_APERT_FASE_B = :ll_cod_maniobra OR
						MANIOBRA_APERT_FASE_C = :ll_cod_maniobra OR
						MANIOBRA_APERTURA = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_A = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_B = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_C = :ll_cod_maniobra OR
						MANIOBRA_CIERRE = :ll_cod_maniobra; 
						
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n de los c$$HEX1$$f300$$ENDHEX$$digos de maniobra de SGD_INTERRUPCION_RS ")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
			END IF						
			// Las interrupciones ya han cambiado de n$$HEX1$$fa00$$ENDHEX$$mero de incidencia, as$$HEX2$$ed002000$$ENDHEX$$que s$$HEX1$$f300$$ENDHEX$$lo se 
			// han cambiado los c$$HEX1$$f300$$ENDHEX$$digos de maniobra
			
			IF SQLCA.SQLCode < 0 THEN
				// Se ha producido un error
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_maniobras")
				li_retorno = 0
			ELSE
				// Se procede a actualizar la maniobra de la incidencia que se desea agrupar
				// con el nuevo codigo
				UPDATE SGD_MANIOBRA
				SET COD_MANIOBRA = :ll_cod_maniobra_nuevo,
					 NRO_INCIDENCIA = :il_incidencia_contenedora,
					 NRO_AGRUPACION = :il_nro_agrupacion,
					 ORDEN_AGRUPACION = (SELECT NVL(MAX(GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION),:ii_orden_agrup)
												FROM GI_SEGUIMIENTO_AGRUPACION
												WHERE NRO_AGRUPACION = :il_nro_agrupacion
													AND ORDEN_ANTIGUO = SGD_MANIOBRA.ORDEN_AGRUPACION)
				WHERE NRO_INCIDENCIA = :pl_nro_incidencia
						AND COD_MANIOBRA = :ll_cod_maniobra;
						
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n de la maniobra de la incidencia ")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
				IF SQLCA.SQLCode < 0 THEN
					li_retorno = 0
				ELSE
					ll_cod_maniobra_nuevo ++
					FETCH lc_maniobras INTO :ll_cod_maniobra;
				END IF
			END IF

		LOOP
		CLOSE lc_maniobras;
	
	END IF
ELSE
	// La incidencia no tiene maniobras. Se asume que es de BT, con lo que no se 
	// agrupan maniobras
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Incidencia sin maniobras")
	li_retorno = 1
END IF

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_maniobras")
return li_retorno

	

end function

public function integer wf_alta_gi_estado_oper_desagrup (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_alta_gi_estado_oper_desagrup
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que da de alta los estados de una incidencia en la tabla 
//				 GI_ESTADO_OPER_DESAGRUP
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

int li_existe = 0
int li_retorno = 1

SetPointer(Hourglass!)


// S$$HEX1$$f300$$ENDHEX$$lo se har$$HEX2$$e1002000$$ENDHEX$$si la incidencia no es un reenganche

// En primer lugar se comprueba si la incidencia que se desea dar de alta es la incidencia
// contenedora. En este caso se comprueba que no exista, ya que $$HEX1$$e900$$ENDHEX$$sta s$$HEX1$$f300$$ENDHEX$$lo se dar$$HEX2$$e1002000$$ENDHEX$$de alta
// una vez como incidencia contenedora.

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_alta_gi_estado")
IF pl_nro_incidencia = il_incidencia_contenedora THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia que tratamos es la incidencia contenedora")
	
	SELECT COUNT(*)
	INTO :li_existe
	FROM GI_ESTADO_OPER_DESAGRUP
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Comprueba si la incidendia ya ha sido agrupada")
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora,  string(sqlca.sqlcode) + sqlca.sqlerrtext)
	
	IF SQLCA.SQLCode <> 0 THEN
		li_existe = 0 
	END IF
END IF

IF li_existe = 0 THEN
	// Se inserta en GI_ESTADO_OPER_DESAGRUP
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia no est$$HEX2$$e1002000$$ENDHEX$$agrupada")
	INSERT INTO GI_ESTADO_OPER_DESAGRUP
		(SELECT COD_ESTADO, 
				  USUARIO,
				  F_ACTUAL,
				  H_ACTUAL,
				  PROGRAMA,
				  OBSERVACION,
				  F_ALTA,
				  H_ALTA,
				  NRO_INCIDENCIA,
				  IND_ENV_MANT,
				  :il_nro_agrupacion
		  FROM SGD_ESTADO_OPER
		 WHERE NRO_INCIDENCIA = :pl_nro_incidencia);
		 
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Se insertan los estados de la incidencia en la tabla gi_estados_oper_desagrup")
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		
	IF SQLCA.SQLCode = 0 THEN // El alta ha ido bien
		// Si la incidencia no es la contenedora se borra de SGD_ESTADO_OPER
		IF pl_nro_incidencia <> il_incidencia_contenedora THEN 

			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia que estamos tratando no es la contenedora")
			
			DELETE SGD_ESTADO_OPER
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Borrado de los registros de la incidencia en la tabla sgd_estado_oper")
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
			
			IF SQLCA.SQLCode <> 0 THEN
				li_retorno = 0
			END IF
		END IF
	ELSE
		li_retorno = 0
	END IF
END IF
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_alta_gi_estado")
return li_retorno 
end function

public function integer wf_agrupar_seguimiento (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_seguimiento
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa los datos de los estados de la incidencia agrupada en la 
//				 tabla SGD_ESTADO_OPER. Adem$$HEX1$$e100$$ENDHEX$$s, antes de esto, se mover$$HEX1$$e100$$ENDHEX$$n los registros de las
//				 incidencias que se agrupan a la tabla GI_ESTADO_OPER_DESAGRUP.
//				 
//				 Fechas:
//					Fecha(PT) --> M$$HEX1$$ed00$$ENDHEX$$nima de las fechas de PT de las incidencias.
//					Fecha(EB) --> Fecha de EB de la incidencia con OT, si existe.
//					Fecha(ER) --> M$$HEX1$$ed00$$ENDHEX$$nima de las fechas de ER de las incidencias.
//					Fecha(SR) --> M$$HEX1$$e100$$ENDHEX$$xima de las fechas de SR de las incidencias.
//					Fecha(RS) --> M$$HEX1$$e100$$ENDHEX$$xima de las fechas de RS de las incidencias.
//				 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
int li_estado_incid
int li_retorno = 1
int li_contador = 1
int li_hay_er
string ls_observacion1, ls_observacion2
long ll_nro_incidencia
DateTime ldt_fecha1, ldt_fecha2

SetPointer(Hourglass!)

ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_incidencia')
li_estado_incid = dw_lista_incidencias.GetItemNumber(pi_fila, 'est_actual')
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_seguimiento")				
// Se recorren todos los estados de la incidencia agrupada para unir 
// las Observaciones y Fechas.
DO WHILE li_contador <= ii_estado_agrupado
	ls_observacion1 = ""
	ls_observacion2 = ""
	IF NOT (li_contador = fgci_incidencia_enviado_brigada AND NOT ib_existe_eb) THEN
		ls_observacion1 = ''
		SetNull(ldt_fecha1)

		IF ii_estado_inc_cont >= li_contador THEN
			// Incidencia Agrupada
			SELECT NVL(OBSERVACION, ''), F_ALTA
			INTO :ls_observacion1, :ldt_fecha1
			FROM SGD_ESTADO_OPER
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
				AND COD_ESTADO = :li_contador;
			
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Captura de las observaciones y la fecha de alta de la incidencia contenedora ")
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
			
		END IF
		
		SetNull(ldt_fecha2)
		IF li_estado_incid >= li_contador THEN
			// Incidencia que se desea agrupar
			SELECT NVL(OBSERVACION, ''), F_ALTA
			INTO :ls_observacion2, :ldt_fecha2
			FROM SGD_ESTADO_OPER
			WHERE NRO_INCIDENCIA = :ll_nro_incidencia 
				AND COD_ESTADO = :li_contador;
				
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Captura de las observaciones y la fecha de alta de la incidencia " + string(ll_nro_incidencia))
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		END IF
		// La observaci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$limitada a 200 caracteres	
		ls_observacion1 = Mid(ls_observacion1+"~r~n " + ls_observacion2,1,200)
		
		IF Not IsNull(ldt_fecha1) THEN
			IF li_contador = fgci_incidencia_servicio_repuesto OR li_contador = fgci_incidencia_resuelta THEN
				// Aqu$$HEX2$$ed002000$$ENDHEX$$nos quedamos con la m$$HEX1$$e100$$ENDHEX$$xima fecha (SR)
				IF ldt_fecha2 > ldt_fecha1 THEN
					ldt_fecha1 = ldt_fecha2
				END IF
			ELSE
				// Aqu$$HEX2$$ed002000$$ENDHEX$$nos quedamos con la m$$HEX1$$ed00$$ENDHEX$$nima fecha (PT, ER)
				IF ldt_fecha2 < ldt_fecha1 THEN
					ldt_fecha1 = ldt_fecha2
				END IF
			END IF

		ELSE
			ldt_fecha1 = ldt_fecha2
		END IF
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Fecha de alta de la incidencia contenedora " + string(ldt_fecha1))		
		IF ii_alcance_inc_cont = fgci_incidencia_sin_interrupcion AND &
			li_contador = fgci_incidencia_en_reposicion THEN
			// Hay que contemplar un caso especial, y es el hecho de agrupar una incidencia
			// sin p$$HEX1$$e900$$ENDHEX$$rdida en SR con una incidencia con p$$HEX1$$e900$$ENDHEX$$rdida en estado SR. Hay que a$$HEX1$$f100$$ENDHEX$$adir el 
			// estado ER a la incidencia resultante ya que no lo ten$$HEX1$$ed00$$ENDHEX$$a.
				
			// Se comprueba si existe el estado ER en SGD_ESTADO_OPER
			// En el caso de que no exista se da de alta si la incidencia resultante es
			// una incidencia con p$$HEX1$$e900$$ENDHEX$$rdida
			
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Contenedora sin interrupci$$HEX1$$f300$$ENDHEX$$n y estado en reposici$$HEX1$$f300$$ENDHEX$$n")
			SELECT COUNT(*)
			INTO :li_hay_er
			FROM SGD_ESTADO_OPER 
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
					AND COD_ESTADO = :fgci_incidencia_en_reposicion;
				
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Comprobaci$$HEX1$$f300$$ENDHEX$$n de si la incidencia contenedora tiene estado en reposici$$HEX1$$f300$$ENDHEX$$n ")
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		ELSE
			li_hay_er = 1
		END IF
	
		IF ii_estado_inc_cont >= li_contador AND li_hay_er > 0 THEN
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Existe el estado ER")
			// Se actualiza cada estado de la incidencia agrupada.
			UPDATE SGD_ESTADO_OPER
			SET PROGRAMA = 'W_AGRUP',
				 OBSERVACION = :ls_observacion1,
				 F_ALTA = :ldt_fecha1
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
				AND COD_ESTADO = :li_contador;
				
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n de cada estado de la incidencia agrupada ")				
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)				
			
			IF SQLCA.SQLCode < 0 THEN
				li_retorno = 0 // Error en la actualizaci$$HEX1$$f300$$ENDHEX$$n
			END IF
			
		ELSE // Se a$$HEX1$$f100$$ENDHEX$$ade el registro, ya que el estado es nuevo
			IF NOT (li_contador = fgci_incidencia_en_reposicion AND &
				ii_alcance_incid_agrup = fgci_incidencia_sin_interrupcion) THEN
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "No existe el estado ER")				
				// Si la incidencia resultante es una incidencia sin p$$HEX1$$e900$$ENDHEX$$rdida no hay que 
				// a$$HEX1$$f100$$ENDHEX$$adir el estado ER
				INSERT INTO SGD_ESTADO_OPER
				(COD_ESTADO,USUARIO,F_ACTUAL,PROGRAMA,OBSERVACION,F_ALTA,H_ALTA,NRO_INCIDENCIA)
				VALUES
				(:li_contador, :gs_usuario, sysdate, 'W_AGRUP', :ls_observacion1, :ldt_fecha1, sysdate, :il_incidencia_contenedora);
				
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Se da de alta el nuevo estado ")
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
			END IF
		END IF

		IF SQLCA.SQLCode < 0 THEN
			li_retorno = 0 // Error en la actualizaci$$HEX1$$f300$$ENDHEX$$n
		END IF
		
	END IF						
	li_contador ++
LOOP

IF li_retorno = 1 THEN
	// Se mueven los registros de los estados de la incidencia que se desea agrupar a la tabla
	// GI_ESTADO_OPER_DESAGRUP
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Se mueven los registros de los estados de la incidencia que se desea agrupar a la tabla GI_ESTADO_OPER_DESAGRUP")
	li_retorno = wf_alta_gi_estado_oper_desagrup(ll_nro_incidencia)
END IF

IF li_retorno = 1 THEN
	IF ii_estado_inc_cont <> ii_estado_agrupado THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "El estado de la incidencia contenedora no es agrupado")
		UPDATE SGD_INCIDENCIA
		SET EST_ACTUAL = :ii_estado_agrupado
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
		
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n del la incidencia contenedora a agrupado ")
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		IF SQLCA.SQLCode <> 0 THEN
			li_retorno = 0
		ELSE
			IF ii_estado_inc_cont > ii_estado_agrupado THEN
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "El estado de la incidencia contenedora es superior al estado agrupado")				
				DELETE SGD_ESTADO_OPER
				WHERE COD_ESTADO > :ii_estado_agrupado
						AND NRO_INCIDENCIA = :il_incidencia_contenedora;

				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Borrado de la tabla sgd_estado_oper de los registros de la incidencia contenedora cuyo estado es superior a agrupado ")
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
				IF SQLCA.SQLCode <> 0 THEN
					li_retorno = 0
				ELSE
					ii_estado_inc_cont = ii_estado_agrupado
				END IF
			ELSE
				ii_estado_inc_cont = ii_estado_agrupado
			END IF
		END IF
	END IF
END IF
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_seguimiento")				
return li_retorno
end function

public function integer wf_agrupar_avisos (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_avisos
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa los avisos asociados a la incidencia que se est$$HEX2$$e1002000$$ENDHEX$$agrupando
//				 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

// Se les cambia a los avisos el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
// y se les asigna el n$$HEX1$$fa00$$ENDHEX$$mero y el orden de agrupaci$$HEX1$$f300$$ENDHEX$$n para permitir volver atr$$HEX1$$e100$$ENDHEX$$s

SetPointer(Hourglass!)

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_avisos")

UPDATE GI_AVISOS
SET GI_AVISOS.NRO_INCIDENCIA = :il_incidencia_contenedora,
	 GI_AVISOS.PROGRAMA = 'W_AGRUP',
	 GI_AVISOS.USUARIO = :gs_usuario,
	 GI_AVISOS.ORDEN_AGRUPACION = (SELECT NVL(MAX(GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION),:ii_orden_agrup)
	 										FROM GI_SEGUIMIENTO_AGRUPACION
											WHERE NRO_AGRUPACION = :il_nro_agrupacion
												AND ORDEN_ANTIGUO = GI_AVISOS.ORDEN_AGRUPACION)
WHERE GI_AVISOS.NRO_INCIDENCIA = :pl_nro_incidencia;

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de incidencia y asignaci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero y orden de agrupaci$$HEX1$$f300$$ENDHEX$$n a los avisos ")
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF SQLCA.SQLCode < 0 THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_avisos")
	return 0
ELSE
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_avisos")
	return 1
END IF


end function

public function integer wf_analizar_eb ();///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_analizar_eb
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que comprueba si la incidencia agrupada tiene que tener estado EB. 
//				 No tendr$$HEX2$$e1002000$$ENDHEX$$estado EB si la incidencia est$$HEX2$$e1002000$$ENDHEX$$al menos en estado ER y la fecha de
//				 alta del estado ER es inferior a la fecha de alta del estado EB.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

int li_retorno = 1
DateTime ldt_fecha_eb, ldt_fecha_er

SetPointer(Hourglass!)

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "wf_analizar_eb")

IF ib_existe_eb AND ii_estado_agrupado > fgci_incidencia_enviado_brigada THEN
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Existe el estado eb en la agrupaci$$HEX1$$f300$$ENDHEX$$n y el estado de la incidencia agrupada es superior a eb")
	// Se obtienen las fechas del estado EB y ER para compararlas
	SELECT F_ALTA
	INTO :ldt_fecha_eb
	FROM SGD_ESTADO_OPER
	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
		AND COD_ESTADO = :fgci_incidencia_enviado_brigada;
		
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Obtenci$$HEX1$$f300$$ENDHEX$$n de la fechas del estado eb ")
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	IF SQLCA.SQLCode = 0 THEN

		SELECT F_ALTA
		INTO :ldt_fecha_er
		FROM SGD_ESTADO_OPER
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
			AND COD_ESTADO = :fgci_incidencia_en_reposicion;
			
		wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Obtenci$$HEX1$$f300$$ENDHEX$$n de la fechas del estado er ")
		wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		IF SQLCA.SQLCode = 0 THEN
			// Se comparan las fechas
			IF ldt_fecha_er < ldt_fecha_eb THEN
				wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "La fecha de ER es menor que la de EB")
				// La fecha de EB es superior a la fecha de ER. Hay que eliminar el estado EB
				// de la incidencia agrupada
				DELETE SGD_ESTADO_OPER
				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
					AND COD_ESTADO = :fgci_incidencia_enviado_brigada;
					
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Eliminaci$$HEX1$$f300$$ENDHEX$$n del estado EB de la agrupaci$$HEX1$$f300$$ENDHEX$$n ")
					wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
				IF SQLCA.SQLCode < 0 THEN
					li_retorno = 0 // Se ha producido un error en el borrado
				END IF
			END IF
		END IF
	END IF
	
END IF

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_analizar_eb")
return li_retorno
end function

public function boolean wf_incidencia_de_operaciones (long pl_nro_incidencia);int li_estado_red, li_tipo_instalacion, li_tension, li_est_actual, li_tip_incidencia
int li_alcance
long ll_cant_maniobras, ll_cant_int, ll_nro_instalacion

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_incidencia_de_operaciones")
////////////////////////////////////////////////////////////////////////////////////
// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
SELECT NVL(ESTADO_RED,0), NRO_INST_AFECTADA, TIP_TENSION, EST_ACTUAL, TIP_INCIDENCIA,
		 ALCANCE
INTO :li_estado_red, :ll_nro_instalacion, :li_tension, :li_est_actual, :li_tip_incidencia,
	  :li_alcance
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Comprueba si la incidencia ha sido de alta antes de la conversi$$HEX1$$f300$$ENDHEX$$n de los datos")
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF SQLCA.SQLCode = 0 AND li_estado_red = -10 Then 
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora,  "La incidencia " + string(pl_nro_incidencia) + "no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
	return false
end if
/////////////////////////////////////////////////////////////////////

IF IsNull(ll_nro_instalacion) OR gb_operaciones = FALSE THEN 
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + "no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
	RETURN False
END IF
	
SELECT TIPO_INSTALACION
INTO :li_tipo_instalacion
FROM SGD_INSTALACION 
WHERE NRO_INSTALACION = :ll_nro_instalacion
		AND BDI_JOB = 0;

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Captura del tipo de intalaci$$HEX1$$f300$$ENDHEX$$n de la incidencia que estamos tratando ")
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	
IF SQLCA.SQLCode <> 0 THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " es de operaci$$HEX1$$f300$$ENDHEX$$n ")	
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
	return TRUE
END IF

IF gb_operaciones = TRUE AND &
	li_tension <= gi_tension_nivel_min THEN

	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "SGI interacciona con operacion y el nivel de tensi$$HEX1$$f300$$ENDHEX$$n es menor o igual al m$$HEX1$$ed00$$ENDHEX$$nimo nivel de tensi$$HEX1$$f300$$ENDHEX$$n con representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica ")
	
	IF gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion = fgci_tipo_ct THEN
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La tensi$$HEX1$$f300$$ENDHEX$$n m$$HEX1$$ed00$$ENDHEX$$nima con representaci$$HEX1$$f300$$ENDHEX$$n grafica es media tensi$$HEX1$$f300$$ENDHEX$$n y el tipo de la instalaci$$HEX1$$f300$$ENDHEX$$n de la incidencia que estamos tratando es un ct")
		IF li_est_actual > fgci_incidencia_pendiente OR li_tip_incidencia <> fgci_incidencia_programada THEN
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "El estado de la indicencia es superior a pendiente o es una incidencia programada")
			// Como la instalaci$$HEX1$$f300$$ENDHEX$$n afectada es un CT se comprueba si existen maniobras.
			// En caso de que existan la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n
			SELECT COUNT(*)
			INTO :ll_cant_maniobras
			FROM SGD_MANIOBRA
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Como el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n es un ct comprobaci$$HEX1$$f300$$ENDHEX$$n de si existen maniobras si existen la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n ")
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora,  string(sqlca.sqlcode) + sqlca.sqlerrtext)
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "N$$HEX1$$fa00$$ENDHEX$$mero de maniobras " + string(ll_cant_maniobras))		
			IF SQLCA.SQLCode = 0 THEN
				IF ll_cant_maniobras > 0 THEN
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " es de operaci$$HEX1$$f300$$ENDHEX$$n ")
				ELSE
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
				END IF
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
				Return ll_cant_maniobras > 0 
			ELSE
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
				Return FALSE
			END IF
			
		ELSE
			wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Incidencia programnada en estado pendiente cuya instalci$$HEX1$$f300$$ENDHEX$$n afectada es un CT ")
			// Incidencia programada en estado pendiente cuya instalaci$$HEX1$$f300$$ENDHEX$$n afectada es un CT. 
			// Hay que comprobar si se han definido interrupciones  y el nivel de tensi$$HEX1$$f300$$ENDHEX$$n de 
			// $$HEX1$$e900$$ENDHEX$$stas.
			IF  li_alcance = fgci_incidencia_sin_interrupcion THEN
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Incidencia sin interrupci$$HEX1$$f300$$ENDHEX$$n")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " es de operaci$$HEX1$$f300$$ENDHEX$$n ")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
				return TRUE
			ELSE
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Incidencia que no es sin interrupci$$HEX1$$f300$$ENDHEX$$n")
				SELECT COUNT(SGD_INTERRUPCION_DESCARGO.COD_INSTALACION) 
				INTO :ll_cant_int
				FROM SGD_INTERRUPCION_DESCARGO, SGD_DESCARGOS, SGD_INSTALACION
				WHERE SGD_DESCARGOS.NRO_INCIDENCIA = :pl_nro_incidencia	AND
						SGD_DESCARGOS.NRO_DESCARGO = SGD_INTERRUPCION_DESCARGO.NRO_DESCARGO AND
						SGD_INTERRUPCION_DESCARGO.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION AND
						SGD_INSTALACION.BDI_JOB = 0 AND
						SGD_INSTALACION.TENSION <= :gi_tension_nivel_min;
				
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Como el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n es un ct comprobaci$$HEX1$$f300$$ENDHEX$$n de si existen maniobras si existen la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n ")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
				
				IF SQLCA.SQLCode = 0 THEN
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Numero de interrupciones " + string(ll_cant_int))
					IF ll_cant_int > 0 THEN
						wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " es de operaci$$HEX1$$f300$$ENDHEX$$n ")
					ELSE
						wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
					END IF
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
					return ll_cant_int > 0
				ELSE
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
					return False
				END IF
			END IF
		END IF

	ELSEIF gi_tension_nivel_min = fgci_alta_tension AND li_tipo_instalacion = fgci_tipo_subestacion THEN
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La tensi$$HEX1$$f300$$ENDHEX$$n m$$HEX1$$ed00$$ENDHEX$$nima con representaci$$HEX1$$f300$$ENDHEX$$n es alta tensi$$HEX1$$f300$$ENDHEX$$n y el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n es una subestaci$$HEX1$$f300$$ENDHEX$$n")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
		return FALSE
		
	ELSE
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " es de operaci$$HEX1$$f300$$ENDHEX$$n ")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
		return TRUE
	END IF
	
ELSE
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia " + string(pl_nro_incidencia) + " no es de operaci$$HEX1$$f300$$ENDHEX$$n ")
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_incidencia_de_operaciones")
	Return FALSE
END IF

end function

public subroutine wf_deshacer_cambios ();///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_deshacer_cambios
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que elimina de GI_INCIDENCIA_AGRUPADA y de GI_ESTADOS_OPER_DESAGRUP
// 			 los datos de la incidencia contenedora como consecuencia de que no se ha podido
//				 realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de ninguna incidencia.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  
//
// Devuelve: 
//
//   Fecha           Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 17/01/2002	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(Hourglass!)

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "wf_deshacer_cambios")

DELETE GI_INCIDENCIA_AGRUPADA
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Borrado de los datos de GI_INCIDENCIA_AGRUPADA de las incidencia agrupadora ")
wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	
DELETE GI_ESTADO_OPER_DESAGRUP
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Borrado de los datos de GI_ESTADO_OPER_DESAGRUP de las incidencia agrupadora ")
wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora,  string(sqlca.sqlcode) + sqlca.sqlerrtext)

UPDATE SGD_INCIDENCIA
SET NRO_AGRUPACION = NULL
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Borrado de los datos de SGD_INCIDENCIA de las incidencia agrupadora ")
wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

gnu_u_transaction.uf_commit()

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "commit ")
wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "fin wf_deshacer_cambios")
end subroutine

public function integer wf_alta_gi_incidencia_agrupada (long pl_nro_incidencia, integer pi_estado);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_alta_gi_incidencia_agrupada
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que da de alta una incidencia en la tabla GI_INCIDENCIA_AGRUPADA
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 20/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

int li_existe = 0
int li_retorno = 1
// GNU 13-2-2006. Mejora 1
long ll_nro_inst_afectada, ll_ind_scada, ll_alcance
SetPointer(Hourglass!)

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_alta_gi_incidencia_agrupada")
// En primer lugar se comprueba si la incidencia que se desea dar de alta es la incidencia
// contenedora. En este caso se comprueba que no exista, ya que $$HEX1$$e900$$ENDHEX$$sta s$$HEX1$$f300$$ENDHEX$$lo se dar$$HEX2$$e1002000$$ENDHEX$$de alta
// una vez como incidencia contenedora.
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Tratamiento de la incidencia " + string(pl_nro_incidencia))
IF pl_nro_incidencia = il_incidencia_contenedora THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia que se quiere dar de alta es la incidencia contenedora")

	SELECT COUNT(*)
	INTO :li_existe
	FROM GI_INCIDENCIA_AGRUPADA
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Comprueba si la incidencia ya est$$HEX2$$e1002000$$ENDHEX$$agrupada ")
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	
	IF SQLCA.SQLCode <> 0 THEN
		li_existe = 0 
		lb_contenedora_nueva = TRUE
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia contenedora es nueva")
	END IF
END IF

IF li_existe = 0 THEN
	IF pl_nro_incidencia = il_incidencia_contenedora THEN
		lb_contenedora_nueva = TRUE
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La incidencia contenedora es nueva")
	END IF
	// Se le asigna el n$$HEX1$$fa00$$ENDHEX$$mero de agrupaci$$HEX1$$f300$$ENDHEX$$n a la incidencia
	UPDATE SGD_INCIDENCIA
	SET NRO_AGRUPACION = :il_nro_agrupacion
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
 
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Asignaci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de la agrupaci$$HEX1$$f300$$ENDHEX$$n " + string(il_nro_agrupacion) + " a la incidencia " + string(pl_nro_incidencia))
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora,  + string(sqlca.sqlcode) + sqlca.sqlerrtext)
	IF SQLCA.SQLCode = 0 THEN
		// Se inserta en GI_INCIDENCIA_AGRUPADA
		INSERT INTO GI_INCIDENCIA_AGRUPADA
		(NRO_INCIDENCIA, USUARIO, F_ACTUAL, H_ACTUAL, PROGRAMA, PRIMER_AVISO,
  			     DESC_INCIDENCIA, EST_ACTUAL, F_DETECCION, H_DETECCION, F_EST_RES,
  				  H_EST_RES, TIP_TENSION, TIP_INCIDENCIA, COD_CAUSA, F_ALTA, H_ALTA,
  				  NRO_CENTRO, NRO_CMD, NRO_MESA, NRO_INST_AFECTADA, NRO_INST_ORIGEN,
  				  POT_AFECTADA, POT_CONTRATADA, CCLI_AFEC, MAT_AVERIADO, NRO_BRIGADA,
  				  OBSERVACION, OT, COD_EST_CLIMA, ESTADO_MANTENIMIENTO, CENTRO_ALTA,
  				  CMD_ALTA, PUESTO_ALTA, CANT_AVISOS, CAN_CLI, FAM_MANT_AVER, FAM_CAUSA,
  				  TIEMPO_MANT, TIEMPO_OPER, DURACION_SR, FEC_RESOLUCION, FEC_CAUSA,
  				  DIR_AVISO, FECHA_BATCH, ESTADO_BATCH, DURACION_CL, DURACION_RS,
  				  DURACION_ER, DER_MANT_EN_CORTE, DURACION_ENV_BRIGADA, PAXTC, PCXTC,
  				  DURACION_MANT, DURACION_MANT_CORTE, COD_HOR, TIEPI, TIEBT, CORTE_SR,
  				  DURACION_EB_CL, DURACION_CL_SR, EB6203, EB4001, EB4002, EB4003, EB4004,
  				  EB4007, EB4007_EST, KWH_ESTIMADO, IND_ALUM_PUB, INSTALACION_ORIGEN,
  				  OBSERV_MTO, NOM_DOC, DURACION_CE, DURACION_MTO_CE, TIEPI_APORTADO,
  				  TIEBT_APORTADO, ALCANCE, ESTADO_RED, SAIFI, SAIDI, CAIDI, ASAI, DURACION_EB_ER,
  				  DURACION_ER_SR, NRO_AGRUPACION, FASE_SUGERIDA, TENSION_ORIGEN, TENSION_AFECTADA,
  				  AGENTE, DURACION,	AREA_AFEC, TIPO_LUMINARIA, LUM_REPARADAS, ELTO_SINSERV,
  				  PERDIDAS_OPE, CCLI_AFEC_IND, EB7000, COD_MOTIVO, DESCRIPCION_MOTIVO,
  				  ESTADO_ANTERIOR, USUARIO_ANULACION, FECHA_ANULACION, IND_ANULACION_SGI,
  				  IND_SCADA, IND_OBLIGADA, ENR, OBS_CORRECCIONES)
		(SELECT NRO_INCIDENCIA, USUARIO, F_ACTUAL, H_ACTUAL, PROGRAMA, PRIMER_AVISO,
  			     DESC_INCIDENCIA, EST_ACTUAL, F_DETECCION, H_DETECCION, F_EST_RES,
  				  H_EST_RES, TIP_TENSION, TIP_INCIDENCIA, COD_CAUSA, F_ALTA, H_ALTA,
  				  NRO_CENTRO, NRO_CMD, NRO_MESA, NRO_INST_AFECTADA, NRO_INST_ORIGEN,
  				  POT_AFECTADA, POT_CONTRATADA, CCLI_AFEC, MAT_AVERIADO, NRO_BRIGADA,
  				  OBSERVACION, OT, COD_EST_CLIMA, ESTADO_MANTENIMIENTO, CENTRO_ALTA,
  				  CMD_ALTA, PUESTO_ALTA, CANT_AVISOS, CAN_CLI, FAM_MANT_AVER, FAM_CAUSA,
  				  TIEMPO_MANT, TIEMPO_OPER, DURACION_SR, FEC_RESOLUCION, FEC_CAUSA,
  				  DIR_AVISO, FECHA_BATCH, ESTADO_BATCH, DURACION_CL, DURACION_RS,
  				  DURACION_ER, DER_MANT_EN_CORTE, DURACION_ENV_BRIGADA, PAXTC, PCXTC,
  				  DURACION_MANT, DURACION_MANT_CORTE, COD_HOR, TIEPI, TIEBT, CORTE_SR,
  				  DURACION_EB_CL, DURACION_CL_SR, EB6203, EB4001, EB4002, EB4003, EB4004,
  				  EB4007, EB4007_EST, KWH_ESTIMADO, IND_ALUM_PUB, INSTALACION_ORIGEN,
  				  OBSERV_MTO, NOM_DOC, DURACION_CE, DURACION_MTO_CE, TIEPI_APORTADO,
  				  TIEBT_APORTADO, ALCANCE, ESTADO_RED, SAIFI, SAIDI, CAIDI, ASAI, DURACION_EB_ER,
  				  DURACION_ER_SR, NRO_AGRUPACION, FASE_SUGERIDA, TENSION_ORIGEN, TENSION_AFECTADA,
  				  AGENTE, DURACION,	AREA_AFEC, TIPO_LUMINARIA, LUM_REPARADAS, ELTO_SINSERV,
  				  PERDIDAS_OPE, CCLI_AFEC_IND, EB7000, COD_MOTIVO, DESCRIPCION_MOTIVO,
  				  ESTADO_ANTERIOR, USUARIO_ANULACION, FECHA_ANULACION, IND_ANULACION_SGI,
  				  IND_SCADA, IND_OBLIGADA, ENR, OBS_CORRECCIONES
		 FROM SGD_INCIDENCIA
		 WHERE NRO_INCIDENCIA = :pl_nro_incidencia);

		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Inserci$$HEX1$$f300$$ENDHEX$$n en gi_incidencia_agrupada ")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
		IF SQLCA.SQLCode = 0 THEN // El alta ha ido bien
			// Si la incidencia no es la contenedora se borra de SGD_INCIDENCIA
			
			IF pl_nro_incidencia <> il_incidencia_contenedora THEN 
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "No es la incidencia contenedora ")
				// GNU 13-2-2006. Mejora 1
				SELECT NRO_INST_AFECTADA, IND_SCADA, ALCANCE
				INTO : ll_nro_inst_afectada, :ll_ind_scada, :ll_alcance
				FROM SGD_INCIDENCIA
				WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
			
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Obtenermos el numero de instalaci$$HEX1$$f300$$ENDHEX$$n afectada, el indice de escada y el alcance ")						
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)						
				IF (il_nro_inst_afectada <> ll_nro_inst_afectada) AND & 
				    (ii_alcance_inc_cont <>ii_alcance_incid_agrup) AND &
			 	    (ii_alcance_inc_cont = fgci_incidencia_sin_interrupcion ) THEN
					  
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La instalaci$$HEX1$$f300$$ENDHEX$$n afectada, en la contenedora es distinta de la incidencia que vamos a grupar y el alcance de la incidencia contenedora es distinto que el alcance de la agrupaci$$HEX1$$f300$$ENDHEX$$n y el alcance de la contenedora es sin interrupci$$HEX1$$f300$$ENDHEX$$n")					  
					
					UPDATE SGD_INCIDENCIA
					SET NRO_INST_AFECTADA = :ll_nro_inst_afectada
					WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
					
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada de la incidencia contenedora con el n$$HEX1$$fa00$$ENDHEX$$mero de la intalaci$$HEX1$$f300$$ENDHEX$$n afectada de la incidencia que estamos tratando ")
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)			
					
					il_nro_inst_afectada= ll_nro_inst_afectada
					
				ELSEIF (il_nro_inst_afectada <> ll_nro_inst_afectada) AND &
				   ((il_tip_incidencia_cont= 2 AND ii_alcance_inc_cont =  fgci_incidencia_con_interrupcion ) OR (il_ind_scada_cont= 1)) &
				   AND (ll_ind_scada=1) AND ll_alcance = fgci_incidencia_con_interrupcion THEN
					
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "El n$$HEX1$$fa00$$ENDHEX$$mero de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada en la " + &
					"incidencia que estamos tratando es distinto del n$$HEX1$$fa00$$ENDHEX$$mero de la instalaci$$HEX1$$f300$$ENDHEX$$n " + &
					"afectada en la agrupaci$$HEX1$$f300$$ENDHEX$$n y la interrupcion que estamos tratando es de escada " + &
					"y la incidencia que procesamos es con interrupci$$HEX1$$f300$$ENDHEX$$n y  o bien la incidencia " + &
					"contenedora es programada y con interrupcion o es de escada ")
					
					UPDATE SGD_INTERRUPCION
					SET IND_OTRAS_INS = 1
					WHERE NRO_INCIDENCIA = :pl_nro_incidencia
					AND NRO_INSTALACION = :ll_nro_inst_afectada;
					
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n del indicador de otras instalaciones de la tabla de interrupciones a uno de la incidencia que estamos tratando ")
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
					
					UPDATE SGD_INTERRUPCION_RS
					SET IND_OTRAS_INS = 1
					WHERE NRO_INCIDENCIA = :pl_nro_incidencia
					AND NRO_INSTALACION = :ll_nro_inst_afectada;
					
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Actualizaci$$HEX1$$f300$$ENDHEX$$n del indicador de otras instalaciones del hist$$HEX1$$f300$$ENDHEX$$rico de interrupciones a uno de la incidencia que estamos tratando ")
					wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora,  string(sqlca.sqlcode) + sqlca.sqlerrtext)
					
				END IF
				// FIN GNU
				DELETE SGD_INCIDENCIA 
				WHERE NRO_INCIDENCIA = :pl_nro_incidencia
						AND EST_ACTUAL = :pi_estado;
						
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Borrado de la incidencia que estamos tratando de la tabla de incidencias ")
				wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
				
				IF SQLCA.SQLCode <> 0 OR SQLCA.SQLnrows = 0 THEN
					// Si SQLCA.SQLnrows = 0 es que el trigger de incidencias anidadas
					// ha cambiado de estado a la incidencia
					li_retorno = 0
				END IF
			END IF
		ELSE
			li_retorno = 0
		END IF
	ELSE
		li_retorno = 0
	END IF
ELSE
	IF pl_nro_incidencia = il_incidencia_contenedora THEN
		lb_contenedora_nueva = FALSE
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Ya existe la agrupaci$$HEX1$$f300$$ENDHEX$$n ")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	END IF
END IF
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_alta_gi_incidencia_agrupada")
return li_retorno 
end function

public function boolean wf_cambia_f_actual (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_cambia_f_actual
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que indica si cambia ha cambiado la fecha actula de la incidencia
//	 			 contenedora mientras se estaba realizando el proceso de agrupaci$$HEX1$$f300$$ENDHEX$$n
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  TRUE  -->  la fecha ha cambiado
//					FALSE -->  la fecha no ha cambiado
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 20/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
datetime ldt_f_actual

SetPointer(Hourglass!)

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_cambia_f_actual")

SELECT F_ACTUAL
INTO :ldt_f_actual
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Obtenci$$HEX1$$f300$$ENDHEX$$n de la fecha actual de la incidencia ")
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF SQLCA.SQLCode = 0 THEN
	IF ldt_f_actual <> idt_f_actual THEN
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La fecha actual ha cambiado")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_cambia_f_actual")
		Return TRUE
	ELSE
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "La fecha actual no ha cambiado")
		wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_cambia_f_actual")
		Return FALSE
	END IF
ELSE
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_cambia_f_actual")
	return TRUE
END IF
end function

private function boolean wf_valido_fechas ();Boolean lb_retorno = TRUE

DateTime ldt_fecha_desde
DateTime ldt_fecha_hasta

ldt_fecha_desde=d_deteccion.getitemdatetime(1,"desde")
ldt_fecha_hasta=d_deteccion.getitemdatetime(1,"hasta")

IF NOT FGNU_ES_NULA(ldt_fecha_hasta) then
	IF ldt_fecha_desde > ldt_fecha_hasta THEN
		gnv_msg.f_mensaje("EI25","","",OK!)
		d_deteccion.setitem(1,"desde",idt_fecha_desde)
		d_deteccion.accepttext()
		d_deteccion.setcolumn("desde")
		d_deteccion.setfocus()
		lb_retorno = false
	END IF
END IF
////////////////////////////////////VALIDO FECHA HASTA////////////////
IF lb_retorno THEN
	IF FGNU_ES_NULA(ldt_fecha_hasta) THEN
		gnv_msg.f_mensaje("EI27","","",OK!)
		d_deteccion.setitem(1,"hasta",idt_fecha_hasta)
		d_deteccion.accepttext()
		d_deteccion.setcolumn("hasta")
		d_deteccion.setfocus()
		lb_retorno = FALSE
	END IF
END IF
IF lb_retorno THEN
	IF NOT FGNU_ES_NULA(ldt_fecha_desde) then
		IF ldt_fecha_hasta< ldt_fecha_desde THEN
			gnv_msg.f_mensaje("EI26","","",OK!)
			d_deteccion.setitem(1,"hasta",idt_fecha_hasta)
			d_deteccion.accepttext()
			d_deteccion.setcolumn("hasta")
			d_deteccion.setfocus()
			lb_retorno = FALSE
		END IF
	END IF
END IF

return lb_retorno
end function

protected function string wf_filtro_desde_hasta ();String ls_retorno = ""

IF Long(em_incid_desde.Text) > 0 THEN
	IF Long(em_incid_desde.Text) = Long(em_incid_hasta.Text) THEN
		ls_retorno = " SGD_INCIDENCIA.NRO_INCIDENCIA = " + em_incid_desde.Text  
	ELSE
		ls_retorno = " SGD_INCIDENCIA.NRO_INCIDENCIA >= " + em_incid_desde.Text  + &
						 " AND SGD_INCIDENCIA.NRO_INCIDENCIA <= " + em_incid_hasta.Text  
	END IF
END IF

return ls_retorno
end function

public function integer wf_agrupar_inst_afect (long pl_nro_incidencia, long pl_nro_inst_afec);int li_retorno = 1

return li_retorno
end function

public function integer wf_agrupar_simulaciones (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_simulaciones
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa las simulaciones asociadas a las incidencias
//				 
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 21/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

Int li_res
string ls_mensaje

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_simulaciones")
SetPointer(Hourglass!)
li_res = gu_rf_servidor_operacion.of_agrupa_simulacion_incidencia(il_incidencia_contenedora, pl_nro_incidencia, ls_mensaje)

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, ls_mensaje)

IF li_res = 0 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
END IF

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_simulaciones")
return li_res
end function

public function integer wf_agrupar_indisponibilidades (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar_indisponibilidades
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa los datos de la interrupciones. No cambia las maniobras
//				asociadas a las interrupciones.
//				 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 21/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

// Se le cambia a las indisponibilidades el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
SetPointer(Hourglass!)

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "wf_agrupar_incisponibilidades")
UPDATE SGD_INDISPONIBILIDAD
SET NRO_INCIDENCIA = :il_incidencia_contenedora,
	 PROGRAMA = 'W_AGRUP',
	 USUARIO = :gs_usuario,
	 NRO_AGRUPACION = :il_nro_agrupacion,
	 ORDEN_AGRUPACION = (SELECT NVL(MAX(GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION),:ii_orden_agrup)
	 							FROM GI_SEGUIMIENTO_AGRUPACION
								WHERE NRO_AGRUPACION = :il_nro_agrupacion
									AND ORDEN_ANTIGUO = SGD_INDISPONIBILIDAD.ORDEN_AGRUPACION)
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "Cambio del n$$HEX1$$fa00$$ENDHEX$$mero de incidencia a las indisponibilidades ")
wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)

IF SQLCA.SQLCode < 0 THEN
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_incisponibilidades")
	return 0
end if
	wf_inserta_registro_log(pl_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar_incisponibilidades")
	return 1


end function

public function integer wf_agrupar ();///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_agrupar
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que agrupa todas las incidencias seleccionadas en dw_lista_incidencias sobre
//				 la incidencia seleccionada en la ventana w_1234_consulta_incidencias
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 20/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
int li_fila 
int li_retorno, li_nro_inc_agrup = 0 
long ll_nro_incidencia, ll_cierre
String ls_mensaje
w_2301_form_incidencia ls_ventana

// Si las incidencias son resueltas se comprueba que no se haya realizado el cierre del
// MCI para la fecha de reposici$$HEX1$$f300$$ENDHEX$$n de las incidencias

//AHM (24/03/2008)
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "wf_agrupar")

IF ii_estado_agrupado = fgci_incidencia_resuelta THEN
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Entra en incidencia agrupadora resuelta")
	
	SELECT COUNT(*)
	INTO :ll_cierre
	FROM SCI_IND_TEC_HIST
	WHERE SCI_IND_TEC_HIST.ANNO * 100 + SCI_IND_TEC_HIST.MES = to_number(to_char(:idt_fec_resolucion,'yyyymm'));
	
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Comprueba si ha sido contabilizada en cierre de MCI ")
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	
	IF SQLCA.SQLCode <> 0 THEN
		ll_cierre = 0
	END IF
	
	IF ll_cierre > 0 THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Incidencia " + string(il_incidencia_contenedora) + " contabilizada en el cierre")
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias debido a que la Incidencia " &
						+ string(il_incidencia_contenedora) + " ha sido contabilizada en el cierre del MCI." ,StopSign!)
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar")
		return -1 
	END IF
END IF

	// GNU 6-4-2006
// Se da de baja la incidencia contenedora en el Serv. Operaci$$HEX1$$f300$$ENDHEX$$n.
// Esto es debido a que se pueden a$$HEX1$$f100$$ENDHEX$$adir nuevas interrupciones a la incidencia
//IF wf_incidencia_de_operaciones(il_incidencia_contenedora) &
//	AND ii_estado_agrupado <> fgci_incidencia_resuelta THEN
//
//	IF gu_rf_servidor_operacion.of_avisar_baja_incidencia(il_incidencia_contenedora, ls_mensaje) = 0 THEN
//		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje,StopSign!)
//		return -1 
//	END IF
//END IF
// FIN GNU
// Se obtiene el c$$HEX1$$f300$$ENDHEX$$digo de agrupaci$$HEX1$$f300$$ENDHEX$$n
il_nro_agrupacion = wf_obtener_nro_agrup()

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "N$$HEX1$$fa00$$ENDHEX$$mero de la agrupaci$$HEX1$$f300$$ENDHEX$$n: " + string(il_nro_agrupacion))
// Se inserta la incidencia contenedora en la tabla GI_INCIDENCIA_AGRUPADA.
// En el caso de tratarse de un reeganche se inserta $$HEX1$$e900$$ENDHEX$$ste en GI_REENGANCHE_AGRUPADO.
IF wf_alta_gi_incidencia_agrupada(il_incidencia_contenedora, ii_estado_inc_cont) = 0 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido dar de alta la Incidencia Agrupada",StopSign!)
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "No se ha podido dar de alta la incidencia agrupada")
// GNU 6-4-2006	
//	IF wf_incidencia_de_operaciones(il_incidencia_contenedora) &
//		AND ii_estado_agrupado <> fgci_incidencia_resuelta THEN
//		
//		gu_rf_servidor_operacion.of_avisar_alta_incidencia(il_incidencia_contenedora, &
//																			il_nro_inst_afectada, &
//																			idt_f_deteccion_inc_cont, &
//																			2,ls_mensaje)
//	END IF
//	
// FIN GNU
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar")
	Return 0
END IF

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Inserci$$HEX1$$f300$$ENDHEX$$n de los estados de la incidencia contenedora")
// Se insertan los estados de la incidencia contenedora en la tabla GI_ESTADO_OPER_DESAGRUP
IF wf_alta_gi_estado_oper_desagrup(il_incidencia_contenedora) = 0 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido modificar los datos de la Incidencia Agrupada",StopSign!)
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "No se han podido modificar los datos de la incidencia agrupada")
	// GNU 6-4-2006	
//	IF wf_incidencia_de_operaciones(il_incidencia_contenedora) &
//		AND ii_estado_agrupado <> fgci_incidencia_resuelta THEN
//		
//		gu_rf_servidor_operacion.of_avisar_alta_incidencia(il_incidencia_contenedora, &
//																			il_nro_inst_afectada, &
//																			idt_f_deteccion_inc_cont, &
//																			2,ls_mensaje)
//	END IF
//	FIN GNU
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar")
	Return 0
END IF

// GNU 1-3-2006. Incidencia 0/409568
// gnu_u_transaction.uf_commit()
// FIN GNU
// Se obtiene la primera incidencia que se desea agrupar
li_fila = dw_lista_incidencias.GetSelectedRow(0)

// Se realiza la agrupaci$$HEX1$$f300$$ENDHEX$$n por cada incidencia seleccionada
DO WHILE li_fila > 0 and li_retorno <> -1 
	ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(li_fila, 'nro_incidencia')
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "N$$HEX1$$fa00$$ENDHEX$$mero de incidencias a agrupar: " + string(ll_nro_incidencia))	
	IF wf_agrupacion_permitida(li_fila) THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Agrupaci$$HEX1$$f300$$ENDHEX$$n permitida")
		li_retorno = wf_agrupar_incidencia(li_fila)
		IF li_retorno = 1 THEN
			li_nro_inc_agrup ++
			dw_lista_incidencias.DeleteRow(li_fila)
		ELSE
			dw_lista_incidencias.SelectRow(li_fila, false)
		END IF
	ELSE
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Agrupaci$$HEX1$$f300$$ENDHEX$$n no permitida")		
		dw_lista_incidencias.SelectRow(li_fila, false)
	END IF
	// Se selecciona la siguiente incidencia seleccionada
	li_fila = dw_lista_incidencias.GetSelectedRow(0) // Es cero, porque se ha borrado la
																	  // anterior seleccionada
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Selecci$$HEX1$$f300$$ENDHEX$$n de la siguiente incidencia seleccionada")																	  
	IF li_fila > 0 THEN
		IF ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(li_fila, 'nro_incidencia') THEN
			// Como es la misma no se ha podido agrupar, se busca la siguiente seleccionada
			li_fila = dw_lista_incidencias.GetSelectedRow(li_fila)
		END IF
	END IF
LOOP
wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin del recorrido de las incidencias seleccionadas")
// Se vuelve a dar de alta la incidencia en el Serv. de Operaci$$HEX1$$f300$$ENDHEX$$n
IF wf_incidencia_de_operaciones(il_incidencia_contenedora) &
	AND ii_estado_agrupado <> fgci_incidencia_resuelta THEN
			gu_rf_servidor_operacion.of_avisar_agrupacion_incidencias(il_incidencia_contenedora, &
																			il_nro_inst_afectada, &
																			idt_f_deteccion_inc_cont, &
																			2, il_nro_incidencias,ls_mensaje)
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Avisa agrupaci$$HEX1$$f300$$ENDHEX$$n incidencias " + ls_mensaje)
//	gu_rf_servidor_operacion.of_avisar_alta_incidencia(il_incidencia_contenedora, &
//																		il_nro_inst_afectada, &
//																		idt_f_deteccion_inc_cont, &
//																		2,ls_mensaje)
END IF

// Se comprueba si se ha conseguido agrupar alguna incidencia. En el caso de que no 
// se haya podido agrupar ninguna se borran los posibles datos dados de alta en
// GI_INCIDENCIA_AGRUPADA y GI_ESTADOS_OPER_DESAGRUP
IF lb_contenedora_nueva AND li_nro_inc_agrup = 0 THEN
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "No se ha conseguido agrupar incidencias")
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Se deshacen los cambios efectuados")
	wf_deshacer_cambios()
ELSE
	wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Se ha conseguido agrupar incidencias")
	if isvalid(gu_operaciones) AND ii_estado_agrupado <> fgci_incidencia_resuelta THEN
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "El estado de la agrupaci$$HEX1$$f300$$ENDHEX$$n no es agrupado")
		gu_operaciones.of_avisar_sgi(il_incidencia_contenedora)
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Avisa a otros sgi")
	end if
	// AVISAMOS AL PROPIO SGI de que la incidencia se ha modificado, por si la tuviera
	// abierta en modo consulta
	if isvalid(gu_control_v_incidencias) then
		ls_ventana = gu_control_v_incidencias.of_busca_ventana(il_incidencia_contenedora,-1)
		wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Buscamos la ventana donde tenemos abiertos los datos")
		if ii_estado_agrupado <> fgci_incidencia_resuelta AND not isnull(ls_ventana) then // ESTA ABIERTA
			wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "La ventana est$$HEX2$$e1002000$$ENDHEX$$abierta")
			if ls_ventana.lu_comunic.is_comunic.Accion_llamada = "Consulta" then // SOLO PARA CONSULTA
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Abierta en modo consulta")
				gu_control_v_incidencias.of_actualiza_operaciones(il_incidencia_contenedora,true,-1)
				wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "Refresco de los datos")
			end if
		end if
	end if
END IF

wf_inserta_registro_log(ll_nro_incidencia, il_incidencia_contenedora, "fin wf_agrupar")
Return dw_lista_incidencias.RowCount()

end function

protected function long wf_obtener_nro_agrup ();///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_obtener_nro_agrup
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene un c$$HEX1$$f300$$ENDHEX$$digo de agrupaci$$HEX1$$f300$$ENDHEX$$n para las incidencias que se desean
//				 agrupar. En el caso de que la incidencia contenedora sea una agrupaci$$HEX1$$f300$$ENDHEX$$n de 
//				 incidencias, se coger$$HEX2$$e1002000$$ENDHEX$$el c$$HEX1$$f300$$ENDHEX$$digo de agrupaci$$HEX1$$f300$$ENDHEX$$n de esta incidencia. Si no es una
//				 agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias, $$HEX1$$e900$$ENDHEX$$ste se obtendr$$HEX2$$e1002000$$ENDHEX$$de la secuencia COD_AGRUPACION
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//    Entrada:   
//
//    Salida:  N$$HEX1$$fa00$$ENDHEX$$mero de agrupaci$$HEX1$$f300$$ENDHEX$$n
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 21/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_agrup

SetPointer(Hourglass!)

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "wf_obtener_nro_agrup")
// Se comprueba si la incidencia contenedora es una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias
//IF ib_contenedora_reenganche THEN
//	// Se trata de un reenganche. El n$$HEX1$$fa00$$ENDHEX$$mero de agrupaci$$HEX1$$f300$$ENDHEX$$n habr$$HEX2$$e1002000$$ENDHEX$$que obtenerlo de la 
//	// tabla de reenganches
//	SELECT NVL(NRO_AGRUPACION,0)
//	INTO :ll_nro_agrup
//	FROM SGD_REENGANCHES
//	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
//	
//ELSE
	// Se trata de una incidencia normal
	SELECT NVL(NRO_AGRUPACION,0)
	INTO :ll_nro_agrup
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
//END IF

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "Comprobaci$$HEX1$$f300$$ENDHEX$$n de si es una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias ")		
wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)	


IF SQLCA.SQLCode <> 0 OR ll_nro_agrup = 0 THEN
	// La incidencia contenedora no es una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias
	// Se obtiene de la secuencia un nuevo n$$HEX1$$fa00$$ENDHEX$$mero de agrupaci$$HEX1$$f300$$ENDHEX$$n
	
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "No es una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias, obtenci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de agrupaci$$HEX1$$f300$$ENDHEX$$n")
	SELECT COD_AGRUPACION.NEXTVAL
	INTO :ll_nro_agrup
	FROM DUAL;
	
	wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, string(sqlca.sqlcode) + sqlca.sqlerrtext)
	
END IF

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, "N$$HEX1$$fa00$$ENDHEX$$mero de agrupaci$$HEX1$$f300$$ENDHEX$$n: " + string(ll_nro_agrup))

wf_inserta_registro_log(il_incidencia_contenedora, il_incidencia_contenedora, " fin wf_obtener_nro_agrup")
Return ll_nro_agrup
end function

public subroutine wf_inserta_registro_log (long pl_nro_incidencia, long pl_nro_agrupadora, string ps_observaciones);/******************************************************************************************************************************************************
Descripci$$HEX1$$f300$$ENDHEX$$n:	A$$HEX1$$f100$$ENDHEX$$ade un nuevo registro a la tabla gi_agrupacion_log
Par$$HEX1$$e100$$ENDHEX$$metros :   pl_nro_incidencia -> N$$HEX1$$fa00$$ENDHEX$$mero de incidencia que se est$$HEX2$$e1002000$$ENDHEX$$trantando
					pl_nro_agrupadora -> N$$HEX1$$fa00$$ENDHEX$$mero de la incidencia agrupadora
					ps_observaciones  -> Mensaje
					
Tipo			   Responsable						Fecha
---------------------------------------------------------
Creaci$$HEX1$$f300$$ENDHEX$$n	      Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas			   26/03/2008
******************************************************************************************************************************************************/

dateTime		ldt_fecha				//Fecha actual del sistema en la que se va a insertar el registro
string		ls_observaciones		//Observaciones con el formato correcto

IF ib_agrupando AND gi_pais = 6 THEN					//Comprueba si se est$$HEX2$$e1002000$$ENDHEX$$agrupando y el pais es Colombia

	ldt_fecha = fgnu_fecha_actual()	//Captura de la fecha actual
	ls_observaciones = left(ps_observaciones, 200)	//Formato adecuado de las observaciones (como mucho 200 caracteres)
	
	//Insertamos el registro en la tabla
	INSERT INTO GI_AGRUPACION_LOG (NRO_INCIDENCIA, NRO_INCIDENCIA_AGRUP, FECHA, USUARIO, OBSERVACIONES)
	VALUES ( :pl_nro_incidencia, :pl_nro_agrupadora, :ldt_fecha, :gs_usuario, :ls_observaciones);
	
END IF


end subroutine

on w_agrupacion_incidencias.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_incid_hasta=create em_incid_hasta
this.em_incid_desde=create em_incid_desde
this.st_hasta=create st_hasta
this.st_desde=create st_desde
this.dw_filtro_inst=create dw_filtro_inst
this.cb_buscar=create cb_buscar
this.st_ins_afect=create st_ins_afect
this.d_deteccion=create d_deteccion
this.dw_ambito=create dw_ambito
this.uo_barra=create uo_barra
this.dw_lista_incidencias=create dw_lista_incidencias
this.cb_agrupar=create cb_agrupar
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_incid_hasta
this.Control[iCurrent+3]=this.em_incid_desde
this.Control[iCurrent+4]=this.st_hasta
this.Control[iCurrent+5]=this.st_desde
this.Control[iCurrent+6]=this.dw_filtro_inst
this.Control[iCurrent+7]=this.cb_buscar
this.Control[iCurrent+8]=this.st_ins_afect
this.Control[iCurrent+9]=this.d_deteccion
this.Control[iCurrent+10]=this.dw_ambito
this.Control[iCurrent+11]=this.uo_barra
this.Control[iCurrent+12]=this.dw_lista_incidencias
this.Control[iCurrent+13]=this.cb_agrupar
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.gb_1
end on

on w_agrupacion_incidencias.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_incid_hasta)
destroy(this.em_incid_desde)
destroy(this.st_hasta)
destroy(this.st_desde)
destroy(this.dw_filtro_inst)
destroy(this.cb_buscar)
destroy(this.st_ins_afect)
destroy(this.d_deteccion)
destroy(this.dw_ambito)
destroy(this.uo_barra)
destroy(this.dw_lista_incidencias)
destroy(this.cb_agrupar)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;call super::open;long ll_estado, ll_existe_ot
Datetime ldt_f_nula

This.Setredraw(FALSE)

// Se carga el filtro de $$HEX1$$e100$$ENDHEX$$mbito con el $$HEX1$$e100$$ENDHEX$$mbito de la incidencia
dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
dw_ambito.fnu_insertar_datos(gu_comunic.is_comunic.intval7, gu_comunic.is_comunic.intval8, gu_comunic.is_comunic.intval9, 0)

// Se carga el filtro de fechas poniendo como fecha desde la fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la incidencia
d_deteccion.insertrow(0)
d_deteccion.setitem(1,"desde",Date(gu_comunic.is_comunic.datval3))
d_deteccion.setitem(1,"hasta",fgnu_fecha_actual())

// Se a$$HEX1$$f100$$ENDHEX$$ade en el filtro de las instalaciones la instalaci$$HEX1$$f300$$ENDHEX$$n afectada de la incidencia
dw_filtro_inst.Insertrow(0)
dw_filtro_inst.SetItem(1,'ps_nom_instalacion',gu_comunic.is_comunic.strval1)
dw_filtro_inst.SetItem(1,'nro_instalacion',il_incidencia_contenedora)

il_incidencia_contenedora = gu_comunic.is_comunic.longval3
il_nro_inst_afectada = gu_comunic.is_comunic.longval4
ii_estado_inc_cont = gu_comunic.is_comunic.intval4
ii_tip_incid_cont = gu_comunic.is_comunic.intval5
idt_f_deteccion_inc_cont = gu_comunic.is_comunic.datval3
ii_alcance_incid_agrup = gu_comunic.is_comunic.intval6
ii_alcance_inc_cont = gu_comunic.is_comunic.intval6
ii_estado_agrupado = ii_estado_inc_cont

IF NOT wf_incidencia_de_operaciones(il_incidencia_contenedora) OR ii_estado_inc_cont <> fgci_incidencia_resuelta THEN
	// Si la incidencia no la gestiona Operaci$$HEX1$$f300$$ENDHEX$$n no se permite agrupar con diferentes
	// instalaciones afectadas
	d_deteccion.modify("desde.background.color ="+gs_gris)
   d_deteccion.modify("hasta.background.color ="+gs_gris)
	d_deteccion.enabled = false
	dw_filtro_inst.modify("ps_nom_instalacion.background.color = "+gs_gris) 
	dw_filtro_inst.enabled = False
	st_ins_afect.enabled = False
	st_ins_afect.italic = false
	st_ins_afect.underline = false
	st_ins_afect.TextColor = 0
	em_incid_desde.enabled = FALSE
	em_incid_hasta.enabled = FALSE
	st_desde.italic = false
	st_desde.underline = false
	st_desde.TextColor = 0
	st_desde.enabled = false
END IF

This.Title = "OPEN SGI - Agrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias"

// Se comprueba si la incidencia contenedora tiene OT
SELECT NVL(NRO_OT,0)
INTO :ll_existe_ot
FROM GI_OT
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

ib_existe_ot = (SQLCA.SQLCode = 0) AND (ll_existe_ot > 0)

// Se almacena el n$$HEX1$$fa00$$ENDHEX$$mero de interrupciones no resueltas de la incidencia contenedora
// Este dato es necesario para obtener el estado final de la incidencia agrupada
SELECT COUNT(*) 
INTO :il_int_no_resueltas 
FROM SGD_INTERRUPCION
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
	AND ( (F_ALTA_FASE_A IS NOT NULL AND F_REPOSICION_FASE_A IS NULL)
		OR (F_ALTA_FASE_B IS NOT NULL AND F_REPOSICION_FASE_B IS NULL)
		OR (F_ALTA_FASE_C IS NOT NULL AND F_REPOSICION_FASE_C IS NULL) 
		OR (F_ALTA IS NOT NULL AND F_REPOSICION IS NULL));
	
IF SQLCA.SQLCode <> 0 THEN 
	il_int_no_resueltas = 0
END IF

// Se almacena el n$$HEX1$$fa00$$ENDHEX$$mero de interrupciones dadas de alta en la incidencia contenedora
// Este dato es necesario para obtener el estado final de la incidencia agrupada
SELECT COUNT(*) 
INTO :il_int_pendientes 
FROM SGD_INTERRUPCION
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
	
IF SQLCA.SQLCode <> 0 THEN 
	il_int_pendientes = 0
END IF

// Se comprueba si la incidencia contenedora tiene estado EB
SELECT COUNT(*)
INTO :ll_estado
FROM SGD_ESTADO_OPER
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora 
	AND COD_ESTADO = :fgci_incidencia_enviado_brigada;

ib_existe_eb = (SQLCA.SQLCode = 0 AND ll_estado = 1)

// Se obtiene la fecha de resoluci$$HEX1$$f300$$ENDHEX$$n estimada de la incidencia contenedora
SELECT F_EST_RES, F_ACTUAL, FEC_RESOLUCION
INTO :idt_f_res_estimada, :idt_f_actual, :idt_fec_resolucion
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

IF SQLCA.SQLCode <> 0 OR idt_f_res_estimada = ldt_f_nula THEN
	SetNull(idt_f_res_estimada)
END IF

// Se inicializa la matriz de estado desde la que se calcula el estado de la 
// agrupaci$$HEX1$$f300$$ENDHEX$$n

ii_estados[1,1] = fgci_incidencia_pendiente
ii_estados[1,2] = fgci_incidencia_en_reposicion
ii_estados[1,3] = ii_estado_indefinido
ii_estados[2,1] = fgci_incidencia_enviado_brigada
ii_estados[2,2] = fgci_incidencia_en_reposicion
ii_estados[2,3] = ii_estado_indefinido
ii_estados[3,1] = fgci_incidencia_en_reposicion
ii_estados[3,2] = fgci_incidencia_en_reposicion
ii_estados[3,3] = fgci_incidencia_en_reposicion
ii_estados[4,1] = ii_estado_indefinido
ii_estados[4,2] = fgci_incidencia_en_reposicion
ii_estados[4,3] = fgci_incidencia_servicio_repuesto

st_1.text = st_1.Text + string(il_incidencia_contenedora)

this.triggerevent("ue_post_open")
IF isvalid(This) THEN
	This.Setredraw(TRUE)
END IF


end event

event close;IF ib_incidencia_bloqueada THEN
	gnu_u_transaction.uf_rollback(THIS, fgci_bloqueo_incidencia, il_incidencia_contenedora)
END IF

IF ib_agrupado THEN 
	gu_comunic.is_comunic.programa_retorno = "w_agrup_incid"
ELSE
	gu_comunic.is_comunic.programa_retorno = ""
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_agrupacion_incidencias
end type

type st_2 from statictext within w_agrupacion_incidencias
integer x = 2386
integer y = 24
integer width = 329
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Detecci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type em_incid_hasta from editmask within w_agrupacion_incidencias
integer x = 1582
integer y = 236
integer width = 421
integer height = 80
integer taborder = 50
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

event modified;IF This.text <> "" then
	d_deteccion.modify("desde.background.color ="+gs_gris)
   d_deteccion.modify("hasta.background.color ="+gs_gris)
	d_deteccion.enabled = false
	dw_filtro_inst.modify("ps_nom_instalacion.background.color ="+gs_gris)
	dw_filtro_inst.enabled = false
	st_ins_afect.enabled = false
ELSEIF em_incid_desde.Text = "" THEN
	d_deteccion.modify("desde.background.color ="+gs_blanco)
   d_deteccion.modify("hasta.background.color ="+gs_blanco)
   d_deteccion.enabled = true
	dw_filtro_inst.modify("ps_nom_instalacion.background.color ="+gs_blanco)
	dw_filtro_inst.enabled = true
	st_ins_afect.enabled = true
END IF	
end event

type em_incid_desde from editmask within w_agrupacion_incidencias
integer x = 1582
integer y = 128
integer width = 421
integer height = 80
integer taborder = 40
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

event modified;IF This.text <> "" then
	d_deteccion.modify("desde.background.color ="+gs_gris)
   d_deteccion.modify("hasta.background.color ="+gs_gris)
	d_deteccion.enabled = false
	dw_filtro_inst.modify("ps_nom_instalacion.background.color ="+gs_gris)
	dw_filtro_inst.enabled = false
	st_ins_afect.enabled = False
ELSEIF em_incid_hasta.Text = "" THEN
	d_deteccion.modify("desde.background.color ="+gs_blanco)
   d_deteccion.modify("hasta.background.color ="+gs_blanco)
   d_deteccion.enabled = true
	dw_filtro_inst.modify("ps_nom_instalacion.background.color ="+gs_blanco)
	dw_filtro_inst.enabled = true
	st_ins_afect.enabled = true
END IF	
end event

type st_hasta from statictext within w_agrupacion_incidencias
integer x = 1285
integer y = 248
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Hasta :"
boolean focusrectangle = false
end type

type st_desde from statictext within w_agrupacion_incidencias
integer x = 1285
integer y = 144
integer width = 261
integer height = 76
integer taborder = 100
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
long backcolor = 79741120
string text = "Desde :"
boolean focusrectangle = false
end type

event doubleclicked;IF em_incid_desde.Text <> "" OR em_incid_hasta.Text <> "" THEN
	em_incid_desde.Text= ""
	em_incid_hasta.Text= ""
	d_deteccion.modify("desde.background.color ="+gs_blanco)
	d_deteccion.modify("hasta.background.color ="+gs_blanco)
	d_deteccion.enabled = true
	dw_filtro_inst.modify("ps_nom_instalacion.background.color ="+gs_blanco)
	dw_filtro_inst.enabled = true
	st_ins_afect.enabled = true
END IF
end event

type dw_filtro_inst from datawindow within w_agrupacion_incidencias
integer x = 73
integer y = 472
integer width = 1193
integer height = 140
integer taborder = 30
string dataobject = "d_nom_instalacion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;IF string(dwo.name) = 'ps_nom_instalacion' THEN
	this.setItem(1,'nro_instalacion',long(data))
	il_nro_inst_afectada = long(data)
END IF
end event

type cb_buscar from commandbutton within w_agrupacion_incidencias
integer x = 2386
integer y = 1436
integer width = 384
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Buscar"
boolean default = true
end type

event clicked;dw_lista_incidencias.Reset()
cb_agrupar.enabled = False

Parent.TriggerEvent("ue_armar_sql")
end event

type st_ins_afect from statictext within w_agrupacion_incidencias
integer x = 87
integer y = 412
integer width = 699
integer height = 68
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "mano.cur"
long textcolor = 128
long backcolor = 79741120
string text = "Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada"
boolean focusrectangle = false
end type

event doubleclicked;int li_tension, li_tip_instalacion
string ls_nom_instalacion
Boolean lb_todos = FALSE

gu_comunic.is_comunic.programa_llamante = 'w_reportes'
openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)

IF gu_comunic1.is_comunic.decval1 > 0 THEN
   SELECT "SGD_INSTALACION"."NOM_INSTALACION", 
	       NVL("SGD_INSTALACION"."TENSION",0),
			 "SGD_INSTALACION"."TIPO_INSTALACION"
   INTO :ls_nom_instalacion, :li_tension, :li_tip_instalacion	
   FROM "SGD_INSTALACION" 
   WHERE "NRO_INSTALACION" = :gu_comunic1.is_comunic.decval1 AND BDI_JOB=0;

   IF SQLCA.SQLCODE = 0 THEN 
		IF wf_incidencia_de_operaciones(il_incidencia_contenedora) THEN
			IF li_tension = fgci_baja_tension OR &
			   (li_tension = fgci_media_tension AND li_tip_instalacion = fgci_tipo_ct) THEN
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada debe ser superior a un CT")
				
				lb_todos = TRUE
			END IF
		END IF				
	   
	ELSE
		lb_todos = TRUE
	END IF
ELSE
	lb_todos = TRUE
END IF

IF lb_todos THEN
   dw_filtro_inst.SetItem(1,'ps_nom_instalacion','<Todas>')
   dw_filtro_inst.SetItem(1,'nro_instalacion',fgci_todos)
	il_nro_inst_afectada = fgci_todos
ELSE
	dw_filtro_inst.SetItem(1,'ps_nom_instalacion',ls_nom_instalacion)
	dw_filtro_inst.SetItem(1,'nro_instalacion',gu_comunic1.is_comunic.decval1)
	il_nro_inst_afectada = gu_comunic1.is_comunic.decval1
END IF
		

end event

type d_deteccion from u_inc_2013_pr_desde_hasta within w_agrupacion_incidencias
event ue_cambio_desde pbm_custom45
event ue_cambio_hasta pbm_custom46
integer x = 2322
integer y = 20
integer width = 901
integer height = 344
integer taborder = 60
boolean border = false
end type

on ue_cambio_desde;call u_inc_2013_pr_desde_hasta::ue_cambio_desde;DateTime ldt_fecha_desde
d_deteccion.setitem(1,"desde",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"desde")))
d_deteccion.accepttext()

		


end on

on ue_cambio_hasta;call u_inc_2013_pr_desde_hasta::ue_cambio_hasta;DateTime ldt_fecha_hasta
d_deteccion.setitem(1,"hasta",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"hasta")))
d_deteccion.accepttext()

end on

on dberror;//Para eliminar el scrip del padre
end on

event itemchanged;String ls_columna
Datetime ldt_fecha_desde
Datetime ldt_fecha_hasta
ls_columna=This.getcolumnname()

CHOOSE CASE ls_columna
	CASE "desde"
		idt_fecha_desde=this.getitemdatetime(1,"Desde")
	CASE "hasta"
		idt_fecha_hasta=this.getitemdatetime(1,"Hasta")	
END CHOOSE


end event

event rbuttondown;m_der_fechas lm_gestion_avi
lm_gestion_avi = CREATE m_der_fechas
m_der_fechas.idw_dw=this
lm_gestion_avi.PopMenu(xpos + 2100, ypos + 250)
destroy lm_gestion_avi

end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_agrupacion_incidencias
integer x = 27
integer width = 997
integer taborder = 10
boolean border = false
end type

type uo_barra from u_pr_gen_espera_act within w_agrupacion_incidencias
boolean visible = false
integer x = 992
integer y = 544
integer taborder = 110
long backcolor = 79741120
end type

on uo_barra.destroy
call u_pr_gen_espera_act::destroy
end on

type dw_lista_incidencias from u_inc_2021_pr_lista_incidencia within w_agrupacion_incidencias
integer x = 32
integer y = 732
integer width = 3182
integer height = 672
integer taborder = 70
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

event clicked;call super::clicked;//
IF row > 0 THEN
	IF IsSelected(row) THEN
		this.selectrow(row,false)
	ELSE
		this.selectrow(row,true)
	END IF
	
	cb_agrupar.enabled = This.GetSelectedRow(0) > 0
	
END IF

end event

type cb_agrupar from commandbutton within w_agrupacion_incidencias
integer x = 2839
integer y = 1436
integer width = 384
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Agrupar"
end type

event clicked;int li_retorno 
long ll_nro_indisponibilidades

ib_agrupado = TRUE
ib_agrupando = TRUE
// GNU 23-8-2007. Mejora EPSA-operaci$$HEX1$$f300$$ENDHEX$$n. Ahora permito agrupar incidencias con indisponibilidades
// GNU 2-11-2006. Mejora EPSA
//IF fg_verifica_parametro("indisponibilidades activas") THEN
//	SELECT COUNT(*)
//	INTO :ll_nro_indisponibilidades
//	FROM SGD_INDISPONIBILIDAD
//	WHERE nro_incidencia= :il_incidencia_contenedora;
//	
//	IF ll_nro_indisponibilidades > 0 THEN
//		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia " + String(il_incidencia_contenedora) +&
//						 ", ~r~n debido a que tiene indisponibilidades")
//		li_retorno=1
//	END IF
//END IF
// FIN GNU

//if li_retorno<>1 THEN
	li_retorno = wf_agrupar() 
//end if

IF li_retorno = 0 THEN
	Parent.SetFocus()
	// No quedan m$$HEX1$$e100$$ENDHEX$$s incidencias en la datawindow.
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ya no quedan m$$HEX1$$e100$$ENDHEX$$s Incidencias para seguir agrupando")
	This.enabled = False
	//Close(Parent)
ELSEIF li_retorno = -1 THEN
	Parent.SetFocus()
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n porque la incidencia " + &
					String(il_incidencia_contenedora) + " ha sido modificada por ~r~nSCADA")
	Close(Parent)
ELSE
	cb_agrupar.enabled = FALSE
END IF
ib_agrupando = FALSE

end event

type st_1 from statictext within w_agrupacion_incidencias
integer x = 32
integer y = 652
integer width = 3182
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 276856960
boolean enabled = false
string text = "Incidencias que se pueden agrupar a la n$$HEX1$$fa00$$ENDHEX$$mero:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_agrupacion_incidencias
integer x = 1230
integer y = 28
integer width = 878
integer height = 312
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "N$$HEX1$$fa00$$ENDHEX$$mero de Incidencia"
end type

type gb_1 from groupbox within w_agrupacion_incidencias
integer x = 37
integer y = 412
integer width = 1266
integer height = 212
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
end type


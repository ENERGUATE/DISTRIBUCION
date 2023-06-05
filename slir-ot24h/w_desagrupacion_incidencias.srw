HA$PBExportHeader$w_desagrupacion_incidencias.srw
$PBExportComments$Ventana desde donde se desagrupan incidencias
forward
global type w_desagrupacion_incidencias from w_sgigenerica
end type
type uo_barra from u_pr_gen_espera_act within w_desagrupacion_incidencias
end type
type dw_1 from datawindow within w_desagrupacion_incidencias
end type
type cbx_reenganche from checkbox within w_desagrupacion_incidencias
end type
type dw_lista_incidencias from u_inc_lista_seleccion_incidencia_agrup within w_desagrupacion_incidencias
end type
type cb_imprimir from commandbutton within w_desagrupacion_incidencias
end type
type cb_desagrupar from commandbutton within w_desagrupacion_incidencias
end type
type st_1 from statictext within w_desagrupacion_incidencias
end type
end forward

global type w_desagrupacion_incidencias from w_sgigenerica
integer x = 247
integer y = 464
integer width = 3227
integer height = 1436
string title = "OPEN SGI - Incidencias Agrupadas"
windowtype windowtype = response!
long backcolor = 79741120
event ue_arch_imprimir pbm_custom04
uo_barra uo_barra
dw_1 dw_1
cbx_reenganche cbx_reenganche
dw_lista_incidencias dw_lista_incidencias
cb_imprimir cb_imprimir
cb_desagrupar cb_desagrupar
st_1 st_1
end type
global w_desagrupacion_incidencias w_desagrupacion_incidencias

type variables
long il_incidencia_contenedora 
long il_nro_agrupacion 
long il_nro_inst_afectada

int ii_estado_incid_agrup
int ii_alcance_inc_contenedora

Datetime idt_f_actual
Datetime idt_f_deteccion
Datetime idt_f_resolucion

Boolean ib_existe_eb
Boolean ib_contenedora_reenganche
Boolean ib_reenganche_visible = FALSE
Boolean ib_bloqueada_anterior = FALSE
Boolean ib_desagrupado = FALSE

// GNU 5-4-2005. Incidencia 0/409568
Long il_nro_inc_alta []
Long il_nro_inst_alta []
DateTime f_det_alta []
// FIN GNU
end variables

forward prototypes
public function integer wf_desagrupar ()
public function integer wf_desagrupar_incidencia (integer pi_fila)
public function integer wf_desagrupar_datos_sgd_incidencia (long pl_nro_incidencia)
public function integer wf_desagrupar_interrupciones (long pl_nro_incidencia)
public function integer wf_desagrupar_maniobras (long pl_nro_incidencia)
public function integer wf_desagrupar_avisos (long pl_nro_incidencia)
public function integer wf_analizar_nuevo_alcance (integer pi_fila)
public function integer wf_analizar_estado_er_sr (long pl_nro_incidencia, integer pi_estado)
public function integer wf_analizar_estado_incid_desagrup (integer pi_fila)
public function integer wf_desagrupar_maniobras_reenganche (long pl_nro_incidencia)
public function integer wf_borrar_incidencia_agrupacion (long pl_nro_incidencia)
public function integer wf_deshacer_agrupacion ()
public function integer wf_analizar_estado_eb ()
public function boolean wf_incidencia_de_operaciones (long pl_nro_incidencia)
public function integer wf_analizar_estado_pt (long pl_nro_incidencia)
public function integer wf_desagrupar_seguimiento (long pl_nro_incidencia)
public function boolean wf_cambia_f_actual (long pl_nro_incidencia)
public function integer wf_analizar_estado_er_sr_rs (long pl_nro_incidencia)
public function integer wf_desagrupar_indisponibilidades (long pl_nro_incidencia)
end prototypes

event ue_arch_imprimir;DataWindowChild dw_datos
String ls_titulo
long ll_longitud
Datetime ldt_desde, ldt_hasta

IF dw_lista_incidencias.RowCount() > 0 THEN
	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
	dw_1.GetChild ("data_1",dw_datos)
		
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Listado de Incidencias Agrupadas'
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
		
//	dw_lista_incidencias.ShareData(dw_datos)
END IF

//IF dw_datos.RowCount() = 0 THEN triggerevent("ue_armar_sql")

IF dw_lista_incidencias.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_lista_incidencias

gf_impresion_preliminar (lst_impresion, True, 0)

end event

public function integer wf_desagrupar ();///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que desagrupa todas las incidencias seleccionadas en 
//				 dw_lista_incidencias de la incidencia agrupada
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
int li_fila
long ll_nro_incidencia, ll_num
String ls_mensaje
Datetime ldt_f_deteccion
w_2301_form_incidencia ls_ventana


// Si las incidencias est$$HEX1$$e100$$ENDHEX$$n en estado RS se comprueba que no se haya efectuado el cierre del MCI
// para el mes de la incidencia
IF ii_estado_incid_agrup = fgci_incidencia_resuelta THEN
	
	SELECT COUNT(*)
	INTO :ll_num
	FROM SCI_IND_TEC_HIST
	WHERE SCI_IND_TEC_HIST.ANNO * 100 + SCI_IND_TEC_HIST.MES = to_number(to_char(:idt_f_resolucion,'yyyymm'));
	
	IF SQLCA.SQLCode <> 0 THEN
		ll_num = 0
	END IF
	
	IF ll_num > 0 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se pueden desagrupar las incidencias debido a que ya han sido contabilizadas en el cierre del MCI.", StopSign!)
		return 0
	END IF
END IF


IF wf_incidencia_de_operaciones(il_incidencia_contenedora) AND ii_estado_incid_agrup <> fgci_incidencia_resuelta THEN
// GNU 5-4-2006. Incidencia 0/409568
		il_nro_inc_alta [1]= il_incidencia_contenedora
 		il_nro_inst_alta [1]= il_nro_inst_afectada
		f_det_alta [1]= idt_f_deteccion
//	IF gu_rf_servidor_operacion.of_avisar_baja_incidencia(il_incidencia_contenedora, ls_mensaje) = 0 THEN
//		return -1 
//	END IF
// FIN GNU
END IF

li_fila = dw_lista_incidencias.GetSelectedRow(0)

// Se realiza la desagrupaci$$HEX1$$f300$$ENDHEX$$n por cada incidencia seleccionada
DO WHILE li_fila > 0 AND li_retorno <> -1
	ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(li_fila, 'nro_incidencia')
	
	li_retorno = wf_desagrupar_incidencia(li_fila)
	IF li_retorno > 0 THEN
		dw_lista_incidencias.DeleteRow(li_fila)
	ELSE
		dw_lista_incidencias.SelectRow(li_fila, false)
	END IF
	// Se obtiene la siguiente incidencia seleccionada
	li_fila = dw_lista_incidencias.GetSelectedRow(0) // Es cero, porque se ha borrado la
																	 // anterior seleccionada
	IF li_fila > 0 THEN
		IF ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(li_fila, 'nro_incidencia') THEN
			// Como es la misma, no se ha podido desagrupar, buscamos la siguiente
			li_fila = dw_lista_incidencias.GetSelectedRow(li_fila)
		END IF	
	END IF
LOOP

SELECT F_DETECCION
INTO :ldt_f_deteccion
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

IF SQLCA.SQLCode <> 0 THEN
	ldt_f_deteccion = idt_f_deteccion
END IF

IF wf_incidencia_de_operaciones(il_incidencia_contenedora) AND ii_estado_incid_agrup <> fgci_incidencia_resuelta THEN
	// GNU 5-4-2006. Incidencia 0/409568
	// Aqu$$HEX2$$ed002000$$ENDHEX$$habr$$HEX2$$e1002000$$ENDHEX$$que llamar a Desagrupar Incidencia
//	IF gu_rf_servidor_operacion.of_avisar_alta_incidencia(il_incidencia_contenedora, &
//																	il_nro_inst_afectada, &
//																	ldt_f_deteccion, &
//																	2, ls_mensaje) = 0 THEN
	f_det_alta [1]= ldt_f_deteccion
	IF gu_rf_servidor_operacion.of_avisar_desagrupacion_incidencias(il_nro_inc_alta, &
																				il_nro_inst_alta , &
																				 f_det_alta, &
																				2, ls_mensaje)= 0 THEN
		MessageBox("Error",ls_mensaje)
		return dw_lista_incidencias.RowCount()
	END IF
END IF

if isvalid(gu_operaciones) then
	gu_operaciones.of_avisar_sgi(il_incidencia_contenedora)
end if

// AVISAMOS AL PROPIO SGI de que la incidencia se ha eliminado, por si la tuviera
// abierta en modo consulta
if isvalid(gu_control_v_incidencias) AND ii_estado_incid_agrup <> fgci_incidencia_resuelta then
	ls_ventana = gu_control_v_incidencias.of_busca_ventana(il_incidencia_contenedora,-1)
	if not isnull(ls_ventana) then // ESTA ABIERTA
		if ls_ventana.lu_comunic.is_comunic.Accion_llamada = "Consulta" then // SOLO PARA CONSULTA
			gu_control_v_incidencias.of_actualiza_operaciones(il_incidencia_contenedora,true,-1)
		end if
	end if
end if

return dw_lista_incidencias.RowCount()

end function

public function integer wf_desagrupar_incidencia (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_incidencia
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que desagrupa una incidencia de la incidencia agrupada. Se desagrupan
//				 maniobra, interrupciones, avisos, y se comprueba las posibles modificaciones
//				 de estado en ambas incidencias: incidencia agrupada, incidencia desagrupada
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
//						     contenedora, con lo que no se puede continuar con la desagrupaci$$HEX1$$f300$$ENDHEX$$n.
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 23/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
int li_retorno = 1, li_alcance
long ll_nro_incidencia, ll_num
Datetime ldt_fec_resolucion
String ls_mensaje

This.SetFocus()
SetPointer(Hourglass!)
// No se bloquea la incidencia que se desea desagrupar porque se supone que ya se tiene 
// bloqueada la incidencia agrupada
uo_barra.visible=true
uo_barra.barra.f_resetea_barra()
uo_barra.barra.f_amplia(0)
uo_barra.gb_1.text="Desagrupando Incidencia..."

ll_nro_incidencia = dw_lista_incidencias.Getitemnumber(pi_fila, 'nro_incidencia')
li_alcance = dw_lista_incidencias.Getitemnumber(pi_fila, 'alcance')

// Se comprueba que no se haya efectuado el cierre del MCI
IF ii_estado_incid_agrup = fgci_incidencia_resuelta THEN
	ldt_fec_resolucion = dw_lista_incidencias.GetItemDateTime(pi_fila, 'gi_incidencia_agrupada_fec_resolucion')
	
	SELECT COUNT(*)
	INTO :ll_num
	FROM SCI_IND_TEC_HIST
	WHERE SCI_IND_TEC_HIST.ANNO * 100 + SCI_IND_TEC_HIST.MES = to_number(to_char(:idt_f_resolucion,'yyyymm'));
	
	IF SQLCA.SQLCode <> 0 THEN
		ll_num = 0
	END IF
	
	IF ll_num > 0 THEN
		ls_mensaje = "No se puede desagrupar la incidencia " + String(ll_nro_incidencia) + " debido a que ya se ha efectuado el cierre del MCI para su fecha de resoluci$$HEX1$$f300$$ENDHEX$$n."
		li_retorno = 0
	END IF
END IF

// Si la incidencia contenedora est$$HEX2$$e1002000$$ENDHEX$$resuelta, la incidencia que se desea desagrupar debe estar resuelta
IF ii_estado_incid_agrup = fgci_incidencia_resuelta AND &
	dw_lista_incidencias.Getitemnumber(pi_fila,'gi_incidencia_agrupada_est_actual') <> fgci_incidencia_resuelta THEN
	ls_mensaje = "No se puede desagrupar la Incidencia " + String(ll_nro_incidencia) + " debido a que no est$$HEX2$$e1002000$$ENDHEX$$resuelta."
	li_retorno = 0
END IF


uo_barra.barra.f_amplia(8)
uo_barra.gb_1.text="Desagrupando Estados..."
IF li_retorno > 0 AND cbx_reenganche.checked = FALSE THEN
	// En los reenganches no se desagrupa el seguimiento
	li_retorno = wf_desagrupar_seguimiento(ll_nro_incidencia)
	
	IF li_retorno = 0 THEN
		ls_mensaje = "No se han podido desagrupar los datos de los estados de la Incidencia " + String(ll_nro_incidencia) + "."
	END IF
END IF

// Se desagrupa la incidencia
IF li_retorno > 0 THEN
	uo_barra.barra.f_amplia(16)
	uo_barra.gb_1.text="Desvinculando Incidencia..."
	li_retorno = wf_desagrupar_datos_sgd_incidencia(ll_nro_incidencia)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se han podido desagrupar los datos de la Incidencia " + String(ll_nro_incidencia) + "."
	END IF
END IF	
	
// Se desagrupan las interrupciones
IF li_retorno > 0 AND cbx_reenganche.checked = FALSE AND &
	li_alcance = fgci_incidencia_con_interrupcion THEN
	
	uo_barra.barra.f_amplia(24)
	uo_barra.gb_1.text="Desagrupando Interrupciones..."
	li_retorno = wf_desagrupar_interrupciones(ll_nro_incidencia)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se han podido desagrupar los datos de las interrupciones de la Incidencia " + String(ll_nro_incidencia) + "."
	END IF
END IF

//LSH INI 26/07/2013 DEO12-00000054 
//// GNU 23-8-2007. Mejora EPSA indisponibilidades operaci$$HEX1$$f300$$ENDHEX$$n
//IF fg_verifica_parametro("indisponibilidades activas") THEN
//	IF li_retorno > 0 THEN
//		uo_barra.barra.f_amplia(30)
//		uo_barra.gb_1.text="Desagrupando Indisponibilidades..."
//		li_retorno = wf_desagrupar_indisponibilidades(ll_nro_incidencia)
//		IF li_retorno = 0 THEN
//			ls_mensaje = "No se han podido desagrupar los datos de las indisponibilidades de la Incidencia " + String(ll_nro_incidencia) + "."
//		END IF
//	END IF
//END IF
//// FIN GNU
//LSH INI 26/07/2013 DEO12-00000054 

// Se desagrupan las maniobras
IF li_retorno > 0 THEN
	uo_barra.barra.f_amplia(32)
	uo_barra.gb_1.text="Desagrupando Maniobras..."
	li_retorno = wf_desagrupar_maniobras(ll_nro_incidencia)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se han podido desagrupar los datos de las maniobras de la Incidencia " + String(ll_nro_incidencia) + "."
	END IF
END IF

// Se desagrupan los avisos
IF li_retorno > 0 AND cbx_reenganche.checked = FALSE AND &
	li_alcance = fgci_incidencia_con_interrupcion THEN

	uo_barra.barra.f_amplia(40)
	uo_barra.gb_1.text="Desagrupando Avisos..."
	li_retorno = wf_desagrupar_avisos(ll_nro_incidencia)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se han podido desagrupar los datos de los avisos asociados a la Incidencia " + String(ll_nro_incidencia) + "."
	END IF
END IF

// Se comprueba la fecha del estado PT para ver si $$HEX1$$e900$$ENDHEX$$sta ha cambiado
IF li_retorno > 0 THEN
	uo_barra.barra.f_amplia(48)
	uo_barra.gb_1.text="Comprobando F. Detecci$$HEX1$$f300$$ENDHEX$$n..."
	li_retorno = wf_analizar_estado_pt(ll_nro_incidencia)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se ha podido determinar la nueva Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n de la Incidencia Agrupada." 
	END IF
END IF

// Se analiza el posible nuevo estado de la incidencia desagrupada
IF li_retorno > 0 AND li_alcance = fgci_incidencia_con_interrupcion THEN
	uo_barra.barra.f_amplia(56)
	uo_barra.gb_1.text="Analizando Estado..."
	li_retorno = wf_analizar_estado_incid_desagrup(pi_fila)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se ha podido determinar el nuevo estado de la Incidencia " + String(ll_nro_incidencia) + "."
	END IF
END IF

// Se analiza si la incidencia agrupada cambia de alcance
IF li_retorno > 0 AND cbx_reenganche.checked = FALSE THEN
	uo_barra.barra.f_amplia(64)
	uo_barra.gb_1.text="Analizando Alcance..."
	li_retorno = wf_analizar_nuevo_alcance(pi_fila)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se ha podido determinar el nuevo Alcance de la Incidencia Agrupada." 
	END IF
END IF

// Se comprueba si cambia el estado EB
IF li_retorno > 0 THEN
	uo_barra.barra.f_amplia(72)
	uo_barra.gb_1.text="Analizando Estado EB..."

	li_retorno = wf_analizar_estado_eb()
	IF li_retorno = 0 THEN
		ls_mensaje = "No se han podido dar de alta los datos del estado EB en la Incidencia Agrupada." 
	END IF
END IF

// Se analizan las fechas de los estados asociados a interrupciones por si han cambiado
// de fecha
IF li_retorno > 0 AND cbx_reenganche.checked = FALSE AND &
	ii_alcance_inc_contenedora = fgci_incidencia_con_interrupcion THEN

	uo_barra.barra.f_amplia(80)
	uo_barra.gb_1.text="Analizando Interrupciones..."
	IF ii_estado_incid_agrup = fgci_incidencia_resuelta THEN
		li_retorno = wf_analizar_estado_er_sr_rs(il_incidencia_contenedora)
	ELSE
		li_retorno = wf_analizar_estado_er_sr(il_incidencia_contenedora, ii_estado_incid_agrup)
	END IF
	IF li_retorno = 0 THEN
		ls_mensaje = "No se han podido determinar las nuevas fechas de estado en la Incidencia Agrupada." 
	END IF
END IF

// Se elimina la informaci$$HEX1$$f300$$ENDHEX$$n de la incidencia de las tablas que guardan informaci$$HEX1$$f300$$ENDHEX$$n de la 
// agrupaci$$HEX1$$f300$$ENDHEX$$n
IF li_retorno > 0 THEN
	uo_barra.barra.f_amplia(88)
	uo_barra.gb_1.text="Borrando Inc. Agrupada..."
	li_retorno = wf_borrar_incidencia_agrupacion(ll_nro_incidencia)
	IF li_retorno = 0 THEN
		ls_mensaje = "No se ha podido eliminar la Incidencia " + String(ll_nro_incidencia) + " de la Agrupaci$$HEX1$$f300$$ENDHEX$$n."
	END IF
END IF

// Se analiza si se deshace la agrupaci$$HEX1$$f300$$ENDHEX$$n, porque no queden m$$HEX1$$e100$$ENDHEX$$s incidencias
IF li_retorno > 0 THEN
	uo_barra.barra.f_amplia(96)
	uo_barra.gb_1.text="Analizando Incidencia..."
	li_retorno = wf_deshacer_agrupacion()
	IF li_retorno = 0 THEN
		ls_mensaje = "No se ha podido deshacer la Agrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias."
	END IF
END IF

IF li_retorno > 0 THEN
	IF wf_cambia_f_actual(il_incidencia_contenedora) THEN
		li_retorno = -1
		ls_mensaje = "No se ha podido realizar de manera completa la desagrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias debido ~r~na que maniobras de otra incidencia han modificado el estado de la incidencia " + string(il_incidencia_contenedora) + "."
	END IF
END IF

IF li_retorno = 1 THEN
	uo_barra.barra.f_amplia(100)
	uo_barra.gb_1.text="Desbloqueando Incidencia..."

	gnu_u_transaction.uf_commit()

	IF wf_incidencia_de_operaciones(ll_nro_incidencia) AND ii_estado_incid_agrup <> fgci_incidencia_resuelta THEN
		// GNU 5-4-2006. Incidencia 0/409568
		il_nro_inc_alta [UpperBound(il_nro_inc_alta)+1]= ll_nro_incidencia
 		il_nro_inst_alta [UpperBound(il_nro_inst_alta)+1]= dw_lista_incidencias.GetItemNumber(pi_fila,'nro_inst_afectada')
		f_det_alta [UpperBound(f_det_alta)+ 1]= dw_lista_incidencias.GetItemDatetime(pi_fila,'gi_incidencia_agrupada_f_deteccion')
		// Se notifica el alta de la incidencia al servidor de operaciones en el caso de que sea 
		// de media tensi$$HEX1$$f300$$ENDHEX$$n
//		IF gu_rf_servidor_operacion.of_avisar_alta_incidencia(ll_nro_incidencia, &
//																			dw_lista_incidencias.GetItemNumber(pi_fila,'nro_inst_afectada'), &
//																			dw_lista_incidencias.GetItemDatetime(pi_fila,'gi_incidencia_agrupada_f_deteccion'), &
//																			2, ls_mensaje) = 0 THEN
//			Messagebox("Error", ls_mensaje)
//		END IF
// FIN GNU
	END IF	
ELSE
	gnu_u_transaction.uf_rollback()
	Messagebox("Error", ls_mensaje)
END IF

uo_barra.visible = False

return li_retorno
end function

public function integer wf_desagrupar_datos_sgd_incidencia (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_datos_sgd_incidencia
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que mueve la incidencia que se desea desagrupar de la tabla
//				GI_SEGUIMIENTO_INCIDENCIA a SGD_INCIDENCIA. Una vez movido el registro,
//				$$HEX1$$e900$$ENDHEX$$ste se borra de la tabla GI_SEGUIMIENTO_INCIDENCIA
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
// 23/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
long ll_num
int li_retorno = 1, li_ind_scada, li_ind_obligada, li_ind_obligada2
// GNU 15-2-2006. Mejora 1
long ll_nro_inst_afectada_orig, ll_nro_inst_afectada_orig_2
 
SetPointer(Hourglass!)

	// GNU 31-1-2006. Incidencia pruebas Nicaragua
string ls_descripcion, ls_descripcion_agrupada, ls_desc_izq, ls_desc_der
int li_posicion

			SELECT DESC_INCIDENCIA
			INTO :ls_descripcion
			FROM GI_INCIDENCIA_AGRUPADA
			 WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND 
			 NRO_AGRUPACION = :il_nro_agrupacion;
					  
			SELECT DESC_INCIDENCIA 
			INTO :ls_descripcion_agrupada
			FROM SGD_INCIDENCIA
			 WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;			  
	
	li_posicion=pos(ls_descripcion_agrupada,ls_descripcion)
	ls_desc_izq= left (ls_descripcion_agrupada, li_posicion - 3)
	if li_posicion= 1 then 
		ls_desc_der= right(ls_descripcion_agrupada, len (ls_descripcion_agrupada) - (len(ls_descripcion)+ li_posicion)-1)
	else
		ls_desc_der= right(ls_descripcion_agrupada, len (ls_descripcion_agrupada) - (len(ls_descripcion)+ li_posicion)+1)
	end if
	ls_descripcion_agrupada= ls_desc_izq+ls_desc_der
		UPDATE SGD_INCIDENCIA
		SET DESC_INCIDENCIA= :ls_descripcion_agrupada
		WHERE  NRO_INCIDENCIA = :il_incidencia_contenedora;	
		
	
// FIN GNU

			////////////////////////////////////////////////////////
			// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 28/10/2002
			////////////////////////////////////////////////////////
			select nvl(ind_obligada,0)
			into :li_ind_obligada2
			from GI_INCIDENCIA_AGRUPADA
			WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
			NRO_INCIDENCIA = :pl_nro_incidencia;
			//////////////////////////////////////////////////////
//IF cbx_reenganche.checked = FALSE THEN
	// La incidencia desagrupada no es un reenganche
	// Se vuelve a dar de alta la incidencia en SGD_INCIDENCIA
	INSERT INTO SGD_INCIDENCIA ( NRO_INCIDENCIA, USUARIO, F_ACTUAL, H_ACTUAL, PROGRAMA, PRIMER_AVISO,
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
  					 DURACION_EB_CL, DURACION_CL_SR, EB6203, EB4001, EB4002, EB4003,
  					 EB4004, EB4007, EB4007_EST, KWH_ESTIMADO, IND_ALUM_PUB, INSTALACION_ORIGEN,
  					 OBSERV_MTO, NOM_DOC, DURACION_CE, DURACION_MTO_CE, TIEPI_APORTADO,
  					 TIEBT_APORTADO, ALCANCE, ESTADO_RED, SAIFI, SAIDI, CAIDI, ASAI,
  					 DURACION_EB_ER, DURACION_ER_SR, NRO_AGRUPACION, FASE_SUGERIDA,
  				    TENSION_ORIGEN, TENSION_AFECTADA, AGENTE, IND_SCADA, AREA_AFEC,
  					 CCLI_AFEC_IND, COD_MOTIVO, DESCRIPCION_MOTIVO, DURACION, EB7000,
  					 ELTO_SINSERV, ESTADO_ANTERIOR, FECHA_ANULACION, IND_ANULACION_SGI,
  					 IND_OBLIGADA, LUM_REPARADAS, PERDIDAS_OPE, TIPO_LUMINARIA, USUARIO_ANULACION,
  					OBS_CORRECCIONES, ENR)
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
  					 DURACION_EB_CL, DURACION_CL_SR, EB6203, EB4001, EB4002, EB4003,
  					 EB4004, EB4007, EB4007_EST, KWH_ESTIMADO, IND_ALUM_PUB, INSTALACION_ORIGEN,
  					 OBSERV_MTO, NOM_DOC, DURACION_CE, DURACION_MTO_CE, TIEPI_APORTADO,
  					 TIEBT_APORTADO, ALCANCE, ESTADO_RED, SAIFI, SAIDI, CAIDI, ASAI,
  					 DURACION_EB_ER, DURACION_ER_SR, NRO_AGRUPACION, FASE_SUGERIDA,
  				    TENSION_ORIGEN, TENSION_AFECTADA, AGENTE, IND_SCADA, AREA_AFEC,
  					 CCLI_AFEC_IND, COD_MOTIVO, DESCRIPCION_MOTIVO, DURACION, EB7000,
  					 ELTO_SINSERV, ESTADO_ANTERIOR, FECHA_ANULACION, IND_ANULACION_SGI,
  					 IND_OBLIGADA, LUM_REPARADAS, PERDIDAS_OPE, TIPO_LUMINARIA, USUARIO_ANULACION,
  					OBS_CORRECCIONES, ENR
  FROM GI_INCIDENCIA_AGRUPADA
			 WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
			 		 NRO_AGRUPACION = :il_nro_agrupacion);
	
	IF SQLCA.SQLCode <> 0 THEN
		li_retorno = 0
	ELSE

		// Se elimina el c$$HEX1$$f300$$ENDHEX$$digo de agrupaci$$HEX1$$f300$$ENDHEX$$n de la incidencia a desagrupar en el caso de que 
		// la incidencia ya no pertenezca a ninguna agrupaci$$HEX1$$f300$$ENDHEX$$n
		
		SELECT MAX(NRO_AGRUPACION)
		INTO :ll_num
		FROM GI_INCIDENCIA_AGRUPADA
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
				NRO_AGRUPACION <> :il_nro_agrupacion;
				
		IF SQLCA.SQLCode <> 0 THEN
			ll_num = 0
		END IF
			
		UPDATE SGD_INCIDENCIA
		SET NRO_AGRUPACION = DECODE(:ll_num, 0, NULL, :ll_num),
			 USUARIO = :gs_usuario,
			 PROGRAMA = 'W_DESAGRUP'
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
		
		IF SQLCA.SQLCode <> 0 THEN
			li_retorno = 0
		ELSE
			// Se borra la incidencia de la tabla GI_INCIDENCIA_AGRUPADA
			DELETE GI_INCIDENCIA_AGRUPADA
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
					NRO_AGRUPACION = :il_nro_agrupacion;
			
			IF SQLCA.SQLCode <> 0 THEN
				li_retorno = 0
			ELSE 
				li_retorno = 1
			END IF
		END IF			
	END IF
//ELSE
//	// La incidencia desagrupada es un reenganche
//	// Se vuelve a dar de alta la incidencia en SGD_INCIDENCIA_REENGANCHE
//	INSERT INTO SGD_INCIDENCIA_REENGANCHE
//		(SELECT * FROM GI_REENGANCHE_AGRUPADO
//		 WHERE NRO_INCIDENCIA = :pl_nro_incidencia);
//		 
//	IF SQLCA.SQLCode <> 0 THEN
//		li_retorno = 0
//	ELSE
//		// Se elimina el c$$HEX1$$f300$$ENDHEX$$digo de agrupaci$$HEX1$$f300$$ENDHEX$$n de la incidencia a desagrupar
//		UPDATE SGD_INCIDENCIA_REENGANCHE
//		SET NRO_AGRUPACION = NULL,
//			 USUARIO = :gs_usuario,
//			 PROGRAMA = 'W_DESAGRUP'
//		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
//	
//		IF SQLCA.SQLCode <> 0 THEN
//			li_retorno = 0
//		ELSE
//			// Se borra la incidencia de la tabla GI_REENGANCHE_AGRUPADO
//			DELETE GI_REENGANCHE_AGRUPADO
//			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
//		
//			IF SQLCA.SQLCode <> 0 THEN
//				li_retorno = 0
//			ELSE 
//				li_retorno = 1
//			END IF
//		END IF			
//	END IF		
//END IF
//

SELECT NVL(MAX(IND_SCADA),0)
INTO :li_ind_scada
FROM GI_INCIDENCIA_AGRUPADA
WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
		NRO_INCIDENCIA <> :pl_nro_incidencia;
		
UPDATE SGD_INCIDENCIA
SET IND_SCADA = :li_ind_scada
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

IF SQLCA.SQLCode <> 0 THEN
	li_retorno = 0
ELSE 
	li_retorno = 1
END IF

////////////////////////////////////////////////////////
// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 29/08/2002
////////////////////////////////////////////////////////

SELECT NVL(MAX(IND_OBLIGADA),0)
INTO :li_ind_obligada
FROM GI_INCIDENCIA_AGRUPADA
WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
		NRO_INCIDENCIA <> :pl_nro_incidencia;
			
IF li_ind_obligada = 0 then
		
	if li_ind_obligada2 = 0 then
		SELECT nvl(ind_obligada,0)
		INTO :li_ind_obligada
		FROM SGD_INCIDENCIA
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
	end if	
	
END IF

UPDATE SGD_INCIDENCIA
SET IND_OBLIGADA = :li_ind_obligada
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;

IF SQLCA.SQLCode <> 0 THEN
	li_retorno = 0
ELSE 
	li_retorno = 1
END IF
//////////////////////////////////////////////////////////

return li_retorno
end function

public function integer wf_desagrupar_interrupciones (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_interrupciones
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que se lleva las interrupciones de la incidencia desagrupada de
//				 la agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias
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
// 23/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(Hourglass!)

UPDATE SGD_INTERRUPCION
SET NRO_INCIDENCIA = :pl_nro_incidencia,
	 USUARIO = :gs_usuario,
	 PROGRAMA = 'W_DESAGRUP',
	 ORDEN_AGRUPACION = (SELECT MAX(ORDEN_ANTIGUO)
	 							FROM GI_SEGUIMIENTO_AGRUPACION
								WHERE GI_SEGUIMIENTO_AGRUPACION.NRO_AGRUPACION = :il_nro_agrupacion and
										GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION = SGD_INTERRUPCION.ORDEN_AGRUPACION)
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
	AND ORDEN_AGRUPACION IN (SELECT ORDEN_AGRUPACION
									 FROM GI_SEGUIMIENTO_AGRUPACION
									 WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
									 		 NRO_INCIDENCIA = :pl_nro_incidencia);

IF SQLCA.SQLCode < 0 THEN
	return 0
ELSE
	// GNU 14-2-2006. Mejora 1
	UPDATE SGD_INTERRUPCION
	SET IND_OTRAS_INS= 0
	WHERE NRO_INCIDENCIA= :pl_nro_incidencia AND
			    NRO_INSTALACION= (SELECT NRO_INST_AFECTADA 
				 							FROM SGD_INCIDENCIA 
											 WHERE NRO_INCIDENCIA = :pl_nro_incidencia);
	 IF SQLCA.SQLCode < 0 THEN
		return 0
	END IF
	// FIN GNU
	IF ii_estado_incid_agrup = fgci_incidencia_resuelta THEN
		UPDATE SGD_INTERRUPCION_RS
		SET NRO_INCIDENCIA = :pl_nro_incidencia,
			 USUARIO = :gs_usuario,
			 PROGRAMA = 'W_DESAGRUP',
			 ORDEN_AGRUPACION = (SELECT MAX(ORDEN_ANTIGUO)
										FROM GI_SEGUIMIENTO_AGRUPACION
										WHERE GI_SEGUIMIENTO_AGRUPACION.NRO_AGRUPACION = :il_nro_agrupacion and
												GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION = SGD_INTERRUPCION_RS.ORDEN_AGRUPACION)
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
			AND ORDEN_AGRUPACION IN (SELECT ORDEN_AGRUPACION
											 FROM GI_SEGUIMIENTO_AGRUPACION
											 WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
													 NRO_INCIDENCIA = :pl_nro_incidencia);
	
		IF SQLCA.SQLCode < 0 THEN
			Return 0
		ELSE
			// GNU 14-2-2006. Mejora 1
			UPDATE SGD_INTERRUPCION_RS
			SET IND_OTRAS_INS= 0
			WHERE NRO_INCIDENCIA= :pl_nro_incidencia AND
			    	NRO_INSTALACION= (SELECT NRO_INST_AFECTADA 
				 							FROM SGD_INCIDENCIA 
											 WHERE NRO_INCIDENCIA = :pl_nro_incidencia);
	 		IF SQLCA.SQLCode < 0 THEN
				return 0
			END IF	
		END IF
	// FIN GNU											 
	END IF
	
	return 1
END IF

end function

public function integer wf_desagrupar_maniobras (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_maniobras
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que desagrupa las maniobras de la incidencia que se desea desagrupar de las
//				 maniobras de la agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias. En el caso de que la incidencia que 
//				 se desea desagrupar tuviera maniobras hay que reasignarlas a esta incidencia, 
//				 cambiando su n$$HEX1$$fa00$$ENDHEX$$mero de incidencia, adem$$HEX1$$e100$$ENDHEX$$s de cambiar los c$$HEX1$$f300$$ENDHEX$$digos de maniobra.
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada: pl_nro_incidencia --> N$$HEX1$$fa00$$ENDHEX$$mero de la incidencia a desagrupar
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 23/11/2001	         LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
long ll_cod_maniobra, ll_cod_maniobra_nuevo
int li_retorno = 1

SetPointer(Hourglass!)

ll_cod_maniobra_nuevo = pl_nro_incidencia * 1000 + 1

// Este cursor trae todas las maniobras de la incidencia que se desea desagrupar
DECLARE lc_maniobras CURSOR FOR
	SELECT COD_MANIOBRA
	FROM SGD_MANIOBRA 
	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
		AND ORDEN_AGRUPACION IN (SELECT ORDEN_AGRUPACION
										 FROM GI_SEGUIMIENTO_AGRUPACION
										 WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
										 		 NRO_INCIDENCIA = :pl_nro_incidencia);
										 
IF ib_contenedora_reenganche THEN
	// Si la incidencia agrupada es un reenganche la desagrupaci$$HEX1$$f300$$ENDHEX$$n se realiza en la
	// siguiente funci$$HEX1$$f300$$ENDHEX$$n
	li_retorno = wf_desagrupar_maniobras_reenganche(pl_nro_incidencia)
ELSE
	OPEN lc_maniobras;
	
	IF SQLCA.SQLCode <> 0 THEN
		li_retorno = 0 
	ELSE
		FETCH lc_maniobras
		INTO :ll_cod_maniobra;
		
		DO WHILE SQLCA.SQLCode = 0 AND li_retorno <> 0 
			
			// Se actualizan las maniobras de las interrupciones de la incidencia que se desea
			// desagrupar
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
				PROGRAMA = 'W_DESAGRUP',
				USUARIO = :gs_usuario
				WHERE MANIOBRA_APERT_FASE_A = :ll_cod_maniobra OR
						MANIOBRA_APERT_FASE_B = :ll_cod_maniobra OR
						MANIOBRA_APERT_FASE_C = :ll_cod_maniobra OR
						MANIOBRA_APERTURA = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_A = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_B = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_C = :ll_cod_maniobra OR
						MANIOBRA_CIERRE = :ll_cod_maniobra; 
			
			IF SQLCA.SQLCode = 0 AND ii_estado_incid_agrup = fgci_incidencia_resuelta THEN
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
				PROGRAMA = 'W_DESAGRUP',
				USUARIO = :gs_usuario
				WHERE MANIOBRA_APERT_FASE_A = :ll_cod_maniobra OR
						MANIOBRA_APERT_FASE_B = :ll_cod_maniobra OR
						MANIOBRA_APERT_FASE_C = :ll_cod_maniobra OR
						MANIOBRA_APERTURA = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_A = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_B = :ll_cod_maniobra OR
						MANIOBRA_CIERRE_FASE_C = :ll_cod_maniobra OR
						MANIOBRA_CIERRE = :ll_cod_maniobra; 
				
			END IF
			
			IF SQLCA.SQLCode < 0 THEN
				// Se ha producido un error
				li_retorno = 0
			ELSE
				
				// Se procede a actualizar la maniobra de la incidencia que se desea desagrupar
				// con el nuevo codigo
				UPDATE SGD_MANIOBRA
				SET COD_MANIOBRA = :ll_cod_maniobra_nuevo,
					 NRO_INCIDENCIA = :pl_nro_incidencia,
					 ORDEN_AGRUPACION = (SELECT MAX(ORDEN_ANTIGUO)
	 											FROM GI_SEGUIMIENTO_AGRUPACION
												WHERE GI_SEGUIMIENTO_AGRUPACION.NRO_AGRUPACION = :il_nro_agrupacion and
														GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION = SGD_MANIOBRA.ORDEN_AGRUPACION)
				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
						AND COD_MANIOBRA = :ll_cod_maniobra;
						
				IF SQLCA.SQLCode < 0 THEN
					li_retorno = 0
				ELSE
					ll_cod_maniobra_nuevo ++
					FETCH lc_maniobras INTO :ll_cod_maniobra;
				END IF
			END IF
		LOOP
		
		CLOSE lc_maniobras;
		
		// Si se desagrupan maniobras de un reeganche se las cambia de tabla
//		IF cbx_reenganche.checked = TRUE THEN
//			INSERT INTO SGD_MANIOBRA_REENGANCHE
//			(SELECT * FROM SGD_MANIOBRA
//			 WHERE NRO_INCIDENCIA = :pl_nro_incidencia);
//			 
//			 IF SQLCA.SQLCode = 0 THEN
//				// Se borran de SGD_MANIOBRA
//				DELETE SGD_MANIOBRA
//				WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
//				
//				IF SQLCA.SQLCode <> 0 THEN
//					li_retorno = 0
//				END IF
//			ELSE
//				li_retorno = 0
//			END IF
//		END IF
	END IF
END IF

return li_retorno
end function

public function integer wf_desagrupar_avisos (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_avisos
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que se lleva los avisos asociados de la incidencia desagrupada de
//				 la agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias
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
// 23/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(Hourglass!)

UPDATE GI_AVISOS
SET NRO_INCIDENCIA = :pl_nro_incidencia,
	 USUARIO = :gs_usuario,
	 PROGRAMA = 'W_DESAGRUP',
	 ORDEN_AGRUPACION = (SELECT MAX(ORDEN_ANTIGUO)
	 							FROM GI_SEGUIMIENTO_AGRUPACION
								WHERE GI_SEGUIMIENTO_AGRUPACION.NRO_AGRUPACION = :il_nro_agrupacion and
										GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION = GI_AVISOS.ORDEN_AGRUPACION)
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
	AND ORDEN_AGRUPACION IN (SELECT ORDEN_AGRUPACION
									 FROM GI_SEGUIMIENTO_AGRUPACION
									 WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
									 		 NRO_INCIDENCIA = :pl_nro_incidencia);

IF SQLCA.SQLCode < 0 THEN
	return 0
ELSE
	return 1
END IF


end function

public function integer wf_analizar_nuevo_alcance (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_analizar_nuevo_alcance
//
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n comprueba si la incidencia agrupada cambia de alcance: de 
//				 incidencia con p$$HEX1$$e900$$ENDHEX$$rdida a incidencia sin p$$HEX1$$e900$$ENDHEX$$rdida. 
// 			 Este cambio en el alcance ocurrir$$HEX2$$e1002000$$ENDHEX$$s$$HEX1$$f300$$ENDHEX$$lo si la incidencia que se desagrupa es 
//				 una incidencia con p$$HEX1$$e900$$ENDHEX$$rdida y se lleva consigo todas las interrupciones de la 
//				 incidencia agrupada
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
// 26/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

int li_retorno = 1, li_alcance, li_estado
long ll_nro_int, ll_nro_int2
// GNU 15-2-2006. Mejora 1
long ll_nro_inst_afectada_orig, ll_nro_inst_afectada_orig_2, ll_nro_incidencia_2

SetPointer(Hourglass!)

IF dw_lista_incidencias.GetItemNumber(pi_fila, 'alcance') = fgci_incidencia_con_interrupcion THEN
	// La incidencia que se desagrupa es una incidencia con p$$HEX1$$e900$$ENDHEX$$rdida. 
	// Existe la posibilidad de que se lleve todas las interrupciones.
	SELECT COUNT(*)
	INTO :ll_nro_int
	FROM SGD_INTERRUPCION
	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
	
	IF SQLCA.SQLCode = 0 AND ii_estado_incid_agrup = fgci_incidencia_resuelta THEN
		SELECT COUNT(*)
		INTO :ll_nro_int2
		FROM SGD_INTERRUPCION_RS
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
		
		IF SQLCA.SQLCode = 0 THEN
			ll_nro_int += ll_nro_int2
		END IF
	END IF
	
	IF SQLCA.SQLCode = 0 AND ll_nro_int = 0 THEN
		// La incidencia agrupada no tiene interrupciones. Se comprueba cu$$HEX1$$e100$$ENDHEX$$l era su alcance
		// antes de realizar la agrupaci$$HEX1$$f300$$ENDHEX$$n, y si era sin p$$HEX1$$e900$$ENDHEX$$rdida, se le pondr$$HEX3$$e1002000e900$$ENDHEX$$ste.
		SELECT ALCANCE, EST_ACTUAL 
		INTO :li_alcance, :li_estado
		FROM GI_INCIDENCIA_AGRUPADA 
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
		
		IF SQLCA.SQLCode = 0 AND li_alcance = fgci_incidencia_sin_interrupcion THEN
			// GNU 15-2-2006. Mejora 1
			SELECT NRO_INST_AFECTADA 
			INTO :ll_nro_inst_afectada_orig
			FROM GI_INCIDENCIA_AGRUPADA 
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora AND
				NRO_AGRUPACION = :il_nro_agrupacion;
		ll_nro_inst_afectada_orig_2 = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_inst_afectada')
		ll_nro_incidencia_2 = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_incidencia')
			IF (ll_nro_inst_afectada_orig <> il_nro_inst_afectada) AND &
		            ( il_nro_inst_afectada = ll_nro_inst_afectada_orig_2) THEN
				 
			UPDATE SGD_INCIDENCIA
			SET NRO_INST_AFECTADA = :ll_nro_inst_afectada_orig
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;			

		END IF;
		// FIN GNU
				
			// Se le cambia de alcance a la incidencia
			UPDATE SGD_INCIDENCIA
			SET ALCANCE = :fgci_incidencia_sin_interrupcion,
				 EST_ACTUAL = DECODE(:ii_estado_incid_agrup, 
				 							:fgci_incidencia_servicio_repuesto, :fgci_incidencia_servicio_repuesto,
				 																			:li_estado)
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
			
			IF SQLCA.SQLCode <> 0 THEN
				li_retorno = 0
			ELSE
				// Se borra el posible estado ER de la incidencia contenedora
				DELETE SGD_ESTADO_OPER
				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
						AND COD_ESTADO = :fgci_incidencia_en_reposicion;
				
				// Se analiza el nuevo estado de la incidencia agrupada, ya que al llevarse
				// la otra incidencia las interrupciones, se tiene que cambiar el estado de la
				// incidencia sin p$$HEX1$$e900$$ENDHEX$$rdida al estado que ten$$HEX1$$ed00$$ENDHEX$$a antes.
				// Esto s$$HEX1$$f300$$ENDHEX$$lo ocurre con el estado SR
				IF li_estado = fgci_incidencia_servicio_repuesto AND &
					ii_estado_incid_agrup < fgci_incidencia_servicio_repuesto THEN

					INSERT INTO SGD_ESTADO_OPER
						(SELECT COD_ESTADO, 
								  USUARIO,
								  F_ACTUAL,
								  H_ACTUAL,
								  PROGRAMA,
								  OBSERVACION,
								  F_ALTA,
								  H_ALTA,
								  NRO_INCIDENCIA,
								  IND_ENV_MANT 
							FROM GI_ESTADO_OPER_DESAGRUP
						 WHERE NRO_INCIDENCIA = :il_incidencia_contenedora AND
								 NRO_AGRUPACION = :il_nro_agrupacion AND
								 COD_ESTADO = :fgci_incidencia_servicio_repuesto);
								 
					IF SQLCA.SQLCode <> 0 THEN
						li_retorno = 0
					ELSE
						ii_estado_incid_agrup = fgci_incidencia_servicio_repuesto
					END IF
				END IF
				
				IF li_retorno = 1 THEN
					ii_alcance_inc_contenedora = fgci_incidencia_sin_interrupcion
				END IF
			END IF
		END IF
	ELSE
		// GNU 15-2-2006. Mejora 1
		SELECT NRO_INST_AFECTADA 
		INTO :ll_nro_inst_afectada_orig
		FROM GI_INCIDENCIA_AGRUPADA 
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora AND
			NRO_AGRUPACION = :il_nro_agrupacion;
		
		ll_nro_inst_afectada_orig_2 = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_inst_afectada')
		ll_nro_incidencia_2 = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_incidencia')
//		SELECT NRO_INST_AFECTADA 
//		INTO :ll_nro_inst_afectada_orig_2
//		FROM GI_INCIDENCIA_AGRUPADA 
//		WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
//			NRO_AGRUPACION = :il_nro_agrupacion;
			
		IF (ll_nro_inst_afectada_orig <> il_nro_inst_afectada) AND &
		     ( il_nro_inst_afectada = ll_nro_inst_afectada_orig_2) THEN
			 SELECT NRO_INST_AFECTADA
			 INTO :ll_nro_inst_afectada_orig_2
			 FROM GI_INCIDENCIA_AGRUPADA
			 WHERE NRO_INCIDENCIA <> :ll_nro_incidencia_2 AND
			 	NRO_AGRUPACION = :il_nro_agrupacion AND
				 ALCANCE = :fgci_incidencia_con_interrupcion;
				 
			UPDATE SGD_INCIDENCIA
			SET NRO_INST_AFECTADA = :ll_nro_inst_afectada_orig_2
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
			
			UPDATE SGD_INTERRUPCION
			SET IND_OTRAS_INS = 0
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora AND
				NRO_INSTALACION= :ll_nro_inst_afectada_orig_2;
			
			UPDATE SGD_INTERRUPCION_RS
			SET IND_OTRAS_INS = 0
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora AND
				NRO_INSTALACION = :ll_nro_inst_afectada_orig_2;
		END IF;
		// FIN GNU
	END IF
END IF

return li_retorno

end function

public function integer wf_analizar_estado_er_sr (long pl_nro_incidencia, integer pi_estado);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_analizar_estado_er_sr
//
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n comprueba si cambia la fecha del estado ER en la incidencia 
//				 agrupada como consecuencia de la desagrupaci$$HEX1$$f300$$ENDHEX$$n. En el caso de que cambie
//				 se actualizar$$HEX2$$e1002000$$ENDHEX$$la fecha.
//				 Tambi$$HEX1$$e900$$ENDHEX$$n existe la posibilidad de que este estado pueda desaparecer de la 
//				 incidencia agrupada, en el caso de que las interrupciones resueltas se las
//				 lleve la incidencia desagrupada
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
// 23/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

DateTime ldt_f_alta,ldt_fecha1,ldt_fecha_rep_a,ldt_fecha_rep_b,ldt_fecha_rep_c,ldt_fecha_rep
long ll_nro_interr_pend, ll_nro_interr
int li_retorno = 1

SetPointer(Hourglass!)

//IF pi_estado > fgci_incidencia_enviado_brigada THEN
	// Se obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de interrupciones pendientes de la incidencia
	IF gb_red_trifasica = FALSE THEN
	
		SELECT NVL(Sum(DECODE(F_ALTA_FASE_A, NULL, 0, 1) +
					  DECODE(F_ALTA_FASE_B, NULL, 0, 1) +
					  DECODE(F_ALTA_FASE_C, NULL, 0, 1)) - 
				 Sum(DECODE(F_REPOSICION_FASE_A, NULL, 0, 1) +
					  DECODE(F_REPOSICION_FASE_B, NULL, 0, 1) +
					  DECODE(F_REPOSICION_FASE_C, NULL, 0, 1)),0)
		INTO :ll_nro_interr_pend
		FROM SGD_INTERRUPCION
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia
			AND ( (F_ALTA_FASE_A IS NOT NULL AND F_REPOSICION_FASE_A IS NULL)
				OR (F_ALTA_FASE_B IS NOT NULL AND F_REPOSICION_FASE_B IS NULL)
				OR (F_ALTA_FASE_C IS NOT NULL AND F_REPOSICION_FASE_C IS NULL) 
				OR (F_ALTA IS NOT NULL AND F_REPOSICION IS NULL));
				
	ELSE
		SELECT COUNT(*)
		INTO :ll_nro_interr_pend
		FROM SGD_INTERRUPCION
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia
			AND F_REPOSICION IS NULL;
				
	END IF
	// Se obtiene el n$$HEX1$$fa00$$ENDHEX$$mero total de interrupciones, la $$HEX1$$fa00$$ENDHEX$$ltima fecha de reposici$$HEX1$$f300$$ENDHEX$$n
	// y la m$$HEX1$$ed00$$ENDHEX$$nima de las fechas de reposici$$HEX1$$f300$$ENDHEX$$n.	
	
	IF gb_red_trifasica = FALSE THEN
		SELECT NVL(Sum(DECODE(F_ALTA_FASE_A, NULL, 0, 1) +
					  DECODE(F_ALTA_FASE_B, NULL, 0, 1) +
					  DECODE(F_ALTA_FASE_C, NULL, 0, 1)),0) , 
				 MAX(F_REPOSICION), 
				 NVL(MIN(F_REPOSICION_FASE_A),sysdate), 
				 NVL(MIN(F_REPOSICION_FASE_B),sysdate), 
				 NVL(MIN(F_REPOSICION_FASE_C),sysdate), 
				 NVL(MIN(F_REPOSICION),sysdate)
		INTO :ll_nro_interr, :ldt_fecha1,
			  :ldt_fecha_rep_a,
			  :ldt_fecha_rep_b,
			  :ldt_fecha_rep_c,
			  :ldt_fecha_rep
		FROM SGD_INTERRUPCION
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
		
	ELSE
		
		SELECT COUNT(*), 
				 MAX(F_REPOSICION), 
				 sysdate, 
				 sysdate, 
				 sysdate, 
				 NVL(MIN(F_REPOSICION),sysdate)
		INTO :ll_nro_interr, :ldt_fecha1,
			  :ldt_fecha_rep_a,
			  :ldt_fecha_rep_b,
			  :ldt_fecha_rep_c,
			  :ldt_fecha_rep
		FROM SGD_INTERRUPCION
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
		
	END IF
	// Nos quedamos con la m$$HEX1$$ed00$$ENDHEX$$nima fecha de reposici$$HEX1$$f300$$ENDHEX$$n
	IF ldt_fecha_rep > ldt_fecha_rep_a THEN
		ldt_fecha_rep = ldt_fecha_rep_a
	END IF
	IF ldt_fecha_rep > ldt_fecha_rep_b THEN
		ldt_fecha_rep = ldt_fecha_rep_b
	END IF
	IF ldt_fecha_rep > ldt_fecha_rep_c THEN
		ldt_fecha_rep = ldt_fecha_rep_c
	END IF

	IF SQLCA.SQLCode = 0 AND ll_nro_interr_pend > 0 AND ll_nro_interr > ll_nro_interr_pend THEN
		// Existen interrupciones pendientes y resueltas en la incidencia agrupada. 
		// La incidencia se queda en estado ER
		IF pi_estado <> fgci_incidencia_en_reposicion THEN
			// Se actualiza el estado de la incidencia agrupada
			DELETE SGD_ESTADO_OPER
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia
				AND COD_ESTADO > :fgci_incidencia_en_reposicion;
				
			IF SQLCA.SQLCode = 0 THEN
				IF pi_estado > fgci_incidencia_en_reposicion THEN
					// Se actualiza la fecha del estado ER de la incidencia.
					// $$HEX1$$c900$$ENDHEX$$sta ha podido cambiar como consecuencia del movimiento de interrupciones
					UPDATE SGD_ESTADO_OPER
					SET F_ALTA = :ldt_fecha_rep
					WHERE NRO_INCIDENCIA = :pl_nro_incidencia
						AND COD_ESTADO = :fgci_incidencia_en_reposicion;
				ELSE 
					// Se a$$HEX1$$f100$$ENDHEX$$ade el estado ER en la incidencia
					INSERT INTO SGD_ESTADO_OPER
					(COD_ESTADO,USUARIO,F_ACTUAL,PROGRAMA,OBSERVACION,F_ALTA,H_ALTA,NRO_INCIDENCIA)
					VALUES
					(:fgci_incidencia_en_reposicion, :gs_usuario, sysdate, 
					 'W_DESAGRUP', 'Estado actualizado desde Desagrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias', 
					 :ldt_fecha_rep, sysdate, :pl_nro_incidencia);
					 
					IF SQLCA.SQLCode = 0 AND pl_nro_incidencia = il_incidencia_contenedora THEN
						ii_estado_incid_agrup = fgci_incidencia_en_reposicion
					END IF
				END IF
					
				IF SQLCA.SQLCode = 0 THEN
					UPDATE SGD_INCIDENCIA
					SET EST_ACTUAL = (SELECT MAX(COD_ESTADO)
											FROM SGD_ESTADO_OPER
											WHERE NRO_INCIDENCIA = :pl_nro_incidencia),
						 PROGRAMA = 'W_DESAGRUP',
						 USUARIO = :gs_usuario
					WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
					
					IF SQLCA.SQLCode < 0 THEN
						li_retorno = 0
					END IF
				ELSE 
					li_retorno = 0
				END IF
			END IF
		END IF
		
	ELSE
		// No existen interrupciones pendientes en la incidencia agrupada o todas est$$HEX1$$e100$$ENDHEX$$n
		// pendientes de resolver.
		// La incidencia puede quedar en estado PT, EB, ER $$HEX2$$f3002000$$ENDHEX$$SR
		IF ll_nro_interr = 0 OR ll_nro_interr = ll_nro_interr_pend THEN
			// La incidencia no tiene interrupciones o todas est$$HEX1$$e100$$ENDHEX$$n pendientes.
			// Desaparece el estado ER, y en el caso de que lo tuviera desaparece tambi$$HEX1$$e900$$ENDHEX$$n el 
			// estado SR
			DELETE SGD_ESTADO_OPER
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia
				AND COD_ESTADO > :fgci_incidencia_enviado_brigada;
				
			IF SQLCA.SQLCode = 0 THEN
				UPDATE SGD_INCIDENCIA
				SET EST_ACTUAL = (SELECT MAX(COD_ESTADO)
										FROM SGD_ESTADO_OPER
										WHERE NRO_INCIDENCIA = :pl_nro_incidencia),
					 PROGRAMA = 'W_DESAGRUP',
					 USUARIO = :gs_usuario
				WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
				
				IF SQLCA.SQLCode <> 0 THEN
					li_retorno = 0
				END IF
			ELSE
				li_retorno = 0
			END IF
		ELSE
			// La incidencia tiene todas sus interrupciones cerradas.
			// La incidencia agrupada se encuentra en estado SR
			IF pi_estado < fgci_incidencia_servicio_repuesto AND NOT IsNull(ldt_fecha1) THEN
				// Hay que a$$HEX1$$f100$$ENDHEX$$adir el estado SR en SGD_ESTADO_OPER y actualizar la incidencia
				// en SGD_INCIDENCIA
				INSERT INTO SGD_ESTADO_OPER
				(COD_ESTADO,USUARIO,F_ACTUAL,PROGRAMA,OBSERVACION,F_ALTA,H_ALTA,NRO_INCIDENCIA)
				VALUES
				(:fgci_incidencia_servicio_repuesto, :gs_usuario, sysdate, 
				 'W_DESAGRUP', 'Estado actualizado desde Desagrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias', 
				 :ldt_fecha1, sysdate, :pl_nro_incidencia);
				 
				IF SQLCA.SQLCode = 0 AND pl_nro_incidencia = il_incidencia_contenedora THEN
					ii_estado_incid_agrup = fgci_incidencia_servicio_repuesto
				END IF
				
				IF SQLCA.SQLCode = 0 THEN
					IF pi_Estado >= fgci_incidencia_en_reposicion THEN
						// Se actualiza la fecha del estado ER de la incidencia 
						// $$HEX1$$c900$$ENDHEX$$sta ha podido cambiar como consecuencia del movimiento de interrupciones
						UPDATE SGD_ESTADO_OPER
						SET F_ALTA = :ldt_fecha_rep
						WHERE NRO_INCIDENCIA = :pl_nro_incidencia
							AND COD_ESTADO = :fgci_incidencia_en_reposicion;
					
					ELSE
						// Se a$$HEX1$$f100$$ENDHEX$$ade el estado ER
						INSERT INTO SGD_ESTADO_OPER
						(COD_ESTADO,USUARIO,F_ACTUAL,PROGRAMA,OBSERVACION,F_ALTA,H_ALTA,NRO_INCIDENCIA)
						VALUES
						(:fgci_incidencia_en_reposicion, :gs_usuario, sysdate, 
						 'W_DESAGRUP', 'Estado actualizado desde Desagrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias', 
						 :ldt_fecha_rep, sysdate, :pl_nro_incidencia);
						 
						IF SQLCA.SQLCode = 0 AND pl_nro_incidencia = il_incidencia_contenedora THEN
							ii_estado_incid_agrup = fgci_incidencia_en_reposicion
						END IF

					END IF

					IF SQLCA.SQLCode = 0 THEN	
						// Se actualiza el estado de la incidencia en SGD_INCIDENCIA
						UPDATE SGD_INCIDENCIA
							SET EST_ACTUAL = :fgci_incidencia_servicio_repuesto,
								 PROGRAMA = 'W_DESAGRUP',
								USUARIO = :gs_usuario
							WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
							
						IF SQLCA.SQLCode <> 0 THEN
							li_retorno = 0
						END IF
					ELSE
						li_retorno = 0
					END IF
				ELSE 
					li_retorno = 0
				END IF

			END IF
		END IF
		
	END IF
//END IF	

Return li_retorno


end function

public function integer wf_analizar_estado_incid_desagrup (integer pi_fila);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_analizar_estado_incid_desagrup
//
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n comprueba si la incidencia desagrupada cambia de estado como
//				 consecuencia de la resoluci$$HEX1$$f300$$ENDHEX$$n de sus interrupciones en la incidencia agrupada.
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
// 26/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

int li_estado 
long ll_nro_incidencia

SetPointer(Hourglass!)

IF ii_estado_incid_agrup = fgci_incidencia_resuelta THEN
	return 1
ELSE
	ll_nro_incidencia = dw_lista_incidencias.GetItemNumber(pi_fila, 'nro_incidencia')
	li_estado = dw_lista_incidencias.GetItemNumber(pi_fila, 'gi_incidencia_agrupada_est_actual')
	
	return wf_analizar_estado_er_sr(ll_nro_incidencia, li_estado)
END IF
end function

public function integer wf_desagrupar_maniobras_reenganche (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_maniobras_reenganche
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que desagrupa las maniobras del reenganche que se desea desagrupar de las
//				 maniobras de la agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias. 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada: pl_nro_incidencia --> N$$HEX1$$fa00$$ENDHEX$$mero de la incidencia a desagrupar
//
//    Salida:  1  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n correcta
//					0  -->  ejecuci$$HEX1$$f300$$ENDHEX$$n err$$HEX1$$f300$$ENDHEX$$nea
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 26/11/2001	         LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
long ll_cod_maniobra, ll_cod_maniobra_nuevo
int li_retorno = 1

//ll_cod_maniobra_nuevo = pl_nro_incidencia * 100 + 1
//
//// La incidencia contenedora es un reenganche. Con este cursor se traen las maniobras de la
//// incidencia que se desea desagrupar
//DECLARE lc_maniobras CURSOR FOR
//SELECT COD_MANIOBRA
//FROM SGD_MANIOBRA_REEGANCHE 
//WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
//	AND ORDEN_AGRUPACION = :il_orden_incidencia;
//
//OPEN lc_maniobras;
//
//IF SQLCA.SQLCode <> 0 THEN
//	li_retorno = 0 
//ELSE
//	FETCH lc_maniobras
//	INTO :ll_cod_maniobra;
//		
//	DO WHILE SQLCA.SQLCode = 0 AND li_retorno <> 0 
//		// Se procede a actualizar la maniobra de la incidencia que se desea desagrupar
//		// con el nuevo codigo
//		UPDATE SGD_MANIOBRA_REENGANCHE
//		SET COD_MANIOBRA = :ll_cod_maniobra_nuevo,
//			 NRO_INCIDENCIA = :pl_nro_incidencia,
//			 ORDEN_AGRUPACION = :il_orden_antiguo
//		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
//				AND COD_MANIOBRA = :ll_cod_maniobra;
//				
//		IF SQLCA.SQLCode < 0 THEN
//			li_retorno = 0
//		ELSE
//			ll_cod_maniobra_nuevo ++
//			FETCH lc_maniobras INTO :ll_cod_maniobra;
//		END IF
//	LOOP
//	
//	CLOSE lc_maniobras;
//END IF
//
return li_retorno
end function

public function integer wf_borrar_incidencia_agrupacion (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_borrar_incidencia_agrupacion
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que borra la incidencia desagrupada de la tabla 
//  			 GI_SEGUIMIENTO_AGRUPACION
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
// 23/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
int li_retorno = 1
Boolean lb_desagrupar_reengache = FALSE

SetPointer(Hourglass!)

DELETE GI_SEGUIMIENTO_AGRUPACION
WHERE NRO_INCIDENCIA = :pl_nro_incidencia
	AND NRO_AGRUPACION = :il_nro_agrupacion;
		
IF SQLCA.SQLCode < 0 THEN
	li_retorno = 0
END IF

return li_retorno

end function

public function integer wf_deshacer_agrupacion ();///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_deshacer_agrupacion
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que comprueba cu$$HEX1$$e100$$ENDHEX$$ntas incidencias quedan en la agrupaci$$HEX1$$f300$$ENDHEX$$n de 
//				 incidencias. En el caso de que quede una se deshace la agrupaci$$HEX1$$f300$$ENDHEX$$n de 
//				 manera completa
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
// 26/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

int li_retorno = 1
int li_estado
long ll_cantidad
DateTime ldt_f_alta

SetPointer(Hourglass!)

SELECT COUNT(DISTINCT(NRO_INCIDENCIA))
INTO :ll_cantidad
FROM GI_SEGUIMIENTO_AGRUPACION
WHERE NRO_AGRUPACION = :il_nro_agrupacion;

IF SQLCA.SQLCode = 0 THEN
	IF ll_cantidad < 1 THEN
		// Se deshace la agrupaci$$HEX1$$f300$$ENDHEX$$n
		// Se comprueba si la agrupaci$$HEX1$$f300$$ENDHEX$$n se ha dado sobre un reenganche
//		IF ib_contenedora_reenganche THEN
//			// Se ha desagrupado un reenganche
//			DELETE GI_REENGANCHE_AGRUPADO
//			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
//			
//			// Se elimina el nro de agrupaci$$HEX1$$f300$$ENDHEX$$n de la incidencia
//			IF SQLCA.SQLCode = 0 THEN
//				UPDATE SGD_INCIDENCIA_REENGANCHE
//				SET NRO_AGRUPACION = NULL 
//				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
//				
//				IF SQLCA.SQLCode < 0 THEN
//					li_retorno = 0
//				END IF
//			ELSE
//				li_retorno = 0
//			END IF
//	
//		ELSE
			// Se elimina la incidencia de GI_INCIDENCIA_AGRUPADA
			DELETE GI_INCIDENCIA_AGRUPADA
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
					AND NRO_AGRUPACION = :il_nro_agrupacion;
			
			IF SQLCA.SQLCode = 0 THEN
				// Se elimina el nro de agrupaci$$HEX1$$f300$$ENDHEX$$n de la incidencia
				UPDATE SGD_INCIDENCIA
				SET NRO_AGRUPACION = NULL 
				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
				
				IF SQLCA.SQLCode = 0 THEN
					// Se actualizan las fechas de los estados, y se ponen las antiguas que
					// existan
					li_estado = fgci_incidencia_pendiente

					DO WHILE li_estado <= fgci_incidencia_servicio_repuesto 
						SELECT F_ALTA
						INTO :ldt_f_alta
						FROM GI_ESTADO_OPER_DESAGRUP 
						WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
								AND COD_ESTADO = :li_estado;
								
						IF SQLCA.SQLCode = 0 THEN
							UPDATE SGD_ESTADO_OPER
							SET F_ALTA = :ldt_f_alta
							WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
									AND COD_ESTADO = :li_estado;
						
						END IF
						
						li_estado ++
					LOOP
					
					// Se eliminan los estados de la incidencia de GI_ESTADO_OPER_DESAGRUP
					DELETE GI_ESTADO_OPER_DESAGRUP
					WHERE NRO_INCIDENCIA = :il_incidencia_contenedora AND
							NRO_AGRUPACION = :il_nro_agrupacion;
	
					IF SQLCA.SQLCode < 0 THEN
						li_retorno = 0
					END IF
				ELSE
					li_retorno = 0
				END IF
			ELSE
				li_retorno = 0
			END IF
		//END IF
	END IF
END IF

IF li_retorno > 0 THEN
	// Se borra la incidencia desagrupada de la tabla GI_SEGUIMIENTO_AGRUPACION
	li_retorno = wf_borrar_incidencia_agrupacion(il_incidencia_contenedora)
END IF

return li_retorno
end function

public function integer wf_analizar_estado_eb ();///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_analizar_estado_eb
//
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n comprueba cuando la incidencia agrupada tiene OT pero no estado EB, 
//				 si como consecuencia de la desagrupaci$$HEX1$$f300$$ENDHEX$$n se tiene que a$$HEX1$$f100$$ENDHEX$$adir el estado EB, 
//				 en el caso de que la incidencia contenedora lo tuviera en su origen.
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
Boolean lb_insertar_eb = FALSE
Datetime ldt_f_alta, ldt_fecha_eb

SetPointer(Hourglass!)

IF ib_existe_eb = FALSE THEN
	SELECT F_ALTA
	INTO :ldt_fecha_eb
	FROM GI_ESTADO_OPER_DESAGRUP
	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
			AND COD_ESTADO = :fgci_incidencia_enviado_brigada
			AND NRO_AGRUPACION = :il_nro_agrupacion;
			
	IF SQLCA.SQLCode = 0 THEN
		// Anteriormente exist$$HEX1$$ed00$$ENDHEX$$a el estado EB
		// Hay que comprobar si las fechas de las posibles interrupciones permiten a$$HEX1$$f100$$ENDHEX$$adirlo
		IF ii_alcance_inc_contenedora = fgci_incidencia_sin_interrupcion THEN
			// Como la incidencia agrupada es sin p$$HEX1$$e900$$ENDHEX$$rdida se a$$HEX1$$f100$$ENDHEX$$ade el estado EB
			lb_insertar_eb = TRUE
		ELSE
			SELECT MIN(F_ALTA)
			INTO :ldt_f_alta
			FROM SGD_INTERRUPCION
			WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
			
			IF NOT IsNull(ldt_f_alta) THEN
				IF ldt_fecha_eb <= ldt_f_alta THEN
					// No existe ninguna interrupci$$HEX1$$f300$$ENDHEX$$n con fecha menor a la fecha de EB.
					// Se a$$HEX1$$f100$$ENDHEX$$ade este estado a la incidencia.
					lb_insertar_eb = TRUE
				END IF
			ELSE
				// No existen interrupciones, luego se a$$HEX1$$f100$$ENDHEX$$ade este estado.
				lb_insertar_eb = TRUE
			END IF
			
		END IF
	END IF
END IF

IF lb_insertar_eb THEN
	// Se a$$HEX1$$f100$$ENDHEX$$ade el antiguo estado EB
	INSERT INTO SGD_ESTADO_OPER
		(SELECT COD_ESTADO, 
				  USUARIO,
				  F_ACTUAL,
				  H_ACTUAL,
				  PROGRAMA,
				  OBSERVACION,
				  F_ALTA,
				  H_ALTA,
				  NRO_INCIDENCIA,
				  IND_ENV_MANT 
			FROM GI_ESTADO_OPER_DESAGRUP
		 WHERE NRO_INCIDENCIA = :il_incidencia_contenedora AND
				 NRO_AGRUPACION = :il_nro_agrupacion AND
				 COD_ESTADO = :fgci_incidencia_enviado_brigada);
				 
	IF SQLCA.SQLCode <> 0 THEN
		li_retorno = 0 
	ELSE
		ib_existe_eb = TRUE
	END IF
END IF

return li_retorno



end function

public function boolean wf_incidencia_de_operaciones (long pl_nro_incidencia);int li_estado_red, li_tipo_instalacion, li_tension, li_est_actual, li_tip_incidencia
int li_alcance
long ll_cant_maniobras, ll_cant_int, ll_nro_instalacion

////////////////////////////////////////////////////////////////////////////////////
// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
SELECT NVL(ESTADO_RED,0), NRO_INST_AFECTADA, TIP_TENSION, EST_ACTUAL, TIP_INCIDENCIA,
		 ALCANCE
INTO :li_estado_red, :ll_nro_instalacion, :li_tension, :li_est_actual, :li_tip_incidencia,
	  :li_alcance
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCode = 0 AND li_estado_red = -10 Then return false
/////////////////////////////////////////////////////////////////////

IF IsNull(ll_nro_instalacion) THEN 
	RETURN False
END IF
	
SELECT TIPO_INSTALACION
INTO :li_tipo_instalacion
FROM SGD_INSTALACION 
WHERE NRO_INSTALACION = :ll_nro_instalacion
		AND BDI_JOB = 0;
			
IF SQLCA.SQLCode <> 0 THEN
	return TRUE
END IF

IF gb_operaciones = TRUE AND &
	li_tension <= gi_tension_nivel_min THEN
	
	IF gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion = fgci_tipo_ct THEN
		IF li_est_actual > fgci_incidencia_pendiente OR li_tip_incidencia <> fgci_incidencia_programada THEN
			// Como la instalaci$$HEX1$$f300$$ENDHEX$$n afectada es un CT se comprueba si existen maniobras.
			// En caso de que existan la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n
			SELECT COUNT(*)
			INTO :ll_cant_maniobras
			FROM SGD_MANIOBRA
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
		
			IF SQLCA.SQLCode = 0 THEN
				Return ll_cant_maniobras > 0 
			ELSE
				Return FALSE
			END IF
			
		ELSE
			// Incidencia programada en estado pendiente cuya instalaci$$HEX1$$f300$$ENDHEX$$n afectada es un CT. 
			// Hay que comprobar si se han definido interrupciones  y el nivel de tensi$$HEX1$$f300$$ENDHEX$$n de 
			// $$HEX1$$e900$$ENDHEX$$stas.
			IF  li_alcance = fgci_incidencia_sin_interrupcion THEN
				return TRUE
			ELSE
				SELECT COUNT(SGD_INTERRUPCION_DESCARGO.COD_INSTALACION) 
				INTO :ll_cant_int
				FROM SGD_INTERRUPCION_DESCARGO, SGD_DESCARGOS, SGD_INSTALACION
				WHERE SGD_DESCARGOS.NRO_INCIDENCIA = :pl_nro_incidencia	AND
						SGD_DESCARGOS.NRO_DESCARGO = SGD_INTERRUPCION_DESCARGO.NRO_DESCARGO AND
						SGD_INTERRUPCION_DESCARGO.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION AND
						SGD_INSTALACION.BDI_JOB = 0 AND
						SGD_INSTALACION.TENSION <= :gi_tension_nivel_min;
				
				IF SQLCA.SQLCode = 0 THEN
					return ll_cant_int > 0
				ELSE
					return False
				END IF
			END IF
		END IF

	ELSEIF gi_tension_nivel_min = fgci_alta_tension AND li_tipo_instalacion = fgci_tipo_subestacion THEN
		return FALSE
		
	ELSE
		return TRUE
	END IF
	
ELSE
	Return FALSE
END IF

end function

public function integer wf_analizar_estado_pt (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_analizar_estado_pt
//
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n comprueba si cambia la fecha del estado PT en la incidencia 
//				 agrupada como consecuencia de la desagrupaci$$HEX1$$f300$$ENDHEX$$n. En el caso de que cambie
//				 se actualizar$$HEX2$$e1002000$$ENDHEX$$la fecha de pendiente. Este cambio se debe a que la incidencia
//				 que se desagrupa puede ser la que haya proporcionado la fecha del estado PT
//				 de la incidencia agrupada. En este caso se debe coger la m$$HEX1$$ed00$$ENDHEX$$nima de las fechas
//				 de PT de las incidencias que quedan en la agrupaci$$HEX1$$f300$$ENDHEX$$n
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
Datetime ldt_fecha_pt1, ldt_fecha_pt2, ldt_fecha_pt3

SetPointer(Hourglass!)

// Se obtiene la fecha de PT de la incidencia que se desea desagrupar
//IF cbx_reenganche.checked THEN
//	// La incidencia desagrupada es un reenganche
//	SELECT F_ALTA
//	INTO :ldt_fecha_pt1
//	FROM SGD_INCIDENCIA_REENGANCHE
//	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
//ELSE
	// La incidencia agrupada es una incidencia normal
	SELECT F_ALTA
	INTO :ldt_fecha_pt1
	FROM SGD_ESTADO_OPER
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia
		AND COD_ESTADO = :fgci_incidencia_pendiente;
//END IF
	
IF SQLCA.SQLCode <> 0 THEN
	li_retorno = 0
ELSE
	
//	// Se obtiene la fecha de PT de la incidencia agrupada para compararla con la fecha de
//	// la incidencia que se desagrupa
//	IF ib_contenedora_reenganche THEN
//		// La incidencia agrupada es un reenganche
//		SELECT F_ALTA
//		INTO :ldt_fecha_pt2
//		FROM SGD_INCIDENCIA_REENGANCHE
//		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
//	ELSE
		SELECT F_ALTA
		INTO :ldt_fecha_pt2
		FROM SGD_ESTADO_OPER
		WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
			AND COD_ESTADO = :fgci_incidencia_pendiente;
	//END IF	

	IF ldt_fecha_pt1 = ldt_fecha_pt2 THEN
		// La incidencia desagrupada es la que ha aportado la fecha de pendiente.
		// Hay que obtener la nueva fecha de pendiente de la agrupacion
		// La nueva fecha de PT la m$$HEX1$$ed00$$ENDHEX$$nima fecha de PT de GI_ESTADO_OPER_DESAGRUP y de 
		// GI_REENGANCHE_AGRUPADO
		SELECT MIN(F_ALTA)
		INTO :ldt_fecha_pt1
		FROM GI_ESTADO_OPER_DESAGRUP, (SELECT NRO_INCIDENCIA
												 FROM GI_INCIDENCIA_AGRUPADA
												 WHERE NRO_AGRUPACION = :il_nro_agrupacion) A 
			WHERE COD_ESTADO = :fgci_incidencia_pendiente
				AND A.NRO_INCIDENCIA = GI_ESTADO_OPER_DESAGRUP.NRO_INCIDENCIA
				AND GI_ESTADO_OPER_DESAGRUP.NRO_INCIDENCIA <> :pl_nro_incidencia
				AND GI_ESTADO_OPER_DESAGRUP.NRO_AGRUPACION = :il_nro_agrupacion;
			
		IF SQLCA.SQLCode < 0 THEN
			li_retorno = 0
		ELSEIF SQLCA.SQLCode = 0 THEN
//			SELECT MIN(F_ALTA)
//			INTO :ldt_fecha_pt3
//			FROM GI_REENGANCHE_AGRUPADO
//			WHERE NRO_AGRUPACION = :il_nro_agrupacion 
//				AND NRO_INCIDENCIA <> :pl_nro_incidencia;
//
//			IF SQLCA.SQLCode = 0 THEN
//				IF ldt_fecha_pt3 < ldt_fecha_pt1 THEN
//					// Es un reeganche quien aporta la fecha m$$HEX1$$ed00$$ENDHEX$$nima
//					ldt_fecha_pt1 = ldt_fecha_pt3
//				END IF
//			END IF
//
			// Se actualiza la fecha de PT en la tabla que corresponda			
//			IF ib_contenedora_reenganche THEN
//				UPDATE SGD_INCIDENCIA_REENGANCHE
//				SET F_ALTA = :ldt_fecha_pt1
//				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
//			ELSE
				UPDATE SGD_INCIDENCIA
				SET F_DETECCION = :ldt_fecha_pt1
				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
//			END IF
			
			IF SQLCA.SQLCode <> 0 THEN
				li_retorno = 0
			ELSEIF ib_contenedora_reenganche = FALSE THEN
				// Si la incidencia agrupada no es un reenganche, se actualiza la fecha de PT
				// en SGD_ESTADO_OPER
				UPDATE SGD_ESTADO_OPER
				SET F_ALTA = :ldt_fecha_pt1
				WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
					AND COD_ESTADO = :fgci_incidencia_pendiente;

				IF SQLCA.SQLCode <> 0 THEN
					li_retorno = 0
				END IF
			END IF
		END IF
	END IF
END IF

return li_retorno

end function

public function integer wf_desagrupar_seguimiento (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_seguimiento
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que mueve los estados de la incidencia que se desea desagrupar de 
//				la tabla GI_ESTADO_OPER_DESAGRUP A SGD_ESTADO_OPER.
//				Una vez movidos los registros $$HEX1$$e900$$ENDHEX$$stos se borran de la tabla GI_ESTADO_OPER_DESAGRUP
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
// 23/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
int li_retorno = 1

SetPointer(Hourglass!)

INSERT INTO SGD_ESTADO_OPER
		(SELECT COD_ESTADO, 
				  USUARIO,
				  F_ACTUAL,
				  H_ACTUAL,
				  PROGRAMA,
				  OBSERVACION,
				  F_ALTA,
				  H_ALTA,
				  NRO_INCIDENCIA,
				  IND_ENV_MANT 
			FROM GI_ESTADO_OPER_DESAGRUP
		 WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
		 		 NRO_AGRUPACION = :il_nro_agrupacion);
		 
IF SQLCA.SQLCode <> 0 THEN
	li_retorno = 0
ELSE
	DELETE GI_ESTADO_OPER_DESAGRUP
   WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
			NRO_AGRUPACION = :il_nro_agrupacion;
	
	IF SQLCA.SQLCode <> 0 THEN
		li_retorno = 0
	END IF
END IF
	
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

SELECT F_ACTUAL
INTO :ldt_f_actual
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCode = 0 THEN
	IF ldt_f_actual <> idt_f_actual THEN
		Return TRUE
	ELSE
		Return FALSE
	END IF
ELSE
	return TRUE
END IF
end function

public function integer wf_analizar_estado_er_sr_rs (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_analizar_estado_er_sr_rs
//
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n actualiza la fecha de los estado ER, SR y RS
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
// 23/11/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
Datetime ldt_f_rep, ldt_rep_fase_a, ldt_rep_fase_b, ldt_rep_fase_c, ldt_max_f_rep, ldt_min_f_rep, &
			ldt_max_f_resolucion
int li_retorno = 1

SetPointer(Hourglass!)

SELECT MAX(FEC_RESOLUCION)
INTO :ldt_max_f_resolucion
FROM GI_INCIDENCIA_AGRUPADA
WHERE NRO_AGRUPACION = :il_nro_agrupacion;

IF SQLCA.SQLCode <> 0 THEN 
	li_retorno = 0 
ELSE

	SELECT MAX(F_REPOSICION),
			 MIN(F_REPOSICION),
			 NVL(MIN(F_REPOSICION_FASE_A),SYSDATE),
			 NVL(MIN(F_REPOSICION_FASE_A),SYSDATE),
			 NVL(MIN(F_REPOSICION_FASE_A),SYSDATE)
	INTO :ldt_max_f_rep,
		  :ldt_f_rep,
		  :ldt_rep_fase_a,
		  :ldt_rep_fase_b,
		  :ldt_rep_fase_c
	FROM (SELECT F_REPOSICION, F_REPOSICION_FASE_A, F_REPOSICION_FASE_B, F_REPOSICION_FASE_C
			FROM SGD_INTERRUPCION
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia
			UNION
			SELECT F_REPOSICION, F_REPOSICION_FASE_A, F_REPOSICION_FASE_B, F_REPOSICION_FASE_C
			FROM SGD_INTERRUPCION_RS
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia);
	
	IF SQLCA.SQLCode < 0 THEN
		li_retorno = 0
	END IF
END IF

IF li_retorno <> 0 THEN
	IF gb_red_trifasica = FALSE THEN
		IF ldt_rep_fase_a < ldt_rep_fase_b THEN
			IF ldt_rep_fase_a < ldt_rep_fase_c THEN
				ldt_min_f_rep = ldt_rep_fase_a
			ELSE
				ldt_min_f_rep = ldt_rep_fase_c
			END IF
		ELSE
			IF ldt_rep_fase_b < ldt_rep_fase_c THEN
				ldt_min_f_rep = ldt_rep_fase_b
			ELSE
				ldt_min_f_rep = ldt_rep_fase_c
			END IF
		END IF
	ELSE
		ldt_min_f_rep = ldt_f_rep
	END IF
	
	UPDATE SGD_ESTADO_OPER
	SET F_ALTA = (DECODE(COD_ESTADO, :fgci_incidencia_en_reposicion, 		:ldt_min_f_rep,
												:fgci_incidencia_servicio_repuesto, :ldt_max_f_rep,
												:fgci_incidencia_resuelta, 			:ldt_max_f_resolucion,
																								F_ALTA))
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
	IF SQLCA.SQLCode <> 0 THEN
		li_retorno = 0
	END IF
END IF

return li_retorno
end function

public function integer wf_desagrupar_indisponibilidades (long pl_nro_incidencia);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_desagrupar_indisponibilidades
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que se lleva las indisponibilidades de la incidencia desagrupada de
//				 la agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias
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
// 23/11/2001	         LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(Hourglass!)

UPDATE SGD_INDISPONIBILIDAD
SET NRO_INCIDENCIA = :pl_nro_incidencia,
	 USUARIO = :gs_usuario,
	 PROGRAMA = 'W_DESAGRUP',
	 ORDEN_AGRUPACION = (SELECT MAX(ORDEN_ANTIGUO)
	 							FROM GI_SEGUIMIENTO_AGRUPACION
								WHERE GI_SEGUIMIENTO_AGRUPACION.NRO_AGRUPACION = :il_nro_agrupacion and
										GI_SEGUIMIENTO_AGRUPACION.ORDEN_AGRUPACION = SGD_INDISPONIBILIDAD.ORDEN_AGRUPACION)
WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
	AND ORDEN_AGRUPACION IN (SELECT ORDEN_AGRUPACION
									 FROM GI_SEGUIMIENTO_AGRUPACION
									 WHERE NRO_AGRUPACION = :il_nro_agrupacion AND
									 		 NRO_INCIDENCIA = :pl_nro_incidencia);

IF SQLCA.SQLCode < 0 THEN
	return 0
END IF
	return 1

end function

on w_desagrupacion_incidencias.create
int iCurrent
call super::create
this.uo_barra=create uo_barra
this.dw_1=create dw_1
this.cbx_reenganche=create cbx_reenganche
this.dw_lista_incidencias=create dw_lista_incidencias
this.cb_imprimir=create cb_imprimir
this.cb_desagrupar=create cb_desagrupar
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_barra
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cbx_reenganche
this.Control[iCurrent+4]=this.dw_lista_incidencias
this.Control[iCurrent+5]=this.cb_imprimir
this.Control[iCurrent+6]=this.cb_desagrupar
this.Control[iCurrent+7]=this.st_1
end on

on w_desagrupacion_incidencias.destroy
call super::destroy
destroy(this.uo_barra)
destroy(this.dw_1)
destroy(this.cbx_reenganche)
destroy(this.dw_lista_incidencias)
destroy(this.cb_imprimir)
destroy(this.cb_desagrupar)
destroy(this.st_1)
end on

event open;call super::open;int li_lock_status = 0
int li_existe_eb

dw_lista_incidencias.SetTransObject(SQLCA)

IF isvalid(This) THEN
	This.SetRedraw(False)
	This.Title = "OPEN SGI - Incidencias Agrupadas"
	
	il_incidencia_contenedora = gu_comunic.is_comunic.longval3
	il_nro_agrupacion = gu_comunic.is_comunic.longval4
	ii_estado_incid_agrup =gu_comunic.is_comunic.intval4
	//ib_contenedora_reenganche = (ii_estado_incid_agrup=fgci_incidencia_resuelta)

	IF gu_comunic.is_comunic.programa_llamante = 'w_2301' THEN
		cb_desagrupar.visible = False
		cb_imprimir.x = 1317
		ib_bloqueada_anterior = TRUE
	ELSE
		// Se bloquea la incidencia contenedora
		li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(il_incidencia_contenedora), fgci_bloqueo_incidencia, il_incidencia_contenedora)
	END IF
		
	IF li_lock_status <> 0 THEN
		ib_bloqueada_anterior = TRUE
		//This.visible = FALSE
		Close(This)
		Return
	END IF
	
	This.SetRedraw(True)
	
	dw_lista_incidencias.Retrieve(il_nro_agrupacion, il_incidencia_contenedora)

	// Se comprueba si la incidencia tiene estado EB
	SELECT COUNT(*)
	INTO :li_existe_eb
	FROM SGD_ESTADO_OPER
	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora
		AND COD_ESTADO = :fgci_incidencia_enviado_brigada;
		
	ib_existe_eb = (SQLCA.SQLCode = 0) AND (li_existe_eb > 0)
	
	// Se obtiene el alcance de la incidencia contenedora
	SELECT ALCANCE, F_ACTUAL, NRO_INST_AFECTADA, F_DETECCION, FEC_RESOLUCION
	INTO :ii_alcance_inc_contenedora, :idt_f_actual, :il_nro_inst_afectada, :idt_f_deteccion, :idt_f_resolucion
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :il_incidencia_contenedora;
	
	IF SQLCA.SQLCode <> 0 THEN
		Messagebox("Error", "No se ha podido determinar el alcance de la Incidencia Agrupada")
		Close(This)
		Return
	END IF
	
END IF

// Se inicializa la datawindow de impresi$$HEX1$$f300$$ENDHEX$$n
dw_1.modify("data_1.DataObject ='" + dw_lista_incidencias.DataObject + "'")

end event

event close;IF NOT ib_bloqueada_anterior THEN
	gnu_u_transaction.uf_commit(This, fgci_bloqueo_incidencia, il_incidencia_contenedora)
END IF
IF ib_desagrupado THEN 
	gu_comunic.is_comunic.programa_retorno = "w_agrup_incid"
ELSE
	gu_comunic.is_comunic.programa_retorno = ""
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_desagrupacion_incidencias
end type

type uo_barra from u_pr_gen_espera_act within w_desagrupacion_incidencias
boolean visible = false
integer x = 992
integer y = 544
integer taborder = 20
long backcolor = 79741120
end type

on uo_barra.destroy
call u_pr_gen_espera_act::destroy
end on

type dw_1 from datawindow within w_desagrupacion_incidencias
boolean visible = false
integer x = 183
integer y = 440
integer width = 494
integer height = 360
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_reenganche from checkbox within w_desagrupacion_incidencias
integer x = 2688
integer y = 36
integer width = 485
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
string text = "Reenganches"
end type

event clicked;
dw_lista_incidencias.DbCancel()
dw_lista_incidencias.Reset()

IF This.Checked = True THEN
	dw_lista_incidencias.dataobject = 'd_inc_2002_pr_lista_seleccion_reenganches'
ELSE
	dw_lista_incidencias.dataobject = 'd_inc_2002_pr_lista_seleccion_incidencia'
END IF

cb_desagrupar.enabled = False
dw_lista_incidencias.SetTransObject(SQLCA)
dw_lista_incidencias.Retrieve(il_nro_agrupacion)

	
end event

event constructor;This.visible = gb_scada AND ib_reenganche_visible


end event

type dw_lista_incidencias from u_inc_lista_seleccion_incidencia_agrup within w_desagrupacion_incidencias
integer x = 27
integer y = 212
integer width = 3141
integer height = 912
integer taborder = 20
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

event clicked;call super::clicked;IF row > 0 AND cb_desagrupar.visible THEN
	IF IsSelected(row) THEN
		this.selectrow(row,false)
	ELSE
		this.selectrow(row,true)
	END IF
	
	cb_desagrupar.enabled = This.GetSelectedRow(0) > 0
	
END IF

end event

type cb_imprimir from commandbutton within w_desagrupacion_incidencias
event ue_arch_imprimir ( )
integer x = 1609
integer y = 1184
integer width = 393
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type cb_desagrupar from commandbutton within w_desagrupacion_incidencias
integer x = 1079
integer y = 1184
integer width = 393
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Desagrupar"
boolean default = true
end type

event clicked;int li_retorno 

ib_desagrupado = TRUE

li_retorno = wf_desagrupar()
IF li_retorno = 0 THEN
	// Ya no quedan m$$HEX1$$e100$$ENDHEX$$s incidencias para desagrupar
	Parent.SetFocus()
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha deshecho la Agrupaci$$HEX1$$f300$$ENDHEX$$n de Incidencias debido a que no queda ninguna Incidencia~r~nen la Agrupaci$$HEX1$$f300$$ENDHEX$$n")
	Close(Parent)
ELSEIF li_retorno = -1 THEN
	Parent.SetFocus()
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede realizar la desagrupaci$$HEX1$$f300$$ENDHEX$$n porque la incidencia " + &
					String(il_incidencia_contenedora) + " ha sido modificada por~r~nSCADA")
	Close(Parent)
ELSE
	cb_desagrupar.enabled = False
END IF
end event

type st_1 from statictext within w_desagrupacion_incidencias
integer x = 27
integer y = 136
integer width = 3141
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
string text = "Incidencias que forman parte de la Agrupaci$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type


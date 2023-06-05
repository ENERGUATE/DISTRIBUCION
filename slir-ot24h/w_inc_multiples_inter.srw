HA$PBExportHeader$w_inc_multiples_inter.srw
$PBExportComments$Ventana de Interrupciones en grupo
forward
global type w_inc_multiples_inter from w_sgigenerica
end type
type dw_multiples_inter from u_inc_multiples_inter within w_inc_multiples_inter
end type
type st_1 from statictext within w_inc_multiples_inter
end type
type cb_marcar from commandbutton within w_inc_multiples_inter
end type
type cb_desmarcar from commandbutton within w_inc_multiples_inter
end type
type gb_1 from groupbox within w_inc_multiples_inter
end type
type rb_marcar from radiobutton within w_inc_multiples_inter
end type
type rb_resolver from radiobutton within w_inc_multiples_inter
end type
type cbx_misma_fecha from checkbox within w_inc_multiples_inter
end type
type cbx_fase_c from checkbox within w_inc_multiples_inter
end type
type cbx_fase_a from checkbox within w_inc_multiples_inter
end type
type cbx_fase_b from checkbox within w_inc_multiples_inter
end type
type dw_fechas_int from datawindow within w_inc_multiples_inter
end type
type gb_2 from groupbox within w_inc_multiples_inter
end type
type st_mensaje_espera from statictext within w_inc_multiples_inter
end type
end forward

global type w_inc_multiples_inter from w_sgigenerica
integer x = 9
integer y = 288
integer width = 3241
integer height = 1300
string title = "OPEN SGI - Marcar Interrupcion"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
string icon = "interrup.ico"
dw_multiples_inter dw_multiples_inter
st_1 st_1
cb_marcar cb_marcar
cb_desmarcar cb_desmarcar
gb_1 gb_1
rb_marcar rb_marcar
rb_resolver rb_resolver
cbx_misma_fecha cbx_misma_fecha
cbx_fase_c cbx_fase_c
cbx_fase_a cbx_fase_a
cbx_fase_b cbx_fase_b
dw_fechas_int dw_fechas_int
gb_2 gb_2
st_mensaje_espera st_mensaje_espera
end type
global w_inc_multiples_inter w_inc_multiples_inter

type variables
//datetime idt_inicio
//datetime idt_fin
Datetime idt_f_deteccion
Datetime idt_fecha_sr
Datetime idt_fecha_eb

DataStore ids_interrupcion
DataStore ids_inter_incidencia
DataStore ids_problemas

Integer ii_estado_incid
Integer ii_tipo_conexion
Integer ii_tipo_instalacion
Integer ii_tipo_ct

Long il_nro_incidencia
Long il_nro_inst_padre
Long il_ultima_fila = 0
Long il_fila

Boolean ib_hay_brig_disp
Boolean ib_hay_causa
Boolean ib_demarcar_a=False
Boolean ib_demarcar_b=False
Boolean ib_demarcar_c= False

w_2301_form_incidencia w_ventana_llamante

long il_inst_digit[]
end variables

forward prototypes
public function integer wf_comprobar_reapertura (datetime pdt_fecha_sr, ref long pl_tiempo)
public function boolean wf_validar_fechas_gen ()
public function string wf_valida_int_otras_inc (long pl_nro_instalacion)
public function boolean wf_comprobar_causa ()
public function boolean wf_validar_desmarcar_indiv (long pl_nro_instalacion, string ps_nom_instalacion)
public function integer wf_valida_primer_aviso ()
public function string wf_det_perdida_ct (string ps_fase_ent, integer pi_tipo_conexion, integer pi_tipo_ct)
public function boolean wf_validar_fechas_indiv (long pl_nro_instalacion, string ps_nom_instalacion, integer pi_tipo_conexion, integer pi_tipo_ct, integer pi_tipo_instalacion)
public function string wf_valida_cierre_interrupcion (ref string ps_mensaje, integer pi_tipo_conexion, integer pi_tipo_ct, integer pi_tipo_instalacion)
public function string wf_valida_int_cerradas_padre (ref string ps_mensaje, integer pi_tipo_conexion, integer pi_tipo_ct, integer pi_tipo_instalacion)
end prototypes

public function integer wf_comprobar_reapertura (datetime pdt_fecha_sr, ref long pl_tiempo);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_comprobar_reapertura
// 
// Objetivo: La incidencia se encuentra en estado SR. Hay que comprobar si se ha sobrepasado o no
// 			el tiempo 't' parametrizable para permitir reabrir la incidencia.
// 			Si se ha sobrepasado el tiempo 't' no se permite marcar m$$HEX1$$e100$$ENDHEX$$s interrupciones
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Double ld_minutos, ld_duracion
		

SELECT TO_NUMBER(VALOR)
INTO :ld_minutos
FROM SGD_VALOR
WHERE CODIF = 'REAP';

		
IF SQLCA.SQLCode <> 0 THEN
	// No se ha podido obtener el tiempo 't' parametrizable
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La incidencia no ha podido ser reabierta")
	//lb_permitir_interrupcion = False
	return -1
	
ELSE
	// Se comprueba si se est$$HEX2$$e1002000$$ENDHEX$$dentro del tiempo en el que se puede reabrir la
	// incidencia
	SELECT ( (:pdt_fecha_sr + (:ld_minutos/(24*60))) - sysdate) * 24 * 60
	INTO :ld_duracion
	FROM DUAL; 
	
	IF ld_duracion > 0 THEN
		// No se ha sobrepasado el tiempo 't' parametrizable. Se puede reabrir la incidencia
		//lb_permitir_interrupcion = true
		return 1 
	ELSE
		// Se ha sobrepasado el tiempo 't' parametrizable. No se puede reabrir la incidencia
		//lb_permitir_interrupcion = false
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido reabrir la incidencia debido a que se ha sobrepasado el tiempo de " + string(integer(ld_minutos)) + " minutos desde que la incidencia pas$$HEX2$$f3002000$$ENDHEX$$a SR")	
		pl_tiempo = long(ld_minutos)
		
		return 0
	END IF
	
END IF


end function

public function boolean wf_validar_fechas_gen ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_validar_fechas_gen
// 
// Objetivo:  Validaciones:
//		F_ALTA:
//		=======
//			- Fecha de alta anterior a la fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la incidencia 
//			- Fecha de alta posterior a la fecha actual 
//			- Alguna fecha no nula 
//			- Que ya exista una interrupci$$HEX1$$f300$$ENDHEX$$n una instalaci$$HEX1$$f300$$ENDHEX$$n de nivel superior en 
//			  misma fase 
//			- No puede haber ning$$HEX1$$fa00$$ENDHEX$$n padre con una interrupci$$HEX1$$f300$$ENDHEX$$n cerrada con fecha de resoluci$$HEX1$$f300$$ENDHEX$$n 
//  		  mayor que la fecha de alta de la nueva interrupci$$HEX1$$f300$$ENDHEX$$n 
//			- Que no se haya sobrepasado el tiempo de reapertura de incidencias en caso de estar
//			  en estado SR 
//			- Que ya exista una interrupci$$HEX1$$f300$$ENDHEX$$n en esa instalaci$$HEX1$$f300$$ENDHEX$$n en otra incidencia
//			- En caso de que la red sea monof$$HEX1$$e100$$ENDHEX$$sica, si la fecha nueva es menor que la fecha de 
// 		  alta, $$HEX1$$e900$$ENDHEX$$sta ser$$HEX2$$e1002000$$ENDHEX$$la nueva fecha de alta
//			- Nueva fecha de alta anterior a la anterior fecha de alta en caso de reapertura
//
//		F_REPOSICION:
//		=============
//			- Valido que la fecha sea mayor que la fecha de alta 
//			- La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n no puede ser mayor que la fecha actual 
//			- Valido que el estado de la incidencia >= EB para reponer 
//			- No debe existir una Instalaci$$HEX1$$f300$$ENDHEX$$n de nivel superior interrumpida 
//			- Fecha de reposici$$HEX1$$f300$$ENDHEX$$n sea mayor que la la fecha de Enviado Brigada 
//   		- No se pueden reponer todas las interrupciones sin haber seleccionado una causa
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Datetime ldt_f_alta_validar, ldt_f_rep_validar, ldt_f_nula, ldt_fecha
Integer li_fase_seleccionada, li_contador, li_ret, li_sel, li_i
String ls_fecha_alta, ls_fecha_rep, ls_mensaje, ls_fase_afectada, ls_texto_fase
Boolean lb_hay_error = FALSE, lb_continuar = true
Long ll_tiempo

dw_fechas_int.AcceptText()
// Comprobaciones generales 

// Se comprueba que exista alguna fecha no nula
IF IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_a")) AND &
	IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_b")) AND & 
	IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_c")) AND & 
	IsNull(dw_fechas_int.GetItemDateTime(1,"f_rep_fase_a")) AND &
	IsNull(dw_fechas_int.GetItemDateTime(1,"f_rep_fase_b")) AND & 
	IsNull(dw_fechas_int.GetItemDateTime(1,"f_rep_fase_c")) AND & 
	IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta")) AND & 
	IsNull(dw_fechas_int.GetItemDateTime(1,"f_reposicion")) THEN
	
	ls_mensaje = "No se han realizado modificaciones debido a que todas las fechas son nulas."
	lb_hay_error = TRUE
END IF

IF cbx_misma_fecha.checked AND &
	cbx_fase_a.checked = FALSE AND cbx_fase_b.checked = FALSE AND cbx_fase_c.checked = FALSE THEN
	
	ls_mensaje = "No se han realizado modificaciones debido a que no se ha seleccionado ninguna fase."
	lb_hay_error = TRUE
END IF

/////////////////////////////////////////////////
// VALIDACIONES GENERALES DE LA FECHA DE ALTA  //
/////////////////////////////////////////////////

// Se determinan las fases en las que se realiza la b$$HEX1$$fa00$$ENDHEX$$squeda
IF gb_red_trifasica THEN
	ls_fase_afectada = "111"
ELSE
	IF IsNull(dw_fechas_int.GetItemDatetime(1, "f_alta_fase_a")) THEN
		ls_fase_afectada = '0'
	ELSE
		ls_fase_afectada = '1'
	END IF
	
	IF IsNull(dw_fechas_int.GetItemDatetime(1, "f_alta_fase_b")) THEN
		ls_fase_afectada = ls_fase_afectada + '0'
	ELSE
		ls_fase_afectada = ls_fase_afectada + '1'
	END IF
	
	IF IsNull(dw_fechas_int.GetItemDatetime(1, "f_alta_fase_c")) THEN
		ls_fase_afectada = ls_fase_afectada + '0'
	ELSE
		ls_fase_afectada = ls_fase_afectada + '1'
	END IF

END IF

IF gb_red_trifasica = False THEN
	li_contador = 1 
ELSE
	li_contador = 0
END IF

DO WHILE li_contador <= 3 AND NOT lb_hay_error

	CHOOSE CASE li_contador 
		CASE 0 
			ls_fecha_alta = "f_alta"
			li_contador = 3
		CASE 1
			ls_fecha_alta = "f_alta_fase_a"
			ls_texto_fase = "Fase " + gs_fase_a
		CASE 2
			ls_fecha_alta = "f_alta_fase_b"
			ls_texto_fase = "Fase " + gs_fase_b
		CASE 3
			ls_fecha_alta = "f_alta_fase_c"
			ls_texto_fase = "Fase " + gs_fase_c
			
	END CHOOSE

	IF NOT IsNull (dw_fechas_int.GetItemDateTime(1,ls_fecha_alta)) THEN	
		ldt_f_alta_validar = dw_fechas_int.GetItemDateTime(1,ls_fecha_alta)
		
		// Fecha de alta tiene que ser posterior a la fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la incidencia 
		IF ldt_f_alta_validar < idt_f_deteccion THEN
			ls_mensaje = "La Fecha de Alta de la interrupci$$HEX1$$f300$$ENDHEX$$n" 
			IF NOT gb_red_trifasica THEN
				ls_mensaje += " en la " + ls_texto_fase 
			END IF
			ls_mensaje += " no puede ser menor que la Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n de la incidencia."
			lb_hay_error = TRUE
		END IF
		
		// Valida que la fecha de alta no puede ser mayor que la fecha del d$$HEX1$$ed00$$ENDHEX$$a
		IF NOT lb_hay_error THEN
			IF ldt_f_alta_validar > fgnu_fecha_actual() THEN
				ls_mensaje = "La Fecha de Alta de la interrupci$$HEX1$$f300$$ENDHEX$$n"
				IF NOT gb_red_trifasica THEN
					ls_mensaje += " en la " + ls_texto_fase 
				END IF
				ls_mensaje += " no puede ser mayor que la fecha del d$$HEX1$$ed00$$ENDHEX$$a."
				lb_hay_error = TRUE
			END IF
		END IF
	
	END IF
			
	li_contador ++
LOOP
	
IF NOT lb_hay_error THEN
//	IF wf_valida_int_cerradas_padre(ls_mensaje) <> '111' THEN
//		lb_hay_error = TRUE
//	END IF
END IF
	
IF NOT lb_hay_error THEN				
	IF NOT IsNull(idt_fecha_sr) THEN
		li_ret = wf_comprobar_reapertura(idt_fecha_sr, ll_tiempo)
			
		IF li_ret < 0 THEN
			ls_mensaje = "No se ha podido reabrir la incidencia debido a que no se ha podido determinar el tiempo de reapertura de incidencias."
			lb_hay_error = TRUE
		ELSEIF li_ret = 0 THEN
			ls_mensaje = "No se ha podido reabrir la incidencia debido a que se ha sobrepasado el tiempo de " + string(ll_tiempo) + " minutos desde que la incidencia pas$$HEX2$$f3002000$$ENDHEX$$a SR."
			lb_hay_error = TRUE
		END IF
	END IF
END IF

///////////////////////////////////////////////////////
// VALIDACIONES GENERALES DE LA FECHA DE REPOSICION  //
///////////////////////////////////////////////////////

IF gb_red_trifasica = False THEN
	li_contador = 1 
ELSE 
	li_contador = 0
END IF

DO WHILE li_contador <= 3 AND NOT lb_hay_error

	CHOOSE CASE li_contador 
		CASE 0
			ls_fecha_alta = "f_alta"
			ls_fecha_rep = "f_reposicion"
			li_contador = 3
		CASE 1
			ls_fecha_alta = "f_alta_fase_a"
			ls_fecha_rep = "f_rep_fase_a"
			ls_texto_fase = "Fase " + gs_fase_a
		CASE 2
			ls_fecha_alta = "f_alta_fase_b"
			ls_fecha_rep = "f_rep_fase_b"
			ls_texto_fase = "Fase " + gs_fase_b
		CASE 3
			ls_fecha_alta = "f_alta_fase_c"
			ls_fecha_rep = "f_rep_fase_c"
			ls_texto_fase = "Fase " + gs_fase_c
			
	END CHOOSE
	
	IF NOT IsNull (dw_fechas_int.GetItemDateTime(1,ls_fecha_rep)) THEN	
		ldt_f_rep_validar = dw_fechas_int.GetItemDateTime(1,ls_fecha_rep)
		
		// Se valida que la fecha de reposici$$HEX1$$f300$$ENDHEX$$n no sea mayor que la fecha de alta en el caso
		// de que se haya definido una fecha de alta
		IF NOT IsNull(dw_fechas_int.GetItemDateTime(1,ls_fecha_alta)) THEN
			IF ldt_f_rep_validar < dw_fechas_int.GetItemDateTime(1,ls_fecha_alta) THEN
				ls_mensaje = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n"
				IF NOT gb_red_trifasica THEN
					ls_mensaje += " en la " + ls_texto_fase
				END IF
				ls_mensaje += " no puede ser menor que la Fecha de Alta."
				lb_hay_error = TRUE
			END IF
		END IF
		
		// Se valida que la fecha de reposici$$HEX1$$f300$$ENDHEX$$n no pueda ser mayor que la fecha del d$$HEX1$$ed00$$ENDHEX$$a
		IF NOT lb_hay_error THEN
			IF ldt_f_rep_validar > fgnu_fecha_actual() THEN
				ls_mensaje = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n"
				IF NOT gb_red_trifasica THEN
					ls_mensaje += "en la " + ls_texto_fase
				END IF
				ls_mensaje += " no puede ser mayor que la fecha del d$$HEX1$$ed00$$ENDHEX$$a."
				lb_hay_error = TRUE
			END IF
		END IF
		
		// Se valida que el estado de la incidencia >= EB para reponer 
		IF NOT lb_hay_error THEN
			IF IsNull(idt_fecha_eb) OR idt_fecha_eb = ldt_f_nula OR ib_hay_brig_disp = FALSE THEN
				ls_mensaje = "No se puede resolver la interrupci$$HEX1$$f300$$ENDHEX$$n"
				IF NOT gb_red_trifasica THEN
					ls_mensaje += " en la " + ls_texto_fase
				END IF
				ls_mensaje += " debido a que no existe ninguna Brigada/Contrata trabajando actualmente en la incidencia."
				lb_hay_error = TRUE
			END IF
		END IF
		
		// Se valida que la fecha de reposici$$HEX1$$f300$$ENDHEX$$n sea mayor que la la fecha de Enviado Brigada 		
		IF NOT lb_hay_error THEN
			IF ldt_f_rep_validar < idt_fecha_eb THEN
				ls_mensaje = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n"
				IF NOT gb_red_trifasica THEN
					ls_mensaje += " en la " + ls_texto_fase
				END IF
				ls_mensaje += " no puede ser menor que la fecha de EB."
				lb_hay_error = TRUE
			END IF
		END IF
		
	//	SFP DEO12-00000219 JHE 20130403
	// Se valida que los tiempos entre la fecha dada y la fecha de reposicion
	// No sean mayor al tiempo parametrizado.
		If w_ventana_llamante.tab_1.ii_valtiempomax > 0 and lb_continuar Then
			// Se recalcula la duraci$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n
			ldt_fecha = w_ventana_llamante.tab_1.tabpage_interrupciones.d_datos_interrup.GetItemDateTime(1,ls_fecha_alta)
			
			If fg_duracion_horas (ldt_fecha,ldt_f_rep_validar) > w_ventana_llamante.tab_1.ii_valtiempomax Then
				li_sel =  Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El tiempo entre la fecha de alta " +string(ldt_fecha) +" y la fecha de reposici$$HEX1$$f300$$ENDHEX$$n "+ string(ldt_f_rep_validar)+","+" ~n "+"de las interrupciones es mayor a "+string(w_ventana_llamante.tab_1.ii_valtiempomax)+" horas."+" ~n "+"$$HEX2$$bf002000$$ENDHEX$$Continuar ?" , Question!, YesNo!)
				if li_sel = 2 Then
					dw_fechas_int.SetItem(1, ls_fecha_rep, ldt_f_nula)
					lb_hay_error = TRUE
               return NOT lb_hay_error
				else
					lb_continuar = false
				end if
			End if

		End If
		//	SFP DEO12-00000219 JHE 20130403 FIN		
	END IF
			
	li_contador ++
LOOP

IF lb_hay_error THEN
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
END IF

return NOT lb_hay_error
end function

public function string wf_valida_int_otras_inc (long pl_nro_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_valida_int_otras_inc
// 
// Objetivo: 
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Boolean lb_fase_a = true,  lb_fase_b = true, lb_fase_c = true
Long ll_nro_instalacion, ll_int_fase_a, ll_int_fase_b, ll_int_fase_c, ll_int
String ls_filtro_busqueda, ls_nom_instalacion, ls_fases_permitidas

// Se realiza la b$$HEX1$$fa00$$ENDHEX$$squeda en bd para otras incidencias

SELECT NVL(SUM(TO_NUMBER(1 - DECODE(F_REPOSICION, null, 0,1))),0),
		 NVL(SUM(TO_NUMBER(SUBSTR(NVL("SGD_INTERRUPCION"."FASE_AFECTADA",'111'),1,1)) - DECODE(F_REPOSICION_FASE_A, null, 0,1)),0),
		 NVL(SUM(TO_NUMBER(SUBSTR(NVL("SGD_INTERRUPCION"."FASE_AFECTADA",'111'),2,1)) - DECODE(F_REPOSICION_FASE_B, null, 0,1)),0),
		 NVL(SUM(TO_NUMBER(SUBSTR(NVL("SGD_INTERRUPCION"."FASE_AFECTADA",'111'),3,1)) - DECODE(F_REPOSICION_FASE_C, null, 0,1)),0)
INTO :ll_int,
	  :ll_int_fase_a,
	  :ll_int_fase_b,
	  :ll_int_fase_c
FROM  "SGD_INTERRUPCION"
WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" = :pl_nro_instalacion AND
		"SGD_INTERRUPCION"."NRO_INCIDENCIA" <> :il_nro_incidencia AND
		"SGD_INTERRUPCION"."F_REPOSICION" is null;
		
//		AND
//	((SUBSTR(NVL("SGD_INTERRUPCION"."FASE_AFECTADA",'111'),1,1) = '1' )  OR 
//	 (SUBSTR(NVL("SGD_INTERRUPCION"."FASE_AFECTADA",'111'),2,1) = '1' ) OR 
//	 (SUBSTR(NVL("SGD_INTERRUPCION"."FASE_AFECTADA",'111'),3,1) = '1' )) ;

// Si ll_int_fase_a tiene valor cero es que no hay ninguna interrupci$$HEX1$$f300$$ENDHEX$$n pendiente en
// la fase a de una instalaci$$HEX1$$f300$$ENDHEX$$n superior
IF gb_red_trifasica THEN
	IF ll_int > 0 THEN
		lb_fase_a = FALSE
		lb_fase_b = FALSE
		lb_fase_c = FALSE
	END IF
ELSE
	IF ll_int_fase_a <> 0 THEN
		lb_fase_a = FALSE
	END IF
		
	// Si ll_int_fase_b tiene valor cero es que no hay ninguna interrupci$$HEX1$$f300$$ENDHEX$$n pendiente en
	// la fase b de una instalaci$$HEX1$$f300$$ENDHEX$$n superior
	IF ll_int_fase_b <> 0 THEN
		lb_fase_b = FALSE
	END IF
		
	// Si ll_int_fase_c tiene valor cero es que no hay ninguna interrupci$$HEX1$$f300$$ENDHEX$$n pendiente en
	// la fase c de una instalaci$$HEX1$$f300$$ENDHEX$$n superior
	IF ll_int_fase_c <> 0 THEN
		lb_fase_c = FALSE
	END IF
END IF

IF lb_fase_a THEN
	ls_fases_permitidas = '1' 
ELSE
	ls_fases_permitidas = '0'
END IF

IF lb_fase_b THEN
	ls_fases_permitidas = ls_fases_permitidas + '1' 
ELSE
	ls_fases_permitidas = ls_fases_permitidas + '0'
END IF

IF lb_fase_c THEN
	ls_fases_permitidas = ls_fases_permitidas + '1' 
ELSE
	ls_fases_permitidas = ls_fases_permitidas + '0'
END IF

//ELSE
//	ls_fases_permitidas = '000'
//END IF

return ls_fases_permitidas 


end function

public function boolean wf_comprobar_causa ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_comprobar_causa
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que comprueba si como consecuencia de la resoluci$$HEX1$$f300$$ENDHEX$$n de interrupciones
// 			la incidencia pasa a SR. En este caso se debe verificar que ya exista una causa
// 			definida
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
 

Boolean lb_retorno = FALSE, lb_salida
Long ll_fila = 1, ll_fila_sel, ll_nro_instalacion 

lb_salida = ib_hay_causa OR &
		(rb_marcar.Checked AND ib_demarcar_a=FALSE AND ib_demarcar_b=FALSE AND &
		 ib_demarcar_c=FALSE) 
		 
// Si se est$$HEX1$$e100$$ENDHEX$$n desmarcando interrupciones la causa no hay que comprobarla si se est$$HEX2$$e1002000$$ENDHEX$$en
// un estado inferior a ER
IF lb_salida = FALSE AND ii_estado_incid < fgci_incidencia_en_reposicion AND &
	(ib_demarcar_a OR ib_demarcar_b OR ib_demarcar_c) THEN
	lb_salida = TRUE
END IF

DO WHILE lb_salida = FALSE AND ll_fila <= ids_inter_incidencia.RowCount() AND ll_fila > 0 
	IF gb_red_trifasica THEN
		ll_fila = ids_inter_incidencia.Find("isnull(f_reposicion) and not isnull(f_alta)", &
													ll_fila, ids_inter_incidencia.RowCount())
	ELSE
		ll_fila = ids_inter_incidencia.Find("(isnull(f_reposicion_fase_a) and not isnull(f_alta_fase_a))" + &
													" or (isnull(f_reposicion_fase_b) and not isnull(f_alta_fase_b))" + &
													" or (isnull(f_reposicion_fase_c) and not isnull(f_alta_fase_c))", &
													ll_fila, ids_inter_incidencia.RowCount())
	END IF

	IF ll_fila > 0 THEN
		IF gb_red_trifasica THEN
			IF ib_demarcar_a OR NOT IsNull(dw_fechas_int.GetItemDatetime(1, 'f_reposicion')) THEN
				ll_nro_instalacion = ids_inter_incidencia.GetItemNumber(ll_fila, 'nro_instalacion')
				ll_fila_sel = dw_multiples_inter.Find("nro_instalacion = " + string(ll_nro_instalacion), &
																  1, dw_multiples_inter.RowCount())
	
				IF ll_fila_sel > 0 THEN
					lb_salida = NOT dw_multiples_inter.IsSelected(ll_fila_sel) 
					//lb_retorno = lb_salida
				ELSE
					lb_salida = TRUE
				END IF
						
			ELSE
				lb_salida = TRUE
					//lb_retorno = TRUE
			END IF
			
		ELSE
			IF IsNull(ids_inter_incidencia.GetItemDatetime(ll_fila, 'f_reposicion_fase_a')) AND &
				NOT IsNull(ids_inter_incidencia.GetItemDatetime(ll_fila, 'f_alta_fase_a'))	THEN
			
				IF ib_demarcar_a OR NOT IsNull(dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_a')) THEN
					ll_nro_instalacion = ids_inter_incidencia.GetItemNumber(ll_fila, 'nro_instalacion')
					ll_fila_sel = dw_multiples_inter.Find("nro_instalacion = " + string(ll_nro_instalacion), &
																  1, dw_multiples_inter.RowCount())
	
					IF ll_fila_sel > 0 THEN
						lb_salida = NOT dw_multiples_inter.IsSelected(ll_fila_sel) 
						//lb_retorno = lb_salida
					ELSE
						lb_salida = TRUE
					END IF
						
				ELSE
					lb_salida = TRUE
					//lb_retorno = TRUE
				END IF
			END IF
			
			IF lb_salida = FALSE AND &
				IsNull(ids_inter_incidencia.GetItemDatetime(ll_fila, 'f_reposicion_fase_b')) AND &
				NOT IsNull(ids_inter_incidencia.GetItemDatetime(ll_fila, 'f_alta_fase_b'))	THEN
			
				IF ib_demarcar_b OR NOT IsNull(dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_b')) THEN
					ll_nro_instalacion = ids_inter_incidencia.GetItemNumber(ll_fila, 'nro_instalacion')
					ll_fila_sel = dw_multiples_inter.Find("nro_instalacion = " + string(ll_nro_instalacion), &
																  1, dw_multiples_inter.RowCount())
	
					IF ll_fila_sel > 0 THEN
						lb_salida = NOT dw_multiples_inter.IsSelected(ll_fila_sel) 
						//lb_retorno = lb_salida
					ELSE
						lb_salida = TRUE
					END IF
						
				ELSE
					lb_salida = TRUE
					//lb_retorno = TRUE
				END IF
			END IF
			
			IF lb_salida = FALSE AND &
				IsNull(ids_inter_incidencia.GetItemDatetime(ll_fila, 'f_reposicion_fase_c')) AND &
				NOT IsNull(ids_inter_incidencia.GetItemDatetime(ll_fila, 'f_alta_fase_c'))	THEN
			
				IF ib_demarcar_c OR NOT IsNull(dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_c')) THEN
					ll_nro_instalacion = ids_inter_incidencia.GetItemNumber(ll_fila, 'nro_instalacion')
					ll_fila_sel = dw_multiples_inter.Find("nro_instalacion = " + string(ll_nro_instalacion), &
																  1, dw_multiples_inter.RowCount())
	
					IF ll_fila_sel > 0 THEN
						lb_salida = NOT dw_multiples_inter.IsSelected(ll_fila_sel) 
						//lb_retorno = lb_salida
					ELSE
						lb_salida = TRUE
					END IF
						
				ELSE
					lb_salida = TRUE
					//lb_retorno = TRUE
				END IF
			END IF
		END IF
		ll_fila ++
	
//	ELSE
//		lb_salida = TRUE
	END IF
LOOP

return lb_salida

end function

public function boolean wf_validar_desmarcar_indiv (long pl_nro_instalacion, string ps_nom_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_validar_desmarcar_indiv
// 
// Objetivo:  - Se comprueba que exista una interrupci$$HEX1$$f300$$ENDHEX$$n definida en la instalaci$$HEX1$$f300$$ENDHEX$$n
// 			  - Se comprueba que no exista una interrupci$$HEX1$$f300$$ENDHEX$$n cerrada en la instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


Boolean lb_salida = TRUE 
String ls_mensaje
Long ll_fila
// Se comprueba que exista una interrupci$$HEX1$$f300$$ENDHEX$$n definida en la instalaci$$HEX1$$f300$$ENDHEX$$n
IF ids_inter_incidencia.Find("nro_instalacion = " + string(pl_nro_instalacion),  &
									  1, ids_inter_incidencia.RowCount()) <= 0 THEN

	lb_salida = FALSE
	ls_mensaje = "No existe ninguna interrupci$$HEX1$$f300$$ENDHEX$$n definida en la instalaci$$HEX1$$f300$$ENDHEX$$n " + ps_nom_instalacion
END IF

IF lb_salida THEN
	// Se comprueba que no exista una interrupci$$HEX1$$f300$$ENDHEX$$n cerrada en la instalaci$$HEX1$$f300$$ENDHEX$$n
	IF gb_red_trifasica THEN
		IF ids_inter_incidencia.Find("nro_instalacion = " + string(pl_nro_instalacion) + &
											  " and not isnull(f_reposicion)", &
												1, ids_inter_incidencia.RowCount()) > 0 THEN
												  
			lb_salida = FALSE
			ls_mensaje = "No se puede desmarcar la interrupci$$HEX1$$f300$$ENDHEX$$n en la instalaci$$HEX1$$f300$$ENDHEX$$n " + &
							  ps_nom_instalacion + " debido a que ya est$$HEX2$$e1002000$$ENDHEX$$resuelta."
		END IF
	ELSE
		IF ids_inter_incidencia.Find("nro_instalacion = " + string(pl_nro_instalacion) + &
											  " and ((not isnull(f_reposicion_fase_a))" + &
													  "  or (not isnull(f_reposicion_fase_b))" + &
													  "  or (not isnull(f_reposicion_fase_c)))", &
												1, ids_inter_incidencia.RowCount()) > 0 THEN
												  
			lb_salida = FALSE
			ls_mensaje = "No se puede desmarcar ninguna interrupci$$HEX1$$f300$$ENDHEX$$n en la instalaci$$HEX1$$f300$$ENDHEX$$n " + &
							  ps_nom_instalacion + " debido a que alguna de sus interrupciones ya est$$HEX1$$e100$$ENDHEX$$n resueltas."
		END IF
	END IF
END IF

IF lb_salida = FALSE THEN
	ll_fila = ids_problemas.Insertrow(0)
	ids_problemas.SetItem(ll_fila,'nom_instalacion', ps_nom_instalacion)
	ids_problemas.Setitem(ll_fila,'descripcion', ls_mensaje)
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
END IF

Return lb_salida
end function

public function integer wf_valida_primer_aviso ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_valida_primer_aviso
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que comprueba si las fechas definidas por el usuario son superiores a la fecha
// 			del primer aviso
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Datetime ldt_f_alta, ldt_f_alta_fase_a, ldt_f_alta_fase_b, ldt_f_alta_fase_c
Boolean lb_fechas_dif = FALSE

SetNull(ldt_f_alta)
SetNull(ldt_f_alta_fase_a)
SetNull(ldt_f_alta_fase_b)
SetNull(ldt_f_alta_fase_c)

IF gb_red_trifasica OR cbx_misma_fecha.checked THEN
	IF NOT IsNull(dw_fechas_int.GetItemDatetime(1,'f_alta')) THEN
		IF gb_red_trifasica THEN
			IF IsDate(String((dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_gen')), 'dd/mm/yyyy')) AND &
				dw_fechas_int.GetItemDatetime(1,'f_alta') > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_gen') THEN
				
				ldt_f_alta = dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_gen')
				lb_fechas_dif = TRUE
			END IF
		ELSE
			IF cbx_fase_a.checked AND IsDate(String((dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_a')), 'dd/mm/yyyy')) AND &
				dw_fechas_int.GetItemDatetime(1,'f_alta') > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_a') THEN
				
				ldt_f_alta = dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_a')
				lb_fechas_dif = TRUE
			END IF
			IF cbx_fase_b.checked AND IsDate(String((dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_b')), 'dd/mm/yyyy')) AND &
				dw_fechas_int.GetItemDatetime(1,'f_alta') > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_b') THEN
				
				IF (NOT IsNull(ldt_f_alta) AND ldt_f_alta > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_b')) &
					OR IsNull(ldt_f_alta) THEN

					lb_fechas_dif = TRUE
					ldt_f_alta = dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_b')
				END IF
			END IF
			IF cbx_fase_c.checked AND IsDate(String((dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_c')), 'dd/mm/yyyy')) AND &
				dw_fechas_int.GetItemDatetime(1,'f_alta') > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_c') THEN
				
				IF (NOT IsNull(ldt_f_alta) AND ldt_f_alta > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_c')) &
					OR IsNull(ldt_f_alta) THEN
					
					lb_fechas_dif = TRUE
					ldt_f_alta = dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_c')
				END IF
			END IF
		END IF
	END IF
ELSE
	IF NOT IsNull(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_a')) THEN
		IF IsDate(String((dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_a')), 'dd/mm/yyyy')) AND &
			dw_fechas_int.GetItemDatetime(1,'f_alta_fase_a') > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_a') THEN
			
			ldt_f_alta_fase_a = dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_a')
			lb_fechas_dif = TRUE
		END IF
	END IF

	IF NOT IsNull(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_b')) THEN
		IF IsDate(String((dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_b')), 'dd/mm/yyyy')) AND &
			dw_fechas_int.GetItemDatetime(1,'f_alta_fase_b') > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_b') THEN
			
			ldt_f_alta_fase_b = dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_b')
			lb_fechas_dif = TRUE
		END IF
	END IF

	IF NOT IsNull(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_c')) THEN
		IF IsDate(String((dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_c')), 'dd/mm/yyyy')) AND &
			dw_fechas_int.GetItemDatetime(1,'f_alta_fase_c') > dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_c') THEN
			
			ldt_f_alta_fase_c = dw_multiples_inter.GetItemDatetime(1, 'fecha_minima_c')
			lb_fechas_dif = TRUE
		END IF
	END IF

END IF

IF lb_fechas_dif THEN
	IF gb_red_trifasica OR cbx_misma_fecha.checked THEN
		gu_comunic.is_comunic.datval1 = ldt_f_alta
		gu_comunic.is_comunic.strval1 = String(dw_fechas_int.GetItemDatetime(1,'f_alta'))
	ELSE
		gu_comunic.is_comunic.datval1 = ldt_f_alta_fase_a
		gu_comunic.is_comunic.datval2 = ldt_f_alta_fase_b
		gu_comunic.is_comunic.datval3 = ldt_f_alta_fase_c
		gu_comunic.is_comunic.strval1 = String(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_a'))
		gu_comunic.is_comunic.strval2 = String(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_b'))
		gu_comunic.is_comunic.strval3 = String(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_c'))
	END IF
	
	IF cbx_misma_fecha.checked THEN
		gu_comunic.is_comunic.intval1 = 1
	ELSE
		gu_comunic.is_comunic.intval1 = 0
	END IF
	
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Algunas de las fechas definidas para interrumpir son posteriores a la fecha del " + &
								  "primer aviso encontrado para las instalaciones seleccionadas. Debe confirmar dichas fechas.")
	
	Open(w_def_fecha_avisos)
	
	IF gb_red_trifasica OR cbx_misma_fecha.checked THEN
		dw_fechas_int.SetItem(1, 'f_alta', gu_comunic.is_comunic.datval1)
		IF cbx_misma_fecha.checked THEN
			IF cbx_fase_a.checked THEN
				dw_fechas_int.SetItem(1, 'f_alta_fase_a', gu_comunic.is_comunic.datval1)
			END IF
			IF cbx_fase_b.checked THEN
				dw_fechas_int.SetItem(1, 'f_alta_fase_b', gu_comunic.is_comunic.datval1)
			END IF
			IF cbx_fase_c.checked THEN
				dw_fechas_int.SetItem(1, 'f_alta_fase_c', gu_comunic.is_comunic.datval1)
			END IF
		END IF
	ELSE
		dw_fechas_int.SetItem(1, 'f_alta_fase_a', gu_comunic.is_comunic.datval1)
		dw_fechas_int.SetItem(1, 'f_alta_fase_b', gu_comunic.is_comunic.datval2)
		dw_fechas_int.SetItem(1, 'f_alta_fase_c', gu_comunic.is_comunic.datval3)
	END IF

END IF

return 1
end function

public function string wf_det_perdida_ct (string ps_fase_ent, integer pi_tipo_conexion, integer pi_tipo_ct);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_det_perdida_ct
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que comprueba si una instalaci$$HEX1$$f300$$ENDHEX$$n por debajo de un CT se ve afectada
//				 por una interrupci$$HEX1$$f300$$ENDHEX$$n por encima del CT
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

String ls_ret = '', ls_fase_ct, ls_fase_int_ct = ''
Int li_res

IF gb_tabla_decision THEN
	SELECT fgci_fase_instalacion(TIPO_CONEXION)
	INTO :ls_fase_ct
	FROM SGD_INSTALACION
	WHERE BDI_JOB = 0 AND TIPO_INSTALACION = :fgci_tipo_ct
	START WITH NRO_INSTALACION = :il_nro_inst_padre AND BDI_JOB = 0
	CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION;
	
	IF SQLCA.SQLCode = 0 THEN
		// Se realiza la intersecci$$HEX1$$f300$$ENDHEX$$n entre la fase interrumpida y la fase del CT
		IF Mid(ps_fase_ent,1,1) = '1' AND Pos(ls_fase_ct,gs_fase_a) > 0 THEN
			ls_fase_int_ct = '1'
		ELSE
			ls_fase_int_ct = '0'
		END IF
	
		IF Mid(ps_fase_ent,2,1) = '1' AND Pos(ls_fase_ct,gs_fase_b) > 0 THEN
			ls_fase_int_ct += '1'
		ELSE
			ls_fase_int_ct += '0'
		END IF
		
		IF Mid(ps_fase_ent,3,1) = '1' AND Pos(ls_fase_ct,gs_fase_c) > 0 THEN
			ls_fase_int_ct += '1'
		ELSE
			ls_fase_int_ct += '0'
		END IF
	ELSE
		ls_fase_int_ct = ps_fase_ent
	END IF
	
	IF ls_fase_int_ct <> '000' THEN
	
		SELECT INSTR(gi_ct_fase_conexion.fase_sal, ',' || TO_CHAR(:pi_tipo_conexion) || ',')
		INTO :li_res
		FROM gi_ct_fase_conexion
		WHERE gi_ct_fase_conexion.TIPO_CT = NVL(:pi_tipo_ct,0) AND
				gi_ct_fase_conexion.fase_ent = :ls_fase_int_ct;
				 
		IF SQLCA.SQLCode = 0 THEN
			IF li_res > 0 THEN
				SELECT FASE_AFECTADA
				INTO :ls_ret 
				FROM GI_CAMBIO_FORMATO_FASE
				WHERE TIPO_CONEXION = :pi_tipo_conexion;
			
				IF SQLCA.SQLCode <> 0 THEN
					ls_ret = ''
				END IF
			ELSE
				ls_ret = ''
			END IF
		END IF
	ELSE
		ls_ret = ''
	END IF
		
ELSE
	ls_ret = ps_fase_ent
END IF

return ls_ret
end function

public function boolean wf_validar_fechas_indiv (long pl_nro_instalacion, string ps_nom_instalacion, integer pi_tipo_conexion, integer pi_tipo_ct, integer pi_tipo_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_validar_fechas_indiv
// 
// Objetivo:  Validaciones:
//		F_ALTA:
//		=======
//			- Que ya exista una interrupci$$HEX1$$f300$$ENDHEX$$n en esa instalaci$$HEX1$$f300$$ENDHEX$$n en otra incidencia 
//			- En caso de que la red sea monof$$HEX1$$e100$$ENDHEX$$sica, si la fecha nueva es menor que la fecha de 
// 		  alta, $$HEX1$$e900$$ENDHEX$$sta ser$$HEX2$$e1002000$$ENDHEX$$la nueva fecha de alta
//			- La nueva fecha de alta no puede ser inferior a la anterior fecha de alta en 
//			  caso de reapertura de la interrupci$$HEX1$$f300$$ENDHEX$$n 
//
//		F_REPOSICION:
//		=============
//			- Se valida que exista una fecha de alta
//			- Se valida que la fecha sea mayor que la fecha de alta en el caso de que
//			  exista previamente una fecha de alta antes de abrir esta ventana.
//		
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Datetime ldt_f_alta_validar, ldt_f_rep_validar
Integer li_contador,li_devuelve 
String ls_fecha_alta, ls_fecha_rep, ls_mensaje, ls_fase_afectada, ls_texto_fase, ls_fase_perm
Boolean lb_hay_error = FALSE
Long ll_tiempo, ll_fila

dw_fechas_int.AcceptText()

//////////////////////////////////////////////////////////////
// VALIDACIONES A NIVEL DE INSTALACION DE LA FECHA DE ALTA  //
//////////////////////////////////////////////////////////////

// Se determinan las fases en las que se realiza la b$$HEX1$$fa00$$ENDHEX$$squeda
IF gb_red_trifasica THEN
	ls_fase_afectada = "111"
ELSE
	IF IsNull(dw_fechas_int.GetItemDatetime(1, "f_alta_fase_a")) THEN
		ls_fase_afectada = '0'
	ELSE
		ls_fase_afectada = '1'
	END IF
	
	IF IsNull(dw_fechas_int.GetItemDatetime(1, "f_alta_fase_b")) THEN
		ls_fase_afectada = ls_fase_afectada + '0'
	ELSE
		ls_fase_afectada = ls_fase_afectada + '1'
	END IF
	
	IF IsNull(dw_fechas_int.GetItemDatetime(1, "f_alta_fase_c")) THEN
		ls_fase_afectada = ls_fase_afectada + '0'
	ELSE
		ls_fase_afectada = ls_fase_afectada + '1'
	END IF

END IF

IF gb_red_trifasica = False THEN
	li_contador = 1
ELSE
	li_contador = 0
END IF

IF (NOT IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_a"))) OR  &
	(NOT IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_b"))) OR  &
	(NOT IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_c"))) THEN
	
	ls_fase_perm = wf_valida_int_otras_inc(pl_nro_instalacion)
ELSE 
	ls_fase_perm = ''
END IF

DO WHILE li_contador <= 3 AND NOT lb_hay_error

	CHOOSE CASE li_contador 
		CASE 0
			ls_fecha_alta = "f_alta"
			ls_fecha_rep = "f_reposicion"
			li_contador = 3
		CASE 1
			ls_fecha_alta = "f_alta_fase_a"
			ls_fecha_rep = "f_reposicion_fase_a"
			ls_texto_fase = "Fase " + gs_fase_a
		CASE 2
			ls_fecha_alta = "f_alta_fase_b"
			ls_fecha_rep = "f_reposicion_fase_b"
			ls_texto_fase = "Fase " + gs_fase_b
		CASE 3
			ls_fecha_alta = "f_alta_fase_c"
			ls_fecha_rep = "f_reposicion_fase_c"
			ls_texto_fase = "Fase " + gs_fase_c
			
	END CHOOSE
	
	ldt_f_alta_validar = dw_fechas_int.GetItemDateTime(1,ls_fecha_alta)
	
	IF NOT IsNull (ldt_f_alta_validar) THEN	

		IF Mid(ls_fase_perm, li_contador, 1) = '0' THEN
			// Existe una interrupci$$HEX1$$f300$$ENDHEX$$n abierta en la misma instalaci$$HEX1$$f300$$ENDHEX$$n en otra incidencia
			lb_hay_error = TRUE
			ls_mensaje = "No se puede marcar una interrupci$$HEX1$$f300$$ENDHEX$$n en la instalaci$$HEX1$$f300$$ENDHEX$$n " + ps_nom_instalacion
			IF NOT gb_red_trifasica THEN
				ls_mensaje += " para la " + ls_texto_fase
			END IF
			ls_mensaje += " debido a que se encuentra interrumpida en otra incidencia."
			
		END IF
	
		// No deben existir interrupciones pendientes en las instalaci$$HEX1$$f300$$ENDHEX$$n en la misma fase
		IF lb_hay_error = FALSE AND ids_inter_incidencia.find("nro_instalacion = " + string(pl_nro_instalacion) + &
											  " and isnull(" + ls_fecha_rep + ")" +&
											  " and not isnull(" + ls_fecha_alta + ")", &
											  1, ids_inter_incidencia.RowCount()) > 0 THEN
			lb_hay_error = TRUE
			ls_mensaje = "No se puede marcar una interrupci$$HEX1$$f300$$ENDHEX$$n en la instalaci$$HEX1$$f300$$ENDHEX$$n " + ps_nom_instalacion
			IF NOT gb_red_trifasica THEN
				ls_mensaje += " para la " + ls_texto_fase
			END IF
			ls_mensaje += " debido a que ya se encuentra interrumpida en la incidencia."
		END IF
		
		// La nueva fecha de alta no puede ser inferior a la anterior fecha de alta en 
		// caso de reapertura de la interrupci$$HEX1$$f300$$ENDHEX$$n
		IF lb_hay_error = FALSE AND ids_inter_incidencia.find("nro_instalacion = " + string(pl_nro_instalacion) + &
											  " and (not isnull(" + ls_fecha_rep + "))" +&
											  " and " + ls_fecha_rep + " > datetime('" + string(ldt_f_alta_validar) + "')", &
											  1, ids_inter_incidencia.RowCount()) > 0 THEN

			lb_hay_error = TRUE
			ls_mensaje = "La Fecha de Alta de la interrupci$$HEX1$$f300$$ENDHEX$$n en la instalaci$$HEX1$$f300$$ENDHEX$$n " + ps_nom_instalacion
			IF NOT gb_red_trifasica THEN
				ls_mensaje += " para la " + ls_texto_fase
			END IF
			ls_mensaje += " no puede ser menor que la Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n de otra interrupci$$HEX1$$f300$$ENDHEX$$n resuelta sobre la instalaci$$HEX1$$f300$$ENDHEX$$n."
		END IF

	
	END IF	
	li_contador ++
LOOP

IF lb_hay_error = FALSE THEN
	IF (NOT IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_a"))) OR  &
		(NOT IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_b"))) OR  &
		(NOT IsNull(dw_fechas_int.GetItemDateTime(1,"f_alta_fase_c"))) THEN

		IF wf_valida_int_cerradas_padre(ls_mensaje,pi_tipo_conexion,pi_tipo_ct,pi_tipo_instalacion) <> '111' THEN
			lb_hay_error = TRUE
		END IF
	END IF
END IF

////////////////////////////////////////////////////////////////////
// VALIDACIONES A NIVEL DE INSTALACION DE LA FECHA DE REPOSICION  //
////////////////////////////////////////////////////////////////////

IF gb_red_trifasica = False THEN
	li_contador = 1 
ELSE
	li_contador = 0
END IF

DO WHILE li_contador <= 3 AND NOT lb_hay_error

	CHOOSE CASE li_contador 
		CASE 0
			ls_fecha_alta = "f_alta"
			ls_fecha_rep = "f_reposicion"
			ldt_f_rep_validar = dw_fechas_int.GetItemDateTime(1, "f_reposicion")
			li_contador = 3
		CASE 1
			ls_fecha_alta = "f_alta_fase_a"
			ls_fecha_rep = "f_reposicion_fase_a"
			ls_texto_fase = "Fase " + gs_fase_a
			ldt_f_rep_validar = dw_fechas_int.GetItemDateTime(1, "f_rep_fase_a")
		CASE 2
			ls_fecha_alta = "f_alta_fase_b"
			ls_fecha_rep = "f_reposicion_fase_b"
			ls_texto_fase = "Fase " + gs_fase_b
			ldt_f_rep_validar = dw_fechas_int.GetItemDateTime(1, "f_rep_fase_b")
		CASE 3
			ls_fecha_alta = "f_alta_fase_c"
			ls_fecha_rep = "f_reposicion_fase_c"
			ls_texto_fase = "Fase " + gs_fase_c
			ldt_f_rep_validar = dw_fechas_int.GetItemDateTime(1, "f_rep_fase_c")
			
	END CHOOSE
	// Se valida que exista una fecha de alta
	IF NOT IsNull(ldt_f_rep_validar) THEN
				
		// Se valida que la fecha de reposici$$HEX1$$f300$$ENDHEX$$n sea mayor que la fecha de alta en el caso de 
		//	exista previamente una fecha de alta antes de abrir esta ventana
		IF NOT lb_hay_error THEN
			IF ids_inter_incidencia.find("nro_instalacion = " + string(pl_nro_instalacion) + &
												  " and isnull(" + ls_fecha_rep + ")" +&
												  " and (not isnull(" + ls_fecha_alta + "))" + &
												  " and " + ls_fecha_alta + " > datetime('" + string(ldt_f_rep_validar) + "')", &
												  1, ids_inter_incidencia.RowCount()) > 0 THEN
		
				lb_hay_error = TRUE
				ls_mensaje = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n en la instalaci$$HEX1$$f300$$ENDHEX$$n " + ps_nom_instalacion
				IF NOT gb_red_trifasica THEN
					ls_mensaje += " para la " + ls_texto_fase
				END IF
				ls_mensaje += " no puede ser menor que la Fecha de Alta ya definida."
			END IF
		END IF
		
		// Se valida que no exista ning$$HEX1$$fa00$$ENDHEX$$n padre con una interrupci$$HEX1$$f300$$ENDHEX$$n pendiente que nos afecte
		IF NOT lb_hay_error THEN
			IF wf_valida_cierre_interrupcion(ls_mensaje,pi_tipo_conexion,pi_tipo_ct,pi_tipo_instalacion) <> '111' THEN
				lb_hay_error = TRUE
			END IF
		END IF
	END IF	
	li_contador ++
LOOP

// PACHO. Validaci$$HEX1$$f300$$ENDHEX$$n de instalaciones para moldavia.
		
if gb_operaciones_inst = true then // se validan las instalaciones interrumpidas.
	li_devuelve = w_ventana_llamante.tab_1.fnu_int_comunes(dw_fechas_int.GetItemdatetime(1,"f_alta"),dw_fechas_int.GetItemdatetime(1,"f_reposicion"),pl_nro_instalacion)
end if
		
choose case li_devuelve
	case -1
		lb_hay_error = TRUE
		ls_mensaje = "Existe una Interrupci$$HEX1$$f300$$ENDHEX$$n sobre esta misma instalaci$$HEX1$$f300$$ENDHEX$$n en el periodo de tiempo que intenta interrumpir."
	case -3
		lb_hay_error = TRUE
		ls_mensaje = "Existe una Interrupci$$HEX1$$f300$$ENDHEX$$n sobre esta misma instalaci$$HEX1$$f300$$ENDHEX$$n en el periodo de tiempo que intenta interrumpir."
	case -4
		lb_hay_error = TRUE
		ls_mensaje = "Se ha producido un error al comprobar la existencia de otras interrupciones en la misma instalaci$$HEX1$$f300$$ENDHEX$$n."
	case -5
		lb_hay_error = TRUE
		ls_mensaje = "La interrupci$$HEX1$$f300$$ENDHEX$$n que est$$HEX2$$e1002000$$ENDHEX$$resolviendo engloba a otra/s interrupcione/s. Sin embargo no ha sido posible bloquear dichas interrupciones por que estan siendo usadas por otro usuario."
	end choose

// PACHO. Validaci$$HEX1$$f300$$ENDHEX$$n de instalaciones para moldavia.		

IF lb_hay_error THEN
	ll_fila = ids_problemas.Insertrow(0)
	ids_problemas.SetItem(ll_fila,'nom_instalacion', ps_nom_instalacion)
	ids_problemas.Setitem(ll_fila,'descripcion', ls_mensaje)
//	return FALSE
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
END IF

return NOT lb_hay_error
end function

public function string wf_valida_cierre_interrupcion (ref string ps_mensaje, integer pi_tipo_conexion, integer pi_tipo_ct, integer pi_tipo_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_valida_cierre_interrupcion
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que comprueba que no exista ning$$HEX1$$fa00$$ENDHEX$$n padre con una interrupci$$HEX1$$f300$$ENDHEX$$n cerrada con 
// 			fecha de resoluci$$HEX1$$f300$$ENDHEX$$n mayor que la fecha de alta de la nueva interrupci$$HEX1$$f300$$ENDHEX$$n 
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Boolean lb_fase_a = true,  lb_fase_b = true, lb_fase_c = true
Long ll_nro_instalacion, ll_int_fase_a, ll_int_fase_b, ll_int_fase_c, ll_int, ll_ret,&
	  ll_nro_incidencia, ll_nro_inst_int
String ls_filtro_busqueda, ls_nom_instalacion, ls_fases_permitidas, ls_texto_fases, &
		 ls_fase_afect, ls_fases_extras, ls_mens="", ls_mens_parcial=""
Datetime ldt_f_rep_fase_a, ldt_f_rep_fase_b, ldt_f_rep_fase_c
Int li_tipo_instalacion

DECLARE lc_padres CURSOR FOR
	SELECT NRO_INSTALACION, 
			 NOM_INSTALACION,
			 TIPO_INSTALACION
	FROM SGD_INSTALACION
	START WITH NRO_INSTALACION = :il_nro_inst_padre AND BDI_JOB = 0
	CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION AND BDI_JOB = 0; 

OPEN lc_padres;

ldt_f_rep_fase_a = dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_a')
ldt_f_rep_fase_b = dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_b')
ldt_f_rep_fase_c = dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_c')
// Se busca en primer lugar en la dw de las interrupciones de la incidencia

IF SQLCA.SQLCode = 0 THEN
	// Se trae cada instalaci$$HEX1$$f300$$ENDHEX$$n y se busca en la dw de las interrupciones de la incidencia
	FETCH lc_padres INTO :ll_nro_instalacion, :ls_nom_instalacion, :li_tipo_instalacion;
	
	DO WHILE SQLCA.SQLCode = 0 AND (lb_fase_a OR lb_fase_b OR lb_fase_c)
	
		IF gb_red_trifasica = FALSE THEN
			// Se busca en la fase A	
			//IF lb_fase_a THEN //AND NOT IsNull(ldt_f_alta_fase_a) THEN
			ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
										" and mid(fase_afectada,1,1) = '1' and IsNull(f_reposicion_fase_a)"
				
			ll_ret = ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount())
				
			IF ll_ret > 0 THEN
				ls_fase_afect = '1'
					
			ELSE
				ls_fase_afect = '0'
			END IF
					
			// Se busca en la fase B	
			//IF lb_fase_b THEN //AND NOT IsNull(ldt_f_alta_fase_b) THEN
			ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
										" and mid(fase_afectada,2,1) = '1' and IsNull(f_reposicion_fase_b)"
				
			IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
				ls_fase_afect += '1'
			ELSE
				ls_fase_afect += '0'
			END IF
			
			// Se busca en la fase C	
			//IF lb_fase_c THEN //AND NOT IsNull(ldt_f_alta_fase_c) THEN
			ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
										" and mid(fase_afectada,3,1) = '1' and IsNull(f_reposicion_fase_c)"
											
			IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
				ls_fase_afect += '1'
			ELSE
				ls_fase_afect += '0'
			END IF
			
			IF ls_fase_afect <> '000' THEN
				IF pi_tipo_instalacion > fgci_tipo_ct AND li_tipo_instalacion <= fgci_tipo_ct THEN
					ls_fases_extras = wf_det_perdida_ct(ls_fase_afect, pi_tipo_conexion, pi_tipo_ct)
				ELSE
					ls_fases_extras = ls_fase_afect
				END IF
				IF ls_fases_extras <> '' THEN
					IF Mid(ls_fases_extras,1,1) = '1' AND NOT IsNull(ldt_f_rep_fase_a) THEN
						lb_fase_a = FALSE
						IF ls_mens_parcial = "" THEN
							ls_mens_parcial = "(" + ls_nom_instalacion + ")"
						END IF
					END IF	
					IF Mid(ls_fases_extras,2,1) = '1' AND NOT IsNull(ldt_f_rep_fase_b) THEN
						lb_fase_b = FALSE
						IF ls_mens_parcial = "" THEN
							ls_mens_parcial = "(" + ls_nom_instalacion + ")"
						END IF
					END IF	
					IF Mid(ls_fases_extras,3,1) = '1' AND NOT IsNull(ldt_f_rep_fase_c) THEN
						lb_fase_c = FALSE
						IF ls_mens_parcial = "" THEN
							ls_mens_parcial = "(" + ls_nom_instalacion + ")"
						END IF
					END IF	
				END IF
			END IF
		
		ELSE // red trif$$HEX1$$e100$$ENDHEX$$sica. Se busca sin tener en cuenta las fases
			ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
									   " and IsNull(f_reposicion)"
										
			IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
				lb_fase_a = FALSE
				lb_fase_b = FALSE
				lb_fase_c = FALSE
			END IF
		END IF
		
		IF (lb_fase_a OR lb_fase_b OR lb_fase_c) THEN
			FETCH lc_padres INTO :ll_nro_instalacion, :ls_nom_instalacion, :li_tipo_instalacion;
		END IF
		ls_mens += ls_mens_parcial
		ls_mens_parcial = ""
		
	LOOP
	
	CLOSE lc_padres;
	
	// Se realiza ahora la b$$HEX1$$fa00$$ENDHEX$$squeda en bd para otras incidencias
	IF (lb_fase_a OR lb_fase_b OR lb_fase_c) THEN
		
		//datetime ldt_f_int_alta_a,ldt_f_int_alta_b,ldt_f_int_alta_c
		//datetime ldt_f_int_rep,ldt_f_int_rep_a,ldt_f_int_rep_b,ldt_f_int_rep_c
		//String ls_fase_int
		
//		DECLARE lc_interrup_padres CURSOR FOR
//			SELECT "SGD_INTERRUPCION"."NRO_INSTALACION",
//					 "SGD_INTERRUPCION"."FASE_AFECTADA",
//					 "SGD_INTERRUPCION"."F_REPOSICION",
//					 "SGD_INTERRUPCION"."F_REPOSICION_FASE_A",
//					 "SGD_INTERRUPCION"."F_REPOSICION_FASE_B",
//					 "SGD_INTERRUPCION"."F_REPOSICION_FASE_C",
//					 "SGD_INSTALACION"."TIPO_INSTALACION"
//			FROM  "SGD_INTERRUPCION",   
//					"SGD_INSTALACION"
//			WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" in
//							 (SELECT "NRO_INSTALACION" 
//							  FROM "SGD_INSTALACION"
//							  START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre And BDI_JOB = 0
//							  CONNECT BY PRIOR  "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" And BDI_JOB = 0 )
//			  AND	"SGD_INTERRUPCION"."NRO_INSTALACION" = "SGD_INSTALACION"."NRO_INSTALACION" AND
//					"SGD_INTERRUPCION"."NRO_INCIDENCIA" <> :il_nro_incidencia ;
		DECLARE lc_interrup_padres CURSOR FOR
			SELECT sgd_interrupcion.nro_instalacion,
					 sgd_interrupcion.tipo_instalacion,
					 sgd_interrupcion.nro_incidencia,
				decode(f_alta_fase_a, null, '0', decode(f_reposicion_fase_a,null,'1','0')) || 
				decode(f_alta_fase_b, null, '0', decode(f_reposicion_fase_b,null,'1','0')) || 
				decode(f_alta_fase_c, null, '0', decode(f_reposicion_fase_c,null,'1','0'))
			FROM 
				  "SGD_INTERRUPCION"   
			WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" in
					 (SELECT "NRO_INSTALACION" 
					  FROM "SGD_INSTALACION"
					  START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre AND BDI_JOB = 0 
					  CONNECT BY PRIOR  "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" AND BDI_JOB = 0) AND
				"SGD_INTERRUPCION"."NRO_INCIDENCIA" <> :il_nro_incidencia AND
				"SGD_INTERRUPCION"."F_REPOSICION" IS NULL;
		
		OPEN lc_interrup_padres;
	
		IF SQLCA.SQLCode = 0 THEN
			// Se trae cada instalaci$$HEX1$$f300$$ENDHEX$$n y se busca en la dw de las interrupciones de la incidencia
			FETCH lc_interrup_padres	
			INTO :ll_nro_inst_int, :li_tipo_instalacion, :ll_nro_incidencia, :ls_fase_afect;
//			
			DO WHILE SQLCA.SQLCode = 0 AND (lb_fase_a OR lb_fase_b OR lb_fase_c)
				IF gb_red_trifasica = FALSE THEN
					ls_mens_parcial = ""									
					// Si el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n es un CT o superior, puede que afecte la interrupci$$HEX1$$f300$$ENDHEX$$n 
					// encontrada a m$$HEX1$$e100$$ENDHEX$$s fases por debajo del CT. Se consulta la tabla de decision
					IF pi_tipo_instalacion > fgci_tipo_ct AND li_tipo_instalacion <= fgci_tipo_ct THEN
						ls_fases_extras = wf_det_perdida_ct(ls_fase_afect, pi_tipo_conexion, pi_tipo_ct)
					ELSE
						IF NOT IsNull(ldt_f_rep_fase_a) AND Mid(ls_fase_afect,1,1) = '1' THEN
							ls_fases_extras = '1'
						ELSE
							ls_fases_extras = '0'
						END IF
						IF NOT IsNull(ldt_f_rep_fase_b) AND Mid(ls_fase_afect,2,1) = '1' THEN
							ls_fases_extras += '1'
						ELSE
							ls_fases_extras += '0'
						END IF
						IF NOT IsNull(ldt_f_rep_fase_c) AND Mid(ls_fase_afect,3,1) = '1' THEN
							ls_fases_extras += '1'
						ELSE
							ls_fases_extras += '0'
						END IF
						//ls_fases_extras = ls_fase_afect
					END IF
					IF ls_fases_extras <> '' THEN
						SELECT NOM_INSTALACION
						INTO :ls_nom_instalacion
						FROM SGD_INSTALACION
						WHERE NRO_INSTALACION = :ll_nro_inst_int and BDI_JOB = 0 AND ESTADO = 0;
						
						IF SQLCA.SQLCode <> 0 THEN
							ls_nom_instalacion = 'Desconocida'
						END IF
						
						IF Mid(ls_fases_extras,1,1) = '1' THEN
							lb_fase_a = FALSE
							IF ls_mens_parcial = "" THEN
								ls_mens_parcial = "(" + ls_nom_instalacion + ", Incidencia " + string(ll_nro_incidencia) + ")"
							END IF

						END IF	
						IF Mid(ls_fases_extras,2,1) = '1' THEN
							lb_fase_b = FALSE
							IF ls_mens_parcial = "" THEN
								ls_mens_parcial = "(" + ls_nom_instalacion + ", Incidencia " + string(ll_nro_incidencia) + ")"
							END IF

						END IF	
						IF Mid(ls_fases_extras,3,1) = '1' THEN
							lb_fase_c = FALSE
							IF ls_mens_parcial = "" THEN
								ls_mens_parcial = "(" + ls_nom_instalacion + ", Incidencia " + string(ll_nro_incidencia) + ")"
							END IF
						END IF	
					END IF
				ELSE
					SELECT NOM_INSTALACION
					INTO :ls_nom_instalacion
					FROM SGD_INSTALACION
					WHERE NRO_INSTALACION = :ll_nro_inst_int and BDI_JOB = 0 AND ESTADO = 0;
					
					IF SQLCA.SQLCode <> 0 THEN
						ls_nom_instalacion = 'Desconocida'
					END IF
					
					lb_fase_a = FALSE
					lb_fase_b = FALSE
					lb_fase_c = FALSE
					ls_mens = "(" + ls_nom_instalacion + ", Incidencia " + string(ll_nro_incidencia) + ")"
				END IF
					
				IF (lb_fase_a OR lb_fase_b OR lb_fase_c) THEN
					FETCH lc_interrup_padres
					INTO :ll_nro_inst_int,
						  :li_tipo_instalacion, :ll_nro_incidencia, :ls_fase_afect;

					ls_mens += ls_mens_parcial
					ls_mens_parcial = ""
				END IF
			LOOP
		END IF
			
		CLOSE lc_interrup_padres;
	
	END IF
	
	ls_texto_fases = "("
	IF lb_fase_a THEN
		ls_fases_permitidas = '1' 
	ELSE
		ls_texto_fases = ls_texto_fases + "Fase " + gs_fase_a
		ls_fases_permitidas = '0'
	END IF
	
	IF lb_fase_b THEN
		ls_fases_permitidas = ls_fases_permitidas + '1' 
	ELSE
		IF ls_texto_fases <> "(" THEN
			ls_texto_fases = ls_texto_fases + ", "
		END IF
		ls_texto_fases = ls_texto_fases + "Fase " + gs_fase_b
		
		ls_fases_permitidas = ls_fases_permitidas + '0'
	END IF
	
	IF lb_fase_c THEN
		ls_fases_permitidas = ls_fases_permitidas + '1' 
	ELSE
		IF ls_texto_fases <> "(" THEN
			ls_texto_fases = ls_texto_fases + ", "
		END IF
		ls_texto_fases = ls_texto_fases + "Fase " + gs_fase_c
		
		ls_fases_permitidas = ls_fases_permitidas + '0'
	END IF
	
	ls_texto_fases = ls_texto_fases + ")"

	IF ls_fases_permitidas <> '111' THEN
		ps_mensaje = "No se puede resolver la Interrupci$$HEX1$$f300$$ENDHEX$$n "
		IF NOT gb_red_trifasica THEN
			ps_mensaje +=  " " + ls_texto_fases
		END IF 
		ps_mensaje += " debido a que existe una Interrupci$$HEX1$$f300$$ENDHEX$$n pendiente en una Instalaci$$HEX1$$f300$$ENDHEX$$n superior " + ls_mens 
	END IF
ELSE
	ps_mensaje = "No se puede marcar la interrupci$$HEX1$$f300$$ENDHEX$$n debido que no se han podido determinar las Instalaciones superiores de la Instalaci$$HEX1$$f300$$ENDHEX$$n interrumpida." 
	ls_fases_permitidas = '000'
END IF

return ls_fases_permitidas 


end function

public function string wf_valida_int_cerradas_padre (ref string ps_mensaje, integer pi_tipo_conexion, integer pi_tipo_ct, integer pi_tipo_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_valida_int_cerradas_padre
// 
// Objetivo:  Funci$$HEX1$$f300$$ENDHEX$$n que comprueba que no exista ning$$HEX1$$fa00$$ENDHEX$$n padre con una interrupci$$HEX1$$f300$$ENDHEX$$n cerrada con 
// 			fecha de resoluci$$HEX1$$f300$$ENDHEX$$n mayor que la fecha de alta de la nueva interrupci$$HEX1$$f300$$ENDHEX$$n 
// 			o que no exista ning$$HEX1$$fa00$$ENDHEX$$n padre con una interrupci$$HEX1$$f300$$ENDHEX$$n pendiente que afecta a la fase que se
// 			desea interrumpir
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/09/2002	  LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Boolean lb_fase_a = true,  lb_fase_b = true, lb_fase_c = true
Long ll_nro_instalacion, ll_int_fase_a, ll_int_fase_b, ll_int_fase_c, ll_int, ll_ret, ll_fila
String ls_filtro_busqueda, ls_nom_instalacion, ls_fases_permitidas, ls_texto_fases, &
		 ls_fase_afect, ls_fases_extras
Datetime ldt_f_alta_fase_a, ldt_f_alta_fase_b, ldt_f_alta_fase_c, ldt_f_alta
Int li_tipo_instalacion

DECLARE lc_padres CURSOR FOR
	SELECT NRO_INSTALACION, 
			 NOM_INSTALACION,
			 TIPO_INSTALACION
	FROM SGD_INSTALACION
	START WITH NRO_INSTALACION = :il_nro_inst_padre AND BDI_JOB = 0
	CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION AND BDI_JOB = 0; 

ll_fila = dw_multiples_inter.Find('estado_int = 0 and tipo_conexion = ' + string(pi_tipo_conexion), &
								   1, dw_multiples_inter.RowCount())
IF ll_fila > 0 THEN
	ll_fila = ids_problemas.find("nom_instalacion = '" + dw_multiples_inter.GetItemString(ll_fila, 'nom_instalacion_2') + "'",&
							 1, ids_problemas.RowCount())
	IF ll_fila > 0 THEN
		ps_mensaje = ids_problemas.getItemString(ll_fila,'descripcion')
	ELSE
		ps_mensaje = "No se puede marcar la interrupci$$HEX1$$f300$$ENDHEX$$n debido a que existe una interrupci$$HEX1$$f300$$ENDHEX$$n pendiente en una Instalaci$$HEX1$$f300$$ENDHEX$$n superior o que la fecha de alta es menor que la Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n de otra interrupci$$HEX1$$f300$$ENDHEX$$n resuelta sobre una Instalaci$$HEX1$$f300$$ENDHEX$$n de nivel superior."
	END IF
	ls_fases_permitidas = '000'
	dw_multiples_inter.SetItem(il_fila, 'estado_int', 0)
	
ELSEIF dw_multiples_inter.Find('estado_int = 1 and tipo_conexion = ' + string(pi_tipo_conexion), &
								   1, dw_multiples_inter.RowCount()) > 0 THEN
									
	ls_fases_permitidas = '111'
	dw_multiples_inter.SetItem(il_fila, 'estado_int', 1)
ELSE

	OPEN lc_padres;
	
	ldt_f_alta = dw_fechas_int.GetItemDatetime(1, 'f_alta')
	ldt_f_alta_fase_a = dw_fechas_int.GetItemDatetime(1, 'f_alta_fase_a')
	ldt_f_alta_fase_b = dw_fechas_int.GetItemDatetime(1, 'f_alta_fase_b')
	ldt_f_alta_fase_c = dw_fechas_int.GetItemDatetime(1, 'f_alta_fase_c')
	// Se busca en primer lugar en la dw de las interrupciones de la incidencia
	
	IF SQLCA.SQLCode = 0 THEN
		// Se trae cada instalaci$$HEX1$$f300$$ENDHEX$$n y se busca en la dw de las interrupciones de la incidencia
		FETCH lc_padres INTO :ll_nro_instalacion, :ls_nom_instalacion, :li_tipo_instalacion;
		
		DO WHILE SQLCA.SQLCode = 0 AND (lb_fase_a OR lb_fase_b OR lb_fase_c)
		
			IF gb_red_trifasica = FALSE THEN
				// Se busca en la fase A	
				IF lb_fase_a THEN //AND NOT IsNull(ldt_f_alta_fase_a) THEN
					ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
												" and mid(fase_afectada,1,1) = '1' and IsNull(f_reposicion_fase_a)"
					
					ll_ret = ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount())
					
					IF ll_ret > 0 THEN
						ls_fase_afect = '1'
							
					ELSE
						ls_filtro_busqueda = ""
						IF NOT IsNull(ldt_f_alta_fase_a) THEN
							ls_filtro_busqueda += " and (f_reposicion_fase_a > datetime('" + string(ldt_f_alta_fase_a) + "')" 
						END IF
						IF NOT IsNull(ldt_f_alta_fase_b) THEN
							IF ls_filtro_busqueda = "" THEN 
								ls_filtro_busqueda = " and ("
							ELSE
								ls_filtro_busqueda += " or "
							END IF
							ls_filtro_busqueda += "f_reposicion_fase_a > datetime('" + string(ldt_f_alta_fase_b) + "')" 
							
						END IF
						IF NOT IsNull(ldt_f_alta_fase_c) THEN
							IF ls_filtro_busqueda = "" THEN 
								ls_filtro_busqueda = " and ("
							ELSE
								ls_filtro_busqueda += " or "
							END IF
							ls_filtro_busqueda += "f_reposicion_fase_a > datetime('" + string(ldt_f_alta_fase_c) + "')" 
							
						END IF
						
						ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + ls_filtro_busqueda + ")"
	
	//				ll_ret = ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount())
						ll_ret = ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount())
						IF  ll_ret > 0 THEN
							//lb_fase_a = FALSE 
							ls_fase_afect = '1'
							//ls_fase_afect = wf_det_perdida_ct(ids_inter_incidencia.GetItemString(ll_ret,'fase_afectada'), pi_tipo_conexion, pi_tipo_ct)
						ELSE
							ls_fase_afect = '0'
							// A$$HEX1$$f100$$ENDHEX$$adir a dw de errores la instalaci$$HEX1$$f300$$ENDHEX$$n padre interrumpida, la fase y la descripci$$HEX1$$f300$$ENDHEX$$n del error
						END IF
					END IF
				ELSE
					ls_fase_afect = '0'
				END IF
				
				// Se busca en la fase B	
				IF lb_fase_b THEN //AND NOT IsNull(ldt_f_alta_fase_b) THEN
					ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
												" and mid(fase_afectada,2,1) = '1' and IsNull(f_reposicion_fase_b)"
					
					IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
						ls_fase_afect += '1'
					ELSE
						ls_filtro_busqueda = ""
						IF NOT IsNull(ldt_f_alta_fase_a) THEN
							ls_filtro_busqueda += " and (f_reposicion_fase_b > datetime('" + string(ldt_f_alta_fase_a) + "')" 
						END IF
						IF NOT IsNull(ldt_f_alta_fase_b) THEN
							IF ls_filtro_busqueda = "" THEN 
								ls_filtro_busqueda = " and ("
							ELSE
								ls_filtro_busqueda += " or "
							END IF
							ls_filtro_busqueda += "f_reposicion_fase_b > datetime('" + string(ldt_f_alta_fase_b) + "')" 
							
						END IF
						IF NOT IsNull(ldt_f_alta_fase_c) THEN
							IF ls_filtro_busqueda = "" THEN 
								ls_filtro_busqueda = " and ("
							ELSE
								ls_filtro_busqueda += " or "
							END IF
							ls_filtro_busqueda += "f_reposicion_fase_b > datetime('" + string(ldt_f_alta_fase_c) + "')" 
							
						END IF
						
						ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + ls_filtro_busqueda + ")"
						
	//			ll_ret = ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount())
	
						IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
							//lb_fase_b = FALSE
							ls_fase_afect += '1'
						ELSE
							ls_fase_afect += '0'
						END IF
					END IF
				ELSE
					ls_fase_afect += '0'
				END IF
		
				// Se busca en la fase C	
				IF lb_fase_c THEN //AND NOT IsNull(ldt_f_alta_fase_c) THEN
					ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
												" and mid(fase_afectada,3,1) = '1' and IsNull(f_reposicion_fase_c)"
												
					IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
						ls_fase_afect += '1'
					ELSE
						ls_filtro_busqueda = ""
						IF NOT IsNull(ldt_f_alta_fase_a) THEN
							ls_filtro_busqueda += " and (f_reposicion_fase_c > datetime('" + string(ldt_f_alta_fase_a) + "')" 
						END IF
						IF NOT IsNull(ldt_f_alta_fase_b) THEN
							IF ls_filtro_busqueda = "" THEN 
								ls_filtro_busqueda = " and ("
							ELSE
								ls_filtro_busqueda += " or "
							END IF
							ls_filtro_busqueda += "f_reposicion_fase_c > datetime('" + string(ldt_f_alta_fase_b) + "')" 
							
						END IF
						IF NOT IsNull(ldt_f_alta_fase_c) THEN
							IF ls_filtro_busqueda = "" THEN 
								ls_filtro_busqueda = " and ("
							ELSE
								ls_filtro_busqueda += " or "
							END IF
							ls_filtro_busqueda += "f_reposicion_fase_c > datetime('" + string(ldt_f_alta_fase_c) + "')" 
							
						END IF
						
						ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + ls_filtro_busqueda + ")"
	
						IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
							//lb_fase_c = FALSE
							ls_fase_afect += '1'
						ELSE
							ls_fase_afect += '0'
						END IF
					END IF
				ELSE
					ls_fase_afect += '0'
				END IF
				
				IF ls_fase_afect <> '000' THEN
					IF pi_tipo_instalacion > fgci_tipo_ct AND li_tipo_instalacion <= fgci_tipo_ct THEN
						ls_fases_extras = wf_det_perdida_ct(ls_fase_afect, pi_tipo_conexion, pi_tipo_ct)
					ELSE
						ls_fases_extras = ls_fase_afect
					END IF
					IF ls_fases_extras <> '' THEN
						IF Mid(ls_fases_extras,1,1) = '1' AND NOT IsNull(ldt_f_alta_fase_a) THEN
							lb_fase_a = FALSE
						END IF	
						IF Mid(ls_fases_extras,2,1) = '1' AND NOT IsNull(ldt_f_alta_fase_b) THEN
							lb_fase_b = FALSE
						END IF	
						IF Mid(ls_fases_extras,3,1) = '1' AND NOT IsNull(ldt_f_alta_fase_c) THEN
							lb_fase_c = FALSE
						END IF	
					END IF
				END IF
			
			ELSE // red trif$$HEX1$$e100$$ENDHEX$$sica. Se busca sin tener en cuenta las fases
				ls_filtro_busqueda = "nro_instalacion = " + String(ll_nro_instalacion) + &
											" and f_reposicion > datetime('" + string(ldt_f_alta) + "')" + &
											" and f_alta < datetime('" + string(ldt_f_alta) + "')" + &
											" and not IsNull(f_reposicion)"
											
				IF ids_inter_incidencia.Find(ls_filtro_busqueda, 1, ids_inter_incidencia.RowCount()) > 0 THEN
					lb_fase_a = FALSE
					lb_fase_b = FALSE
					lb_fase_c = FALSE
				END IF
			END IF
			
			IF (lb_fase_a OR lb_fase_b OR lb_fase_c) THEN
				FETCH lc_padres INTO :ll_nro_instalacion, :ls_nom_instalacion, :li_tipo_instalacion;
			END IF
			
		LOOP
		
		CLOSE lc_padres;
		
		// Se realiza ahora la b$$HEX1$$fa00$$ENDHEX$$squeda en bd para otras incidencias
		IF (lb_fase_a OR lb_fase_b OR lb_fase_c) THEN
			
			datetime ldt_f_int_alta,ldt_f_int_alta_a,ldt_f_int_alta_b,ldt_f_int_alta_c
			datetime ldt_f_int_rep,ldt_f_int_rep_a,ldt_f_int_rep_b,ldt_f_int_rep_c
			String ls_fase_int
			
			DECLARE lc_interrup_padres CURSOR FOR
				SELECT "SGD_INTERRUPCION"."NRO_INSTALACION",
						 "SGD_INTERRUPCION"."FASE_AFECTADA",
						 "SGD_INTERRUPCION"."F_ALTA",
						 "SGD_INTERRUPCION"."F_ALTA_FASE_A",
						 "SGD_INTERRUPCION"."F_ALTA_FASE_B",
						 "SGD_INTERRUPCION"."F_ALTA_FASE_C",
						 "SGD_INTERRUPCION"."F_REPOSICION",
						 "SGD_INTERRUPCION"."F_REPOSICION_FASE_A",
						 "SGD_INTERRUPCION"."F_REPOSICION_FASE_B",
						 "SGD_INTERRUPCION"."F_REPOSICION_FASE_C",
						 "SGD_INTERRUPCION"."TIPO_INSTALACION"
				FROM  "SGD_INTERRUPCION"
				WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" in
								 (SELECT "NRO_INSTALACION" 
								  FROM "SGD_INSTALACION"
								  START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre And BDI_JOB = 0
								  CONNECT BY PRIOR  "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" And BDI_JOB = 0 )
				  AND	"SGD_INTERRUPCION"."NRO_INCIDENCIA" <> :il_nro_incidencia  ;
			
			OPEN lc_interrup_padres;
		
			IF SQLCA.SQLCode = 0 THEN
				// Se trae cada instalaci$$HEX1$$f300$$ENDHEX$$n y se busca en la dw de las interrupciones de la incidencia
				FETCH lc_interrup_padres 
				INTO :ll_nro_instalacion, 
					  :ls_fase_int,
					  :ldt_f_int_alta,
					  :ldt_f_int_alta_a,
					  :ldt_f_int_alta_b,
					  :ldt_f_int_alta_c,
					  :ldt_f_int_rep,
					  :ldt_f_int_rep_a,
					  :ldt_f_int_rep_b,
					  :ldt_f_int_rep_c,
					  :li_tipo_instalacion;
			
				DO WHILE SQLCA.SQLCode = 0 AND (lb_fase_a OR lb_fase_b OR lb_fase_c)
					IF gb_red_trifasica = FALSE THEN
						IF lb_fase_a THEN //AND NOT IsNull(ldt_f_alta_fase_a) THEN
							IF Mid(ls_fase_int,1,1) = '1' AND IsNull(ldt_f_int_rep_a) THEN
								ls_fase_afect = '1'
							ELSE	
								IF (NOT IsNull(ldt_f_int_rep_a)) AND  +&
									((NOT IsNull(ldt_f_alta_fase_a) AND ldt_f_int_alta_a < ldt_f_alta_fase_a and ldt_f_int_rep_a > ldt_f_alta_fase_a) OR & 
									 (NOT IsNull(ldt_f_alta_fase_b) AND ldt_f_int_alta_a < ldt_f_alta_fase_b and ldt_f_int_rep_a > ldt_f_alta_fase_b) OR &
									 (NOT IsNull(ldt_f_alta_fase_c) AND ldt_f_int_alta_a < ldt_f_alta_fase_c and ldt_f_int_rep_a > ldt_f_alta_fase_c)) THEN
									
									ls_fase_afect = '1'
								ELSE
									ls_fase_afect = '0'
								END IF
							END IF
						ELSE
							ls_fase_afect = '0'
						END IF
						
						IF lb_fase_b THEN //AND NOT IsNull(ldt_f_alta_fase_a) THEN
							IF Mid(ls_fase_int,2,1) = '1' AND IsNull(ldt_f_int_rep_b) THEN
								ls_fase_afect += '1'
							ELSE	
								IF (NOT IsNull(ldt_f_int_rep_b)) AND +&
									((NOT IsNull(ldt_f_alta_fase_a) AND ldt_f_int_alta_b < ldt_f_alta_fase_a and ldt_f_int_rep_b > ldt_f_alta_fase_a) OR & 
									 (NOT IsNull(ldt_f_alta_fase_b) AND ldt_f_int_alta_b < ldt_f_alta_fase_b and ldt_f_int_rep_b > ldt_f_alta_fase_b) OR &
									 (NOT IsNull(ldt_f_alta_fase_c) AND ldt_f_int_alta_b < ldt_f_alta_fase_c and ldt_f_int_rep_b > ldt_f_alta_fase_c)) THEN
		
									 ls_fase_afect += '1'
								ELSE
									ls_fase_afect += '0'
								END IF
							END IF
						ELSE
							ls_fase_afect += '0'
						END IF
		
						IF lb_fase_c THEN //AND NOT IsNull(ldt_f_alta_fase_a) THEN
							IF Mid(ls_fase_int,3,1) = '1' AND IsNull(ldt_f_int_rep_c) THEN
								ls_fase_afect += '1'
							ELSE	
								IF (NOT IsNull(ldt_f_int_rep_c)) AND +&
									((NOT IsNull(ldt_f_alta_fase_a) AND ldt_f_int_alta_c < ldt_f_alta_fase_a and ldt_f_int_rep_c > ldt_f_alta_fase_a) OR & 
									 (NOT IsNull(ldt_f_alta_fase_b) AND ldt_f_int_alta_c < ldt_f_alta_fase_b and ldt_f_int_rep_c > ldt_f_alta_fase_b) OR &
									 (NOT IsNull(ldt_f_alta_fase_c) AND ldt_f_int_alta_c < ldt_f_alta_fase_c and ldt_f_int_rep_c > ldt_f_alta_fase_c)) THEN
		
									 ls_fase_afect += '1'
								ELSE
									ls_fase_afect += '0'
								END IF
							END IF
						ELSE
							ls_fase_afect += '0'
						END IF
		
											
						// Si el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n es un CT o superior, puede que afecte la interrupci$$HEX1$$f300$$ENDHEX$$n 
						// encontrada a m$$HEX1$$e100$$ENDHEX$$s fases por debajo del CT. Se consulta la tabla de decision
						IF pi_tipo_instalacion > fgci_tipo_ct AND li_tipo_instalacion <= fgci_tipo_ct THEN
							ls_fases_extras = wf_det_perdida_ct(ls_fase_afect, pi_tipo_conexion, pi_tipo_ct)
						ELSE
							ls_fases_extras = ls_fase_afect
						END IF
						IF ls_fases_extras <> '' THEN
							IF Mid(ls_fases_extras,1,1) = '1' THEN
								lb_fase_a = FALSE
							END IF	
							IF Mid(ls_fases_extras,2,1) = '1' THEN
								lb_fase_b = FALSE
							END IF	
							IF Mid(ls_fases_extras,3,1) = '1' THEN
								lb_fase_c = FALSE
							END IF	
						END IF
					ELSE
						IF IsNull(ldt_f_int_rep) OR ((NOT IsNull(ldt_f_int_rep)) AND ldt_f_int_alta < ldt_f_int_rep and ldt_f_int_rep > ldt_f_alta) THEN
							lb_fase_a = FALSE
							lb_fase_b = FALSE
							lb_fase_c = FALSE
						END IF
					END IF
						
					IF (lb_fase_a OR lb_fase_b OR lb_fase_c) THEN
						FETCH lc_interrup_padres 
						INTO :ll_nro_instalacion, 
							  :ls_fase_int,
							  :ldt_f_int_alta,
						  	  :ldt_f_int_alta_a,
					  		  :ldt_f_int_alta_b,
					  		  :ldt_f_int_alta_c,
							  :ldt_f_int_rep,
							  :ldt_f_int_rep_a,
							  :ldt_f_int_rep_b,
							  :ldt_f_int_rep_c,
							  :li_tipo_instalacion;
					END IF
				LOOP
			END IF
				
			CLOSE lc_interrup_padres;
		
		END IF
		IF NOT gb_red_trifasica THEN
			ls_texto_fases = "("
			IF lb_fase_a OR IsNull(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_a')) THEN
				ls_fases_permitidas = '1' 
			ELSE
				ls_texto_fases = ls_texto_fases + "Fase " + gs_fase_a
				ls_fases_permitidas = '0'
			END IF
			
			IF lb_fase_b OR IsNull(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_b')) THEN
				ls_fases_permitidas = ls_fases_permitidas + '1' 
			ELSE
				IF ls_texto_fases <> "(" THEN
					ls_texto_fases = ls_texto_fases + ", "
				END IF
				ls_texto_fases = ls_texto_fases + "Fase " + gs_fase_b
				
				ls_fases_permitidas = ls_fases_permitidas + '0'
			END IF
			
			IF lb_fase_c OR IsNull(dw_fechas_int.GetItemDatetime(1,'f_alta_fase_c')) THEN
				ls_fases_permitidas = ls_fases_permitidas + '1' 
			ELSE
				IF ls_texto_fases <> "(" THEN
					ls_texto_fases = ls_texto_fases + ", "
				END IF
				ls_texto_fases = ls_texto_fases + "Fase " + gs_fase_c
				
				ls_fases_permitidas = ls_fases_permitidas + '0'
			END IF
			
			ls_texto_fases = ls_texto_fases + ")"
		ELSE
			IF lb_fase_a = FALSE THEN
				ls_fases_permitidas = '000'
			ELSE
				ls_fases_permitidas = '111'
			END IF
		END IF
		IF ls_fases_permitidas <> '111' THEN
			ps_mensaje = "No se puede marcar la interrupci$$HEX1$$f300$$ENDHEX$$n "
			IF NOT gb_red_trifasica THEN
				ps_mensaje +=  " " + ls_texto_fases
			END IF 
			ps_mensaje += " debido a que existe una interrupci$$HEX1$$f300$$ENDHEX$$n pendiente en una Instalaci$$HEX1$$f300$$ENDHEX$$n superior o que la fecha de alta es menor que la Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n de otra interrupci$$HEX1$$f300$$ENDHEX$$n resuelta sobre una Instalaci$$HEX1$$f300$$ENDHEX$$n de nivel superior." 
			
			dw_multiples_inter.SetItem(il_fila, 'estado_int', 0) // no se puede interrumpir
		ELSE
			dw_multiples_inter.SetItem(il_fila, 'estado_int', 1) // se puede interrumpir
		END IF
	ELSE
		ps_mensaje = "No se puede marcar la interrupci$$HEX1$$f300$$ENDHEX$$n debido que no se han podido determinar las Instalaciones superiores de la Instalaci$$HEX1$$f300$$ENDHEX$$n interrumpida." 
		ls_fases_permitidas = '000'
	END IF
END IF

return ls_fases_permitidas 

end function

on w_inc_multiples_inter.create
int iCurrent
call super::create
this.dw_multiples_inter=create dw_multiples_inter
this.st_1=create st_1
this.cb_marcar=create cb_marcar
this.cb_desmarcar=create cb_desmarcar
this.gb_1=create gb_1
this.rb_marcar=create rb_marcar
this.rb_resolver=create rb_resolver
this.cbx_misma_fecha=create cbx_misma_fecha
this.cbx_fase_c=create cbx_fase_c
this.cbx_fase_a=create cbx_fase_a
this.cbx_fase_b=create cbx_fase_b
this.dw_fechas_int=create dw_fechas_int
this.gb_2=create gb_2
this.st_mensaje_espera=create st_mensaje_espera
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_multiples_inter
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_marcar
this.Control[iCurrent+4]=this.cb_desmarcar
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.rb_marcar
this.Control[iCurrent+7]=this.rb_resolver
this.Control[iCurrent+8]=this.cbx_misma_fecha
this.Control[iCurrent+9]=this.cbx_fase_c
this.Control[iCurrent+10]=this.cbx_fase_a
this.Control[iCurrent+11]=this.cbx_fase_b
this.Control[iCurrent+12]=this.dw_fechas_int
this.Control[iCurrent+13]=this.gb_2
this.Control[iCurrent+14]=this.st_mensaje_espera
end on

on w_inc_multiples_inter.destroy
call super::destroy
destroy(this.dw_multiples_inter)
destroy(this.st_1)
destroy(this.cb_marcar)
destroy(this.cb_desmarcar)
destroy(this.gb_1)
destroy(this.rb_marcar)
destroy(this.rb_resolver)
destroy(this.cbx_misma_fecha)
destroy(this.cbx_fase_c)
destroy(this.cbx_fase_a)
destroy(this.cbx_fase_b)
destroy(this.dw_fechas_int)
destroy(this.gb_2)
destroy(this.st_mensaje_espera)
end on

event open;call super::open;long ll_contador, ll_fila, ll_contador2,li_conta,ll_inst_unificada
Int li_red_trifasica, li_tabla_decision
DataWindow lds_lista
//Inicializaci$$HEX1$$f300$$ENDHEX$$n de las variables de instancia necesarias
//
idt_f_deteccion = gu_comunic.is_comunic.datval1
idt_fecha_sr = gu_comunic.is_comunic.datval2
idt_fecha_eb = gu_comunic.is_comunic.datval3
il_nro_inst_padre = gu_comunic.is_comunic.longval1
il_nro_incidencia = gu_comunic.is_comunic.longval2
ib_hay_brig_disp = (gu_comunic.is_comunic.longval3 > 0)
ib_hay_causa = (gu_comunic.is_comunic.longval4 > 0)
ii_estado_incid = gu_comunic.is_comunic.intval1
st_1.Text += " " + gu_comunic.is_comunic.strval1
ii_tipo_conexion = gu_comunic.is_comunic.Intval2
ii_tipo_instalacion = gu_comunic.is_comunic.Intval3
ii_tipo_ct = gu_comunic.is_comunic.Intval4
w_ventana_llamante = gu_comunic.is_comunic.w_llamante

il_inst_digit[] = gu_rf.il_instalaciones[]

IF gb_red_trifasica THEN
	li_red_trifasica = 1
ELSE
	li_red_trifasica = 0
END IF

SetPointer(HourGlass!)

ids_interrupcion = CREATE datastore
ids_inter_incidencia = CREATE datastore
ids_problemas = CREATE datastore

lds_lista = Message.PowerObjectParm

dw_fechas_int.Insertrow(0)
dw_fechas_int.SetItem(1, 'f_alta', fgnu_fecha_actual())

ids_inter_incidencia.dataobject='d_ins_2010_lista_interrupciones'

lds_lista.ShareData(ids_inter_incidencia)
//lds_lista.ShareData(dw_lista_interrupciones)

dw_multiples_inter.SetTransObject(SQLCA)
IF gb_tabla_decision THEN
	li_tabla_decision = 1 
ELSE
	li_tabla_decision = 0
END IF

select max(nro_inst_unificada) into :ll_inst_unificada from sgd_instalacion where nro_inst_padre = :gu_comunic.is_comunic.longval1;

dw_multiples_inter.Retrieve(gu_comunic.is_comunic.longval1, gu_comunic.is_comunic.longval2, &
									 gs_fase_a, gs_fase_b, gs_fase_c, gi_dias_antiguedad, li_red_trifasica, fgci_tipo_ct, &
									 fgci_tipo_subestacion_at,fgci_tipo_salida_at,fgci_tipo_subestacion,fgci_tipo_salida_mt, &
									 fgci_tipo_ct,fgci_tipo_transformador,fgci_tipo_salida_de_baja, &
									 li_tabla_decision,fgci_tipo_centro_reflexion,ll_inst_unificada)

// Pacho, incidencias compartidas SGI/Operacion

IF gb_operaciones_inst and upperbound(il_inst_digit[]) > 0 THEN
	FOR li_conta = 1 to upperbound(il_inst_digit[]) 
		ll_fila = dw_multiples_inter.find("nro_instalacion = " + string(il_inst_digit[li_conta]),1,dw_multiples_inter.rowcount())
		if ll_fila> 0 then
			dw_multiples_inter.deleterow(ll_fila)
		end if
	NEXT
END IF

FOR ll_contador2 = 1 TO 2 
	IF ll_contador2 = 1 THEN
		ids_inter_incidencia.SetFilter('Not IsNull(f_reposicion)')
	ELSE
		ids_inter_incidencia.SetFilter('IsNull(f_reposicion)')
	END IF
	ids_inter_incidencia.Filter()

	FOR ll_contador = 1 TO ids_inter_incidencia.RowCount()
		ll_fila =  dw_multiples_inter.Find("nro_instalacion=" + string(ids_inter_incidencia.GetItemNumber(ll_contador, 'nro_instalacion')),&
											1, dw_multiples_inter.RowCount()) 
											
		IF ll_fila > 0 THEN
			// Ajustamos las fechas de las interrupciones en la dw, ya que lo que hay en BD 
			// puede no ser lo que existe en la dw
			dw_multiples_inter.Setitem(ll_fila, 'f_alta', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_alta'))
			dw_multiples_inter.Setitem(ll_fila, 'f_reposicion', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_reposicion'))
			dw_multiples_inter.Setitem(ll_fila, 'f_alta_fase_a', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_alta_fase_a'))
			dw_multiples_inter.Setitem(ll_fila, 'f_reposicion_fase_a', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_reposicion_fase_a'))
			dw_multiples_inter.Setitem(ll_fila, 'f_alta_fase_b', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_alta_fase_b'))
			dw_multiples_inter.Setitem(ll_fila, 'f_reposicion_fase_b', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_reposicion_fase_b'))
			dw_multiples_inter.Setitem(ll_fila, 'f_alta_fase_c', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_alta_fase_c'))
			dw_multiples_inter.Setitem(ll_fila, 'f_reposicion_fase_c', ids_inter_incidencia.GetItemDatetime(ll_contador, 'f_reposicion_fase_c'))
	
	
		END IF
	NEXT
NEXT

ids_inter_incidencia.SetFilter("")
ids_inter_incidencia.Filter()

ids_interrupcion.dataobject = 'd_inc_multiples_inst_int'
ids_problemas.dataobject = 'd_desc_problemas'

dw_fechas_int.SetItem(1,'fase_seleccionada',0)
IF gb_red_trifasica THEN
	dw_fechas_int.modify("f_alta_fase_a.protect='1'")
	dw_fechas_int.modify("f_rep_fase_a.protect='1'")
	dw_fechas_int.modify("f_alta_fase_b.protect='1'")
	dw_fechas_int.modify("f_rep_fase_b.protect='1'")
	dw_fechas_int.modify("f_alta_fase_c.protect='1'")
	dw_fechas_int.modify("f_rep_fase_c.protect='1'")
	
ELSE
	//dw_fechas_int.SetItem(1,'fase_seleccionada',1)
	
	//dw_fechas_int.modify("f_alta.protect='1'")
	//dw_fechas_int.modify("f_reposicion.protect='1'")
	// Se comprueban las fases interrumpidas y no resueltas en instalaciones de nivel superior,
	// para no poder permitir definir interrupciones en estas fases en caso de existir

	//IF Mid(is_fases_validas,1,1) = '0' THEN
		dw_fechas_int.modify("f_alta_fase_a.protect='1'")
	//END IF	
	
	//IF Mid(is_fases_validas,2,1) = '0' THEN
		dw_fechas_int.modify("f_alta_fase_b.protect='1'")
	//END IF	
	
	//IF Mid(is_fases_validas,3,1) = '0' THEN
		dw_fechas_int.modify("f_alta_fase_c.protect='1'")
	//END IF	
	
	dw_fechas_int.modify("f_rep_fase_a.protect='1'")
	dw_fechas_int.modify("f_rep_fase_b.protect='1'")
	dw_fechas_int.modify("f_rep_fase_c.protect='1'")
END IF

SetPointer(Arrow!)
end event

event close;
ids_inter_incidencia.ShareDataOff()

If IsValid(ids_problemas) THEN Destroy(ids_problemas)
IF IsValid(ids_inter_incidencia) THEN DESTROY(ids_inter_incidencia)

CloseWithReturn(This, ids_interrupcion)




end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_inc_multiples_inter
end type

type dw_multiples_inter from u_inc_multiples_inter within w_inc_multiples_inter
integer x = 32
integer y = 148
integer width = 1989
integer height = 1028
integer taborder = 10
boolean bringtotop = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

event clicked;call super::clicked;long ll_contador, ll_inicio, ll_fin

IF row > 0 THEN
	IF keyDown(KeyShift!) AND il_ultima_fila > 0 THEN 
		IF row > il_ultima_fila THEN
			ll_inicio = il_ultima_fila
			ll_fin = row
		ELSE
			ll_inicio = row
			ll_fin = il_ultima_fila
		END IF
		SetPointer(HourGlass!)
		
		dw_multiples_inter.setredraw(false)
		
		FOR ll_contador = ll_inicio TO ll_fin
			//IF NOT This.IsSelected(ll_contador) THEN
				This.SelectRow(ll_contador, TRUE)
			//END IF
		NEXT
		
		dw_multiples_inter.setredraw(true)
		
		This.ScrolltoRow(ll_contador)
		SetPointer(Arrow!)
	ELSEIF keyDown(KeyControl!) THEN
		IF IsSelected(row) THEN
			this.selectrow(row,false)
		ELSE
			this.selectrow(row,true)
		END IF
	ELSE
		This.SelectRow(0,False)
		this.selectrow(row,true)
	END IF
	
	il_ultima_fila = row
	
	cb_marcar.enabled = This.GetSelectedRow(0) > 0
	cb_desmarcar.enabled = This.GetSelectedRow(0) > 0
	//dw_fechas_int.enabled = This.GetSelectedRow(0) > 0
	
	//IF dw_fechas_int.enabled THEN
		IF rb_marcar.checked THEN
			IF gb_red_Trifasica OR cbx_misma_fecha.Checked THEN
				dw_fechas_int.modify("f_alta.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_alta.protect='0'")
				dw_fechas_int.modify("f_reposicion.protect='1'")
				dw_fechas_int.modify("f_reposicion.background.color='" + gs_gris + "'")
			ELSE
				dw_fechas_int.modify("f_alta_fase_a.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_alta_fase_b.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_alta_fase_c.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_rep_fase_a.protect='1'")
				dw_fechas_int.modify("f_rep_fase_a.background.color='" + gs_gris + "'")
				dw_fechas_int.modify("f_rep_fase_b.protect='1'")
				dw_fechas_int.modify("f_rep_fase_b.background.color='" + gs_gris + "'")
				dw_fechas_int.modify("f_rep_fase_c.protect='1'")
				dw_fechas_int.modify("f_rep_fase_c.background.color='" + gs_gris + "'")
			END IF
		ELSE
			IF gb_red_Trifasica THEN
				dw_fechas_int.modify("f_reposicion.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_reposicion.protect='0'")
				dw_fechas_int.modify("f_alta.protect='1'")
				dw_fechas_int.modify("f_alta.background.color='" + gs_gris + "'")
			ELSE
				dw_fechas_int.modify("f_rep_fase_a.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_rep_fase_b.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_rep_fase_c.background.color='" + gs_blanco  + "'")
				dw_fechas_int.modify("f_alta_fase_a.protect='1'")
				dw_fechas_int.modify("f_alta_fase_a.background.color='" + gs_gris + "'")
				dw_fechas_int.modify("f_alta_fase_b.protect='1'")
				dw_fechas_int.modify("f_alta_fase_b.background.color='" + gs_gris + "'")
				dw_fechas_int.modify("f_alta_fase_c.protect='1'")
				dw_fechas_int.modify("f_alta_fase_c.background.color='" + gs_gris + "'")
			END IF
		END IF			
	//ELSE
//		dw_fechas_int.modify("f_alta.background.color='" + gs_gris  + "'")
//		dw_fechas_int.modify("f_reposicion.background.color='" + gs_gris  + "'")
//		dw_fechas_int.modify("f_alta_fase_a.background.color='" + gs_gris  + "'")
//		dw_fechas_int.modify("f_rep_fase_a.background.color='" + gs_gris  + "'")
//		dw_fechas_int.modify("f_alta_fase_b.background.color='" + gs_gris  + "'")
//		dw_fechas_int.modify("f_rep_fase_b.background.color='" + gs_gris  + "'")
//		dw_fechas_int.modify("f_alta_fase_c.background.color='" + gs_gris  + "'")
//		dw_fechas_int.modify("f_rep_fase_c.background.color='" + gs_gris  + "'")
//	END IF
	
END IF


end event

event sqlpreview;//
end event

event constructor;call super::constructor;IF gb_red_trifasica THEN
	This.modify("fases_interrumpidas_t.visible='0'")
	This.modify("fases_interrumpidas.visible='0'")
	This.modify("fase_afectada_t.visible='0'")
	This.modify("fase_afectada.visible='0'")
	This.modify("fecha_min_aviso_a_t.visible='0'")
	This.modify("fecha_min_aviso_a.visible='0'")
	This.modify("fecha_min_aviso_b_t.visible='0'")
	This.modify("fecha_min_aviso_b.visible='0'")
	This.modify("fecha_min_aviso_c_t.visible='0'")
	This.modify("fecha_min_aviso_c.visible='0'")
ELSE
	This.modify("fases_interrumpidas_t.x='1509'")
	This.modify("fases_interrumpidas.x='1536'")
	This.modify("fase_afectada_t.x='1847'")
	This.modify("fase_afectada.x='1861'")
	This.modify("avisos_pt_t.x='2222'")
	This.modify("avisos_pt.x='2222'")
	This.modify("fecha_min_aviso_a_t.x='2661'")
	This.modify("fecha_min_aviso_a.x='2661'")
	This.modify("fecha_min_aviso_b_t.x='3177'")
	This.modify("fecha_min_aviso_b.x='3177'")
	This.modify("fecha_min_aviso_c_t.x='3694'")
	This.modify("fecha_min_aviso_c.x='3694'")

	This.modify("fecha_min_aviso_a_t.Text='Fecha M$$HEX1$$ed00$$ENDHEX$$n. Aviso (" + gs_fase_a + ")'")
	This.modify("fecha_min_aviso_b_t.Text='Fecha M$$HEX1$$ed00$$ENDHEX$$n. Aviso (" + gs_fase_b + ")'")
	This.modify("fecha_min_aviso_c_t.Text='Fecha M$$HEX1$$ed00$$ENDHEX$$n. Aviso (" + gs_fase_c + ")'")
END IF
end event

event retrieveend;call super::retrieveend;IF fg_verifica_parametro("usa_trafo") THEN 
	
	// No se deben visualizar los trafos
	this.setfilter("tipo_instalacion <> " + string(fgci_tipo_transformador))
	This.Filter()
END IF
end event

type st_1 from statictext within w_inc_multiples_inter
integer x = 32
integer y = 64
integer width = 1989
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
string text = "Instalaciones hijas de "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_marcar from commandbutton within w_inc_multiples_inter
integer x = 2107
integer y = 880
integer width = 457
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Marcar/Resolver"
boolean default = true
end type

event clicked;int li_fila_interr , li_contador, li_lock_status = 0
long ll_nro_instalacion, ll_fila
string ls_fase_completar, ls_fase_a$$HEX1$$f100$$ENDHEX$$adir, ls_fecha_alta
Datetime ldt_f_nula

ids_interrupcion.reset()
ids_problemas.reset()
dw_fechas_int.AcceptText()

IF cbx_misma_fecha.checked AND NOT gb_red_trifasica THEN
	SetNull(ldt_f_nula)

	IF cbx_fase_a.checked THEN
		IF rb_marcar.checked THEN
			st_mensaje_espera.text = "Marcando interrupciones en la lista..."
			dw_fechas_int.SetItem(1, 'f_alta_fase_a', dw_fechas_int.GetItemDatetime(1, 'f_alta'))
		ELSE
			st_mensaje_espera.text = "Reponiendo interrupciones en la lista..."
			dw_fechas_int.SetItem(1, 'f_rep_fase_a', dw_fechas_int.GetItemDatetime(1, 'f_reposicion'))
		END IF
	ELSE
		dw_fechas_int.SetItem(1, 'f_alta_fase_a', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_a', ldt_f_nula)
	END IF
	IF cbx_fase_b.checked THEN
		IF rb_marcar.checked THEN
			dw_fechas_int.SetItem(1, 'f_alta_fase_b', dw_fechas_int.GetItemDatetime(1, 'f_alta'))
		ELSE
			dw_fechas_int.SetItem(1, 'f_rep_fase_b', dw_fechas_int.GetItemDatetime(1, 'f_reposicion'))
		END IF
	ELSE
		dw_fechas_int.SetItem(1, 'f_alta_fase_b', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_b', ldt_f_nula)
	END IF
	IF cbx_fase_c.checked THEN
		IF rb_marcar.checked THEN
			dw_fechas_int.SetItem(1, 'f_alta_fase_c', dw_fechas_int.GetItemDatetime(1, 'f_alta'))
		ELSE
			dw_fechas_int.SetItem(1, 'f_rep_fase_c', dw_fechas_int.GetItemDatetime(1, 'f_reposicion'))
		END IF
	ELSE
		dw_fechas_int.SetItem(1, 'f_alta_fase_c', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_c', ldt_f_nula)
	END IF
END IF
			
ll_fila = dw_multiples_inter.GetSelectedRow(0)
SetPointer(HourGlass!)
// Se valida de forma general cada fecha
IF wf_validar_fechas_gen() THEN
	//IF wf_comprobar_causa() THEN
		wf_valida_primer_aviso()
		
		// Pone a false para que tarde menos
		dw_multiples_inter.setredraw(false)
		st_mensaje_espera.visible =true

		// Se desbloquea la instalaci$$HEX1$$f300$$ENDHEX$$n padre si la ten$$HEX1$$ed00$$ENDHEX$$amos bloqueada
		gnu_u_transaction.uf_rollback(w_ventana_llamante.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(il_nro_inst_padre),true)

		// Se bloquea la instalaci$$HEX1$$f300$$ENDHEX$$n padre
		li_lock_status = gnu_u_transaction.uf_lock(true,w_ventana_llamante.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(il_nro_inst_padre))
		
		DO WHILE ll_fila > 0 AND li_lock_status = 0
			
			dw_multiples_inter.ScrollToRow(ll_fila)
			
			if li_lock_status <> -54 then
				il_fila = ll_fila
				// Se valida de manera individual (por instalaci$$HEX1$$f300$$ENDHEX$$n) las fechas
				IF wf_validar_fechas_indiv(dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion'), &
													dw_multiples_inter.GetItemString(ll_fila, 'nom_instalacion_2'), &
													dw_multiples_inter.GetItemNumber(ll_fila, 'tipo_conexion'), &
													dw_multiples_inter.GetItemNumber(ll_fila, 'tipo_ct'), &
													dw_multiples_inter.GetItemNumber(ll_fila, 'tipo_instalacion')) THEN
					
					ls_fase_completar = ''
					ls_fase_a$$HEX1$$f100$$ENDHEX$$adir = ''
					li_fila_interr = ids_interrupcion.InsertRow(0)
			
					ids_interrupcion.SetItem(li_fila_interr, 'nro_instalacion', dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion'))
					ids_interrupcion.SetItem(li_fila_interr, 'nom_instalacion', dw_multiples_inter.GetItemString(ll_fila, 'nom_instalacion'))
					ids_interrupcion.SetItem(li_fila_interr, 'tipo_instalacion', dw_multiples_inter.GetItemNumber(ll_fila, 'tipo_instalacion'))
					ids_interrupcion.SetItem(li_fila_interr, 'fase_instalacion', dw_multiples_inter.GetItemString(ll_fila, 'fase_instalacion'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_alta', dw_fechas_int.GetItemDatetime(1, 'f_alta'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_reposicion', dw_fechas_int.GetItemDatetime(1, 'f_reposicion'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_alta_fase_a', dw_fechas_int.GetItemDatetime(1, 'f_alta_fase_a'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_reposicion_fase_a', dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_a'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_alta_fase_b', dw_fechas_int.GetItemDatetime(1, 'f_alta_fase_b'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_reposicion_fase_b', dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_b'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_alta_fase_c', dw_fechas_int.GetItemDatetime(1, 'f_alta_fase_c'))
					ids_interrupcion.SetItem(li_fila_interr, 'f_reposicion_fase_c', dw_fechas_int.GetItemDatetime(1, 'f_rep_fase_c'))

					IF NOT gb_red_trifasica THEN
						FOR li_contador = 1 TO 3
							
							CHOOSE CASE li_contador
								CASE 1
									ls_fecha_alta = 'f_alta_fase_a'
								CASE 2
									ls_fecha_alta = 'f_alta_fase_b'
								CASE 3
									ls_fecha_alta = 'f_alta_fase_c'
							END CHOOSE
							
							IF (Not IsNull(dw_fechas_int.GetItemDatetime(1, ls_fecha_alta))) AND &
								Mid(dw_multiples_inter.GetItemString(ll_fila, 'fase_instalacion'),li_contador,1) = '1' THEN
				
								IF	ids_inter_incidencia.Find("nro_instalacion = " + string(dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion')) + &
																  " and IsNull("+ls_fecha_alta+")", 1, ids_inter_incidencia.RowCount()) > 0 THEN
									// La interrupci$$HEX1$$f300$$ENDHEX$$n ya existe. Se completa con la nueva fase interrumpida
									
									ls_fase_completar = ls_fase_completar + '1'
									ls_fase_a$$HEX1$$f100$$ENDHEX$$adir = ls_fase_a$$HEX1$$f100$$ENDHEX$$adir + '0'
								ELSE
									ls_fase_a$$HEX1$$f100$$ENDHEX$$adir = ls_fase_a$$HEX1$$f100$$ENDHEX$$adir + '1'
									ls_fase_completar = ls_fase_completar + '0'
								END IF
							ELSE
								ls_fase_completar = ls_fase_completar + '0'
								ls_fase_a$$HEX1$$f100$$ENDHEX$$adir = ls_fase_a$$HEX1$$f100$$ENDHEX$$adir + '0'
							END IF
						NEXT
						
						ids_interrupcion.SetItem(li_fila_interr, 'fase_completar', ls_fase_completar)
						ids_interrupcion.SetItem(li_fila_interr, 'fase_a$$HEX1$$f100$$ENDHEX$$adir', ls_fase_a$$HEX1$$f100$$ENDHEX$$adir)
					END IF		
				END IF
			END IF			
			dw_multiples_inter.SelectRow(ll_fila, false)
			
			// Se selecciona la siguiente incidencia seleccionada
			ll_fila = dw_multiples_inter.GetSelectedRow(0) // Es cero, porque se ha desmarcado la
																		  // anterior seleccionada
		LOOP
		st_mensaje_espera.visible = False
		dw_multiples_inter.setredraw(true)	
		
		gu_comunic.is_comunic.accion_retorno = "Marcar"
		
		IF ids_problemas.RowCount() > 0 THEN 
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido marcar/resolver interrupciones en todas las Instalaciones seleccionadas")
			OpenWithParm(w_problemas_multiples_inter, ids_problemas)
		END IF
		
		IF gu_comunic.is_comunic.accion_retorno = "Marcar" THEN
			gu_comunic.is_comunic.accion_retorno = cb_marcar.Text
			close(Parent)
		ELSE
			SetPointer(HourGlass!)
			dw_multiples_inter.setredraw(false)
			FOR ll_fila = 1 TO dw_multiples_inter.RowCount()
				dw_multiples_inter.SetItem(ll_fila, 'estado_int',2)
			NEXT
			dw_multiples_inter.setredraw(true)
			
		END IF
	//ELSE
	//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar una causa antes de que se resuelvan todas las interrupciones.")
	//END IF	
END IF

SetPointer(Arrow!)

end event

event constructor;This.Text = "Marcar"
end event

type cb_desmarcar from commandbutton within w_inc_multiples_inter
integer x = 2665
integer y = 880
integer width = 457
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Desmarcar"
end type

event clicked;String ls_fase_desmarcar, ls_fase_int
Integer li_fila_interr, li_pos, li_lock_status
Long ll_fila

IF NOT gb_red_trifasica THEN
	// Se obtienen las fases para desmarcar
	gu_comunic.is_comunic.strval1 = '' //gs_fase_a + gs_fase_b + gs_fase_c
	gu_comunic.is_comunic.strval2 = gs_fase_a + gs_fase_b + gs_fase_c
	Open(w_seleccion_fase)
END IF

IF gu_comunic.is_comunic.accion_retorno = "Seleccion" OR gb_red_trifasica THEN
	// Comprobaciones generales
	ids_interrupcion.reset()
	ids_problemas.reset()

	IF NOT gb_red_trifasica THEN
		ls_fase_desmarcar = gu_comunic.is_comunic.strval1
		
		ib_demarcar_a = Pos(ls_fase_desmarcar, gs_fase_a) > 0
		ib_demarcar_b = Pos(ls_fase_desmarcar, gs_fase_b) > 0
		ib_demarcar_c = Pos(ls_fase_desmarcar, gs_fase_c) > 0
	END IF
	
	//IF wf_comprobar_causa() THEN
		// Comprobaciones individuales
		ll_fila = dw_multiples_inter.GetSelectedRow(0)
		
		// Se desbloquea la instalaci$$HEX1$$f300$$ENDHEX$$n padre si la ten$$HEX1$$ed00$$ENDHEX$$amos bloqueada
		gnu_u_transaction.uf_rollback(w_ventana_llamante.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(il_nro_inst_padre),true)

		// Se bloquea la instalaci$$HEX1$$f300$$ENDHEX$$n padre
		li_lock_status = gnu_u_transaction.uf_lock(true,w_ventana_llamante.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(il_nro_inst_padre))
		DO WHILE ll_fila > 0 AND li_lock_status = 0
			// Se desbloquea si la ten$$HEX1$$ed00$$ENDHEX$$amos bloqueada
			dw_multiples_inter.ScrollToRow(ll_fila)
			
			if li_lock_status <> -54 then
			
				// Se valida de manera individual (por instalaci$$HEX1$$f300$$ENDHEX$$n) las fechas
				IF wf_validar_desmarcar_indiv(dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion'), &
														dw_multiples_inter.GetItemString(ll_fila, 'nom_instalacion')) THEN
			
					li_fila_interr = ids_interrupcion.InsertRow(0)
					ids_interrupcion.SetItem(li_fila_interr, 'nro_instalacion', dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion'))
					
					IF NOT gb_red_trifasica THEN
						// Se determinan las fases a desmarcar y las fases ya interrumpidas sin resolver
						
						// Fase A
						li_pos = ids_inter_incidencia.Find("nro_instalacion="+string(dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion')) + &
															  " and isnull(f_reposicion_fase_a) and (not isnull(f_alta_fase_a))", &
															  1, ids_inter_incidencia.RowCount())
						
						IF li_pos > 0 THEN
							ls_fase_int = '1'
							IF ib_demarcar_a THEN
								ls_fase_desmarcar = '1'
							ELSE
								ls_fase_desmarcar = '0'
							END IF
						ELSE
							ls_fase_desmarcar = '0'
							ls_fase_int = '0'
						END IF
						
						// Fase B
						li_pos = ids_inter_incidencia.Find("nro_instalacion="+string(dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion')) + &
															  " and isnull(f_reposicion_fase_b) and (not isnull(f_alta_fase_b))", &
															  1, ids_inter_incidencia.RowCount())
						
						IF li_pos > 0 THEN
							ls_fase_int = ls_fase_int + '1'
							IF ib_demarcar_b THEN
								ls_fase_desmarcar = ls_fase_desmarcar + '1'
							ELSE
								ls_fase_desmarcar = ls_fase_desmarcar + '0'
							END IF
						ELSE
							ls_fase_desmarcar = ls_fase_desmarcar + '0'
							ls_fase_int = ls_fase_int + '0'
						END IF
						
						// Fase C
						li_pos = ids_inter_incidencia.Find("nro_instalacion="+string(dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion')) + &
															  " and isnull(f_reposicion_fase_c) and (not isnull(f_alta_fase_c))", &
															  1, ids_inter_incidencia.RowCount())
						
						IF li_pos > 0 THEN
							ls_fase_int = ls_fase_int + '1'
							IF ib_demarcar_c THEN
								ls_fase_desmarcar = ls_fase_desmarcar + '1'
							ELSE
								ls_fase_desmarcar = ls_fase_desmarcar + '0'
							END IF
						ELSE
							ls_fase_desmarcar = ls_fase_desmarcar + '0'
							ls_fase_int = ls_fase_int + '0'
						END IF
					
						ids_interrupcion.SetItem(li_fila_interr, 'fase_completar', ls_fase_desmarcar)
						ids_interrupcion.SetItem(li_fila_interr, 'fase_a$$HEX1$$f100$$ENDHEX$$adir', ls_fase_int)
					END IF		
				//ELSE
				//	gnu_u_transaction.uf_commit(Parent.ParentWindow(),'sgd_instalacion','sgd_instalacion.nro_instalacion = ' + string(dw_multiples_inter.GetItemNumber(ll_fila, 'nro_instalacion')),true)
				END IF
			END IF
			
			dw_multiples_inter.SelectRow(ll_fila, false)
			
			// Se selecciona la siguiente incidencia seleccionada
			ll_fila = dw_multiples_inter.GetSelectedRow(0) // Es cero, porque se ha desmarcado la
																		  // anterior seleccionada
		LOOP
	
	//ELSE
	//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar una causa antes de tener resueltas todas las interrupciones.")
	//END IF
	IF ids_problemas.RowCount() = 0 THEN 
		gu_comunic.is_comunic.accion_retorno = "Marcar"
	END IF
	
END IF

ib_demarcar_a = False
ib_demarcar_b = False
ib_demarcar_c = False

IF ids_problemas.RowCount() > 0 THEN 
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido desmarcar las interrupciones en todas las Instalaciones seleccionadas")
	OpenWithParm(w_problemas_multiples_inter, ids_problemas)
END IF

IF gu_comunic.is_comunic.accion_retorno = "Marcar" THEN
	gu_comunic.is_comunic.accion_retorno = "Desmarcar"
	close(Parent)
ELSE
	cb_marcar.enabled = FALSE
	cb_desmarcar.enabled = FALSE
END IF


end event

type gb_1 from groupbox within w_inc_multiples_inter
integer x = 2053
integer y = 636
integer width = 1115
integer height = 428
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Interrupciones en Grupo"
end type

type rb_marcar from radiobutton within w_inc_multiples_inter
integer x = 2153
integer y = 752
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Marcar"
boolean checked = true
end type

event clicked;Datetime ldt_f_nula

SetNull(ldt_f_nula)

IF This.Checked THEN
	cb_marcar.Text = "Marcar"
	
	IF gb_red_Trifasica OR cbx_misma_fecha.Checked THEN
		dw_fechas_int.SetItem(1, 'f_reposicion', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_a', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_b', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_c', ldt_f_nula)		
		dw_fechas_int.modify("f_alta.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_alta.protect='0'")
		dw_fechas_int.modify("f_reposicion.protect='1'")
		dw_fechas_int.modify("f_reposicion.background.color='" + gs_gris + "'")
		dw_fechas_int.setitem(1, 'f_alta', fgnu_fecha_actual())
	ELSE   //IF dw_multiples_inter.GetSelectedRow(0) > 0 THEN
		dw_fechas_int.modify("f_alta_fase_a.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_alta_fase_a.protect='0'")
		dw_fechas_int.modify("f_alta_fase_b.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_alta_fase_b.protect='0'")
		dw_fechas_int.modify("f_alta_fase_c.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_alta_fase_c.protect='0'")
		dw_fechas_int.SetItem(1, 'f_reposicion', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_a', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_b', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_rep_fase_c', ldt_f_nula)
		dw_fechas_int.modify("f_rep_fase_a.protect='1'")
		dw_fechas_int.modify("f_rep_fase_a.background.color='" + gs_gris + "'")
		dw_fechas_int.modify("f_rep_fase_b.protect='1'")
		dw_fechas_int.modify("f_rep_fase_b.background.color='" + gs_gris + "'")
		dw_fechas_int.modify("f_rep_fase_c.protect='1'")
		dw_fechas_int.modify("f_rep_fase_c.background.color='" + gs_gris + "'")
	END IF
END IF
end event

type rb_resolver from radiobutton within w_inc_multiples_inter
integer x = 2670
integer y = 752
integer width = 466
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resolver"
end type

event clicked;datetime ldt_f_nula

SetNull(ldt_f_nula)

IF This.Checked THEN
	cb_marcar.Text = "Resolver"
	
	IF gb_red_Trifasica OR cbx_misma_fecha.Checked THEN
		dw_fechas_int.SetItem(1, 'f_alta', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_alta_fase_a', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_alta_fase_b', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_alta_fase_c', ldt_f_nula)
		dw_fechas_int.modify("f_reposicion.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_reposicion.protect='0'")
		dw_fechas_int.modify("f_alta.protect='1'")
		dw_fechas_int.modify("f_alta.background.color='" + gs_gris + "'")
		dw_fechas_int.setitem(1, 'f_reposicion', fgnu_fecha_actual())
	ELSE   //IF dw_multiples_inter.GetSelectedRow(0) > 0 THEN
		dw_fechas_int.modify("f_rep_fase_a.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_rep_fase_a.protect='0'")
		dw_fechas_int.modify("f_rep_fase_b.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_rep_fase_b.protect='0'")
		dw_fechas_int.modify("f_rep_fase_c.background.color='" + gs_blanco  + "'")
		dw_fechas_int.modify("f_rep_fase_c.protect='0'")
		dw_fechas_int.SetItem(1, 'f_alta_fase_a', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_alta_fase_b', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_alta_fase_c', ldt_f_nula)
		dw_fechas_int.SetItem(1, 'f_alta', ldt_f_nula)
		dw_fechas_int.modify("f_alta_fase_a.protect='1'")
		dw_fechas_int.modify("f_alta_fase_a.background.color='" + gs_gris + "'")
		dw_fechas_int.modify("f_alta_fase_b.protect='1'")
		dw_fechas_int.modify("f_alta_fase_b.background.color='" + gs_gris + "'")
		dw_fechas_int.modify("f_alta_fase_c.protect='1'")
		dw_fechas_int.modify("f_alta_fase_c.background.color='" + gs_gris + "'")
	END IF
END IF
end event

type cbx_misma_fecha from checkbox within w_inc_multiples_inter
integer x = 2642
integer y = 460
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "$$HEX1$$da00$$ENDHEX$$nica Fecha"
boolean checked = true
boolean lefttext = true
boolean righttoleft = true
end type

event clicked;DateTime ldt_f_nula

SetNull(ldt_f_nula)

IF This.Checked THEN
	cbx_fase_a.visible = True
	cbx_fase_b.visible = True
	cbx_fase_c.visible = True
	cbx_fase_a.checked = True
	cbx_fase_b.checked = True
	cbx_fase_c.checked = True
	
	dw_fechas_int.SetItem(1,"fase_seleccionada",0)
	IF rb_marcar.checked THEN
		dw_fechas_int.Modify("f_alta.protect='0'")
		dw_fechas_int.Modify("f_alta.background.color='"+gs_blanco+"'")
		dw_fechas_int.Modify("f_reposicion.protect='1'")
		dw_fechas_int.Modify("f_reposicion.background.color='"+gs_gris+"'")
	ELSE
		dw_fechas_int.Modify("f_reposicion.protect='0'")
		dw_fechas_int.Modify("f_reposicion.background.color='"+gs_blanco+"'")
		dw_fechas_int.Modify("f_alta.protect='1'")
		dw_fechas_int.Modify("f_alta.background.color='"+gs_gris+"'")
	END IF
//	dw_fechas_int.Modify("fase_seleccionada.background.color='"+gs_gris+"'")
//	dw_fechas_int.Modify("fase_a.protect='1'")
//	dw_fechas_int.Modify("fase_a.background.color='"+gs_gris+"'")
//	dw_fechas_int.Modify("fase_b.protect='1'")
//	dw_fechas_int.Modify("fase_b.background.color='"+gs_gris+"'")
//	dw_fechas_int.Modify("fase_c.protect='1'")
//	dw_fechas_int.Modify("fase_b.background.color='"+gs_gris+"'")
ELSE
	cbx_fase_a.visible = False
	cbx_fase_b.visible = False
	cbx_fase_c.visible = False
	dw_fechas_int.SetItem(1,"fase_seleccionada",1)
	IF rb_marcar.checked THEN
		dw_fechas_int.Modify("f_alta_fase_a.protect='0'")
		dw_fechas_int.Modify("f_alta_fase_a.background.color='"+gs_blanco+"'")
		dw_fechas_int.Modify("f_rep_fase_a.protect='1'")
		dw_fechas_int.Modify("f_rep_fase_a.background.color='"+gs_gris+"'")
		dw_fechas_int.Modify("f_alta_fase_b.protect='0'")
		dw_fechas_int.Modify("f_alta_fase_b.background.color='"+gs_blanco+"'")
		dw_fechas_int.Modify("f_rep_fase_b.protect='1'")
		dw_fechas_int.Modify("f_rep_fase_b.background.color='"+gs_gris+"'")
		dw_fechas_int.Modify("f_alta_fase_c.protect='0'")
		dw_fechas_int.Modify("f_alta_fase_c.background.color='"+gs_blanco+"'")
		dw_fechas_int.Modify("f_rep_fase_c.protect='1'")
		dw_fechas_int.Modify("f_rep_fase_c.background.color='"+gs_gris+"'")
	ELSE
		dw_fechas_int.Modify("f_alta_fase_a.protect='1'")
		dw_fechas_int.Modify("f_alta_fase_a.background.color='"+gs_gris+"'")
		dw_fechas_int.Modify("f_rep_fase_a.protect='0'")
		dw_fechas_int.Modify("f_rep_fase_a.background.color='"+gs_blanco+"'")
		dw_fechas_int.Modify("f_alta_fase_b.protect='1'")
		dw_fechas_int.Modify("f_alta_fase_b.background.color='"+gs_gris+"'")
		dw_fechas_int.Modify("f_rep_fase_b.protect='0'")
		dw_fechas_int.Modify("f_rep_fase_b.background.color='"+gs_blanco+"'")
		dw_fechas_int.Modify("f_alta_fase_c.protect='1'")
		dw_fechas_int.Modify("f_alta_fase_c.background.color='"+gs_gris+"'")
		dw_fechas_int.Modify("f_rep_fase_c.protect='0'")
		dw_fechas_int.Modify("f_rep_fase_c.background.color='"+gs_blanco+"'")
	END IF
	dw_fechas_int.Modify("f_alta.protect='1'")
	dw_fechas_int.Modify("f_alta.background.color='"+gs_gris+"'")
	dw_fechas_int.Modify("f_reposicion.protect='1'")
	dw_fechas_int.Modify("f_reposicion.background.color='"+gs_gris+"'")

//	IF dw_multiples_inter.GetSelectedRow(0) > 0 THEN
//		IF Mid(is_fases_validas,1,1) = '1' THEN
//			dw_fechas_int.modify("f_alta_fase_a.background.color='" + gs_blanco  + "'")
//			dw_fechas_int.modify("f_alta_fase_a.protect='0'")
//		END IF
//		IF Mid(is_fases_validas,2,1) = '1' THEN
//			dw_fechas_int.modify("f_alta_fase_b.background.color='" + gs_blanco  + "'")
//			dw_fechas_int.modify("f_alta_fase_b.protect='0'")
//		END IF
//		IF Mid(is_fases_validas,3,1) = '1' THEN
//			dw_fechas_int.modify("f_alta_fase_c.background.color='" + gs_blanco  + "'")
//			dw_fechas_int.modify("f_alta_fase_c.protect='0'")
//		END IF
//		dw_fechas_int.SetItem(1, 'f_rep_fase_a', ldt_f_nula)
//		dw_fechas_int.SetItem(1, 'f_rep_fase_b', ldt_f_nula)
//		dw_fechas_int.SetItem(1, 'f_rep_fase_c', ldt_f_nula)
//		dw_fechas_int.modify("f_rep_fase_a.protect='1'")
//		dw_fechas_int.modify("f_rep_fase_a.background.color='" + gs_gris + "'")
//		dw_fechas_int.modify("f_rep_fase_b.protect='1'")
//		dw_fechas_int.modify("f_rep_fase_b.background.color='" + gs_gris + "'")
//		dw_fechas_int.modify("f_rep_fase_c.protect='1'")
//		dw_fechas_int.modify("f_rep_fase_c.background.color='" + gs_gris + "'")
//	END IF
////	dw_fechas_int.Modify("fase_seleccionada.background.color='"+gs_blanco+"'")
//	dw_fechas_int.Modify("fase_a.protect='0'")
//	dw_fechas_int.Modify("fase_a.background.color='"+gs_blanco+"'")
//	dw_fechas_int.Modify("fase_b.protect='0'")
//	dw_fechas_int.Modify("fase_b.background.color='"+gs_blanco+"'")
//	dw_fechas_int.Modify("fase_c.protect='0'")
//	dw_fechas_int.Modify("fase_b.background.color='"+gs_blanco+"'")
END IF

end event

event constructor;cbx_misma_fecha.visible = NOT gb_red_trifasica
end event

type cbx_fase_c from checkbox within w_inc_multiples_inter
integer x = 2798
integer y = 144
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fase C"
boolean checked = true
end type

event constructor;IF NOT gb_red_trifasica THEN
	This.Text = "Fase " + gs_fase_c
ELSE
	This.visible = FALSE
END IF

end event

type cbx_fase_a from checkbox within w_inc_multiples_inter
integer x = 2126
integer y = 144
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fase A"
boolean checked = true
end type

event constructor;IF NOT gb_red_trifasica THEN
	This.Text = "Fase " + gs_fase_a
ELSE
	This.visible = FALSE
END IF
end event

type cbx_fase_b from checkbox within w_inc_multiples_inter
integer x = 2459
integer y = 144
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fase B"
boolean checked = true
end type

event constructor;IF NOT gb_red_trifasica THEN
	This.Text = "Fase " + gs_fase_b
ELSE
	This.visible = FALSE
END IF
end event

type dw_fechas_int from datawindow within w_inc_multiples_inter
integer x = 2080
integer y = 120
integer width = 1065
integer height = 348
integer taborder = 40
string dataobject = "d_2301_fechas_int"
boolean border = false
boolean livescroll = true
end type

event constructor;This.Object.fase_a.Text='Fase ' + gs_fase_a
This.Object.fase_b.Text='Fase ' + gs_fase_b
This.Object.fase_c.Text='Fase ' + gs_fase_c

//This.modify("f_alta.background.color = '" + gs_gris  + "'")
This.modify("f_reposicion.background.color = '" + gs_gris  + "'")
This.modify("f_alta_fase_a.background.color = '" + gs_gris  + "'")
This.modify("f_rep_fase_a.background.color = '" + gs_gris  + "'")
This.modify("f_alta_fase_b.background.color = '" + gs_gris  + "'")
This.modify("f_rep_fase_b.background.color = '" + gs_gris  + "'")
This.modify("f_alta_fase_c.background.color = '" + gs_gris  + "'")
This.modify("f_rep_fase_c.background.color = '" + gs_gris  + "'")

//This.Modify("fase_seleccionada.protect='1'")
//This.Modify("fase_seleccionada.background.color='"+gs_gris+"'")
//This.Modify("fase_a.protect='1'")
//This.Modify("fase_a.background.color='"+gs_gris+"'")
//This.Modify("fase_b.protect='1'")
//This.Modify("fase_b.background.color='"+gs_gris+"'")
//This.Modify("fase_c.protect='1'")
//This.Modify("fase_b.background.color='"+gs_gris+"'")
//
//This.enabled = false

end event

type gb_2 from groupbox within w_inc_multiples_inter
integer x = 2048
integer y = 36
integer width = 1120
integer height = 516
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Fases a Interrumpir "
end type

type st_mensaje_espera from statictext within w_inc_multiples_inter
boolean visible = false
integer x = 87
integer y = 620
integer width = 1879
integer height = 140
boolean bringtotop = true
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79741120
boolean enabled = false
string text = "Marcando interrupciones en la lista..."
boolean focusrectangle = false
end type


HA$PBExportHeader$n_calculos_indicadores.sru
forward
global type n_calculos_indicadores from nonvisualobject
end type
end forward

global type n_calculos_indicadores from nonvisualobject
end type
global n_calculos_indicadores n_calculos_indicadores

type variables

datastore ids_hist_indisponibilidades

decimal{4} idec_indice_disponibilidad, idec_enr, idec_sce, idec_cpsm

decimal{4} idec_ipp = 0 , idec_ipp_0 = 1

end variables

forward prototypes
public function boolean uf_excluir_indisponibilidad (long pl_cod_causa, long pl_cod_activo)
public function decimal uf_calcular_ingresomensualregulado (long pl_activo, date pdate_fecha)
public function long uf_calcular_semana (date pdate_fecha, ref date pdate_f_hasta_semana_anterior)
public function decimal uf_calcular_cte_imrt_tycn (long pl_codigo_activo, long pl_anio, long pl_mes, long pl_ind_indisp_tycn_mes_actual)
public subroutine uf_calcular_indice_disponibilidad (long pl_activo, datetime pdt_fecha, ref decimal pdec_indisponibilidad, ref long pl_sce, ref long pl_cpsm, ref long pl_enr, ref decimal pdec_total_horas_compensadas)
public function decimal uf_calcular_compensacion_ens (long pl_codigo_activo, date pdate_f_desde, date pdate_f_hasta, decimal pdec_ingreso_mensual_regulado, long pl_ind_hida)
public function integer uf_calcular_indices_grupos_activos (datawindow pdw_indicadores_stn)
public function long uf_calcular_indisponibilidad_x_tycn (long pl_codigo_activo, date pdate_f_desde, date pdate_f_hasta)
public function decimal uf_calcular_cte_imrt_tycn_str (long pl_codigo_grupo, long pl_anio, long pl_mes, long pl_ind_indisp_tycn_mes_actual)
public subroutine uf_set_ipp (date pdate_fecha)
end prototypes

public function boolean uf_excluir_indisponibilidad (long pl_cod_causa, long pl_cod_activo);
//Se determina si esta indisponibilidad est$$HEX2$$e1002000$$ENDHEX$$excluida
//Causas excluidas: 
//							  1 FUERZA MAYOR
//							667 INSTRUCCI$$HEX1$$d300$$ENDHEX$$N CND   
//							668 MANTENIMIENTO
//							669 MANTENIMIENTO MAYOR
//							675 EXPANSION   
//							671 FORZADO                                           
//							672 FORZADO EXTERNO
//							676 CAT$$HEX1$$c100$$ENDHEX$$STROFE NATURAL
//							677 ACTOS DE TERRORISMO
//							678 PLAN DE ORDANAMIENTO TERRITORIAL
		
boolean lb_status = false
long ll_subtipo


SELECT SUBTIPO
  INTO :ll_subtipo
  FROM GI_CAUSA
 WHERE COD_CAUSA = :pl_cod_causa;


if ll_subtipo = 1 or ll_subtipo = 667 or ll_subtipo = 668 or ll_subtipo = 669 or ll_subtipo = 675 or &
	ll_subtipo = 676 or ll_subtipo = 677 or ll_subtipo = 678 then 
	lb_status = true
end if

if (ll_subtipo = 671 or ll_subtipo = 672) and (pl_cod_activo <> 0) then 
	lb_status = true
end if


return lb_status 



end function

public function decimal uf_calcular_ingresomensualregulado (long pl_activo, date pdate_fecha);long ll_rows, ll_cont, ll_segundos
long ll_disponibilidad, ll_secuencial, ll_cod_causa, ll_tipo_psm, ll_minutos, ll_activo_causante
string ls_consignacion_nacional, LS_AUXILIAR
datetime ldt_fecha_ocurrencia, ldt_fecha_posterior, ldt_fecha_ocurrencia_primera
date  ldate_f_desde, ldate_f_hasta
boolean lb_ultimo_registro= false, lb_excluir_indisponibilidad

dec{4} ldec_ipp, ldec_ipp_0, ldec_auxiliar, ldec_imr
dec{4} ldec_coste_reconocido, ldec_tasa_retorno, ldec_vida_util, ldec_paomr

ldec_imr = 0.0

//SELECT MAX(F_HASTA)
//  INTO :ldate_f_hasta
//  FROM GI_PARAMETROS_SCIC
// WHERE PARAMETRO = 'IPP'
//   AND F_HASTA < :pdate_fecha; 
//
//if not isnull(ldate_f_hasta) then 
//	
//	SELECT to_number(VALOR)
//	  INTO :ldec_ipp
//	  FROM GI_PARAMETROS_SCIC
//	 WHERE PARAMETRO = 'IPP'
//	   AND F_HASTA = :ldate_f_hasta;  
//
//	IF ISNULL(ldec_ipp) then ldec_ipp = 0
//
//	SELECT to_number(VALOR)
//	  INTO :ldec_ipp_0
//	  FROM GI_PARAMETROS_SCIC
//	 WHERE PARAMETRO = 'IPP_0';
//	 
//	IF ISNULL(ldec_ipp_0) then ldec_ipp_0 = 1
//	 

	 
if idec_ipp <> 0 then 
	
	SELECT COSTE_RECONOCIDO, TASA_RETORNO, VIDA_UTIL
	  INTO :ldec_coste_reconocido, :ldec_tasa_retorno, :ldec_vida_util
	  FROM SGD_DISPONIBILIDAD
    WHERE NRO_INSTALACION = :pl_activo; 

  	IF ISNULL(ldec_coste_reconocido) then ldec_coste_reconocido = 0
  	IF ISNULL(ldec_tasa_retorno) then ldec_tasa_retorno = 0
  	IF ISNULL(ldec_vida_util) then ldec_vida_util = 0

	SELECT to_number(VALOR)
	  INTO :ldec_paomr
	  FROM GI_PARAMETROS_SCIC
	 WHERE PARAMETRO = 'PAOMR'
	   AND F_HASTA > :pdate_fecha
		AND F_DESDE <= :pdate_fecha;
	 
  	IF ISNULL(ldec_paomr) then ldec_paomr = 0
	 
  
	ldec_auxiliar = (1 + ldec_tasa_retorno) ^ ( - (ldec_vida_util))
	
	if ldec_auxiliar = 1 then 
		ldec_auxiliar = ldec_paomr
	else
		ldec_auxiliar = ( ldec_tasa_retorno / ( 1 - ldec_auxiliar) ) + ldec_paomr
	end if
	
	ldec_imr = ldec_coste_reconocido / 12 * ldec_auxiliar * idec_ipp / idec_ipp_0
		
end if

return ldec_imr
end function

public function long uf_calcular_semana (date pdate_fecha, ref date pdate_f_hasta_semana_anterior);
long ll_day, ll_dayofweek
string ls_dayname
long ll_dia_inicio_semana, ll_dia_fin_semana
long ll_numero_semana
boolean lb_encontrado = false


ll_day = Day(pdate_fecha)
ls_dayname = DayName(pdate_fecha)

CHOOSE CASE ls_dayname
	CASE 'Monday' 
		ll_dayofweek = 1
	CASE 'Tuesday' 
		ll_dayofweek = 2
	CASE 'Wednesday' 
		ll_dayofweek = 3
	CASE 'Thursday' 
		ll_dayofweek = 4
	CASE 'Friday' 
		ll_dayofweek = 5
	CASE 'Saturday' 
		ll_dayofweek = 6
	CASE 'Sunday' 
		ll_dayofweek = 7
END CHOOSE

pdate_f_hasta_semana_anterior = RelativeDate(pdate_fecha, - (ll_day + 1) )
ll_dia_inicio_semana = 1
ll_dia_fin_semana = ll_dia_inicio_semana + 7 - ll_dayofweek

ll_numero_semana = 0
DO WHILE ll_numero_semana < 7 and lb_encontrado = false
	ll_numero_semana++
	if ll_day >= ll_dia_inicio_semana and ll_day <= ll_dia_fin_semana then 
		lb_encontrado = true
	else
		pdate_f_hasta_semana_anterior = relativedate(pdate_f_hasta_semana_anterior, 7)
		ll_dia_inicio_semana = ll_dia_fin_semana + 1
		ll_dia_fin_semana = ll_dia_fin_semana + 7
	end if
LOOP

IF ll_numero_semana > 7 then ll_numero_semana = 0

return ll_numero_semana
	
	


end function

public function decimal uf_calcular_cte_imrt_tycn (long pl_codigo_activo, long pl_anio, long pl_mes, long pl_ind_indisp_tycn_mes_actual);


long ll_anio_anterior, ll_mes_anterior, ll_anio, ll_mes, ll_suma_indisp_mensual_tycp = 0
long ll_ind_indisp_tycn_mes_actual, ll_rows, ll_cont
long ll_cte_indisp_x_tycn, ll_aux
dec{4} ldec_cte_indisp_x_tycn = 1.0 
boolean lb_existe_indisponibilidad = true

datastore lds_indisponibilidades_x_tycn
lds_indisponibilidades_x_tycn = CREATE datastore

if pl_ind_indisp_tycn_mes_actual > 0 then 
	
	lds_indisponibilidades_x_tycn.dataobject = 'd_stn_cte_imrt_x_tycn'
	lds_indisponibilidades_x_tycn.SetTransObject(SQLCA)
	ll_rows = lds_indisponibilidades_x_tycn.Retrieve(pl_codigo_activo,pl_anio, ll_mes_anterior)
	
	if ll_rows > 5 then
		
		ll_anio_anterior = pl_anio
		ll_mes_anterior = pl_mes 
		ll_cont = 0 
		do while ( (ll_cont < ll_rows) and lb_existe_indisponibilidad )
			ll_cont++
			ll_ind_indisp_tycn_mes_actual = lds_indisponibilidades_x_tycn.object.ind_indisp_mensual_tycn[ll_cont]
			ll_anio = lds_indisponibilidades_x_tycn.object.anio[ll_cont]
			ll_mes = lds_indisponibilidades_x_tycn.object.mes[ll_cont]
			
			ll_mes_anterior --
			if ll_mes_anterior = 0 then 
				ll_mes_anterior = 12
				ll_anio_anterior --
			end if
			
			if ( (ll_mes_anterior = ll_mes) and (ll_anio_anterior = ll_anio) and ll_ind_indisp_tycn_mes_actual = 1) then 
				ll_suma_indisp_mensual_tycp++
			else
				lb_existe_indisponibilidad = false
			end if
		loop	
	 
		ll_suma_indisp_mensual_tycp += pl_ind_indisp_tycn_mes_actual		
		
		ldec_cte_indisp_x_tycn = (ll_suma_indisp_mensual_tycp - 6) / 6
		
		if ldec_cte_indisp_x_tycn > 1.00 then 
			ldec_cte_indisp_x_tycn = 1.00
		end if
		
		if ldec_cte_indisp_x_tycn < 0.00 then 
			ldec_cte_indisp_x_tycn = 0.0
		end if
		
		ldec_cte_indisp_x_tycn = 1 - ldec_cte_indisp_x_tycn

	end if
end if

destroy lds_indisponibilidades_x_tycn

return ldec_cte_indisp_x_tycn

end function

public subroutine uf_calcular_indice_disponibilidad (long pl_activo, datetime pdt_fecha, ref decimal pdec_indisponibilidad, ref long pl_sce, ref long pl_cpsm, ref long pl_enr, ref decimal pdec_total_horas_compensadas);long ll_rows, ll_cont, ll_segundos
long ll_disponibilidad, ll_secuencial, ll_cod_causa, ll_tipo_psm, ll_minutos, ll_activo_causante
string ls_consignacion_nacional, LS_AUXILIAR
datetime ldt_fecha_ocurrencia, ldt_fecha_posterior, ldt_fecha_ocurrencia_primera
date  ldate_f_desde, ldate_f_hasta
boolean lb_ultimo_registro= false, lb_excluir_indisponibilidad
long ll_tiempo, ll_dias


pl_sce = 0
pl_cpsm = 0
pl_enr = 0
pdec_indisponibilidad = 0.0

ids_hist_indisponibilidades.Reset()

ldate_f_hasta = date(pdt_fecha)
ldate_f_desde = relativedate(ldate_f_hasta, -365)

SELECT NVL(MAX(tiempo_ocurrencia), :ldate_f_desde)
  INTO :ldt_fecha_ocurrencia_primera
  FROM GI_HIST_DISPONIBILIDAD
 WHERE NRO_INSTALACION = :pl_activo
   AND TIEMPO_OCURRENCIA < :ldate_f_desde; 

ll_rows = ids_hist_indisponibilidades.Retrieve(pl_activo, date(ldt_fecha_ocurrencia_primera), ldate_f_hasta)

if ll_rows > 0 then 
	
	IF ll_rows > 1 then 
		ldt_fecha_posterior = ids_hist_indisponibilidades.object.tiempo_ocurrencia[2]
	ELSE
		ldt_fecha_posterior= ids_hist_indisponibilidades.object.tiempo_ocurrencia[1]
		lb_ultimo_registro = true 
	END IF
	
	for ll_cont = 1 to ll_rows
		
		IF ll_cont < ll_rows then 
			ldt_fecha_posterior = ids_hist_indisponibilidades.object.tiempo_ocurrencia[ll_cont+1]
		ELSE
			lb_ultimo_registro = true 			
		END IF
		
		ldt_fecha_ocurrencia = ids_hist_indisponibilidades.object.tiempo_ocurrencia[ll_cont]
		
		ll_dias =DaysAfter(date(ldt_fecha_ocurrencia), date(ldt_fecha_posterior))
		ll_tiempo = SecondsAfter(time(ldt_fecha_ocurrencia), time(ldt_fecha_posterior))

		//Si hay varios registros con la misma fecha de ocurrencia hay que tomar el $$HEX1$$fa00$$ENDHEX$$ltimo
		if lb_ultimo_registro = true or (ldt_fecha_ocurrencia < ldt_fecha_posterior)	then 
		
			ll_disponibilidad = ids_hist_indisponibilidades.object.disponibilidad_act[ll_cont]
			ll_secuencial = ids_hist_indisponibilidades.object.secuencial[ll_cont]
			ll_cod_causa = ids_hist_indisponibilidades.object.cod_causa[ll_cont]
			ll_tipo_psm = ids_hist_indisponibilidades.object.tipo_psm[ll_cont]
			ls_consignacion_nacional = ids_hist_indisponibilidades.object.consignacion_nacional[ll_cont]
	  
	  		//En el primer registro debe considerarse la fecha DESDE de hoy menos un a$$HEX1$$f100$$ENDHEX$$o
			if ldt_fecha_ocurrencia < datetime(ldate_f_desde) then 
				ldt_fecha_ocurrencia = datetime(ldate_f_desde)
			end if		
			//En el $$HEX1$$fa00$$ENDHEX$$ltimo debe tomarse desde la fecha de ocurrencia hasta la fecha HASTA.
			if ldt_fecha_posterior > pdt_fecha OR lb_ultimo_registro then 
				ldt_fecha_posterior = pdt_fecha
			end if	
			
			select (:ldt_fecha_posterior - :ldt_fecha_ocurrencia) * 86400
			  into :ll_segundos
			  from dual; 
			
			//Se excluyen las indisponibilidades menores de 10 minutos
			//Se anula esta condici$$HEX1$$f300$$ENDHEX$$n 27/01/2010
			//if ll_segundos > 600 then 
			if ll_segundos > 0 then 
				lb_excluir_indisponibilidad = uf_excluir_indisponibilidad(ll_cod_causa, ll_activo_causante)
				
				if lb_excluir_indisponibilidad = false then 
					pdec_indisponibilidad += (100 - ll_disponibilidad) / 100  * ll_segundos
				end if
			end if
			
			if ll_tipo_psm = 1 then 
				pl_cpsm++
			end if
			
			if ll_tipo_psm = 2 then 
				pl_sce++
			end if
		end if 
	end for

SELECT fgci_calculo_enr_desde_fecha(:pl_activo, :ldate_f_hasta) 
  INTO :pl_enr
  FROM DUAL;
  
end if

//Se muestra la indisponibilidad en horas. Hasta ahora la tenemos en segundos.
pdec_indisponibilidad = pdec_indisponibilidad / 3600


//C$$HEX1$$e100$$ENDHEX$$lculo de las horas ya compensadas. Son las de los anteriores 11 meses, sin contar el actual.
long ll_anio, ll_mes, ll_mes_inicial, ll_anio_anterior

ll_anio = year(date(pdt_fecha))
ll_mes  = month(date(pdt_fecha))

ll_mes --
if ll_mes <= 0 then 	
	ll_mes = 12 
	ll_anio --
end if
ll_mes_inicial = ll_mes

ll_mes --
if ll_mes <= 0 then 	
	ll_mes = 12 
	ll_anio --
end if

ll_anio_anterior = ll_anio - 1


SELECT nvl(sum(HORAS_INDISP_A_COMPENSAR), 0)
  INTO :pdec_total_horas_compensadas
  FROM GI_INDICADORES_STN
 WHERE CODIGO_ACTIVO = :pl_activo
   AND (  (ANIO = :ll_anio AND MES > 0 AND MES <= :ll_mes_inicial )
		 or (ANIO= :ll_anio_anterior  AND MES > :ll_mes AND MES  < 13));


ll_mes = 1














end subroutine

public function decimal uf_calcular_compensacion_ens (long pl_codigo_activo, date pdate_f_desde, date pdate_f_hasta, decimal pdec_ingreso_mensual_regulado, long pl_ind_hida);
//C$$HEX1$$e100$$ENDHEX$$lculo de la compensaci$$HEX1$$f300$$ENDHEX$$n por energ$$HEX1$$ed00$$ENDHEX$$a no suministrada

decimal{4} ldec_cano, ldec_valor_ens, ldec_valor_pens, ldec_cie, ldec_cano_cie = 0
long ll_rows = 0, ll_rows_filter, ll_rows_cie, ll_fila_cie
long ll_cont, ll_hora, ll_horas_mes, ll_numero_horas_ens = 0
string ls_filtro, ls_filtro_cie, ls_valor_ens, ls_columna_ens, ls_columna_pens
string ls_coma = ',', ls_punto = '.'
boolean lb_alguna_hora_mayor_dos%

datastore lds_ens, ids_coste_incremental_energia

lds_ens = CREATE datastore
lds_ens.dataobject = 'd_stn_lista_energia_no_suministrada'
lds_ens.SetTransObject(SQLCA)

ll_rows = lds_ens.Retrieve(pl_codigo_activo, pdate_f_desde, pdate_f_hasta)

if ll_rows > 0 then 
	ls_filtro  = 'hora_1_pens > 2 or hora_2_pens > 2 or hora_3_pens > 2 or hora_4_pens > 2 or hora_5_pens > 2 or '
	ls_filtro += 'hora_6_pens > 2 or hora_7_pens > 2 or hora_8_pens > 2 or hora_9_pens > 2 or hora_10_pens > 2 or '
	ls_filtro += 'hora_11_pens > 2 or hora_12_pens > 2 or hora_13_pens > 2 or hora_14_pens > 2 or hora_15_pens > 2 or '
	ls_filtro += 'hora_16_pens > 2 or hora_17_pens > 2 or hora_18_pens > 2 or hora_19_pens > 2 or hora_20_pens > 2 or '
	ls_filtro += 'hora_21_pens > 2 or hora_22_pens > 2 or hora_23_pens > 2 or hora_24_pens > 2'
		
	lds_ens.SetFilter(ls_filtro)
	lds_ens.Filter()
	ll_rows_filter = lds_ens.RowCount()
		
	if ll_rows_filter > 0 then 
		lb_alguna_hora_mayor_dos% = true
	end if 

	if lb_alguna_hora_mayor_dos% = false and pl_ind_hida = 0 then 
		ldec_cano = 0.0
	else
			
		lds_ens.SetFilter("")
		lds_ens.Filter()
	
		ids_coste_incremental_energia = CREATE datastore
		ids_coste_incremental_energia.dataobject = 'd_config_costeincrementalenergia'
		ids_coste_incremental_energia.SetTransObject(SQLCA)
		
		ll_rows_cie = ids_coste_incremental_energia.Retrieve(0)
		
		for ll_hora = 1 to 24
			ls_columna_ens = 'hora_' + string(ll_hora) + '_ens'
			ls_columna_pens = 'hora_' + string(ll_hora) + '_pens'

			for ll_cont = 1 to ll_rows
				
				if not isnull(lds_ens.GetItemDecimal(ll_cont, ls_columna_ens)) then 
					ldec_valor_ens = lds_ens.GetItemDecimal(ll_cont, ls_columna_ens)			
					if ldec_valor_ens > 0 then 				
						ll_numero_horas_ens ++
						
						ls_valor_ens = string(ldec_valor_ens)
						fg_replace_text(ls_valor_ens, ls_coma, ls_punto)
						ls_filtro_cie  = 'hora = ' + string(ll_hora) + ' and '
						ls_filtro_cie += 'energia_desde <= ' + ls_valor_ens + ' and '
						ls_filtro_cie += 'energia_hasta > ' + ls_valor_ens
	
						ll_fila_cie = ids_coste_incremental_energia.Find(ls_filtro_cie, 0, ll_rows_cie)
						
						if ll_fila_cie > 0 then 
							ldec_cie = ids_coste_incremental_energia.object.coste[ll_fila_cie]
							if ldec_cano_cie < (ldec_cie * ldec_valor_ens) then
								ldec_cano_cie = ldec_cie * ldec_valor_ens
							end if						
						end if					
						
					end if
					
					ldec_valor_pens = lds_ens.GetItemDecimal(ll_cont, ls_columna_pens)			
					if ldec_valor_pens > 2 then 
						lb_alguna_hora_mayor_dos% = true
					end if
				end if
			end for
		end for
	
		DESTROY ids_coste_incremental_energia
				
		//Calculamos el n$$HEX1$$fa00$$ENDHEX$$mero de horas del mes
		ll_horas_mes = DaysAfter(pdate_f_desde, pdate_f_hasta) * 24
		
		ldec_cano = ll_numero_horas_ens / ll_horas_mes * pdec_ingreso_mensual_regulado
			
		if lb_alguna_hora_mayor_dos% = true then
			if ldec_cano < ldec_cano_cie then 
				ldec_cano = ldec_cano_cie
			end if
		end if
	end if	
end if

DESTROY lds_ens

return ldec_cano


//ls_filtro  = 'hora_1_pens > 2 or hora_2_pens > 2 or hora_3_pens > 2 or hora_4_pens > 2 or hora_5_pens > 2 or '
//ls_filtro += 'hora_6_pens > 2 or hora_7_pens > 2 or hora_8_pens > 2 or hora_9_pens > 2 or hora_10_pens > 2 or '
//ls_filtro += 'hora_11_pens > 2 or hora_12_pens > 2 or hora_13_pens > 2 or hora_14_pens > 2 or hora_15_pens > 2 or '
//ls_filtro += 'hora_16_pens > 2 or hora_17_pens > 2 or hora_18_pens > 2 or hora_19_pens > 2 or hora_20_pens > 2 or '
//ls_filtro += 'hora_21_pens > 2 or hora_22_pens > 2 or hora_23_pens > 2 or hora_24_pens > 2'
//	
//lds_ens.SetFilter(ls_filtro)
//lds_ens.Filter()
//ll_rows = lds_ens.RowCount()
//	
////if ll_rows = 0 then 
//	

end function

public function integer uf_calcular_indices_grupos_activos (datawindow pdw_indicadores_stn);
long ll_cont_grupos, ll_cont_activos, ll_fila_dw_stn
long ll_rows_grupos, ll_rows_activos, ll_rows_dw_stn, ll_row_indicador_str
long ll_grupo, ll_activo, ll_anio, ll_mes
long ll_mhaia
long ll_enr , ll_sce, ll_cpsm, ll_mida
dec{4} ldec_mida, ldec_indice_indisponibilidad, ldec_imr, ldec_horas_indisp_a_compensar, ldec_horas_mes
dec{4} ldec_imrt_compensacion_tycn, ldec_cano, ldec_cano_pendiente 
int li_ind_indis_mensual_tycn, li_status
boolean lb_actualizar_indicador_str = false

datastore lds_lista_grupos_activos
datastore lds_activos_de_grupoactivos
datastore lds_indicadores_str

ll_rows_dw_stn = pdw_indicadores_stn.RowCount()

if ll_rows_dw_stn > 1 then 
	
	ll_anio = pdw_indicadores_stn.object.anio[1]
	ll_mes = pdw_indicadores_stn.object.mes[1]
	
	DELETE GI_INDICADORES_STR
	 WHERE ANIO = :ll_anio
	   AND MES = :ll_mes;
	
	lds_lista_grupos_activos = CREATE datastore
	lds_lista_grupos_activos.dataobject = 'd_str_lista_grupoactivos'
	lds_lista_grupos_activos.SetTransObject(SQLCA)
	
	lds_activos_de_grupoactivos = CREATE datastore
	lds_activos_de_grupoactivos.dataobject = 'd_str_activos_de_grupoactivos'
	lds_activos_de_grupoactivos.SetTransObject(SQLCA)
	
	lds_indicadores_str = CREATE datastore
	lds_indicadores_str.dataobject = 'd_str_indices_metas'
	lds_indicadores_str.SetTransObject(SQLCA)	
	
	ll_rows_grupos = lds_lista_grupos_activos.Retrieve()
	
	for ll_cont_grupos = 1 to ll_rows_grupos		
		ll_grupo = lds_lista_grupos_activos.object.codigo[ll_cont_grupos]
		ll_mhaia = lds_lista_grupos_activos.object.mhai[ll_cont_grupos]
		if isnull(ll_mhaia) then ll_mhaia = 0 
		
		lds_activos_de_grupoactivos.Reset()
		ll_rows_activos = lds_activos_de_grupoactivos.Retrieve(ll_grupo)

		ll_enr = 0
		ll_sce = 0
		ll_cpsm = 0
		ll_mida = 0
		ldec_indice_indisponibilidad = 0.0
		ldec_imr = 0.0
		ldec_horas_indisp_a_compensar = 0.0
		ldec_horas_mes = 0.0
		li_ind_indis_mensual_tycn = 0
		ldec_imrt_compensacion_tycn = 0.0 
		ldec_cano = 0.0
		ldec_cano_pendiente = 0.0
		
		
		
		for ll_cont_activos = 1 to ll_rows_activos
			ll_activo = lds_activos_de_grupoactivos.object.codigo[ll_cont_activos]
			ll_fila_dw_stn = pdw_indicadores_stn.Find("codigo_activo = " + string(ll_activo), 1, ll_rows_dw_stn)
			if ll_fila_dw_stn > 0 then 
				lb_actualizar_indicador_str = true
				ll_enr += pdw_indicadores_stn.object.enr[ll_fila_dw_stn]
				ll_sce += pdw_indicadores_stn.object.sce[ll_fila_dw_stn]
				ll_cpsm += pdw_indicadores_stn.object.cpsm[ll_fila_dw_stn]
				//ll_mida += pdw_indicadores_stn.object.mida[ll_fila_dw_stn]
				ldec_indice_indisponibilidad += pdw_indicadores_stn.object.indice_disponibilidad[ll_fila_dw_stn]
				ldec_imr += pdw_indicadores_stn.object.imr[ll_fila_dw_stn]
				ldec_horas_indisp_a_compensar += pdw_indicadores_stn.object.horas_indisp_a_compensar[ll_fila_dw_stn]
				ldec_horas_mes = pdw_indicadores_stn.object.horas_mes[ll_fila_dw_stn]
				li_ind_indis_mensual_tycn += pdw_indicadores_stn.object.ind_indisp_mensual_tycn[ll_fila_dw_stn]
				ldec_imrt_compensacion_tycn += pdw_indicadores_stn.object.imrt_compensacion_tycn[ll_fila_dw_stn]
				ldec_cano += pdw_indicadores_stn.object.cano[ll_fila_dw_stn]
				ldec_cano_pendiente += pdw_indicadores_stn.object.cano_pendiente[ll_fila_dw_stn]
			end if			
		end for
		
		IF lb_actualizar_indicador_str THEN 
			ll_row_indicador_str = lds_indicadores_str.InsertRow(0)
			lds_indicadores_str.object.codigo_grupo[ll_row_indicador_str] = ll_grupo
			lds_indicadores_str.object.anio[ll_row_indicador_str] = ll_anio
			lds_indicadores_str.object.mes[ll_row_indicador_str] = ll_mes
			lds_indicadores_str.object.anio[ll_row_indicador_str] = ll_anio
			lds_indicadores_str.object.mes[ll_row_indicador_str] = ll_mes
			//lds_indicadores_str.object.mhaia[ll_row_indicador_str] = ll_mhaia
			lds_indicadores_str.object.enr[ll_row_indicador_str] = ll_enr
			lds_indicadores_str.object.sce[ll_row_indicador_str] = ll_sce
			lds_indicadores_str.object.cpsm[ll_row_indicador_str] = ll_cpsm
			
			//ll_mhaia = lds_indicadores_str.object.mhai[ll_row_indicador_str]
			ldec_mida = (ll_mhaia - (0.5 * (ll_sce + ll_cpsm + ll_enr))) 
			lds_indicadores_str.object.mida[ll_row_indicador_str] = ldec_mida
			lds_indicadores_str.object.indice_disponibilidad[ll_row_indicador_str] = ldec_indice_indisponibilidad
			lds_indicadores_str.object.imr[ll_row_indicador_str] = ldec_imr
			lds_indicadores_str.object.horas_indisp_a_compensar[ll_row_indicador_str] = ldec_horas_indisp_a_compensar
			lds_indicadores_str.object.horas_mes[ll_row_indicador_str] = ldec_horas_mes
			
			IF li_ind_indis_mensual_tycn = ll_rows_activos THEN 
				lds_indicadores_str.object.ind_indisp_mensual_tycn[ll_row_indicador_str] = 1	
				ldec_imrt_compensacion_tycn = uf_calcular_cte_imrt_tycn_str (ll_grupo, ll_anio, ll_mes, li_ind_indis_mensual_tycn)
			ELSE
				lds_indicadores_str.object.ind_indisp_mensual_tycn[ll_row_indicador_str] = 0
				ldec_imrt_compensacion_tycn = 1.0
			END IF	
	
			lds_indicadores_str.object.imrt_compensacion_tycn[ll_row_indicador_str] = ldec_imrt_compensacion_tycn
			lds_indicadores_str.object.cano[ll_row_indicador_str] = ldec_cano
			lds_indicadores_str.object.cano_pendiente[ll_row_indicador_str] = ldec_cano_pendiente	
			
			li_status = lds_indicadores_str.Update()
			
		END IF
		
		lb_actualizar_indicador_str = FALSE
				
	end for	
end if

DESTROY lds_lista_grupos_activos
DESTROY lds_activos_de_grupoactivos
DESTROY lds_indicadores_str
return 1
end function

public function long uf_calcular_indisponibilidad_x_tycn (long pl_codigo_activo, date pdate_f_desde, date pdate_f_hasta);//Determina si durante el $$HEX1$$fa00$$ENDHEX$$ltimo mes (pasado como par$$HEX1$$e100$$ENDHEX$$metro) el activo ha estado indisponible por terrorismo o cat$$HEX1$$e100$$ENDHEX$$strofe natural. 
//El c$$HEX1$$e100$$ENDHEX$$lculo  tiene en cuenta lo siguiente:
//  - Deben ser un n$$HEX1$$fa00$$ENDHEX$$mero entero de meses con causa TERRORISMO o CAT$$HEX1$$c100$$ENDHEX$$STROFE
//  - Durante todo el mes de c$$HEX1$$e100$$ENDHEX$$lculo el activo debe estar indisponiblde por esa causa. 
//Se hace el c$$HEX1$$e100$$ENDHEX$$lculo durante un per$$HEX1$$ed00$$ENDHEX$$odo de un a$$HEX1$$f100$$ENDHEX$$o. 
//NOTA: Se debe pasar como argumento en fecha hasta el d$$HEX1$$ed00$$ENDHEX$$a 1 del mes posterior al que deseamos hacer el c$$HEX1$$e100$$ENDHEX$$lculo. 
//As$$HEX2$$ed002000$$ENDHEX$$para establecer el n$$HEX1$$fa00$$ENDHEX$$mero de meses de indisponibilidad por actos de terrorismo y cat$$HEX1$$e100$$ENDHEX$$strofe que deben tenerse
//en cuenta para determinar el Ingreso Mensual Regulado para el mes de Enero del a$$HEX1$$f100$$ENDHEX$$o 2010 debe pasarse como 
//fecha desde: 01/01/2010 y fecha hasta: 01/02/2010

// Devuelve la constante por la que debe el ingreso mensual regulado para obtener el ingreso mensual regulado temporal.
  
   
long ll_rows, ll_cont, ll_cod_causa, ll_disponibilidad_act
long ll_ultimo_registro, ll_dias, ll_meses_indisponibilidad = 0, ll_indicador_indisponibilidad = 0
datetime ldate_f_desde, ldate_f_hasta
datetime ldt_tiempo_ocurrencia, ldt_ultimo_tiempo_ocurrencia, ldt_auxiliar, ldt_f_inicial, ldt_f_final
boolean lb_return = false, lb_inicio_tycn = false

ldt_f_inicial = datetime(pdate_f_desde)
ldt_f_final   = datetime(pdate_f_hasta)

SELECT max(tiempo_ocurrencia) 
  INTO :ldate_f_desde
  FROM GI_HIST_DISPONIBILIDAD
 WHERE NRO_INSTALACION = :pl_codigo_activo
   AND TIEMPO_OCURRENCIA <=:ldt_f_inicial; 
	
SELECT MIN(tiempo_ocurrencia) 
  INTO :ldate_f_hasta
  FROM GI_HIST_DISPONIBILIDAD
 WHERE NRO_INSTALACION = :pl_codigo_activo
   AND TIEMPO_OCURRENCIA >=:ldt_f_final; 
	
ids_hist_indisponibilidades.Reset()
ll_rows = ids_hist_indisponibilidades.Retrieve(pl_codigo_activo, date(ldate_f_desde), date(ldate_f_hasta))

ll_rows = ids_hist_indisponibilidades.RowCount()
if ll_rows > 0 then 
	//El $$HEX1$$fa00$$ENDHEX$$ltimo registro debe indicar que el activo est$$HEX2$$e1002000$$ENDHEX$$indisponible. Debe comprobarse que el activo sigue indisponible
	//if lb_inicio_tycn then 
		ll_cod_causa = ids_hist_indisponibilidades.object.cod_causa[ll_rows]
		ldt_tiempo_ocurrencia = ids_hist_indisponibilidades.object.tiempo_ocurrencia[ll_rows]
		ll_disponibilidad_act = ids_hist_indisponibilidades.object.disponibilidad_act[ll_rows]
		
		if (ll_cod_causa = 676 or ll_cod_causa = 677) and ll_disponibilidad_act = 0 then 	
			if date(ldt_tiempo_ocurrencia) <  pdate_f_desde then 
				ll_indicador_indisponibilidad = 1
			end if
		end if
	//end if			 
end if

return ll_indicador_indisponibilidad

	
	
	
	
//	ldt_ultimo_tiempo_ocurrencia = ids_hist_indisponibilidades.object.tiempo_ocurrencia[1]
//	ll_ultimo_registro = 1
//	for ll_cont = 1 to ll_rows
//		
//		//ll_cod_causa = ids_hist_indisponibilidades.object.cod_causa[ll_cont]
//		ldt_tiempo_ocurrencia = ids_hist_indisponibilidades.object.tiempo_ocurrencia[ll_cont]
//		//ll_disponibilidad_act = ids_hist_indisponibilidades.object.indisponibilidad_act[ll_cont]
//		
//		//Puede haber varios registros modificados debido a errores en la actualizaci$$HEX1$$f300$$ENDHEX$$n de datos. Se tomar$$HEX2$$e1002000$$ENDHEX$$el $$HEX1$$fa00$$ENDHEX$$ltimo registro
//		if ldt_tiempo_ocurrencia <> ldt_ultimo_tiempo_ocurrencia then 
//			
//			
//			ll_cod_causa = ids_hist_indisponibilidades.object.cod_causa[ll_cont - 1]
//			ll_disponibilidad_act = ids_hist_indisponibilidades.object.indisponibilidad_act[ll_cont - 1]
//						
//			if lb_inicio_tycn = false then 
//				if (ll_cod_causa = 676 or ll_cod_causa = 677) and ll_disponibilidad_act = 0 then 
//					ldt_f_inicial = ldt_ultimo_tiempo_ocurrencia 
//					lb_inicio_tycn = true
//				end if 
//			end if
//			
//			if lb_inicio_tycn then 
//				if not ((ll_cod_causa = 676 or ll_cod_causa = 677) and ll_disponibilidad_act = 0) then 
//					ldt_f_final = ldt_ultimo_tiempo_ocurrencia
//					lb_inicio_tycn = false													
//				end if
//			end if
//			
//			ldt_ultimo_tiempo_ocurrencia = ldt_tiempo_ocurrencia
//			
//		end if
//	next 
	
//	//Ya se han acabado los registros. Debe comprobarse que el activo sigue indisponible
//	if lb_inicio_tycn then 
//		ll_cod_causa = ids_hist_indisponibilidades.object.cod_causa[ll_rows]
//		ldt_tiempo_ocurrencia = ids_hist_indisponibilidades.object.tiempo_ocurrencia[ll_rows]
//		ll_disponibilidad_act = ids_hist_indisponibilidades.object.indisponibilidad_act[ll_rows]
//		
//		if (ll_cod_causa = 676 or ll_cod_causa = 677) and ll_disponibilidad_act = 0 then 				
//			select (:pdate_f_hasta - :ldt_tiempo_ocurrencia) 
//			  into :ll_dias
//			  from dual; 		
//			  
//			ll_meses_indisponibilidad += ll_dias / 30 
//		
//	end if
//end if

end function

public function decimal uf_calcular_cte_imrt_tycn_str (long pl_codigo_grupo, long pl_anio, long pl_mes, long pl_ind_indisp_tycn_mes_actual);


long ll_anio_anterior, ll_mes_anterior, ll_anio, ll_mes, ll_suma_indisp_mensual_tycp = 0
long ll_ind_indisp_tycn_mes_actual, ll_rows, ll_cont
long ll_cte_indisp_x_tycn, ll_aux
dec{4} ldec_cte_indisp_x_tycn = 1.0 
boolean lb_existe_indisponibilidad = true

datastore lds_indisponibilidades_x_tycn
lds_indisponibilidades_x_tycn = CREATE datastore

if pl_ind_indisp_tycn_mes_actual > 0 then 
	
	lds_indisponibilidades_x_tycn.dataobject = 'd_str_cte_imrt_x_tycn'
	lds_indisponibilidades_x_tycn.SetTransObject(SQLCA)
	ll_rows = lds_indisponibilidades_x_tycn.Retrieve(pl_codigo_grupo, pl_anio, ll_mes_anterior)
	
	if ll_rows > 5 then
		
		ll_anio_anterior = pl_anio
		ll_mes_anterior = pl_mes 
		ll_cont = 0 
		do while ( (ll_cont < ll_rows) and lb_existe_indisponibilidad )
			ll_cont++
			ll_ind_indisp_tycn_mes_actual = lds_indisponibilidades_x_tycn.object.ind_indisp_mensual_tycn[ll_cont]
			ll_anio = lds_indisponibilidades_x_tycn.object.anio[ll_cont]
			ll_mes = lds_indisponibilidades_x_tycn.object.mes[ll_cont]
			
			ll_mes_anterior --
			if ll_mes_anterior = 0 then 
				ll_mes_anterior = 12
				ll_anio_anterior --
			end if
			
			if ( (ll_mes_anterior = ll_mes) and (ll_anio_anterior = ll_anio) and ll_ind_indisp_tycn_mes_actual = 1) then 
				ll_suma_indisp_mensual_tycp++
			else
				lb_existe_indisponibilidad = false
			end if
		loop	
	 
		ll_suma_indisp_mensual_tycp += pl_ind_indisp_tycn_mes_actual		
		
		ldec_cte_indisp_x_tycn = (ll_suma_indisp_mensual_tycp - 6) / 6
		
		if ldec_cte_indisp_x_tycn > 1.00 then 
			ldec_cte_indisp_x_tycn = 1.00
		end if
		
		if ldec_cte_indisp_x_tycn < 0.00 then 
			ldec_cte_indisp_x_tycn = 0.0
		end if
		
		ldec_cte_indisp_x_tycn = 1 - ldec_cte_indisp_x_tycn

	end if
end if

destroy lds_indisponibilidades_x_tycn

return ldec_cte_indisp_x_tycn

end function

public subroutine uf_set_ipp (date pdate_fecha);
date ldate_f_hasta
datetime ldt_f_hasta


SELECT MAX(F_HASTA)
  INTO :ldt_f_hasta
  FROM GI_PARAMETROS_SCIC
 WHERE PARAMETRO = 'IPP'
   AND F_HASTA < :pdate_fecha; 

if not isnull(ldt_f_hasta) then 
	
	ldate_f_hasta = date(ldt_f_hasta)
	
	SELECT to_number(VALOR)
	  INTO :idec_ipp
	  FROM GI_PARAMETROS_SCIC
	 WHERE PARAMETRO = 'IPP'
	   AND F_HASTA = :ldate_f_hasta;  

	IF ISNULL(idec_ipp) then idec_ipp = 0

	SELECT to_number(VALOR)
	  INTO :idec_ipp_0
	  FROM GI_PARAMETROS_SCIC
	 WHERE PARAMETRO = 'IPP_0';
	 
	IF ISNULL(idec_ipp_0) then idec_ipp_0 = 1
	
end if
end subroutine

event constructor;
long ll_rows, ll_cont
long ll_disponibilidad, ll_secuencial, ll_cod_causa, ll_tipo_psm
string ls_consignacion_nacional
datetime ldt_fecha_ocurrencia, ldt_fecha_anterior


ids_hist_indisponibilidades = CREATE datastore
ids_hist_indisponibilidades.dataobject = 'd_lista_hist_indisponibilidades_x_activo'
ids_hist_indisponibilidades.SetTransObject(SQLCA)


end event

event destructor;

DESTROY ids_hist_indisponibilidades
end event

on n_calculos_indicadores.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_calculos_indicadores.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


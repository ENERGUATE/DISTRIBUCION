HA$PBExportHeader$u_reportes_str.sru
forward
global type u_reportes_str from nonvisualobject
end type
end forward

global type u_reportes_str from nonvisualobject
end type
global u_reportes_str u_reportes_str

type variables


datetime idt_fecha_desde
datetime idt_fecha_hasta
date idate_fecha_minima

string is_agente_causante

integer ii_fichero_generico
end variables

forward prototypes
public subroutine uf_generar_reportes ()
public function string uf_validar_valor_nulo (string pl_valor)
public subroutine uf_set_fechas (datetime pdt_fecha_desde, datetime pdt_fecha_hasta)
public subroutine uf_generar_reporte_tipo_maniobra_old ()
public function string uf_get_codigo_creg_causa_detallada (long pl_causa)
public function string uf_get_codigo_creg_causa (long pl_codigo_causa, long pl_codigo_activo)
public function integer uf_estructura_causa (long pl_cod_causa, long pl_nro_instalacion, ref string ps_familia_causa, ref string ps_causa_detallada)
public subroutine uf_get_nombre_activo_propietario (long pl_cod_activo, ref string ps_nombre_activo, ref string ps_agente_propietario)
public subroutine uf_generar_reporte_cambio_oper_stn ()
public subroutine uf_generar_reporte_cambio_oper_str ()
public subroutine uf_generar_reporte_tipo_evento_stn ()
public subroutine uf_generar_reporte_tipo_evento_str ()
public subroutine uf_generar_reporte_tipo_maniobra_stn ()
public subroutine uf_generar_reporte_tipo_maniobra_str ()
end prototypes

public subroutine uf_generar_reportes ();
long ll_status

SetPointer(HourGlass!)

uf_generar_reporte_tipo_evento_stn()
uf_generar_reporte_tipo_maniobra_stn()
uf_generar_reporte_cambio_oper_stn()

ll_status = FileClose(ii_fichero_generico)

ii_fichero_generico = FileOpen('c:\informe_generico_STR.txt', LineMode!, Write!, LockWrite!, Replace!)

uf_generar_reporte_tipo_evento_str()
uf_generar_reporte_tipo_maniobra_str()
uf_generar_reporte_cambio_oper_str()

ll_status = FileClose(ii_fichero_generico)

messagebox("", "La generaci$$HEX1$$f300$$ENDHEX$$n de ficheros ha concluido", Exclamation!, ok!)
end subroutine

public function string uf_validar_valor_nulo (string pl_valor);

if isnull(pl_valor) then 
	pl_valor = ''
end if

return pl_valor
end function

public subroutine uf_set_fechas (datetime pdt_fecha_desde, datetime pdt_fecha_hasta);

idt_fecha_hasta = pdt_fecha_hasta
idt_fecha_desde = pdt_fecha_desde
end subroutine

public subroutine uf_generar_reporte_tipo_maniobra_old ();
string ls_linea_registro, ls_auxiliar, ls_familia_causa, ls_causa_detallada
int li_fichero
long ll_status, ll_tipo_reporte, ll_rows, ll_cont, ll_auxiliar
long ll_nro_instalacion
datetime ldt_fecha_desde, ldt_fecha_hasta
datastore lds_registros


ll_tipo_reporte = 2

li_fichero = FileOpen('c:\informe_tipo_maniobra.txt', LineMode!, Write!, LockWrite!, Replace!)

lds_registros = CREATE datastore
lds_registros.dataobject = 'd_reportes_str_maniobra'

lds_registros.SetTransObject(SQLCA)
lds_registros.Retrieve(ll_tipo_reporte, idt_fecha_desde, idt_fecha_hasta)

ll_rows = lds_registros.RowCount()

ls_linea_registro = ''

for ll_cont = 1 to ll_rows
	ls_auxiliar = lds_registros.object.tipo_reporte[ll_cont] 								// 1
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	ls_auxiliar = lds_registros.object.tiempo_instruccion[ll_cont] 						// 2
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	ls_auxiliar = lds_registros.object.tiempo_ocurrencia[ll_cont]							// 3
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	ls_auxiliar = lds_registros.object.tiempo_reporte[ll_cont]								// 4
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	ll_nro_instalacion = lds_registros.object.nro_instalacion[ll_cont]								// 5
	//ls_linea_registro += uf_get_nombre_activo(ll_nro_instalacion)		+ ','						
	 
	ls_auxiliar = lds_registros.object.tipo_movimiento[ll_cont]								// 6
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	ls_auxiliar = string(lds_registros.object.disponibilidad_act[ll_cont]) 				// 7
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	ll_auxiliar = lds_registros.object.cod_causa[ll_cont]										// 8 y 9
	ll_auxiliar = uf_estructura_causa(ll_auxiliar, ll_nro_instalacion, ls_familia_causa, ls_causa_detallada)
	
	ls_linea_registro += ls_familia_causa		+ ','												// 8
	
	ls_linea_registro += ls_causa_detallada	+ ','												// 9
	
	ls_auxiliar = lds_registros.object.consignacion_nacional[ll_cont] 					// 10
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	ls_auxiliar = lds_registros.object.fecha_bypass[ll_cont]									// 11
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	ls_auxiliar = ''																						// 12 Radicadold
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	ls_auxiliar = ''																						// 13 Agente causante
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	ll_auxiliar = lds_registros.object.activo_causante[ll_cont] 							// 14 Nombre del activo causante
//	ls_linea_registro += uf_get_nombre_activo(ll_auxiliar) + ','								
//	ls_linea_registro += lds_registros.object.tipo_movimiento[ll_cont]					// 15

	ls_auxiliar = lds_registros.object.observaciones[ll_cont] 								// 16 Observaciones
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	FileWrite(li_fichero, ls_linea_registro)
	
	ls_linea_registro = ''
	
end for
	

ll_status = FileClose(li_fichero)


DESTROY lds_registros
end subroutine

public function string uf_get_codigo_creg_causa_detallada (long pl_causa);string ls_naturaleza, ls_codigo_creg


SELECT CODIGO_CREG 
  INTO :ls_codigo_creg
  FROM GI_CAUSA
 WHERE COD_CAUSA = :pl_causa;

	
return ls_codigo_creg	
end function

public function string uf_get_codigo_creg_causa (long pl_codigo_causa, long pl_codigo_activo);string ls_naturaleza, ls_codigo_creg


ls_naturaleza = gf_naturaleza_activo(pl_codigo_activo) 


SELECT S.CODIGO_CREG 
  INTO :ls_codigo_creg
  FROM GI_SUBTIPOS_VS_OCURRENCIA S, GI_CAUSA C
 WHERE S.SUBTIPO = TO_CHAR(C.SUBTIPO)
   AND C.COD_CAUSA = :pl_codigo_causa
   AND S.TIPO_OCURRENCIA = :ls_naturaleza;

	
return ls_codigo_creg	


end function

public function integer uf_estructura_causa (long pl_cod_causa, long pl_nro_instalacion, ref string ps_familia_causa, ref string ps_causa_detallada);
long ll_gpo_causa, ll_tipo, ll_subtipo, ll_activo
string ls_causa_categoria, ls_causa
int  li_return = 0

ps_causa_detallada = ''
ps_familia_causa = ''

if not isnull(pl_cod_causa ) then 
	
//	SELECT GPO_CAUSA, TIPO, SUBTIPO, ACTIVO, DESCRIPCION
//	  INTO :ll_gpo_causa, :ll_tipo, :ll_subtipo, :ll_activo, :ps_causa_detallada
//	  FROM GI_CAUSA
//	 WHERE COD_CAUSA = :pl_cod_causa;
//	
//	SELECT DESCRIPCION 
//	  INTO :ps_familia_causa
//	  FROM GI_SUBTIPO_CAUSA
//	 WHERE GPO_CAUSA = :ll_gpo_causa
//		AND SUBTIPO =:ll_subtipo
//		AND TIPO = :ll_tipo
//		AND ACTIVO = :ll_activo;


	//En realidad hay que enviar el c$$HEX1$$f300$$ENDHEX$$digo CREG correspondiente
	ps_familia_causa = uf_get_codigo_creg_causa(pl_cod_causa, pl_nro_instalacion)
	ps_causa_detallada = uf_get_codigo_creg_causa_detallada(pl_cod_causa)


else 
	li_return = -1
end if

return li_return

end function

public subroutine uf_get_nombre_activo_propietario (long pl_cod_activo, ref string ps_nombre_activo, ref string ps_agente_propietario);
string ls_activo, ls_agente, ls_descripcion_agente
long ll_rows

if not isnull(pl_cod_activo) then 
	

	SELECT NVL(TRIM(ID_ACTIVO), ''), NVL(AGENTE_PROPIETARIO, '')
	  INTO :ls_activo, :ls_agente
	  FROM BDIV10_ACTIVOS
	 WHERE CODIGO = :pl_cod_activo; 
	 
	if isnull(ls_activo) then 
		ps_nombre_activo = ''
	else
		ps_nombre_activo = ls_activo
	end if
	
	if isnull(ls_agente) then 
		ps_agente_propietario = ''
	else
		
		ps_agente_propietario = ls_agente
//		SELECT NVL(DESCRIPCION, '')
//		  INTO :ls_descripcion_agente
//		  FROM BDIV10_MAESTRO
//		 WHERE TIP_TABLA = 'PROPI'
//		   AND CODIGO = :ls_agente;		   
//		
//		ps_agente_propietario = ls_descripcion_agente
	end if

end if



end subroutine

public subroutine uf_generar_reporte_cambio_oper_stn ();
string ls_linea_registro, ls_auxiliar, ls_familia_causa, ls_causa_detallada
int li_fichero
long ll_status, ll_tipo_reporte, ll_rows, ll_cont, ll_auxiliar
long ll_nro_instalacion, ll_cod_causa
datetime ldt_fecha_auxiliar
string ls_nombre_activo, ls_agente_propietario
datastore lds_registros

ll_tipo_reporte = 2

li_fichero = FileOpen('c:\informe_cambio_operatividad_STN.txt', LineMode!, Write!, LockWrite!, Replace!)

lds_registros = CREATE datastore
lds_registros.dataobject = 'd_reportes_str_cambio_operatividad_stn'

lds_registros.SetTransObject(SQLCA)
lds_registros.Retrieve(idt_fecha_desde, idt_fecha_hasta)

ll_rows = lds_registros.RowCount()

ls_linea_registro = ''

for ll_cont = 1 to ll_rows
	
	// 1.- TIPO DE REPORTE
	ls_auxiliar = lds_registros.object.tipo_reporte[ll_cont] 								// 1
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 2.- FECHA DE INSTRUCCI$$HEX1$$d300$$ENDHEX$$N  Debe ir vac$$HEX1$$ed00$$ENDHEX$$a
	ls_auxiliar = ''																						// 2
//	if not isnull(lds_registros.object.tiempo_instruccion[ll_cont]) 	then  				
//	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion[ll_cont]
//		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
//			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
//		end if
//	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 3.- FECHA DE OCURRENCIA
	ls_auxiliar = ''																						// 3
	if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 4.- FECHA DE REPORTE Debe ir vac$$HEX1$$ed00$$ENDHEX$$a
	ls_auxiliar = ''																						// 4
//	if not isnull(lds_registros.object.tiempo_reporte[ll_cont]) 	then  				
//	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte[ll_cont]
//		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
//			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
//		end if
//	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','

	//JME 18/02/2010
	//Tambi$$HEX1$$e900$$ENDHEX$$n deben enviarse (aunque vac$$HEX1$$ed00$$ENDHEX$$o) los tiempos de despeje y aterrizae (6 tiempos)
	ls_auxiliar = ''	
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	//Fin JME 18/02/2010
	
	
	// 5.- NOMBRE DEL ACTIVO
	ll_nro_instalacion = lds_registros.object.nro_instalacion[ll_cont]					// 5
	uf_get_nombre_activo_propietario(ll_nro_instalacion, ls_nombre_activo, ls_agente_propietario)	
	ls_linea_registro += ls_nombre_activo + ','						
	
	// 6.- TIPO DE MOVIMIENTO
	ls_auxiliar = lds_registros.object.tipo_movimiento[ll_cont]								// 6
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 7.- DISPONIBILIDAD
	ls_auxiliar = string(lds_registros.object.disponibilidad_act[ll_cont]) 				// 7
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 8 y 9.- CAUSA y CAUSA DETALLADA
	ll_cod_causa = lds_registros.object.cod_causa[ll_cont]									// 8 y 9
	
	ll_auxiliar = uf_estructura_causa(ll_cod_causa, ll_nro_instalacion, ls_familia_causa, ls_causa_detallada)
	
	ls_linea_registro += ls_familia_causa		+ ','												// 8
	
	ls_linea_registro += ls_causa_detallada	+ ','												// 9
	
	// 10.- CSG_ID (Consignaci$$HEX1$$f300$$ENDHEX$$n nacional)
	ls_auxiliar = lds_registros.object.consignacion_nacional[ll_cont] 					// 10
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 11.- FECHA DE BYPASS
	ls_auxiliar = ''																						// 11
	if not isnull(lds_registros.object.fecha_bypass[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.fecha_bypass[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// JME 21/09/09 Se elimina el radicadold
	// ls_auxiliar = ''																						// 12 Radicadold
	//ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	// Fin JME
	
	// 12.- AGENTE CAUSANTE
	ll_auxiliar = lds_registros.object.activo_causante[ll_cont]
	uf_get_nombre_activo_propietario(ll_auxiliar, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_agente_propietario		+ ','										// 13 Agente causante	
	
	// 13.- ACTIVO CAUSANTE
	ls_linea_registro += ls_nombre_activo + ','													// 14 Nombre del activo causante			
//	ls_linea_registro += lds_registros.object.tipo_movimiento[ll_cont]					// 15
	
	// 14.- DESCRIPCION
	ls_auxiliar = lds_registros.object.observaciones[ll_cont] 								// 16 Observaciones
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) 							

	FileWrite(li_fichero, ls_linea_registro)
	FileWrite(ii_fichero_generico, ls_linea_registro)
	
	ls_linea_registro = ''
	
end for
	

ll_status = FileClose(li_fichero)


DESTROY lds_registros
end subroutine

public subroutine uf_generar_reporte_cambio_oper_str ();
string ls_linea_registro, ls_auxiliar, ls_familia_causa, ls_causa_detallada
int li_fichero
long ll_status, ll_tipo_reporte, ll_rows, ll_cont, ll_auxiliar
long ll_nro_instalacion, ll_cod_causa
datetime ldt_fecha_auxiliar
string ls_nombre_activo, ls_agente_propietario
datastore lds_registros

ll_tipo_reporte = 2

li_fichero = FileOpen('c:\informe_cambio_operatividad_STR.txt', LineMode!, Write!, LockWrite!, Replace!)

lds_registros = CREATE datastore
lds_registros.dataobject = 'd_reportes_str_cambio_operatividad_str'

lds_registros.SetTransObject(SQLCA)
lds_registros.Retrieve(idt_fecha_desde, idt_fecha_hasta)

ll_rows = lds_registros.RowCount()

ls_linea_registro = ''

for ll_cont = 1 to ll_rows
	
	// 1.- TIPO DE REPORTE
	ls_auxiliar = lds_registros.object.tipo_reporte[ll_cont] 								// 1
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 2.- FECHA DE INSTRUCCI$$HEX1$$d300$$ENDHEX$$N  Debe ir vac$$HEX1$$ed00$$ENDHEX$$a
	ls_auxiliar = ''																						// 2
//	if not isnull(lds_registros.object.tiempo_instruccion[ll_cont]) 	then  				
//	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion[ll_cont]
//		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
//			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
//		end if
//	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 3.- FECHA DE OCURRENCIA
	ls_auxiliar = ''																						// 3
	if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 4.- FECHA DE REPORTE Debe ir vac$$HEX1$$ed00$$ENDHEX$$a
	ls_auxiliar = ''																						// 4
//	if not isnull(lds_registros.object.tiempo_reporte[ll_cont]) 	then  				
//	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte[ll_cont]
//		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
//			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
//		end if
//	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	//JME 18/02/2010
	//Tambi$$HEX1$$e900$$ENDHEX$$n deben enviarse (aunque vac$$HEX1$$ed00$$ENDHEX$$o) los tiempos de despeje y aterrizae (6 tiempos)
	ls_auxiliar = ''	
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	//Fin JME 18/02/2010
	
	// 5.- NOMBRE DEL ACTIVO
	ll_nro_instalacion = lds_registros.object.nro_instalacion[ll_cont]					// 5
	uf_get_nombre_activo_propietario(ll_nro_instalacion, ls_nombre_activo, ls_agente_propietario)	
	ls_linea_registro += ls_nombre_activo + ','						
	
	// 6.- TIPO DE MOVIMIENTO
	ls_auxiliar = lds_registros.object.tipo_movimiento[ll_cont]								// 6
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 7.- DISPONIBILIDAD
	ls_auxiliar = string(lds_registros.object.disponibilidad_act[ll_cont]) 				// 7
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 8 y 9.- CAUSA y CAUSA DETALLADA
	ll_cod_causa = lds_registros.object.cod_causa[ll_cont]									// 8 y 9
	
	ll_auxiliar = uf_estructura_causa(ll_cod_causa, ll_nro_instalacion, ls_familia_causa, ls_causa_detallada)
	
	ls_linea_registro += ls_familia_causa		+ ','												// 8
	
	ls_linea_registro += ls_causa_detallada	+ ','												// 9
	
	// 10.- CSG_ID (Consignaci$$HEX1$$f300$$ENDHEX$$n nacional)
	ls_auxiliar = lds_registros.object.consignacion_nacional[ll_cont] 					// 10
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 11.- FECHA DE BYPASS
	ls_auxiliar = ''																						// 11
	if not isnull(lds_registros.object.fecha_bypass[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.fecha_bypass[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// JME 21/09/09 Se elimina el radicadold
	// ls_auxiliar = ''																						// 12 Radicadold
	//ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	// Fin JME
	
	// 12.- AGENTE CAUSANTE
	ll_auxiliar = lds_registros.object.activo_causante[ll_cont]
	uf_get_nombre_activo_propietario(ll_auxiliar, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_agente_propietario		+ ','										// 13 Agente causante	
	
	// 13.- ACTIVO CAUSANTE
	ls_linea_registro += ls_nombre_activo + ','													// 14 Nombre del activo causante			
//	ls_linea_registro += lds_registros.object.tipo_movimiento[ll_cont]					// 15
	
	// 14.- DESCRIPCION
	ls_auxiliar = lds_registros.object.observaciones[ll_cont] 								// 16 Observaciones
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) 							

	FileWrite(li_fichero, ls_linea_registro)
	FileWrite(ii_fichero_generico, ls_linea_registro)
	
	ls_linea_registro = ''
	
end for
	

ll_status = FileClose(li_fichero)


DESTROY lds_registros
end subroutine

public subroutine uf_generar_reporte_tipo_evento_stn ();
string ls_linea_registro, ls_auxiliar, ls_familia_causa, ls_causa_detallada
int li_fichero
long ll_nro_instalacion, ll_cod_causa
long ll_status, ll_tipo_reporte, ll_rows, ll_cont, ll_auxiliar
datetime ldt_fecha_auxiliar
string ls_nombre_activo, ls_agente_propietario
datastore lds_registros

ll_tipo_reporte = 1
li_fichero = FileOpen('c:\informe_tipo_evento_STN.txt', LineMode!, Write!, LockWrite!, Replace!)

lds_registros = CREATE datastore
lds_registros.dataobject = 'd_reportes_str_evento_stn'

lds_registros.SetTransObject(SQLCA)
lds_registros.Retrieve(idt_fecha_desde, idt_fecha_hasta)

ll_rows = lds_registros.RowCount()

ls_linea_registro = ''
 
for ll_cont = 1 to ll_rows
	// 1.- TIPO DE INFORME
	ls_auxiliar = lds_registros.object.tipo_reporte[ll_cont] 								
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	// 2.- FECHA DE INSTRUCCION
	ls_auxiliar = ''																						// 2
	if not isnull(lds_registros.object.tiempo_instruccion[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 3.- FECHA DE OCURRENCIA
	ls_auxiliar = ''																						// 3
	if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 4.- FECHA DE REPORTE
	ls_auxiliar = ''																						// 4
	if not isnull(lds_registros.object.tiempo_reporte[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	
	//JME 18/02/2010
	//Tambi$$HEX1$$e900$$ENDHEX$$n deben enviarse (aunque vac$$HEX1$$ed00$$ENDHEX$$o) los tiempos de despeje y aterrizae (6 tiempos)
	ls_auxiliar = ''	
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	//Fin JME 18/02/2010
	
	
	// 5.- ACTIVO
	ll_nro_instalacion = lds_registros.object.nro_instalacion[ll_cont]								// 5
	uf_get_nombre_activo_propietario(ll_nro_instalacion, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_nombre_activo		+ ','						
	
	// 6.- TIPO DE MOVIMIENTO 
	ls_auxiliar = lds_registros.object.tipo_movimiento[ll_cont]								// 6
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 7.- DISPONIBILIDAD
	ls_auxiliar = string(lds_registros.object.disponibilidad_act[ll_cont]) 				// 7
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 8 Y 9.-  CAUSA Y CAUSA DETALLADA
	ll_cod_causa = lds_registros.object.cod_causa[ll_cont]										// 8 y 9
	ll_auxiliar = uf_estructura_causa(ll_cod_causa, ll_nro_instalacion, ls_familia_causa, ls_causa_detallada)
	
	ls_linea_registro += ls_familia_causa		+ ','												// 8
	
	ls_linea_registro += ls_causa_detallada	+ ','												// 9
	
	// 10.- CSG_ID (Consignaci$$HEX1$$f300$$ENDHEX$$n)
	ls_auxiliar = lds_registros.object.consignacion_nacional[ll_cont] 					// 10
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 11.- FECHA DE BYPASS
	ls_auxiliar = ''																						// 11
	if not isnull(lds_registros.object.fecha_bypass[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.fecha_bypass[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	
	//JME 21/09/09 Se elimina el Radicadold
	//	ls_auxiliar = ''																					// 12 Radicadold
	//	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
   // Fin JME
	
	// 12.- AGENTE CAUSANTE
	ll_auxiliar = lds_registros.object.activo_causante[ll_cont]
	uf_get_nombre_activo_propietario(ll_auxiliar, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_agente_propietario		+ ','										// 12 Agente causante	
	
	// 13.- ACTIVO CAUSANTE
	ls_linea_registro += ls_nombre_activo + ','													// 13 Nombre del activo causante			
//	ls_linea_registro += lds_registros.object.tipo_movimiento[ll_cont]					// 14

	// 14.- DESCRIPCION
	ls_auxiliar = lds_registros.object.observaciones[ll_cont] 								// 14 Observaciones
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) 								

	FileWrite(li_fichero, ls_linea_registro)
	FileWrite(ii_fichero_generico, ls_linea_registro)
	
	ls_linea_registro = ''
	
end for
	

ll_status = FileClose(li_fichero)


DESTROY lds_registros
end subroutine

public subroutine uf_generar_reporte_tipo_evento_str ();
string ls_linea_registro, ls_auxiliar, ls_familia_causa, ls_causa_detallada
int li_fichero
long ll_nro_instalacion, ll_cod_causa
long ll_status, ll_tipo_reporte, ll_rows, ll_cont, ll_auxiliar
datetime ldt_fecha_auxiliar
string ls_nombre_activo, ls_agente_propietario
datastore lds_registros

ll_tipo_reporte = 1
li_fichero = FileOpen('c:\informe_tipo_evento_STR.txt', LineMode!, Write!, LockWrite!, Replace!)

lds_registros = CREATE datastore
lds_registros.dataobject = 'd_reportes_str_evento_str'

lds_registros.SetTransObject(SQLCA)
lds_registros.Retrieve(idt_fecha_desde, idt_fecha_hasta)

ll_rows = lds_registros.RowCount()

ls_linea_registro = ''
 
for ll_cont = 1 to ll_rows
	// 1.- TIPO DE INFORME
	ls_auxiliar = lds_registros.object.tipo_reporte[ll_cont] 								
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	// 2.- FECHA DE INSTRUCCION
	ls_auxiliar = ''																						// 2
	if not isnull(lds_registros.object.tiempo_instruccion[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 3.- FECHA DE OCURRENCIA
	ls_auxiliar = ''																						// 3
	if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 4.- FECHA DE REPORTE
	ls_auxiliar = ''																						// 4
	if not isnull(lds_registros.object.tiempo_reporte[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	//JME 18/02/2010
	//Tambi$$HEX1$$e900$$ENDHEX$$n deben enviarse (aunque vac$$HEX1$$ed00$$ENDHEX$$o) los tiempos de despeje y aterrizae (6 tiempos)
	ls_auxiliar = ''	
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	//Fin JME 18/02/2010
	
	// 5.- ACTIVO
	ll_nro_instalacion = lds_registros.object.nro_instalacion[ll_cont]								// 5
	uf_get_nombre_activo_propietario(ll_nro_instalacion, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_nombre_activo		+ ','						
	
	// 6.- TIPO DE MOVIMIENTO 
	ls_auxiliar = lds_registros.object.tipo_movimiento[ll_cont]								// 6
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 7.- DISPONIBILIDAD
	ls_auxiliar = string(lds_registros.object.disponibilidad_act[ll_cont]) 				// 7
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 8 Y 9.-  CAUSA Y CAUSA DETALLADA
	ll_cod_causa = lds_registros.object.cod_causa[ll_cont]										// 8 y 9
	ll_auxiliar = uf_estructura_causa(ll_cod_causa, ll_nro_instalacion, ls_familia_causa, ls_causa_detallada)
	
	ls_linea_registro += ls_familia_causa		+ ','												// 8
	
	ls_linea_registro += ls_causa_detallada	+ ','												// 9
	
	// 10.- CSG_ID (Consignaci$$HEX1$$f300$$ENDHEX$$n)
	ls_auxiliar = lds_registros.object.consignacion_nacional[ll_cont] 					// 10
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 11.- FECHA DE BYPASS
	ls_auxiliar = ''																						// 11
	if not isnull(lds_registros.object.fecha_bypass[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.fecha_bypass[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	
	//JME 21/09/09 Se elimina el Radicadold
	//	ls_auxiliar = ''																					// 12 Radicadold
	//	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
   // Fin JME
	
	// 12.- AGENTE CAUSANTE
	ll_auxiliar = lds_registros.object.activo_causante[ll_cont]
	uf_get_nombre_activo_propietario(ll_auxiliar, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_agente_propietario		+ ','										// 12 Agente causante	
	
	// 13.- ACTIVO CAUSANTE
	ls_linea_registro += ls_nombre_activo + ','													// 13 Nombre del activo causante			
//	ls_linea_registro += lds_registros.object.tipo_movimiento[ll_cont]					// 14

	// 14.- DESCRIPCION
	ls_auxiliar = lds_registros.object.observaciones[ll_cont] 								// 14 Observaciones
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) 								

	FileWrite(li_fichero, ls_linea_registro)
	FileWrite(ii_fichero_generico, ls_linea_registro)
	
	ls_linea_registro = ''
	
end for
	

ll_status = FileClose(li_fichero)


DESTROY lds_registros
end subroutine

public subroutine uf_generar_reporte_tipo_maniobra_stn ();
string ls_linea_registro, ls_auxiliar, ls_familia_causa, ls_causa_detallada
int li_fichero
long ll_status, ll_tipo_reporte, ll_rows, ll_cont, ll_auxiliar, ll_numero_de_dias
long ll_cod_causa, ll_nro_instalacion
datetime ldt_fecha_auxiliar
datetime ldt_fecha_ocurrencia, ldt_fecha_ocurrencia_despeje, ldt_fecha_ocurrencia_aterrizaje
date     ldate_ocurrencia, ldate_ocurrencia_despeje, ldate_ocurrencia_aterrizaje
string ls_nombre_activo, ls_agente_propietario

boolean lb_desdoblar_registro = false, lb_primer_registro = true

datastore lds_registros


ll_tipo_reporte = 2

li_fichero = FileOpen('c:\informe_tipo_maniobra_STN.txt', LineMode!, Write!, LockWrite!, Replace!)

lds_registros = CREATE datastore
lds_registros.dataobject = 'd_reportes_str_maniobra_stn'

lds_registros.SetTransObject(SQLCA)
lds_registros.Retrieve(idt_fecha_desde, idt_fecha_hasta)

ll_rows = lds_registros.RowCount()

ls_linea_registro = ''

for ll_cont = 1 to ll_rows
	// 1.- TIPO DE REPORTE
	ls_auxiliar = lds_registros.object.tipo_reporte[ll_cont] 								// 1
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								


	//JME 02/02/2010 Hay que desdoblar el registro en el caso de que la fecha de ocurrencia
	//sea distinta a la fecha de ocurrencia del despeje. 
	
	if lb_desdoblar_registro = false then
		if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) and &
			not isnull(lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]) then 
		
			ldt_fecha_ocurrencia = lds_registros.object.tiempo_ocurrencia[ll_cont]
			ldt_fecha_ocurrencia_despeje = lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]
			ldate_ocurrencia = date(ldt_fecha_ocurrencia)
			ldate_ocurrencia_despeje = date(ldt_fecha_ocurrencia_despeje)
			
			ll_numero_de_dias = DaysAfter(ldate_ocurrencia,ldate_ocurrencia_despeje)
			
			if ll_numero_de_dias <> 0 then 
				lb_desdoblar_registro = true
				lb_primer_registro = true			
			
				ll_numero_de_dias = DaysAfter(ldate_ocurrencia,date(idt_fecha_desde))
				
				if ll_numero_de_dias > 0 then 
					lb_primer_registro = false
				end if			
			end if
		end if
	else
		lb_primer_registro = false
	end if
	
	// 2.- FECHA DE INSTRUCCION
	ls_auxiliar = ''																						// 2
	if not isnull(lds_registros.object.tiempo_instruccion[ll_cont]) and &
	   lb_primer_registro = true then 
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 3.- FECHA DE OCURRENCIA
	ls_auxiliar = ''																						// 3
	if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) and &
	   lb_primer_registro = true then   
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 4.- FECHA DE REPORTE
	ls_auxiliar = ''																						// 4
	if not isnull(lds_registros.object.tiempo_reporte[ll_cont]) and &
	   lb_primer_registro = true then 
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','

	
	//JME 02/02/2010
	
	// 5.- FECHA DE INSTRUCCION DE DESPEJE
	ls_auxiliar = ''																						// 5
	if not isnull(lds_registros.object.tiempo_instruccion_despeje[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then  		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion_despeje[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 6.- FECHA DE OCURRENCIA DE DESPEJE
	ls_auxiliar = ''																						// 6
	if not isnull(lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then    		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 7.- FECHA DE REPORTE DE DESPEJE
	ls_auxiliar = ''																						// 7
	if not isnull(lds_registros.object.tiempo_reporte_despeje[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then   		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte_despeje[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','

	
	// 8.- FECHA DE INSTRUCCION DE ATERRIZAJE
	ls_auxiliar = ''																						// 8
	if not isnull(lds_registros.object.tiempo_instruccion_tierra[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then  		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion_tierra[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 9.- FECHA DE OCURRENCIA DE ATERRIZAJE
	ls_auxiliar = ''																						// 9
	if not isnull(lds_registros.object.tiempo_ocurrencia_tierra[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then  		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia_tierra[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 10.- FECHA DE REPORTE DE ATERRIZAJE
	ls_auxiliar = ''																						// 10
	if not isnull(lds_registros.object.tiempo_reporte_tierra[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then   		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte_tierra[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','

	// 11.- ACTIVO
	ll_nro_instalacion = lds_registros.object.nro_instalacion[ll_cont]					// 11
	uf_get_nombre_activo_propietario(ll_nro_instalacion, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_nombre_activo + ','						
	
	// 12.- TIPO DE MOVIMIENTO
	ls_auxiliar = lds_registros.object.tipo_movimiento[ll_cont]								// 12
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 13.- DISPONIBILIDAD
	ls_auxiliar = string(lds_registros.object.disponibilidad_act[ll_cont]) 				// 3
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 14 y 15.- CAUSA y CAUSA DETALLADAS
	ll_cod_causa = lds_registros.object.cod_causa[ll_cont]									// 14 y 15
	ll_auxiliar = uf_estructura_causa(ll_cod_causa, ll_nro_instalacion, ls_familia_causa, ls_causa_detallada)
	
	ls_linea_registro += ls_familia_causa		+ ','												// 14
	
	ls_linea_registro += ls_causa_detallada	+ ','												// 15
	
	// 16.- CSG_ID Consginaci$$HEX1$$f300$$ENDHEX$$n
	ls_auxiliar = lds_registros.object.consignacion_nacional[ll_cont] 					// 16
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 17.- FECHA DE BYPASS
	ls_auxiliar = ''																						// 17
	if not isnull(lds_registros.object.fecha_bypass[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.fecha_bypass[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// JME 21/09/09 Se elimina el radicadold
	// ls_auxiliar = ''																					// 12 Radicadold
	//ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	// Fin JME

	// 18.- AGENTE CAUSANTE
	ll_auxiliar = lds_registros.object.activo_causante[ll_cont]
	uf_get_nombre_activo_propietario(ll_auxiliar, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_agente_propietario		+ ','										// 18 Agente causante	
	
	// 19.- ACTIVO CAUSANTE
	ls_linea_registro += ls_nombre_activo + ','													// 19 Nombre del activo causante			
//	ls_linea_registro += lds_registros.object.tipo_movimiento[ll_cont]					

	// 20.-- DESCRIPCION
	ls_auxiliar = lds_registros.object.observaciones[ll_cont] 								// 20 Observaciones
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) 								

	FileWrite(li_fichero, ls_linea_registro)
	FileWrite(ii_fichero_generico, ls_linea_registro)

	ls_linea_registro = ''
	
	if lb_desdoblar_registro = true and lb_primer_registro = true then 
		ll_cont --
		lb_primer_registro = false
	else
		lb_desdoblar_registro = false
		lb_primer_registro = true
	end if
		
end for
	

ll_status = FileClose(li_fichero)


DESTROY lds_registros
end subroutine

public subroutine uf_generar_reporte_tipo_maniobra_str ();
string ls_linea_registro, ls_auxiliar, ls_familia_causa, ls_causa_detallada
int li_fichero
long ll_status, ll_tipo_reporte, ll_rows, ll_cont, ll_auxiliar, ll_numero_de_dias
long ll_cod_causa, ll_nro_instalacion
datetime ldt_fecha_auxiliar
datetime ldt_fecha_ocurrencia, ldt_fecha_ocurrencia_despeje, ldt_fecha_ocurrencia_aterrizaje
date     ldate_ocurrencia, ldate_ocurrencia_despeje, ldate_ocurrencia_aterrizaje
string ls_nombre_activo, ls_agente_propietario

boolean lb_desdoblar_registro = false, lb_primer_registro = true

datastore lds_registros


ll_tipo_reporte = 2

li_fichero = FileOpen('c:\informe_tipo_maniobra_STR.txt', LineMode!, Write!, LockWrite!, Replace!)

lds_registros = CREATE datastore
lds_registros.dataobject = 'd_reportes_str_maniobra_str'

lds_registros.SetTransObject(SQLCA)
lds_registros.Retrieve(idt_fecha_desde, idt_fecha_hasta)

ll_rows = lds_registros.RowCount()

ls_linea_registro = ''

for ll_cont = 1 to ll_rows
	// 1.- TIPO DE REPORTE
	ls_auxiliar = lds_registros.object.tipo_reporte[ll_cont] 								// 1
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								


	//JME 02/02/2010 Hay que desdoblar el registro en el caso de que la fecha de ocurrencia
	//sea distinta a la fecha de ocurrencia del despeje. 
	
	if lb_desdoblar_registro = false then
		if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) and &
			not isnull(lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]) then 
		
			ldt_fecha_ocurrencia = lds_registros.object.tiempo_ocurrencia[ll_cont]
			ldt_fecha_ocurrencia_despeje = lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]
			ldate_ocurrencia = date(ldt_fecha_ocurrencia)
			ldate_ocurrencia_despeje = date(ldt_fecha_ocurrencia_despeje)
			
			ll_numero_de_dias = DaysAfter(ldate_ocurrencia,ldate_ocurrencia_despeje)
			
			if ll_numero_de_dias <> 0 then 
				lb_desdoblar_registro = true
				lb_primer_registro = true			
			
				ll_numero_de_dias = DaysAfter(ldate_ocurrencia,date(idt_fecha_desde))
				
				if ll_numero_de_dias > 0 then 
					lb_primer_registro = false
				end if			
			end if
		end if
	else
		lb_primer_registro = false
	end if
	
	// 2.- FECHA DE INSTRUCCION
	ls_auxiliar = ''																						// 2
	if not isnull(lds_registros.object.tiempo_instruccion[ll_cont]) and &
	   lb_primer_registro = true then 
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 3.- FECHA DE OCURRENCIA
	ls_auxiliar = ''																						// 3
	if not isnull(lds_registros.object.tiempo_ocurrencia[ll_cont]) and &
	   lb_primer_registro = true then   
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 4.- FECHA DE REPORTE
	ls_auxiliar = ''																						// 4
	if not isnull(lds_registros.object.tiempo_reporte[ll_cont]) and &
	   lb_primer_registro = true then 
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','

	
	//JME 02/02/2010
	
	// 5.- FECHA DE INSTRUCCION DE DESPEJE
	ls_auxiliar = ''																						// 5
	if not isnull(lds_registros.object.tiempo_instruccion_despeje[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then  		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion_despeje[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 6.- FECHA DE OCURRENCIA DE DESPEJE
	ls_auxiliar = ''																						// 6
	if not isnull(lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then    		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia_despeje[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 7.- FECHA DE REPORTE DE DESPEJE
	ls_auxiliar = ''																						// 7
	if not isnull(lds_registros.object.tiempo_reporte_despeje[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then   		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte_despeje[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','

	
	// 8.- FECHA DE INSTRUCCION DE ATERRIZAJE
	ls_auxiliar = ''																						// 8
	if not isnull(lds_registros.object.tiempo_instruccion_tierra[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then  		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_instruccion_tierra[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 9.- FECHA DE OCURRENCIA DE ATERRIZAJE
	ls_auxiliar = ''																						// 9
	if not isnull(lds_registros.object.tiempo_ocurrencia_tierra[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then  		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_ocurrencia_tierra[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// 10.- FECHA DE REPORTE DE ATERRIZAJE
	ls_auxiliar = ''																						// 10
	if not isnull(lds_registros.object.tiempo_reporte_tierra[ll_cont]) and &
	   (lb_desdoblar_registro = false or &
		(lb_desdoblar_registro = true and lb_primer_registro = false) ) then   		
		
	   ldt_fecha_auxiliar = lds_registros.object.tiempo_reporte_tierra[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','

	// 11.- ACTIVO
	ll_nro_instalacion = lds_registros.object.nro_instalacion[ll_cont]					// 11
	uf_get_nombre_activo_propietario(ll_nro_instalacion, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_nombre_activo + ','						
	
	// 12.- TIPO DE MOVIMIENTO
	ls_auxiliar = lds_registros.object.tipo_movimiento[ll_cont]								// 12
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 13.- DISPONIBILIDAD
	ls_auxiliar = string(lds_registros.object.disponibilidad_act[ll_cont]) 				// 3
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								

	// 14 y 15.- CAUSA y CAUSA DETALLADAS
	ll_cod_causa = lds_registros.object.cod_causa[ll_cont]									// 14 y 15
	ll_auxiliar = uf_estructura_causa(ll_cod_causa, ll_nro_instalacion, ls_familia_causa, ls_causa_detallada)
	
	ls_linea_registro += ls_familia_causa		+ ','												// 14
	
	ls_linea_registro += ls_causa_detallada	+ ','												// 15
	
	// 16.- CSG_ID Consginaci$$HEX1$$f300$$ENDHEX$$n
	ls_auxiliar = lds_registros.object.consignacion_nacional[ll_cont] 					// 16
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	
	// 17.- FECHA DE BYPASS
	ls_auxiliar = ''																						// 17
	if not isnull(lds_registros.object.fecha_bypass[ll_cont]) 	then  				
	   ldt_fecha_auxiliar = lds_registros.object.fecha_bypass[ll_cont]
		if DaysAfter(idate_fecha_minima,date(ldt_fecha_auxiliar)) > 0 then			
			ls_auxiliar = string(ldt_fecha_auxiliar, 'yyyy-mm-dd hh:mm:ss')
		end if
	end if
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','
	
	// JME 21/09/09 Se elimina el radicadold
	// ls_auxiliar = ''																					// 12 Radicadold
	//ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) + ','								
	// Fin JME

	// 18.- AGENTE CAUSANTE
	ll_auxiliar = lds_registros.object.activo_causante[ll_cont]
	uf_get_nombre_activo_propietario(ll_auxiliar, ls_nombre_activo, ls_agente_propietario)
	ls_linea_registro += ls_agente_propietario		+ ','										// 18 Agente causante	
	
	// 19.- ACTIVO CAUSANTE
	ls_linea_registro += ls_nombre_activo + ','													// 19 Nombre del activo causante			
//	ls_linea_registro += lds_registros.object.tipo_movimiento[ll_cont]					

	// 20.-- DESCRIPCION
	ls_auxiliar = lds_registros.object.observaciones[ll_cont] 								// 20 Observaciones
	ls_linea_registro += uf_validar_valor_nulo(ls_auxiliar) 								

	FileWrite(li_fichero, ls_linea_registro)
	FileWrite(ii_fichero_generico, ls_linea_registro)

	ls_linea_registro = ''
	
	if lb_desdoblar_registro = true and lb_primer_registro = true then 
		ll_cont --
		lb_primer_registro = false
	else
		lb_desdoblar_registro = false
		lb_primer_registro = true
	end if
		
end for
	

ll_status = FileClose(li_fichero)


DESTROY lds_registros
end subroutine

on u_reportes_str.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_reportes_str.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
idate_fecha_minima = date('2000-01-01')

//JME 21/09/09 El agente causante debe ser nulo.
//(Ver documento: Aclaraciones implementaciones SGI-OOP-CREG-20090917_V1 (3).ppt
//CHOOSE CASE gi_pais 
//	CASE 6
//		is_agente_causante = 'EPSA'	
//	CASE 7 
//		is_agente_causante = 'EC'	
//END CHOOSE	

is_agente_causante = ''

ii_fichero_generico = FileOpen('c:\informe_generico_STN.txt', LineMode!, Write!, LockWrite!, Replace!)

end event

event destructor;long ll_status 


//ll_status = FileClose(ii_fichero_generico)

ll_status = 1

end event


HA$PBExportHeader$w_mensualdeinterrupciones.srw
forward
global type w_mensualdeinterrupciones from w_sgigenerica
end type
type dw_mensual_de_interrupciones from datawindow within w_mensualdeinterrupciones
end type
type gb_1 from groupbox within w_mensualdeinterrupciones
end type
type dw_filtro from datawindow within w_mensualdeinterrupciones
end type
end forward

global type w_mensualdeinterrupciones from w_sgigenerica
integer width = 3657
integer height = 2400
string title = "OPEN SGI - Informe Mensual de Interrupciones"
string menuname = "md_reportes_mensuales"
long backcolor = 79741120
string icon = "Open.ico"
event ue_ir_comienzo ( )
event ue_ir_final ( )
event ue_buscar ( )
event ue_exportar_excel ( )
event ue_mostrar_preliminar ( )
dw_mensual_de_interrupciones dw_mensual_de_interrupciones
gb_1 gb_1
dw_filtro dw_filtro
end type
global w_mensualdeinterrupciones w_mensualdeinterrupciones

type variables

end variables

event ue_ir_comienzo();SetPointer(HourGlass!)

dw_mensual_de_interrupciones.selectrow(dw_mensual_de_interrupciones.getRow(),false)

dw_mensual_de_interrupciones.selectrow(1,true)
dw_mensual_de_interrupciones.scrolltorow(1)

end event

event ue_ir_final();SetPointer(HourGlass!)

Integer li_count

dw_mensual_de_interrupciones.selectrow(dw_mensual_de_interrupciones.getRow(),false)
li_count = dw_mensual_de_interrupciones.rowcount()
dw_mensual_de_interrupciones.selectrow(li_count,true)
dw_mensual_de_interrupciones.scrolltorow(li_count)

end event

event ue_buscar();Date ldt_fecha
String ls_fecha
Int li_tension//, li_tip_incidencia
Int li_row
Boolean lb_hay_datos = True

Long ll_num_inc, ll_cant_cli_afec
DateTime ldt_fec_ini_int
String ls_tiempo_ini_int, ls_sector, ls_salida, ls_tipo_descargo, ls_causa
Decimal ld_duracion, ld_pot_instalada, ld_pot_afectada

String ls_denominacion, ls_acciones, ls_localidades, ls_lista_localidades
Long ll_cant_cts_descon

Long ll_nro_descargo, ll_pos

dw_mensual_de_interrupciones.Reset()
dw_filtro.AcceptText()

ldt_fecha = dw_filtro.GetItemDate(1,'fecha')

If IsNull(ldt_fecha) Then
  gnv_msg.f_mensaje("EG22","","",OK!)
  //messagebox("Error","Las fechas no puede ser nulas")
  dw_filtro.SetFocus()
  Return
End If 

SetPointer(HourGlass!)
dw_mensual_de_interrupciones.SetRedraw(False)

If month(ldt_fecha) > 9 Then
	ls_fecha = String(string(year(ldt_fecha)) + string(month(ldt_fecha)))
Else
	ls_fecha = String(string(year(ldt_fecha)) + '0' + string(month(ldt_fecha)))
End If

li_tension = dw_filtro.GetItemNumber(1, 'tension')
//li_tip_incidencia = dw_filtro.GetItemNumber(1, 'tip_incidencia')

//dw_mensual_de_interrupciones.Retrieve(li_tension, li_tip_incidencia, ls_fecha)

DECLARE cur_interrup CURSOR FOR 
SELECT SGD_INCIDENCIA.NRO_INCIDENCIA "NUM. DE INCIDENCIA",
	   TO_DATE(MIN(SGD_INTERRUPCION.F_ALTA)) "FECH.INI.INT.",
	   TO_CHAR(MIN(SGD_INTERRUPCION.F_ALTA), 'HH24:MI') "TIEMPO INI.INT.",
	   ROUND(NVL(fgnu_tiempo_interrupcion_3(max(SGD_INTERRUPCION.F_REPOSICION), min(SGD_INTERRUPCION.F_ALTA), null, null, null, null, null, null), 0)/60, 2) "DURACION",
	   MAX(SGD_CENTRO.NOM_CENTRO) "SECTOR",
//	   DECODE(max(INST1.TIPO_INSTALACION), :fgci_tipo_salida_mt, max(SUBSTR(NOM_INSTALACION, -3, 3)), '') "SALIDA", //fgci_tipo_salida_mt = 4
	   DECODE(max(INST1.TIPO_INSTALACION), :fgci_tipo_salida_mt, decode(instr(max(SUBSTR(NOM_INSTALACION, -3, 3)), '-'), 1, max(SUBSTR(NOM_INSTALACION, -2, 2)), max(SUBSTR(NOM_INSTALACION, -3, 3))), '') "SALIDA", //fgci_tipo_salida_mt = 4
	   DECODE(MAX(TIP_INCIDENCIA), :fgci_incidencia_programada, DECODE(MAX(DESCARG1.DESCRIPCION), 'plan', 'PL', 'neplan', 'NP', 'AV'), 'AV') "TIPO DESCARGO",
	   max(GI_CAUSA.DESCRIPCION) "CAUSA",
	   NVL(SUM(SGD_INTERRUPCION.CCLI_AFEC), 0) "CANT.CLI.AFECTADOS",
	   ROUND(NVL(SUM(SGD_INTERRUPCION.POT_CONTRATADA), 0)/1000, 2) "POT.INSTALADA",
	   ROUND(NVL(SUM(SGD_INTERRUPCION.POT_INSTALADA), 0), 2) "POT.AFECTADA",
		MAX(DESCARG1.NRO_DESCARGO)
FROM SGD_INCIDENCIA, SGD_INTERRUPCION, SGD_CENTRO, GI_CAUSA, SGD_INSTALACION INST1, SGD_DESCARGOS DESCARG1
WHERE SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_INTERRUPCION.NRO_INCIDENCIA AND
	  SGD_INCIDENCIA.NRO_INCIDENCIA = DESCARG1.NRO_INCIDENCIA (+) AND
	  SGD_INCIDENCIA.NRO_MESA = SGD_CENTRO.NRO_CENTRO AND
	  SGD_INCIDENCIA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND
	  SGD_INTERRUPCION.NRO_INSTALACION = INST1.NRO_INSTALACION AND
	  SGD_INCIDENCIA.TIP_TENSION = :li_tension AND
	  SGD_INCIDENCIA.TIP_INCIDENCIA BETWEEN :fgci_incidencia_imprevista AND :fgci_incidencia_programada AND //1 AND 2 AND
	  TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ls_fecha
  	  AND SGD_INCIDENCIA.EST_ACTUAL = :fgci_incidencia_resuelta // fgci_incidencia_resuelta = 5 // A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Incidencia 0/362901 - Moldavia. 1/08/2005.
//	  AND (INST1.TIPO_INSTALACION= :fgci_tipo_subestacion OR INST1.TIPO_INSTALACION= : fgci_tipo_salida_mt) // GNU 29-08-2005 //Comentado GNU 14-10-2005  Incidencia 0/375765
GROUP BY SGD_INCIDENCIA.NRO_INCIDENCIA
UNION
SELECT SGD_INCIDENCIA.NRO_INCIDENCIA "NUM. DE INCIDENCIA",
	   TO_DATE(MIN(SGD_INTERRUPCION_RS.F_ALTA)) "FECH.INI.INT.",
	   TO_CHAR(MIN(SGD_INTERRUPCION_RS.F_ALTA), 'HH24:MI') "TIEMPO INI.INT.",
	   ROUND(NVL(fgnu_tiempo_interrupcion_3(max(SGD_INTERRUPCION_RS.F_REPOSICION), min(SGD_INTERRUPCION_RS.F_ALTA), null, null, null, null, null, null), 0)/60, 2) "DURACION",
	   MAX(SGD_CENTRO.NOM_CENTRO) "SECTOR",
//	   DECODE(max(INST1.TIPO_INSTALACION), :fgci_tipo_salida_mt, max(SUBSTR(NOM_INSTALACION, -3, 3)), '') "SALIDA", //fgci_tipo_salida_mt = 4
	   DECODE(max(INST1.TIPO_INSTALACION), :fgci_tipo_salida_mt, decode(instr(max(SUBSTR(INST1.NOM_INSTALACION, -3, 3)), '-'), 1, max(SUBSTR(INST1.NOM_INSTALACION, -2, 2)), max(SUBSTR(INST1.NOM_INSTALACION, -3, 3))), '') "SALIDA", //fgci_tipo_salida_mt = 4
	   DECODE(MAX(TIP_INCIDENCIA), :fgci_incidencia_programada, DECODE(MAX(DESCARG1.DESCRIPCION), 'plan', 'PL', 'neplan', 'NP', 'AV'), 'AV') "TIPO DESCARGO",
	   max(GI_CAUSA.DESCRIPCION) "CAUSA",
	   NVL(SUM(SGD_INTERRUPCION_RS.CCLI_AFEC), 0) "CANT.CLI.AFECTADOS",
	   ROUND(NVL(SUM(SGD_INTERRUPCION_RS.POT_CONTRATADA), 0)/1000, 2) "POT.INSTALADA",
	   ROUND(NVL(SUM(SGD_INTERRUPCION_RS.POT_INSTALADA), 0), 2) "POT.AFECTADA",
		MAX(DESCARG1.NRO_DESCARGO)
FROM SGD_INCIDENCIA, SGD_INTERRUPCION_RS, SGD_CENTRO, GI_CAUSA, SGD_INSTALACION INST1, SGD_DESCARGOS DESCARG1
WHERE SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_INTERRUPCION_RS.NRO_INCIDENCIA AND
	  SGD_INCIDENCIA.NRO_INCIDENCIA = DESCARG1.NRO_INCIDENCIA (+) AND
	  SGD_INCIDENCIA.NRO_MESA = SGD_CENTRO.NRO_CENTRO AND
	  SGD_INCIDENCIA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+) AND
	  SGD_INTERRUPCION_RS.NRO_INSTALACION = INST1.NRO_INSTALACION AND
	  SGD_INCIDENCIA.TIP_TENSION = :li_tension AND
	  SGD_INCIDENCIA.TIP_INCIDENCIA BETWEEN :fgci_incidencia_imprevista AND :fgci_incidencia_programada AND //1 AND 2 AND
	  TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ls_fecha
  	  AND SGD_INCIDENCIA.EST_ACTUAL = :fgci_incidencia_resuelta // fgci_incidencia_resuelta = 5 // A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Incidencia 0/362901 - Moldavia. 1/08/2005.
//	  AND (INST1.TIPO_INSTALACION= :fgci_tipo_subestacion OR INST1.TIPO_INSTALACION= : fgci_tipo_salida_mt) // GNU 29-08-2005 //Comentado GNU 14-10-2005  Incidencia 0/375765
GROUP BY SGD_INCIDENCIA.NRO_INCIDENCIA
USING SqlCa;
//	  SGD_INCIDENCIA.TIP_INCIDENCIA = :li_tip_incidencia AND

Open cur_interrup;

Fetch cur_interrup Into :ll_num_inc, :ldt_fec_ini_int, &
								:ls_tiempo_ini_int, :ld_duracion, &
								:ls_sector, :ls_salida, &
								:ls_tipo_descargo, :ls_causa, &
								:ll_cant_cli_afec, :ld_pot_instalada, &
								:ld_pot_afectada, :ll_nro_descargo;

If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then
	li_row = dw_mensual_de_interrupciones.InsertRow(0)

	If IsNull(ls_causa) Or Trim(ls_causa) = "" Then ls_causa = "** ELIMINADA DE GI_CAUSAS **"
Else
	lb_hay_datos = False
End If
// GNU 17-10-2005. Incidencia 0/375797
DECLARE cur_localidades CURSOR FOR
	SELECT DISTINCT(LOCALIDADES.NOM_LOCAL) || ','
	   	 FROM ACO_SUM, SGD_ACOMETIDA, LOCALIDADES,
	   		    (SELECT  NRO_INSTALACION
				   FROM SGD_INSTALACION
				  WHERE SGD_INSTALACION.TIPO_INSTALACION = 7   		
				  	START WITH SGD_INSTALACION.NRO_INSTALACION in (SELECT nro_inst_afectada		   
					   		 								 	   FROM SGD_incidencia  			   
																  WHERE NRO_incidencia= :ll_num_inc)  		
	   			   AND SGD_INSTALACION.BDI_JOB = 0   		
				   CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE   					
				   AND  bdi_job = 0) INST_AFECTADAS       
		WHERE ( SGD_ACOMETIDA.INSTALACION_ORIGEN = INST_AFECTADAS.NRO_INSTALACION ) and
		  	  ( SGD_ACOMETIDA.CODIGO = ACO_SUM.NRO_ACOMETIDA ) and
			  ( SGD_ACOMETIDA.BDI_JOB = 0 ) and
			  ( LOCALIDADES.COD_LOCAL = ACO_SUM.COD_LOC )
		USING SqlCa;
// FIN GNU

Do While SqlCa.SqlCode <> 100 And SqlCa.SqlCode <> -1

	dw_mensual_de_interrupciones.SetItem(li_row, 'num_incidencia', ll_num_inc)
	dw_mensual_de_interrupciones.SetItem(li_row, 'fech_ini_int', ldt_fec_ini_int)
	dw_mensual_de_interrupciones.SetItem(li_row, 'tiempo_ini_int', ls_tiempo_ini_int)
	dw_mensual_de_interrupciones.SetItem(li_row, 'duracion', ld_duracion)
	dw_mensual_de_interrupciones.SetItem(li_row, 'sgd_centro_sector', ls_sector)

   ls_denominacion = ''

	SELECT NVL(MATRICULA, '')
	into :ls_denominacion
	FROM SGD_INCIDENCIA, SGD_INSTALACION 
	WHERE SGD_INSTALACION.NRO_INSTALACION = SGD_INCIDENCIA.NRO_INST_AFECTADA
	  AND SGD_INSTALACION.TIPO_INSTALACION = :fgci_tipo_subestacion //:fgci_tipo_subestacion = 3
	  AND SGD_INCIDENCIA.NRO_INCIDENCIA = :ll_num_inc;

	If IsNull(ls_denominacion) Or Trim(ls_denominacion) = '' Then

		//GNU 14-10-2005. Incidencia: 0/375765
		SELECT NVL(MATRICULA, '')
		into :ls_denominacion
		FROM SGD_INSTALACION
		WHERE NRO_INSTALACION IN (SELECT SGD_INSTALACION.NRO_INST_PADRE
									FROM  SGD_INSTALACION 
									WHERE  SGD_INSTALACION.TIPO_INSTALACION=4
									START WITH SGD_INSTALACION.NRO_INSTALACION IN (SELECT NRO_INST_AFECTADA
																				FROM SGD_INCIDENCIA
																				WHERE SGD_INCIDENCIA.NRO_INCIDENCIA = :ll_num_inc)
									CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE  );
		
//		SELECT NVL(MATRICULA, '')
//		into :ls_denominacion
//		FROM SGD_INSTALACION
//		WHERE NRO_INSTALACION IN (SELECT SGD_INSTALACION.NRO_INST_PADRE
//									FROM  SGD_INSTALACION 
//									WHERE SGD_INSTALACION.NRO_INSTALACION IN (SELECT NRO_INST_AFECTADA
//																				FROM SGD_INCIDENCIA
//																				WHERE SGD_INSTALACION.TIPO_INSTALACION = :fgci_tipo_salida_mt //:fgci_tipo_salida_mt = 4
//																				  AND SGD_INCIDENCIA.NRO_INCIDENCIA = :ll_num_inc));

// Fin GNU
	End IF
	//GNU 22-3-2006. Incidencia: 0/416975
	If IsNull(ls_salida) Or Trim(ls_salida) = '' Then
		SELECT   DECODE(max(TIPO_INSTALACION), :fgci_tipo_salida_mt, decode(instr(max(SUBSTR(NOM_INSTALACION, -3, 3)), '-'), 1, max(SUBSTR(NOM_INSTALACION, -2, 2)), max(SUBSTR(NOM_INSTALACION, -3, 3))), '') "SALIDA"
		into :ls_salida
		FROM SGD_INSTALACION
		WHERE NRO_INSTALACION IN (SELECT SGD_INSTALACION.NRO_INST_PADRE
									FROM  SGD_INSTALACION 
									WHERE  SGD_INSTALACION.TIPO_INSTALACION=5
									START WITH SGD_INSTALACION.NRO_INSTALACION IN (SELECT NRO_INST_AFECTADA
																				FROM SGD_INCIDENCIA
																				WHERE SGD_INCIDENCIA.NRO_INCIDENCIA = :ll_num_inc)
									CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE  );
	End if;	
	// FIN GNU


	dw_mensual_de_interrupciones.SetItem(li_row, 'denominacion', ls_denominacion)

	dw_mensual_de_interrupciones.SetItem(li_row, 'salida', ls_salida)
	dw_mensual_de_interrupciones.SetItem(li_row, 'tipo_descargo', ls_tipo_descargo)
	dw_mensual_de_interrupciones.SetItem(li_row, 'gi_causa_causa', ls_causa)

   ls_acciones = ''

	SELECT SGD_VALOR.DESCRIPCION "ACCIONES"
	into :ls_acciones
	  FROM SGD_VALOR, GI_ACCION_INC
	 WHERE CODIF = 'ACC' AND SGD_VALOR.CODIGO = GI_ACCION_INC.COD_ACCION AND NRO_INCIDENCIA = :ll_num_inc;

	dw_mensual_de_interrupciones.SetItem(li_row, 'acciones', ls_acciones)
// GNU 17-10-2005. Incidencia 0/375797
	ls_localidades = ""
	ls_lista_localidades= ""
	open cur_localidades;
	Fetch cur_localidades into :ls_localidades;
	Do While SqlCa.SqlCode <> 100 And SqlCa.SqlCode <> -1
		ls_lista_localidades= ls_lista_localidades + ls_localidades
		Fetch cur_localidades into :ls_localidades;
	loop
	Close cur_localidades;
	
//	SELECT DISTINCT(LOCALIDADES.NOM_LOCAL) || ','
//	into :ls_localidades
//	   	 FROM ACO_SUM, SGD_ACOMETIDA, LOCALIDADES,
//	   		    (SELECT  NRO_INSTALACION
//				   FROM SGD_INSTALACION
//				  WHERE SGD_INSTALACION.TIPO_INSTALACION = 7   		
//				  	START WITH SGD_INSTALACION.NRO_INSTALACION in (SELECT SGD_INTERRUPCION_DESCARGO.COD_INSTALACION   			   
//					   		 								 	   FROM SGD_INTERRUPCION_DESCARGO   			   
//																  WHERE NRO_DESCARGO = :ll_nro_descargo)  		
//	   			   AND SGD_INSTALACION.BDI_JOB = 0   		
//				   CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE   					
//				   AND  bdi_job = 0) INST_AFECTADAS       
//		WHERE ( SGD_ACOMETIDA.INSTALACION_ORIGEN = INST_AFECTADAS.NRO_INSTALACION ) and
//		  	  ( SGD_ACOMETIDA.CODIGO = ACO_SUM.NRO_ACOMETIDA ) and
//			  ( SGD_ACOMETIDA.BDI_JOB = 0 ) and
//			  ( LOCALIDADES.COD_LOCAL = ACO_SUM.COD_LOC );

ls_lista_localidades = left(ls_lista_localidades,len(ls_lista_localidades)-1)

dw_mensual_de_interrupciones.SetItem(li_row, 'localidades', ls_lista_localidades)
//dw_mensual_de_interrupciones.SetItem(li_row, 'localidades', ls_localidades)
// FIN GNU
	dw_mensual_de_interrupciones.SetItem(li_row, 'afectados', ll_cant_cli_afec)
	dw_mensual_de_interrupciones.SetItem(li_row, 'instalada', ld_pot_instalada)
	dw_mensual_de_interrupciones.SetItem(li_row, 'afectada', ld_pot_afectada)
	
	SELECT COUNT(*) "CANTIDAD CT DESCONECTADOS"
	into :ll_cant_cts_descon
	 FROM SGD_INTERRUPCION
	WHERE NRO_INCIDENCIA = :ll_num_inc;

	// GNU 15-6-2006. Incidencia 0/436358
	IF ll_cant_cts_descon = 0 THEN
		SELECT COUNT(*) "CANTIDAD CT DESCONECTADOS"
		into :ll_cant_cts_descon
	 	FROM SGD_INTERRUPCION_RS
		WHERE NRO_INCIDENCIA = :ll_num_inc;
	END IF
	// FIN GNU

	dw_mensual_de_interrupciones.SetItem(li_row, 'cant_cts_descon', ll_cant_cts_descon)
	dw_mensual_de_interrupciones.SetItem(li_row, 'suministro_insuficiente', Round(ld_duracion * ld_pot_instalada, 2))

	Fetch cur_interrup Into :ll_num_inc, :ldt_fec_ini_int, &
									:ls_tiempo_ini_int, :ld_duracion, &
									:ls_sector, :ls_salida, &
									:ls_tipo_descargo, :ls_causa, &
									:ll_cant_cli_afec, :ld_pot_instalada, &
									:ld_pot_afectada, :ll_nro_descargo;

	If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then
		If IsNull(ls_causa) Or Trim(ls_causa) = "" Then ls_causa = "** ELIMINADA DE GI_CAUSAS **"

		li_row = dw_mensual_de_interrupciones.InsertRow(0)
	End If
Loop

Close cur_interrup;

dw_mensual_de_interrupciones.SetRedraw(True)

If lb_hay_datos = False Then gnv_msg.f_mensaje("IT01","","",Ok!)
//									messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se encontraron Registros con los criterios seleccionados")

end event

event ue_exportar_excel();///////////////////////////////////////////////////////
//										
// Evento: ue_exportar_excel
// 
// Objetivo: Script para exportar el contenido de un informe generado a un 
//				 fichero con formato Excel 
//	
//
// Responsable:  SGO
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
//		Fecha			Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
//		------	   -----------			---------
//  08/06/2005			SGO			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
///////////////////////////////////////////////////////

String ls_nombre_archivo, rfilename
boolean lb_existe

// consultamos si hay datos que exportar a Excel. Si no hay no se genera fichero
IF dw_mensual_de_interrupciones.rowcount() = 0 THEN
	gnv_msg.F_MENSAJE("AP09","","",ok!)
ELSE
	// El informe tiene datos

	// Se obtiene el nombre del fichero donde el usuario quiere exportar el informe
	IF GetFileSaveName( "", ls_nombre_archivo, rfilename ,"XLS","Excel (*.XLS),*.XLS" ) = 1 THEN
	// Se comprueba si existe el fichero
		lb_existe = FileExists(ls_nombre_archivo)
	
		IF lb_existe THEN 
			//Se confirmar que quiere grabar el fichero que ya existe
			IF gnv_msg.F_MENSAJE("CP04",ls_nombre_archivo,"",YesNo!) = 1 THEN //$$HEX1$$bf00$$ENDHEX$$Sobreescribir el fichero ya existente?
				IF dw_mensual_de_interrupciones.SaveAs (ls_nombre_archivo, Excel!, True)	= -1 THEN
					gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
				END IF
			END IF 
		ELSE
			IF dw_mensual_de_interrupciones.SaveAs(ls_nombre_archivo, Excel!, True)	= -1 THEN
				gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
			END IF
		END IF
	END IF
END IF

end event

event ue_mostrar_preliminar();string data

//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	01/05/2001  data= w_reportes.dw_1.Object.DataWindow.Syntax
//**  OSGI 2001.1  	01/05/2001  OpenWithParm(w_reportes_preview,data)
//**  OSGI 2001.1  	01/05/2001  //w_reportes.dw_1.Object.DataWindow.Print.preview(true)

//This.dw_mensual_de_interrupciones.Object.DataWindow.Print.preview(true)

data = This.dw_mensual_de_interrupciones.Object.DataWindow.Syntax
OpenWithParm(w_reportes_preview, data)

//IF IsValid(w_reportes) THEN
//	If fg_verifica_parametro(ParentWindow.ClassName()) Then
//		w_reportes.f_titulo_subtitulo()
//		w_reportes.str_print.PARM1=true
//	End If
//	
//	data = w_reportes.dw_1.Object.DataWindow.Syntax
//	OpenWithParm(w_reportes_preview, data)
//ELSEIF IsValid(w_reportes_new) THEN
//	w_reportes_new.f_titulo_subtitulo()
//	w_reportes_new.str_print_new.PARM1=true
//
//	data = w_reportes_new.dw_1.Object.DataWindow.Syntax
//	OpenWithParm(w_reportes_preview, data)
//END IF
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on w_mensualdeinterrupciones.create
int iCurrent
call super::create
if this.MenuName = "md_reportes_mensuales" then this.MenuID = create md_reportes_mensuales
this.dw_mensual_de_interrupciones=create dw_mensual_de_interrupciones
this.gb_1=create gb_1
this.dw_filtro=create dw_filtro
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mensual_de_interrupciones
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.dw_filtro
end on

on w_mensualdeinterrupciones.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_mensual_de_interrupciones)
destroy(this.gb_1)
destroy(this.dw_filtro)
end on

event open;DateTime ldt_hoy

ldt_hoy = fgnu_fecha_actual()


DataWindowChild ldwch_tension
	
dw_filtro.GetChild ("tension", ldwch_tension)
ldwch_tension.SetTransObject(SQLCA)
ldwch_tension.Retrieve()
dw_filtro.SetItem(1,"tension", fgci_media_tension) //2


//DataWindowChild ldwch_tip_incidencia
//
//dw_filtro.GetChild ("tip_incidencia", ldwch_tip_incidencia)
//ldwch_tip_incidencia.SetTransObject(SQLCA)
//ldwch_tip_incidencia.Retrieve(3)
//dw_filtro.SetItem(1,"tip_incidencia", fgci_incidencia_imprevista) //1


//DataWindowChild ldwch_tip_instalacion
//
//dw_filtro.GetChild ("tip_instalacion", ldwch_tip_instalacion)
//ldwch_tip_instalacion.SetTransObject(SQLCA)
//ldwch_tip_instalacion.Retrieve()
//dw_filtro.SetItem(1,"tip_instalacion", fgci_tipo_salida_mt) //4

dw_filtro.SetItem(1,'fecha',date("01/"+string(month(date(ldt_hoy)))+"/"+string(year(date(ldt_hoy)))))

TriggerEvent("ue_buscar")

end event

event ue_arch_imprimir;call super::ue_arch_imprimir;/////////////////////////////////////////////////////////////////////////
//
// Evento:   Imprimir
//
// Objetivo: Imprime reporte
//		
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//     Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//     ---------       -----     ----------- 
//		Creacci$$HEX1$$f300$$ENDHEX$$n	  08/06/2005  		SGO
//
/////////////////////////////////////////////////////////////////////////

str_print.dwprint=dw_mensual_de_interrupciones
str_print.titulo="Generaci$$HEX1$$f300$$ENDHEX$$n Sentencia SQL"
str_print.PARM1=true
OpenWithParm(w_print_dialog,str_print)

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mensualdeinterrupciones
end type

type dw_mensual_de_interrupciones from datawindow within w_mensualdeinterrupciones
event ue_key_down pbm_dwnkey
integer x = 46
integer y = 260
integer width = 3360
integer height = 1496
integer taborder = 90
string dataobject = "d_mensual_interrupciones"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event ue_key_down;//long ll_row 
//
//IF keyflags = 0 THEN  // Controlo que no haya presionado
//                      // control ni shift
//	ll_row = This.Getselectedrow(0)
//	
//	IF key = KeyUpArrow! and ll_row > 1 THEN
//			 dw_mensual_de_interrupciones.ScrollToRow(ll_row - 1)
//			 this.selectrow(0,False)
//			 this.selectrow(ll_row - 1,true)
//	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
//			 dw_mensual_de_interrupciones.ScrollToRow(ll_row - 1)
//			 this.selectrow(0,False)
//			 this.selectrow(ll_row + 1,true)
//	END IF
//END IF

end event

event clicked;//call super::clicked;long ll_fila = 1
//
//dw_mensual_de_interrupciones.setredraw(false)
//
////Buscar elementos marcados y  los desmarca, marcando el nuevo
//ll_fila = dw_mensual_de_interrupciones.getselectedrow(0)
//do while ll_fila <> 0
//	dw_mensual_de_interrupciones.selectrow(ll_fila,false)
//	ll_fila ++
//	ll_fila = dw_mensual_de_interrupciones.getselectedrow(ll_fila)
//loop
//
//dw_mensual_de_interrupciones.selectrow(row,true)
//
//dw_mensual_de_interrupciones.setredraw(true)

end event

event constructor;call super::constructor;SetTransObject(SQLCA)

end event

type gb_1 from groupbox within w_mensualdeinterrupciones
integer x = 46
integer y = 12
integer width = 3360
integer height = 216
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Criterio de Selecci$$HEX1$$f300$$ENDHEX$$n:"
end type

type dw_filtro from datawindow within w_mensualdeinterrupciones
integer x = 238
integer y = 96
integer width = 2994
integer height = 88
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_criterio_selec_rep_causas"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;InsertRow(0)

This.Object.tip_instalacion_t.Visible = False
This.Object.tip_instalacion.Visible = False

This.Object.tip_incidencia_t.Visible = False
This.Object.tip_incidencia.Visible = False

//This.Object.fecha_t.X = 850
//This.Object.fecha.X = 1536
This.Object.fecha_t.X = 1527
This.Object.fecha_t.Y = 8
This.Object.fecha.X = 2213
This.Object.fecha.Y = 4
end event

event itemchanged;dw_mensual_de_interrupciones.Reset()
end event

event editchanged;dw_mensual_de_interrupciones.Reset()
end event


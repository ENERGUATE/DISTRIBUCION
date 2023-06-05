HA$PBExportHeader$w_mensualdecausas.srw
forward
global type w_mensualdecausas from w_sgigenerica
end type
type dw_mensual_de_causas from datawindow within w_mensualdecausas
end type
type gb_1 from groupbox within w_mensualdecausas
end type
type dw_filtro from datawindow within w_mensualdecausas
end type
type dw_totales from datawindow within w_mensualdecausas
end type
end forward

global type w_mensualdecausas from w_sgigenerica
integer width = 3657
integer height = 2400
string title = "OPEN SGI - Informe Mensual de Causas"
string menuname = "md_reportes_mensuales"
long backcolor = 79741120
string icon = "Open.ico"
event ue_ir_comienzo ( )
event ue_ir_final ( )
event ue_buscar ( )
event ue_exportar_excel ( )
event ue_mostrar_preliminar ( )
dw_mensual_de_causas dw_mensual_de_causas
gb_1 gb_1
dw_filtro dw_filtro
dw_totales dw_totales
end type
global w_mensualdecausas w_mensualdecausas

type variables
Date idt_fecha_ant
Int ii_tension_ant
end variables

forward prototypes
public function boolean wf_carga_imprevistas (integer pi_tension, string ps_fecha)
public function boolean wf_carga_programadas (integer pi_tension, string ps_fecha)
public subroutine wf_carga_totales (integer pi_tension, string ps_fecha)
end prototypes

event ue_ir_comienzo();SetPointer(HourGlass!)

dw_mensual_de_causas.selectrow(dw_mensual_de_causas.getRow(),false)

dw_mensual_de_causas.selectrow(1,true)
dw_mensual_de_causas.scrolltorow(1)

end event

event ue_ir_final();SetPointer(HourGlass!)

Integer li_count

dw_mensual_de_causas.selectrow(dw_mensual_de_causas.getRow(),false)
li_count = dw_mensual_de_causas.rowcount()
dw_mensual_de_causas.selectrow(li_count,true)
dw_mensual_de_causas.scrolltorow(li_count)

end event

event ue_buscar();Date ldt_fecha
String ls_fecha
Int li_tension, li_tip_incidencia//, li_tip_instalacion

Boolean lb_hay_datos = False

dw_mensual_de_causas.Reset()
dw_filtro.AcceptText()

ldt_fecha = dw_filtro.GetItemDate(1,'fecha')

If IsNull(ldt_fecha) Then
  gnv_msg.f_mensaje("EG22","","",OK!)
  //messagebox("Error","Las fechas no puede ser nulas")
  dw_filtro.SetFocus()
  Return
End If 

SetPointer(HourGlass!)
dw_mensual_de_causas.SetRedraw(False)

If month(ldt_fecha) > 9 Then
	ls_fecha = String(string(year(ldt_fecha)) + string(month(ldt_fecha)))
Else
	ls_fecha = String(string(year(ldt_fecha)) + '0' + string(month(ldt_fecha)))
End If

li_tension = dw_filtro.GetItemNumber(1, 'tension')
li_tip_incidencia = dw_filtro.GetItemNumber(1, 'tip_incidencia')
//li_tip_instalacion = dw_filtro.GetItemNumber(1, 'tip_instalacion')

If li_tip_incidencia = fgci_incidencia_imprevista Then // 1 --> Neprevazut
	lb_hay_datos = wf_carga_imprevistas(li_tension, ls_fecha)
Else // fgci_incidencia_programada // 2 --> Programat
	lb_hay_datos = wf_carga_programadas(li_tension, ls_fecha)
End IF

If li_tension <> ii_tension_ant Or ldt_fecha <> idt_fecha_ant Then
	wf_carga_totales(li_tension, ls_fecha)

	ii_tension_ant = li_tension
	idt_fecha_ant = ldt_fecha
End If

dw_mensual_de_causas.SetRedraw(True)

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
IF dw_mensual_de_causas.rowcount() = 0 THEN
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
				IF dw_mensual_de_causas.SaveAs (ls_nombre_archivo, Excel!, True)	= -1 THEN
					gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
				END IF
			END IF 
		ELSE
			IF dw_mensual_de_causas.SaveAs(ls_nombre_archivo, Excel!, True)	= -1 THEN
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

//This.dw_mensual_de_causas.Object.DataWindow.Print.preview(true)

data = This.dw_mensual_de_causas.Object.DataWindow.Syntax
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

public function boolean wf_carga_imprevistas (integer pi_tension, string ps_fecha);String ls_causa, ls_zona, ls_zona_ant
Int li_cantidad, li_cont_causas = 0
Int li_row, li_row_title
Int li_column = 0
Long ll_found = 0
String ls_cadena
Boolean lb_hay_datos = False
Int li_columna, li_fila, li_total

DECLARE cur_causas_x_zonas CURSOR FOR 
	SELECT GI_CAUSA.DESCRIPCION, SGD_ZONA.NOM_ZONA, COUNT(F_DETECCION)
	FROM SGD_INCIDENCIA, GI_CAUSA, SGD_ZONA, SGD_INSTALACION
	WHERE SGD_INCIDENCIA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+)
	  AND SGD_ZONA.COD_ZONA = SGD_INCIDENCIA.NRO_CENTRO
	  AND SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INSTALACION.NRO_INSTALACION
	  AND SGD_INCIDENCIA.TIP_TENSION = :pi_tension
	  AND SGD_INCIDENCIA.TIP_INCIDENCIA = :fgci_incidencia_imprevista //1
	  AND SGD_INSTALACION.TIPO_INSTALACION BETWEEN :fgci_tipo_subestacion AND :fgci_tipo_salida_mt //3 AND 4
	  AND TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ps_fecha
	  AND ALCANCE = :fgci_incidencia_con_interrupcion //2
	 GROUP BY SGD_ZONA.NOM_ZONA, GI_CAUSA.DESCRIPCION
	 ORDER BY SGD_ZONA.NOM_ZONA, GI_CAUSA.DESCRIPCION
USING SqlCa;
//	  AND SGD_INSTALACION.TIPO_INSTALACION = :li_tip_instalacion

Open cur_causas_x_zonas;

Fetch cur_causas_x_zonas Into :ls_causa, :ls_zona, :li_cantidad;

If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then
	lb_hay_datos = True

	li_row = dw_mensual_de_causas.InsertRow(0)
	li_row_title = li_row

	ls_zona_ant = ls_zona
	If IsNull(ls_causa) Or Trim(ls_causa) = "" Then ls_causa = "** ELIMINADA DE GI_CAUSAS **"

	li_column++
End If

Do While SqlCa.SqlCode <> 100 And SqlCa.SqlCode <> -1
	dw_mensual_de_causas.SetItem(li_row_title, 'ps_zona_' + String(li_column), ls_zona)
	dw_mensual_de_causas.SetItem(li_row, 'ps_causa', ls_causa)
	dw_mensual_de_causas.SetItem(li_row, 'pi_cantidad_' + String(li_column), li_cantidad)

	If ll_found = 0 Then li_cont_causas ++

	Fetch cur_causas_x_zonas Into :ls_causa, :ls_zona, :li_cantidad;

	If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then

		If IsNull(ls_causa) Or Trim(ls_causa) = "" Then ls_causa = "** ELIMINADA DE GI_CAUSAS **"
		If li_column > 1 Then
			ll_found = 0
			ls_cadena = "ps_causa = '" + ls_causa + "'"
			ll_found = dw_mensual_de_causas.Find(ls_cadena, 1, li_cont_causas)
			If ll_found > 0 Then
				li_row = ll_found
			Else
				li_row = dw_mensual_de_causas.InsertRow(0)
			End IF

			If ls_zona <> ls_zona_ant Then
				ls_zona_ant = ls_zona
				li_column++
			End If
		Else
			li_row = dw_mensual_de_causas.InsertRow(0)

			If ls_zona <> ls_zona_ant Then
				ls_zona_ant = ls_zona
				li_column++
			End If
		End If
	End If
Loop

Close cur_causas_x_zonas;

If lb_hay_datos = True Then
	For li_columna = 1 To li_column // Recorremos columnas.
		li_row = dw_mensual_de_causas.RowCount()
		li_total = dw_mensual_de_causas.GetItemNumber(1, 'compute_' + String(li_columna))
		For li_fila = 1 To li_row // Recorremos filas.
			//Calculamos porcentajes.
			dw_mensual_de_causas.SetItem(li_fila, 'ps_porcentaje_' + String(li_columna), String(round( ( dw_mensual_de_causas.GetItemNumber(li_fila, 'pi_cantidad_' + String(li_columna)) * 100) / li_total , 1)) +'%')
		Next
	Next
	//Totales
	//compute_1 = sum(  pi_cantidad_1  for all )
End If

Return lb_hay_datos;

end function

public function boolean wf_carga_programadas (integer pi_tension, string ps_fecha);String ls_causa, ls_zona, ls_zona_ant
Int li_cantidad, li_cont_causas = 0
Int li_row, li_row_title
Int li_column = 0
Long ll_found = 0
String ls_cadena
Boolean lb_hay_datos = False

DECLARE cur_causas_x_zonas CURSOR FOR 
	SELECT GI_CAUSA.DESCRIPCION, SGD_ZONA.NOM_ZONA, COUNT(F_DETECCION)
	FROM SGD_INCIDENCIA, GI_CAUSA, SGD_ZONA, SGD_INSTALACION, SGD_DESCARGOS
	WHERE SGD_INCIDENCIA.COD_CAUSA = GI_CAUSA.COD_CAUSA (+)
	  AND SGD_ZONA.COD_ZONA = SGD_INCIDENCIA.NRO_CENTRO
	  AND SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INSTALACION.NRO_INSTALACION
	  AND SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_DESCARGOS.NRO_INCIDENCIA
	  AND SGD_DESCARGOS.DESCRIPCION IN ('plan', 'neplan')
	  AND SGD_INCIDENCIA.TIP_TENSION = :pi_tension
	  AND SGD_INCIDENCIA.TIP_INCIDENCIA = :fgci_incidencia_programada //2
	  AND SGD_INSTALACION.TIPO_INSTALACION BETWEEN :fgci_tipo_subestacion AND :fgci_tipo_salida_mt //3 AND 4
	  AND TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ps_fecha
	  AND ALCANCE = :fgci_incidencia_con_interrupcion //2
	GROUP BY SGD_ZONA.NOM_ZONA, GI_CAUSA.DESCRIPCION
	ORDER BY SGD_ZONA.NOM_ZONA, GI_CAUSA.DESCRIPCION
USING SqlCa;
//	  AND SGD_INSTALACION.TIPO_INSTALACION = :li_tip_instalacion

Open cur_causas_x_zonas;

Fetch cur_causas_x_zonas Into :ls_causa, :ls_zona, :li_cantidad;

If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then
	lb_hay_datos = True

	li_row = dw_mensual_de_causas.InsertRow(0)
	li_row_title = li_row

	ls_zona_ant = ls_zona
	If IsNull(ls_causa) Or Trim(ls_causa) = "" Then ls_causa = "** ELIMINADA DE GI_CAUSAS **"

	li_column++
End If

Do While SqlCa.SqlCode <> 100 And SqlCa.SqlCode <> -1
	dw_mensual_de_causas.SetItem(li_row_title, 'ps_zona_' + String(li_column), ls_zona)
	dw_mensual_de_causas.SetItem(li_row, 'ps_causa', ls_causa)
	dw_mensual_de_causas.SetItem(li_row, 'pi_cantidad_' + String(li_column), li_cantidad)

	If ll_found = 0 Then li_cont_causas ++

	Fetch cur_causas_x_zonas Into :ls_causa, :ls_zona, :li_cantidad;

	If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then

		If IsNull(ls_causa) Or Trim(ls_causa) = "" Then ls_causa = "** ELIMINADA DE GI_CAUSAS **"
		If li_column > 1 Then
			ll_found = 0
			ls_cadena = "ps_causa = '" + ls_causa + "'"
			ll_found = dw_mensual_de_causas.Find(ls_cadena, 1, li_cont_causas)
			If ll_found > 0 Then
				li_row = ll_found
			Else
				li_row = dw_mensual_de_causas.InsertRow(0)
			End IF

			If ls_zona <> ls_zona_ant Then
				ls_zona_ant = ls_zona
				li_column++
			End If
		Else
			li_row = dw_mensual_de_causas.InsertRow(0)

			If ls_zona <> ls_zona_ant Then
				ls_zona_ant = ls_zona
				li_column++
			End If
		End If
	End If
Loop

Close cur_causas_x_zonas;

Return lb_hay_datos;

end function

public subroutine wf_carga_totales (integer pi_tension, string ps_fecha);String ls_tip_incidencia
Int li_cantidad, li_row
Decimal ld_duracion_media

dw_totales.Reset()

DECLARE cur_causas_totales CURSOR FOR 
SELECT MAX(TIPO), SUM(NUM_INCID), ROUND(SUM(MEDIA) / SUM(NUM_INCID), 2)
  FROM (SELECT MAX(SGD_VALOR.DESCRIPCION) TIPO, SUM(COUNT(DISTINCT(SGD_INCIDENCIA.NRO_INCIDENCIA))) NUM_INCID,
					NVL(SUM(fgnu_tiempo_interrupcion_3(max(SGD_INTERRUPCION.F_REPOSICION), min(SGD_INTERRUPCION.F_ALTA), null, null, null, null, null, null)), 0) MEDIA
			FROM SGD_VALOR, SGD_INCIDENCIA, SGD_INTERRUPCION, SGD_INSTALACION, SGD_DESCARGOS
			WHERE SGD_VALOR.CODIF = 'INC'
				AND SGD_VALOR.CODIGO = SGD_INCIDENCIA.TIP_INCIDENCIA
				AND SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_INTERRUPCION.NRO_INCIDENCIA
				AND SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INSTALACION.NRO_INSTALACION
				AND SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_DESCARGOS.NRO_INCIDENCIA
				AND SGD_DESCARGOS.DESCRIPCION IN ('plan', 'neplan')
				AND SGD_INCIDENCIA.TIP_TENSION = :pi_tension
				AND SGD_INCIDENCIA.TIP_INCIDENCIA = :fgci_incidencia_programada //2
				AND SGD_INSTALACION.TIPO_INSTALACION BETWEEN :fgci_tipo_subestacion AND :fgci_tipo_salida_mt //3 AND 4
				AND TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ps_fecha
				AND ALCANCE = :fgci_incidencia_con_interrupcion //2
			GROUP BY SGD_INCIDENCIA.NRO_INCIDENCIA, SGD_VALOR.DESCRIPCION
			UNION
			SELECT MAX(SGD_VALOR.DESCRIPCION) TIPO, SUM(COUNT(DISTINCT(SGD_INCIDENCIA.NRO_INCIDENCIA))) NUM_INCID,
					NVL(SUM(fgnu_tiempo_interrupcion_3(max(SGD_INTERRUPCION_RS.F_REPOSICION), min(SGD_INTERRUPCION_RS.F_ALTA), null, null, null, null, null, null)), 0) MEDIA
			 FROM SGD_VALOR, SGD_INCIDENCIA, SGD_INTERRUPCION_RS, SGD_INSTALACION, SGD_DESCARGOS
			 WHERE SGD_VALOR.CODIF = 'INC'
				AND SGD_VALOR.CODIGO = SGD_INCIDENCIA.TIP_INCIDENCIA
				AND SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_INTERRUPCION_RS.NRO_INCIDENCIA (+)
				AND SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INSTALACION.NRO_INSTALACION
				AND SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_DESCARGOS.NRO_INCIDENCIA
				AND SGD_DESCARGOS.DESCRIPCION IN ('plan', 'neplan')
				AND SGD_INCIDENCIA.TIP_TENSION = :pi_tension
				AND SGD_INCIDENCIA.TIP_INCIDENCIA = :fgci_incidencia_programada //2
				AND SGD_INSTALACION.TIPO_INSTALACION BETWEEN :fgci_tipo_subestacion AND :fgci_tipo_salida_mt //3 AND 4
				AND TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ps_fecha
				AND ALCANCE = :fgci_incidencia_con_interrupcion //2
			GROUP BY SGD_INCIDENCIA.NRO_INCIDENCIA, SGD_VALOR.DESCRIPCION)
UNION
SELECT MAX(TIPO), SUM(NUM_INCID), ROUND(SUM(MEDIA) / SUM(NUM_INCID), 2)
  FROM (SELECT MAX(SGD_VALOR.DESCRIPCION) TIPO, SUM(COUNT(DISTINCT(SGD_INCIDENCIA.NRO_INCIDENCIA))) NUM_INCID,
					NVL(SUM(fgnu_tiempo_interrupcion_3(max(SGD_INTERRUPCION.F_REPOSICION), min(SGD_INTERRUPCION.F_ALTA), null, null, null, null, null, null)), 0) MEDIA
			FROM SGD_VALOR, SGD_INCIDENCIA, SGD_INTERRUPCION, SGD_INSTALACION
			WHERE SGD_VALOR.CODIF = 'INC'
				AND SGD_VALOR.CODIGO = SGD_INCIDENCIA.TIP_INCIDENCIA 
				AND SGD_INCIDENCIA.TIP_INCIDENCIA = SGD_VALOR.CODIGO 
				AND SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_INTERRUPCION.NRO_INCIDENCIA
				AND SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INSTALACION.NRO_INSTALACION 
				AND SGD_INCIDENCIA.TIP_TENSION = :pi_tension
				AND SGD_INCIDENCIA.TIP_INCIDENCIA = :fgci_incidencia_imprevista //1
				AND SGD_INSTALACION.TIPO_INSTALACION BETWEEN :fgci_tipo_subestacion AND :fgci_tipo_salida_mt //3 AND 4
				AND TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ps_fecha
				AND ALCANCE = :fgci_incidencia_con_interrupcion //2
			GROUP BY SGD_INCIDENCIA.NRO_INCIDENCIA, SGD_VALOR.DESCRIPCION
			UNION
			SELECT MAX(SGD_VALOR.DESCRIPCION) TIPO, SUM(COUNT(DISTINCT(SGD_INCIDENCIA.NRO_INCIDENCIA))) NUM_INCID,
					NVL(SUM(fgnu_tiempo_interrupcion_3(max(SGD_INTERRUPCION_RS.F_REPOSICION), min(SGD_INTERRUPCION_RS.F_ALTA), null, null, null, null, null, null)), 0) MEDIA
			 FROM SGD_VALOR, SGD_INCIDENCIA, SGD_INTERRUPCION_RS, SGD_INSTALACION
			WHERE SGD_VALOR.CODIF = 'INC'
				AND SGD_VALOR.CODIGO = SGD_INCIDENCIA.TIP_INCIDENCIA 
				AND SGD_INCIDENCIA.TIP_INCIDENCIA = SGD_VALOR.CODIGO 
				AND SGD_INCIDENCIA.NRO_INCIDENCIA = SGD_INTERRUPCION_RS.NRO_INCIDENCIA (+)
				AND SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INSTALACION.NRO_INSTALACION 
				AND SGD_INCIDENCIA.TIP_TENSION = :pi_tension
				AND SGD_INCIDENCIA.TIP_INCIDENCIA = :fgci_incidencia_imprevista //1
				AND SGD_INSTALACION.TIPO_INSTALACION BETWEEN :fgci_tipo_subestacion AND :fgci_tipo_salida_mt //3 AND 4
				AND TO_CHAR(SGD_INCIDENCIA.F_DETECCION, 'YYYYMM') = :ps_fecha
				AND ALCANCE = :fgci_incidencia_con_interrupcion //2
			GROUP BY SGD_INCIDENCIA.NRO_INCIDENCIA, SGD_VALOR.DESCRIPCION)
USING SqlCa;
//	  AND SGD_INSTALACION.TIPO_INSTALACION = :li_tip_instalacion

Open cur_causas_totales;

Fetch cur_causas_totales Into :ls_tip_incidencia, :li_cantidad, :ld_duracion_media;

If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then li_row = dw_totales.InsertRow(0)

Do While SqlCa.SqlCode <> 100 And SqlCa.SqlCode <> -1
	dw_totales.SetItem(li_row, 'tipo_incidencia', ls_tip_incidencia)
	dw_totales.SetItem(li_row, 'cantidad_total_incidencias', li_cantidad)
	dw_totales.SetItem(li_row, 'duracion_media_interrupcion', Round(ld_duracion_media,2))

	Fetch cur_causas_totales Into :ls_tip_incidencia, :li_cantidad, :ld_duracion_media;

	If SqlCa.SqlCode <>100 And SqlCa.SqlCode <> -1 Then
		li_row = dw_totales.InsertRow(0)
	End If
Loop

Close cur_causas_totales;

end subroutine

on w_mensualdecausas.create
int iCurrent
call super::create
if this.MenuName = "md_reportes_mensuales" then this.MenuID = create md_reportes_mensuales
this.dw_mensual_de_causas=create dw_mensual_de_causas
this.gb_1=create gb_1
this.dw_filtro=create dw_filtro
this.dw_totales=create dw_totales
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mensual_de_causas
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.dw_filtro
this.Control[iCurrent+4]=this.dw_totales
end on

on w_mensualdecausas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_mensual_de_causas)
destroy(this.gb_1)
destroy(this.dw_filtro)
destroy(this.dw_totales)
end on

event open;DateTime ldt_hoy

ldt_hoy = fgnu_fecha_actual()


DataWindowChild ldwch_tension
	
dw_filtro.GetChild ("tension", ldwch_tension)
ldwch_tension.SetTransObject(SQLCA)
ldwch_tension.Retrieve()
dw_filtro.SetItem(1,"tension", fgci_media_tension) //2


DataWindowChild ldwch_tip_incidencia

dw_filtro.GetChild ("tip_incidencia", ldwch_tip_incidencia)
ldwch_tip_incidencia.SetTransObject(SQLCA)
ldwch_tip_incidencia.Retrieve(3)
dw_filtro.SetItem(1,"tip_incidencia", fgci_incidencia_imprevista) //1


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

str_print.dwprint=dw_mensual_de_causas
str_print.titulo="Generaci$$HEX1$$f300$$ENDHEX$$n Sentencia SQL"
str_print.PARM1=true
OpenWithParm(w_print_dialog,str_print)

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mensualdecausas
end type

type dw_mensual_de_causas from datawindow within w_mensualdecausas
event ue_key_down pbm_dwnkey
integer x = 46
integer y = 372
integer width = 3365
integer height = 1132
integer taborder = 90
string dataobject = "d_mensual_causas"
boolean vscrollbar = true
end type

event ue_key_down;long ll_row 

IF keyflags = 0 THEN  // Controlo que no haya presionado
                      // control ni shift
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyUpArrow! and ll_row > 1 THEN
			 dw_mensual_de_causas.ScrollToRow(ll_row - 1)
			 this.selectrow(0,False)
			 this.selectrow(ll_row - 1,true)
	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
			 dw_mensual_de_causas.ScrollToRow(ll_row - 1)
			 this.selectrow(0,False)
			 this.selectrow(ll_row + 1,true)
	END IF
END IF

end event

event clicked;call super::clicked;long ll_fila = 1

dw_mensual_de_causas.setredraw(false)

//Buscar elementos marcados y  los desmarca, marcando el nuevo
ll_fila = dw_mensual_de_causas.getselectedrow(0)
do while ll_fila <> 0
	dw_mensual_de_causas.selectrow(ll_fila,false)
	ll_fila ++
	ll_fila = dw_mensual_de_causas.getselectedrow(ll_fila)
loop

dw_mensual_de_causas.selectrow(row,true)

dw_mensual_de_causas.setredraw(true)

end event

event constructor;call super::constructor;SetTransObject(SQLCA)

end event

type gb_1 from groupbox within w_mensualdecausas
integer x = 46
integer y = 12
integer width = 3365
integer height = 328
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

type dw_filtro from datawindow within w_mensualdecausas
integer x = 238
integer y = 96
integer width = 2994
integer height = 212
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

This.Object.fecha_t.X = 850
This.Object.fecha.X = 1536
end event

event itemchanged;dw_mensual_de_causas.Reset()

If dwo.Name = 'tension' Or dwo.Name = 'fecha' Then dw_totales.Reset()

end event

event editchanged;dw_mensual_de_causas.Reset()

If dwo.Name = 'tension' Or dwo.Name = 'fecha' Then dw_totales.Reset()

end event

type dw_totales from datawindow within w_mensualdecausas
integer x = 530
integer y = 1516
integer width = 2395
integer height = 264
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_mensual_causas_total"
boolean vscrollbar = true
end type

event clicked;call super::clicked;long ll_fila = 1

dw_totales.setredraw(false)

//Buscar elementos marcados y  los desmarca, marcando el nuevo
ll_fila = dw_totales.getselectedrow(0)
do while ll_fila <> 0
	dw_totales.selectrow(ll_fila,false)
	ll_fila ++
	ll_fila = dw_totales.getselectedrow(ll_fila)
loop

dw_totales.selectrow(row,true)

dw_totales.setredraw(true)

end event

event constructor;call super::constructor;SetTransObject(SQLCA)

end event


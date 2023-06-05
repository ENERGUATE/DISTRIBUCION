HA$PBExportHeader$w_mant_alarmas.srw
forward
global type w_mant_alarmas from window
end type
type st_tipo4 from statictext within w_mant_alarmas
end type
type sle_tipo4 from singlelineedit within w_mant_alarmas
end type
type sle_tipo3 from singlelineedit within w_mant_alarmas
end type
type sle_tipo2 from singlelineedit within w_mant_alarmas
end type
type sle_tipo1 from singlelineedit within w_mant_alarmas
end type
type dw_alarmas from u_bdg_lista_alarmas within w_mant_alarmas
end type
type st_tipo3 from statictext within w_mant_alarmas
end type
type st_tipo1 from statictext within w_mant_alarmas
end type
type st_tipo2 from statictext within w_mant_alarmas
end type
type st_2 from multilineedit within w_mant_alarmas
end type
type st_1 from statictext within w_mant_alarmas
end type
type cb_cancelar from u_cb within w_mant_alarmas
end type
type cb_aceptar from u_cb within w_mant_alarmas
end type
type dw_1 from datawindow within w_mant_alarmas
end type
type uo_def_alarmas from u_indic_alarma within w_mant_alarmas
end type
type gb_1 from groupbox within w_mant_alarmas
end type
type st_3 from statictext within w_mant_alarmas
end type
end forward

global type w_mant_alarmas from window
integer x = 197
integer y = 436
integer width = 3282
integer height = 1712
boolean titlebar = true
string title = "OPEN SGI - Mantenimiento de Alarmas."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "mantal.ico"
st_tipo4 st_tipo4
sle_tipo4 sle_tipo4
sle_tipo3 sle_tipo3
sle_tipo2 sle_tipo2
sle_tipo1 sle_tipo1
dw_alarmas dw_alarmas
st_tipo3 st_tipo3
st_tipo1 st_tipo1
st_tipo2 st_tipo2
st_2 st_2
st_1 st_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_1 dw_1
uo_def_alarmas uo_def_alarmas
gb_1 gb_1
st_3 st_3
end type
global w_mant_alarmas w_mant_alarmas

type variables
boolean Click, Cambio3, Anterior
long filaselecc, filaant
Boolean ib_alarma_dos_empr, ib_parametro_campo_ext  //**  OSGI 2001.1  03/07/2001
Integer ii_parametro_campo_ext, ii_empresa = 1  //**  OSGI 2001.1  03/07/2001

end variables

forward prototypes
public subroutine fw_actualizar_info_por_tipo ()
public function string fw_incidencias_por_estado (integer pi_tipo_incidencia, integer pi_estado)
public function string fw_avisos_por_tipo (long pdec_tipo_aviso)
public function string fw_descargos_por_tipo (integer pi_estado, integer pi_ind_interrupcion)
public subroutine fw_campos_invisibles ()
public function string fw_sql (readonly string as_arg1, readonly string as_arg2)
end prototypes

public subroutine fw_actualizar_info_por_tipo ();////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_actualizar_info_por_tipo
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene los datos de la alarma seleccionada.
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	--
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_tipo_alarma
int li_num_por_tipo, li_estado


ls_tipo_alarma = dw_alarmas.GetItemString(filaselecc, 'tipo_valor')
li_estado = dw_alarmas.GetItemNumber(filaselecc, 'estado')
st_2.Text = dw_alarmas.GetItemString(filaselecc, 'descripcion')

// Se comprueba el tipo de alarma que se ha selccionado
CHOOSE CASE ls_tipo_alarma
	CASE 'avisos'  // alarma de avisos
		st_tipo1.Visible = True
		st_tipo2.Visible = True
		st_tipo3.Visible = True
		sle_tipo1.Visible = True
		sle_tipo2.Visible = True
		sle_tipo3.Visible = True

		
		st_tipo1.Text = 'Normal con Alim.:'
		st_tipo2.Text = 'Calidad:'
		st_tipo3.Text = 'Otros:'
		// Se trae el n$$HEX1$$fa00$$ENDHEX$$mero de avisos normales con alimentaci$$HEX1$$f300$$ENDHEX$$n pendientes
		sle_tipo1.Text = fw_avisos_por_tipo(fgcdec_aviso_con_alimentacion)
		sle_tipo2.Text = fw_avisos_por_tipo(fgcdec_aviso_de_calidad)
		sle_tipo3.Text = fw_avisos_por_tipo(0)
				
	CASE 'incidencias'  // alarma de incidencias
		st_tipo1.Visible = True
		st_tipo2.Visible = True
		st_tipo3.Visible = True
		sle_tipo1.Visible = True
		sle_tipo2.Visible = True
		sle_tipo3.Visible = True



		st_tipo1.Text = 'Imprevistas:'
		st_tipo2.Text = 'Calidad:'
		st_tipo3.Text = 'Programadas:'
		sle_tipo1.Text = fw_incidencias_por_estado(fgci_incidencia_imprevista, li_estado)
		sle_tipo2.Text = fw_incidencias_por_estado(fgci_incidencia_calidad, li_estado)
		sle_tipo3.Text = fw_incidencias_por_estado(fgci_incidencia_programada, li_estado)
		sle_tipo4.Text = fw_incidencias_por_estado(fgci_incidencia_scada,li_estado)
	CASE 'descargos'  // alarma de descargos
		st_tipo1.Visible = True
		st_tipo2.Visible = True
		sle_tipo1.Visible = True
		sle_tipo2.Visible = True

		
		
		st_tipo3.Visible = False
		sle_tipo3.Visible = False
		st_tipo1.Text = 'Con interrupci$$HEX1$$f300$$ENDHEX$$n:'
		st_tipo2.Text = 'Sin interrupci$$HEX1$$f300$$ENDHEX$$n:'
		sle_tipo1.Text = fw_descargos_por_tipo(li_estado, 0)
		sle_tipo2.Text = fw_descargos_por_tipo(li_estado, 1)
		
	//***************************************
	//**  OSGI 2001.1  	03/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	CASE ELSE
		st_tipo1.Visible = False
		st_tipo2.Visible = False
		st_tipo3.Visible = False
		st_tipo4.Visible = False
		
		sle_tipo1.Visible = False
		sle_tipo2.Visible = False
		sle_tipo3.Visible = False
		sle_tipo4.Visible = False
	//***************************************
	//**  OSGI 2001.1  	03/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

END CHOOSE

end subroutine

public function string fw_incidencias_por_estado (integer pi_tipo_incidencia, integer pi_estado);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_incidencias_por_estado
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de incidencias de un tipo concreto
//				 en un estado determinado.
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  pi_estado: estado de las incidencias
//					 pi_tipo_incidencia: tipo de incidencia 	
//		Salida:   el n$$HEX1$$fa00$$ENDHEX$$mero de incidencias por estado
//						
// Devuelve:	--
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
/////////////////////////////////////////////////////////////////////////////////////////////

int li_num_incidencias



//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	02/07/2001  SELECT COUNT(*)
//**  OSGI 2001.1  	02/07/2001  INTO :li_num_incidencias
//**  OSGI 2001.1  	02/07/2001  FROM SGD_INCIDENCIA
//**  OSGI 2001.1  	02/07/2001  WHERE TIP_INCIDENCIA = :pi_tipo_incidencia AND
//**  OSGI 2001.1  	02/07/2001  		EST_ACTUAL = :pi_estado AND
//**  OSGI 2001.1  	02/07/2001  		DECODE(ALCANCE, :fgci_incidencia_sin_interrupcion, NVL(NRO_AGRUPACION,0),
//**  OSGI 2001.1  	02/07/2001  																			ALCANCE) = 
//**  OSGI 2001.1  	02/07/2001  		DECODE(ALCANCE, :fgci_incidencia_sin_interrupcion, 0,
//**  OSGI 2001.1  	02/07/2001  																			ALCANCE);
//**  OSGI 2001.1  	02/07/2001  	IF SQLCA.SQLCode = 0 THEN
//**  OSGI 2001.1  	02/07/2001  		Return string(li_num_incidencias)
//**  OSGI 2001.1  	02/07/2001  	ELSE
//**  OSGI 2001.1  	02/07/2001  		Return ''
//**  OSGI 2001.1  	02/07/2001  	END IF

String ls_sql, ls_arg1, ls_arg2


If Not ib_alarma_dos_empr Then
	SELECT COUNT(*)
	INTO :li_num_incidencias
	FROM SGD_INCIDENCIA
	WHERE TIP_INCIDENCIA = :pi_tipo_incidencia AND
			EST_ACTUAL = :pi_estado AND
			DECODE(ALCANCE, :fgci_incidencia_sin_interrupcion, NVL(NRO_AGRUPACION,0),ALCANCE) = DECODE(ALCANCE, :fgci_incidencia_sin_interrupcion, 0,
																				ALCANCE);

	IF SQLCA.SQLCode = 0 THEN
		Return string(li_num_incidencias)
	ELSE
		Return ''
	END IF
Else
	ls_arg1 = " ( TIP_INCIDENCIA = " + String(pi_tipo_incidencia) + " AND " + & 
				 " EST_ACTUAL = " + String(pi_estado) + " AND " + &
				 " DECODE(ALCANCE, " + String(fgci_incidencia_sin_interrupcion) + &
				 " , NVL(NRO_AGRUPACION,0),ALCANCE) = DECODE(ALCANCE, " + &
				 String(fgci_incidencia_sin_interrupcion) + ", 0, ALCANCE) ) "

	ls_arg2 = ls_arg1

	ls_sql = fw_sql(ls_arg1, ls_arg2)

	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_sql ;
	OPEN DYNAMIC my_cursor ;
	FETCH my_cursor INTO :li_num_incidencias ;

	IF SQLCA.SQLCode = 0 THEN
		CLOSE my_cursor ;

		Return string(li_num_incidencias)
	ELSE 
		CLOSE my_cursor ;
		Return ''
	END IF
End If
//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

public function string fw_avisos_por_tipo (long pdec_tipo_aviso);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_avisos_por_tipo
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de avisos resueltos a partir del tipo de aviso.
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  pdec_tipo_aviso: tipo de aviso.
//		Salida:   el n$$HEX1$$fa00$$ENDHEX$$mero de avisos por tipo
//						
// Devuelve:	--
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int li_num_por_tipo
String ls_sql, ls_arg1  //**  OSGI 2001.1  	03/07/2001




If Not ib_alarma_dos_empr Then  //**  OSGI 2001.1  	03/07/2001
	CHOOSE CASE pdec_tipo_aviso
		CASE fgcdec_aviso_con_alimentacion
			SELECT COUNT(*) 
			INTO :li_num_por_tipo
			FROM GI_AVISOS
			WHERE NRO_INSTALACION NOT IN (:fgcdec_aviso_alumbrado_publico, 
													:fgcdec_aviso_de_ayuda,
													:fgcdec_aviso_sin_alimentacion) AND
					EST_AVISO = :fgci_aviso_pendiente AND
					IND_CALIDAD = 0;
	
		CASE fgcdec_aviso_de_calidad
			
			// Se trae el n$$HEX1$$fa00$$ENDHEX$$mero de avisos de calidad con alimentaci$$HEX1$$f300$$ENDHEX$$n pendientes
			SELECT COUNT(*) 
			INTO :li_num_por_tipo
			FROM GI_AVISOS
			WHERE NRO_INSTALACION NOT IN (:fgcdec_aviso_alumbrado_publico, 
													:fgcdec_aviso_de_ayuda,
													:fgcdec_aviso_sin_alimentacion) AND
					EST_AVISO = :fgci_aviso_pendiente AND
					IND_CALIDAD = 1;

		CASE ELSE
				// Se trae el n$$HEX1$$fa00$$ENDHEX$$mero restante de avisos pendientes
			SELECT COUNT(*) 
			INTO :li_num_por_tipo
			FROM GI_AVISOS
			WHERE NRO_INSTALACION IN (:fgcdec_aviso_alumbrado_publico, 
											  :fgcdec_aviso_de_ayuda,
											  :fgcdec_aviso_sin_alimentacion) AND
					EST_AVISO = :fgci_aviso_pendiente;

	END CHOOSE
//***************************************
//**  OSGI 2001.1  	03/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Else
	CHOOSE CASE pdec_tipo_aviso
		CASE fgcdec_aviso_con_alimentacion
				ls_arg1 = "( NRO_INSTALACION NOT IN (" + &
							 String(fgcdec_aviso_alumbrado_publico) + ", " + &
							 String(fgcdec_aviso_de_ayuda) + ", " + &
							 String(fgcdec_aviso_sin_alimentacion) + ") AND " + &
							 "EST_AVISO = " + String(fgci_aviso_pendiente) + " AND IND_CALIDAD = 0 )"
		CASE fgcdec_aviso_de_calidad
				ls_arg1 = "( NRO_INSTALACION NOT IN (" + &
							 String(fgcdec_aviso_alumbrado_publico) + ", " + &
							 String(fgcdec_aviso_de_ayuda) + ", " + &
							 String(fgcdec_aviso_sin_alimentacion) + ") AND " + &
							 "EST_AVISO = " + String(fgci_aviso_pendiente) + " AND IND_CALIDAD = 1 )"
		CASE ELSE
				ls_arg1 = "( NRO_INSTALACION IN (" + &
							 String(fgcdec_aviso_alumbrado_publico) + ", " + &
							 String(fgcdec_aviso_de_ayuda) + ", " + &
							 String(fgcdec_aviso_sin_alimentacion) + ") AND " + &
							 "EST_AVISO = " + String(fgci_aviso_pendiente) + " )"
	END CHOOSE

	ls_sql = fw_sql(ls_arg1, "")

	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_sql ;
	OPEN DYNAMIC my_cursor ;
	FETCH my_cursor INTO :li_num_por_tipo ;
End If
//***************************************
//**  OSGI 2001.1  	03/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

IF SQLCA.SQLCode = 0 THEN
	If ib_alarma_dos_empr Then  //**  OSGI 2001.1  	03/07/2001
		CLOSE my_cursor ;			 //**  OSGI 2001.1  	03/07/2001
	End If							 //**  OSGI 2001.1  	03/07/2001

	Return string(li_num_por_tipo)
ELSE
	If ib_alarma_dos_empr Then	 //**  OSGI 2001.1  	03/07/2001
		CLOSE my_cursor ;			 //**  OSGI 2001.1  	03/07/2001
	End If							 //**  OSGI 2001.1  	03/07/2001

	Return ''
END IF
	
end function

public function string fw_descargos_por_tipo (integer pi_estado, integer pi_ind_interrupcion);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_descargos_por_tipo
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de descargos en un estado determinado.
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  pi_estado: estado de los descargos
//					 pi_ind_interrupcion: indica si los descargos han de ser con interrupci$$HEX1$$f300$$ENDHEX$$n o sin ella	
//		Salida:   el n$$HEX1$$fa00$$ENDHEX$$mero de descargos por estado
//						
// Devuelve:	--
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------		-------			----------------------------------------
//	16/10/2000		  LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_num_descargos
String ls_sql, ls_arg1, ls_arg2  //**  OSGI 2001.1  	03/07/2001





If Not ib_alarma_dos_empr Then  //**  OSGI 2001.1  	03/07/2001
	SELECT COUNT(*)
	INTO :li_num_descargos
	FROM SGD_DESCARGOS
	WHERE ESTADO = :pi_estado AND
			IND_INTERRUPCION = :pi_ind_interrupcion;
//***************************************
//**  OSGI 2001.1  	03/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Else
	ls_arg1 = " ( SGD_DESCARGOS.ESTADO = " + String(pi_estado) + " AND " + & 
				 " IND_INTERRUPCION = " + String(pi_ind_interrupcion) + " ) "

	ls_arg2 = ls_arg1
	
	fg_replace_text(ls_arg2, "SGD_DESCARGOS", "GI_HIST_DESCARGOS")

	ls_sql = fw_sql(ls_arg1, ls_arg2)

	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_sql ;
	OPEN DYNAMIC my_cursor ;
	FETCH my_cursor INTO :li_num_descargos ;
End If
//***************************************
//**  OSGI 2001.1  	03/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF SQLCA.SQLCode = 0 THEN
	If ib_alarma_dos_empr Then  //**  OSGI 2001.1  	03/07/2001
		CLOSE my_cursor ;			 //**  OSGI 2001.1  	03/07/2001
	End If							 //**  OSGI 2001.1  	03/07/2001

	Return string(li_num_descargos)
ELSE
	If ib_alarma_dos_empr Then  //**  OSGI 2001.1  	03/07/2001
		CLOSE my_cursor ;			 //**  OSGI 2001.1  	03/07/2001
	End If							 //**  OSGI 2001.1  	03/07/2001

	Return ''
END IF
end function

public subroutine fw_campos_invisibles ();string ls_tipo_alarma

ls_tipo_alarma = dw_alarmas.GetItemString(filaselecc, 'tipo_valor')
IF ls_tipo_alarma = 'incidencias' and st_tipo4.visible=false then
	
	st_tipo4.visible=true
	sle_tipo4.Visible=true
	st_tipo1.y = st_tipo1.y - 30
	st_tipo2.y = st_tipo2.y - 40
	st_tipo3.y = st_tipo3.y - 60
	sle_tipo1.height = 80
	sle_tipo1.y = sle_tipo1.y - 25
	sle_tipo2.height = 80
	sle_tipo2.y = sle_tipo2.y - 37
	sle_tipo3.height = 80
	sle_tipo3.y = sle_tipo3.y - 47

elseif ls_tipo_alarma <> 'incidencias' then
	st_tipo4.visible=false
	sle_tipo4.Visible=false
	st_tipo1.height = 76
	st_tipo1.y = 1040
	st_tipo2.height = 76
	st_tipo2.y = 1140
	st_tipo3.height = 76
	st_tipo3.y = 1244
	sle_tipo1.height = 92
	sle_tipo1.y = 1036
	sle_tipo2.height = 92
	sle_tipo2.y = 1132
	sle_tipo3.height = 92
	sle_tipo3.y = 1228
end if

end subroutine

public function string fw_sql (readonly string as_arg1, readonly string as_arg2);String ls_sql, ls_tipo
DataStore lds_sql


//ls_sql = dw_alarmas.GetItemString(dw_alarmas.GetRow(), 'c_sql_row')
//ls_sql = Trim(ls_sql)


If ib_parametro_campo_ext And ( IsNull(ls_sql) Or Len(ls_sql) <= 0 ) Then
	ls_tipo = dw_alarmas.GetItemString(filaselecc, 'c_valor')
	
	lds_sql = Create DataStore
	lds_sql.DataObject = "dw_arma_sql_oculto"
	lds_sql.SetTransObject(SQLCA)

	If lds_sql.Retrieve(ii_parametro_campo_ext, ii_empresa, ls_tipo) > 0 Then
		ls_sql = lds_sql.GetItemString(lds_sql.RowCount(), 'c_sql_final')
		
//		dw_alarmas.SetItem(filaselecc, 'c_sql_row', ls_sql)
//		MessageBox("ls_sql", ls_sql)
//		MessageBox("as_arg1", as_arg1)
		
	Else
		ls_sql = ""
	End If

	Destroy lds_sql
Else
	ls_sql = ""
End If


fg_replace_text(ls_sql, ":arg1", as_arg1)
fg_replace_text(ls_sql, ":arg2", as_arg2)

ClipBoard(ls_sql)


Return ls_sql
end function

event open;String codigo, tipo
real Valor
int habil,i,cant_alarmas, li_maximo, li_valor_medio, li_estado_lock
Double ld_maximo, ld_valor_medio, ld_valor  //**  OSGI 2001.1  	29/06/2001




dw_1.SetTransObject(SQLCA)
dw_alarmas.SetTransObject(SQLCA)


//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_alarma_dos_empr = fg_verifica_parametro(This.ClassName())

If Lower(This.ClassName()) <> "w_mant_alarmas_x_empresa" Then
	If fg_verifica_parametro(This.ClassName()) Then
		Close(This)
		Open(w_mant_alarmas_x_empresa)
		Return
	End If
End If
//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


dw_alarmas.of_obtener_datos()

dw_1.Retrieve()

codigo = message.stringparm

IF Codigo <> '' THEN
	FilaSelecc = dw_alarmas.Find("codigo = " + codigo, 1,dw_alarmas.RowCount())
	dw_alarmas.SelectRow(FilaSelecc, TRUE)		// Se selecciona la fila nueva
	dw_alarmas.ScrollToRow(filaselecc)
	valor  = dw_alarmas.GetItemNumber(filaselecc,"valor")
	li_maximo  = dw_alarmas.GetItemNumber(filaselecc,"maximo")
	li_valor_medio  = dw_alarmas.GetItemNumber(filaselecc,"intermedio")
	
	
	//***************************************
	//**  OSGI 2001.1  	29/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	29/06/2001  	uo_def_alarmas.uf_actualiza(li_maximo,li_valor_medio, round(valor,2), li_maximo*3/2, '')
	
	ld_maximo  = dw_alarmas.GetItemNumber(filaselecc,"maximo")
	ld_valor_medio  = dw_alarmas.GetItemNumber(filaselecc,"intermedio")
	ld_valor = dw_alarmas.GetItemNumber(filaselecc,"valor")

	If Not ib_alarma_dos_empr Then
		uo_def_alarmas.uf_actualiza(li_maximo,li_valor_medio, round(valor,2), li_maximo*3/2, '')
	Else
		uo_def_alarmas.uf_actualiza(ld_maximo,ld_valor_medio, round(ld_valor,2), ld_maximo*3/2, '')
	End If
	//***************************************
	//**  OSGI 2001.1  	29/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
ELSE
	filaselecc = 1
	dw_alarmas.SelectRow(FilaSelecc, TRUE)		// Se selecciona la fila nueva
	dw_alarmas.ScrollToRow(filaselecc)
	valor  = dw_alarmas.GetItemNumber(filaselecc,"valor")
	li_maximo  = dw_alarmas.GetItemNumber(filaselecc,"maximo")
	li_valor_medio  = dw_alarmas.GetItemNumber(filaselecc,"intermedio")
	
	//***************************************
	//**  OSGI 2001.1  	29/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	29/06/2001  	uo_def_alarmas.uf_actualiza(li_maximo,li_valor_medio, round(valor,2), li_maximo*3/2, '')
	
	ld_maximo  = dw_alarmas.GetItemNumber(filaselecc,"maximo")
	ld_valor_medio  = dw_alarmas.GetItemNumber(filaselecc,"intermedio")
	ld_valor = dw_alarmas.GetItemNumber(filaselecc,"valor")
	
	If Not ib_alarma_dos_empr Then
		uo_def_alarmas.uf_actualiza(li_maximo,li_valor_medio, round(valor,2), li_maximo*3/2, '')
	Else
		uo_def_alarmas.uf_actualiza(ld_maximo, ld_valor_medio, round(ld_valor,2), ld_maximo*3/2, '')
	End If
	//***************************************
	//**  OSGI 2001.1  	29/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF

// Se bloquean todas las alarmas. En el caso de que est$$HEX1$$e900$$ENDHEX$$n bloqueadas 
// por otro usuario la ventana s$$HEX1$$f300$$ENDHEX$$lo ser$$HEX2$$e1002000$$ENDHEX$$de consulta

li_estado_lock = gnu_u_transaction.uf_lock(This, 'GI_BDG_MALARMAS', 'CODIGO > 0' )
IF li_estado_lock = -54 THEN
	uo_def_alarmas.enabled = False
	cb_aceptar.enabled = False
END IF
fw_campos_invisibles()
fw_actualizar_info_por_tipo()


//***************************************
//**  OSGI 2001.1  	03/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If ib_alarma_dos_empr Then
	ib_parametro_campo_ext = fg_verifica_parametro(This.ClassName() + "_campos")
End If

If ib_alarma_dos_empr And ib_parametro_campo_ext Then
	ii_parametro_campo_ext = fg_valor_parametro(This.ClassName() + "_campos")
End If
//***************************************
//**  OSGI 2001.1  	03/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event close;int CantAl, i 
real Valor, Habil
string Codigo

////Actualizo las alarmas

gnu_u_transaction.uf_rollback(This)
//
IF IsValid(w_lista_alarma) THEN
	w_lista_alarma.postevent(Open!)
//	w_lista_alarma.TriggerEvent(Open!)
END IF



end event

on w_mant_alarmas.create
this.st_tipo4=create st_tipo4
this.sle_tipo4=create sle_tipo4
this.sle_tipo3=create sle_tipo3
this.sle_tipo2=create sle_tipo2
this.sle_tipo1=create sle_tipo1
this.dw_alarmas=create dw_alarmas
this.st_tipo3=create st_tipo3
this.st_tipo1=create st_tipo1
this.st_tipo2=create st_tipo2
this.st_2=create st_2
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_1=create dw_1
this.uo_def_alarmas=create uo_def_alarmas
this.gb_1=create gb_1
this.st_3=create st_3
this.Control[]={this.st_tipo4,&
this.sle_tipo4,&
this.sle_tipo3,&
this.sle_tipo2,&
this.sle_tipo1,&
this.dw_alarmas,&
this.st_tipo3,&
this.st_tipo1,&
this.st_tipo2,&
this.st_2,&
this.st_1,&
this.cb_cancelar,&
this.cb_aceptar,&
this.dw_1,&
this.uo_def_alarmas,&
this.gb_1,&
this.st_3}
end on

on w_mant_alarmas.destroy
destroy(this.st_tipo4)
destroy(this.sle_tipo4)
destroy(this.sle_tipo3)
destroy(this.sle_tipo2)
destroy(this.sle_tipo1)
destroy(this.dw_alarmas)
destroy(this.st_tipo3)
destroy(this.st_tipo1)
destroy(this.st_tipo2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_1)
destroy(this.uo_def_alarmas)
destroy(this.gb_1)
destroy(this.st_3)
end on

type st_tipo4 from statictext within w_mant_alarmas
boolean visible = false
integer x = 1426
integer y = 1272
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "SCADA:"
boolean focusrectangle = false
end type

type sle_tipo4 from singlelineedit within w_mant_alarmas
boolean visible = false
integer x = 1915
integer y = 1264
integer width = 247
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type sle_tipo3 from singlelineedit within w_mant_alarmas
integer x = 1915
integer y = 1228
integer width = 247
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type sle_tipo2 from singlelineedit within w_mant_alarmas
integer x = 1915
integer y = 1132
integer width = 247
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type sle_tipo1 from singlelineedit within w_mant_alarmas
integer x = 1915
integer y = 1036
integer width = 247
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type dw_alarmas from u_bdg_lista_alarmas within w_mant_alarmas
integer x = 5
integer y = 28
integer width = 1326
integer height = 1336
integer taborder = 30
boolean border = true
end type

event clicked;call super::clicked;//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
// Clicked Script para dw
string tipo
real valor
int habil, Ret, codigo, li_maximo, li_valor_medio
Double ld_maximo, ld_valor_medio, ld_valor  	//**  OSGI 2001.1  29/06/2001

dw_alarmas.SetRedraw(false)
filaant = filaselecc
this.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila

FilaSelecc = row

Anterior = False

IF FilaSelecc > 0 THEN 
	//***************************************
	//**  OSGI 2001.1  	29/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	29/06/2001  	This.Setitem(filaant, 'intermedio', integer(uo_def_alarmas.em_valor_medio.Text))
	//**  OSGI 2001.1  	29/06/2001  	This.Setitem(filaant, 'maximo', integer(uo_def_alarmas.em_valor_maximo.Text))
	
	If Not ib_alarma_dos_empr Then
		This.Setitem(filaant, 'intermedio', integer(uo_def_alarmas.em_valor_medio.Text))
		This.Setitem(filaant, 'maximo', integer(uo_def_alarmas.em_valor_maximo.Text))
	Else
		This.Setitem(filaant, 'intermedio', Double(uo_def_alarmas.em_valor_medio.Text))
		This.Setitem(filaant, 'maximo', Double(uo_def_alarmas.em_valor_maximo.Text))
	End If
	//***************************************
	//**  OSGI 2001.1  	29/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
ELSE
	filaselecc = filaant
	this.SelectRow(FilaSelecc, TRUE)		// Se selecciona la anterior
END IF

this.SelectRow(FilaSelecc, TRUE)		// Se selecciona la fila nueva
codigo = this.GetItemNumber(filaselecc,"codigo")
valor  = this.GetItemNumber(filaselecc,"valor")
li_maximo  = This.GetItemNumber(filaselecc,"maximo")
li_valor_medio  = This.GetItemNumber(filaselecc,"intermedio")

//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	29/06/2001  uo_def_alarmas.uf_actualiza(real(li_maximo),real(li_valor_medio), round(valor,2), li_maximo*3/2, '')


ld_maximo = This.GetItemNumber(filaselecc,"maximo")
ld_valor_medio = This.GetItemNumber(filaselecc,"intermedio")
ld_valor  = this.GetItemNumber(filaselecc,"valor")


If Not ib_alarma_dos_empr Then
	uo_def_alarmas.uf_actualiza(real(li_maximo),real(li_valor_medio), round(valor,2), li_maximo*3/2, '')
Else
	uo_def_alarmas.uf_actualiza((ld_maximo), (ld_valor_medio), round(ld_valor,2), ld_maximo*3/2, '')
End If
//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

fw_campos_invisibles()
fw_actualizar_info_por_tipo()
dw_alarmas.SetRedraw(TRUE)
//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************




//***********************
//**  SCRIPT ORIGINAL  **
//***********************
//**  OSGI 2001.1  	03/07/2001  // Clicked Script para dw
//**  OSGI 2001.1  	03/07/2001  string tipo
//**  OSGI 2001.1  	03/07/2001  real valor
//**  OSGI 2001.1  	03/07/2001  int habil, Ret, codigo, li_maximo, li_valor_medio
//**  OSGI 2001.1  	03/07/2001  Double ld_maximo, ld_valor_medio, ld_valor  	//**  OSGI 2001.1  29/06/2001
//**  OSGI 2001.1  	03/07/2001  
//**  OSGI 2001.1  	03/07/2001  dw_alarmas.SetRedraw(false)
//**  OSGI 2001.1  	03/07/2001  filaant = filaselecc
//**  OSGI 2001.1  	03/07/2001  this.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila
//**  OSGI 2001.1  	03/07/2001  
//**  OSGI 2001.1  	03/07/2001  FilaSelecc = row
//**  OSGI 2001.1  	03/07/2001  
//**  OSGI 2001.1  	03/07/2001  Anterior = False
//**  OSGI 2001.1  	03/07/2001  
//**  OSGI 2001.1  	03/07/2001  IF FilaSelecc > 0 THEN 
//**  OSGI 2001.1  	03/07/2001  	This.Setitem(filaant, 'intermedio', integer(uo_def_alarmas.em_valor_medio.Text))
//**  OSGI 2001.1  	03/07/2001  	This.Setitem(filaant, 'maximo', integer(uo_def_alarmas.em_valor_maximo.Text))
//**  OSGI 2001.1  	03/07/2001  ELSE
//**  OSGI 2001.1  	03/07/2001  	filaselecc = filaant
//**  OSGI 2001.1  	03/07/2001  	this.SelectRow(FilaSelecc, TRUE)		// Se selecciona la anterior
//**  OSGI 2001.1  	03/07/2001  END IF
//**  OSGI 2001.1  	03/07/2001  
//**  OSGI 2001.1  	03/07/2001  this.SelectRow(FilaSelecc, TRUE)		// Se selecciona la fila nueva
//**  OSGI 2001.1  	03/07/2001  codigo = this.GetItemNumber(filaselecc,"codigo")
//**  OSGI 2001.1  	03/07/2001  valor  = this.GetItemNumber(filaselecc,"valor")
//**  OSGI 2001.1  	03/07/2001  li_maximo  = This.GetItemNumber(filaselecc,"maximo")
//**  OSGI 2001.1  	03/07/2001  li_valor_medio  = This.GetItemNumber(filaselecc,"intermedio")
//**  OSGI 2001.1  	03/07/2001  
//**  OSGI 2001.1  	03/07/2001  uo_def_alarmas.uf_actualiza(real(li_maximo),real(li_valor_medio), round(valor,2), li_maximo*3/2, '')
//**  OSGI 2001.1  	03/07/2001  
//**  OSGI 2001.1  	03/07/2001  fw_campos_invisibles()
//**  OSGI 2001.1  	03/07/2001  fw_actualizar_info_por_tipo()
//**  OSGI 2001.1  	03/07/2001  dw_alarmas.SetRedraw(TRUE)
//***********************
//**  SCRIPT ORIGINAL  **
//***********************
end event

type st_tipo3 from statictext within w_mant_alarmas
integer x = 1426
integer y = 1244
integer width = 475
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Programadas:"
boolean focusrectangle = false
end type

type st_tipo1 from statictext within w_mant_alarmas
integer x = 1431
integer y = 1040
integer width = 485
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Imprevista:"
boolean focusrectangle = false
end type

type st_tipo2 from statictext within w_mant_alarmas
integer x = 1426
integer y = 1140
integer width = 471
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Calidad: "
boolean focusrectangle = false
end type

type st_2 from multilineedit within w_mant_alarmas
integer x = 1710
integer y = 24
integer width = 1010
integer height = 124
integer taborder = 70
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = false
boolean displayonly = true
end type

type st_1 from statictext within w_mant_alarmas
integer x = 1358
integer y = 24
integer width = 352
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Alarma"
boolean focusrectangle = false
end type

type cb_cancelar from u_cb within w_mant_alarmas
integer x = 2208
integer y = 1452
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;call super::clicked;//IF  uo_1.Cambio1 or uo_1.Cambio2  or Cambio3 THEN		//Hubo cambios sin confirmar
//  	//ret = MessageBox("Atencion","Si cambia el indicador, perder$$HEX2$$e1002000$$ENDHEX$$los cambios realizados. $$HEX1$$bf00$$ENDHEX$$A$$HEX1$$fa00$$ENDHEX$$n as$$HEX2$$ed002000$$ENDHEX$$quiere salvar?",Question!,YesNo!)
//	ret = gnv_msg.f_mensaje("CB01","","",YesNo!)
//	IF Ret = 1 THEN
//		Click = True
//		cb_1.TriggerEvent(Clicked!)
//	END IF
//END IF
//
gnu_u_transaction.uf_rollback(Parent)
Close(Parent)
end event

type cb_aceptar from u_cb within w_mant_alarmas
integer x = 640
integer y = 1452
integer width = 411
integer height = 96
integer taborder = 60
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;
//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	29/06/2001  dw_alarmas.Setitem(filaselecc, 'intermedio', integer(uo_def_alarmas.em_valor_medio.Text))
//**  OSGI 2001.1  	29/06/2001  dw_alarmas.Setitem(filaselecc, 'maximo', integer(uo_def_alarmas.em_valor_maximo.Text))

If Not ib_alarma_dos_empr Then
	dw_alarmas.Setitem(filaselecc, 'intermedio', integer(uo_def_alarmas.em_valor_medio.Text))
	dw_alarmas.Setitem(filaselecc, 'maximo', integer(uo_def_alarmas.em_valor_maximo.Text))
Else
	dw_alarmas.Setitem(filaselecc, 'intermedio', Double(uo_def_alarmas.em_valor_medio.Text))
	dw_alarmas.Setitem(filaselecc, 'maximo', Double(uo_def_alarmas.em_valor_maximo.Text))
End If
//***************************************
//**  OSGI 2001.1  	29/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF dw_alarmas.Update() = 1 THEN
	gnu_u_transaction.uf_commit(Parent)
ELSE 
	gnu_u_transaction.uf_rollback(Parent)
END IF

Close(Parent)



end event

type dw_1 from datawindow within w_mant_alarmas
integer x = 151
integer y = 400
integer width = 379
integer height = 360
integer taborder = 20
string dataobject = "d_mant_alarmas_general"
boolean livescroll = true
end type

type uo_def_alarmas from u_indic_alarma within w_mant_alarmas
integer x = 1371
integer y = 196
integer width = 1819
integer height = 712
boolean border = true
end type

on uo_def_alarmas.destroy
call u_indic_alarma::destroy
end on

type gb_1 from groupbox within w_mant_alarmas
integer x = 1371
integer y = 932
integer width = 1179
integer height = 432
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Por Tipo  "
borderstyle borderstyle = styleraised!
end type

type st_3 from statictext within w_mant_alarmas
integer x = 1344
integer y = 184
integer width = 1394
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type


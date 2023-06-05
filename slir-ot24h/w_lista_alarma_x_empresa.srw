HA$PBExportHeader$w_lista_alarma_x_empresa.srw
forward
global type w_lista_alarma_x_empresa from w_lista_alarma
end type
type dw_indicadores from datawindow within w_lista_alarma_x_empresa
end type
type dw_arma_sql from datawindow within w_lista_alarma_x_empresa
end type
type dw_alarmas_empresa from datawindow within w_lista_alarma_x_empresa
end type
type dw_valores_ext from datawindow within w_lista_alarma_x_empresa
end type
end forward

global type w_lista_alarma_x_empresa from w_lista_alarma
int Y=452
int Width=2117
int Height=1756
boolean Visible=false
dw_indicadores dw_indicadores
dw_arma_sql dw_arma_sql
dw_alarmas_empresa dw_alarmas_empresa
dw_valores_ext dw_valores_ext
end type
global w_lista_alarma_x_empresa w_lista_alarma_x_empresa

type variables
String is_nro_centro = ''
Integer ii_parametro_bdg = 0
end variables

forward prototypes
public subroutine fw_ratios (readonly string as_tipo, readonly integer ai_nivel_arr)
end prototypes

public subroutine fw_ratios (readonly string as_tipo, readonly integer ai_nivel_arr);Date ldt_fecha_hoy
Long ll_annio, ll_perido_ini, ll_perido_fin, ll_row
Integer li_dia, li_mes




ldt_fecha_hoy = Date(fgnu_fecha_actual())

li_dia = Day(ldt_fecha_hoy)
li_mes = Month(ldt_fecha_hoy)
ll_annio = Year(ldt_fecha_hoy)

ll_perido_ini = Long(String(ll_annio) + '0101')
ll_perido_fin = Long(String(ll_annio) + String(li_mes, '00') + String(li_dia, '00'))
//MessageBox(String(ll_perido_ini), ll_perido_fin)
//
//If ll_row <= 0 Or IsNull(ll_row) Then ll_row = dw_indicadores.Retrieve(ll_perido_ini, ll_perido_fin)


Integer li_i, li_row, ll_row_filter
Long ll_row_retrieve, ll_find
Double ld_count
String ls_sql, ls_campo, ls_valor



li_row = 2

For li_i = 1 To li_row
	 ld_count = 0

	 ll_row_retrieve = dw_arma_sql.Retrieve(ii_parametro_bdg, li_i, as_tipo)
	 
	 If ll_row_retrieve > 0 Then ls_sql = dw_arma_sql.GetItemString(ll_row_retrieve, 'c_sql_final')
	 
	 DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	 PREPARE SQLSA FROM :ls_sql ;
	 OPEN DYNAMIC my_cursor ;
	 FETCH my_cursor INTO :ld_count ;


	 ls_campo = "valor"

	 If li_i > 1 Then
		 ls_campo = ls_campo + String(li_i)
	 End If


	 If IsNull(ld_count) Then ld_count = 0


	 If sqlca.sqlcode = 0 Then
		 dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
	 Else
		 If sqlca.sqlcode <> 100 Then
			 ll_find = dw_arma_sql.Find("Upper(valor) In ('TIEPI', 'TIEBT', 'SAIFI', 'SAIDI', 'CAIDI', 'ASAI')",1, dw_arma_sql.RowCount())
			 
			 If ll_find > 0 Then
				 ls_valor = Upper(dw_arma_sql.GetItemString(ll_find, "valor"))

				 dw_arma_sql.SetFilter("valor <> '" + ls_valor + "'")
				 dw_arma_sql.Filter()


				 ll_row_filter = dw_arma_sql.RowCount()
				 
				 If ll_row_filter > 0 Then
					 ls_sql = dw_arma_sql.GetItemString(ll_row_filter, 'c_sql_final')
					 is_nro_centro = ls_sql
					 
//					 MessageBox(is_nro_centro + "   " + String(ll_perido_ini), ll_perido_fin)
					 
				 	 dw_indicadores.Retrieve(ll_perido_ini, ll_perido_fin)
					 dw_indicadores.AcceptText()
					 
					 ll_row_filter = dw_indicadores.RowCount()
					 ld_count = 0


					 If ll_row_filter > 0 Then
						 CHOOSE CASE ls_valor
								CASE 'TIEPI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_tiepi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
								CASE 'TIEBT'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_tiebt")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
								CASE 'SAIFI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_saifi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
								CASE 'SAIDI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_saidi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
								CASE 'CAIDI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_caidi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
								CASE 'ASAI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_asai")

									If IsNull(ld_count) Then ld_count = 0

									ld_count = Truncate(ld_count, 4)

									dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
									
						 END CHOOSE

					 End If
				 End If
			 End If
		 Else
			 ld_count = 0
			 dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, ld_count)
		 End If
	 End If


	 dw_alarmas_empresa.AcceptText()

	 If IsNull(dw_alarmas_empresa.GetItemNumber(ai_nivel_arr, ls_campo)) Then
		 dw_alarmas_empresa.SetItem(ai_nivel_arr, ls_campo, 0)
	 End If


	 dw_arma_sql.SetFilter("")
	 dw_arma_sql.Filter()

	 dw_indicadores.SetFilter("")
	 dw_indicadores.Filter()

	 CLOSE my_cursor ;
Next















//Date ldt_fecha_hoy
//Long ll_annio, ll_perido_ini, ll_perido_fin, ll_row
//Integer li_dia, li_mes
//
//
//
//
//ldt_fecha_hoy = Date(fgnu_fecha_actual())
//
//li_dia = Day(ldt_fecha_hoy)
//li_mes = Month(ldt_fecha_hoy)
//ll_annio = Year(ldt_fecha_hoy)
//
//ll_perido_ini = Long(String(ll_annio) + '0101')
//ll_perido_fin = Long(String(ll_annio) + String(li_mes) + String(li_dia))
//
//
//If ll_row <= 0 Or IsNull(ll_row) Then ll_row = dw_indicadores.Retrieve(ll_perido_ini, ll_perido_fin)
//
//
//If ll_row > 0 Then
//	CHOOSE CASE Upper(as_ratio)
//		CASE 'TIEPI'
//			dw_indicadores.SetFilter(as_where)
//			dw_indicadores.Filter()
//			
//		CASE 'TIEBT'
//		CASE 'SAIFI'
//		CASE 'SAIDI'
//		CASE 'CAIDI'
//		CASE 'ASAI'
//
//END CHOOSE
//
//End If
end subroutine

on w_lista_alarma_x_empresa.create
int iCurrent
call super::create
this.dw_indicadores=create dw_indicadores
this.dw_arma_sql=create dw_arma_sql
this.dw_alarmas_empresa=create dw_alarmas_empresa
this.dw_valores_ext=create dw_valores_ext
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_indicadores
this.Control[iCurrent+2]=this.dw_arma_sql
this.Control[iCurrent+3]=this.dw_alarmas_empresa
this.Control[iCurrent+4]=this.dw_valores_ext
end on

on w_lista_alarma_x_empresa.destroy
call super::destroy
destroy(this.dw_indicadores)
destroy(this.dw_arma_sql)
destroy(this.dw_alarmas_empresa)
destroy(this.dw_valores_ext)
end on

event open;call super::open;Long ll_i, ll_row, ll_insert, ll_row_max, ll_codigo, ll_find
Double ld_valor
String ls_arr_tipo[], ls_icono, ls_valor, ls_row, ls_select[], ls_nivel_tipo[], ls_column
Integer li_column, li_i_nivel, li_niveles

ls_nivel_tipo[1] = 'ICO'
ls_nivel_tipo[2] = 'FOR'
ls_nivel_tipo[3] = 'UNI'

li_niveles = UpperBound(ls_nivel_tipo)

ii_parametro_bdg = fg_valor_parametro(This.ClassName())

dw_indicadores.SetTransObject(SQLCA)
dw_arma_sql.SetTransObject(SQLCA)

dw_valores_ext.SetTransObject(SQLCA)
dw_valores_ext.Retrieve(ii_parametro_bdg)  // Colocar argumento para recuperar por # de par$$HEX1$$e100$$ENDHEX$$metro.


dw_valores_ext.SetFilter("columna = 0 And Left(tipo, 3) Not In ('ICO', 'FOR', 'UNI')")
dw_valores_ext.Filter()
dw_valores_ext.SetSort("c_orden A")
dw_valores_ext.Sort()


ll_row = dw_valores_ext.RowCount()
ll_row_max = ll_row

For ll_i = 1 To ll_row
	ls_arr_tipo[ll_i] = dw_valores_ext.GetItemString(ll_i, "valor")
	
	ll_insert = dw_alarmas_empresa.InsertRow(0)
	
	dw_alarmas_empresa.SetItem(ll_insert, "descripcion", dw_valores_ext.GetItemString(ll_i, "descripcion"))
	dw_alarmas_empresa.SetItem(ll_insert, "codigo", Long(dw_valores_ext.GetItemString(ll_i, "tipo")))
Next



For li_i_nivel = 1 To li_niveles
	dw_valores_ext.SetFilter("columna = 0 And tipo Like '" + ls_nivel_tipo[li_i_nivel] + "%'")
	dw_valores_ext.Filter()
	
	ll_row = dw_valores_ext.RowCount()
	
	For ll_i = 1 To ll_row
		 ls_icono = Trim(dw_valores_ext.GetItemString(ll_i, "tipo"))
		 ls_row	 = Right(ls_icono, Len(ls_icono) - 3)
		 ls_valor = dw_valores_ext.GetItemString(ll_i, "valor")
		 
		 If IsNumber(ls_row) Then
			 ll_insert = Long(ls_row)
	
			 If ll_insert > 0 And ll_insert <= ll_row_max Then
				 CHOOSE CASE ls_nivel_tipo[li_i_nivel]
					 CASE 'ICO'
						 dw_alarmas_empresa.SetItem(ll_insert, "ventana", ls_valor)
					 CASE 'FOR'
						 If IsNumber(ls_valor) And Not IsNull(ls_valor) Then
							 dw_alarmas_empresa.SetItem(ll_insert, "formato", Long(ls_valor))
						 End If
					 CASE 'UNI'
						 dw_alarmas_empresa.SetItem(ll_insert, "unidad", ls_valor)
				 END CHOOSE
			 End If
		 End If
	Next	
Next


ll_row = UpperBound(ls_arr_tipo)


For ll_i = 1 To ll_row
	 fw_ratios(ls_arr_tipo[ll_i], ll_i)
Next


ll_row = dw_lista.RowCount()
ll_find = 0

For ll_i = 1 To ll_row
	 ll_codigo = dw_lista.GetItemNumber(ll_i, 'codigo')
	 
	 If ll_codigo <= 50 Then
		 ls_column = ""
	 Else
		 ls_column = "2"
		 ll_codigo -= 50
	 End If
	
	 ll_find = dw_alarmas_empresa.Find("codigo =" + String(ll_codigo), 1, dw_alarmas_empresa.RowCount())
	 
	 If ll_find > 0 Then
		 dw_alarmas_empresa.SetItem(ll_find, 'bandera'+ls_column , dw_lista.GetItemString(ll_i, 'bandera_alarma'))
	 End If
Next
	
	
dw_alarmas_empresa.AcceptText()

This.Visible = True
end event

type dw_lista from w_lista_alarma`dw_lista within w_lista_alarma_x_empresa
int X=9
boolean Visible=false
end type

type dw_indicadores from datawindow within w_lista_alarma_x_empresa
int X=37
int Y=1188
int Width=2025
int Height=360
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
string DataObject="d_grafica_proyeccion_datos_oculto"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event sqlpreview;sqlsyntax = sqlsyntax + is_nro_centro
THIS.SetSQLPreview(sqlsyntax)
end event

type dw_arma_sql from datawindow within w_lista_alarma_x_empresa
int X=1435
int Y=772
int Width=494
int Height=360
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
string DataObject="dw_arma_sql_oculto"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_alarmas_empresa from datawindow within w_lista_alarma_x_empresa
int X=9
int Y=8
int Width=2075
int Height=1640
int TabOrder=20
string DataObject="d_bdg_alarmas_x_empresa"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event doubleclicked;String ls_codigo


This.SelectRow(FilaSelecc, FALSE)

FilaSelecc = row

IF Filaselecc > 0 THEN
	This.SelectRow(FilaSelecc, TRUE)
	ls_codigo = String(This.GetITemNumber(filaselecc,"codigo"))

	//***************************************
	//**  OSGI 2001.1  	07/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	If ib_sin_acc_mant_alar Then Return
	//***************************************
	//**  OSGI 2001.1  	07/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

	OpenWithParm(w_mant_alarmas_x_empresa, ls_codigo)
END IF
end event

type dw_valores_ext from datawindow within w_lista_alarma_x_empresa
int X=9
int Width=1120
int Height=156
int TabOrder=40
boolean Visible=false
boolean BringToTop=true
string DataObject="d_bdg_alarmas_x_empresa_cod"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type


HA$PBExportHeader$w_mant_alarmas_x_empresa.srw
forward
global type w_mant_alarmas_x_empresa from w_mant_alarmas
end type
type rb_2 from radiobutton within w_mant_alarmas_x_empresa
end type
type rb_1 from radiobutton within w_mant_alarmas_x_empresa
end type
type gb_empresa from groupbox within w_mant_alarmas_x_empresa
end type
type dw_indicadores from datawindow within w_mant_alarmas_x_empresa
end type
type dw_alarmas_empresa from datawindow within w_mant_alarmas_x_empresa
end type
type dw_arma_sql from datawindow within w_mant_alarmas_x_empresa
end type
type dw_valores_ext from datawindow within w_mant_alarmas_x_empresa
end type
end forward

global type w_mant_alarmas_x_empresa from w_mant_alarmas
int Width=3570
rb_2 rb_2
rb_1 rb_1
gb_empresa gb_empresa
dw_indicadores dw_indicadores
dw_alarmas_empresa dw_alarmas_empresa
dw_arma_sql dw_arma_sql
dw_valores_ext dw_valores_ext
end type
global w_mant_alarmas_x_empresa w_mant_alarmas_x_empresa

type variables
Integer ii_parametro_bdg = 0
String is_nro_centro = ''
Boolean ib_primera_vez_emp2 = False
end variables

forward prototypes
public subroutine fw_ratios (readonly string as_tipo, readonly long al_row, readonly long al_codigo)
public subroutine fw_filter_empresa (readonly integer ai_empresa)
end prototypes

public subroutine fw_ratios (readonly string as_tipo, readonly long al_row, readonly long al_codigo);Date ldt_fecha_hoy
Long ll_annio, ll_perido_ini, ll_perido_fin, ll_row
Integer li_dia, li_mes




ldt_fecha_hoy = Date(fgnu_fecha_actual())

li_dia = Day(ldt_fecha_hoy)
li_mes = Month(ldt_fecha_hoy)
ll_annio = Year(ldt_fecha_hoy)

ll_perido_ini = Long(String(ll_annio) + '0101')
ll_perido_fin = Long(String(ll_annio) + String(li_mes, '00') + String(li_dia, '00'))


//If ll_row <= 0 Or IsNull(ll_row) Then ll_row = dw_indicadores.Retrieve(ll_perido_ini, ll_perido_fin)


Integer li_i
Long ll_row_retrieve, ll_find, ll_row_filter
Double ld_count
String ls_sql, ls_campo, ls_valor




If al_codigo > 50 Then
	li_i = 2
Else
	li_i = 1
End If



	 ld_count = 0

	 ll_row_retrieve = dw_arma_sql.Retrieve(ii_parametro_bdg, li_i, as_tipo)
//	 MessageBox("ll_row_retrieve", ll_row_retrieve)
	 If ll_row_retrieve > 0 Then ls_sql = dw_arma_sql.GetItemString(ll_row_retrieve, 'c_sql_final')
	 
	 DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	 PREPARE SQLSA FROM :ls_sql ;
	 OPEN DYNAMIC my_cursor ;
	 FETCH my_cursor INTO :ld_count ;


	 ls_campo = "valor"

//	 If li_i > 1 Then
//		 ls_campo = ls_campo + String(li_i)
//	 End If



	 If IsNull(ld_count) Then ld_count = 0


	 If sqlca.sqlcode = 0 Then
		 dw_alarmas.SetItem(al_row, ls_campo, ld_count)
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
					 
				 	 dw_indicadores.Retrieve(ll_perido_ini, ll_perido_fin)
					 dw_indicadores.AcceptText()
					 
					 ll_row_filter = dw_indicadores.RowCount()
					 ld_count = 0


					 If ll_row_filter > 0 Then
						 CHOOSE CASE ls_valor
								CASE 'TIEPI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_tiepi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas.SetItem(al_row, ls_campo, ld_count)
								CASE 'TIEBT'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_tiebt")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas.SetItem(al_row, ls_campo, ld_count)
								CASE 'SAIFI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_saifi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas.SetItem(al_row, ls_campo, ld_count)
								CASE 'SAIDI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_saidi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas.SetItem(al_row, ls_campo, ld_count)
								CASE 'CAIDI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_caidi")

									If IsNull(ld_count) Then ld_count = 0

									dw_alarmas.SetItem(al_row, ls_campo, ld_count)
								CASE 'ASAI'
									ld_count = dw_indicadores.GetItemNumber(ll_row_filter, "c_valor_asai")

									If IsNull(ld_count) Then ld_count = 0

									ld_count = Truncate(ld_count, 4)

									dw_alarmas.SetItem(al_row, ls_campo, ld_count)

						 END CHOOSE

					 End If
				 End If
			 End If
		 Else
			 ld_count = 0
			 dw_alarmas.SetItem(al_row, ls_campo, ld_count)
		 End If
	 End If

	 dw_arma_sql.SetFilter("")
	 dw_arma_sql.Filter()

	 dw_indicadores.SetFilter("")
	 dw_indicadores.Filter()

	 CLOSE my_cursor ;
















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

public subroutine fw_filter_empresa (readonly integer ai_empresa);Long ll_i, ll_row, ls_arr_format[]
String ls_arr_icono[], ls_arr_unidad[]


If ai_empresa = 2 And Not ib_primera_vez_emp2 Then
	ll_row = dw_alarmas.RowCount()

	For ll_i = 1 To ll_row
		 ls_arr_icono[ll_i] = dw_alarmas.GetItemString(ll_i, "ventana")
		 ls_arr_format[ll_i] = dw_alarmas.GetItemNumber(ll_i, "formato") 
		 ls_arr_unidad[ll_i] = dw_alarmas.GetItemString(ll_i, "unidad")
	Next
End If


fg_filtro_ext(dw_alarmas, This.ClassName() + "_fil" + String(ai_empresa), "")

dw_alarmas.SetSort("codigo A")
dw_alarmas.Sort()


If ai_empresa = 2 And Not ib_primera_vez_emp2 Then
	For ll_i = 1 To ll_row
		 dw_alarmas.SetItem(ll_i, "ventana", ls_arr_icono[ll_i])
		 dw_alarmas.SetItem(ll_i, "formato", ls_arr_format[ll_i]) 
		 dw_alarmas.SetItem(ll_i, "unidad", ls_arr_unidad[ll_i])
	Next

	ib_primera_vez_emp2 = True
End If


////////////
FilaSelecc = 0
end subroutine

on w_mant_alarmas_x_empresa.create
int iCurrent
call super::create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_empresa=create gb_empresa
this.dw_indicadores=create dw_indicadores
this.dw_alarmas_empresa=create dw_alarmas_empresa
this.dw_arma_sql=create dw_arma_sql
this.dw_valores_ext=create dw_valores_ext
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_2
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.gb_empresa
this.Control[iCurrent+4]=this.dw_indicadores
this.Control[iCurrent+5]=this.dw_alarmas_empresa
this.Control[iCurrent+6]=this.dw_arma_sql
this.Control[iCurrent+7]=this.dw_valores_ext
end on

on w_mant_alarmas_x_empresa.destroy
call super::destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_empresa)
destroy(this.dw_indicadores)
destroy(this.dw_alarmas_empresa)
destroy(this.dw_arma_sql)
destroy(this.dw_valores_ext)
end on

event open;call super::open;Long ll_i, ll_row, ll_insert, ll_row_max, ll_find, ll_row_find, ll_codigo
Double ld_valor
String ls_tipo, ls_icono, ls_valor, ls_row, ls_select[], ls_nivel_tipo[]
Integer li_i, li_column, li_max_column, li_i_nivel, li_niveles

ls_nivel_tipo[1] = 'ICO'
ls_nivel_tipo[2] = 'FOR'
ls_nivel_tipo[3] = 'UNI'







li_niveles = UpperBound(ls_nivel_tipo)

ii_parametro_bdg = fg_valor_parametro(This.ClassName())

dw_indicadores.SetTransObject(SQLCA)
dw_arma_sql.SetTransObject(SQLCA)
dw_valores_ext.SetTransObject(SQLCA)


dw_valores_ext.Retrieve(ii_parametro_bdg)


ll_row_find = dw_alarmas.RowCount()


dw_valores_ext.SetFilter("columna = 0 And Left(tipo, 3) Not In ('ICO', 'FOR', 'UNI')")
dw_valores_ext.Filter()


//For ll_i = 1 To ll_row_find
//	 ll_codigo = dw_alarmas_empresa.GetItemNumber(ll_i, "codigo")
//
//	 ll_find = dw_valores_ext.Find("codigo = " + String(ll_codigo), 1, ll_find)
//
//	 If ll_find <= 0 Then
//		 dw_alarmas_empresa.DeleteRow(ll_i)
//		 ll_i --
//	 End If
//Next


dw_valores_ext.SetSort("c_orden A")
dw_valores_ext.Sort()


ll_row = dw_valores_ext.RowCount()
ll_row_max = dw_alarmas.RowCount()


li_max_column = 2

For ll_i = 1 To ll_row
	 ls_tipo = dw_valores_ext.GetItemString(ll_i, "valor")
	 ll_codigo = Long(dw_valores_ext.GetItemString(ll_i, "tipo"))
	 
	 For li_i = 1 To li_max_column
		  If li_i <> 1 Then ll_codigo += 50

		  ll_find = dw_alarmas.Find("codigo = " + String(ll_codigo), 1, ll_row_find)

		  If ll_find > 0 And Not IsNull(ll_find) Then
			  dw_alarmas.SetItem(ll_find, "descripcion", dw_valores_ext.GetItemString(ll_i, "descripcion"))
			  dw_alarmas.SetItem(ll_find, "c_valor", ls_tipo)
		  End If
	 Next
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
						 dw_alarmas.SetItem(ll_insert, "ventana", ls_valor)
					 CASE 'FOR'
						 If IsNumber(ls_valor) And Not IsNull(ls_valor) Then
							 dw_alarmas.SetItem(ll_insert, "formato", Long(ls_valor))
						 End If
					 CASE 'UNI'
						 dw_alarmas.SetItem(ll_insert, "unidad", ls_valor)
				 END CHOOSE
			 End If
		 End If
	Next	
Next


ll_row = dw_alarmas.RowCount()


For ll_i = 1 To ll_row
	 fw_ratios(dw_alarmas.GetItemString(ll_i, "c_valor"), ll_i, dw_alarmas.GetItemNumber(ll_i, "codigo"))
Next

dw_alarmas.AcceptText()

fw_filter_empresa(1)
end event

type st_tipo4 from w_mant_alarmas`st_tipo4 within w_mant_alarmas_x_empresa
int X=1883
int Y=1268
end type

type sle_tipo4 from w_mant_alarmas`sle_tipo4 within w_mant_alarmas_x_empresa
int X=2373
int Y=1260
int TabOrder=100
end type

type sle_tipo3 from w_mant_alarmas`sle_tipo3 within w_mant_alarmas_x_empresa
int X=2222
int Y=1224
end type

type sle_tipo2 from w_mant_alarmas`sle_tipo2 within w_mant_alarmas_x_empresa
int X=2222
int Y=1128
end type

type sle_tipo1 from w_mant_alarmas`sle_tipo1 within w_mant_alarmas_x_empresa
int X=2222
int Y=1032
end type

type dw_alarmas from w_mant_alarmas`dw_alarmas within w_mant_alarmas_x_empresa
int X=23
int Y=32
int Width=1623
int Height=1328
int TabOrder=70
string DataObject="d_bdg_alar_x_empr"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
end type

event dw_alarmas::sqlpreview;call super::sqlpreview;//String ls_filtro
//
//
//
//
//ls_filtro = fg_filtro_ext(This, "w_mant_alar_x_empr_fil", "")
//
//sqlsyntax = sqlsyntax + ls_filtro
//THIS.SetSQLPreview(sqlsyntax)
end event

event dw_alarmas::rowfocuschanged;call super::rowfocuschanged;//String ls_mask
//
//
//
//ls_mask = dw_alarmas_empresa.Describe("valor.Edit.Format")
//MessageBox("ls_mask", ls_mask)
//If ib_alarma_dos_empr Then
//	uo_def_alarmas.em_valor_medio.SetMask(NumericMask!, ls_mask)
//End If
end event

type st_tipo3 from w_mant_alarmas`st_tipo3 within w_mant_alarmas_x_empresa
int X=1733
int Y=1240
end type

type st_tipo1 from w_mant_alarmas`st_tipo1 within w_mant_alarmas_x_empresa
int X=1737
int Y=1036
end type

type st_tipo2 from w_mant_alarmas`st_tipo2 within w_mant_alarmas_x_empresa
int X=1733
int Y=1136
end type

type st_2 from w_mant_alarmas`st_2 within w_mant_alarmas_x_empresa
int X=2016
int Y=20
int TabOrder=120
end type

type st_1 from w_mant_alarmas`st_1 within w_mant_alarmas_x_empresa
int X=1664
int Y=20
end type

type cb_cancelar from w_mant_alarmas`cb_cancelar within w_mant_alarmas_x_empresa
int X=2473
int Y=1448
end type

type cb_aceptar from w_mant_alarmas`cb_aceptar within w_mant_alarmas_x_empresa
int X=690
int Y=1448
int TabOrder=110
end type

type dw_1 from w_mant_alarmas`dw_1 within w_mant_alarmas_x_empresa
int TabOrder=30
end type

type uo_def_alarmas from w_mant_alarmas`uo_def_alarmas within w_mant_alarmas_x_empresa
int X=1691
int Y=164
end type

type gb_1 from w_mant_alarmas`gb_1 within w_mant_alarmas_x_empresa
int X=1678
int Y=928
int TabOrder=80
long BackColor=79741120
end type

type st_3 from w_mant_alarmas`st_3 within w_mant_alarmas_x_empresa
int X=1650
int Y=180
end type

type rb_2 from radiobutton within w_mant_alarmas_x_empresa
int X=3022
int Y=1184
int Width=357
int Height=76
string Text="Edechi"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;ii_empresa = 2

dw_alarmas.Trigger Event clicked(0, 0, 1, dw_alarmas.Object)
fw_filter_empresa(ii_empresa)
end event

type rb_1 from radiobutton within w_mant_alarmas_x_empresa
int X=3022
int Y=1056
int Width=357
int Height=76
string Text="Edemet"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;ii_empresa = 1

dw_alarmas.Trigger Event clicked(0, 0, 1, dw_alarmas.Object)
fw_filter_empresa(ii_empresa)
end event

type gb_empresa from groupbox within w_mant_alarmas_x_empresa
int X=2898
int Y=928
int Width=613
int Height=432
int TabOrder=90
string Text=" Empresa "
BorderStyle BorderStyle=StyleRaised!
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_indicadores from datawindow within w_mant_alarmas_x_empresa
int X=32
int Y=764
int Width=1307
int Height=360
int TabOrder=50
boolean Visible=false
string DataObject="d_grafica_proyeccion_datos_oculto"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event sqlpreview;sqlsyntax = sqlsyntax + is_nro_centro
THIS.SetSQLPreview(sqlsyntax)
end event

type dw_alarmas_empresa from datawindow within w_mant_alarmas_x_empresa
int X=14
int Width=1733
int Height=1408
int TabOrder=40
boolean Visible=false
boolean BringToTop=true
string DataObject="d_bdg_alarmas_x_empresa"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event doubleclicked;//String ls_codigo
//
//
//This.SelectRow(FilaSelecc, FALSE)
//
//FilaSelecc = row
//
//IF Filaselecc > 0 THEN
//	This.SelectRow(FilaSelecc, TRUE)
//	ls_codigo = String(This.GetITemNumber(filaselecc,"codigo"))
//	OpenWithParm(w_mant_alar_x_empr, ls_codigo)
//END IF
end event

type dw_arma_sql from datawindow within w_mant_alarmas_x_empresa
int X=1893
int Y=768
int Width=494
int Height=360
int TabOrder=60
boolean Visible=false
boolean BringToTop=true
string DataObject="dw_arma_sql_oculto"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_valores_ext from datawindow within w_mant_alarmas_x_empresa
int X=9
int Width=558
int Height=1524
int TabOrder=20
boolean Visible=false
string DataObject="d_bdg_alarmas_x_empresa_cod"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type


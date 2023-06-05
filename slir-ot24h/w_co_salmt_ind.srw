HA$PBExportHeader$w_co_salmt_ind.srw
forward
global type w_co_salmt_ind from window
end type
type dw_int_abiertas_conectividad from datawindow within w_co_salmt_ind
end type
type dw_inserta_salmt_nuevas from datawindow within w_co_salmt_ind
end type
type dw_invisible from datawindow within w_co_salmt_ind
end type
type dw_int_abiertas from datawindow within w_co_salmt_ind
end type
type st_crea_inc from statictext within w_co_salmt_ind
end type
type st_buscar from statictext within w_co_salmt_ind
end type
type em_potencia from editmask within w_co_salmt_ind
end type
type st_potencia from statictext within w_co_salmt_ind
end type
type pb_incidencia from picturebutton within w_co_salmt_ind
end type
type pb_recuperar from picturebutton within w_co_salmt_ind
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_co_salmt_ind
end type
type sle_buscar_inst from singlelineedit within w_co_salmt_ind
end type
type st_buscar_inst from statictext within w_co_salmt_ind
end type
type dw_decargos from datawindow within w_co_salmt_ind
end type
type dw_salmt from datawindow within w_co_salmt_ind
end type
type gb_2 from groupbox within w_co_salmt_ind
end type
type gb_1 from groupbox within w_co_salmt_ind
end type
end forward

global type w_co_salmt_ind from window
integer width = 3621
integer height = 2040
boolean titlebar = true
string title = "SMT Interrumpibles"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
dw_int_abiertas_conectividad dw_int_abiertas_conectividad
dw_inserta_salmt_nuevas dw_inserta_salmt_nuevas
dw_invisible dw_invisible
dw_int_abiertas dw_int_abiertas
st_crea_inc st_crea_inc
st_buscar st_buscar
em_potencia em_potencia
st_potencia st_potencia
pb_incidencia pb_incidencia
pb_recuperar pb_recuperar
dw_ambito dw_ambito
sle_buscar_inst sle_buscar_inst
st_buscar_inst st_buscar_inst
dw_decargos dw_decargos
dw_salmt dw_salmt
gb_2 gb_2
gb_1 gb_1
end type
global w_co_salmt_ind w_co_salmt_ind

type variables
Long il_selected_rows, il_row_click
Boolean ib_aceptar, ib_crea_inc, ib_multiples, ib_char
s_brigada_int istr_brigada_int
Integer ii_nivel_retrieve
String is_where_salmt_nuevas
end variables

forward prototypes
public subroutine fw_clicked (readonly datawindow adw_dataw, readonly long row)
public subroutine fw_clicked_suma ()
public function long fw_act_ult_inc ()
public subroutine fw_incidencia ()
public function long fw_act_ult_ot ()
public subroutine fw_crea_estado_oper (readonly long al_nro_incidencia)
public function long fw_crea_brigada_ot (readonly long al_row, readonly long al_nro_incidencia, readonly long al_nro_inst_afec, readonly long al_nro_centro, readonly long al_nro_cmd, readonly long al_nro_puesto)
public subroutine fw_recuperar ()
end prototypes

public subroutine fw_clicked (readonly datawindow adw_dataw, readonly long row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_clicked
// 
// Objetivo: Resalta las instalaciones que seleccionan con un click
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: datawindow adw_dataw, long row
//              Salida:  --
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 11/09/2000    JPE           Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
Long ll_i, ll_rowcount
Integer li_step


ll_rowcount = adw_dataw.RowCount()

If row <= 0 Then Return

If KeyDown(KeyControl!) And Not ib_char Then
   If adw_dataw.IsSelected(row) Then
      adw_dataw.SelectRow(row, False)
      il_selected_rows --
   Else
      adw_dataw.SelectRow(row, True)
      il_selected_rows ++
   End If
   il_row_click = row
ElseIf KeyDown(KeyShift!) And Not ib_char Then		
   If row > il_row_click Then
      FOR ll_i=il_row_click TO row STEP 1
          adw_dataw.SelectRow(ll_i, True)
          il_selected_rows ++
      NEXT
   Else
      FOR ll_i=il_row_click TO row STEP -1
          adw_dataw.SelectRow(ll_i, True)
          il_selected_rows ++
      NEXT
   End If
	
   il_row_click = row
Else
	adw_dataw.SelectRow(0, False)
	adw_dataw.SelectRow(row, True)
	il_row_click = row
	If row = 0 Then
		 If ll_rowcount > 1 Then
			  il_selected_rows = 2 // m$$HEX1$$e100$$ENDHEX$$s de uno
		 Else
			  il_selected_rows = 1
		 End If
	Else
		 il_selected_rows = 1
	End If
End If


fw_clicked_suma()
end subroutine

public subroutine fw_clicked_suma ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_clicked_suma
// 
// Objetivo: Marca las instalaciones que seleccionan con un click para hacer el c$$HEX1$$e100$$ENDHEX$$lculo de potencias
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: --
//              Salida:  --
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 11/09/2000    JPE           Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Long ll_i, ll_row


ll_row = dw_salmt.RowCount()


For ll_i = 1 To ll_row
	 If dw_salmt.IsSelected(ll_i) Then
	    dw_salmt.SetItem(ll_i, "c_clicked", 1)
	 Else
   	 dw_salmt.SetItem(ll_i, "c_clicked", 0)
	 End If
Next

dw_salmt.AcceptText()

If dw_salmt.RowCount() > 0 Then em_potencia.Text = String(dw_salmt.GetItemNumber(1, "c_suma_pot"), "###,##0.0")


end subroutine

public function long fw_act_ult_inc ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_act_ult_inc
// 
// Objetivo: Incrementa en uno el nro de la ultima incidencia que se dio de alta
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: --
//              Salida:  long
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 11/09/2000    JPE                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_inc
select cod_incidencia.nextval into :ll_nro_inc from dual;
Return ll_nro_inc
end function

public subroutine fw_incidencia ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_incidencia
// 
// Objetivo: Crea incidencias de las instalaciones marcadas
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: --
//              Salida:  --
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 11/09/2000    JPE           Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
Long ll_i, ll_row, ll_nro_inst_afectada
String ls_y, ls_y_imagen
int li_respuesta
DataStore lds_con_smt_print




ll_row = dw_salmt.RowCount()

If ll_row > 0 And ib_multiples Then
	ls_y = '168'
	ls_y_imagen = '208'

	lds_con_smt_print = Create DataStore
	
	lds_con_smt_print.DataObject = dw_salmt.DataObject

	lds_con_smt_print.Modify("DataWindow.Header.Height='320'")
	lds_con_smt_print.Modify("DataWindow.Footer.Height='84'")


//	lds_con_smt_print.Modify("Destroy c_marco_enc")
	lds_con_smt_print.Modify("c_marco_enc.y='" + ls_y + "'")


	lds_con_smt_print.Modify("c_titulo.visible='1'")
	lds_con_smt_print.Modify("c_fecha.visible='1'")
	lds_con_smt_print.Modify("c_fecha_t.visible='1'")

	lds_con_smt_print.Modify("nom_instalacion_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_fecha_ini_max_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_fecha_fin_max_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_duracion_min_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_facturado_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_pot_instalada_t.y='" + ls_y + "'")
	
	lds_con_smt_print.Modify("c_ind_no_interrupcion_real_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_ind_no_interrupcion_real.y='" + ls_y_imagen + "'")
	
	lds_con_smt_print.Modify("c_ind_industrial_real_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_ind_industrial_real.y='" + ls_y_imagen + "'")
	
	lds_con_smt_print.Modify("c_ind_no_operador_real_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_ind_no_operador_real.y='" + ls_y_imagen + "'")
	
	lds_con_smt_print.Modify("c_ind_evento_especial_real_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_ind_evento_especial_real.y='" + ls_y_imagen + "'")
	
	lds_con_smt_print.Modify("c_ind_cliente_imp_real_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_ind_cliente_imp_real.y='" + ls_y_imagen + "'")
	
	lds_con_smt_print.Modify("c_ind_descargo_t.y='" + ls_y + "'")
	lds_con_smt_print.Modify("c_ind_descargo.y='" + ls_y_imagen + "'")
End If

For ll_i = 1 To ll_row
	 If dw_salmt.GetItemNumber(ll_i, "c_clicked") = 1 Then
		 ll_nro_inst_afectada = dw_salmt.GetItemNumber(ll_i, "nro_instalacion")

		 If Not ib_multiples Then
			 //AHM 18/02/2010 Certificacion windows XP
			 //gu_operaciones.of_maniobrar_linea(ll_nro_inst_afectada)
			 gu_operacionSgi.of_maniobrar_linea(ll_nro_inst_afectada)
			 
			 IF li_respuesta = 1 THEN
				 ib_crea_inc = True
			 ELSE
				 ib_crea_inc = false
			 END IF
		 Else
			 dw_salmt.RowsCopy(ll_i, ll_i, Primary!, lds_con_smt_print, 1, Primary!)
		 End If
	 End If
Next

If ib_multiples Then
	lds_con_smt_print.SetSort("nom_instalacion A")
	lds_con_smt_print.Sort()
	lds_con_smt_print.Print()
End If

Destroy lds_con_smt_print
end subroutine

public function long fw_act_ult_ot ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_act_ult_ot
// 
// Objetivo: Incrementa en uno el nro de la ultima ot que se dio de alta
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: --
//              Salida:  long
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 11/09/2000    JPE                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_ot

select cod_ot.nextval into :ll_nro_ot from dual;
 
Return ll_nro_ot
end function

public subroutine fw_crea_estado_oper (readonly long al_nro_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_crea_estado_oper
// 
// Objetivo: Crea los tres primeros estados de la incidencia (PT, EB, CL)
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: long al_nro_incidencia
//
//              Salida:  --
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 11/09/2000    JPE           Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Long ll_i
DateTime ldt_fecha, ld_fecha_seg




ldt_fecha = DateTime(Today(), Time(String(Today(), "hh:mm")))
ld_fecha_seg = gu_comunic1.is_comunic.datval1


For ll_i = 1 To 3
// 	 If ll_i = 1 Then
//		 ld_fecha_seg = ldt_fecha
//	 Else
//		 ld_fecha_seg = gu_comunic1.is_comunic.datval1
//	 End If
	 
	 INSERT INTO "SGD_ESTADO_OPER"  
          ( "COD_ESTADO",   
           "USUARIO",   
           "F_ACTUAL",   
           "H_ACTUAL",   
           "PROGRAMA",   
           "OBSERVACION",   
           "F_ALTA",   
           "H_ALTA",   
           "NRO_INCIDENCIA",   
           "IND_ENV_MANT" )  
   VALUES ( :ll_i,   
           :gs_usuario,   
           :ldt_fecha,   
           :ldt_fecha,   
           'w_co_salmt_ind',   
           'DEFICIT',   
           :ld_fecha_seg,   
           :ld_fecha_seg,   
           :al_nro_incidencia,   
           0 )  ;
Next
end subroutine

public function long fw_crea_brigada_ot (readonly long al_row, readonly long al_nro_incidencia, readonly long al_nro_inst_afec, readonly long al_nro_centro, readonly long al_nro_cmd, readonly long al_nro_puesto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_crea_brigada_ot
// 
// Objetivo: Crea las ordenes de trabajo para cada salida de MT que se interrumpir$$HEX1$$e100$$ENDHEX$$
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: long al_row
//								 long al_nro_incidencia
//								 long al_nro_inst_afec
//								 long al_nro_centro
//								 long al_nro_cmd
//								 long al_nro_puesto
//
//              Salida:  long
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 11/09/2000    JPE           Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

gu_comunic1.is_comunic.programa_llamante = "w_co_salmt_ind"
  
gu_comunic1.is_comunic.longval1 = al_nro_incidencia

gu_comunic1.is_comunic.accion_llamada = "Alta"
gu_comunic1.is_comunic.decval1 = al_nro_inst_afec 		
gu_comunic1.is_comunic.intval3 = al_nro_centro
gu_comunic1.is_comunic.intval4 = al_nro_cmd
gu_comunic1.is_comunic.intval5 = al_nro_puesto
gu_comunic1.is_comunic.intval6 = 1


Open(w_6201_asignacion_de_brigada)


Return gu_comunic1.is_comunic.longval2
end function

public subroutine fw_recuperar ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_recuperar
// 
// Objetivo: Recupera las salidas de MT
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: --
//              Salida:  --
//                                              
//
//  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------    -----------   ----------------------------------------
// 22/09/2000    JPE                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Long ll_i, ll_row, ll_find, ll_row_find, ll_nro_instalacion, ll_nro_descargo, ll_i_int_a, ll_row_int_a, ll_arr_nro_inst
DateTime ldt_fecha_ini, ldt_fecha_fin
Date	ldt_fecha
String ls_filter
Long ll_nro_centro, ll_nro_cmd, ll_nro_mesa
DataWindowChild ldwc_centro, ldwc_cmd, ldwc_mesa




dw_ambito.GetChild("nro_centro", ldwc_centro)
ll_nro_centro = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_centro")

dw_ambito.GetChild("nro_cmd", ldwc_cmd)
ll_nro_cmd = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_cmd")

dw_ambito.GetChild("nro_mesa", ldwc_mesa)
ll_nro_mesa = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_mesa")



If IsNull(ll_nro_centro) Or ll_nro_centro < 0 Then ll_nro_centro = 0
If IsNull(ll_nro_cmd) Or ll_nro_cmd < 0 Then ll_nro_cmd = 0
If IsNull(ll_nro_mesa) Or ll_nro_mesa < 0 Then ll_nro_mesa = 0	



dw_salmt.SetReDraw(False)


ll_row_find  = dw_salmt.Retrieve(fgci_tipo_salida_mt)


ll_row_int_a = dw_int_abiertas.Retrieve(fgci_tipo_salida_mt, ll_nro_centro, ll_nro_cmd, ll_nro_mesa)
ls_filter	 = ""


If ll_row_int_a > 0 Then
	For ll_i_int_a = 1 To ll_row_int_a
		 ll_arr_nro_inst = dw_int_abiertas.GetItemNumber(ll_i_int_a, "nro_instalacion")

	 	 ll_find = dw_salmt.Find("nro_instalacion = " + String(ll_arr_nro_inst), 1, ll_row_find)

		 If ll_find > 0 Then dw_salmt.SetItem(ll_find, "c_filter", 1)
	Next

	dw_salmt.AcceptText()
	dw_salmt.SetFilter("c_filter = 0")
	dw_salmt.Filter()
End If



//********************************************
//**  Interrupciones abiertas conectividad  **
//********************************************
ll_row_int_a = dw_int_abiertas_conectividad.Retrieve(fgci_tipo_salida_mt)


If ll_row_int_a > 0 Then
	For ll_i_int_a = 1 To ll_row_int_a
		 ll_arr_nro_inst = dw_int_abiertas_conectividad.GetItemNumber(ll_i_int_a, "nro_instalacion")

	 	 ll_find = dw_salmt.Find("nro_instalacion = " + String(ll_arr_nro_inst), 1, ll_row_find)

		 If ll_find > 0 Then dw_salmt.SetItem(ll_find, "c_filter", 1)
	Next

	dw_salmt.AcceptText()
	dw_salmt.SetFilter("c_filter = 0")
	dw_salmt.Filter()
End If
//********************************************
//**  Interrupciones abiertas conectividad  **
//********************************************



ldt_fecha = Today()
ldt_fecha_ini = DateTime(ldt_fecha, Now())
ldt_fecha_fin = DateTime(ldt_fecha, Time("23:59"))


If dw_salmt.RowCount() <= 0 Then MessageBox("Aviso", "No existen Salidas de Media Tensi$$HEX1$$f300$$ENDHEX$$n para el criterio seleccionado.")

ll_row = dw_decargos.Retrieve(ldt_fecha_ini)


For ll_i = 1 To ll_row
	 ll_nro_instalacion = dw_decargos.GetItemNumber(ll_i, "nro_instalacion")
	 ll_nro_descargo = dw_decargos.GetItemNumber(ll_i, "nro_descargo")
	 ll_find = dw_salmt.Find("nro_instalacion = " + String(ll_nro_instalacion), 1, ll_row_find)
	 
	 If ll_find > 0 Then
		 dw_salmt.SetItem(ll_find, "c_ind_descargo", 1)
		 dw_salmt.SetItem(ll_find, "c_nro_descargo", ll_nro_descargo)
	 Else
		 ll_nro_instalacion = dw_decargos.GetItemNumber(ll_i, "nro_inst_origen")
		 ll_find = dw_salmt.Find("nro_instalacion = " + String(ll_nro_instalacion), 1, ll_row_find)
		
		 If ll_find > 0 Then
			 dw_salmt.SetItem(ll_find, "c_ind_descargo", 1)
			 dw_salmt.SetItem(ll_find, "c_nro_descargo", ll_nro_descargo)
		 End If
	 End If
Next



For ii_nivel_retrieve = 1 To 3
	ll_row = dw_invisible.Retrieve(fgci_tipo_salida_mt, fgci_incidencia_resuelta)

	For ll_i = 1 To ll_row
		ll_row_find = dw_salmt.RowCount()
		ll_nro_instalacion = dw_invisible.GetItemNumber(ll_i, "nro_instalacion")
		ll_find = dw_salmt.Find("nro_instalacion = " + String(ll_nro_instalacion), 1, ll_row_find)
		

		If ll_find > 0 Then
//			If ldt_fecha_ini < dw_invisible.GetItemDateTime(ll_i, "c_fecha_ini_max") Then
//				dw_salmt.SetItem(ll_find, "c_fecha_ini_max", dw_invisible.GetItemDateTime(ll_i, "c_fecha_ini_max"))
//			End If
			ldt_fecha_ini = dw_salmt.GetItemDateTime(ll_find, "c_fecha_ini_max")
			ldt_fecha_fin = dw_salmt.GetItemDateTime(ll_find, "c_fecha_fin_max")


//			If ll_nro_instalacion = 10200518 Or ll_nro_instalacion = 10200518 Or ll_nro_instalacion = 10200518 Then
//				MessageBox(String(ll_nro_instalacion), ll_find)
//				MessageBox("fecha", String(dw_invisible.GetItemDateTime(ll_i, "c_fecha_fin_max")))
//				MessageBox("ldt_fecha_fin", String(ldt_fecha_fin))
//				
//				If Not IsDate(String(ldt_fecha_fin)) Then MessageBox("", "ISDATE")
//			End If


			If ( ldt_fecha_fin < dw_invisible.GetItemDateTime(ll_i, "c_fecha_fin_max") ) Or &
				( String(ldt_fecha_fin, "YYYYMMDD") = "19000101" ) /*(Not IsDate(String(ldt_fecha_fin)))*/ Then
				dw_salmt.SetItem(ll_find, "c_fecha_ini_max", dw_invisible.GetItemDateTime(ll_i, "c_fecha_ini_max"))
				dw_salmt.SetItem(ll_find, "c_fecha_fin_max", dw_invisible.GetItemDateTime(ll_i, "c_fecha_fin_max"))

				dw_salmt.SetItem(ll_find, "c_fecha_ini_max_real", dw_invisible.GetItemDateTime(ll_i, "c_fecha_ini_max"))
				dw_salmt.SetItem(ll_find, "c_fecha_fin_max_real", dw_invisible.GetItemDateTime(ll_i, "c_fecha_fin_max"))

				dw_salmt.SetItem(ll_find, "c_duracion_sr", dw_invisible.GetItemString(ll_i, "c_duracion_sr"))
			End If
		End If
	Next
Next

dw_salmt.AcceptText()

dw_salmt.SetSort("c_fecha_fin_max_real A")
dw_salmt.Sort()

dw_salmt.SelectRow(0, False)

If dw_salmt.RowCount() > 0 Then fw_clicked(dw_salmt, 1)


dw_salmt.SetReDraw(True)
end subroutine

on w_co_salmt_ind.create
this.dw_int_abiertas_conectividad=create dw_int_abiertas_conectividad
this.dw_inserta_salmt_nuevas=create dw_inserta_salmt_nuevas
this.dw_invisible=create dw_invisible
this.dw_int_abiertas=create dw_int_abiertas
this.st_crea_inc=create st_crea_inc
this.st_buscar=create st_buscar
this.em_potencia=create em_potencia
this.st_potencia=create st_potencia
this.pb_incidencia=create pb_incidencia
this.pb_recuperar=create pb_recuperar
this.dw_ambito=create dw_ambito
this.sle_buscar_inst=create sle_buscar_inst
this.st_buscar_inst=create st_buscar_inst
this.dw_decargos=create dw_decargos
this.dw_salmt=create dw_salmt
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.dw_int_abiertas_conectividad,&
this.dw_inserta_salmt_nuevas,&
this.dw_invisible,&
this.dw_int_abiertas,&
this.st_crea_inc,&
this.st_buscar,&
this.em_potencia,&
this.st_potencia,&
this.pb_incidencia,&
this.pb_recuperar,&
this.dw_ambito,&
this.sle_buscar_inst,&
this.st_buscar_inst,&
this.dw_decargos,&
this.dw_salmt,&
this.gb_2,&
this.gb_1}
end on

on w_co_salmt_ind.destroy
destroy(this.dw_int_abiertas_conectividad)
destroy(this.dw_inserta_salmt_nuevas)
destroy(this.dw_invisible)
destroy(this.dw_int_abiertas)
destroy(this.st_crea_inc)
destroy(this.st_buscar)
destroy(this.em_potencia)
destroy(this.st_potencia)
destroy(this.pb_incidencia)
destroy(this.pb_recuperar)
destroy(this.dw_ambito)
destroy(this.sle_buscar_inst)
destroy(this.st_buscar_inst)
destroy(this.dw_decargos)
destroy(this.dw_salmt)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;//If gi_usuario_perfil[1] = fgci_perfil_oper_encargado_turno Or &
//	gi_usuario_perfil[1] = fgci_perfil_oper_alta_media Then
//	pb_incidencia.Enabled = True
//End If


If gu_perfiles.of_acceso_perfil(gi_perfil,'CON_SMT','ACC_MANTEN') = 1 Then
	pb_incidencia.Enabled = True
End If

IF NOT gb_operaciones THEN
	pb_incidencia.enabled = false
ELSE
	pb_incidencia.enabled = true
END IF


dw_ambito.fpr_crea_dddw()
dw_ambito.insertrow(0)   
//dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
//dw_ambito.accepttext()
dw_ambito.fnu_insertar_datos(gi_nro_centro, &
								  gi_nro_cmd, &
								  gi_nro_puesto, 0)


dw_salmt.SelectRow(0, False)

end event

event resize;dw_salmt.Width = This.Width - 130
dw_salmt.Height = This.Height - 575

gb_1.Width = dw_salmt.Width + 27
gb_1.Height = dw_salmt.Height + 50
end event

type dw_int_abiertas_conectividad from datawindow within w_co_salmt_ind
boolean visible = false
integer x = 2565
integer y = 1556
integer width = 398
integer height = 128
integer taborder = 40
string dataobject = "dw_co_salmt_int_abierta_conect"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;Long ll_nro_centro, ll_nro_cmd, ll_nro_mesa
String ls_where
DataWindowChild ldwc_centro, ldwc_cmd, ldwc_mesa




dw_ambito.GetChild("nro_centro", ldwc_centro)
ll_nro_centro = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_centro")

dw_ambito.GetChild("nro_cmd", ldwc_cmd)
ll_nro_cmd = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_cmd")

dw_ambito.GetChild("nro_mesa", ldwc_mesa)
ll_nro_mesa = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_mesa")



If ll_nro_centro > 0 Then
	ls_where = " And sgd_instalacion.nro_centro = " + String(ll_nro_centro)
End If

If ll_nro_cmd > 0 Then
	If Len(ls_where) > 0 Then
		ls_where += " And sgd_instalacion.nro_cmd = " + String(ll_nro_cmd)
	Else
		ls_where = " sgd_instalacion.nro_cmd = " + String(ll_nro_cmd)
	End If
End If

If ll_nro_mesa > 0 Then
	If Len(ls_where) > 0 Then
		ls_where += " And sgd_instalacion.nro_mesa = " + String(ll_nro_mesa)
	Else
		ls_where = " sgd_instalacion.nro_mesa = " + String(ll_nro_mesa)
	End If
End If


If Len(ls_where) > 0 Then sqlsyntax += ls_where


This.SetSQLPreview(sqlsyntax)
end event

type dw_inserta_salmt_nuevas from datawindow within w_co_salmt_ind
boolean visible = false
integer x = 3013
integer y = 1704
integer width = 398
integer height = 128
integer taborder = 50
string dataobject = "dw_co_salmt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;If IsNull(is_where_salmt_nuevas) Then is_where_salmt_nuevas = ""

If Len(is_where_salmt_nuevas) > 0 Then sqlsyntax += is_where_salmt_nuevas

This.SetSQLPreview(sqlsyntax)
end event

type dw_invisible from datawindow within w_co_salmt_ind
boolean visible = false
integer x = 46
integer y = 416
integer width = 1531
integer height = 1452
integer taborder = 30
string dataobject = "dw_co_salmt_int_inv"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event sqlpreview;String ls_syntax



ls_syntax = sqlsyntax


CHOOSE CASE ii_nivel_retrieve
	CASE 1
		fg_replace_text(ls_syntax, 'GI_HIST_INCIDENCIAS' , 'SGD_INCIDENCIA')
		fg_replace_text(ls_syntax, 'GI_HIST_INTERRUPCION' , 'SGD_INTERRUPCION')
	CASE 2
		fg_replace_text(ls_syntax, 'GI_HIST_INCIDENCIAS' , 'SGD_INCIDENCIA')
		fg_replace_text(ls_syntax, 'GI_HIST_INTERRUPCION' , 'SGD_INTERRUPCION_RS')
END CHOOSE

sqlsyntax = ls_syntax

This.SetSqlPreview(sqlsyntax)
end event

type dw_int_abiertas from datawindow within w_co_salmt_ind
boolean visible = false
integer x = 2565
integer y = 1704
integer width = 398
integer height = 128
integer taborder = 20
string dataobject = "dw_co_salmt_int_abierta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;//Long ll_nro_centro, ll_nro_cmd, ll_nro_mesa
//String ls_where
//DataWindowChild ldwc_centro, ldwc_cmd, ldwc_mesa
//
//
//
//
//dw_ambito.GetChild("nro_centro", ldwc_centro)
//ll_nro_centro = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_centro")
//
//dw_ambito.GetChild("nro_cmd", ldwc_cmd)
//ll_nro_cmd = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_cmd")
//
//dw_ambito.GetChild("nro_mesa", ldwc_mesa)
//ll_nro_mesa = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_mesa")
//
//
//
//If ll_nro_centro > 0 Then
//	ls_where = " And sgd_instalacion.nro_centro = " + String(ll_nro_centro)
//End If
//
//If ll_nro_cmd > 0 Then
//	If Len(ls_where) > 0 Then
//		ls_where += " And sgd_instalacion.nro_cmd = " + String(ll_nro_cmd)
//	Else
//		ls_where = " sgd_instalacion.nro_cmd = " + String(ll_nro_cmd)
//	End If
//End If
//
//If ll_nro_mesa > 0 Then
//	If Len(ls_where) > 0 Then
//		ls_where += " And sgd_instalacion.nro_mesa = " + String(ll_nro_mesa)
//	Else
//		ls_where = " sgd_instalacion.nro_mesa = " + String(ll_nro_mesa)
//	End If
//End If
//
//
//If Len(ls_where) > 0 Then sqlsyntax += ls_where
//
//
//This.SetSQLPreview(sqlsyntax)
end event

type st_crea_inc from statictext within w_co_salmt_ind
integer x = 1266
integer y = 236
integer width = 526
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Crear Incidencia(s)"
boolean focusrectangle = false
end type

type st_buscar from statictext within w_co_salmt_ind
integer x = 1271
integer y = 112
integer width = 370
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Buscar"
boolean focusrectangle = false
end type

type em_potencia from editmask within w_co_salmt_ind
integer x = 2542
integer y = 108
integer width = 603
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###,###.0"
end type

type st_potencia from statictext within w_co_salmt_ind
integer x = 1874
integer y = 116
integer width = 667
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Total de Potencia (KVA)"
boolean focusrectangle = false
end type

type pb_incidencia from picturebutton within w_co_salmt_ind
integer x = 1111
integer y = 212
integer width = 142
integer height = 124
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "Mano.cur"
boolean enabled = false
string picturename = "incid.bmp"
string disabledname = "incid_enabled.bmp"
end type

event clicked;////////////////////////////////////////////////////////////
//
// Evento:		clicked
// 
// Objetivo:	Crea incidencias para las salidas de MT selecionadas.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////
Long ll_next_smt_selected
Integer li_respuesta_lista



ib_crea_inc = False
ib_multiples = False

ll_next_smt_selected = dw_salmt.GetSelectedRow(0)

If ll_next_smt_selected < 1 Then
	MessageBox("Aviso", "Debe seleccionar una Salida de MT.")
	Return
End If


If dw_salmt.GetSelectedRow(ll_next_smt_selected) > ll_next_smt_selected Then
	li_respuesta_lista = MessageBox("Aviso", "No se pueden crear incidencias multiples.  Para localizar incidencias " + &
														  "en Operaciones, se debe seleccionar una a una las Salidas de Media Tensi$$HEX1$$f300$$ENDHEX$$n.  " + &
														  "Se imprimir$$HEX2$$e1002000$$ENDHEX$$una lista con las Salidas de Media Tensi$$HEX1$$f300$$ENDHEX$$n que ha seleccionado.", Information!, YesNo!, 1)

	If li_respuesta_lista <> 1 Then Return

	ib_multiples = True
End If


fw_incidencia()


If Not ib_multiples Then
	If ib_crea_inc Then
		MessageBox("Aviso", "Fin de la creaci$$HEX1$$f300$$ENDHEX$$n de la incidencia.")
//		pb_recuperar.TriggerEvent(Clicked!)
	End If
End If
end event

type pb_recuperar from picturebutton within w_co_salmt_ind
integer x = 1111
integer y = 88
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Mano.cur"
boolean originalsize = true
string picturename = "lupa3.bmp"
alignment htextalign = left!
end type

event clicked;////////////////////////////////////////////////////////////
//
// Evento:		clicked
// 
// Objetivo:	
//					Ejecuta el evento open de la ventana.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

dw_decargos.DataObject = "dw_co_salmt_descargo"
dw_salmt.DataObject = "dw_co_salmt_ind"
dw_int_abiertas.DataObject = "dw_co_salmt_int_abierta"
dw_int_abiertas_conectividad.DataObject = "dw_co_salmt_int_abierta_conect"


dw_decargos.SetTransObject(SQLCA)
dw_salmt.SetTransObject(SQLCA)
dw_int_abiertas.SetTransObject(SQLCA)
dw_invisible.SetTransObject(SQLCA)
dw_int_abiertas_conectividad.SetTransObject(SQLCA)

fw_recuperar()
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_co_salmt_ind
integer x = 27
integer width = 997
integer taborder = 100
boolean border = false
end type

type sle_buscar_inst from singlelineedit within w_co_salmt_ind
event ue_char pbm_char
event ue_post_char pbm_custom01
integer x = 2405
integer y = 216
integer width = 1070
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_char;////////////////////////////////////////////////////////////
//
// Evento:		ue_char
// 
// Objetivo:	
//					Ejecuta el evento ue_post_char de la ventana.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

PostEvent ("ue_post_char")
end event

event ue_post_char;////////////////////////////////////////////////////////////
//
// Evento:		ue_post_char
// 
// Objetivo:	
//					Busca una instalacion seg$$HEX1$$fa00$$ENDHEX$$n la cadena de caracteres
//					que se encuentre en ella.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////
Long ll_find



ib_char = True

If Len(This.Text) > 0 Then
	ll_find = dw_salmt.Find("UPPER(nom_instalacion) like '" + This.Text + "%'", 1, dw_salmt.RowCount())

	If ll_find > 0 Then
		dw_salmt.ScrollToRow(ll_find)
		fw_clicked(dw_salmt, ll_find)
	End If
End If

ib_char = False
end event

type st_buscar_inst from statictext within w_co_salmt_ind
integer x = 1874
integer y = 228
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Buscar Instalaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type dw_decargos from datawindow within w_co_salmt_ind
boolean visible = false
integer x = 2117
integer y = 1704
integer width = 398
integer height = 128
integer taborder = 60
string dataobject = "dw_co_salmt_descargo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_salmt from datawindow within w_co_salmt_ind
integer x = 46
integer y = 416
integer width = 3451
integer height = 1452
integer taborder = 10
string dataobject = "dw_co_salmt_ind"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String  ls_objeto, ls_sort, ls_column
Integer li_pos



fw_clicked(This, row)


If row < 1 Then	
	ls_objeto = This.GetObjectAtPointer()
	li_pos 	 = Pos(ls_objeto, "~t")
	ls_column = Left(ls_objeto, li_pos - 3)
	
	If Mid(ls_objeto, li_pos - 2, 2) = "_t" Then
		ls_sort = Right(This.Describe("DataWindow.Table.Sort"), 1)

		If ls_sort = "A" Then
			This.SetSort(ls_column + " D")
		Else
			This.SetSort(ls_column + " A")		
		End If
		This.Sort()
	End If

	This.SelectRow(0, False)

	em_potencia.Text = "0"
	
	Return
End If
end event

event rowfocuschanged;If KeyDown(KeyShift!) Then
	If KeyDown(KeyDownArrow!) Then
		il_row_click = currentrow
		
		If dw_salmt.IsSelected(currentrow) Then
			dw_salmt.SelectRow(currentrow - 1, False)
		Else
			dw_salmt.SelectRow(currentrow, True)
		End If
	End If

	If KeyDown(KeyUpArrow!) Then
		il_row_click = currentrow
		
		If dw_salmt.IsSelected(currentrow) Then
			dw_salmt.SelectRow(currentrow + 1, False)
		Else
			dw_salmt.SelectRow(currentrow, True)
		End If
	End If
ElseIf KeyDown(KeyControl!) Then
	dw_salmt.ScrollToRow(currentrow)
Else
   dw_salmt.SelectRow(0, False)
   dw_salmt.SelectRow(currentrow, True)
End If

fw_clicked_suma()

end event

event doubleclicked;String ls_columna
s_mensaje_salmt ls_mensaje_salmt



ls_columna = String(dwo.name)

If ls_columna = "c_no_int" Or &
	ls_columna = "c_indus" Or &
	ls_columna = "c_eve_esp" Or &
	ls_columna = "c_cli_imp" Then

	CHOOSE CASE ls_columna
		CASE "c_no_int"
			ls_mensaje_salmt.opcion = 1
			ls_mensaje_salmt.mensaje = dw_salmt.GetItemString(row, "desc_no_interrupcion")
			ls_mensaje_salmt.titulo = "Descripci$$HEX1$$f300$$ENDHEX$$n de Indicativo no Interrumpibles"
		CASE "c_indus"
			ls_mensaje_salmt.opcion = 2
			ls_mensaje_salmt.mensaje = dw_salmt.GetItemString(row, "desc_industrial")
			ls_mensaje_salmt.titulo = "Descripci$$HEX1$$f300$$ENDHEX$$n de Indicativo Industrial"
		CASE "c_eve_esp"
			ls_mensaje_salmt.opcion = 3
			ls_mensaje_salmt.mensaje = dw_salmt.GetItemString(row, "desc_evento_especial")
			ls_mensaje_salmt.titulo = "Descripci$$HEX1$$f300$$ENDHEX$$n de Indicativo Evento Especial"
		CASE "c_cli_imp"
			ls_mensaje_salmt.opcion = 4
			ls_mensaje_salmt.mensaje = dw_salmt.GetItemString(row, "desc_cliente_imp")
			ls_mensaje_salmt.titulo = "Descripci$$HEX1$$f300$$ENDHEX$$n de Indicativo Cliente Importante"

	END CHOOSE

	ls_mensaje_salmt.imagen = dw_salmt.Describe(ls_columna + ".Filename")
	ls_mensaje_salmt.nro_instalacion = dw_salmt.GetItemNumber(row, "nro_instalacion")
	
	OpenWithParm(w_co_mensaje, ls_mensaje_salmt)
End If


If ls_columna = "c_sin_oper" Or ls_columna = "c_desc_prog" Then
	CHOOSE CASE ls_columna
		CASE "c_sin_oper"
			ls_mensaje_salmt.opcion = 3

		CASE "c_desc_prog"
			ls_mensaje_salmt.opcion = 6
			double_click = true
//			gu_comunic.is_comunic.accion_llamada = "modificacion" // Accion a ejecutar
			gu_comunic.is_comunic.longval1 = dw_salmt.getitemnumber(row,"c_nro_descargo") // Variable que tiene el valor a recuperar
			gu_comunic.is_comunic.decval1 = dw_salmt.getitemnumber(row,"nro_instalacion") // Variable que tiene el valor a recuperar
//			gu_comunic.is_comunic.strval5 = dw_salmt.getitemstring(row,"sgd_instalacion_nom_instalacion") // Variable que tiene el valor a recuperar
			gu_comunic.is_comunic.strval6 = "lista_descargos"

			if gnu_u_transaction.uf_lock(this,"SGD_DESCARGOS",&
				"NRO_DESCARGO = " + &
				string(gu_comunic.is_comunic.longval1)) = 100 then
				double_click = false
				return
			end if

			timer(0,w_7101_consulta_descargos)
			open (w_7102_mantenimiento_descargos)
			gu_comunic.is_comunic.strval6 = ""
			double_click = false
			gnu_u_transaction.uf_commit(this)

	END CHOOSE
End If
end event

event sqlpreview;Long ll_nro_centro, ll_nro_cmd, ll_nro_mesa
String ls_where
DataWindowChild ldwc_centro, ldwc_cmd, ldwc_mesa




dw_ambito.GetChild("nro_centro", ldwc_centro)
ll_nro_centro = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_centro")

dw_ambito.GetChild("nro_cmd", ldwc_cmd)
ll_nro_cmd = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_cmd")

dw_ambito.GetChild("nro_mesa", ldwc_mesa)
ll_nro_mesa = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_mesa")



If ll_nro_centro > 0 Then
	ls_where = " And nro_centro = " + String(ll_nro_centro)
End If

If ll_nro_cmd > 0 Then
	If Len(ls_where) > 0 Then
		ls_where += " And nro_cmd = " + String(ll_nro_cmd)
	Else
		ls_where = " nro_cmd = " + String(ll_nro_cmd)
	End If
End If

If ll_nro_mesa > 0 Then
	If Len(ls_where) > 0 Then
		ls_where += " And nro_mesa = " + String(ll_nro_mesa)
	Else
		ls_where = " nro_mesa = " + String(ll_nro_mesa)
	End If
End If


If Len(ls_where) > 0 Then sqlsyntax += ls_where

is_where_salmt_nuevas = ls_where

This.SetSQLPreview(sqlsyntax)
end event

type gb_2 from groupbox within w_co_salmt_ind
integer x = 1038
integer y = 4
integer width = 2473
integer height = 368
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = " Opciones "
end type

type gb_1 from groupbox within w_co_salmt_ind
integer x = 32
integer y = 380
integer width = 3479
integer height = 1500
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type


HA$PBExportHeader$w_4001_estadisticas_zonas_geografica.srw
forward
global type w_4001_estadisticas_zonas_geografica from w_sgigenerica
end type
type pb_avanzar from picturebutton within w_4001_estadisticas_zonas_geografica
end type
type sle_fil_selec from singlelineedit within w_4001_estadisticas_zonas_geografica
end type
type st_fil_selec from statictext within w_4001_estadisticas_zonas_geografica
end type
type pb_graficar from picturebutton within w_4001_estadisticas_zonas_geografica
end type
type pb_retroceder from picturebutton within w_4001_estadisticas_zonas_geografica
end type
type pb_sectores from picturebutton within w_4001_estadisticas_zonas_geografica
end type
type gb_sumas from groupbox within w_4001_estadisticas_zonas_geografica
end type
type rb_sum_totales from radiobutton within w_4001_estadisticas_zonas_geografica
end type
type rb_sum_parciales from radiobutton within w_4001_estadisticas_zonas_geografica
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4001_estadisticas_zonas_geografica
end type
type dw_criterio_seleccion from u_bdg_2001_pr_filtro_estadis_zona_geogr within w_4001_estadisticas_zonas_geografica
end type
type st_1 from statictext within w_4001_estadisticas_zonas_geografica
end type
type dw_datos_zona_geo from u_bdg_2002_pr_est_zona_geo1 within w_4001_estadisticas_zonas_geografica
end type
type gr_grafica from graph within w_4001_estadisticas_zonas_geografica
end type
type gr_sectores from graph within w_4001_estadisticas_zonas_geografica
end type
type dw_impresion from datawindow within w_4001_estadisticas_zonas_geografica
end type
type st_valor_actual from statictext within w_4001_estadisticas_zonas_geografica
end type
type cb_1 from commandbutton within w_4001_estadisticas_zonas_geografica
end type
type st_2 from statictext within w_4001_estadisticas_zonas_geografica
end type
end forward

global type w_4001_estadisticas_zonas_geografica from w_sgigenerica
integer width = 3657
integer height = 1908
boolean minbox = false
string icon = "MARCE3.ico"
event ue_obtener_datos pbm_custom70
event ue_actualizar pbm_custom71
event ue_a_porcentajes pbm_custom22
event ue_resetear_datos pbm_custom60
event ue_historicos pbm_custom61
event ue_imprimir pbm_custom62
event ue_botones pbm_custom09
event zonacmdvisible pbm_custom11
event ue_tiepi ( )
event ue_tiebt ( )
event ue_saifi ( )
event ue_saidi ( )
event ue_caidi ( )
event ue_asai ( )
event ue_incidencia_cliente ( )
event ue_potencia_afectada ( )
pb_avanzar pb_avanzar
sle_fil_selec sle_fil_selec
st_fil_selec st_fil_selec
pb_graficar pb_graficar
pb_retroceder pb_retroceder
pb_sectores pb_sectores
gb_sumas gb_sumas
rb_sum_totales rb_sum_totales
rb_sum_parciales rb_sum_parciales
dw_ambito dw_ambito
dw_criterio_seleccion dw_criterio_seleccion
st_1 st_1
dw_datos_zona_geo dw_datos_zona_geo
gr_grafica gr_grafica
gr_sectores gr_sectores
dw_impresion dw_impresion
st_valor_actual st_valor_actual
cb_1 cb_1
st_2 st_2
end type
global w_4001_estadisticas_zonas_geografica w_4001_estadisticas_zonas_geografica

type variables
// Men$$HEX2$$fa002000$$ENDHEX$$de la ventana
m_estadistica_zona_geografica im_estadistica

int ii_fila_clicked
int ii_column_clicked
int ii_ind_vec
int ii_ind_vec2
int ii_width_dw = 2999
// Vector con las columnas seleccionadas
integer	iivec_col_selec[]

// Vector de filas seleccionadas
integer	iivec_fil_selec[]

u_gen_nu_gra_0001 iu_gen_gra

// Indicador de zona o Cmd
int ii_zona_cmd

string is_donde

// Objeto de nucleo de la datawindow
u_bdg_2002_nu_est_zona_geo1 iu_bdg_2002_nu

// Ver las sumas totales
int ii_totales

// Si se desean los acumulados
int ii_acumulado

// Si estoy viendo cantidades o porcentajes
int ii_unidades

// Bandera para el control del itemchange
int ii_itemchange=0

// Objeto de comunicaciones
u_generico_comunicaciones iu_gen_comunic

// Nivel en que se encuentra el listado
int ii_nivel

// Indicadores de estado
int ii_historicos
Long ii_clientes_potencia
int ii_calidad  // 1 = tiepi, 2 = tiebt, 3 = SAIFI, 4 = SAIDI, 
	     // 5 = CAIDI, 6 = ASAI

// Nombre de tabla bdg que utiliza la ventana.

// Variable que indica que se esta desplegando 
// True = lista , False = Grafica
 boolean ib_lista

string is_tabla_bdg
// definicion de constantes utilizadas por la ventana

//int fgci_todos

s_print str_print

int ii_tipo_graf

int ii_num_col_marca
boolean ib_habilitado=false
datawindow idw_impresion
boolean ib_primera_vez = true

int ii_tiepi_tiebt = 1  //**  OSGI 2001.1  	20/07/2001
end variables

forward prototypes
public function integer fw_graficar ()
public function integer fw_desmarcar_col (integer pi_nro_col)
public function integer fw_marcar_col (integer pi_nro_col)
public function integer fw_inicializo_vector ()
public function boolean fw_ninguna_marcada ()
public function integer fw_inicializo_vector2 ()
public function integer fw_obtener_numero_columna (string ps_nombre)
public subroutine fw_des_column_selec ()
public subroutine fw_seleccionar_todo ()
public function integer fw_validar_periodo ()
public subroutine fw_fondo_transparente ()
public subroutine fw_indices_visible_ext (readonly string as_indice)
end prototypes

event ue_obtener_datos;/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  ue_obtener_datos
//
// Objetivo: Establecer argumentos para llamada a funci$$HEX1$$f300$$ENDHEX$$n que realiza <Retrieve> sobre Dw.
//           MATO: Modif. Ajuste barra de <scroll> 
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1996   ALE
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   14/01/1999   MATO (Pruebas Vol.)
//
/////////////////////////////////////////////////////////////////////////

int li_retorno

SetPointer(HourGlass!)

li_retorno = fw_validar_periodo()
IF li_retorno = 1 then 
	gnv_msg.f_mensaje("AB03", "", "", OK!)
	return
END IF
if not ib_primera_vez then this.setredraw(false)
dw_datos_zona_geo.reset()
dw_datos_zona_geo.WIDTH = ( ii_width_dw)
dw_datos_zona_geo.visible = false
dw_datos_zona_geo.visible = true
// Hace el retrieve con el criterio seleccionado
dw_datos_zona_geo.Retrieve()

//// Si no recupera registros, despliega un mensaje
IF dw_datos_zona_geo.RowCount() = 0 THEN
	pb_retroceder.enabled = FALSE
	gnv_msg.f_mensaje("AB02", "", "", OK!)

//Ajuste de la barra <Scroll> Vertical	para no ocupar espacio en Dw.
ELSEIF dw_datos_zona_geo.RowCount() > 10 THEN //and ii_historicos = 0 THEN
   dw_datos_zona_geo.WIDTH = ( ii_width_dw + 75)
	dw_datos_zona_geo.VScrollBar = true
ELSE
	dw_datos_zona_geo.WIDTH =  ii_width_dw
	dw_datos_zona_geo.VScrollBar = false
END IF
CHOOSE CASE ii_calidad
	CASE 1
		This.TriggerEvent("ue_tiepi")
	CASE 2
		This.TriggerEvent("ue_tiebt")
	CASE 3
		This.TriggerEvent("ue_saifi")
	CASE 4
		This.TriggerEvent("ue_saidi")
	CASE 5
		This.TriggerEvent("ue_caidi")
	CASE 6
		This.TriggerEvent("ue_asai")
END CHOOSE

CHOOSE CASE ii_clientes_potencia
	CASE 0
		This.TriggerEvent("ue_potencia_afectada")
	CASE 1
		This.TriggerEvent("ue_incidencia_cliente")
END CHOOSE

if not ib_primera_vez then this.setredraw(true)
ib_primera_vez = false

RETURN

end event

event ue_actualizar;/////////////////////////////////////////////////////////////////////////
//
// Event:	ue_actualizar
//
/////////////////////////////////////////////////////////////////////////
int 		li_ind 
long 		ll_cont
string 	ls_ambito
long 		ll_tip_incidencia	// DSA 03/04/2000	
date ld_periodo
s_bdg lstr_bdg


SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
dw_criterio_seleccion.AcceptText()
dw_ambito.AcceptText()

// Cargo variables auxiliares para pasar como par$$HEX1$$e100$$ENDHEX$$metro
lstr_bdg.gi_centro 		  = dw_ambito.GetItemNumber(1,"nro_centro")
lstr_bdg.gi_cmd 	 		  = dw_ambito.GetItemNumber(1,"nro_cmd")
lstr_bdg.gi_puesto 		  = dw_ambito.GetItemNumber(1,"nro_mesa")
lstr_bdg.gda_periodo 	  = dw_criterio_seleccion.GetItemDate(1,"pa_periodo")
lstr_bdg.gi_tipo_incid 	  = dw_criterio_seleccion.GetItemNumber(1,"pa_tipo_incidencia")
lstr_bdg.gi_tension_afec  = dw_criterio_seleccion.GetItemNumber(1,"pa_tension_afectada")
lstr_bdg.gs_material_aver = dw_criterio_seleccion.GetItemString(1,"pa_material_averiado")
lstr_bdg.gi_int_horario   = dw_criterio_seleccion.GetItemNumber(1,"pa_int_horario")
ld_periodo = dw_criterio_seleccion.GetItemDate(1, "pa_periodo")


dw_datos_zona_geo.Reset()

ll_tip_incidencia = dw_criterio_seleccion.object.pa_tipo_incidencia[1]	// DSA 03/04/2000	

// Si todos tienen "Todos"
IF lstr_bdg.gi_centro = fgci_todos AND lstr_bdg.gi_cmd = fgci_todos AND lstr_bdg.gi_puesto = fgci_todos THEN
	if ii_zona_cmd=1 then
		ls_ambito = 'TODOS'
   else
		ls_ambito = 'TODOSCMD'
	end if
		
// Si existe un centro seleccionado
ELSEIF 	lstr_bdg.gi_centro <> fgci_todos AND lstr_bdg.gi_cmd =  fgci_todos AND lstr_bdg.gi_puesto =  fgci_todos THEN
		ls_ambito = 'CENTRO'
		ii_nivel = 1
		is_donde="ZONA"

// Si existe un cmd seleccionado distinto de "todos"
ELSEIF 	lstr_bdg.gi_cmd <> fgci_todos AND lstr_bdg.gi_puesto =  fgci_todos THEN
			ii_nivel = 1
			ls_ambito = 'CMD'
			is_donde="CMD"
			
// Si existe una mesa seleccionada
ELSEIF lstr_bdg.gi_puesto <> fgci_todos THEN
			ii_nivel = 2
			ls_ambito = 'MESA'
END IF

iu_bdg_2002_nu.fnu_armar_sql(dw_datos_zona_geo, ls_ambito, ii_acumulado, &
									  is_tabla_bdg, ii_historicos, &
									  lstr_bdg.gi_centro, lstr_bdg.gi_cmd, lstr_bdg.gi_puesto, &
									  ll_tip_incidencia, lstr_bdg.gi_tension_afec, lstr_bdg.gs_material_aver, &
									  lstr_bdg.gi_int_horario, ld_periodo)

IF (dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
	 dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
	 dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos) OR ii_historicos = 1 then
			
	pb_retroceder.enabled = FALSE
ELSE
	pb_retroceder.enabled = TRUE
END IF
		

This.TriggerEvent("ue_obtener_datos")

// Inicializo los vectores
This.fw_inicializo_vector()
This.fw_inicializo_vector2()

// Deshabilito BOTONES graficar
pb_graficar.Enabled = False
pb_sectores.Enabled = False


// Cargo el vector con todas las filas tra$$HEX1$$ed00$$ENDHEX$$das
IF ii_totales = 1 THEN
	sle_fil_selec.TextColor=4250
	sle_fil_selec.text = String(dw_datos_zona_geo.RowCount())
	li_ind = 1
	DO WHILE li_ind <= Integer(sle_fil_selec.text)
		iivec_fil_selec[li_ind] = li_ind
		li_ind ++
		ii_ind_vec2 ++
	LOOP
		//---<MATO
		ii_totales = 0 
		rb_sum_totales.Triggerevent("clicked")
		//--->
	ELSE
		sle_fil_selec.TextColor=97920
		sle_fil_selec.text = String(0)
		//---<MATO
		ii_totales = 1 
		rb_sum_parciales.Triggerevent("clicked")
		//--->
	END IF
	
IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
This.TriggerEvent("ue_botones")

dw_datos_zona_geo.AcceptText()
dw_datos_zona_geo.SetRedraw(True)
end event

event ue_a_porcentajes;/////////////////////////////////////////////////////////////////////////
//
// Event:	ue_a_porcentajes
//
/////////////////////////////////////////////////////////////////////////

// Recorro todas las columnas de la DW (visibles e invisibles),
//	y para cada una de ellas tomo su suma como el 100%, y en base
//	a esto calculo el porcentaje que le corresponde a cada fila,
//	para cada una de aquellas.
int li_fila, li_col, li_cant_filas
decimal ld_porc_fil_col 
decimal cant_incidencias_p, tiem_repuesto_p, tiem_cau_loc_p, incidencia_bdg_tiepi_p
decimal ld_cant_incidencias, ld_tiem_env_bri, ld_tiem_repuesto, ld_tiebt_propio
decimal ld_tiebt_aport, ld_tiepi_propio, ld_tiepi_aport, ld_incidencia_cli, ld_pot_afectada
decimal ld_saifi, ld_saidi, ld_caidi, ld_asai
integer li_totales


SetPointer(HourGlass!)

fw_des_column_selec()
fw_inicializo_vector()
//fw_inicializo_vector2()

dw_datos_zona_geo.SetRedraw(false)
li_cant_filas = dw_datos_zona_geo.RowCount()

IF li_cant_filas = 0 THEN
	return
END IF

// Si quiere ver las cantidades, traigo los datos de nuevo
if ii_unidades = 1 then
	this.triggerEvent("ue_actualizar")
	rb_sum_parciales.Enabled = True
	rb_sum_totales.Enabled = True
	dw_datos_zona_geo.Modify("tiem_env_bri_tot.visible='0'")
	dw_datos_zona_geo.Modify("tiem_repuesto_tot.visible='0'")
	dw_datos_zona_geo.Modify("saifi_tot.visible='0'")
	dw_datos_zona_geo.Modify("saidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("caidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("asai_tot.visible='0'")
	dw_datos_zona_geo.Modify("pot_afectada_tot.visible='0'")
	return
end if

CHOOSE CASE ii_calidad
	CASE 3
		dw_datos_zona_geo.Modify("saifi_tot.visible='1'")
	CASE 4
		dw_datos_zona_geo.Modify("saidi_tot.visible='1'")		
	CASE 5
		dw_datos_zona_geo.Modify("caidi_tot.visible='1'")		
	CASE 6
		dw_datos_zona_geo.Modify("asai_tot.visible='1'")
END CHOOSE

dw_datos_zona_geo.Modify("tiem_env_bri_tot.visible='1'")
dw_datos_zona_geo.Modify("tiem_repuesto_tot.visible='1'")
IF ii_clientes_potencia <> 1 THEN
	dw_datos_zona_geo.Modify("pot_afectada_tot.visible='1'")
END IF

rb_sum_parciales.Enabled = False
rb_sum_totales.Enabled = False
rb_sum_totales.TriggerEvent(clicked!)
rb_sum_totales.Checked = True
pb_sectores.enabled = FALSE
pb_graficar.enabled = FALSE
// Indico que desea ver las sumas
for li_fila = 1 to li_cant_filas
	dw_datos_zona_geo.setItem(li_fila,"sumas_promedio",1)
next

// Si estoy en parciales muestro moment$$HEX1$$e100$$ENDHEX$$neamente los totales para calcular
li_totales = ii_totales
if ii_totales = 0 then
	rb_sum_totales.TriggerEvent("clicked")
	rb_sum_totales.checked = TRUE
	for li_fila = 1 to li_cant_filas
		dw_datos_zona_geo.setItem(li_fila,"fila_marcada",1)
	next
end if

// Tomo los totales que son el 100%.
dw_datos_zona_geo.acceptText()

ld_cant_incidencias 	= dw_datos_zona_geo.GetItemDecimal(1,"cant_incidencias_s")
ld_tiem_env_bri 		= dw_datos_zona_geo.GetItemDecimal(1,"tiem_env_bri_tot")
ld_tiem_repuesto 		= dw_datos_zona_geo.GetItemDecimal(1,"tiem_repuesto_tot")
ld_tiebt_propio 		= dw_datos_zona_geo.GetItemDecimal(1,"tiebt_propio_s")
ld_tiebt_aport  		= dw_datos_zona_geo.GetItemDecimal(1,"tiebt_aportado_s")
ld_tiepi_propio 		= dw_datos_zona_geo.GetItemDecimal(1,"tiepi_propio_s")
ld_tiepi_aport 		= dw_datos_zona_geo.GetItemDecimal(1,"tiepi_aportado_s")
ld_saifi			 		= dw_datos_zona_geo.GetItemDecimal(1,"saifi_tot")
ld_saidi			 		= dw_datos_zona_geo.GetItemDecimal(1,"saidi_tot")
ld_caidi			 		= dw_datos_zona_geo.GetItemDecimal(1,"caidi_tot")
ld_asai			 		= dw_datos_zona_geo.GetItemDecimal(1,"asai_tot")
ld_incidencia_cli 	= dw_datos_zona_geo.GetItemDecimal(1,"incidencia_cli_s")
ld_pot_afectada 		= dw_datos_zona_geo.GetItemDecimal(1,"pot_afectada_tot")

for li_fila = 1 to li_cant_filas
	
	if ld_cant_incidencias <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"cant_incidencias") * 100) / ld_cant_incidencias 
		dw_datos_zona_geo.SetItem(li_fila,"cant_incidencias", Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"cant_incidencias",0)
	end if

	if ld_tiem_env_bri <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"tiem_env_bri") * 100) / ld_tiem_env_bri
		dw_datos_zona_geo.SetItem(li_fila,"tiem_env_bri",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"tiem_env_bri",0)
	end if

	if ld_tiem_repuesto <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"tiem_repuesto") * 100) / ld_tiem_repuesto
		dw_datos_zona_geo.SetItem(li_fila,"tiem_repuesto",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"tiem_repuesto",0)
	end if

	if ld_tiebt_propio <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"tiebt_propio") * 100) / ld_tiebt_propio
		dw_datos_zona_geo.SetItem(li_fila,"tiebt_propio",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"tiebt_propio",0)
	end if

	if ld_tiebt_aport <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"tiebt_aportado") * 100) / ld_tiebt_aport
		dw_datos_zona_geo.SetItem(li_fila,"tiebt_aportado",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"tiebt_aportado",0)
	end if

	if ld_tiepi_propio <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"tiepi_propio") * 100) / ld_tiepi_propio
		dw_datos_zona_geo.SetItem(li_fila,"tiepi_propio",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"tiepi_propio",0)
	end if

	if ld_tiepi_aport <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"tiepi_aportado") * 100) / ld_tiepi_aport
		dw_datos_zona_geo.SetItem(li_fila,"tiepi_aportado",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"tiepi_aportado",0)
	end if

	if ld_saifi <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"saifi") * 100) / ld_saifi
		dw_datos_zona_geo.SetItem(li_fila,"saifi",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"saifi",0)
	end if

	if ld_saidi <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"saidi") * 100) / ld_saidi
		dw_datos_zona_geo.SetItem(li_fila,"saidi",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"saidi",0)
	end if
	
	if ld_caidi <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"caidi") * 100) / ld_caidi
		dw_datos_zona_geo.SetItem(li_fila,"caidi",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"caidi",0)
	end if

	if ld_asai <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"asai") * 100) / ld_asai
		dw_datos_zona_geo.SetItem(li_fila,"asai",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"asai",0)
	end if

	if ld_incidencia_cli <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemDecimal(li_fila,"incidencia_cli") * 100) / ld_incidencia_cli
		dw_datos_zona_geo.SetItem(li_fila,"incidencia_cli",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"incidencia_cli",0)
	end if

	if ld_pot_afectada <> 0 then
		ld_porc_fil_col = (dw_datos_zona_geo.GetItemNumber(li_fila,"pot_afectada") * 100) / ld_pot_afectada
		dw_datos_zona_geo.SetItem(li_fila,"pot_afectada",Round(ld_porc_fil_col,4))
	else
		dw_datos_zona_geo.SetItem(li_fila,"pot_afectada",0)
	end if
next

// Si estaba en parciales, restauro estado
if li_totales = 0 then
	rb_sum_parciales.TriggerEvent("clicked")
	rb_sum_parciales.checked = TRUE
end if

dw_datos_zona_geo.setRedraw(true)

end event

event ue_resetear_datos;call super::ue_resetear_datos;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_resetear_datos
//
/////////////////////////////////////////////////////////////////////////

dw_datos_zona_geo.reset();
dw_datos_zona_geo.WIDTH =  ii_width_dw
this.fw_inicializo_vector();
this.fw_inicializo_vector2();
ii_num_col_marca=0
pb_graficar.Enabled=FALSE
pb_sectores.Enabled=FALSE
sle_fil_selec.TextColor=97920
sle_fil_selec.text = String(0)
end event

event ue_historicos;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_historicos
//
/////////////////////////////////////////////////////////////////////////
dw_datos_zona_geo.SetRedraw(False)
int li_sums

li_sums = ii_totales
ii_num_col_marca=0
fw_des_column_selec()
fw_inicializo_vector()
fw_inicializo_vector2()

// Si desea ver los hist$$HEX1$$f300$$ENDHEX$$ricos
IF im_estadistica.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos" THEN

	// Siguiente estado "Actuales"
	im_estadistica.m_opciones.m_historicos.Text = "&Actual"
	im_estadistica.m_opciones.m_historicos.ToolBarItemText = "Actual"
	im_estadistica.m_opciones.m_historicos.ToolBarItemName = "Custom024!"

   // Muestro los hist$$HEX1$$f300$$ENDHEX$$ricos
	ii_historicos = 1
	ii_totales = 1
   //AG Matorra - "ii_acumulado" solo se reiniciar$$HEX2$$e1002000$$ENDHEX$$en el <checkbox>	
   //	ii_acumulado = 0
	dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 0")
	dw_criterio_seleccion.modify("pa_zona_cmd.visible = 0")
	rb_sum_parciales.checked = FALSE
	rb_sum_totales.checked = TRUE

ELSE

	// Siguiente estado los Hist$$HEX1$$f300$$ENDHEX$$ricos
	im_estadistica.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos"
	im_estadistica.m_opciones.m_historicos.ToolBarItemText = "Hist$$HEX1$$f300$$ENDHEX$$ricos"
	im_estadistica.m_opciones.m_historicos.ToolBarItemName = "Custom023!"	

	//	Muestro los actuales
	ii_historicos = 0

	dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 1")
	IF dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
		dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN 	
		
		dw_criterio_seleccion.modify("pa_zona_cmd.visible = 1")
	END IF

END IF

dw_ambito.Enabled = TRUE

///////////
// Si estaba en parciales...
if li_sums = 0 then
	rb_sum_parciales.triggerEvent("clicked")
	rb_sum_totales.Checked = False
	rb_sum_parciales.Checked = True
	ii_totales = 0
	sle_fil_selec.Enabled = False
	st_fil_selec.Enabled = False
	st_valor_actual.Enabled = False

else
	rb_sum_totales.triggerEvent("clicked")
	rb_sum_totales.Checked = True
	rb_sum_parciales.Checked = False
	ii_totales = 1
	sle_fil_selec.Enabled = True
	st_fil_selec.Enabled = True
	st_valor_actual.Enabled = True
end if
//////////
this.triggerevent("ue_actualizar")
end event

event ue_imprimir;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_imprimir
//
/////////////////////////////////////////////////////////////////////////
long job
string ls_sintaxis


//s_print str_print

if dw_datos_zona_geo.RowCount() = 0 then
	gnv_msg.f_mensaje("AM21", "", "", OK!)
	RETURN
end if

ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )

str_print.dwprint=dw_impresion
str_print.parm1=ib_lista
st_valor_actual.visible = False
IF ib_lista  THEN
	dw_datos_zona_geo.sharedata(dw_impresion)
	str_print.dwprint = dw_impresion
	fw_fondo_transparente()
	if iu_gen_comunic.is_comunic.accion_llamada = "RELEVANTES" then
		str_print.titulo="Informe de Incidencias Relevantes"
	else
   	str_print.titulo="Informe de Incidencias por $$HEX1$$c100$$ENDHEX$$rea Geogr$$HEX1$$e100$$ENDHEX$$fica"
	end if

ELSE
	if iu_gen_comunic.is_comunic.accion_llamada = "RELEVANTES" then
		str_print.titulo="Gr$$HEX1$$e100$$ENDHEX$$fica de Incidencias Relevantes"
	else
   	str_print.titulo="Gr$$HEX1$$e100$$ENDHEX$$fica de Incidencias por $$HEX1$$c100$$ENDHEX$$rea Geogr$$HEX1$$e100$$ENDHEX$$fica"
	end if

END IF	
IF ii_tipo_graf=1 THEN
	str_print.grafprint=gr_grafica
ELSE
	str_print.grafprint=gr_sectores
END IF

IF IsValid(w_print_bdg) THEN
	Close(w_print_bdg)
END IF

OpenWithParm(w_print_bdg,str_print)

IF not ib_lista THEN &
st_valor_actual.Visible = True

end event

event ue_botones;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_botones
//
// Objetivo: Controla si se han de Habilitar o Deshabilitar los
//				 botones para graficar
//
/////////////////////////////////////////////////////////////////////////

		IF ii_totales = 0 AND ii_ind_vec2 <= 1 THEN
			pb_graficar.Enabled = False
			pb_sectores.Enabled = False
		ELSEIF ii_totales = 0 AND ii_ind_vec2 > 1 THEN
			IF fw_ninguna_marcada() or ii_num_col_marca=0 THEN
				// ii_num_col_marca=0
				pb_graficar.Enabled = False
				pb_sectores.Enabled = False
			ELSEIF ii_num_col_marca=1 THEN
				pb_graficar.Enabled = True
				pb_sectores.Enabled = True
			ELSEif ii_num_col_marca>1 then
				pb_graficar.Enabled = True
				pb_sectores.Enabled = false
			END IF
		ELSE
			if ii_num_col_marca>=1 then
				pb_graficar.Enabled = True
			else
				pb_graficar.Enabled = false
			end if
			if ii_num_col_marca=1 then
				pb_sectores.Enabled = True
			else
				pb_sectores.Enabled = False
			end if
		END IF
end event

event zonacmdvisible;int li_centro, li_cmd, li_mesa

dw_ambito.AcceptText()
li_centro=dw_ambito.GetItemNumber(1,"nro_centro")
li_cmd=dw_ambito.GetItemNumber(1,"nro_cmd")
li_mesa=dw_ambito.GetItemNumber(1,"nro_mesa")

IF ii_historicos=0 and li_centro = fgci_todos AND & 
	li_cmd = fgci_todos AND &
	li_mesa = fgci_todos THEN
	dw_criterio_seleccion.modify("pa_zona_cmd.visible = 1")
else
		dw_criterio_seleccion.modify("pa_zona_cmd.visible = 0")
end if
end event

event ue_tiepi;integer li_cant_filas, li_cont, li_fila
string ls_sintaxis

SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_cant_filas = dw_datos_zona_geo.RowCount()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"tiepi_visible",1)
	dw_datos_zona_geo.SetItem(li_fila,"tiebt_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saifi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"caidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"asai_visible",0)

	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

IF ii_unidades <> 1 THEN
	dw_datos_zona_geo.Modify("saifi_tot.visible='0'")
	dw_datos_zona_geo.Modify("saidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("caidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("asai_tot.visible='0'")
END IF
// Si estoy mostrando tiepi (quiero pasar a tiebt)

IF ii_calidad <> 1 then
	// Cambio variable de estado
	ii_calidad = 1
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la datawindow
	dw_datos_zona_geo.Modify("tiepi.Visible = 1")
	dw_datos_zona_geo.Modify("tiebt.Visible = 0")
	dw_datos_zona_geo.Modify("saifi_t.Visible = 0")
	dw_datos_zona_geo.Modify("saidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("caidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("asai_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_propio_t.Visible = 1")
	dw_datos_zona_geo.Modify("tiepi_tiebt_aport_t.Visible = 1")

END IF


//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ii_tiepi_tiebt = 1
fw_indices_visible_ext("tiepi")
//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF
//
////
dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
////	Inicializo el vector
fw_inicializo_vector()
////fw_inicializo_vector2()


This.TriggerEvent("ue_botones")

ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )

dw_datos_zona_geo.SetRedraw(True)
end event

event ue_tiebt;integer li_cant_filas, li_cont, li_fila
string ls_sintaxis

SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_cant_filas = dw_datos_zona_geo.RowCount()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"tiebt_visible",1)
	dw_datos_zona_geo.SetItem(li_fila,"tiepi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saifi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"caidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

IF ii_unidades <> 1 THEN
	dw_datos_zona_geo.Modify("saifi_tot.visible='0'")
	dw_datos_zona_geo.Modify("saidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("caidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("asai_tot.visible='0'")
END IF
// Si estoy mostrando tiepi (quiero pasar a tiebt)

IF ii_calidad <> 2 then
//
//	// Cambio variable de estado.
	ii_calidad = 2
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	dw_datos_zona_geo.Modify("tiepi.Visible = 0")
	dw_datos_zona_geo.Modify("tiebt.Visible = 1")
	dw_datos_zona_geo.Modify("saifi_t.Visible = 0")
	dw_datos_zona_geo.Modify("saidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("caidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("asai_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_propio_t.Visible = 1")
	dw_datos_zona_geo.Modify("tiepi_tiebt_aport_t.Visible = 1")

END IF


//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ii_tiepi_tiebt = 0
fw_indices_visible_ext("tiebt")
//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
//	Inicializo el vector
fw_inicializo_vector()
//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )

dw_datos_zona_geo.SetRedraw(True)
end event

event ue_saifi;integer li_cant_filas, li_cont, li_fila
string ls_sintaxis

SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

m_estadistica_zona_geografica.m_opciones.m_indicesdecalidad.m_tiepi.Checked = False
m_estadistica_zona_geografica.m_opciones.m_indicesdecalidad.m_tiebt.Checked = False
m_estadistica_zona_geografica.m_opciones.m_indicesdecalidad.m_saifi.Checked = True
m_estadistica_zona_geografica.m_opciones.m_indicesdecalidad.m_saidi.Checked = False
m_estadistica_zona_geografica.m_opciones.m_indicesdecalidad.m_caidi.Checked = False
m_estadistica_zona_geografica.m_opciones.m_indicesdecalidad.m_asai.Checked = False

li_cant_filas = dw_datos_zona_geo.RowCount()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"saifi_visible",1)
	dw_datos_zona_geo.SetItem(li_fila,"tiepi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"tiebt_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"caidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",1)
	END IF
	
	li_fila ++
LOOP

// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
IF ii_calidad <> 3 then
	ii_calidad = 3
	dw_datos_zona_geo.Modify("tiepi.Visible = 0")
	dw_datos_zona_geo.Modify("tiebt.Visible = 0")
	dw_datos_zona_geo.Modify("saifi_t.Visible = 1")
	dw_datos_zona_geo.Modify("saidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("caidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("asai_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_propio_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_aport_t.Visible = 0")
END IF

IF ii_unidades <> 1 THEN
	dw_datos_zona_geo.Modify("saifi_tot.visible='1'")
	dw_datos_zona_geo.Modify("saidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("caidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("asai_tot.visible='0'")
END IF

//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ii_tiepi_tiebt = 2
fw_indices_visible_ext("saifi")
//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
//	Inicializo el vector
fw_inicializo_vector()
//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )
dw_datos_zona_geo.SetRedraw(True)
end event

event ue_saidi;integer li_cant_filas, li_cont, li_fila
string ls_sintaxis

SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_cant_filas = dw_datos_zona_geo.RowCount()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"saifi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"tiepi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"tiebt_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saidi_visible",1)
	dw_datos_zona_geo.SetItem(li_fila,"caidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",1)
	END IF
	
	li_fila ++
LOOP

IF ii_calidad <> 4 then
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	ii_calidad = 4
	dw_datos_zona_geo.Modify("tiepi.Visible = 0")
	dw_datos_zona_geo.Modify("tiebt.Visible = 0")
	dw_datos_zona_geo.Modify("saifi_t.Visible = 0")
	dw_datos_zona_geo.Modify("saidi_t.Visible = 1")
	dw_datos_zona_geo.Modify("caidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("asai_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_propio_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_aport_t.Visible = 0")
END IF

IF ii_unidades <> 1 THEN
	dw_datos_zona_geo.Modify("saifi_tot.visible='0'")
	dw_datos_zona_geo.Modify("saidi_tot.visible='1'")
	dw_datos_zona_geo.Modify("caidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("asai_tot.visible='0'")
END IF

//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ii_tiepi_tiebt = 3
fw_indices_visible_ext("saidi")
//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
//	Inicializo el vector
fw_inicializo_vector()
//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")
ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )

dw_datos_zona_geo.SetRedraw(True)
end event

event ue_caidi;integer li_cant_filas, li_cont, li_fila
string ls_sintaxis
SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_cant_filas = dw_datos_zona_geo.RowCount()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"saifi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"tiepi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"tiebt_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"caidi_visible",1)
	dw_datos_zona_geo.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",1)
	END IF
	
	li_fila ++
LOOP

IF ii_calidad <> 5 then
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	ii_calidad = 5
	dw_datos_zona_geo.Modify("tiepi.Visible = 0")
	dw_datos_zona_geo.Modify("tiebt.Visible = 0")
	dw_datos_zona_geo.Modify("saifi_t.Visible = 0")
	dw_datos_zona_geo.Modify("saidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("caidi_t.Visible = 1")
	dw_datos_zona_geo.Modify("asai_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_propio_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_aport_t.Visible = 0")
END IF

IF ii_unidades <> 1 THEN
	dw_datos_zona_geo.Modify("saifi_tot.visible='0'")
	dw_datos_zona_geo.Modify("saidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("caidi_tot.visible='1'")
	dw_datos_zona_geo.Modify("asai_tot.visible='0'")
END IF


//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ii_tiepi_tiebt = 4
fw_indices_visible_ext("caidi")
//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
//	Inicializo el vector
fw_inicializo_vector()
//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")
ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )
dw_datos_zona_geo.SetRedraw(True)
end event

event ue_asai;integer li_cant_filas, li_cont, li_fila
string ls_sintaxis

SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_cant_filas = dw_datos_zona_geo.RowCount()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"saifi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"tiepi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"tiebt_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"saidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"caidi_visible",0)
	dw_datos_zona_geo.SetItem(li_fila,"asai_visible",1)

	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

IF ii_calidad <> 6 then
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	ii_calidad = 6
	dw_datos_zona_geo.Modify("tiepi.Visible = 0")
	dw_datos_zona_geo.Modify("tiebt.Visible = 0")
	dw_datos_zona_geo.Modify("saifi_t.Visible = 0")
	dw_datos_zona_geo.Modify("saidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("caidi_t.Visible = 0")
	dw_datos_zona_geo.Modify("asai_t.Visible = 1")
	dw_datos_zona_geo.Modify("tiepi_tiebt_propio_t.Visible = 0")
	dw_datos_zona_geo.Modify("tiepi_tiebt_aport_t.Visible = 0")
END IF

IF ii_unidades <> 1 THEN
	dw_datos_zona_geo.Modify("saifi_tot.visible='0'")
	dw_datos_zona_geo.Modify("saidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("caidi_tot.visible='0'")
	dw_datos_zona_geo.Modify("asai_tot.visible='1'")
END IF

// Carga las computed columns con tiepi, tiebt, etc.


//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ii_tiepi_tiebt = 5
fw_indices_visible_ext("asai")
//***************************************
//**  OSGI 2001.1  	19/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
//	Inicializo el vector
fw_inicializo_vector()
//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")
ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )
dw_datos_zona_geo.SetRedraw(True)
end event

event ue_incidencia_cliente;/////////////////////////////////////////////////////////////////////////
//
// Event:	ue_incidencia_cliente
//
/////////////////////////////////////////////////////////////////////////
integer li_cont, li_cant_filas

SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_cant_filas = dw_datos_zona_geo.rowCount()

li_cont = 1	

ii_clientes_potencia = 1

im_estadistica.m_opciones.m_incidenciacliente.Checked = True
im_estadistica.m_opciones.m_potenciaafectada.Checked = False
	
DO WHILE li_cont <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_cont,False)
	dw_datos_zona_geo.SetItem(li_cont,"clientes_potencia",1)
	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_cont,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_cont,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_cont,"sumas_promedio",1)
	END IF
	li_cont ++
LOOP

// Muestro Incidencia Cliente X1000
// Muestra Incidencia Cliente X1000 en cabecera y col. dato
dw_datos_zona_geo.Modify("incidencia_cli_t.Visible = 1")
dw_datos_zona_geo.Modify("pot_afectada_t.Visible = 0")
			

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0

//	Inicializo el vector
fw_inicializo_vector()

//fw_inicializo_vector2()
This.TriggerEvent("ue_botones")

dw_datos_zona_geo.SetRedraw(True)
end event

event ue_potencia_afectada;/////////////////////////////////////////////////////////////////////////
//
// Event:	ue_potencia_afectada
//
/////////////////////////////////////////////////////////////////////////
integer li_cont, li_cant_filas
string ls_sintaxis
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

SetPointer(HourGlass!)
dw_datos_zona_geo.SetRedraw(False)
li_cant_filas = dw_datos_zona_geo.rowCount()

li_cont = 1	
  
ii_clientes_potencia = 0
	
// Pr$$HEX1$$f300$$ENDHEX$$ximo cambio a Incidencia Cliente
im_estadistica.m_opciones.m_incidenciacliente.Checked = False
im_estadistica.m_opciones.m_potenciaafectada.Checked = True
		
DO WHILE li_cont <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_cont,False)
	dw_datos_zona_geo.SetItem(li_cont,"clientes_potencia",0)
	IF ii_totales = 0 THEN
		dw_datos_zona_geo.SetItem(li_cont,"fila_marcada",0)
		dw_datos_zona_geo.SetItem(li_cont,"sumas_promedio",0)
	ELSE
		dw_datos_zona_geo.SetItem(li_cont,"sumas_promedio",1)
	END IF
	li_cont ++
LOOP
	
// Muestra Pot. Afectada en cabecera y columna dato
dw_datos_zona_geo.Modify("incidencia_cli_t.Visible = 0")
dw_datos_zona_geo.Modify("pot_afectada_t.Visible = 1")
		

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0

//	Inicializo el vector
fw_inicializo_vector()

//fw_inicializo_vector2()
This.TriggerEvent("ue_botones")

ls_Sintaxis = dw_datos_zona_geo.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )

dw_datos_zona_geo.SetRedraw(True)
end event

public function integer fw_graficar ();///////////////////////////////////////////////////////////////////////
//
//	Function: fw_graficar
//
///////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)
graph gr

if ii_tipo_graf=1 then
	gr=gr_grafica
else
	gr=gr_sectores
end if

gr.Reset(ALL!)

iu_gen_gra = CREATE u_gen_nu_gra_0001

iu_gen_gra.fnu_gra_titulo(gr,"Estad$$HEX1$$ed00$$ENDHEX$$stica de Incidencias por Zona Geogr$$HEX1$$e100$$ENDHEX$$fica")
//iu_gen_gra.fnu_gra_titulo(gr,"Statistics of Incidences per Geographic Area")

IF ii_unidades = 0 THEN
	iu_gen_gra.fnu_gra_titulo_y(gr,"Porcentajes")
//	iu_gen_gra.fnu_gra_titulo_y(gr,"Percentages")
ELSE
	iu_gen_gra.fnu_gra_titulo_y(gr,"Cantidades")
//	iu_gen_gra.fnu_gra_titulo_y(gr,"Amounts")
END IF

if ii_historicos = 1 then
	iu_gen_gra.fnu_titulo_x(gr,"Fecha")
//	iu_gen_gra.fnu_titulo_x(gr,"Date")
else
	iu_gen_gra.fnu_titulo_x(gr,"Zona Geogr$$HEX1$$e100$$ENDHEX$$fica")
//	iu_gen_gra.fnu_titulo_x(gr,"Geographic Area")
end if

gr.SetRedraw(False)

iu_gen_gra.fnu_gra_cargo_datos(gr,dw_datos_zona_geo,1,True,iivec_col_selec[],iivec_fil_selec[])

gr.SetRedraw(True)

DESTROY iu_gen_gra 

RETURN 1
end function

public function integer fw_desmarcar_col (integer pi_nro_col);///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_desmarcar_col
//
///////////////////////////////////////////////////////////////////////

int li_ind

ii_ind_vec --

li_ind = 2
DO WHILE li_ind <= ii_ind_vec
	IF iivec_col_selec[li_ind] = pi_nro_col THEN
		iivec_col_selec[li_ind] = iivec_col_selec[ii_ind_vec]
		iivec_col_selec[ii_ind_vec] = 0
		EXIT
	END IF
	li_ind ++
LOOP

RETURN 1
end function

public function integer fw_marcar_col (integer pi_nro_col);///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_marcar_col
//
///////////////////////////////////////////////////////////////////////

iivec_col_selec[ii_ind_vec] = pi_nro_col
ii_ind_vec ++

RETURN 1
end function

public function integer fw_inicializo_vector ();///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_inicializo_vector
//
///////////////////////////////////////////////////////////////////////

int li_ind, li_column_zona
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm

IF Integer(dw_datos_zona_geo.Describe("nom_centro_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna ('nom_centro')
ELSEIF Integer(dw_datos_zona_geo.Describe("nom_cmd_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna ('nom_cmd')
ELSEIF Integer(dw_datos_zona_geo.Describe("nom_puesto_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna ('nom_puesto')
ELSEIF Integer(dw_datos_zona_geo.Describe("fecha_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna ('fecha')
END IF
		
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)

li_ind = 1
iivec_col_selec[li_ind] = li_column_zona

FOR li_ind = 2 TO dw_datos_zona_geo.RowCount()
	IF iivec_col_selec[li_ind - 1] >= 0 THEN
	
		ls_column = dw_datos_zona_geo.Describe("#"+ String(iivec_col_selec[li_ind - 1]) +".Name")
		ls_column2 = ls_column + "_s"
//		ls_column3 = ls_column + "_a"
		ls_column3 = ls_column + "_m"
	
		dw_datos_zona_geo.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos_zona_geo.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos_zona_geo.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos_zona_geo.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")

		dw_datos_zona_geo.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos_zona_geo.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")

		iivec_col_selec[li_ind] = 0
	END IF
NEXT

ii_ind_vec = 2

RETURN 1
end function

public function boolean fw_ninguna_marcada ();///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_ninguna_marcada
//
///////////////////////////////////////////////////////////////////////

boolean lb_mark
int li_ind

lb_mark = False
//li_ind = 2
li_ind = 1
DO WHILE li_ind <= ii_ind_vec

	IF iivec_col_selec[li_ind] > 0 THEN
		RETURN False
	END IF
	li_ind ++
LOOP

RETURN True
end function

public function integer fw_inicializo_vector2 ();///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_inicializo_vector2
//
///////////////////////////////////////////////////////////////////////

int li_ind

FOR li_ind = 1 TO dw_datos_zona_geo.RowCount()
	iivec_fil_selec[li_ind] = 0
NEXT

ii_ind_vec2 = 1

RETURN 1
end function

public function integer fw_obtener_numero_columna (string ps_nombre);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_obtener_numero_columna
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve el n$$HEX1$$fa00$$ENDHEX$$mero de columna para un nombre de columna
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  ps_nombre: nombre de la columna
//		Salida:   --
//						
// Devuelve:	el n$$HEX1$$fa00$$ENDHEX$$mero de la columna en la dw_datos_zona_geo
//
//  Fecha	 	 Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	 -----------		----------------------------------------
//	16/10/2000	   GSE, LFE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
/////////////////////////////////////////////////////////////////////////////////////////////

int li_retorno

if dw_datos_zona_geo.rowcount() > 0 THEN
	dw_datos_zona_geo.SetTabOrder (ps_nombre,10)
	dw_datos_zona_geo.setcolumn(ps_nombre)
	li_retorno = dw_datos_zona_geo.getcolumn()
	dw_datos_zona_geo.SetTabOrder (ps_nombre,0)
ELSE
	li_retorno = -1
END IF		

Return li_retorno
end function

public subroutine fw_des_column_selec ();string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm, ls_column
string ls_column2, ls_column3, ls_column4, ls_column5
int li_indice
int li_vec_col_selec[]

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)
ls_color_fondo_mark = String(65536*128+256*128+128)

FOR li_indice=1 to integer(dw_datos_zona_geo.Object.DataWindow.Column.Count)

//Desmarco lo que estuviera marcado ya que cambio de opcion de menu

	ls_column = dw_datos_zona_geo.Describe("#"+ String(li_indice) +".Name")
	ls_column2 = ls_column + "_s"
	ls_column3 = ls_column + "_a"
	ls_column4 = ls_column + "_p"
	ls_column5 = ls_column + "_tot"
	IF dw_datos_zona_geo.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos_zona_geo.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos_zona_geo.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos_zona_geo.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos_zona_geo.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos_zona_geo.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos_zona_geo.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos_zona_geo.Modify(" "+ ls_column4 +".Background.Mode=1")
		dw_datos_zona_geo.Modify(" "+ ls_column4 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column4 +".Text.Color="+ ls_color_texto_norm +" ")

		dw_datos_zona_geo.Modify(" "+ ls_column5 +".Background.Mode=0")
		dw_datos_zona_geo.Modify(" "+ ls_column5 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos_zona_geo.Modify(" "+ ls_column5 +".Text.Color="+ ls_color_texto_norm +" ")
	
		fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
	
	END IF
NEXT

iivec_col_selec = li_vec_col_selec
fw_inicializo_vector()
end subroutine

public subroutine fw_seleccionar_todo ();int li_indice
for li_indice=1 to integer(dw_datos_zona_geo.Object.DataWindow.Column.Count)
	ii_column_clicked=li_indice
	dw_datos_zona_geo.triggerevent(doubleclicked!)
next

end subroutine

public function integer fw_validar_periodo ();date ld_fecha

ld_fecha = dw_criterio_seleccion.object.pa_periodo[1]

IF IsNull(ld_fecha) THEN
	dw_criterio_seleccion.object.pa_periodo[1] = today()
	return 1
else
	return 0
END IF
 
end function

public subroutine fw_fondo_transparente ();int li_num_cols, li_contador
string ls_Respuesta
long ll_color
ll_color = 553648127
li_num_cols = integer(dw_datos_zona_geo.object.DataWindow.Column.Count)
for li_contador = 1 to li_num_cols
	dw_impresion.Modify("#" + string(li_contador) + ".background.color = " + string(ll_color))		
NEXT
end subroutine

public subroutine fw_indices_visible_ext (readonly string as_indice);dw_datos_zona_geo.Modify("tiepi_propio_ext.Visible = 0")
dw_datos_zona_geo.Modify("tiepi_aportado_ext.Visible = 0")
dw_datos_zona_geo.Modify("tiebt_propio_ext.Visible = 0")
dw_datos_zona_geo.Modify("tiebt_aportado_ext.Visible = 0")
dw_datos_zona_geo.Modify("saifi_ext.Visible = 0")
dw_datos_zona_geo.Modify("saidi_ext.Visible = 0")
dw_datos_zona_geo.Modify("caidi_ext.Visible = 0")
dw_datos_zona_geo.Modify("asai_ext.Visible = 0")


dw_datos_zona_geo.Modify(as_indice + "_ext.Visible = 1")
dw_datos_zona_geo.Modify(as_indice + "_propio_ext.Visible = 1")
dw_datos_zona_geo.Modify(as_indice + "_aportado_ext.Visible = 1")
end subroutine

event open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Open de la ventana de la BDG con las estad$$HEX1$$ed00$$ENDHEX$$sticas por
//				 zonas geogr$$HEX1$$e100$$ENDHEX$$ficas.
//
/////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED

// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//	iu_gen_comunic  --> para cargar la estructura local 

// Se crea el men$$HEX1$$fa00$$ENDHEX$$
im_estadistica = CREATE m_estadistica_zona_geografica

This.ChangeMenu(im_estadistica)

datetime ld_fecha_ok_bdg

SetPointer(HourGlass!)
This.SetRedraw(False)
ib_lista = True //En True indica que se esta desplegando la lista,
                //  en False indica que se esta desplegando la Gr$$HEX1$$e100$$ENDHEX$$fica
					 
iu_gen_comunic  = CREATE u_generico_comunicaciones
iu_gen_comunic.is_comunic = gu_comunic.is_comunic

// Creo objeto de n$$HEX1$$fa00$$ENDHEX$$cleo de la datawindow
iu_bdg_2002_nu = CREATE u_bdg_2002_nu_est_zona_geo1 

SELECT FECHA_OK INTO :ld_fecha_ok_bdg FROM GI_BDG_OK WHERE PROGRAMA = '4001';

// Si se llama para la consulta "Incidencias Relevantes"
if iu_gen_comunic.is_comunic.accion_llamada = "RELEVANTES" then
	SELECT FECHA_OK INTO :ld_fecha_ok_bdg FROM GI_BDG_OK WHERE PROGRAMA = '4002';
   is_tabla_bdg = 'GI_RELEVANTES_BDG'
	This.title = gu_comunic.f_titulo_ventana("w_4002","inc_relev") + '  - Actualizado: ' + string(date(ld_fecha_ok_bdg))
	This.icon = 'ACTIV_IM.ico'
else
   SELECT FECHA_OK INTO :ld_fecha_ok_bdg FROM GI_BDG_OK WHERE PROGRAMA = '4001';
   is_tabla_bdg = 'GI_INCIDENCIA_BDG'
	This.Title = iu_gen_comunic.f_titulo_ventana("w_4001","inc_zgeo") + ' - Actualizado: ' + string(date(ld_fecha_ok_bdg))
end if

// Inserto una fila y conecto a la D.W. de 
// los datos por zona geogr$$HEX1$$e100$$ENDHEX$$fica

//dw_datos_zona_geo.insertRow(0)
dw_datos_zona_geo.SetTransObject(sqlca)

// Conecto las D.D.D.W. del objeto "criterio de selecci$$HEX1$$f300$$ENDHEX$$n",
// filtro sus campos, y seteo a los mismos
// con "Todos"
dw_criterio_seleccion.f_insertar_fila()
dw_criterio_seleccion.fpr_crea_dddw()
dw_criterio_seleccion.SetItem(1,"pa_periodo",fgnu_fecha_actual())
dw_criterio_seleccion.SetItem(1,"pa_tipo_incidencia",fgci_todos)
dw_criterio_seleccion.SetItem(1,"pa_tension_afectada",fgci_todos)		
dw_criterio_seleccion.SetItem(1,"pa_material_averiado","010101")
dw_criterio_seleccion.SetItem(1,"ps_nom_mat_averiado","<Todos>")
dw_criterio_seleccion.SetItem(1,"pa_int_horario",fgci_todos)
dw_criterio_seleccion.SetItem(1,"pa_unidades",1)
dw_criterio_seleccion.SetItem(1,"pa_acumulado_sn",0)
dw_criterio_seleccion.SetItem(1,"pa_zona_cmd",0)

// Inicializo objetos de trabajo
dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
dw_ambito.fnu_insertar_datos(fgci_todos, fgci_todos, fgci_todos, 0)
									 
dw_ambito.SetColumn("nro_centro") 

// Seteo estado inicial de la ventana
ii_historicos = 0
ii_totales = 1
ii_acumulado = 0
ii_unidades = 1
ii_clientes_potencia = 1 //Clientes Afectados
ii_num_col_marca=0 //Inicializo variable
ii_calidad = 1

//Establecemos presentaci$$HEX1$$f300$$ENDHEX$$n ini. de la lista de datos en col. del $$HEX1$$e100$$ENDHEX$$mbito
dw_datos_zona_geo.Modify("nom_centro_t.Visible = 0")
dw_datos_zona_geo.Modify("nom_puesto_t.Visible = 0")
dw_datos_zona_geo.Modify("nom_cmd_t.Visible = 1")

//Establecemos presentaci$$HEX1$$f300$$ENDHEX$$n ini. de la lista de datos en col. Fecha
dw_datos_zona_geo.Modify("fecha.Visible = 0")
dw_datos_zona_geo.Modify("fecha_t.Visible = 0")

// Establecemos t$$HEX1$$ed00$$ENDHEX$$tulos de la datawindow
dw_datos_zona_geo.Modify("incidencia_cli_t.Visible = 0")
dw_datos_zona_geo.Modify("pot_afectada_t.Visible = 1")

dw_datos_zona_geo.Modify("tiepi.Visible = 1")
dw_datos_zona_geo.Modify("tiebt.Visible = 0")


//	Inicializo vector
This.fw_inicializo_vector()
This.fw_inicializo_vector2()

// Oculto la Gr$$HEX1$$e100$$ENDHEX$$fica
st_valor_actual.Hide()
gr_grafica.Hide()
gr_sectores.Hide()
pb_graficar.Enabled = False
pb_sectores.Enabled = False
This.SetRedraw(True)
// Cargo la lista con los datos
This.TriggerEvent("ue_actualizar")


end event

on w_4001_estadisticas_zonas_geografica.create
int iCurrent
call super::create
this.pb_avanzar=create pb_avanzar
this.sle_fil_selec=create sle_fil_selec
this.st_fil_selec=create st_fil_selec
this.pb_graficar=create pb_graficar
this.pb_retroceder=create pb_retroceder
this.pb_sectores=create pb_sectores
this.gb_sumas=create gb_sumas
this.rb_sum_totales=create rb_sum_totales
this.rb_sum_parciales=create rb_sum_parciales
this.dw_ambito=create dw_ambito
this.dw_criterio_seleccion=create dw_criterio_seleccion
this.st_1=create st_1
this.dw_datos_zona_geo=create dw_datos_zona_geo
this.gr_grafica=create gr_grafica
this.gr_sectores=create gr_sectores
this.dw_impresion=create dw_impresion
this.st_valor_actual=create st_valor_actual
this.cb_1=create cb_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_avanzar
this.Control[iCurrent+2]=this.sle_fil_selec
this.Control[iCurrent+3]=this.st_fil_selec
this.Control[iCurrent+4]=this.pb_graficar
this.Control[iCurrent+5]=this.pb_retroceder
this.Control[iCurrent+6]=this.pb_sectores
this.Control[iCurrent+7]=this.gb_sumas
this.Control[iCurrent+8]=this.rb_sum_totales
this.Control[iCurrent+9]=this.rb_sum_parciales
this.Control[iCurrent+10]=this.dw_ambito
this.Control[iCurrent+11]=this.dw_criterio_seleccion
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.dw_datos_zona_geo
this.Control[iCurrent+14]=this.gr_grafica
this.Control[iCurrent+15]=this.gr_sectores
this.Control[iCurrent+16]=this.dw_impresion
this.Control[iCurrent+17]=this.st_valor_actual
this.Control[iCurrent+18]=this.cb_1
this.Control[iCurrent+19]=this.st_2
end on

on w_4001_estadisticas_zonas_geografica.destroy
call super::destroy
destroy(this.pb_avanzar)
destroy(this.sle_fil_selec)
destroy(this.st_fil_selec)
destroy(this.pb_graficar)
destroy(this.pb_retroceder)
destroy(this.pb_sectores)
destroy(this.gb_sumas)
destroy(this.rb_sum_totales)
destroy(this.rb_sum_parciales)
destroy(this.dw_ambito)
destroy(this.dw_criterio_seleccion)
destroy(this.st_1)
destroy(this.dw_datos_zona_geo)
destroy(this.gr_grafica)
destroy(this.gr_sectores)
destroy(this.dw_impresion)
destroy(this.st_valor_actual)
destroy(this.cb_1)
destroy(this.st_2)
end on

event closequery;call super::closequery;/////////////////////////////////////////////////////////////////////////
//
// Event:	closequery
//
// Objetivo: Destruyo objetos creados
//
///////////////////////////////////////////////////////////////////////////

DESTROY iu_gen_comunic  
DESTROY iu_bdg_2002_nu
DESTROY im_estadistica
end event

event close;/////////////////////////////////////////////////////////////////////////
//
// Event:	close
//
///////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_4001_estadisticas_zonas_geografica
end type

type pb_avanzar from picturebutton within w_4001_estadisticas_zonas_geografica
boolean visible = false
integer x = 3305
integer y = 1332
integer width = 96
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "derecha.bmp"
string disabledname = "derecha.bmp"
alignment htextalign = left!
end type

on clicked;//boolean lb_mesa_ok, lb_cmd_ok
//
//// Si tiene una fila seleccionada y puede bajar de nivel.
//
//lb_mesa_ok = (integer(dw_ambito.describe("nro_mesa.protect")) = 0)
//lb_cmd_ok = (integer(dw_ambito.describe("nro_cmd.protect")) = 0)
//
//if (dw_ambito.getItemNumber(1,"nro_mesa") = fgci_todos() and lb_mesa_ok) OR&
//	(dw_ambito.getItemNumber(1,"nro_cmd") = fgci_todos() and lb_cmd_ok) then
//
//	Parent.TriggerEvent("ue_actualizar")
//end if


end on

type sle_fil_selec from singlelineedit within w_4001_estadisticas_zonas_geografica
integer x = 3154
integer y = 1148
integer width = 183
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_fil_selec from statictext within w_4001_estadisticas_zonas_geografica
integer x = 3104
integer y = 1080
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Filas Selecci$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_graficar from picturebutton within w_4001_estadisticas_zonas_geografica
integer x = 3310
integer y = 660
integer width = 160
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "grafico.bmp"
string disabledname = "grafico1.bmp"
alignment htextalign = left!
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	Clicked
//
/////////////////////////////////////////////////////////////////////////
int li_ind

dw_datos_zona_geo.SetRedraw(FALSE)
ii_tipo_graf=1

// Si est$$HEX2$$e1002000$$ENDHEX$$habilitada la datawindow de datos
IF dw_datos_zona_geo.Enabled = TRUE THEN
	
	// Seg$$HEX1$$fa00$$ENDHEX$$n lo que se est$$HEX2$$e9002000$$ENDHEX$$desplegando cambio la figura del bot$$HEX1$$f300$$ENDHEX$$n
	IF This.PictureName = "grafico.bmp" THEN
		ib_lista = FALSE 
		This.PictureName = "hfactu.bmp"
		
		// Deshabilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = FALSE
		rb_sum_totales.Enabled = FALSE
		
		im_estadistica.m_opciones.m_actualizar.Enabled = FALSE
		im_estadistica.m_opciones.m_historicos.Enabled = FALSE
		im_estadistica.m_opciones.m_incidenciacliente.Enabled = False
		im_estadistica.m_opciones.m_potenciaafectada.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiepi.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiebt.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_saifi.Enabled = False	
		im_estadistica.m_opciones.m_indicesdecalidad.m_saidi.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_caidi.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_asai.Enabled = False

		dw_ambito.Enabled = FALSE
		dw_criterio_seleccion.Enabled = FALSE
		gb_sumas.Enabled = FALSE
		pb_retroceder.Enabled = FALSE
		
		pb_sectores.Enabled = FALSE

		Parent.fw_graficar()
		gr_grafica.Show()
		st_valor_actual.Show()
	ELSE
		ib_lista = TRUE
		This.PictureName = "grafico.bmp"
		dw_datos_zona_geo.Show()
		gr_grafica.Hide()
		st_valor_actual.Hide()
		
		IF ii_totales = 0 THEN
			
			// Recorro la datawindow evaluando las filas selecionadas
			li_ind = 1
	
			DO WHILE li_ind < ii_ind_vec2
				dw_datos_zona_geo.SelectRow(iivec_fil_selec[li_ind], TRUE)
				dw_datos_zona_geo.SetItem(iivec_fil_selec[li_ind], "fila_marcada", 1)
				li_ind ++
			LOOP
			
		END IF
		
		// Habilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = TRUE
		im_estadistica.m_opciones.m_actualizar.Enabled = TRUE
		im_estadistica.m_opciones.m_historicos.Enabled = TRUE
		im_estadistica.m_opciones.m_incidenciacliente.Enabled = TRUE
		im_estadistica.m_opciones.m_potenciaafectada.Enabled = TRUE
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiepi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiebt.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_saifi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_saidi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_caidi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_asai.Enabled = True
		
		dw_ambito.Enabled = TRUE
		dw_criterio_seleccion.Enabled = TRUE
		gb_sumas.Enabled= TRUE
		
		IF (dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
			dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
			dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos) OR ii_historicos = 1 then
			
			pb_retroceder.enabled = FALSE
		else
			pb_retroceder.enabled = TRUE
		end if
		
		
		rb_sum_totales.Enabled = TRUE
		
		if ii_num_col_marca=1 then
				pb_sectores.Enabled = True
		end if
		
	END IF
ELSE
	gnv_msg.f_mensaje("AB01", "", "", OK!)
END IF

if not ib_habilitado then
	rb_sum_parciales.enabled = ib_habilitado
	rb_sum_totales.enabled = ib_habilitado
end if


dw_datos_zona_geo.SetRedraw(TRUE)
end event

type pb_retroceder from picturebutton within w_4001_estadisticas_zonas_geografica
integer x = 3200
integer y = 1332
integer width = 96
integer height = 80
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = " "
string picturename = "undo3.bmp"
string disabledname = "undo3ds.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  clicked
//
/////////////////////////////////////////////////////////////////////////

int li_ind 
date ld_periodo
long ll_tip_incidencia	// DSA 03/04/2000	
s_bdg lstr_bdg

SetPointer(HourGlass!)
dw_criterio_seleccion.AcceptText()
dw_ambito.AcceptText()
ii_clientes_potencia = 0 //MATO
fw_des_column_Selec()
// Cargo variables auxiliares para pasar como par$$HEX1$$e100$$ENDHEX$$metro
lstr_bdg.gi_centro 		  = dw_ambito.GetItemNumber(1,"nro_centro")
lstr_bdg.gi_cmd 	 		  = dw_ambito.GetItemNumber(1,"nro_cmd")
lstr_bdg.gi_puesto 		  = dw_ambito.GetItemNumber(1,"nro_mesa")
lstr_bdg.gda_periodo 	  = dw_criterio_seleccion.GetItemDate(1,"pa_periodo")
lstr_bdg.gi_tipo_incid 	  = dw_criterio_seleccion.GetItemNumber(1,"pa_tipo_incidencia")
lstr_bdg.gi_tension_afec  = dw_criterio_seleccion.GetItemNumber(1,"pa_tension_afectada")
lstr_bdg.gs_material_aver = dw_criterio_seleccion.GetItemString(1,"pa_material_averiado")
lstr_bdg.gi_int_horario   = dw_criterio_seleccion.GetItemNumber(1,"pa_int_horario")
ld_periodo = dw_criterio_seleccion.GetItemDate(1, "pa_periodo")
dw_datos_zona_geo.SetRedraw(False)
dw_datos_zona_geo.Reset()

ll_tip_incidencia = dw_criterio_seleccion.object.pa_tipo_incidencia[1]	// DSA 03/04/2000	

// Si retrocedo a TODOS, TODOS, TODOS
IF (lstr_bdg.gi_centro <> fgci_todos AND &
	 lstr_bdg.gi_cmd = fgci_todos AND &
	 lstr_bdg.gi_puesto = fgci_todos) OR & 
	(lstr_bdg.gi_cmd <> fgci_todos AND &
	 lstr_bdg.gi_centro = fgci_todos AND &
	 lstr_bdg.gi_puesto = fgci_todos) THEN

   // Si llego al tope deshabilito el bot$$HEX1$$f300$$ENDHEX$$n y selecciono centro o cmd
   this.enabled = FALSE
   ii_nivel = 0
	if lstr_bdg.gi_centro = fgci_todos then 
		dw_ambito.Setcolumn("nro_cmd")
		dw_ambito.Settext(string(fgci_todos) )
	else
		dw_ambito.Setcolumn("nro_centro")
		dw_ambito.Settext(string(fgci_todos) )
	end if

	dw_ambito.AcceptText()
	if is_donde="ZONA" then
		iu_bdg_2002_nu.fnu_armar_sql(dw_datos_zona_geo, "TODOS", ii_acumulado, &
									  is_tabla_bdg, ii_historicos, &
									  fgci_todos, fgci_todos, fgci_todos, &
									  ll_tip_incidencia, lstr_bdg.gi_tension_afec, lstr_bdg.gs_material_aver, &
									  lstr_bdg.gi_int_horario, ld_periodo)

	else
		iu_bdg_2002_nu.fnu_armar_sql(dw_datos_zona_geo, "TODOSCMD", ii_acumulado, &
									  is_tabla_bdg, ii_historicos,  &
									  fgci_todos, fgci_todos, fgci_todos, &
									  ll_tip_incidencia, lstr_bdg.gi_tension_afec, lstr_bdg.gs_material_aver, &
									  lstr_bdg.gi_int_horario, ld_periodo)

	end if

ELSEIF lstr_bdg.gi_puesto <> fgci_todos THEN

	ii_nivel = 1
	if is_donde="ZONA" then
		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.setcolumn("nro_centro")
		dw_ambito.settext(string(lstr_bdg.gi_centro))
		dw_ambito.AcceptText()
		iu_bdg_2002_nu.fnu_armar_sql(dw_datos_zona_geo, "CENTRO", ii_acumulado, &
									  is_tabla_bdg, ii_historicos,  &
									  lstr_bdg.gi_centro, fgci_todos, fgci_todos, &
									  ll_tip_incidencia, lstr_bdg.gi_tension_afec, lstr_bdg.gs_material_aver, &
									  lstr_bdg.gi_int_horario, ld_periodo)

	else				

		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.AcceptText()
		dw_ambito.setcolumn("nro_cmd")
		dw_ambito.settext(string(lstr_bdg.gi_cmd))
		dw_ambito.AcceptText()
		iu_bdg_2002_nu.fnu_armar_sql(dw_datos_zona_geo, "CMD", ii_acumulado, &
									  is_tabla_bdg, ii_historicos, &
									  fgci_todos, lstr_bdg.gi_cmd, fgci_todos, &
									  ll_tip_incidencia, lstr_bdg.gi_tension_afec, lstr_bdg.gs_material_aver, &
									  lstr_bdg.gi_int_horario, ld_periodo)


	end if

END IF

Parent.TriggerEvent("ue_obtener_datos")
ii_num_col_marca=0

// Inicializo el vector
Parent.fw_inicializo_vector()
Parent.fw_inicializo_vector2()

// Cargo el vector con todas las filas tra$$HEX1$$ed00$$ENDHEX$$das
IF ii_totales = 1 THEN
	ii_totales = 0
	rb_sum_totales.triggerEvent("clicked")
	li_ind = 1
	DO WHILE li_ind <= Integer(sle_fil_selec.text)
		iivec_fil_selec[li_ind] = li_ind
		li_ind ++
		ii_ind_vec2 ++
	LOOP
ELSE
	ii_totales = 1
	rb_sum_parciales.triggerEvent("clicked")
END IF
	
IF	ii_unidades = 0 THEN
	Parent.TriggerEvent("ue_a_porcentajes")
end if

dw_datos_zona_geo.SetRedraw(True)

// Habilito la DW de datos
dw_datos_zona_geo.Enabled = True
dw_ambito.SetRedraw (TRUE)
end event

type pb_sectores from picturebutton within w_4001_estadisticas_zonas_geografica
event clicked pbm_bnclicked
integer x = 3099
integer y = 660
integer width = 160
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "gra_sec.bmp"
string disabledname = "gra_sec1.bmp"
alignment htextalign = left!
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:	Clicked
//
/////////////////////////////////////////////////////////////////////////
int li_ind

dw_datos_zona_geo.SetRedraw(FALSE)
ii_tipo_graf=0

// Si est$$HEX2$$e1002000$$ENDHEX$$habilitada la datawindow de datos
IF dw_datos_zona_geo.Enabled = TRUE THEN
	
	// Seg$$HEX1$$fa00$$ENDHEX$$n lo que se est$$HEX2$$e9002000$$ENDHEX$$desplegando cambio la figura del bot$$HEX1$$f300$$ENDHEX$$n
	IF This.PictureName = "gra_sec.bmp" THEN
		ib_lista = FALSE 
		This.PictureName = "hfactu.bmp"
		
		// Deshabilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = FALSE
		rb_sum_totales.Enabled = FALSE
		
		im_estadistica.m_opciones.m_actualizar.Enabled = FALSE
		im_estadistica.m_opciones.m_historicos.Enabled = FALSE
		im_estadistica.m_opciones.m_incidenciacliente.Enabled = False
		im_estadistica.m_opciones.m_potenciaafectada.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiepi.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiebt.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_saifi.Enabled = False	
		im_estadistica.m_opciones.m_indicesdecalidad.m_saidi.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_caidi.Enabled = False
		im_estadistica.m_opciones.m_indicesdecalidad.m_asai.Enabled = False


		dw_ambito.Enabled = FALSE
		dw_criterio_seleccion.Enabled = FALSE
		gb_sumas.Enabled = FALSE
		pb_retroceder.Enabled = FALSE

		pb_graficar.Enabled = FALSE
		
		Parent.fw_graficar()
		gr_sectores.Show()
		st_valor_actual.Show()
		
	ELSE
		ib_lista = TRUE
		This.PictureName = "gra_sec.bmp"
		dw_datos_zona_geo.Show()
		gr_sectores.Hide()
		st_valor_actual.Hide()

		IF ii_totales = 0 THEN
			
			// Recorro la datawindow evaluando las filas selecionadas
			li_ind = 1
			DO WHILE li_ind < ii_ind_vec2
				dw_datos_zona_geo.SelectRow(iivec_fil_selec[li_ind], TRUE)
				dw_datos_zona_geo.SetItem(iivec_fil_selec[li_ind], "fila_marcada", 1)
				li_ind ++
			LOOP

		END IF
		
		// Habilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = TRUE
		im_estadistica.m_opciones.m_actualizar.Enabled = TRUE
		im_estadistica.m_opciones.m_historicos.Enabled = TRUE
		im_estadistica.m_opciones.m_incidenciacliente.Enabled = TRUE
		im_estadistica.m_opciones.m_potenciaafectada.Enabled = TRUE
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiepi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_tiebt.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_saifi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_saidi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_caidi.Enabled = True
		im_estadistica.m_opciones.m_indicesdecalidad.m_asai.Enabled = True
		
		dw_ambito.Enabled = TRUE
		dw_criterio_seleccion.Enabled = TRUE
		gb_sumas.Enabled= TRUE
		
		IF (dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
			dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
			dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos) OR ii_historicos = 1 then
			
			pb_retroceder.enabled = FALSE
		else
			pb_retroceder.enabled = TRUE
		end if
		
		rb_sum_totales.Enabled = TRUE
		
		pb_graficar.Enabled = TRUE

	END IF
ELSE
	gnv_msg.f_mensaje("AB01", "", "", OK!)
END IF

if not ib_habilitado then
	rb_sum_parciales.enabled = ib_habilitado
	rb_sum_totales.enabled = ib_habilitado
end if

dw_datos_zona_geo.SetRedraw(TRUE)
end event

type gb_sumas from groupbox within w_4001_estadisticas_zonas_geografica
integer x = 3077
integer y = 796
integer width = 416
integer height = 236
integer taborder = 70
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = " Sumas "
end type

type rb_sum_totales from radiobutton within w_4001_estadisticas_zonas_geografica
integer x = 3109
integer y = 860
integer width = 361
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Totales"
boolean checked = true
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	Clicked
//
/////////////////////////////////////////////////////////////////////////
int li_fila, li_cant_filas, li_ind


fw_des_column_selec()
IF ii_totales = 1 THEN return
dw_datos_zona_geo.setRedraw(false)
ii_totales = 1

li_cant_filas = dw_datos_zona_geo.RowCount()
li_fila = 1	
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",1)
	dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",1)
	li_fila ++
LOOP
	
//	Cargo el vector de filas seleccionadas con todas
sle_fil_selec.TextColor=4250
sle_fil_selec.text = String(li_cant_filas)
li_ind = 1
DO WHILE li_ind <= li_cant_filas
	iivec_fil_selec[li_ind] = li_ind
	li_ind ++
	ii_ind_vec2 ++
LOOP
	
IF ii_ind_vec <= 2 THEN
	// Deshabilito BOTONES graficar
	pb_graficar.Enabled = False
	pb_sectores.Enabled = False
ELSE
	// Habilito BOTONES graficar
	pb_graficar.Enabled = True
	IF ii_num_col_marca=1 THEN
		pb_sectores.Enabled = TRUE
	ELSE
		pb_sectores.Enabled = FALSE
	END IF
END IF

dw_datos_zona_geo.SetRowFocusIndicator(FOCUSRECT!)
dw_datos_zona_geo.setRedraw(true)
end event

type rb_sum_parciales from radiobutton within w_4001_estadisticas_zonas_geografica
integer x = 3109
integer y = 932
integer width = 361
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Parciales"
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	Clicked
//
/////////////////////////////////////////////////////////////////////////
int li_fila, li_cant_filas
string ls_visible, ls_no_visible


fw_des_column_selec()
IF ii_totales = 0 THEN return

dw_datos_zona_geo.setRedraw(false)
ii_totales = 0

dw_datos_zona_geo.SetRowFocusIndicator(OFF!)

li_cant_filas = dw_datos_zona_geo.RowCount()
li_fila = 1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila,False)
	dw_datos_zona_geo.SetItem(li_fila,"fila_marcada",0)
	dw_datos_zona_geo.SetItem(li_fila,"sumas_promedio",0)
	li_fila ++
LOOP

sle_fil_selec.TextColor=97920
sle_fil_selec.text = String(0)
	
// Inicializo el vector de filas seleccionadas
Parent.fw_inicializo_vector2()
	
// Inicializo el $$HEX1$$ed00$$ENDHEX$$ndice del vector de filas seleccionadas
ii_ind_vec2 = 1

// Deshabilito BOTONES graficar
pb_graficar.Enabled = False
pb_sectores.Enabled = False
dw_datos_zona_geo.AcceptText()
dw_datos_zona_geo.setRedraw(true)
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4001_estadisticas_zonas_geografica
integer x = 73
integer y = 116
integer width = 992
integer height = 384
integer taborder = 30
boolean border = false
end type

event post_itemchange;call super::post_itemchange;///////////////////////////////////////////////////////////////////////
//
// Event:  post_itemchange
//
///////////////////////////////////////////////////////////////////////

Parent.PostEvent("ue_resetear_datos")
end event

event itemchanged;call super::itemchanged;int li_ind, li_centro, li_cmd, li_mesa

parent.TriggerEvent("zonacmdVisible")
This.AcceptText()

// Cargo variables auxiliares para pasar como par$$HEX1$$e100$$ENDHEX$$metro
li_centro  = dw_ambito.GetItemNumber(1, "nro_centro")
li_cmd	  = dw_ambito.GetItemNumber(1, "nro_cmd")
li_mesa	  = dw_ambito.GetItemNumber(1, "nro_mesa")

// Si existe una zona seleccionada distinta de "todos" 
IF 	li_centro <> fgci_todos AND li_cmd =  fgci_todos AND li_mesa =  fgci_todos THEN
			is_donde="ZONA"
// Si existe un cmd seleccionado distinto de "Todos"
ELSEIF 	li_cmd <> fgci_todos AND li_mesa =  fgci_todos and li_centro = fgci_todos THEN
			is_donde="CMD"
END IF
IF li_centro = fgci_todos and li_cmd = fgci_todos and li_mesa = fgci_todos THEN
	pb_retroceder.Enabled = FALSE
END IF
end event

type dw_criterio_seleccion from u_bdg_2001_pr_filtro_estadis_zona_geogr within w_4001_estadisticas_zonas_geografica
event ue_post_itemchange pbm_custom60
integer x = 69
integer y = 4
integer width = 3365
integer height = 540
integer taborder = 10
boolean border = false
end type

event itemchanged;///////////////////////////////////////////////////////////////////////
//
//	Event: itemchanged
//
///////////////////////////////////////////////////////////////////////

string ls_columna
int li_valor 

ls_columna = this.getColumnName()
li_valor = integer(this.getText())

CHOOSE CASE ls_columna
	CASE "pa_zona_cmd"
		ii_zona_cmd=li_valor
		fw_des_column_selec()
		Parent.TriggerEvent("ue_actualizar")
		return	
	CASE "pa_unidades"
		ii_unidades = li_valor
		Parent.TriggerEvent("ue_a_porcentajes")
		return
	CASE "pa_acumulado_sn"
		ii_acumulado = li_valor		
		Parent.TriggerEvent("ue_actualizar")
		return
	CASE "ps_nom_mat_averiado"
			IF data = '010101' THEN
				This.setitem(1,"pa_material_averiado",'010101')
			END IF
END CHOOSE
Parent.TriggerEvent("ue_resetear_datos")
end event

type st_1 from statictext within w_4001_estadisticas_zonas_geografica
integer x = 2062
integer y = 360
integer width = 549
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "mano.cur"
long textcolor = 128
long backcolor = 67108864
string text = "Material Averiado"
boolean focusrectangle = false
end type

event clicked;string ls_codigo
string ls_descripcion

Open(w_2401_ayuda_materiales)
ls_codigo = gu_comunic.is_comunic.strval1
ls_descripcion = gu_comunic.is_comunic.strval2

IF Len(Trim(ls_codigo)) > 0 THEN
	dw_criterio_seleccion.setitem(1,"pa_material_averiado",ls_codigo)
	dw_criterio_seleccion.setitem(1,"ps_nom_mat_averiado", ls_descripcion)
end if
end event

type dw_datos_zona_geo from u_bdg_2002_pr_est_zona_geo1 within w_4001_estadisticas_zonas_geografica
integer y = 564
integer width = 2999
integer height = 1104
integer taborder = 40
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	doubleclicked
//
/////////////////////////////////////////////////////////////////////////

string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm
string ls_color_texto_mark
string ls_column, ls_column2, ls_column3, ls_column4, ls_nombre_columna
integer li_columna_foco

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)
ls_color_fondo_mark = String(65536*128+256*128+128)
ls_color_texto_mark = String(0)

this.SetRedraw(False)

ls_nombre_columna = This.Describe("#"+ String(ii_column_clicked) +".Name")
// Si cliqueo en una columna y no es la de "FECHA"
IF ii_column_clicked > 0  and ls_nombre_columna <> 'fecha' THEN

	// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona, avanzo.
	IF ls_nombre_columna = 'nom_cmd' OR ls_nombre_columna = 'nom_puesto' OR ls_nombre_columna = 'nom_centro' THEN
		// Si ya estoy en el nivel inferior no avanzo
		IF ii_totales = 1 THEN
			fw_des_column_selec()
			if ii_nivel = 3 then
				dw_datos_zona_geo.SetRedraw(True)
				this.SetRedraw(true)
				return
			end if
			
			Parent.TriggerEvent("ue_actualizar")
		END IF
		
	ELSE 
		ib_habilitado = rb_sum_parciales.enabled and rb_sum_totales.enabled
      // Si quiere marcar/desmarcar una columna
		ls_column = This.Describe("#"+ String(ii_column_clicked) +".Name")
		ls_column2 = ls_column + "_s"
		ls_column3 = ls_column + "_a"

		// Si estaba desmarcada, la marco
 		IF This.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_norm THEN
	
			This.Modify(ls_nombre_columna +".Background.Mode=0")
			This.Modify(ls_nombre_columna +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(ls_nombre_columna +".Text.Color="+ ls_color_texto_mark +" ")
			
			This.Modify(ls_nombre_columna + '_s' +".Background.Mode=0")
			This.Modify(ls_nombre_columna + '_s' +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(ls_nombre_columna + '_s' +".Text.Color="+ ls_color_texto_mark +" ")

			This.Modify(ls_nombre_columna + '_p' +".Background.Mode=0")
			This.Modify(ls_nombre_columna + '_p' +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(ls_nombre_columna + '_p' +".Text.Color="+ ls_color_texto_mark +" ")
			
			This.Modify(ls_nombre_columna + '_tot' +".Background.Mode=0")
			This.Modify(ls_nombre_columna + '_tot' +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(ls_nombre_columna + '_tot' +".Text.Color="+ ls_color_texto_mark +" ")

			Parent.fw_marcar_col(ii_column_clicked)
			ii_num_col_marca ++
						
		ELSEIF This.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN

			// Si estaba marcada, la desmarco	
			This.Modify(ls_nombre_columna +".Background.Mode=1")
			This.Modify(ls_nombre_columna +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(ls_nombre_columna +".Text.Color="+ ls_color_texto_norm +" ")
	
			This.Modify(ls_nombre_columna + '_s' +".Background.Mode=1")
			This.Modify(ls_nombre_columna + '_s' +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(ls_nombre_columna + '_s' +".Text.Color="+ ls_color_texto_norm +" ")

			This.Modify(ls_nombre_columna + '_p' +".Background.Mode=1")
			This.Modify(ls_nombre_columna + '_p' +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(ls_nombre_columna + '_p' +".Text.Color="+ ls_color_texto_norm +" ")
			
			This.Modify(ls_nombre_columna + '_tot' +".Background.Mode=0")
			This.Modify(ls_nombre_columna + '_tot' +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(ls_nombre_columna + '_tot' +".Text.Color="+ ls_color_texto_norm +" ")

			Parent.fw_desmarcar_col(ii_column_clicked)
			ii_num_col_marca --
					
		END IF

		Parent.TriggerEvent("ue_botones")

	END IF
END IF

this.SetRedraw(True)
end event

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	clicked
//
/////////////////////////////////////////////////////////////////////////
ii_fila_clicked = row
ii_column_clicked = This.GetClickedColumn() 
long ii
ii=ii_column_clicked
// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona
IF ii_column_clicked = fw_obtener_numero_columna("nom_centro") OR &
	ii_column_clicked = fw_obtener_numero_columna("nom_cmd") OR &
	ii_column_clicked = fw_obtener_numero_columna("nom_puesto") OR &
	ii_column_clicked = fw_obtener_numero_columna("fecha") THEN
	
	IF ii_fila_clicked > 0 THEN
		
		// Si est$$HEX2$$e1002000$$ENDHEX$$en TOTALES
		IF ii_totales = 1 THEN
			dw_ambito.SetRedraw(False)
			IF Long(This.Describe("nom_centro_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_centro")
				dw_ambito.settext(string(this.GetItemNumber(ii_fila_clicked,"nro_centro")))
				dw_ambito.Accepttext()
			ELSEIF Long(This.Describe("nom_cmd_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_cmd")
				dw_ambito.settext(string(this.GetItemNumber(ii_fila_clicked,"nro_cmd")))
				dw_ambito.Accepttext()
			ELSEIF Long(This.Describe("nom_puesto_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_mesa")
				dw_ambito.settext(string(this.GetItemNumber(ii_fila_clicked,"nro_mesa")))
				dw_ambito.AcceptText()
			END IF
			
		// Si est$$HEX2$$e1002000$$ENDHEX$$en PARCIALES
		ELSE
			IF This.IsSelected(ii_fila_clicked) THEN
				This.SelectRow(ii_fila_clicked,False)	// deselecciono
				This.SetItem(ii_fila_clicked,"fila_marcada",0)
				// Clientes-Potencias. inf. para parciales //MATO
				sle_fil_selec.TextColor=97920
				sle_fil_selec.text = String(Integer(sle_fil_selec.text) - 1)
            
  				// Cargo en el vector la fila seleccionada
				int li_ind
				li_ind = 1
				ii_ind_vec2 --
				DO WHILE li_ind <= ii_ind_vec2
					IF iivec_fil_selec[li_ind] = ii_fila_clicked THEN
						iivec_fil_selec[li_ind] = iivec_fil_selec[ii_ind_vec2] 
						iivec_fil_selec[ii_ind_vec2] = 0
						EXIT
					END IF
					li_ind ++
				LOOP
				
			ELSE
				This.SelectRow(ii_fila_clicked,True)	// selecciono
				This.SetItem(ii_fila_clicked,"fila_marcada",1)
				sle_fil_selec.TextColor=97920
				sle_fil_selec.text = String(Integer(sle_fil_selec.text) + 1)

				// Cargo en el vector la fila seleccionada
				iivec_fil_selec[ii_ind_vec2] = ii_fila_clicked
				ii_ind_vec2 ++
				
			END IF
			This.AcceptText()
		END IF

			Parent.TriggerEvent("ue_botones")

			dw_ambito.SetRedraw(True)
	END IF
END IF

end event

event constructor;call super::constructor;/////////////////////////////////////////////////////////////////////////
//
// Event:  	constructor
//
/////////////////////////////////////////////////////////////////////////

//This.SetRowFocusIndicator(FOCUSRECT!)

end event

event ue_mover_borde;//
end event

event ue_key_down;//
end event

event retrieveend;call super::retrieveend;int li_fila
double ld_valor


FOR li_fila=1 TO this.RowCount()
	ld_valor = this.GetItemNumber(li_fila,'tiepi_propio_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'tiepi_propio',ld_valor)

	ld_valor = this.GetItemNumber(li_fila,'tiebt_propio_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'tiebt_propio',ld_valor)
	
	ld_valor = this.GetItemNumber(li_fila,'tiepi_aportado_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'tiepi_aportado',ld_valor)
	
	ld_valor = this.GetItemNumber(li_fila,'tiebt_aportado_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'tiebt_aportado',ld_valor)

	ld_valor = this.GetItemNumber(li_fila,'saifi_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'saifi',ld_valor)
	
	ld_valor = this.GetItemNumber(li_fila,'saidi_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'saidi',ld_valor)

	ld_valor = this.GetItemNumber(li_fila,'caidi_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'caidi',ld_valor)
	
	ld_valor = this.GetItemNumber(li_fila,'asai_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'asai',ld_valor)
NEXT

end event

type gr_grafica from graph within w_4001_estadisticas_zonas_geografica
integer x = 9
integer y = 564
integer width = 2981
integer height = 1096
grgraphtype graphtype = col3dobjgraph!
long backcolor = 16777215
long shadecolor = 8355711
integer spacing = 100
integer elevation = 20
integer rotation = -20
integer perspective = 2
integer depth = 100
grlegendtype legend = atbottom!
boolean focusrectangle = false
grsorttype seriessort = ascending!
grsorttype categorysort = ascending!
end type

event other;///////////////////////////////////////////////////////////////////////
//
//	Event:	other
//
///////////////////////////////////////////////////////////////////////
integer SeriesNum, DataNum
double value
grObjectType ObjectType
string SeriesName, ValueAsString

ObjectType = gr_grafica.ObjectAtPointer(SeriesNum, DataNum)
IF ObjectType = TypeData! THEN

	Value = gr_grafica.GetData(seriesNum, DataNum)
	ValueAsString = string(round(Value,2))
	IF ii_unidades = 0 THEN
		st_valor_actual.Text = gr_grafica.SeriesName(SeriesNum)+" : " + ValueAsString + " %"
	ELSE
		st_valor_actual.Text = gr_grafica.SeriesName(SeriesNum)+" : " + ValueAsString
	END IF
ELSE
	st_valor_actual.Text = " "
END IF
end event

on gr_grafica.create
TitleDispAttr = create grDispAttr
LegendDispAttr = create grDispAttr
PieDispAttr = create grDispAttr
Series = create grAxis
Series.DispAttr = create grDispAttr
Series.LabelDispAttr = create grDispAttr
Category = create grAxis
Category.DispAttr = create grDispAttr
Category.LabelDispAttr = create grDispAttr
Values = create grAxis
Values.DispAttr = create grDispAttr
Values.LabelDispAttr = create grDispAttr
TitleDispAttr.TextSize=-12
TitleDispAttr.Weight=700
TitleDispAttr.FaceName="Times New Roman"
TitleDispAttr.FontCharSet=DefaultCharSet!
TitleDispAttr.FontFamily=Roman!
TitleDispAttr.FontPitch=Variable!
TitleDispAttr.Alignment=Center!
TitleDispAttr.BackColor=553648127
TitleDispAttr.Format="[General]"
TitleDispAttr.DisplayExpression="title"
Category.Label="(None)"
Category.AutoScale=true
Category.ShadeBackEdge=true
Category.SecondaryLine=transparent!
Category.MajorGridLine=transparent!
Category.MinorGridLine=transparent!
Category.DropLines=transparent!
Category.OriginLine=transparent!
Category.MajorTic=Outside!
Category.DataType=adtText!
Category.DispAttr.TextSize=-9
Category.DispAttr.Weight=400
Category.DispAttr.FaceName="Times New Roman"
Category.DispAttr.FontCharSet=DefaultCharSet!
Category.DispAttr.FontFamily=Roman!
Category.DispAttr.FontPitch=Variable!
Category.DispAttr.Alignment=Center!
Category.DispAttr.BackColor=553648127
Category.DispAttr.Format="[General]"
Category.DispAttr.DisplayExpression="category"
Category.LabelDispAttr.TextSize=-9
Category.LabelDispAttr.Weight=400
Category.LabelDispAttr.FaceName="Times New Roman"
Category.LabelDispAttr.FontCharSet=DefaultCharSet!
Category.LabelDispAttr.FontFamily=Roman!
Category.LabelDispAttr.FontPitch=Variable!
Category.LabelDispAttr.Alignment=Center!
Category.LabelDispAttr.BackColor=553648127
Category.LabelDispAttr.Format="[General]"
Category.LabelDispAttr.DisplayExpression="categoryaxislabel"
Values.Label="(None)"
Values.AutoScale=true
Values.SecondaryLine=transparent!
Values.MajorGridLine=transparent!
Values.MinorGridLine=transparent!
Values.DropLines=transparent!
Values.MajorTic=Outside!
Values.DataType=adtDouble!
Values.DispAttr.TextSize=-9
Values.DispAttr.Weight=400
Values.DispAttr.FaceName="Times New Roman"
Values.DispAttr.FontCharSet=DefaultCharSet!
Values.DispAttr.FontFamily=Roman!
Values.DispAttr.FontPitch=Variable!
Values.DispAttr.Alignment=Right!
Values.DispAttr.BackColor=553648127
Values.DispAttr.Format="[General]"
Values.DispAttr.DisplayExpression="value"
Values.LabelDispAttr.TextSize=-9
Values.LabelDispAttr.Weight=400
Values.LabelDispAttr.FaceName="Times New Roman"
Values.LabelDispAttr.FontCharSet=DefaultCharSet!
Values.LabelDispAttr.FontFamily=Roman!
Values.LabelDispAttr.FontPitch=Variable!
Values.LabelDispAttr.Alignment=Center!
Values.LabelDispAttr.BackColor=553648127
Values.LabelDispAttr.Format="[General]"
Values.LabelDispAttr.DisplayExpression="valuesaxislabel"
Values.LabelDispAttr.Escapement=900
Series.Label="(None)"
Series.AutoScale=true
Series.SecondaryLine=transparent!
Series.MajorGridLine=transparent!
Series.MinorGridLine=transparent!
Series.DropLines=transparent!
Series.OriginLine=transparent!
Series.MajorTic=Outside!
Series.DataType=adtText!
Series.DispAttr.Weight=400
Series.DispAttr.FaceName="MS Sans Serif"
Series.DispAttr.FontCharSet=DefaultCharSet!
Series.DispAttr.FontFamily=Swiss!
Series.DispAttr.FontPitch=Variable!
Series.DispAttr.BackColor=536870912
Series.DispAttr.Format="[General]"
Series.DispAttr.DisplayExpression="series"
Series.DispAttr.AutoSize=true
Series.LabelDispAttr.Weight=400
Series.LabelDispAttr.FaceName="MS Sans Serif"
Series.LabelDispAttr.FontCharSet=DefaultCharSet!
Series.LabelDispAttr.FontFamily=Swiss!
Series.LabelDispAttr.FontPitch=Variable!
Series.LabelDispAttr.Alignment=Center!
Series.LabelDispAttr.BackColor=536870912
Series.LabelDispAttr.Format="[General]"
Series.LabelDispAttr.DisplayExpression="seriesaxislabel"
Series.LabelDispAttr.AutoSize=true
LegendDispAttr.TextSize=-9
LegendDispAttr.Weight=400
LegendDispAttr.FaceName="Times New Roman"
LegendDispAttr.FontCharSet=DefaultCharSet!
LegendDispAttr.FontFamily=Roman!
LegendDispAttr.FontPitch=Variable!
LegendDispAttr.BackColor=553648127
LegendDispAttr.Format="[General]"
LegendDispAttr.DisplayExpression="series"
PieDispAttr.Weight=400
PieDispAttr.FaceName="MS Sans Serif"
PieDispAttr.FontCharSet=DefaultCharSet!
PieDispAttr.FontFamily=Swiss!
PieDispAttr.FontPitch=Variable!
PieDispAttr.BackColor=536870912
PieDispAttr.Format="[General]"
PieDispAttr.DisplayExpression="if(seriescount > 1, series,string(percentofseries,~"0.00%~"))"
PieDispAttr.AutoSize=true
end on

on gr_grafica.destroy
destroy TitleDispAttr
destroy LegendDispAttr
destroy PieDispAttr
destroy Series.DispAttr
destroy Series.LabelDispAttr
destroy Series
destroy Category.DispAttr
destroy Category.LabelDispAttr
destroy Category
destroy Values.DispAttr
destroy Values.LabelDispAttr
destroy Values
end on

type gr_sectores from graph within w_4001_estadisticas_zonas_geografica
event other pbm_other
event create ( )
event destroy ( )
integer x = 9
integer y = 564
integer width = 2981
integer height = 1096
grgraphtype graphtype = pie3d!
long backcolor = 16777215
long shadecolor = 8355711
integer spacing = 100
integer elevation = -60
integer rotation = -20
integer perspective = 1
integer depth = 50
grlegendtype legend = atleft!
boolean focusrectangle = false
grsorttype seriessort = ascending!
grsorttype categorysort = ascending!
end type

event other;/////////////////////////////////////////////////////////////////////////
//
// Evento:  	other
//
/////////////////////////////////////////////////////////////////////////

integer SeriesNum, DataNum
double value
grObjectType ObjectType
string SeriesName, ValueAsString

ObjectType = gr_sectores.ObjectAtPointer(SeriesNum, DataNum)

IF ObjectType = TypeData! THEN

	Value = gr_sectores.GetData(seriesNum, DataNum)
	ValueAsString = string(round(Value,2))
	IF ii_unidades = 0 THEN
		st_valor_actual.Text = gr_sectores.SeriesName(SeriesNum)+" : " + ValueAsString + " %"
	ELSE
		st_valor_actual.Text = gr_sectores.SeriesName(SeriesNum)+" : " + ValueAsString
	END IF
ELSE
	st_valor_actual.Text = gr_sectores.SeriesName(1)
END IF
end event

on gr_sectores.create
TitleDispAttr = create grDispAttr
LegendDispAttr = create grDispAttr
PieDispAttr = create grDispAttr
Series = create grAxis
Series.DispAttr = create grDispAttr
Series.LabelDispAttr = create grDispAttr
Category = create grAxis
Category.DispAttr = create grDispAttr
Category.LabelDispAttr = create grDispAttr
Values = create grAxis
Values.DispAttr = create grDispAttr
Values.LabelDispAttr = create grDispAttr
TitleDispAttr.TextSize=-12
TitleDispAttr.Weight=700
TitleDispAttr.FaceName="Times New Roman"
TitleDispAttr.FontCharSet=DefaultCharSet!
TitleDispAttr.FontFamily=Roman!
TitleDispAttr.FontPitch=Variable!
TitleDispAttr.Alignment=Center!
TitleDispAttr.BackColor=553648127
TitleDispAttr.Format="[General]"
TitleDispAttr.DisplayExpression="title"
Category.Label="(None)"
Category.AutoScale=true
Category.ShadeBackEdge=true
Category.SecondaryLine=transparent!
Category.MajorGridLine=transparent!
Category.MinorGridLine=transparent!
Category.DropLines=transparent!
Category.OriginLine=transparent!
Category.MajorTic=Outside!
Category.DataType=adtText!
Category.DispAttr.TextSize=-9
Category.DispAttr.Weight=400
Category.DispAttr.FaceName="Times New Roman"
Category.DispAttr.FontCharSet=DefaultCharSet!
Category.DispAttr.FontFamily=Roman!
Category.DispAttr.FontPitch=Variable!
Category.DispAttr.Alignment=Center!
Category.DispAttr.BackColor=553648127
Category.DispAttr.Format="[General]"
Category.DispAttr.DisplayExpression="category"
Category.LabelDispAttr.TextSize=-9
Category.LabelDispAttr.Weight=400
Category.LabelDispAttr.FaceName="Times New Roman"
Category.LabelDispAttr.FontCharSet=DefaultCharSet!
Category.LabelDispAttr.FontFamily=Roman!
Category.LabelDispAttr.FontPitch=Variable!
Category.LabelDispAttr.Alignment=Center!
Category.LabelDispAttr.BackColor=553648127
Category.LabelDispAttr.Format="[General]"
Category.LabelDispAttr.DisplayExpression="categoryaxislabel"
Values.Label="(None)"
Values.AutoScale=true
Values.SecondaryLine=transparent!
Values.MajorGridLine=transparent!
Values.MinorGridLine=transparent!
Values.DropLines=transparent!
Values.MajorTic=Outside!
Values.DataType=adtDouble!
Values.DispAttr.TextSize=-9
Values.DispAttr.Weight=400
Values.DispAttr.FaceName="Times New Roman"
Values.DispAttr.FontCharSet=DefaultCharSet!
Values.DispAttr.FontFamily=Roman!
Values.DispAttr.FontPitch=Variable!
Values.DispAttr.Alignment=Right!
Values.DispAttr.BackColor=553648127
Values.DispAttr.Format="[General]"
Values.DispAttr.DisplayExpression="value"
Values.LabelDispAttr.TextSize=-9
Values.LabelDispAttr.Weight=400
Values.LabelDispAttr.FaceName="Times New Roman"
Values.LabelDispAttr.FontCharSet=DefaultCharSet!
Values.LabelDispAttr.FontFamily=Roman!
Values.LabelDispAttr.FontPitch=Variable!
Values.LabelDispAttr.Alignment=Center!
Values.LabelDispAttr.BackColor=553648127
Values.LabelDispAttr.Format="[General]"
Values.LabelDispAttr.DisplayExpression="valuesaxislabel"
Values.LabelDispAttr.Escapement=900
Series.Label="(None)"
Series.AutoScale=true
Series.SecondaryLine=transparent!
Series.MajorGridLine=transparent!
Series.MinorGridLine=transparent!
Series.DropLines=transparent!
Series.OriginLine=transparent!
Series.MajorTic=Outside!
Series.DataType=adtText!
Series.DispAttr.Weight=400
Series.DispAttr.FaceName="MS Sans Serif"
Series.DispAttr.FontCharSet=DefaultCharSet!
Series.DispAttr.FontFamily=Swiss!
Series.DispAttr.FontPitch=Variable!
Series.DispAttr.BackColor=536870912
Series.DispAttr.Format="[General]"
Series.DispAttr.DisplayExpression="series"
Series.DispAttr.AutoSize=true
Series.LabelDispAttr.Weight=400
Series.LabelDispAttr.FaceName="MS Sans Serif"
Series.LabelDispAttr.FontCharSet=DefaultCharSet!
Series.LabelDispAttr.FontFamily=Swiss!
Series.LabelDispAttr.FontPitch=Variable!
Series.LabelDispAttr.Alignment=Center!
Series.LabelDispAttr.BackColor=536870912
Series.LabelDispAttr.Format="[General]"
Series.LabelDispAttr.DisplayExpression="seriesaxislabel"
Series.LabelDispAttr.AutoSize=true
LegendDispAttr.TextSize=-9
LegendDispAttr.Weight=400
LegendDispAttr.FaceName="Times New Roman"
LegendDispAttr.FontCharSet=DefaultCharSet!
LegendDispAttr.FontFamily=Roman!
LegendDispAttr.FontPitch=Variable!
LegendDispAttr.BackColor=553648127
LegendDispAttr.Format="[General]"
LegendDispAttr.DisplayExpression="category"
PieDispAttr.TextSize=-9
PieDispAttr.Weight=400
PieDispAttr.FaceName="Times New Roman"
PieDispAttr.FontCharSet=DefaultCharSet!
PieDispAttr.FontFamily=Swiss!
PieDispAttr.FontPitch=Variable!
PieDispAttr.BackColor=553648127
PieDispAttr.Format="[General]"
PieDispAttr.DisplayExpression="if(seriescount > 1, series,string(percentofseries,~"0.00%~"))"
end on

on gr_sectores.destroy
destroy TitleDispAttr
destroy LegendDispAttr
destroy PieDispAttr
destroy Series.DispAttr
destroy Series.LabelDispAttr
destroy Series
destroy Category.DispAttr
destroy Category.LabelDispAttr
destroy Category
destroy Values.DispAttr
destroy Values.LabelDispAttr
destroy Values
end on

type dw_impresion from datawindow within w_4001_estadisticas_zonas_geografica
boolean visible = false
integer x = 55
integer y = 1028
integer width = 398
integer height = 160
integer taborder = 90
boolean bringtotop = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_valor_actual from statictext within w_4001_estadisticas_zonas_geografica
integer x = 2245
integer y = 568
integer width = 745
integer height = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 8421376
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
long bordercolor = 16777215
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_4001_estadisticas_zonas_geografica
integer x = 3081
integer y = 1496
integer width = 443
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Proyecciones"
end type

event clicked;//***************************************
//**  OSGI 2001.1  	20/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
s_grafica_ratios lstr_ratios 

lstr_ratios.centro = dw_ambito.GetItemNumber(1,"nro_centro")
lstr_ratios.ratios = ii_tiepi_tiebt

IF is_tabla_bdg = 'GI_INCIDENCIA_BDG' THEN
	gu_comunic.is_comunic.accion_llamada = 'ZONASGEO'
ELSE
	gu_comunic.is_comunic.accion_llamada = 'RELEVANTES'
END IF

OpenWithParm(w_grafica_proyeccion, lstr_ratios)
//***************************************
//**  OSGI 2001.1  	20/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type st_2 from statictext within w_4001_estadisticas_zonas_geografica
integer x = 3067
integer y = 1484
integer width = 466
integer height = 112
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type


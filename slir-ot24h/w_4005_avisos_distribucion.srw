HA$PBExportHeader$w_4005_avisos_distribucion.srw
forward
global type w_4005_avisos_distribucion from w_sgigenerica
end type
type sle_fil_selec from singlelineedit within w_4005_avisos_distribucion
end type
type st_fil_selec from statictext within w_4005_avisos_distribucion
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4005_avisos_distribucion
end type
type rb_sum_totales from radiobutton within w_4005_avisos_distribucion
end type
type rb_sum_parciales from radiobutton within w_4005_avisos_distribucion
end type
type gb_sumas from groupbox within w_4005_avisos_distribucion
end type
type pb_retroceder from picturebutton within w_4005_avisos_distribucion
end type
type pb_graficar from picturebutton within w_4005_avisos_distribucion
end type
type pb_sectores from picturebutton within w_4005_avisos_distribucion
end type
type dw_criterio_seleccion from u_bdg_2006_pr_filtro_avisos_zona_geogr within w_4005_avisos_distribucion
end type
type st_valor_actual from statictext within w_4005_avisos_distribucion
end type
type dw_datos_zona_geo from u_bdg_2006_pr_avisos_distrib within w_4005_avisos_distribucion
end type
type gr_sectores from graph within w_4005_avisos_distribucion
end type
type gr_grafica from graph within w_4005_avisos_distribucion
end type
type dw_impresion from datawindow within w_4005_avisos_distribucion
end type
end forward

global type w_4005_avisos_distribucion from w_sgigenerica
integer x = 5
integer y = 260
integer width = 3657
integer height = 1880
string title = "OPEN SGI - Types of Complaints. "
string menuname = "m_avisos_distribucion"
boolean minbox = false
boolean maxbox = false
string icon = "consavi.ico"
event ue_obtener_datos pbm_custom70
event ue_actualizar pbm_custom71
event ue_a_cantidades pbm_custom74
event ue_a_porcentajes pbm_custom75
event ue_resetear_datos pbm_custom60
event ue_historicos pbm_custom61
event ue_imprimir pbm_custom62
event ue_botones pbm_custom09
event zonacmdvisible ( )
sle_fil_selec sle_fil_selec
st_fil_selec st_fil_selec
dw_ambito dw_ambito
rb_sum_totales rb_sum_totales
rb_sum_parciales rb_sum_parciales
gb_sumas gb_sumas
pb_retroceder pb_retroceder
pb_graficar pb_graficar
pb_sectores pb_sectores
dw_criterio_seleccion dw_criterio_seleccion
st_valor_actual st_valor_actual
dw_datos_zona_geo dw_datos_zona_geo
gr_sectores gr_sectores
gr_grafica gr_grafica
dw_impresion dw_impresion
end type
global w_4005_avisos_distribucion w_4005_avisos_distribucion

type variables
integer ii_column_clicked, ii_ind_vec, ii_ind_vec2
integer ii_width_dw = 2917
// Si estoy viendo cantidades o porcentajes
int ii_unidades

// Si se desean los acumulados
int ii_acumulado

// Ver las sumas totales o parciales
int ii_totales

// Indicador de hist$$HEX1$$f300$$ENDHEX$$rico o actuales
int ii_historicos

// Objeto de n$$HEX1$$fa00$$ENDHEX$$cleo de la datawindow
u_bdg_2006_nu_avisos_distribucion iu_bdg_2006_nu

// Vector con las columnas seleccionadas
integer	iivec_col_selec[]

// Vector de filas seleccionadas
integer	iivec_fil_selec[]

u_gen_nu_gra_0001 iu_gen_gra

// Nivel en que se encuentra el listado
int ii_nivel

// Variable que indica que se esta desplegando 
// True = lista , False = Grafica
 boolean ib_lista
int ii_zona_cmd
string is_donde

// gr$$HEX1$$e100$$ENDHEX$$fico de barras o de sectores
int ii_tipo_graf

// n$$HEX1$$fa00$$ENDHEX$$mero de columnas seleccionadas
// si s$$HEX1$$f300$$ENDHEX$$lo hay 1 habilitamos gr$$HEX1$$e100$$ENDHEX$$f de sectores
int ii_num_col_marca

boolean ib_habilitado = false
boolean ib_primera_vez = true
end variables

forward prototypes
public function integer fw_graficar ()
public function integer fw_desmarcar_col (integer pi_nro_col)
public function integer fw_marcar_col (integer pi_nro_col)
public function integer fw_inicializo_vector ()
public function boolean fw_ninguna_marcada ()
public function integer fw_inicializo_vector2 ()
public function integer fw_obtener_numero_columna (string ps_nombre)
public subroutine fw_des_colum_selec ()
public subroutine fw_seleccionar_todo ()
public function integer fw_validar_periodo ()
public subroutine fw_fondo_transparente ()
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

dw_criterio_seleccion.Accepttext()
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
dw_datos_zona_geo.Retrieve()


//// Si no recupera registros, despliega un mensaje
IF dw_datos_zona_geo.RowCount() = 0 THEN
	pb_retroceder.enabled = FALSE
	gnv_msg.f_mensaje("AB02", "", "", OK!)

//Ajuste de la barra <Scroll> Vertical	para no ocupar espacio en Dw.
ELSEIF dw_datos_zona_geo.RowCount() > 7 THEN
   dw_datos_zona_geo.WIDTH = ( ii_width_dw + 75)
	dw_datos_zona_geo.VScrollBar = true
ELSE
	dw_datos_zona_geo.WIDTH =  ii_width_dw
	dw_datos_zona_geo.VScrollBar = false
END IF

if not ib_primera_vez then this.setredraw(true)
ib_primera_vez = false
RETURN
end event

event ue_actualizar;/////////////////////////////////////////////////////////////////////////
//
// Evento:  	ue_actualizar
//
// Objetivo: 	Recupera los datos
//
//                       Responsable  	Fecha    	Actuaci$$HEX1$$f300$$ENDHEX$$n
//                       -----------   ---------- 	--------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: AD			   20/08/1996	Versi$$HEX1$$f300$$ENDHEX$$n Original
//                       MATO          14/01/1999  Pruebas Vol. 
//
/////////////////////////////////////////////////////////////////////////

int li_ind, li_centro, li_cmd, li_mesa, li_int_horario
date ld_periodo
string ls_ambito
SetPointer(HourGlass!)

dw_datos_zona_geo.SetRedraw(FALSE)
dw_criterio_seleccion.AcceptText()

// Cargo variables auxiliares para pasar como par$$HEX1$$e100$$ENDHEX$$metro
li_centro  = dw_ambito.GetItemNumber(1, "nro_centro")
li_cmd	  = dw_ambito.GetItemNumber(1, "nro_cmd")
li_mesa	  = dw_ambito.GetItemNumber(1, "nro_mesa")
ld_periodo = dw_criterio_seleccion.GetItemDate(1, "pa_periodo")
li_int_horario = dw_criterio_seleccion.GetItemNumber(1, "pa_int_horario")

// Si todos tienen "Todos"
IF li_centro = fgci_todos AND li_cmd = fgci_todos AND li_mesa = fgci_todos THEN
	ii_nivel = 0
	if ii_zona_cmd=1 then
		ls_ambito = 'TODOS'
   else
		ls_ambito = 'TODOSCMD'
	end if
// Si existe un centro seleccionado
ELSEIF 	li_centro <> fgci_todos AND li_cmd =  fgci_todos AND li_mesa =  fgci_todos THEN
			ls_ambito = 'CENTRO'
			ii_nivel = 1
			is_donde="ZONA"
// Si existe un cmd seleccionado distinto de "Todos"
ELSEIF 	li_cmd <> fgci_todos AND li_mesa =  fgci_todos THEN
			ii_nivel = 1
			ls_ambito = 'CMD'
			is_donde="CMD"
// Si existe una mesa seleccionada
ELSEIF li_mesa <> fgci_todos THEN
			ii_nivel = 2
			ls_ambito = 'MESA'
END IF

iu_bdg_2006_nu.fnu_armar_sql(dw_datos_zona_geo, ls_ambito, ii_acumulado, &
										ii_historicos, ii_unidades, li_centro, li_cmd, &
										li_mesa, ld_periodo, li_int_horario)


IF ii_nivel = 0 or ii_historicos = 1 THEN
	pb_retroceder.Enabled = FALSE
ELSE
	pb_retroceder.Enabled = TRUE
END IF

This.TriggerEvent("ue_obtener_datos")

// Inicializo los vectores
	This.fw_inicializo_vector()
	This.fw_inicializo_vector2()
	
// Cargo el vector con todas las filas tra$$HEX1$$ed00$$ENDHEX$$das
IF ii_totales = 1 THEN
	sle_fil_selec.TextColor=4250
	sle_fil_selec.Text = String(dw_datos_zona_geo.RowCount())
	li_ind = 1
	//AG. Matorra (mostrar totales o parciales) 
	ii_totales = 0 
	rb_sum_totales.Triggerevent("clicked")
ELSE
	//AG. Matorra (mostrar totales o parciales) 
	ii_totales = 1 
	rb_sum_parciales.Triggerevent("clicked")
	sle_fil_selec.TextColor=97920
	sle_fil_selec.text = String(0)		
END IF

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

dw_datos_zona_geo.SelectRow(0, FALSE)
ii_num_col_marca=0
This.TriggerEvent("ue_botones")

dw_datos_zona_geo.SetRedraw(TRUE)
end event

event ue_a_porcentajes;/////////////////////////////////////////////////////////////////////////
//
// Event:  	ue_a_porcentajes
//
// Objetivo: 	Calcular los porcentajes
//
/////////////////////////////////////////////////////////////////////////

// Recorro todas las columnas de la DW y para cada una de ellas tomo su 
// suma como el 100 %, calculando el porcentaje correspondiente a cada fila

int	li_fila, li_col, li_cant_filas, li_totales_ant
decimal	ld_porc_fil_col
decimal	ld_aviso_c_inc, ld_aviso_s_inc_alim, ld_aviso_s_inc_otros, &
		ld_avisos_improc
int	li_totales

SetPointer(HourGlass!)
fw_des_colum_selec()
fw_inicializo_vector()
//fw_inicializo_vector2()

dw_datos_zona_geo.SetRedraw(FALSE)
li_cant_filas = dw_datos_zona_geo.RowCount()

IF li_cant_filas = 0 THEN
	return
END IF

// Si quiere ver las cantidades, traigo los datos de nuevo
if ii_unidades = 1 then
	this.triggerEvent("ue_actualizar")
	return
end if

//// Indico que desea ver las sumas
//for li_fila = 1 to li_cant_filas
//	dw_datos_zona_geo.setItem(li_fila,"sumas_promedio",1)
//next

// Si estoy en parciales muestro moment$$HEX1$$e100$$ENDHEX$$neamente los totales para calcular
li_totales = ii_totales
if ii_totales = 0 then
	rb_sum_totales.TriggerEvent("clicked")
	rb_sum_totales.checked = TRUE
	for li_fila = 1 to li_cant_filas
		dw_datos_zona_geo.setItem(li_fila,"fila_marcada",1)
	next
end if

dw_datos_zona_geo.AcceptText()

// Tomo los totales que son el 100%
ld_aviso_c_inc 		= 		dw_datos_zona_geo.GetItemDecimal(1, "aviso_c_inc_s")
ld_aviso_s_inc_alim	= 		dw_datos_zona_geo.GetItemDecimal(1, "aviso_s_inc_alim_s")
ld_aviso_s_inc_otros	=		dw_datos_zona_geo.GetItemDecimal(1, "aviso_s_inc_otros_s")
ld_avisos_improc = 			dw_datos_zona_geo.GetItemDecimal(1, "avisos_improc_s")

FOR li_fila = 1 TO li_cant_filas
	
	// Columna "aviso_c_inc"
	IF ld_aviso_c_inc <> 0 THEN
		ld_porc_fil_col = dw_datos_zona_geo.GetItemDecimal(li_fila, "aviso_c_inc") * 100 / ld_aviso_c_inc
	ELSE
		ld_porc_fil_col = 0
	END IF
	dw_datos_zona_geo.SetItem(li_fila, "aviso_c_inc", Round(ld_porc_fil_col,4))
	
	// Columna "aviso_s_inc_alim"
	IF ld_aviso_s_inc_alim <> 0 THEN
		ld_porc_fil_col = dw_datos_zona_geo.GetItemDecimal(li_fila, "aviso_s_inc_alim") * 100 / ld_aviso_s_inc_alim
	ELSE
		ld_porc_fil_col = 0
	END IF
	dw_datos_zona_geo.SetItem(li_fila, "aviso_s_inc_alim", Round(ld_porc_fil_col,4))
	
	// Columna "aviso_s_inc_otros"
	IF ld_aviso_s_inc_otros <> 0 THEN
		ld_porc_fil_col = dw_datos_zona_geo.GetItemDecimal(li_fila, "aviso_s_inc_otros") * 100 / ld_aviso_s_inc_otros
	ELSE
		ld_porc_fil_col = 0
	END IF
	dw_datos_zona_geo.SetItem(li_fila, "aviso_s_inc_otros", Round(ld_porc_fil_col,4))
	
	// Columna "avisos_improc"
	IF ld_avisos_improc <> 0 THEN
		ld_porc_fil_col = dw_datos_zona_geo.GetItemDecimal(li_fila, "avisos_improc") * 100 / ld_avisos_improc
	ELSE
		ld_porc_fil_col = 0
	END IF
	dw_datos_zona_geo.SetItem(li_fila, "avisos_improc", Round(ld_porc_fil_col,4))
	
NEXT

//// Si estaba en parciales, restauro estado
//if li_totales = 0 then
//	rb_sum_parciales.TriggerEvent("clicked")
//	rb_sum_parciales.checked = TRUE
//end if

dw_datos_zona_geo.SetRedraw(TRUE)
end event

event ue_resetear_datos;call super::ue_resetear_datos;/////////////////////////////////////////////////////////////////////////
//
// Evento:  	ue_resetear_datos
//
// Objetivo: 	Resetear los vectores y dw_datos_zona_geo
//
//                       Responsable  	Fecha    	Actuaci$$HEX1$$f300$$ENDHEX$$n
//                       -----------   -----   		--------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: AD			   27/08/96		Versi$$HEX1$$f300$$ENDHEX$$n Original
//                       MATO          21/12/1998  Modif.
/////////////////////////////////////////////////////////////////////////

dw_datos_zona_geo.Reset()
dw_datos_zona_geo.WIDTH =  ii_width_dw
This.fw_inicializo_vector()
This.fw_inicializo_vector2()
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
fw_des_colum_selec()
fw_inicializo_vector()
fw_inicializo_vector2()

// Si desea ver los hist$$HEX1$$f300$$ENDHEX$$ricos
IF m_avisos_distribucion.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos" THEN

// Siguiente estado "Actuales"
	m_avisos_distribucion.m_opciones.m_historicos.Text = "&Actual"
	m_avisos_distribucion.m_opciones.m_historicos.ToolBarItemText = "Actual"
	m_avisos_distribucion.m_opciones.m_historicos.ToolBarItemName = "Custom024!"

   // Muestro los hist$$HEX1$$f300$$ENDHEX$$ricos
	ii_historicos = 1
	ii_totales = 1

	dw_criterio_seleccion.SetItem(1, "pa_acumulado_sn", ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 0")
	dw_criterio_seleccion.modify("pa_zona_cmd.visible= 0")
	rb_sum_parciales.checked = FALSE
	rb_sum_totales.checked = TRUE

ELSE
	
	// Siguiente estado los Hist$$HEX1$$f300$$ENDHEX$$ricos
	m_avisos_distribucion.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_avisos_distribucion.m_opciones.m_historicos.ToolBarItemText = "Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_avisos_distribucion.m_opciones.m_historicos.ToolBarItemName = "Custom023!"	

	// Muestro los actuales
	ii_historicos = 0

	dw_criterio_seleccion.SetItem(1, "pa_acumulado_sn", ii_acumulado)
	dw_criterio_seleccion.Modify("pa_acumulado_sn.visible = 1")
	IF dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
		dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos &
	THEN 	dw_criterio_seleccion.modify("pa_zona_cmd.visible = 1")
	

END IF

dw_ambito.Enabled = TRUE

///////////
// Si estaba en parciales...
if li_sums = 0 then
	rb_sum_parciales.triggerEvent("clicked")
	rb_sum_totales.Checked = False
	rb_sum_parciales.Checked = True
	ii_totales = 0	
	sle_fil_selec.text = "0"
	sle_fil_selec.Enabled = False
	st_fil_selec.Enabled = False
	st_valor_actual.Enabled = False

else
	rb_sum_totales.triggerEvent("clicked")
	rb_sum_totales.Checked = True
	rb_sum_parciales.Checked = False
	ii_totales = 1
	sle_fil_selec.text = String(dw_datos_zona_geo.RowCount())
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

str_print.dwprint = dw_impresion
str_print.parm1 = ib_lista
st_valor_actual.visible = False
IF ib_lista  THEN
	dw_datos_zona_geo.sharedata(dw_impresion)
	str_print.dwprint = dw_impresion
	fw_fondo_transparente()
	str_print.titulo="Informe de Avisos"
ELSE
	str_print.titulo="Gr$$HEX1$$e100$$ENDHEX$$fico de Avisos"	
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

public function integer fw_graficar ();///////////////////////////////////////////////////////////////////////
//
//	Function: fw_graficar
//
///////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)
graph gr

//if gr_sectores.Enabled=FALSE then  (probar)
if ii_tipo_graf=1 then
	gr=gr_grafica
else
	gr=gr_sectores
end if

gr.Reset(ALL!)
gr.SetRedraw(FALSE)

iu_gen_gra = CREATE u_gen_nu_gra_0001

iu_gen_gra.fnu_gra_titulo(gr,"Avisos Distribuci$$HEX1$$f300$$ENDHEX$$n")
//iu_gen_gra.fnu_gra_titulo(gr,"Complaint Distribution")

if ii_historicos = 1 then
	iu_gen_gra.fnu_titulo_x(gr,"Fecha")
//	iu_gen_gra.fnu_titulo_x(gr,"Date")
else
	iu_gen_gra.fnu_titulo_x(gr,"Ambito")
//	iu_gen_gra.fnu_titulo_x(gr,"Scope")
end if

IF ii_unidades = 0 THEN
	iu_gen_gra.fnu_gra_titulo_y(gr,"Porcentajes")
//	iu_gen_gra.fnu_gra_titulo_y(gr,"Percentages")
ELSE
	iu_gen_gra.fnu_gra_titulo_y(gr,"Cantidades")
//	iu_gen_gra.fnu_gra_titulo_y(gr,"Amounts")
END IF

iu_gen_gra.fnu_gra_cargo_datos(gr,dw_datos_zona_geo,1,True,iivec_col_selec[],iivec_fil_selec[])


DESTROY iu_gen_gra 

gr.SetRedraw(TRUE)
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

//	COLUMNAS

int li_ind, li_column_zona
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm

IF Integer(dw_datos_zona_geo.Describe("nom_centro_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna ('nom_centro')
ELSEIF Integer(dw_datos_zona_geo.Describe("nom_cmd_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna ('nom_cmd')
ELSEIF Integer(dw_datos_zona_geo.Describe("nom_puesto_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna ('nom_puesto')
ELSE
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
		ls_column3 = ls_column2 + "_m"
	
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

//	FILAS

int li_ind

FOR li_ind = 1 TO dw_datos_zona_geo.RowCount()
	iivec_fil_selec[li_ind] = 0
NEXT

ii_ind_vec2 = 1

RETURN 1
end function

public function integer fw_obtener_numero_columna (string ps_nombre);integer li_retorno
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

public subroutine fw_des_colum_selec ();string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm, ls_column
string ls_column2, ls_column3
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
	
		fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
	
	END IF
NEXT

iivec_col_selec = li_vec_col_selec
fw_inicializo_vector()
end subroutine

public subroutine fw_seleccionar_todo ();int li_indice
for li_indice=1 to integer(dw_datos_zona_geo.Object.DataWindow.Column.Count)
	if li_indice>4 and li_indice<=9 then
		ii_column_clicked=li_indice
		dw_datos_zona_geo.triggerevent(doubleclicked!)
	end if
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
//ll_color = 553648127

li_num_cols = integer(dw_datos_zona_geo.object.DataWindow.Column.Count)
for li_contador = 1 to li_num_cols
	dw_impresion.Modify("#" + string(li_contador) + ".background.color = " + gs_blanco)		
NEXT
end subroutine

event open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Open de la ventana de la BDG con las estad$$HEX1$$ed00$$ENDHEX$$sticas por
//				 zonas geogr$$HEX1$$e100$$ENDHEX$$ficas.
//
////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED

datetime ld_fecha_ok_bdg

SetPointer (HourGlass!)
This.SetRedraw(FALSE)
ib_lista = True //En True indica que se esta desplegando la lista,
                //  en False indica que se esta desplegando la Gr$$HEX1$$e100$$ENDHEX$$fica
ii_num_col_marca=0 //Inicializo variable

// Creo el objeto n$$HEX1$$fa00$$ENDHEX$$cleo de la datawindow
iu_bdg_2006_nu = CREATE u_bdg_2006_nu_avisos_distribucion

// Seteo el nombre de la ventana
ld_fecha_ok_bdg = iu_bdg_2006_nu.fnu_recup_fecha()
This.title = gu_comunic.f_titulo_ventana("w_4005","aviso_distribucion")  + '  - Actualizado: ' + string(date(ld_fecha_ok_bdg))


dw_datos_zona_geo.SetTransObject (SQLCA)

ii_nivel = 1

//	Conecto las DW del objeto "criterio de selecci$$HEX1$$f300$$ENDHEX$$n", filtro sus
//	campos, y seteo a los mismos con "Todos"
dw_criterio_seleccion.f_insertar_fila()
dw_criterio_seleccion.fpr_crea_dddw()
dw_criterio_seleccion.SetItem(1, "pa_periodo", fgnu_fecha_actual())
dw_criterio_seleccion.SetItem(1, "pa_int_horario", 0)
dw_criterio_seleccion.SetItem(1, "pa_zona_cmd", 0)
dw_criterio_seleccion.SetItem(1, "pa_unidades", 1)
dw_criterio_seleccion.SetItem(1, "pa_acumulado_sn", 0)

// Inicializo objetos de trabajo
dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
dw_ambito.fnu_insertar_datos(fgci_todos, &
									 fgci_todos, &
									 fgci_todos, 0)
									 
//dw_ambito.AcceptText()
dw_ambito.SetColumn("nro_centro") 

dw_datos_zona_geo.Modify("nom_centro_t.Visible = 0")
dw_datos_zona_geo.Modify("nom_puesto_t.Visible = 0")
dw_datos_zona_geo.Modify("nom_cmd_t.Visible = 1")

// Seteo estado inicial de la ventana
ii_historicos = 0
ii_totales = 1
ii_acumulado = 0
ii_unidades = 1

// Cargo la lista con los datos
This.PostEvent("ue_actualizar")

// Inicializo el vector
This.fw_inicializo_vector()
This.fw_inicializo_vector2()

// Oculto la Gr$$HEX1$$e100$$ENDHEX$$fica
st_valor_actual.Hide()
gr_grafica.Hide()
gr_sectores.Hide()
pb_graficar.Enabled = FALSE
pb_sectores.Enabled = FALSE

This.SetRedraw(TRUE)
end event

event close;/////////////////////////////////////////////////////////////////////////
//
// Event:  	Close
//
/////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED
end event

on w_4005_avisos_distribucion.create
int iCurrent
call super::create
if this.MenuName = "m_avisos_distribucion" then this.MenuID = create m_avisos_distribucion
this.sle_fil_selec=create sle_fil_selec
this.st_fil_selec=create st_fil_selec
this.dw_ambito=create dw_ambito
this.rb_sum_totales=create rb_sum_totales
this.rb_sum_parciales=create rb_sum_parciales
this.gb_sumas=create gb_sumas
this.pb_retroceder=create pb_retroceder
this.pb_graficar=create pb_graficar
this.pb_sectores=create pb_sectores
this.dw_criterio_seleccion=create dw_criterio_seleccion
this.st_valor_actual=create st_valor_actual
this.dw_datos_zona_geo=create dw_datos_zona_geo
this.gr_sectores=create gr_sectores
this.gr_grafica=create gr_grafica
this.dw_impresion=create dw_impresion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_fil_selec
this.Control[iCurrent+2]=this.st_fil_selec
this.Control[iCurrent+3]=this.dw_ambito
this.Control[iCurrent+4]=this.rb_sum_totales
this.Control[iCurrent+5]=this.rb_sum_parciales
this.Control[iCurrent+6]=this.gb_sumas
this.Control[iCurrent+7]=this.pb_retroceder
this.Control[iCurrent+8]=this.pb_graficar
this.Control[iCurrent+9]=this.pb_sectores
this.Control[iCurrent+10]=this.dw_criterio_seleccion
this.Control[iCurrent+11]=this.st_valor_actual
this.Control[iCurrent+12]=this.dw_datos_zona_geo
this.Control[iCurrent+13]=this.gr_sectores
this.Control[iCurrent+14]=this.gr_grafica
this.Control[iCurrent+15]=this.dw_impresion
end on

on w_4005_avisos_distribucion.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_fil_selec)
destroy(this.st_fil_selec)
destroy(this.dw_ambito)
destroy(this.rb_sum_totales)
destroy(this.rb_sum_parciales)
destroy(this.gb_sumas)
destroy(this.pb_retroceder)
destroy(this.pb_graficar)
destroy(this.pb_sectores)
destroy(this.dw_criterio_seleccion)
destroy(this.st_valor_actual)
destroy(this.dw_datos_zona_geo)
destroy(this.gr_sectores)
destroy(this.gr_grafica)
destroy(this.dw_impresion)
end on

event closequery;call super::closequery;/////////////////////////////////////////////////////////////////////////
//
// Event:  	Closequery
//
// Objetivo: 	Destruir los objetos creados y cerrar la ventana.
//
/////////////////////////////////////////////////////////////////////////

// Destruyo los objetos creados
DESTROY	iu_bdg_2006_nu
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_4005_avisos_distribucion
end type

type sle_fil_selec from singlelineedit within w_4005_avisos_distribucion
integer x = 3122
integer y = 1176
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

type st_fil_selec from statictext within w_4005_avisos_distribucion
integer x = 3008
integer y = 1116
integer width = 453
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Filas Selecci$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4005_avisos_distribucion
integer x = 59
integer y = 120
integer width = 992
integer height = 384
integer taborder = 20
boolean border = false
end type

event post_itemchange;call super::post_itemchange;/////////////////////////////////////////////////////////////////////////
//
// Evento:  post_itemchange
//
/////////////////////////////////////////////////////////////////////////

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

type rb_sum_totales from radiobutton within w_4005_avisos_distribucion
integer x = 3058
integer y = 896
integer width = 361
integer height = 68
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
// Evento:  	Clicked
//
/////////////////////////////////////////////////////////////////////////
int li_fila, li_cant_filas, li_ind

IF ii_totales = 1 THEN RETURN
dw_datos_zona_geo.SetRedraw(FALSE)
fw_des_colum_selec()
ii_totales = 1

li_cant_filas = dw_datos_zona_geo.RowCount()
li_fila = 1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila, FALSE)
	dw_datos_zona_geo.SetItem(li_fila, "fila_marcada", 1)
	li_fila ++
LOOP

// Cargo el vector de filas seleccionadas con todas
sle_fil_selec.TextColor=4250
sle_fil_selec.Text = String(li_cant_filas)
li_ind = 1

DO WHILE li_ind <= li_cant_filas
	iivec_fil_selec[li_ind] = li_ind
	li_ind ++
	ii_ind_vec2 ++
LOOP

dw_datos_zona_geo.SetRowFocusIndicator(FOCUSRECT!)
dw_datos_zona_geo.SetRedraw(TRUE)
end event

type rb_sum_parciales from radiobutton within w_4005_avisos_distribucion
integer x = 3058
integer y = 976
integer width = 361
integer height = 68
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
fw_des_colum_selec()
//IF ii_totales = 0 THEN RETURN
if dw_criterio_seleccion.GetItemNumber(1,'pa_unidades') = 0 THEN
	this.checked = false
	this.enabled = false
	rb_sum_totales.checked = true
	rb_sum_totales.enabled = false
	return
end if
dw_datos_zona_geo.SetRedraw(FALSE)
ii_totales = 0

dw_datos_zona_geo.SetRowFocusIndicator(OFF!)

li_cant_filas = dw_datos_zona_geo.RowCount()
li_fila = 1
DO WHILE li_fila <= li_cant_filas
	dw_datos_zona_geo.SelectRow(li_fila, FALSE)
	dw_datos_zona_geo.SetItem(li_fila, "fila_marcada", 0)
	li_fila ++
LOOP

sle_fil_selec.TextColor=97920
sle_fil_selec.Text = String(0)

// Inicializo el vector de filas seleccionadas
Parent.fw_inicializo_vector2()

// Inicializo el $$HEX1$$ed00$$ENDHEX$$ndice del vector de filas seleccionadas
ii_ind_vec2 = 1

// Deshabilito BOTONES graficar
pb_graficar.Enabled = FALSE
pb_sectores.Enabled = FALSE

dw_datos_zona_geo.SetRedraw(TRUE)
end event

type gb_sumas from groupbox within w_4005_avisos_distribucion
integer x = 3026
integer y = 832
integer width = 416
integer height = 236
integer taborder = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = " Sumas "
end type

type pb_retroceder from picturebutton within w_4005_avisos_distribucion
integer x = 3191
integer y = 1372
integer width = 96
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string picturename = "undo3.bmp"
string disabledname = "undo3ds.bmp"
alignment htextalign = left!
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  clicked
//
/////////////////////////////////////////////////////////////////////////

int li_ind, li_centro, li_cmd, li_mesa, li_int_horario
date ld_periodo
string ls_select1, ls_select2, ls_select3, ls_select4
boolean lb_cmd_no_habilitado 

dw_ambito.SetRedraw (FALSE)

// Cargo variables auxiliares para pasar como par$$HEX1$$e100$$ENDHEX$$metro
li_centro  = dw_ambito.GetItemNumber(1, "nro_centro")
li_cmd	  = dw_ambito.GetItemNumber(1, "nro_cmd")
li_mesa	  = dw_ambito.GetItemNumber(1, "nro_mesa")
ld_periodo = dw_criterio_seleccion.GetItemDate(1, "pa_periodo")
li_int_horario = dw_criterio_seleccion.GetItemNumber(1, "pa_int_horario")

fw_des_colum_Selec()
// Si retrocedo a TODOS, TODOS, TODOS
IF (dw_ambito.GetItemNumber(1,"nro_centro") <> fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos) OR & 
		(dw_ambito.GetItemNumber(1,"nro_cmd") <> fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos) THEN

   // Si llego al tope deshabilito el bot$$HEX1$$f300$$ENDHEX$$n y selecciono centro o cmd
   this.enabled = FALSE
   ii_nivel = 0
	if dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos then 
		dw_ambito.Setcolumn("nro_cmd")
		dw_ambito.Settext(string(fgci_todos) )
	else
		dw_ambito.Setcolumn("nro_centro")
		dw_ambito.Settext(string(fgci_todos) )
	end if

	dw_ambito.AcceptText()
	if is_donde="ZONA" then
		iu_bdg_2006_nu.fnu_armar_sql(dw_datos_zona_geo, "TODOS", ii_acumulado, &
											ii_historicos, ii_unidades, fgci_todos, fgci_todos, &
												fgci_todos, ld_periodo, li_int_horario)
	else
		iu_bdg_2006_nu.fnu_armar_sql(dw_datos_zona_geo, "TODOSCMD", ii_acumulado, &
											ii_historicos, ii_unidades, fgci_todos, fgci_todos, &
												fgci_todos, ld_periodo, li_int_horario)
											 
	end if

ELSEIF dw_ambito.GetItemNumber(1,"nro_mesa") <> fgci_todos THEN

	ii_nivel = 1
	if is_donde="ZONA" then
		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.setcolumn("nro_centro")
		dw_ambito.settext(string(li_centro))
		dw_ambito.AcceptText()
		iu_bdg_2006_nu.fnu_armar_sql(dw_datos_zona_geo, "CENTRO", ii_acumulado, &
											ii_historicos, ii_unidades, li_centro, fgci_todos, &
												fgci_todos, ld_periodo, li_int_horario)
	else				

		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.AcceptText()
		dw_ambito.setcolumn("nro_cmd")
		dw_ambito.settext(string(li_cmd))
		dw_ambito.AcceptText()
		iu_bdg_2006_nu.fnu_armar_sql(dw_datos_zona_geo, "CMD", ii_acumulado, &
											ii_historicos, ii_unidades, fgci_todos, li_cmd, &
												fgci_todos, ld_periodo, li_int_horario)
		

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

type pb_graficar from picturebutton within w_4005_avisos_distribucion
integer x = 3259
integer y = 668
integer width = 160
integer height = 128
integer taborder = 50
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
		m_avisos_distribucion.m_opciones.m_actualizar.Enabled = FALSE
		m_avisos_distribucion.m_opciones.m_historicos.Enabled = FALSE
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
		m_avisos_distribucion.m_opciones.m_actualizar.Enabled = TRUE
		m_avisos_distribucion.m_opciones.m_historicos.Enabled = TRUE
		dw_ambito.Enabled = TRUE
		dw_criterio_seleccion.Enabled = TRUE
		gb_sumas.Enabled= TRUE
		if (dw_ambito.GetItemNumber(1,'nro_centro') = fgci_todos) and &
		   (dw_ambito.GetItemNumber(1,'nro_cmd') = fgci_todos) and &
			(dw_ambito.GetItemNumber(1,'nro_mesa') = fgci_todos) or ii_historicos = 1 then
				pb_retroceder.Enabled = False
		else 
				pb_retroceder.Enabled = true
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

type pb_sectores from picturebutton within w_4005_avisos_distribucion
event clicked pbm_bnclicked
integer x = 3049
integer y = 668
integer width = 160
integer height = 128
integer taborder = 40
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
// Event:  	Clicked
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
		m_avisos_distribucion.m_opciones.m_actualizar.Enabled = FALSE
		m_avisos_distribucion.m_opciones.m_historicos.Enabled = FALSE
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
		m_avisos_distribucion.m_opciones.m_actualizar.Enabled = TRUE
		m_avisos_distribucion.m_opciones.m_historicos.Enabled = TRUE
		dw_ambito.Enabled = TRUE
		dw_criterio_seleccion.Enabled = TRUE
		gb_sumas.Enabled= TRUE
		if (dw_ambito.GetItemNumber(1,'nro_centro') = fgci_todos) and &
		   (dw_ambito.GetItemNumber(1,'nro_cmd') = fgci_todos) and &
			(dw_ambito.GetItemNumber(1,'nro_mesa') = fgci_todos) or ii_historicos = 1 then
				pb_retroceder.Enabled = False
		else 
				pb_retroceder.Enabled = true
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

type dw_criterio_seleccion from u_bdg_2006_pr_filtro_avisos_zona_geogr within w_4005_avisos_distribucion
integer x = 247
integer y = 4
integer width = 3305
integer height = 544
integer taborder = 10
boolean border = false
end type

event itemchanged;///////////////////////////////////////////////////////////////////////
//
//	Event:	itemchanged
//
///////////////////////////////////////////////////////////////////////

string ls_columna
int li_valor 
int li_unidades
date ld_fecha
ls_columna = this.getColumnName()
li_valor = integer(this.getText())

CHOOSE CASE ls_columna
	CASE "pa_zona_cmd"
		ii_zona_cmd=li_valor
		fw_des_colum_selec()
		Parent.TriggerEvent("ue_actualizar")
		return	
	CASE "pa_unidades"
		ii_unidades = li_valor
		li_unidades = this.object.pa_unidades[1]
		if li_unidades <> integer(data) then
			pb_graficar.enabled = false
			pb_sectores.enabled = false
		end if
		if li_valor = 0 then
			rb_sum_parciales.checked = False
			rb_sum_parciales.enabled = false
			rb_sum_totales.checked = true		
			rb_sum_totales.enabled = false
		else
			rb_sum_parciales.enabled = true
			rb_sum_totales.enabled = true
		end if
		Parent.TriggerEvent("ue_a_porcentajes")
		return
	CASE "pa_acumulado_sn"
		ii_acumulado = li_valor		
		Parent.TriggerEvent("ue_actualizar")
		return
		
END CHOOSE
Parent.TriggerEvent("ue_resetear_datos")
end event

type st_valor_actual from statictext within w_4005_avisos_distribucion
integer x = 2258
integer y = 588
integer width = 626
integer height = 160
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

type dw_datos_zona_geo from u_bdg_2006_pr_avisos_distrib within w_4005_avisos_distribucion
event ue_postclicked pbm_custom04
integer x = 5
integer y = 580
integer width = 2912
integer height = 1088
integer taborder = 30
boolean vscrollbar = true
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	clicked
//
/////////////////////////////////////////////////////////////////////////
int li_fila_clicked
li_fila_clicked = row
ii_column_clicked = getclickedcolumn()
long ll_prueba
// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona
IF ii_column_clicked = fw_obtener_numero_columna("nom_centro") OR &
	ii_column_clicked = fw_obtener_numero_columna("nom_cmd") OR &
	ii_column_clicked = fw_obtener_numero_columna("nom_puesto") OR &
	ii_column_clicked = fw_obtener_numero_columna("fecha") THEN
	
	IF li_fila_clicked > 0 THEN
		
		//	Si est$$HEX2$$e1002000$$ENDHEX$$en TOTALES
		IF ii_totales = 1 THEN
			dw_ambito.SetRedraw(False)
			IF Long(This.Describe("nom_centro_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_centro")
				dw_ambito.settext(string(this.GetItemNumber(li_fila_clicked,"gi_avisos_bdg_nro_centro")))
				dw_ambito.AcceptText()

			ELSEIF Long(This.Describe("nom_cmd_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_cmd")
				dw_ambito.settext(string(this.GetItemNumber(li_fila_clicked,"gi_avisos_bdg_nro_cmd")))
				dw_ambito.AcceptText()

			ELSEIF Long(This.Describe("nom_puesto_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_mesa")
				ll_prueba=this.GetItemNumber(li_fila_clicked,"gi_avisos_bdg_nro_mesa")
				dw_ambito.settext(string(ll_prueba))
				dw_ambito.AcceptText()
			END IF			
			
		//	Si est$$HEX2$$e1002000$$ENDHEX$$en PARCIALES
		ELSE
			IF This.IsSelected(li_fila_clicked) THEN
				This.SelectRow(li_fila_clicked,False)  //deselecciono
				This.SetItem(li_fila_clicked,"fila_marcada",0)
				sle_fil_selec.TextColor=97920
				sle_fil_selec.text = String(Integer(sle_fil_selec.text) - 1)
				
  				// Cargo en el vector la fila seleccionada
				int li_ind
				li_ind = 1
				ii_ind_vec2 --
				DO WHILE li_ind <= ii_ind_vec2
					IF iivec_fil_selec[li_ind] = li_fila_clicked THEN
						iivec_fil_selec[li_ind] = iivec_fil_selec[ii_ind_vec2] 
						iivec_fil_selec[ii_ind_vec2] = 0
						EXIT
					END IF
					li_ind ++
				LOOP
				
			ELSE
				This.SelectRow(li_fila_clicked,True)  // selecciono
				This.SetItem(li_fila_clicked,"fila_marcada",1)

				sle_fil_selec.TextColor=97920
				sle_fil_selec.text = String(Integer(sle_fil_selec.text) + 1)

				// Cargo en el vector la fila seleccionada
				iivec_fil_selec[ii_ind_vec2] = li_fila_clicked
				ii_ind_vec2 ++
				
			END IF
			This.AcceptText()
		END IF
		
		Parent.TriggerEvent("ue_botones")
		
		dw_ambito.SetRedraw(True)
	END IF
END IF
end event

event doubleclicked;call super::doubleclicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	doubleclicked
//
/////////////////////////////////////////////////////////////////////////
string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm
string ls_color_texto_mark, ls_nombre_columna
string ls_column, ls_column2, ls_column3
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

	// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona, avanzo
	IF ls_nombre_columna = 'nom_cmd' OR ls_nombre_columna = 'nom_puesto' OR ls_nombre_columna = 'nom_centro' THEN
		if ii_totales = 1 then
			fw_des_colum_selec()
			// Si ya estoy en el nivel inferior no avanzo
			IF ii_nivel = 3 THEN
				dw_datos_zona_geo.SetRedraw(True)
				pb_retroceder.Enabled = TRUE
				this.SetRedraw(True)
				RETURN
			END IF
	
			Parent.TriggerEvent("ue_actualizar")
		end if

	ELSE 
 	//
	// Si estaba desmarcada, la marco
   	ib_habilitado = rb_sum_parciales.enabled and rb_sum_totales.enabled
		IF This.Describe(" "+ ls_nombre_columna +".Background.Color") = ls_color_fondo_norm THEN
	
			This.Modify(ls_nombre_columna +".Background.Mode=0")
			This.Modify(ls_nombre_columna +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(ls_nombre_columna +".Text.Color="+ ls_color_texto_mark +" ")
			
			This.Modify(ls_nombre_columna + '_s' +".Background.Mode=0")
			This.Modify(ls_nombre_columna + '_s' +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(ls_nombre_columna + '_s' +".Text.Color="+ ls_color_texto_mark +" ")

			Parent.fw_marcar_col(ii_column_clicked)
			ii_num_col_marca ++
						
		ELSEIF This.Describe(" "+ ls_nombre_columna +".Background.Color") = ls_color_fondo_mark THEN
	
			// Si estaba marcada, la desmarco	
			This.Modify(ls_nombre_columna +".Background.Mode=1")
			This.Modify(ls_nombre_columna +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(ls_nombre_columna +".Text.Color="+ ls_color_texto_norm +" ")
	
			This.Modify(ls_nombre_columna + '_s' +".Background.Mode=1")
			This.Modify(ls_nombre_columna + '_s' +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(ls_nombre_columna + '_s' +".Text.Color="+ ls_color_texto_norm +" ")
	
			Parent.fw_desmarcar_col(ii_column_clicked)
			ii_num_col_marca --
	
		END IF
		Parent.TriggerEvent("ue_botones")
		
	END IF
END IF

this.SetRedraw(True)
end event

event ue_mover_borde;//
end event

event ue_key_down;//
end event

type gr_sectores from graph within w_4005_avisos_distribucion
event other pbm_other
integer y = 584
integer width = 2907
integer height = 1084
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

type gr_grafica from graph within w_4005_avisos_distribucion
integer x = 9
integer y = 592
integer width = 2907
integer height = 1084
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

event other;/////////////////////////////////////////////////////////////////////////
//
// Evento:  	other
//
/////////////////////////////////////////////////////////////////////////

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

type dw_impresion from datawindow within w_4005_avisos_distribucion
boolean visible = false
integer x = 192
integer y = 1104
integer width = 311
integer height = 136
integer taborder = 70
boolean bringtotop = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


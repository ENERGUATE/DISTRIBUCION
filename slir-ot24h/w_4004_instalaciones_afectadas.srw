HA$PBExportHeader$w_4004_instalaciones_afectadas.srw
forward
global type w_4004_instalaciones_afectadas from w_sgigenerica
end type
type sle_fil_selec from singlelineedit within w_4004_instalaciones_afectadas
end type
type st_fil_selec from statictext within w_4004_instalaciones_afectadas
end type
type pb_avanzar from picturebutton within w_4004_instalaciones_afectadas
end type
type pb_retroceder from picturebutton within w_4004_instalaciones_afectadas
end type
type rb_sum_parciales from radiobutton within w_4004_instalaciones_afectadas
end type
type rb_sum_totales from radiobutton within w_4004_instalaciones_afectadas
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4004_instalaciones_afectadas
end type
type gb_sumas from groupbox within w_4004_instalaciones_afectadas
end type
type pb_sectores from picturebutton within w_4004_instalaciones_afectadas
end type
type pb_graficar from picturebutton within w_4004_instalaciones_afectadas
end type
type dw_criterio_seleccion from u_bdg_2005_pr_criterio_seleccion within w_4004_instalaciones_afectadas
end type
type st_valor_actual from statictext within w_4004_instalaciones_afectadas
end type
type dw_datos from u_bdg_2005_pr_instal_afect within w_4004_instalaciones_afectadas
end type
type gr_grafica from graph within w_4004_instalaciones_afectadas
end type
type gr_sectores from graph within w_4004_instalaciones_afectadas
end type
type dw_impresion from datawindow within w_4004_instalaciones_afectadas
end type
end forward

global type w_4004_instalaciones_afectadas from w_sgigenerica
integer width = 3653
integer height = 1908
string menuname = "m_inst_afect"
boolean minbox = false
boolean maxbox = false
string icon = "INCID_SR.ico"
event ue_obtener_datos pbm_custom70
event ue_actualizar pbm_custom71
event ue_a_porcentajes pbm_custom75
event ue_resetear_datos pbm_custom60
event ue_historicos pbm_custom61
event ue_imprimir pbm_custom62
event ue_botones pbm_custom09
event ue_tiepi ( )
event ue_tiebt ( )
event ue_saidi ( )
event ue_saifi ( )
event ue_caidi ( )
event ue_asai ( )
sle_fil_selec sle_fil_selec
st_fil_selec st_fil_selec
pb_avanzar pb_avanzar
pb_retroceder pb_retroceder
rb_sum_parciales rb_sum_parciales
rb_sum_totales rb_sum_totales
dw_ambito dw_ambito
gb_sumas gb_sumas
pb_sectores pb_sectores
pb_graficar pb_graficar
dw_criterio_seleccion dw_criterio_seleccion
st_valor_actual st_valor_actual
dw_datos dw_datos
gr_grafica gr_grafica
gr_sectores gr_sectores
dw_impresion dw_impresion
end type
global w_4004_instalaciones_afectadas w_4004_instalaciones_afectadas

type variables
int ii_fila_clicked, ii_column_clicked, ii_ind_vec, ii_ind_vec2
int ii_width_dw = 2926
// Ver las sumas totales
int ii_totales
// Si estoy viendo cantidades o porcentajes
int ii_unidades
// Si se desean los acumulados
int ii_acumulado

// Vector con las columnas seleccionadas
integer	iivec_col_selec[]

// Vector de filas seleccionadas
integer	iivec_fil_selec[]

u_gen_nu_gra_0001	iu_gen_gra

// Objeto de nucleo de la datawindow
u_bdg_2005_nu_instal_afect  iu_bdg_2005_nu

// Bandera para el control del itemchange
int ii_itemchange=0

// Objeto de comunicaciones
u_generico_comunicaciones iu_gen_comunic

// Nivel en que se encuentra el listado

int ii_nivel

// Indicador de Hist$$HEX1$$f300$$ENDHEX$$rico o Actuales

int ii_historicos

// Nombre de tabla bdg que utiliza la ventana.

string is_tabla_bdg

// N$$HEX1$$fa00$$ENDHEX$$mero de instalacion de padre actual

string is_nro_inst_padre

// Vector con nombres de padres recorridos

string is_vec_padre[]

// Vector con n$$HEX1$$fa00$$ENDHEX$$meros de padres recorridos

string is_vec_nro_padre[]
// definicion de constantes
//int fgci_todos 

// Variable que indica que se esta desplegando 
// True = lista , False = Grafica
 boolean ib_lista

s_print str_print

// gr$$HEX1$$e100$$ENDHEX$$fico de barras o de sectores
int ii_tipo_graf

// n$$HEX1$$fa00$$ENDHEX$$mero de columnas seleccionadas
// si s$$HEX1$$f300$$ENDHEX$$lo hay 1 habilitamos gr$$HEX1$$e100$$ENDHEX$$f de sectores
int ii_num_col_marca
int ii_operacion
int ii_alcance
int ii_calidad
boolean ib_marcada
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
public subroutine fw_inicializo_vec_padre ()
public function integer fw_obtener_numero_columna (string ps_nombre)
public subroutine fw_des_column_selec ()
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
string ls_tip_instalacion,ls_tipo_inst
integer li_centro, li_cmd, li_mesa, li_tip_instalacion, li_tipo_incid, li_alcance
date ld_periodo
int li_operacion

SetPointer(HourGlass!)

li_retorno = fw_validar_periodo()
IF li_retorno = 1 then 
	gnv_msg.f_mensaje("AB03", "", "", OK!)
	return
END IF

dw_ambito.AcceptText()
dw_criterio_seleccion.AcceptText()

// Cargo variables auxiliares para pasar como par$$HEX1$$e100$$ENDHEX$$metro
li_centro  = dw_ambito.GetItemNumber(1,"nro_centro")
li_cmd     = dw_ambito.GetItemNumber(1,"nro_cmd")
li_mesa    = dw_ambito.GetItemNumber(1,"nro_mesa")
ld_periodo = dw_criterio_seleccion.GetItemDate(1,"pa_periodo")
li_alcance = dw_criterio_seleccion.GetItemNumber(1,"pa_alcance")
IF IsNull(ld_periodo) THEN 
	dw_criterio_seleccion.SetItem(1, "pa_periodo",today())
	ld_periodo=today()
END IF
li_tipo_incid = dw_criterio_seleccion.GetItemNumber(1,"pa_tipo_incidencia")

//Obtenemos el tipo de Inst. seleccionado en Dw. Criterio
ls_tipo_inst = dw_criterio_seleccion.GetItemString(1,"pa_tip_instalacion")
li_operacion = dw_criterio_seleccion.GetItemNumber(1,'pa_operaciones_sgi')

if not ib_primera_vez then this.setredraw(false)
dw_datos.reset()
dw_datos.WIDTH = ( ii_width_dw)
dw_datos.visible = false
dw_datos.visible = true

// Hace el <retrieve> con el criterio seleccionado
iu_bdg_2005_nu.fnu_aplicar_criterio(dw_datos, li_centro, li_cmd, li_mesa, ld_periodo, is_nro_inst_padre, li_tipo_incid, ls_tipo_inst,li_operacion,li_alcance)

// Reseteo el filtro y si no trajo registros doy un mensaje
dw_datos.setFilter('')
dw_datos.filter()

dw_criterio_seleccion.modify('txt_inst_seleccionada.text = ~"' + is_vec_padre[ii_nivel] + '~"')

//Si no trajo registros doy un mensaje
if dw_datos.RowCount()=0 THEN
	dw_datos.WIDTH =  ii_width_dw
	gnv_msg.f_mensaje("IA01","","",OK!)
//Ajuste de la barra <Scroll> Vertical	para no ocupar espacio en Dw.
ELSEIF dw_datos.RowCount() > 12  THEN
   dw_datos.WIDTH = ( ii_width_dw + 75)
	dw_datos.VScrollBar = true
ELSE
//	dw_datos.SetReDraw(true)
	dw_datos.WIDTH =  ii_width_dw
	dw_datos.VScrollBar = false	
END IF

if not ib_primera_vez then this.setredraw(true)
ib_primera_vez = false

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

RETURN
end event

event ue_actualizar;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_actualizar
//
///////////////////////////////////////////////////////////////////////////
int li_ind
string ls_tipo_inst
long ll_tip_incidencia// DSA 03/04/2000	

SetPointer(HourGlass!)

dw_datos.SetRedraw(False)
dw_criterio_seleccion.Accepttext()
ll_tip_incidencia = dw_criterio_seleccion.object.pa_tipo_incidencia[1]	// DSA 03/04/2000	
fw_des_column_selec()
// Si todos tienen "Todos"
IF dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
		dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN

	iu_bdg_2005_nu.fnu_armar_sql(dw_datos, "TODOS", ii_acumulado, ii_historicos, ii_unidades, ii_nivel, ls_tipo_Inst, ll_tip_incidencia,ii_operacion,ii_alcance)
	dw_ambito.fnu_filtro_centro()

// Si existe un centro seleccionado
ELSEIF dw_ambito.GetItemNumber(1,"nro_centro") <> fgci_todos AND & 
		 dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		 dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN

	iu_bdg_2005_nu.fnu_armar_sql(dw_datos, "CENTRO", ii_acumulado, ii_historicos, ii_unidades, ii_nivel, ls_tipo_Inst, ll_tip_incidencia,ii_operacion,ii_alcance)		
	dw_ambito.fnu_filtro_mesa_n()

// Si existe un cmd seleccionado distinto de "todos"

ELSEIF dw_ambito.GetItemNumber(1,"nro_cmd") <> fgci_todos AND & 
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN
	
	iu_bdg_2005_nu.fnu_armar_sql(dw_datos, "CMD", ii_acumulado, ii_historicos, ii_unidades, ii_nivel, ls_tipo_Inst, ll_tip_incidencia,ii_operacion,ii_alcance)		
	dw_ambito.fnu_filtro_mesa_n()

// Si existe una mesa seleccionada
ELSEIF dw_ambito.GetItemNumber(1,"nro_mesa") <> fgci_todos THEN
	iu_bdg_2005_nu.fnu_armar_sql(dw_datos, "MESA", ii_acumulado, ii_historicos, ii_unidades, ii_nivel, ls_tipo_Inst, ll_tip_incidencia,ii_operacion,ii_alcance)		
END IF

This.TriggerEvent("ue_obtener_datos")

// Inicializo los vectores
	This.fw_inicializo_vector()
	This.fw_inicializo_vector2()

//// Deshabilito el BOTONES graficar
//	pb_graficar.Enabled = False
//	pb_sectores.Enabled = FALSE
//
	// Cargo el vector con todas las filas tra$$HEX1$$ed00$$ENDHEX$$das
	IF ii_totales = 1 THEN
		sle_fil_selec.TextColor=4250
		sle_fil_selec.text = String(dw_datos.RowCount())
		li_ind = 1
		DO WHILE li_ind <= Integer(sle_fil_selec.text)
			iivec_fil_selec[li_ind] = li_ind
			li_ind ++
			ii_ind_vec2 ++
		LOOP
		// MERC
		ii_totales = 0 
		rb_sum_totales.TriggerEvent("clicked")
	ELSE
		sle_fil_selec.TextColor=97920
		sle_fil_selec.text = String(0)
		// MERC 
		ii_totales = 1
		rb_sum_parciales.TriggerEvent("clicked")
	END IF
	
IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos.SelectRow(0, FALSE)
ii_num_col_marca=0
This.TriggerEvent("ue_botones")

dw_datos.SetRedraw(true)

end event

event ue_a_porcentajes;///////////////////////////////////////////////////////////////////////////
//
// Event:  ue_a_porcentajes
//
/////////////////////////////////////////////////////////////////////////
// Recorro todas las columnas de la DW y para cada una de ellas 
// tomo su suma como el 100%, y en base a esto calculo el porcentaje 
// que le corresponde a cada fila, para cada una de aquellas.

int li_fila, li_col, li_cant_filas, li_totales
decimal ld_porc_fil_col 
decimal ld_sum_cant_incidencias_s, ld_avg_duracion_rs_s, ld_sum_tiepi_propio_s, ld_avg_pot_afectada_s
decimal ld_tiebt, ld_saifi, ld_saidi, ld_caidi, ld_asai
SetPointer(HourGlass!)

dw_datos.setRedraw(false)
li_cant_filas = dw_datos.RowCount()
fw_des_column_selec()
fw_inicializo_vector()
//fw_inicializo_vector2()

IF li_cant_filas = 0 THEN
	return
END IF

// Si quiere ver las cantidades, traigo los datos de nuevo
if ii_unidades = 1 then
	this.triggerEvent("ue_actualizar")
	dw_datos.Modify("sum_saifi_tot.visible='0'")
	dw_datos.Modify("sum_saidi_tot.visible='0'")		
	dw_datos.Modify("sum_caidi_tot.visible='0'")		
	dw_datos.Modify("sum_asai_tot.visible='0'")
	dw_datos.Modify("avg_pot_afectada_tot.visible='0'")
	dw_datos.Modify("avg_duracion_rs_tot.visible='0'")
	return
end if

CHOOSE CASE ii_calidad
	CASE 3
		dw_datos.Modify("sum_saifi_tot.visible='1'")
	CASE 4
		dw_datos.Modify("sum_saidi_tot.visible='1'")		
	CASE 5
		dw_datos.Modify("sum_caidi_tot.visible='1'")		
	CASE 6
		dw_datos.Modify("sum_asai_tot.visible='1'")
END CHOOSE

dw_datos.Modify("avg_pot_afectada_tot.visible='1'")
dw_datos.Modify("avg_duracion_rs_tot.visible='1'")
pb_sectores.enabled = FALSE
pb_graficar.enabled = FALSE

// Indico que desea ver las sumas
for li_fila = 1 to li_cant_filas
	dw_datos.setItem(li_fila,"sumas_promedio",1)
next

// Si estoy en parciales, muestro momentaneamente los totales para hacer los c$$HEX1$$e100$$ENDHEX$$lculos
li_totales = ii_totales
if li_totales = 0 then
	//MERC
	rb_sum_totales.TriggerEvent("clicked")
	rb_sum_totales.Checked = TRUE
	FOR li_fila = 1 TO li_cant_filas
		dw_datos.SelectRow(li_fila,False)
			dw_datos.SetItem(li_fila,"fila_marcada",1)
	NEXT
end if

// Tomo los totales que son el 100%
ld_sum_cant_incidencias_s = dw_datos.GetItemNumber(1,"sum_cant_incidencias_s")
ld_avg_duracion_rs_s      = dw_datos.GetItemNumber(1,"avg_duracion_rs_tot")
ld_sum_tiepi_propio_s     = dw_datos.GetItemNumber(1,"sum_tiepi_propio_s")
ld_avg_pot_afectada_s     = dw_datos.GetItemNumber(1,"avg_pot_afectada_tot")
ld_tiebt			 			  = dw_datos.GetItemDecimal(1,"sum_tiebt_propio_s")
ld_saifi			 			  = dw_datos.GetItemDecimal(1,"sum_saifi_tot")
ld_saidi			 			  = dw_datos.GetItemDecimal(1,"sum_saidi_tot")
ld_caidi			 			  = dw_datos.GetItemDecimal(1,"sum_caidi_tot")
ld_asai			 			  = dw_datos.GetItemDecimal(1,"sum_asai_tot")



for li_fila = 1 to li_cant_filas
	
	if ld_sum_cant_incidencias_s <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"sum_cant_incidencias") * 100) / ld_sum_cant_incidencias_s 
		dw_datos.SetItem(li_fila,"sum_cant_incidencias",round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"sum_cant_incidencias",0)
	end if

	if ld_avg_duracion_rs_s <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"avg_duracion_rs") * 100) / ld_avg_duracion_rs_s
		dw_datos.SetItem(li_fila,"avg_duracion_rs",round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"avg_duracion_rs",0)
	end if

	if ld_sum_tiepi_propio_s <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"sum_tiepi_propio") * 100) / ld_sum_tiepi_propio_s
		dw_datos.SetItem(li_fila,"sum_tiepi_propio",round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"sum_tiepi_propio",0)
	end if

	if ld_avg_pot_afectada_s <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"avg_pot_afectada") * 100) / ld_avg_pot_afectada_s
		dw_datos.SetItem(li_fila,"avg_pot_afectada",round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"avg_pot_afectada",0)
	end if 
	
	if ld_tiebt <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,'sum_tiebt_propio') * 100) / ld_tiebt
		dw_datos.SetItem(li_fila,'sum_tiebt_propio',round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,'sum_tiebt_propio',0)
	end if
	
	if ld_saifi <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,'sum_saifi') * 100) / ld_saifi
		dw_datos.SetItem(li_fila,'sum_saifi',round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,'sum_saifi',0)
	end if
	
	if ld_saidi <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,'sum_saidi') * 100) / ld_saidi
		dw_datos.SetItem(li_fila,'sum_saidi',round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,'sum_saidi',0)
	end if
	
	if ld_caidi <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,'sum_caidi') * 100) / ld_caidi
		dw_datos.SetItem(li_fila,'sum_caidi',round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,'sum_caidi',0)
	end if
	
	if ld_asai <> 0 then
		ld_porc_fil_col = (dw_datos.GetItemNumber(li_fila,'sum_asai') * 100) / ld_asai
		dw_datos.SetItem(li_fila,'sum_asai',round(ld_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,'sum_asai',0)
	end if
	
next

//// Si estaba en parciales, restauro estado
//if li_totales = 0 then
//	rb_sum_parciales.TriggerEvent("clicked")
//	rb_sum_parciales.checked = TRUE
//end if	

dw_datos.setRedraw(true)
end event

event ue_resetear_datos;call super::ue_resetear_datos;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_resetear_datos
//
/////////////////////////////////////////////////////////////////////////
dw_datos.reset();
dw_datos.WIDTH =  ii_width_dw
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
dw_datos.SetRedraw(False)
int li_sums

li_sums = ii_totales
ii_num_col_marca=0
fw_des_column_selec()
fw_inicializo_vector()
fw_inicializo_vector2()

// Si desea ver los hist$$HEX1$$f300$$ENDHEX$$ricos
IF ii_historicos = 0 THEN

   // Siguiente estado "Actuales"
	m_inst_afect.m_opciones.m_historicos.Text = "&Actual"
	m_inst_afect.m_opciones.m_historicos.ToolBarItemText = "Actual"
	m_inst_afect.m_opciones.m_historicos.ToolBarItemName = "Custom024!"

   // Muestro los hist$$HEX1$$f300$$ENDHEX$$ricos
	ii_historicos = 1
	ii_totales = 1
	dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 0")
	
	rb_sum_parciales.checked = FALSE
	rb_sum_totales.checked = TRUE

ELSE
	
	// Siguiente estado los Hist$$HEX1$$f300$$ENDHEX$$ricos
	m_inst_afect.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_inst_afect.m_opciones.m_historicos.ToolBarItemText = "Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_inst_afect.m_opciones.m_historicos.ToolBarItemName = "Custom023!"	

	// Muestro los actuales
	ii_historicos = 0
 	dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 1")
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
	sle_fil_selec.text = String(dw_datos.RowCount())
	sle_fil_selec.Enabled = True
	st_fil_selec.Enabled = True
	st_valor_actual.Enabled = True
end if
//////////
dw_datos.SetRedraw(TRUE)
this.triggerevent("ue_actualizar")
end event

event ue_imprimir;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_imprimir
//
/////////////////////////////////////////////////////////////////////////
long job
String ls_sintaxis
//s_print str_print

if dw_datos.RowCount() = 0 then
	gnv_msg.f_mensaje("AM21", "", "", OK!)
	RETURN
end if

ls_Sintaxis = dw_datos.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )

str_print.dwprint=dw_impresion
str_print.parm1=ib_lista
st_valor_actual.visible = False
IF ib_lista  THEN
	dw_datos.sharedata(dw_impresion)
	str_print.dwprint = dw_impresion
	fw_fondo_transparente()	
	str_print.titulo="Informe de Instalaciones Afectadas"
ELSE
	str_print.titulo="Grafico de Instalaciones afectadas"
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
		ELSEIF ii_totales = 0 AND ii_ind_vec2 >= 1 THEN
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

event ue_tiepi;boolean lb_desmarco=false
integer li_cant_filas, li_cont, li_fila
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm, ls_color_fondo_mark
SetPointer(HourGlass!)
//dw_datos.SetRedraw(False)

li_cant_filas = dw_datos.RowCount()
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"tiepi_visible",1)
	dw_datos.SetItem(li_fila,"tiebt_visible",0)
	dw_datos.SetItem(li_fila,"saifi_visible",0)
	dw_datos.SetItem(li_fila,"saidi_visible",0)
	dw_datos.SetItem(li_fila,"caidi_visible",0)
	dw_datos.SetItem(li_fila,"asai_visible",0)

	IF ii_totales = 0 THEN
		dw_datos.SetItem(li_fila,"fila_marcada",0)
		dw_datos.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

// Si estoy mostrando tiepi (quiero pasar a tiebt)

IF ii_calidad <> 1 then
	// Cambio variable de estado
	ii_calidad = 1
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la datawindow
	dw_datos.Modify("sum_tiepi_propio_t.Visible = 1")
	dw_datos.Modify("sum_tiebt_propio_t.Visible = 0")
	dw_datos.Modify("sum_saifi_t.Visible = 0")
	dw_datos.Modify("sum_saidi_t.Visible = 0")
	dw_datos.Modify("sum_caidi_t.Visible = 0")
	dw_datos.Modify("sum_asai_t.Visible = 0")
END IF

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
	dw_datos.Modify("sum_saifi_tot.visible='0'")
	dw_datos.Modify("sum_saidi_tot.visible='0'")
	dw_datos.Modify("sum_caidi_tot.visible='0'")
	dw_datos.Modify("sum_asai_tot.visible='0'")
END IF
//
////
dw_datos.SelectRow(0, FALSE)
//ii_num_col_marca=0
IF (ii_column_clicked = 15) or (ii_column_clicked = 16) or (ii_column_clicked = 17) or &
	(ii_column_clicked = 18) or (ii_column_clicked = 19) or (ii_column_clicked = 7) and &
	ib_marcada = true then
	
	//Desmarco lo que estuviera marcado ya que cambio de opcion de menu
//	ls_color_fondo_norm = String(12632256)
//	ls_color_texto_norm = String(0)
//	ls_color_fondo_mark = String(65536*128+256*128+128)
//	
//	ls_column = dw_datos.Describe("#"+ String(ii_column_clicked) +".Name")
//	ls_column2 = ls_column + "_s"
//	ls_column3 = ls_column + "_a"

	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		w_4004_instalaciones_afectadas.fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
		lb_desmarco=true	
	END IF
	if not lb_desmarco then	fw_inicializo_vector()
end if
////	Inicializo el vector

////fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

//dw_datos.SetRedraw(True)
end event

event ue_tiebt;boolean lb_desmarco=false
integer li_cant_filas, li_cont, li_fila
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm, ls_color_fondo_mark
SetPointer(HourGlass!)
//dw_datos.SetRedraw(False)

li_cant_filas = dw_datos.RowCount()
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"tiebt_visible",1)
	dw_datos.SetItem(li_fila,"tiepi_visible",0)
	dw_datos.SetItem(li_fila,"saifi_visible",0)
	dw_datos.SetItem(li_fila,"saidi_visible",0)
	dw_datos.SetItem(li_fila,"caidi_visible",0)
	dw_datos.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos.SetItem(li_fila,"fila_marcada",0)
		dw_datos.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

// Si estoy mostrando tiepi (quiero pasar a tiebt)

IF ii_calidad <> 2 then
//
//	// Cambio variable de estado.
	ii_calidad = 2
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	dw_datos.Modify("sum_tiepi_propio_t.Visible = 0")
	dw_datos.Modify("sum_tiebt_propio_t.Visible = 1")
	dw_datos.Modify("sum_saifi_t.Visible = 0")
	dw_datos.Modify("sum_saidi_t.Visible = 0")
	dw_datos.Modify("sum_caidi_t.Visible = 0")
	dw_datos.Modify("sum_asai_t.Visible = 0")
END IF

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
	dw_datos.Modify("sum_saifi_tot.visible='0'")
	dw_datos.Modify("sum_saidi_tot.visible='0'")
	dw_datos.Modify("sum_caidi_tot.visible='0'")
	dw_datos.Modify("sum_asai_tot.visible='0'")
END IF

//
dw_datos.SelectRow(0, FALSE)

//ii_num_col_marca=0
IF (ii_column_clicked = 15) or (ii_column_clicked = 16) or (ii_column_clicked = 17) or &
	(ii_column_clicked = 18) or (ii_column_clicked = 19) or (ii_column_clicked = 7) and &
	ib_marcada=true then

	//Desmarco lo que estuviera marcado ya que cambio de opcion de menu
//	ls_color_fondo_norm = String(12632256)
//	ls_color_texto_norm = String(0)
//	ls_color_fondo_mark = String(65536*128+256*128+128)
//	
//	ls_column = dw_datos.Describe("#"+ String(ii_column_clicked) +".Name")
//	ls_column2 = ls_column + "_s"
//	ls_column3 = ls_column + "_a"


	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		w_4004_instalaciones_afectadas.fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
		lb_desmarco = true
	END IF
	if not lb_desmarco then	fw_inicializo_vector()
end if
//	Inicializo el vector

//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

//dw_datos.SetRedraw(True)
end event

event ue_saidi;boolean lb_desmarco=false
integer li_cant_filas, li_cont, li_fila
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm, ls_color_fondo_mark
SetPointer(HourGlass!)
//dw_datos.SetRedraw(False)

li_cant_filas = dw_datos.RowCount()
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"saifi_visible",0)
	dw_datos.SetItem(li_fila,"tiepi_visible",0)
	dw_datos.SetItem(li_fila,"tiebt_visible",0)
	dw_datos.SetItem(li_fila,"saidi_visible",1)
	dw_datos.SetItem(li_fila,"caidi_visible",0)
	dw_datos.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos.SetItem(li_fila,"fila_marcada",0)
		dw_datos.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP
IF ii_calidad <> 4 then
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	ii_calidad = 4
	dw_datos.Modify("sum_tiepi_propio_t.Visible = 0")
	dw_datos.Modify("sum_tiebt_propio_t.Visible = 0")
	dw_datos.Modify("sum_saifi_t.Visible = 0")
	dw_datos.Modify("sum_saidi_t.Visible = 1")
	dw_datos.Modify("sum_caidi_t.Visible = 0")
	dw_datos.Modify("sum_asai_t.Visible = 0")
END IF

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
	dw_datos.Modify("sum_saifi_tot.visible='0'")
	dw_datos.Modify("sum_saidi_tot.visible='1'")
	dw_datos.Modify("sum_caidi_tot.visible='0'")
	dw_datos.Modify("sum_asai_tot.visible='0'")
END IF

//
dw_datos.SelectRow(0, FALSE)
//ii_num_col_marca=0


IF (ii_column_clicked = 15) or (ii_column_clicked = 16) or (ii_column_clicked = 17) or &
	(ii_column_clicked = 18) or (ii_column_clicked = 19) or (ii_column_clicked = 7) then

//	//Desmarco lo que estuviera marcado ya que cambio de opcion de menu
//	ls_color_fondo_norm = String(12632256)
//	ls_color_texto_norm = String(0)
//	ls_color_fondo_mark = String(65536*128+256*128+128)
//	
//	ls_column = dw_datos.Describe("#"+ String(ii_column_clicked) +".Name")
//	ls_column2 = ls_column + "_s"
//	ls_column3 = ls_column + "_a"
	
	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		w_4004_instalaciones_afectadas.fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
		lb_desmarco=true	
	END IF
	if not lb_desmarco then	fw_inicializo_vector()
end if
//	Inicializo el vector

//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

//dw_datos.SetRedraw(True)
end event

event ue_saifi;boolean lb_desmarco=false
integer li_cant_filas, li_cont, li_fila
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm, ls_color_fondo_mark
SetPointer(HourGlass!)
//dw_datos.SetRedraw(False)

m_inst_afect.m_opciones.m_indicescalidad.m_tiepi.Checked = False
m_inst_afect.m_opciones.m_indicescalidad.m_tiebt.Checked = False
m_inst_afect.m_opciones.m_indicescalidad.m_saifi.Checked = True
m_inst_afect.m_opciones.m_indicescalidad.m_saidi.Checked = False
m_inst_afect.m_opciones.m_indicescalidad.m_caidi.Checked = False
m_inst_afect.m_opciones.m_indicescalidad.m_asai.Checked = False

li_cant_filas = dw_datos.RowCount()
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"saifi_visible",1)
	dw_datos.SetItem(li_fila,"tiepi_visible",0)
	dw_datos.SetItem(li_fila,"tiebt_visible",0)
	dw_datos.SetItem(li_fila,"saidi_visible",0)
	dw_datos.SetItem(li_fila,"caidi_visible",0)
	dw_datos.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos.SetItem(li_fila,"fila_marcada",0)
		dw_datos.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
IF ii_calidad <> 3 then
	ii_calidad = 3
	dw_datos.Modify("sum_tiepi_propio_t.Visible = 0")
	dw_datos.Modify("sum_tiebt_propio_t.Visible = 0")
	dw_datos.Modify("sum_saifi_t.Visible = 1")
	dw_datos.Modify("sum_saidi_t.Visible = 0")
	dw_datos.Modify("sum_caidi_t.Visible = 0")
	dw_datos.Modify("sum_asai_t.Visible = 0")
END IF

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
	dw_datos.Modify("sum_saifi_tot.visible='1'")
	dw_datos.Modify("sum_saidi_tot.visible='0'")
	dw_datos.Modify("sum_caidi_tot.visible='0'")
	dw_datos.Modify("sum_asai_tot.visible='0'")
END IF

//
dw_datos.SelectRow(0, FALSE)
//ii_num_col_marca=0
IF (ii_column_clicked = 15) or (ii_column_clicked = 16) or (ii_column_clicked = 17) or &
	(ii_column_clicked = 18) or (ii_column_clicked = 19) or (ii_column_clicked = 7) then

	//Desmarco lo que estuviera marcado ya que cambio de opcion de menu
//	ls_color_fondo_norm = String(12632256)
//	ls_color_texto_norm = String(0)
//	ls_color_fondo_mark = String(65536*128+256*128+128)
//	
//	ls_column = dw_datos.Describe("#"+ String(ii_column_clicked) +".Name")
//	ls_column2 = ls_column + "_s"
//	ls_column3 = ls_column + "_a"


	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		w_4004_instalaciones_afectadas.fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
		lb_desmarco=true
	END IF
	if not lb_desmarco then	fw_inicializo_vector()
end if
//	Inicializo el vector

//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

//dw_datos.SetRedraw(True)
end event

event ue_caidi;boolean lb_desmarco=false
integer li_cant_filas, li_cont, li_fila
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm, ls_color_fondo_mark
SetPointer(HourGlass!)
//dw_datos.SetRedraw(False)

li_cant_filas = dw_datos.RowCount()
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"saifi_visible",0)
	dw_datos.SetItem(li_fila,"tiepi_visible",0)
	dw_datos.SetItem(li_fila,"tiebt_visible",0)
	dw_datos.SetItem(li_fila,"saidi_visible",0)
	dw_datos.SetItem(li_fila,"caidi_visible",1)
	dw_datos.SetItem(li_fila,"asai_visible",0)
	IF ii_totales = 0 THEN
		dw_datos.SetItem(li_fila,"fila_marcada",0)
		dw_datos.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

IF ii_calidad <> 5 then
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	ii_calidad = 5
	dw_datos.Modify("sum_tiepi_propio_t.Visible = 0")
	dw_datos.Modify("sum_tiebt_propio_t.Visible = 0")
	dw_datos.Modify("sum_saifi_t.Visible = 0")
	dw_datos.Modify("sum_saidi_t.Visible = 0")
	dw_datos.Modify("sum_caidi_t.Visible = 1")
	dw_datos.Modify("sum_asai_t.Visible = 0")
END IF

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
	dw_datos.Modify("sum_saifi_tot.visible='0'")
	dw_datos.Modify("sum_saidi_tot.visible='0'")
	dw_datos.Modify("sum_caidi_tot.visible='1'")
	dw_datos.Modify("sum_asai_tot.visible='0'")
END IF

//
dw_datos.SelectRow(0, FALSE)
//ii_num_col_marca=0
IF (ii_column_clicked = 15) or (ii_column_clicked = 16) or (ii_column_clicked = 17) or &
	(ii_column_clicked = 18) or (ii_column_clicked = 19) or (ii_column_clicked = 7) then
	//Desmarco lo que estuviera marcado ya que cambio de opcion de menu
	
//	ls_color_fondo_norm = String(12632256)
//	ls_color_texto_norm = String(0)
//	ls_color_fondo_mark = String(65536*128+256*128+128)
//	
//	ls_column = dw_datos.Describe("#"+ String(ii_column_clicked) +".Name")
//	ls_column2 = ls_column + "_s"
//	ls_column3 = ls_column + "_a"

	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		w_4004_instalaciones_afectadas.fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
		lb_desmarco=true	
	END IF
	if not lb_desmarco then	fw_inicializo_vector()
end if
//	Inicializo el vector

//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

//dw_datos.SetRedraw(True)
end event

event ue_asai;boolean lb_desmarco=false
integer li_cant_filas, li_cont, li_fila
string ls_column, ls_column2, ls_column3, ls_color_fondo_norm, ls_color_texto_norm, ls_color_fondo_mark
SetPointer(HourGlass!)
//dw_datos.SetRedraw(False)

li_cant_filas = dw_datos.RowCount()
fw_des_column_selec()
fw_inicializo_vector()
IF ii_totales = 0 THEN fw_inicializo_vector2()

li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"saifi_visible",0)
	dw_datos.SetItem(li_fila,"tiepi_visible",0)
	dw_datos.SetItem(li_fila,"tiebt_visible",0)
	dw_datos.SetItem(li_fila,"saidi_visible",0)
	dw_datos.SetItem(li_fila,"caidi_visible",0)
	dw_datos.SetItem(li_fila,"asai_visible",1)

	IF ii_totales = 0 THEN
		dw_datos.SetItem(li_fila,"fila_marcada",0)
		dw_datos.SetItem(li_fila,"sumas_promedio",0)
	ELSE
		dw_datos.SetItem(li_fila,"sumas_promedio",1)
	END IF
	li_fila ++
LOOP

IF ii_calidad <> 6 then
	// Seteo t$$HEX1$$ed00$$ENDHEX$$tulos de la <Dw>	
	ii_calidad = 6
	dw_datos.Modify("sum_tiepi_propio_t.Visible = 0")
	dw_datos.Modify("sum_tiebt_propio_t.Visible = 0")
	dw_datos.Modify("sum_saifi_t.Visible = 0")
	dw_datos.Modify("sum_saidi_t.Visible = 0")
	dw_datos.Modify("sum_caidi_t.Visible = 0")
	dw_datos.Modify("sum_asai_t.Visible = 1")
END IF

// Carga las computed columns con tiepi, tiebt, etc.

IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
	dw_datos.Modify("sum_saifi_tot.visible='0'")
	dw_datos.Modify("sum_saidi_tot.visible='0'")
	dw_datos.Modify("sum_caidi_tot.visible='0'")
	dw_datos.Modify("sum_asai_tot.visible='1'")
END IF

//
dw_datos.SelectRow(0, FALSE)
//ii_num_col_marca=0
IF (ii_column_clicked = 15) or (ii_column_clicked = 16) or (ii_column_clicked = 17) or &
	(ii_column_clicked = 18) or (ii_column_clicked = 19) or (ii_column_clicked = 7) then
	//Desmarco lo que estuviera marcado ya que cambio de opcion de menu
	
//	ls_color_fondo_norm = String(12632256)
//	ls_color_texto_norm = String(0)
//	ls_color_fondo_mark = String(65536*128+256*128+128)
//	
//	ls_column = dw_datos.Describe("#"+ String(ii_column_clicked) +".Name")
//	ls_column2 = ls_column + "_s"
//	ls_column3 = ls_column + "_a"


	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		w_4004_instalaciones_afectadas.fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
		lb_desmarco=true	
	END IF
	if not lb_desmarco then	fw_inicializo_vector()
end if
//	Inicializo el vector

//fw_inicializo_vector2()

This.TriggerEvent("ue_botones")

//dw_datos.SetRedraw(True)
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
SetPointer(HourGlass!)

gr.Reset(ALL!)
gr.setRedraw(false)

iu_gen_gra = CREATE u_gen_nu_gra_0001

iu_gen_gra.fnu_gra_titulo(gr,"Estad$$HEX1$$ed00$$ENDHEX$$stica de Instalaciones Afectadas")
//iu_gen_gra.fnu_gra_titulo(gr,"Statistics of Affected Installations")

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
	iu_gen_gra.fnu_titulo_x(gr,"Instalaciones Afectadas")
//	iu_gen_gra.fnu_titulo_x(gr,"Affected Instalations")
end if

iu_gen_gra.fnu_gra_cargo_datos(gr,dw_datos,1,True,iivec_col_selec[],iivec_fil_selec[])

DESTROY iu_gen_gra 

gr.setRedraw(true)
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

IF Integer(dw_datos.Describe("fecha.visible")) = 1 THEN
	li_column_zona = 11
	li_column_zona = fw_obtener_numero_columna ('fecha')
else
	li_column_zona = 2
	li_column_zona = fw_obtener_numero_columna ('nom_instalacion')
END IF

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)

li_ind = 1
iivec_col_selec[li_ind] = li_column_zona

FOR li_ind = 2 TO dw_datos.RowCount() 
	IF iivec_col_selec[li_ind -1] >= 0 THEN
	
		ls_column = dw_datos.Describe("#"+ String(iivec_col_selec[li_ind - 1]) +".Name")
		ls_column2 = ls_column + "_s"
//		ls_column3 = ls_column + "_a"
		ls_column3 = ls_column + "_m"
	
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")

		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")

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
li_ind =1
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

FOR li_ind = 1 TO dw_datos.RowCount()
	iivec_fil_selec[li_ind] = 0
NEXT

ii_ind_vec2 = 1

RETURN 1
end function

public subroutine fw_inicializo_vec_padre ();///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_inicializo_vec_padre
//
///////////////////////////////////////////////////////////////////////

// Inicializa el vector de padres en vac$$HEX1$$ed00$$ENDHEX$$o.

integer is_cont

for is_cont = 1 to 20
	is_vec_padre[is_cont] = ''
next
end subroutine

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
//	02/02/2001	   GSE				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
/////////////////////////////////////////////////////////////////////////////////////////////

int li_retorno

if dw_datos.rowcount() > 0 THEN
	dw_datos.SetTabOrder (ps_nombre,10)
	dw_datos.setcolumn(ps_nombre)
	li_retorno = dw_datos.getcolumn()
	dw_datos.SetTabOrder (ps_nombre,0)
ELSE
	li_retorno = -1
END IF		

Return li_retorno
end function

public subroutine fw_des_column_selec ();string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm, ls_column
string ls_column2, ls_column3, ls_column4, ls_column5
int li_indice, li_vec_col_selec[]

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)
ls_color_fondo_mark = String(65536*128+256*128+128)

FOR li_indice=1 to integer(dw_datos.Object.DataWindow.Column.Count)

//Desmarco lo que estuviera marcado ya que cambio de opcion de menu

	ls_column = dw_datos.Describe("#"+ String(li_indice) +".Name")
	ls_column2 = ls_column + "_s"
	ls_column3 = ls_column + "_a"
	ls_column4 = ls_column + "_p"
	ls_column5 = ls_column + "_tot"
	
	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco
		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column4 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column4 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column4 +".Text.Color="+ ls_color_texto_norm +" ")

		dw_datos.Modify(" "+ ls_column5 +".Background.Mode=0")
		dw_datos.Modify(" "+ ls_column5 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column5 +".Text.Color="+ ls_color_texto_norm +" ")

		fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
	
	END IF
NEXT

iivec_col_selec = li_vec_col_selec
fw_inicializo_vector()
end subroutine

public subroutine fw_seleccionar_todo ();int li_indice
for li_indice=1 to integer(dw_datos.Object.DataWindow.Column.Count)
	if li_indice <>2 and li_indice <> 11 then
		ii_column_clicked=li_indice
		dw_datos.triggerevent(doubleclicked!)
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
li_num_cols = integer(dw_datos.object.DataWindow.Column.Count)
for li_contador = 1 to li_num_cols
	dw_impresion.Modify("#" + string(li_contador) + ".background.color = " + gs_blanco)		
NEXT
end subroutine

event open;/////////////////////////////////////////////////////////////////////////
//
// Event:  open
//
// Objetivo: Open de la ventana de la BDG con las estad$$HEX1$$ed00$$ENDHEX$$sticas de 
//           instalaciones afectadas
//
/////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED

// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//	iu_gen_comunic  --> para cargar la estructura local 

dateTime ld_fecha_ok_bdg

SetPointer(HourGlass!)
This.SetRedraw(False)
ib_lista = True //En True indica que se esta desplegando la lista,
                //  en False indica que se esta desplegando la Gr$$HEX1$$e100$$ENDHEX$$fica
ii_num_col_marca=0 //Inicializo variable

iu_gen_comunic  = CREATE u_generico_comunicaciones
iu_gen_comunic.is_comunic = gu_comunic.is_comunic

// Creo objeto de n$$HEX1$$fa00$$ENDHEX$$cleo de la datawindow
iu_bdg_2005_nu = CREATE u_bdg_2005_nu_instal_afect

// Seteo el nombre de la ventana
SELECT FECHA_OK INTO :ld_fecha_ok_bdg FROM GI_BDG_OK WHERE PROGRAMA = '4004';
This.title = gu_comunic.f_titulo_ventana("w_4004","instal_afect")  + '  - Actualizado: ' + string(date(ld_fecha_ok_bdg))

// Inserto una fila y conecto a la D.W. de 
// los datos por zona geogr$$HEX1$$e100$$ENDHEX$$fica
dw_datos.insertRow(0)
dw_datos.SetTransObject(sqlca)

// Conecto las D.D.D.W. del objeto "criterio de selecci$$HEX1$$f300$$ENDHEX$$n",
// filtro sus campos, y seteo a los mismos
// con "Todos"

// Inicializo estado inicial en Estaci$$HEX1$$f300$$ENDHEX$$n
//AG Matorra - is_nro_inst_padre = '99999999999999'
is_nro_inst_padre = '99999999'
ii_nivel = 1

dw_criterio_seleccion.fpr_crea_dddw()

dw_criterio_seleccion.fpr_cargar_alcance(fgci_todos)
dw_criterio_seleccion.f_insertar_fila()
this.fw_inicializo_vec_padre()
is_vec_padre[1] = '<Ninguna>'
is_vec_nro_padre[1] = '99999999'
dw_datos.setFilter('TIP_INSTALACION = 1')
dw_criterio_seleccion.modify('txt_inst_seleccionada.text = ~"' + is_vec_padre[ii_nivel] + '~"')

dw_criterio_seleccion.SetItem(1,"pa_periodo",fgnu_fecha_actual())
dw_criterio_seleccion.SetItem(1,"pa_unidades",1)
dw_criterio_seleccion.SetItem(1,"pa_acumulado_sn",0)
dw_criterio_seleccion.SetItem(1,"pa_tip_instalacion",'1')
dw_criterio_seleccion.SetItem(1,"pa_tipo_incidencia",0)
dw_criterio_seleccion.SetItem(1,"pa_alcance",0)
dw_criterio_seleccion.Modify('pa_alcance.Protect = 1')
dw_criterio_seleccion.Modify('pa_alcance.Background.Color = ' + gs_gris)	 
dw_criterio_seleccion.Accepttext()

// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
dw_ambito.Show()
dw_ambito.f_insertar_fila()

// Conecto las D.D.D.W del objeto "$$HEX1$$e100$$ENDHEX$$mbito",
// filtro sus campos, y seteo a los mismos
// con "Todos".
dw_ambito.fpr_crea_dddw()
dw_ambito.fnu_filtro_centro()
dw_ambito.SetItem(1,"nro_centro",fgci_todos)				
dw_ambito.fpr_filtro_cmd()
dw_ambito.SetItem(1,"nro_cmd",fgci_todos)
dw_ambito.fpr_filtro_mesa()
dw_ambito.SetItem(1,"nro_mesa",fgci_todos)
//dw_ambito.fnu_deshab_cmd(dw_ambito)
dw_ambito.fnu_deshab_puesto(dw_ambito)
dw_ambito.SetColumn("nro_centro")

// Seteo la presentaci$$HEX1$$f300$$ENDHEX$$n inicial de la lista de datos
// Por defecto muestra los datos actuales (no los historicos)
ii_historicos = 0
ii_totales = 1
ii_acumulado = 0
ii_unidades = 1
ii_calidad = 1

m_inst_afect.m_opciones.m_indicescalidad.m_tiepi.checked = true

IF fgci_con_operaciones=0 THEN
	// No hay interface con operaciones
	dw_criterio_seleccion.Modify("pa_operaciones_sgi.visible=1")
END IF

// Cargo los datos en la lista
This.postEvent("ue_actualizar")

// Inicializo el vector
This.fw_inicializo_vector()
This.fw_inicializo_vector2()

// Oculto la Gr$$HEX1$$e100$$ENDHEX$$fica
st_valor_actual.Hide()
gr_grafica.Hide()
gr_sectores.Hide()
pb_graficar.Enabled = False
pb_sectores.Enabled = False

This.SetRedraw(True)
end event

event close;/////////////////////////////////////////////////////////////////////////
//
// Event:  close
//
/////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED
end event

on w_4004_instalaciones_afectadas.create
int iCurrent
call super::create
if this.MenuName = "m_inst_afect" then this.MenuID = create m_inst_afect
this.sle_fil_selec=create sle_fil_selec
this.st_fil_selec=create st_fil_selec
this.pb_avanzar=create pb_avanzar
this.pb_retroceder=create pb_retroceder
this.rb_sum_parciales=create rb_sum_parciales
this.rb_sum_totales=create rb_sum_totales
this.dw_ambito=create dw_ambito
this.gb_sumas=create gb_sumas
this.pb_sectores=create pb_sectores
this.pb_graficar=create pb_graficar
this.dw_criterio_seleccion=create dw_criterio_seleccion
this.st_valor_actual=create st_valor_actual
this.dw_datos=create dw_datos
this.gr_grafica=create gr_grafica
this.gr_sectores=create gr_sectores
this.dw_impresion=create dw_impresion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_fil_selec
this.Control[iCurrent+2]=this.st_fil_selec
this.Control[iCurrent+3]=this.pb_avanzar
this.Control[iCurrent+4]=this.pb_retroceder
this.Control[iCurrent+5]=this.rb_sum_parciales
this.Control[iCurrent+6]=this.rb_sum_totales
this.Control[iCurrent+7]=this.dw_ambito
this.Control[iCurrent+8]=this.gb_sumas
this.Control[iCurrent+9]=this.pb_sectores
this.Control[iCurrent+10]=this.pb_graficar
this.Control[iCurrent+11]=this.dw_criterio_seleccion
this.Control[iCurrent+12]=this.st_valor_actual
this.Control[iCurrent+13]=this.dw_datos
this.Control[iCurrent+14]=this.gr_grafica
this.Control[iCurrent+15]=this.gr_sectores
this.Control[iCurrent+16]=this.dw_impresion
end on

on w_4004_instalaciones_afectadas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_fil_selec)
destroy(this.st_fil_selec)
destroy(this.pb_avanzar)
destroy(this.pb_retroceder)
destroy(this.rb_sum_parciales)
destroy(this.rb_sum_totales)
destroy(this.dw_ambito)
destroy(this.gb_sumas)
destroy(this.pb_sectores)
destroy(this.pb_graficar)
destroy(this.dw_criterio_seleccion)
destroy(this.st_valor_actual)
destroy(this.dw_datos)
destroy(this.gr_grafica)
destroy(this.gr_sectores)
destroy(this.dw_impresion)
end on

event closequery;call super::closequery;/////////////////////////////////////////////////////////////////////////
//
// Event:  closequery
//
/////////////////////////////////////////////////////////////////////////

// Destruyo objetos creados 
DESTROY iu_gen_comunic  
DESTROY iu_bdg_2005_nu
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_4004_instalaciones_afectadas
end type

type sle_fil_selec from singlelineedit within w_4004_instalaciones_afectadas
integer x = 3113
integer y = 1156
integer width = 183
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_fil_selec from statictext within w_4004_instalaciones_afectadas
integer x = 3026
integer y = 1088
integer width = 402
integer height = 64
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

type pb_avanzar from picturebutton within w_4004_instalaciones_afectadas
boolean visible = false
integer x = 2688
integer y = 1216
integer width = 96
integer height = 80
integer taborder = 80
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

type pb_retroceder from picturebutton within w_4004_instalaciones_afectadas
boolean visible = false
integer x = 3159
integer y = 1324
integer width = 96
integer height = 80
integer taborder = 70
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

int li_todos, li_ind, li_fila_encontrada, li_tip_instalacion
string ls_posicion_anterior

//dw_datos.SetRedraw(False)

// Reseteo el $$HEX1$$e100$$ENDHEX$$mbito
dw_ambito.SetItem(1,"nro_centro",0) 
dw_ambito.SetItem(1,"nro_cmd",0) 
dw_ambito.SetItem(1,"nro_mesa",0) 
dw_ambito.fnu_habi_centro()
dw_ambito.fnu_hab_cmd(dw_ambito)
dw_ambito.fnu_deshab_puesto(dw_ambito)
dw_ambito.AcceptText()
//dw_ambito.fnu_filtro_centro()

// Guardo posicion del padre actual para ubicarlo en la nueva lista
ls_posicion_anterior = is_nro_inst_padre

// Almaceno padre anterior para retomar posicion
ls_posicion_anterior = is_vec_nro_padre[ii_nivel]

// Si no estoy en Estaci$$HEX1$$f300$$ENDHEX$$n (tope), Disminuyo el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n
li_tip_instalacion = integer(dw_criterio_seleccion.getItemString(1,"pa_tip_instalacion"))

if li_tip_instalacion > 0 then
	li_tip_instalacion --
	dw_criterio_seleccion.SetItem(1,"pa_tip_instalacion",string(li_tip_instalacion))
end if

dw_datos.setFilter('')

// Encuentro padre actual y traigo los datos con $$HEX1$$e900$$ENDHEX$$l
ii_nivel --

is_nro_inst_padre = is_vec_nro_padre[ii_nivel]

Parent.TriggerEvent("ue_actualizar")
//AG Matorra
//Asignaci$$HEX1$$f300$$ENDHEX$$n nombre recuperado en <dw_datos> a caja de texto
dw_criterio_seleccion.Modify('txt_inst_seleccionada.text = ~"' + dw_datos.GetItemString(ii_fila_clicked,"nom_instalacion") + '~"')

// Encuentro la fila con el padre anterior
li_fila_encontrada = dw_datos.find('nro_instalacion = ' + ls_posicion_anterior , 1, dw_datos.rowCount())
if li_fila_encontrada = 0 then
	gnv_msg.f_mensaje("EB02","","",OK!)
	//messageBox("ERROR", "Instalaci$$HEX1$$f300$$ENDHEX$$n padre no ha sido encontrada.")
	return
end if

// Si llegu$$HEX2$$e9002000$$ENDHEX$$al tope, deshabilito el bot$$HEX1$$f300$$ENDHEX$$n de retroceder
if ii_nivel = 1 then
	this.enabled = FALSE
end if

IF ii_totales = 1 THEN
	ii_totales = 0
	rb_sum_totales.triggerEvent("clicked")
ELSE
	ii_totales = 1
	rb_sum_parciales.triggerEvent("clicked")
END IF
end event

type rb_sum_parciales from radiobutton within w_4004_instalaciones_afectadas
integer x = 3031
integer y = 948
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

fw_des_column_selec()
//IF ii_totales = 0 THEN RETURN
if dw_criterio_seleccion.GetItemNumber(1,'pa_unidades') = 0 THEN
	this.checked = false
	this.enabled = false
	rb_sum_totales.checked = true
	rb_sum_totales.enabled = false
	return
end if
dw_datos.setRedraw(false)
ii_totales = 0
	
dw_datos.SetRowFocusIndicator(OFF!)

li_cant_filas = dw_datos.RowCount()
li_fila = 1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"fila_marcada",0)
	//MATO Desactiv. col. inf. Totales
   dw_datos.setItem(li_fila,"sumas_promedio",0) 
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

dw_datos.setRedraw(true)
end event

type rb_sum_totales from radiobutton within w_4004_instalaciones_afectadas
integer x = 3031
integer y = 868
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
// Event:  	Clicked
//
/////////////////////////////////////////////////////////////////////////
int li_fila, li_cant_filas, li_ind
fw_des_column_selec()
IF ii_totales = 1 THEN return

dw_datos.SetRedraw(False)
ii_totales = 1

li_cant_filas = dw_datos.RowCount()
li_fila = 1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"fila_marcada",1)
	//MATO Activo. col. inf. Totales
	dw_datos.setItem(li_fila,"sumas_promedio",1) 
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
	pb_graficar.Enabled = FALSE
	pb_sectores.Enabled = FALSE
ELSE
	// Habilito BOTONES graficar
	pb_graficar.Enabled = TRUE
	IF ii_num_col_marca=1 THEN
		pb_sectores.Enabled = TRUE
	ELSE
		pb_sectores.Enabled = FALSE
	END IF
END IF

dw_datos.SetRedraw(true)
dw_datos.SetRowFocusIndicator(FOCUSRECT!)

end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4004_instalaciones_afectadas
integer x = 210
integer y = 112
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

type gb_sumas from groupbox within w_4004_instalaciones_afectadas
integer x = 2999
integer y = 804
integer width = 416
integer height = 236
integer taborder = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = " Sumas"
end type

type pb_sectores from picturebutton within w_4004_instalaciones_afectadas
event clicked pbm_bnclicked
integer x = 3022
integer y = 640
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

dw_datos.SetRedraw(FALSE)
ii_tipo_graf=0

// Si est$$HEX2$$e1002000$$ENDHEX$$habilitada la datawindow de datos
IF dw_datos.Enabled = TRUE THEN
	
	// Seg$$HEX1$$fa00$$ENDHEX$$n lo que se est$$HEX2$$e9002000$$ENDHEX$$desplegando cambio la figura del bot$$HEX1$$f300$$ENDHEX$$n
	IF This.PictureName = "gra_sec.bmp" THEN
		ib_lista = FALSE 
		This.PictureName = "hfactu.bmp"
		dw_datos.hide()
		// Deshabilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = FALSE
		rb_sum_totales.Enabled = FALSE
		m_inst_afect.m_opciones.m_actualizar.Enabled = FALSE
		m_inst_afect.m_opciones.m_historicos.Enabled = FALSE
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
		dw_datos.Show()
		gr_sectores.Hide()
		st_valor_actual.Hide()

		IF ii_totales = 0 THEN
			
			// Recorro la datawindow evaluando las filas selecionadas
			li_ind = 1
			DO WHILE li_ind < ii_ind_vec2
				dw_datos.SelectRow(iivec_fil_selec[li_ind], TRUE)
				dw_datos.SetItem(iivec_fil_selec[li_ind], "fila_marcada", 1)
				li_ind ++
			LOOP

		END IF
		
		// Habilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = TRUE
		m_inst_afect.m_opciones.m_actualizar.Enabled = TRUE
		m_inst_afect.m_opciones.m_historicos.Enabled = TRUE
		dw_ambito.Enabled = TRUE
		dw_criterio_seleccion.Enabled = TRUE
		gb_sumas.Enabled= TRUE
//		pb_retroceder.Enabled = TRUE
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

dw_datos.SetRedraw(TRUE)
end event

type pb_graficar from picturebutton within w_4004_instalaciones_afectadas
event clicked pbm_bnclicked
integer x = 3232
integer y = 640
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

dw_datos.SetRedraw(FALSE)
ii_tipo_graf=1

// Si est$$HEX2$$e1002000$$ENDHEX$$habilitada la datawindow de datos
IF dw_datos.Enabled = TRUE THEN
	
	// Seg$$HEX1$$fa00$$ENDHEX$$n lo que se est$$HEX2$$e9002000$$ENDHEX$$desplegando cambio la figura del bot$$HEX1$$f300$$ENDHEX$$n
	IF This.PictureName = "grafico.bmp" THEN
		ib_lista = FALSE 
		This.PictureName = "hfactu.bmp"
		dw_datos.hide()
		// Deshabilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = FALSE
		rb_sum_totales.Enabled = FALSE
		m_inst_afect.m_opciones.m_actualizar.Enabled = FALSE
		m_inst_afect.m_opciones.m_historicos.Enabled = FALSE
		m_inst_afect.m_opciones.m_indicescalidad.m_tiepi.Enabled = False
		m_inst_afect.m_opciones.m_indicescalidad.m_tiebt.Enabled = False
		m_inst_afect.m_opciones.m_indicescalidad.m_saifi.Enabled = False	
		m_inst_afect.m_opciones.m_indicescalidad.m_saidi.Enabled = False
		m_inst_afect.m_opciones.m_indicescalidad.m_caidi.Enabled = False
		m_inst_afect.m_opciones.m_indicescalidad.m_asai.Enabled = False
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
		dw_datos.Show()
		gr_grafica.Hide()
		st_valor_actual.Hide()
		
		IF ii_totales = 0 THEN
			
			// Recorro la datawindow evaluando las filas selecionadas
			li_ind = 1
	
			DO WHILE li_ind < ii_ind_vec2
				dw_datos.SelectRow(iivec_fil_selec[li_ind], TRUE)
				dw_datos.SetItem(iivec_fil_selec[li_ind], "fila_marcada", 1)
				li_ind ++
			LOOP
			
		END IF
		
		// Habilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		IF dw_criterio_seleccion.GetItemNumber(1,'pa_unidades')=1 THEN
			rb_sum_parciales.Enabled = TRUE
			rb_sum_totales.Enabled = TRUE
		END IF
		m_inst_afect.m_opciones.m_actualizar.Enabled = TRUE
		m_inst_afect.m_opciones.m_historicos.Enabled = TRUE
		m_inst_afect.m_opciones.m_indicescalidad.m_tiepi.Enabled = TRUE
		m_inst_afect.m_opciones.m_indicescalidad.m_tiebt.Enabled = TRUE
		m_inst_afect.m_opciones.m_indicescalidad.m_saifi.Enabled = TRUE	
		m_inst_afect.m_opciones.m_indicescalidad.m_saidi.Enabled = TRUE
		m_inst_afect.m_opciones.m_indicescalidad.m_caidi.Enabled = TRUE
		m_inst_afect.m_opciones.m_indicescalidad.m_asai.Enabled = TRUE

		dw_ambito.Enabled = TRUE
		dw_criterio_seleccion.Enabled = TRUE
		gb_sumas.Enabled= TRUE
//		pb_retroceder.Enabled = TRUE

		
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

dw_ambito.SetRedraw(true)
dw_datos.SetRedraw(TRUE)
end event

type dw_criterio_seleccion from u_bdg_2005_pr_criterio_seleccion within w_4004_instalaciones_afectadas
integer x = 347
integer width = 2930
integer height = 548
integer taborder = 10
boolean border = false
end type

event itemchanged;call super::itemchanged;///////////////////////////////////////////////////////////////////////
//
//	Event:	itemchanged
//
///////////////////////////////////////////////////////////////////////

string ls_columna, ls_tip_instalacion
int li_valor , li_unidad
this.Accepttext()
ls_columna = this.getColumnName()
li_valor = integer(this.getText())

// Inicializo estado de navegaci$$HEX1$$f300$$ENDHEX$$n
ii_nivel = 1
pb_retroceder.Enabled = false
dw_criterio_seleccion.modify('txt_inst_seleccionada.text = ~"' + is_vec_padre[ii_nivel] + '~"')
is_nro_inst_padre = is_vec_nro_padre[ii_nivel]

//AG Matorra - Parent.TriggerEvent("ue_actualizar")

CHOOSE CASE ls_columna
	CASE "pa_unidades"
		li_unidad = this.object.pa_unidades[1]
		if li_unidad <> integer(data) then
			fw_des_column_selec()
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
		ii_unidades = li_valor
		parent.TriggerEvent("ue_a_porcentajes")
		return
	CASE "pa_acumulado_sn"
		ii_acumulado = li_valor		
		//dw_Datos.reset()
		Parent.TriggerEvent("ue_actualizar")
		return
	CASE "pa_tip_instalacion"
		ls_tip_instalacion= this.getText()
		dw_datos.setFilter('')
		dw_datos.filter()
		dw_datos.setFilter('TIP_INSTALACION = ' + ls_tip_instalacion)
		dw_datos.filter()
		return
	CASE "pa_tipo_incidencia"
		fpr_cargar_alcance(li_valor)
		this.Modify('pa_alcance.Protect = 0')
	  	this.Modify('pa_alcance.Background.Color = ' + gs_blanco)	
		IF li_valor=0 then
			this.setredraw(false)
			this.Modify('pa_alcance.Protect = 1')
	  		this.Modify('pa_alcance.Background.Color = ' + gs_gris)	 
			this.setredraw(true)
		END IF
		This.SetItem(1,'pa_alcance',0)

	CASE "pa_operaciones_sgi"
		ii_operacion = li_valor
		dw_Datos.reset()
		this.Accepttext()
		//Parent.TriggerEvent("ue_actualizar")
		return
	CASE "pa_alcance"
		ii_alcance= li_valor
		this.Accepttext()
		return
END CHOOSE
Parent.TriggerEvent("ue_resetear_datos")
end event

type st_valor_actual from statictext within w_4004_instalaciones_afectadas
integer x = 2290
integer y = 604
integer width = 626
integer height = 132
integer textsize = -7
integer weight = 700
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

type dw_datos from u_bdg_2005_pr_instal_afect within w_4004_instalaciones_afectadas
integer y = 596
integer width = 2926
integer height = 1120
integer taborder = 30
string dataobject = "d_bdg_2005_pr_instal_afect"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	doubleclicked
//
/////////////////////////////////////////////////////////////////////////
string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm, ls_nom_instalacion
string ls_color_texto_mark
string ls_column, ls_column2, ls_column3, ls_column4, ls_column5
integer li_tip_instalacion

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)
//ls_color_fondo_mark = String(RGB(255,0,0))
ls_color_fondo_mark = String(65536*128+256*128+128)
ls_color_texto_mark = String(0)

this.SetRedraw(False)		


// Si la columna no es un t$$HEX1$$ed00$$ENDHEX$$tulo y no es la fecha
IF ii_column_clicked > 0 and ii_column_clicked <> fw_obtener_numero_columna('fecha') THEN

	// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona, avanzo
	IF ii_column_clicked = fw_obtener_numero_columna('nom_instalacion') THEN

//		// Si estoy en parciales o llegu$$HEX2$$e9002000$$ENDHEX$$al fondo, no avanzo
//		li_tip_instalacion =integer(dw_criterio_seleccion.getItemString(1,"pa_tip_instalacion"))
//		if ii_totales = 0 or li_tip_instalacion = 5 then
//			this.SetRedraw(true)		
//			return
//		end if
//
//		ii_nivel ++
//
//		// Guardo el nombre y n$$HEX1$$fa00$$ENDHEX$$mero del padre en los vectores		
//      ls_nom_instalacion = this.getItemString(ii_fila_clicked, "nom_instalacion")
//		is_vec_padre[ii_nivel] = trim(ls_nom_instalacion)
//		is_vec_nro_padre[ii_nivel] = string(this.getItemNumber(ii_fila_clicked, "nro_instalacion"))
//		is_nro_inst_padre = is_vec_nro_padre[ii_nivel] 
//
//		// Aumento el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n		
//		li_tip_instalacion++
//		dw_criterio_seleccion.SetItem(1,"pa_tip_instalacion",string(li_tip_instalacion))
//
//		IF ii_totales = 1 THEN
//			Parent.TriggerEvent("ue_actualizar")
//		END IF
//
//      //--MATO--//
//		//Si no trajo datos realizo <Retrieve> retrocediendo 
//		//al nivel anterior para volcar de nuevo los datos.
//		IF dw_datos.RowCount() = 0 THEN
//			pb_retroceder.triggerEvent("clicked")
//			//AG Matorra - gnv_msg.f_mensaje("AB02","","",OK!)
//		END IF
//		//--------//
//
//		if ii_nivel > 1 then
//			pb_retroceder.enabled = TRUE	
//		end if GSE 12/02/2001
	ELSE 
		ib_habilitado = rb_sum_parciales.enabled and rb_sum_totales.enabled
      // Si quiere marcar/desmarcar una columna
		ls_column = This.Describe("#"+ String(ii_column_clicked) +".Name")
		ls_column2 = ls_column + "_s"
		ls_column3 = ls_column + "_a"
		ls_column4 = ls_column + "_p"
		ls_column5 = ls_column + "_tot"

		// Si estaba desmarcada, la marco
 		IF This.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_norm THEN

			This.Modify(" "+ ls_column +".Background.Mode=0")
			This.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_mark +" ")	

			This.Modify(" "+ ls_column2 +".Background.Mode=0")
			This.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_mark +" ")

			This.Modify(" "+ ls_column3 +".Background.Mode=0")
			This.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_mark +" ")
			
			This.Modify(" "+ ls_column4 +".Background.Mode=0")
			This.Modify(" "+ ls_column4 +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_column4 +".Text.Color="+ ls_color_texto_mark +" ")

			This.Modify(" "+ ls_column5 +".Background.Mode=0")
			This.Modify(" "+ ls_column5 +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_column5 +".Text.Color="+ ls_color_texto_mark +" ")

			Parent.fw_marcar_col(ii_column_clicked)
			ii_num_col_marca ++
			ib_marcada =true
		ELSEIF This.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN

			// Si estaba marcada, la desmarco
			This.Modify(" "+ ls_column +".Background.Mode=1")
			This.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")

			This.Modify(" "+ ls_column2 +".Background.Mode=1")
			This.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")

			This.Modify(" "+ ls_column3 +".Background.Mode=1")
			This.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")

			This.Modify(" "+ ls_column4 +".Background.Mode=1")
			This.Modify(" "+ ls_column4 +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_column4 +".Text.Color="+ ls_color_texto_norm +" ")
			
			This.Modify(" "+ ls_column5 +".Background.Mode=0")
			This.Modify(" "+ ls_column5 +".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_column5 +".Text.Color="+ ls_color_texto_norm +" ")


			Parent.fw_desmarcar_col(ii_column_clicked)
			ii_num_col_marca --
			ib_marcada=false
		END IF
		
		Parent.TriggerEvent("ue_botones")
	END IF
END IF

this.SetRedraw(True)
end event

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  clicked
//
/////////////////////////////////////////////////////////////////////////

ii_fila_clicked = row
ii_column_clicked = This.GetClickedColumn()

if ii_column_clicked=0 then
	//this.selectrow(0,false)
 	return 0
end if
dw_ambito.SetRedraw(False)

// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona
IF ii_column_clicked = fw_obtener_numero_columna('nom_instalacion') OR &
   ii_column_clicked = fw_obtener_numero_columna('fecha') THEN
	
	IF ii_fila_clicked > 0 THEN
		
		//	Si est$$HEX2$$e1002000$$ENDHEX$$en TOTALES
		IF ii_totales = 1 THEN
			
			If Long(This.Describe("nom_instalacion_t.Visible")) = 1 THEN
				dw_criterio_seleccion.Modify('txt_inst_seleccionada.text = ~"' + This.GetItemString(ii_fila_clicked,"nom_instalacion") + '~"')
         End If
			
		//	Si est$$HEX2$$e1002000$$ENDHEX$$en PARCIALES
		ELSE
			IF This.IsSelected(ii_fila_clicked) THEN
				This.SelectRow(ii_fila_clicked,False)	// deselecciono
				This.SetItem(ii_fila_clicked,"fila_marcada",0)
				
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
dw_ambito.SetRedraw(true)
end event

event constructor;call super::constructor;///////////////////////////////////////////////////////////////////////////
////
//// Event:  	constructor
////
///////////////////////////////////////////////////////////////////////////
//
//This.SetRowFocusIndicator(FOCUSRECT!)
end event

event ue_mover_borde;//
end event

event ue_key_down;//
end event

event retrieveend;call super::retrieveend;int li_fila
double ld_valor

FOR li_fila=1 TO this.RowCount()
	ld_valor = this.GetItemNumber(li_fila,'tiepi_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'sum_tiepi_propio',ld_valor)
	
	//This.SetItem(li_fila,'sum_tiebt_propio',this.GetItemNumber(li_fila,'tiebt_ext'))
	ld_valor = this.GetItemNumber(li_fila,'saifi_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'sum_saifi',ld_valor)
	
	ld_valor = this.GetItemNumber(li_fila,'saidi_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'sum_saidi',ld_valor)
	
	ld_valor = this.GetItemNumber(li_fila,'caidi_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'sum_caidi',ld_valor)

	ld_valor = this.GetItemNumber(li_fila,'asai_ext')
	IF IsNull(ld_valor) THEN ld_valor = 0.
	This.SetItem(li_fila,'sum_asai',ld_valor)
NEXT
end event

type gr_grafica from graph within w_4004_instalaciones_afectadas
integer x = 9
integer y = 604
integer width = 2912
integer height = 1100
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

event other;integer SeriesNum, DataNum
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

type gr_sectores from graph within w_4004_instalaciones_afectadas
event other pbm_other
integer x = 9
integer y = 604
integer width = 2907
integer height = 1100
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

type dw_impresion from datawindow within w_4004_instalaciones_afectadas
boolean visible = false
integer x = 229
integer y = 912
integer width = 224
integer height = 172
integer taborder = 70
string dataobject = "d_bdg_2005_pr_instal_afect"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


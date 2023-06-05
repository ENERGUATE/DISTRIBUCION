HA$PBExportHeader$w_4008_brigadas.srw
forward
global type w_4008_brigadas from w_sgigenerica
end type
type st_fil_selec from statictext within w_4008_brigadas
end type
type rb_sum_totales from radiobutton within w_4008_brigadas
end type
type rb_sum_parciales from radiobutton within w_4008_brigadas
end type
type sle_fil_selec from singlelineedit within w_4008_brigadas
end type
type gb_sumas from groupbox within w_4008_brigadas
end type
type pb_retroceder from picturebutton within w_4008_brigadas
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4008_brigadas
end type
type pb_sectores from picturebutton within w_4008_brigadas
end type
type pb_graficar from picturebutton within w_4008_brigadas
end type
type dw_criterio_seleccion from u_bdg_2009_pr_criterio_seleccion within w_4008_brigadas
end type
type dw_impresion from datawindow within w_4008_brigadas
end type
type dw_datos from u_bdg_2009_pr_brigadas within w_4008_brigadas
end type
type gr_sectores from graph within w_4008_brigadas
end type
type gr_grafica from graph within w_4008_brigadas
end type
type st_valor_actual from statictext within w_4008_brigadas
end type
end forward

global type w_4008_brigadas from w_sgigenerica
integer y = 244
integer width = 3657
integer height = 1872
string title = "OPEN SGI - Query BDG of Teams. "
string menuname = "m_brigadas"
boolean minbox = false
boolean maxbox = false
string icon = "brigada4.ico"
event ue_obtener_datos pbm_custom70
event ue_actualizar pbm_custom71
event ue_a_cantidades pbm_custom74
event ue_a_porcentajes pbm_custom75
event ue_resetear_datos pbm_custom60
event ue_derivada_en_corte pbm_custom72
event ue_historicos pbm_custom73
event ue_imprimir pbm_custom62
event ue_botones pbm_custom09
event zonacmdvisible ( )
st_fil_selec st_fil_selec
rb_sum_totales rb_sum_totales
rb_sum_parciales rb_sum_parciales
sle_fil_selec sle_fil_selec
gb_sumas gb_sumas
pb_retroceder pb_retroceder
dw_ambito dw_ambito
pb_sectores pb_sectores
pb_graficar pb_graficar
dw_criterio_seleccion dw_criterio_seleccion
dw_impresion dw_impresion
dw_datos dw_datos
gr_sectores gr_sectores
gr_grafica gr_grafica
st_valor_actual st_valor_actual
end type
global w_4008_brigadas w_4008_brigadas

type variables
int ii_column_clicked, ii_ind_vec, ii_ind_vec2
int ii_width_dw = 2962
// Vector con las columnas seleccionadas
integer	iivec_col_selec[]
boolean ib_habilitado = false
boolean ib_datos = false
// Vector de filas seleccionadas
integer	iivec_fil_selec[]

u_gen_nu_gra_0001	iu_gen_gra

// Objeto de nucleo de la datawindow

u_bdg_2009_nu_criterio_seleccion  iu_bdg_2009_nu

// Ver las sumas totales
int ii_totales

// Si se desean los acumulados
int ii_acumulado

// Si estoy viendo cantidades o porcentajes
int ii_unidades

// Nivel en que se encuentra el listado

int ii_nivel


// Indicador de zona o Cmd
int ii_zona_cmd

// Indicador de Hist$$HEX1$$f300$$ENDHEX$$rico o Actuales

int ii_historicos

// constantes
//int fgci_todos
// Desde donde navego
string is_donde
// Variable que indica que se esta desplegando 
// True = lista , False = Grafica
 boolean ib_lista

s_print str_print

// gr$$HEX1$$e100$$ENDHEX$$fico de barras o de sectores
int ii_tipo_graf

// n$$HEX1$$fa00$$ENDHEX$$mero de columnas seleccionadas
// si s$$HEX1$$f300$$ENDHEX$$lo hay 1 habilitamos gr$$HEX1$$e100$$ENDHEX$$f de sectores
int ii_num_col_marca
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
//								 Modificaci$$HEX1$$f300$$ENDHEX$$n   09/10/2000	  GSH	(Version 2000.1)
/////////////////////////////////////////////////////////////////////////
int li_retorno
string ls_sintaxis

SetPointer(HourGlass!)

li_retorno = fw_validar_periodo()
IF li_retorno = 1 then 
	gnv_msg.f_mensaje("AB03", "", "", OK!)
	return
END IF
if not ib_primera_vez then this.setredraw(false)
dw_datos.reset()
dw_datos.WIDTH = ( ii_width_dw)
dw_datos.visible = false
dw_datos.visible = true
dw_datos.Retrieve()

//Si el nro de registros obtenidos en 0 despliega mensaje //MATO
IF dw_datos.RowCount() = 0 THEN
	pb_retroceder.enabled = FALSE
	gnv_msg.f_mensaje("AB02","","",OK!)
  
//Ajuste de la barra <Scroll> Vertical	para no ocupar espacio en Dw.
ELSEIF dw_datos.RowCount() > 10 THEN
   dw_datos.WIDTH = ( ii_width_dw + 75)
	dw_datos.VScrollBar = true
ELSE
	dw_datos.WIDTH =  ii_width_dw
	dw_datos.VScrollBar = false
END IF
if not ib_primera_vez then this.SetRedraw(true)
ib_primera_vez = false
RETURN
end event

event ue_actualizar;/////////////////////////////////////////////////////////////////////////
//
// Evento:  ue_actualizar
//
// Objetivo: actualiza los datos de la datawindow que                 
//				 muestra los datos de la tabla brigadas_bdg.
//
/////////////////////////////////////////////////////////////////////////
int li_ind, li_brigada, li_nombre_brigada, li_fila
date ld_periodo
SetPointer(HourGlass!)
string ls_ambito
int li_centro, li_cmd, li_int_horario, li_tipo_incid, li_mesa, li_alcance, li_trabajo, li_tipo
dw_datos.SetRedraw(False)
dw_criterio_seleccion.Accepttext()

// Si todos tienen "Todos"
li_brigada=dw_criterio_seleccion.getItemNumber(1,"pa_brigada")
ld_periodo = dw_criterio_seleccion.GetItemDate(1, "pa_periodo")
li_centro 		  = dw_ambito.GetItemNumber(1,"nro_centro")
li_cmd 	 		  = dw_ambito.GetItemNumber(1,"nro_cmd")
li_mesa  		  = dw_ambito.GetItemNumber(1,"nro_mesa")
li_int_horario   = dw_criterio_seleccion.GetItemNumber(1,"pa_int_horario")
li_tipo_incid    = dw_criterio_seleccion.GetItemNumber(1,"pa_tipo_incidencia")
li_alcance	     = dw_criterio_seleccion.GetItemNumber(1,'pi_alcance')
li_trabajo  	  = dw_criterio_seleccion.GetItemNumber(1,'pi_tipo_trabajo')
// borrar li_nombre_brigada
li_nombre_brigada = dw_criterio_seleccion.GetItemNumber(1,'pa_brigada')
li_tipo			  = dw_criterio_seleccion.GetItemNumber(1,'pi_tipo')
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
	
iu_bdg_2009_nu.fnu_armar_sql(dw_datos,ls_ambito, ii_acumulado, ii_historicos, ii_unidades, &
									  li_brigada, ld_periodo,li_tipo_incid,li_int_horario,&
									  li_centro,li_cmd,li_mesa,li_alcance,li_trabajo,li_nombre_brigada,&
									  li_tipo)

if ii_nivel = 0 then
	pb_retroceder.enabled = FALSE
else
	pb_retroceder.enabled = TRUE
end if

This.TriggerEvent("ue_obtener_datos")

	// Inicializo los vectores
	This.fw_inicializo_vector()
	This.fw_inicializo_vector2()

//	// Deshabilito BOTONES graficar
	pb_graficar.Enabled = False
	pb_sectores.Enabled = False

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
		ii_totales = 0 //MATO
		rb_sum_totales.Triggerevent("clicked")
	ELSE
		sle_fil_selec.TextColor=97920
		sle_fil_selec.text = String(0)
		ii_totales = 1 //MATO
		rb_sum_parciales.Triggerevent("clicked")
	END IF
	
IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos.SelectRow(0, FALSE)
fw_des_colum_selec()
ii_num_col_marca=0
//	Inicializo el vector
//fw_inicializo_vector()
//fw_inicializo_vector2()
//
This.TriggerEvent("ue_botones")

dw_datos.SetRedraw(True)
end event

event ue_a_cantidades;///////////////////////////////////////////////////////////////////////////
////
//// Evento:	ue_a_cantidades
////
//// Objetivo: Recorro todas las columnas de la DW y para cada una de ellas tomo su 
//// 	suma como el 100 %, calculando el porcentaje correspondiente a cada fila
////
////                       Responsable  	Fecha     	Actuaci$$HEX1$$f300$$ENDHEX$$n
////                       -----------  	-----     	--------- 
//// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:		SA			04/09/96		Versi$$HEX1$$f300$$ENDHEX$$n Original
////
///////////////////////////////////////////////////////////////////////////
//
//int 		li_fila, li_col, li_cant_filas
//
//SetPointer(HourGlass!)
//li_cant_filas = dw_datos.RowCount()
//
//// Indico que no desea ver las sumas
//for li_fila = 1 to li_cant_filas
//	dw_datos.setItem(li_fila,"sumas_promedio",0)
//	dw_datos.setItem(li_fila,"fila_marcada",ii_totales)
//next
end event

event ue_a_porcentajes;/////////////////////////////////////////////////////////////////////////
//
// Evento:  	ue_a_porcentajes
//
// Objetivo: 	Calcular los porcentajes
//
//                       Responsable  	Fecha     	Actuaci$$HEX1$$f300$$ENDHEX$$n
//                       -----------  	-----     	--------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:  		AD			27/08/96		Versi$$HEX1$$f300$$ENDHEX$$n Original
//										GSH	   09/10/2000	Versi$$HEX1$$f300$$ENDHEX$$n 2000.1
/////////////////////////////////////////////////////////////////////////

// Recorro todas las columnas de la DW y para cada una de ellas tomo su 
// suma como el 100 %, calculando el porcentaje correspondiente a cada fila

int 		li_fila, li_col, li_cant_filas, li_totales
decimal	li_porc_fil_col
decimal	ld_cant_incidencias, ld_oper_pt_eb, ld_oper_eb_er, ld_oper_er_sr
decimal	ld_cant_inc_man, ld_oper_sr_rs,ld_oper_rs_ce, ld_mant_em_ce

SetPointer(HourGlass!)

fw_des_colum_selec()
fw_inicializo_vector()
//fw_inicializo_vector2()

dw_datos.SetRedraw(False)
li_cant_filas = dw_datos.RowCount()

IF li_cant_filas = 0 THEN
	return
END IF

// Si quiere ver las cantidades, traigo los datos de nuevo
if ii_unidades = 1 then
	dw_datos.Modify("oper_pt_eb_to.Visible='0'")
	dw_datos.Modify("oper_eb_er_to.Visible='0'")
	dw_datos.Modify("oper_er_sr_to.Visible='0'")
	dw_datos.Modify("oper_sr_rs_to.Visible='0'")
	dw_datos.Modify("oper_rs_ce_to.Visible='0'")
	this.triggerEvent("ue_actualizar")
	return
end if



// Indico que desea ver las sumas
for li_fila = 1 to li_cant_filas
	dw_datos.setItem(li_fila,"sumas_promedio",1)//ANG
	dw_datos.setItem(li_fila,"fila_marcada",1)
next

// Si est$$HEX2$$e1002000$$ENDHEX$$en parciales cambio a totales moment$$HEX1$$e100$$ENDHEX$$neamente para calcular
li_totales = ii_totales
if ii_totales = 0 then
	rb_sum_totales.triggerEvent("clicked")
	rb_sum_totales.checked = TRUE	
end if

dw_datos.Modify("oper_pt_eb_to.Visible='1'")
dw_datos.Modify("oper_eb_er_to.Visible='1'")
dw_datos.Modify("oper_er_sr_to.Visible='1'")
dw_datos.Modify("oper_sr_rs_to.Visible='1'")
dw_datos.Modify("oper_rs_ce_to.Visible='1'")
dw_datos.AcceptText()

//	Tomo los totales que son el 100%
ld_cant_incidencias 	= dw_datos.GetItemNumber(1, "cant_incidencias_s")
ld_oper_pt_eb			= dw_datos.GetItemNumber(1, "oper_pt_eb_to")
ld_oper_eb_er			= dw_datos.GetItemNumber(1, "oper_eb_er_to")
ld_oper_er_sr			= dw_datos.GetItemNumber(1, "oper_er_sr_to")
ld_oper_sr_rs			= dw_datos.GetItemNumber(1, "oper_sr_rs_to")
ld_oper_rs_ce			= dw_datos.GetItemNumber(1, "oper_rs_ce_to")
ld_mant_em_ce			= dw_datos.GetItemNumber(1, "mant_em_ce_s")
ld_cant_inc_man      = dw_datos.GetItemNumber(1, "cant_inc_man_s")



FOR li_fila = 1 TO li_cant_filas

	IF ld_mant_em_ce <>0 THEN
		// Columna "mant_em_ce"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "mant_em_ce") * 100 / ld_mant_em_ce
		dw_datos.SetItem(li_fila, "mant_em_ce", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0 	
	END IF
	
	IF  ld_cant_inc_man<>0 THEN
		// Columna "cant_inc_man"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "cant_inc_man") * 100 / ld_cant_inc_man
		dw_datos.SetItem(li_fila, "cant_inc_man", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0 	
	END IF
	
	IF  ld_oper_rs_ce<>0 THEN
		// Columna "oper_rs_ce"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "oper_rs_ce") * 100 / ld_oper_rs_ce
		dw_datos.SetItem(li_fila, "oper_rs_ce", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0 	
	END IF
	
	IF  ld_oper_sr_rs<>0 THEN
		// Columna "oper_sr_rs"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "oper_sr_rs") * 100 / ld_oper_sr_rs
		dw_datos.SetItem(li_fila, "oper_sr_rs", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0 	
	END IF
	
	IF ld_cant_incidencias<>0 THEN
		// Columna "cant_incidencias"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "cant_incidencias") * 100 / ld_cant_incidencias
		dw_datos.SetItem(li_fila, "cant_incidencias", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0
	END IF
	
	IF  ld_oper_pt_eb<>0 THEN
		// Columna "oper_pt_cl"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "oper_pt_eb") * 100 / ld_oper_pt_eb
		dw_datos.SetItem(li_fila, "oper_pt_eb", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0 	
	END IF
	
	IF ld_oper_eb_er<>0 THEN
		// Columna "oper_eb_cl"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "oper_eb_er") * 100 / ld_oper_eb_er
		dw_datos.SetItem(li_fila, "oper_eb_er", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0 	
	END IF
	
	IF ld_oper_er_sr<>0 THEN
		// Columna "oper_cl_sr"
		li_porc_fil_col = dw_datos.GetItemNumber(li_fila, "oper_er_sr") * 100 / ld_oper_er_sr
		dw_datos.SetItem(li_fila, "oper_er_sr", Round(li_porc_fil_col,4))
	ELSE
		li_porc_fil_col=0 	
	END IF

NEXT

//// Si estaba en parciales, restauro estado
//if li_totales = 0 then
//	rb_sum_parciales.triggerEvent("clicked")
//	rb_sum_parciales.checked = TRUE
//end if

dw_datos.SetRedraw(TRUE)
end event

event ue_resetear_datos;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_resetear_datos
//
/////////////////////////////////////////////////////////////////////////

dw_datos.reset();
dw_datos.Width = ii_width_dw //MATO
this.fw_inicializo_vector()
this.fw_inicializo_vector2()
//dw_datos.SetItem(1,"Suma_promedios",1)
//dw_datos.SetItem(1,"en_corte",1)
//dw_datos.SetItem(1,"fila_marcada",1)
ii_num_col_marca=0
pb_graficar.Enabled=FALSE
pb_sectores.Enabled=FALSE
sle_fil_selec.TextColor=97920
sle_fil_selec.text = String(0)
end event

event ue_derivada_en_corte;///////////////////////////////////////////////////////////////////////////
////
//// Evento:  ue_derivada_en_corte
////
//// Objetivo: Oculta o muestra las algunas columnas seg$$HEX1$$fa00$$ENDHEX$$n se quiera 
////				 mostrar las incidencias derivadas en corte o las derivadas 
////				 sin corte
////
///////////////////////////////////////////////////////////////////////////
//
//int ii_muestro_porcentaje
//long ll_filas,ll_contador
//
//ii_muestro_porcentaje=dw_criterio_seleccion.GetItemNumber(1,"pa_unidades")
//
//		//Si ii_muestro_porcentaje= quiere decir que esta selecionada la 
//		//opci$$HEX1$$f300$$ENDHEX$$n de porcentaje de lo contrario est$$HEX2$$e1002000$$ENDHEX$$seleccionada la opci$$HEX1$$f300$$ENDHEX$$n 
//		//de totales
//
//SetPointer(HourGlass!)
//dw_datos.SetRedraw(False)
//ll_filas = dw_datos.RowCount()
////IF m_brigadas.m_opciones.m_corte.Text= "Maintenance &With Power Cut" THEN
//IF m_brigadas.m_opciones.m_corte.Text= "Derivadas con &Corte" THEN
//	
////	m_brigadas.m_opciones.m_corte.Text = "Maintenance With&out Power Cut"
//	m_brigadas.m_opciones.m_corte.Text = "Derivadas &sin Corte"
////	m_brigadas.m_opciones.m_corte.ToolBarItemText = "Maintenance Without Power Cut"
//	m_brigadas.m_opciones.m_corte.ToolBarItemText = "Derivadas sin Corte"
//	m_brigadas.m_opciones.m_corte.ToolBarItemName = "sincorte.bmp"
//
//	//Si esta pasa de sin corte a corte
// 	IF ll_filas>0 THEN
//   	 FOR ll_contador=1 TO ll_filas
//			dw_datos.SetItem(ll_contador,"EN_CORTE",1)	
//		NEXT
// 	END IF
//	ii_en_corte=1
//	dw_datos.AcceptText()
//
//	//deshabilito cabezal de datos de corte	
//	dw_datos.Modify("corte_t.Visible = 1")
//	dw_datos.Modify("corte_sr_t.Visible = 1")
//	dw_datos.Modify("corte_st_al_t.Visible = 1")
//	dw_datos.Modify("corte_eb_al_t.Visible = 1")
//
//	//habilito cabezal de datos de sincorte
//	dw_datos.Modify("sincorte_t.Visible = 0")
//	dw_datos.Modify("sincorte_sr_t.Visible = 0")
//	dw_datos.Modify("sincorte_st_al_t.Visible = 0")
//	dw_datos.Modify("sincorte_eb_al_t.Visible = 0")
//
//ELSE
//
//	//Si esta pasa de corte a sin corte
// 	IF ll_filas>0 THEN
//   	 FOR ll_contador=1 TO ll_filas
//			dw_datos.SetItem(ll_contador,"EN_CORTE",0)	
//		NEXT
// 	END IF
//
//		ii_en_corte=0
//		dw_datos.AcceptText()
//
//	//deshabilito cabezal de datos de corte	
//	dw_datos.Modify("corte_t.Visible = 0")
//	dw_datos.Modify("corte_sr_t.Visible = 0")
//	dw_datos.Modify("corte_st_al_t.Visible = 0")
//	dw_datos.Modify("corte_eb_al_t.Visible = 0")
//
//	//habilito cabezal de datos de sincorte
//	dw_datos.Modify("sincorte_t.Visible = 1")
//	dw_datos.Modify("sincorte_sr_t.Visible = 1")
//	dw_datos.Modify("sincorte_st_al_t.Visible = 1")
//	dw_datos.Modify("sincorte_eb_al_t.Visible = 1")
//
////	m_brigadas.m_opciones.m_corte.Text = "Maintenance &With Power Cut"
//	m_brigadas.m_opciones.m_corte.Text = "Derivadas con &Corte"
////	m_brigadas.m_opciones.m_corte.ToolBarItemText = "Maintenance With Power Cut"
//	m_brigadas.m_opciones.m_corte.ToolBarItemText = "Derivadas con Corte"
//	m_brigadas.m_opciones.m_corte.ToolBarItemName = "incorpor.bmp"
//
//END IF
//dw_datos.AcceptText()
//
////
//dw_datos.SelectRow(0, FALSE)
//ii_num_col_marca=0
////	Inicializo el vector
//fw_inicializo_vector()
//fw_inicializo_vector2()
//This.TriggerEvent("ue_botones")
//
//dw_datos.SetRedraw(True)
end event

event ue_historicos;//gb_sgt///////////////////////////////////////////////////////////////////////
//
// Event:  ue_historicos
//
/////////////////////////////////////////////////////////////////////////
dw_datos.SetRedraw(False)
int li_sums

li_sums = ii_totales
ii_num_col_marca=0
fw_des_colum_selec()
fw_inicializo_vector()
fw_inicializo_vector2()

// Si desea ver los hist$$HEX1$$f300$$ENDHEX$$ricos
IF m_brigadas.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos" THEN
		
   // Siguiente estado "Actuales"
	m_brigadas.m_opciones.m_historicos.Text = "&Actual"
	m_brigadas.m_opciones.m_historicos.ToolBarItemText = "Actual"
	m_brigadas.m_opciones.m_historicos.ToolBarItemName = "Custom024!"
	
   // Muestro los hist$$HEX1$$f300$$ENDHEX$$ricos
	ii_historicos = 1
	dw_criterio_seleccion.modify("pa_zona_cmd.visible = 0")

	dw_criterio_seleccion.SetItem(1,"pa_int_horario","0")
	dw_criterio_seleccion.modify("pa_int_horario.protect = 1")
	dw_criterio_seleccion.SetItem(1,"pa_acumulado_sn",ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 0")

	rb_sum_parciales.checked = FALSE
	rb_sum_totales.checked = TRUE

ELSE
	
	// Siguiente estado los Hist$$HEX1$$f300$$ENDHEX$$ricos
	m_brigadas.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_brigadas.m_opciones.m_historicos.ToolBarItemText = "Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_brigadas.m_opciones.m_historicos.ToolBarItemName = "Custom023!"	

	// Muestro los actuales	
	ii_historicos = 0
	IF dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
		dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN 	
		
		dw_criterio_seleccion.modify("pa_zona_cmd.visible = 1")
	END IF
	dw_criterio_seleccion.SetItem(1,"pa_int_horario","0")
	dw_criterio_seleccion.modify("pa_int_horario.protect = 0")
	dw_criterio_seleccion.SetItem(1,"pa_acumulado_sn",ii_acumulado)
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

if dw_datos.RowCount() = 0 then
	gnv_msg.f_mensaje("AM21", "", "", OK!)
	RETURN
end if

ls_Sintaxis = dw_datos.Describe("DataWindow.Syntax")
// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow
dw_impresion.Create( ls_Sintaxis )

str_print.dwprint = dw_impresion
str_print.parm1 = ib_lista
st_valor_actual.visible = False
IF ib_lista  THEN
	dw_datos.sharedata(dw_impresion)
	str_print.dwprint = dw_impresion
	fw_fondo_transparente()
	str_print.titulo="Informe de Brigadas"
ELSE
	str_print.titulo="Gr$$HEX1$$e100$$ENDHEX$$fico de Brigadas"	
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

public function integer fw_graficar ();/////////////////////////////////////////////////////////////////////////
//
// funcion:  fw_graficar
//
/////////////////////////////////////////////////////////////////////////
SetPointer(HourGlass!)
graph gr

if ii_tipo_graf=1 then
	gr=gr_grafica
else
	gr=gr_sectores
end if

gr.Reset(ALL!)

iu_gen_gra = CREATE u_gen_nu_gra_0001

iu_gen_gra.fnu_gra_titulo(gr,"Estad$$HEX1$$ed00$$ENDHEX$$stica de Brigadas")
//iu_gen_gra.fnu_gra_titulo(gr,"Statistics of Teams")

iu_gen_gra.fnu_gra_titulo_y(gr,"Valores")
//iu_gen_gra.fnu_gra_titulo_y(gr,"Values")

if ii_historicos = 1 then
	iu_gen_gra.fnu_titulo_x(gr,"Fecha")
//	iu_gen_gra.fnu_titulo_x(gr,"Date")
else
	iu_gen_gra.fnu_titulo_x(gr,"Estados")
//	iu_gen_gra.fnu_titulo_x(gr,"States")
end if

gr.SetRedraw(False)
iu_gen_gra.fnu_gra_cargo_datos(gr,dw_datos,1,True,iivec_col_selec[],iivec_fil_selec[])
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

public function integer fw_marcar_col (integer pi_nro_col);/////////////////////////////////////////////////////////////////////////
//
// Function:  fw_marcar_col
//
/////////////////////////////////////////////////////////////////////////


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

IF Integer(dw_datos.Describe("nom_centro_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna("nom_centro")
ELSEIF Integer(dw_datos.Describe("nom_cmd_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna("nom_cmd")
ELSEIF Integer(dw_datos.Describe("nom_puesto_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna("nom_puesto")
ELSEIF Integer(dw_datos.Describe("gi_brigadas_bdg_nombre_t.Visible")) = 1 THEN
	li_column_zona = fw_obtener_numero_columna("gi_brigadas_bdg_nombre")
ELSE
  	li_column_zona = fw_obtener_numero_columna("fecha")
END IF
		
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)

li_ind = 1
iivec_col_selec[li_ind] = li_column_zona

dw_datos.SetRedraw(False)		
//messagebox("",string(dw_datos.RowCount()))

FOR li_ind = 2 TO dw_datos.RowCount()
	IF iivec_col_selec[li_ind - 1] >= 0 THEN
	
		ls_column = dw_datos.Describe("#"+ String(iivec_col_selec[li_ind - 1]) +".Name")
		ls_column2 = ls_column + "_s"
		ls_column3 = ls_column + "_a"
	
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

FOR li_ind = 1 TO dw_datos.RowCount()
	iivec_fil_selec[li_ind] = 0
NEXT

ii_ind_vec2 = 1

RETURN 1
end function

public function integer fw_obtener_numero_columna (string ps_nombre);integer li_retorno
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

public subroutine fw_des_colum_selec ();string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm, ls_column
string ls_column2, ls_column3, ls_column4, ls_column5
int li_indice
int li_vec_col_selec[]

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
	ls_column5 = ls_column + "_to"
	IF dw_datos.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
	
		// Si estaba marcada, la desmarco

		dw_datos.Modify(" "+ ls_column +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")

		dw_datos.Modify(" "+ ls_column5 +".Background.Mode=0")
		dw_datos.Modify(" "+ ls_column5 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column5 +".Text.Color="+ ls_color_texto_norm +" ")	

		dw_datos.Modify(" "+ ls_column2 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column3 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
	
		dw_datos.Modify(" "+ ls_column4 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column4 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column4 +".Text.Color="+ ls_color_texto_norm +" ")
	
		fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
	
	END IF
NEXT

iivec_col_selec = li_vec_col_selec
fw_inicializo_vector()
end subroutine

public subroutine fw_seleccionar_todo ();int li_indice
for li_indice=1 to integer(dw_datos.Object.DataWindow.Column.Count)
	IF li_indice<> 19 AND li_indice <> 5 THEN
		ii_column_clicked=li_indice
		dw_datos.triggerevent(doubleclicked!)
	END IF
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
// Objetivo: Open de la ventana de la BDG con las estad$$HEX1$$ed00$$ENDHEX$$sticas por
//				 Brigadas.
//
/////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED

DateTime ld_fecha_ok_bdg

SetPointer(HourGlass!)
This.SetRedraw(False)
ib_lista = True //En True indica que se esta desplegando la lista,
                //  en False indica que se esta desplegando la Gr$$HEX1$$e100$$ENDHEX$$fica
ii_num_col_marca=0 //Inicializo variable

//se crea el n$$HEX1$$fa00$$ENDHEX$$cleo de la datawindow
iu_bdg_2009_nu= CREATE u_bdg_2009_nu_criterio_seleccion

//Obtengo nombre de la ventana
ld_fecha_ok_bdg = iu_bdg_2009_nu.fnu_recup_fecha()
THIS.Title = gu_comunic.f_titulo_ventana("w_4008","brigadas")+' - Actualizado: ' + String(date(ld_fecha_ok_bdg))

// Inserto una fila y conecto a la D.W. de los datos por zona geogr$$HEX1$$e100$$ENDHEX$$fica
dw_datos.SetTransObject(sqlca)

//dw_datos.SetItem(1,"EN_CORTE",1)
dw_datos.SetItem(1,"SUMAS_PROMEDIO",1)
dw_datos.SetItem(1,"FILA_MARCADA",0)

// Conecto las D.D.D.W. del objeto "criterio de selecci$$HEX1$$f300$$ENDHEX$$n",
// filtro sus campos, y los seteo con "Todos"
dw_criterio_seleccion.f_insertar_fila()
dw_criterio_seleccion.SetItem(1,"pi_tipo_trabajo",0)
dw_criterio_seleccion.fnu_cargar_ddw_trabajo ()
dw_criterio_seleccion.SetItem(1,"pi_tipo",0)
dw_criterio_seleccion.fpr_crea_dddw()
dw_criterio_seleccion.fpr_crea_dddw_brigada()

dw_criterio_seleccion.SetItem(1,"pa_zona_cmd",0)
dw_criterio_seleccion.SetItem(1,"pa_acumulado_sn",0)
dw_criterio_seleccion.SetItem(1,"pa_periodo",fgnu_fecha_actual())
dw_criterio_seleccion.SetItem(1,"pa_tipo_incidencia",fgci_todos)
dw_criterio_seleccion.fnu_cargar_ddw()
dw_criterio_seleccion.SetItem(1,"pi_alcance",0)
dw_criterio_seleccion.fnu_cargar_alcance(fgci_todos)
dw_criterio_seleccion.Modify('pi_alcance.Protect = 1')
dw_criterio_seleccion.Modify('pi_alcance.Background.Color = ' + gs_gris)

dw_criterio_seleccion.SetItem(1,"pa_int_horario",fgci_todos)
dw_criterio_seleccion.SetItem(1,"pa_unidades",1)
dw_criterio_seleccion.SetItem(1,"pa_brigada",fgci_todos)

//dw_criterio_seleccion.Accepttext()

// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
dw_ambito.Show()
dw_ambito.f_insertar_fila()

// Conecto las D.D.D.W del objeto "$$HEX1$$e100$$ENDHEX$$mbito",
// filtro sus campos, y los seteo con "Todos"
dw_ambito.fpr_crea_dddw()
dw_ambito.fnu_filtro_centro()
dw_ambito.SetItem(1,"nro_centro",fgci_todos)				
dw_ambito.fpr_filtro_cmd()
dw_ambito.SetItem(1,"nro_cmd",fgci_todos)
dw_ambito.fpr_filtro_mesa()
dw_ambito.SetItem(1,"nro_mesa",fgci_todos)
dw_ambito.fnu_deshab_puesto(dw_ambito)
dw_ambito.SetColumn("nro_centro")

// Seteo la presentaci$$HEX1$$f300$$ENDHEX$$n inicial de la lista de datos
ii_historicos = 0
ii_totales = 1
ii_acumulado = 0
ii_unidades = 1

// Cargo los datos de la lista
This.PostEvent("ue_actualizar")

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

on w_4008_brigadas.create
int iCurrent
call super::create
if this.MenuName = "m_brigadas" then this.MenuID = create m_brigadas
this.st_fil_selec=create st_fil_selec
this.rb_sum_totales=create rb_sum_totales
this.rb_sum_parciales=create rb_sum_parciales
this.sle_fil_selec=create sle_fil_selec
this.gb_sumas=create gb_sumas
this.pb_retroceder=create pb_retroceder
this.dw_ambito=create dw_ambito
this.pb_sectores=create pb_sectores
this.pb_graficar=create pb_graficar
this.dw_criterio_seleccion=create dw_criterio_seleccion
this.dw_impresion=create dw_impresion
this.dw_datos=create dw_datos
this.gr_sectores=create gr_sectores
this.gr_grafica=create gr_grafica
this.st_valor_actual=create st_valor_actual
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_fil_selec
this.Control[iCurrent+2]=this.rb_sum_totales
this.Control[iCurrent+3]=this.rb_sum_parciales
this.Control[iCurrent+4]=this.sle_fil_selec
this.Control[iCurrent+5]=this.gb_sumas
this.Control[iCurrent+6]=this.pb_retroceder
this.Control[iCurrent+7]=this.dw_ambito
this.Control[iCurrent+8]=this.pb_sectores
this.Control[iCurrent+9]=this.pb_graficar
this.Control[iCurrent+10]=this.dw_criterio_seleccion
this.Control[iCurrent+11]=this.dw_impresion
this.Control[iCurrent+12]=this.dw_datos
this.Control[iCurrent+13]=this.gr_sectores
this.Control[iCurrent+14]=this.gr_grafica
this.Control[iCurrent+15]=this.st_valor_actual
end on

on w_4008_brigadas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_fil_selec)
destroy(this.rb_sum_totales)
destroy(this.rb_sum_parciales)
destroy(this.sle_fil_selec)
destroy(this.gb_sumas)
destroy(this.pb_retroceder)
destroy(this.dw_ambito)
destroy(this.pb_sectores)
destroy(this.pb_graficar)
destroy(this.dw_criterio_seleccion)
destroy(this.dw_impresion)
destroy(this.dw_datos)
destroy(this.gr_sectores)
destroy(this.gr_grafica)
destroy(this.st_valor_actual)
end on

event close;////////////////////////////////////////////////////////////////////////
//
//	Event:	close
//
////////////////////////////////////////////////////////////////////////

//  ANCESTOR SCRIPT OVERRIDED
end event

event closequery;call super::closequery;////////////////////////////////////////////////////////////////////////
//
//	Event:	closequery
//
// Objetivo: Destruyo objetos creados
//
////////////////////////////////////////////////////////////////////////

DESTROY iu_bdg_2009_nu
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_4008_brigadas
end type

type st_fil_selec from statictext within w_4008_brigadas
integer x = 3095
integer y = 1124
integer width = 338
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

type rb_sum_totales from radiobutton within w_4008_brigadas
integer x = 3099
integer y = 904
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


//Compruebo si llamo a este evento desde la dw_datos o mediante click
if not ib_datos then
	fw_des_colum_selec()
end if

IF ii_totales=1 THEN Return
dw_Datos.SetRedraw(False)
ii_totales=1

//fw_des_colum_selec()
li_cant_filas = dw_datos.RowCount()
li_fila=1
DO WHILE li_fila <= li_cant_filas
	dw_datos.selectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"fila_marcada",1)
	dw_datos.SetItem(li_fila,"sumas_promedio",1)
	li_fila ++
LOOP

//	Cargo el vector de filas seleccionadas con todas
sle_fil_selec.TextColor=4250
sle_fil_selec.text = String(li_cant_filas)
li_ind=1
DO WHILE li_ind<= li_cant_filas
	iivec_fil_selec[li_ind]=li_ind
	li_ind ++
   ii_ind_vec2 ++
LOOP

IF ii_ind_vec<= 2 THEN
    //Deshabilito BOTONES graficar
	pb_graficar.Enabled=False
	pb_sectores.Enabled=False
ELSE
	//Habilito BOTONES graficar
	pb_graficar.Enabled=True
	IF ii_num_col_marca=1 THEN
		pb_sectores.Enabled = TRUE
	ELSE
		pb_sectores.Enabled = FALSE
	END IF
END IF

dw_datos.SetRowFocusIndicator(FOCUSRECT!)
dw_datos.SetRedraw(True)
end event

type rb_sum_parciales from radiobutton within w_4008_brigadas
integer x = 3099
integer y = 984
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


if dw_criterio_seleccion.GetItemNumber(1,'pa_unidades') = 0 THEN
	this.checked = false
	rb_sum_totales.checked = true
	return
end if
dw_Datos.SetRedraw(FALSE)
ii_totales = 0

li_cant_filas = dw_datos.RowCount()
li_fila=1
DO WHILE li_fila<= li_cant_filas
	dw_datos.selectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"fila_marcada",0)
	dw_datos.SetItem(li_fila,"sumas_promedio",0)
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

dw_datos.SetRedraw(True)
end event

type sle_fil_selec from singlelineedit within w_4008_brigadas
integer x = 3154
integer y = 1192
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

type gb_sumas from groupbox within w_4008_brigadas
integer x = 3067
integer y = 840
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

type pb_retroceder from picturebutton within w_4008_brigadas
integer x = 3191
integer y = 1360
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

int li_ind, li_nombre_brigada, li_tipo
string ls_select1, ls_select2
boolean lb_cmd_no_habilitado 
int li_centro, li_cmd, li_mesa, li_int_horario, li_tipo_incid, li_brigada, li_alcance,li_trabajo
date ld_periodo

li_brigada=dw_criterio_seleccion.getItemNumber(1,"pa_brigada")
ld_periodo = dw_criterio_seleccion.GetItemDate(1, "pa_periodo")
li_centro 		  = dw_ambito.GetItemNumber(1,"nro_centro")
li_cmd 	 		  = dw_ambito.GetItemNumber(1,"nro_cmd")
li_mesa  		  = dw_ambito.GetItemNumber(1,"nro_mesa")
li_int_horario   = dw_criterio_seleccion.GetItemNumber(1,"pa_int_horario")
li_tipo_incid    = dw_criterio_seleccion.GetItemNumber(1,"pa_tipo_incidencia")
li_alcance		  = dw_criterio_seleccion.GetItemNumber(1,"pi_alcance")
li_trabajo       = dw_criterio_seleccion.GetItemNumber(1,"pi_tipo_trabajo")
li_tipo			  = dw_criterio_seleccion.GetItemNumber(1,'pi_tipo')
fw_des_colum_Selec()
// Si retrocedo a TODOS, TODOS, TODOS
IF (li_centro <> fgci_todos AND li_cmd = fgci_todos AND li_mesa = fgci_todos) OR & 
	(li_cmd <> fgci_todos AND li_centro = fgci_todos AND li_mesa = fgci_todos) THEN
   // Si llego al tope deshabilito el bot$$HEX1$$f300$$ENDHEX$$n y selecciono centro
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
		iu_bdg_2009_nu.fnu_armar_sql(dw_datos, "TODOS", ii_acumulado, &
											 ii_historicos, ii_unidades, li_brigada, ld_periodo, &
											 li_tipo_incid,li_int_horario, fgci_todos, fgci_todos, fgci_todos,&
											 li_alcance,li_trabajo,li_nombre_brigada,li_tipo)
	else
		iu_bdg_2009_nu.fnu_armar_sql(dw_datos, "TODOSCMD", ii_acumulado, &
											  ii_historicos, ii_unidades, li_brigada, ld_periodo, &
											  li_tipo_incid,li_int_horario, fgci_todos, fgci_todos, fgci_todos, &
											  li_alcance,li_trabajo,li_nombre_brigada,li_tipo)
											 
	end if

ELSEIF dw_ambito.GetItemNumber(1,"nro_mesa") <> fgci_todos THEN

	// Si retrocedo a CENTRO, CMD, TODOS
   ii_nivel = 1
	if is_donde="ZONA" then
		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.setcolumn("nro_centro")
		dw_ambito.settext(string(li_centro))
		dw_ambito.AcceptText()
		iu_bdg_2009_nu.fnu_armar_sql(dw_datos, "CENTRO", ii_acumulado, &
										    ii_historicos, ii_unidades, li_brigada, ld_periodo, &
											 li_tipo_incid,li_int_horario, li_centro, fgci_todos, fgci_todos, &
											 li_alcance,li_trabajo,li_nombre_brigada,li_tipo)
	else	
		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.AcceptText()
		dw_ambito.setcolumn("nro_cmd")
		dw_ambito.settext(string(li_cmd))
		dw_ambito.AcceptText()
		iu_bdg_2009_nu.fnu_armar_sql(dw_datos, "CMD", ii_acumulado, &
		 									 ii_historicos, ii_unidades, li_brigada, ld_periodo, &
										 	 li_tipo_incid,li_int_horario, fgci_todos, li_cmd, fgci_todos,&
											 li_alcance,li_trabajo,li_nombre_brigada,li_tipo)

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
END IF

dw_datos.SetRedraw(True)

// Habilito la DW de datos
dw_datos.Enabled = True
dw_ambito.SetRedraw (TRUE)
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4008_brigadas
integer x = 73
integer y = 140
integer width = 992
integer height = 380
integer taborder = 20
boolean border = false
end type

event post_itemchange;/////////////////////////////////////////////////////////////////////////
//
// Event:  post_itemchange
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

type pb_sectores from picturebutton within w_4008_brigadas
event clicked pbm_bnclicked
integer x = 3095
integer y = 672
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
// Event:	Clicked
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
		m_brigadas.m_opciones.m_actualizar.Enabled = FALSE
		m_brigadas.m_opciones.m_historicos.Enabled = FALSE
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
		m_brigadas.m_opciones.m_actualizar.Enabled = TRUE
		m_brigadas.m_opciones.m_historicos.Enabled = TRUE
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

dw_datos.SetRedraw(TRUE)
end event

type pb_graficar from picturebutton within w_4008_brigadas
event clicked pbm_bnclicked
integer x = 3301
integer y = 672
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
// Event:	Clicked
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
		m_brigadas.m_opciones.m_actualizar.Enabled = FALSE
		m_brigadas.m_opciones.m_historicos.Enabled = FALSE
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
	
			DO WHILE li_ind < ii_ind_vec2 //and upperbound(iivec_fil_selec) <= li_ind
				dw_datos.SelectRow(iivec_fil_selec[li_ind], TRUE)
				dw_datos.SetItem(iivec_fil_selec[li_ind], "fila_marcada", 1)
				li_ind ++
			LOOP
			
		END IF
		
		// Habilito filtros y opciones del men$$HEX1$$fa00$$ENDHEX$$
		rb_sum_parciales.Enabled = TRUE
		m_brigadas.m_opciones.m_actualizar.Enabled = TRUE
		m_brigadas.m_opciones.m_historicos.Enabled = TRUE
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
dw_datos.SetRedraw(TRUE)
end event

type dw_criterio_seleccion from u_bdg_2009_pr_criterio_seleccion within w_4008_brigadas
integer x = 151
integer y = 4
integer width = 3255
integer height = 536
integer taborder = 10
boolean border = false
end type

event itemchanged;///////////////////////////////////////////////////////////////////////
//
//	Event:	itemchanged
//
///////////////////////////////////////////////////////////////////////

string ls_columna,S
int li_valor, lI_dato, li_unidades

ls_columna = this.getColumnName()
li_valor = integer(this.getText())
this.AcceptText()
dw_datos.SetRedraw(true)
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
			fw_des_colum_selec()
			pb_graficar.enabled = false
			pb_sectores.enabled = false
		end if
		if li_valor = 0 then
			rb_sum_parciales.checked = False
			rb_sum_totales.checked = true		
			rb_sum_parciales.enabled = False
			rb_sum_totales.enabled = False	
		else
			rb_sum_parciales.enabled = True
			rb_sum_totales.enabled = True		
		end if
		Parent.TriggerEvent("ue_actualizar")
		return
	CASE "pa_acumulado_sn"
		ii_acumulado = li_valor		
		Parent.TriggerEvent("ue_actualizar")
		return
	CASE "pa_tipo_incidencia"
		li_dato = integer(data)
		fnu_cargar_alcance(li_dato)
//		IF li_dato = 2 THEN
//			dw_criterio_seleccion.fnu_cargar_ddw('CON/SIN')
			this.Modify('pi_alcance.Protect = 0')
	  		this.Modify('pi_alcance.Background.Color = ' + gs_blanco)	 
//
//		ELSEIF (li_dato = 1 or li_dato = 3) THEN
//			dw_criterio_seleccion.fnu_cargar_ddw('SUM/INS')
//			this.Modify('pi_alcance.Protect = 0')
//	  		this.Modify('pi_alcance.Background.Color = ' + gs_blanco)
		IF li_dato=0 then
			this.setredraw(false)
			this.Modify('pi_alcance.Protect = 1')
	  		this.Modify('pi_alcance.Background.Color = ' + gs_gris)	 
			this.setredraw(true)
		END IF
		This.SetItem(1,'pi_alcance',0)
	CASE "pi_tipo","pi_tipo_trabajo"
			
			this.fpr_crea_dddw_brigada()
			dw_criterio_seleccion.SetItem(1,'pa_brigada',0)
			dw_criterio_seleccion.SetRedraw(True)
			this.AcceptText()
		
END CHOOSE
Parent.TriggerEvent("ue_resetear_datos")
dw_datos.SetRedraw(true)
end event

type dw_impresion from datawindow within w_4008_brigadas
boolean visible = false
integer x = 635
integer y = 600
integer width = 279
integer height = 92
integer taborder = 80
boolean bringtotop = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_datos from u_bdg_2009_pr_brigadas within w_4008_brigadas
integer y = 588
integer width = 2976
integer height = 1052
integer taborder = 30
boolean vscrollbar = true
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	doubleclicked
//
/////////////////////////////////////////////////////////////////////////
string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm
string ls_color_texto_mark
integer li_columna_foco, li_ind
string ls_nombre_columna

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)
//ls_color_fondo_mark = String(RGB(255,0,0))
ls_color_fondo_mark = String(65536*128+256*128+128)
ls_color_texto_mark = String(0)

this.SetRedraw(False)		
ls_nombre_columna = This.Describe("#"+ String(ii_column_clicked) +".Name")
// Si la columna no es un t$$HEX1$$ed00$$ENDHEX$$tulo y no es la fecha
IF ii_column_clicked > 0 and &
	ls_nombre_columna <> "fecha" THEN

	// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona, avanzo
	IF ls_nombre_columna = "gi_brigadas_bdg_nombre" or ls_nombre_columna = "nom_centro" or &
		ls_nombre_columna = "nom_puesto" or ls_nombre_columna = "nom_cmd" or &
		ls_nombre_columna = "compute_0019" THEN
		

		// Si estoy en parciales no avanzo
		if ii_totales = 0 then

			this.SetRedraw(true)		
			return
		elseif ii_totales = 1 then
			
			fw_des_colum_selec()		
			ii_nivel ++
			Parent.TriggerEvent("ue_actualizar")
		END IF

		//Si no trajo datos retrocedo al nivel anterior
		IF dw_datos.RowCount() = 0 THEN
			pb_retroceder.triggerEvent("clicked")
		END IF

	ELSE 
      //AG.Matorra 26/02/1998
		//De esta forma consegimos corregir el fallo de los graficos vacios
		//en la primera ejecucion.
		if ii_totales=1 then 
     	   ii_totales = 0
			ib_datos = true  
         rb_sum_totales.triggerevent(clicked!)
		else
			ib_datos = false
		end if
		ib_habilitado = rb_sum_parciales.enabled and rb_sum_totales.enabled
		// Si estaba desmarcada, la marco
 		IF This.Describe(" "+ ls_nombre_columna +".Background.Color") = ls_color_fondo_norm THEN

			This.Modify(" "+ ls_nombre_columna + ".Background.Mode=0")
			This.Modify(" "+ ls_nombre_columna + ".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_nombre_columna + ".Text.Color="+ ls_color_texto_mark +" ")	
			
			This.Modify(" "+ ls_nombre_columna + '_s' + ".Background.Mode=0")
			This.Modify(" "+ ls_nombre_columna + '_s' + ".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_nombre_columna + '_s' + ".Text.Color="+ ls_color_texto_mark +" ")
		
			This.Modify(" "+ ls_nombre_columna + '_to' + ".Background.Mode=0")
			This.Modify(" "+ ls_nombre_columna + '_to' + ".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_nombre_columna + '_to' + ".Text.Color="+ ls_color_texto_mark +" ")
	
			This.Modify(" "+ ls_nombre_columna + '_p' + ".Background.Mode=0")
			This.Modify(" "+ ls_nombre_columna + '_p' + ".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_nombre_columna + '_p' + ".Text.Color="+ ls_color_texto_mark +" ")
			
			Parent.fw_marcar_col(ii_column_clicked)
			ii_num_col_marca ++
			
		ELSEIF This.Describe(" "+ ls_nombre_columna + ".Background.Color") = ls_color_fondo_mark THEN

			// Si estaba marcada, la desmarco
			This.Modify(" "+ ls_nombre_columna + ".Background.Mode=1")
			This.Modify(" "+ ls_nombre_columna + ".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_nombre_columna + ".Text.Color="+ ls_color_texto_norm +" ")
	
			This.Modify(" "+ ls_nombre_columna + '_s' + ".Background.Mode=1")
			This.Modify(" "+ ls_nombre_columna + '_s' + ".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_nombre_columna + '_s' + ".Text.Color="+ ls_color_texto_norm +" ")

			This.Modify(" "+ ls_nombre_columna + '_to' + ".Background.Mode=0")
			This.Modify(" "+ ls_nombre_columna + '_to' + ".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_nombre_columna + '_to' + ".Text.Color="+ ls_color_texto_norm +" ")	
			
			This.Modify(" "+ ls_nombre_columna + '_p' + ".Background.Mode=1")
			This.Modify(" "+ ls_nombre_columna + '_p' + ".Background.Color="+ ls_color_fondo_norm +" ")
			This.Modify(" "+ ls_nombre_columna + '_p' + ".Text.Color="+ ls_color_texto_norm +" ")

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
int li_fila_clicked	

li_fila_clicked = row
ii_column_clicked = This.GetClickedColumn()
IF ii_column_clicked > 0 THEN
//AG. Matorra - Si col. zona en dw_datos, vacia, no hacemos nada 
if IsNull(This.GetItemNumber(li_fila_clicked,"nro_centro")) then
	ii_column_clicked=0
	li_fila_clicked = 0
end if
end if
// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona
IF ii_column_clicked = fw_obtener_numero_columna("gi_brigadas_bdg_nombre") OR &
	 ii_column_clicked = fw_obtener_numero_columna("nom_centro") OR &
	 ii_column_clicked = fw_obtener_numero_columna("nom_puesto") OR &
	 ii_column_clicked = fw_obtener_numero_columna("nom_cmd") OR &
    ii_column_clicked = fw_obtener_numero_columna("fecha") THEN

	IF li_fila_clicked > 0 THEN
		
		//	Si est$$HEX2$$e1002000$$ENDHEX$$en TOTALES
		IF ii_totales = 1 THEN
			dw_ambito.SetRedraw(False)
			IF Long(This.Describe("nom_centro_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_centro")
				dw_ambito.settext(string(this.GetItemNumber(li_fila_clicked,"nro_centro")))
				dw_ambito.AcceptText()

			ELSEIF Long(This.Describe("nom_cmd_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_cmd")
				dw_ambito.settext(string(this.GetItemNumber(li_fila_clicked,"nro_cmd")))
				dw_ambito.AcceptText()

			ELSEIF Long(This.Describe("nom_puesto_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_mesa")
				dw_ambito.settext(string(this.GetItemNumber(li_fila_clicked,"nro_puesto")))
				dw_ambito.AcceptText()
			END IF
			
		//	si est$$HEX2$$e1002000$$ENDHEX$$en PARCIALES
		ELSE
			IF This.IsSelected(li_fila_clicked) THEN
				This.SelectRow(li_fila_clicked,False)	//deselecciono
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
				This.SelectRow(li_fila_clicked,True)	//selecciono
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

event ue_mover_borde;//
end event

event ue_key_down;//
end event

type gr_sectores from graph within w_4008_brigadas
event other pbm_other
event create ( )
event destroy ( )
integer x = 9
integer y = 600
integer width = 3017
integer height = 1036
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

type gr_grafica from graph within w_4008_brigadas
event ue_move pbm_mousemove
integer x = 9
integer y = 600
integer width = 3017
integer height = 1036
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

event ue_move;integer SeriesNum, DataNum
double value
grObjectType ObjectType
string SeriesName, ValueAsString

ObjectType = gr_grafica.ObjectAtPointer(SeriesNum, DataNum)
IF ObjectType = TypeData! THEN

	Value = gr_grafica.GetData(SeriesNum, DataNum)
	ValueAsString = String(Value)
	IF ii_unidades = 0 THEN
		st_valor_actual.Text = gr_grafica.SeriesName(SeriesNum)+" : "+ValueAsString +" %"
	ELSE
		st_valor_actual.Text = gr_grafica.SeriesName(SeriesNum)+" : "+ValueAsString
	END IF
ELSE
	st_valor_actual.Text = " "
END IF


end event

on other;//integer SeriesNum, DataNum
//double value
//grObjectType ObjectType
//string SeriesName, ValueAsString
//
//ObjectType = gr_grafica.grObjectAtPointer(SeriesNum, DataNum)
//IF ObjectType = TypeData! THEN
//
//	Value = gr_grafica.grGetData(SeriesNum, DataNum)
//	ValueAsString = String(Value)
//	IF ii_unidades = 0 THEN
//		st_valor_actual.Text = gr_grafica.grSeriesName(SeriesNum)+" : "+ValueAsString
//	ELSE
//		st_valor_actual.Text = gr_grafica.grSeriesName(SeriesNum)+" : "+ValueAsString+" %"
//	END IF
//ELSE
//	st_valor_actual.Text = " "
//END IF
//
//
end on

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

type st_valor_actual from statictext within w_4008_brigadas
integer x = 2135
integer y = 628
integer width = 663
integer height = 96
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


HA$PBExportHeader$w_4007_energia_perdida_corte.srw
forward
global type w_4007_energia_perdida_corte from w_sgigenerica
end type
type sle_fil_selec from singlelineedit within w_4007_energia_perdida_corte
end type
type st_fil_selec from statictext within w_4007_energia_perdida_corte
end type
type pb_retroceder from picturebutton within w_4007_energia_perdida_corte
end type
type rb_sum_totales from radiobutton within w_4007_energia_perdida_corte
end type
type rb_sum_parciales from radiobutton within w_4007_energia_perdida_corte
end type
type gb_sumas from groupbox within w_4007_energia_perdida_corte
end type
type dw_criterio_seleccion from u_bdg_2014_pr_filtro_perdidas_corte within w_4007_energia_perdida_corte
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4007_energia_perdida_corte
end type
type pb_sectores from picturebutton within w_4007_energia_perdida_corte
end type
type pb_graficar from picturebutton within w_4007_energia_perdida_corte
end type
type dw_datos from u_bdg_2015_pr_perdidas_corte within w_4007_energia_perdida_corte
end type
type gr_sectores from graph within w_4007_energia_perdida_corte
end type
type gr_grafica from graph within w_4007_energia_perdida_corte
end type
type st_valor_actual from statictext within w_4007_energia_perdida_corte
end type
type dw_impresion from datawindow within w_4007_energia_perdida_corte
end type
end forward

global type w_4007_energia_perdida_corte from w_sgigenerica
integer y = 244
integer width = 3657
integer height = 1844
string title = "OPEN SGI - Lost Energy by cutting. "
string menuname = "m_energia_perdida_corte"
boolean minbox = false
boolean maxbox = false
string icon = "sincorte.ico"
event ue_obtener_datos pbm_custom70
event ue_actualizar pbm_custom71
event ue_a_porcentajes pbm_custom75
event ue_resetear_datos pbm_custom60
event ue_historicos pbm_custom69
event ue_imprimir pbm_custom62
event ue_botones pbm_custom09
event zonacmdvisible ( )
sle_fil_selec sle_fil_selec
st_fil_selec st_fil_selec
pb_retroceder pb_retroceder
rb_sum_totales rb_sum_totales
rb_sum_parciales rb_sum_parciales
gb_sumas gb_sumas
dw_criterio_seleccion dw_criterio_seleccion
dw_ambito dw_ambito
pb_sectores pb_sectores
pb_graficar pb_graficar
dw_datos dw_datos
gr_sectores gr_sectores
gr_grafica gr_grafica
st_valor_actual st_valor_actual
dw_impresion dw_impresion
end type
global w_4007_energia_perdida_corte w_4007_energia_perdida_corte

type variables
int ii_fila_clicked, ii_column_clicked, ii_ind_vec, ii_ind_vec2
int ii_width_dw = 2880
// Vector con las columnas seleccionadas
integer	iivec_col_selec[]

// Vector de filas seleccionadas
integer	iivec_fil_selec[]

u_gen_nu_gra_0001	iu_gen_gra

// Objeto de nucleo de la datawindow

u_bdg_2014_nu_perdidas_corte iu_bdg_2014_nu

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

// Indicador de Hist$$HEX1$$f300$$ENDHEX$$rico o Actuales
int ii_historicos
// constantes
//int fgci_todos

// Variable que indica que se esta desplegando 
// True = lista , False = Grafica
 boolean ib_lista

s_print str_print
int ii_zona_cmd
string is_donde
// gr$$HEX1$$e100$$ENDHEX$$fico de barras o de sectores
int ii_tipo_graf

// n$$HEX1$$fa00$$ENDHEX$$mero de columnas seleccionadas
// si s$$HEX1$$f300$$ENDHEX$$lo hay 1 habilitamos gr$$HEX1$$e100$$ENDHEX$$f de sectores
int ii_num_col_marca
int ii_operacion
boolean ib_habilitado = false
boolean ib_primera_vez = true
end variables

forward prototypes
public function integer fw_desmarcar_col (integer pi_nro_col)
public function integer fw_graficar ()
public function integer fw_inicializo_vector ()
public function integer fw_inicializo_vector2 ()
public function integer fw_marcar_col (integer pi_nro_col)
public function boolean fw_ninguna_marcada ()
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

int li_operacion
int li_retorno

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
dw_ambito.AcceptText()
dw_criterio_seleccion.AcceptText()

s_bdg lstr_bdg

//	Datos para pasar como par$$HEX1$$e100$$ENDHEX$$metro
lstr_bdg.gi_centro 		  = dw_ambito.GetItemNumber(1,"nro_centro")
lstr_bdg.gi_cmd 	 		  = dw_ambito.GetItemNumber(1,"nro_cmd")
lstr_bdg.gi_puesto 		  = dw_ambito.GetItemNumber(1,"nro_mesa")
lstr_bdg.gda_periodo 	  = dw_criterio_seleccion.GetItemDate(1,"pa_periodo")
IF IsNull(lstr_bdg.gda_periodo) THEN 
	dw_criterio_seleccion.SetItem(1, "pa_periodo",today())
	lstr_bdg.gda_periodo=today()
END IF
li_operacion = dw_criterio_seleccion.GetItemNumber(1,'pa_operaciones_sgi')
// Hace el retrieve con el criterio seleccionado
iu_bdg_2014_nu.fnu_aplicar_criterio(lstr_bdg,dw_datos,li_operacion)

// Si no trajo registros doy un mensaje
IF dw_datos.RowCount() = 0 THEN
	dw_datos.WIDTH =  ii_width_dw
	gnv_msg.f_mensaje("AB02","","",OK!)
//Ajuste de la barra <Scroll> Vertical	para no ocupar espacio en Dw.
ELSEIF dw_datos.RowCount() > 12 THEN
   dw_datos.WIDTH = ( ii_width_dw + 75)
	dw_datos.VScrollBar = true
ELSE
	dw_datos.WIDTH =  ii_width_dw
	dw_datos.VScrollBar = false
END IF

if not ib_primera_vez then this.setredraw(true)
ib_primera_vez = false

RETURN
end event

event ue_actualizar;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_actualizar
//
/////////////////////////////////////////////////////////////////////////
int li_ind

SetPointer(HourGlass!)

dw_datos.SetRedraw(False)
dw_criterio_seleccion.Accepttext()
// Si todos tienen "Todos"
IF dw_ambito.GetItemNumber(1, "nro_centro") = fgci_todos AND &
	dw_ambito.GetItemNumber(1, "nro_cmd")    = fgci_todos AND &
	dw_ambito.GetItemNumber(1, "nro_mesa")   = fgci_todos THEN
	ii_nivel = 0
	 if ii_zona_cmd=1 then
		iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "TODOS", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)  
	else
		iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "TODOSCMD", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)
		
	end if
	dw_ambito.fnu_filtro_centro()
	
// Si existe un centro seleccionado
ELSEIF dw_ambito.GetItemNumber(1,"nro_centro") <> fgci_todos AND & 
		 dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		 dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN
			ii_nivel = 1
			iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "CENTRO", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)		
			dw_ambito.fnu_filtro_mesa_n()
			is_donde="ZONA"
// Si existe un cmd seleccionado distinto de "todos"
ELSEIF dw_ambito.GetItemNumber(1,"nro_cmd") <> fgci_todos AND & 
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN
	
		   ii_nivel = 1
			iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "CMD", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)		
			dw_ambito.fnu_filtro_mesa_n()
			is_donde="CMD"

// Si existe una mesa seleccionada
ELSEIF dw_ambito.GetItemNumber(1,"nro_mesa") <> fgci_todos  THEN
      	ii_nivel = 2
  	   	iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "MESA", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)		
END IF

if ii_nivel = 0 OR ii_historicos = 1 then
	pb_retroceder.enabled = FALSE
else
	pb_retroceder.enabled = TRUE
end if
  
This.TriggerEvent("ue_obtener_datos")

// Inicializo los vectores
	This.fw_inicializo_vector()
	This.fw_inicializo_vector2()

// Deshabilito BOTONES graficar
//	pb_graficar.Enabled = False
//	pb_sectores.Enabled = False

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
	ELSE
		sle_fil_selec.TextColor=97920
		sle_fil_selec.text = String(0)
	END IF
	
IF ii_unidades = 0 THEN
	This.TriggerEvent("ue_a_porcentajes")
END IF

//
dw_datos.SelectRow(0, FALSE)
ii_num_col_marca=0
This.TriggerEvent("ue_botones")

dw_datos.SetRedraw(True)
end event

event ue_a_porcentajes;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_a_porcentajes
//
/////////////////////////////////////////////////////////////////////////
// Recorro todas las columnas de la DW.
// y para cada una de ellas tomo su suma como el 100%, y en base
// a esto calculo el porcentaje que le corresponde a cada fila,
// para cada una de aquellas.

int li_fila, li_col, li_cant_filas, li_totales
decimal li_porc_fil_col 
decimal ldc_perd_prog, ldc_perd_no_prog, ldc_tiempo_no_prog
decimal ldc_tiempo_prog, csmo_centro_p, csmo_cmd_p, csmo_puesto_p

SetPointer(HourGlass!)
fw_des_column_selec()
fw_inicializo_vector()
//fw_inicializo_vector2()

li_cant_filas = dw_datos.RowCount()
dw_datos.SetRedraw(false)

IF li_cant_filas = 0 THEN
	return
END IF

// Si quiere ver las cantidades, traigo los datos de nuevo
if ii_unidades = 1 then
	this.triggerEvent("ue_actualizar")
	return
end if

// Si es porcentajes, indico que desea ver las sumas
for li_fila = 1 to li_cant_filas
	dw_datos.setItem(li_fila,"sumas_promedio",1)
next

// Si est$$HEX2$$e1002000$$ENDHEX$$en parciales cambio a totales (moment$$HEX1$$e100$$ENDHEX$$neamente para calcular)
li_totales = ii_totales

if ii_totales = 0 then
	rb_sum_totales.triggerEvent("clicked")
	rb_sum_totales.checked = TRUE
end if

dw_datos.AcceptText()

ldc_perd_prog      = dw_datos.GetItemDecimal(1,"perd_prog_s")
ldc_perd_no_prog   = dw_datos.GetItemDecimal(1,"perd_no_prog_s")
ldc_tiempo_prog    = dw_datos.GetItemDecimal(1,"tiempo_prog_s")
ldc_tiempo_no_prog = dw_datos.GetItemDecimal(1,"tiempo_no_prog_s")
csmo_centro_p      = dw_datos.GetItemDecimal(1,"csmo_centro_s")
csmo_cmd_p         = dw_datos.GetItemDecimal(1,"csmo_cmd_s")
csmo_puesto_p      = dw_datos.GetItemDecimal(1,"csmo_puesto_s")

FOR li_fila =  1 TO li_cant_filas
	
	if ldc_perd_prog <> 0 then
		li_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"perd_prog") * 100) / ldc_perd_prog
		dw_datos.SetItem(li_fila,"perd_prog",round(li_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"perd_prog",0)
	end if

	if ldc_perd_no_prog <> 0 then
		li_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"perd_no_prog") * 100) / ldc_perd_no_prog
		dw_datos.SetItem(li_fila,"perd_no_prog",round(li_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"perd_no_prog",0)
	end if

	if ldc_tiempo_prog <> 0 then
		li_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"tiempo_prog") * 100) / ldc_tiempo_prog
		dw_datos.SetItem(li_fila,"tiempo_prog",round(li_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"tiempo_prog",0)
	end if

	if ldc_tiempo_no_prog <> 0 then
		li_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"tiempo_no_prog") * 100) / ldc_tiempo_no_prog
		dw_datos.SetItem(li_fila,"tiempo_no_prog",round(li_porc_fil_col,4))
	else
		dw_datos.SetItem(li_fila,"tiempo_no_prog",0)
	end if

	if csmo_centro_p <> 0 then
		li_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"csmo_centro") * 100) / csmo_centro_p
		dw_datos.SetItem(li_fila,"csmo_centro",li_porc_fil_col)
	else
		dw_datos.SetItem(li_fila,"csmo_centro",0)
	end if

	if csmo_cmd_p <> 0 then
		li_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"csmo_cmd") * 100) / csmo_cmd_p
		dw_datos.SetItem(li_fila,"csmo_cmd",li_porc_fil_col)
	else
		dw_datos.SetItem(li_fila,"csmo_cmd",0)
	end if

	if csmo_puesto_p <> 0 then
		li_porc_fil_col = (dw_datos.GetItemNumber(li_fila,"csmo_puesto") * 100) / csmo_puesto_p
		dw_datos.SetItem(li_fila,"csmo_puesto",li_porc_fil_col)
	else
		dw_datos.SetItem(li_fila,"csmo_puesto",0)
	end if
	
NEXT

//// Si estaba en parciales, restauro estado
//if li_totales = 0 then
//	rb_sum_parciales.triggerEvent("clicked")
//	rb_sum_parciales.checked = TRUE
//end if

dw_datos.SetRedraw(true)
end event

event ue_resetear_datos;call super::ue_resetear_datos;/////////////////////////////////////////////////////////////////////////
//
// Event:  ue_resetear_datos
//
/////////////////////////////////////////////////////////////////////////

dw_datos.reset();
dw_datos.Width = ii_width_dw
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
//IF m_energia_perdida_corte.m_opciones.m_historicos.Text = "&History" THEN
IF m_energia_perdida_corte.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos" THEN

   // Siguiente estado "Actuales"
	m_energia_perdida_corte.m_opciones.m_historicos.Text = "&Actual"
	m_energia_perdida_corte.m_opciones.m_historicos.ToolBarItemText = "Actual"
	m_energia_perdida_corte.m_opciones.m_historicos.ToolBarItemName = "Custom024!"

   // Muestro los hist$$HEX1$$f300$$ENDHEX$$ricos
	ii_historicos = 1
	ii_totales = 1
   //AG Mato: "ii_acumulado" solo se reiniciar$$HEX2$$e1002000$$ENDHEX$$en el <checkbox>	
   //-->	ii_acumulado = 0
	
   //-->dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",1)
	dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 0")
	dw_criterio_seleccion.modify("pa_zona_cmd.visible = 0")
	rb_sum_parciales.checked = FALSE
	rb_sum_totales.checked = TRUE

ELSE
	
	// Siguiente estado los Hist$$HEX1$$f300$$ENDHEX$$ricos
//	m_energia_perdida_corte.m_opciones.m_historicos.Text = "&History"
//	m_energia_perdida_corte.m_opciones.m_historicos.ToolBarItemText = "History"
	m_energia_perdida_corte.m_opciones.m_historicos.Text = "&Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_energia_perdida_corte.m_opciones.m_historicos.ToolBarItemText = "Hist$$HEX1$$f300$$ENDHEX$$ricos"
	m_energia_perdida_corte.m_opciones.m_historicos.ToolBarItemName = "Custom023!"	

	// Muestro los actuales
	ii_historicos = 0

   //-->dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",0)
	dw_criterio_seleccion.setItem(1,"pa_acumulado_sn",ii_acumulado)
	dw_criterio_seleccion.modify("pa_acumulado_sn.visible = 1")
IF dw_ambito.GetItemNumber(1,"nro_centro") = fgci_todos AND & 
		dw_ambito.GetItemNumber(1,"nro_cmd") = fgci_todos AND &
		dw_ambito.GetItemNumber(1,"nro_mesa") = fgci_todos THEN 	dw_criterio_seleccion.modify("pa_zona_cmd.visible = 1")

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

str_print.dwprint=dw_impresion
str_print.parm1=ib_lista
st_valor_actual.visible = False
IF ib_lista  THEN
	dw_datos.sharedata(dw_impresion)
	str_print.dwprint = dw_impresion
	fw_fondo_transparente()	
	str_print.titulo="Informe de Perdidas de Energia por Corte"
ELSE
	str_print.titulo="Gr$$HEX1$$e100$$ENDHEX$$fico de Perdidas de Energia por Corte"

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
//ii_totales = 0 AND
		IF  ii_ind_vec2 <= 1 THEN
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
gr.setRedraw(false)

iu_gen_gra = CREATE u_gen_nu_gra_0001

iu_gen_gra.fnu_gra_titulo(gr,"Estad$$HEX1$$ed00$$ENDHEX$$sticas de Perdidas por Corte")
//iu_gen_gra.fnu_gra_titulo(gr,"Statistics of Losses Incurred through Power Cuts")

IF ii_unidades = 0 THEN
	iu_gen_gra.fnu_gra_titulo_y(gr,"Porcentajes")
//	iu_gen_gra.fnu_gra_titulo_y(gr,"Percentages")
ELSE
	iu_gen_gra.fnu_gra_titulo_y(gr,"Cantidades")
//	iu_gen_gra.fnu_gra_titulo_y(gr,"Amounts")
END IF
IF ii_historicos = 1 THEN
	iu_gen_gra.fnu_titulo_x(gr,"Fecha")
//	iu_gen_gra.fnu_titulo_x(gr,"Date")
ELSE
	iu_gen_gra.fnu_titulo_x(gr,"Ambito")
//	iu_gen_gra.fnu_titulo_x(gr,"Scope")
END IF

iu_gen_gra.fnu_gra_cargo_datos(gr,dw_datos,1,True,iivec_col_selec[],iivec_fil_selec[])

DESTROY iu_gen_gra 

gr.setRedraw(true)
RETURN 1
end function

public function integer fw_inicializo_vector ();///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_inicializo_vector
//
///////////////////////////////////////////////////////////////////////

int li_ind, li_column_zona,i
string ls_column, ls_column2, ls_column3, ls_column4, ls_color_fondo_norm, ls_color_texto_norm

IF Integer(dw_datos.Describe("nom_centro_t.Visible")) = 1 THEN
	li_column_zona = 2
ELSEIF Integer(dw_datos.Describe("nom_cmd_t.Visible")) = 1 THEN
	li_column_zona = 3
ELSEIF Integer(dw_datos.Describe("nom_puesto_t.Visible")) = 1 THEN
	li_column_zona = 4
ELSEIF Integer(dw_datos.Describe("nom_instalacion_t.Visible")) = 1 THEN
	li_column_zona = 1
ELSE
	li_column_zona = 9
END IF
		
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)

li_ind = 1
iivec_col_selec[li_ind] = li_column_zona

dw_datos.SetRedraw(False)		
i=dw_Datos.RowCount()
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

		dw_datos.Modify(" "+ ls_column4 +".Background.Mode=1")
		dw_datos.Modify(" "+ ls_column4 +".Background.Color="+ ls_color_fondo_norm +" ")
		dw_datos.Modify(" "+ ls_column4 +".Text.Color="+ ls_color_texto_norm +" ")


		iivec_col_selec[li_ind] = 0
	END IF
NEXT

dw_datos.SetRedraw(True)		

ii_ind_vec = 2

RETURN 1
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

public function integer fw_marcar_col (integer pi_nro_col);///////////////////////////////////////////////////////////////////////
//
//	Function:	fw_marcar_col
//
///////////////////////////////////////////////////////////////////////

iivec_col_selec[ii_ind_vec] = pi_nro_col
ii_ind_vec ++

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
li_ind=1
DO WHILE li_ind <= ii_ind_vec

	IF iivec_col_selec[li_ind] > 0 THEN
		RETURN False
	END IF
	li_ind ++
LOOP

RETURN True
end function

public subroutine fw_des_column_selec ();string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm, ls_column
string ls_column2, ls_column3
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
	
		fw_desmarcar_col(ii_column_clicked)
		ii_num_col_marca --
	
	END IF
NEXT

iivec_col_selec = li_vec_col_selec
fw_inicializo_vector()

end subroutine

public subroutine fw_seleccionar_todo ();int li_indice
for li_indice=1 to integer(dw_datos.Object.DataWindow.Column.Count)
	ii_column_clicked=li_indice
	dw_Datos.triggerevent(doubleclicked!)
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
li_num_cols = integer(dw_datos.object.DataWindow.Column.Count)
for li_contador = 1 to li_num_cols
	dw_impresion.Modify("#" + string(li_contador) + ".background.color = " + string(ll_color))		
NEXT
end subroutine

event open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Open de la ventana de la BDG con las estad$$HEX1$$ed00$$ENDHEX$$sticas de 
//           Incidencias por Suministro
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n        17/08/96   SA
//
/////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED

// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//	iu_gen_comunic  --> para cargar la estructura local 

datetime ld_fecha_ok_bdg

SetPointer(HourGlass!)
This.SetRedraw(False)
ib_lista = True //En True indica que se esta desplegando la lista,
                //  en False indica que se esta desplegando la Gr$$HEX1$$e100$$ENDHEX$$fica
ii_num_col_marca=0 //Inicializo variable

iu_gen_comunic  = CREATE u_generico_comunicaciones
iu_gen_comunic.is_comunic = gu_comunic.is_comunic

// Creo objeto de n$$HEX1$$fa00$$ENDHEX$$cleo de la datawindow
iu_bdg_2014_nu = CREATE u_bdg_2014_nu_perdidas_corte 

SELECT FECHA_OK INTO :ld_fecha_ok_bdg FROM GI_BDG_OK WHERE PROGRAMA = '4007';
This.title = gu_comunic.f_titulo_ventana("w_4007_perdidas","perdidas_corte")+ '  - Actualizado: ' + string(date(ld_fecha_ok_bdg))

// Inserto una fila y conecto a la D.W. de datos
dw_datos.insertRow(0)
dw_datos.SetTransObject(sqlca)


// Conecto las D.D.D.W. del objeto "criterio de selecci$$HEX1$$f300$$ENDHEX$$n",
// filtro sus campos, y seteo a los mismos
// con "Todos".
dw_criterio_seleccion.f_insertar_fila()
dw_criterio_seleccion.fpr_crea_dddw()

dw_criterio_seleccion.SetItem(1,"pa_periodo",fgnu_fecha_actual())
dw_criterio_seleccion.SetItem(1,"pa_unidades",1)
dw_criterio_seleccion.SetItem(1,"pa_acumulado_sn",0)
dw_criterio_seleccion.SetItem(1,"pa_zona_cmd",0)
// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
dw_ambito.Show()
dw_ambito.f_insertar_fila()

// Conecto las D.D.D.W del objeto "$$HEX1$$e100$$ENDHEX$$mbito",
// filtro sus campos, y seteo a los mismos
// con "Todos"
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
ii_historicos = 0
ii_totales = 1
ii_acumulado = 0
ii_unidades = 1

dw_datos.Modify("nom_centro_t.Visible = 0")
dw_datos.Modify("nom_puesto_t.Visible = 0")
dw_datos.Modify("nom_cmd_t.Visible = 1")
dw_datos.Modify("nom_instalacion_t.Visible = 0")

IF fgci_con_operaciones=0 THEN
	// No hay interface con operaciones
	dw_criterio_seleccion.Modify("pa_operaciones_sgi.visible=1")
END IF

//Cargo la lista co los datos
This.PostEvent("ue_actualizar")

// Inicializo vector
This.fw_inicializo_vector()
This.fw_inicializo_vector2()

// Oculto la Gr$$HEX1$$e100$$ENDHEX$$fica
gr_grafica.Hide()
gr_sectores.Hide()
st_valor_actual.Hide()
pb_graficar.Enabled = False
pb_sectores.Enabled = False

This.SetRedraw(True)
end event

on w_4007_energia_perdida_corte.create
int iCurrent
call super::create
if this.MenuName = "m_energia_perdida_corte" then this.MenuID = create m_energia_perdida_corte
this.sle_fil_selec=create sle_fil_selec
this.st_fil_selec=create st_fil_selec
this.pb_retroceder=create pb_retroceder
this.rb_sum_totales=create rb_sum_totales
this.rb_sum_parciales=create rb_sum_parciales
this.gb_sumas=create gb_sumas
this.dw_criterio_seleccion=create dw_criterio_seleccion
this.dw_ambito=create dw_ambito
this.pb_sectores=create pb_sectores
this.pb_graficar=create pb_graficar
this.dw_datos=create dw_datos
this.gr_sectores=create gr_sectores
this.gr_grafica=create gr_grafica
this.st_valor_actual=create st_valor_actual
this.dw_impresion=create dw_impresion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_fil_selec
this.Control[iCurrent+2]=this.st_fil_selec
this.Control[iCurrent+3]=this.pb_retroceder
this.Control[iCurrent+4]=this.rb_sum_totales
this.Control[iCurrent+5]=this.rb_sum_parciales
this.Control[iCurrent+6]=this.gb_sumas
this.Control[iCurrent+7]=this.dw_criterio_seleccion
this.Control[iCurrent+8]=this.dw_ambito
this.Control[iCurrent+9]=this.pb_sectores
this.Control[iCurrent+10]=this.pb_graficar
this.Control[iCurrent+11]=this.dw_datos
this.Control[iCurrent+12]=this.gr_sectores
this.Control[iCurrent+13]=this.gr_grafica
this.Control[iCurrent+14]=this.st_valor_actual
this.Control[iCurrent+15]=this.dw_impresion
end on

on w_4007_energia_perdida_corte.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_fil_selec)
destroy(this.st_fil_selec)
destroy(this.pb_retroceder)
destroy(this.rb_sum_totales)
destroy(this.rb_sum_parciales)
destroy(this.gb_sumas)
destroy(this.dw_criterio_seleccion)
destroy(this.dw_ambito)
destroy(this.pb_sectores)
destroy(this.pb_graficar)
destroy(this.dw_datos)
destroy(this.gr_sectores)
destroy(this.gr_grafica)
destroy(this.st_valor_actual)
destroy(this.dw_impresion)
end on

event close;/////////////////////////////////////////////////////////////////////////
//
// Event:  close
//
///////////////////////////////////////////////////////////////////////////

//	Ancestor Script OVERRIDED
end event

event closequery;call super::closequery;/////////////////////////////////////////////////////////////////////////
//
// Event:  closequery
//
// Objetivo: Destruyo objetos creados
//
///////////////////////////////////////////////////////////////////////////

DESTROY iu_gen_comunic  
DESTROY iu_bdg_2014_nu
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_4007_energia_perdida_corte
end type

type sle_fil_selec from singlelineedit within w_4007_energia_perdida_corte
integer x = 3058
integer y = 1016
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

type st_fil_selec from statictext within w_4007_energia_perdida_corte
integer x = 2971
integer y = 948
integer width = 366
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

type pb_retroceder from picturebutton within w_4007_energia_perdida_corte
integer x = 3104
integer y = 1200
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
// Evento:  clicked
//
/////////////////////////////////////////////////////////////////////////

int li_todos, li_ind, li_centro, li_cmd, li_mesa
string ls_select1, ls_select2, ls_select3, ls_select4
boolean lb_cmd_no_habilitado 

li_todos = fgci_todos

SetPointer(HourGlass!)
dw_datos.SetRedraw(False)
// Se setea la etiqueta del criterio de orden
fw_des_column_Selec()
li_centro = dw_ambito.GetItemNumber(1,"nro_centro")
li_cmd = dw_ambito.GetItemNumber(1,"nro_cmd")
li_mesa = dw_ambito.GetItemNumber(1,"nro_mesa")

// Si retrocedo a TODOS, TODOS, TODOS
IF li_centro <> li_todos AND li_cmd = li_todos AND li_mesa = li_todos OR & 
	li_cmd <> li_todos AND li_centro = li_todos AND li_mesa = li_todos THEN

   // Si llego al tope deshabilito el bot$$HEX1$$f300$$ENDHEX$$n y selecciono centro o cmd
   this.enabled = FALSE
   ii_nivel = 0
	if li_centro = li_todos then 
		dw_ambito.Setcolumn("nro_cmd")
		dw_ambito.Settext(string(li_todos) )
		//dw_ambito.fnu_deshab_centro(dw_ambito)
	else
		dw_ambito.Setcolumn("nro_centro")
		dw_ambito.Settext(string(li_todos) )
		//dw_ambito.fnu_deshab_cmd(dw_ambito)
	end if

	//dw_ambito.fnu_deshab_puesto(dw_ambito)
	dw_ambito.AcceptText()
	if is_donde="ZONA" then
		iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "TODOS", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)
	else
		iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "TODOSCMD", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)											 
	end if
	dw_ambito.fnu_filtro_centro()

ELSEIF dw_ambito.GetItemNumber(1,"nro_mesa") <> li_todos THEN
	// Si retrocedo a CENTRO, CMD, TODOS
  ii_nivel = 1
	if is_donde="ZONA" then
		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.setcolumn("nro_centro")
		dw_ambito.settext(string(li_centro))
		dw_ambito.AcceptText()
		iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "CENTRO", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)	   
	else				
		dw_ambito.fnu_insertar_datos(fgci_todos,fgci_todos,fgci_todos,0)
		dw_ambito.AcceptText()
		dw_ambito.setcolumn("nro_cmd")
		dw_ambito.settext(string(li_cmd))
		dw_ambito.AcceptText()
		iu_bdg_2014_nu.fnu_armar_sql(dw_datos, "CMD", ii_acumulado, ii_historicos, ii_totales, ii_unidades, ii_operacion)	    
	end if
END IF

Parent.TriggerEvent("ue_obtener_datos")
	
IF gr_grafica.Visible THEN
	Parent.fw_graficar()
ELSE

	// Inicializo el vector
	Parent.fw_inicializo_vector()
	Parent.fw_inicializo_vector2()
	
	IF	ii_totales = 0 THEN
		Parent.TriggerEvent("ue_a_porcentajes")
	END IF

	// Cargo el vector con todas las filas tra$$HEX1$$ed00$$ENDHEX$$das

	IF ii_totales = 1 THEN
		ii_totales = 0
		rb_sum_totales.triggerEvent("clicked")
//		sle_fil_selec.text = String(dw_datos.RowCount())
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

END IF



dw_datos.SetRedraw(True)

// Habilito la DW de datos
dw_datos.Enabled = True
end event

type rb_sum_totales from radiobutton within w_4007_energia_perdida_corte
integer x = 2976
integer y = 736
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
dw_datos.setRedraw(false)
ii_totales = 1

dw_datos.SetRowFocusIndicator(OFF!)

li_cant_filas = dw_datos.RowCount()
li_fila = 1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"fila_marcada",1)
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
	pb_graficar.Enabled = False
	pb_sectores.Enabled = False
ELSE
	// Habilito el BOTONES graficar
	pb_graficar.Enabled = True
	IF ii_num_col_marca=1 THEN
		pb_sectores.Enabled = TRUE
	ELSE
		pb_sectores.Enabled = FALSE
	END IF
END IF

dw_datos.SetRowFocusIndicator(FOCUSRECT!)
dw_datos.setRedraw(true)
end event

type rb_sum_parciales from radiobutton within w_4007_energia_perdida_corte
integer x = 2976
integer y = 808
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
if dw_criterio_seleccion.GetItemNumber(1,'pa_unidades') = 0 THEN
	this.checked = false
	this.enabled = false
	rb_sum_totales.checked = true
	rb_sum_totales.enabled = false
	return
end if
IF ii_totales = 0 THEN return
dw_datos.setRedraw(false)
ii_totales = 0
dw_datos.SetRowFocusIndicator(OFF!)

li_cant_filas = dw_datos.RowCount()
li_fila = 1
DO WHILE li_fila <= li_cant_filas
	dw_datos.SelectRow(li_fila,False)
	dw_datos.SetItem(li_fila,"fila_marcada",0)
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

type gb_sumas from groupbox within w_4007_energia_perdida_corte
integer x = 2944
integer y = 664
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

type dw_criterio_seleccion from u_bdg_2014_pr_filtro_perdidas_corte within w_4007_energia_perdida_corte
integer y = 20
integer width = 2816
integer height = 512
integer taborder = 10
boolean bringtotop = true
boolean border = false
end type

event itemchanged;///////////////////////////////////////////////////////////////////////
//
//	Event: itemchanged
//
///////////////////////////////////////////////////////////////////////

string ls_columna
int li_valor, li_unidad 

ls_columna = this.getColumnName()
li_valor = integer(this.getText())

CHOOSE CASE ls_columna
	CASE "pa_zona_cmd"
		ii_zona_cmd=li_valor
		fw_des_column_selec()
		Parent.TriggerEvent("ue_actualizar")
		return	
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
		Parent.TriggerEvent("ue_a_porcentajes")
		return
	CASE "pa_acumulado_sn"
		ii_acumulado = li_valor		
		//Parent.TriggerEvent("ue_actualizar")
		dw_Datos.reset()
		return
	CASE "pa_operaciones_sgi"
		fw_des_column_selec()
		ii_operacion = li_valor
		dw_Datos.reset()
		this.Accepttext()
		//Parent.TriggerEvent("ue_actualizar")
		return
		
		return
END CHOOSE
Parent.TriggerEvent("ue_resetear_datos")
end event

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	16/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("pa_zona_cmd.CheckBox.Text = '" + fg_cor_dw("Zona / Cmd", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	16/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_4007_energia_perdida_corte
integer x = 128
integer y = 132
integer width = 992
integer height = 380
integer taborder = 20
boolean bringtotop = true
boolean border = false
end type

event post_itemchange;call super::post_itemchange;/////////////////////////////////////////////////////////////////////////
//
// Event:  post_itemchange
//
/////////////////////////////////////////////////////////////////////////

Parent.PostEvent("ue_resetear_datos")

end event

event itemchanged;call super::itemchanged;parent.TriggerEvent("zonacmdVisible")
end event

type pb_sectores from picturebutton within w_4007_energia_perdida_corte
event clicked pbm_bnclicked
integer x = 2967
integer y = 500
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
		m_energia_perdida_corte.m_opciones.m_actualizar.Enabled = FALSE
		m_energia_perdida_corte.m_opciones.m_historicos.Enabled = FALSE
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
		m_energia_perdida_corte.m_opciones.m_actualizar.Enabled = TRUE
		m_energia_perdida_corte.m_opciones.m_historicos.Enabled = TRUE
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

type pb_graficar from picturebutton within w_4007_energia_perdida_corte
event clicked pbm_bnclicked
integer x = 3177
integer y = 500
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
		m_energia_perdida_corte.m_opciones.m_actualizar.Enabled = FALSE
		m_energia_perdida_corte.m_opciones.m_historicos.Enabled = FALSE
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
		rb_sum_parciales.Enabled = TRUE
		m_energia_perdida_corte.m_opciones.m_actualizar.Enabled = TRUE
		m_energia_perdida_corte.m_opciones.m_historicos.Enabled = TRUE
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

type dw_datos from u_bdg_2015_pr_perdidas_corte within w_4007_energia_perdida_corte
integer y = 544
integer width = 2889
integer height = 1088
integer taborder = 30
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	clicked
//
/////////////////////////////////////////////////////////////////////////

if lb_avance=false then 
	ii_fila_clicked = row
	ii_column_clicked = This.GetClickedColumn()
end if
	
// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona
IF ii_column_clicked = 1 OR ii_column_clicked = 2 OR ii_column_clicked = 3 or ii_column_clicked = 4 or ii_column_clicked = 9 THEN
	
	IF ii_fila_clicked > 0 THEN
	
		//	Si est$$HEX2$$e1002000$$ENDHEX$$en TOTALES
	IF ii_totales = 1 THEN
			dw_ambito.SetRedraw(False)
			IF Long(This.Describe("nom_centro_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_centro")
				dw_ambito.settext(string(this.GetItemNumber(ii_fila_clicked,"nro_centro")))
				dw_ambito.AcceptText()
				dw_ambito.fnu_filtro_mesa_n()
				dw_ambito.fnu_hab_puesto(dw_ambito)
				
//				dw_ambito.fpr_filtro_cmd()
//				dw_ambito.fnu_hab_cmd(dw_ambito)
			ELSEIF Long(This.Describe("nom_cmd_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_cmd")
				dw_ambito.settext(string(this.GetItemNumber(ii_fila_clicked,"nro_cmd")))

				dw_ambito.AcceptText()
//				dw_ambito.fpr_filtro_mesa()
				dw_ambito.fnu_filtro_mesa_n()
				dw_ambito.fnu_hab_puesto(dw_ambito)
			ELSEIF Long(This.Describe("nom_puesto_t.Visible")) = 1 THEN
				dw_ambito.setcolumn("nro_mesa")
				dw_ambito.settext(string(this.GetItemNumber(ii_fila_clicked,"nro_mesa")))
				dw_ambito.AcceptText()
			END IF
			
			dw_ambito.SetRedraw(True)
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
			this.setredraw(true)
	END IF
END IF

end event

event doubleclicked;call super::doubleclicked;/////////////////////////////////////////////////////////////////////////
//
// Event:  	doubleclicked
//
/////////////////////////////////////////////////////////////////////////
string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm
string ls_color_texto_mark
string ls_column, ls_column2, ls_column3, ls_column4
integer li_columna_foco

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_fondo_norm = String(12632256)
ls_color_fondo_norm = gs_gris
// Fin. Sgo.
ls_color_texto_norm = String(0)
ls_color_fondo_mark = String(65536*128+256*128+128)
ls_color_texto_mark = String(0)

//this.SetRedraw(False)		

// Si cliqueo en una columna y no es la de "FECHA" ni la de "NOMBRE DE INSTALACION"
IF ii_column_clicked > 1  and ii_column_clicked <> 9 THEN

	// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona, avanzo
	IF ii_column_clicked = 2 OR ii_column_clicked = 3 OR ii_column_clicked = 4  THEN
		IF ii_totales = 1 THEN
			// Si ya estoy en el nivel inferior no avanzo
			if ii_nivel = 3 then
				dw_datos.SetRedraw(True)
				return
			end if
			
			IF ii_totales = 1 THEN
				fw_des_column_selec()
				Parent.TriggerEvent("ue_actualizar")
			END IF
		END IF
	ELSE 
		
		ib_habilitado = rb_sum_parciales.enabled and rb_sum_totales.enabled
      // Si quiere marcar/desmarcar una columna
		ls_column = This.Describe("#"+ String(ii_column_clicked) +".Name")
		ls_column2 = ls_column + "_s"
		ls_column3 = ls_column + "_a"
		ls_column3 = ls_column + "_p"

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

			Parent.fw_marcar_col(ii_column_clicked)
			ii_num_col_marca ++
			
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
			This.Modify(" "+ ls_column4 +".Background.Color="+ ls_color_fondo_mark +" ")
			This.Modify(" "+ ls_column4 +".Text.Color="+ ls_color_texto_mark +" ")

			Parent.fw_desmarcar_col(ii_column_clicked)
			ii_num_col_marca --

		END IF
		
		Parent.TriggerEvent("ue_botones")
		dw_ambito.SetRedraw(true)		
	END IF
END IF

//this.SetRedraw(True)
dw_ambito.SetRedraw(true)		
end event

event ue_mover_borde;//
end event

event ue_key_down;//
end event

type gr_sectores from graph within w_4007_energia_perdida_corte
event other pbm_other
event create ( )
event destroy ( )
integer x = 9
integer y = 552
integer width = 2862
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

type gr_grafica from graph within w_4007_energia_perdida_corte
integer x = 9
integer y = 552
integer width = 2862
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

event other;integer SeriesNum, DataNum
double value
grObjectType ObjectType
string SeriesName, ValueAsString

ObjectType = gr_grafica.ObjectAtPointer(SeriesNum, DataNum)
IF ObjectType = TypeData! THEN

	Value = gr_grafica.GetData(SeriesNum, DataNum)
	ValueAsString = string(round(Value,2))
	IF ii_unidades = 0 THEN
		st_valor_actual.Text = gr_grafica.SeriesName(SeriesNum)+" : "+ValueAsString+" %"
	ELSE
		st_valor_actual.Text = gr_grafica.SeriesName(SeriesNum)+" : "+ValueAsString
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

type st_valor_actual from statictext within w_4007_energia_perdida_corte
integer x = 1893
integer y = 552
integer width = 928
integer height = 96
integer taborder = 80
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

type dw_impresion from datawindow within w_4007_energia_perdida_corte
boolean visible = false
integer x = 370
integer y = 900
integer width = 251
integer height = 144
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_bdg_2008_pr_energ_perd_corte"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


HA$PBExportHeader$w_1211_identificar_suministro.srw
forward
global type w_1211_identificar_suministro from w_sgigenerica
end type
type cb_cancelar from commandbutton within w_1211_identificar_suministro
end type
type cb_undo from commandbutton within w_1211_identificar_suministro
end type
type cb_buscar from commandbutton within w_1211_identificar_suministro
end type
type st_1 from statictext within w_1211_identificar_suministro
end type
type st_2 from statictext within w_1211_identificar_suministro
end type
type sle_esq_cond from singlelineedit within w_1211_identificar_suministro
end type
type sle_telefono from singlelineedit within w_1211_identificar_suministro
end type
type r_3 from rectangle within w_1211_identificar_suministro
end type
type dw_filtro_fecha from ue_gen_filtro_fechas within w_1211_identificar_suministro
end type
type dw_1 from datawindow within w_1211_identificar_suministro
end type
type tab_1 from tab within w_1211_identificar_suministro
end type
type suministro from userobject within tab_1
end type
type cb_5 from commandbutton within suministro
end type
type d_direccion from u_dir_2001_pr_direccion_std within suministro
end type
type gb_2 from groupbox within suministro
end type
type st_ape2 from statictext within suministro
end type
type st_doc2 from statictext within suministro
end type
type st_dir from statictext within suministro
end type
type gb_1 from groupbox within suministro
end type
type cb_1 from commandbutton within suministro
end type
type st_nic from statictext within suministro
end type
type st_nis2 from statictext within suministro
end type
type d_nis_rad from u_nis_2001_pr_nis_rad within suministro
end type
type gb_3 from groupbox within suministro
end type
type d_cliente from u_cli_2001_pr_cliente_std within suministro
end type
type suministro from userobject within tab_1
cb_5 cb_5
d_direccion d_direccion
gb_2 gb_2
st_ape2 st_ape2
st_doc2 st_doc2
st_dir st_dir
gb_1 gb_1
cb_1 cb_1
st_nic st_nic
st_nis2 st_nis2
d_nis_rad d_nis_rad
gb_3 gb_3
d_cliente d_cliente
end type
type incidencias from userobject within tab_1
end type
type st_incidencias from statictext within incidencias
end type
type cb_2 from commandbutton within incidencias
end type
type dw_2 from datawindow within incidencias
end type
type cbx_historico from checkbox within incidencias
end type
type dw_listado_incidencias from u_inc_2021_pr_lista_incidencia within incidencias
end type
type incidencias from userobject within tab_1
st_incidencias st_incidencias
cb_2 cb_2
dw_2 dw_2
cbx_historico cbx_historico
dw_listado_incidencias dw_listado_incidencias
end type
type incidenciasin from userobject within tab_1
end type
type st_incidencias_sin from statictext within incidenciasin
end type
type cb_imprimir2 from commandbutton within incidenciasin
end type
type dw_5 from datawindow within incidenciasin
end type
type cbx_historico2 from checkbox within incidenciasin
end type
type dw_listado_incidencias_sin from u_inc_2021_pr_lista_incidencia within incidenciasin
end type
type incidenciasin from userobject within tab_1
st_incidencias_sin st_incidencias_sin
cb_imprimir2 cb_imprimir2
dw_5 dw_5
cbx_historico2 cbx_historico2
dw_listado_incidencias_sin dw_listado_incidencias_sin
end type
type avisos from userobject within tab_1
end type
type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within avisos
end type
type st_avisos from statictext within avisos
end type
type cb_3 from commandbutton within avisos
end type
type dw_3 from datawindow within avisos
end type
type cbx_historico3 from checkbox within avisos
end type
type avisos from userobject within tab_1
d_lista_aviso d_lista_aviso
st_avisos st_avisos
cb_3 cb_3
dw_3 dw_3
cbx_historico3 cbx_historico3
end type
type interrupciones from userobject within tab_1
end type
type d_interrupciones from u_int_2005_interrupciones_nis within interrupciones
end type
type st_interrupciones from statictext within interrupciones
end type
type cb_4 from commandbutton within interrupciones
end type
type dw_4 from datawindow within interrupciones
end type
type cbx_historico4 from checkbox within interrupciones
end type
type interrupciones from userobject within tab_1
d_interrupciones d_interrupciones
st_interrupciones st_interrupciones
cb_4 cb_4
dw_4 dw_4
cbx_historico4 cbx_historico4
end type
type tab_1 from tab within w_1211_identificar_suministro
suministro suministro
incidencias incidencias
incidenciasin incidenciasin
avisos avisos
interrupciones interrupciones
end type
type cbx_afec_parcial from checkbox within w_1211_identificar_suministro
end type
type cb_exportar from commandbutton within w_1211_identificar_suministro
end type
end forward

global type w_1211_identificar_suministro from w_sgigenerica
integer width = 6199
integer height = 3084
string title = "OPEN SGI - Avisos e Incidencias por Cliente"
boolean resizable = false
long backcolor = 79741120
string icon = "picture.ico"
event ue_buscar pbm_custom40
event ue_nuevo pbm_custom42
event ue_proc_sum pbm_custom43
event ue_avisos_nic pbm_custom44
event ue_incid_nic pbm_custom45
event ue_armar_sql pbm_custom49
event ue_retrieve pbm_custom50
event ue_interrup_nic pbm_custom51
cb_cancelar cb_cancelar
cb_undo cb_undo
cb_buscar cb_buscar
st_1 st_1
st_2 st_2
sle_esq_cond sle_esq_cond
sle_telefono sle_telefono
r_3 r_3
dw_filtro_fecha dw_filtro_fecha
dw_1 dw_1
tab_1 tab_1
cbx_afec_parcial cbx_afec_parcial
cb_exportar cb_exportar
end type
global w_1211_identificar_suministro w_1211_identificar_suministro

type variables
u_generico_comunicaciones iu_comunic
u_avi_2004_pr_form_inf_resumen	iu_avi_2004_pr
u_generico_comunicaciones		iu_gen_comunic

s_direccion_cliente			is_direccion
long	il_ord_servicio, il_nro_incid, il_ex_avi_pendiente
int ii_fila_ant
string	is_prov, is_depto, is_munic, is_local
string is_clausula_where
string is_modificacion
string is_select_original, is_select_original_2
string retorno
string etiqueta_activa
boolean ib_calle
boolean ib_trajo_datos=false
boolean ib_trajo_datos2=false
boolean ib_trajo_datos3=false
boolean ib_trajo_datos4=false
datetime idt_f_alta_contrato
string is_avisos_select = ''
datetime idt_f_historico
string is_select_interrupciones
string is_incidencias_sin_interrupcion

Boolean ib_param_nic  //**  OSGI 2001.1  15/06/2001
Boolean ib_hist_relac_inst  //** OSGI 2001.2 02/09/2002
String is_modif_dw_interr  //** OSGI 2001.2 24/10/2002
int ii_afec_parcial=0

//AHM (24/02/2011) ASUR 953409
datastore	ids_filtros
boolean banderaRehacer = false
boolean banderaHist = false
st_params st_parametros
end variables

forward prototypes
public subroutine fw_editar_campos (datawindow pdw_datos)
public subroutine fw_visible_enabled_nic (readonly boolean ab_estado)
public function integer fw_nic ()
public function integer fw_nis ()
public function integer fw_filtrar_datos (string ps_f_desde, string ps_f_hasta, ref datawindow pd_dw, boolean pb_historicos)
public subroutine fw_retrieve_end (datawindow adw_dw)
public subroutine fw_hist_relac_inst (ref string as_sqlsyntax, datawindow adw_dw)
public subroutine fw_prepara_dw_interr (readonly integer ai_opcion)
public function string fw_afec_parcial_relac_cte ()
public function integer fw_exportar_excel (datawindow pd_datawindow)
public subroutine reorganizartab ()
public subroutine llenartablas (long ll_filas, integer li_fila)
public subroutine cambiarfechas (integer newindex)
public subroutine busquedarapida ()
end prototypes

event ue_buscar;call super::ue_buscar;int li_v_doc

SetPointer(HourGlass!)

// Valido Nis_Rad
is_direccion.gl_nis = long(tab_1.suministro.d_nis_rad.fpr_v_nis_rad(tab_1.suministro.d_nis_rad))

IF  (Len(string(is_direccion.gl_nis)) = 7) THEN

	// Cargo en la estructura el resto de los datos necesarios

	IF tab_1.suministro.d_nis_rad.fpr_c_estruc_dir_por_nis(is_direccion) = 1 THEN

		//	Procedimiento Almacenado Datos_suministro ???

		This.TriggerEvent("ue_proc_sum")

	ELSE
		gnv_msg.f_mensaje("AR03","","",OK!)
	END IF
ELSE
	IF is_direccion.gl_nis = long("0") THEN
		gnv_msg.f_mensaje("ER32","","",OK!)
	END IF

	// Valido el Documento

	tab_1.suministro.d_cliente.AcceptText()
	is_direccion.gs_doc = tab_1.suministro.d_cliente.fpr_v_documento(tab_1.suministro.d_cliente) 
	IF is_direccion.gs_doc <> " " THEN

		// Cargo en la estructura el resto de los datos necesarios

		li_v_doc = tab_1.suministro.d_cliente.fpr_c_estruc_dir_por_doc(is_direccion) 
		IF li_v_doc = 1 THEN

			//	Procedimiento Almacenado Datos_suministro ???

			This.TriggerEvent("ue_proc_sum")					
		ELSEIF li_v_doc = 0 THEN
			gnv_msg.f_mensaje("AR04","","",OK!)
		END IF
	ELSEIF is_direccion.gl_nis = long("-1") THEN
		gnv_msg.f_mensaje("AR05","","",OK!)
	END IF
END IF




end event

event ue_nuevo;s_direccion_cliente ls_direccion

SetRedraw(False)

// Limpio los campos

tab_1.suministro.d_nis_rad.fpr_limpiar_campos()
tab_1.suministro.d_cliente.fpr_limpiar_campos()
tab_1.suministro.d_direccion.fpr_limpiar_campos()
fpr_limpiar_campo_sle(sle_telefono)
fpr_limpiar_campo_sle(sle_esq_cond)
tab_1.suministro.d_nis_rad.fpr_habilitar_campos(False)
tab_1.suministro.d_nis_rad.accepttext()
tab_1.suministro.d_cliente.accepttext()
tab_1.suministro.d_direccion.accepttext()

// Habilito los campos de los user-object que utilizo

tab_1.suministro.d_nis_rad.fpr_habilitar_campos(True)
tab_1.suministro.d_direccion.fpr_habilitar_campos(False,False)
fpr_habilitar_campo_sle(sle_telefono,True)
fpr_habilitar_campo_sle(sle_esq_cond,True)
tab_1.suministro.d_cliente.fpr_habilitar_campos(False,False)

// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda

tab_1.suministro.st_nis2.Show()
tab_1.suministro.st_dir.Show()
tab_1.suministro.st_ape2.Show()
tab_1.suministro.st_doc2.Show()
tab_1.suministro.st_doc2.Enabled=true
tab_1.suministro.st_ape2.Enabled=true
tab_1.suministro.st_dir.Enabled=true
tab_1.suministro.st_nis2.Enabled=true
// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
tab_1.suministro.d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

SetRedraw(True)

// Me paro en el campo nis_rad
tab_1.suministro.d_nis_rad.SetFocus()

tab_1.incidencias.dw_listado_incidencias.reset()
tab_1.incidenciasin.dw_listado_incidencias_sin.reset()
tab_1.avisos.d_lista_aviso.reset()
tab_1.interrupciones.d_interrupciones.reset()
tab_1.incidenciasin.dw_listado_incidencias_sin.setredraw(true)
tab_1.incidencias.dw_listado_incidencias.setredraw(true)
tab_1.avisos.d_lista_aviso.setredraw(true)
tab_1.interrupciones.d_interrupciones.setredraw(true)
is_direccion = ls_direccion

int li_indice,li_max_filas
li_indice = 1
li_max_filas = tab_1.incidencias.dw_listado_incidencias.rowcount()
if li_max_filas > 0 then
	FOR li_indice = 1 TO li_max_filas
		tab_1.incidencias.dw_listado_incidencias.deleterow(li_indice)
	NEXT	
end if
li_indice = 1
li_max_filas = tab_1.incidenciasin.dw_listado_incidencias_sin.rowcount()
if li_max_filas > 0 then
	FOR li_indice = 1 TO li_max_filas
		tab_1.incidenciasin.dw_listado_incidencias_sin.deleterow(li_indice)
	NEXT	
end if
li_indice = 1
li_max_filas = tab_1.avisos.d_lista_aviso.rowcount()
if li_max_filas > 0 then
	FOR li_indice = 1 TO li_max_filas
		tab_1.avisos.d_lista_aviso.deleterow(li_indice)
	NEXT	
end if
li_indice = 1
li_max_filas = tab_1.interrupciones.d_interrupciones.rowcount()
if li_max_filas > 0 then
	FOR li_indice = 1 TO li_max_filas
		tab_1.interrupciones.d_interrupciones.deleterow(li_indice)
	NEXT	
end if

//
//md_inf_avisos_inc.m_consultas.m_avisos2.enabled = false
//md_inf_avisos_inc.m_consultas.m_avisos2.toolbaritemvisible = false
//md_inf_avisos_inc.m_consultas.m_incidencias3.enabled = false
//md_inf_avisos_inc.m_consultas.m_incidencias3.toolbaritemvisible = false
//md_inf_avisos_inc.m_consultas.m_interrupciones.Enabled = FALSE
//md_inf_avisos_inc.m_consultas.m_interrupciones.toolbaritemvisible = FALSE
//


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
tab_1.suministro.st_nic.Text = ''
fw_visible_enabled_nic(False)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
etiqueta_activa = ''
ids_filtros.reset()
tab_1.incidencias.dw_listado_incidencias.reset()
tab_1.incidenciasin.dw_listado_incidencias_sin.reset()
tab_1.avisos.d_lista_aviso.reset()
tab_1.interrupciones.d_interrupciones.reset()

end event

event ue_proc_sum;int li_imp, li_pend, li_posib

SetPointer(HourGlass!)

// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de la ventana
// y cargo la estructura de avisos

tab_1.suministro.d_nis_rad.fpr_llenar_campos(is_direccion.gl_nis)
tab_1.suministro.d_cliente.fpr_llenar_campos(is_direccion)
tab_1.suministro.d_direccion.fpr_llenar_campos(is_direccion)
IF NOT IsNull(is_direccion.gs_esq_cond) THEN
	fpr_llenar_campo_sle(sle_esq_cond,string(is_direccion.gs_esq_cond))
END IF
fpr_llenar_campo_sle(sle_telefono,is_direccion.gs_telefono)

// Deshabilito campos de user-object Nis_Rad,direcci$$HEX1$$f300$$ENDHEX$$n y cliente

tab_1.suministro.d_nis_rad.fpr_habilitar_campos(False)
tab_1.suministro.d_direccion.fpr_habilitar_campos(False,False)
tab_1.suministro.d_cliente.fpr_habilitar_campos(False,False)
// Cargo la clave geogr$$HEX1$$e100$$ENDHEX$$fica vertical y c$$HEX1$$f300$$ENDHEX$$digos en la estructura

iu_avi_2004_pr.fpr_c_cgv_y_cods(is_direccion)

//md_inf_avisos_inc.f_habilitar("m_aviso2",true)
//md_inf_avisos_inc.f_habilitar("m_incidencias3",true)
//
//md_inf_avisos_inc.m_consultas.m_avisos2.enabled = true
//md_inf_avisos_inc.m_consultas.m_avisos2.toolbaritemvisible = true
//md_inf_avisos_inc.m_consultas.m_incidencias3.enabled = true
//md_inf_avisos_inc.m_consultas.m_incidencias3.toolbaritemvisible = true
//md_inf_avisos_inc.m_consultas.m_interrupciones.Enabled = TRUE
//md_inf_avisos_inc.m_consultas.m_interrupciones.toolbaritemvisible = TRUE

// Parametrizo el n$$HEX1$$fa00$$ENDHEX$$mero de aviso//MERC

IF gl_nro_aviso_visible THEN
	tab_1.avisos.d_lista_aviso.Object.Nro_Aviso.Visible = 1
ELSE
	tab_1.avisos.d_lista_aviso.Object.Nro_Aviso.Visible = 0
	tab_1.avisos.d_lista_aviso.Modify("prioridad_t.Alignment='2'")
END IF	
// OBTENEMOS LA FECHA DE ALTA DEL SUMINISTRO
select nvl(F_ALTA_CONT,sysdate) into :idt_f_alta_contrato from sumcon where nis_rad = :is_direccion.gl_nis;



	
end event

event ue_armar_sql;
string ls_f_desde,ls_f_hasta
string ls_select,ls_from, ls_where
string ls_select_hist, ls_tabla_original, ls_nueva_tabla, ls_plsql_orig, ls_plsql_nuevo
string ls_select_original
long ll_start_pos=1


ls_f_desde=dw_filtro_fecha.fnu_fecha1_numerica()
ls_f_hasta=dw_filtro_fecha.fnu_fecha2_numerica()

	
	
IF etiqueta_activa="incidencias" THEN
	
	ls_select_original = tab_1.incidencias.dw_listado_incidencias.Describe("datawindow.table.select")					
   is_incidencias_sin_interrupcion= ls_select_original
	ll_start_pos = pos(ls_select_original,"UNION",1)
	ll_start_pos = pos(ls_select_original,"UNION", ll_start_pos + 1)
	IF NOT tab_1.incidencias.cbx_historico.checked THEN
		ll_start_pos = pos(ls_select_original,"UNION", ll_start_pos + 1)
	END IF

	if gb_operaciones = False OR (gb_operaciones = true AND gi_tension_nivel_min = fgci_media_tension) then 
		// NOS QUEDAMOS CON LA PRIMERA PARTE DE LA SELECT
		IF ii_afec_parcial = 1 AND cbx_afec_parcial.checked THEN
			ll_start_pos = pos(ls_select_original,"UNION", ll_start_pos + 1)
		END IF

		ls_select_original= mid(ls_select_original,1,ll_start_pos - 1)
   else
		IF ii_afec_parcial = 0 OR cbx_afec_parcial.checked = FALSE THEN
			ll_start_pos = pos(ls_select_original,"UNION", ll_start_pos + 1)
		END IF
		ll_start_pos = pos(ls_select_original,"SELECT",ll_Start_pos)
		ls_select_original= mid(ls_select_original,ll_start_pos) 
	end if
	is_modificacion = "DataWindow.table.Select=~"" +ls_select_original + "~""
	retorno = tab_1.incidencias.dw_listado_incidencias.modify(is_modificacion)
//
ELSEIF etiqueta_activa="avisos" THEN
	
	
	//DSA 25/01/2000 Permitir buscar por un dia. (Cuando ls_f_desde = ls_f_hasta)  
	ls_where =		" AND to_char(GI_AVISOS.f_alta,'YYYYMMDD') >=  '" + ls_f_desde +  "' " + &
						" AND to_char(GI_AVISOS.f_alta,'YYYYMMDD') <=  '" + ls_f_hasta +  "' " + &
						" AND GI_AVISOS.Nis_Rad = " + String(tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"))

	tab_1.avisos.d_lista_aviso.SetSqlSelect(is_avisos_select + " " + ls_where)// DSA 08/05/2000	


	ls_select_hist =is_avisos_select + " " + ls_where


// SI TRAEMOS DATOS DEL HISTORICO CAMBIAMOS LA SELECT Y AL REVES
//
if tab_1.avisos.cbx_historico3.checked then  
	ls_tabla_original = "GI_AVISOS"
	ls_nueva_tabla = "GI_HIST_AVISOS"
else
	ls_tabla_original = "GI_HIST_AVISOS"
	ls_nueva_tabla = "GI_AVISOS"
end if

// Se obtiene la primera aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos)
// Only enter the loop if you find old_str.
DO WHILE ll_start_pos > 0
	// Se sustituye la aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ls_select_hist = Replace(ls_select_hist, ll_start_pos, Len(ls_tabla_original), ls_nueva_tabla)
	// Se busca la siguiente aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos + Len(ls_nueva_tabla))

LOOP

	tab_1.avisos.d_lista_aviso.SetSqlSelect(ls_select_hist)
	
ELSEIF etiqueta_activa="interrupciones" THEN
	ls_select_original = tab_1.interrupciones.d_interrupciones.Describe("datawindow.table.select")	
	is_select_interrupciones = ls_select_original
	ll_start_pos = pos(ls_select_original,"UNION",1)
	IF NOT tab_1.interrupciones.cbx_historico4.checked THEN
		ll_start_pos = pos(ls_select_original,"UNION", ll_start_pos + 1)
	END IF

	if gb_operaciones = FALSE OR (gb_operaciones = true and gi_tension_nivel_min = fgci_media_tension) then 
		IF ii_afec_parcial = 1 AND cbx_afec_parcial.checked THEN
			ll_start_pos = pos(ls_select_original,"UNION", ll_start_pos + 1)
		END IF
		// NOS QUEDAMOS CON LA PRIMERA PARTE DE LA SELECT
		ls_select_original= mid(ls_select_original,1,ll_start_pos - 1)
   else
		IF ii_afec_parcial = 0 OR cbx_afec_parcial.checked = FALSE THEN
			ll_start_pos = pos(ls_select_original,"UNION", ll_start_pos + 1)
		END IF
		ll_start_pos = pos(ls_select_original,"SELECT",ll_Start_pos)
		ls_select_original= mid(ls_select_original,ll_start_pos) 
	end if
	is_modificacion = "DataWindow.table.Select=~"" +ls_select_original + "~""
	retorno = tab_1.interrupciones.d_interrupciones.modify(is_modificacion)

END IF


end event

event ue_retrieve;call super::ue_retrieve;
//d_lista_aviso.visible = True
//d_lista_aviso.enabled = true
//dw_listado_incidencias.visible = false
//dw_listado_incidencias.enabled = false
//d_interrupciones.Visible = FALSE
//d_interrupciones.Enabled = FALSE
//
end event

public subroutine fw_editar_campos (datawindow pdw_datos);
string ls_documento, ls_pais, ls_codigo, ls_tipo

ls_codigo = pdw_datos.GetItemString(1,'co_pais')
SELECT "CODIGOS"."DESC_COD"
INTO :ls_pais
FROM "CODIGOS" 
WHERE "CODIGOS"."COD" = :ls_codigo ;

ls_tipo = pdw_datos.GetItemString(1,'tip_doc')
SELECT  "TIPOS"."DESC_TIPO"  
INTO :ls_documento
FROM "TIPOS"  
WHERE "TIPOS"."TIPO" = :ls_tipo  ;

dw_1.Modify("tipo_doc_t.text = '" + ls_documento + "'")
dw_1.Modify("co_pais_t.text ='" + ls_pais + "'")
end subroutine

public subroutine fw_visible_enabled_nic (readonly boolean ab_estado);//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not ab_estado Or Not ib_param_nic Then
	tab_1.suministro.st_nic.Visible = False
Else
	tab_1.suministro.st_nic.Visible = True
End If
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public function integer fw_nic ();//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_nis_rad, ll_nic, ll_reg
Integer li_return
String ls_cadena
Boolean lb_abrio_cur


li_return = 1

If ib_param_nic And tab_1.suministro.d_nis_rad.RowCount() > 0 Then
	tab_1.suministro.d_nis_rad.AcceptText()
	ll_nic = tab_1.suministro.d_nis_rad.GetItemNumber(tab_1.suministro.d_nis_rad.GetRow(), "nis_rad")
	tab_1.suministro.st_nic.Text = String(ll_nic)



	//******************************************
	//**  OSGI 2001.2  	09/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	ls_cadena = "SELECT NIS_RAD FROM SUMCON WHERE NIC = " + String(ll_nic)

	ls_cadena = "SELECT MAX(NIS_RAD), COUNT(*) FROM SUMCON WHERE NIC = " + String(ll_nic) + fg_tip_serv()
	//******************************************
	//**  OSGI 2001.2  	09/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************



	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_cadena ;
	OPEN DYNAMIC my_cursor ;

	If sqlca.sqlcode = 0 Then lb_abrio_cur = True

	FETCH my_cursor INTO :ll_nis_rad, :ll_reg ;

	//******************************************
	//**  OSGI 2001.2  	02/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	If sqlca.sqlcode <> 0 Or IsNull(ll_nis_rad) Then
		ll_nis_rad = 0
		ll_reg = 0
		li_return = 0
	End If

	If ll_reg > 1 Then
		OpenWithParm(w_at0113_tel, String(ll_nic) + "~t2")

		is_direccion = Message.PowerObjectParm
		
		// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
		IF (Len(string(is_direccion.gl_nis)) = 7) THEN
			ll_nis_rad = is_direccion.gl_nis
			li_return = 1
		Else
			If IsNull(is_direccion.gl_nis) Then
				li_return = -1
				SetNull(ll_nis_rad)
			Else
				li_return = 0
				ll_nis_rad = 0
			End If
		END IF
	End If
	//******************************************
	//**  OSGI 2001.2  	02/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************

	If li_return = 1 Then
		fw_visible_enabled_nic(True)
	Else
		tab_1.suministro.st_nic.Text = ""
	End If

	If lb_abrio_cur Then
		CLOSE my_cursor ;
	End If

	tab_1.suministro.d_nis_rad.SetItem(tab_1.suministro.d_nis_rad.GetRow(), "nis_rad", ll_nis_rad)
	tab_1.suministro.d_nis_rad.AcceptText()
End If

Return li_return
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

public function integer fw_nis ();//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_nis_rad, ll_nic
Integer li_return
String ls_cadena
Boolean lb_abrio_cur


li_return = 1

If ib_param_nic And tab_1.suministro.d_nis_rad.RowCount() > 0 Then
	tab_1.suministro.d_nis_rad.AcceptText()
	ll_nis_rad = tab_1.suministro.d_nis_rad.GetItemNumber(tab_1.suministro.d_nis_rad.GetRow(), "nis_rad")
	
	
	If IsNull(ll_nis_rad) Or ll_nis_rad <= 0 Then
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El NIC solicitado no cuenta con ningun suministro asociado.")
		li_return = 0
		fw_visible_enabled_nic(False)
	Else
		//******************************************
		//**  OSGI 2001.2  	14/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad)

		ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad) + fg_tip_serv()
		//******************************************
		//**  OSGI 2001.2  	14/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************


		DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
		PREPARE SQLSA FROM :ls_cadena ;
		OPEN DYNAMIC my_cursor ;

		If sqlca.sqlcode = 0 Then lb_abrio_cur = True

		FETCH my_cursor INTO :ll_nic ;


		If sqlca.sqlcode <> 0 Or IsNull(ll_nic) Or ll_nic <= 0 Then
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La informaci$$HEX1$$f300$$ENDHEX$$n solicitada no cuenta con ningun contrato asociado.")
			li_return = 0
			fw_visible_enabled_nic(False)
		Else
			tab_1.suministro.st_nic.Text = String(ll_nic)
			fw_visible_enabled_nic(True)
			li_return = 1
		End If
	End If

	If lb_abrio_cur Then
		CLOSE my_cursor;
	End If
End If

Return li_return
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

public function integer fw_filtrar_datos (string ps_f_desde, string ps_f_hasta, ref datawindow pd_dw, boolean pb_historicos);string ls_fase_afectada, ls_fase, ls_filtro ,ls_fase_ct
long ll_nis_rad, ll_contador
long ll_nro_incidencia
datastore ds_incidencias

int li_tipo_conexion, li_tipo_ct
long ll_cod_acometida, ll_instalacion_origen


//*******************************************
//**  OSGI 2002.1  	04/10/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
If ib_hist_relac_inst Then Return 1
//*******************************************
//**  OSGI 2002.1  	04/10/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************


IF etiqueta_activa="incidencias" THEN
	ls_fase = '111'
	ls_filtro = " pasa = 1 "
ELSE
	ls_fase = '000'
	ls_filtro = " pasa > 1 "
END IF

ds_incidencias = CREATE datastore


ll_nis_rad = tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad")
IF NOT pb_historicos THEN
	ds_incidencias.dataobject = 'd_inc_1211_interr_incid'
ELSE
	ds_incidencias.dataobject = 'd_inc_1211_interr_incid_hist'
END IF

ds_incidencias.SetTransObject(SQLCA)
ds_incidencias.Retrieve(ll_nis_rad, ps_f_desde, ps_f_hasta, ls_fase)

IF ds_incidencias.RowCount() = 0 THEN
	pd_dw.Reset()
ELSE
	
	
	
	
	 // pl_tipo_ct --> Tipo del ct al que est$$HEX2$$e1002000$$ENDHEX$$enganchado la acometida
 // pi_tipo_instalacion --> Tipo de la instalacion interrumpida
 // ps_fase_interrumpida -->  Fase de la interrupcion
 // ps_fase_afectada  --> Fase de la acometida
//  pl_tipo_conexion --> Tipo conexion de la acometida
//  ps_fase_ct
	SELECT DECODE(GI_CAMBIO_FORMATO_FASE.FASE_AFECTADA, '000', '111',GI_CAMBIO_FORMATO_FASE.FASE_AFECTADA), NVL(SGD_ACOMETIDA.TIPO_CONEXION, 15), codigo, instalacion_origen
	INTO :ls_fase_afectada , :li_tipo_conexion, :ll_cod_acometida, :ll_instalacion_origen
	FROM GI_CAMBIO_FORMATO_FASE, SGD_ACOMETIDA, ACO_SUM
	WHERE ACO_SUM.NIS_RAD = :ll_nis_rad AND
			ACO_SUM.NRO_ACOMETIDA = SGD_ACOMETIDA.CODIGO AND
			SGD_ACOMETIDA.BDI_JOB = 0 AND
			NVL(SGD_ACOMETIDA.TIPO_CONEXION, 15) = GI_CAMBIO_FORMATO_FASE.TIPO_CONEXION;
	
	
	IF SQLCA.SQLCode = 0 THEN
		
		
		// BUSCAMOS EL TIPO DEL CT AL QUE ESTA ENGANCHADA LA ACOMETIDA
		
		select nvl(TIPO_CT,0)  into :li_tipo_ct FROM SGD_INSTALACION WHERE NRO_INSTALACION = :ll_instalacion_origen and bdi_job =0 ;
		if sqlca.sqlcode <> 0 then li_tipo_ct =0 
		
		// BUSCAMOS EL TIPO_CONEXION DEL CT
		
		SELECT fgci_fase_instalacion(TIPO_CONEXION)
		INTO :ls_fase_ct
		FROM SGD_INSTALACION
		WHERE BDI_JOB = 0 AND TIPO_INSTALACION = :fgci_tipo_ct
		START WITH NRO_INSTALACION = :ll_instalacion_origen AND BDI_JOB = 0
		CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION;

		if sqlca.sqlcode <> 0 then ls_fase_ct = 'ABC'

		ls_filtro = ls_filtro + " or fg_fase_afectada("+string(li_tipo_ct)+",tipo_instalacion,fase_afectada,'"+string(ls_fase_Afectada)+"',"+string(li_tipo_conexion)+",'"+string(ls_fase_ct)+"')"
		
	///	messagebox("",ls_filtro)

		ds_incidencias.SetFilter(ls_filtro)	
		ds_incidencias.Filter()	
		
			
		IF ds_incidencias.RowCount() = 0 THEN
			pd_dw.Reset()
		END IF
		
		FOR ll_contador=1 TO pd_dw.RowCount()
			ll_nro_incidencia = pd_dw.GetItemNumber(ll_contador, 'nro_incidencia')
			
			IF ds_incidencias.Find('nro_incidencia = ' + string(ll_nro_incidencia), 0, ds_incidencias.RowCount()) <= 0 THEN
				// Incidencia no v$$HEX1$$e100$$ENDHEX$$lida
				pd_dw.DeleteRow(ll_contador)
				// Como se borra la fila actual no se incrementa el contador
				ll_contador --
			END IF
		NEXT
	END IF
END IF

Destroy (ds_incidencias)

Return 1

end function

public subroutine fw_retrieve_end (datawindow adw_dw);//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************
///////////////////////////////////////////////////////
//									
// Funcion/Evento: fw_retrieve_end
// 
// Objetivo: Inserta el valor de la columna "c_nom_salmt" con el nombre
//				 de la SMT que ten$$HEX1$$ed00$$ENDHEX$$a en ese momento la instalaci$$HEX1$$f300$$ENDHEX$$n interrumpida.
// Responsable: JPE
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: datawindow adw_dw
//
//    Salida : --
//
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------       -----------   ---------
// 04/09/2002   JPE
//
///////////////////////////////////////////////////////

String ls_nom_salmt
Long ll_nro_instalacion, ll_row, ll_i, ll_nro_incidencia, ll_nro_incidencia_old
DateTime ldt_fecha_ini, ldt_fecha_fin
DataStore lds_smt_inst_afect




lds_smt_inst_afect = Create DataStore
lds_smt_inst_afect.DataObject = "dw_co_smt_para_inst_afect"
lds_smt_inst_afect.SetTransObject(SQLCA)


ll_row = adw_dw.RowCount()

For ll_i = 1 To ll_row
	ll_nro_instalacion = adw_dw.GetItemNumber(ll_i, "nro_inst_afectada")
	ldt_fecha_ini = adw_dw.GetItemDateTime(ll_i, "f_deteccion")
	ldt_fecha_fin = adw_dw.GetItemDateTime(ll_i, "fec_resolucion")
	ll_nro_incidencia = adw_dw.GetItemNumber(ll_i, "nro_incidencia")

	If ll_nro_incidencia <> ll_nro_incidencia_old Then
		If lds_smt_inst_afect.Retrieve(fgci_tipo_ct, ll_nro_instalacion, ldt_fecha_ini, ldt_fecha_fin) > 0 Then ll_nro_instalacion = lds_smt_inst_afect.GetItemNumber(1, "nro_inst_padre")
	
	
		SELECT SGD_INSTALACION.NOM_INSTALACION
		  INTO :ls_nom_salmt
		  FROM SGD_INSTALACION  
		 WHERE ( SGD_INSTALACION.BDI_JOB <= 0 ) AND  
				 ( SGD_INSTALACION.TIPO_INSTALACION = :fgci_tipo_salida_mt ) AND    
				 ( SGD_INSTALACION.NRO_INSTALACION IN ( SELECT NRO_INSTALACION 
																		FROM SGD_INSTALACION 
																	 START WITH SGD_INSTALACION.BDI_JOB <= 0 AND 
																					NRO_INSTALACION =:ll_nro_instalacion 
																	 CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION AND 
																							SGD_INSTALACION.BDI_JOB <= 0 )) ;
	
		If SQLCA.SQLCODE <> 0 Then ls_nom_salmt = ''

		ll_nro_incidencia_old = ll_nro_incidencia
	End If

	adw_dw.SetItem(ll_i, "c_nom_salmt", ls_nom_salmt)
Next

adw_dw.AcceptText()

Destroy lds_smt_inst_afect
//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************
end subroutine

public subroutine fw_hist_relac_inst (ref string as_sqlsyntax, datawindow adw_dw);//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
///////////////////////////////////////////////////////
//									
// Funcion/Evento: fw_hist_relac_inst
// 
// Objetivo: Modifica el SQL del datawindow para obtener los datos de las 
//				 tablas de hist$$HEX1$$f300$$ENDHEX$$ricos y/o RS de incidencias e interrupciones.
//				 Adem$$HEX1$$e100$$ENDHEX$$s, cambia los valores fijos que tiene el sql por nombre de
//				 columnas para cuando la opci$$HEX1$$f300$$ENDHEX$$n es por incidencia o por interrupci$$HEX1$$f300$$ENDHEX$$n.
// Responsable: JPE
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: string as_sqlsyntax,
//					datawindow adw_dw
//
//    Salida : string
//
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------       -----------   ---------
// 04/09/2002   JPE
//
///////////////////////////////////////////////////////

String ls_syntax_ori, ls_syntax_new, ls_syntax_mod
Long ll_pos



If ib_hist_relac_inst Then
	ls_syntax_ori = as_sqlsyntax 
	
	If etiqueta_activa = "interrupciones" Then
				
		ls_syntax_mod = Reverse(ls_syntax_ori)
		
		ll_pos = Pos(ls_syntax_mod, "NOINU") - 1

		
		ls_syntax_ori = " " + Reverse(Right(ls_syntax_mod, Len(ls_syntax_mod) - ll_pos)) + " "
		ls_syntax_mod = " " + Reverse(Mid(ls_syntax_mod, 1, ll_pos)) + " "

		//***********************************
		//**  PARA LOS DE ANTES DEL UNION  **
		//***********************************
		
		// GNU 10-8-2006. Incidencias EPSA
//		fg_replace_text(ls_syntax_ori, "TO_DATE('19000101')", 'SGD_INTERRUPCION.F_ALTA')
//		fg_replace_text(ls_syntax_ori, "TO_DATE('19000102')", 'SGD_INTERRUPCION.F_REPOSICION')
		fg_replace_text(ls_syntax_ori, "TO_DATE('19000101','yyyymmdd')", 'SGD_INTERRUPCION.F_ALTA')
		fg_replace_text(ls_syntax_ori, "TO_DATE('19000102','yyyymmdd')", 'SGD_INTERRUPCION.F_REPOSICION')
		// FIN GNU
		fg_replace_text(ls_syntax_ori, "RPAD(' ', 25, ' ')", "fgnu_duracion_str(SGD_INTERRUPCION.F_ALTA,SGD_INTERRUPCION.F_REPOSICION)")

		fg_replace_text(ls_syntax_ori, "0 AS C_EST_FACT", 'SGD_INTERRUPCION.KWH_ESTIMADO AS C_EST_FACT')
		fg_replace_text(ls_syntax_ori, "0 AS NRO_INSTALACION", 'SGD_INTERRUPCION.NRO_INSTALACION AS NRO_INSTALACION')
		fg_replace_text(ls_syntax_ori, "RPAD(' ', 6, ' ') AS FASE_AFECTADA", 'SGD_VALOR.DESCRIPCION AS FASE_AFECTADA')
		fg_replace_text(ls_syntax_ori, "RPAD(' ', 45, ' ') AS NOMBRE_INSTALACION_B", 'SGD_INST_B.NOM_INSTALACION AS NOMBRE_INSTALACION_B')
		//***********************************
		//**  PARA LOS DE ANTES DEL UNION  **
		//***********************************

		//*************************************
		//**  PARA LOS DE DESPUES DEL UNION  **
		//*************************************
		// GNU 10-8-2006. Incidencias EPSA
//		fg_replace_text(ls_syntax_mod, "TO_DATE('19000101')", 'SGD_INCIDENCIA.F_DETECCION')
//		fg_replace_text(ls_syntax_mod, "TO_DATE('19000102')", 'SGD_INCIDENCIA.FEC_RESOLUCION')	
		fg_replace_text(ls_syntax_mod, "TO_DATE('19000101','yyyymmdd')", 'SGD_INCIDENCIA.F_DETECCION')
		fg_replace_text(ls_syntax_mod, "TO_DATE('19000102','yyyymmdd')", 'SGD_INCIDENCIA.FEC_RESOLUCION')
		// FIN GNU
		fg_replace_text(ls_syntax_mod, "RPAD(' ', 25, ' ')", "fgnu_duracion_str(SGD_INCIDENCIA.F_DETECCION,SGD_INCIDENCIA.FEC_RESOLUCION)")

		fg_replace_text(ls_syntax_mod, "0 AS NRO_INSTALACION", '-1 AS NRO_INSTALACION')
		fg_replace_text(ls_syntax_mod, "RPAD(' ', 6, ' ') AS FASE_AFECTADA", "'[MAN.]' AS FASE_AFECTADA")
		fg_replace_text(ls_syntax_mod, "RPAD(' ', 45, ' ') AS NOMBRE_INSTALACION_B", "' * [ ASOCIACION MANUAL DEL AVISO: ' || TO_CHAR(GI_AVISOS.NRO_AVISO) || ' ] * ' AS NOMBRE_INSTALACION_B")
		//*************************************
		//**  PARA LOS DE DESPUES DEL UNION  **
		//*************************************

		ls_syntax_ori += ls_syntax_mod
	End If
		
	ls_syntax_mod = ls_syntax_ori
	
	If (tab_1.incidencias.cbx_historico.checked = True And etiqueta_activa = "incidencias") Or &
		(tab_1.interrupciones.cbx_historico4.checked = True And etiqueta_activa = "interrupciones") Then
		
		//*********************************************************************************
		//**  SE REEMPLAZAN PARA QUE TRAIGA EL VALOR DE LA FASE DE LA COLUMNA HISTORICA  **
		//*********************************************************************************
		fg_replace_text(ls_syntax_mod, "SGD_VALOR.DESCRIPCION AS FASE_AFECTADA", 'SGD_INTERRUPCION.FASE_AFECTADA AS FASE_AFECTADA')
		fg_replace_text(ls_syntax_mod, "SGD_INTERRUPCION.FASE_AFECTADA = SGD_VALOR.VALOR (+) AND", '')
		fg_replace_text(ls_syntax_mod, "SGD_VALOR.CODIF = 'FASE' AND", '')
		fg_replace_text(ls_syntax_mod, "SGD_VALOR.CODIF (+) = 'FASE' AND", '')
		fg_replace_text(ls_syntax_mod, "SGD_VALOR,", '')

		fg_replace_text(ls_syntax_mod, "sgd_interrupcion.fase_afectada,", 'fgnu_fase_Afectada_bit(GI_HIST_INTERRUPCION.fase_afectada),')
		//*********************************************************************************
		//**  SE REEMPLAZAN PARA QUE TRAIGA EL VALOR DE LA FASE DE LA COLUMNA HISTORICA  **
		//*********************************************************************************

		fg_replace_text(ls_syntax_mod, 'SGD_INTERRUPCION', 'GI_HIST_INTERRUPCION')
		fg_replace_text(ls_syntax_mod, 'SGD_INCIDENCIA', 'GI_HIST_INCIDENCIAS')
		fg_replace_text(ls_syntax_mod, 'GI_AVISOS', 'GI_HIST_AVISOS')
		fg_replace_text(ls_syntax_mod, 'FGCI_NOMBRE_OT', 'FGCI_HIST_NOMBRE_OT')
		
		ls_syntax_new = ls_syntax_mod
	Else
		fg_replace_text(ls_syntax_mod, 'SGD_INTERRUPCION', 'SGD_INTERRUP_X_CION_RS')
		fg_replace_text(ls_syntax_mod, 'SGD_INTERRUP_X_CION_RS', 'SGD_INTERRUPCION_RS')
		fg_replace_text(ls_syntax_mod, "SGD_INTERRUPCION_RS.FASE_AFECTADA,", 'fgnu_fase_Afectada_bit(SGD_INTERRUPCION_RS.fase_afectada),')
		fg_replace_text(ls_syntax_mod, 'GI_AVISOS', 'GI_HIST_AVISOS')
	
		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (29-02-08) Incidencia: 554436. No deben salir las incidencias cuyo estado sea anulado.
		fg_replace_text(ls_syntax_ori, 'SGD_INCIDENCIA.EST_ACTUAL <= 11', 'SGD_INCIDENCIA.EST_ACTUAL < 11')
		fg_replace_text(ls_syntax_mod, 'SGD_INCIDENCIA.EST_ACTUAL <= 11', 'SGD_INCIDENCIA.EST_ACTUAL < 11')
		// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (29-02-08)
	
		ls_syntax_new = ls_syntax_ori + ' UNION ALL ' + ls_syntax_mod
	End If
	
	If etiqueta_activa = "interrupciones" OR etiqueta_activa = "incidencias" THEN
		ls_syntax_new = ls_syntax_new + fw_afec_parcial_relac_cte()
		IF tab_1.incidencias.cbx_historico.checked THEN
			fg_replace_text(ls_syntax_new, 'GI_AFEC_PARCIAL_SUM', 'GI_HIST_AFEC_PARCIAL_SUM')
			fg_replace_text(ls_syntax_new, 'SGD_INTERRUPCION', 'GI_HIST_INTERRUPCION')
		END IF
	END IF

	adw_dw.SetSQLPreview(ls_syntax_new)
	adw_dw.AcceptText()
End If
//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
end subroutine

public subroutine fw_prepara_dw_interr (readonly integer ai_opcion);//*******************************************
//**  OSGI 2002.1  	20/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
String ls_hist = ""


If ib_hist_relac_inst And ( etiqueta_activa = "interrupciones" Or ai_opcion = 1 ) Then
	tab_1.interrupciones.SetReDraw(False)
	tab_1.interrupciones.d_interrupciones.SetReDraw(False)
	tab_1.interrupciones.d_interrupciones.DataObject = "dw_co_nro_instalacion_arg35"
	tab_1.interrupciones.d_interrupciones.SetTransObject(SQLCA)

	If tab_1.interrupciones.cbx_historico4.checked = True Then ls_hist = "_his"
		//*********************************************
		//**  OSGI 2001.2  	24/10/2002					**
		//**  Jair Padilla / Soluziona PANAMA  		**
		//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
		//*********************************************
		//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  	fg_ventana_parametro(This.ClassName() + "_d_interrupciones" + ls_hist, tab_1.interrupciones.d_interrupciones)  //**  INSERTA COLUMNAS ADICIONALES AL DW  **
	
	
		is_modif_dw_interr = fg_ventana_parametro(This.ClassName() + "_d_interrupciones" + ls_hist, tab_1.interrupciones.d_interrupciones)  //**  INSERTA COLUMNAS ADICIONALES AL DW  **
		//*********************************************
		//**  OSGI 2001.2  	24/10/2002					**
		//**  Jair Padilla / Soluziona PANAMA  		**
		//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
		//*********************************************

	tab_1.interrupciones.d_interrupciones.SetReDraw(True)
	tab_1.interrupciones.SetReDraw(True)
End If
//*******************************************
//**  OSGI 2002.1  	20/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
end subroutine

public function string fw_afec_parcial_relac_cte ();string ls_retorno

IF ii_afec_parcial = 1 AND cbx_afec_parcial.checked THEN
	If (tab_1.incidencias.cbx_historico.checked = True And etiqueta_activa = "incidencias") Or &
		(tab_1.interrupciones.cbx_historico4.checked = True And etiqueta_activa = "interrupciones") Then
		
		ls_retorno =  " UNION SELECT DISTINCT GI_HIST_INCIDENCIAS.NRO_INCIDENCIA, " +&
				"GI_HIST_INCIDENCIAS.F_DETECCION,  " +&
				"GI_HIST_INCIDENCIAS.FEC_RESOLUCION,  " +&
				"FGNU_DURACION_SR(NVL(GI_HIST_INCIDENCIAS.DURACION_SR, 0)) C_DURACION, " +&
				"GI_HIST_INCIDENCIAS.POT_AFECTADA,  " +&
				"GI_HIST_INCIDENCIAS.NRO_INST_AFECTADA, " +& 
				"GI_HIST_INCIDENCIAS.POT_CONTRATADA,  " +&
				"GI_HIST_INCIDENCIAS.CCLI_AFEC,  " +&
				"GI_HIST_INCIDENCIAS.OBSERVACION,  " +&
				"GI_HIST_INCIDENCIAS.DIR_AVISO,  " +&
				"GI_HIST_INCIDENCIAS.DESC_INCIDENCIA," +&  
				"Fgnu_Est_Man(estado_mantenimiento) C_EST_MAN,  " +&
				"Fgnu_Ten_Inc(tip_tension) C_TENSION,  " +&
				"Fgnu_Tip_Inc(tip_incidencia) C_TIPO_INC," +&
				"SGD_INST_B.NOM_INSTALACION AS NOMBRE_INSTALACION_B, " +&
				"RPAD(' ', 45, ' ') As c_nom_salmt," +&
				"NVL(GI_HIST_INCIDENCIAS.PAXTC, 0) AS PAXTC,   " +&
				"NVL(GI_HIST_INCIDENCIAS.DURACION, 0) AS DURACION, " +&
				"GI_HIST_INCIDENCIAS.USUARIO," +&
				"GI_HIST_INCIDENCIAS.EST_ACTUAL, " +&
				"FASE_AFECTADA, " +&
				"Fgnu_Est_Inc2(GI_HIST_INCIDENCIAS.EST_ACTUAL, GI_HIST_INCIDENCIAS.ALCANCE, GI_HIST_INCIDENCIAS.TIP_INCIDENCIA) C_EST_INC," +&
				"fgci_hist_nombre_ot(GI_HIST_INCIDENCIAS.OT) C_NOMBRE_BRIGADA,  " +&
				"F_Nombre_Instalacion2(SGD_INST_A.NOM_INSTALACION, GI_HIST_INCIDENCIAS.DIR_AVISO,  GI_HIST_INCIDENCIAS.ALCANCE) C_INST_AFECT_DIR_AVISO," +&
				"fgnu_duracion_str(GI_HIST_INTERRUPCION.F_ALTA,GI_HIST_INTERRUPCION.F_REPOSICION) AS C_DURACION_INT, " +&
				"GI_HIST_INTERRUPCION.KWH_ESTIMADO AS C_EST_FACT, " +&
				"GI_HIST_INTERRUPCION.NRO_INSTALACION AS NRO_INSTALACION," +&
				"GI_HIST_INTERRUPCION.F_ALTA, " +&
				"GI_HIST_INTERRUPCION.F_REPOSICION," +&
				"NVL(GI_HIST_INCIDENCIAS.DURACION, 0) / 60 AS c_duracion_calc," +&
				"NVL(PAXTC, 0) / 60 AS c_paxtc_calc," +&
				"1 AS C_VALIDA_FASE_SQL " +&
			 " FROM GI_HIST_INCIDENCIAS, " +&
				"	SGD_INSTALACION SGD_INST_A, " +&
				"	SGD_INSTALACION SGD_INST_B, " +&
				"	GI_HIST_AFEC_PARCIAL_SUM, " +&
				" GI_HIST_INTERRUPCION " +&
		"	WHERE GI_HIST_INCIDENCIAS.NRO_INST_AFECTADA = SGD_INST_A.NRO_INSTALACION (+) AND " +&
				"	GI_HIST_INCIDENCIAS.EST_ACTUAL <= 11 AND " +&
				"	GI_HIST_INCIDENCIAS.ALCANCE = fgnu_alcance_con_perdida AND  " +&
				"	SGD_INST_A.BDI_JOB = 0 AND " +&
				"	GI_HIST_AFEC_PARCIAL_SUM.NIS_RAD = :arg_nis_rad AND " +&
				" GI_HIST_INTERRUPCION.NRO_INCIDENCIA = GI_HIST_INCIDENCIAS.NRO_INCIDENCIA AND " +&
				" GI_HIST_INTERRUPCION.NRO_INCIDENCIA = GI_HIST_AFEC_PARCIAL_SUM.NRO_INCIDENCIA AND " +&
				" GI_HIST_INTERRUPCION.NRO_INSTALACION = GI_HIST_AFEC_PARCIAL_SUM.NRO_INSTALACION AND " +&
				" GI_HIST_INTERRUPCION.F_ALTA = GI_HIST_AFEC_PARCIAL_SUM.F_ALTA  AND "  +&
				" GI_HIST_INTERRUPCION.F_REPOSICION BETWEEN :fecha_ini AND :fecha_fin AND " +&
				" SGD_INST_B.NRO_INSTALACION = GI_HIST_INTERRUPCION.NRO_INSTALACION AND " +&
				" SGD_INST_B.BDI_JOB = 0 "

	else
		ls_retorno =  " UNION SELECT DISTINCT SGD_INCIDENCIA.NRO_INCIDENCIA, " +&
				"SGD_INCIDENCIA.F_DETECCION,  " +&
				"SGD_INCIDENCIA.FEC_RESOLUCION,  " +&
				"FGNU_DURACION_SR(NVL(SGD_INCIDENCIA.DURACION_SR, 0)) C_DURACION, " +&
				"SGD_INCIDENCIA.POT_AFECTADA,  " +&
				"SGD_INCIDENCIA.NRO_INST_AFECTADA, " +& 
				"SGD_INCIDENCIA.POT_CONTRATADA,  " +&
				"SGD_INCIDENCIA.CCLI_AFEC,  " +&
				"SGD_INCIDENCIA.OBSERVACION,  " +&
				"SGD_INCIDENCIA.DIR_AVISO,  " +&
				"SGD_INCIDENCIA.DESC_INCIDENCIA," +&  
				"Fgnu_Est_Man(estado_mantenimiento) C_EST_MAN,  " +&
				"Fgnu_Ten_Inc(tip_tension) C_TENSION,  " +&
				"Fgnu_Tip_Inc(tip_incidencia) C_TIPO_INC," +&
				"SGD_INST_B.NOM_INSTALACION AS NOMBRE_INSTALACION_B, " +&
				"RPAD(' ', 45, ' ') As c_nom_salmt," +&
				"NVL(SGD_INCIDENCIA.PAXTC, 0) AS PAXTC,   " +&
				"NVL(SGD_INCIDENCIA.DURACION, 0) AS DURACION, " +&
				"SGD_INCIDENCIA.USUARIO," +&
				"SGD_INCIDENCIA.EST_ACTUAL, " +&
				"SGD_VALOR.DESCRIPCION AS FASE_AFECTADA, " +&
				"Fgnu_Est_Inc2(SGD_INCIDENCIA.EST_ACTUAL, SGD_INCIDENCIA.ALCANCE, SGD_INCIDENCIA.TIP_INCIDENCIA) C_EST_INC," +&
				"fgci_nombre_ot(SGD_INCIDENCIA.OT) C_NOMBRE_BRIGADA,  " +&
				"F_Nombre_Instalacion2(SGD_INST_A.NOM_INSTALACION, SGD_INCIDENCIA.DIR_AVISO,  SGD_INCIDENCIA.ALCANCE) C_INST_AFECT_DIR_AVISO," +&
				"fgnu_duracion_str(SGD_INTERRUPCION.F_ALTA,SGD_INTERRUPCION.F_REPOSICION) AS C_DURACION_INT, " +&
				"SGD_INTERRUPCION.KWH_ESTIMADO AS C_EST_FACT, " +&
				"SGD_INTERRUPCION.NRO_INSTALACION AS NRO_INSTALACION," +&
				"SGD_INTERRUPCION.F_ALTA, " +&
				"SGD_INTERRUPCION.F_REPOSICION," +&
				"NVL(SGD_INCIDENCIA.DURACION, 0) / 60 AS c_duracion_calc," +&
				"NVL(PAXTC, 0) / 60 AS c_paxtc_calc," +&
				"1 AS C_VALIDA_FASE_SQL " +&
			 " FROM SGD_INCIDENCIA, " +&
				"	SGD_INSTALACION SGD_INST_A, " +&
				"	SGD_INSTALACION SGD_INST_B, " +&
				"	GI_AFEC_PARCIAL_SUM, " +&
				" SGD_INTERRUPCION, " +&
				" SGD_VALOR " +&
		"	WHERE SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INST_A.NRO_INSTALACION (+) AND " +&
				"	SGD_INCIDENCIA.EST_ACTUAL <= 11 AND " +&
				"	SGD_INCIDENCIA.ALCANCE = fgnu_alcance_con_perdida AND  " +&
				"	SGD_INST_A.BDI_JOB = 0 AND " +&
				"	GI_AFEC_PARCIAL_SUM.NIS_RAD = :arg_nis_rad AND " +&
				" SGD_INTERRUPCION.NRO_INCIDENCIA = SGD_INCIDENCIA.NRO_INCIDENCIA AND " +&
				" SGD_INTERRUPCION.NRO_INCIDENCIA = GI_AFEC_PARCIAL_SUM.NRO_INCIDENCIA AND " +&
				" SGD_INTERRUPCION.NRO_INSTALACION = GI_AFEC_PARCIAL_SUM.NRO_INSTALACION AND " +&
				" SGD_INTERRUPCION.F_ALTA = GI_AFEC_PARCIAL_SUM.F_ALTA  AND "  +&
				" SGD_INTERRUPCION.F_REPOSICION BETWEEN :fecha_ini AND :fecha_fin AND " +&
				" SGD_VALOR.CODIF = 'FASE' AND " +&
				" SGD_INTERRUPCION.FASE_AFECTADA = SGD_VALOR.VALOR AND " +&
				" SGD_INST_B.NRO_INSTALACION = SGD_INTERRUPCION.NRO_INSTALACION AND " +&
				" SGD_INST_B.BDI_JOB = 0 " +&
			   " UNION SELECT DISTINCT SGD_INCIDENCIA.NRO_INCIDENCIA, " +&
				"SGD_INCIDENCIA.F_DETECCION,  " +&
				"SGD_INCIDENCIA.FEC_RESOLUCION,  " +&
				"FGNU_DURACION_SR(NVL(SGD_INCIDENCIA.DURACION_SR, 0)) C_DURACION, " +&
				"SGD_INCIDENCIA.POT_AFECTADA,  " +&
				"SGD_INCIDENCIA.NRO_INST_AFECTADA, " +& 
				"SGD_INCIDENCIA.POT_CONTRATADA,  " +&
				"SGD_INCIDENCIA.CCLI_AFEC,  " +&
				"SGD_INCIDENCIA.OBSERVACION,  " +&
				"SGD_INCIDENCIA.DIR_AVISO,  " +&
				"SGD_INCIDENCIA.DESC_INCIDENCIA," +&  
				"Fgnu_Est_Man(estado_mantenimiento) C_EST_MAN,  " +&
				"Fgnu_Ten_Inc(tip_tension) C_TENSION,  " +&
				"Fgnu_Tip_Inc(tip_incidencia) C_TIPO_INC," +&
				"SGD_INST_B.NOM_INSTALACION AS NOMBRE_INSTALACION_B, " +&
				"RPAD(' ', 45, ' ') As c_nom_salmt," +&
				"NVL(SGD_INCIDENCIA.PAXTC, 0) AS PAXTC,   " +&
				"NVL(SGD_INCIDENCIA.DURACION, 0) AS DURACION, " +&
				"SGD_INCIDENCIA.USUARIO," +&
				"SGD_INCIDENCIA.EST_ACTUAL, " +&
				"SGD_VALOR.DESCRIPCION AS FASE_AFECTADA, " +&
				"Fgnu_Est_Inc2(SGD_INCIDENCIA.EST_ACTUAL, SGD_INCIDENCIA.ALCANCE, SGD_INCIDENCIA.TIP_INCIDENCIA) C_EST_INC," +&
				"fgci_nombre_ot(SGD_INCIDENCIA.OT) C_NOMBRE_BRIGADA,  " +&
				"F_Nombre_Instalacion2(SGD_INST_A.NOM_INSTALACION, SGD_INCIDENCIA.DIR_AVISO,  SGD_INCIDENCIA.ALCANCE) C_INST_AFECT_DIR_AVISO," +&
				"fgnu_duracion_str(SGD_INTERRUPCION_RS.F_ALTA,SGD_INTERRUPCION_RS.F_REPOSICION) AS C_DURACION_INT, " +&
				"SGD_INTERRUPCION_RS.KWH_ESTIMADO AS C_EST_FACT, " +&
				"SGD_INTERRUPCION_RS.NRO_INSTALACION AS NRO_INSTALACION," +&
				"SGD_INTERRUPCION_RS.F_ALTA, " +&
				"SGD_INTERRUPCION_RS.F_REPOSICION," +&
				"NVL(SGD_INCIDENCIA.DURACION, 0) / 60 AS c_duracion_calc," +&
				"NVL(PAXTC, 0) / 60 AS c_paxtc_calc," +&
				"1 AS C_VALIDA_FASE_SQL " +&
			 " FROM SGD_INCIDENCIA, " +&
				"	SGD_INSTALACION SGD_INST_A, " +&
				"	SGD_INSTALACION SGD_INST_B, " +&
				"	GI_AFEC_PARCIAL_SUM, " +&
				" SGD_INTERRUPCION_RS, " +&
				" SGD_VALOR " +&
		"	WHERE SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INST_A.NRO_INSTALACION (+) AND " +&
				"	SGD_INCIDENCIA.EST_ACTUAL <= 11 AND " +&
				"	SGD_INCIDENCIA.ALCANCE = fgnu_alcance_con_perdida AND  " +&
				"	SGD_INST_A.BDI_JOB = 0 AND " +&
				"	GI_AFEC_PARCIAL_SUM.NIS_RAD = :arg_nis_rad AND " +&
				" SGD_INTERRUPCION_RS.NRO_INCIDENCIA = SGD_INCIDENCIA.NRO_INCIDENCIA AND " +&
				" SGD_INTERRUPCION_RS.NRO_INCIDENCIA = GI_AFEC_PARCIAL_SUM.NRO_INCIDENCIA AND " +&
				" SGD_INTERRUPCION_RS.NRO_INSTALACION = GI_AFEC_PARCIAL_SUM.NRO_INSTALACION AND " +&
				" SGD_INTERRUPCION_RS.F_ALTA = GI_AFEC_PARCIAL_SUM.F_ALTA  AND "  +&
				" SGD_INTERRUPCION_RS.F_REPOSICION BETWEEN :fecha_ini AND :fecha_fin AND " +&
				" SGD_VALOR.CODIF = 'FASE' AND " +&
				" SGD_INTERRUPCION_RS.FASE_AFECTADA = SGD_VALOR.VALOR AND " +&
				" SGD_INST_B.NRO_INSTALACION = SGD_INTERRUPCION_RS.NRO_INSTALACION AND " +&
				" SGD_INST_B.BDI_JOB = 0 "
		
	END IF
	
	return ls_retorno
	
ELSE
	return ""
END IF
end function

public function integer fw_exportar_excel (datawindow pd_datawindow);long ll_numcols, ll_c
int li_ret
string ls_nombre_archivo, rfilename
boolean lb_existe
datastore lds_exp
OLEobject xlapp, xlsub
any ls_array[], ls_array_2[]

string ls_aux
ll_numcols= long(pd_datawindow.Object.Datawindow.Column.Count)

// Crea el oleobject en la variable xlapp
lds_exp= Create datastore
lds_exp.dataobject= pd_datawindow.dataobject
pd_datawindow.RowsCopy(1, pd_datawindow.RowCount(), Primary!, lds_exp, 1, Primary!)

for ll_c=1 to ll_numcols
	if pd_datawindow.describe("#" + string(ll_c) + ".visible")= '0' Then
		lds_exp.modify("destroy column " + pd_datawindow.describe("#" + string(ll_c) + ".Name"))
	else
		
	end if
next

IF GetFileSaveName( "", ls_nombre_archivo, rfilename ,"XLS","Excel (*.XLS),*.XLS" ) = 1 THEN
	// Se comprueba si existe el fichero
	lb_existe = FileExists(ls_nombre_archivo)
	
	IF lb_existe THEN 
		//Se confirmar que quiere grabar el fichero que ya existe
		IF gnv_msg.F_MENSAJE("CP04",ls_nombre_archivo,"",YesNo!) <> 1 THEN //$$HEX1$$bf00$$ENDHEX$$Sobreescribir el fichero ya existente?
			return -1
		END IF
	END IF
	IF lds_exp.SaveAs (ls_nombre_archivo, Excel!, false)	= -1 THEN
		gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
	END IF
END IF
return 1
end function

public subroutine reorganizartab ();//Cambio el text de los label
tab_1.suministro.d_direccion.modify("provincia_t.Text = 'Departamento                                   |Municipio'")
tab_1.suministro.d_direccion.modify("municipio_t.Text = 'Localidad                                          |Zona'")

//Modifico las posiciones del datawindows de informacion del cliente
//apellidos
tab_1.suministro.d_cliente.modify("apellidos_t.border = 2")
tab_1.suministro.d_cliente.modify("apellidos_t.text = 'Apellidos:'")
tab_1.suministro.d_cliente.modify("apellidos_t.x = 5")
tab_1.suministro.d_cliente.modify("apellidos_t.y = 20")
tab_1.suministro.d_cliente.modify("apellidos_t.width = 402")
tab_1.suministro.d_cliente.modify("apellidos_t.height = 76")

tab_1.suministro.d_cliente.modify("ap1.x = 416")
tab_1.suministro.d_cliente.modify("ap1.y = 20")
tab_1.suministro.d_cliente.modify("ap1.width = 1001")
tab_1.suministro.d_cliente.modify("ap1.height = 76")

tab_1.suministro.d_cliente.modify("ap2.x = 416")
tab_1.suministro.d_cliente.modify("ap2.y = 138")
tab_1.suministro.d_cliente.modify("ap2.width = 1001")
tab_1.suministro.d_cliente.modify("ap2.height = 76")

//nombre
tab_1.suministro.d_cliente.modify("nom_cli_t.border = 2")
tab_1.suministro.d_cliente.modify("nom_cli_t.text = 'Nombre:'")
tab_1.suministro.d_cliente.modify("nom_cli_t.x = 5")
tab_1.suministro.d_cliente.modify("nom_cli_t.y = 272")
tab_1.suministro.d_cliente.modify("nom_cli_t.width = 402")
tab_1.suministro.d_cliente.modify("nom_cli_t.height = 76")

tab_1.suministro.d_cliente.modify("nombre.x = 416")
tab_1.suministro.d_cliente.modify("nombre.y = 272")
tab_1.suministro.d_cliente.modify("nombre.width = 1001")
tab_1.suministro.d_cliente.modify("nombre.height = 76")

//Documento
tab_1.suministro.d_cliente.modify("doc_id_t.border = 2")
tab_1.suministro.d_cliente.modify("doc_id_t.text = 'Documento:'")
tab_1.suministro.d_cliente.modify("doc_id_t.x = 1533")
tab_1.suministro.d_cliente.modify("doc_id_t.y = 20")
tab_1.suministro.d_cliente.modify("doc_id_t.width = 402")
tab_1.suministro.d_cliente.modify("doc_id_t.height = 76")

tab_1.suministro.d_cliente.modify("doc_id.x = 1942")
tab_1.suministro.d_cliente.modify("doc_id.y = 20")
tab_1.suministro.d_cliente.modify("doc_id.width = 1001")
tab_1.suministro.d_cliente.modify("doc_id.height = 76")

//Tip Doc.
tab_1.suministro.d_cliente.modify("t_2.border = 2")
tab_1.suministro.d_cliente.modify("t_2.text = 'Tipo Doc.'")
tab_1.suministro.d_cliente.modify("t_2.x = 1533")
tab_1.suministro.d_cliente.modify("t_2.y = 138")
tab_1.suministro.d_cliente.modify("t_2.width = 402")
tab_1.suministro.d_cliente.modify("t_2.height = 76")

tab_1.suministro.d_cliente.modify("tip_doc.border = 2")
tab_1.suministro.d_cliente.modify("tip_doc.x = 1945")
tab_1.suministro.d_cliente.modify("tip_doc.y = 138")
tab_1.suministro.d_cliente.modify("tip_doc.width = 1001")
tab_1.suministro.d_cliente.modify("tip_doc.height = 76")

//Pais
tab_1.suministro.d_cliente.modify("t_1.text = 'Pa$$HEX1$$ed00$$ENDHEX$$s:'")
tab_1.suministro.d_cliente.modify("t_1.x = 1530")
tab_1.suministro.d_cliente.modify("t_1.y = 272")
tab_1.suministro.d_cliente.modify("t_1.width = 402")
tab_1.suministro.d_cliente.modify("t_1.height = 76")

tab_1.suministro.d_cliente.modify("co_pais.x = 1944")
tab_1.suministro.d_cliente.modify("co_pais.y = 272")
tab_1.suministro.d_cliente.modify("co_pais.width = 1001")
tab_1.suministro.d_cliente.modify("co_pais.height = 76")

tab_1.suministro.d_cliente.height = 420
tab_1.suministro.gb_1.height = 530


end subroutine

public subroutine llenartablas (long ll_filas, integer li_fila);//AHM (24/02/2011) ASUR 953409
li_fila = ids_filtros.find("etiqueta_activa = '" + etiqueta_activa + "'", 1, ids_filtros.rowCount())
IF ll_filas > 0 THEN
	IF li_fila = 0  THEN
		li_fila = ids_filtros.insertRow(0)
	END IF
	
	ids_filtros.SetItem(li_fila, "etiqueta_activa", etiqueta_activa)
	ids_filtros.setitem(li_fila, "fecha_desde", dw_filtro_fecha.getItemDateTime(1, "f_desde"))
	ids_filtros.setitem(li_fila, "fecha_hasta", dw_filtro_fecha.getItemDateTime(1, "f_hasta"))
	IF tab_1.incidenciasin.cbx_historico2.checked THEN
		ids_filtros.setItem(li_fila, "datos_historicos", 1)
	ELSE
		ids_filtros.setItem(li_fila, "datos_historicos", 0)
	END IF
	IF cbx_afec_parcial.checked THEN
		ids_filtros.setItem(li_fila, "afec_parcial", 1)
	ELSE
		ids_filtros.setItem(li_fila, "afec_parcial", 0)
	END IF
ELSE
	ids_filtros.deleteRow(li_fila)
END IF

end subroutine

public subroutine cambiarfechas (integer newindex);IF newindex = 1 THEN 
	etiqueta_activa="suministro"
//	tab_1.suministro.gb_1.show()
//	tab_1.suministro.gb_2.show()	
//	tab_1.suministro.	gb_3.show()
//	tab_1.suministro.d_nis_rad.show()
//	tab_1.suministro.d_direccion.show()
//	tab_1.suministro.d_cliente.Show()
//	
//	tab_1.avisos.d_lista_aviso.Hide()
//	tab_1.interrupciones.d_interrupciones.Hide()
	dw_filtro_fecha.Hide()
	
	//tab_1.suministro.st_dir.Show() ---------------------------------------------------------
	//tab_1.suministro.st_nis2.Show() ---------------------------------------------------------
	//tab_1.suministro.st_ape2.Show() ---------------------------------------------------------
	//tab_1.suministro.st_doc2.Show() ---------------------------------------------------------

//	tab_1.incidencias.dw_listado_incidencias.Hide()
	st_1.Hide()
	st_2.Hide()
	cbx_afec_parcial.visible = FALSE
	tab_1.suministro.d_nis_rad.setfocus()
	//cb_undo.setFocus()
ELSEIF newindex = 2 THEN
	
		etiqueta_activa="incidencias"
//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//		
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.interrupciones.d_interrupciones.Hide()
//		tab_1.interrupciones.d_interrupciones.Enabled = FALSE
//		tab_1.avisos.d_lista_aviso.Hide()		
//		tab_1.avisos.d_lista_Aviso.enabled = false
//
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//	
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()
	cbx_afec_parcial.visible = (ii_afec_parcial = 1)
	
	if idt_f_alta_contrato<= idt_f_historico then 
		tab_1.incidencias.cbx_historico.enabled = true
	else
		tab_1.incidencias.cbx_historico.enabled = false
	end if
		tab_1.incidencias.dw_listado_incidencias.Show()
		tab_1.incidencias.dw_listado_incidencias.enabled = true
		tab_1.incidencias.dw_listado_incidencias.SelectRow(0,FALSE)
		tab_1.incidencias.dw_listado_incidencias.SelectRow(1,TRUE)
	
		st_1.Hide()
		st_2.Hide()
		cb_buscar.enabled=true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.incidencias.cbx_historico.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if
		
		
		
		
ELSEIF newindex = 3 THEN
	
		etiqueta_activa="incidenciassin"
//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//		
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.interrupciones.d_interrupciones.Hide()
//		tab_1.interrupciones.d_interrupciones.Enabled = FALSE
//		tab_1.avisos.d_lista_aviso.Hide()		
//		tab_1.avisos.d_lista_Aviso.enabled = false
//
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//	
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()
		if idt_f_alta_contrato<= idt_f_historico then 
			tab_1.incidenciasin.cbx_historico2.enabled = true
		else
			tab_1.incidenciasin.cbx_historico2.enabled = false
		end if


		tab_1.incidenciasin.dw_listado_incidencias_sin.Show()
		tab_1.incidenciasin.dw_listado_incidencias_sin.enabled = true
		tab_1.incidenciasin.dw_listado_incidencias_sin.SelectRow(0,FALSE)
		tab_1.incidenciasin.dw_listado_incidencias_sin.SelectRow(1,TRUE)
	
		st_1.Hide()
		st_2.Hide()
		cb_buscar.enabled=true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.incidenciasin.cbx_historico2.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if	
		cbx_afec_parcial.visible = FALSE
			
			
			
	ELSEIF newindex =4 THEN
		
		etiqueta_activa="avisos"

//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.interrupciones.d_interrupciones.Hide()	
//		tab_1.incidencias.dw_listado_incidencias.Hide()
		
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//		
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()

		tab_1.avisos.d_lista_aviso.Show()		
		tab_1.avisos.d_lista_aviso.Enabled=True
		tab_1.avisos.d_lista_aviso.SelectRow(0,FALSE)
		tab_1.avisos.d_lista_aviso.SelectRow(1,TRUE)
		if idt_f_alta_contrato<= idt_f_historico then 
			tab_1.avisos.cbx_historico3.enabled = true
		else
			tab_1.avisos.cbx_historico3.enabled = false
		end if

		st_1.Hide()
		st_2.Hide()
		
		cbx_afec_parcial.visible = FALSE

		cb_buscar.enabled=true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.avisos.cbx_historico3.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if
	ELSEIF newindex = 5 THEN
		
		etiqueta_activa="interrupciones"
		
	
//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.avisos.d_lista_aviso.Hide()	
//		tab_1.avisos.d_lista_Aviso.Enabled = FALSE
//		tab_1.incidencias.dw_listado_incidencias.Hide()
//		tab_1.incidencias.dw_listado_incidencias.Enabled = FALSE
			
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
////
//		
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()
		cb_buscar.enabled=true

		if idt_f_alta_contrato<= idt_f_historico then 
			tab_1.interrupciones.cbx_historico4.enabled = true
		else
			tab_1.interrupciones.cbx_historico4.enabled = false
		end if
		tab_1.interrupciones.d_interrupciones.show()
		tab_1.interrupciones.d_interrupciones.Enabled = TRUE
		tab_1.interrupciones.d_interrupciones.SelectRow(0,FALSE)
		tab_1.interrupciones.d_interrupciones.SelectRow(1,TRUE)
		

		st_1.Hide()
		st_2.Hide()
		cbx_afec_parcial.visible = (ii_afec_parcial = 1)
		cb_buscar.enabled= true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.interrupciones.cbx_historico4.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if
END IF

IF newindex <> 1 THEN  // ACTUALIZAMOS LA FECHA DESDE CON LA FECHA DE ALTA DEL CONTRATO
//	if isnull(dw_filtro_fecha.getitemdatetime(1,"f_desde")) then 
//			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
//			dw_filtro_fecha.accepttext()
//		end if
		dw_filtro_fecha.accepttext()
		dw_filtro_fecha.Show()
	end if
//parent.setredraw(true)	


end subroutine

public subroutine busquedarapida ();long ll_filas
string ls_blanco
datetime ldt_desde, ldt_hasta
string ls_f_desde,ls_f_hasta
int li_afec_parcial = 0

//AHM (24/02/2011) ASUR 953409
int		li_fila					//Fila del datastore en la que se almacenan los filtros

iu_comunic = create u_generico_comunicaciones
iu_comunic.is_comunic = gu_comunic.is_comunic

//IF dw_filtro_fecha.fnu_validar_fechas() = 0 THEN
//	Return 0
//END IF

IF ii_afec_parcial = 1 AND cbx_afec_parcial.Checked THEN
	li_afec_parcial = 1
END IF

cambiarfechas(2)

ls_f_desde=dw_filtro_fecha.fnu_fecha1_numerica()
ls_f_hasta=dw_filtro_fecha.fnu_fecha2_numerica()


ldt_desde = dw_filtro_fecha.getitemdatetime(1,"f_desde")
ldt_hasta = dw_filtro_fecha.getitemdatetime(1,"f_hasta")

if ldt_desde < datetime(date("1000/01/01")) OR ldt_desde > datetime(date("3000/12/31")) OR & 
   ldt_hasta < datetime(date("1000/01/01")) OR ldt_hasta > datetime(date("3000/12/31")) then
	gnv_msg.f_mensaje("IS06"," "," ",OK!)
//	messagebox("Error","Fecha erronea")
	return
end if

//*******************************************
//**  OSGI 2001.2  	08/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
//**  HISTORICO RELACION DE INSTALACIONES  	Parent.triggerevent("ue_armar_sql")
//**  HISTORICO RELACION DE INSTALACIONES  	
//**  HISTORICO RELACION DE INSTALACIONES  IF etiqueta_activa = "incidencias" THEN

String ls_mens
Integer li_red_trif = 0, li_tabla_decision = 0

ldt_desde = DateTime(Date(ldt_desde), Time('00:00'))
ldt_hasta = DateTime(Date(ldt_hasta), Time('23:59:59'))

If Not ib_hist_relac_inst or (ib_hist_relac_inst and  etiqueta_activa <> "incidencias" and  etiqueta_activa <> "interrupciones")  Then
	this.triggerevent("ue_armar_sql")
End If

If ( etiqueta_activa = "incidencias" Or etiqueta_activa = "interrupciones" ) And ib_hist_relac_inst Then
	If gb_red_trifasica Then li_red_trif = 1
	If gb_tabla_decision Then li_tabla_decision = 1

	If etiqueta_activa = "incidencias" Then
		tab_1.incidencias.dw_listado_incidencias.SetRedraw(False)
		tab_1.incidencias.dw_listado_incidencias.SetTransObject(SQLCA)
		
		ll_filas = tab_1.incidencias.dw_listado_incidencias.Retrieve(tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"), ldt_desde, ldt_hasta, (fgci_tipo_acometida + 1), li_red_trif, li_tabla_decision, li_afec_parcial)
		
		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (29-02-08) Incidencia: 0/554436. Filtro que lleva la dw original y que pierde 
		// al asignar la dw dinamicamente.
		tab_1.incidencias.dw_listado_incidencias.setfilter("c_valida_fase_sql = 1")
		tab_1.incidencias.dw_listado_incidencias.filter()
		// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (29-02-08)


		If Not gb_red_trifasica Then
			fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.incidencias.dw_listado_incidencias, tab_1.incidencias.cbx_historico.checked)
		End If

		tab_1.incidencias.dw_listado_incidencias.SetRedraw(True)
		ll_filas = tab_1.incidencias.dw_listado_incidencias.RowCount()  // si no trajo nada
		
		ls_mens = "IS01"

		If ll_filas > 0  Then fw_retrieve_end(tab_1.incidencias.dw_listado_incidencias)
	Else
		fw_prepara_dw_interr(2)

		ll_filas = tab_1.interrupciones.d_interrupciones.Retrieve(tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"), ldt_desde, ldt_hasta, (fgci_tipo_acometida + 1), li_red_trif, li_tabla_decision, li_afec_parcial)


		If Not gb_red_trifasica Then
			fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.interrupciones.d_interrupciones, tab_1.interrupciones.cbx_historico4.checked)
		End If

		tab_1.interrupciones.d_interrupciones.SetReDraw(True)
		ll_filas = tab_1.interrupciones.d_interrupciones.RowCount()  // si no trajo nada

		ls_mens = "IS03"
		
		If ll_filas > 0  Then fw_retrieve_end(tab_1.interrupciones.d_interrupciones)
	End If

	If ll_filas = 0 Then  // si no trajo nada
		gnv_msg.f_mensaje(ls_mens," "," ",OK!)
	End If

	ii_fila_ant = 1
	
ElseIf etiqueta_activa = "incidencias" THEN
//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************

//	iu_avi_2004_nu.fnu_o_incid(dw_listado_incidencias,is_direccion.gl_nis,d_interrupciones, is_select_original)
	tab_1.incidencias.dw_listado_incidencias.SetRedraw(False)
	ll_filas=tab_1.incidencias.dw_listado_incidencias.Retrieve(ls_f_desde,ls_f_hasta,tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"), li_afec_parcial)
	
	IF NOT gb_red_trifasica THEN
		fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.incidencias.dw_listado_incidencias, tab_1.incidencias.cbx_historico.checked)
	END IF
	
	tab_1.incidencias.dw_listado_incidencias.SetRedraw(True)
	
	IF tab_1.incidencias.dw_listado_incidencias.RowCount() = 0 THEN  // si no trajo nada
		gnv_msg.f_mensaje("IS01"," "," ",OK!)
	END IF
	ii_fila_ant = 1
	is_modificacion = "DataWindow.table.Select=~"" +is_incidencias_sin_interrupcion + "~""
	retorno = tab_1.incidencias.dw_listado_incidencias.modify(is_modificacion)
	
ELSEIF etiqueta_activa = "incidenciassin" THEN
	tab_1.incidenciasin.dw_listado_incidencias_sin.SetRedraw(False)
//	iu_avi_2004_nu.fnu_o_incid(dw_listado_incidencias,is_direccion.gl_nis,d_interrupciones, is_select_original)

	ll_filas=tab_1.incidenciasin.dw_listado_incidencias_sin.Retrieve(ls_f_desde,ls_f_hasta,tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"))

	IF tab_1.incidenciasin.dw_listado_incidencias_sin.RowCount() = 0 THEN  // si no trajo nada
		gnv_msg.f_mensaje("IS01"," "," ",OK!)
	END IF
	
	tab_1.incidenciasin.dw_listado_incidencias_sin.SetRedraw(True)
	ii_fila_ant = 1	
	
ELSEIF etiqueta_activa= "avisos" THEN
	
	ll_filas=tab_1.avisos.d_lista_aviso.Retrieve()
	
	IF tab_1.avisos.d_lista_aviso.RowCount() = 0 THEN  // si no trajo nada 
		gnv_msg.f_mensaje("IS02"," "," ",OK!)
	END IF
	ii_fila_ant = 1

//	//****************EFECTUO EL RETRIVE A LA BASE DE DATOS*******************
//	// Obtengo la clausula select original de la datawindow.
//
//	d_lista_aviso.settransobject(sqlca) // me conecto a la base para modificar
	
	
	
	
	
	
	ELSEIF etiqueta_activa = "interrupciones" THEN 

		int li_indice,li_max_filas

		tab_1.interrupciones.d_interrupciones.SetRedraw(false)
		
		ll_filas=tab_1.interrupciones.d_interrupciones.Retrieve(tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"),ls_f_desde,ls_f_hasta, li_afec_parcial)
		IF NOT gb_red_trifasica THEN
			fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.interrupciones.d_interrupciones, tab_1.interrupciones.cbx_historico4.checked)
		END IF
		
		tab_1.interrupciones.d_interrupciones.SetRedraw(true)	
		
		IF tab_1.interrupciones.d_interrupciones.RowCount() = 0 THEN  // si no trajo nada
			gnv_msg.f_mensaje("IS03"," "," ",OK!)
		END IF
		ii_fila_ant = 1
		is_modificacion = "DataWindow.table.Select=~"" +is_select_interrupciones + "~""
   	 tab_1.interrupciones.d_interrupciones.modify(is_modificacion)
		
END IF

//AHM (24/02/2011) ASUR 953409
li_fila = ids_filtros.find("etiqueta_activa = '" + etiqueta_activa + "'", 1, ids_filtros.rowCount())
IF ll_filas > 0 THEN
	IF li_fila = 0  THEN
		li_fila = ids_filtros.insertRow(0)
	END IF
	
	ids_filtros.SetItem(li_fila, "etiqueta_activa", etiqueta_activa)
	ids_filtros.setitem(li_fila, "fecha_desde", dw_filtro_fecha.getItemDateTime(1, "f_desde"))
	ids_filtros.setitem(li_fila, "fecha_hasta", dw_filtro_fecha.getItemDateTime(1, "f_hasta"))
	IF tab_1.incidenciasin.cbx_historico2.checked THEN
		ids_filtros.setItem(li_fila, "datos_historicos", 1)
	ELSE
		ids_filtros.setItem(li_fila, "datos_historicos", 0)
	END IF
	IF cbx_afec_parcial.checked THEN
		ids_filtros.setItem(li_fila, "afec_parcial", 1)
	ELSE
		ids_filtros.setItem(li_fila, "afec_parcial", 0)
	END IF
ELSE
	ids_filtros.deleteRow(li_fila)
END IF
end subroutine

event open;call super::open;string  is_modify_ext

//fg_colocar_ventana_main(w_1211_identificar_suministro)
w_1211_identificar_suministro.SETREDRAW(FALSE)
// Cargo el objeto de comunicaciones para tener acceso 
// a la estructura
// iu_gen_comunic  --> para cargar la estructura local 

iu_gen_comunic = CREATE u_generico_comunicaciones
iu_gen_comunic.is_comunic = gu_comunic.is_comunic

//parmstr9 = 'w_1211_indentificar_suministro'

//deshabilito etiquetas y muestro el filtro de fechas
tab_1.incidencias.Enabled=False
tab_1.incidenciasin.Enabled=False
tab_1.avisos.Enabled=False
tab_1.interrupciones.Enabled=False

//Carga fechas por defecto
dw_filtro_fecha.InsertRow(0)
dw_filtro_fecha.f_inicializar_actual()

IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
	ii_afec_parcial = 1
END IF

IF (gu_comunic.is_comunic.programa_llamante = "detalleNis") THEN
	
	iu_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen
	//Mover los controles ----------------------------------------------------------------------- FASE 5
	
	// Obtener los atributos para abrir la ventana
	is_prov = iu_gen_comunic.is_comunic.strval1
	is_depto = iu_gen_comunic.is_comunic.strval2
	is_munic = iu_gen_comunic.is_comunic.strval3
	is_local = iu_gen_comunic.is_comunic.strval4

	// Habilito/deshabilito los campos de los user-object que utilizo
	tab_1.suministro.d_nis_rad.fpr_habilitar_campos(True)
	tab_1.suministro.d_direccion.fpr_habilitar_campos(False,False)
	tab_1.suministro.d_cliente.fpr_habilitar_campos(False,False)
	
	// Inserto un registro en los user-object de trabajo
	tab_1.suministro.d_nis_rad.f_insertar_fila()
	tab_1.suministro.d_direccion.f_insertar_fila()
	tab_1.suministro.d_cliente.f_insertar_fila()

	// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
	tab_1.suministro.d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

	// Escondo las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
	tab_1.suministro.st_nis2.Visible = False
	tab_1.suministro.st_dir.Visible = False
	tab_1.suministro.st_ape2.Visible = False
	tab_1.suministro.st_doc2.Visible = False
	
	reorganizartab()
	
END IF
	
	
IF (iu_gen_comunic.is_comunic.programa_llamante = "w_operaciones") OR & 
	(iu_gen_comunic.is_comunic.programa_llamante = "m_recepcion_de_avisos_m_agregar") THEN

	SetPointer(HourGlass!)

	// Creo los objetos con los que trabajar$$HEX2$$e1002000$$ENDHEX$$esta ventana, y no pertenecen 
	// a la misma (no fueron creados en el painter).
	
	iu_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen
	
	// Conecto las D.D.D.W

	tab_1.suministro.d_cliente.fpr_conectar(tab_1.suministro.d_cliente)

	// Obtener los atributos para abrir la ventana

	is_prov = iu_gen_comunic.is_comunic.strval1
	is_depto = iu_gen_comunic.is_comunic.strval2
	is_munic = iu_gen_comunic.is_comunic.strval3
	is_local = iu_gen_comunic.is_comunic.strval4



	// Habilito/deshabilito los campos de los user-object que utilizo
	tab_1.suministro.d_nis_rad.fpr_habilitar_campos(True)
	tab_1.suministro.d_direccion.fpr_habilitar_campos(False,True)
	tab_1.suministro.d_cliente.fpr_habilitar_campos(True,True)
	
	// Inserto un registro en los user-object de trabajo
	tab_1.suministro.d_nis_rad.f_insertar_fila()
	tab_1.suministro.d_direccion.f_insertar_fila()
	tab_1.suministro.d_cliente.f_insertar_fila()

	// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
		tab_1.suministro.d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

	// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
	tab_1.suministro.st_nis2.Show()
	tab_1.suministro.st_dir.Show()
	tab_1.suministro.st_ape2.Show()
	tab_1.suministro.st_doc2.Show()
	

//	// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
//	md_inf_avisos_inc.f_habilitar("m_avisos2",false)
//	md_inf_avisos_inc.f_habilitar("m_incidencias3",false)
//	md_inf_avisos_inc.f_habilitar("m_interrupciones", FALSE)
//	md_inf_avisos_inc.m_consultas.m_avisos2.enabled = false
//
//	md_inf_avisos_inc.m_consultas.m_avisos2.toolbaritemvisible = false
//	md_inf_avisos_inc.m_consultas.m_incidencias3.enabled = false
//	md_inf_avisos_inc.m_consultas.m_incidencias3.toolbaritemvisible = false
//	md_inf_avisos_inc.m_consultas.m_interrupciones.Enabled = FALSE
//	md_inf_avisos_inc.m_consultas.m_interrupciones.toolbaritemvisible = FALSE
//
END IF

tab_1.avisos.d_lista_aviso.settransobject(sqlca)
tab_1.incidencias.dw_listado_incidencias.enabled = true
tab_1.avisos.d_lista_aviso.visible = false
tab_1.avisos.d_lista_aviso.enabled = false
is_select_original = tab_1.avisos.d_lista_aviso.describe("datawindow.table.select")

// Setea el atributo para salir de la ventana de Identificaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica
iu_gen_comunic.is_comunic.intval10 = 1

// Obtengo la clausula select original de la datawindow.
tab_1.incidencias.dw_listado_incidencias.SetTransobject(sqlca) // me conecto a la base para modificar
tab_1.incidenciasin.dw_listado_incidencias_sin.SetTransobject(sqlca) // me conecto a la base para modificar
is_select_original = tab_1.incidencias.dw_listado_incidencias.Describe("datawindow.table.select")
is_select_original_2 = tab_1.avisos.d_lista_aviso.Describe("datawindow.table.select")
is_avisos_select 		= tab_1.avisos.d_lista_aviso.GetSqlSelect() // DSA 08/05/2000	
	
tab_1.interrupciones.d_interrupciones.SetTransObject(SQLCA)
tab_1.interrupciones.d_interrupciones.Visible = FALSE
tab_1.interrupciones.d_interrupciones.Enabled = FALSE


	tab_1.suministro.d_nis_rad.show()
	//tab_1.suministro.st_nis2.show()
	tab_1.suministro.d_direccion.show()
	tab_1.suministro.st_dir.show()
	tab_1.suministro.d_cliente.Show()

	tab_1.avisos.d_lista_aviso.Hide()
	tab_1.interrupciones.d_interrupciones.Hide()
	dw_filtro_fecha.Hide()
	tab_1.incidencias.dw_listado_incidencias.Hide()
	tab_1.incidenciasin.dw_listado_incidencias_sin.Hide()
	st_1.Hide()
	st_2.Hide()

	tab_1.suministro.st_ape2.Hide()
	tab_1.suministro.st_dir.Hide()
	
	tab_1.suministro.st_doc2.Hide()
//	tab_1.suministro.st_nis.Hide()
	//tab_1.suministro.st_nis2.Hide()
	cb_buscar.enabled=false
	//cb_undo.enabled=false
//	dw_filtro_fecha.f_inicializar_actual()



//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//***************************************
//**  OSGI 2001.1  	04/04/2001  w_1211_identificar_suministro.SETREDRAW(TRUE)
//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//***************************************


// OBTENEMOS EL NUMERO DE MESES DE PERMANENCIA DE LOS REGISTROS ANTES DE PASARLOS AL HISTORICO

select add_months(sysdate,- nvl(codigo,0)) into :idt_f_historico from sgd_valor where codif='BATC' and valor = 'HIS';

tab_1.incidencias.cbx_historico.text = " Datos historicos < "+ string(idt_f_historico,'mm/yyyy')
tab_1.incidenciasin.cbx_historico2.text = " Datos historicos < "+ string(idt_f_historico,'mm/yyyy')
tab_1.avisos.cbx_historico3.text = " Datos historicos < "+ string(idt_f_historico,'mm/yyyy')
tab_1.interrupciones.cbx_historico4.text = " Datos historicos < "+ string(idt_f_historico,'mm/yyyy')


//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//fg_ventana_parametro(This.ClassName(), tab_1.suministro.d_direccion)
w_1211_identificar_suministro.SETREDRAW(TRUE)
//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_param_nic = fg_verifica_parametro('NIC')

If ib_param_nic Then	tab_1.suministro.st_nis2.Text = 'NIC:'
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
ib_hist_relac_inst = fg_verifica_parametro('HIST_RELAC_INST')



If ib_hist_relac_inst Then
	tab_1.incidencias.dw_listado_incidencias.DataObject = "dw_co_nro_instalacion_arg35"
	tab_1.incidencias.dw_listado_incidencias.SetTransObject(SQLCA)

	fw_prepara_dw_interr(1)
End If

//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************

//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************


If fg_verifica_parametro('GEO') Then
	is_modify_ext = "nom_depto_t.text = '" + fg_geografica("2", 	tab_1.avisos.d_lista_aviso.Describe("nom_depto_t.Text")) + "' "
	tab_1.avisos.d_lista_aviso.Modify(is_modify_ext)
	is_modify_ext = "nom_munic_t.text = '" + fg_geografica("3", tab_1.avisos.d_lista_aviso.Describe("nom_munic_t.Text")) + "' "
	tab_1.avisos.d_lista_aviso.Modify(is_modify_ext)

End If
//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************


//AHM (24/02/2011) ASUR 953409
ids_filtros = CREATE datastore
ids_filtros.DataObject = "d_filtros_cliente_suministros"
ids_filtros.SetTransObject(SQLCA)


end event

event close;call super::close;// Destruyo los objetos creados en la ventana

DESTROY iu_avi_2004_pr
DESTROY iu_gen_comunic  
//DESTROY gu_comunic
gu_comunic.is_comunic.longval3 = 0
gu_comunic.is_comunic.longval5 = 1
gu_comunic.is_comunic.accion_llamada = ""
gu_comunic.is_comunic.programa_llamante = ""

//AHM (24/02/2011) ASUR 953409
IF isValid(ids_filtros) THEN DESTROY ids_filtros


end event

on w_1211_identificar_suministro.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_undo=create cb_undo
this.cb_buscar=create cb_buscar
this.st_1=create st_1
this.st_2=create st_2
this.sle_esq_cond=create sle_esq_cond
this.sle_telefono=create sle_telefono
this.r_3=create r_3
this.dw_filtro_fecha=create dw_filtro_fecha
this.dw_1=create dw_1
this.tab_1=create tab_1
this.cbx_afec_parcial=create cbx_afec_parcial
this.cb_exportar=create cb_exportar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_undo
this.Control[iCurrent+3]=this.cb_buscar
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.sle_esq_cond
this.Control[iCurrent+7]=this.sle_telefono
this.Control[iCurrent+8]=this.r_3
this.Control[iCurrent+9]=this.dw_filtro_fecha
this.Control[iCurrent+10]=this.dw_1
this.Control[iCurrent+11]=this.tab_1
this.Control[iCurrent+12]=this.cbx_afec_parcial
this.Control[iCurrent+13]=this.cb_exportar
end on

on w_1211_identificar_suministro.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_undo)
destroy(this.cb_buscar)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_esq_cond)
destroy(this.sle_telefono)
destroy(this.r_3)
destroy(this.dw_filtro_fecha)
destroy(this.dw_1)
destroy(this.tab_1)
destroy(this.cbx_afec_parcial)
destroy(this.cb_exportar)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1211_identificar_suministro
end type

type cb_cancelar from commandbutton within w_1211_identificar_suministro
integer x = 1303
integer y = 1888
integer width = 375
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;Close(w_1211_identificar_suministro)
end event

type cb_undo from commandbutton within w_1211_identificar_suministro
event clicked pbm_bnclicked
boolean visible = false
integer x = 1335
integer y = 1884
integer width = 375
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Rehacer"
end type

event clicked;date d_desde
parent.triggerevent("ue_nuevo")
parent.setredraw(false)
//tab_1.interrupciones.d_interrupciones.Visible = FALSE
//tab_1.interrupciones.d_interrupciones.Enabled = FALSE
setnull(d_desde)

//	tab_1.suministro.d_nis_rad.show()
//	tab_1.suministro.d_direccion.show()
//	tab_1.suministro.d_cliente.Show()
	dw_filtro_fecha.setitem(1,"f_desde",d_desde)
	dw_filtro_fecha.setitem(1,"f_hasta",today())
//	tab_1.avisos.d_lista_aviso.Hide()
//	tab_1.interrupciones.d_interrupciones.Hide()
	dw_filtro_fecha.Hide()
//	tab_1.incidencias.dw_listado_incidencias.Hide()
	st_1.Hide()
	st_2.Hide()
//	tab_1.suministro.st_ape2.Hide()
//	tab_1.suministro.st_doc2.Hide()
//	tab_1.suministro.st_nis.Hide()
	cb_buscar.enabled=false
	//cb_undo.enabled=false
	
	

tab_1.SelectTab(tab_1.suministro)
tab_1.suministro.d_nis_rad.SetFocus()

cb_buscar.enabled=false
//cb_undo.enabled=false
tab_1.Incidencias.Enabled=false
tab_1.Incidenciasin.Enabled=false
tab_1.avisos.Enabled= false
tab_1.interrupciones.Enabled=false
ib_trajo_datos=false
//tab_1.suministro.st_nis2.show()
//tab_1.suministro.st_ape2.show()
//tab_1.suministro.st_doc2.show()
//tab_1.suministro.st_dir.show()


// Escondo las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
	tab_1.suministro.st_nis2.Visible = False
	tab_1.suministro.st_dir.Visible = False
	tab_1.suministro.st_ape2.Visible = False
	tab_1.suministro.st_doc2.Visible = False

tab_1.suministro.d_nis_rad.SETFOCUS()
parent.setredraw(true)
end event

type cb_buscar from commandbutton within w_1211_identificar_suministro
event clicked pbm_bnclicked
integer x = 1842
integer y = 1884
integer width = 375
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Buscar"
end type

event clicked;
long ll_filas
string ls_blanco
datetime ldt_desde, ldt_hasta
string ls_f_desde,ls_f_hasta
int li_afec_parcial = 0

//AHM (24/02/2011) ASUR 953409
int		li_fila					//Fila del datastore en la que se almacenan los filtros

iu_comunic = create u_generico_comunicaciones
iu_comunic.is_comunic = gu_comunic.is_comunic

IF dw_filtro_fecha.fnu_validar_fechas() = 0 THEN
	ldt_desde = dw_filtro_fecha.getitemdatetime(1,"f_desde")
	ldt_hasta = dw_filtro_fecha.getitemdatetime(1,"f_hasta")
	if(ldt_desde > ldt_hasta) then
	messagebox("Error","Fecha Desde no puede ser mayor a la Fecha Hasta")
	end if
	Return 
END IF

IF ii_afec_parcial = 1 AND cbx_afec_parcial.Checked THEN
	li_afec_parcial = 1
END IF


ls_f_desde=dw_filtro_fecha.fnu_fecha1_numerica()
ls_f_hasta=dw_filtro_fecha.fnu_fecha2_numerica()


ldt_desde = dw_filtro_fecha.getitemdatetime(1,"f_desde")
ldt_hasta = dw_filtro_fecha.getitemdatetime(1,"f_hasta")

if ldt_desde < datetime(date("1000/01/01")) OR ldt_desde > datetime(date("3000/12/31")) OR & 
   ldt_hasta < datetime(date("1000/01/01")) OR ldt_hasta > datetime(date("3000/12/31")) then
	gnv_msg.f_mensaje("IS06"," "," ",OK!)
//	messagebox("Error","Fecha erronea")
	return
end if

//*******************************************
//**  OSGI 2001.2  	08/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
//**  HISTORICO RELACION DE INSTALACIONES  	Parent.triggerevent("ue_armar_sql")
//**  HISTORICO RELACION DE INSTALACIONES  	
//**  HISTORICO RELACION DE INSTALACIONES  IF etiqueta_activa = "incidencias" THEN

String ls_mens
Integer li_red_trif = 0, li_tabla_decision = 0



ldt_desde = DateTime(Date(ldt_desde), Time('00:00'))
ldt_hasta = DateTime(Date(ldt_hasta), Time('23:59:59'))


If Not ib_hist_relac_inst or (ib_hist_relac_inst and  etiqueta_activa <> "incidencias" and  etiqueta_activa <> "interrupciones")  Then
	Parent.triggerevent("ue_armar_sql")
End If


If ( etiqueta_activa = "incidencias" Or etiqueta_activa = "interrupciones" ) And ib_hist_relac_inst Then
	If gb_red_trifasica Then li_red_trif = 1
	If gb_tabla_decision Then li_tabla_decision = 1

	If etiqueta_activa = "incidencias" Then
		tab_1.incidencias.dw_listado_incidencias.SetRedraw(False)
		tab_1.incidencias.dw_listado_incidencias.SetTransObject(SQLCA)
		
		ll_filas = tab_1.incidencias.dw_listado_incidencias.Retrieve(tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"), ldt_desde, ldt_hasta, (fgci_tipo_acometida + 1), li_red_trif, li_tabla_decision, li_afec_parcial)
		
		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (29-02-08) Incidencia: 0/554436. Filtro que lleva la dw original y que pierde 
		// al asignar la dw dinamicamente.
		tab_1.incidencias.dw_listado_incidencias.setfilter("c_valida_fase_sql = 1")
		tab_1.incidencias.dw_listado_incidencias.filter()
		// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (29-02-08)


		If Not gb_red_trifasica Then
			fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.incidencias.dw_listado_incidencias, tab_1.incidencias.cbx_historico.checked)
		End If

		tab_1.incidencias.dw_listado_incidencias.SetRedraw(True)
		ll_filas = tab_1.incidencias.dw_listado_incidencias.RowCount()  // si no trajo nada
		
		ls_mens = "IS01"

		If ll_filas > 0  Then fw_retrieve_end(tab_1.incidencias.dw_listado_incidencias)
	Else
		fw_prepara_dw_interr(2)

		ll_filas = tab_1.interrupciones.d_interrupciones.Retrieve(tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"), ldt_desde, ldt_hasta, (fgci_tipo_acometida + 1), li_red_trif, li_tabla_decision, li_afec_parcial)


		If Not gb_red_trifasica Then
			fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.interrupciones.d_interrupciones, tab_1.interrupciones.cbx_historico4.checked)
		End If

		tab_1.interrupciones.d_interrupciones.SetReDraw(True)
		ll_filas = tab_1.interrupciones.d_interrupciones.RowCount()  // si no trajo nada

		ls_mens = "IS03"
		
		If ll_filas > 0  Then fw_retrieve_end(tab_1.interrupciones.d_interrupciones)
	End If

	If ll_filas = 0 Then  // si no trajo nada
		gnv_msg.f_mensaje(ls_mens," "," ",OK!)
	End If

	ii_fila_ant = 1
	
ElseIf etiqueta_activa = "incidencias" THEN
//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************

//	iu_avi_2004_nu.fnu_o_incid(dw_listado_incidencias,is_direccion.gl_nis,d_interrupciones, is_select_original)
	tab_1.incidencias.dw_listado_incidencias.SetRedraw(False)
	ll_filas=tab_1.incidencias.dw_listado_incidencias.Retrieve(ls_f_desde,ls_f_hasta,tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"), li_afec_parcial)
	
	IF NOT gb_red_trifasica THEN
		fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.incidencias.dw_listado_incidencias, tab_1.incidencias.cbx_historico.checked)
	END IF
	
	tab_1.incidencias.dw_listado_incidencias.SetRedraw(True)
	
	IF tab_1.incidencias.dw_listado_incidencias.RowCount() = 0 THEN  // si no trajo nada
		gnv_msg.f_mensaje("IS01"," "," ",OK!)
	END IF
	ii_fila_ant = 1
	is_modificacion = "DataWindow.table.Select=~"" +is_incidencias_sin_interrupcion + "~""
	retorno = tab_1.incidencias.dw_listado_incidencias.modify(is_modificacion)
	
ELSEIF etiqueta_activa = "incidenciassin" THEN
	tab_1.incidenciasin.dw_listado_incidencias_sin.SetRedraw(False)
//	iu_avi_2004_nu.fnu_o_incid(dw_listado_incidencias,is_direccion.gl_nis,d_interrupciones, is_select_original)

	ll_filas=tab_1.incidenciasin.dw_listado_incidencias_sin.Retrieve(ls_f_desde,ls_f_hasta,tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"))

	IF tab_1.incidenciasin.dw_listado_incidencias_sin.RowCount() = 0 THEN  // si no trajo nada
		gnv_msg.f_mensaje("IS01"," "," ",OK!)
	END IF
	
	tab_1.incidenciasin.dw_listado_incidencias_sin.SetRedraw(True)
	ii_fila_ant = 1	
	
ELSEIF etiqueta_activa= "avisos" THEN
	
	ll_filas=tab_1.avisos.d_lista_aviso.Retrieve()
	
	IF tab_1.avisos.d_lista_aviso.RowCount() = 0 THEN  // si no trajo nada 
		gnv_msg.f_mensaje("IS02"," "," ",OK!)
	END IF
	ii_fila_ant = 1

//	//****************EFECTUO EL RETRIVE A LA BASE DE DATOS*******************
//	// Obtengo la clausula select original de la datawindow.
//
//	d_lista_aviso.settransobject(sqlca) // me conecto a la base para modificar
	
	
	
	
	
	
	ELSEIF etiqueta_activa = "interrupciones" THEN 

		int li_indice,li_max_filas

		tab_1.interrupciones.d_interrupciones.SetRedraw(false)
		
		ll_filas=tab_1.interrupciones.d_interrupciones.Retrieve(tab_1.suministro.d_nis_rad.getitemnumber(1,"nis_rad"),ls_f_desde,ls_f_hasta, li_afec_parcial)
		IF NOT gb_red_trifasica THEN
			fw_filtrar_datos(ls_f_desde,ls_f_hasta, tab_1.interrupciones.d_interrupciones, tab_1.interrupciones.cbx_historico4.checked)
		END IF
		
		tab_1.interrupciones.d_interrupciones.SetRedraw(true)	
		
		IF tab_1.interrupciones.d_interrupciones.RowCount() = 0 THEN  // si no trajo nada
			gnv_msg.f_mensaje("IS03"," "," ",OK!)
		END IF
		ii_fila_ant = 1
		is_modificacion = "DataWindow.table.Select=~"" +is_select_interrupciones + "~""
   	 tab_1.interrupciones.d_interrupciones.modify(is_modificacion)
		
END IF


//AHM (24/02/2011) ASUR 953409
li_fila = ids_filtros.find("etiqueta_activa = '" + etiqueta_activa + "'", 1, ids_filtros.rowCount())
IF ll_filas > 0 THEN
	IF li_fila = 0  THEN
		li_fila = ids_filtros.insertRow(0)
	END IF
	
	ids_filtros.SetItem(li_fila, "etiqueta_activa", etiqueta_activa)
	ids_filtros.setitem(li_fila, "fecha_desde", dw_filtro_fecha.getItemDateTime(1, "f_desde"))
	ids_filtros.setitem(li_fila, "fecha_hasta", dw_filtro_fecha.getItemDateTime(1, "f_hasta"))
	IF tab_1.incidenciasin.cbx_historico2.checked THEN
		ids_filtros.setItem(li_fila, "datos_historicos", 1)
	ELSE
		ids_filtros.setItem(li_fila, "datos_historicos", 0)
	END IF
	IF cbx_afec_parcial.checked THEN
		ids_filtros.setItem(li_fila, "afec_parcial", 1)
	ELSE
		ids_filtros.setItem(li_fila, "afec_parcial", 0)
	END IF
ELSE
	ids_filtros.deleteRow(li_fila)
END IF

end event

type st_1 from statictext within w_1211_identificar_suministro
boolean visible = false
integer x = 233
integer y = 620
integer width = 677
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Esquina / Condominio"
boolean focusrectangle = false
end type

type st_2 from statictext within w_1211_identificar_suministro
boolean visible = false
integer x = 581
integer y = 1344
integer width = 288
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Tel No.:"
boolean focusrectangle = false
end type

type sle_esq_cond from singlelineedit within w_1211_identificar_suministro
boolean visible = false
integer x = 535
integer y = 964
integer width = 1481
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_telefono from singlelineedit within w_1211_identificar_suministro
boolean visible = false
integer x = 869
integer y = 1336
integer width = 416
integer height = 84
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type r_3 from rectangle within w_1211_identificar_suministro
long linecolor = 16777215
integer linethickness = 4
long fillcolor = 12632256
integer x = 1481
integer y = 228
integer width = 165
integer height = 144
end type

type dw_filtro_fecha from ue_gen_filtro_fechas within w_1211_identificar_suministro
integer x = 247
integer y = 308
integer width = 992
integer height = 168
integer taborder = 20
end type

event itemchanged;call super::itemchanged;//date ldt_fecha_introducida ,	 ldt_fecha_alta
//string ls_fecha
//if dwo.name = "f_desde" then 
//	 ls_fecha = string(date(data),'dd/mm/yyyy')
//	 this.accepttext()
//	 ldt_fecha_introducida = date(this.getitemdatetime(row,"f_desde"))
//	 ldt_fecha_alta = date(string(idt_f_alta_contrato,'dd/mm/yyyy'))
//	if ldt_fecha_introducida <	 ldt_fecha_alta  then 
//		this.setitem(row,"f_desde",ldt_fecha_alta)
//		return 1
//	end if
//
//end if
end event

event itemerror;call super::itemerror;//if dwo.name = "f_desde" then 
//		messagebox("Aviso","La fecha introducida no es correcta o es inferior a la de alta del contrato del suministro")
//		return 1
//end if
//
end event

type dw_1 from datawindow within w_1211_identificar_suministro
boolean visible = false
integer x = 549
integer y = 800
integer width = 549
integer height = 448
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_suministro_imp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_1211_identificar_suministro
integer x = 59
integer y = 128
integer width = 5943
integer height = 2756
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean boldselectedtext = true
integer selectedtab = 1
suministro suministro
incidencias incidencias
incidenciasin incidenciasin
avisos avisos
interrupciones interrupciones
end type

on tab_1.create
this.suministro=create suministro
this.incidencias=create incidencias
this.incidenciasin=create incidenciasin
this.avisos=create avisos
this.interrupciones=create interrupciones
this.Control[]={this.suministro,&
this.incidencias,&
this.incidenciasin,&
this.avisos,&
this.interrupciones}
end on

on tab_1.destroy
destroy(this.suministro)
destroy(this.incidencias)
destroy(this.incidenciasin)
destroy(this.avisos)
destroy(this.interrupciones)
end on

event selectionchanging;if newindex=1 then
cb_buscar.enabled=false
cb_exportar.enabled=false
else
	cb_buscar.enabled=true
	cb_exportar.enabled=true
end if
end event

event selectionchanged;
IF newindex = 1 THEN 
	etiqueta_activa="suministro"
//	tab_1.suministro.gb_1.show()
//	tab_1.suministro.gb_2.show()	
//	tab_1.suministro.	gb_3.show()
//	tab_1.suministro.d_nis_rad.show()
//	tab_1.suministro.d_direccion.show()
//	tab_1.suministro.d_cliente.Show()
//	
//	tab_1.avisos.d_lista_aviso.Hide()
//	tab_1.interrupciones.d_interrupciones.Hide()
	dw_filtro_fecha.Hide()
	
	//tab_1.suministro.st_dir.Show()
	//tab_1.suministro.st_nis2.Show()
	//tab_1.suministro.st_ape2.Show()
	//tab_1.suministro.st_doc2.Show()

	//tab_1.incidencias.dw_listado_incidencias.Hide()
	st_1.Hide()
	st_2.Hide()
	cbx_afec_parcial.visible = FALSE
	tab_1.suministro.d_nis_rad.setfocus()
	//parent.cb_undo.setFocus()
ELSEIF newindex = 2 THEN
	
		etiqueta_activa="incidencias"
//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//		
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.interrupciones.d_interrupciones.Hide()
//		tab_1.interrupciones.d_interrupciones.Enabled = FALSE
//		tab_1.avisos.d_lista_aviso.Hide()		
//		tab_1.avisos.d_lista_Aviso.enabled = false
//
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//	
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()
	cbx_afec_parcial.visible = (ii_afec_parcial = 1)
	
	if idt_f_alta_contrato<= idt_f_historico then 
		tab_1.incidencias.cbx_historico.enabled = true
	else
		tab_1.incidencias.cbx_historico.enabled = false
	end if
		tab_1.incidencias.dw_listado_incidencias.Show()
		tab_1.incidencias.dw_listado_incidencias.enabled = true
		tab_1.incidencias.dw_listado_incidencias.SelectRow(0,FALSE)
		tab_1.incidencias.dw_listado_incidencias.SelectRow(1,TRUE)
	
		st_1.Hide()
		st_2.Hide()
		cb_buscar.enabled=true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.incidencias.cbx_historico.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if
		
		
		
		
ELSEIF newindex = 3 THEN
	
		etiqueta_activa="incidenciassin"
//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//		
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.interrupciones.d_interrupciones.Hide()
//		tab_1.interrupciones.d_interrupciones.Enabled = FALSE
//		tab_1.avisos.d_lista_aviso.Hide()		
//		tab_1.avisos.d_lista_Aviso.enabled = false
//
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//	
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()
		if idt_f_alta_contrato<= idt_f_historico then 
			tab_1.incidenciasin.cbx_historico2.enabled = true
		else
			tab_1.incidenciasin.cbx_historico2.enabled = false
		end if


		tab_1.incidenciasin.dw_listado_incidencias_sin.Show()
		tab_1.incidenciasin.dw_listado_incidencias_sin.enabled = true
		tab_1.incidenciasin.dw_listado_incidencias_sin.SelectRow(0,FALSE)
		tab_1.incidenciasin.dw_listado_incidencias_sin.SelectRow(1,TRUE)
	
		st_1.Hide()
		st_2.Hide()
		cb_buscar.enabled=true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.incidenciasin.cbx_historico2.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if	
		cbx_afec_parcial.visible = FALSE
			
			
			
	ELSEIF newindex =4 THEN
		
		etiqueta_activa="avisos"

//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.interrupciones.d_interrupciones.Hide()	
//		tab_1.incidencias.dw_listado_incidencias.Hide()
		
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
//
//		
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()

		tab_1.avisos.d_lista_aviso.Show()		
		tab_1.avisos.d_lista_aviso.Enabled=True
		tab_1.avisos.d_lista_aviso.SelectRow(0,FALSE)
		tab_1.avisos.d_lista_aviso.SelectRow(1,TRUE)
		if idt_f_alta_contrato<= idt_f_historico then 
			tab_1.avisos.cbx_historico3.enabled = true
		else
			tab_1.avisos.cbx_historico3.enabled = false
		end if

		st_1.Hide()
		st_2.Hide()
		
		cbx_afec_parcial.visible = FALSE

		cb_buscar.enabled=true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.avisos.cbx_historico3.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if
	ELSEIF newindex = 5 THEN
		
		etiqueta_activa="interrupciones"
		
	
//		tab_1.suministro.d_nis_rad.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.d_direccion.Hide()
//		tab_1.suministro.st_dir.Hide()
//		tab_1.suministro.d_cliente.Hide()
//		tab_1.avisos.d_lista_aviso.Hide()	
//		tab_1.avisos.d_lista_Aviso.Enabled = FALSE
//		tab_1.incidencias.dw_listado_incidencias.Hide()
//		tab_1.incidencias.dw_listado_incidencias.Enabled = FALSE
			
//		tab_1.suministro.st_ape2.Hide()
//		tab_1.suministro.st_dir.Hide()
////
//		
//		tab_1.suministro.st_doc2.Hide()
////		tab_1.suministro.st_nis.Hide()
//		tab_1.suministro.st_nis2.Hide()
//		tab_1.suministro.gb_1.Hide()
//		tab_1.suministro.gb_2.Hide()
//		cb_buscar.enabled=true

		if idt_f_alta_contrato<= idt_f_historico then 
			tab_1.interrupciones.cbx_historico4.enabled = true
		else
			tab_1.interrupciones.cbx_historico4.enabled = false
		end if
		tab_1.interrupciones.d_interrupciones.show()
		tab_1.interrupciones.d_interrupciones.Enabled = TRUE
		tab_1.interrupciones.d_interrupciones.SelectRow(0,FALSE)
		tab_1.interrupciones.d_interrupciones.SelectRow(1,TRUE)
		

		st_1.Hide()
		st_2.Hide()
		cbx_afec_parcial.visible = (ii_afec_parcial = 1)
		cb_buscar.enabled= true
		cb_buscar.default=true
		//cb_undo.enabled=true
		if tab_1.interrupciones.cbx_historico4.checked then // TRAEMOS DATOS HISTORICO
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
			dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
		else  //TRAEMOS DATOS ACTUALES
			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
			dw_filtro_fecha.setitem(1,"f_hasta",today())
		end if
END IF

IF newindex <> 1 THEN  // ACTUALIZAMOS LA FECHA DESDE CON LA FECHA DE ALTA DEL CONTRATO
//	if isnull(dw_filtro_fecha.getitemdatetime(1,"f_desde")) then 
//			dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
//			dw_filtro_fecha.accepttext()
//		end if
		dw_filtro_fecha.accepttext()
		dw_filtro_fecha.Show()
	end if
parent.setredraw(true)	



end event

type suministro from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5906
integer height = 2628
long backcolor = 81324524
string text = "Suministros"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
string picturename = "Picture!"
long picturemaskcolor = 553648127
cb_5 cb_5
d_direccion d_direccion
gb_2 gb_2
st_ape2 st_ape2
st_doc2 st_doc2
st_dir st_dir
gb_1 gb_1
cb_1 cb_1
st_nic st_nic
st_nis2 st_nis2
d_nis_rad d_nis_rad
gb_3 gb_3
d_cliente d_cliente
end type

on suministro.create
this.cb_5=create cb_5
this.d_direccion=create d_direccion
this.gb_2=create gb_2
this.st_ape2=create st_ape2
this.st_doc2=create st_doc2
this.st_dir=create st_dir
this.gb_1=create gb_1
this.cb_1=create cb_1
this.st_nic=create st_nic
this.st_nis2=create st_nis2
this.d_nis_rad=create d_nis_rad
this.gb_3=create gb_3
this.d_cliente=create d_cliente
this.Control[]={this.cb_5,&
this.d_direccion,&
this.gb_2,&
this.st_ape2,&
this.st_doc2,&
this.st_dir,&
this.gb_1,&
this.cb_1,&
this.st_nic,&
this.st_nis2,&
this.d_nis_rad,&
this.gb_3,&
this.d_cliente}
end on

on suministro.destroy
destroy(this.cb_5)
destroy(this.d_direccion)
destroy(this.gb_2)
destroy(this.st_ape2)
destroy(this.st_doc2)
destroy(this.st_dir)
destroy(this.gb_1)
destroy(this.cb_1)
destroy(this.st_nic)
destroy(this.st_nis2)
destroy(this.d_nis_rad)
destroy(this.gb_3)
destroy(this.d_cliente)
end on

type cb_5 from commandbutton within suministro
integer x = 672
integer y = 1648
integer width = 375
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Rehacer"
boolean cancel = true
end type

event clicked;
if(banderaRehacer = true) then
	date f_desde
	setnull(f_desde)

	ib_trajo_datos = false

	//nisrad dtw
	tab_1.suministro.d_nis_rad.reset()
	tab_1.suministro.d_nis_rad.dataobject = 'd_nis_2001_pr_nis_rad'
	tab_1.suministro.d_nis_rad.SetTransObject(SQLCA)
	tab_1.suministro.d_nis_rad.insertrow(0)
	tab_1.suministro.d_nis_rad.enabled = true
	tab_1.suministro.d_nis_rad.modify("nis_rad.background.color=" + gs_blanco)
	tab_1.suministro.d_nis_rad.SetTabOrder("nis_rad",10)

	//direcciones dtw
	tab_1.suministro.d_direccion.reset()
	tab_1.suministro.d_direccion.dataobject = 'd_direccion'
	tab_1.suministro.d_direccion.SetTransObject(SQLCA)
	tab_1.suministro.d_direccion.insertrow(0)
	tab_1.suministro.d_direccion.fpr_habilitar_campos(False,False)

	//nisrad dtw
	tab_1.suministro.d_cliente.fpr_limpiar_campos()
	tab_1.suministro.d_cliente.accepttext()

	dw_filtro_fecha.setitem(1,"f_desde",f_desde)
	dw_filtro_fecha.setitem(1,"f_hasta",today())
	
	//incidencias con interrup dtw
	tab_1.incidencias.dw_listado_incidencias.reset()
	tab_1.incidencias.dw_listado_incidencias.dataobject = 'd_inc_2002_pr_lista_incidencia'
	tab_1.incidencias.dw_listado_incidencias.SetTransObject(SQLCA)
	
	//incidencias sin interrup dtw
	tab_1.incidenciasin.dw_listado_incidencias_sin.reset()
	tab_1.incidenciasin.dw_listado_incidencias_sin.dataobject = 'd_inc_2002_pr_lista_incidencia_sin'
	tab_1.incidenciasin.dw_listado_incidencias_sin.SetTransObject(SQLCA)
	
	//avisos dtw
	tab_1.avisos.d_lista_aviso.reset()
	tab_1.avisos.d_lista_aviso.dataobject = 'd_avi_2019_pr_lista_avisos_consulta'
	tab_1.avisos.d_lista_aviso.SetTransObject(SQLCA)
	
	//interrupciones dtw
	tab_1.interrupciones.d_interrupciones.reset()
	tab_1.interrupciones.d_interrupciones.dataobject = 'd_avi_1211_interrup'
	tab_1.interrupciones.d_interrupciones.SetTransObject(SQLCA)
	
	//bloqueo de tabs
	
	tab_1.Incidencias.Enabled=false
	tab_1.Incidenciasin.Enabled=false
	tab_1.avisos.Enabled= false
	tab_1.interrupciones.Enabled=false
	banderaRehacer = false
//	tab_1.suministro.object.cb_5.background.color= Gray
//	this.modify("cb_5.background.color= Gray")
	//+ string(rgb(192,192,192))
	
	tab_1.suministro.d_nis_rad.SetFocus()
end if





end event

type d_direccion from u_dir_2001_pr_direccion_std within suministro
event ue_enter pbm_dwnkey
integer x = 302
integer y = 452
integer width = 2898
integer height = 484
integer taborder = 11
boolean border = false
end type

event ue_enter;call super::ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) THEN  	tab_1.suministro.st_dir.TriggerEvent("doubleclicked")
end event

type gb_2 from groupbox within suministro
integer x = 251
integer y = 384
integer width = 3621
integer height = 588
integer taborder = 11
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 81324524
end type

type st_ape2 from statictext within suministro
boolean visible = false
integer x = 265
integer y = 1068
integer width = 325
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Apellidos:"
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)

// Lo inhabilito
This.Enabled = False
ib_trajo_datos = false
ib_trajo_datos2 = false
ib_trajo_datos3 = false
ib_trajo_datos4 = false

// Cargo datos ingresados en las var. globales corresp.

d_cliente.AcceptText()
parmstr1 = d_cliente.GetItemString(1,"ap1")
parmstr2 = d_cliente.GetItemString(1,"ap2")
parmstr3 = d_cliente.GetItemString(1,"nombre")


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_visible_enabled_nic(True)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


if tab_1.suministro.d_nis_rad.fpr_cargarDatosCliente(parmstr3,parmstr1,parmstr2) then

	// Abro ventana para identificar el suministro

	Open(w_re0500_ss)

	// Si no encontr$$HEX2$$f3002000$$ENDHEX$$el suministro

	IF parnum1 = 0 THEN
		dir.gl_nis = 0
	END IF

	// Cierro la ventana, pasando como par$$HEX1$$e100$$ENDHEX$$m. la estructura con los datos 

	//CloseWithReturn(Parent, dir)

	is_direccion = dir
	
else
	// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n de cliente

	Open(w_at0113)
	
	// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n	de cliente

	is_direccion = Message.PowerObjectParm
end if

// Lo habilito
This.Enabled = True

SetPointer(HourGlass!)

// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
IF (Len(string(is_direccion.gl_nis)) = 7) THEN
	w_1211_identificar_suministro.TriggerEvent("ue_proc_sum")
	if d_cliente.rowCount() > 0 then
		tab_1.suministro.st_nis2.Enabled=false
		tab_1.suministro.st_doc2.Enabled=false
		tab_1.suministro.st_ape2.Enabled=false
		tab_1.suministro.st_dir.Enabled=false		

		tab_1.Incidenciasin.Enabled=True
		tab_1.Incidencias.Enabled=True
		tab_1.avisos.Enabled= True
		tab_1.interrupciones.Enabled=True
		//cb_undo.enabled=true
		cb_buscar.enabled=false
		ib_trajo_datos3=true
		
		
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		fw_nis()
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	end if

ELSE
	//	Cargar estructura de comunicaciones con mensaje de error.

	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF



//// Seteo el mouse con formato de reloj de arena
//SetPointer(HourGlass!)
//
//// Lo inhabilito
//This.Enabled = False
//
//// Cargo datos ingresados en las var. globales corresp.
//d_cliente.AcceptText()
//parmstr1 = d_cliente.GetItemString(1,"ap1")
//parmstr2 = d_cliente.GetItemString(1,"ap2")
//parmstr3 = d_cliente.GetItemString(1,"nombre")
//
//// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
//Open(w_at0113)
////gu_comunic.fnu_abrir(w_at0113,"w_at0113",1,1,w_1211_identificar_suministro,"w_1211_identificar_suministro")	
//
//// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n
//// de cliente
//is_direccion = Message.PowerObjectParm
//
//// Lo habilito
//This.Enabled = True
//
//SetPointer(HourGlass!)
//
//// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
//IF (Len(string(is_direccion.gl_nis)) = 7) THEN
//	
//	Parent.TriggerEvent("ue_proc_sum")
//	
//ELSE
//	
//	//	Cargar estructura de comunicaciones con mensaje de error.
//	
//END IF


end event

type st_doc2 from statictext within suministro
boolean visible = false
integer x = 1399
integer y = 1068
integer width = 357
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Documento:"
boolean focusrectangle = false
end type

event doubleclicked;int li_v_doc
string ls_doc

SetPointer(HourGlass!)

// Valido el Documento
d_cliente.AcceptText()
ib_trajo_datos = false
ib_trajo_datos2 = false
ib_trajo_datos3 = false
ib_trajo_datos4 = false

is_direccion.gs_doc = d_cliente.fpr_v_documento(d_cliente) 
is_direccion.gs_tipo_doc = d_cliente.getItemString(1,"tip_doc")
is_direccion.gs_pais = d_cliente.getItemString(1,"co_pais")


if is_direccion.gs_doc = " " or isNull(is_direccion.gs_tipo_doc) or is_direccion.gs_tipo_doc = "" or isNull(is_direccion.gs_pais ) or is_direccion.gs_pais = "" then
	gnv_msg.f_mensaje("ER41","","",OK!)

	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

	return
end if

IF is_direccion.gs_doc <> " " THEN
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(True)	
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


	// Abro ventana con lista de clientes con dicho documento
	OpenWithParm(w_1109_list_clientes_por_doc,is_direccion)
	IF parnum1 = 1 THEN
	
		is_direccion.gl_cod_cli = Message.DoubleParm

		// Cargo en la estructura el resto de los datos necesarios
		li_v_doc = d_cliente.fpr_c_estruc_dir_por_doc(is_direccion) 
		IF li_v_doc = 1 THEN
	
			//	Procedimiento Almacenado Datos_suministro ???
	
			w_1211_identificar_suministro.TriggerEvent("ue_proc_sum")					
			if d_cliente.rowCount() > 0 then
			tab_1.suministro.st_nis2.Enabled=false
			tab_1.suministro.st_doc2.Enabled=false
			tab_1.suministro.st_ape2.Enabled=false
			tab_1.suministro.st_dir.Enabled=false		

				tab_1.Incidenciasin.Enabled=True
				tab_1.Incidencias.Enabled=True
				tab_1.avisos.Enabled= True
				tab_1.interrupciones.Enabled=True
				//cb_undo.enabled=true
				cb_buscar.enabled=false
				ib_trajo_datos4=true


				//***************************************
				//**  OSGI 2001.1  	15/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				fw_nis()
				//***************************************
				//**  OSGI 2001.1  	15/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
			end if

		ELSEIF li_v_doc = 0 THEN
			gnv_msg.f_mensaje("AR04","","",OK!)

			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			fw_visible_enabled_nic(False)
		ELSE
			fw_visible_enabled_nic(False)
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		END IF

	END IF

ELSEIF is_direccion.gl_nis = long("-1") THEN
	gnv_msg.f_mensaje("ER51","","",OK!)

	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(False)
ELSE
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF
end event

type st_dir from statictext within suministro
boolean visible = false
integer x = 302
integer y = 748
integer width = 329
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)

// Limpio la estructura
//SetNull(is_direccion)


SetNull(is_direccion.gs_prov)
SetNull(is_direccion.gs_depto)
SetNull(is_direccion.gs_munic)
SetNull(is_direccion.gs_local)
SetNull(is_direccion.gs_calle)
SetNull(is_direccion.gl_numero)
SetNull(is_direccion.gs_duplic)
SetNull(is_direccion.gs_pisodpto)
SetNull(is_direccion.gl_codcalle)
SetNull(is_direccion.gl_codloc)
SetNull(is_direccion.gl_codmun)
SetNull(is_direccion.gl_codprov)
SetNull(is_direccion.gl_coddepto)
SetNull(is_direccion.gl_nis)
SetNull(is_direccion.gl_nif)
SetNull(is_direccion.gs_esq_cond)
SetNull(is_direccion.gs_ape1)
SetNull(is_direccion.gs_ape2)
SetNull(is_direccion.gs_nom)
SetNull(is_direccion.gs_doc)
SetNull(is_direccion.gs_tipo_doc)
SetNull(is_direccion.gs_pais)
SetNull(is_direccion.gs_telefono)
SetNull(is_direccion.gs_co_pais)
SetNull(is_direccion.gl_cod_cli)
SetNull(is_direccion.gs_ref)


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_visible_enabled_nic(True)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


ib_trajo_datos = false
ib_trajo_datos2 = false
ib_trajo_datos3 = false
ib_trajo_datos4 = false

//

// Acepto los datos ingresados
d_direccion.AcceptText() 

// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n ingresada, carg$$HEX1$$e100$$ENDHEX$$ndola en la est. de comunic.
d_direccion.fpr_c_datos(iu_gen_comunic,sle_esq_cond)

// Cargo en la est. el valor que corresponde para llamar a la ventana
// de ident. geogr$$HEX1$$e100$$ENDHEX$$fica.
iu_gen_comunic.is_comunic.strval10 = "Nis"

// Seteo la var. que le indica a la Id. Geo. si busco por 
// 'Calle' o 'Referencia'.
IF  ib_calle THEN
	iu_gen_comunic.is_comunic.strval9 = "Calle"
ELSE
	iu_gen_comunic.is_comunic.strval9 = "Referencia"
END IF

parmstr6=""
parmstr7=""
parmstr8=""


gu_comunic.is_comunic.intval1 = iu_gen_comunic.is_comunic.intval1 
gu_comunic.is_comunic.intval2 = iu_gen_comunic.is_comunic.intval2  // Cod. Depto.
gu_comunic.is_comunic.longval4 = iu_gen_comunic.is_comunic.longval4		// Cod. Munic.
gu_comunic.is_comunic.longval5 = iu_gen_comunic.is_comunic.longval5	// Cod. Loc.

parnum2 = iu_gen_comunic.is_comunic.intval1
parnum3 = iu_gen_comunic.is_comunic.intval2
parnum4 = iu_gen_comunic.is_comunic.longval4
parnum5 = iu_gen_comunic.is_comunic.longval5

// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica
OpenWithParm(w_id0100,iu_gen_comunic)


//OpenWithParm(w_id0100,iu_gen_comunic,w_1211_identificar_suministro)

// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n
// geogr$$HEX1$$e100$$ENDHEX$$fica (estructura "s_direcci$$HEX1$$f300$$ENDHEX$$n")
is_direccion = Message.PowerObjectParm 
iu_gen_comunic.is_comunic.intval1 = is_direccion.gl_codprov
iu_gen_comunic.is_comunic.intval2 = is_direccion.gl_coddepto
iu_gen_comunic.is_comunic.longval4 = is_direccion.gl_codmun
iu_gen_comunic.is_comunic.longval5  = is_direccion.gl_codloc
iu_gen_comunic.is_comunic.strval1 = is_direccion.gs_prov
iu_gen_comunic.is_comunic.strval2 = is_direccion.gs_depto
iu_gen_comunic.is_comunic.strval3 = is_direccion.gs_munic
iu_gen_comunic.is_comunic.strval4 = is_direccion.gs_local
//

// Si el tipo del aviso es "Normal"
//IF d_clase_avi.GetItemNumber(1,1) = 1 THEN

	// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica
	IF (Len(string(is_direccion.gl_nis)) = 7) THEN
		
		w_1211_identificar_suministro.TriggerEvent("ue_proc_sum")

		if d_direccion.rowCount() > 0 then

		tab_1.suministro.st_nis2.Enabled=false
		tab_1.suministro.st_doc2.Enabled=false
		tab_1.suministro.st_ape2.Enabled=false
		tab_1.suministro.st_dir.Enabled=false	
		tab_1.Incidenciasin.Enabled=True
		tab_1.Incidencias.Enabled=True
			tab_1.avisos.Enabled= True
			tab_1.interrupciones.Enabled=True
			//cb_undo.enabled=true
			cb_buscar.enabled=false
			ib_trajo_datos2=true

			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			fw_nis()
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		end if

	ELSE
	
		//	Cargar estructura de comunicaciones con mensaje de error.

		// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de direcci$$HEX1$$f300$$ENDHEX$$n 

		d_direccion.fpr_llenar_campos(is_direccion)
		//Mato
	     d_direccion.object.calle[1] = ""
		d_direccion.object.numero[1] = ""
		d_direccion.object.duplic[1] = ""

		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		fw_visible_enabled_nic(False)
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************

//		IF NOT IsNull(is_direccion.gs_esq_cond) THEN
//			fpr_llenar_campo_sle(sle_esq_cond,string(is_direccion.gs_esq_cond))
//		END IF
//
	
	END IF

//ELSE
	// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de direcci$$HEX1$$f300$$ENDHEX$$n 
//	d_direccion.fpr_llenar_campos(is_direccion)
//	IF NOT IsNull(is_direccion.gs_esq_cond) THEN
//		fpr_llenar_campo_sle(sle_esq_cond,string(is_direccion.gs_esq_cond))
//	END IF
//
//END IF
//
end event

type gb_1 from groupbox within suministro
integer x = 251
integer y = 976
integer width = 3634
integer height = 628
integer taborder = 41
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
boolean underline = true
long textcolor = 128
long backcolor = 81324524
end type

type cb_1 from commandbutton within suministro
integer x = 2290
integer y = 1644
integer width = 375
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_nis, dwc_direccion, dwc_cliente
string ls_titulo
long ll_longitud

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o

IF not(ib_trajo_datos or ib_trajo_datos2 or ib_trajo_datos3 or ib_trajo_datos4) THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF


ls_titulo = 'Aviso'
ll_longitud = len (ls_titulo)*100
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_1.getchild ("d_nis_imp",dwc_nis)
d_nis_rad.sharedata(dwc_nis)
lst_impresion.pa_todos[1]=d_nis_rad
lst_impresion.pa_nombres[1]='d_nis_imp'

dw_1.getchild ("d_direccion_imp",dwc_direccion)
d_direccion.sharedata(dwc_direccion)
lst_impresion.pa_todos[2]=d_direccion
lst_impresion.pa_nombres[2]='d_direccion_imp'

dw_1.getchild ("d_cliente_imp",dwc_cliente)
d_cliente.sharedata(dwc_cliente)
lst_impresion.pa_todos[3]=d_cliente
lst_impresion.pa_nombres[3]='d_cliente_imp'

lst_impresion.total = 3
//IF d_lista_brigada.RowCount() = 0 THEN
//	gnv_msg.f_mensaje( "AB02","","",OK!)
//	return
//END IF
//fw_editar_campos(d_cliente)
dw_1.SetTransObject(SQLCA)

//lst_impresion.pdw_datawindow = dw_1
//lst_impresion.pdw_lista = d_lista_brigada
lst_impresion.pdw_compuesto = dw_1
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)
	

end event

type st_nic from statictext within suministro
boolean visible = false
integer x = 713
integer y = 276
integer width = 352
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_nis2 from statictext within suministro
boolean visible = false
integer x = 411
integer y = 280
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "NIS:"
alignment alignment = center!
boolean focusrectangle = false
boolean disabledlook = true
end type

event doubleclicked;int li_v_doc, li_res_c_estr, li_return_nic

SetPointer(HourGlass!)
ib_trajo_datos = false
ib_trajo_datos2 = false
ib_trajo_datos3 = false
ib_trajo_datos4 = false
// Valido Nis_Rad


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
li_return_nic = fw_nic()
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


is_direccion.gl_nis = long(d_nis_rad.fpr_v_nis_rad(d_nis_rad))

IF  (Len(string(is_direccion.gl_nis)) = 7) And li_return_nic = 1 THEN
// Cargo en la estructura el resto de los datos necesarios

li_res_c_estr = d_nis_rad.fpr_c_estruc_dir_por_nis(is_direccion) 
	IF li_res_c_estr = 1 or li_res_c_estr = 3 THEN
		//	Procedimiento Almacenado Datos_suministro ???
		w_1211_identificar_suministro.TriggerEvent("ue_proc_sum")
		
	// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
	st_nis2.Enabled=false
	tab_1.suministro.st_doc2.Enabled=false

	tab_1.suministro.st_ape2.Enabled=false
	tab_1.suministro.st_dir.Enabled=false


	// habilito las etiquetas de incidencias,avisos e 
	//interrupciones del tab
		
	tab_1.Incidencias.Enabled=True
	tab_1.Incidenciasin.Enabled=True
	tab_1.avisos.Enabled= True
	tab_1.interrupciones.Enabled=True
	//cb_undo.enabled=true
	banderaRehacer = true
	cb_buscar.enabled=false
	ib_trajo_datos=true
	ELSEIF li_res_c_estr = 0 THEN
		gnv_msg.f_mensaje("AR03","","",OK!)

		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		fw_visible_enabled_nic(False)
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	ELSEIF li_res_c_estr = 2 THEN
		gnv_msg.f_mensaje("AR13","","",OK!)

		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		fw_visible_enabled_nic(False)
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	END IF
ELSE
	If li_return_nic = 0 Then gnv_msg.f_mensaje("ER32","","",OK!)

	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_nic.BackColor = Long(d_nis_rad.Describe("nis_rad.BackGround.Color"))
st_nic.TextColor = Long(d_nis_rad.Describe("nis_rad.Color"))
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type d_nis_rad from u_nis_2001_pr_nis_rad within suministro
event ue_enter pbm_dwnkey
integer x = 471
integer y = 260
integer width = 640
integer height = 108
integer taborder = 11
boolean border = false
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) and not ib_trajo_datos THEN  st_nis2.TriggerEvent("doubleclicked")

end event

event editchanged;// En este evento se controla que el usuario no introduzca como primer caracter del
// Nis, el signo negativo.   (GVE)
string ls_nis

ls_nis = d_nis_rad.GetText()
if ls_nis = "-" then
	d_nis_rad.SetText("")
end if
end event

type gb_3 from groupbox within suministro
integer x = 402
integer y = 216
integer width = 727
integer height = 172
integer taborder = 11
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

type d_cliente from u_cli_2001_pr_cliente_std within suministro
event ue_enter pbm_dwnkey
integer x = 311
integer y = 1064
integer width = 3525
integer height = 480
integer taborder = 81
boolean bringtotop = true
boolean border = false
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////
long ll_row
AcceptText()

IF KeyDown(KeyEnter!) THEN
	ll_row=RowCount()
	AcceptText()
		IF this.GetColumnName()="doc_id" THEN
			tab_1.suministro.st_doc2.TriggerEvent("doubleclicked")
		ELSEIF this.GetColumnName() = "ap1" THEN
			tab_1.suministro.st_ape2.TriggerEvent("doubleclicked")
		END IF
		
END IF
//IsNull(GetItemString(ll_row,"ap1"))
// NOT IsNull(GetItemString(ll_row,"doc_id")) AND 
end event

type incidencias from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5906
integer height = 2628
long backcolor = 81324524
string text = "Incidencias con interrup."
long tabtextcolor = 33554432
long tabbackcolor = 81324524
string picturename = ".\recursos\COR_PRO1.BMP"
long picturemaskcolor = 553648127
st_incidencias st_incidencias
cb_2 cb_2
dw_2 dw_2
cbx_historico cbx_historico
dw_listado_incidencias dw_listado_incidencias
end type

on incidencias.create
this.st_incidencias=create st_incidencias
this.cb_2=create cb_2
this.dw_2=create dw_2
this.cbx_historico=create cbx_historico
this.dw_listado_incidencias=create dw_listado_incidencias
this.Control[]={this.st_incidencias,&
this.cb_2,&
this.dw_2,&
this.cbx_historico,&
this.dw_listado_incidencias}
end on

on incidencias.destroy
destroy(this.st_incidencias)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.cbx_historico)
destroy(this.dw_listado_incidencias)
end on

type st_incidencias from statictext within incidencias
integer y = 296
integer width = 5902
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Listado de Incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n que afectan al suministro"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within incidencias
integer x = 2290
integer y = 1644
integer width = 375
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
dw_2.modify("data_1.DataObject ='" + dw_listado_incidencias.DataObject + "'")

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_2.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Incidencias'
ll_longitud = len (ls_titulo)*100

dw_2.modify("f_desde.visible='0'")
dw_2.modify("desde.visible='0'")
dw_2.modify("nulo_desde.visible = '0'")
dw_2.modify("nulo_hasta.visible = '0'")
dw_2.modify("f_hasta.visible='0'")
dw_2.modify("hasta.visible='0'")

// si no son nulas las inserto
dw_2.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_2.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_2.Modify("data_1.Width= '8000'")
//dw_listado_incidencias.ShareData(dw_datos)

IF dw_listado_incidencias.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF
//dw_2.SetTransObject(SQLCA)
//s_impresion_preliminar lst_Impresion
//lst_impresion.pdw_datawindow = dw_2
//lst_impresion.pdw_lista = dw_listado_incidencias

//gf_impresion_preliminar (lst_impresion, True, 0)



lst_impresion.pdw_datawindow = dw_2
lst_impresion.pdw_lista = dw_listado_incidencias
lst_impresion.pdw_compuesto = dw_2
lst_impresion.compuesto = false
gf_impresion_preliminar (lst_impresion, True, 0)

end event

type dw_2 from datawindow within incidencias
boolean visible = false
integer x = 1934
integer y = 476
integer width = 494
integer height = 360
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_historico from checkbox within incidencias
integer x = 1147
integer y = 140
integer width = 891
integer height = 80
integer taborder = 5
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Datos hist$$HEX1$$f300$$ENDHEX$$ricos (<12/2000)"
boolean lefttext = true
end type

event clicked;parent.setredraw(false)	
if checked then // TRAEMOS DATOS HISTORICO
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
	dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)


	If Not ib_hist_relac_inst Then  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **
		dw_listado_incidencias.dataobject="d_inc_2002_pr_lista_incidencia_hist"
	End If  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **


	dw_listado_incidencias.settransobject(SQLCA)
else  //TRAEMOS DATOS ACTUALES
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
	dw_filtro_fecha.setitem(1,"f_hasta",today())


	If Not ib_hist_relac_inst Then  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **
		dw_listado_incidencias.dataobject="d_inc_2002_pr_lista_incidencia"
	End If  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **


	dw_listado_incidencias.settransobject(SQLCA)
end if
dw_filtro_fecha.accepttext()
parent.setredraw(true)
end event

type dw_listado_incidencias from u_inc_2021_pr_lista_incidencia within incidencias
integer y = 384
integer width = 5902
integer height = 1096
integer taborder = 30
string dataobject = "d_inc_2002_pr_lista_incidencia"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event sqlpreview;// No debe heredar este script de u_gen_0000_lista
string ls_realizado



//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
//**  HISTORICO RELACION DE INSTALACIONES  ls_realizado=this.modify("DataWindow.Retrieve.AsNeeded=Yes")



If ib_hist_relac_inst Then
	fw_hist_relac_inst(sqlsyntax, This)

	This.Modify("DataWindow.Retrieve.AsNeeded=No")
Else
	ls_realizado=this.modify("DataWindow.Retrieve.AsNeeded=Yes")
End IF
//*******************************************
//**  OSGI 2002.1  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
end event

event clicked;call super::clicked;if row > 0 then
	this.SelectRow(0,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant = row
end if
end event

event doubleclicked;call super::doubleclicked;boolean		lb_historicos			//Indicador del filtro de hist$$HEX1$$f300$$ENDHEX$$rico
datastore	lds_filtroDatos		//DataStore con los datos de los filtros que se han utilizado para obtener la informaci$$HEX1$$f300$$ENDHEX$$n de los clientes
datetime 	ldt_desde				//Fecha desde del filtro
datetime		ldt_hasta				//Fecha hasta del filtro
int			li_columna				//
long			ll_nis					//Nis del cliente sobre el que estamos realizando la b$$HEX1$$fa00$$ENDHEX$$squeda
powerobject lpo_origen				//Objeto para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda de la ventana origen
window		lw_ventanaActiva		//Ventana que tiene el foco
w_1211_identificar_suministro	lw_cliente	//Ventana que contiene los datos del cliente

if row > 0 then
	SETPOINTER(HOURGLASS!)
	close(w_2301_form_incidencia)
	this.SelectRow(ii_fila_ant,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant = row
	//OpenSheet (w_2301_form_incidencia, w_genapp_frame, menu, layered!)
	//gu_comunic.is_comunic.longval5 = 1
	//gu_comunic.is_comunic.accion_llamada = "Consulta"
	st_parametros.l_nro_incidencia = this.getitemnumber(row,"nro_incidencia")
	if cbx_historico.checked OR this.getitemnumber(row, 'est_actual') >= 5 then
		//gu_comunic.is_comunic.programa_llamante = "consultaIncidencia"
		banderaHist = true
	else
		//gu_comunic.is_comunic.programa_llamante = "consultaIncidencia"
		banderaHist = false
	end if
	
	
	//AHM (17/02/2011) ASUR 929534
	IF gi_pais = 8 THEN 			//Estamos en Moldavia
	
	
		//Captura de los datos del filtro
		ldt_desde = dw_filtro_fecha.getitemdatetime(1,"f_desde")
		ldt_hasta = dw_filtro_fecha.getitemdatetime(1,"f_hasta")
		
		IF tab_1.incidenciasin.cbx_historico2.checked THEN 
			lb_historicos = TRUE
		ELSE 
			lb_historicos = FALSE
		END IF
		
	
		//Obtenci$$HEX1$$f300$$ENDHEX$$n del nis del cliente del que estamos viendo la informaci$$HEX1$$f300$$ENDHEX$$n
		ll_nis = tab_1.suministro.d_nis_rad.GetItemNumber(tab_1.suministro.d_nis_rad.GetRow(), "nis_rad")
		
		//Buscamos la ventana actual para cerrarla
		lpo_origen = this
	
		do while (lpo_origen.typeOf() <>Window! )
			lpo_origen = lpo_origen.Getparent()
			if not isvalid(lpo_origen) then exit
		loop
		
		THIS.setredraw(FALSE)		
		
		lds_filtroDatos = CREATE datastore
		lds_filtroDatos.dataObject = "d_filtros_cliente_suministros"
		lds_filtroDatos.setTransObject(SQLCA)
		lds_filtroDatos.importString(ids_filtros.object.datawindow.data)
		
		close(lpo_origen)
		
		//Apertura de la incidencia 
		gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
	
		w_operaciones.TriggerEvent("ue_informacion_clientes")
		
		//Apertura de la ventana de los datos del cliente y recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos
		
		//Recuperamos los datos generales
		lw_ventanaActiva = w_operaciones.GetActiveSheet ( )
		
		lw_cliente = lw_ventanaActiva
		
		lw_cliente.tab_1.suministro.d_nis_rad.setItem(1, "nis_rad", ll_nis)
		
		lw_cliente.tab_1.suministro.d_nis_rad.accepttext()
		
		
		lw_cliente.tab_1.suministro.st_nis2.TriggerEvent("doubleclicked")
		
		//Recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de los tabs
		FOR li_columna = 1 TO lds_filtroDatos.rowCount()
			lw_cliente.etiqueta_activa = lds_filtroDatos.getItemString(li_columna, "etiqueta_activa")
			lw_cliente.dw_filtro_fecha.setitem(1, "f_desde", lds_filtroDatos.getItemDateTime(li_columna, "fecha_desde"))
			lw_cliente.dw_filtro_fecha.setitem(1, "f_hasta", lds_filtroDatos.getItemDateTime(li_columna, "fecha_hasta"))
			IF lds_filtroDatos.getItemNumber(li_columna, "datos_historicos") = 1 THEN
				lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = TRUE
			ELSE
				lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = FALSE
			END IF
			IF lds_filtroDatos.getItemNumber(li_columna, "afec_parcial") = 1 THEN
				lw_cliente.cbx_afec_parcial.checked = TRUE
			ELSE
				lw_cliente.cbx_afec_parcial.checked = FALSE
			END IF
			lw_cliente.dw_filtro_fecha.acceptText()
			lw_cliente.cb_buscar.TriggerEvent("clicked")			
		NEXT
		
		//Asignamos los datos del filtro
		lw_cliente.dw_filtro_fecha.setitem(1, "f_desde", ldt_desde)
		lw_cliente.dw_filtro_fecha.setitem(1, "f_hasta", ldt_hasta)
		
		
		lw_cliente.etiqueta_activa = "incidenciassin"
		
		IF lb_historicos THEN 
			lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = TRUE
		ELSE 
			lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = FALSE
		END IF
		
		lw_cliente.tab_1.SelectedTab = 3
		setfocus(lw_cliente.tab_1.incidenciasin.dw_listado_incidencias_sin)
		
		w_operaciones.GetNextSheet(lw_cliente).setfocus()
		
		IF isValid(lds_filtroDatos) THEN DESTROY lds_filtroDatos
	
	ELSE
		//gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_genapp_frame,0) 
		if (banderaHist) then
			//OpenSheet (w_2301_form_incidencia, w_genapp_frame, menu, layered!)
			st_parametros.historico = true
			OpenSheetWithParm (w_2301_hist_form_incidencia,st_parametros, w_genapp_frame, menu, layered!)
		else 
			st_parametros.historico = false
			OpenSheetWithParm (w_2301_form_incidencia,st_parametros, w_genapp_frame, menu, layered!)
		end if
		
	END IF
	
end if


end event

type incidenciasin from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5906
integer height = 2628
long backcolor = 81324524
string text = "Incidencias sin interrup."
long tabtextcolor = 33554432
long tabbackcolor = 81324524
string picturename = ".\recursos\SINCORTE.BMP"
long picturemaskcolor = 553648127
st_incidencias_sin st_incidencias_sin
cb_imprimir2 cb_imprimir2
dw_5 dw_5
cbx_historico2 cbx_historico2
dw_listado_incidencias_sin dw_listado_incidencias_sin
end type

on incidenciasin.create
this.st_incidencias_sin=create st_incidencias_sin
this.cb_imprimir2=create cb_imprimir2
this.dw_5=create dw_5
this.cbx_historico2=create cbx_historico2
this.dw_listado_incidencias_sin=create dw_listado_incidencias_sin
this.Control[]={this.st_incidencias_sin,&
this.cb_imprimir2,&
this.dw_5,&
this.cbx_historico2,&
this.dw_listado_incidencias_sin}
end on

on incidenciasin.destroy
destroy(this.st_incidencias_sin)
destroy(this.cb_imprimir2)
destroy(this.dw_5)
destroy(this.cbx_historico2)
destroy(this.dw_listado_incidencias_sin)
end on

type st_incidencias_sin from statictext within incidenciasin
integer y = 296
integer width = 5902
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Listado de Incidencias sin interrupci$$HEX1$$f300$$ENDHEX$$n que afectan al suministro"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_imprimir2 from commandbutton within incidenciasin
integer x = 2290
integer y = 1644
integer width = 375
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
dw_5.modify("data_1.DataObject ='" + dw_listado_incidencias_sin.DataObject + "'")

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_5.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Incidencias sin interrupci$$HEX1$$f300$$ENDHEX$$n'
ll_longitud = len (ls_titulo)*100

dw_5.modify("f_desde.visible='0'")
dw_5.modify("desde.visible='0'")
dw_5.modify("nulo_desde.visible = '0'")
dw_5.modify("nulo_hasta.visible = '0'")
dw_5.modify("f_hasta.visible='0'")
dw_5.modify("hasta.visible='0'")

// si no son nulas las inserto
dw_5.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_5.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_5.Modify("data_1.Width= '8000'")
dw_listado_incidencias_sin.ShareData(dw_datos)



IF dw_listado_incidencias_sin.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF
//dw_5.SetTransObject(SQLCA)
//s_impresion_preliminar lst_Impresion
//lst_impresion.pdw_datawindow = dw_5
//lst_impresion.pdw_lista = dw_listado_incidencias

//gf_impresion_preliminar (lst_impresion, True, 0)



lst_impresion.pdw_datawindow = dw_5
lst_impresion.pdw_lista = dw_listado_incidencias_sin
lst_impresion.pdw_compuesto = dw_5
lst_impresion.compuesto = false
gf_impresion_preliminar (lst_impresion, True, 0)

end event

type dw_5 from datawindow within incidenciasin
boolean visible = false
integer x = 2231
integer y = 612
integer width = 494
integer height = 360
integer taborder = 20
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_historico2 from checkbox within incidenciasin
integer x = 1221
integer y = 140
integer width = 827
integer height = 80
integer taborder = 5
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Datos hist$$HEX1$$f300$$ENDHEX$$ricos (<12/2000)"
boolean lefttext = true
end type

event clicked;parent.setredraw(false)	
if checked then // TRAEMOS DATOS HISTORICO
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
	dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
	dw_listado_incidencias_sin.dataobject="d_inc_2002_pr_lista_incidencia_sin_histo"
	dw_listado_incidencias_sin.settransobject(SQLCA)
else  //TRAEMOS DATOS ACTUALES
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
	dw_filtro_fecha.setitem(1,"f_hasta",today())
	dw_listado_incidencias_sin.dataobject="d_inc_2002_pr_lista_incidencia_sin"
	dw_listado_incidencias_sin.settransobject(SQLCA)
end if
dw_filtro_fecha.accepttext()
parent.setredraw(true)	
end event

type dw_listado_incidencias_sin from u_inc_2021_pr_lista_incidencia within incidenciasin
integer y = 384
integer width = 5902
integer height = 1096
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_inc_2002_pr_lista_incidencia_sin"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event clicked;call super::clicked;if row > 0 then
	this.SelectRow(0,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant = row
end if
end event

event doubleclicked;call super::doubleclicked;
boolean		lb_historicos			//Indicador del filtro de hist$$HEX1$$f300$$ENDHEX$$rico
datastore	lds_filtroDatos		//DataStore con los datos de los filtros que se han utilizado para obtener la informaci$$HEX1$$f300$$ENDHEX$$n de los clientes
datetime 	ldt_desde				//Fecha desde del filtro
datetime		ldt_hasta				//Fecha hasta del filtro
int			li_columna				//
long			ll_nis					//Nis del cliente sobre el que estamos realizando la b$$HEX1$$fa00$$ENDHEX$$squeda
powerobject lpo_origen				//Objeto para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda de la ventana origen
//string		ls_aviso					//Cadena almacena los datos del tab de avisos
//string		ls_incidencias			//Cadena almacena los datos del tab de incidendias
//string		ls_incidenciasSin		//Cadena almacena los datos del tab de incidendias sin
//string		ls_interrupciones		//Cadena almacena los datos del tab de interrupciones
window		lw_ventanaActiva		//Ventana que tiene el foco
w_1211_identificar_suministro	lw_cliente	//Ventana que contiene los datos del cliente

if row > 0 then
	SETPOINTER(HOURGLASS!)
	close(w_2301_form_incidencia)
	this.SelectRow(ii_fila_ant,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant = row
	//gu_comunic.is_comunic.longval3 = this.getitemnumber(row,"nro_incidencia")
//	gu_comunic.is_comunic.longval5 = 1
	//gu_comunic.is_comunic.accion_llamada = "Consulta"
	st_parametros.l_nro_incidencia = this.getitemnumber(row,"nro_incidencia")
	if cbx_historico2.checked OR this.getitemnumber(row, 'est_actual') >= 5 then
		//gu_comunic.is_comunic.programa_llamante = "Hist_Inci"
		banderaHist = true
	else
		//gu_comunic.is_comunic.programa_llamante = "w_2038_consulta_incidencias"
		banderaHist = false
	end if
	//AHM (17/02/2011) ASUR 929534
	IF gi_pais = 8 THEN 			//Estamos en Moldavia
	
		//Inicializaci$$HEX1$$f300$$ENDHEX$$n de las variables
//		setNull(ls_aviso)
//		setNull(ls_incidencias)
//		setNull(ls_incidenciasSin)
//		setNull(ls_interrupciones)
		
		//Captura de los datos del filtro
		ldt_desde = dw_filtro_fecha.getitemdatetime(1,"f_desde")
		ldt_hasta = dw_filtro_fecha.getitemdatetime(1,"f_hasta")
		
		IF tab_1.incidenciasin.cbx_historico2.checked THEN 
			lb_historicos = TRUE
		ELSE 
			lb_historicos = FALSE
		END IF
		
	
		//Obtenci$$HEX1$$f300$$ENDHEX$$n del nis del cliente del que estamos viendo la informaci$$HEX1$$f300$$ENDHEX$$n
		ll_nis = tab_1.suministro.d_nis_rad.GetItemNumber(tab_1.suministro.d_nis_rad.GetRow(), "nis_rad")
		
		//Buscamos la ventana actual para cerrarla
		lpo_origen = this
	
		do while (lpo_origen.typeOf() <>Window! )
			lpo_origen = lpo_origen.Getparent()
			if not isvalid(lpo_origen) then exit
		loop
		
		//Captura de los datos de los tabs
//		IF tab_1.avisos.d_lista_aviso.rowCount() > 0 THEN
//			ls_aviso = tab_1.avisos.d_lista_aviso.Object.DataWindow.Data
//		END IF
//		IF tab_1.incidencias.dw_listado_incidencias.rowCount() > 0 THEN
//			ls_incidencias = tab_1.incidencias.dw_listado_incidencias.Object.DataWindow.Data
//		END IF
//		IF tab_1.incidenciasin.dw_listado_incidencias_sin.rowCount() > 0 THEN
//			ls_incidenciasSin = tab_1.incidenciasin.dw_listado_incidencias_sin.Object.DataWindow.Data
//		END IF
//		IF tab_1.interrupciones.d_interrupciones.rowCount() > 0 THEN
//			ls_interrupciones = tab_1.interrupciones.d_interrupciones.Object.DataWindow.Data
//		END IF
		
		THIS.setredraw(FALSE)		
		
		lds_filtroDatos = CREATE datastore
		lds_filtroDatos.dataObject = "d_filtros_cliente_suministros"
		lds_filtroDatos.setTransObject(SQLCA)
		lds_filtroDatos.importString(ids_filtros.object.datawindow.data)
		
		close(lpo_origen)
		
		//Apertura de la incidencia 
		gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
	
		w_operaciones.TriggerEvent("ue_informacion_clientes")
		
		//Apertura de la ventana de los datos del cliente y recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos
		
		//Recuperamos los datos generales
		lw_ventanaActiva = w_operaciones.GetActiveSheet ( )
		
		lw_cliente = lw_ventanaActiva
		
		lw_cliente.tab_1.suministro.d_nis_rad.setItem(1, "nis_rad", ll_nis)
		
		lw_cliente.tab_1.suministro.d_nis_rad.accepttext()
		
		
		lw_cliente.tab_1.suministro.st_nis2.TriggerEvent("doubleclicked")
		
		//Recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de los tabs
		FOR li_columna = 1 TO lds_filtroDatos.rowCount()
			lw_cliente.etiqueta_activa = lds_filtroDatos.getItemString(li_columna, "etiqueta_activa")
			lw_cliente.dw_filtro_fecha.setitem(1, "f_desde", lds_filtroDatos.getItemDateTime(li_columna, "fecha_desde"))
			lw_cliente.dw_filtro_fecha.setitem(1, "f_hasta", lds_filtroDatos.getItemDateTime(li_columna, "fecha_hasta"))
			IF lds_filtroDatos.getItemNumber(li_columna, "datos_historicos") = 1 THEN
				lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = TRUE
			ELSE
				lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = FALSE
			END IF
			IF lds_filtroDatos.getItemNumber(li_columna, "afec_parcial") = 1 THEN
				lw_cliente.cbx_afec_parcial.checked = TRUE
			ELSE
				lw_cliente.cbx_afec_parcial.checked = FALSE
			END IF
			lw_cliente.dw_filtro_fecha.acceptText()
			lw_cliente.cb_buscar.TriggerEvent("clicked")			
		NEXT
		
		//Asignamos los datos del filtro
		lw_cliente.dw_filtro_fecha.setitem(1, "f_desde", ldt_desde)
		lw_cliente.dw_filtro_fecha.setitem(1, "f_hasta", ldt_hasta)
		
		
		lw_cliente.etiqueta_activa = "incidenciassin"
		
		IF lb_historicos THEN 
			lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = TRUE
		ELSE 
			lw_cliente.tab_1.incidenciasin.cbx_historico2.checked = FALSE
		END IF
		
	
//		//Recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de los tabs
//		IF NOT(isNull(ls_aviso)) THEN
//			lw_cliente.tab_1.avisos.d_lista_aviso.ImportString(ls_aviso)
//		END IF
//		IF NOT(isNull(ls_incidencias)) THEN
//			lw_cliente.tab_1.incidencias.dw_listado_incidencias.ImportString(ls_incidencias)
//		END IF
//		IF NOT(isNull(ls_incidenciasSin)) THEN
//			lw_cliente.tab_1.incidenciasin.dw_listado_incidencias_sin.ImportString(ls_incidenciasSin)
//		END IF
//		IF NOT(isNull(ls_interrupciones)) THEN
//			lw_cliente.tab_1.interrupciones.d_interrupciones.ImportString(ls_interrupciones)
//		END IF
		
		//newindex=3
		
			
		
		lw_cliente.tab_1.SelectedTab = 3
		setfocus(lw_cliente.tab_1.incidenciasin.dw_listado_incidencias_sin)
		
//		lw_cliente.cb_buscar.TriggerEvent("clicked")
		
		w_operaciones.GetNextSheet(lw_cliente).setfocus()
		
		IF isValid(lds_filtroDatos) THEN DESTROY lds_filtroDatos
		
	ELSE
		//gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
		if (banderaHist) then
			//OpenSheet (w_2301_form_incidencia, w_genapp_frame, menu, layered!)
			st_parametros.historico = true
			OpenSheetWithParm (w_2301_hist_form_incidencia,st_parametros, w_genapp_frame, menu, layered!)
		else 
			st_parametros.historico = false
			OpenSheetWithParm (w_2301_form_incidencia,st_parametros, w_genapp_frame, menu, layered!)
		end if
	END IF
	
end if


end event

event sqlpreview;// No debe heredar este script de u_gen_0000_lista
string ls_realizado
ls_realizado=this.modify("DataWindow.Retrieve.AsNeeded=Yes")
end event

type avisos from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5906
integer height = 2628
long backcolor = 81324524
string text = "Avisos"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
string picturename = "Custom020!"
long picturemaskcolor = 553648127
d_lista_aviso d_lista_aviso
st_avisos st_avisos
cb_3 cb_3
dw_3 dw_3
cbx_historico3 cbx_historico3
end type

on avisos.create
this.d_lista_aviso=create d_lista_aviso
this.st_avisos=create st_avisos
this.cb_3=create cb_3
this.dw_3=create dw_3
this.cbx_historico3=create cbx_historico3
this.Control[]={this.d_lista_aviso,&
this.st_avisos,&
this.cb_3,&
this.dw_3,&
this.cbx_historico3}
end on

on avisos.destroy
destroy(this.d_lista_aviso)
destroy(this.st_avisos)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.cbx_historico3)
end on

type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within avisos
integer y = 384
integer width = 5902
integer height = 1096
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
end type

event sqlpreview;// No debe heredar este script de u_gen_0000_list
string ls_realizado
ls_realizado=this.modify("DataWindow.Retrieve.AsNeeded=Yes")
end event

event clicked;call super::clicked;/////////////////////////////////////////////////////////////////////////
//
// Evento:  	Clicked!
//
// Objetivo: 	Selecciona el registro clickeado
//
//                       Responsable  	Fecha     	Actuaci$$HEX1$$f300$$ENDHEX$$n
//                       -----------  	-----    	--------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       		AD			11/09/96		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
/////////////////////////////////////////////////////////////////////////

IF row > 0 THEN
	This.SelectRow(0,FALSE)    //elimino la marcar anterior
	This.SelectRow(row,TRUE)  // marco el seleccionado
	ii_fila_ant = row
END IF

end event

event dberror;//
end event

event doubleclicked;call super::doubleclicked;
// Si se selecciono alguno
IF row > 0 THEN
	SETPOINTER(HOURGLASS!)
	close(w_1203_inf_aviso)
	this.SelectRow(ii_fila_ant,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant =row
	//gu_comunic.is_comunic.longval1 = this.getitemnumber(row,"nro_aviso")
	st_parametros.l_nro_aviso = this.getitemnumber(row,"nro_aviso")
	//gu_comunic.is_comunic.longval5 = 1
	//gu_comunic.is_comunic.accion_llamada = "Consulta"
	//gu_comunic.is_comunic.programa_llamante = "w_1233_consulta_aviso"
//	open(w_1203_inf_aviso)
//	gu_comunic.fnu_abrir(w_1203_inf_aviso,"w_1203_inf_aviso",0,1,w_1211_identificar_suministro,"w_1211_identificar_suministro")	
	IF cbx_historico3.checked THEN
		//OpenSheet(w_1203_inf_aviso_hist,w_operaciones,8, Layered!)
		IF IsValid(w_consulta_incidencia) THEN
			close(w_consulta_incidencia)
		END IF
		OpenSheetWithParm (w_consulta_incidencia,st_parametros, w_genapp_frame, menu, layered!)
		//open(w_1203_inf_aviso_hist)
	ELSE	
		//open(w_1203_inf_aviso)
		//OpenSheet(w_1203_inf_aviso,w_operaciones,8, Layered!)
		IF IsValid(w_consulta_incidencia) THEN
			close(w_consulta_incidencia)
		END IF
		OpenSheetWithParm (w_consulta_incidencia, st_parametros, w_genapp_frame, menu, layered!)
	END IF
END IF


end event

type st_avisos from statictext within avisos
integer y = 296
integer width = 5902
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Lista de avisos del suministro"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within avisos
integer x = 2290
integer y = 1644
integer width = 375
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
dw_3.modify("data_1.DataObject ='" + d_lista_aviso.DataObject + "'")

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_3.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Avisos'
ll_longitud = len (ls_titulo)*100

dw_3.modify("f_desde.visible='0'")
dw_3.modify("desde.visible='0'")
dw_3.modify("nulo_desde.visible = '0'")
dw_3.modify("nulo_hasta.visible = '0'")
dw_3.modify("f_hasta.visible='0'")
dw_3.modify("hasta.visible='0'")

// si no son nulas las inserto
dw_3.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_3.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_3.Modify("data_1.Width= '8000'")
//d_lista_aviso.ShareData(dw_datos)



IF d_lista_aviso.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF
//dw_2.SetTransObject(SQLCA)
//s_impresion_preliminar lst_Impresion
//lst_impresion.pdw_datawindow = dw_2
//lst_impresion.pdw_lista = dw_listado_incidencias

//gf_impresion_preliminar (lst_impresion, True, 0)



lst_impresion.pdw_datawindow = dw_3
lst_impresion.pdw_lista = d_lista_aviso
lst_impresion.pdw_compuesto = dw_3
lst_impresion.compuesto = false
gf_impresion_preliminar (lst_impresion, True, 0)

end event

type dw_3 from datawindow within avisos
boolean visible = false
integer x = 101
integer y = 508
integer width = 494
integer height = 360
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_historico3 from checkbox within avisos
integer x = 1221
integer y = 140
integer width = 827
integer height = 80
integer taborder = 5
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Datos hist$$HEX1$$f300$$ENDHEX$$ricos (<12/2000)"
boolean lefttext = true
end type

event clicked;parent.setredraw(false)	
if checked then
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
	dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)
else
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
	dw_filtro_fecha.setitem(1,"f_hasta",today())
	
end if
dw_filtro_fecha.accepttext()
parent.setredraw(true)	
end event

type interrupciones from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5906
integer height = 2628
long backcolor = 81324524
string text = "Interrupciones"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
string picturename = ".\recursos\INCORPOR.BMP"
long picturemaskcolor = 553648127
d_interrupciones d_interrupciones
st_interrupciones st_interrupciones
cb_4 cb_4
dw_4 dw_4
cbx_historico4 cbx_historico4
end type

on interrupciones.create
this.d_interrupciones=create d_interrupciones
this.st_interrupciones=create st_interrupciones
this.cb_4=create cb_4
this.dw_4=create dw_4
this.cbx_historico4=create cbx_historico4
this.Control[]={this.d_interrupciones,&
this.st_interrupciones,&
this.cb_4,&
this.dw_4,&
this.cbx_historico4}
end on

on interrupciones.destroy
destroy(this.d_interrupciones)
destroy(this.st_interrupciones)
destroy(this.cb_4)
destroy(this.dw_4)
destroy(this.cbx_historico4)
end on

type d_interrupciones from u_int_2005_interrupciones_nis within interrupciones
integer y = 416
integer width = 5902
integer height = 1096
integer taborder = 10
string dataobject = "d_avi_1211_interrup"
end type

event sqlpreview;// No debe heredar este script de u_gen_0000_lista
string ls_realizado



//*******************************************
//**  OSGI 2002.1  	09/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
//**  HISTORICO RELACION DE INSTALACIONES  ls_realizado=this.modify("DataWindow.Retrieve.AsNeeded=Yes")



If ib_hist_relac_inst Then
	fw_hist_relac_inst(sqlsyntax, This)
	
	This.Modify("DataWindow.Retrieve.AsNeeded=No")
Else
	ls_realizado=this.modify("DataWindow.Retrieve.AsNeeded=Yes")
End IF
//*******************************************
//**  OSGI 2002.1  	09/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  HISTORICO RELACION DE INSTALACIONES  **
//*******************************************
end event

event clicked;call super::clicked;if row> 0 then
	this.SelectRow(0,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant = row
end if
end event

type st_interrupciones from statictext within interrupciones
integer y = 328
integer width = 5902
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Interrupciones del suministro"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within interrupciones
integer x = 2290
integer y = 1644
integer width = 375
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
dw_4.modify("data_1.DataObject ='" + d_interrupciones.DataObject + "'")

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_4.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Interrupciones'
ll_longitud = len (ls_titulo)*100

dw_4.modify("f_desde.visible='0'")
dw_4.modify("desde.visible='0'")
dw_4.modify("nulo_desde.visible = '0'")
dw_4.modify("nulo_hasta.visible = '0'")
dw_4.modify("f_hasta.visible='0'")
dw_4.modify("hasta.visible='0'")

// si no son nulas las inserto
dw_4.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_4.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_4.Modify("data_1.Width= '8000'")



//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
dw_datos.Modify(is_modif_dw_interr)
//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************



//d_interrupciones.ShareData(dw_datos)



IF d_interrupciones.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF
//dw_2.SetTransObject(SQLCA)
//s_impresion_preliminar lst_Impresion
//lst_impresion.pdw_datawindow = dw_2
//lst_impresion.pdw_lista = dw_listado_incidencias

//gf_impresion_preliminar (lst_impresion, True, 0)



lst_impresion.pdw_datawindow = dw_4
lst_impresion.pdw_lista = d_interrupciones
lst_impresion.pdw_compuesto = dw_4
lst_impresion.compuesto = false


//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
lst_impresion.modify = is_modif_dw_interr
//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************


gf_impresion_preliminar (lst_impresion, True, 0)
end event

type dw_4 from datawindow within interrupciones
boolean visible = false
integer x = 174
integer y = 572
integer width = 494
integer height = 360
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_historico4 from checkbox within interrupciones
integer x = 1221
integer y = 140
integer width = 827
integer height = 80
integer taborder = 5
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Datos hist$$HEX1$$f300$$ENDHEX$$ricos (<12/2000)"
boolean lefttext = true
end type

event clicked;parent.setredraw(false)	
if checked then // TRAEMOS DATOS HISTORICO
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_historico)
	dw_filtro_fecha.setitem(1,"f_hasta",idt_f_historico)


	If Not ib_hist_relac_inst Then  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **
		d_interrupciones.dataobject="d_avi_1211_interrup_hist"
	End If  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **


	d_interrupciones.settransobject(SQLCA)
else  //TRAEMOS DATOS ACTUALES
	dw_filtro_fecha.setitem(1,"f_desde",idt_f_alta_contrato)
	dw_filtro_fecha.setitem(1,"f_hasta",today())


	If Not ib_hist_relac_inst Then  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **
		d_interrupciones.dataobject="d_avi_1211_interrup"
	End If  //**  OSGI 2001.2  02/09/2002  Jair Padilla / Soluziona PANAMA  HISTORICO RELACION DE INSTALACIONES  **


	d_interrupciones.settransobject(SQLCA)
end if
dw_filtro_fecha.accepttext()
parent.setredraw(true)
end event

type cbx_afec_parcial from checkbox within w_1211_identificar_suministro
boolean visible = false
integer x = 2350
integer y = 384
integer width = 997
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tener en cuenta Afect. Parcial "
boolean checked = true
boolean lefttext = true
end type

type cb_exportar from commandbutton within w_1211_identificar_suministro
integer x = 2889
integer y = 1884
integer width = 375
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Exportar"
end type

event clicked;string ls_nombre_archivo, rfilename
boolean lb_cero= FALSE, lb_existe
long ll_nomcos, ll_numrows, ll_c, ll_r
OLEObject slapp, xlsub
int li_ret

CHOOSE CASE etiqueta_activa
	CASE "interrupciones"
		IF tab_1.interrupciones.d_interrupciones.rowcount() = 0 THEN
			lb_cero= TRUE
		END IF
	CASE "avisos"
		IF tab_1.avisos.d_lista_aviso.rowcount() = 0 THEN
			lb_cero= TRUE
		END IF
	CASE "incidenciassin"
		IF tab_1.incidenciasin.dw_listado_incidencias_sin.rowcount() = 0 THEN
			lb_cero= TRUE
		END IF
	CASE "incidencias"
		IF tab_1.incidencias.dw_listado_incidencias.rowcount() = 0 THEN
			lb_cero= TRUE
		END IF
END CHOOSE

IF lb_cero THEN
	gnv_msg.F_MENSAJE("AP09","","",ok!)
ELSE

//IF GetFileSaveName( "", ls_nombre_archivo, rfilename ,"XLS","Excel (*.XLS),*.XLS" ) = 1 THEN
//	// Se comprueba si existe el fichero
//	lb_existe = FileExists(ls_nombre_archivo)
//	
//	IF lb_existe THEN 
//		//Se confirmar que quiere grabar el fichero que ya existe
//		IF gnv_msg.F_MENSAJE("CP04",ls_nombre_archivo,"",YesNo!) <> 1 THEN //$$HEX1$$bf00$$ENDHEX$$Sobreescribir el fichero ya existente?
//			return
//		END IF
//	END IF
//			CHOOSE CASE etiqueta_activa
//				CASE "interrupciones"
//					tab_1.interrupciones.d_interrupciones.SaveAs(ls_nombre_archivo, Excel!,True)
//				CASE "avisos"
//					tab_1.avisos.d_lista_aviso.SaveAs(ls_nombre_archivo, Excel!,True)
//				CASE "incidenciassin"
//					tab_1.incidenciasin.dw_listado_incidencias_sin.SaveAs(ls_nombre_archivo, Excel!,True)
//				CASE "incidencias"
//					tab_1.incidencias.dw_listado_incidencias.SaveAs(ls_nombre_archivo, Excel!,True)		
//			END CHOOSE

			CHOOSE CASE etiqueta_activa
				CASE "interrupciones"
					fw_exportar_excel(tab_1.interrupciones.d_interrupciones)
				CASE "avisos"
					fw_exportar_excel(tab_1.avisos.d_lista_aviso)
				CASE "incidenciassin"
					fw_exportar_excel(tab_1.incidenciasin.dw_listado_incidencias_sin)
				CASE "incidencias"
					fw_exportar_excel(tab_1.incidencias.dw_listado_incidencias)		
			END CHOOSE

	END IF
//END IF


end event


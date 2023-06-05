HA$PBExportHeader$w_2301_hist_inc_desc.srw
forward
global type w_2301_hist_inc_desc from w_sgigenerica
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2301_hist_inc_desc
end type
type rb_4 from radiobutton within w_2301_hist_inc_desc
end type
type rb_3 from radiobutton within w_2301_hist_inc_desc
end type
type d_deteccion from u_inc_2013_pr_desde_hasta within w_2301_hist_inc_desc
end type
type dw_datos_grafico from datawindow within w_2301_hist_inc_desc
end type
type dw_1 from datawindow within w_2301_hist_inc_desc
end type
type d_filtro from u_desc_7101_pr_filtro_descargos within w_2301_hist_inc_desc
end type
type gb_1 from groupbox within w_2301_hist_inc_desc
end type
type dw_filtro from u_inc_2030_pr_filtro_incidencia within w_2301_hist_inc_desc
end type
type dw_grafica from datawindow within w_2301_hist_inc_desc
end type
type dw_lista from u_gen_0000_lista within w_2301_hist_inc_desc
end type
type dw_2 from datawindow within w_2301_hist_inc_desc
end type
type cb_total from commandbutton within w_2301_hist_inc_desc
end type
type sle_1 from singlelineedit within w_2301_hist_inc_desc
end type
type st_1 from statictext within w_2301_hist_inc_desc
end type
type dw_desc_descargo from datawindow within w_2301_hist_inc_desc
end type
type st_6 from statictext within w_2301_hist_inc_desc
end type
type rb_1 from radiobutton within w_2301_hist_inc_desc
end type
type rb_2 from radiobutton within w_2301_hist_inc_desc
end type
type gb_2 from groupbox within w_2301_hist_inc_desc
end type
end forward

global type w_2301_hist_inc_desc from w_sgigenerica
boolean visible = false
integer x = 5
integer y = 272
integer width = 3630
integer height = 1944
string title = "OPEN SGI - Situaci$$HEX1$$f300$$ENDHEX$$n Actual del Centro Responsable"
string menuname = "m_hist_inc_desc"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 79741120
event ue_armar_sql ( )
event ue_retrieve ( )
event ue_comienzo ( )
event ue_final ( )
event ue_cons_inci ( )
event ue_inicializo_objetos ( )
event ue_grafica ( )
event ue_notgrafica ( )
event ue_imp_reporte_inc ( )
event ue_consultar_anulacion ( )
event ue_agrupacion ( )
event ue_desagrupacion ( )
event ue_anulacion ( )
event ue_desanular ( )
event ue_observaciones ( )
dw_ambito dw_ambito
rb_4 rb_4
rb_3 rb_3
d_deteccion d_deteccion
dw_datos_grafico dw_datos_grafico
dw_1 dw_1
d_filtro d_filtro
gb_1 gb_1
dw_filtro dw_filtro
dw_grafica dw_grafica
dw_lista dw_lista
dw_2 dw_2
cb_total cb_total
sle_1 sle_1
st_1 st_1
dw_desc_descargo dw_desc_descargo
st_6 st_6
rb_1 rb_1
rb_2 rb_2
gb_2 gb_2
end type
global w_2301_hist_inc_desc w_2301_hist_inc_desc

type variables
boolean ib_si_valido
boolean  ib_rango
u_generico_comunicaciones lu_comunic
datetime idt_fecha_desde, idt_fecha_hasta

string is_sql_original
string is_filtro_ambito 
string is_filtro_deteccion 
string is_filtro_alimentacion 
string is_clausula_where 
string is_modificacion
int ii_tipo_grafica
string is_filtro_nro_incid_desde_hasta


long il_row_click, il_selected_rows  //**  OSGI 2001.1  	20/03/2001
boolean ib_selected  //**  OSGI 2001.1  	20/03/2001
boolean ib_parametro_salmt //**  OSGI 2001.1  	06/04/2001
boolean ib_mod_cxt_pxt  //**  OSGI 2001.1  28/06/2001
boolean ib_clicked  //**  OSGI 2001.1  02/07/2001

long il_fila_desde = 1
boolean ib_reenganche = false

int li_primera_vez
end variables

forward prototypes
public function string fw_incluir_historicos (string ps_select)
public function string fw_incluir_historicos_descargos (string ps_select)
public subroutine fw_rowfocuschanged (readonly long al_row)
public subroutine fw_valida_multiple (datawindow adw_dataw, readonly long al_row)
public function long fw_clicked (datawindow adw_dataw, readonly long row)
public function boolean fw_validar_fechas ()
public function boolean fw_se_puede_anular (integer pi_tip_incidencia, integer pi_alcance, integer pi_estado)
end prototypes

event ue_armar_sql();string rc, mod_string, original_select, where_clause = ""
string ls_select_hist, ls_tabla_original
string ls_filtro_fechas, ls_filtro_tension
string ls_operacion, ls_filtro_duracion, ls_duracion
int li_tiempo, li_duracion
int li_alcance, li_tension
long ll_start_pos
m_hist_inc_desc lm_menu
boolean lb_grupo_descargo=true

long ll_desc_descargo

setpointer(HourGlass!)
lm_menu = This.MenuId
lm_menu.m_editar.m_iralcomienzo.enabled = false
lm_menu.m_editar.m_iralfinal.enabled = false
lm_menu.m_consultar.m_consultaincidencia.enabled = false
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
lm_menu.m_consultar.m_observaciones.enabled = false
// Fin. Sgo.
lm_menu.m_editar.m_agruparincidencia.enabled = False
lm_menu.m_editar.m_desagruparincidencias.enabled = False

d_deteccion.accepttext()
dw_filtro.accepttext()
d_filtro.accepttext()

if not fw_validar_fechas() then return

ls_filtro_tension = " "
if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
	li_alcance = dw_filtro.GetItemNumber(1,'ai_suministro')	
	
	if len(trim(is_sql_original)) = 0 then
		original_select = dw_lista.Describe("DataWindow.Table.Select")
		is_sql_original = original_select
	else
		original_select = is_sql_original
	end if

//		original_select = dw_lista.Describe("DataWindow.Table.Select")
//		is_sql_original = original_select

//		
//		  
//		original_select = 'SELECT GI_HIST_REENGANCHES.NRO_INCIDENCIA, ' + &   
//								'GI_HIST_REENGANCHES.F_DETECCION,   ' + &
//								'GI_HIST_REENGANCHES.TIP_TENSION,   ' + &
//								'GI_HIST_REENGANCHES.FEC_RESOLUCION, ' + &   
//								'GI_HIST_REENGANCHES.USUARIO,   ' + &
//								'GI_HIST_REENGANCHES.NOM_INSTALACION, ' + &
//								'A.DESCRIPCION, ' + &
//								'B.DESCRIPCION '  + &
//								'FROM GI_HIST_REENGANCHES, SGD_VALOR A, SGD_VALOR B ' 

	if isnull(dw_filtro.getitemnumber(1,"nro_incid_hasta"))  then 
		dw_filtro.setitem(1,"nro_incid_hasta", 0)   
	end if
	if isnull(dw_filtro.getitemnumber(1,"nro_incid_desde")) then
		dw_filtro.setitem(1,"nro_incid_desde", 0)   
	end if	
	If dw_filtro.getitemnumber(1,"nro_incid_hasta") < 0  or dw_filtro.getitemnumber(1,"nro_incid_desde") < 0  then 
		messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de incidencias no pueden ser menores que 0.")
		return
	end if	
	If dw_filtro.getitemnumber(1,"nro_incid_hasta") = 0  and dw_filtro.getitemnumber(1,"nro_incid_desde") <> 0  then
		dw_filtro.setitem(1,"nro_incid_hasta", dw_filtro.getitemnumber(1,"nro_incid_desde"))
	end if	
	If dw_filtro.getitemnumber(1,"nro_incid_desde") = 0  and dw_filtro.getitemnumber(1,"nro_incid_hasta") <> 0  then
	  if dw_filtro.getitemnumber(1,"nro_incid_hasta") > 100 then
		  dw_filtro.setitem(1,"nro_incid_desde", dw_filtro.getitemnumber(1,"nro_incid_hasta"))
	 else
		  dw_filtro.setitem(1,"nro_incid_desde", 1)
	end if
	end if	
	If dw_filtro.getitemnumber(1,"nro_incid_hasta") - dw_filtro.getitemnumber(1,"nro_incid_desde") > 100 then
		dw_filtro.setitem(1,"nro_incid_hasta", dw_filtro.getitemnumber(1,"nro_incid_desde") + 100)
	end if	
	If dw_filtro.getitemnumber(1,"nro_incid_hasta") < dw_filtro.getitemnumber(1,"nro_incid_desde") then
		messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de incidencias no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
		return
	end if
	
	If dw_filtro.getitemnumber(1,"nro_incid_desde") > 0 then
		If dw_filtro.getitemnumber(1,"ai_suministro") = fgci_incidencia_reenganche then
			dw_filtro.object.ai_estado[1] = fgci_todos
			dw_filtro.object.ai_estado_mant[1] = fgci_todos
			dw_filtro.object.ai_alcance[1] = fgci_todos
			dw_filtro.object.ai_duracion[1] = 0
		else
			dw_filtro.object.ai_tipo[1] = fgci_todos
			dw_filtro.object.ai_estado[1] = fgci_todos
			dw_filtro.object.ai_estado_mant[1] = fgci_todos
			dw_filtro.object.ai_alcance[1] = fgci_todos
			dw_filtro.object.ai_suministro[1] = fgci_todos
			dw_filtro.object.ai_duracion[1] = 0
			//d_ambito.object.nro_centro[1] = fgci_todos
			//d_ambito.object.nro_cmd[1] = fgci_todos
			//d_ambito.object.nro_mesa[1] = fgci_todos
		end if
	end if
	
	is_filtro_nro_incid_desde_hasta = " "		
	is_filtro_ambito = ""
	is_filtro_deteccion = " "
	is_filtro_alimentacion = " "
	is_clausula_where = " "
	is_modificacion = " "

	is_filtro_ambito = dw_ambito.fnu_filtro_ambito_2(dw_ambito.getitemnumber(1,"nro_centro"), & 
																 dw_ambito.getitemnumber(1,"nro_cmd") ,     &
																 dw_ambito.getitemnumber(1,"nro_mesa"),0) 
	is_filtro_nro_incid_desde_hasta = dw_filtro.fnu_nro_incid_desde_hasta()		
	is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_2(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) 
	
	is_filtro_Alimentacion = dw_filtro.fnu_filtrar_avisos()
	
   if is_filtro_ambito <> "" then
		is_clausula_where = is_clausula_where + " and " + is_filtro_ambito 
	end if
	
	if is_filtro_nro_incid_desde_hasta <> "" then
		is_clausula_where = is_clausula_where + " and " + is_filtro_nro_incid_desde_hasta
	end if

	if is_filtro_nro_incid_desde_hasta = "" then   // si es numero incidencias desde y hasta no utilisar fechas
		if is_filtro_deteccion <> ""  then
			is_clausula_where = is_clausula_where +" AND "+ is_filtro_deteccion 
    	end if
	end if

	IF li_alcance <> fgci_incidencia_reenganche THEN			
		if is_filtro_alimentacion <> " " then
			is_clausula_where = is_clausula_where +" AND "+ is_filtro_alimentacion
		end if
	
		//AHM (28/02/2008)
//		// No se traen las incidencias sin p$$HEX1$$e900$$ENDHEX$$rdida que han sido agrupadas
//		is_clausula_where = is_clausula_where + &
//					" AND ( (SGD_INCIDENCIA.NRO_AGRUPACION > 0 " + &
//							  " AND SGD_INCIDENCIA.ALCANCE <> " + string(fgci_incidencia_sin_interrupcion) + &
//							+ " AND SGD_INCIDENCIA.ALCANCE <> " + string(fgci_incidencia_reenganche) +  ")" + &
//							" OR NVL(SGD_INCIDENCIA.NRO_AGRUPACION,0) = 0)	"

		is_clausula_where = is_clausula_where + &
					" AND ( (SGD_INCIDENCIA.NRO_AGRUPACION > 0 " + &
							  " AND ((select count(*) from gi_incidencia_agrupada where GI_HIST_INCIDENCIAS.NRO_INCIDENCIA = gi_incidencia_agrupada.nro_incidencia) > 0)"  + &
							+ " AND SGD_INCIDENCIA.ALCANCE <> " + string(fgci_incidencia_reenganche) +  ")" + &
							" OR NVL(SGD_INCIDENCIA.NRO_AGRUPACION,0) = 0)	"


							
		If fg_verifica_parametro('nuevos_tip_inc') AND dw_filtro.getitemnumber(1,"nro_incid_desde") = 0 then
   		IF lm_menu.m_consultar.m_obligadas.checked = true Then
	   		is_clausula_where = is_clausula_where + " AND IND_OBLIGADA = 1 "
   		End if
		End if
	ELSE
		li_tension = dw_filtro.GetItemNumber(1,'ai_alcance')
		IF li_tension = 0 THEN
			ls_filtro_tension = ' GI_HIST_REENGANCHES.TIP_TENSION > ' + string(li_tension)			
		ELSE
			ls_filtro_tension = ' GI_HIST_REENGANCHES.TIP_TENSION = ' + string(li_tension)
		END IF
		IF is_clausula_where <> " " THEN
			is_clausula_where = is_clausula_where + " AND " + ls_filtro_tension
		ELSE
			is_clausula_where = " WHERE " + ls_filtro_tension
		END IF
							
	END IF
						
	ls_operacion= dw_filtro.object.operacion[1]
	li_tiempo= dw_filtro.object.tiempo[1]
	li_duracion=dw_filtro.getitemnumber(1,"ai_duracion")

	ls_duracion= string(li_duracion)
	if li_tiempo=2 then
		ls_duracion= string(li_duracion*60)
	elseif li_tiempo=3 then
		ls_duracion= string(li_duracion*60*24)
	end if
	
	if li_duracion > 0 then 
		ls_filtro_duracion = "Fg_Duracion_Int(f_deteccion,fec_resolucion)  " + ls_operacion + " " + ls_duracion
		IF li_alcance = fgci_incidencia_reenganche and is_clausula_where = " " THEN
			is_clausula_where = " WHERE " + ls_filtro_duracion
		ELSE
			is_clausula_where = is_clausula_where + " AND " + ls_filtro_duracion
		END IF
	end if

	where_clause = is_clausula_where
	
	IF li_alcance = fgci_incidencia_reenganche THEN			
		fg_replace_text(where_clause,'SGD_INCIDENCIA','GI_HIST_REENGANCHES')
		ls_select_hist = original_select + where_clause 
	ELSE
		ls_select_hist = fw_incluir_historicos(original_select + where_clause )
		original_select =  ls_select_hist + ' UNION ALL ' + original_select
	END IF
	
elseif lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then

	if len(trim(is_sql_original)) = 0 then
		original_select = dw_lista.Describe("DataWindow.Table.Select")
		is_sql_original = original_select
	else
		original_select = is_sql_original
	end if
		
	string is_filtro_nro_desc_desde_hasta, is_filtro_descargo, ls_filtro
	int li_centro, li_cmd, li_puesto
	
	if isnull(d_filtro.getitemnumber(1,"nro_desc_hasta"))  then 
		d_filtro.setitem(1,"nro_desc_hasta", 0)   
	end if
	if isnull(d_filtro.getitemnumber(1,"nro_desc_desde")) then
		d_filtro.setitem(1,"nro_desc_desde", 0)   
	end if	
	If d_filtro.getitemnumber(1,"nro_desc_hasta") < 0  or d_filtro.getitemnumber(1,"nro_desc_desde") < 0  then 
		messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de incidencias no pueden ser menores que 0.")
		return
	end if	
	If d_filtro.getitemnumber(1,"nro_desc_hasta") = 0  and d_filtro.getitemnumber(1,"nro_desc_desde") <> 0  then
		d_filtro.setitem(1,"nro_desc_hasta", d_filtro.getitemnumber(1,"nro_desc_desde"))
	end if	
	If d_filtro.getitemnumber(1,"nro_desc_desde") = 0  and d_filtro.getitemnumber(1,"nro_desc_hasta") <> 0  then
	  if d_filtro.getitemnumber(1,"nro_desc_hasta") > 100 then
		  d_filtro.setitem(1,"nro_desc_desde", d_filtro.getitemnumber(1,"nro_desc_hasta"))
	  else
		  d_filtro.setitem(1,"nro_desc_desde", 1)
	  end if
	end if	
	If d_filtro.getitemnumber(1,"nro_desc_hasta") - d_filtro.getitemnumber(1,"nro_desc_desde") > 100 then
		d_filtro.setitem(1,"nro_desc_hasta", d_filtro.getitemnumber(1,"nro_desc_desde") + 100)
	end if	
	If d_filtro.getitemnumber(1,"nro_desc_hasta") < d_filtro.getitemnumber(1,"nro_desc_desde") then
		messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de incidencias no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
		return
	end if
	
	/////////////////////////////////////////////////////////////
	// Correcci$$HEX1$$f300$$ENDHEX$$n de la b$$HEX1$$fa00$$ENDHEX$$squeda por n$$HEX1$$fa00$$ENDHEX$$mero de descargo (SGO)
	//obtengo el rango de las fechas de solicitud.
	datetime ldt_f_actual, ldt_nula
	
	ldt_f_actual = fgnu_fecha_actual()
	setnull(ldt_nula)
	if d_filtro.getitemnumber(1,"nro_desc_desde") > 0 then
		d_deteccion.object.desde[1] = ldt_nula
		d_deteccion.object.hasta[1] = ldt_f_actual
//		d_filtro.object.ai_estado_descargo[1] = fgci_todos
		d_filtro.object.ai_alcance[1] = fgci_todos
		d_filtro.object.ai_interrup[1] = fgci_todos
		dw_desc_descargo.object.pi_desc_descargo[1]=fgci_todos
		lb_grupo_descargo=false
	end if
	
	idt_fecha_desde=d_deteccion.GetItemDateTime(1,"desde")
	idt_fecha_hasta=d_deteccion.GetItemDateTime(1,"hasta")

	IF isnull(idt_fecha_desde) THEN
		idt_fecha_desde=DateTime(Date("01/01/1900"))
	end if

	if idt_fecha_desde >= idt_fecha_hasta then
		 gnv_msg.f_mensaje("EI26","","",OK!)
		 //messagebox("Error","Las fechas no son correctas")
		 return
	end if
	// Fin correcci$$HEX1$$f300$$ENDHEX$$n (SGO)
	////////////////////////////////////////////////////////////
	
	is_clausula_where = " "
	//Compongo el filtro para el ambito
	li_centro = dw_ambito.object.nro_centro[1]
	IF li_centro <> fgci_todos THEN
		ls_filtro= " WHERE (DESCARGOS_HIST.NRO_CENTRO = " + string(li_centro) + ")"
	ELSE
		ls_filtro= " WHERE (DESCARGOS_HIST.NRO_CENTRO > 0 )"
	END IF
	
	li_cmd = dw_ambito.object.nro_cmd[1]
	IF li_cmd <> fgci_todos THEN
		ls_filtro=ls_filtro+" and (DESCARGOS_HIST.NRO_CMD = " + string(li_cmd)+ " )"
	ELSE
		ls_filtro=ls_filtro+" and (DESCARGOS_HIST.NRO_CMD > 0 )"	
	END IF
	
	li_puesto = dw_ambito.object.nro_mesa[1]
	IF li_puesto <> fgci_todos THEN
		ls_filtro=ls_filtro+"and (DESCARGOS_HIST.NRO_MESA = " + string(li_puesto) + ")"
	ELSE
		ls_filtro=ls_filtro+"and (DESCARGOS_HIST.NRO_MESA > 0 )"
	END IF	

	is_filtro_nro_desc_desde_hasta = d_filtro.fnu_filtro_nro_descargo_hist()		
// Modificado por Sgo. Mejora 1/370503 - Moldavia. 18/08/2005.
//	is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_2(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) 
	If gi_pais = 8 Then
		is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_descargo_historic_2(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) 
	Else
		// Creado por Sgo. Se olvid$$HEX2$$f3002000$$ENDHEX$$(LFE Mejora 1/275744: B$$HEX1$$fa00$$ENDHEX$$squeda Descargos (Hist$$HEX1$$f300$$ENDHEX$$rico). Se sustituye F_SOLICITADO por F_INI_SOLICITADO y por F_FIN_SOLICITADO)
		is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_descargo_historico(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) 
	End If
// Fin. Sgo.
	is_filtro_descargo = d_filtro.fnu_filtrar_descargos_hist()

	IF is_filtro_deteccion <> "" THEN
// Modificado por Sgo. Mejora 1/370503 - Moldavia. 18/08/2005.
//		is_filtro_deteccion = fg_remplaza(is_filtro_deteccion,'SGD_INCIDENCIA.f_deteccion','DESCARGOS_HIST.F_SOLICITADO')
		is_filtro_deteccion = fg_remplaza(is_filtro_deteccion,'SGD_DESCARGOS','DESCARGOS_HIST')
// Fin Sgo.
	END IF

   if ls_filtro <> "" then
		IF is_clausula_where <> " " THEN
			is_clausula_where = is_clausula_where + " and " + ls_filtro 
		ELSE
			is_clausula_where = ls_filtro 
		END IF
	end if
		
	if is_filtro_alimentacion <> "" then
		IF is_clausula_where <> " " THEN
			is_clausula_where = is_clausula_where +" AND "+ is_filtro_alimentacion
		ELSE
			is_clausula_where = Is_filtro_alimentacion
		END IF
		
	end if
// Comentado por Sgo. Optimizaci$$HEX1$$f300$$ENDHEX$$n de C$$HEX1$$f300$$ENDHEX$$digo. Se implementa 10 l$$HEX1$$ed00$$ENDHEX$$neas m$$HEX1$$e100$$ENDHEX$$s abajo. 19/08/2005.
//	if is_filtro_nro_incid_desde_hasta = "" then   // si es numero incidencias desde y hasta no utilisar fechas
//		if is_filtro_deteccion <> ""  then
//			is_clausula_where = is_clausula_where +" AND "+ is_filtro_deteccion 
//    		end if
//	end if
// Fin. Sgo.
	
	if is_filtro_nro_desc_desde_hasta <> "" then
		IF is_filtro_deteccion = ""  THEN
			
		ELSE
		
			IF is_clausula_where <> " " THEN		
				is_clausula_where = is_clausula_where + " and " + is_filtro_nro_desc_desde_hasta
			ELSE
				is_clausula_where = is_filtro_nro_incid_desde_hasta
			END IF
		END IF
	end if

// Modificaci$$HEX1$$f300$$ENDHEX$$n de Sgo. Optimizaci$$HEX1$$f300$$ENDHEX$$n de c$$HEX1$$f300$$ENDHEX$$digo. 19/08/2005.
//	if is_filtro_nro_desc_desde_hasta = "" then   // si es numero incidencias desde y hasta no utilisar fechas
//		if is_filtro_deteccion <> ""  then
//			IF is_clausula_where <> " " THEN			
//				is_clausula_where = is_clausula_where +" AND "+ is_filtro_deteccion 
//			ELSE
//				is_clausula_where = is_filtro_deteccion
//			END IF
//		
//  		end if
//	end if
	if is_filtro_nro_desc_desde_hasta = "" and is_filtro_nro_incid_desde_hasta = "" then   // si es numero incidencias desde y hasta no utilisar fechas
		if is_filtro_deteccion <> ""  then
			IF is_clausula_where <> " " THEN			
				is_clausula_where = is_clausula_where +" AND "+ is_filtro_deteccion 
			ELSE
				is_clausula_where = is_filtro_deteccion
			END IF
		
  		end if
	end if
// Fin. Sgo.
			
	IF is_filtro_descargo <> "" THEN
		IF is_clausula_where <> " " THEN					
			is_clausula_where = is_clausula_where + " AND " + is_filtro_descargo
		ELSE
			is_clausula_where = is_filtro_descargo
		END IF
		
	END IF
	
	
	ls_operacion= d_filtro.object.operacion[1]
	li_tiempo= d_filtro.object.tiempo[1]
	li_duracion=d_filtro.getitemnumber(1,"ai_duracion")

	ls_duracion= string(li_duracion)
	if li_tiempo=2 then
		ls_duracion= string(li_duracion*60)
	elseif li_tiempo=3 then
		ls_duracion= string(li_duracion*60*24)

	end if
	
	if li_duracion > 0 then 
		ls_filtro_duracion = "CL_DURACION " + ls_operacion + " " + ls_duracion
		is_clausula_where = is_clausula_where + " AND " + ls_filtro_duracion
	end if

	if fg_verifica_parametro("descripcion descargos") then
		ll_desc_descargo= dw_desc_descargo.object.pi_desc_descargo[1]
		IF ll_desc_descargo <> fgci_todos THEN
			is_clausula_where += " AND DESCARGOS_HIST.DESCRIPCION = '" + string(ll_desc_descargo) + "'"
		END IF
	end if
	
	// GNU 6-3-2007. Mejora 1/510515
	if fg_verifica_parametro("grupo descargo") and lb_grupo_descargo then
		if rb_1.checked= true then
			is_clausula_where += " and DESCARGOS_HIST. GRUPO_DESCARGO = 1 "
		else
			is_clausula_where += " and DESCARGOS_HIST. GRUPO_DESCARGO = 2 "
		end if
	end if
	// FIN GNU
	
	where_clause = is_clausula_where
end if

//AHM (28/02/2008)
//mod_string = original_select + where_clause 
mod_string = original_select + fg_remplaza(where_clause,'GI_HIST_INCIDENCIAS','SGD_INCIDENCIA') 
mod_string = fg_remplaza(mod_string,"~~" + '"','')

dw_lista.Object.DataWindow.Table.Select= mod_string
//rc = dw_lista.Modify(mod_string)
dw_lista.SetTransObject(SQLCA)	
this.triggerevent("ue_retrieve")
end event

event ue_retrieve();string ls_operacion, ls_filtro_duracion
int li_tiempo, li_fila_actual, li_interrup
string ls_duracion,ls_titulo
int li_duracion, li_estado, li_alcance
datetime ldt_desde, ldt_hasta
long ll_longitud, ll_total
setpointer(HourGlass!)
//datetime ldt_fecha_desde, ldt_fecha_hasta
m_hist_inc_desc lm_menu

lm_menu = This.MenuId

dw_lista.setredraw(false)
dw_lista.reset()

il_fila_desde = 1

if lu_comunic.is_comunic.programa_llamante = "Hist_Inci"  then
	li_alcance = dw_filtro.GetITemNumber(1,'ai_suministro')
	lm_menu.m_consultar.m_datosanulacion.visible = true
	lm_menu.m_consultar.m_datosanulacion.enabled = false
	IF li_alcance <> fgci_incidencia_reenganche THEN
		ls_operacion= dw_filtro.object.operacion[1]
		li_tiempo= dw_filtro.object.tiempo[1]
		li_duracion=dw_filtro.getitemnumber(1,"ai_duracion")
	
		dw_lista.retrieve()
		IF NOT IsValid(This) Then Return
		dw_lista.TriggerEvent("scrollvertical")
		dw_lista.setfilter("")
		dw_lista.filter()
	
	//	ls_duracion= string(li_duracion)
	//	if li_tiempo=2 then
	//		ls_duracion= string(li_duracion*60)
	//	elseif li_tiempo=3 then
	//		ls_duracion= string(li_duracion*60*24)
	//	end if
	//	
	//	if li_duracion > 0 then 
	//		dw_lista.setfilter("cll_duracion " + ls_operacion + " " + ls_duracion)
	//		dw_lista.filter()
	//		dw_lista.filteredcount()
	//	end if
		ls_titulo = 'Lista de Incidencias'
	ELSE
		dw_lista.retrieve()
		IF NOT IsValid(This) Then Return
		ls_titulo = 'Lista de reenganches'
	END IF
elseif lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then
////////////////////////////////////////////////////////////////////////
// Comentado por SGO para corregir la b$$HEX1$$fa00$$ENDHEX$$squeda por n$$HEX1$$fa00$$ENDHEX$$mero de descargo
//	ldt_fecha_desde= d_deteccion.getitemdatetime(d_deteccion.getrow(),"desde")
//	ldt_fecha_hasta=d_deteccion.getitemdatetime(d_deteccion.getrow(),"hasta")
	lm_menu.m_consultar.m_datosanulacion.visible = false
//	if isnull(ldt_fecha_desde) or isnull(ldt_fecha_hasta) then 
//		gnv_msg.f_mensaje("EG23","","",OK!)
//		return
//	end if	
// Fin correcci$$HEX1$$f300$$ENDHEX$$n (SGO)

	dw_lista.retrieve()	
	IF NOT IsValid(This) Then Return
	dw_lista.TriggerEvent("scrollvertical")
	
	d_filtro.Accepttext()
	ls_titulo = 'Lista de Descargos'	
end if


dw_lista.setredraw(true)
ll_total = dw_lista.rowcount()
if ll_total = 0 then
	dw_filtro.setitem(dw_filtro.getrow(),'ai_reg_seleccionados',0)
	sle_1.text='0' // GNU 6-4-2006. Incidencia 0/421752
	gnv_msg.F_mensaje("AB02","","",oK!)	
else
	dw_filtro.setitem(dw_filtro.getrow(),'ai_reg_seleccionados',dw_lista.rowcount())
	sle_1.text=string(dw_lista.rowcount()) // GNU 6-4-2006. Incidencia 0/421752
	if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
		IF li_alcance <> fgci_incidencia_reenganche THEN
			lm_menu.m_consultar.m_consultaincidencia.enabled = true
	
			li_fila_actual = dw_lista.GetRow()
			
		END IF
	elseif lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then

	end if
	lm_menu.m_editar.m_iralcomienzo.enabled = true
	lm_menu.m_editar.m_iralfinal.enabled = true
end if

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o

ll_longitud = len (ls_titulo)*100

//Inserto las fechas, si son nulas visualizo el texto 00/00/0000 00:00:00
ldt_desde = d_deteccion.GetItemDatetime(1,'desde')
IF IsNull(ldt_desde) THEN 
	dw_1.modify("nulo_desde.visible = '1'")
	dw_1.modify("f_desde.visible='0'")
	dw_2.modify("nulo_desde.visible = '1'")
	dw_2.modify("f_desde.visible='0'")
ELSE
	dw_1.modify("nulo_desde.visible = '0'")
	dw_1.modify("f_desde.visible='1'")
	dw_2.modify("nulo_desde.visible = '0'")
	dw_2.modify("f_desde.visible='1'")		
END IF
ldt_hasta = d_deteccion.GetItemDatetime(1,'hasta')
IF IsNull(ldt_hasta) THEN 
	dw_1.modify("nulo_hasta.visible = '1'")
	dw_1.modify("f_hasta.visible='0'")
	dw_2.modify("nulo_hasta.visible = '1'")
	dw_2.modify("f_hasta.visible='0'")
ELSE
	dw_1.modify("nulo_hasta.visible = '0'")
	dw_1.modify("f_hasta.visible='1'")
	dw_2.modify("nulo_hasta.visible = '0'")
	dw_2.modify("f_hasta.visible='1'")	
END IF
// si no son nulas las inserto
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
dw_2.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_2.modify("titulo_t.Text = '" + ls_titulo + "'")
dw_2.modify("f_desde.text = '" + string(ldt_desde) + "'")
dw_2.modify("f_hasta.text = '" + string(ldt_hasta) + "'")

DataWindowChild dw_a, dw_b

if dw_lista.rowcount() > 0 and lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
	IF gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and FW_SE_PUEDE_anular(dw_lista.GetItemNumber(li_fila_actual, 'tip_incidencia'),&
		dw_lista.GetItemNumber(li_fila_actual, 'sgd_incidencia_alcance'),dw_lista.GetItemNumber(li_fila_actual, 'est_actual'))	then 
		If Not ib_selected Then
			lm_menu.m_editar.m_anularincidencias.enabled = true
		end if
	else
		If Not ib_selected Then
			lm_menu.m_editar.m_anularincidencias.enabled = false
		else
			lm_menu.m_editar.m_anularincidencias.enabled = true
		end if
	end if
	
	if gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and dw_lista.GetItemNumber(li_fila_actual, 'est_actual')= fgci_estado_anulado and dw_lista.GetItemNumber(li_fila_actual, 'ind_anulacion_sgi')= 1 then //ANULACION SGI
		If Not ib_selected Then
				lm_menu.m_consultar.m_datosanulacion.enabled = true
				lm_menu.m_editar.m_deshaceranulacin.enabled = true
		end if
	else
		lm_menu.m_consultar.m_datosanulacion.enabled = false
		lm_menu.m_editar.m_deshaceranulacin.enabled = false
	end if
end if

//dw_1.GetChild ("d_1",dw_a)
//dw_1.GetChild ("d_1",dw_b)
//dw_lista.ShareData(dw_a)
end event

event ue_comienzo();m_hist_inc_desc lm_menu

if dw_lista.rowcount() > 0 then
	dw_lista.selectrow(0,false)
	dw_lista.selectrow(1,true)
	dw_lista.scrolltorow(1)
	
	lm_menu = This.menuid

	lm_menu.m_consultar.m_imprimir.enabled = true
	lm_menu.m_consultar.m_grafica.enabled = true
	lm_menu.m_consultar.m_consultaincidencia.enabled = true
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
	lm_menu.m_consultar.m_observaciones.enabled = true
// Fin. Sgo.

end if
end event

event ue_final();m_hist_inc_desc lm_menu
	
if dw_lista.rowcount() > 0 then
	dw_lista.selectrow(0,false)
	dw_lista.selectrow(dw_lista.rowcount(),true)
	dw_lista.scrolltorow(dw_lista.rowcount())

	lm_menu = This.menuid

	lm_menu.m_consultar.m_imprimir.enabled = true
	lm_menu.m_consultar.m_grafica.enabled = true
	lm_menu.m_consultar.m_consultaincidencia.enabled = true
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
	lm_menu.m_consultar.m_observaciones.enabled = true
// Fin. Sgo.
	
end if
end event

event ue_cons_inci;dw_lista.triggerevent(DoubleClicked!)
end event

event ue_grafica();string ls_fecha
long ll_fila = 1, ll_fila_max, ll_fila_nueva, ll_num_dias, ll_pos_order, ll_cantidad
string ls_clausula_where, ls_filtro_ambito, rc, mod_string
string original_select, ls_select_hist, ls_filtro_alimentacion
string ls_interrup, ls_alcance, ls_filtro_fecha
int 	li_interrup , li_alcance
int li_reenganche
m_hist_inc_desc lm_menu

lm_menu = This.MenuId
setpointer(HourGlass!)

d_deteccion.accepttext()

//dw_grafica.setredraw(false)
dw_grafica.reset()
idt_fecha_desde=d_deteccion.getitemdatetime(d_deteccion.getrow(),"Desde")
idt_fecha_hasta=d_deteccion.getitemdatetime(d_deteccion.getrow(),"Hasta")	

if isnull(idt_fecha_desde) then
	idt_fecha_desde = datetime(today(),now())
end if

if idt_fecha_desde >= idt_fecha_hasta then
	gnv_msg.f_mensaje("AI118","","",oK!)		
	lm_menu.m_consultar.m_grafica.checked = FALSE
	return
end if

ll_num_dias = daysafter(date(idt_fecha_desde),date(idt_fecha_hasta))

if ll_num_dias > 365 then
	gnv_msg.f_mensaje("IX13","","",oK!)		
	lm_menu.m_consultar.m_grafica.checked = FALSE
	return
elseif ll_num_dias > 31 and lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
	li_reenganche = dw_filtro.GetItemNumber(1,'ai_suministro')
	IF li_reenganche <> fgci_incidencia_reenganche THEN
		dw_datos_grafico.dataobject = 'd_2301_graf_incidencia_2'
		ls_filtro_fecha = 'mm/yyyy'
	END IF
elseif lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
	li_reenganche = dw_filtro.GetItemNumber(1,'ai_suministro')
	IF li_reenganche <> fgci_incidencia_reenganche THEN
		dw_datos_grafico.dataobject = 'd_2301_graf_incidencia'
		ls_filtro_fecha = 'dd/mm/yyyy'
	END IF
elseif ll_num_dias > 31 and lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then
	dw_datos_grafico.dataobject = 'd_2301_graf_descargo_2'
	ls_filtro_fecha = 'mm/yyyy'
elseif lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then	
	dw_datos_grafico.dataobject = 'd_2301_graf_descargo'
	ls_filtro_fecha = 'dd/mm/yyyy'
end if


dw_datos_grafico.settransobject(sqlca)


if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
	li_reenganche = dw_filtro.GetItemNumber(1,'ai_suministro')
	IF li_reenganche <> fgci_incidencia_reenganche THEN
		ls_filtro_ambito = dw_ambito.fnu_filtro_ambito_2(dw_ambito.getitemnumber(1,"nro_centro"), & 
																		 dw_ambito.getitemnumber(1,"nro_cmd") ,     &
																		 dw_ambito.getitemnumber(1,"nro_mesa"),0) 
		
		ls_filtro_Alimentacion = dw_filtro.fnu_filtrar_avisos()
		
		if ls_filtro_ambito <> "" then
			ls_clausula_where = ls_clausula_where + " and " + ls_filtro_ambito 
		end if
			
		if ls_filtro_alimentacion <> " " then
			ls_clausula_where = ls_clausula_where +" AND "+ ls_filtro_alimentacion
		end if
	END IF	
elseif lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then		

		ls_filtro_ambito = dw_ambito.fnu_filtro_ambito_2(dw_ambito.getitemnumber(1,"nro_centro"), & 
																		 dw_ambito.getitemnumber(1,"nro_cmd") ,     &
																		 dw_ambito.getitemnumber(1,"nro_mesa"),0) 
		if ls_filtro_ambito <> "" then
			ls_clausula_where = ls_clausula_where + " and " + ls_filtro_ambito 
		end if
		
		
		

	  li_alcance = d_filtro.getitemnumber(1,"ai_alcance")
	  if li_alcance > fgci_todos then
			
      ls_alcance  = ' DESCARGOS_HIST.TENSION = ' + string(li_alcance)
     	if ls_alcance  <> "" then
			ls_clausula_where = ls_clausula_where + " and " +ls_alcance 
		end if
	end if


	// El Descargo sin/con Interrupcion 
	
	li_interrup = d_filtro.getitemnumber(1,"ai_interrup")
	if li_interrup > 0 then
		 
        ls_interrup = ' DESCARGOS_HIST.IND_INTERRUPCION = ' + string(li_interrup)
        																 
		if ls_interrup <> "" then
			ls_clausula_where = ls_clausula_where + " and " + ls_interrup 
		end if
	end if
			
		
end if	

		original_select = dw_datos_grafico.Describe("DataWindow.Table.Select")

		//if li_alcance > 0 then original_select = fg_remplaza(original_select,"FROM  ", "FROM SGD_INSTALACION, ")
		
		original_select = fg_remplaza(original_select,"GROUP ", ls_clausula_where + " GROUP ")

		if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then 
			li_reenganche = dw_filtro.GetItemNumber(1,'ai_suministro')
			IF li_reenganche <> fgci_incidencia_reenganche THEN
				ls_select_hist = fw_incluir_historicos(original_select)
			END IF
		end if
		
			ll_pos_order = Pos(original_select, "ORDER ")
			original_select = Replace(original_select, ll_pos_order, Len(original_select), "")
			if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then 
				mod_string = "DataWindow.Table.Select=~""	+ original_select + 	' UNION ALL ' + ls_select_hist + "~""
			else
				original_select = fw_incluir_historicos_descargos(original_select)
				mod_string = "DataWindow.Table.Select=~""	+ original_select + "~""
			end if

		rc = dw_datos_grafico.Modify(mod_string)


dw_datos_grafico.retrieve(idt_fecha_desde,idt_fecha_hasta)

ll_fila_max = dw_datos_grafico.rowcount()

if ll_fila_max = 0 then
	lm_menu.m_consultar.m_grafica.checked = false
	gnv_msg.F_mensaje("AB02","","",oK!)		
	return
end if

if dw_datos_grafico.rowcount() = 1 then
	// Cambio de tipo grafica a barras
//	messagebox("Cambiando",dw_grafica.Describe("gr_1.Title.Dispattr.DisplayExpression"))
	dw_grafica.Object.gr_1.GraphType = 7
end if
//messagebox("Aviso",dw_grafica.Modify('gr_1.Title=~"Descargos~"'))

dw_grafica.visible = true
dw_datos_grafico.Setsort("f_deteccion A")
dw_datos_grafico.Sort()

DO
	ls_fecha = string(Date(dw_datos_grafico.getitemDatetime(ll_fila,"f_deteccion")), ls_filtro_fecha)
	// Buscamos a ver si ya hay m$$HEX1$$e100$$ENDHEX$$s datos para esa fecha, para incrementar la cantidad en
	// vez de a$$HEX1$$f100$$ENDHEX$$adir un registro nuevo
	ll_fila_nueva = dw_grafica.find("fecha=" + "'" + ls_fecha + "'", 1, dw_grafica.RowCount() )
	IF ll_fila_nueva > 0 THEN
		ll_cantidad = dw_datos_grafico.getitemnumber(ll_fila,"cantidad") + & 
						  dw_grafica.GetItemNumber(ll_fila_nueva, "cantidad")
		
		dw_grafica.setitem(ll_fila_nueva,"cantidad",ll_cantidad)
	ELSE	
		ll_fila_nueva = dw_grafica.insertrow(0)
		dw_grafica.setitem(ll_fila_nueva,"fecha",ls_fecha)
		dw_grafica.setitem(ll_fila_nueva,"cantidad",dw_datos_grafico.getitemnumber(ll_fila,"cantidad"))
	END IF

	dw_grafica.accepttext()	
	ll_fila ++
LOOP UNTIL ll_fila > ll_fila_max


lm_menu = This.menuid
lm_menu.m_consultar.m_datosanulacion.enabled = False
lm_menu.m_consultar.m_imprimir.enabled = False
lm_menu.m_consultar.m_informedeincidencias.enabled = False
lm_menu.m_consultar.m_consultaincidencia.enabled = False
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
lm_menu.m_consultar.m_observaciones.enabled = False
// Fin. Sgo.
lm_menu.m_editar.m_iralcomienzo.enabled = False
lm_menu.m_editar.m_iralfinal.enabled = False
lm_menu.m_editar.m_buscar.enabled = False

dw_grafica.setredraw(true)

end event

event ue_notgrafica();m_hist_inc_desc lm_menu

int li_estado


dw_grafica.visible = false

lm_menu = This.menuid
lm_menu.m_consultar.m_imprimir.enabled = True
lm_menu.m_consultar.m_informedeincidencias.enabled = True
lm_menu.m_consultar.m_consultaincidencia.enabled = True
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
lm_menu.m_consultar.m_observaciones.enabled = True
// Fin. Sgo.
lm_menu.m_editar.m_iralcomienzo.enabled = true
lm_menu.m_editar.m_iralfinal.enabled = true
lm_menu.m_editar.m_buscar.enabled = True
lm_menu.m_consultar.m_datosanulacion.enabled = false

IF dw_lista.RowCount() > 0 THEN

	dw_lista.selectrow(0,false)
	dw_lista.selectrow(1,true)
	dw_lista.scrolltorow(1)
	
	if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
		li_estado = dw_lista.GetItemNumber(1,'est_actual')
		IF li_estado = fgci_estado_anulado THEN lm_menu.m_consultar.m_datosanulacion.enabled = true
	end if
END IF
end event

event ue_imp_reporte_inc;//***************************************
//**  OSGI 2001.1  	20/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_row, ll_i, ll_nro_incidencia[]
s_reporte_inc_aviso lstr_reporte_inc_aviso
int li_reenganche

li_reenganche = dw_filtro.GetItemNumber(1,'ai_suministro')
IF li_reenganche <> fgci_incidencia_reenganche THEN
	
	lstr_reporte_inc_aviso.i_reporte = 1
	ll_row = dw_lista.GetSelectedRow(0)
	
	DO WHILE ll_row > 0
		ll_i++
		
		lstr_reporte_inc_aviso.l_nro_inc_aviso[ll_i] = dw_lista.GetItemNumber(ll_row, "nro_incidencia")
		
		ll_row = dw_lista.GetSelectedRow(ll_row)	
	LOOP
	
	lstr_reporte_inc_aviso.s_opcion_menu = "Hist_Inci"
	
	If UpperBound(lstr_reporte_inc_aviso.l_nro_inc_aviso) > 0 Then OpenSheetWithParm(w_re_inc_avisos, lstr_reporte_inc_aviso, w_operaciones, 8, Layered!)
END IF
//***************************************
//**  OSGI 2001.1  	20/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_consultar_anulacion;long  ll_row 

ll_row = dw_lista.GetSelectedRow(0)
if ll_row>0 then 
			gu_comunic.is_comunic.Accion_llamada= "Consulta" 
			gu_comunic.is_comunic.intval1 =dw_lista.getitemnumber(ll_row,"cod_motivo")
			if gu_comunic.is_comunic.intval1 = 0 or isnull(gu_comunic.is_comunic.intval1) then 
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", " La incidencia seleccionada carece de datos de anulaci$$HEX1$$f300$$ENDHEX$$n")
			else
				gu_comunic.is_comunic.strval1= dw_lista.getitemstring(ll_row,"usuario_anulacion")
				gu_comunic.is_comunic.strval2= dw_lista.getitemstring(ll_row,"descripcion_motivo")
				gu_comunic.is_comunic.datval1= dw_lista.getitemdatetime(ll_row,"fecha_anulacion")
				open(w_anular_incidencias)
			end if
end if
end event

event ue_agrupacion;int li_fila
long ll_nro_agrup, ll_num

li_fila = dw_lista.GetRow()
IF li_fila > 0 THEN
	SetPointer(HourGlass!)
	
	// Si la incidencia est$$HEX2$$e1002000$$ENDHEX$$en hist$$HEX1$$f300$$ENDHEX$$ricos no se permite la agrupaci$$HEX1$$f300$$ENDHEX$$n
	
	gu_comunic.is_comunic.longval3 = dw_lista.getitemnumber(li_fila,"nro_incidencia")
	
	SELECT COUNT(*)
	INTO :ll_num
	FROM GI_HIST_INCIDENCIAS
	WHERE NRO_INCIDENCIA = :gu_comunic.is_comunic.longval3;
	
	IF SQLCA.SQLCode = 0 AND ll_num = 0 THEN
   
		gu_comunic.is_comunic.accion_llamada="Seleccion"
		gu_comunic.is_comunic.programa_llamante="w_2301_hist_inc_desc" 
			
		gu_comunic.is_comunic.longval4 = dw_lista.getitemnumber(li_fila,"nro_inst_afectada")	
		gu_comunic.is_comunic.intval4 = dw_lista.getitemnumber(li_fila,"est_actual")	
		gu_comunic.is_comunic.intval5 = dw_lista.getitemnumber(li_fila,"tip_incidencia")	
		gu_comunic.is_comunic.intval6 = dw_lista.getitemnumber(li_fila,"sgd_incidencia_alcance")	
		gu_comunic.is_comunic.intval7 = dw_lista.getitemnumber(li_fila,"nro_centro")
		gu_comunic.is_comunic.intval8 = dw_lista.getitemnumber(li_fila,"nro_cmd") 
		gu_comunic.is_comunic.intval9 = dw_lista.getitemnumber(li_fila,"nro_mesa")
		gu_comunic.is_comunic.datval3 = dw_lista.getitemdatetime(li_fila,"f_deteccion")
		gu_comunic.is_comunic.strval1 = dw_lista.getitemString(li_fila,"nombre_instalacion")
		 
		IF gu_comunic.is_comunic.longval3 <> 0 THEN
			// Se comprueba si otro usuario ha agrupado la incidencia y no nos hemos
			// enterado
		
			SELECT NVL(NRO_AGRUPACION,0)
			INTO :ll_nro_agrup
			FROM SGD_INCIDENCIA
			WHERE NRO_INCIDENCIA = :gu_comunic.is_comunic.longval3;
			
			IF SQLCA.SQLCode = 0 THEN
				IF ll_nro_agrup <> dw_lista.getitemnumber(li_fila,"sgd_incidencia_nro_agrupacion")	 THEN
					//La incidencia ya ha sido agrupada por otro usuario
					gnv_msg.f_mensaje("EI44","","",OK!)
					dw_lista.dbcancel()
					dw_lista.reset()
					
					this.triggerevent("ue_armar_sql")
				ELSE
					open(w_agrupacion_incidencias)
				END IF
			ELSE
				//La incidencia ha sido modificada por otro usuario
				gnv_msg.f_mensaje("EI44","","",OK!)
			END IF
		END IF
	ELSE
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se permite realizar esta acci$$HEX1$$f300$$ENDHEX$$n debido a que la incidencia se encuentra en hist$$HEX1$$f300$$ENDHEX$$ricos.")
	END IF
END IF
end event

event ue_desagrupacion;int li_fila
long ll_nro_agrup, ll_num

li_fila = dw_lista.GetRow()

IF li_fila > 0 THEN
	SetPointer(HourGlass!)

	gu_comunic.is_comunic.longval3 =  dw_lista.getitemnumber(li_fila,"nro_incidencia")	
	
	SELECT COUNT(*)
	INTO :ll_num
	FROM GI_HIST_INCIDENCIAS
	WHERE NRO_INCIDENCIA = :gu_comunic.is_comunic.longval3;
	
	IF SQLCA.SQLCode = 0 AND ll_num = 0 THEN
		gu_comunic.is_comunic.accion_llamada="Seleccion"
		gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
		
		IF gu_comunic.is_comunic.longval3 <> 0 THEN
			// Se comprueba si otro usuario ha desagrupado la incidencia y no nos hemos
			// enterado
			SELECT NRO_AGRUPACION
			INTO :ll_nro_agrup
			FROM SGD_INCIDENCIA
			WHERE NRO_INCIDENCIA = :gu_comunic.is_comunic.longval3;
			
			IF SQLCA.SQLCode = 0 THEN
				IF ll_nro_agrup > 0 THEN
					gu_comunic.is_comunic.longval4 = ll_nro_agrup
					gu_comunic.is_comunic.intval4 = dw_lista.getitemnumber(li_fila,"est_actual")	
					open(w_desagrupacion_incidencias)	
					
				ELSE
					//La incidencia ya ha sido desagrupada por otro usuario
					gnv_msg.f_mensaje("EI46","","",OK!)
					dw_lista.dbcancel()
					dw_lista.reset()
					this.triggerevent("ue_armar_sql")
				END IF
			ELSE
				//La incidencia ha sido modificada por otro usuario
				gnv_msg.f_mensaje("EI45","","",OK!)
			END IF
		END IF
	ELSE
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se permite realizar esta acci$$HEX1$$f300$$ENDHEX$$n debido a que la incidencia se encuentra en hist$$HEX1$$f300$$ENDHEX$$ricos.")
	END IF
END IF
end event

event ue_anulacion;long  ll_row, ll_cod_anulacion , ll_contador
string ls_usuario_anulacion, ls_descripcion
datetime ld_fecha_anulacion


datetime ldt_fecha_desde,	ldt_fecha_hasta	
date	ldt_fecha_desdes	, 	ldt_fecha_hastas

u_anular_incidencias lu_tratar_anulacion

ll_row = dw_lista.GetSelectedRow(0) 

if ll_row > 0 then 

			gu_comunic.is_comunic.Accion_llamada= "Mantenimiento" 
			gu_comunic.is_comunic.strval1 = gs_usuario
			gu_comunic.is_comunic.datval1 = fgnu_fecha_Actual()
			open(w_anular_incidencias)
			if	gu_comunic.is_comunic.intval1 = -1 then // SIN CAMBIOS
			  //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", " Debe seleccionar el motivo de la anulaci$$HEX1$$f300$$ENDHEX$$n", Information!)
			  return
			else
				 ll_cod_anulacion = gu_comunic.is_comunic.intval1
				 ls_usuario_anulacion = gu_comunic.is_comunic.strval1
				 ls_descripcion = gu_comunic.is_comunic.strval2
				 ld_fecha_anulacion = gu_comunic.is_comunic.datval1
			end if



lu_tratar_anulacion= create u_anular_incidencias 



lu_tratar_anulacion.of_cargar_datos_motivo(ll_cod_anulacion,ls_usuario_anulacion, ld_fecha_anulacion,ls_descripcion)

// CARGAMOS LAS INCIDENCIAS SELECCIONADAS

ll_contador = 0
ll_row = dw_lista.GetSelectedRow(0)

DO WHILE ll_row > 0

	lu_tratar_anulacion.of_cargar_incidencia(dw_lista.GetItemNumber(ll_row, "nro_incidencia"))
	ll_row = dw_lista.GetSelectedRow(ll_row)	
LOOP

setpointer(hourglass!)
lu_tratar_anulacion.of_ejecuta_anulacion()


destroy lu_tratar_anulacion


// REFRESCAMOS LA VENTANA
li_primera_vez= 0
this.triggerevent("ue_armar_sql")

setpointer(arrow!)

end if









end event

event ue_desanular;long  ll_row, ll_nro_incidencia    



u_anular_incidencias lu_tratar_anulacion

ll_row = dw_lista.GetSelectedRow(0) 

if ll_row > 0 then 

lu_tratar_anulacion= create u_anular_incidencias 

ll_nro_incidencia = dw_lista.GetItemNumber(ll_row, "nro_incidencia")

lu_tratar_anulacion.of_revoca_anulacion(ll_nro_incidencia)



destroy lu_tratar_anulacion

setpointer(hourglass!)
// REFRESCAMOS LA VENTANA
li_primera_vez= 0
this.triggerevent("ue_armar_sql")

setpointer(arrow!)

end if

end event

event ue_observaciones();// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. 05/10/2004. Unificaci$$HEX1$$f300$$ENDHEX$$n.
long ll_nro_incidencia,ll_fila_select
int li_estado

If lu_comunic.is_comunic.programa_llamante = "Hist_Inci" Then
	SetPointer(HourGlass!)
	
	ll_fila_select = dw_lista.GetSelectedRow(0) 
	IF dw_lista.RowCount() > 0 AND ll_fila_select > 0 THEN
	
		ll_nro_incidencia = dw_lista.GetitemNumber(ll_fila_select,"nro_incidencia")
		li_estado = dw_lista.getitemnumber(ll_fila_select,"est_actual")
	
		gu_comunic.is_comunic = lu_comunic.is_comunic		
		gu_comunic.is_comunic.strval1 = dw_lista.GetItemString(ll_fila_select,"observacion")
		gu_comunic.is_comunic.Accion_llamada = "Consulta"		
		gu_comunic.is_comunic.longval3 = ll_nro_incidencia
		gu_comunic.is_comunic.longval2 = ll_fila_select

		Open(w_2302_observaciones_incidencia)

	END IF
End If
// Fin. Sgo.
end event

public function string fw_incluir_historicos (string ps_select);string ls_select_hist, ls_tabla_original, ls_nueva_tabla, ls_plsql_orig, ls_plsql_nuevo
long ll_start_pos=1

ls_select_hist = ps_select

ls_tabla_original = "SGD_INCIDENCIA"
ls_nueva_tabla = "GI_HIST_INCIDENCIAS"

// Se obtiene la primera aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos)
// Only enter the loop if you find old_str.
DO WHILE ll_start_pos > 0
	// Se sustituye la aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ls_select_hist = Replace(ls_select_hist, ll_start_pos, Len(ls_tabla_original), ls_nueva_tabla)
	// Se busca la siguiente aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos + Len(ls_nueva_tabla))

LOOP

// Se sustituye el nombre del plsql que obtiene el nombre de la brigada/contrata
ls_plsql_orig = "Fgci_Nombre_Ot"
ls_plsql_nuevo = "Fgci_Hist_Nombre_Ot"

// Se obtiene la posici$$HEX1$$f300$$ENDHEX$$n del plsql
ll_start_pos = Pos(ls_select_hist, ls_plsql_orig, 1)
IF ll_start_pos > 0 THEN
	// se sustituye el plsql
	ls_select_hist = Replace(ls_select_hist, ll_start_pos, Len(ls_plsql_orig), ls_plsql_nuevo)
END IF

return ls_select_hist
end function

public function string fw_incluir_historicos_descargos (string ps_select);string ls_select_hist, ls_tabla_original, ls_nueva_tabla
long ll_start_pos=1


ls_select_hist = ps_select

ls_tabla_original = "SGD_INCIDENCIA"
ls_nueva_tabla = "GI_HIST_INCIDENCIAS"


// Se obtiene la primera aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
ll_start_pos = Pos(ls_select_hist, ls_nueva_tabla, ll_start_pos)
ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos)
// Only enter the loop if you find old_str.
DO WHILE ll_start_pos > 0
	// Se sustituye la aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ls_select_hist = Replace(ls_select_hist, ll_start_pos, Len(ls_tabla_original), ls_nueva_tabla)
	// Se busca la siguiente aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos + Len(ls_nueva_tabla))
LOOP


return ls_select_hist


end function

public subroutine fw_rowfocuschanged (readonly long al_row);////***************************************
////**  OSGI 2001.1  	20/03/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
//If Not ib_clicked Then
//	If KeyDown(KeyShift!) And lu_comunic.is_comunic.programa_llamante = "Hist_Inci" Then
////		st_1.Text = 'Shift '
//	
//		If KeyDown(KeyDownArrow!) Then
//			il_row_click = al_row
//			
//		st_111.Text = String(al_row)
//			If dw_lista.IsSelected(al_row) Then
//				dw_lista.SelectRow(al_row - 1, False)
//			Else
//				dw_lista.SelectRow(al_row, True)
//			End If
//		End If
//	
//		If KeyDown(KeyUpArrow!) Then
//			il_row_click = al_row
//			
//			If dw_lista.IsSelected(al_row) Then
//				dw_lista.SelectRow(al_row + 1, False)
//			Else
//				dw_lista.SelectRow(al_row, True)
//			End If
//		End If
//	ElseIf KeyDown(KeyControl!) And lu_comunic.is_comunic.programa_llamante = "Hist_Inci" Then
////		st_1.Text = 'Control '
//	
//		If KeyDown(KeyDownArrow!) Then
////			st_1.Text += 'If'
//			il_row_click = al_row
//	
//			dw_lista.SelectRow(0, False)
//			dw_lista.SelectRow(al_row, True)
//		ElseIf KeyDown(KeyUpArrow!) Then
////			st_1.Text += 'ElseIf'
//			il_row_click = al_row
//	
//			dw_lista.SelectRow(0, False)
//			dw_lista.SelectRow(al_row, True)
//		Else
////			If dw_lista.IsSelected(al_row) Then
////				il_row_click = al_row
////				dw_lista.SelectRow(al_row, False)
////	//			st_1.Text = String(dw_lista.GetSelectedRow(0))
////				st_1.Text += 'Else 1 - ' + String(al_row)
////	
////				If dw_lista.GetSelectedRow(0) <= 0 Then
////					dw_lista.SelectRow(al_row, True)
////				End If
////			Else
////				st_1.Text += 'Else 2 - ' + String(al_row)
////				il_row_click = al_row
////	
////				dw_lista.SelectRow(al_row, True)
////			End If
//		End If
//	Else
////		st_1.Text = 'Ultimo '
//		
////		il_row_click = al_row
//		dw_lista.SelectRow(0, False)
//		dw_lista.SelectRow(al_row, True)
//	End If
//
////	MessageBox("ib_clicked", ib_clicked)
////	If Not ib_clicked Then 
//		fw_valida_multiple(dw_lista, al_row)
//	
//	
////	If Not ib_selected Then
////		MessageBox("1 " + String(al_row), dw_lista.GetItemNumber(al_row, 'sgd_incidencia_alcance'))
////		MessageBox("2 " + String(al_row), dw_lista.GetItemNumber(al_row, 'sgd_incidencia_nro_agrupacion'))
////		
////		fw_validacion_menu(dw_lista.GetItemNumber(al_row, 'sgd_incidencia_alcance'), dw_lista.GetItemNumber(al_row, 'sgd_incidencia_nro_agrupacion'))
////	End If
//End If
//
//
//
//ib_clicked = False
////***************************************
////**  OSGI 2001.1  	20/03/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
end subroutine

public subroutine fw_valida_multiple (datawindow adw_dataw, readonly long al_row);Long ll_selected, ll_i, ll_rowcount
Integer li_selected
int li_alcance


ib_selected = False
ll_selected = 0
ll_rowcount = adw_dataw.RowCount()

For ll_i = 1 To ll_rowcount
   If adw_dataw.IsSelected(ll_i) Then
		li_selected++
		ll_selected = ll_i
	End If

   If li_selected > 1 Then
		ib_selected = True
		Exit
	End If
Next

If li_selected = 0 Then
	adw_dataw.SelectRow(al_row, True)
End If


adw_dataw.SetReDraw(True)
ib_clicked = True


If not ib_selected Then
	If ll_selected < 1 Then Return
	
	//row = ll_return_selected
	ib_clicked = False
	
//	MessageBox("ll_selected", ll_selected)
	adw_dataw.ScrollToRow(ll_selected)
	
//	MessageBox("1 " + String(ll_selected), dw_lista.GetItemNumber(ll_selected, 'sgd_incidencia_alcance'))
//	MessageBox("2 " + String(ll_selected), dw_lista.GetItemNumber(ll_selected, 'sgd_incidencia_nro_agrupacion'))
	
	
End If

//Return ll_selected
end subroutine

public function long fw_clicked (datawindow adw_dataw, readonly long row);//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
////////////////////////////////////////////////////////////////////////////////////////////////
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
Long ll_i, ll_rowcount, ll_last_selected, ll_is_selected
Integer li_step



ll_rowcount = adw_dataw.RowCount()
adw_dataw.SetReDraw(False)

If IsNull(il_row_click) Or il_row_click < 0 Then il_row_click = 1

//If ib_clicked_row And ib_clicked_row Then Return 0

If row > 0 Then
	If KeyDown(KeyControl!) And Not ( KeyDown(KeyUpArrow!) Or KeyDown(KeyDownArrow!) ) Then
		If adw_dataw.IsSelected(row) Then
			adw_dataw.SelectRow(row, False)
			il_selected_rows --
		Else
			adw_dataw.SelectRow(row, True)
			il_selected_rows ++
		End If
	   il_row_click = row /////
	ElseIf KeyDown(KeyShift!) And KeyDown(KeyUpArrow!) Then
		If row = il_row_click Then
			If Not adw_dataw.IsSelected(row) Then
				adw_dataw.SelectRow((row), True)
				il_selected_rows ++
			End If
			adw_dataw.SelectRow((row + 1), False)
			il_selected_rows --
		ElseIf row < il_row_click Then
			adw_dataw.SelectRow((row), True)
			il_selected_rows ++
		Else
			adw_dataw.SelectRow((row + 1), False)
			il_selected_rows --
		End If
	ElseIf KeyDown(KeyShift!) And KeyDown(KeyDownArrow!) Then
		If row = il_row_click Then
			If Not adw_dataw.IsSelected(row) Then
				adw_dataw.SelectRow((row), True)
				il_selected_rows ++
			End If
			adw_dataw.SelectRow((row - 1), False)
			il_selected_rows --
		ElseIf row < il_row_click Then
			adw_dataw.SelectRow((row - 1), False)
			il_selected_rows --
		Else
			adw_dataw.SelectRow((row), True)
			il_selected_rows ++
		End If

	ElseIf KeyDown(KeyShift!) Then		
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
End If

//ib_selected = False
//ll_last_selected = 0
//
//For ll_i = 1 To ll_rowcount
//   If adw_dataw.IsSelected(ll_i) Then
//		ll_is_selected++
//		ll_last_selected = ll_i
//	End If
//
//   If ll_is_selected > 1 Then
//		ib_selected = True
//		Exit
//	End If
//Next
//
//
//
//If ll_is_selected <= 1 Then
//	If ll_is_selected = 0 Then	adw_dataw.SelectRow(row, True)
//	il_row_click = ll_last_selected
//End If

adw_dataw.SetReDraw(True)


fw_valida_multiple(adw_dataw, row)


m_hist_inc_desc lm_menu


lm_menu = This.menuid



If ib_selected Then

lm_menu.m_consultar.m_datosanulacion.enabled = False
lm_menu.m_consultar.m_imprimir.enabled = False
lm_menu.m_consultar.m_grafica.enabled = False
lm_menu.m_consultar.m_consultaincidencia.enabled = False
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
lm_menu.m_consultar.m_observaciones.enabled = False
// Fin. Sgo.
//lm_menu.m_editar.m_iralcomienzo.enabled = False
//lm_menu.m_editar.m_iralfinal.enabled = False
//lm_menu.m_editar.m_buscar.enabled = False

Else
//lm_menu.m_consultar.m_datosanulacion.enabled = true
lm_menu.m_consultar.m_imprimir.enabled = true
lm_menu.m_consultar.m_grafica.enabled = true
lm_menu.m_consultar.m_consultaincidencia.enabled = True
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
lm_menu.m_consultar.m_observaciones.enabled = True
// Fin. Sgo.
//lm_menu.m_editar.m_iralcomienzo.enabled = true
//lm_menu.m_editar.m_iralfinal.enabled = true
//lm_menu.m_editar.m_buscar.enabled = true
	
End If

Return ll_last_selected

















//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

////***************************************
////**  OSGI 2001.1  	20/03/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
//////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n: fw_clicked
//// 
//// Objetivo: Resalta las instalaciones que seleccionan con un click
////      
//// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
////
//// Par$$HEX1$$e100$$ENDHEX$$metros: 
////              Entrada: datawindow adw_dataw, long row
////              Salida:  --
////                                              
////
////  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ----------    -----------   ----------------------------------------
//// 11/09/2000    JPE           Versi$$HEX1$$f300$$ENDHEX$$n Original
////
//////////////////////////////////////////////////////////////////////////////////////////////////
//Long ll_i, ll_rowcount/*, ll_selected*/
//Integer li_step/*, li_selected*/
//
//
//
//ll_rowcount = adw_dataw.RowCount()
//adw_dataw.SetReDraw(False)
//
//If row > 0 Then
//	If KeyDown(KeyControl!) Then
//		If adw_dataw.IsSelected(row) Then
//			adw_dataw.SelectRow(row, False)
//			il_selected_rows --
//		Else
//			adw_dataw.SelectRow(row, True)
//			il_selected_rows ++
//		End If
//	ElseIf KeyDown(KeyShift!) Then		
//		If row > il_row_click Then
//			FOR ll_i=il_row_click TO row STEP 1
//				 adw_dataw.SelectRow(ll_i, True)
//				 il_selected_rows ++
//			NEXT
//		Else
//			FOR ll_i=il_row_click TO row STEP -1
//				 adw_dataw.SelectRow(ll_i, True)
//				 il_selected_rows ++
//			NEXT
//		End If
//		
//		il_row_click = row
//	Else
//		adw_dataw.SelectRow(0, False)
//		adw_dataw.SelectRow(row, True)
//		il_row_click = row
//		If row = 0 Then
//			 If ll_rowcount > 1 Then
//				  il_selected_rows = 2 // m$$HEX1$$e100$$ENDHEX$$s de uno
//			 Else
//				  il_selected_rows = 1
//			 End If
//		Else
//			 il_selected_rows = 1
//		End If
//	End If
//End If
//
////ib_selected = False
////ll_selected = 0
////
////For ll_i = 1 To ll_rowcount
////   If adw_dataw.IsSelected(ll_i) Then
////		li_selected++
////		ll_selected = ll_i
////	End If
////
////   If li_selected > 1 Then
////		ib_selected = True
////		Exit
////	End If
////Next
////
////If li_selected = 0 Then
////	adw_dataw.SelectRow(row, True)
////End If
////
////adw_dataw.SetReDraw(True)
////ib_clicked = True
//
//fw_valida_multiple(adw_dataw, row)
//
//
////If Not ib_selected Then fw_validacion_menu(adw_dataw.GetItemNumber(row, 'sgd_incidencia_alcance'), adw_dataw.GetItemNumber(row, 'sgd_incidencia_nro_agrupacion'))
////
////Return ll_selected
////***************************************
////**  OSGI 2001.1  	20/03/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
end function

public function boolean fw_validar_fechas ();DateTime ldt_fecha_desde
DateTime ldt_fecha_hasta
Date ldt_fecha_desdes
Date ldt_fecha_hastas

d_deteccion.accepttext()  // si dispara el itemchange y se valida los datos de deteccion

ldt_fecha_desde=d_deteccion.getitemdatetime(1,"desde")
ldt_fecha_hasta=d_deteccion.getitemdatetime(1,"hasta")
ldt_fecha_desdes = Date(d_deteccion.getitemdatetime(1,"desde"))
ldt_fecha_hastas = Date(d_deteccion.getitemdatetime(1,"hasta"))

//////////////////////////////VALIDO FECHA DESDE /////////////////////////
IF NOT FGNU_ES_NULA(ldt_fecha_hasta) then
	IF ldt_fecha_desde > ldt_fecha_hasta THEN
			gnv_msg.f_mensaje("EI25","","",OK!)
			d_deteccion.setitem(1,"desde",idt_fecha_desde)
			d_deteccion.accepttext()
			d_deteccion.setcolumn("desde")
			d_deteccion.setfocus()
			ib_si_valido=FALSE
			return false
	END IF
END IF
////////////////////////////////////VALIDO FECHA HASTA////////////////
IF FGNU_ES_NULA(ldt_fecha_hasta) THEN
	gnv_msg.f_mensaje("EI27","","",OK!)
	d_deteccion.setitem(1,"hasta",idt_fecha_hasta)
	d_deteccion.accepttext()
	d_deteccion.setcolumn("hasta")
	d_deteccion.setfocus()
	ib_si_valido=false
	RETURN FALSE
END IF
IF NOT FGNU_ES_NULA(ldt_fecha_desde) then
	IF ldt_fecha_hasta< ldt_fecha_desde THEN
			gnv_msg.f_mensaje("EI26","","",OK!)
			d_deteccion.setitem(1,"hasta",idt_fecha_hasta)
			d_deteccion.accepttext()
			d_deteccion.setcolumn("hasta")
			d_deteccion.setfocus()
			ib_si_valido=false
			RETURN FALSE
	END IF
END IF

return True
end function

public function boolean fw_se_puede_anular (integer pi_tip_incidencia, integer pi_alcance, integer pi_estado);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : fw_se_puede_anular
//
//  Argumentos : pi_tip_incidencia --> Tipo de Incidencia
//					  pi_alcance --> Alcance de la incidencia
//					  pi_estado --> Estado de la incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Devueve si una incidencia se puede anular
//	
//
//  Valores de retorno : true  --> Se puede anular
//				  				 false --> No se puede anular
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

boolean lb_resultado = false
datetime ld_f_cierre,ld_f_incidencia,ld_fecha_Actual
long ll_resta_fechas

IF GI_PAIS = 4 THEN
	
	SELECT MAX(F_CIERRE)
	INTO :ld_f_cierre
	FROM MCI_CIERRE;

ELSE

  SELECT MAX(TO_DATE(to_char(anno *100 + mes), 'yyyymm'))
  	INTO :ld_f_cierre
	FROM SCI_IND_TEC_HIST;

END IF

ld_f_incidencia = dw_lista.object.f_deteccion[1]

ld_fecha_actual = fgnu_fecha_Actual()

select sysdate - :ld_f_incidencia into :ll_resta_fechas from dual;

CHOOSE CASE pi_tip_incidencia

CASE fgci_incidencia_imprevista  //,fgci_incidencia_obligada INDICATIVO OBLIGADA AMR VERSION UNIFICADA 02/09/2002
		
		if (pi_alcance = fgci_incidencia_de_suministro or pi_alcance >= fgci_incidencia_sin_interrupcion)  then 
			lb_resultado =  true 
		elseif (pi_alcance = fgci_incidencia_con_interrupcion) or pi_alcance >= fgci_incidencia_sin_interrupcion then 
			lb_resultado =  true
		else 
			lb_resultado = false 
		end if		
		
case fgci_incidencia_programada			
	lb_resultado = false
	
case fgci_incidencia_calidad
	
if (pi_alcance = fgci_incidencia_de_suministro or pi_alcance = fgci_incidencia_de_instalacion)  then 
	 lb_resultado = true 
end if

END CHOOSE

IF ld_f_cierre >= ld_f_incidencia or ll_resta_fechas > 60 then
	lb_resultado = false 
END IF 

// Capturamos la fecha del $$HEX1$$fa00$$ENDHEX$$ltimo cierre. La restricci$$HEX1$$f300$$ENDHEX$$n que va a existir es que nunca la fecha de la incidencia anulada puede superar la fecha del $$HEX1$$fa00$$ENDHEX$$ltimo cierre.

return lb_resultado
end function

on w_2301_hist_inc_desc.create
int iCurrent
call super::create
if this.MenuName = "m_hist_inc_desc" then this.MenuID = create m_hist_inc_desc
this.dw_ambito=create dw_ambito
this.rb_4=create rb_4
this.rb_3=create rb_3
this.d_deteccion=create d_deteccion
this.dw_datos_grafico=create dw_datos_grafico
this.dw_1=create dw_1
this.d_filtro=create d_filtro
this.gb_1=create gb_1
this.dw_filtro=create dw_filtro
this.dw_grafica=create dw_grafica
this.dw_lista=create dw_lista
this.dw_2=create dw_2
this.cb_total=create cb_total
this.sle_1=create sle_1
this.st_1=create st_1
this.dw_desc_descargo=create dw_desc_descargo
this.st_6=create st_6
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_ambito
this.Control[iCurrent+2]=this.rb_4
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.d_deteccion
this.Control[iCurrent+5]=this.dw_datos_grafico
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.d_filtro
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.dw_filtro
this.Control[iCurrent+10]=this.dw_grafica
this.Control[iCurrent+11]=this.dw_lista
this.Control[iCurrent+12]=this.dw_2
this.Control[iCurrent+13]=this.cb_total
this.Control[iCurrent+14]=this.sle_1
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.dw_desc_descargo
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.rb_1
this.Control[iCurrent+19]=this.rb_2
this.Control[iCurrent+20]=this.gb_2
end on

on w_2301_hist_inc_desc.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_ambito)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.d_deteccion)
destroy(this.dw_datos_grafico)
destroy(this.dw_1)
destroy(this.d_filtro)
destroy(this.gb_1)
destroy(this.dw_filtro)
destroy(this.dw_grafica)
destroy(this.dw_lista)
destroy(this.dw_2)
destroy(this.cb_total)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.dw_desc_descargo)
destroy(this.st_6)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_2)
end on

event open;call super::open;long ll_tip_tension// DSA 03/04/2000	
string ls_filtro
m_hist_inc_desc lm_menu
datawindowchild dddw_pi_desc_descargo

lm_menu = This.MenuId
setpointer(HourGlass!)

//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Visible = False
//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


if gb_bdi then 
	if gb_hay_sesion  then
   	 lm_menu.m_consultar.m_localizacin.visible=true
       lm_menu.m_consultar.m_localizacin.toolbaritemvisible=true
    	 lm_menu.m_consultar.m_quitarblink.visible=true
       lm_menu.m_consultar.m_quitarblink.toolbaritemvisible=true
	  	 lm_menu.m_consultar.m_seleccioncapas.visible=true
       lm_menu.m_consultar.m_seleccioncapas.toolbaritemvisible=true
   else  
  	   if gnv_msg.f_mensaje("CD01","","",YesNo!) = 2 then 
		   close(this)
			return
	   end if	  
  end if 
end if

dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)

d_deteccion.insertrow(0)
lu_comunic = create u_generico_comunicaciones
lu_comunic.is_comunic = gu_comunic.is_comunic

if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
	
	this.title = "OPEN SGI - Historico Incidencias"

	ll_tip_tension = dw_filtro.fnu_cargar_dddw_historico()

	//dw_filtro.fnu_cargar_dddw()		// DSA 03/04/2000	
	dw_filtro.insertrow(0)
	dw_filtro.setitem(dw_filtro.getrow(),'ai_tipo',0)
	dw_filtro.setitem(dw_filtro.getrow(),'ai_estado',5)
	dw_filtro.setitem(dw_filtro.getrow(),'ai_estado_mant',0)
	dw_filtro.visible = true
	dw_filtro.object.operacion[1] = "<"
	dw_filtro.object.tiempo[1] = 2
	dw_filtro.accepttext()
	//dw_filtro.setitem(dw_filtro.getrow(),'ai_alcance',0)	// DSA 03/04/2000	
	dw_filtro.setitem(dw_filtro.getrow(),'ai_alcance',ll_tip_tension)
	dw_filtro.setitem(dw_filtro.getrow(),'ai_suministro',0)
	dw_filtro.setitem(dw_filtro.getrow(),'ai_reg_seleccionados',0)
	lm_menu.m_consultar.m_datosanulacion.visible = true
	lm_menu.m_consultar.m_datosanulacion.enabled = false
   
	//AHM (03/11/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
	//AHU Filtrar por el estado de la ot de ocen (02/04/2009)
IF NOT fg_verifica_parametro('OCEN') AND NOT(gb_interfaseOsgm) THEN
//if gb_mantenimiento = false then
	dw_filtro.modify("ai_estado_mant.protect=1")
	dw_filtro.modify("ai_estado_mant.background.color="+gs_gris)
end if

/*	//dw_filtro.object.ai_estado.protect = 1
	dw_filtro.object.ai_estado_mant.protect = 1
	//dw_filtro.object.ai_estado.background.color = gs_gris
	dw_filtro.object.ai_estado_mant.background.color = gs_gris*/
//______DSA 08/05/2000				
//	dw_filtro.object.ai_suministro.protect=1
//	dw_filtro.object.ai_suministro.background.color = gs_gris
//
	d_deteccion.setitem(d_deteccion.getrow(),"desde",relativedate(today(), -15))
	d_deteccion.setitem(d_deteccion.getrow(),"hasta",today())
			
	dw_lista.dataobject = "d_inc_2002_pr_lista_seleccion_incidencia"
	
	lm_menu.m_consultar.m_consultaincidencia.visible = true
	lm_menu.m_consultar.m_consultaincidencia.toolbaritemvisible = true
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
	lm_menu.m_consultar.m_observaciones.visible = true
	lm_menu.m_consultar.m_observaciones.enabled = false
	lm_menu.m_consultar.m_observaciones.toolbarItemvisible = true
// Fin. Sgo.

	If fg_verifica_parametro('nuevos_tip_inc') then
		lm_menu.m_consultar.m_obligadas.visible = true
		lm_menu.m_consultar.m_obligadas.toolbarItemvisible = true
	else
		lm_menu.m_consultar.m_obligadas.visible = false
		lm_menu.m_consultar.m_obligadas.toolbarItemvisible = false
	end if
	
elseif lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then
	
	this.title = "OPEN SGI - Historico Descargos"
	// GNU 6-4-2006. Incidencia 0/421752
	sle_1.visible=true
	sle_1.text='0' 
	st_1.visible= true
	// FIN GNU
	d_deteccion.object.deteccion_titulo.text = " Solicitud "
	d_deteccion.setitem(d_deteccion.getrow(),"desde",relativedate(today(), -15))
	d_deteccion.setitem(d_deteccion.getrow(),"hasta",today())

	dw_lista.dataobject = "d_7001_lista_descargos_historico"
	lm_menu.m_consultar.m_datosanulacion.visible = false
	lm_menu.m_consultar.m_datosanulacion.toolbaritemvisible = false
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004.
	lm_menu.m_consultar.m_observaciones.visible = false
	lm_menu.m_consultar.m_observaciones.toolbarItemvisible = false
// Fin. Sgo.
	//______DSA INI 03/04/2000			
	ll_tip_tension = d_filtro.fnu_cargar_dddw_historico()
	d_filtro.Insertrow(0)
	d_filtro.object.ai_alcance[1] = ll_tip_tension
//	d_filtro.object.ai_alcance[1] = 1
//	d_filtro.object.ai_alcance[1].SetFilter("SGD_VALOR.CODIGO>0 ")
//	d_filtro.object.ai_alcance[1].Filter( )
	d_filtro.object.ai_estado_descargo[1] = 8 // GSE 16/05/2001
	d_filtro.object.operacion[1] = "<"
	d_filtro.object.tiempo[1] = 2

//   d_filtro.modify("ai_estado_descargo.protect = 1")
//   d_filtro.modify("ai_estado_descargo.background.color="+gs_gris)
//   d_filtro.modify("operacion.protect = 1")
//   d_filtro.modify("operacion.background.color="+gs_gris)
//   d_filtro.modify("ai_duracion.protect = 1")
//   d_filtro.modify("ai_duracion.background.color="+gs_gris)	
//   d_filtro.modify("tiempo.protect = 1")
//   d_filtro.modify("tiempo.background.color="+gs_gris)	
	d_filtro.Visible = TRUE
	//______DSA FIN 03/04/2000			

	gb_1.visible = true
	rb_3.visible = true
	rb_4.visible = true
	
	// GNU 6-3-2007. Mejora 1/510515
	if fg_verifica_parametro("grupo descargo") then
		gb_2.visible = true
		rb_1.visible = true
		rb_2.visible = true
	end if
		
	gb_1.show()
	rb_3.show()
	rb_4.show()
	// GNU 4-9-2006. Mejora 1/426921
if fg_verifica_parametro("descripcion descargos") then
	st_6.visible= true
	dw_desc_descargo.visible= true
	
	dw_desc_descargo.GetChild('pi_desc_descargo',dddw_pi_desc_descargo)
	dddw_pi_desc_descargo.SetTransObject(SQLCA)
	dw_desc_descargo.insertrow(0)
	dddw_pi_desc_descargo.retrieve()
	dddw_pi_desc_descargo.insertrow(1)
	dddw_pi_desc_descargo.setitem(1,"descripcion",'<Todos>')
	dddw_pi_desc_descargo.setitem(1,"codigo",0)
	dw_desc_descargo.setitem(1,"pi_desc_descargo",0)
	d_filtro.Modify('r_cri.height= "720"')
	d_filtro.Modify('ai_alcance_t.y= "300" '+ &
						 '~t ai_alcance.y= "300" ')
	d_filtro.Modify('t_ai_interrup.y= "422" ')				 
	d_filtro.Modify('ai_interrup.y= "422" ')
	d_filtro.Modify('t_nro_descargo.y= "522" ')
	d_filtro.Modify('t_desde.y= "532" ')
	d_filtro.Modify('nro_desc_desde.y= "522" ')
	d_filtro.Modify('t_hasta.y= "532" ')
	d_filtro.Modify('nro_desc_hasta.y= "522" ')
	d_filtro.Modify('t_duracion.y= "624" ')
	d_filtro.Modify('operacion.y= "624" ')
	d_filtro.Modify('ai_duracion.y= "624" ')
	d_filtro.Modify('tiempo.y= "624" ')
	
	
	
end if
// FIN GNU
end if

//dw_lista.settrans(sqlca) 
dw_lista.settransobject(sqlca)
dw_1.modify("data_1.DataObject ='" + dw_lista.DataObject + "'")
dw_2.modify("data_1.DataObject = 'd_lista_hist_reenganche'")

//***************************************
//**  OSGI 2001.1  	03/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If lu_comunic.is_comunic.programa_llamante = "Hist_Desc" Then
	lm_menu.m_consultar.m_informedeincidencias.Visible = False
	lm_menu.m_consultar.m_informedeincidencias.Enabled = False
	lm_menu.m_consultar.m_informedeincidencias.ToolBarItemVisible = False	
End If

//ib_mod_cxt_pxt = fg_verifica_parametro(lu_comunic.is_comunic.programa_llamante + '_pxt_cxt')
ib_mod_cxt_pxt = fg_verifica_parametro("w_7101_consulta_descargos")

fg_ventana_parametro(lu_comunic.is_comunic.programa_llamante + '_pxt_cxt', dw_lista)
fg_alto_texto(dw_lista, dw_lista.ClassName() + '_pxt_cxt', 0)
fg_ventana_parametro(lu_comunic.is_comunic.programa_llamante, dw_lista)
fg_alto_texto(dw_lista, dw_lista.ClassName(), 0)
This.Visible = True
//***************************************
//**  OSGI 2001.1  	03/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

// Controlo  la visibilidad/invisibilidad de el boton que calcula el total de registro
// mediante la activaci$$HEX1$$f300$$ENDHEX$$n del parametro con cod_parametro=50
IF fg_verifica_parametro('registros seleccionados') THEN
//	gb_1.visible = true
	cb_total.visible = true
//	gb_1.show()
//	rb_3.show()
//	rb_4.show()
ELSE
	gb_1.visible = false
	cb_total.visible = false
END IF	


end event

event activate;if isvalid(this) then 
	
	
	lu_comunic.is_comunic.programa_retorno = gu_comunic.is_comunic.programa_retorno

	IF lu_comunic.is_comunic.programa_retorno = "w_agrup_incid" &
		OR lu_comunic.is_comunic.programa_retorno = "iw_2301" THEN
		gu_comunic.is_comunic.programa_retorno = " "
		dw_lista.dbcancel()
		dw_lista.reset()
		this.triggerevent("ue_armar_sql")
	END IF
	
	if gb_bdi and gb_hay_sesion then 
		gl_instalacion_afectada = 0
		fg_mostrar(false)
	end if 	
end if 	


end event

event closequery;call super::closequery;destroy lu_comunic
end event

event ue_arch_imprimir;call super::ue_arch_imprimir;int li_alcance =0
DataWindowChild dw_datos1, dw_datos2
s_impresion_preliminar lst_Impresion
	

if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
		li_alcance = dw_filtro.GetItemNumber(1,'ai_suministro')
end if
IF li_alcance = fgci_incidencia_reenganche THEN
	
	dw_2.GetChild ("data_1",dw_datos2)
	dw_lista.ShareData(dw_datos2)
	IF dw_datos2.RowCount() = 0 THEN triggerevent("ue_armar_sql")

	IF dw_lista.RowCount() = 0 THEN
		messagebox("Atencion","No se han recuperado datos")
		return
	END IF

	dw_2.SetTransObject(SQLCA)
	lst_impresion.pdw_datawindow = dw_2
	lst_impresion.pdw_lista = dw_lista
	
ELSE
	
	dw_1.GetChild ("data_1",dw_datos1)
	dw_lista.ShareData(dw_datos1)
	IF dw_datos1.RowCount() = 0 THEN triggerevent("ue_armar_sql")
	
	IF dw_lista.RowCount() = 0 THEN
		messagebox("Atencion","No se han recuperado datos")
		return
	END IF
	
	dw_1.SetTransObject(SQLCA)
	lst_impresion.pdw_datawindow = dw_1
	lst_impresion.pdw_lista = dw_lista
	
END IF

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2301_hist_inc_desc
end type

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2301_hist_inc_desc
integer x = 64
integer y = 16
integer taborder = 60
boolean bringtotop = true
boolean border = false
end type

type rb_4 from radiobutton within w_2301_hist_inc_desc
boolean visible = false
integer x = 613
integer y = 780
integer width = 311
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Solicitud"
boolean checked = true
end type

event clicked;d_deteccion.object.deteccion_titulo.text = " Solicitud "
end event

type rb_3 from radiobutton within w_2301_hist_inc_desc
boolean visible = false
integer x = 178
integer y = 772
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Alta"
end type

event clicked;d_deteccion.object.deteccion_titulo.text = " Alta "
end event

type d_deteccion from u_inc_2013_pr_desde_hasta within w_2301_hist_inc_desc
event ue_cambio_desde pbm_custom45
event ue_cambio_hasta pbm_custom46
integer x = 119
integer y = 416
integer width = 882
integer height = 332
integer taborder = 70
boolean border = false
end type

event ue_cambio_desde;DateTime ldt_fecha_desde
//d_deteccion.setitem(1,"desde",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"desde")))
d_deteccion.accepttext()

		


end event

on ue_cambio_hasta;call u_inc_2013_pr_desde_hasta::ue_cambio_hasta;DateTime ldt_fecha_hasta
d_deteccion.setitem(1,"hasta",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"hasta")))
d_deteccion.accepttext()

end on

on dberror;//Para eliminar el scrip del padre
end on

event itemchanged;String ls_columna
Datetime ldt_fecha_desde
Datetime ldt_fecha_hasta
ls_columna=This.getcolumnname()
ib_si_valido=True

this.accepttext()

CHOOSE CASE ls_columna
	CASE "desde"
		idt_fecha_desde=this.getitemdatetime(1,"Desde")
	CASE "hasta"
		idt_fecha_hasta=this.getitemdatetime(1,"Hasta")	
END CHOOSE

end event

type dw_datos_grafico from datawindow within w_2301_hist_inc_desc
boolean visible = false
integer x = 1065
integer y = 72
integer width = 608
integer height = 716
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_2301_graf_incidencia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_1 from datawindow within w_2301_hist_inc_desc
boolean visible = false
integer x = 101
integer y = 1104
integer width = 494
integer height = 360
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type d_filtro from u_desc_7101_pr_filtro_descargos within w_2301_hist_inc_desc
boolean visible = false
integer x = 1888
integer width = 1673
integer height = 716
integer taborder = 100
boolean border = false
end type

event itemchanged;call super::itemchanged;d_filtro.accepttext()
if d_filtro.getitemnumber(row,"ai_estado_descargo") > 1 then
        d_filtro.setitem(row,"ai_enviado",1)
        d_filtro.modify("ai_enviado.protect = 1")
        d_filtro.modify("ai_enviado.background.color="+gs_gris)
else
        d_filtro.modify("ai_enviado.protect = 0")
        d_filtro.modify("ai_enviado.background.color="+gs_blanco)       
end if


//IF dwo.name = "nro_desc_hasta" then
//
//		
//	IF this.object.nro_desc_desde[1] > integer(data) then
//		this.object.nro_desc_hasta[1] = this.object.nro_desc_desde[1]
//		//messagebox("Atencion","No puede ser menor que desde")
//	end if
//end if
d_filtro.accepttext()
end event

event editchanged;call super::editchanged;// En este evento se controla que el usuario no introduzca como primer caracter de
// los campos num$$HEX1$$e900$$ENDHEX$$ricos el signo negativo.   (LFE)

this.accepttext()
IF dwo.name = "ai_duracion"  then

	if Left(data,1) = '-' THEN
		this.object.ai_duracion[1] = 0
	end if
ELSEIF dwo.name = "nro_desc_desde"  then
	if Left(data,1) = '-' THEN
		this.object.nro_desc_desde[1] = 0
	end if
	
ELSEIF dwo.name = "nro_desc_hasta"  then
	if Left(data,1) = '-' THEN
		this.object.nro_desc_hasta[1] = 0
	end if
	
END IF
this.accepttext()
end event

event itemerror;call super::itemerror;return 1
end event

type gb_1 from groupbox within w_2301_hist_inc_desc
boolean visible = false
integer x = 123
integer y = 732
integer width = 873
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
end type

type dw_filtro from u_inc_2030_pr_filtro_incidencia within w_2301_hist_inc_desc
boolean visible = false
integer x = 1792
integer y = 16
integer width = 1664
integer taborder = 90
boolean bringtotop = true
boolean border = false
end type

event itemchanged;datawindowchild ddw_child_alcance
string ls_filtro, ls_filtro2
int li_anterior
long li_tip_incidencia
m_hist_inc_desc lm_menu

lm_menu = Parent.MenuId
This.SetRedraw(False)
if row > 0 then
	
	if	dwo.name = 'ai_tipo'	then
		//***************************************
		//**  OSGI 2001.1  	19/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		This.Modify('ai_suministro.Protect = 0')
	  	This.Modify('ai_suministro.Background.Color = ' + gs_blanco)	  
		
		This.Modify('ai_suministro_programada.Protect = 0')
	  	This.Modify('ai_suministro_programada.Background.Color = ' + gs_blanco)	  
		
		This.Modify('ai_alcance.Protect = 0')
	  	This.Modify('ai_alcance.Background.Color = ' + gs_blanco)	
		  
		This.Modify('ai_duracion.Protect = 0')
		This.Modify('ai_duracion.Background.Color = ' + gs_blanco)	  
		
		This.Modify('operacion.Protect = 0')
		This.Modify('operacion.Background.Color = ' + gs_blanco)	  
		
		This.Modify('tiempo.Protect = 0')
		This.Modify('tiempo.Background.Color = ' + gs_blanco)	  
		
		This.Modify('ai_estado.Protect = 0')
		This.Modify('ai_estado.Background.Color = ' + gs_blanco)	  
		
		//***************************************
		//**  OSGI 2001.1  	19/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************

		if long(data) = fgci_todos	then
			this.Modify('ai_suministro.visible = 1')
		  	this.Modify('ai_suministro_programada.visible = 0')
			This.SetItem(1, "ai_suministro", fgci_todos)				
			This.Modify('ai_alcance.Protect = 1')
			This.Modify('ai_alcance.Background.Color = ' + gs_gris)	
			
		elseif long(data) = fgci_incidencia_programada	then
			this.Modify('ai_suministro.visible = 0')
			this.Modify('ai_suministro_programada.visible = 1')
			this.setitem(1,"ai_suministro_programada",fgci_todos)
			// se traen los estados para:
			// 	- Tipo de Incidencia = Programada
			// 	- Alcance = Todos			(LFE)

//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
		ElseIf Long(data) = fgci_incidencia_obligada Or Long(data) = fgci_incidencia_alum_pub Then
			This.SetItem(1, "ai_suministro", fgci_todos)
			
			This.Modify('ai_suministro.Protect = 1')
			This.Modify('ai_suministro.Background.Color = ' + gs_gris)	  
			This.Modify('ai_suministro_programada.Protect = 1')
			This.Modify('ai_suministro_programada.Background.Color = ' + gs_gris)	  

			If Long(data) = fgci_incidencia_alum_pub Then
				This.SetItem(1,"ai_alcance", fgci_baja_tension)				
				This.Modify('ai_alcance.Protect = 1')
				This.Modify('ai_alcance.Background.Color = ' + gs_gris)
			End If			
//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

		ELSE  // Tipo de Incidencia: de Calidad o Imprevista o de Scada
			this.Modify('ai_suministro.visible = 1')
			this.Modify('ai_suministro_programada.visible = 0')

			this.GetChild("ai_suministro",ddw_alcance_t)
			ddw_alcance_t.SetTransObject(SQLCA)
	 		ddw_alcance_t.reset()

   	// Se comprueba el tipo de Incidencia para traer el alcance
			IF long(data) = fgci_incidencia_imprevista	then
				// 	- Tipo de Incidencia = Imprevista

				ddw_alcance_t.retrieve('IN_A')
				ls_filtro2 = "codigo in "+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_imprevista)

			ELSEIF long(data) = fgci_incidencia_calidad then // El tipo de incidencia es de calidad
					ddw_alcance_t.retrieve('IN_A')
					ls_filtro2 = "codigo in "+	fnu_obten_alcance_tipo_incidencia(fgci_incidencia_calidad)
					
//			ELSEIF long(data) = fgci_incidencia_scada then // El tipo de incidencia es de scada
//					ddw_alcance_t.retrieve('IN_A')
//					ls_filtro2 = "codigo in "+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_scada)
//
			END IF

			ddw_alcance_t.SetFilter(ls_filtro2)
			ddw_alcance_t.SetSort("codigo A")
			ddw_alcance_t.filter()
			ddw_alcance_t.Sort()
			this.setitem(1,"ai_suministro",fgci_todos)
		end if
	end if

end if

CHOOSE CASE dwo.name
	CASE "nro_incid_desde"
		IF not Integer(this.gettext()) = 0 then
			d_deteccion.modify("desde.background.color ="+gs_gris)
         d_deteccion.modify("hasta.background.color ="+gs_gris)
			d_deteccion.enabled = false
			ib_rango = true
		ELSEIF getitemnumber(1,"nro_incid_hasta") = 0 THEN
			d_deteccion.modify("desde.background.color ="+gs_blanco)
	      d_deteccion.modify("hasta.background.color ="+gs_blanco)
		   d_deteccion.enabled = true
		END IF


	CASE "nro_incid_hasta"
	    IF  not Integer(this.gettext()) = 0 then
         d_deteccion.modify("desde.background.color ="+gs_gris)
         d_deteccion.modify("hasta.background.color ="+gs_gris)
         d_deteccion.enabled = false
			ib_rango = true
		 ELSEIF  getitemnumber(1,"nro_incid_desde") = 0 THEN
			d_deteccion.modify("desde.background.color ="+gs_blanco)
	      d_deteccion.modify("hasta.background.color ="+gs_blanco)
			d_deteccion.enabled = true
		 END IF
	
	CASE "ai_suministro", "ai_tipo"
		IF long(data) = fgci_incidencia_reenganche and dwo.name = 'ai_suministro' then
			ib_reenganche = true
			dw_lista.SetRedraw(false)
			dw_lista.DataObject = 'd_lista_hist_reenganche'
			is_sql_original = ""
			This.Modify('ai_duracion.Protect = 1')
			This.Modify('ai_duracion.Background.Color = ' + gs_gris)	  
			This.Modify('operacion.Protect = 1')
			This.Modify('operacion.Background.Color = ' + gs_gris)	  
			This.Modify('tiempo.Protect = 1')
			This.Modify('tiempo.Background.Color = ' + gs_gris)	
			This.SetItem(1,'ai_estado',fgci_incidencia_resuelta)
			This.Modify('ai_estado.Protect = 1')
			This.Modify('ai_estado.Background.Color = ' + gs_gris)	  
			This.Modify('ai_suministro_programada.Protect = 1')
			This.Modify('ai_suministro_programada.Background.Color = ' + gs_gris)
			lm_menu.m_consultar.m_grafica.enabled = false
			lm_menu.m_consultar.m_informedeincidencias.enabled = false
			If fg_verifica_parametro('nuevos_tip_inc') then			
				lm_menu.m_consultar.m_obligadas.enabled = false
				lm_menu.m_consultar.m_obligadas.checked = false
			End if
			dw_lista.SetRedraw(true)
		ELSE
			
			IF ib_reenganche THEN
				SetPointer(HourGlass!)
				dw_lista.SetRedraw(false)
				is_sql_original = ""
				This.Modify('ai_duracion.Protect = 0')
				This.Modify('ai_duracion.Background.Color = ' + gs_blanco)	  
				This.Modify('operacion.Protect = 0')
				This.Modify('operacion.Background.Color = ' + gs_blanco)	  
				This.Modify('tiempo.Protect = 0')
				This.Modify('tiempo.Background.Color = ' + gs_blanco)	  
				This.Modify('ai_estado.Protect = 0')
				This.Modify('ai_estado.Background.Color = ' + gs_blanco)	  
				This.Modify('ai_suministro_programada.Protect = 0')
				This.Modify('ai_suministro_programada.Background.Color = ' + gs_blanco)	 
				lm_menu.m_consultar.m_grafica.enabled = true
				lm_menu.m_consultar.m_informedeincidencias.enabled = true
		
				dw_lista.dataobject = "d_inc_2002_pr_lista_seleccion_incidencia"
				
				//***************************************
				//**  OSGI 2001.1  	03/04/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************		
				fg_ventana_parametro(lu_comunic.is_comunic.programa_llamante + '_pxt_cxt', dw_lista)
				fg_alto_texto(dw_lista, dw_lista.ClassName() + '_pxt_cxt', 0)
				fg_ventana_parametro(lu_comunic.is_comunic.programa_llamante, dw_lista)
				fg_alto_texto(dw_lista, dw_lista.ClassName(), 0)
	//			This.Visible = True
				//***************************************
				//**  OSGI 2001.1  	03/04/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				dw_lista.SetRedraw(true)
				SetPointer(Arrow!)
			END IF
			ib_reenganche = false
		END IF
		///////////////////////////////////////////////////////////////////////////
		// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 28/08/2002
		///////////////////////////////////////////////////////////////////////////
		If dwo.name = 'ai_tipo' then
			If fg_verifica_parametro('nuevos_tip_inc') then			
				li_tip_incidencia = long(data)
				If li_tip_incidencia = fgci_incidencia_calidad or & 
					li_tip_incidencia = fgci_incidencia_alum_pub then				
					lm_menu.m_consultar.m_obligadas.enabled = false
					lm_menu.m_consultar.m_obligadas.checked = false
				Else
					If li_tip_incidencia = fgci_incidencia_imprevista and ib_reenganche then
				      lm_menu.m_consultar.m_obligadas.enabled = false
						lm_menu.m_consultar.m_obligadas.checked = false
				   else
					  lm_menu.m_consultar.m_obligadas.enabled = true
				   end if
				End if											
			End if
		End if
		///////////////////////////////////////////////////////////////////////////
		dw_lista.SetTransObject(SQLCA)
		
END CHOOSE




This.SetRedraw(TRUE)


end event

event editchanged;call super::editchanged;// En este evento se controla que el usuario no introduzca como primer caracter de
// los campos num$$HEX1$$e900$$ENDHEX$$ricos el signo negativo.   (LFE)

IF dwo.name = "ai_duracion"  then
		
	if Left(data,1) = '-' THEN
		this.object.ai_duracion[1] = 0
	end if
ELSEIF dwo.name = "nro_incid_desde"  then
	if Left(data,1) = '-' THEN
		this.object.nro_incid_desde[1] = 0
	end if
	
ELSEIF dwo.name = "nro_incid_hasta"  then
	if Left(data,1) = '-' THEN
		this.object.nro_incid_hasta[1] = 0
	end if
	
END IF

end event

event doubleclicked;call super::doubleclicked;int li_nulo
setnull(li_nulo)

if dwo.Name = 'desde' then
	dw_filtro.object.nro_incid_desde[row] = li_nulo
	dw_filtro.object.nro_incid_hasta[row]= li_nulo
	dw_filtro.SetColumn ('nro_incid_desde')
	d_deteccion.modify("desde.background.color ="+gs_blanco)
	d_deteccion.modify("hasta.background.color ="+gs_blanco)
	d_deteccion.enabled = true
end if
end event

type dw_grafica from datawindow within w_2301_hist_inc_desc
boolean visible = false
integer x = 37
integer y = 28
integer width = 3525
integer height = 1740
integer taborder = 30
string dataobject = "d_2301_graf_linea"
boolean livescroll = true
end type

type dw_lista from u_gen_0000_lista within w_2301_hist_inc_desc
event ue_post_clicked ( readonly long al_row )
event ue_post_key_down ( )
integer x = 37
integer y = 1024
integer width = 3511
integer height = 736
integer taborder = 10
string dataobject = "d_inc_2002_pr_lista_seleccion_incidencia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

event ue_post_clicked;//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_Return_selected
int li_alcance, li_estado
m_hist_inc_desc lm_menu

lm_menu = Parent.MenuId

If al_row < 1 Then
	Return
End If


If lu_comunic.is_comunic.programa_llamante = "Hist_Inci" Then
	li_alcance = dw_filtro.GetItemNumber(1,'ai_suministro')
	
	IF li_alcance <> fgci_incidencia_reenganche THEN
		li_estado = this.GetItemNumber(al_row,'est_actual')
		IF li_estado = fgci_estado_anulado THEN
			lm_menu.m_consultar.m_datosanulacion.enabled = true
		ELSE
			lm_menu.m_consultar.m_datosanulacion.enabled = false
		END IF
		gl_instalacion_afectada = dw_lista.getitemnumber(al_row,"nro_inst_afectada")
	END IF
	//	ll_Return_selected = fw_clicked(This, row)
		fw_clicked(This, al_row)
	
	
		If ib_selected Then
			lm_menu.m_editar.m_agruparincidencia.enabled = False
			lm_menu.m_editar.m_desagruparincidencias.enabled = False
			Return
		End If
	
	//	fw_validacion_menu(This.GetItemNumber(al_row, 'sgd_incidencia_alcance'), This.GetItemNumber(al_row, 'sgd_incidencia_nro_agrupacion'))
		
		If This.GetItemNumber(al_row, 'est_actual') = fgci_incidencia_resuelta THEN
			lm_menu.m_editar.m_agruparincidencia.enabled = True
		ELSE
			lm_menu.m_editar.m_agruparincidencia.enabled = False
		End If
		
		If This.GetItemNumber(al_row, 'sgd_incidencia_nro_agrupacion') > 0 Then
			lm_menu.m_editar.m_desagruparincidencias.enabled = True
		Else
			lm_menu.m_editar.m_desagruparincidencias.enabled = False
		End If
	
ElseIf lu_comunic.is_comunic.programa_llamante = "Hist_Desc" Then
	This.selectrow(0,False)
	This.selectrow(al_row,True)
	gl_instalacion_afectada = dw_lista.getitemnumber(al_row,"nro_instalacion")
End If


IF lu_comunic.is_comunic.programa_llamante <> "Hist_Desc" THEN
	IF gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and &
		FW_SE_PUEDE_anular(dw_lista.GetItemNumber(al_row, 'tip_incidencia'),dw_lista.GetItemNumber(al_row, 'sgd_incidencia_alcance'),dw_lista.GetItemNumber(al_row, 'est_actual'))	 then 
		lm_menu.m_editar.m_anularincidencias.enabled = true
	else
		lm_menu.m_editar.m_anularincidencias.enabled = false
	end if
	
	if gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and dw_lista.GetItemNumber(al_row, 'est_actual')= fgci_estado_anulado and dw_lista.GetItemNumber(al_row, 'ind_anulacion_sgi')= 1&
		 and lu_comunic.is_comunic.programa_llamante <> "Hist_Desc" then  
		lm_menu.m_consultar.m_datosanulacion.enabled = true
		lm_menu.m_editar.m_deshaceranulacin.enabled = true
	else
		lm_menu.m_consultar.m_datosanulacion.enabled = false
		lm_menu.m_editar.m_deshaceranulacin.enabled = false
	end if
END IF
//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_post_key_down;//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

/////////////////////////////////////////////////////
//	Permite borrar o agregar incidencias desde el teclado
//	dependiendo de si el usuario presiono delete o insert
//
//
//////////////////////////////////////////////////////
long ll_row




If KeyDown(KeyUpArrow!) Or KeyDown(KeyDownArrow!) Then ll_row = fw_clicked(This, This.GetRow())

If ll_row < 1 Or ib_selected Then
	Return
Else
	This.ScrollToRow(ll_row)
End If
//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event doubleclicked;call super::doubleclicked;SetPointer(HourGlass!)	

long ll_fila
int li_alcance

IF row = 0 then return

ll_fila = this.getselectedrow(0)

if ll_fila < 1 then
	return
end if



if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
	li_alcance = dw_filtro.GetItemNumber(1,'ai_suministro')
	IF li_alcance <> fgci_incidencia_reenganche THEN //no es un reenganche
		gu_comunic.is_comunic.programa_llamante="Hist_Inci"
		//gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
		gu_comunic.is_comunic.accion_llamada="Consulta"
		gu_comunic.is_comunic.longval3 =  this.getitemnumber(ll_fila,"nro_incidencia")
		gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,7)
	ELSE //es un reenganche
		gu_comunic.is_comunic.longval1= this.getitemnumber(ll_fila,"nro_incidencia")
		open(w_2303_historico_de_reenganches)
	END IF
else
	
	gu_comunic.is_comunic.longval1 = dw_lista.getitemnumber(row,"nro_descargo") // Variable que tiene el valor a recuperar
   gu_comunic.is_comunic.decval1 = dw_lista.getitemnumber(row,"nro_instalacion") // Variable que tiene el valor a recuperar
   gu_comunic.is_comunic.strval5 = dw_lista.getitemstring(row,"nom_instalacion") // Variable que tiene el valor a recuperar
   gu_comunic.is_comunic.strval6 = "lista_descargos"
		 
	Open(w_7106_consulta_historicos)
				

end if
end event

event clicked;call super::clicked;//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Post Event ue_post_clicked(row)
//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************




////**********  SCRIPT ORIGINAL
//if row < 1 then
//	return
//end if
//
//this.selectrow(0,false)
//this.selectrow(row,true)
//
//if lu_comunic.is_comunic.programa_llamante = "Hist_Inci" then
//	gl_instalacion_afectada = dw_lista.getitemnumber(row,"nro_inst_afectada")
//
//	IF This.GetItemNumber(row, 'sgd_incidencia_alcance') = fgci_incidencia_sin_interrupcion &
//		OR This.GetItemNumber(row, 'sgd_incidencia_alcance') = fgci_incidencia_reenganche THEN
//		
//		m_hist_inc_desc.m_editar.m_agruparincidencia.enabled = TRUE
//	ELSE
//		m_hist_inc_desc.m_editar.m_agruparincidencia.enabled = FALSE
//	END IF
//	
//	IF This.GetItemNumber(row, 'sgd_incidencia_nro_agrupacion') > 0 THEN
//		m_hist_inc_desc.m_editar.m_desagruparincidencias.enabled = TRUE
//	ELSE
//		m_hist_inc_desc.m_editar.m_desagruparincidencias.enabled = FALSE
//	END IF
//	
//elseif lu_comunic.is_comunic.programa_llamante = "Hist_Desc" then
//	gl_instalacion_afectada = dw_lista.getitemnumber(row,"sgd_instalacion_nro_instalacion")
//end if
////**********  SCRIPT ORIGINAL
end event

event retrieveend;call super::retrieveend;long ll_row
ll_row =dw_filtro.getrow()
if ll_row>0 then 
	dw_filtro.setitem(ll_row,'ai_reg_seleccionados',rowcount)// DSA 03/04/2000	
	sle_1.text=string(dw_lista.rowcount()) // GNU 6-4-2006. Incidencia 0/421752
end if
end event

event scrollvertical;call super::scrollvertical;long ll_contador
int li_alcance
boolean lb_desc_descargos
string ls_estado

	dw_filtro.setitem(1,"ai_reg_seleccionados", dw_lista.rowcount())
	sle_1.text=string(dw_lista.rowcount()) // GNU 6-4-2006. Incidencia 0/421752
	
//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If lu_comunic.is_comunic.programa_llamante = "Hist_Inci" Then
	li_alcance = dw_filtro.GetItemNumber(1,'ai_suministro')
	If ib_parametro_salmt AND li_alcance <> fgci_incidencia_reenganche Then
		FOR ll_contador = il_fila_desde TO This.RowCount()
			This.SetItem(ll_contador, "c_nom_salmt", fg_salmt_inst_afectada(This.GetItemNumber(ll_contador, "nro_inst_afectada")))
			This.AcceptText()
		NEXT
	End If
End If
//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//***************************************
//**  OSGI 2001.1  	27/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long 	 ll_row, ll_nro_descargo, ll_cxt
String ls_duracion, ls_cxt, ls_pxt
Double ld_pxt

	lb_desc_descargos=fg_verifica_parametro("descripcion descargos")

If lu_comunic.is_comunic.programa_llamante = "Hist_Desc" And (ib_mod_cxt_pxt or lb_desc_descargos) Then
	

	
	FOR ll_contador = il_fila_desde TO This.RowCount()
		
		ll_row = ll_contador
		If ib_mod_cxt_pxt Then
		ll_cxt = 0
		ld_pxt = 0 
		ll_nro_descargo = dw_lista.GetItemNumber(ll_row , "nro_descargo" )
		ls_duracion = fg_duracion_int_descargo(ll_nro_descargo)
		
		
		ls_cxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		ls_pxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		
		If IsNumber(ls_cxt) then ll_cxt = long(ls_cxt)	
		If IsNumber(ls_pxt) then ld_pxt = Double(ls_pxt)
		
		
		dw_lista.SetItem(ll_row,"c_ext_duracion", ll_cxt)
		dw_lista.SetItem(ll_row,"c_ext_paxtc", ld_pxt)
		
	end if
ls_estado = dw_lista.GetItemString(ll_row , "descripcion" )		
		
		if lb_desc_descargos and IsNumber(ls_estado) then




//SELECT "SGD_VALOR"."DESCRIPCION"
//INTO :ls_estado
//FROM "SGD_VALOR"  
//WHERE ( "SGD_VALOR"."CODIF" = 'DS_D' ) AND "SGD_VALOR"."CODIGO" =:ls_Estado ;

SELECT DESCRIPCION
INTO :ls_estado
FROM GI_DESC_DESCARGOS_HIST
WHERE CODIGO=:ls_estado;

dw_lista.SetItem(ll_row,"descripcion", ls_estado)
end if
		
	NEXT
End If
//***************************************
//**  OSGI 2001.1  	27/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

il_fila_desde = This.RowCount() + 1
end event

event rowfocuschanged;call super::rowfocuschanged;//fw_rowfocuschanged(currentrow)
//
end event

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_parametro_salmt = fg_verifica_parametro(This.ClassName())
//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event retrieverow;call super::retrieverow;////***************************************
////**  OSGI 2001.1  	06/04/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
//If lu_comunic.is_comunic.programa_llamante = "Hist_Inci" Then
//	If ib_parametro_salmt Then
//		This.SetItem(row, "c_nom_salmt", fg_salmt_inst_afectada(This.GetItemNumber(row, "nro_inst_afectada")))
//		This.AcceptText()
//	End If
//End If
////***************************************
////**  OSGI 2001.1  	06/04/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
//
//
////***************************************
////**  OSGI 2001.1  	27/06/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
//Long 	 ll_row, ll_nro_descargo, ll_cxt
//String ls_duracion, ls_cxt, ls_pxt
//Double ld_pxt
//
//
//If lu_comunic.is_comunic.programa_llamante = "Hist_Desc" And ib_mod_cxt_pxt Then
//	ll_row = row
//	ll_nro_descargo = dw_lista.GetItemNumber(ll_row , "nro_descargo" )
//	ls_duracion = fg_duracion_int_descargo(ll_nro_descargo)
//	
//	
//	ls_cxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
//	ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
//	
//	ls_pxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
//	ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
//	
//	
//	If IsNumber(ls_cxt) then ll_cxt = long(ls_cxt)	
//	If IsNumber(ls_pxt) then ld_pxt = Double(ls_pxt)
//	
//	
//	dw_lista.SetItem(ll_row,"c_ext_duracion", ll_cxt)
//	dw_lista.SetItem(ll_row,"c_ext_paxtc", ld_pxt)
//End If
////***************************************
////**  OSGI 2001.1  	27/06/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
end event

event ue_key_down;//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Post Event ue_post_key_down()


//**  OSGI 2001.1  	02/07/2001  /////////////////////////////////////////////////////
//**  OSGI 2001.1  	02/07/2001  //	Permite moverse con los cursores desde el teclado
//**  OSGI 2001.1  	02/07/2001  // GSE 18/05/2001
//**  OSGI 2001.1  	02/07/2001  //
//**  OSGI 2001.1  	02/07/2001  //////////////////////////////////////////////////////
//**  OSGI 2001.1  	02/07/2001  long ll_row
//**  OSGI 2001.1  	02/07/2001  
//**  OSGI 2001.1  	02/07/2001  IF keyflags = 0 and this.rowcount() > 1 THEN  
//**  OSGI 2001.1  	02/07/2001  	ll_row = This.Getselectedrow(0)
//**  OSGI 2001.1  	02/07/2001  	
//**  OSGI 2001.1  	02/07/2001  	IF key = KeyUpArrow! and ll_row > 1 THEN
//**  OSGI 2001.1  	02/07/2001  		this.selectrow(0,False)
//**  OSGI 2001.1  	02/07/2001  		this.selectrow(ll_row - 1,true)
//**  OSGI 2001.1  	02/07/2001  	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
//**  OSGI 2001.1  	02/07/2001  		this.selectrow(0,False)
//**  OSGI 2001.1  	02/07/2001  		this.selectrow(ll_row + 1,true)
//**  OSGI 2001.1  	02/07/2001  	ELSEIF key = keyShift! THEN
//**  OSGI 2001.1  	02/07/2001  		this.selectrow(0,False)
//**  OSGI 2001.1  	02/07/2001  		this.selectrow(ll_row,true)
//**  OSGI 2001.1  	02/07/2001  	END IF
//**  OSGI 2001.1  	02/07/2001  END IF
//***************************************
//**  OSGI 2001.1  	02/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type dw_2 from datawindow within w_2301_hist_inc_desc
boolean visible = false
integer x = 101
integer y = 1104
integer width = 494
integer height = 360
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_total from commandbutton within w_2301_hist_inc_desc
boolean visible = false
integer x = 2779
integer y = 752
integer width = 78
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "T"
end type

event clicked;string ls_select
long ll_row, ll_contador
//ls_select = d_lista_aviso.Object.DataWindow.Table.Select
dw_lista.Object.DataWindow.Retrieve.AsNeeded='No'
ll_row = dw_lista.RowCount()
////ib_total = true
dw_filtro.SetItem(1,'ai_reg_seleccionados',ll_row)
sle_1.text=string(ll_row) // GNU 6-4-2006. Incidencia 0/421752

/*If ib_parametro_salmt Then
	FOR ll_contador = 1 TO ll_row
		IF ii_reenganche = 0 then
			d_lista_aviso.SetItem(ll_contador, "c_nom_salmt", fg_salmt_inst_afectada(d_lista_aviso.GetItemNumber(ll_contador, "nro_inst_afectada")))
		END IF
	NEXT
	d_lista_aviso.AcceptText()

End If
*/
end event

type sle_1 from singlelineedit within w_2301_hist_inc_desc
boolean visible = false
integer x = 2578
integer y = 744
integer width = 192
integer height = 88
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_2301_hist_inc_desc
boolean visible = false
integer x = 1815
integer y = 736
integer width = 745
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros Seleccionados"
boolean focusrectangle = false
end type

type dw_desc_descargo from datawindow within w_2301_hist_inc_desc
boolean visible = false
integer x = 2592
integer y = 224
integer width = 946
integer height = 92
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_desc_descargo_hist"
boolean border = false
boolean livescroll = true
end type

type st_6 from statictext within w_2301_hist_inc_desc
boolean visible = false
integer x = 1934
integer y = 224
integer width = 507
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Descargo"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_2301_hist_inc_desc
boolean visible = false
integer x = 178
integer y = 892
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Distribuci$$HEX1$$f300$$ENDHEX$$n"
boolean checked = true
end type

type rb_2 from radiobutton within w_2301_hist_inc_desc
boolean visible = false
integer x = 613
integer y = 892
integer width = 379
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comercial"
end type

type gb_2 from groupbox within w_2301_hist_inc_desc
boolean visible = false
integer x = 123
integer y = 852
integer width = 873
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
end type


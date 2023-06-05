HA$PBExportHeader$w_1234_consulta_incidencias.srw
$PBExportComments$Consulta de Incidencias.
forward
global type w_1234_consulta_incidencias from w_sgigenerica
end type
type d_deteccion from u_inc_2013_pr_desde_hasta within w_1234_consulta_incidencias
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1234_consulta_incidencias
end type
type dw_1 from datawindow within w_1234_consulta_incidencias
end type
type d_lista_aviso from u_inc_2021_pr_lista_incidencia within w_1234_consulta_incidencias
end type
type cb_total from commandbutton within w_1234_consulta_incidencias
end type
type gb_1 from groupbox within w_1234_consulta_incidencias
end type
type ln_1 from line within w_1234_consulta_incidencias
end type
type d_filtro_aviso from u_inc_2030_pr_filtro_incidencia within w_1234_consulta_incidencias
end type
end forward

global type w_1234_consulta_incidencias from w_sgigenerica
integer width = 3657
integer height = 2004
string title = "OPEN SGI - Consulta de Incidencias"
string menuname = "md_lista_incidencia"
boolean resizable = false
string icon = "incicon.ico"
event ue_armar_sql pbm_custom74
event ue_retrieve pbm_custom75
event ue_ir_comienzo pbm_custom47
event ue_ir_final pbm_custom48
event ue_criterio_orden pbm_custom49
event ue_arch_borrar pbm_custom50
event ue_sit_clima pbm_custom51
event ue_sum_imp pbm_custom52
event ue_avisos_asociados pbm_custom53
event ue_observaciones pbm_custom54
event ue_eliminar pbm_custom55
event ue_presentacion pbm_custom59
event ue_inicializo_estructura_perfil pbm_custom60
event ue_inicializo_objetos pbm_custom61
event ue_cierra_mensajero ( )
event ue_operacion_consulta ( )
event ue_obtener_datos ( )
event ue_agrupacion ( )
event ue_desagrupacion ( )
event ue_imp_reporte_inc ( )
event ue_operacion_mantenimiento ( )
event ue_anular ( )
event ue_consultar_anulacion ( )
event ue_desanular ( )
d_deteccion d_deteccion
d_ambito d_ambito
dw_1 dw_1
d_lista_aviso d_lista_aviso
cb_total cb_total
gb_1 gb_1
ln_1 ln_1
d_filtro_aviso d_filtro_aviso
end type
global w_1234_consulta_incidencias w_1234_consulta_incidencias

type variables
u_generico_comunicaciones lu_comunic // Variable local de trabajo de comunicacion
u_generico_comunicaciones lu_comunic1 // variable local de trabajo con formulario de informacion
u_generico_comunicaciones iu_resetea // variable local para resetear la variable de comunicaciones
s_w_1234_consulta_incidencias ventana[3]
string Is_Select_original = " "
string Is_Clausula_Where = " "
string Is_modificacion = " "
string Is_filtro_ambito
string Is_filtro_deteccion
string Is_filtro_alcance
string is_filtro_nro_incid_desde_hasta
string Is_filtro_estado
string is_where_inicio = " "
string Is_filtro_tipo
string Is_filtro_alimentacion
string Is_filtro_duracion
string Is_select_original1=" "
string retorno
long resultado
int fila_ant
long ll_fila_select
long il_inc_enviar
boolean ib_si_valido
long il_inc_seleccionada
// MERC  int i
datetime idt_fecha_desde
datetime idt_fecha_hasta
time tiempo
time tiempo_org
int ii_mantenimiento
int ii_habilitado=0
int ii_deshabilitado=1
int li_primera_vez 
int ii_orden_ant
int ii_reenganche = 0

//int ii_orden 
//string is_nomcab
//string is_nomcab_borde
int ii_clase_aviso

boolean ib_rango
boolean ib_activate = False

long il_row_click, il_selected_rows  //**  OSGI 2001.1  	20/03/2001
boolean ib_selected  //**  OSGI 2001.1  	20/03/2001

boolean ib_parametro_salmt  //**  OSGI 2001.1  	05/04/2001

boolean ib_recupero = true
boolean ib_falta_retrieve = false
boolean ib_close=false
boolean ib_total = false
long il_fila_retrieve = 0
boolean ib_reenganche=false
boolean ib_oop = false
String is_modif_dw_interr = "" //**  OSGI 2001.2 24/10/2002 
long il_row
integer ii_valormant=0, ii_valorcons=0
end variables

forward prototypes
public function boolean frn_hab_borrar_consulta ()
public function boolean frn_hab_borrar_seleccion ()
public function boolean frn_hab_agregar_actualizacion ()
public function boolean frn_hab_borrar_actualizacion ()
public function boolean frn_hab_dobleclick_actualizacion ()
public function boolean fnu_valido_datos ()
public subroutine fnu_orden_anterior ()
public function long fw_clicked (datawindow adw_dataw, readonly long row)
public function boolean fw_enviar_operacion (integer pi_tipo_incidencia)
public function boolean fw_incidencia_operaciones (integer pi_tipo_tension)
public function integer fw_borrar_ot (long pl_nro_incidencia)
public function integer fw_borrar_incidencia_con_perdida (long pl_nro_incidencia)
public function integer fw_liberar_aviso (long pl_nro_incidencia)
public function integer fw_borrar_incidencia (long pl_nro_incidencia)
public function integer fw_borrar_incidencia_sin_perdida (long pl_nro_incidencia, integer pi_tipo_incidencia, integer pi_alcance)
public function integer fw_recomponer_arbol (long pl_nro_incidencia, integer pi_clase_aviso)
public function boolean fw_se_puede_anular (integer pi_tip_incidencia, integer pi_alcance, integer pi_estado)
public function integer fw_borrar_incid_agrupadas (long pl_nro_agrupacion)
public function integer f_poner_menu_invisible (boolean pb_visible)
public function integer fw_borrar_reenganche (long pl_nro_incidencia)
public function long fw_comprobar_estado (long pl_fila)
end prototypes

event ue_armar_sql;Int li_pos_est_actual
Int li_pos_nro_centro
string ls_ordenado_por
string ls_original_select
int li_alcance
datetime ldt_f_actual,ldt_nula

ldt_f_actual = fgnu_fecha_actual()
setnull(ldt_nula)

SetPointer(HourGlass!)
ib_si_valido=true

d_lista_aviso.dbcancel()
d_lista_aviso.reset()

d_filtro_aviso.accepttext()
d_deteccion.accepttext()

li_alcance = d_filtro_aviso.object.ai_suministro[1]
ib_total = false
if isnull(d_filtro_aviso.getitemnumber(1,"nro_incid_hasta")) or d_filtro_aviso.getitemnumber(1,"nro_incid_hasta") <= 0 then 
	IF NOT fnu_valido_datos() then
	return
	END IF
end if

if isnull(d_filtro_aviso.getitemnumber(1,"nro_incid_hasta"))  then 
   d_filtro_aviso.setitem(1,"nro_incid_hasta", 0)   
end if
if isnull(d_filtro_aviso.getitemnumber(1,"nro_incid_desde")) then
	d_filtro_aviso.setitem(1,"nro_incid_desde", 0)   
end if	
If d_filtro_aviso.getitemnumber(1,"nro_incid_hasta") < 0  or d_filtro_aviso.getitemnumber(1,"nro_incid_desde") < 0  then 
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de incidencias no pueden ser menores que 0.")
	return
end if	
If d_filtro_aviso.getitemnumber(1,"nro_incid_hasta") = 0  and d_filtro_aviso.getitemnumber(1,"nro_incid_desde") <> 0  then
   d_filtro_aviso.setitem(1,"nro_incid_hasta", d_filtro_aviso.getitemnumber(1,"nro_incid_desde"))
end if	
If d_filtro_aviso.getitemnumber(1,"nro_incid_desde") = 0  and d_filtro_aviso.getitemnumber(1,"nro_incid_hasta") <> 0  then
  if d_filtro_aviso.getitemnumber(1,"nro_incid_hasta") > 100 then
     d_filtro_aviso.setitem(1,"nro_incid_desde", d_filtro_aviso.getitemnumber(1,"nro_incid_hasta"))
 else
     d_filtro_aviso.setitem(1,"nro_incid_desde", 1)
end if
end if	
If d_filtro_aviso.getitemnumber(1,"nro_incid_hasta") - d_filtro_aviso.getitemnumber(1,"nro_incid_desde") > 100 then
   d_filtro_aviso.setitem(1,"nro_incid_hasta", d_filtro_aviso.getitemnumber(1,"nro_incid_desde") + 100)
end if	
If d_filtro_aviso.getitemnumber(1,"nro_incid_hasta") < d_filtro_aviso.getitemnumber(1,"nro_incid_desde") then
	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de incidencias no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
	return
end if		
if d_filtro_aviso.getitemnumber(1,"nro_incid_desde") > 0 then
	If d_filtro_aviso.getitemnumber(1,"ai_suministro") = fgci_incidencia_reenganche then
		d_filtro_aviso.object.ai_estado[1] = fgci_todos
		d_filtro_aviso.object.ai_estado_mant[1] = fgci_todos
		d_filtro_aviso.object.ai_alcance[1] = fgci_todos
		d_filtro_aviso.object.ai_duracion[1] = 0
		d_deteccion.object.desde[1] = ldt_nula
		d_deteccion.object.hasta[1] = ldt_f_actual
		d_filtro_aviso.object.ai_tipo[1] = fgci_todos
		//d_ambito.object.nro_centro[1] = fgci_todos
		//d_ambito.object.nro_cmd[1] = fgci_todos
		//d_ambito.object.nro_mesa[1] = fgci_todos
	else
		d_filtro_aviso.object.ai_tipo[1] = fgci_todos
		d_filtro_aviso.object.ai_estado[1] = fgci_todos
		d_filtro_aviso.object.ai_estado_mant[1] = fgci_todos
		d_filtro_aviso.object.ai_alcance[1] = fgci_todos
		d_filtro_aviso.object.ai_suministro[1] = fgci_todos
		d_filtro_aviso.object.ai_duracion[1] = 0
		d_deteccion.object.desde[1] = ldt_nula
		d_deteccion.object.hasta[1] = ldt_f_actual
		//d_ambito.object.nro_centro[1] = fgci_todos
		//d_ambito.object.nro_cmd[1] = fgci_todos
		//d_ambito.object.nro_mesa[1] = fgci_todos
	end if
end if

// reseteo las variables
	is_filtro_nro_incid_desde_hasta = " "
	is_filtro_ambito = " "
	is_filtro_deteccion = " "
	is_filtro_alimentacion = " "
	is_clausula_where = " "
	is_modificacion = " "

// Preparo la parte del filtro por ambito.
	if li_alcance = fgci_incidencia_reenganche then
		is_filtro_ambito = d_ambito.fnu_filtro_ambito_reenganche(d_ambito.getitemnumber(1,"nro_centro"), & 
																	 d_ambito.getitemnumber(1,"nro_cmd") ,     &
																	 d_ambito.getitemnumber(1,"nro_mesa"),ii_mantenimiento) // Parte del where para el ambito
		is_filtro_nro_incid_desde_hasta = d_filtro_aviso.fnu_nro_incid_desde_hasta_reenganche()
		is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_reenganches(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) // Parte del where para deteccion
		ii_reenganche = 1
	else
		is_filtro_ambito = d_ambito.fnu_filtro_ambito_2(d_ambito.getitemnumber(1,"nro_centro"), & 
																	 d_ambito.getitemnumber(1,"nro_cmd") ,     &
																	 d_ambito.getitemnumber(1,"nro_mesa"),ii_mantenimiento) // Parte del where para el ambito
		is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_2(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) // Parte del where para deteccion
		is_filtro_Alimentacion = d_filtro_aviso.fnu_filtrar_avisos() // parte del Where del resto de la Consulta
		is_filtro_nro_incid_desde_hasta = d_filtro_aviso.fnu_nro_incid_desde_hasta()
		ii_reenganche = 0
	end if

	is_filtro_Alimentacion = d_filtro_aviso.fnu_filtrar_avisos() // parte del Where del resto de la Consulta

	if trim(is_filtro_ambito) <> "" then
		is_clausula_where = is_clausula_where + " and " + is_filtro_ambito 
	end if

	if trim(is_filtro_nro_incid_desde_hasta) <> "" then
		is_clausula_where = is_clausula_where + " and " + is_filtro_nro_incid_desde_hasta
	end if

	if trim(is_filtro_alimentacion) <> "" then
		is_clausula_where = is_clausula_where +" AND "+ is_filtro_alimentacion
	end if
	
	if trim(is_filtro_nro_incid_desde_hasta) = "" then   // si es numero incidencias desde y hasta no utilisar fechas
		if trim(is_filtro_deteccion) <> ""  then
			is_clausula_where = is_clausula_where +" AND "+ is_filtro_deteccion 
    		end if
	end if
	
////////////////////////////SI ES NECESARIO SE CAMBIA CLAUSULA WHERE PARA
//////////////////////////// QUE EFECTUE LA CONSULTA CORRECTA POR EL INDICE CORRECTO

li_pos_est_actual=Pos(is_clausula_where,"est_actual",1)
li_pos_nro_centro=Pos(is_clausula_where,"nro_centro",1)
if li_pos_est_actual>0 and li_pos_nro_centro>0 THEN
	is_clausula_where=REPLACE(is_clausula_where,li_pos_nro_centro,10,"nro_centro+0")
end if

//////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////
// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 27/08/2002
///////////////////////////////////////////////////////
If fg_verifica_parametro('nuevos_tip_inc')  AND d_filtro_aviso.getitemnumber(1,"nro_incid_desde") = 0 then
   IF md_lista_incidencia.m_consultar.m_obligadas.checked = true Then
	   is_clausula_where = is_clausula_where + " AND SGD_INCIDENCIA.IND_OBLIGADA = 1"



   End if
End if
////////////////////////////////////////////////////////

IF li_alcance = fgci_incidencia_reenganche THEN
	ls_original_select = is_select_original1
ELSE
	ls_original_select = is_select_original
END IF

is_modificacion = "DataWindow.table.Select=~"" + ls_original_select + is_clausula_where + ls_ordenado_por + "~""
retorno = d_lista_aviso.Modify(is_modificacion)
d_lista_aviso.setredraw(true)
//d_lista_aviso.settransobject(sqlca)


if ib_recupero=true then
	// Esto es para que no se cierre la ventana mientras se est$$HEX2$$e1002000$$ENDHEX$$haciendo un
	// retrieve. No se puede poner 'This.enabled = False' porque da problemas
	this.triggerevent("ue_retrieve")
else
	ib_falta_retrieve = TRUE
end if

IF not IsValid(This) Then return

IF d_lista_aviso.RowCount()>0 THEN
	d_lista_aviso.SelectRow(0,False)
	d_lista_aviso.SelectRow(1,True)
END IF
end event

event ue_retrieve;int xx
int i
int a,li_tiempo
string ls_operacion,ls_titulo
long ll_longitud
datetime ldt_desde, ldt_hasta

ls_operacion= d_filtro_aviso.object.operacion[1]
li_tiempo= d_filtro_aviso.object.tiempo[1]
IF ib_close = false then

	IF lu_comunic1.is_comunic.programa_retorno = "iw_2301" or li_primera_vez=0 &
		 OR lu_comunic1.is_comunic.programa_retorno= "w_agrup_incid" THEN
		
		SetPointer(HourGlass!)
		//this.setredraw(false)
		//d_lista_aviso.setredraw(false)
		
		ib_activate = True
		il_fila_retrieve = 1
		xx = d_lista_aviso.fnu_obtener_datos()

		IF Not IsValid(This) then return
		
		a=d_filtro_aviso.getitemnumber(1,"ai_duracion")
		IF d_filtro_aviso.getitemnumber(1,"ai_suministro") <> fgci_incidencia_reenganche THEN
			a=d_filtro_aviso.getitemnumber(1,"ai_duracion")
			d_lista_aviso.frn_filtrar_duracion(d_filtro_aviso.getitemnumber(1,"ai_duracion"),ls_operacion,li_tiempo)
		END IF
		d_lista_aviso.TriggerEvent("scrollvertical")
		//d_filtro_aviso.setitem(1,"ai_reg_seleccionados", d_lista_aviso.rowcount())
		//this.fnu_orden_anterior()
		d_lista_aviso.selectrow(0,False)
		//d_lista_aviso.setredraw(true)	
		IF d_lista_aviso.ROWCOUNT()=0 THEN
			GNV_MSG.F_MENSAJE("AI71","","",OK!)
		END IF
	
		ib_activate = False
		
		IF d_lista_aviso.rowcount()>0 THEN
			d_lista_aviso.selectrow(1,True)
			d_lista_aviso.setrow(1)
			//if gb_operaciones then
			this.triggerevent("ue_obtener_datos")
			//end if
			md_lista_incidencia.m_editar.m_iralcomienzo.enabled = true
			md_lista_incidencia.m_editar.m_iralfinal.enabled = true
		else
			md_lista_incidencia.m_editar.m_iralcomienzo.enabled = false	

			md_lista_incidencia.m_editar.m_iralfinal.enabled = false
		END IF
		//this.setredraw(true)									
		li_primera_vez=1
	END IF
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista de Incidencias'
	ll_longitud = len (ls_titulo)*100
	
	//Inserto las fechas, si son nulas visualizo el texto 00/00/0000 00:00:00
	ldt_desde = d_deteccion.GetItemDatetime(1,'desde')
	IF IsNull(ldt_desde) THEN 
		dw_1.modify("nulo_desde.visible = '1'")
		dw_1.modify("f_desde.visible='0'")
	ELSE
		dw_1.modify("nulo_desde.visible = '0'")
			dw_1.modify("f_desde.visible='1'")
	END IF
	ldt_hasta = d_deteccion.GetItemDatetime(1,'hasta')
	IF IsNull(ldt_hasta) THEN 
		dw_1.modify("nulo_hasta.visible = '1'")
		dw_1.modify("f_hasta.visible='0'")
	ELSE
		dw_1.modify("nulo_hasta.visible = '0'")
			dw_1.modify("f_hasta.visible='1'")
	END IF
	// si no son nulas las inserto
	dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
	dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
	dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
	
	//Asigno el dataObject a la dw que contiene los datos 
	//de la presentacion preliminar de impresion
	dw_1.modify("data_1.DataObject ='" + d_lista_aviso.DataObject + "'")	
//	DataWindowChild dw_a
//	dw_1.GetChild ("data_1",dw_a)
//	d_lista_aviso.ShareData(dw_a)
	
end if	
end event

event ue_ir_comienzo;SetPointer(HourGlass!)

d_lista_aviso.selectrow(0,False)
fila_ant =1
d_lista_aviso.selectrow(1,true)
d_lista_aviso.scrolltorow(1)

end event

event ue_ir_final;call super::ue_ir_final;SetPointer(HourGlass!)

	d_lista_aviso.selectrow(fila_ant,False)
	d_lista_aviso.selectrow(d_lista_aviso.getRow(),false)
	fila_ant =d_lista_aviso.rowcount()
	d_lista_aviso.selectrow(d_lista_aviso.rowcount(),true)
	d_lista_aviso.scrolltorow(d_lista_aviso.rowcount())



end event

event ue_criterio_orden;string res

SetPointer(HourGlass!)
ii_orden_ant=gu_comunic.is_comunic.intval9
CHOOSE CASE gu_comunic.is_comunic.intval9
	CASE 1
			res = d_lista_aviso.fnu_ordenar_por_duracion()
	CASE 2
			res =d_lista_aviso.fnu_ordenar_tip_incidencia()
	CASE 3
			res =d_lista_aviso.fnu_ordenar_estado_oper()
	CASE 4
			res =d_lista_aviso.fnu_ordenar_estado_mant()
	CASE 5
			res =d_lista_aviso.fnu_ordenar_ccli_afec()
	CASE 6
		res =d_lista_aviso.fnu_ordenar_pot_afectada()
	CASE 7
			res =d_lista_aviso.fnu_ordenar_fecha_res()
	CASE 8 
			res=d_lista_aviso.fnu_ordenar_fecha_deteccion()
	CASE 9
			res=d_lista_aviso.fnu_ordenar_instalacion()
	CASE ELSE
		res =d_lista_aviso.fnu_ordenar_por_duracion()
END CHOOSE

d_lista_aviso.SetSort("")
d_lista_aviso.Sort()


end event

event ue_arch_borrar;SetPointer(HourGlass!)

CHOOSE CASE lu_comunic.is_comunic.accion_llamada
	CASE "Seleccion"
			IF frn_hab_borrar_seleccion() THEN


			ELSE
				gnv_msg.f_mensaje("AI65","","",OK!)
			END IF 

		CASE "Consulta"
			IF frn_hab_borrar_consulta() THEN

			ELSE
				gnv_msg.f_mensaje("AI65","","",OK!)
			END IF

		CASE 	"Actualizacion"
			IF frn_hab_borrar_actualizacion() THEN
					
			
			ELSE
				gnv_msg.f_mensaje("AI65","","",OK!)
			END IF			
		CASE ELSE
		
END CHOOSE


end event

event ue_sit_clima;long ll_nro_incidencia
int li_cantidad
SetPointer(HourGlass!)

ll_fila_select = d_lista_aviso.GetSelectedRow(0) 

IF d_lista_aviso.RowCount()>0 AND ll_fila_select>0 THEN

	ll_nro_incidencia=d_lista_aviso.GetitemNumber(ll_fila_select,"nro_incidencia")

		//llamada a la ventana de situacion climatologica

	gu_comunic.is_comunic=iu_resetea.is_comunic		

	gu_comunic.is_comunic.longval1=d_lista_aviso.GetItemNumber(ll_fila_select,"nro_cmd")
	gu_comunic.is_comunic.Datval1=DateTime(Date(d_lista_aviso.GetItemDateTime(ll_fila_select,"f_deteccion")))
	gu_comunic.is_comunic.programa_llamante="iw_1234"
	gu_comunic.is_comunic.Accion_llamada="Consulta"

   SELECT count(*) into :li_cantidad  FROM "GI_SIT_CLIMA"  
   WHERE "GI_SIT_CLIMA"."NRO_CMD" =: gu_comunic.is_comunic.longval1 AND  
         "GI_SIT_CLIMA"."FECHA" =: gu_comunic.is_comunic.Datval1;    

	IF li_cantidad=0 THEN
		gnv_msg.f_mensaje("AI17",STRING(DATE(gu_comunic.is_comunic.datval1))," ",OK!)
	ELSE
		OPEN(W_2304_SITUACION_CLIMATOLOGICA)
	END IF

END IF



end event

event ue_sum_imp;long ll_nro_incidencia
int li_cantidad   //cantidad de sum_imp afectados por la incidencia
SetPointer(HourGlass!)
ll_fila_select=d_lista_aviso.GetSelectedRow(0) 
IF d_lista_aviso.RowCount()>0 AND ll_fila_select>0 THEN
	ll_nro_incidencia=d_lista_aviso.GetitemNumber(ll_fila_select,"nro_incidencia")

	gu_comunic.is_comunic=iu_resetea.is_comunic		
	gu_comunic.is_comunic.longval1=ll_nro_incidencia
	gu_comunic.is_comunic.Datval1 = d_lista_aviso.getitemDatetime(ll_fila_select,"f_deteccion")
	gu_comunic.is_comunic.programa_llamante="iw_1234"
	gu_comunic.is_comunic.intval1=d_lista_aviso.getitemnumber(ll_fila_select,"nro_centro")
	gu_comunic.is_comunic.intval2=d_lista_aviso.getitemnumber(ll_fila_select,"nro_cmd")
	gu_comunic.is_comunic.intval3=d_lista_aviso.getitemnumber(ll_fila_select,"nro_mesa")
	gu_comunic.is_comunic.Accion_llamada="Consulta"

	//chequeo si existen suministros importantes afectados por la incidencia
//  SELECT COUNT(*) into :li_cantidad FROM GI_SUM_IMP WHERE NRO_INCIDENCIA=:ll_nro_incidencia;
//	if li_cantidad>0 THEN
//		openSHEET(w_3201_mantenimiento_suministros_imp, w_1234_consulta_incidencias)
		Open(w_3202_mantenimiento_suministros_imp)
//	ELSE
//		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no tiene ning$$HEX1$$fa00$$ENDHEX$$n Suministro Importante.",information!,OK!)
//	END IF

END IF

end event

event ue_avisos_asociados;long ll_nro_incidencia
long ll_cantidad
int li_lock_status = 0

ll_cantidad=0
SetPointer(HourGlass!)
ll_fila_select=d_lista_aviso.getrow()

IF d_lista_aviso.RowCount()>0 AND ll_fila_select > 0 THEN
	ll_nro_incidencia=d_lista_aviso.GetitemNumber(ll_fila_select,"nro_incidencia")		
	gu_comunic.is_comunic.longval1=0
	gu_comunic.is_comunic.longval2=ll_nro_incidencia
	gu_comunic.is_comunic.programa_llamante="iw_1234"
	gu_comunic.is_comunic.Accion_llamada="Actualizacion"
	SELECT count(*) 
	INTO :ll_cantidad 
	FROM gi_avisos 
	WHERE nro_incidencia=:ll_nro_incidencia;
	
	IF ll_cantidad>0 THEN
		IF gu_perfiles.of_acceso_perfil(gi_perfil,'INC_LIBERAR_AV','ACC_MANTEN') = 1 THEN
			// como podemos realizar cambios intentamos bloquear la incidencia
			li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)
		END IF
		
		IF li_lock_status = -1 or li_lock_status = -54 THEN
			gu_comunic.is_comunic.Accion_llamada="Consulta"
		END IF
		
		IF li_lock_status = -2 THEN
			return
		END IF
				
		open(w_2307_consulta_avisos)
		IF li_lock_status = 0 AND gu_perfiles.of_acceso_perfil(gi_perfil,'INC_LIBERAR_AV','ACC_MANTEN') = 1 THEN
			gnu_u_transaction.uf_commit(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)			
		END IF
	ELSE
		gnv_msg.f_mensaje("AI26"," "," ",OK!)
	END IF
END IF


end event

event ue_observaciones;long ll_nro_incidencia
int li_lock_status, li_estado
//HLA.INI.DEO14-00000214.30/06/2014
int li_perfil
long ll_valor
//HLA.FIN.DEO14-00000214.30/06/2014
SetPointer(HourGlass!)
ll_fila_select=d_lista_aviso.GetSelectedRow(0) 
IF d_lista_aviso.RowCount()>0 AND ll_fila_select>0 THEN
	ll_nro_incidencia=d_lista_aviso.GetitemNumber(ll_fila_select,"nro_incidencia")
	li_estado = d_lista_aviso.getitemnumber(ll_fila_select,"est_actual")
	gu_comunic.is_comunic=iu_resetea.is_comunic		
	gu_comunic.is_comunic.strval1=d_lista_aviso.GetItemString(ll_fila_select,"observacion")
	if li_estado > fgci_incidencia_servicio_repuesto then 
		gu_comunic.is_comunic.Accion_llamada="Consulta"		
	else
		gu_comunic.is_comunic.Accion_llamada="Actualizacion"
	end if
	gu_comunic.is_comunic.longval3 = ll_nro_incidencia
	gu_comunic.is_comunic.longval2 = ll_fila_select
	
	//HLA.INI.DEO14-00000214.30/06/2014
	//li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)
	
	li_perfil=gi_perfil
	
		SELECT count(*)
		  into :ll_valor
		  FROM sgd_valor
		 WHERE codif = 'TP_U'
		 and valor = :li_perfil;
		
		if  ll_valor > 0 then
			li_lock_status = 0 
			ii_valormant = 1 
			ii_valorcons = 0
		else
			// **** LSH **** INI **** DDAG-2020 **** 31/07/2015 ****
			//li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)
			li_lock_status = -1
			// **** LSH **** FIN **** DDAG-2020 **** 31/07/2015 ****
		end if
	//HLA.FIN.DEO14-00000214.30/06/2014
	
	
	IF li_lock_status = 0  THEN	
		/*DEO12-00000007 JHE 12/12/2012          
		Se agrega nueva validadcion para controlar las observaciones 
		de las incidencias
		open(w_2302_observaciones_incidencia)*/
		if ii_valormant = 1 and ii_valorcons = 0 Then
         open(w_2302_observaciones_incidencia)
		elseif ii_valormant = 0 and ii_valorcons = 1 Then
			gu_comunic.is_comunic.Accion_llamada="Consulta"		
	//HLA.INI.DEO14-00000214.30/06/2014
		   //open(w_2302_observaciones_incidencia)
			openwithparm(w_2302_observaciones_incidencia,ll_nro_incidencia)
	//HLA.FIN.DEO14-00000214.30/06/2014
		end if
		/*DEO12-00000007 JHE 12/12/2012  FIN*/		
	ELSEIF li_lock_status = -1 or li_lock_status = -54 THEN
		gu_comunic.is_comunic.Accion_llamada="Consulta"		
		open(w_2302_observaciones_incidencia)
	END IF
END IF



end event

event ue_eliminar;////////////////////////////////////////////////////////////////////////////////////////////////
//
// Evento : ue_eliminar
// 
// Objetivo: Elimina una incidencia,siempre y cuando su estado sea igual o menor que EB
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
// 14/05/2001	LFE			Remodelaci$$HEX1$$f300$$ENDHEX$$n del evento 
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_incid, ls_aux
int indice, li_par, li_tension, li_row, li_tip_incidencia, li_alcance, li_estado
int li_lock_status
long ll_nro_interr, ll_nro_incidencia, ll_refresco
boolean lb_sigo=true, lb_inc_borrada = FALSE
w_2301_form_incidencia ls_ventana

IF lu_comunic.is_comunic.accion_llamada = "Consulta" THEN
	return
END IF

li_row = d_lista_aviso.GetSelectedrow(0)

if li_row <= 0 or isnull(li_row) then
	return
end if


ll_nro_incidencia = d_lista_aviso.getItemNumber(li_row,'nro_incidencia')


IF ii_reenganche = 1 then
	
	IF messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea eliminar el reenganche seleccionado?", Question!, YesNo!) <> 1 THEN
		return
	END IF

	IF fw_borrar_reenganche(ll_nro_incidencia) = 1 then

		gnu_u_transaction.uf_commit(THIS, "SGD_REENGANCHES", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)
		
		d_lista_aviso.DeleteRow(li_row)
		
		IF d_lista_aviso.RowCount() > 0 THEN
			d_lista_aviso.ScrollToRow(1)
			d_lista_aviso.SelectRow(1, TRUE)
		END IF
				
	ELSE
		gnu_u_transaction.uf_rollback(THIS, "SGD_REENGANCHES", "NRO_INCIDENCIA=" + string(ll_nro_incidencia), fgci_bloqueo_incidencia, ll_nro_incidencia)
	END IF
ELSE 
	ll_refresco = fw_comprobar_estado (li_row)
	
	IF ll_refresco = 1 THEN
		messagebox("Atencion","Los datos han cambiado y se refrescar$$HEX1$$e100$$ENDHEX$$n")
		w_1234_consulta_incidencias.li_primera_vez=0
		w_1234_consulta_incidencias.triggerevent("ue_armar_sql")	  
		RETURN	
	END IF
	
	IF NOT IsNull(d_lista_aviso.GetItemNumber(li_row, 'sgd_incidencia_nro_agrupacion')) AND &
		d_lista_aviso.GetItemNumber(li_row, 'sgd_incidencia_nro_agrupacion') > 0 THEN
	
		IF messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Va a eliminar una Incidencia Agrupada. Con ello se eliminar$$HEX1$$e100$$ENDHEX$$n todas las incidencias que forman parte de la Agrupaci$$HEX1$$f300$$ENDHEX$$n. $$HEX1$$bf00$$ENDHEX$$Desea continuar?", Question!, YesNo!) <> 1 THEN
			return
		END IF
	ELSE
		IF messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea eliminar la Incidencia seleccionada?", Question!, YesNo!) <> 1 THEN
			return
		END IF
	END IF
	
	IF d_lista_aviso.getrow() <= 0 THEN   
		gnv_msg.f_mensaje("AI38","","",OK!)
		gu_comunic.is_comunic.programa_retorno= "w_2307_consulta_avisos"
		RETURN
	END IF
	
	/////////////////////////////EVALUO PERFIL///////////////////////////////
	IF gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_MANTEN') = 1 &
		AND lu_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
	
		////////////////////////// SI TENGO PERFIL/////////////////////////
	
		// Se comprueba el nivel de tensi$$HEX1$$f300$$ENDHEX$$n sobre el que el usuario tiene acceso
		li_tension = d_lista_aviso.getItemNumber(li_row,'tip_tension')
		ls_incid  = gu_perfiles.of_nivel_tension('INC_GENERAL')
	
		for indice = 1 to len(ls_incid)
			li_par =  mod (indice,2)
			IF li_par <> 0 then
				ls_aux = mid(ls_incid,indice,1)
				if ls_aux <> ',' and lb_sigo = true then
					if integer(ls_aux) = li_tension or ls_aux = '0' then
						lb_sigo = false
					end if
				end if
			end if
		next
		// No tiene permiso para ese nivel
		If lb_sigo = true then
			gnv_msg.f_mensaje("AA08","","",OK!)
			return 
		end if
		
		ll_nro_incidencia = d_lista_aviso.getItemNumber(li_row,'nro_incidencia')
		li_tip_incidencia = d_lista_aviso.getItemNumber(li_row,'tip_incidencia')
		li_alcance = d_lista_aviso.getItemNumber(li_row,'sgd_incidencia_alcance')
		li_estado = d_lista_aviso.getItemNumber(li_row,'est_actual')
	
		if li_tip_incidencia=1 then
			ii_clase_aviso= 0
		else
			ii_clase_aviso = 3
		end if
		
		// Se eval$$HEX1$$fa00$$ENDHEX$$a el tipo de incidencia y el estado de la misma para comprobar si se puede 
		// eliminar la incidencia
		CHOOSE CASE li_tip_incidencia
			CASE fgci_incidencia_imprevista
				IF li_estado <= fgci_incidencia_enviado_brigada THEN
					IF li_alcance = fgci_incidencia_con_interrupcion THEN 
						// incidencia imprevista con p$$HEX1$$e900$$ENDHEX$$rdida
						IF fw_borrar_incidencia_con_perdida(ll_nro_incidencia) > 0 THEN
							fw_recomponer_arbol(ll_nro_incidencia, 0)
							d_lista_aviso.DeleteRow(li_row)
							lb_inc_borrada = TRUE
							IF d_lista_aviso.RowCount() > 0 THEN
								d_lista_aviso.ScrollToRow(1)
								d_lista_aviso.SelectRow(1, TRUE)
							END IF
						END IF
					ELSE
						IF fw_borrar_incidencia_sin_perdida(ll_nro_incidencia, li_tip_incidencia, li_alcance) > 0 THEN
							d_lista_aviso.DeleteRow(li_row)
							lb_inc_borrada = TRUE
							IF d_lista_aviso.RowCount() > 0 THEN
								d_lista_aviso.ScrollToRow(1)
								d_lista_aviso.SelectRow(1, TRUE)
							END IF
						END IF
					END IF
				ELSE
					//No se puede eliminar la incidencia debido a que se encuentra en un 
					//estado superior a Enviado Brigada
					gnv_msg.f_mensaje("AI65","","",OK!)
				END IF
				
			CASE fgci_incidencia_programada
				//No se pueden eliminar las incidencias programadas
				gnv_msg.f_mensaje("AI153","","",OK!)
			
			CASE fgci_incidencia_calidad
				IF fw_borrar_incidencia_sin_perdida(ll_nro_incidencia, li_tip_incidencia, li_alcance) > 0 THEN
					fw_recomponer_arbol(ll_nro_incidencia, 3)
					d_lista_aviso.DeleteRow(li_row)
					lb_inc_borrada = TRUE
					IF d_lista_aviso.RowCount() > 0 THEN
						d_lista_aviso.ScrollToRow(1)
						d_lista_aviso.SelectRow(1, TRUE)
					END IF
				END IF
				
			CASE fgci_incidencia_scada
				//No se pueden eliminar las incidencias procedentes de SCADA
				gnv_msg.f_mensaje("AI154","","",OK!)
				
		END CHOOSE
	
	END IF
	
	IF lb_inc_borrada = TRUE THEN
		// AVISAMOS A OTROS SGI
		if isvalid(gu_operaciones) then
			gu_operaciones.of_avisar_sgi(ll_nro_incidencia)
		end if
		
		// AVISAMOS AL PROPIO SGI
		if isvalid(gu_control_v_incidencias) then
			ls_ventana = gu_control_v_incidencias.of_busca_ventana(ll_nro_incidencia,-1)
			if not isnull(ls_ventana) then // ESTA ABIERTA
				if ls_ventana.lu_comunic.is_comunic.Accion_llamada = "Consulta" then // SOLO PARA CONSULTA
					gu_control_v_incidencias.of_actualiza_operaciones(ll_nro_incidencia,true,-1)
				end if
			end if
		end if
	END IF
END IF
end event

event ue_presentacion;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : ue_presentacion
// 
// Objetivo: Pone t$$HEX1$$ed00$$ENDHEX$$tulos a las ventanas dependiendo de la acci$$HEX1$$f300$$ENDHEX$$n
//           llamada , crea y habilita objetos de trabajo.
//          
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: --
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////

//********************TITULO DE LA VENTANA*******************************
//
	IF lu_comunic.is_comunic.Accion_Llamada = "Consulta" then
		this.title = fg_etiqueta(2000004)
	end if
	
	if lu_comunic.is_comunic.accion_llamada = "Seleccion" then
		this.title = fg_etiqueta(2000004)
	end if

	if lu_comunic.is_comunic.accion_llamada = "Actualizacion" then
		this.title = fg_etiqueta(2000004)
	end if

//********************CREAR OBJETOS VISUALES DE TRABAJO ********************

	d_ambito.fpr_crea_dddw()
	d_ambito.f_insertar_fila()
	
   d_filtro_aviso.fnu_cargar_dddw() //DBE tmp 21/03/2000
	
	IF lu_comunic.is_comunic.Accion_Llamada = "Consulta" then
		ventana[1].tipo_tension=d_filtro_aviso.fnu_cargar_dddw_consulta() //DBE tmp 21/03/2000
	ELSE
		ventana[1].tipo_tension=d_filtro_aviso.fnu_cargar_dddw() //DBE tmp 21/03/2000		
	END IF
	d_filtro_aviso.insertrow(0)	

	d_deteccion.insertrow(0)	
	d_ambito.accepttext()
	
// Si todos los niveles de tensi$$HEX1$$f300$$ENDHEX$$n tienen representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica, no se podr$$HEX1$$e100$$ENDHEX$$n dar de alta
// incidencias desde el OPENSGI
	IF gb_operaciones AND gi_tension_nivel_min = fgci_baja_tension AND gb_operaciones_inst = FALSE THEN
		md_lista_incidencia.m_archivo.m_agregar.enabled = FALSE
		md_lista_incidencia.m_archivo.m_agregar.visible = FALSE
	END IF

//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //***************************************
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //**  OSGI 2001.1  	05/04/2001			**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //**  Jair Padilla / Soluziona PANAMA  **
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //***************************************
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  fg_ventana_parametro(This.ClassName(), d_lista_aviso)
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  fg_alto_texto(d_lista_aviso, d_lista_aviso.ClassName(), 0)
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //***************************************
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //**  OSGI 2001.1  	05/04/2001			**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //**  Jair Padilla / Soluziona PANAMA  **
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //***************************************


is_modif_dw_interr = fg_ventana_parametro(This.ClassName(), d_lista_aviso)
is_modif_dw_interr += fg_alto_texto(d_lista_aviso, d_lista_aviso.ClassName(), 0)
//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
end event

event ue_inicializo_estructura_perfil;ii_mantenimiento = 0
//if gb_usuario_mant THEN     // USUARIO DE MANTENIMIENTO
//	 ii_mantenimiento = 1
//	 ventana[1].centro = gi_nro_centro_dep
//	 ventana[1].cmd    = gi_nro_cmd_dep
//    ventana[1].puesto = gi_nro_puesto_dep
//    ventana[1].estado_operaciones = lu_comunic.is_comunic.intval4
//    ventana[1].estado_mantenimiento = lu_comunic.is_comunic.intval8
//  	 ventana[1].tipo_incidencia   =lu_comunic.is_comunic.intval5
//    ventana[1].tipo_tension = lu_comunic.is_comunic.intval7
//    ventana[1].alcance = lu_comunic.is_comunic.intval10
//  	 ventana[1].duracion = 0 
//    setnull(ventana[1].desde)
//	 ventana[1].hasta = fgnu_fecha_actual() 
//			
//	 ventana[1].centro_hab = ii_deshabilitado
//	 ventana[1].cmd_hab    = ii_deshabilitado
//	 ventana[1].puesto_hab = ii_habilitado
//    ventana[1].estado_operaciones_hab = ii_habilitado
//    ventana[1].estado_mantenimiento_hab = ii_habilitado
//	 ventana[1].tipo_incidencia_hab   =ii_habilitado
//    ventana[1].tipo_tension_hab =ii_habilitado
//    ventana[1].alcance_hab =ii_deshabilitado
//	 ventana[1].duracion_hab =ii_habilitado
//    ventana[1].desde_hab= ii_habilitado
//	 ventana[1].hasta_hab = ii_habilitado
//
//	 ventana[1].centro_color = gs_gris
//	 ventana[1].cmd_color    = gs_gris
//	 ventana[1].puesto_color = gs_blanco
//    ventana[1].estado_operaciones_color = gs_blanco
//    ventana[1].estado_mantenimiento_color = gs_blanco
//	 ventana[1].tipo_incidencia_color   =gs_blanco
//    ventana[1].tipo_tension_color = gs_blanco
//    ventana[1].alcance_color = gs_gris
//	 ventana[1].duracion_color = gs_blanco
//    ventana[1].desde_color = gs_blanco
//	 ventana[1].hasta_color = gs_blanco
//ELSE
IF gb_usuario_tele THEN    //USUARIO DE TELEGESTIONES
	 ventana[1].centro = gi_nro_centro_dep
	 ventana[1].cmd    = gi_nro_cmd_dep
	 ventana[1].puesto = gi_nro_puesto_dep
	 ventana[1].estado_operaciones = fgci_hasta_serv_repuesto
	 ventana[1].estado_mantenimiento = lu_comunic.is_comunic.intval8
	 ventana[1].tipo_incidencia   =lu_comunic.is_comunic.intval5
//	 ventana[1].tipo_tension = 0
	 ventana[1].alcance = 0
	 ventana[1].duracion = 0 
	 setnull(ventana[1].desde)
	 ventana[1].hasta = fgnu_fecha_actual() 

	 ventana[1].centro_hab = ii_habilitado
	 ventana[1].cmd_hab    = ii_habilitado
	 ventana[1].puesto_hab = ii_habilitado
	 ventana[1].estado_operaciones_hab = ii_habilitado
	 ventana[1].estado_mantenimiento_hab = ii_habilitado
	 ventana[1].tipo_incidencia_hab   = ii_habilitado
	 ventana[1].tipo_tension_hab = ii_habilitado
	 ventana[1].alcance_hab = ii_deshabilitado
	 ventana[1].duracion_hab= ii_habilitado
	 ventana[1].desde_hab= ii_habilitado
	 ventana[1].hasta_hab = ii_habilitado

	 ventana[1].centro_color = gs_blanco
	 ventana[1].cmd_color    = gs_blanco
	 ventana[1].puesto_color = gs_blanco
	 ventana[1].estado_operaciones_color = gs_blanco
	 ventana[1].estado_mantenimiento_color = gs_blanco
	 ventana[1].tipo_incidencia_color   =gs_blanco
	 ventana[1].tipo_tension_color = gs_blanco
	 ventana[1].alcance_color = gs_gris
	 ventana[1].duracion_color = gs_blanco
	 ventana[1].desde_color = gs_blanco
	 ventana[1].hasta_color = gs_blanco

ELSE   //USUARIO  DE OPERACIONES
	 ventana[1].centro = lu_comunic.is_comunic.intval1
	 ventana[1].cmd    = lu_comunic.is_comunic.intval2
	 ventana[1].puesto = lu_comunic.is_comunic.intval3
	 ventana[1].estado_operaciones = lu_comunic.is_comunic.intval4
	 ventana[1].estado_mantenimiento = lu_comunic.is_comunic.intval8
	 ventana[1].tipo_incidencia   =lu_comunic.is_comunic.intval5
//	 ventana[1].tipo_tension = lu_comunic.is_comunic.intval7
	 ventana[1].alcance = lu_comunic.is_comunic.intval10
	 ventana[1].duracion = 0 
	 setnull(ventana[1].desde)
	 ventana[1].hasta = fgnu_fecha_actual() 
	  
	 ventana[1].centro_hab = ii_habilitado
	 ventana[1].cmd_hab    = ii_habilitado
	 ventana[1].puesto_hab = ii_habilitado
	 ventana[1].estado_operaciones_hab = ii_habilitado
	 ventana[1].estado_mantenimiento_hab = ii_habilitado
	 ventana[1].tipo_incidencia_hab   =ii_habilitado
	 ventana[1].tipo_tension_hab =ii_habilitado
	 ventana[1].alcance_hab =ii_habilitado
	 ventana[1].duracion_hab = ii_habilitado
	 ventana[1].desde_hab= ii_habilitado
	 ventana[1].hasta_hab = ii_habilitado
	 
	 ventana[1].centro_color = gs_blanco
	 ventana[1].cmd_color    = gs_blanco
	 ventana[1].puesto_color = gs_blanco
	 ventana[1].estado_operaciones_color = gs_blanco
	 ventana[1].estado_mantenimiento_color = gs_blanco
	 ventana[1].tipo_incidencia_color   =gs_blanco
	 ventana[1].tipo_tension_color = gs_blanco
	 ventana[1].alcance_color = gs_blanco
	 ventana[1].duracion_color = gs_blanco
	 ventana[1].desde_color = gs_blanco
	 ventana[1].hasta_color = gs_blanco

END IF
//END IF

end event

event ue_inicializo_objetos;d_filtro_aviso.setredraw(FALSE)
d_ambito.setredraw(FALSE)
d_deteccion.setredraw(FALSE)
d_filtro_aviso.setitem(1,"ai_estado",ventana[1].estado_operaciones)
d_filtro_aviso.setitem(1,"ai_estado_mant",ventana[1].estado_mantenimiento)


//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  d_filtro_aviso.setitem(1,"ai_tipo",ventana[1].tipo_incidencia)
//**  OSGI 2001.1  d_filtro_aviso.setitem(1,"ai_tipo", fgci_incidencia_imprevista)
d_filtro_aviso.setitem(1,"ai_tipo", 0)
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


d_filtro_aviso.setitem(1,"ai_alcance",ventana[1].tipo_tension)
//d_filtro_aviso.setitem(1,"ai_suministro",ventana[1].alcance)
d_filtro_aviso.setitem(1,"ai_suministro",0)
d_filtro_aviso.setitem(1,"ai_suministro_programada",0)
d_filtro_aviso.setitem(1,"ai_duracion",ventana[1].duracion)

d_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)

//AHM Mejora 1/455335
//d_deteccion.setitem(1,"desde",ventana[1].desde)


//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//d_deteccion.setitem(1,"desde", Date(ventana[1].hasta))
//Fin AHM
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


d_deteccion.setitem(1,"hasta",ventana[1].hasta)

d_filtro_aviso.modify("ai_estado.protect= "+String(ventana[1].estado_operaciones_hab))
d_filtro_aviso.modify("ai_estado_mant.protect= "+String(ventana[1].estado_mantenimiento_hab))
d_filtro_aviso.modify("ai_tipo.protect= " +String(ventana[1].estado_mantenimiento_hab))
d_filtro_aviso.modify("ai_alcance.protect= "+String(ventana[1].tipo_tension_hab))
//d_filtro_aviso.modify("ai_suministro.protect= "+String(ventana[1].alcance_hab)) 
d_filtro_aviso.modify("ai_duracion.protect= "+String(ventana[1].duracion_hab))

d_filtro_aviso.modify("ai_estado.background.color= "+ventana[1].estado_operaciones_color)
d_filtro_aviso.modify("ai_estado_mant.background.color= "+ventana[1].estado_mantenimiento_color)
d_filtro_aviso.modify("ai_tipo.background.color="+GS_BLANCO)
//d_filtro_aviso.modify("ai_tipo.background.color="+GS_GRIS)
d_filtro_aviso.modify("ai_alcance.background.color="+ventana[1].tipo_tension_color)
//d_filtro_aviso.modify("ai_suministro.background.color="+ventana[1].alcance_color)
d_filtro_aviso.modify("ai_duracion.background.color="+ventana[1].duracion_color)


//d_ambito.modify("nro_centro.protect="+String(ventana[1].centro_hab))
//d_ambito.modify("nro_cmd.protect="+String(ventana[1].cmd_hab))
//d_ambito.modify("nro_mesa.protect="+String(ventana[1].puesto_hab))
//
//d_ambito.modify("nro_centro.background.color="+ventana[1].centro_color)
//d_ambito.modify("nro_cmd.background.color="+ventana[1].cmd_color)
//d_ambito.modify("nro_mesa.background.color="+ventana[1].puesto_color)

d_deteccion.modify("desde.protect="+String(ventana[1].desde_hab))
d_deteccion.modify("hasta.protect="+String(ventana[1].hasta_hab))

d_deteccion.modify("desde.background.color ="+ventana[1].desde_color)
d_deteccion.modify("hasta.background.color ="+ventana[1].hasta_color)

d_filtro_aviso.setredraw(TRUE)
d_ambito.setredraw(TRUE)
d_deteccion.setredraw(TRUE)

end event

event ue_cierra_mensajero;call super::ue_cierra_mensajero;close(this)
end event

event ue_operacion_consulta();string ls_incid, ls_aux
int indice, li_par, li_tension, li_row
boolean lb_sigo=true
long ll_nro_incidencia, ll_refresco


//if isvalid(gu_operaciones) and d_lista_aviso.rowcount() > 0 then
//	li_row = d_lista_aviso.GetSelectedRow(0)
//	
//	ll_refresco = fw_comprobar_estado (li_row)
//	IF ll_refresco = 1 THEN
//		messagebox("Atencion","Los datos han cambiado y se refrescar$$HEX1$$e100$$ENDHEX$$n")
//		w_1234_consulta_incidencias.li_primera_vez=0
//		w_1234_consulta_incidencias.triggerevent("ue_armar_sql")	  
//		RETURN
//	END IF
//
//	//li_tension = d_lista_aviso.getItemNumber(li_row,'tip_tension')
//	//this.triggerevent("ue_obtener_datos")
//	//if il_inc_enviar > 0 then
//	ll_nro_incidencia = d_lista_aviso.getitemnumber(li_row,"nro_incidencia")
//	IF ll_nro_incidencia > 0 THEN
//		gu_operaciones.of_consultar_incidencia(ll_nro_incidencia)
//	END IF
//end if

if isvalid(gu_operacionSgi) and d_lista_aviso.rowcount() > 0 then
	li_row = d_lista_aviso.GetSelectedRow(0)
	
	ll_refresco = fw_comprobar_estado (li_row)
	IF ll_refresco = 1 THEN
		messagebox("Atencion","Los datos han cambiado y se refrescar$$HEX1$$e100$$ENDHEX$$n")
		w_1234_consulta_incidencias.li_primera_vez=0
		w_1234_consulta_incidencias.triggerevent("ue_armar_sql")	  
		RETURN
	END IF

	ll_nro_incidencia = d_lista_aviso.getitemnumber(li_row,"nro_incidencia")
	IF ll_nro_incidencia > 0 THEN
		gu_operacionSgi.of_consultar_incidencia(ll_nro_incidencia)
	END IF
end if
end event

event ue_obtener_datos();long ll_estado_actual
int li_fila_actual
int  li_tipo_tension, li_tipo_incidencia

if ii_reenganche = 0 then
	if d_lista_aviso.rowcount() > 0 then
		li_fila_actual = d_lista_aviso.getselectedrow(0)
		IF li_fila_actual > 0 THEN
			ll_estado_actual = d_lista_aviso.getitemnumber(li_fila_actual,"est_actual")
			
			IF gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ELIMINAR","ACC_MANTEN")=1 and ll_estado_actual < fgci_incidencia_servicio_repuesto THEN
				//***************************************
				//**  OSGI 2001.1  	18/05/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				//**  OSGI 2001.1  	18/05/2001  				md_lista_incidencia.m_archivo.m_eliminar.enabled = TRUE AND ib_selected = FALSE
				If Not ib_selected Then
					md_lista_incidencia.m_archivo.m_eliminar.enabled = TRUE
				End If
				//***************************************
				//**  OSGI 2001.1  	18/05/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
			else
				md_lista_incidencia.m_archivo.m_eliminar.enabled = FALSE
			END IF
			
			
			
			 IF gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and FW_SE_PUEDE_anular(d_lista_aviso.GetItemNumber(li_fila_actual, 'tip_incidencia'),d_lista_aviso.GetItemNumber(li_fila_actual, 'sgd_incidencia_alcance'),d_lista_aviso.GetItemNumber(li_fila_actual, 'est_actual'))	then 
					If Not ib_selected Then
						md_lista_incidencia.m_editar.m_anularincidencias.enabled = true

					end if
			else
				If Not ib_selected Then
						md_lista_incidencia.m_editar.m_anularincidencias.enabled = false
				else
					md_lista_incidencia.m_editar.m_anularincidencias.enabled = true
			end if
		end if


	if gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and d_lista_aviso.GetItemNumber(li_fila_actual, 'est_actual')= fgci_estado_anulado and d_lista_aviso.GetItemNumber(li_fila_actual, 'ind_anulacion_sgi')= 1 then //ANULACION SGI
		If Not ib_selected Then
				md_lista_incidencia.m_consultar.m_datosanulacin.enabled = true
				md_lista_incidencia.m_editar.m_deshaceranulacin.enabled = true
				md_lista_incidencia.m_consultar.m_operacion.enabled = false
			   md_lista_incidencia.m_consultar.m_maniobrarenoperacin.enabled = false
		end if
	else
		md_lista_incidencia.m_consultar.m_datosanulacin.enabled = false
		md_lista_incidencia.m_editar.m_deshaceranulacin.enabled = false
	end if
		il_inc_enviar = 0
	
	IF d_lista_aviso.GetItemNumber(li_fila_actual, 'tip_incidencia') <> fgci_incidencia_calidad &
			AND d_lista_aviso.GetItemNumber(li_fila_actual, 'sgd_incidencia_alcance') <> fgci_incidencia_de_suministro &
			AND d_lista_aviso.GetItemNumber(li_fila_actual, 'est_actual') <> fgci_estado_anulado & 
			AND d_lista_aviso.GetItemNumber(li_fila_actual, 'est_actual') <> fgci_incidencia_pte_explotacion THEN
			
			//***************************************
			//**  OSGI 2001.1  	20/03/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			//**  OSGI 2001.1  	20/03/2001  					md_lista_incidencia.m_editar.m_agruparincidencia.enabled = TRUE
			If Not ib_selected Then
				md_lista_incidencia.m_editar.m_agruparincidencia.enabled = TRUE
			End If
				//***************************************
				//**  OSGI 2001.1  	20/03/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				
		ELSE
			md_lista_incidencia.m_editar.m_agruparincidencia.enabled = FALSE
		END IF
			
		IF d_lista_aviso.GetItemNumber(li_fila_actual, 'sgd_incidencia_nro_agrupacion') > 0 THEN
			//***************************************
			//**  OSGI 2001.1  	20/03/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			//**  OSGI 2001.1  	20/03/2001  					md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = TRUE
			If Not ib_selected Then
				md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = TRUE
			End If
			//***************************************
			//**  OSGI 2001.1  	20/03/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************					
		ELSE
			md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = FALSE
		END IF
			
	else
		md_lista_incidencia.m_consultar.m_operacion.enabled = false
		il_inc_enviar = 0
	END IF
		
else
		
	md_lista_incidencia.m_editar.m_agruparincidencia.enabled = FALSE
	md_lista_incidencia.m_archivo.m_eliminar.enabled = FALSE
	il_inc_enviar = 0
	md_lista_incidencia.m_consultar.m_operacion.enabled = false	
	
end if


if d_lista_aviso.rowcount() > 0 then
	li_fila_actual = d_lista_aviso.getrow()
	if li_fila_Actual > 0 then 
		li_tipo_tension = d_lista_aviso.getitemnumber(li_fila_actual,"tip_tension")
		li_tipo_incidencia = d_lista_aviso.getitemnumber(li_fila_actual,"tip_incidencia")
		if fw_enviar_operacion(li_tipo_incidencia) and fw_incidencia_operaciones(li_tipo_tension) then 
			//***************************************
			//**  OSGI 2001.1  	18/05/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			//**  OSGI 2001.1  	18/05/2001  			md_lista_incidencia.m_consultar.m_operacion.enabled = true
			//**  OSGI 2001.1  	18/05/2001  			md_lista_incidencia.m_consultar.m_maniobrarenoperacin.enabled = true
			
			If Not ib_selected Then
				md_lista_incidencia.m_consultar.m_operacion.enabled = d_lista_aviso.GetItemNumber(li_fila_actual, 'est_actual') <> fgci_estado_anulado
				md_lista_incidencia.m_consultar.m_maniobrarenoperacin.enabled = d_lista_aviso.GetItemNumber(li_fila_actual, 'est_actual') <> fgci_estado_anulado
			End If
			//***************************************
			//**  OSGI 2001.1  	18/05/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		else
			md_lista_incidencia.m_consultar.m_operacion.enabled = false
			md_lista_incidencia.m_consultar.m_maniobrarenoperacin.enabled = false
		
		end if
	end if
end if 

else
	md_lista_incidencia.m_consultar.m_operacion.enabled = false
	md_lista_incidencia.m_consultar.m_maniobrarenoperacin.enabled = false
	md_lista_incidencia.m_consultar.m_datosanulacin.enabled = false
	md_lista_incidencia.m_editar.m_deshaceranulacin.enabled = false
	/*DEO12-00000007 JHE 12/12/2012          
	Se agrega nueva validadcion para controlar las observaciones 
	de las incidencias
	md_lista_incidencia.m_consultar.m_observaciones.enabled = false
   */

	if ii_valormant=0 and ii_valorcons = 0 then 
		md_lista_incidencia.m_consultar.m_observaciones.enabled = false
	elseif ii_valormant=1 and ii_valorcons = 0 then	
		md_lista_incidencia.m_consultar.m_observaciones.enabled = true
	elseif ii_valormant=0 and ii_valorcons = 1 then	
		md_lista_incidencia.m_consultar.m_observaciones.enabled = true
	end if 
	
	/*DEO12-00000007 JHE 12/12/2012 FIN*/	
	md_lista_incidencia.m_consultar.m_avisosasociados.enabled = false
	md_lista_incidencia.m_editar.m_anularincidencias.enabled = false
end if
end event

event ue_agrupacion;int li_fila
long ll_nro_agrup, ll_refresco

li_fila = d_lista_aviso.GetRow()
IF li_fila > 0 THEN
	SetPointer(HourGlass!)
   ll_refresco = fw_comprobar_estado (li_fila)
   IF ll_refresco = 1 THEN
		messagebox("Atencion","Los datos han cambiado y se refrescar$$HEX1$$e100$$ENDHEX$$n")
		w_1234_consulta_incidencias.li_primera_vez=0
		w_1234_consulta_incidencias.triggerevent("ue_armar_sql")	  
		RETURN
	END IF	
	gu_comunic.is_comunic.accion_llamada="Seleccion"
	gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
	gu_comunic.is_comunic.longval3 = d_lista_aviso.getitemnumber(li_fila,"nro_incidencia")	
	gu_comunic.is_comunic.longval4 = d_lista_aviso.getitemnumber(li_fila,"nro_inst_afectada")	
	gu_comunic.is_comunic.intval4 = d_lista_aviso.getitemnumber(li_fila,"est_actual")	
	gu_comunic.is_comunic.intval5 = d_lista_aviso.getitemnumber(li_fila,"tip_incidencia")	
	gu_comunic.is_comunic.intval6 = d_lista_aviso.getitemnumber(li_fila,"sgd_incidencia_alcance")	
	gu_comunic.is_comunic.intval7 = d_lista_aviso.getitemnumber(li_fila,"nro_centro")
	gu_comunic.is_comunic.intval8 = d_lista_aviso.getitemnumber(li_fila,"nro_cmd") 
	gu_comunic.is_comunic.intval9 = d_lista_aviso.getitemnumber(li_fila,"nro_mesa")
	gu_comunic.is_comunic.datval3 = d_lista_aviso.getitemdatetime(li_fila,"f_deteccion")
	gu_comunic.is_comunic.strval1 = d_lista_aviso.getitemString(li_fila,"nombre_instalacion")
	 
	IF gu_comunic.is_comunic.longval3 <> 0 THEN
		// Se comprueba si otro usuario ha agrupado la incidencia y no nos hemos
		// enterado
	
		SELECT NVL(NRO_AGRUPACION,0)
		INTO :ll_nro_agrup
		FROM SGD_INCIDENCIA
		WHERE NRO_INCIDENCIA = :gu_comunic.is_comunic.longval3;
		
		IF SQLCA.SQLCode = 0 THEN
			IF ll_nro_agrup <> d_lista_aviso.getitemnumber(li_fila,"sgd_incidencia_nro_agrupacion")	 THEN
				//La incidencia ya ha sido agrupada por otro usuario
				gnv_msg.f_mensaje("EI44","","",OK!)
				d_lista_aviso.dbcancel()
				d_lista_aviso.reset()
				li_primera_vez=0
				this.triggerevent("ue_armar_sql")
			ELSE
				open(w_agrupacion_incidencias)
			END IF
		ELSE
			//La incidencia ha sido modificada por otro usuario
			gnv_msg.f_mensaje("EI44","","",OK!)
		END IF
	END IF
	
END IF
end event

event ue_desagrupacion;int li_fila
long ll_nro_agrup, ll_refresco

li_fila = d_lista_aviso.GetRow()
IF li_fila > 0 THEN
	SetPointer(HourGlass!)
   ll_refresco = fw_comprobar_estado (li_fila)
   IF ll_refresco = 1 THEN
		messagebox("Atencion","Los datos han cambiado y se refrescar$$HEX1$$e100$$ENDHEX$$n")
		w_1234_consulta_incidencias.li_primera_vez=0
		w_1234_consulta_incidencias.triggerevent("ue_armar_sql")	  
		RETURN
	END IF
	gu_comunic.is_comunic.accion_llamada="Seleccion"
	gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
	gu_comunic.is_comunic.longval3 =  d_lista_aviso.getitemnumber(li_fila,"nro_incidencia")	

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
				gu_comunic.is_comunic.intval4 = d_lista_aviso.getitemnumber(li_fila,"est_actual")	
				open(w_desagrupacion_incidencias)	
				
			ELSE
				//La incidencia ya ha sido desagrupada por otro usuario
				gnv_msg.f_mensaje("EI46","","",OK!)
				d_lista_aviso.dbcancel()
				d_lista_aviso.reset()
				li_primera_vez=0
				this.triggerevent("ue_armar_sql")
			END IF
		ELSE
			//La incidencia ha sido modificada por otro usuario
			gnv_msg.f_mensaje("EI45","","",OK!)
		END IF
	END IF
	
END IF
end event

event ue_imp_reporte_inc;//***************************************
//**  OSGI 2001.1  	20/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_row, ll_i, ll_nro_incidencia[]
s_reporte_inc_aviso lstr_reporte_inc_aviso



lstr_reporte_inc_aviso.i_reporte = 1
ll_row = d_lista_aviso.GetSelectedRow(0)

DO WHILE ll_row > 0
	ll_i++
	
	lstr_reporte_inc_aviso.l_nro_inc_aviso[ll_i] = d_lista_aviso.GetItemNumber(ll_row, "nro_incidencia")
	
	ll_row = d_lista_aviso.GetSelectedRow(ll_row)	
LOOP

If UpperBound(lstr_reporte_inc_aviso.l_nro_inc_aviso) > 0 Then OpenSheetWithParm(w_re_inc_avisos, lstr_reporte_inc_aviso, w_operaciones, 8, Layered!)
//***************************************
//**  OSGI 2001.1  	20/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_operacion_mantenimiento();string ls_incid, ls_aux
int indice, li_par, li_tension, li_row
boolean lb_sigo=true
long ll_nro_incidencia, ll_refresco


if isvalid(gu_operaciones) and d_lista_aviso.rowcount() > 0 then
	li_row = d_lista_aviso.GetSelectedRow(0)
	
	ll_refresco = fw_comprobar_estado (li_row)
	IF ll_refresco = 1 THEN
		messagebox("Atencion","Los datos han cambiado y se refrescar$$HEX1$$e100$$ENDHEX$$n")
		w_1234_consulta_incidencias.li_primera_vez=0
		w_1234_consulta_incidencias.triggerevent("ue_armar_sql")	  
		RETURN
	END IF

	
//	li_tension = d_lista_aviso.getItemNumber(li_row,'tip_tension')
	//this.triggerevent("ue_obtener_datos")
	ll_nro_incidencia = d_lista_aviso.getitemnumber(li_row,"nro_incidencia")
	IF ll_nro_incidencia > 0 THEN
	//if il_inc_enviar > 0 then
	   //AHM 18/02/2010 Certificacion windows XP
		gu_operacionSgi.of_maniobrar_incidencia(ll_nro_incidencia)
//		gu_operaciones.of_maniobrar_incidencia(ll_nro_incidencia)
	end if
end if
end event

event ue_anular;long  ll_row, ll_cod_anulacion , ll_contador
string ls_usuario_anulacion, ls_descripcion
datetime ld_fecha_anulacion


datetime ldt_fecha_desde,	ldt_fecha_hasta	
date	ldt_fecha_desdes	, 	ldt_fecha_hastas

u_anular_incidencias lu_tratar_anulacion

ll_row = d_lista_aviso.GetSelectedRow(0) 

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
ll_row = d_lista_aviso.GetSelectedRow(0)

DO WHILE ll_row > 0

	lu_tratar_anulacion.of_cargar_incidencia(d_lista_aviso.GetItemNumber(ll_row, "nro_incidencia"))
	ll_row = d_lista_aviso.GetSelectedRow(ll_row)	
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

event ue_consultar_anulacion;long  ll_row 

ll_row = d_lista_aviso.GetSelectedRow(0)
if ll_row>0 then 
			gu_comunic.is_comunic.Accion_llamada= "Consulta" 
			gu_comunic.is_comunic.intval1 =d_lista_aviso.getitemnumber(ll_row,"cod_motivo")
			if gu_comunic.is_comunic.intval1 = 0 or isnull(gu_comunic.is_comunic.intval1) then 
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", " La incidencia seleccionada carece de datos de anulaci$$HEX1$$f300$$ENDHEX$$n")
			else
				gu_comunic.is_comunic.strval1= d_lista_aviso.getitemstring(ll_row,"usuario_anulacion")
				gu_comunic.is_comunic.strval2= d_lista_aviso.getitemstring(ll_row,"descripcion_motivo")
				gu_comunic.is_comunic.datval1= d_lista_aviso.getitemdatetime(ll_row,"fecha_anulacion")
				open(w_anular_incidencias)
			end if
end if

end event

event ue_desanular;long  ll_row, ll_nro_incidencia    



u_anular_incidencias lu_tratar_anulacion

ll_row = d_lista_aviso.GetSelectedRow(0) 

if ll_row > 0 then 

lu_tratar_anulacion= create u_anular_incidencias 

ll_nro_incidencia = d_lista_aviso.GetItemNumber(ll_row, "nro_incidencia")

lu_tratar_anulacion.of_revoca_anulacion(ll_nro_incidencia)



destroy lu_tratar_anulacion

setpointer(hourglass!)
// REFRESCAMOS LA VENTANA
li_primera_vez= 0
this.triggerevent("ue_armar_sql")

setpointer(arrow!)

end if

end event

public function boolean frn_hab_borrar_consulta ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_borrare_consulta
// 
// Objetivo: 
//           
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: --
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////




return FALSE
end function

public function boolean frn_hab_borrar_seleccion ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_borrar_seleccion
// 
// Objetivo: 
//           
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: --
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////






	Return FALSE

end function

public function boolean frn_hab_agregar_actualizacion ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_agregar_actualizaci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Habilito o Deshabilito ...
//           
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: ps_comunic
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////


if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_MANTEN') = 1 then
	
	Return TRUE

ELSE
	Return FALSE
END IF
end function

public function boolean frn_hab_borrar_actualizacion ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_borrar_actualizaci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: 
//           
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: --
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////



if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_MANTEN') = 1 then
	
	Return TRUE

ELSE
	Return FALSE
END IF
end function

public function boolean frn_hab_dobleclick_actualizacion ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_dobleclick_actualizacion
// 
// Objetivo: Habilita o Deshabilita el evento Dobleclick.
//           
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: --
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////





		//---------------------OPERACIONES-----------------------------------
if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_MANTEN') = 1 THEN
	RETURN TRUE
END IF

//	
//	gi_perfil_ok = {fgci_perfil_oper_gerente,&
//						fgci_perfil_oper_consulta,&
//						fgci_perfil_oper_mante_red,0}
//	IF	fgnu_tiene_perfil(0) THEN
//
//		Return FALSE
//	END IF
//
//		//---------------------MANTENIMIENTO-----------------------------------
//	
//	gi_perfil_ok={fgci_perfil_mante_consulta,&
//					fgci_perfil_mante_gerente,&
//					fgci_perfil_mantenimiento,0}
//	IF fgnu_tiene_perfil(0)THEN
//	
//			Return FALSE
//	END IF
//		
//	//---------------------TELEGESTIONES-----------------------------------
//
	RETURN FALSE
end function

public function boolean fnu_valido_datos ();DateTime ldt_fecha_desde
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
////////////////////////////VALIDO FILTRO AVISOS///////////////////


if d_filtro_aviso.object.ai_suministro[1] <> fgci_incidencia_reenganche then
	d_filtro_aviso.accepttext()   //se dispara el itemchange y se validan las condiciones de filtro
	IF not ib_rango THEN
		IF (d_filtro_aviso.getitemnumber(1,"ai_estado") = fgci_todos or d_filtro_aviso.getitemnumber(1,"ai_estado")=fgci_incidencia_resuelta) THEN
			IF fg_verifica_parametro('ambito seleccion') THEN
// Comentado por Sgo. Mejora Moldavia. 18/05/2005.
//				IF (d_ambito.getitemnumber(1,"nro_centro") = fgci_todos) THEN
//					IF FGNU_ES_NULA(ldt_fecha_desde) THEN	
//						gnv_msg.f_mensaje("EI28","","",OK!)
//						d_deteccion.setcolumn("desde")
//						d_deteccion.setfocus()
//						RETURN FALSE
//					ELSE
//						IF daysafter(ldt_fecha_desdes,ldt_fecha_hastas) > gl_cant_dias THEN
//							gnv_msg.f_mensaje("EI28","","",OK!)
//							d_deteccion.setcolumn("desde")
//							d_deteccion.setfocus()
//							RETURN FALSE
//						END IF
//					END IF
//				END IF
// Fin. Sgo.
			ELSE
// Comentado por Sgo. Mejora Moldavia. 18/05/2005.
//				IF isnull(ldt_fecha_desde) THEN
//					gnv_msg.f_mensaje("EI28","","",OK!)
//		//			d_deteccion.setitem(1,"desde",idt_fecha_desde)
//					d_deteccion.accepttext()
//					d_deteccion.setcolumn("desde")
//					d_deteccion.setfocus()
//					RETURN FALSE
//				ELSE
//					IF daysafter(ldt_fecha_desdes,ldt_fecha_hastas) > gl_cant_dias THEN
//						gnv_msg.f_mensaje("EI28","","",OK!)
//						d_deteccion.setitem(1,"desde",idt_fecha_desde)
//						d_deteccion.accepttext()
//						d_deteccion.setcolumn("desde")
//						d_deteccion.setfocus()
//			
//						RETURN FALSE
//					END IF
//				END IF
// Fin. Sgo.
				IF d_ambito.getitemnumber(1,"nro_centro") = fgci_todos THEN
					gnv_msg.f_mensaje("EI29","","",OK!)
					d_ambito.setcolumn("nro_centro")
					d_ambito.setfocus()
					RETURN FALSE
				ELSEIF d_ambito.getitemnumber(1,"nro_cmd") = fgci_todos THEN
						gnv_msg.f_mensaje("EI30","","",OK!)
						d_ambito.setcolumn("nro_cmd")
						d_ambito.setfocus()
						RETURN FALSE
				END IF			
			END IF
		END IF
	END IF
END IF
return TRUE
end function

public subroutine fnu_orden_anterior ();String res
CHOOSE CASE ii_orden_ant
	CASE 1
			res = d_lista_aviso.fnu_ordenar_por_duracion()
	CASE 2
			res =d_lista_aviso.fnu_ordenar_tip_incidencia()
	CASE 3
			res =d_lista_aviso.fnu_ordenar_estado_oper()
	CASE 4
			res =d_lista_aviso.fnu_ordenar_estado_mant()
	CASE 5
			res =d_lista_aviso.fnu_ordenar_ccli_afec()
	CASE 6
		res =d_lista_aviso.fnu_ordenar_pot_afectada()
	CASE 7
			res =d_lista_aviso.fnu_ordenar_fecha_res()
	CASE 8 
			res=d_lista_aviso.fnu_ordenar_fecha_deteccion()
	CASE 9
			res=d_lista_aviso.fnu_ordenar_instalacion()
	CASE ELSE
		res =d_lista_aviso.fnu_ordenar_por_duracion()
END CHOOSE
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

ib_selected = False
ll_last_selected = 0

For ll_i = 1 To ll_rowcount
   If adw_dataw.IsSelected(ll_i) Then
		ll_is_selected++
		ll_last_selected = ll_i
	End If

   If ll_is_selected > 1 Then
		ib_selected = True
		Exit
	End If
Next



If ll_is_selected <= 1 Then
	If ll_is_selected = 0 Then	adw_dataw.SelectRow(row, True)
	il_row_click = ll_last_selected
End If

adw_dataw.SetReDraw(True)



If ib_selected Then
	md_lista_incidencia.m_editar.m_agruparincidencia.enabled = False
	md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = False
	md_lista_incidencia.m_archivo.m_eliminar.enabled = False
	md_lista_incidencia.m_consultar.m_situacinclimatolgica.enabled = False
	md_lista_incidencia.m_consultar.m_suministrosimportantes.enabled = False
	md_lista_incidencia.m_consultar.m_avisosasociados.enabled = False
	md_lista_incidencia.m_consultar.m_datosanulacin.enabled = False
	md_lista_incidencia.m_editar.m_deshaceranulacin.enabled = false

	md_lista_incidencia.m_consultar.m_observaciones.enabled = False
	md_lista_incidencia.m_consultar.m_operacion.enabled = False
	md_lista_incidencia.m_consultar.m_imprimir1.enabled = False


	md_lista_incidencia.m_consultar.m_operacion.enabled = False
	md_lista_incidencia.m_consultar.m_maniobrarenoperacin.enabled = False
Else
	md_lista_incidencia.m_consultar.m_situacinclimatolgica.enabled = True
	md_lista_incidencia.m_consultar.m_suministrosimportantes.enabled = True
	md_lista_incidencia.m_consultar.m_avisosasociados.enabled = True
	/*DEO12-00000007 JHE 12/12/2012          
	Se agrega nueva validadcion para controlar las observaciones 
	de las incidencias
	md_lista_incidencia.m_consultar.m_observaciones.enabled = True*/
	ii_valormant = gu_perfiles.of_acceso_perfil(gi_perfil,"INC_OBSERVA","ACC_MANTEN")
	ii_valorcons = gu_perfiles.of_acceso_perfil(gi_perfil,"INC_OBSERVA","ACC_CONSULTA")
	
	if ii_valormant=0 and ii_valorcons = 0 then 
		md_lista_incidencia.m_consultar.m_observaciones.enabled = false
	elseif ii_valormant=1 and ii_valorcons = 0 then	
		md_lista_incidencia.m_consultar.m_observaciones.enabled = true
	elseif ii_valormant=0 and ii_valorcons = 1 then	
		md_lista_incidencia.m_consultar.m_observaciones.enabled = true
	end if 
	/*DEO12-00000007 JHE 12/12/2012 FIN*/
	///////////////////////////////////////////////////////	
	
	md_lista_incidencia.m_consultar.m_imprimir1.enabled = True
End If

Return ll_last_selected
//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

public function boolean fw_enviar_operacion (integer pi_tipo_incidencia);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : fw_enviar_operacion
//
//  Argumentos : pi_tipo_incidencia --> tipo de la incidencia
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Determina si la incidencia se puede enviar a Operaci$$HEX1$$f300$$ENDHEX$$n 								
//	
//
//  Valores de retorno :  false --> No se env$$HEX1$$ed00$$ENDHEX$$a
//				  				  true  --> Se env$$HEX1$$ed00$$ENDHEX$$a
//
//  Realizado por Alfonso Coto
//
//  Fecha : 10/05/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



CHOOSE CASE pi_tipo_incidencia
	CASE fgci_incidencia_calidad, fgci_incidencia_scada
			return false
	CASE ELSE
			return true
END CHOOSE


end function

public function boolean fw_incidencia_operaciones (integer pi_tipo_tension);long ll_nro_instalacion, ll_cant_maniobras, ll_cant_int, ll_nro_incidencia, ll_array[]
long ll_fila, ll_estado_red
int li_tipo_instalacion, li_tip_incidencia, li_estado, li_alcance,li_permito

ll_fila = d_lista_aviso.getselectedrow(0)
//ll_fila = il_row

IF ll_fila > 0 THEN
	ll_nro_instalacion = d_lista_aviso.GetitemNumber(ll_fila,"nro_inst_afectada")
	li_tip_incidencia = d_lista_aviso.GetitemNumber(ll_fila, "tip_incidencia")
	li_estado = d_lista_aviso.GetitemNumber(ll_fila, "est_actual")
	li_alcance = d_lista_aviso.GetitemNumber(ll_fila, "sgd_incidencia_alcance")
	ll_nro_incidencia = d_lista_aviso.GetitemNumber(ll_fila, "nro_incidencia")
	
	SELECT TIPO_INSTALACION
	INTO :li_tipo_instalacion
	FROM SGD_INSTALACION 
	WHERE NRO_INSTALACION = :ll_nro_instalacion
			AND BDI_JOB = 0;
	
	IF gb_operaciones and gb_operaciones_inst then
		
		ll_array[2] = ll_nro_instalacion
			
		li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],li_tipo_instalacion)
	
		////////////////////////////////////////////////////////////////////////////////////
	// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
	// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
	SELECT NVL(ESTADO_RED,0)
	INTO :ll_estado_red
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :ll_nro_incidencia;
	
	IF SQLCA.SQLCode = 0 AND ll_estado_red = -10 Then return false
	
	IF gb_operaciones_inst then
		if ll_estado_red = -10 then 
			 return false
		else 
			return true
		end if
	END IF
	/////////////////////////////////////////////////////////////////////
	
		if li_permito = 1 then
			Return TRUE
		elseif li_permito = -1 then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n",gu_rf.is_mensaje,information!,ok!)
			return TRUE
		else
			return FALSE
		end if		
		
	ELSE
	
		////////////////////////////////////////////////////////////////////////////////////
	// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
	// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
	SELECT NVL(ESTADO_RED,0)
	INTO :ll_estado_red
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :ll_nro_incidencia;
	
	IF SQLCA.SQLCode = 0 AND ll_estado_red = -10 Then return false

		
	IF gb_operaciones_inst then
		if ll_estado_red = -10 then 
			 return false
		else 
			return true
		end if
	end if
	/////////////////////////////////////////////////////////////////////
	
		IF gb_operaciones = TRUE AND pi_tipo_tension <= gi_tension_nivel_min THEN

			IF gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion = fgci_tipo_ct THEN
			
				return false
				
			ELSEIF gi_tension_nivel_min = fgci_alta_tension AND li_tipo_instalacion = fgci_tipo_subestacion THEN
				return FALSE
				
			ELSE
				return TRUE
			END IF
		ELSE
			RETURN FALSE
		END IF
	END IF
ELSE
	RETURN FALSE
END IF


end function

public function integer fw_borrar_ot (long pl_nro_incidencia);// Se elimina la OT asociada a la incidencia, as$$HEX2$$ed002000$$ENDHEX$$como se liberan las brigadas 
// asignadas a ella
long ll_nro_ot, ll_nro_brigada, li_lock_status
int li_retorno = 1
Datetime ldt_f_hasta

DECLARE lc_cursor_brigadas CURSOR FOR
	SELECT NRO_BRIGADA, F_HASTA
	FROM GI_BRIGADA_OT
	WHERE NRO_OT = :ll_nro_ot;
		

// Se busca si existe una OT asociada a la incidencia
// LA OT NO SE BLOQUEA DEBIDO A QUE EST$$HEX2$$c1002000$$ENDHEX$$ASOCIADA A UNA INCIDENCIA
SELECT NRO_OT
INTO :ll_nro_ot
FROM GI_OT
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCode = 0 THEN
	// Existe una OT asociada a la incidencia
	// Se comprueba que existan brigadas asignadas a la OT que se encuentren trabajando.
	// En caso de que existan, se bloquean y se ponen disponibles

	OPEN lc_cursor_brigadas;
	IF SQLCA.SQLCode = 0 THEN
		// cursor abierto correctamente
		FETCH lc_cursor_brigadas INTO :ll_nro_brigada, :ldt_f_hasta;
		
		// Se buscan las brigadas asignadas a la OT
		DO WHILE SQLCA.SQLCode = 0 AND li_lock_status = 0 AND li_retorno = 1
			IF Isnull(ldt_f_hasta) THEN
				// La brigada se encuentra trabajando
				// Se bloquea y se libera
				li_lock_status = gnu_u_transaction.uf_lock_brigada(ll_nro_brigada)
			ELSE
				li_lock_status = 0
			END IF
			
			IF li_lock_status = 0 THEN
				IF Isnull(ldt_f_hasta) THEN 
					// La brigada se pone disponible
					UPDATE GI_BRIGADA
					SET IND_DISPONIBLE = 1,
						 IND_BLOQUEO = 0
					WHERE NRO_BRIGADA = :ll_nro_brigada;
				
					IF SQLCA.SQLCode <> 0 THEN
						li_retorno = 0
					END IF
				END IF
			ELSE
				li_retorno = 0
			END IF
			
			FETCH lc_cursor_brigadas INTO :ll_nro_brigada, :ldt_f_hasta;
		LOOP
		
		CLOSE lc_cursor_brigadas;
		
		IF li_retorno = 1 THEN
			// Se borran las brigadas asignadas a la OT
			DELETE GI_BRIGADA_OT
			WHERE NRO_OT =: ll_nro_ot;
			
			IF SQLCA.SQLCode = 0 THEN
				// Se borran las posibles contratas asignadas a la OT
				DELETE GI_CONTRATA_OT
				WHERE NRO_OT =: ll_nro_ot;
				
				IF SQLCA.SQLCode >= 0 THEN
					// Se borra la OT
					DELETE GI_OT
					WHERE NRO_OT = :ll_nro_ot;
					
					IF SQLCA.SQLCode <> 0 THEN
						li_retorno = 0
					END IF
				ELSE
					li_retorno = 0
				END IF
			ELSE
				li_retorno = 0 
			END IF
		END IF
	ELSE
		li_retorno = 0 
	END IF
		
END IF

return li_retorno

end function

public function integer fw_borrar_incidencia_con_perdida (long pl_nro_incidencia);long ll_nro_interr
int li_lock_status, li_retorno = 1

// Si la incidencia no tiene interrupciones/maniobras se permite
// eliminar la incidencia
SELECT COUNT(*)
INTO :ll_nro_interr
FROM SGD_INTERRUPCION 
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCode = 0 THEN
	// Se comprueba si hay interrupciones
	IF ll_nro_interr > 0 THEN
		//No se puede eliminar la incidencia debido a que ya existen interrupciones definidas
		gnv_msg.f_mensaje("AI155","","",OK!)
		li_retorno = 0
	ELSE
		// Se comprueba si hay maniobras
		SELECT COUNT(*)
		INTO :ll_nro_interr
		FROM SGD_MANIOBRA 
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

		IF SQLCA.SQLCode = 0 THEN
			IF ll_nro_interr > 0 THEN
				//No se puede eliminar la incidencia debido a que ya existen interrupciones definidas
				gnv_msg.f_mensaje("AI155","","",OK!)
				li_retorno = 0
			END IF
		ELSE
			
			// GNU 18-9-2007. Incidencia 0/514711
			SELECT COUNT(*)
			INTO :ll_nro_interr
			FROM SGD_INTERRUPCION_RS 
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
			
			IF SQLCA.SQLCode = 0 THEN
				IF ll_nro_interr > 0 THEN
				//No se puede eliminar la incidencia debido a que ya existen interrupciones definidas
					gnv_msg.f_mensaje("AI155","","",OK!)
					li_retorno = 0
				END IF
			ELSE
			// FIN GNU
			//No se puede eliminar la incidencia debido a un error con la Base de Datos
				gnv_msg.f_mensaje("EI40","","",OK!)
				li_retorno = 0
			END IF
		END IF
	END IF
		
ELSE
	//No se puede eliminar la incidencia debido a un error con la Base de Datos
	gnv_msg.f_mensaje("EI40","","",OK!)
	li_retorno = 0
END IF

IF li_retorno = 1 THEN
	//Se bloquea la incidencia
	li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
	IF li_lock_status = 0 THEN
		// Incidencia bloqueada con $$HEX1$$e900$$ENDHEX$$xito
		IF fw_borrar_ot(pl_nro_incidencia) > 0 THEN
			IF fw_borrar_incidencia(pl_nro_incidencia) > 0 THEN
			    fw_liberar_aviso(pl_nro_incidencia)
			    gnu_u_transaction.uf_commit(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
			ELSE
				gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
				//No se ha podido borrar la incidencia
				gnv_msg.f_mensaje("EI41","","",OK!)

				li_retorno = 0
			END IF
				
		ELSE
			gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
			//No se ha podido borrar la incidencia ya que no se ha podido desasociar la OT
			gnv_msg.f_mensaje("EI42","","",OK!)
			li_retorno = 0
		END IF
	ELSE
		li_retorno = 0
	END IF
END IF

return li_retorno
end function

public function integer fw_liberar_aviso (long pl_nro_incidencia);// Funci$$HEX1$$f300$$ENDHEX$$n que actualiza la tablas GI_AVISOS y GI_AVISOS_INSTALACION, para indicar que 
// el aviso queda pendiente.

// No hace falta bloquear el aviso, ya que est$$HEX2$$e1002000$$ENDHEX$$asociado a la incidencia y 
// no puede ser manipulado por ning$$HEX1$$fa00$$ENDHEX$$n usuario
long ll_tipo_inc, ll_nro_inst_afectada, ll_ind_inc_asoc
long ll_nro_incidencias_instalacion
int li_clase_aviso

SELECT tip_incidencia, nro_inst_afectada
INTO :ll_tipo_inc, :ll_nro_inst_afectada
FROM SGD_INCIDENCIA
WHERE nro_incidencia= :pl_nro_incidencia;

IF ll_tipo_inc=1 then
	li_clase_aviso= 0
ELSE
	li_clase_aviso= 3
END IF

SELECT COUNT(*)
INTO :ll_nro_incidencias_instalacion
FROM SGD_INCIDENCIA
WHERE est_actual< :fgci_incidencia_servicio_repuesto and
nro_incidencia<> :pl_nro_incidencia and 
nro_inst_afectada =:ll_nro_inst_afectada and
tip_incidencia= :ll_tipo_inc; 

IF ll_nro_incidencias_instalacion= 0 THEN
	ll_ind_inc_asoc=0
ELSE
	ll_ind_inc_asoc=1
END IF

UPDATE GI_AVISOS_INSTALACION
SET EST_AVISO = :fgci_aviso_pendiente,
	 IND_INCIDENCIA = :ll_ind_inc_asoc,
	 F_ACTUAL = SYSDATE
WHERE NRO_AVISO IN (SELECT NRO_AVISO
						 FROM GI_AVISOS
						 WHERE NRO_INCIDENCIA = :pl_nro_incidencia);

IF SQLCA.SQLCode = 0 THEN
	UPDATE GI_AVISOS
	SET EST_AVISO = :fgci_aviso_pendiente,
		 NRO_INCIDENCIA = 0,
		 IND_INC_ASOC = :ll_ind_inc_asoc,
		 F_ACTUAL = SYSDATE,
		 IND_INC_MANUAL = 0
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
	IF SQLCA.SQLCode = 0 THEN
		return 1
	ELSE
		return 0
	END IF
	
ELSE
	return 0
END IF

end function

public function integer fw_borrar_incidencia (long pl_nro_incidencia);// Funci$$HEX1$$f300$$ENDHEX$$n que borra una incidencia de SGD_INCIDENCIA, y sus datos de SGD_ESTADO_OPER,
// GI_ACCION_INC y GI_MATERIALES. Si la incidencia es una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidencias se 
// borran tambi$$HEX1$$e900$$ENDHEX$$n las incidencias que forman parte de la agrupaci$$HEX1$$f300$$ENDHEX$$n.

int li_retorno = 1
int li_cuenta_inc, li_fila
long ll_nro_agrupacion
datetime ldt_f_actual

ldt_f_actual = fgnu_fecha_actual()

li_fila = d_lista_aviso.GetSelectedRow(0)
ll_nro_agrupacion = d_lista_aviso.GetItemNumber(li_fila, 'sgd_incidencia_nro_agrupacion')

IF fg_verifica_parametro("indisponibilidades activas") then
	SELECT COUNT(*)
	INTO :li_cuenta_inc
	FROM SGD_INDISPONIBILIDAD
	WHERE NRO_INCIDENCIA= :pl_nro_incidencia 
		AND not(F_REPOSICION IS NULL);
	
	IF li_cuenta_inc > 0 THEN
		li_retorno=0
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La incidencia no se puede eliminar porque tiene indisponibilidades")
	ELSE	
		SELECT COUNT(*)
		INTO :li_cuenta_inc
		FROM SGD_INDISPONIBILIDAD
		WHERE NRO_INCIDENCIA= :pl_nro_incidencia;
		if li_cuenta_inc > 0 THEN
			li_retorno=0
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La incidencia tiene indisponibilidades marcadas")
		end if
	end if
end if

if li_retorno= 1 then
	IF (NOT IsNull(ll_nro_agrupacion)) AND ll_nro_agrupacion > 0 THEN
		li_retorno = fw_borrar_incid_agrupadas(ll_nro_agrupacion)
	END IF
end if

IF li_retorno > 0 THEN
	DELETE SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
	
	// BORRO LA I CUANDO PROCEDA DE LOS AVISOS
	
	SELECT COUNT(*) 
	INTO :li_cuenta_inc
	FROM "SGD_INCIDENCIA"
	WHERE "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :gl_instalacion_afectada AND
				"SGD_INCIDENCIA"."EST_ACTUAL" < :fgci_incidencia_resuelta;
				
	IF li_cuenta_inc < 1 then
	
		//no tiene que tener el indicativo de incidencia asociada
		
		UPDATE "GI_AVISOS_INSTALACION"  
				  SET "IND_INCIDENCIA" = 0,  
						"F_ACTUAL"= :ldt_f_actual
			  WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :gl_instalacion_afectada  and 
						  "GI_AVISOS_INSTALACION"."CLASE_AVISO" = :ii_clase_aviso;
	
		UPDATE GI_AVISOS_INSTALACION
			SET F_ACTUAL = :ldt_f_actual
			WHERE NRO_AVISO in (select nro_Aviso from gi_avisos_instalacion  WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :gl_instalacion_afectada and
					"GI_AVISOS_INSTALACION"."CLASE_AVISO" = :ii_clase_aviso);
									
	END IF
	
	IF SQLCA.SQLCode >= 0 THEN
		DELETE SGD_ESTADO_OPER
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
		
		IF SQLCA.SQLCode >= 0 THEN
			DELETE GI_ACCION_INC
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
			
			IF SQLCA.SQLCode >= 0 THEN
				DELETE GI_MATERIALES
				WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
				
				IF SQLCA.SQLCode >= 0 THEN
					li_retorno = 1
				ELSE
					li_retorno = 0
				END IF
			ELSE
				li_retorno = 0
			END IF
		ELSE
			li_retorno = 0
		END IF
	ELSE
		li_retorno = 0
	END IF
END IF

return li_retorno
end function

public function integer fw_borrar_incidencia_sin_perdida (long pl_nro_incidencia, integer pi_tipo_incidencia, integer pi_alcance);int li_lock_status
int li_retorno = 1

//Se bloquea la incidencia
li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
IF li_lock_status = 0 THEN
	// Incidencia bloqueada con $$HEX1$$e900$$ENDHEX$$xito
	IF pi_alcance = fgci_incidencia_de_suministro OR &
		pi_tipo_incidencia = fgci_incidencia_calidad THEN 
		// Incidencia imprevista de suministro, de calidad sobre una instalaci$$HEX1$$f300$$ENDHEX$$n, o de calidad
		// sobre suministro:  hay que liberar los avisos asociados a la incidencia
		
		IF fw_liberar_aviso(pl_nro_incidencia) <= 0 THEN
			gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
			// No se ha podido liberar el aviso
			gnv_msg.f_mensaje("EI43","","",OK!)
			li_retorno = 0
		END IF
	END IF
	
	IF li_retorno = 1 THEN		
		IF fw_borrar_ot(pl_nro_incidencia) > 0 THEN
			IF fw_borrar_incidencia(pl_nro_incidencia) > 0 THEN
				gnu_u_transaction.uf_commit(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
			ELSE
				gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
				//No se ha podido borrar la incidencia
				gnv_msg.f_mensaje("EI41","","",OK!)
				li_retorno = 0
			END IF
				
		ELSE
			gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
			//No se ha podido borrar la incidencia ya que no se ha podido desasociar la OT
			gnv_msg.f_mensaje("EI42","","",OK!)
			li_retorno = 0
		END IF
	END IF
ELSE
	li_retorno = 0
END IF

return li_retorno
end function

public function integer fw_recomponer_arbol (long pl_nro_incidencia, integer pi_clase_aviso);long ll_inst_afect
int li_cuenta_inc, li_fila
Datetime ldt_f_actual

li_fila = This.d_lista_aviso.getrow()

IF li_fila > 0 THEN
	ll_inst_afect = This.d_lista_aviso.GetItemNumber(li_fila, 'nro_inst_afectada')

	SELECT COUNT(*) 
	INTO :li_cuenta_inc
	FROM "SGD_INCIDENCIA"
	WHERE "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :ll_inst_afect AND
			"SGD_INCIDENCIA"."EST_ACTUAL" < :fgci_incidencia_resuelta;
	
	IF li_cuenta_inc < 1 then
		ldt_F_actual = fgnu_fecha_actual()
		//no tiene que tener el indicativo de incidencia asociada
		UPDATE "GI_AVISOS_INSTALACION"  
		SET "IND_INCIDENCIA" = 0,  
			 "F_ACTUAL"= :ldt_f_actual
		WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :ll_inst_afect and 
			  "GI_AVISOS_INSTALACION"."CLASE_AVISO" = :pi_clase_aviso;
	
		UPDATE GI_AVISOS_INSTALACION
		SET F_ACTUAL = :ldt_f_actual
		WHERE NRO_AVISO in (select nro_Aviso 
								  from gi_avisos_instalacion  
								  WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :ll_inst_afect and
											  "GI_AVISOS_INSTALACION"."CLASE_AVISO" = :pi_clase_aviso);
									
	END IF
END IF

return 1
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


CHOOSE CASE pi_tip_incidencia

CASE fgci_incidencia_imprevista  //,fgci_incidencia_obligada INDICATIVO OBLIGADA AMR VERSION UNIFICADA 02/09/2002
		
		if (pi_alcance = fgci_incidencia_de_suministro or pi_alcance = fgci_incidencia_sin_interrupcion) 	and (pi_estado <= fgci_incidencia_servicio_repuesto) then 
				 lb_resultado =  true 
		elseif (pi_alcance = fgci_incidencia_con_interrupcion) and (pi_estado  = fgci_incidencia_servicio_repuesto) then 
				 lb_resultado =  true
		else 
				 lb_resultado = false
		end if		
		
		
		
		
case fgci_incidencia_programada			
	lb_resultado = false
	
case fgci_incidencia_calidad
	
if (pi_alcance = fgci_incidencia_de_suministro or pi_alcance = fgci_incidencia_de_instalacion)  and (pi_estado <= fgci_incidencia_servicio_repuesto) then 
	 lb_resultado = true 
end if

END CHOOSE



return lb_resultado
end function

public function integer fw_borrar_incid_agrupadas (long pl_nro_agrupacion);///////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_borrar_incid_agrupadas
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que borra las incidencias que forman parte de la agrupaci$$HEX1$$f300$$ENDHEX$$n de 
//				 incidencias que se desea eliminar, as$$HEX2$$ed002000$$ENDHEX$$como toda la informaci$$HEX1$$f300$$ENDHEX$$n de la agrupaci$$HEX1$$f300$$ENDHEX$$n
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    Entrada:   
//
//    Salida:  
//   
//    Devuelve: 
//					1 -->  Correcto
//					0 -->  Error
//
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 10/01/2002	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

int li_retorno = 1

// Se borran las incidencias agrupadas de la tabla GI_INCIDENCIA_AGRUPADA
DELETE GI_INCIDENCIA_AGRUPADA
WHERE NRO_AGRUPACION = :pl_nro_agrupacion;

IF SQLCA.SQLCode < 0 THEN
	li_retorno = 0
END IF

IF li_retorno > 0 THEN
	// Se borran los datos de la agrupaci$$HEX1$$f300$$ENDHEX$$n de la tabla gi_seguimiento_agrupacion
	DELETE GI_SEGUIMIENTO_AGRUPACION
	WHERE NRO_AGRUPACION = :pl_nro_agrupacion;
	
	IF SQLCA.SQLCode < 0 THEN
		li_retorno = 0
	END IF
END IF

IF li_retorno > 0 THEN
	// Se borran los estados de las incidencias que forman parte de la agrupaci$$HEX1$$f300$$ENDHEX$$n
	DELETE GI_ESTADO_OPER_DESAGRUP
	WHERE NRO_AGRUPACION = :pl_nro_agrupacion;

	IF SQLCA.SQLCode < 0 THEN
		li_retorno = 0
	END IF
END IF

return li_retorno

end function

public function integer f_poner_menu_invisible (boolean pb_visible);
If pb_visible = true then
	md_lista_incidencia.m_consultar.m_datosanulacin.visible = true
	md_lista_incidencia.m_editar.m_deshaceranulacin.visible = true
	md_lista_incidencia.m_consultar.m_operacion.visible = true
	md_lista_incidencia.m_consultar.m_maniobrarenoperacin.visible = true
	md_lista_incidencia.m_editar.m_agruparincidencia.visible = true
	md_lista_incidencia.m_editar.m_desagruparincidencias.visible = true
	md_lista_incidencia.m_consultar.m_situacinclimatolgica.visible = true
	md_lista_incidencia.m_consultar.m_suministrosimportantes.visible = true
	md_lista_incidencia.m_consultar.m_avisosasociados.visible = true
	
   /*DEO12-00000007 JHE 12/12/2012          
	Se agrega nueva validadcion para controlar las observaciones 
	de las incidencias
	md_lista_incidencia.m_consultar.m_observaciones.visible = true
	md_lista_incidencia.m_consultar.m_observaciones.toolbaritemvisible = true*/
	ii_valormant = gu_perfiles.of_acceso_perfil(gi_perfil,"INC_OBSERVA","ACC_MANTEN")
	ii_valorcons = gu_perfiles.of_acceso_perfil(gi_perfil,"INC_OBSERVA","ACC_CONSULTA")
	
	if ii_valormant=0 and ii_valorcons = 0 then 
		md_lista_incidencia.m_consultar.m_observaciones.enabled = false
		md_lista_incidencia.m_consultar.m_observaciones.toolbaritemvisible = false
	elseif ii_valormant=1 and ii_valorcons = 0 then	
		md_lista_incidencia.m_consultar.m_observaciones.enabled = true
		md_lista_incidencia.m_consultar.m_observaciones.toolbaritemvisible = true
	elseif ii_valormant=0 and ii_valorcons = 1 then	
		md_lista_incidencia.m_consultar.m_observaciones.enabled = true
		md_lista_incidencia.m_consultar.m_observaciones.toolbaritemvisible = true
	end if 
	/*DEO12-00000007 JHE 12/12/2012 FIN*/
	///////////////////////////////////////////////////////	
	md_lista_incidencia.m_consultar.m_datosanulacin.toolbaritemvisible = true
	md_lista_incidencia.m_editar.m_deshaceranulacin.toolbaritemvisible = true
	md_lista_incidencia.m_consultar.m_operacion.toolbaritemvisible = true
	md_lista_incidencia.m_consultar.m_maniobrarenoperacin.toolbaritemvisible = true
	md_lista_incidencia.m_editar.m_agruparincidencia.toolbaritemvisible = true
	md_lista_incidencia.m_editar.m_desagruparincidencias.toolbaritemvisible = true
	md_lista_incidencia.m_consultar.m_situacinclimatolgica.toolbaritemvisible = true
	md_lista_incidencia.m_consultar.m_suministrosimportantes.toolbaritemvisible = true
	md_lista_incidencia.m_consultar.m_avisosasociados.toolbaritemvisible = true
	
else
	md_lista_incidencia.m_consultar.m_datosanulacin.visible = false
	md_lista_incidencia.m_editar.m_deshaceranulacin.visible = false
	md_lista_incidencia.m_consultar.m_operacion.visible = false
	md_lista_incidencia.m_consultar.m_maniobrarenoperacin.visible = false
	md_lista_incidencia.m_editar.m_agruparincidencia.visible = false
	md_lista_incidencia.m_editar.m_desagruparincidencias.visible = false
	md_lista_incidencia.m_consultar.m_situacinclimatolgica.visible = false
	md_lista_incidencia.m_consultar.m_suministrosimportantes.visible = false
	md_lista_incidencia.m_consultar.m_avisosasociados.visible = false
	md_lista_incidencia.m_consultar.m_observaciones.visible = false
	
	md_lista_incidencia.m_consultar.m_datosanulacin.toolbaritemvisible = false
	md_lista_incidencia.m_editar.m_deshaceranulacin.toolbaritemvisible = false
	md_lista_incidencia.m_consultar.m_operacion.toolbaritemvisible = false
	md_lista_incidencia.m_consultar.m_maniobrarenoperacin.toolbaritemvisible = false
	md_lista_incidencia.m_editar.m_agruparincidencia.toolbaritemvisible = false
	md_lista_incidencia.m_editar.m_desagruparincidencias.toolbaritemvisible = false
	md_lista_incidencia.m_consultar.m_situacinclimatolgica.toolbaritemvisible = false
	md_lista_incidencia.m_consultar.m_suministrosimportantes.toolbaritemvisible = false
	md_lista_incidencia.m_consultar.m_avisosasociados.toolbaritemvisible = false
	md_lista_incidencia.m_consultar.m_observaciones.toolbaritemvisible = false
end if

return 1
end function

public function integer fw_borrar_reenganche (long pl_nro_incidencia);int li_retorno = 0

DELETE FROM SGD_REENGANCHES WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCODE = 0 THEN 
	li_retorno = 1
ELSE
	return 0
END IF

DELETE FROM SGD_MANIOBRA_REENGANCHE WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCODE = 0 THEN 
	li_retorno = 1
ELSE
	return 0
END IF

DELETE FROM SGD_INTERRUPCION_REENGANCHE WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCODE = 0 OR SQLCA.SQLCODE = 100 THEN 
	li_retorno = 1
ELSE
	return 0
END IF

return li_retorno
end function

public function long fw_comprobar_estado (long pl_fila);int li_estado, li_estado_bd
long ll_nro_incidencia, ll_return

li_estado = d_lista_aviso.GetItemNumber(pl_fila,'est_actual')
ll_nro_incidencia = d_lista_aviso.GetItemNumber(pl_fila,'nro_incidencia')

SELECT EST_ACTUAL
INTO :li_estado_bd
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :ll_nro_incidencia;

IF (SQLCA.SQLCODE = 0) THEN
	IF (li_estado = li_estado_bd) THEN
		// NO HA CAMBIADO DE ESTADO
		ll_return = 0
	ELSE
		// SE HAN PRODUCIDO CAMBIOS 
		ll_return = 1
	END IF
ELSE
	// SE HAN PRODUCIDO CAMBIOS
	ll_return = 1
END IF

return ll_return
end function

event ue_arch_agregar;SetPointer(HourGlass!)
if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_MANTEN') = 1 &
	and lu_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
	IF frn_hab_agregar_actualizacion() THEN
			gu_comunic.is_comunic.programa_llamante = "w_1234_consulta_incidencia"
			gu_comunic.is_comunic.accion_llamada = "Alta"
			gu_comunic.is_comunic.intval3 = gi_nro_centro
			gu_comunic.is_comunic.intval4 = gi_nro_cmd	
			gu_comunic.is_comunic.intval5 = gi_nro_puesto
			gu_comunic.is_comunic.longval4 = 0
		//gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",0,1,w_1234_consulta_incidencias,"w_1234_consulta_incidencias")
	
	gu_control_v_incidencias.of_abre_ventana(-1,-1,w_operaciones,0)
	
	
//	OpenSheet(w_2301_form_incidencia,w_operaciones,0,Layered!)
	ELSE
			gnv_msg.f_mensaje("AI65","","",OK!)
			lu_comunic.is_comunic.accion_retorno = "No Seleccionada"

	END IF			
END IF
end event

event open;call super::open;l_grabo_inc=true
ib_si_valido=True
this.setredraw(false)
setpointer(hourglass!)
li_primera_vez=0    //me indica que no se ha efectuado la consulta aun.

// Variable de comunicaciones es gu_comunic.
// Parametros de Entrada
//		gu_comunic.is_comunic.intval1 = Centro , en 0 Centro del usuario
//		gu_comunic.is_comunic.intval2 = CMD, 0 cmd del usuario
//    gu_comunic.is_comunic.intval3 = puesto 0 puesto del usuario
//		gu_comunic.is_comunic.datval1 = Desde 0 fecha del dia
//    gu_comunic.is_comunic.datval2 = hasta 0 hora del dia
//		gu_comunic.is_comunic.intval4 = Estado 0 Todos los estado
//		gu_comunic.is_comunic.intval5 = Tipo 0 Todos los tipos
// 	gu_comunic.is_comunic.intval6 = duracion 0 No se considera duracion
// 	gu_comunic.is_comunic.intval7 = Tension 0 todas las alimentaciones
//		gu_comunic.is_comunic.intval8	= Estado de Mantenimiento
//    gu_comunic.is_comunic.intval10 = Suministro
//    gu_comunic.is_comunic.Accion_llamada = "Seleccion" , blanco consulta
//														 = "Consulta"
//														 = "Actualizacion"
// Devuelve valores en 
// 	gu_comunic.is_comunic.longval1 // numero de incidencia seleccionada
//		gu_comunic.is_comunic.accion_retorno = "Seleccionada"
//															"No Seleccionada"
//		gu_comunic.is_comunic.strval1  // descripcion de la incidencia
				

//******************CREACION DE OBJETOS DE TRABAJO***********************
	lu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
	lu_comunic1 = create u_generico_comunicaciones  // Creo variable de trabajo con formulario
	iu_resetea = create u_generico_comunicaciones  // Creo variable para resetear la variable de comunicaciones


//******************OBTENGO y VALIDO  PARAMETROS DE ENTRADA*************************

	lu_comunic.is_comunic = gu_comunic.is_comunic // Transfiero valores desde globales.
	lu_comunic.is_comunic.intval4=fgci_hasta_serv_repuesto
	

//******************PREPARACION DE PRESENTACION DE LA VENTANA************

triggerevent("ue_presentacion") // titulos ventana y crea dropdown
triggerevent("ue_inicializo_estructura_perfil")
triggerevent("ue_inicializo_objetos")


// Controlo  la visibilidad/invisibilidad de el boton que calcula el total de registro
// mediante la activaci$$HEX1$$f300$$ENDHEX$$n del parametro con cod_parametro=50
IF fg_verifica_parametro('registros seleccionados') THEN
	gb_1.visible = true
	cb_total.visible = true
ELSE
	gb_1.visible = false
	cb_total.visible = false
END IF	
	
	
//****************EFECTUO EL RETRIVE A LA BASE DE DATOS*******************
	// Obtengo la clausula select original de la datawindow.
	d_lista_aviso.settransobject(sqlca) // me conecto a la base para modificar
	is_select_original = d_lista_aviso.Describe("datawindow.table.select")
	ii_orden_ant=3	
//	this.triggerevent("ue_armar_sql")
	d_filtro_aviso.setcolumn("ai_estado")
	d_ambito.setcolumn("nro_centro")

this.setredraw(true)	
li_primera_vez=1    //se ejecuto la consulta por lo menos una vez.

d_filtro_aviso.object.operacion[1] = "<"
d_filtro_aviso.object.tiempo[1] = 2
 
if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_MANTEN")=0 then 
	md_lista_incidencia.m_archivo.m_agregar.enabled = false
	md_lista_incidencia.m_archivo.m_eliminar.enabled = false
end if 
/*DEO12-00000007 JHE 12/12/2012          
Se agrega nueva validadcion para controlar las observaciones 
de las incidencias*/
ii_valormant = gu_perfiles.of_acceso_perfil(gi_perfil,"INC_OBSERVA","ACC_MANTEN")
ii_valorcons = gu_perfiles.of_acceso_perfil(gi_perfil,"INC_OBSERVA","ACC_CONSULTA")

if ii_valormant=0 and ii_valorcons = 0 then 
	md_lista_incidencia.m_consultar.m_observaciones.enabled = false
elseif ii_valormant=1 and ii_valorcons = 0 then	
	md_lista_incidencia.m_consultar.m_observaciones.enabled = true
elseif ii_valormant=0 and ii_valorcons = 1 then	
	md_lista_incidencia.m_consultar.m_observaciones.enabled = true
end if 

/*DEO12-00000007 JHE 12/12/2012 FIN*/
///////////////////////////////////////////////////////
// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 27/08/2002
///////////////////////////////////////////////////////
If fg_verifica_parametro('nuevos_tip_inc') then
   md_lista_incidencia.m_consultar.m_obligadas.visible = true
	md_lista_incidencia.m_consultar.m_obligadas.toolbarItemvisible = true
else
	md_lista_incidencia.m_consultar.m_obligadas.visible = false
	md_lista_incidencia.m_consultar.m_obligadas.toolbarItemvisible = false
end if
////////////////////////////////////////////////////////
//AHM (03/11/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
//AHU Filtrar por el estado de la ot de ocen
IF NOT fg_verifica_parametro('OCEN') AND NOT(gb_interfaseOsgm) THEN
//if gb_mantenimiento = false then
	d_filtro_aviso.modify("ai_estado_mant.protect=1")
	d_filtro_aviso.modify("ai_estado_mant.background.color="+gs_gris)
end if

//BDI
if gb_bdi then
	if gb_hay_sesion then
		md_lista_incidencia.m_consultar.m_grfico.visible = true
		md_lista_incidencia.m_consultar.m_grfico.toolbaritemvisible = true
		md_lista_incidencia.m_consultar.m_grfico.m_localizaci$$HEX1$$f300$$ENDHEX$$n.toolbaritemvisible = true
		md_lista_incidencia.m_consultar.m_grfico.m_selecciondecapas.toolbaritemvisible = true
		md_lista_incidencia.m_consultar.m_grfico.m_quitarblink.toolbaritemvisible = true
	else
		long ll_respuesta
		ll_respuesta =	gnv_msg.f_mensaje("AI95","","",YesNo!)
		//ll_respuesta =	messagebox("Ventana gr$$HEX1$$e100$$ENDHEX$$fica no disponible","$$HEX2$$bf002000$$ENDHEX$$Desea continuar ?",Question!,YesNo!)
		if ll_respuesta = 2 then
			close(this)
			return 
		end if
	end if
end if
end event

event activate;Datetime ldt_fecha_desde,ldt_fecha_hasta
Date ldt_fecha_desdes,ldt_fecha_hastas

ib_activate = True

lu_comunic1.is_comunic = gu_comunic.is_comunic
gu_comunic.is_comunic.programa_retorno = " "
IF (lu_comunic.is_comunic.programa_retorno = "iw_2301") & 
	 OR (lu_comunic1.is_comunic.programa_retorno= "iw_2301") &
	 OR (lu_comunic1.is_comunic.programa_retorno = "w_agrup_incid") THEN
	 
	d_deteccion.AcceptText()
	ldt_fecha_desde	=fgnu_valido_fecha_nula(d_deteccion.GetItemDateTime(1,"desde"))
	
	ldt_fecha_hasta	=fgnu_valido_fecha_nula(d_deteccion.GetItemDateTime(1,"hasta"))
	ldt_fecha_desdes	=	DATE(ldt_fecha_desde)
	ldt_fecha_hastas	=	DATE(ldt_fecha_hasta)

	IF ISNULL(ldt_fecha_hasta) THEN
         d_deteccion.SetItem(1,"hasta",DATETIME(Today(),Now()))
			d_deteccion.AcceptText()
	END IF
	d_lista_aviso.dbcancel()
	d_lista_aviso.reset()
	this.triggerevent("ue_armar_sql")
		
	IF Not IsValid(This) Then Return
	
	d_ambito.setcolumn("nro_centro")
	
END IF

//BDI

if isvalid(this) then
	if gb_bdi and gb_hay_sesion then
		gl_instalacion_afectada=0
		fg_mostrar(false)
	end if
end if

ib_activate = False
end event

on timer;//
end on

event close;call super::close;// $$HEX1$$bf00$$ENDHEX$$Inicializar objeto para acto seguido destrurilo? MATO
//double_clicklu_comunic.is_comunic.programa_retorno = "iw_1234"

//gu_comunic.is_comunic = lu_comunic.is_comunic //MATO

//*****************DESTRUCCION DE LOS OBJETOS UTILIZADOS**********************
DESTROY lu_comunic
DESTROY lu_comunic1
DESTROY iu_resetea

end event

on w_1234_consulta_incidencias.create
int iCurrent
call super::create
if this.MenuName = "md_lista_incidencia" then this.MenuID = create md_lista_incidencia
this.d_deteccion=create d_deteccion
this.d_ambito=create d_ambito
this.dw_1=create dw_1
this.d_lista_aviso=create d_lista_aviso
this.cb_total=create cb_total
this.gb_1=create gb_1
this.ln_1=create ln_1
this.d_filtro_aviso=create d_filtro_aviso
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_deteccion
this.Control[iCurrent+2]=this.d_ambito
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.d_lista_aviso
this.Control[iCurrent+5]=this.cb_total
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.ln_1
this.Control[iCurrent+8]=this.d_filtro_aviso
end on

on w_1234_consulta_incidencias.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.d_deteccion)
destroy(this.d_ambito)
destroy(this.dw_1)
destroy(this.d_lista_aviso)
destroy(this.cb_total)
destroy(this.gb_1)
destroy(this.ln_1)
destroy(this.d_filtro_aviso)
end on

event closequery;If ib_activate Then Return 1

IF IsValid(gu_control_v_incidencias) THEN
	IF gu_control_v_incidencias.of_numero_ventanas_mante() > 0 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede cerrar esta ventana miestras se est$$HEX1$$e900$$ENDHEX$$n gestionando incidencias.")
		Return 1
	END IF
END IF

////Esto es para evitar que se cuele el ue_retrieve habiendo hecho un close
ib_close =true

IF lu_comunic.is_comunic.longval1 = 0 THEN
	lu_comunic.is_comunic.accion_retorno = "No Seleccionada"
END IF

if gb_bdi = true and gb_hay_sesion = true then
	fg_mostrar(false)
end if
end event

on tomar_foco;//
end on

on deactivate;//
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN d_lista_aviso.ShareData(dw_datos)

IF d_lista_aviso.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_aviso


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

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1234_consulta_incidencias
integer y = 384
end type

type d_deteccion from u_inc_2013_pr_desde_hasta within w_1234_consulta_incidencias
event ue_cambio_desde pbm_custom45
event ue_cambio_hasta pbm_custom46
integer x = 78
integer y = 468
integer width = 983
integer height = 344
integer taborder = 20
boolean border = false
end type

on ue_cambio_desde;call u_inc_2013_pr_desde_hasta::ue_cambio_desde;DateTime ldt_fecha_desde
d_deteccion.setitem(1,"desde",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"desde")))
d_deteccion.accepttext()

		


end on

on ue_cambio_hasta;call u_inc_2013_pr_desde_hasta::ue_cambio_hasta;DateTime ldt_fecha_hasta
d_deteccion.setitem(1,"hasta",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"hasta")))
d_deteccion.accepttext()

end on

on itemchanged;String ls_columna
Datetime ldt_fecha_desde
Datetime ldt_fecha_hasta
ls_columna=This.getcolumnname()
ib_si_valido=True
CHOOSE CASE ls_columna
	CASE "desde"
		idt_fecha_desde=this.getitemdatetime(1,"Desde")
	CASE "hasta"
		idt_fecha_hasta=this.getitemdatetime(1,"Hasta")	
END CHOOSE


end on

on dberror;//Para eliminar el scrip del padre
end on

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1234_consulta_incidencias
integer x = 69
integer y = 24
integer width = 1006
integer height = 364
integer taborder = 10
boolean border = false
end type

type dw_1 from datawindow within w_1234_consulta_incidencias
boolean visible = false
integer x = 128
integer y = 1096
integer width = 494
integer height = 360
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type d_lista_aviso from u_inc_2021_pr_lista_incidencia within w_1234_consulta_incidencias
event ue_key_down pbm_dwnkey
event ue_fin_clicked pbm_dwnlbuttonup
event ue_mov_cab pbm_dwnmousemove
event ue_post_clicked ( long al_row )
event ue_post_key_down ( )
event ue_post_rowfocuschanged ( long al_currentrow )
integer x = 78
integer y = 880
integer width = 3456
integer height = 920
integer taborder = 60
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = styleraised!
end type

event ue_key_down;//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

IF Key = KeyLeftArrow! THEN
	IF this.getselectedrow(0) > 1 AND this.getselectedrow(0) < This.RowCount() THEN
		This.scrolltorow(this.getselectedrow(0)+1)
	END IF
	return
ELSEIF Key = KeyRightArrow! THEN
	IF this.getselectedrow(0)> 1 THEN
		This.scrolltorow(this.getselectedrow(0) - 1)
	END IF
	return
END IF

This.Post Event ue_post_key_down()


//**  OSGI 2001.1  	18/05/2001  /////////////////////////////////////////////////////
//**  OSGI 2001.1  	18/05/2001  //	Permite borrar o agregar incidencias desde el teclado
//**  OSGI 2001.1  	18/05/2001  //	dependiendo de si el usuario presiono delete o insert
//**  OSGI 2001.1  	18/05/2001  //
//**  OSGI 2001.1  	18/05/2001  //
//**  OSGI 2001.1  	18/05/2001  //////////////////////////////////////////////////////
//**  OSGI 2001.1  	18/05/2001  long ll_row
//**  OSGI 2001.1  	18/05/2001  
//**  OSGI 2001.1  	18/05/2001  IF keyflags = 0 THEN  // Controlo que no haya presionado
//**  OSGI 2001.1  	18/05/2001  							// control ni shift
//**  OSGI 2001.1  	18/05/2001  	ll_row = This.Getselectedrow(0)
//**  OSGI 2001.1  	18/05/2001  	
//**  OSGI 2001.1  	18/05/2001  	IF key = KeyDelete! THEN
//**  OSGI 2001.1  	18/05/2001  		IF md_lista_incidencia.m_archivo.m_eliminar.enabled = TRUE THEN
//**  OSGI 2001.1  	18/05/2001  			Parent.TriggerEvent("ue_eliminar")
//**  OSGI 2001.1  	18/05/2001  		END IF
//**  OSGI 2001.1  	18/05/2001  	ELSEIF key = KeyInsert! THEN
//**  OSGI 2001.1  	18/05/2001  		Parent.TriggerEvent("ue_arch_agregar")
//**  OSGI 2001.1  	18/05/2001  	ELSEIF key = KeyUpArrow! and ll_row > 1 THEN
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(0,False)
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(ll_row - 1,true)
//**  OSGI 2001.1  	18/05/2001  	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
//**  OSGI 2001.1  	18/05/2001  		Parent.TriggerEvent("ue_obtener_datos")
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(0,False)
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(ll_row + 1,true)
//**  OSGI 2001.1  	18/05/2001  	END IF
//**  OSGI 2001.1  	18/05/2001  
//**  OSGI 2001.1  	18/05/2001  END IF
//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_fin_clicked;call super::ue_fin_clicked;//string ls_sint
//ls_sint=is_nomcab_borde + ".Border='6'"
//this.Modify(ls_sint)
end event

event ue_post_clicked(long al_row);//**************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_return_selected


if ii_reenganche = 0 then
	
	If al_row > 0 then
		ll_return_selected = fw_clicked(This, al_row)
	
		fila_ant = al_row
		
		gl_instalacion_afectada = this.getitemnumber(al_row,"nro_inst_afectada")
				
		If ll_return_selected < 1 Or ib_selected Then
			Return
		Else
			If al_row <> ll_return_selected Then
				al_row = ll_return_selected
				This.ScrollToRow(ll_return_selected)
			End If
		End If
				
	IF gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and FW_SE_PUEDE_anular(d_lista_aviso.GetItemNumber(al_row, 'tip_incidencia'),d_lista_aviso.GetItemNumber(al_row, 'sgd_incidencia_alcance'),d_lista_aviso.GetItemNumber(al_row, 'est_actual'))	then 
		md_lista_incidencia.m_editar.m_anularincidencias.enabled = true
	else
		md_lista_incidencia.m_editar.m_anularincidencias.enabled = false
	end if
	
	if gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ANULAR","ACC_MANTEN")=1 and d_lista_aviso.GetItemNumber(al_row, 'est_actual')= fgci_estado_anulado and d_lista_aviso.GetItemNumber(al_row, 'ind_anulacion_sgi')= 1 then 
		md_lista_incidencia.m_consultar.m_datosanulacin.enabled = true
		md_lista_incidencia.m_editar.m_deshaceranulacin.enabled = true
		md_lista_incidencia.m_consultar.m_operacion.enabled = false
		md_lista_incidencia.m_consultar.m_maniobrarenoperacin.enabled = false
	else
		md_lista_incidencia.m_consultar.m_datosanulacin.enabled = false
		md_lista_incidencia.m_editar.m_deshaceranulacin.enabled = false
	end if
	
		IF d_lista_aviso.GetItemNumber(al_row, 'tip_incidencia') <> fgci_incidencia_calidad &
			AND d_lista_aviso.GetItemNumber(al_row, 'sgd_incidencia_alcance') <> fgci_incidencia_de_suministro &
			AND d_lista_aviso.GetItemNumber(al_row, 'est_actual') <> fgci_estado_anulado & 
			AND d_lista_aviso.GetItemNumber(al_row, 'est_actual') <> fgci_incidencia_pte_explotacion THEN
			
			md_lista_incidencia.m_editar.m_agruparincidencia.enabled = TRUE
		ELSE
			md_lista_incidencia.m_editar.m_agruparincidencia.enabled = FALSE
		END IF
	
		IF This.GetItemNumber(al_row, 'sgd_incidencia_nro_agrupacion') > 0 THEN
			md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = TRUE
		ELSE
			md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = FALSE
		END IF
	end if
	//***************************************
	//**  OSGI 2001.1  	18/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

else	
	if al_row > 0 then
		this.selectrow(0,False)
		this.selectrow(al_row,true)
		IF gu_perfiles.of_Acceso_perfil(gi_perfil,"INC_ELIMINAR","ACC_MANTEN")=1 THEN
			md_lista_incidencia.m_archivo.m_eliminar.enabled=true
		ELSE
			md_lista_incidencia.m_archivo.m_eliminar.enabled=false
		END IF
	else
		md_lista_incidencia.m_archivo.m_eliminar.enabled=false
	end if
end if
end event

event ue_post_key_down;//***************************************
//**  OSGI 2001.1  	18/05/2001			**
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
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



//**  OSGI 2001.1  	18/05/2001  IF keyflags = 0 THEN  // Controlo que no haya presionado
//**  OSGI 2001.1  	18/05/2001  							// control ni shift
//**  OSGI 2001.1  	18/05/2001  	ll_row = This.Getselectedrow(0)
	
	IF KeyDown(KeyDelete!) THEN
		IF md_lista_incidencia.m_archivo.m_eliminar.enabled = TRUE THEN
			Parent.TriggerEvent("ue_eliminar")
		END IF
	ELSEIF KeyDown(KeyInsert!) THEN
		Parent.TriggerEvent("ue_arch_agregar")
	ELSEIF KeyDown(KeyUpArrow!) and ll_row > 1 THEN
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(0,False)
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(ll_row - 1,true)
	ELSEIF KeyDown(KeyDownArrow!) and ll_row < this.rowcount() THEN
		Parent.TriggerEvent("ue_obtener_datos")
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(0,False)
//**  OSGI 2001.1  	18/05/2001  		this.selectrow(ll_row + 1,true)
	END IF
//**  OSGI 2001.1  	18/05/2001  END IF
end event

event ue_post_rowfocuschanged;//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Parent.TriggerEvent("ue_obtener_datos")
//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event doubleclicked;long ll_nro_incidencia, ll_inci,ll_var, ll_nro_inst_afectada, ll_nro_brig_bloq,ll_cant_incidencia
int li_lock_status,li_conta,li_criterio, li_codigo_nivel, li_tension, li_respuesta = 1
int li_estado 

if row > 0 then
	if ii_reenganche = 0 then //  No es un reenganche
	
	gu_comunic.is_comunic.accion_llamada = lu_comunic.is_comunic.accion_llamada
	li_estado = this.getitemnumber(row,"est_actual")
	if li_estado = fgci_estado_anulado or li_estado = fgci_incidencia_pte_explotacion then 
		gu_comunic.is_comunic.accion_llamada="Consulta"		
	end if
	
	ll_inci = this.getitemnumber(row,"nro_incidencia")
	// se intenta bloquear la incidencia
	IF lu_comunic.is_comunic.accion_llamada="Consulta" OR &
		lu_comunic.is_comunic.accion_llamada="Seleccion" or li_estado = fgci_estado_anulado THEN
		li_lock_status = 0
	ELSE 
		// como queremos actualizar intentamos bloquear la incidencia
		
		SELECT COUNT(*) 
		INTO	:ll_cant_incidencia
		FROM SGD_INCIDENCIA
		WHERE NRO_INCIDENCIA = : ll_inci ;
		
		IF ll_cant_incidencia = 0 THEN
			 messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "La incidencia ha sido actualizada por otro usuario")
			 return 0
		END IF
		
		li_lock_status=gnu_u_transaction.uf_lock(PARENT, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_inci), fgci_bloqueo_incidencia, ll_inci)
			
		IF li_lock_status = 0 THEN
			// Se comprueba si existen brigadas asociadas a la incidencia bloqueadas
			SELECT COUNT(GI_BRIGADA.NRO_BRIGADA)
			INTO :ll_nro_brig_bloq
			FROM SGD_INCIDENCIA, GI_BRIGADA_OT, GI_BRIGADA
			WHERE SGD_INCIDENCIA.NRO_INCIDENCIA = :ll_inci AND
					SGD_INCIDENCIA.OT = GI_BRIGADA_OT.NRO_OT AND
					GI_BRIGADA_OT.NRO_BRIGADA = GI_BRIGADA.NRO_BRIGADA AND
					GI_BRIGADA_OT.EST_BRIGADA < :fgci_ot_resuelta AND
					GI_BRIGADA.IND_BLOQUEO = 1;
	
			IF SQLCA.SQLCode = 0 AND ll_nro_brig_bloq > 0 THEN
				// Existen brigadas bloqueadas, hay que indic$$HEX1$$e100$$ENDHEX$$rselo al usuario y abrir la 
				// incidencia en modo consulta
				li_lock_status=gnu_u_transaction.uf_rollback(PARENT, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_inci), fgci_bloqueo_incidencia, ll_inci)
				IF messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Algunas de las brigadas asociadas a la Incidencia se encuentran siendo utilizadas por otro usuario. $$HEX1$$bf00$$ENDHEX$$Desea abrir la incidencia en modo Consulta",Information!,YesNo!) = 1 then
					li_lock_status = -1
				ELSE
					li_lock_status = -2
				END IF
			END IF
		END IF
	END IF
	IF li_lock_status = -1 or  li_lock_status = -54 THEN
		//No hemos podido bloquear la incidencia, se abre la ventana en modo consulta
		//li_respuesta = Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea abrir la Incidencia en modo consulta?", Question!, YesNo!)
		//IF li_respuesta = 1 THEN
			gu_comunic.is_comunic.accion_llamada="Consulta"
		//END IF
	ELSEIF 	li_lock_status = -2 THEN
		Return
	END IF
	
	//AHM (09/12/2009) Problemas con el bloqueo de las disponibilidades
	IF	fg_verifica_parametro("Indisponibilidades activas") = TRUE THEN
		//JME 08/06/09
		if gu_comunic.is_comunic.accion_llamada <> "Consulta" then 
//			li_lock_status = gf_bloquear_activos(ll_inci, true)				
			li_lock_status = gnu_u_transaction.uf_lock_disponibilidad(ll_inci)
			if li_lock_status < 0 then 
				li_lock_status=gnu_u_transaction.uf_rollback(PARENT, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_inci), fgci_bloqueo_incidencia, ll_inci)				
				gu_comunic.is_comunic.accion_llamada="Consulta"				
				li_lock_status = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea abrir la incidencia en modo consulta?", Exclamation!, YesNo!)			
				if li_lock_status = 2 then 
					return
				end if		
			end if
		end if
		//Fin JME	
	END IF
	
	IF li_respuesta = 1 THEN
		CHOOSE CASE gu_comunic.is_comunic.accion_llamada
			CASE "Seleccion"
					//cuando entra con opcion seleccion simpre esta habilitada
			
					lu_comunic.is_comunic.longval1 = this.getitemnumber(row,"nro_incidencia")
					IF lu_comunic.is_comunic.longval1 <> 0 THEN
						SetPointer(HourGlass!)
						lu_comunic.is_comunic.accion_retorno = "Seleccionada"
						lu_comunic.is_comunic.strval1 = this.getitemstring(row,"incidencia_desc_incidencia")
						close(Parent)	
			
					END IF
			CASE "Consulta"
					//cuando entra con opcion seleccion simpre esta habilitada			
					SetPointer(HourGlass!)	
					gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
					gu_comunic.is_comunic.accion_llamada="Consulta"
					
					gu_comunic.is_comunic.longval3 =  this.getitemnumber(row,"nro_incidencia")
					gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_genapp_frame,0)
         			//OpenSheet(w_2301_form_incidencia,w_genapp_frame,0,Layered!)
	
			CASE 	"Actualizacion"
				IF frn_hab_dobleclick_actualizacion() THEN
					SetPointer(HourGlass!)

					string ls_incid, ls_aux
					int indice, li_par
					
					
					boolean lb_sigo=true
				
					li_tension = this.getItemNumber(row,'tip_tension')
					ls_incid  = gu_perfiles.of_nivel_tension('INC_GENERAL')
	
					for indice = 1 to len(ls_incid)
						li_par =  mod (indice,2)
						IF li_par <> 0 then
							ls_aux = mid(ls_incid,indice,1)
							if ls_aux <> ',' and lb_sigo = true then
								if integer(ls_aux) = li_tension or ls_aux = '0' then
									lb_sigo = false
								end if
							end if
						end if
					next
					// No tiene permiso para ese nivel
					If lb_sigo = true then
						gnv_msg.f_mensaje("AA08","","",OK!)
						gnu_u_transaction.uf_rollback(PARENT, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_inci), fgci_bloqueo_incidencia, ll_inci)
						return 
					end if

//					////////////////////////////////////////////////
//					// Permite actualizaci$$HEX1$$f300$$ENDHEX$$n/modificaci$$HEX1$$f300$$ENDHEX$$n segun Perfil de usuario de entrada
//					//
//					// li_criterio = 1 Todas las Incidencias de su Zona
//					// li_criterio = 2 Todas las Incidencias de su CMD
//					// li_criterio = 3 Todas las Incidencias de su Sector
//					// li_criterio = 4 Todas las Incidencias de su Sector
//					// li_criterio = 5 Todas las Incidencias de su Sector
//					// li_criterio = 6 Todo
//					// li_criterio = 0 Todo
//					//
//					/////////////////////////////////////////////FDO
//					
//					FOR LI_CONTA=1 to 3 
//					
//						if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL",ls_array[li_conta]) =1 then
//							li_criterio = li_criterio + li_conta
//						end if	
//					
//					NEXT						
//
//					Choose case li_criterio
//							
//						case 1
//							IF 	lu_comunic.is_comunic.intval1 = This.GetItemNumber(row,"nro_centro")  THEN								
//								gu_comunic.is_comunic.accion_llamada="Modificacion"
//							ELSE							
//								gu_comunic.is_comunic.accion_llamada="Consulta"
//								// DESBLOQUEAMOS EL REGISTRO
//								gnu_u_transaction.uf_rollback(PARENT)
//							END IF
//						case 2
//							IF 	lu_comunic.is_comunic.intval2 = This.GetItemNumber(row,"nro_cmd")  THEN								
//								gu_comunic.is_comunic.accion_llamada="Modificacion"
//							ELSE							
//								gu_comunic.is_comunic.accion_llamada="Consulta"
//								// DESBLOQUEAMOS EL REGISTRO
//								gnu_u_transaction.uf_rollback(PARENT)
//							END IF
//						case 3,4,5
//							IF 	lu_comunic.is_comunic.intval3 = This.GetItemNumber(row,"nro_mesa")  THEN								
//								gu_comunic.is_comunic.accion_llamada="Modificacion"
//							ELSE							
//								gu_comunic.is_comunic.accion_llamada="Consulta"
//								// DESBLOQUEAMOS EL REGISTRO
//								gnu_u_transaction.uf_rollback(PARENT)
//							END IF
//						case 6,0
//							gu_comunic.is_comunic.accion_llamada="Modificacion"
//					
//					end choose

					gu_comunic.is_comunic.accion_llamada="Modificacion"
					gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
					ll_nro_incidencia=this.getitemnumber(row,"nro_incidencia")
					gu_comunic.is_comunic.longval3 =  this.getitemnumber(row,"nro_incidencia")			
					//SELECT NRO_INCIDENCIA into:ll_nro_incidencia FROM SGD_INCIDENCIA WHERE NRO_INCIDENCIA=:ll_nro_incidencia; //FOR UPDATE NOWAIT;
					IF SQLCA.SQLCODE <> 0 THEN
						gnv_msg.f_mensaje("AI96","","",OK!)
						//MESSAGEBOX("Atenci$$HEX1$$f300$$ENDHEX$$n","La incidencia est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otra estaci$$HEX1$$f300$$ENDHEX$$n")
					ELSE
//						OpenSheet(w_2301_form_incidencia,w_operaciones,0,Layered!)
						if gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_genapp_frame,0)<1 then
						// SE HA ABIERTO ANTES LA VENTANA EN MODO CONSULTA
						// DESBLOQUEAMOS
						gnu_u_transaction.uf_rollback(PARENT, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(ll_inci), fgci_bloqueo_incidencia, ll_inci)
						end if
					END IF
				ELSE
					gnv_msg.f_mensaje("AI65","","",OK!)
				END IF
			END CHOOSE
		END IF
	ELSE
		gu_comunic.is_comunic.longval1= this.getitemnumber(row,"nro_incidencia")
		open(w_2303_consulta_de_reenganches)
	END IF
END IF


end event

event clicked;call super::clicked;//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


if row > 0 then
	il_row = row
	ib_oop = fw_incidencia_operaciones(d_lista_aviso.object.tip_tension[row])
end if

This.Post Event ue_post_clicked(row)

//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


////**********  SCRIPT ORIGINAL


////	this.selectrow(0,False)
////	fila_ant = row
////	this.selectrow(row,true)
////	gl_instalacion_afectada = this.getitemnumber(row,"nro_inst_afectada")
////	
////	IF This.GetItemNumber(row, 'sgd_incidencia_alcance') = fgci_incidencia_sin_interrupcion &
////		OR This.GetItemNumber(row, 'sgd_incidencia_alcance') = fgci_incidencia_reenganche THEN
////		
////		IF This.GetItemNumber(row, 'est_actual') = fgci_incidencia_servicio_repuesto THEN 
////			md_lista_incidencia.m_editar.m_agruparincidencia.enabled = TRUE
////		ELSE
////			md_lista_incidencia.m_editar.m_agruparincidencia.enabled = FALSE
////		END IF
////	ELSE
////		md_lista_incidencia.m_editar.m_agruparincidencia.enabled = FALSE
////	END IF
////
////	IF This.GetItemNumber(row, 'sgd_incidencia_nro_agrupacion') > 0 THEN
////		md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = TRUE
////	ELSE
////		md_lista_incidencia.m_editar.m_desagruparincidencias.enabled = FALSE
////	END IF
////end if
////**********  SCRIPT ORIGINAL
end event

event scrollvertical;call super::scrollvertical;long ll_contador

ib_activate = True
IF not ib_total THEN
	d_filtro_aviso.setitem(1,"ai_reg_seleccionados", d_lista_aviso.rowcount())
END IF
ib_activate = False

If ib_parametro_salmt Then
	FOR ll_contador=il_fila_retrieve TO This.RowCount()
		IF ii_reenganche = 0 then
			This.SetItem(ll_contador, "c_nom_salmt", fg_salmt_inst_afectada(This.GetItemNumber(ll_contador, "nro_inst_afectada")))
		END IF
	NEXT
	This.AcceptText()
	il_fila_retrieve = This.RowCount() + 1
End If
end event

event rowfocuschanged;IF NOT KEYDOWN(KEYENTER!) THEN 
	//***************************************
	//**  OSGI 2001.1  	18/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	18/05/2001  if currentrow> 0  then Parent.TriggerEvent("ue_obtener_datos")
	
	If currentrow > 0 Then This.Post Event ue_post_rowfocuschanged(currentrow)
	//***************************************
	//**  OSGI 2001.1  	18/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF
end event

event retrieverow;call super::retrieverow;////***************************************
////**  OSGI 2001.1  	05/04/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
//If ib_parametro_salmt Then
//	This.SetItem(row, "c_nom_salmt", fg_salmt_inst_afectada(This.GetItemNumber(row, "nro_inst_afectada")))
//	This.AcceptText()
//End If
////***************************************
////**  OSGI 2001.1  	05/04/2001			**
////**  Jair Padilla / Soluziona PANAMA  **
////***************************************
end event

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	05/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_parametro_salmt = fg_verifica_parametro(This.ClassName())
//***************************************
//**  OSGI 2001.1  	05/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event retrievestart;call super::retrievestart;//ib_activate = TRUE
ib_recupero = false
end event

event retrieveend;call super::retrieveend;ib_recupero = true
if ib_falta_retrieve= true then
	ib_falta_retrieve = false
	parent.triggerevent("ue_retrieve")
end if

end event

type cb_total from commandbutton within w_1234_consulta_incidencias
boolean visible = false
integer x = 2834
integer y = 764
integer width = 59
integer height = 68
integer taborder = 40
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
d_lista_aviso.Object.DataWindow.Retrieve.AsNeeded='No'
ll_row = d_lista_aviso.RowCount()
ib_total = true
d_filtro_aviso.SetItem(1,'ai_reg_seleccionados',ll_row)

If ib_parametro_salmt Then
	FOR ll_contador = 1 TO ll_row
		IF ii_reenganche = 0 then
			d_lista_aviso.SetItem(ll_contador, "c_nom_salmt", fg_salmt_inst_afectada(d_lista_aviso.GetItemNumber(ll_contador, "nro_inst_afectada")))
		END IF
	NEXT
	d_lista_aviso.AcceptText()

End If
end event

type gb_1 from groupbox within w_1234_consulta_incidencias
boolean visible = false
integer x = 2825
integer y = 732
integer width = 78
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type ln_1 from line within w_1234_consulta_incidencias
long linecolor = 33554432
integer linethickness = 4
integer beginx = 2459
integer beginy = 468
integer endx = 2789
integer endy = 756
end type

type d_filtro_aviso from u_inc_2030_pr_filtro_incidencia within w_1234_consulta_incidencias
integer x = 1838
integer y = 28
integer width = 1696
integer taborder = 30
boolean bringtotop = true
boolean border = false
end type

event itemerror;////DBE comment ini 8/02/2000
//String ls_columna
//String ls_modtitulo
//String ls_ismodif
//ls_modtitulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
//this.Modify(ls_modtitulo)
//ls_columna=this.getcolumnname()
//CHOOSE CASE ls_columna
//	CASE "ai_duracion"
//		ls_ismodif=ls_columna+".ValidationMsg='Debe introducir una cantidad v$$HEX1$$e100$$ENDHEX$$lida'"
//		this.Modify(ls_ismodif)
//END CHOOSE
//ib_si_valido=false
//this.setfocus()
////DBE comment fin 8/02/2000

end event

event itemchanged;call super::itemchanged;
int li_alcance, li_tip_incidencia

parent.setredraw(false)

THIS.ACCEPTTEXT()

li_alcance = this.object.ai_suministro[1]

CHOOSE CASE dwo.name

	CASE "nro_incid_desde"
		IF not Integer(this.gettext()) = 0 then
			d_deteccion.modify("desde.background.color ="+gs_gris)
         d_deteccion.modify("hasta.background.color ="+gs_gris)
			d_deteccion.enabled = false
			ib_rango = true 
			d_ambito.fnu_insertar_datos(gi_nro_centro,gi_nro_cmd,gi_nro_puesto,0)
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
		// Seteo la variable ib_recupero si la datawindow no ha terminado de recuper datos
		
		d_lista_aviso.reset()
		ib_recupero = true 

		if data = string(fgci_incidencia_reenganche) and dwo.name = 'ai_suministro' then
			d_lista_aviso.dataobject= "d_lista_reenganches"
			ii_reenganche = 0
			ib_reenganche = true
			//////////////////////////////////////////////////////////////////////////
			// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 28/08/2002
			///////////////////////////////////////////////////////////////////////////
			If fg_verifica_parametro('nuevos_tip_inc') then			
				md_lista_incidencia.m_consultar.m_obligadas.enabled = false
				md_lista_incidencia.m_consultar.m_obligadas.checked = false
			End if
			///////////////////////////////////////////////////////////////////////////
			
			is_select_original1 = d_lista_aviso.Describe("datawindow.table.select")
			f_poner_menu_invisible(false)
		else
			IF ib_reenganche THEN
				parent.SetRedraw(false)
				d_lista_aviso.dataobject= "d_inc_2002_pr_lista_seleccion_incidencia"
				
				//***************************************
				//**  OSGI 2001.1  	05/04/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				
				fg_ventana_parametro(parent.ClassName(), d_lista_aviso)
				fg_alto_texto(d_lista_aviso, d_lista_aviso.ClassName(), 0)
				
				//***************************************
				//**  OSGI 2001.1  	05/04/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************	
				
				f_poner_menu_invisible(true)
				parent.SetRedraw(true)
			END IF			
			ib_reenganche = false
			ii_reenganche = 1
			
		end if
		
		///////////////////////////////////////////////////////////////////////////
		// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 28/08/2002
		///////////////////////////////////////////////////////////////////////////
		If dwo.name = 'ai_tipo' then
			If fg_verifica_parametro('nuevos_tip_inc') then			
				li_tip_incidencia = long(data)
				If li_tip_incidencia = fgci_incidencia_calidad or & 
					li_tip_incidencia = fgci_incidencia_alum_pub then				
					md_lista_incidencia.m_consultar.m_obligadas.enabled = false
					md_lista_incidencia.m_consultar.m_obligadas.checked = false
					//md_lista_incidencia.m_consultar.m_obligadas.toolbarItemvisible = true
				Else
					If li_tip_incidencia = fgci_incidencia_imprevista and ib_reenganche then
				      md_lista_incidencia.m_consultar.m_obligadas.enabled = false
						md_lista_incidencia.m_consultar.m_obligadas.checked = false
				   else
					  md_lista_incidencia.m_consultar.m_obligadas.enabled = true
				   end if
				End if											
			End if
		End if
		///////////////////////////////////////////////////////////////////////////


//		is_select_original = d_lista_aviso.Describe("datawindow.table.select")
		d_lista_aviso.settransobject(sqlca)

END CHOOSE

parent.setredraw(true)
end event

event clicked;//this.AcceptText()
end event

event editchanged;// En este evento se controla que el usuario no introduzca como primer caracter de
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

event constructor;call super::constructor;// DBE ini 8/02/2000 
String ls_modtitulo
String ls_ismodif
ls_modtitulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
this.Modify(ls_modtitulo)
		ls_ismodif="ai_duracion"+".ValidationMsg='Debe introducir una cantidad v$$HEX1$$e100$$ENDHEX$$lida'"
		this.Modify(ls_ismodif)
// DBE ini 8/02/2000
end event

event losefocus;call super::losefocus;this.accepttext()
end event

event doubleclicked;call super::doubleclicked;int li_nulo
setnull(li_nulo)

if dwo.Name = 'desde' then
	d_filtro_aviso.object.nro_incid_desde[row] = li_nulo
	d_filtro_aviso.object.nro_incid_hasta[row]= li_nulo
	d_filtro_aviso.SetColumn ('nro_incid_desde')
	d_deteccion.modify("desde.background.color ="+gs_blanco)
	d_deteccion.modify("hasta.background.color ="+gs_blanco)
	d_deteccion.enabled = true
end if
end event


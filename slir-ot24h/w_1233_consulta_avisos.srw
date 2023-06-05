HA$PBExportHeader$w_1233_consulta_avisos.srw
forward
global type w_1233_consulta_avisos from w_sgigenerica
end type
type gb_1 from groupbox within w_1233_consulta_avisos
end type
type d_filtro_aviso from u_avi_2030_pr_filtro_aviso within w_1233_consulta_avisos
end type
type d_deteccion from u_inc_2013_pr_desde_hasta within w_1233_consulta_avisos
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1233_consulta_avisos
end type
type cb_total from commandbutton within w_1233_consulta_avisos
end type
type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within w_1233_consulta_avisos
end type
type dw_1 from datawindow within w_1233_consulta_avisos
end type
type dw_usuarios from u_avi_2034_pr_usuario_telegestiones within w_1233_consulta_avisos
end type
end forward

global type w_1233_consulta_avisos from w_sgigenerica
integer x = 5
integer y = 112
integer width = 3698
integer height = 1976
string title = "OPEN SGI - Consulta de Avisos"
string menuname = "md_lista_avisos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
string icon = "consavi.ico"
event ue_armar_sql pbm_custom74
event ue_retrieve pbm_custom75
event ue_ir_comienzo pbm_custom47
event ue_ir_final pbm_custom48
event ue_criterio_orden pbm_custom49
event ue_agregar pbm_custom50
event ue_brigadistas pbm_custom51
event ue_reclamaciones pbm_custom52
event ue_sit_clima pbm_custom53
event ue_suministros_imp pbm_custom54
event ue_o_datos pbm_custom33
event ue_imp_reporte_avi ( )
gb_1 gb_1
d_filtro_aviso d_filtro_aviso
d_deteccion d_deteccion
d_ambito d_ambito
cb_total cb_total
d_lista_aviso d_lista_aviso
dw_1 dw_1
dw_usuarios dw_usuarios
end type
global w_1233_consulta_avisos w_1233_consulta_avisos

type variables
u_generico_comunicaciones lu_comunic // Variable local de trabajo de comunicacion
u_generico_comunicaciones lu_comunic1 // variable local de trabajo con formulario de informacion
u_avi_2030_nu_filtro_aviso iu_avi_2030_nu
u_cen_2001_nu_form_centro_cmd_mesa iu_cen_2001_nu 
u_inc_2013_nu_desde_hasta iu_inc_2013_nu

w_1233_consulta_avisos iw_1233
string Is_Select_original = " "
string Is_Clausula_Where = " "
string Is_modificacion = " "
string Is_filtro_ambito
string Is_filtro_deteccion
string Is_filtro_alcance
string Is_filtro_estado
string Is_filtro_tipo
string Is_filtro_alimentacion
string Is_filtro_nro_desde_hasta
string Is_filtro_duracion
string retorno
long resultado
int fila_ant
u_generico_comunicaciones lu_impresion // global de comunicacion con ventana de impresion
boolean ib_si_valido
string is_modif
datetime idt_fecha_desde
datetime idt_fecha_hasta
datawindowchild ldwch_co_alc, ldwch_tip_avi, ldwch_prioridad,ldwch_est_aviso
// constantes
//int fgci_ordenar_por_duracion
//int fgci_ordenar_por_prioridad
//int fgci_ordenar_por_direccion
//int fgci_ordenar_por_cli_imp
//int fgci_ordenar_por_peligro
//int fgci_ordenar_nro_instalacion
//int fgci_ordenar_fecha_res
//int fgci_ordenar_nro_aviso
//int fgci_ordenar_est_aviso
//int fgci_todos
//int fgci_aviso_resuelto
//string fgcs_blanco 
time t1,t2,t3,t4,t5,t6

long il_selected_rows, il_row_click  //**  OSGI 2001.1  	20/03/2001
boolean ib_selected  //**  OSGI 2001.1  	20/03/2001
boolean ib_rango
boolean ib_total = false
String is_modify_ext = "" //JPA 20021028

boolean ib_historico = false // GNU 1-12-2005. Mejora 1/311271
end variables

forward prototypes
public function boolean fnu_w_valido_datos_recibidos (ref u_generico_comunicaciones ps_comunic)
public subroutine fpr_w_presentacion ()
public subroutine frn_w_inicializo_val_def ()
public function boolean fnu_valido_datos ()
public function long fw_clicked (datawindow adw_dataw, readonly long row)
end prototypes

event ue_armar_sql;int li_tiempo,li_duracion,li_pos1,li_pos2 //ACO
string ls_operacion,ls_filtro_usuario,ls_usuario //ACO
int xx //ACO
string ls_duracion //ACO
string ls_cl_duracion
string ls_blanco
string ls_sort, ls_result
//AHM
string	ls_order				//Clausula "order by" de la select
string 	ls_clausula			//Clausula where para gi_avisos
string	ls_consulta			//Consulta final de la dw

SetPointer(HourGlass!)

ls_blanco = " "

// reseteo las variables
	is_filtro_ambito = ' '
	is_filtro_deteccion = ' '
	is_filtro_alimentacion = ' '
	is_clausula_where = ' '
	is_modificacion = ' '
	is_filtro_nro_desde_hasta = ' '
// Preparo la parte del filtro por ambito.

d_ambito.accepttext()
d_deteccion.accepttext()
d_filtro_aviso.accepttext()

//********************************************************************//
//                     VALIDO LOS DATOS PARA LA CONSULTA              //
//********************************************************************//

	if not fnu_valido_datos() then
		return
	end if

//********************************************************************//
//                     ARMO EL FILTRO PARA EL AMBITO                  //
//********************************************************************//


	is_filtro_ambito = d_ambito.fnu_filtro_ambito(d_ambito.getitemnumber(1,"nro_centro"), & 
																 d_ambito.getitemnumber(1,"nro_cmd") ,     &
																 d_ambito.getitemnumber(1,"nro_mesa")) // Parte del where para el ambito

//********************************************************************//
//							  ARMO EL FILTRO PARA EL NRO DE AVISO            //
//********************************************************************//

if isnull(d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta"))  then 
   d_filtro_aviso.setitem(1,"nro_aviso_hasta", 0)   
end if
if isnull(d_filtro_aviso.getitemnumber(1,"nro_aviso_desde")) then
	d_filtro_aviso.setitem(1,"nro_aviso_desde", 0)   
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") < 0  or d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") < 0  then 
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de avisos no pueden ser menores que 0.")
	return
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") = 0  and d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") <> 0  then
   d_filtro_aviso.setitem(1,"nro_aviso_hasta", d_filtro_aviso.getitemnumber(1,"nro_aviso_desde"))
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") = 0  and d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") <> 0  then
  if d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") > 100 then
     d_filtro_aviso.setitem(1,"nro_aviso_desde", d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta"))
 else
     d_filtro_aviso.setitem(1,"nro_aviso_desde", 1)
end if
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") - d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") > 100 then
   d_filtro_aviso.setitem(1,"nro_aviso_hasta", d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") + 100)
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") < d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") then
	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de avisos no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
	return
end if

If d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") > 0 then
		d_filtro_aviso.object.ai_estado[1] = fgci_todos
		d_filtro_aviso.object.ai_tipo[1] = fgci_todos
		d_filtro_aviso.object.ai_alcance[1] = fgci_todos
		//d_ambito.object.nro_centro[1] = fgci_todos
		//d_ambito.object.nro_cmd[1] = fgci_todos
		//d_ambito.object.nro_mesa[1] = fgci_todos
end if

is_filtro_nro_desde_hasta = d_filtro_aviso.fnu_cargar_nro_aviso()

//********************************************************************//
//                     ARMO EL FILTRO PARA EL PERIODO                 //
//********************************************************************//
	IF len(is_filtro_nro_desde_hasta) < 1 THEN
		is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) // Parte del where para deteccion
	//END IF		
		is_filtro_Alimentacion = d_filtro_aviso.fnu_filtrar_avisos() // parte del Where del resto de la Consulta
	ELSE
		is_filtro_deteccion = ls_blanco
		//is_filtro_ambito = ls_blanco
		d_filtro_aviso.setitem(1,"ai_clase_aviso",101)
		d_filtro_aviso.fnu_cargo_alimentacion(fgci_todos)
		d_filtro_aviso.fnu_cargar_estado(fgci_todos)
		d_filtro_aviso.fnu_cargar_tipo(fgci_todos)
		d_filtro_aviso.fnu_cargar_alcance(fgci_todos)
		d_filtro_aviso.fnu_cargar_duracion(0)
	END IF

	is_clausUla_where = " AND "

	if is_filtro_ambito <> ls_blanco then
		is_clausula_where = is_clausula_where + is_filtro_ambito 
	end if

//********************************************************************//
//              AGREGO EL FILTRO DEL PERIODO A LA SELECT              //
//********************************************************************//

	if is_filtro_deteccion <> ls_blanco then
		if is_filtro_ambito <> ls_blanco then
			
			is_clausula_where = is_clausula_where +  " AND " 	+ is_filtro_deteccion 
		else
			is_clausula_where = is_clausula_where + is_filtro_deteccion
		end if
	end if

	if is_filtro_alimentacion <> ls_blanco then
		if is_filtro_ambito <> ls_blanco then
			is_clausula_where = is_clausula_where +  " AND " + is_filtro_alimentacion
		else
			if is_filtro_deteccion <> ls_blanco THEN
				is_clausula_where = is_clausula_where +  " AND " + is_filtro_alimentacion
			else
				is_clausula_where = is_clausula_where+is_filtro_alimentacion
			end if
		end if
	end if


//ACO

ls_operacion= d_filtro_aviso.object.operacion[1]
li_tiempo= d_filtro_aviso.object.tiempo[1]
li_duracion=d_filtro_aviso.getitemnumber(1,"ai_duracion")
ls_duracion=string(li_duracion)


if li_tiempo=2 then
	ls_duracion= string(li_duracion*60)
elseif li_tiempo=3 then
	ls_duracion= string(li_duracion*60*24)
end if

if li_duracion > 0 then 
 ls_cl_duracion= "fg_duracion_int( GI_AVISOS.F_ALTA,GI_AVISOS.FECHA_RES)" + ls_operacion + " " + ls_duracion
 is_clausula_where=is_clausula_where+" and "+ls_cl_duracion
end if

if len(is_filtro_nro_desde_hasta) > 1 then
	IF len(is_clausula_where) > 5 THEN
		is_clausula_where = is_clausula_where + " AND " + is_filtro_nro_desde_hasta 
	ELSE
		is_clausula_where = is_clausula_where + is_filtro_nro_desde_hasta 
	END IF
end if


//*****************************************************************//
// Cambio: Externalidad de ordenamiento por indicativo de peligro  //
//  Luis E. Ortiz                                                  //
//*****************************************************************//

ls_usuario = dw_usuarios.object.nro_usuario[1]

li_pos1 = pos(ls_usuario,'<',1)
li_pos2 = pos(ls_usuario,'>',1)

If li_pos1 > 0 and li_pos2 > 0 then
ELSE
	IF len(is_clausula_where) > 5 THEN
		is_clausula_where = is_clausula_where + " AND UPPER(NRO_TELEFONISTA) = UPPER('" + dw_usuarios.object.nro_usuario[1] + "') " 
	ELSE
		is_clausula_where = is_clausula_where + " UPPER(NRO_TELEFONISTA) = UPPER('" + dw_usuarios.object.nro_usuario[1] + "') "
	END IF
END IF

If fg_verifica_parametro("orden_ind_peligro") Then
	d_lista_aviso.Modify("c_orden_t.visible = 1")
Else
	d_lista_aviso.Modify("c_orden_t.visible = 0")
End If

//*****************************************************************//
// Cambio: Externalidad de ordenamiento por indicativo de peligro  //
//  Luis E. Ortiz                                                  //
//*****************************************************************//
/*AHM (0/10000945) */

If fg_verifica_parametro("orden_ind_peligro") Then
	//is_clausula_where=is_clausula_where + " ORDER BY IND_PELIGRO DESC "
	ls_order = " ORDER BY IND_PELIGRO DESC "
Else
	//is_clausula_where=is_clausula_where + " ORDER BY NRO_AVISO "
	ls_order = " ORDER BY NRO_AVISO "
End If

//*****************************************************************//
//  Luis E. Ortiz                                                  //
//*****************************************************************//

//********************************************************************//
//                     CAMBIO EL SELECT A LA DATAWINDOW //
//********************************************************************//

// GNU 30-11-2005. Mejora 1/311271
IF ib_historico then
//AHM (0/10000945)	
	ls_clausula = is_clausula_where + " and  gi_avisos.est_aviso in (5, 6, 11)"
	is_clausula_where = fg_remplaza (Upper(is_clausula_where), "GI_AVISOS", "GI_HIST_AVISOS")
	ls_consulta = fg_remplaza (Upper(is_select_original), "GI_HIST_AVISOS", "GI_AVISOS")
	ls_consulta = " union all " + ls_consulta
	
	ls_consulta =  "select * from (" + is_select_original + is_clausula_where + ls_consulta + ls_clausula + ") " + ls_order
ELSE
	
	ls_consulta = is_select_original + is_clausula_where 
END IF
// FIN GNU

is_modificacion = "DataWindow.table.Select=~"" + ls_consulta + "~""

retorno = d_lista_aviso.modify(is_modificacion)

//d_lista_aviso.settransobject(sqlca)
this.triggerevent("ue_retrieve")

IF d_lista_aviso.RowCount() = 0 THEN
	gnv_msg.F_mensaje("AB02","","",oK!)	
	md_lista_avisos.m_editar.m_iralcomienzo.enabled= false;  // LFE 
	md_lista_avisos.m_editar.m_iralfinal.enabled= false;  // LFE 
ELSE	// LFE
	md_lista_avisos.m_editar.m_iralcomienzo.enabled= true;  // LFE 
	md_lista_avisos.m_editar.m_iralfinal.enabled= true;  // LFE 
END IF							

end event

event ue_retrieve;DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string  ls_titulo, ls_sort
int xx,yy,error


d_lista_aviso.setredraw(false)
xx = d_lista_aviso.fnu_obtener_datos()
//d_lista_aviso.fnu_ordenar_nro_aviso()
d_filtro_aviso.setitem(1,"ai_reg_seleccionados", d_lista_aviso.rowcount())

//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
error = dw_1.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Avisos'
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

error = d_lista_aviso.ShareData(dw_datos)

// GNU 22-6-2006. Incidencia Correo Panam$$HEX1$$e100$$ENDHEX$$
d_lista_aviso.SetSort('f_alta D')
d_lista_aviso.Sort()
// FIN GNU

d_lista_aviso.setredraw(true)


end event

event ue_ir_comienzo;call super::ue_ir_comienzo;	d_lista_aviso.selectrow(fila_ant,False)
	d_lista_aviso.selectrow(d_lista_aviso.getrow(),false)
	fila_ant =1
	d_lista_aviso.selectrow(1,true)
	d_lista_aviso.scrolltorow(1)


end event

event ue_ir_final;call super::ue_ir_final;
	d_lista_aviso.selectrow(fila_ant,False)
	d_lista_aviso.selectrow(d_lista_aviso.getrow(),false)
	fila_ant =d_lista_aviso.rowcount()
	d_lista_aviso.selectrow(d_lista_aviso.rowcount(),true)
	d_lista_aviso.scrolltorow(d_lista_aviso.rowcount())


end event

event ue_criterio_orden;string res
CHOOSE CASE gu_comunic.is_comunic.intval9
	CASE fgci_ordenar_por_duracion
			res = d_lista_aviso.fnu_ordenar_por_duracion()
	CASE fgci_ordenar_por_prioridad
			res =d_lista_aviso.fnu_ordenar_por_prioridad()
	CASE fgci_ordenar_por_direccion
			res =d_lista_aviso.fnu_ordenar_direccion()
	CASE fgci_ordenar_por_cli_imp
			res =d_lista_aviso.fnu_ordenar_por_cli_imp()
	CASE fgci_ordenar_por_peligro
			res =d_lista_aviso.fnu_ordenar_peligro()
	CASE fgci_ordenar_nro_instalacion
		res =d_lista_aviso.fnu_ordenar_por_nro_instalacion()
	CASE fgci_ordenar_fecha_res
			res =d_lista_aviso.fnu_ordenar_fecha_res()
	CASE fgci_ordenar_nro_aviso
			res =d_lista_aviso.fnu_ordenar_nro_aviso()
	CASE 	fgci_ordenar_est_aviso
			res =d_lista_aviso.fnu_ordenar_est_aviso()
	CASE ELSE
		res =d_lista_aviso.fnu_ordenar_por_duracion()
END CHOOSE

D_LISTA_AVISO.SETSORT('')
D_LISTA_AVISO.SORT()

end event

on ue_o_datos;call w_sgigenerica::ue_o_datos;
d_filtro_aviso.GetChild('ai_alcance',ldwch_co_alc)
d_filtro_aviso.GetChild('ai_tipo',ldwch_tip_avi)
d_filtro_aviso.GetChild('ai_estado',ldwch_est_aviso)


ddw_alcance_aviso_t_shared.sharedata(ldwch_co_alc)
ddw_tipo_aviso_t_shared.sharedata(ldwch_tip_avi)
ddw_estado_aviso_t_shared.sharedata(ldwch_est_aviso)



end on

event ue_imp_reporte_avi;//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_row, ll_i, ll_nro_incidencia[]
s_reporte_inc_aviso lstr_reporte_inc_aviso



lstr_reporte_inc_aviso.i_reporte = 2
ll_row = d_lista_aviso.GetSelectedRow(0)

DO WHILE ll_row > 0
	ll_i++
	
	lstr_reporte_inc_aviso.l_nro_inc_aviso[ll_i] = d_lista_aviso.GetItemNumber(ll_row, "nro_aviso")
	
	ll_row = d_lista_aviso.GetSelectedRow(ll_row)	
LOOP

If UpperBound(lstr_reporte_inc_aviso.l_nro_inc_aviso) > 0 Then OpenSheetWithParm(w_re_inc_avisos, lstr_reporte_inc_aviso, w_operaciones, 8, Layered!)
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

public function boolean fnu_w_valido_datos_recibidos (ref u_generico_comunicaciones ps_comunic);/////////////////////////////////////////////////////////////////////
// Funcion:  fnu_w_valido_datos_recibidos
// 
// Objetivo:
//	 		Valida la informacion recibida y la resetea con valores por 
//       defecto en caso de que exista incoherencia en la misma.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

// VALIDO EL AMBITO PARA LA CONSULTA

	// Si el ambito no es valido para la consulta asume el ambito por defecto
	// del usuario que esta efectuando la consulta.

	if lu_comunic.is_comunic.intval1 = 0 then // Valido el ambito
			ps_comunic.is_comunic.intval1 = gi_nro_centro // Utilizo centro del usuario
			ps_comunic.is_comunic.intval2 = gi_nro_cmd    // Utilizo cmd del usuario
			ps_comunic.is_comunic.intval3 = gi_nro_puesto // Utilizo puesto del usuario
	end if


// VALIDACION DE PERIODO A CONSULTAR

datetime ld_fecha // variable temporal de fecha

	if ps_comunic.is_comunic.datval1 > ps_comunic.is_comunic.datval2 then // Si las fechas estan invertidas las cambio asumiendo de menor a mayor
			ld_fecha =	ps_comunic.is_comunic.datval1
			ps_comunic.is_comunic.datval1 = ps_comunic.is_comunic.datval2
			ps_comunic.is_comunic.datval2 = ld_fecha
	end if
	


return false
end function

public subroutine fpr_w_presentacion ();/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fpr_w_presentacion
// 
// Objetivo: Habilita y Deshabilita objetos visuales seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
//	 		  
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


//********************TITULO DE LA VENTANA*******************************
//
	IF lu_comunic.is_comunic.Accion_Llamada = "Consulta" then
		this.title = fg_etiqueta(2000001)
	end if
	
	if lu_comunic.is_comunic.accion_llamada = "Seleccion" then
		this.title = fg_etiqueta(2000002)
	end if

//********************CREAR OBJETOS VISUALES DE TRABAJO ********************

//d_ambito.fnu_cargo_drop()
//d_ambito.insertrow(0)

d_ambito.fpr_crea_dddw()
d_ambito.insertrow(0)

this.triggerevent("ue_o_datos")
d_filtro_aviso.insertrow(0)

//DBE ini 30/03/2000 18:47
d_filtro_aviso.setitem(1,'ai_clase_aviso',101) 
d_filtro_aviso.setitem(1,'ai_alimentacion',0)
d_filtro_aviso.object.ai_alimentacion.background.color=gs_gris
d_filtro_aviso.object.ai_alimentacion.protect=1
d_deteccion.f_insertar_fila()
//DBE fin 30/03/2000 18:47

end subroutine

public subroutine frn_w_inicializo_val_def ();/////////////////////////////////////////////////////////////////////
// Funcion:  frn_w_inicializo_val_def
// 
// Objetivo:
//			Inicializa los campos por defecto de la ventana antes de su entrada
//			Segun lo establecido el orden es:
//					Valores pasados por estructuras
//					valores pasados por estructuras modificados por ventanas
//  				Restricciones de usuario  
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////
	


// Inicializo el Ambito ( De haber habido un error la ventana ya se encargo de corregirlo.)

	d_ambito.fnu_cargar_estructura(lu_comunic.is_comunic.intval1,lu_comunic.is_comunic.intval2,lu_comunic.is_comunic.intval3,d_lista_aviso)

// Inicializo deteccion

	d_deteccion.frn_val_def_con_avi()


// Inicializo d_filtro
d_filtro_aviso.fnu_cargar_alcance (lu_comunic.is_comunic.intval8)
d_filtro_aviso.fnu_cargar_duracion (fgci_todos)
d_filtro_aviso.fnu_cargar_estado (lu_comunic.is_comunic.intval4)
d_filtro_aviso.fnu_cargar_tipo ( lu_comunic.is_comunic.intval5)
d_filtro_aviso.fnu_cargo_alimentacion (lu_comunic.is_comunic.intval7)
d_filtro_aviso.fnu_cargar_dddw()
	
end subroutine

public function boolean fnu_valido_datos ();DateTime ldt_fecha_desde
DateTime ldt_fecha_hasta
Date ldt_fecha_desdes
Date ldt_fecha_hastas


d_deteccion.accepttext()  // si dispara el itemchange y se valida los datos de deteccion

d_deteccion.setitem(1,"desde",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"desde")))
d_deteccion.setitem(1,"hasta",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"hasta")))
d_deteccion.accepttext()
ldt_fecha_desde=d_deteccion.getitemdatetime(1,"desde")
ldt_fecha_hasta=d_deteccion.getitemdatetime(1,"hasta")
ldt_fecha_desdes = Date(d_deteccion.getitemdatetime(1,"desde"))
ldt_fecha_hastas = Date(d_deteccion.getitemdatetime(1,"hasta"))

//////////////////////////////VALIDO FECHA DESDE /////////////////////////
IF NOT ISNULL(d_deteccion.getitemdatetime(1,"hasta")) then
	IF ldt_fecha_desde > d_deteccion.getitemdatetime(1,"hasta") THEN
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
IF ISNULL(ldt_fecha_hasta) THEN
	gnv_msg.f_mensaje("EI27","","",OK!)
	d_deteccion.setitem(1,"hasta",idt_fecha_hasta)
	d_deteccion.accepttext()
	d_deteccion.setcolumn("hasta")
	d_deteccion.setfocus()
	ib_si_valido=false
	RETURN FALSE
END IF
IF NOT ISNULL(d_deteccion.getitemdatetime(1,"desde")) then
	IF ldt_fecha_hasta< d_deteccion.getitemdatetime(1,"desde") THEN
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

d_filtro_aviso.accepttext()   //se dispara el itemchange y se validan las condiciones de filtro
// GNU 11-7-2007. Mejora 1/404433 
// Comento lo que queda porque son if sin nada

//int estado
//estado = d_filtro_aviso.getitemnumber(1,"ai_estado")
//IF not ib_rango THEN
//	IF (estado = fgci_todos or estado = fgci_aviso_resuelto) THEN
//		IF fg_verifica_parametro('ambito seleccion') THEN
//// Comentado por Sgo. Mejora Moldavia. 18/05/2005.
////			IF (d_ambito.getitemnumber(1,"nro_centro") = fgci_todos) THEN
////				IF isnull(ldt_fecha_desde) THEN
////					gnv_msg.f_mensaje("EI28","","",OK!)
////					d_deteccion.setitem(1,"desde",idt_fecha_hasta)
////					d_deteccion.accepttext()
////					d_deteccion.setcolumn("desde")
////					d_deteccion.setfocus()
////					RETURN FALSE
////				ELSE
////					IF daysafter(ldt_fecha_desdes,ldt_fecha_hastas) > gl_cant_dias THEN
////						gnv_msg.f_mensaje("EI28","","",OK!)
////						d_deteccion.setitem(1,"desde",idt_fecha_hasta)
////						d_deteccion.accepttext()
////						d_deteccion.setcolumn("desde")
////						d_deteccion.setfocus()
////			
////						RETURN FALSE
////					END IF
////				END IF
////			END IF
//// Fin. Sgo.
//		ELSE
//// Comentado por Sgo. Mejora Moldavia. 18/05/2005.
////			IF isnull(ldt_fecha_desde) THEN
////				gnv_msg.f_mensaje("EI28","","",OK!)
////				d_deteccion.setitem(1,"desde",idt_fecha_hasta)
////				d_deteccion.accepttext()
////				d_deteccion.setcolumn("desde")
////				d_deteccion.setfocus()
////				RETURN FALSE
////			ELSE
////				IF daysafter(ldt_fecha_desdes,ldt_fecha_hastas) > gl_cant_dias THEN
////					gnv_msg.f_mensaje("EI28","","",OK!)
////					d_deteccion.setitem(1,"desde",idt_fecha_desde)
////					d_deteccion.accepttext()
////					d_deteccion.setcolumn("desde")
////					d_deteccion.setfocus()
////		
////					RETURN FALSE
////				END IF
////			END IF
//// Fin. Sgo.
//
//
////			IF d_ambito.getitemnumber(1,"nro_centro") = fgci_todos THEN
////				gnv_msg.f_mensaje("EI29","","",OK!)
////				d_ambito.setcolumn("nro_centro")
////				d_ambito.setfocus()
////				RETURN FALSE
////			ELSEIF d_ambito.getitemnumber(1,"nro_cmd") = fgci_todos THEN
////					gnv_msg.f_mensaje("EI30","","",OK!)
////					d_ambito.setcolumn("nro_cmd")
////					d_ambito.setfocus()
////					RETURN FALSE
////			END IF
//		END IF
//	END IF
//END IF
//
return TRUE

end function

public function long fw_clicked (datawindow adw_dataw, readonly long row);//***************************************
//**  OSGI 2001.1  	20/03/2001			**
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
Long ll_i, ll_rowcount, ll_selected
Integer li_step, li_selected



ll_rowcount = adw_dataw.RowCount()
adw_dataw.SetReDraw(False)

If row > 0 Then
	If KeyDown(KeyControl!) Then
		If adw_dataw.IsSelected(row) Then
			adw_dataw.SelectRow(row, False)
			il_selected_rows --
		Else
			adw_dataw.SelectRow(row, True)
			il_selected_rows ++
		End If
	//   il_row_click = row
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
ll_selected = 0

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
	adw_dataw.SelectRow(row, True)
End If

adw_dataw.SetReDraw(True)

Return ll_selected
//***************************************
//**  OSGI 2001.1  	20/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

event open;call super::open;//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************
String ls_modify_ext = "",ls_syntax
long ll_nro_usuarios

if gi_pais = 8 then 
	d_lista_aviso.dataobject = "d_avi_2019_pr_lista_avisos_consulta_mold"
end if 
//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************

md_lista_avisos.Hide()
ib_si_valido=true

//d_filtro_aviso.object.st_tipo.text = " Clase Aviso " //DBE commentado  tmp 30/03/2000 17:13

// DBE ini 30/03/2000 17:38
datawindowchild ldwch_clase_avi,dddw_usuarios_telegestiones
d_filtro_aviso.getchild('ai_clase_aviso',ldwch_clase_avi)
ldwch_clase_avi.settransobject(sqlca)
ldwch_clase_avi.retrieve('C_AV')
//ldwch_clase_avi.SetSort("codigo A")
//ldwch_clase_avi.Sort()
ldwch_clase_avi.insertrow(1)
ldwch_clase_avi.setitem(1,'codigo',101)
ldwch_clase_avi.setitem(1,'descripcion','<Todos>')

dw_usuarios.object.nro_usuario.width = 654
dw_usuarios.insertrow(0)
dw_usuarios.fnu_crea_dropdown()
// GNU 10-11-2005 Incidencia 0/383236
dw_usuarios.GetChild('nro_usuario',dddw_usuarios_telegestiones)
dddw_usuarios_telegestiones.SetTransObject(SQLCA)
dddw_usuarios_telegestiones.retrieve(gi_nro_centro,gi_nro_cmd)
dddw_usuarios_telegestiones.insertrow(1)
dddw_usuarios_telegestiones.setitem(1,"gi_usuario_sgi_nom_usuario",'<Todos>')
dddw_usuarios_telegestiones.setitem(1,"gi_usuario_sgi_usuario",'<Todos>')
// FIN GNU
dw_usuarios.setitem(1,"nro_usuario",'<Todos>')

// DBE fin 30/03/2000 17:38


// Permite consultar los avisos ingresados al sistema , dependiendo de determinados
// filtros prestablecidos.

// Variable de comunicacaciones es gu_comunic.

// Parametros de Entrada

//		gu_comunic.is_comunic.intval1 = Centro , en 0 Centro del usuario
//		gu_comunic.is_comunic.intval2 = CMD, 0 cmd del usuario
//    gu_comunic.is_comunic.intval3 = puesto 0 puesto del usuario
//		gu_comunic.is_comunic.datval1 = Desde 0 fecha del dia

//    gu_comunic.is_comunic.datval2 = hasta 0 hora del dia
//		gu_comunic.is_comunic.intval4 = Estado 0 Todos los estado
//		gu_comunic.is_comunic.intval5 = Tipo 0 Todos los tipos
// 	gu_comunic.is_comunic.intval6 = duracion 0 No se considera duracion
// 	gu_comunic.is_comunic.intval7 = Alimentacion 0 todas las alimentaciones
//		gu_comunic.is_comunic.intval8	= Alcance 0 todos los alcances.
//    gu_comunic.is_comunic.Accion_llamada = "Seleccion" , blanco consulta
//														 = "Consulta"




//******************CREACION DE OBJETOS DE TRABAJO***********************
//
	lu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
	lu_comunic1 = create u_generico_comunicaciones  // Creo variable de trabajo con formulario

	iu_avi_2030_nu = CREATE u_avi_2030_nu_filtro_aviso
	iu_cen_2001_nu = CREATE u_cen_2001_nu_form_centro_cmd_mesa
 	iu_inc_2013_nu = CREATE u_inc_2013_nu_desde_hasta 

//******************OBTENGO y VALIDO  PARAMETROS DE ENTRADA*************************

	lu_comunic.is_comunic = gu_comunic.is_comunic // Transfiero valores desde globales.

// GNU 1-12-2005. Mejora 1/311271
IF lu_comunic.is_comunic.Accion_Llamada = "Historico" then
	 lu_comunic.is_comunic.Accion_Llamada = "Consulta"
	 ib_historico= true
END IF
// FIN GNU

md_lista_avisos.Show()
//******************PREPARACION DE PRESENTACION DE LA VENTANA************


fpr_w_presentacion() // Preparo presentaci$$HEX1$$f300$$ENDHEX$$n

//***************INICIALIZACION DE VALORES POR DEFECTO********************

iu_inc_2013_nu.fnu_m_accion_perfil_open_avi(d_deteccion,lu_comunic.is_comunic.datval1,lu_comunic.is_comunic.datval2,lu_comunic.is_comunic.intval4,lu_comunic.is_comunic.accion_llamada)
iu_avi_2030_nu.fnu_m_accion_perfil_open_avi(d_filtro_aviso,lu_comunic)
d_filtro_aviso.object.ai_alimentacion.background.color=gs_gris
d_filtro_aviso.object.ai_alimentacion.protect=1
d_ambito.fnu_insertar_datos(gi_nro_centro,gi_nro_cmd,gi_nro_puesto,0)

//d_ambito.fnu_habi_cmd()
//d_ambito.fnu_habi_puesto()
//d_ambito.setitem(1,"nro_centro",ventana[1].centro)
//d_ambito.setitem(1,"nro_centro",gi_nro_centro)
//d_ambito.fnu_filtro_cmd_out()
//d_ambito.setitem(1,"nro_cmd",gi_nro_cmd)
//d_ambito.fnu_filtro_mesa_out()
//d_ambito.setitem(1,"nro_mesa",gi_nro_puesto)

//****************EFECTUO EL RETRIVE A LA BASE DE DATOS*******************
// Obtengo la clausula select original de la datawindow.

d_lista_aviso.settransobject(sqlca) // me conecto a la base para modificar
// GNU 27-10-2005 Mejora 1/335502
//IF fg_verifica_parametro('NIC') then
//	INT li_cuenta
//	select count(*) 
//	into :li_cuenta
//	from gi_sintaxis_usuario 
//	where usuario =:gs_usuario 
//	and datawindow = :d_lista_aviso.dataobject; 
//
//	string ls_select, ls_from, ls_where, ls_dw
//	long posicion,longitud
//	ls_dw=d_lista_aviso.describe("datawindow.table.select")
//	posicion= pos(ls_dw, 'FROM')
//	ls_select=left (ls_dw, posicion - 11)
//	ls_select= ls_select + " SUMCON.NIC NIC "
//	longitud=len(ls_dw)
//	ls_dw=right (ls_dw, longitud - (posicion - 2))
//	posicion= pos (ls_dw, 'WHERE')
//	ls_from= left (ls_dw, posicion - 2)
//	ls_from= ls_from + ", SUMCON "
//	longitud=len(ls_dw)
//	ls_where=right (ls_dw, longitud - (posicion - 2))
//	ls_where= ls_where + "AND SUMCON.NIS_RAD = GI_AVISOS.NIS_RAD"
//	ls_dw= ls_select + ls_from + ls_where
//	d_lista_aviso.modify("DataWindow.table.Select=~"" + ls_dw + "~"")
//	
//if li_cuenta = 0 then  // existe registro para este usuario y esta datawindow, nos salimos.
//	d_lista_aviso.Modify ('create column (visible="1" band=detail id=40 alignment="2" ' + &
//		'tabsequence=0 border="0" ' + &
//		'color="8388608" x="6640" y ="4" height="64" '+ &
//		'width="311" format="[general]" ' + &
//		'name=nic edit.limit=0 edit.case=any ' + &
//		'edit.autoselect=yes font.face="MS Sans Serif" ' + &
//		'font.height= "-10" font.weight="400" ' + &
//		'font.family="2" font.pitch="2" ' + &
//		'font.charset="0" background.mode="0" ' + &
//		'background.color="81324524")')
//	
//	d_lista_aviso.Modify ( 'create text (band=header  alignment="2" ' + &
//		'text="NIC" border="6"  ' + &
//		'color="0" x= "6637" y="4" height="64" ' + &
//		'width="320" name=nic_t ' + &
//		'font.face="MS Sans Serif" ' + &
//		'font.height="-10" font.weight="700" ' + &
//		'font.family="2" font.pitch="2" ' + &
//		'font.charset="0" background.mode="0" ' + &
//		'background.color="81324524" )')
//		
//		d_lista_aviso.Retrieve()
//		d_lista_aviso.Setfocus()
//	END IF
//END IF
// Fin GNU

is_select_original = d_lista_aviso.describe("datawindow.table.select")

d_ambito.setcolumn("nro_centro")
	
if gl_nro_aviso_visible=true then
	d_lista_aviso.object.nro_aviso_t.visible=true
	d_lista_aviso.object.nro_aviso.visible=true
else
	d_lista_aviso.object.nro_aviso_t.visible=false
	d_lista_aviso.object.nro_aviso.visible=false
end if

d_filtro_aviso.object.operacion[1] = "<"
d_filtro_aviso.object.tiempo[1] = 2
dw_1.modify("data_1.DataObject ='" + d_lista_aviso.DataObject + "'")
this.setredraw(true)

//*************************************************************************************//
//   Externalidad: Mostrar la potencia contratada en consulta de avisos                //
//   Luis Eduardo Ortiz Abril/2001                                                     //
//*************************************************************************************//

If gb_potencia Then
	//******************************************
	//**  OSGI 2001.2  	28/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  NIVELES GEOGRAFICOS 						**
	//******************************************
	//**  NIVELES GEOGRAFICOS  	fg_ventana_parametro(This.ClassName(),d_lista_aviso)

	ls_modify_ext = fg_ventana_parametro(This.ClassName(),d_lista_aviso)
	//******************************************
	//**  OSGI 2001.2  	28/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  NIVELES GEOGRAFICOS 						**
	//******************************************
End If

//*************************************************************************************//
//   Luis Eduardo Ortiz Abril/2001                                                     //
//*************************************************************************************//


// Controlo  la visibilidad/invisibilidad de el boton que calcula el total de registro
// mediante la activaci$$HEX1$$f300$$ENDHEX$$n del parametro con cod_parametro=50
IF fg_verifica_parametro('registros seleccionados') THEN
	gb_1.visible = true
	cb_total.visible = true
ELSE
	gb_1.visible = false	
	cb_total.visible = false
END IF


//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************
If fg_verifica_parametro('GEO') Then
	is_modify_ext = "nom_depto_t.text = '" + fg_geografica("2", d_lista_aviso.Describe("nom_depto_t.Text")) + "' "
	d_lista_aviso.Modify(is_modify_ext)
	is_modify_ext = "nom_munic_t.text = '" + fg_geografica("3", d_lista_aviso.Describe("nom_munic_t.Text")) + "' "
	d_lista_aviso.Modify(is_modify_ext)

	is_modify_ext += " " + ls_modify_ext + " "
	
	//	d_lista_aviso.object.nom_munic_t.name "localidad_t"
	//	d_lista_aviso.object.nom_munic_t.name = "depto_t"

	ls_syntax = d_lista_aviso.object.datawindow.syntax
	
End If
//// GNU 30-11-2005. Mejora 1/311271
IF ib_historico then
	// GNU 2-12-2005. Mejora 1/311271
d_deteccion.setitem(d_deteccion.getrow(),"desde",relativedate(today(), -15))
d_deteccion.setitem(d_deteccion.getrow(),"hasta",today())
d_filtro_aviso.Modify("ai_estado.Values='<Todos>~t0/Resuelto~t5/Improcedente~t6/Anulado~t11'")
d_filtro_aviso.SetItem(1,"ai_estado",0)
// FIN GNU
	is_select_original = fg_remplaza (is_select_original , "GI_AVISOS", "GI_HIST_AVISOS")
END IF
// FIN GNU
// GNU 30-11-2005. Mejora 1/311271
//IF lu_comunic.is_comunic.Accion_Llamada = "Historico" then
//	ls_syntax = d_lista_aviso.object.datawindow.syntax
//	ls_syntax = fg_remplaza (ls_syntax, "GI_AVISOS", "GI_HIST_AVISOS")
//	ls_syntax = fg_remplaza (ls_syntax, "gi_avisos", "gi_hist_avisos")
////	d_lista_aviso.Modify("")
//END IF
// FIN GNU
//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************
end event

event close;call super::close;//*********************CLOSE DE LOS OBJETOS UTILIZADOS**********************

DESTROY lu_comunic
DESTROY lu_comunic1
DESTROY iu_inc_2013_nu
DESTROY iu_cen_2001_nu
DESTROY iu_avi_2030_nu

end event

event ue_arch_imprimir;call super::ue_arch_imprimir;//gu_comunic.is_comunic.programa_llamante = "w_1233_consulta_avisos"
//gu_comunic.is_comunic.intval1 = 0 // reseto posible numero de copias
////open(w_1502_impresion)
////gu_comunic.fnu_abrir(w_1502_impresion,"w_1502_impresion",1,1,w_1233_consulta_avisos,"w_1233_consulta_avisos")	
//lu_impresion.is_comunic = gu_comunic.is_comunic
//if lu_impresion.is_comunic.accion_retorno = "Imprimir Registro" then
////	d_lista_aviso.fnu_imprimir_registro(d_lista_aviso.getitemnumber(d_lista_aviso.getrow(),"nro_aviso"))
//	d_form_aviso.fnu_impresion_aviso(d_form_aviso,d_lista_aviso.getitemnumber(d_lista_aviso.getrow(),"nro_aviso"))
//else
//	if lu_impresion.is_comunic.accion_retorno = "Imprimir Lista" then
//		//
//	end if
//end if

DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN d_lista_aviso.ShareData(dw_datos)

IF d_lista_aviso.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

//dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_aviso
lst_impresion.compuesto = false

//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************
lst_impresion.modify = is_modify_ext
//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************


gf_impresion_preliminar (lst_impresion, True, 0)



end event

on w_1233_consulta_avisos.create
int iCurrent
call super::create
if this.MenuName = "md_lista_avisos" then this.MenuID = create md_lista_avisos
this.gb_1=create gb_1
this.d_filtro_aviso=create d_filtro_aviso
this.d_deteccion=create d_deteccion
this.d_ambito=create d_ambito
this.cb_total=create cb_total
this.d_lista_aviso=create d_lista_aviso
this.dw_1=create dw_1
this.dw_usuarios=create dw_usuarios
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
this.Control[iCurrent+2]=this.d_filtro_aviso
this.Control[iCurrent+3]=this.d_deteccion
this.Control[iCurrent+4]=this.d_ambito
this.Control[iCurrent+5]=this.cb_total
this.Control[iCurrent+6]=this.d_lista_aviso
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.dw_usuarios
end on

on w_1233_consulta_avisos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.gb_1)
destroy(this.d_filtro_aviso)
destroy(this.d_deteccion)
destroy(this.d_ambito)
destroy(this.cb_total)
destroy(this.d_lista_aviso)
destroy(this.dw_1)
destroy(this.dw_usuarios)
end on

event activate;////// GNU 18/01/2007. Mejora 1/311530
//IF gu_comunic.is_comunic.programa_retorno = "w_1203" THEN	
//	gnu_u_transaction.uf_desbloquea_avisos(gu_comunic.is_comunic.longval1,1) //commit		
//	gu_comunic.is_comunic.programa_retorno=""
//END IF
////// FIN GNU

if gb_bdi then 
	if gb_hay_sesion  then
	 md_lista_avisos.m_consultar.m_-1.visible=true
	 md_lista_avisos.m_consultar.m_quitarblink.visible = true
 	 md_lista_avisos.m_consultar.m_quitarblink.toolbaritemvisible = true
	 md_lista_avisos.m_consultar.m_grafico.visible=true
	 md_lista_avisos.m_consultar.m_grafico.toolbaritemvisible=true
	 md_lista_avisos.m_consultar.m_capas.visible=true
	 md_lista_avisos.m_consultar.m_capas.toolbaritemvisible=true
	 fg_mostrar(false)
   else  
	 if gnv_msg.f_mensaje("AX04","","",YesNo!) = 2 then 
		  close(this)
	 end if	  
   end if 
end if
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1233_consulta_avisos
integer x = 2921
integer y = 0
end type

type gb_1 from groupbox within w_1233_consulta_avisos
boolean visible = false
integer x = 2103
integer y = 584
integer width = 73
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type d_filtro_aviso from u_avi_2030_pr_filtro_aviso within w_1233_consulta_avisos
integer x = 1029
integer y = 36
integer width = 2528
integer height = 728
integer taborder = 20
boolean border = false
end type

event itemerror;String ls_columna
String ls_modtitulo
String ls_ismodif
ls_modtitulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
this.modify(ls_modtitulo)
ls_columna=this.getcolumnname()
CHOOSE CASE ls_columna
	CASE "ai_duracion"
		ls_ismodif=ls_columna+".ValidationMsg='Debe introducir una cantidad v$$HEX1$$e100$$ENDHEX$$lida.'"
		this.modify(ls_ismodif)
END CHOOSE
this.setfocus()
ib_si_valido=false
end event

event itemchanged;String ls_columna
String ls_modtitulo
String ls_ismodif
ib_si_valido=true
ls_columna=this.getcolumnname()
CHOOSE CASE ls_columna
	CASE "ai_duracion"
			iF IsNull(Integer(this.gettext())) then
					Return 1
			END IF
	CASE "ai_clase_aviso"
		  if data = string (fgci_clase_avi_normal) or data = string(fgci_clase_avi_calidad) then
			this.object.ai_alimentacion.protect=0
			this.object.ai_alimentacion.background.color=gs_blanco
		  else
			this.setitem(1,'ai_alimentacion',0)
			this.object.ai_alimentacion.protect=1
			this.object.ai_alimentacion.background.color=gs_gris
		  end if
	CASE "nro_aviso_desde"
		IF not Integer(this.gettext()) = 0 then
			d_deteccion.modify("desde.background.color ="+gs_gris)
         d_deteccion.modify("hasta.background.color ="+gs_gris)
			d_deteccion.enabled = false
			ib_rango = true 
		ELSEIF getitemnumber(1,"nro_aviso_hasta") = 0 THEN
			d_deteccion.modify("desde.background.color ="+gs_blanco)
	      d_deteccion.modify("hasta.background.color ="+gs_blanco)
		   d_deteccion.enabled = true
			ib_rango = false
		END IF		
		
		 
	CASE "nro_aviso_hasta"
	    IF  not Integer(this.gettext()) = 0 then
         d_deteccion.modify("desde.background.color ="+gs_gris)
         d_deteccion.modify("hasta.background.color ="+gs_gris)
         d_deteccion.enabled = false 		  
			ib_rango = true 
		 ELSEIF  getitemnumber(1,"nro_aviso_desde") = 0 THEN
			d_deteccion.modify("desde.background.color ="+gs_blanco)
	      d_deteccion.modify("hasta.background.color ="+gs_blanco)
			d_deteccion.enabled = true
		 END IF		  
END CHOOSE

end event

event editchanged;// En este evento se controla que el ususario no pueda teclear el signo negativo como
// primer caracter de la duraci$$HEX1$$f300$$ENDHEX$$n.  (LFE)

String ls_columna
ls_columna=this.getcolumnname()
IF ls_columna = "ai_duracion" THEN
	If this.gettext() = "-"  then
		this.settext("")
	END IF
END IF

end event

type d_deteccion from u_inc_2013_pr_desde_hasta within w_1233_consulta_avisos
integer x = 64
integer y = 424
integer width = 910
integer height = 340
integer taborder = 30
boolean border = false
end type

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

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1233_consulta_avisos
integer x = 55
integer y = 36
integer width = 987
integer height = 396
integer taborder = 10
boolean bringtotop = true
boolean border = false
end type

on post_itemchange;call u_cen_2001_pr_form_centro_cmd_mesa::post_itemchange;
//
end on

event clicked;call super::clicked;d_deteccion.accepttext()
//d_ambito.fnu_filtrar_cmd(d_ambito,d_ambito.getitemnumber(1,"nro_centro"))
//d_ambito.fnu_filtro_mesa_nuevo(d_ambito,d_ambito.getitemnumber(1,"nro_cmd"))
//	
end event

on itemchanged;call u_cen_2001_pr_form_centro_cmd_mesa::itemchanged;
//
end on

event constructor;call super::constructor;// seteamos la variable vigente para que nos traiga los $$HEX1$$e100$$ENDHEX$$mbitos obsoletos.
this.ii_vigente = 0
end event

type cb_total from commandbutton within w_1233_consulta_avisos
boolean visible = false
integer x = 2107
integer y = 612
integer width = 59
integer height = 68
integer taborder = 70
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
long ll_row
//ls_select = d_lista_aviso.Object.DataWindow.Table.Select
d_lista_Aviso.Object.DataWindow.Retrieve.AsNeeded='No'
ll_row = d_lista_aviso.RowCount()
ib_total = true
d_filtro_aviso.SetITem(1,'ai_reg_seleccionados',ll_row)

end event

type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within w_1233_consulta_avisos
integer x = 32
integer y = 784
integer width = 3511
integer height = 1008
integer taborder = 50
boolean hscrollbar = true
boolean vscrollbar = true
end type

event doubleclicked;call super::doubleclicked;datetime ldt_f_actual// GNU 18/01/2007. Mejora 1/311530
w_1203_inf_aviso lw_ventana // GNU 18/01/2007. Mejora 1/311530

if row > 0 then
	// GNU 30-11-2005. Mejora 1/311271
	IF ib_historico then
		gu_comunic.is_comunic.longval1 = this.getitemnumber(row,"nro_aviso")
		gu_comunic.is_comunic.longval5 = 1
		gu_comunic.is_comunic.accion_llamada = "Consulta"
		gu_comunic.is_comunic.programa_llamante = "w_1233_consulta_aviso"
		OpenSheet(w_1203_inf_aviso_hist,w_operaciones,8, Layered!)
	else // GNU
	gu_comunic.is_comunic.longval1 = this.getitemnumber(row,"nro_aviso")
	gu_comunic.is_comunic.accion_llamada = "Consulta"
	gu_comunic.is_comunic.programa_llamante = "w_1233_consulta_aviso"
	IF This.GetItemNumber(row, "gi_avisos_ind_calidad") = 1 THEN
		gu_comunic.is_comunic.intval5 = 3
	ELSE
		gu_comunic.is_comunic.intval5 = 1
	END IF
	setPointer(hourglass!)
	yield()
	
	///VALIDO PERFILES
	///MODIFICACION DE VALIDACION DE PERFILES
	IF gu_perfiles.of_acceso_perfil(gi_perfil,"CAV_GENERAL","ACC_MANTEN")=1 then
		d_ambito.accepttext()
//		if gb_operador_cmd then
//			if this.getitemnumber(row,"nro_centro")= gi_nro_centro and &
//			   this.getitemnumber(row,"nro_cmd")= gi_nro_cmd then
//				gu_comunic.is_comunic.accion_llamada = "Actualizacion"
//			end if
//		else
		//if this.getitemnumber(row,"nro_centro")= gi_nro_centro and &
		//	this.getitemnumber(row,"nro_cmd")= gi_nro_cmd and &
		//	this.getitemnumber(row,"nro_mesa")= gi_nro_puesto then
			gu_comunic.is_comunic.accion_llamada = "Actualizacion"
			// GNU 18/01/2007. Mejora 1/311530
//			ldt_f_actual=getitemdatetime(row,"f_actual")

			SELECT f_actual
			INTO :ldt_f_actual
			FROM GI_AVISOS
			WHERE nro_aviso=:gu_comunic.is_comunic.longval1;
			int li_result_func
	
			//AHM (26/10/2009) Mejora 1/614729
			IF fg_verifica_parametro("DESBLOQUEO DE AVISOS") THEN
				IF gu_perfiles.of_acceso_perfil(gi_perfil,'BAV_CONSULTAR','ACC_CONSULTA') = 1 THEN
				ELSE
					li_result_func =gnu_u_transaction.uf_bloquea_avisos( ldt_f_actual, fgci_bloq_datos_aviso, gu_comunic.is_comunic.longval1)
				END IF
			ELSE
				li_result_func =gnu_u_transaction.uf_bloquea_avisos( ldt_f_actual, fgci_bloq_datos_aviso, gu_comunic.is_comunic.longval1)
			END IF
				
			
			IF li_result_func<> 0 THEN
				gu_comunic.is_comunic.accion_llamada = 'Consulta'
			END IF
			
			
			// FIN GNU
		//end if
//		end if	
	end if
	////////////////FDB
	////////////////A$$HEX1$$d100$$ENDHEX$$OS ANTES ERA FDB AHORA SOY FDO
//	OpenSheet(w_1203_inf_aviso,w_operaciones,8, Layered!)

		int li_clase_aviso

		SELECT CLASE_AVISO
		INTO :li_clase_aviso
		FROM GI_AVISOS
		WHERE NRO_AVISO = :gu_comunic.is_comunic.longval1;

	OpenSheetwithparm(lw_ventana,li_clase_aviso,w_operaciones,8, Layered!)
	END IF // FIN GNU
//	IF gs_programa_principal="w_prin" THEN
//		SetPointer(HourGlass!)
//		Open(w_1203_inf_aviso)
//
////		gu_comunic.fnu_abrir(w_1203_inf_aviso,"w_1203_inf_aviso",0,1,w_1233_consulta_avisos,"w_1233_consulta_avisos")	
//	ELSE
//		SetPointer(HourGlass!)
//		Open(w_1203_inf_aviso)
////		gu_comunic.fnu_abrir(w_1203_inf_aviso,"w_1203_inf_aviso",0,1,w_1233_consulta_avisos,"w_1233_consulta_avisos")	
//	END IF
end if


end event

event clicked;call super::clicked;Long ll_return_selected  	//**  OSGI 2001.1  	20/03/2001


setPointer(hourglass!)
yield()


if row> 0 then
	//**  OSGI 2001.1  	20/03/2001  	this.selectrow(0,False)
	fila_ant = row
	//**  OSGI 2001.1  	20/03/2001  	this.selectrow(row,true)
	gl_instalacion_afectada = d_lista_aviso.getitemnumber(row,"cod_calle")



	//***************************************
	//**  OSGI 2001.1  	20/03/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_clicked(This, row)
	
	If d_lista_aviso.RowCount() > 0 Then
		md_lista_avisos.m_consultar.m_informedeavisos.Enabled = True
	Else
		md_lista_avisos.m_consultar.m_informedeavisos.Enabled = False

		If ll_return_selected < 1 Then Return
		
		row = ll_return_selected
		This.ScrollToRow(ll_return_selected)
	End If
	//***************************************
	//**  OSGI 2001.1  	20/03/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
end if


end event

event constructor;call super::constructor;//This.SetRowFocusIndicator(Hand!)

end event

event rowfocuschanged;call super::rowfocuschanged;//
//this.selectrow(this.getrow()-1,false)
//
//this.selectrow(this.getrow(),true)



//***************************************
//**  OSGI 2001.1  	20/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If KeyDown(KeyShift!) Then
	If KeyDown(KeyDownArrow!) Then
		il_row_click = currentrow
		
		If This.IsSelected(currentrow) Then
			This.SelectRow(currentrow - 1, False)
		Else
			This.SelectRow(currentrow, True)
		End If
	End If

	If KeyDown(KeyUpArrow!) Then
		il_row_click = currentrow
		
		If This.IsSelected(currentrow) Then
			This.SelectRow(currentrow + 1, False)
		Else
			This.SelectRow(currentrow, True)
		End If
	End If
ElseIf KeyDown(KeyControl!) Then
	This.ScrollToRow(currentrow)
Else
   This.SelectRow(0, False)
   This.SelectRow(currentrow, True)
End If
//***************************************
//**  OSGI 2001.1  	20/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event scrollvertical;call super::scrollvertical;IF not ib_total THEN
	d_filtro_aviso.setitem(1,"ai_reg_seleccionados", d_lista_aviso.rowcount())
END IF
end event

event sqlpreview;call super::sqlpreview;////
////*****************************************************************//
////  Cambio Externalidad de ordenamiento por indicativo de peligro  //
////  Luis E. Ortiz                                                  //
////*****************************************************************//
//
//
//
//If fg_verifica_parametro("orden_ind_peligro") Then
////	sqlsyntax += "ORDER BY GI_AVISOS.IND_PELIGRO DESC"
//	This.SetSort("GI_AVISOS.IND_PELIGRO D")
//This.Sort()
//
//End If
//
//
////This.setsqlpreview(sqlsyntax)
end event

event ue_key_down;call super::ue_key_down;this.SetRedraw(false)
IF Key = KeyLeftArrow! THEN
	IF this.getselectedrow(0) > 1 AND this.getselectedrow(0) < This.RowCount() THEN
		This.scrolltorow(this.getselectedrow(0)+1)
	END IF
	this.SetRedraw(true)
	return
ELSEIF Key = KeyRightArrow! THEN
	IF this.getselectedrow(0)> 1 THEN
		This.scrolltorow(this.getselectedrow(0) - 1)
	END IF
	this.SetRedraw(true)
	return
END IF
this.SetRedraw(true)
end event

type dw_1 from datawindow within w_1233_consulta_avisos
boolean visible = false
integer x = 18
integer y = 780
integer width = 3511
integer height = 1008
integer taborder = 80
string dataobject = "d_impresion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_usuarios from u_avi_2034_pr_usuario_telegestiones within w_1233_consulta_avisos
integer x = 1486
integer y = 496
integer width = 1115
integer height = 96
integer taborder = 60
boolean bringtotop = true
boolean border = false
end type


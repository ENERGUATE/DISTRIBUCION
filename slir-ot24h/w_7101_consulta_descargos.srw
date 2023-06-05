HA$PBExportHeader$w_7101_consulta_descargos.srw
forward
global type w_7101_consulta_descargos from w_sgigenerica
end type
type d_solicitud from u_inc_2013_pr_desde_hasta within w_7101_consulta_descargos
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_7101_consulta_descargos
end type
type d_filtro from u_desc_7101_pr_filtro_descargos within w_7101_consulta_descargos
end type
type st_1 from statictext within w_7101_consulta_descargos
end type
type pb_1 from picturebutton within w_7101_consulta_descargos
end type
type r_2 from rectangle within w_7101_consulta_descargos
end type
type st_4 from statictext within w_7101_consulta_descargos
end type
type st_3 from statictext within w_7101_consulta_descargos
end type
type r_3 from rectangle within w_7101_consulta_descargos
end type
type st_5 from statictext within w_7101_consulta_descargos
end type
type r_1 from rectangle within w_7101_consulta_descargos
end type
type rb_1 from radiobutton within w_7101_consulta_descargos
end type
type rb_2 from radiobutton within w_7101_consulta_descargos
end type
type gb_2 from groupbox within w_7101_consulta_descargos
end type
type rb_3 from radiobutton within w_7101_consulta_descargos
end type
type rb_4 from radiobutton within w_7101_consulta_descargos
end type
type dw_graf_aux from datawindow within w_7101_consulta_descargos
end type
type pb_2 from picturebutton within w_7101_consulta_descargos
end type
type dw_busca_padre from datawindow within w_7101_consulta_descargos
end type
type dw_1 from datawindow within w_7101_consulta_descargos
end type
type dw_grafico from datawindow within w_7101_consulta_descargos
end type
type st_7 from statictext within w_7101_consulta_descargos
end type
type dw_lista_descargos from u_gen_0000_lista within w_7101_consulta_descargos
end type
type st_2 from statictext within w_7101_consulta_descargos
end type
type st_6 from statictext within w_7101_consulta_descargos
end type
type dw_desc_descargo from datawindow within w_7101_consulta_descargos
end type
type rb_5 from radiobutton within w_7101_consulta_descargos
end type
type rb_6 from radiobutton within w_7101_consulta_descargos
end type
type cb_total from commandbutton within w_7101_consulta_descargos
end type
type sle_1 from singlelineedit within w_7101_consulta_descargos
end type
type st_8 from statictext within w_7101_consulta_descargos
end type
type rb_7 from radiobutton within w_7101_consulta_descargos
end type
type gb_1 from groupbox within w_7101_consulta_descargos
end type
type gb_3 from groupbox within w_7101_consulta_descargos
end type
type gb_4 from groupbox within w_7101_consulta_descargos
end type
end forward

global type w_7101_consulta_descargos from w_sgigenerica
integer width = 3657
integer height = 2008
string title = "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Descargos."
string menuname = "md_lista_descargos"
long backcolor = 79741120
string icon = "descargo.ico"
event ue_armar_sql pbm_custom74
event ue_retrieve pbm_custom75
event ue_ir_comienzo pbm_custom47
event ue_ir_final pbm_custom48
event ue_criterio_orden pbm_custom49
event ue_eliminar pbm_custom55
event ue_presentacion pbm_custom59
event ue_inicializo_objetos pbm_custom61
event ue_calles_afectadas pbm_dwnrbuttondown
event ue_consulta_datos ( )
event ue_instalaciones_modificadas ( )
d_solicitud d_solicitud
d_ambito d_ambito
d_filtro d_filtro
st_1 st_1
pb_1 pb_1
r_2 r_2
st_4 st_4
st_3 st_3
r_3 r_3
st_5 st_5
r_1 r_1
rb_1 rb_1
rb_2 rb_2
gb_2 gb_2
rb_3 rb_3
rb_4 rb_4
dw_graf_aux dw_graf_aux
pb_2 pb_2
dw_busca_padre dw_busca_padre
dw_1 dw_1
dw_grafico dw_grafico
st_7 st_7
dw_lista_descargos dw_lista_descargos
st_2 st_2
st_6 st_6
dw_desc_descargo dw_desc_descargo
rb_5 rb_5
rb_6 rb_6
cb_total cb_total
sle_1 sle_1
st_8 st_8
rb_7 rb_7
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
end type
global w_7101_consulta_descargos w_7101_consulta_descargos

type variables
u_generico_comunicaciones lu_comunic // Variable local de trabajo de comunicacion
u_generico_comunicaciones lu_comunic1 // variable local de trabajo con formulario de informacion
u_generico_comunicaciones iu_resetea // variable local para resetear la variable de comunicaciones
s_w_1234_consulta_incidencias ventana[3]
long ll_anterior = 0
boolean ib_barras = false
boolean ib_ascendente = false
string Is_Select_original = " "
string Is_Clausula_Where = " "
string Is_modificacion = " "
string Is_filtro_ambito
string Is_filtro_deteccion
string Is_filtro_alcance
string Is_filtro_estado
string is_where_inicio = " "
string Is_filtro_tipo
string Is_filtro_alimentacion
string Is_filtro_duracion
string retorno
string is_filtro_nro_desc_desde_hasta
long resultado
int fila_ant
long ll_fila_select
boolean ib_si_valido
long il_inc_seleccionada
long il_row

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
string is_sql
boolean abierto
datetime  idt_f_desde,idt_f_hasta
INTEGER II_OP
boolean ib_encargado_de_turno

/// declaradas por pacho para generar la incidencia
int ii_tipo_instalacion
long il_nro_descargo
string is_observaciones
datetime idt_f_inicio_descargo
datetime idt_f_fin_descargo
long il_instalacion_afectada
boolean lb_bandera
boolean ib_sin_interrupcion
string is_txt, is_htm, is_ruta_txt, is_ruta_htm
string is_usuario
int ii_fila_desde = 1
Boolean ib_mod_cxt_pxt  //**  OSGI 2001.1  28/06/2001
boolean ib_new_tip_inc // TIPO INCIDENCIA AMR
Integer ii_ind_obligada // TIPO INCIDENCIA AMR
integer ii_causa,ii_fam_causa
datetime id_causa
String is_modif_dw_interr = ""  //**  OSGI 2001.2 24/10/2002
end variables

forward prototypes
public function integer fw_borrar_descargo (long pl_instalacion_afectada, long pl_nro_descargo)
public subroutine fw_genera_grafica ()
public function string fw_busca_int_padre (long nro_descargo)
public subroutine fw_generar_incidencia ()
public function long fw_comprobar_datos (long pl_fila)
public subroutine fw_enviar_mail ()
public subroutine fw_armar_mail (string ps_email)
public subroutine fw_fichero_txt (integer pi_nro_descargo, string ps_nombre_inst, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo, string ps_observacion)
public subroutine fw_fichero_htm (integer pi_nro_descargo, string ps_nombre_inst, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo, string ps_observacion)
public function boolean fw_manipula_operacion (long pl_nro_descargo, long pl_nro_instalacion)
public function boolean fw_instalacion_ct (long pl_nro_instalacion)
public subroutine fw_abre_ventana (long pl_incidencia, integer pi_tension)
public function boolean fw_comprueba_interrupciones_previstas (long pl_nro_descargo)
public subroutine fw_deshabilitar_columna_advert ()
public function boolean fw_es_ocen ()
end prototypes

event ue_armar_sql;long ll_alcance, ll_estado, ll_duracion, ll_tiempo//, ll_filtro
string ls_alcance, ls_estado, ls_tiempo, ls_segunda_cond, ls_select//, ls_nom_usuario,filtro,ls_duracion
string ls_sql, ls_operacion, ls_filtro//, ls_filtro_descargo
int li_centro, li_estado, li_interrup//, li_tiempo, li_desde, li_hasta
datetime ldt_f_actual, ldt_nula
boolean lb_grupo_descargo=true
string ls_orden

string ls_sql_2, ls_clausula_where_2, ls_num_prim_descargo

long ll_desc_descargo

ldt_f_actual = fgnu_fecha_actual()
setnull(ldt_nula)

SetPointer(HourGlass!)

md_lista_descargos.m_consultar.m_callesafectadas.enabled = false
md_lista_descargos.m_consultar.m_callesafectadas.ToolbarItemVisible = false
md_lista_descargos.m_consultar.m_instalacionesmodificadas.visible = false
md_lista_descargos.m_consultar.m_instalacionesmodificadas.ToolbarItemVisible = false
md_lista_descargos.m_consultar.m_clientesimportantes.enabled = false
md_lista_descargos.m_consultar.m_clientesimportantes.ToolbarItemVisible = false



d_solicitud.accepttext()
d_filtro.accepttext()
d_ambito.accepttext()

is_filtro_ambito = ""
is_modificacion = ""
is_select_original = ""
is_clausula_where = ""
 
// Valido el filtro por nro de descargo

if isnull(d_filtro.getitemnumber(1,"nro_desc_hasta"))  then 
   d_filtro.setitem(1,"nro_desc_hasta", 0)   
end if
if isnull(d_filtro.getitemnumber(1,"nro_desc_desde")) then
	d_filtro.setitem(1,"nro_desc_desde", 0)   
end if	
If d_filtro.getitemnumber(1,"nro_desc_hasta") < 0  or d_filtro.getitemnumber(1,"nro_desc_desde") < 0  then 
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de descargos no pueden ser menores que 0.")
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
	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de descargos no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
	return
end if		

//obtengo el rango de las fechas de solicitud  
if d_filtro.getitemnumber(1,"nro_desc_desde") > 0 then
	d_solicitud.object.desde[1] = ldt_nula
	d_solicitud.object.hasta[1] = ldt_f_actual
	d_filtro.object.ai_estado_descargo[1] = fgci_todos
	d_filtro.object.ai_alcance[1] = fgci_todos
	d_filtro.object.ai_interrup[1] = fgci_todos
	// GNU 4-9-2006. Mejora 1/426921
	dw_desc_descargo.object.pi_desc_descargo[1]=fgci_todos
	// GNU 5-3-2007. Mejora 1/510515
	lb_grupo_descargo=false
	// FIN GNU
end if

idt_f_desde=d_solicitud.GetItemDateTime(1,"desde")
idt_f_hasta=d_solicitud.GetItemDateTime(1,"hasta")

IF isnull(idt_f_desde) THEN
        idt_f_desde=DateTime(Date("01/01/1900"))
end if

if idt_f_desde >= idt_f_hasta then
    gnv_msg.f_mensaje("EI26","","",OK!)
    //messagebox("Error","Las fechas no son correctas")
    return
end if

// GNU 2-8-2006. Mejora 1/426921
//if fg_verifica_parametro("descripcion descargos") then
//
//		select valor 
//		into :ls_num_prim_descargo
//		from sgd_valor
//		where codif='DESC';
//		
//		ls_sql = "(SELECT NVL(SGD_DESCARGOS.DESCRIPCION,' ') DESCRIPCION, " + &
//			"NVL(SGD_DESCARGOS.NOM_DESC,' ') NOM_DESC, " + &
//			"SGD_DESCARGOS.ESTADO,    " + &
//         "NVL(GI_USUARIO_SGI.NOM_USUARIO,SGD_DESCARGOS.USUARIO), " + &
//         "SGD_DESCARGOS.F_SOLICITADO, " + &  
//         "SGD_DESCARGOS.F_APROBADO, " + &  
//         "SGD_DESCARGOS.F_INI_APROBADO, " + &  
//         "SGD_DESCARGOS.F_FIN_APROBADO, " + &  
//         "SGD_DESCARGOS.ID_ACTIVADO, " + &  
//         "SGD_DESCARGOS.F_ACTIVADO, " + &  
//         "SGD_INSTALACION.NOM_INSTALACION, " + &  
//         "SGD_DESCARGOS.USUARIO, " + &  
//         "SGD_INSTALACION.TENSION, " + & 
//		"SGD_INSTALACION.TIPO_INSTALACION, " + &   
//         "SGD_DESCARGOS.NRO_DESCARGO, " + &  
//         "SGD_DESCARGOS.ID_ENVIADO, " + &  
//         "SGD_DESCARGOS.F_INI_SOLICITADO, " + &   
//         "SGD_DESCARGOS.F_FIN_SOLICITADO, " + &  
//         "SGD_INSTALACION.NRO_INSTALACION, " + &  
//         "SGD_DESCARGOS.USUARIO, " + &  
//         "SGD_DESCARGOS.OBS_APROBADO, " + &  
//         "SGD_DESCARGOS.ID_APROBACION, " + &
//         "fgnu_duracion_str(F_INI_APROBADO,F_FIN_APROBADO), " + &
//         "fg_duracion_int(F_INI_APROBADO,F_FIN_APROBADO) CL_DURACION , " + &
//         "SGD_DESCARGOS.COD_INST_ORIGEN, " + &
//         "SGD_VALORE.DESCRIPCION, " + &
//         "SGD_VALORT.DESCRIPCION, " + &
//         "SGD_DESCARGOS.OBS_SOLICITADO, " + &
//			" NVL(SGD_DESCARGOS.NRO_AGRUPACION,0) SGD_DESCARGOS_NRO_AGRUPACION, " + &
//		   "SGD_DESCARGOS.TIPO_DESCARGO TIPO_DESCARGO, "  + &
//         "SGD_DESCARGOS.IND_ACT_GRAFICA,  " + &
//         "SGD_DESCARGOS.IND_INTERRUPCION,  " + &
//			"fgnu_numero_agrupacion(SGD_DESCARGOS.NRO_DESCARGO) NRO_AGRUPADO, " + &
//			"0 AS c_ext_duracion, "  + &  
//			"0.0 AS c_ext_paxtc, " + &
//			"SGD_DESCARGOS.IND_OBLIGADA, " + &
//			"SGD_DESCARGOS.ID_SOLICITANTE, " + &
//			"SGD_DESCARGOS.ESTADO_RED, " + &
//			"SGD_DESCARGOS.COD_CAUSA, " + &
//			"SGD_DESCARGOS.FAM_CAUSA, " + &
//			"SGD_DESCARGOS.FEC_CAUSA " + &
//   "FROM  SGD_DESCARGOS, " + &
//          "SGD_VALOR  SGD_VALORE, " + &
//          "SGD_VALOR SGD_VALORT, " + &
//         "GI_USUARIO_SGI, " + &
//         "SGD_INSTALACION " + &	
//	"WHERE (SGD_DESCARGOS.NRO_DESCARGO <  " + string(ls_num_prim_descargo) + " )" + &
//								" AND (SGD_DESCARGOS.ID_SOLICITANTE = GI_USUARIO_SGI.USUARIO (+)) AND " + &
//                        "(SGD_VALORE.CODIGO = SGD_DESCARGOS.ESTADO ) AND " + &
//                        "(SGD_VALORE.CODIF = 'ES_D') AND " + &
//                        "(SGD_VALORT.CODIGO = SGD_DESCARGOS.TIPO_DESCARGO ) AND " + &
//                        "(SGD_VALORT.CODIF = 'TI_D') AND " + &
//                        "(SGD_DESCARGOS.COD_INST_ORIGEN = SGD_INSTALACION.NRO_INSTALACION ) and  " + &
//					 "(SGD_INSTALACION.BDI_JOB = 0 ) " 	
//		
//	ls_sql_2 = "SELECT NVL(SGD_DESCRIP.DESCRIPCION,' ') DESCRIPCION, " + &
//			"NVL(SGD_DESCARGOS.NOM_DESC,' ') NOM_DESC, " + &
//			"SGD_DESCARGOS.ESTADO,    " + &
//         "NVL(GI_USUARIO_SGI.NOM_USUARIO,SGD_DESCARGOS.USUARIO), " + &
//         "SGD_DESCARGOS.F_SOLICITADO, " + &  
//         "SGD_DESCARGOS.F_APROBADO, " + &  
//         "SGD_DESCARGOS.F_INI_APROBADO, " + &  
//         "SGD_DESCARGOS.F_FIN_APROBADO, " + &  
//         "SGD_DESCARGOS.ID_ACTIVADO, " + &  
//         "SGD_DESCARGOS.F_ACTIVADO, " + &  
//         "SGD_INSTALACION.NOM_INSTALACION, " + &  
//         "SGD_DESCARGOS.USUARIO, " + &  
//         "SGD_INSTALACION.TENSION, " + & 
//		"SGD_INSTALACION.TIPO_INSTALACION, " + &   
//         "SGD_DESCARGOS.NRO_DESCARGO, " + &  
//         "SGD_DESCARGOS.ID_ENVIADO, " + &  
//         "SGD_DESCARGOS.F_INI_SOLICITADO, " + &   
//         "SGD_DESCARGOS.F_FIN_SOLICITADO, " + &  
//         "SGD_INSTALACION.NRO_INSTALACION, " + &  
//         "SGD_DESCARGOS.USUARIO, " + &  
//         "SGD_DESCARGOS.OBS_APROBADO, " + &  
//         "SGD_DESCARGOS.ID_APROBACION, " + &
//         "fgnu_duracion_str(F_INI_APROBADO,F_FIN_APROBADO), " + &
//         "fg_duracion_int(F_INI_APROBADO,F_FIN_APROBADO) CL_DURACION , " + &
//         "SGD_DESCARGOS.COD_INST_ORIGEN, " + &
//         "SGD_VALORE.DESCRIPCION, " + &
//         "SGD_VALORT.DESCRIPCION, " + &
//         "SGD_DESCARGOS.OBS_SOLICITADO, " + &
//			" NVL(SGD_DESCARGOS.NRO_AGRUPACION,0) SGD_DESCARGOS_NRO_AGRUPACION, " + &
//		   "SGD_DESCARGOS.TIPO_DESCARGO TIPO_DESCARGO, "  + &
//         "SGD_DESCARGOS.IND_ACT_GRAFICA,  " + &
//         "SGD_DESCARGOS.IND_INTERRUPCION,  " + &
//			"fgnu_numero_agrupacion(SGD_DESCARGOS.NRO_DESCARGO) NRO_AGRUPADO, " + &
//			"0 AS c_ext_duracion, " + &  
//			"0.0 AS c_ext_paxtc, " + &
//			"SGD_DESCARGOS.IND_OBLIGADA, " + &
//			"SGD_DESCARGOS.ID_SOLICITANTE, " + &
//			"SGD_DESCARGOS.ESTADO_RED, " + &
//			"SGD_DESCARGOS.COD_CAUSA, " + &
//			"SGD_DESCARGOS.FAM_CAUSA, " + &
//			"SGD_DESCARGOS.FEC_CAUSA " + &
//   "FROM  SGD_DESCARGOS, " + &
//          "SGD_VALOR  SGD_VALORE, " + &
//          "SGD_VALOR SGD_VALORT, " + &
//         "GI_USUARIO_SGI, " + &
//         "SGD_INSTALACION, " + &	
//			"SGD_VALOR SGD_DESCRIP " + &
//	"WHERE (SGD_DESCARGOS.NRO_DESCARGO >=  " + string(ls_num_prim_descargo) + " )" + &

//								" AND (SGD_DESCARGOS.ID_SOLICITANTE = GI_USUARIO_SGI.USUARIO (+)) AND " + &
//                        "(SGD_VALORE.CODIGO = SGD_DESCARGOS.ESTADO ) AND " + &
//                        "(SGD_VALORE.CODIF = 'ES_D') AND " + &
//                        "(SGD_VALORT.CODIGO = SGD_DESCARGOS.TIPO_DESCARGO ) AND " + &
//                        "(SGD_VALORT.CODIF = 'TI_D') AND " + &
//                        "(SGD_DESCARGOS.COD_INST_ORIGEN = SGD_INSTALACION.NRO_INSTALACION ) and  " + &
//					 "(SGD_INSTALACION.BDI_JOB = 0 ) AND " + &
//					 "(SGD_DESCRIP.CODIF ='DS_D') AND (SGD_DESCRIP.CODIGO= SGD_DESCARGOS.DESCRIPCION) "
//
//ELSE //FIN GNU
// GNU 16-2-2006. Incidencia 0/408625	
	ls_sql = "SELECT NVL(SGD_DESCARGOS.DESCRIPCION,' ') DESCRIPCION, " + &
			"NVL(SGD_DESCARGOS.NOM_DESC,' ') NOM_DESC, " + &
			"SGD_DESCARGOS.ESTADO,    " + &
         "NVL(GI_USUARIO_SGI.NOM_USUARIO,SGD_DESCARGOS.USUARIO), " + &
         "SGD_DESCARGOS.F_SOLICITADO, " + &  
         "SGD_DESCARGOS.F_APROBADO, " + &  
         "SGD_DESCARGOS.F_INI_APROBADO, " + &  
         "SGD_DESCARGOS.F_FIN_APROBADO, " + &  
         "SGD_DESCARGOS.ID_ACTIVADO, " + &  
         "SGD_DESCARGOS.F_ACTIVADO, " + &  
         "SGD_INSTALACION.NOM_INSTALACION, " + &  
         "SGD_DESCARGOS.USUARIO, " + &  
         "SGD_INSTALACION.TENSION, " + & 
		"SGD_INSTALACION.TIPO_INSTALACION, " + &   
         "SGD_DESCARGOS.NRO_DESCARGO, " + &  
         "SGD_DESCARGOS.ID_ENVIADO, " + &  
         "SGD_DESCARGOS.F_INI_SOLICITADO, " + &   
         "SGD_DESCARGOS.F_FIN_SOLICITADO, " + &  
         "SGD_INSTALACION.NRO_INSTALACION, " + &  
         "SGD_DESCARGOS.USUARIO, " + &  
         "SGD_DESCARGOS.OBS_APROBADO, " + &  
         "SGD_DESCARGOS.ID_APROBACION, " + &
         "fgnu_duracion_str(F_INI_APROBADO,F_FIN_APROBADO), " + &
         "fg_duracion_int(F_INI_APROBADO,F_FIN_APROBADO) CL_DURACION , " + &
         "SGD_DESCARGOS.COD_INST_ORIGEN, " + &
         "SGD_VALORE.DESCRIPCION, " + &
         "SGD_VALORT.DESCRIPCION, " + &
         "SGD_DESCARGOS.OBS_SOLICITADO, " + &
			" NVL(SGD_DESCARGOS.NRO_AGRUPACION,0) SGD_DESCARGOS_NRO_AGRUPACION, " + &
		   "SGD_DESCARGOS.TIPO_DESCARGO TIPO_DESCARGO, "  + &
         "SGD_DESCARGOS.IND_ACT_GRAFICA,  " + &
         "SGD_DESCARGOS.IND_INTERRUPCION,  " + &
			"fgnu_numero_agrupacion(SGD_DESCARGOS.NRO_DESCARGO) NRO_AGRUPADO, " + &
			"0 AS c_ext_duracion, "  + &  
			"0.0 AS c_ext_paxtc, " + &
			"SGD_DESCARGOS.IND_OBLIGADA, " + &
			"SGD_DESCARGOS.ID_SOLICITANTE, " + &
			"SGD_DESCARGOS.ESTADO_RED, " + &
			"SGD_DESCARGOS.COD_CAUSA, " + &
			"SGD_DESCARGOS.FAM_CAUSA, " + &
			"SGD_DESCARGOS.FEC_CAUSA, " + &
			"SGD_DESCARGOS.IND_ADVERTENCIA " + &
   "FROM  SGD_DESCARGOS, " + &
          "SGD_VALOR  SGD_VALORE, " + &
          "SGD_VALOR SGD_VALORT, " + &
         "GI_USUARIO_SGI, " + &
         "SGD_INSTALACION " + &	
	"WHERE (SGD_DESCARGOS.ID_SOLICITANTE = GI_USUARIO_SGI.USUARIO (+)) AND " + &
                        "(SGD_VALORE.CODIGO = SGD_DESCARGOS.ESTADO ) AND " + &
                        "(SGD_VALORE.CODIF = 'ES_D') AND " + &
                        "(SGD_VALORT.CODIGO = SGD_DESCARGOS.TIPO_DESCARGO ) AND " + &
                        "(SGD_VALORT.CODIF = 'TI_D') AND " + &
                        "(SGD_DESCARGOS.COD_INST_ORIGEN = SGD_INSTALACION.NRO_INSTALACION ) and  " + &
					 "(SGD_INSTALACION.BDI_JOB = 0 ) " 					 
//END IF

//ls_sql = "(SELECT NVL(SGD_DESCARGOS.DESCRIPCION,' ') DESCRIPCION, " + &
//			"NVL(SGD_DESCARGOS.NOM_DESC,' ') NOM_DESC, " + &
//			"SGD_DESCARGOS.ESTADO,    " + &
//         "NVL(GI_USUARIO_SGI.NOM_USUARIO,SGD_DESCARGOS.USUARIO), " + &
//         "SGD_DESCARGOS.F_SOLICITADO, " + &  
//         "SGD_DESCARGOS.F_APROBADO, " + &  
//         "SGD_DESCARGOS.F_INI_APROBADO, " + &  
//         "SGD_DESCARGOS.F_FIN_APROBADO, " + &  
//         "SGD_DESCARGOS.ID_ACTIVADO, " + &  
//         "SGD_DESCARGOS.F_ACTIVADO, " + &  
//         "SGD_INSTALACION.NOM_INSTALACION, " + &  
//         "SGD_DESCARGOS.USUARIO, " + &  
//         "SGD_INSTALACION.TENSION, " + & 
//		"SGD_INSTALACION.TIPO_INSTALACION, " + &   
//         "SGD_DESCARGOS.NRO_DESCARGO, " + &  
//         "SGD_DESCARGOS.ID_ENVIADO, " + &  
//         "SGD_DESCARGOS.F_INI_SOLICITADO, " + &   
//         "SGD_DESCARGOS.F_FIN_SOLICITADO, " + &  
//         "SGD_INSTALACION.NRO_INSTALACION, " + &  
//         "SGD_DESCARGOS.USUARIO, " + &  
//         "SGD_DESCARGOS.OBS_APROBADO, " + &  
//         "SGD_DESCARGOS.ID_APROBACION, " + &
//         "fgnu_duracion_str(F_INI_APROBADO,F_FIN_APROBADO), " + &
//         "fg_duracion_int(F_INI_APROBADO,F_FIN_APROBADO) CL_DURACION , " + &
//         "SGD_DESCARGOS.COD_INST_ORIGEN, " + &
//         "SGD_VALORE.DESCRIPCION, " + &
//         "SGD_VALORT.DESCRIPCION, " + &
//         "SGD_DESCARGOS.OBS_SOLICITADO, " + &
//			" NVL(SGD_DESCARGOS.NRO_AGRUPACION,0) SGD_DESCARGOS_NRO_AGRUPACION, " + &
//		   "SGD_DESCARGOS.TIPO_DESCARGO TIPO_DESCARGO, "  + &
//         "SGD_DESCARGOS.IND_ACT_GRAFICA,  " + &
//         "SGD_DESCARGOS.IND_INTERRUPCION,  " + &
//			"fgnu_numero_agrupacion(SGD_DESCARGOS.NRO_DESCARGO) NRO_AGRUPADO, " + &
//			"0 AS c_ext_duracion, " /**  OSGI 2001.1 21/06/2001  **/ + &  
//			"0.0 AS c_ext_paxtc, " /**  OSGI 2001.1 21/06/2001  **/ + &
//			"SGD_DESCARGOS.IND_OBLIGADA, " + &
//			"SGD_DESCARGOS.ID_SOLICITANTE, " + &
//			"SGD_DESCARGOS.ESTADO_RED, " + &
//			"SGD_DESCARGOS.COD_CAUSA, " + &
//			"SGD_DESCARGOS.FAM_CAUSA, " + &
//			"SGD_DESCARGOS.FEC_CAUSA " + &
//   "FROM  SGD_DESCARGOS, " + &
//          "SGD_VALOR  SGD_VALORE, " + &
//          "SGD_VALOR SGD_VALORT, " + &
//         "GI_USUARIO_SGI, " + &
//         "SGD_INSTALACION " + &		
//   "WHERE (SGD_DESCARGOS.USUARIO = GI_USUARIO_SGI.USUARIO (+)) AND " + &
//                        "(SGD_VALORE.CODIGO = SGD_DESCARGOS.ESTADO ) AND " + &
//                        "(SGD_VALORE.CODIF = 'ES_D') AND " + &
//                        "(SGD_VALORT.CODIGO = SGD_DESCARGOS.TIPO_DESCARGO ) AND " + &
//                        "(SGD_VALORT.CODIF = 'TI_D') AND " + &
//                        "(SGD_DESCARGOS.COD_INST_ORIGEN = SGD_INSTALACION.NRO_INSTALACION ) and  " + &
//					 "(SGD_INSTALACION.BDI_JOB = 0 ) " 
// FIN GNU
					 
IF NOT d_filtro.getitemnumber(1,"nro_desc_desde") > 0 THEN
// A$$HEX1$$f100$$ENDHEX$$adido por SGO. Mejora 1/370503 - Moldavia. 16/08/2005.
	If gi_pais = 8 Then
		ls_sql += " AND ( ( SGD_DESCARGOS.F_INI_SOLICITADO <= :desde AND SGD_DESCARGOS.F_FIN_SOLICITADO >= :desde ) OR " + &
							  "( SGD_DESCARGOS.F_INI_SOLICITADO < :hasta + 1/(24*60) AND SGD_DESCARGOS.F_FIN_SOLICITADO > :hasta + 1/(24*60) ) OR " + &
							  "( SGD_DESCARGOS.F_INI_SOLICITADO >= :desde AND SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta + 1/(24*60) ) )  "
		// GNU 2-8-2006. Mejora 1/426921
//		if fg_verifica_parametro("descripcion descargos") then
//			ls_sql_2 += " AND ( ( SGD_DESCARGOS.F_INI_SOLICITADO <= :desde AND SGD_DESCARGOS.F_FIN_SOLICITADO >= :desde ) OR " + &
//							  "( SGD_DESCARGOS.F_INI_SOLICITADO < :hasta + 1/(24*60) AND SGD_DESCARGOS.F_FIN_SOLICITADO > :hasta + 1/(24*60) ) OR " + &
//							  "( SGD_DESCARGOS.F_INI_SOLICITADO >= :desde AND SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta + 1/(24*60) ) )  "
//		end if
		// FIN GNU
		//Si es inicio real y fin real
		//AHM (19/02/2008)
		if rb_3.checked = true then
//		if rb_7.checked = true then
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO <= :desde", "SGD_DESCARGOS.F_INI_APROBADO <= :desde")
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO >= :desde", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO >= :desde")

			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO < :hasta", "SGD_DESCARGOS.F_INI_APROBADO < :hasta")
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO > :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO > :hasta ")

			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_INI_APROBADO >= :desde")
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO < :hasta ")
//			// GNU 2-8-2006. Mejora 1/426921
//			if fg_verifica_parametro("descripcion descargos") then
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_INI_SOLICITADO <= :desde", "SGD_DESCARGOS.F_INI_APROBADO <= :desde")
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_FIN_SOLICITADO >= :desde", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO >= :desde")
//
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_INI_SOLICITADO < :hasta", "SGD_DESCARGOS.F_INI_APROBADO < :hasta")
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_FIN_SOLICITADO > :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO > :hasta ")
//
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_INI_APROBADO >= :desde")
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO < :hasta ")
//			end if
//			// FIN GNU
		end if
	Else
// Fin. Sgo.
		// LFE Mejora 1/275744: B$$HEX1$$fa00$$ENDHEX$$squeda Descargos. Se sustituye F_SOLICITADO por F_INI_SOLICITADO y por F_FIN_SOLICITADO
		ls_sql += " AND ( ( SGD_DESCARGOS.F_INI_SOLICITADO >= :desde ) AND  " + &
					 "( SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta + 1/(24*60) ) )  "  
		// GNU 2-8-2006. Mejora 1/426921
//		if fg_verifica_parametro("descripcion descargos") then
//			ls_sql_2 += " AND ( ( SGD_DESCARGOS.F_INI_SOLICITADO >= :desde ) AND  " + &
//					 	"( SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta + 1/(24*60) ) )  "  
//		end if
		// FIN GNU
		//Si es inicio real y fin real
		//AHM(19/02/2008)
		// RCA Incidencia. Comento if rb_7.checked = true then y descomento if rb_3.checked = true then


//		if rb_7.checked = true then
		if rb_3.checked = true then
			//ASUR 862449
			IF gi_pais = 3 THEN
				ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_INI_SOLICITADO >= :desde")
				ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "sgd_descargos.f_solicitado is not null and sgd_descargos.f_ini_solicitado is not null and SGD_DESCARGOS.F_INI_SOLICITADO < :hasta ")				
			ELSE
				ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_INI_APROBADO >= :desde")
				ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_INI_APROBADO < :hasta ")
			END IF
			// GNU 2-8-2006. Mejora 1/426921
//			if fg_verifica_parametro("descripcion descargos") then
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_INI_APROBADO >= :desde")
//				ls_sql_2 = fg_remplaza(ls_sql_2,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_INI_APROBADO < :hasta ")
//			end if
//			// FIN GNU
		//AHM (04/01/2007)
		ELSEIF rb_7.checked THEN
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_SOLICITADO >= :desde")
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "SGD_DESCARGOS.F_SOLICITADO < :hasta ")
		END IF
		// LFE Fin Mejora 1/275744
		End If // A$$HEX1$$f100$$ENDHEX$$adido por SGO. Mejora 1/370503 - Moldavia. 16/08/2005.
END IF

li_centro = d_ambito.getitemnumber(1,"nro_centro")
// Filtro para centro, cmd y mesa solo para operadores
if gb_usuario_mant = false and gb_usuario_tele = false then     
        is_filtro_ambito = d_ambito.fnu_filtro_ambito_descargos(d_ambito.getitemnumber(1,"nro_centro"), d_ambito.getitemnumber(1,"nro_cmd") , d_ambito.getitemnumber(1,"nro_mesa")) 
        IF is_filtro_ambito <> " " THEN
                is_filtro_ambito = fg_remplaza(is_filtro_ambito,"~"","")
					 // Incluir el caso CMD = 0, SECTOR = 0 para recuperara Instalaciones Moviles
					 IF li_centro = fgci_todos THEN
					    is_filtro_ambito = ' (' + is_filtro_ambito + " or ( SGD_INSTALACION.NRO_CMD = 0  and SGD_INSTALACION.NRO_MESA = 0 ))  "					 					 
				 	 ELSE
						 is_filtro_ambito = ' (' + is_filtro_ambito + " or ( SGD_INSTALACION.NRO_CMD = 0  and SGD_INSTALACION.NRO_MESA = 0  AND SGD_INSTALACION.NRO_CENTRO = " + string(li_centro) + "))  "					 					 						 
					 END IF
                is_clausula_where = is_clausula_where + " AND "+ is_filtro_ambito 
        END IF
end if

// Tipo de tension
ll_alcance = d_filtro.getitemnumber(1,"ai_alcance")
if ll_alcance > 0 then
        ls_alcance  = ' "SGD_INSTALACION"."TENSION" = ' + string(ll_alcance)
        ls_alcance = fg_remplaza(ls_alcance,"~"","")
        is_clausula_where = is_clausula_where +" AND "+ ls_alcance      
end if

// Estado del descargo
ll_estado = d_filtro.getitemnumber(1,"ai_estado_descargo")
if ll_estado > 0 then
        ls_estado = '"SGD_DESCARGOS"."ESTADO" = ' + string(ll_estado)
        ls_estado = fg_remplaza(ls_estado,"~"","")
        is_clausula_where = is_clausula_where +" AND "+ ls_estado 
end if

// Filtro por el numero de descargo
is_filtro_nro_desc_desde_hasta = d_filtro.fnu_filtro_nro_descargo()
if is_filtro_nro_desc_desde_hasta <> "" then
	is_clausula_where = is_clausula_where + " and " + is_filtro_nro_desc_desde_hasta
end if

// Duracion del descargo
d_filtro.accepttext()
ll_duracion =   d_filtro.object.ai_duracion[1]

if ll_duracion <> 0 and not isnull(ll_duracion) then
        // Formato de la duraci$$HEX1$$f300$$ENDHEX$$n de los descargos 
        ll_tiempo=d_filtro.object.tiempo[1]
        ls_tiempo= string(ll_tiempo)
        
        // Condicion de duracion
        ls_operacion =  d_filtro.object.operacion[1]    
        ls_operacion = ls_operacion + " "

        //Calculo el tiempo en minutos del filtro de duracion
        if ll_tiempo=2 then
                ls_tiempo= string(ll_duracion*60)
        elseif ll_tiempo=3 then
                ls_tiempo= string(ll_duracion*60*24)
        end if

        ls_filtro = "fg_duracion_int(F_INI_APROBADO,F_FIN_APROBADO) " + ls_operacion + " " + ls_tiempo
        is_clausula_where = is_clausula_where + " and " + ls_filtro
end if

// Para el filtro estado = <Todos> no se debe mostrar el estado finalizado ya que 
// no esta en el incluido en el filtro 

li_estado = d_filtro.object.ai_estado_descargo[1]
IF li_estado = fgci_todos THEN
	ls_filtro = 'SGD_DESCARGOS.ESTADO <> ' + string(fgci_descargo_finalizado)
   is_clausula_where = is_clausula_where + " and " + ls_filtro
END IF

// El Descargo sin/con Interrupcion 
//______DSA INI 03/04/2000			
li_interrup = d_filtro.getitemnumber(1,"ai_interrup")
if li_interrup > 0 then
		  string ls_interrup
        ls_interrup= 'NVL("SGD_DESCARGOS"."IND_INTERRUPCION",1) = ' + string(li_interrup)
        ls_interrup = fg_remplaza(ls_interrup,"~"","")
        is_clausula_where = is_clausula_where +" AND "+ ls_interrup 
end if
//______DSA FIN 03/04/2000			

ls_segunda_cond = ""

//if gb_usuario_mant = true or gb_usuario_tele = true then        
//                ls_segunda_cond = "' and '" + "gi_usuario_sgi.usuario = '" + gs_usuario + " '"
//                ls_segunda_cond = fg_remplaza(ls_segunda_cond,"~"","")
//end if

// GNU 2-8-2006. Mejora 1/426921
if fg_verifica_parametro("descripcion descargos") then
	ll_desc_descargo= dw_desc_descargo.object.pi_desc_descargo[1]
	IF ll_desc_descargo <> fgci_todos THEN
		is_clausula_where +=" and SGD_DESCARGOS.DESCRIPCION = '" + string(ll_desc_descargo) + "'"
//		is_modificacion = "DataWindow.Table.Select=~" (" + ls_sql_2 + is_clausula_where + ls_clausula_where_2 + ls_segunda_cond + ")~""
//	else
//			is_modificacion = "DataWindow.Table.Select=~" " + ls_sql + is_clausula_where + ls_segunda_cond + " UNION ALL " + ls_sql_2 + is_clausula_where + ls_segunda_cond + ")~""
	end if
//else
end if

// GNU 5-3-2007. Mejora 1/510515
if fg_verifica_parametro("grupo descargo") and lb_grupo_descargo then
	if rb_5.checked = true then
		is_clausula_where += " and SGD_DESCARGOS. GRUPO_DESCARGO = 1 "
	else
		is_clausula_where += " and SGD_DESCARGOS. GRUPO_DESCARGO = 2 "
	end if
end if
// FIN GNU

// GNU 30-5-2007. Para que no me traiga todos los registros al tiempo
if gi_pais= 8 THEN
	ls_orden = " order by SGD_DESCARGOS.NRO_DESCARGO desc "
end if
// FIN GNU

	is_modificacion = "DataWindow.Table.Select=~" " + ls_sql + is_clausula_where + ls_segunda_cond + ls_orden +"~""
//end if
// FIN GNU
ls_select= dw_lista_descargos.modify(is_modificacion)



//// GNU 19-7-2006. Incidencia 0/443237
//IF gi_pais=8 THEN
//	dw_lista_descargos.SetSort("nro_descargo D" )
//	dw_lista_descargos.Sort()
//END IF
//// FIN GNU

if ls_select = "" then
        dw_lista_descargos.setredraw(true)
        this.triggerevent("ue_retrieve")
else
        messagebox("Estado","Modificacion Erronea " + ls_select)
end if

end event

event ue_retrieve;long ll_retorno, ll_cantidad, ll_duracion, ll_filtro,ll_tiempo
string ls_filtro, ls_operacion, ls_tiempo,ls_vacia
int li_estado

this.setredraw(false)
dw_lista_descargos.setredraw(false)
ii_fila_desde = 1
ls_vacia = ""
//dw_lista_descargos.setfilter(ls_vacia)
//dw_lista_descargos.filter()
//

//AHM (04/05/2011) ASUR 1059966
IF dw_lista_descargos.rowCount() > 0 THEN
	dw_lista_descargos.update()
	COMMIT;
END IF

ll_retorno = dw_lista_descargos.retrieve(idt_f_desde,idt_f_hasta)

IF not IsValid(this) then return

dw_lista_descargos.Triggerevent('scrollvertical')
ll_cantidad = dw_lista_descargos.rowcount()

dw_lista_descargos.setredraw(true)
this.setredraw(true)

ll_cantidad = dw_lista_descargos.rowcount()

if ll_cantidad > 0 then
        st_1.text = string(ll_cantidad)
		  // GNU 30-5-2007. Mejora 1/328385
		  sle_1.text= string(ll_cantidad)
		  // FIN FNU
        //Activo el timer segun intval6
        //timer(gu_comunic.is_comunic.intval6,w_7101_consulta_descargos)
else
        //timer(0,w_7101_consulta_descargos)
        gnv_msg.f_mensaje("IT01","","",OK!)
        st_1.text = '0'
		  // GNU 30-5-2007. Mejora 1/328385
		  sle_1.text= '0'
		  // FIN FNU
end if

il_row = 0



long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Descargos'
ll_longitud = len (ls_titulo)*100

//Inserto las fechas, si son nulas visualizo el texto 00/00/0000 00:00:00
ldt_desde = d_solicitud.GetItemDatetime(1,'desde')
IF IsNull(ldt_desde) THEN 
	dw_1.modify("nulo_desde.visible = '1'")
	dw_1.modify("f_desde.visible='0'")
ELSE
	dw_1.modify("nulo_desde.visible = '0'")
		dw_1.modify("f_desde.visible='1'")
END IF
ldt_hasta = d_solicitud.GetItemDatetime(1,'hasta')
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

DataWindowChild dw_datos
//dw_1.GetChild ("data_1",dw_datos)
dw_1.Modify("data_1.Width= '7500'")
//dw_lista_descargos.ShareData(dw_datos)
//dw_lista_descargos.ShareDataOff()
return ll_retorno

end event

event ue_ir_comienzo;SetPointer(HourGlass!)

	dw_lista_descargos.selectrow(0,False)
	dw_lista_descargos.selectrow(dw_lista_descargos.getRow(),false)
	fila_ant =1
	dw_lista_descargos.selectrow(1,true)
	dw_lista_descargos.scrolltorow(1)
	
	
SetPointer(Arrow!)
end event

event ue_ir_final;SetPointer(HourGlass!)

	dw_lista_descargos.selectrow(0,False)
	dw_lista_descargos.selectrow(dw_lista_descargos.getRow(),false)
	fila_ant =dw_lista_descargos.rowcount()
	dw_lista_descargos.selectrow(dw_lista_descargos.rowcount(),true)
	dw_lista_descargos.scrolltorow(dw_lista_descargos.rowcount())


SetPointer(Arrow!)
end event

event ue_criterio_orden;string ls_orden 
dw_lista_descargos.setredraw(false)

if ib_ascendente = true or ll_anterior <> gu_comunic.is_comunic.intval9 then
        ls_orden = "A"
        ib_ascendente = false
else
        ls_orden = "D"
        ib_ascendente = true
end if

ll_anterior = gu_comunic.is_comunic.intval9 

CHOOSE CASE gu_comunic.is_comunic.intval9

        CASE 1
//                dw_lista_descargos.SetSort("duracion " + ls_orden)
					 dw_lista_descargos.SetSort("duracion " + ls_orden + ", nro_descargo D")

        CASE 2
//                dw_lista_descargos.SetSort("estado " + ls_orden)
					 dw_lista_descargos.SetSort("estado " + ls_orden + ", nro_descargo D")
        
        CASE 3
//                dw_lista_descargos.SetSort("sgd_instalacion_nom_instalacion " + ls_orden)
					 dw_lista_descargos.SetSort("sgd_instalacion_nom_instalacion " + ls_orden + ", nro_descargo D")

        CASE 4
//                dw_lista_descargos.SetSort("nom_usuario " + ls_orden)
					 dw_lista_descargos.SetSort("nom_usuario " + ls_orden + ", nro_descargo D")
END CHOOSE

dw_lista_descargos.sort()
dw_lista_descargos.setredraw(true)

dw_lista_descargos.SetSort("")
dw_lista_descargos.Sort()

end event

event ue_eliminar;long ll_respuesta, ll_estado, ll_nro_descargo, ll_nro_instalacion, ll_fila_marcada
string ls_incid, ls_aux
int indice, li_par, li_tension, li_row
boolean lb_sigo=true
	
li_row = dw_lista_descargos.GetSelectedrow(0)

if li_row < 1 then
        return
end if

li_tension = dw_lista_descargos.getItemNumber(li_row,'sgd_instalacion_tension')
ls_incid  = gu_perfiles.of_nivel_tension('DES_ELIMINAR')
is_usuario= dw_lista_descargos.getitemstring(li_row,"gi_usuario_sgi_usuario")

if is_usuario <> gs_usuario then 
	// No se puede  seleccionar la instalaci$$HEX1$$f300$$ENDHEX$$n puesto que hay operaciones y
	// su nivel de tensi$$HEX1$$f300$$ENDHEX$$n tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
	gnv_msg.f_mensaje("AA23", "", "", OK!)
	gu_comunic.is_comunic.decval1 = 0
	Return
END IF

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

if dw_lista_descargos.getitemNUMBER(li_row,"sgd_descargos_estado") = 1 then
        ll_respuesta = gnv_msg.f_mensaje("CD05","","",YesNo!)
        if ll_respuesta = 1 then        
                ll_nro_descargo = dw_lista_descargos.getitemnumber(li_row,"nro_descargo")
                ll_nro_instalacion = dw_lista_descargos.getitemnumber(li_row,"sgd_instalacion_nro_instalacion")

                fw_borrar_descargo(ll_nro_instalacion, ll_nro_descargo)

                delete from sgd_descargos_inst_afec where nro_descargo = :ll_nro_descargo;
					 					 
                delete from sgd_descargos where nro_descargo = :ll_nro_descargo;

                if sqlca.sqlcode = 0 then
                        gnu_u_transaction.uf_commit();
                else
                        gnu_u_transaction.uf_rollback();
                end if
                
                this.triggerevent("ue_retrieve")
                
                //dw_lista_descargos.deleterow(il_row)
                //dw_lista_descargos.update()
                
        end if
else
        gnv_msg.f_mensaje("ED25","","",Ok!)
end if
end event

event ue_presentacion;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fpr_w_presentacion
// 
// Objetivo: Pone t$$HEX1$$ed00$$ENDHEX$$tulos a las ventanas dependiendo de la acci$$HEX1$$f300$$ENDHEX$$n
//           llamada , crea y habilita objetos de trabajo.
//          
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 

// Par$$HEX1$$e100$$ENDHEX$$metros
//              Entrada: --
//                      Salida : --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////////////////
int li_tension
//********************TITULO DE LA VENTANA*******************************
//
//      THIS.title = fg_etiqueta(2000004)
This.title = "OPEN SGI - Consulta de Descargos"
        
//********************CREAR OBJETOS VISUALES DE TRABAJO ********************

dw_lista_descargos.SetTransObject(SQLCA)
//-----------AMBITO----------
        d_ambito.fpr_crea_dddw()
        d_ambito.insertrow(0)   
        d_ambito.accepttext()

//-----------FILTRO----------
IF gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_CONSULTA") = 1 THEN
   li_tension=d_filtro.fnu_cargar_dddw_consulta()
ELSEIF gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_MANTEN") = 1 THEN 
	   li_tension=d_filtro.fnu_cargar_dddw()
END IF 

d_filtro.Insertrow(0)
lu_comunic.is_comunic.intval7= li_tension

        
//-----------F_SOLICITUD-----
        
        d_solicitud.InsertRow(0)

md_lista_descargos.m_consultar.m_clientesimportantes.enabled = False
md_lista_descargos.m_consultar.m_clientesimportantes.ToolbarItemVisible = False


//***************************************
//**  OSGI 2001.1  	07/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_mod_cxt_pxt = fg_verifica_parametro(This.ClassName())

//fg_ventana_parametro(This.ClassName(), dw_lista_descargos)
//fg_alto_texto(dw_lista_descargos, dw_lista_descargos.ClassName(), 0)

//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  fg_ventana_parametro('Hist_Desc', dw_lista_descargos)
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  fg_alto_texto(dw_lista_descargos, 'dw_lista', 0)
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //***************************************
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //**  OSGI 2001.1  	07/06/2001			**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //**  Jair Padilla / Soluziona PANAMA  **
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  //***************************************

is_modif_dw_interr = fg_ventana_parametro('Hist_Desc', dw_lista_descargos)
is_modif_dw_interr += fg_alto_texto(dw_lista_descargos, 'dw_lista', 0)
//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
end event

event ue_inicializo_objetos;datetime ldt_fecha
datawindowchild dddw_pi_desc_descargo

ldt_fecha=DateTime(Date("01/01/1900"))

//----inicializa-----
//---------Ambito-----------------
d_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1, &
								  lu_comunic.is_comunic.intval2, &
								  lu_comunic.is_comunic.intval3, 0)

//--------Filtro--------------------    
// Modificado por Sgo. 27/04/2005. Mejora Moldavia.
//d_filtro.SetItem(1,"ai_estado_descargo",fgci_todos)
If gi_pais = 8 Then
	d_filtro.SetItem(1,"ai_estado_descargo",fgci_descargo_aprobado)
	d_filtro.SetItem(1,"ai_alcance",fgci_todos)
	rb_4.Checked = False // Solicitud
	rb_3.Checked = True // Alta
Else
	d_filtro.SetItem(1,"ai_estado_descargo",fgci_todos)
	d_filtro.SetItem(1,"ai_alcance",lu_comunic.is_comunic.intval7)
End If
// Fin. Sgo.
d_filtro.SetItem(1,"ai_duracion",0) 

//-------fechas solicitud---------------        
setnull(ldt_fecha)
d_solicitud.SetItem(1,"desde",ldt_fecha)
// Modificado por Sgo. 27/04/2005. Mejora Moldavia.
//d_solicitud.SetItem(1,"hasta",fgnu_fecha_actual())
String ls_hora

ls_hora = String(Time('23:59'), "hh:mm")
d_solicitud.SetItem(1,"hasta",DateTime(Date(fgnu_fecha_actual()), Time(ls_hora)))
// Fin Sgo.

//--------filtro-------
d_filtro.modify("ai_estado_descargo.protect="+String(ii_habilitado))
d_filtro.modify("ai_alcance.protect="+String(ii_habilitado))
d_filtro.modify("ai_duracion.protect="+String(ii_habilitado))

d_filtro.modify("ai_estado_descargo.background.color="+gs_blanco)
d_filtro.modify("ai_alcance.background.color="+gs_blanco)
d_filtro.modify("ai_duracion.background.color="+gs_blanco)

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
	
	r_3.y= 790
	st_3.y= 778
	
	r_1.y= 902
	st_4.y= 890 
	
	r_2.y= 1018
	st_5.y= 1006
	
	gb_2.y= 738
	pb_2.y= 790
	rb_1.y= 850
	pb_1.y= 930
	rb_2.y= 942
	
	
	
	dw_lista_descargos.y= 1100
	
	
end if
// FIN GNU

//-------fecha solicitud---------
d_solicitud.modify("desde.protect="+String(ii_habilitado))
d_solicitud.modify("hasta.protect="+String(ii_habilitado))

d_solicitud.modify("desde.background.color ="+gs_blanco)
d_solicitud.modify("hasta.background.color ="+gs_blanco)
end event

event ue_calles_afectadas;long ll_fila

u_generico_comunicaciones iu_comunic

//Cojo el numero de descargo de la fila marcada
ll_fila = dw_lista_descargos.getselectedrow(0)

if ll_fila >0 then 
	//Numero de descargo
	gu_comunic.is_comunic.longval1= dw_lista_descargos.getitemnumber(ll_fila,'nro_descargo')
	open (w_7003_calles_afectadas)
end if
end event

event ue_consulta_datos;long ll_fila

u_generico_comunicaciones iu_comunic

//Cojo el numero de descargo de la fila marcada
ll_fila = dw_lista_descargos.getselectedrow(0)

IF ll_fila > 0 THEN
	//Numero de descargo
	gu_comunic.is_comunic.longval1= dw_lista_descargos.getitemnumber(ll_fila,'nro_descargo')
	gu_comunic.is_comunic.strval2= dw_lista_descargos.GetItemString(ll_fila,'sgd_instalacion_nom_instalacion')
	gu_comunic.is_comunic.datval1= dw_lista_descargos.GetItemDateTime(ll_fila,'sgd_descargos_f_ini_solicitado')
	gu_comunic.is_comunic.datval2= dw_lista_descargos.GetItemDateTime(ll_fila,'sgd_descargos_f_fin_solicitado')
	open (w_7003_datos_descargo)

END IF
end event

event ue_instalaciones_modificadas;long ll_fila, ll_descargo
// COMIENZO ALE

//Cojo el numero de descargo de la fila marcada
ll_fila = dw_lista_descargos.getselectedrow(0)
if ll_fila >0 then 
//Numero de descargo
                ll_descargo= dw_lista_descargos.getitemnumber(ll_fila,'nro_descargo')
                openwithparm(w_7105_instalaciones_descargo,ll_descargo)
                if Message.doubleParm=0 then // No hay registros
                        gnv_msg.f_mensaje("IT01","","",OK!)
                end if 
end if

// FINAL ALE
end event

public function integer fw_borrar_descargo (long pl_instalacion_afectada, long pl_nro_descargo);long li_cant_avisos
decimal ldec_nro_instalacion       

DELETE FROM "SGD_INTERRUPCION_DESCARGO"  
WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :pl_nro_descargo   ;

IF SQLCA.SQLCODE = -1 THEN      
	gnv_msg.f_mensaje("EA24","","",Ok!)
  //messagebox ("Aviso","No se pudieron actualizar las tablas")
  RETURN -1
END IF

return 0
end function

public subroutine fw_genera_grafica ();//Coje la inforamacion de la datawindow auxiliar dw_graf_aux y la va cargando en la datawindow grafica

long ll_codigo,ll_cantidad,ll_filamax,ll_nueva_row,ll_row=1,ll_mostrar=0
string ls_descripcion,ls_auxiliar

ll_filamax = dw_graf_aux.rowcount()

if ll_filamax = 0 then 
        return
end if

DO 
                ll_cantidad=dw_graf_aux.getitemnumber(ll_row,"compute_0001")
                ls_descripcion=dw_graf_aux.getitemstring(ll_row,"sgd_valor_descripcion")
                ll_codigo=dw_graf_aux.getitemnumber(ll_row,"sgd_valor_codigo")

                if ll_cantidad > 0 and ll_codigo <> 7 and ll_codigo <> 8 then
                        ll_mostrar = 1
                end if

                ll_nueva_row = dw_grafico.insertrow(0)
                dw_grafico.setitem(ll_nueva_row,"Descripcion",trim(ls_descripcion) + " (" + string(ll_cantidad) + ")")
                if ll_codigo = 7 or ll_codigo = 8 then
                        ll_cantidad = 0
                end if
                dw_grafico.setitem(ll_nueva_row,"Cantidad",ll_cantidad)
                dw_grafico.accepttext()
                ll_row++

LOOP UNTIL ll_filamax < ll_row

if ll_mostrar = 1 then
        dw_grafico.visible=true
        dw_grafico.bringtotop=true
        st_7.visible = true
else
        gnv_msg.f_mensaje("AD37","","",OK!)
		  md_lista_descargos.m_editar.m_buscar.enabled = true
//      messagebox("Informacion","Los unicos descargos existentes son en estado finalizado y/o no activado")
end if

end subroutine

public function string fw_busca_int_padre (long nro_descargo);long ll_cod_instalacion, ll_cod_inst_padre, ll_fila = 1, ll_nro_desc_afec, ll_cod_inst_origen
datetime ldt_f_inicio, ldt_f_fin
string ls_basura, ls_nom_instalacion

 DECLARE cu_interrupciones CURSOR FOR  
  SELECT "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION",   
         "SGD_INTERRUPCION_DESCARGO"."F_INICIO",   
         "SGD_INTERRUPCION_DESCARGO"."F_FIN"  
    FROM "SGD_INTERRUPCION_DESCARGO"  
   WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :nro_descargo   ;

open cu_interrupciones;

fetch cu_interrupciones into :ll_cod_instalacion, :ldt_f_inicio, :ldt_f_fin;

do while sqlca.sqlcode = 0

        //Se busca en las interrupciones superiores y actual si existe alguna instalacion que tenga
        dw_busca_padre.settransObject(sqlca)
        dw_busca_padre.retrieve(ll_cod_instalacion)
        ll_fila = 1
        ll_cod_inst_padre = dw_busca_padre.getitemnumber(ll_fila,"nro_instalacion")
        do while ll_fila > 0
                                        
                        // Obtengo los padres de las instalaciones hasta que llegue al primero
                        // O encuentre algun descargo que tenga el mismo rango de fechas
                
  		// GNU 24-06-2005 He cambiado el WHERE para que permita saber si hay fechas dentro del rango,
		// est$$HEX2$$e1002000$$ENDHEX$$en un rango m$$HEX1$$e100$$ENDHEX$$s grande o est$$HEX2$$e1002000$$ENDHEX$$en parte de otro intervalo de fechas
  
  		SELECT "SGD_DESCARGOS"."NRO_DESCARGO", "SGD_DESCARGOS"."ID_SOLICITANTE", "SGD_DESCARGOS"."COD_INST_ORIGEN"
                         INTO :ll_nro_desc_afec, :ls_basura, :ll_cod_inst_origen
                         FROM "SGD_DESCARGOS",   
                                        "SGD_INTERRUPCION_DESCARGO"  
                        WHERE ( "SGD_DESCARGOS"."NRO_DESCARGO" = "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" ) and  
                                        ( ( "SGD_DESCARGOS"."NRO_DESCARGO" <> :nro_descargo ) AND  
                                        ( "SGD_DESCARGOS"."ESTADO" = 3 ) AND  
                                        ((( "SGD_INTERRUPCION_DESCARGO"."F_INICIO" <= :ldt_f_inicio ) AND  
                                        ( "SGD_INTERRUPCION_DESCARGO"."F_FIN" >= :ldt_f_fin )) OR 
					     (( "SGD_INTERRUPCION_DESCARGO"."F_INICIO" >= :ldt_f_inicio ) AND  
                                        ( "SGD_INTERRUPCION_DESCARGO"."F_FIN" <= :ldt_f_fin )) OR
			                   (( "SGD_INTERRUPCION_DESCARGO"."F_INICIO" <= :ldt_f_inicio ) AND  
                                        ( "SGD_INTERRUPCION_DESCARGO"."F_FIN" <= :ldt_f_fin) AND
					     ( "SGD_INTERRUPCION_DESCARGO"."F_FIN" >= :ldt_f_inicio)) OR 
  			                   (( "SGD_INTERRUPCION_DESCARGO"."F_INICIO" >= :ldt_f_inicio ) AND  
                                        ( "SGD_INTERRUPCION_DESCARGO"."F_FIN" >= :ldt_f_fin) AND
					     ( "SGD_INTERRUPCION_DESCARGO"."F_INICIO" <= :ldt_f_fin))) AND  
                                        ( "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" = :ll_cod_inst_padre ) )   ;
                        
                        if sqlca.sqlcode = 0 then
                                string respuesta
                                select nom_instalacion into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_cod_inst_origen and
										  			(SGD_INSTALACION.BDI_JOB = 0 );// DSA 10/01/2000			
                                respuesta = "El descargo n$$HEX1$$fa00$$ENDHEX$$mero " + string (ll_nro_desc_afec) + " de la instalaci$$HEX1$$f300$$ENDHEX$$n " + ls_nom_instalacion +" solicitado por " + string (ls_basura) + " comprende los rangos de fecha para el descargo actual"
                                return respuesta
                        end if
			   
			   // GNU 34-06-2005				
//                        if ll_nro_desc_afec <> nro_descargo then
//				    string respuesta_2
//                                select nom_instalacion into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_cod_inst_origen and
//										  			(SGD_INSTALACION.BDI_JOB = 0 );// DSA 10/01/2000			
//                                respuesta_2 = "El descargo n$$HEX1$$fa00$$ENDHEX$$mero " + string (ll_nro_desc_afec) + " de la instalaci$$HEX1$$f300$$ENDHEX$$n " + ls_nom_instalacion +" solicitado por " + string (ls_basura) + " comprende los rangos de fecha para el descargo actual"
//                                return respuesta_2
//                        end if
			   // FIN GNU
        
                        ll_fila++
                        
                        if ll_fila > dw_busca_padre.rowcount() then
                                exit
                        end if
                        ll_cod_inst_padre = dw_busca_padre.getitemnumber(ll_fila,"nro_instalacion")
                loop

                fetch cu_interrupciones into :ll_cod_instalacion, :ldt_f_inicio, :ldt_f_fin;
loop
close cu_interrupciones;
return ""
end function

public subroutine fw_generar_incidencia ();datetime ld_fecha_actual, ld_fecha_causa, ld_inicio_interrupcion,ld_f_actual_inc
boolean lb_hubo_error=false, lb_media_tension = false
int li_tip_tension, li_contador, li_est_actual, li_tipo_inst, li_cod_nivel, li_cod_nivel_padre, li_tipo_inst_padre
Decimal ll_pot_instalada, ll_pot_contratada
long ll_kwh, ll_cant_cli, ll_nro_instalacion_padre, ll_nro_trabajo, LL_ULTIMA_INC,ll_nro_descargo,ll_nro_instalacion
int li_nro_centro,  li_nro_cmd, li_nro_puesto,li_permito,li_Act_grafico
long ll_alcance,ll_array[]// DSA 27/04/2000	
int li_respuesta, li_estado_red
string ls_mensaje, ls_desc, ls_usuario_inc, ls_programa_inc
boolean lb_es_de_operacion,lb_es_ct
	
SELECT COD_INCIDENCIA.NEXTVAL
INTO :LL_ULTIMA_INC  
FROM DUAL ;

if sqlca.sqlcode<>0 then 
	lb_hubo_error=true
end if     

	  // establezco la ultima inciedencia
		  
  //Recupero la tension de la instalacion
SELECT "SGD_INSTALACION"."TENSION" , NRO_CENTRO, NRO_CMD,NRO_MESA, TIPO_INSTALACION
INTO :li_tip_tension , :li_nro_centro, :li_nro_cmd, :li_nro_puesto,:li_tipo_inst
FROM "SGD_INSTALACION"  
WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :il_instalacion_afectada  AND 
			"SGD_INSTALACION"."BDI_JOB" = 0 ;// DSA 10/01/2000			

	  if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
				 lb_hubo_error=true
	  end if

IF gb_operaciones = true and gb_operaciones_inst = true then	  
	// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	
	ll_array[2] = il_instalacion_afectada
	li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],li_tipo_inst)
END IF

if li_tip_tension = 2 then
	lb_media_tension = true
else
	lb_media_tension = false
end if
lb_es_ct = fw_instalacion_ct(il_instalacion_afectada)
if gb_operaciones and li_tip_tension <=gi_tension_nivel_min &
	AND NOT lb_es_ct then // LO TRATA OPERACIONES
	if gb_operaciones_inst = false then // LO TRATA OPERACIONES
		
		lb_es_de_operacion = true
	else
		IF li_permito = 0 or li_permito = -1 then // li_permito = 1 significa que la instalacion y todos sus hijos estan digitalizados
			lb_es_de_operacion = false
		ELSE
			lb_es_de_operacion = true
		END IF;
	end if
else
	lb_es_de_operacion = false
end if

IF lb_es_de_operacion = false THEN 
	li_estado_red = -10
ELSE
	li_estado_red = 0
END IF

li_est_actual = 1

// Genero la incidencia
ld_fecha_actual=fgnu_fecha_actual()
setnull(ld_fecha_causa)

   //______DSA INI 27/04/2000			
if ib_sin_interrupcion then
	ll_alcance = fgci_incidencia_sin_interrupcion
else
	ll_alcance = fgci_incidencia_con_interrupcion
end if
  //______DSA FIN 27/04/2000	
  
ls_desc = "Incidencia dada de alta desde el Descargo " + string(il_nro_descargo) 

// GNU 18-7-2006. Incidencia pruebas SAT
if fg_verifica_parametro ("Activacion descargo anterior cumplir fecha") and &
	idt_f_inicio_descargo > fgnu_fecha_actual() then
	 INSERT INTO "SGD_INCIDENCIA"  
	( "NRO_INCIDENCIA", "USUARIO", "F_ACTUAL", "H_ACTUAL", "PROGRAMA", 
						  "PRIMER_AVISO", "DESC_INCIDENCIA", "EST_ACTUAL", "F_DETECCION", "H_DETECCION", 
						  "F_EST_RES", "H_EST_RES", "TIP_TENSION", "TIP_INCIDENCIA", "COD_CAUSA", 
						  "F_ALTA", "H_ALTA", "NRO_CENTRO", "NRO_CMD", "NRO_MESA",
						  "NRO_INST_AFECTADA", "NRO_INST_ORIGEN", "POT_AFECTADA", "POT_CONTRATADA", "CCLI_AFEC", 
//                        "MAT_AVERIADO", "NRO_BRIGADA", "IND_SUMINISTRO", "OBSERVACION", // DSA 27/04/2000	
						  "MAT_AVERIADO", "NRO_BRIGADA", "OBSERVACION", 								  
						  "OT", "COD_EST_CLIMA", "ESTADO_MANTENIMIENTO", "CENTRO_ALTA", "CMD_ALTA", 
						  "PUESTO_ALTA", "CANT_AVISOS", "CAN_CLI", "FAM_MANT_AVER", 
						  "FAM_CAUSA", "TIEMPO_MANT", "TIEMPO_OPER", "DURACION_SR",  
						  "FEC_RESOLUCION", "FEC_CAUSA", "DIR_AVISO", 
						  "FECHA_BATCH", "ESTADO_BATCH", "DURACION_RS", "DURACION_ER", 
						  "DER_MANT_EN_CORTE", "DURACION_ENV_BRIGADA", 
						  "DURACION_MANT",  "DURACION_MANT_CORTE", "COD_HOR",  
						  "DURACION_EB_ER", "DURACION_ER_SR", "EB6203", 
						  "EB4001", "EB4002", "EB4003", "EB4004", "EB4007", 
						  "EB4007_EST", "KWH_ESTIMADO", "IND_ALUM_PUB", 
				"ALCANCE", "IND_OBLIGADA","ESTADO_RED" )  // DSA 27/04/2000	
VALUES ( :LL_ULTIMA_INC, :gs_usuario, :ld_fecha_actual, :ld_fecha_actual, 'w_7001', 
	  null, :ls_desc, :li_est_actual, :ld_fecha_actual, :ld_fecha_actual,    
	 :idt_f_fin_descargo, :idt_f_fin_descargo, :li_tip_tension, :fgci_incidencia_programada, :ii_causa,   
	  :ld_fecha_actual, :ld_fecha_actual, :li_nro_centro, :li_nro_cmd, :li_nro_puesto,   
	  :il_instalacion_afectada, null, null, null, null,   
//           null, :gu_comunic1.is_comunic.longval4, 1, :is_observaciones,   // DSA 27/04/2000	
	  null, :gu_comunic1.is_comunic.longval4, :is_observaciones,   
	  :gu_comunic1.is_comunic.longval2, 0, null, :li_nro_centro, :li_nro_cmd,   
	  :li_nro_puesto, 0, 0, null,   
	  :ii_fam_causa, null, null, null,    
	  null, :id_causa, null,   
	  null, 0, null, null,
						  null, null, 
						  null, null, 2,
						  0, 0, 0,
						  0, 0, 0, 0, 0,
						  0, 0, 0, 
						  :ll_alcance, :ii_ind_obligada,:li_estado_red)  ;// DSA 27/04/2000	
else						  
  INSERT INTO "SGD_INCIDENCIA"  
	( "NRO_INCIDENCIA", "USUARIO", "F_ACTUAL", "H_ACTUAL", "PROGRAMA", 
						  "PRIMER_AVISO", "DESC_INCIDENCIA", "EST_ACTUAL", "F_DETECCION", "H_DETECCION", 
						  "F_EST_RES", "H_EST_RES", "TIP_TENSION", "TIP_INCIDENCIA", "COD_CAUSA", 
						  "F_ALTA", "H_ALTA", "NRO_CENTRO", "NRO_CMD", "NRO_MESA",
						  "NRO_INST_AFECTADA", "NRO_INST_ORIGEN", "POT_AFECTADA", "POT_CONTRATADA", "CCLI_AFEC", 
//                        "MAT_AVERIADO", "NRO_BRIGADA", "IND_SUMINISTRO", "OBSERVACION", // DSA 27/04/2000	
						  "MAT_AVERIADO", "NRO_BRIGADA", "OBSERVACION", 								  
						  "OT", "COD_EST_CLIMA", "ESTADO_MANTENIMIENTO", "CENTRO_ALTA", "CMD_ALTA", 
						  "PUESTO_ALTA", "CANT_AVISOS", "CAN_CLI", "FAM_MANT_AVER", 
						  "FAM_CAUSA", "TIEMPO_MANT", "TIEMPO_OPER", "DURACION_SR",  
						  "FEC_RESOLUCION", "FEC_CAUSA", "DIR_AVISO", 
						  "FECHA_BATCH", "ESTADO_BATCH", "DURACION_RS", "DURACION_ER", 
						  "DER_MANT_EN_CORTE", "DURACION_ENV_BRIGADA", 
						  "DURACION_MANT",  "DURACION_MANT_CORTE", "COD_HOR",  
						  "DURACION_EB_ER", "DURACION_ER_SR", "EB6203", 
						  "EB4001", "EB4002", "EB4003", "EB4004", "EB4007", 
						  "EB4007_EST", "KWH_ESTIMADO", "IND_ALUM_PUB", 
				"ALCANCE", "IND_OBLIGADA","ESTADO_RED" )  // DSA 27/04/2000	
VALUES ( :LL_ULTIMA_INC, :gs_usuario, :ld_fecha_actual, :ld_fecha_actual, 'w_7001', 
	  null, :ls_desc, :li_est_actual, :idt_f_inicio_descargo, :idt_f_inicio_descargo,    
	 :idt_f_fin_descargo, :idt_f_fin_descargo, :li_tip_tension, :fgci_incidencia_programada, :ii_causa,   
	  :ld_fecha_actual, :ld_fecha_actual, :li_nro_centro, :li_nro_cmd, :li_nro_puesto,   
	  :il_instalacion_afectada, null, null, null, null,   
//           null, :gu_comunic1.is_comunic.longval4, 1, :is_observaciones,   // DSA 27/04/2000	
	  null, :gu_comunic1.is_comunic.longval4, :is_observaciones,   
	  :gu_comunic1.is_comunic.longval2, 0, null, :li_nro_centro, :li_nro_cmd,   
	  :li_nro_puesto, 0, 0, null,   
	  :ii_fam_causa, null, null, null,    
	  null, :id_causa, null,   
	  null, 0, null, null,
						  null, null, 
						  null, null, 2,
						  0, 0, 0,
						  0, 0, 0, 0, 0,
						  0, 0, 0, 
						  :ll_alcance, :ii_ind_obligada,:li_estado_red)  ;// DSA 27/04/2000	
					end if;						  
// FIN GNU						  

        if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
                lb_hubo_error=true
        end if
                          
// Genero los estados de la incidencia que se van a ver en seguimiento
        for li_contador=1 to li_est_actual
            // GNU 18-7-2006. Incidencia pruebas SAT
				if fg_verifica_parametro ("Activacion descargo anterior cumplir fecha") and &
					idt_f_inicio_descargo > fgnu_fecha_actual() then
					                        INSERT INTO "SGD_ESTADO_OPER"  
                                        ( "COD_ESTADO", "USUARIO", "F_ACTUAL", "H_ACTUAL", "PROGRAMA",   
                                          "OBSERVACION", "F_ALTA", "H_ALTA", "NRO_INCIDENCIA", "IND_ENV_MANT" )  
                        VALUES ( :li_contador, :gs_usuario, :ld_fecha_actual, :ld_fecha_actual, 'w_7001',   
                                          'Generada Autom$$HEX1$$e100$$ENDHEX$$ticamente por Descargo', :ld_fecha_actual, :ld_fecha_actual, :LL_ULTIMA_INC, 0 )  ;
				ELSE																						
                        INSERT INTO "SGD_ESTADO_OPER"  
                                        ( "COD_ESTADO", "USUARIO", "F_ACTUAL", "H_ACTUAL", "PROGRAMA",   
                                          "OBSERVACION", "F_ALTA", "H_ALTA", "NRO_INCIDENCIA", "IND_ENV_MANT" )  
                        VALUES ( :li_contador, :gs_usuario, :ld_fecha_actual, :ld_fecha_actual, 'w_7001',   
                                          'Generada Autom$$HEX1$$e100$$ENDHEX$$ticamente por Descargo', :idt_f_inicio_descargo, :idt_f_inicio_descargo, :LL_ULTIMA_INC, 0 )  ;
				END IF														
                        
                        if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
                                lb_hubo_error=true
                        end if                    
                        
                        if li_contador=2 then
                                idt_f_inicio_descargo = gu_comunic1.is_comunic.datval1
                        end if
                        
                        if li_contador=3 then
                                idt_f_inicio_descargo = fgnu_fecha_actual()
                        end if
        
        next

// Actualizo las otras_instalaciones_afectadas...

 DECLARE lc_otras_inst CURSOR FOR  
  SELECT "SGD_DESCARGOS_INST_AFEC"."USUARIO",   
         "SGD_DESCARGOS_INST_AFEC"."PROGRAMA",   
         "SGD_DESCARGOS_INST_AFEC"."F_ACTUAL",   
         "SGD_DESCARGOS_INST_AFEC"."NRO_DESCARGO",   
         "SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION"  
    FROM "SGD_DESCARGOS_INST_AFEC"  
   WHERE "SGD_DESCARGOS_INST_AFEC"."NRO_DESCARGO" = :il_nro_descargo   ;


OPEN lc_otras_inst;

FETCH lc_otras_inst INTO :ls_usuario_inc, :ls_programa_inc, :ld_f_actual_inc, :ll_nro_descargo, :ll_nro_instalacion;

Do while sqlca.sqlcode = 0 

	  INSERT INTO "SGD_INCIDENCIAS_INST_AFEC"  
         ( "USUARIO",   
           "PROGRAMA",   
           "F_ACTUAL",   
           "NRO_INCIDENCIA",   
           "NRO_INSTALACION" )  
  VALUES ( :ls_usuario_inc,   
           :ls_programa_inc,   
           :ld_f_actual_inc,   
           :LL_ULTIMA_INC,   
           :ll_nro_instalacion )  ;

	        if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
                lb_hubo_error=true
        	   end if
	FETCH lc_otras_inst INTO :ls_usuario_inc, :ls_programa_inc, :ld_f_actual_inc, :ll_nro_descargo, :ll_nro_instalacion;

Loop
//
// GNU 1-2-2006. Incidencia 0/403296
//        UPDATE "SGD_DESCARGOS"  
//        SET "F_ACTIVADO" = :ld_fecha_actual,   
//                "ID_ACTIVADO" = 1,   
//                "NRO_INCIDENCIA" = :LL_ULTIMA_INC,
//                "ESTADO" = :fgci_descargo_activado
//        WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo   ;

        UPDATE "SGD_DESCARGOS"  
        SET "F_ACTIVADO" = :ld_fecha_actual,   
                "ID_ACTIVADO" = 1,   
                "NRO_INCIDENCIA" = :LL_ULTIMA_INC,
                "ESTADO" = :fgci_descargo_activado,
		  "USUARIO"= :gs_usuario
        WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo   ;
// FIN GNU        
        if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
                lb_hubo_error=true
        end if
      
		SELECT IND_ACT_GRAFICA 
		INTO :li_Act_grafico
		FROM SGD_DESCARGOS
		WHERE NRO_DESCARGO = :il_nro_descargo   ;
		
		IF li_Act_grafico = 1 and sqlca.sqlcode = 0 THEN
		
		 UPDATE "SGD_TRABAJOS_BDI"  
		SET "ESTADO_TRABAJO" = :fgci_trabajo_pendiente_pta_servicio
		WHERE "SGD_TRABAJOS_BDI"."NRO_DESCARGO" = :il_nro_descargo   ;
		
			if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar el trabajo de BDI. " + sqlca.sqlerrtext,information!,ok!)
				lb_hubo_error=true
			End if
			  
		END IF
                        if lb_hubo_error=true then
                                fgnu_resetear_s_comunicaciones(gu_comunic1)
                                gnv_msg.f_mensaje("AD02","","",Ok!)
                                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El descargo no ha sido activado, se detectaron problemas cuando se generaba la incidencia")
                                gnu_u_transaction.uf_rollback();
                        else
                                fgnu_resetear_s_comunicaciones(gu_comunic1)
//                                gnv_msg.f_mensaje("IA05","","",Ok!)
                               gnu_u_transaction.uf_commit();
										 	if lb_es_de_operacion then // AVISAMOS A OPERACION
												gu_rf_servidor_operacion.of_avisar_alta_incidencia(LL_ULTIMA_INC,il_instalacion_afectada,idt_f_inicio_descargo,0,ls_mensaje) 
											end if 
    									  li_respuesta = Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El descargo ha sido activado y ha sido generada la incidencia " + string (LL_ULTIMA_INC) +" $$HEX1$$bf00$$ENDHEX$$Desea gestionarla en este momento?", Question!, YesNo!)
											if li_respuesta = 1 then // VERIFICAMOS SI ES DE OPERACION
												 
												 if lb_es_de_operacion then // LO TRATA OPERACIONES
												 	//AHM (19/02/2010) Certificacion windows XP
													//if isvalid(gu_operaciones) then gu_operaciones.of_maniobrar_incidencia(LL_ULTIMA_INC)
													if isvalid(gu_operacionSgi) then gu_operacionSGI.of_maniobrar_incidencia(LL_ULTIMA_INC)

												else		
													fw_abre_ventana(LL_ULTIMA_INC,li_tip_tension) // LO TRATA SGI
												end if
											end if
											// gu_operaciones.of_maniobrar_incidencia(LL_ULTIMA_INC)
                        end if



end subroutine

public function long fw_comprobar_datos (long pl_fila);int li_estado, li_estado_bd
long ll_nro_descargo, ll_return

li_estado = dw_lista_descargos.GetItemNumber(pl_fila,'sgd_descargos_estado')
ll_nro_descargo = dw_lista_descargos.GetItemNumber(pl_fila,'nro_descargo')

SELECT ESTADO
INTO :li_estado_bd
FROM SGD_DESCARGOS
WHERE NRO_DESCARGO = :ll_nro_descargo;

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

public subroutine fw_enviar_mail ();//15/07/99
//funcion que envia mail cuando la accion sobre el descargo es Aprobacion, Modficacion 
//o Rechazo

string ls_email
        
        
        //Selecciona el e-mail del cliente
        SELECT EMAIL 
        INTO   :ls_email
        FROM   GI_USUARIO_SGI U, SGD_DESCARGOS D
        WHERE  U.USUARIO = D.ID_SOLICITANTE AND
                 D.NRO_DESCARGO = :gu_comunic.is_comunic.longval2;
        
        IF SQLCA.SQLCODE = 0 THEN
                //Verifica que no tenga null
                IF ls_email <> "" OR Not IsNull(ls_email) THEN
                        //Enviar mail
                        
                        //Funcion que arma el texto de acuerdo a la accion_llamada y lo envia
                       fw_armar_mail(ls_email)
					 ELSE
						 MessageBox("Envio Mail", 'No se pudo enviar el Mail')						
                END IF
		  ELSE
		   	MessageBox("Envio Mail", 'No se pudo enviar el Mail')					
        END IF

end subroutine

public subroutine fw_armar_mail (string ps_email);
datetime ldt_f_solicitado
string  ls_cadena, ls_descripcion, ls_nom_instalacion, ls_observacion
int li_codigo, li_fila
datetime ldt_ini_descargo, ldt_fin_Descargo
string ls_html, ls_txt
ls_cadena = ''

//Funcion que arma el texto del mail 
mailSession mSes 
mailReturnCode mRet  
mailMessage mMsg    

mSes = create mailSession
mRet = mSes.mailLogon(mailNewSession!)


IF mRet <> mailReturnSuccess! THEN  
        MessageBox("Mail", 'Error al conectarse.')  
        RETURN  
END IF    

//Carga el asunto del mail
mMsg.Subject = 'Gesti$$HEX1$$f300$$ENDHEX$$n Descargo N$$HEX3$$ba0020002000$$ENDHEX$$' + string(gu_comunic.is_comunic.longval2)

//Carga el email a enviar
mMsg.Recipient[1].name = ps_email

//Carga la fecha de la solicitud 
SELECT "SGD_DESCARGOS"."F_SOLICITADO"
INTO :ldt_f_solicitado
FROM "SGD_DESCARGOS"
WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :gu_comunic.is_comunic.longval2;

li_fila = dw_lista_descargos.find (" nro_descargo = " + string(gu_comunic.is_comunic.longval2), 1, dw_lista_descargos.rowcount())
ls_nom_instalacion = dw_lista_descargos.GetItemString (li_fila,'sgd_instalacion_nom_instalacion')
ldt_ini_descargo = dw_lista_descargos.GetItemDateTime (li_fila,'sgd_descargos_f_ini_solicitado')
ldt_fin_descargo = dw_lista_descargos.GetItemDateTime (li_fila,'sgd_descargos_f_fin_solicitado')
ls_observacion = dw_lista_descargos.GetItemString (li_fila,'cobs_solicitado')

is_txt = 'descargo_' + string(gu_comunic.is_comunic.longval2) + '.txt'
is_htm = 'descargo_' + string(gu_comunic.is_comunic.longval2) + '.htm'
is_ruta_txt = 'c:\' + is_txt
is_ruta_htm = 'c:\' + is_htm


fw_fichero_htm(gu_comunic.is_comunic.longval2, ls_nom_instalacion, ldt_f_solicitado,&
				   ldt_ini_descargo, ldt_fin_descargo, ls_observacion)

fw_fichero_txt(gu_comunic.is_comunic.longval2, ls_nom_instalacion, ldt_f_solicitado,&
				   ldt_ini_descargo, ldt_fin_descargo, ls_observacion)

mMsg.NoteText = ' '

//Fichero HTML
//mMsg.AttachmentFile[1].filetype	= mailAttach! 
mMsg.AttachmentFile[1].filename	= is_htm
mMsg.AttachmentFile[1].PathName  = is_ruta_htm

//Fichero TXT
mMsg.AttachmentFile[2].filename	= is_txt
mMsg.AttachmentFile[2].PathName  = is_ruta_txt

mRet = mSes.mailSend(mMsg)    

IF mRet <> mailReturnSuccess! THEN  
		messagebox("mret",string(mret))
   	MessageBox("Envio Mail", 'No se pudo enviar el Mail')  
   	RETURN
ELSE 
		MessageBox("Envio Mail", "El Mail ha sido enviado")
END IF  

FileDelete (is_ruta_htm)
FileDelete (is_ruta_txt)

mSes.mailLogoff()
DESTROY mSes
end subroutine

public subroutine fw_fichero_txt (integer pi_nro_descargo, string ps_nombre_inst, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo, string ps_observacion);integer li_FileNum, li_codigo
string ls_descripcion


DECLARE lcur_trabajos CURSOR FOR
	(SELECT CODIGO, DESCRIPCION
	 FROM SGD_TRABAJOS_BDI
	 WHERE NRO_DESCARGO = :pi_nro_descargo AND
	 ESTADO_TRABAJO = :fgci_trabajo_rechazado_bdi);

li_FileNum = FileOpen(is_ruta_txt,lineMode!, Write!, LockWrite!,Append!)

FileWrite(li_fileNum,'           '+ 'EL DESCARGO N$$HEX2$$ba002000$$ENDHEX$$' + string(pi_nro_descargo) + ' HA SIDO RECHAZADO BDI.')
FileWrite(li_fileNum,'Instalacion Afectada     : ' + ps_nombre_inst)
FileWrite(li_fileNum,'Fecha Solicitud          : ' + string(f_solicitado))
FileWrite(li_fileNum,'Fecha Inicio de Descargo : ' + string(f_ini_descargo))
FileWrite(li_fileNum,'Fecha Fin de Descargo    : ' + string(f_fin_descargo))
FileWrite(li_fileNum,'Observacion              : ' + ps_observacion)
FileWrite(li_fileNum,'           ' +'TRABAJOS RECHAZADOS BDI')
FileWrite(li_fileNum,'           ' +'-----------------------')
FileWrite(li_fileNum,'           ' +'  CODIGO  DESCRIPCION ')

OPEN lcur_trabajos;
FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
DO
	FileWrite(li_fileNum,'              ' + string(li_codigo) + '   ' + ls_Descripcion)
	FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
LOOP WHILE SQLCA.SQLCODE = 0 
CLOSE lcur_trabajos;

FileWrite(li_fileNum,'fecha : ' + string (datetime(today(),now()))		)	
FileClose(li_FileNum)
end subroutine

public subroutine fw_fichero_htm (integer pi_nro_descargo, string ps_nombre_inst, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo, string ps_observacion);integer li_FileNum, li_codigo
string ls_htm, ls_filas, ls_descripcion

DECLARE lcur_trabajos CURSOR FOR
	(SELECT CODIGO, DESCRIPCION
	 FROM SGD_TRABAJOS_BDI
	 WHERE NRO_DESCARGO = :pi_nro_descargo AND
	 ESTADO_TRABAJO = :fgci_trabajo_rechazado_bdi);
	 
	 
li_FileNum = FileOpen(is_ruta_htm,StreamMode!, Write!, LockWrite!, Replace!)	
ls_filas = ''
OPEN lcur_trabajos;
FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
DO
	ls_filas = ls_filas + '<TR><TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#ffffff" HEIGHT=15>' + &
    '<FONT FACE="Courier New" SIZE=2><P ALIGN="CENTER">' + string (li_codigo) + '</FONT></TD>' + &
    '<TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#ffffff" HEIGHT=15>' + &
    '<FONT FACE="Courier New" SIZE=2><P>' + ls_descripcion + '</FONT></TD>' + &
	 '</TR>'
	 FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
LOOP WHILE SQLCA.SQLCODE = 0 
CLOSE lcur_trabajos;

ls_htm = '<HTML>' + &
'<HEAD>' + &
'<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">' + &
'<TITLE>descargo_826</TITLE>' + &
'</HEAD>' + &
'<BODY LINK="#0000ff" VLINK="#800080" BGCOLOR="#ffffff">' + &
'<P>      &nbsp;<<B><FONT FACE="Arial" SIZE=4>EL DESCARGO N$$HEX2$$ba002000$$ENDHEX$$</FONT><FONT FACE="Arial" SIZE=4 COLOR="#800000">' + string(pi_nro_descargo) + ' </FONT><FONT FACE="Arial" SIZE=4>HA SIDO RECHAZADO BDI.</P><DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'</FONT><FONT FACE="Courier New"><P>&nbsp;</P></DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'<P>   Instalaci&oacute;n Afectada :</B>' + string(ps_nombre_inst) + ' </P>' + &
'<B><P>   Fecha Solicitud :</B>' + string (f_solicitado) + ' </P>' + &
'<B><P>   Fecha Inicio de Descargo :</B> ' + string (f_ini_descargo) + '</P>' + &
'<B><P>   Fecha Fin de Descargo :</B> ' + string (f_fin_descargo) + '</P>' + &
'<B><P>   Observaci&oacute;n :</B> ' + ps_observacion + '</P>' + &
'</FONT><B><I><FONT FACE="Arial"><P>&nbsp;</P>' + &
'</DIR>' + &
'</DIR>' + &
'</B></I></FONT>' + &
'<TABLE BORDER CELLSPACING=1 CELLPADDING=4 WIDTH=302 ALIGN="CENTER" >' +&
'<TR><TD VALIGN="TOP" COLSPAN=2 BGCOLOR="#000080">' +&
'<B><I><FONT FACE="Arial" COLOR="#ffffff"><P ALIGN="CENTER">TRABAJOS RECHAZADOS BDI</B></I></FONT></TD>' +&
'</TR>' +&
'<TR><TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#000080" HEIGHT=15>' +&
'<B><I><FONT FACE="Arial" COLOR="#ffffff"><P ALIGN="CENTER">CODIGO</B></I></FONT></TD>' +&
'<TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#000080" HEIGHT=15>' +&
'<B><I><FONT FACE="Arial" COLOR="#ffffff"><P ALIGN="CENTER">DESCRIPCION</B></I></FONT></TD>' +&
'</TR>' + &
ls_filas + &
'</TABLE>' + &
'<B><I><FONT FACE="Arial"><P>&nbsp;</P><DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'</B></I></FONT><FONT FACE="Courier New" SIZE=2><P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<B><P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P></DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'<P>Fecha :</B> ' + string (datetime(today(),now())) + '</P>' + &
'</FONT><FONT SIZE=2><P>&nbsp;</P></FONT></BODY>' + &
'</HTML>'

FileWrite(li_FileNum,ls_htm)
FileClose(li_FileNum)
end subroutine

public function boolean fw_manipula_operacion (long pl_nro_descargo, long pl_nro_instalacion);int li_hay, li_tipo_instalacion, li_tension_Descargo
long li_instalacion_afectada
boolean lb_retorno = false

//GSE 05/07/01
//Obtengo el tipo de instalacion del descargo 
//si es un CT compruebo si las interrupciones se marcaron sobre
//la instalacion afectada o por debajo
SELECT TIPO_INSTALACION
INTO :li_tipo_instalacion
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :pl_nro_instalacion;

IF li_tipo_instalacion = fgci_tipo_ct THEN
	//Compruebo que se han marcado interrupciones para ese descargo
	SELECT COUNT(*) 
	INTO :li_hay
	FROM SGD_INTERRUPCION_DESCARGO
	WHERE NRO_DESCARGO = :pl_nro_descargo;

	//Si no se marcaron interrupciones gestiona operacion
	IF li_hay = 0 THEN
		//Gestiona Operacion
		lb_retorno = true
	ELSE
	
		//Si se han marcado interrupciones compruebo si se marcaron en la instalacion
		//afectada o por debajo de ella
		SELECT COUNT(*)
		INTO :li_instalacion_afectada
		FROM SGD_INTERRUPCION_DESCARGO
		WHERE COD_INSTALACION = :pl_nro_instalacion;
		// Si se marcaron por debajo de ella li_instalacion_Afectada = 0
		IF li_instalacion_afectada = 0 THEN
			//Gestiona SGI
			lb_retorno = false
		ELSE
			//Gestiona Operacion
			lb_retorno = true
		END IF
	END IF
ELSE
	//Si no es un CT comprobamos el nivel de tension
	SELECT TENSION
	INTO :li_tension_Descargo
	FROM SGD_INSTALACION
	WHERE NRO_INSTALACION = :pl_nro_instalacion;
	
	IF li_tension_Descargo = fgci_media_tension THEN
		if gb_operaciones and li_tension_descargo <=gi_tension_nivel_min THEN
			//Gestiona Operacion
			lb_retorno = true
		else
			//Gestiona SGI
			lb_retorno = false
		end if
	ELSEIF li_tension_Descargo = fgci_baja_tension THEN
		//Gestiona SGI
		lb_retorno = false
	END IF 

END IF

Return lb_retorno
end function

public function boolean fw_instalacion_ct (long pl_nro_instalacion);int li_tipo_instalacion
boolean lb_retorno = false

//GSE 05/07/01
//Obtengo el tipo de instalacion del descargo 
//si es un CT compruebo retorno true sino retorno false

SELECT TIPO_INSTALACION
INTO :li_tipo_instalacion
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :pl_nro_instalacion;

IF li_tipo_instalacion = fgci_tipo_ct THEN
	lb_retorno = true
ELSE
	lb_retorno = false
END IF
	
Return lb_retorno
end function

public subroutine fw_abre_ventana (long pl_incidencia, integer pi_tension);
// ABRE LA VENTANA DE INCIDENCIAS TRAS ACTIVAR UN DESCARGO

int li_lock_status , li_tension , li_respuesta = 1

		gu_comunic.is_comunic.accion_llamada="Actualizacion"
		// como queremos actualizar intentamos bloquear la incidencia
		li_lock_status=gnu_u_transaction.uf_lock(w_1234_consulta_incidencias, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_incidencia), fgci_bloqueo_incidencia, pl_incidencia)
			
		
	IF li_lock_status <> 0  THEN
		//No hemos podido bloquear la incidencia, se abre la ventana en modo consulta
		li_respuesta = Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea abrir la Incidencia en modo consulta?", Question!, YesNo!)
		IF li_respuesta = 1 THEN
			gu_comunic.is_comunic.accion_llamada="Consulta"
		END IF
	END IF	
	IF li_respuesta = 1 THEN
		CHOOSE CASE gu_comunic.is_comunic.accion_llamada

			CASE "Consulta"
					//cuando entra con opcion seleccion simpre esta habilitada			
					SetPointer(HourGlass!)	
					gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
					gu_comunic.is_comunic.accion_llamada="Consulta"
					
					gu_comunic.is_comunic.longval3 = pl_incidencia
					gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)

	
			CASE 	"Actualizacion"
			
					SetPointer(HourGlass!)

					string ls_incid, ls_aux
					int indice, li_par
					boolean lb_sigo=true
				
					li_tension = pi_tension
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
						gnu_u_transaction.uf_rollback(w_1234_consulta_incidencias, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_incidencia), fgci_bloqueo_incidencia, pl_incidencia)
						return 
					end if

					gu_comunic.is_comunic.accion_llamada="Modificacion"
					gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
					gu_comunic.is_comunic.longval3 =  pl_incidencia		
				
						if gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)<1 then
						// SE HA ABIERTO ANTES LA VENTANA EN MODO CONSULTA
						// DESBLOQUEAMOS
						gnu_u_transaction.uf_rollback(w_1234_consulta_incidencias, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_incidencia), fgci_bloqueo_incidencia, pl_incidencia)
						end if

			END CHOOSE
		END IF

end subroutine

public function boolean fw_comprueba_interrupciones_previstas (long pl_nro_descargo);int li_cantidad =0 

  SELECT count(*)  
    INTO :li_cantidad  
    FROM "SGD_INTERRUPCION_DESCARGO"  
   WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :pl_nro_Descargo   ;

 if li_cantidad > 0 then 
		return true
else
	return false
end if 
end function

public subroutine fw_deshabilitar_columna_advert ();/*AHM 12/11/2008 (Incidencia 0/605465)*/

int		li_contador						//Variable de control del bucle que recorre las columnas a mover
int		li_numeroColumnas				//N$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
long		ll_columnaActual				//N$$HEX1$$fa00$$ENDHEX$$mero de la columna actual
long		ll_posX							//Posici$$HEX1$$f300$$ENDHEX$$n x del campo que estamos tratando
long		ll_posXA							//Posici$$HEX1$$f300$$ENDHEX$$n x del campo que vamos a deshabilitar
long		ll_tamanio						//Tama$$HEX1$$f100$$ENDHEX$$o del campo que queremos deshabilitar
string	ls_numeroColumnas				//N$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow en formato string
string	ls_nombre						//Nombre de la columna que estamos tratando
string	ls_campos[]						//Columnas


//Se hace invisible el nuevo campo
dw_lista_descargos.Modify("t_advertencia.visible = '0'")
dw_lista_descargos.Modify("sgd_descargos_ind_advertencia.visible = '0'")


//Obtenci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de columnas
ls_numeroColumnas = dw_lista_descargos.object.datawindow.column.count 
li_numeroColumnas = integer(ls_numeroColumnas) 


//Obtenci$$HEX1$$f300$$ENDHEX$$n de las caracter$$HEX1$$ed00$$ENDHEX$$sticas de la columna que vamos a ocultar
ll_tamanio = long(dw_lista_descargos.describe("t_advertencia.width")) + 16
ll_posXA = long(dw_lista_descargos.describe("t_advertencia.x"))

//Carga de los nombres de las cabeceras, campos computados, campos bitmap y botones en los arrays
dw_lista_descargos.of_obtener_campos("text(" , dw_lista_descargos.is_cabeceras_new,dw_lista_descargos.Object.DataWindow.Syntax)
dw_lista_descargos.of_obtener_campos("compute(", dw_lista_descargos.is_computados_new, dw_lista_descargos.Object.DataWindow.Syntax)
dw_lista_descargos.of_obtener_campos("bitmap(", dw_lista_descargos.is_bitmap_new, dw_lista_descargos.Object.DataWindow.Syntax)
dw_lista_descargos.of_obtener_campos("button(", dw_lista_descargos.is_boton_new, dw_lista_descargos.Object.DataWindow.Syntax)

//Desplazamiento de las columnas
FOR li_contador = 1 TO li_numeroColumnas
	
	ls_nombre = dw_lista_descargos.getColumnName()
	ls_nombre = "#" + string(li_contador)
	ll_posX = long(dw_lista_descargos.describe(ls_nombre + ".X"))	
	IF ll_posX > ll_posXA THEN
		dw_lista_descargos.modify(ls_nombre + ".x = " + string(ll_posX - ll_tamanio))	
	END IF
	
NEXT

//Desplazamiento de las cabeceras
FOR li_contador = 1 TO  upperbound(dw_lista_descargos.is_cabeceras_new)
	ls_nombre = dw_lista_descargos.is_cabeceras_new[li_contador]
	ll_posX = long(dw_lista_descargos.describe(ls_nombre + ".X"))
	IF ll_posX > ll_posXA THEN
		dw_lista_descargos.modify(ls_nombre + ".x = " + string(ll_posX - ll_tamanio))	
	END IF
NEXT

//Desplazamiento de los campos computados
FOR li_contador = 1 TO  upperbound(dw_lista_descargos.is_computados[])
	ls_nombre = dw_lista_descargos.is_computados[li_contador]
	ll_posX = long(dw_lista_descargos.describe(ls_nombre + ".X"))
	IF ll_posX > ll_posXA THEN
		dw_lista_descargos.modify(ls_nombre + ".x = " + string(ll_posX - ll_tamanio))	
	END IF
NEXT

//Desplazamiento de los bitmap
FOR li_contador = 1 TO  upperbound(dw_lista_descargos.is_bitmap[])
	ls_nombre = dw_lista_descargos.is_bitmap[li_contador]
	ll_posX = long(dw_lista_descargos.describe(ls_nombre + ".X"))
	IF ll_posX > ll_posXA THEN
		dw_lista_descargos.modify(ls_nombre + ".x = " + string(ll_posX - ll_tamanio))	
	END IF
NEXT

//Desplazamiento de los botones
FOR li_contador = 1 TO  upperbound(dw_lista_descargos.is_boton[])
	ls_nombre = dw_lista_descargos.is_boton[li_contador]
	ll_posX = long(dw_lista_descargos.describe(ls_nombre + ".X"))
	IF ll_posX > ll_posXA THEN
		dw_lista_descargos.modify(ls_nombre + ".x = " + string(ll_posX - ll_tamanio))	
	END IF
NEXT

/*Fin AHM*/

//RCA
//long ll_colposx, ll_colwidth, ll_ancho
//		
//		


//dw_lista_descargos.Modify("t_advertencia.visible = '0'")
//dw_lista_descargos.Modify("sgd_descargos_ind_advertencia.visible = '0'")



//
//ll_colposx = long(dw_lista_descargos.Describe("t_advertencia.x"))	
//dw_lista_descargos.Modify("sgd_descargos_nro_agrupacion_t.x ='"+string(ll_colposx)+"'")
//
//ll_colwidth = long(dw_lista_descargos.Describe("t_advertencia.width")) + 16
//ll_colposx = long(dw_lista_descargos.Describe("ind_act_grafica_t.x"))	
//dw_lista_descargos.Modify("ind_act_grafica_t.x ='"+string(ll_colposx - ll_colwidth)+"'")
//
//ll_colposx = long(dw_lista_descargos.Describe("c_ext_duracion_t.x"))
//dw_lista_descargos.Modify("c_ext_duracion_t.x ='"+string(ll_colposx - ll_colwidth)+"'")
//ll_colposx = long(dw_lista_descargos.Describe("c_ext_paxtc_t.x"))
//dw_lista_descargos.Modify("c_ext_paxtc_t.x ='"+string(ll_colposx - ll_colwidth)+"'")
//
//ll_colposx = long(dw_lista_descargos.Describe("c_ext_duracion.x"))
//dw_lista_descargos.Modify("c_ext_duracion.x ='"+string(ll_colposx - ll_colwidth)+"'")
//ll_colposx = long(dw_lista_descargos.Describe("c_ext_paxtc.x"))
//dw_lista_descargos.Modify("c_ext_paxtc.x ='"+string(ll_colposx - ll_colwidth)+"'")
//
//ll_colposx = long(dw_lista_descargos.Describe("key.x"))
//dw_lista_descargos.Modify("key.x ='"+string(ll_colposx - ll_colwidth)+"'")
//ll_colposx = long(dw_lista_descargos.Describe("pb_nocondado.x"))
//dw_lista_descargos.Modify("pb_nocondado.x ='"+string(ll_colposx - ll_colwidth)+"'")
//ll_colposx = long(dw_lista_descargos.Describe("nro_agrupado.x"))
//dw_lista_descargos.Modify("nro_agrupado.x ='"+string(ll_colposx - ll_colwidth)+"'")
//ll_colposx = long(dw_lista_descargos.Describe("sgd_descargos_ind_act_grafica.x"))
//dw_lista_descargos.Modify("sgd_descargos_ind_act_grafica.x ='"+string(ll_colposx - ll_colwidth)+"'")
//
//ll_ancho = dw_lista_descargos.Width 
//dw_lista_descargos.Width = ll_ancho - ll_colwidth
//
end subroutine

public function boolean fw_es_ocen ();Boolean lb_rtn
Long ll_descargo_ocen

lb_rtn =FALSE

SELECT COUNT(*)
INTO :ll_descargo_ocen 
FROM "SGD_DESCARGOS"
WHERE "SGD_DESCARGOS"."NRO_DESCARGO"= :il_nro_descargo AND
		"SGD_DESCARGOS"."NRO_OT_OCEN" IS NOT NULL;
	
IF ll_descargo_ocen > 0 THEN
	lb_rtn =TRUE
ELSE
	lb_rtn =FALSE
END IF 	

return lb_rtn
end function

event open;call super::open;int li_registros    //N$$HEX1$$fa00$$ENDHEX$$mero de registros de la tabla gi_sintaxis_usuario

l_grabo_inc=true
ib_si_valido=True

setpointer(hourglass!)
d_solicitud.object.deteccion_titulo.text = "Rango de Fechas  "
//gu_comunic.is_comunic.intval6 = 30
this.setredraw(false)
int li_cont
long ll_colcount, ll_colposx, ll_colwidth, ll_perfil, ll_ancho
// Variable de comunicaciones es gu_comunic.

// Parametros de Entrada
//              gu_comunic.is_comunic.intval1 = Centro , en 0 Centro del usuario
//              gu_comunic.is_comunic.intval2 = CMD, 0 cmd del usuario
//    gu_comunic.is_comunic.intval3 = puesto 0 puesto del usuario
//              gu_comunic.is_comunic.datval1 = Desde 0 fecha del dia
//    gu_comunic.is_comunic.datval2 = hasta 0 hora del dia
//              gu_comunic.is_comunic.intval4 = Estado 0 Todos los estado
//              gu_comunic.is_comunic.intval5 = Tipo 0 Todos los tipos
//      gu_comunic.is_comunic.intval6 = duracion 0 No se considera duracion
//      gu_comunic.is_comunic.intval7 = Tension 0 todas las alimentaciones
//              gu_comunic.is_comunic.intval8   = Estado de Mantenimiento
//    gu_comunic.is_comunic.intval10 = Suministro
//    gu_comunic.is_comunic.Accion_llamada = "Seleccion" , blanco consulta
//                                                                                                               = "Consulta"
//                                                                                                               = "Actualizacion"

// Devuelve valores en 
//      gu_comunic.is_comunic.longval1 // numero de incidencia seleccionada
//              gu_comunic.is_comunic.accion_retorno = "Seleccionada"
//                                                                                                                      "No Seleccionada"
//              gu_comunic.is_comunic.strval1  // descripcion de la incidencia
                                

//******************CREACION DE OBJETOS DE TRABAJO***********************
        lu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
        iu_resetea = create u_generico_comunicaciones  // Creo variable para resetear la variable de comunicaciones


//******************OBTENGO y VALIDO  PARAMETROS DE ENTRADA*************************

        lu_comunic.is_comunic = gu_comunic.is_comunic // Transfiero valores desde globales.
        lu_comunic.is_comunic.intval4=fgci_hasta_serv_repuesto
        

//******************PREPARACION DE PRESENTACION DE LA VENTANA************
triggerevent("ue_presentacion") // titulos ventana y crea dropdown
triggerevent("ue_inicializo_objetos")

//AHM (22/01/2009) 0/605465
SELECT count(*)
INTO	:li_registros
FROM	gi_sintaxis_usuario
WHERE	usuario = :gs_usuario AND datawindow = 'd_7001_lista_descargos';

// A$$HEX1$$f100$$ENDHEX$$adido por RCA (07/04/2008)
if gi_pais = 8 then // Si el pais es Moldavia.

	ll_perfil = gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ADVERT","")
		
	// Si esta clicada la opcion `Sin Acceso$$HEX2$$b4002000$$ENDHEX$$en la ventana de Gesti$$HEX1$$f300$$ENDHEX$$n de Opciones/Accesos
	// deshabilitamos la columna "Advertencia" y movemos las dem$$HEX1$$e100$$ENDHEX$$s columnas hacia la izqda.
	if ll_perfil = 1 AND li_registros = 0 then
				
		fw_deshabilitar_columna_advert()
		
	// Si esta clicada la opcion de modificaci$$HEX1$$f300$$ENDHEX$$n en la ventana de Gesti$$HEX1$$f300$$ENDHEX$$n de Opciones/Accesos
	elseif (ll_perfil = 4) or (ll_perfil = 6) then
		dw_lista_descargos.Modify("sgd_descargos_ind_advertencia.protect = 0")
	else
		dw_lista_descargos.Modify("sgd_descargos_ind_advertencia.protect = 1")
	end if
else
	
		IF li_registros = 0 THEN
			fw_deshabilitar_columna_advert()
		END IF
end if
// Fin A$$HEX1$$f100$$ENDHEX$$adido RCA (07/04/2008)



if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_AP_RECH","")> 1 then // AP/RE/MOD DESCARGOS
                ib_encargado_de_turno = TRUE
end if

if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_AP_R_ETCEE","")> 1 then // AP/RE/MOD DESCARGOS ETCEE
                ib_encargado_de_turno = TRUE
end if

if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","")= 1 then // ALTA  DESCARGOS DESHABILITADA
    md_lista_descargos.m_archivo.m_agregar.enabled=false
END IF

if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ELIMINAR","")= 1 then //ELIMINAR DESCARGOS DESHABILITADA
	 md_lista_descargos.m_archivo.m_eliminar.enabled=false
END IF

d_filtro.object.operacion[1] = "<"
d_filtro.object.tiempo[1] = 2

if gb_bdi then 
	if gb_hay_sesion  then
		md_lista_descargos.m_consultar.m_grafico.visible=true
		md_lista_descargos.m_consultar.m_grafico.toolbaritemvisible=true
		md_lista_descargos.m_consultar.m_grafico.m_localizacion.toolbaritemvisible=true
		md_lista_descargos.m_consultar.m_grafico.m_selecciondecapas.toolbaritemvisible=true
		md_lista_descargos.m_consultar.m_grafico.m_quitarblink.toolbaritemvisible=true
	else  
  		//if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Por el momento no es posible mostrar informaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica, $$HEX1$$bf00$$ENDHEX$$desea continuar?",Information!,YesNo!)=2 then 
  		if gnv_msg.f_mensaje("CD01","","",YesNo!) = 2 then 
    		close(this)
			return
  		end if         	
	end if
end if

// GNU 6-3-2007. Mejora 1/510515
if fg_verifica_parametro("grupo descargo") then
	gb_3.visible=True
	rb_5.visible=True
	rb_6.visible=True
	//AHM
	rb_4.visible= FALSE
//	rb_5.show()
//	rb_6.show()
//	gb_3.show()
end if

////////////////////////////////////////////////////////////
//// TIPO DE INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
////////////////////////////////////////////////////////////
//
//ib_new_tip_inc = fg_verifica_parametro('nuevos_tip_inc')
//
/////////////////////////////////////////////////////////////
	
this.setredraw(true)
dw_1.modify("data_1.DataObject ='" + dw_lista_descargos.DataObject + "'")
end event

event activate;
// Si se activa esta ventana se oculta la grafica.
if isvalid(this) then 
	if gb_bdi and gb_hay_sesion then 
   	gl_instalacion_afectada = 0
      fg_mostrar(false)
	end if  
end if  



end event

event close;call super::close;lu_comunic.is_comunic.programa_retorno = "iw_1234"
// Esto esta puesto asi por que da un error de objeto nulo
//Hugo Serna
//      gu_comunic.is_comunic = lu_comunic.is_comunic

//*****************DESTRUCCION DE LOS OBJETOS UTILIZADOS**********************
DESTROY lu_comunic
DESTROY lu_comunic1
DESTROY iu_resetea

//AHM (04/05/2011) ASUR 1059966
IF dw_lista_descargos.rowCount() > 0 THEN
	dw_lista_descargos.update()
	COMMIT;
END IF

end event

on w_7101_consulta_descargos.create
int iCurrent
call super::create
if this.MenuName = "md_lista_descargos" then this.MenuID = create md_lista_descargos
this.d_solicitud=create d_solicitud
this.d_ambito=create d_ambito
this.d_filtro=create d_filtro
this.st_1=create st_1
this.pb_1=create pb_1
this.r_2=create r_2
this.st_4=create st_4
this.st_3=create st_3
this.r_3=create r_3
this.st_5=create st_5
this.r_1=create r_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_2=create gb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_graf_aux=create dw_graf_aux
this.pb_2=create pb_2
this.dw_busca_padre=create dw_busca_padre
this.dw_1=create dw_1
this.dw_grafico=create dw_grafico
this.st_7=create st_7
this.dw_lista_descargos=create dw_lista_descargos
this.st_2=create st_2
this.st_6=create st_6
this.dw_desc_descargo=create dw_desc_descargo
this.rb_5=create rb_5
this.rb_6=create rb_6
this.cb_total=create cb_total
this.sle_1=create sle_1
this.st_8=create st_8
this.rb_7=create rb_7
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_solicitud
this.Control[iCurrent+2]=this.d_ambito
this.Control[iCurrent+3]=this.d_filtro
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.r_2
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.r_3
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.r_1
this.Control[iCurrent+12]=this.rb_1
this.Control[iCurrent+13]=this.rb_2
this.Control[iCurrent+14]=this.gb_2
this.Control[iCurrent+15]=this.rb_3
this.Control[iCurrent+16]=this.rb_4
this.Control[iCurrent+17]=this.dw_graf_aux
this.Control[iCurrent+18]=this.pb_2
this.Control[iCurrent+19]=this.dw_busca_padre
this.Control[iCurrent+20]=this.dw_1
this.Control[iCurrent+21]=this.dw_grafico
this.Control[iCurrent+22]=this.st_7
this.Control[iCurrent+23]=this.dw_lista_descargos
this.Control[iCurrent+24]=this.st_2
this.Control[iCurrent+25]=this.st_6
this.Control[iCurrent+26]=this.dw_desc_descargo
this.Control[iCurrent+27]=this.rb_5
this.Control[iCurrent+28]=this.rb_6
this.Control[iCurrent+29]=this.cb_total
this.Control[iCurrent+30]=this.sle_1
this.Control[iCurrent+31]=this.st_8
this.Control[iCurrent+32]=this.rb_7
this.Control[iCurrent+33]=this.gb_1
this.Control[iCurrent+34]=this.gb_3
this.Control[iCurrent+35]=this.gb_4
end on

on w_7101_consulta_descargos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.d_solicitud)
destroy(this.d_ambito)
destroy(this.d_filtro)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.r_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.r_3)
destroy(this.st_5)
destroy(this.r_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_graf_aux)
destroy(this.pb_2)
destroy(this.dw_busca_padre)
destroy(this.dw_1)
destroy(this.dw_grafico)
destroy(this.st_7)
destroy(this.dw_lista_descargos)
destroy(this.st_2)
destroy(this.st_6)
destroy(this.dw_desc_descargo)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.cb_total)
destroy(this.sle_1)
destroy(this.st_8)
destroy(this.rb_7)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event closequery;IF lu_comunic.is_comunic.longval1 = 0 THEN
        lu_comunic.is_comunic.accion_retorno = "No Seleccionada"
END IF
if gb_bdi and gb_hay_sesion  then
        fg_mostrar(false)
end if 

end event

on deactivate;//
end on

event ue_arch_agregar;call super::ue_arch_agregar;gu_comunic.is_comunic.accion_llamada="alta"
gu_comunic.is_comunic.Programa_llamante="w_7101_consulta"

gu_comunic.is_comunic.intval1=d_ambito.getitemnumber(1,"nro_centro")
gu_comunic.is_comunic.intval2=d_ambito.getitemnumber(1,"nro_cmd") 
gu_comunic.is_comunic.intval3=d_ambito.getitemnumber(1,"nro_mesa") 
gu_comunic.is_comunic.strval6 = ""

Open(w_7106_solicitud_descargos)
end event

event ue_arch_imprimir;call super::ue_arch_imprimir;
DataWindowChild dw_datos
	
dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN dw_lista_descargos.ShareData(dw_datos)

IF dw_lista_descargos.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF
//dw_1.SetTransObject(SQLCA)
//dw_1.SetRedraw(true)
//dw_lista_descargos.setRedraw(true)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_lista_descargos
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

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7101_consulta_descargos
integer x = 1248
integer y = 32
end type

type d_solicitud from u_inc_2013_pr_desde_hasta within w_7101_consulta_descargos
event ue_cambio_desde pbm_custom45
event ue_cambio_hasta pbm_custom46
integer x = 146
integer y = 520
integer width = 923
integer height = 324
integer taborder = 30
string dataobject = "d_f_solicitud"
boolean border = false
end type

event ue_cambio_hasta;call super::ue_cambio_hasta;//DateTime ldt_fecha_hasta
//d_deteccion.setitem(1,"hasta",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"hasta")))
//d_deteccion.accepttext()

end event

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

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_7101_consulta_descargos
integer x = 119
integer y = 24
integer width = 997
integer height = 444
integer taborder = 10
string dataobject = "d_cen_2001_pr_form_centro_cmd_mesa_2"
boolean border = false
end type

type d_filtro from u_desc_7101_pr_filtro_descargos within w_7101_consulta_descargos
integer x = 1742
integer y = 4
integer width = 1673
integer height = 800
integer taborder = 20
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

end event

event itemerror;call super::itemerror;return 1
end event

type st_1 from statictext within w_7101_consulta_descargos
integer x = 3214
integer y = 288
integer width = 201
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_7101_consulta_descargos
integer x = 2830
integer y = 880
integer width = 151
integer height = 132
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "gra_sec.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;setpointer(HourGlass!)
string ls_sql, ls_mod,ls_respuesta,ls_alcance,ls_estado
long ll_alcance, ll_duracion, li_interrup
long ll_sgt

dw_graf_aux.reset()
dw_grafico.reset()

if ib_barras = false then
        dw_grafico.modify("gr_1.graphtype=17")
end if

//Si el SGT tiene INTERFACE cambia los estados visibles para la grafica.
        

dw_graf_aux.settransObject(sqlca)

   ls_estado = " SGD_VALOR.CODIGO IN ("+string(fgci_descargo_activado) + ","+&
	string(fgci_descargo_agrupado ) + ","+&
	string(fgci_descargo_anulado ) + ","+&
	string(fgci_descargo_aplazado) + ","+&
	string(fgci_descargo_aprobado ) + ","+&
	string(fgci_descargo_definido ) + ","+&
	string(fgci_descargo_finalizado) + ","+&
	string(fgci_descargo_modificado ) + ","+&
	string(fgci_descargo_no_activado ) + ","+& 
		string(fgci_descargo_rechazado ) + ","+&
	string(fgci_descargo_solicitado) +")"

if gb_openbdi or gb_operaciones  then  // EXISTE BDI
   ls_estado = " SGD_VALOR.CODIGO IN ("+string(fgci_descargo_activado) + ","+&
	string(fgci_descargo_actualizado_BDI ) + ","+ string(fgci_descargo_agrupado ) + ","+&
	string(fgci_descargo_anulado ) + ","+&
	string(fgci_descargo_aplazado) + ","+&
	string(fgci_descargo_aprobado ) + ","+&
	string(fgci_descargo_definido ) + ","+&
	string(fgci_descargo_finalizado) + ","+&
	string(fgci_descargo_modificado ) + ","+&
	string(fgci_descargo_no_activado ) + ","+& 
	string(fgci_descargo_pendiente_BDI ) + ","+&
	string(fgci_descargo_pendiente_pta_servicio ) + ","+&
	string(fgci_descargo_rechazado ) + ","+&
	string(fgci_descargo_rechazado_BDI ) + ","+&
	string(fgci_descargo_solicitado) +")"
end if


idt_f_desde=DateTime(Date("01/01/1900"))

if rb_1.checked = true then
        ls_sql = "  SELECT count(*), SGD_VALOR.DESCRIPCION,SGD_VALOR.CODIGO  " + &
					 "FROM SGD_DESCARGOS, SGD_VALOR, SGD_INSTALACION " + &
					 "WHERE ( SGD_VALOR.CODIGO = SGD_DESCARGOS.ESTADO  ) and   " + &
					 "( SGD_INSTALACION.NRO_INSTALACION = SGD_DESCARGOS.COD_INST_ORIGEN  ) and  " + &
					 "SGD_VALOR.CODIF = 'ES_D' AND " + &
					 "SGD_INSTALACION.BDI_JOB = 0 AND  " + &
					 ls_estado + &
					 "GROUP BY SGD_VALOR.DESCRIPCION,SGD_VALOR.CODIGO " 
        
        ls_mod = "DataWindow.Table.Select=~" "  + ls_sql + "~""
        ls_respuesta = dw_graf_aux.modify(ls_mod)

//      if ls_respuesta <> "" then
//              messagebox("Estado","Modificacion Erronea " + ls_respuesta)
//      end if
//
        if dw_graf_aux.retrieve(idt_f_desde,idt_f_desde) > 0 then
                md_lista_descargos.m_editar.m_buscar.enabled = false
					 fw_genera_grafica()
        else
                gnv_msg.f_mensaje("IT01","","",OK!)
        end if
        return
end if

// A$$HEX1$$f100$$ENDHEX$$adido por SGO. Mejora 1/370503 - Moldavia. 16/08/2005.
If gi_pais = 8 Then
	ls_sql = " SELECT count(*), SGD_VALOR.DESCRIPCION,SGD_VALOR.CODIGO " +&
				  " FROM SGD_DESCARGOS, SGD_VALOR, SGD_INSTALACION " +&
				 " WHERE SGD_VALOR.CODIGO = SGD_DESCARGOS.ESTADO and " + &
						 " SGD_INSTALACION.NRO_INSTALACION = SGD_DESCARGOS.COD_INST_ORIGEN and " +&
						 " SGD_INSTALACION.BDI_JOB = 0 AND " + /* DSA 10/01/2000 */ &												  
						 " ( ( SGD_DESCARGOS.F_INI_SOLICITADO <= :desde AND SGD_DESCARGOS.F_FIN_SOLICITADO >= :desde ) OR " + &
						 "	  ( SGD_DESCARGOS.F_INI_SOLICITADO < :hasta + 1/(24*60) AND SGD_DESCARGOS.F_FIN_SOLICITADO > :hasta + 1/(24*60) ) OR " + &
						 "	  ( SGD_DESCARGOS.F_INI_SOLICITADO >= :desde AND SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta + 1/(24*60) ) ) AND " +&
						 ls_estado + " AND " + " SGD_VALOR.CODIF = 'ES_D' " 

	//Si es inicio real y fin real
	If rb_3.checked = True Then
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO <= :desde", "SGD_DESCARGOS.F_INI_APROBADO <= :desde")
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO >= :desde", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO >= :desde")

			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO < :hasta", "SGD_DESCARGOS.F_INI_APROBADO < :hasta")
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO > :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO > :hasta ")

			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_INI_APROBADO >= :desde")
			ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_FIN_APROBADO < :hasta ")
	End If
Else
// Fin. Sgo.
	// Modificado por SGO. Se olvid$$HEX2$$f3002000$$ENDHEX$$(LFE Mejora 1/275744: B$$HEX1$$fa00$$ENDHEX$$squeda Descargos. Se sustituye F_SOLICITADO por F_INI_SOLICITADO y por F_FIN_SOLICITADO)
//	ls_sql = " SELECT count(*), SGD_VALOR.DESCRIPCION,SGD_VALOR.CODIGO " +&
//				  " FROM SGD_DESCARGOS, SGD_VALOR, SGD_INSTALACION " +&
//				 " WHERE SGD_VALOR.CODIGO = SGD_DESCARGOS.ESTADO and " + &
//						 " SGD_INSTALACION.NRO_INSTALACION = SGD_DESCARGOS.COD_INST_ORIGEN and " +&
//						 " SGD_INSTALACION.BDI_JOB = 0 AND " + /* DSA 10/01/2000 */ &												  
//						 " SGD_DESCARGOS.F_SOLICITADO >= :desde AND " + &
//						 " SGD_DESCARGOS.F_SOLICITADO <= :hasta AND " + &
//						 ls_estado + " AND " + " SGD_VALOR.CODIF = 'ES_D' " 
	// SGO. Igualamos '<=' a '<' para que la consulta quede igual que el listado.
	ls_sql = " SELECT count(*), SGD_VALOR.DESCRIPCION,SGD_VALOR.CODIGO " +&
				  " FROM SGD_DESCARGOS, SGD_VALOR, SGD_INSTALACION " +&
				 " WHERE SGD_VALOR.CODIGO = SGD_DESCARGOS.ESTADO and " + &
						 " SGD_INSTALACION.NRO_INSTALACION = SGD_DESCARGOS.COD_INST_ORIGEN and " +&
						 " SGD_INSTALACION.BDI_JOB = 0 AND " + /* DSA 10/01/2000 */ &												  
						 " ( ( SGD_DESCARGOS.F_INI_SOLICITADO >= :desde ) AND " + &
						 "   ( SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta + 1/(24*60) ) ) AND " +&
						 ls_estado + " AND " + " SGD_VALOR.CODIF = 'ES_D' " 

	//Si es inicio real y fin real
	if rb_3.checked = true then
//			 ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_SOLICITADO >= :desde","SGD_DESCARGOS.F_INI_APROBADO >=:desde")
//			 ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_SOLICITADO <= :hasta",  "SGD_DESCARGOS.F_INI_APROBADO <=:hasta and sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null ")
			 ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_INI_SOLICITADO >= :desde", "SGD_DESCARGOS.F_INI_APROBADO >= :desde")
			 // SGO. Igualamos '<=' a '<' para que la consulta quede igual que el listado.
			 ls_sql = fg_remplaza(ls_sql,"SGD_DESCARGOS.F_FIN_SOLICITADO < :hasta", "sgd_descargos.f_aprobado is not null and sgd_descargos.f_ini_aprobado is not null and SGD_DESCARGOS.F_INI_APROBADO < :hasta")
	end if
	// Fin SGO. Se olvid$$HEX3$$f30020002000$$ENDHEX$$(LFE Mejora 1/275744: B$$HEX1$$fa00$$ENDHEX$$squeda Descargos. Se sustituye F_SOLICITADO por F_INI_SOLICITADO y por F_FIN_SOLICITADO)
End If // A$$HEX1$$f100$$ENDHEX$$adido por SGO. Mejora 1/370503 - Moldavia. 16/08/2005.

is_clausula_where = " "

d_solicitud.accepttext()
d_filtro.accepttext()
d_ambito.accepttext()

idt_f_desde=d_solicitud.GetItemDateTime(1,"desde")
idt_f_hasta=d_solicitud.GetItemDateTime(1,"hasta")

if isnull(idt_f_desde) then
        idt_f_desde = DateTime(Date("01/01/1900"))
end if

if idt_f_desde >= idt_f_hasta then
        gnv_msg.f_mensaje("EI26","","",OK!)
        //messagebox("Error","Las fechas no son correctas")
        return
end if

//// Filtro para centro, cmd y mesa solo para operadores
if gb_usuario_mant = false and gb_usuario_tele = false then     
        is_filtro_ambito = d_ambito.fnu_filtro_ambito_descargos(d_ambito.getitemnumber(1,"nro_centro"), d_ambito.getitemnumber(1,"nro_cmd") , d_ambito.getitemnumber(1,"nro_mesa")) 
        IF is_filtro_ambito <> " " THEN
                is_filtro_ambito = fg_remplaza(is_filtro_ambito,"~"","")
                is_clausula_where = is_clausula_where + " AND "+ is_filtro_ambito 
        END IF
end if

// Tipo de tension
ll_alcance = d_filtro.getitemnumber(1,"ai_alcance")
if ll_alcance > 0 then
        ls_alcance  = " SGD_INSTALACION.TENSION = " + string(ll_alcance)
        is_clausula_where = is_clausula_where +" AND "+ ls_alcance      
end if

// El Descargo sin/con Interrupcion 
//______DSA INI 03/04/2000			
li_interrup = d_filtro.getitemnumber(1,"ai_interrup")
if li_interrup > 0 then
		  string ls_interrup
        ls_interrup= ' SGD_DESCARGOS.IND_INTERRUPCION = ' + string(li_interrup)
        is_clausula_where = is_clausula_where +" AND "+ ls_interrup 
end if
//______DSA FIN 03/04/2000			

//Alcance
//if gb_usuario_mant = true or gb_usuario_tele = true then        
//                ls_alcance =  " GI_USUARIO_SGI.USUARIO = " + "'" + gs_usuario + "'"
//                is_clausula_where = is_clausula_where +" AND "+ ls_alcance      
//end if

is_clausula_where = is_clausula_where + " GROUP BY SGD_VALOR.DESCRIPCION,SGD_VALOR.CODIGO "   

ls_mod = "DataWindow.Table.Select=~" "  + ls_sql + is_clausula_where + "~""

ls_respuesta = dw_graf_aux.modify(ls_mod)

if ls_respuesta = "" then
	if dw_graf_aux.retrieve(idt_f_desde,idt_f_hasta) > 0 then
   	md_lista_descargos.m_editar.m_buscar.enabled = false
   else
      gnv_msg.f_mensaje("IT01","","",OK!)
   end if
else
//      messagebox("Estado","Modificacion Erronea " + ls_respuesta)
end if

fw_genera_grafica()
//st_7.visible = true
end event

type r_2 from rectangle within w_7101_consulta_descargos
integer linethickness = 4
integer x = 1170
integer y = 960
integer width = 50
integer height = 48
end type

type st_4 from statictext within w_7101_consulta_descargos
integer x = 1243
integer y = 852
integer width = 1061
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Descargos para ser Activados"
boolean focusrectangle = false
end type

type st_3 from statictext within w_7101_consulta_descargos
integer x = 1243
integer y = 756
integer width = 1061
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Descargos para ser Solicitados"
boolean focusrectangle = false
end type

type r_3 from rectangle within w_7101_consulta_descargos
integer linethickness = 4
long fillcolor = 25198592
integer x = 1170
integer y = 768
integer width = 50
integer height = 48
end type

type st_5 from statictext within w_7101_consulta_descargos
integer x = 1243
integer y = 948
integer width = 1061
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Descargos para ser Gestionados"
boolean focusrectangle = false
end type

type r_1 from rectangle within w_7101_consulta_descargos
integer linethickness = 4
long fillcolor = 255
integer x = 1170
integer y = 864
integer width = 50
integer height = 48
end type

type rb_1 from radiobutton within w_7101_consulta_descargos
integer x = 3017
integer y = 800
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Gen$$HEX1$$e900$$ENDHEX$$rica"
boolean checked = true
end type

type rb_2 from radiobutton within w_7101_consulta_descargos
integer x = 3017
integer y = 892
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Filtrada"
end type

type gb_2 from groupbox within w_7101_consulta_descargos
integer x = 2757
integer y = 688
integer width = 645
integer height = 340
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
end type

type rb_3 from radiobutton within w_7101_consulta_descargos
integer x = 169
integer y = 852
integer width = 535
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Inicio Aprobaci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;d_solicitud.object.deteccion_titulo.text = " Fecha de Aprobaci$$HEX1$$f300$$ENDHEX$$n "


end event

type rb_4 from radiobutton within w_7101_consulta_descargos
integer x = 169
integer y = 920
integer width = 507
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Solicitud campo"
end type

event clicked;d_solicitud.object.deteccion_titulo.text = " Fecha Solic. campo "
end event

type dw_graf_aux from datawindow within w_7101_consulta_descargos
boolean visible = false
integer x = 2240
integer y = 140
integer width = 1088
integer height = 328
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_aux_alf_graf_descargos"
end type

type pb_2 from picturebutton within w_7101_consulta_descargos
event clicked pbm_bnclicked
integer x = 2830
integer y = 740
integer width = 151
integer height = 132
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grafico.bmp"
end type

event clicked;dw_grafico.modify("gr_1.graphtype=6")
dw_grafico.Modify("gr_1.Category.Label = ''")
ib_barras = true
pb_1.triggerevent(clicked!)
ib_barras = false


end event

type dw_busca_padre from datawindow within w_7101_consulta_descargos
boolean visible = false
integer x = 18
integer y = 1228
integer width = 805
integer height = 360
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_7001_busca_padre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_1 from datawindow within w_7101_consulta_descargos
boolean visible = false
integer x = 1445
integer y = 608
integer width = 1737
integer height = 712
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_impresion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_grafico from datawindow within w_7101_consulta_descargos
boolean visible = false
integer x = 1083
integer y = 36
integer width = 2327
integer height = 1652
integer taborder = 100
string dataobject = "d_aux_graf_descargos"
borderstyle borderstyle = styleraised!
end type

event doubleclicked;//st_7.visible = false
this.visible = false
md_lista_descargos.m_editar.m_buscar.enabled = true
st_7.visible = false

end event

type st_7 from statictext within w_7101_consulta_descargos
boolean visible = false
integer x = 1093
integer y = 1600
integer width = 2309
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "Los descargos finalizados y no activados no son visualizados"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_lista_descargos from u_gen_0000_lista within w_7101_consulta_descargos
integer x = 105
integer y = 1080
integer width = 3296
integer height = 708
integer taborder = 80
string dataobject = "d_7001_lista_descargos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

event clicked;call super::clicked;long ll_fila = 1
integer li_advertencia
decimal ldc_estado
//Si se ha pulsado sobre la cabecera sale
if row = 0 then return
il_row = row

dw_lista_descargos.setredraw(false)

//Buscar elementos marcados y  los desmarca, marcando el nuevo
gl_instalacion_afectada =this.getitemnumber(row,"sgd_instalacion_nro_instalacion")
ll_fila = dw_lista_descargos.getselectedrow(0)
do while ll_fila <> 0
        dw_lista_descargos.selectrow(ll_fila,false)
        ll_fila ++
        ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
loop

md_lista_descargos.m_consultar.m_callesafectadas.enabled = true
md_lista_descargos.m_consultar.m_callesafectadas.ToolbarItemVisible = true
md_lista_descargos.m_consultar.m_clientesimportantes.enabled = true
md_lista_descargos.m_consultar.m_clientesimportantes.ToolbarItemVisible = true

IF row <> 0 THEN
	ldc_estado = dw_lista_descargos.GetItemDecimal (row,'sgd_descargos_estado')
	is_usuario= dw_lista_descargos.getitemstring(row,"gi_usuario_sgi_usuario")
//	IF (ldc_estado = 6) or (ldc_estado > 7) THEN
//		md_lista_descargos.m_consultar.m_clientesimportantes.enabled = true
//		md_lista_descargos.m_consultar.m_clientesimportantes.ToolbarItemVisible = true
//	ELSE
//		md_lista_descargos.m_consultar.m_clientesimportantes.enabled = false
//		md_lista_descargos.m_consultar.m_clientesimportantes.ToolbarItemVisible = false
//	END IF
END IF
//COMIENZO ALE
// Dependiendo de si hay o no activacion gr$$HEX1$$e100$$ENDHEX$$fica habilito el boton de inst. modificadas
if (this.getitemnumber(row,"tipo_descargo")=2) then
        md_lista_descargos.m_consultar.m_instalacionesmodificadas.visible = true
        md_lista_descargos.m_consultar.m_instalacionesmodificadas.ToolbarItemVisible = true
else
        md_lista_descargos.m_consultar.m_instalacionesmodificadas.visible = false
        md_lista_descargos.m_consultar.m_instalacionesmodificadas.ToolbarItemVisible = false

end if
// FINAL ALE


dw_lista_descargos.selectrow(row,true)

dw_lista_descargos.setredraw(true)







end event

event doubleclicked;String ls_desc, ls_aux, ls_accion
int indice, li_par, li_tension
Boolean lb_sigo=true
  

if row > 0 then
	if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_OBS","ACC_MANTEN")= 1 then
		// El usuario tiene acceso de mantenimiento.
		// Se comprueba el nivel de tensi$$HEX1$$f300$$ENDHEX$$n.
		
		li_tension = dw_lista_descargos.getitemNUMBER(row,"sgd_instalacion_tension")
		ls_desc  = gu_perfiles.of_nivel_tension('DES_OBS')

		for indice = 1 to len(ls_desc)
			li_par =  mod (indice,2)
			IF li_par <> 0 then
				ls_aux = mid(ls_desc,indice,1)
				if ls_aux <> ',' and lb_sigo = true then
					if integer(ls_aux) = li_tension or ls_aux = '0' then
						lb_sigo = false
					end if
				end if
			end if
		next
		// No tiene permiso para ese nivel
		If lb_sigo = true then
			gu_comunic.is_comunic.accion_llamada = "Consulta"
		else
			gu_comunic.is_comunic.accion_llamada="Modificacion" 
			ls_accion = "Modificacion"
		end if
		
	else
		gu_comunic.is_comunic.accion_llamada = "Consulta"
	end if
		
	double_click = true
	gu_comunic.is_comunic.longval1 = dw_lista_descargos.getitemnumber(row,"nro_descargo") // Variable que tiene el valor a recuperar
	gu_comunic.is_comunic.decval1 = dw_lista_descargos.getitemnumber(row,"sgd_instalacion_nro_instalacion") // Variable que tiene el valor a recuperar
	gu_comunic.is_comunic.strval5 = dw_lista_descargos.getitemstring(row,"sgd_instalacion_nom_instalacion") // Variable que tiene el valor a recuperar
	gu_comunic.is_comunic.strval6 = "lista_descargos"
	//		  if gnu_u_transaction.uf_lock(this,"SGD_DESCARGOS",&
	//		  												"NRO_DESCARGO = " + &
	//															string(gu_comunic.is_comunic.longval1)) = 100 then
	//				double_click = false
	//			  	return 
	//  		  end if					 
	//timer(0,w_7101_consulta_descargos)
	IF gu_comunic.is_comunic.accion_llamada="Modificacion" THEN
		IF gnu_u_transaction.uf_lock(THIS, "SGD_DESCARGOS", "NRO_DESCARGO=" + &
				string(gu_comunic.is_comunic.longval1),fgci_bloqueo_descargo,gu_comunic.is_comunic.longval1) <> 0 THEN
			
			IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea abrir el descargo en modo consulta?", question!, YesNo!) = 1 THEN
				gu_comunic.is_comunic.accion_llamada = "Consulta"
				ls_accion = "Consulta"
			ELSE
				return
			END IF
		END IF
	END IF


	open (w_7102_mantenimiento_descargos)
	gu_comunic.is_comunic.strval6 = ""
	double_click = false
	
	IF ls_accion = "Modificacion" THEN
		gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,dw_lista_descargos.getitemnumber(row,"nro_descargo"))
	END IF
	
end if
end event

event rbuttondown;//////
///////////////////////////////////////////////////////////////////
//	16/12/99			DSA		Multiusuario pruebas
/////////////////////////////////////////////////////////////////////////
long ll_row, ll_refresco, ll_nro_descargo, ll_new_descargo, ll_agrupado, ll_ind_interrupcion,ll_Array[]
string ls_respuesta,ls_usuario_solicitante
int li_act_grafica, li_estado, li_tension, li_retorno, li_estado_trabajo, li_estado_descargo
int li_lock_status, li_res,li_permito,li_tipo_inst,li_estado_red = 0
string ls_usuario, ls_nombre, ls_codigo_mensaje
datetime ldt_inicio, ldt_fin
boolean lb_es_ct, lb_sin_acceso = FALSE
boolean lb_envia_ocen=FALSE
s_descargos str_descargos
double	ld_minutos				//Minutos antes desde las que permite activar el descargo
int		li_valorParametro		//Valor para saber si un parametro est$$HEX2$$e1002000$$ENDHEX$$activo o no
string	ls_minutos				//Minutos antes desde las que permite activar el descargo

//NCA-INICIO.DDAG-4996.22-04-2016.
string ls_agente, ls_agente_opcion
string ls_descripcion_agente
//NCA-FIN.DDAG-4996.22-04-2016

m_emerg_desc NewMenu
ll_row = this.getselectedrow(0)

if ll_row >0 then
   ll_refresco = fw_comprobar_datos (ll_row)
   IF ll_refresco = 1 THEN
		w_7101_consulta_descargos.triggerevent("ue_retrieve")
		gnv_msg.f_mensaje("CD06","","",OK!)
		RETURN
	END IF
END IF

//AHM (28/04/2008)
//Comprobamos si est$$HEX2$$e1002000$$ENDHEX$$activo el par$$HEX1$$e100$$ENDHEX$$metro del tiempo de activaci$$HEX1$$f300$$ENDHEX$$n de un descargo
SELECT valor
INTO	:li_valorParametro
FROM	gi_parametros
WHERE cod_parametro = 101;

IF li_valorParametro = 1 THEN			//Comprueba si el valor del par$$HEX1$$e100$$ENDHEX$$metro que indica el tiempo de activaci$$HEX1$$f300$$ENDHEX$$n de un descargo est$$HEX2$$e1002000$$ENDHEX$$activo
//Captura el tiempo de antelaci$$HEX1$$f300$$ENDHEX$$n con el que se puede activar un descargo
	SELECT valor
	INTO	:ls_minutos
	FROM	sgd_valor
	WHERE codif = 'DTA';
END IF	

NewMenu = CREATE m_emerg_desc

if ll_row >0 then
	u_desc_2030_rn_filtro_descargo	lu_desc_const	
			  
	lu_desc_const = Create u_desc_2030_rn_filtro_descargo;		  		  
   ll_ind_interrupcion = dw_lista_descargos.getitemnumber(ll_row,"sgd_descargos_ind_interrupcion")
	if ll_ind_interrupcion = lu_desc_const.sin_interrupcion then 		  
		ib_sin_interrupcion = TRUE
	else
		ib_sin_interrupcion = FALSE
 	end if
	
	Destroy (lu_desc_const)	 
	
   il_nro_descargo 	= dw_lista_descargos.getitemnumber(ll_row,"nro_descargo")
	/////////////////////////////////////////////////////////
	// TIPO INICDENCIA VERSION UNIFICADA AMR 19/08/2002
	////////////////////////////////////////////////////////
	ii_ind_obligada	= dw_lista_descargos.getitemnumber(ll_row,"ind_obligada")
	
	If isnull(ii_ind_obligada) then ii_ind_obligada = 0
	////////////////////////////////////////////////////////
   is_observaciones = dw_lista_descargos.getitemstring(ll_row,"cobs_solicitado")
   idt_f_inicio_descargo = dw_lista_descargos.getitemdatetime(ll_row,"f_ini_aprobado")
   ll_agrupado = dw_lista_descargos.getitemnumber(ll_row,"sgd_descargos_nro_agrupacion")
   idt_f_fin_descargo = dw_lista_descargos.getitemdatetime(ll_row,"f_fin_aprobado")
   il_instalacion_afectada = dw_lista_descargos.getitemnumber(ll_row,"sgd_instalacion_nro_instalacion")
   li_tipo_inst = dw_lista_descargos.getitemnumber(ll_row,"tipo_instalacion")
	li_estado_red = dw_lista_descargos.getitemnumber(ll_row,"estado_red")
   fgnu_resetear_s_comunicaciones(gu_comunic)
   fgnu_resetear_s_comunicaciones(gu_comunic1)
   
   ls_usuario= dw_lista_descargos.getitemstring(ll_row,"gi_usuario_sgi_usuario")
   ls_usuario_solicitante = dw_lista_descargos.getitemstring(ll_row,"id_solicitante")
   li_estado=dw_lista_descargos.getitemNUMBER(ll_row,"sgd_descargos_estado")
	li_tension = dw_lista_descargos.getitemNUMBER(ll_row,"sgd_instalacion_tension")
	li_act_grafica = dw_lista_descargos.getitemnumber(ll_row,"sgd_descargos_ind_act_grafica")
	ll_nro_descargo = dw_lista_descargos.getitemNUMBER(ll_row,"nro_descargo")
	ldt_inicio = dw_lista_descargos.GetItemDateTime(ll_row,"f_ini_aprobado")
	ldt_fin = dw_lista_descargos.GetItemDateTime (ll_row,"f_fin_aprobado")
	ii_causa = dw_lista_descargos.object.sgd_descargos_cod_causa[ll_row]
	ii_fam_causa = dw_lista_descargos.object.sgd_descargos_fam_causa[ll_row]
	id_causa = dw_lista_descargos.object.sgd_descargos_fec_causa[ll_row]
	
	IF IsNull(ldt_inicio) or IsNull(ldt_fin) THEN
		ldt_inicio = dw_lista_descargos.GetItemDateTime(ll_row,"sgd_descargos_f_ini_solicitado")
		ldt_fin = dw_lista_descargos.GetItemDateTime (ll_row,"sgd_descargos_f_fin_solicitado")
	END IF
	
	lb_es_ct = fw_instalacion_ct(il_instalacion_afectada)
     
	IF gb_operaciones = true and gb_operaciones_inst = true then	  
						
		// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	
		ll_array[2] = il_instalacion_afectada
		li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],li_tipo_inst)
		
	END IF

	m_emerg_desc.m_copiardescargo.enabled = (gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","ACC_MANTEN") = 1)
	
	//AHM (18/12/2008)
	/*IF fg_valor_parametro("OCEN")=1 THEN
		if fw_es_ocen()=TRUE THEN
			IF fg_valor_parametro("OPERACION_OCEN")=0 THEN	//Ocen interacciona con operaci$$HEX1$$f300$$ENDHEX$$n
				m_emerg_desc.m_enviarestadoocen.visible=FALSE
			ELSE
				m_emerg_desc.m_enviarestadoocen.enabled=TRUE
			END IF
		else
			IF fg_valor_parametro("OPERACION_OCEN")=0 THEN	//Ocen interacciona con operaci$$HEX1$$f300$$ENDHEX$$n
				m_emerg_desc.m_enviarestadoocen.visible=FALSE
			ELSE
				m_emerg_desc.m_enviarestadoocen.enabled=FALSE
			END IF
		end if
	ELSE*/
		m_emerg_desc.m_enviarestadoocen.visible=FALSE
//	END IF
	
	Choose case  li_estado
   	case fgci_descargo_pendiente_BDI // PTE ACT. BDI
			// LFE - Mejora 1/272575: copiar descargos
			ls_codigo_mensaje = "AD45"
			lb_sin_acceso = TRUE
//      	gnv_msg.f_mensaje("AD45","","",Ok!)
//       return
			// LFE - Fin Mejora 1/272575
		
		case fgci_descargo_actualizado_bdi// ACTUALIZADO BDI
						
			if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","")= 1 then // ALTA / SOLICITUD DESCARGOS DESHABILITADA
				// LFE - Mejora 1/272575: copiar descargos
				ls_codigo_mensaje = "AA08"
				lb_sin_Acceso = TRUE
//				gnv_msg.f_mensaje("AA08","","",Ok!)
//				return
				// LFE - Fin Mejora 1/272575
			else
				if ls_usuario=gs_usuario then

						if (gb_operaciones and li_tension <=gi_tension_nivel_min &
						AND NOT lb_es_ct AND gb_operaciones_inst = false) OR &
						(gb_operaciones_inst = true and (li_permito = 1 or li_permito = 2) ) &
						and li_estado_red <> -10  then // LO TRATA OPERACIONES 
       			   
						 	m_emerg_desc.m_consultaenoperacion.visible = true
						else
							m_emerg_desc.m_consultaenoperacion.visible = false
						end if
													
					m_emerg_desc.m_pte_act_bdi.enabled = False
					m_emerg_desc.m_solicitar.enabled = true
					m_emerg_desc.m_aprobar.enabled = False
					m_emerg_desc.m_modificar.enabled = False
					m_emerg_desc.m_rechazar.enabled = False
					m_emerg_desc.m_activar.enabled = False
					m_emerg_desc.m_aplazar.enabled = False
				else 
					//No pertenece al usuario actual
					// LFE - Mejora 1/272575: copiar descargos
               //gnv_msg.f_mensaje("AD36","","",Ok!)
					lb_sin_Acceso = TRUE
					ls_codigo_mensaje = "AD36"
               //return
					// LFE - Fin Mejora 1/272575
            end if                                  
         end if        
							
		case fgci_descargo_definido
			
			if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","")= 1 then // ALTA / SOLICITUD DESCARGOS DESHABILITADA
				// LFE - Mejora 1/272575: copiar descargos
				ls_codigo_mensaje = "AA08"
				lb_sin_Acceso = TRUE
//				gnv_msg.f_mensaje("AA08","","",Ok!)
//				return
				// LFE - Fin Mejora 1/272575
			else
         	if ls_usuario=gs_usuario then
   					if (gb_operaciones and li_tension <=gi_tension_nivel_min &
						AND NOT lb_es_ct AND gb_operaciones_inst = false) OR &
						(gb_operaciones_inst = true and (li_permito = 1 or li_permito = 2) ) &
						and li_estado_red <> -10  then // LO TRATA OPERACIONES 
       			   
					 	m_emerg_desc.m_consultaenoperacion.visible = true
					else
						m_emerg_desc.m_consultaenoperacion.visible = false
					end if
               
			 if li_act_grafica=0 then // DESCARGO SIN TRABAJO BDI
               	m_emerg_desc.m_pte_act_bdi.visible = False
               else
               	m_emerg_desc.m_solicitar.enabled = False
               end if 
					
					m_emerg_desc.m_aprobar.enabled = False
					m_emerg_desc.m_modificar.enabled = True	//GNU 23-06-2005
					m_emerg_desc.m_rechazar.enabled = False
					m_emerg_desc.m_activar.enabled = False
					m_emerg_desc.m_aplazar.enabled = False
					m_emerg_desc.m_conformidad.enabled = False
				else 
            	//No pertenece al usuario actual
					// LFE - Mejora 1/272575: copiar descargos
               //gnv_msg.f_mensaje("AD36","","",Ok!)
               lb_sin_Acceso = TRUE
					ls_codigo_mensaje = "AD36"
               //return
					// LFE - Fin Mejora 1/272575

				end if  
			END IF
						
		case fgci_descargo_rechazado
			//if li_tension >gi_tension_nivel_min then // LO TRATA SGI
			if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","")= 1 then // ALTA / SOLICITUD DESCARGOS DESHABILITADA
				// LFE - Mejora 1/272575: copiar descargos
				ls_codigo_mensaje = "AA08"
				lb_sin_Acceso = True
				//gnv_msg.f_mensaje("AA08","","",Ok!)
				//return
				// LFE - Fin Mejora 1/272575
			else 
				if ls_usuario_solicitante=gs_usuario then
					m_emerg_desc.m_pte_act_bdi.visible = False
					m_emerg_desc.m_aprobar.enabled = False
					m_emerg_desc.m_modificar.enabled = False
					m_emerg_desc.m_rechazar.enabled = False
					m_emerg_desc.m_activar.enabled = False
					m_emerg_desc.m_aplazar.enabled = False
					m_emerg_desc.m_conformidad.enabled = False
					m_emerg_desc.m_conformidad.enabled = False
					
					if (gb_operaciones and li_tension <=gi_tension_nivel_min &
					AND NOT lb_es_ct AND gb_operaciones_inst = false) OR &
					(gb_operaciones_inst = true and (li_permito = 1 or li_permito = 2) ) &
						and li_estado_red <> -10  then // LO TRATA OPERACIONES 
						m_emerg_desc.m_solicitar.enabled = TRUE
					ELSE
						m_emerg_desc.m_solicitar.enabled = true
					END IF
				else 
					//messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El Usuario Solicitante debe ser el que define el descargo: "  + ls_usuario_solicitante,information!,ok!)
					lb_sin_Acceso = TRUE
					ls_codigo_mensaje = "AD36"
  		          end if  
			END IF	
	
		case fgci_descargo_aplazado
			if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","")= 1 then // ALTA / SOLICITUD DESCARGOS DESHABILITADA
				// LFE - Mejora 1/272575: copiar descargos
				ls_codigo_mensaje = "AA08"
				lb_sin_acceso = True
				//gnv_msg.f_mensaje("AA08","","",Ok!)
				//return
				// LFE - Fin Mejora 1/272575
 			else
				if li_act_grafica=0 then // DESCARGO SIN TRABAJO BDI
            	m_emerg_desc.m_pte_act_bdi.visible = False
            else
            	m_emerg_desc.m_pte_act_bdi.enabled = False
            end if 
   				if (gb_operaciones and li_tension <=gi_tension_nivel_min &
					AND NOT lb_es_ct AND gb_operaciones_inst = false) OR &
					(gb_operaciones_inst = true and (li_permito = 1 or li_permito = 2) ) &
						and li_estado_red <> -10  then // LO TRATA OPERACIONES 
							     
						m_emerg_desc.m_enviaraoperacin.visible = true									
						m_emerg_desc.m_enviaraoperacin.enabled = true
						m_emerg_desc.m_consultaenoperacion.visible = true
						m_emerg_desc.m_aprobar.visible = False
						m_emerg_desc.m_modificar.visible = false
						m_emerg_desc.m_activar.visible = false
						m_emerg_desc.m_aplazar.visible = false
						m_emerg_desc.m_rechazar.visible = False
						m_emerg_desc.m_solicitar.visible = False
						m_emerg_desc.m_conformidad.visible = False
						m_emerg_desc.m_anular.enabled = False
						m_emerg_desc.m_agrupar.enabled = False
			
				else 
						m_emerg_desc.m_modificar.visible = true
						m_emerg_desc.m_modificar.enabled = true
						m_emerg_desc.m_aprobar.visible = true
						m_emerg_desc.m_aprobar.enabled = False
						m_emerg_desc.m_activar.visible = true
						m_emerg_desc.m_activar.enabled = false
						m_emerg_desc.m_aplazar.visible = true
						m_emerg_desc.m_aplazar.enabled = false
						m_emerg_desc.m_rechazar.visible = true									
						m_emerg_desc.m_rechazar.enabled = true
						m_emerg_desc.m_solicitar.visible = true									
						m_emerg_desc.m_solicitar.enabled = False
						m_emerg_desc.m_anular.visible = true									
						m_emerg_desc.m_anular.enabled = False
						m_emerg_desc.m_enviaraoperacin.visible = false		
						m_emerg_desc.m_enviaraoperacin.enabled = false
						m_emerg_desc.m_consultaenoperacion.visible = false
				end if
			end if
			
		case fgci_descargo_aprobado
      		if ib_encargado_de_turno=true then
					if li_act_grafica=0 then // DESCARGO SIN TRABAJO BDI
						m_emerg_desc.m_pte_act_bdi.visible = False
					else
						m_emerg_desc.m_pte_act_bdi.enabled = False
					end if 
					
   				if (gb_operaciones and li_tension <=gi_tension_nivel_min &
					AND NOT lb_es_ct AND gb_operaciones_inst = false) OR &
					(gb_operaciones_inst = true and (li_permito = 1 or li_permito = 2) ) &
					and li_estado_red <> -10  then // LO TRATA OPERACIONES 
						
						m_emerg_desc.m_activar.enabled = False
						m_emerg_desc.m_suspender.visible = False // GNU 29-8-2006. Incidencia 0/316762
					else
						m_emerg_desc.m_activar.enabled = true
						m_emerg_desc.m_suspender.visible = true // GNU 29-8-2006. Incidencia 0/316762
				END IF
						
					m_emerg_desc.m_aprobar.enabled = False
					m_emerg_desc.m_modificar.enabled= False
					m_emerg_desc.m_rechazar.enabled = False
					m_emerg_desc.m_solicitar.enabled = False
					m_emerg_desc.m_anular.enabled = False
					// m_emerg_desc.m_suspender.visible = true // GNU 29-8-2006. Incidencia 0/316762
				else 
					// LFE - Mejora 1/272575: copiar descargos
					ls_codigo_mensaje = "AA08"
					lb_sin_Acceso = True
					//gnv_msg.f_mensaje("AA08","","",Ok!)
					//return
					// LFE - Fin Mejora 1/272575
				end if
				
		case fgci_descargo_no_activado
			if ib_encargado_de_turno=true then
				m_emerg_desc.m_aprobar.enabled = False
				m_emerg_desc.m_modificar.enabled = False
				m_emerg_desc.m_rechazar.enabled = False
				m_emerg_desc.m_solicitar.enabled = False
				m_emerg_desc.m_suspender.visible = false
				m_emerg_desc.m_activar.visible = False
				m_emerg_desc.m_pte_act_bdi.visible = false
			else
				// LFE - Mejora 1/272575: copiar descargos
				ls_codigo_mensaje = "AA08"
				lb_sin_Acceso = True
				//gnv_msg.f_mensaje("AA08","","",Ok!)
          	//return
				// LFE - Fin Mejora 1/272575
			end if
  			//AHM 28/04/2008
			//Si el descargo est$$HEX2$$e1002000$$ENDHEX$$marcado actualizar BDI y la fecha de inicio del descargo est$$HEX2$$e1002000$$ENDHEX$$vencida se permite cancelar
			IF ldt_inicio < fgnu_fecha_actual() AND li_act_grafica =1 THEN
				m_emerg_desc.m_anular.enabled = TRUE
			END IF
			
		case fgci_descargo_solicitado
						
   			if (gb_operaciones and li_tension <=gi_tension_nivel_min &
				AND NOT lb_es_ct AND gb_operaciones_inst = false) OR &
				(gb_operaciones_inst = true and (li_permito = 1 or li_permito = 2) ) &
						and li_estado_red <> -10  then // LO TRATA OPERACIONES 
				
				//if ib_sin_interrupcion then
				//	m_emerg_desc.m_agrupar.enabled = false
				//else 
					m_emerg_desc.m_agrupar.enabled = true
				//end if							

				m_emerg_desc.m_enviaraoperacin.visible  = true
				m_emerg_desc.m_consultaenoperacion.visible = true								  
				m_emerg_desc.m_pte_act_bdi.visible = false
				m_emerg_desc.m_solicitar.visible = false
				m_emerg_desc.m_aprobar.visible = False
				m_emerg_desc.m_aplazar.visible = False
				m_emerg_desc.m_modificar.visible = False
				m_emerg_desc.m_rechazar.visible = False
				m_emerg_desc.m_activar.visible = False
				//m_emerg_desc.m_agrupar.visible = true
				//m_emerg_desc.m_agrupar.enabled = true
				m_emerg_desc.m_conformidad.visible = False
		   								
			ELSE 
				if ib_sin_interrupcion then
					m_emerg_desc.m_agrupar.enabled = false
				else 
					m_emerg_desc.m_agrupar.enabled = true
				end if
				m_emerg_desc.m_solicitar.enabled = False
				m_emerg_desc.m_activar.enabled = False
				m_emerg_desc.m_conformidad.enabled = False
				m_emerg_desc.m_aplazar.enabled = False
				//AHM(28/04/2008)
				//Comprueba que el par$$HEX1$$e100$$ENDHEX$$metro que indica el tiempo de antelaci$$HEX1$$f300$$ENDHEX$$n del descargo est$$HEX2$$e1002000$$ENDHEX$$activo
				IF	(li_valorParametro = 1 AND (fg_duracion_minutos(fgnu_fecha_actual(), ldt_inicio) <= double(ls_minutos) OR ls_minutos ='0')) THEN
					m_emerg_desc.m_activar.enabled = TRUE
				END IF		  
					  
				IF li_act_grafica=0 THEN // DESCARGO SIN TRABAJO BDI
            	m_emerg_desc.m_pte_act_bdi.visible = False
            ELSE
					m_emerg_desc.m_pte_act_bdi.enabled = False
					m_emerg_desc.m_rechazarbdi.visible = true
            END IF 									  						  
									  
			END IF
								
         IF ll_agrupado > 0 or ll_agrupado < 0  THEN
         	m_emerg_desc.m_agrupar.text = 'Gest. Agr&upaci$$HEX1$$f300$$ENDHEX$$n'
         END IF
         
		case fgci_descargo_modificado
			//if li_tension >gi_tension_nivel_min then // LO TRATAMOS
         if ls_usuario_solicitante=gs_usuario then 
         	if li_act_grafica=0 then // DESCARGO SIN TRABAJO BDI
            	m_emerg_desc.m_pte_act_bdi.visible = False
            else
            	m_emerg_desc.m_pte_act_bdi.enabled = False
            end if 

				m_emerg_desc.m_aprobar.enabled = False
				m_emerg_desc.m_modificar.enabled = False
				m_emerg_desc.m_rechazar.enabled = False
				m_emerg_desc.m_solicitar.enabled = False
				m_emerg_desc.m_activar.enabled = False
				m_emerg_desc.m_aplazar.enabled = False
				m_emerg_desc.m_conformidad.enabled =true
			else 
         	//No pertenece al usuario actual
				// LFE - Mejora 1/272575: copiar descargos
            //gnv_msg.f_mensaje("AD36","","",Ok!)
				lb_sin_Acceso = TRUE
				ls_codigo_mensaje = "AD36"
             //return
				// LFE - Fin Mejora 1/272575

         end if
		case 18
			//SRE operaci$$HEX1$$f300$$ENDHEX$$n de enviar a OCEN
		case else
			// LFE - Mejora 1/272575: copiar descargos
			IF m_emerg_desc.m_copiardescargo.enabled = false THEN
				IF ls_codigo_mensaje <> "" THEN
					gnv_msg.f_mensaje(ls_codigo_mensaje,"","",Ok!)
				END IF
				
				return
			ELSE
				lb_sin_acceso = True
			END IF
			// LFE - Fin Mejora 1/272575
	end choose

	// LFE - Mejora 1/272575: copiar descargos
	IF lb_sin_acceso THEN	
		IF m_emerg_desc.m_copiardescargo.enabled = false THEN
			IF ls_codigo_mensaje <> "" THEN
				gnv_msg.f_mensaje(ls_codigo_mensaje,"","",Ok!)
			END IF
			return
		ELSE
			m_emerg_desc.m_enviaraoperacin.visible  = false
			m_emerg_desc.m_consultaenoperacion.visible = false								  
			m_emerg_desc.m_pte_act_bdi.visible = false
			m_emerg_desc.m_solicitar.enabled = false
			m_emerg_desc.m_aprobar.enabled = False
			m_emerg_desc.m_aplazar.enabled = False
			m_emerg_desc.m_modificar.enabled = False
			m_emerg_desc.m_rechazar.enabled = False
			m_emerg_desc.m_activar.enabled = False
			m_emerg_desc.m_agrupar.visible = False
			m_emerg_desc.m_anular.enabled = False
			m_emerg_desc.m_conformidad.visible = False				
		END IF
	END IF
	// LFE - Mejora 1/272575	
	
	
	//NCA-INICIO.DDAG-4996.22-04-2016.Validamos si el descargo esta bajo el agente ETCEE y buscamos los permisos
	//correspondientes para esta opcion.
	SELECT AGENTE 
	INTO :ls_agente
	FROM SGD_DESCARGOS WHERE NRO_DESCARGO = :il_nro_descargo;	
	
	
	SELECT DESCRIPCION
	INTO:ls_descripcion_agente
	FROM SGD_VALOR WHERE CODIF = 'TAGT' AND CODIGO = 23;
	
		
	If UPPER(ls_agente) = ls_descripcion_agente Then 
		//Busco la opcion
		if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_AP_R_ETCEE","")= 1 then 			
			m_emerg_desc.m_aprobar.enabled = false
			m_emerg_desc.m_modificar.enabled = false
			m_emerg_desc.m_rechazar.enabled = false
			m_emerg_desc.m_agrupar.visible = False
			//return
		else 
			m_emerg_desc.m_aprobar.enabled = true
			m_emerg_desc.m_modificar.enabled = true
			m_emerg_desc.m_rechazar.enabled = true
			m_emerg_desc.m_agrupar.enabled = true
		end if 		
		
	End If
	//NCA-FIN.DDAG-4996.22-04-2016.		
	

   m_emerg_desc.PopMenu(PointerX(), PointerY()+500)
   
   ii_op = gu_comunic.is_comunic.intval9
        
   if dw_lista_descargos.getitemNUMBER(ll_row,"sgd_descargos_estado")= fgci_descargo_aplazado or  dw_lista_descargos.getitemNUMBER(ll_row,"sgd_descargos_estado")= fgci_descargo_solicitado or dw_lista_descargos.getitemNUMBER(ll_row,"sgd_descargos_estado")= fgci_descargo_aprobado then
		gu_comunic.is_comunic.longval2=dw_lista_descargos.getitemnumber(ll_row,"nro_descargo")
		gu_comunic.is_comunic.longval1=dw_lista_descargos.getitemnumber(ll_row,"ccod_inst_origen")
		gu_comunic.is_comunic.strval1=dw_lista_descargos.getitemstring(ll_row,"nom_usuario")
		gu_comunic.is_comunic.datval1=dw_lista_descargos.getitemdatetime(ll_row,"sgd_descargos_f_ini_solicitado")
		gu_comunic.is_comunic.datval2=dw_lista_descargos.getitemdatetime(ll_row,"sgd_descargos_f_fin_solicitado")
	elseif dw_lista_descargos.getitemNUMBER(ll_row,"sgd_descargos_estado")= fgci_descargo_rechazado  then    
		gu_comunic.is_comunic.longval2=dw_lista_descargos.getitemnumber(ll_row,"nro_descargo")
   end if
   
	li_tension = dw_lista_descargos.GetITemNumber (ll_row,'sgd_instalacion_tension')

	// LFE - Mejora 1/272575: copiar descargos
	// Comentado por LFE
	//if ii_op>=1 and ii_op<=16 then
	if ii_op>=1 and ii_op<=18 then
	// LFE - Fin Mejora 

		////////////////////
		// Si el descargo se envia a operaciones en modo consulta o mantenimiento no se bloquea
		////////////////////
		// LFE - Mejora 1/272575: copiar descargos
		// Comentado por LFE
		//IF ii_op <> 16 then
		IF ii_op <> 16 AND ii_op <> 17 and ii_op <>18 then
		// LFE - Fin Mejora 1/272575
			li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_DESCARGOS", "NRO_DESCARGO=" + string(ll_nro_descargo),fgci_bloqueo_descargo,ll_nro_descargo)
			IF li_lock_status <> 0  THEN	              
				//   gnv_msg.f_mensaje("AD03","","",Ok!)
				//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El descargo est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado por otro usuario")
				RETURN -1
         END IF
		END IF
		
		// Compruebo que no se modifico el estado mientras tuve abierto el menu
		ll_refresco = fw_comprobar_datos (ll_row)
		IF ll_refresco = 1 THEN
			w_7101_consulta_descargos.triggerevent("ue_retrieve")
			gnv_msg.f_mensaje("CD06","","",OK!)
			IF ii_op <> 16 then					  
				gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
			END IF
			
			RETURN
		END IF

   	CHOOSE CASE ii_op
      	CASE 1	//Conformidad
									
				string ls_desc, ls_aux
				int indice, li_par
				boolean lb_sigo=true
				
				ls_desc  = gu_perfiles.of_nivel_tension('DES_ALTA')
						
				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if
										
            if dw_lista_descargos.getitemdatetime(ll_row,"f_fin_aprobado") > fgnu_fecha_actual() then
   				//if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",&
               //"$$HEX1$$bf00$$ENDHEX$$Da su conformidad a la modificaci$$HEX1$$f300$$ENDHEX$$n realizada por el centro responsable? ~r~nEn caso de que su respuesta sea SI, el descargo pasar$$HEX2$$e1002000$$ENDHEX$$a estado de Aprobado pendiente de que se active.~r~nEn caso de que su respuesta sea NO, el descargo pasar$$HEX2$$e1002000$$ENDHEX$$a estado Rechazado.",information!,okCancel!)=1 then
					li_retorno=	gnv_msg.f_mensaje("CD02","","",YesNoCancel!)													 
					
					if  li_retorno = 1 then
						li_estado_descargo = fgci_descargo_aprobado  
						li_estado_trabajo = fgci_trabajo_aprobado
					elseif li_retorno = 2 then
						li_estado_descargo = fgci_descargo_rechazado
						li_estado_trabajo = fgci_trabajo_rechazado_alfa 
					else
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						return
					end if
					//  GNU 1-2-2006. Incidencia 0/403296
//					UPDATE "SGD_DESCARGOS"  
//					SET "ESTADO" = :li_estado_descargo
//					WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
					UPDATE "SGD_DESCARGOS"  
					SET "ESTADO" = :li_estado_descargo,
					          "USUARIO"= :gs_usuario,
								 "ID_APROBACION"=:gs_usuario
					WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
					 // FIN GNU
					
					if sqlca.sqlcode=0 then
						IF fg_insertar_estado_descargo(ll_nro_descargo, li_estado_descargo, &
															ldt_inicio, ldt_fin, fgnu_fecha_actual(),"", il_instalacion_afectada) THEN
							setpointer(arrow!)
							//gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)
						
							if li_act_grafica=0 or isnull(li_act_grafica) then // DESCARGO SIN TRABAJO BDI
								gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);                        
							elseif li_act_grafica=1 THEN //and ll_trabajo>0 then 
								UPDATE SGD_TRABAJOS_BDI
								SET ESTADO_TRABAJO=:li_estado_trabajo
								WHERE NRO_DESCARGO =:ll_nro_descargo;
							
								if sqlca.sqlcode=0 then
									gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo); 
								else 
									gnv_msg.f_mensaje("AD46","","",Ok!)
									gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
								end if
							else
								gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)
							end if                                                            
						else
							messagebox("Aviso","El descargo no pudo ser actualizado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
							gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						end if
						
					else
						gnv_msg.f_mensaje("AD04","","",Ok!)
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						//messagebox("Aviso","El descargo no pudo ser actualizado.")
					end if
				else
					gnv_msg.f_mensaje("AD05","","",Ok!)
					//messagebox("Aviso","La fecha de fin de aprobado del descargo es mayor o igual que la fecha actual, deber$$HEX2$$e1002000$$ENDHEX$$revisar el descargo")

					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
				end if
			
			CASE 2	//Modificar
				
				// GNU 29-5-2007. Incidencia 0/506072
				//Comprobar niveles de tension para ese perfil
		
//				ls_desc  = gu_perfiles.of_nivel_tension('DES_AP_RECH')
//
//				for indice = 1 to len(ls_desc)
//					li_par =  mod (indice,2)
//					IF li_par <> 0 then
//						ls_aux = mid(ls_desc,indice,1)
//						if ls_aux <> ',' and lb_sigo = true then
//							if integer(ls_aux) = li_tension or ls_aux = '0' then
//								lb_sigo = false
//							end if
//						end if
//					end if
//				next
//				
//				// No tiene permiso para ese nivel
//				If lb_sigo = true then
//					gnv_msg.f_mensaje("AA08","","",OK!)
//					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
//					return 
//				end if
				
				if li_estado=fgci_descargo_definido then
					// GNU 29-5-2007. Incidencia 0/506072
					ls_desc  = gu_perfiles.of_nivel_tension('DES_ALTA')

					for indice = 1 to len(ls_desc)
						li_par =  mod (indice,2)
						IF li_par <> 0 then
							ls_aux = mid(ls_desc,indice,1)
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
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						return 
					end if
				// FIN GNU
					gu_comunic.is_comunic.longval2= 	ll_nro_descargo
					open(w_7106_solicitud_descargos_rechazados)
					gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);	
					return 
				else
					// GNU 29-5-2007. Incidencia 0/506072
					ls_desc  = gu_perfiles.of_nivel_tension('DES_AP_RECH')

					for indice = 1 to len(ls_desc)
						li_par =  mod (indice,2)
						IF li_par <> 0 then
							ls_aux = mid(ls_desc,indice,1)
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
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						return 
					end if
					// FIN GNU
					if ib_sin_interrupcion = FALSE and fw_comprueba_interrupciones_previstas(ll_nro_Descargo)  = false then
						li_res = messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El descargo no tiene definido las interrupciones previstas,$$HEX1$$bf00$$ENDHEX$$desea hacerlo ahora?~r~n(En caso negativo se convertir$$HEX2$$e1002000$$ENDHEX$$en un descargo sin interrupci$$HEX1$$f300$$ENDHEX$$n)",Information!,YesNoCancel!)
						if li_res =  1 then 
							gu_comunic.is_comunic.Programa_llamante="w_7101_interrupciones"
			  	    	open(w_7106_solicitud_descargos_rechazados)
							gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);	
							return 
						elseif li_res = 3 THEN
							gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);	
							return 
						end if
					end if 	
				
					gu_comunic.is_comunic.accion_llamada="Modificacion"
					gu_comunic.is_comunic.strval6 = "lista_descargos"
					open(w_7106_mante_descargos)
					gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);	
					//SRE 09/04/2008.
					lb_envia_ocen=TRUE
				end if						
			CASE 3  //Aprobar	

				//Comprobar niveles de tension para ese perfil
				ls_desc  = gu_perfiles.of_nivel_tension('DES_AP_RECH')
						
				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if

				//Busco interrupciones en niveles superiores
				// Retorna -1 si existe alguna que englobe a la actual
				// 0 Si no ha encontrado alguna que englobe la actual

            // Aqui se comprueba que no haya otro descargo solicitado que tenga ya la interrupcion definida
      		setpointer(hourglass!)
            ls_respuesta = fw_busca_int_padre (il_nro_descargo)                                             
            if (ls_respuesta <> "" ) then
					setpointer(arrow!)
              			messagebox("Aviso",ls_respuesta)
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
               			return
				end if
				
				if ib_sin_interrupcion = FALSE and fw_comprueba_interrupciones_previstas(ll_nro_Descargo)  = false then
					li_res = messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El descargo no tiene definido las interrupciones previstas,$$HEX1$$bf00$$ENDHEX$$desea hacerlo ahora?~r~n(En caso negativo se convertir$$HEX2$$e1002000$$ENDHEX$$en un descargo sin interrupci$$HEX1$$f300$$ENDHEX$$n)",Information!,YesNoCancel!)
					if  li_res =  1 then 
						gu_comunic.is_comunic.Programa_llamante="w_7101_interrupciones"
			      	open(w_7106_solicitud_descargos_rechazados)
						gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
						return 
					elseif li_res = 3 THEN
						gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
						return 
					end if
			 	end if 
				 
				gu_comunic.is_comunic.accion_llamada="Aprobacion"
				gu_comunic.is_comunic.strval6 = "lista_descargos"
				open(w_7106_mante_descargos)
				gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
				//SRE 09/04/2008.
				lb_envia_ocen=TRUE
				setpointer(arrow!)																		  
			
			CASE 11	//APLAZAR
			
				//Comprobar niveles de tension para ese perfil
																			
				ls_desc  = gu_perfiles.of_nivel_tension('DES_AP_RECH')
						
				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if		
										                                    
				if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de que quiere aplazar el descargo?",Question!,YesNo!)=1 then 
   				setpointer(hourglass!)
               			// GNU 1-2-2006. Incidencia 0/403296
//					UPDATE "SGD_DESCARGOS"  
//               SET "ESTADO" = :fgci_descargo_aplazado
//               WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;         
					UPDATE "SGD_DESCARGOS"  
               			SET "ESTADO" = :fgci_descargo_aplazado,
						   "USUARIO"= :gs_usuario
               			WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;      
               			// FIN GNU
					if sqlca.sqlcode<>0 then
						setpointer(arrow!)
						gnv_msg.f_mensaje("AD04","","",Ok!)
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo)
                  //messagebox("Aviso","El descargo no pudo ser actualizado.")
					else
					
						IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_aplazado, &
																ldt_inicio, ldt_fin, fgnu_fecha_actual(),"",&
																il_instalacion_afectada) THEN
							setpointer(arrow!)
							gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)
							//SRE 09/04/2008.
							lb_envia_ocen=TRUE
						else
							messagebox("Aviso","El descargo no pudo ser actualizado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
							gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo)
						end if
				  end if	
			  else
				  gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);	
			  end if
				
			CASE 4 ,15 	//Rechazar / Suspender
			
				//Comprobar niveles de tension para ese perfil
																													
				ls_desc  = gu_perfiles.of_nivel_tension('DES_AP_RECH')
						
				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if
				
				if li_estado = fgci_descargo_aprobado then  // EN EL CASO DE SUSPENDER
					gu_comunic.is_comunic.accion_llamada="Suspension"
					gu_comunic.is_comunic.strval6 = "lista_descargos"
					
					open(w_7106_mante_descargos)
					gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
					//SRE 09/04/2008.
					lb_envia_ocen=TRUE
				else
					gu_comunic.is_comunic.accion_llamada="Rechazo"
					gu_comunic.is_comunic.strval6 = "lista_descargos"
					open(w_7106_mante_descargos)

					gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);	
					//SRE 09/04/2008.
					lb_envia_ocen=TRUE
				end if
 			
			CASE 5	//Solicitar
				
				//Comprobar niveles de tension para ese perfil									
				ls_desc  = gu_perfiles.of_nivel_tension('DES_ALTA')
		
				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if
										
				if li_estado = fgci_Descargo_rechazado then 
					// meter aqui
					if ls_usuario_solicitante=gs_usuario then
						gu_comunic.is_comunic.Programa_llamante="w_7101_consulta"
						gu_comunic.is_comunic.accion_llamada="Rechazo"
						str_descargos.ldt_ini = ldt_inicio
						str_descargos.ldt_fin =ldt_fin
						OpenWithParm(w_7106_solicitud_descargos_rechazados,str_Descargos)
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					else
						//No pertenece al usuario actual
						gnv_msg.f_mensaje("AD36","","",Ok!)
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						return             
					end if														
				else
											
					if dw_lista_descargos.getitemdatetime(ll_row,"sgd_descargos_f_ini_solicitado") > fgnu_fecha_actual() then
					  //if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea solicitar el descargo?",information!,okcancel!)=1 then
						if gnv_msg.f_mensaje("CD03","","",OkCancel!) = 1 then  
							setpointer(Hourglass!)
							// GNU 1-2-2006. Incidencia 0/403296																		
//							UPDATE "SGD_DESCARGOS"  
//							SET "ESTADO" =:fgci_descargo_solicitado,
//								  "F_SOLICITADO" = sysdate
//							WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
							UPDATE "SGD_DESCARGOS"  
							SET "ESTADO" =:fgci_descargo_solicitado,
								  "F_SOLICITADO" = sysdate,
								  "USUARIO"= :gs_usuario
							WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;	  
							// FIN GNU
							if sqlca.sqlcode=0 then
								IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_solicitado, &
													ldt_inicio, ldt_fin, fgnu_fecha_actual(),"", &
													il_instalacion_afectada) THEN
								
									if li_act_grafica=0 then // DESCARGO SIN TRABAJO BDI
									
										gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);                        
									
									elseif li_act_grafica=1 then //and ll_trabajo>0 then 
										
										UPDATE SGD_TRABAJOS_BDI
										SET ESTADO_TRABAJO=:fgci_trabajo_solicitado
										WHERE NRO_DESCARGO=:ll_nro_descargo;
										
										if sqlca.sqlcode=0 then
											gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo); 
										else 
											setpointer(arrow!)
											gnv_msg.f_mensaje("AD46","","",Ok!)
											gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
										end if
									end if
								ELSE
									setpointer(arrow!)
									Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El descargo no pudo ser solicitado debido a que no se ha podido guardar la informaci$$HEX1$$f300$$ENDHEX$$n asociada a sus estados")
									gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
								END IF
								
							else
								setpointer(arrow!)
								gnv_msg.f_mensaje("AD06","","",Ok!)
								//messagebox("Aviso","El descargo no pudo ser solicitado.")
								gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
							end if
							
						else 
							gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						end if
					
					else
						setpointer(arrow!)
						gnv_msg.f_mensaje("AD07","","",Ok!)
						//messagebox("Aviso","La fecha de Inicio en la solicitud del descargo es menor o igual que la fecha actual, deber$$HEX2$$e1002000$$ENDHEX$$revisar el descargo")
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
				  end if
				 // gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);	  
				end if
				setpointer(arrow!)

			CASE 6	//Activar
				//Comprobar niveles de tension para ese perfil									
				ls_desc  = gu_perfiles.of_nivel_tension('DES_ALTA')
						
				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if									

				setpointer(hourglass!)
            ls_respuesta = fw_busca_int_padre (il_nro_descargo)                                             
            if (ls_respuesta <> "" ) then
	         	messagebox("Aviso",ls_respuesta)
		 			setpointer(arrow!)
					 gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
               return
            end if
				
				setpointer(arrow!)

            if dw_lista_descargos.getitemdatetime(ll_row,"f_fin_aprobado") <= fgnu_fecha_actual() then
            	gnv_msg.f_mensaje("AD08","","",Ok!)
               //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha en que finalizaba el descargo es ahora menor que la fecha actual. El descargo dejar$$HEX2$$e1002000$$ENDHEX$$de estar aprobado y pasar$$HEX2$$e1002000$$ENDHEX$$a estado 'No Activado'")
					// GNU 1-2-2006. Incidencia 0/403296
//					UPDATE "SGD_DESCARGOS"  
//               SET "ESTADO" = :fgci_descargo_no_activado
//					WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
					
					UPDATE "SGD_DESCARGOS"  
               			SET "ESTADO" = :fgci_descargo_no_activado,
					          "USUARIO"= :gs_usuario
					WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
					// FIN GNU
					if sqlca.sqlcode=0 then
						IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_no_activado, &
															ldt_inicio, ldt_fin, fgnu_fecha_actual(),"", &
															il_instalacion_afectada) THEN
               		gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
							//SRE 09/04/2008.
							lb_envia_ocen=TRUE
						ELSE
							messagebox("Aviso","El descargo no pudo ser actualizado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
							gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo)
						END IF
               else
               	gnv_msg.f_mensaje("AD04","","",Ok!)
                  //messagebox("Aviso","El Descargo no pudo ser actualizado.")
                  gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
               end if
				else
		// GNU 9-2-2006. Mejora 1						
//            	if dw_lista_descargos.getitemdatetime(ll_row,"f_ini_aprobado") <= fgnu_fecha_actual() then
            	if fg_verifica_parametro ("Activacion descargo anterior cumplir fecha") or &
		   			dw_lista_descargos.getitemdatetime(ll_row,"f_ini_aprobado") <= fgnu_fecha_actual() then
		// FIN GNU
						gu_comunic1.is_comunic.programa_llamante = "w_7101_consulta_descargos"
						gu_comunic1.is_comunic.accion_llamada = "Alta"
						gu_comunic1.is_comunic.decval1 = dw_lista_descargos.getitemnumber(ll_row,"ccod_inst_origen")       
						gu_comunic1.is_comunic.intval3 = gi_nro_centro
						gu_comunic1.is_comunic.intval4 = gi_nro_cmd
						gu_comunic1.is_comunic.intval5 = gi_nro_puesto
						// GNU 18-7-2006. Incidencia pruebas SAT
	            	if fg_verifica_parametro ("Activacion descargo anterior cumplir fecha") and &
							dw_lista_descargos.getitemdatetime(ll_row,"f_ini_aprobado") > fgnu_fecha_actual() then
							gu_comunic1.is_comunic.datval1 = fgnu_fecha_actual()
						else	
							gu_comunic1.is_comunic.datval1 = dw_lista_descargos.getitemdatetime(ll_row,"sgd_descargos_f_ini_solicitado")
						end if	
						// FIN GNU
						gu_comunic1.is_comunic.datval2 = fgnu_fecha_actual()

						setpointer(Hourglass!)
						IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_activado, &
																 ldt_inicio, ldt_fin, fgnu_fecha_actual(),"", &
																 il_instalacion_afectada) THEN

							fw_generar_incidencia()
							setpointer(arrow!)
							gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
							//SRE 09/04/2008.
							lb_envia_ocen=TRUE
						ELSE
							setpointer(arrow!)
							messagebox("Aviso","El descargo no pudo ser actualizado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
							gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						END IF						
					else
               	gnv_msg.f_mensaje("IA06","","",Ok!)
                  //messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Todav$$HEX1$$ed00$$ENDHEX$$a no se puede activar el descargo")
                  gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
               end if
				end if

			CASE 7
				//Comprobar niveles de tension para ese perfil
				ls_desc  = gu_perfiles.of_nivel_tension('DES_ALTA')

				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if
			
				//SRE No permitido agrupar para descargos que vienen de OCEN.

				Long ll_nro_ocen

				SELECT COUNT(*)
				INTO :ll_nro_ocen
				FROM "SGD_DESCARGOS"
				WHERE "SGD_DESCARGOS"."NRO_DESCARGO"= :ll_nro_descargo AND
						"SGD_DESCARGOS"."NRO_OT_OCEN" IS NOT NULL;

				IF ll_nro_ocen <> 0 THEN
					//el descargo viene de OCEN 
					MessageBox("Aviso","No se puede agrupar descargos cuyo origen sea OCEN")
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				END IF
				// Agrupar descargos
				gu_comunic.is_comunic.longval1 = ll_nro_descargo
				gu_comunic.is_comunic.longval2 = il_instalacion_afectada
				open(w_7005_agrupar_descargos)
				gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
			
			CASE 8
				//Comprobar niveles de tension para ese perfil
				ls_desc  = gu_perfiles.of_nivel_tension('DES_ALTA')

				for indice = 1 to len(ls_desc)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_desc,indice,1)
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
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				end if

				// Gestion Descargos
				// Muestra en la ventana los datos de la agrupacion
				//SRE No permitido agrupar para descargos que vienen de OCEN.

				Long ll_nro_ocen2

				SELECT COUNT(*)
				INTO :ll_nro_ocen2
				FROM "SGD_DESCARGOS"
				WHERE "SGD_DESCARGOS"."NRO_DESCARGO"= :ll_nro_descargo AND
						"SGD_DESCARGOS"."NRO_OT_OCEN" IS NOT NULL;

				IF ll_nro_ocen2 <> 0 THEN
					//el descargo viene de OCEN 
					MessageBox("Aviso","No se puede agrupar descargos cuyo origen sea OCEN")
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
					return 
				END IF



				gu_comunic.is_comunic.longval4 = ll_nro_Descargo 
				if ll_agrupado = -1 then
					// Buscar en SGD_DESCARGOS_AGRUPADOS EL NUMERO DE AGRUPACION Y PASAR COMO
					// ARGUMENTO DE LA DATAWINDOW
					setpointer(hourglass!)       
					SELECT "SGD_DESCARGOS_AGRUPADOS"."NRO_AGRUPACION"  
					INTO :ll_agrupado  
					FROM "SGD_DESCARGOS_AGRUPADOS"  
					WHERE "SGD_DESCARGOS_AGRUPADOS"."NRO_DESCARGO" = :il_nro_descargo  ;
				end if
						 
				SELECT "SGD_DESCARGOS"."NRO_DESCARGO",   
						 "SGD_INSTALACION"."NOM_INSTALACION"  
				INTO :ll_new_descargo,   
					  :ls_nombre
				FROM "SGD_DESCARGOS",   
					  "SGD_INSTALACION"  
				WHERE ( "SGD_DESCARGOS"."COD_INST_ORIGEN" = "SGD_INSTALACION"."NRO_INSTALACION" ) and  
						( "SGD_INSTALACION"."BDI_JOB" = 0 ) AND 	
						( ( "SGD_DESCARGOS"."NRO_AGRUPACION" = :ll_agrupado) )   ;
						 
				gu_comunic.is_comunic.strval9  = ls_nombre
				gu_comunic.is_comunic.longval1 = ll_agrupado
				gu_comunic.is_comunic.longval2 = ll_new_descargo
				setpointer(arrow!)
				open(w_7006_gest_agrupacion)
				gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
										
			CASE 9 //Pte. ACTUALIZAR bdi
				setpointer(hourglass!)                                        
            		// GNU 1-2-2006. Incidencia 0/403296
//				UPDATE "SGD_DESCARGOS"  
//            SET "ESTADO" = :fgci_descargo_pendiente_BDI
//            WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;

				UPDATE "SGD_DESCARGOS"  
            			SET "ESTADO" = :fgci_descargo_pendiente_BDI,
					   "USUARIO"= :gs_usuario
           			 WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
            		// FIN GNU
				if sqlca.sqlcode=0 then
					IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_pendiente_BDI, &
															 ldt_inicio, ldt_fin, fgnu_fecha_actual(),"", &
															 il_instalacion_afectada) THEN

						gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)
						setpointer(arrow!)
					ELSE
						setpointer(arrow!)
						messagebox("Aviso","El descargo no pudo ser actualizado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo)
					END IF
            else
					setpointer(arrow!)
               gnv_msg.f_mensaje("AD04","","",Ok!)
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
               //messagebox("Aviso","El descargo no pudo ser actualizado.")
	         end if
		
			CASE 12 // ANULAR
         	If messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de que quiere anular el descargo?",Question!,YesNo!)=1 then 
					setpointer(hourglass!)
					// GNU 1-2-2006. Incidencia 0/403296
//					UPDATE "SGD_DESCARGOS"  
//					SET "ESTADO" = :fgci_descargo_ANULADO
//					WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
					UPDATE "SGD_DESCARGOS"  
					SET "ESTADO" = :fgci_descargo_ANULADO,
					          "USUARIO"= :gs_usuario
					WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
					// FIN GNU
					if sqlca.sqlcode=0 then
						
						IF ll_agrupado > 0  THEN
						// GNU 1-2-2006. Incidencia 0/403296	
//         					UPDATE "SGD_DESCARGOS"  
//							SET "ESTADO" = :fgci_descargo_ANULADO
//							WHERE "SGD_DESCARGOS"."NRO_DESCARGO" in (SELECT NRO_DESCARGO 
//																									FROM SGD_DESCARGOS_AGRUPADOS 
//																									WHERE NRO_AGRUPACION = :ll_agrupado
//																									AND NRO_DESCARGO <> :ll_nro_descargo); 
	         					UPDATE "SGD_DESCARGOS"  
							SET "ESTADO" = :fgci_descargo_ANULADO,
								   "USUARIO"= :gs_usuario
							WHERE "SGD_DESCARGOS"."NRO_DESCARGO" in (SELECT NRO_DESCARGO 
																									FROM SGD_DESCARGOS_AGRUPADOS 
																									WHERE NRO_AGRUPACION = :ll_agrupado
																									AND NRO_DESCARGO <> :ll_nro_descargo); 	
							// FIN GNU																									
        				END IF
													
						IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_ANULADO, &
															 	 ldt_inicio, ldt_fin, fgnu_fecha_actual(),"", &
																 il_instalacion_afectada) THEN

							if li_act_grafica=0 then // DESCARGO SIN TRABAJO BDI
								gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo); 
								//SRE 09/04/2008.
								lb_envia_ocen=TRUE                       
							elseif li_act_grafica=1 then // and ll_trabajo>0 then 
								UPDATE SGD_TRABAJOS_BDI
								SET ESTADO_TRABAJO=:fgci_trabajo_anulado
								WHERE NRO_DESCARGO=:ll_nro_descargo;
								
								if sqlca.sqlcode=0 then
									gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo); 
									//SRE 09/04/2008.
									lb_envia_ocen=TRUE
								else 
									setpointer(arrow!)
									gnv_msg.f_mensaje("AD46","","",Ok!)
									gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
								end if
													 
							else
								if li_estado = fgci_descargo_definido then // NO TIENE TRABAJO BDI
									gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);                        
									//SRE 09/04/2008.
									lb_envia_ocen=TRUE
								else // RESTO DE ESTADOS  TIENEN TRABAJO BDI 
									setpointer(arrow!)	
									gnv_msg.f_mensaje("AD46","","",Ok!)
									gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
								end if 
													
							end if
						ELSE
							setpointer(arrow!)	
							messagebox("Aviso","El descargo no pudo ser actualizado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
							gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						END IF
					else
						setpointer(arrow!)
						gnv_msg.f_mensaje("AD04","","",Ok!)
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo)
                  //messagebox("Aviso","El descargo no pudo ser actualizado.")
               end if	
					setpointer(arrow!)	  
				else
					gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo)
				end if
										  
			CASE 13 //  GESTION EN OPERACIONES
			
				if isvalid(gu_operaciones) then 
					ll_refresco = fw_comprobar_datos (ll_row)
					IF ll_refresco = 1 THEN
						w_7101_consulta_descargos.triggerevent("ue_retrieve")
						gnv_msg.f_mensaje("CD06","","",OK!)
						gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
						RETURN
					ELSE
						// BANDERA PARA ENVIAR A OPERACION
						UPDATE "SGD_DESCARGOS"  
                  SET "BLOQUEO_ANULACION" = 1
                  WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
                  
						if sqlca.sqlcode=0 then
                  	gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
													
							//AHM (19/02/2010) Certificacion windows XP
							//if gu_operaciones.of_enviar_descargo_operacion(ll_nro_descargo) <> 1 then 	
							if gu_operacionSgi.of_enviar_descargo_operacion(ll_nro_descargo) <> 1 then 	
								gnu_u_transaction.uf_lock(THIS, "SGD_DESCARGOS", "NRO_DESCARGO=" + string(ll_nro_descargo),fgci_bloqueo_descargo,ll_nro_descargo)
								// ERROR BAJAMOS LA BANDERA
								UPDATE "SGD_DESCARGOS"  
   		               SET "BLOQUEO_ANULACION" = 0
         				   WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
								
								gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
							end if												
						
						else
                  	gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
                  end if
						
					END IF
				end if
				//gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
		
			CASE 16 //  CONSULTA EN  OPERACIONES
				setpointer(hourglass!)
				if isvalid(gu_operaciones) then 
					ll_refresco = fw_comprobar_datos (ll_row)
					IF ll_refresco = 1 THEN
						w_7101_consulta_descargos.triggerevent("ue_retrieve")
						setpointer(arrow!)
						gnv_msg.f_mensaje("CD06","","",OK!)
						RETURN
					ELSE
						//AHM (19/02/2010) Certificacion windows XP
						//gu_operaciones.of_enviar_descargo_consulta(ll_nro_descargo)
						gu_operacionSgi.of_enviar_descargo_consulta(ll_nro_descargo)

					END IF											
					setpointer(arrow!)	
				end if
				//gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
																			  
			CASE 14 //  RECHAZADO_BDI
				// SOLO PARA EL CASO DE NIVELES DE TENSION NO GESTIONADOS POR OPERACION
				IF  li_act_grafica=1 then // and ll_trabajo>0 then 
					gu_comunic.is_comunic.accion_llamada="Rechazado BDI"
					gu_comunic.is_comunic.strval6 = "lista_descargos"
					Open (w_7106_mante_descargos)
				END IF
            
				gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo);
			// LFE - Mejora 1/272575: copiar descargos
			CASE 17 //  COPIAR DESCARGO
				gu_comunic.is_comunic.accion_llamada="alta"
				gu_comunic.is_comunic.Programa_llamante="w_7101_consulta"
				gu_comunic.is_comunic.intval1=d_ambito.getitemnumber(1,"nro_centro")
				gu_comunic.is_comunic.intval2=d_ambito.getitemnumber(1,"nro_cmd") 
				gu_comunic.is_comunic.intval3=d_ambito.getitemnumber(1,"nro_mesa") 
				gu_comunic.is_comunic.strval6 = ""
				gu_comunic.is_comunic.longval1 = ll_nro_descargo

				Open(w_7106_solicitud_descargos_copiar)
			// LFE - Fin Mejora 1/272575
	
			CASE 18
				//SRE
				lb_envia_ocen=TRUE
			CASE ELSE
				gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)// 
                                        
		END CHOOSE
      //AHM (02/03/2009) OSGI no debe mandar estados de descargos a OCEN
/*		//SRE ENVIO DEL NUEVO ESTADO
		IF (lb_envia_ocen=TRUE)  THEN
			//Aqui falta meter el codigo para poder hacer el envio en caso de que est$$HEX2$$e9002000$$ENDHEX$$
			//marcado como OCEN.
			openwithparm(w_7107_envio_estado_descargo_ocen,ll_nro_descargo)
		END IF*/

 		parent.triggerevent("ue_armar_sql")
		// gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)// DSA 16/12/99			
	end if
end if  

end event

event ue_key_down;/////////////////////////////////////////////////////
//	Permite moverse con los cursores desde el teclado
// GSE 18/05/2001
//
//////////////////////////////////////////////////////
long ll_row

IF keyflags = 0 and this.rowcount() > 1 THEN  
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyUpArrow! and ll_row > 1 THEN
		this.selectrow(0,False)
      ll_row = ll_row - 1		
		this.selectrow(ll_row,true)

	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
		this.selectrow(0,False)
		ll_row = ll_row + 1
		this.selectrow(ll_row ,true)

	ELSEIF Key = KeyLeftArrow! THEN
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
END IF
end event

event scrollvertical;call super::scrollvertical;//***************************************
//**  OSGI 2001.1  	27/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long 	 ll_row, ll_nro_descargo, ll_cxt
String ls_duracion, ls_cxt, ls_pxt
Double ld_pxt
string ls_estado
boolean lb_desc_descargos

lb_desc_descargos=fg_verifica_parametro("descripcion descargos")
sle_1.text=string(this.rowcount()) // GNU 30-5-2007. Mejora 1/328385

FOR ll_row = ii_fila_desde TO this.RowCount() 
	If ib_mod_cxt_pxt Then
//		ll_row = row
		ll_cxt = 0
		ld_pxt = 0
		ll_nro_descargo = dw_lista_descargos.GetItemNumber(ll_row , "nro_descargo" )
		ls_duracion = fg_duracion_int_descargo(ll_nro_descargo)
		
		
		ls_cxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		ls_pxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		
		If IsNumber(ls_cxt) then ll_cxt = long(ls_cxt)	
		If IsNumber(ls_pxt) then ld_pxt = Double(ls_pxt)
		
		
		dw_lista_descargos.SetItem(ll_row,"c_ext_duracion", ll_cxt)
		dw_lista_descargos.SetItem(ll_row,"c_ext_paxtc", ld_pxt)
	End If
	
	ls_estado = dw_lista_descargos.GetItemString(ll_row , "descripcion" )	
	
	if lb_desc_descargos and IsNumber(ls_estado) then

		SELECT DESCRIPCION
		INTO :ls_estado
		FROM GI_DESC_DESCARGOS_HIST
		WHERE CODIGO=:ls_estado;

		dw_lista_descargos.SetItem(ll_row,"descripcion", ls_estado)
	end if
	
NEXT
ii_fila_desde = ll_row
//***************************************
//**  OSGI 2001.1  	27/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event constructor;call super::constructor;dw_lista_descargos.modify("sgd_descargos_ind_advertencia.protect="+String(ii_habilitado))
end event

event itemchanged;call super::itemchanged;integer li_advertencia, li_tension, indice, li_par, li_advert
string ls_desc, ls_aux, ls_accion
boolean lb_sigo
long ll_descargo

li_advert = integer(data)

ll_descargo = This.GetItemNumber(row, "nro_descargo")

//AHM (11/04/2011) ASUR 1015294
//UPDATE "SGD_DESCARGOS"
//SET "IND_ADVERTENCIA"  = :li_advert
//WHERE  ( "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_descargo );

if sqlca.sqlcode<>0	then 
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se ha producido el siguiente error: " + sqlca.sqlerrtext ,exclamation!,ok!)
		gnu_u_transaction.uf_rollback();
		return 0
end if

gnu_u_transaction.uf_commit();


li_advertencia = 1

if data = "1" then
	
	if row > 0 then
		if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_OBS","ACC_MANTEN")= 1 then
			// El usuario tiene acceso de mantenimiento.
			// Se comprueba el nivel de tensi$$HEX1$$f300$$ENDHEX$$n.
			
			li_tension = dw_lista_descargos.getitemNUMBER(row,"sgd_instalacion_tension")
			ls_desc  = gu_perfiles.of_nivel_tension('DES_OBS')
	
			for indice = 1 to len(ls_desc)
				li_par =  mod (indice,2)
				IF li_par <> 0 then
					ls_aux = mid(ls_desc,indice,1)
					if ls_aux <> ',' and lb_sigo = true then
						if integer(ls_aux) = li_tension or ls_aux = '0' then
							lb_sigo = false
						end if
					end if
				end if
			next
			// No tiene permiso para ese nivel
			If lb_sigo = true then
				gu_comunic.is_comunic.accion_llamada = "Consulta"
			else
				gu_comunic.is_comunic.accion_llamada="Modificacion" 
				ls_accion = "Modificacion"
			end if
			
		else
			gu_comunic.is_comunic.accion_llamada = "Consulta"
		end if
			
		double_click = true
		gu_comunic.is_comunic.longval1 = dw_lista_descargos.getitemnumber(row,"nro_descargo") // Variable que tiene el valor a recuperar
		gu_comunic.is_comunic.decval1 = dw_lista_descargos.getitemnumber(row,"sgd_instalacion_nro_instalacion") // Variable que tiene el valor a recuperar
		gu_comunic.is_comunic.strval5 = dw_lista_descargos.getitemstring(row,"sgd_instalacion_nom_instalacion") // Variable que tiene el valor a recuperar
		gu_comunic.is_comunic.strval6 = "lista_descargos"
		//		  if gnu_u_transaction.uf_lock(this,"SGD_DESCARGOS",&
		//		  												"NRO_DESCARGO = " + &
		//															string(gu_comunic.is_comunic.longval1)) = 100 then
		//				double_click = false
		//			  	return 
		//  		  end if					 
		//timer(0,w_7101_consulta_descargos)
		IF gu_comunic.is_comunic.accion_llamada="Modificacion" THEN
			IF gnu_u_transaction.uf_lock(THIS, "SGD_DESCARGOS", "NRO_DESCARGO=" + &
					string(gu_comunic.is_comunic.longval1),fgci_bloqueo_descargo,gu_comunic.is_comunic.longval1) <> 0 THEN
				
				IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea abrir el descargo en modo consulta?", question!, YesNo!) = 1 THEN
					gu_comunic.is_comunic.accion_llamada = "Consulta"
					ls_accion = "Consulta"
				ELSE
					return
				END IF
			END IF
		END IF
	
	
		post openwithparm (w_7102_mantenimiento_descargos, li_advertencia)
		gu_comunic.is_comunic.strval6 = ""
		double_click = false
		
		IF ls_accion = "Modificacion" THEN
			gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,dw_lista_descargos.getitemnumber(row,"nro_descargo"))
		END IF
		
	end if
//AHM(20/04/2011) ASUR 1060236	
ELSE
	
//	IF gnu_u_transaction.uf_lock(THIS, "SGD_DESCARGOS", "NRO_DESCARGO=" + &
//					string(ll_descargo),fgci_bloqueo_descargo,ll_descargo) <> 0 THEN
//		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No es posible realizar el cambio", Information!)
//		dw_lista_descargos.setitem(row,"sgd_descargos_ind_advertencia", 0)
//	ELSE
//		
//		UPDATE sgd_descargos
//		SET ind_advertencia = 0
//		WHERE nro_descargo = :ll_descargo;
//		
//		if sqlca.sqlcode<>0 then 
//			 messageBox("Atencion", "Se ha producido un error en la actualizaci$$HEX1$$f300$$ENDHEX$$n del campo advert")
//			 //gnu_u_transaction.uf_rollback()
//			 gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,dw_lista_descargos.getitemnumber(row,"nro_descargo"))
//		ELSE
//			gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,dw_lista_descargos.getitemnumber(row,"nro_descargo"))
//		end if 
//		
//		
//	END IF
end if


end event

type st_2 from statictext within w_7101_consulta_descargos
integer x = 146
integer y = 24
integer width = 293
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "  Ambito "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_7101_consulta_descargos
boolean visible = false
integer x = 1792
integer y = 228
integer width = 343
integer height = 64
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

type dw_desc_descargo from datawindow within w_7101_consulta_descargos
boolean visible = false
integer x = 2322
integer y = 212
integer width = 1056
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_desc_descargo"
boolean minbox = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_5 from radiobutton within w_7101_consulta_descargos
boolean visible = false
integer x = 169
integer y = 996
integer width = 402
integer height = 64
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

type rb_6 from radiobutton within w_7101_consulta_descargos
boolean visible = false
integer x = 722
integer y = 996
integer width = 366
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Comercial"
end type

type cb_total from commandbutton within w_7101_consulta_descargos
integer x = 1463
integer y = 620
integer width = 78
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
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
dw_lista_descargos.Object.DataWindow.Retrieve.AsNeeded='No'
ll_row = dw_lista_descargos.RowCount()
////ib_total = true
d_filtro.SetItem(1,'ai_reg_seleccionados',ll_row)
sle_1.text=string(ll_row)
st_1.text = string(ll_row)
dw_lista_descargos.Object.DataWindow.Retrieve.AsNeeded='Yes'
end event

type sle_1 from singlelineedit within w_7101_consulta_descargos
integer x = 1243
integer y = 608
integer width = 183
integer height = 96
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
string text = "0"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_7101_consulta_descargos
integer x = 1170
integer y = 480
integer width = 439
integer height = 128
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Registros Seleccionados:"
boolean focusrectangle = false
end type

type rb_7 from radiobutton within w_7101_consulta_descargos
integer x = 722
integer y = 852
integer width = 320
integer height = 64
boolean bringtotop = true
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

event clicked;d_solicitud.object.deteccion_titulo.text = " Fecha de Solicitud "

end event

type gb_1 from groupbox within w_7101_consulta_descargos
integer x = 155
integer y = 812
integer width = 951
integer height = 180
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
end type

type gb_3 from groupbox within w_7101_consulta_descargos
boolean visible = false
integer x = 155
integer y = 948
integer width = 951
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
end type

type gb_4 from groupbox within w_7101_consulta_descargos
integer x = 1157
integer y = 416
integer width = 471
integer height = 304
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
end type


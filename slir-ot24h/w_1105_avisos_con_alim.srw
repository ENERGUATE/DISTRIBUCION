HA$PBExportHeader$w_1105_avisos_con_alim.srw
$PBExportComments$Contiene el obj. jerarquico de instalaciones y la lista de avisos
forward
global type w_1105_avisos_con_alim from w_sgigenerica
end type
type st_2 from statictext within w_1105_avisos_con_alim
end type
type p_1 from picture within w_1105_avisos_con_alim
end type
type dw_lista_instal from datawindow within w_1105_avisos_con_alim
end type
type st_incidencias from statictext within w_1105_avisos_con_alim
end type
type sle_cant_cli_imp from singlelineedit within w_1105_avisos_con_alim
end type
type st_cant_avi_pel from statictext within w_1105_avisos_con_alim
end type
type p_incidencia from picture within w_1105_avisos_con_alim
end type
type p_importantes from picture within w_1105_avisos_con_alim
end type
type p_peligro from picture within w_1105_avisos_con_alim
end type
type sle_cant_avi_pel from singlelineedit within w_1105_avisos_con_alim
end type
type dw_inc_asoc from datawindow within w_1105_avisos_con_alim
end type
type p_indicador from picture within w_1105_avisos_con_alim
end type
type p_inc_sel_2 from picture within w_1105_avisos_con_alim
end type
type p_indicador_2 from picture within w_1105_avisos_con_alim
end type
type p_inc_sel from picture within w_1105_avisos_con_alim
end type
type st_inc_sel from multilineedit within w_1105_avisos_con_alim
end type
type gb_incidencia from groupbox within w_1105_avisos_con_alim
end type
type gb_indicativos_inst from groupbox within w_1105_avisos_con_alim
end type
type st_otras from statictext within w_1105_avisos_con_alim
end type
type dw_otras_inst from u_inst_2011_otras_smt within w_1105_avisos_con_alim
end type
type st_clientes_pot_t from statictext within w_1105_avisos_con_alim
end type
type tv_1 from uo_man_instalac within w_1105_avisos_con_alim
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1105_avisos_con_alim
end type
type st_inc_sel_2 from multilineedit within w_1105_avisos_con_alim
end type
type st_1 from statictext within w_1105_avisos_con_alim
end type
type gb_incidencias from groupbox within w_1105_avisos_con_alim
end type
type cbx_filtrar_fechas from checkbox within w_1105_avisos_con_alim
end type
type cbx_filtrar_alcances from checkbox within w_1105_avisos_con_alim
end type
type gb_2 from groupbox within w_1105_avisos_con_alim
end type
type dw_filtro_fechas from ue_gen_filtro_fechas_horas within w_1105_avisos_con_alim
end type
type dw_alcances from datawindow within w_1105_avisos_con_alim
end type
type st_4 from statictext within w_1105_avisos_con_alim
end type
type st_5 from statictext within w_1105_avisos_con_alim
end type
type st_6 from statictext within w_1105_avisos_con_alim
end type
type em_desde from editmask within w_1105_avisos_con_alim
end type
type cbx_numero from checkbox within w_1105_avisos_con_alim
end type
type mle_1 from multilineedit within w_1105_avisos_con_alim
end type
type gb_1 from groupbox within w_1105_avisos_con_alim
end type
type gb_3 from groupbox within w_1105_avisos_con_alim
end type
type gb_4 from groupbox within w_1105_avisos_con_alim
end type
type p_orden1 from picture within w_1105_avisos_con_alim
end type
type cbx_filtrar_activos from checkbox within w_1105_avisos_con_alim
end type
type dw_avisos_activos from datawindow within w_1105_avisos_con_alim
end type
type gb_5 from groupbox within w_1105_avisos_con_alim
end type
type em_hasta from editmask within w_1105_avisos_con_alim
end type
type dw_lista_avisos from u_avi_2001_pr_lista_avisos_guat within w_1105_avisos_con_alim
end type
end forward

global type w_1105_avisos_con_alim from w_sgigenerica
integer width = 3653
integer height = 2032
string title = "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos"
string menuname = "md_gestion_avisos"
long backcolor = 79741120
string icon = "gestavi.ico"
event ue_criterio_orden pbm_custom49
event ue_crear_incidencia pbm_custom51
event ue_reseteo pbm_custom53
event ue_refrescar pbm_custom55
event ue_seleccionar_inc pbm_custom56
event ue_armar_sql pbm_custom66
event ue_sum_imp ( )
event ue_brigadas ( )
event ue_mostraravisos ( )
event ue_mensage ( )
event m_cambiarincidencia ( )
event ue_meliminarasociacineincidencia ( )
st_2 st_2
p_1 p_1
dw_lista_instal dw_lista_instal
st_incidencias st_incidencias
sle_cant_cli_imp sle_cant_cli_imp
st_cant_avi_pel st_cant_avi_pel
p_incidencia p_incidencia
p_importantes p_importantes
p_peligro p_peligro
sle_cant_avi_pel sle_cant_avi_pel
dw_inc_asoc dw_inc_asoc
p_indicador p_indicador
p_inc_sel_2 p_inc_sel_2
p_indicador_2 p_indicador_2
p_inc_sel p_inc_sel
st_inc_sel st_inc_sel
gb_incidencia gb_incidencia
gb_indicativos_inst gb_indicativos_inst
st_otras st_otras
dw_otras_inst dw_otras_inst
st_clientes_pot_t st_clientes_pot_t
tv_1 tv_1
dw_ambito dw_ambito
st_inc_sel_2 st_inc_sel_2
st_1 st_1
gb_incidencias gb_incidencias
cbx_filtrar_fechas cbx_filtrar_fechas
cbx_filtrar_alcances cbx_filtrar_alcances
gb_2 gb_2
dw_filtro_fechas dw_filtro_fechas
dw_alcances dw_alcances
st_4 st_4
st_5 st_5
st_6 st_6
em_desde em_desde
cbx_numero cbx_numero
mle_1 mle_1
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
p_orden1 p_orden1
cbx_filtrar_activos cbx_filtrar_activos
dw_avisos_activos dw_avisos_activos
gb_5 gb_5
em_hasta em_hasta
dw_lista_avisos dw_lista_avisos
end type
global w_1105_avisos_con_alim w_1105_avisos_con_alim

type variables
int ii_clase_aviso //DBE 29/03/2000

// ii_clase_aviso = 1 >> Normal
// ii_clase_aviso = 3 >> De Calidad

//// variables para la lista de avisos
boolean ib_cancel //DBE 09/03/2000

boolean ib_calle
int ii_ind_pel_lista
int ii_cli_imp_lista
////
long il_handle
string is_accion
int ii_visible
int ii_expandido
int ii_co_nivel_actual
int ii_cant_av_zona
int ii_clicked_row
long il_nro_instal
int ii_co_nivel_orig
long il_nro_instal_padre
long  il_nro_ot
long ii_cant_av
long ii_cant_av_pel
int ii_cant_cli_imp
string is_nom_instalacion
int ii_NRO_CENTRO
int ii_NRO_CMD
int ii_NRO_MESA
INT II_TIPO_INSTALACION


// var. para cargar la estructura local a la ventana
u_generico_comunicaciones iuo_gen_comunic

//var. para recibir las estructuras de las ventanas
// a las que llama 
u_generico_comunicaciones iuo_gen_comunic1
u_generico_comunicaciones iuo_gen_comunic2
u_generico_comunicaciones iuo_gen_comunic3
u_generico_comunicaciones iuo_1234
u_generico_comunicaciones iuo_2301
u_generico_comunicaciones iuo_1203
time t1,t5,t3,t4,t2,t6,t7


//u_avi_2001_pr_lista_avisos iuo_lista_avisos
u_avi_2004_pr_form_inf_resumen iu_avi_2004_pr
u_avi_2001_nu_lista_avisos iuo_avi_2001_nu

// para cargar la cantidad de lineas
// dibujadas en forma din$$HEX1$$e100$$ENDHEX$$mica
int ii_cant_lineas = 0

// var.utilizada en caso de querer abrir
//varios niveles al mismo tiempo
int ii_nivel_abrir, ii_fila_clickeada
int ii_op // GUARDA LA OPCION SELECCIONADA EN RIGH BOTOM

// String donde guardo el filtro b$$HEX1$$e100$$ENDHEX$$sico del jerarquizador
string is_filtro_primario, is_filtro_terciario

// C$$HEX1$$f300$$ENDHEX$$digos de nivel entre los cuales se encuentra
// filtrado en el momento el jerarquizador.
int ii_nivel_desde, ii_nivel_hasta

long il_nro_avi, il_incid_1, il_incid_2
int ii_fila, ii_fila_avi_clic, ii_t_salida

// u_avi_2001_rn_lista_avisos iu_avi_2001_rn

boolean ib_incid_selec

string is_accion_llamada

int i_cerre
int i_tipo_inc 
/// si viene de crear inc a nivel inst = 1
/// si viene de crear inc a nivel sum = 2
long il_avis_nro_ins
string is_ult_llamada
boolean ib_hay_avisos = false
int ii_incidencia
boolean ib_obs_general = false
string is_obs
boolean ib_cancelado = false

// TDA.EDM-3
long is_mot_improc
long is_mot_improc_subtipo

boolean ib_accion_nueva = false
int il_fila_actual
long il_nro_inc

datetime idt_f_actual
string is_cmd

int ii_tipo_acceso

// Define los accesos segun el perfil de entrada

// ii_tipo_acceso = 0 >> No tiene acceso
// ii_tipo_acceso = 1 >> Acceso por CMD
// ii_tipo_acceso = 2 >> Acceso Total.

// Defino variable para indcar aviso de calidad

int ii_ind_calidad

// Defino el tipo de las incidencias seleccionadas,
// Calidad o Normales
 
int ii_tipo_inc_1=0
int ii_tipo_inc_2=0

int ii_ind_inc
int ii_nivel_tension
int ii_otras_smt

boolean ib_cambio_inst=false
boolean ib_activate = false
boolean ib_fijo_rama = false

Boolean ib_inc1  //**  OSGI 2001.1  11/05/2001
Boolean ib_asoc_aviso_con_alim  //**  OSGI 2001.1  11/05/2001
DateTime idt_fecha_det, idt_fecha_serv_rep  //**  OSGI 2001.1   11/05/2001
boolean ib_recupero=true
boolean ib_falta_retrieve = false
boolean ib_reseteo=false

int ii_nro_avisos
int ii_alcances[]
string is_alcances

string ids_f_desde,ids_f_hasta

long il_nro_aviso_desde, il_nro_aviso_hasta //GNU 13-4-2007. Mejora 1/465491

//AHM (29/09/2009) Mejora 1/468636
long il_nroInstalacionOt		//N$$HEX1$$fa00$$ENDHEX$$mero de instalaci$$HEX1$$f300$$ENDHEX$$n sobre la que se ha realizado la ot
long il_nroOt						//N$$HEX1$$fa00$$ENDHEX$$mero de ot

//AHM (03/02/2011) ASUR 1022795
int	ii_seleccionesMenu		//Indica si ya se ha seleccionado una opci$$HEX1$$f300$$ENDHEX$$n en el men$$HEX1$$fa00$$ENDHEX$$
end variables

forward prototypes
public function datetime fw_o_f_primer_aviso ()
public subroutine fw_busca_sum_imp (long ll_cod_inst, ref long la_sum_imp[], ref long ll_num_eltos, integer li_co_nivel)
public subroutine fw_habilitar_controles (boolean pb_habilitar)
public subroutine fn_nombre_ventana (integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_mesa)
public function integer fnu_resolver_ot ()
protected function integer fw_asoc_aviso_inc_rs (readonly integer ai_opcion_picture, picture apicture_inc, readonly integer ai_opcion_llamada, readonly long al_incidencia, readonly long al_fila, readonly integer ai_estado)
public function integer fw_desplegar_rama ()
public function integer fw_incidencia_activa (long al_num_instalacion, integer ai_indicativo, readonly powerobject ap_powerobject, integer ai_tipo_instalacion)
end prototypes

on ue_crear_incidencia;call w_sgigenerica::ue_crear_incidencia;// Genera una Incidencia a partir de una Instalacion o un Aviso.

// Preparo variables globales para la ventana de incidencias.

//	gu_comunic.is_comunic.longval1 = d_lista_avisos.getitemdecimal(d_lista_avisos.getrow(),"nro_incidencia")
//	gu_comunic.is_comunic.nro_aviso = 
end on

event ue_reseteo;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Ue_reseteo
//
// Objetivo: Reestablece los valores y los datos de la ventana
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/97    FDO
//
///////////////////////////////////////////////////////

treeviewitem le_elemento
long ll_manejador
long ll_conta, ll_zona, ll_cmd, ll_sector
ib_reseteo = true

// FDO Mejora Pan 221666
dw_filtro_fechas.accepttext()
// FDO Mejora Pan 221666

IF ii_clicked_row > 0 AND ii_clicked_row <= dw_lista_instal.RowCount() THEN	
	
	IF ISVALID(W_BARRA) THEN
		W_BARRA.UO_BARRA.gb_1.text="Recuperando datos de Avisos..."
		W_BARRA.uo_barra.barra.f_amplia(85)
	END IF
	
	il_nro_instal = dw_lista_instal.GetItemDecimal(ii_clicked_row, "nro_instalacion")
	il_nro_instal_padre = dw_lista_instal.GetItemDecimal(ii_clicked_row, "nro_inst_padre")

	ii_fila_clickeada = ii_clicked_row 
	
	ll_manejador=dw_lista_instal.object.manejador[ii_clicked_row]
	
	dw_lista_avisos.SetRedraw(False)

	// Se necesita cargar estas variables para poder 
	// realizar el cambio de alimentacion de una instalacion
	// en caso que sea necesario

	IF il_nro_instal = fgcdec_aviso_con_alimentacion THEN
		st_2.text = "          Avisos con Alimentaci$$HEX1$$f300$$ENDHEX$$n"
//		p_1.picturename="Conalim.bmp"
	ELSEIF il_nro_instal = fgcdec_aviso_sin_alimentacion THEN
		st_2.text = "          Avisos sin Alimentaci$$HEX1$$f300$$ENDHEX$$n"
//		p_1.picturename="cor_pro1.bmp"
	ELSEIF il_nro_instal = fgcdec_aviso_de_ayuda THEN
		st_2.text = "          Avisos de Ayuda"
//		p_1.picturename="Acuerdo.bmp"
	ELSEIF il_nro_instal = fgcdec_aviso_alumbrado_publico THEN
		st_2.text = "          Avisos de Alumbrado P$$HEX1$$fa00$$ENDHEX$$blico"
//		p_1.picturename="ALUMBRADO.bmp"
	ELSEIF il_nro_instal = 55555555 THEN
		st_2.text = "          Avisos de Calidad"
//		p_1.picturename="cor_pro1.bmp"
	ELSE
		st_2.text = "          Instalaci$$HEX1$$f300$$ENDHEX$$n: "+dw_lista_instal.GetItemString(ii_clicked_row, "nom_instalacion")
	END IF

	tv_1.getitem(ll_manejador, le_elemento)
	
	IF le_elemento.pictureindex > 0 and  ii_tipo_instalacion > 0 then
		p_1.picturename=tv_1.f_devuelve_instalacion(tv_1.f_icono_arbol(ii_tipo_instalacion))
	end if
	
	IF ISVALID(W_BARRA) THEN
		W_BARRA.uo_barra.barra.f_amplia(90)
	END IF
	
	//DBE 09/03/2000 ini
	 if ib_cancel=true then 
		DW_LISTA_avisos.Dbcancel()
		dw_lista_avisos.reset()
		ib_cancel=false
	 end if	
	//DBE 09/03/2000 fin
			
//	dw_lista_avisos.Retrieve(il_nro_instal)

	if ib_recupero = true then
		
		IF dw_ambito.RowCount() > 0 THEN
			ll_zona = dw_ambito.GetItemNumber(1, 'nro_centro')
			ll_cmd =  dw_ambito.getitemnumber(1,"nro_cmd") 
			ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")
		ELSE
			IF fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
				ll_zona = gi_nro_centro 
				ll_cmd =  gi_nro_cmd
				ll_sector = gi_nro_puesto
			ELSE
				IF ii_tipo_acceso = 1 THEN
					ll_cmd =  gi_nro_cmd
					ll_zona = fgci_todos 
					ll_sector = fgci_todos
				ELSE
					ll_cmd =  fgci_todos 
					ll_zona = fgci_todos 
					ll_sector = fgci_todos 
				END IF
			END IF
		END IF
		
		dw_lista_avisos.reset()
		
		// FDO Mejora Pan 221666
		
		dw_lista_avisos.Retrieve(il_nro_instal,ii_clase_aviso,&
		fgcdec_aviso_de_calidad, fgcdec_aviso_de_calidad_con_alim,& 
		fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector,ids_f_desde,ids_f_hasta,ii_alcances[], il_nro_aviso_desde, il_nro_aviso_hasta)
		
		//GNU 17-5-2006. Incidencia Correo
		
	// FDO Mejora Pan 221666
		
	else
		ib_falta_retrieve = true
	end if
	
	
	IF ISVALID(W_BARRA) THEN
		W_BARRA.uo_barra.barra.f_amplia(95)	
	END IF

	if dw_lista_avisos.rowcount() > 0 then
		if ii_clicked_row = 0 then
			ii_clicked_row = dw_lista_avisos.getrow()
		end if
		ii_cant_av = dw_lista_instal.GetItemNumber(ii_clicked_row, "cant_avisos")
		ii_cant_av_pel = dw_lista_avisos.object.cc_sum_ind_pel[dw_lista_avisos.rowcount()]
		ii_cant_cli_imp = dw_lista_avisos.object.cc_sum_cli_imp[dw_lista_avisos.rowcount()]
		sle_cant_cli_imp.Text = string(ii_cant_cli_imp)
		sle_cant_avi_pel.Text = string(ii_cant_av_pel)
	else
		sle_cant_cli_imp.Text = "0"
		sle_cant_avi_pel.Text = "0"
	end if
			
	dw_lista_avisos.SetRedraw(True)

	IF ISVALID(W_BARRA) THEN
		W_BARRA.uo_barra.barra.f_amplia(100)
	END IF

ELSEIF (dw_lista_instal.rowcount()=0) then 
	IF ISVALID(W_BARRA) THEN
		close(w_barra)
	END IF
	
	gnv_msg.f_mensaje("AA06","","",OK!)
	i_cerre=1
	
	yield()
	ib_reseteo = false
	ib_activate = false
	IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
		Close(This)
		return
	END IF
END IF
ib_reseteo = false
IF ISVALID(W_BARRA) THEN
	close(w_barra)
END IF

end event

event ue_refrescar;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//										
// Funcion/Evento: Ue_refrescar
// 
// Objetivo: 	Refresca la ventana cuando vuelve de otra ventana, la ventana 
//           	no se resetea al punto de origen sino que se refresca hasta la 
//			    	situaci$$HEX1$$f300$$ENDHEX$$n original.
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//    	Entrada: Por el longparm 1 - Refresca la ventana
//										 2 - Actualiza los datos de la ventana
//		Salida : --
//
// Devuelve:
//
// Fecha       	Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	      	-----------   		---------
// 15/02/2001 	FDO				Nueva funcion de refrescar la ventana
//
//  NUEVA FUNCIONALIDAD DEL EVENTO REFRESCAR
//
//  Leer la Datawindow de la lista de instalaciones cargando los datos de cada una de estas empezando por el handle
//  Si existe en la tabla GI_avisos_instalacion, comprobar la fecha actual.
//  Si la fecha actual no ha cambiado as$$HEX2$$ed002000$$ENDHEX$$como la cantidad de avisos tampoco para los tipos gen$$HEX1$$e900$$ENDHEX$$ricos significa que 
//  la situaci$$HEX1$$f300$$ENDHEX$$n de los avisos no ha cambiado, por lo tanto podemos dejar el $$HEX1$$e100$$ENDHEX$$rbol tal cual.
//  Si la fecha actual de alguno de los gen$$HEX1$$e900$$ENDHEX$$ricos cambia o la cantidad de avisos, sabemos que se ha producido alg$$HEX1$$fa00$$ENDHEX$$n tipo
//  de modificaci$$HEX1$$f300$$ENDHEX$$n sobre el $$HEX1$$e100$$ENDHEX$$rbol. Tendremos que leer secuencialmente la datawindow para actualizar el $$HEX1$$e100$$ENDHEX$$rbol hasta 
//  donde este abierto, a la vez que se va actualizando la datawindow por debajo
//
//  POR OTRO LADO 
//
//  Se mantiene como opci$$HEX1$$f300$$ENDHEX$$n la funcionalidad que ten$$HEX1$$ed00$$ENDHEX$$a el evento refrescar. Pues al usuario en un determinado momento
//  le puede interesar hacer el efecto de cerrar la ventana y volverla a abrir. 
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Recupero los datos del objeto message

int li_accion,li_contador,li_ind_incid,li_clase_aviso,li_expandido,li_conta_padre=1,li_item,li_sitio,li_otras_smt,li_tip_inc,li_tension
long ll_nro_instalacion,ll_cant_avisos,ll_cant_avisos_dw,ll_cant_avisos_zona,ll_nro_inst_padre,ll_cant_avisos_def,ll_fila_ins,ll_borrar_filas[],ll_tipo_aviso
long ll_instalaciones_padre[],ll_manejador,ll_tipo_instalacion,ll_nro_ot,ll_handle_padre,ll_fila,ll_conta_reg,ll_maneja_def,ll_contador_filas
long ll_nro_inst_padre_def,ll_devuelve, ll_zona, ll_cmd, ll_sector,ld_pot_instalada,ll_clientes
datetime ld_fecha_actual,ld_fecha_actual_dw
string ls_nom_instalacion,ls_fase_afec='000',ls_fase_comun='000',LS_SELECT
int li_retorno
treeviewitem arbol

li_accion=message.longparm

// GNU 26-2-2007. Incidencia 0/489508
md_gestion_avisos m_menu

m_menu= This.menuid
m_menu.m_editar.m_actualizar.enabled=false
//md_gestion_avisos.m_editar.m_actualizar.enabled=false
// FIN GNU

ll_zona = dw_ambito.GetItemNumber(1, 'nro_centro')
ll_cmd =  dw_ambito.getitemnumber(1,"nro_cmd") 
ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")

if cbx_filtrar_fechas.checked = false then
	ids_f_hasta = string(fgnu_fecha_actual())
else
	dw_filtro_fechas.accepttext()
end if

if cbx_filtrar_alcances.checked = true and is_alcances = "" then
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Es necesario seleccionar alg$$HEX1$$fa00$$ENDHEX$$n alcance de la lista para recuperar los datos.")
	return
end if

// GNU 13-4-2007. Mejora 1/465491
if cbx_numero.checked= true then
	if (em_desde.text="" and em_hasta.text="") then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Es necesario seleccionar alg$$HEX1$$fa00$$ENDHEX$$n n$$HEX1$$fa00$$ENDHEX$$mero de aviso para recuperar los datos")
		return
	elseif em_desde.text="" then
	   em_desde.text=em_hasta.text
		il_nro_aviso_desde= long (em_hasta.text)
	elseif em_hasta.text="" then
		em_hasta.text=em_desde.text
		il_nro_aviso_hasta= long(em_desde.text)
	elseif long(em_desde.text)> long(em_hasta.text) then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "El rango de avisos es incorrecto")
		return
	end if
else
	il_nro_aviso_desde=1
	SELECT MAX (nro_aviso)
	INTO :il_nro_aviso_hasta
	FROM GI_AVISOS;
end if

if li_accion=1 then // Refresco la ventana como hasta ahora
	fw_habilitar_controles(TRUE)
	this.setredraw(false)
	long tvi_hdl = 0
	is_accion=""
	ii_visible=0
	ii_expandido=0
	ii_co_nivel_actual=0
	ii_cant_av_zona=0
	ii_clicked_row=0
	il_nro_instal=0
	ii_co_nivel_orig=0
	il_nro_instal_padre=0
	il_nro_ot=0
	ii_cant_av=0
	ii_cant_av_pel=0
	ii_cant_cli_imp=0
	is_nom_instalacion=""
	ii_NRO_CENTRO=0
	ii_NRO_CMD=0
	ii_NRO_MESA=0
	II_TIPO_INSTALACION=0
	ii_cant_lineas = 0
	ii_nivel_abrir=0
	ii_fila_clickeada=0
	ii_op=0 // GUARDA LA OPCION SELECCIONADA EN RIGH BOTOM
	
	// String donde guardo el filtro b$$HEX1$$e100$$ENDHEX$$sico del jerarquizador
	is_filtro_primario=""
	is_filtro_terciario=""
	
	// C$$HEX1$$f300$$ENDHEX$$digos de nivel entre los cuales se encuentra
	// filtrado en el momento el jerarquizador.
	ii_nivel_desde=0
	ii_nivel_hasta=0
	il_nro_avi=0
	//il_incid_1=0 GSE 12/09/01 errores
	//il_incid_2=0
	ii_fila=0
	ii_fila_avi_clic=0
	ii_t_salida=0
	ib_incid_selec=false
	
	is_accion_llamada=""
	i_cerre=0
	
	ib_cancel=true
	DW_LISTA_avisos.Dbcancel()
	
	DW_LISTA_INSTAL.RESET()
	DW_LISTA_avisos.RESET()
	
	DO UNTIL tv_1.FindItem(RootTreeItem!, 0) = -1	
		tv_1.DeleteItem(tvi_hdl)
	LOOP
	
	TV_1.TRIGGEREVENT(CONSTRUCTOR!)

	IF NOT IsValid(This) THEN return
	
	sle_cant_avi_pel.text="0"
	sle_cant_cli_imp.text="0"
	st_2.text="          Avisos Relacionados"
	
	dw_lista_avisos.setredraw(true)
	dw_lista_INSTAL.setredraw(true)
	this.setredraw(true)
	
	if isvalid(w_barra) then
		W_BARRA.uo_barra.barra.f_amplia(100)
		close(w_barra)
	end if
	
	ii_fila = 1

Else // Actualizo los Datos
	
	ll_contador_filas = dw_lista_instal.rowcount()
	
	DECLARE avisos_total DYNAMIC CURSOR FOR SQLSA;		
		
	FOR li_contador=1 to ll_contador_filas
		
		ll_nro_inst_padre = dw_lista_instal.object.nro_inst_padre[li_contador]
		li_clase_aviso = dw_lista_instal.object.clase_aviso[li_contador]
		ll_nro_instalacion = dw_lista_instal.object.nro_instalacion[li_contador]
		ld_fecha_actual_dw = dw_lista_instal.object.f_actual[li_contador]
		ll_cant_avisos_dw = dw_lista_instal.object.cant_avisos[li_contador]
		li_expandido= dw_lista_instal.object.expandido[li_contador]

		// FDO Mejora Pan 221666
		
		LS_SELECT = " SELECT COUNT(GI_AVISOS_INSTALACION.NRO_AVISO), " + &
						   " MAX(GI_AVISOS_INSTALACION.NRO_OT), " + &
						   " MAX(GI_AVISOS_INSTALACION.F_ACTUAL), " + &
						   " MAX(GI_AVISOS_INSTALACION.IND_INCIDENCIA), " + &
						   " MAX(GI_AVISOS_INSTALACION.NRO_INST_PADRE), " + &
						   " MAX(GI_AVISOS_INSTALACION.IND_OTRAS_SMT) " + &
		"  FROM GI_AVISOS_INSTALACION  " + &
		"  WHERE GI_AVISOS_INSTALACION.NRO_INSTALACION = " + STRING(ll_nro_instalacion) + &
		"	 AND	GI_AVISOS_INSTALACION.CLASE_AVISO = " + STRING(li_clase_aviso)  + &
		"	 AND GI_AVISOS_INSTALACION.EST_AVISO <= " + STRING(fgci_aviso_enviado_brigada) + &
		"	 AND GI_AVISOS_INSTALACION.NRO_INST_PADRE = " + STRING(ll_nro_inst_padre)
		
		if cbx_filtrar_fechas.checked = true then	
			LS_SELECT = LS_SELECT + "	 AND GI_AVISOS_INSTALACION.F_ALTA >= TO_DATE('" + ids_f_desde + "','DD/MM/YYYY HH24:MI:SS') " + &
			"	 AND GI_AVISOS_INSTALACION.F_ALTA <= TO_DATE('" + ids_f_hasta + "','DD/MM/YYYY HH24:MI:SS') " 
		end if
		
		if cbx_filtrar_alcances.checked = true then				  
			LS_SELECT = LS_SELECT + "	 AND NVL(GI_AVISOS_INSTALACION.CO_ALCANCE,0) IN (" + is_alcances + ")" 
		end if
		
		//GNU 13-4-2007. Mejora 1/465491
		IF cbx_numero.checked= true then
			IF em_desde.text="" then
				LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_hasta.text
			ELSEIF em_hasta.text="" then
				LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_desde.text
			ELSE
				LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO>=" + em_desde.text + &
								 " and GI_AVISOS_INSTALACION.NRO_AVISO<=" + em_hasta.text
			END IF
		END IF
		// FIN GNU
		//JHE SFP DEO12-160 23/10/2012

		IF cbx_filtrar_activos.checked= true THEN
			   ll_tipo_aviso = dw_avisos_activos.GetitemNumber(1,"tip_aviso")

				LS_SELECT += " AND GI_AVISOS_INSTALACION.TIPO_AVISO="+string(ll_tipo_aviso)
		END IF
		//JHE SFP DEO12-160 23/10/2012
		
		LS_SELECT = LS_SELECT + "     AND nro_zona=decode(" + string(ll_zona) + ", 0, nro_zona,"  + string(ll_zona)+ ") " + &
	     "     AND nro_cmd=decode("  + string(ll_cmd) + " , 0, nro_cmd,"  + string(ll_cmd) + ") " + &
	  	"     AND nro_sector=decode(" + string(ll_sector) + " , 0, nro_sector," + string(ll_sector) + ")" + &
		"	GROUP BY GI_AVISOS_INSTALACION.NRO_INSTALACION"

		// FDO Mejora Pan 221666
		
		PREPARE SQLSA FROM :ls_select;
	  	
		IF sqlca.sqlcode<>0 THEN 
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Error al hacer el PREPARE del cursor din$$HEX1$$e100$$ENDHEX$$mico avisos_total:" + sqlca.sqlerrtext)
			return
		END IF
		
		OPEN DYNAMIC avisos_total;

		IF sqlca.sqlcode<>0 THEN 
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Error al hacer el OPEN del cursor din$$HEX1$$e100$$ENDHEX$$mico avisos_total:" + sqlca.sqlerrtext)
			return
		END IF
		
		FETCH avisos_total 
		INTO  :ll_cant_avisos_zona,
				:ll_nro_ot,
				:ld_fecha_actual,
				:li_ind_incid,
				:ll_nro_inst_padre_def,
				:li_otras_smt;
				
		CLOSE avisos_total;	
		
		IF sqlca.sqlcode=0 THEN

			ll_cant_avisos_def=ll_cant_avisos_zona
			
			IF  ll_cant_avisos_def <> ll_cant_avisos_dw OR &
				ld_fecha_actual <> ld_fecha_actual_dw THEN
				

				IF li_expandido =1 then // Si la rama esta desplegada
					ll_instalaciones_padre[li_conta_padre] = ll_nro_instalacion
					ll_instalaciones_padre[li_conta_padre + 1] = li_clase_aviso
					li_conta_padre = li_conta_padre + 2
				END IF
				
				// Cambian datos del $$HEX1$$e100$$ENDHEX$$rbol, se actualiza la datawindow y el $$HEX1$$e100$$ENDHEX$$rbol
				
				if li_clase_aviso =  fgci_clase_avi_normal and &
				  ll_nro_instalacion <> fgcdec_aviso_con_alimentacion and &
				  ll_nro_instalacion <> fgcdec_aviso_sin_alimentacion and &
				  gb_red_trifasica=false then
			
					declare lc_cursor_fases_1 cursor for
					select fase 
					from gi_avisos_instalacion
					where nro_instalacion = :ll_nro_instalacion
						and est_aviso = 1
						and clase_aviso = :li_clase_aviso;
						
					open lc_cursor_fases_1;
					
					fetch lc_cursor_fases_1 into :ls_fase_comun;	
					
					do while sqlca.sqlcode=0 and ls_fase_afec <> '111'
						
						li_sitio=pos(ls_fase_comun,'1',1)
						
						do while li_sitio >= 1
							ls_fase_afec = replace(ls_fase_afec,li_sitio,1,'1')
							li_sitio=pos(ls_fase_comun,'1',li_sitio + 1)
						loop
						
						fetch lc_cursor_fases_1 into :ls_fase_comun;		
					loop
					
					close lc_cursor_fases_1;
					
					Select descripcion 
					into :ls_fase_afec
					from sgd_valor
					where codif = 'FASE' and
							valor = :ls_fase_afec;
							
				end if									
				//IF ll_cant_avisos_def > 0 THEN			
					dw_lista_instal.setitem(li_contador, "cant_avisos", ll_cant_avisos_def)
					dw_lista_instal.object.f_actual[li_contador]= ld_fecha_actual
					dw_lista_instal.object.nro_ot[li_contador]=ll_nro_ot
					dw_lista_instal.object.ind_incidencia[li_contador]=li_ind_incid
					dw_lista_instal.object.nro_inst_padre[li_contador]=ll_nro_inst_padre_def
					ls_nom_instalacion=dw_lista_instal.object.nom_instalacion[li_contador]
					dw_lista_instal.object.fase[li_contador]=ls_fase_afec
					ll_manejador=dw_lista_instal.object.manejador[li_contador]
					tv_1.getitem(LL_manejador,arbol)
					arbol.bold = false
					IF isnull(ls_fase_afec) or ls_fase_afec = '000' then
						arbol.label = ls_nom_instalacion + space(1) + ' (' +string(ll_cant_avisos_def) + ')' 
					ELSE
						arbol.label = ls_nom_instalacion + space(1) + ' (' + ls_fase_afec+ ')   (' +string(ll_cant_avisos_def) + ')' 
					END IF
					
					ls_fase_afec='000'			
					
					if li_ind_incid > 0 then
						arbol.bold = true
						arbol.label=arbol.label + space(5) + "(I)"
					end if
					
					if ll_nro_ot > 0 then
						arbol.bold = true
						arbol.label=arbol.label + space(5) + "(OT)"
					end if
					
					IF li_otras_smt > 0 THEN
						arbol.label=arbol.label + space(5) + "*"
					END IF				
					
					tv_1.setitem(LL_manejador, arbol)
				//END IF
				
		END IF

		ELSEIF sqlca.sqlcode = 100 then
			
			if li_contador > 5 THEN
			
				if li_contador = ii_clicked_row then
					
					ll_fila_ins = dw_lista_instal.find('nro_instalacion = ' + string(dw_lista_instal.object.nro_inst_padre[li_contador]) +  ' and clase_aviso = ' + string(li_clase_aviso),0,dw_lista_instal.rowcount())
					
					if not isnull(ll_fila_ins) then						
						ll_maneja_def=dw_lista_instal.object.manejador[ll_fila_ins]
						ii_clicked_row = ll_fila_ins
					end if
					
				end if	
				
				tv_1.DeleteItem ( dw_lista_instal.object.manejador[li_contador] )
				ll_borrar_filas[upperbound(ll_borrar_filas) + 1] = ll_nro_instalacion
				ll_borrar_filas[upperbound(ll_borrar_filas) + 1] = li_clase_aviso
			else 
				
				ll_conta_reg ++
				
				ll_manejador=dw_lista_instal.object.manejador[li_contador]
				ls_nom_instalacion=dw_lista_instal.object.nom_instalacion[li_contador]
				tv_1.getitem(LL_manejador,arbol)
				arbol.label = ls_nom_instalacion + space(1) + ' (0)' 
				tv_1.setitem(LL_manejador, arbol)
				dw_lista_instal.setitem(li_contador, "cant_avisos", 0)
				dw_lista_instal.object.f_actual[li_contador]= ld_fecha_actual
				
				
			end if
			
		ELSEIF sqlca.sqlcode = -1 THEN
		
		END IF
		
	NEXT
	
	// si hay que borrar alguna fila de la dw la borramos aqui
	
	if Upperbound(ll_borrar_filas) > 0 then
	
		FOR li_contador = 1 to Upperbound(ll_borrar_filas) step 2
			
			li_retorno= dw_lista_instal.find('nro_instalacion = ' + string(ll_borrar_filas[li_contador]) + ' and clase_aviso = ' + string(ll_borrar_filas[li_contador+ 1]),0,dw_lista_instal.rowcount()) 
			li_retorno = dw_lista_instal.deleterow(li_retorno)
			
		NEXT
	
	end if
	
	// Si existen ramas nuevas se ingresan a partir de aqui
	
	IF Upperbound(ll_instalaciones_padre) > 0 and dw_lista_instal.rowcount() > 5 then 
		
		// Si en el array de instalaciones se ha guardado alguna,
		// puede significar que hay instalaciones nuevas en el array
		
		DECLARE lc_instalaciones_nuevas DYNAMIC CURSOR FOR SQLSA;
			
		FOR li_contador=1 to Upperbound(ll_instalaciones_padre) step 2
			
			ls_select = 	" SELECT COUNT(GI_AVISOS_INSTALACION.NRO_AVISO), " + &
				"		GI_AVISOS_INSTALACION.NRO_INSTALACION, " + &
				"			GI_AVISOS_INSTALACION.NOM_INSTALACION, " + &
				"			GI_AVISOS_INSTALACION.TIPO_INSTALACION , " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_ZONA), " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_CMD),  " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_SECTOR), " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_OT), " + &
				"			MAX(GI_AVISOS_INSTALACION.F_ACTUAL), " + &
				"			MAX(GI_AVISOS_INSTALACION.IND_INCIDENCIA), " + &
				"			MAX(GI_AVISOS_INSTALACION.IND_OTRAS_SMT)  " + &			
				" FROM 	GI_AVISOS_INSTALACION " + &
				" WHERE	GI_AVISOS_INSTALACION.NRO_INST_PADRE = " + string(ll_instalaciones_padre[li_contador]) + &	
				"	 AND	GI_AVISOS_INSTALACION.CLASE_AVISO = " + string(ll_instalaciones_padre[li_contador + 1]) + &	
				"	 AND GI_AVISOS_INSTALACION.EST_AVISO <= " + string(fgci_aviso_enviado_brigada) 	
		
				if cbx_filtrar_fechas.checked = true then	
					LS_SELECT = LS_SELECT + "	 AND GI_AVISOS_INSTALACION.F_ALTA >= TO_DATE('" + ids_f_desde + "','DD/MM/YYYY HH24:MI:SS') " + &
					"	 AND GI_AVISOS_INSTALACION.F_ALTA <= TO_DATE('" + ids_f_hasta + "','DD/MM/YYYY HH24:MI:SS') " 
				end if
				
				if cbx_filtrar_alcances.checked = true then				  
					LS_SELECT = LS_SELECT + "	 AND NVL(GI_AVISOS_INSTALACION.CO_ALCANCE,0) IN (" + is_alcances + ")" 
				end if
				
//				//GNU 13-4-2007. Mejora 1/465491
				IF cbx_numero.checked= true then
					IF em_desde.text="" then
						LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_hasta.text
					ELSEIF em_hasta.text="" then
						LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_desde.text
					ELSE
						LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO>=" + em_desde.text + &
										 " and GI_AVISOS_INSTALACION.NRO_AVISO<=" + em_hasta.text
					END IF
				END IF
				// FIN GNU

				//JHE SFP DEO12-160 23/10/2012
				IF cbx_filtrar_activos.checked= true THEN
						ll_tipo_aviso = dw_avisos_activos.GetitemNumber(1,"tip_aviso")

						LS_SELECT += " AND GI_AVISOS_INSTALACION.TIPO_AVISO="+string(ll_tipo_aviso)
				END IF
				//JHE SFP DEO12-160
				
				LS_SELECT = LS_SELECT + "     AND nro_zona=decode(" + string(ll_zona) + ", 0, nro_zona,"  + string(ll_zona)+ ") " + &
	     		"     AND nro_cmd=decode("  + string(ll_cmd) + " , 0, nro_cmd,"  + string(ll_cmd) + ") " + &
	  			"     AND nro_sector=decode(" + string(ll_sector) + " , 0, nro_sector," + string(ll_sector) + ")" 
				
				LS_SELECT = LS_SELECT + " GROUP BY	GI_AVISOS_INSTALACION.NRO_INSTALACION ," + &
					"				GI_AVISOS_INSTALACION.NOM_INSTALACION ," + &
					"				GI_AVISOS_INSTALACION.TIPO_INSTALACION"
			
		// FDO Mejora Pan 221666
		
		PREPARE SQLSA FROM :ls_select;
	  	
		IF sqlca.sqlcode<>0 THEN 
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Error al hacer el PREPARE del cursor din$$HEX1$$e100$$ENDHEX$$mico lc_instalaciones_nuevas:" + sqlca.sqlerrtext)
			return
		END IF
		
		OPEN DYNAMIC lc_instalaciones_nuevas;

		IF sqlca.sqlcode<>0 THEN 
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Error al hacer el OPEN del cursor din$$HEX1$$e100$$ENDHEX$$mico lc_instalaciones_nuevas:" + sqlca.sqlerrtext)
			return
		END IF		
		
		FETCH lc_instalaciones_nuevas	INTO 		:ll_cant_avisos,
														:ll_cant_avisos_zona,
														:ll_nro_instalacion,
														:ls_nom_instalacion,
														:ll_tipo_instalacion,
														:li_tension,
														:ii_nro_centro,
														:ii_nro_cmd,
														:ii_nro_mesa,
														:ll_nro_ot,
														:ld_fecha_actual,
														:li_ind_incid,
														:li_otras_smt;
	
			DO WHILE SQLCA.SQLCODE = 0
				
				IF sqlca.sqlcode<> 0 then
					Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo cargar la informaci$$HEX1$$f300$$ENDHEX$$n de la tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext ,information!,ok!)
					Return -1
				END IF
				
				IF ll_cant_avisos_zona > 0 THEN
					ll_devuelve = dw_lista_instal.find('nro_instalacion = ' + string(ll_nro_instalacion) + ' and clase_aviso = ' + string(ll_instalaciones_padre[li_contador + 1]),0,dw_lista_instal.rowcount())
					
					IF ll_devuelve < 1 then
		
						if ll_instalaciones_padre[li_contador]= fgcdec_aviso_de_calidad then
							li_item=tv_1.f_icono_arbol(fgcdec_aviso_de_calidad_con_alim)
						else
							li_item=tv_1.f_icono_arbol(ll_tipo_instalacion)
						end if
						
						if ii_tipo_acceso = 1 OR fg_verifica_parametro("AMBITO GESTION AVISOS") then 
							// Filtra por CMD o por $$HEX1$$e100$$ENDHEX$$mbito
							ll_cant_avisos_def=ll_cant_avisos_zona
						else
							ll_cant_avisos_def=ll_cant_avisos
						end if
						
						if li_clase_aviso =  fgci_clase_avi_normal and &
							ll_instalaciones_padre[li_contador] <> fgcdec_aviso_con_alimentacion  and &
							gb_red_trifasica=false then
					
							declare lc_cursor_fases cursor for
							select fase 
							from gi_avisos_instalacion
							where nro_instalacion = :ll_instalaciones_padre[li_contador]
								and est_aviso = 1
								and clase_aviso = :ll_instalaciones_padre[li_contador + 1];
								
							open lc_cursor_fases;
							
							fetch lc_cursor_fases into :ls_fase_comun;	
							
							do while sqlca.sqlcode=0 and ls_fase_afec <> '111'
								
								li_sitio=pos(ls_fase_comun,'1',1)
								
								do while li_sitio >= 1
									ls_fase_afec = replace(ls_fase_afec,li_sitio,1,'1')
									li_sitio=pos(ls_fase_comun,'1',li_sitio + 1)
								loop
								
								fetch lc_cursor_fases into :ls_fase_comun;		
							loop
							
							close lc_cursor_fases;
							
							Select descripcion 
							into :ls_fase_afec
							from sgd_valor
							where codif = 'FASE' and
									valor = :ls_fase_afec;
									
		
						end if					
					
						ll_handle_padre = dw_lista_instal.object.manejador[dw_lista_instal.find('nro_instalacion = ' + string(ll_instalaciones_padre[li_contador]) + ' and clase_aviso = ' + string(ll_instalaciones_padre[li_contador + 1]),0,dw_lista_instal.rowcount())]
						
						//Comprueba que no este cargada la fase
						IF isnull(ls_fase_afec) or ls_fase_afec = '000' then
							ll_manejador = tv_1.insertitemfirst(ll_handle_padre,ls_nom_instalacion + space(1) + ' (' +string(ll_cant_avisos_def) + ')' ,li_item)
						ELSE
							ll_manejador = tv_1.insertitemfirst(ll_handle_padre,ls_nom_instalacion + space(1) + ' (' + ls_fase_afec+ ')   (' +string(ll_cant_avisos_def) + ')' ,li_item)
						END IF	
						
						//VALIDO PARA VER SI HAY ALGUNA OT SOBRE LA INSTALACION
						IF ll_nro_ot > 0 AND arbol.bold = false THEN
							 tv_1.getitem(LL_manejador,arbol)
							 arbol.bold = true
							 arbol.label=arbol.label + space(5) + "(OT)"
							 tv_1.setitem(LL_manejador, arbol)
						END IF
							
						//VALIDO PARA VER SI HAY ALGUNA INCIDENCIA SOBRE LA INSTALACION
						IF  li_ind_incid > 0 AND arbol.bold = false THEN
							tv_1.getitem(LL_manejador,arbol)
							arbol.bold = true
							arbol.label=arbol.label + space(5) + "(I)"
							tv_1.setitem(LL_manejador, arbol)
						END IF
								
						//LO MISMO PARA OTRAS SMT
						IF li_otras_smt > 0 THEN
							tv_1.getitem(LL_manejador,arbol)
							arbol.label=arbol.label + space(5) + "*"
							tv_1.setitem(LL_manejador, arbol)
						END IF
						
						ll_fila = dw_lista_instal.insertrow(0)
						dw_lista_instal.setitem(ll_fila, "manejador", ll_manejador)
						dw_lista_instal.setitem(ll_fila, "nro_inst_padre", ll_instalaciones_padre[li_contador])
						dw_lista_instal.setitem(ll_fila, "nro_instalacion", ll_nro_instalacion)
						dw_lista_instal.setitem(ll_fila, "tip_instal", ll_tipo_instalacion)
						dw_lista_instal.setitem(ll_fila, "nom_instalacion", ls_nom_instalacion)
						dw_lista_instal.setitem(ll_fila, "nro_ot", ll_nro_ot)
						dw_lista_instal.setitem(ll_fila, "nro_centro", ii_nro_centro)
						dw_lista_instal.setitem(ll_fila, "nro_cmd", ii_nro_cmd)
						dw_lista_instal.setitem(ll_fila, "nro_mesa", ii_nro_mesa)
						dw_lista_instal.setitem(ll_fila, "fase", ls_fase_afec)
						ls_fase_afec='000'
						dw_lista_instal.setitem(ll_fila, "cant_avisos", ll_cant_avisos_def)
						dw_lista_instal.setitem(ll_fila, "ind_incidencia", li_ind_incid)
						dw_lista_instal.setitem(ll_fila, "f_actual", ld_fecha_actual)
						dw_lista_instal.setitem(ll_fila, "expandido", 0)
						dw_lista_instal.setitem(ll_fila, "tension",li_tension)
						dw_lista_instal.setitem(ll_fila, "clase_aviso",  ll_instalaciones_padre[li_contador + 1])  //DBE 29/03/2000 13:23
						dw_lista_instal.object.ind_otras_smt[ll_fila]=li_otras_smt				
						
						SELECT nvl("SGD_INSTALACION"."POT_INSTALADA",0.00),
						    nvl("SGD_INSTALACION"."CANT_CLI",0)
				             INTO :ld_pot_instalada,
						 		   :ll_clientes
				  			FROM "SGD_INSTALACION"  
				 			WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_instalacion ) AND  
						 				( "SGD_INSTALACION"."BDI_JOB" = 0 )   ;
	
						dw_lista_instal.setitem(ll_fila, "pot_instalada", ld_pot_instalada)
						dw_lista_instal.setitem(ll_fila, "clientes", ll_clientes)
				
					// Calculo el nivel de tension para esa instalaci$$HEX1$$f300$$ENDHEX$$n
					
						ii_nivel_tension = li_tension
						
					ELSE	
						//if ib_cambio_inst = true and ll_tipo_instalacion > fgci_tipo_transformador then //Aqui
						  if ib_cambio_inst = true and li_tension = 3 then //Aqui
							dw_lista_instal.deleterow(ll_devuelve)
							li_retorno= dw_lista_instal.find('nro_instalacion = ' + string(ll_instalaciones_padre[li_contador]) + ' and clase_aviso = ' + string(ll_instalaciones_padre[li_contador + 1]),0,dw_lista_instal.rowcount()) 
							li_retorno = dw_lista_instal.deleterow(li_retorno)
						end if
					END IF
				END IF				

				FETCH lc_instalaciones_nuevas	INTO 		:ll_cant_avisos,
																:ll_cant_avisos_zona,
																:ll_nro_instalacion,
																:ls_nom_instalacion,
																:ll_tipo_instalacion,
																:li_tension,
																:ii_nro_centro,
																:ii_nro_cmd,
																:ii_nro_mesa,
																:ll_nro_ot,
																:ld_fecha_actual,
																:li_ind_incid,
																:li_otras_smt;

			LOOP
			
			CLOSE lc_instalaciones_nuevas;
			
		NEXT
		
	END IF
	
	this.setredraw(true)
	
	if not isnull(dw_lista_instal.object.ind_incidencia[dw_lista_instal.getrow()]) then
		
		if dw_lista_instal.object.clase_aviso[dw_lista_instal.getrow()] = 3 then // es de calidad se lo pasamos a la datawindow al hacer el retrieve
			li_tip_inc = 1
		else
			li_tip_inc = 0
		end if
		
		dw_inc_asoc.setredraw(false)
		dw_inc_asoc.retrieve(dw_lista_instal.object.nro_instalacion[dw_lista_instal.getrow()],li_tip_inc)
	end if

End if

// GNU 11/01/2007. Mejora 1/311530
//if isvalid(w_1105_avisos_con_alim) then
if isvalid(this) then
// FIN GNU	
	this.triggerevent("ue_reseteo")
else
	return
end if

// GNU 26-2-2007. Incidencia 0/489508
//md_gestion_avisos.m_editar.m_actualizar.enabled=true
m_menu.m_editar.m_actualizar.enabled=true
// FIN GNU

if ii_clicked_row=0 or isnull(ii_clicked_row) or ii_clicked_row > dw_lista_instal.rowcount() then
	ii_clicked_row = 5
end if

If ll_maneja_def = 0 and dw_lista_instal.rowcount() > 5 then
	ll_maneja_def=dw_lista_instal.object.manejador[ii_clicked_row]
	tv_1.selectitem (ll_maneja_def)
	tv_1.setfocus()
	dw_lista_instal.selectrow(long(ii_clicked_row),true)
	this.triggerevent("ue_reseteo")
else
	ii_clicked_row = dw_lista_instal.Find("nro_instalacion = " + string (fgcdec_aviso_con_alimentacion), 1, dw_lista_instal.RowCount())
	ll_maneja_def = dw_lista_instal.object.manejador[ii_clicked_row]
	tv_1.selectitem (ll_maneja_def)
	tv_1.setfocus()
	dw_lista_instal.selectrow(long(ii_clicked_row),true)
end if

ib_cambio_inst = false

if ll_conta_reg = 5 then
	
	// Si no hay datos en el $$HEX1$$e100$$ENDHEX$$rbol
	IF ISVALID(W_BARRA) THEN
		close(w_barra)
	END IF
	gnv_msg.f_mensaje("AA06","","",OK!)
	IF ISVALID(THIS) THEN
		i_cerre=1
		yield()
		// GNU 11/01/2006. Mejora 1/311530
//		if isvalid(w_1105_avisos_con_alim) AND &
		if isvalid(this) AND &
			NOT fg_verifica_parametro("AMBITO GESTION AVISOS")then 
			ib_activate = false
			// GNU 11/01/2006. Mejora 1/311530
//			Close(w_1105_avisos_con_alim)
			Close(this)
		end if
	END IF
end if

// GNU 28-5-2007. Mejora 1/458246
IF cbx_numero.checked= true and il_nro_aviso_desde= il_nro_aviso_hasta THEN
	dw_lista_avisos.selectrow(1,true)
	//AHM (03/01/2008)
	dw_lista_avisos.setItem(1, "seleccionado",1)
	fw_desplegar_rama()
	IF NOT IsValid(this) THEN return
	tv_1.expandall(tv_1.finditem(roottreeitem!,0))
END IF
// FIN GNU
		
end event

event ue_seleccionar_inc;SetPointer(HourGlass!)

fgnu_resetear_s_comunicaciones(gu_comunic)

gu_comunic.is_comunic.intval1  = gi_nro_centro
gu_comunic.is_comunic.intval2  = gi_nro_cmd
gu_comunic.is_comunic.intval3  = gi_nro_puesto
gu_comunic.is_comunic.datval1  = fgnu_fecha_actual()
gu_comunic.is_comunic.datval2  = fgnu_fecha_actual()
gu_comunic.is_comunic.intval4  = fgci_todos 				// Estado
gu_comunic.is_comunic.intval5  = fgci_todos				// tipo 
gu_comunic.is_comunic.intval6  = fgci_todos 				// duracion
gu_comunic.is_comunic.intval7  = fgci_todos 				// tension
gu_comunic.is_comunic.intval8	 = fgci_todos 				// estado mant
gu_comunic.is_comunic.intval10 = 0							// suministro
gu_comunic.is_comunic.Accion_llamada = "Seleccion"
open(w_1234_seleccion_incidencias)

end event

event ue_armar_sql;string ls_select_original,ls_modificacion,retorno

ls_select_original = dw_lista_avisos.describe("datawindow.table.select")

// Si el usuario solo puede ver los avisos del CMD filtro por el cmd 
// del usuario que esta usando la ventana

if ii_tipo_acceso=1 then
	ls_select_original = ls_select_original + " AND gi_avisos_instalacion.nro_cmd = "+ string(gi_nro_cmd) 	//DBE tmp comment 15/03/2000	
end if

	// GNU 17-11-2005 Mejora 1/327452
	If fg_verifica_parametro('GEO') Then
		dw_lista_avisos.setsort(" SECTOR A, GI_AVISOS.NOM_DEPTO A, GI_AVISOS.COD_CALLE A ")	
	else
		dw_lista_avisos.setsort( " GI_AVISOS.F_ALTA D" )	
	end if
	// FIN GNU

ls_modificacion = "DataWindow.table.Select=~"" + ls_select_original + "~""

retorno = dw_lista_avisos.modify(ls_modificacion)

ls_modificACION=LS_MODIFICACION
end event

event ue_sum_imp;//long retorno, ll_codigo, ll_nis_rad = 0, ll_class_id, ll_nro_instalacion, la_array[], ll_num_eltos = 0
//string ls_cadena_busqueda = ""
//int i = 1
//
//setpointer(HourGlass!)
//
//fg_mostrar(true)
//retorno=onis.of_selecciona(ll_codigo)
//fg_mostrar(false)
//setpointer(HourGlass!)
//
//ll_class_id = onis.of_busca_class_id(ll_codigo)
//
//if ll_class_id=1084 then  // ES UNA LINEA ALTA
//
//  SELECT "SGD_TRAMO"."INSTALACION_ORIGEN"  
//    INTO :ll_codigo  
//    FROM "SGD_TRAMO"  
//   WHERE "SGD_TRAMO"."CODIGO" = :ll_codigo   ;
//
//elseif ll_class_id=1085 then  // ES UNA LINEA BAJA
//
//  SELECT "SGD_TRAMO_BT"."INSTALACION_ORIGEN"  
//    INTO :ll_codigo  
//    FROM "SGD_TRAMO_BT"  
//   WHERE "SGD_TRAMO_BT"."CODIGO" = :ll_codigo   ;
//
//end if
//
//if retorno<>1 then 
//	gnv_msg.f_mensaje("EX19","","",OK!)
//	return
//end if
//
//fw_busca_sum_imp(ll_codigo,la_array[],ll_num_eltos,1)
//
//FOR i=1 TO ll_num_eltos STEP 1
//		
//		ll_nro_instalacion = la_array[i]
//		
//		DECLARE cu_cli_imp CURSOR FOR  
//		 SELECT "GI_AVISOS"."NIS_RAD"  
//			FROM "GI_AVISOS"  
//		  WHERE ( "GI_AVISOS"."NRO_INSTALACION" = :ll_nro_instalacion ) AND  
//				  ( "GI_AVISOS"."IND_CLI_IMP" = 1 )   ;
//		
//		open cu_cli_imp;
//		
//		fetch cu_cli_imp into :ll_nis_rad;
//		
//		do while sqlca.sqlcode = 0
//			if (len(ls_cadena_busqueda) = 0) then
//				ls_cadena_busqueda = string(ll_nis_rad) 
//			else
//				ls_cadena_busqueda = ls_cadena_busqueda + " , " + string(ll_nis_rad)
//			end if
//			fetch cu_cli_imp into :ll_nis_rad;
//		loop
//		close cu_cli_imp;
//
//next
//
//if len(ls_cadena_busqueda) < 1 then
//	gnv_msg.f_mensaje("AS05","","",OK!)
//	return
//end if
//
//
////En la variable ls_cadena tengo la lista de NIS  de los clientes que tengo que mostrar en la ventana de suministros importantes
//
//gu_comunic.is_comunic.strval9 = ls_cadena_busqueda
//gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim_graf"
//open(w_3210_lista_suministros_imp)
end event

event ue_brigadas;open(w_3105_lista_asignaciones_brigada)
end event

event ue_mensage;messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta incidencia se encuentra previamente seleccionada",information!,ok!)
ib_activate= False

end event

event m_cambiarincidencia();ib_incid_selec = FALSE

TriggerEvent("ue_seleccionar_inc")
end event

event ue_meliminarasociacineincidencia();// GNU 26-2-2007. Incidencia 0/489508
md_gestion_avisos m_menu

m_menu= This.menuid
m_menu.m_editar.m_seleccindeincidencia.enabled=true
m_menu.m_editar.m_seleccionarincidenciaresueltas.enabled=true
//md_gestion_avisos.m_editar.m_seleccindeincidencia.enabled=true
//md_gestion_avisos.m_editar.m_seleccionarincidenciaresueltas.enabled=true
// FIN GNU

if ii_incidencia = 2 then
	il_incid_2=0
	p_inc_sel_2.visible=false
	st_inc_sel_2.visible=false
	p_indicador_2.visible=false
	if p_inc_sel.visible=false then
		gb_incidencias.visible=false
	end if
elseif ii_incidencia = 1 then
	 il_incid_1=0
	ib_incid_selec = FALSE
	p_inc_sel.visible=false
	st_inc_sel.visible=false
	p_indicador.visible=false
	if p_inc_sel_2.visible=false then
		gb_incidencias.visible=false
	end if
end if
end event

public function datetime fw_o_f_primer_aviso ();///////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_o_f_primer_aviso
//
// Objetivo: Obtiene la fecha del primer aviso.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//      Entrada: --
//      Salida : --
//
// Devuelve:
//
// Fecha 	Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////


datetime ldt_fecha, ldt_fecha_pri
int li_fila, li_cant_filas

li_fila = 1
SetNull(ldt_fecha_pri)
li_cant_filas = dw_lista_avisos.RowCount()

IF li_cant_filas > 0 THEN
	DO WHILE li_fila <= li_cant_filas
		ldt_fecha = dw_lista_avisos.GetItemDateTime(li_fila,"f_alta")
		IF IsNull(ldt_fecha_pri) THEN
			ldt_fecha_pri = ldt_fecha
		ELSE
			IF ldt_fecha < ldt_fecha_pri THEN
				ldt_fecha_pri = ldt_fecha
			END IF
		END IF
			
		li_fila ++
	LOOP
END IF

RETURN ldt_fecha_pri


end function

public subroutine fw_busca_sum_imp (long ll_cod_inst, ref long la_sum_imp[], ref long ll_num_eltos, integer li_co_nivel);//long ll_codigo
//
//	ll_num_eltos ++
//	la_sum_imp[ll_num_eltos] = ll_cod_inst
//
//
//CHOOSE CASE li_co_nivel
//	CASE 1 /* SUBESTACION */
//
//		 DECLARE cu_cli_imp_sub CURSOR FOR  
//		  SELECT "GI_AVISOS_RES"."NRO_INSTALACION"  
//			 FROM "GI_AVISOS_RES"  
//			WHERE ( "GI_AVISOS_RES"."NRO_INST_PADRE" = :ll_cod_inst ) AND  
//					( "GI_AVISOS_RES"."CANT_CLI_IMP" > 0 )   ;
//		
//		open cu_cli_imp_sub;
//		
//		fetch cu_cli_imp_sub into :ll_codigo;
//		do while sqlca.sqlcode = 0
//			fw_busca_sum_imp(ll_codigo,la_sum_imp[],ll_num_eltos,2)
//			fetch cu_cli_imp_sub into :ll_codigo;
//		loop
//		close cu_cli_imp_sub;
//
//	CASE 2 /* SALMT*/
//
//		 DECLARE cu_cli_imp_smt CURSOR FOR  
//		  SELECT "GI_AVISOS_RES"."NRO_INSTALACION"  
//			 FROM "GI_AVISOS_RES"  
//			WHERE ( "GI_AVISOS_RES"."NRO_INST_PADRE" = :ll_cod_inst ) AND  
//					( "GI_AVISOS_RES"."CANT_CLI_IMP" > 0 )   ;
//		
//		open cu_cli_imp_smt;
//		
//		fetch cu_cli_imp_smt into :ll_codigo;
//		do while sqlca.sqlcode = 0
//			fw_busca_sum_imp(ll_codigo,la_sum_imp[],ll_num_eltos,3)
//			fetch cu_cli_imp_smt into :ll_codigo;
//		loop
//		close cu_cli_imp_smt;
//
//	CASE 3 /*CT*/
//
//		 DECLARE cu_cli_imp_ct CURSOR FOR  
//		  SELECT "GI_AVISOS_RES"."NRO_INSTALACION"  
//			 FROM "GI_AVISOS_RES"  
//			WHERE ( "GI_AVISOS_RES"."NRO_INST_PADRE" = :ll_cod_inst ) AND  
//					( "GI_AVISOS_RES"."CANT_CLI_IMP" > 0 )   ;
//		
//		open cu_cli_imp_ct;
//		
//		fetch cu_cli_imp_ct into :ll_codigo;
//		do while sqlca.sqlcode = 0
//			fw_busca_sum_imp(ll_codigo,la_sum_imp[],ll_num_eltos,4)
//			fetch cu_cli_imp_ct into :ll_codigo;
//		loop
//		close cu_cli_imp_ct;
//
//	CASE 4 /*TRAFOMB*/
//
//		 DECLARE cu_cli_imp_tr CURSOR FOR  
//		  SELECT "GI_AVISOS_RES"."NRO_INSTALACION"  
//			 FROM "GI_AVISOS_RES"  
//			WHERE ( "GI_AVISOS_RES"."NRO_INST_PADRE" = :ll_cod_inst ) AND  
//					( "GI_AVISOS_RES"."CANT_CLI_IMP" > 0 )   ;
//		
//		open cu_cli_imp_tr;
//		
//		fetch cu_cli_imp_tr into :ll_codigo;
//		do while sqlca.sqlcode = 0
//			fw_busca_sum_imp(ll_codigo,la_sum_imp[],ll_num_eltos,5)
//			fetch cu_cli_imp_tr into :ll_codigo;
//		loop
//		close cu_cli_imp_tr;
//
//	case else
//		beep(1)
//		
//
//END CHOOSE
end subroutine

public subroutine fw_habilitar_controles (boolean pb_habilitar);md_gestion_avisos lm_menu

lm_menu = this.MenuId


dw_lista_avisos.enabled = pb_habilitar
tv_1.enabled = pb_habilitar

lm_menu.m_editar.m_seleccindeincidencia.enabled = pb_habilitar
lm_menu.m_editar.m_seleccionarincidenciaresueltas.enabled = pb_habilitar
lm_menu.m_editar.m_trabajodecuadrillas.enabled = pb_habilitar
lm_menu.m_editar.m_actualizar.enabled = pb_habilitar

return
end subroutine

public subroutine fn_nombre_ventana (integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_mesa);string ls_centro, ls_cmd, ls_mesa
IF pi_nro_centro= fgci_todos AND pi_nro_cmd= fgci_todos AND pi_nro_mesa= fgci_todos THEN
	This.Title= "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos Pendientes"
ELSE
	IF pi_nro_centro <> fgci_todos THEN
		SELECT nom_centro
		INTO :ls_centro
		FROM sgd_centro
		WHERE nro_centro= :pi_nro_centro and tip_centro=1;
	END IF

	IF pi_nro_cmd <> fgci_todos THEN
		SELECT nom_centro
		INTO :ls_cmd
		FROM sgd_centro
		WHERE nro_centro= :pi_nro_cmd and tip_centro=2;
	END IF

	IF pi_nro_mesa <> fgci_todos THEN
		SELECT nom_centro
		INTO :ls_mesa
		FROM sgd_centro
		WHERE nro_centro= :pi_nro_mesa and tip_centro=3;
	END IF
	This.Title= "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos Pendientes: " + string (ls_centro) + &
				  " - " + string (ls_cmd) + " - " + string (ls_mesa)
END IF
			  
end subroutine

public function integer fnu_resolver_ot ();// GNU 28-6-2007. Mejora 23 (avisos)
long ll_nro_ot, ll_nro_aviso, ll_nro_brigada, ll_res
datetime ldt_fecha_actual

ll_nro_ot=dw_lista_avisos.GetItemNumber(dw_lista_avisos.GetRow(),'avisos_nro_ot')
ldt_fecha_actual=fgnu_fecha_actual()

IF ll_nro_ot > 0 THEN

	UPDATE GI_OT
	SET EST_OT= :fgci_ot_resuelta,
	 	F_HASTA= :ldt_fecha_actual,
	 	F_ACTUAL= :ldt_fecha_actual,
		PROGRAMA= 'w_1105_asoc_man',
	 	USUARIO= :gs_usuario
	WHERE NRO_OT= :ll_nro_ot;

	IF sqlca.sqlcode<> 0 THEN
		return -1
	END IF

	DECLARE lc_brigadas CURSOR FOR
	SELECT NRO_BRIGADA 
	FROM GI_BRIGADA_OT
	WHERE NRO_OT= :ll_nro_ot;

	OPEN lc_brigadas;

	FETCH lc_brigadas INTO :ll_nro_brigada;
	
	DO WHILE sqlca.sqlcode= 0
	
		ll_res=gnu_u_transaction.uf_lock_brigada(ll_nro_brigada)

		UPDATE GI_BRIGADA  
		SET IND_DISPONIBLE = :fgci_disponible,
			F_ACTUAL= :ldt_fecha_actual,
			PROGRAMA= 'w_1105_asoc_man',
		 	USUARIO= :gs_usuario
		WHERE NRO_BRIGADA = :ll_nro_brigada; 	
	
		UPDATE GI_BRIGADA_OT
		SET USUARIO= :gs_usuario,
			PROGRAMA= 'w_1105_asoc_man',
			F_ACTUAL= :ldt_fecha_actual,
			F_HASTA= :ldt_fecha_actual,
			EST_BRIGADA= :fgci_ot_resuelta
		WHERE NRO_BRIGADA = :ll_nro_brigada; 
		
//		ll_res=gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
		gnu_u_transaction.uf_commit()
	
		FETCH lc_brigadas INTO :ll_nro_brigada;
	LOOP

	CLOSE lc_brigadas;

	DECLARE lc_contratas CURSOR FOR
	SELECT NRO_CONTRATA 
	FROM GI_CONTRATA_OT
	WHERE NRO_OT= :ll_nro_ot;

	OPEN lc_contratas;

	FETCH lc_contratas INTO :ll_nro_brigada;
	
	DO WHILE sqlca.sqlcode= 0
	
		UPDATE GI_CONTRATA_OT
		SET USUARIO= :gs_usuario,
			PROGRAMA= 'w_1105_asoc_man',
			F_ACTUAL= :ldt_fecha_actual,
			F_HASTA= :ldt_fecha_actual,
			EST_BRIGADA= :fgci_ot_resuelta
		WHERE NRO_CONTRATA = :ll_nro_brigada; 
	
		FETCH lc_contratas INTO :ll_nro_brigada;
	LOOP

	CLOSE lc_contratas;
END IF

return 0
end function

protected function integer fw_asoc_aviso_inc_rs (readonly integer ai_opcion_picture, picture apicture_inc, readonly integer ai_opcion_llamada, readonly long al_incidencia, readonly long al_fila, readonly integer ai_estado);/////////////////////////////////////////////////////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_asoc_aviso_inc_rs
// 
// Objetivo: Hace las validaciones al asociar avisos a incidencias
//	
// Responsable: JPA 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:   	ai_opcion_picture
//						apicture_inc
//						ai_opcion_llamada
//						al_incidencia
//						al_fila
//						ai_estado
//
//		Salida :  	--
//
// Devuelve:		integer
//
// Fecha      	Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	  		-----------   		---------
// 11/05/2001    JPA				Creacci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////////////////////////////////////////////////////


IF SQLCA.SQLCODE=100 THEN   // LA INCIDENCIA HA SIDO ELIMINADA
	gnv_msg.f_mensaje("AA11","","",OK!)
	ib_incid_selec=FALSE
	
	If ai_opcion_picture = 1 Then	
		//***** PICTURE 1
		il_incid_1 = 0
		p_inc_sel.Visible = False
		st_inc_sel.Visible = False
	Else
		//***** PICTURE 2
		il_incid_2 = 0
		p_inc_sel_2.Visible = False
		st_inc_sel_2.Visible = False
	End If

//	gnu_u_transaction.uf_rollback()
	apicture_inc.Border = False
	dw_lista_avisos.Drag(End!)
	Return 0
End If

If ai_opcion_llamada = 1 Then
	If Not ib_asoc_aviso_con_alim And ai_estado = fgci_incidencia_resuelta And &
		( il_nro_instal = fgcdec_aviso_con_alimentacion Or il_nro_instal = fgcdec_aviso_de_calidad_con_alim ) Then
		MessageBox("Aviso", "No se pueden asociar avisos con alimentaci$$HEX1$$f300$$ENDHEX$$n a incidencias resueltas.")
		
//		gnu_u_transaction.uf_rollback()
		apicture_inc.Border = False
		dw_lista_avisos.Drag(End!)
		Return 0
	End If
Else
	IF ai_estado >= fgci_incidencia_servicio_repuesto THEN
		SELECT "SGD_INCIDENCIA"."F_DETECCION"
		  INTO :idt_fecha_det
		  FROM "SGD_INCIDENCIA"
		 WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :al_incidencia ;


		SELECT "SGD_ESTADO_OPER"."F_ALTA"
		  INTO :idt_fecha_serv_rep
		  FROM "SGD_ESTADO_OPER"
		 WHERE "SGD_ESTADO_OPER"."NRO_INCIDENCIA" = :al_incidencia And
				 "SGD_ESTADO_OPER"."COD_ESTADO" = :fgci_incidencia_servicio_repuesto ;

		IF Not IsNull(idt_fecha_det) And Not IsNull(idt_fecha_serv_rep) THEN
			IF dw_lista_avisos.GetItemDateTime(al_fila,"f_alta") >= idt_fecha_det And &
				dw_lista_avisos.GetItemDateTime(al_fila,"f_alta") <= idt_fecha_serv_rep THEN
			ELSE
				MessageBox("Aviso", "La fecha de alta del aviso " + &
							  String(dw_lista_avisos.GetItemDateTime(al_fila,"f_alta"), "dd/mm/yyyy hh:mm") + &
							  " no concuerda con el rango permitido por la fecha de detecci$$HEX1$$f300$$ENDHEX$$n " + &
							  String(idt_fecha_det, "dd/mm/yyyy hh:mm") + " y servicio repuesto " + &
							  String(idt_fecha_serv_rep, "dd/mm/yyyy hh:mm") + " de la incidencia.")

//				gnu_u_transaction.uf_rollback()
				apicture_inc.Border = False
				dw_lista_avisos.Drag(End!)
				Destroy iuo_avi_2001_nu	
				Return 0
			End If
		End If
		
		If ai_opcion_picture = 1 Then
			ib_inc1 = True
		Else
			ib_inc1 = False
		End If
	End If

End If

Return 1
end function

public function integer fw_desplegar_rama ();/////////////////////////////////////////////////////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_desplegar_rama
// 
// Objetivo: Despliega la rama/s correspondiente a un aviso/s
//			   Si se llama con un aviso seleccionado, marca el aviso en
//			   el $$HEX1$$e100$$ENDHEX$$rbol y filtra $$HEX1$$fa00$$ENDHEX$$nicamente por ese aviso en la dw
//	
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:   	--
//		Salida :  	--
//
// Devuelve:		--
//
// Fecha      	Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	  		-----------   		---------
// 05/02/2001    FDO				Creacci$$HEX1$$f300$$ENDHEX$$n
// 21/10/2003    FDO				Jerarqu$$HEX1$$ed00$$ENDHEX$$a din$$HEX1$$e100$$ENDHEX$$mica de instalaciones
///////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_aviso,ll_nro_instalacion,ll_contador,ll_nro_inst_padre,ll_handle_sig,ll_fila_selecionada,ll_cant_av,ll_avisos_total
long ll_handle_padre,ll_nro_ot,ll_manejador,ll_posicion,ll_codigo,ll_fila,ll_instalacion,ll_contafilas,ll_cant_av_zona
int li_clase_aviso,ll_tipo_instalacion,li_item,li_ind_inc,li_sitio,li_otras_smt,li_tension
string ls_nom_instalacion,ls_cadena,ls_fase,ls_fase_comun,ls_fase_afec='000',ls_select
datetime ldt_f_actual
long ll_zona, ll_cmd, ll_sector, ll_tipo_aviso

tv_1.setredraw(false)

if cbx_filtrar_fechas.checked = false then
	ids_f_hasta = string(fgnu_fecha_actual())
end if

ll_zona = dw_ambito.GetItemNumber(1, 'nro_centro')
ll_cmd =  dw_ambito.getitemnumber(1,"nro_cmd") 
ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")

DECLARE LC_RAMA_AVISO CURSOR FOR  
select  GI_AVISOS_INSTALACION.NRO_INSTALACION,
	  GI_AVISOS_INSTALACION.NRO_INST_PADRE,
	  GI_AVISOS_INSTALACION.CLASE_AVISO,
	  GI_AVISOS_INSTALACION.TENSION
FROM GI_AVISOS_INSTALACION  
WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :ll_nro_aviso
start with nro_instalacion in (:fgcdec_aviso_con_alimentacion,:fgcdec_aviso_de_calidad_con_alim) and  GI_AVISOS_INSTALACION.NRO_AVISO = :ll_nro_aviso
connect by prior nro_instalacion = nro_inst_padre and GI_AVISOS_INSTALACION.NRO_AVISO = :ll_nro_aviso;

this.enabled=false

treeviewitem arbol

ll_fila_selecionada=dw_lista_avisos.getselectedrow(0)

open(w_despliega_arbol)

DO WHILE (ll_fila_selecionada > 0)
	
	ll_contafilas ++
	Yield()
	IF NOT IsValid(This) THEN
		Close(w_despliega_arbol)
		Return -1
	END IF
	
	Setpointer(hourglass!)
	
	ll_nro_aviso = dw_lista_avisos.object.avisos_nro_aviso[ll_fila_selecionada]
	
	OPEN LC_RAMA_AVISO;
	
	FETCH LC_RAMA_AVISO INTO :ll_nro_instalacion,:ll_nro_inst_padre,:li_clase_aviso,:li_tension;
	
	DO WHILE SQLCA.SQLCODE = 0
		
		ii_clicked_row=dw_lista_instal.find( "nro_instalacion = " + string(ll_nro_instalacion) + " and clase_aviso = " + string(li_clase_aviso) , 1, dw_lista_instal.rowcount())
		
		if ii_clicked_row < 1 then
			
			DECLARE LC_CUENTAS DYNAMIC CURSOR FOR SQLSA;
			
			// FDO Mejora Pan 221666
			
				ls_select = 	" SELECT COUNT(GI_AVISOS_INSTALACION.NRO_AVISO), " + &
				"			GI_AVISOS_INSTALACION.NRO_INSTALACION, " + &
				"			GI_AVISOS_INSTALACION.NOM_INSTALACION, " + &
				"			GI_AVISOS_INSTALACION.TIPO_INSTALACION , " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_ZONA), " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_CMD),  " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_SECTOR), " + &
				"			MAX(GI_AVISOS_INSTALACION.NRO_OT), " + &
				"			MAX(GI_AVISOS_INSTALACION.F_ACTUAL), " + &
				"			MAX(GI_AVISOS_INSTALACION.IND_INCIDENCIA), " + &
				"			MAX(GI_AVISOS_INSTALACION.IND_OTRAS_SMT)  " + &			
				"  FROM 	GI_AVISOS_INSTALACION " + &
				"  WHERE	GI_AVISOS_INSTALACION.NRO_INST_PADRE = " + string(ll_nro_inst_padre) + &	
				"	 AND	GI_AVISOS_INSTALACION.CLASE_AVISO = " + string(li_clase_aviso) + &	
				"	 AND GI_AVISOS_INSTALACION.EST_AVISO <= " + string(fgci_aviso_enviado_brigada) 
			
				LS_SELECT = LS_SELECT + "     AND nro_zona=decode(" + string(ll_zona) + ", 0, nro_zona,"  + string(ll_zona)+ ") " + &
	     		"     AND nro_cmd=decode("  + string(ll_cmd) + " , 0, nro_cmd,"  + string(ll_cmd) + ") " + &
	  			"     AND nro_sector=decode(" + string(ll_sector) + " , 0, nro_sector," + string(ll_sector) + ")" 
			
				if cbx_filtrar_fechas.checked = true then	
					LS_SELECT = LS_SELECT + "	 AND GI_AVISOS_INSTALACION.F_ALTA >= TO_DATE('" + ids_f_desde + "','DD/MM/YYYY HH24:MI:SS') " + &
					"	 AND GI_AVISOS_INSTALACION.F_ALTA <= TO_DATE('" + ids_f_hasta + "','DD/MM/YYYY HH24:MI:SS') " 
				end if
				
				if cbx_filtrar_alcances.checked = true then				  
					LS_SELECT = LS_SELECT + "	 AND NVL(GI_AVISOS_INSTALACION.CO_ALCANCE,0) IN (" + is_alcances + ")" 
				end if
				
				//GNU 13-4-2007. Mejora 1/465491
				IF cbx_numero.checked= true then
					IF em_desde.text="" then
						LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_hasta.text
					ELSEIF em_hasta.text="" then
						LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_desde.text
					ELSE
						LS_SELECT += " and GI_AVISOS_INSTALACION.NRO_AVISO>=" + em_desde.text + &
									 " and GI_AVISOS_INSTALACION.NRO_AVISO<=" + em_hasta.text
					END IF
				END IF
				// FIN GNU

				//JHE SFP DEO12-160 23/10/2012

				IF cbx_filtrar_activos.checked= true THEN
						ll_tipo_aviso = dw_avisos_activos.GetitemNumber(1,"tip_aviso")
						LS_SELECT += " AND GI_AVISOS_INSTALACION.TIPO_AVISO="+string(ll_tipo_aviso)
				END IF
				//JHE SFP DEO12-160 23/10/2012
								
				LS_SELECT = LS_SELECT + " GROUP BY	GI_AVISOS_INSTALACION.NRO_INSTALACION ," + &
					"				GI_AVISOS_INSTALACION.NOM_INSTALACION ," + &
					"				GI_AVISOS_INSTALACION.TIPO_INSTALACION"	
					
		
			// FDO Mejora Pan 221666
			
			PREPARE SQLSA FROM :ls_select;
			
			IF sqlca.sqlcode<>0 THEN 
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Error al hacer el PREPARE del cursor din$$HEX1$$e100$$ENDHEX$$mico LC_CUENTAS: " + sqlca.sqlerrtext)
				return -1
			END IF
			
			OPEN DYNAMIC LC_CUENTAS;
	
			IF sqlca.sqlcode<>0 THEN 
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Error al hacer el OPEN del cursor din$$HEX1$$e100$$ENDHEX$$mico LC_CUENTAS: " + sqlca.sqlerrtext)
				return -1
			END IF		
	
			FETCH LC_CUENTAS 	INTO 		:ll_cant_av,
														:ll_instalacion,
														:ls_nom_instalacion,
														:ll_tipo_instalacion,
														:ii_nro_centro,
														:ii_nro_cmd,
														:ii_nro_mesa,
														:ll_nro_ot,
														:ldt_f_actual,
														:li_ind_inc,
														:li_otras_smt;
	
			DO WHILE SQLCA.SQLCODE = 0
				
				yield()
				IF NOT IsValid(This) THEN
					Close(w_despliega_arbol)
					Return -1
				END IF
				
				Setpointer(hourglass!)
				
				IF sqlca.sqlcode<> 0 then
					Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo cargar la informaci$$HEX1$$f300$$ENDHEX$$n de la tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext ,information!,ok!)
					this.enabled=true
					Return -1
				END IF
				
				ll_avisos_total=ll_cant_av
				
				IF ll_avisos_total > 0 THEN
				//Sumatorio de fases Para el arbolito FDO
		
					if li_clase_aviso =  fgci_clase_avi_normal and &
						ll_instalacion <> fgcdec_aviso_con_alimentacion  and &
						gb_red_trifasica=false then
						
						declare lc_cursor_fases cursor for
						select fase 
						from gi_avisos_instalacion
						where nro_instalacion = :ll_instalacion
							and est_aviso = 1
							and clase_aviso = :li_clase_aviso;
							
						open lc_cursor_fases;
						
						fetch lc_cursor_fases into :ls_fase_comun;	
						
						do while sqlca.sqlcode=0 and ls_fase_afec <> '111'
							
							li_sitio=pos(ls_fase_comun,'1',1)
							
							do while li_sitio >= 1
								ls_fase_afec = replace(ls_fase_afec,li_sitio,1,'1')
								li_sitio=pos(ls_fase_comun,'1',li_sitio + 1)
							loop
							
							fetch lc_cursor_fases into :ls_fase_comun;		
						loop
						
						close lc_cursor_fases;
						
						Select descripcion 
						into :ls_fase_afec
						from sgd_valor
						where codif = 'FASE' and
								valor = :ls_fase_afec;
								
					end if
					
					if ll_nro_inst_padre= fgcdec_aviso_de_calidad then
						li_item=tv_1.f_icono_arbol(fgcdec_aviso_de_calidad_con_alim)
					else
						li_item=tv_1.f_icono_arbol(ll_tipo_instalacion)
					end if
					
					IF isnull(ls_fase_afec) or ls_fase_afec = '000' then
						ll_manejador = tv_1.insertitemfirst(ll_handle_padre, ls_nom_instalacion + space(5) +'  (' +string(ll_avisos_total) + ')'  , li_item)
					ELSE
						ll_manejador = tv_1.insertitemfirst(ll_handle_padre, ls_nom_instalacion + space(5) + ' (' + ls_fase_afec+ ')   (' +string(ll_avisos_total) + ')'  , li_item)
					END IF
	
				
					//VALIDO PARA VER SI HAY ALGUNA OT SOBRE LA INSTALACION
					IF ll_nro_ot > 0 THEN
						 ll_posicion = tv_1.finditem(childtreeitem!, ll_handle_padre)
						 tv_1.getitem(ll_manejador,arbol)
						 arbol.bold = true
						 arbol.label=arbol.label + space(5) + "(OT)"
						 tv_1.setitem(ll_manejador, arbol)
					END IF
						
					//VALIDO PARA VER SI HAY ALGUNA INCIDENCIA SOBRE LA INSTALACION
					IF  li_ind_inc > 0  THEN
						ll_posicion = tv_1.finditem(childtreeitem!, ll_handle_padre)
						tv_1.getitem(ll_manejador,arbol)
						arbol.bold = true
						arbol.label=arbol.label + space(5) + "(I)"
						tv_1.setitem(ll_manejador, arbol)
					END IF
				
					//LO MISMO PARA OTRAS SMT
					IF li_otras_smt > 0 THEN
						ll_posicion = tv_1.finditem(childtreeitem!, ll_handle_padre)
						tv_1.getitem(ll_manejador,arbol)
						arbol.label=arbol.label + space(5) + "*"
						tv_1.setitem(ll_manejador, arbol)
					END IF
					
					ll_fila = dw_lista_instal.insertrow(0)
					IF ll_instalacion=ll_nro_instalacion THEN
						ll_handle_sig=ll_manejador	
						dw_lista_instal.setitem(ll_fila, "expandido", 1)
					ELSE
						dw_lista_instal.setitem(ll_fila, "expandido", 0)
					END IF
					dw_lista_instal.setitem(ll_fila, "manejador", ll_manejador)
					dw_lista_instal.setitem(ll_fila, "nro_inst_padre", ll_nro_inst_padre)
					dw_lista_instal.setitem(ll_fila, "nro_instalacion", ll_instalacion)
					dw_lista_instal.setitem(ll_fila, "tip_instal", ll_tipo_instalacion)
					dw_lista_instal.setitem(ll_fila, "nom_instalacion", ls_nom_instalacion)
					dw_lista_instal.setitem(ll_fila, "nro_ot", ll_nro_ot)
					dw_lista_instal.setitem(ll_fila, "nro_centro", ii_nro_centro)
					dw_lista_instal.setitem(ll_fila, "nro_cmd", ii_nro_cmd)
					dw_lista_instal.setitem(ll_fila, "nro_mesa", ii_nro_mesa)
					dw_lista_instal.setitem(ll_fila, "fase", ls_fase_afec)//DBE 29/03/2000 13:23
					ls_fase_afec='000'
					dw_lista_instal.setitem(ll_fila, "ind_incidencia", li_ind_inc)
					dw_lista_instal.setitem(ll_fila, "f_actual", ldt_f_actual)
					dw_lista_instal.setitem(ll_fila, "clase_aviso", li_clase_aviso)
					dw_lista_instal.setitem(ll_fila, "cant_avisos", ll_avisos_total)
					dw_lista_instal.setitem(ll_fila, "ind_otras_smt", li_otras_smt)
					dw_lista_instal.setitem(ll_fila, "tension", li_tension)
					
					ii_nivel_tension = li_tension
					
			END IF		
			FETCH LC_CUENTAS 	INTO 		:ll_cant_av,
														:ll_instalacion,
														:ls_nom_instalacion,
														:ll_tipo_instalacion,
														:ii_nro_centro,
														:ii_nro_cmd,
														:ii_nro_mesa,
														:ll_nro_ot,
														:ldt_f_actual,
														:li_ind_inc,
														:li_otras_smt;
	
			
			LOOP
			
			CLOSE LC_CUENTAS;
			
			tv_1.Expanditem ( ll_handle_padre )	
			ll_handle_padre=ll_handle_sig
			
		ELSE
			
			ll_handle_padre=dw_lista_instal.object.manejador[ii_clicked_row]
			ll_manejador=ll_handle_padre
			dw_lista_instal.setitem(ii_clicked_row, "expandido", 1)
		END IF
		
		FETCH LC_RAMA_AVISO INTO :ll_nro_instalacion,:ll_nro_inst_padre,:li_clase_aviso,:li_tension;
		
	LOOP
	
	CLOSE LC_RAMA_AVISO;

	ll_fila_selecionada=dw_lista_avisos.getselectedrow(ll_fila_selecionada)

LOOP

//uo_1.visible=false

IF isvalid(w_despliega_arbol) THEN
	close(w_despliega_arbol)
END IF

il_handle=ll_manejador

If ll_contafilas = 1 then
	tv_1.selectitem(ll_manejador)
	tv_1.setfocus()
	dw_lista_instal.selectrow(long(ii_clicked_row),true)	
End if

tv_1.setredraw(true)

this.enabled=true

return 1
end function

public function integer fw_incidencia_activa (long al_num_instalacion, integer ai_indicativo, readonly powerobject ap_powerobject, integer ai_tipo_instalacion);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fg_incidencia_activa
//
// Objetivo: Verificar que el aviso asociado a la instalaci$$HEX1$$f300$$ENDHEX$$n cuente con una incidencia y si esta incidencia esta siendo tratada
//           por un usuario retornar un valor el cual indica que esta instalacion no se puede crear una nueva incidencia hasta 
//           que el usuario libere la que en su momento esta trabajando.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: al_num_instalacion
//        Salida: num$$HEX1$$e900$$ENDHEX$$rico
//
// Devuelve: num$$HEX1$$e900$$ENDHEX$$rico
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 21/03/2013	         JHE
//		
/////////////////////////////////////////////////////////// 
integer li_valor
boolean lb_valor= TRUE



if ai_indicativo = 2 then
	
	If ai_tipo_instalacion = 7 Then

		Select ind_incid_activa
			into :li_valor
		from gi_avisos_instalacion
		where nro_instalacion = :al_num_instalacion
		and tipo_instalacion = 7 using gnu_u_transaction.sqlcpropio;
	elseif ai_tipo_instalacion = 5 Then
	   Select ind_incid_activa
			into :li_valor
		from gi_avisos_instalacion
		where nro_inst_padre = :al_num_instalacion
		and tipo_instalacion = 7 using gnu_u_transaction.sqlcpropio;
	end if
	
	if li_valor = 1 and ai_tipo_instalacion = 7 then
		Messagebox("Aviso","La instalacion tiene una incidencia que la esta gestionando otro usuario ",Exclamation!)
		return 2
	elseif li_valor = 1 and ai_tipo_instalacion = 5 then
		Messagebox("Aviso","Existe una Salida de Baja que tiene una incidencia, que esta siendo gestionanda por otro usuario ",Exclamation!)
		return 2		
	elseif ai_tipo_instalacion = 7 Then
		update gi_avisos_instalacion 
		set ind_incid_activa = 1 
		where nro_instalacion = :al_num_instalacion and 
		tipo_instalacion = 7 and
		ind_incid_activa = :ai_indicativo using gnu_u_transaction.sqlcpropio;	
		
		gnu_u_transaction.uf_commit(ap_powerobject,lb_valor )
	end if	
	
elseif ai_indicativo = 1 then
	
	If ai_tipo_instalacion = 7 Then

		Select ind_incid_activa
			into :li_valor
		from gi_avisos_instalacion
		where nro_instalacion = :al_num_instalacion
		and tipo_instalacion = 7 using gnu_u_transaction.sqlcpropio;
		
	end if
	
	if li_valor = 1 then
		
		update gi_avisos_instalacion 
			set ind_incid_activa = 2 
			where nro_instalacion = :al_num_instalacion 
			and ind_incid_activa = 1 using gnu_u_transaction.sqlcpropio;

		gnu_u_transaction.uf_commit(ap_powerobject,lb_valor )
		
	end if
	

	
end if

return 1
end function

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Abre la ventana avisos con alimentacion
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//             		Creaci$$HEX1$$f300$$ENDHEX$$n      	22-1-96   	JH
//					Modificaci$$HEX1$$f300$$ENDHEX$$n    	22/04/96  	HMA
//					Modificaci$$HEX1$$f300$$ENDHEX$$n	18/03/97  	AFS
//					Modificaci$$HEX1$$f300$$ENDHEX$$n   	01/08/97  	FDO
//
/////////////////////////////////////////////////////////////////////////
//FG_COLOCAR_VENTANA_MAIN(W_1105_AVISOS_CON_ALIM)
// GNU 17-11-2005 Mejora 1/327452
//if gi_pais = 8 then 
//	dw_lista_avisos.dataobject = "d_avi_2001_pr_lista_avisos_mold"
//
//// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. 22/06/2005. Incidencia de Panam$$HEX1$$e100$$ENDHEX$$. Nuevos campos: Numero de Aviso, Provincia, Distrito, Saifi y Saidi.
////elseif gi_pais = 4 then 
////	dw_lista_avisos.dataobject = "d_avi_2001_pr_lista_avisos_pana"
//// Fin. Sgo.
//end if 
// FIN GNU
dw_inc_asoc.settransobject(sqlca)
dw_otras_inst.settransobject(sqlca)
dw_lista_avisos.SetTransObject(SQLCA)

//AHM (03/02/2011) ASUR 1022795
ii_seleccionesMenu = 0 //Inicializaci$$HEX1$$f300$$ENDHEX$$n de la variable que indica si ya se ha seleccionado alguna opci$$HEX1$$f300$$ENDHEX$$n del men$$HEX2$$fa002000$$ENDHEX$$del listado de avisos

If fg_verifica_parametro('GEO') and gi_pais = 4 Then
		// GNU 19-12-2007. Incidencia 0/494580
//			dw_lista_avisos.object.gi_avisos_nom_depto_t.text = 'Corregimiento'
//			dw_lista_avisos.object.sector_t.text =  'Provincia' 
// GNU 23-8-2007. Incidencia 0/523077
			dw_lista_avisos.object.gi_avisos_nom_prov_t.text = 'Distrito' 
			dw_lista_avisos.object.gi_avisos_nom_depto_t.text = 'Corregimiento'
End If

iu_avi_2004_pr	= CREATE u_avi_2004_pr_form_inf_resumen
iuo_gen_comunic  = CREATE u_generico_comunicaciones
	
iuo_gen_comunic.is_comunic = gu_comunic.is_comunic
	
// Se crean los objetos de trabajo
iuo_1234			  = CREATE u_generico_comunicaciones
iuo_2301			  = CREATE u_generico_comunicaciones
iuo_1203			  = CREATE u_generico_comunicaciones
iuo_gen_comunic1 = CREATE u_generico_comunicaciones

fgnu_resetear_s_comunicaciones(gu_comunic1)
	
is_accion_llamada = iuo_gen_comunic.is_comunic.accion_llamada
st_otras.visible = FALSE
dw_otras_inst.visible = FALSE


// FDO Mejora Pan 221666

dw_filtro_fechas.fnu_habi_f_hasta(true)
dw_filtro_fechas.fnu_habilitar_f_desde(true)

// FDO Mejora Pan 221666

// GNU 16-4-2007. Mejora 1/465491
	il_nro_aviso_desde=1
	SELECT MAX (nro_aviso)
	INTO :il_nro_aviso_hasta
	FROM GI_AVISOS;
// FIN GNU

PostEvent("ue_postopen")
end event

event activate;////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Evento:  Activate
//
// Objetivo: Dependiendo desde que ventana se retorna a esta 
//				 se realizan distintas acciones
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1997   FDO
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   04/09/1998   MATO (Avisos inc. 12)
//
////////////////////////////////////////////////////////////////////////////////////////////////////

u_avi_1002_nu_generico u_avi_1002_nu
int i_co_nivel, li_fila_sel
decimal{0} ldec_nro_inst	
boolean lb_con_alim
long ll_manejador,ll_posicion,ll_retorna
datetime ldt_fecha
int li_avi_res
long ldec_nro_instalacion,li_cant_avisos, ll_zona, ll_cmd, ll_sector
treeviewitem arbol
// GNU 26-2-2007. Incidencia 0/489508
md_gestion_avisos m_menu

long	ll_aux					//Variable de control del bucle que deselecciona las filas

m_menu= This.menuid


ib_activate= True
yield()

If Not IsValid(This) Then Return
//this.setfocus()
SetPointer(HourGlass!)

IF Not IsValid(This) THEN
	Return
END IF

//AHM (14/01/2010) Incidencia 0/100157620
IF dw_ambito.rowCount() > 0 THEN
	ll_zona = dw_ambito.GetItemNumber(1, 'nro_centro')
	ll_cmd =  dw_ambito.getitemnumber(1,"nro_cmd") 
	ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")
ELSE
	ll_zona = 0
	ll_cmd =  0
	ll_sector = 0
END IF
// Obtengo el valor de la variable global de comunicaciones
// enviada por alguna de las ventanas llamadas


iuo_gen_comunic1.is_comunic = gu_comunic1.is_comunic 

CHOOSE CASE iuo_gen_comunic1.is_comunic.programa_retorno 
			   
	CASE "iw_6201"		

		u_avi_1002_nu = CREATE u_avi_1002_nu_generico

		IF iuo_gen_comunic1.is_comunic.accion_retorno = "Asignada" THEN
			IF iuo_gen_comunic1.is_comunic.programa_llamante = "w_1105_avi_instal" THEN
				// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que actualiza el nro. de OT 
				// en Avisos y Avisos_res

				u_avi_1002_nu.fnu_asignar_brigada_inst(iuo_gen_comunic1.is_comunic.longval2, &
						il_nro_instal)
						
				///ACTUALIZAMOS LOS DATOS EN PANTALLA CON LOS NU$$HEX1$$cb00$$ENDHEX$$VOS DATOS
				dw_lista_instal.SetItem(ii_fila_clickeada,"nro_ot",iuo_gen_comunic1.is_comunic.longval2)			
				dw_lista_instal.AcceptText()
				il_nro_ot=iuo_gen_comunic1.is_comunic.longval2
				ll_posicion = tv_1.finditem(CurrentTreeItem!, il_handle)
				tv_1.getitem(il_handle,arbol)
				IF arbol.bold=false then
					arbol.bold = true
					arbol.label=arbol.label + space(5) + "(OT)"
					tv_1.setitem(il_handle, arbol)
				END IF
				dw_lista_avisos.SetRedraw(False)
            dw_lista_avisos.Retrieve(il_nro_instal,ii_clase_aviso,&
						fgcdec_aviso_de_calidad, fgcdec_aviso_de_calidad_con_alim,&
						fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector, ids_f_desde, ids_f_hasta,ii_alcances[],il_nro_aviso_desde, il_nro_aviso_hasta)
// Modificado Por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004. Se a$$HEX1$$f100$$ENDHEX$$adieron como argumentos ids_f_desde y ids_f_hasta.
//						fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector)
// Fin. Sgo.
				dw_lista_avisos.SetRedraw(True)
				
			ELSEIF iuo_gen_comunic1.is_comunic.programa_llamante = "w_1105_avi_aviso" THEN

				// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que actualiza el nro. de OT 
				// en Avisos y Avisos_res

				u_avi_1002_nu.fnu_asignar_brigada_avi(iuo_gen_comunic1.is_comunic.longval2, &
						il_nro_avi)
	
				dw_lista_avisos.SetItem(ii_fila_clickeada,"avisos_nro_ot",iuo_gen_comunic1.is_comunic.longval2)			
				
				dw_lista_avisos.SetRedraw(False)
				dw_lista_avisos.Retrieve(il_nro_instal,ii_clase_aviso,&
				fgcdec_aviso_de_calidad, fgcdec_aviso_de_calidad_con_alim,&
				fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector, ids_f_desde, ids_f_hasta,ii_alcances[],il_nro_aviso_desde, il_nro_aviso_hasta)
// Modificado Por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004. Se a$$HEX1$$f100$$ENDHEX$$adieron como argumentos ids_f_desde y ids_f_hasta.
//				fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector)
// Fin. Sgo.

				dw_lista_avisos.SetRedraw(True)

				dw_lista_avisos.ii_fila_clickeada = ii_fila_avi_clic

				dw_lista_avisos.ScrollToRow(ii_fila_avi_clic)				
				dw_lista_avisos.SelectRow(0,False)		
				dw_lista_avisos.SetRow(ii_fila_avi_clic)
				dw_lista_avisos.SelectRow(ii_fila_avi_clic,True)		
				//AHM (03/01/2008)
				FOR ll_aux= 1 TO dw_lista_avisos.rowCount()
					dw_lista_avisos.setItem(ll_aux, "seleccionado",0)		
				NEXT
				dw_lista_avisos.setItem(ii_fila_avi_clic, "seleccionado",1)
			END IF
		ELSEIF iuo_gen_comunic1.is_comunic.accion_retorno = "Finalizada" THEN

// GNU 1-6-2006. Mejora 1/339429
//	      If iuo_gen_comunic1.is_comunic.programa_llamante = "w_1105_avi_aviso" THEN
		If iuo_gen_comunic1.is_comunic.programa_llamante = "w_1105_avi_aviso"  OR &
			iuo_gen_comunic1.is_comunic.programa_llamante = "w_1203_inf_aviso"THEN						

				u_avi_1002_nu.fnu_asignar_brigada_avi(iuo_gen_comunic1.is_comunic.longval2, il_nro_avi)

//AHM (12/01/2010) incidencia 0/100157617	
//				If not iu_avi_2004_pr.fpr_act_avi_por_fin_ot(il_nro_avi,il_avis_nro_ins,ii_cli_imp_lista,ii_ind_pel_lista)= 1 Then
			   If not iu_avi_2004_pr.uf_finalizarAviso(il_nro_avi)= 1 Then
					ib_activate= False
					RETURN
				End If	
				
				this.triggerevent("ue_refrescar",0,2)	
				
				IF not IsValid (this) then 
					return
				END IF
				
	         dw_lista_avisos.SetRedraw(False)

				dw_lista_avisos.SetItem(ii_fila_clickeada,"avisos_nro_ot",0)			

				dw_lista_avisos.Retrieve(il_nro_instal,ii_clase_aviso,&
				fgcdec_aviso_de_calidad, fgcdec_aviso_de_calidad_con_alim, &
				fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector, ids_f_desde, ids_f_hasta,ii_alcances[],il_nro_aviso_desde, il_nro_aviso_hasta)
// Modificado Por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004. Se a$$HEX1$$f100$$ENDHEX$$adieron como argumentos ids_f_desde y ids_f_hasta.
//				fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector)
// Fin. Sgo.

				dw_lista_avisos.ii_fila_clickeada = ii_fila_avi_clic

				dw_lista_avisos.ScrollToRow(ii_fila_avi_clic)				
				dw_lista_avisos.SelectRow(0,False)				
				dw_lista_avisos.SetRow(ii_fila_avi_clic)
				dw_lista_avisos.SelectRow(ii_fila_avi_clic,True)				
				//AHM (03/01/2008)
				FOR ll_aux= 1 TO dw_lista_avisos.rowCount()
					dw_lista_avisos.setItem(ll_aux, "seleccionado",0)		
				NEXT
				dw_lista_avisos.setItem(ii_fila_avi_clic, "seleccionado",1)
				dw_lista_avisos.SetRedraw(True)
			
		ElseIf iuo_gen_comunic1.is_comunic.programa_llamante = "w_1105_avi_instal" Then
				// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que actualiza el nro. de OT 
				// en Avisos y Avisos_res

				/* INICIO.TDA EDM-12 02/10/2017 */
				IF(il_nro_instal = 99999999) THEN
					MessageBox("Error", "Ha seleccionado una instalaci$$HEX1$$f300$$ENDHEX$$n no valida.")
				ELSE
					ll_retorna = u_avi_1002_nu.fnu_anular_ot_inst(il_nro_instal)
				
					IF ll_retorna = 0 then
						dw_lista_instal.SetItem(ii_fila_clickeada,"nro_ot",0)			
						ll_posicion = tv_1.finditem(CurrentTreeItem!, il_handle)
						tv_1.getitem(il_handle,arbol)
						arbol.bold = false
						arbol.label=Mid(arbol.label,1,len(arbol.label)-6)
						tv_1.setitem(il_handle, arbol)
					END IF
					
					dw_lista_avisos.SetRedraw(False)
					dw_lista_avisos.Retrieve(il_nro_instal,ii_clase_aviso,&
					fgcdec_aviso_de_calidad, fgcdec_aviso_de_calidad_con_alim,&
					fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector, ids_f_desde, ids_f_hasta,ii_alcances[],il_nro_aviso_desde, il_nro_aviso_hasta)
					// Modificado Por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004. Se a$$HEX1$$f100$$ENDHEX$$adieron como argumentos ids_f_desde y ids_f_hasta.
					// fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector)
					// Fin. Sgo.
	
					dw_lista_avisos.SetRedraw(True)
				END IF
				/* FIN.TDA EDM-12 02/10/2017 */


	     End If
	 END IF	

  	 DESTROY u_avi_1002_nu
	
CASE "iw_2120_b"		

		// Si acced$$HEX2$$ed002000$$ENDHEX$$al cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n de un aviso.

		// Controlo que haya sido seleccionada una instalaci$$HEX1$$f300$$ENDHEX$$n.
		IF iuo_gen_comunic1.is_comunic.accion_retorno = "Seleccionada" THEN
	
			u_avi_1002_nu = CREATE u_avi_1002_nu_generico
		
			ii_fila = dw_lista_instal.GetRow()
			ldec_nro_inst = dw_lista_instal.GetItemDecimal(ii_fila, "nro_instalacion")
	
			// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que actualiza la jerarqu$$HEX1$$ed00$$ENDHEX$$a de 
			// instalaciones, y por ende las tablas 'avisos',
			// 'aviso_ins' y 'avisos_res'.
		
				li_fila_sel = dw_lista_avisos.GetRow()
			
				IF li_fila_sel > 0 THEN
	
					if u_avi_1002_nu.fnu_cambiar_alim_avi(dw_lista_avisos,li_fila_sel,&
							dw_lista_instal,&
							dw_lista_avisos.GetItemNumber(li_fila_sel,"avisos_nro_aviso"),&					
							iuo_gen_comunic1.is_comunic.decval1,&
							dw_lista_avisos.GetItemNumber(li_fila_sel,"avisos_nis_rad"),&
							dw_lista_avisos.GetItemNumber(li_fila_sel,"avisos_nro_ot"),&
							dw_lista_avisos.GetItemDateTime(li_fila_sel,"f_alta"), &
							iuo_gen_comunic1.is_comunic.strval4,1, &
							dw_lista_avisos.GetItemNumber(li_fila_sel,"ind_aviso_consulta"))  = -1 then //LSH ** DDAG-255 ** 30/01/2014 ** Se agrego el 0 como nuevo argumento de la funcion 
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
					else
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 1) //Commit
					end if
					
					END IF

			// Se actualiza el jerarquizador con los
			// cambios de alimentaci$$HEX1$$f300$$ENDHEX$$n
					this.triggerevent("ue_refrescar",0,2)	
					DESTROY u_avi_1002_nu
			END IF
	
	CASE "iw_2120_c"
		
		// Si acced$$HEX2$$ed002000$$ENDHEX$$a asignarle alimentaci$$HEX1$$f300$$ENDHEX$$n a un aviso.
		// Controlo que haya sido seleccionada una instalaci$$HEX1$$f300$$ENDHEX$$n.

		// Controlo que haya sido seleccionada una instalaci$$HEX1$$f300$$ENDHEX$$n.
		IF iuo_gen_comunic1.is_comunic.accion_retorno = "Seleccionada" THEN
	
			u_avi_1002_nu = CREATE u_avi_1002_nu_generico
		
			ii_fila = dw_lista_instal.GetRow()
			ldec_nro_inst = dw_lista_instal.GetItemDecimal(ii_fila, "nro_instalacion")
	
			// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que actualiza la jerarqu$$HEX1$$ed00$$ENDHEX$$a de 
			// instalaciones, y por ende las tablas 'avisos',
			// 'aviso_ins' y 'avisos_res'.
		
				li_fila_sel = dw_lista_avisos.GetRow()
			
				IF li_fila_sel > 0 THEN
	
					if u_avi_1002_nu.fnu_cambiar_alim_avi(dw_lista_avisos,li_fila_sel,&
							dw_lista_instal,&
							dw_lista_avisos.GetItemNumber(li_fila_sel,"avisos_nro_aviso"),&					
							iuo_gen_comunic1.is_comunic.decval1,&
							dw_lista_avisos.GetItemNumber(li_fila_sel,"avisos_nis_rad"),&
							dw_lista_avisos.GetItemNumber(li_fila_sel,"avisos_nro_ot"),&
							dw_lista_avisos.GetItemDateTime(li_fila_sel,"f_alta"), &
							iuo_gen_comunic1.is_comunic.strval4,3, &
							dw_lista_avisos.GetItemNumber(li_fila_sel,"ind_aviso_consulta"))   = -1 then //LSH ** DDAG-255 ** 30/01/2014 ** Se agrego el 0 como nuevo argumento de la funcion 
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
					else
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 1) //Commit
					end if
					
					END IF

			// Se actualiza el jerarquizador con los
			// cambios de alimentaci$$HEX1$$f300$$ENDHEX$$n
					this.triggerevent("ue_refrescar",0,2)	
					DESTROY u_avi_1002_nu
			END IF
	
	CASE ELSE
		
		// Si vengo de la ventana de selecci$$HEX1$$f300$$ENDHEX$$n de Incidencia
		IF gu_comunic.is_comunic.programa_retorno = "iw_1234" THEN
	
			iuo_1234.is_comunic = gu_comunic.is_comunic 

			IF iuo_1234.is_comunic.longval1 <> 0 AND iuo_1234.is_comunic.accion_retorno = "Seleccionada" THEN
					
				if gb_incidencias.visible=false then
					gb_incidencias.visible=true
				end if
				IF 	(il_incid_1 = iuo_1234.is_comunic.longval1 or il_incid_2 = iuo_1234.is_comunic.longval1) and ib_activate= true then
						messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta incidencia se encuentra previamente seleccionada",information!,ok!)
						gu_comunic.is_comunic.longval1 = 0
						SetNull(il_incid_2)							
						ib_activate= False
						return
				END IF	
				
				IF NOT ib_incid_selec THEN
					IF NOT IsNull(iuo_1234.is_comunic.strval1) AND &
						iuo_1234.is_comunic.strval1 <> "" AND &
						iuo_1234.is_comunic.strval1 <> " " THEN
						 st_inc_sel.text = "Incidencia nro.: "+ string(iuo_1234.is_comunic.longval1) + "~r~n" + iuo_1234.is_comunic.strval1
					ELSE
						st_inc_sel.text = "Incidencia nro.: "+ string(iuo_1234.is_comunic.longval1) 
					END IF

					if iuo_1234.is_comunic.intval1=3 then
						ii_tipo_inc_1 = 1
						p_indicador.show()
					else
						ii_tipo_inc_1 = 0
						p_indicador.hide()
					end if
					
					il_incid_1 = iuo_1234.is_comunic.longval1
					st_inc_sel.Visible = True
					p_inc_sel.Visible  = True
					
				ELSE
					
					IF 	(il_incid_1 = iuo_1234.is_comunic.longval1 or il_incid_2 = iuo_1234.is_comunic.longval1) and ib_activate= true then
						messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta incidencia se encuentra previamente seleccionada",information!,ok!)
						gu_comunic.is_comunic.longval1 = 0
						SetNull(il_incid_2)	
						ib_activate= False
						return
					END IF
					
					IF NOT IsNull(iuo_1234.is_comunic.strval1) AND &
							iuo_1234.is_comunic.strval1 <> "" AND &
							iuo_1234.is_comunic.strval1 <> " " THEN
						st_inc_sel_2.text = "Incidencia nro.: "+ string(iuo_1234.is_comunic.longval1)
					ELSE
						st_inc_sel_2.text = "Incidencia nro.: "+ string(iuo_1234.is_comunic.longval1) + "~r~n" + iuo_1234.is_comunic.strval1
					END IF
					
					if iuo_1234.is_comunic.intval1=3 then
						ii_tipo_inc_2 = 1
						p_indicador_2.show()
					else
						p_indicador_2.hide()
						ii_tipo_inc_2 = 0
					end if
					
					il_incid_2 = iuo_1234.is_comunic.longval1
					st_inc_sel_2.Visible = True
					p_inc_sel_2.Visible  = True
					
				END IF
				
				ib_incid_selec = True	

		END IF
			
		// Si vengo de la ventana de creaci$$HEX1$$f300$$ENDHEX$$n de Incidencia
		ELSEIF gu_comunic.is_comunic.programa_retorno = "iw_2301" THEN
			
			iuo_2301.is_comunic = gu_comunic.is_comunic 
			// GNU 18/01/2007. Mejora 1/311530
//			gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 1) //Commit
			gnu_u_transaction.uf_desbloquea_avisos( iuo_2301.is_comunic.longval2, 1)
			// FIN GNU
			//SFP-DEO13-000000223 JHE 20/03/2012
			//Se verifica si a regresado de la ventana de incidencias con el numero de 
			//incidencias cargada es la varible para que se elimine el indicativo de que
			//la instalacion tiene una incidencia abierta.
			if fw_incidencia_activa(il_nro_instal,1,this,ii_tipo_instalacion) = 2 then
				return
			end if	
			//SFP-DEO13-000000223 JHE FIN			
			this.triggerevent("ue_refrescar",0,2)	
			
		// Si vengo de la ventana de inf. del aviso
		ELSEIF gu_comunic.is_comunic.programa_retorno = "w_1203" THEN	

			iuo_1203.is_comunic = gu_comunic.is_comunic 
			
			IF	iuo_1203.is_comunic.accion_retorno = "Actualizado" THEN
				dw_lista_avisos.SetRedraw(False)

				dw_lista_avisos.Retrieve(il_nro_instal,ii_clase_aviso,&
				fgcdec_aviso_de_calidad, fgcdec_aviso_de_calidad_con_alim, &
				fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector, ids_f_desde, ids_f_hasta,ii_alcances[],il_nro_aviso_desde, il_nro_aviso_hasta)
// Modificado Por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004. Se a$$HEX1$$f100$$ENDHEX$$adieron como argumentos ids_f_desde y ids_f_hasta.
//				fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector)
// Fin. Sgo.

				dw_lista_avisos.ScrollToRow(ii_fila_avi_clic)				
				dw_lista_avisos.SelectRow(0,False)				
				dw_lista_avisos.SetRow(ii_fila_avi_clic)
				dw_lista_avisos.SelectRow(ii_fila_avi_clic,True)				
				//AHM (03/01/2008)
				FOR ll_aux= 1 TO dw_lista_avisos.rowCount()
					dw_lista_avisos.setItem(ll_aux, "seleccionado",0)		
				NEXT
				dw_lista_avisos.setItem(ii_fila_avi_clic, "seleccionado",1)
				dw_lista_avisos.SetRedraw(True)
				
//			// GNU 18/01/2007. Mejora 1/311530
//			ELSE
//			gnu_u_transaction.uf_desbloquea_avisos(iuo_1203.is_comunic.longval1,1) //commit
//		// FIN GNU
			END IF
			
			dw_lista_avisos.ii_fila_clickeada = ii_fila_avi_clic
		
		//AHM 28/09/2009 (Mejora 1/468636)
	ELSEIF  gu_comunic.is_comunic.programa_retorno = "w_6208" THEN
		//Si viene de la ventana de selecci$$HEX1$$f300$$ENDHEX$$n de ot
		iuo_1234.is_comunic = gu_comunic.is_comunic

		gb_4.visible = TRUE
		p_orden1.visible = TRUE
		p_orden1.show()
		mle_1.visible = TRUE
		
		il_nroInstalacionOt = iuo_1234.is_comunic.longval2
		il_nroOt = iuo_1234.is_comunic.longval1
		
		mle_1.text = "OT nro.: "+ string(il_nroOt) + "~r~n" 
		
		dw_lista_avisos.ii_fila_clickeada = ii_fila_avi_clic
		
		m_menu.m_editar.m_seleccionarot.enabled = FALSE
		
		this.triggerevent("ue_refrescar",0,2)	
		
	END IF
END CHOOSE

if not isvalid(THIS) then
//	ib_activate = false
	return
end if

if isvalid(w_barra) then
	W_BARRA.uo_barra.barra.f_amplia(100)
	close(w_barra)
end if

// Reseteo las estructuras globales de comunicaciones.
IF ISNULL(gu_comunic.is_comunic.accion_retorno) OR &
	gu_comunic.is_comunic.accion_retorno <> 'No_resetear' THEN
	
	fgnu_resetear_s_comunicaciones(gu_comunic)
	fgnu_resetear_s_comunicaciones(gu_comunic1)
	gu_comunic.is_comunic.accion_retorno =''
END IF

if not ib_hay_avisos then
	ib_hay_avisos = TRUE // Es para prevenir que no salte dos veces el mensajito (LFE)
								// Ocurre cuando est$$HEX2$$e1002000$$ENDHEX$$activado el $$HEX1$$e100$$ENDHEX$$mbito.
	if isvalid(w_barra) then
		W_BARRA.uo_barra.barra.f_amplia(100)
		w_barra.visible = FALSE 
		close(w_barra)
	END IF	

	gnv_msg.f_mensaje("AA06","","",OK!) 

	ib_activate= False
	IF NOT FG_VERIFICA_PARAMETRO("AMBITO GESTION AVISOS") THEN
		close(this)
		return
	END IF
	
elseif isvalid(this) then 

	if p_inc_sel_2.visible=true then
		// GNU 26-2-2007. Incidencia 0/489508
//		md_gestion_avisos.m_editar.m_seleccindeincidencia.enabled=false
		m_menu.m_editar.m_seleccindeincidencia.enabled=false

		//***************************************
		//**  OSGI 2001.1  	11/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
//		md_gestion_avisos.m_editar.m_seleccionarincidenciaresueltas.enabled=False
		m_menu.m_editar.m_seleccionarincidenciaresueltas.enabled=False
		// FIN GNU
		//***************************************
		//**  OSGI 2001.1  	11/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	end if

// Si se activa esta ventana se oculta la grafica.	

//	if gb_bdi and gb_hay_sesion then 
//	   	gl_instalacion_afectada = 0
//			fg_mostrar(false)
//	end if 	
	//This.triggerevent("ue_refrescar",0,2)
	ib_activate= False
end if 

setpointer(Arrow!)

//\\// PM_U003 TIPOS VIA AMR 13/06/2002
// \/
IF gb_tipos_de_via = true THEN
	// LFE Mejora 1/282617: Se a$$HEX1$$f100$$ENDHEX$$ade el cgv_sum 
	dw_lista_avisos.Modify("c_concat.Expression='nom_calle +~" N$$HEX2$$ba002000$$ENDHEX$$~"+ string(duplicador) +~" - ~"+ string(num_puerta) + ~" - ~"+ string(cgv_sum)'")
	// FIN Mejora 1/282617 

ELSE
	// LFE Mejora 1/282617: Se a$$HEX1$$f100$$ENDHEX$$ade el cgv_sum 
	dw_lista_avisos.Modify("c_concat.Expression='nom_calle +~" N$$HEX2$$ba002000$$ENDHEX$$~"+ string(num_puerta) +~" - ~"+ string(duplicador) + ~" - ~"+ string(cgv_sum)'")
	// FIN Mejora 1/282617 
END IF
// /\
//\\// PM_U003 TIPOS VIA AMR 13/06/2002

/* INICIO.TDA EDM-12 02/10/2017 */
tv_1.enabled = TRUE
/* FIN.TDA EDM-12 02/10/2017 */


//if gb_bdi then 
//	if gb_hay_sesion  then
//	 md_gestion_avisos.m_editar.m_-4.visible=true
//
//	 md_gestion_avisos.m_editar.m_mostraravisos.visible = true
//	 md_gestion_avisos.m_editar.m_mostraravisos.toolbaritemvisible = true
//	 
//	 md_gestion_avisos.m_editar.m_quitarblink.visible = true
//	 md_gestion_avisos.m_editar.m_quitarblink.toolbaritemvisible = true
//
//	 md_gestion_avisos.m_editar.m_grfico.visible=true
//	 md_gestion_avisos.m_editar.m_grfico.toolbaritemvisible=true
//
//	 md_gestion_avisos.m_editar.m_brigadas.visible=true
//	 md_gestion_avisos.m_editar.m_brigadas.toolbaritemvisible=true
//	 
//	 md_gestion_avisos.m_editar.m_capas.visible=true
//	 md_gestion_avisos.m_editar.m_capas.toolbaritemvisible=true
//
//	 md_gestion_avisos.m_editar.m_clientesimportantes.visible=true
//	 md_gestion_avisos.m_editar.m_clientesimportantes.toolbaritemvisible=true
//	 
//   else  
//	 if gnv_msg.f_mensaje("CD01","","",Ok!)=2 then 			
//		ib_activate= False
//		close(this)
//	end if	  
//  end if 
//end if

end event

event close;call super::close;/////////////////////////////////////////////////////////////////////////
//
// Evento:  close
//
// Objetivo: Cierra la ventana avisos con alimentacion
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        22-1-96   JH
//
/////////////////////////////////////////////////////////////////////////

// se destruyen los objetos creados para el 
// manejo de las estructuras de comunicaciones 

DESTROY iuo_gen_comunic  
DESTROY iuo_gen_comunic1
DESTROY iuo_1234		  
DESTROY iuo_2301		  
DESTROY iuo_1203
//DESTROY iu_avi_2001_rn
yield()
end event

on w_1105_avisos_con_alim.create
int iCurrent
call super::create
if this.MenuName = "md_gestion_avisos" then this.MenuID = create md_gestion_avisos
this.st_2=create st_2
this.p_1=create p_1
this.dw_lista_instal=create dw_lista_instal
this.st_incidencias=create st_incidencias
this.sle_cant_cli_imp=create sle_cant_cli_imp
this.st_cant_avi_pel=create st_cant_avi_pel
this.p_incidencia=create p_incidencia
this.p_importantes=create p_importantes
this.p_peligro=create p_peligro
this.sle_cant_avi_pel=create sle_cant_avi_pel
this.dw_inc_asoc=create dw_inc_asoc
this.p_indicador=create p_indicador
this.p_inc_sel_2=create p_inc_sel_2
this.p_indicador_2=create p_indicador_2
this.p_inc_sel=create p_inc_sel
this.st_inc_sel=create st_inc_sel
this.gb_incidencia=create gb_incidencia
this.gb_indicativos_inst=create gb_indicativos_inst
this.st_otras=create st_otras
this.dw_otras_inst=create dw_otras_inst
this.st_clientes_pot_t=create st_clientes_pot_t
this.tv_1=create tv_1
this.dw_ambito=create dw_ambito
this.st_inc_sel_2=create st_inc_sel_2
this.st_1=create st_1
this.gb_incidencias=create gb_incidencias
this.cbx_filtrar_fechas=create cbx_filtrar_fechas
this.cbx_filtrar_alcances=create cbx_filtrar_alcances
this.gb_2=create gb_2
this.dw_filtro_fechas=create dw_filtro_fechas
this.dw_alcances=create dw_alcances
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.em_desde=create em_desde
this.cbx_numero=create cbx_numero
this.mle_1=create mle_1
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.p_orden1=create p_orden1
this.cbx_filtrar_activos=create cbx_filtrar_activos
this.dw_avisos_activos=create dw_avisos_activos
this.gb_5=create gb_5
this.em_hasta=create em_hasta
this.dw_lista_avisos=create dw_lista_avisos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.p_1
this.Control[iCurrent+3]=this.dw_lista_instal
this.Control[iCurrent+4]=this.st_incidencias
this.Control[iCurrent+5]=this.sle_cant_cli_imp
this.Control[iCurrent+6]=this.st_cant_avi_pel
this.Control[iCurrent+7]=this.p_incidencia
this.Control[iCurrent+8]=this.p_importantes
this.Control[iCurrent+9]=this.p_peligro
this.Control[iCurrent+10]=this.sle_cant_avi_pel
this.Control[iCurrent+11]=this.dw_inc_asoc
this.Control[iCurrent+12]=this.p_indicador
this.Control[iCurrent+13]=this.p_inc_sel_2
this.Control[iCurrent+14]=this.p_indicador_2
this.Control[iCurrent+15]=this.p_inc_sel
this.Control[iCurrent+16]=this.st_inc_sel
this.Control[iCurrent+17]=this.gb_incidencia
this.Control[iCurrent+18]=this.gb_indicativos_inst
this.Control[iCurrent+19]=this.st_otras
this.Control[iCurrent+20]=this.dw_otras_inst
this.Control[iCurrent+21]=this.st_clientes_pot_t
this.Control[iCurrent+22]=this.tv_1
this.Control[iCurrent+23]=this.dw_ambito
this.Control[iCurrent+24]=this.st_inc_sel_2
this.Control[iCurrent+25]=this.st_1
this.Control[iCurrent+26]=this.gb_incidencias
this.Control[iCurrent+27]=this.cbx_filtrar_fechas
this.Control[iCurrent+28]=this.cbx_filtrar_alcances
this.Control[iCurrent+29]=this.gb_2
this.Control[iCurrent+30]=this.dw_filtro_fechas
this.Control[iCurrent+31]=this.dw_alcances
this.Control[iCurrent+32]=this.st_4
this.Control[iCurrent+33]=this.st_5
this.Control[iCurrent+34]=this.st_6
this.Control[iCurrent+35]=this.em_desde
this.Control[iCurrent+36]=this.cbx_numero
this.Control[iCurrent+37]=this.mle_1
this.Control[iCurrent+38]=this.gb_1
this.Control[iCurrent+39]=this.gb_3
this.Control[iCurrent+40]=this.gb_4
this.Control[iCurrent+41]=this.p_orden1
this.Control[iCurrent+42]=this.cbx_filtrar_activos
this.Control[iCurrent+43]=this.dw_avisos_activos
this.Control[iCurrent+44]=this.gb_5
this.Control[iCurrent+45]=this.em_hasta
this.Control[iCurrent+46]=this.dw_lista_avisos
end on

on w_1105_avisos_con_alim.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.dw_lista_instal)
destroy(this.st_incidencias)
destroy(this.sle_cant_cli_imp)
destroy(this.st_cant_avi_pel)
destroy(this.p_incidencia)
destroy(this.p_importantes)
destroy(this.p_peligro)
destroy(this.sle_cant_avi_pel)
destroy(this.dw_inc_asoc)
destroy(this.p_indicador)
destroy(this.p_inc_sel_2)
destroy(this.p_indicador_2)
destroy(this.p_inc_sel)
destroy(this.st_inc_sel)
destroy(this.gb_incidencia)
destroy(this.gb_indicativos_inst)
destroy(this.st_otras)
destroy(this.dw_otras_inst)
destroy(this.st_clientes_pot_t)
destroy(this.tv_1)
destroy(this.dw_ambito)
destroy(this.st_inc_sel_2)
destroy(this.st_1)
destroy(this.gb_incidencias)
destroy(this.cbx_filtrar_fechas)
destroy(this.cbx_filtrar_alcances)
destroy(this.gb_2)
destroy(this.dw_filtro_fechas)
destroy(this.dw_alcances)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.em_desde)
destroy(this.cbx_numero)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.p_orden1)
destroy(this.cbx_filtrar_activos)
destroy(this.dw_avisos_activos)
destroy(this.gb_5)
destroy(this.em_hasta)
destroy(this.dw_lista_avisos)
end on

event closequery;call super::closequery;/////////////
////////////////////////////////////////////////////////////
//
// Evento:  Closequery
//
// Objetivo: Si se quiere cerrar esta ventana antes que la de Incidencias no
//           lo permite, pues quedar$$HEX1$$ed00$$ENDHEX$$a bloqueado el registro.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n       28/01/2000   FDO
//
/////////////////////////////////////////////////////////////////////////

long ll_incidencia

If ib_activate or not ib_recupero Then
	Return 1
End If


if isvalid(gu_control_v_incidencias) then
	if gu_control_v_incidencias.of_comprueba_llamante("w_1105_avisos_con_alim",ll_incidencia)= 1  then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La ventana de Incidencias ha sido llamada desde Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos. Termine previamente de gestionar la Incidencia en curso",information!,ok!)
		return 1
	end if
end if
end event

event ue_postopen;call super::ue_postopen;long ll_conta
boolean lb_hay_avisos
DataWindowChild dw_activos_child
//dw_inc_asoc.settransobject(sqlca)
//dw_otras_inst.settransobject(sqlca)

// GNU 26-2-2007. Incidencia 0/489508
md_gestion_avisos m_menu

m_menu= This.menuid


this.setredraw(false)

dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()


dw_avisos_activos.GetChild("tip_aviso",dw_activos_child)
dw_activos_child.SetTransObject(sqlca)
dw_activos_child.AcceptText()
dw_activos_child.Retrieve()
dw_avisos_activos.InsertRow(0)

IF fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)
	// GNU 17/01/2007. Mejora 1/311530
	This.SetRedraw(False)
	fn_nombre_ventana(gi_nro_centro, gi_nro_cmd, gi_nro_puesto)
	This.SetRedraw(True)
	// FIN GNU
ELSE
	IF II_TIPO_ACCESO = 1 THEN
		dw_ambito.fnu_insertar_datos(fgci_todos, gi_nro_cmd, fgci_todos, 0)
		// GNU 17/01/2007. Mejora 1/311530
		fn_nombre_ventana(fgci_todos, gi_nro_cmd, fgci_todos)
		// FIN GNU
	ELSEIF ii_tipo_acceso = 2 THEN 
		dw_ambito.fnu_insertar_datos(fgci_todos, fgci_todos, fgci_todos, 0)
		// GNU 17/01/2007. Mejora 1/311530
		fn_nombre_ventana(fgci_todos, fgci_todos, fgci_todos)
		// FIN GNU
	END IF
END IF

dw_ambito.AcceptText()
//
for ll_conta=1 to dw_lista_instal.RowCount() 
	if dw_lista_instal.getitemnumber(ll_conta,"cant_avisos") > 0 then lb_hay_avisos=true
next

if (lb_hay_avisos and II_TIPO_ACCESO <> 0) OR fg_verifica_parametro("AMBITO GESTION AVISOS") then

	//FG_COLOCAR_VENTANA_MAIN(W_1105_AVISOS_CON_ALIM)
	//t1 = now()
	i_cerre=0
	// defino constantes
	//fw_def_constantes()
	string ls_modstring
	int li_cont
	
	SetPointer(HourGlass!)
	
//	iu_avi_2004_pr	= CREATE u_avi_2004_pr_form_inf_resumen
//	iuo_gen_comunic  = CREATE u_generico_comunicaciones
//	
//	iuo_gen_comunic.is_comunic = gu_comunic.is_comunic
//	
//	// Se crean los objetos de trabajo
//	iuo_1234			  = CREATE u_generico_comunicaciones
//	iuo_2301			  = CREATE u_generico_comunicaciones
//	iuo_1203			  = CREATE u_generico_comunicaciones
//	iuo_gen_comunic1 = CREATE u_generico_comunicaciones
	
//	fgnu_resetear_s_comunicaciones(gu_comunic1)
	
	is_accion_llamada = iuo_gen_comunic.is_comunic.accion_llamada
	
	// Cambiar los atributos de la ventana
	// This.fpr_cambiar_atributos()
	// GNU 17/01/2007. Mejora 1/311530
//	This.Title = iuo_gen_comunic.f_titulo_ventana("w_1105","Gest.Avisos")
//	IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
//		This.Title = This.Title + " - (" + IS_CMD + ")"
//	END IF

	// GNU 26-2-2007. Incidencia 0/489508
	if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ASOC_MANUAL','ACC_MANTEN') = 1 then
//		md_gestion_avisos.m_editar.m_seleccindeincidencia.enabled = true
		m_menu.m_editar.m_seleccindeincidencia.enabled = true
	else
//		md_gestion_avisos.m_editar.m_seleccindeincidencia.enabled = false
		m_menu.m_editar.m_seleccindeincidencia.enabled = false
	end if
	// FIN FNU
	
	// Inicializo los niveles entre los que 
	// quiero ver las inst. en el arranque.
	ii_nivel_desde = 1
	ii_nivel_hasta = fgci_nivel_hasta
	ii_t_salida = fgci_tipo_acometida
	ib_incid_selec = False
	
	//// Se hace el retrieve de las instalaciones 
	//dw_lista_instal.SetTransObject(SQLCA)
	
	// Si no existe informaci$$HEX1$$f300$$ENDHEX$$n para mostrar 
	// cierro la ventana
	IF dw_lista_instal.RowCount() > 0 THEN
	
	ELSE
		gnv_msg.f_mensaje("AA06","","",OK!)
		if isvalid(w_barra) then
			W_BARRA.uo_barra.barra.f_amplia(100)
			close(w_barra)
		end if
		IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
			Close(This)
			return
		END IF
		
	END IF
	
	// Si existen registros, el retrieve me 
	// deja en la primera linea del jerarq., por lo tanto
	// se la asigno a la var. de instancia "ii_fila", para
	// luego dejar la ventana consistente, o sea en estado 
	// como si hubiera clickeado sobre dicha fila.
	
	ii_fila = dw_lista_instal.GetRow() 
	//dw_lista_avisos.SetTransObject(SQLCA)  
	
	This.TriggerEvent("ue_armar_sql") //pacho
	
	gu_comunic.is_comunic.intval9 = 1
	dw_lista_avisos.SetRedraw(False)	
	
	This.TriggerEvent("ue_criterio_orden")
	dw_lista_avisos.SetRedraw(True)	

else
	if isvalid(w_barra) then
		W_BARRA.uo_barra.barra.f_amplia(100)
		close(w_barra)
	end if
	if lb_hay_avisos = FALSE then
		// No hay avisos
		gnv_msg.f_mensaje("AA06","","",OK!)
	else
		// No tiene permisos.
		Messagebox("Aviso","Para poder visualizar los avisos se requiere Acceso Global o por CMD.",information!,ok!)
	end if
	
	IF NOT IsValid(This) THEN 
		return
	END IF
	
	i_cerre=1

	//yield()
	
	close(this)
	return

end if

//*****************************************************************************************************//
//  Externalidad:  Visualizacion de Potencia Instalada y cantidad de clientes en Gestion de Avisos     //
//  Luis Eduardo Ortiz  Abril/2001                                                                     //
//*****************************************************************************************************//
If IsValid(This) Then
	If fg_verifica_parametro("visualizar_pot_y_cli") Then
		st_clientes_pot_t.Visible = True
	End If
	
	//*****************************************************************************************************//
	//  Luis Eduardo Ortiz  Abril/2001                                                                     //
	//*****************************************************************************************************//
	
	//*****************************************************************************************************//
	//  Externalidad:  Visualizacion de Potencia Contratada en Gestion de Avisos                           //
	//  Luis Eduardo Ortiz  Abril/2001                                                                     //
	//*****************************************************************************************************//
	
//	If fg_verifica_parametro(This.ClassName() + "_potencia") Then
//	//	fg_ventana_parametro(This.ClassName() + "_potencia",dw_lista_avisos)
//	End If
	
	ib_asoc_aviso_con_alim = fg_verifica_parametro('ASOC_AVISO_CON_ALIM')
		
End If
//*****************************************************************************************************//
//  Luis Eduardo Ortiz  Abril/2001                                                                     //
//*****************************************************************************************************//

IF ProfileString("opensgi.ini","DEMO","SIM_CALL_CENTER","NO") = 'SI'  then
	// GNU 27-2-2007. Incidencia 0/489508
//	md_gestion_avisos.m_editar.m_simuladordecallcenter.visible=true
//	md_gestion_avisos.m_editar.m_simuladordecallcenter.toolbaritemvisible=true
	m_menu.m_editar.m_simuladordecallcenter.visible=true
	m_menu.m_editar.m_simuladordecallcenter.toolbaritemvisible=true
	// FIN GNU
END IF

if gi_pais = 8 then
	st_otras.text = "Otras alimentaciones para la instalaci$$HEX1$$f300$$ENDHEX$$n"
end if

// Filtro Fecha

dw_filtro_fechas.object.f_desde[1]=datetime(date("01/01/1900"))
dw_filtro_fechas.object.f_hasta[1]=fgnu_fecha_actual()
st_1.y = 384
st_1.text = "     Filtrar por Fecha de Alta"
st_clientes_pot_t.y = 396
tv_1.y = 464
/*Certificaci$$HEX1$$f300$$ENDHEX$$n windows XP*/
//tv_1.height = 1370
tv_1.height = 1330
st_2.y = 384
p_1.y=392
dw_lista_avisos.y = 469
/*Certificaci$$HEX1$$f300$$ENDHEX$$n windows XP*/
//dw_lista_avisos.height = 1364
dw_lista_avisos.height = 1330

gb_2.visible=false
//JHE DEO12-160 25/10/2012
//se poenen invisibles los objetos
gb_3.visible=false
gb_5.visible=false
//JHE DEO12-160 FIN
// Filtro alcance

st_2.text = "     Filtrar por Fecha de Alta"


//AHM (27/5/2010 ) Invisibilizamos la columna seleccionado
dw_lista_avisos.modify("seleccionado.visible = 0")

this.setredraw(true)

//HLA.INI.DDAG.4288.21/10/2015.Se actualiza la ventana
long ll_time

 select valor
  into :ll_time
  from sgd_valor
 where codigo = 124 and
		 codif = 'T_AC';

timer(ll_time)
//HLA.FIN.DDAG.4288.21/10/2015

end event

event timer;call super::timer;//HLA.INI.DDAG.4288.21/10/2015
this.TriggerEvent("ue_refrescar")
//HLA.FIN.DDAG.4288.21/10/2015
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1105_avisos_con_alim
integer x = 1655
integer y = 480
integer height = 92
end type

type st_2 from statictext within w_1105_avisos_con_alim
integer x = 1586
integer y = 648
integer width = 2002
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 276856960
boolean enabled = false
string text = "          Avisos Relacionados"
boolean border = true
long bordercolor = 8421504
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 44
END IF
end event

type p_1 from picture within w_1105_avisos_con_alim
integer x = 1595
integer y = 656
integer width = 82
integer height = 68
boolean bringtotop = true
string picturename = "ruta.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 52
END IF
end event

type dw_lista_instal from datawindow within w_1105_avisos_con_alim
boolean visible = false
integer x = 1792
integer y = 1316
integer width = 1691
integer height = 288
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_arbol"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type st_incidencias from statictext within w_1105_avisos_con_alim
integer x = 2377
integer y = 108
integer width = 398
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Sum. Importantes:"
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1556
	This.x = 178
	//1636
END IF
end event

type sle_cant_cli_imp from singlelineedit within w_1105_avisos_con_alim
integer x = 2775
integer y = 96
integer width = 238
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1544
	This.x = 677
	//1624
END IF
end event

type st_cant_avi_pel from statictext within w_1105_avisos_con_alim
integer x = 2377
integer y = 200
integer width = 393
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Avisos de Peligro:"
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1648
	This.x = 178
	//1728
END IF
end event

type p_incidencia from picture within w_1105_avisos_con_alim
integer x = 3035
integer y = 84
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "incid.bmp"
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1516
	This.x = 980
END IF
end event

type p_importantes from picture within w_1105_avisos_con_alim
integer x = 2309
integer y = 108
integer width = 69
integer height = 60
string picturename = "IMP.BMP"
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1552
	This.x = 78
	//  1632
END IF
end event

type p_peligro from picture within w_1105_avisos_con_alim
integer x = 2304
integer y = 196
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "peligro1.BMP"
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1644
	This.x = 73
	// 1724
END IF
end event

type sle_cant_avi_pel from singlelineedit within w_1105_avisos_con_alim
integer x = 2775
integer y = 188
integer width = 238
integer height = 84
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1644
	This.x = 677
	//1724
END IF
end event

type dw_inc_asoc from datawindow within w_1105_avisos_con_alim
integer x = 3035
integer y = 152
integer width = 530
integer height = 104
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_avi_2002_incidencias_relaccionadas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1596
	This.x = 985
	//1676
END IF
end event

type p_indicador from picture within w_1105_avisos_con_alim
boolean visible = false
integer x = 1015
integer y = 192
integer width = 73
integer height = 60
boolean bringtotop = true
string picturename = "cal_gest.bmp"
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1660
	This.x = 1760
END IF
end event

type p_inc_sel_2 from picture within w_1105_avisos_con_alim
boolean visible = false
integer x = 1440
integer y = 64
integer width = 96
integer height = 88
boolean bringtotop = true
string pointer = "MANO.CUR"
string picturename = "incid_grande2.bmp"
boolean focusrectangle = false
end type

event dragdrop;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragDrop
// 
// Objetivo: Recibe la incidencia a la que se va asociar
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
// 19/01/2000  FDO			  Modificaci$$HEX1$$f300$$ENDHEX$$n
///////////////////////////////////////////////////////


decimal{0} ldec_tipo_aviso
int li_res, li_ind_cli_imp, li_ind_avi_pel, li_sum_imp, li_est_incid
datetime	ldt_f_alta,ldt_f_deteccion
long ll_nro_avi, ll_fila, ll_instalac, LL_INST_AVISO
boolean LB_INS_DETECT=false

SetPointer(HourGlass!)

IF ii_tipo_inc_2 <> ii_ind_calidad THEN 
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El tipo del aviso no coincide con el tipo de la incidencia.")
    gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
	dw_lista_avisos.Drag(End!)
	This.Border = false
	return
END IF

DECLARE L_CUR_INSTALAC CURSOR FOR  
 SELECT "GI_AVISOS_INSTALACION"."NRO_INSTALACION"  
 FROM "GI_AVISOS_INSTALACION"  
WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_avi  ;


// Verifico el estado de la Incidencia
SELECT "SGD_INCIDENCIA"."EST_ACTUAL","SGD_INCIDENCIA"."NRO_INST_AFECTADA","SGD_INCIDENCIA"."F_DETECCION"   
INTO :li_est_incid,:ll_instalac,:ldt_f_deteccion
FROM "SGD_INCIDENCIA"  
WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :il_incid_2;


//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//** Se envia 0 en el 5 parametro para **
//** verificar que el parametro activo **
//***************************************
If fw_asoc_aviso_inc_rs(2, This, 1, il_incid_2, 0, li_est_incid) = 0 Then
	gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
	Return
End If


//**  OSGI 2001.1  	11/05/2001  IF SQLCA.SQLCODE=100 THEN   // LA INCIDENCIA HA SIDO ELIMINADA
//**  OSGI 2001.1  	11/05/2001  	gnv_msg.f_mensaje("AA11","","",OK!)
//**  OSGI 2001.1  	11/05/2001  	ib_incid_selec=FALSE
//**  OSGI 2001.1  	11/05/2001  	il_incid_2 = 0
//**  OSGI 2001.1  	11/05/2001  	p_inc_sel_2.Visible = False
//**  OSGI 2001.1  	11/05/2001  	st_inc_sel_2.Visible = False
//**  OSGI 2001.1  	11/05/2001  	dw_lista_avisos.Drag(End!)
//**  OSGI 2001.1  	11/05/2001  	RETURN
//**  OSGI 2001.1  	11/05/2001  END IF
//**  OSGI 2001.1  	11/05/2001  IF li_est_incid >  fgci_incidencia_servicio_repuesto THEN
//**  OSGI 2001.1  	11/05/2001  	gnv_msg.f_mensaje("AA10","","",OK!)
//**  OSGI 2001.1  	11/05/2001  	il_incid_2  = 0
//**  OSGI 2001.1  	11/05/2001  	p_inc_sel_2.Visible = False
//**  OSGI 2001.1  	11/05/2001  	st_inc_sel_2.Visible = False
//**  OSGI 2001.1  	11/05/2001  	RETURN
//**  OSGI 2001.1  	11/05/2001  END IF


//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//HSE INICIO DEL BUCLE DE FILAS SELECCIONADAS

ll_fila = dw_lista_avisos.getselectedrow(ll_fila)


do while ll_fila > 0

	ldec_tipo_aviso = dw_lista_instal.GetItemDecimal(ii_fila_clickeada,"nro_instalacion") 
	li_ind_cli_imp  = dw_lista_avisos.GetItemNumber(ll_fila,"ind_cli_imp") 
	li_ind_avi_pel  = dw_lista_avisos.GetItemNumber(ll_fila,"avisos_ind_peligro") 
	ldt_f_alta		 = dw_lista_avisos.GetItemDateTime(ll_fila,"f_alta") 
	
	iuo_avi_2001_nu = CREATE u_avi_2001_nu_lista_avisos
	ll_nro_avi = dw_lista_avisos.GetItemNumber(ll_fila,"avisos_nro_aviso")
	
	// comprueba la correspondencia de las instalaciones de los avisos marcados con la insta-
	// lacion de la incidencia
	if ldec_tipo_aviso=fgcdec_aviso_de_ayuda or &
		ldec_tipo_aviso=fgcdec_aviso_sin_alimentacion or &
		ldec_tipo_aviso=fgcdec_aviso_alumbrado_publico then
		
		LB_INS_DETECT=TRUE
		
	else
		
		OPEN L_CUR_INSTALAC;
		
		FETCH L_CUR_INSTALAC INTO :LL_INST_AVISO;
		
		DO while SQLCA.SQLCODE = 0
			
			IF LL_INST_AVISO=LL_INSTALAC THEN
				
				LB_INS_DETECT=TRUE
				
			end if
			
			FETCH L_CUR_INSTALAC INTO :LL_INST_AVISO;
			
		loop
		
		CLOSE L_CUR_INSTALAC;
		
	end if
	
	if lb_ins_detect = false then
		
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",&
		"La instalaci$$HEX1$$f300$$ENDHEX$$n que alimenta a alguno de los avisos no tiene correspondencia con la instalaci$$HEX1$$f300$$ENDHEX$$n sobre la que recae la incidencia.")
		
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		
		dw_lista_avisos.Drag(End!)
		This.Border = false
		DESTROY iuo_avi_2001_nu	
		return
		
	end if
	
	if ldt_f_alta < ldt_f_deteccion then
		
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",&
		"Alguno de los avisos que intenta asociar es anterior a la Fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la Incidencia.")
		
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		
		dw_lista_avisos.Drag(End!)
		This.Border = false
		DESTROY iuo_avi_2001_nu	
		return
		
	end if
	
	// GNU 28-6-2007. Mejora 23 (avisos)
	// Resolver la OT (pero no el aviso). Cerrar las brigadas y contratas correspondientes
	IF fnu_resolver_OT()= -1 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se ha podido resolver la OT")
		
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		
		dw_lista_avisos.Drag(End!)
		This.Border = false
		DESTROY iuo_avi_2001_nu	
		return
	END IF
	// FIN GNU
	
	IF iuo_avi_2001_nu.fnu_asociar_aviso(ll_nro_avi ,il_incid_2, li_ind_cli_imp, li_ind_avi_pel, ldt_f_alta) = -1 THEN
		Parent.PostEvent("ue_refrescar")
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		DESTROY iuo_avi_2001_nu	
		CONTINUE
	END IF
	
	// Si estoy en un aviso normal o sin alimentaci$$HEX1$$f300$$ENDHEX$$n,
	// si el suministro es de un cliente importante
	// genero un registro en 'sum_imp'
	
	IF ldec_tipo_aviso <> fgcdec_aviso_de_ayuda AND ldec_tipo_aviso <>fgcdec_aviso_alumbrado_publico THEN
		IF li_ind_cli_imp = 1 THEN
			IF iuo_avi_2001_nu.fnu_g_sum_imp(ll_nro_avi,il_incid_2) = -1 THEN
				gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
				DESTROY iuo_avi_2001_nu	
				CONTINUE
			END IF
		END IF
	END IF
		
	DESTROY iuo_avi_2001_nu	

	//***************************************
	//**  OSGI 2001.1  	11/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	If fw_asoc_aviso_inc_rs(2, This, 2, il_incid_2, ll_fila, li_est_incid) = 0 Then
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		Return
	End If
	//***************************************
	//**  OSGI 2001.1  	11/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
		
	ll_fila = dw_lista_avisos.getselectedrow(ll_fila)

	lb_ins_detect=false
LOOP

gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,1) //commit
This.Border = false
dw_lista_avisos.Drag(End!)

parent.triggerevent("ue_refrescar")
end event

on doubleclicked;ib_incid_selec = TRUE

Parent.TriggerEvent("ue_seleccionar_inc")

end on

event rbuttondown;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Rbuttondown
// 
// Objetivo: Muestra el menu asociado al BMP
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

m_emerg_avis lm_gestion_avi
lm_gestion_avi = CREATE m_emerg_avis
ii_incidencia = 2
IF fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	lm_gestion_avi.PopMenu(PointerX()+1675, PointerY()+400)
ELSE
	lm_gestion_avi.PopMenu(PointerX()+2700, PointerY()+1700)

END IF

end event

event dragenter;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragEnter
// 
// Objetivo: Unde el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_avi_2001_pr_lista_avisos"  THEN
		This.Border = true
		This.BorderStyle = StyleLowered!
				
 	END IF
END IF
end event

event dragleave;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragLeave
// 
// Objetivo: Levanta el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_avi_2001_pr_lista_avisos" THEN
		
		This.Border = false
				
 	END IF
END IF
end event

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1520
	This.x = 2679
END IF
end event

type p_indicador_2 from picture within w_1105_avisos_con_alim
boolean visible = false
integer x = 1463
integer y = 196
integer width = 73
integer height = 60
boolean bringtotop = true
string picturename = "cal_gest.bmp"
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1660
	This.x = 2720
END IF
end event

type p_inc_sel from picture within w_1105_avisos_con_alim
boolean visible = false
integer x = 997
integer y = 64
integer width = 101
integer height = 88
string dragicon = "Question!"
boolean bringtotop = true
string pointer = "MANO.CUR"
string picturename = "incid_grande1.bmp"
boolean focusrectangle = false
end type

event dragdrop;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragDrop
// 
// Objetivo: Recibe la incidencia a la que se va asociar
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
// 19/01/2000  FDO		  Modificaci$$HEX1$$f300$$ENDHEX$$n
// 27/04/2000  FDO		  Incidencias de Calidad
///////////////////////////////////////////////////////


decimal{0} ldec_tipo_aviso
int li_res, li_ind_cli_imp, li_ind_avi_pel, li_sum_imp, li_est_incid
datetime	ldt_f_alta,ldt_f_deteccion
long ll_nro_avi, ll_fila = 0, ll_instalac, LL_INST_AVISO, LL_INSTALAC_CORRESPONDIENTES
boolean LB_INS_DETECT=false

SetPointer(HourGlass!)
//AHM 0/586536
// A$$HEX1$$f100$$ENDHEX$$adido por RCA (05-03-2008) Comprobamos si la instalacion del aviso tiene
// correspondencia con la instalacion de las interrupciones de dicha incidencia.
/*DECLARE L_CUR_INSTALAC CURSOR FOR  
SELECT COUNT(*)  
FROM GI_AVISOS_INSTALACION, SGD_INTERRUPCION  
WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :ll_nro_avi AND
		SGD_INTERRUPCION.NRO_INCIDENCIA = :il_incid_1 AND
		GI_AVISOS_INSTALACION.NRO_INSTALACION = SGD_INTERRUPCION.NRO_INSTALACION;*/

//JME 06/04/09
//Los c$$HEX1$$f300$$ENDHEX$$digos de aviso y de incidencia est$$HEX1$$e100$$ENDHEX$$n puestos a pelo. Deben ser variables. 

//DECLARE L_CUR_INSTALAC CURSOR FOR		
//SELECT COUNT(*)  
//FROM (SELECT GI_AVISOS_INSTALACION.NRO_INSTALACION
//	  FROM GI_AVISOS_INSTALACION, SGD_INTERRUPCION  
//	  WHERE GI_AVISOS_INSTALACION.NRO_AVISO = 104624 AND
//		SGD_INTERRUPCION.NRO_INCIDENCIA = 306104 AND
//		GI_AVISOS_INSTALACION.NRO_INSTALACION = SGD_INTERRUPCION.NRO_INSTALACION
//	  UNION ALL
//	  SELECT GI_AVISOS_INSTALACION.NRO_INSTALACION
//	  FROM GI_AVISOS_INSTALACION, SGD_INTERRUPCION_RS  
//	  WHERE GI_AVISOS_INSTALACION.NRO_AVISO = 104624 AND
//		SGD_INTERRUPCION_RS.NRO_INCIDENCIA = 306104 AND
//		GI_AVISOS_INSTALACION.NRO_INSTALACION = SGD_INTERRUPCION_RS.NRO_INSTALACION);
		
DECLARE L_CUR_INSTALAC CURSOR FOR		
SELECT COUNT(*)  
FROM (SELECT GI_AVISOS_INSTALACION.NRO_INSTALACION
	  FROM GI_AVISOS_INSTALACION, SGD_INTERRUPCION  
	  WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :ll_nro_avi AND
		SGD_INTERRUPCION.NRO_INCIDENCIA = :il_incid_1 AND
		GI_AVISOS_INSTALACION.NRO_INSTALACION = SGD_INTERRUPCION.NRO_INSTALACION
	  UNION ALL
	  SELECT GI_AVISOS_INSTALACION.NRO_INSTALACION
	  FROM GI_AVISOS_INSTALACION, SGD_INTERRUPCION_RS  
	  WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :ll_nro_avi AND
		SGD_INTERRUPCION_RS.NRO_INCIDENCIA = :il_incid_1 AND
		GI_AVISOS_INSTALACION.NRO_INSTALACION = SGD_INTERRUPCION_RS.NRO_INSTALACION);		

//Fin JME
// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (05-03-2008)



//DECLARE L_CUR_INSTALAC CURSOR FOR  
// SELECT "GI_AVISOS_INSTALACION"."NRO_INSTALACION"  
// FROM "GI_AVISOS_INSTALACION"  
//WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_avi  ;

// Verifico el estado de la Incidencia
SELECT "SGD_INCIDENCIA"."EST_ACTUAL","SGD_INCIDENCIA"."NRO_INST_AFECTADA","SGD_INCIDENCIA"."F_DETECCION"  
INTO :li_est_incid,:ll_instalac,:ldt_f_deteccion  
FROM "SGD_INCIDENCIA"  
WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :il_incid_1;


//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//** Se envia 0 en el 5 parametro para **
//** verificar que el parametro activo **
//***************************************
If fw_asoc_aviso_inc_rs(1, This, 1, il_incid_1, 0, li_est_incid) = 0 Then
	 gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
	 Return
End If
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


// Compruebo que los avisos de calidad se dragueen a incidencias de calidad y lo mismo con
// las incidencias y avisos normales

IF ii_tipo_inc_1 <> ii_ind_calidad THEN 
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El tipo del aviso no coincide con el tipo de la incidencia.")
    gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
	dw_lista_avisos.Drag(End!)
	This.Border = false
	return
END IF
	
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	11/05/2001  IF SQLCA.SQLCODE=100 THEN   // LA INCIDENCIA HA SIDO ELIMINADA
//**  OSGI 2001.1  	11/05/2001  	gnv_msg.f_mensaje("AA11","","",OK!)
//**  OSGI 2001.1  	11/05/2001  	ib_incid_selec=FALSE
//**  OSGI 2001.1  	11/05/2001  	il_incid_1 = 0
//**  OSGI 2001.1  	11/05/2001  	p_inc_sel.Visible = False
//**  OSGI 2001.1  	11/05/2001  	st_inc_sel.Visible = False
//**  OSGI 2001.1  	11/05/2001  	dw_lista_avisos.Drag(End!)
//**  OSGI 2001.1  	11/05/2001  	RETURN
//**  OSGI 2001.1  	11/05/2001  END IF
//**  OSGI 2001.1  	11/05/2001  	
//**  OSGI 2001.1  	11/05/2001  IF li_est_incid >  fgci_incidencia_servicio_repuesto THEN
//**  OSGI 2001.1  	11/05/2001  	gnv_msg.f_mensaje("AA10","","",OK!)
//**  OSGI 2001.1  	11/05/2001  	ib_incid_selec = False
//**  OSGI 2001.1  	11/05/2001  	il_incid_1  = 0
//**  OSGI 2001.1  	11/05/2001  	p_inc_sel.Visible = False
//**  OSGI 2001.1  	11/05/2001  	st_inc_sel.Visible = False
//**  OSGI 2001.1  	11/05/2001  	dw_lista_avisos.Drag(End!)
//**  OSGI 2001.1  	11/05/2001  	RETURN
//**  OSGI 2001.1  	11/05/2001  END IF


//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//Desde aqui hasta el final se tiene que repetir tantas veces como filas marcadas
//HSE


ll_fila = dw_lista_avisos.getselectedrow(ll_fila)


do while ll_fila > 0
	ldec_tipo_aviso = dw_lista_instal.GetItemDecimal(ii_fila_clickeada,"nro_instalacion") 
	li_ind_cli_imp  = dw_lista_avisos.GetItemNumber(ll_fila,"ind_cli_imp") 
	li_ind_avi_pel  = dw_lista_avisos.GetItemNumber(ll_fila,"avisos_ind_peligro") 
	ldt_f_alta		 = dw_lista_avisos.GetItemDateTime(ll_fila,"f_alta") 
	
	iuo_avi_2001_nu = CREATE u_avi_2001_nu_lista_avisos
	
	ll_nro_avi = dw_lista_avisos.GetItemNumber(ll_fila,"avisos_nro_aviso")
		
	// comprueba la correspondencia de las instalaciones de los avisos marcados con la insta-
	// lacion de la incidencia
	
	if ldec_tipo_aviso=fgcdec_aviso_de_ayuda or &
		ldec_tipo_aviso=fgcdec_aviso_sin_alimentacion or &
		ldec_tipo_aviso=fgcdec_aviso_alumbrado_publico or &
		ldec_tipo_aviso=fgcdec_aviso_de_calidad_sin_alim then
		
		LB_INS_DETECT=TRUE
		
	else
		
		OPEN L_CUR_INSTALAC;
		
//		FETCH L_CUR_INSTALAC INTO :LL_INST_AVISO;

		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (05-03-08)
		FETCH L_CUR_INSTALAC INTO :LL_INSTALAC_CORRESPONDIENTES;
		// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (05-03-08) 
		
		DO while SQLCA.SQLCODE = 0
			
//			IF LL_INST_AVISO=LL_INSTALAC THEN
//				
//				LB_INS_DETECT=TRUE
//				
//			end if
			
			// A$$HEX1$$f100$$ENDHEX$$adido por RCA (05-03-08)
			IF LL_INSTALAC_CORRESPONDIENTES > 0 THEN
				LB_INS_DETECT=TRUE
			end if
			// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (05-03-08) 
			
			FETCH L_CUR_INSTALAC INTO :LL_INST_AVISO;
			
		loop
		
		CLOSE L_CUR_INSTALAC;
		
	end if
	
	if lb_ins_detect = false then
		
//		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",&
//		"La instalaci$$HEX1$$f300$$ENDHEX$$n que alimenta a alguno de los avisos no tiene correspondencia con la instalaci$$HEX1$$f300$$ENDHEX$$n sobre la que recae la incidencia.")

		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (05-03-08)
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",&
		"Ninguna de las instalaciones interumpidas de la incidencia tiene correspondencia con el aviso.")
		// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (05-03-08) 

		
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		
		dw_lista_avisos.Drag(End!)
		This.Border = false
		DESTROY iuo_avi_2001_nu	
		return
		
	end if
	
	if ldt_f_alta < ldt_f_deteccion then
		
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",&
		"Alguno de los avisos que intenta asociar es anterior a la Fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la Incidencia.")
		
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		
		dw_lista_avisos.Drag(End!)
		This.Border = false
		DESTROY iuo_avi_2001_nu	
		return
		
	end if
	
	// GNU 28-6-2007. Mejora 23 (avisos)
	// Resolver la OT (pero no el aviso). Cerrar las brigadas y contratas correspondientes
	IF fnu_resolver_OT()= -1 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se ha podido resolver la OT")
		
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		
		dw_lista_avisos.Drag(End!)
		This.Border = false
		DESTROY iuo_avi_2001_nu	
		return
	END IF
	// FIN GNU
	IF iuo_avi_2001_nu.fnu_asociar_aviso(ll_nro_avi ,&
			il_incid_1, li_ind_cli_imp, li_ind_avi_pel, ldt_f_alta) = -1 THEN
		Parent.PostEvent("ue_refrescar")
		
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
			 
		dw_lista_avisos.Drag(End!)
		DESTROY iuo_avi_2001_nu	
		RETURN
	END IF
	
	// Si estoy en un aviso normal o sin alimentaci$$HEX1$$f300$$ENDHEX$$n,
	// si el suministro es de un cliente importante
	// genero un registro en 'sum_imp'
	
	IF ldec_tipo_aviso <> fgcdec_aviso_de_ayuda AND ldec_tipo_aviso <>fgcdec_aviso_alumbrado_publico THEN
		IF li_ind_cli_imp = 1 THEN
			IF iuo_avi_2001_nu.fnu_g_sum_imp(ll_nro_avi,il_incid_1) = -1 THEN
				
				gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
				
				dw_lista_avisos.Drag(End!)
				DESTROY iuo_avi_2001_nu	
				RETURN
			END IF
		END IF
	END IF
	
	DESTROY iuo_avi_2001_nu	
	
	
	//***************************************
	//**  OSGI 2001.1  	11/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	If fw_asoc_aviso_inc_rs(1, This, 2, il_incid_1, ll_fila, li_est_incid) = 0 Then
		gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		Return
	End If
	//***************************************
	//**  OSGI 2001.1  	11/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

	ll_fila = dw_lista_avisos.getselectedrow(ll_fila)




	lb_ins_detect = false
	
loop

gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,1) //Commit

This.Border = false
dw_lista_avisos.Drag(End!)

parent.triggerevent("ue_refrescar")
end event

on doubleclicked;ib_incid_selec = FALSE

Parent.TriggerEvent("ue_seleccionar_inc")

end on

event dragleave;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragLeave
// 
// Objetivo: Levanta el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_avi_2001_pr_lista_avisos" THEN
		
		This.Border = false
				
 	END IF
END IF

end event

event dragenter;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragEnter
// 
// Objetivo: Unde el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_avi_2001_pr_lista_avisos"  THEN
		This.Border = true
		This.BorderStyle = StyleLowered!
				
 	END IF
END IF
end event

event rbuttondown;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Rbuttondown
// 
// Objetivo: Muestra el menu asociado al BMP
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 17/09/97    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////
m_emerg_avis lm_gestion_avi
lm_gestion_avi = CREATE m_emerg_avis
ii_incidencia = 1
IF fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	lm_gestion_avi.PopMenu(PointerX()+1060, PointerY()+400)
ELSE
	lm_gestion_avi.PopMenu(PointerX()+1720, PointerY()+1700)
END IF
end event

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1520
	This.x = 1714
END IF
end event

type st_inc_sel from multilineedit within w_1105_avisos_con_alim
string tag = "  "
boolean visible = false
integer x = 1102
integer y = 64
integer width = 338
integer height = 236
integer taborder = 190
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
boolean vscrollbar = true
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1612
	This.x = 1911
	This.width = 635
END IF
end event

type gb_incidencia from groupbox within w_1105_avisos_con_alim
integer x = 3022
integer y = 88
integer width = 558
integer height = 188
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "    Inc. Asoc. -- Tipo"
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1520
	This.x = 967
	This.width = 558
	//1600
END IF
end event

type gb_indicativos_inst from groupbox within w_1105_avisos_con_alim
integer x = 2299
integer y = 32
integer width = 1289
integer height = 260
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Indicativos para la inst.: "
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	//This.y = 1544
	This.y = 1464
	This.x = 32
	This.width = 1559
END IF
end event

type st_otras from statictext within w_1105_avisos_con_alim
integer x = 27
integer y = 1460
integer width = 1559
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 276856960
boolean enabled = false
string text = " Otras SMT para el CT."
boolean border = true
long bordercolor = 8421504
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1120
END IF
end event

type dw_otras_inst from u_inst_2011_otras_smt within w_1105_avisos_con_alim
integer x = 27
integer y = 1528
integer height = 280
integer taborder = 40
boolean bringtotop = true
boolean hscrollbar = true
boolean vscrollbar = true
end type

event clicked;call super::clicked;////////////////////////////////////////////////////////
//										
// Funcion/Evento: clicked
// 
// Objetivo: Marca/Desmarca la fila sobre la que se produce la acci$$HEX1$$f300$$ENDHEX$$n
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      	Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	  		-----------  			 ---------
// 24/04/2000  	 FDO				Clicked
//
///////////////////////////////////////////////////////
if row < 1 then return

this.selectrow(0,false)
this.selectrow(row,true)

end event

event sqlpreview;//
end event

event ue_as_need;//
end event

event doubleclicked;call super::doubleclicked;string ls_nomb_inst,ls_nomb_inst2,ls_nom_subestac,ls_fase,ls_fase_sal_mt,ls_compara1,ls_compara2
long ll_posicion,ll_nro_subest_ant,ll_sal_mt_nueva,ll_nro_subestac
datetime ldt_fecha_Actual,ldt_fecha_bd,ld_f_actual[]
int li_result_func,li_contador = 1
long ll_nro_aviso[]

if row < 1 then return
if gi_pais = 8 then return 

this.selectrow(0,false)
this.selectrow(row,true)

ll_posicion = dw_lista_instal.find('nro_instalacion = ' + string(il_nro_instal_padre) ,1,dw_lista_instal.rowcount())

ls_nomb_inst = dw_lista_instal.object.nom_instalacion[ll_posicion]
ls_nomb_inst2 = dw_otras_inst.object.nom_instalacion[row]
ll_sal_mt_nueva = dw_otras_inst.object.cod_smt[row]
ls_fase_sal_mt = dw_otras_inst.object.fase[row]
ll_nro_subest_ant = dw_lista_instal.object.nro_inst_padre[ll_posicion]
ldt_fecha_bd = dw_lista_instal.object.f_Actual[ll_posicion]
ls_fase = dw_lista_instal.object.fase[ll_posicion]
ldt_fecha_Actual = fgcd_fecha_con_seg()

if gb_red_trifasica= false then
	
	  SELECT "GI_FASE_CHAR"."FASE_STRING"  
		 INTO :ls_fase_sal_mt  
		 FROM "GI_FASE_CHAR"  
		WHERE "GI_FASE_CHAR"."FASE_NOM" = :ls_fase_sal_mt   ;
	  
	  SELECT "GI_FASE_CHAR"."FASE_STRING"  
		 INTO :ls_fase
		 FROM "GI_FASE_CHAR"  
		WHERE "GI_FASE_CHAR"."FASE_NOM" = :ls_fase;
		
	  FOR li_contador =1 to 3
		ls_compara1=Mid(ls_fase, li_contador, 1)
		if ls_compara1 = '1' then
			ls_compara2=Mid(ls_fase_sal_mt, li_contador, 1)
			if ls_compara1 <> ls_compara2 then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede reemplazar la salida de media ya que las fases " +&
												"de la que ha elegido no coinciden con las fases de los suministros a los que pertenecen los avisos" )
				return
			end if
		end if
	  NEXT
end if
	
IF messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea que los avisos normales y de calidad que actualmente est$$HEX1$$e100$$ENDHEX$$n alimentados a trav$$HEX1$$e900$$ENDHEX$$s de " + ls_nomb_inst + ", pasen a estar alimentados a trav$$HEX1$$e900$$ENDHEX$$s de " + ls_nomb_inst2 + " ?" ,question!,okcancel!) = 1 THEN
		
	// Buscar posibles OT's e Incidencias que afecten
	// Capturar los datos de la Subestacion que alimenta a la salida de mt.
	
	li_contador =1
	
	  SELECT "SGD_SUBESTAC"."NOMBRE",   
        			  "SGD_SUBESTAC"."CODIGO"  
    		INTO :ls_nom_subestac,   
         	    :ll_nro_subestac  
    		FROM "SGD_INSTALACION",   
         		 "SGD_SUBESTAC"  
  		WHERE ( "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_SUBESTAC"."CODIGO" ) AND  
         			( "SGD_INSTALACION"."NRO_INSTALACION" = :ll_sal_mt_nueva ) AND  
         			( "SGD_SUBESTAC"."BDI_JOB" = 0 );

						
		IF sqlca.sqlcode<> 0 then
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo recuperar informaci$$HEX1$$f300$$ENDHEX$$n de la subestaci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext ,information!,ok!)
			Return -1		
		END IF
		
		// Cursor para recuperar avisos que tienen las instalaciones afectadas.
		
		DECLARE lc_avisos CURSOR FOR  
		SELECT "GI_AVISOS_INSTALACION"."NRO_AVISO"    
			FROM "GI_AVISOS_INSTALACION"  
				WHERE ( "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :il_nro_instal );
	
		OPEN lc_avisos;
		
		IF sqlca.sqlcode<> 0 then
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al ejecutar el cursor lc_avisos: " + sqlca.sqlerrtext ,information!,ok!)
			Return -1		
		END IF
		
		FETCH lc_avisos into :ll_nro_aviso[li_contador];

		DO WHILE sqlca.sqlcode = 0
			
			SELECT "GI_AVISOS"."F_ACTUAL"
			INTO :ld_f_actual[li_contador]
			FROM "GI_AVISOS"  
			WHERE "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso[li_contador];			
			
			li_contador ++
			

			FETCH lc_avisos into :ll_nro_aviso[li_contador];
			
		LOOP
		
		close lc_avisos;
		
		FOR li_contador = 1 to upperbound(ll_nro_aviso[]) - 1
			
			li_result_func = gnu_u_transaction.uf_bloquea_avisos(ld_f_actual[li_contador],fgci_bloq_cambio_salidas_mt,ll_nro_aviso[li_contador])
			if li_result_func= -2 OR li_result_func= -54 then
				return
			end if
		
			// Reemplazar la salida de media que alimenta al ct. en la tabla avisos_instalacion
			
			UPDATE "GI_AVISOS_INSTALACION"  
			SET 	"NRO_INSTALACION" = :ll_sal_mt_nueva,   
					"NRO_INST_PADRE" = :ll_nro_subestac,   
					"NOM_INSTALACION" = :ls_nomb_inst2,
					"F_ACTUAL" = :ldt_fecha_Actual
			WHERE ( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso[li_contador] ) AND  
						( "GI_AVISOS_INSTALACION"."TIPO_INSTALACION" = :fgci_tipo_salida_mt );
			
			IF sqlca.sqlcode<> 0 then
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la Salida de media tensi$$HEX1$$f300$$ENDHEX$$n en la tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext ,information!,ok!)
				
				Return -1
			END IF

		// Reemplazar la subestacion que alimenta a la Salida de Media en la tabla avisos_instalacion
		
			UPDATE "GI_AVISOS_INSTALACION"  
			SET "NRO_INSTALACION" = :ll_nro_subestac,   
					"NOM_INSTALACION" = :ls_nom_subestac,
					"F_ACTUAL" = :ldt_fecha_Actual  
			WHERE ( "GI_AVISOS_INSTALACION"."TIPO_INSTALACION" = :fgci_tipo_subestacion ) AND
						( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso[li_contador] ) AND
						( "GI_AVISOS_INSTALACION"."EST_AVISO" <= :fgci_aviso_enviado_brigada );
							
			IF sqlca.sqlcode<> 0 then
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de la Subestaci$$HEX1$$f300$$ENDHEX$$n en tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext ,information!,ok!)
				gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso[li_contador],2) //rollback
				Return -1
			END IF
			
			// Reemplazar la instalacion padre del ct en la tabla avisos_instalacion
			
			UPDATE "GI_AVISOS_INSTALACION"  
			SET "NRO_INST_PADRE" = :ll_sal_mt_nueva,
					"F_ACTUAL" = :ldt_fecha_Actual   
			WHERE ( "GI_AVISOS_INSTALACION"."TIPO_INSTALACION" = :fgci_tipo_ct ) AND
						( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso[li_contador] ) AND
						( "GI_AVISOS_INSTALACION"."EST_AVISO" <= :fgci_aviso_enviado_brigada );
	
			IF sqlca.sqlcode<> 0 then
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la informaci$$HEX1$$f300$$ENDHEX$$n del CT en tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext ,information!,ok!)
				gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso[li_contador],2) //rollback
				Return -1
			END IF
		
	
			// Actualizar la fecha actual del fgcdec_aviso_con_alimentacion
			
			UPDATE "GI_AVISOS_INSTALACION"  
			SET "F_ACTUAL" = :ldt_fecha_Actual  
			WHERE (( "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :fgcdec_aviso_con_alimentacion 
							OR "NRO_INSTALACION" = :fgcdec_aviso_de_calidad
							OR "NRO_INSTALACION" = :fgcdec_aviso_de_calidad_con_alim ) AND  
							 "GI_AVISOS_INSTALACION"."EST_AVISO" <= :fgci_aviso_enviado_brigada ) AND 
							  "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso[li_contador];
							  
			IF sqlca.sqlcode <> 0 then
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de la Instalacion gen$$HEX1$$e900$$ENDHEX$$rica para avisos con alimentaci$$HEX1$$f300$$ENDHEX$$n en tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n:  " + sqlca.sqlerrtext ,information!,ok!)
				gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso[li_contador],2) //rollback
				Return -1
			END IF
			
			UPDATE "GI_AVISOS_INSTALACION"  
			SET "F_ACTUAL" = :ldt_fecha_Actual   
			WHERE 	( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso[li_contador] ) ;			
			
			IF sqlca.sqlcode <> 0 then
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de la Instalacion gen$$HEX1$$e900$$ENDHEX$$rica para avisos con alimentaci$$HEX1$$f300$$ENDHEX$$n en tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n:  " + sqlca.sqlerrtext ,information!,ok!)
				gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso[li_contador],2) //rollback
				Return -1
			END IF
			
			UPDATE "GI_AVISOS"  
			SET "F_ACTUAL" = :ldt_fecha_Actual   
			WHERE 	( "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso[li_contador] ) ;			
			
			IF sqlca.sqlcode <> 0 then
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de la Instalacion gen$$HEX1$$e900$$ENDHEX$$rica para avisos con alimentaci$$HEX1$$f300$$ENDHEX$$n en tabla gi_avisos_instalaci$$HEX1$$f300$$ENDHEX$$n:  " + sqlca.sqlerrtext ,information!,ok!)
				gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso[li_contador],2) //rollback
				Return -1
			END IF
			
			gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso[li_contador],1) //commit
			
		NEXT			

		// Con estos datos estar$$HEX1$$ed00$$ENDHEX$$a todo cambiado, lanzamos ahora el ue_refrescar con la opci$$HEX1$$f300$$ENDHEX$$n de actuar directamente
		// en el $$HEX1$$e100$$ENDHEX$$rbol y la datawindow dw_instal
	
		// Refrescamos todas las Fechas actuales del aviso
		
		dw_otras_inst.retrieve(il_nro_instal,ll_sal_mt_nueva)

		ib_cambio_inst = true
		
		parent.triggerevent("ue_refrescar",0,2)	
		
END IF


end event

event retrieveend;call super::retrieveend;if gb_red_trifasica = true then 
	dw_otras_inst.object.fase.visible=false
	dw_otras_inst.object.fase_t.visible=false
	dw_otras_inst.object.linea.x2=1472
	dw_otras_inst.object.cc_total.x=1211
	dw_otras_inst.hscrollbar = false
end if
end event

event constructor;call super::constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1188
END IF
end event

type st_clientes_pot_t from statictext within w_1105_avisos_con_alim
boolean visible = false
integer x = 869
integer y = 668
integer width = 704
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 276856960
boolean enabled = false
string text = "clientes:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 56
END IF
end event

type tv_1 from uo_man_instalac within w_1105_avisos_con_alim
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
event ue_primera_vez ( )
event ue_pos_selection ( )
integer x = 27
integer y = 728
integer width = 1554
integer height = 732
integer taborder = 10
integer textsize = -8
fontcharset fontcharset = ansi!
long textcolor = 33554432
string picturename[] = {"40"}
long statepicturemaskcolor = 536870912
integer ii_instalaciones_modificadas = 0
integer ii_instalaciones_interrumpidas = 0
integer ii_instalaciones_repuestas = 0
integer ii_cmd_padre = 0
integer ii_instalaciones_at = 0
integer ii_instalaciondes_indisponibles = 100
integer ii_instalaciones_indisponibles_oi = 200
end type

event clicked;long ll_posicion, ll_codigo

IF handle > 0 then
	This.SelectItem(handle)
END IF

ll_posicion = dw_lista_instal.find("manejador = " + string(il_handle), 1, dw_lista_instal.rowcount())

if ll_posicion = 0 then
	return
end if

ll_codigo = dw_lista_instal.getitemnumber(ll_posicion,"nro_instalacion")

ib_calle = false

if ll_codigo>0 and ll_codigo <  fgcdec_aviso_alumbrado_publico & 
   and ll_codigo <> fgcdec_aviso_de_calidad & 
	and ll_codigo <> fgcdec_aviso_de_calidad_con_alim & 
	and ll_codigo <> fgcdec_aviso_de_calidad_sin_alim & 
then 
 	gl_instalacion_afectada = fg_codigo_visible(ll_codigo)
else
	gl_instalacion_afectada = 0
end if

long ll_tipo_instalacion
IF handle <> 0 THEN
	ii_nivel_tension = dw_lista_instal.GetItemNumber(ll_posicion, "tension")
END IF

yield()
end event

event doubleclicked;////////////////////////////////////////////////////////////////////////////////////
//										
// Funcion/Evento: Doubleclicked
// 
// Objetivo: Avanza un nivel en el $$HEX1$$e100$$ENDHEX$$rbol.
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/97    FDO
//	27/03/2000	FDO			 Sustituci$$HEX1$$f300$$ENDHEX$$n por cursores din$$HEX1$$e100$$ENDHEX$$micos y validaci$$HEX1$$f300$$ENDHEX$$n d. perfiles
//
///////////////////////////////////////////////////////////////////////////////////


//Buscar en el datawindow el codigo del elemento pulsado

/// DEFINICION DE VARIABLES

long li_item, ll_zona, ll_cmd, ll_sector, ll_tipo_aviso
int li_cant_av, li_co_nivel_orig,li_cant_av_zona,li_cant_cli_imp,li_cant_av_pel,li_ind_inc,li_sitio,li_otras_smt,li_tension
string ls_nom_instalacion, ls_cadena, ls_sql_statement,ls_fase,ls_fase_comun,ls_fase_afec='000'
long ll_nro_instal,ll_nro_instal_padre, ll_posicion, ll_nro_ot, ll_codigo, ll_manejador, ll_fila,ll_tipo_instalacion
datetime ldt_f_actual


int li_clase_aviso 

//*********************************************************************************//
//     Externalidad: Agregar Potencia Instalada y Clientes en Gestion de Avisos    //
//     Luis Eduardo Ortiz Abril/2001                                               //
//*********************************************************************************//
Double ld_pot_instalada
Long ll_clientes
//***********************************************************************//
//     Luis Eduardo Ortiz Abril/2001                                     //
//***********************************************************************//

ls_cadena= "manejador = " + string(handle)
ii_clicked_row = dw_lista_instal.Find(ls_cadena,  &
	0, dw_lista_instal.RowCount( ))
dw_lista_instal.selectrow(long(ii_clicked_row),true)

treeviewitem arbol

if handle < 1 then
	return
end if

/// FIN DEFINICION, las variables se definen como locales ya que
/// estas son las que se encargan de cargar los nuevos datos en el arbol
/// y en la datawindow, pero no son las que el usuario debe tener como 
/// actuales ya que el registro seleccionado es el mismo que antes del
/// DBLCLICKED
ll_zona = dw_ambito.GetItemNumber(1, 'nro_centro')
ll_cmd =  dw_ambito.getitemnumber(1,"nro_cmd") 
ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")

ll_posicion = dw_lista_instal.find("manejador = " + string(handle), 1, dw_lista_instal.rowcount())

ll_codigo = dw_lista_instal.getitemnumber(ll_posicion,"nro_instalacion")

///si la rama no estaba previamente extendida la extiendo

if dw_lista_instal.getitemnumber(ii_clicked_row,"expandido")=0 then

	li_clase_aviso=dw_lista_instal.getitemnumber(ll_posicion,"clase_aviso")//DBE 29/03/2000 13:19

	DECLARE hijos_zona DYNAMIC CURSOR FOR SQLSA;
				
	// Incluyo avisos Globales o por cmd con $$HEX1$$bf00$$ENDHEX$$PLSQL? 
	// se deja de momento para comprobar el rendimiento				
	

		ls_sql_statement= "SELECT COUNT(GI_AVISOS_INSTALACION.NRO_AVISO)," + &
						"GI_AVISOS_INSTALACION.NOM_INSTALACION , " + &
					   	"GI_AVISOS_INSTALACION.NRO_INSTALACION , " + &
					   	"GI_AVISOS_INSTALACION.TIPO_INSTALACION , " + &
				      	"GI_AVISOS_INSTALACION.NRO_INST_PADRE, " + &
						"MAX(GI_AVISOS_INSTALACION.NRO_ZONA), " + &	
						"MAX(GI_AVISOS_INSTALACION.NRO_CMD), " + &
						"MAX(GI_AVISOS_INSTALACION.NRO_SECTOR), " + &
						"MAX(GI_AVISOS_INSTALACION.F_ACTUAL), " + &	
						"MAX(GI_AVISOS_INSTALACION.IND_INCIDENCIA), " + &
						"MAX(GI_AVISOS_INSTALACION.NRO_OT), " + &
						"MAX(GI_AVISOS_INSTALACION.IND_OTRAS_SMT), " + &
						"MAX(GI_AVISOS_INSTALACION.TENSION) " + &
	  					"FROM GI_AVISOS_INSTALACION " + &
						"WHERE GI_AVISOS_INSTALACION.NRO_INST_PADRE = ? AND GI_AVISOS_INSTALACION.EST_AVISO <= 2 " + &
						" AND NRO_ZONA=decode(" + string(ll_zona) + ", 0, NRO_ZONA,"  + string(ll_zona)+ ") " + &
	     			" AND NRO_CMD=decode("  + string(ll_cmd) + " , 0, NRO_CMD,"  + string(ll_cmd) + ") " + &
	  			" AND NRO_SECTOR=decode(" + string(ll_sector) + " , 0, NRO_SECTOR," + string(ll_sector) + ")" 
	
	ls_sql_statement = ls_sql_statement + " AND GI_AVISOS_INSTALACION.CLASE_AVISO = " + string(li_clase_aviso) 
	
	if cbx_filtrar_alcances.checked = true then
		ls_sql_statement = ls_sql_statement + " AND NVL(GI_AVISOS_INSTALACION.CO_ALCANCE,0) in (" + is_alcances +  ") "  
	end if
	// FDO Mejora Pan 221666
	
	if  cbx_filtrar_fechas.checked = true  then // Filtra por Fecha de Alta
		ls_sql_statement= ls_sql_statement + &
		" AND GI_AVISOS_INSTALACION.F_ALTA >= TO_DATE('" + ids_f_desde + "','DD/MM/YYYY HH24:MI:SS') " + &
		" AND GI_AVISOS_INSTALACION.F_ALTA <= TO_DATE('" + ids_f_hasta + "','DD/MM/YYYY HH24:MI:SS') " 
	end if	
	
	// FDO Mejora Pan 221666
	
	//				//GNU 13-4-2007. Mejora 1/465491
				IF cbx_numero.checked= true then
					IF em_desde.text="" then
						ls_sql_statement += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_hasta.text
					ELSEIF em_hasta.text="" then
						ls_sql_statement += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_desde.text
					ELSE
						ls_sql_statement += " and GI_AVISOS_INSTALACION.NRO_AVISO>=" + em_desde.text + &
										 " and GI_AVISOS_INSTALACION.NRO_AVISO<=" + em_hasta.text
					END IF
				END IF
				// FIN GNU
	//JHE SFP DEO12-160 23/10/2012

IF cbx_filtrar_activos.checked= true THEN
		ll_tipo_aviso = dw_avisos_activos.GetitemNumber(1,"tip_aviso")

		ls_sql_statement += " AND GI_AVISOS_INSTALACION.TIPO_AVISO="+string(ll_tipo_aviso)
END IF
//JHE SFP DEO12-160 23/10/2012
	ls_sql_statement = ls_sql_statement + " GROUP BY GI_AVISOS_INSTALACION.NRO_INSTALACION , " + &
					   	"GI_AVISOS_INSTALACION.NOM_INSTALACION , " + &
					   	"GI_AVISOS_INSTALACION.TIPO_INSTALACION , " + &
				      	"GI_AVISOS_INSTALACION.NRO_INST_PADRE , " + &
						"GI_AVISOS_INSTALACION.TENSION "
	
	PREPARE SQLSA FROM :ls_sql_statement;
	
	OPEN DYNAMIC hijos_zona using :LL_CODIGO;
	
	if sqlca.sqlcode = -1 then
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al cargar el $$HEX1$$e100$$ENDHEX$$rbol: " + sqlca.sqlerrtext ,information!,ok!)
		Return -1
	END IF
	
	fetch hijos_zona 
	into 	:li_cant_av_zona,
			:ls_nom_instalacion,
			:ll_nro_instal, 
			:ll_tipo_instalacion,
			:ll_nro_instal_padre,
			:ii_nro_centro,
			:ii_nro_cmd,
			:ii_nro_mesa,
			:ldt_f_actual,
			:li_ind_inc,
			:ll_nro_ot,
			:li_otras_smt,
			:li_tension;
	
	do while sqlca.sqlcode <> -1 and sqlca.sqlcode <> 100
	
		//Sumatorio de fases Para el arbolito FDO
		IF li_cant_av_zona > 0 THEN
			if li_clase_aviso =  fgci_clase_avi_normal and &
			  gb_red_trifasica=false then
				
				declare lc_cursor_fases cursor for
				select fase 
				from gi_avisos_instalacion
				where nro_instalacion = :ll_nro_instal
					and est_aviso <= :fgci_aviso_enviado_brigada
					and clase_aviso = :li_clase_aviso;
					
				open lc_cursor_fases;
				
				fetch lc_cursor_fases into :ls_fase_comun;	
				
				do while sqlca.sqlcode=0 and ls_fase_afec <> '111'
					
					li_sitio=pos(ls_fase_comun,'1',1)
					
					do while li_sitio >= 1
						ls_fase_afec = replace(ls_fase_afec,li_sitio,1,'1')
						li_sitio=pos(ls_fase_comun,'1',li_sitio + 1)
					loop
					
					fetch lc_cursor_fases into :ls_fase_comun;		
				loop
				
				close lc_cursor_fases;
				
				Select descripcion 
				into :ls_fase_afec
				from sgd_valor
				where codif = 'FASE' and
						valor = :ls_fase_afec;
						
			end if
			
			 choose case ll_nro_instal
					case fgcdec_aviso_de_calidad_con_alim
						ll_tipo_instalacion=fgcdec_aviso_de_calidad_con_alim
					case  fgcdec_aviso_de_calidad_sin_alim
						ll_tipo_instalacion=fgcdec_aviso_de_calidad_sin_alim
			end choose 
					
			li_item=f_icono_arbol(ll_tipo_instalacion)
					
			IF isnull(ls_fase_afec) or ls_fase_afec = '000' then
				ll_manejador = tv_1.insertitemfirst(handle, ls_nom_instalacion + space(1) + ' (' +string(li_cant_av_zona) + ')'  , li_item)
			ELSE
				ll_manejador = tv_1.insertitemfirst(handle, ls_nom_instalacion + space(1) + ' (' + ls_fase_afec+ ')   (' +string(li_cant_av_zona) + ')'  , li_item)
			END IF		
			
			//VALIDO PARA VER SI HAY ALGUNA OT SOBRE LA INSTALACION
			
			IF ll_nro_ot > 0 THEN
				//AHM (18/04/2011) IM117826
				
				SELECT COUNT(*)
				INTO :ll_nro_ot
				FROM "GI_OT"  
   			WHERE ( "GI_OT"."NRO_INSTALACION" = :ll_nro_instal ) AND
						( NVL("GI_OT"."NRO_INCIDENCIA",0) = 0 ) AND   
      	 			( "GI_OT"."EST_OT" < 3) AND 
						("GI_OT"."EST_OT"<> 11); 
				
				IF ll_nro_ot > 0 THEN
					ll_posicion = tv_1.finditem(childtreeitem!, handle)
					This.getitem(LL_manejador,arbol)
					arbol.bold = true
					arbol.label=arbol.label + space(5) + "(OT)"
					This.setitem(LL_manejador, arbol)
				END IF
			END IF
			
			//VALIDO PARA VER SI HAY ALGUNA INCIDENCIA SOBRE LA INSTALACION
			IF  li_ind_inc > 0 THEN
				ll_posicion = tv_1.finditem(childtreeitem!, handle)
				This.getitem(LL_manejador,arbol)
				arbol.bold = true
				arbol.label=arbol.label + space(5) + "(I)"
				This.setitem(LL_manejador, arbol)
			END IF
	
			IF li_otras_smt > 0 and ll_tipo_instalacion = fgci_tipo_ct and gi_pais <> 8 THEN 
				IF dw_otras_inst.retrieve(ll_nro_instal,ll_codigo) > 0 THEN
					ll_posicion = tv_1.finditem(childtreeitem!, handle)
					This.getitem(LL_manejador,arbol)
					arbol.label=arbol.label + space(5) + "*"
					This.setitem(LL_manejador, arbol)
				END IF
			END IF
			
			IF li_otras_smt > 0 and ll_tipo_instalacion = fgci_tipo_subestacion and gi_pais = 8 THEN 
				IF dw_otras_inst.retrieve(ll_nro_instal,ll_codigo) > 0 THEN
					ll_posicion = tv_1.finditem(childtreeitem!, handle)
					This.getitem(LL_manejador,arbol)
					arbol.label=arbol.label + space(5) + "*"
					This.setitem(LL_manejador, arbol)
				END IF
			END IF
			
			///Cargo los datos en la datawindows que esta oculta 
			ll_fila = dw_lista_instal.insertrow(0)
			dw_lista_instal.setitem(ll_fila, "manejador", ll_manejador)
			dw_lista_instal.setitem(ll_fila, "nro_inst_padre", ll_codigo)
			dw_lista_instal.setitem(ll_fila, "nro_instalacion", ll_nro_instal)
			dw_lista_instal.setitem(ll_fila, "tip_instal", ll_tipo_instalacion)
			dw_lista_instal.setitem(ll_fila, "nom_instalacion", ls_nom_instalacion)
			dw_lista_instal.setitem(ll_fila, "nro_ot", ll_nro_ot)
			dw_lista_instal.setitem(ll_fila, "nro_centro", ii_nro_centro)
			dw_lista_instal.setitem(ll_fila, "nro_cmd", ii_nro_cmd)
			dw_lista_instal.setitem(ll_fila, "nro_mesa", ii_nro_mesa)
			dw_lista_instal.setitem(ll_fila, "cant_avisos", li_cant_av_zona)
			dw_lista_instal.setitem(ll_fila, "ind_incidencia", li_ind_inc)
			dw_lista_instal.setitem(ll_fila, "f_actual", ldt_f_actual)
			dw_lista_instal.setitem(ii_clicked_row, "expandido", 1)
			dw_lista_instal.setitem(ll_fila, "expandido", 0)
			dw_lista_instal.setitem(ll_fila, "clase_aviso", li_clase_aviso)//DBE 29/03/2000 13:23
			dw_lista_instal.setitem(ll_fila, "fase", ls_fase_afec)//DBE 29/03/2000 13:23
			dw_lista_instal.setitem(ll_fila, "ind_otras_smt", li_otras_smt)
			dw_lista_instal.setitem(ll_fila, "tension", li_tension)
			
			ls_fase_afec='000'
			
			// Calculo el nivel de tension para esa instalaci$$HEX1$$f300$$ENDHEX$$n
			
			ii_nivel_tension = li_tension
	
	//***********************************************************************//
	//     Externalidad: Agregar Potencia Instalada y Clientes en Gestion de Avisos    //
	//     Luis Eduardo Ortiz Abril/2001                                     //
	//***********************************************************************//
				SELECT nvl("SGD_INSTALACION"."POT_INSTALADA",0.00),
						 nvl("SGD_INSTALACION"."CANT_CLI",0)
				  INTO :ld_pot_instalada,
						 :ll_clientes
				  FROM "SGD_INSTALACION"  
				 WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_instal ) AND  
						 ( "SGD_INSTALACION"."BDI_JOB" = 0 )  ;
	
				dw_lista_instal.setitem(ll_fila, "pot_instalada", ld_pot_instalada)
				dw_lista_instal.setitem(ll_fila, "clientes", ll_clientes)
	//***********************************************************************//
	//     Luis Eduardo Ortiz Abril/2001                                     //
	//***********************************************************************//

	END IF
	
	fetch hijos_zona 
	into 	:li_cant_av_zona,
			:ls_nom_instalacion,
			:ll_nro_instal, 
			:ll_tipo_instalacion,
			:ll_nro_instal_padre,
			:ii_nro_centro,
			:ii_nro_cmd,
			:ii_nro_mesa,
			:ldt_f_actual,
			:li_ind_inc,
			:ll_nro_ot,
			:li_otras_smt,
			:li_tension;
			
	LOOP

	if sqlca.sqlcode = -1 then
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al cargar el $$HEX1$$e100$$ENDHEX$$rbol: " + sqlca.sqlerrtext ,information!,ok!)
		Return -1
	END IF
	
	close hijos_zona;

end if

il_handle=handle
end event

event ue_pos_selection;long ll_handle

this.setredraw(false)

ll_handle = il_handle
tv_1.selectitem(0)
tv_1.selectitem(ll_handle)

this.setredraw(true)
end event

event constructor;call super::constructor;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Constructor
// 
// Objetivo: Genera las 4 carpetas principales del $$HEX1$$e100$$ENDHEX$$rbol
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//  15/09/97      FDO
//	27/03/2000		FDO		 Sustituci$$HEX1$$f300$$ENDHEX$$n por cursores din$$HEX1$$e100$$ENDHEX$$micos y validaci$$HEX1$$f300$$ENDHEX$$n d. perfiles
//	18/05/2005		SGO		 Mejora de Moldavia.
//
///////////////////////////////////////////////////////

long ll_donde_coloco,ll_cuantos,ll_conta=1,ll_tipo, ll_zona, ll_cmd, ll_sector,ll_tipo_aviso
string ls_formato
int li_item
boolean lb_datos=true
datetime ldt_f_actual
string ls_sql_statement
int li_clase_aviso //DBE 29/03/2000 13:04

// FDO Mejora Pan 221666
if isnull(ids_f_desde) or ids_f_desde = "" then
	// Si la llamada al constructor es cuando se est$$HEX2$$e1002000$$ENDHEX$$haciendo Open, se inicializan las variables.
	ids_f_desde = "01/01/1900 00:00:00"
	ids_f_hasta = string(fgnu_fecha_actual())
end if
// FDO Mejora Pan 221666

// Tenemos que saber que perfil tiene el usuario de entrada, si por cmd o global.
// Las instalaciones jer$$HEX1$$e100$$ENDHEX$$rquicas solo pueden variar su sector con respecto a la 
// Subestacion de la que dependan. 

// --------------------------------------
//
// ii_tipo_acceso = 0 >> No tiene acceso
// ii_tipo_acceso = 1 >> Acceso por CMD
// ii_tipo_acceso = 2 >> Acceso Total.
//
//---------------------------------------

IF fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	II_TIPO_ACCESO = 2
ELSE
	This.y = 132
	if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ACCESO','ACC_CMD')=1 then
	
		II_TIPO_ACCESO = 1
		SELECT NOM_CMD INTO :IS_CMD FROM SGD_CMD WHERE COD_CMD = :gi_nro_cmd;	
		
	else
		II_TIPO_ACCESO = 0
	end if
	
	if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ACCESO','ACC_ZONA')=1 and &
		gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ACCESO','ACC_SECTOR')=1 and &
		II_TIPO_ACCESO = 1 then
			II_TIPO_ACCESO = 2
			IS_CMD="TODOS LOS CMD"
	end if
end if

IF dw_ambito.RowCount() > 0 THEN
	ll_zona = dw_ambito.GetItemNumber(1, 'nro_centro')
	ll_cmd =  dw_ambito.getitemnumber(1,"nro_cmd") 
	ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")
ELSE
	IF fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
		ll_zona = gi_nro_centro 
		ll_cmd =  gi_nro_cmd
		ll_sector = gi_nro_puesto
	ELSE
		IF ii_tipo_acceso = 1 THEN
			ll_cmd =  gi_nro_cmd
			ll_zona = fgci_todos 
			ll_sector = fgci_todos
		ELSE
			ll_cmd =  fgci_todos 
			ll_zona = fgci_todos 
			ll_sector = fgci_todos 
		END IF
	END IF
END IF

OPEN(W_BARRA)
W_BARRA.uo_barra.barra.f_resetea_barra()
W_BARRA.UO_BARRA.gb_1.text="Generando Arbol de Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos..."
W_BARRA.UO_BARRA.BARRA.visible=true
W_BARRA.uo_barra.barra.f_amplia(0)

DECLARE avisos_total DYNAMIC CURSOR FOR SQLSA;

// Incluyo avisos Globales o por cmd con $$HEX1$$bf00$$ENDHEX$$PLSQL? 
// se deja de momento para comprobar el rendimiento				
ls_sql_statement= "SELECT COUNT(GI_AVISOS_INSTALACION.NRO_AVISO)," + &
				" GI_AVISOS_INSTALACION.NRO_INSTALACION, " + &   
				" GI_AVISOS_INSTALACION.TIPO_INSTALACION, " + &
				" MAX(GI_AVISOS_INSTALACION.F_ACTUAL) " + &
				"FROM GI_AVISOS_INSTALACION " + &  
				"WHERE NRO_INSTALACION = ?" + &  
				" AND CLASE_AVISO = ? AND EST_AVISO <= 2" + &  
				" AND NRO_ZONA=decode(" + string(ll_zona) + ", 0, NRO_ZONA,"  + string(ll_zona)+ ") " + &
	     		" AND NRO_CMD=decode("  + string(ll_cmd) + " , 0, NRO_CMD,"  + string(ll_cmd) + ") " + &
	  			" AND NRO_SECTOR=decode(" + string(ll_sector) + " , 0, NRO_SECTOR," + string(ll_sector) + ")" 
				  
if cbx_filtrar_alcances.checked = true then				  
		ls_sql_statement= ls_sql_statement + " AND NVL(GI_AVISOS_INSTALACION.CO_ALCANCE,0) IN (" + is_alcances + ")" 
end if

if cbx_filtrar_fechas.checked = true then				
		ls_sql_statement= ls_sql_statement + " AND GI_AVISOS_INSTALACION.F_ALTA >= TO_DATE('" + ids_f_desde + "','DD/MM/YYYY HH24:MI:SS') " + &
		"	 AND GI_AVISOS_INSTALACION.F_ALTA <= TO_DATE('" + ids_f_hasta + "','DD/MM/YYYY HH24:MI:SS') "
end if	

//GNU 13-4-2007. Mejora 1/465491
IF cbx_numero.checked= true then
	IF em_desde.text="" then
		ls_sql_statement += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_hasta.text
	ELSEIF em_hasta.text="" then
		ls_sql_statement += " and GI_AVISOS_INSTALACION.NRO_AVISO=" + em_desde.text
	ELSE
		ls_sql_statement += " and GI_AVISOS_INSTALACION.NRO_AVISO>=" + em_desde.text + &
						 " and GI_AVISOS_INSTALACION.NRO_AVISO<=" + em_hasta.text
	END IF
END IF
// FIN GNU

//JHE SFP DEO12-160 23/10/2012

IF cbx_filtrar_activos.checked= true THEN
		ll_tipo_aviso = dw_avisos_activos.GetitemNumber(1,"tip_aviso")
		
		ls_sql_statement += " AND GI_AVISOS_INSTALACION.TIPO_AVISO="+string(ll_tipo_aviso)
END IF
//JHE SFP DEO12-160 23/10/2012


ls_sql_statement= ls_sql_statement + &
				" GROUP BY GI_AVISOS_INSTALACION.NRO_INSTALACION, " + &   
				" GI_AVISOS_INSTALACION.TIPO_INSTALACION " //, GI_AVISOS_INSTALACION.NRO_INST_PADRE" 
				
if ii_tipo_acceso = 1 OR fg_verifica_parametro("AMBITO GESTION AVISOS") then // Filtra por CMD
	ls_sql_statement=	 ls_sql_statement + ", GI_AVISOS_INSTALACION.CLASE_AVISO " 
end if

PREPARE SQLSA FROM :ls_sql_statement;

FOR ll_conta=1 to 5
	
	CHOOSE CASE ll_conta
		
		CASE 1
			li_clase_aviso = fgci_clase_avi_calidad //DBE 29/03/2000 13:05
			ll_tipo =  fgcdec_aviso_de_calidad 
			li_item=f_icono_arbol(ll_tipo)
			is_nom_instalacion="AVISOS DE CALIDAD"
			W_BARRA.uo_barra.barra.f_amplia(10)
		CASE 2
			li_clase_aviso = fgci_clase_avi_alum_publ //DBE 29/03/2000 13:05
			ll_tipo = fgcdec_aviso_alumbrado_publico 
			li_item=f_icono_arbol(ll_tipo)
// Modificado por Sgo. Mejora Moldavia. 18/05/2005.
//			is_nom_instalacion="ALUMBRADO PUBLICO"
			If gi_pais = 8 Then
				is_nom_instalacion="ROTURAS DE CONDUCTORES"
			elseif gi_pais = 7 then
				is_nom_instalacion="MANTENIMIENTO"
			Else
				is_nom_instalacion="ALUMBRADO PUBLICO"
			End If
// Fin. Sgo.
			W_BARRA.uo_barra.barra.f_amplia(20)
		case 3 
			li_clase_aviso = fgci_clase_avi_ayuda //DBE 29/03/2000 13:05
			ll_tipo = fgcdec_aviso_de_ayuda
			li_item=f_icono_arbol(ll_tipo)
			is_nom_instalacion="AYUDA"
			W_BARRA.uo_barra.barra.f_amplia(40)
		case 4
			li_clase_aviso = fgci_clase_avi_normal //DBE 29/03/2000 13:05
			ll_tipo = fgcdec_aviso_sin_alimentacion
			li_item=f_icono_arbol(ll_tipo)
			is_nom_instalacion="SIN ALIMENTACION"
			W_BARRA.uo_barra.barra.f_amplia(60)
		case 5
			li_clase_aviso = fgci_clase_avi_normal //DBE 29/03/2000 13:05
			ll_tipo = fgcdec_aviso_con_alimentacion
			li_item=f_icono_arbol(ll_tipo)
			is_nom_instalacion="CON ALIMENTACION"
			W_BARRA.uo_barra.barra.f_amplia(80)

	END CHOOSE

	OPEN DYNAMIC avisos_total using :ll_tipo, :li_clase_aviso ;
	
	FETCH avisos_total 
	INTO :ii_cant_av_zona,   
		  :il_nro_instal,
		  :ii_tipo_instalacion,
		  :ldt_f_actual ;

	if sqlca.sqlcode=100 then
		lb_datos=false
		ii_cant_av_zona=0   
		il_nro_instal=ll_tipo
		ii_co_nivel_orig=0
		ii_cant_av_zona=0
		ii_cant_cli_imp=0
		ii_cant_av_pel=0
	end if	
	
	CLOSE avisos_total;
	
	ll_donde_coloco = tv_1.insertitemfirst &
					(0, is_nom_instalacion + space(1) + " (" + string(ii_cant_av_zona) + ")", li_item  )
  
//  	treeviewitem ltw_tree
//	  
//	tv_1.GetItem ( ll_donde_coloco, ltw_tree)
//	
//	ltw_tree.Label = ltw_tree.Label + " - " + string(ll_donde_coloco)
//
//	tv_1.setitem (ll_donde_coloco,ltw_tree)
//
// Este codigo es para pruebas y es para que incluya el handle en el $$HEX1$$e100$$ENDHEX$$rbol de avisos. FDO
	
	dw_lista_instal.insertrow(0)
	dw_lista_instal.setitem(LL_CONTA,"manejador",ll_donde_coloco)
	dw_lista_instal.setitem(LL_CONTA, "nro_inst_padre",0)
	dw_lista_instal.setitem(LL_CONTA, "nro_instalacion", ll_tipo)
	dw_lista_instal.setitem(LL_CONTA, "tip_instal", ii_tipo_instalacion)
	dw_lista_instal.setitem(LL_CONTA, "nom_instalacion", is_nom_instalacion)	
	
	if ii_tipo_acceso= 1 then
		dw_lista_instal.setitem(LL_CONTA, "nro_centro", gi_nro_centro)
		dw_lista_instal.setitem(LL_CONTA, "nro_cmd", gi_nro_cmd)
		dw_lista_instal.setitem(LL_CONTA, "nro_mesa", gi_nro_puesto)	
	End If
	
	dw_lista_instal.setitem(LL_CONTA, "cant_avisos", ii_cant_av_zona)
	dw_lista_instal.setitem(LL_CONTA, "f_actual", ldt_f_actual)
	dw_lista_instal.setitem(LL_CONTA, "clase_aviso", li_clase_aviso) //DBE 29/03/2000 13:12
	
   if (ll_conta=5 or ll_conta=1) and lb_datos=true then	
		
		dw_lista_instal.setitem(LL_CONTA, "expandido", 0)
	else
		dw_lista_instal.setitem(LL_CONTA, "expandido", 1)
	end if
	
	lb_datos=true
	
next

ib_hay_avisos=false
for ll_conta=1 to dw_lista_instal.RowCount() 
	if dw_lista_instal.getitemnumber(ll_conta,"cant_avisos") > 0 then 
		ib_hay_avisos=true
	end if
next

this.SelectItem(il_handle) //DBE 14/03/2000
end event

event rightclicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//										
// Funcion/Evento: rightclicked
// 
// Objetivo: Despliega el men$$HEX2$$fa002000$$ENDHEX$$con el bt$$HEX1$$f300$$ENDHEX$$n derecho en el $$HEX1$$e100$$ENDHEX$$rbol
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/97    FDO
//  03/03/2001 FDO   Actualizaci$$HEX1$$f300$$ENDHEX$$n versi$$HEX1$$f300$$ENDHEX$$n
//  04/11/2003 FDO   Instalaciones Digitalizadas.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_fila_1,ll_nro_ot,ll_nro_INST, ll_nro_inc,ll_array[],il_nro_linea, ll_valor = 0
datetime ld_date,ldt_f_actual
string ls_dir, ls_duplicador, ls_nombre_calle, ls_incid,ls_aux
int li_num_puerta, li_tension, indice, li_par,li_result_func,li_abrir,li_permito = 0
boolean lb_sigo=true

if ib_recupero = false then return 1

int li_nivel_limitado 

treeviewitem le_elemento

IF handle <> il_handle then return

IF This.Getitem(handle, le_elemento) <> -1 THEN
	This.Event Clicked(handle)
	This.Event Selectionchanged(il_handle,handle)
	ii_tipo_instalacion = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "tip_instal")
END IF

if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_C_INC_SUM','ACC_CONSULTA') = 1 then
	RETURN
END IF

// si entro por una de las carpetas principales se sale

if II_CLICKED_ROW <= 5 then 
	return  
end if 
choose case il_nro_instal
	case fgcdec_aviso_de_calidad_sin_alim ,fgcdec_aviso_de_calidad_con_alim 
		return
end choose

choose case  ii_clase_aviso 
	case  fgci_clase_avi_calidad
		li_nivel_limitado=5
	case else
		li_nivel_limitado=4
end choose

if ii_tipo_instalacion = fgci_tipo_acometida then
	return
end if

setpointer(hourglass!)

// Si se entr$$HEX2$$f3002000$$ENDHEX$$con "Consulta" deshabilito el 'rbuttondown'.

// Chequeo lo que debo o no debo habilitar segun el perfil del usuario de entrada.

if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_C_INC_SUM','ACC_MANTEN') = 1 then

	m_btder_gestion_avisos lm_gestion_avi
	u_ot_1002_nu_generico luo_ot_1002_nu_generico 
			
	ii_op = 0
			
	lm_gestion_avi = CREATE m_btder_gestion_avisos
			
	if ii_clase_aviso = 3 then
		m_btder_gestion_avisos.m_opciones.m_asignarbrigada.Enabled = False
	end if
		
	// revisar tensiom	
	SELECT TENSION
	INTO :li_tension
	FROM SGD_INSTALACION
	WHERE NRO_INSTALACION = :il_nro_instal
		AND BDI_JOB = 0;
				
	//Si existe operaciones solo se puede crear incidencias en el nivel de tensi$$HEX1$$f300$$ENDHEX$$n que no exista digit. gr$$HEX1$$e100$$ENDHEX$$fica.

	IF gb_operaciones = true AND ii_clase_aviso <> fgci_clase_avi_calidad  AND gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_M_OPER','ACC_MANTEN') = 1 then
						
		// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	
			
		li_abrir = 1 // Esto significa que no se podr$$HEX2$$e1002000$$ENDHEX$$crear una inc. nueva
			
		IF gb_operaciones_inst = true then
			
			ll_array[2] = il_nro_instal
			
			li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],ii_tipo_instalacion)
			
			IF li_permito = 0 or li_permito = -1 then // li_permito = 1 significa que la instalacion y todos sus hijos estan digitalizados
			
				m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = true
				m_btder_gestion_avisos.m_opciones.m_crearincidencia.text = "Crear Incidencia SGI"
				
				m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = false
				m_btder_gestion_avisos.m_opciones.m_mostrarlnea.visible = false
				m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.visible = false
				
				li_abrir = 0 // Esto significa que se podr$$HEX2$$e1002000$$ENDHEX$$crear una inc. nueva excepto si li_permito es -1 
							  //  en cuyo caso devuelvo mensaje de error pero habilito opci$$HEX1$$f300$$ENDHEX$$n
			ELSE
				
				IF ii_ind_inc = 1 and li_permito = 1 then
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = true
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.text = "Consultar Incidencia"
				ELSEif li_permito = 2 then
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = true
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.text = "Crear Incidencia SGI"
				ELSE
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = false
				END IF
						
				// servicios operacion	
				IF ii_tipo_instalacion = fgci_tipo_salida_mt then
					m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.text = "Mostrar en Simplificado"
					m_btder_gestion_avisos.m_opciones.m_mostrarlnea.text = "Mostrar L$$HEX1$$ed00$$ENDHEX$$nea en Operaci$$HEX1$$f300$$ENDHEX$$n"
					m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.text = "Maniobrar L$$HEX1$$ed00$$ENDHEX$$nea en Operaci$$HEX1$$f300$$ENDHEX$$n"
				ELSE
					// servicios operacion	
					IF ii_tipo_instalacion <> fgci_tipo_subestacion and ii_tipo_instalacion <> fgci_tipo_centro_reflexion then
						m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.text = "Mostrar en Simplificado"
					end if
					m_btder_gestion_avisos.m_opciones.m_mostrarlnea.text = "Mostrar Instalaci$$HEX1$$f300$$ENDHEX$$n en Operaci$$HEX1$$f300$$ENDHEX$$n"
					m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.text = "Maniobrar Instalaci$$HEX1$$f300$$ENDHEX$$n en Operaci$$HEX1$$f300$$ENDHEX$$n"
				END IF
				
				// servicios operacion				
				IF ii_tipo_instalacion <> fgci_tipo_subestacion and ii_tipo_instalacion <> fgci_tipo_centro_reflexion then 
					m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = true
				else
					m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = false
				end if
				
				m_btder_gestion_avisos.m_opciones.m_mostrarlnea.visible = true
				m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.visible = true
				
			END IF
			
		ELSE // si no esta el parametro de la validaci$$HEX1$$f300$$ENDHEX$$n por instalacion
			
			IF gb_operaciones = true AND ii_clase_aviso <> fgci_clase_avi_calidad &
											 AND li_tension <= gi_tension_nivel_min &
											 AND li_tension >= gi_tension_nivel_max & 
											 AND gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_M_OPER','ACC_MANTEN') = 1 then
							
				// si se cumple esto podre mandar la linea a operaci$$HEX1$$f300$$ENDHEX$$n ya sea en modo consulta o en mantenimiento
				
				li_abrir = 1 // Esto significa que no se podr$$HEX2$$e1002000$$ENDHEX$$crear una inc. nueva
				
				IF ii_tipo_instalacion = fgci_tipo_ct and gi_tension_nivel_min = fgci_media_tension then
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = true
					li_abrir = 0 // Esto significa que se podr$$HEX2$$e1002000$$ENDHEX$$crear una inc. nueva
				ELSE
					IF ii_ind_inc = 1 then
						m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = true
						m_btder_gestion_avisos.m_opciones.m_crearincidencia.text = "Consultar Incidencia"
					ELSE
						m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = false
					END IF
				END IF
				
				IF ii_tipo_instalacion = fgci_tipo_salida_mt then
					m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.text = "Mostrar en Simplificado"
					m_btder_gestion_avisos.m_opciones.m_mostrarlnea.text = "Mostrar L$$HEX1$$ed00$$ENDHEX$$nea en Operaci$$HEX1$$f300$$ENDHEX$$n"
					m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.text = "Maniobrar L$$HEX1$$ed00$$ENDHEX$$nea en Operaci$$HEX1$$f300$$ENDHEX$$n"
				ELSE
					IF ii_tipo_instalacion <> fgci_tipo_subestacion then
						m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.text = "Mostrar en Simplificado"
					end if
					m_btder_gestion_avisos.m_opciones.m_mostrarlnea.text = "Mostrar Instalaci$$HEX1$$f300$$ENDHEX$$n en Operaci$$HEX1$$f300$$ENDHEX$$n"
					m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.text = "Maniobrar Instalaci$$HEX1$$f300$$ENDHEX$$n en Operaci$$HEX1$$f300$$ENDHEX$$n"
				END IF
				
				IF ii_tipo_instalacion <> fgci_tipo_subestacion then
						m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = true
				else
						m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = false
				end if
				
				m_btder_gestion_avisos.m_opciones.m_mostrarlnea.visible = true
				m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.visible = true
				
			ELSE			
				
				IF 	gb_operaciones = true & 
					AND ii_clase_aviso = fgci_clase_avi_calidad &
					AND gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_M_OPER','ACC_MANTEN') = 1 &
					AND li_tension >= gi_tension_nivel_min &
					AND li_tension <= gi_tension_nivel_max then
							
					m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = false
					m_btder_gestion_avisos.m_opciones.m_mostrarlnea.visible = true
					m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.visible = false
				ELSE
					m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = false
					m_btder_gestion_avisos.m_opciones.m_mostrarlnea.visible = false
					m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.visible = false
					
				END IF
				
				IF ii_tipo_instalacion = fgci_tipo_acometida then
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = false
				ELSE
					m_btder_gestion_avisos.m_opciones.m_crearincidencia.visible = true
				END IF
				
				li_abrir = 0 // Esto significa que se podr$$HEX2$$e1002000$$ENDHEX$$crear una inc. nueva						
			
			end if
		
		end if
	
	else

		m_btder_gestion_avisos.m_opciones.m_mostrarensimplificado.visible = false
		m_btder_gestion_avisos.m_opciones.m_mostrarlnea.visible = false
		m_btder_gestion_avisos.m_opciones.m_maniobrarlnea.visible = false
		
	end if
	
	if dw_lista_avisos.RowCount() = 0 THEN
		return
	END IF

	lm_gestion_avi.m_opciones.PopMenu(PointerX(), PointerY()+400)

	ii_op = gu_comunic.is_comunic.intval9 
		
	// Si se clicke$$HEX2$$f3002000$$ENDHEX$$una fila v$$HEX1$$e100$$ENDHEX$$lida proceso
	IF ii_clicked_row > 0 THEN

		fgnu_resetear_s_comunicaciones(gu_comunic)

		CHOOSE CASE ii_op
			CASE 1

				// Asignacion de Brigada a la instalacion

				// GSE  16/01/2001
				// Recupero para que niveles de tension tiene permiso el usuario
				ls_incid  = gu_perfiles.of_nivel_tension('GAV_C_INC_SUM')
				
				// Compruebo si mi usuario tiene permisos para el nivel de tension 
				// del aviso seleccionado
				for indice = 1 to len(ls_incid)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_incid,indice,1)
						if ls_aux <> ',' and lb_sigo = true then
							if integer(ls_aux) = ii_nivel_tension or ls_aux = '0' then
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
				
				// Comprueba que la fila pulsada no corresponda con un Aviso de Calidad.
				
				if ii_clase_aviso = 2 then
					return
				end if
				
				SetPointer(HourGlass!)
	
				fgnu_resetear_s_comunicaciones(gu_comunic1)
		
				// Se crea el objeto con el que se va a recibir la estructura
				// de la ventana que se llama (la de Asignacion de brigada)
				
			
				// Se carga la estructura con los valores para la
				// llamada a la ventana Asignacion de brigada
			
				gu_comunic1.is_comunic.programa_llamante = "w_1105_avi_instal"
				
				ll_nro_ot=dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_ot")
				
				gu_comunic1.is_comunic.datval1 = fw_o_f_primer_aviso()
				
				IF ll_nro_ot <>  0  then
					
					// Esto significa que existe una incidencia para esta instalaci$$HEX1$$f300$$ENDHEX$$n luego vamos a tener
					// dos opciones 1. Generar una nueva incidencia para la misma instalaci$$HEX1$$f300$$ENDHEX$$n y la opcion 2.
					// Abrir alguna de las incidencias existentes para esta instalaci$$HEX1$$f300$$ENDHEX$$n.
					// Para ello abrimos la ventana de selecci$$HEX1$$f300$$ENDHEX$$n de las incidencias.
					
					gu_comunic.is_comunic.intval1= 2 
					
					gu_comunic.is_comunic.longval1=  il_nro_instal
					
					gu_comunic.is_comunic.strval1 = dw_lista_instal.GetItemstring(ii_clicked_row,"nom_instalacion")	
					gu_comunic.is_comunic.programa_llamante= "w_1105_avisos_con_alim"
					gu_comunic.is_comunic.accion_llamada = "Alta"
					gu_comunic.is_comunic.intval3 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_centro")
					gu_comunic.is_comunic.intval4 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_cmd")
					gu_comunic.is_comunic.intval5 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_mesa")
					
					Open(w_1106_selec_incid)

					

				ELSE 
					gu_comunic1.is_comunic.accion_llamada = "Alta"
					gu_comunic1.is_comunic.decval1 = il_nro_instal 		
					gu_comunic1.is_comunic.intval3 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_centro")
					gu_comunic1.is_comunic.intval4 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_cmd")
					gu_comunic1.is_comunic.intval5 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_mesa")
					
					/* INICIO.TDA EDM-12 02/10/2017 */
					this.enabled = FALSE
					/* FIN.TDA EDM-12 02/10/2017 */
					OPEN(w_6201_asignacion_de_brigada)

				END IF
											
				gnu_u_transaction.uf_commit()
				
			CASE 2

				fgnu_resetear_s_comunicaciones(gu_comunic)

				IF ii_co_nivel_orig >= fg_nivel_max_cambio_inst THEN
		
					ldt_f_actual=dw_lista_instal.object.f_actual[ii_clicked_row]
					
					// Se crea el objeto con el que se va a recibir la estructura
					// de la ventana que se llama (la de Cambio de alimentacion)
			
					// Se carga la estructura con los valores para la
					// llamada a una ventana
					
					gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim_a"
					gu_comunic.is_comunic.accion_llamada = 'Seleccion'
					
					gu_comunic.is_comunic.intval1 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_centro")
					gu_comunic.is_comunic.intval2 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_cmd")
					gu_comunic.is_comunic.intval3 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_mesa")
				
					// Va a permitir traer las instalaciones para el centro
					// y cmd dado ( sin considerar la mesa)
					gu_comunic.is_comunic.intval4 = 2
					
					gu_comunic.is_comunic.intval5 = dw_lista_instal.GetItemNumber(ii_clicked_row, "tip_instal")
					gu_comunic.is_comunic.strval1 = "dw_lista_instal"
					gu_comunic.is_comunic.programa_retorno = ' '

					Open(w_2120_identificacion_instalacion)
					long a = 1
					a = 2
		
				ELSE
					gnv_msg.f_mensaje("AA04","","",OK!)

				END IF
			
			CASE 3

				// Recupero para que niveles de tension tiene permiso el usuario
				ls_incid  = gu_perfiles.of_nivel_tension('GAV_C_INC_SUM')
				
				// Compruebo si mi usuario tiene permisos para el nivel de tension 
				// del aviso seleccionado
				for indice = 1 to len(ls_incid)
					li_par =  mod (indice,2)
					IF li_par <> 0 then
						ls_aux = mid(ls_incid,indice,1)
						if ls_aux <> ',' and lb_sigo = true then
							if integer(ls_aux) = ii_nivel_tension or ls_aux = '0' then
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

				// Si la variable li_permito est$$HEX2$$e1002000$$ENDHEX$$a -1 significa que no se ha podido verificar si la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n o no por lo que saco mensaje y retorno
				
				If li_permito = -1 then
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",gu_rf.is_mensaje,information!,ok!)
					return 
				end if		

				
				SetPointer(HourGlass!)
				fgnu_resetear_s_comunicaciones(gu_comunic)
				
				// preguntamos que tipo de ot tiene el registro

				gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim"
				gu_comunic.is_comunic.decval1 = il_nro_instal 			
				gu_comunic.is_comunic.intval6 = ii_co_nivel_orig 		
				gu_comunic.is_comunic.intval7 = dw_lista_instal.GetItemNumber(ii_clicked_row,"tip_instal")	
				gu_comunic.is_comunic.intval3 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_centro")
				gu_comunic.is_comunic.intval4 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_cmd")
				gu_comunic.is_comunic.intval5 = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_mesa")
				gu_comunic.is_comunic.longval4 = dw_lista_instal.GetItemNumber(ii_clicked_row,"nro_ot")	
				gu_comunic.is_comunic.strval1 = dw_lista_instal.GetItemstring(ii_clicked_row,"nom_instalacion")	
				gu_comunic.is_comunic.intval10 = li_abrir
				i_tipo_inc=1						

				// Se crea el objeto con el que se va a recibir la estructura
				// de la ventana que se llama (la de creaci$$HEX1$$f300$$ENDHEX$$n de Incidencia)

				ld_date = fgnu_fecha_actual()

				For ll_fila_1 = 1 To dw_lista_avisos.RowCount() 
					If ld_date > dw_lista_avisos.getitemdatetime(ll_fila_1,"f_alta") Then
						If	Not gb_inc_antig Or &
							( gb_inc_antig And ( dw_lista_avisos.GetItemNumber(ll_fila_1, "c_dias_antig") < gi_dias_antiguedad Or gi_dias_antiguedad = 0 )) Then
							ld_date = dw_lista_avisos.GetItemDateTime(ll_fila_1,"f_alta")
						End If
					End If
				Next
				//*******************************************
				//**  OSGI 2001.2  	03/09/2002				 **
				//**  Jair Padilla / Soluziona PANAMA  	 **
				//**  INC - VALIDAR QUE EXISTAN REGISTROS  **
				//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
				//*******************************************
				SELECT "SGD_INSTALACION"."NUM_PUERTA",   
						 "SGD_INSTALACION"."DUPLICADOR",   
						 "CALLEJERO"."NOM_CALLE"  
				INTO	:li_num_puerta,   
						:ls_duplicador,   
						:ls_nombre_calle  
				FROM "SGD_INSTALACION",   
						 "CALLEJERO"  
				WHERE ( ( "SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_instal ) AND  
						( "SGD_INSTALACION"."COD_CALLE" = "CALLEJERO"."COD_CALLE" (+)) )   ;
						
				ls_dir= ls_nombre_calle + " " + string(li_num_puerta) + "-" + ls_duplicador
				gu_comunic.is_comunic.strval1 = is_nom_instalacion
				gu_comunic.is_comunic.datval1 = ld_date
				gu_comunic.is_comunic.strval2 = ls_dir
									
				IF gb_red_trifasica THEN
					gu_comunic.is_comunic.strval3 = gs_fase_a + gs_fase_b + gs_fase_c
				ELSE
					gu_comunic.is_comunic.strval3 = dw_lista_instal.GetItemString(ii_clicked_row,"fase") 
				END IF
				
				// Si es un aviso de calidad entro en incidencias con la variable intval8

				if ii_clase_aviso = 3 then
					gu_comunic.is_comunic.intval8 = 3
				else
					gu_comunic.is_comunic.intval8 = 1
				end if
			
				gu_comunic.is_comunic.longval1=  il_nro_instal
			
				if ii_ind_inc > 0  then
					
					// Esto significa que existe una incidencia para esta instalaci$$HEX1$$f300$$ENDHEX$$n luego vamos a tener
					// dos opciones 1. Generar una nueva incidencia para la misma instalaci$$HEX1$$f300$$ENDHEX$$n y la opcion 2.
					// Abrir alguna de las incidencias existentes para esta instalaci$$HEX1$$f300$$ENDHEX$$n.
					// Para ello abrimos la ventana de selecci$$HEX1$$f300$$ENDHEX$$n de las incidencias.
					
					gu_comunic.is_comunic.intval1= 1 
					
					//gu_comunic.is_comunic.longval1=  il_nro_instal
					
					//SFP-DEO13-000000223 JHE 20/03/2012
					//Se evalua si la instalacion no tiene una incidencia activa por un usuario 
					//se cambia el indicatio para que se active y esta instalacion no puede ser
					//seleccionada por otro usuario para generar una nueva incidencia.
					if fw_incidencia_activa(il_nro_instal,2,parent,ii_tipo_instalacion) = 2 then
						SetPointer(Arrow!)
						return
					end if
					//SFP-DEO13-000000223 JHE FIN					
					// Abro la ventana para apertura de incidencias.
					
					Open(w_1106_selec_incid)
					
					ll_valor = Message.DoubleParm	
					
					if ll_valor = 0  and isnull(gu_comunic.is_comunic.intval1) then				
						//SFP-DEO13-000000223 JHE 20/03/2012
						//Se evalua si la instalacion al entrar a la ventana no se hizo ninguna accion 
						//se cambia el indicatio para que no se active y esta instalacion puede ser
						//seleccionada por otro usuario para generar una nueva incidencia.
						if fw_incidencia_activa(il_nro_instal,1,parent,ii_tipo_instalacion) = 2 then
							SetPointer(Arrow!)
							return
						end if
						//SFP-DEO13-000000223 JHE FIN					
				   end if
					
					return
					
				else
					//*******************************************
					//**  OSGI 2001.2  	12/09/2002				 **
					//**  Jair Padilla / Soluziona PANAMA  	 **
					//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
					//*******************************************
					If il_nro_instal > 0 Then
						If m_btder_gestion_avisos.m_opciones.m_crearincidencia.Visible = True Then
							If IsNull(fg_valida_fecha_max_inc(DateTime(Date(''), Time('')), il_nro_instal, ii_clase_aviso)) And ii_ind_inc <> 1 Then
								MessageBox("Aviso", "Ning$$HEX1$$fa00$$ENDHEX$$n aviso cumple la condici$$HEX1$$f300$$ENDHEX$$n de antig$$HEX1$$fc00$$ENDHEX$$edad para crear una incidencia a este nivel.  D$$HEX1$$ed00$$ENDHEX$$as permitidos: " + String(gi_dias_antiguedad) )

								SetPointer(Arrow!)
								Return
							End If
						End If
					End If
					//*******************************************
					//**  OSGI 2001.2  	12/09/2002				 **
					//**  Jair Padilla / Soluziona PANAMA  	 **
					//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
					//*******************************************

					// entra por alta

					gu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion"
					is_ult_llamada="ALTA"
					
				End if
				
				// Si llega hasta aqu$$HEX2$$ed002000$$ENDHEX$$se va a bloquear la INSTALACION 
			   
				//SFP-DEO13-000000223 JHE 20/03/2012
				//Se evalua si la instalacion no tiene una incidencia activa por un usuario 
				//se cambia el indicatio para que se active y esta instalacion no puede ser
				//seleccionada por otro usuario para generar una nueva incidencia.
			   if fw_incidencia_activa(il_nro_instal,2,parent,ii_tipo_instalacion) = 2 then
					SetPointer(Arrow!)
					return
				end if
				//SFP-DEO13-000000223 JHE FIN
				
				if isnull(gu_comunic.is_comunic.longval3) then 
					IF gu_comunic.is_comunic.longval4 > 0 THEN
						gu_comunic.is_comunic.intval1 = 2 
						Open(w_1106_selec_incid)
					END IF
				   IF gu_control_v_incidencias.of_abre_ventana(-1,-1,w_operaciones,3) < 1 THEN
						// La incidencia ya est$$HEX2$$e1002000$$ENDHEX$$abierta en un modo distinto al que queremos.
						// Luego no se podr$$HEX2$$e1002000$$ENDHEX$$abrir la incidencia. Se desbloquea la instalaci$$HEX1$$f300$$ENDHEX$$n 
					END IF
					
				else
					
					
					IF gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,3) < 1 THEN
							// La incidencia ya est$$HEX2$$e1002000$$ENDHEX$$abierta en un modo distinto al que queremos.
							// Luego no se podr$$HEX2$$e1002000$$ENDHEX$$abrir la incidencia. Se desbloquea la instalaci$$HEX1$$f300$$ENDHEX$$n 
					END IF
					
				end if

			CASE 4
				
				// Si la variable li_permito est$$HEX2$$e1002000$$ENDHEX$$a -1 significa que no se ha podido verificar si la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n o no por lo que saco mensaje y retorno
				
				If li_permito = -1 then
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",gu_rf.is_mensaje,information!,ok!)
					return 
				end if		
				
				// servicios operacion	
				if ii_tipo_instalacion = fgci_tipo_salida_mt then
					// Maniobrar la l$$HEX1$$ed00$$ENDHEX$$nea
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_maniobrar_linea(il_nro_instal)
					gu_operacionSgi.of_maniobrar_linea(il_nro_instal)
					
				elseif ii_tipo_instalacion = fgci_tipo_ct then
					// servicios operacion	
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_maniobrar_linea(il_nro_instal_padre)
					gu_operacionSgi.of_maniobrar_linea(il_nro_instal_padre)

				elseif ii_tipo_instalacion = fgci_tipo_transformador then
				
					SELECT DISTINCT(NRO_INST_PADRE) 
					INTO :IL_NRO_LINEA
					FROM GI_AVISOS_INSTALACION 
					WHERE 	NRO_INSTALACION = :il_nro_instal_padre and rownum < 2;
						
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_localizar_simplificado(il_nro_linea,il_nro_instal_padre)
					gu_operacionSgi.of_localizar_simplificado(il_nro_linea,il_nro_instal_padre)

				else
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_maniobrar_instalacion(il_nro_instal)
					gu_operacionSgi.of_maniobrar_instalacion(il_nro_instal)
				end if
				
			CASE 5
				
				// Si la variable li_permito est$$HEX2$$e1002000$$ENDHEX$$a -1 significa que no se ha podido verificar si la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n o no por lo que saco mensaje y retorno
				
				If li_permito = -1 then
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",gu_rf.is_mensaje,information!,ok!)
					return 
				end if		
				
				// Mostrar la l$$HEX1$$ed00$$ENDHEX$$nea
				if ii_tipo_instalacion = fgci_tipo_salida_mt then
					// servicios operacion
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_consultar_linea(il_nro_instal)
					gu_operacionSgi.of_consultar_linea(il_nro_instal)

				elseif ii_tipo_instalacion = fgci_tipo_ct then
					// servicios operacion
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_consultar_linea(il_nro_instal_padre)
					gu_operacionSgi.of_consultar_linea(il_nro_instal_padre)
				elseif ii_tipo_instalacion = fgci_tipo_transformador then
				
					SELECT DISTINCT(NRO_INST_PADRE) 
					INTO :IL_NRO_LINEA
					FROM GI_AVISOS_INSTALACION 
					WHERE 	NRO_INSTALACION = :il_nro_instal_padre and rownum < 2;
						
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_localizar_simplificado(il_nro_linea,il_nro_instal_padre)
					gu_operacionSgi.of_localizar_simplificado(il_nro_linea,il_nro_instal_padre)
				else
					// servicios operacion
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_consultar_instalacion(il_nro_instal)
					gu_operacionSgi.of_consultar_instalacion(il_nro_instal)
				end if
				
				
				CASE 6
				// Si la variable li_permito est$$HEX2$$e1002000$$ENDHEX$$a -1 significa que no se ha podido verificar si la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n o no por lo que saco mensaje y retorno
				
				If li_permito = -1 then
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",gu_rf.is_mensaje,information!,ok!)
					return 
				end if		
				
				// Mostrar la l$$HEX1$$ed00$$ENDHEX$$nea
				// servicios operacion	
				if ii_tipo_instalacion = fgci_tipo_salida_mt then
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_localizar_simplificado(il_nro_instal,0)
					gu_operacionSgi.of_localizar_simplificado(il_nro_instal,0)
				// servicios operacion	
				elseif ii_tipo_instalacion = fgci_tipo_ct then
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_localizar_simplificado(il_nro_instal_padre,il_nro_instal)
					gu_operacionSgi.of_localizar_simplificado(il_nro_instal_padre,il_nro_instal)
				elseif ii_tipo_instalacion = fgci_tipo_transformador then
				
					SELECT DISTINCT(NRO_INST_PADRE) 
					INTO :IL_NRO_LINEA
					FROM GI_AVISOS_INSTALACION 
					WHERE 	NRO_INSTALACION = :il_nro_instal_padre and rownum < 2;
					
					//AHM 22/02/2010 Certificacion windows XP
//					gu_operaciones.of_localizar_simplificado(il_nro_linea,il_nro_instal_padre)
					gu_operacionSgi.of_localizar_simplificado(il_nro_linea,il_nro_instal_padre)
					
				end if	
				
			CASE ELSE
					
					gnu_u_transaction.uf_rollback()
					
			END CHOOSE
			
	END IF

	// Destruyo la instancia del men$$HEX2$$fa002000$$ENDHEX$$creada anteriormente
	DESTROY lm_gestion_avi 

ELSE
	gnv_msg.f_mensaje("AA08","","",OK!)

END IF

end event

event selectionchanged;////////////////////////////////////////////////////////
//										
// Funcion/Evento: selectionchanged
// 
// Objetivo: recoge la fila sobre la que realizamos el click.
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/97    FDO
//
///////////////////////////////////////////////////////

string ls_cadena
LONG LL_CONTA, li_estado_incidencia, ll_nro_insal,li_tip_inc

FOR LL_CONTA=0 TO dw_lista_instal.RowCount()
	dw_lista_instal.selectrow(LL_CONTA,FALSE)
NEXT

ls_cadena= "manejador = " + string(newhandle)
ii_clicked_row = dw_lista_instal.Find(ls_cadena,  &
	0, dw_lista_instal.RowCount( ))
dw_lista_instal.selectrow(long(ii_clicked_row),true)

// Si se clickeo una fila v$$HEX1$$e100$$ENDHEX$$lida proceso

IF ii_clicked_row > 0 THEN
	
	ii_clase_aviso=dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "clase_aviso") //DBE 29/03/2000 13:32 

	//*****************************************************************************************************//
	//  Externalidad:  Visualizacion de Potencia Instalada y cantidad de clientes en Gestion de Avisos     //
	//  Luis Eduardo Ortiz  Abrid/2001                                                                     //
	//*****************************************************************************************************//
	
		ll_nro_insal = dw_lista_instal.GetItemNumber(ii_clicked_row, "nro_instalacion")
		
	//*****************************************************************************************************//
	//  Luis Eduardo Ortiz  Abrid/2001                                                                     //
	//*****************************************************************************************************//
	
	ii_fila = int(newhandle)
	il_nro_instal_padre = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "nro_inst_padre")
	il_nro_instal = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "nro_instalacion")
	ii_tipo_instalacion = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "tip_instal")
	is_nom_instalacion = dw_lista_instal.GETITEMstring(ii_clicked_row, "nom_instalacion")
	il_nro_ot = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "nro_ot")
	ii_cant_av_zona = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "cant_avisos")
	ii_ind_inc = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "ind_incidencia")
	ii_otras_smt = dw_lista_instal.GETITEMNUMBER(ii_clicked_row, "ind_otras_smt")
	gb_indicativos_inst.text = "Indicativos para la inst.: " + 	is_nom_instalacion
	
	if ii_otras_smt > 0 then


		if dw_otras_inst.retrieve(il_nro_instal,il_nro_instal_padre) > 0 and gi_pais <> 8 then
			
			dw_otras_inst.visible=true
			if cbx_filtrar_fechas.checked = true or cbx_filtrar_alcances.checked = true then
				tv_1.height = 748
			else
				tv_1.height = 1016
			end if
				
			st_otras.text =  "Otras SMT para el CT. " + is_nom_instalacion
			st_otras.visible=true
			
			if ib_fijo_rama = true then	
				this.postevent("ue_pos_selection")
				ib_fijo_rama=false
			else
				ib_fijo_rama = true
			end if

		end if
		
	else
		if newhandle<> 0 then
			dw_otras_inst.visible=false
			st_otras.visible=false
			if cbx_filtrar_fechas.checked = true or cbx_filtrar_alcances.checked = true then
				tv_1.height = 1100
			else
				tv_1.height = 1370
			end if
		end if
	end if
			
	if not isnull(il_nro_inc) then
		
		if ii_clase_aviso = 3 then // es de calidad se lo pasamos a la datawindow al hacer el retrieve
			li_tip_inc = 1
		else
			li_tip_inc = 0
		end if
		
		dw_inc_asoc.setredraw(false)
		dw_inc_asoc.retrieve(il_nro_instal,li_tip_inc)
		
		if ii_clase_Aviso=3 then 
			dw_inc_asoc.setfilter("tip_incidencia = 3")
			dw_inc_asoc.filter()
		else
			dw_inc_asoc.setfilter("tip_incidencia <> 3")
			dw_inc_asoc.filter()
		end if
		dw_inc_asoc.setredraw(true)
	end if

	// Lo siguiente esta a$$HEX1$$f100$$ENDHEX$$adido por que window hace lo que le da la gana con los eventos. 
	// Con las teclas de desplazamiento hace una cosa y con el clicked del raton hace hace otra.
	
	IF (KeyDown(KeyTab!) OR KeyDown(KeyEnter!) OR KeyDown(KeyDownArrow!) OR KeyDown(KeyUpArrow!) &
	OR KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!)) THEN
	// GNU 11/01/2007. Mejora 1/311530
//		w_1105_avisos_con_alim.postevent("ue_reseteo")
		Parent.postevent("ue_reseteo")
   // FIN GNU		
	ELSE
		// GNU 11/01/2007. Mejora 1/311530
//		w_1105_avisos_con_alim.triggerevent("ue_reseteo")
		Parent.triggerevent("ue_reseteo")
		// FIN GNU
	end if
	
	IF Not IsValid(This) Then return
	// FDO. Asi son las cosas y as$$HEX2$$ed002000$$ENDHEX$$se las hemos contado...
	
	
//*****************************************************************************************************//
//  Externalidad:  Visualizacion de Potencia Instalada y cantidad de clientes en Gestion de Avisos     //
//  Luis Eduardo Ortiz  Abrid/2001                                                                     //
//*****************************************************************************************************//
		
	IF ll_nro_insal = fgcdec_aviso_alumbrado_publico OR ll_nro_insal = fgcdec_aviso_con_alimentacion &
		OR ll_nro_insal = fgcdec_aviso_de_ayuda OR ll_nro_insal = fgcdec_aviso_de_calidad &
		OR ll_nro_insal = fgcdec_aviso_de_calidad_con_alim OR ll_nro_insal = fgcdec_aviso_de_calidad_sin_alim &
		OR ll_nro_insal = fgcdec_aviso_sin_alimentacion THEN
		st_clientes_pot_t.Text = ""
	Else
		st_clientes_pot_t.Text = 'Clientes: ' + String(dw_lista_instal.GetItemNumber(ii_clicked_row, "clientes"), '##,###,##0') + '   ' + &
										 'Pot. Inst.: ' + String(dw_lista_instal.GetItemNumber(ii_clicked_row, "pot_instalada"), '##,###,###.0')
	End If
	
//*****************************************************************************************************//
//  Luis Eduardo Ortiz  Abrid/2001                                                                     //
//*****************************************************************************************************//


END IF

//ii_clase_aviso=dw_lista_instal.getitemnumber(ll_posicion,'clase_aviso') //DBE 29/03/2000 13:34

if dw_lista_avisos.rowcount()>0 then
	
	il_handle=newhandle

end if
end event

event selectionchanging;call super::selectionchanging;if ib_recupero = false then return 1
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1105_avisos_con_alim
integer width = 987
integer height = 392
integer taborder = 160
boolean bringtotop = true
end type

event itemchanged;call super::itemchanged;long ll_centro, ll_cmd, ll_mesa
string ls_columna

dw_lista_avisos.Reset()
sle_cant_cli_imp.Text = ""
sle_cant_avi_pel.text = ""
dw_inc_asoc.Reset()
fw_habilitar_controles(FALSE)

ls_columna= this.GetColumnName()

CHOOSE CASE ls_columna
	CASE "nro_centro"
		ll_centro= long (this.GetText())
		ll_cmd= GetItemNumber (1,"nro_cmd")
		ll_mesa= GetItemNumber (1,"nro_mesa")
	CASE "nro_cmd"
		ll_centro= GetItemNumber (1,"nro_centro")
		ll_cmd= long (this.GetText())
		ll_mesa= GetItemNumber (1,"nro_mesa")
	CASE "nro_mesa"
		ll_centro= GetItemNumber (1,"nro_centro")
		ll_cmd= GetItemNumber (1,"nro_cmd")
		ll_mesa= long (this.GetText())
END CHOOSE

fn_nombre_ventana(ll_centro, ll_cmd, ll_mesa)



end event

event constructor;call super::constructor;This.visible = fg_verifica_parametro("AMBITO GESTION AVISOS")
end event

type st_inc_sel_2 from multilineedit within w_1105_avisos_con_alim
string tag = " "
boolean visible = false
integer x = 1541
integer y = 60
integer width = 338
integer height = 236
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
boolean vscrollbar = true
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1612
	This.x = 2885
	This.width = 635
END IF
end event

type st_1 from statictext within w_1105_avisos_con_alim
integer x = 27
integer y = 648
integer width = 1559
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 276856960
boolean enabled = false
string text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada"
boolean border = true
long bordercolor = 8421504
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 44
END IF
end event

type gb_incidencias from groupbox within w_1105_avisos_con_alim
boolean visible = false
integer x = 987
integer width = 905
integer height = 312
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Incidencias Seleccionadas"
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1464
	This.x = 1627
	This.width = 1966
END IF
end event

type cbx_filtrar_fechas from checkbox within w_1105_avisos_con_alim
integer x = 64
integer y = 396
integer width = 59
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;// FDO Mejora Pan 221666

if this.checked = true then
	gb_1.visible = true
	gb_1.BringToTop = false
	dw_filtro_fechas.fnu_habi_f_hasta(true)
	dw_filtro_fechas.fnu_habilitar_f_desde(true)
   dw_filtro_fechas.fnu_habi_f_hasta(false)
   dw_filtro_fechas.fnu_habilitar_f_desde(false)
	dw_filtro_fechas.accepttext()
	ids_f_desde = string(dw_filtro_fechas.object.f_desde[1])
	ids_f_hasta = string(dw_filtro_fechas.object.f_hasta[1])
	dw_lista_avisos.Reset()
	sle_cant_cli_imp.Text = ""
	sle_cant_avi_pel.text = ""
	dw_inc_asoc.Reset()
	fw_habilitar_controles(FALSE)
	st_1.y = 648
	st_1.text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada"
	st_clientes_pot_t.y = 668
	tv_1.y = 728
	tv_1.height = 1100
	st_2.y = 648
	p_1.y=656
	dw_lista_avisos.y = 732
	dw_lista_avisos.height = 1096
else
	dw_filtro_fechas.fnu_habi_f_hasta(false)
	dw_filtro_fechas.fnu_habilitar_f_desde(false)
	cbx_filtrar_fechas.visible = true
	// GNU 13-4-2007. Mejora 1/465491
//	if cbx_filtrar_alcances.checked=false then
	if cbx_filtrar_alcances.checked=false &
		and cbx_numero.checked=false &
		and cbx_filtrar_activos.checked=false &
		and cbx_filtrar_fechas.checked=false then
	// FIN GNU
		dw_Alcances.accepttext()
		dw_Alcances.visible=false
		ids_f_desde = "01/01/1900 00:00:00"
		ids_f_hasta = string(fgnu_fecha_actual())
		dw_filtro_fechas.fnu_habi_f_hasta(true)
		dw_filtro_fechas.fnu_habilitar_f_desde(true)
		st_1.y = 384
		st_1.text = "     Filtrar por Fecha de Alta"
		st_clientes_pot_t.y = 396
		tv_1.y = 464
		tv_1.height = 1370
		st_2.y = 384
		p_1.y=392
		dw_lista_avisos.y = 469
		dw_lista_avisos.height = 1364
		gb_1.visible = false
	end if
end if
end event

type cbx_filtrar_alcances from checkbox within w_1105_avisos_con_alim
integer x = 1929
integer y = 312
integer width = 59
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;// FDO Mejora Pan 221666
int li_alcances[],li_conta
ii_alcances = li_alcances
is_alcances = ""

if this.checked = true then
	dw_alcances.enabled=true
	gb_2.visible = true
	for li_conta = 1 to dw_alcances.rowcount()
		if  dw_alcances.object.alcance[li_conta] = 1 then
			ii_alcances[upperbound(ii_alcances[]) + 1] = dw_alcances.object.co_alcance[li_conta]
			if is_alcances = "" then
				is_alcances = string(dw_alcances.object.co_alcance[li_conta])
			else
				is_alcances =  is_alcances  + "," + string(dw_alcances.object.co_alcance[li_conta])
			end if
		end if
	next
	dw_Alcances.accepttext()
	dw_Alcances.visible=true
//	ids_f_desde = string(dw_filtro_fechas.object.f_desde[1])
//	ids_f_hasta = string(dw_filtro_fechas.object.f_hasta[1])
	dw_lista_avisos.Reset()
	sle_cant_cli_imp.Text = ""
	sle_cant_avi_pel.text = ""
	dw_inc_asoc.Reset()
	fw_habilitar_controles(FALSE)
	st_1.y = 648
//	st_1.text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada"
	st_clientes_pot_t.y = 668
	tv_1.y = 728
	tv_1.height = 1100
	st_2.y = 648
	p_1.y=656
	dw_lista_avisos.y = 732
	dw_lista_avisos.height = 1096
else
	dw_alcances.enabled=false
	for li_conta = 1 to dw_alcances.rowcount()
		ii_alcances[upperbound(ii_alcances[]) + 1] = dw_alcances.object.co_alcance[li_conta]
		if is_alcances = "" then
			is_alcances = string(dw_alcances.object.co_alcance[li_conta])
		else
			is_alcances =  is_alcances  + "," + string(dw_alcances.object.co_alcance[li_conta])
		end if
	next

// GNU 13-4-2007. Mejora 1/465491
//	if cbx_filtrar_fechas.checked=false then
	if cbx_filtrar_fechas.checked=false &
		and cbx_numero.checked= false &
		and cbx_filtrar_activos.checked=false Then

// fin GNU
		gb_2.visible = false
		dw_alcances.visible=false
	//	ids_f_desde = "01/01/1900 00:00:00"
	//	ids_f_hasta = string(fgnu_fecha_actual())
	//	dw_filtro_fechas.fnu_habi_f_hasta(true)
	//	dw_filtro_fechas.fnu_habilitar_f_desde(true)
		st_1.y = 384
	//	st_1.text = "     Filtrar por Fecha de Alta"
		st_clientes_pot_t.y = 396
		tv_1.y = 464
		tv_1.height = 1370
		st_2.y = 384
		p_1.y=392
		dw_lista_avisos.y = 469
		dw_lista_avisos.height = 1364
	end if
	//JHE SFP DEO12-160 23/10/2012
	//Se desabilitan los objetos cuando no esta chequeado
	
	If cbx_filtrar_activos.checked=true then
		dw_avisos_activos.visible = true
		gb_5.visible = true
	else
		dw_avisos_activos.visible = false
		gb_5.visible = false		
	End if
	//JHE SFP DEO12-160 FIN
	dw_Alcances.visible=false
	gb_2.visible = false
	
end if
end event

type gb_2 from groupbox within w_1105_avisos_con_alim
boolean visible = false
integer x = 2194
integer y = 384
integer width = 837
integer height = 260
integer taborder = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Alcance del aviso"
boolean righttoleft = true
end type

type dw_filtro_fechas from ue_gen_filtro_fechas_horas within w_1105_avisos_con_alim
integer x = 27
integer y = 452
integer height = 172
integer taborder = 20
end type

event constructor;call super::constructor;// FDO Mejora Pan 221666
this.insertrow(0)
this.f_inicializar_actual()
end event

event itemchanged;call super::itemchanged;// FDO Mejora Pan 221666

this.accepttext()

cbx_filtrar_fechas.checked = true

ids_f_desde = string(this.object.f_desde[1])
ids_f_hasta = string(this.object.f_hasta[1])


dw_lista_avisos.Reset()
sle_cant_cli_imp.Text = ""
sle_cant_avi_pel.text = ""
dw_inc_asoc.Reset()
fw_habilitar_controles(FALSE)

end event

event rbuttondown;call super::rbuttondown;this.postevent(itemchanged!)
end event

type dw_alcances from datawindow within w_1105_avisos_con_alim
event ue_post_itemchanged ( )
boolean visible = false
integer x = 2217
integer y = 448
integer width = 773
integer height = 172
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "ddw_alcance_aviso_selec"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event ue_post_itemchanged();int li_alcances[],li_conta
ii_alcances = li_alcances
int li_estado_check

is_alcances = ""

for li_conta = 1 to this.rowcount()
	li_estado_check = this.object.alcance[li_conta]
	if  li_estado_check = 1 then
		ii_alcances[upperbound(ii_alcances[]) + 1] = this.object.co_alcance[li_conta]
		if is_alcances = "" then
			is_alcances = string(this.object.co_alcance[li_conta])
		else
			is_alcances =  is_alcances  + "," + string(this.object.co_alcance[li_conta])
		end if
	end if
next
end event

event constructor;int li_cant_alcances,li_conta

this.settransobject(sqlca)
li_cant_alcances= this.retrieve()
is_alcances = ""

for li_conta = 1 to li_cant_alcances
	ii_alcances[li_conta] = this.object.co_alcance[li_conta]
	if is_alcances = "" then
		is_alcances = string(this.object.co_alcance[li_conta])
	else
		is_alcances =  is_alcances  + "," + string(this.object.co_alcance[li_conta])
	end if
next

end event

event itemchanged;this.postevent("ue_post_itemchanged")

this.accepttext()

end event

type st_4 from statictext within w_1105_avisos_con_alim
integer x = 2016
integer y = 308
integer width = 745
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Filtrar por Alcance del aviso"
boolean focusrectangle = false
end type

type st_5 from statictext within w_1105_avisos_con_alim
boolean visible = false
integer x = 1221
integer y = 480
integer width = 165
integer height = 64
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type st_6 from statictext within w_1105_avisos_con_alim
boolean visible = false
integer x = 1714
integer y = 480
integer width = 151
integer height = 64
boolean bringtotop = true
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type em_desde from editmask within w_1105_avisos_con_alim
boolean visible = false
integer x = 1385
integer y = 448
integer width = 302
integer height = 92
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#######"
boolean spin = true
double increment = 1
string minmax = "0~~"
end type

event modified;il_nro_aviso_desde= long(em_desde.text)
if il_nro_aviso_hasta= 0 then
	il_nro_aviso_hasta= il_nro_aviso_desde
end if
end event

type cbx_numero from checkbox within w_1105_avisos_con_alim
integer x = 1038
integer y = 308
integer width = 791
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por N$$HEX1$$fa00$$ENDHEX$$mero de Aviso"
end type

event clicked;if this.checked = true then
//	dw_Alcances.accepttext()
//	dw_Alcances.visible=true
	dw_lista_avisos.Reset()
	sle_cant_cli_imp.Text = ""
	sle_cant_avi_pel.text = ""
	dw_inc_asoc.Reset()
	fw_habilitar_controles(FALSE)
	st_1.y = 648
	st_1.text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada"
	st_clientes_pot_t.y = 668
	tv_1.y = 728
	tv_1.height = 1100
	st_2.y = 648
	p_1.y=656
	dw_lista_avisos.y = 732
	dw_lista_avisos.height = 1096
//	gb_2.visible = true
	gb_3.visible= true
	em_desde.visible= true
	em_hasta.visible= true
	st_5.visible= true
	st_6.visible= true
else
	if cbx_filtrar_alcances.checked=false then
		dw_Alcances.accepttext()
		dw_Alcances.visible=false
	end if
	
	if cbx_filtrar_fechas.checked=false and &
		cbx_filtrar_alcances.checked=false then
		st_1.y = 384
		st_1.text = "     Filtrar por Fecha de Alta"
		st_clientes_pot_t.y = 396
		tv_1.y = 464
		tv_1.height = 1370
		st_2.y = 384
		p_1.y=392
		dw_lista_avisos.y = 469
		dw_lista_avisos.height = 1364
	end if
	em_desde.visible= false
	em_hasta.visible= false
	st_5.visible= false
	st_6.visible= false
	gb_3.visible= false
	em_desde.text=""
	em_hasta.text=""	
end if
end event

type mle_1 from multilineedit within w_1105_avisos_con_alim
string tag = " "
boolean visible = false
integer x = 2011
integer y = 60
integer width = 274
integer height = 236
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
boolean vscrollbar = true
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event constructor;IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 1612
	This.x = 2885
	This.width = 635
END IF
end event

type gb_1 from groupbox within w_1105_avisos_con_alim
integer x = 18
integer y = 388
integer width = 1175
integer height = 256
integer taborder = 180
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "    Filtrar por Fecha Alta"
end type

type gb_3 from groupbox within w_1105_avisos_con_alim
boolean visible = false
integer x = 1202
integer y = 388
integer width = 983
integer height = 192
integer taborder = 210
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nro. Aviso"
end type

type gb_4 from groupbox within w_1105_avisos_con_alim
boolean visible = false
integer x = 1893
integer y = 8
integer width = 407
integer height = 304
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "OT~'s"
end type

type p_orden1 from picture within w_1105_avisos_con_alim
boolean visible = false
integer x = 1906
integer y = 60
integer width = 101
integer height = 84
boolean bringtotop = true
string picturename = "ORDTRA.BMP"
boolean focusrectangle = false
end type

event dragdrop;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragDrop
// 
// Objetivo: La OT recibe el aviso que se va a asociar
//	
//
// Responsable: AHM
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 28/09/2009    AHM			  Creaci$$HEX1$$f300$$ENDHEX$$n
// 15/02/2012	  AHM 		  Modificaci$$HEX1$$f300$$ENDHEX$$n     ASUR 1517044
///////////////////////////////////////////////////////
int		li_numeroRegistros		//N$$HEX1$$fa00$$ENDHEX$$mero de registros que hay en la tabla gi_avisos_instalacion
int		li_resultadoBloqueo		//Resultado del bloqueo del aviso
int		li_estadoOt					//Estado de la ot
long		ll_fila						//N$$HEX1$$fa00$$ENDHEX$$mero de fila seleccionada
long		ll_nroAviso					//N$$HEX1$$fa00$$ENDHEX$$mero del aviso que estamos tratando
string	ls_avisosAsociados		//Listado de los avisos que se han asociado a la ot
string 	ls_principio				//Comienzo de la frase de confirmaci$$HEX1$$f300$$ENDHEX$$n de la asociaci$$HEX1$$f300$$ENDHEX$$n
string	ls_final						//Final de la frase de confirmaci$$HEX1$$f300$$ENDHEX$$n de la asociaci$$HEX1$$f300$$ENDHEX$$n
string	ls_select					//Sentencia de seleci$$HEX1$$f300$$ENDHEX$$n del cursor

//LSH INI 06/01/2014 Mejora DEO13-00000994
datetime ls_fecha_primer_aviso	//fecha del primer aviso sociado a la OT
datetime ls_fecha_final_ot			//fecha de finalizacion de la OT
datetime ls_fecha_aviso_nuevo				//fecha del aviso que se quiere asociar
string ls_inst_primer_aviso_ct		//numero instalacion del primer aviso asociado a la OT
string ls_inst_aviso_nuevo_ct			//numero del aviso que se quiere asociar
string ls_inst_primer_aviso_mt		//numero instalacion del primer aviso asociado a la OT
string ls_inst_aviso_nuevo_mt			//numero del aviso que se quiere asociar
integer resp	//respuesta del messagebox
integer li_count_media_t = 1 //LSH ##/##/2014 Mejora DEO13-00000994
//LSH FIN 06/01/2014 Mejora DEO13-00000994

SetPointer(HourGlass!)

//AHM 0/100169930 (16/02/2010)
ls_avisosAsociados = ""

IF il_nroInstalacionOt=0 THEN
	ls_select = "SELECT COUNT(*) " + &
				   " FROM GI_AVISOS_INSTALACION " + &
				   " WHERE NRO_AVISO = ? " + &
				   " AND NRO_INSTALACION IN (SELECT sgd_instalacion.nro_instalacion " + &
				   " FROM sgd_instalacion " + &
				   " START WITH nro_instalacion = (SELECT instalacion_origen " + &
				   " FROM sgd_acometida, gi_avisos, gi_ot " + &
				   " WHERE sgd_acometida.codigo = gi_avisos.nro_instalacion " + &
				   " AND gi_ot.nro_aviso = gi_avisos.nro_aviso " + &
				   " AND gi_ot.nro_ot = " + string(il_nroOt) + &
					" AND sgd_acometida.onis_stat = 0 " + &
					" AND sgd_acometida.onis_ver not like '%.%' )" + &
				   " CONNECT BY PRIOR nro_inst_padre = nro_instalacion) "
ELSE
//	DECLARE lc_instalaciones CURSOR FOR  
	ls_select = "SELECT COUNT(*) " + &
	 				" FROM GI_AVISOS_INSTALACION " + &
					" WHERE NRO_AVISO = ? " + & 
					" AND NRO_INSTALACION = " + string(il_nroInstalacionOt)
END IF

ll_fila = dw_lista_avisos.getselectedrow(ll_fila)


//Procesamiento de los avisos seleccionados
DO WHILE ll_fila > 0
	
	ll_nroAviso = dw_lista_avisos.GetItemNumber(ll_fila,"avisos_nro_aviso")
	
	li_resultadoBloqueo = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_datos_aviso, ll_nroAviso)
	
	IF li_resultadoBloqueo = 0 THEN
		DECLARE lc_instalaciones DYNAMIC CURSOR FOR SQLSA ;
		PREPARE SQLSA FROM :ls_select;
	
		OPEN DYNAMIC lc_instalaciones USING :ll_nroAviso;
		
		FETCH lc_instalaciones INTO :li_numeroRegistros;
			
		IF sqlca.sqlcode = 0 THEN
		
			IF sqlca.sqlcode < 0 THEN
				messageBox ("Error", "No se han podido contabilizar las instalaciones del aviso")
				gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
				dw_lista_avisos.Drag(End!)
				THIS.Border = FALSE
				RETURN
			END IF
			
			IF li_numeroRegistros = 0 THEN
				messageBox("Error", "La instalaci$$HEX1$$f300$$ENDHEX$$n que alimenta al aviso " + string(ll_nroAviso) + " no tiene correspondencia con la instalaci$$HEX1$$f300$$ENDHEX$$n sobre la que recae la ot.")
				gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
				dw_lista_avisos.Drag(End!)
			   THIS.Border = FALSE
				RETURN
			ELSE			
				//LSH INI 06/01/2014 Mejora DEO13-00000994
				//fecha de alta del primer aviso asociado a la OT
				//numero de instalacion del primer aviso asociado a la OT
				
//				SELECT F_ALTA, NRO_INSTALACION 
//				INTO :ls_fecha_primer_aviso, :ls_inst_primer_aviso_mt
//				FROM GI_AVISOS_INSTALACION 
//				WHERE TIPO_INSTALACION = 4 
//				AND NRO_AVISO = (SELECT NRO_AVISO FROM GI_OT WHERE NRO_OT = :il_nroOt);
				SELECT F_ALTA
				INTO :ls_fecha_primer_aviso
				FROM GI_AVISOS
				WHERE NRO_AVISO = (SELECT NRO_AVISO FROM GI_OT WHERE NRO_OT = :il_nroOt);
				
				
				SELECT COUNT(*)
				INTO :li_count_media_t
				FROM GI_AVISOS_INSTALACION 
				WHERE NRO_AVISO = :ll_nroAviso  
				AND NRO_INSTALACION IN (SELECT sgd_instalacion.nro_instalacion 
				FROM sgd_instalacion 
				START WITH nro_instalacion = (SELECT instalacion_origen
				FROM sgd_acometida, gi_avisos, gi_ot 
				WHERE sgd_acometida.codigo = gi_avisos.nro_instalacion 
				AND gi_ot.nro_aviso = gi_avisos.nro_aviso
				AND GI_AVISOS_INSTALACION.tipo_instalacion = 4
				AND gi_ot.nro_ot = :il_nroOt
				AND sgd_acometida.onis_stat = 0
				AND sgd_acometida.onis_ver not like '%.%' )
				CONNECT BY PRIOR nro_inst_padre = nro_instalacion);
			
				
				SELECT NRO_INSTALACION
				INTO :ls_inst_primer_aviso_ct
				FROM GI_AVISOS 
				WHERE NRO_AVISO = (SELECT NRO_AVISO FROM GI_OT WHERE NRO_OT = :il_nroOt);


				//fecha de finalizacion de la OT
				SELECT F_HASTA 
				INTO :ls_fecha_final_ot
				FROM GI_OT 
				WHERE NRO_OT = :il_nroOt;

//				//fecha del aviso que se quiere asociar
//				//numero de instalacion del aviso que se quiere asociar
//				SELECT F_ALTA, NRO_INSTALACION 
//				INTO :ls_fecha_aviso_nuevo, :ls_inst_aviso_nuevo_mt
//				FROM GI_AVISOS_INSTALACION 
//				WHERE TIPO_INSTALACION = 4 AND NRO_AVISO = :ll_nroAviso;		
				
				SELECT F_ALTA, NRO_INSTALACION
				INTO :ls_fecha_aviso_nuevo, :ls_inst_aviso_nuevo_ct
				FROM GI_AVISOS
				WHERE NRO_AVISO = :ll_nroAviso;
				
				//LSH FIN 06/01/2014 Mejora DEO13-00000994
				
			
				SELECT COUNT(*)
				INTO :li_numeroRegistros
				FROM GI_AVISOS_ASOC_OT
				WHERE NRO_OT = :il_nroOt
				AND NRO_AVISO = :ll_nroAviso;
				
				IF (sqlca.sqlcode < 0) THEN
					messagebox("Error","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar asociar el aviso: " + sqlca.sqlerrtext)
					gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
					dw_lista_avisos.Drag(End!)
					THIS.Border = FALSE
					RETURN		
				END IF
				
				IF (li_numeroRegistros > 0) THEN
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El aviso " + string(ll_nroAviso) + " ya est$$HEX2$$e1002000$$ENDHEX$$asociado a la ot")
		//			gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
		//			dw_lista_avisos.Drag(End!)
		//		   THIS.Border = FALSE
		//			RETURN		
				ELSE
				
				
				//LSH INI 06/01/2014 Mejora DEO13-00000994
				//la instalacion del aviso que se va a asociar debe ser 
				//igual a la instalacion del primer aviso
				//IF ls_inst_primer_aviso_mt <> ls_inst_aviso_nuevo_mt THEN
				IF li_count_media_t = 0 THEN
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","El aviso " + string(ll_nroAviso) + " debe pertenecer a la misma instalacion de media tension que el primer aviso", StopSign!)
						gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
						dw_lista_avisos.Drag(End!)
						THIS.Border = FALSE
						RETURN
				END IF
				
				//LSH INI 06/01/2014 Mejora DEO13-00000994
				//la instalacion del aviso que se va a asociar debe ser 
				//igual a la instalacion del primer aviso
				IF ls_inst_primer_aviso_ct <> ls_inst_aviso_nuevo_ct THEN
						resp = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Usted va asociar avisos de diferentes Centros de Transformaci$$HEX1$$f300$$ENDHEX$$n a una OT que no fue creada en esa instalaci$$HEX1$$f300$$ENDHEX$$n. Desea continuar$$HEX1$$bf00$$ENDHEX$$?", Question!, YesNo!)
						IF resp = 2 THEN
							gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
							dw_lista_avisos.Drag(End!)
							THIS.Border = FALSE
							RETURN
						END IF
				END IF
				
				//La fecha del aviso que se quiere asociar deber$$HEX2$$e1002000$$ENDHEX$$ser mayor que la fecha 
				//del primer aviso asociado a la OT  y menor que la fecha de de finalizaci$$HEX1$$f300$$ENDHEX$$n de la OT
				IF ls_fecha_aviso_nuevo < ls_fecha_primer_aviso OR ls_fecha_aviso_nuevo > ls_fecha_final_ot THEN
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de este aviso (" + string(ll_nroAviso) + ") debe estar en el rango del primer aviso de la OT y de la finalizacion de la OT", StopSign!)
						gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
						dw_lista_avisos.Drag(End!)
						THIS.Border = FALSE
						RETURN
				END IF
				//LSH FIN 06/01/2014 Mejora DEO13-00000994
						
						
					INSERT INTO GI_AVISOS_ASOC_OT (USUARIO, F_ACTUAL, PROGRAMA, NRO_OT, NRO_AVISO)
					VALUES (:gs_usuario, SYSDATE, 'iw_asoc_avisos', :il_nroOt, :ll_nroAviso);
				
					IF sqlca.sqlcode <> 0 then
						messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar asociar el aviso: " + sqlca.sqlerrtext)
						gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
						dw_lista_avisos.Drag(End!)
						THIS.Border = FALSE
						RETURN
					END IF
					
					IF	ls_avisosAsociados = "" THEN
						ls_avisosAsociados = string(ll_nroAviso)
						ls_principio = "El aviso "
						ls_final = " ha sido asociado a la ot"
					ELSE
						ls_avisosAsociados += ", " + string(ll_nroAviso)
						ls_principio = "Los avisos "
						ls_final = " han sido asociados a la ot"
					END IF
					
					
				END IF
			END IF
			
			UPDATE gi_avisos SET nro_ot = :il_nroOt WHERE nro_aviso = :ll_nroAviso;
			
			IF sqlca.sqlcode = 0 THEN
				SELECT est_ot
				INTO :li_estadoOt
				FROM gi_ot
				WHERE nro_ot = :il_nroOt;
				
				IF li_estadoOt = 3 AND il_nroInstalacionOt = 0 THEN
					IF NOT iu_avi_2004_pr.uf_finalizarAviso(ll_nroAviso)= 1 THEN
						messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar asociar el aviso: " + sqlca.sqlerrtext)
					ELSE
						gnu_u_transaction.uf_desbloquea_avisos(il_nro_avi,1) //commit
					END IF
				ELSE
					gnu_u_transaction.uf_desbloquea_avisos(il_nro_avi,1) //commit
				END IF
			ELSE
				messagebox("Error","Error en la actualizaci$$HEX1$$f300$$ENDHEX$$n del aviso " + sqlca.sqlerrtext)	
				gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,2) //Rollback
			END IF
			
			CLOSE lc_instalaciones;
	
		ELSE
			messagebox("Error","Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos: " + sqlca.sqlerrtext)
			gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
			dw_lista_avisos.Drag(End!)
			THIS.Border = FALSE
			RETURN
		END IF
	ELSE
		messagebox("Error","Error en el bloqueo del aviso " +  string(ll_nroAviso))
		gnu_u_transaction.uf_desbloquea_avisos( ll_nroAviso,2) //Rollback
	END IF
	ll_fila = dw_lista_avisos.getselectedrow(ll_fila)
LOOP

IF ls_avisosAsociados = "" THEN
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", " No se han asociados avisos a la ot.")
ELSE
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", ls_principio + ls_avisosAsociados + ls_final)
END IF

This.Border = false
dw_lista_avisos.Drag(End!)

parent.triggerevent("ue_refrescar")
end event

type cbx_filtrar_activos from checkbox within w_1105_avisos_con_alim
integer x = 2830
integer y = 308
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Filtrar por Ind. Peligro"
end type

event clicked;//JHE SFP DEO12-160 23/10/2012
//Se agrega nuevas validaciones para la opcion de filtrar por Indicativo de Peligro
string ls_null_st

if this.checked = true then
	dw_lista_avisos.Reset()
	sle_cant_cli_imp.Text = ""
	sle_cant_avi_pel.text = ""
	dw_inc_asoc.Reset()
	fw_habilitar_controles(FALSE)
	st_1.y = 648
	st_1.text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada"
	st_clientes_pot_t.y = 668
	tv_1.y = 728
	tv_1.height = 1100
	st_2.y = 648
	p_1.y=656
	dw_lista_avisos.y = 732
	dw_lista_avisos.height = 1096
	gb_5.visible= true
	dw_avisos_activos.visible = true
	
//	if cbx_filtrar_alcances.checked=true then
//		gb_2.visible= true
//		dw_alcances.visible= true
//	end if
//	
//	if cbx_numero.checked=true then
//		gb_3.visible= true
//		em_desde.visible= true
//		em_hasta.visible= true
//		st_5.visible= true
//		st_6.visible= true		
//	end if
	
else
	if cbx_filtrar_alcances.checked=false then
		dw_Alcances.accepttext()
		dw_Alcances.visible=false
	else
		gb_2.visible= true
		dw_alcances.visible= true
	end if
	
	if cbx_filtrar_fechas.checked=false and &
	   cbx_numero.checked=false and &
		cbx_filtrar_alcances.checked=false and &
		cbx_filtrar_activos.checked= false then
		gb_2.visible= false
		gb_3.visible= false
		gb_5.visible= false
		dw_avisos_activos.visible = false
		em_desde.visible= false
		em_hasta.visible= false
		st_5.visible= false
		st_6.visible= false
		st_1.y = 384
		st_1.text = "     Filtrar por Fecha de Alta"
		st_clientes_pot_t.y = 396
		tv_1.y = 464
		tv_1.height = 1370
		st_2.y = 384
		p_1.y=392
		dw_lista_avisos.y = 469
		dw_lista_avisos.height = 1364
		
	end if
	
	
   if cbx_numero.checked=true then
		gb_3.visible= true
		em_desde.visible= true
		em_hasta.visible= true
		st_5.visible= true
		st_6.visible= true		
	else	
		em_desde.visible= false
		em_hasta.visible= false
		st_5.visible= false
		st_6.visible= false
		gb_3.visible= false
		gb_5.visible= false
		em_desde.text=""
		em_hasta.text=""	
		dw_avisos_activos.visible = false
   end if
	gb_5.visible= false
	dw_avisos_activos.visible = false	
	
	dw_lista_avisos.SetFilter("")
	dw_lista_avisos.Filter()
	ib_recupero = true
	parent.triggerevent("ue_refrescar",0,1)
end if
//JHE SFP DEO12-160 FIN
end event

type dw_avisos_activos from datawindow within w_1105_avisos_con_alim
boolean visible = false
integer x = 3077
integer y = 480
integer width = 485
integer height = 112
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_avi_2003_avisos_activos"
boolean border = false
boolean livescroll = true
end type

type gb_5 from groupbox within w_1105_avisos_con_alim
boolean visible = false
integer x = 3040
integer y = 384
integer width = 535
integer height = 260
integer taborder = 230
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aviso Peligro"
end type

type em_hasta from editmask within w_1105_avisos_con_alim
boolean visible = false
integer x = 1861
integer y = 448
integer width = 302
integer height = 92
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#######"
boolean spin = true
double increment = 1
string minmax = "0~~"
end type

event modified;il_nro_aviso_hasta= long(em_hasta.text)
if il_nro_aviso_desde= 0 then
	il_nro_aviso_desde= il_nro_aviso_hasta
end if
end event

type dw_lista_avisos from u_avi_2001_pr_lista_avisos_guat within w_1105_avisos_con_alim
event ue_click pbm_dwnkey
integer x = 1577
integer y = 724
integer width = 2007
integer height = 1088
integer taborder = 20
boolean bringtotop = true
borderstyle borderstyle = styleraised!
end type

event ue_click;long ll_fila_actual, ll_fila_ultima

long		ll_aux			//Variable de control del bucle que deseleccina las filas

ll_fila_actual = this.getrow()
ll_fila_ultima = this.rowcount()

this.setredraw(false)

IF KeyDown(KeyDownArrow!) AND KeyDown(KeyShift!) THEN
	setpointer(Hourglass!)
	if ll_fila_actual < ll_fila_ultima then
		if this.isselected(ll_fila_actual + 1) =true then
			This.SelectRow(ll_fila_actual, False)
			//AHM (03/01/2008)
//			THIS.setItem(ll_fila_actual, "seleccionado",0)
		else
			This.SelectRow(ll_fila_actual + 1, True)
			//AHM (03/01/2008)
//			THIS.setItem(ll_fila_actual + 1, "seleccionado",1)
		end if
	end if
	this.setrow(ll_fila_actual)
end if


IF KeyDown(KeyUpArrow!) AND KeyDown(KeyShift!) THEN
	setpointer(HourGlass!)
	if ll_fila_actual > 1 then
		if this.isselected(ll_fila_actual - 1) =true then
			This.SelectRow(ll_fila_actual, False)
			//AHM (03/01/2008)
//			THIS.setItem(ll_fila_actual, "seleccionado",0)
		else
			This.SelectRow(ll_fila_actual - 1, True)
			//AHM (03/01/2008)
//			IF ll_fila_actual - 1 = 0 THEN
//				FOR ll_aux= 1 TO THIS.rowCount()
//					THIS.setItem(ll_aux, "seleccionado",0)		
//				NEXT
//			ELSE
//				THIS.setItem(ll_fila_actual - 1, "seleccionado",0)
//			END IF
		end if
	end if
	this.setrow(ll_fila_actual)
end if


IF KeyDown(KeyEnd!) AND KeyDown(KeyShift!) THEN
	setpointer(HourGlass!)
	this.setredraw(false)
	if ll_fila_actual < ll_fila_ultima then
			FOR ll_fila_actual=ll_fila_actual TO ll_fila_ultima + 1 step 1
				This.SelectRow(ll_fila_actual, True)
				//AHM (03/01/2008)
//				THIS.setItem(ll_fila_actual, "seleccionado",1)
			NEXT
			ll_fila_actual = ll_fila_ultima
	end if
	this.setrow(ll_fila_actual)
end if


IF KeyDown(KeyHome!) AND KeyDown(KeyShift!) THEN
	setpointer(HourGlass!)
	this.setredraw(false)
	if ll_fila_actual > 1 then
			FOR ll_fila_actual=ll_fila_actual TO 1 step -1
				This.SelectRow(ll_fila_actual, True)
				//AHM (03/01/2008)
//				THIS.setItem(ll_fila_actual, "seleccionado",1)
			NEXT
			ll_fila_actual = 1
	end if
	this.setrow(ll_fila_actual)
end if

ii_clicked_row=ll_fila_actual

this.setredraw(true)
setpointer(Arrow!)
end event

event clicked;call super::clicked;////////////////////////////////////////////////////////
//										
// Funcion/Evento: clicked
// 
// Objetivo: Marca/Desmarca la fila sobre la que se produce la acci$$HEX1$$f300$$ENDHEX$$n
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/97    FDO			  Clicked
//
///////////////////////////////////////////////////////

boolean lb_condicion
int li_centro, li_cmd, li_puesto, li_fila
long ll_ot,ll_fila,ll_con_ot,ll_contador
long ll_aux

//***************************************
//**  OSGI 2001.1       19/05/2001                **
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
gl_tipo_aviso = il_nro_instal
//***************************************
//**  OSGI 2001.1       19/05/2001                **
//**  Jair Padilla / Soluziona PANAMA  **
//*************************************** 

this.setredraw(false)

li_fila =Row

IF li_fila > 0 THEN

ib_accion_nueva = true

	li_centro = This.GetItemNumber(li_fila,"nro_zona")
	li_cmd	 = This.GetItemNumber(li_fila,"nro_cmd")
	li_puesto = This.GetItemNumber(li_fila,"nro_sector")
	ii_ind_pel_lista = This.GetItemNumber(li_fila,"avisos_ind_peligro")
 	ii_cli_imp_lista = This.GetItemNumber(li_fila,"ind_cli_imp")
	 
   lb_condicion=false //// DBE 31/03/2000 13:59
	
	if this.getselectedrow(li_fila - 1) = li_fila then
		this.selectrow(li_fila,false)
		//AHM(27/11/2008)
		
		THIS.setItem(li_fila, "seleccionado", 0)
	else
		if KeyDown(KeyControl!) = false then
			//AHM(27/11/2008)
			This.SelectRow(0, False)
			FOR ll_aux= 1 TO rowCount()
				THIS.setItem(ll_aux, "seleccionado",0)				
			NEXT
		end if
		
		if KeyDown(KeyShift!) then
			if row > ii_fila_clickeada	then
				for ll_contador = ii_fila_clickeada to row step 1
					This.SelectRow(ll_contador, True)
					//AHM (03/01/2008)
					THIS.setItem(ll_contador, "seleccionado",1)
				next
			else
				for ll_contador = ii_fila_clickeada to row step - 1
					This.SelectRow(ll_contador, True)
					//AHM (03/01/2008)
					THIS.setItem(ll_contador, "seleccionado",1)
				next
			end if
		else
			This.SelectRow(li_fila, True)
			//AHM (03/01/2008)
			THIS.setItem(li_fila, "seleccionado",1)
			This.SetRow(li_fila)
			this.scrolltorow(li_fila)
		end if
	end if

	ii_fila_clickeada = li_fila
	il_nro_avi = This.GetItemNumber(li_fila, "avisos_nro_aviso")
	idt_f_actual = this.object.f_actual[row]
	ll_ot = this.GetItemNumber(li_fila,"avisos_nro_ot")
	ii_ind_calidad = this.GetItemNumber(li_fila,"ind_calidad")
	
	// Si se entr$$HEX2$$f3002000$$ENDHEX$$con "Consulta" deshabilito el drageo.
	IF is_accion_llamada <> "Consulta" THEN

		// Comprobamos que ninguno de los avisos tenga una OT
		
		ll_fila = this.getselectedrow(0)
		
		do while (ll_fila>0)
			
			ll_con_ot = this.GetItemNumber(ll_fila,"avisos_nro_ot")
			
			if ll_con_ot > 0 then
				ll_ot=ll_con_ot
			end if
		
			ll_fila = this.getselectedrow(ll_fila)
		
		loop
		
		// Si a$$HEX1$$fa00$$ENDHEX$$n no fue seleccionada una incidencia lo deshabilito o el aviso tiene una ot asociada.
// GNU 28-6-2007. Mejora 23 (avisos)		
//		IF (p_inc_sel.Visible = True OR p_inc_sel_2.Visible = True) and (isnull(ll_ot) or ll_ot=0) THEN
	//AHM 29/09/2009 (Mejora 1/468636)
		IF (p_inc_sel.Visible = True OR p_inc_sel_2.Visible = True OR p_orden1.visible = TRUE) THEN		
// FIN GNU
			// Si llega hasta aqu$$HEX2$$ed002000$$ENDHEX$$se va a bloquear la brigada siempre que el registro no cambie
			// y que el aviso no se haya actualizado.
			
			int li_result_func
			
			li_result_func = gnu_u_transaction.uf_bloquea_avisos(idt_f_actual, fgci_bloq_asoc_manual, il_nro_avi)
			
			if li_result_func= -2 then
				parent.triggerevent("ue_refrescar")
				return
			end if
			
			if li_result_func= -54 then
				return
			end if
			
			IF ll_ot <> 0 THEN
			// GNU 29-6-2007. Mejora 23 (avisos)
//			li_result_func=gnu_u_transaction.uf_lock(parent, 'gi_ot', 'nro_ot= ' + string(ll_ot))
			li_result_func=gnu_u_transaction.uf_lock(parent, "GI_OT", "NRO_OT=" + string(ll_ot),fgci_bloqueo_ot,ll_ot)
			IF li_result_func <> 0 THEN
				li_result_func = gnu_u_transaction.uf_desbloquea_avisos(il_nro_avi,1) //commit
				return
			END IF
		END IF
			// FIN GNU
			
			this.selectrow(row,true)
			THIS.setItem(row, "seleccionado",1)
			This.Drag(Begin!)
			
			// Se liber$$HEX1$$f300$$ENDHEX$$
			// GNU 29-6-2007. Mejora 23 (avisos)
			IF ll_ot <> 0 THEN
				gnu_u_transaction.uf_commit( parent, "GI_OT", "NRO_OT=" + STRING(il_nro_ot),fgci_bloqueo_ot,il_nro_ot)
			END IF
			// FIN GNU
			
			li_result_func = gnu_u_transaction.uf_desbloquea_avisos(il_nro_avi,1) //commit
			
			
		END IF
	END IF

//Si existe soporte gr$$HEX1$$e100$$ENDHEX$$fico

	if isvalid(onis) then
		gl_instalacion_afectada = this.getitemnumber(li_fila,"cod_calle")
		ib_calle = true 		
	end if
	this.setredraw(true)
	
ELSE
	
	This.SelectRow(0, False)
	//AHM (03/01/2008)
	FOR ll_aux= 1 TO THIS.rowCount()
		THIS.setItem(ll_aux, "seleccionado",0)		
	NEXT
	This.SetRow(0)
	ii_fila_clickeada = 0
	this.setredraw(true)
	
END IF

ii_fila_avi_clic = ii_fila_clickeada

IF ii_fila_avi_clic = 0 THEN
	FOR ll_aux= 1 TO rowCount()
		THIS.setItem(ll_aux, "seleccionado",0)
	NEXT
END IF
end event

event constructor;call super::constructor;/////////////////////////////////////////////////////////////////////////
//
// Evento:  constructor
//
// Objetivo: 
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        10-1-96   JH
//
/////////////////////////////////////////////////////////////////////////

string ls_syntax, is_modify_ext

IF NOT fg_verifica_parametro("AMBITO GESTION AVISOS") THEN
	This.y = 136
END IF

// Se permite poder seleccionar a mas de una fila por vez 
this.f_seleccionar(2)

//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

If fg_verifica_parametro(Parent.ClassName()) Then
	if gi_pais <> 8 then // En moldavia no aplica
		// NCA-DDAG-1530.13/02/2015.INICIO.Utilizamos el datawindows d_avi_2001_pr_lista_avisos_col_sin_ioper 
		// para cuando no hay conecci$$HEX1$$f300$$ENDHEX$$n con la interfaz con operaciones.
		if gb_operaciones = true then
			this.dataobject='d_avi_2001_pr_lista_avisos_col'
		else
			this.dataobject='d_avi_2001_pr_lista_avisos_col_sin_ioper'
		end if
		//NCA-DDAG-1530.13/02/2015.FIN. 

		//******************************************
		//**  OSGI 2001.2  	28/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  NIVELES GEOGRAFICOS 						**
		//******************************************
		// GNU 17-11-2005 Mejora 1/335502
		if not fg_verifica_parametro ('NIC') then
			dw_lista_avisos.modify ('destroy column nic')
			dw_lista_avisos.modify ('destroy nic_t')
			string ls_select, ls_from, ls_where, ls_dw
			long posicion,longitud_dw, longitud_aux
			ls_dw=dw_lista_avisos.describe("datawindow.table.select")
			posicion= pos(ls_dw, "SUMCON.NIC NIC")
			ls_select=left (ls_dw, posicion - 8)
			longitud_dw=len(ls_dw)
			longitud_aux= posicion + len("SUMCON.NIC NIC")
			ls_dw=right (ls_dw, longitud_dw - longitud_aux)
			posicion= pos (ls_dw, "SUMCON")
			ls_from= left (ls_dw,  posicion - 7)
			longitud_dw=len(ls_dw)
			longitud_aux=posicion + len("SUMCON")
			ls_where=right (ls_dw, longitud_dw - longitud_aux)
			longitud_aux=len(ls_where)
			ls_where=left (ls_where, longitud_aux - len ("AND GI_AVISOS.NIS_RAD = SUMCON.NIS_RAD (+)"))
			ls_dw= ls_select + ls_from + ls_where
			dw_lista_avisos.modify("DataWindow.table.Select=~"" + ls_dw + "~"")
		end if
		
		dw_lista_avisos.is_syntax_orig = dw_lista_avisos.Object.DataWindow.Syntax
			
		//******************************************
		//**  OSGI 2001.2  	28/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  NIVELES GEOGRAFICOS 						**
		//******************************************
		// Este c$$HEX1$$f300$$ENDHEX$$digo se coloco para que los avisos aparecieran ordenados por los campos Provincia
		// y Departamento.	
		if gi_pais = 4 then
			this.SetRedraw(false)
			this.SetSort("f_alta D")
			this.Sort()
			this.SetRedraw(True)
		elseIf fg_verifica_parametro('GEO') Then
			This.SetRedraw(False)
			This.SetSort("gi_avisos_nom_prov A, gi_avisos_nom_depto A, c_concat A")
			This.Sort()
			This.SetRedraw(True)
		else
			This.SetRedraw(False)
			This.SetSort("f_alta D")
			This.Sort()
			This.SetRedraw(True)
		end if
	end if
else 
	if gi_pais <> 8 then	
		IF gi_pais = 4 THEN
			This.SetRedraw(False)
			This.SetSort("f_alta D")
			This.Sort()
			This.SetRedraw(True)
		elseif fg_verifica_parametro('GEO') Then
			This.SetRedraw(False)
			This.SetSort("sector A, cs_direccion A")
			This.Sort()
			This.SetRedraw(True)
		else
			This.SetRedraw(False)
			This.SetSort("f_alta D")
			This.Sort()
			This.SetRedraw(True)
		end if
	end if
end if

// FIN GNU
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

end event

event doubleclicked;call super::doubleclicked;/////////////////////////////////////////////////////////////////////////
//
// Evento:  doubleclicked
//
// Objetivo: Acciones a realizar en caso de seleccionar un aviso.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        10-1-96   JH
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n    29/05/96  HMA
//								 Modificaci$$HEX1$$f300$$ENDHEX$$n    15/09/97  FDO
/////////////////////////////////////////////////////////////////////////

w_1203_inf_aviso lw_ventana // GNU 18/01/2007. Mejora 1/311530

//AHM 14/01/2010 Incidencia 0/100157620
int	li_perfilConsulta			//C$$HEX1$$f300$$ENDHEX$$digo del perfil de consulta


SetPointer(HourGlass!)

//AHM 14/01/2010 Incidencia 0/100157620
//Obtenci$$HEX1$$f300$$ENDHEX$$n del c$$HEX1$$f300$$ENDHEX$$digo del perfil consulta
SELECT codigo
INTO   :li_perfilConsulta
FROM   sgd_valor
WHERE  codif = 'PCO';


// Si se clickeo una fila v$$HEX1$$e100$$ENDHEX$$lida proceso
	
IF ii_fila_clickeada > 0 and ii_fila > 0 THEN
	//AHM 14/01/2010 Incidencia 0/100157620
	//AHM (10/01/2008)
	if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ACCESO','ACC_MANTEN') = 1 OR (gi_perfil = li_perfilConsulta AND gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ACCESO','ACC_CONSULTA') = 1 )THEN

		gu_comunic.is_comunic.programa_llamante = "w_1105_avi"
		IF is_accion_llamada = "Consulta" THEN
			gu_comunic.is_comunic.accion_llamada = 'Consulta'
		ELSE
			gu_comunic.is_comunic.accion_llamada = 'Actualizacion'	
			
			// Si la consulta es por actualizaci$$HEX1$$f300$$ENDHEX$$n significa que se debe bloquear el registro
			
			int li_result_func
	
			//AHM (26/10/2009) Mejora 1/614729
			IF fg_verifica_parametro("DESBLOQUEO DE AVISOS") THEN
				IF gu_perfiles.of_acceso_perfil(gi_perfil,'BAV_CONSULTAR','ACC_CONSULTA') = 1 THEN
					//AHM 14/01/2010 Incidencia 0/100157620
					li_result_func= -54
				ELSE
					li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_datos_aviso, il_nro_avi)
				END IF
			ELSE
				//AHM(08/07/2011) ASUR 1184173
				IF gu_perfiles.of_acceso_perfil(gi_perfil,'CAV_GENERAL','ACC_MANTEN') = 1 THEN
					li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_datos_aviso, il_nro_avi)
				END IF
			END IF
			
			if li_result_func= -2 then
				parent.triggerevent("ue_refrescar")
				return
			end if
			
			if li_result_func= -54 then
				// GNU 14-3-2007. Incidencia 0/493456
				gu_comunic.is_comunic.accion_llamada = 'Consulta'
//				return
				// FIN GNU
			end if
			
		END IF
//	   gu_comunic.is_comunic.accion_llamada = 'Consulta' // Ale
		gu_comunic.is_comunic.longval1 = il_nro_avi
		
		gu_comunic.is_comunic.programa_retorno = ' '
//		gu_comunic.fnu_abrir(w_1203_inf_aviso,"w_1203_inf_aviso",0,1,w_1105_avisos_con_alim,"w_1105_avisos_con_alim")	
		int li_clase_aviso

		SELECT CLASE_AVISO
		INTO :li_clase_aviso
		FROM GI_AVISOS
		WHERE NRO_AVISO = :il_nro_avi;
		//	Open(w_1203_inf_aviso)//// DBE  commentado 31/03/2000 14:51
      	//Openwithparm(w_1203_inf_aviso,dw_lista_instal.getitemnumber(ii_fila,'clase_aviso'))// DBE 31/03/2000 14:51
		
		//Openwithparm(w_1203_inf_aviso,li_clase_aviso)// DBE 31/03/2000 14:51
		// GNU 18/01/2007. Mejora 1/311530
//		OpenSheetwithparm(w_1203_inf_aviso,li_clase_aviso,w_operaciones,8, Layered!)
		
		long ll_aux
		
		FOR ll_aux= 1 TO rowCount()
			THIS.setItem(ll_aux, "seleccionado",0)				
		NEXT
		OpenSheetwithparm(lw_ventana,li_clase_aviso,w_operaciones,8, Layered!)
		
		//AHM (10/05/2011) ASUR 1022795
		//AHM (11/10/2008)
		IF gi_perfil = li_perfilConsulta THEN				//Perfil de consulta
			lw_ventana.fw_bloquearDw()		//Bloquea todos la ventana de avisos para que solo pueda consutar
		END IF
		// Se supone que se liber$$HEX1$$f300$$ENDHEX$$

//		gnu_u_transaction.uf_desbloquea_avisos(il_nro_avi,1) //commit
		// FIN GNU
		//
		
	ELSE
		gnv_msg.f_mensaje("AA08","","",OK!)
	END IF
	
END IF				
	
	
								
end event

event losefocus;call super::losefocus;long		ll_aux			//Variable de control del bucle que deseleccina las filas

ii_fila_clickeada = 0

// GNU 23-4-2007. Incidencia 0/501555
dw_lista_avisos.selectrow(0,false)
// FIN GNU
end event

event rbuttondown;call super::rbuttondown;////////////////////////////////////////////////////////////////////////////////////////////////
// EVENTO: RBTTONDOWN
//  
// Objetivo: al pulsar el boton derecho del 
//mouse se llama al meno rbtd_gestion_avisos2 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
// 09/09/97		FDO			Creacci$$HEX1$$f300$$ENDHEX$$n con reutilizaci$$HEX1$$f300$$ENDHEX$$n de c$$HEX1$$f300$$ENDHEX$$digo.
// 02/06/99		HSE			Anulaci$$HEX1$$f300$$ENDHEX$$n de varios avisos a la vez
// 02/06/2000	FDO			Multiusuario, Validaciones
// 06/02/2001	FDO			Desplegar rama del aviso
// 06/02/2001	FDO			Desplegar rama del aviso
////////////////////////////////////////////////////////////////////////////////////////////////

// Si se entr$$HEX2$$f3002000$$ENDHEX$$con "Consulta" deshabilito el 'rbuttondown'.


DECIMAL ldec_nro_instalacion,ll_nro_incidencia,ll_nro_aviso,ll_nro_ot,ll_nro_ot_asoc,ldc_tension
LONG li_cant_avisos, ll_fila_1, ll_fila_2, ll_fila = 0, ll_reg_sig,ll_nro_acometida = 0
LONG ll_nro_inc_asociada,ll_cant_av_ct //indica el nro de la inc asociada
LONG ll_ind_improc //indica si el aviso es improcedente 
INT li_conta,li_tipo_red,li_result_func,indice, li_par,li_clase_aviso
BOOLEAN lb_aviso_otro_usuario = false,lb_sigo=true
DATETIME ldt_f_actual
STRING ls_mensaje,ls_ci,ls_incid, ls_aux
LONG ll_posicion_busqueda,ll_ct
long ll_handle // GNU 12/01/2007. Mejora 1/311530
long li_nro_ot
long	ll_siguienteFila					//Siguiente fila seleccionada

long		ll_aux			//Variable de control del bucle que deseleccina las filas



parent.enabled=false

ii_seleccionesMenu = 0

if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_C_INC_SUM','ACC_CONSULTA') = 1 then
	parent.enabled=true
	RETURN
END IF

ll_fila_1 = this.getselectedrow(0)
ll_fila_2 = this.getselectedrow(ll_fila_1)

row = ll_fila_1

m_btder_gestion_avisos2 lm_gestion_avi

if row <> 0 then
	idt_f_actual = this.object.f_actual[row]
	il_avis_nro_ins= this.GetItemNumber(row,"nro_instalacion")
	ll_nro_ot_asoc= this.GetItemNumber(row,"avisos_nro_ot")
	li_tipo_red =  this.GetItemNumber(row,"ind_red")
	
	if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_C_INC_SUM','ACC_MANTEN') = 1 or &		
		gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_IMPROC','ACC_MANTEN') = 1 or &
		gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ACCESO','ACC_MANTEN') = 1 then
			
	// Definici$$HEX1$$f300$$ENDHEX$$n de variables
		
	u_ot_1002_nu_generico luo_ot_1002_nu_generico 
	ii_op = 0	
		
	// Si se clickeo una fila v$$HEX1$$e100$$ENDHEX$$lida proceso
	
	IF ii_fila_clickeada > 0 THEN
		
		lm_gestion_avi = CREATE m_btder_gestion_avisos2
			
		// Deshabilito opciones del men$$HEX2$$fa002000$$ENDHEX$$dependiendo
		// del tipo de aviso sobre el que estoy.
		
		// A$$HEX1$$d100$$ENDHEX$$ADIDO POR PACHO PARA LA RAMA GENERICA DE AVISOS DE CALIDAD //
		IF il_nro_instal = fgcdec_aviso_de_calidad then
			IF this.object.nro_instalacion[row] = fgcdec_aviso_de_calidad_sin_alim then
				il_nro_instal =  this.object.nro_instalacion[row]
			ELSE
				il_nro_instal =  fgcdec_aviso_de_calidad_con_alim
			END IF
		END IF
		// FIN DE LA MODIFICACION
		
		IF il_nro_instal <> fgcdec_aviso_sin_alimentacion &
		and il_nro_instal <> fgcdec_aviso_de_calidad_sin_alim  THEN  //DBE 29/03/2000 16:26

			lm_gestion_avi.m_opciones.m_asignaralimentacion.Enabled = False
		
			IF il_nro_instal = fgcdec_aviso_de_ayuda OR il_nro_instal = fgcdec_aviso_alumbrado_publico then
				lm_gestion_avi.m_opciones.m_cambioalimentacion.Enabled = False
			else
				lm_gestion_avi.m_opciones.m_asignarbrigada.Enabled = True				//False
			END IF
		
		ELSE
			lm_gestion_avi.m_opciones.m_asignaralimentacion.Enabled = True
			lm_gestion_avi.m_opciones.m_cambioalimentacion.Enabled  = False
		END IF

		if ll_nro_ot_asoc <> 0 then
			lm_gestion_avi.m_opciones.m_cambioalimentacion.Enabled = False
			lm_gestion_avi.m_opciones.m_asignaralimentacion.Enabled = False

			lm_gestion_avi.m_opciones.m_avisoimprocedente.Enabled = False
		END IF //FDO
		// AQUI
		
		
		select codigo into :ll_nro_acometida from sgd_Acometida where codigo = :il_avis_nro_ins;
		
		IF  li_tipo_red<>1 and (il_nro_instal <> fgcdec_aviso_sin_alimentacion &
							and il_nro_instal <> fgcdec_aviso_de_calidad_sin_alim & 
							and il_nro_instal <> fgcdec_aviso_de_ayuda &
							and il_nro_instal <> fgcdec_aviso_alumbrado_publico)  &
							and gb_operaciones = true &
							and gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_M_OPER','ACC_MANTEN') = 1 &
							and ll_nro_Acometida <> 0  then 
			lm_gestion_avi.m_opciones.m_alimentarconredreal.Enabled = true
		ELSE
			lm_gestion_avi.m_opciones.m_alimentarconredreal.Enabled = False
		end if
		
		if ii_clase_aviso=3 then // chequeo los avisos de calidad

			if  il_nro_instal = fgcdec_aviso_de_calidad_sin_alim  then // permito gestionar el aviso con una inc
				lm_gestion_avi.m_opciones.m_crearincidencia.Enabled = true
				gu_comunic.is_comunic.intval8 = 3
			else
				lm_gestion_avi.m_opciones.m_crearincidencia.Enabled = false
			end if
			lm_gestion_avi.m_opciones.m_asignarbrigada.Enabled = false
		else
			gu_comunic.is_comunic.intval8 = 1
		end if
		
		// Chequeo lo que debo o no debo habilitar segun el perfil del usuario de entrada.
		
		if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_C_INC_SUM','ACC_MANTEN') = 0 then
			lm_gestion_avi.m_opciones.m_asignarbrigada.Enabled = false
			lm_gestion_avi.m_opciones.m_crearincidencia.Enabled = false
		end if



		if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_IMPROC','ACC_MANTEN') = 0 then
			lm_gestion_avi.m_opciones.m_avisoimprocedente.Enabled = False
		end if
		
		if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_ACCESO','ACC_MANTEN') = 0 then
			lm_gestion_avi.m_opciones.m_cambioalimentacion.Enabled = False
			lm_gestion_avi.m_opciones.m_asignaralimentacion.Enabled = False
		end if
			
		if ll_fila_2 > 0 then
			
			// Deshabilito las tres opciones superiores
			//Si hay mas de una instalacion seleccionada
			
			ll_reg_sig = this.getselectedrow(0)
			
			do while (ll_reg_sig <> 0)
				
				ll_nro_ot_asoc= this.GetItemNumber(ll_reg_sig,"avisos_nro_ot")
				
				if ll_nro_ot_asoc <> 0 then
					lm_gestion_avi.m_opciones.m_avisoimprocedente.Enabled = False
				end if
				
				ll_reg_sig = this.getselectedrow(ll_reg_sig)
				
			loop
				
			// SE HABILITA SOLO SI TODOS SON CON RED NORMAL
			
			ll_reg_sig = this.getselectedrow(0)
			

			li_tipo_red = 0
			do while (ll_reg_sig <> 0 and li_tipo_red <> 1)
						
								
				   il_avis_nro_ins= this.GetItemNumber(ll_reg_sig,"nro_instalacion")
					li_tipo_red =  this.GetItemNumber(ll_reg_sig,"ind_red")	
						
					select codigo into :ll_nro_acometida from sgd_Acometida where codigo = :il_avis_nro_ins;
					
					IF  li_tipo_red<>1 and (il_nro_instal <> fgcdec_aviso_sin_alimentacion &
							and il_nro_instal <> fgcdec_aviso_de_calidad_sin_alim & 
							and il_nro_instal <> fgcdec_aviso_de_ayuda &
							and il_nro_instal <> fgcdec_aviso_alumbrado_publico)  &
							and gb_operaciones = true &
							and gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_M_OPER','ACC_MANTEN') = 1 &
							and ll_nro_Acometida <> 0  then 
							
								lm_gestion_avi.m_opciones.m_alimentarconredreal.Enabled = true
							else
								lm_gestion_avi.m_opciones.m_alimentarconredreal.Enabled = False
						end if	
			
				ll_reg_sig = this.getselectedrow(ll_reg_sig)
		
			loop
			
			lm_gestion_avi.m_opciones.m_asignaralimentacion.Enabled = false
			lm_gestion_avi.m_opciones.m_cambioalimentacion.Enabled = false
			lm_gestion_avi.m_opciones.m_crearincidencia.Enabled = false
			lm_gestion_avi.m_opciones.m_asignarbrigada.Enabled = false
	//		lm_gestion_avi.m_opciones.m_alimentarconredreal.Enabled = False
			
		end if

// GNU 11/01/2007. Mejora 1/311530
//		lm_gestion_avi.m_opciones.PopMenu(w_1105_avisos_con_alim.PointerX() + 50, w_1105_avisos_con_alim.PointerY() + 100)
		lm_gestion_avi.m_opciones.PopMenu(Parent.PointerX() + 50, Parent.PointerY() + 100)
// FIN GNU
		
		ii_op = gu_comunic.is_comunic.intval9 		// Respaldo la opcion seleccionada.
						 
		SetPointer(HourGlass!)
		
		// Si llega hasta aqu$$HEX2$$ed002000$$ENDHEX$$se van a bloquear los avisos siempre que el registro no cambie
		// y que el aviso no se haya actualizado. Y siempre que haya escogido una opci$$HEX1$$f300$$ENDHEX$$n de men$$HEX2$$fa002000$$ENDHEX$$v$$HEX1$$e100$$ENDHEX$$lida.
		
			
		CHOOSE CASE ii_op
								
			CASE 1  // Asignar Alimentaci$$HEX1$$f300$$ENDHEX$$n.
				
					li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_asig_alim, il_nro_avi)
				
					if li_result_func= -2 then
						parent.triggerevent("ue_refrescar",0,2)	
						parent.enabled=true
						return
					end if
					
					if li_result_func= -54 then
						parent.enabled=true
						return
					end if

					fgnu_resetear_s_comunicaciones(gu_comunic)
			
					// Se crea el objeto con el que se va a recibir la estructura
					// de la ventana que se llama (la de Asignar de Alimentacion)
					
					// Se carga la estructura con los valores para la
					// llamada a una ventana
					
					gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim_c"
					gu_comunic.is_comunic.accion_llamada = 'Seleccion'
							
					gu_comunic.is_comunic.intval1 = this.GetItemNumber(ii_fila_clickeada, "avisos_nro_centro")
					gu_comunic.is_comunic.intval2 = this.GetItemNumber(ii_fila_clickeada, "avisos_nro_cmd")
					gu_comunic.is_comunic.intval3 = this.GetItemNumber(ii_fila_clickeada, "avisos_nro_mesa")
						
					// Va a permitir traer las instalaciones para el centro
					// y cmd dado ( sin considerar la mesa)
					gu_comunic.is_comunic.intval4 = 2
							
					gu_comunic.is_comunic.intval5 = 2
					gu_comunic.is_comunic.intval6 = 0
					gu_comunic.is_comunic.strval1 = "dw_lista_avisos"
					gu_comunic.is_comunic.programa_retorno = ' '
	
					Open(w_2120_identificacion_instalacion)
					
					gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 1) //Commit
			
			CASE 2 // CAMBIO DE ALIMENTACI$$HEX1$$d300$$ENDHEX$$N DEL AVISO
					
					SELECT "GI_AVISOS"."NRO_INCIDENCIA", "GI_AVISOS"."IND_IMPROCEDENTE" INTO :ll_nro_inc_asociada, :ll_ind_improc
					FROM "GI_AVISOS"
					WHERE "GI_AVISOS"."NRO_AVISO"=:il_nro_avi;
					
					IF ll_nro_inc_asociada=0 and sqlca.sqlcode = 0 and ll_ind_improc = 0 THEN //EL AVISO NO ESTA ASOCIADO A INC. Y NO SALE POR BLOQUEO

						li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_cam_alim, il_nro_avi)
				
						if li_result_func= -2 then
							parent.triggerevent("ue_refrescar",0,2)	
							parent.enabled=true
							return
						end if
						
						if li_result_func= -54 then
							parent.enabled=true
							return
						end if
					
						fgnu_resetear_s_comunicaciones(gu_comunic)
				
						// Se crea el objeto con el que se va a recibir la estructura
						// de la ventana que se llama (la de Cambio de alimentacion)
						
						// Se carga la estructura con los valores para la
						// llamada a una ventana
					
						gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim_b"
						gu_comunic.is_comunic.accion_llamada = 'Seleccion'
								
						gu_comunic.is_comunic.intval1 = this.GetItemNumber (ii_fila_clickeada, "avisos_nro_centro")
						gu_comunic.is_comunic.intval2 = this.GetItemNumber (ii_fila_clickeada, "avisos_nro_cmd")
						gu_comunic.is_comunic.intval3 = this.GetItemNumber (ii_fila_clickeada, "avisos_nro_mesa")
							
						// Va a permitir traer las instalaciones para el centro
						// y cmd dado ( sin considerar la mesa)
						gu_comunic.is_comunic.intval4 = 2
								
						gu_comunic.is_comunic.intval5 = 2
						gu_comunic.is_comunic.intval6 = 0
						gu_comunic.is_comunic.strval1 = "dw_lista_avisos"
						gu_comunic.is_comunic.programa_retorno = ' '
						Open(w_2120_identificacion_instalacion)
	
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 1) //Commit
	
					END IF
				
			CASE 3 
				
				// Incidencia de suministro

				// Se crea el objeto con el que se va a recibir la estructura
				// de la ventana que se llama (la de Creaci$$HEX1$$f300$$ENDHEX$$n de Incidencia)
				
				// Se carga la estructura con los valores para la
				// llamada a una ventana
				
				li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_inc_suministro, il_nro_avi)
		
				if li_result_func= -2 then
					parent.triggerevent("ue_refrescar",0,2)	
					parent.enabled=true
					return
				end if
				
				if li_result_func= -54 then
					parent.enabled=true
					return
				end if
				
				Select nro_incidencia into :ll_nro_incidencia from gi_avisos where nro_aviso=: il_nro_avi;
				
				IF sqlca.sqlcode<>0 THEN  // EL AVISO ESTA SIENDO MODIFICADO
						gnv_msg.f_mensaje("AA12","","",OK!)
						DESTROY lm_gestion_avi 
						parent.enabled=true
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
						return 
				Else 
					if ll_nro_incidencia>0 THEN   // TIENE UNA INCIDENCIA ASOCIADA
						gnv_msg.f_mensaje("AA13","","",OK!)
						DESTROY lm_gestion_avi
						parent.enabled=true
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
						return
					END IF

					//*******************************************
					//**  OSGI 2001.2  	03/09/2002				 **
					//**  Jair Padilla / Soluziona PANAMA  	 **
					//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
					//*******************************************
					If ii_fila_clickeada > 0 Then
						If IsNull(fg_valida_fecha_max_inc(This.GetItemDateTime(ii_fila_clickeada, "f_alta"), 0, ii_clase_aviso)) Then
							MessageBox("Aviso", "Este aviso no cumple la condici$$HEX1$$f300$$ENDHEX$$n de antig$$HEX1$$fc00$$ENDHEX$$edad para crear una incidencia.  D$$HEX1$$ed00$$ENDHEX$$as permitidos: " + String(gi_dias_antiguedad) )

							SetPointer(Arrow!)
							Destroy lm_gestion_avi
							Parent.Enabled=True
							gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
							Return
						End If

						If fg_valida_ot_antig(This.GetItemNumber(ii_fila_clickeada, "avisos_nro_ot"), 2) > 0 Then
							SetPointer(Arrow!)
							Destroy lm_gestion_avi
							Parent.Enabled=True
							gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
							Return
						End If
					End If
					//*******************************************
					//**  OSGI 2001.2  	03/09/2002				 **
					//**  Jair Padilla / Soluziona PANAMA  	 **
					//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
					//*******************************************
				END IF
				
				gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim"
				gu_comunic.is_comunic.accion_llamada = "Alta_nivel_suministro"
				gu_comunic.is_comunic.decval1 = il_avis_nro_ins		
				
				IF gu_comunic.is_comunic.decval1 = fgcdec_aviso_alumbrado_publico THEN
					gu_comunic.is_comunic.intval10 = 1
				ELSE
					gu_comunic.is_comunic.intval10 = 0
				END IF

				IF gu_comunic.is_comunic.decval1 = fgcdec_aviso_sin_alimentacion OR& 
					gu_comunic.is_comunic.decval1 = fgcdec_aviso_alumbrado_publico THEN
					gu_comunic.is_comunic.decval1 = 0
				END IF

				gu_comunic.is_comunic.longval2 = il_nro_avi
	
				gu_comunic.is_comunic.intval1 = dw_lista_instal.GetItemNumber	(dw_lista_instal.GetRow(),"tip_instal")

				gu_comunic.is_comunic.intval3 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_centro")								
				gu_comunic.is_comunic.intval4 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_cmd")
				gu_comunic.is_comunic.intval5 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_mesa")
				gu_comunic.is_comunic.intval6 = This.GetItemNumber(ii_fila_clickeada, "ind_cli_imp")
				gu_comunic.is_comunic.intval7 = This.GetItemNumber(ii_fila_clickeada, "avisos_ind_peligro")
				gu_comunic.is_comunic.longval3 = This.GetItemNumber(ii_fila_clickeada, "avisos_nis_rad")				
				gu_comunic.is_comunic.strval2 = This.GetItemString(ii_fila_clickeada, "c_concat")
				gu_comunic.is_comunic.longval4 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_ot")				
				gu_comunic.is_comunic.datval1  = This.GetItemDateTime(ii_fila_clickeada, "f_alta")
				gu_comunic.is_comunic.datval2  = This.GetItemDateTime(ii_fila_clickeada, "f_alta")
				
				i_tipo_inc=2
				
         		if gu_control_v_incidencias.of_abre_ventana(-1,-1,w_operaciones,3)<1 then 
					 gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
				end if
 
			CASE 4
				
				// Asignaci$$HEX1$$f300$$ENDHEX$$n de OT
				
				li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_ot_suministro, il_nro_avi)
		
				if li_result_func= -2 then
					parent.triggerevent("ue_refrescar",0,2)	
					parent.enabled=true
					return
				end if
				
				if li_result_func= -54 then
					parent.enabled=true
					return
				end if
				
				fgnu_resetear_s_comunicaciones(gu_comunic1)
		
				// Se crea el objeto con el que se va a recibir la estructura
				// de la ventana que se llama (la de Asignacion de Brigada)
								
				// Se carga la estructura con los valores para la
				// llamada a la ventana Asignacion de brigada
				
				
				gu_comunic1.is_comunic.programa_llamante = "w_1105_avi_aviso"
												
				IF this.GetItemNumber(ii_fila_clickeada, "avisos_nro_ot") <>  0 THEN
					gu_comunic1.is_comunic.accion_llamada = "Modificacion"
					gu_comunic1.is_comunic.longval2 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_ot") 
					gu_comunic1.is_comunic.longval3 = il_nro_avi
					// GNU 20-6-2007. Mejora 1/339347
					IF fg_verifica_parametro ('ambito ot') THEN
						gu_comunic1.is_comunic.intval3 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_centro")								
						gu_comunic1.is_comunic.intval4 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_cmd")
						gu_comunic1.is_comunic.intval5 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_mesa")
					ELSE
						gu_comunic1.is_comunic.intval3 = gi_nro_centro
						gu_comunic1.is_comunic.intval4 = gi_nro_cmd
						gu_comunic1.is_comunic.intval5 = gi_nro_puesto
					END IF
					// FIN GNU

					// GNU 4-7-2007. Mejora 23 (avisos)
					li_nro_ot = this.GetItemNumber(ii_fila_clickeada, "avisos_nro_ot")
					IF ll_nro_ot<> 0 then
						li_result_func=gnu_u_transaction.uf_lock(parent, "GI_OT", "NRO_OT=" + string(li_nro_ot),fgci_bloqueo_ot,li_nro_ot)						
						if li_result_func<> 0 THEN
							gu_comunic1.is_comunic.accion_llamada = "Consulta"
						end if
					end if
					// FIN GNU

				ELSE 
					gu_comunic1.is_comunic.accion_llamada = "Alta"
					gu_comunic1.is_comunic.longval3 = il_nro_avi
					// GNU 20-6-2007. Mejora 1/339347
					IF fg_verifica_parametro ('ambito ot') THEN
						gu_comunic1.is_comunic.intval3 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_centro")								
						gu_comunic1.is_comunic.intval4 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_cmd")
						gu_comunic1.is_comunic.intval5 = This.GetItemNumber(ii_fila_clickeada, "avisos_nro_mesa")
					ELSE
						gu_comunic1.is_comunic.intval3 = gi_nro_centro
						gu_comunic1.is_comunic.intval4 = gi_nro_cmd
						gu_comunic1.is_comunic.intval5 = gi_nro_puesto
					END IF
					// FIN GNU				
				END IF
				
				gu_comunic1.is_comunic.datval1 = This.GetItemDateTime(ii_fila_clickeada,"f_alta")
				
				long ll_nro_avi 
				ll_nro_avi = il_nro_avi
				
				Open(w_6201_asignacion_de_brigada)
				
				IF ll_nro_ot<> 0 then
					gnu_u_transaction.uf_commit( parent, "GI_OT", "NRO_OT=" + STRING(li_nro_ot),fgci_bloqueo_ot,li_nro_ot)
				END IF
				gnu_u_transaction.uf_desbloquea_avisos( ll_nro_avi, 1) //Commit
	
			CASE 5 
			
				//AHM (03/02/2011) ASUR 1022795
				IF ii_seleccionesMenu = 0 THEN
					ii_seleccionesMenu++
					
					//Pone al aviso como improcedente
									
					//Recuperar las filas marcadas para procesarlas one by one
	
					ib_obs_general = false
	
					// TDA.INI.EDM-3.19052017
					//ll_fila = this.getselectedrow(ll_fila)
					//ll_fila = Find("seleccionado = 1", 1, RowCount())
					// TDA.FIN.EDM-3.19052017
					
					string ls_cadena
					
					if Find("seleccionado = 1", ll_fila + 1, RowCount()) > 0 then
						ls_cadena = "CA03"
					else
						ls_cadena = "CA02"
					end if
	
					IF gnv_msg.f_mensaje(ls_cadena,"","",OKCancel!) = 1 then
						// TDA.INI.EDM-3.19052017
						long ll_find = 1, ll_end
						ll_end = RowCount()
						ll_find = Find("seleccionado = 1", ll_find, ll_end)
						ii_nro_avisos = 0
						do while ll_find > 0
							ii_nro_avisos++
							
							ll_find++
							if ll_find > ll_end then exit
							ll_find = Find("seleccionado = 1", ll_find, ll_end)
							
						loop
						
						open(w_1105_motivo_improc)
						if ib_cancelado = false then
							ll_handle = handle(parent)
							openwithparm(w_1105_obs_improc,string(ll_handle))
						end if
						
						if ib_cancelado = true then
							ib_cancelado = false
							DESTROY lm_gestion_avi
							parent.triggerevent("ue_refrescar",0,2)				
							parent.enabled=true
							ii_seleccionesMenu = 0
							return
						end if
						
						ll_fila = 1
						ll_fila = Find("seleccionado = 1", ll_fila, ll_end)
						ii_nro_avisos = 0
						// TDA.FIN.EDM-3.19052017
						
						do while ll_fila > 0
							il_nro_avi = This.GetItemNumber(ll_fila, "avisos_nro_aviso")
							il_avis_nro_ins= this.GetItemNumber(ll_fila,"nro_instalacion")			
							idt_f_actual = this.GetItemdatetime(ll_fila,"f_actual")	
							li_clase_aviso= this.GetItemNumber(ll_fila,"clase_aviso")	
	
							IF gb_operaciones =  true and li_clase_aviso = fgci_clase_avi_normal then
						
								SELECT "GI_AVISOS_INSTALACION"."NRO_INSTALACION"  
									INTO :ll_ct
									FROM "GI_AVISOS_INSTALACION"  
									WHERE ( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :il_nro_avi ) AND  
												( "GI_AVISOS_INSTALACION"."TIPO_INSTALACION" = :fgci_tipo_ct )   ;
						
								IF sqlca.SqlCode < 0 THEN
									messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el CT del aviso.")
								END IF
							
								SELECT COUNT(distinct NRO_AVISO)  
									INTO :ll_cant_av_ct
									FROM "GI_AVISOS_INSTALACION"  
									WHERE ( "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :ll_ct and  "GI_AVISOS_INSTALACION"."EST_AVISO" = :fgci_aviso_pendiente  ) ;
												
								IF sqlca.SqlCode < 0 THEN
									messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pueden contabilizar los avisos")
								END IF				
													
								IF ll_cant_av_ct = 1 then // Como vamos a dar de baja el $$HEX1$$fa00$$ENDHEX$$nico aviso del ct, generamos una tool de baja de aviso.
													
	//								gu_rf_servidor_operacion.of_tool_aviso(ll_ct,fgnu_fecha_actual(),0,ls_mensaje,gi_ci_ct)
												
									IF ls_mensaje <> "" then
										messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al dar de alta el tool: " + ls_mensaje,information!,ok!)
									END IF	
													
								END IF
							
							END IF
							
							ii_nro_avisos ++
							
							//AHM(20/04/2011) ASUR 1022795
							li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_av_improc,il_nro_avi )
			
							if li_result_func= -2 then
								parent.triggerevent("ue_refrescar",0,2)	
								
								// GNU 11/01/2007. Mejora 1/311530
	//							IF NOT IsValid(w_1105_avisos_con_alim) THEN Return
								IF NOT IsValid(parent) THEN Return
								// FIN GNU
								parent.enabled=true
								return
							end if
							
							if li_result_func= -54 then
								parent.enabled=true
								return
							end if
										
							SELECT "GI_AVISOS"."NRO_INCIDENCIA" INTO :ll_nro_inc_asociada
							FROM "GI_AVISOS"
							WHERE "GI_AVISOS"."NRO_AVISO"=:il_nro_avi;
											
							IF ll_nro_inc_asociada=0 and sqlca.sqlcode = 0 THEN //EL AVISO NO ESTA ASOCIADO A INC. Y NO SALE POR BLOQUEO	
							// TDA.INI.EDM-3.19052017
//									if ib_obs_general = false then
//										// GNU 12/01/2007. Mejora 1/311530
//										ll_handle=handle(parent)
//										openwithparm(w_1105_obs_improc,string(ll_handle))
//	//									open(w_1105_obs_improc)
//										// FIN GNU
//									end if
									
									//if ib_cancelado = true then
									//	ib_cancelado = false
									//	DESTROY lm_gestion_avi
									//	gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
									//	parent.triggerevent("ue_refrescar",0,2)				
									//	parent.enabled=true
									//	//AHM(23/09/2011) 1242870
									//	ii_seleccionesMenu = 0
									//	return
									//end if
									// TDA.FIN.EDM-3.19052017
									if len(is_obs) = 0 OR is_mot_improc = 0 OR is_mot_improc_subtipo = 0 then
										//ll_fila = this.getselectedrow(ll_fila)
										
										ll_fila = Find("seleccionado = 1", ll_fila + 1, ll_end)
										gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
										continue
									end if
									
									ldt_f_actual = fgnu_fecha_actual()
									
									UPDATE "GI_AVISOS"  
									SET "IND_IMPROCEDENTE" = 1,
										 "OBS_IMPROC" = :is_obs,
										 "EST_AVISO" = 6,
										 "COD_MOTIVO_IMPROC" = :is_mot_improc,
										 "COD_MOTIVO_IMPROC_SUBTIPO" = :is_mot_improc_subtipo,
										 "F_ACTUAL" = :ldt_f_actual,
										 "FECHA_RES" = :ldt_f_actual,
										 "USUARIO" = :gs_usuario
									WHERE "GI_AVISOS"."NRO_AVISO" = :il_nro_avi;
				  
									IF SQLCA.SQLCODE = -1 THEN	
											gnv_msg.f_mensaje("EA24","","",OK!)
											//messagebox ("Aviso","No se pudieron actualizar las tablas")
											gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
											parent.enabled=true
											RETURN
									END IF
					
									DELETE FROM "GI_AVISOS_INSTALACION" WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :il_nro_avi;
				  
									IF SQLCA.SQLCODE = -1 THEN	
											gnv_msg.f_mensaje("EA24","","",OK!)
											//messagebox ("Aviso","No se pudieron actualizar las tablas")
											gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
											parent.enabled=true
											RETURN
									END IF
																																																											
								ELSE //EL AVISO ESTA ASOCIADO A INC.
									
										lb_aviso_otro_usuario = true
	
								END IF
								
								//ll_fila  = this.getselectedrow(ll_fila)
								
								ll_fila = Find("seleccionado = 1", ll_fila+1, ll_end)
	
								gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 1) //Commit
						
						loop
					else
						gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi, 2) //Rollback
					end if
					
					parent.triggerevent("ue_refrescar",0,2)						
			
					//AHM (03/02/2011) ASUR 1022795
					ii_seleccionesMenu = 0
				END IF
				
			CASE 6
				
					This.SelectRow(0, True)
					//AHM (03/01/2008)
					FOR ll_aux= 1 TO THIS.rowCount()
						THIS.setItem(ll_aux, "seleccionado",1)		
					NEXT
					ii_ind_pel_lista = This.GetItemNumber(this.rowcount(),"avisos_ind_peligro")
					ii_cli_imp_lista = This.GetItemNumber(this.rowcount(),"ind_cli_imp")
					ii_fila_clickeada = this.rowcount()
					idt_f_actual = this.object.f_actual[this.rowcount()]
				
			CASE 7
				
					this.SelectRow(0, false)
					//AHM (03/01/2008)
					FOR ll_aux= 1 TO THIS.rowCount()
						THIS.setItem(ll_aux, "seleccionado",0)		
					NEXT
					ii_fila_clickeada = 0		
	
			CASE 8
				
					fw_desplegar_rama()
					// GNU 11/01/2007. Mejora 1/311530
//					IF NOT IsValid(w_1105_avisos_con_alim) THEN return
					IF NOT IsValid(parent) THEN return
					// FIN GNU
	
					tv_1.expandall(tv_1.finditem(roottreeitem!,0))
					
			CASE 9  // ALIMENTAR CON RED REAL
				
				
				
					ll_fila = this.getselectedrow(0)
				
				
					SetPointer(HourGlass!)				
					do while ll_fila > 0
						
						
						il_nro_avi = This.GetItemNumber(ll_fila, "avisos_nro_aviso")
						il_avis_nro_ins= this.GetItemNumber(ll_fila,"nro_instalacion")
						idt_f_actual = this.GetItemdatetime(ll_fila,"f_actual")	
					
					li_result_func = gnu_u_transaction.uf_bloquea_avisos( idt_f_actual, fgci_bloq_al_red_real, il_nro_avi)
		
					if li_result_func= -2 then
						parent.enabled=true
						return
					end if
					
					if li_result_func= -54 then
					 	parent.enabled=true
						return
					end if
					
					u_avi_1002_nu_generico u_avi_1002_nu
					
					u_avi_1002_nu = CREATE u_avi_1002_nu_generico 	
					
					u_avi_1002_nu.fnu_cambiar_alim_avi(dw_lista_avisos,&
																	ll_fila,&
																	dw_lista_instal,&
																	dw_lista_avisos.GetItemNumber(ll_fila,"avisos_nro_aviso"),&					
																	dw_lista_avisos.GetItemNumber(ll_fila,"nro_instalacion"),&				
																	dw_lista_avisos.GetItemNumber(ll_fila,"avisos_nis_rad"),&
																	dw_lista_avisos.GetItemNumber(ll_fila,"avisos_nro_ot"),&
																	dw_lista_avisos.GetItemDateTime(ll_fila,"f_alta"), &
																	dw_lista_avisos.GetItemstring(ll_fila,"fase"),2, &
																	dw_lista_avisos.GetItemNumber(ll_fila,"ind_aviso_consulta")) //LSH ** DDAG-255 ** 30/01/2014 ** Se agrego el 0 como nuevo argumento de la funcion 
					

					DESTROY u_avi_1002_nu
					
					gnu_u_transaction.uf_desbloquea_avisos( il_nro_avi,1) //Commit
					
					ll_fila = this.getselectedrow(ll_fila)
					
					loop
					
					parent.triggerevent("ue_refrescar",0,2)								
					SetPointer(Arrow!)
		END CHOOSE
		
			// Destruyo la instancia del men$$HEX2$$fa002000$$ENDHEX$$creada anteriormente
			DESTROY lm_gestion_avi 
	
		END IF
	ELSE
		gnv_msg.f_mensaje("AA08","","",OK!)
	END IF

ELSE
	
	if this.rowcount() >0 then
		
		if gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_IMPROC','ACC_MANTEN') = 1 then
			
			lm_gestion_avi = CREATE m_btder_gestion_avisos2
			lm_gestion_avi.m_opciones.m_asignaralimentacion.Enabled = false
			lm_gestion_avi.m_opciones.m_cambioalimentacion.Enabled = false
			lm_gestion_avi.m_opciones.m_crearincidencia.Enabled = false
			lm_gestion_avi.m_opciones.m_asignarbrigada.Enabled = false
			lm_gestion_avi.m_opciones.m_avisoimprocedente.Enabled = False
			lm_gestion_avi.m_opciones.m_deseleccion.Enabled = False
			lm_gestion_avi.m_opciones.m_desplegarenarbol.Enabled = False
			lm_gestion_avi.m_opciones.m_alimentarconredreal.Enabled = False
			
// GNU 11/01/2007. Mejora 1/311530			
//			lm_gestion_avi.m_opciones.PopMenu(w_1105_avisos_con_alim.PointerX() + 50, w_1105_avisos_con_alim.PointerY() + 100)
			lm_gestion_avi.m_opciones.PopMenu(Parent.PointerX() + 50, Parent.PointerY() + 100)
// FIN GNU			
			
			ii_op = gu_comunic.is_comunic.intval9 
			
			if ii_op=6 then
				
				This.SelectRow(0, True)
				//AHM (03/01/2008)
				FOR ll_aux= 1 TO THIS.rowCount()
					THIS.setItem(ll_aux, "seleccionado",1)		
				NEXT
				ii_ind_pel_lista = This.GetItemNumber(this.rowcount(),"avisos_ind_peligro")
				ii_cli_imp_lista = This.GetItemNumber(this.rowcount(),"ind_cli_imp")
				ii_fila_clickeada = this.rowcount()
				idt_f_actual = this.object.f_actual[this.rowcount()]
				
			end if
			
		end if
	end if
end if
// GNU 11/01/2007. Mejora 1/311530
//if isvalid(w_1105_avisos_con_alim) then
if isvalid(parent) then
// FIN GNU
	parent.enabled=true
end if
end event

event retrieveend;call super::retrieveend;long ll_zona, ll_cmd, ll_sector, ll_tipo_aviso

/* LSH DEO13_00000156 20130304  ******** INICIO ********* */
//Variable definida para el Setfilter del datawindow
String dwfilter;
/* LSH DEO13_00000156 20130304  ********  FIN  ********* */

ib_recupero = true

if ib_falta_retrieve = true then
	ll_zona = dw_ambito.GetItemNumber(1, 'nro_centro')
	ll_cmd =  dw_ambito.getitemnumber(1,"nro_cmd") 
	ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")
	ib_falta_retrieve = false
	dw_lista_avisos.Retrieve(il_nro_instal,ii_clase_aviso,&
	fgcdec_aviso_de_calidad, fgcdec_aviso_de_calidad_con_alim,&
	fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector, ids_f_desde, ids_f_hasta,ii_alcances[],il_nro_aviso_desde, il_nro_aviso_hasta)
// Modificado Por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n. 22/10/2004. Se a$$HEX1$$f100$$ENDHEX$$adieron como argumentos ids_f_desde y ids_f_hasta.
//	fgcdec_aviso_de_calidad_sin_alim, ll_zona, ll_cmd, ll_sector)
// Fin. Sgo.
end if
IF cbx_filtrar_activos.checked=true THEN
	
	/* LSH DEO13_00000156 20130304  ******** INICIO ********* */
	//Se corrigio la el filtro, ya que faltaba 
	//que filtrara por el indicativo de peligro
	ll_tipo_aviso = dw_avisos_activos.GetItemNumber(1,"tip_aviso")
	dwfilter = "AVISOS_IND_PELIGRO = 1 AND TIP_AVISO = "+string(ll_tipo_aviso)
	dw_lista_avisos.setFilter(dwfilter);
	dw_lista_avisos.filter( );
	//	ll_tipo_aviso = dw_avisos_activos.GetItemNumber(1,"tip_aviso")
	//	dw_lista_avisos.SetFilter("TIP_AVISO = "+string(ll_tipo_aviso))
	//	dw_lista_avisos.Filter()
	
	/* LSH DEO13_00000156 20130304  ********  FIN  ********* */
END IF
// GNU 17-5-2006. Incidencia Correo
If fg_verifica_parametro(Parent.ClassName()) Then
	if gi_pais <> 8 then // En moldavia no aplica
	
		// GNU 22-6-2006. Incidencia Correo Panam$$HEX2$$e1000900$$ENDHEX$$
	IF gi_pais = 4 THEN
		This.SetRedraw(False)
		This.SetSort("f_alta D")
		This.Sort()
		This.SetRedraw(True)
	// FIN GNU
	elseIf fg_verifica_parametro('GEO') Then
		This.SetRedraw(False)
		This.SetSort("gi_avisos_nom_prov A, gi_avisos_nom_depto A, c_concat A")
		This.Sort()
		This.SetRedraw(True)
	else
		This.SetRedraw(False)
		This.SetSort("f_alta D")
		This.Sort()
		This.SetRedraw(True)
	end if
	end if
else 
	if gi_pais <> 8 then
		// GNU 22-6-2006. Incidencia Correo Panam$$HEX2$$e1000900$$ENDHEX$$
		IF gi_pais = 4 THEN
			This.SetRedraw(False)
			This.SetSort("f_alta D")
			This.Sort()
			This.SetRedraw(True)
		// FIN GNU
		elseif fg_verifica_parametro('GEO') Then
			This.SetRedraw(False)
			This.SetSort("sector A, cs_direccion A")
			This.Sort()
			This.SetRedraw(True)
		else
			This.SetRedraw(False)
			This.SetSort("f_alta D")
			This.Sort()
			This.SetRedraw(True)
		end if
	end if
end if
if gi_pais = 8 then 

	If fg_verifica_parametro('GEO') Then
		This.SetRedraw(False)
		This.SetSort("sector A, nom_loc A, cs_direccion A")
		This.Sort()
		This.SetRedraw(True)
	else
		This.SetRedraw(False)
		This.SetSort("f_alta D")
		This.Sort()
		This.SetRedraw(True)
	end if

End If

//dw_lista_avisos.sort()
// FIN GNU
end event

event retrieverow;call super::retrieverow;if ib_cancel  then // DBE 09/03/2000
	return 1
end if
end event

event retrievestart;call super::retrievestart;//*******************************************************************************//
//  Parametrizacion: Avisos de ayuda y ap. solo prov, dist., corr. y barrio      //
//  Luis Eduardo Ortiz Mayo/2001                                                 //
//*******************************************************************************//

String ls_result

// GNU 11/01/2007. Mejora 1/311530	
//ls_result = w_1105_avisos_con_alim.dw_lista_avisos.Modify("ind_esquina.Expression='0'")
ls_result = dw_lista_avisos.Modify("ind_esquina.Expression='0'")
// FIN GNU
If fg_verifica_parametro("avisos_ayuda_ap_prov_dist_corr_barrio") Then
// GNU 11/01/2007. Mejora 1/311530	
//	ls_result = w_1105_avisos_con_alim.dw_lista_avisos.Modify("ind_esquina.Expression='1'")
	ls_result = dw_lista_avisos.Modify("ind_esquina.Expression='1'")
// FIN GNU	
End If

ib_recupero = false
This.reset()
end event

event sqlpreview;call super::sqlpreview;int li_entero

end event


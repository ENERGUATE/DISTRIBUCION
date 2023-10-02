HA$PBExportHeader$w_reportes_avisos_incidencias_2.srw
forward
global type w_reportes_avisos_incidencias_2 from window
end type
type cb_1 from commandbutton within w_reportes_avisos_incidencias_2
end type
type st_titulos from statictext within w_reportes_avisos_incidencias_2
end type
type mle_titulos from multilineedit within w_reportes_avisos_incidencias_2
end type
type st_subtitulos from statictext within w_reportes_avisos_incidencias_2
end type
type mle_subtitulos from multilineedit within w_reportes_avisos_incidencias_2
end type
type p_1 from picture within w_reportes_avisos_incidencias_2
end type
type st_titulo from statictext within w_reportes_avisos_incidencias_2
end type
type dw_funciones from u_pr_funcion within w_reportes_avisos_incidencias_2
end type
type st_3 from statictext within w_reportes_avisos_incidencias_2
end type
type st_2 from statictext within w_reportes_avisos_incidencias_2
end type
type st_1 from statictext within w_reportes_avisos_incidencias_2
end type
type dw_lista_orden from u_lista_orden within w_reportes_avisos_incidencias_2
end type
type sle_1 from singlelineedit within w_reportes_avisos_incidencias_2
end type
type dw_lista_items from u_lista_reporte within w_reportes_avisos_incidencias_2
end type
type uo_menu from u_pr_menu within w_reportes_avisos_incidencias_2
end type
type st_material from statictext within w_reportes_avisos_incidencias_2
end type
type st_causa from statictext within w_reportes_avisos_incidencias_2
end type
type mle_1 from multilineedit within w_reportes_avisos_incidencias_2
end type
type dw_1 from datawindow within w_reportes_avisos_incidencias_2
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_reportes_avisos_incidencias_2
end type
type dw_filtro_reporte from u_gen_7001_pr_filtro_reporte_inc within w_reportes_avisos_incidencias_2
end type
type st_instalacion from statictext within w_reportes_avisos_incidencias_2
end type
end forward

global type w_reportes_avisos_incidencias_2 from window
integer width = 3625
integer height = 2376
boolean titlebar = true
string title = "SLIR-Objeto de Creacion de Informes Dinamicos"
string menuname = "m_reportes_2"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "Form!"
event ue_armar_sql ( )
event ue_grabar_reporte ( )
event ue_grabar_pref ( )
event ue_abrir_pref ( )
event ue_abrir_reporte ( )
event ue_post_open ( )
event ue_limpiar_ventana ( )
event ue_imprimir ( )
event ue_seleccionar_todo ( )
event ue_deseleccionar_todo ( )
event ue_exportar_excel ( )
cb_1 cb_1
st_titulos st_titulos
mle_titulos mle_titulos
st_subtitulos st_subtitulos
mle_subtitulos mle_subtitulos
p_1 p_1
st_titulo st_titulo
dw_funciones dw_funciones
st_3 st_3
st_2 st_2
st_1 st_1
dw_lista_orden dw_lista_orden
sle_1 sle_1
dw_lista_items dw_lista_items
uo_menu uo_menu
st_material st_material
st_causa st_causa
mle_1 mle_1
dw_1 dw_1
dw_ambito dw_ambito
dw_filtro_reporte dw_filtro_reporte
st_instalacion st_instalacion
end type
global w_reportes_avisos_incidencias_2 w_reportes_avisos_incidencias_2

type variables
u_generico_comunicaciones iu_comunic
u_5001_nu_reportes iu_5001_nu
ds_5001_reportes iu_ds_reportes
long il_fila_lista_items
long il_fila_orden
int ii_filas_seleccionadas = 0
int ii_fila_funcion = 0
string is_tabla_consulta
boolean ib_funcion
boolean ib_habilitado = True
long il_fila_arrastrada
string is_fila
datawindow id_objeto
string is_preferencia
s_print str_print
long il_fila

int ii_visual_nro=1

boolean ib_error = FALSE

datawindowchild ddw_tension_incid_t
datawindowchild ddw_tipo_tension_t

int ii_numfich  //**  OSGI 2001.1  	01/05/2001
string is_contenido  //**  OSGI 2001.1  	01/05/2001
boolean ib_abrir  //**  OSGI 2001.1  	01/05/2001
String is_campo_inc = 'ai_tipo'  //**  OSGI 2001.1  18/06/2001

boolean ib_reporte = false
end variables

forward prototypes
public function integer f_preparo_datawindow (datawindow pd_data, string ps_nombres[])
public function boolean fnu_cambio_nombres (string ps_campos[], string ps_nombres[], integer numero, datawindow pd_data)
public function integer f_preparo_ventana ()
public function string fw_preparar_archivo ()
public function integer f_interpretar_archivo (ref string ps_contenido)
public function integer f_ventana_vacia ()
public function integer f_visulizar_ventana ()
public function integer f_deshabilitar ()
public function integer f_habilitar ()
public subroutine fw_cargar_dddw_avisos ()
public subroutine fw_cargar_dddw_inicid ()
public function integer f_cargar_ddw_tension (string ps_llamada)
public subroutine f_titulo_subtitulo ()
public subroutine fw_filtro_tipo_inc_ext ()
public function integer fw_validar_fechas ()
end prototypes

event ue_armar_sql();///////////////////////////////////////////////////////
//										
// Evento: ue_armar_sql
// 
// Objetivo: Construye la sentencia SQL que crear$$HEX2$$e1002000$$ENDHEX$$el reporte.
//				 La sentencia SQL ser$$HEX2$$e1002000$$ENDHEX$$creada a partir de las pre-
//           ferencias que el usuario haya escogido y teniendo
//           en cuenta los Join.
//	
//
// Responsables:  AFS -. Ale
//						FDB -. Frank
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

setpointer(Hourglass!)
int li_count, li_filas_selec, li_cont_array, li_cant_joins, li_centro, li_cmd, li_mesa, li_agrup
string ls_select, ls_from, ls_order, ls_tabla, ls_join, ls_where, ls_campo, ls_group &
, ls_array_tablas[], ls_funcion, ls_tabla_from, ls_subselect,ls_item2
boolean lb_existe,lb_funcion_aplicada,lb_join
int li_cont_asc=65
string ls_array_campos[] //fran
string ls_array_nombres[]//fran
string ls_array_joins[]  //fran
integer li_contacampos //fran
string ls_tipoorden, ls_filtro
long ll_pos_inicial
datetime ldt_periodo, ldt_rango
string ls_centro
integer li_hay_gi_causa= 0 // GNU 18-4-2007. Mejora 1/485502
	// Variable para ver si hay que insertar GI_CAUSA en la SELECT
	// 0 --> No hay causas
	// 1 --> Hay GI_CAUSA --> No hay que insertarlo
	// 2 --> No Hay GI_CAUSA, pero hay GI_SUBTIPOS o GI_SUBTIPO_CAUSA --> Hay que insertarlo
	
boolean	lb_hayCantidad			//Indicador de que hay que poner el n$$HEX1$$fa00$$ENDHEX$$mero de registros
long		ll_colcount, ll_colposx, ll_colwidth, ll_colheight 
string	ls_nomcol
string	ls_sinonimo
string	ls_nombre				//Nombre del campo

//NCA-INICIO.DDAG-1679.15/05/2015.
long ls_larg_gi_avisos
//TDA
long ls_larg_sgd_incidencia
long ls_larg_gi_hist_incidencias 
string ls_select_hist, ls_tabla_hist
String ls_select_fnc_max, ls_select_fnc_min, ls_select_fnc,ls_armar_consult_max, ls_armar_consult, ls_armar_consult_min 	
//NCA-FIN.DDAG-1679.15/05/2015.

lb_hayCantidad = FALSE

li_filas_selec=0
ls_select=" "
lb_existe= false
lb_funcion_aplicada= false
ls_from =" "
ls_where=" "
li_cant_joins=0
ls_funcion=" "
ls_group=" "

if ib_error = TRUE then 
	ib_error = FALSE
	return 
end if	
dw_filtro_reporte.AcceptText()
ldt_periodo = dw_filtro_reporte.object.pa_periodo[dw_filtro_reporte.getRow()]
dw_filtro_reporte.SetItem(dw_filtro_reporte.getRow(),'pa_periodo',ldt_periodo )
ldt_rango = dw_filtro_reporte.object.pa_rango[dw_filtro_reporte.getRow()]
dw_filtro_reporte.SetItem(dw_filtro_reporte.getRow(),'pa_rango',ldt_rango )

if fw_validar_fechas()= -1 then
	return
end if

//This.str_print.PARM1=false

sle_1.visible=false

// Se almacena en el primer elemento del vector de tablas
// El nombre de la tabla que es objeto de la consulta a los
// Efectos de generar la sentencia from

ls_array_tablas[1]=is_tabla_consulta

// GNU 7-5-2007. Mejora 1/332338
IF iu_comunic.is_comunic.accion_llamada="sgd_descargos" THEN
		ls_array_tablas[2]="sgd_instalacion"
END IF
// FIN GNU


//Genero el string del select y del Group By
For li_count = 1 to dw_lista_items.rowcount()
	if dw_lista_items.isselected(li_count) then
		li_filas_selec ++
		li_contacampos = li_filas_selec //fran
		ls_tabla= dw_lista_items.getitemstring(li_count,"tabla")
		ls_campo=dw_lista_items.getitemstring(li_count,"campo")
		ls_join= dw_lista_items.getitemstring(li_count,"join")
		ls_funcion= dw_lista_items.getitemstring(li_count,"funcion")
		//AHM (14/02/2008)
		ls_sinonimo = dw_lista_items.getitemstring(li_count,"sinonimo")
		IF NOT isNull(ls_sinonimo) AND ls_sinonimo<> "" THEN
			ls_tabla_from= ls_tabla + " " + ls_sinonimo
			ls_tabla = ls_sinonimo
			IF iu_comunic.is_comunic.accion_llamada = "gi_brigada" THEN
				ls_nombre = trim(dw_lista_items.getitemstring(li_count,"nombre"))
				DO WHILE (pos(ls_nombre, " ") > 0)
					ls_nombre = replace(ls_nombre, pos(ls_nombre, " "), 1, "_")					
				LOOP
			END IF
		ELSE
			ls_tabla_from = ls_tabla
			ls_nombre = ""
		END IF
		ls_tabla_from = trim(ls_tabla_from)
		//End AHM
		if ls_campo <> "cantidad" then
			ls_array_nombres[li_filas_selec]=dw_lista_items.getitemstring(li_count,"nombre")//fran
			// si se drague$$HEX2$$f3002000$$ENDHEX$$una funcion al campo, la aplico y prendo la bandera
		
			// Cargo en el vector las tablas que se usaran para generar el from
			for li_cont_array=1 to Upperbound(ls_array_tablas)
				if ls_array_tablas[li_cont_array] = ls_tabla_from then
					if Upper(ls_tabla_from) = "SGD_VALOR" then
						ls_array_tablas[Upperbound(ls_array_tablas)+1]= ls_tabla_from + ' ' + Char(li_cont_asc)
						ls_tabla_from=Char(li_cont_asc)
						ls_tabla=ls_tabla_from
						do while Pos(ls_join, "sgd_valor")<> 0
							ls_join= Replace ( ls_join, Pos(ls_join, "sgd_valor"), 9, Char(li_cont_asc))
						loop
						li_cont_asc ++
						lb_existe=true
					else	
						lb_existe=true
					end if
				end if
			next
			
			// GNU 18-4-2007. Mejora 1/485502
			// Compruebo si hay que insertar GI_CAUSA en el FROM o no
			IF li_hay_gi_causa <> 1 THEN
				IF Upper(ls_tabla_from)='GI_SUBTIPOS' &
					or Upper(ls_tabla_from)='GI_SUBTIPO_CAUSA' then
					li_hay_gi_causa= 2
				ELSEIF Upper(ls_tabla_from)='GI_CAUSA' then
					li_hay_gi_causa= 1
				END IF
			END IF
			// FIN GNU
			
			//AHM(24/11/2009) Mejora 1/668221
			IF isNull(ls_tabla_from) OR ls_tabla_from = "" THEN
				lb_existe = TRUE
			END IF
			
			if not lb_existe then
				ls_array_tablas[Upperbound(ls_array_tablas)+1]= ls_tabla_from
				
				//\\// PM_U003 TIPOS VIA INCIDENCIA AMR 13/06/2002
				// \/ Hay que colocar a la fuerza el campo callejero para relacionarlo con la tabla tipos
				IF gb_tipos_de_via THEN
					IF Upper(ls_tabla_from) = "TIPOS" THEN
						ls_array_tablas[Upperbound(ls_array_tablas)+1]= "callejero"
					END IF
				END IF
				// /\
				//\\// PM_U003 TIPOS VIA INCIDENCIA AMR 13/06/2002
	
			else
				lb_existe=false
			end if
	
			
			if not (ls_funcion=" " or ls_funcion="" or isnull(ls_funcion)) then
				if ls_funcion="AVG(" or ls_funcion="SUM(" then
					ls_tabla = ls_funcion + ls_tabla
				else
					// GNU 9-5-2007. Mejora 1/332338
					//AHM (15/02/2008)
					IF pos(ls_campo,"fgnu_")>0 THEN
						IF NOT ls_nombre= "" THEN
							ls_subselect = "and " + ls_nombre + " = (SELECT " + ls_funcion + ls_nombre + ") " // + ")"							
						ELSE
							ls_subselect = "and " + ls_campo + " = (SELECT " + ls_funcion + ls_campo + ") " // + ")"
						END IF
					ELSE
						IF NOT ls_nombre= "" THEN
							ls_subselect = "and " + ls_tabla + "." + ls_nombre + " = (SELECT " + ls_funcion + ls_nombre + ") " // + ")"
						ELSE
							ls_subselect = "and " + ls_tabla + "." + ls_campo + " = (SELECT " + ls_funcion + ls_tabla + "." + ls_campo + ") " // + ")"
						END IF
					END IF
					// FIN GNU
				end if
				lb_funcion_aplicada=true
			else
				lb_funcion_aplicada= false
			end if
			
			if li_filas_selec=1 then
				//AHM (24/1/2009) Mejora 1/668221
				//AHM (15/02/2008)
				if (pos(ls_campo,"fgnu_")>0 OR isNull(ls_tabla_from) OR ls_tabla_from = "" ) then // EL CAMPO ES UN PLSQL  ACO
//					ls_select= " SELECT " +  ls_campo
					ls_select= " SELECT " +  ls_campo + " " + ls_nombre
				else
					ls_select= " SELECT " + ls_tabla + "." + ls_campo +  " " + ls_nombre
				end if
				if not lb_funcion_aplicada and ib_funcion then
					
					//AHM (24/1/2009) Mejora 1/668221
					//AHM (15/02/2008)
					if (pos(ls_campo,"fgnu_")>0 OR isNull(ls_tabla_from) OR ls_tabla_from = "" ) then // EL CAMPO ES UN PLSQL  ACO
						IF NOT ls_nombre= "" THEN
							ls_group= ls_group + ls_nombre
						ELSE	
							ls_group= ls_group + ls_campo
						END IF
					ELSE
						IF NOT ls_nombre= "" THEN
							ls_group= ls_group + ls_nombre
						ELSE
							ls_group= ls_group + ls_tabla_from + "." + ls_campo
						END IF
					END IF
				end if
				IF NOT ls_nombre= "" THEN
					ls_array_campos[li_filas_selec]= ls_nombre
				ELSE	
					ls_array_campos[li_filas_selec]= ls_campo //fran
				END IF
				ls_array_joins[li_filas_selec]= ls_join //fran
	
			else
				//AHM (24/1/2009) Mejora 1/668221
				//AHM (15/02/2008)
				if (pos(ls_campo,"fgnu_")>0 OR isNull(ls_tabla_from) OR ls_tabla_from = "" ) then // EL CAMPO ES UN PLSQL  ACO
				//Fin AHM
					 ls_select = ls_select + " , " + ls_campo + " " + ls_nombre
				else
					ls_select = ls_select + " , " + ls_tabla + "." + ls_campo + " " + ls_nombre
				end if
				if not lb_funcion_aplicada and ib_funcion then
					IF Len(Trim(ls_group)) > 0 THEN		// Ale
						//AHM (24/1/2009) Mejora 1/668221
						//AHM (15/02/2008)
						if (pos(ls_campo,"fgnu_")>0 OR isNull(ls_tabla_from) OR ls_tabla_from = "" ) then // EL CAMPO ES UN PLSQL  ACO
							IF NOT ls_nombre= "" THEN
								ls_group = ls_group + " , " + ls_nombre//fran
							ELSE
								ls_group = ls_group + " , " + ls_campo//fran
							END IF
						ELSE
							IF NOT ls_nombre= "" THEN
								ls_group = ls_group + " , " + ls_nombre
							ELSE
								ls_group = ls_group + " , " + ls_tabla_from + "." + ls_campo//fran
							END IF
						END IF
					ELSE
						//AHM (24/1/2009) Mejora 1/668221
						//AHM (15/02/2008)
						if (pos(ls_campo,"fgnu_")>0 OR isNull(ls_tabla_from) OR ls_tabla_from = "" ) then // EL CAMPO ES UN PLSQL  ACO
							IF NOT ls_nombre= "" THEN
								ls_group = ls_nombre
							ELSE
								ls_group = ls_campo
							END IF
						ELSE
							IF NOT ls_nombre= "" THEN
								ls_group = ls_nombre
							ELSE
								ls_group = ls_tabla_from + "." + ls_campo
							END IF
						END IF
					END IF
				end if
				//AHM(15/02/2008)
//				ls_array_campos[li_filas_selec]= ls_campo  //fran
				IF NOT ls_nombre= "" THEN
					ls_array_campos[li_filas_selec]= ls_nombre
				ELSE
					ls_array_campos[li_filas_selec]= ls_campo 
				END IF
				ls_array_joins[li_filas_selec]= ls_join //fran
			end if
			
			if lb_funcion_aplicada = true and ls_funcion="AVG(" or ls_funcion="SUM("  then
				ls_select= ls_select + ") "
			end if
	//Fran hoy
			
		if not(ls_join="") and not (isnull(ls_join)) and not (ls_join= " ") then
				li_cant_joins ++
				if li_cant_joins = 1 then
					ls_where = ls_join
				else
					ls_where=ls_where + " and " + ls_join	
			end if
		end if
	else
		lb_hayCantidad = TRUE
	end if
end if
next

// Genero el string del form
//LSH INI 08/09/2013 evolutivo DEO12-00000263
string ls_bandera = '0'
//LSH FIN 08/09/2013 evolutivo DEO12-00000263
for li_count=1 to Upperbound(ls_array_tablas)
	if li_count = 1 then
		ls_from=" FROM " + ls_array_tablas[li_count]
	else
		ls_from=ls_from + " , " + ls_array_tablas[li_count]
	end if
	
	//LSH INI 08/09/2013 evolutivo DEO12-00000263
	IF Upper(ls_array_tablas[li_count]) = 'SGD_INCIDENCIA' THEN
		 ls_bandera = "1"
	END IF
	//LSH FIN 08/09/2013 evolutivo DEO12-00000263
next

// GNU 18-4-2007. Mejora 1/485502
IF li_hay_gi_causa=2 THEN
	ls_from += ", gi_causa "
END IF

// Para que sea posible el Join de la instalacion en Brigadas 
// hay que a$$HEX1$$f100$$ENDHEX$$adir la tabla OT a pelo
if iu_comunic.is_comunic.accion_llamada="gi_brigada" then
	if dw_lista_items.IsSelected(5)=true or dw_lista_items.IsSelected(6)=true then
		ls_from=ls_from + " , gi_ot "
	end if
end if

//LSH INI 08/09/2013 evolutivo DEO12-00000263
//Se agrego la tabla sgd_incidencia a la fuerza para hacer 
//posible el join con la tabla GI_BRIGADA_OT
IF Upper(ls_tabla_from)='GI_BRIGADA_OT' AND ls_bandera <> "1" THEN
	ls_from=ls_from + " , sgd_incidencia "
END IF
//LSH FIN 08/09/2013 evolutivo DEO12-00000263

li_centro = dw_ambito.getitemnumber(1,"nro_centro")
li_cmd = dw_ambito.getitemnumber(1,"nro_cmd")
li_mesa = dw_ambito.getitemnumber(1,"nro_mesa")

IF is_tabla_consulta='sgd_reenganches' THEN
	ls_centro = '.nro_zona'
ELSE
	ls_centro = '.nro_centro'
END IF

IF iu_comunic.is_comunic.accion_llamada <> "sgd_descargos" THEN
choose case li_centro
	case 0
		if li_cant_joins >0 then 
			//ls_where=ls_where + " and " + is_tabla_consulta + ls_centro + " > 0 "
			ls_where=ls_where + " and " 
		else
			//ls_where=ls_where + is_tabla_consulta + ls_centro + " > 0 "
		end if
		
		case else
			choose case li_cmd
					case 0
						if li_cant_joins >0 then
							ls_where=ls_where + " and " + is_tabla_consulta + ls_centro + " = " &
							+ string(li_centro)+ " and " + is_tabla_consulta + ".nro_cmd >0 " + " and "
						else
							ls_where=ls_where + is_tabla_consulta + ls_centro + " = " &
							+ string(li_centro)+ " and " + is_tabla_consulta + ".nro_cmd >0 "	+ " and "						
						end if
						
					case else
						if li_mesa=0 then
							if li_cant_joins >0 then
								ls_where=ls_where + " and " + is_tabla_consulta + ls_centro +  " = " &
							+ string(li_centro) + " and " + is_tabla_consulta + ".nro_cmd = " &
							+ string(li_cmd) + " and " + is_tabla_consulta + ".nro_mesa >0 " 
							else
								ls_where=ls_where + is_tabla_consulta + ls_centro + " = " &
							+ string(li_centro) + " and " + is_tabla_consulta + ".nro_cmd = " &
							+ string(li_cmd) + " and " + is_tabla_consulta + ".nro_mesa >0 "
							end if
						else
							if li_cant_joins >0 then
								ls_where=ls_where + " and " + is_tabla_consulta+ ls_centro + " = " &
								+ string(li_centro) + " and " + is_tabla_consulta+ ".nro_cmd = " &
								+ string(li_cmd) + " and " + is_tabla_consulta+ ".nro_mesa =" + string(li_mesa)
							else								
								ls_where=ls_where + is_tabla_consulta+ ls_centro + " = " &
								+ string(li_centro) + " and " + is_tabla_consulta+ ".nro_cmd = " &
								+ string(li_cmd) + " and " + is_tabla_consulta+ ".nro_mesa =" + string(li_mesa)
							end if
						end if
				end choose
		end choose
	ELSE
	choose case li_centro
		case 0
		if li_cant_joins >0 then 
			ls_where=ls_where + " and sgd_instalacion" + ls_centro + " > 0 "
		else
			ls_where=ls_where + " sgd_instalacion"  + ls_centro + " > 0 "
		end if
		
		case else
			choose case li_cmd
					case 0
						if li_cant_joins >0 then
							ls_where=ls_where + " and sgd_instalacion" + ls_centro + " = " &
							+ string(li_centro)+ " and sgd_instalacion.nro_cmd >0 "
						else
							ls_where=ls_where + " sgd_instalacion" + ls_centro + " = " &
							+ string(li_centro)+ " and sgd_instalacion.nro_cmd >0 "							
						end if
						
					case else
						if li_mesa=0 then
							if li_cant_joins >0 then
								ls_where=ls_where + " and sgd_instalacion" + ls_centro +  " = " &
							+ string(li_centro) + " and sgd_instalacion.nro_cmd = " &
							+ string(li_cmd) + " and sgd_instalacion.nro_mesa >0 " 
							else
								ls_where=ls_where + " sgd_instalacion" + ls_centro + " = " &
							+ string(li_centro) + " and sgd_instalacion.nro_cmd = " &
							+ string(li_cmd) + " and sgd_instalacion.nro_mesa >0 "
							end if
						else
							if li_cant_joins >0 then
								ls_where=ls_where + " and sgd_instalacion" + ls_centro + " = " &
								+ string(li_centro) + " and sgd_instalacion.nro_cmd = " &
								+ string(li_cmd) + " and sgd_instalacion.nro_mesa =" + string(li_mesa)
							else								
								ls_where=ls_where + " sgd_instalacion"+ ls_centro + " = " &
								+ string(li_centro) + " and sgd_instalacion.nro_cmd = " &
								+ string(li_cmd) + " and sgd_instalacion.nro_mesa =" + string(li_mesa)
							end if
						end if
				end choose
		end choose
		 ls_where += " and sgd_instalacion.nro_instalacion= sgd_descargos.cod_inst_origen and sgd_instalacion.bdi_job= 0 "
	END IF
	
		if dw_lista_orden.rowcount() > 0 then
			for li_count=1 to dw_lista_orden.rowcount()
				choose case iu_comunic.is_comunic.accion_llamada
					case "sgd_reenganches"
						
							if dw_lista_orden.getitemnumber(li_count,"tipo")= 2 then
									ls_tipoorden=" DESC"
								else
									ls_tipoorden=""
							end if
							if li_count=1 then
								// validamos si el campo tiene un JOIN
								
								ls_order = " ORDER BY SGD_REENGANCHES." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
							
							else
								// validamos si el campo tiene un JOIN
								
								ls_order=ls_order + " , sgd_reenganches." + dw_lista_orden.getitemstring(li_count,"campo") + ls_tipoorden
	
							end if
							
					case "sgd_incidencia"
							if dw_lista_orden.getitemnumber(li_count,"tipo")= 2 then
									ls_tipoorden=" DESC"
								else
									ls_tipoorden=""
							end if
							if li_count=1 then
								// validamos si el campo tiene un JOIN
								
								ls_order = " ORDER BY SGD_INCIDENCIA." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
							
							else
								// validamos si el campo tiene un JOIN
								
								ls_order=ls_order + " , sgd_incidencia." + dw_lista_orden.getitemstring(li_count,"campo") + ls_tipoorden
	
							end if
						
					case "gi_avisos"
						if dw_lista_orden.getitemnumber(li_count,"tipo")= 2 then
								ls_tipoorden=" DESC"
							else
								ls_tipoorden=""
						end if
						if li_count=1 then
							// validamos si el campo tiene un JOIN
							
							//ls_order = " ORDER BY gi_avisos." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
							
						//\\// PM_U003 TIPOS VIA INCIDENCIA AMR 13/06/2002
						// \/ Hay que colocar a la fuerza el campo para poder hacer el order by
						//  ls_order = " ORDER BY "+dw_lista_orden.getitemstring(li_count,"tabla")+"." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
							
						 IF gb_tipos_de_via THEN	
							IF Upper(dw_lista_orden.getitemstring(li_count,"tabla")) = "TIPOS" THEN
								ls_order = " ORDER BY "+ "NOM_CALLE "  + ls_tipoorden
							ELSE
								ls_order = " ORDER BY "+dw_lista_orden.getitemstring(li_count,"tabla")+"." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
							END IF
						ELSE
							ls_order = " ORDER BY "+dw_lista_orden.getitemstring(li_count,"tabla")+"." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
						END IF
						// /\
						//\\// PM_U003 TIPOS VIA INCIDENCIA AMR 13/06/2002

						
						else
							// validamos si el campo tiene un JOIN
							
							//ls_order=ls_order + " , gi_avisos." + dw_lista_orden.getitemstring(li_count,"campo") + ls_tipoorden
							
							//\\// PM_U003 TIPOS VIA INCIDENCIA AMR 13/06/2002
							// \/ Hay que colocar a la fuerza el campo para poder hacer el order by
							//ls_order = ls_order +" , "+ dw_lista_orden.getitemstring(li_count,"tabla")+"." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
							IF gb_tipos_de_via THEN		
								IF Upper(dw_lista_orden.getitemstring(li_count,"tabla")) = "TIPOS" THEN
									ls_order = ls_order +" , "+ "NOM_CALLE "  + ls_tipoorden
								ELSE
									ls_order = ls_order +" , "+ dw_lista_orden.getitemstring(li_count,"tabla")+"." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
								END IF
							ELSE				
								ls_order = ls_order +" , "+ dw_lista_orden.getitemstring(li_count,"tabla")+"." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
							END IF
							// /\
							//\\// PM_U003 TIPOS VIA INCIDENCIA AMR 13/06/2002


						end if
					case "gi_brigada"
						if dw_lista_orden.getitemnumber(li_count,"tipo")= 2 then
								ls_tipoorden=" DESC"
							else
								ls_tipoorden=""
						end if
						if li_count=1 then
							// validamos si el campo tiene un JOIN
							
							ls_order = " ORDER BY gi_brigada." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
						
						else
							// validamos si el campo tiene un JOIN
							
							ls_order=ls_order + " , gi_brigada." + dw_lista_orden.getitemstring(li_count,"campo") + ls_tipoorden

						end if
						
					case "sgd_instalacion"
						
						if dw_lista_orden.getitemnumber(li_count,"tipo")= 2 then
								ls_tipoorden=" DESC"
							else
								ls_tipoorden=""
						end if
						if li_count=1 then
							// validamos si el campo tiene un JOIN
							
							ls_order = " ORDER BY " + dw_lista_orden.getitemstring(li_count,"tabla") + "." + dw_lista_orden.getitemstring(li_count,"campo")  + ls_tipoorden
						
						else
							// validamos si el campo tiene un JOIN
							
							ls_order=ls_order + " ," +  dw_lista_orden.getitemstring(li_count,"tabla") + "." + dw_lista_orden.getitemstring(li_count,"campo") + ls_tipoorden

						end if	
						
					// GNU 7-5-2007. Mejora 1/332338
					case "sgd_descargos"
						if dw_lista_orden.getitemnumber(li_count,"tipo")= 2 then
								ls_tipoorden=" DESC"
							else
								ls_tipoorden=""
						end if
						if li_count=1 then
							// validamos si el campo tiene un JOIN
							IF dw_lista_orden.getitemstring(li_count,"campo")= 'duracion' THEN
								ls_order= " ORDER BY duracion " + ls_tipoorden
							ELSE
								ls_order = " ORDER BY " + dw_lista_orden.getitemstring(li_count,"tabla") + "." + + dw_lista_orden.getitemstring(li_count,"campo") + ls_tipoorden
							END IF
						else
							// validamos si el campo tiene un JOIN
							IF dw_lista_orden.getitemstring(li_count,"campo_inc")= 'duracion' THEN 
								ls_order= ls_order + " , duracion " + ls_tipoorden
							ELSE
								ls_order= ls_order + " ," + dw_lista_orden.getitemstring(li_count,"tabla") + "." + dw_lista_orden.getitemstring(li_count,"campo") + ls_tipoorden
							END IF
						end if	
					// FIN GNU
				end choose
			next
		end if
int li_buscando		

			choose case iu_comunic.is_comunic.accion_llamada
	
				case "sgd_reenganches"

					li_buscando = dw_filtro_reporte.accepttext()
					if li_buscando = -1 THEN 	return
					ls_filtro=iu_5001_nu.fnu_filtro_reenganche(dw_filtro_reporte)
					if ls_filtro="cancel" then return
					if ls_subselect<> ""then
						ls_where = "(" + ls_where + ls_subselect + ls_from + " where " + ls_where + " " + ls_filtro + ") " + ls_filtro + ")"
					else	
						ls_where = ls_where + " " + ls_filtro
					end if
					
				case "sgd_incidencia"
					li_buscando = dw_filtro_reporte.accepttext()
					if li_buscando = -1 THEN 	return
					ls_filtro=iu_5001_nu.fnu_filtro_incidencia(dw_filtro_reporte)
					if ls_filtro="cancel" then return
					if ls_subselect<> ""then
						ls_where = "(" + ls_where + ls_subselect + ls_from + " where " + ls_where + " " + ls_filtro + ") " + ls_filtro + ")"
					else	
						ls_where = ls_where + " " + ls_filtro
					end if
								
				case "gi_avisos"
					
					li_buscando = dw_filtro_reporte.accepttext()
					if li_buscando = -1 THEN 	return
					ls_filtro=iu_5001_nu.fnu_filtro_aviso(dw_filtro_reporte)
					if ls_filtro="cancel" then return
					if ls_subselect<> ""then
						ls_where = "(" + ls_where + ls_subselect + ls_from + " where " + ls_where + " " + ls_filtro + ") " + ls_filtro + ")"
					else	
						ls_where = ls_where + " " + ls_filtro
							
					end if
				
				case "gi_brigada"
					li_buscando = dw_filtro_reporte.accepttext()
					if li_buscando = -1 THEN 	return
					ls_filtro=iu_5001_nu.fnu_filtro_brigadas(dw_filtro_reporte)
					if ls_filtro="cancel" then return
					if ls_subselect<> ""then
						ls_where = "(" + ls_where + ls_subselect + ls_from + " where " + ls_where + " " + ls_filtro + ") " + ls_filtro + ")"
					else	
						ls_where = ls_where + " " + ls_filtro
					end if
				
				case "sgd_instalacion"
					
					li_buscando = dw_filtro_reporte.accepttext()
					if li_buscando = -1 THEN 	return
					ls_filtro=iu_5001_nu.fnu_filtro_instalaciones(dw_filtro_reporte)
					
					// Filtra por acometidas si estubiese marcado en la dw
					
					if dw_filtro_reporte.object.p_acometidas[1]=1 then
							if dw_lista_items.IsSelected(16)=false then
								ls_from=ls_from + " , SGD_ACOMETIDA"
								ls_where = ls_where + " and sgd_instalacion.nro_instalacion=SGD_ACOMETIDA.INSTALACION_ORIGEN" +&
								   " and sgd_instalacion.bdi_job = 0 and SGD_ACOMETIDA.BDI_JOB = 0 " //DBE 11/01/2000
							else
								ll_pos_inicial=pos(ls_where,"SGD_ACOMETIDA.INSTALACION_ORIGEN",1)
								ls_where=Replace(ls_where,ll_pos_inicial+32,4," ") 
							end if
					end if
					
					if ls_filtro="cancel" then return
					if ls_subselect<> ""then
						ls_where = "(" + ls_where + ls_subselect + ls_from + " where " + ls_where + " " + ls_filtro + ") " + ls_filtro + ")"
					else	
						ls_where = ls_where + " " + ls_filtro
					end if
				// GNU 7-5-2007. Mejora 1/332338
				case "sgd_descargos"
					li_buscando=dw_filtro_reporte.accepttext()
					if li_buscando= -1 THEN return
					ls_filtro=iu_5001_nu.fnu_filtro_descargos(dw_filtro_reporte)
					if ls_filtro="cancel" then return
					if ls_subselect<> ""then
						ls_where = "(" + ls_where + ls_subselect + ls_from + " where " + ls_where + " " + ls_filtro + ") " + ls_filtro + ")"
					else	
						ls_where = ls_where + " " + ls_filtro
					end if
					
			end choose

		ls_where= " WHERE " + ls_where

		IF Len(Trim(ls_group)) > 0 THEN
			ls_group = " GROUP BY " + ls_group
		END IF
		
		/*messagebox("select",ls_select)
		messagebox("from",ls_from)
		messagebox("where",ls_where)*/
		
		if ls_subselect<> "" then
			ls_select= ls_select + ls_from + ls_where 
		else
			ls_select= ls_select + ls_from + ls_where + ls_group + ls_order
		end if
		mle_1.text=ls_select
		
		
//NCA-INICIO.DDAG-1679.15/05/2015.Reemplazamos la tabla gi_avisos por la de gi_hist_avisos y hacemos el union all +++
	If iu_comunic.is_comunic.accion_llamada = 'gi_avisos' Then		
      ls_select_hist = ls_select		
		ls_larg_gi_avisos = LEN('gi_avisos')	
		ls_larg_sgd_incidencia = LEN('sgd_incidencia')
			
			do while Pos(ls_select_hist, "gi_avisos") <> 0
							ls_select_hist= Replace (ls_select_hist, Pos(ls_select_hist, "gi_avisos"), ls_larg_gi_avisos, 'gi_hist_avisos')

							
			loop	
			//TDA
			do while Pos(ls_select_hist, "sgd_incidencia") <> 0
				ls_select_hist= Replace (ls_select_hist, Pos(ls_select_hist, "sgd_incidencia"), ls_larg_sgd_incidencia, 'gi_hist_incidencias')	
			loop
			
			//Dependiendo de la funci$$HEX1$$f300$$ENDHEX$$n se arma el query con la tabla de historicos.			
			ls_armar_consult = "WHERE " + ls_campo + " = " + "(SELECT " + ls_funcion + ls_campo + ")" + " FROM (" +""   

			choose Case ls_funcion
					case  "MAX("
							ls_armar_consult_max = "SELECT * FROM ("
							ls_select_fnc_max = ls_armar_consult_max + ls_select + " UNION ALL " + ls_select_hist + ")" + ls_armar_consult + ls_select +"))"
							
							ls_select = ls_select_fnc_max 

					case  "MIN("						
						   ls_armar_consult_min = "SELECT * FROM ("
							ls_select_fnc_min = ls_armar_consult_min + ls_select + " UNION ALL " + ls_select_hist + ")" + ls_armar_consult + ls_select +"))"
							
							ls_select = ls_select_fnc_min 
	
					case else 
							ls_select= ls_select + " UNION ALL " + ls_select_hist	
			end choose
	End if	 
		
//NCA-FIN.DDAG-1679.15/05/2015.

		//////////////////// COMPROBAMOS SI HAY ALGUN JOIN ///////////////
		//                  PARA COMUNICARSELO A LA FUNCION             //
		For li_count = 1 to dw_lista_items.rowcount()
			if dw_lista_items.isselected(li_count) then
				ls_item2=dw_lista_items.getitemstring(li_count,"join")
				if ls_item2<>"" then lb_join=true
			end if
		next
		//////////////////////////////////////////////////////////////////
		iu_5001_nu.fnu_obtener_datos_2(ls_select,dw_1,lb_join)
		sle_1.text=string(dw_1.rowcount())
		//AHM (14/02/2008)
		IF lb_hayCantidad THEN
			li_contacampos = li_contacampos - 1
		END IF
		fnu_cambio_nombres(ls_array_campos[],ls_array_nombres[],li_contacampos,dw_1)
		f_preparo_datawindow(dw_1,ls_array_campos[])
		dw_1.visible=false
//		m_reportes.m_reporte.m_guardar.toolbaritemvisible=true
		m_reportes_2.m_reporte.m_guardar.enabled=true
		m_reportes_2.m_reporte.m_imprimir.enabled=true
		m_reportes_2.m_reporte.m_guardar.m_reporte2.enabled=true
//		m_reportes.m_reporte.m_imprimir.toolbaritemvisible=true
//		m_reportes.m_reporte.m_guardar.m_reporte2.toolbaritemvisible=true
//		m_reportes.m_rep.m_presentacionpreliminar.toolbaritemvisible=true
		m_reportes_2.m_rep.m_presentacionpreliminar.enabled=true
		IF dw_1.RowCount() > 0 THEN
			m_reportes_2.m_rep.m_exportarinformeaexcel.enabled = TRUE
			This.str_print.PARM1=false
			m_reportes_2.m_rep.m_presentacionpreliminar.enabled = true
			is_preferencia=fw_preparar_archivo()
			setpointer(Arrow!)
			//AHM (13/02/2008)
			IF lb_hayCantidad THEN

					ll_colcount = long(dw_1.Describe("DataWindow.Column.Count"))
										
					ll_colposx = long(dw_1.Describe("#"+string(ll_colcount)+".X"))
					
					
					ll_colwidth = long(dw_1.Describe("#"+string(ll_colcount)+".width"))
					
					ll_colheight = long(dw_1.Describe("#"+string(ll_colcount)+".height"))
					
					dw_1.Modify("create compute(band=Summary color='" + String(RGB(0, 51, 128)) + "' alignment='1' border='0' x='"+string(ll_colposx)+"' "+&
									"y='16' height='"+string(ll_colheight)+"' width='"+string(ll_colwidth)+"' expression='~"Total : ~"+string(rowcount())' "+&
									"name=numeroRegistros visible='1'" +&
									"font.face='Arial' font.height='-8' font.weight='400' font.family='2' "+&
									"font.pitch='2' font.charset='0'  background.mode='2' background.color='16777215')")
									
					dw_1.Modify("DataWindow.Summary.Height= '200'" )
			END IF
			gnv_msg.f_mensaje("IA09","","",ok!)
		ELSE
			m_reportes_2.m_rep.m_exportarinformeaexcel.enabled = FALSE
			setpointer(Arrow!)
			m_reportes_2.m_rep.m_presentacionpreliminar.enabled = false
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se obtuvieron datos para el Informe",information!)
			Return
		END IF
		///instancio la preferencia

		//messagebox("Aviso","Reporte generado satisfactoriamente",information!,ok!)

end event

event ue_grabar_reporte;///////////////////////////////////////////////////////
//										
// Evento: ue_grabar_reporte
// 
// Objetivo: Graba el fichero de reportes que el
//           usuario ha escogido
//	
//
// Responsables:  FDB -. Frank
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

string ls_docname, ls_named, ls_doc2, ls_syntaxis, ls_datos
integer li_value,li_numfila, li_retorno
long ll_pos, ll_num_car_escritos
Boolean lb_todo_escrito = FALSE

//ls_datos=dw_1.Object.DataWindow.Data
ls_syntaxis="#Sintaxis#" + dw_1.Describe("DataWindow.Syntax") 
ls_datos= ls_syntaxis + "$$HEX1$$ac00$$ENDHEX$$campo$$HEX1$$ac00$$ENDHEX$$" + sle_1.text 
ls_datos= ls_datos + "$$HEX1$$e700$$ENDHEX$$Preferencia$$HEX1$$e700$$ENDHEX$$" + is_preferencia

li_value = GetFileSaveName("Grabar Reportes",  & 
	ls_docname, ls_named, "REP",  &
	"Archivos de Reportes (*.REP),*.REP," +  &
	"Todos los Archivos (*.*), *.*")
	//Abro el Archivo y cargo los Valores

ll_pos=pos(upper(ls_docname),".REP")
li_retorno = dw_1.SaveAs(ls_docname,Text!, False)
IF li_retorno = 1 THEN
	li_numfila=fileopen(ls_named,StreamMode!,write!,LockReadWrite!,Append!)
	IF li_numfila > 0 THEN 
		if ll_pos>0 then	
			DO
				ll_num_car_escritos = filewrite(li_numfila,ls_datos)
				IF ll_num_car_escritos < Len(ls_datos) THEN
					ls_datos = Replace(ls_datos, 1, Len(ls_datos), Mid(ls_datos, ll_num_car_escritos+1))
				ELSE
					lb_todo_escrito = TRUE
				END IF
			LOOP WHILE lb_todo_escrito = FALSE
			gnv_msg.F_MENSAJE("CG06","","",ok!)
			fileclose(li_numfila)		
		ELSE
			gnv_msg.F_MENSAJE("MF01","","",ok!)
		END IF
	ELSE
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	END IF
else
	gnv_msg.F_MENSAJE("MF01","","",ok!)
	//mensage de extensi$$HEX1$$f300$$ENDHEX$$n para fichero incorrecta
end if

	


//if li_numfila> 0 then
//	ll_pos=pos(upper(ls_docname),".REP")
//	if ll_pos>0 then
//		filewrite(li_numfila,ls_datos)
//		gnv_msg.F_MENSAJE("CG06","","",ok!)
//	else
//		gnv_msg.F_MENSAJE("MF01","","",ok!)
//		//mensage de extensi$$HEX1$$f300$$ENDHEX$$n para fichero incorrecta
//	end if
//	fileclose(li_numfila)
//end if 
//	
//	

end event

event ue_grabar_pref();///////////////////////////////////////////////////////
//										
// Evento: ue_grabar_pref
// 
// Objetivo: Graba el fichero de preferencias que el
//           usuario ha escogido
//	
//
// Responsables:  FDB -. Frank
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

string ls_docname, ls_named, ls_documento

integer li_value, li_numfila

long ll_pos

li_value = GetFileSaveName("Grabar Preferencias",  & 
	ls_docname, ls_named, "PRF",  &
	"Archivos de Preferencias (*.PRF),*.PRF," +  &
	"Todos los Archivos (*.*), *.*")
	
ll_pos=pos(upper(ls_docname),".PRF")

ls_documento = fw_preparar_archivo() // trae el string del archivo
	
li_numfila=fileopen(ls_docname,StreamMode!,write!,LockReadWrite!,Replace!)
if li_numfila> 0 then
	if ll_pos>0 then	
		filewrite(li_numfila,ls_documento) //Graba un archivo por detras con configuraciones de la DW
		// mensage de archivo fue salvado con exito 
		gnv_msg.F_MENSAJE("CG06","","",ok!)
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	end if
	fileclose(li_numfila)
end if 



end event

event ue_abrir_pref();///////////////////////////////////////////////////////
//										
// Evento: ue_abrir_pref
// 
// Objetivo: Abre el fichero de preferencias que el
//           usuario ha escogido
//	
//
// Responsables:  FDB -. Frank
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

uo_menu.visible=false
timer(0)
string ls_docname, ls_named , ls_contenido

integer li_value,li_numfila, li_contador

boolean lb_fila_sel

long ll_pos

setpointer(HourGlass!)

li_value = GetFileOpenName("Abrir Preferencia",  &
	+ ls_docname, ls_named, "PRF",  &
	+ "Archivos de Preferencias (*.PRF),*.PRF,"  &
	+ "Todos los Archivos (*.*),*.*")

ll_pos=pos(upper(ls_docname),".PRF")

//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
is_contenido = ls_docname
ib_abrir = true

//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF li_value = 1 THEN li_numfila=FileOpen(ls_docname)


//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ii_numfich = li_numfila
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


if li_numfila>0 then
	ii_filas_seleccionadas = 0  // se inicializa el n$$HEX2$$ba002000$$ENDHEX$$de campos seleccionados (LFE)
	IF LL_POS > 0 THEN
		fileread(li_numfila,ls_contenido)	
		LI_VALUE=f_interpretar_archivo(ls_contenido)
		if li_value=1 then
			for li_contador=1 to dw_lista_items.rowcount()
				if dw_lista_items.isselected(li_contador) then
					lb_fila_sel=true
					ii_filas_seleccionadas ++ // se incrementa el n$$HEX2$$ba002000$$ENDHEX$$de campos seleccionados (LFE)
				end if
				if lb_fila_sel then
					if gu_perfiles.of_acceso_perfil(gi_perfil,'REPORTES_P','ACC_MANTEN')=1 then 
						m_reportes_2.m_rep.m_mostrar.enabled=true
						m_reportes_2.m_rep.m_presentacionpreliminar.enabled=FALSE
						m_reportes_2.m_rep.m_exportarinformeaexcel.enabled = FALSE
				  	end if
				else
					//m_reportes.m_rep.m_mostrar.enabled=false
					m_reportes_2.m_rep.m_mostrar.enabled=true
				end if
			next
		end if
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	END IF
	fileclose(li_numfila)
end if
setpointer(Arrow!)
end event

event ue_abrir_reporte();///////////////////////////////////////////////////////
//										
// Evento: ue_abrir_reporte
// 
// Objetivo: Abre el fichero de reporte que el
//           usuario ha escogido
//	
//
// Responsables:  FDB -. Frank
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
uo_menu.visible=false
timer(0)
string ls_docname, ls_named, ls_contenido, ls_doc2, ls_campo, ls_campos, ls_sintaxis, &
ls_error_create, ls_preferencia, ls_contenido_parcial
integer li_value, li_numfich

long ll_pos,ll_posicion,ll_posicion_final, ll_longitud, ll_num_car

li_value = GetFileOpenName("Abrir Reporte",  &
	+ ls_docname, ls_named, "REP",  &
	+ "Archivos de Reportes (*.REP),*.REP,"  &
	+ "Todos los Archivos (*.*),*.*")
	
ll_pos=pos(upper(ls_docname),".REP")
ll_longitud = FileLength(ls_docname)
li_numfich=fileopen(ls_docname,StreamMode!)
ls_contenido = ''

if li_numfich>0 then
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

ii_numfich = li_numfich
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

	if ll_pos>0 then
		DO
			ll_num_car = fileread(li_numfich,ls_contenido_parcial)
			IF ll_num_car > 0 THEN
				ls_contenido = ls_contenido + ls_contenido_parcial
				ll_longitud = ll_longitud - ll_num_car
			ELSE
				ll_longitud = 0
			END IF
		LOOP WHILE ll_longitud > 0

		//fileread(li_numfich,ls_contenido)
		yield()
		ll_posicion=pos(ls_contenido,"#Sintaxis#")
		ls_campos=left(ls_contenido,ll_posicion - 1)
		ll_posicion=ll_posicion+10
		ll_posicion_final=pos(ls_contenido,"$$HEX1$$ac00$$ENDHEX$$campo$$HEX1$$ac00$$ENDHEX$$")
		ls_sintaxis=mid(ls_contenido,ll_posicion,(ll_posicion_final) - ll_posicion)
		ll_posicion=ll_posicion_final + 7
		ll_posicion_final=pos(ls_contenido,"$$HEX1$$e700$$ENDHEX$$Preferencia$$HEX1$$e700$$ENDHEX$$")
		ls_campo=mid(ls_contenido,ll_posicion,(ll_posicion_final) - ll_posicion)
		ll_posicion=ll_posicion_final + 12
		ls_preferencia=right(ls_contenido,len(ls_contenido)-ll_posicion)

		dw_1.Create(ls_sintaxis, ls_error_create) //creo el objeto DW
			IF Len(ls_error_create) <= 0 THEN
				//***************************************
				//**  OSGI 2001.1  	01/05/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				ib_abrir = false

				//**  OSGI 2001.1  	01/05/2001  				f_interpretar_archivo(ls_preferencia)
				is_contenido = ls_docname
				If f_interpretar_archivo(ls_preferencia) = 1 Then
					is_contenido = ls_contenido
				//***************************************
				//**  OSGI 2001.1  	01/05/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************

					dw_1.visible=false
			 	sle_1.visible=true
					sle_1.text=ls_campo
					ll_pos=dw_1.Importstring(ls_campos)
					f_deshabilitar()
	//				m_reportes.m_rep.m_presentacionpreliminar.toolbaritemvisible=true
					m_reportes_2.m_rep.m_presentacionpreliminar.enabled=true
				//***************************************
				//**  OSGI 2001.1  	01/05/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
			   ELSE
					fileclose(li_numfich)
					return
				END IF
				//***************************************
				//**  OSGI 2001.1  	01/05/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				IF Not IsValid(This) Then Return
				// Si no hay datos no se habilita la opci$$HEX1$$f300$$ENDHEX$$n de exportar a Excel (LFE)
				IF dw_1.RowCount() > 0 THEN
					m_reportes_2.m_rep.m_exportarinformeaexcel.enabled = TRUE
				ELSE
					m_reportes_2.m_rep.m_exportarinformeaexcel.enabled = FALSE
				END IF
			end if
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	end if
	fileclose(li_numfich)
end if



end event

event ue_post_open();///////////////////////////////////////////////////////
//										
// Evento: ue_post_open
// 
// Objetivo: Carga la ventana segun el reporte escogido
//	
//
// Responsables:  FDB -. Frank
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
int li_tension, li_tipo
string ls_filtro
datawindowchild ddw_interrup_descargo_t, ddw_estado_descargo_t, ddw_descripcion_descargo // GNU 4-5-2007. Mejora 1/332338

setpointer(HourGlass!)
is_tabla_consulta=iu_comunic.is_comunic.accion_llamada

// Habilito las opciones de menu para importar archivos
m_reportes_2.m_reporte.m_abrir1.m_reporte1.enabled = true
m_reportes_2.m_reporte.m_abrir1.m_preferencia.enabled = true

//Cargo segun sea la llamada, la dw de filtro
choose case iu_comunic.is_comunic.accion_llamada
//	case "sgd_reenganches"
		
	case "sgd_incidencia"
		dw_filtro_reporte.dataobject="d_bdg_7001_pr_filtro_reporte_incidencias"

		p_1.picturename="incid.bmp"
		
		//***************************************
		//**  OSGI 2001.1  	18/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		is_campo_inc = 'pa_tipo_incidencia'
		//***************************************
		//**  OSGI 2001.1  	18/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		
	case "gi_avisos"		
		dw_filtro_reporte.dataobject="d_bdg_7002_pr_filtro_reporte_avisos"
//		dw_filtro_reporte.dataobject="u_gen_7002_pr_filtro_reporte_avi"
		//close(w_qmenu2)
		//p_1.picturename="incid.bmp"
	case "gi_brigada"
		dw_filtro_reporte.dataobject="d_bdg_7003_pr_filtro_reporte_brigadas"
		p_1.picturename="brigada4.bmp"
	case "sgd_instalacion"
		dw_filtro_reporte.dataobject="d_bdg_7004_pr_filtro_reporte_inst"
		p_1.picturename="Instalac.bmp"
	// GNU 3-5-2007. Mejora 1/332338
	case "sgd_descargos"
		dw_filtro_reporte.dataobject="d_bdg_7005_pr_filtro_reporte_descargos"
		p_1.picturename="descargo.bmp"
	// FIN GNU
end choose

f_habilitar()
f_preparo_ventana()
dw_funciones.setredraw(false)
dw_funciones.fnu_insertar_datos()
dw_funciones.setredraw(true)
ib_funcion=false
dw_ambito.visible=true

choose case iu_comunic.is_comunic.accion_llamada
	case "sgd_reenganches"
		
		st_titulo.text="Informe de Reenganches"
		dw_filtro_reporte.visible=true
		dw_lista_items.fpr_lista_reenganche()			
		//Inserto una fila y conecto las DW de los datos por Z. Geo
      
		dw_filtro_reporte.reset()
		dw_filtro_reporte.settransobject(sqlca)
		
		//Conecto las D.D.D.W. DEL OBJETO "FILTRO DEL REPORTE",FILTRO SUS CAMPOS Y SETEO LOS MISMOS CON "TODOS"
		fw_cargar_dddw_inicid()
		li_tension = f_cargar_ddw_tension(iu_comunic.is_comunic.accion_llamada)
		dw_filtro_reporte.f_insertar_fila()
		dw_filtro_reporte.setredraw(TRUE)
		//dw_filtro_reporte.fpr_crea_dddw()
		dw_filtro_reporte.setitem(1,"pa_periodo",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"pa_tipo_incidencia",fgci_todos)
		dw_filtro_reporte.setitem(1,"pa_alcance",fgci_todos)
		dw_filtro_reporte.object.pa_alcance.protect=1
		dw_filtro_reporte.object.pa_alcance.background.color=gs_gris
		dw_filtro_reporte.setitem(1,"pa_tension_afectada",li_tension)
		dw_filtro_reporte.setitem(1,"pa_material_averiado",'')
		dw_filtro_reporte.setItem(1,"ps_nom_mat_averiado",'<Todos>')
		//dw_filtro_reporte.setitem(1,"pa_int_horario",fgci_todos)
		dw_filtro_reporte.setitem(1,"pa_causa",fgci_todos)
		dw_filtro_reporte.setItem(1,"ps_nom_causa","<Todos>")
		dw_filtro_reporte.setitem(1,"pa_operador_fecha","=")
		dw_filtro_reporte.setitem(1,"rango",1)
		dw_filtro_reporte.setitem(1,"pa_rango",fgnu_fecha_actual())
		st_causa.visible = true
		st_material.visible = true
		st_instalacion.visible = true
	case "sgd_incidencia"
	
		st_titulo.text="Informe de Incidencias"
		dw_filtro_reporte.visible=true
		dw_lista_items.fpr_lista_incidencia()

		//Inserto una fila y conecto las DW de los datos por Z. Geo
      
		dw_filtro_reporte.reset()
		dw_filtro_reporte.settransobject(sqlca)
		
		//Conecto las D.D.D.W. DEL OBJETO "FILTRO DEL REPORTE",FILTRO SUS CAMPOS Y SETEO LOS MISMOS CON "TODOS"
		fw_cargar_dddw_inicid()
		li_tension = f_cargar_ddw_tension(iu_comunic.is_comunic.accion_llamada)
		dw_filtro_reporte.f_insertar_fila()
		dw_filtro_reporte.setredraw(TRUE)
		//dw_filtro_reporte.fpr_crea_dddw()
		dw_filtro_reporte.setitem(1,"pa_periodo",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"pa_tipo_incidencia",fgci_todos)
		dw_filtro_reporte.setitem(1,"pa_alcance",fgci_todos)
		dw_filtro_reporte.object.pa_alcance.protect=1
		dw_filtro_reporte.object.pa_alcance.background.color=gs_gris
		dw_filtro_reporte.setitem(1,"pa_tension_afectada",li_tension)
		dw_filtro_reporte.setitem(1,"pa_material_averiado"," ")
		dw_filtro_reporte.setItem(1,"ps_nom_mat_averiado",'<Todos>')
		//dw_filtro_reporte.setitem(1,"pa_int_horario",fgci_todos)
		dw_filtro_reporte.setitem(1,"pa_causa",fgci_todos)
		dw_filtro_reporte.setItem(1,"ps_nom_causa","<Todos>")
		dw_filtro_reporte.setitem(1,"pa_operador_fecha","=")
		dw_filtro_reporte.setitem(1,"rango",1)
		dw_filtro_reporte.setitem(1,"pa_rango",fgnu_fecha_actual())
		st_causa.visible = true
		st_material.visible = true
		
	case "gi_avisos"
		st_titulo.text="Informe de Avisos"
		dw_filtro_reporte.visible=true
		dw_lista_items.fpr_lista_aviso()
		
		long ll_nuevo, ll_ultimo
		// Agregando campo Nro. Incidencia
		ll_ultimo = dw_lista_items.RowCount() + 1
		ll_nuevo = dw_lista_items.InsertRow(0)
		dw_lista_items.setitem(ll_nuevo,"nombre","Nro. Incidencia")
		dw_lista_items.setitem(ll_nuevo,"campo","nro_incidencia")
		dw_lista_items.setitem(ll_nuevo,"tabla","sgd_incidencia")
		dw_lista_items.setitem(ll_nuevo,"join","gi_avisos.NRO_INCIDENCIA = sgd_incidencia.NRO_INCIDENCIA")
		dw_lista_items.setitem(ll_nuevo,"campo_inc","nro_incidencia")
		dw_lista_items.setitem(ll_nuevo,"tipo","S")
		dw_lista_items.setitem(ll_nuevo,"habilitado","")
		// Agregando campo Causa de la Incidencia
		ll_ultimo = dw_lista_items.RowCount() + 1
		ll_nuevo = dw_lista_items.InsertRow(0)
		dw_lista_items.setitem(ll_nuevo,"nombre","Causa de la Incidencia")
		dw_lista_items.setitem(ll_nuevo,"campo","descripcion")
		dw_lista_items.setitem(ll_nuevo,"tabla","gi_causa")
		dw_lista_items.setitem(ll_nuevo,"join","gi_causa.cod_causa = sgd_incidencia.cod_causa")
		dw_lista_items.setitem(ll_nuevo,"campo_inc","descripcion as Causa_Incidencia")
		dw_lista_items.setitem(ll_nuevo,"tipo","S")
		dw_lista_items.setitem(ll_nuevo,"habilitado","")
		
		//Inserto una fila y conecto las DW de los datos por Z. Geo
      dw_filtro_reporte.settransobject(sqlca)
		
		//Conecto las D.D.D.W. DEL OBJETO "FILTRO DEL REPORTE",FILTRO SUS CAMPOS Y SETEO LOS MISMOS CON "TODOS"
		dw_filtro_reporte.reset()
		//dw_filtro_reporte.fnu_cargar_dddw()
		fw_cargar_dddw_avisos()
		dw_filtro_reporte.insertrow(0)
		dw_filtro_reporte.setitem(1,"pa_periodo",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"pa_rango",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"pa_operador_fecha","=")
		dw_filtro_reporte.setitem(1,"ai_estado",fgci_todos)
		dw_filtro_reporte.setitem(1,"ai_alcance",fgci_todos)
		dw_filtro_reporte.setitem(1,"ai_tipo",fgci_todos)
		dw_filtro_reporte.setitem(1,"ai_alimentacion",fgci_todos)
		dw_filtro_reporte.setitem(1,"ai_tipo_aviso",101)
		dw_filtro_reporte.setitem(1,"rango",1)
		dw_filtro_reporte.object.ai_alimentacion.protect=1
		dw_filtro_reporte.object.ai_alimentacion.background.color=gs_gris
	
case "gi_brigada"
	
		st_titulo.text="Informe de Brigadas"
		dw_filtro_reporte.visible=true
		dw_lista_items.fpr_lista_brigada()

		//Inserto una fila y conecto las DW de los datos por Z. Geo
      
		//dw_filtro_reporte.insertrow(0)
		dw_filtro_reporte.reset()
		dw_filtro_reporte.settransobject(sqlca)
		
		//Conecto las D.D.D.W. DEL OBJETO "FILTRO DEL REPORTE",FILTRO SUS CAMPOS Y SETEO LOS MISMOS CON "TODOS"
		
		dw_filtro_reporte.f_insertar_fila()
		dw_filtro_reporte.fpr_crea_dddw()
		dw_filtro_reporte.setitem(1,"pa_periodo",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"ai_estado",99)
		dw_filtro_reporte.setitem(1,"ai_tipo",0)
		//dw_filtro_reporte.setitem(1,"ai_turno",0)
		dw_filtro_reporte.setitem(1,"pa_operador_fecha","=")
		//dw_filtro_reporte.setitem(1,"pa_operador_trab",">=")
		//dw_filtro_reporte.setitem(1,"trab_prev",0)
		dw_filtro_reporte.setitem(1,"rango",1)
		dw_filtro_reporte.setitem(1,"pa_rango",fgnu_fecha_actual())
		
case "sgd_instalacion"
	
		st_titulo.text="Informe de Instalaciones"
		dw_filtro_reporte.visible=true
		dw_lista_items.fpr_lista_instalaciones()
		//Inserto una fila y conecto las DW de los datos por Z. Geo
    
		dw_filtro_reporte.reset()
		dw_filtro_reporte.settransobject(sqlca)
		
		//Conecto las D.D.D.W. DEL OBJETO "FILTRO DEL REPORTE",FILTRO SUS CAMPOS Y SETEO LOS MISMOS CON "TODOS"
		li_tension = f_cargar_ddw_tension(iu_comunic.is_comunic.accion_llamada)
		
		dw_filtro_reporte.f_insertar_fila()
		dw_filtro_reporte.fpr_crea_dddw()
		
		CHOOSE CASE li_tension
			CASE fgci_alta_tension
				ls_filtro = 'tipo_instalacion IN (1,2,3)'
				li_tipo = fgci_tipo_subestacion_at
			CASE fgci_media_tension
				ls_filtro = 'tipo_instalacion IN (4,5)'				
				li_tipo = fgci_tipo_salida_mt
			CASE fgci_baja_tension
				ls_filtro = 'tipo_instalacion IN (6,7,8)'
				li_tipo =  fgci_tipo_transformador
		END CHOOSE
		dw_filtro_reporte.GetChild("ai_tipo",ddw_tipo_tension_t)
		ddw_tipo_tension_t.SetTransObject(SQLCA)
		ddw_tipo_tension_t.retrieve()


		ddw_tipo_tension_t.RowCount()
		ddw_tipo_tension_t.SetFilter(ls_filtro)
		ddw_tipo_tension_t.Filter()
		
		dw_filtro_reporte.setitem(1,"pa_periodo",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"ai_tipo",li_tipo)
		dw_filtro_reporte.setitem(1,'ai_tension',li_tension)
		dw_filtro_reporte.setitem(1,"pa_operador_fecha","=")
		dw_filtro_reporte.setitem(1,"pa_operador_cl",">=")
		dw_filtro_reporte.setitem(1,"pa_operador_cl_imp",">=")
		dw_filtro_reporte.setitem(1,"pa_operador_pot",">=")
		dw_filtro_reporte.setitem(1,"rango",1)
		dw_filtro_reporte.setitem(1,"pa_rango",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"ai_clientes",0)
		dw_filtro_reporte.setitem(1,"ai_clientes_imp",0)
		dw_filtro_reporte.setitem(1,"pn_pot_inst",0)
		
// GNU 3-5-2007. Mejora 1/332338
case "sgd_descargos"
		st_titulo.text="Informe de Descargos"
		dw_filtro_reporte.visible=true
		dw_lista_items.fpr_lista_descargos()

		//Inserto una fila y conecto las DW de los datos por Z. Geo
      
		dw_filtro_reporte.reset()
		dw_filtro_reporte.settransobject(sqlca)
		
		li_tension = f_cargar_ddw_tension(iu_comunic.is_comunic.accion_llamada)
		dw_filtro_reporte.GetChild("ai_interrup",ddw_interrup_descargo_t)
		ddw_interrup_descargo_t.SetTransObject(SQLCA)
		ddw_interrup_descargo_t.retrieve('DE_I')
		
		dw_filtro_reporte.GetChild("ai_estado_descargo",ddw_estado_descargo_t)
		ddw_estado_descargo_t.SetTransObject(SQLCA)
		ddw_estado_descargo_t.Retrieve(fgci_descargo_asociado_bdi)
		
		if fg_verifica_parametro ("descripcion descargos") then
			dw_filtro_reporte.GetChild("ai_descripcion",ddw_descripcion_descargo)
			ddw_descripcion_descargo.SetTransObject(SQLCA)
			ddw_descripcion_descargo.Retrieve()
			ddw_descripcion_descargo.insertrow(1)
			ddw_descripcion_descargo.setitem(1,"descripcion",'<Todos>')
			ddw_descripcion_descargo.setitem(1,"codigo",0)
		ELSE
			dw_filtro_reporte.GetChild("ai_descripcion",ddw_descripcion_descargo)
			ddw_descripcion_descargo.SetTransObject(SQLCA)
			ddw_descripcion_descargo.insertrow(1)
			ddw_descripcion_descargo.setitem(1,"descripcion",'<Todos>')
			ddw_descripcion_descargo.setitem(1,"codigo",0)
		END IF
		
		dw_filtro_reporte.f_insertar_fila()
		
		dw_filtro_reporte.setredraw(TRUE)
		dw_filtro_reporte.fpr_crea_dddw()
		dw_filtro_reporte.setitem(1,"pa_periodo",fgnu_fecha_actual())
		
		dw_filtro_reporte.setitem(1,"ai_alcance",fgci_todos)
		dw_filtro_reporte.setitem(1,"pa_operador_fecha","=")
		dw_filtro_reporte.setitem(1,"rango",1)
		dw_filtro_reporte.setitem(1,"pa_rango",fgnu_fecha_actual())
		dw_filtro_reporte.setitem(1,"ai_duracion",0)
		dw_filtro_reporte.setitem(1,"ai_estado_descargo",fgci_todos)
		dw_filtro_reporte.setitem(1,"tipo_fecha", 1)
		dw_filtro_reporte.setitem(1,"ai_interrup",fgci_todos)
		dw_filtro_reporte.setitem(1,"ai_descripcion",0)
		

		st_causa.visible = false
		st_material.visible = false
		// FIN GNU
end choose

// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
dw_ambito.reset()
dw_ambito.show()
dw_ambito.f_insertar_fila()

//Conecto las DDDW del objeto "ambito"
// filtro todos sus campos y seteo a los mismos con todos

dw_ambito.fpr_crea_dddw()
dw_ambito.fnu_insertar_datos(gi_nro_centro,gi_nro_cmd, gi_nro_puesto,0)


//dw_ambito.fnu_filtro_centro()
//dw_ambito.setitem(1,"nro_centro",fgci_todos)
//dw_ambito.fpr_filtro_cmd()
//dw_ambito.setitem(1,"nro_cmd",fgci_todos)
//dw_ambito.fpr_filtro_mesa()
//dw_ambito.setitem(1,"nro_mesa",fgci_todos)
//
////dw_ambito.fnu_deshab_cmd(dw_ambito)
//dw_ambito.fnu_deshab_puesto(dw_ambito)
//dw_ambito.setcolumn("nro_centro")
p_1.visible=true

ii_filas_seleccionadas = 0  // no hay filas seleccionadas (LFE)

setpointer(Arrow!)

end event

event ue_limpiar_ventana();///////////////////////////////////////////////////////
//										
// Evento: ue_limpiar_ventana
// 
// Objetivo: Resetea la ventana
//	
//
// Responsables:  FDB -. Frank
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

dw_1.visible=false
sle_1.visible=false
ii_filas_seleccionadas = 0

TRIGGEREVENT("UE_POST_OPEN")
end event

event ue_imprimir;///////////////////////////////////////////////////////
//										
// Evento: ue_imprimir
// 
// Objetivo: Imprime el Reporte
//	
//
// Responsables:  FDB -. Frank
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
//	string ls_campo
//	dw_1.Object.datawindow.Footer.Height=113
//	ls_campo= dw_1.Describe("DataWindow.Syntax") + "~r~ncompute(band=footer alignment='0' expression=''Pagina ' + page() + ' de ' + pageCount()'border='0' color='553648127' x='2583' y='16' height='89' width='823' format='[general]'  name=cc_num_paginas  font.face='Arial' font.height='-11' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='16777215' )"
//	dw_1.create(ls_campo)
	this.str_print.dwprint=dw_1
	this.str_print.titulo=st_titulo.text
	this.str_print.PARM1=true
	OpenWithParm(w_print_dialog,this.str_print)
//	dw_1.modify("destroy cc_num_paginas")
//	dw_1.Object.datawindow.Footer.Height=1
end event

event ue_seleccionar_todo();int li_conta
for li_conta=1 to dw_lista_items.rowcount()
	dw_lista_items.selectrow(li_conta,true)
next
if gu_perfiles.of_acceso_perfil(gi_perfil,'REPORTES_P','ACC_MANTEN')=1 then 
	m_reportes_2.m_rep.m_mostrar.enabled=TRUE
end if
ii_filas_seleccionadas=dw_lista_items.rowcount()
m_reportes_2.m_reporte.m_guardar.m_preferencia1.enabled=true
m_reportes_2.m_rep.m_mostrar.enabled=TRUE

end event

event ue_deseleccionar_todo();int li_conta
long ll_fila

for li_conta=1 to dw_lista_items.rowcount()
	dw_lista_items.selectrow(li_conta,false)
	ll_fila = dw_lista_orden.Find("nombre = '"+dw_lista_items.GetItemString(li_conta,"nombre")+"'" ,0, dw_lista_orden.RowCount()) //LFE
	IF ll_fila > 0 THEN // si el campo tambi$$HEX1$$e900$$ENDHEX$$n estaba en dw_lista_orden, se elimina de $$HEX1$$e900$$ENDHEX$$sta (LFE)
		dw_lista_orden.DeleteRow(ll_fila)    // LFE
	END IF											 // LFE
	// Si el campo tiene una funci$$HEX1$$f300$$ENDHEX$$n asociada, se le quita $$HEX1$$e900$$ENDHEX$$sta  (LFE)
	if dw_lista_items.GetItemString(li_conta,"funcion") <> "" or &         
		not isnull(dw_lista_items.getitemstring(li_conta,"funcion")) then   // LFE
		dw_lista_items.setitem(li_conta,"funcion","")							  // LFE	
		dw_lista_items.setitem(li_conta,"parentesis","")						  // LFE 	
		ib_funcion=FALSE																	  // LFE	
	end if																					  // LFE
next
m_reportes_2.m_rep.m_mostrar.enabled=false
//ii_filas_seleccionadas=dw_lista_items.rowcount()
ii_filas_seleccionadas = 0  // no hay filas seleccionadas (LFE)
m_reportes_2.m_reporte.m_guardar.m_preferencia1.enabled=false

end event

event ue_exportar_excel();///////////////////////////////////////////////////////
//										
// Evento: ue_exportar_excel
// 
// Objetivo: Script para exportar el contenido de un informe generado a un 
//				 fichero con formato Excel 
//	
//
// Responsable:  LFE
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//  LFE
//
///////////////////////////////////////////////////////

int li_columnas, li_contador, li_tama$$HEX1$$f100$$ENDHEX$$o, li_letra, li_contador_excel
string ls_cabecera, ls_nombre, ls_nombre_archivo, rfilename
boolean lb_existe

string docname, named
integer value


// consultamos si hay datos que exportar a Excel. Si no hay no se genera fichero
IF dw_1.rowcount() = 0 THEN
	gnv_msg.F_MENSAJE("AP09","","",ok!)
ELSE
	//LLH INI INCIDECNIA DEO13-00000210 15/03/2013
	// El informe tiene datos
	
	li_columnas = dw_lista_items.rowcount()
	li_contador_excel = 1
	// En este bucle se corrige un problema que se produce al exportar: el nombre de las 
	// cabeceras que la funci$$HEX1$$f300$$ENDHEX$$n SaveAs a$$HEX1$$f100$$ENDHEX$$ade en el fichero Excel es el nombre del campo de 
	// la tabla. Tiene que ser un nombre m$$HEX1$$e100$$ENDHEX$$s descriptivo para el usuario, as$$HEX2$$ed002000$$ENDHEX$$que se coge
	// como nombres de cabecera los textos de la dw dw_lista_items. Este texto hay que 
	// ponerlo en la propiedad dbname
	FOR li_contador = 1 TO li_columnas
		IF dw_lista_items.GetSelectedRow(li_contador -1) = li_contador THEN
			ls_nombre = dw_lista_items.getitemstring(li_contador,'nombre')
			li_tama$$HEX1$$f100$$ENDHEX$$o = len(ls_nombre)
			ls_cabecera=""
			FOR li_letra=1 TO li_tama$$HEX1$$f100$$ENDHEX$$o
				// En este bucle se quitan los posibles caracteres de '.' que aparezcan en el
				// nombre de la cabecera que se ha obtenido de la dw dw_lista_items, ya que 
				// en caso de existir alguno, este texto no lo admitir$$HEX2$$e1002000$$ENDHEX$$la propiedad dbname
				IF Mid(ls_nombre, li_letra, 1) <> "." THEN
					ls_cabecera = ls_cabecera + Mid(ls_nombre, li_letra, 1)
				END IF
			NEXT
			// Se cambia la propiedad dbname
			//messagebox(ls_cabecera,dw_1.describe("#"+string(li_contador)+".dbName"))
			dw_1.modify("#"+string(li_contador_excel)+".dbName="+"'"+ls_cabecera+"'")
			li_contador_excel ++
		END IF
	NEXT
//LLH FIN INCIDECNIA DEO13-00000210 15/03/2013
	// Se obtiene el nombre del fichero donde el usuario quiere exportar el informe
	//IF GetFileSaveName( "", ls_nombre_archivo, rfilename ,"xls","Excel(*.xls),*.xls" ) = 1 THEN 
	// Se comprueba si existe el fichero
	
//value = GetFileSaveName("Guardar Archivo", docname, named, "XLS", "Excel Files (*.xls),*.xls,"+  "Excel Files (*.xlsx),*.xlsx," + " Excel Files (*.XLS), *.XLS")
		
//		value = GetFileSaveName("Guardar datos como ...", docname, named, "XLSX", "Microsoft Excel (* .XLSX), * .XLSX,")
//		dw_1.SaveAs(docname, Excel5! , TRUE)
//		lb_existe = FileExists(docname)
		
         //dw_1.Saveas(docname, Excel!, TRUE);
			
		
    
        // lb_existe = FileExists(docname)
		
		//IF lb_existe THEN 
		IF dw_1.SaveAs(docname, Excel!, true)	= -1 THEN
			//Se confirmar que quiere grabar el fichero que ya existe
			//IF gnv_msg.F_MENSAJE("CP04",ls_nombre_archivo,"",YesNo!) = 1 THEN //$$HEX1$$bf00$$ENDHEX$$Sobreescribir el fichero ya existente?
			//HLA.INI.DDAG-4287.02/12/2015.Se exporta en modo AsCii para que no recorte los caracteres
				//IF dw_1.SaveAs (ls_nombre_archivo, Excel!, false)	= -1 THEN
				//IF dw_1.SaveAsAscii(ls_nombre_archivo, '~t') = -1 THEN
			//HLA.FIN.DDAG-4287.02/12/2015.
					//gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
				//END IF
			//END IF 
			//dw_1.SaveAs(docname, Excel5! , TRUE)
			messagebox("Atencion","El Archivo no ha sido guardado", Information!)
		ELSE
			//LLH INI INCIDECNIA DEO13-00000210 15/03/2013
		  //	IF dw_1.SaveAs(ls_nombre_archivo, Excel!, false)	= -1 THEN
		  //HLA.INI.DDAG-4287.02/12/2015.Se exporta en modo AsCii para que no recorte los caracteres
			//IF dw_1.SaveAs(ls_nombre_archivo, Excel!, true)	= -1 THEN
			//IF dw_1.SaveAsAscii(ls_nombre_archivo, '~t') = -1 THEN
			//IF dw_1.SaveAsAscii(named, '~t') = -1 THEN
		  //HLA.FIN.DDAG-4287.02/12/2015.
				//LLH INI INCIDECNIA DEO13-00000210 15/03/2013
				//gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
			//else
				//dw_1.SaveAs(docname, Excel5! , TRUE)
				
				messagebox("Atencion","El Reporte se ha exportado Correctamente", Information!)
				
		//END IF
		END IF
END IF
//END IF



end event

public function integer f_preparo_datawindow (datawindow pd_data, string ps_nombres[]);///////////////////////////////////////////////////////
//										
// Funcion: f_preparo_datawindow
// 
// Objetivo: Establece cabeceras, Bordes y Colores 
//           de la Datawindow
//	
//
// Responsable: FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_data
//					ps_nombres[]
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_colcount,ls_nombre,ls_nombre2,ls_nombre3
int li_n,li_f
string ls_nombtrucho,ls_nombre_pos,LS_NOMBRE4
integer li_conta2=1
long ll_posicion,LL_TAMA$$HEX1$$d100$$ENDHEX$$O
long ll_contador=0

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_data.Modify("DataWindow.Color='12632256'")
pd_data.Modify("DataWindow.Color='81324524'")
// Fin. Sgo.
ls_colcount = dw_1.Object.DataWindow.Column.Count
li_f=integer(ls_colcount)
for li_n=1 to li_f
	ls_nombtrucho="cgener" + string(li_conta2)
	ls_colcount= "#" + string(li_n) + ".name"
	ls_nombre = dw_1.Describe(ls_colcount)
	dw_1.Modify(ls_nombre + ".color=" + string(65536*128))
	if iu_5001_nu.ib_hay = true then
		if li_n=iu_5001_nu.ii_array_pos[li_conta2] then
			ls_nombre_pos= ls_nombtrucho + "_t.X"
			LS_NOMBRE4=ls_nombtrucho + "_t.Width"
			LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))
			ls_nombre4=ls_nombtrucho + "_t.Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o + 80)
			dw_1.Modify(ls_nombre4)
			ll_posicion=long(pd_data.describe(ls_nombre_pos))
			LS_nombre2=ls_nombtrucho + "_t.border='6'"
         LS_nombre3=ls_nombtrucho + "_t.Font.weight ='600'"
			if li_conta2< iu_5001_nu.ii_maximo then
				li_conta2++
			end if
		else	
			LS_NOMBRE4=ls_nombre + "_t.Width"
			LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))   
			ls_nombre4=ls_nombre + "_t.Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o + 80)
			dw_1.Modify(ls_nombre4)	
			ls_nombre2= ls_nombre + "_t.Border='6'"
			LS_nombre3=ls_nombre + "_t.Font.weight ='600'"
			ls_nombre_pos=ls_nombre + "_t.X"
			ll_posicion=long(pd_data.describe(ls_nombre_pos))
	
		END IF

	else
		LS_NOMBRE4=ls_nombre + "_t.Width"
		LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))
		ls_nombre4=ls_nombre + "_t.Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o + 80)
		dw_1.Modify(ls_nombre4)
		LS_nombre3=ls_nombre + "_t.Font.weight ='600'"
		ls_nombre2= ls_nombre + "_t.Border='6'"
		ls_nombre_pos=ls_nombre + "_t.X"
		ll_posicion=long(pd_data.describe(ls_nombre_pos))
	end if
	dw_1.Modify(ls_nombre2)
	dw_1.Modify(ls_nombre3)

	if ll_posicion<>0 then
		long ll
		//LS_NOMBRE4=ls_nombre + ".Width"
		//LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))
		//ll = long(pd_data.describe(ls_NOMBRE + "_t.Width"))
		ls_nombre4=ls_nombre + ".Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o+80)
		dw_1.Modify(ls_nombre4)
		ls_nombre_pos= ls_nombre_pos + "=" + string(ll_posicion + ll_contador) 
		ls_nombre_pos=pd_data.modify(ls_nombre_pos)
		ls_nombre=ls_nombre + ".X=" + string(ll_posicion + ll_contador)   
		ls_nombre_pos=pd_data.modify(ls_nombre)

	end if
	ll_contador= ll_contador + 100
next
if iu_5001_nu.ib_hay = true then
	for li_n=1 to li_conta2
		iu_5001_nu.ii_array_pos[li_n]=0
		iu_5001_nu.ib_hay=false
	next
END IF
return 1

end function

public function boolean fnu_cambio_nombres (string ps_campos[], string ps_nombres[], integer numero, datawindow pd_data);
///////////////////////////////////////////////////////
//										
// Funcion: fnu_cambio_nombres
// 
// Objetivo: Repara los nombres de las cabeceras de la
// Datawindow DW_1 y Ajusta el tama$$HEX1$$f100$$ENDHEX$$o y posicion de las 
// cabeceras
//	
//
// Responsable: FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_campos[]
// 				ps_nombres[]
//					numero
//					pd_data
//		Salida : Boolean 
//					True - Si ocurrio
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////
string cad


int li_contador
STRING LS_CAMPOS
string ls_nombtrucho
integer li_conta2=1
long ll_largo_col
long ll_largo_col_antigua
long ll_sumas
long ll_sumastemp=0
string ls_size_cab,setting
string ls_size_col
string ls_nom_col
string ls_nom_col_antigua
string ls_synt_columna
string ls_larg_campos

pd_data.Modify("DataWindow.Header.Height='135'")
/////Compruebo si hay algun campo con join; si no hay ninguno el cabroncete de 
// powerbuilder no coloca una c delante de el nombre del campo en la sintaxis de la DW

for li_contador=1 to numero

	ls_nombtrucho="cgener" + string(li_conta2) + "_t"
	///Rutina para calcular el largo que debe tener el campo
	ll_largo_col=len(ps_nombres[li_contador])*32
	///rutina para averiguar el nombre de la columna
	ls_nom_col= "#" + string(li_contador) + ".name"
	

	ls_nom_col=pd_data.describe(ls_nom_col)
	cad=ls_nom_col	
	///	

	if iu_5001_nu.ib_hay = true then
		
		if li_contador=iu_5001_nu.ii_array_pos[li_conta2] then
			ls_size_cab= ls_nombtrucho + ".Width=" + string(ll_largo_col) //tama$$HEX1$$f100$$ENDHEX$$o
			LS_CAMPOS=ls_nombtrucho + ".text =' " + upper(ps_nombres[li_contador]) + "' "
			ls_nom_col_antigua=ls_nombtrucho + ".Width"
			ll_largo_col_antigua=long(pd_data.Describe(ls_nom_col_antigua))
			//ls_larg_campos=ls_nombtrucho + ".X="
			ls_larg_campos="c" + ps_campos[li_contador] + "_t" + ".X=" //lfe
			if li_conta2< iu_5001_nu.ii_maximo then
				li_conta2++
			end if
		else
			ls_size_cab= "c" + ps_campos[li_contador] + "_t" + ".Width=" + string(ll_largo_col)//tama$$HEX1$$f100$$ENDHEX$$o
			//LS_CAMPOS="c" + ps_campos[li_contador] + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' "
			LS_CAMPOS=ls_nom_col + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' " //LFE
			ls_nom_col_antigua="c" + ps_campos[li_contador] + "_t" + ".Width"
			ll_largo_col_antigua=long(pd_data.Describe(ls_nom_col_antigua))
			ls_larg_campos="c" + ps_campos[li_contador] + "_t" + ".X="
		end if
	else
			ls_size_cab= "c" + ps_campos[li_contador] + "_t" + ".Width=" + string(ll_largo_col)//tama$$HEX1$$f100$$ENDHEX$$o
			//LS_CAMPOS="c" + ps_campos[li_contador] + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' "
			LS_CAMPOS=ls_nom_col + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' "  //LFE
			ls_nom_col_antigua="c" + ps_campos[li_contador] + "_t" + ".Width"
			ll_largo_col_antigua=long(pd_data.Describe(ls_nom_col_antigua))
			ls_larg_campos="c" + ps_campos[li_contador] + "_t" + ".X="
	end if
	pd_data.Modify(ls_nom_col + "_t" + ".height='104'")
	pd_data.Modify(LS_CAMPOS)
	
	if ll_largo_col_antigua < ll_largo_col then
		pd_data.Modify(ls_size_cab)
		ls_synt_columna=ls_nom_col + ".Width=" + string(ll_largo_col) 
		pd_data.Modify(ls_synt_columna)
		ll_sumas=ll_sumas + ll_largo_col
	else
		ll_sumas=ll_sumas + ll_largo_col_antigua
	end if
		ls_larg_campos = ls_larg_campos + string(ll_sumastemp)
		pd_data.Modify(ls_larg_campos)
 		ls_synt_columna=ls_nom_col + ".X=" + string(ll_sumastemp) 
		pd_data.Modify(ls_synt_columna)
		ll_sumastemp=ll_sumas
	next

return true

end function

public function integer f_preparo_ventana ();///////////////////////////////////////////////////////
//										
// Funcion: f_preparo_ventana
// 
// Objetivo: Resetea la ventana
//	
//
// Responsable: FDB -. Frank
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
uo_menu.visible=false
timer(0)
w_reportes_avisos_incidencias_2.setredraw(false)

st_1.visible=true
st_2.visible=true
st_3.visible=true
dw_funciones.visible=true
dw_lista_items.visible=true
dw_lista_orden.visible=true
st_titulo.visible=true
dw_filtro_reporte.visible=true
dw_lista_items.reset()
mle_1.text=""
sle_1.text=""
dw_1.reset()
dw_lista_orden.reset()
dw_1.visible=false
m_reportes_2.m_reporte.m_guardar.enabled=false
m_reportes_2.m_rep.m_mostrar.enabled=false
//m_reportes.m_reporte.m_guardar.toolbaritemvisible=false
//m_reportes.m_rep.m_mostrar.toolbaritemvisible=false
//m_reportes.m_rep.m_presentacionpreliminar.toolbaritemvisible=false
m_reportes_2.m_reporte.m_imprimir.enabled=false
m_reportes_2.m_reporte.m_guardar.m_reporte2.enabled=false
m_reportes_2.m_reporte.m_guardar.m_preferencia1.enabled=false
m_reportes_2.m_rep.m_cancelar.enabled=true
m_reportes_2.m_rep.m_presentacionpreliminar.enabled=false
m_reportes_2.m_rep.m_exportarinformeaexcel.enabled = false
//m_reportes.m_reporte.m_imprimir.toolbaritemvisible=false
//m_reportes.m_reporte.m_guardar.m_reporte2.toolbaritemvisible=false
//m_reportes.m_reporte.m_guardar.m_preferencia1.toolbaritemvisible=false
//m_reportes.m_rep.m_cancelar.toolbaritemvisible=true
//m_reportes.m_rep.m_seleccionartodo.toolbaritemvisible=true
//m_reportes.m_rep.m_seleccionartodo.enabled=true
dw_ambito.visible=false
dw_filtro_reporte.reset()
sle_1.visible=false
st_titulo.text=""
w_reportes_avisos_incidencias_2.setredraw(true)
return 1
end function

public function string fw_preparar_archivo ();///////////////////////////////////////////////////////
//										
// Funcion: fw_preparar_archivo
// 
// Objetivo: Codifica Archivo de preferencias
//	
//
// Responsable: FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : String con archivo de preferencias
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

INT LI_CONTADOR, li_conta2
STRING LS_CAMPOS="" ,LS_FUNCIONES, LS_ORDEN ,ls_asdes ,ls_arch, ls_filtro, ls_ambito

FOR LI_CONTADOR=0 TO DW_LISTA_ITEMS.ROWCOUNT()
	if dw_lista_items.isselected(li_CONTADOR) then
		ls_CAMPOS=LS_CAMPOS + string(LI_CONTADOR) + ","
		if dw_lista_items.GETITEMSTRING(LI_CONTADOR,"FUNCION")<>"" THEN
			LS_FUNCIONES=string(li_contador) + "," + dw_lista_items.GETITEMSTRING(LI_CONTADOR,"FUNCION")
		end if
	END IF
NEXT

if DW_LISTA_orden.ROWCOUNT() <>0 then
	FOR LI_CONTADOR=1 TO DW_LISTA_orden.ROWCOUNT()
		ls_asdes= ls_asdes + string(dw_lista_orden.GETITEMnumber(LI_CONTADOR,"TIPO")) + ","
		FOR LI_CONTA2=1 TO DW_LISTA_items.ROWCOUNT()
			if dw_lista_items.isselected(li_CONTA2) then
				if dw_lista_items.GETITEMSTRING(LI_CONTA2,"nombre") = dw_lista_orden.GETITEMSTRING(LI_CONTADOR,"nombre") then
					ls_orden=ls_orden + string(li_conta2) + ","
				end if
			end if
		next
	next
end if

// Grabar Datawindows de Filtros
dw_filtro_reporte.accepttext()
ls_filtro= dw_filtro_reporte.Object.DataWindow.Data

// Grabar Datawindows de ambito
dw_ambito.accepttext()
ls_ambito= dw_ambito.Object.DataWindow.Data



	
ls_arch = iu_comunic.is_comunic.accion_llamada + "?Campos#" + LS_CAMPOS + "#Funciones~$$HEX1$$a400$$ENDHEX$$" + ls_funciones + "~$$HEX1$$a400$$ENDHEX$$Ordenes~$$HEX1$$a500$$ENDHEX$$" & 
+ ls_orden + "~$$HEX1$$a500$$ENDHEX$$Ascdes~$$HEX1$$de00$$ENDHEX$$" + ls_asdes + "~$$HEX1$$de00$$ENDHEX$$ambito!" + ls_ambito + "!filtro@" + ls_filtro 

RETURN ls_arch
end function

public function integer f_interpretar_archivo (ref string ps_contenido);///////////////////////////////////////////////////////
//										
// Funcion: f_interpretar_archivo
// 
// Objetivo: Decodifica el archivo de preferencia
//	
//
// Responsable: FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_contenido 
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




//////////////////////////////////////////////////////////////////////////////
/// INTERPRETACION DE LOS ARCHIVOS DE PREFERENCIAS
//////////////////////////////////////////////////////////////////////////////

w_reportes_avisos_incidencias_2.SETREDRAW(FALSE)

//// DEFINICION DE VARIABLES
string ls_tiporep,ls_campo, ls_funcion, ls_funpos , ls_campoorden, ls_tablas
long ll_posicion,ll_posicion_siguiente,ll_posicion_fin,ll_recibo
long ll_contador=0
int li_alcance
// RECOGEMOS EL TIPO DE REPORTE
ll_posicion=pos(ps_contenido,"?")
ls_tiporep=mid(ps_contenido,1,ll_posicion - 1)

//IF (ls_tiporep = 'sgd_incidencia' or ls_tiporep = 'sgd_reenganches') THEN
//	li_alcance = dw_filtro_reporte.GetItemNumber(1,'pa_alcance')
//	IF li_alcance = fgci_incidencia_reenganche THEN
//		ls_tablas = 'sgd_reenganches'	
//	ELSE
//		ls_tablas = 'sgd_incidencia'
//	END IF
//END IF
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
IF (ls_tiporep = 'sgd_incidencia' or ls_tiporep = 'sgd_reenganches') AND fg_verifica_parametro("w_reportes_new") THEN
	SetPointer(HourGlass!)
	fileclose(ii_numfich)
	IF ls_tiporep = 'sgd_incidencia' THEN
		OpenSheetWithParm(w_reportes_new,"sgd_incidencia",W_operaciones,3,Original!)
	ELSE  
		OpenSheetWithParm(w_reportes_new,"sgd_reenganches",W_operaciones,3,Original!)		
	END IF
	IF ib_abrir = true THEN
		w_reportes_new.trigger event ue_abrir_pref (is_contenido)
	ELSE 
		w_reportes_new.trigger event ue_abrir_reporte (is_contenido)
	END IF
	close(this)
	return 2
ELSE
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
IF ls_tiporep <> iu_comunic.is_comunic.accion_llamada THEN
	IF ls_tiporep = 'gi_avisos' THEN
		ls_tiporep = ' avisos'
	ELSEIF ls_tiporep = 'gi_brigada' THEN
		ls_tiporep = ' brigadas'
	ELSEIF ls_tiporep = 'sgd_instalacion' THEN
		ls_tiporep = ' instalaciones'
	ELSEIF ls_tiporep = 'sgd_reenganches' THEN
		ls_tiporep = ' reenganches'
	ELSEIF ls_tiporep = 'sgd_incidencia' THEN
		ls_tiporep = ' incidencias'
	END IF
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Este informe no se puede abrir desde aqu$$HEX2$$ed002000$$ENDHEX$$puesto que se trata de un informe de"+ls_tiporep)
	return 0
END IF	
	// CARGAMOS EL MODO DE REPORTE
//	iu_comunic.is_comunic.accion_llamada=ls_tiporep
	triggerevent("ue_post_open")
	
	// RECOGEMOS LOS CAMPOS QUE ESTABAN MARCADOS Y LOS MARCAMOS
	ll_posicion=pos(ps_contenido,"#",ll_posicion)
	ll_posicion_fin=pos(ps_contenido,"#",ll_posicion+1)
	do while (ll_posicion < ll_posicion_fin and ll_posicion<>0)
			ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
		if (ll_posicion_siguiente < ll_posicion_fin and ll_posicion_siguiente <> 0) then	
			ls_campo=mid(ps_contenido,ll_posicion + 1,ll_posicion_siguiente - (ll_posicion + 1))
			dw_lista_items.SelectRow(long(ls_campo),true)
		end if
		ll_posicion=ll_posicion_siguiente
	loop
	
	// RECOGEMOS LAS FUNCIONES Y LAS INCLUIMOS
	ll_posicion=0
	ll_posicion_siguiente=0
	ll_posicion_fin=0
	ll_posicion=pos(ps_contenido,"~$$HEX1$$a400$$ENDHEX$$")
	ll_posicion_fin=pos(ps_contenido,"~$$HEX1$$a400$$ENDHEX$$",ll_posicion+1)
	ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
	if ((ll_posicion + 1) <> ll_posicion_fin) then //si habia alguna funcion aplicada
		ls_funpos=mid(ps_contenido,ll_posicion + 1,ll_posicion_siguiente - (ll_posicion + 1))
		ls_funcion=mid(ps_contenido,ll_posicion_siguiente + 1, 4)
		dw_lista_items.setitem(long(ls_funpos),"funcion",ls_funcion)
		dw_lista_items.setitem(long(ls_funpos),"parentesis",")")
	end if
	
	// RECOGEMOS LOS CRITERIOS DE ORDENACION
	ll_posicion=pos(ps_contenido,"~$$HEX1$$a500$$ENDHEX$$")
	ll_posicion_fin=pos(ps_contenido,"~$$HEX1$$a500$$ENDHEX$$",ll_posicion+1)
	if ((ll_posicion + 1) <> ll_posicion_fin) then //si habia algun criterio
		do while (ll_posicion < ll_posicion_fin and ll_posicion<>0)
			ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
			if (ll_posicion_siguiente < ll_posicion_fin and ll_posicion_siguiente <> 0) then	
				ls_campo=mid(ps_contenido,ll_posicion + 1,ll_posicion_siguiente - (ll_posicion + 1))
				ls_campoorden=dw_lista_items.getitemstring(long(ls_campo),"nombre")
				dw_lista_orden.insertrow(0)
				dw_lista_orden.setitem(dw_lista_orden.rowcount(),"nombre",ls_campoorden)
				dw_lista_orden.setitem(dw_lista_orden.rowcount(),"campo",&
					dw_lista_items.getitemstring(long(ls_campo),"campo_inc"))
			end if
			ll_posicion=ll_posicion_siguiente
		loop
	end if
	
	// RECOGEMOS CRITERIOS DE ORDENACION ASCENDENTE-DESCENTE
	ll_posicion=pos(ps_contenido,"~$$HEX1$$de00$$ENDHEX$$")
	ll_posicion_fin=pos(ps_contenido,"~$$HEX1$$de00$$ENDHEX$$",ll_posicion+1)
	do while (ll_posicion < ll_posicion_fin and ll_posicion<>0)
		ll_contador++
			ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
		if (ll_posicion_siguiente < ll_posicion_fin and ll_posicion_siguiente <> 0) then	
			ls_campo=mid(ps_contenido,ll_posicion + 1,ll_posicion_siguiente - (ll_posicion + 1))
			dw_lista_orden.setitem(ll_contador,"tipo",long(ls_campo))
		end if
		ll_posicion=ll_posicion_siguiente
	loop
	
	
	// Recogemos los Datos de Ambito
	dw_ambito.reset()
	ll_posicion=pos(ps_contenido,"!")
	ll_posicion_fin=pos(ps_contenido,"!",ll_posicion+1)
	ls_campo=mid(ps_contenido,ll_posicion + 1, ll_posicion_fin - (ll_posicion + 1))
	ll_recibo=dw_ambito.Importstring(ls_campo,1)
	// iNCLUIR MENSAGE
	
	// Recogemos los datos de la datawindows de ambito
	ll_posicion=pos(ps_contenido,"filtro@") + 6
	ls_campo=right(ps_contenido,len(ps_contenido)-ll_posicion)
	CHOOSE CASE iu_comunic.is_comunic.accion_llamada
		CASE "sgd_incidencia", "sgd_reenganches"
			dw_filtro_reporte.reset()
			ll_recibo=dw_filtro_reporte.Importstring(ls_campo,1)
//			dw_filtro_reporte.setitem(1,"pa_periodo",today())
			//incluir mensage
		CASE "gi_avisos"
			dw_filtro_reporte.reset()
			ll_recibo=dw_filtro_reporte.Importstring(ls_campo,1) 
//			dw_filtro_reporte.setitem(1,"pa_periodo",today())
			//INCLUIR MENSAGE
		CASE "gi_brigada"
			dw_filtro_reporte.reset()
			ll_recibo=dw_filtro_reporte.Importstring(ls_campo,1) 
//			dw_filtro_reporte.setitem(1,"pa_periodo",today())
			//INCLUIR MENSAGE
		CASE "sgd_instalacion"
			dw_filtro_reporte.reset()
			ll_recibo=dw_filtro_reporte.Importstring(ls_campo,1) 
//			dw_filtro_reporte.setitem(1,"pa_periodo",today())
	//		//INCLUIR MENSAGE
	END CHOOSE
	w_reportes_avisos_incidencias_2.setredraw(true)
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
END IF
//***************************************
//**  OSGI 2001.1  	01/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


return 1

end function

public function integer f_ventana_vacia ();///////////////////////////////////////////////////////
//										
// Funcion: f_ventana_vacia 
// Objetivo: Prepara la ventana para el open
//	
//
// Responsable: FDB -. Frank
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

st_1.visible=false
st_2.visible=false
st_3.visible=false
dw_funciones.visible=false
dw_lista_items.visible=false
dw_lista_orden.visible=false
st_titulo.visible=false
dw_filtro_reporte.visible=false
dw_ambito.visible=false
sle_1.visible=false
//p_1.visible=false

m_reportes_2.m_reporte.m_imprimir.enabled=false
m_reportes_2.m_reporte.m_guardar.m_reporte2.enabled=false
m_reportes_2.m_reporte.m_guardar.m_preferencia1.enabled=false
m_reportes_2.m_rep.m_cancelar.enabled=false

//m_reportes.m_rep.m_seleccionartodo.enabled=false
//m_reportes.m_reporte.m_imprimir.toolbaritemvisible=false
//m_reportes.m_reporte.m_guardar.m_reporte2.toolbaritemvisible=false
//m_reportes.m_reporte.m_guardar.m_preferencia1.toolbaritemvisible=false
//m_reportes.m_rep.m_cancelar.toolbaritemvisible=false
//m_reportes.m_rep.m_seleccionartodo.toolbaritemvisible=false
timer(0.5)
return 1
end function

public function integer f_visulizar_ventana ();///////////////////////////////////////////////////////
//										
// Funcion: f_visualizar_ventana
// 
// Objetivo: Visualiza los objetos de la ventana
//	
//
// Responsable: FDB -. Frank
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

uo_menu.visible=false
timer(0)
st_1.visible=true
st_2.visible=true
st_3.visible=true
dw_funciones.visible=true
dw_lista_items.visible=true
dw_lista_orden.visible=true
st_titulo.visible=true
dw_filtro_reporte.visible=true
return 1
end function

public function integer f_deshabilitar ();///////////////////////////////////////////////////////
//		  								
// Funcion: f_deshabilitar	
// 
// Objetivo: Deshabilita todo cuando abres un reporte 
//	
//
// Responsable: FDB -. Frank
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

int li_cont

dw_ambito.fnu_deshab_centro(dw_ambito)
dw_ambito.fnu_deshab_cmd(dw_ambito)
dw_ambito.fnu_deshab_puesto(dw_ambito)
dw_funciones.enabled=false
ib_habilitado = False
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//dw_lista_orden.modify("tipo.background.color=" + string(65536*192+256*192+192))
dw_lista_orden.modify("tipo.background.color=" + gs_gris)
// Fin. Sgo.
dw_lista_orden.SetTabOrder("nombre",0)
dw_lista_orden.SetTabOrder("tipo",0)
choose case is_tabla_consulta
	case "sgd_incidencia"	
		 dw_filtro_reporte.enabled=false
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		 dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*192+256*192+192))
//       dw_filtro_reporte.modify("pa_tipo_incidencia.background.color=" + string(65536*192+256*192+192))
//       dw_filtro_reporte.modify("pa_tension_afectada.background.color=" + string(65536*192+256*192+192))
//       dw_filtro_reporte.modify("pa_material_averiado.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_centro.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_causa.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("rango.background.color=" + string(65536*192+256*192+192))
//		 dw_filtro_reporte.modify("pa_rango.background.color=" + string(65536*192+256*192+192))

		 dw_filtro_reporte.modify("pa_periodo.background.color=" + gs_gris)
       dw_filtro_reporte.modify("pa_tipo_incidencia.background.color=" + gs_gris)
       dw_filtro_reporte.modify("pa_tension_afectada.background.color=" + gs_gris)
       dw_filtro_reporte.modify("pa_material_averiado.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_centro.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_causa.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("rango.background.color=" + gs_gris)
		 dw_filtro_reporte.modify("pa_rango.background.color=" + gs_gris)
// Fin. Sgo.
	case "gi_avisos"
		
		dw_filtro_reporte.enabled=false
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		dw_filtro_reporte.modify("ai_estado.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("ai_tipo.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("ai_tipo_aviso.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("ai_alcance.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("ai_alimentacion.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("ai_duracion.background.color=" + string(65536*192+256*192+192))
//	  	dw_filtro_reporte.modify("xx.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("ai_reg_seleccionados.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*192+256*192+192))
//		dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*192+256*192+192))
//	   dw_filtro_reporte.modify("rango.background.color=" + string(65536*192+256*192+192))
//		dw_filtro_reporte.modify("pa_rango.background.color=" + string(65536*192+256*192+192))

		dw_filtro_reporte.modify("ai_estado.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("ai_tipo.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("ai_tipo_aviso.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("ai_alcance.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("ai_alimentacion.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("ai_duracion.background.color=" + gs_gris)
	  	dw_filtro_reporte.modify("xx.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("ai_reg_seleccionados.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + gs_gris)
		dw_filtro_reporte.modify("pa_periodo.background.color=" + gs_gris)
	   dw_filtro_reporte.modify("rango.background.color=" + gs_gris)
		dw_filtro_reporte.modify("pa_rango.background.color=" + gs_gris)
// Fin. Sgo.
	case "gi_brigada"
		
		 dw_filtro_reporte.enabled=true
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		 dw_filtro_reporte.modify("ai_estado.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("ai_tipo.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("rango.background.color=" + string(65536*192+256*192+192))
//		 dw_filtro_reporte.modify("pa_rango.background.color="  + string(65536*192+256*192+192))
//		 dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*192+256*192+192))

		 dw_filtro_reporte.modify("ai_estado.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("ai_tipo.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("rango.background.color=" + gs_gris)
		 dw_filtro_reporte.modify("pa_rango.background.color="  + gs_gris)
		 dw_filtro_reporte.modify("pa_periodo.background.color=" + gs_gris)
// Fin. Sgo.
case "sgd_instalacion"
		
		 dw_filtro_reporte.enabled=true
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		 dw_filtro_reporte.modify("ai_tension.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("ai_tipo.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_operador_cl.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("ai_clientes.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_operador_cl_imp.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("rango.background.color=" + string(65536*192+256*192+192))
//		 dw_filtro_reporte.modify("pa_rango.background.color=" + string(65536*192+256*192+192))
//		 dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*192+256*192+192))
//		 dw_filtro_reporte.modify("ai_clientes_imp.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pa_operador_pot.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("p_acometidas.background.color=" + string(65536*192+256*192+192))
//	    dw_filtro_reporte.modify("pn_pot_inst.background.color=" + string(65536*192+256*192+192))

		 dw_filtro_reporte.modify("ai_tension.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("ai_tipo.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_operador_cl.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("ai_clientes.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_operador_cl_imp.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("rango.background.color=" + gs_gris)
		 dw_filtro_reporte.modify("pa_rango.background.color=" + gs_gris)
		 dw_filtro_reporte.modify("pa_periodo.background.color=" + gs_gris)
		 dw_filtro_reporte.modify("ai_clientes_imp.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pa_operador_pot.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("p_acometidas.background.color=" + gs_gris)
	    dw_filtro_reporte.modify("pn_pot_inst.background.color=" + gs_gris)
// Fin. Sgo.
end choose
return 1
end function

public function integer f_habilitar ();
int li_cont

dw_ambito.fpr_hab_centro(dw_ambito)
dw_ambito.fpr_hab_cmd(dw_ambito)
dw_ambito.fpr_hab_puesto(dw_ambito)
dw_funciones.enabled=true
ib_habilitado = true
dw_lista_orden.modify("tipo.background.color=" + string(65536*255+256*255+255))
dw_lista_orden.SetTabOrder("nombre",0)
dw_lista_orden.SetTabOrder("tipo",20)
choose case is_tabla_consulta
	case "sgd_incidencia"
		 dw_filtro_reporte.enabled=true
		 dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_tipo_incidencia.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_tension_afectada.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_material_averiado.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_int_horario.background.color=" + string(65536*255+256*255+255))
	  	 dw_filtro_reporte.modify("pa_centro.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_causa.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("rango.background.color=" + string(65536*255+256*255+255))
		 dw_filtro_reporte.modify("pa_rango.background.color=" + string(65536*255+256*255+255))

	case "gi_avisos"
		
		dw_filtro_reporte.enabled=true
		dw_filtro_reporte.modify("ai_estado.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("ai_tipo.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("ai_alcance.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("ai_alimentacion.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("ai_duracion.background.color=" + string(65536*255+256*255+255))
	  	dw_filtro_reporte.modify("xx.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("ai_reg_seleccionados.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*255+256*255+255))
		dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("rango.background.color=" + string(65536*255+256*255+255))
		dw_filtro_reporte.modify("pa_rango.background.color=" + string(65536*255+256*255+255))
	   dw_filtro_reporte.modify("ai_tipo_aviso.background.color=" + string(65536*255+256*255+255))
      
		//NCA-INICIO.DDAG-1679.15/05/2015.
		If iu_comunic.is_comunic.accion_llamada = 'gi_avisos' Then	
			dw_lista_orden.enabled = false
			st_2.text = ""
		End If 
		//NCA-FIN.DDAG-1679.15/05/2015.
		
	case "gi_brigada"
		   
		 dw_filtro_reporte.enabled=true
		 dw_filtro_reporte.modify("ai_estado.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("ai_tipo.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("rango.background.color=" + string(65536*255+256*255+255))
		 dw_filtro_reporte.modify("pa_rango.background.color=" + string(65536*255+256*255+255))
		 dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*255+256*255+255))
	
	case "sgd_instalacion"
		
		 dw_filtro_reporte.enabled=true
		 dw_filtro_reporte.modify("ai_tension.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("ai_tipo.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_operador_cl.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("ai_clientes.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_operador_cl_imp.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_operador_fecha.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("rango.background.color=" + string(65536*255+256*255+255))
		 dw_filtro_reporte.modify("pa_rango.background.color=" + string(65536*255+256*255+255))
		 dw_filtro_reporte.modify("pa_periodo.background.color=" + string(65536*255+256*255+255))
		 dw_filtro_reporte.modify("ai_clientes_imp.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pa_operador_pot.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("p_acometidas.background.color=" + string(65536*255+256*255+255))
	    dw_filtro_reporte.modify("pn_pot_inst.background.color=" + string(65536*255+256*255+255))
	
end choose
return 1

end function

public subroutine fw_cargar_dddw_avisos ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
//
// Responsable: FDB .- Frank
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
datawindowchild ddw_tipo_aviso
datawindowchild ddw_alcance_aviso
datawindowchild ddw_estado_incidencia_t
datawindowchild ddw_estado_mantenimiento_t
datawindowchild idwch_clase_avi
int ii

dw_filtro_reporte.GetChild("ai_estado",ddw_estado_incidencia_t)
ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)

dw_filtro_reporte.getchild('ai_tipo_aviso',idwch_clase_avi)
idwch_clase_avi.settransobject(sqlca)
idwch_clase_avi.retrieve('C_AV')
idwch_clase_avi.SetSort("codigo A")
idwch_clase_avi.Sort()
idwch_clase_avi.insertrow(1)
idwch_clase_avi.setitem(1,'codigo',101)
idwch_clase_avi.setitem(1,'descripcion','<Todos>')

dw_filtro_reporte.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)

dw_filtro_reporte.GetChild("ai_tipo",ddw_tipo_aviso)
ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
ddw_tipo_aviso.setsort("tip_aviso A")
ddw_tipo_aviso.sort()

dw_filtro_reporte.GetChild("ai_alcance",ddw_alcance_aviso)
ddw_alcance_aviso_t_shared.shareData(ddw_alcance_aviso)
ddw_alcance_aviso.setsort("co_alcance A")
ddw_alcance_aviso.sort()

end subroutine

public subroutine fw_cargar_dddw_inicid ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
//
// Responsable: FDB .- Frank
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

datawindowchild ddw_tipo_aviso
datawindowchild ddw_alcance_aviso
datawindowchild ddw_estado_incidencia_t
datawindowchild ddw_estado_mantenimiento_t
datawindowchild ddw_tipo_incidencia_t
datawindowchild ddw_tension_incid_t
datawindowchild ldwch_alcance
int ii

dw_filtro_reporte.GetChild("ai_estado",ddw_estado_incidencia_t)
ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)


//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_filtro_tipo_inc_ext()
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


dw_filtro_reporte.getchild('pa_alcance',ldwch_alcance)
ldwch_alcance.settransobject(sqlca)
ldwch_alcance.retrieve('IN_A')
ldwch_alcance.SetSort("codigo A")
ldwch_alcance.Sort()
//ldwch_clase_avi.insertrow(1)
//ldwch_clase_avi.setitem(1,'codigo',101)
//ldwch_clase_avi.setitem(1,'descripcion','<Todos>')
//
dw_filtro_reporte.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)

dw_filtro_reporte.GetChild("ai_tipo",ddw_tipo_aviso)
ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
ddw_tipo_aviso.setsort("tip_aviso A")
ddw_tipo_aviso.sort()

dw_filtro_reporte.GetChild("ai_alcance",ddw_alcance_aviso)
ddw_alcance_aviso_t_shared.shareData(ddw_alcance_aviso)
ddw_alcance_aviso.setsort("co_alcance A")
ddw_alcance_aviso.sort()
end subroutine

public function integer f_cargar_ddw_tension (string ps_llamada);string ls_filtro
int li_tension,ii
IF ps_llamada = "sgd_incidencia" THEN
	dw_filtro_reporte.GetChild("pa_tension_afectada",ddw_tension_incid_t)
ELSE
	dw_filtro_reporte.GetChild("ai_tension",ddw_tension_incid_t)
END IF
ddw_tension_incid_t.SetTransObject(SQLCA)
ddw_tension_incid_t.retrieve()

	if gu_perfiles.of_acceso_perfil(gi_perfil,"REPORTES_P","ACC_ALTA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"REPORTES_P","ACC_MEDIA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"REPORTES_P","ACC_BAJA")= 1  THEN
			//no dejo que aparezca el estado todos
						ls_filtro= "tip_tension >= " + string (fgci_alta_tension)
						li_tension=fgci_alta_tension
		ELSE
			setnull(ls_filtro)
			IF gu_perfiles.of_acceso_perfil(gi_perfil,"REPORTES_P","ACC_ALTA")= 1  THEN
			   ls_filtro= "tip_tension = " + string ( fgci_alta_tension)
				li_tension= fgci_alta_tension
			end if
			IF 	gu_perfiles.of_acceso_perfil(gi_perfil,"REPORTES_P","ACC_MEDIA")= 1 then 
				if isnull( ls_filtro) then 
								 ls_filtro= "tip_tension = " + string ( fgci_media_tension)
				else
							 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_media_tension)
				end if
								li_tension= fgci_media_tension
			end if
			
			if gu_perfiles.of_acceso_perfil(gi_perfil,"REPORTES_P","ACC_BAJA")= 1  THEN
				if isnull( ls_filtro) then 
				 ls_filtro= "tip_tension = " + string ( fgci_baja_tension)
				else
						 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_baja_tension)	
    			end if
				 				li_tension= fgci_baja_tension
			end if
			
			if isnull( ls_filtro) then // SI NO HAY NADA CHEQUEADO SALE ALUMBRADO PUBLICO
				ls_filtro= "tip_tension > " + string ( fgci_baja_tension)
				li_tension= 4
			end if
			
	end if

ddw_tension_incid_t.setfilter(ls_filtro) 
ii=ddw_tension_incid_t.filter() 

return li_tension

end function

public subroutine f_titulo_subtitulo ();///////////////////////////////////////////////////////
//									
// Funcion/Evento: f_titulo_subtitulo
// 
// Objetivo: crea el titulo, el subtitulo, la fecha de cuando se imprimio el informe y el logo del datawindo
//				 a imprimir.
// Responsable: JHC
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//    Salida : --
//
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------       -----------   ---------
// 12/09/2000   JHC
//
///////////////////////////////////////////////////////


Long 		ll_y_ti,  ll_header,  ll_pos, ll_pos2
String 	ls_name_ti, ls_titulo, ls_cadena


IF this.str_print.PARM1 THEN
	return
ELSE
	ll_header = Long(dw_1.Describe("DataWindow.Header.Height")) 
	ll_header += 250
	dw_1.Modify("DataWindow.Header.Height= " + String(ll_header) + " ")
	
		
	dw_1.Modify("create text(band=Header " + &
	" color='534543' alignment='2' border='0'" + &
	" x='600' y='1' height='90' width='2000' text='"+w_reportes_avisos_incidencias_2.mle_titulos.text+"'" + &
	" name=titulo background.mode='1' font.Face='Arial' font.height = '100' font.weight='700' font.underline='1'  background.color='" + gs_blanco + "')")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	" name=titulo background.mode='1' font.Face='Arial' font.height = '100' font.weight='700' font.underline='1'  background.color='" + String(RGB(255,255,255)) + "')")
	
	dw_1.Modify("create text(band=Header " + &
	" color='534543' alignment='2' border='0'" + &
	" x='600' y='100' height='90' width='2000' text='"+w_reportes_avisos_incidencias_2.mle_subtitulos.text+"'" + &
	" name=subtitulo background.mode='1' font.Face='Arial' font.height = '80' font.weight='700' font.underline='1'  background.color='" + gs_blanco + "')")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	" name=subtitulo background.mode='1' font.Face='Arial' font.height = '80' font.weight='700' font.underline='1'  background.color='" + String(RGB(255,255,255)) + "')")
	
	dw_1.Modify("create text(band=Header " + &
	" color='534543' alignment='0' border='0'" + &
	" x='0' y='150' height='50' width='400' text='"+string(today())+"'" + &
	" name=fechaactual background.mode='1' font.Face='Arial' font.height = '50' font.weight='700' font.underline='0'  background.color='" + gs_blanco + "')")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	" name=fechaactual background.mode='1' font.Face='Arial' font.height = '50' font.weight='700' font.underline='0'  background.color='" + String(RGB(255,255,255)) + "')")
	
//Cambio SGI DOM II JHC 02/01/2000  ********************************	
//	//crea el bitmap
//	dw_1.Modify(&
//	"create bitmap(band= Header" + &
//	" x='1' y='1' height='200' width='200'" + &
//	" filename='uf.bmp' name=bmp)")
//	
//
//	//crea el bitmap
//	dw_1.Modify(&
//	"create bitmap(band= Header" + &
//	" x='1' y='1' height='200' width='200'" + &
//	" filename='uf.bmp' name=bmp)")
//Cambio SGI DOM II JHC 02/01/2000  ********************************	
	
	ls_cadena = UPPER(dw_1.Describe("datawindow.syntax"))
	
	ll_pos = Pos( ls_cadena , "TEXT(NAME=" ,1)
	
	Do While ll_pos > 0
		ll_pos+= 9
		If ll_pos > 0 then
			ll_pos2 = Pos( ls_cadena , " " ,ll_pos ) 
			If ll_pos2 > 0 then
	
				 ls_name_ti = Mid(ls_cadena, ll_pos + 1 , ( ll_pos2 - 1) - ll_pos  )
				 
					If ls_name_ti <> "TITULO" AND ls_name_ti <> "SUBTITULO" AND ls_name_ti <> "FECHAACTUAL"Then
					 ll_y_ti =  Long(dw_1.Describe(ls_name_ti + ".Y")) + 250
					 dw_1.Modify(ls_name_ti  + ".Y=' " + String(ll_y_ti) +"'")
	
				 End IF	 
			ls_cadena = Mid(ls_cadena,ll_pos2)
			End If	
			
		End If	
		ll_pos = Pos( ls_cadena , "TEXT(NAME=" ,1)
	Loop
	
	dw_1.Modify("DataWindow.Print.Margin.Top=100")
	
END IF
end subroutine

public subroutine fw_filtro_tipo_inc_ext ();//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not fg_verifica_parametro('nuevos_tip_inc') Or &
	fg_verifica_parametro('not_nuevos_tip_inc') Then
	If Not gb_scada Then
		fg_filtro_ext(dw_filtro_reporte, "not_nuevos_tip_inc_consulta_scada", is_campo_inc)
	Else
		fg_filtro_ext(dw_filtro_reporte, "not_nuevos_tip_inc_consulta", is_campo_inc)
	End If
End If
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public function integer fw_validar_fechas ();datetime ldt_rango
datetime ldt_periodo
datetime ldt_nulo

dw_filtro_reporte.accepttext()
SetNull(ldt_nulo)

ldt_periodo = dw_filtro_reporte.object.pa_periodo[1]
ldt_rango = dw_filtro_reporte.object.pa_rango[1]
IF IsDate(string(date(ldt_periodo))) and IsTime(string(time(ldt_periodo))) THEN
	if isnull(ldt_periodo) or isnull(day(date(ldt_periodo))) or isnull(month(date(ldt_periodo))) or isnull(year(date(ldt_periodo))) &
		or day(date(ldt_periodo)) = 0 or month(date(ldt_periodo)) = 0 or year(date(ldt_periodo)) = 0 then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe cumplimentar correctamente las fechas",information!,ok!)
		dw_filtro_reporte.SetItem (1,'pa_periodo',today())
		dw_filtro_reporte.SetItem (1,'pa_rango',today())
		return -1
	end if
ELSE
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe cumplimentar correctamente las fechas",information!,ok!)
	dw_filtro_reporte.SetItem (1,'pa_periodo',today())
	dw_filtro_reporte.SetItem (1,'pa_rango',today())
	return -1
END IF

if isnull(ldt_rango) or isnull(day(date(ldt_rango))) or isnull(month(date(ldt_rango))) or isnull(year(date(ldt_rango))) &
	or day(date(ldt_rango)) = 0 or month(date(ldt_rango)) = 0 or year(date(ldt_rango)) = 0 then
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe cumplimentar correctamente las fechas",information!,ok!)
	dw_filtro_reporte.SetItem (1,'pa_periodo',today())
	dw_filtro_reporte.SetItem (1,'pa_rango',today())
	
	return -1
end if

return 1
end function

on w_reportes_avisos_incidencias_2.create
if this.MenuName = "m_reportes_2" then this.MenuID = create m_reportes_2
this.cb_1=create cb_1
this.st_titulos=create st_titulos
this.mle_titulos=create mle_titulos
this.st_subtitulos=create st_subtitulos
this.mle_subtitulos=create mle_subtitulos
this.p_1=create p_1
this.st_titulo=create st_titulo
this.dw_funciones=create dw_funciones
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_lista_orden=create dw_lista_orden
this.sle_1=create sle_1
this.dw_lista_items=create dw_lista_items
this.uo_menu=create uo_menu
this.st_material=create st_material
this.st_causa=create st_causa
this.mle_1=create mle_1
this.dw_1=create dw_1
this.dw_ambito=create dw_ambito
this.dw_filtro_reporte=create dw_filtro_reporte
this.st_instalacion=create st_instalacion
this.Control[]={this.cb_1,&
this.st_titulos,&
this.mle_titulos,&
this.st_subtitulos,&
this.mle_subtitulos,&
this.p_1,&
this.st_titulo,&
this.dw_funciones,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_lista_orden,&
this.sle_1,&
this.dw_lista_items,&
this.uo_menu,&
this.st_material,&
this.st_causa,&
this.mle_1,&
this.dw_1,&
this.dw_ambito,&
this.dw_filtro_reporte,&
this.st_instalacion}
end on

on w_reportes_avisos_incidencias_2.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.st_titulos)
destroy(this.mle_titulos)
destroy(this.st_subtitulos)
destroy(this.mle_subtitulos)
destroy(this.p_1)
destroy(this.st_titulo)
destroy(this.dw_funciones)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_lista_orden)
destroy(this.sle_1)
destroy(this.dw_lista_items)
destroy(this.uo_menu)
destroy(this.st_material)
destroy(this.st_causa)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.dw_ambito)
destroy(this.dw_filtro_reporte)
destroy(this.st_instalacion)
end on

event closequery;destroy iu_5001_nu
destroy iu_comunic
destroy iu_ds_reportes

end event

event open;//Certificaci$$HEX1$$f300$$ENDHEX$$n windows XP
//this.width=3645
//this.Height=2400
//this.width=3615
//this.Height=1900

//this.x=1
//this.y=1
//fg_colocar_ventana(w_reportes)

f_ventana_vacia()
// Estructura de comincaciones
//Entrada

iu_comunic=Create u_generico_comunicaciones
iu_5001_nu=Create u_5001_nu_reportes
iu_ds_reportes=Create ds_5001_reportes

// Cargo la estructura local de comunicaciones
openwithparm(w_msg,"Iniciando Reporte")
close(w_msg)
iu_comunic.is_comunic = gu_comunic.is_comunic 
m_reportes_2.m_rep.m_mostrar.enabled=false

///quitar mas tarde todos estaban en false
/*
m_reportes.m_rep.m_mostrar.ToolbarItemVisible=true
m_reportes.m_rep.m_presentacionpreliminar.toolbaritemvisible=TRUE
*/

m_reportes_2.m_rep.m_presentacionpreliminar.enabled=false
m_reportes_2.m_rep.m_exportarinformeaexcel.enabled = false



end event

event timer;choose case ii_visual_nro
	case 1
		uo_menu.st_7.textcolor=RGB(128, 128, 128)
		uo_menu.st_1.textcolor=RGB(0, 0, 128)
		ii_visual_nro=2
	case 2
		uo_menu.st_1.textcolor=RGB(128, 128, 128)
		uo_menu.st_2.textcolor=RGB(0, 0, 128)
		ii_visual_nro=3
	case 3
		uo_menu.st_2.textcolor=RGB(128, 128, 128)
		uo_menu.st_3.textcolor=RGB(0, 0, 128)
		ii_visual_nro=4
	case 4
		uo_menu.st_3.textcolor=RGB(128, 128, 128)
		uo_menu.st_4.textcolor=RGB(0, 0, 128)
		ii_visual_nro=7
	case 5
		uo_menu.st_8.textcolor=RGB(128, 128, 128)
		uo_menu.st_6.textcolor=RGB(0, 0, 128)
		ii_visual_nro=6
	case 6
		uo_menu.st_6.textcolor=RGB(128, 128, 128)
		uo_menu.st_7.textcolor=RGB(0, 0, 128)
		ii_visual_nro=1
	case 7
		uo_menu.st_4.textcolor=RGB(128, 128, 128)
		uo_menu.st_8.textcolor=RGB(0, 0, 128)
		ii_visual_nro=5
end choose
end event

type cb_1 from commandbutton within w_reportes_avisos_incidencias_2
integer x = 1577
integer y = 184
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

type st_titulos from statictext within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 59
integer y = 908
integer width = 288
integer height = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Titulo :"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type mle_titulos from multilineedit within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 347
integer y = 908
integer width = 1303
integer height = 100
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 38
borderstyle borderstyle = stylelowered!
end type

type st_subtitulos from statictext within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 1687
integer y = 912
integer width = 361
integer height = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Subtitulo :"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type mle_subtitulos from multilineedit within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 2048
integer y = 912
integer width = 1417
integer height = 100
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_reportes_avisos_incidencias_2
integer x = 672
integer y = 20
integer width = 82
integer height = 72
string picturename = "Custom020!"
boolean focusrectangle = false
end type

type st_titulo from statictext within w_reportes_avisos_incidencias_2
integer x = 41
integer y = 888
integer width = 3461
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_funciones from u_pr_funcion within w_reportes_avisos_incidencias_2
integer x = 41
integer y = 104
integer width = 590
integer height = 776
integer taborder = 30
string dragicon = "row.ico"
string icon = "Row.ico"
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;if not ib_habilitado then
	return
end if

ii_fila_funcion = row
if ii_fila_funcion > 0 and ii_fila_funcion <= dw_funciones.rowcount() then
	dw_funciones.drag(begin!)
	
end if

end event

event dragdrop;call super::dragdrop;string ls_item
string ls_funcion_aplicada
int li_fila_dragdrop
datawindow objeto

if not ib_habilitado then
	return
end if

objeto = draggedobject()
if typeof(objeto) = datawindow! then
	if dw_lista_items.IsSelected(il_fila_lista_items) then
		ls_funcion_aplicada=dw_lista_items.getitemstring(il_fila_lista_items,"funcion")
		if objeto.dataobject = "d_lista_reporte" and (ls_funcion_aplicada <>"" or not isnull(ls_funcion_aplicada)) then
			ls_item=dw_lista_items.getitemstring(il_fila_lista_items,"funcion")
			dw_lista_items.setitem(il_fila_lista_items,"funcion","")
			dw_lista_items.setitem(il_fila_lista_items,"parentesis","")
			ib_funcion=false
		end if
	end if
end if
dw_lista_items.drag(end!)


end event

type st_3 from statictext within w_reportes_avisos_incidencias_2
integer x = 41
integer y = 8
integer width = 590
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean border = true
long bordercolor = 8421376
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_2 from statictext within w_reportes_avisos_incidencias_2
integer x = 2094
integer y = 8
integer width = 1403
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "Ordenar Por:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_1 from statictext within w_reportes_avisos_incidencias_2
integer x = 635
integer y = 8
integer width = 1458
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 81324524
boolean enabled = false
string text = "Objeto de Informes"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista_orden from u_lista_orden within w_reportes_avisos_incidencias_2
integer x = 2094
integer y = 104
integer width = 1403
integer height = 776
integer taborder = 20
string dragicon = "Row.ico"
boolean vscrollbar = true
string icon = "Row.ico"
end type

event clicked;call super::clicked;if not ib_habilitado then
	return
end if

il_fila_orden = row
if il_fila_orden > 0 and il_fila_orden <= dw_lista_orden.rowcount() then
	dw_lista_orden.drag(begin!)
end if

end event

event dragdrop;call super::dragdrop;string ls_item
string ls_contenido
boolean lb_funcion=false
datawindow objeto
objeto = draggedobject()
id_objeto=objeto
int li_count
//ls_contenido = dw_lista_items.getitemstring(il_fila_lista_items,"funcion")

if not ib_habilitado then
	return
end if

For li_count = 1 to dw_lista_items.rowcount()
	if dw_lista_items.getitemstring(li_count,"funcion")<> "" then lb_funcion=true 
next // comprobamos si en esta datawindows hay algun campo que tenga funcion aplicada

if typeof (objeto) = datawindow! then
	if objeto.dataobject = "d_lista_reporte" then
		ls_item=dw_lista_items.getitemstring(il_fila_lista_items,"nombre")
		if dw_lista_items.IsSelected(il_fila_lista_items) then
//			if isnull(ls_contenido) or (ls_contenido = "") then
			IF LB_FUNCION=FALSE then
				if not this.fnu_ya_existe(ls_item) then
					this.insertrow(0)
					this.setitem(this.rowcount(),"tipo",1)
					this.setitem(this.rowcount(),"nombre",ls_item)
					this.setitem(this.rowcount(),"campo",&
					dw_lista_items.getitemstring(il_fila_lista_items,"campo_inc"))
					this.setitem(this.rowcount(),"tabla",&
					dw_lista_items.getitemstring(il_fila_lista_items,"tabla"))
				end if
			else
				gnv_msg.f_mensaje("AP02","","",ok!)
				//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Si hay aplicada una funci$$HEX1$$f300$$ENDHEX$$n a alg$$HEX1$$fa00$$ENDHEX$$n campo, no se puede ordenar",exclamation!,Ok!)
			end if
		else
			gnv_msg.f_mensaje("AP03","","",ok!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El campo por el que intenta ordenar, no esta seleccionado.",exclamation!,Ok!)
		end if
	end if	
end if
dw_lista_items.drag(end!)
triggerevent(dragleave!)

end event

event dragleave;call super::dragleave;datawindow objeto
objeto = source
if isnull(objeto) then
	objeto=id_objeto
end if
if not isnull(objeto) then
	if typeof (objeto) = datawindow! then
		if objeto.dataobject = "d_lista_reporte" then
			if ib_funcion=true then
				dw_lista_orden.Setitem(1,"habil",0)
				this.deleterow(0)
			end if
		end if
	end if
end if

end event

event dragenter;call super::dragenter;datawindow objeto
objeto = source
if isnull(objeto) then
	objeto=id_objeto
end if
if not isnull(objeto) then
	if typeof (objeto) = datawindow! then
		if objeto.dataobject = "d_lista_reporte" then
			if ib_funcion=true then
				dw_lista_orden.setredraw(false)
				this.insertrow(0)
				dw_lista_orden.Setitem(1,"habil",1)
				dw_lista_orden.setredraw(true)
			end if
		end if
	end if
end if

end event

type sle_1 from singlelineedit within w_reportes_avisos_incidencias_2
integer x = 1605
integer y = 1676
integer width = 183
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_lista_items from u_lista_reporte within w_reportes_avisos_incidencias_2
event ue_dragend pbm_endragdrop
event pasarmause pbm_mousemove
integer x = 631
integer y = 104
integer width = 1458
integer height = 776
integer taborder = 10
boolean bringtotop = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean vscrollbar = true
end type

event pasarmause;SetPointer("pict/PixelatedMGC_NormalSelect.cur")

end event

event clicked;call super::clicked;if not ib_habilitado then
	return
end if

il_fila_lista_items = row
if il_fila_lista_items > 0 and il_fila_lista_items <= dw_lista_items.rowcount() then
	dw_lista_items.drag(begin!)
end if

end event

event doubleclicked;long ll_fila

if not ib_habilitado then
	return
end if

if this.isselected(il_fila_lista_items) then
	// se comprueba si el campo a deseleccionar est$$HEX2$$e1002000$$ENDHEX$$en dw_lista_orden, para tambi$$HEX1$$e900$$ENDHEX$$n quitarlo de all$$HEX3$$ed0020002000$$ENDHEX$$(LFE)
	ll_fila = dw_lista_orden.Find("nombre = '"+GetItemString(il_fila_lista_items,"nombre")+"'" ,0, dw_lista_orden.RowCount()) //LFE
	this.selectrow(il_fila_lista_items,false)
	if this.getitemstring(il_fila_lista_items,"funcion") <> "" or &
	not isnull(this.getitemstring(il_fila_lista_items,"funcion")) then
		this.setitem(il_fila_lista_items,"funcion","")
		this.setitem(il_fila_lista_items,"parentesis","")
		ib_funcion=FALSE
	end if
	ii_filas_seleccionadas --

	IF ll_fila > 0 THEN // si el campo tambi$$HEX1$$e900$$ENDHEX$$n estaba en dw_lista_orden, se elimina de $$HEX1$$e900$$ENDHEX$$sta (LFE)
		dw_lista_orden.DeleteRow(ll_fila)
	END IF
else
	IF il_fila_lista_items > 0 THEN   // LFE
		this.selectrow(il_fila_lista_items,true)
		ii_filas_seleccionadas ++
	END IF
end if
 
if ii_filas_seleccionadas = 0 then
	m_reportes_2.m_rep.m_mostrar.enabled=false
//	m_reportes.m_rep.m_mostrar.ToolbarItemVisible=false
	m_reportes_2.m_reporte.m_guardar.enabled=false    // LFE
	m_reportes_2.m_reporte.m_guardar.m_preferencia1.enabled=false
//	m_reportes.m_reporte.m_guardar.m_preferencia1.toolbaritemvisible=false
else
	if gu_perfiles.of_acceso_perfil(gi_perfil,'REPORTES_P','ACC_MANTEN')=1 then 
		m_reportes_2.m_rep.m_mostrar.enabled=true
	end if
//	m_reportes.m_rep.m_mostrar.ToolbarItemVisible=true
    m_reportes_2.m_rep.m_mostrar.enabled=true
	m_reportes_2.m_reporte.m_guardar.enabled=true    // LFE
	m_reportes_2.m_reporte.m_guardar.m_preferencia1.enabled=true
//	m_reportes.m_reporte.m_guardar.m_preferencia1.toolbaritemvisible=true

end if


end event

event dragdrop;call super::dragdrop;if not ib_habilitado then
	return
end if

string ls_aplicable
boolean lb_orden=false
string ls_funcion 
int li_fila_dragdrop ,li_count
datawindow objeto
objeto = draggedobject()
id_objeto=objeto
if dw_lista_orden.rowcount()>0 then lb_orden=true
//Comprobamos si en la Datawindows del Order by hay algun campo 
if typeof (objeto) = datawindow! then
	if objeto.dataobject = "d_lista_orden" then 
		dw_lista_orden.deleterow(il_fila_orden)
	elseif objeto.dataobject = "d_funcion" then
		if row<>0 then
			if dw_lista_items.getitemstring(row,"Habilitado")= "" then
				if lb_orden=false then
					ls_aplicable = dw_funciones.getitemstring(ii_fila_funcion,"aplica_a")
					if (ls_aplicable= "T") or (ls_aplicable = dw_lista_items.getitemstring(row,"tipo")) then	
						ls_funcion=dw_funciones.getitemstring(ii_fila_funcion,"funcion") + "("
						li_fila_dragdrop=integer(mid(this.getbandatpointer(),pos((this.getbandatpointer()),"~t")))
						if this.isselected(li_fila_dragdrop) and not ib_funcion then
							this.setitem(li_fila_dragdrop,"funcion",lS_funcion)
							this.setitem(li_fila_dragdrop,"parentesis",")")
							ib_funcion=true
						end if
					else 
						gnv_msg.f_mensaje("AP04","","",ok!)
						//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n que esta realizando sobre este campo es incorrecta",exclamation!,OK!)
					end if
				else
					gnv_msg.f_mensaje("AP05","","",ok!)
					//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede aplicar funci$$HEX1$$f300$$ENDHEX$$n cuando se ordena por alg$$HEX1$$fa00$$ENDHEX$$n campo",exclamation!,OK!)
				end if
			else 
				gnv_msg.f_mensaje("AP06","","",ok!)
				//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Sobre este campo no se puede aplicar una funci$$HEX1$$f300$$ENDHEX$$n",exclamation!,OK!)
			end if
		end if
	end if
end if
dw_lista_orden.drag(end!)
dw_funciones.drag(end!)	
triggerevent(dragleave!)

end event

event dragleave;datawindow objeto
objeto = source
int li_count
if isnull(objeto) then
	objeto=id_objeto
end if
if not isnull(objeto) then
	if typeof (objeto) = datawindow! then
		if objeto.dataobject = "d_funcion" then
			if ib_funcion= false  and dw_lista_orden.rowcount()=0 then
				FOR li_count=1 TO dw_lista_items.RowCount()
					dw_lista_items.Setitem(li_count,"habilitado","")
				NEXT
//				choose case is_tabla_consulta
//					case "gi_avisos" 
//						dw_lista_items.Setitem(8,"habilitado","")
//						dw_lista_items.Setitem(9,"habilitado","")
//						dw_lista_items.Setitem(10,"habilitado","")
//						dw_lista_items.Setitem(12,"habilitado","")
//						dw_lista_items.Setitem(18,"habilitado","")
//
//					case	"sgd_incidencia"
//						dw_lista_items.Setitem(1,"habilitado","")
//						dw_lista_items.Setitem(6,"habilitado","")
//						dw_lista_items.Setitem(7,"habilitado","")
//						dw_lista_items.Setitem(8,"habilitado","")
//						dw_lista_items.Setitem(9,"habilitado","")
//						dw_lista_items.Setitem(11,"habilitado","")
//						dw_lista_items.Setitem(12,"habilitado","")
//				end choose
			elseif ib_funcion=true or dw_lista_orden.rowcount()>0 then
				for li_count =1 to dw_lista_items.rowcount() 
					dw_lista_items.Setitem(li_count,"habilitado","")
				next
			END IF
		END IF

	end if
end if
end event

event dragenter;datawindow objeto
objeto = source
int li_count
string ls_aplicable


if typeof (objeto) = datawindow! then
	if objeto.dataobject = "d_funcion" then
		if ib_funcion=false and dw_lista_orden.rowcount()=0 then
			FOR li_count=1 TO dw_lista_items.RowCount()
				ls_aplicable = dw_funciones.getitemstring(ii_fila_funcion,"aplica_a")
				if NOT((ls_aplicable= "T") or (ls_aplicable = dw_lista_items.getitemstring(li_count,"tipo"))) then
					dw_lista_items.Setitem(li_count,"habilitado","X")
				END IF
			NEXT
			
//			choose case is_tabla_consulta
//				case "gi_avisos" 
//					dw_lista_items.Setitem(8,"habilitado","X")
//					dw_lista_items.Setitem(9,"habilitado","X")
//					dw_lista_items.Setitem(10,"habilitado","X")
//					dw_lista_items.Setitem(12,"habilitado","X")
//					dw_lista_items.Setitem(18,"habilitado","X")
//				case	"sgd_incidencia"
//					dw_lista_items.Setitem(1,"habilitado","X")
//					dw_lista_items.Setitem(6,"habilitado","X")
//					dw_lista_items.Setitem(7,"habilitado","X")
//					dw_lista_items.Setitem(8,"habilitado","X")
//					dw_lista_items.Setitem(9,"habilitado","X")
//					dw_lista_items.Setitem(11,"habilitado","X")
//					dw_lista_items.Setitem(12,"habilitado","X")
//			end choose
		elseif ib_funcion=true or dw_lista_orden.rowcount()>0 then
			for li_count =1 to dw_lista_items.rowcount() 
				dw_lista_items.Setitem(li_count,"habilitado","X")
			next
		END IF

				
	end if
end if


end event

event rbuttondown;call super::rbuttondown;m_rep_emer lm_menu
lm_menu=create m_rep_emer

if not ib_habilitado then return

//lm_menu.m_opciones.m_seleccionartodo.enabled = True
//lm_menu.m_opciones.m_seleccionartodo.visible = True
//lm_menu.m_opciones.m_deseleccionartodo.enabled = True
//lm_menu.m_opciones.m_deseleccionartodo.visible = True

lm_menu.popmenu(PointerX()+480, PointerY()+480)
destroy lm_menu
end event

type uo_menu from u_pr_menu within w_reportes_avisos_incidencias_2
integer x = 1024
integer y = 400
integer width = 1134
integer height = 672
integer taborder = 120
string dragicon = "CreateLibrary5!"
boolean bringtotop = true
long backcolor = 81324524
borderstyle borderstyle = styleshadowbox!
end type

on uo_menu.destroy
call u_pr_menu::destroy
end on

type st_material from statictext within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 1993
integer y = 1444
integer width = 585
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "mano.cur"
long textcolor = 128
long backcolor = 79741120
string text = "Material Averiado"
boolean focusrectangle = false
end type

event doubleclicked;string ls_codigo
string ls_descripcion

Open(w_2401_ayuda_materiales)
ls_codigo = gu_comunic.is_comunic.strval1
ls_descripcion = gu_comunic.is_comunic.strval2

IF Len(Trim(ls_codigo)) > 0 THEN
	dw_filtro_reporte.setitem(1,"pa_material_averiado",ls_codigo)
	dw_filtro_reporte.setitem(1,"ps_nom_mat_averiado", ls_descripcion)
end if
end event

type st_causa from statictext within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 1993
integer y = 1548
integer width = 585
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "mano.cur"
long textcolor = 128
long backcolor = 79741120
string text = "Causa Incidencia"
boolean focusrectangle = false
end type

event doubleclicked;setpointer(HourGlass!)

// GNU 13-1-2006. Mejora 1/342078
gu_comunic2.is_comunic.programa_llamante= "w_reportes_avisos_incidencias_2"
// FIN GNU

Open(w_2301_sel_causa)

if gu_comunic2.is_comunic.longval4 > 0 then
	dw_filtro_reporte.setitem(1,"ps_nom_causa",gu_comunic2.is_comunic.strval9)
	dw_filtro_reporte.setitem(1,"pa_causa",gu_comunic2.is_comunic.longval4)
	yield()
end if
end event

type mle_1 from multilineedit within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 2843
integer width = 617
integer height = 1792
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
end type

type dw_1 from datawindow within w_reportes_avisos_incidencias_2
boolean visible = false
integer y = 1152
integer width = 2459
integer height = 560
integer taborder = 50
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_reportes_avisos_incidencias_2
integer x = 439
integer y = 1292
integer taborder = 100
boolean border = false
end type

type dw_filtro_reporte from u_gen_7001_pr_filtro_reporte_inc within w_reportes_avisos_incidencias_2
integer x = 37
integer y = 1036
integer width = 3461
integer height = 712
integer taborder = 110
borderstyle borderstyle = styleraised!
end type

event itemerror;ib_error = TRUE

IF dwo.name = "pa_periodo" THEN 
	gnv_msg.f_mensaje('EP03',"","",OK!)
END IF
return 1

end event

event editchanged;// En este evento se controla que el usuario no pueda teclear el signo negativo como
// primer caracter en el campo Cant Clientes, Clientes Imp, o Pot Contratada .  (LFE)

String ls_columna
ls_columna=this.getcolumnname()
IF ls_columna = "ai_clientes" OR ls_columna="ai_clientes_imp" OR ls_columna="pn_pot_inst" THEN
	If Left(this.gettext(),1) = "-"  then
		this.settext("")
	END IF
END IF


end event

event itemchanged;String ls_columna
String ls_modtitulo
string ls_filtro
String ls_ismodif
int li_tension, li_tipo, li_alcance
DatawindowChild ldwch_alcance
this.accepttext()
IF ii_filas_seleccionadas > 0 THEN
	m_reportes_2.m_reporte.m_guardar.m_preferencia1.enabled=true
END IF

ls_columna=this.getcolumnname()
// Si la columna es ai_tipo_aviso estamos en el informe de avisos
IF ls_columna = "ai_tipo_aviso" THEN
	// Se comprueba la clase de aviso seleccionado para habilitar o deshabilitar
	// la alimentaci$$HEX1$$f300$$ENDHEX$$n.
	// Si el aviso es normal o de calidad se habilita, ya que se podr$$HEX2$$e1002000$$ENDHEX$$escoger la 
	// alimentaci$$HEX1$$f300$$ENDHEX$$n de los avisos. Para el resto de los avisos se deshabilita (LFE)
	if data = string (fgci_clase_avi_normal) or data = string(fgci_clase_avi_calidad) then
		this.object.ai_alimentacion.protect=0
		this.object.ai_alimentacion.background.color=gs_blanco
  else
		this.setitem(1,'ai_alimentacion',0)
		this.object.ai_alimentacion.protect=1
		this.object.ai_alimentacion.background.color=gs_gris
  end if
// Si la columna es pa_tipo_icidencia estamos en el informe de incidencias
ELSEIF ls_columna = "pa_tipo_incidencia" THEN
	dw_filtro_reporte.getchild('pa_alcance',ldwch_alcance)
	ldwch_alcance.Reset()
	parent.triggerevent("ue_deseleccionar_todo")
	ldwch_alcance.settransobject(sqlca)
	ldwch_alcance.retrieve('IN_A')

	dw_lista_items.SetRedraw(false)
	dw_lista_items.SelectRow(0,false)
	dw_lista_items.Reset()

	
	dw_lista_items.fpr_lista_incidencia()
	dw_lista_items.SetRedraw(true)
	is_tabla_consulta = 'sgd_incidencia'
	iu_comunic.is_comunic.accion_llamada = is_tabla_consulta 
	mle_titulos.text = "Informe de Incidencias"
	// Se comprueba el tipo de inicidencia seleccionado para filtrar el alcance.
	// Si la incidencia es imprevista 
	//	<Todos>, De suministro, Con Perdida, Sin Perdida ;
	//Si es de calidad entonces el alcance ser$$HEX2$$e1002000$$ENDHEX$$
	// <Todos>, De suministro, Instalaci$$HEX1$$f300$$ENDHEX$$n;
	// si la incidencia es programada el alcance ser$$HEX1$$e100$$ENDHEX$$
	// <Todos>, Con Interrupci$$HEX1$$f300$$ENDHEX$$n, Sin Interrupci$$HEX1$$f300$$ENDHEX$$n;
	// y si la incidencia es de calidad, no se podr$$HEX2$$e1002000$$ENDHEX$$escoger el alcance (LFE)
	IF data = String(fgci_incidencia_imprevista) THEN 
		ls_filtro ='codigo =' + string(fgci_todos) +' or codigo =' + string(fgci_incidencia_de_suministro) +' or codigo ='+ string(fgci_incidencia_con_interrupcion) + ' or codigo = '+string(fgci_incidencia_sin_interrupcion)
		IF gb_scada THEN 
			ls_filtro = ls_filtro +  ' or codigo = '+string(fgci_incidencia_reenganche)
		END IF
		ldwch_alcance.SetFilter(ls_filtro)
	ELSEIF data = String(fgci_incidencia_calidad) THEN
		ls_filtro ='codigo =' + string(fgci_todos) + 'or codigo =' + string(fgci_incidencia_de_suministro) +' or codigo ='+ string(fgci_incidencia_de_instalacion)
		ldwch_alcance.SetFilter(ls_filtro)
	ELSEIF data = String(fgci_incidencia_programada) THEN
		ls_filtro ='codigo =' + string(fgci_todos) +' or codigo ='+ string(fgci_incidencia_con_interrupcion) + ' or codigo = '+string(fgci_incidencia_sin_interrupcion)
		ldwch_alcance.SetFilter(ls_filtro)
//	ELSEIF data = String(fgci_incidencia_scada) THEN
//		ls_filtro ='codigo =' + string(fgci_todos) +' or codigo ='+ string(fgci_incidencia_con_interrupcion) + ' or codigo = '+string(fgci_incidencia_sin_interrupcion)+ ' or codigo = '+string(fgci_incidencia_reenganche)
//		ldwch_alcance.SetFilter(ls_filtro)
	END IF
	
	ldwch_alcance.Filter()
	ldwch_alcance.SetSort("codigo A")
	ldwch_alcance.Sort()
	This.setitem(1,"pa_alcance",fgci_todos)
	IF data = String(fgci_todos) THEN
		this.object.pa_alcance.protect=1
		this.object.pa_alcance.background.color=gs_gris
	ELSE
		this.object.pa_alcance.protect=0
		this.object.pa_alcance.background.color=gs_blanco
	END IF
	
ELSEIF dwo.name = 'pa_alcance' THEN
	
	li_alcance = this.GetItemNumber(1,'pa_alcance')
	IF li_alcance = fgci_incidencia_reenganche AND gb_scada THEN
		dw_lista_items.SetRedraw(false)
		dw_lista_items.SelectRow(0,false)
		dw_lista_items.Reset()
		parent.triggerevent("ue_deseleccionar_todo")
		dw_lista_items.fpr_lista_reenganche()
		dw_lista_items.SetRedraw(true)
		dw_lista_orden.Reset()
		is_tabla_consulta = 'sgd_reenganches'
		iu_comunic.is_comunic.accion_llamada = is_tabla_consulta 		
		mle_titulos.text = "Informe de Reenganches"
		this.setitem(1,'pa_material_averiado',0)
		this.setitem(1,'ps_nom_mat_averiado','<Todos>')
		this.setitem(1,'pa_causa',0)
		this.setitem(1,'ps_nom_causa','<Todos>')
		this.Object.ps_nom_mat_averiado.Protect=1
		this.Object.pa_material_averiado.Protect=1
		this.Object.ps_nom_causa.Protect=1
		this.Object.pa_causa.Protect=1
		this.Object.ps_nom_mat_averiado.Background.Color = gs_gris	
		this.Object.pa_material_averiado.Background.Color = gs_gris
		this.Object.ps_nom_causa.Background.Color = gs_gris	
		this.Object.pa_causa.Background.Color = gs_gris	
		parent.st_causa.visible = false
		parent.st_material.visible = false
		
	ELSEIF li_alcance <> fgci_incidencia_reenganche THEN
		dw_lista_items.SetRedraw(false)
		dw_lista_items.SelectRow(0,false)
		dw_lista_items.Reset()
		dw_lista_orden.Reset()		
		parent.triggerevent("ue_deseleccionar_todo")		
		dw_lista_items.fpr_lista_incidencia()
		dw_lista_items.SetRedraw(true)
		is_tabla_consulta = 'sgd_incidencia'
		iu_comunic.is_comunic.accion_llamada = is_tabla_consulta 		
		mle_titulos.text = "Informe de Incidencias"
		this.Object.ps_nom_mat_averiado.Protect=0
		this.Object.pa_material_averiado.Protect=0		
		this.Object.ps_nom_causa.Protect=0
		this.Object.pa_causa.Protect=0
		this.Object.ps_nom_mat_averiado.Background.Color = gs_blanco
		this.Object.pa_material_averiado.Background.Color = gs_blanco
		this.Object.ps_nom_causa.Background.Color = gs_blanco
		this.Object.pa_causa.Background.Color = gs_blanco
		parent.st_causa.visible = true
		parent.st_material.visible = true

	END IF
	
	
ELSEIF dwo.name = 'ai_tension' THEN
	li_tension = this.GetItemNumber(1,'ai_tension')
	
	CHOOSE CASE li_tension
		CASE fgci_alta_tension
			ls_filtro = 'tipo_instalacion IN (1,2,3)'
			li_tipo = fgci_tipo_subestacion_at
		CASE fgci_media_tension
			ls_filtro = 'tipo_instalacion IN (4,5)'				
			li_tipo = fgci_tipo_salida_mt
		CASE fgci_baja_tension
			ls_filtro = 'tipo_instalacion IN (6,7,8)'
			li_tipo =  fgci_tipo_transformador
	END CHOOSE
	dw_filtro_reporte.GetChild("ai_tipo",ddw_tipo_tension_t)
	ddw_tipo_tension_t.SetTransObject(SQLCA)
	ddw_tipo_tension_t.retrieve()
	
	ddw_tipo_tension_t.SetFilter(ls_filtro)
	ddw_tipo_tension_t.Filter()
	dw_filtro_reporte.setitem(1,"ai_tipo",li_tipo)
	
END IF

IF ls_columna = 'ps_nom_mat_averiado' THEN
	this.setitem(1,'pa_material_averiado',data)
END IF

datetime ldt_periodo, ldt_rango
ldt_periodo = dw_filtro_reporte.object.pa_periodo[1]
ldt_rango	= dw_filtro_reporte.object.pa_rango[1]
IF ls_columna ='pa_periodo' OR ls_columna = 'pa_rango' THEN
	IF isDate(string(date(ldt_periodo))) AND isDate(string(date(ldt_rango)))  THEN
	ELSE
		dw_filtro_reporte.SetItem (1,'pa_periodo',today())
		dw_filtro_reporte.SetItem (1,'pa_rango',today())
		dw_filtro_reporte.AcceptText()
	END IF
END IF

IF ls_columna = 'rango' THEN
	IF isDate(string(date(ldt_periodo))) AND isDate(string(date(ldt_rango)))  THEN
	ELSE
		dw_filtro_reporte.SetItem (1,'pa_periodo',today())
		dw_filtro_reporte.SetItem (1,'pa_rango',today())
		dw_filtro_reporte.AcceptText()
	END IF
END IF
end event

type st_instalacion from statictext within w_reportes_avisos_incidencias_2
boolean visible = false
integer x = 1993
integer y = 1644
integer width = 585
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "mano.cur"
long textcolor = 128
long backcolor = 79741120
string text = "Instalaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

event doubleclicked;string ls_nom_instalacion

dw_filtro_reporte.SetItem(1,'ps_nom_instalacion','Todas')
dw_filtro_reporte.SetItem(1,'nro_instalacion',fgci_todos)
gu_comunic.is_comunic.programa_llamante = 'w_reportes_avisos_incidencias_2'
openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)


SELECT "SGD_INSTALACION"."NOM_INSTALACION"
INTO :ls_nom_instalacion	
FROM "SGD_INSTALACION" 
WHERE "NRO_INSTALACION" = :gu_comunic1.is_comunic.decval1 AND BDI_JOB=0;

IF SQLCA.SQLCODE = 0 THEN
	dw_filtro_reporte.SetItem(1,'ps_nom_instalacion',ls_nom_instalacion)
	dw_filtro_reporte.SetItem(1,'nro_instalacion',gu_comunic1.is_comunic.decval1)
END IF
end event


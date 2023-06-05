HA$PBExportHeader$u_tv.sru
forward
global type u_tv from uo_man_instalac
end type
type str_datos_rama from structure within u_tv
end type
end forward

type str_datos_rama from structure
	long		ll_nro_instalacion
	string		ls_nom_instalacion
	integer		li_tipo_instalacion
	integer		li_co_nivel
	integer		li_tension
	long		ll_nro_inst_padre
	long		ll_ccli_afec
	long		ll_kwh
	double		ll_pot_instalada
	double		ll_pot_contratada
	long		ll_ccli
	string		ls_fase
	string		ls_fase_afectada
	string		ls_fases_int
	string		tipo_area
	integer		li_ind_otras_ins
	integer		li_tipo_ct
	integer		li_tipo_conexion
end type

global type u_tv from uo_man_instalac
integer width = 869
integer height = 828
integer taborder = 10
fontcharset fontcharset = ansi!
long textcolor = 33554432
boolean linesatroot = true
string picturename[] = {"F"}
string statepicturename[] = {"OFF.BMP","ON.BMP","ON.BMP","ALARMA.BMP"}
event ue_doubleclicked ( long handle )
event ue_interr_agrup ( )
event ue_otras_interr ( )
end type
global u_tv u_tv

type variables
w_2301_form_incidencia iw_contenedora
int ii_nivel=1 //pacho
long il_inst[]
long il_tipo_padre[]
string is_fase_int_permitida=''
int ii_tipo_icono

Long il_cantidad_avisos  //**  OSGI 2001.1    29/05/2001
Boolean ib_usa_trafo  //**  OSGI 2001.1    29/05/2001
Boolean ib_tipo_area  //**  OSGI 2001.1    19/06/2001
Boolean ib_int_descargo = FALSE

Datetime idt_f_alta_fase_a
Datetime idt_f_alta_fase_b
Datetime idt_f_alta_fase_c
end variables

forward prototypes
public function integer of_carga_elemento (long pl_cod_elemento, long pl_handle_origen, integer pi_tipo_carga)
public function integer of_estado_hijos (long handle)
public function long of_ret_codigo (long handle)
public function boolean of_comprobar_fecha_alta (datawindow pdw_datos_interrup, datetime pdt_fecha_alta)
public subroutine fw_buscar_interrupciones (long pl_nro_incidencia)
public function long of_ret_tipo (long handle)
public subroutine of_interrumpir_hijos (long pl_instalacion, datawindow pdw_interrupcion)
public function string of_ret_fase (long handle)
public function boolean of_tiene_fase_afectada (string ps_fase_afect_padre, string ps_fase_instal)
public function string of_determinar_fase_afectada (string ps_fase_afect_padre, string ps_fase_instal)
public subroutine of_marcar_fase_afectada (long pl_handle, string ps_fase_afectada)
public function integer of_comprobar_interrupcion (long pl_fila, long pl_handle)
public function string of_unir_fases (string ps_fase_antigua, string ps_fase_nueva)
public subroutine of_icono_rama (integer pi_tipo_instalacion, long pl_cod_instalacion, datawindow pdw_interrupciones, ref treeviewitem le_elemento, long pl_handle)
public subroutine of_cant_avisos (readonly long pl_nro_incidencia, readonly long pl_nro_instalacion, readonly datetime pdt_fecha_ini)
public subroutine of_cp_rama_a_dw (str_datos_rama lstr_datos_rama, datawindow pdw_interrupcion, boolean pb_int_agrupadas)
public subroutine of_marca_interrupcion (datawindow pdw_interrupcion, long handle, integer accion, boolean pb_int_agrupadas)
public function integer of_obtener_info_inst (ref str_datos_rama pstr_datos_rama, long pl_nro_instalacion)
public function string of_ret_fase_afectada (long handle, integer pi_tipo_conexion, string ps_fase_instalacion)
public function string of_ret_fase_afectada (long handle)
public function long of_ret_tipo_ct (long handle)
public function long of_ret_tipo_conexion (long handle)
public subroutine of_set_fase_afectada (long handle, string ps_fase_afectada)
public function string of_det_perdida_ct (long pl_nro_instalacion, string ps_fase_ent, integer pi_tipo_conexion, integer pi_tipo_ct)
public function long of_ret_inst_padre (long handle)
public function string of_ret_fases_int (long handle)
public function string of_unir_fases_con_filtro (string ps_fase_antigua, string ps_fase_nueva, string ps_filtro)
public function string of_ret_fases_int (long handle, integer pi_tipo_conexion, string ps_fase_instalacion)
public function integer of_agregar_int_descargo (ref datastore pds_lista, integer pi_tipo_int)
public function integer of_cursor_clientes (integer pi_tipo, ref long ll_cant_cli_afec_c, ref long ll_cant_cli_afec_r, ref long ll_cant_cli_afec_u, ref double ll_pot_cont_afec, string ls_nro_instalacion, string ls_fase_afectada_num, string ls_tipo_instalacion, string ls_tabla_decision)
end prototypes

event ue_doubleclicked;treeviewitem le_elemento
str_datos_rama lstr_datos_rama

SetPointer(HourGlass!)

IF handle < 1 THEN
	RETURN
END IF

THIS.getitem(handle,le_elemento)

IF le_elemento.expandedonce = FALSE THEN

	lstr_datos_rama = le_elemento.data
	of_carga_elemento(lstr_datos_rama.ll_nro_instalacion,handle,1)
	ii_nivel = lstr_datos_rama.li_tipo_instalacion
	
	THIS.getitem(handle,le_elemento)
	le_elemento.expandedonce = TRUE
	
	This.SetItem(handle, le_elemento)
	//THIS.expanditem(handle)


	//***************************************
	//**  OSGI 2001.1  	29/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	29/05/2001  	THIS.expanditem(handle)
	//***************************************
	//**  OSGI 2001.1  	29/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


//	MESSAGEBOX("HOLA",STRING(lstr_datos_rama.ll_nro_instalacion))

END IF

SetPointer(Arrow!)
end event

event ue_interr_agrup;Datetime ldt_fecha_sr, ldt_fecha_eb
treeviewitem le_elemento
str_datos_rama lstr_datos_rama
DataStore lds_lista
Long ll_inst_hija, ll_nro_inst_desc, ll_total
md_ingreso_incidencias lm_menu

lm_menu = iw_contenedora.MenuId

SetNull(ldt_fecha_sr)
SetNull(idt_f_alta_fase_a)
SetNull(idt_f_alta_fase_b)
SetNull(idt_f_alta_fase_c)

this.getitem(il_handle_seleccionado,le_elemento)
lstr_datos_rama = le_elemento.data

gu_comunic.is_comunic.strval1 = lstr_datos_rama.ls_nom_instalacion
gu_comunic.is_comunic.longval1 = lstr_datos_rama.ll_nro_instalacion
gu_comunic.is_comunic.longval2 = iw_contenedora.tab_1.il_nro_incidencia

IF iw_contenedora.tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada THEN
	ldt_fecha_eb = iw_contenedora.tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDatetime(iw_contenedora.tab_1.ii_incidencia_enviado_brigada, 'f_alta')
	gu_comunic.is_comunic.longval3 = iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.find('isnull(f_hasta)', 0, &
												         iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount())
END IF

IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_servicio_repuesto THEN
	ldt_fecha_sr = iw_contenedora.tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDatetime(iw_contenedora.tab_1.ii_incidencia_servicio_repuesto, 'f_alta')
END IF

gu_comunic.is_comunic.datval1 = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.GetItemDatetime(1, 'f_deteccion')
// Le quitamos los segundos a la fecha de detecci$$HEX1$$f300$$ENDHEX$$n
gu_comunic.is_comunic.datval1 = Datetime(Date(gu_comunic.is_comunic.datval1),Time(String(Time(gu_comunic.is_comunic.datval1),"hh:mm")))
gu_comunic.is_comunic.datval3 = ldt_fecha_eb
gu_comunic.is_comunic.datval2 = ldt_fecha_sr
IF ISNULL(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.st_causa.text) OR &
	iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.st_causa.text="" THEN
	
	gu_comunic.is_comunic.longval4 = 0
ELSE
	gu_comunic.is_comunic.longval4 = 1
END IF

gu_comunic.is_comunic.Intval1 = iw_contenedora.tab_1.ii_estado_oper
gu_comunic.is_comunic.Intval2 = lstr_datos_rama.li_tipo_conexion
gu_comunic.is_comunic.Intval3 = lstr_datos_rama.li_tipo_instalacion
gu_comunic.is_comunic.Intval4 = lstr_datos_rama.li_tipo_ct
gu_comunic.is_comunic.w_llamante = iw_contenedora

IF ib_int_descargo = FALSE THEN
	gu_rf.il_instalaciones[] = iw_contenedora.tab_1.il_inst_dig[]
	OpenWithParm(w_inc_multiples_inter, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup)
ELSE
	of_agregar_int_descargo(lds_lista,1)
END IF

iw_contenedora.SetRedraw(False)

IF gu_comunic.is_comunic.accion_retorno <> "Cancelar" OR ib_int_descargo THEN
	String ls_fase_sugerida
	long ll_contador, ll_handle, ll_fila, ll_fila_int, ll_handle_orig
	
	IF ib_int_descargo = FALSE THEN
		lds_lista = Message.PowerObjectParm
			// Se despliegan los hijos
		THIS.EVENT doubleclicked(il_handle_seleccionado)
	
		ll_handle = This.FindItem(ChildTreeItem!,il_handle_seleccionado)
				
		DO  // Cargo todos los handles de los hijos
			THIS.getitem(ll_handle, le_elemento) 
			lstr_datos_rama = le_elemento.data	
			
			ll_fila = lds_lista.Find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), &
											 1, lds_lista.RowCount())
			IF ll_fila > 0 THEN
				lds_lista.SetItem(ll_fila, 'handle', ll_handle)	
			END IF
			
			ll_handle = THIS.FINDITEM(NextTreeITem!,ll_handle)
					
		LOOP UNTIL ll_handle = -1
	ELSE
		Boolean lb_encontrado
		int li_cuenta
		// Cargo todos los handles de las interrupciones
		FOR ll_contador = 1 TO lds_lista.Rowcount()
			lb_encontrado = FALSE
			ll_handle = il_handle_seleccionado
			
			THIS.getitem(ll_handle, le_elemento) 
			lstr_datos_rama = le_elemento.data	
			ll_nro_inst_desc = lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')
			
			IF ll_nro_inst_desc <> lstr_datos_rama.ll_nro_instalacion THEN
				lb_encontrado = FALSE
				DO WHILE lb_encontrado = FALSE AND ll_handle > 0
					// Se comprueba si la instalaci$$HEX1$$f300$$ENDHEX$$n desplegada del $$HEX1$$e100$$ENDHEX$$rbol es una instalaci$$HEX1$$f300$$ENDHEX$$n que alimenta a la interrupci$$HEX1$$f300$$ENDHEX$$n
					SELECT COUNT(NRO_INSTALACION)
					INTO :li_cuenta
					FROM SGD_INSTALACION
					WHERE NRO_INSTALACION = :lstr_datos_rama.ll_nro_instalacion AND ESTADO = 0 AND BDI_JOB = 0
					START WITH NRO_INSTALACION = :ll_nro_inst_desc AND ESTADO = 0 AND BDI_JOB = 0
					CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION AND BDI_JOB = 0;
					
					IF li_cuenta <> 0 THEN // es padre
						THIS.EVENT doubleclicked(ll_handle) // se despliega el elemento
						ll_handle = This.FindItem(ChildTreeItem!,ll_handle)
						IF ll_handle > 0 THEN
							THIS.getitem(ll_handle, le_elemento) 
							lstr_datos_rama = le_elemento.data	
													
							IF ll_nro_inst_desc = lstr_datos_rama.ll_nro_instalacion THEN
								lb_encontrado = TRUE
							END IF
						END IF
					ELSE // no es padre, buscamos en un hermano
						ll_handle = THIS.FINDITEM(NextTreeITem!,ll_handle)
						IF ll_handle > 0 THEN
							THIS.getitem(ll_handle, le_elemento) 
							lstr_datos_rama = le_elemento.data	
														
							IF ll_nro_inst_desc = lstr_datos_rama.ll_nro_instalacion THEN
								lb_encontrado = TRUE
							END IF
						END IF
					END IF
				LOOP
				
				IF lb_encontrado THEN
					lds_lista.SetItem(ll_contador, 'handle', ll_handle)
				ELSE
					lds_lista.SetItem(ll_contador, 'handle', -1)
				END IF
			ELSE
				lds_lista.SetItem(ll_contador, 'handle', ll_handle)	
			END IF
				
		NEXT
		
		ll_total = lds_lista.RowCount()
		
		FOR ll_contador=1 TO ll_total
			IF IsNull(lds_lista.GetItemNumber(ll_contador, 'handle')) OR lds_lista.GetItemNumber(ll_contador, 'handle') = -1 THEN
				lds_lista.deleterow(ll_contador)
				ll_contador --
				ll_total --
			END IF
		NEXT
	END IF
	
	ll_handle_orig = iw_contenedora.tab_1.il_handle_instalacion
	
	IF gu_comunic.is_comunic.accion_retorno = "Marcar" OR ib_int_descargo THEN
		IF lds_lista.RowCount() > 0 THEN
			IF NOT gb_red_trifasica THEN
				idt_f_alta_fase_a = lds_lista.GetItemdatetime(1, 'f_alta_fase_a')
				idt_f_alta_fase_b = lds_lista.GetItemdatetime(1, 'f_alta_fase_b')
				idt_f_alta_fase_c = lds_lista.GetItemdatetime(1, 'f_alta_fase_c')
			ELSE
				idt_f_alta_fase_a = lds_lista.GetItemdatetime(1, 'f_alta')
			END IF
		END IF
		
		FOR ll_contador = 1 TO lds_lista.RowCount()
			IF NOT gb_red_trifasica THEN
				IF lds_lista.GetItemString(ll_contador, 'fase_completar') <> '000' THEN
					
					ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_instalacion = " + string(lds_lista.GetItemNumber(ll_contador, 'nro_instalacion') ),&
									  1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
				
					IF ll_fila_int > 0 THEN
						// La variable ll_fila puede cambiar en la funci$$HEX1$$f300$$ENDHEX$$n of_mostrar_fases_int, ya que se
						// tiene que seleccionar la fila que tenga una interrupci$$HEX1$$f300$$ENDHEX$$n no resuelta en la primera 
						// fase interrumpida, y esta fila puede que no sea la seleccionada con anterioridad
						iw_contenedora.tab_1.of_mostrar_fases_int(ll_fila_int, This.of_ret_fase(lds_lista.GetItemNumber(ll_contador, 'handle')))
					END IF
					
					iw_contenedora.tab_1.il_handle_instalacion = lds_lista.GetItemNumber(ll_contador, 'handle')
					// Se completan las fases de una en una
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),1,1) = '1' THEN
						iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked = true
						iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked, 1, TRUE, TRUE)
					END IF
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),2,1) = '1' THEN
						iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked = true
						iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked, 2, TRUE,TRUE)
		
					END IF
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),3,1) = '1' THEN
						iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked = true
						iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked, 3, TRUE,TRUE)
		
					END IF
				END IF
				
				IF lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir') <> '000' THEN
					IF ib_int_descargo AND NOT gb_red_trifasica THEN 
						idt_f_alta_fase_a = lds_lista.GetItemdatetime(ll_contador, 'f_alta_fase_a')
						idt_f_alta_fase_b = lds_lista.GetItemdatetime(ll_contador, 'f_alta_fase_b')
						idt_f_alta_fase_c = lds_lista.GetItemdatetime(ll_contador, 'f_alta_fase_c')
					ELSE
						idt_f_alta_fase_a = lds_lista.GetItemdatetime(ll_contador, 'f_alta')
					END IF
					
					ls_fase_sugerida = ''
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir'),1,1) = '1' THEN
						ls_fase_sugerida = gs_fase_a
					END IF
					
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir'),2,1) = '1' THEN
						ls_fase_sugerida = ls_fase_sugerida + gs_fase_b
					END IF
					
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir'),3,1) = '1' THEN
						ls_fase_sugerida = ls_fase_sugerida + gs_fase_c
					END IF
					
					is_fase_int_permitida = ls_fase_sugerida
					
					iw_contenedora.tab_1.tabpage_formulario.d_inf_general.SetItem(1,'fase_sugerida', ls_fase_sugerida)
				
					of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,&
												 lds_lista.GetItemNumber(ll_contador, 'handle')	,1, TRUE)

					IF iw_contenedora.tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
						iw_contenedora.tab_1.ii_alcance = fgci_incidencia_con_interrupcion
						iw_contenedora.tab_1.tabpage_formulario.d_inf_general.Setitem(1, 'alcance', fgci_incidencia_con_interrupcion)
						lm_menu.m_consultar.m_avisos.enabled=true
						lm_menu.m_consultar.m_suministrosimportantes.enabled = true
						// Se resetean las variables con las que se accede a la informaci$$HEX1$$f300$$ENDHEX$$n de los estados
						iw_contenedora.tab_1.of_iniciar_estados_oper()
						// Se analiza la incidencia para cambiar la datawindow de los estados
						iw_contenedora.fw_evaluo_inc_calidad(iw_contenedora.tab_1.ii_tipo_incid, False, fgci_incidencia_con_interrupcion)
					END IF
		
				END IF
			ELSE
				of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,&
												 lds_lista.GetItemNumber(ll_contador, 'handle')	,1, TRUE)
				IF iw_contenedora.tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
					iw_contenedora.tab_1.ii_alcance = fgci_incidencia_con_interrupcion
					iw_contenedora.tab_1.tabpage_formulario.d_inf_general.Setitem(1, 'alcance', fgci_incidencia_con_interrupcion)
					lm_menu.m_consultar.m_avisos.enabled=true
					lm_menu.m_consultar.m_suministrosimportantes.enabled = true
					// Se resetean las variables con las que se accede a la informaci$$HEX1$$f300$$ENDHEX$$n de los estados
					iw_contenedora.tab_1.of_iniciar_estados_oper()
					// Se analiza la incidencia para cambiar la datawindow de los estados
					iw_contenedora.fw_evaluo_inc_calidad(iw_contenedora.tab_1.ii_tipo_incid, False, fgci_incidencia_con_interrupcion)
				END IF
			END IF
		NEXT
		IF ib_int_descargo  THEN	
			Destroy lds_lista
		END IF
	ELSEIF gu_comunic.is_comunic.accion_retorno = "Resolver" THEN
		long ll_nro_instalacion
		
		SetPointer(HourGlass!)
		FOR ll_contador = 1 TO lds_lista.RowCount()
		
			ll_nro_instalacion = lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')
			
			IF NOT gb_red_trifasica THEN
				// Fase A
				IF NOT IsNull(lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_a')) THEN
					// Se busca el registro donde hay que a$$HEX1$$f100$$ENDHEX$$adir la fecha de reposici$$HEX1$$f300$$ENDHEX$$n
					// en la datawindow de interrupciones
					ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
									  Find("nro_instalacion="+string(ll_nro_instalacion) + &
											 " and isnull(f_reposicion_fase_a) and not isnull(f_alta_fase_a)", &
											 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())
											 
					IF ll_fila_int > 0 THEN
						iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion_fase_a', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_a'))
						iw_contenedora.tab_1.il_handle_instalacion = lds_lista.GetItemNumber(ll_contador, 'handle')
						iw_contenedora.tab_1.of_validar_fecha_rep(ll_fila_int, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, true)
					END IF
				END IF
				
				// Fase B
				IF NOT IsNull(lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_b')) THEN
					// Se busca el registro donde hay que a$$HEX1$$f100$$ENDHEX$$adir la fecha de reposici$$HEX1$$f300$$ENDHEX$$n
					// en la datawindow de interrupciones
					ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
									  Find("nro_instalacion="+string(ll_nro_instalacion) + &
											 " and isnull(f_reposicion_fase_b) and not isnull(f_alta_fase_b)", &
											 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())
											 
					IF ll_fila_int > 0 THEN
						iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion_fase_b', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_b'))
						iw_contenedora.tab_1.il_handle_instalacion = lds_lista.GetItemNumber(ll_contador, 'handle')
						iw_contenedora.tab_1.of_validar_fecha_rep(ll_fila_int, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, true)
					END IF
				END IF
				
				// Fase C
				IF NOT IsNull(lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_c')) THEN
					// Se busca el registro donde hay que a$$HEX1$$f100$$ENDHEX$$adir la fecha de reposici$$HEX1$$f300$$ENDHEX$$n
					// en la datawindow de interrupciones
					ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
									  Find("nro_instalacion="+string(ll_nro_instalacion) + &
											 " and isnull(f_reposicion_fase_c) and not isnull(f_alta_fase_c)", &
											 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())
											 
					IF ll_fila_int > 0 THEN
						iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion_fase_c', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_c'))
						iw_contenedora.tab_1.il_handle_instalacion = lds_lista.GetItemNumber(ll_contador, 'handle')
						iw_contenedora.tab_1.of_validar_fecha_rep(ll_fila_int, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, true)
					END IF
				END IF
			ELSE

				ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
									  Find("nro_instalacion="+string(ll_nro_instalacion) + &
											 " and isnull(f_reposicion) and not isnull(f_alta)", &
											 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())

				iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion'))
				iw_contenedora.tab_1.il_handle_instalacion = lds_lista.GetItemNumber(ll_contador, 'handle')
				iw_contenedora.tab_1.of_validar_fecha_rep(ll_fila_int, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, true)
				//PACHO
				//
			END IF
			IF lds_lista.GetItemNumber(ll_contador, 'handle') > 0 THEN
				ll_inst_hija = This.FindItem(ChildTreeItem!, lds_lista.GetItemNumber(ll_contador, 'handle'))
				
				DO WHILE ll_inst_hija > 0
					This.of_interrumpir_hijos(ll_inst_hija,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup)
					ll_inst_hija = This.FindItem(NextTreeItem!, ll_inst_hija)
				LOOP
			END IF
			
			
		NEXT
		iw_contenedora.tab_1.f_actualizar_estado()
		SetPointer(Arrow!)
		
	ELSEIF gu_comunic.is_comunic.accion_retorno = "Desmarcar" THEN
		FOR ll_contador = 1 TO lds_lista.RowCount()
			IF NOT gb_red_trifasica THEN
				IF lds_lista.GetItemString(ll_contador, 'fase_completar') = lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir') THEN
					// Se desmarca la interrupci$$HEX1$$f300$$ENDHEX$$n de manera completa
					of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,lds_lista.GetItemNumber(ll_contador, 'handle'),0,FALSE)
					iw_contenedora.tab_1.f_actualizar_estado()
				ELSE
					// Se desmarca la interrupci$$HEX1$$f300$$ENDHEX$$n de manera parcial
					
					ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_instalacion = " + string(lds_lista.GetItemNumber(ll_contador, 'nro_instalacion') ),&
									  1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
									  
					IF ll_fila_int > 0 THEN
						// La variable ll_fila puede cambiar en la funci$$HEX1$$f300$$ENDHEX$$n of_mostrar_fases_int, ya que se
						// tiene que seleccionar la fila que tenga una interrupci$$HEX1$$f300$$ENDHEX$$n no resuelta en la primera 
						// fase interrumpida, y esta fila puede que no sea la seleccionada con anterioridad
						iw_contenedora.tab_1.of_mostrar_fases_int(ll_fila_int, This.of_ret_fase(lds_lista.GetItemNumber(ll_contador, 'handle')))
					END IF
					
					iw_contenedora.tab_1.il_handle_instalacion = lds_lista.GetItemNumber(ll_contador, 'handle')
					// Se comprueba si la fase A se desmarca
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),1,1) = '1' THEN
						iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked = false
						iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked, 1, TRUE,TRUE)					
					END IF
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),2,1) = '1' THEN
						iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked = false
						iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked, 2, TRUE,TRUE)	
					END IF
					IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),3,1) = '1' THEN
						iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked = false
						iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																			  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked, 3, TRUE,TRUE)	
					END IF
				END IF
			ELSE 
				// Se desmarca la interrupci$$HEX1$$f300$$ENDHEX$$n de manera completa
				of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,lds_lista.GetItemNumber(ll_contador, 'handle'),0,FALSE)
				iw_contenedora.tab_1.f_actualizar_estado()
				// Aunque parezca de perogrullo no hay que quitar las dos l$$HEX1$$ed00$$ENDHEX$$neas que 
				// vienen a continuaci$$HEX1$$f300$$ENDHEX$$n. Son para solucionar un problema con la 
				// dw de interrupciones: si se tienen interrumpidas tres instalaciones 
				// al mismo nivel, y desmarcas en grupo dos de ellas, cuando seleccionas 
				// la tercera en el $$HEX1$$e100$$ENDHEX$$rbol no se ven los datos de su interrupci$$HEX1$$f300$$ENDHEX$$n, 
				// aunque si est$$HEX2$$e1002000$$ENDHEX$$en d_datos_interrup. Esto ocurre si la red es trif$$HEX1$$e100$$ENDHEX$$sica
				iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.VScrollBar=TRUE
				iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.VScrollBar=FALSE

			END IF
		NEXT
	END IF

	iw_contenedora.tab_1.il_handle_instalacion = ll_handle_orig
	
END IF
IF IsValid(lds_lista) THEN DESTROY(lds_lista)
iw_contenedora.SetRedraw(True)
end event

event ue_otras_interr();Datetime ldt_fecha_sr, ldt_fecha_eb, ldt_f_nula
treeviewitem le_elemento
DataStore lds_lista
String ls_fase_instalacion = "", ls_nom_padre
Int li_cantidad
Long ll_nro_inst_padre, ll_nro_inst_desc
md_ingreso_incidencias lm_menu

lm_menu = iw_contenedora.MenuId
SetNull(ldt_f_nula)

gu_comunic.is_comunic.Intval1 = gi_nro_centro
gu_comunic.is_comunic.Intval2 = gi_nro_cmd
gu_comunic.is_comunic.Intval3 = gi_nro_puesto
gu_comunic.is_comunic.programa_llamante = "iw_2301"
gu_comunic.is_comunic.accion_llamada = "Inc. Otras Int."

IF gu_comunic1.is_comunic.Decval1 = 0 AND ib_int_descargo = FALSE THEN
	Open(w_2120_identificacion_instalacion)
END IF

IF gu_comunic1.is_comunic.Decval1 > 0 OR ib_int_descargo THEN

	ll_nro_inst_padre = Long(gu_comunic1.is_comunic.Decval1)

	SELECT COUNT(*)
	INTO :li_cantidad
	FROM SGD_INSTALACION  
	WHERE NRO_INSTALACION = :iw_contenedora.tab_1.idec_nro_instalacion_afectada AND BDI_JOB=0
	START WITH NRO_INSTALACION = :gu_comunic1.is_comunic.Decval1 AND BDI_JOB=0
	CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION;
	
	IF (SQLCA.SQLCode = 0 AND li_cantidad = 0) OR ib_int_descargo THEN
		IF ib_int_descargo = FALSE THEN
			SetNull(ldt_fecha_sr)
			gu_comunic.is_comunic.strval1 = gu_comunic1.is_comunic.strval2 // nombre de la instalacion seleccionada
			ls_nom_padre = gu_comunic1.is_comunic.strval2
			gu_comunic.is_comunic.longval1 = Long(gu_comunic1.is_comunic.Decval1)
			gu_comunic.is_comunic.longval2 = iw_contenedora.tab_1.il_nro_incidencia
			
			IF iw_contenedora.tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada THEN
				ldt_fecha_eb = iw_contenedora.tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDatetime(iw_contenedora.tab_1.ii_incidencia_enviado_brigada, 'f_alta')
				gu_comunic.is_comunic.longval3 = iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.find('isnull(f_hasta)', 0, &
																		iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount())
			END IF
			
			IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_servicio_repuesto THEN
				ldt_fecha_sr = iw_contenedora.tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDatetime(iw_contenedora.tab_1.ii_incidencia_servicio_repuesto, 'f_alta')
			END IF
			
			gu_comunic.is_comunic.datval1 = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.GetItemDatetime(1, 'f_deteccion')
			// Le quitamos los segundos a la fecha de detecci$$HEX1$$f300$$ENDHEX$$n
			gu_comunic.is_comunic.datval1 = Datetime(Date(gu_comunic.is_comunic.datval1),Time(String(Time(gu_comunic.is_comunic.datval1),"hh:mm")))
			gu_comunic.is_comunic.datval3 = ldt_fecha_eb
			gu_comunic.is_comunic.datval2 = ldt_fecha_sr
			IF ISNULL(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.st_causa.text) OR &
				iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.st_causa.text="" THEN
				
				gu_comunic.is_comunic.longval4 = 0
			ELSE
				gu_comunic.is_comunic.longval4 = 1
			END IF
			gu_comunic.is_comunic.Intval1 = iw_contenedora.tab_1.ii_estado_oper
			gu_comunic.is_comunic.w_llamante = iw_contenedora
			
			gu_rf.il_instalaciones[] = iw_contenedora.tab_1.il_inst_dig[]
			OpenWithParm(w_inc_multiples_inter, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup)
	
		ELSE
			of_agregar_int_descargo(lds_lista,2)
		END IF
		
		IF gu_comunic.is_comunic.accion_retorno <> "Cancelar" OR ib_int_descargo THEN
			IF ib_int_descargo = FALSE THEN
				lds_lista = Message.PowerObjectParm
			END IF
			
			String ls_fase_sugerida
			long ll_contador, ll_fila, ll_fila_int, ll_fila_dw
			
			IF gu_comunic.is_comunic.accion_retorno = "Marcar" OR ib_int_descargo THEN
				IF lds_lista.RowCount() > 0 THEN
//					IF  NOT gb_red_trifasica THEN
//						idt_f_alta_fase_a = lds_lista.GetItemdatetime(1, 'f_alta_fase_a')
//						idt_f_alta_fase_b = lds_lista.GetItemdatetime(1, 'f_alta_fase_b')
//						idt_f_alta_fase_c = lds_lista.GetItemdatetime(1, 'f_alta_fase_c')
//					ELSE
//						idt_f_alta_fase_a = lds_lista.GetItemdatetime(1, 'f_alta')
//					END IF
				END IF
				
				FOR ll_contador = 1 TO lds_lista.RowCount()
					IF NOT gb_red_trifasica THEN
						idt_f_alta_fase_a = lds_lista.GetItemdatetime(ll_contador, 'f_alta_fase_a')
						idt_f_alta_fase_b = lds_lista.GetItemdatetime(ll_contador, 'f_alta_fase_b')
						idt_f_alta_fase_c = lds_lista.GetItemdatetime(ll_contador, 'f_alta_fase_c')
						IF lds_lista.GetItemString(ll_contador, 'fase_completar') <> '000' THEN
							
							ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_instalacion = " + string(lds_lista.GetItemNumber(ll_contador, 'nro_instalacion') ),&
											  1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
						
							IF ll_fila_int > 0 THEN
								// La variable ll_fila puede cambiar en la funci$$HEX1$$f300$$ENDHEX$$n of_mostrar_fases_int, ya que se
								// tiene que seleccionar la fila que tenga una interrupci$$HEX1$$f300$$ENDHEX$$n no resuelta en la primera 
								// fase interrumpida, y esta fila puede que no sea la seleccionada con anterioridad
								iw_contenedora.tab_1.of_mostrar_fases_int(ll_fila_int, lds_lista.GetItemString(ll_contador, 'fase_instalacion'))
							END IF
							
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.il_nro_instalacion = lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')
							// Se completan las fases de una en una
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),1,1) = '1' THEN
								iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked = true
								iw_contenedora.tab_1.of_interrumpir_fase(TRUE,&
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked, &
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked, &
																					  1, TRUE, FALSE)
							END IF
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),2,1) = '1' THEN
								iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked = true
								iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																					  TRUE,&
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked,&
																					  2, TRUE, FALSE)
				
							END IF
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),3,1) = '1' THEN
								iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked = true
								iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																					  TRUE, 3, TRUE, FALSE)
				
							END IF
						END IF
						
						IF lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir') <> '000' THEN
							ls_fase_sugerida = ''
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir'),1,1) = '1' THEN
								ls_fase_sugerida = gs_fase_a
							END IF
							
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir'),2,1) = '1' THEN
								ls_fase_sugerida = ls_fase_sugerida + gs_fase_b
							END IF
							
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir'),3,1) = '1' THEN
								ls_fase_sugerida = ls_fase_sugerida + gs_fase_c
							END IF
							
							is_fase_int_permitida = ls_fase_sugerida
							ls_fase_instalacion = ""
							iw_contenedora.tab_1.tabpage_formulario.d_inf_general.SetItem(1,'fase_sugerida', ls_fase_sugerida)
													
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_instalacion'), 1,1) = '1' THEN
								ls_fase_instalacion = gs_fase_a
							END IF
							
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_instalacion'), 2,1) = '1' THEN
								ls_fase_instalacion += gs_fase_b
							END IF
							
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_instalacion'), 3,1) = '1' THEN
								ls_fase_instalacion += gs_fase_c
							END IF
							
							ll_fila_dw = iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Find("nro_instalacion="+string(lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')),&
																							1,iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.RowCount())
							
							IF ll_fila_dw > 0 THEN
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'f_reposicion', ldt_f_nula)
							ELSE
								ll_fila_dw = iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Insertrow(0)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nro_instalacion', lds_lista.GetItemNumber(ll_contador, 'nro_instalacion'))
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nom_instalacion', lds_lista.GetItemString(ll_contador, 'nom_instalacion'))
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'tipo_instalacion', lds_lista.GetItemNumber(ll_contador, 'tipo_instalacion'))
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'fase_instalacion', ls_fase_instalacion)
								IF ib_int_descargo THEN
									ll_nro_inst_desc = lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')
									
									SELECT NRO_INSTALACION, NOM_INSTALACION
									INTO :ll_nro_inst_padre, :ls_nom_padre
									FROM SGD_INSTALACION
									WHERE NRO_INSTALACION = (SELECT NRO_INST_PADRE
																	 FROM SGD_INSTALACION
																	 WHERE NRO_INSTALACION = :ll_nro_inst_desc AND BDI_JOB = 0 AND ESTADO = 0)  
											AND BDI_JOB = 0 AND ESTADO = 0;
									
								END IF

								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nom_inst_padre', ls_nom_padre)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nro_instalacion_padre', ll_nro_inst_padre)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'f_alta', fgnu_fecha_actual())
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_subestacion_at', fgci_tipo_subestacion_at)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_salida_at', fgci_tipo_salida_at)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_subestacion', fgci_tipo_subestacion)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_salida_mt', fgci_tipo_salida_mt)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_ct', fgci_tipo_ct)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_transformador', fgci_tipo_transformador)
								iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_salida_de_baja', fgci_tipo_salida_de_baja)
							END IF
							
							of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,&
														 lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')	,4, TRUE)
							
							IF iw_contenedora.tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
								iw_contenedora.tab_1.ii_alcance = fgci_incidencia_con_interrupcion
								iw_contenedora.tab_1.tabpage_formulario.d_inf_general.Setitem(1, 'alcance', fgci_incidencia_con_interrupcion)
								lm_menu.m_consultar.m_avisos.enabled=true
								lm_menu.m_consultar.m_suministrosimportantes.enabled = true
								// Se resetean las variables con las que se accede a la informaci$$HEX1$$f300$$ENDHEX$$n de los estados
								iw_contenedora.tab_1.of_iniciar_estados_oper()
								// Se analiza la incidencia para cambiar la datawindow de los estados
								iw_contenedora.fw_evaluo_inc_calidad(iw_contenedora.tab_1.ii_tipo_incid, False, fgci_incidencia_con_interrupcion)
							END IF
						END IF
					ELSE
						idt_f_alta_fase_a = lds_lista.GetItemdatetime(ll_contador, 'f_alta')
						ll_fila_dw = iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Find("nro_instalacion="+string(lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')),&
																					1,iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.RowCount())
							
						IF ll_fila_dw > 0 THEN
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'f_reposicion', ldt_f_nula)
						ELSE
							ll_fila_dw = iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Insertrow(0)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nro_instalacion', lds_lista.GetItemNumber(ll_contador, 'nro_instalacion'))
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nom_instalacion', lds_lista.GetItemString(ll_contador, 'nom_instalacion'))
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'tipo_instalacion', lds_lista.GetItemNumber(ll_contador, 'tipo_instalacion'))
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'fase_instalacion', ls_fase_instalacion)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nom_inst_padre', ls_nom_padre)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'nro_instalacion_padre', ll_nro_inst_padre)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'f_alta', fgnu_fecha_actual())
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_subestacion_at', fgci_tipo_subestacion_at)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_salida_at', fgci_tipo_salida_at)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_subestacion', fgci_tipo_subestacion)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_salida_mt', fgci_tipo_salida_mt)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_ct', fgci_tipo_ct)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_transformador', fgci_tipo_transformador)
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'ctipo_salida_de_baja', fgci_tipo_salida_de_baja)
						END IF
						
						of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,&
														 lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')	,4, TRUE)
						
						IF iw_contenedora.tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
							iw_contenedora.tab_1.ii_alcance = fgci_incidencia_con_interrupcion
							iw_contenedora.tab_1.tabpage_formulario.d_inf_general.Setitem(1, 'alcance', fgci_incidencia_con_interrupcion)
							lm_menu.m_consultar.m_avisos.enabled=true
							lm_menu.m_consultar.m_suministrosimportantes.enabled = true
							// Se resetean las variables con las que se accede a la informaci$$HEX1$$f300$$ENDHEX$$n de los estados
							iw_contenedora.tab_1.of_iniciar_estados_oper()
							// Se analiza la incidencia para cambiar la datawindow de los estados
							iw_contenedora.fw_evaluo_inc_calidad(iw_contenedora.tab_1.ii_tipo_incid, False, fgci_incidencia_con_interrupcion)
						END IF
					END IF
				NEXT
				
			ELSEIF gu_comunic.is_comunic.accion_retorno = "Resolver" THEN
				long ll_nro_instalacion
				
				FOR ll_contador = 1 TO lds_lista.RowCount()
				
					ll_nro_instalacion = lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')
					
					IF NOT gb_red_trifasica THEN
						iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.il_nro_instalacion = lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')
						
						// Fase A
						IF NOT IsNull(lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_a')) THEN
							// Se busca el registro donde hay que a$$HEX1$$f100$$ENDHEX$$adir la fecha de reposici$$HEX1$$f300$$ENDHEX$$n
							// en la datawindow de interrupciones
							ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
											  Find("nro_instalacion="+string(ll_nro_instalacion) + &
													 " and isnull(f_reposicion_fase_a) and not isnull(f_alta_fase_a)", &
													 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())
													 
							IF ll_fila_int > 0 THEN
								iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion_fase_a', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_a'))
								iw_contenedora.tab_1.of_validar_fecha_rep(ll_fila_int, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, False)
							END IF
						END IF
						
						// Fase B
						IF NOT IsNull(lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_b')) THEN
							// Se busca el registro donde hay que a$$HEX1$$f100$$ENDHEX$$adir la fecha de reposici$$HEX1$$f300$$ENDHEX$$n
							// en la datawindow de interrupciones
							ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
											  Find("nro_instalacion="+string(ll_nro_instalacion) + &
													 " and isnull(f_reposicion_fase_b) and not isnull(f_alta_fase_b)", &
													 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())
													 
							IF ll_fila_int > 0 THEN
								iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion_fase_b', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_b'))
								iw_contenedora.tab_1.of_validar_fecha_rep(ll_fila_int, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, false)
							END IF
						END IF
						
						// Fase C
						IF NOT IsNull(lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_c')) THEN
							// Se busca el registro donde hay que a$$HEX1$$f100$$ENDHEX$$adir la fecha de reposici$$HEX1$$f300$$ENDHEX$$n
							// en la datawindow de interrupciones
							ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
											  Find("nro_instalacion="+string(ll_nro_instalacion) + &
													 " and isnull(f_reposicion_fase_c) and not isnull(f_alta_fase_c)", &
													 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())
													 
							IF ll_fila_int > 0 THEN
								iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion_fase_c', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion_fase_c'))
								iw_contenedora.tab_1.of_validar_fecha_rep(ll_fila_int, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, false)
							END IF
						END IF
					ELSE
						ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.&
											  Find("nro_instalacion="+string(ll_nro_instalacion) + &
													 " and isnull(f_reposicion) and not isnull(f_alta)", &
													 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount())
						ll_fila_dw = iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Find("nro_instalacion="+string(lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')),&
																			1,iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.RowCount())
						
						iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila_int, 'f_reposicion', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion'))
						iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SetItem(ll_fila_dw, 'f_reposicion', lds_lista.GetItemDateTime(ll_contador, 'f_reposicion'))
					END IF
		
				NEXT
				iw_contenedora.tab_1.f_actualizar_estado()
				
			ELSEIF gu_comunic.is_comunic.accion_retorno = "Desmarcar" THEN
				FOR ll_contador = 1 TO lds_lista.RowCount()
					IF NOT gb_red_trifasica THEN
						IF lds_lista.GetItemString(ll_contador, 'fase_completar') = lds_lista.GetItemString(ll_contador, 'fase_a$$HEX1$$f100$$ENDHEX$$adir') THEN
							// Se desmarca la interrupci$$HEX1$$f300$$ENDHEX$$n de manera completa
							of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,lds_lista.GetItemNumber(ll_contador, 'nro_instalacion'),5,FALSE)
							iw_contenedora.tab_1.f_actualizar_estado()
						ELSE
							// Se desmarca la interrupci$$HEX1$$f300$$ENDHEX$$n de manera parcial
							
							ll_fila_int = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_instalacion = " + string(lds_lista.GetItemNumber(ll_contador, 'nro_instalacion') ),&
											  1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
											  
							IF ll_fila_int > 0 THEN
								// La variable ll_fila puede cambiar en la funci$$HEX1$$f300$$ENDHEX$$n of_mostrar_fases_int, ya que se
								// tiene que seleccionar la fila que tenga una interrupci$$HEX1$$f300$$ENDHEX$$n no resuelta en la primera 
								// fase interrumpida, y esta fila puede que no sea la seleccionada con anterioridad
								iw_contenedora.tab_1.of_mostrar_fases_int(ll_fila_int, lds_lista.GetItemString(ll_contador, 'fase_instalacion'))
							END IF
							
							iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.il_nro_instalacion = lds_lista.GetItemNumber(ll_contador, 'nro_instalacion')
							
							// Se comprueba si la fase A se desmarca
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),1,1) = '1' THEN
								iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked = false
								iw_contenedora.tab_1.of_interrumpir_fase(FALSE,&
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked,&
																					  1,TRUE,FALSE)					
							END IF
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),2,1) = '1' THEN
								iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked = false
								iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																					  FALSE,&
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked,&
																					  2,TRUE,FALSE)	
							END IF
							IF Mid(lds_lista.GetItemString(ll_contador, 'fase_completar'),3,1) = '1' THEN
								iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked = false
								iw_contenedora.tab_1.of_interrumpir_fase(iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked,&
																					  iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked,&
																					  FALSE,3,TRUE,FALSE)	
							END IF
						END IF
					ELSE 
						// Se desmarca la interrupci$$HEX1$$f300$$ENDHEX$$n de manera completa
						of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,lds_lista.GetItemNumber(ll_contador, 'nro_instalacion'),5,FALSE)
						iw_contenedora.tab_1.f_actualizar_estado()
					END IF
				NEXT
			END IF
		END IF
		
		iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.SelectRow(0,False)
		This.HideSelection = FALSE
		This.Event SelectionChanged(il_handle_seleccionado, il_handle_seleccionado)
	ELSE
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada pertenece al $$HEX1$$e100$$ENDHEX$$rbol de interrupciones.")
	END IF
END IF

IF IsValid(lds_lista) THEN
	DESTROY(lds_lista)
END IF
end event

public function integer of_carga_elemento (long pl_cod_elemento, long pl_handle_origen, integer pi_tipo_carga);// pl_cod_elemento Codigo de instalacion que se busca
//
// pl_handle_origen Rama de la que van a pender los hijos
//
// pi_tipo_carga 1 Carga buscando por nro_inst_padre
//					  2 Carga por nro_instalacion

  long ll_instalacion_origen,ll_handle_destino,li_conta,ll_inst_unificada,ll_instalac[],li_contador,ll_encontrado
  string ls_inst_opera

//***************************************
//**  OSGI 2001.1  	29/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
String ls_select_hijo, &
		 ls_select_padre, &
		 ls_from_hijo, &
		 ls_from_padre, &
		 ls_where_hijo, &
		 ls_where_padre, &
		 ls_tipo_area


//**  OSGI 2001.1  	29/05/2001   DECLARE cu_carga_elemento CURSOR FOR  
//**  OSGI 2001.1  	29/05/2001    SELECT "SGD_INSTALACION"."NRO_INSTALACION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."NOM_INSTALACION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."TIPO_INSTALACION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."CO_NIVEL",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."TENSION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."NRO_INST_PADRE",
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."POT_INSTALADA",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."POT_CONTRATADA",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."KWH",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."CANT_CLI",
//**  OSGI 2001.1  	29/05/2001  			NVL(FGCI_FASE_INSTALACION("SGD_INSTALACION"."TIPO_CONEXION"), 'ABC')
//**  OSGI 2001.1  	29/05/2001      FROM "SGD_INSTALACION"  
//**  OSGI 2001.1  	29/05/2001     WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :pl_cod_elemento   AND
//**  OSGI 2001.1  	29/05/2001  			"SGD_INSTALACION"."BDI_JOB" = 0  AND
//**  OSGI 2001.1  	29/05/2001  			"SGD_INSTALACION"."TIPO_INSTALACION" <> :fgci_tipo_tramo ;
//**  OSGI 2001.1  	29/05/2001  
//**  OSGI 2001.1  	29/05/2001   DECLARE cu_carga_elemento_padre CURSOR FOR  
//**  OSGI 2001.1  	29/05/2001    SELECT "SGD_INSTALACION"."NRO_INSTALACION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."NOM_INSTALACION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."TIPO_INSTALACION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."CO_NIVEL",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."TENSION",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."NRO_INST_PADRE",
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."POT_INSTALADA",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."POT_CONTRATADA",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."KWH",   
//**  OSGI 2001.1  	29/05/2001           "SGD_INSTALACION"."CANT_CLI",
//**  OSGI 2001.1  	29/05/2001  			NVL(FGCI_FASE_INSTALACION("SGD_INSTALACION"."TIPO_CONEXION"), 'ABC')
//**  OSGI 2001.1  	29/05/2001      FROM "SGD_INSTALACION"  
//**  OSGI 2001.1  	29/05/2001     WHERE "SGD_INSTALACION"."NRO_INST_PADRE" = :pl_cod_elemento   AND
//**  OSGI 2001.1  	29/05/2001  			"SGD_INSTALACION"."BDI_JOB" = 0 AND
//**  OSGI 2001.1  	29/05/2001  			"SGD_INSTALACION"."TIPO_INSTALACION" <> :fgci_tipo_tramo ;
//***************************************
//**  OSGI 2001.1  	29/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


str_datos_rama lstr_datos_rama

treeviewitem le_elemento

// Pacho, incidencias compartidas SGI/Operacion

IF gb_operaciones_inst and upperbound( iw_contenedora.tab_1.il_inst_dig[]) > 0 THEN
	FOR li_conta = 1 to upperbound( iw_contenedora.tab_1.il_inst_dig[]) 
		if isnull(ls_inst_opera) or ls_inst_opera = "" then
			ls_inst_opera = " AND SGD_INSTALACION.NRO_INSTALACION NOT IN (" + string(iw_contenedora.tab_1.il_inst_dig[li_conta])
		else 
			ls_inst_opera = ls_inst_opera + ", " + string(iw_contenedora.tab_1.il_inst_dig[li_conta]) 
		end if
	NEXT
	if not isnull(ls_inst_opera) or ls_inst_opera = "" then
		ls_inst_opera = ls_inst_opera + ")"
	end if
END IF

ll_instalacion_origen = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")

IF pi_tipo_carga = 1 THEN
	//***************************************
	//**  OSGI 2001.1  	29/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	ls_select_padre = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
							" SGD_INSTALACION.NOM_INSTALACION, " + &
							" SGD_INSTALACION.TIPO_INSTALACION, " + &
							" SGD_INSTALACION.CO_NIVEL, " + &
							" SGD_INSTALACION.TENSION, " + &
							" SGD_INSTALACION.NRO_INST_PADRE, " + &
							" SGD_INSTALACION.POT_INSTALADA, " + &
							" SGD_INSTALACION.POT_CONTRATADA, " + &
							" SGD_INSTALACION.KWH, " + &
							" SGD_INSTALACION.CANT_CLI, " + &
							" NVL(FGCI_FASE_INSTALACION(SGD_INSTALACION.TIPO_CONEXION), '" + gs_fase_a + gs_fase_b + gs_fase_c + "'),  " + &
							" NVL(SGD_INSTALACION.TIPO_CT,0), " + &
							" NVL(SGD_INSTALACION.TIPO_CONEXION,0),NVL(SGD_INSTALACION.NRO_INST_UNIFICADA,0) " 

	If Not gb_red_trifasica And ib_tipo_area Then ls_select_padre += ", SGD_INSTALACION.TIPO_AREA "


	ls_from_padre = " FROM SGD_INSTALACION "

	ls_where_padre = " WHERE SGD_INSTALACION.NRO_INST_PADRE = " + String(pl_cod_elemento) + " AND " + &
							" SGD_INSTALACION.BDI_JOB = 0 AND " + &
							" SGD_INSTALACION.TIPO_INSTALACION <> " + String(fgci_tipo_tramo) + " AND " + &
							" SGD_INSTALACION.ESTADO = 0 " + ls_inst_opera


	If ib_usa_trafo Then
		ls_select_padre =	fg_cursor_sql(1, ls_select_padre, ls_from_padre, ls_where_padre, " ")
	Else
		ls_select_padre = ls_select_padre + ls_from_padre + ls_where_padre
	End If


	//**  OSGI 2001.1  	29/05/2001  	OPEN cu_carga_elemento_padre;


	DECLARE cu_carga_elemento_padre DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_select_padre ;
	OPEN DYNAMIC cu_carga_elemento_padre ;
	//***************************************
	//**  OSGI 2001.1  	29/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


	//***************************************
	//**  OSGI 2001.1  	19/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	19/06/2001  	FETCH cu_carga_elemento_padre INTO :lstr_datos_rama.ll_nro_instalacion,
	//**  OSGI 2001.1  	19/06/2001  										  		  :lstr_datos_rama.ls_nom_instalacion,
	//**  OSGI 2001.1  	19/06/2001  										  		  :lstr_datos_rama.li_tipo_instalacion,
	//**  OSGI 2001.1  	19/06/2001  										  		  :lstr_datos_rama.li_co_nivel,
	//**  OSGI 2001.1  	19/06/2001  										  	     :lstr_datos_rama.li_tension,
	//**  OSGI 2001.1  	19/06/2001  										  		  :lstr_datos_rama.ll_nro_inst_padre,
	//**  OSGI 2001.1  	19/06/2001  										  		  :lstr_datos_rama.ll_pot_instalada,
	//**  OSGI 2001.1  	19/06/2001  										  		  :lstr_datos_rama.ll_pot_contratada,
	//**  OSGI 2001.1  	19/06/2001  										  	     :lstr_datos_rama.ll_kwh,
	//**  OSGI 2001.1  	19/06/2001  										  		  :lstr_datos_rama.ll_ccli,
	//**  OSGI 2001.1  	19/06/2001  												  :lstr_datos_rama.ls_fase;

	If Not gb_red_trifasica And ib_tipo_area Then
		FETCH cu_carga_elemento_padre INTO :lstr_datos_rama.ll_nro_instalacion,
													  :lstr_datos_rama.ls_nom_instalacion,
													  :lstr_datos_rama.li_tipo_instalacion,
													  :lstr_datos_rama.li_co_nivel,
													  :lstr_datos_rama.li_tension,
													  :lstr_datos_rama.ll_nro_inst_padre,
													  :lstr_datos_rama.ll_pot_instalada,
													  :lstr_datos_rama.ll_pot_contratada,
													  :lstr_datos_rama.ll_kwh,
													  :lstr_datos_rama.ll_ccli,
													  :lstr_datos_rama.ls_fase,
													  :lstr_datos_rama.li_tipo_ct,
													  :lstr_datos_rama.li_tipo_conexion,
													  :ll_inst_unificada,
													  :lstr_datos_rama.tipo_area;
	Else
		FETCH cu_carga_elemento_padre INTO :lstr_datos_rama.ll_nro_instalacion,
													  :lstr_datos_rama.ls_nom_instalacion,
													  :lstr_datos_rama.li_tipo_instalacion,
													  :lstr_datos_rama.li_co_nivel,
													  :lstr_datos_rama.li_tension,
													  :lstr_datos_rama.ll_nro_inst_padre,
													  :lstr_datos_rama.ll_pot_instalada,
													  :lstr_datos_rama.ll_pot_contratada,
													  :lstr_datos_rama.ll_kwh,
													  :lstr_datos_rama.ll_ccli,
													  :lstr_datos_rama.ls_fase,
  													  :lstr_datos_rama.li_tipo_ct,
													  :lstr_datos_rama.li_tipo_conexion,
													  :ll_inst_unificada;
	End If
	//***************************************
	//**  OSGI 2001.1  	19/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
ELSE
	//***************************************
	//**  OSGI 2001.1  	29/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	ls_select_hijo = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
							" SGD_INSTALACION.NOM_INSTALACION, " + &
							" SGD_INSTALACION.TIPO_INSTALACION, " + &
							" SGD_INSTALACION.CO_NIVEL, " + &
							" SGD_INSTALACION.TENSION, " + &
							" SGD_INSTALACION.NRO_INST_PADRE, " + &
							" SGD_INSTALACION.POT_INSTALADA, " + &
							" SGD_INSTALACION.POT_CONTRATADA, " + &
							" SGD_INSTALACION.KWH, " + &
							" SGD_INSTALACION.CANT_CLI, " + &
							" NVL(FGCI_FASE_INSTALACION(SGD_INSTALACION.TIPO_CONEXION), '" + gs_fase_a + gs_fase_b + gs_fase_c + "'),  " + &
							" NVL(SGD_INSTALACION.TIPO_CT,0), " + &
							" NVL(SGD_INSTALACION.TIPO_CONEXION,0), NVL(SGD_INSTALACION.NRO_INST_UNIFICADA,0) " 

	If Not gb_red_trifasica And ib_tipo_area Then ls_select_hijo += ", SGD_INSTALACION.TIPO_AREA "


	ls_from_hijo = " FROM SGD_INSTALACION "

	ls_where_hijo = " WHERE SGD_INSTALACION.NRO_INSTALACION = " + String(pl_cod_elemento) + " AND " + &
							" SGD_INSTALACION.BDI_JOB = 0  AND " + &
							" SGD_INSTALACION.TIPO_INSTALACION <> " + String(fgci_tipo_tramo) + " AND " + &
							" SGD_INSTALACION.ESTADO = 0 " + ls_inst_opera


	If ib_usa_trafo Then
		ls_select_hijo = fg_cursor_sql(1, ls_select_hijo, ls_from_hijo, ls_where_hijo, " ")
	Else
		ls_select_hijo = ls_select_hijo + ls_from_hijo + ls_where_hijo
	End If


	//**  OSGI 2001.1  	29/05/2001  	OPEN cu_carga_elemento;


	DECLARE cu_carga_elemento DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_select_hijo ;
	OPEN DYNAMIC cu_carga_elemento ;
	//***************************************
	//**  OSGI 2001.1  	29/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************



	//***************************************
	//**  OSGI 2001.1  	19/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	19/06/2001  	FETCH cu_carga_elemento INTO :lstr_datos_rama.ll_nro_instalacion,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.ls_nom_instalacion,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.li_tipo_instalacion,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.li_co_nivel,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.li_tension,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.ll_nro_inst_padre,
	//**  OSGI 2001.1  	19/06/2001  								  		  :lstr_datos_rama.ll_pot_instalada,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.ll_pot_contratada,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.ll_kwh,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.ll_ccli,
	//**  OSGI 2001.1  	19/06/2001  										  :lstr_datos_rama.ls_fase;

	If Not gb_red_trifasica And ib_tipo_area Then
		FETCH cu_carga_elemento INTO :lstr_datos_rama.ll_nro_instalacion,
											  :lstr_datos_rama.ls_nom_instalacion,
											  :lstr_datos_rama.li_tipo_instalacion,
											  :lstr_datos_rama.li_co_nivel,
											  :lstr_datos_rama.li_tension,
											  :lstr_datos_rama.ll_nro_inst_padre,
											  :lstr_datos_rama.ll_pot_instalada,
											  :lstr_datos_rama.ll_pot_contratada,
											  :lstr_datos_rama.ll_kwh,
											  :lstr_datos_rama.ll_ccli,
											  :lstr_datos_rama.ls_fase,
											  :lstr_datos_rama.li_tipo_ct,
											  :lstr_datos_rama.li_tipo_conexion,
											  :ll_inst_unificada,
											  :lstr_datos_rama.tipo_area;
	Else
		FETCH cu_carga_elemento INTO :lstr_datos_rama.ll_nro_instalacion,
											  :lstr_datos_rama.ls_nom_instalacion,
											  :lstr_datos_rama.li_tipo_instalacion,
											  :lstr_datos_rama.li_co_nivel,
											  :lstr_datos_rama.li_tension,
											  :lstr_datos_rama.ll_nro_inst_padre,
											  :lstr_datos_rama.ll_pot_instalada,
											  :lstr_datos_rama.ll_pot_contratada,
											  :lstr_datos_rama.ll_kwh,
											  :lstr_datos_rama.ll_ccli,
											  :lstr_datos_rama.ls_fase,
											  :lstr_datos_rama.li_tipo_ct,
											  :lstr_datos_rama.li_tipo_conexion,
											  :ll_inst_unificada;
	End If
	//***************************************
	//**  OSGI 2001.1  	19/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF

DO WHILE sqlca.sqlcode = 0

		ll_encontrado = 0

		if upperbound(ll_instalac[]) > 0 then
			
			for li_contador = 1 to upperbound(ll_instalac[])
				if ll_instalac[li_contador] = ll_inst_unificada or ll_instalac[li_contador] = lstr_datos_rama.ll_nro_instalacion then ll_encontrado = 1
			next
			
		end if

		IF ll_inst_unificada > 0 and lstr_datos_rama.li_tipo_instalacion <> fgci_tipo_salida_de_baja  and lstr_datos_rama.li_tipo_instalacion <> fgci_tipo_salida_mt and gi_pais = 8 then // Comprueba inst fict en mold. La instalacion es ficticia.
		
		IF ll_encontrado = 0 then // SI NO ENCUENTRA METEMOS EL ORIGINAL

			 ll_instalac[upperbound(ll_instalac[]) + 1] = ll_inst_unificada
			
			 SELECT SGD_INSTALACION.NRO_INSTALACION, 
						 SGD_INSTALACION.NOM_INSTALACION,
						 SGD_INSTALACION.TIPO_INSTALACION,
						 SGD_INSTALACION.CO_NIVEL,
						 SGD_INSTALACION.TENSION,
						 SGD_INSTALACION.NRO_INST_PADRE,
						 SGD_INSTALACION.POT_INSTALADA,
						 SGD_INSTALACION.POT_CONTRATADA,
						 SGD_INSTALACION.KWH,
						 SGD_INSTALACION.CANT_CLI,
						0,
						 NVL(SGD_INSTALACION.TIPO_CT,0), 
						 NVL(SGD_INSTALACION.TIPO_CONEXION,0), 
						 NVL(SGD_INSTALACION.NRO_INST_UNIFICADA,0) 
			  INTO :lstr_datos_rama.ll_nro_instalacion,
					:lstr_datos_rama.ls_nom_instalacion,
					:lstr_datos_rama.li_tipo_instalacion,
					:lstr_datos_rama.li_co_nivel,
					:lstr_datos_rama.li_tension,
					:lstr_datos_rama.ll_nro_inst_padre,
					:lstr_datos_rama.ll_pot_instalada,
					:lstr_datos_rama.ll_pot_contratada,
					:lstr_datos_rama.ll_kwh,
					:lstr_datos_rama.ll_ccli,
					:lstr_datos_rama.ls_fase,
					:lstr_datos_rama.li_tipo_ct,
					:lstr_datos_rama.li_tipo_conexion,
					:ll_inst_unificada
			  FROM SGD_INSTALACION
			  WHERE ( SGD_INSTALACION.NRO_INSTALACION = :ll_inst_unificada AND
							 SGD_INSTALACION.ESTADO = 0 );

			IF SQLCA.SQLCODE <> 0 THEN
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se encontraron datos para la instalaci$$HEX1$$f300$$ENDHEX$$n unificada.",information!,ok!)
			END IF
		END IF		  
	END IF
	
	//Cargo la estructura de la rama nueva
	
	//Etiqueta de elemento
	
	IF ll_encontrado = 0 then 

		ll_instalac[upperbound(ll_instalac[])+1] = lstr_datos_rama.ll_nro_instalacion

		IF ll_instalacion_origen = lstr_datos_rama.ll_nro_instalacion THEN
		
			le_elemento.label = "* " + trim(lstr_datos_rama.ls_nom_instalacion) 
			
		ELSE
			
			le_elemento.label = trim(lstr_datos_rama.ls_nom_instalacion) 
			
		END IF
		
		IF gb_red_trifasica = FALSE THEN
			le_elemento.label = le_elemento.label + + " (" + lstr_datos_rama.ls_fase + ")"
			
			//***************************************
			//**  OSGI 2001.1  	19/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			ls_tipo_area = ''
			
			If ib_tipo_area And lstr_datos_rama.li_tipo_instalacion = fgci_tipo_ct Then
				CHOOSE CASE Upper(lstr_datos_rama.tipo_area)
					CASE 'C'
							ls_tipo_area = '  Cuidad '
					CASE 'U'
							ls_tipo_area = '  Urbano '
					CASE 'R'
							ls_tipo_area = '  Rural '
				END CHOOSE
	
				le_elemento.label += ls_tipo_area
			End If		
			//***************************************
			//**  OSGI 2001.1  	19/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		END IF
		
		//Datos de la rama
		le_elemento.data = lstr_datos_rama
		le_elemento.bold = false
		
		IF pi_tipo_carga = 1 THEN
			//Icono del elemento	
			of_icono_rama( lstr_datos_rama.li_tipo_instalacion, + &
									lstr_datos_rama.ll_nro_instalacion, + &
									iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, + &
									le_elemento,-1)
		END IF		
	
		ll_handle_destino=THIS.InsertItemSort(pl_handle_origen, le_elemento)
		
		IF pi_tipo_carga = 2 THEN
			of_icono_rama( lstr_datos_rama.li_tipo_instalacion, + &
							lstr_datos_rama.ll_nro_instalacion, + &
							iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup, + &
							le_elemento, ll_handle_destino)
			This.SetItem(ll_handle_destino, le_elemento)
		END IF
	
		
		IF gb_red_trifasica = FALSE THEN
			IF FindItem(ParentTreeItem!, ll_handle_destino) > 0 THEN
				// Se propagan a los hijos los datos de las fases afectadas
				lstr_datos_rama = le_elemento.data 
				lstr_datos_rama.ls_fase_afectada = of_unir_fases(lstr_datos_rama.ls_fase_afectada,&
										of_ret_fase_afectada(FindItem(ParentTreeItem!, ll_handle_destino), lstr_datos_rama.li_tipo_conexion, lstr_datos_rama.ls_fase))
				
				le_elemento.data = lstr_datos_rama
				This.SetItem(ll_handle_destino, le_elemento)
			END IF
		END IF
		
	END IF	
	


	IF pi_tipo_carga = 1 THEN
		//***************************************
		//**  OSGI 2001.1  	19/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		//**  OSGI 2001.1  	19/06/2001  		FETCH cu_carga_elemento_padre INTO :lstr_datos_rama.ll_nro_instalacion,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ls_nom_instalacion,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.li_tipo_instalacion,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.li_co_nivel,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.li_tension,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_nro_inst_padre,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_pot_instalada,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_pot_contratada,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_kwh,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_ccli,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ls_fase;
	
		If Not gb_red_trifasica And ib_tipo_area Then
			FETCH cu_carga_elemento_padre INTO :lstr_datos_rama.ll_nro_instalacion,
														  :lstr_datos_rama.ls_nom_instalacion,
														  :lstr_datos_rama.li_tipo_instalacion,
														  :lstr_datos_rama.li_co_nivel,
														  :lstr_datos_rama.li_tension,
														  :lstr_datos_rama.ll_nro_inst_padre,
														  :lstr_datos_rama.ll_pot_instalada,
														  :lstr_datos_rama.ll_pot_contratada,
														  :lstr_datos_rama.ll_kwh,
														  :lstr_datos_rama.ll_ccli,
														  :lstr_datos_rama.ls_fase,
														  :lstr_datos_rama.li_tipo_ct,
													  	  :lstr_datos_rama.li_tipo_conexion,
											 			  :ll_inst_unificada,
														  :lstr_datos_rama.tipo_area;
		Else
			FETCH cu_carga_elemento_padre INTO :lstr_datos_rama.ll_nro_instalacion,
														  :lstr_datos_rama.ls_nom_instalacion,
														  :lstr_datos_rama.li_tipo_instalacion,
														  :lstr_datos_rama.li_co_nivel,
														  :lstr_datos_rama.li_tension,
														  :lstr_datos_rama.ll_nro_inst_padre,
														  :lstr_datos_rama.ll_pot_instalada,
														  :lstr_datos_rama.ll_pot_contratada,
														  :lstr_datos_rama.ll_kwh,
														  :lstr_datos_rama.ll_ccli,
														  :lstr_datos_rama.ls_fase,
														  :lstr_datos_rama.li_tipo_ct,
													  	  :lstr_datos_rama.li_tipo_conexion,
											 			  :ll_inst_unificada;
		End If	
		//***************************************
		//**  OSGI 2001.1  	19/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	ELSE
		//***************************************
		//**  OSGI 2001.1  	19/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		//**  OSGI 2001.1  	19/06/2001  		FETCH cu_carga_elemento 		INTO :lstr_datos_rama.ll_nro_instalacion,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ls_nom_instalacion,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.li_tipo_instalacion,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.li_co_nivel,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.li_tension,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_nro_inst_padre,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_pot_instalada,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_pot_contratada,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_kwh,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ll_ccli,
		//**  OSGI 2001.1  	19/06/2001  													  :lstr_datos_rama.ls_fase;
													  
		If Not gb_red_trifasica And ib_tipo_area Then
			FETCH cu_carga_elemento 		INTO :lstr_datos_rama.ll_nro_instalacion,
														  :lstr_datos_rama.ls_nom_instalacion,
														  :lstr_datos_rama.li_tipo_instalacion,
														  :lstr_datos_rama.li_co_nivel,
														  :lstr_datos_rama.li_tension,
														  :lstr_datos_rama.ll_nro_inst_padre,
														  :lstr_datos_rama.ll_pot_instalada,
														  :lstr_datos_rama.ll_pot_contratada,
														  :lstr_datos_rama.ll_kwh,
														  :lstr_datos_rama.ll_ccli,
														  :lstr_datos_rama.ls_fase,
														  :lstr_datos_rama.li_tipo_ct,
													  	  :lstr_datos_rama.li_tipo_conexion,
											 			  :ll_inst_unificada,
														  :lstr_datos_rama.tipo_area;
		Else
			FETCH cu_carga_elemento 		INTO :lstr_datos_rama.ll_nro_instalacion,
														  :lstr_datos_rama.ls_nom_instalacion,
														  :lstr_datos_rama.li_tipo_instalacion,
														  :lstr_datos_rama.li_co_nivel,
														  :lstr_datos_rama.li_tension,
														  :lstr_datos_rama.ll_nro_inst_padre,
														  :lstr_datos_rama.ll_pot_instalada,
														  :lstr_datos_rama.ll_pot_contratada,
														  :lstr_datos_rama.ll_kwh,
														  :lstr_datos_rama.ll_ccli,
														  :lstr_datos_rama.ls_fase,
														  :lstr_datos_rama.li_tipo_ct,
													  	  :lstr_datos_rama.li_tipo_conexion,
											 			  :ll_inst_unificada;
		End If
		//***************************************
		//**  OSGI 2001.1  	19/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	END IF

LOOP


IF pi_tipo_carga = 1 THEN

	CLOSE cu_carga_elemento_padre;

ELSE

	CLOSE cu_carga_elemento;

END IF

RETURN ll_handle_destino
end function

public function integer of_estado_hijos (long handle);// Recibe Handle
// Respuesta 0 No ninguno marcado
//				 1 Algunos 
//				 2 Todos
//				 3 Actual Marcado
//				 4 Elemento Superior con todas las fases marcadas
//				 5 Elemento superior con algunas fases marcadas	
//				-1 No tiene hijos

int li_nuevo_handle, li_marcados = 0, li_total = 0, li_respuesta, li_handle_padre, li_fila
treeviewitem le_elemento
str_datos_rama lstr_datos_rama

// Se busca el primer Hijo
li_nuevo_handle = THIS.FINDITEM(ChildTreeItem!,handle)

THIS.GETITEM(handle,le_elemento)

// Si el elemento actual esta marcado solo marcar instalacion origen
//Left(le_elemento.label, 2) = 'X ' &
//IF le_elemento.bold = TRUE AND le_elemento.StatePictureIndex = 2  & 
//	OR le_elemento.pictureindex = f_icono_arbol(of_ret_tipo(handle) + ii_instalaciones_repuestas) THEN
IF le_elemento.bold = TRUE AND le_elemento.StatePictureIndex = 2  & 
	OR le_elemento.StatePictureIndex = 3 THEN

	
	THIS.GETITEM(handle,le_elemento)
	lstr_datos_rama = le_elemento.data
	
	IF gb_red_trifasica THEN
//		IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
//						" and not isnull(f_reposicion)" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) > 0 THEN
//			RETURN 1
//		ELSE
			RETURN 3
//		END IF
	ELSE 
		li_fila = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find&
				("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
		IF li_fila > 0 THEN
//			IF ISNULL(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.GetitemDatetime(li_fila,'f_reposicion_fase_a')) &
//				AND ISNULL(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.GetitemDatetime(li_fila,'f_reposicion_fase_b')) &
//				AND ISNULL(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.GetitemDatetime(li_fila,'f_reposicion_fase_c')) THEN
			IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find&
				("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
				' and ((IsNull(f_reposicion_fase_a)) and (IsNull(f_reposicion_fase_b)) and (IsNull(f_reposicion_fase_c)))' & 
				, 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) > 0 THEN
	
				return 3
			ELSE
				return 1
			END IF
		ELSE
			return 3
		END IF
	END IF
END IF

// Busco algun elemento superior marcado

li_handle_padre = handle

DO 
	
	li_handle_padre = THIS.FINDITEM(ParentTreeItem!,li_handle_padre)
	
	THIS.GETITEM(li_handle_padre,le_elemento)
	IF le_elemento.bold = TRUE AND le_elemento.StatePictureIndex = 2 THEN //Left(le_elemento.label, 2) = 'X ' THEN
		lstr_datos_rama = le_elemento.data
		li_fila = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find&
				("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
		IF isnull(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.GetItemDatetime(li_fila, 'f_reposicion')) THEN
			IF gb_red_trifasica THEN
				RETURN 4
			ELSE
				Return of_comprobar_interrupcion(li_fila,handle) 
			END IF
		END IF
	END IF

LOOP WHILE li_handle_padre > 0

// Si no tiene hijos deshabilito marcar en hijas
IF li_nuevo_handle = -1 THEN
	RETURN li_nuevo_handle
END IF

// Busco algun elemento inferior marcado
//IF gb_red_trifasica THEN
	DO 
		THIS.GETITEM(li_nuevo_handle,le_elemento)
		
		IF le_elemento.bold = TRUE AND le_elemento.StatePictureIndex = 2 THEN // Left(le_elemento.label, 2) = 'X 'THEN
			
			li_marcados ++
			
		END IF
		
		li_total ++
		
		li_nuevo_handle = THIS.FINDITEM(NextTreeITem!,li_nuevo_handle)
		
	LOOP UNTIL li_nuevo_handle = -1
//END IF


IF li_marcados = 0 THEN
	li_respuesta = 0
ELSEIF li_marcados < li_total THEN
	li_respuesta = 1
ELSE
	li_respuesta = 2
END IF

RETURN li_respuesta
end function

public function long of_ret_codigo (long handle);long ll_codigo
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data
ll_codigo = lstr_datos_rama.ll_nro_instalacion

RETURN ll_codigo
end function

public function boolean of_comprobar_fecha_alta (datawindow pdw_datos_interrup, datetime pdt_fecha_alta);int li_handle, li_fila
treeviewitem le_elemento
str_datos_rama lstr_datos_rama
Datetime ldt_f_reposicion

// Se busca la instalaci$$HEX1$$f300$$ENDHEX$$n marcada
li_handle = THIS.FINDITEM(CurrentTreeItem! ,0)

DO 
	// se recorre la jerarqu$$HEX1$$ed00$$ENDHEX$$a de instalaciones hacia arriba para ver si existe alguna
	// instalaci$$HEX1$$f300$$ENDHEX$$n con una interrupci$$HEX1$$f300$$ENDHEX$$n resuelta 
	li_handle = This.FINDITEM(ParentTreeItem!,li_handle)

	This.GETITEM(li_handle,le_elemento)
	IF le_elemento.bold = TRUE THEN
		lstr_datos_rama = le_elemento.data
		li_fila = pdw_datos_interrup.find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), 1, pdw_datos_interrup.rowcount())
		IF li_fila > 0 THEN 
			// Existe una interrupci$$HEX1$$f300$$ENDHEX$$n en una instalaci$$HEX1$$f300$$ENDHEX$$n superior. Se comprueba que la
			// fecha de resoluci$$HEX1$$f300$$ENDHEX$$n sea menor que la fecha de alta de la nueva interrupci$$HEX1$$f300$$ENDHEX$$n
			ldt_f_reposicion = pdw_datos_interrup.GetItemDatetime(li_fila, 'f_reposicion')
			IF NOT isnull(ldt_f_reposicion) THEN
				IF ldt_f_reposicion > pdt_fecha_alta THEN
					// La fecha de reposici$$HEX1$$f300$$ENDHEX$$n no puede ser posterior que la fecha en la que
					// queremos marcar la interrupci$$HEX1$$f300$$ENDHEX$$n
					Return False
				END IF
			ELSE 
				Return False
			END IF
		END IF
	END IF

LOOP WHILE li_handle > 0

RETURN True

end function

public subroutine fw_buscar_interrupciones (long pl_nro_incidencia);/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n :	f_buscar_interrupciones
//
//	Objetivo:	     Buscar las interrupciones existentes en la incidencia, sin necesidad de buscarlas manualmente 
//					 en el $$HEX1$$e100$$ENDHEX$$rbol de interrupciones.
//                     El proceso que sigue la funci$$HEX1$$f300$$ENDHEX$$n son tres cursores enlazados, el primero busca las interrupciones 
//					 que existen en la incidencia. Con las instalaciones afectadas, el segundo busca los padres de estas
//					 teniendo estas el tercero busca las insta$$HEX1$$f100$$ENDHEX$$laciones hermanas en la jerarqu$$HEX1$$ed00$$ENDHEX$$a que son las que se inser
//                      tar$$HEX1$$e100$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pl_nro_incidencia - N$$HEX1$$fa00$$ENDHEX$$mero de la incidencia por la cual sacar las interrupciones
//
//   Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		         ---------
//	   19/09/2000 FDO			         Creaci$$HEX1$$f300$$ENDHEX$$n
//											
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Declaracion de Variables

Long ll_instalaciones_arbol[],ll_contador=1,ll_contador2=1,ll_handle,ll_inst_origen,ll_instalacion_interrup
long ll_inst_arbol,ll_handles[],ll_inst_jerar,ll_tipo,ll_tipo_hija,ll_contador_array
boolean lb_existe,lb_proceso_array=false,lb_array_fin=false
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

This.setredraw(false)
iw_contenedora.tab_1.setredraw(false)

ll_handle = 1



//***************************************
//**  OSGI 2001.1  	19/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If THIS.getitem(ll_handle,le_elemento) < 0 Then Return
//***************************************
//**  OSGI 2001.1  	19/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



THIS.getitem(ll_handle,le_elemento)

lstr_datos_rama = le_elemento.data

ll_inst_origen = of_ret_codigo(ll_handle)

SetPointer(HourGlass!)

ll_tipo = lstr_datos_rama.li_tipo_instalacion

this.SelectItem (0)

this.deleteitem(1)

// Miro para ver la $$HEX1$$fa00$$ENDHEX$$ltima instalaci$$HEX1$$f300$$ENDHEX$$n cargada.

of_carga_elemento(ll_inst_origen,0,2)

ll_instalaciones_arbol[ll_contador] = ll_inst_origen

ll_handles[ll_contador] = ll_handle

///////////////////// Declaraci$$HEX1$$f300$$ENDHEX$$n de Cursores///////////////////////////////////////////////////////////////////////////////////////////////////

// CURSOR QUE ME TRAE LAS INSTALACIONES INTERRUMPIDAS ///////////////////////////////////////////////////////

DECLARE c_inst_interrup CURSOR FOR  
SELECT DISTINCT "SGD_INTERRUPCION"."NRO_PADRE","SGD_INTERRUPCION"."TIPO_INSTALACION" - 1
FROM "SGD_INTERRUPCION"  
WHERE "SGD_INTERRUPCION"."NRO_INCIDENCIA" = :pl_nro_incidencia AND 
		NVL("SGD_INTERRUPCION"."IND_OTRAS_INS",0) = 0;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// CURSOR QUE ME TRAE LA JERARQUIA DE LAS INSTALACIONES INTERRUMPIDAS AGUAS ARRIBA

DECLARE c_inst_arriba CURSOR FOR  
SELECT "SGD_INSTALACION"."NRO_INSTALACION"
FROM "SGD_INSTALACION"  
WHERE "SGD_INSTALACION"."TIPO_INSTALACION" BETWEEN :ll_tipo and :ll_tipo_hija
START WITH nro_instalacion = :ll_instalacion_interrup
CONNECT BY PRIOR nro_inst_padre = nro_instalacion
ORDER BY TIPO_INSTALACION;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// CURSOR QUE ME TRAE LAS INSTALACIONES HERMANAS A LA INSTALACION QUE ESTOY COMPAR.

DECLARE c_inst_hermanas CURSOR FOR  
SELECT "SGD_INSTALACION"."NRO_INSTALACION"
FROM "SGD_INSTALACION"  
WHERE "SGD_INSTALACION"."NRO_INST_PADRE" =:ll_inst_jerar AND
			"SGD_INSTALACION"."TIPO_INSTALACION" <> :fgci_tipo_tramo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////// Recupero las instalaciones sobre las cuales tiene interrupciones la incidencia /////////////////////

//
OPEN c_inst_interrup;

FETCH c_inst_interrup INTO :ll_instalacion_interrup,:ll_tipo_hija;

DO WHILE lb_array_fin=false
	
	////////////// Recupero datos del cursor jerarquico con los datos del cursor de interrupciones
	
	OPEN c_inst_arriba;

	FETCH c_inst_arriba INTO :ll_inst_jerar;

	DO WHILE sqlca.sqlcode = 0 
		
		////////////// Recupero datos que voy a ir metiendo en el $$HEX1$$e100$$ENDHEX$$rbol
		
		OPEN c_inst_hermanas;
		
		FETCH c_inst_hermanas INTO :ll_inst_arbol;
		
		DO WHILE sqlca.sqlcode = 0 
			
			FOR ll_contador = 1 to upperbound(ll_instalaciones_arbol[])
				
				if ll_instalaciones_arbol[ll_contador] = ll_inst_arbol then
					
					lb_existe=true
					
				end if
				
			NEXT
			
			if lb_existe = false then
			
				FOR ll_contador2 = 1 to upperbound(ll_handles[])
					
					if ll_instalaciones_arbol[ll_contador2]= ll_inst_jerar then
						ll_handle=ll_handles[ll_contador2]
					end if
				NEXT
							
				ll_instalaciones_arbol[upperbound(ll_instalaciones_arbol[]) + 1] = ll_inst_arbol
				ll_handles[upperbound(ll_handles[]) + 1] = of_carga_elemento(ll_inst_arbol,ll_handle,2)
	
			end if

			lb_existe=false
			
			THIS.expanditem(ll_handle)
			
			FETCH c_inst_hermanas INTO :ll_inst_arbol;
			
		LOOP
		
		CLOSE c_inst_hermanas;
		
		FETCH c_inst_arriba INTO :ll_inst_jerar;
		
	LOOP
	
	CLOSE c_inst_arriba;
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if lb_proceso_array=false then
		FETCH c_inst_interrup INTO :ll_instalacion_interrup,:ll_tipo_hija;
	end if

	if sqlca.sqlcode <> 0 or lb_proceso_array = true then 
		
		lb_proceso_array = true
		
		DO  
			if ll_contador_array < upperbound(il_inst[]) and upperbound(il_inst[]) > 0 then
				ll_contador_array ++
				ll_instalacion_interrup=il_inst[ll_contador_array]
				ll_tipo_hija=il_tipo_padre[ll_contador_array]
			else
				lb_array_fin=true
			end if
		LOOP UNTIL not isnull(ll_instalacion_interrup) or lb_array_fin = true
		
	end if

LOOP

CLOSE c_inst_interrup;


This.setredraw(true)
iw_contenedora.tab_1.setredraw(true)
end subroutine

public function long of_ret_tipo (long handle);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: of_ret_tipo
//
// Objetivo: Retornar el tipo de Instalaci$$HEX1$$f300$$ENDHEX$$n
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: Handle 
//        Salida:  Tipo_instalacion
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 25/10/2000	    FDO
//		
/////////////////////////////////////////////////////////// 

long li_tipo
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

//lstr_datos_rama = le_elemento.data //-- Agregar mas tarde
li_tipo = lstr_datos_rama.li_tipo_instalacion

RETURN li_tipo
end function

public subroutine of_interrumpir_hijos (long pl_instalacion, datawindow pdw_interrupcion);/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n :	of_interrumpir_hijos
//
//	Objetivo: Marca las instalaciones hijas de una instalaci$$HEX1$$f300$$ENDHEX$$n interrumpida, con el fin
//				 de que el usuario sepa que esas instalaciones han perdido tensi$$HEX1$$f300$$ENDHEX$$n. Esto s$$HEX1$$f300$$ENDHEX$$lo
//				 se mostrar$$HEX2$$e1002000$$ENDHEX$$cuando no haya operaciones. Hay que indicar que las instalaciones
//				 que pierden tensi$$HEX1$$f300$$ENDHEX$$n no se guarda la interrupci$$HEX1$$f300$$ENDHEX$$n, s$$HEX1$$f300$$ENDHEX$$lo se guarda la interrupci$$HEX1$$f300$$ENDHEX$$n
//				 de la instalaci$$HEX1$$f300$$ENDHEX$$n que se ha interrumpido por arriba
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pl_instalacion - handle del $$HEX1$$e100$$ENDHEX$$rbol con la instalaci$$HEX1$$f300$$ENDHEX$$n que 
//													  se ha quedado sin tensi$$HEX1$$f300$$ENDHEX$$n
//								pdw_interrupcion: datawindow que almacena las interrupciones	
//								pi_accion : 1 - si se desean marcar instalaciones
//												2 - si se desean desmarcar
//
//   Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------    ---------
//	   17/01/2001 		LFE		   Creaci$$HEX1$$f300$$ENDHEX$$n
//											
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_inst_hija
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

// Se obtienen los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n
THIS.getitem(pl_instalacion, le_elemento)
lstr_datos_rama = le_elemento.data
// Se le a$$HEX1$$f100$$ENDHEX$$ade el icono correspondiente a la instalaci$$HEX1$$f300$$ENDHEX$$n
of_icono_rama(lstr_datos_rama.li_tipo_instalacion,lstr_datos_rama.ll_nro_instalacion,pdw_interrupcion, le_elemento, pl_instalacion)
// se guardan los cambios en el $$HEX1$$e100$$ENDHEX$$rbol

IF gb_red_trifasica = FALSE THEN
	IF This.FindItem(ParentTreeItem!, pl_instalacion) >= 0 THEN
		lstr_datos_rama = le_elemento.data
		lstr_datos_rama.ls_fase_afectada = of_unir_fases(lstr_datos_rama.ls_fase_afectada, &
											of_ret_fase_afectada(This.FindItem(ParentTreeItem!, pl_instalacion), lstr_datos_rama.li_tipo_conexion, lstr_datos_rama.ls_fase))
											
		le_elemento.data = lstr_datos_rama
	END IF
END IF

THIS.setitem(pl_instalacion,le_elemento)

ll_inst_hija = This.FindItem(ChildTreeItem!, pl_instalacion)

// Se marcan tambi$$HEX1$$e900$$ENDHEX$$n sin tensi$$HEX1$$f300$$ENDHEX$$n las instalaciones hijas de esta instalaci$$HEX1$$f300$$ENDHEX$$n que se encuentren
// visibles en el $$HEX1$$e100$$ENDHEX$$rbol
DO WHILE ll_inst_hija > 0
	of_interrumpir_hijos(ll_inst_hija,pdw_interrupcion)
	ll_inst_hija = This.FindItem(NextTreeItem!, ll_inst_hija)
LOOP

end subroutine

public function string of_ret_fase (long handle);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_ret_fase
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la fase de una instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  handle -> posici$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
//		Salida:   --
//						
// Devuelve: fase de la instalaci$$HEX1$$f300$$ENDHEX$$n
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data

Return lstr_datos_rama.ls_fase


end function

public function boolean of_tiene_fase_afectada (string ps_fase_afect_padre, string ps_fase_instal);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_tiene_fase_afectada
// 
// Objetivo:  Esta funci$$HEX1$$f300$$ENDHEX$$n indica si la fase que ha perdido de una instalaci$$HEX1$$f300$$ENDHEX$$n afecta a 
// 			  otra instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  ps_fase_afect_padre --> fase afectada del padre
//					 ps_fase_instal --> fase de la instalaci$$HEX1$$f300$$ENDHEX$$n
//		Salida:   --
//						
// Devuelve: TRUE -> en caso de que la interrupci$$HEX1$$f300$$ENDHEX$$n del padre afecte al hijo 
//				 FALSE -> en caso de que la interrupci$$HEX1$$f300$$ENDHEX$$n del padre NO afecte al hijo
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////


Return gb_red_trifasica OR & 
		 (match(ps_fase_afect_padre, gs_fase_a) AND match(ps_fase_instal, gs_fase_a)) OR &
		 (match(ps_fase_afect_padre, gs_fase_b) AND match(ps_fase_instal, gs_fase_b)) OR &
		 (match(ps_fase_afect_padre, gs_fase_c) AND match(ps_fase_instal, gs_fase_c)) 


end function

public function string of_determinar_fase_afectada (string ps_fase_afect_padre, string ps_fase_instal);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_determinar_fase_afectada
// 
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n devuelve la fase afectada de una instalaci$$HEX1$$f300$$ENDHEX$$n cuando 
//				 el padre de la instalaci$$HEX1$$f300$$ENDHEX$$n tiene fases afectadas
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  ps_fase_afect_padre -> fase afectada del padre de la instalaci$$HEX1$$f300$$ENDHEX$$n
//					 ps_fase_instal -> fase de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
//		Salida:   --
//						
// Devuelve: fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n a partir de la fase del padre 
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

String ls_fase_afectada = ''

IF match(ps_fase_afect_padre, gs_fase_a) AND match(ps_fase_instal, gs_fase_a) THEN
	ls_fase_afectada = ls_Fase_afectada + gs_fase_a
END IF

IF match(ps_fase_afect_padre, gs_fase_b) AND match(ps_fase_instal, gs_fase_b) THEN
	ls_fase_afectada = ls_Fase_afectada + gs_fase_b
END IF

IF match(ps_fase_afect_padre, gs_fase_c) AND match(ps_fase_instal, gs_fase_c) THEN
	ls_fase_afectada = ls_Fase_afectada + gs_fase_c
END IF

Return ls_fase_afectada


end function

public subroutine of_marcar_fase_afectada (long pl_handle, string ps_fase_afectada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_marcar_fase_afectada
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que determina la fase afectada de una instalaci$$HEX1$$f300$$ENDHEX$$n a partir de las 
//				 interrupciones que tengan los padres
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  ps_fase_afectada -> fase afectada 
//					 pl_handle -> posici$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol 
//
//		Salida:   --
//						
// Devuelve: 
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

TreeviewItem ltvi_elem
str_datos_rama lstr_datos_inst
String ls_fases_int_total = ''

This.GetItem(pl_handle, ltvi_elem)
lstr_datos_inst = ltvi_elem.data

IF gb_red_trifasica THEN
	lstr_datos_inst.ls_fase_afectada = ps_fase_afectada
ELSE
	// Si la red es monof$$HEX1$$e100$$ENDHEX$$sica la fase afectada que se propaga a este elemento es la 
	// fase afectada del padre m$$HEX1$$e100$$ENDHEX$$s la fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n
	IF iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_inst.ll_nro_instalacion) + " and not isnull(f_alta_fase_a) ",1, iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.RowCount() ) > 0 AND &
		Match(lstr_datos_inst.ls_fase, gs_fase_a) THEN	
		ls_fases_int_total = gs_fase_a
	END IF
	IF iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_inst.ll_nro_instalacion) + " and not isnull(f_alta_fase_b) ",1, iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.RowCount() ) > 0 AND &
		Match(lstr_datos_inst.ls_fase, gs_fase_b) THEN	
		ls_fases_int_total += gs_fase_b
	END IF
	IF iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_inst.ll_nro_instalacion) + " and not isnull(f_alta_fase_c) ",1, iw_contenedora.tab_1.tabpage_interrupciones.d_Datos_interrup.RowCount() ) > 0 AND &
		Match(lstr_datos_inst.ls_fase, gs_fase_c) THEN	
		ls_fases_int_total += gs_fase_c
	END IF

	IF FindItem(ParentTreeItem!, pl_handle) >= 0 THEN
		lstr_datos_inst.ls_fase_afectada = of_unir_fases(ps_fase_afectada, &
															of_ret_fase_afectada(FindItem(ParentTreeItem!, pl_handle), lstr_datos_inst.li_tipo_conexion, lstr_datos_inst.ls_fase))
		
				lstr_datos_inst.ls_fases_int = of_unir_fases_con_filtro(ls_fases_int_total, of_ret_fase_afectada(FindItem(ParentTreeItem!, pl_handle), lstr_datos_inst.li_tipo_conexion, lstr_datos_inst.ls_fase), lstr_datos_inst.ls_fase)
	ELSE
		lstr_datos_inst.ls_fases_int = ls_fases_int_total
		lstr_datos_inst.ls_fase_afectada = ps_fase_afectada
	END IF
END IF

ltvi_elem.data = lstr_datos_inst

This.SetItem(pl_handle, ltvi_elem)
end subroutine

public function integer of_comprobar_interrupcion (long pl_fila, long pl_handle);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_comprobar_interrupcion
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que indica si una instalaci$$HEX1$$f300$$ENDHEX$$n, atendiendo a sus fases, puede ser 
//				 interrumpida o no, existiendo interrupciones en alguno de sus padres
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pl_fila --> fila de la datawindow d_datos_interrup donde se encuentran 
//				    				 los datos de la interrupcion
//					 pl_handle --> posici$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol
//
//		Salida:   --
//						
// Devuelve: 4 -> no se puede interrumpir ninguna fase de la instalaci$$HEX1$$f300$$ENDHEX$$n	
//				 5 -> la instalaci$$HEX1$$f300$$ENDHEX$$n se puede interrumpir parcialmente
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////


datetime ldt_f_res_fase_a, ldt_f_res_fase_b, ldt_f_res_fase_c
TreeviewItem le_elemento
str_datos_rama lstr_datos_rama

ldt_f_res_fase_a = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.GetItemDatetime(pl_fila, 'f_reposicion_fase_a')
ldt_f_res_fase_b = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.GetItemDatetime(pl_fila, 'f_reposicion_fase_b')
ldt_f_res_fase_c = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.GetItemDatetime(pl_fila, 'f_reposicion_fase_c')

This.GetItem(pl_handle,le_elemento)
lstr_datos_rama = le_elemento.data

IF (NOT MATCH(lstr_datos_rama.ls_fase_afectada, gs_fase_a) OR NOT isnull(ldt_f_res_fase_a)) AND &
   MATCH(lstr_datos_rama.ls_fase, gs_fase_a) THEN
	// La instalaci$$HEX1$$f300$$ENDHEX$$n tiene fase A y $$HEX1$$e900$$ENDHEX$$sta se puede interrumpir	
	return 5
ELSE
	IF (NOT MATCH(lstr_datos_rama.ls_fase_afectada, gs_fase_b) OR NOT isnull(ldt_f_res_fase_b)) AND &
   	MATCH(lstr_datos_rama.ls_fase, gs_fase_b) THEN
		// La instalaci$$HEX1$$f300$$ENDHEX$$n tiene fase B y $$HEX1$$e900$$ENDHEX$$sta se puede interrumpir	
		return 5
	ELSE	
		IF (NOT MATCH(lstr_datos_rama.ls_fase_afectada, gs_fase_c) OR NOT isnull(ldt_f_res_fase_c)) AND &
			MATCH(lstr_datos_rama.ls_fase, gs_fase_c) THEN
			// La instalaci$$HEX1$$f300$$ENDHEX$$n tiene fase C y $$HEX1$$e900$$ENDHEX$$sta se puede interrumpir
			return 5
		ELSE
			// No se puede interrumpir ninguna fase de la instalaci$$HEX1$$f300$$ENDHEX$$n
			return 4
		END IF
	END IF
END IF


end function

public function string of_unir_fases (string ps_fase_antigua, string ps_fase_nueva);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_unir_fase
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que realiza la uni$$HEX1$$f300$$ENDHEX$$n de dos fases
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  ps_fase_antigua --> fase 1$$HEX1$$aa00$$ENDHEX$$
//					 ps_fase_nueva --> fase 2$$HEX1$$aa00$$ENDHEX$$
//		Salida:   --
//						
// Devuelve: ps_fase_antigua + ps_fase_nueva
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////


string ls_fase_retorno = ''

IF isnull(ps_fase_antigua) OR ps_fase_antigua='' THEN
	ls_fase_retorno = ps_fase_nueva
ELSE
	IF MATCH(ps_fase_antigua, gs_fase_a) OR MATCH(ps_fase_nueva, gs_fase_a) THEN
		ls_fase_retorno = gs_fase_a
	END IF
	IF MATCH(ps_fase_antigua, gs_fase_b) OR MATCH(ps_fase_nueva, gs_fase_b) THEN
		ls_fase_retorno = ls_fase_retorno + gs_fase_b
	END IF
	IF MATCH(ps_fase_antigua, gs_fase_c) OR MATCH(ps_fase_nueva, gs_fase_c) THEN
		ls_fase_retorno = ls_fase_retorno + gs_fase_c
	END IF
END IF

return ls_fase_retorno
end function

public subroutine of_icono_rama (integer pi_tipo_instalacion, long pl_cod_instalacion, datawindow pdw_interrupciones, ref treeviewitem le_elemento, long pl_handle);int li_icono
long ll_fila=0,ll_fila_valida, ll_elem_actual
boolean lb_interrumpida = false
Boolean lb_repuesta = false
string ls_fases_int_total = '', ls_fase_filtrada
treeviewitem ltv_item
str_datos_rama lstr_datos_rama 

lstr_datos_rama = le_elemento.data

String test 
test = "nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion)
int f1 
f1 = ll_fila
int f2 
f2 = pdw_interrupciones.rowcount()
string cadena 
cadena = "nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion)
string sql_select
sql_select = pdw_interrupciones.GetSQLSelect()
ll_fila = pdw_interrupciones.find(cadena,ll_fila,pdw_interrupciones.rowcount())

//ll_fila = pdw_interrupciones.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion),ll_fila,pdw_interrupciones.rowcount())
ll_fila_valida=ll_fila

// Hay que mirar la ultima interrup sobre la misma instalacion. FDO
do while(ll_fila > 0)
	ll_fila ++	
	if ll_fila>pdw_interrupciones.rowcount() then exit
	ll_fila = pdw_interrupciones.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion),ll_fila,pdw_interrupciones.rowcount())
	if ll_fila > 0 then
		ll_fila_valida=ll_fila
	end if

loop

IF ll_fila_valida = 0  THEN
	// Elemento sin interrupcion
	
	IF pl_handle = -1 THEN
		// Se est$$HEX2$$e1002000$$ENDHEX$$desplegando un nuevo elemento
		// Se obtiene el elemento sobre el que se ha realizado dobleclick, para propagar
		// hacia abajo las interrupciones
		ll_elem_actual = this.FindItem(CurrentTreeItem!, 0)
	ELSE
		// El elemento qe estamos analizando ya se encuentra desplegado. 
	 	// Se obtiene el padre del elemento para propagar hacia abajo las interrupciones
		ll_elem_actual = this.FindItem(ParentTreeItem!, pl_handle)
	END IF
	
	This.GetItem ( ll_elem_actual, ltv_item)
	
	IF ll_elem_actual > 0 THEN
		
		ls_fase_filtrada = of_ret_fases_int(ll_elem_actual, lstr_datos_rama.li_tipo_conexion, lstr_datos_rama.ls_fase)
		// Propagaci$$HEX1$$f300$$ENDHEX$$n de las fases alguna vez interrumpidas de las instalaciones superiores		
		lstr_datos_rama.ls_fases_int = of_unir_fases_con_filtro(ls_fase_filtrada, ls_fase_filtrada,lstr_datos_rama.ls_fase) 		
	ELSE
		lstr_datos_rama.ls_fases_int = ''
	END IF
	
	IF ltv_item.bold = False THEN 
		IF lstr_datos_rama.ls_fases_int = '' THEN
			li_icono = f_icono_arbol(pi_tipo_instalacion)
		ELSE
			li_icono = f_icono_arbol(pi_tipo_instalacion+ii_instalaciones_repuestas)
		END IF
	END IF
	
ELSEIF ll_fila_valida > 0 THEN
	/////////////////////////////////////////////////////////
	IF pl_handle = -1 THEN
		// Se est$$HEX2$$e1002000$$ENDHEX$$desplegando un nuevo elemento
		// Se obtiene el elemento sobre el que se ha realizado dobleclick, para propagar
		// hacia abajo las interrupciones
		ll_elem_actual = this.FindItem(CurrentTreeItem!, 0)
	ELSE
		// El elemento qe estamos analizando ya se encuentra desplegado. 
	 	// Se obtiene el padre del elemento para propagar hacia abajo las interrupciones
		ll_elem_actual = this.FindItem(ParentTreeItem!, pl_handle)
	END IF
	This.GetItem ( ll_elem_actual, ltv_item)
	////////////////////////////////////////////////////////////////////////
	
	
	//IF ISNULL(pdw_interrupciones.getitemdatetime(ll_fila_valida,"f_reposicion")) then
	IF pdw_interrupciones.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion) + " and isnull(f_reposicion) ",1, pdw_interrupciones.RowCount() ) > 0 THEN
		//Esta interrumpida
		lb_interrumpida=true
		li_icono = f_icono_arbol(pi_tipo_instalacion + ii_instalaciones_interrumpidas)
	ELSE

		//Esta repuesta
		lb_repuesta=true // ya no existen interrupciones activas en la instalaci$$HEX1$$f300$$ENDHEX$$n
		li_icono = f_icono_arbol(pi_tipo_instalacion + ii_instalaciones_repuestas)
		le_elemento.statePictureIndex = 3
	END IF
	
	IF NOT gb_red_Trifasica THEN
		IF pdw_interrupciones.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion) + " and not isnull(f_alta_fase_a) ",1, pdw_interrupciones.RowCount() ) > 0 AND &
			Match(lstr_datos_rama.ls_fase, gs_fase_a) THEN	
			ls_fases_int_total = gs_fase_a
		END IF
		IF pdw_interrupciones.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion) + " and not isnull(f_alta_fase_b) ",1, pdw_interrupciones.RowCount() ) > 0 AND &
			Match(lstr_datos_rama.ls_fase, gs_fase_b) THEN	
			ls_fases_int_total += gs_fase_b
		END IF
		IF pdw_interrupciones.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(pl_cod_instalacion) + " and not isnull(f_alta_fase_c) ",1, pdw_interrupciones.RowCount() ) > 0 AND &
			Match(lstr_datos_rama.ls_fase, gs_fase_c) THEN	
			ls_fases_int_total += gs_fase_c
		END IF
	END IF
	IF ll_elem_actual >= 0 THEN
		// Propagaci$$HEX1$$f300$$ENDHEX$$n de las fases alguna vez interrumpidas de las instalaciones superiores		
		ls_fase_filtrada = of_ret_fases_int(ll_elem_actual, lstr_datos_rama.li_tipo_conexion, lstr_datos_rama.ls_fase)
		lstr_datos_rama.ls_fases_int = of_unir_fases_con_filtro(ls_fases_int_total, ls_fase_filtrada, lstr_datos_rama.ls_fase)
	ELSE
		lstr_datos_rama.ls_fases_int = ls_fases_int_total
	END IF
	
END IF

//Si el estado de la instalacion no es normal pone en negrilla con X
IF lb_interrumpida THEN
	// Se trata de la instalaci$$HEX1$$f300$$ENDHEX$$n interrumpida
	IF le_elemento.bold = FALSE OR le_elemento.StatePictureIndex <> 2 THEN //Left(le_elemento.label, 2 ) <> 'X ' THEN
		le_elemento.bold = TRUE
		//le_elemento.label = "X " + le_elemento.label
		le_elemento.statePictureIndex = 2
		IF gb_red_trifasica = FALSE THEN
			// Si la red es monof$$HEX1$$e100$$ENDHEX$$sica la fase afectada que se propaga por el $$HEX1$$e100$$ENDHEX$$rbol ser$$HEX2$$e1002000$$ENDHEX$$la
			// fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n m$$HEX1$$e100$$ENDHEX$$s la fase afectada del padre
			IF this.FindItem(ParentTreeItem!, il_handle_seleccionado) >= 0 THEN
				lstr_datos_rama.ls_fase_afectada = of_unir_fases(pdw_interrupciones.GetItemString(ll_fila_valida, 'sgd_valor_descripcion'), &
											of_ret_fase_afectada(this.FindItem(ParentTreeItem!, il_handle_seleccionado), lstr_datos_rama.li_tipo_conexion, lstr_datos_rama.ls_fase))
			ELSE
				lstr_datos_rama.ls_fase_afectada = ''
				IF pdw_interrupciones.Find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion="+string(pl_cod_instalacion)+&
													" and IsNull(f_reposicion_fase_a) and Not IsNull(f_alta_fase_a)", 1, pdw_interrupciones.RowCount()) > 0 THEN  
				
					lstr_datos_rama.ls_fase_afectada = gs_fase_a
				END IF
				IF pdw_interrupciones.Find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion="+string(pl_cod_instalacion)+&
													" and IsNull(f_reposicion_fase_b) and Not IsNull(f_alta_fase_b)", 1, pdw_interrupciones.RowCount()) > 0 THEN  
					lstr_datos_rama.ls_fase_afectada += gs_fase_b
				END IF
				IF pdw_interrupciones.Find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion="+string(pl_cod_instalacion)+&
													" and IsNull(f_reposicion_fase_c) and Not IsNull(f_alta_fase_c)", 1, pdw_interrupciones.RowCount()) > 0 THEN  
					lstr_datos_rama.ls_fase_afectada += gs_fase_c
				END IF

				//lstr_datos_rama.ls_fase_afectada = pdw_interrupciones.GetItemString(ll_fila_valida, 'sgd_valor_descripcion')
			END IF
		END IF
	ELSE
		//lstr_datos_rama.ls_fase_afectada = pdw_interrupciones.GetItemString(ll_fila_valida, 'sgd_valor_descripcion')		
		lstr_datos_rama.ls_fase_afectada = ''
		IF pdw_interrupciones.Find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion="+string(pl_cod_instalacion)+&
											" and IsNull(f_reposicion_fase_a) and Not IsNull(f_alta_fase_a)", 1, pdw_interrupciones.RowCount()) > 0 THEN  
		
			lstr_datos_rama.ls_fase_afectada = gs_fase_a
		END IF
		IF pdw_interrupciones.Find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion="+string(pl_cod_instalacion)+&
											" and IsNull(f_reposicion_fase_b) and Not IsNull(f_alta_fase_b)", 1, pdw_interrupciones.RowCount()) > 0 THEN  
			lstr_datos_rama.ls_fase_afectada += gs_fase_b
		END IF
		IF pdw_interrupciones.Find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion="+string(pl_cod_instalacion)+&
											" and IsNull(f_reposicion_fase_c) and Not IsNull(f_alta_fase_c)", 1, pdw_interrupciones.RowCount()) > 0 THEN  
			lstr_datos_rama.ls_fase_afectada += gs_fase_c
		END IF

	END IF
ELSE
	// Si la instalaci$$HEX1$$f300$$ENDHEX$$n no es la interrumpida hay que comprobar si 
	// el padre est$$HEX2$$e1002000$$ENDHEX$$interrumpido o afectado por alguna interrupci$$HEX1$$f300$$ENDHEX$$n
	IF le_elemento.bold = TRUE AND le_elemento.StatePictureIndex = 2 THEN //Left(le_elemento.label, 2 ) = 'X ' THEN
		// se est$$HEX2$$e1002000$$ENDHEX$$desmarcando la interrupci$$HEX1$$f300$$ENDHEX$$n
		//le_elemento.label = trim(right(le_elemento.label,(len(le_elemento.label) - 2)))	
		IF NOT lb_repuesta THEN
			IF lstr_datos_rama.ls_fases_int = '' THEN
				li_icono = f_icono_arbol(pi_tipo_instalacion) 
			ELSE
				li_icono = f_icono_arbol(pi_tipo_instalacion+ii_instalaciones_repuestas) 
			END IF
			le_elemento.StatePictureIndex = 1
		END IF
		//le_elemento.bold = False
		
	END IF
	le_elemento.bold = False
	//ELSE
		// Hay que comprobar si la instalaci$$HEX1$$f300$$ENDHEX$$n se ve afectada por alguna interrupci$$HEX1$$f300$$ENDHEX$$n
		IF ltv_item.bold THEN
			// El padre est$$HEX2$$e1002000$$ENDHEX$$afectado por una interrupci$$HEX1$$f300$$ENDHEX$$n y esta interrupci$$HEX1$$f300$$ENDHEX$$n puede afectar
			// a los hijos			
			IF of_tiene_fase_afectada(of_ret_fase_afectada(ll_elem_actual, lstr_datos_rama.li_tipo_conexion, lstr_datos_rama.ls_fase), lstr_datos_rama.ls_fase) THEN
				// La instalaci$$HEX1$$f300$$ENDHEX$$n se va afectada por la interrupci$$HEX1$$f300$$ENDHEX$$n que afecta al padre
				le_elemento.bold = ltv_item.bold
				
				//IF li_icono <> f_icono_arbol(pi_tipo_instalacion + ii_instalaciones_repuestas) THEN
					li_icono = f_icono_arbol(pi_tipo_instalacion + ii_instalaciones_interrumpidas)
				//END IF	
				
				// Se determina la fase afectada en la instalaci$$HEX1$$f300$$ENDHEX$$n
				lstr_datos_rama.ls_fase_afectada = of_determinar_fase_afectada(of_ret_fase_afectada(ll_elem_actual, lstr_datos_rama.li_tipo_conexion,lstr_datos_rama.ls_fase), lstr_datos_rama.ls_fase)
			ELSE
				// Instalaci$$HEX1$$f300$$ENDHEX$$n no afectada por ninguna interrupci$$HEX1$$f300$$ENDHEX$$n
				le_elemento.bold = False
				IF li_icono <> f_icono_arbol(pi_tipo_instalacion + ii_instalaciones_repuestas) THEN
					IF lstr_datos_rama.ls_fases_int = '' THEN
						li_icono = f_icono_arbol(pi_tipo_instalacion) 
					ELSE
						li_icono = f_icono_arbol(pi_tipo_instalacion+ii_instalaciones_repuestas) 
					END IF
				END IF
				lstr_datos_rama.ls_fase_afectada = ''
			END IF
			IF NOT lb_repuesta THEN
				le_elemento.StatePictureIndex = 1
			END IF
			
		ELSEIF lb_repuesta=FALSE THEN
			// El padre no se va afectado por ninguna interrupci$$HEX1$$f300$$ENDHEX$$n
			le_elemento.bold = FALSE
			IF lstr_datos_rama.ls_fases_int = '' THEN
				li_icono = f_icono_arbol(pi_tipo_instalacion)
			ELSE
				li_icono = f_icono_arbol(pi_tipo_instalacion+ii_instalaciones_repuestas)
			END IF
			//li_icono = f_icono_arbol(pi_tipo_instalacion)
			IF gb_red_trifasica = FALSE THEN
				lstr_datos_rama.ls_fase_afectada = ''
			END IF
			le_elemento.StatePictureIndex = 1
	//	END IF
	END IF

END IF
le_elemento.data = lstr_datos_rama
le_elemento.pictureindex = li_icono
le_elemento.selectedpictureindex = le_elemento.pictureindex
end subroutine

public subroutine of_cant_avisos (readonly long pl_nro_incidencia, readonly long pl_nro_instalacion, readonly datetime pdt_fecha_ini);//***************************************
//**  OSGI 2001.1  	29/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
///////////////////////////////////////////////////////
//										
// Funcion/Evento: of_cant_avisos
// 
// Objetivo: retorna la cantidad de avisos asociados a una 
//				 instalaci$$HEX1$$f300$$ENDHEX$$n especifica. Solo para baja tensi$$HEX1$$f300$$ENDHEX$$n
// Responsable: --
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: long pl_nro_incidencia
//					long pl_nro_instalacion
//					datetime pdt_fecha_ini
//					
//		Salida :  --
//
// Devuelve: None
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 24/05/2001   JPA
//
///////////////////////////////////////////////////////

Long ll_cant_avisos



SELECT COUNT(*)
INTO :il_cantidad_avisos
FROM "GI_AVISOS_INSTALACION"  
WHERE ( "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :pl_nro_instalacion  ) AND  
		( "GI_AVISOS_INSTALACION"."F_ALTA" >= :pdt_fecha_ini ) ;

If IsNull(il_cantidad_avisos) Then il_cantidad_avisos = 0

//***************************************
//**  OSGI 2001.1  	29/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public subroutine of_cp_rama_a_dw (str_datos_rama lstr_datos_rama, datawindow pdw_interrupcion, boolean pb_int_agrupadas);//Copia los datos de la rama a la datawindow de interrupcion
long ll_fila, ll_cant_cli_afec_r,ll_cant_cli_afec_c,ll_cant_cli_afec_u
Double ll_pot_afec_r=0,ll_pot_afec_c=0,ll_pot_afec_u=0, ll_pot_cont_afec=0
datetime ldt_f_primer_aviso, ldt_f_p_av_a, ldt_f_p_av_b, ldt_f_p_av_c, ldt_fecha_nula
string ls_fase_sugerida, ls_tipo_area
string ls_fase_afectada_num="", ls_fase_afectada=""
Boolean lb_fila_nueva = FALSE, lb_encontrado_a, lb_encontrado_b, lb_encontrado_c
Int li_tabla_decision

String ls_tiempo_max_int // GNU 01/02/2007. Mejora 1/464613
int li_respuesta // GNU 01/02/2007. Mejora 1/464613

SetNull(ldt_f_p_av_a)
SetNull(ldt_f_p_av_b)
SetNull(ldt_f_p_av_c)
SetNull(ldt_fecha_nula)

//ll_fila = pdw_interrupcion.insertrow(0)
//pdw_interrupcion.scrolltorow(ll_fila)
ls_fase_sugerida = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.GetItemString(1, 'fase_sugerida')

IF ls_fase_sugerida = "" OR isnull(ls_fase_sugerida) THEN
	ls_fase_sugerida = lstr_datos_rama.ls_fase
ELSE

	// Adecuamos la fase sugerida a las fases que se permiten interrumpir
	// Esto se hace porque no siempre se podr$$HEX1$$e100$$ENDHEX$$n interrumpir las fases sugeridas
	IF NOT (Match(lstr_datos_rama.ls_fase, gs_fase_a) = TRUE AND Match(ls_fase_sugerida, gs_fase_a) = TRUE &
		AND Match(is_fase_int_permitida, gs_fase_a) &
		AND iw_contenedora.tab_1.fnu_valida_interrupcion_padre(il_handle_seleccionado, gs_fase_a, pb_int_agrupadas) =1) THEN
		// La fase A no se puede interrumpir si tenemos en cuenta la fase sugerida
		IF NOT (Match(lstr_datos_rama.ls_fase, gs_fase_b) = TRUE AND Match(ls_fase_sugerida, gs_fase_b) = TRUE &
			AND Match(is_fase_int_permitida, gs_fase_b) &
			AND iw_contenedora.tab_1.fnu_valida_interrupcion_padre(il_handle_seleccionado, gs_fase_b, pb_int_agrupadas) =1) THEN
			// La fase B no se puede interrumpir si tenemos en cuenta la fase sugerida
			IF NOT (Match(lstr_datos_rama.ls_fase, gs_fase_c) = TRUE AND Match(ls_fase_sugerida, gs_fase_c) = TRUE &
				AND Match(is_fase_int_permitida, gs_fase_c) &
				AND iw_contenedora.tab_1.fnu_valida_interrupcion_padre(il_handle_seleccionado, gs_fase_c, pb_int_agrupadas) =1) THEN
				// La fase C no se puede interrumpir si tenemos en cuenta la fase sugerida
				// Como ninguna de las fases sugeridas se pueden interrumpir, se coge como fase
				// sugerida la fase de la instalaci$$HEX1$$f300$$ENDHEX$$n
				ls_fase_sugerida = lstr_datos_rama.ls_fase
			END IF
		END IF
	END IF
END IF			
	

IF lstr_datos_rama.ls_fase <> "" AND NOT isnull(lstr_datos_rama.ls_fase) AND &
	NOT gb_red_trifasica THEN
	// Se habilitan las fases con la fase de la instalaci$$HEX1$$f300$$ENDHEX$$n
	// FASE A
	IF Match(lstr_datos_rama.ls_fase, gs_fase_a) = TRUE AND Match(ls_fase_sugerida, gs_fase_a) = TRUE &
		AND Match(is_fase_int_permitida, gs_fase_a) &
		AND iw_contenedora.tab_1.fnu_valida_interrupcion_padre(il_handle_seleccionado, gs_fase_a, pb_int_agrupadas) =1 THEN
		
		ls_fase_afectada_num = "1"
		ls_fase_afectada = gs_fase_a
		// Se busca un registro donde a$$HEX1$$f100$$ENDHEX$$adir la fase interrumpida. Se busca un registro que 
		// tenga nula la fecha de alta de interrupci$$HEX1$$f300$$ENDHEX$$n para la fase. En caso de no encontrarse 
		// ninguno se a$$HEX1$$f100$$ENDHEX$$ade uno nuevo
		ll_fila = pdw_interrupcion.Find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and isnull(f_alta_fase_a)", 1, pdw_interrupcion.RowCount())
		IF ll_fila <= 0 THEN
			lb_fila_nueva = TRUE
			ll_fila = pdw_interrupcion.insertrow(0)
		ELSE
			IF NOT ISNULL(pdw_interrupcion.GetItemDateTime(ll_fila, 'f_alta_fase_b')) THEN
				ls_fase_afectada_num = ls_fase_afectada_num + "1"
			ELSE
				ls_fase_afectada_num = ls_fase_afectada_num + "0"
			END IF
			IF NOT ISNULL(pdw_interrupcion.GetItemDateTime(ll_fila, 'f_alta_fase_c')) THEN
				ls_fase_afectada_num = ls_fase_afectada_num + "1"
			ELSE
				ls_fase_afectada_num = ls_fase_afectada_num + "0"
			END IF
		END IF
	//	pdw_interrupcion.scrolltorow(ll_fila)
		IF pb_int_agrupadas = FALSE THEN	
			//pdw_interrupcion.setitem(ll_fila,"f_alta_fase_a",&
			//		iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,"100",lb_encontrado))
			ldt_f_p_av_a = iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,"100",lb_encontrado_a)
		ELSE
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_a",idt_f_alta_fase_a)
		END IF
	ELSE
		ls_fase_afectada_num = "0"
	END IF
	IF Match(lstr_datos_rama.ls_fase, gs_fase_b) = TRUE AND Match(ls_fase_sugerida, gs_fase_b) = TRUE &
		AND Match(is_fase_int_permitida, gs_fase_b) &
		AND iw_contenedora.tab_1.fnu_valida_interrupcion_padre(il_handle_seleccionado, gs_fase_b, pb_int_agrupadas) =1 THEN
		
		ls_fase_afectada_num = ls_fase_afectada_num + "1"
		ls_fase_afectada = ls_fase_afectada + gs_fase_b

		IF NOT lb_fila_nueva THEN
			// Se busca un registro donde a$$HEX1$$f100$$ENDHEX$$adir la fase interrumpida. Se busca un registro que 
			// tenga nula la fecha de alta de interrupci$$HEX1$$f300$$ENDHEX$$n para la fase. En caso de no encontrarse 
			// ninguno se a$$HEX1$$f100$$ENDHEX$$ade uno nuevo
			ll_fila = pdw_interrupcion.Find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
								" and isnull(f_alta_fase_b)", 1, pdw_interrupcion.RowCount())
	
			IF ll_fila <= 0 THEN
				lb_fila_nueva = TRUE
				ll_fila = pdw_interrupcion.insertrow(0)
			ELSE
				IF NOT ISNULL(pdw_interrupcion.GetItemDateTime(ll_fila, 'f_alta_fase_a')) THEN
					ls_fase_afectada_num = "11" 
				ELSE
					ls_fase_afectada_num = "01"
				END IF
				IF NOT ISNULL(pdw_interrupcion.GetItemDateTime(ll_fila, 'f_alta_fase_c')) THEN
					ls_fase_afectada_num = ls_fase_afectada_num + "1"
				ELSE
					ls_fase_afectada_num = ls_fase_afectada_num + "0"
				END IF
			END IF
			//pdw_interrupcion.scrolltorow(ll_fila)
		END IF
		IF pb_int_agrupadas = FALSE THEN
//			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_b",&
//					iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,"010",lb_encontrado))
			ldt_f_p_av_b = iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,"010",lb_encontrado_b)
		ELSE
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_b",idt_f_alta_fase_b)
		END IF
	ELSE
		IF Len(ls_fase_afectada_num) < 3 THEN
			ls_fase_afectada_num = ls_fase_afectada_num + "0"
		END IF
	END IF
	IF Match(lstr_datos_rama.ls_fase, gs_fase_c) = TRUE AND Match(ls_fase_sugerida, gs_fase_c) = TRUE &
		AND Match(is_fase_int_permitida, gs_fase_c) &
		AND iw_contenedora.tab_1.fnu_valida_interrupcion_padre(il_handle_seleccionado, gs_fase_c, pb_int_agrupadas)=1 THEN
		
		ls_fase_afectada_num = ls_fase_afectada_num + "1"
		ls_fase_afectada = ls_fase_afectada + gs_fase_c

		IF NOT lb_fila_nueva THEN
			// Se busca un registro donde a$$HEX1$$f100$$ENDHEX$$adir la fase interrumpida. Se busca un registro que 
			// tenga nula la fecha de alta de interrupci$$HEX1$$f300$$ENDHEX$$n para la fase. En caso de no encontrarse 
			// ninguno se a$$HEX1$$f100$$ENDHEX$$ade uno nuevo
			ll_fila = pdw_interrupcion.Find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
								" and isnull(f_alta_fase_c)", 1, pdw_interrupcion.RowCount())
	
			IF ll_fila <= 0 THEN
				lb_fila_nueva = TRUE
				ll_fila = pdw_interrupcion.insertrow(0)
			ELSE
				IF NOT ISNULL(pdw_interrupcion.GetItemDateTime(ll_fila, 'f_alta_fase_a')) THEN
					ls_fase_afectada_num = "1" 
				ELSE
					ls_fase_afectada_num = "0"
				END IF
				IF NOT ISNULL(pdw_interrupcion.GetItemDateTime(ll_fila, 'f_alta_fase_b')) THEN
					ls_fase_afectada_num = ls_fase_afectada_num + "11"
				ELSE
					ls_fase_afectada_num = ls_fase_afectada_num + "01"
				END IF
			END IF
			//pdw_interrupcion.scrolltorow(ll_fila)
		END IF
		IF pb_int_agrupadas = FALSE THEN
//			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_c",&
//					iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,"001",lb_encontrado))
			ldt_f_p_av_c = iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,"001",lb_encontrado_c)
		ELSE
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_c",idt_f_alta_fase_c)
		END IF
	ELSE
		IF Len(ls_fase_afectada_num) < 3 THEN
			ls_fase_afectada_num = ls_fase_afectada_num + "0"
		END IF
	END IF
ELSE 
//	IF iw_contenedora.ii_estado_red = -10 THEN
//		ls_fase_afectada_num = ''
//	ELSE
		ls_fase_afectada_num = '111'
//	END IF
	ll_fila = pdw_interrupcion.insertrow(0)
	lb_fila_nueva = True
	IF pb_int_agrupadas THEN
		ldt_f_primer_aviso = idt_f_alta_fase_a
		lb_encontrado_a = FALSE
		lb_encontrado_b = FALSE
		lb_encontrado_c = FALSE
	ELSE
		ldt_f_primer_aviso = iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,ls_fase_afectada_num,lb_encontrado_a)
	END IF
END IF

pdw_interrupcion.setitem(ll_fila, "sgd_valor_descripcion", ls_fase_afectada)
pdw_interrupcion.setitem(ll_fila, "fase_afectada", ls_fase_afectada_num)
iw_contenedora.tab_1.of_mostrar_fases_int(ll_fila, lstr_datos_rama.ls_fase)

IF NOT gb_red_trifasica THEN
	IF pb_int_agrupadas THEN
		IF (NOT IsNull(idt_f_alta_fase_a)) AND (IsNull(idt_f_alta_fase_b) OR idt_f_alta_fase_a < idt_f_alta_fase_b) THEN
			IF (NOT IsNull(idt_f_alta_fase_c)) AND idt_f_alta_fase_a > idt_f_alta_fase_c THEN
				ldt_f_primer_aviso = idt_f_alta_fase_c
			ELSE
				ldt_f_primer_aviso = idt_f_alta_fase_a
			END IF
		ELSE
			IF (NOT IsNull(idt_f_alta_fase_c)) AND (IsNull(idt_f_alta_fase_b) OR idt_f_alta_fase_b > idt_f_alta_fase_c) THEN
				ldt_f_primer_aviso = idt_f_alta_fase_c
			ELSE
				ldt_f_primer_aviso = idt_f_alta_fase_b
			END IF
		END IF
	//ELSE
	//	ldt_f_primer_aviso = iw_contenedora.tab_1.fnu_o_primer_aviso(lstr_datos_rama.ll_nro_instalacion,ls_fase_afectada_num,lb_encontrado_a)
	//END IF

	ELSEIF gb_red_Trifasica = FALSE THEN
		IF (NOT IsNull(ldt_f_p_av_a)) AND (IsNull(ldt_f_p_av_b) OR ldt_f_p_av_a < ldt_f_p_av_b) THEN
			IF (NOT IsNull(ldt_f_p_av_c)) AND ldt_f_p_av_a > ldt_f_p_av_c THEN
				ldt_f_primer_aviso = ldt_f_p_av_c
			ELSE
				ldt_f_primer_aviso = ldt_f_p_av_a
			END IF
		ELSE
			IF (NOT IsNull(ldt_f_p_av_c)) AND (IsNull(ldt_f_p_av_b) OR ldt_f_p_av_b > ldt_f_p_av_c) THEN
				ldt_f_primer_aviso = ldt_f_p_av_c
			ELSE
				ldt_f_primer_aviso = ldt_f_p_av_b
			END IF
		END IF
	END IF
END IF

IF lb_encontrado_a OR lb_encontrado_b OR lb_encontrado_c THEN
	
	gu_comunic.is_comunic.datval1 = ldt_f_primer_aviso
	gu_comunic.is_comunic.strval1 = String(fgnu_fecha_actual())

	IF NOT gb_red_trifasica THEN
		gu_comunic.is_comunic.intval1 = 1
	ELSE
		gu_comunic.is_comunic.intval1 = 0
	END IF
	
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Algunas de las fechas definidas para interrumpir son posteriores a la fecha del " + &
								  "primer aviso encontrado para la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada. Debe confirmar dichas fechas.")
	Open(w_def_fecha_avisos)
	
	ldt_f_primer_aviso = gu_comunic.is_comunic.datval1
	
	IF Mid(ls_fase_afectada_num,1,1) = '1' THEN
		ldt_f_p_av_a = gu_comunic.is_comunic.datval1
	END IF
	IF Mid(ls_fase_afectada_num,2,1) = '1' THEN
		ldt_f_p_av_b = gu_comunic.is_comunic.datval1
	END IF
	IF Mid(ls_fase_afectada_num,3,1) = '1' THEN
		ldt_f_p_av_c = gu_comunic.is_comunic.datval1
	END IF
END IF

		// GNU 02/02/2007. Mejora 1/464613
		SELECT VALOR
		INTO :ls_tiempo_max_int
		FROM SGD_VALOR
		WHERE CODIF='INTA';
		
		IF long (ls_tiempo_max_int) > 0 AND &
			fg_duracion_horas (iw_contenedora.tab_1.idt_fec_deteccion,ldt_f_primer_aviso) >= long (ls_tiempo_max_int) THEN
			li_respuesta=MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n sobrepasa el tiempo estimado. $$HEX1$$bf00$$ENDHEX$$Aceptar?",Exclamation!,YesNo!)
//			gnv_msg.f_mensaje("AI109","","",ok!)
			IF li_respuesta= 2 THEN
				ldt_f_primer_aviso	=iw_contenedora.tab_1.idt_fec_deteccion
			END IF
		END IF
	// FIN GNU

IF pb_int_agrupadas = FALSE AND gb_red_trifasica = FALSE THEN 
	// GNU 02/02/2007. Mejora 1/464613
	IF li_respuesta=2 THEN
		IF Mid(ls_fase_afectada_num,1,1) = '1' AND NOT IsNull(ldt_f_p_av_a) THEN
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_a", ldt_f_primer_aviso)
		END IF
		IF Mid(ls_fase_afectada_num,2,1) = '1' AND NOT IsNull(ldt_f_p_av_b) THEN
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_b", ldt_f_primer_aviso)
		END IF
		IF Mid(ls_fase_afectada_num,3,1) = '1' AND NOT IsNull(ldt_f_p_av_c) THEN
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_c", ldt_f_primer_aviso)
		END IF
	ELSE
		IF Mid(ls_fase_afectada_num,1,1) = '1' AND NOT IsNull(ldt_f_p_av_a) THEN
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_a", ldt_f_p_av_a)
		END IF
		IF Mid(ls_fase_afectada_num,2,1) = '1' AND NOT IsNull(ldt_f_p_av_b) THEN
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_b", ldt_f_p_av_b)
		END IF
		IF Mid(ls_fase_afectada_num,3,1) = '1' AND NOT IsNull(ldt_f_p_av_c) THEN
			pdw_interrupcion.setitem(ll_fila,"f_alta_fase_c", ldt_f_p_av_c)
		END IF
	END IF
	
END IF

//if isnull(ldt_f_primer_aviso) then
//	ldt_f_primer_aviso = fgnu_fecha_actual()
//end if

pdw_interrupcion.Modify("f_alta.protect=0")
pdw_interrupcion.Modify("f_alta.background.color="+gs_blanco)
				
pdw_interrupcion.Modify("f_reposicion.protect=0")
pdw_interrupcion.Modify("f_reposicion.background.color="+gs_blanco)
				
//IF lb_fila_nueva THEN
	IF gb_red_trifasica = false THEN
		IF gb_tabla_decision THEN
			li_tabla_decision = 1
		ELSE
			li_tabla_decision = 0
		END IF
		
		// Se calculan las potencia contratada afectada y los clientes afectados en caso de 
		// que la interrupci$$HEX1$$f300$$ENDHEX$$n se haya definido con red monof$$HEX1$$e100$$ENDHEX$$sica
		
		of_cursor_clientes(1,ll_cant_cli_afec_c,ll_cant_cli_afec_r,ll_cant_cli_afec_u,ll_pot_cont_afec, string(lstr_datos_rama.ll_nro_instalacion),ls_fase_afectada_num,string(lstr_datos_rama.li_tipo_instalacion),string(li_tabla_decision))
		
	ELSE
			
		of_cursor_clientes(0,ll_cant_cli_afec_c,ll_cant_cli_afec_r,ll_cant_cli_afec_u,ll_pot_cont_afec, string(lstr_datos_rama.ll_nro_instalacion),ls_fase_afectada_num,string(lstr_datos_rama.li_tipo_instalacion),string(li_tabla_decision))

		//ll_cant_cli_afec = lstr_datos_rama.ll_ccli
		//ll_pot_cont_afec = lstr_datos_rama.ll_pot_contratada
	END IF

	IF gb_red_trifasica = true THEN
		ll_pot_cont_afec = lstr_datos_rama.ll_pot_contratada
	END IF
	
	IF lstr_datos_rama.li_tipo_instalacion < fgci_tipo_ct THEN
		SELECT NVL(SUM(DECODE(TIPO_AREA, 'C', POT_INSTALADA, 0)),0),
				 NVL(SUM(DECODE(TIPO_AREA, 'R', POT_INSTALADA, 0)),0),
				 NVL(SUM(DECODE(TIPO_AREA, 'U', POT_INSTALADA, 0)),0)
		INTO :ll_pot_afec_c, :ll_pot_afec_r, :ll_pot_afec_u
		FROM SGD_INSTALACION
		WHERE TIPO_INSTALACION = :fgci_tipo_ct AND BDI_JOB = 0
				AND FGNU_FASE_AFECTADA(NVL(TIPO_CONEXION,0), :ls_fase_afectada_num) = 1
		START WITH NRO_INSTALACION = :lstr_datos_rama.ll_nro_instalacion AND BDI_JOB = 0
		CONNECT BY PRIOR NRO_INSTALACION = NRO_INST_PADRE AND BDI_JOB = 0;
		
//		IF SQLCA.SQLCode = 0 THEN
//			lstr_datos_rama.ll_pot_instalada = ll_pot_afec_c+ll_pot_afec_r+ll_pot_afec_u
//		END IF
	ELSE
		SELECT FGNU_TIPO_AREA(:lstr_datos_rama.ll_nro_instalacion)
		INTO :ls_tipo_area
		FROM DUAL;
		
		IF SQLCA.SQLCode = 0 THEN
			CHOOSE CASE ls_tipo_area
				CASE 'C'
					ll_pot_afec_c=lstr_datos_rama.ll_pot_instalada
				CASE 'R'
					ll_pot_afec_r=lstr_datos_rama.ll_pot_instalada
				CASE 'U'
					ll_pot_afec_u=lstr_datos_rama.ll_pot_instalada
			END CHOOSE
		END IF
	END IF
		
	
	pdw_interrupcion.setitem(ll_fila,"co_nivel",lstr_datos_rama.li_co_nivel)
	pdw_interrupcion.setitem(ll_fila,"f_actual",fgcd_fecha_con_seg())
	pdw_interrupcion.setitem(ll_fila,"f_alta",ldt_f_primer_aviso)
	pdw_interrupcion.setitem(ll_fila,"kwh",lstr_datos_rama.ll_kwh)
	pdw_interrupcion.setitem(ll_fila,"nro_incidencia",iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"))
	pdw_interrupcion.setitem(ll_fila,"nro_instalacion",lstr_datos_rama.ll_nro_instalacion)
	pdw_interrupcion.setitem(ll_fila,"nro_padre",lstr_datos_rama.ll_nro_inst_padre)
	pdw_interrupcion.setitem(ll_fila,"programa",'W_2301')
	pdw_interrupcion.setitem(ll_fila,"tipo_instalacion",lstr_datos_rama.li_tipo_instalacion)
	pdw_interrupcion.setitem(ll_fila,"usuario",gs_usuario)
	pdw_interrupcion.setitem(ll_fila,"pot_instalada",lstr_datos_rama.ll_pot_instalada)
	pdw_interrupcion.setitem(ll_fila,"pot_contratada",lstr_datos_rama.ll_pot_contratada)
	pdw_interrupcion.setitem(ll_fila,"pot_inst_afec",ll_pot_afec_c+ll_pot_afec_r+ll_pot_afec_u)
	pdw_interrupcion.setitem(ll_fila,"pot_contr_afec",ll_pot_cont_afec)
	
	pdw_interrupcion.setitem(ll_fila,"pot_inst_afec_ciu",ll_pot_afec_c)
	pdw_interrupcion.setitem(ll_fila,"pot_inst_afec_rur",ll_pot_afec_r)
	pdw_interrupcion.setitem(ll_fila,"pot_inst_afec_urb",ll_pot_afec_u)
	
	pdw_interrupcion.setitem(ll_fila,"ccli_afec_ciu",ll_cant_cli_afec_c)
	pdw_interrupcion.setitem(ll_fila,"ccli_afec_rur",ll_cant_cli_afec_r)
	pdw_interrupcion.setitem(ll_fila,"ccli_afec_urb",ll_cant_cli_afec_u)
	
	//pdw_interrupcion.setitem(ll_fila,"cant_cli_afec",ll_cant_cli_afec)
	pdw_interrupcion.setitem(ll_fila,"cant_cli_afec",ll_cant_cli_afec_c+ll_cant_cli_afec_r+ll_cant_cli_afec_u)
	pdw_interrupcion.setitem(ll_fila,"cant_cli",lstr_datos_rama.ll_ccli)
	pdw_interrupcion.setitem(ll_fila,"tip_interrupcion",'T')
	pdw_interrupcion.setitem(ll_fila,"ind_otras_ins",lstr_datos_rama.li_ind_otras_ins)
//END IF
IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_servicio_repuesto THEN
	pdw_interrupcion.setitem(ll_fila,"ind_reapertura", 1)
ELSE
	pdw_interrupcion.setitem(ll_fila,"ind_reapertura", 0)
END IF
pdw_interrupcion.setitem(ll_fila,"f_reposicion",ldt_fecha_nula)

pdw_interrupcion.ScrollToRow(ll_fila)


end subroutine

public subroutine of_marca_interrupcion (datawindow pdw_interrupcion, long handle, integer accion, boolean pb_int_agrupadas);// Accion = 0 -> Borrar Interrupci$$HEX1$$f300$$ENDHEX$$n
// Accion = 1 -> Marcar Interrupci$$HEX1$$f300$$ENDHEX$$n
// Accion = 2 -> Borrar Interrupci$$HEX1$$f300$$ENDHEX$$n sin localizar (para borrado m$$HEX1$$fa00$$ENDHEX$$ltiple)
// Accion = 4 -> Marcar Interrupci$$HEX1$$f300$$ENDHEX$$n que no est$$HEX2$$e1002000$$ENDHEX$$en el $$HEX1$$e100$$ENDHEX$$rbol
// Accion = 5 -> Borrar Interrupci$$HEX1$$f300$$ENDHEX$$n que no est$$HEX2$$e1002000$$ENDHEX$$en el $$HEX1$$e100$$ENDHEX$$rbol


str_datos_rama lstr_datos_rama
treeviewitem le_elemento
int li_fila
long ll_padre, ll_nulo = 0
long ll_row
Datetime ldt_f_nula

Setpointer(HourGlass!)
This.SetRedraw(False)

THIS.getitem(handle, le_elemento)

IF accion = 4 OR accion = 5 THEN
	of_obtener_info_inst(lstr_datos_rama, handle)
	lstr_datos_rama.li_ind_otras_ins = 1
ELSE
	lstr_datos_rama = le_elemento.data
	lstr_datos_rama.li_ind_otras_ins = 0
END IF

//Se localiza solo si es de accion 0 para borrar
IF accion = 0  OR accion = 2 OR accion = 5 THEN
	
	li_fila = pdw_interrupcion.find("IsNull(f_reposicion) and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), 1, pdw_interrupcion.rowcount())

	DO WHILE li_fila > 0 
			
		IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
				
			ll_row = iw_contenedora.tab_1.tabpage_interrupciones.dw_afec_parcial_sum.Find("nro_instalacion="+string(pdw_interrupcion.GetItemNumber(li_fila, 'nro_instalacion')) + &
																			" and f_alta = datetime('"+string(pdw_interrupcion.GetItemDatetime(li_fila, 'f_alta')) + "')", 1, iw_contenedora.tab_1.tabpage_interrupciones.dw_afec_parcial_sum.RowCount())
																			
			DO WHILE ll_row > 0
				iw_contenedora.tab_1.tabpage_interrupciones.dw_afec_parcial_sum.deleterow(ll_row)
				ll_row = iw_contenedora.tab_1.tabpage_interrupciones.dw_afec_parcial_sum.Find("nro_instalacion="+string(pdw_interrupcion.GetItemNumber(li_fila, 'nro_instalacion')) + &
																		" and f_alta = datetime('"+string(pdw_interrupcion.GetItemDatetime(li_fila, 'f_alta')) + "')", 1, iw_contenedora.tab_1.tabpage_interrupciones.dw_afec_parcial_sum.RowCount())
			LOOP
		END IF	
		
		// Compruebo si se grabaron otras interrupciones en la datawindow de operacion y si se est$$HEX2$$e1002000$$ENDHEX$$desmarcando dicha interrupcion.
		
		
		
		IF li_fila < pdw_interrupcion.rowcount() THEN
			pdw_interrupcion.deleterow(li_fila)
			li_fila = pdw_interrupcion.find("IsNull(f_reposicion) and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), li_fila + 1, pdw_interrupcion.rowcount())
		ELSE
			pdw_interrupcion.deleterow(li_fila)
			li_fila = 0
		END IF
	LOOP
	
	IF accion = 0 THEN
		li_fila = pdw_interrupcion.find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), 1, pdw_interrupcion.rowcount())	
		
		IF li_fila > 0 THEN // Esta instalaci$$HEX1$$f300$$ENDHEX$$n ya tiene interrupciones resueltas
			// Se muestra la informaci$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n resuelta 
			This.Post Event Clicked(handle)
		ELSE
			
			// Hacemos visible la dw_sin_interrupcion y mostramos los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n
			// de la que se ha desmarcado la interrupci$$HEX1$$f300$$ENDHEX$$n
			li_fila = iw_contenedora.tab_1.tabpage_interrupciones.dw_sin_interrupcion.&
						find("nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), 1, iw_contenedora.tab_1.tabpage_interrupciones.dw_sin_interrupcion.rowcount())
			
			IF li_fila > 0 THEN
				iw_contenedora.tab_1.tabpage_interrupciones.dw_sin_interrupcion.Visible = TRUE
				iw_contenedora.tab_1.tabpage_interrupciones.dw_sin_interrupcion.ScrollToRow(li_fila)
				iw_contenedora.tab_1.tabpage_interrupciones.dw_sin_interrupcion.SetRow(li_fila)
				iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.Visible = FALSE
			END IF
			
			iw_contenedora.tab_1.of_mostrar_fases_int(ll_nulo, '')
			of_marcar_fase_afectada(handle, '')
			THIS.getitem(handle, le_elemento)
		END IF
	ELSEIF accion = 5 THEN
		li_fila = iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Find("nro_instalacion="+string(lstr_datos_rama.ll_nro_instalacion),&
													1,iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.RowCount())
													
		IF li_fila > 0 THEN
			iw_contenedora.tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.deleterow(li_fila)
		END IF
	END IF			
ELSE // accion = 1 $$HEX2$$f3002000$$ENDHEX$$acci$$HEX1$$f300$$ENDHEX$$n = 4

	of_cp_rama_a_dw(lstr_datos_rama,pdw_interrupcion,pb_int_agrupadas)		

	IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_servicio_repuesto THEN
		// Si la incidencia se encontraba en SR y es con p$$HEX1$$e900$$ENDHEX$$rdida, pasa al estado ER
		IF iw_contenedora.tab_1.ii_alcance = fgci_incidencia_con_interrupcion THEN
			iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_en_reposicion
		ELSE
			// Si la incidencia se encontraba en SR y es sin p$$HEX1$$e900$$ENDHEX$$rdida, pasa al estado EB
			iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_enviado_brigada
		END IF
		IF	iw_contenedora.tab_1.ii_alcance = fgci_incidencia_sin_interrupcion OR &
			iw_contenedora.tab_1.tabpage_ot.d_datos_ot.GetItemNumber(1, 'est_ot') <> fgci_ot_trabajando THEN
			
			iw_contenedora.tab_1.tabpage_formulario.st_2.visible = true
			iw_contenedora.tab_1.tabpage_ot.tab_lista_brigadas.enabled = true
			iw_contenedora.tab_1.tabpage_ot.d_datos_ot.enabled = true
			iw_contenedora.tab_1.tabpage_ot.dw_lista_contratas.enabled = true
			iw_contenedora.tab_1.tabpage_ot.dw_ambito.fnu_habi_centro()
			iw_contenedora.tab_1.tabpage_ot.dw_ambito.fnu_habi_cmd()
			iw_contenedora.tab_1.tabpage_ot.dw_ambito.fnu_habi_puesto()
			iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.enabled=TRUE
			iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.object.pi_tipo_brig.background.color=gs_blanco
			iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.object.pi_tipo_brig.protect=0
			iw_contenedora.tab_1.tabpage_ot.tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.enabled=true
			iw_contenedora.tab_1.tabpage_ot.tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.enabled=true
			IF iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.GetItemNumber(1,'pi_brigadas_en_turno') = 1 THEN
				iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.object.pdt_fecha_turno.background.color=gs_blanco
				iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.object.pdt_fecha_turno.protect=0
			ELSE
				iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.object.pdt_fecha_turno.background.color=gs_gris
				iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.object.pdt_fecha_turno.protect=1
			END IF
							
			iw_contenedora.tab_1.tabpage_ot.rb_1.enabled = TRUE
			iw_contenedora.tab_1.tabpage_ot.rb_2.enabled = TRUE
			iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Modify("descripcion.protect=0")
			iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Modify("descripcion.background.color="+gs_blanco)
			// Se reabre la OT
			SetNull(ldt_f_nula)
			iw_contenedora.tab_1.tabpage_ot.d_datos_ot.SetItem(1, 'est_ot', fgci_ot_trabajando)
			iw_contenedora.tab_1.tabpage_ot.d_datos_ot.SetItem(1, 'f_hasta', ldt_f_nula)
		END IF
		iw_contenedora.tab_1.f_actualizar_estado()
	END IF
	IF iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount() <= 0 THEN
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.background.color = gs_gris
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.background.color = gs_gris
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.background.color = gs_gris
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.background.color = gs_gris
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.background.color = gs_gris
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.background.color = gs_gris
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.background.color = gs_gris
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.protect = 1
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.background.color = gs_gris
	ELSE
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.background.color = gs_blanco
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.background.color = gs_blanco
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.background.color = gs_blanco
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.background.color = gs_blanco
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.background.color = gs_blanco
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.background.color = gs_blanco
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.background.color = gs_blanco
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.protect = 0
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.background.color = gs_blanco
	END IF	
	
END IF

pdw_interrupcion.accepttext()

IF accion <> 4 AND accion <> 5 THEN
	of_icono_rama(lstr_datos_rama.li_tipo_instalacion,lstr_datos_rama.ll_nro_instalacion,pdw_interrupcion, le_elemento, handle)
	THIS.setitem(handle,le_elemento)
	//IF accion = 1 THEN
		long ll_inst_hija, ll_instalacion
		
		ll_inst_hija = This.FindItem(ChildTreeItem!, handle)
		
		DO WHILE ll_inst_hija > 0
			of_interrumpir_hijos(ll_inst_hija,pdw_interrupcion)
			ll_inst_hija = This.FindItem(NextTreeItem!, ll_inst_hija)
		LOOP
	//END IF
	IF accion = 0 THEN
		ll_padre = This.FindItem(ParentTreeItem!, handle)
		IF ll_padre >= 0 then
			This.SelectItem(ll_padre)
			of_interrumpir_hijos(handle,pdw_interrupcion)
		END IF
	END IF
END IF

This.SetRedraw(True)
Setpointer(Arrow!)
end subroutine

public function integer of_obtener_info_inst (ref str_datos_rama pstr_datos_rama, long pl_nro_instalacion);String ls_select, ls_from, ls_where

ls_select = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
							" SGD_INSTALACION.NOM_INSTALACION, " + &
							" SGD_INSTALACION.TIPO_INSTALACION, " + &
							" SGD_INSTALACION.CO_NIVEL, " + &
							" SGD_INSTALACION.TENSION, " + &
							" SGD_INSTALACION.NRO_INST_PADRE, " + &
							" SGD_INSTALACION.POT_INSTALADA, " + &
							" SGD_INSTALACION.POT_CONTRATADA, " + &
							" SGD_INSTALACION.KWH, " + &
							" SGD_INSTALACION.CANT_CLI, " + &
							" NVL(FGCI_FASE_INSTALACION(SGD_INSTALACION.TIPO_CONEXION), '" + gs_fase_a + gs_fase_b + gs_fase_c + "'),  " + &
							" NVL(SGD_INSTALACION.TIPO_CT,0), " + &
							" NVL(SGD_INSTALACION.TIPO_CONEXION,0) " 

If Not gb_red_trifasica And ib_tipo_area Then ls_select += ", SGD_INSTALACION.TIPO_AREA "


ls_from = " FROM SGD_INSTALACION "

ls_where = " WHERE SGD_INSTALACION.NRO_INSTALACION = " + String(pl_nro_instalacion) + " AND " + &
						" SGD_INSTALACION.BDI_JOB = 0 AND " + &
						" SGD_INSTALACION.TIPO_INSTALACION <> " + String(fgci_tipo_tramo) + " AND " + &
						" SGD_INSTALACION.ESTADO = 0 "


If ib_usa_trafo Then
	ls_select =	fg_cursor_sql(1, ls_select, ls_from, ls_where, " ")
Else
	ls_select = ls_select + ls_from + ls_where
End If


//**  OSGI 2001.1  	29/05/2001  	OPEN cu_carga_elemento_padre;


DECLARE cu_carga_elemento_padre DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_select;
OPEN DYNAMIC cu_carga_elemento_padre ;

If Not gb_red_trifasica And ib_tipo_area Then
	FETCH cu_carga_elemento_padre INTO :pstr_datos_rama.ll_nro_instalacion,
												  :pstr_datos_rama.ls_nom_instalacion,
												  :pstr_datos_rama.li_tipo_instalacion,
												  :pstr_datos_rama.li_co_nivel,
												  :pstr_datos_rama.li_tension,
												  :pstr_datos_rama.ll_nro_inst_padre,
												  :pstr_datos_rama.ll_pot_instalada,
												  :pstr_datos_rama.ll_pot_contratada,
												  :pstr_datos_rama.ll_kwh,
												  :pstr_datos_rama.ll_ccli,
												  :pstr_datos_rama.ls_fase,
												  :pstr_datos_rama.li_tipo_ct,
												  :pstr_datos_rama.li_tipo_conexion,
												  :pstr_datos_rama.tipo_area;
Else
	FETCH cu_carga_elemento_padre INTO :pstr_datos_rama.ll_nro_instalacion,
												  :pstr_datos_rama.ls_nom_instalacion,
												  :pstr_datos_rama.li_tipo_instalacion,
												  :pstr_datos_rama.li_co_nivel,
												  :pstr_datos_rama.li_tension,
												  :pstr_datos_rama.ll_nro_inst_padre,
												  :pstr_datos_rama.ll_pot_instalada,
												  :pstr_datos_rama.ll_pot_contratada,
												  :pstr_datos_rama.ll_kwh,
												  :pstr_datos_rama.ll_ccli,
												  :pstr_datos_rama.ls_fase,
												  :pstr_datos_rama.li_tipo_ct,
												  :pstr_datos_rama.li_tipo_conexion;
End If

CLOSE cu_carga_elemento_padre;

return 1
end function

public function string of_ret_fase_afectada (long handle, integer pi_tipo_conexion, string ps_fase_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_ret_fase_afectada
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la fase afectada de una instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  handle -> posici$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
//		Salida:   --
//						
// Devuelve: fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////
String ls_fase_salida, ls_fase_num = ""
Int li_res
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

IF gb_tabla_decision THEN
	THIS.getitem(handle,le_elemento)
	
	lstr_datos_rama = le_elemento.data
	
	IF lstr_datos_rama.li_tipo_instalacion = fgci_tipo_ct THEN
		IF Match(lstr_datos_rama.ls_fase_afectada,gs_fase_a) THEN
			ls_fase_num = '1'
		ELSE
			ls_fase_num = '0'
		END IF
		IF Match(lstr_datos_rama.ls_fase_afectada,gs_fase_b) THEN
			ls_fase_num += '1'
		ELSE
			ls_fase_num += '0'
		END IF
		IF Match(lstr_datos_rama.ls_fase_afectada,gs_fase_c) THEN
			ls_fase_num += '1'
		ELSE
			ls_fase_num += '0'
		END IF
		
		SELECT INSTR(gi_ct_fase_conexion.fase_sal, ',' || TO_CHAR(:pi_tipo_conexion) || ',')
		INTO :li_res
		FROM gi_ct_fase_conexion
		WHERE gi_ct_fase_conexion.TIPO_CT = NVL(:lstr_datos_rama.li_tipo_ct,0) AND
				gi_ct_fase_conexion.fase_ent = :ls_fase_num;
				 
		IF SQLCA.SQLCode = 0 THEN
			IF  li_res > 0 THEN
				ls_fase_salida = ps_fase_instalacion
			ELSE
				ls_fase_salida = ''
			END IF
			
		ELSE
			ls_fase_salida = lstr_datos_rama.ls_fase_afectada
		END IF
	ELSE
		ls_fase_salida = lstr_datos_rama.ls_fase_afectada
	END IF
	
	Return ls_fase_salida
ELSE
	Return of_ret_fase_afectada(handle)
END IF
end function

public function string of_ret_fase_afectada (long handle);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_ret_fase_afectada
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la fase afectada de una instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  handle -> posici$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
//		Salida:   --
//						
// Devuelve: fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data

Return lstr_datos_rama.ls_fase_afectada


end function

public function long of_ret_tipo_ct (long handle);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: of_ret_tipo_ct
//
// Objetivo: Retornar el tipo de ct al que est$$HEX2$$e1002000$$ENDHEX$$conectado la instalaci$$HEX1$$f300$$ENDHEX$$n
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: Handle 
//        Salida:  Tipo_instalacion
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 25/10/2000	    FDO
//		
/////////////////////////////////////////////////////////// 

long li_tipo
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data
li_tipo = lstr_datos_rama.li_tipo_ct

RETURN li_tipo
end function

public function long of_ret_tipo_conexion (long handle);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: of_ret_tipo_conexion
//
// Objetivo: Retornar el tipo de Instalaci$$HEX1$$f300$$ENDHEX$$n
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: Handle 
//        Salida:  Tipo_instalacion
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 25/10/2000	    FDO
//		
/////////////////////////////////////////////////////////// 

long li_tipo
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data
li_tipo = lstr_datos_rama.li_tipo_conexion

RETURN li_tipo
end function

public subroutine of_set_fase_afectada (long handle, string ps_fase_afectada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_set_fase_afectada
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que a$$HEX1$$f100$$ENDHEX$$ade la fase afectada a una instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  handle -> posici$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
//		Salida:   --
//						
// Devuelve: fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data
lstr_datos_rama.ls_fase_afectada = ps_fase_afectada

le_elemento.data = lstr_datos_rama
This.setitem(handle, le_elemento)



end subroutine

public function string of_det_perdida_ct (long pl_nro_instalacion, string ps_fase_ent, integer pi_tipo_conexion, integer pi_tipo_ct);String ls_ret = '', ls_fase_ct, ls_fase_int_ct = ''
Int li_res

IF gb_tabla_decision THEN
	SELECT fgci_fase_instalacion(TIPO_CONEXION)
	INTO :ls_fase_ct
	FROM SGD_INSTALACION
	WHERE BDI_JOB = 0 AND TIPO_INSTALACION = :fgci_tipo_ct
	START WITH NRO_INSTALACION = :pl_nro_instalacion AND BDI_JOB = 0
	CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION;
	
	IF SQLCA.SQLCode = 0 THEN
		// Se realiza la intersecci$$HEX1$$f300$$ENDHEX$$n entre la fase interrumpida y la fase del CT
		IF Mid(ps_fase_ent,1,1) = '1' AND Pos(ls_fase_ct,gs_fase_a) > 0 THEN
			ls_fase_int_ct = '1'
		ELSE
			ls_fase_int_ct = '0'
		END IF
	
		IF Mid(ps_fase_ent,2,1) = '1' AND Pos(ls_fase_ct,gs_fase_b) > 0 THEN
			ls_fase_int_ct += '1'
		ELSE
			ls_fase_int_ct += '0'
		END IF
		
		IF Mid(ps_fase_ent,3,1) = '1' AND Pos(ls_fase_ct,gs_fase_c) > 0 THEN
			ls_fase_int_ct += '1'
		ELSE
			ls_fase_int_ct += '0'
		END IF
	ELSE
		ls_fase_int_ct = ps_fase_ent
	END IF
	
	IF ls_fase_int_ct <> '000' THEN
	
		SELECT INSTR(gi_ct_fase_conexion.fase_sal, ',' || TO_CHAR(:pi_tipo_conexion) || ',')
		INTO :li_res
		FROM gi_ct_fase_conexion
		WHERE gi_ct_fase_conexion.TIPO_CT = NVL(:pi_tipo_ct,0) AND
				gi_ct_fase_conexion.fase_ent = :ls_fase_int_ct;
				 
		IF SQLCA.SQLCode = 0 THEN
			IF li_res > 0 THEN
				SELECT FASE_AFECTADA
				INTO :ls_ret 
				FROM GI_CAMBIO_FORMATO_FASE
				WHERE TIPO_CONEXION = :pi_tipo_conexion;
			
				IF SQLCA.SQLCode <> 0 THEN
					ls_ret = ''
				END IF
			ELSE
				ls_ret = ''
			END IF
		END IF
	ELSE
		ls_ret = ''
	END IF
		
ELSE
	ls_ret = ps_fase_ent
END IF

return ls_ret
end function

public function long of_ret_inst_padre (long handle);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: of_ret_inst_padre
//
// Objetivo: Retornar el c$$HEX1$$f300$$ENDHEX$$digo de la instalaci$$HEX1$$f300$$ENDHEX$$n padre
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: Handle 
//        Salida:  Tipo_instalacion
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 25/10/2000	    FDO
//		
/////////////////////////////////////////////////////////// 

long ll_nro_inst_padre
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data

SELECT NRO_INST_PADRE
INTO :ll_nro_inst_padre
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :lstr_datos_rama.ll_nro_instalacion
		AND BDI_JOB = 0;

RETURN ll_nro_inst_padre
end function

public function string of_ret_fases_int (long handle);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_ret_fases_int
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve las fases que afectan o han afectado a una instalaci$$HEX1$$f300$$ENDHEX$$n  
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  handle -> posici$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
//		Salida:   --
//						
// Devuelve: fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/10/02		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

str_datos_rama lstr_datos_rama
treeviewitem le_elemento

THIS.getitem(handle,le_elemento)

lstr_datos_rama = le_elemento.data

Return lstr_datos_rama.ls_fases_int


end function

public function string of_unir_fases_con_filtro (string ps_fase_antigua, string ps_fase_nueva, string ps_filtro);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_unir_fases_con_filtro
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que realiza la uni$$HEX1$$f300$$ENDHEX$$n de dos fases cumpliendose las restricciones de
//				 un filtro
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  ps_fase_antigua --> fase 1$$HEX1$$aa00$$ENDHEX$$
//					 ps_fase_nueva --> fase 2$$HEX1$$aa00$$ENDHEX$$
//					 ps_filtro --> fase filtro a la que se tienen que adaptar ps_fase_antigua y ps_fase_nueva
//		Salida:   --
//						
// Devuelve: ps_fase_antigua + ps_fase_nueva
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/10/02		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////


string ls_fase_retorno = ''

IF isnull(ps_fase_antigua) OR ps_fase_antigua='' THEN
	ps_fase_antigua = ps_fase_nueva
END IF

IF MATCH(ps_filtro, gs_fase_a) AND &
	(MATCH(ps_fase_antigua, gs_fase_a) OR MATCH(ps_fase_nueva, gs_fase_a)) THEN
	ls_fase_retorno = gs_fase_a
END IF
IF MATCH(ps_filtro, gs_fase_b) AND &
	(MATCH(ps_fase_antigua, gs_fase_b) OR MATCH(ps_fase_nueva, gs_fase_b)) THEN
	ls_fase_retorno = ls_fase_retorno + gs_fase_b
END IF
IF MATCH(ps_filtro, gs_fase_c) AND &
	(MATCH(ps_fase_antigua, gs_fase_c) OR MATCH(ps_fase_nueva, gs_fase_c)) THEN
	ls_fase_retorno = ls_fase_retorno + gs_fase_c
END IF

return ls_fase_retorno
end function

public function string of_ret_fases_int (long handle, integer pi_tipo_conexion, string ps_fase_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_ret_fase_afectada
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la fase afectada de una instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  handle -> posici$$HEX1$$f300$$ENDHEX$$n en el $$HEX1$$e100$$ENDHEX$$rbol de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
//		Salida:   --
//						
// Devuelve: fase afectada de la instalaci$$HEX1$$f300$$ENDHEX$$n
//				 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/03/01		LFE			Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////
String ls_fase_salida, ls_fase_num = ""
Int li_res
str_datos_rama lstr_datos_rama
treeviewitem le_elemento

IF gb_tabla_decision THEN
	THIS.getitem(handle,le_elemento)
	
	lstr_datos_rama = le_elemento.data
	
	IF lstr_datos_rama.li_tipo_instalacion = fgci_tipo_ct THEN
		IF Match(lstr_datos_rama.ls_fases_int,gs_fase_a) THEN
			ls_fase_num = '1'
		ELSE
			ls_fase_num = '0'
		END IF
		IF Match(lstr_datos_rama.ls_fases_int,gs_fase_b) THEN
			ls_fase_num += '1'
		ELSE
			ls_fase_num += '0'
		END IF
		IF Match(lstr_datos_rama.ls_fases_int,gs_fase_c) THEN
			ls_fase_num += '1'
		ELSE
			ls_fase_num += '0'
		END IF
		
		SELECT INSTR(gi_ct_fase_conexion.fase_sal, ',' || TO_CHAR(:pi_tipo_conexion) || ',')
		INTO :li_res
		FROM gi_ct_fase_conexion
		WHERE gi_ct_fase_conexion.TIPO_CT = NVL(:lstr_datos_rama.li_tipo_ct,0) AND
				gi_ct_fase_conexion.fase_ent = :ls_fase_num;
				 
		IF SQLCA.SQLCode = 0 THEN
			IF  li_res > 0 THEN
				ls_fase_salida = ps_fase_instalacion
			ELSE
				ls_fase_salida = ''
			END IF
			
		ELSE
			ls_fase_salida = lstr_datos_rama.ls_fases_int
		END IF
	ELSE
		ls_fase_salida = lstr_datos_rama.ls_fases_int
	END IF
	
	Return ls_fase_salida
ELSE
	Return of_ret_fases_int(handle)
END IF
end function

public function integer of_agregar_int_descargo (ref datastore pds_lista, integer pi_tipo_int);long pl_nro_descargo, ll_nro_instalacion, ll_fila, ll_cuenta, ll_fila_problemas
Int li_retorno = 1, li_tipo_instalacion
Datetime ldt_f_alta, ldt_f_fin
string ls_fase, ls_nom_instalacion
Boolean lb_todas = True
Datastore lds_problemas

pds_lista = Create datastore
lds_problemas = Create datastore

lds_problemas.dataobject = 'd_desc_problemas'

// Se obtiene el nro de descargo asociado a la incidencia
SELECT NRO_DESCARGO
INTO :pl_nro_descargo
FROM SGD_DESCARGOS 
WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;

IF SQLCA.SQLCode <> 0 THEN
	li_retorno = 0

ELSE
	DECLARE lc_int_descargo CURSOR FOR
		select f_inicio,
				f_fin,	
				cod_instalacion,
				gi_cambio_formato_fase.fase_afectada,
				nom_instalacion, 
				tipo_instalacion
		from sgd_interrupcion_descargo, sgd_instalacion, gi_cambio_formato_fase
		where sgd_interrupcion_descargo.cod_instalacion = sgd_instalacion.nro_instalacion and
			  sgd_instalacion.bdi_job = 0 and
			  sgd_instalacion.estado = 0 and
			  nvl(sgd_instalacion.tipo_conexion,15) = gi_cambio_formato_fase.tipo_conexion and
			  sgd_interrupcion_descargo.nro_descargo = :pl_nro_descargo and exists (select nro_instalacion
			  																							 from sgd_instalacion
																										 where bdi_job = 0 and estado = 0 and nro_instalacion = sgd_interrupcion_descargo.cod_instalacion
																										 start with nro_instalacion = :iw_contenedora.tab_1.idec_nro_instalacion_afectada and bdi_job = 0
																										 connect by prior nro_instalacion = nro_inst_padre and bdi_job = 0);
	
	DECLARE lc_int_descargo_otras_int CURSOR FOR
		select f_inicio,
				f_fin,	
				cod_instalacion,
				gi_cambio_formato_fase.fase_afectada,
				nom_instalacion, 
				tipo_instalacion
		from sgd_interrupcion_descargo, sgd_instalacion, gi_cambio_formato_fase
		where sgd_interrupcion_descargo.cod_instalacion = sgd_instalacion.nro_instalacion and
			  sgd_instalacion.bdi_job = 0 and
			  sgd_instalacion.estado = 0 and
			  nvl(sgd_instalacion.tipo_conexion,15) = gi_cambio_formato_fase.tipo_conexion and
			  sgd_interrupcion_descargo.nro_descargo = :pl_nro_descargo and not exists (select nro_instalacion
			  																									 from sgd_instalacion
																												 where bdi_job = 0 and estado = 0 and nro_instalacion = sgd_interrupcion_descargo.cod_instalacion
																												 start with nro_instalacion = :iw_contenedora.tab_1.idec_nro_instalacion_afectada and bdi_job = 0
																												 connect by prior nro_instalacion = nro_inst_padre and bdi_job = 0);

	pds_lista.dataobject = 'd_inc_multiples_inst_int'
	
	IF pi_tipo_int = 1 THEN // interrupciones que dependen de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada
		OPEN lc_int_descargo;
	ELSE // interrupciones que no dependen de la instalacion afectada
		OPEN lc_int_descargo_otras_int;
	END IF
	
	IF SQLCA.SQLCode = 0 THEN
		IF pi_tipo_int = 1 THEN
			FETCH lc_int_descargo
			INTO :ldt_f_alta, :ldt_f_fin, :ll_nro_instalacion, :ls_fase, :ls_nom_instalacion, :li_tipo_instalacion;
		ELSE
			FETCH lc_int_descargo_otras_int
			INTO :ldt_f_alta, :ldt_f_fin, :ll_nro_instalacion, :ls_fase, :ls_nom_instalacion, :li_tipo_instalacion;
		END IF
		
		DO WHILE SQLCA.SQLCode = 0
			IF ls_fase = '000' THEN ls_fase ='111'
			
			select count(nro_instalacion)
			into :ll_cuenta
 			from sgd_interrupcion
 			where nro_instalacion in (select sgd_instalacion.nro_instalacion
 	   	   	   		 			from sgd_instalacion
						   				where bdi_job = 0 and estado = 0
						   				start with nro_instalacion = :ll_nro_instalacion and bdi_job = 0
						   				connect by prior nro_inst_padre = nro_instalacion and bdi_job = 0)
					and f_alta between :ldt_f_alta and :ldt_f_fin;
			
			IF (SQLCA.SQLCode = 0 and ll_cuenta = 0) AND & 
				NOT (li_tipo_instalacion = fgci_tipo_subestacion and pi_tipo_int = 2 ) THEN
				
				ll_fila = pds_lista.insertrow(0)
				IF NOT gb_red_trifasica THEN
					IF MID(ls_fase,1,1) = '1' THEN
						pds_lista.SetItem(ll_fila, 'f_alta_fase_a', ldt_f_alta)
					END IF
					IF MID(ls_fase,2,1) = '1' THEN
						pds_lista.SetItem(ll_fila, 'f_alta_fase_b', ldt_f_alta)
					END IF
					IF MID(ls_fase,3,1) = '1' THEN
						pds_lista.SetItem(ll_fila, 'f_alta_fase_c', ldt_f_alta)
					END IF
				ELSE
					pds_lista.SetItem(ll_fila, 'f_alta', ldt_f_alta)
					ls_fase = '111'
				END IF
				pds_lista.SetItem(ll_fila, 'fase_completar', '000')
				pds_lista.SetItem(ll_fila, 'fase_a$$HEX1$$f100$$ENDHEX$$adir', ls_fase)
				pds_lista.SetItem(ll_fila, 'nom_instalacion', ls_nom_instalacion)
				pds_lista.SetItem(ll_fila, 'tipo_instalacion', li_tipo_instalacion)
				pds_lista.SetItem(ll_fila, 'fase_instalacion', ls_fase)
				pds_lista.SetItem(ll_fila, 'nro_instalacion', ll_nro_instalacion)
			ELSE
				lb_todas = False
				ll_fila_problemas = lds_problemas.Insertrow(0)
				IF ll_fila_problemas > 0 THEN
					lds_problemas.Setitem(ll_fila_problemas, 'nom_instalacion', ls_nom_instalacion)
					IF li_tipo_instalacion = fgci_tipo_subestacion and pi_tipo_int = 2 THEN
						lds_problemas.Setitem(ll_fila_problemas, 'descripcion', "No est$$HEX2$$e1002000$$ENDHEX$$permitido interrumpir una Subestaci$$HEX1$$f300$$ENDHEX$$n que no sea la Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada de la incidencia.")						
					ELSE
						lds_problemas.Setitem(ll_fila_problemas, 'descripcion', "Existe una interrupci$$HEX1$$f300$$ENDHEX$$n en una instalaci$$HEX1$$f300$$ENDHEX$$n superior o en la misma instalaci$$HEX1$$f300$$ENDHEX$$n en otra incidencia para las fechas definidas en el descargo.")
					END IF
				END IF
				
			END IF
			
			IF pi_tipo_int = 1 THEN
				FETCH lc_int_descargo
				INTO :ldt_f_alta, :ldt_f_fin, :ll_nro_instalacion, :ls_fase, :ls_nom_instalacion, :li_tipo_instalacion;
			ELSE
				FETCH lc_int_descargo_otras_int
				INTO :ldt_f_alta, :ldt_f_fin, :ll_nro_instalacion, :ls_fase, :ls_nom_instalacion, :li_tipo_instalacion;
			END IF
		LOOP
		
		IF pi_tipo_int = 1 THEN
			Close lc_int_descargo;
		ELSE
			Close lc_int_descargo_otras_int;
		END IF
		
	ELSE
		li_retorno = 0
	END IF
END IF

IF NOT lb_todas THEN
	IF pi_tipo_int = 1 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se han podido marcar todas las interrupciones que dependen de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.")
	ELSE
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se han podido marcar todas las interrupciones que no dependen de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.")
	END IF
	OpenWithParm(w_problemas_multiples_inter, lds_problemas)
END IF

Destroy lds_problemas

return 1
end function

public function integer of_cursor_clientes (integer pi_tipo, ref long ll_cant_cli_afec_c, ref long ll_cant_cli_afec_r, ref long ll_cant_cli_afec_u, ref double ll_pot_cont_afec, string ls_nro_instalacion, string ls_fase_afectada_num, string ls_tipo_instalacion, string ls_tabla_decision);string ls_sql_statement
int li_pais

DECLARE clientes_total DYNAMIC CURSOR FOR SQLSA;

SELECT VALOR 
INTO :li_pais
FROM GI_PARAMETROS
WHERE COD_PARAMETRO = 78;

IF li_pais = 4 then // SI PANAMA APLICO HINT
	ls_sql_statement= " SELECT /*+ INDEX (SGD_ACOMETIDA SGD_ACOMETIDA_V2002_I03) */ "
ELSE 
	ls_sql_statement= " SELECT "
END IF
//AHM (24/11/2009) Mejora 1/662962		
IF pi_tipo = 1 then
	IF gi_pais = 8 THEN
		ls_sql_statement= ls_sql_statement + " NVL(SUM(DECODE(A.TIPO_AREA, 'C', B.REGISTROS, 0)),0), " +&
				"NVL(SUM(DECODE(A.TIPO_AREA, 'R', B.REGISTROS, 0)),0)," +&
				"NVL(SUM(DECODE(A.TIPO_AREA, 'U', B.REGISTROS, 0)),0)," +&
				"NVL(SUM(SGD_ACOMETIDA.POT_CONTRATADA),0)" +&
		" FROM SGD_ACOMETIDA, (SELECT NRO_INSTALACION, fgnu_tipo_area(NRO_INSTALACION) TIPO_AREA" +&
					" FROM SGD_INSTALACION" +&
					" START WITH SGD_INSTALACION.NRO_INSTALACION =" + ls_nro_instalacion + " AND SGD_INSTALACION.BDI_JOB = 0 " +&
					" CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE AND SGD_INSTALACION.BDI_JOB = 0) A, 	" +&						  
					" (SELECT NRO_ACOMETIDA, COUNT(*) REGISTROS " +&
				   " FROM ACO_SUM, SGD_ACOMETIDA " +&
				   " WHERE TIP_CLIENTE <> 'TC999' " +&
				   " AND SGD_ACOMETIDA.INSTALACION_ORIGEN = " + ls_nro_instalacion +&
				   " AND  SGD_ACOMETIDA.CODIGO = ACO_SUM.NRO_ACOMETIDA " +&
				   " GROUP BY NRO_ACOMETIDA) B			 	" +&						  
		" WHERE SGD_ACOMETIDA.BDI_JOB = 0 " +&
			"  AND FGNU_FASE_AFECT_DECISION(SGD_ACOMETIDA.INSTALACION_ORIGEN,NVL(SGD_ACOMETIDA.TIPO_CONEXION,15), '" + ls_fase_afectada_num + "'," + ls_tipo_instalacion + "," + ls_tabla_decision + ") = 1 " +& 
			 " AND SGD_ACOMETIDA.INSTALACION_ORIGEN = A.NRO_INSTALACION" +&
			 " AND  B.NRO_ACOMETIDA = SGD_ACOMETIDA.CODIGO "
		
	ELSE
		
		ls_sql_statement= ls_sql_statement + " NVL(SUM(DECODE(A.TIPO_AREA, 'C', SGD_ACOMETIDA.CANT_CLI, 0)),0), " +&
				"NVL(SUM(DECODE(A.TIPO_AREA, 'R', SGD_ACOMETIDA.CANT_CLI, 0)),0)," +&
				"NVL(SUM(DECODE(A.TIPO_AREA, 'U', SGD_ACOMETIDA.CANT_CLI, 0)),0)," +&
				"NVL(SUM(SGD_ACOMETIDA.POT_CONTRATADA),0)" +&
		" FROM SGD_ACOMETIDA, (SELECT NRO_INSTALACION, fgnu_tipo_area(NRO_INSTALACION) TIPO_AREA" +&
					" FROM SGD_INSTALACION" +&
					" START WITH SGD_INSTALACION.NRO_INSTALACION =" + ls_nro_instalacion + " AND SGD_INSTALACION.BDI_JOB = 0 " +&
					" CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE AND SGD_INSTALACION.BDI_JOB = 0) A	" +&						  
		" WHERE SGD_ACOMETIDA.BDI_JOB = 0 " +&
			"  AND FGNU_FASE_AFECT_DECISION(SGD_ACOMETIDA.INSTALACION_ORIGEN,NVL(SGD_ACOMETIDA.TIPO_CONEXION,15), '" + ls_fase_afectada_num + "'," + ls_tipo_instalacion + "," + ls_tabla_decision + ") = 1 " +& 
			 " AND SGD_ACOMETIDA.INSTALACION_ORIGEN = A.NRO_INSTALACION" 
	END IF
ELSE
	IF gi_pais = 8 THEN
			ls_sql_statement= ls_sql_statement + " NVL(SUM(DECODE(A.TIPO_AREA, 'C', B.REGISTROS, 0)),0), " +&
			"NVL(SUM(DECODE(A.TIPO_AREA, 'R', B.REGISTROS, 0)),0)," +&
			"NVL(SUM(DECODE(A.TIPO_AREA, 'U', B.REGISTROS, 0)),0)," +&
			"NVL(SUM(SGD_ACOMETIDA.POT_CONTRATADA),0)" +&
			" FROM SGD_ACOMETIDA, (SELECT NRO_INSTALACION, fgnu_tipo_area(NRO_INSTALACION) TIPO_AREA" +&
			" FROM SGD_INSTALACION" +&
			" START WITH SGD_INSTALACION.NRO_INSTALACION =" + ls_nro_instalacion + " AND SGD_INSTALACION.BDI_JOB = 0 " +&
			" CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE AND SGD_INSTALACION.BDI_JOB = 0) A,	" +&						  
			" (SELECT NRO_ACOMETIDA, COUNT(*) REGISTROS" +& 
			" FROM ACO_SUM, SGD_ACOMETIDA" +& 
			" WHERE TIP_CLIENTE <> 'TC999'" +& 
			" AND SGD_ACOMETIDA.INSTALACION_ORIGEN =  " + ls_nro_instalacion +&
			" AND  SGD_ACOMETIDA.CODIGO = ACO_SUM.NRO_ACOMETIDA" +& 
			" GROUP BY NRO_ACOMETIDA) B" +&	
			" WHERE SGD_ACOMETIDA.BDI_JOB = 0 " +&
	 		" AND SGD_ACOMETIDA.INSTALACION_ORIGEN = A.NRO_INSTALACION" +&
			"  AND  B.NRO_ACOMETIDA = SGD_ACOMETIDA.CODIGO" 
	ELSE
		ls_sql_statement= ls_sql_statement + " NVL(SUM(DECODE(A.TIPO_AREA, 'C', SGD_ACOMETIDA.CANT_CLI, 0)),0), " +&
				"NVL(SUM(DECODE(A.TIPO_AREA, 'R', SGD_ACOMETIDA.CANT_CLI, 0)),0)," +&
				"NVL(SUM(DECODE(A.TIPO_AREA, 'U', SGD_ACOMETIDA.CANT_CLI, 0)),0)," +&
				"NVL(SUM(SGD_ACOMETIDA.POT_CONTRATADA),0)" +&
		" FROM SGD_ACOMETIDA, (SELECT NRO_INSTALACION, fgnu_tipo_area(NRO_INSTALACION) TIPO_AREA" +&
					" FROM SGD_INSTALACION" +&
					" START WITH SGD_INSTALACION.NRO_INSTALACION =" + ls_nro_instalacion + " AND SGD_INSTALACION.BDI_JOB = 0 " +&
					" CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE AND SGD_INSTALACION.BDI_JOB = 0) A	" +&						  
		" WHERE SGD_ACOMETIDA.BDI_JOB = 0 " +&
		 " AND SGD_ACOMETIDA.INSTALACION_ORIGEN = A.NRO_INSTALACION" 
	END IF
	
END IF

PREPARE SQLSA FROM :ls_sql_statement;

OPEN DYNAMIC clientes_total;

FETCH clientes_total 

INTO :ll_cant_cli_afec_c,:ll_cant_cli_afec_r,:ll_cant_cli_afec_u,:ll_pot_cont_afec;

CLOSE clientes_total;

return 1
end function

event rightclicked;SetPointer(HourGlass!)

treeviewitem le_elemento
str_datos_rama lstr_datos_rama
int li_fila,li_lock_status, li_estado
int li_respuesta
long ll_contador,li_nula, ll_estado_red,li_conta
boolean lb_elim_sel=false
Datetime ldt_fecha_sr
Boolean lb_permitir_interrupcion = true
String ls_fase_sugerida, ls_fase_aux
md_ingreso_incidencias lm_menu

//AHM (02/11/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
IF NOT(gb_interfaseOsgm) OR (gb_interfaseOsgm AND ((iw_contenedora.tab_1.ii_estado_mant < 2) OR isnull(iw_contenedora.tab_1.ii_estado_mant))) THEN
	lm_menu= iw_contenedora.menuid
	
	IF handle = 0 or iw_contenedora.lu_comunic.is_comunic.accion_llamada = "Consulta" or &
		handle <> iw_contenedora.tab_1.il_handle_instalacion or &
		iw_contenedora.tab_1.ii_estado_oper >= fgci_incidencia_resuelta THEN
		RETURN
	END IF
	
	//Mostrado de menu
	M_opciones NewMenu
	NewMenu = CREATE M_opciones
	
	//AHM (02/11/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
	IF	iw_contenedora.tab_1.ii_estado_oper < fgci_incidencia_resuelta OR (gb_interfaseOsgm AND iw_contenedora.tab_1.ii_estado_mant > 1)THEN
		// se comprueba si la instalaci$$HEX1$$f300$$ENDHEX$$n tiene una interrupci$$HEX1$$f300$$ENDHEX$$n resuelta. En caso de ser as$$HEX1$$ed00$$ENDHEX$$
		// s$$HEX1$$f300$$ENDHEX$$lo podemos desplegar la opci$$HEX1$$f300$$ENDHEX$$n de men$$HEX2$$fa002000$$ENDHEX$$de reabrir interrupci$$HEX1$$f300$$ENDHEX$$n
		THIS.getitem(handle, le_elemento)
		lstr_datos_rama = le_elemento.data
	
		li_fila = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find&
					("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion), 1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())
	
		IF li_fila > 0 THEN
			IF gb_red_trifasica THEN 
				IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and (not isnull(f_alta)) and isnull(f_reposicion)" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) <= 0 THEN
					// La instalaci$$HEX1$$f300$$ENDHEX$$n ya tiene una interrupci$$HEX1$$f300$$ENDHEX$$n resuelta
					//DESTROY NewMenu
					//return
					li_respuesta = 6
				ELSE
					li_respuesta = of_estado_hijos(handle)
				END IF
				
			ELSE
				IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and (not isnull(f_alta_fase_a))" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) > 0 THEN
					
					// Hay interrupci$$HEX1$$f300$$ENDHEX$$n en A. Se comprueba todas est$$HEX1$$e100$$ENDHEX$$n resueltas, ya que en este caso se permite la reapertura
					IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and (not isnull(f_alta_fase_a)) and isnull(f_reposicion_fase_a)" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) = 0 THEN			
						// La instalalaci$$HEX1$$f300$$ENDHEX$$n tiene al menos una fase afectada resuelta	
						li_respuesta = 6
					END IF
				END IF
				IF li_respuesta <> 6 AND &
					iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and (not isnull(f_alta_fase_b))" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) > 0 THEN
					
					// Hay interrupci$$HEX1$$f300$$ENDHEX$$n en B. Se comprueba todas est$$HEX1$$e100$$ENDHEX$$n resueltas, ya que en este caso se permite la reapertura
					IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and (not isnull(f_alta_fase_b)) and isnull(f_reposicion_fase_b)" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) = 0 THEN			
						// La instalalaci$$HEX1$$f300$$ENDHEX$$n tiene al menos una fase afectada resuelta	
						li_respuesta = 6
					END IF
				END IF
				IF li_respuesta <> 6 AND &
					iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and (not isnull(f_alta_fase_c))" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) > 0 THEN
	
					// Hay interrupci$$HEX1$$f300$$ENDHEX$$n en C. Se comprueba todas est$$HEX1$$e100$$ENDHEX$$n resueltas, ya que en este caso se permite la reapertura
					IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and (not isnull(f_alta_fase_c)) and isnull(f_reposicion_fase_c)" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) = 0 THEN			
						// La instalalaci$$HEX1$$f300$$ENDHEX$$n tiene al menos una fase afectada resuelta	
						li_respuesta = 6
					END IF
				END IF
				IF li_respuesta <> 6 THEN		
					li_respuesta = of_estado_hijos(handle)
				END IF
			END IF
		ELSE
			li_respuesta = of_estado_hijos(handle)
		END IF
			
		//Se habilita y deshabilita las opciones del menu
		CHOOSE CASE li_respuesta
			CASE -1
				// La opci$$HEX1$$f300$$ENDHEX$$n de marcar interrupci$$HEX1$$f300$$ENDHEX$$n estar$$HEX2$$e1002000$$ENDHEX$$visible si el elemento sobre el que se
				// quiere desplegar el men$$HEX2$$fa002000$$ENDHEX$$no es un CT, en el caso de que se encuentre operaciones
				// en media tensi$$HEX1$$f300$$ENDHEX$$n, y no es una subestaci$$HEX1$$f300$$ENDHEX$$n en el caso de que se encuentre
				// operaciones s$$HEX1$$f300$$ENDHEX$$lo en alta tensi$$HEX1$$f300$$ENDHEX$$n
				// PACHO. Por otro lado si la variable de instalaciones digitalizadas est$$HEX2$$e1002000$$ENDHEX$$cargada validamos que instalaciones se pueden interrumpir.
				
				IF gb_operaciones AND gb_operaciones_inst = FALSE and ((of_ret_tipo(handle) = fgci_tipo_ct AND gi_tension_nivel_min = fgci_media_tension) &
					OR (of_ret_tipo(handle) = fgci_tipo_subestacion AND gi_tension_nivel_min = fgci_alta_tension)) THEN
	
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					NewMenu.m_opciona.visible = (SQLCA.SQLCode = 0 AND ll_estado_red = -10)
					
				ELSEIF gb_operaciones AND gb_operaciones_inst THEN
					
					NewMenu.m_opciona.visible = true
					
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					FOR li_conta = 1 to upperbound(iw_contenedora.tab_1.il_inst_dig[])
						if iw_contenedora.tab_1.il_inst_dig[li_conta] = lstr_datos_rama.ll_nro_instalacion	and  ll_estado_red <> -10 then
							NewMenu.m_opciona.visible = false
						end if
					NEXT
	
					IF  lstr_datos_rama.ll_nro_instalacion = iw_contenedora.tab_1.idec_nro_instalacion_afectada and iw_contenedora.tab_1.ii_resul_dig = 2 THEN
						NewMenu.m_opciona.visible = false
					END IF
	
				ELSE
					NewMenu.m_opciona.visible = TRUE
				END IF
				NewMenu.m_opcionc.visible = FALSE
				NewMenu.m_interrupcionesengrupo.visible = TRUE
				
			CASE 0
				// La opci$$HEX1$$f300$$ENDHEX$$n de marcar interrupci$$HEX1$$f300$$ENDHEX$$n estar$$HEX2$$e1002000$$ENDHEX$$visible si el elemento sobre el que se
				// quiere desplegar el men$$HEX2$$fa002000$$ENDHEX$$no es un CT, en el caso de que se encuentre operaciones
				// en media tensi$$HEX1$$f300$$ENDHEX$$n, y no es una subestaci$$HEX1$$f300$$ENDHEX$$n en el caso de que se encuentre
				// operaciones s$$HEX1$$f300$$ENDHEX$$lo en alta tensi$$HEX1$$f300$$ENDHEX$$n
				IF gb_operaciones AND gb_operaciones_inst = FALSE  AND ((of_ret_tipo(handle) = fgci_tipo_ct AND gi_tension_nivel_min = fgci_media_tension) &
					OR (of_ret_tipo(handle) = fgci_tipo_subestacion AND gi_tension_nivel_min = fgci_alta_tension)) THEN
	
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					NewMenu.m_opciona.visible = (SQLCA.SQLCode = 0 AND ll_estado_red = -10)
		
				ELSEIF gb_operaciones AND gb_operaciones_inst THEN
					
					NewMenu.m_opciona.visible = true
					
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					FOR li_conta = 1 to upperbound(iw_contenedora.tab_1.il_inst_dig[])
						if iw_contenedora.tab_1.il_inst_dig[li_conta] = lstr_datos_rama.ll_nro_instalacion	and  ll_estado_red <> -10 then
							NewMenu.m_opciona.visible = false
						end if
					NEXT
	
					IF  lstr_datos_rama.ll_nro_instalacion = iw_contenedora.tab_1.idec_nro_instalacion_afectada and iw_contenedora.tab_1.ii_resul_dig = 2 THEN
						NewMenu.m_opciona.visible = false
					END IF
				ELSE
					NewMenu.m_opciona.visible = TRUE
				END IF
				NewMenu.m_opcionc.visible = FALSE
				NewMenu.m_interrupcionesengrupo.visible = TRUE
				
			CASE 1
		
				//NewMenu.m_opciona.visible = FALSE
				//NewMenu.m_opciona.visible = NOT gb_red_trifasica
				IF gb_operaciones AND gb_operaciones_inst = FALSE  AND ((of_ret_tipo(handle) = fgci_tipo_ct AND gi_tension_nivel_min = fgci_media_tension) &
					OR (of_ret_tipo(handle) = fgci_tipo_subestacion AND gi_tension_nivel_min = fgci_alta_tension)) THEN
	
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					NewMenu.m_opciona.visible = (SQLCA.SQLCode = 0 AND ll_estado_red = -10)
					
				ELSEIF gb_operaciones AND gb_operaciones_inst THEN
					
					NewMenu.m_opciona.visible = true
					
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					FOR li_conta = 1 to upperbound(iw_contenedora.tab_1.il_inst_dig[])
						if iw_contenedora.tab_1.il_inst_dig[li_conta] = lstr_datos_rama.ll_nro_instalacion	and  ll_estado_red <> -10 then
							NewMenu.m_opciona.visible = false
						end if
					NEXT
	
					IF  lstr_datos_rama.ll_nro_instalacion = iw_contenedora.tab_1.idec_nro_instalacion_afectada and iw_contenedora.tab_1.ii_resul_dig = 2 THEN
						NewMenu.m_opciona.visible = false
					END IF
	
				ELSE
					NewMenu.m_opciona.visible = TRUE
				END IF
				NewMenu.m_opcionc.visible = FALSE
				NewMenu.m_interrupcionesengrupo.visible = True
				
			CASE 2
				
				//NewMenu.m_opciona.visible = FALSE
				//NewMenu.m_opciona.visible = TRUE //NOT gb_red_trifasica
				IF gb_operaciones AND gb_operaciones_inst = FALSE  AND ((of_ret_tipo(handle) = fgci_tipo_ct AND gi_tension_nivel_min = fgci_media_tension) &
					OR (of_ret_tipo(handle) = fgci_tipo_subestacion AND gi_tension_nivel_min = fgci_alta_tension)) THEN
	
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					NewMenu.m_opciona.visible = (SQLCA.SQLCode = 0 AND ll_estado_red = -10)
					
				ELSEIF gb_operaciones AND gb_operaciones_inst THEN
					
					NewMenu.m_opciona.visible = true
					
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					FOR li_conta = 1 to upperbound(iw_contenedora.tab_1.il_inst_dig[])
						if iw_contenedora.tab_1.il_inst_dig[li_conta] = lstr_datos_rama.ll_nro_instalacion	and  ll_estado_red <> -10 then
							NewMenu.m_opciona.visible = false
						end if
					NEXT
	
					IF  lstr_datos_rama.ll_nro_instalacion = iw_contenedora.tab_1.idec_nro_instalacion_afectada and iw_contenedora.tab_1.ii_resul_dig = 2 THEN
						NewMenu.m_opciona.visible = false
					END IF
	
				ELSE
					NewMenu.m_opciona.visible = TRUE
				END IF
				NewMenu.m_opcionc.visible = FALSE
				NewMenu.m_interrupcionesengrupo.visible = True
		
			CASE 3
		
				NewMenu.m_opciona.visible = FALSE
				//NewMenu.m_opcionc.visible = TRUE
				NewMenu.m_opcionc.visible = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
							" and ((not isnull(f_reposicion_fase_a)) or (not isnull(f_reposicion_fase_b)) or (not isnull(f_reposicion_fase_c)))" ,1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) <= 0 
				NewMenu.m_interrupcionesengrupo.visible = True
				IF gb_red_trifasica THEN
					NewMenu.m_interrupcionesengrupo.visible = FALSE
				ELSE
					IF iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+&
										" and nro_instalacion = " + string(lstr_datos_rama.ll_nro_instalacion) + &
										" and sgd_valor_descripcion = '" + lstr_datos_rama.ls_fase + "'"+& 
										" and IsNull(f_reposicion_fase_a) and IsNull(f_reposicion_fase_b) and IsNull(f_reposicion_fase_c)",1,iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()) > 0  THEN
						NewMenu.m_interrupcionesengrupo.visible = FALSE
					ELSE
						NewMenu.m_interrupcionesengrupo.visible = TRUE
					END IF
				END IF
				
			CASE 4
				NewMenu.m_opciona.visible = FALSE
				NewMenu.m_opcionc.visible = FALSE
				NewMenu.m_interrupcionesengrupo.visible = False
			
			CASE 5
		
				// La opci$$HEX1$$f300$$ENDHEX$$n de marcar interrupci$$HEX1$$f300$$ENDHEX$$n estar$$HEX2$$e1002000$$ENDHEX$$visible si el elemento sobre el que se
				// quiere desplegar el men$$HEX2$$fa002000$$ENDHEX$$no es un CT, en el caso de que se encuentre operaciones
				// en media tensi$$HEX1$$f300$$ENDHEX$$n, y no es una subestaci$$HEX1$$f300$$ENDHEX$$n en el caso de que se encuentre
				// operaciones s$$HEX1$$f300$$ENDHEX$$lo en alta tensi$$HEX1$$f300$$ENDHEX$$n
				IF gb_operaciones AND gb_operaciones_inst = FALSE  AND ((of_ret_tipo(handle) = fgci_tipo_ct AND gi_tension_nivel_min = fgci_media_tension) &
					OR (of_ret_tipo(handle) = fgci_tipo_subestacion AND gi_tension_nivel_min = fgci_alta_tension)) THEN
	
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					NewMenu.m_opciona.visible = (SQLCA.SQLCode = 0 AND ll_estado_red = -10)
				ELSEIF gb_operaciones AND gb_operaciones_inst THEN
					
					NewMenu.m_opciona.visible = true
					
					////////////////////////////////////////////////////////////////////////////////////
					// Esta Select es para saber si se trata de una incidencia dada de alta antes de la 
					// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
					SELECT NVL(ESTADO_RED,0)
					INTO :ll_estado_red
					FROM SGD_INCIDENCIA
					WHERE NRO_INCIDENCIA = :iw_contenedora.tab_1.il_nro_incidencia;
	
					FOR li_conta = 1 to upperbound(iw_contenedora.tab_1.il_inst_dig[])
						if iw_contenedora.tab_1.il_inst_dig[li_conta] = lstr_datos_rama.ll_nro_instalacion	and  ll_estado_red <> -10 then
							NewMenu.m_opciona.visible = false
						end if
					NEXT
	
					IF  lstr_datos_rama.ll_nro_instalacion = iw_contenedora.tab_1.idec_nro_instalacion_afectada and iw_contenedora.tab_1.ii_resul_dig = 2 THEN
						NewMenu.m_opciona.visible = false
					END IF
	
				ELSE
					NewMenu.m_opciona.visible = TRUE
				END IF
				NewMenu.m_opcionc.visible = FALSE
				NewMenu.m_interrupcionesengrupo.visible = True
			
			CASE 6
				// La instalaci$$HEX1$$f300$$ENDHEX$$n sobre la que se despliega el men$$HEX2$$fa002000$$ENDHEX$$tiene interrupciones resueltas.
				// Se da la posibilidad de reabrir la interrupci$$HEX1$$f300$$ENDHEX$$n
				NewMenu.m_reabririnterrupcion.visible = TRUE
				NewMenu.m_interrupcionesengrupo.visible = True
		END CHOOSE
	
	END IF
	
	// Si ya existe una instalacion origen de la incidencia ocultar menu
	// Hay que ocultar adem$$HEX1$$e100$$ENDHEX$$s la opci$$HEX1$$f300$$ENDHEX$$n de men$$HEX2$$fa002000$$ENDHEX$$si la incidencia es programada
	
	IF iw_contenedora.tab_1.ii_tipo_incid <> fgci_incidencia_programada and &
		(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen") = 0 OR + &
		ISNULL(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")))  THEN
		NewMenu.m_opcione.visible = TRUE
		lb_elim_sel=false
	ELSEIF iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.instalacion_origen[1] = lstr_datos_rama.ll_nro_instalacion then
		NewMenu.m_opcione.visible = TRUE
		NewMenu.m_opcione.text = "Eliminar selecci$$HEX1$$f300$$ENDHEX$$n de instalaci$$HEX1$$f300$$ENDHEX$$n origen"
		lb_elim_sel=true
	ELSE
		NewMenu.m_opcione.visible = FALSE
	END IF
	
	
	NewMenu.PopMenu(PointerX(), PointerY())
	
	//Realizo las acciones
	// 1	Marca Int. Simple
	// 2	Marca Mult. Int. OBSOLETO
	// 3	Desmarca Int. Simple
	// 4	Desmarca Mult. Int. OBSOLETO
	// 5	Instalacion Origen
	// 6  Mostrar Interrupciones
	// 7  Reabrir Interrupci$$HEX1$$f300$$ENDHEX$$n
	
	SetPointer(HourGlass!)
	
	IF Newmenu.ii_opcion_selec = 1 OR Newmenu.ii_opcion_selec=7 THEN
		
		// Se quieren marcar interrupciones. Se comprueba si la incidencia est$$HEX2$$e1002000$$ENDHEX$$en estado SR
		IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_servicio_repuesto THEN
			ldt_fecha_sr = iw_contenedora.tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDatetime(iw_contenedora.tab_1.ii_incidencia_servicio_repuesto,'f_alta')
				
			// La incidencia se encuentra en estado SR. Hay que comprobar si se ha sobrepasado o no
			// el tiempo 't' parametrizable para permitir reabrir la incidencia.
			// Si se ha sobrepasado el tiempo 't' no se permite marcar m$$HEX1$$e100$$ENDHEX$$s interrupciones
			lb_permitir_interrupcion = iw_contenedora.tab_1.of_comprobar_reapertura(ldt_fecha_sr)
	
		ELSE
			lb_permitir_interrupcion = true
		END IF
		
		IF lb_permitir_interrupcion THEN
			iw_contenedora.ib_post_activate = false
		//	if iw_contenedora.fw_incidencia_de_operaciones() then			
			IF Newmenu.ii_opcion_selec = 7 THEN
				gu_comunic.is_comunic.strval1 = ''
				IF iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.enabled = false AND &
					iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_a.checked = true THEN
					gu_comunic.is_comunic.strval1 = gs_fase_a
				END IF
				IF iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.enabled = false AND &
					iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_b.checked = true THEN
					gu_comunic.is_comunic.strval1 = gu_comunic.is_comunic.strval1 + gs_fase_b
				END IF
				IF iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.enabled = false AND &
					iw_contenedora.tab_1.tabpage_interrupciones.cbx_fase_c.checked = true THEN
					gu_comunic.is_comunic.strval1 = gu_comunic.is_comunic.strval1 + gs_fase_c
				END IF
				
				IF gb_red_trifasica THEN
					ls_fase_sugerida = gs_fase_a + gs_fase_b + gs_fase_c
				ELSE
					gu_comunic.is_comunic.strval2 = gu_comunic.is_comunic.strval1
					gu_comunic.is_comunic.accion_llamada = 'Interrupcion'
					open(w_seleccion_fase)
					ls_fase_sugerida = iw_contenedora.lu_comunic.is_comunic.strval1
				END IF
				
				IF ls_fase_sugerida = '' OR ISNULL(ls_fase_sugerida) THEN	
					lb_permitir_interrupcion = FALSE
				ELSE
					iw_contenedora.tab_1.tabpage_interrupciones.pb_anterior.visible = False
					iw_contenedora.tab_1.tabpage_interrupciones.pb_avanzar.visible = False
					iw_contenedora.tab_1.tabpage_interrupciones.cb_separador.visible = False
				END IF
										
			ELSE
				IF gb_red_trifasica THEN
					ls_fase_sugerida = gs_fase_a + gs_fase_b + gs_fase_c
				ELSE
					ls_fase_sugerida = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.GetItemString(1,'fase_sugerida')
					IF ls_fase_sugerida = '' OR ISNULL(ls_fase_sugerida) THEN
						ls_fase_sugerida = of_ret_fase(handle)
					ELSE
						IF NOT (( Match(ls_fase_sugerida, gs_fase_a) AND Match(of_ret_fase(handle), gs_fase_a)) OR &
							( Match(ls_fase_sugerida, gs_fase_b) AND Match(of_ret_fase(handle), gs_fase_b)) OR &
							( Match(ls_fase_sugerida, gs_fase_c) AND Match(of_ret_fase(handle), gs_fase_c))) THEN
							// La instalaci$$HEX1$$f300$$ENDHEX$$n no tiene ninguna de las fases sugeridas
							ls_fase_sugerida = of_ret_fase(handle)
						END IF
					END IF
				END IF
			END IF
		END IF
		
	END IF
	
	CHOOSE CASE Newmenu.ii_opcion_selec
			
		CASE 1,7 // Interrupci$$HEX1$$f300$$ENDHEX$$n simple
			IF lb_permitir_interrupcion = true THEN
				
				
				IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_pendiente AND &
					lm_menu.m_consultar.m_instalacionafectada.enabled=TRUE THEN
	
					lm_menu.m_consultar.m_instalacionafectada.enabled = FALSE
				END IF
				IF iw_contenedora.tab_1.fnu_valida_interrupcion(handle, ls_fase_sugerida, is_fase_int_permitida, TRUE) = -1 THEN
					DESTROY NewMenu
					return
				END IF
				
				IF Newmenu.ii_opcion_selec = 1 THEN
					IF of_ret_inst_padre(handle) <> fgcdec_aviso_con_alimentacion THEN
						gnu_u_transaction.uf_rollback(iw_contenedora.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(of_ret_inst_padre(handle)), true)
						// Bloqueamos una instalacion para dar de alta la interrupcion
						li_lock_status = gnu_u_transaction.uf_lock(true,iw_contenedora.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(of_ret_inst_padre(handle)))
					ELSE
						gnu_u_transaction.uf_rollback(iw_contenedora.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(lstr_datos_rama.ll_nro_instalacion), true)	
						li_lock_status = gnu_u_transaction.uf_lock(true,iw_contenedora.st_bloqueo,'sgd_instalacion','nro_instalacion = ' + string(lstr_datos_rama.ll_nro_instalacion))		
					END IF
					
					if li_lock_status = -54 then
						DESTROY NewMenu
						return
					END IF
				END IF
				//else
				li_estado = iw_contenedora.tab_1.ii_estado_oper
				IF Newmenu.ii_opcion_selec = 7 AND gb_red_trifasica = FALSE THEN
					ls_fase_aux = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.GetItemString(1,'fase_sugerida')
					//iw_contenedora.tab_1.tabpage_formulario.d_inf_general.SetItem(1,'fase_sugerida', ls_fase_sugerida)	
					IF Match(ls_fase_sugerida, gs_fase_a) THEN
						iw_contenedora.tab_1.tabpage_formulario.d_inf_general.SetItem(1,'fase_sugerida', gs_fase_a)	
						of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,handle,1,FALSE)
					END IF
					IF Match(ls_fase_sugerida, gs_fase_b) THEN
						iw_contenedora.tab_1.tabpage_formulario.d_inf_general.SetItem(1,'fase_sugerida', gs_fase_b)	
						of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,handle,1,FALSE)
					END IF
					IF Match(ls_fase_sugerida, gs_fase_c) THEN
						iw_contenedora.tab_1.tabpage_formulario.d_inf_general.SetItem(1,'fase_sugerida', gs_fase_c)	
						of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,handle,1,FALSE)
					END IF
					iw_contenedora.tab_1.tabpage_formulario.d_inf_general.SetItem(1,'fase_sugerida', ls_fase_aux)		
				ELSE
					of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,handle,1,FALSE)
				END IF
				il_inst[upperbound(il_inst) + 1] = lstr_datos_rama.ll_nro_inst_padre
				il_tipo_padre[upperbound(il_tipo_padre[])  + 1] = lstr_datos_rama.li_tipo_instalacion - 1
				
				// Se comprueba si se ha dado de alta una interrupci$$HEX1$$f300$$ENDHEX$$n en una incidencia 
				// sin p$$HEX1$$e900$$ENDHEX$$rdida.
				IF iw_contenedora.tab_1.ii_alcance = fgci_incidencia_sin_interrupcion THEN
					// Se ha dado de alta una interrupci$$HEX1$$f300$$ENDHEX$$n en una incidencia sin p$$HEX1$$e900$$ENDHEX$$rdida
					// Hay que convertir la incidencia sin p$$HEX1$$e900$$ENDHEX$$rdida en incidencia con p$$HEX1$$e900$$ENDHEX$$rdida
					
					// Se convierte la incidencia en una con p$$HEX1$$e900$$ENDHEX$$rdida
					iw_contenedora.tab_1.ii_alcance = fgci_incidencia_con_interrupcion
					iw_contenedora.tab_1.tabpage_formulario.d_inf_general.setitem(1,"alcance",fgci_incidencia_con_interrupcion)			
					// Al tener la incidencia interrupciones se tienen que habilitar las opciones de men$$HEX2$$fa002000$$ENDHEX$$
					// de consulta de avisos asociados a la incidencia y de consulta de suministros importantes
					lm_menu.m_consultar.m_avisos.enabled=true
					lm_menu.m_consultar.m_suministrosimportantes.enabled = true
					//iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.enabled=false
					// Se resetean las variables con las que se accede a la informaci$$HEX1$$f300$$ENDHEX$$n de los estados
					iw_contenedora.tab_1.of_iniciar_estados_oper()
					// Se analiza la incidencia para cambiar la datawindow de los estados
					iw_contenedora.fw_evaluo_inc_calidad(iw_contenedora.tab_1.ii_tipo_incid, False, fgci_incidencia_con_interrupcion)
				END IF
			END IF
			
		CASE 3
			// Se comprueba si se pasa a SR como consecuencia de haber desmarcado la interrupci$$HEX1$$f300$$ENDHEX$$n.
			// En este caso es obligatorio que se tenga seleccionada previamente la causa de la incidencia
	//		IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_en_reposicion AND &
	//			iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.Find("nro_incidencia=" + string(iw_contenedora.tab_1.il_nro_incidencia)+' and IsNull(f_reposicion) and nro_instalacion <> ' + string(lstr_datos_rama.ll_nro_instalacion), &
	//												1, iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount()) <= 0 AND &
	//			iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.st_causa.Text = "" THEN
	//			gnv_msg.f_mensaje("AI57","","",ok!)
	//		ELSE
				of_marca_interrupcion(iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup,handle,0,FALSE)
				iw_contenedora.tab_1.f_actualizar_estado()
				
				// Desbloqueamos la instalaci$$HEX1$$f300$$ENDHEX$$n donde tenemos marcada la interrupci$$HEX1$$f300$$ENDHEX$$n
				
				gnu_u_transaction.uf_rollback(this,'sgd_instalacion','nro_instalacion = ' + string(lstr_datos_rama.ll_nro_instalacion),true)
				
				FOR ll_contador=1 to upperbound(il_inst)
					IF il_inst[upperbound(il_inst)] = lstr_datos_rama.ll_nro_inst_padre THEN
						setnull(il_inst[ll_contador])
						setnull(il_tipo_padre[ll_contador])
					END IF
				NEXT
	//		END IF
			
		CASE 5
			
			if lb_elim_sel=false then
				iw_contenedora.tab_1.tabpage_formulario.d_inf_general.setitem(1,"instalacion_origen",of_ret_codigo(handle))
				THIS.getitem(handle, le_elemento)
				lstr_datos_rama = le_elemento.data
				iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = fg_remplaza(lstr_datos_rama.ls_nom_instalacion, '"', ' ')
				//IF le_elemento.StatePictureIndex = 2 THEN//Left(le_elemento.label, 2) = 'X ' THEN
				//	le_elemento.label = 'X * ' + Right(le_elemento.label, Len(le_elemento.label) - 2)
				//ELSE
					le_elemento.label = "* " + trim(le_elemento.label)
				//END IF
				THIS.setitem(handle, le_elemento)
				lm_menu= iw_contenedora.menuid
				
				IF iw_contenedora.tab_1.ii_estado_oper = fgci_incidencia_pendiente AND &
					lm_menu.m_consultar.m_instalacionafectada.enabled=TRUE THEN
	
					lm_menu.m_consultar.m_instalacionafectada.enabled = FALSE
				END IF
			else
				
				setnull(li_nula)
				iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.instalacion_origen[1]=li_nula
				iw_contenedora.tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ''
				THIS.getitem(handle, le_elemento) 
				//IF le_elemento.StatePictureIndex = 2 THEN //Left(le_elemento.label, 2) = 'X ' THEN
				//	le_elemento.label = 'X ' + Right(le_elemento.label, Len(le_elemento.label) - 4)
				//ELSE
					le_elemento.label = Replace ( le_elemento.label, 1, 2, "")
				//END IF
				THIS.setitem(handle, le_elemento)
			end if
	
			
		CASE 6
			fw_buscar_interrupciones(iw_contenedora.tab_1.il_nro_incidencia)
			iw_contenedora.tab_1.il_handle_instalacion = 0
		
		CASE 8
			This.TriggerEvent("ue_interr_agrup")
					
	END CHOOSE
	
	// se llama a la funci$$HEX1$$f300$$ENDHEX$$n que habilita los tabs por si cambia el estado de alguno de ellos
	iw_contenedora.tab_1.f_deshab_tabs(false)  
	
	IF NewMenu.ii_opcion_selec = 1 THEN
		iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.visible = TRUE
		iw_contenedora.tab_1.tabpage_interrupciones.st_duracion.visible = TRUE
		iw_contenedora.tab_1.tabpage_interrupciones.st_durac.visible = TRUE
	END IF
	
	DESTROY NewMenu
	
END IF
SetPointer(Arrow!)
end event

event doubleclicked;EVENT ue_doubleclicked(handle)

end event

event constructor;call super::constructor;gu_control_v_incidencias.of_recupera_padre(iw_contenedora,this,"w_2301_form_incidencia")

//***************************************
//**  OSGI 2001.1  	29/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_usa_trafo = fg_verifica_parametro("usa_trafo")

ib_tipo_area = fg_verifica_parametro("TIPO AREA")
//***************************************
//**  OSGI 2001.1  	29/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

end event

on u_tv.create
call super::create
end on

on u_tv.destroy
call super::destroy
end on


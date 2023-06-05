HA$PBExportHeader$u_inc_2030_pr_filtro_incidencia.sru
forward
global type u_inc_2030_pr_filtro_incidencia from datawindow
end type
end forward

global type u_inc_2030_pr_filtro_incidencia from datawindow
integer width = 1737
integer height = 848
string dataobject = "d_inc_2030_filtro_incidencia"
end type
global u_inc_2030_pr_filtro_incidencia u_inc_2030_pr_filtro_incidencia

type variables
string is_alimentacion = " "
string is_estado = " "
string is_estado_mant = " "
string is_tipo = " "
string is_alcance = " "
string is_suministro = " "
string is_linea = " "
string is_nro_desde_hasta

datawindowchild ddw_alcance_t
datawindowchild ddw_tipo_aviso
datawindowchild ddw_estado_incidencia_t
datawindowchild ddw_estado_mantenimiento_t
datawindowchild ddw_tipo_incidencia_t
datawindowchild ddw_tension_incid_t
//hjhgjgjgj
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0
Boolean ib_filtro_hist = False

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
datawindowchild ddw_nom_ins_afectada
datawindowchild ddw_nom_ins_origen
datawindowchild ddw_tip_ins_afectada
datawindowchild ddw_tip_ins_origen
datawindowchild ddw_tension
datawindowchild ddw_estado_actual
datawindowchild ddw_brigada
datawindowchild ddw_ot
datawindowchild ddw_causa
datawindowchild ddw_material_averiado
//
s_incidencia is_incidencia
//s_incid istr_incidencia

// constantes
//int fgci_perfil_tele_telefonista
//int fgci_perfil_tele_encargado_turno
//int fgci_perfil_tele_gerente
//int fgci_perfil_tele_consulta
//int fgci_perfil_oper_alta_media
//int fgci_perfil_oper_encargado_turno
//int fgci_perfil_oper_gerente
//int fgci_perfil_oper_consulta
//int fgci_perfil_oper_baja
//int fgci_incidencia_resuelta
//int fgci_todos
//int fgci_hasta_sr
//int fgci_incidencia_pendiente
//int fgci_hasta_para_resolucion
//int fgci_incidencia_mant_sin_atender
//int fgci_hasta_serv_repuesto
//int fgci_perfil_oper_mante_red
//int fgci_perfil_mante_encargado_turno
//int fgci_perfil_mante_consulta
//int fgci_perfil_mante_gerente
//int fgci_perfil_mante_operador_alta
//int fgci_perfil_mante_operador_baja
//int fgci_perfil_mantenimiento
///int fgci_incidencia_imprevista
//int fgci_media_tension
//int fgci_baja_tension
//int fgci_incidencia_de_instalacion
//int fgci_incidencia_causa_localizada
//int fgci_incidencia_de_suministro
//int fgci_perfil_operaciones_ini
//int fgci_perfil_operaciones_fin
//int fgci_perfil_tele_ini
//int fgci_perfil_tele_fin
//int fgci_perfil_mante_ini
//int fgci_perfil_mante_fin

end variables

forward prototypes
public subroutine fnu_cargo_alimentacion (integer pi_valor)
public subroutine fnu_cargar_estado (integer pi_valor)
public subroutine fnu_cargar_tipo (integer pi_valor)
public subroutine fnu_cargar_alcance (integer pi_valor)
public subroutine fnu_cargar_duracion (integer pi_valor)
public subroutine fpr_habilitar_campos (string ps_accion)
public function string fnu_filtrar_avisos ()
public subroutine fnu_cargar_estado_mant (integer pi_valor)
public subroutine fnu_cargar_suministro (integer pi_valor)
public function integer fpr_hab_perfil_telefonista (ref datawindow p_dw)
public function integer fpr_inicializar_perfil_telefonista (ref datawindow p_dw)
public function integer fpr_mostarse_a_telefonista (ref datawindow p_dw)
public function integer fpr_hab_perfil_operaciones (ref datawindow p_dw)
public function integer fpr_hab_perfil_mantenimiento (ref datawindow p_dw)
public function integer fpr_mostarse_a_operaciones (ref datawindow p_dw)
public function integer fpr_mostarse_a_mantenimiento (ref datawindow p_dw)
public function integer fpr_inicializar_perfil_operaciones (ref datawindow p_dw)
public function integer fpr_inicializar_perfil_mantenimiento (ref datawindow p_dw)
public function integer fnu_cargar_dddw ()
public function string fnu_nro_incid_desde_hasta ()
public function integer fnu_cargar_dddw_historico ()
public function integer fnu_cargar_dddw_consulta ()
public function string fnu_obten_alcance_tipo_incidencia (integer pi_tipo_incidencia)
public function string fnu_obten_estado_incidencia (integer pi_tipo_incidencia, integer pi_alcance, boolean pb_mantenimiento, boolean pb_openbdi)
public subroutine of_filtro_tipo_inc_ext ()
public function string fnu_nro_incid_desde_hasta_reenganche ()
end prototypes

public subroutine fnu_cargo_alimentacion (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_alimentacion
// 
// Objetivo:  Carga el campo alimentaci$$HEX1$$f300$$ENDHEX$$n seg$$HEX1$$fa00$$ENDHEX$$n valor pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:  pi_valor
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




this.setitem(1,"ai_alimentacion",pi_valor)

end subroutine

public subroutine fnu_cargar_estado (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_estado
// 
// Objetivo:  Carga el campo estado con valor del par$$HEX1$$e100$$ENDHEX$$metro recibido.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:  pi_valor
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////





this.setitem(1,"ai_estado",pi_valor)

end subroutine

public subroutine fnu_cargar_tipo (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_tipo
// 
// Objetivo:  Carga el campo tipo seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metros.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:  pi_valor
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




this.setitem(1,"ai_tipo",pi_valor)
end subroutine

public subroutine fnu_cargar_alcance (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_alcance
// 
// Objetivo:  Carga el campo alcance seg$$HEX1$$fa00$$ENDHEX$$n el par$$HEX1$$e100$$ENDHEX$$metro recibido.
//	
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:  pi_valor
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


this.setitem(1,"ai_alcance",pi_valor)
end subroutine

public subroutine fnu_cargar_duracion (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_duracion
// 
// Objetivo:  Carga el campo duraci$$HEX1$$f300$$ENDHEX$$n seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metro recibido.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:  pi_valor
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////



this.setitem(1,"ai_duracion",pi_valor)
end subroutine

public subroutine fpr_habilitar_campos (string ps_accion);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_habilitar_campos
// 
// Objetivo: Habilito y Deshabilito campos seg$$HEX1$$fa00$$ENDHEX$$n la acci$$HEX1$$f300$$ENDHEX$$n llamada.
// 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_accion
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

// DSA INI 09/08/2000
CHOOSE CASE ps_accion
		CASE "Consulta"				
  					this.Modify("ai_alimentacion.background.color=" + gs_blanco    +&
			        "~t ai_estado.background.color="    + gs_blanco    +&
			        "~t ai_tipo.background.color="      + gs_blanco	  +&
					  "~t ai_alcance.background.color="  + gs_blanco	  +&
					  "~t ai_duracion.background.color="      + gs_blanco)				
							
					this.SetTabOrder("ai_Alimentacion",10)
					this.SetTabOrder("ai_Estado",20)
					this.SetTabOrder("ai_tipo",30)
					this.SetTabOrder("ai_alcance",40)
					this.SetTabOrder("ai_duracion",50)		
END CHOOSE

//CHOOSE CASE ps_accion
//	CASE "Consulta"
//			gi_perfil_ok[1] = fgci_perfil_tele_telefonista
//			gi_perfil_ok[2] = fgci_perfil_tele_encargado_turno
//			gi_perfil_ok[3] = fgci_perfil_tele_gerente
//        	gi_perfil_ok[4] = fgci_perfil_tele_consulta
//			gi_perfil_ok[5] = fgci_perfil_oper_alta_media
//			gi_perfil_ok[6] = fgci_perfil_oper_encargado_turno
//			gi_perfil_ok[7] = fgci_perfil_oper_gerente
//			gi_perfil_ok[8] = fgci_perfil_oper_consulta
//			gi_perfil_ok[9] = fgci_perfil_oper_baja
//			gi_perfil_ok[10] = 0
//					if fgnu_tiene_perfil(0) then 
//				
//  					this.Modify("ai_alimentacion.background.color=" + gs_blanco    +&
//			        "~t ai_estado.background.color="    + gs_blanco    +&
//			        "~t ai_tipo.background.color="      + gs_blanco	  +&
//					  "~t ai_alcance.background.color="  + gs_blanco	  +&
//					  "~t ai_duracion.background.color="      + gs_blanco)				
//							
//					this.SetTabOrder("ai_Alimentacion",10)
//					this.SetTabOrder("ai_Estado",20)
//					this.SetTabOrder("ai_tipo",30)
//					this.SetTabOrder("ai_alcance",40)
//					this.SetTabOrder("ai_duracion",50)
//					end if
//
//			
//		
//	CASE ELSE
////		<statementblock>
//END CHOOSE
//
// DSA FIN 09/08/2000
end subroutine

public function string fnu_filtrar_avisos ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_filtrar_avisos
//
// Objetivo:  Filtra avisos.
//	        
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
int li_tipo_incid, li_estado, li_alcance
string ls_columna_alcance

// inicializo variables


	is_alimentacion = " "
	is_estado = " "
	is_estado_mant = " "
	is_tipo = " "
	is_alcance = " "
	is_suministro = " "
	is_linea = " "


// Evaluo el tipo 
	li_tipo_incid = getitemnumber(1,"ai_tipo")
	li_alcance = getitemnumber(1,"ai_suministro")
	
	if li_tipo_incid <> fgci_todos and li_alcance <> fgci_incidencia_reenganche then
		is_tipo =  "(SGD_INCIDENCIA.tip_incidencia =  "+ string(getitemnumber(1,"ai_tipo")) + " " +")"
	else
		is_tipo = " "
	end if 

//Evaluo el alcance de la incidencia

// Se comprueba de que campo se ha de escoger el alcance, ya que para las incidencias 
// programadas se coge del campo ai_suministro_programada, y para el resto se coge de
// ai_suministro (LFE)
IF li_tipo_incid = fgci_incidencia_programada THEN 
	ls_columna_alcance = "ai_suministro_programada"
ELSE
	ls_columna_alcance = "ai_suministro"
END IF

CHOOSE CASE getitemnumber(1,ls_columna_alcance)
	CASE fgci_todos
		is_suministro = " "
	CASE fgci_incidencia_reenganche
		is_suministro = " "
	CASE ELSE
		is_suministro =  " (SGD_INCIDENCIA.alcance =  "+ string(getitemnumber(1,"ai_suministro")) + " " +") "
END CHOOSE


li_estado = getitemnumber(1,"ai_estado")

IF li_estado <> fgci_todos THEN
	IF li_estado = fgci_hasta_serv_repuesto THEN
		// Aqu$$HEX2$$ed002000$$ENDHEX$$hay que traer todas las incidencias cuyo estado sea menor o igual que SR.
		
		//is_estado = " (SGD_INCIDENCIA.est_actual <= decode(SGD_INCIDENCIA.alcance,1,4,2,decode(SGD_INCIDENCIA.tip_incidencia,1,5,2,0,3,4),3,5,4,4)) " 		
		is_estado = " (SGD_INCIDENCIA.est_actual <= " + string(fgci_incidencia_servicio_repuesto) + &
						" or SGD_INCIDENCIA.EST_ACTUAL = " + string(fgci_incidencia_pte_explotacion)  + ")" 		

	ELSEif li_alcance <> fgci_incidencia_reenganche then
		is_estado = "(SGD_INCIDENCIA.est_actual =  "+ string(li_estado) + ")" 		
	END IF
	
ELSEIF li_alcance <> fgci_incidencia_reenganche then
	IF ib_filtro_hist THEN
		is_estado = "(SGD_INCIDENCIA.EST_ACTUAL IN (" + string(fgci_incidencia_resuelta) + "," + string(fgci_estado_anulado) + "))" 
	ELSE
		is_estado  = "(SGD_INCIDENCIA.est_actual <>  "+ string(fgci_incidencia_resuelta) + ")" 		
	END IF
	
END IF

//AMH (03/11/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
// Evaluo el estado de mantenimiento  

	if getitemnumber(1,"ai_estado_mant") <> fgci_todos then
		if getitemnumber(1,"ai_estado_mant") =  fgci_hasta_para_resolucion then 
			is_estado = "(SGD_INCIDENCIA.estado_mantenimiento >=" + string(fgci_incidencia_mant_sin_atender) +" and  SGD_INCIDENCIA.estado_mantenimiento <=  "+string(fgci_incidencia_mant_para_resolucion)+" OR SGD_INCIDENCIA.estado_mantenimiento is null"+" "+")"
		else
			IF NOT(gb_interfaseOsgm) OR (gb_interfaseOsgm AND getitemnumber(1,"ai_estado_mant") <> 1) THEN
				is_estado_mant = "(SGD_INCIDENCIA.estado_mantenimiento =  "+ string(getitemnumber(1,"ai_estado_mant")) + " " +")" 
			ELSE
				is_estado_mant = "(SGD_INCIDENCIA.estado_mantenimiento =  "+ string(getitemnumber(1,"ai_estado_mant")) + " OR SGD_INCIDENCIA.estado_mantenimiento is null" +")" 
			END IF
		end if
	else
		is_estado_mant = " "
	end if


// Evaluo el alcance del tipo de tensi$$HEX1$$f300$$ENDHEX$$n
	if getitemnumber(1,"ai_alcance") <> fgci_todos and li_alcance <> fgci_incidencia_reenganche then
		is_alcance =  "(SGD_INCIDENCIA.Tip_tension =  "+ string(getitemnumber(1,"ai_alcance")) + " " +")"
	elseif li_alcance = fgci_incidencia_reenganche and getitemnumber(1,"ai_alcance") <> fgci_todos THEN
		is_alcance =  "(SGD_REENGANCHES.Tip_tension =  "+ string(getitemnumber(1,"ai_alcance")) + " " +")"
	else
		is_alcance = " "
	end if 




// Evaluo el suministro
//	if getitemnumber(1,"ai_suministro") <> fgci_todos then
//		is_suministro =  "(SGD_INCIDENCIA.ind_suministro =  "+ string(getitemnumber(1,"ai_suministro")) + " " +")"
//	else
//		is_suministro = " "
//	end if 
//

//______DSA INI 08/05/2000			
CHOOSE CASE getitemnumber(1,"ai_suministro")
	CASE fgci_todos
		is_suministro = " "
	CASE fgci_incidencia_reenganche
		is_suministro = " "
	CASE ELSE
		is_suministro =  " (SGD_INCIDENCIA.alcance =  "+ string(getitemnumber(1,"ai_suministro")) + " " +") "
END CHOOSE
//______DSA FIN 08/05/2000			




// Evaluo la duracion


// Formo la clausula  definitiva

	if is_alimentacion <> " " then
			is_linea = is_alimentacion 
	end if

	if is_estado <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND " + is_estado 
		else
			is_linea = is_estado
		end if
	end if


	if is_estado_mant <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND " + is_estado_mant
		else
			is_linea = is_estado_mant
		end if
	end if






	if is_tipo <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND  " + is_tipo 
		else
			is_linea = is_tipo
		end if
	end if

	if is_alcance <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND  " + is_alcance 
		else
			is_linea = is_alcance
		end if
	end if	



	if is_suministro <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND  " + is_suministro
		else
			is_linea = is_suministro
		end if
	end if	
	
return is_linea
end function

public subroutine fnu_cargar_estado_mant (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_estado_mant
// 
// Objetivo:  Carga el campo estado en mantenimiento
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:  pi_valor
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




this.setitem(1,"ai_estado_mant",pi_valor)

end subroutine

public subroutine fnu_cargar_suministro (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_suministro
// 
// Objetivo:  Carga el campo suministro seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:  pi_valor
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////





this.setitem(1,"ai_suministro",pi_valor)
end subroutine

public function integer fpr_hab_perfil_telefonista (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_hab_perfil_telefonista
// 
// Objetivo: Habilito y Deshabilito campos para
//	          perfil de telefonista.
// 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


//habilito y deshabilito campos
	p_dw.modify("ai_estado.protected=0")
	p_dw.modify("ai_estado_mant.protected=1")
	p_dw.modify("ai_tipo.protected=0")
	p_dw.modify("ai_alcance.protected=0")
	p_dw.modify("ai_suministro.protected=0")
	p_dw.modify("ai_duracion.protected=0")

//Cambio de color de fondo los campos segun esten habilitados o no
	p_dw.modify("ai_estado.bacground.color="+gs_blanco)
	p_dw.modify("ai_estado_mant.bacground.color="+gs_gris)
	p_dw.modify("ai_tipo.bacground.color="+gs_blanco)
	p_dw.modify("ai_alcance.bacground.color="+gs_blanco)
	p_dw.modify("ai_suministro.bacground.color="+gs_blanco)
	p_dw.modify("ai_duracion.bacground.color="+gs_blanco)


Return 1


end function

public function integer fpr_inicializar_perfil_telefonista (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_inicializar_perfil_telefonista
//
// Objetivo: Inicializar campos para perfil de telefonista.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


p_dw.setitem(1,"ai_estado",fgci_hasta_serv_repuesto)	//Hasta Servicio Repuesto
p_dw.setitem(1,"ai_estado_mant",fgci_todos)				//todos
p_dw.setitem(1,"ai_tipo",fgci_todos)							//todos
p_dw.setitem(1,"ai_alcance",fgci_todos)						//todos
p_dw.setitem(1,"ai_suministro",fgci_todos)					//todos
p_dw.setitem(1,"ai_duracion",fgci_todos)	
return 1
end function

public function integer fpr_mostarse_a_telefonista (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_mostrarse_a_telefonista
//
// Objetivo: Llama a las funciones de habilitar e inicializar datos del telefonista seg$$HEX1$$fa00$$ENDHEX$$n el perfil
//     		 del usuario loguiado.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

this.fpr_inicializar_perfil_telefonista(p_dw)
this.fpr_hab_perfil_telefonista(p_dw)
return 1
end function

public function integer fpr_hab_perfil_operaciones (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_hab_perfil_operaciones
//
// Objetivo: Habilita o Deshabilita campos para usuarios 
//	          de perfil de operaciones.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


//habilito y deshabilito campos
	p_dw.modify("ai_estado.protected=0")
	p_dw.modify("ai_estado_mant.protected=1")
	p_dw.modify("ai_tipo.protected=0")
	p_dw.modify("ai_alcance.protected=0")
	p_dw.modify("ai_suministro.protected=0")
	p_dw.modify("ai_duracion.protected=0")

//Cambio de color de fondo los campos segun esten habilitados o no
	p_dw.modify("ai_estado.bacground.color="+gs_blanco)
	p_dw.modify("ai_estado_mant.bacground.color="+gs_gris)
	p_dw.modify("ai_tipo.bacground.color="+gs_blanco)
	p_dw.modify("ai_alcance.bacground.color="+gs_blanco)
	p_dw.modify("ai_suministro.bacground.color="+gs_blanco)
	p_dw.modify("ai_duracion.bacground.color="+gs_blanco)


Return 1


end function

public function integer fpr_hab_perfil_mantenimiento (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_hab_perfil_mantenimiento
//
// Objetivo:  Habilita y Deshabilita campos para perfil 
//	            de usuarios de mantenimiento.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

//habilito y deshabilito campos
	p_dw.modify("ai_estado.protected=0")
	p_dw.modify("ai_estado_mant.protected=1")
	p_dw.modify("ai_tipo.protected=0")
	p_dw.modify("ai_alcance.protected=0")
	p_dw.modify("ai_suministro.protected=0")
	p_dw.modify("ai_duracion.protected=0")

//Cambio de color de fondo los campos segun esten habilitados o no
	p_dw.modify("ai_estado.bacground.color="+gs_blanco)
	p_dw.modify("ai_estado_mant.bacground.color="+gs_gris)
	p_dw.modify("ai_tipo.bacground.color="+gs_blanco)
	p_dw.modify("ai_alcance.bacground.color="+gs_blanco)
	p_dw.modify("ai_suministro.bacground.color="+gs_blanco)
	p_dw.modify("ai_duracion.bacground.color="+gs_blanco)


Return 1


end function

public function integer fpr_mostarse_a_operaciones (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_mostrarse_a_operaciones
//
// Objetivo: Llama a las funciones Habilitar e iniciar datos del perfil de operaciones
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

this.fpr_inicializar_perfil_operaciones(p_dw)
this.fpr_hab_perfil_operaciones(p_dw)
return 1
end function

public function integer fpr_mostarse_a_mantenimiento (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_mostrarse_a_mantenimiento
//
// Objetivo: Llama a las funciones Habilitar e iniciar datos de perfil mantenimiento
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

this.fpr_inicializar_perfil_mantenimiento(p_dw)
this.fpr_hab_perfil_mantenimiento(p_dw)
return 1
end function

public function integer fpr_inicializar_perfil_operaciones (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_inicializar_perfil_operaciones
//
// Objetivo: Inicializa perfil de operaciones
// 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

p_dw.setitem(1,"ai_estado",fgci_hasta_serv_repuesto)	//Hasta Servicio Repuesto
p_dw.setitem(1,"ai_estado_mant",fgci_todos)				//todos
p_dw.setitem(1,"ai_tipo",fgci_todos)							//todos
p_dw.setitem(1,"ai_alcance",fgci_todos)						//todos
p_dw.setitem(1,"ai_suministro",fgci_todos)					//todos
p_dw.setitem(1,"ai_duracion",fgci_todos)					//todos
return 1
end function

public function integer fpr_inicializar_perfil_mantenimiento (ref datawindow p_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_inicializar_perfil_mantenimiento
//
// Objetivo: Inicializa  los datos para usuarios con perfil
//           de mantenimiento.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: p_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

p_dw.setitem(1,"ai_estado",fgci_hasta_serv_repuesto)	//Hasta Servicio Repuesto
p_dw.setitem(1,"ai_estado_mant",fgci_todos)				//todos
p_dw.setitem(1,"ai_tipo",fgci_todos)							//todos
p_dw.setitem(1,"ai_alcance",fgci_todos)						//todos
p_dw.setitem(1,"ai_suministro",fgci_todos)					//todos
p_dw.setitem(1,"ai_duracion",fgci_todos)	
return 1
end function

public function integer fnu_cargar_dddw ();///////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
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
int li_tension
int ii
string ls_filtro
datawindowchild ddw_child_alcance;


this.GetChild("ai_estado",ddw_estado_incidencia_t)
ddw_estado_incidencia_t.SetTransObject(SQLCA)
// se traen los estados para:
// 	- Tipo de Incidencia = Todos
// 	- Alcance = Todos			(LFE)
ddw_estado_incidencia_t.retrieve('E_OP')


//ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)

ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_todos,fgci_todos,gb_mantenimiento,gb_openbdi)

//if gb_mantenimiento = false then
//	ls_filtro = "codigo < 7 or codigo > 9"
//else
//	ls_filtro = "codigo <> 9"
//end if
//
ddw_estado_incidencia_t.SetFilter(ls_filtro)
ddw_estado_incidencia_t.filter()
ddw_estado_incidencia_t.SetSort("Codigo A")
ddw_estado_incidencia_t.Sort()

//ddw_estado_incidencia_T.SetTransObject(SQLCA)
//ddw_estado_incidencia_t.Retrieve()

//ddw_estado_incidencia_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
//ddw_estado_incidencia_t.filter()



this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
ddw_estado_mantenimiento_t.Retrieve('E_MA')
//ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)


//ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
//ddw_estado_mantenimiento_t.Retrieve()
////ddw_estado_mantenimiento_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
////ddw_estado_mantenimiento_t.filter()
//


this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
ii=ddw_tipo_incidencia_t_shared.sharedata(ddw_tipo_incidencia_t)
ddw_tipo_incidencia_t.SetSort("codigo A")// DSA 08/05/2000	
ddw_tipo_incidencia_t.Sort()// DSA 08/05/2000	
if not gb_scada then 
	ddw_tipo_incidencia_t.SetFilter("tip_incidencia <>"+string(fgci_incidencia_scada))
	ddw_tipo_incidencia_t.Filter()
end if 


//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
of_filtro_tipo_inc_ext()
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
//ddw_tipo_incidencia_t.SetTransObject(SQLCA)
//ddw_tipo_incidencia_t.Retrieve()
//ddw_tipo_incidencia_t.setsort("tip_aviso A")
//ddw_tipo_incidencia_t.sort()
//
//  la linea de abajo es la que da el problema !!! //////////////////////////////


This.GetChild("ai_alcance",ddw_tension_incid_t)
ddw_tension_incid_t.SetTransObject(SQLCA)
ddw_tension_incid_t.Retrieve()

//
// A partir de ahora tendremos la posiblidad de ver las incidencias para todos los 
// niveles de tension, y se controlaran los permisos del usuario para cada nivel
// sobre cada incidencia particular GSE 15/01/2001
//
//
//	if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_ALTA")= 1 and  &
//			gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_MEDIA")= 1 and  &
//			gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_BAJA")= 1  THEN
//						ls_filtro= "tip_tension >= " + string (fgci_todos)
						li_tension=fgci_todos
//		ELSE
//			setnull(ls_filtro)
//			IF gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_ALTA")= 1  THEN
//			   ls_filtro= "tip_tension = " + string ( fgci_alta_tension)
//				li_tension= fgci_alta_tension
//			end if
//			IF 	gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_MEDIA")= 1 then 
//				if isnull( ls_filtro) then 
//								 ls_filtro= "tip_tension = " + string ( fgci_media_tension)
//				else
//							 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_media_tension)
//				end if
//								li_tension= fgci_media_tension
//			end if
//			
//			if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_BAJA")= 1  THEN
//				if isnull( ls_filtro) then 
//				 ls_filtro= "tip_tension = " + string ( fgci_baja_tension)
//				else
//						 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_baja_tension)	
//    			end if
//				 				li_tension= fgci_baja_tension
//			end if
//			
//			if isnull( ls_filtro) then // SI NO HAY NADA CHEQUEADO SALE ALUMBRADO PUBLICO
//				ls_filtro= "tip_tension > " + string ( fgci_baja_tension)
//				li_tension= 4
//			end if
//			
//	end if
//
//
//ddw_tension_incid_t.setfilter(ls_filtro) 
//ii=ddw_tension_incid_t.filter() 
//
//______DSA INI 08/05/2000			Filtro del Alcance de Incidencias

ls_filtro = 'codigo in '+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_imprevista)
this.GetChild("ai_suministro",ddw_child_alcance)
ddw_child_alcance.SetTransObject (SQLCA)
ddw_child_alcance.SetFilter(ls_filtro)
ddw_child_alcance.SetSort("codigo A")
ddw_child_alcance.Retrieve('IN_A')
ddw_child_alcance.Filter()
ddw_child_alcance.Sort()
This.SetItem(1, 'ai_suministro', fgci_incidencia_con_interrupcion)

ls_filtro = 'codigo in '+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_programada)
this.GetChild("ai_suministro_programada",ddw_child_alcance)
ddw_child_alcance.SetTransObject (SQLCA)
ddw_child_alcance.SetFilter(ls_filtro)
ddw_child_alcance.SetSort("codigo A")
ddw_child_alcance.Retrieve('IN_A')
ddw_child_alcance.Filter()
ddw_child_alcance.Sort()
//______DSA FIN 08/05/2000			

return li_tension

//this.GetChild("ai_alcance",ddw_tension_incidencia_t)
//ddw_tension_incidencia_t.SetTransObject(SQLCA)
//ddw_tension_incidencia_t.Retrieve()
//ddw_tension_incidencia_t.setsort("co_alcance A")
//ddw_tension_incidencia_t.sort()
//
//
//
end function

public function string fnu_nro_incid_desde_hasta ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_duracion
// 
// Objetivo:  Carga el campo duraci$$HEX1$$f300$$ENDHEX$$n seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metro recibido.
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
// 12/06/2000  IV 
//
///////////////////////////////////////////////////////
string ls_nro_incid_desde, ls_nro_incid_hasta


If getitemnumber(1,"nro_incid_desde") > 0 then
		ls_nro_incid_desde = "(SGD_INCIDENCIA.NRO_INCIDENCIA >=  "+ string(getitemnumber(1,"nro_incid_desde")) + " )"
else
		ls_nro_incid_desde = ""
end if


If getitemnumber(1,"nro_incid_hasta") > 0 then
		ls_nro_incid_hasta = " AND (SGD_INCIDENCIA.NRO_INCIDENCIA <=  "+ string(getitemnumber(1,"nro_incid_hasta")) + " )"
else
		ls_nro_incid_hasta = ""
end if



is_nro_desde_hasta = ls_nro_incid_desde + ls_nro_incid_hasta

return is_nro_desde_hasta
end function

public function integer fnu_cargar_dddw_historico ();///////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
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
int li_tension
int ii
string ls_filtro
datawindowchild ddw_child_alcance;

ib_filtro_hist = True

this.GetChild("ai_estado",ddw_estado_incidencia_t)
ddw_estado_incidencia_t.SetTransObject(SQLCA)
// se traen los estados para:
// 	- Tipo de Incidencia = Todos
// 	- Alcance = Todos			(LFE)
ddw_estado_incidencia_t.retrieve('E_OP')


//ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)

ls_filtro= "codigo = "+ string(fgci_incidencia_resuelta) + " OR codigo = " + string(fgci_estado_anulado) + " OR codigo = " + string(fgci_todos)

//if gb_mantenimiento = false then
//	ls_filtro = "codigo < 7 or codigo > 9"
//else
//	ls_filtro = "codigo <> 9"
//end if
//
ddw_estado_incidencia_t.SetFilter(ls_filtro)
ddw_estado_incidencia_t.filter()
ddw_estado_incidencia_t.SetSort("Codigo A")
ddw_estado_incidencia_t.Sort()

//ddw_estado_incidencia_T.SetTransObject(SQLCA)
//ddw_estado_incidencia_t.Retrieve()

//ddw_estado_incidencia_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
//ddw_estado_incidencia_t.filter()



this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)


//ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
//ddw_estado_mantenimiento_t.Retrieve()
////ddw_estado_mantenimiento_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
////ddw_estado_mantenimiento_t.filter()
//


this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
ii=ddw_tipo_incidencia_t_shared.sharedata(ddw_tipo_incidencia_t)
ddw_tipo_incidencia_t.SetSort("codigo A")// DSA 08/05/2000	
ddw_tipo_incidencia_t.Sort()// DSA 08/05/2000	

//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
of_filtro_tipo_inc_ext()
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
//ddw_tipo_incidencia_t.SetTransObject(SQLCA)
//ddw_tipo_incidencia_t.Retrieve()
//ddw_tipo_incidencia_t.setsort("tip_aviso A")
//ddw_tipo_incidencia_t.sort()
//
//  la linea de abajo es la que da el problema !!! //////////////////////////////


This.GetChild("ai_alcance",ddw_tension_incid_t)
ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)


	if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_HIST","ACC_ALTA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"INC_HIST","ACC_MEDIA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"INC_HIST","ACC_BAJA")= 1  THEN
			ls_filtro= "tip_tension >= " + string (fgci_alta_tension) + " or  tip_tension = "+ string (fgci_todos) 
			li_tension=fgci_media_tension
		ELSE
			setnull(ls_filtro)
			IF gu_perfiles.of_acceso_perfil(gi_perfil,"INC_HIST","ACC_ALTA")= 1  THEN
			   ls_filtro= "tip_tension = " + string ( fgci_alta_tension)
				li_tension= fgci_alta_tension
			end if
			IF 	gu_perfiles.of_acceso_perfil(gi_perfil,"INC_HIST","ACC_MEDIA")= 1 then 
				if isnull( ls_filtro) then 
								 ls_filtro= "tip_tension = " + string ( fgci_media_tension)
				else
							 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_media_tension)
				end if
								li_tension= fgci_media_tension
			end if
			
			if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_HIST","ACC_BAJA")= 1  THEN
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

//______DSA INI 08/05/2000			Filtro del Alcance de Incidencias
ls_filtro = 'codigo in '+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_imprevista)
this.GetChild("ai_suministro",ddw_child_alcance)
ddw_child_alcance.SetTransObject (SQLCA)
ddw_child_alcance.SetFilter(ls_filtro)
ddw_child_alcance.SetSort("codigo A")
ddw_child_alcance.Retrieve('IN_A')
ddw_child_alcance.Filter()
ddw_child_alcance.Sort()
//This.SetItem(1, 'ai_suministro', fgci_incidencia_de_instalacion)

ls_filtro = 'codigo in '+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_programada)
this.GetChild("ai_suministro_programada",ddw_child_alcance)
ddw_child_alcance.SetTransObject (SQLCA)
ddw_child_alcance.SetFilter(ls_filtro)
ddw_child_alcance.SetSort("codigo A")
ddw_child_alcance.Retrieve('IN_A')
ddw_child_alcance.Filter()
ddw_child_alcance.Sort()
//______DSA FIN 08/05/2000			

return li_tension

//this.GetChild("ai_alcance",ddw_tension_incidencia_t)
//ddw_tension_incidencia_t.SetTransObject(SQLCA)
//ddw_tension_incidencia_t.Retrieve()
//ddw_tension_incidencia_t.setsort("co_alcance A")
//ddw_tension_incidencia_t.sort()
//
//
//
end function

public function integer fnu_cargar_dddw_consulta ();///////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
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
int li_tension
int ii
string ls_filtro
datawindowchild ddw_child_alcance;


this.GetChild("ai_estado",ddw_estado_incidencia_t)
ddw_estado_incidencia_t.SetTransObject(SQLCA)
// se traen los estados para:
// 	- Tipo de Incidencia = Todos
// 	- Alcance = Todos			(LFE)
ddw_estado_incidencia_t.retrieve('E_OP')


//ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)
ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_todos,fgci_todos,gb_mantenimiento,gb_openbdi)

//if gb_mantenimiento = false then
//	ls_filtro = "codigo < 7 or codigo > 9"
//else
//	ls_filtro = "codigo <> 9"
//end if
//
ddw_estado_incidencia_t.SetFilter(ls_filtro)
ddw_estado_incidencia_t.filter()
ddw_estado_incidencia_t.SetSort("Codigo A")
ddw_estado_incidencia_t.Sort()

//ddw_estado_incidencia_T.SetTransObject(SQLCA)
//ddw_estado_incidencia_t.Retrieve()

//ddw_estado_incidencia_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
//ddw_estado_incidencia_t.filter()



this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)


//ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
//ddw_estado_mantenimiento_t.Retrieve()
////ddw_estado_mantenimiento_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
////ddw_estado_mantenimiento_t.filter()
//


this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
ii=ddw_tipo_incidencia_t_shared.sharedata(ddw_tipo_incidencia_t)
ddw_tipo_incidencia_t.SetSort("codigo A")// DSA 08/05/2000	
ddw_tipo_incidencia_t.Sort()// DSA 08/05/2000	
if not gb_scada then 
	ddw_tipo_incidencia_t.SetFilter("tip_incidencia <>"+string(fgci_incidencia_scada))
	ddw_tipo_incidencia_t.Filter()
end if 


//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
of_filtro_tipo_inc_ext()
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
//ddw_tipo_incidencia_t.SetTransObject(SQLCA)
//ddw_tipo_incidencia_t.Retrieve()
//ddw_tipo_incidencia_t.setsort("tip_aviso A")
//ddw_tipo_incidencia_t.sort()
//
//  la linea de abajo es la que da el problema !!! //////////////////////////////


This.GetChild("ai_alcance",ddw_tension_incid_t)
ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)


	if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_ALTA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_MEDIA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_BAJA")= 1  THEN
			// no permito que se vea la opcion <todos>
						ls_filtro= "tip_tension >= " + string (fgci_alta_tension)
						li_tension=fgci_alta_tension
		ELSE
			setnull(ls_filtro)
			IF gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_ALTA")= 1  THEN
			   ls_filtro= "tip_tension = " + string ( fgci_alta_tension)
				li_tension= fgci_alta_tension
			end if
			IF 	gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_MEDIA")= 1 then 
				if isnull( ls_filtro) then 
								 ls_filtro= "tip_tension = " + string ( fgci_media_tension)
				else
							 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_media_tension)
				end if
								li_tension= fgci_media_tension
			end if
			
			if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","ACC_BAJA")= 1  THEN
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
ls_filtro = 'codigo in '+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_imprevista)
//______DSA INI 08/05/2000			Filtro del Alcance de Incidencias
this.GetChild("ai_suministro",ddw_child_alcance)
ddw_child_alcance.SetTransObject (SQLCA)
ddw_child_alcance.SetFilter(ls_filtro)
ddw_child_alcance.SetSort("codigo A")
ddw_child_alcance.Retrieve('IN_A')
ddw_child_alcance.Filter()
ddw_child_alcance.Sort()
This.SetItem(1, 'ai_suministro', fgci_incidencia_con_interrupcion)

ls_filtro = 'codigo in '+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_programada)
this.GetChild("ai_suministro_programada",ddw_child_alcance)
ddw_child_alcance.SetTransObject (SQLCA)
ddw_child_alcance.SetFilter(ls_filtro)
ddw_child_alcance.SetSort("codigo A")
ddw_child_alcance.Retrieve('IN_A')
ddw_child_alcance.Filter()
ddw_child_alcance.Sort()
//______DSA FIN 08/05/2000			

return li_tension

//this.GetChild("ai_alcance",ddw_tension_incidencia_t)
//ddw_tension_incidencia_t.SetTransObject(SQLCA)
//ddw_tension_incidencia_t.Retrieve()
//ddw_tension_incidencia_t.setsort("co_alcance A")
//ddw_tension_incidencia_t.sort()
//
//
//
end function

public function string fnu_obten_alcance_tipo_incidencia (integer pi_tipo_incidencia);string ls_tipos




CHOOSE CASE pi_tipo_incidencia
CASE fgci_todos
	ls_tipos = "("+string(fgci_todos)+")"
CASE fgci_incidencia_imprevista
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_de_suministro)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)
	IF gb_scada THEN
		ls_tipos = ls_tipos + ","+string(fgci_incidencia_reenganche)+")"
	ELSE
		ls_tipos = ls_tipos + ")"
	END IF
CASE fgci_incidencia_programada
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)+")"
CASE fgci_incidencia_calidad
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_de_suministro)+","+string(fgci_incidencia_de_instalacion)+")"

END CHOOSE
return ls_tipos
end function

public function string fnu_obten_estado_incidencia (integer pi_tipo_incidencia, integer pi_alcance, boolean pb_mantenimiento, boolean pb_openbdi);string ls_tipos


CHOOSE CASE pi_tipo_incidencia
CASE fgci_todos

	ls_tipos = string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
	+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
	+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_en_reposicion)+","+string(fgci_estado_anulado) + &
	 "," + string(fgci_incidencia_pte_explotacion )


   if pb_mantenimiento then  // SE PUEDE ENVIAR A MANTENIMIENTO
				ls_tipos = ls_tipos+","+string(fgci_incidencia_cerrada)+","+string(fgci_incidencia_env_mto)
	end if 			
	if pb_openbdi then 
			ls_tipos = ls_tipos+","+string(fgci_incidencia_pte_explotacion)
	end if
	ls_tipos ="("+ls_tipos+")"

//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
CASE fgci_incidencia_alum_pub
		ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
		+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
		+string(fgci_hasta_serv_repuesto)+","+string(fgci_estado_anulado)+")"
	
CASE fgci_incidencia_obligada
		ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
		+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
		+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_en_reposicion)+","+string(fgci_estado_anulado)+")"
//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

CASE fgci_incidencia_imprevista
	
		CHOOSE CASE pi_alcance
				
		CASE fgci_incidencia_de_suministro
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_estado_anulado)+")"
				
		CASE fgci_incidencia_con_interrupcion, fgci_todos
			if pb_mantenimiento then  // SE PUEDE ENVIAR A MANTENIMIENTO
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_incidencia_en_reposicion)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_cerrada)+","+string(fgci_incidencia_env_mto)&
				+","+string(fgci_estado_anulado)+")"
				
			else 
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_en_reposicion)+","+string(fgci_estado_anulado)+")"

			end if
			
			
		CASE fgci_incidencia_sin_interrupcion
			
			if pb_mantenimiento then  // SE PUEDE ENVIAR A MANTENIMIENTO
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_cerrada)+","+string(fgci_incidencia_env_mto)&
				+","+string(fgci_estado_anulado)+")"
				
			else 
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_estado_anulado)+")"

			end if
			
			
			
			
	END CHOOSE

CASE fgci_incidencia_programada
	
		CHOOSE CASE pi_alcance
				
	
		CASE fgci_incidencia_con_interrupcion, fgci_todos
			
			if pb_openbdi then 
				ls_tipos = "("+string(fgci_todos)+","&
				+string(fgci_incidencia_pendiente)+","+string(fgci_incidencia_pte_explotacion)+","+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_en_reposicion)&
				+","+string(fgci_estado_anulado)+ ")"
		
			else
				ls_tipos = "("+string(fgci_todos)+","&
				+string(fgci_incidencia_pendiente)+","+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_en_reposicion)&
				+","+string(fgci_estado_anulado)+ ","+string(fgci_incidencia_pte_explotacion)+")"
			end if
			
		CASE fgci_incidencia_sin_interrupcion

			if pb_openbdi then 
				ls_tipos = "("+string(fgci_todos)+","&
				+string(fgci_incidencia_pendiente)+","+string(fgci_incidencia_pte_explotacion)+","+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_estado_anulado)+")"
		
			else
				ls_tipos = "("+string(fgci_todos)+","&
				+string(fgci_incidencia_pendiente)+","+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_estado_anulado)+")"
			end if

			
	
			
	END CHOOSE
	
	CASE fgci_incidencia_calidad
		
			IF pb_mantenimiento THEN
				ls_tipos = "("+string(fgci_todos)+","&
						+string(fgci_incidencia_pendiente)+","+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
						+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_cerrada)+","&
						+string(fgci_incidencia_env_mto)+","+string(fgci_estado_anulado)+")"
			ELSE
				ls_tipos = "("+string(fgci_todos)+","&
				+string(fgci_incidencia_pendiente)+","+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_estado_anulado)+")"
				
			END IF	


CASE fgci_incidencia_scada
	
	
		CHOOSE CASE pi_alcance
				
				
		CASE fgci_incidencia_con_interrupcion, fgci_todos
			if pb_mantenimiento then  // SE PUEDE ENVIAR A MANTENIMIENTO
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_incidencia_en_reposicion)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_cerrada)+","+string(fgci_incidencia_env_mto)+")"
				
			else 
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_en_reposicion)+")"

			end if
			
			
		CASE fgci_incidencia_sin_interrupcion
			
			if pb_mantenimiento then  // SE PUEDE ENVIAR A MANTENIMIENTO
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+","+string(fgci_incidencia_cerrada)+","+string(fgci_incidencia_env_mto)+")"
				
			else 
				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_enviado_brigada)+","+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+")"

			end if
			
		CASE fgci_incidencia_reenganche
			

				ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_pendiente)+","&
				+string(fgci_incidencia_servicio_repuesto)+","&
				+string(fgci_hasta_serv_repuesto)+")"
		
			
			
	END CHOOSE

END CHOOSE

	
	
return ls_tipos


end function

public subroutine of_filtro_tipo_inc_ext ();//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not fg_verifica_parametro('nuevos_tip_inc') /*Or &
	fg_verifica_parametro('not_nuevos_tip_inc')*/ Then

	If Not gb_scada Then
		fg_filtro_ext(This, "not_nuevos_tip_inc_consulta_scada", "ai_tipo")
	Else
		fg_filtro_ext(This, "not_nuevos_tip_inc_consulta", "ai_tipo")
	End If
End If
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public function string fnu_nro_incid_desde_hasta_reenganche ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_duracion
// 
// Objetivo:  Carga el campo duraci$$HEX1$$f300$$ENDHEX$$n seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metro recibido.
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
// 12/06/2000  IV 
//
///////////////////////////////////////////////////////
string ls_nro_incid_desde, ls_nro_incid_hasta


If getitemnumber(1,"nro_incid_desde") > 0 then
		ls_nro_incid_desde = "(SGD_REENGANCHES.NRO_INCIDENCIA >=  "+ string(getitemnumber(1,"nro_incid_desde")) + " )"
else
		ls_nro_incid_desde = ""
end if


If getitemnumber(1,"nro_incid_hasta") > 0 then
		ls_nro_incid_hasta = " AND (SGD_REENGANCHES.NRO_INCIDENCIA <=  "+ string(getitemnumber(1,"nro_incid_hasta")) + " )"
else
		ls_nro_incid_hasta = ""
end if



is_nro_desde_hasta = ls_nro_incid_desde + ls_nro_incid_hasta

return is_nro_desde_hasta
end function

event itemchanged;datawindowchild ddw_child_alcance
string ls_filtro, ls_filtro2

This.SetRedraw(False)
if row > 0 then
	
// Pone en blanco el filtro de estado, y si entra por reenganche lo quita.
	
//	this.setitem(1, 'ai_estado', fgci_todos)  			
//	this.Modify('ai_estado.Protect = 0')
//	this.Modify('ai_estado.Background.Color = ' + gs_blanco)	
CHOOSE CASE dwo.name

	CASE 'ai_tipo'

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
		//***************************************
		//**  OSGI 2001.1  	19/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		this.Modify('ai_estado.Protect = 0')
		this.Modify('ai_estado.Background.Color = ' + gs_blanco)	
		this.Modify('ai_estado_mant.Protect = 1')
	  	this.Modify('ai_estado_mant.Background.Color = ' + gs_gris)	  
	   	this.setitem(1, 'ai_estado_mant', fgci_todos)	
		  
		this.Modify('operacion.Protect = 0')
		this.Modify('operacion.Background.Color = ' + gs_blanco)
		this.Modify('ai_duracion.Protect = 0')
		this.Modify('ai_duracion.Background.Color = ' + gs_blanco)
		this.Modify('tiempo.Protect = 0')
		this.Modify('tiempo.Background.Color = ' + gs_blanco)	  
  
		this.GetChild("ai_estado",ddw_estado_incidencia_t)
		ddw_estado_incidencia_t.SetTransObject(SQLCA)
	 	ddw_estado_incidencia_t.reset()
		if long(data) = fgci_todos	then
			This.Modify('ai_suministro.Protect = 1')
	  		This.Modify('ai_suministro.Background.Color = ' + gs_gris)	  
		
			This.Modify('ai_suministro_programada.Protect = 1')
	  		This.Modify('ai_suministro_programada.Background.Color = ' + gs_gris)	  			
			
			// se traen los estados para:
			// 	- Tipo de Incidencia = Todos
			// 	- Alcance = Todos			(LFE)
			
		 	ddw_estado_incidencia_t.retrieve('E_OP')
			ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_todos,fgci_todos,gb_mantenimiento,gb_openbdi)
			//ls_filtro = "codigo < " + string(fgci_incidencia_cerrada) + &
			//			   " OR codigo = "+ string(fgci_hasta_serv_repuesto)
			//		
			
		elseif long(data) = fgci_incidencia_programada	then
			this.Modify('ai_suministro.visible = 0')			
			this.Modify('ai_suministro_programada.visible = 1')			 

			// se traen los estados para:
			// 	- Tipo de Incidencia = Programada
			// 	- Alcance = Todos			(LFE)
			ddw_estado_incidencia_t.retrieve('E_OP')
			this.setitem(row, 'ai_estado', fgci_todos)		
			ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_programada,fgci_todos,gb_mantenimiento,gb_openbdi)
			
			//ls_filtro = "(codigo < " + string(fgci_incidencia_cerrada) + &
			//				" AND codigo <> " + string(fgci_incidencia_pendiente) + ")" + &
			//				" OR codigo = " + string(fgci_hasta_serv_repuesto)
		

		//***************************************
		//**  OSGI 2001.1  	19/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		ElseIf Long(data) = fgci_incidencia_obligada Or Long(data) = fgci_incidencia_alum_pub Then
			This.Modify('ai_suministro.Protect = 1')
			This.Modify('ai_suministro.Background.Color = ' + gs_gris)	  
			This.Modify('ai_suministro_programada.Protect = 1')
			This.Modify('ai_suministro_programada.Background.Color = ' + gs_gris)	  

			If long(data) = fgci_incidencia_alum_pub Then
				This.SetItem(1,"ai_alcance", fgci_todos)
				This.Modify('ai_alcance.Protect = 1')
				This.Modify('ai_alcance.Background.Color = ' + gs_gris)
			End If			

			// se traen los estados para:
			// 	- Tipo de Incidencia = Obligada o Alumbrado P$$HEX1$$fa00$$ENDHEX$$blico
			// 	- Alcance = Todos			(LFE)
			ddw_estado_incidencia_t.retrieve('E_OP')
			This.Setitem(row, 'ai_estado', fgci_todos)
			ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(Long(data), fgci_todos, False, gb_openbdi)
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
			
			// Se comprueba el tipo de Incidencia para traer los estados
			IF long(data) = fgci_incidencia_imprevista	then
			 	// se traen los estados para:
				// 	- Tipo de Incidencia = Imprevista
				// 	- Alcance = Todos			(LFE)
				ddw_estado_incidencia_t.retrieve('E_OP')
				ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_imprevista,fgci_todos,gb_mantenimiento,gb_openbdi)
				//ls_filtro = "codigo < " + string(fgci_incidencia_cerrada) + &
				//			   " OR codigo = "+ string(fgci_hasta_serv_repuesto)
				ddw_alcance_t.retrieve('IN_A')
				ls_filtro2 = "codigo in "+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_imprevista)
				//ls_filtro2 = "codigo = "+ string(fgci_todos) + " or codigo= "+string(fgci_incidencia_de_suministro) +&
				//				" or codigo= "+string(fgci_incidencia_con_interrupcion) +" or codigo= "+string(fgci_incidencia_sin_interrupcion)

			ELSEIF long(data) = fgci_incidencia_calidad then // El tipo de incidencia es de calidad
			   ddw_estado_incidencia_t.retrieve('E_OP')
				ddw_alcance_t.retrieve('IN_A')
				ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_calidad,fgci_todos,gb_mantenimiento,gb_openbdi)
				//ls_filtro = "(codigo < " + string(fgci_incidencia_cerrada) + &
				//				" AND codigo <> " + string(fgci_incidencia_en_reposicion) + ")" + &
				//				" OR codigo = "+ string(fgci_hasta_serv_repuesto)
				ls_filtro2 = "codigo in "+ fnu_obten_alcance_tipo_incidencia(fgci_incidencia_calidad)								
				//ls_filtro2 = "codigo = "+ string(fgci_todos) + " or codigo= "+string(fgci_incidencia_de_suministro) +&
				//				" or codigo= "+string(fgci_incidencia_de_instalacion)
				
			END IF
			
		END IF			

		ddw_alcance_t.SetFilter(ls_filtro2)
		ddw_alcance_t.SetSort("codigo A")
		ddw_alcance_t.filter()
		ddw_alcance_t.Sort()
		
		ddw_estado_incidencia_t.SetFilter(ls_filtro)
		ddw_estado_incidencia_t.SetSort("codigo A")
		ddw_estado_incidencia_t.filter()
		ddw_estado_incidencia_t.Sort()
		
		this.setitem(row, 'ai_estado', fgci_hasta_para_resolucion)
		this.setitem(1,"ai_suministro",fgci_todos)	
		
	CASE 'ai_suministro_programada' 

		// Se ha modificado el alcance para las incidencias programadas
		this.Modify('ai_estado_mant.Protect = 1')
	  	this.Modify('ai_estado_mant.Background.Color = ' + gs_gris)	  
 	   this.setitem(1, 'ai_estado_mant', fgci_todos)
		  
		this.GetChild("ai_estado",ddw_estado_incidencia_t)
  		ddw_estado_incidencia_t.SetTransObject(SQLCA)
 		ddw_estado_incidencia_t.reset()	
		 
		IF	long(data) = fgci_todos	THEN
			// se traen los estados para:
			// 	- Tipo de Incidencia = Programada
			// 	- Alcance = Todos			(LFE)
			ddw_estado_incidencia_t.retrieve('E_OP')
			ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_programada,fgci_todos,gb_mantenimiento,gb_openbdi)
			//ls_filtro = "(codigo < " + string(fgci_incidencia_cerrada) + &
			//				" AND codigo <> " + string(fgci_incidencia_pendiente) +")" + &
			//				" OR codigo = " + string(fgci_hasta_serv_repuesto)					
		ELSEIF long(data) = fgci_incidencia_con_interrupcion THEN
			// se traen los estados para:
			// 	- Tipo de Incidencia = Programada
			// 	- Alcance = Con Interrupciones			(LFE)
			 ddw_estado_incidencia_t.retrieve('E_OP')
			ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_programada,fgci_incidencia_con_interrupcion,gb_mantenimiento,gb_openbdi)	
		   //ls_filtro = "(codigo < " + string(fgci_incidencia_cerrada) + &
			//			 	 " AND codigo <> " + string(fgci_incidencia_pendiente) + ")" + &
			//				 " OR codigo = " + string(fgci_hasta_serv_repuesto)		 	
		ELSEIF long(data) = fgci_incidencia_sin_interrupcion THEN
			// se traen los estados para:
			// 	- Tipo de Incidencia = Programada
			// 	- Alcance = Sin Interrupciones			(LFE)
			ddw_estado_incidencia_t.retrieve('E_OP')
			ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_programada,fgci_incidencia_sin_interrupcion,gb_mantenimiento,gb_openbdi)	
			//ls_filtro = "(codigo < " + string(fgci_incidencia_cerrada) + &
			//				" AND codigo <> " + string(fgci_incidencia_en_reposicion) + &
			//				" and codigo <> " + string(fgci_incidencia_pendiente) + ")" +&
			//				" OR codigo = " + string(fgci_hasta_serv_repuesto)
  		END IF

		ddw_estado_incidencia_t.SetFilter(ls_filtro)
		ddw_estado_incidencia_t.SetSort("codigo A")
		ddw_estado_incidencia_t.filter()
		ddw_estado_incidencia_t.Sort()
		
		this.setitem(row, 'ai_estado', fgci_hasta_para_resolucion)
	
	CASE 'ai_suministro' 
		IF This.GetItemNumber(row, 'ai_tipo') = fgci_incidencia_imprevista THEN
			this.Modify('ai_estado.Protect = 0')
			this.Modify('ai_estado.Background.Color = ' + gs_blanco)	
			
			// Se ha modificado el alcance para las incidencias imprevistas
			this.GetChild("ai_estado",ddw_estado_incidencia_t)
			ddw_estado_incidencia_t.SetTransObject(SQLCA)
			ddw_estado_incidencia_t.reset()
 
			IF long(data) = fgci_todos THEN
				// se traen los estados para:
				// 	- Tipo de Incidencia = Imprevista
				// 	- Alcance = Todos			(LFE)
				ddw_estado_incidencia_t.retrieve('E_OP')
				ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_imprevista,fgci_todos,false,gb_openbdi)	
				//ls_filtro = "codigo < " + string(fgci_incidencia_cerrada) + &
				//			   " OR codigo = "+ string(fgci_hasta_serv_repuesto)
			
				this.setitem(row, 'ai_estado', fgci_todos)
//				this.Modify('ai_estado.Protect = 0')
//				this.Modify('ai_estado.Background.Color = ' + gs_blanco)	
				this.Modify('ai_estado_mant.Protect = 1')
				this.Modify('ai_estado_mant.Background.Color = ' + gs_gris)
				this.setitem(1, 'ai_estado_mant', fgci_todos)
				this.Modify('operacion.Protect = 0')
				this.Modify('operacion.Background.Color = ' + gs_blanco)
				this.Modify('ai_duracion.Protect = 0')
				this.Modify('ai_duracion.Background.Color = ' + gs_blanco)
				this.Modify('tiempo.Protect = 0')
				this.Modify('tiempo.Background.Color = ' + gs_blanco)	  
							  
			ELSEIF long(data) = fgci_incidencia_con_interrupcion THEN
				this.Modify('ai_estado_mant.Protect = 0')
				this.Modify('ai_estado_mant.Background.Color = ' + gs_blanco)
				this.setitem(1, 'ai_estado_mant', fgci_todos)  
				
				// se traen los estados para:
				// 	- Tipo de Incidencia = Imprevista
				// 	- Alcance = Con Interrupcion			(LFE)
				ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_imprevista,fgci_incidencia_con_interrupcion,gb_mantenimiento,gb_openbdi)	
				// if gb_mantenimiento = false then
				//		ls_filtro = "codigo < " + string(fgci_incidencia_cerrada) + &
				//			   " OR codigo = "+ string(fgci_hasta_serv_repuesto)
				//	else
				//		ls_filtro = "codigo <> 9"
				//	end if
				 	
				ddw_estado_incidencia_t.retrieve('E_OP')
				ddw_estado_incidencia_t.SetFilter(ls_filtro)
				ddw_estado_incidencia_t.SetSort("codigo A")
				ddw_estado_incidencia_t.filter()
				ddw_estado_incidencia_t.Sort()
				this.Modify('operacion.Protect = 0')
				this.Modify('operacion.Background.Color = ' + gs_blanco)
				this.Modify('ai_duracion.Protect = 0')
				this.Modify('ai_duracion.Background.Color = ' + gs_blanco)
				this.Modify('tiempo.Protect = 0')
				this.Modify('tiempo.Background.Color = ' + gs_blanco)	  				
		   ELSEIF long(data) = fgci_incidencia_sin_interrupcion THEN
				this.Modify('ai_estado_mant.Protect = 0')
				this.Modify('ai_estado_mant.Background.Color = ' + gs_blanco)
				this.setitem(1, 'ai_estado_mant', fgci_todos)  
				
				// se traen los estados para:
				// 	- Tipo de Incidencia = Imprevista
				// 	- Alcance = Sin Interrupcion			(LFE)
				ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_imprevista,fgci_incidencia_sin_interrupcion,gb_mantenimiento,gb_openbdi)	
				// if gb_mantenimiento = false then
				//		ls_filtro = "(codigo < " + string(fgci_incidencia_cerrada) + &
				//		" AND codigo <> " + string(fgci_incidencia_en_reposicion) + ")" + &
				//			   " OR codigo = "+ string(fgci_hasta_serv_repuesto)
				//	else
				//		ls_filtro = "codigo <> 9" + " AND codigo <> " + string(fgci_incidencia_en_reposicion)  
				//	end if
				 	
				ddw_estado_incidencia_t.retrieve('E_OP')
				ddw_estado_incidencia_t.SetFilter(ls_filtro)
				ddw_estado_incidencia_t.SetSort("codigo A")
				ddw_estado_incidencia_t.filter()
				ddw_estado_incidencia_t.Sort()
				this.Modify('operacion.Protect = 0')
				this.Modify('operacion.Background.Color = ' + gs_blanco)
				this.Modify('ai_duracion.Protect = 0')
				this.Modify('ai_duracion.Background.Color = ' + gs_blanco)
				this.Modify('tiempo.Protect = 0')
				this.Modify('tiempo.Background.Color = ' + gs_blanco)	  	
	
		   ELSEIF long(data) = fgci_incidencia_de_suministro THEN
				// se traen los estados para:
				// 	- Tipo de Incidencia = Imprevista
				// 	- Alcance = De Suministro			(LFE)
				ddw_estado_incidencia_t.retrieve('E_OP')
				ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_imprevista,fgci_incidencia_de_suministro,gb_mantenimiento,gb_openbdi)	
				//ls_filtro = "(codigo < 6 AND codigo <> 3) or codigo > 9"
				ddw_estado_incidencia_t.SetFilter(ls_filtro)
				ddw_estado_incidencia_t.SetSort("codigo A")
				ddw_estado_incidencia_t.filter()
				ddw_estado_incidencia_t.Sort()
		 
				this.Modify('ai_estado_mant.Protect = 1')
				this.Modify('ai_estado_mant.Background.Color = ' + gs_gris)
				this.setitem(1, 'ai_estado_mant', fgci_todos)

				this.Modify('operacion.Protect = 0')
				this.Modify('operacion.Background.Color = ' + gs_blanco)
				this.Modify('ai_duracion.Protect = 0')
				this.Modify('ai_duracion.Background.Color = ' + gs_blanco)
				this.Modify('tiempo.Protect = 0')
				this.Modify('tiempo.Background.Color = ' + gs_blanco)	  				
				
	
		   ELSEIF long(data) = fgci_incidencia_reenganche  THEN
				
				ddw_estado_incidencia_t.retrieve('E_OP')
				
				// PACHO REENGANCHES
				
				this.setitem(1, 'ai_estado_mant', fgci_todos)			
				this.Modify('ai_estado_mant.Protect = 1')
				this.Modify('ai_estado_mant.Background.Color = ' + gs_gris)
	
				this.setitem(1, 'ai_estado', fgci_todos)  			
				this.Modify('ai_estado.Protect = 1')
				this.Modify('ai_estado.Background.Color = ' + gs_gris)
				
				this.Modify('operacion.Protect = 1')
				this.Modify('operacion.Background.Color = ' + gs_gris)
				this.Modify('ai_duracion.Protect = 1')
				this.Modify('ai_duracion.Background.Color = ' + gs_gris)
				this.Modify('tiempo.Protect = 1')
				this.Modify('tiempo.Background.Color = ' + gs_gris)
				  
		   END IF
			
			ddw_estado_incidencia_t.SetFilter(ls_filtro)
			ddw_estado_incidencia_t.filter()
			ddw_estado_incidencia_t.SetSort("codigo A")
			ddw_estado_incidencia_t.Sort()
			
			if long(data) <> fgci_incidencia_reenganche then
				this.setitem(row, 'ai_estado', fgci_hasta_para_resolucion)
			end if

		ELSEIF this.GetItemNumber(row, 'ai_tipo') = fgci_incidencia_calidad THEN
			// Se ha modificado el alcance para las incidencias de calidad
			this.GetChild("ai_estado",ddw_estado_incidencia_t)
			ddw_estado_incidencia_t.SetTransObject(SQLCA)
			ddw_estado_incidencia_t.reset()	
			ddw_estado_incidencia_t.retrieve('E_OP')
			ls_filtro= "codigo in "+ fnu_obten_estado_incidencia(fgci_incidencia_calidad,0,gb_mantenimiento,gb_openbdi)			
			//ls_filtro = "(codigo < " + string(fgci_incidencia_cerrada) + &
			//						" AND codigo <> " + string(fgci_incidencia_en_reposicion) + ")" + &
			//						" OR codigo = "+ string(fgci_hasta_serv_repuesto)
									
			ddw_estado_incidencia_t.SetFilter(ls_filtro)
			ddw_estado_incidencia_t.SetSort("codigo A")
			ddw_estado_incidencia_t.filter()
			ddw_estado_incidencia_t.Sort()

			this.setitem(row, 'ai_estado', fgci_hasta_para_resolucion)
			IF gb_mantenimiento = FALSE OR long(data) <> fgci_incidencia_de_instalacion THEN
				this.Modify('ai_estado_mant.Protect = 1')
				this.Modify('ai_estado_mant.Background.Color = ' + gs_gris)	
				this.setitem(1, 'ai_estado_mant', fgci_todos)
			ELSE
				this.Modify('ai_estado_mant.Protect = 0')
				this.Modify('ai_estado_mant.Background.Color = ' + gs_blanco)	
			END IF
		END IF

	END CHOOSE
END IF
This.SetRedraw(TRUE)
end event

on u_inc_2030_pr_filtro_incidencia.create
end on

on u_inc_2030_pr_filtro_incidencia.destroy
end on


HA$PBExportHeader$u_desc_7101_pr_filtro_descargos.sru
forward
global type u_desc_7101_pr_filtro_descargos from datawindow
end type
end forward

global type u_desc_7101_pr_filtro_descargos from datawindow
int Width=1737
int Height=780
string DataObject="d_desc_7101_filtro_descargos"
end type
global u_desc_7101_pr_filtro_descargos u_desc_7101_pr_filtro_descargos

type variables
string is_estado = " "
string is_estado_mant = " "
string is_tipo = " "
string is_alcance = " "
string is_suministro = " "
string is_linea = " "
string is_interrupcion =" "
string is_estado_descargo
string is_nro_desde_hasta
datawindowchild ddw_tipo_aviso
datawindowchild ddw_estado_incidencia_t
datawindowchild ddw_estado_mantenimiento_t
datawindowchild ddw_tipo_incidencia_t
datawindowchild ddw_tension_incid_t
datawindowchild ddw_estado_descargo_t
datawindowchild ddw_interrup_descargo_t

// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

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
datawindowchild dddw_estado_descargos

s_incidencia is_incidencia



end variables

forward prototypes
public subroutine fnu_cargo_alimentacion (integer pi_valor)
public subroutine fnu_cargar_estado (integer pi_valor)
public subroutine fnu_cargar_tipo (integer pi_valor)
public subroutine fnu_cargar_alcance (integer pi_valor)
public subroutine fnu_cargar_duracion (integer pi_valor)
public subroutine fpr_habilitar_campos (string ps_accion)
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
public function string fnu_filtrar_descargos ()
public function integer fnu_cargar_dddw ()
public function integer fnu_cargar_dddw_historico ()
public function integer fnu_cargar_dddw_consulta ()
public function string fnu_filtro_nro_descargo ()
public function string fnu_filtro_nro_descargo_hist ()
public function string fnu_filtrar_descargos_hist ()
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




this.setitem(1,"ai_estado_descargo",pi_valor)
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

CHOOSE CASE ps_accion
	CASE "Consulta"
		if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","")> 1 then 
				
  					this.Modify("ai_alimentacion.background.color=" + gs_blanco    +&
			        "~t ai_estado.background.color="    + gs_blanco    +&
			        "~t ai_tipo.background.color="      + gs_blanco	  +&
					  "~t ai_alcance.background.color="  + gs_blanco	  +&
					  "~t ai_duracion.background.color="      + gs_blanco)				
							
					this.SetTabOrder("ai_Alimentacion",10)
					this.SetTabOrder("ai_Estado",20)
					this.SetTabOrder("estado_descargo",30)
					this.SetTabOrder("ai_alcance",40)
					this.SetTabOrder("ai_duracion",50)
		end if

			
		
	CASE ELSE
//		<statementblock>
END CHOOSE

end subroutine

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
	p_dw.modify("ai_estado_descargo.protected=0")
	p_dw.modify("ai_alcance.protected=0")
	p_dw.modify("ai_suministro.protected=0")
	p_dw.modify("ai_duracion.protected=0")

//Cambio de color de fondo los campos segun esten habilitados o no
	p_dw.modify("ai_estado.bacground.color="+gs_blanco)
	p_dw.modify("ai_estado_mant.bacground.color="+gs_gris)
	p_dw.modify("ai_estado_descargo.bacground.color="+gs_blanco)
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
p_dw.setitem(1,"ai_estado_descargo",fgci_todos)							//todos
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
	p_dw.modify("ai_estado_descargo.protected=0")
	p_dw.modify("ai_alcance.protected=0")
	p_dw.modify("ai_suministro.protected=0")
	p_dw.modify("ai_duracion.protected=0")

//Cambio de color de fondo los campos segun esten habilitados o no
	p_dw.modify("ai_estado.bacground.color="+gs_blanco)
	p_dw.modify("ai_estado_mant.bacground.color="+gs_gris)
	p_dw.modify("ai_estado_descargo.bacground.color="+gs_blanco)
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
	p_dw.modify("ai_estado_descargo.protected=0")
	p_dw.modify("ai_alcance.protected=0")
	p_dw.modify("ai_suministro.protected=0")
	p_dw.modify("ai_duracion.protected=0")

//Cambio de color de fondo los campos segun esten habilitados o no
	p_dw.modify("ai_estado.bacground.color="+gs_blanco)
	p_dw.modify("ai_estado_mant.bacground.color="+gs_gris)
	p_dw.modify("ai_estado_descargo.bacground.color="+gs_blanco)
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
p_dw.setitem(1,"ai_estado_descargo",fgci_todos)							//todos
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
p_dw.setitem(1,"ai_estado_descargo",fgci_todos)							//todos
p_dw.setitem(1,"ai_alcance",fgci_todos)						//todos
p_dw.setitem(1,"ai_suministro",fgci_todos)					//todos
p_dw.setitem(1,"ai_duracion",fgci_todos)	
return 1
end function

public function string fnu_filtrar_descargos ();
/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_filtrar_descargos
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


// inicializo variables

   is_estado_descargo = "" 
	is_estado = " "
	is_estado_mant = " "
	is_tipo = " "
	is_alcance = " "
	is_suministro = " "
	is_linea = " "

//" ~"SGD_DESCARGOS~".~"NRO_CENTRO~" > " 

//Anterior si falla descomentar estas lineas
//IF getitemnumber(1,"ai_estado_descargo") < fgci_descargo_activado THEN
//	is_estado_descargo = " ~"SGD_DESCARGOS~".~"ESTADO~" = " + string(fgci_descargo_solicitado)


//evaluo estado descago
//IF getitemnumber(1,"ai_estado_descargo") < 12 THEN //fgci_descargo_activado THEN
	is_estado_descargo = " ~"SGD_DESCARGOS~".~"ESTADO~" = " + string(getitemnumber(1,"ai_estado_descargo"))

// Evaluo la tension
	if getitemnumber(1,"ai_alcance") <> fgci_todos then
		is_suministro =  " ~"SGD_INSTALACION~".~"TENSION~" = "+ string(getitemnumber(1,"ai_alcance")) 
	else
		is_suministro = " "
	end if 




//ELSE
//	// Evaluo el estado descargo
//		if getitemnumber(1,"ai_estado_descago") <> fgci_todos then
//			is_estado = " ~"SGD_DESCARGOS~".~"ESTADO~" = " +STRING(getitemnumber(1,"ai_estado_descargo")) 
//  		else
//			is_estado = " ~"SGD_DESCARGOS~".~"ESTADO~"  > " + string(fgci_todos) 
//
//		end if
//
//	
//	// Evaluo el estado incidencia
//		if getitemnumber(1,"ai_estado") <> fgci_todos then
//			if getitemnumber(1,"ai_estado") =  fgci_hasta_sr then 
//				is_estado = " ~"GI_INCIDENCIA~".~"EST_ACTUAL~" >= " + string(fgci_incidencia_pendiente) +" AND  ~"GI_INCIDENCIA~".~"EST_ACTUAL~" <=  "+string(fgci_incidencia_servicio_repuesto)
//			else
//				is_estado = " ~"GI_INCIDENCIA~".~"EST_ACTUAL~" =  "+ string(getitemnumber(1,"ai_estado"))   
//			end if
//		else
//			is_estado = "( ~"GI_INCIDENCIA~".~"EST_ACTUAL~" >= 0 )"
//		end if
//
//	// Evaluo el estado de mantenimiento  
//
//		if getitemnumber(1,"ai_estado_mant") <> fgci_todos then
//			if getitemnumber(1,"ai_estado_mant") =  fgci_hasta_para_resolucion then 
//				is_estado = " ~"GI_INCIDENCIA~".~"ESTADO_MANTENIMIENTO~" >= " + string(fgci_incidencia_mant_sin_atender) +" AND  ~"GI_INCIDENCIA~".~"ESTADO_MANTENIMIENTO~" <=  "+string(fgci_incidencia_mant_para_resolucion) +" OR ~"GI_INCIDENCIA~".~"ESTADO_MANTENIMIENTO~" is null "
//			else
//				is_estado_mant = " ~"GI_INCIDENCIA~".~"ESTADO_MANTENIMIENTO~" =  "+ string(getitemnumber(1,"ai_estado_mant")) 
//			end if
//		else
//			is_estado_mant = " "
//		end if
//
//	// Evaluo el tipo 
//		is_tipo =  " ~"GI_INCIDENCIA~".~"TIP_INCIDENCIA~" =  "+ string(fgci_incidencia_programada) 
//	
//	
//	// Evaluo el alcance
//		if getitemnumber(1,"ai_alcance") <> fgci_todos then
//			is_alcance =  " ~"SGD_INSTALACION~".~"TENSION~" = "+ string(getitemnumber(1,"ai_alcance"))
//		else
//			is_alcance = " "
//		end if 
//
//	// Evaluo el suministro
//	if getitemnumber(1,"ai_suministro") <> fgci_todos then
//		is_suministro =  " ~"GI_INCIDENCIA~".~"IND_SUMINISTRO~" = "+ string(getitemnumber(1,"ai_suministro")) 
//	else
//		is_suministro = " "
//	end if 
//
//END IF

// Formo la clausula  definitiva

	is_linea = is_estado_descargo 
	
	if is_estado <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND " + is_estado 
		else
			is_linea = is_estado
		end if
	end if


//	if is_estado_mant <> " " then
//		if is_linea <> " " then
//			is_linea = is_linea + " AND " + is_estado_mant
//		else
//			is_linea = is_estado_mant
//		end if
//	end if
//
//	if is_tipo <> " " then
//		if is_linea <> " " then
//			is_linea = is_linea + " AND  " + is_tipo 
//		else
//			is_linea = is_tipo
//		end if
//	end if
//
//	if is_alcance <> " " then
//		if is_linea <> " " then
//			is_linea = is_linea + " AND  " + is_alcance 
//		else
//			is_linea = is_alcance
//		end if
//	end if	
//
//
//
//	if is_suministro <> " " then
//		if is_linea <> " " then
//			is_linea = is_linea + " AND  " + is_suministro
//		else
//			is_linea = is_suministro
//		end if
//	end if	
//	
return is_linea
end function

public function integer fnu_cargar_dddw ();/////////////////////////////////////////////////////////////////////
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
string ls_filtro
int li_tension
int ii
this.GetChild("ai_estado",ddw_estado_incidencia_t)
ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)


this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)


This.GetChild("ai_alcance",ddw_tension_incid_t)
ddw_tension_incid_t.SetTransObject(SQLCA)
ddw_tension_incid_t.retrieve()

//______DSA INI 03/04/2000			
This.GetChild("ai_interrup",ddw_interrup_descargo_t)

ddw_interrup_descargo_t.SetTransObject(SQLCA)
ddw_interrup_descargo_t.retrieve('DE_I')
//______DSA FIN 03/04/2000			

//	if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_ALTA")= 1 and  &
//			gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_MEDIA")= 1 and  &
//			gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_BAJA")= 1  THEN
//						ls_filtro= "tip_tension >= " + string (fgci_todos)
						li_tension=fgci_todos
//		ELSE
//			setnull(ls_filtro)
//			IF gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_ALTA")= 1  THEN
//			   ls_filtro= "tip_tension = " + string ( fgci_alta_tension)
//				li_tension= fgci_alta_tension
//			end if
//			IF 	gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_MEDIA")= 1 then 
//				if isnull( ls_filtro) then 
//								 ls_filtro= "tip_tension = " + string ( fgci_media_tension)
//				else
//							 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_media_tension)
//				end if
//								li_tension= fgci_media_tension
//			end if
//			
//			if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_BAJA")= 1  THEN
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
//ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)

This.GetChild("ai_estado_descargo",ddw_estado_descargo_t)
ii=ddw_estados_descargo_t_shared.sharedata(ddw_estado_descargo_t)
return li_tension
end function

public function integer fnu_cargar_dddw_historico ();/////////////////////////////////////////////////////////////////////
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
string ls_filtro
int li_tension
int ii
this.GetChild("ai_estado",ddw_estado_incidencia_t)
ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)


this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)


This.GetChild("ai_alcance",ddw_tension_incid_t)
ddw_tension_incid_t.SetTransObject(SQLCA)
ddw_tension_incid_t.retrieve()

//______DSA INI 03/04/2000			
This.GetChild("ai_interrup",ddw_interrup_descargo_t)
ddw_interrup_descargo_t.SetTransObject(SQLCA)
ddw_interrup_descargo_t.retrieve('DE_I')
//______DSA FIN 03/04/2000			

	if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_HIST","ACC_ALTA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"DES_HIST","ACC_MEDIA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"DES_HIST","ACC_BAJA")= 1  THEN
			//no dejo que aparezca el estado todos
						ls_filtro= "tip_tension >= " + string (fgci_alta_tension)
						li_tension=fgci_media_tension
		ELSE
			setnull(ls_filtro)
			IF gu_perfiles.of_acceso_perfil(gi_perfil,"DES_HIST","ACC_ALTA")= 1  THEN
			   ls_filtro= "tip_tension = " + string ( fgci_alta_tension)
				li_tension= fgci_alta_tension
			end if
			IF 	gu_perfiles.of_acceso_perfil(gi_perfil,"DES_HIST","ACC_MEDIA")= 1 then 
				if isnull( ls_filtro) then 
								 ls_filtro= "tip_tension = " + string ( fgci_media_tension)
				else
							 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_media_tension)
				end if
								li_tension= fgci_media_tension
			end if
			
			if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_HIST","ACC_BAJA")= 1  THEN
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
ls_filtro = ls_filtro + " tip_tension = " + string(fgci_todos)
ddw_tension_incid_t.setfilter(ls_filtro) 
ii=ddw_tension_incid_t.filter() 

//ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)

This.GetChild("ai_estado_descargo",ddw_estado_descargo_t)
ddw_estado_descargo_t.SetTransObject(SQLCA)
ddw_estado_descargo_t.Retrieve(fgci_descargo_asociado_bdi)

ls_filtro = 'CODIGO= 8 OR CODIGO =13'
ddw_estado_descargo_t.setfilter(ls_filtro)
ddW_estado_descargo_t.filter()
//ii=ddw_estados_descargo_t_shared.sharedata(ddw_estado_descargo_t)
return li_tension
end function

public function integer fnu_cargar_dddw_consulta ();/////////////////////////////////////////////////////////////////////
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
string ls_filtro
int li_tension
int ii
//this.GetChild("ai_estado",ddw_estado_incidencia_t)
//ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)
//

this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
//ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)
ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
ddw_estado_mantenimiento_t.retrieve()

This.GetChild("ai_alcance",ddw_tension_incid_t)
ddw_tension_incid_t.SetTransObject(SQLCA)
ddw_tension_incid_t.retrieve()

//______DSA INI 03/04/2000			
This.GetChild("ai_interrup",ddw_interrup_descargo_t)
ddw_interrup_descargo_t.SetTransObject(SQLCA)
ddw_interrup_descargo_t.retrieve('DE_I')
//______DSA FIN 03/04/2000			

	if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_ALTA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_MEDIA")= 1 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_BAJA")= 1  THEN
			//no dejo que aparezca el estado todos
						ls_filtro= "tip_tension >= " + string (fgci_alta_tension)
						li_tension=fgci_media_tension
		ELSE
			setnull(ls_filtro)
			IF gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_ALTA")= 1  THEN
			   ls_filtro= "tip_tension = " + string ( fgci_alta_tension)
				li_tension= fgci_alta_tension
			end if
			IF 	gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_MEDIA")= 1 then 
				if isnull( ls_filtro) then 
								 ls_filtro= "tip_tension = " + string ( fgci_media_tension)
				else
							 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_media_tension)
				end if
								li_tension= fgci_media_tension
			end if
			
			if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ACCESO","ACC_BAJA")= 1  THEN
				if isnull( ls_filtro) then 
				 ls_filtro= "tip_tension = " + string ( fgci_baja_tension)
				else
						 ls_filtro=ls_filtro + " or  tip_tension = " + string ( fgci_baja_tension)	
    			end if
				 				li_tension= fgci_baja_tension
			end if
			
			if isnull( ls_filtro) then // SI NO HAY NADA CHEQUEADO EN PERFILES SALE ALUMBRADO PUBLICO
				ls_filtro= "tip_tension > " + string ( fgci_baja_tension)
				li_tension= 4
			end if
			
	end if
ls_filtro = ls_filtro + " tip_tension = " + string(fgci_todos)
ddw_tension_incid_t.setfilter(ls_filtro) 
ii=ddw_tension_incid_t.filter() 

//ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)

This.GetChild("ai_estado_descargo",ddw_estado_descargo_t)
ddw_estado_descargo_t.SetTransObject(SQLCA)
ddw_estado_descargo_t.Retrieve(fgci_descargo_aplazado)

ddw_estado_descargo_t.setfilter ('CODIGO <> ' + string(fgci_descargo_finalizado))
ddw_estado_descargo_t.filter()
//ii=ddw_estados_descargo_t_shared.sharedata(ddw_estado_descargo_t)
return li_tension
end function

public function string fnu_filtro_nro_descargo ();/////////////////////////////////////////////////////////////////////
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


If getitemnumber(1,"nro_desc_desde") > 0 then
		ls_nro_incid_desde = "(SGD_DESCARGOS.NRO_DESCARGO >=  "+ string(getitemnumber(1,"nro_desc_desde")) + " )"
else
		ls_nro_incid_desde = ""
end if


If getitemnumber(1,"nro_desc_hasta") > 0 then
		ls_nro_incid_hasta = " AND (SGD_DESCARGOS.NRO_DESCARGO <=  "+ string(getitemnumber(1,"nro_desc_hasta")) + " )"
else
		ls_nro_incid_hasta = ""
end if



is_nro_desde_hasta = ls_nro_incid_desde + ls_nro_incid_hasta

return is_nro_desde_hasta
end function

public function string fnu_filtro_nro_descargo_hist ();/////////////////////////////////////////////////////////////////////
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


If getitemnumber(1,"nro_desc_desde") > 0 then
		ls_nro_incid_desde = "(DESCARGOS_HIST.NRO_DESCARGO >=  "+ string(getitemnumber(1,"nro_desc_desde")) + " )"
else
		ls_nro_incid_desde = ""
end if

 
If getitemnumber(1,"nro_desc_hasta") > 0 then
	IF ls_nro_incid_desde <> "" THEN
		ls_nro_incid_hasta = " AND (DESCARGOS_HIST.NRO_DESCARGO <=  "+ string(getitemnumber(1,"nro_desc_hasta")) + " )"
	ELSE
		ls_nro_incid_hasta = " (DESCARGOS_HIST.NRO_DESCARGO <=  "+ string(getitemnumber(1,"nro_desc_hasta")) + " )"		
	END IF
else
		ls_nro_incid_hasta = ""
end if



is_nro_desde_hasta = ls_nro_incid_desde + ls_nro_incid_hasta

return is_nro_desde_hasta
end function

public function string fnu_filtrar_descargos_hist ();
/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_filtrar_descargos
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

int li_interrup
// inicializo variables

   is_estado_descargo = "" 
	is_suministro = " "
	is_linea = " "
	is_interrupcion = " "

//evaluo estado descago
	is_estado_descargo = " DESCARGOS_HIST.ESTADO = " + string(getitemnumber(1,"ai_estado_descargo"))

// Evaluo la tension
	if getitemnumber(1,"ai_alcance") <> fgci_todos then
		is_suministro =  " DESCARGOS_HIST.TENSION = "+ string(getitemnumber(1,"ai_alcance")) 
	else
		is_suministro = " "
	end if 


//Evaluo si es con perdida o sin perdida
// 1 con interrupcion
// 2 sin interrupcion
// 0 Todos
// Por defecto si no se ha marcado nada en el checkbox es con interrupcion
   li_interrup = getitemnumber(1,"ai_interrup")
   if li_interrup = 0 THEN
		is_interrupcion = " NVL(DESCARGOS_HIST.IND_INTERRUPCION,1) > " + string(li_interrup)
   else
      is_interrupcion = " NVL(DESCARGOS_HIST.IND_INTERRUPCION,1) = " + string(li_interrup)
   end if
// Formo la clausula  definitiva

	is_linea = is_estado_descargo 
	
	if is_suministro <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND " + is_suministro
		else
			is_linea = is_suministro
		end if
	end if

	if is_interrupcion <> " " then
		if is_linea <> " " then
			is_linea = is_linea + " AND " + is_interrupcion
		else
			is_linea = is_interrupcion
		end if
	end if


return is_linea
end function


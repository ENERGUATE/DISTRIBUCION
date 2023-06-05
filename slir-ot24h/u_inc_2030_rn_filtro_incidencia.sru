HA$PBExportHeader$u_inc_2030_rn_filtro_incidencia.sru
forward
global type u_inc_2030_rn_filtro_incidencia from nonvisualobject
end type
end forward

global type u_inc_2030_rn_filtro_incidencia from nonvisualobject
end type
global u_inc_2030_rn_filtro_incidencia u_inc_2030_rn_filtro_incidencia

forward prototypes
public function integer frn_hab_ai_alcance (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_ai_duracion (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_ai_estado (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_ai_estado_mant (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_ai_reg_seleccionados (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_ai_suministro (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_ai_tipo (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_ini_ai_reg_seleccionados (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_ini_ai_estado (ref datawindow pd_dw, integer pi_estado, string ps_accion_llamada)
public function integer frn_ini_ai_tipo (ref datawindow pd_dw, integer pi_tipo, string ps_accion_llamada)
public function integer frn_ini_ai_duracion (ref datawindow pd_dw, integer pi_duracion, string ps_accion_llamada)
public function integer frn_ini_ai_alcance (ref datawindow pd_dw, integer pi_tension, string ps_accion_llamada)
public function integer frn_ini_ai_estado_mant (ref datawindow pd_dw, integer pi_estado_mant, string ps_accion_llamada)
public function integer frn_ini_ai_suministro (ref datawindow pd_dw, integer pi_suministro, string ps_accion_llamada)
end prototypes

public function integer frn_hab_ai_alcance (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_alcance
//
// Objetivo: Habilita campo alcance seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.Modify("ai_alcance.Color="+String(65536*128))		//color del texto

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
			pd_dw.modify("ai_alcance.protect=0") 	//habilitado
			pd_dw.Modify("ai_alcance.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1	

	CASE "Consulta"

			pd_dw.modify("ai_alcance.protect=0") 	//habilitado
			pd_dw.Modify("ai_alcance.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1	

	CASE "Actualizacion"

			pd_dw.modify("ai_alcance.protect=0") 	//habilitado
			pd_dw.Modify("ai_alcance.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1	

END CHOOSE

return 1
end function

public function integer frn_hab_ai_duracion (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_duraci$$HEX1$$f300$$ENDHEX$$n 
//
// Objetivo: Habilita campo duraci$$HEX1$$f300$$ENDHEX$$n sobre un perfil seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.Modify("ai_duracion.Color="+String(65536*128))		//color del texto

// DSA INI 09/08/2000
CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 

			pd_dw.object.ai_duracion.protect=1
			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1

	CASE "Consulta"
			pd_dw.object.ai_duracion.protect=0
			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		
			RETURN 1		

	CASE "Actualizacion"
		
			pd_dw.object.ai_duracion.protect=0
			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		
			RETURN 1

END CHOOSE
return 1

//CHOOSE CASE ps_accion_llamada
//	CASE "Seleccion" 
//
//			pd_dw.modify("ai_duracion=1") 	//habilitado
//			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//
//	CASE "Consulta"
//				//perfil de los usuarios de operaciones
//		gi_perfil_ok={fgci_perfil_oper_alta_media, &
//						  fgci_perfil_oper_baja,&
//						  fgci_perfil_oper_consulta,&
//						  fgci_perfil_oper_encargado_turno,&
//						  fgci_perfil_oper_gerente,&
//						  fgci_perfil_oper_mante_red,&
//						  0}
//
//		IF fgnu_tiene_perfil(0) THEN
//
//			pd_dw.modify("ai_duracion=0") 	//habilitado
//			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//
//		ELSE
//		
//			pd_dw.modify("ai_duracion=1") 	//habilitado
//			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//
//		END IF
//
//	CASE "Actualizacion"
//		//-------------------------OPERACIONES----------------------
//			//perfil de los usuarios de operaciones
//		gi_perfil_ok={fgci_perfil_oper_alta_media, &
//						  fgci_perfil_oper_baja,&
//						  fgci_perfil_oper_consulta,&
//						  fgci_perfil_oper_encargado_turno,&
//						  fgci_perfil_oper_gerente,&
//						  fgci_perfil_oper_mante_red,&
//						  0}
//		IF fgnu_tiene_perfil(0) THEN
//
//			pd_dw.modify("ai_duracion=0") 	//habilitado
//			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//		
//		ELSE
//
//			pd_dw.modify("ai_duracion=1") 	//habilitado
//			pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//		END IF
//
//
//END CHOOSE
//
//return 1
// DSA FIN 09/08/2000
end function

public function integer frn_hab_ai_estado (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_estado
//
// Objetivo: Habilita campo estado seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.Modify("ai_estado.Color="+String(65536*128))		//color del texto
		
CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 

			pd_dw.modify("ai_estado.Protect=0") 	//habilitado
			pd_dw.Modify("ai_estado.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1

	CASE "Consulta"

			pd_dw.modify("ai_estado.Protect=0") 	//habilitado
			pd_dw.Modify("ai_estado.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1

	CASE "Actualizacion"
		
			pd_dw.modify("ai_estado.Protect=0") 	//habilitado
			pd_dw.Modify("ai_estado.BackGround.Color="+gs_gris)		//habilitado	
			RETURN 1
		


END CHOOSE


return 1
end function

public function integer frn_hab_ai_estado_mant (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_estado_mant
//
// Objetivo: Habilita campo estado mantenimiento seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.Modify("ai_estado_mant.Color="+String(65536*128))		//color del texto
	
CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
			
			pd_dw.modify("ai_estado_mant.Protect=0") 	//habilitado
			pd_dw.Modify("ai_estado_mant.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1
	
	CASE "Consulta"

			pd_dw.modify("ai_estado_mant.Protect=1") 	
			pd_dw.Modify("ai_estado_mant.BackGround.Color="+gs_gris)		
			RETURN 1

	CASE "Actualizacion"

			pd_dw.modify("ai_estado_mant.Protect=0") 	//habilitado
			pd_dw.Modify("ai_estado_mant.BackGround.Color="+gs_gris)		//habilitado
			RETURN 1

END CHOOSE

return 1

//CHOOSE CASE ps_accion_llamada
//	CASE "Seleccion" 
//			
//			pd_dw.modify("ai_estado_mant.Protect=0") 	//habilitado
//			pd_dw.Modify("ai_estado_mant.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//	
//	CASE "Consulta"
//
//			//perfil de los usuarios de telegestiones		
//		gi_perfil_ok = {fgci_perfil_tele_telefonista,&
//							fgci_perfil_tele_encargado_turno,&
//							fgci_perfil_tele_consulta,&
//							fgci_perfil_tele_gerente,&
//							0}
//		IF fgnu_tiene_perfil(0) THEN
//	
//			pd_dw.modify("ai_estado_mant.Protect=1") 	//NO habilitado
//			pd_dw.Modify("ai_estado_mant.BackGround.Color="+gs_gris)		//NO habilitado
//			RETURN 1
//		
//		ELSE
//	
//			pd_dw.modify("ai_estado_mant.Protect=0") 	//habilitado
//			pd_dw.Modify("ai_estado_mant.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//
//		END IF
//
//
//	CASE "Actualizacion"
//
//			pd_dw.modify("ai_estado_mant.Protect=0") 	//habilitado
//			pd_dw.Modify("ai_estado_mant.BackGround.Color="+gs_gris)		//habilitado
//			RETURN 1
//
//END CHOOSE
//
//return 1
end function

public function integer frn_hab_ai_reg_seleccionados (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_reg_seleccionados
//
// Objetivo: Habilita o Deshabilita seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada los registros
//	          seleccionados.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		//-------------------------OPERACIONES----------------------
		//-------------------------MANTENIMIENTO----------------------
		//-------------------------TELEGESTIONES----------------------
			pd_dw.Modify("ai_reg_seleccionados.Color="+String(65536*128))		//color del texto

			pd_dw.Modify("ai_reg_seleccionados.Protect=1") //NO habilitado
			pd_dw.Modify("ai_reg_seleccionados.BackGround.Color="+gs_gris)		//NO habilitado
			RETURN 1


	CASE "Consulta"
		//-------------------------OPERACIONES----------------------
		//-------------------------MANTENIMIENTO----------------------
		//-------------------------TELEGESTIONES----------------------

			pd_dw.Modify("ai_reg_seleccionados.Color="+String(65536*128))		//color del texto

			pd_dw.Modify("ai_reg_seleccionados.Protect=1") //NO habilitado
			pd_dw.Modify("ai_reg_seleccionados.BackGround.Color="+gs_gris)		//NO habilitado
			RETURN 1

	CASE "Actualizacion"
		//-------------------------OPERACIONES----------------------
		//-------------------------MANTENIMIENTO----------------------
		//-------------------------TELEGESTIONES----------------------

			pd_dw.Modify("ai_reg_seleccionados.Color="+String(65536*128))		//color del texto

			pd_dw.Modify("ai_reg_seleccionados.Protect=1") //NO habilitado
			pd_dw.Modify("ai_reg_seleccionados.BackGround.Color="+gs_gris)		//NO habilitado
			RETURN 1
	END CHOOSE

RETURN 1
end function

public function integer frn_hab_ai_suministro (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_suministro
//
// Objetivo: Habilita o deshabilita campo suministro seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
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

pd_dw.Modify("ai_suministro.Color="+String(65536*128))		//color del texto

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 

			pd_dw.Modify("ai_suministro.Protect=1")		// NO habilitado
			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado

	CASE "Consulta"
			pd_dw.Modify("ai_suministro.Protect=0")		//habilitado
			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado	

	CASE "Actualizacion"
		
			pd_dw.Modify("ai_suministro.Protect=0")		//habilitado
			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado


END CHOOSE

return 1
//
//CHOOSE CASE ps_accion_llamada
//	CASE "Seleccion" 
//
//			pd_dw.Modify("ai_suministro.Protect=1")		// NO habilitado
//			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado
//
//	CASE "Consulta"
//gi_perfil_ok= {fgci_perfil_oper_encargado_turno,&
//					fgci_perfil_oper_consulta,&
//					fgci_perfil_oper_gerente,&
//					fgci_perfil_oper_alta_media,&
//					fgci_perfil_oper_mante_red,&
//					fgci_perfil_oper_baja,0}
//		IF fgnu_tiene_perfil(0) THEN
//
//
//			pd_dw.Modify("ai_suministro.Protect=0")		//habilitado
//			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado	
//		ELSE
//			pd_dw.Modify("ai_suministro.Protect=1")		// NO habilitado
//			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado
//
//
//		END IF
//		
//	CASE "Actualizacion"
//			//perfil de usuario de mantenimiento
//		gi_perfil_ok = {fgci_perfil_mante_encargado_turno,&
//							 fgci_perfil_mante_consulta,&
//							 fgci_perfil_mante_gerente,&
//							 fgci_perfil_mante_operador_alta,&
//							 fgci_perfil_mante_operador_baja,0}
//		IF fgnu_tiene_perfil(0) THEN
//
//			pd_dw.Modify("ai_suministro.Protect=1")		// NO habilitado
//			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado
//
//		ELSE
//		
//			pd_dw.Modify("ai_suministro.Protect=0")		//habilitado
//			pd_dw.Modify("ai_suministro.BackGround.Color="+gs_gris)		//habilitado
//		END IF
//
//END CHOOSE
//
//return 1
end function

public function integer frn_hab_ai_tipo (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_tipo
//
// Objetivo: Habilita o Deshabilita campo tipo seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.Modify("ai_tipo.Color="+String(65536*128))		//color del texto


CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 

		pd_dw.Modify("ai_tipo.Protect=0")		//habilitado
		pd_dw.Modify("ai_tipo.BackGround.Color="+gs_gris)		//habilitado

	CASE "Consulta"

	
				pd_dw.Modify("ai_tipo.Protect=1")		//habilitado
				pd_dw.Modify("ai_tipo.BackGround.Color="+gs_gris) //habilitado

	CASE "Actualizacion"
// DSA INI 09/08/2000		
//perfil de usuario de mantenimiento
//		gi_perfil_ok = {fgci_perfil_mante_encargado_turno,&
//							fgci_perfil_mante_consulta,&
//							fgci_perfil_mante_gerente,&
//							fgci_perfil_mante_operador_alta,&
//							fgci_perfil_mante_operador_baja,&
//							fgci_perfil_mantenimiento,0}
//		IF fgnu_tiene_perfil(0)THEN
// DSA FIN 09/08/2000
				pd_dw.Modify("ai_tipo.Protect=0")		//habilitado
				pd_dw.Modify("ai_tipo.BackGround.Color="+gs_gris) //habilitado
// DSA INI 09/08/2000				
//
//		ELSE
//				pd_dw.Modify("ai_tipo.Protect=0")		//habilitado
//				pd_dw.Modify("ai_tipo.BackGround.Color="+gs_gris)		//habilitado
//
//		END IF
// DSA FIN 09/08/2000

END CHOOSE

return 1
end function

public function integer frn_ini_ai_reg_seleccionados (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_ini_ai_reg_seleccionados
//
// Objetivo: Retorna valor constante que representa registros seleccionados.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//		 Entrada: pd_dw, ps_accion_llamada
//		 Salida : --
//
// Devuelve:
//
// Fecha 	Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//
/////////////////////////////////////////////////////////////

return 1
end function

public function integer frn_ini_ai_estado (ref datawindow pd_dw, integer pi_estado, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_estado
//
// Objetivo: Inicializa campo estados seg$$HEX1$$fa00$$ENDHEX$$n la acci$$HEX1$$f300$$ENDHEX$$n llamada de menu.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_estado, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		IF IsNull(pi_estado) THEN
			pi_estado=fgci_hasta_serv_repuesto
		END IF
		pd_dw.SetItem(1,"ai_estado",pi_estado)
		RETURN 1

	CASE "Consulta"
		IF IsNull(pi_estado) THEN
			pi_estado=fgci_todos
		END IF
		pd_dw.SetItem(1,"ai_estado",pi_estado)
		RETURN 1


	CASE "Actualizacion"
		IF IsNull(pi_estado) THEN
			pi_estado=fgci_todos
		END IF
		pd_dw.SetItem(1,"ai_estado",pi_estado)
		RETURN 1

END CHOOSE

RETURN 1
end function

public function integer frn_ini_ai_tipo (ref datawindow pd_dw, integer pi_tipo, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_tipo
//
// Objetivo: Inicializa tipo seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada de menu.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_tipo, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		IF IsNull(pi_tipo) THEN
			pi_tipo=fgci_incidencia_imprevista
		END IF
		pd_dw.SetItem(1,"ai_tipo",pi_tipo)
		RETURN 1
	
	CASE "Consulta"
		IF IsNull(pi_tipo) THEN
			pi_tipo=fgci_incidencia_imprevista
		END IF
		pd_dw.SetItem(1,"ai_tipo",pi_tipo)
		RETURN 1

	CASE "Actualizacion"
		IF IsNull(pi_tipo) THEN
			pi_tipo=fgci_incidencia_imprevista
		END IF
		pd_dw.SetItem(1,"ai_tipo",pi_tipo)
		RETURN 1

END CHOOSE
	

RETURN 1

end function

public function integer frn_ini_ai_duracion (ref datawindow pd_dw, integer pi_duracion, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_duraci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Inicializa campo duraci$$HEX1$$f300$$ENDHEX$$n seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada de menu.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_duracion, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int li_duracion_nula

//SetNull(li_duracion_nula)
//
//CHOOSE CASE ps_accion_llamada
//
//	CASE "Seleccion" 
//		IF IsNull(pi_duracion) OR pi_duracion=0  THEN
//			pi_duracion=li_duracion_nula
//		END IF
//
//	CASE "Consulta"
//		IF IsNull(pi_duracion) OR pi_duracion=0 THEN
//			pi_duracion=li_duracion_nula
//		END IF
//		
//	CASE "Actualizacion"
//		IF IsNull(pi_duracion)OR pi_duracion=0 THEN
//			pi_duracion=li_duracion_nula
//		END IF
//
//END CHOOSE
//
		SetNull(pi_duracion)
		pd_dw.SetItem(1,"ai_duracion",pi_duracion)
		RETURN 1


end function

public function integer frn_ini_ai_alcance (ref datawindow pd_dw, integer pi_tension, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_alcance
//
// Objetivo: Inicializa campo alcance seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada y si tiene perfil autorizado.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_tension, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF IsNull(pi_tension) THEN
		pi_tension=fgci_todos
END IF			
pd_dw.SetItem(1,"ai_alcance",pi_tension)		
Return 1	
//CHOOSE CASE ps_accion_llamada
//	CASE "Seleccion" 
//			//si es encargado de turno
//		gi_perfil_ok = {fgci_perfil_oper_encargado_turno,0}
//		IF fgnu_tiene_perfil(0) THEN
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_todos
//			END IF
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		END IF
//			
//			//perfil de operador de alta o media tension
//		gi_perfil_ok = {fgci_perfil_oper_alta_media,0}
//		IF fgnu_tiene_perfil(0) THEN
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_media_tension
//			END IF
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		END IF
//
//			//perfil de operador de baja tensiom
//		gi_perfil_ok = {fgci_perfil_oper_baja,0}
//		IF fgnu_tiene_perfil(0) THEN
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_baja_tension
//			END IF
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		
//		ELSE
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_todos
//			END IF
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		END IF
//
//
//	CASE "Consulta"
//			//si es encargado de turno
//		gi_perfil_ok={fgci_perfil_oper_encargado_turno,&
//						fgci_perfil_mante_encargado_turno,&
//						fgci_perfil_tele_encargado_turno,0}
//		IF fgnu_tiene_perfil(0) THEN
//			
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_todos
//			END IF
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		END IF
//			
//			//perfil de operador de alta o media tension
//		gi_perfil_ok={fgci_perfil_oper_alta_media,&
//					fgci_perfil_mante_operador_alta,0}
//		IF fgnu_tiene_perfil(0)  THEN
//			
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_media_tension
//			END IF
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		END IF
//
//			//perfil de operador de baja tensiom
//		gi_perfil_ok={fgci_perfil_oper_baja,&
//							fgci_perfil_mante_operador_baja,&
//							fgci_perfil_tele_telefonista,0}
//		IF fgnu_tiene_perfil(0) THEN
//
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_baja_tension
//			END IF	
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		
//		ELSE
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_todos
//			END IF	
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		END IF
//	
//	CASE "Actualizacion"
//			//si es encargado de turno
//		gi_perfil_ok={fgci_perfil_oper_encargado_turno,&
//						fgci_perfil_mante_encargado_turno,0}
//		IF fgnu_tiene_perfil(0) THEN
//
//				IF IsNull(pi_tension) THEN
//					pi_tension=fgci_todos
//				END IF			
//				pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//				Return 1			
//		END IF
//			
//			//perfil de operador de alta o media tension
//		gi_perfil_ok={fgci_perfil_oper_alta_media,&
//						fgci_perfil_mante_operador_alta,0}
//		IF fgnu_tiene_perfil(0)  THEN
//
//				IF IsNull(pi_tension) THEN
//					pi_tension=fgci_media_tension
//				END IF
//				pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//				Return 1	
//		END IF
//
//			//perfil de operador de baja tensiom
//			gi_perfil_ok={fgci_perfil_oper_baja,&
//							fgci_perfil_mante_operador_baja,0}
//		IF fgnu_tiene_perfil(0) THEN
//
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_baja_tension
//			END IF	
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		ELSE
//			IF IsNull(pi_tension) THEN
//				pi_tension=fgci_todos
//			END IF
//			pd_dw.SetItem(1,"ai_alcance",pi_tension)		
//			Return 1
//		END IF
//
//END CHOOSE
//	pd_dw.AcceptText()
//	Return 1
end function

public function integer frn_ini_ai_estado_mant (ref datawindow pd_dw, integer pi_estado_mant, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_estado_mant
//
// Objetivo: Inicializa estado mantenimiento seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_estado_mant, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		IF IsNUll(pi_estado_mant) THEN
			pi_estado_mant=fgci_hasta_para_resolucion
		END IF

		pd_dw.SetItem(1,"ai_estado_mant",pi_estado_mant)	
		RETURN 1		

	CASE "Consulta"
		IF IsNUll(pi_estado_mant) THEN
			pi_estado_mant=fgci_todos
		END IF

		pd_dw.SetItem(1,"ai_estado_mant",pi_estado_mant)	
		RETURN 1		

	CASE "Actualizacion"
		IF IsNUll(pi_estado_mant) THEN
			pi_estado_mant=fgci_todos
		END IF

		pd_dw.SetItem(1,"ai_estado_mant",pi_estado_mant)	
		RETURN 1		


END CHOOSE

return 1
end function

public function integer frn_ini_ai_suministro (ref datawindow pd_dw, integer pi_suministro, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_suministro
//
// Objetivo: Inicializa suministro seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada de menu.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_suministro, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		IF IsNull(pi_suministro) THEN
			pi_suministro=fgci_incidencia_con_interrupcion
		END IF
			pd_dw.SetItem(1,"ai_suministro",pi_suministro)
			RETURN 1

	CASE "Consulta"
		IF IsNull(pi_suministro) THEN
			pi_suministro=fgci_incidencia_con_interrupcion
		END IF
			pd_dw.SetItem(1,"ai_suministro",pi_suministro)
			RETURN 1
		
	CASE "Actualizacion"
		IF IsNull(pi_suministro) THEN
			pi_suministro=fgci_incidencia_con_interrupcion
		END IF
			pd_dw.SetItem(1,"ai_suministro",pi_suministro)
			RETURN 1

END CHOOSE

return 1
end function

on u_inc_2030_rn_filtro_incidencia.create
TriggerEvent( this, "constructor" )
end on

on u_inc_2030_rn_filtro_incidencia.destroy
TriggerEvent( this, "destructor" )
end on


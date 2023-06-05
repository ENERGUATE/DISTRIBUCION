HA$PBExportHeader$u_cen_2001_rn_form_centro_cmd_mesa.sru
forward
global type u_cen_2001_rn_form_centro_cmd_mesa from datawindow
end type
end forward

global type u_cen_2001_rn_form_centro_cmd_mesa from datawindow
int Width=201
int Height=64
end type
global u_cen_2001_rn_form_centro_cmd_mesa u_cen_2001_rn_form_centro_cmd_mesa

forward prototypes
public function integer frn_ini_incidencia_instalacion_afectada (ref datawindow pd_ambito, integer pi_centro, integer pi_cmd, integer pi_puesto)
public function integer frn_hab_incidencia_instalacion_afectada (ref datawindow p_ambito)
public function integer frn_hab_centro_cmd_mesa (ref datawindow p_ambito, boolean pb_habilitar)
public function integer frn_hab_puesto (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_ini_centro (ref datawindow pd_dw, integer pi_centro, string ps_accion_llamada)
public function integer frn_ini_cmd (ref datawindow pd_dw, integer pi_cmd, string ps_accion_llamada)
public function integer frn_ini_puesto (ref datawindow pd_dw, integer pi_puesto, string ps_accion_llamada)
public function integer frn_hab_centro (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_cmd (ref datawindow pd_dw, string ps_accion_llamada)
end prototypes

public function integer frn_ini_incidencia_instalacion_afectada (ref datawindow pd_ambito, integer pi_centro, integer pi_cmd, integer pi_puesto);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_ini_incidencia_instalacion_afectada
// 
// Objetivo: Inicializar campos de la datawindows.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_ambito, pi_centro, pi_cmd, pi_puesto
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

pd_ambito.setitem(1,"nro_centro",pi_centro)
pd_ambito.setitem(1,"nro_cmd",pi_cmd)
pd_ambito.setitem(1,"nro_mesa",pi_puesto)
return 1

end function

public function integer frn_hab_incidencia_instalacion_afectada (ref datawindow p_ambito);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_incidencia_instalacion_afectada
// 
// Objetivo: Habilita campos en datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: p_ambito
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

p_ambito.modify("nro_centro.protect=1")
p_ambito.modify("nro_centro.background.color="+gs_gris)
p_ambito.modify("nro_cmd.protect=1")
p_ambito.modify("nro_cmd.background.color="+gs_gris)
p_ambito.modify("nro_mesa.protect=1")
p_ambito.modify("nro_mesa.background.color="+gs_gris)

return 1

end function

public function integer frn_hab_centro_cmd_mesa (ref datawindow p_ambito, boolean pb_habilitar);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_centro_cmd_mesa
// 
// Objetivo: Habilita y deshabilita campos centro, mesa y cmd en datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: p_ambito, pb_habilitar
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////
IF pb_habilitar THEN
	p_ambito.modify("nro_centro.protect=0")
	p_ambito.modify("nro_centro.background.color="+gs_blanco)
	p_ambito.modify("nro_cmd.protect=0")
	p_ambito.modify("nro_cmd.background.color="+gs_blanco)
	p_ambito.modify("nro_mesa.protect=0")
	p_ambito.modify("nro_mesa.background.color="+gs_blanco)
	
ELSE
	p_ambito.modify("nro_centro.protect=1")
	p_ambito.modify("nro_centro.background.color="+gs_gris)
	p_ambito.modify("nro_cmd.protect=1")
	p_ambito.modify("nro_cmd.background.color="+gs_gris)
	p_ambito.modify("nro_mesa.protect=1")
	p_ambito.modify("nro_mesa.background.color="+gs_gris)
END IF

return 1

end function

public function integer frn_hab_puesto (ref datawindow pd_dw, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_puesto
// 
// Objetivo: Habilita y Deshabilita campo nro_mesa de la datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////
CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		
		pd_dw.modify("nro_mesa.protect=1")
		pd_dw.modify("nro_mesa.background.color="+gs_gris)		

	CASE "Consulta"
		pd_dw.modify("nro_mesa.protect=0")
		pd_dw.modify("nro_mesa.background.color="+gs_blanco)
	
	CASE "Actualizacion"

		pd_dw.modify("nro_mesa.protect=0")
		pd_dw.modify("nro_mesa.background.color="+gs_blanco)


END CHOOSE
RETURN 1
end function

public function integer frn_ini_centro (ref datawindow pd_dw, integer pi_centro, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_ini_centro
// 
// Objetivo: Inicializa y obtiene campo centro seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, pi_centro, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

IF ISNULL(pi_centro) THEN
	pi_centro=gi_nro_centro
END IF

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 

		pd_dw.SetItem(1,"nro_centro",pi_centro)
		return 1

	CASE "Consulta"
			pd_dw.SetItem(1,"nro_centro",pi_centro)
			RETURN 1

	CASE "Actualizacion"

			pd_dw.SetItem(1,"nro_centro",pi_centro)
			RETURN 1

END CHOOSE


Return 1


//			fgnu_tiene_perfil(fgci_perfil_oper_alta_media()) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_baja()) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_consulta()) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_encargado_turno()) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_gerente()) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_mante_red()) THEN
//
end function

public function integer frn_ini_cmd (ref datawindow pd_dw, integer pi_cmd, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_ini_cmd
// 
// Objetivo: Obtiene nro_cmd seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, pi_cmd, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

IF ISNULL(pi_cmd) THEN
	pi_cmd=gi_nro_cmd

END IF

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		pd_dw.SetItem(1,"nro_cmd",pi_cmd)

	CASE "Consulta"
		pd_dw.SetItem(1,"nro_cmd",pi_cmd)

	CASE "Actualizacion"
		pd_dw.SetItem(1,"nro_cmd",pi_cmd)

END CHOOSE


Return 1
end function

public function integer frn_ini_puesto (ref datawindow pd_dw, integer pi_puesto, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_ini_puesto
// 
// Objetivo: Inicializa el nro_puesto en base al perfil del usuario.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, pi_puesto, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////
//
//IF ISNULL(pi_puesto) THEN
//	gi_perfil_ok = {fgci_perfil_tele_telefonista,&
//						fgci_perfil_tele_gerente,&
//						fgci_perfil_tele_consulta,&
//						fgci_perfil_tele_encargado_turno,0}
//	IF fgnu_tiene_perfil(0)THEN
//		pi_puesto=fgci_todos		
//	ELSE
//		pi_puesto=gi_nro_puesto
//	END IF
//END IF

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		pd_dw.SetItem(1,"nro_mesa",pi_puesto)
		
	CASE "Consulta"
		pd_dw.SetItem(1,"nro_mesa",pi_puesto)	

	CASE "Actualizacion"
		pd_dw.SetItem(1,"nro_mesa",pi_puesto)

END CHOOSE


Return 1
end function

public function integer frn_hab_centro (ref datawindow pd_dw, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_centro
// 
// Objetivo: Habilita y Deshabilita campo centro en datawindow.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

// Ya no chequea aqui el tema de los perfiles // FDO

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 

		pd_dw.modify("nro_centro.protect=1")
		pd_dw.modify("nro_centro.background.color="+gs_gris)
		
	CASE "Consulta"
		IF gs_programa_principal="w_prin" THEN
				pd_dw.modify("nro_centro.protect=1")
				pd_dw.modify("nro_centro.background.color="+gs_gris)				
		ELSE
				pd_dw.modify("nro_centro.protect=0")
				pd_dw.modify("nro_centro.background.color="+gs_blanco)				
		END IF


	CASE "Actualizacion"

		pd_dw.modify("nro_centro.protect=0")
		pd_dw.modify("nro_centro.background.color="+gs_blanco)


END CHOOSE

	
return 1
end function

public function integer frn_hab_cmd (ref datawindow pd_dw, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_hab_cmd
// 
// Objetivo: Habilita y Deshabilita campo cmd en datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

// Ya no chequea aqui el tema de los perfiles // FDO

CHOOSE CASE ps_accion_llamada
	CASE "Seleccion" 
		pd_dw.modify("nro_cmd.protect=1")
		pd_dw.modify("nro_cmd.background.color="+gs_gris)				
		
			
	CASE "Consulta"
		IF gs_programa_principal="w_prin" THEN
			pd_dw.modify("nro_cmd.protect=1")
			pd_dw.modify("nro_cmd.background.color="+gs_gris)				
		ELSE
			pd_dw.modify("nro_cmd.protect=0")
			pd_dw.modify("nro_cmd.background.color="+gs_blanco)
		END IF

	CASE "Actualizacion"

		pd_dw.modify("nro_cmd.protect=0")
		pd_dw.modify("nro_cmd.background.color="+gs_blanco)

		
END CHOOSE

return 1
end function


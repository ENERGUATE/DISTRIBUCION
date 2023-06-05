HA$PBExportHeader$u_avi_2030_rn_filtro_aviso.sru
forward
global type u_avi_2030_rn_filtro_aviso from nonvisualobject
end type
end forward

global type u_avi_2030_rn_filtro_aviso from nonvisualobject
end type
global u_avi_2030_rn_filtro_aviso u_avi_2030_rn_filtro_aviso

type variables
// constantes
//int fgci_perfil_oper_mante_red
//int fgci_todos
//int fgci_aviso_pendiente

end variables

forward prototypes
public function integer frn_hab_ai_estado (ref datawindow pd_dw)
public function integer frn_hab_ai_tipo (ref datawindow pd_dw)
public function integer frn_hab_ai_alcance (ref datawindow pd_dw)
public function integer frn_hab_ai_duracion (ref datawindow pd_dw)
public function integer frn_ini_ai_reg_seleccionados (integer pd_dw)
public function integer frn_ini_ai_alcance (ref datawindow pd_dw, integer pi_alcance)
public function integer frn_ini_ai_duracion (ref datawindow pd_dw, integer pi_duracion)
public function integer frn_ini_ai_estado (ref datawindow pd_dw, integer pi_estado)
public function integer frn_ini_ai_tipo (ref datawindow pd_dw, integer pi_tipo)
public function integer frn_hab_ai_alimentacion (ref datawindow pd_dw)
public function integer frn_ini_ai_alimentacion (ref datawindow pd_dw, integer pi_alimentacion)
end prototypes

public function integer frn_hab_ai_estado (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_hab_ai_estado
// 
// Objetivo: Habilita o Deshabilita el campo estado.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


// Merc
//pd_dw.Modify("ai_estado.Color="+String(128))		//color del texto
		
	//perfil de los usuarios de operaciones
//gi_perfil_ok[1] = fgci_perfil_oper_mante_red
//gi_perfil_ok[2] = 0
//IF fgnu_tiene_perfil(0) OR gu_comunic.is_comunic.accion_llamada = "Consulta" THEN
//	pd_dw.modify("ai_estado.protect=1") 	//NO habilitado
//	pd_dw.Modify("ai_estado.BackGround.Color="+gs_gris)		//habilitado
//
//ELSE
	pd_dw.modify("ai_estado.protect=0") 	//habilitado
	pd_dw.Modify("ai_estado.BackGround.Color="+gs_blanco)		//habilitado

//END IF


return 1
end function

public function integer frn_hab_ai_tipo (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_tipo
// 
// Objetivo: Habilita o Deshabilita el campo tipo
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

// Merc
// pd_dw.Modify("ai_tipo.Color="+String(128))		//color del texto

	//perfil de los usuarios de operaciones
//gi_perfil_ok[1] = fgci_perfil_oper_mante_red
//gi_perfil_ok[2] = 0
IF gu_perfiles.of_acceso_perfil(gi_perfil,"CAV_GENERAL","")= 1 THEN
	pd_dw.modify("ai_tipo.protect=1") 	//NO habilitado
	pd_dw.Modify("ai_tipo.BackGround.Color="+gs_gris)	//NO habilitado

ELSE
	pd_dw.modify("ai_tipo.protect=0") 	//habilitado
	pd_dw.Modify("ai_tipo.BackGround.Color="+gs_blanco)		//habilitado

END IF


return 1
end function

public function integer frn_hab_ai_alcance (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_hab_ai_alcance
// 
// Objetivo: Habilita o Deshabilita el campo alcance.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

// Merc 

// pd_dw.Modify("ai_alcance.Color="+String(128))		//color del texto

	//perfil de los usuarios de operaciones
//gi_perfil_ok[1] = fgci_perfil_oper_mante_red
//gi_perfil_ok[2] = 0

IF gu_perfiles.of_acceso_perfil(gi_perfil,"CAV_GENERAL","")= 1 THEN
	pd_dw.modify("ai_alcance.protect=1") 	// NO habilitado
	pd_dw.Modify("ai_alcance.BackGround.Color="+gs_gris)		//habilitado

ELSE
	pd_dw.modify("ai_alcance.protect=0") 	//habilitado
	pd_dw.Modify("ai_alcance.BackGround.Color="+gs_blanco)		//habilitado
			
END IF


return 1
end function

public function integer frn_hab_ai_duracion (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_hab_ai_duracion
// 
// Objetivo: Habilita o Deshabilita campo duraci$$HEX1$$f300$$ENDHEX$$n para perfil 
//           de usuarios de operaciones.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

// Merc
//pd_dw.Modify("ai_duracion.Color="+String(128))		//color del texto

	//perfil de los usuarios de operaciones
//gi_perfil_ok[1] = fgci_perfil_oper_mante_red
//gi_perfil_ok[2] = 0

IF gu_perfiles.of_acceso_perfil(gi_perfil,"CAV_GENERAL","")= 1 THEN
	pd_dw.modify("ai_duracion.protect=1") 	//NO habilitado
	pd_dw.Modify("ai_duracion.BackGround.Color="+gs_gris)		//habilitado

ELSE
	pd_dw.modify("ai_duracion.protect=0") 	//habilitado
	pd_dw.Modify("ai_duracion.BackGround.Color="+gs_blanco)		//habilitado

END IF


return 1


return 1
end function

public function integer frn_ini_ai_reg_seleccionados (integer pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_ini_ai_reg_seleccionados
// 
// Objetivo: Retorna valor constante  que representa inicializaci$$HEX1$$f300$$ENDHEX$$n
//           de registros seleccionados.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


return 1
end function

public function integer frn_ini_ai_alcance (ref datawindow pd_dw, integer pi_alcance);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_alcance
// 
// Objetivo: Setea el campo alcance
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw , pi_alcance
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


IF IsNull(pi_alcance) THEN
	pi_alcance=fgci_todos

END IF

	pd_dw.SetItem(1,"ai_alcance",pi_alcance)

return 1
end function

public function integer frn_ini_ai_duracion (ref datawindow pd_dw, integer pi_duracion);/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_ini_ai_duracion
// 
// Objetivo: Setea valor del campo duraci$$HEX1$$f300$$ENDHEX$$n
//	 	   
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_duracion
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////



IF NOT IsNull(pi_duracion) AND pi_duracion=0 THEN
	SetNull(pi_duracion)
END IF

pd_dw.SetItem(1,"ai_duracion",pi_duracion)

return 1
end function

public function integer frn_ini_ai_estado (ref datawindow pd_dw, integer pi_estado);/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_ini_ai_estado
// 
// Objetivo: Inicializa el campo estado
//	 	   
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_estado
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




IF IsNull(pi_estado) THEN
	pi_estado= fgci_aviso_pendiente
END IF

	pd_dw.SetItem(1,"ai_estado",pi_estado)			

return 1
end function

public function integer frn_ini_ai_tipo (ref datawindow pd_dw, integer pi_tipo);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_ai_tipo
// 
// Objetivo: Inicializa el campo tipo.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_tipo
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


IF IsNull(pi_tipo) THEN
	pi_tipo=fgci_todos
END IF
	pd_dw.SetItem(1,"ai_tipo",pi_tipo)

return 1
end function

public function integer frn_hab_ai_alimentacion (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ai_alimentacion
// 
// Objetivo: Habilita o Deshabilita el campo alimentaci$$HEX1$$f300$$ENDHEX$$n si tiene perfil 
//           de operador de mantenimiento de red.	
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.Modify("ai_alimentacion.color="+string(65536*128))

//gi_perfil_ok[1] = fgci_perfil_oper_mante_red
//gi_perfil_ok[2] = 0
IF gu_perfiles.of_acceso_perfil(gi_perfil,"CAV_GENERAL","")= 1 THEN
	pd_dw.Modify("ai_alimentacion.Protect=1")
ELSE
	pd_dw.Modify("ai_alimentacion.Protect=0")
END IF

Return 1
end function

public function integer frn_ini_ai_alimentacion (ref datawindow pd_dw, integer pi_alimentacion);/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_ini_ai_alimentacion
// 
// Objetivo: Setea el campo alimentaci$$HEX1$$f300$$ENDHEX$$n
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_alimentacion
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF ISNULL(pi_alimentacion) THEN
	pi_alimentacion=fgci_todos
END IF

pd_dw.SetItem(1,"ai_alimentacion",pi_alimentacion)

Return 1
end function

on constructor;//fnu_def_constantes()

end on

on u_avi_2030_rn_filtro_aviso.create
TriggerEvent( this, "constructor" )
end on

on u_avi_2030_rn_filtro_aviso.destroy
TriggerEvent( this, "destructor" )
end on


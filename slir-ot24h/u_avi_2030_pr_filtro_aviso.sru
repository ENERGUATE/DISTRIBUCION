HA$PBExportHeader$u_avi_2030_pr_filtro_aviso.sru
forward
global type u_avi_2030_pr_filtro_aviso from datawindow
end type
end forward

global type u_avi_2030_pr_filtro_aviso from datawindow
integer width = 2647
integer height = 784
string dataobject = "d_avi_2030_filtro_aviso"
end type
global u_avi_2030_pr_filtro_aviso u_avi_2030_pr_filtro_aviso

type variables
string is_alimentacion = " "
string is_estado = " "
string is_tipo = " "
string is_alcance = " "
string is_linea = " "

datawindowchild ddw_tipo_aviso, ddw_alcance_aviso, ddw_estado_aviso
// constantes
//int fgci_perfil_tele_consulta
//int fgci_perfil_tele_encargado_turno
//int fgci_perfil_tele_gerente
//int fgci_perfil_tele_telefonista
//int fgci_aviso_resuelto
//decimal fgcdec_aviso_sin_alimentacion
//int fgci_ayuda
//int fgci_alumbrado_publico
//int fgci_todos
//int fgci_aviso_pendiente
//decimal fgcdec_aviso_de_alumbrado_publico
string is_nro_desde_hasta

end variables

forward prototypes
public subroutine fnu_cargo_alimentacion (integer pi_valor)
public subroutine fnu_cargar_estado (integer pi_valor)
public subroutine fnu_cargar_tipo (integer pi_valor)
public subroutine fnu_cargar_alcance (integer pi_valor)
public subroutine fnu_cargar_duracion (integer pi_valor)
public subroutine fnu_cargar_dddw ()
public function string fnu_filtrar_avisos ()
public function string fnu_cargar_nro_aviso ()
end prototypes

public subroutine fnu_cargo_alimentacion (integer pi_valor);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_cargo_alimentaci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Carga el campo alimentaci$$HEX1$$f300$$ENDHEX$$n.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_valor
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
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_cargar_estado
// 
// Objetivo: Carga el campo estado.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_valor
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
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_tipo
// 
// Objetivo: Carga el campo tipo.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_valor
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
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_alcance
// 
// Objetivo: Setea el valor en la fila con el valor especificado.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_valor
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

public subroutine fnu_cargar_duracion (integer pi_valor);///////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_cargar_duraci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Carga el campo duraci$$HEX1$$f300$$ENDHEX$$n con el valor del par$$HEX1$$e100$$ENDHEX$$metro recibido.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_valor
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

public subroutine fnu_cargar_dddw ();/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_dddw
// 
// Objetivo: Carga la dropdown
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

this.GetChild("ai_estado",ddw_estado_aviso)
ddw_estado_aviso.SetTransObject(SQLCA)
ddw_estado_aviso.Retrieve()
ddw_estado_aviso.setfilter("est_aviso <> " + string(fgci_aviso_resuelto))
ddw_estado_Aviso.filter()

this.GetChild("ai_tipo",ddw_tipo_aviso)
ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
ddw_tipo_aviso.setsort("tip_aviso A")
ddw_tipo_aviso.sort()

this.GetChild("ai_alcance",ddw_alcance_aviso)
ddw_alcance_aviso_t_shared.shareData(ddw_alcance_aviso)
ddw_alcance_aviso.setsort("co_alcance A")
ddw_alcance_aviso.sort()


end subroutine

public function string fnu_filtrar_avisos ();/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_filtrar_avisos
// 
// Objetivo: Filtra y evalua el alcance de los avisos a mostrar.
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

long ll_estado

// inicializo variables

	is_alimentacion = " "
	is_estado = " "
	is_tipo = " "
	is_alcance = " "
	is_linea = " "


////////////////////// DBE comment ini 30/03/2000 15:35 
//CHOOSE CASE getitemnumber(1,"ai_alimentacion")
//	CASE 1 
////		is_alimentacion = "(gi_avisos.nro_instalacion <> " + string(fgcdec_aviso_sin_alimentacion) + ")"
//		is_alimentacion = "(gi_avisos.nro_instalacion <> " + string(fgcdec_aviso_sin_alimentacion) + " AND gi_avisos.nro_instalacion <> "+string(fgcdec_aviso_de_ayuda)+" AND gi_avisos.nro_instalacion <> "+string(fgcdec_aviso_alumbrado_publico)+" )"
//		is_alimentacion = is_alimentacion + " and (gi_avisos.ind_calidad<>1) "//DBE 22/03/2000 18:38
//	CASE 2 
//	is_alimentacion = "(gi_avisos.nro_instalacion = " + string(fgcdec_aviso_sin_alimentacion) + ")"
//	CASE 3
//		is_alimentacion = "(gi_avisos.ind_ayuda = " + string(fgci_ayuda) + ")"
//	CASE 4
//		is_alimentacion = "(gi_avisos.ind_ayuda = " + string(fgci_alumbrado_publico) + ")"
//	CASE 0
//		is_alimentacion = " "
//	CASE 5 //DBE 22/03/2000 18:38
//		is_alimentacion = "(gi_avisos.ind_calidad = 1)"
//	CASE ELSE
//		is_alimentacion = " "
//END CHOOSE
//////////////////////// DBE comment fin 30/03/2000 15:35 


///////////// DBE ini 30/03/2000 15:31
CHOOSE CASE getitemnumber(1,"ai_clase_aviso")
	CASE fgci_clase_avi_normal
		is_alimentacion = "(gi_avisos.clase_aviso = " + string(fgci_clase_avi_normal)+ ")"
		    
			 if getitemnumber(1,"ai_alimentacion") =1 then is_alimentacion = is_alimentacion + &
			 "and (gi_avisos.nro_instalacion <> " + string(fgcdec_aviso_sin_alimentacion) + ")";
			 
			 if getitemnumber(1,"ai_alimentacion") =2 then is_alimentacion = is_alimentacion + &
			 "and (gi_avisos.nro_instalacion = " + string(fgcdec_aviso_sin_alimentacion) + ")";

		
	CASE fgci_clase_avi_ayuda
	   is_alimentacion = "(gi_avisos.clase_aviso = " + string(fgci_clase_avi_ayuda)+ ")"
	CASE fgci_clase_avi_alum_publ
		is_alimentacion = "(gi_avisos.clase_aviso = " + string(fgci_clase_avi_alum_publ) + ")"
	CASE fgci_clase_avi_calidad
		is_alimentacion = "(gi_avisos.clase_aviso = " + string(fgci_clase_avi_calidad) + ")"
		
			 if getitemnumber(1,"ai_alimentacion") =1 then is_alimentacion = is_alimentacion + &
			 "and (gi_avisos.nro_instalacion <> " + string(fgcdec_aviso_de_calidad_sin_alim) + ")";
			 
			 if getitemnumber(1,"ai_alimentacion") =2 then is_alimentacion = is_alimentacion + &
			 "and (gi_avisos.nro_instalacion = " + string(fgcdec_aviso_de_calidad_sin_alim) + ")";

	CASE ELSE
		is_alimentacion = " "

END CHOOSE



///////////// DBE fin 30/03/2000 15:31



// Evaluo el estado de los avisos a mostar
CHOOSE CASE getitemnumber(1,"ai_estado")
	CASE 1 
		is_estado = "(gi_avisos.est_aviso =  "+ string(fgci_aviso_pendiente)+ " " +")"
	CASE 2
		is_estado = "(gi_avisos.est_aviso =  "+ string(fgci_aviso_enviado_brigada)+ " " +")"
	CASE 3
		is_estado = "(gi_avisos.est_aviso =  "+ string(fgci_aviso_asoc_incidencia)+ " " +")"
	CASE 4
		is_estado = "(gi_avisos.est_aviso =  "+ string(fgci_aviso_reactivado)+ " " +")"
	CASE 5
		is_estado = "(gi_avisos.est_aviso =  "+ string(fgci_aviso_resuelto)+ " " +")"
	CASE 6
		is_estado = "(gi_avisos.est_aviso =  6 " + ")"
	CASE 11 
		is_estado = "(gi_avisos.est_aviso = 11 " + ")"
	CASE 0
		is_estado = " "
	CASE ELSE
		is_estado = " "
END CHOOSE
	
// Evaluo el tipo de Aviso

	if getitemnumber(1,"ai_tipo") <> fgci_todos then
		is_tipo =  "(gi_avisos.tip_aviso =  "+ string(getitemnumber(1,"ai_tipo")) + " " +")"
	else
		is_tipo = " "
	end if 

// Evaluo el alcance
	if getitemnumber(1,"ai_alcance") <> fgci_todos then
		is_alcance =  "(gi_avisos.co_alcance =  "+ string(getitemnumber(1,"ai_alcance")) + " " +")"
	else
		is_alcance = " "
	end if 

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
	
return is_linea
end function

public function string fnu_cargar_nro_aviso ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_nro_aviso
// 
// Objetivo:  Prepara el filtro 
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
// 16/01/2002	GSE
//
///////////////////////////////////////////////////////
string ls_nro_aviso_desde, ls_nro_aviso_hasta


If getitemnumber(1,"nro_aviso_desde") > 0 then
		ls_nro_aviso_desde = "(GI_AVISOS.NRO_AVISO >=  "+ string(getitemnumber(1,"nro_aviso_desde")) + " )"
else
		ls_nro_aviso_desde = ""
end if


If getitemnumber(1,"nro_aviso_hasta") > 0 then
		ls_nro_aviso_hasta = " AND (GI_AVISOS.NRO_AVISO <=  "+ string(getitemnumber(1,"nro_aviso_hasta")) + " )"
else
		ls_nro_aviso_hasta = ""
end if



is_nro_desde_hasta = ls_nro_aviso_desde + ls_nro_aviso_hasta

return is_nro_desde_hasta
end function

on constructor;//fnu_def_constantes()
end on

on u_avi_2030_pr_filtro_aviso.create
end on

on u_avi_2030_pr_filtro_aviso.destroy
end on


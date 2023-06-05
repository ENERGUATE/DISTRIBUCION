HA$PBExportHeader$u_cen_2001_nu_form_centro_cmd_mesa.sru
forward
global type u_cen_2001_nu_form_centro_cmd_mesa from datawindow
end type
end forward

global type u_cen_2001_nu_form_centro_cmd_mesa from datawindow
int Width=1057
int Height=493
string DataObject="d_cen_2001_pr_form_centro_cmd_mesa"
end type
global u_cen_2001_nu_form_centro_cmd_mesa u_cen_2001_nu_form_centro_cmd_mesa

type variables
string campo
u_cen_2001_rn_form_centro_cmd_mesa iu_cen_2001_rn
u_cen_2001_pr_form_centro_cmd_mesa iu_cen_2001_pr
end variables

forward prototypes
public function integer fnu_activarse ()
public function integer fnu_cargar_estructura (datawindow pd_dw, long pi_centro, long pi_cmd, long pi_puesto)
public function integer fnu_campo (datawindow pd_dw, string ps_campo)
public function integer fnu_obtener_cmd (ref datawindow pd_dw)
public function integer fnu_obtener_centro (ref datawindow pd_dw)
public function integer fnu_obtener_puesto (ref datawindow pd_dw)
public function integer fnu_m_accion_perfil_open_consulta_inc (ref datawindow pd_dw, integer pi_centro, integer pi_cmd, integer pi_puesto, string ps_accion_llamada)
public function integer fnu_m_accion_perfil_open_consulta_avi (ref datawindow pd_dw, integer pi_centro, integer pi_cmd, integer pi_puesto, string ps_accion_llamada)
public function string fnu_filtro_ambito_mant_ot (integer pi_centro, integer pi_cmd, integer pi_puesto)
end prototypes

public function integer fnu_activarse ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_activarse
// 
// Objetivo: Activa datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////
//sdfgsdfg
this.show()
return 1
end function

public function integer fnu_cargar_estructura (datawindow pd_dw, long pi_centro, long pi_cmd, long pi_puesto);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_cargar_estructura
// 
// Objetivo: Obtiene datos para la datawindow.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, pi_centro, pi_cmd, pi_puesto
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

pd_dw.setitem(1,"nro_centro",pi_centro)
pd_dw.setitem(1,"nro_cmd",pi_cmd)
pd_dw.setitem(1,"nro_mesa",pi_puesto)
return 1
end function

public function integer fnu_campo (datawindow pd_dw, string ps_campo);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_campo
// 
// Objetivo: Retorna campo o el valor asignado.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, ps_campo
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

campo = lower(ps_campo)

return pd_dw.GetItemNumber(1,campo)
	
end function

public function integer fnu_obtener_cmd (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_cmd
// 
// Objetivo: Obtiene el campo nro_cmd.
//
// Ambito:	p$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pd_dw
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	
//
////////////////////////////////////////////////////////////////////////////////////////////////

return(pd_dw.GetItemNumber(1,"nro_cmd"))

end function

public function integer fnu_obtener_centro (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_centro
// 
// Objetivo: Obtiene campo nro_centro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pd_dw
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	
//
////////////////////////////////////////////////////////////////////////////////////////////////

return(pd_dw.GetItemNumber(1,"nro_centro"))

end function

public function integer fnu_obtener_puesto (ref datawindow pd_dw);///////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_puesto
// 
// Objetivo: Obtiene el campo nro_mesa.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pd_dw
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	
//
/////////////////////////////////////////////////////////////////////

return(pd_dw.GetItemNumber(1,"nro_mesa"))

end function

public function integer fnu_m_accion_perfil_open_consulta_inc (ref datawindow pd_dw, integer pi_centro, integer pi_cmd, integer pi_puesto, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_m_accion_perfil_open_consulta_inc
// 
// Objetivo: Inicializa o habilita campos seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, pi_centro, pi_cmd, pi_puesto, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

 iu_cen_2001_rn = CREATE u_cen_2001_rn_form_centro_cmd_mesa 
			//inicializo
		iu_cen_2001_rn.frn_ini_centro(pd_dw,pi_centro,ps_accion_llamada)
		iu_cen_2001_rn.frn_ini_cmd(pd_dw,pi_cmd,ps_accion_llamada)
		iu_cen_2001_rn.frn_ini_puesto(pd_dw,pi_puesto,ps_accion_llamada)

			//habilito
		iu_cen_2001_rn.frn_hab_centro(pd_dw,ps_accion_llamada)
		iu_cen_2001_rn.frn_hab_cmd(pd_dw,ps_accion_llamada)
		iu_cen_2001_rn.frn_hab_puesto(pd_dw,ps_accion_llamada)


DESTROY iu_cen_2001_rn 
Return 1
end function

public function integer fnu_m_accion_perfil_open_consulta_avi (ref datawindow pd_dw, integer pi_centro, integer pi_cmd, integer pi_puesto, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_m_acci$$HEX1$$f300$$ENDHEX$$n_perfil_open_consulta_avi
// 
// Objetivo: Inicializa campos seleccionados seg$$HEX1$$fa00$$ENDHEX$$n la acci$$HEX1$$f300$$ENDHEX$$n llamada.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw, pi_centro, pi_cmd, pi_puesto, ps_accion_llamada
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

iu_cen_2001_rn = CREATE u_cen_2001_rn_form_centro_cmd_mesa 
		
			//inicializo
		iu_cen_2001_rn.frn_ini_centro(pd_dw,pi_centro,ps_accion_llamada)
		iu_cen_2001_rn.frn_ini_cmd(pd_dw,pi_cmd,ps_accion_llamada)
		iu_cen_2001_rn.frn_ini_puesto(pd_dw,pi_puesto,ps_accion_llamada)
		

			//habilitacion
		iu_cen_2001_rn.frn_hab_centro(pd_dw,ps_accion_llamada)
		iu_cen_2001_rn.frn_hab_cmd(pd_dw,ps_accion_llamada)
		iu_cen_2001_rn.frn_hab_puesto(pd_dw,ps_accion_llamada)


DESTROY iu_cen_2001_rn 

 Return 1
end function

public function string fnu_filtro_ambito_mant_ot (integer pi_centro, integer pi_cmd, integer pi_puesto);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_filtro_ambito_mant_ot
// 
// Objetivo: Crea el filtro para un archivo en particular, considerando el $$HEX1$$e100$$ENDHEX$$mbito
//           para ser usado en un where de una sentencia SQL de una datawindow.  
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pi_centro, pi_cmd, pi_puesto
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////



// Se evalua si viene informacion en centro,cmd,puesto
//segun el tipo de usuarios
		//perfil de mantenimiento

		IF  pi_centro <> 0 and pi_cmd <> 0 and pi_puesto <> 0  and pi_puesto <> fgci_todos THEN
//			MESSAGEBOX("FILTRO AMBITO","(incidencia.centro_mant = " + string(pi_centro) + ") and (incidencia.cmd_mant = " + string(pi_cmd)+ " ) and (incidencia.mesa_mant = " + string(pi_puesto) + ")")
			RETURN "(ot.nro_centro = " + string(pi_centro) + ") and (ot.nro_cmd = " + string(pi_cmd)+ " ) and (ot.nro_mesa = " + string(pi_puesto) + ")"
		END IF

		IF  pi_centro <> 0 and pi_cmd <> 0 and pi_cmd <> fgci_todos and pi_puesto = fgci_todos THEN
//			MESSAGEBOX("FILTRO AMBITO","(incidencia.centro_mant = " + string(pi_centro) + ") and (incidencia.cmd_mant = " + string(pi_cmd)+ " ) " )	
				RETURN "(ot.nro_centro = " + string(pi_centro) + ") and (ot.nro_cmd = " + string(pi_cmd)+ " )"
		END IF


		IF pi_centro <> 0 and pi_centro <> fgci_todos and pi_cmd =  fgci_todos and pi_puesto = fgci_todos THEN
//		MESSAGEBOX("FILTRO AMBITO","(incidencia.centro_mant = " + string(pi_centro) + ")" )	
		RETURN "(ot.nro_centro = " + string(pi_centro) + ")" 
		END IF


RETURN "  "
end function


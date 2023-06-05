HA$PBExportHeader$u_avi_2030_nu_filtro_aviso.sru
forward
global type u_avi_2030_nu_filtro_aviso from nonvisualobject
end type
end forward

global type u_avi_2030_nu_filtro_aviso from nonvisualobject
end type
global u_avi_2030_nu_filtro_aviso u_avi_2030_nu_filtro_aviso

type variables
u_avi_2030_rn_filtro_aviso iu_avi_2030_rn
end variables

forward prototypes
public function integer fnu_m_accion_perfil_open_avi (ref datawindow pd_dw, u_generico_comunicaciones pu_comunic)
end prototypes

public function integer fnu_m_accion_perfil_open_avi (ref datawindow pd_dw, u_generico_comunicaciones pu_comunic);/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_m_acci$$HEX1$$f300$$ENDHEX$$n_perfil_open_avi
// 
// Objetivo: Inicializa, Habilita y Deshabilita opci$$HEX1$$f300$$ENDHEX$$n del menu seg$$HEX1$$fa00$$ENDHEX$$n 
//	 		    acci$$HEX1$$f300$$ENDHEX$$n llamada. 
//       
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pu_comunic
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

iu_avi_2030_rn = CREATE u_avi_2030_rn_filtro_aviso 

CHOOSE CASE pu_comunic.is_comunic.accion_llamada
	CASE "Seleccion" 
		
	CASE "Consulta"
				//inicializo
		iu_avi_2030_rn.frn_ini_ai_estado(pd_dw,pu_comunic.is_comunic.intval4)
		iu_avi_2030_rn.frn_ini_ai_tipo(pd_dw,pu_comunic.is_comunic.intval5)
		iu_avi_2030_rn.frn_ini_ai_alcance(pd_dw,pu_comunic.is_comunic.intval8)
		iu_avi_2030_rn.frn_ini_ai_alimentacion(pd_dw,pu_comunic.is_comunic.intval7)
		iu_avi_2030_rn.frn_ini_ai_duracion(pd_dw,pu_comunic.is_comunic.intval6)
		
				//habilito
		iu_avi_2030_rn.frn_hab_ai_estado(pd_dw)
		iu_avi_2030_rn.frn_hab_ai_tipo(pd_dw)
		iu_avi_2030_rn.frn_hab_ai_alcance(pd_dw)
		iu_avi_2030_rn.frn_hab_ai_alimentacion(pd_dw)
		iu_avi_2030_rn.frn_hab_ai_duracion(pd_dw)
		
	CASE "Actualizacion"

END CHOOSE

DESTROY iu_avi_2030_rn 
Return 1
end function


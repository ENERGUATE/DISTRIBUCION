HA$PBExportHeader$u_desc_7101_nu_filtro_descargos.sru
forward
global type u_desc_7101_nu_filtro_descargos from nonvisualobject
end type
end forward

global type u_desc_7101_nu_filtro_descargos from nonvisualobject
end type
global u_desc_7101_nu_filtro_descargos u_desc_7101_nu_filtro_descargos

type variables
u_inc_2030_rn_filtro_incidencia  iu_inc_2030_rn 
end variables

forward prototypes
public function integer fnu_m_accion_perfil_open (ref datawindow pd_dw, u_generico_comunicaciones pu_comunic)
public function integer fnu_v_usuario_mant_puede_modif (long pl_nro_incidencia)
end prototypes

public function integer fnu_m_accion_perfil_open (ref datawindow pd_dw, u_generico_comunicaciones pu_comunic);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_m_accion_perfil_open
// 
// Objetivo: Inicializa y habilita campo seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
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


//iu_inc_2030_rn = CREATE u_inc_2030_rn_filtro_incidencia 

			//inicializo
		iu_inc_2030_rn.frn_ini_ai_estado(pd_dw,pu_comunic.is_comunic.intval4,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_ini_ai_estado_mant(pd_dw,pu_comunic.is_comunic.intval8,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_ini_ai_tipo(pd_dw,pu_comunic.is_comunic.intval5,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_ini_ai_alcance(pd_dw,pu_comunic.is_comunic.intval7,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_ini_ai_suministro(pd_dw,pu_comunic.is_comunic.intval10,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_ini_ai_duracion(pd_dw,pu_comunic.is_comunic.intval6,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_ini_ai_reg_seleccionados(pd_dw,pu_comunic.is_comunic.accion_llamada)

			//habilito
		iu_inc_2030_rn.frn_hab_ai_estado(pd_dw,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_hab_ai_estado_mant(pd_dw,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_hab_ai_tipo(pd_dw,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_hab_ai_alcance(pd_dw,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_hab_ai_suministro(pd_dw,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_hab_ai_duracion(pd_dw,pu_comunic.is_comunic.accion_llamada)
		iu_inc_2030_rn.frn_hab_ai_reg_seleccionados(pd_dw,pu_comunic.is_comunic.accion_llamada)
//
//DESTROY iu_inc_2030_rn 
Return 1
end function

public function integer fnu_v_usuario_mant_puede_modif (long pl_nro_incidencia);int li_cont


  SELECT COUNT (*)  INTO :li_cont  
    FROM "SGD_ESTADO_OPER"  
   WHERE  (( "SGD_ESTADO_OPER"."IND_ENV_MANT" = 2 ) OR ( "SGD_ESTADO_OPER"."IND_ENV_MANT" = 3 ))   AND  
			( "SGD_ESTADO_OPER"."NRO_INCIDENCIA" = :pl_nro_incidencia ) ;
   

Return li_cont
end function

on destructor;//
DESTROY iu_inc_2030_rn 
end on

on u_desc_7101_nu_filtro_descargos.create
TriggerEvent( this, "constructor" )
end on

on u_desc_7101_nu_filtro_descargos.destroy
TriggerEvent( this, "destructor" )
end on

on constructor;iu_inc_2030_rn = CREATE u_inc_2030_rn_filtro_incidencia
end on


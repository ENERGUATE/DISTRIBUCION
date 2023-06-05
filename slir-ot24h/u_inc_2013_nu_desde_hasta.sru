HA$PBExportHeader$u_inc_2013_nu_desde_hasta.sru
forward
global type u_inc_2013_nu_desde_hasta from nonvisualobject
end type
end forward

global type u_inc_2013_nu_desde_hasta from nonvisualobject
end type
global u_inc_2013_nu_desde_hasta u_inc_2013_nu_desde_hasta

type variables
u_inc_2013_rn_desde_hasta iu_inc_2013_rn
end variables

forward prototypes
public function integer fnu_m_accion_perfil_open_avi (ref datawindow pd_dw, datetime pdt_desde, datetime pdt_hasta, integer pi_estado, string ps_accion_llamada)
public function integer fnu_m_accion_perfil_open_inc (ref datawindow pd_dw, datetime pdt_desde, datetime pdt_hasta, integer pi_estado, string ps_accion_llamada)
public function string fnu_filtro_des_hast_mant_ot (datetime pd_desde, datetime pd_hasta)
public function integer frn_hab_desde (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_hasta (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_ini_hasta (ref datawindow pd_dw, datetime pdt_hasta, string ps_accion_llamada)
public function integer frn_ini_desde (ref datawindow pd_dw, integer pi_estado, string ps_tipo_filtro, string ps_accion_llamada)

end prototypes

public function integer fnu_m_accion_perfil_open_avi (ref datawindow pd_dw, datetime pdt_desde, datetime pdt_hasta, integer pi_estado, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_m_accion_perfil_open_avi
//
// Objetivo: Inicializa y Habilita campos seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pdt_desde, pdt_hasta, pi_estado, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

// iu_inc_2013_rn = CREATE u_inc_2013_rn_desde_hasta 
	
	//inicializo
	iu_inc_2013_rn.frn_ini_desde(pd_dw,pi_estado,"Avisos",ps_accion_llamada)
	iu_inc_2013_rn.frn_ini_hasta(pd_dw,pdt_hasta,ps_accion_llamada)

		//habilito
	iu_inc_2013_rn.frn_hab_desde(pd_dw,ps_accion_llamada)
	iu_inc_2013_rn.frn_hab_hasta(pd_dw,ps_accion_llamada)
//
//DESTROY iu_inc_2013_rn 
Return 1
end function

public function integer fnu_m_accion_perfil_open_inc (ref datawindow pd_dw, datetime pdt_desde, datetime pdt_hasta, integer pi_estado, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_m_accion_perfil_open_inc
//
// Objetivo: Inicializa y Habilita campos seg$$HEX1$$fa00$$ENDHEX$$n llamada al evento 
//	          open de la ventana incidencias.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pdt_desde, pdt_hasta, pi_estado, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

// iu_inc_2013_rn = CREATE u_inc_2013_rn_desde_hasta 
			//inicializo
		iu_inc_2013_rn.frn_ini_desde(pd_dw,pi_estado,"Incidencias",ps_accion_llamada)
		iu_inc_2013_rn.frn_ini_hasta(pd_dw,pdt_hasta,ps_accion_llamada)


			//habilito
		iu_inc_2013_rn.frn_hab_desde(pd_dw,ps_accion_llamada)
		iu_inc_2013_rn.frn_hab_hasta(pd_dw,ps_accion_llamada)

//DESTROY iu_inc_2013_rn 
Return 1
end function

public function string fnu_filtro_des_hast_mant_ot (datetime pd_desde, datetime pd_hasta);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_filtro_des_hast_mant_ot
//
// Objetivo: Filtra en un rango de fechas mantenimiento de ordenes
//	          de trabajo.
// 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_hasta, pd_desde
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF ISNULL(pd_desde) THEN

	return "(ot.fecha <= to_date(~'" &
								+ string(pd_hasta,"dd/mm/yyyy hh:mm:ss") + &
		"~',~'dd/mm/yyyy hh24:mi:ss~'))"

END IF

return "(ot.f_desde >= to_date(~'"  &
 								+ string(pd_desde,"dd/mm/yyyy hh:mm:ss")+ &
		"~',~'dd/mm/yyyy hh24:mi:ss~')  ) and (incidencia.f_desde <= to_date(~'" &
								+ string(pd_hasta,"dd/mm/yyyy hh:mm:ss") + &
		"~',~'dd/mm/yyyy hh24:mi:ss~'))"
end function

public function integer frn_hab_desde (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_desde
// 
//
// Objetivo: Habilita y deshabilita seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada 
//	          el campo fecha desde.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:pd_dw, ps_accion_llamada
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
		pd_dw.modify("desde.protect=0")
		pd_dw.modify("desde.background.color="+gs_blanco)
	
	CASE "Consulta"
		pd_dw.modify("desde.protect=0")
		pd_dw.modify("desde.background.color="+gs_blanco)


	CASE "Actualizacion"
		pd_dw.modify("desde.protect=0")
		pd_dw.modify("desde.background.color="+gs_blanco)
	

END CHOOSE

RETURN 1


//		IF fgnu_tiene_perfil(fgci_perfil_oper_alta_media) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_baja) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_consulta) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_encargado_turno) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_gerente) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_mante_red) THEN
//
	
end function

public function integer frn_hab_hasta (ref datawindow pd_dw, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_hab_hasta
// 
//
// Objetivo: Habilita y Deshabilita seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//	          el campo fecha hasta. 
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
		pd_dw.modify("hasta.protect=0")
		pd_dw.modify("hasta.background.color="+gs_blanco)
			
	CASE "Consulta"
		pd_dw.modify("hasta.protect=0")
		pd_dw.modify("hasta.background.color="+gs_blanco)

	CASE "Actualizacion"
		pd_dw.modify("hasta.protect=0")
		pd_dw.modify("hasta.background.color="+gs_blanco)

END CHOOSE

//		IF fgnu_tiene_perfil(fgci_perfil_oper_alta_media) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_baja) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_consulta) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_encargado_turno) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_gerente) OR &
//			fgnu_tiene_perfil(fgci_perfil_oper_mante_red) THEN
//
//		IF fgnu_tiene_perfil(fgci_perfil_mante_encargado_turno) OR &
//			fgnu_tiene_perfil(fgci_perfil_mante_consulta) OR &
//			fgnu_tiene_perfil(fgci_perfil_mante_gerente) OR &
//			fgnu_tiene_perfil(fgci_perfil_mante_operador_alta) OR &
//			fgnu_tiene_perfil(fgci_perfil_mante_operador_baja) OR &
//			fgnu_tiene_perfil(fgci_perfil_mantenimiento) THEN
//

Return 1
end function

public function integer frn_ini_hasta (ref datawindow pd_dw, datetime pdt_hasta, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_hasta
//
// Objetivo: Inicializa el campo fecha hasta con fecha del dia
//	          seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
// 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pdt_hasta, ps_accion_llamada
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
		IF ISNULL(pdt_hasta) THEN
			pdt_hasta=fgcd_fecha_del_dia()
		END IF
	
	CASE "Consulta"
		IF ISNULL(pdt_hasta) THEN
			pdt_hasta=fgcd_fecha_del_dia()
		END IF
	
	CASE "Actualizacion"
		IF ISNULL(pdt_hasta) THEN
			pdt_hasta=fgcd_fecha_del_dia()
		END IF

END CHOOSE

		pd_dw.SetItem(1,"hasta",pdt_hasta)
		pd_dw.AcceptText()

RETURN 1
end function

public function integer frn_ini_desde (ref datawindow pd_dw, integer pi_estado, string ps_tipo_filtro, string ps_accion_llamada);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_ini_desde
// 
//
// Objetivo: Inicializa campo fecha desde.
//	
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_estado, ps_tipo_filtro, ps_accion_llamada
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////



Datetime ldt_desde

//si la incidencia o el aviso filtrar estan en estado resuelto 
//la fecha desde es la del dia para que la demora nop sea tan prolongada

IF ps_tipo_filtro="Incidencias" AND &
	pi_estado=fgci_incidencia_resuelta OR &
	ps_tipo_filtro="Avisos" AND &
   pi_estado=fgci_aviso_pendiente THEN
	SetNull(ldt_desde)
//  ldt_desde=fgcd_fecha_del_dia()  
ELSE
	IF pi_estado=fgci_aviso_resuelto THEN
		ldt_desde=fgcd_fecha_del_dia()
	ELSE
		SetNull(ldt_desde)
	END IF
END IF

	pd_dw.SetItem(1,"desde",ldt_desde)
	pd_dw.AcceptText()
	pd_dw.SetColumn("desde")
RETURN 1
end function

on destructor;
DESTROY iu_inc_2013_rn 
end on

on u_inc_2013_nu_desde_hasta.create
TriggerEvent( this, "constructor" )
end on

on u_inc_2013_nu_desde_hasta.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;iu_inc_2013_rn = CREATE u_inc_2013_rn_desde_hasta 
end event


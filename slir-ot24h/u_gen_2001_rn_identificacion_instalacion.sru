HA$PBExportHeader$u_gen_2001_rn_identificacion_instalacion.sru
forward
global type u_gen_2001_rn_identificacion_instalacion from nonvisualobject
end type
end forward

global type u_gen_2001_rn_identificacion_instalacion from nonvisualobject
end type
global u_gen_2001_rn_identificacion_instalacion u_gen_2001_rn_identificacion_instalacion

forward prototypes
public function integer f_filtrar_instalacion (ref u_gen_2001_nu_identificacion_instalacion puo_list_tip_inst, integer pi_tipo_instal)
public function integer f_filtrar_instalacion2 (ref u_gen_2001_nu_identificacion_instalacion puo_list_tip_inst, integer pi_tipo_instal, integer pi_desde)
public function integer f_filtrar_instalacion_3 (ref u_gen_2001_nu_identificacion_instalacion puo_list_tip_inst, integer pi_tipo_instal)
end prototypes

public function integer f_filtrar_instalacion (ref u_gen_2001_nu_identificacion_instalacion puo_list_tip_inst, integer pi_tipo_instal);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos
//
// Objetivo: Filtra tipo de instalaci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: puo_list_tip_inst, pi_tipo_instal
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 24/4/96			AQ				Creaci$$HEX1$$f300$$ENDHEX$$n
// 16/10/96			HMA			Modificaci$$HEX1$$f300$$ENDHEX$$n	(filtrar tipo 'Acometida')
///////////////////////////////////////////////////////



IF pi_tipo_instal <> 0 THEN 

	puo_list_tip_inst.idwc_tipo_instalacion.SetFilter(" tipo_instalacion < "+ String(pi_tipo_instal) +" AND tipo_instalacion <> 0  AND tipo_instalacion <> " + String(fgci_tipo_acometida) + " " ) 	
	puo_list_tip_inst.idwc_tipo_instalacion.Filter()

ELSE 
	//se muestran todos los tipos de instalacion
END IF

RETURN 1

end function

public function integer f_filtrar_instalacion2 (ref u_gen_2001_nu_identificacion_instalacion puo_list_tip_inst, integer pi_tipo_instal, integer pi_desde);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos2
//
// Objetivo: Filtra tipo de instalaci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: puo_list_tip_inst, pi_tipo_instal
//		Salida : --
//
// Devuelve:
//
//  Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//  ------	   -----------   ---------
// 10/10/96			HMA			Creaci$$HEX1$$f300$$ENDHEX$$n
// 16/10/96			HMA			Modificaci$$HEX1$$f300$$ENDHEX$$n (filtrar tipo 'Acometida')
///////////////////////////////////////////////////////



IF pi_tipo_instal <> 0 THEN 

	puo_list_tip_inst.idwc_tipo_instalacion.SetFilter(" tipo_instalacion >= "+ String(pi_desde) +" AND tipo_instalacion < "+ String(pi_tipo_instal) +" AND tipo_instalacion <> 0  AND tipo_instalacion <> " + String(fgci_tipo_acometida) + " " ) 	
	puo_list_tip_inst.idwc_tipo_instalacion.Filter()

ELSE 
	//se muestran todos los tipos de instalacion
END IF

RETURN 1
end function

public function integer f_filtrar_instalacion_3 (ref u_gen_2001_nu_identificacion_instalacion puo_list_tip_inst, integer pi_tipo_instal);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos
//
// Objetivo: Filtra tipo de instalaci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: puo_list_tip_inst, pi_tipo_instal
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 24/4/96			AQ				Creaci$$HEX1$$f300$$ENDHEX$$n
// 16/10/96			HMA			Modificaci$$HEX1$$f300$$ENDHEX$$n	(filtrar tipo 'Acometida')
///////////////////////////////////////////////////////



IF pi_tipo_instal <> 0 THEN 

	puo_list_tip_inst.idwc_tipo_instalacion.SetFilter(" tipo_instalacion >= "+ String(pi_tipo_instal - 1) +" AND tipo_instalacion < "  + String(pi_tipo_instal + 1) + " " )
	puo_list_tip_inst.idwc_tipo_instalacion.Filter()

ELSE 
	//se muestran todos los tipos de instalacion
END IF

RETURN 1

end function

on u_gen_2001_rn_identificacion_instalacion.create
TriggerEvent( this, "constructor" )
end on

on u_gen_2001_rn_identificacion_instalacion.destroy
TriggerEvent( this, "destructor" )
end on


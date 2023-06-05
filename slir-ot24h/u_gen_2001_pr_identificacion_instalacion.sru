HA$PBExportHeader$u_gen_2001_pr_identificacion_instalacion.sru
forward
global type u_gen_2001_pr_identificacion_instalacion from datawindow
end type
end forward

global type u_gen_2001_pr_identificacion_instalacion from datawindow
integer width = 1618
integer height = 260
string dataobject = "d_gen_2001_identificacion_instalacion"
end type
global u_gen_2001_pr_identificacion_instalacion u_gen_2001_pr_identificacion_instalacion

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_tipo, boolean pb_nombre)
public function integer fnu_insertar_fila ()
end prototypes

public function integer fpr_habilitar_campos (boolean pb_tipo, boolean pb_nombre);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos del resto de la informaci$$HEX1$$f300$$ENDHEX$$n de avisos  en funci$$HEX1$$f300$$ENDHEX$$n del
// valor de los par$$HEX1$$e100$$ENDHEX$$metros que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//	en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: pb_esquina (boolean que habilita la esquina)
//          pb_telefono(boolean que habilita el telefono)
//				pb_observacion_tel (boolean que habilita las observaciones del telefonista)
//				pb_tipo_aviso(boolean que habilita el tipo de avisos)
//				Pb_alcance (boolean que habilita el alcance del aviso)
//

//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	02/08/96		HMA       	Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


IF pb_tipo THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.Modify("tipo_instalacion.Background.Color=" + String(65536*255+256*255+255))
	This.Modify("tipo_instalacion.Background.Color=" + gs_blanco)
// Fin. Sgo.
	This.SetTabOrder("tipo_instalacion",10)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.Modify("tipo_instalacion.background.color=" + String(65536*192+256*192+192))
	This.Modify("tipo_instalacion.background.color=" + gs_gris)
// Fin. Sgo.
	This.SetTabOrder("tipo_instalacion",0)
END IF

IF pb_nombre THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.Modify("nombre_instalacion.Background.Color=" + String(65536*255+256*255+255))
	This.Modify("nombre_instalacion.Background.Color=" + gs_blanco)
// Fin. Sgo.
	This.SetTabOrder("nombre_instalacion",20)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.Modify("nombre_instalacion.background.color=" + String(65536*192+256*192+192))
	This.Modify("nombre_instalacion.background.color=" + gs_gris)
// Fin. Sgo.
	This.SetTabOrder("nombre_instalacion",0)
END IF

RETURN 1

end function

public function integer fnu_insertar_fila ();return this.insertrow(0)

end function

on u_gen_2001_pr_identificacion_instalacion.create
end on

on u_gen_2001_pr_identificacion_instalacion.destroy
end on


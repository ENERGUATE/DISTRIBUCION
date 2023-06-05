HA$PBExportHeader$u_ins_2008_pr_datos_instalacion.sru
forward
global type u_ins_2008_pr_datos_instalacion from datawindow
end type
end forward

global type u_ins_2008_pr_datos_instalacion from datawindow
integer width = 3054
integer height = 1156
string dataobject = "d_ins_2008_pr_datos_instalacion"
end type
global u_ins_2008_pr_datos_instalacion u_ins_2008_pr_datos_instalacion

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_habilitar)
public function integer fpr_hab_pot_inst (boolean pb_habilitar)
public function integer fpr_hab_nom_inst (boolean pb_habilitar)
public function integer fnu_insertar_fila ()
end prototypes

public function integer fpr_habilitar_campos (boolean pb_habilitar);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos en funci$$HEX1$$f300$$ENDHEX$$n del valor de los 
//					par$$HEX1$$e100$$ENDHEX$$metros que recibe. Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de 
//					los mismos en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: 		pb_habilitar (Boolean que indica si deshabilito o n$$HEX1$$f300$$ENDHEX$$)
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/07/96		HMA       	Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//IF pb_habilitar THEN
//
//	This.modify("nom_instalacion.background.color=" + string(65536*255+256*255+255))
//   This.SetTabOrder("nom_instalacion",10)
//	This.modify("pot_instalada.background.color=" + string(65536*255+256*255+255))
//   This.SetTabOrder("pot_instalada",20)
//	This.modify("nro_cmd_real.background.color=" + string(65536*255+256*255+255))
//   This.SetTabOrder("nro_cmd_real",80)
//	This.modify("cod_prop_inst.background.color=" + string(65536*255+256*255+255))
//   This.SetTabOrder("cod_prop_inst",90)
//	This.modify("descripcion.background.color=" + string(65536*255+256*255+255))
//   This.SetTabOrder("descripcion",100)
//ELSE
//
//	This.modify("nom_instalacion.background.color=" + string(65536*192+256*192+192))
//   This.SetTabOrder("nom_instalacion",0)
//	This.modify("pot_instalada.background.color=" + string(65536*192+256*192+192))
//   This.SetTabOrder("pot_instalada",0)
//	This.modify("nro_cmd_real.background.color=" + string(65536*192+256*192+192))
//   This.SetTabOrder("nro_cmd_real",0)
//	This.modify("cod_prop_inst.background.color=" + string(65536*192+256*192+192))
//   This.SetTabOrder("cod_prop_inst",0)
//	This.modify("descripcion.background.color=" + string(65536*192+256*192+192))
//   This.SetTabOrder("descripcion",0)
//END IF
//
//RETURN 1

IF pb_habilitar THEN
	This.modify("nom_instalacion.background.color=" + gs_blanco)
   This.SetTabOrder("nom_instalacion",10)
	This.modify("pot_instalada.background.color=" + gs_blanco)
   This.SetTabOrder("pot_instalada",20)
	This.modify("nro_cmd_real.background.color=" + gs_blanco)
   This.SetTabOrder("nro_cmd_real",80)
	This.modify("cod_prop_inst.background.color=" + gs_blanco)
   This.SetTabOrder("cod_prop_inst",90)
	This.modify("descripcion.background.color=" + gs_blanco)
   This.SetTabOrder("descripcion",100)
ELSE
	This.modify("nom_instalacion.background.color=" + gs_gris)
   This.SetTabOrder("nom_instalacion",0)
	This.modify("pot_instalada.background.color=" + gs_gris)
   This.SetTabOrder("pot_instalada",0)
	This.modify("nro_cmd_real.background.color=" + gs_gris)
   This.SetTabOrder("nro_cmd_real",0)
	This.modify("cod_prop_inst.background.color=" + gs_gris)
   This.SetTabOrder("cod_prop_inst",0)
	This.modify("descripcion.background.color=" + gs_gris)
   This.SetTabOrder("descripcion",0)
END IF

RETURN 1
// Fin. Sgo.
end function

public function integer fpr_hab_pot_inst (boolean pb_habilitar);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_hab_pot_inst
// 
// Objetivo:	Habilita los campos en funci$$HEX1$$f300$$ENDHEX$$n del valor de los 
//					par$$HEX1$$e100$$ENDHEX$$metros que recibe. Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de 
//					los mismos en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: 		pb_habilitar (Boolean que indica si deshabilito o n$$HEX1$$f300$$ENDHEX$$)
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/07/96		HMA       	Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


IF pb_habilitar THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.modify("pot_instalada.background.color=" + string(65536*255+256*255+255))
	This.modify("pot_instalada.background.color=" + gs_blanco)
// Fin. Sgo.
   This.SetTabOrder("pot_instalada",20)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.modify("pot_instalada.background.color=" + string(65536*192+256*192+192))
	This.modify("pot_instalada.background.color=" + gs_gris)
// Fin. Sgo.
   This.SetTabOrder("pot_instalada",0)
END IF

RETURN 1


end function

public function integer fpr_hab_nom_inst (boolean pb_habilitar);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_hab_nom_inst
// 
// Objetivo:	Habilita los campos en funci$$HEX1$$f300$$ENDHEX$$n del valor de los 
//					par$$HEX1$$e100$$ENDHEX$$metros que recibe. Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de 
//					los mismos en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: 		pb_habilitar (Boolean que indica si deshabilito o n$$HEX1$$f300$$ENDHEX$$)
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	26/07/96		HMA       	Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


IF pb_habilitar THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.modify("nom_inst_padre.background.color=" + string(65536*255+256*255+255))
	This.modify("nom_inst_padre.background.color=" + gs_blanco)
// Fin. Sgo.
   This.SetTabOrder("nom_inst_padre",30)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	This.modify("nom_inst_padre.background.color=" + string(65536*192+256*192+192))
	This.modify("nom_inst_padre.background.color=" + gs_gris)
// Fin. Sgo.
   This.SetTabOrder("nom_inst_padre",0)
END IF

RETURN 1


end function

public function integer fnu_insertar_fila ();return this.insertrow(1)

end function

on u_ins_2008_pr_datos_instalacion.create
end on

on u_ins_2008_pr_datos_instalacion.destroy
end on


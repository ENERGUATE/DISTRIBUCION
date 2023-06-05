HA$PBExportHeader$u_bri_2005_pr_materiales_incidencia.sru
forward
global type u_bri_2005_pr_materiales_incidencia from u_gen_0000_lista
end type
end forward

global type u_bri_2005_pr_materiales_incidencia from u_gen_0000_lista
integer width = 1989
integer height = 420
string dataobject = "d_bri_2005_materiales_incidencia"
end type
global u_bri_2005_pr_materiales_incidencia u_bri_2005_pr_materiales_incidencia

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_habilito)
public function integer fpr_habilitar_campos_2 (boolean pb_habilito, integer pi_fila)
end prototypes

public function integer fpr_habilitar_campos (boolean pb_habilito);// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//IF pb_habilito THEN
//	this.modify("materiales_material.background.color=" + string(65536*255+256*255+255))
//	This.SetTabOrder("materiales_material",10)
//	this.modify("materiales_cantidad.background.color=" + string(65536*255+256*255+255))
//	this.SetTabOrder("materiales_cantidad",20)
//
//ELSE
//	this.modify("materiales_material.background.color=" + string(65536*192+256*192+192))
//	this.SetTabOrder("materiales_material",0)
//	this.modify("materiales_cantidad.background.color=" + string(65536*192+256*192+192))
//	this.SetTabOrder("materiales_cantidad",0)
//END IF
//
//Return 1

IF pb_habilito THEN
	this.modify("materiales_material.background.color=" + gs_blanco)
	This.SetTabOrder("materiales_material",10)
	this.modify("materiales_cantidad.background.color=" + gs_blanco)
	this.SetTabOrder("materiales_cantidad",20)

ELSE
	this.modify("materiales_material.background.color=" + gs_gris)
	this.SetTabOrder("materiales_material",0)
	this.modify("materiales_cantidad.background.color=" + gs_gris)
	this.SetTabOrder("materiales_cantidad",0)
END IF

Return 1
// Fin. Sgo.
end function

public function integer fpr_habilitar_campos_2 (boolean pb_habilito, integer pi_fila);//IF pb_habilito THEN
//	this.dwmodify("materiales_material.background.color=" + string(rgb(255,255,255)))
//	this.SetTabOrder("materiales_material",10)
//	this.dwmodify("materiales_cantidad.background.color=" + string(rgb(255,255,255)))
//	this.SetTabOrder("materiales_cantidad",20)
//
//ELSE
//	this.dwmodify("materiales_material.background.color=" + string(rgb(192,192,192)))
//	this.SetTabOrder("materiales_material",0)
//	this.dwmodify("materiales_cantidad.background.color=" + string(rgb(192,192,192)))
//	this.SetTabOrder("materiales_cantidad",0)
//END IF

Return 1
end function

on u_bri_2005_pr_materiales_incidencia.create
call super::create
end on

on u_bri_2005_pr_materiales_incidencia.destroy
call super::destroy
end on


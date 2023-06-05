HA$PBExportHeader$u_ins_2017_pr_form_mante_acometidas.sru
forward
global type u_ins_2017_pr_form_mante_acometidas from datawindow
end type
end forward

global type u_ins_2017_pr_form_mante_acometidas from datawindow
integer width = 2336
integer height = 452
integer taborder = 1
string dataobject = "d_ins_2017_form_mante_acometidas"
boolean livescroll = true
end type
global u_ins_2017_pr_form_mante_acometidas u_ins_2017_pr_form_mante_acometidas

forward prototypes
public function integer fpr_habilito (boolean pb_habilito, string ps_color)
end prototypes

public function integer fpr_habilito (boolean pb_habilito, string ps_color);IF pb_habilito THEN

//   this.modify("pot_contratada.background.color=" + string(rgb(255,255,255)))
//   this.SetTabOrder("pot_contratada",10)
//   this.modify("kwh.background.color=" + string(rgb(255,255,255)))
//   this.SetTabOrder("kwh",20)
//   this.modify("cant_cli.background.color=" + string(rgb(255,255,255)))
//   this.SetTabOrder("cant_cli",30)
//   this.modify("kwh_fact.background.color=" + string(rgb(255,255,255)))
//   this.SetTabOrder("kwh_fact",40)
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//   this.modify("descripcion.background.color=" + string(65536*255+256*255+255))
//   this.SetTabOrder("descripcion",50)
//   this.modify("tipo_conexion.background.color=" + string(65536*255+256*255+255))
   this.modify("descripcion.background.color=" + gs_blanco)
   this.SetTabOrder("descripcion",50)
   this.modify("tipo_conexion.background.color=" + gs_blanco)
// Fin. Sgo.
   this.SetTabOrder("tipo_conexion",60)
ELSE
//   this.modify("pot_contratada.background.color=" + string(rgb(192,192,192)))
//   this.SetTabOrder("pot_contratada",0)
//   this.modify("kwh.background.color=" + string(rgb(192,192,192)))
//   this.SetTabOrder("kwh",0)
//   this.modify("cant_clientes.background.color=" + string(rgb(192,192,192)))
//   this.SetTabOrder("cant_clientes",0)
//   this.modify("kwh_fact.background.color=" + string(rgb(192,192,192)))
//   this.SetTabOrder("kwh_fact",0)
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//   this.modify("descripcion.background.color=" + string(65536*192+256*192+192))
//   this.SetTabOrder("descripcion",0)
//   this.modify("tipo_conexion.background.color=" + string(65536*192+256*192+192))
   this.modify("descripcion.background.color=" + gs_gris)
   this.SetTabOrder("descripcion",0)
   this.modify("tipo_conexion.background.color=" + gs_gris)
// Fin. Sgo.
   this.SetTabOrder("tipo_conexion",0)

	
END IF

CHOOSE CASE ps_color
	CASE "azul"
//		this.Modify("pot_contratada.color=" + string(rgb(0,0,128)))
//		this.Modify("kwh.color=" + string(rgb(0,0,128)))
//		this.Modify("cant_clientes.color=" + string(rgb(0,0,128)))
//		this.Modify("kwh_fact.color=" + string(rgb(0,0,128)))
		this.Modify("descripcion.color=" + string(65536*128))
		this.Modify("tipo_conexion.color=" + string(65536*128))

	CASE "negro"
//		this.Modify("pot_contratada.color=" + string(rgb(0,0,0)))
//		this.Modify("kwh.color=" + string(rgb(0,0,0)))
//		this.Modify("cant_clientes.color=" + string(rgb(0,0,0)))
//		this.Modify("kwh_fact.color=" + string(rgb(0,0,0)))
		this.Modify("descripcion.color=" + string(0))
		this.Modify("tipo_conexion.color=" + string(0))

END CHOOSE

RETURN 1
end function

on u_ins_2017_pr_form_mante_acometidas.create
end on

on u_ins_2017_pr_form_mante_acometidas.destroy
end on


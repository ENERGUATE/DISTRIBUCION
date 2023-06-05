HA$PBExportHeader$u_bri_2019_pr_ingreso_tareas.sru
forward
global type u_bri_2019_pr_ingreso_tareas from UserObject
end type
type dw_ingreso_tareas from datawindow within u_bri_2019_pr_ingreso_tareas
end type
end forward

global type u_bri_2019_pr_ingreso_tareas from UserObject
int Width=2574
int Height=521
boolean Border=true
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=16777215
dw_ingreso_tareas dw_ingreso_tareas
end type
global u_bri_2019_pr_ingreso_tareas u_bri_2019_pr_ingreso_tareas

forward prototypes
public function integer fpr_color_texto ()
public function integer fpr_limpiar_campos ()
end prototypes

public function integer fpr_color_texto ();dw_ingreso_tareas.Modify("brigada_ot_nro_ot.color=" + string(65536*128))
dw_ingreso_tareas.Modify("pi_estado.color=" + string(65536*128))
dw_ingreso_tareas.Modify("prioridad.color=" + string(65536*128))
dw_ingreso_tareas.Modify("nro_tarea.color=" + string(65536*128))
dw_ingreso_tareas.Modify("fecha_generada.color=" + string(65536*128))
dw_ingreso_tareas.Modify("fecha_resolucion.color=" + string(65536*128))
RETURN 1

end function

public function integer fpr_limpiar_campos ();string ls_nulo
long ll_nulo

SetNull(ls_nulo)
SetNull(ll_nulo)

dw_ingreso_tareas.SetItem(1,"fecha_generada","")
dw_ingreso_tareas.SetItem(1,"fecha_resolucion","")
dw_ingreso_tareas.SetItem(1,"pi_estado","")
dw_ingreso_tareas.SetItem(1,"prioridad","")	
dw_ingreso_tareas.SetItem(1,"nro_tarea","")	
Return 1
end function

on u_bri_2019_pr_ingreso_tareas.create
this.dw_ingreso_tareas=create dw_ingreso_tareas
this.Control[]={ this.dw_ingreso_tareas}
end on

on u_bri_2019_pr_ingreso_tareas.destroy
destroy(this.dw_ingreso_tareas)
end on

type dw_ingreso_tareas from datawindow within u_bri_2019_pr_ingreso_tareas
int Width=2565
int Height=517
int TabOrder=1
string DataObject="d_bri_2019_ingreso_tareas"
boolean LiveScroll=true
end type


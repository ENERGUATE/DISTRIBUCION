HA$PBExportHeader$dir_obj_man_0000.sru
forward
global type dir_obj_man_0000 from gen_obj_0000
end type
end forward

global type dir_obj_man_0000 from gen_obj_0000
end type
global dir_obj_man_0000 dir_obj_man_0000

type variables
gen_int_dir_0002  int_dir


end variables

on dir_obj_man_0000.create
TriggerEvent( this, "constructor" )
end on

on dir_obj_man_0000.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;call super::constructor; int_dir = Create	gen_int_dir_0002
 int_dir.init(this) 

end event

event default;call super::default;	SetItem('cod_prov', gi_cod_provincia) 
	SetItem('cod_depto',gi_cod_departamento)
	SetItem('cod_munic',gl_cod_municipio	)
	SetItem('cod_local',gl_cod_localidad	)

	SetItem('nom_prov',gs_provincia)	
	SetItem('nom_depto',gs_departamento)
	SetItem('nom_munic',gs_municipio)
	SetItem('nom_local',gs_localidad)

end event


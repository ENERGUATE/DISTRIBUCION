HA$PBExportHeader$u_bri_2014_rn_mante_brigadistas.sru
forward
global type u_bri_2014_rn_mante_brigadistas from nonvisualobject
end type
end forward

global type u_bri_2014_rn_mante_brigadistas from nonvisualobject
end type
global u_bri_2014_rn_mante_brigadistas u_bri_2014_rn_mante_brigadistas

forward prototypes
public function boolean frn_tiene_perfil_alta ()
public function boolean frn_tiene_perfil_modifica ()
end prototypes

public function boolean frn_tiene_perfil_alta ();RETURN TRUE
end function

public function boolean frn_tiene_perfil_modifica ();RETURN TRUE
end function

on u_bri_2014_rn_mante_brigadistas.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2014_rn_mante_brigadistas.destroy
TriggerEvent( this, "destructor" )
end on


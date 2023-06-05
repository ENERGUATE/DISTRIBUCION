HA$PBExportHeader$u_bri_2005_nu_lista_brigadas_puesto.sru
forward
global type u_bri_2005_nu_lista_brigadas_puesto from nonvisualobject
end type
end forward

global type u_bri_2005_nu_lista_brigadas_puesto from nonvisualobject
end type
global u_bri_2005_nu_lista_brigadas_puesto u_bri_2005_nu_lista_brigadas_puesto

forward prototypes
public function integer fnu_cargar_estructura (ref datawindow pd_dw, integer pi_en_turno, integer pi_disponible, integer pi_tipo_brig)
public function integer fnu_cargar_estructura_2 (ref datawindow pd_dw, integer pi_en_turno, integer pi_disponible)
end prototypes

public function integer fnu_cargar_estructura (ref datawindow pd_dw, integer pi_en_turno, integer pi_disponible, integer pi_tipo_brig);pd_dw.setitem(1,"pi_en_turno",pi_en_turno)
pd_dw.setitem(1,"pi_disponible",pi_disponible)
pd_dw.setitem(1,"pi_tipo_brig",pi_tipo_brig)
return 1
end function

public function integer fnu_cargar_estructura_2 (ref datawindow pd_dw, integer pi_en_turno, integer pi_disponible);pd_dw.setitem(1,"pi_en_turno",pi_en_turno)
pd_dw.setitem(1,"pi_disponible",pi_disponible)

return 1
end function

on u_bri_2005_nu_lista_brigadas_puesto.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2005_nu_lista_brigadas_puesto.destroy
TriggerEvent( this, "destructor" )
end on


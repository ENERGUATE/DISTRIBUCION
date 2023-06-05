HA$PBExportHeader$u_bri_2018_nu_datos_brigada.sru
forward
global type u_bri_2018_nu_datos_brigada from nonvisualobject
end type
end forward

global type u_bri_2018_nu_datos_brigada from nonvisualobject
end type
global u_bri_2018_nu_datos_brigada u_bri_2018_nu_datos_brigada

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_brigada)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_brigada);pd_dw.settransobject(sqlca)
pd_dw.retrieve(pl_nro_brigada)
return 1
end function

on u_bri_2018_nu_datos_brigada.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2018_nu_datos_brigada.destroy
TriggerEvent( this, "destructor" )
end on


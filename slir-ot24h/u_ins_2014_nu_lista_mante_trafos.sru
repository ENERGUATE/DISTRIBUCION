HA$PBExportHeader$u_ins_2014_nu_lista_mante_trafos.sru
$PBExportComments$Obsoleto
forward
global type u_ins_2014_nu_lista_mante_trafos from nonvisualobject
end type
end forward

global type u_ins_2014_nu_lista_mante_trafos from nonvisualobject
end type
global u_ins_2014_nu_lista_mante_trafos u_ins_2014_nu_lista_mante_trafos

forward prototypes
public function integer fnu_traer_datos (decimal pdec_nro_poste, ref datawindow pd_dw)
public function string fnu_nombre_instalac (decimal pdec_nro_instalac)
end prototypes

public function integer fnu_traer_datos (decimal pdec_nro_poste, ref datawindow pd_dw);pd_dw.Retrieve(pdec_nro_poste)

RETURN 1

end function

public function string fnu_nombre_instalac (decimal pdec_nro_instalac);string ls_nombre_instalac

  SELECT "INSTALACION"."NOM_INSTALACION" INTO :ls_nombre_instalac   
    FROM "INSTALACION"  
   WHERE "INSTALACION"."NRO_INSTALACION" = :pdec_nro_instalac ;

Return ls_nombre_instalac
end function

on u_ins_2014_nu_lista_mante_trafos.create
TriggerEvent( this, "constructor" )
end on

on u_ins_2014_nu_lista_mante_trafos.destroy
TriggerEvent( this, "destructor" )
end on


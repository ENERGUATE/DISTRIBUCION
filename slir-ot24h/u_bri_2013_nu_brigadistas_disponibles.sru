HA$PBExportHeader$u_bri_2013_nu_brigadistas_disponibles.sru
forward
global type u_bri_2013_nu_brigadistas_disponibles from nonvisualobject
end type
end forward

global type u_bri_2013_nu_brigadistas_disponibles from nonvisualobject
end type
global u_bri_2013_nu_brigadistas_disponibles u_bri_2013_nu_brigadistas_disponibles

forward prototypes
public function integer fnu_eliminar_fila (ref datawindow pd_dw, integer pi_nro_fila)
public function integer fnu_liberar_brigadistas (ref datawindow pd_dw, integer pi_nro_fila)
public function integer fnu_obtener_datos (ref datawindow pd_dw, integer centro, integer cmd, integer puesto)
end prototypes

public function integer fnu_eliminar_fila (ref datawindow pd_dw, integer pi_nro_fila);// Elimina la fila de la datawindow, para ello
// marca el brigadista como asignado y refresca la datawindow.

pd_dw.setItem(pi_nro_fila,"gi_brigadista_ind_disponible",0)
//pd_dw.acceptText()
return 1
end function

public function integer fnu_liberar_brigadistas (ref datawindow pd_dw, integer pi_nro_fila);// Marco el campo ind_disponible en 1 para el brigadista que se libero
// de la brigada
LONG ll_brigadista
ll_brigadista = pd_dw.getitemnumber(pi_nro_fila,"gi_brigadista_nro_brigadistas")
pd_dw.setItem(pi_nro_fila,"gi_brigadista_ind_disponible",1)
pd_dw.setItem(pi_nro_fila,"gi_brigadista_encargado",0)

 UPDATE "GI_BRIGADISTA"  
 SET "IND_DISPONIBLE" = 1,
 	  "ENCARGADO" = 0
 WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" =:ll_brigadista   ;

//  UPDATE "BRIGADISTA"  
//     SET "IND_DISPONIBLE" = 1  
//   WHERE "BRIGADISTA"."NRO_BRIGADISTAS" = :pi_nro_brigadistas   ;
//
return 1
end function

public function integer fnu_obtener_datos (ref datawindow pd_dw, integer centro, integer cmd, integer puesto);// Traigo todos los datos y filtro los disponibles.
pd_dw.retrieve(centro,cmd,puesto)
//pd_dw.SetFilter ("ISNULL(gi_brigada_brigadista_f_fin)")
//pd_dw.filter()
return 1
end function

on u_bri_2013_nu_brigadistas_disponibles.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2013_nu_brigadistas_disponibles.destroy
TriggerEvent( this, "destructor" )
end on


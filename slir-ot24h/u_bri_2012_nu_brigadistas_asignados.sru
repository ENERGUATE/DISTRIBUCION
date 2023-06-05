HA$PBExportHeader$u_bri_2012_nu_brigadistas_asignados.sru
forward
global type u_bri_2012_nu_brigadistas_asignados from nonvisualobject
end type
end forward

global type u_bri_2012_nu_brigadistas_asignados from nonvisualobject
end type
global u_bri_2012_nu_brigadistas_asignados u_bri_2012_nu_brigadistas_asignados

forward prototypes
public function integer fnu_baja_de_brigada (ref datawindow pd_dw, integer pi_fila_seleccionada)
public function integer fnu_liberar_por_error (ref datawindow pd_dw, integer pi_fila)
public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_brigada)
public function integer fnu_insertar_datos (ref datawindow pd_dw, long pl_nro_brigada, string ps_programa, long pi_nro_brigadistas, integer pi_encargado, string ps_nombre, string ps_ape1, string ps_ape2)
end prototypes

public function integer fnu_baja_de_brigada (ref datawindow pd_dw, integer pi_fila_seleccionada);// Marco en el registro la fecha en que se dio de baja de la brigada.

pd_dw.setItem(pi_fila_seleccionada,"gi_brigada_brigadista_f_fin",fgcd_fecha_con_seg())
//pd_dw.update()
return 1
end function

public function integer fnu_liberar_por_error (ref datawindow pd_dw, integer pi_fila);// Pone en null la fecha de fin de un brigadista que haya sido eliminado
// de una brigada por error.
long ll_nro_brigadistas
dateTime ld_null
setNull(ld_null)

pd_dw.setItem(pi_fila,"gi_brigada_brigadista_f_fin",ld_null)
ll_nro_brigadistas=pd_dw.getitemnumber(pi_fila,"gi_brigada_brigadista_nro_brigadistas")

UPDATE "GI_BRIGADISTA"   SET "IND_DISPONIBLE" = 0  
					   WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" =:ll_nro_brigadistas   ;

return 1
end function

public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_brigada);// Trae los datos de los brigadistas asignados a la brigada dada.

pd_dw.retrieve(pl_nro_brigada)
return 1
end function

public function integer fnu_insertar_datos (ref datawindow pd_dw, long pl_nro_brigada, string ps_programa, long pi_nro_brigadistas, integer pi_encargado, string ps_nombre, string ps_ape1, string ps_ape2);long ll_fila_nueva

// Inserto fila nueva en la datawindow

ll_fila_nueva = pd_dw.insertRow(0)

// Actualizo datos que me pasan como parametros

pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_nro_brigada",pl_nro_brigada)
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_programa",ps_programa)
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_nro_brigadistas",pi_nro_brigadistas)
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_encargado",pi_encargado)
pd_dw.setItem(ll_fila_nueva,"gi_brigadista_nombre",ps_nombre)
pd_dw.setItem(ll_fila_nueva,"gi_brigadista_ape1",ps_ape1)
pd_dw.setItem(ll_fila_nueva,"gi_brigadista_ape2",ps_ape2)
// Actualizo datos fijos
datetime ld_fecha
ld_fecha = fgcd_fecha_con_seg()
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_f_alta",ld_fecha)
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_h_actual",ld_fecha)
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_h_alta",ld_fecha)
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_usuario",gs_usuario)
pd_dw.setItem(ll_fila_nueva,"gi_brigada_brigadista_f_actual",ld_fecha)

 UPDATE "GI_BRIGADISTA"   SET "IND_DISPONIBLE" = 0  
					   WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" =:pi_nro_brigadistas   ;

return 1
end function

on u_bri_2012_nu_brigadistas_asignados.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2012_nu_brigadistas_asignados.destroy
TriggerEvent( this, "destructor" )
end on


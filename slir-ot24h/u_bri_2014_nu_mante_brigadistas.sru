HA$PBExportHeader$u_bri_2014_nu_mante_brigadistas.sru
forward
global type u_bri_2014_nu_mante_brigadistas from nonvisualobject
end type
end forward

global type u_bri_2014_nu_mante_brigadistas from nonvisualobject
end type
global u_bri_2014_nu_mante_brigadistas u_bri_2014_nu_mante_brigadistas

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public subroutine fnu_desasignar (datetime pd_fecha_actual, long pl_nro_brigadista)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw);// Trae los datos de los brigadistas 

pd_dw.retrieve()
return 1
end function

public subroutine fnu_desasignar (datetime pd_fecha_actual, long pl_nro_brigadista);UPDATE "GI_BRIGADA_BRIGADISTA"  
  SET "F_FIN" = :pd_fecha_actual ,   
  		"F_ACTUAL" = :pd_fecha_actual ,   
    	"USUARIO" = :gs_usuario,   
      "PROGRAMA" = 'w_6203' 
  WHERE "GI_BRIGADA_BRIGADISTA"."NRO_BRIGADISTAS" = :pl_nro_brigadista AND
		"GI_BRIGADA_BRIGADISTA"."F_FIN" IS NULL ;

UPDATE "GI_BRIGADISTA"
	SET "IND_DISPONIBLE" = 1,
		 "ENCARGADO" = 0
	WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" =  :pl_nro_brigadista ;


end subroutine

on u_bri_2014_nu_mante_brigadistas.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2014_nu_mante_brigadistas.destroy
TriggerEvent( this, "destructor" )
end on


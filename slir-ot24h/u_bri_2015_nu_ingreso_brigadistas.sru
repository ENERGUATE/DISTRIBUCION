HA$PBExportHeader$u_bri_2015_nu_ingreso_brigadistas.sru
forward
global type u_bri_2015_nu_ingreso_brigadistas from nonvisualobject
end type
end forward

global type u_bri_2015_nu_ingreso_brigadistas from nonvisualobject
end type
global u_bri_2015_nu_ingreso_brigadistas u_bri_2015_nu_ingreso_brigadistas

forward prototypes
public function long fnu_actualiza_nro_brigadista ()
public subroutine fnu_obtener_datos (ref datawindow pd_dw, long pi_nro_brigadista)
end prototypes

public function long fnu_actualiza_nro_brigadista ();long ll_nro_brigadista

//Obtengo el utlimo brigadista


SELECT ultimo
        INTO :ll_nro_brigadista FROM gi_t_ultimo
        WHERE tabla='BRIGADISTA' FOR UPDATE;

ll_nro_brigadista ++

//Actualiza el ultimo valor de brigadista

UPDATE gi_t_ultimo SET ultimo=:ll_nro_brigadista WHERE tabla='BRIGADISTA';
gnu_u_transaction.uf_commit();
RETURN ll_nro_brigadista
end function

public subroutine fnu_obtener_datos (ref datawindow pd_dw, long pi_nro_brigadista);// Trae los datos de los brigadistas 

pd_dw.retrieve(pi_nro_brigadista)
//return 
end subroutine

on u_bri_2015_nu_ingreso_brigadistas.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2015_nu_ingreso_brigadistas.destroy
TriggerEvent( this, "destructor" )
end on


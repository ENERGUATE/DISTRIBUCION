HA$PBExportHeader$u_bri_0000_rn_validar_brigada.sru
forward
global type u_bri_0000_rn_validar_brigada from nonvisualobject
end type
end forward

global type u_bri_0000_rn_validar_brigada from nonvisualobject autoinstantiate
end type

forward prototypes
public subroutine limpiar_fecha_invalida (datawindow dw, long row, integer nro_error)
public function integer obtener_estado (datetime f_desde, datetime f_hasta, integer est_brigada, datetime f_actual)
end prototypes

public subroutine limpiar_fecha_invalida (datawindow dw, long row, integer nro_error);datetime ldt_f_nula

SetNull (ldt_f_nula)

choose case nro_error
	case -2
		dw.object.gi_brigada_ot_f_fin_prev[row]=ldt_f_nula
	case -3
		dw.object.f_desde[row]=ldt_f_nula
	case -4		
		dw.object.f_hasta[row]=ldt_f_nula
end choose
end subroutine

public function integer obtener_estado (datetime f_desde, datetime f_hasta, integer est_brigada, datetime f_actual);//Para validar las fechas del estado de la brigada y obtener el numero de nuevo estado.
//Devuelve el numero del estado en que esta brigada o el numero del campo que esta invalido

if est_brigada < 2 then
	if fgnu_es_nula (f_desde) then
	   gnv_msg.f_mensaje("AI85","","",OK!)
   	return 0
// 	elseif (f_desde < f_actual) then
//		gnv_msg.f_mensaje("AI86","","",OK!)
//      return -1
	elseif (f_desde > fgnu_fecha_actual()) then
	   gnv_msg.f_mensaje("AI88","","",OK!)
      return -3
	elseif not isnull(f_hasta) and f_hasta > fgnu_fecha_actual() then
   	gnv_msg.f_mensaje("AI90","","",OK!)
      return -4
	elseif  not isnull(f_hasta) and f_hasta < f_desde then
	  	gnv_msg.f_mensaje("AI91","","",OK!)	
		return -4
	elseif  not isnull(f_hasta) then 
		return 3
	else
	  return 2
	end if

end if

if est_brigada = 2 then
	if fgnu_es_nula (f_hasta) then
		return 2
	elseif f_hasta > fgnu_fecha_actual() then
   	gnv_msg.f_mensaje("AI90","","",OK!)
      return -4
	elseif f_hasta < f_desde then
	  	gnv_msg.f_mensaje("AI91","","",OK!)	
		return -4
	else		
		return 3
	end if
else
	return 3
end if
	

end function

on u_bri_0000_rn_validar_brigada.create
TriggerEvent( this, "constructor" )
end on

on u_bri_0000_rn_validar_brigada.destroy
TriggerEvent( this, "destructor" )
end on


HA$PBExportHeader$u_ot_1002_nu_generico.sru
$PBExportComments$UserObject gen$$HEX1$$e900$$ENDHEX$$rico para el n$$HEX1$$fa00$$ENDHEX$$cleo de orden de trabajo.
forward
global type u_ot_1002_nu_generico from u_ot_0000_generico_orden_de_trabajo
end type
end forward

global type u_ot_1002_nu_generico from u_ot_0000_generico_orden_de_trabajo
end type
global u_ot_1002_nu_generico u_ot_1002_nu_generico

forward prototypes
public function datetime fnu_dia_alta_ot ()
public function long fnu_brigada_asignada (long pl_nro_ot)
end prototypes

public function datetime fnu_dia_alta_ot ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_dia_alta_ot
// 
// Objetivo: Retorna fecha y hora actual del sistema.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: -- 
//	Salida: datetime
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	2/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


Return fgnu_fecha_actual()
end function

public function long fnu_brigada_asignada (long pl_nro_ot);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_brigada_asignada
// 
// Objetivo: Retorna la brigada asignada a una Orden de trabajo.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: pi_nro_ot
//	Salida: --  
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
// 15/2/96		JHV			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long  ll_nro_brigada

  SELECT "GI_OT"."ULT_BRIGADA"  
    INTO :ll_nro_brigada  
    FROM "GI_OT"  
   WHERE "GI_OT"."NRO_OT" = :pl_nro_ot ;

IF gnv_msg.f_error(55) = 1 THEN 
	return ll_nro_brigada
END IF
	

end function


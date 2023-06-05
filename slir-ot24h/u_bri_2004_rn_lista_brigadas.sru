HA$PBExportHeader$u_bri_2004_rn_lista_brigadas.sru
forward
global type u_bri_2004_rn_lista_brigadas from nonvisualobject
end type
end forward

global type u_bri_2004_rn_lista_brigadas from nonvisualobject
end type
global u_bri_2004_rn_lista_brigadas u_bri_2004_rn_lista_brigadas

forward prototypes
public function integer frn_deshabilitar (ref datawindow pd_dw, integer pi_estado)
end prototypes

public function integer frn_deshabilitar (ref datawindow pd_dw, integer pi_estado);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_deshabilitar
// 
// Objetivo: Pone el tab order en cero o en el n$$HEX1$$fa00$$ENDHEX$$mero que corresponda para cada campo
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//					estado 1 deshabilitado
//							 0 habiliatdo (<>1)
//		Salida:   
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


IF pi_estado=1 THEN			
	pd_dw.SetTabOrder("brigada",0)
	//	pd_dw.modify("brigada.bacground.Color ="+string(RGB(255,255,255)))
ELSE
	pd_dw.SetTabOrder("brigada",10)
//	pd_dw.modify("brigada.bacground.Color ="+string(RGB(192,192,192)))
END IF

Return 1
end function

on u_bri_2004_rn_lista_brigadas.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2004_rn_lista_brigadas.destroy
TriggerEvent( this, "destructor" )
end on


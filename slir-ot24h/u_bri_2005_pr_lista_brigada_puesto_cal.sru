HA$PBExportHeader$u_bri_2005_pr_lista_brigada_puesto_cal.sru
forward
global type u_bri_2005_pr_lista_brigada_puesto_cal from datawindow
end type
end forward

global type u_bri_2005_pr_lista_brigada_puesto_cal from datawindow
int Width=1225
int Height=464
int TabOrder=10
string DataObject="d_2005_lista_brigada_puesto_cal"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type
global u_bri_2005_pr_lista_brigada_puesto_cal u_bri_2005_pr_lista_brigada_puesto_cal

forward prototypes
public function integer fpr_crear_dw ()
public subroutine fpr_deshabilitar_fechas ()
public subroutine fpr_habilitar_fechas ()
end prototypes

public function integer fpr_crear_dw ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crear_dw
// 
// Objetivo: Inicializa todos los campos de la datawindow
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
datawindowchild ddw_tipo_brigada
long ll_fila

ll_fila = This.InsertRow(0)
IF ll_fila > 0 THEN
	This.GetChild('pi_tipo_brig', ddw_tipo_brigada)
	ddw_tipo_brigada.SetTransObject(sqlca)
	ddw_tipo_brigada.Retrieve()

	This.SetItem(1,"pi_disponible",1)
	This.SetItem(1,"pi_tipo_brig",1)
	This.SetItem(ll_fila, 'pdt_fecha_turno', fgnu_fecha_actual())
	This.SetItem(ll_fila, 'pi_en_turno', 0)
END IF

return ll_fila
end function

public subroutine fpr_deshabilitar_fechas ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_deshabilitar_fechas
// 
// Objetivo: Deshabilitar el campo pdt_fecha_turno 
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

This.Object.pdt_fecha_turno.Protect = 1
This.Object.pdt_fecha_turno.background.color = gs_gris

end subroutine

public subroutine fpr_habilitar_fechas ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_habilitar_fechas
// 
// Objetivo: Habilitar el campo pdt_fecha_turno 
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	25/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

This.Object.pdt_fecha_turno.Protect = 0
This.Object.pdt_fecha_turno.background.color = gs_blanco

end subroutine


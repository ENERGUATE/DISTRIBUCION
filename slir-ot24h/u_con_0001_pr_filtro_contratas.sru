HA$PBExportHeader$u_con_0001_pr_filtro_contratas.sru
forward
global type u_con_0001_pr_filtro_contratas from datawindow
end type
end forward

global type u_con_0001_pr_filtro_contratas from datawindow
int Width=1225
int Height=464
int TabOrder=10
string DataObject="d_con_0001_filtro_contratas"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type
global u_con_0001_pr_filtro_contratas u_con_0001_pr_filtro_contratas

forward prototypes
public function integer fpr_crear_dw ()
public subroutine fpr_deshabilitar_fechas ()
public subroutine fpr_habilitar_fechas ()
end prototypes

public function integer fpr_crear_dw ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_crear_dw
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
//	07/04/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
datawindowchild ddw_tipo_brigada
long ll_fila

ll_fila = This.InsertRow(0)
IF ll_fila > 0 THEN
	// se traen los distintos tipos de contratas
	This.GetChild('pi_tipo', ddw_tipo_brigada)
	ddw_tipo_brigada.SetTransObject(sqlca)
	ddw_tipo_brigada.Retrieve()

	This.SetItem(1,"pi_estado",1)
	This.SetItem(1,"pi_tipo",1)
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
//	07/04/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
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
//	07/04/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

This.Object.pdt_fecha_turno.Protect = 0
This.Object.pdt_fecha_turno.background.color = gs_blanco

end subroutine


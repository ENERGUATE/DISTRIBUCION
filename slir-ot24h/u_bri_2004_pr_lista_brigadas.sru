HA$PBExportHeader$u_bri_2004_pr_lista_brigadas.sru
forward
global type u_bri_2004_pr_lista_brigadas from datawindow
end type
end forward

global type u_bri_2004_pr_lista_brigadas from datawindow
int Width=1106
int Height=496
string DataObject="d_bri_2004_pr_lista_brigadas"
boolean VScrollBar=true
end type
global u_bri_2004_pr_lista_brigadas u_bri_2004_pr_lista_brigadas

type variables
u_bri_2004_rn_lista_brigadas ui_bri_2004_rn
// constantes
//int fgci_no_disponible
end variables

forward prototypes
public function su_drag_brigada_ot fpr_devolver_brigada (datetime pd_fecha_desde, integer click_row)
public function integer fnu_quitar_brigada (long click_row)
public function integer fpr_agregar_brigada (long pl_nro_brigada, ref datawindow pd_dw, integer pi_turno, integer pi_disponible)
public function integer fpr_quitar_brigada (long pl_nro_brigada, ref datawindow pd_dw, integer pi_turno, integer pi_disponible)
end prototypes

public function su_drag_brigada_ot fpr_devolver_brigada (datetime pd_fecha_desde, integer click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_brigada
// 
// Objetivo: Carga los datos de la data window seleccionada 
//				 en la data window
//	Ambito:	 P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pd_fecha_desde
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//
////////////////////////////////////////////////////////////////////////////////////////////////

su_drag_brigada_ot ls_estructura
datetime ld_fecha


//click_row = this.GetClickedrow()	
IF CLICK_ROW > 0 THEN
	ls_estructura.click_row=Click_Row
	ls_estructura.brigada=this.GetItemString(click_row,"brigada")
	ls_estructura.nro_ot=0
	ls_estructura.nro_brigada=this.GetItemNumber(click_row,"nro_brigada")
	ls_estructura.movil=this.GetItemString(click_row,"movil")
	//ls_estructura.turno=this.GetItemNumber(click_row,"turno")
	ls_estructura.ind_disponible=0
	ls_estructura.usuario=gs_usuario	
	SETNULL(ls_estructura.f_hasta)
	SETNULL(ls_estructura.h_hasta)
	ls_estructura.programa="w_6201"
	ls_estructura.f_desde=pd_fecha_desde
	ls_estructura.h_desde=pd_fecha_desde
	ls_estructura.f_actual=fgnu_fecha_actual()
	ls_estructura.h_actual=fgnu_fecha_actual()
	ls_estructura.ind_responsable=0
//	SetNull(ld_Fecha)
//	ls_estructura.f_hasta=ld_fecha
//	ls_estructura.h_hasta=ld_fecha
//

ELSE
	ls_estructura.click_row=0
END IF
Return ls_estructura
end function

public function integer fnu_quitar_brigada (long click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_quitar_brigadas
// 
// Objetivo: Borra de la datawindow la fila seleccionada
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: --
//			Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

this.DeleteRow(click_row)

Return 1
end function

public function integer fpr_agregar_brigada (long pl_nro_brigada, ref datawindow pd_dw, integer pi_turno, integer pi_disponible);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_agregar_brigada
// 
// Objetivo: Inserta los datos en la datawindow de la brigada
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pi_nro_brigada, pd_dw, pi_turno, pi_disponible
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_row



//Datos de la  brigada

this.SetFilter("")
this.Filter()

ll_row=this.Find("nro_brigada="+string(pl_nro_brigada),0,this.RowCount())
this.SetItem(ll_row,"ind_disponible",fgci_disponible)
this.AcceptText()

//ui_bri_2004_rn=CREATE u_bri_2004_rn_lista_brigadas
//	ui_bri_2004_rn.frn_filtrar_brigadas(pd_dw,pi_turno,pi_disponible)
//DESTROY ui_bri_2004_rn


return 1
end function

public function integer fpr_quitar_brigada (long pl_nro_brigada, ref datawindow pd_dw, integer pi_turno, integer pi_disponible);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_quitar_brigada
//
// Objetivo: Quita de la data window la fila seleccionada
//				 
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pi_nro_brigada, pd_dw, pi_turno, pi_disponible
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_row

ll_row=this.Find("nro_brigada="+String(pl_nro_brigada),0,this.RowCount())
this.SetItem(ll_row,"ind_disponible",fgci_no_disponible)
//this.AcceptText()
//ui_bri_2004_rn=CREATE u_bri_2004_rn_lista_brigadas
//	ui_bri_2004_rn.frn_filtrar_brigadas(pd_dw,pi_turno,pi_disponible)
//DESTROY ui_bri_2004_rn
Return 1
end function

on constructor;//fnu_def_constantes()

end on


HA$PBExportHeader$u_bri_2002_rn_lista_brigadas_ot.sru
forward
global type u_bri_2002_rn_lista_brigadas_ot from nonvisualobject
end type
end forward

global type u_bri_2002_rn_lista_brigadas_ot from nonvisualobject
end type
global u_bri_2002_rn_lista_brigadas_ot u_bri_2002_rn_lista_brigadas_ot

type variables
u_bri_2002_nu_lista_brigadas_ot u_bri_2002_nu
end variables

forward prototypes
public function integer frn_deshabilitar (ref datawindow pd_dw, integer pi_estado)
public function boolean frn_validar_asigno_brigada (ref datawindow pd_dw)
public function boolean frn_v_fechas_brigadas (ref datawindow pd_dw)
public function integer frn_validar_quitar_brigada_ot (ref datawindow pd_dw, long pl_nro_brigada)
public function integer frn_validar_drag_brigada (ref datawindow pd_dw, long pl_nro_brigada)
end prototypes

public function integer frn_deshabilitar (ref datawindow pd_dw, integer pi_estado);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_deshabilitar
// 
// Objetivo: Seg$$HEX1$$fa00$$ENDHEX$$n un valor pasado por par$$HEX1$$e100$$ENDHEX$$metro, habilita o deshabilita las fechas,
//				 cambiando el color a blanco o gris segun corresponda
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: datawindow
//					variable que indica si habilita o no
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF pi_estado=1 THEN
	pd_dw.modify("f_hasta.Protect=1")
	pd_dw.modify("f_desde.Protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("f_hasta.background.Color ="+string(65536*192+256*192+192))
//	pd_dw.modify("f_desde.background.Color ="+string(65536*192+256*192+192))	
	pd_dw.modify("f_hasta.background.Color =" + gs_gris)
	pd_dw.modify("f_desde.background.Color =" + gs_gris)
// Fin. Sgo.
ELSE
	pd_dw.modify("f_desde.Protect=0")
	pd_dw.modify("f_hasta.protect=0")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("f_desde.background.Color ="+string(65536*255+256*255+255))
//	pd_dw.modify("f_hasta.background.Color ="+string(65536*255+256*255+255))
	pd_dw.modify("f_desde.background.Color =" + gs_blanco)
	pd_dw.modify("f_hasta.background.Color =" + gs_blanco)
// Fin. Sgo.
END IF

Return 1
end function

public function boolean frn_validar_asigno_brigada (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_valida_asigno_brigada
// 
// Objetivo: Indicar si la ot tiene en la datawindow 
//				 una brigada asignada y si tiene una que sea 
//				 responsable de los trabajos
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: nro_brigada
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_lineas,ll_brig_encontrada
boolean lb_valida

lb_valida=FALSE
ll_lineas=pd_dw.RowCount()
IF ll_lineas>0 THEN
	ll_brig_encontrada=pd_dw.Find("ind_responsable=1",0,pd_dw.RowCount())
	IF ll_brig_encontrada>0  THEN
		lb_valida=TRUE
	END IF
END IF

Return lb_valida

end function

public function boolean frn_v_fechas_brigadas (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_v_fechas_brigadas
// 
// Objetivo: Valida que las fechas de inicio de tareas
//				 no sean posteriores a las fechas de fin 
//	Ambito:	 P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: datawindow
//		Salida:   True valida
//					 False no valida		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_contador,ll_tope
boolean lb_f_valida
datetime ldt_f_desde, ldt_f_hasta
string ls_nomb_brigada

pd_dw.AcceptText()
lb_f_valida=TRUE
ll_tope=pd_dw.RowCount()

IF ll_tope>0 THEN
	FOR ll_contador=1 TO ll_tope
		ldt_f_desde=pd_dw.GetItemDateTime(ll_contador,"f_desde")
		ldt_f_hasta=pd_dw.GetItemDateTime(ll_contador,"f_hasta")
		IF (ldt_f_desde>ldt_f_hasta AND &
			NOT ISNULL(ldt_f_hasta)) THEN

			ls_nomb_brigada=pd_dw.GetItemString(ll_contador,"brigada")
			gnv_msg.f_mensaje("AI31","Teams",ls_nomb_brigada,OK!)
			lb_f_valida=FALSE
		END IF
		IF	ISNULL(ldt_f_desde) THEN
			ls_nomb_brigada=pd_dw.GetItemString(ll_contador,"brigada")
			gnv_msg.f_mensaje("AI30","Teams",ls_nomb_brigada,OK!)
			lb_f_valida=FALSE
		END IF
	NEXT
END IF


Return  lb_f_valida
end function

public function integer frn_validar_quitar_brigada_ot (ref datawindow pd_dw, long pl_nro_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_quitar_brigada
// 
// Objetivo: Indica si se puede quitar la brigada segun tenga fecha de fin
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: datawindow
//						nro de brigada
//			Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_row

pd_dw.AcceptText()

ll_row = pd_dw.Find("nro_brigada = "+string(pl_nro_brigada)+"AND ISNULL(f_hasta)",0,pd_dw.RowCount()) 
IF ll_row <> 0 THEN
	Return 1
END IF

Return 0

end function

public function integer frn_validar_drag_brigada (ref datawindow pd_dw, long pl_nro_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_valida_drag_brigada
// 
// Objetivo: Indica si esta autorizado a realizar el dragueo de las 
//				 brigadas segun tenga fecha de fin de tareas
//	Ambito:	p$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: datawindow
//						nro_brigada
//			Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_usuario
long ll_brigada
int li_continua,li_encontre
long ll_row
datetime ld_fecha
ll_brigada=0

pd_dw.AcceptText()


ll_row = pd_dw.Find("nro_brigada = "+string(pl_nro_brigada)+"AND ISNULL(f_hasta)",0,pd_dw.RowCount()) 

IF ll_row <> 0 THEN
	Return 0
END IF
//SetNull(ld_fecha)
//u_bri_2002_nu=CREATE u_bri_2002_nu_lista_brigadas_ot
//
//li_encontre=u_bri_2002_nu.fnu_brigada_ya_asignada(pl_nro_brigada)
//IF li_encontre= 0 THEN
//	IF gnv_msg.f_mensaje("CI01",gs_brigada,"",OKCancel!)=1 THEN
//			u_bri_2002_nu.fnu_actualizar_brigadas_asignadas(pl_nro_brigada)
//	ELSE 
//			Return 0
//	END IF
//END IF
//
//DESTROY u_bri_2002_nu	
Return 1


end function

on u_bri_2002_rn_lista_brigadas_ot.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_bri_2002_rn_lista_brigadas_ot.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


HA$PBExportHeader$u_ot_2001_rn_form_orden_de_trabajo.sru
forward
global type u_ot_2001_rn_form_orden_de_trabajo from nonvisualobject
end type
end forward

global type u_ot_2001_rn_form_orden_de_trabajo from nonvisualobject
end type
global u_ot_2001_rn_form_orden_de_trabajo u_ot_2001_rn_form_orden_de_trabajo

forward prototypes
public function integer frn_deshabilitar (ref datawindow pd_dw, integer pi_estado)
public function integer frn_validar_fecha_generada (ref datetime pdt_fecha_generada_ot, ref datawindow pd_dw2, datetime pdt_fecha_pt, datetime pdt_fecha_cl, integer pi_incidencia_programada)
public function integer frn_datos_por_defecto (ref datawindow pd_dw, long pl_nro_ot)
end prototypes

public function integer frn_deshabilitar (ref datawindow pd_dw, integer pi_estado);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_deshabilitar
// 
// Objetivo: Cambia el color de fondo y pone el taborden de los 
//				 campos habilitados para ingresar datos segun los datos pasados como parametros
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: datwindow
//					pi_estado(anular_o no
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pd_dw.AcceptText()
IF pi_estado=1 THEN		//deshabilitar
	pd_dw.modify("descripcion.protect=1")
	pd_dw.modify("f_desde.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("descripcion.background.Color ="+string(65536*192+256*192+192))
//	pd_dw.modify("f_desde.background.Color ="+string(65536*192+256*192+192))
	pd_dw.modify("descripcion.background.Color =" + gs_gris)
	pd_dw.modify("f_desde.background.Color =" + gs_gris)
// Fin. Sgo.
ELSE							//habilitar
	pd_dw.modify("descripcion.Protect=0")
	pd_dw.modify("f_desde.protect=0")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("descripcion.background.Color ="+string(65536*255+256*255+255))
//	pd_dw.modify("f_desde.background.Color ="+string(65536*255+256*255+255))
	pd_dw.modify("descripcion.background.Color =" + gs_blanco)
	pd_dw.modify("f_desde.background.Color =" + gs_blanco)
// Fin. Sgo.
END IF

return 1
end function

public function integer frn_validar_fecha_generada (ref datetime pdt_fecha_generada_ot, ref datawindow pd_dw2, datetime pdt_fecha_pt, datetime pdt_fecha_cl, integer pi_incidencia_programada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_validar_fecha_generada
// 
// Objetivo: Valida fechas de generada 
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: datwindow 1
//					datwindow 2
//					fecha en que la incidencia entro a PT				
//					fecha en que la incidencia entro a CL
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


DateTime Ld_desde,ld_hasta
int li_Valida
long ll_contador
string ls_brigada,mensaje1,mensaje2


pd_dw2.AcceptText()
li_valida=1
ll_contador=1

//Comparacion con las fechas de inicio de tareas de cada brigada asignada

DO WHILE (ll_contador <= pd_dw2.RowCount() AND li_valida=1)
	ld_desde=pd_dw2.GetItemDateTime(ll_Contador,"f_desde")
	ld_hasta=pd_dw2.GetItemDateTime(ll_Contador,"f_hasta")
	
	IF pi_incidencia_programada <> fgci_incidencia_programada OR &
		ISNULL(pi_incidencia_programada) THEN
		IF ld_desde>fgcd_fecha_del_dia() OR ld_hasta>fgcd_fecha_del_dia() THEN
			gnv_msg.f_mensaje("AG02","","",OK!)	
			li_valida=0
		END IF
	END IF
	
	IF pdt_fecha_generada_ot>ld_desde THEN
		ls_Brigada=fgcs_palabra_brigada+" "+pd_dw2.GetItemString(ll_Contador,"brigada")
		gnv_msg.f_mensaje("AI01",ls_brigada,"",OK!)	
		li_valida=0
	END IF
	ll_contador++
LOOP

IF li_valida=1 THEN
	IF pdt_fecha_pt>pdt_fecha_generada_ot OR &
		(NOT ISNULL(pdt_fecha_cl) AND pdt_fecha_cl<pdt_fecha_generada_ot) THEN

		mensaje1="menor que la fecha de PT "+String(pdt_fecha_pt)
		IF ISNULL(pdt_fecha_cl) THEN
			mensaje2=" ."
		ELSE
			mensaje2="o mayor que la fecha de CL "+string(pdt_fecha_cl)
		END IF
		gnv_msg.f_mensaje("AI29",mensaje1,mensaje2,OK!)
		li_valida=0
	END IF
END IF



Return li_valida
 


end function

public function integer frn_datos_por_defecto (ref datawindow pd_dw, long pl_nro_ot);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_datos_por_defecto
// 
// Objetivo: Inserta en la datawindow los datos por defecto
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: datawindow
//					nro_ot
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

	pd_dw.SetItem(1,"nro_ot",pl_nro_ot)
	pd_dw.SetItem(1,"est_ot",0)   
	pd_dw.SetItem(1,"ind_trabajo",1)
//	pd_dw.SetItem(1,"nro_incidencia",0)
//	pd_dw.SetItem(1,"h_desde",fgnu_fecha_actual())   

Return 1




end function

on u_ot_2001_rn_form_orden_de_trabajo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_ot_2001_rn_form_orden_de_trabajo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


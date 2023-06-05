HA$PBExportHeader$u_ema_2001_rn_seguimiento_mantenimiento.sru
forward
global type u_ema_2001_rn_seguimiento_mantenimiento from datawindow
end type
end forward

global type u_ema_2001_rn_seguimiento_mantenimiento from datawindow
integer width = 1271
integer height = 872
end type
global u_ema_2001_rn_seguimiento_mantenimiento u_ema_2001_rn_seguimiento_mantenimiento

forward prototypes
public function integer frn_valores_por_defecto (ref datawindow pd_dw, ref datawindow pd_dw2)
public function boolean frn_validar_salida_mant (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_click_row, integer pi_estado_mant)
public function integer frn_habilitar (ref datawindow pd_dw, boolean pb_habilitar)
public function boolean frn_validar_datos (ref datawindow pd_dw, boolean pi_resuelve_mant)
public function boolean frn_validar_anulacion (ref datawindow pd_dw, long pl_click_row)
public function boolean frn_es_anulacion (ref datawindow pd_dw, integer pl_click_row)
public function boolean frn_v_fechas (datawindow pd_dw)
public function boolean frn_validar_grabar_est_pr (ref datawindow pd_dw, boolean pb_ind_resuelve_mant)
public function boolean frn_validar_estado_pr (ref datawindow pd_dw, integer pi_resuelve_mant)
end prototypes

public function integer frn_valores_por_defecto (ref datawindow pd_dw, ref datawindow pd_dw2);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_valores_por_defecto
// 
// Objetivo: Carga en la data window los estados de mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window los estados de la incidencia en mantenimiento
//					data window de estados de mantenimiento
//		Salida:
//				
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////



long ll_contador,ll_tope

	FOR ll_contador=1 TO pd_dw2.RowCount()
		pd_dw.InsertRow(0)	
	NEXT

pd_dw2.Show()
return 1
end function

public function boolean frn_validar_salida_mant (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_click_row, integer pi_estado_mant);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_salida_mant
// 
// Objetivo: Valida que pueda enviarse a mantenimiento
//	Ambito:	 P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//				
//		Salida:   TRUE Valida
//					 FALSE No valida		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
///////////////////////////////////////////////////////////////////////////////////////////////

datetime ld_f_alta
long ll_row 
string ls_obs

this.acceptText()		

		//Valida las fechas 
IF NOT this.frn_v_fechas(pd_dw2) THEN
	Return False
END IF

			//Control de que el usuario tenga permiso
ld_f_alta=pd_dw2.GetItemdatetime(2,"f_alta")
IF NOT ISNULL(ld_f_alta) THEN 
	IF NOT (fgnu_auto_der_oper()) THEN          // gl_perfil<>gl_perfil_mantenimiento THEN
		gnv_msg.f_mensaje("EG18","","",OK!)
		Return FALSE //NO Valida
	END IF
END IF


				//Control de que no exista una derivacion previa
ll_row = pd_dw2.find("ind_env_mant = "+string(fgci_entrada)+" OR ind_env_mant=3",0,pd_dw2.rowCount())
IF ll_row<>0 THEN
	gnv_msg.f_mensaje("AI07","","",OK!)
	Return FALSE //no valida
END IF


//					//Control de que este en estado para resolucion						
//ll_row = pd_dw.find("cod_estado = "+string(fgci_incidencia_mant_para_resolucion()),0,pd_dw.rowCount())		
//IF pl_click_row <>ll_row  THEN
//	gnv_msg.f_mensaje("AI06",fgcs_nomenclatura_pr(),"",OK!)
//	Return FALSE //NO Valida
//END IF



					//Control de que este en estado PR 
//ll_row=pd_dw.Find("nomenclatura='gs_nomenclatura_pr'",0,pd_dw.rowcount())
//IF ll_row>0 THEN
//	ld_f_alta=pd_dw.GetItemDateTime(ll_row,"f_alta")  
//	IF ISNULL(ld_f_alta) THEN
//		gnv_msg.f_mensaje("AI06",fgcs_nomenclatura_pr(),"",OK!)
//		Return FALSE //NO Valida
//	END IF
//END IF



Return TRUE // valida
end function

public function integer frn_habilitar (ref datawindow pd_dw, boolean pb_habilitar);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_habilitar
// 
// Objetivo: habilita y deshabilita los campos de la datawindow
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//					pb_habilitar Ture (habilitar)
//					pb_habilitar False (deshabilitar)			
//		Salida:  --		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_contador,ll_row

pd_dw.SetRow(1)

IF pb_habilitar THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("f_alta.background.Color ="+string(65536*255+256*255+255))
//	pd_dw.modify("observacion.background.Color ="+string(65536*255+256*255+255))
	pd_dw.modify("f_alta.background.Color =" + gs_blanco)
	pd_dw.modify("observacion.background.Color =" + gs_blanco)
// Fin. Sgo.
	pd_dw.Modify("f_alta.protect=0")
	pd_dw.Modify("observacion.protect=0")
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("observacion.background.Color ="+string(65536*192+256*192+192))
//	pd_dw.modify("f_alta.background.Color ="+string(65536*192+256*192+192))	
	pd_dw.modify("observacion.background.Color =" + gs_gris)
	pd_dw.modify("f_alta.background.Color =" + gs_gris)	
// Fin. Sgo.
	pd_dw.Modify("f_alta.protect=1")
	pd_dw.Modify("observacion.protect=1")
END IF


Return 1
end function

public function boolean frn_validar_datos (ref datawindow pd_dw, boolean pi_resuelve_mant);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_validar_datos
//
// Objetivo: Valida datos 
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_resuelve_mant
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF this.frn_v_fechas(pd_dw) THEN
	IF NOT pi_resuelve_mant THEN
		pd_dw.DeleteRow(pd_dw.RowCount())
	END IF
	Return True
ELSE
	Return False
END IF

end function

public function boolean frn_validar_anulacion (ref datawindow pd_dw, long pl_click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_anulacion
// 
// Objetivo: Valida si se anula el retorno de la incidenica de mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//		Salida:   1 anulacion
//					 0 no anulacion		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long  ll_salida
datetime  ld_f_alta
		
			//Valida que mantenimiento no pueda anular la operacion
//si la fecha de EB NO es nula o se derivo a operaciones

ll_salida = pd_dw.Find("ind_env_mant=2",0,pd_dw.RowCount())
IF ll_salida > 0 OR &
	NOT ISNULL(pd_dw.GetItemDateTime(2,"f_alta")) OR &
	NOT fgnu_auto_der_mant() THEN

	gnv_msg.F_mensaje("AG01","","",OK!)

	Return False //NO valida la anulacion
END IF


Return True
end function

public function boolean frn_es_anulacion (ref datawindow pd_dw, integer pl_click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_es_anulacion
// 
// Objetivo: Valida si es anulacion
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: data window
//				
//			Salida:   1 anulacion
//						 0 no anulacion		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_entrada


ll_entrada = pd_dw.GetItemDecimal(pl_click_row,"ind_env_mant")
IF ll_entrada=1 THEN
	Return True
ELSE
	Return False
END IF
end function

public function boolean frn_v_fechas (datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_v_fechas
//
// Objetivo: Valida correlatividad de las fechas
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

long ll_contador,ll_tope,ll_row,ll_derivada_oper,ll_encontre_fecha_nula
DateTime ld_fec_estado1,ld_fec_estado2
Boolean lb_valida,lb_encontre_nulo
string ls_estado1,ls_estado2

lb_encontre_nulo=False
lb_valida=True
ll_contador=1 

pd_dw.AcceptText()
ll_derivada_oper=pd_dw.Find("ind_env_mant=2",0,pd_dw.RowCount())

				//Controla que la incidencia si esta para resolver en mantenimiento 
				//debera ser derivada a operaciones.
ll_tope=pd_dw.RowCount()
DO WHILE ll_contador<=(ll_tope - 1)
	ld_fec_estado1=pd_dw.GetItemDateTime(ll_contador,"f_alta")
	ld_fec_estado2=pd_dw.GetItemDateTime(ll_contador+1,"f_alta")

		//controlo si existe alguna fecha nula
	IF ISNULL(ld_fec_estado1) OR ISNULL(ld_fec_estado2) THEN
		lb_encontre_nulo=True
	END IF

		//si la fecha 1 es mayor a la 2 y ambas no son nulas
	IF ld_fec_estado1>ld_fec_estado2 AND &
		NOT ISNULL(ld_fec_estado1) AND &
		NOT ISNULL(ld_fec_estado2)THEN
		lb_valida=False
		ls_estado1=pd_dw.GetItemString(ll_contador,"Nomenclatura")
		ls_estado2=pd_dw.GetItemString(ll_contador+1,"Nomenclatura")
		gnv_msg.F_mensaje("CI02",ls_estado1,ls_estado2,OK!)
		Exit
	END IF


				//controlo que no exista un afecha valida despues de 
				//haber encontrado un afecha nula
	IF (ISNULL(ld_fec_estado1) AND NOT ISNULL(ld_fec_estado2))THEN
		
		lb_valida=False
		ls_estado1=pd_dw.GetItemString(ll_contador,"Nomenclatura")
		ls_estado2=pd_dw.GetItemString(ll_contador+1,"Nomenclatura")
		gnv_msg.F_mensaje("CI02",ls_estado1,ls_estado2,OK!)
		EXIT
	END IF

	ll_contador++							
LOOP

IF lb_valida THEN
	IF lb_encontre_nulo AND ll_derivada_oper>0 THEN
		lb_valida = False
		gnv_msg.f_mensaje("AI32","","",OK!)
	END IF
END IF

Return lb_valida 
 

end function

public function boolean frn_validar_grabar_est_pr (ref datawindow pd_dw, boolean pb_ind_resuelve_mant);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_validar_grabar_est_pr
//
// Objetivo: Valida para grabar si se deriva en operaciones
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pb_ind_resuelve_mant
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

long ll_row

ll_row=pd_dw.Find("ind_env_mant= "+String(fgci_entrada),0,pd_dw.RowCount())
IF NOT ISNULL(pd_dw.GetItemDateTime(fgci_incidencia_servicio_repuesto,"F_alta")) AND &
		 ISNULL(pd_dw.GetItemDateTime(fgci_incidencia_resuelta,"F_alta")) THEN
	
   IF ll_row=0 AND NOT pb_ind_resuelve_mant THEN //si no se derivo a operaciones
		
		Return FAlSE //No valida para grabar
		gnv_msg.f_mensaje("ER12","","",OK!)
	END IF
		
END IF
	Return True //valida para grabar


end function

public function boolean frn_validar_estado_pr (ref datawindow pd_dw, integer pi_resuelve_mant);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_validar_estado_pr
//
// Objetivo: Valida estados de presentaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_resuelve_mant
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

long ll_row

IF pi_resuelve_mant=0 THEN
	ll_row=pd_dw.Find("nomenclatura='gs_nomenclatura_pr'",0,pd_dw.RowCount())
	IF ll_row > 0 THEN
		IF ISNULL(pd_dw.GetItemDateTime(ll_row,"f_alta")) THEN
			gnv_msg.F_mensaje("CI13","","",OK!)
			Return False
		END IF	
	END IF
END IF

Return True
end function

on u_ema_2001_rn_seguimiento_mantenimiento.create
end on

on u_ema_2001_rn_seguimiento_mantenimiento.destroy
end on


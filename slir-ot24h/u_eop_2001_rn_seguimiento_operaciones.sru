HA$PBExportHeader$u_eop_2001_rn_seguimiento_operaciones.sru
forward
global type u_eop_2001_rn_seguimiento_operaciones from nonvisualobject
end type
end forward

global type u_eop_2001_rn_seguimiento_operaciones from nonvisualobject
end type
global u_eop_2001_rn_seguimiento_operaciones u_eop_2001_rn_seguimiento_operaciones

forward prototypes
public function integer frn_habilitar (ref datawindow pd_dw, boolean pb_habilitar, checkbox pchk_resuelve_mant)
public function boolean frn_v_fechas (ref datawindow pd_dw)
public function boolean frn_validar_anulacion (ref datawindow pd_dw, long pl_click_row)
public function boolean frn_es_anulacion (ref datawindow pd_dw, long pl_click_row)
public function boolean frn_v_fecha_derivacion_mant (ref datawindow pd_dw1, ref datawindow pd_dw2)
public function integer frn_valores_por_defecto (ref datawindow pd_estado_oper, datetime pd_fecha_deteccion, ref datawindow pd_estado)
public function boolean frn_v_fecha_menor_que_actual (ref datawindow pd_dw)
public function boolean frn_validar_salida_oper (ref datawindow pd_dw, ref datawindow pd_dw2, integer pi_est_actual, long pl_click_row)
end prototypes

public function integer frn_habilitar (ref datawindow pd_dw, boolean pb_habilitar, checkbox pchk_resuelve_mant);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_habilitar
// 
// Objetivo: Habilita y Deshabilita los campos de la datawindow
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//					pb_habilitar Ture (habilitar)
//					pb_habilitar False (deshabilitar)			
//		Salida:  		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_contador

IF pb_habilitar THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("f_alta.background.Color ="+string(65536*255+256*255+255))
//	pd_dw.modify("observacion.background.Color ="+string(65536*255+256*255+255))
	pd_dw.modify("f_alta.background.Color =" + gs_blanco)
	pd_dw.modify("observacion.background.Color =" + gs_blanco)
// Fin. Sgo.
	pd_dw.Modify("f_alta.protect=10")
	pd_dw.Modify("observacion.protect=20")
	pchk_resuelve_mant.Enabled=True
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("observacion.background.Color ="+string(65536*192+256*192+192))
//	pd_dw.modify("f_alta.background.Color ="+string(65536*192+256*192+192))	
	pd_dw.modify("observacion.background.Color =" + gs_gris)
	pd_dw.modify("f_alta.background.Color =" + gs_gris)	
// Fin. Sgo.
	pd_dw.Modify("f_alta.protect=1")
	pd_dw.Modify("observacion.protect=1")
	pchk_resuelve_mant.Enabled=False
END IF


Return 1
end function

public function boolean frn_v_fechas (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_v_fechas
//
// Objetivo: Valida la correlatividad de las fechas
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

long ll_contador
DateTime ld_fec_estado1,ld_fec_estado2
Boolean lb_valida
string ls_estado1,ls_estado2

lb_valida=True
ll_contador=1 
pd_dw.AcceptText()
//DO WHILE ll_contador<pd_dw.RowCount()-1
DO WHILE ll_contador<pd_dw.RowCount()
	ld_fec_estado1=pd_dw.GetItemDateTime(ll_contador,"f_alta")
	ld_fec_estado2=pd_dw.GetItemDateTime(ll_contador+1,"f_alta")


									//Controla la correlatividad de las fechas

	IF ld_fec_estado1>ld_fec_estado2 AND NOT ISNULL(ld_fec_estado2) THEN
		lb_valida=False
		ls_estado1=pd_dw.GetItemString(ll_contador,"Nomenclatura")
		ls_estado2=pd_dw.GetItemString(ll_contador+1,"Nomenclatura")
		gnv_msg.F_mensaje("CI02",ls_estado1,ls_estado2,OK!)
		Exit
	END IF
	If ISNULL(ld_fec_estado1) and NOT ISNULL(ld_fec_estado2) THEN
		lb_valida=False
		ls_estado1=pd_dw.GetItemString(ll_contador,"Nomenclatura")
		ls_estado2=pd_dw.GetItemString(ll_contador+1,"Nomenclatura")
		gnv_msg.F_mensaje("CI02",ls_estado1,ls_estado2,OK!)
		Exit
	END IF
	
	//		Valida que las fechas no puedab ser mayores al d$$HEX1$$ed00$$ENDHEX$$a de la fecha
	IF ld_fec_estado2>DateTime(Today(),Now()) THEN
		lb_valida=False
		gnv_msg.F_mensaje("EI24","","",OK!)
		EXIT
	END IF
	
	ll_contador++							
LOOP

Return lb_valida 
 

//	IF ld_fec_estado1>DateTime(Today(),Now()) OR &
//		ld_fec_estado2>DateTime(Today(),Now()) THEN
//		lb_valida=False
////		ls_estado1=pd_dw.GetItemString(ll_contador,"Nomenclatura")
////		ls_estado2=pd_dw.GetItemString(ll_contador+1,"Nomenclatura")
//		gnv_msg.F_mensaje("AG02","","",OK!)
//		Exit
//	END IF
end function

public function boolean frn_validar_anulacion (ref datawindow pd_dw, long pl_click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_anulacion
// 
// Objetivo: Valida si se anula el envio de la incidenica a mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//				
//		Salida:   1 anulacion
//					 0 no anulacion		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_salida
		//si es usuario no es de operaciones
IF Not fgnu_auto_der_oper() THEN
	gnv_msg.F_mensaje("AG01","","",OK!)	
	Return False
END IF

//li_salida = pd_dw.GetItemDecimal(pl_click_row,"ind_env_mant")
//IF li_salida= THEN
//	Return True
//ELSE
//	Return False
//END IF

Return True
end function

public function boolean frn_es_anulacion (ref datawindow pd_dw, long pl_click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_es_anulacion
// 
// Objetivo: Valida si es anulacion 
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//				
//		Salida:   1 anulacion
//					 0 no anulacion		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_entrada
string ls_obs

li_entrada = pd_dw.GetItemDecimal(pl_click_row,"ind_env_mant")
IF li_entrada=2 OR li_entrada=3 THEN
	Return True
ELSE
	Return False
END IF
end function

public function boolean frn_v_fecha_derivacion_mant (ref datawindow pd_dw1, ref datawindow pd_dw2);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_v_fecha_derivaci$$HEX1$$f300$$ENDHEX$$n
//
// Objetivo: Valida fecha de derivaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw1, pd_dw2
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
datetime ld_fec_oper,ld_fec_mant

ll_row=pd_dw1.Find("ind_env_mant="+string(fgci_Salida),0,pd_dw1.rowcount())
IF ll_row>0 THEN
	ld_fec_oper=pd_dw1.GetItemDateTime(ll_row,"f_alta")
	ld_fec_mant= pd_dw2.GetItemDateTime(1,"f_alta")
	IF ld_fec_oper>ld_fec_mant THEN
		Return False
	END IF
END IF


Return True
end function

public function integer frn_valores_por_defecto (ref datawindow pd_estado_oper, datetime pd_fecha_deteccion, ref datawindow pd_estado);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_valores_por_defecto
// 
// Objetivo: Carga en la data window los estados de mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: pd_estado_oper, pd_fecha_deteccion, pd_estado				
//			Salida:
//				
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_usuario,ls_programa,ls_nomenclatura,ls_observacion
datetime ld_f_actual,ld_h_actual
int li_cod_estado
long ll_contador

FOR ll_contador=1 TO pd_estado.RowCount()
	pd_estado_oper.InsertRow(0)
NEXT	
		pd_estado_oper.SetItem(1,"usuario",gs_usuario)
		pd_estado_oper.SetItem(1,"f_actual",fgnu_fecha_actual())
		pd_estado_oper.SetItem(1,"h_actual",fgnu_fecha_actual())
		pd_estado_oper.SetItem(1,"f_alta",pd_fecha_deteccion)
		pd_estado_oper.SetItem(1,"h_alta",pd_fecha_deteccion)
		pd_estado_oper.SetItem(1,"programa","iw_2301")
		pd_estado_oper.SetItem(1,"est_oper",fgci_incidencia_pendiente)
		pd_estado_oper.SetItem(1,"ind_env_mant",0) 		//no enviado
		pd_estado_oper.SetItem(1,"nomenclatura",fgcs_nomenclatura_pt)


pd_estado.Show()
return 1
end function

public function boolean frn_v_fecha_menor_que_actual (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_v_fecha_menor_que_actual
//
// Objetivo: Valida que las fechas de la datawindow sean menores
//				 que la fecha actual
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
// 28/9/96			AFS			
//
///////////////////////////////////////////////////////

long ll_contador
DateTime ld_fec_estado1,ld_fec_actual
Boolean lb_valida
string ls_estado1

ld_fec_actual = fgnu_fecha_actual()
lb_valida=True
ll_contador=1 
pd_dw.AcceptText()

DO WHILE ll_contador <= pd_dw.RowCount()
	ld_fec_estado1=pd_dw.GetItemDateTime(ll_contador,"f_alta")

	IF ld_fec_estado1>ld_fec_actual THEN
		lb_valida=False
		ls_estado1=pd_dw.GetItemString(ll_contador,"Nomenclatura")
		gnv_msg.f_mensaje("CI09",ls_estado1,"",OK!)
		Exit
	END IF
	If ISNULL(ld_fec_estado1) THEN
		Exit
	END IF
	ll_contador++							
LOOP

Return lb_valida 

end function

public function boolean frn_validar_salida_oper (ref datawindow pd_dw, ref datawindow pd_dw2, integer pi_est_actual, long pl_click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_salida_oper
// 
// Objetivo: Valida que pueda enviarse a mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//				
//		Salida:   1 Valida
//					 2 No valida		
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


long ll_row

		//Valiida las fechas 
IF NOT this.frn_v_fechas(pd_dw) THEN
	Return FALSE
END IF
			
		//valida el perfil de usuario
IF NOT fgnu_auto_der_mant() THEN
	gnv_msg.f_mensaje("EG18","","",OK!)
	Return FALSE
END IF

					//valida que no fuese dragueado previamente
ll_row = pd_dw.find("ind_env_mant = "+string(fgci_salida),0,pd_dw.rowCount())
IF ll_row<>0 THEN
	gnv_msg.f_mensaje("AI07","","",OK!)
	Return FALSE //no valida
END IF
		
			//valida el estado en que se deriva
ll_row=pd_dw2.Find("nomenclatura= 'CL'",0,pd_dw2.rowcount())
IF pl_click_row <> ll_row THEN
	ll_row=pd_dw2.Find("nomenclatura='ER'",0,pd_dw2.rowcount())
	IF pl_click_row <> ll_row THEN
		ll_row=pd_dw2.Find("nomenclatura= 'SR'",0,pd_dw2.rowcount())
		IF pl_click_row <> ll_row THEN
			gnv_msg.f_mensaje("AI11","","",OK!)					
			Return FALSE //no valida		
		END IF
	END IF
END IF

return TRUE
end function

on u_eop_2001_rn_seguimiento_operaciones.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_eop_2001_rn_seguimiento_operaciones.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


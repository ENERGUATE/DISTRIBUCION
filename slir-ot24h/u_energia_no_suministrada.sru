HA$PBExportHeader$u_energia_no_suministrada.sru
forward
global type u_energia_no_suministrada from userobject
end type
type dw_fecha from datawindow within u_energia_no_suministrada
end type
type st_1 from statictext within u_energia_no_suministrada
end type
type st_instalacion_sel from statictext within u_energia_no_suministrada
end type
type cb_1 from commandbutton within u_energia_no_suministrada
end type
type dw_energia_no_suministrada from datawindow within u_energia_no_suministrada
end type
type uo_activos from u_activos_mini within u_energia_no_suministrada
end type
type gb_1 from groupbox within u_energia_no_suministrada
end type
type gb_2 from groupbox within u_energia_no_suministrada
end type
type gb_3 from groupbox within u_energia_no_suministrada
end type
end forward

global type u_energia_no_suministrada from userobject
integer width = 3511
integer height = 1700
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_grabar ( )
dw_fecha dw_fecha
st_1 st_1
st_instalacion_sel st_instalacion_sel
cb_1 cb_1
dw_energia_no_suministrada dw_energia_no_suministrada
uo_activos uo_activos
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global u_energia_no_suministrada u_energia_no_suministrada

type variables

date idate_fecha
long il_nro_instalacion

datetime idt_fecha

long il_modificado

boolean ib_modificando_ens = false


end variables

forward prototypes
public subroutine fw_inicializar_activo ()
public subroutine fw_finalizar_modificacion_ens ()
public subroutine fw_iniciar_modificacion_ens ()
public function integer fw_grabar_ens ()
end prototypes

public subroutine fw_inicializar_activo ();
uo_activos.fw_select_fila(1)
uo_activos.TriggerEvent("ue_clicked")
end subroutine

public subroutine fw_finalizar_modificacion_ens ();
long ll_status
string ls_mensaje

if ib_modificando_ens = true then 
	
	ib_modificando_ens = false	

//	dw_energia_no_suministrada.Modify("hora_2_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_3_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_3_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_4_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_4_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_5_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_5_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_6_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_6_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_7_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_7_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_8_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_8_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_9_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_9_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_10_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_10_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_11_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_11_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_12_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_12_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_13_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_13_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_14_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_14_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_15_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_15_ens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_16_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_16_ens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_17_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_17_ens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_18_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_18_ens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_19_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_19_ens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_20_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_20_ens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_21_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_21_ens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_22_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_22_ens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_23_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_23_ens.background.Color="+gs_gris)
//	dw_energia_no_suministrada.Modify('hora_24_ens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_24_ens.background.Color="+gs_gris)
//	
//	dw_energia_no_suministrada.Modify('hora_1_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_1_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_2_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_2_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_3_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_3_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_4_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_4_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_5_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_5_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_6_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_6_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_7_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_7_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_8_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_8_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_9_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_9_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_10_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_10_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_11_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_11_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_12_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_12_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_13_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_13_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_14_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_14_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_15_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_15_pens.background.Color="+gs_gris)                                                                                  
//	dw_energia_no_suministrada.Modify('hora_16_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_16_pens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_17_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_17_pens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_18_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_18_pens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_19_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_19_pens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_20_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_20_pens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_21_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_21_pens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_22_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_22_pens.background.Color="+gs_gris)
// 	dw_energia_no_suministrada.Modify('hora_23_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_23_pens.background.Color="+gs_gris)
//	dw_energia_no_suministrada.Modify('hora_24_pens.protect = 1')              
//	dw_energia_no_suministrada.Modify("hora_24_pens.background.Color="+gs_gris)
			
end if


end subroutine

public subroutine fw_iniciar_modificacion_ens ();//long ll_status, ll_null, ll_tipo_movimiento
//string ls_mensaje
//datetime ldt_null
//
//setnull(ldt_null)
//setnull(ll_null)
//
//if ib_modificando_ens = false then 
//
//	ib_modificando_ens = true
//	
//	dw_energia_no_suministrada.object.nro_instalacion[1] = il_nro_instalacion
//	dw_energia_no_suministrada.object.fecha[1] = idt_fecha
//			
//end if
//
//
end subroutine

public function integer fw_grabar_ens ();int li_return = 0
long ll_status
dwItemStatus ldwis_variacion_disponibilidad


dw_energia_no_suministrada.AcceptText()

ldwis_variacion_disponibilidad = dw_energia_no_suministrada.GetItemStatus(1, 0, Primary!)

if ib_modificando_ens and &
	not isnull(dw_energia_no_suministrada.object.codigo_activo[1]) and &
	il_nro_instalacion <> 0 then  	
	
//	// Falla la grabaci$$HEX1$$f300$$ENDHEX$$n y no s$$HEX2$$e9002000$$ENDHEX$$por qu$$HEX1$$e900$$ENDHEX$$. Probamos un m$$HEX1$$e900$$ENDHEX$$todo alternativo
//	datastore lds_grabar_ens
//	long ll_rows
//	lds_grabar_ens = CREATE datastore
//	
//	lds_grabar_ens.dataobject = 'd_stn_energia_no_suministrada'
//	lds_grabar_ens.SetTransObject(SQLCA)
//	
//	SELECT count(*) 
//	  INTO :ll_rows
//	  FROM GI_ENERGIA_NO_SUMINISTRADA
//	 WHERE CODIGO_ACTIVO = :il_nro_instalacion
//	   AND FECHA = :idate_fecha;
//	
//	if ll_rows = 0 then 
//		lds_grabar_ens.InsertRow(0)
//		lds_grabar_ens.object.fecha[1] = idate_fecha
//		lds_grabar_ens.object.codigo_activo[1] = il_nro_instalacion	
//
//	else
//		lds_grabar_ens.Retrieve(il_nro_instalacion, idate_fecha)
//	end if
//	
//	if not isnull(dw_energia_no_suministrada.object.hora_1_ens[1]) then 
//		lds_grabar_ens.object.hora_1_ens[1] = dw_energia_no_suministrada.object.hora_1_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_2_ens[1]) then 
//		lds_grabar_ens.object.hora_2_ens[1] = dw_energia_no_suministrada.object.hora_2_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_3_ens[1]) then 
//		lds_grabar_ens.object.hora_3_ens[1] = dw_energia_no_suministrada.object.hora_3_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_4_ens[1]) then 
//		lds_grabar_ens.object.hora_4_ens[1] = dw_energia_no_suministrada.object.hora_4_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_5_ens[1]) then 
//		lds_grabar_ens.object.hora_5_ens[1] = dw_energia_no_suministrada.object.hora_5_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_6_ens[1]) then 
//		lds_grabar_ens.object.hora_6_ens[1] = dw_energia_no_suministrada.object.hora_6_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_7_ens[1]) then 
//		lds_grabar_ens.object.hora_7_ens[1] = dw_energia_no_suministrada.object.hora_7_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_8_ens[1]) then 
//		lds_grabar_ens.object.hora_8_ens[1] = dw_energia_no_suministrada.object.hora_8_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_9_ens[1]) then 
//		lds_grabar_ens.object.hora_9_ens[1] = dw_energia_no_suministrada.object.hora_9_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_10_ens[1]) then 
//		lds_grabar_ens.object.hora_10_ens[1] = dw_energia_no_suministrada.object.hora_10_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_11_ens[1]) then 
//		lds_grabar_ens.object.hora_11_ens[1] = dw_energia_no_suministrada.object.hora_11_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_12_ens[1]) then 
//		lds_grabar_ens.object.hora_12_ens[1] = dw_energia_no_suministrada.object.hora_12_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_13_ens[1]) then 
//		lds_grabar_ens.object.hora_13_ens[1] = dw_energia_no_suministrada.object.hora_13_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_14_ens[1]) then 
//		lds_grabar_ens.object.hora_14_ens[1] = dw_energia_no_suministrada.object.hora_14_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_15_ens[1]) then 
//		lds_grabar_ens.object.hora_15_ens[1] = dw_energia_no_suministrada.object.hora_15_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_16_ens[1]) then 
//		lds_grabar_ens.object.hora_16_ens[1] = dw_energia_no_suministrada.object.hora_16_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_17_ens[1]) then 
//		lds_grabar_ens.object.hora_17_ens[1] = dw_energia_no_suministrada.object.hora_17_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_18_ens[1]) then 
//		lds_grabar_ens.object.hora_18_ens[1] = dw_energia_no_suministrada.object.hora_18_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_19_ens[1]) then 
//		lds_grabar_ens.object.hora_19_ens[1] = dw_energia_no_suministrada.object.hora_19_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_20_ens[1]) then 
//		lds_grabar_ens.object.hora_20_ens[1] = dw_energia_no_suministrada.object.hora_20_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_21_ens[1]) then 
//		lds_grabar_ens.object.hora_21_ens[1] = dw_energia_no_suministrada.object.hora_21_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_22_ens[1]) then 
//		lds_grabar_ens.object.hora_22_ens[1] = dw_energia_no_suministrada.object.hora_22_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_23_ens[1]) then 
//		lds_grabar_ens.object.hora_23_ens[1] = dw_energia_no_suministrada.object.hora_23_ens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_24_ens[1]) then 
//		lds_grabar_ens.object.hora_24_ens[1] = dw_energia_no_suministrada.object.hora_24_ens[1]	
//	end if
//	
//	if not isnull(dw_energia_no_suministrada.object.hora_1_pens[1]) then 
//		lds_grabar_ens.object.hora_1_pens[1] = dw_energia_no_suministrada.object.hora_1_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_2_pens[1]) then 
//		lds_grabar_ens.object.hora_2_pens[1] = dw_energia_no_suministrada.object.hora_2_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_3_pens[1]) then 
//		lds_grabar_ens.object.hora_3_pens[1] = dw_energia_no_suministrada.object.hora_3_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_4_pens[1]) then 
//		lds_grabar_ens.object.hora_4_pens[1] = dw_energia_no_suministrada.object.hora_4_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_5_pens[1]) then 
//		lds_grabar_ens.object.hora_5_pens[1] = dw_energia_no_suministrada.object.hora_5_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_6_pens[1]) then 
//		lds_grabar_ens.object.hora_6_pens[1] = dw_energia_no_suministrada.object.hora_6_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_7_pens[1]) then 
//		lds_grabar_ens.object.hora_7_pens[1] = dw_energia_no_suministrada.object.hora_7_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_8_pens[1]) then 
//		lds_grabar_ens.object.hora_8_pens[1] = dw_energia_no_suministrada.object.hora_8_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_9_pens[1]) then 
//		lds_grabar_ens.object.hora_9_pens[1] = dw_energia_no_suministrada.object.hora_9_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_10_pens[1]) then 
//		lds_grabar_ens.object.hora_10_pens[1] = dw_energia_no_suministrada.object.hora_10_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_11_pens[1]) then 
//		lds_grabar_ens.object.hora_11_pens[1] = dw_energia_no_suministrada.object.hora_11_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_12_pens[1]) then 
//		lds_grabar_ens.object.hora_12_pens[1] = dw_energia_no_suministrada.object.hora_12_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_13_pens[1]) then 
//		lds_grabar_ens.object.hora_13_pens[1] = dw_energia_no_suministrada.object.hora_13_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_14_pens[1]) then 
//		lds_grabar_ens.object.hora_14_pens[1] = dw_energia_no_suministrada.object.hora_14_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_15_pens[1]) then 
//		lds_grabar_ens.object.hora_15_pens[1] = dw_energia_no_suministrada.object.hora_15_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_16_pens[1]) then 
//		lds_grabar_ens.object.hora_16_pens[1] = dw_energia_no_suministrada.object.hora_16_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_17_pens[1]) then 
//		lds_grabar_ens.object.hora_17_pens[1] = dw_energia_no_suministrada.object.hora_17_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_18_pens[1]) then 
//		lds_grabar_ens.object.hora_18_pens[1] = dw_energia_no_suministrada.object.hora_18_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_19_pens[1]) then 
//		lds_grabar_ens.object.hora_19_pens[1] = dw_energia_no_suministrada.object.hora_19_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_20_pens[1]) then 
//		lds_grabar_ens.object.hora_20_pens[1] = dw_energia_no_suministrada.object.hora_20_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_21_pens[1]) then 
//		lds_grabar_ens.object.hora_21_pens[1] = dw_energia_no_suministrada.object.hora_21_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_22_pens[1]) then 
//		lds_grabar_ens.object.hora_22_pens[1] = dw_energia_no_suministrada.object.hora_22_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_23_pens[1]) then 
//		lds_grabar_ens.object.hora_23_pens[1] = dw_energia_no_suministrada.object.hora_23_pens[1]	
//	end if
//	if not isnull(dw_energia_no_suministrada.object.hora_24_pens[1]) then 
//		lds_grabar_ens.object.hora_24_ens[1] = dw_energia_no_suministrada.object.hora_24_ens[1]	
//	end if
//	
//	lds_grabar_ens.AcceptText()
//	
//	
//	dw_energia_no_suministrada.Reset()
//	
//	ll_status = lds_grabar_ens.Update()
//	if ll_status = 1 then 
//		li_return = 0
//		commit;
//
//		ldwis_variacion_disponibilidad = dw_energia_no_suministrada.GetItemStatus(1, 0, Primary!)
//		
//		fw_finalizar_modificacion_ens()
//		
//		dw_energia_no_suministrada.Reset()
//		dw_energia_no_suministrada.Retrieve(il_nro_instalacion, idate_fecha)
//				
//	else
//		messagebox("Error al actualizar la Energ$$HEX1$$ed00$$ENDHEX$$a No Suministrada",sqlca.sqlerrtext)
//		rollback;
//		li_return = -1
//	end if
//	
//	destroy lds_grabar_ens
	
	ll_status = dw_energia_no_suministrada.Update(true,true)
	if ll_status = 1 then 
		li_return = 0
		commit;
	//gnu_u_transaction.uf_commit()	

		ldwis_variacion_disponibilidad = dw_energia_no_suministrada.GetItemStatus(1, 0, Primary!)
		
		fw_finalizar_modificacion_ens()
		
		dw_energia_no_suministrada.Reset()
		dw_energia_no_suministrada.Retrieve(il_nro_instalacion, idt_fecha)
				
	else
		messagebox("Error al actualizar la Energ$$HEX1$$ed00$$ENDHEX$$a No Suministrada",sqlca.sqlerrtext)
		rollback;
		//gnu_u_transaction.uf_rollback()	
		li_return = -1
	end if
	
	//this.Postevent('ue_grabar')
	
end if
	

return li_return


end function

on u_energia_no_suministrada.create
this.dw_fecha=create dw_fecha
this.st_1=create st_1
this.st_instalacion_sel=create st_instalacion_sel
this.cb_1=create cb_1
this.dw_energia_no_suministrada=create dw_energia_no_suministrada
this.uo_activos=create uo_activos
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.dw_fecha,&
this.st_1,&
this.st_instalacion_sel,&
this.cb_1,&
this.dw_energia_no_suministrada,&
this.uo_activos,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on u_energia_no_suministrada.destroy
destroy(this.dw_fecha)
destroy(this.st_1)
destroy(this.st_instalacion_sel)
destroy(this.cb_1)
destroy(this.dw_energia_no_suministrada)
destroy(this.uo_activos)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event constructor;
idate_fecha = today()
idt_fecha =datetime(idate_fecha)
il_modificado = 0

//fw_inicializar_activo()

end event

type dw_fecha from datawindow within u_energia_no_suministrada
integer x = 73
integer y = 140
integer width = 526
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "d_fecha"
boolean border = false
boolean livescroll = true
end type

event constructor;
this.SetTransObject(SQLCA)
this.InsertRow(0)

this.object.fecha[1] = idate_fecha




end event

event itemchanged;
long ll_nro_instalacion, ll_null, ll_status= 0, ll_rows
string ls_nombre_instalacion
int  li_grabacion_correcta = 0
int  li_ens
dwItemStatus ldwis_variacion_ens

if not isnull(il_nro_instalacion) and il_nro_instalacion <> 0 then 
	
	if ib_modificando_ens then 	
		ll_status = messagebox("", "Ha habido cambios en la Energ$$HEX1$$ed00$$ENDHEX$$a No Suministrada. $$HEX1$$bf00$$ENDHEX$$Desea salvarlos?", Exclamation!, YesNo!)	
		if ll_status = 1 then 	
			li_grabacion_correcta = fw_grabar_ens()
		else
			ib_modificando_ens = false
		end if	
	end if
			
	if li_grabacion_correcta = 0 then 
		this.AcceptText()
		idate_fecha = this.object.fecha[1]
		idt_fecha =datetime(idate_fecha)

		dw_energia_no_suministrada.Reset()
		ll_rows = dw_energia_no_suministrada.Retrieve(il_nro_instalacion, idt_fecha)
		
		if ll_rows <> 1 then 
			dw_energia_no_suministrada.Reset()
			dw_energia_no_suministrada.InsertRow(0)
			dw_energia_no_suministrada.object.codigo_activo[1] = il_nro_instalacion
			dw_energia_no_suministrada.object.fecha[1] = idt_fecha	
		end if
	end if
		
else
	this.AcceptText()
	idate_fecha = this.object.fecha[1]
	idt_fecha =datetime(idate_fecha)
	
end if	
		
end event

type st_1 from statictext within u_energia_no_suministrada
integer x = 82
integer y = 60
integer width = 343
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
boolean focusrectangle = false
end type

type st_instalacion_sel from statictext within u_energia_no_suministrada
integer x = 2103
integer width = 928
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within u_energia_no_suministrada
integer x = 3109
integer y = 1584
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Grabar"
end type

event clicked;

fw_grabar_ens()

end event

type dw_energia_no_suministrada from datawindow within u_energia_no_suministrada
integer x = 2213
integer y = 72
integer width = 782
integer height = 1600
integer taborder = 30
string title = "none"
string dataobject = "d_stn_energia_no_suministrada"
boolean border = false
boolean livescroll = true
end type

event constructor;
dwItemStatus ldwis_variacion_ens

this.SetTransObject(SQLCA)

this.Reset()
this.InsertRow(0)

idt_fecha = datetime(idate_fecha)
this.object.fecha[1] = idt_fecha

end event

event itemchanged;
long ll_rows
dwitemstatus ldwis_variacion_ens
this.AcceptText()

if il_nro_instalacion <> 0 then 
	ib_modificando_ens = true
end if

end event

type uo_activos from u_activos_mini within u_energia_no_suministrada
integer x = 763
integer y = 56
integer width = 1234
integer height = 1600
integer taborder = 30
end type

on uo_activos.destroy
call u_activos_mini::destroy
end on

event ue_clicked;call super::ue_clicked;long ll_nro_instalacion, ll_null, ll_status= 0, ll_rows
string ls_nombre_instalacion
int  li_grabacion_correcta = 0
int  li_ens
dwItemStatus ldwis_variacion_ens

setnull(ll_null)

ldwis_variacion_ens = dw_energia_no_suministrada.GetItemStatus(1,0, Primary!)

if ib_modificando_ens then 

	ll_status = messagebox("", "Ha habido cambios en la Energ$$HEX1$$ed00$$ENDHEX$$a No Suministrada. $$HEX1$$bf00$$ENDHEX$$Desea salvarlos?", Exclamation!, YesNo!)	
	if ll_status = 1 then 	
		li_grabacion_correcta = fw_grabar_ens()
	else
		ib_modificando_ens = false
	end if	
end if

if li_grabacion_correcta = 0 then 
	
	il_nro_instalacion = uf_get_nro_instalacion()
	ls_nombre_instalacion = uf_get_nombre_instalacion()
	st_instalacion_sel.text = ls_nombre_instalacion
	
	dw_energia_no_suministrada.Reset()
	ll_rows = dw_energia_no_suministrada.Retrieve(il_nro_instalacion, idt_fecha)
	ldwis_variacion_ens = dw_energia_no_suministrada.GetItemStatus(1,0, Primary!)
	
	if ll_rows <> 1 then 
		dw_energia_no_suministrada.Reset()
		ldwis_variacion_ens = dw_energia_no_suministrada.GetItemStatus(1,0, Primary!)

		dw_energia_no_suministrada.InsertRow(0)
		dw_energia_no_suministrada.object.fecha[1] = idt_fecha
		dw_energia_no_suministrada.object.codigo_activo[1] = il_nro_instalacion	
		ldwis_variacion_ens = dw_energia_no_suministrada.GetItemStatus(1,0, Primary!)

	end if
end if
	

	
end event

event constructor;call super::constructor;

idate_fecha = today()
idt_fecha = datetime(idate_fecha)
il_modificado = 0

//fw_inicializar_activo()

end event

type gb_1 from groupbox within u_energia_no_suministrada
integer x = 2103
integer y = 40
integer width = 933
integer height = 1644
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within u_energia_no_suministrada
integer x = 736
integer width = 1280
integer height = 1680
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within u_energia_no_suministrada
integer x = 23
integer width = 635
integer height = 284
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type


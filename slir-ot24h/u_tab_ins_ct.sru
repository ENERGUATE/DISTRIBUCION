HA$PBExportHeader$u_tab_ins_ct.sru
forward
global type u_tab_ins_ct from tab
end type
type tabpage_3 from userobject within u_tab_ins_ct
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within u_tab_ins_ct
dw_3 dw_3
end type
type tabpage_2 from userobject within u_tab_ins_ct
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within u_tab_ins_ct
dw_2 dw_2
end type
type tabpage_1 from userobject within u_tab_ins_ct
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within u_tab_ins_ct
dw_1 dw_1
end type
type tabpage_4 from userobject within u_tab_ins_ct
end type
type dw_4 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within u_tab_ins_ct
dw_4 dw_4
end type
end forward

global type u_tab_ins_ct from tab
integer width = 2523
integer height = 1200
integer taborder = 1
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean powertips = true
integer selectedtab = 1
tabpage_3 tabpage_3
tabpage_2 tabpage_2
tabpage_1 tabpage_1
tabpage_4 tabpage_4
end type
global u_tab_ins_ct u_tab_ins_ct

type variables
boolean ib_modifico
boolean ib_alta
end variables

forward prototypes
public function integer f_obtener_datos (decimal pdec_nro_instalacion)
public function integer f_deshabilitar_campos ()
public function integer f_modificar ()
public function integer f_dar_alta (decimal pd_inst)
public function integer f_preparar_alta ()
end prototypes

public function integer f_obtener_datos (decimal pdec_nro_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_obtener_datos
// 
// Objetivo:	Realiza el retrive de las DW y si no encontrara datos, inserta una fila 
//					en blanco
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: 
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	11/02/1997		FDB	    Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
date ld_hoy=today()
time lt_hoy=now()
dec ld_instal

 SELECT "DETALLES_INSTALACION"."INSTALLATION_NO"  
    INTO :ld_instal  
    FROM "DETALLES_INSTALACION"  
 WHERE "DETALLES_INSTALACION"."INSTALLATION_NO" = :pdec_nro_instalacion   ;


this.tabpage_1.dw_1.settransobject(sqlca)
this.tabpage_2.dw_2.settransobject(sqlca)
this.tabpage_3.dw_3.settransobject(sqlca)
this.tabpage_4.dw_4.settransobject(sqlca)

if ld_instal>0 then
	ib_alta=false
	this.tabpage_1.dw_1.retrieve(pdec_nro_instalacion) 
	this.tabpage_2.dw_2.retrieve(pdec_nro_instalacion) 	
	this.tabpage_3.dw_3.retrieve(pdec_nro_instalacion)
	this.tabpage_4.dw_4.retrieve(pdec_nro_instalacion)

else
	this.tabpage_4.dw_4.setredraw(false)
	ib_alta=true
	w_3301_detalle_instalacion.cb_borrar.visible=false
	this.tabpage_1.dw_1.insertrow(0)
	this.tabpage_2.dw_2.insertrow(0)
	this.tabpage_3.dw_3.insertrow(0)
	this.tabpage_4.dw_4.insertrow(0)
	f_preparar_alta()
	this.tabpage_4.dw_4.SETITEM(1,"COMM_DATE",DATETIME(ld_hoy, lt_hoy))
	this.tabpage_4.dw_4.SETITEM(1,"DATE_REC",DATETIME(ld_hoy, lt_hoy))
	this.tabpage_4.dw_4.setredraw(true)
end if


	
return 1

end function

public function integer f_deshabilitar_campos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos de....  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//	en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: 
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	11/02/1997		FDB	    Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//// deshabilita datawindows1
//	    tabpage_1.dw_1.modify("phase_rot.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("phase_rot",0)
//	    tabpage_1.dw_1.modify("surge_diverter.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("surge_diverter",0)
//	    tabpage_1.dw_1.modify("circuits_no.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("circuits_no",0)
//	    tabpage_1.dw_1.modify("tap_position.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("tap_position",0)
//	    tabpage_1.dw_1.modify("type_earth.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("type_earth",0)
//	    tabpage_1.dw_1.modify("hv_value.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("hv_value",0)
//	    tabpage_1.dw_1.modify("lv_value.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("lv_value",0)
//	    tabpage_1.dw_1.modify("comb_earth.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("comb_earth",0)
//	    tabpage_1.dw_1.modify("subest_type.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("subest_type",0)
//	   
//// deshabilita datawindows 2
//
// 		 tabpage_2.dw_2.modify("hsar.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("hsar",0)
//	    tabpage_2.dw_2.modify("outdoor_det.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("outdoor_det",0)
//	    tabpage_2.dw_2.modify("r_n.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("r_n",0)
//	    tabpage_2.dw_2.modify("y_n.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("y_n",0)
//	    tabpage_2.dw_2.modify("b_n.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("b_n",0)
//	    tabpage_2.dw_2.modify("isolation.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("isolation",0)
//	    tabpage_2.dw_2.modify("med_voltage.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("med_voltage",0)
//		 tabpage_2.dw_2.modify("low_voltage.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("low_voltage",0)
//		 tabpage_2.dw_2.modify("r_y.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("r_y",0)
//		 tabpage_2.dw_2.modify("y_b.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("y_b",0)
//		 tabpage_2.dw_2.modify("b_r.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("b_r",0)
//		 
//// deshabilita datawindows3
//
//       tabpage_3.dw_3.modify("DRAWING_NO.background.color=" + string(65536*192+256*192+192))
//       tabpage_3.dw_3.SetTabOrder("DRAWING_NO",0)
//	    tabpage_3.dw_3.modify("schem_num.background.color=" + string(65536*192+256*192+192))
//       tabpage_3.dw_3.SetTabOrder("schem_num",0)
//	    tabpage_3.dw_3.modify("geo_drawing_no.background.color=" + string(65536*192+256*192+192))
//       tabpage_3.dw_3.SetTabOrder("geo_drawing_no",0)
//	    tabpage_3.dw_3.modify("aces.background.color=" + string(65536*192+256*192+192))
//       tabpage_3.dw_3.SetTabOrder("aces",0)
//	    tabpage_3.dw_3.modify("road_access.background.color=" + string(65536*192+256*192+192))
//       tabpage_3.dw_3.SetTabOrder("road_access",0)
//	    tabpage_3.dw_3.modify("crane_req.background.color=" + string(65536*192+256*192+192))
//       tabpage_3.dw_3.SetTabOrder("crane_req",0)
//		 
//// deshabilita datawindows 4
//
// 		 tabpage_4.dw_4.modify("expansion.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("expansion",0)
//	    tabpage_4.dw_4.modify("comm_date.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("comm_date",0)
//	    tabpage_4.dw_4.modify("type_mount.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("type_mount",0)
//	    tabpage_4.dw_4.modify("structure.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("structure",0)
//	    tabpage_4.dw_4.modify("weather.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("weather",0)
//	    tabpage_4.dw_4.modify("max_load_rec.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("max_load_rec",0)
//	    tabpage_4.dw_4.modify("date_rec.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("date_rec",0)
//		 tabpage_4.dw_4.modify("soil.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("soil",0)
//		 tabpage_4.dw_4.modify("bet_isolator.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("bet_isolator",0)
//		 tabpage_4.dw_4.modify("int_order.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("int_order",0)
//		 tabpage_4.dw_4.modify("cost_centre.background.color=" + string(65536*192+256*192+192))
//       tabpage_4.dw_4.SetTabOrder("cost_centre",0)
//return 1

// deshabilita datawindows1
	    tabpage_1.dw_1.modify("phase_rot.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("phase_rot",0)
	    tabpage_1.dw_1.modify("surge_diverter.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("surge_diverter",0)
	    tabpage_1.dw_1.modify("circuits_no.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("circuits_no",0)
	    tabpage_1.dw_1.modify("tap_position.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("tap_position",0)
	    tabpage_1.dw_1.modify("type_earth.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("type_earth",0)
	    tabpage_1.dw_1.modify("hv_value.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("hv_value",0)
	    tabpage_1.dw_1.modify("lv_value.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("lv_value",0)
	    tabpage_1.dw_1.modify("comb_earth.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("comb_earth",0)
	    tabpage_1.dw_1.modify("subest_type.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("subest_type",0)
	   
// deshabilita datawindows 2

 		 tabpage_2.dw_2.modify("hsar.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("hsar",0)
	    tabpage_2.dw_2.modify("outdoor_det.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("outdoor_det",0)
	    tabpage_2.dw_2.modify("r_n.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("r_n",0)
	    tabpage_2.dw_2.modify("y_n.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("y_n",0)
	    tabpage_2.dw_2.modify("b_n.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("b_n",0)
	    tabpage_2.dw_2.modify("isolation.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("isolation",0)
	    tabpage_2.dw_2.modify("med_voltage.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("med_voltage",0)
		 tabpage_2.dw_2.modify("low_voltage.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("low_voltage",0)
		 tabpage_2.dw_2.modify("r_y.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("r_y",0)
		 tabpage_2.dw_2.modify("y_b.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("y_b",0)
		 tabpage_2.dw_2.modify("b_r.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("b_r",0)
		 
// deshabilita datawindows3

       tabpage_3.dw_3.modify("DRAWING_NO.background.color=" + gs_gris)
       tabpage_3.dw_3.SetTabOrder("DRAWING_NO",0)
	    tabpage_3.dw_3.modify("schem_num.background.color=" + gs_gris)
       tabpage_3.dw_3.SetTabOrder("schem_num",0)
	    tabpage_3.dw_3.modify("geo_drawing_no.background.color=" + gs_gris)
       tabpage_3.dw_3.SetTabOrder("geo_drawing_no",0)
	    tabpage_3.dw_3.modify("aces.background.color=" + gs_gris)
       tabpage_3.dw_3.SetTabOrder("aces",0)
	    tabpage_3.dw_3.modify("road_access.background.color=" + gs_gris)
       tabpage_3.dw_3.SetTabOrder("road_access",0)
	    tabpage_3.dw_3.modify("crane_req.background.color=" + gs_gris)
       tabpage_3.dw_3.SetTabOrder("crane_req",0)
		 
// deshabilita datawindows 4

 		 tabpage_4.dw_4.modify("expansion.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("expansion",0)
	    tabpage_4.dw_4.modify("comm_date.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("comm_date",0)
	    tabpage_4.dw_4.modify("type_mount.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("type_mount",0)
	    tabpage_4.dw_4.modify("structure.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("structure",0)
	    tabpage_4.dw_4.modify("weather.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("weather",0)
	    tabpage_4.dw_4.modify("max_load_rec.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("max_load_rec",0)
	    tabpage_4.dw_4.modify("date_rec.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("date_rec",0)
		 tabpage_4.dw_4.modify("soil.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("soil",0)
		 tabpage_4.dw_4.modify("bet_isolator.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("bet_isolator",0)
		 tabpage_4.dw_4.modify("int_order.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("int_order",0)
		 tabpage_4.dw_4.modify("cost_centre.background.color=" + gs_gris)
       tabpage_4.dw_4.SetTabOrder("cost_centre",0)
return 1
// Fin. Sgo.
end function

public function integer f_modificar ();    string ls_hsar
	 ls_hsar=tabpage_2.dw_2.GETITEMSTRING(1,"hsar")
	 string LS_COST
	 LS_COST=tabpage_4.dw_4.GETITEMSTRING(1,"cost_centre")
	 string ls_intorder
	 ls_intorder=tabpage_4.dw_4.GETITEMSTRING(1,"int_order")
	 string ls_bet
	 ls_bet=tabpage_4.dw_4.GETITEMSTRING(1,"bet_isolator")
	 String ls_drawing
	 ls_drawing=tabpage_3.dw_3.GETITEMSTRING(1,"drawing_no")
	 string ls_schem
	 ls_schem=tabpage_3.dw_3.GETITEMSTRING(1,"schem_num")
	 string ls_geo
	 ls_geo=tabpage_3.dw_3.GETITEMSTRING(1,"geo_drawing_no")
	 LONG ll_subest
	 ll_subest=tabpage_1.dw_1.GETITEMnumber(1,"subest_type")
	 LONG ll_phase
	 ll_phase=tabpage_1.dw_1.GETITEMnumber(1,"phase_rot")
	 LONG ll_isolation
	 ll_isolation=tabpage_2.dw_2.GETITEMnumber(1,"isolation")
	 LONG ll_surge
	 ll_surge=tabpage_1.dw_1.GETITEMnumber(1,"surge_diverter")
	 LONG ll_expansion
	 ll_expansion=tabpage_4.dw_4.GETITEMnumber(1,"expansion")
	 LONG ll_typem
	 ll_typem=tabpage_4.dw_4.GETITEMnumber(1,"type_mount")
	 LONG ll_structure
	 ll_structure=tabpage_4.dw_4.GETITEMnumber(1,"structure")
	 LONG ll_outd
	 ll_outd=tabpage_2.dw_2.GETITEMnumber(1,"outdoor_det")
	 LONG ll_rn
	 ll_rn=tabpage_2.dw_2.GETITEMnumber(1,"r_n")
	 LONG ll_yn
	 ll_yn=tabpage_2.dw_2.GETITEMnumber(1,"y_n")
	 LONG ll_bn
	 ll_bn=tabpage_2.dw_2.GETITEMnumber(1,"b_n")
	 LONG ll_circuits
	 ll_circuits=tabpage_1.dw_1.GETITEMnumber(1,"circuits_no")
	 LONG ll_weather
	 ll_weather=tabpage_4.dw_4.GETITEMnumber(1,"weather")
	 LONG ll_max
	 ll_max=tabpage_4.dw_4.GETITEMnumber(1,"max_load_rec")
	 LONG ll_access
	 ll_access=tabpage_3.dw_3.GETITEMnumber(1,"aces")
	 LONG ll_road
	 ll_road=tabpage_3.dw_3.GETITEMnumber(1,"road_access")
	 LONG ll_crane
	 ll_crane=tabpage_3.dw_3.GETITEMnumber(1,"crane_req")
	 LONG ll_tappos
	 ll_tappos=tabpage_1.dw_1.GETITEMnumber(1,"tap_position")
	 LONG ll_medvol
	 ll_medvol=tabpage_2.dw_2.GETITEMnumber(1,"med_voltage")
	 LONG ll_lowvol
	 ll_lowvol=tabpage_2.dw_2.GETITEMnumber(1,"low_voltage")
	 LONG ll_ry
	 ll_ry=tabpage_2.dw_2.GETITEMnumber(1,"r_y")
	 LONG ll_yb
	 ll_yb=tabpage_2.dw_2.GETITEMnumber(1,"y_b")
	 LONG ll_br
	 ll_br=tabpage_2.dw_2.GETITEMnumber(1,"b_r")
	 LONG ll_typee
	 ll_typee=tabpage_1.dw_1.GETITEMnumber(1,"type_earth")
	 LONG ll_hvval
	 ll_hvval=tabpage_1.dw_1.GETITEMnumber(1,"hv_value")
	 LONG ll_lvval
	 ll_lvval=tabpage_1.dw_1.GETITEMnumber(1,"lv_value")
	 LONG ll_combe
	 ll_combe=tabpage_1.dw_1.GETITEMnumber(1,"comb_earth")
	 LONG ll_soil
	 ll_soil=tabpage_4.dw_4.GETITEMnumber(1,"soil")
	 DATETIME ld_comm
	 ld_comm=tabpage_4.dw_4.GETITEMdateTIME(1,"COMM_DATE")
	 DATETIME ld_daterec
	 ld_daterec=tabpage_4.dw_4.GETITEMdateTIME(1,"DATE_REC")
	 
	 
  UPDATE "DETALLES_INSTALACION"  
     SET "HSAR" = :LS_HSAR,
         "DRAWING_NO" = :LS_DRAWING,   
         "SCHEM_NUM" = :ls_SCHEM,   
         "GEO_DRAWING_NO" = :LS_GEO,   
         "PHASE_ROT" = :LL_PHASE,   
         "COMM_DATE" = :LD_COMM,   
         "ISOLATION" = :LL_ISOLATION,   
         "SURGE_DIVERTER" = :LL_SURGE,   
         "EXPANSION" = :LL_EXPANSION,   
         "TYPE_MOUNT" = :LL_TYPEM,   
         "STRUCTURE" = :LL_STRUCTURE,   
         "OUTDOOR_DET" = :LL_OUTD,   
         "R_N" = :LL_RN,   
         "Y_N" = :LL_YN,   
         "B_N" = :LL_BN,   
         "CIRCUITS_NO" = :LL_CIRCUITS,   
         "WEATHER" = :LL_WEather,   
         "MAX_LOAD_REC" = :ll_max,   
         "DATE_REC" = :ld_daterec,   
         "ACES" = :ll_access,   
         "ROAD_ACCESS" = :ll_road,   
         "CRANE_REQ" = :ll_crane,   
         "TAP_POSITION" = :ll_tappos,   
         "MED_VOLTAGE" = :ll_medvol,   
         "LOW_VOLTAGE" = :ll_lowvol,   
         "R_Y" = :ll_ry,   
         "Y_B" = :ll_yb,   
         "B_R" = :ll_br,   
         "TYPE_EARTH" = :ll_typee,   
         "HV_VALUE" = :ll_hvval,   
         "LV_VALUE" = :ll_lvval,   
         "COMB_EARTH" = :ll_combe,   
         "SOIL" = :ll_soil,
			"BET_ISOLATOR" =:ls_bet,
			"INT_ORDER"=:ls_intorder,
			"SUBEST_TYPE"=:ll_subest, 
  			"COST_CENTRE"=:LS_COST;
 return 1
  
     

end function

public function integer f_dar_alta (decimal pd_inst);	dec ld_instalacion_no
	ld_instalacion_no=pd_inst
    string ls_hsar
	 ls_hsar=tabpage_2.dw_2.GETITEMSTRING(1,"hsar")
	 STRING LS_COST
	 LS_COST=tabpage_4.dw_4.GETITEMSTRING(1,"cost_centre")
	 string ls_intorder
	 ls_intorder=tabpage_4.dw_4.GETITEMSTRING(1,"int_order")
	 string ls_bet
	 ls_bet=tabpage_4.dw_4.GETITEMSTRING(1,"bet_isolator")
	 String ls_drawing
	 ls_drawing=tabpage_3.dw_3.GETITEMSTRING(1,"drawing_no")
	 string ls_schem
	 ls_schem=tabpage_3.dw_3.GETITEMSTRING(1,"schem_num")
	 string ls_geo
	 ls_geo=tabpage_3.dw_3.GETITEMSTRING(1,"geo_drawing_no")
	 LONG ll_subest
	 ll_subest=tabpage_1.dw_1.GETITEMnumber(1,"subest_type")
	 LONG ll_phase
	 ll_phase=tabpage_1.dw_1.GETITEMnumber(1,"phase_rot")
	 LONG ll_isolation
	 ll_isolation=tabpage_2.dw_2.GETITEMnumber(1,"isolation")
	 LONG ll_surge
	 ll_surge=tabpage_1.dw_1.GETITEMnumber(1,"surge_diverter")
	 LONG ll_expansion
	 ll_expansion=tabpage_4.dw_4.GETITEMnumber(1,"expansion")
	 LONG ll_typem
	 ll_typem=tabpage_4.dw_4.GETITEMnumber(1,"type_mount")
	 LONG ll_structure
	 ll_structure=tabpage_4.dw_4.GETITEMnumber(1,"structure")
	 LONG ll_outd
	 ll_outd=tabpage_2.dw_2.GETITEMnumber(1,"outdoor_det")
	 LONG ll_rn
	 ll_rn=tabpage_2.dw_2.GETITEMnumber(1,"r_n")
	 LONG ll_yn
	 ll_yn=tabpage_2.dw_2.GETITEMnumber(1,"y_n")
	 LONG ll_bn
	 ll_bn=tabpage_2.dw_2.GETITEMnumber(1,"b_n")
	 LONG ll_circuits
	 ll_circuits=tabpage_1.dw_1.GETITEMnumber(1,"circuits_no")
	 LONG ll_weather
	 ll_weather=tabpage_4.dw_4.GETITEMnumber(1,"weather")
	 LONG ll_max
	 ll_max=tabpage_4.dw_4.GETITEMnumber(1,"max_load_rec")
	 LONG ll_access
	 ll_access=tabpage_3.dw_3.GETITEMnumber(1,"aces")
	 LONG ll_road
	 ll_road=tabpage_3.dw_3.GETITEMnumber(1,"road_access")
	 LONG ll_crane
	 ll_crane=tabpage_3.dw_3.GETITEMnumber(1,"crane_req")
	 LONG ll_tappos
	 ll_tappos=tabpage_1.dw_1.GETITEMnumber(1,"tap_position")
	 LONG ll_medvol
	 ll_medvol=tabpage_2.dw_2.GETITEMnumber(1,"med_voltage")
	 LONG ll_lowvol
	 ll_lowvol=tabpage_2.dw_2.GETITEMnumber(1,"low_voltage")
	 LONG ll_ry
	 ll_ry=tabpage_2.dw_2.GETITEMnumber(1,"r_y")
	 LONG ll_yb
	 ll_yb=tabpage_2.dw_2.GETITEMnumber(1,"y_b")
	 LONG ll_br
	 ll_br=tabpage_2.dw_2.GETITEMnumber(1,"b_r")
	 LONG ll_typee
	 ll_typee=tabpage_1.dw_1.GETITEMnumber(1,"type_earth")
	 LONG ll_hvval
	 ll_hvval=tabpage_1.dw_1.GETITEMnumber(1,"hv_value")
	 LONG ll_lvval
	 ll_lvval=tabpage_1.dw_1.GETITEMnumber(1,"lv_value")
	 LONG ll_combe
	 ll_combe=tabpage_1.dw_1.GETITEMnumber(1,"comb_earth")
	 LONG ll_soil
	 ll_soil=tabpage_4.dw_4.GETITEMnumber(1,"soil")
	 DATETIME ld_comm
	 ld_comm=tabpage_4.dw_4.GETITEMdateTIME(1,"COMM_DATE")
	 DATETIME ld_daterec
	 ld_daterec=tabpage_4.dw_4.GETITEMdateTIME(1,"DATE_REC")
	 
	 	  INSERT INTO "DETALLES_INSTALACION"  
         ( "HSAR",   
           "DRAWING_NO",   
           "SCHEM_NUM",   
           "GEO_DRAWING_NO",   
           "PHASE_ROT",   
           "COMM_DATE",   
           "ISOLATION",   
           "SURGE_DIVERTER",   
           "EXPANSION",   
           "TYPE_MOUNT",   
           "STRUCTURE",   
           "OUTDOOR_DET",   
           "R_N",   
           "Y_N",   
           "B_N",   
           "CIRCUITS_NO",   
           "WEATHER",   
           "MAX_LOAD_REC",   
           "DATE_REC",   
           "ACES",   
           "ROAD_ACCESS",   
           "CRANE_REQ",   
           "TAP_POSITION",   
           "MED_VOLTAGE",   
           "LOW_VOLTAGE",   
           "R_Y",   
           "Y_B",   
           "B_R",   
           "TYPE_EARTH",   
           "HV_VALUE",   
           "LV_VALUE",   
           "COMB_EARTH",   
           "SOIL",   
           "COMPANY_NO",   
           "INSTALLATION_NO",
			  "BET_ISOLATOR",
			  "INT_ORDER",
			  "SUBEST_TYPE",
			  "COST_CENTRE")  
			  
  VALUES (:LS_HSAR,
   :LS_DRAWING,   
   :ls_SCHEM,   
   :LS_GEO,   
   :LL_PHASE,   
   :LD_COMM,   
   :LL_ISOLATION,   
   :LL_SURGE,   
   :LL_EXPANSION,   
   :LL_TYPEM,   
   :LL_STRUCTURE,   
   :LL_OUTD,   
   :LL_RN,   
   :LL_YN,   
   :LL_BN,   
   :LL_CIRCUITS,   
   :LL_WEather,   
   :ll_max,   
   :ld_daterec,   
   :ll_access,   
   :ll_road,   
   :ll_crane,   
   :ll_tappos,   
   :ll_medvol,   
   :ll_lowvol,   
   :ll_ry,   
   :ll_yb,   
   :ll_br,   
   :ll_typee,   
   :ll_hvval,   
   :ll_lvval,   
   :ll_combe,   
   :ll_soil,
   '0',
	:ld_instalacion_no,
	:ls_bet,
	:ls_intorder,
	:ll_subest,
	:LS_COST);
  return 1
end function

public function integer f_preparar_alta ();
// deshabilita datawindows1
	    tabpage_1.dw_1.modify("phase_rot.color=" + string(0))
       tabpage_1.dw_1.modify("surge_diverter.color=" + string(0))
  	    tabpage_1.dw_1.modify("circuits_no.color=" + string(0))
       tabpage_1.dw_1.modify("tap_position.color=" + string(0))
  	    tabpage_1.dw_1.modify("type_earth.color=" + string(0))
  	    tabpage_1.dw_1.modify("hv_value.color=" + string(0))
  	    tabpage_1.dw_1.modify("lv_value.color=" + string(0))
  	    tabpage_1.dw_1.modify("comb_earth.color=" + string(0))
  	    tabpage_1.dw_1.modify("subest_type.color=" + string(0))
  	   
// deshabilita datawindows 2

 		 tabpage_2.dw_2.modify("hsar.color=" + string(0))
  	    tabpage_2.dw_2.modify("outdoor_det.color=" + string(0))
  	    tabpage_2.dw_2.modify("r_n.color=" + string(0))
  	    tabpage_2.dw_2.modify("y_n.color=" + string(0))
  	    tabpage_2.dw_2.modify("b_n.color=" + string(0))
  	    tabpage_2.dw_2.modify("isolation.color=" + string(0))
  	    tabpage_2.dw_2.modify("med_voltage.color=" + string(0))
  		 tabpage_2.dw_2.modify("low_voltage.color=" + string(0))
  		 tabpage_2.dw_2.modify("r_y.color=" + string(0))
  		 tabpage_2.dw_2.modify("y_b.color=" + string(0))
  		 tabpage_2.dw_2.modify("b_r.color=" + string(0))
  		 
// deshabilita datawindows3

       tabpage_3.dw_3.modify("DRAWING_NO.color=" + string(0))
  	    tabpage_3.dw_3.modify("schem_num.color=" + string(0))
  	    tabpage_3.dw_3.modify("geo_drawing_no.color=" + string(0))
  	    tabpage_3.dw_3.modify("aces.color=" + string(0))
  	    tabpage_3.dw_3.modify("road_access.color=" + string(0))
  	    tabpage_3.dw_3.modify("crane_req.color=" + string(0))
  		 
// deshabilita datawindows 4

 		 tabpage_4.dw_4.modify("expansion.color=" + string(0))
  	    tabpage_4.dw_4.modify("comm_date.color=" + string(0))
  	    tabpage_4.dw_4.modify("type_mount.color=" + string(0))
  	    tabpage_4.dw_4.modify("structure.color=" + string(0))
  	    tabpage_4.dw_4.modify("weather.color=" + string(0))
  	    tabpage_4.dw_4.modify("max_load_rec.color=" + string(0))
  	    tabpage_4.dw_4.modify("date_rec.color=" + string(0))
  		 tabpage_4.dw_4.modify("soil.color=" + string(0))
  		 tabpage_4.dw_4.modify("bet_isolator.color=" + string(0))
  		 tabpage_4.dw_4.modify("int_order.color=" + string(0))
  		 tabpage_4.dw_4.modify("cost_centre.color=" + string(0))
  
  return 1

end function

on u_tab_ins_ct.create
this.tabpage_3=create tabpage_3
this.tabpage_2=create tabpage_2
this.tabpage_1=create tabpage_1
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_3,&
this.tabpage_2,&
this.tabpage_1,&
this.tabpage_4}
end on

on u_tab_ins_ct.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_2)
destroy(this.tabpage_1)
destroy(this.tabpage_4)
end on

event selectionchanged;//integer il_tabclick=oldindex
//CHOOSE CASE il_tabclick
//	CASE 1
//		tabpage_1.dw_1.update()
//	CASE 2
//		tabpage_2.dw_2.update()
//	CASE 3
//		tabpage_3.dw_3.update()
//	CASE 4
//		tabpage_4.dw_4.update()
//END CHOOSE
//messagebox("hola",oldindex)
end event

event constructor;ib_modifico=FALSE
//	f_obtener_datos(w_3301_detalle_instalacion.iu_g_com.is_comunic.decval1)
end event

type tabpage_3 from userobject within u_tab_ins_ct
integer x = 18
integer y = 112
integer width = 2487
integer height = 1072
long backcolor = 79741120
string text = "GEOGRAPHICS"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Globals!"
long picturemaskcolor = 553648127
dw_3 dw_3
end type

on tabpage_3.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_3.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_3
integer x = 50
integer y = 204
integer width = 2336
integer height = 692
integer taborder = 3
string dataobject = "d_geop_ct"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;ib_modifico=true
end event

event editchanged;ib_modifico=true
end event

event retrieveend;accepttext()
end event

type tabpage_2 from userobject within u_tab_ins_ct
integer x = 18
integer y = 112
integer width = 2487
integer height = 1072
long backcolor = 79741120
string text = "VOLTAGES/PROTECTIONS"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom056!"
long picturemaskcolor = 553648127
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
integer x = 32
integer y = 80
integer width = 2427
integer height = 948
integer taborder = 5
string dataobject = "d_volt_ct"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;ib_modifico=true
end event

event editchanged;ib_modifico=true
end event

event retrieveend;accepttext()
end event

type tabpage_1 from userobject within u_tab_ins_ct
integer x = 18
integer y = 112
integer width = 2487
integer height = 1072
long backcolor = 79741120
string text = "TECNICAL"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom032!"
long picturemaskcolor = 553648127
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer x = 123
integer y = 116
integer width = 2254
integer height = 796
integer taborder = 4
string dataobject = "d_tecn_ct"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;ib_modifico=true
end event

event editchanged;ib_modifico=true
end event

event losefocus;ACCEPTTEXT()
end event

type tabpage_4 from userobject within u_tab_ins_ct
integer x = 18
integer y = 112
integer width = 2487
integer height = 1072
long backcolor = 79741120
string text = "OTHERS"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Open!"
long picturemaskcolor = 553648127
dw_4 dw_4
end type

on tabpage_4.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_4.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_4
integer x = 46
integer y = 68
integer width = 2405
integer height = 952
integer taborder = 2
string dataobject = "d_other_ct"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;ib_modifico=true
end event

event editchanged;ib_modifico=true
end event

event losefocus;ACCEPTTEXT()
end event


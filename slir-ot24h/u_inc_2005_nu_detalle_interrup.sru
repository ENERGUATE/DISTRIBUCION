HA$PBExportHeader$u_inc_2005_nu_detalle_interrup.sru
forward
global type u_inc_2005_nu_detalle_interrup from nonvisualobject
end type
end forward

global type u_inc_2005_nu_detalle_interrup from nonvisualobject
end type
global u_inc_2005_nu_detalle_interrup u_inc_2005_nu_detalle_interrup

forward prototypes
public function integer fnu_cargo_det_interr (ref datawindow pd_dw, long pl_nro_incidencia, ref datawindow pd_dw_gr1, ref datawindow pd_dw_gr2, ref datawindow pd_dw_gr3, datawindow pd_dw_info, ref datawindow pd_dw_detalle)
public function integer fnu_agrego_det (ref datawindow pd_dw, long pl_tot_ins_part, long pl_tot_ins_prop, decimal pl_tot_pot_part, decimal pl_tot_pot_prop, long pl_can_cli_part, long pl_can_cli_prop, string ps_duracion, long pl_row)
public function integer fnu_cargo_det_interr_rs (ref datawindow pd_dw, long pl_nro_incidencia, ref datawindow pd_dw_gr1, ref datawindow pd_dw_gr2, ref datawindow pd_dw_gr3, datawindow pd_dw_info, ref datawindow pd_dw_detalle)
public function integer fnu_cargo_det_interr_rs_hist (ref datawindow pd_dw, long pl_nro_incidencia, ref datawindow pd_dw_gr1, ref datawindow pd_dw_gr2, ref datawindow pd_dw_gr3, datawindow pd_dw_info, ref datawindow pd_dw_detalle)
end prototypes

public function integer fnu_cargo_det_interr (ref datawindow pd_dw, long pl_nro_incidencia, ref datawindow pd_dw_gr1, ref datawindow pd_dw_gr2, ref datawindow pd_dw_gr3, datawindow pd_dw_info, ref datawindow pd_dw_detalle);//////////////////////////////////////////////////////////
//
// Funcion: fnu_cargo_det_interr
//
// Objetivo:
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada:pd_dw, pl_nro_incidencia, pg_gr1, pg_gr2
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuacion
// -----		-----------		---------
//
////////////////////////////////////////////////////////////


Long ll_cant_part=0
Long ll_cant_prop=0
Decimal ll_pot_cont_part=0, ll_pot_cont=0
Decimal ll_pot_cont_prop=0
Long ll_can_cli_part=0
Long ll_can_cli_prop=0
Long ll_can_cli=0
String ls_texto
string ls_prop
Decimal ll_pot_inst_tot = 0
Decimal ll_pot_inst = 0
Long ll_cant_part_tot=0
Long ll_cant_cli_part_tot=0
Decimal ll_pot_cont_part_tot=0
Long ll_cant_prop_tot=0
Decimal ll_pot_cont_prop_tot=0
Long ll_cant_cli_prop_tot=0
Long ll_cant_part_pen=0
Long ll_cant_cli_part_pen=0
Decimal ll_pot_cont_part_pen=0
Long ll_cant_prop_pen=0
Decimal ll_pot_cont_prop_pen=0
Long ll_cant_cli_prop_pen=0
decimal ld_tiepi
decimal ld_asai
decimal ld_saifi
decimal ld_caidi 
decimal ld_saidi
int li_estado

String ls_duracion
Int li_fin_cursor,li_prop_inst
Int li_row_count
Long ll_nro_instalacion,ll_arr_instal[],ll_contador_veces,ll_conta,ll_registro,ll_coloco = 1
decimal ll_dias
//boolean lb_encontrada = false
datetime ldt_fec_rep,ldt_fec_alt

string ls_expresion

pd_dw.reset()
pd_dw_gr1.reset()
pd_dw_gr2.reset()
pd_dw_gr3.reset()

pd_dw.setredraw(FALSE)
pd_dw_gr1.setredraw(FALSE)
pd_dw_gr2.setredraw(FALSE)
pd_dw_gr3.setredraw(FALSE)

// Este cursor trae la informaci$$HEX1$$f300$$ENDHEX$$n de las interrupciones dadas de alta desde es OPENSGI
DECLARE lc_cur_est CURSOR FOR
	(SELECT SGD_INTERRUPCION.CCLI_AFEC,
			  SGD_INTERRUPCION.POT_CONTRATADA,
			  SGD_INTERRUPCION.POT_INSTALADA,
			  SGD_INTERRUPCION.F_REPOSICION,
			  SGD_INTERRUPCION.F_ALTA,
			  SGD_INSTALACION.COD_PROP_INST,
			  SGD_INSTALACION.NRO_INSTALACION 
		FROM SGD_INTERRUPCION, SGD_INSTALACION 
		WHERE SGD_INTERRUPCION.NRO_INSTALACION=SGD_INSTALACION.NRO_INSTALACION 
				AND NRO_INCIDENCIA=:pl_nro_incidencia
				and SGD_INSTALACION.BDI_JOB = 0 //DBE 11/01/2000
		) ORDER BY TO_DATE(SGD_INTERRUPCION.F_REPOSICION) USING SQLCA;

// Este cursor trae la informaci$$HEX1$$f300$$ENDHEX$$n de las interrupciones dadas de alta desde OPERACIONES
DECLARE lc_cur_aco CURSOR FOR
	(SELECT SGD_INTERRUPCION.CCLI_AFEC,
			  SGD_INTERRUPCION.POT_CONTRATADA,
			  SGD_INTERRUPCION.POT_INSTALADA,
			  SGD_INTERRUPCION.F_REPOSICION,
			  SGD_INTERRUPCION.F_ALTA,
			  SGD_ACOMETIDA.PROPIEDAD,
			  SGD_ACOMETIDA.CODIGO 
		FROM SGD_INTERRUPCION, SGD_ACOMEtIDA 
		WHERE SGD_INTERRUPCION.NRO_INSTALACION=SGD_ACOMETIDA.CODIGO 
				AND NRO_INCIDENCIA=:pl_nro_incidencia
				and SGD_ACOMETIDA.BDI_JOB = 0 //DBE 11/01/2000
		) ORDER BY TO_DATE(SGD_INTERRUPCION.F_REPOSICION);

li_fin_cursor=0

// Se comprueba si la incidencia es de operaciones
IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN
		
	// La incidencia es de operaciones. Los datos se traen del cursor de operaciones
	OPEN lc_cur_aco;
	
	FETCH lc_cur_aco INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;

ELSE
	// La incidencia se ha dado de alta desde el OPENSGI. Los datos se traen del cursor 
	// definido para el OPENSGI
	OPEN lc_cur_est;

	FETCH lc_cur_est INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;

END IF	


ll_contador_veces=0

IF SQLCA.SQLCODE=0 OR SQLCA.SQLCODE=100 THEN

	//Inserto un registro en cada gr$$HEX1$$e100$$ENDHEX$$fica
	
	pd_dw_gr1.insertrow(0)
	pd_dw_gr2.insertrow(0)
	pd_dw_gr3.insertrow(0)

	DO while(SQLCA.SQLCODE=0)
		
		ll_contador_veces ++
		
//		if lb_encontrada= false then
			
			// Tengo en cuenta todo
			
			ll_arr_instal[upperbound(ll_arr_instal) + 1]=ll_nro_instalacion
			
			if trim(ls_prop) = 'UF' then
				li_prop_inst = 0
			else
				li_prop_inst = 1
			end if
			
			IF li_prop_inst > 0 THEN   // SI ES UN TIPO DE INSTALACION PARTICULAR
				ll_cant_part_tot=ll_cant_part_tot + 1
				ll_cant_cli_part_tot=ll_cant_cli_part_tot+ll_can_cli
				ll_pot_cont_part_tot=ll_pot_cont_part_tot+ll_pot_cont
				ll_can_cli_part= ll_can_cli_part + ll_can_cli
				ll_pot_cont_part = ll_pot_cont_part+ll_pot_cont
				ll_cant_part=ll_cant_part+1
			ELSE								//SI ES UNA INSTALACION DE LA EMPRESA
				ll_cant_prop_tot=ll_cant_prop_tot+1
				ll_cant_cli_prop_tot=ll_cant_cli_prop_tot+ll_can_cli
				ll_pot_cont_prop_tot=ll_pot_cont_prop_tot+ll_pot_cont
				ll_can_cli_prop=ll_can_cli_part+ll_can_cli
				ll_pot_cont_prop=ll_pot_cont_prop+ll_pot_cont
				ll_cant_prop=ll_cant_prop+1
			END IF
			ll_pot_inst_tot = ll_pot_inst_tot + ll_pot_inst 
			
			// Estadisticas Gr$$HEX1$$e100$$ENDHEX$$ficas
			// Cargo las Datawindows de estadisticas
			
			ls_expresion="sgd_instalacion_cod_prop_inst = '" + ls_prop + "'"
			ll_registro=pd_dw_gr1.Find(ls_expresion,0, pd_dw_gr1.rowcount())
			
			if ll_registro=0 or Isnull(ll_registro) then 
				
				pd_dw_gr1.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr1.object.compute_0002[ll_coloco] = 1
				pd_dw_gr2.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr2.object.compute_0002[ll_coloco] = ll_pot_cont
				pd_dw_gr3.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr3.object.compute_0002[ll_coloco] = ll_can_cli
				
				ll_coloco=pd_dw_gr3.insertrow(0)
				ll_coloco=pd_dw_gr2.insertrow(0)		
				ll_coloco=pd_dw_gr1.insertrow(0)
			
			else
				
				pd_dw_gr2.object.compute_0002[ll_registro] = pd_dw_gr2.object.compute_0002[ll_registro] + ll_pot_cont
				pd_dw_gr1.object.compute_0002[ll_registro] = pd_dw_gr1.object.compute_0002[ll_registro] + 1
				pd_dw_gr3.object.compute_0002[ll_registro] = pd_dw_gr3.object.compute_0002[ll_registro] + ll_can_cli			
			
			end if				
			
//		else
//			//solo tengo en cuenta el tiempo
//			lb_encontrada=false
//		end if
	
		//Calculo el tiempo
		
		IF IsNull(ldt_fec_rep) THEN
		
			ldt_fec_rep = fgnu_fecha_actual()
		
		END IF
		
		ll_dias = ll_dias + (fg_duracion_horas(ldt_fec_alt,ldt_fec_rep))/24
		
		IF gb_operaciones = TRUE AND &
			pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
			gi_tension_nivel_min = fgci_baja_tension THEN
				
			FETCH lc_cur_aco INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;
		

		ELSE
			FETCH lc_cur_est INTO :ll_can_cli,
										 :ll_pot_cont,
										 :ll_pot_inst,
										 :ldt_fec_rep,
										 :ldt_fec_alt,
										 :ls_prop,
										 :ll_nro_instalacion;
		END IF
		
//		for ll_conta=1 to upperbound(ll_arr_instal)
//			if ll_nro_instalacion=ll_arr_instal[ll_conta] then
//				lb_encontrada = true
//			end if
//		next

	LOOP
	
	IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN

		Close lc_cur_aco;
	ELSE
		Close lc_cur_est;
	END IF
	
	IF ll_contador_veces > 0 THEN
		ls_duracion = fg_dias_a_formato(ll_dias/ll_contador_veces)
	END IF
	
	pd_dw.insertrow(0)
	
	String texto
	texto=" "	
		
	iF ll_cant_part_tot>0 THEN
		pd_dw.modify("txt_inst_part_pen.text=~""+String(ll_cant_part_tot)+"~"")
	ELse
		pd_dw.modify("txt_inst_part_pen.text=~""+Texto+"~"")
	END IF
	
	If ll_cant_prop_tot>0 THEN
		pd_dw.modify("txt_inst_prop_pen.text=~""+String(ll_cant_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_inst_prop_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_pot_cont_part_tot>0 THEN
		pd_dw.modify("txt_pot_part_pen.text=~""+String(ll_pot_cont_part_tot)+"~"")
	ELSE
		pd_dw.modify("txt_pot_part_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_pot_cont_prop_tot>0 THEN
		pd_dw.modify("txt_pot_prop_pen.text=~""+String(ll_pot_cont_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_pot_prop_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_cant_cli_part_tot>0 THEN
		pd_dw.modify("txt_cli_part_pen.text=~""+String(ll_cant_cli_part_tot)+"~"")
	ELSE
		pd_dw.modify("txt_cli_part_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_cant_cli_prop_tot>0 THEN
		pd_dw.modify("txt_cli_prop_pen.text=~""+String(ll_cant_cli_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_cli_prop_pen.text=~""+Texto+"~"")
	END IF
	
	pd_dw.modify("txt_duracion_pen.text=~""+ls_duracion+"~"")
	
	ld_tiepi= pd_dw_info.getitemdecimal(1,"tiepi")
	if not isnull(ld_tiepi) then
		pd_dw.modify("tiepi_t.text=~""+string(ld_tiepi)+"~"")
   else
		pd_dw.modify("tiepi_t.text=~""+texto+"~"")
	end if
	
	ld_saifi= pd_dw_info.getitemdecimal(1,"saifi")
	if not isnull(ld_saifi)  then 
		pd_dw.modify("saifi_t.text=~""+string(ld_saifi)+"~"")
	else
		pd_dw.modify("saifi_t.text=~""+texto+"~"")
	end if
	
	ld_saidi= pd_dw_info.getitemdecimal(1,"saidi")		
	if not isnull(ld_saidi)  then 
			pd_dw.modify("saidi_t.text=~""+string(ld_saidi)+"~"")
	else
			pd_dw.modify("saidi_t.text=~""+texto+"~"")
	end if
	
	
	ld_caidi= pd_dw_info.getitemdecimal(1,"caidi")		
	if not isnull(ld_caidi)  then 
		pd_dw.modify("caidi_t.text=~""+string(ld_caidi)+"~"")
	else
		pd_dw.modify("caidi_t.text=~""+texto+"~"")
	end if
	
	
	
	ld_asai= pd_dw_info.getitemdecimal(1,"asai")		
	if not isnull(ld_asai)  then 
		pd_dw.modify("asai_t.text=~""+string(ld_asai)+"~"")
	else
		pd_dw.modify("asai_t.text=~""+texto+"~"")
	end if
	
	li_estado=pd_dw_info.getitemnumber(1,"estado_actual")
	if li_estado= fgci_incidencia_resuelta then
		pd_dw_detalle.HScrollBar= true
	end if
ELSE
	IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN

		Close lc_cur_aco;
	ELSE
		Close lc_cur_est;
	END IF
END IF

pd_dw_info.SetItem(1, 'pot_afectada' , ll_pot_inst_tot)
pd_dw_info.SetItem(1, 'pot_contratada' , ll_pot_cont_part_tot + ll_pot_cont_prop_tot)
pd_dw_info.SetItem(1, 'ccli_afec' , ll_cant_cli_part_tot + ll_cant_cli_prop_tot)
//pd_dw.accepttext()
pd_dw.setredraw(TRUE)
pd_dw_gr1.setredraw(TRUE)
pd_dw_gr2.setredraw(TRUE)
pd_dw_gr3.setredraw(TRUE)

return 1
end function

public function integer fnu_agrego_det (ref datawindow pd_dw, long pl_tot_ins_part, long pl_tot_ins_prop, decimal pl_tot_pot_part, decimal pl_tot_pot_prop, long pl_can_cli_part, long pl_can_cli_prop, string ps_duracion, long pl_row);//////////////////////////////////////////////////////////
//
// Funcion: fnu_agregar_det
//
// Objetivo:
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada: pd_dw, pl_tot_ins_part, pl_tot_ins_prop, pl_tot_pot_part,
//						pl_tot_pot_prop, pl_can_cli_part, pl_can_cli_prop, ps_duracion
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuacion
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

If(pl_tot_ins_part<>0) THEN
	pd_dw.setitem(pl_row,"cant_inst_part",pl_tot_ins_part)
END IF
If(pl_tot_ins_prop<>0) THEN
	pd_dw.setitem(pl_row,"cant_inst_prop",pl_tot_ins_prop)
END IF
If(pl_tot_pot_part<>0) THEN
	pd_dw.setitem(pl_row,"cant_pot_part",pl_tot_pot_part)
END IF
If(pl_tot_pot_prop<>0) THEN
	pd_dw.setitem(pl_row,"cant_pot_prop",pl_tot_pot_prop)
END IF
If(pl_can_cli_part<>0) THEN
	pd_dw.setitem(pl_row,"cant_cli_part",pl_can_cli_part)
End If
If(pl_can_cli_prop<>0) THEN
	pd_dw.setitem(pl_row,"cant_cli_prop",pl_can_cli_prop)
END IF
pd_dw.setitem(pl_row,"duracion",ps_duracion)
return 1

end function

public function integer fnu_cargo_det_interr_rs (ref datawindow pd_dw, long pl_nro_incidencia, ref datawindow pd_dw_gr1, ref datawindow pd_dw_gr2, ref datawindow pd_dw_gr3, datawindow pd_dw_info, ref datawindow pd_dw_detalle);//////////////////////////////////////////////////////////
//
// Funcion: fnu_cargo_det_interr
//
// Objetivo:
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada:pd_dw, pl_nro_incidencia, pg_gr1, pg_gr2
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuacion
// -----		-----------		---------
//
////////////////////////////////////////////////////////////


Long ll_cant_part=0
Long ll_cant_prop=0
Decimal ll_pot_cont_part=0, ll_pot_cont=0
Decimal ll_pot_cont_prop=0
Long ll_can_cli_part=0
Long ll_can_cli_prop=0
Long ll_can_cli=0
String ls_texto
string ls_prop
Decimal ll_pot_inst_tot = 0
Decimal ll_pot_inst = 0
Long ll_cant_part_tot=0
Long ll_cant_cli_part_tot=0
Decimal ll_pot_cont_part_tot=0
Long ll_cant_prop_tot=0
Decimal ll_pot_cont_prop_tot=0
Long ll_cant_cli_prop_tot=0
Long ll_cant_part_pen=0
Long ll_cant_cli_part_pen=0
Decimal ll_pot_cont_part_pen=0
Long ll_cant_prop_pen=0
Decimal ll_pot_cont_prop_pen=0
Long ll_cant_cli_prop_pen=0
decimal ld_tiepi
decimal ld_asai
decimal ld_saifi
decimal ld_caidi 
decimal ld_saidi
int li_estado

String ls_duracion
Int li_fin_cursor,li_prop_inst
Int li_row_count
Long ll_nro_instalacion,ll_arr_instal[],ll_contador_veces,ll_conta,ll_registro,ll_coloco = 1
decimal ll_dias
//boolean lb_encontrada = false
datetime ldt_fec_rep,ldt_fec_alt

string ls_expresion

pd_dw.reset()
pd_dw_gr1.reset()
pd_dw_gr2.reset()
pd_dw_gr3.reset()

pd_dw.setredraw(FALSE)
pd_dw_gr1.setredraw(FALSE)
pd_dw_gr2.setredraw(FALSE)
pd_dw_gr3.setredraw(FALSE)

// Este cursor trae la informaci$$HEX1$$f300$$ENDHEX$$n de las interrupciones dadas de alta desde es OPENSGI
DECLARE lc_cur_est CURSOR FOR
	(SELECT INTERRUPCION_TOTAL.CCLI_AFEC,
			  INTERRUPCION_TOTAL.POT_CONTRATADA,
			  INTERRUPCION_TOTAL.POT_INSTALADA,
			  INTERRUPCION_TOTAL.F_REPOSICION,
			  INTERRUPCION_TOTAL.F_ALTA,
			  SGD_INSTALACION.COD_PROP_INST,
			  SGD_INSTALACION.NRO_INSTALACION 
		FROM INTERRUPCION_TOTAL, SGD_INSTALACION 
		WHERE INTERRUPCION_TOTAL.NRO_INSTALACION=SGD_INSTALACION.NRO_INSTALACION 
				AND NRO_INCIDENCIA=:pl_nro_incidencia
				and SGD_INSTALACION.BDI_JOB = 0 //DBE 11/01/2000
		) ORDER BY TO_DATE(INTERRUPCION_TOTAL.F_REPOSICION) USING SQLCA;

// Este cursor trae la informaci$$HEX1$$f300$$ENDHEX$$n de las interrupciones dadas de alta desde OPERACIONES
DECLARE lc_cur_aco CURSOR FOR
	(SELECT INTERRUPCION_TOTAL.CCLI_AFEC,
			  INTERRUPCION_TOTAL.POT_CONTRATADA,
			  INTERRUPCION_TOTAL.POT_INSTALADA,
			  INTERRUPCION_TOTAL.F_REPOSICION,
			  INTERRUPCION_TOTAL.F_ALTA,
			  SGD_ACOMETIDA.PROPIEDAD,
			  SGD_ACOMETIDA.CODIGO 
		FROM INTERRUPCION_TOTAL, SGD_ACOMETIDA 
		WHERE INTERRUPCION_TOTAL.NRO_INSTALACION=SGD_ACOMETIDA.CODIGO 
				AND NRO_INCIDENCIA=:pl_nro_incidencia
				and SGD_ACOMETIDA.BDI_JOB = 0 //DBE 11/01/2000
		) ORDER BY TO_DATE(INTERRUPCION_TOTAL.F_REPOSICION);

li_fin_cursor=0

// Se comprueba si la incidencia es de operaciones
IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN
		
	// La incidencia es de operaciones. Los datos se traen del cursor de operaciones
	OPEN lc_cur_aco;
	
	FETCH lc_cur_aco INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;

ELSE
	// La incidencia se ha dado de alta desde el OPENSGI. Los datos se traen del cursor 
	// definido para el OPENSGI
	OPEN lc_cur_est;

	FETCH lc_cur_est INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;

END IF	


ll_contador_veces=0

IF SQLCA.SQLCODE=0 OR SQLCA.SQLCODE=100 THEN

	//Inserto un registro en cada gr$$HEX1$$e100$$ENDHEX$$fica
	
	pd_dw_gr1.insertrow(0)
	pd_dw_gr2.insertrow(0)
	pd_dw_gr3.insertrow(0)

	DO while(SQLCA.SQLCODE=0)
		
		ll_contador_veces ++
		
//		if lb_encontrada= false then
			
			// Tengo en cuenta todo
			
			ll_arr_instal[upperbound(ll_arr_instal) + 1]=ll_nro_instalacion
			
			if trim(ls_prop) = 'UF' then
				li_prop_inst = 0
			else
				li_prop_inst = 1
			end if
			
			IF li_prop_inst > 0 THEN   // SI ES UN TIPO DE INSTALACION PARTICULAR
				ll_cant_part_tot=ll_cant_part_tot + 1
				ll_cant_cli_part_tot=ll_cant_cli_part_tot+ll_can_cli
				ll_pot_cont_part_tot=ll_pot_cont_part_tot+ll_pot_cont
				ll_can_cli_part= ll_can_cli_part + ll_can_cli
				ll_pot_cont_part = ll_pot_cont_part+ll_pot_cont
				ll_cant_part=ll_cant_part+1
			ELSE								//SI ES UNA INSTALACION DE LA EMPRESA
				ll_cant_prop_tot=ll_cant_prop_tot+1
				ll_cant_cli_prop_tot=ll_cant_cli_prop_tot+ll_can_cli
				ll_pot_cont_prop_tot=ll_pot_cont_prop_tot+ll_pot_cont
				ll_can_cli_prop=ll_can_cli_part+ll_can_cli
				ll_pot_cont_prop=ll_pot_cont_prop+ll_pot_cont
				ll_cant_prop=ll_cant_prop+1
			END IF
			ll_pot_inst_tot = ll_pot_inst_tot + ll_pot_inst 
			
			// Estadisticas Gr$$HEX1$$e100$$ENDHEX$$ficas
			// Cargo las Datawindows de estadisticas
			
			ls_expresion="sgd_instalacion_cod_prop_inst = '" + ls_prop + "'"
			ll_registro=pd_dw_gr1.Find(ls_expresion,0, pd_dw_gr1.rowcount())
			
			if ll_registro=0 or Isnull(ll_registro) then 
				
				pd_dw_gr1.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr1.object.compute_0002[ll_coloco] = 1
				pd_dw_gr2.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr2.object.compute_0002[ll_coloco] = ll_pot_cont
				pd_dw_gr3.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr3.object.compute_0002[ll_coloco] = ll_can_cli
				
				ll_coloco=pd_dw_gr3.insertrow(0)
				ll_coloco=pd_dw_gr2.insertrow(0)		
				ll_coloco=pd_dw_gr1.insertrow(0)
			
			else
				
				pd_dw_gr2.object.compute_0002[ll_registro] = pd_dw_gr2.object.compute_0002[ll_registro] + ll_pot_cont
				pd_dw_gr1.object.compute_0002[ll_registro] = pd_dw_gr1.object.compute_0002[ll_registro] + 1
				pd_dw_gr3.object.compute_0002[ll_registro] = pd_dw_gr3.object.compute_0002[ll_registro] + ll_can_cli			
			
			end if				
			
//		else
//			//solo tengo en cuenta el tiempo
//			lb_encontrada=false
//		end if
	
		//Calculo el tiempo
		
		IF IsNull(ldt_fec_rep) THEN
		
			ldt_fec_rep = fgnu_fecha_actual()
		
		END IF
		
		ll_dias = ll_dias + (fg_duracion_horas(ldt_fec_alt,ldt_fec_rep))/24
		
		IF gb_operaciones = TRUE AND &
			pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
			gi_tension_nivel_min = fgci_baja_tension THEN
				
			FETCH lc_cur_aco INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;
		

		ELSE
			FETCH lc_cur_est INTO :ll_can_cli,
										 :ll_pot_cont,
										 :ll_pot_inst,
										 :ldt_fec_rep,
										 :ldt_fec_alt,
										 :ls_prop,
										 :ll_nro_instalacion;
		END IF
		
//		for ll_conta=1 to upperbound(ll_arr_instal)
//			if ll_nro_instalacion=ll_arr_instal[ll_conta] then
//				lb_encontrada = true
//			end if
//		next

	LOOP
	
	IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN

		Close lc_cur_aco;
	ELSE
		Close lc_cur_est;
	END IF
	
	IF ll_contador_veces > 0 THEN
		ls_duracion = fg_dias_a_formato(ll_dias/ll_contador_veces)
	END IF
	
	pd_dw.insertrow(0)
	
	String texto
	texto=" "	
		
	iF ll_cant_part_tot>0 THEN
		pd_dw.modify("txt_inst_part_pen.text=~""+String(ll_cant_part_tot)+"~"")
	ELse
		pd_dw.modify("txt_inst_part_pen.text=~""+Texto+"~"")
	END IF
	
	If ll_cant_prop_tot>0 THEN
		pd_dw.modify("txt_inst_prop_pen.text=~""+String(ll_cant_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_inst_prop_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_pot_cont_part_tot>0 THEN
		pd_dw.modify("txt_pot_part_pen.text=~""+String(ll_pot_cont_part_tot)+"~"")
	ELSE
		pd_dw.modify("txt_pot_part_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_pot_cont_prop_tot>0 THEN
		pd_dw.modify("txt_pot_prop_pen.text=~""+String(ll_pot_cont_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_pot_prop_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_cant_cli_part_tot>0 THEN
		pd_dw.modify("txt_cli_part_pen.text=~""+String(ll_cant_cli_part_tot)+"~"")
	ELSE
		pd_dw.modify("txt_cli_part_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_cant_cli_prop_tot>0 THEN
		pd_dw.modify("txt_cli_prop_pen.text=~""+String(ll_cant_cli_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_cli_prop_pen.text=~""+Texto+"~"")
	END IF
	
	pd_dw.modify("txt_duracion_pen.text=~""+ls_duracion+"~"")
	
	ld_tiepi= pd_dw_info.getitemdecimal(1,"tiepi")
	if not isnull(ld_tiepi) then
		pd_dw.modify("tiepi_t.text=~""+string(ld_tiepi)+"~"")
   else
		pd_dw.modify("tiepi_t.text=~""+texto+"~"")
	end if
	
	ld_saifi= pd_dw_info.getitemdecimal(1,"saifi")
	if not isnull(ld_saifi)  then 
		pd_dw.modify("saifi_t.text=~""+string(ld_saifi)+"~"")
	else
		pd_dw.modify("saifi_t.text=~""+texto+"~"")
	end if
	
	ld_saidi= pd_dw_info.getitemdecimal(1,"saidi")		
	if not isnull(ld_saidi)  then 
			pd_dw.modify("saidi_t.text=~""+string(ld_saidi)+"~"")
	else
			pd_dw.modify("saidi_t.text=~""+texto+"~"")
	end if
	
	
	ld_caidi= pd_dw_info.getitemdecimal(1,"caidi")		
	if not isnull(ld_caidi)  then 
		pd_dw.modify("caidi_t.text=~""+string(ld_caidi)+"~"")
	else
		pd_dw.modify("caidi_t.text=~""+texto+"~"")
	end if
	
	
	
	ld_asai= pd_dw_info.getitemdecimal(1,"asai")		
	if not isnull(ld_asai)  then 
		pd_dw.modify("asai_t.text=~""+string(ld_asai)+"~"")
	else
		pd_dw.modify("asai_t.text=~""+texto+"~"")
	end if
	
	li_estado=pd_dw_info.getitemnumber(1,"estado_actual")
	if li_estado= fgci_incidencia_resuelta then
		pd_dw_detalle.HScrollBar= true
	end if
ELSE
	IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN

		Close lc_cur_aco;
	ELSE
		Close lc_cur_est;
	END IF
END IF


pd_dw_info.SetItem(1, 'pot_afectada' , ll_pot_inst_tot)
pd_dw_info.SetItem(1, 'pot_contratada' , ll_pot_cont_part_tot + ll_pot_cont_prop_tot)
pd_dw_info.SetItem(1, 'ccli_afec' , ll_cant_cli_part_tot + ll_cant_cli_prop_tot)
//pd_dw.accepttext()
pd_dw.setredraw(TRUE)
pd_dw_gr1.setredraw(TRUE)
pd_dw_gr2.setredraw(TRUE)
pd_dw_gr3.setredraw(TRUE)

return 1
end function

public function integer fnu_cargo_det_interr_rs_hist (ref datawindow pd_dw, long pl_nro_incidencia, ref datawindow pd_dw_gr1, ref datawindow pd_dw_gr2, ref datawindow pd_dw_gr3, datawindow pd_dw_info, ref datawindow pd_dw_detalle);//////////////////////////////////////////////////////////
//
// Funcion: fnu_cargo_det_interr
//
// Objetivo:
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada:pd_dw, pl_nro_incidencia, pg_gr1, pg_gr2
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuacion
// -----		-----------		---------
//
////////////////////////////////////////////////////////////


Long ll_cant_part=0
Long ll_cant_prop=0
Decimal ll_pot_cont_part=0, ll_pot_cont=0
Decimal ll_pot_cont_prop=0
Long ll_can_cli_part=0
Long ll_can_cli_prop=0
Long ll_can_cli=0
String ls_texto
string ls_prop
Decimal ll_pot_inst_tot = 0
Decimal ll_pot_inst
Long ll_cant_part_tot=0
Long ll_cant_cli_part_tot=0
Decimal ll_pot_cont_part_tot=0
Long ll_cant_prop_tot=0
Decimal ll_pot_cont_prop_tot=0
Long ll_cant_cli_prop_tot=0
Long ll_cant_part_pen=0
Long ll_cant_cli_part_pen=0
Decimal ll_pot_cont_part_pen=0
Long ll_cant_prop_pen=0
Decimal ll_pot_cont_prop_pen=0
Long ll_cant_cli_prop_pen=0
decimal ld_tiepi
decimal ld_asai
decimal ld_saifi
decimal ld_caidi 
decimal ld_saidi
int li_estado

String ls_duracion
Int li_fin_cursor,li_prop_inst
Int li_row_count
Long ll_nro_instalacion,ll_arr_instal[],ll_contador_veces,ll_conta,ll_registro,ll_coloco = 1
decimal ll_dias
//boolean lb_encontrada = false
datetime ldt_fec_rep,ldt_fec_alt

string ls_expresion

pd_dw.reset()
pd_dw_gr1.reset()
pd_dw_gr2.reset()
pd_dw_gr3.reset()

pd_dw.setredraw(FALSE)
pd_dw_gr1.setredraw(FALSE)
pd_dw_gr2.setredraw(FALSE)
pd_dw_gr3.setredraw(FALSE)

// Este cursor trae la informaci$$HEX1$$f300$$ENDHEX$$n de las interrupciones dadas de alta desde es OPENSGI
DECLARE lc_cur_est CURSOR FOR
	(SELECT GI_HIST_INTERRUPCION.CCLI_AFEC,
			  GI_HIST_INTERRUPCION.POT_CONTRATADA,
			  GI_HIST_INTERRUPCION.POT_INSTALADA,
			  GI_HIST_INTERRUPCION.F_REPOSICION,
			  GI_HIST_INTERRUPCION.F_ALTA,
			  SGD_INSTALACION.COD_PROP_INST,
			  SGD_INSTALACION.NRO_INSTALACION 
		FROM GI_HIST_INTERRUPCION, SGD_INSTALACION 
		WHERE GI_HIST_INTERRUPCION.NRO_INSTALACION=SGD_INSTALACION.NRO_INSTALACION 
				AND NRO_INCIDENCIA=:pl_nro_incidencia
				and SGD_INSTALACION.BDI_JOB = 0 //DBE 11/01/2000
		) ORDER BY TO_DATE(GI_HIST_INTERRUPCION.F_REPOSICION) USING SQLCA;

// Este cursor trae la informaci$$HEX1$$f300$$ENDHEX$$n de las interrupciones dadas de alta desde OPERACIONES
DECLARE lc_cur_aco CURSOR FOR
	(SELECT GI_HIST_INTERRUPCION.CCLI_AFEC,
			  GI_HIST_INTERRUPCION.POT_CONTRATADA,
			  GI_HIST_INTERRUPCION.POT_INSTALADA,
			  GI_HIST_INTERRUPCION.F_REPOSICION,
			  GI_HIST_INTERRUPCION.F_ALTA,
			  SGD_ACOMETIDA.PROPIEDAD,
			  SGD_ACOMETIDA.CODIGO 
		FROM GI_HIST_INTERRUPCION, SGD_ACOMETIDA 
		WHERE GI_HIST_INTERRUPCION.NRO_INSTALACION=SGD_ACOMETIDA.CODIGO 
				AND NRO_INCIDENCIA=:pl_nro_incidencia
				and SGD_ACOMETIDA.BDI_JOB = 0 //DBE 11/01/2000
		) ORDER BY TO_DATE(GI_HIST_INTERRUPCION.F_REPOSICION);

li_fin_cursor=0

// Se comprueba si la incidencia es de operaciones
IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN
		
	// La incidencia es de operaciones. Los datos se traen del cursor de operaciones
	OPEN lc_cur_aco;
	
	FETCH lc_cur_aco INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;

ELSE
	// La incidencia se ha dado de alta desde el OPENSGI. Los datos se traen del cursor 
	// definido para el OPENSGI
	OPEN lc_cur_est;

	FETCH lc_cur_est INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;

END IF	


ll_contador_veces=0

IF SQLCA.SQLCODE=0 OR SQLCA.SQLCODE=100 THEN

	//Inserto un registro en cada gr$$HEX1$$e100$$ENDHEX$$fica
	
	pd_dw_gr1.insertrow(0)
	pd_dw_gr2.insertrow(0)
	pd_dw_gr3.insertrow(0)

	DO while(SQLCA.SQLCODE=0)
		
		ll_contador_veces ++
		
//		if lb_encontrada= false then
			
			// Tengo en cuenta todo
			
			ll_arr_instal[upperbound(ll_arr_instal) + 1]=ll_nro_instalacion
			
			if trim(ls_prop) = 'UF' then
				li_prop_inst = 0
			else
				li_prop_inst = 1
			end if
			
			IF li_prop_inst > 0 THEN   // SI ES UN TIPO DE INSTALACION PARTICULAR
				ll_cant_part_tot=ll_cant_part_tot + 1
				ll_cant_cli_part_tot=ll_cant_cli_part_tot+ll_can_cli
				ll_pot_cont_part_tot=ll_pot_cont_part_tot+ll_pot_cont
				ll_can_cli_part= ll_can_cli_part + ll_can_cli
				ll_pot_cont_part = ll_pot_cont_part+ll_pot_cont
				ll_cant_part=ll_cant_part+1
			ELSE								//SI ES UNA INSTALACION DE LA EMPRESA
				ll_cant_prop_tot=ll_cant_prop_tot+1
				ll_cant_cli_prop_tot=ll_cant_cli_prop_tot+ll_can_cli
				ll_pot_cont_prop_tot=ll_pot_cont_prop_tot+ll_pot_cont
				ll_can_cli_prop=ll_can_cli_part+ll_can_cli
				ll_pot_cont_prop=ll_pot_cont_prop+ll_pot_cont
				ll_cant_prop=ll_cant_prop+1
			END IF
			ll_pot_inst_tot = ll_pot_inst_tot + ll_pot_inst 
			
			// Estadisticas Gr$$HEX1$$e100$$ENDHEX$$ficas
			// Cargo las Datawindows de estadisticas
			
			ls_expresion="sgd_instalacion_cod_prop_inst = '" + ls_prop + "'"
			ll_registro=pd_dw_gr1.Find(ls_expresion,0, pd_dw_gr1.rowcount())
			
			if ll_registro=0 or Isnull(ll_registro) then 
				
				pd_dw_gr1.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr1.object.compute_0002[ll_coloco] = 1
				pd_dw_gr2.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr2.object.compute_0002[ll_coloco] = ll_pot_cont
				pd_dw_gr3.object.sgd_instalacion_cod_prop_inst[ll_coloco] = ls_prop
				pd_dw_gr3.object.compute_0002[ll_coloco] = ll_can_cli
				
				ll_coloco=pd_dw_gr3.insertrow(0)
				ll_coloco=pd_dw_gr2.insertrow(0)		
				ll_coloco=pd_dw_gr1.insertrow(0)
			
			else
				
				pd_dw_gr2.object.compute_0002[ll_registro] = pd_dw_gr2.object.compute_0002[ll_registro] + ll_pot_cont
				pd_dw_gr1.object.compute_0002[ll_registro] = pd_dw_gr1.object.compute_0002[ll_registro] + 1
				pd_dw_gr3.object.compute_0002[ll_registro] = pd_dw_gr3.object.compute_0002[ll_registro] + ll_can_cli			
			
			end if				
			
//		else
//			//solo tengo en cuenta el tiempo
//			lb_encontrada=false
//		end if
	
		//Calculo el tiempo
		
		IF IsNull(ldt_fec_rep) THEN
		
			ldt_fec_rep = fgnu_fecha_actual()
		
		END IF
		
		ll_dias = ll_dias + (fg_duracion_horas(ldt_fec_alt,ldt_fec_rep))/24
		
		IF gb_operaciones = TRUE AND &
			pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
			gi_tension_nivel_min = fgci_baja_tension THEN
				
			FETCH lc_cur_aco INTO :ll_can_cli,
							 :ll_pot_cont,
							 :ll_pot_inst,
							 :ldt_fec_rep,
							 :ldt_fec_alt,
							 :ls_prop,
							 :ll_nro_instalacion;
		

		ELSE
			FETCH lc_cur_est INTO :ll_can_cli,
										 :ll_pot_cont,
										 :ll_pot_inst,
										 :ldt_fec_rep,
										 :ldt_fec_alt,
										 :ls_prop,
										 :ll_nro_instalacion;
		END IF
		
//		for ll_conta=1 to upperbound(ll_arr_instal)
//			if ll_nro_instalacion=ll_arr_instal[ll_conta] then
//				lb_encontrada = true
//			end if
//		next

	LOOP
	
	IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN

		Close lc_cur_aco;
	ELSE
		Close lc_cur_est;
	END IF
	
	IF ll_contador_veces > 0 THEN
		ls_duracion = fg_dias_a_formato(ll_dias/ll_contador_veces)
	END IF
	
	pd_dw.insertrow(0)
	
	String texto
	texto=" "	
		
	iF ll_cant_part_tot>0 THEN
		pd_dw.modify("txt_inst_part_pen.text=~""+String(ll_cant_part_tot)+"~"")
	ELse
		pd_dw.modify("txt_inst_part_pen.text=~""+Texto+"~"")
	END IF
	
	If ll_cant_prop_tot>0 THEN
		pd_dw.modify("txt_inst_prop_pen.text=~""+String(ll_cant_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_inst_prop_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_pot_cont_part_tot>0 THEN
		pd_dw.modify("txt_pot_part_pen.text=~""+String(ll_pot_cont_part_tot)+"~"")
	ELSE
		pd_dw.modify("txt_pot_part_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_pot_cont_prop_tot>0 THEN
		pd_dw.modify("txt_pot_prop_pen.text=~""+String(ll_pot_cont_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_pot_prop_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_cant_cli_part_tot>0 THEN
		pd_dw.modify("txt_cli_part_pen.text=~""+String(ll_cant_cli_part_tot)+"~"")
	ELSE
		pd_dw.modify("txt_cli_part_pen.text=~""+Texto+"~"")
	END IF
	
	IF ll_cant_cli_prop_tot>0 THEN
		pd_dw.modify("txt_cli_prop_pen.text=~""+String(ll_cant_cli_prop_tot)+"~"")
	ELSE
		pd_dw.modify("txt_cli_prop_pen.text=~""+Texto+"~"")
	END IF
	
	pd_dw.modify("txt_duracion_pen.text=~""+ls_duracion+"~"")
	
	ld_tiepi= pd_dw_info.getitemdecimal(1,"tiepi")
	if not isnull(ld_tiepi) then
		pd_dw.modify("tiepi_t.text=~""+string(ld_tiepi)+"~"")
   else
		pd_dw.modify("tiepi_t.text=~""+texto+"~"")
	end if
	
	ld_saifi= pd_dw_info.getitemdecimal(1,"saifi")
	if not isnull(ld_saifi)  then 
		pd_dw.modify("saifi_t.text=~""+string(ld_saifi)+"~"")
	else
		pd_dw.modify("saifi_t.text=~""+texto+"~"")
	end if
	
	ld_saidi= pd_dw_info.getitemdecimal(1,"saidi")		
	if not isnull(ld_saidi)  then 
			pd_dw.modify("saidi_t.text=~""+string(ld_saidi)+"~"")
	else
			pd_dw.modify("saidi_t.text=~""+texto+"~"")
	end if
	
	
	ld_caidi= pd_dw_info.getitemdecimal(1,"caidi")		
	if not isnull(ld_caidi)  then 
		pd_dw.modify("caidi_t.text=~""+string(ld_caidi)+"~"")
	else
		pd_dw.modify("caidi_t.text=~""+texto+"~"")
	end if
	
	
	
	ld_asai= pd_dw_info.getitemdecimal(1,"asai")		
	if not isnull(ld_asai)  then 
		pd_dw.modify("asai_t.text=~""+string(ld_asai)+"~"")
	else
		pd_dw.modify("asai_t.text=~""+texto+"~"")
	end if
	
	li_estado=pd_dw_info.getitemnumber(1,"estado_actual")
	if li_estado= fgci_incidencia_resuelta then
		pd_dw_detalle.HScrollBar= true
	end if
ELSE
	IF gb_operaciones = TRUE AND &
	   pd_dw_info.getitemnumber(1,"tip_tension") <= gi_tension_nivel_min AND &
		gi_tension_nivel_min = fgci_baja_tension THEN

		Close lc_cur_aco;
	ELSE
		Close lc_cur_est;
	END IF
END IF

pd_dw_info.SetItem(1, 'pot_afectada' , ll_pot_inst_tot)
pd_dw_info.SetItem(1, 'pot_contratada' , ll_pot_cont_part_tot + ll_pot_cont_prop_tot)
pd_dw_info.SetItem(1, 'ccli_afec' , ll_cant_cli_part_tot + ll_cant_cli_prop_tot)
//pd_dw.accepttext()
pd_dw.setredraw(TRUE)
pd_dw_gr1.setredraw(TRUE)
pd_dw_gr2.setredraw(TRUE)
pd_dw_gr3.setredraw(TRUE)

return 1
end function

on u_inc_2005_nu_detalle_interrup.create
TriggerEvent( this, "constructor" )
end on

on u_inc_2005_nu_detalle_interrup.destroy
TriggerEvent( this, "destructor" )
end on


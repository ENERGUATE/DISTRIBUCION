HA$PBExportHeader$u_inc_2004_rn_form_inf_general.sru
forward
global type u_inc_2004_rn_form_inf_general from nonvisualobject
end type
end forward

global type u_inc_2004_rn_form_inf_general from nonvisualobject
end type
global u_inc_2004_rn_form_inf_general u_inc_2004_rn_form_inf_general

forward prototypes
public function boolean frn_evaluo_fec_causa (ref datawindow pd_dw, datetime pdt_fec_ant)
public function integer frn_hab_material_averiado (integer pi_estado_operaciones)
public function boolean frn_evaluo_f_est_res (ref datawindow pd_dw, datetime pdt_fec_ant)
public function boolean frn_hab_menu_sum_imp (ref datawindow pd_dw)
public function boolean frn_menu_hab_ot (ref datawindow pd_dw)
public function integer fnu_obtener_pcxtc (datetime pdt_fa, datetime pdt_ff, datetime pdt_fped, datetime pdt_fued, decimal d_pot_afec, decimal d_pot_cont, ref decimal pd_paxtc, ref decimal pd_pcxtc, ref decimal pd_paxtc_mant, ref decimal pd_pcxtc_mant)
public function integer fnu_procesar_interr (ref datawindow pd_dw, long pl_nro_incidencia)
public function boolean frn_evaluo_f_deteccion (ref datawindow pd_dw, datetime pdt_fec_ant, datetime pdt_fec_prim_aviso)
public function boolean frn_hay_situacion_climatologica (long pl_nro_cmd, datetime pdt_fecha)
public function datetime fnu_obtener_fec_p_aviso (decimal pdec_instalacion, integer pi_tip_incidencia)
end prototypes

public function boolean frn_evaluo_fec_causa (ref datawindow pd_dw, datetime pdt_fec_ant);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_evaluo_fec_causa
//
// Objetivo:  Evalua fecha de causa localizada
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, pdt_fec_ant
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////

DateTime ldt_fec_bri
DateTime ldt_fec_en_rep
DateTime ldt_fecha_actual
long ll_ot
Int li_cod_estado
Long ll_nro_incidencia
ll_ot = pd_dw.getitemnumber(1,"OT")
If not isnull(ll_ot) THEN    //SI YA INGRESE UNA ORDEN DE TRABAJO

	IF ISNULL(pd_dw.getitemdatetime(1,"fec_causa")) THEN  //SI LA FECHA ES NULA
			gnv_msg.f_mensaje("AI62","","",OK!)
			pd_dw.setitem(1,"fec_causa",pdt_fec_ant)
			pd_dw.accepttext()
			return false
	END IF

	// SI LA FECHA DE CAUSA ES MENOR QUE LA FECHA DE LA OT

	SELECT "GI_OT"."F_DESDE" INTO :ldt_fec_bri FROM "GI_OT" WHERE "GI_OT"."NRO_OT" =:ll_ot;
	If ldt_fec_bri>pd_dw.getitemdatetime(1,"fec_causa") THEN
			gnv_msg.f_mensaje("AI62","","",OK!)
			pd_dw.setitem(1,"fec_causa",pdt_fec_ant)
			pd_dw.accepttext()
			return false
	End If

	// SI LA FECHA DE LA CAUSA EN MAYOR QUE LA FECHA DEL DIA Y ES UNA 
	// INCIDENCIA IMPREVISTA

	ldt_fecha_actual=fgnu_fecha_actual()
	IF pd_dw.getitemnumber(1,"Tipo_incidencia")=fgci_incidencia_imprevista THEN
		IF pd_dw.getitemdatetime(1,"fec_causa")>ldt_fecha_actual THEN
			   gnv_msg.f_mensaje("AI97","","",OK!)
				//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de la causa debe ser m$$HEX1$$e100$$ENDHEX$$s reciente que la fecha actual ")
				pd_dw.setitem(1,"fec_causa",pdt_fec_ant)
				pd_dw.accepttext()
				return false
		END IF
	END IF
	// SI LA FECHA DE LA CAUSA ES MENOR QUE LA FECHA DEL DIA Y ES UNA
	// INCIDENCIA PROGRAMADA
	IF pd_dw.getitemnumber(1,"Tipo_incidencia")=fgci_incidencia_programada THEN
		ldt_fecha_actual=fgnu_fecha_actual()
		IF pd_dw.getitemdatetime(1,"fec_causa")<ldt_fecha_actual THEN
			gnv_msg.f_mensaje("AI98","","",OK!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de la causa debe ser menos reciente que la fecha actual ")
			pd_dw.setitem(1,"fec_causa",pdt_fec_ant)
			pd_dw.accepttext()
			return false
		END IF
	END IF
	IF pd_dw.getitemnumber(1,"estado_actual")>fgci_incidencia_causa_localizada THEN
		ll_nro_incidencia = pd_dw.getitemnumber(1,"nro_incidencia")
		li_cod_estado = fgci_incidencia_en_reposicion
		SELECT "ESTADO_OPER"."F_ALTA" INTO :ldt_fec_en_rep FROM "ESTADO_OPER" WHERE "ESTADO_OPER"."COD_ESTADO"=:li_cod_estado and "ESTADO_OPER"."NRO_INCIDENCIA"=:ll_nro_incidencia;
		If ldt_fec_en_rep < pd_dw.getitemdatetime(1,"fec_causa") THEN
			gnv_msg.f_mensaje("AI63","","",OK!)
			pd_dw.setitem(1,"fec_causa",pdt_fec_ant)
			pd_dw.accepttext()
			return false
		END IF
	END IF
END IF
Return true
end function

public function integer frn_hab_material_averiado (integer pi_estado_operaciones);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hab_material_averiado
//
// Objetivo:  Habilita campo material averiado.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pi_estado_operaciones
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////





// 1 protegido
// 0 habilitado

// Deber$$HEX2$$e1002000$$ENDHEX$$estar habilitada cuando la incidencia este en servicio repuesto o resuelta
//
//if pi_estado_operaciones =  fgci_incidencia_servicio_repuesto() or pi_estado_operaciones = fgci_incidencia_resuelta() then 
//	return 0
//end if
//return 1
return 1

end function

public function boolean frn_evaluo_f_est_res (ref datawindow pd_dw, datetime pdt_fec_ant);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_evaluo_f_est_res
//
// Objetivo:  Evalua fecha estado resuelto.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, pdt_fec_ant
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


IF pd_dw.getitemdatetime(1,"f_deteccion") > pd_dw.getitemdatetime(1,"f_est_res") THEN
	gnv_msg.f_mensaje("AI64","","",OK!)
	pd_dw.setitem(1,"f_est_res",pdt_fec_ant)
	pd_dw.Accepttext()
	return false
END IF
return true
end function

public function boolean frn_hab_menu_sum_imp (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hab_menu_sum_imp
//
// Objetivo:  Habilita seg$$HEX1$$fa00$$ENDHEX$$n la acci$$HEX1$$f300$$ENDHEX$$n de men$$HEX1$$fa00$$ENDHEX$$, verifica si existen
//            suministros importantes.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////



long ll_cant_sum
long ll_nro_incid
ll_nro_incid=pd_dw.getitemnumber(1,"nro_incidencia")
select count(*) into :ll_cant_sum from sum_imp where nro_incidencia=:ll_nro_incid;
IF ll_cant_sum=0 THEN
	return false
END IF
return true
end function

public function boolean frn_menu_hab_ot (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_menu_hab_ot
//
// Objetivo:  Habilita orden de trabajo.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////




IF ISNULL(pd_dw.getitemnumber(1,"OT")) THEN
		RETURN FALSE
ELSE
		RETURN TRUE
END IF
end function

public function integer fnu_obtener_pcxtc (datetime pdt_fa, datetime pdt_ff, datetime pdt_fped, datetime pdt_fued, decimal d_pot_afec, decimal d_pot_cont, ref decimal pd_paxtc, ref decimal pd_pcxtc, ref decimal pd_paxtc_mant, ref decimal pd_pcxtc_mant);// PARAMETROS RECIBIDOS :

//  PDT_FA  : Fecha de alta de la interrupci$$HEX1$$f300$$ENDHEX$$n
//  PDT_FF  : Fecha de reposici$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n
//  PDT_FPED : Fecha del primer estado de mantenimiento
//	 PDT_FPUD : Fecha ultimo estado de mantenimiento
//	 d_pot_afec : Potencia afectada de la interrupci$$HEX1$$f300$$ENDHEX$$n
//  d_pot_cont : Potencia contratada de la interrupci$$HEX1$$f300$$ENDHEX$$n
//  pd_paxtc    :   
//  pd_pcxtc
//  pd_paxtc_mant
//  pd_pcxtc_mant

long ll_dm  //duracion mantenimiento
long ll_do  //duracion operaciones

IF ISNULL(PDT_FPED) THEN   // SI ES NULA LA FECHA DE ST EN MANTENIMIENTO
	ll_do=fg_duracion_minutos(PDT_FA,PDT_FF)			
	ll_dm=0
	pd_paxtc = d_pot_afec*ll_do
	pd_paxtc_mant = d_pot_afec*ll_dm
	pd_pcxtc = d_pot_cont*ll_do
	pd_pcxtc_mant = d_pot_cont*ll_dm
	RETURN 1
END IF

IF PDT_FA > PDT_FPED THEN

	IF PDT_FA >= PDT_FUED  THEN
			ll_dm=0
			ll_do=fg_duracion_minutos(PDT_FA,PDT_FF)			
	ELSE
		IF PDT_FA < PDT_FUED THEN

			IF PDT_FF <= PDT_FUED THEN
				ll_dm=fg_duracion_minutos(PDT_FA,PDT_FF)
				ll_do=0
			ELSE
				ll_dm=fg_duracion_minutos(PDT_FA,PDT_FUED)
				ll_do=fg_duracion_minutos(PDT_FUED,PDT_FF)
			END IF
		END IF
	END IF
ELSE
	IF PDT_FA <= PDT_FPED THEN
	 	IF PDT_FF <= PDT_FPED THEN
			ll_do=fg_duracion_minutos(PDT_FA,PDT_FF)
			ll_dm=0
		ELSE
			IF PDT_FF >= PDT_FPED THEN
				IF PDT_FF >= PDT_FUED THEN
					ll_dm=fg_duracion_minutos(PDT_FPED,PDT_FUED)
					ll_do=fg_duracion_minutos(PDT_FUED,PDT_FF)+fg_duracion_minutos(PDT_FA,PDT_FPED)
				ELSE
					ll_dm=fg_duracion_minutos(PDT_FPED,PDT_FF)
					ll_do=fg_duracion_minutos(PDT_FA,PDT_FPED)
				END IF
			END IF
		END IF
	END IF
END IF


pd_paxtc = d_pot_afec*ll_do
pd_paxtc_mant = d_pot_afec*ll_dm
pd_pcxtc = d_pot_cont*ll_do
pd_pcxtc_mant = d_pot_cont*ll_dm

RETURN 1
		
end function

public function integer fnu_procesar_interr (ref datawindow pd_dw, long pl_nro_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtengo_datos
// 
// Objetivo : Funcion que procesa las interrupciones de una incidencias para
//	calcular el paxtc,pcxtc,paxtc_mant,pcxtc_mant
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pl_nro_incidencial,pd_dw
//	Entrada:  
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	9/8/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


Decimal   ld_paxtc,ld_pcxtc,ld_paxtc_mant,ld_pcxtc_mant
Decimal   ld_paxtc_tot,ld_pcxtc_tot,ld_paxtc_mant_tot,ld_pcxtc_mant_tot
Decimal   ld_pot_inst_afec
Decimal	 ld_pot_contr_afec
Decimal   ld_pot_instalada
Decimal 	 ld_pot_contratada

Decimal ld_tiepi
Decimal ld_tiebt
Decimal ld_tiepi_mant
Decimal ld_tiebt_mant
DateTime ldt_f_alta,ldt_f_reposicion
DateTime ldt_f_pem,ldt_f_uem  //primer estado en mantenimiento, ultimo estado en mantenimiento
Long ll_nro_centro
ld_paxtc_tot=0
ld_pcxtc_tot=0
ld_paxtc_mant_tot=0
ld_pcxtc_mant_tot=0

ld_paxtc=0
ld_pcxtc=0
ld_paxtc_mant=0
ld_pcxtc_mant=0

ld_tiepi = 0
ld_tiebt = 0

SetNull(ldt_f_pem)   //inicializo con nula la fecha del primer estado en mantenimiento
SetNull(ldt_f_uem)   //inicializo con nulo la fecha del ultimo estado en mantenimiento

IF NOT ISNULL(pd_dw.getitemnumber(1,"estado_mantenimiento")) and pd_dw.getitemnumber(1,"estado_mantenimiento") > 0  THEN
//  SELECT "ESTADO_MANT"."F_ALTA"  
//  INTO :ldt_f_pem  
//  FROM "ESTADO_MANT"  
//  WHERE ( "ESTADO_MANT"."COD_ESTADO" = :fgci_incidencia_mant_sin_atender) AND  
//        ( "ESTADO_MANT"."NRO_INCIDENCIA" = :pl_nro_incidencia )   ;
//
//  SELECT "ESTADO_MANT"."F_ALTA"  
//  INTO :ldt_f_uem  
//  FROM "ESTADO_MANT"  
//  WHERE ( "ESTADO_MANT"."NRO_INCIDENCIA" = :pl_nro_incidencia ) and 
//		  ( "ESTADO_MANT"."COD_ESTADO" = (SELECT MAX(COD_ESTADO) FROM ESTADO_MANT WHERE NRO_INCIDENCIA=:pl_nro_incidencia));
//
END IF

Int l_fin_cursor

Declare lc_cur_int CURSOR FOR
 (SELECT "SGD_INTERRUPCION"."POT_INST_AFEC",   
         "SGD_INTERRUPCION"."POT_CONTR_AFEC",   
         "SGD_INTERRUPCION"."F_ALTA",   
         "SGD_INTERRUPCION"."F_REPOSICION"  
    FROM "SGD_INTERRUPCION" 
	 WHERE NRO_INCIDENCIA =:pl_nro_incidencia) Using sqlca;

OPEN lc_cur_int;
l_fin_cursor=0
FETCH lc_cur_int INTO: ld_pot_inst_afec, :ld_pot_contr_afec, :ldt_f_alta, :ldt_f_reposicion;
DO 
	IF sqlca.sqlcode = 0 THEN
		fnu_obtener_pcxtc(ldt_f_alta,ldt_f_reposicion,ldt_f_pem,ldt_f_uem,ld_pot_inst_afec,ld_pot_contr_afec,ld_paxtc,ld_pcxtc,ld_paxtc_mant,ld_pcxtc_mant)
		ld_paxtc_tot=ld_paxtc_tot+ld_paxtc
		ld_pcxtc_tot=ld_pcxtc_tot+ld_pcxtc
		ld_paxtc_mant_tot=ld_paxtc_mant_tot+ld_paxtc_mant
		ld_pcxtc_mant_tot=ld_pcxtc_mant_tot+ld_pcxtc_mant
	ELSEIF sqlca.sqlcode = -1 THEN
		// MENSAJE DE ERROR
		HALT
	END IF
	FETCH lc_cur_int INTO: ld_pot_inst_afec, :ld_pot_contr_afec, :ldt_f_alta, :ldt_f_reposicion;
	IF sqlca.sqlcode <> 0 THEN
		l_fin_cursor = 1
	END IF
LOOP UNTIL (l_fin_Cursor = 1)
CLOSE lc_cur_int;


/////////////////CALCULO PAXTC ,PCXTC, PAXTC_MANT,PCXTC_MANT/////////////

ld_paxtc_tot=ld_paxtc_tot+ld_paxtc_mant_tot   //paxtc total de operaciones + mantenimiento
ld_pcxtc_tot=ld_pcxtc_tot+ld_pcxtc_mant_tot   //pcxtc total de operaciones + mantenimiento

pd_dw.setitem(1,"paxtc",ld_paxtc_tot)
pd_dw.setitem(1,"pcxtc",ld_pcxtc_tot)
pd_dw.setitem(1,"paxtc_mant",ld_paxtc_mant_tot)
pd_dw.setitem(1,"pcxtc_mant",ld_pcxtc_mant_tot)

////////////////////////// CALCULO TIEPI Y TIEBT ////////////////////////

ll_nro_centro=pd_dw.getitemnumber(1,"nro_mesa")
ld_pot_instalada=0
ld_pot_contratada=0
SELECT POT_CONTRATADA,POT_INSTALADA 
INTO 	:ld_pot_contratada, 
		:ld_pot_instalada 
FROM SGD_CENTRO 
WHERE NRO_CENTRO=:ll_nro_centro AND tip_centro=3;
if isnull(ld_pot_instalada) or ld_pot_instalada=0 THEN
	ld_tiepi=0
	ld_tiepi_mant=0
ELSE
	ld_tiepi=ld_paxtc_tot/ld_pot_instalada   
	ld_tiepi_mant=ld_paxtc_mant_tot/ld_pot_instalada
END IF
IF ISNULL(ld_pot_contratada) or ld_pot_contratada=0 THEN
	ld_tiebt=0
	ld_tiebt_mant=0
ELSE
	ld_tiebt=ld_pcxtc_tot/ld_pot_contratada
	ld_tiebt_mant=ld_pcxtc_mant_tot/ld_pot_contratada
END IF

pd_dw.setitem(1,"tiepi",ld_tiepi)
pd_dw.setitem(1,"tiebt",ld_tiebt)
pd_dw.setitem(1,"tiepi_mant",ld_tiepi_mant)
pd_dw.setitem(1,"tiebt_mant",ld_tiebt_mant)

/////////////////////////////////////////////////////////////////////
Return 1






end function

public function boolean frn_evaluo_f_deteccion (ref datawindow pd_dw, datetime pdt_fec_ant, datetime pdt_fec_prim_aviso);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_evaluo_f_deteccion
//
// Objetivo: Evalua fecha de detecci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, pdt_fec_ant
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


//ARGUMENTOS PD_DW DATAWINDOWS
// LA FECHA ANTERIOR PARA DEJARLA COMO ESTABA EN CASO DE ERROR				
DateTime ldt_fec_bri
DateTime lDT_fec_det
DateTime ldt_fec_alt
long ll_ot

// SI LA INCIDENCIA ES PROGRAMADA

IF pd_dw.getitemnumber(1,"Tipo_incidencia")=fgci_incidencia_programada THEN

	////SI LA FECHA DE DETECCION ES MENOR QUE LA FECHA ACTUAL MENSAJE

	IF pd_dw.getitemdatetime(1,"f_deteccion")<fgnu_fecha_actual() THEN
		gnv_msg.f_mensaje("AI55","","",OK!)
		pd_dw.SetItem(1,"f_deteccion",pdt_fec_ant)
		pd_dw.Accepttext()
		RETURN FALSE
	END IF
	ll_ot = pd_dw.getitemnumber(1,"OT")

	//   SI LA INCIDENCIA YA TIENE UNA ORDEN DE TRABAJO


	IF not isnull(ll_ot) THEN  // SI EXISTE ORDEN DE TRABAJO
		SELECT "GI_OT"."F_DESDE" INTO :ldt_fec_bri FROM "GI_OT" WHERE "GI_OT"."NRO_OT" =:ll_ot using sqlca;
		IF sqlca.sqlcode=0 THEN
			ldt_fec_det = pd_dw.getitemdatetime(1,"f_deteccion")

			// SI LA FECHA DE DETECCION DE LA INCIDENCIAS ES MAYOR QUE LA FECHA DE LA ORDEN , MENSAJE

			IF ldt_fec_bri<pd_dw.getitemdatetime(1,"f_deteccion") THEN
				gnv_msg.f_mensaje("AI61","","",OK!)
				pd_dw.setitem(1,"f_deteccion",pdt_fec_ant)
				pd_dw.accepttext()
				RETURN FALSE
			END IF
		END IF	
	END IF

	RETURN TRUE
Else   // SI LA INCIDENCIA ES IMPREVISTA
	



	// SI LA FECHA DE DETECCION DE LA INCIDENCIAS ES MAYOR QUE LA FECHA ACTUAL, MENSAJE

	IF pd_dw.getitemdatetime(1,"f_deteccion") > fgnu_fecha_actual() THEN
		gnv_msg.f_mensaje("AI54","","",OK!)
		pd_dw.setitem(1,"f_deteccion",pdt_fec_ant)
		pd_dw.Accepttext()
		RETURN FALSE
	END IF

	// SI LA FECHA DE DETECCION DE LA INCIDENCIAS ES MAYOR QUE LA FECHA DEL  AVISO MAS VIEJO
//	IF NOT ISNULL(pdt_fec_prim_aviso) THEN
//		IF pd_dw.getitemdatetime(1,"f_deteccion") > pdt_fec_prim_aviso THEN
//			gnv_msg.f_mensaje("AI54","","",OK!)
//			pd_dw.setitem(1,"f_deteccion",pdt_fec_ant)
//			pd_dw.Accepttext()
//			RETURN FALSE
//		END IF
//	END IF

END IF

// SI LA FECHA DE DETECCION ES MAYOR QUE LA FECHA DE ESTIMACION, MENSAJE

IF pd_dw.getitemdatetime(1,"f_deteccion") > pd_dw.getitemdatetime(1,"f_est_res") THEN
	gnv_msg.f_mensaje("AI60","","",OK!)
	pd_dw.setitem(1,"f_deteccion",pdt_fec_ant)
	pd_dw.Accepttext()
	RETURN FALSE
END IF
ll_ot = pd_dw.getitemnumber(1,"OT")

// SI LA INCIDENCIA , YA TIENE UNA ORDEN DE TRABAJO GENERADA

IF not isnull(ll_ot) THEN  // SI EXISTE ORDEN DE TRABAJO
	SELECT "GI_OT"."F_DESDE" INTO :ldt_fec_bri FROM "GI_OT" WHERE "GI_OT"."NRO_OT" =:ll_ot using sqlca;
	IF sqlca.sqlcode=0 THEN
		
		// SI LA FECHA DE LA ORDEN ES MENOR QUE LA FECHA DE DETECCION, MENSAJE

		IF ldt_fec_bri<pd_dw.getitemdatetime(1,"f_deteccion") THEN
				gnv_msg.f_mensaje("AI61","","",OK!)
				pd_dw.setitem(1,"f_deteccion",pdt_fec_ant)
				pd_dw.accepttext()
				RETURN FALSE
		END IF
	END IF
END IF

//
RETURN TRUE
end function

public function boolean frn_hay_situacion_climatologica (long pl_nro_cmd, datetime pdt_fecha);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hay_situacion_climatologica
//
// Objetivo:  Verifica si existen datos en situaci$$HEX1$$f300$$ENDHEX$$n climatol$$HEX1$$f300$$ENDHEX$$gica.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: --
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


int i_cant_filas
DateTime pd_fecha
pd_fecha=DateTime(Date(pdt_fecha))
//pd_fecha=DateTime(Today())
select count(*) into :i_cant_filas from sit_clima where sit_clima.nro_cmd=:pl_nro_cmd and fecha=:pd_fecha;
IF i_cant_filas <= 0 THEN
	return false
End If		
return true
end function

public function datetime fnu_obtener_fec_p_aviso (decimal pdec_instalacion, integer pi_tip_incidencia);// Retorna la fecha del primer aviso que cuelga de la instalacion 
//	pasada como parametro
Int li_clase_aviso

DateTime ldt_fec_prim_aviso
SETNULL(ldt_fec_prim_aviso)

IF pi_tip_incidencia = fgci_incidencia_calidad then
	li_clase_aviso = fgci_clase_avi_calidad
ELSE
	li_clase_aviso = fgci_clase_avi_normal
END IF

ldt_fec_prim_aviso = fg_valida_fecha_max_inc(ldt_fec_prim_aviso,pdec_instalacion, li_clase_aviso)

If IsNull(ldt_fec_prim_aviso) Then
	ldt_fec_prim_aviso = fgnu_fecha_actual()
End If			
//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************

return ldt_fec_prim_aviso

//*******************************************
//**  OSGI 2001.2  	07/08/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
//*******************************************
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  IF pi_tip_incidencia=fgci_incidencia_calidad then
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  	
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  	SELECT NVL(MIN("GI_AVISOS_INSTALACION"."F_ALTA"),sysdate) INTO :ldt_fec_prim_aviso
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		FROM "GI_AVISOS_INSTALACION"
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" =:pdec_instalacion and "GI_AVISOS_INSTALACION"."EST_AVISO"  = :fgci_aviso_pendiente  and
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		 "GI_AVISOS_INSTALACION"."CLASE_AVISO" =  :fgci_clase_avi_calidad;
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  else	
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  	SELECT NVL(MIN("GI_AVISOS_INSTALACION"."F_ALTA"),sysdate) INTO :ldt_fec_prim_aviso
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		FROM "GI_AVISOS_INSTALACION"
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" =:pdec_instalacion and "GI_AVISOS_INSTALACION"."EST_AVISO"  = :fgci_aviso_pendiente and
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  		 "GI_AVISOS_INSTALACION"."CLASE_AVISO" <>  :fgci_clase_avi_calidad;
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  
//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  end if


end function

on u_inc_2004_rn_form_inf_general.create
TriggerEvent( this, "constructor" )
end on

on u_inc_2004_rn_form_inf_general.destroy
TriggerEvent( this, "destructor" )
end on


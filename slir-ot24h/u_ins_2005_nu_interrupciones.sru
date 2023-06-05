HA$PBExportHeader$u_ins_2005_nu_interrupciones.sru
forward
global type u_ins_2005_nu_interrupciones from nonvisualobject
end type
end forward

global type u_ins_2005_nu_interrupciones from nonvisualobject
end type
global u_ins_2005_nu_interrupciones u_ins_2005_nu_interrupciones

forward prototypes
public function integer fnu_o_datos_int2 (decimal pdec_nro_inst, long pl_nro_incid, ref datetime pdt_f_repos, ref datetime pdt_f_alta, ref string ps_tip_int, ref long pl_pot_inst, ref long pl_pot_contr, ref long pl_cant_cli)
public function integer fnu_b_sum_imp (decimal pdec_nro_inst, long pl_nro_incid)
public function integer fnu_b_interrup (decimal pdec_nro_inst, long pl_nro_incid)
public function integer fnu_i_interrup (ref s_interrupcion pstr_int)
public function integer fnu_v_sum_imp (decimal pdec_nro_inst, long pl_nro_incid)
public function integer fnu_a_interrup (decimal pdec_nro_inst, long pl_nro_incid, datetime pdt_f_repos, datetime pdt_f_alta, long pl_cant_cli_afec, long pl_pot_inst_afec, long pl_pot_contr_afec)
public function integer fnu_o_datos_int (decimal pdec_nro_inst, long pl_nro_incid, ref datetime pdt_f_repos, ref datetime pdt_f_alta)
public function integer fnu_v_sum_imp2 (decimal pdec_nro_inst, long pl_nro_incid)
public function integer fnu_b_sum_imp2 (decimal pdec_nro_inst, long pl_nro_incid)
public function integer fnu_v_inst_en_avires (decimal pdec_nro_inst)
public function integer fnu_v_sum_imp3 (decimal pdec_nro_inst, long pl_nro_incid)
end prototypes

public function integer fnu_o_datos_int2 (decimal pdec_nro_inst, long pl_nro_incid, ref datetime pdt_f_repos, ref datetime pdt_f_alta, ref string ps_tip_int, ref long pl_pot_inst, ref long pl_pot_contr, ref long pl_cant_cli);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_o_datos_int2
//
// Objetivo: Obtiene los datos de la tabla Interrupci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada:pdec_nro_inst, pl_nro_incid, pdt_f_repos, pdt_f_alta
//               ps_tip_int, pl_pot_inst, pl_pot_contr, pl_cant_cli
//       Salida: --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////


SELECT "INTERRUPCION"."F_REPOSICION", 
		 "INTERRUPCION"."TIP_INTERRUPCION",
		 "INTERRUPCION"."POT_INST_AFEC",
		 "INTERRUPCION"."F_ALTA",
		 "INTERRUPCION"."CCLI_AFEC",
		 "INTERRUPCION"."POT_CONTR_AFEC"
INTO :pdt_f_repos, :ps_tip_int, :pl_pot_inst, :pdt_f_alta,
	  :pl_cant_cli, :pl_pot_contr
FROM "INTERRUPCION"  
WHERE "INTERRUPCION"."NRO_INSTALACION" = :pdec_nro_inst AND
		"INTERRUPCION"."NRO_INCIDENCIA"  = :pl_nro_incid;

RETURN sqlca.SqlCode
end function

public function integer fnu_b_sum_imp (decimal pdec_nro_inst, long pl_nro_incid);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_b_sum_imp
//
// Objetivo:	Recorre todos los suministros alimentados por la inst.
//					en cuesti$$HEX1$$f300$$ENDHEX$$n, verificando si es un sum. importante,
//					o sea que exista en 'suministros_imp', y en caso afirmativo
//					se borra el registro de 'sum_imp'.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdec_nro_inst
//					pl_nro_incid
//
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/05/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// OBSOLETO, YA NO SE DAN DE BAJA LOS REGISTROS EN GI_SUM_IMP


RETURN 1


end function

public function integer fnu_b_interrup (decimal pdec_nro_inst, long pl_nro_incid);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_b_interrup
//
// Objetivo: Anula datos de la tabla Interrupci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada:pdec_nro_inst, pl_nro_incid
//       Salida: --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

DELETE FROM "INTERRUPCION"  
WHERE ( "INTERRUPCION"."NRO_INCIDENCIA" = :pl_nro_incid) AND  
      ( "INTERRUPCION"."NRO_INSTALACION" = :pdec_nro_inst);

RETURN sqlca.SqlCode
end function

public function integer fnu_i_interrup (ref s_interrupcion pstr_int);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_i_interrup
//
// Objetivo: Agrega datos en la tabla Interrupci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada:pstr_int
//       Salida:--
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

INSERT INTO "INTERRUPCION"  
	("USUARIO", "F_ACTUAL", "H_ACTUAL", "PROGRAMA", 
	 "TIP_INTERRUPCION",   
	 "IND_OTRAS_INS", "F_REPOSICION", "H_REPOSICION", "F_ALTA",   
    "H_ALTA", "NRO_INCIDENCIA", "POT_INSTALADA", "POT_CONTRATADA",   
    "KWH", "CCLI_AFEC", "IND_ULT_NIVEL", "IND_FICTICIO",   
    "NRO_INSTALACION", "NRO_PADRE", "TIPO_INSTALACION",   
    "CO_NIVEL", "TIPO_INSTALACION_PADRE", "CO_NIVEL_PADRE",   
    "POT_INST_AFEC", "POT_CONTR_AFEC", "CANT_CLI" )  
VALUES (:pstr_int.gs_usuario, :pstr_int.gdt_f_actual, :pstr_int.gdt_h_actual,&
		 :pstr_int.gs_programa, :pstr_int.gs_tip_int, :pstr_int.gi_ind_otras_ins,&
		 :pstr_int.gdt_f_repos, :pstr_int.gdt_h_repos, :pstr_int.gdt_f_alta,& 
  		 :pstr_int.gdt_h_alta, :pstr_int.gl_nro_incid, :pstr_int.gl_pot_inst,&
		 :pstr_int.gl_pot_contr, :pstr_int.gl_kwh, :pstr_int.gl_cant_cli_afec,&   
  		 :pstr_int.gi_ind_ult_nivel, :pstr_int.gs_ind_ficticio, :pstr_int.gdec_nro_inst,&
		 :pstr_int.gdec_nro_inst_padre, :pstr_int.gi_tipo_inst, :pstr_int.gi_co_nivel,&
		 :pstr_int.gi_tipo_inst_padre, :pstr_int.gi_co_nivel_padre, :pstr_int.gl_pot_inst_afec,&
		 :pstr_int.gl_pot_contr_afec, :pstr_int.gl_cant_cli);

RETURN sqlca.SqlCode
end function

public function integer fnu_v_sum_imp (decimal pdec_nro_inst, long pl_nro_incid);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_v_sum_imp
//
// Objetivo:	Recorro todos los suministros alimentados por la inst.
//					en cuesti$$HEX1$$f300$$ENDHEX$$n, verificando si es un sum. importante,
//					o sea que exista en 'GI_SUMINISTROS_IMP', y en caso afirmativo
//					se genera un registro en 'sum_imp'.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdec_nro_inst
//					pl_nro_incid
//
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/05/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// OBSOLETO, YA NO SE UTILIZA LA TABLA GI_SUM_IMP

RETURN 1


end function

public function integer fnu_a_interrup (decimal pdec_nro_inst, long pl_nro_incid, datetime pdt_f_repos, datetime pdt_f_alta, long pl_cant_cli_afec, long pl_pot_inst_afec, long pl_pot_contr_afec);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_a_interrup
//
// Objetivo: Actualiza los datos de la tabla Interrupci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada:pdec_nro_inst, pl_nro_incid, pdt_f_repos, 
//               pl_cant_cli_afec, pl_pot_inst_afec, pl_pot_contr_afec
//       Salida: --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

UPDATE "INTERRUPCION"  
SET "USUARIO" = :gs_usuario,    
  	 "PROGRAMA" = 'W_2201', 
	 "F_REPOSICION" = :pdt_f_repos, 
	 "F_ALTA" = :pdt_f_alta,
	 "CCLI_AFEC" = :pl_cant_cli_afec,   
    "POT_INST_AFEC" = :pl_pot_inst_afec, 
	 "POT_CONTR_AFEC" = :pl_pot_contr_afec  
WHERE ( "INTERRUPCION"."NRO_INSTALACION" = :pdec_nro_inst ) AND  
      ( "INTERRUPCION"."NRO_INCIDENCIA" = :pl_nro_incid);

RETURN sqlca.SqlCode

end function

public function integer fnu_o_datos_int (decimal pdec_nro_inst, long pl_nro_incid, ref datetime pdt_f_repos, ref datetime pdt_f_alta);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_o_datos_int
//
// Objetivo: Obtiene interrupci$$HEX1$$f300$$ENDHEX$$n y fecha de reposici$$HEX1$$f300$$ENDHEX$$n de la 
//           tabla interrupci$$HEX1$$f300$$ENDHEX$$n con las condiciones dadas.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada:pdec_nro_inst, pl_nro_incid, pdt_f_repos
//       Salida: --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

SELECT "INTERRUPCION"."F_REPOSICION", "INTERRUPCION"."F_ALTA"
INTO :pdt_f_repos, :pdt_f_alta
FROM "INTERRUPCION"  
WHERE "INTERRUPCION"."NRO_INSTALACION" = :pdec_nro_inst AND
		"INTERRUPCION"."NRO_INCIDENCIA"  = :pl_nro_incid;

RETURN sqlca.SqlCode
end function

public function integer fnu_v_sum_imp2 (decimal pdec_nro_inst, long pl_nro_incid);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_v_SUM_IMP2
//
// Objetivo:	Recorro todos los suministros alimentados por la inst.
//					en cuesti$$HEX1$$f300$$ENDHEX$$n, verificando si es un sum. importante,
//					o sea que exista en 'GI_SUMINISTROS_IMP', y en caso afirmativo
//					se genera un registro en 'GI_SUM_IMP'.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdec_nro_inst
//					pl_nro_incid
//
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/05/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// OBSOLETO, NO SE UTILIZA GI_SUM_IMP				

RETURN 1


end function

public function integer fnu_b_sum_imp2 (decimal pdec_nro_inst, long pl_nro_incid);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_b_sum_imp2
//
// Objetivo:	Recorre todos los suministros alimentados por la inst.
//					en cuesti$$HEX1$$f300$$ENDHEX$$n, verificando si es un sum. importante,
//					o sea que exista en 'GI_SUMINISTROS_IMP', y en caso afirmativo
//					se borra el registro de 'GI_SUM_IMP'.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdec_nro_inst
//					pl_nro_incid
//
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/05/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// OBSOLETO YA NO SE UTILIZA LA TABLA GI_SUM_IMP

RETURN 1


end function

public function integer fnu_v_inst_en_avires (decimal pdec_nro_inst);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_v_inst_en_avires
//
// Objetivo:	Verifica la existencia de el nro de instalaci$$HEX1$$f300$$ENDHEX$$n
//					pasado en la tabla "Avisos_Res".
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdec_nro_inst
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	13/09/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_cant_filas

SELECT Count(*)  
INTO :ll_cant_filas  
FROM "AVISOS_RES"  
WHERE "AVISOS_RES"."NRO_INSTALACION" = :pdec_nro_inst   ;

IF sqlca.SqlCode = 0 THEN
	if	ll_cant_filas>0 then
			RETURN 1
	ELSE
			RETURN 0
	END IF
ELSEIF sqlca.SqlCode = 100 THEN
	RETURN 0
ELSE
	RETURN -1
END IF
end function

public function integer fnu_v_sum_imp3 (decimal pdec_nro_inst, long pl_nro_incid);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_v_sum_imp3
//
// Objetivo:	Recorro todos los suministros alimentados por la inst.
//					en cuesti$$HEX1$$f300$$ENDHEX$$n, verificando si es un sum. importante,
//					o sea que exista en 'GI_SUMINISTROS_IMP', y en caso afirmativo
//					se genera un registro en 'GI_SUM_IMP'.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdec_nro_inst
//					pl_nro_incid
//
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	13/09/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


// OBSOLETO YA NO SE UTILIZA LA TABLA GI_SUM_IMP

RETURN 1


end function

on u_ins_2005_nu_interrupciones.create
TriggerEvent( this, "constructor" )
end on

on u_ins_2005_nu_interrupciones.destroy
TriggerEvent( this, "destructor" )
end on


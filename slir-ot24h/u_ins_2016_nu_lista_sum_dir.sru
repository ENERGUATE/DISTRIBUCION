HA$PBExportHeader$u_ins_2016_nu_lista_sum_dir.sru
forward
global type u_ins_2016_nu_lista_sum_dir from nonvisualobject
end type
end forward

global type u_ins_2016_nu_lista_sum_dir from nonvisualobject
end type
global u_ins_2016_nu_lista_sum_dir u_ins_2016_nu_lista_sum_dir

forward prototypes
public function integer fnu_existe_en_acosum (long pl_nis, long pl_acometida)
public function integer fnu_actualizar_aco_sum (long pl_nis, long pl_acometida)
public function integer fnu_desasociar_suministro (long pl_nis, long pl_nro_acometida)
public function integer fnu_v_sum_imp_nis (long pl_nis)
public function integer fnu_actualizar_aco_ins (long pl_aco_ant, long pl_aco_nueva, decimal pl_pot_contrata, integer pi_cant_cli)
end prototypes

public function integer fnu_existe_en_acosum (long pl_nis, long pl_acometida);int li_veces

  SELECT COUNT(*) 
    INTO :li_veces  
    FROM "ACO_SUM"  
   WHERE ( "ACO_SUM"."NRO_ACOMETIDA" > 0 ) AND  
			( "ACO_SUM"."NRO_ACOMETIDA" = :pl_acometida ) AND  
         ( "ACO_SUM"."NIS_RAD" = :pl_nis )   ;


Return li_veces
end function

public function integer fnu_actualizar_aco_sum (long pl_nis, long pl_acometida);  UPDATE "ACO_SUM"  
     SET "NRO_ACOMETIDA" = :pl_acometida  
   WHERE "ACO_SUM"."NIS_RAD" = :pl_nis   ;


Return sqlca.sqlcode
end function

public function integer fnu_desasociar_suministro (long pl_nis, long pl_nro_acometida);Decimal ll_pot_contrata, ll_pot_contr_ant
int li_cant_cli

  UPDATE "ACO_SUM"  
     SET "NRO_ACOMETIDA" = 0
   WHERE "ACO_SUM"."NIS_RAD" = :pl_nis   ;

  SELECT "ACO_SUM"."POT_CONTRATADA"  
    INTO :ll_pot_contrata  
    FROM "ACO_SUM"  
   WHERE "ACO_SUM"."NIS_RAD" = :pl_nis   ;

  SELECT "SGD_ACOMETIDA"."POT_CONTRATADA","SGD_ACOMETIDA"."CANT_CLI"  
    INTO :ll_pot_contr_ant , 
			:li_cant_cli
    FROM "SGD_ACOMETIDA"  
   WHERE "SGD_ACOMETIDA"."CODIGO" = :pl_nro_acometida AND BDI_JOB= 0 ;

  UPDATE "SGD_ACOMETIDA"  
     SET "POT_CONTRATADA" = :ll_pot_contr_ant - :ll_pot_contrata ,
			"CANT_CLI" = :li_cant_cli - 1
   WHERE "SGD_ACOMETIDA"."CODIGO" = :pl_nro_acometida  AND BDI_JOB=0 ;

Return sqlca.sqlcode

end function

public function integer fnu_v_sum_imp_nis (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_v_sum_imp_aco
//
// Objetivo:	Verifico si el suministro es un sum. importante,
//					o sea que exista en 'suministros_imp', devolviendo la 
//					cantidad de los clientes (suministros) que lo son.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pl_nis
//
//
//	Salida:  -- 
//						
// Devuelve:	1 si es suministro imp, 0 en caso contrario
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	19/09/96		AFS 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_f_actual, ldt_f_nula
int li_cant_cli_imp

SetPointer(HourGlass!)

SetNull(ldt_f_nula)
ldt_f_actual = fgnu_fecha_actual()

//AHM (11/11/2009) Incidencia 1/736749
/*SELECT Count(*)
INTO :li_cant_cli_imp
FROM "SUMINISTROS_IMP"
WHERE	(( "SUMINISTROS_IMP"."F_EXPIRACION" =  :ldt_f_nula ) OR
		( "SUMINISTROS_IMP"."F_EXPIRACION" >=  :ldt_f_actual )) AND
		( "SUMINISTROS_IMP"."NIS_RAD" =  :pl_nis ) ;*/
SELECT Count(*)
INTO :li_cant_cli_imp
FROM "GI_SUMINISTROS_IMP"
WHERE	(( "GI_SUMINISTROS_IMP"."F_EXPIRACION" =  :ldt_f_nula ) OR
		( "GI_SUMINISTROS_IMP"."F_EXPIRACION" >=  :ldt_f_actual )) AND
		( "GI_SUMINISTROS_IMP"."NIS_RAD" =  :pl_nis ) ;


//IF sqlca.SqlCode <> 0 THEN
//	gnv_msg.f_mensaje("EM33","","",OK!)
//	RETURN -1
//END IF

RETURN li_cant_cli_imp


end function

public function integer fnu_actualizar_aco_ins (long pl_aco_ant, long pl_aco_nueva, decimal pl_pot_contrata, integer pi_cant_cli);Decimal ll_pot_contrata_ant
long ll_cant_cli_ant

IF NOT IsNull(pl_aco_ant) AND pl_aco_ant > 0 THEN


  SELECT "SGD_ACOMETIDA"."POT_CONTRATADA",   
         "SGD_ACOMETIDA"."CANT_CLI"  
    INTO :ll_pot_contrata_ant,   
         :ll_cant_cli_ant  
    FROM "SGD_ACOMETIDA"  
   WHERE "SGD_ACOMETIDA"."CODIGO" = :pl_aco_ant AND BDI_JOB=0 ;

	IF sqlca.sqlcode <> 0 THEN
		Return sqlca.sqlcode
	END IF

  UPDATE "SGD_ACOMETIDA"  
     SET "SGD_ACOMETIDA"."POT_CONTRATADA" = :ll_pot_contrata_ant - :pl_pot_contrata,
		   "SGD_ACOMETIDA"."CANT_CLI" = :ll_cant_cli_ant - :pi_cant_cli
   WHERE "SGD_ACOMETIDA"."CODIGO" = :pl_aco_ant  AND BDI_JOB = 0 ;

	IF sqlca.sqlcode <> 0 THEN
		Return sqlca.sqlcode
	END IF

END IF


  SELECT "SGD_ACOMETIDA"."POT_CONTRATADA",   
         "SGD_ACOMETIDA"."CANT_CLI"  
    INTO :ll_pot_contrata_ant,   
         :ll_cant_cli_ant  
    FROM "SGD_ACOMETIDA"  
   WHERE "SGD_ACOMETIDA"."CODIGO" = :pl_aco_nueva  AND BDI_JOB=0;

	IF sqlca.sqlcode <> 0 THEN
		Return sqlca.sqlcode
	END IF

  UPDATE "SGD_ACOMETIDA"  
     SET "SGD_ACOMETIDA"."POT_CONTRATADA" = :ll_pot_contrata_ant + :pl_pot_contrata,
         "SGD_ACOMETIDA"."CANT_CLI" = :ll_cant_cli_ant + :pi_cant_cli
   WHERE "SGD_ACOMETIDA"."CODIGO" = :pl_aco_nueva  AND BDI_JOB = 0 ;

Return sqlca.sqlcode

end function

on u_ins_2016_nu_lista_sum_dir.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_ins_2016_nu_lista_sum_dir.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


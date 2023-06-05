HA$PBExportHeader$u_ins_2008_nu_datos_instalacion.sru
forward
global type u_ins_2008_nu_datos_instalacion from nonvisualobject
end type
end forward

global type u_ins_2008_nu_datos_instalacion from nonvisualobject
end type
global u_ins_2008_nu_datos_instalacion u_ins_2008_nu_datos_instalacion

type variables
datawindowchild idwc_tipo_instalacion

end variables

forward prototypes
public function integer fnu_v_inst_con_incidencia (decimal pdec_inst)
public function integer fnu_v_sum_imp_aco (long pl_nro_aco)
public function integer fnu_actualizar_red (decimal pdec_nro_padre_ant, decimal pdec_nro_padre_act, decimal pl_pot_inst, decimal pl_pot_contr, long pl_cant_cli, long pl_cant_cli_imp)
public function integer fnu_actualizar_red_aco (decimal pdec_nro_padre_ant, decimal pdec_nro_padre_act, decimal pl_pot_contr, long pl_cant_cli, long pl_cant_cli_imp)
public function integer fnu_actualizar_red_des (decimal pdec_nro_padre, decimal pl_pot_contratada, integer pi_cli_imp)
end prototypes

public function integer fnu_v_inst_con_incidencia (decimal pdec_inst);// Se verifica la existencia de una Incidencia Pendiente en las 
// instalaciones, partiendo de la instalaci$$HEX1$$f300$$ENDHEX$$n pasada, hacia arriba 
// en la jerarqu$$HEX1$$ed00$$ENDHEX$$a.

long ll_cant_reg, ll_incid
decimal{0} ldec_inst
string ls_nom

DECLARE lcur_inst CURSOR FOR
(SELECT "SGD_INSTALACION"."NRO_INSTALACION", "SGD_INSTALACION"."NOM_INSTALACION" 
FROM "SGD_INSTALACION"  
START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :pdec_inst and bdi_job =0
CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" and bdi_job=0);

//FOR UPDATE;

OPEN lcur_inst;

FETCH lcur_inst INTO :ldec_inst, :ls_nom;

DO UNTIL Sqlca.SqlCode <> 0 

   // :fgci_incidencia_resuelta =6
	// Verifico la existencia de una Incidencia Pendiente 
	// para la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
	SELECT count("SGD_INCIDENCIA"."NRO_INCIDENCIA" )
   INTO :ll_incid  
   FROM "SGD_INCIDENCIA"  
   WHERE ( "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :ldec_inst ) AND  
         ( "SGD_INCIDENCIA"."EST_ACTUAL" < :fgci_incidencia_resuelta )   ;

	IF ll_incid = 0 THEN
		//gnv_msg.f_mensaje("AM07",ls_nom,"",OK!)
		gnv_msg.f_mensaje("AM20",ls_nom,"",OK!)
		CLOSE lcur_inst;
		RETURN -2
	END IF

	FETCH lcur_inst INTO :ldec_inst, :ls_nom;
LOOP

CLOSE lcur_inst;

RETURN 1


end function

public function integer fnu_v_sum_imp_aco (long pl_nro_aco);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_v_sum_imp_aco
//
// Objetivo:	Recorro todos los suministros alimentados por la acometida
//					en cuesti$$HEX1$$f300$$ENDHEX$$n, verificando si es un sum. importante,
//					o sea que exista en 'suministros_imp', devolviendo la 
//					cantidad de los clientes (suministros) que lo son.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pl_nro_aco
//
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	11/09/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_f_actual, ldt_f_nula
int li_cant_cli_imp

SetPointer(HourGlass!)

SetNull(ldt_f_nula)
ldt_f_actual = fgnu_fecha_actual()

SELECT Count(*)
INTO :li_cant_cli_imp
FROM "ACO_SUM",   
     "GI_SUMINISTROS_IMP"
WHERE	(( "GI_SUMINISTROS_IMP"."F_EXPIRACION" =  :ldt_f_nula ) OR
		( "GI_SUMINISTROS_IMP"."F_EXPIRACION" >=  :ldt_f_actual )) AND
		( "GI_SUMINISTROS_IMP"."NIS_RAD" =  "ACO_SUM"."NIS_RAD" ) AND
		( "ACO_SUM"."NRO_ACOMETIDA" = :pl_nro_aco );

IF sqlca.SqlCode <> 0 THEN
	gnv_msg.f_mensaje("EM33","","",OK!)
	RETURN -1
END IF

RETURN li_cant_cli_imp


end function

public function integer fnu_actualizar_red (decimal pdec_nro_padre_ant, decimal pdec_nro_padre_act, decimal pl_pot_inst, decimal pl_pot_contr, long pl_cant_cli, long pl_cant_cli_imp);// Habiendose verificado que no exista ninguna Incidencia
// que est$$HEX2$$e9002000$$ENDHEX$$afectando a cualquiera de las instalaciones involucradas
// en el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n, aqu$$HEX2$$ed002000$$ENDHEX$$se realiza la actualizaci$$HEX1$$f300$$ENDHEX$$n 
// de la informaci$$HEX1$$f300$$ENDHEX$$n de las mismas.


decimal{0}  ldec_inst
Decimal		ll_pot_inst, ll_pot_contr
long        ll_cant_cli, ll_cant_cli_imp
string 		ls_prog
datetime		ldt_f_actual


ls_prog = "modif_inst"
ldt_f_actual = fgnu_fecha_actual()


// ACTUALIZO LA JERARQU$$HEX1$$cd00$$ENDHEX$$A ANTERIOR

DECLARE lcur_inst_ant CURSOR FOR
(SELECT "SGD_INSTALACION"."NRO_INSTALACION", "SGD_INSTALACION"."POT_INSTALADA" ,
		  "SGD_INSTALACION"."POT_CONTRATADA",  "SGD_INSTALACION"."CANT_CLI" ,
		  "SGD_INSTALACION"."CAN_CLI_IMP"
FROM "SGD_INSTALACION"  
START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :pdec_nro_padre_ant
CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION");

OPEN lcur_inst_ant;

FETCH lcur_inst_ant INTO :ldec_inst, :ll_pot_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;

DO UNTIL Sqlca.SqlCode <> 0 

	ll_pot_inst      = ll_pot_inst - pl_pot_inst
	ll_pot_contr     = ll_pot_contr - pl_pot_contr
	ll_cant_cli  	  = ll_cant_cli - pl_cant_cli
	ll_cant_cli_imp  = ll_cant_cli_imp - pl_cant_cli_imp

	// Actualizo la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
	UPDATE "SGD_INSTALACION"  
   SET "USUARIO" 			= :gs_usuario,   
       "F_ACTUAL" 		= :ldt_f_actual,   
       "PROGRAMA" 		= :ls_prog,   
       "POT_INSTALADA" 	= :ll_pot_inst,
       "POT_CONTRATADA" = :ll_pot_contr,
       "CANT_CLI" 		= :ll_cant_cli,
       "CAN_CLI_IMP" 	= :ll_cant_cli_imp
   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ldec_inst   and bdi_job=0;
	
	IF Sqlca.SqlCode <> 0 THEN
		gnv_msg.f_mensaje("EA12","","",OK!)
		CLOSE lcur_inst_ant;
		RETURN -1
	END IF

	FETCH lcur_inst_ant INTO :ldec_inst, :ll_pot_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;
LOOP

CLOSE lcur_inst_ant;


// ACTUALIZO LA NUEVA JERARQU$$HEX1$$cd00$$ENDHEX$$A

DECLARE lcur_inst_new CURSOR FOR
(SELECT "SGD_INSTALACION"."NRO_INSTALACION", "SGD_INSTALACION"."POT_INSTALADA" ,
		  "SGD_INSTALACION"."POT_CONTRATADA",  "SGD_INSTALACION"."CANT_CLI" ,
		  "SGD_INSTALACION"."CAN_CLI_IMP"
FROM "SGD_INSTALACION"  
START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :pdec_nro_padre_act and bdi_job =0 
CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" and bdi_job=0);

OPEN lcur_inst_new;

FETCH lcur_inst_new INTO :ldec_inst, :ll_pot_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;

DO UNTIL Sqlca.SqlCode <> 0 

	ll_pot_inst      = ll_pot_inst + pl_pot_inst
	ll_pot_contr     = ll_pot_contr + pl_pot_contr
	ll_cant_cli  	  = ll_cant_cli + pl_cant_cli
	ll_cant_cli_imp  = ll_cant_cli_imp + pl_cant_cli_imp

	// Actualizo la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
	UPDATE "SGD_INSTALACION"  
   SET "USUARIO" 			= :gs_usuario,   
       "F_ACTUAL" 		= :ldt_f_actual,   
       "PROGRAMA" 		= :ls_prog,   
       "POT_INSTALADA" 	= :ll_pot_inst,
       "POT_CONTRATADA" = :ll_pot_contr,
       "CANT_CLI" 		= :ll_cant_cli,
       "CAN_CLI_IMP" 	= :ll_cant_cli_imp
   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ldec_inst and bdi_job = 0  ;
	
	IF Sqlca.SqlCode <> 0 THEN
		gnv_msg.f_mensaje("EA12","","",OK!)
		CLOSE lcur_inst_new;
		RETURN -1
	END IF

	FETCH lcur_inst_new INTO :ldec_inst, :ll_pot_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;
LOOP

CLOSE lcur_inst_new;


RETURN 1


end function

public function integer fnu_actualizar_red_aco (decimal pdec_nro_padre_ant, decimal pdec_nro_padre_act, decimal pl_pot_contr, long pl_cant_cli, long pl_cant_cli_imp);// Habiendose verificado que no exista ninguna Incidencia
// que est$$HEX2$$e9002000$$ENDHEX$$afectando a cualquiera de las instalaciones involucradas
// en el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n, aqu$$HEX2$$ed002000$$ENDHEX$$se realiza la actualizaci$$HEX1$$f300$$ENDHEX$$n 
// de la informaci$$HEX1$$f300$$ENDHEX$$n de las mismas.


decimal{0}  ldec_inst
Decimal		ll_pot_contr
long        ll_cant_cli, ll_cant_cli_imp
string 		ls_prog
datetime		ldt_f_actual


ls_prog = "mante_aco"
ldt_f_actual = fgnu_fecha_actual()


IF pdec_nro_padre_ant > 0 THEN

	// ACTUALIZO LA JERARQU$$HEX1$$cd00$$ENDHEX$$A ANTERIOR
	
	DECLARE lcur_inst_ant CURSOR FOR
	(SELECT "SGD_INSTALACION"."NRO_INSTALACION", "SGD_INSTALACION"."POT_CONTRATADA",  
	"SGD_INSTALACION"."CANT_CLI", "SGD_INSTALACION"."CAN_CLI_IMP"
	FROM "SGD_INSTALACION"  
	START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :pdec_nro_padre_ant and bdi_job=0
	CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" and bdi_job=0);
	
	OPEN lcur_inst_ant;
	
	FETCH lcur_inst_ant INTO :ldec_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;
	
	DO UNTIL Sqlca.SqlCode <> 0 
	
		ll_pot_contr     = ll_pot_contr - pl_pot_contr
		ll_cant_cli  	  = ll_cant_cli - pl_cant_cli
		ll_cant_cli_imp  = ll_cant_cli_imp - pl_cant_cli_imp
	
		// Actualizo la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
		UPDATE "SGD_INSTALACION"  
	   SET "USUARIO" 			= :gs_usuario,   
	       "F_ACTUAL" 		= :ldt_f_actual,   
	       "PROGRAMA" 		= :ls_prog,   
	       "POT_CONTRATADA" = :ll_pot_contr,
	       "CANT_CLI" 		= :ll_cant_cli,
	       "CAN_CLI_IMP" 	= :ll_cant_cli_imp
	   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ldec_inst  and bdi_job=0 ;
		
		IF Sqlca.SqlCode <> 0 THEN
			gnv_msg.f_mensaje("EA12","","",OK!)
			CLOSE lcur_inst_ant;
			RETURN -1
		END IF
	
		FETCH lcur_inst_ant INTO :ldec_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;
	LOOP
	
	CLOSE lcur_inst_ant;
END IF


IF pdec_nro_padre_act > 0 THEN

	// ACTUALIZO LA NUEVA JERARQU$$HEX1$$cd00$$ENDHEX$$A
	
	DECLARE lcur_inst_new CURSOR FOR
	(SELECT "SGD_INSTALACION"."NRO_INSTALACION", 
			  "SGD_INSTALACION"."POT_CONTRATADA",  "SGD_INSTALACION"."CANT_CLI" ,
			  "SGD_INSTALACION"."CAN_CLI_IMP"
	FROM "SGD_INSTALACION"  
	START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :pdec_nro_padre_act and bdi_job=0
	CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" and bdi_job=0);
	
	OPEN lcur_inst_new;
	
	FETCH lcur_inst_new INTO :ldec_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;
	
	DO UNTIL Sqlca.SqlCode <> 0 
	
		ll_pot_contr     = ll_pot_contr + pl_pot_contr
		ll_cant_cli  	  = ll_cant_cli + pl_cant_cli
		ll_cant_cli_imp  = ll_cant_cli_imp + pl_cant_cli_imp
	
		// Actualizo la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
		UPDATE "SGD_INSTALACION"  
	   SET "USUARIO" 			= :gs_usuario,   
	       "F_ACTUAL" 		= :ldt_f_actual,   
	       "PROGRAMA" 		= :ls_prog,   
	       "POT_CONTRATADA" = :ll_pot_contr,
	       "CANT_CLI" 		= :ll_cant_cli,
	       "CAN_CLI_IMP" 	= :ll_cant_cli_imp
	   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ldec_inst  and bdi_job = 0 ;
		
		IF Sqlca.SqlCode <> 0 THEN
			gnv_msg.f_mensaje("EA12","","",OK!)
			CLOSE lcur_inst_new;
			RETURN -1
		END IF
	
		FETCH lcur_inst_new INTO :ldec_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;
	LOOP
	
	CLOSE lcur_inst_new;
END IF	
	
RETURN 1


end function

public function integer fnu_actualizar_red_des (decimal pdec_nro_padre, decimal pl_pot_contratada, integer pi_cli_imp);// Habiendose verificado que no exista ninguna Incidencia
// que est$$HEX2$$e9002000$$ENDHEX$$afectando a cualquiera de las instalaciones involucradas
// en el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n, aqu$$HEX2$$ed002000$$ENDHEX$$se realiza la actualizaci$$HEX1$$f300$$ENDHEX$$n 
// de la informaci$$HEX1$$f300$$ENDHEX$$n de las mismas.

decimal{0}  ldec_inst
Decimal 		ll_pot_contr
long        ll_cant_cli, ll_cant_cli_imp
string 		ls_prog
datetime		ldt_f_actual


ls_prog = "modif_inst"
ldt_f_actual = fgnu_fecha_actual()


// ACTUALIZO LA JERARQU$$HEX1$$cd00$$ENDHEX$$A ANTERIOR

DECLARE lcur_inst_ant CURSOR FOR
(SELECT "SGD_INSTALACION"."NRO_INSTALACION", 
		  "SGD_INSTALACION"."POT_CONTRATADA",  "SGD_INSTALACION"."CANT_CLI" ,
		  "SGD_INSTALACION"."CAN_CLI_IMP"
FROM "SGD_INSTALACION"  
START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :pdec_nro_padre and bdi_job = 0
CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" and bdi_job=0);

OPEN lcur_inst_ant;

FETCH lcur_inst_ant INTO :ldec_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;

DO UNTIL Sqlca.SqlCode <> 0 


	ll_pot_contr     = ll_pot_contr - pl_pot_contratada
	ll_cant_cli  	  = ll_cant_cli - 1
	ll_cant_cli_imp  = ll_cant_cli_imp - pi_cli_imp

	// Actualizo la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
	UPDATE "SGD_INSTALACION"  
   SET "USUARIO" 			= :gs_usuario,   
       "F_ACTUAL" 		= :ldt_f_actual,   
       "PROGRAMA" 		= :ls_prog,   
       "POT_CONTRATADA" = :ll_pot_contr,
       "CANT_CLI" 		= :ll_cant_cli,
       "CAN_CLI_IMP" 	= :ll_cant_cli_imp
   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ldec_inst and bdi_job = 0  ;
	
	IF Sqlca.SqlCode <> 0 THEN
		gnv_msg.f_mensaje("EA12","","",OK!)
		CLOSE lcur_inst_ant;
		RETURN -1
	END IF

	FETCH lcur_inst_ant INTO :ldec_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp;
LOOP

CLOSE lcur_inst_ant;

RETURN 1


end function

on u_ins_2008_nu_datos_instalacion.create
TriggerEvent( this, "constructor" )
end on

on u_ins_2008_nu_datos_instalacion.destroy
TriggerEvent( this, "destructor" )
end on


HA$PBExportHeader$u_ins_2011_nu_lista_instal_por_tipo.sru
$PBExportComments$Obsoleto
forward
global type u_ins_2011_nu_lista_instal_por_tipo from nonvisualobject
end type
end forward

global type u_ins_2011_nu_lista_instal_por_tipo from nonvisualobject
end type
global u_ins_2011_nu_lista_instal_por_tipo u_ins_2011_nu_lista_instal_por_tipo

type variables
//decimal fgcdec_instalacion_eliminadas
//int fgci_incidencia_pendiente

end variables

forward prototypes
public function integer fnu_v_suministros (decimal pdec_nro_inst)
public function integer fnu_alim_baja (decimal pdec_nro_inst)
public function integer fnu_a_jerarquia (decimal pdec_nro_inst, long pl_pot_inst, long pl_pot_contr, long pl_cant_cli, integer pl_cant_cli_imp)
end prototypes

public function integer fnu_v_suministros (decimal pdec_nro_inst);// Verifico la existencia de alg$$HEX1$$fa00$$ENDHEX$$n Suministro
// que est$$HEX2$$e9002000$$ENDHEX$$alimentado por la Instalaci$$HEX1$$f300$$ENDHEX$$n pasada.

long	ll_cant_reg

SELECT Count(*)  
INTO :ll_cant_reg  
FROM "SGD_ACOMETIDA",   
     "ACO_SUM"  
WHERE ( "SGD_ACOMETIDA"."CODIGO" = "ACO_SUM"."NRO_ACOMETIDA" ) and 
		( "SGD_ACOMETIDA"."BDI_JOB" = 0 ) AND
      ( ( "SGD_ACOMETIDA"."INSTALACION_ORIGEN" = :pdec_nro_inst ) )   ;

IF Sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER61","","",OK!)
	RETURN -1
ELSEIF ll_cant_reg > 0 THEN
	RETURN 1
ELSE
	RETURN 0
END IF


end function

public function integer fnu_alim_baja (decimal pdec_nro_inst);// Coloco como instalaci$$HEX1$$f300$$ENDHEX$$n padre de la pasada como par$$HEX1$$e100$$ENDHEX$$metro,
// la instalaci$$HEX1$$f300$$ENDHEX$$n ficticia de baja.
// constantes
// fnu_def_constantes()

datetime ldt_f_actual
string ls_programa

ls_programa = "baja_inst"

UPDATE "INSTALACION"  
SET "USUARIO" = :gs_usuario,   
    "F_ACTUAL" = :ldt_f_actual,   
    "PROGRAMA" = :ls_programa,   
    "NRO_INST_PADRE" = :fgcdec_instalacion_eliminadas  
WHERE "INSTALACION"."NRO_INSTALACION" = :pdec_nro_inst   ;

IF Sqlca.SqlCode < 0 THEN
	gnv_msg.f_mensaje("EA12","","",OK!)
	RETURN -1
ELSE
	RETURN 1
END IF


end function

public function integer fnu_a_jerarquia (decimal pdec_nro_inst, long pl_pot_inst, long pl_pot_contr, long pl_cant_cli, integer pl_cant_cli_imp);// Se actualiza la potencia instalada, contratada y cantidad de 
// clientes de las instalaciones, partiendo de la instalaci$$HEX1$$f300$$ENDHEX$$n 
// pasada, hacia arriba en la jerarqu$$HEX1$$ed00$$ENDHEX$$a.
// Restando a los ya existentes, los valores pasados .
// constantes
//fnu_def_constantes()

decimal{0}  ldec_inst,ll_pot_inst, ll_pot_contr
long ll_cant_cli, ll_cant_cli_imp, ll_incid
string 		ls_prog, ls_nom
datetime		ldt_f_actual

ls_prog = "baja_inst"
ldt_f_actual = fgnu_fecha_actual()

DECLARE lcur_inst CURSOR FOR
(SELECT "INSTALACION"."NRO_INSTALACION", "INSTALACION"."POT_INSTALADA" ,
		  "INSTALACION"."POT_INSTALADA" , "INSTALACION"."POT_CONTRATADA" ,
		  "INSTALACION"."CANT_CLI" , "INSTALACION"."CAN_CLI_IMP" , 
		  "INSTALACION"."NOM_INSTALACION" 
FROM "INSTALACION"  
START WITH "INSTALACION"."NRO_INSTALACION" = :pdec_nro_inst
CONNECT BY PRIOR "INSTALACION"."NRO_INST_PADRE" = "INSTALACION"."NRO_INSTALACION");

OPEN lcur_inst;

FETCH lcur_inst INTO :ldec_inst, :ll_pot_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp, :ls_nom;

DO UNTIL Sqlca.SqlCode <> 0 

	ll_pot_inst  = ll_pot_inst - pl_pot_inst
	ll_pot_contr = ll_pot_contr - pl_pot_contr
	ll_cant_cli  = ll_cant_cli - pl_cant_cli
	ll_cant_cli_imp = ll_cant_cli_imp - pl_cant_cli_imp

	// Verifico la existencia de una Incidencia Pendiente 
	// para la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
	SELECT "INCIDENCIA"."NRO_INCIDENCIA"  
   INTO :ll_incid  
   FROM "INCIDENCIA"  
   WHERE ( "INCIDENCIA"."NRO_INST_AFECTADA" = :ldec_inst ) AND  
         ( "INCIDENCIA"."EST_ACTUAL" = :fgci_incidencia_pendiente )   ;

	IF Sqlca.SqlCode = 0 THEN
		gnv_msg.f_mensaje("AM07",ls_nom,"",OK!)
		CLOSE lcur_inst;
		RETURN -1
	ELSEIF Sqlca.SqlCode < 0 THEN
		gnv_msg.f_mensaje("EA09","","",OK!)
		CLOSE lcur_inst;
		RETURN -1
	END IF

	// Actualizo la instalaci$$HEX1$$f300$$ENDHEX$$n actual.
	UPDATE "INSTALACION"  
   SET "USUARIO" = :gs_usuario,   
       "F_ACTUAL" = :ldt_f_actual,   
       "PROGRAMA" = :ls_prog,   
       "POT_INSTALADA" = :ll_pot_inst, 
       "POT_CONTRATADA" = :ll_pot_contr, 
       "CANT_CLI" = :ll_cant_cli,
		 "CAN_CLI_IMP" = :ll_cant_cli_imp
   WHERE "INSTALACION"."NRO_INSTALACION" = :ldec_inst   ;
	
	IF Sqlca.SqlCode <> 0 THEN
		gnv_msg.f_mensaje("EA12","","",OK!)
		CLOSE lcur_inst;
		RETURN -1
	END IF

	FETCH lcur_inst INTO :ldec_inst, :ll_pot_inst, :ll_pot_contr, :ll_cant_cli, :ll_cant_cli_imp, :ls_nom;
LOOP

CLOSE lcur_inst;

RETURN 1


end function

on u_ins_2011_nu_lista_instal_por_tipo.create
TriggerEvent( this, "constructor" )
end on

on u_ins_2011_nu_lista_instal_por_tipo.destroy
TriggerEvent( this, "destructor" )
end on


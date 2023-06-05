HA$PBExportHeader$u_nis_2001_pr_nis_rad.sru
forward
global type u_nis_2001_pr_nis_rad from datawindow
end type
end forward

global type u_nis_2001_pr_nis_rad from datawindow
integer width = 782
integer height = 140
string dataobject = "d_nis_2001_pr_nis_rad"
event ue_shiftclicked pbm_custom70
event ue_ctrlclicked pbm_custom71
end type
global u_nis_2001_pr_nis_rad u_nis_2001_pr_nis_rad

type variables
int ii_filas_selec
int ii_selected_row
end variables

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_nis_rad)
public function integer fpr_limpiar_campos ()
public function integer fpr_llenar_campos (long pl_nis)
public function integer f_insertar_fila ()
public function integer fpr_obtener_registros ()
public function integer fpr_posicion (integer pi_x, integer pi_y)
public function integer fpr_c_estruc_dir_por_nis (ref s_direccion_cliente pstr_dir_cli)
public function boolean fpr_cargardatoscliente (string ps_nom, string ps_ape1, string ps_ape2)
public function integer fpr_c_estruc_dir_por_nis_3 (ref s_direccion_cliente pstr_dir_cli)
public function string fpr_v_nis_rad (ref datawindow pdw_nis_rad)
end prototypes

event ue_shiftclicked;//////////////////////////////////////////////////////////////////////
//
//	Evento:		ShiftClicked
//
//	Objetivo:	Este evento es triggeado por el RowFocusChanged
//					(si la dw permite seleccionar m$$HEX1$$e100$$ENDHEX$$s de una fila)
//					cuando el Shift es pulsado al mismo tiempo que el click
//					del rat$$HEX1$$f300$$ENDHEX$$n
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

int oldrow, newrow, i

oldrow = ii_selected_row
newrow = GetRow()

IF oldrow = 0 THEN oldrow =  newrow 

IF oldrow > newrow THEN
	FOR i = oldrow to newrow STEP -1
		this.SelectRow(i,true)
	NEXT
ELSE
	FOR i = oldrow to newrow
		this.SelectRow(i,true)
	NEXT
END IF


this.SetRow(newrow)
this.SetColumn(1)

end event

event ue_ctrlclicked;/////////////////////////////////////////////////////////////////////////
//
//	Evento:		CtrlClicked
//
//	Objetivo:	Este evento es triggeado por el RowFocusChanged
//					(si la dw permite seleccionar m$$HEX1$$e100$$ENDHEX$$s de una fila)
//					cuando el Ctrl es pulsado al mismo tiempo que el click
//					del rat$$HEX1$$f300$$ENDHEX$$n
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
/////////////////////////////////////////////////////////////////////////

int newrow

newrow=GetRow()

IF this.IsSelected(newrow) THEN
	this.SelectRow(newrow,False)
ELSE
	this.SelectRow(newrow,True)
END IF 

this.SetRow(newrow)
this.SetColumn(1)


end event

public function integer fpr_habilitar_campos (boolean pb_nis_rad);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita el campo nis_rad en funci$$HEX1$$f300$$ENDHEX$$n del
// valor del par$$HEX1$$e100$$ENDHEX$$metro que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo del mismo
//	en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: pb_nis_rad (boolean que habilita el nis_rad)
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	22/01/96			MA	       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF pb_nis_rad THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	 this.modify("nis_rad.background.color=" + string(65536*255+256*255+255))
	 this.modify("nis_rad.background.color=" + gs_blanco)
// Fin. Sgo.
	 this.SetTabOrder("nis_rad",10)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	 this.modify("nis_rad.background.color=" + string(65536*192+256*192+192))
	 this.modify("nis_rad.background.color=" + gs_gris)
// Fin. Sgo.
	 this.SetTabOrder("nis_rad",0)

END IF

RETURN 1
end function

public function integer fpr_limpiar_campos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_limpiar_campos
// 
// Objetivo: Resetea datawindow de NIS RAD.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nulo

SetNull(ll_nulo)

This.SetItem(This.GetRow(),"nis_rad",ll_nulo)
This.AcceptText()


RETURN 1

end function

public function integer fpr_llenar_campos (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_llenar_campos
// 
// Objetivo: Setea datawindow con valores de nis_rad.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  pl_nis
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//
//
////////////////////////////////////////////////////////////////////////////////////////////////
string ls_where

IF PARENT = w_1201_recepcion_aviso THEN
	ls_where = "(SUMCON.NIS_RAD = " + string(pl_nis) + ")"  //(LFE)
	
	// **** LSH **** INI **** DDAG-2020 **** 03/08/2015 ****
	/* se elimina el bloqueo ya que en ocaciones cuando hay muchos operadores consultando y actualizando
	diferentes avisos se crea un bloqueo en toda la tabla que crear lentitud en el sistema 
	WARNING - PELIGROSO Monitorear en caso de inconsistencia de avisos*/
	
//	// se bloque el registro para que otro usuario no pueda dar de alta otro aviso para ese NIS
//	IF gnu_u_transaction.uf_lock(PARENT, "SUMCON", ls_where) = 0 THEN // (LFE)
//		// se ha bloqueado con $$HEX1$$e900$$ENDHEX$$xito el registro
//		This.SetItem(1,1,pl_nis)
//		RETURN 1
//	ELSE
//		RETURN 0
//	END IF
//	
//	RETURN 1
	This.SetItem(1,1,pl_nis)
	RETURN 1
	// **** LSH **** FIN **** DDAG-2020 **** 03/08/2015 ****
ELSE
	This.SetItem(1,1,pl_nis)
	RETURN 1
END IF


end function

public function integer f_insertar_fila ();return this.insertRow(0)
end function

public function integer fpr_obtener_registros ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtener_registros
// 
// Objetivo: Conecta a la base de datos y retrieve de la datawindow.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

this.SetTransObject(sqlca)
this.Retrieve()
this.SetRowFocusIndicator(Hand!)
this.SetFocus()

return 1
end function

public function integer fpr_posicion (integer pi_x, integer pi_y);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_posici$$HEX1$$f300$$ENDHEX$$n 
//
// Objetivo: Ubica el objeto seg$$HEX1$$fa00$$ENDHEX$$n valores de par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_x, pi_y
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

RETURN This.Move(pi_x,pi_y)
end function

public function integer fpr_c_estruc_dir_por_nis (ref s_direccion_cliente pstr_dir_cli);////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fpr_c_estruc_dir_por_nis
// 
// Objetivo: Cargar estructura direcci$$HEX1$$f300$$ENDHEX$$n con los valores de las tablas correspondientes,
//           accediendo por el nis.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pstr_dir_cli
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

int li_sqlca_code
long ll_tfno, ll_nif, ll_cod_cli
string ls_cgv, ls_est_sum, ls_where
datetime ldt_f_enganche, ldt_f_corte, ldt_f_actual

ldt_f_actual = fgnu_fecha_actual()
SetNull(ldt_f_enganche)
SetNull(ldt_f_corte)

// Verifico si el suministro existe en la tabla 'Suministros',
// y traigo, en caso afirmativo, el 'NIF' correspondiente.

	// Si el suministro existe en la tabla 'Suministros',
	// verifico su existencia en 'SumCon' y/o 'PetSum'.
	// En caso afirmativo proceso, sino despliego mensaje,
	// explicando que el sum. no tiene contrato vigente.

	SELECT SUMCON.COD_CLI, SUMCON.EST_SUM, SUMCON.NIF, SUMCON.CGV_SUM
	INTO :ll_cod_cli, :ls_est_sum, :ll_nif, :ls_cgv
	FROM SUMCON
	WHERE	(SUMCON.NIS_RAD = :pstr_dir_cli.gl_nis);
	////////
//	IF PARENT = w_1201_recepcion_aviso THEN
//		ls_where = "(SUMCON.NIS_RAD = " + string(pstr_dir_cli.gl_nis) + ")"  //(LFE)
//		// se bloque el registro para que otro usuario no pueda dar de alta otro aviso para ese NIS
//		li_lock_status = gnu_u_transaction.uf_lock(PARENT, "SUMCON", ls_where)  // (LFE)
//		////////
//	ELSE
//		li_lock_status = sqlca.SqlCode
//	END IF
	
	IF sqlca.SqlCode = 100 THEN
	//IF li_lock_status = 100 THEN

		SELECT PETSUM.COD_CLI, PETSUM.F_ENGANCHE , PETSUM.F_CORTE, PETSUM.NIF, PETSUM.CGV_SUMINISTRO
		INTO :ll_cod_cli, :ldt_f_enganche, :ldt_f_corte, :ll_nif, :ls_cgv
		FROM PETSUM
		WHERE (PETSUM.NIS_RAD = :pstr_dir_cli.gl_nis);
		
		//li_lock_status = sqlca.sqlcode
		IF sqlca.SqlCode < 0 THEN
			gnv_msg.f_mensaje("ER31","","",OK!)
			gnu_u_transaction.uf_rollback(PARENT)			
			RETURN -1
		END IF

	ELSEIF sqlca.SqlCode = -1 THEN
	//ELSEIF li_lock_status = -1 THEN
		gnv_msg.f_mensaje("ER31","","",OK!)
		RETURN -1
	//ELSEIF li_lock_status = -54 THEN    // (LFE)
		// si es -54 el problema es que el registro est$$HEX2$$e1002000$$ENDHEX$$bloqueado, y ya se ha mostrado
		// al usuario el pertinente mensaje de error (LFE)
		// como no se puede dar de alta un aviso para este NIS, limpiamos el campo del NIS
	//	fpr_limpiar_campos()  // (LFE)
	//	RETURN -1
	END IF

	// Si encontre al suministro, y est$$HEX2$$e1002000$$ENDHEX$$en 'sumcon' con un estado
	// v$$HEX1$$e100$$ENDHEX$$lido, o lo fu$$HEX2$$ed002000$$ENDHEX$$a buscar a 'petsum'
	// Si la fecha actual est$$HEX2$$e1002000$$ENDHEX$$entre las fechas de:
	// enganche y corte, del suministro en 'petsum'
	IF sqlca.SqlCode = 0 AND (ls_est_sum = "EC011" OR ls_est_sum = "EC012"&
			 OR ls_est_sum = "EC013" OR ls_est_sum = "EC014" OR ls_est_sum = "EC023" OR &
			(ldt_f_actual >= ldt_f_enganche AND ldt_f_actual <= ldt_f_corte)) THEN

		// Si el suministro existe en las tres tablas, traigo toda la 
		// inf. necesaria para el aviso y la cargo en la estructura.
		
		SELECT COD_CLI,COD_CALLE, NUM_PUERTA, DUPLICADOR, COD_LOCAL, COD_MUNIC,   
	      COD_PROV, COD_DEPTO, NOM_CLI, APE1_CLI, APE2_CLI, TO_CHAR(TFNO_CLI),   
	      DOC_ID, TIP_DOC, CO_PAIS, NOM_CALLE, NOM_DEPTO, NOM_PROV,
	      NOM_LOCAL, NOM_MUNIC, DESC_COD
		INTO 	:pstr_dir_cli.gl_cod_cli,
				:pstr_dir_cli.gl_codcalle, :pstr_dir_cli.gl_numero,
				:pstr_dir_cli.gs_duplic, 
				:pstr_dir_cli.gl_codloc, :pstr_dir_cli.gl_codmun,
				:pstr_dir_cli.gl_codprov, :pstr_dir_cli.gl_coddepto,
				:pstr_dir_cli.gs_nom, :pstr_dir_cli.gs_ape1,
				:pstr_dir_cli.gs_ape2, :pstr_dir_cli.gs_telefono,	:pstr_dir_cli.gs_doc,
				:pstr_dir_cli.gs_tipo_doc,	:pstr_dir_cli.gs_co_pais,
				:pstr_dir_cli.gs_calle,	:pstr_dir_cli.gs_depto,
				:pstr_dir_cli.gs_prov, :pstr_dir_cli.gs_local,
				:pstr_dir_cli.gs_munic,	:pstr_dir_cli.gs_pais	
		FROM  AVISO_POR_NIS 
		WHERE  NIF = :ll_nif AND COD_CLI = :ll_cod_cli ;
	
	
		if parmstr9 = 'w_1211_indentificar_suministro' then
			return 1
		else
			IF sqlca.SqlCode = 0 /*and parmstr9 <> 'w_1211_indentificar_suministro'*/ THEN
				pstr_dir_cli.gs_pisodpto = ls_cgv
			
				//***************************************
				//**  OSGI 2001.1  	21/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				pstr_dir_cli.gs_ref = fg_referencia(pstr_dir_cli.gl_codloc, ll_nif, pstr_dir_cli.gs_ref)
				//***************************************
				//**  OSGI 2001.1  	21/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************


				IF ls_est_sum = "EC013" THEN
					gnv_msg.f_mensaje("AR15","","",OK!)
					RETURN 3
				ELSEIF ls_est_sum = "EC023" THEN
					gnv_msg.f_mensaje("AR22","","",OK!)
					//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Suministro dado de baja por impago",exclamation!)
					RETURN 3 
				ELSE
					RETURN 1
				END IF
			ELSEIF sqlca.SqlCode = 100 /*or parmstr9 = 'w_1211_indentificar_suministro'*/ THEN
				RETURN 0
			ELSE
				gnv_msg.f_mensaje("ER31","","",OK!)
				RETURN -1
				END IF
			end if
		ELSE
			RETURN 2
		END IF
	



end function

public function boolean fpr_cargardatoscliente (string ps_nom, string ps_ape1, string ps_ape2);// Intenta encontrar el cliente especificado y, de encontrarlo,
// carga la estructura con sus datos.

string ls_nom_cli, ls_ape1_cli, ls_ape2_cli
long li_cod_cli

// Para que ponga '' en vez de null.

ps_nom  = string(ps_nom,'')
ps_ape1 = string(ps_ape1,'')
ps_ape2 = string(ps_ape2,'')

if ps_nom = '' and ps_ape1 = '' and ps_ape2 = '' then
	return false
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$solo el 2$$HEX2$$ba002000$$ENDHEX$$apellido.

if ps_nom = '' and ps_ape1 = '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where ape2_cli = :ps_ape2;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el 1$$HEX2$$ba002000$$ENDHEX$$apellido.

if ps_nom = '' and ps_ape1 <> '' and ps_ape2 = '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where ape1_cli = :ps_ape1 ;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el 2$$HEX2$$ba002000$$ENDHEX$$apellido y el 1$$HEX1$$ba00$$ENDHEX$$.

if ps_nom = '' and ps_ape1 <> '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where ape2_cli = :ps_ape2 and ape1_cli = :ps_ape1;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el 2$$HEX2$$ba002000$$ENDHEX$$apellido y el 1$$HEX1$$ba00$$ENDHEX$$.

if ps_nom = '' and ps_ape1 <> '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where ape2_cli = :ps_ape2 and ape1_cli = :ps_ape1;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el nombre.

if ps_nom <> '' and ps_ape1 = '' and ps_ape2 = '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where nom_cli = :ps_nom ;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el nombre y el 2$$HEX2$$ba002000$$ENDHEX$$apellido.

if ps_nom <> '' and ps_ape1 = '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where nom_cli = :ps_nom and ape2_cli = :ps_ape2 ;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el nombre y el 1$$HEX2$$ba002000$$ENDHEX$$apellido.

if ps_nom <> '' and ps_ape1 <> '' and ps_ape2 = '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where nom_cli = :ps_nom and ape1_cli = :ps_ape1 ;

end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$los tres.

if ps_nom <> '' and ps_ape1 <> '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from gi_clientes 
	where nom_cli = :ps_nom and ape1_cli = :ps_ape1 and ape2_cli = :ps_ape2 ;

end if

// Si trajo m$$HEX1$$e100$$ENDHEX$$s o menos que 1 me voy.

if int(sqlca.sqlnrows) <> 1 then
	return false
end if

// Si encontr$$HEX2$$f3002000$$ENDHEX$$a la persona buscada, cargo la estrucutra con sus datos.

//str_cliente.gl_cod_cli 	= li_cod_cli
//str_cliente.gs_ape1_cli = ls_ape1_cli
//str_cliente.gs_ape2_cli = ls_ape2_cli
//str_cliente.gs_nom_cli	= ls_nom_cli

//Versi$$HEX1$$f300$$ENDHEX$$n Open I
parmstr1 = ls_ape1_cli	//Ape 1	
Parmstr2 = ls_ape2_cli	//Ape 2
parmstr3 = ls_nom_cli	//Nombre
parnum2  = li_cod_cli	//Cod. Cliente

parnum1 = 1   //Termino bien

//Versi$$HEX1$$f300$$ENDHEX$$n SGI

dir.gs_ape1 = 	 parmstr1	//Ape 1	
dir.gs_ape2 = 	 parmstr2	//Ape 2
dir.gs_nom  =   parmstr3	//Nombre

return true
end function

public function integer fpr_c_estruc_dir_por_nis_3 (ref s_direccion_cliente pstr_dir_cli);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fpr_c_estruc_dir_por_nis_3
// 
// Objetivo: Cargar estructura direcci$$HEX1$$f300$$ENDHEX$$n con los valores de las tablas correspondientes,
//           accediendo por el nis.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pstr_dir_cli
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
// 27/9/96		AFS			Modificacion para mantenim. suministros imp.
////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

int li_sqlca_code
long ll_tfno, ll_nif, ll_cod_cli
string ls_cgv, ls_est_sum


// Verifico si el suministro existe en la tabla 'Suministros',
// y traigo, en caso afirmativo, el 'NIF' correspondiente.

//SELECT SUMINISTROS.NIF, SUMINISTROS.CGV_SUM
//INTO :ll_nif, :ls_cgv
//FROM SUMINISTROS
//WHERE SUMINISTROS.NIS_RAD = :pstr_dir_cli.gl_nis;
//
//IF sqlca.SqlCode = 0 THEN

	// Si el suministro existe en la tabla 'Suministros',
	// verifico su existencia en 'SumCon' y/o 'PetSum'.
	// En caso afirmativo proceso, sino despliego mensaje,
	// explicando que el sum. no tiene contrato vigente.

	SELECT SUMCON.COD_CLI, SUMCON.EST_SUM, SUMCON.NIF, SUMCON.CGV_SUM
	INTO :ll_cod_cli, :ls_est_sum, :ll_nif, :ls_cgv
	FROM SUMCON
	WHERE	(SUMCON.NIS_RAD = :pstr_dir_cli.gl_nis);

	IF sqlca.SqlCode = 100 THEN

		SELECT PETSUM.COD_CLI
		INTO :ll_cod_cli
		FROM PETSUM
		WHERE (PETSUM.NIS_RAD = :pstr_dir_cli.gl_nis);

		IF sqlca.SqlCode < 0 THEN
			gnv_msg.f_mensaje("ER31","","",OK!)
			RETURN -1
		END IF

	ELSEIF sqlca.SqlCode = -1 THEN
		gnv_msg.f_mensaje("ER31","","",OK!)
		RETURN -1
	END IF

	SELECT COD_CALLE, NUM_PUERTA, DUPLICADOR, COD_LOCAL, COD_MUNIC,   
      COD_PROV, COD_DEPTO, NOM_CLI, APE1_CLI, APE2_CLI, TO_CHAR(TFNO_CLI),   
      DOC_ID, TIP_DOC, CO_PAIS, NOM_CALLE, NOM_DEPTO, NOM_PROV,
      NOM_LOCAL, NOM_MUNIC, DESC_COD
	INTO  :pstr_dir_cli.gl_codcalle, :pstr_dir_cli.gl_numero,
			:pstr_dir_cli.gs_duplic, 
			:pstr_dir_cli.gl_codloc, :pstr_dir_cli.gl_codmun,
			:pstr_dir_cli.gl_codprov, :pstr_dir_cli.gl_coddepto,
			:pstr_dir_cli.gs_nom, :pstr_dir_cli.gs_ape1,
			:pstr_dir_cli.gs_ape2, :pstr_dir_cli.gs_telefono,	:pstr_dir_cli.gs_doc,
			:pstr_dir_cli.gs_tipo_doc,	:pstr_dir_cli.gs_co_pais,
			:pstr_dir_cli.gs_calle,	:pstr_dir_cli.gs_depto,
			:pstr_dir_cli.gs_prov, :pstr_dir_cli.gs_local,
			:pstr_dir_cli.gs_munic,	:pstr_dir_cli.gs_pais	
	FROM  AVISO_POR_NIS 
	WHERE  NIF = :ll_nif AND COD_CLI = :ll_cod_cli ;
	
	IF sqlca.SqlCode = 0 THEN
		pstr_dir_cli.gs_pisodpto = ls_cgv
		RETURN 1
	ELSEIF sqlca.SqlCode = 100 THEN
		RETURN 0
	ELSE
		gnv_msg.f_mensaje("ER31","","",OK!)
		RETURN -1
	END IF
//ELSEIF sqlca.SqlCode = 100 THEN
//	RETURN 0
//ELSE
//	gnv_msg.f_mensaje("ER31","","",OK!)
//	RETURN -1
//END IF

end function

public function string fpr_v_nis_rad (ref datawindow pdw_nis_rad);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_v_nis_rad
// 
// Objetivo: Valida el campo nis rad.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pdw_nis_rad
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
///////////////////////////////////////////////////////

string ls_nis_rad

ls_nis_rad = pdw_nis_rad.GetText()

IF ls_nis_rad = "" THEN
	RETURN "-1"
ELSEIF NOT IsNumber(ls_nis_rad) OR Len(ls_nis_rad) <> 7 THEN
	RETURN "0"
ELSE
	RETURN ls_nis_rad 
END IF

end function

event clicked;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Clicked
//
//	Objetivo:	Selecciona la fila clickeada 
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

int ii_rownum

ii_rownum = row

IF ii_rownum > 0 THEN
	CHOOSE CASE ii_filas_selec
		CASE 1
			This.SelectRow(0, FALSE)
			This.SelectRow(row, TRUE)
		CASE 2
			IF keydown(keycontrol!) THEN      //Check if control key is pressed
				This.TriggerEvent ("ue_ctrlclicked")
			ELSEIF keydown(keyshift!) THEN	         
				this.selectrow(0,false)			
				This.TriggerEvent ("ue_shiftclicked")
			ELSE
				This.SelectRow(0, FALSE)
				This.SelectRow(ii_rownum,TRUE)
			END IF
	END CHOOSE
END IF

ii_Selected_row = ii_rownum

	


end event

event dberror;//////////////////////////////////////////////////////////////////////
//
//	Evento:		DBerror
//
//	Objetivo:	Si hubo error al grabar la datawindow, se despliega un 
//					mensaje al usuario indicando en que tabla fue.
//					La tabla se setea a trav$$HEX1$$e900$$ENDHEX$$s de la funci$$HEX1$$f300$$ENDHEX$$n f_tabla_error(nro)
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

SQLCA.SQLCode = -1 
SQLCA.SQLDbCode = sqldbcode
SQLCA.SQLErrText = sqlerrtext
//gnv_msg.f_error(ii_tabla)

RETURN(1)

end event

on itemerror;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Itemerror
//
//	Objetivo:	Si el dato ingresado no es correcto, despliega un mensaje
//					indic$$HEX1$$e100$$ENDHEX$$ndolo, y deja en el campo modioficado el valor 
//					anterior
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					27/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

string	ls_texto, ls_columna, ls_modstring, a

ls_texto = This.GetText()
ls_columna = This.GetColumnName()

This.Describe(This.GetColumnName()+".ValidationMsg")

ls_modstring = ls_columna + ".ValidationMsg='El item " + ls_texto &
					+ " no ha pasado las validaciones'"
a = This.Modify(ls_modstring)


end on

event constructor;//***************************************
//**  OSGI 2001.1  	20/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fg_ventana_parametro('NIC', This)
//***************************************
//**  OSGI 2001.1  	20/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on u_nis_2001_pr_nis_rad.create
end on

on u_nis_2001_pr_nis_rad.destroy
end on


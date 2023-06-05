HA$PBExportHeader$u_cli_2001_pr_cliente_std.sru
$PBExportComments$UserObject de presentaci$$HEX1$$f300$$ENDHEX$$n de cliente estandar.
forward
global type u_cli_2001_pr_cliente_std from datawindow
end type
end forward

global type u_cli_2001_pr_cliente_std from datawindow
integer width = 2149
integer height = 316
string dataobject = "d_cliente"
end type
global u_cli_2001_pr_cliente_std u_cli_2001_pr_cliente_std

type variables

end variables

forward prototypes
public function integer fpr_posicion (integer pi_x, integer pi_y)
public function integer fpr_tamanio (integer pi_ancho, integer pi_alto)
public function integer fpr_habilitar_campos (boolean pb_nombre, boolean pb_documento)
public function integer fpr_limpiar_campos ()
public function integer fpr_llenar_campos (ref s_direccion_cliente pstr_dir_cli)
public function integer fpr_llenar_campos2 (ref s_avisos pstr_avisos)
public function integer fpr_habilitar_menos_ape (boolean pb_todo)
public function integer f_insertar_fila ()
public function integer fpr_conectar (ref datawindow pdw_cliente)
public function integer fpr_c_estruc_dir_por_doc (ref s_direccion_cliente pstr_dir_cli)
public function boolean fpr_cargardatoscliente (string ps_nom, string ps_ape1, string ps_ape2)
public function string fpr_v_documento (ref datawindow pdw_cliente)
end prototypes

public function integer fpr_posicion (integer pi_x, integer pi_y);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_posicion
// 
// Objetivo: Retorna la posici$$HEX1$$f300$$ENDHEX$$n indicada.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  pi_x, pi_y
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

RETURN This.Move(pi_x,pi_y)
end function

public function integer fpr_tamanio (integer pi_ancho, integer pi_alto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_tamanio
// 
// Objetivo: Retorna tama$$HEX1$$f100$$ENDHEX$$o por omisi$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: pi_ancho, pi_alto
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

RETURN This.Resize(pi_ancho,pi_alto)
end function

public function integer fpr_habilitar_campos (boolean pb_nombre, boolean pb_documento);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos del nombre o el documento en funci$$HEX1$$f300$$ENDHEX$$n del
// valor de los par$$HEX1$$e100$$ENDHEX$$metros que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//	en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: pb_nombre (boolean que indica si se hab. los campos del nombre)
//				pb_documento (boolean que indica si se hab. los campos del docum.)
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	17/7/95		SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF pb_nombre THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("nombre.background.color=" + string(65536*255+256*255+255)+&
//			 "~t ap1.background.color=" + string(65536*255+256*255+255) +&
//			 "~t ap2.background.color=" + string(65536*255+256*255+255))
	this.modify("nombre.background.color=" + gs_blanco +&
			 "~t ap1.background.color=" + gs_blanco +&
			 "~t ap2.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("ap1",10)
	this.SetTabOrder("ap2",20)
	this.SetTabOrder("nombre",30)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("nombre.background.color=" + string(65536*192+256*192+192) +&
//			 "~t ap1.background.color=" + string(65536*192+256*192+192) +&
//			 "~t ap2.background.color=" + string(65536*192+256*192+192))
	this.modify("nombre.background.color=" + gs_gris +&
			 "~t ap1.background.color=" + gs_gris +&
			 "~t ap2.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("nombre",0)
	this.SetTabOrder("ap1",0)
	this.SetTabOrder("ap2",0)
END IF

IF pb_documento THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("doc_id.background.color=" + string(65536*255+256*255+255) +&
//			 "~t tip_doc.background.color=" + string(65536*255+256*255+255)+&
//			 "~t co_pais.background.color=" + string(65536*255+256*255+255))
	this.modify("doc_id.background.color=" + gs_blanco +&
			 "~t tip_doc.background.color=" + gs_blanco +&
			 "~t co_pais.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("doc_id",40)
	this.SetTabOrder("tip_doc",50)
	this.SetTabOrder("co_pais",60)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("doc_id.background.color=" + string(65536*192+256*192+192) +&
//			 "~t tip_doc.background.color=" + string(65536*192+256*192+192) +&
//			 "~t co_pais.background.color=" + string(65536*192+256*192+192))
	this.modify("doc_id.background.color=" + gs_gris +&
			 "~t tip_doc.background.color=" + gs_gris +&
			 "~t co_pais.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("doc_id",0)
	this.SetTabOrder("tip_doc",0)
	this.SetTabOrder("co_pais",0)
END IF

RETURN 1
end function

public function integer fpr_limpiar_campos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_limpiar_campos
// 
// Objetivo: Resetea datawindow de cliente.
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


string ls_nulo



SetNull(ls_nulo)

This.SetItem(1,"ap1",ls_nulo)
This.SetItem(1,"ap2",ls_nulo)
This.SetItem(1,"nombre",ls_nulo)
This.SetItem(1,"doc_id",ls_nulo)
This.SetItem(1,"tip_doc",ls_nulo)
This.SetItem(1,"co_pais",ls_nulo)
This.AcceptText()

RETURN 1

end function

public function integer fpr_llenar_campos (ref s_direccion_cliente pstr_dir_cli);
/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_llenar_campos
// 
// Objetivo: Setea la D.W de cliente con los valores obtenidos(setredraw)
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  pstr_dir_cli
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
/////////////////////////////////////////////////////////////////////////

SetRedraw(False)

This.SetItem(1,"ap1",pstr_dir_cli.gs_ape1)
This.SetItem(1,"ap2",pstr_dir_cli.gs_ape2)
This.SetItem(1,"nombre",pstr_dir_cli.gs_nom)
This.SetItem(1,"doc_id",pstr_dir_cli.gs_doc)
This.SetItem(1,"tip_doc",pstr_dir_cli.gs_tipo_doc)
This.SetItem(1,"co_pais",pstr_dir_cli.gs_co_pais)

SetRedraw(True)

RETURN 1
end function

public function integer fpr_llenar_campos2 (ref s_avisos pstr_avisos);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_llenar_campos2
// 
// Objetivo: Setea la D.W. de cliente con los valores obtenidos.(setredraw)
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: pstr_avisos
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

SetRedraw(False)

This.SetItem(1,"ap1",pstr_avisos.gs_ape1)
This.SetItem(1,"ap2",pstr_avisos.gs_ape2)
This.SetItem(1,"nombre",pstr_avisos.gs_nombre)
This.SetItem(1,"doc_id",pstr_avisos.gs_doc_id)
This.SetItem(1,"tip_doc",pstr_avisos.gs_tip_doc)
This.SetItem(1,"co_pais",pstr_avisos.gs_co_pais)

SetRedraw(True)

RETURN 1
end function

public function integer fpr_habilitar_menos_ape (boolean pb_todo);// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//This.modify("nombre.background.color=" + string(65536*192+256*192+192))
//
//This.modify("tip_doc.background.color=" + string(65536*192+256*192+192) +&
//		 "~t co_pais.background.color=" + string(65536*192+256*192+192))
//This.SetTabOrder("nombre",0)
//This.SetTabOrder("tip_doc",0)
//This.SetTabOrder("co_pais",0)
//
//IF pb_todo THEN
//	This.modify("ap1.background.color=" + string(65536*255+256*255+255) +&
//			 "~t ap2.background.color=" + string(65536*255+256*255+255) +&
//			"~t doc_id.background.color=" + string(65536*255+256*255+255))
//	This.SetTabOrder("ap1",10)
//	This.SetTabOrder("ap2",20)
//	This.SetTabOrder("doc_id",30)
//ELSE
//	This.modify("ap1.background.color=" + string(65536*192+256*192+192) +&
//			 "~t ap2.background.color=" + string(65536*192+256*192+192) +&
//				"~t doc_id.background.color=" + string(65536*192+256*192+192))
//	This.SetTabOrder("ap1",0)
//	This.SetTabOrder("ap2",0)	
//	This.SetTabOrder("doc_id",0)
//END IF
//
//RETURN 1

This.modify("nombre.background.color=" + gs_gris)

This.modify("tip_doc.background.color=" + gs_gris +&
		 "~t co_pais.background.color=" + gs_gris)
This.SetTabOrder("nombre",0)
This.SetTabOrder("tip_doc",0)
This.SetTabOrder("co_pais",0)

IF pb_todo THEN
	This.modify("ap1.background.color=" + gs_blanco +&
			 "~t ap2.background.color=" + gs_blanco +&
			"~t doc_id.background.color=" + gs_blanco)
	This.SetTabOrder("ap1",10)
	This.SetTabOrder("ap2",20)
	This.SetTabOrder("doc_id",30)
ELSE
	This.modify("ap1.background.color=" + gs_gris +&
			 "~t ap2.background.color=" + gs_gris +&
				"~t doc_id.background.color=" + gs_gris)
	This.SetTabOrder("ap1",0)
	This.SetTabOrder("ap2",0)	
	This.SetTabOrder("doc_id",0)
END IF

RETURN 1

// Fin. Sgo.
end function

public function integer f_insertar_fila ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_insertar_fila
// 
// Objetivo: Inserta una fila en blanco en la dw
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//						SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

RETURN this.InsertRow(0)
end function

public function integer fpr_conectar (ref datawindow pdw_cliente);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_conectar
// 
// Objetivo:	Conecta las DropDownDW de la DW pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdw_cliente (datawindow con la inf. del cliente)
//
//	Salida:  -- 
//						
// Devuelve:	1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/02/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//	02/04/96		HMA 			Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

datawindowchild	ldwch_tip_doc, ldwch_co_pais

pdw_cliente.GetChild('tip_doc',ldwch_tip_doc)
pdw_cliente.GetChild('co_pais',ldwch_co_pais)

ldwch_tip_doc.SetTransObject(sqlca)
ldwch_co_pais.SetTransObject(sqlca)

ldwch_tip_doc.Retrieve("TD%")
ldwch_co_pais.Retrieve("PD%")

RETURN 1
end function

public function integer fpr_c_estruc_dir_por_doc (ref s_direccion_cliente pstr_dir_cli);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fpr_c_estruc_dir_por_doc
// 
// Objetivo: Obtiene datos de cliente
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

SELECT CLIENTES.APE1_CLI,
		 CLIENTES.APE2_CLI,
		 CLIENTES.NOM_CLI
INTO  :parmstr1 ,
		:parmstr2 ,
 		:parmstr3 
FROM   CLIENTES
WHERE  (CLIENTES.COD_CLI = :pstr_dir_cli.gl_cod_cli);

parnum2 = pstr_dir_cli.gl_cod_cli

IF sqlca.SqlCode = 0 THEN

	Open(w_re0500_ss)

	IF parnum1 = 0 THEN
		RETURN -1
	ELSE
		pstr_dir_cli = dir
		RETURN 1
	END IF
ELSEIF sqlca.SqlCode = 100 THEN
	RETURN 0
ELSE
	gnv_msg.f_mensaje("ER30","","",OK!)
	RETURN -1
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
	from CLIENTES 
	where ape2_cli = :ps_ape2;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el 1$$HEX2$$ba002000$$ENDHEX$$apellido.

if ps_nom = '' and ps_ape1 <> '' and ps_ape2 = '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from CLIENTES 
	where ape1_cli = :ps_ape1 ;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el 2$$HEX2$$ba002000$$ENDHEX$$apellido y el 1$$HEX1$$ba00$$ENDHEX$$.

if ps_nom = '' and ps_ape1 <> '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from CLIENTES 
	where ape2_cli = :ps_ape2 and ape1_cli = :ps_ape1;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el 2$$HEX2$$ba002000$$ENDHEX$$apellido y el 1$$HEX1$$ba00$$ENDHEX$$.

if ps_nom = '' and ps_ape1 <> '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from CLIENTES 
	where ape2_cli = :ps_ape2 and ape1_cli = :ps_ape1;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el nombre.

if ps_nom <> '' and ps_ape1 = '' and ps_ape2 = '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from CLIENTES 
	where nom_cli = :ps_nom ;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el nombre y el 2$$HEX2$$ba002000$$ENDHEX$$apellido.

if ps_nom <> '' and ps_ape1 = '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from CLIENTES 
	where nom_cli = :ps_nom and ape2_cli = :ps_ape2 ;
end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$el nombre y el 1$$HEX2$$ba002000$$ENDHEX$$apellido.

if ps_nom <> '' and ps_ape1 <> '' and ps_ape2 = '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from CLIENTES 
	where nom_cli = :ps_nom and ape1_cli = :ps_ape1 ;

end if

// Si ingres$$HEX2$$f3002000$$ENDHEX$$los tres.

if ps_nom <> '' and ps_ape1 <> '' and ps_ape2 <> '' then

	select cod_cli, nom_cli, ape1_cli, ape2_cli
	into :li_cod_cli, :ls_nom_cli, :ls_ape1_cli, :ls_ape2_cli 
	from CLIENTES 
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

public function string fpr_v_documento (ref datawindow pdw_cliente);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_v_documento
//
// Objetivo: Valida el campo documento.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pdw_cliente
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_doc_id

ls_doc_id = pdw_cliente.GetItemString(1,"doc_id")

IF IsNull(ls_doc_id) OR ls_doc_id = "" OR ls_doc_id = " " THEN
	RETURN " "
ELSE
	RETURN ls_doc_id 
END IF

end function

on dberror;////////////////////////////////////////////////////////////////////////////////////////////////
// Evento:
//
// Objetivo:
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//  Fecha		Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------	----------------------------------------
// 		SAS		Versi$$HEX1$$f300$$ENDHEX$$n original
//
////////////////////////////////////////////////////////////////////////////////////////////////

end on

event constructor;DataWindowChild dddw

this.SetTransObject(SQLCA)

this.GetChild("tip_doc",dddw)
dddw.SetTransObject(SQLCA)
dddw.Retrieve('TD%')

this.GetChild("co_pais",dddw)
dddw.SetTransObject(SQLCA)
dddw.Retrieve('PD%')
end event

on u_cli_2001_pr_cliente_std.create
end on

on u_cli_2001_pr_cliente_std.destroy
end on


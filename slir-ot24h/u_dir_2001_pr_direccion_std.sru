HA$PBExportHeader$u_dir_2001_pr_direccion_std.sru
$PBExportComments$UserObject de presentaci$$HEX1$$f300$$ENDHEX$$n de direcci$$HEX1$$f300$$ENDHEX$$n estandar.
forward
global type u_dir_2001_pr_direccion_std from datawindow
end type
end forward

global type u_dir_2001_pr_direccion_std from datawindow
integer width = 2322
integer height = 644
string dataobject = "d_direccion"
end type
global u_dir_2001_pr_direccion_std u_dir_2001_pr_direccion_std

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_dir_global, boolean pb_dir_particular)
public function integer fpr_posicion (integer pi_x, integer pi_y)
public function integer fpr_tamanio (integer pi_ancho, integer pi_alto)
public function integer fpr_invisible_cgv ()
public function integer fpr_limpiar_campos ()
public function integer fpr_llenar_campos (ref s_direccion_cliente pstr_dir_cli)
public function integer fpr_llenar_campos2 (ref s_avisos pstr_avisos)
public function integer fpr_setear_campos (string ps_prov, string ps_depto, string ps_munic, string ps_local)
public function integer fpr_c_datos (ref u_generico_comunicaciones pu_gen_comunic, singlelineedit psle_esq_cond)
public function integer fpr_limpiar_campos_2 ()
public function integer f_insertar_fila ()
end prototypes

public function integer fpr_habilitar_campos (boolean pb_dir_global, boolean pb_dir_particular);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos numero, duplicador y cgv en funci$$HEX1$$f300$$ENDHEX$$n del
// valor de los par$$HEX1$$e100$$ENDHEX$$metros que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//	en color blanco o gris
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//	Entrada: pb_dir_global (boolean que indica si se habilita la provincia,departamento,municipio y localidad)
//				pb_dir_particular (boolean que indica si se habilita la calle,nro. puerta,duplicador y cgv)
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	22/01/96		  	HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF pb_dir_global THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//    this.modify("Provincia.background.color= " + string(65536*255+256*255+255))
//	 this.modify("depto.background.color= " + string(65536*255+256*255+255))
//	 this.modify("Municipio.background.color= " + string(65536*255+256*255+255))
//	 this.modify("Localidad.background.color= " + string(65536*255+256*255+255))
    this.modify("Provincia.background.color= " + gs_blanco)
	 this.modify("depto.background.color= " + gs_blanco)
	 this.modify("Municipio.background.color= " + gs_blanco)
	 this.modify("Localidad.background.color= " + gs_blanco)
// Fin. Sgo.
    this.SetTabOrder("Provincia",10)
    this.SetTabOrder("depto",20)
    this.SetTabOrder("Municipio",30)
    this.SetTabOrder("Localidad",40)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("Provincia.background.color=" + string(65536*192+256*192+192) +&
//			 "~t depto.background.color=" + string(65536*192+256*192+192) +&
//			 "~t Municipio.background.color=" + string(65536*192+256*192+192) +&
//			 "~t Localidad.background.color=" + string(65536*192+256*192+192))
	this.modify("Provincia.background.color=" + gs_gris +&
			 "~t depto.background.color=" + gs_gris +&
			 "~t Municipio.background.color=" + gs_gris +&
			 "~t Localidad.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("Provincia",0)
	this.SetTabOrder("depto",0)
	this.SetTabOrder("Municipio",0)
	this.SetTabOrder("Localidad",0)
END IF

IF pb_dir_particular THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("calle.background.color=" + string(65536*255+256*255+255) +&
//			"~t numero.background.color=" + string(65536*255+256*255+255) +&
//			"~t duplic.background.color=" + string(65536*255+256*255+255) +&
//			"~t cgv.background.color=" + string(65536*255+256*255+255))
	
	//this.modify("calle.background.color=" + gs_blanco) comentado por error
	this.modify("numero.background.color=" + gs_blanco)
	this.modify("duplic.background.color=" + gs_blanco)
	this.modify("cgv.background.color=" + gs_blanco)
	
// Fin. Sgo.
	this.SetTabOrder("calle",50)
	this.SetTabOrder("numero",60)
	this.SetTabOrder("duplic",70)
	this.SetTabOrder("cgv",80)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("calle.background.color=" + string(65536*192+256*192+192) +&
//			"~t numero.background.color=" + string(65536*192+256*192+192) +&
//			"~t duplic.background.color=" + string(65536*192+256*192+192) +&
//			"~t cgv.background.color=" + string(65536*192+256*192+192))

	//this.modify("calle.background.color=" + gs_gris) comentado por error
	this.modify("numero.background.color=" + gs_gris)
	this.modify("duplic.background.color=" + gs_gris)
	this.modify("cgv.background.color=" + gs_gris)
	this.modify("calle.background.color=" + gs_gris)
	
// Fin. Sgo.
	this.SetTabOrder("calle",0)
	this.SetTabOrder("numero",0)
	this.SetTabOrder("duplic",0)
	this.SetTabOrder("cgv",0)
END IF

RETURN 1
end function

public function integer fpr_posicion (integer pi_x, integer pi_y);/////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_posicion
// 
// Objetivo:  Ubica el objeto seg$$HEX1$$fa00$$ENDHEX$$n valores de par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pi_x, pi_y
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////

RETURN This.Move(pi_x,pi_y)
end function

public function integer fpr_tamanio (integer pi_ancho, integer pi_alto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_tamanio
// 
// Objetivo: Cambia el tama$$HEX1$$f100$$ENDHEX$$o del objeto seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metros recibidos.   
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pi_ancho, pi_alto
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//
//
////////////////////////////////////////////////////////////////////////////////////////////////

RETURN This.Resize(pi_ancho,pi_alto)
end function

public function integer fpr_invisible_cgv ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_invisible_cgv
// 
// Objetivo:	Deje invisible el campo CGV y el texto asociado
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  --
//	Salida:   --
//						
// Devuelve: Codigo de error	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//		17/7/95		SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


this.Modify("cgv.visible ='0'~t cgv_t.visible ='0'")
return 1
end function

public function integer fpr_limpiar_campos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_limpiar_campos
// 
// Objetivo: Reseteo la datawindow de direcci$$HEX1$$f300$$ENDHEX$$n.
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
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////




string ls_nulo


This.SetItem(1,"provincia",ls_nulo)
This.SetItem(1,"depto",ls_nulo)
This.SetItem(1,"municipio",ls_nulo)
This.SetItem(1,"localidad",ls_nulo)
This.SetItem(1,"calle",ls_nulo)
This.SetItem(1,"numero",ls_nulo)
This.SetItem(1,"duplic",ls_nulo)
This.SetItem(1,"cgv",ls_nulo) // LFE 03/08/2004
////////////////////////////////////////////////
// VERSION UNIFICADA TIPO_CALLE AMR 08/08/2002
///////////////////////////////////////////////
This.SetItem(1,"c_desc_tipo",ls_nulo)
///////////////////////////////////////////////
This.AcceptText()

RETURN 1

end function

public function integer fpr_llenar_campos (ref s_direccion_cliente pstr_dir_cli);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_llenar_campos
// 
// Objetivo: Seteo los valores de la datawindow direcci$$HEX1$$f300$$ENDHEX$$n pasados 
//           como par$$HEX1$$e100$$ENDHEX$$metros.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico.
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
////////////////////////////////////////////////////////////////////////////////////////////////

SetRedraw(False)

This.SetItem(1,"provincia",pstr_dir_cli.gs_prov)
This.SetItem(1,"depto",pstr_dir_cli.gs_depto)
This.SetItem(1,"municipio",pstr_dir_cli.gs_munic)
This.SetItem(1,"localidad",pstr_dir_cli.gs_local)
This.SetItem(1,"cgv",pstr_dir_cli.gs_pisodpto)

IF pstr_dir_cli.gs_ref = "" THEN
	This.SetItem(1,"calle",pstr_dir_cli.gs_calle)
ELSE	
	IF parmstr6 = "" and (pstr_dir_cli.gs_calle = "" or isnull(pstr_dir_cli.gs_calle)) THEN
		This.SetItem(1,"calle",parmstr6)
	ELSE	
		This.SetItem(1,"calle",pstr_dir_cli.gs_calle)
	END IF	
END IF	
IF pstr_dir_cli.gl_numero <> 0 THEN
	This.SetItem(1,"numero",string(pstr_dir_cli.gl_numero))
ELSE
	This.SetItem(1,"numero","")	
END IF

//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 13/06/2002  **
//**************************************************
  fg_datos_tipo_calle(This, pstr_dir_cli.gl_codcalle, 0)
//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 13/06/2002  **
//**************************************************

This.SetItem(1,"duplic",pstr_dir_cli.gs_duplic)

SetRedraw(True)

RETURN 1
end function

public function integer fpr_llenar_campos2 (ref s_avisos pstr_avisos);//////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_llenar_campos2
// 
// Objetivo: Seteo la datawindow de direcci$$HEX1$$f300$$ENDHEX$$n con los valores de los
//				 campos pasados como par$$HEX1$$e100$$ENDHEX$$metros.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  pstr_avisos
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////


SetRedraw(False)

This.SetItem(1,"provincia",pstr_avisos.gs_nom_prov)
This.SetItem(1,"depto",pstr_avisos.gs_nom_depto)
This.SetItem(1,"municipio",pstr_avisos.gs_nom_munic)
This.SetItem(1,"localidad",pstr_avisos.gs_nom_loc)
This.SetItem(1,"calle",pstr_avisos.gs_nom_calle)
This.SetItem(1,"numero",string(pstr_avisos.gl_num_puerta))
This.SetItem(1,"duplic",pstr_avisos.gs_duplicador)

SetRedraw(True)

RETURN 1
end function

public function integer fpr_setear_campos (string ps_prov, string ps_depto, string ps_munic, string ps_local);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_setear_campos
// 
// Objetivo:	Recibe los datos de Provincia, Departamento, Municipio y 
//					Localidad a colocar en el U.O. de direcci$$HEX1$$f300$$ENDHEX$$n, no hace un 
//					"Retrieve".
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  ps_prov, ps_depto, ps_munic, ps_local
//	Salida:   --
//						
// Devuelve: 1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/02/96			HMA		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

this.SetItem(1,"provincia", ps_prov)
this.SetItem(1,"depto", ps_depto)
this.SetItem(1,"municipio", ps_munic)
this.SetItem(1,"localidad", ps_local)

RETURN 1

end function

public function integer fpr_c_datos (ref u_generico_comunicaciones pu_gen_comunic, singlelineedit psle_esq_cond);
/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_c_datos
// 
// Objetivo: Carga datos en las variables de comunicaciones.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: psle_esq_cond, pu_gen_comunic
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////

pu_gen_comunic.is_comunic.strval5 = This.GetItemString(This.GetRow(),"calle")
pu_gen_comunic.is_comunic.strval6 = This.GetItemString(This.GetRow(),"numero")
pu_gen_comunic.is_comunic.strval7 = This.GetItemString(This.GetRow(),"duplic")
pu_gen_comunic.is_comunic.strval8 = psle_esq_cond.text

RETURN 1
end function

public function integer fpr_limpiar_campos_2 ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_limpiar_campos_2
// 
// Objetivo: Reseteo la datawindow de direcci$$HEX1$$f300$$ENDHEX$$n, excepto los campos
//				 de provincia, municipio,localidad y departamento.
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
//	23/1/96		AFS			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


string ls_nulo

This.SetItem(1,"calle",ls_nulo)
This.SetItem(1,"numero",ls_nulo)
This.SetItem(1,"duplic",ls_nulo)

/////////////////////////////////////////////////
// VERSION UNIFICADA TUPO_CALLE AMR 08/08/2002
/////////////////////////////////////////////////
SetNull(ls_nulo)

This.SetItem(1,"c_desc_tipo",ls_nulo)
/////////////////////////////////////////////////
This.AcceptText()

RETURN 1

end function

public function integer f_insertar_fila ();return this.insertrow(0)

end function

event itemerror;//////////////////////////////////////////////////////////////////////
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


RETURN(2)
end event

event constructor;this.SetTransObject(SQLCA)
//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 13/06/2002  **
//**************************************************
If gb_tipos_de_via Then
	This.Modify("c_tipo_via_t.Visible=1")
	This.Modify("calle.Visible=0")
End If

fg_mover_campos_num_puerta_duplic(This)
//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 13/06/2002  **
//**************************************************
end event

on u_dir_2001_pr_direccion_std.create
end on

on u_dir_2001_pr_direccion_std.destroy
end on


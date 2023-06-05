HA$PBExportHeader$u_cen_2002_pr_form_centro_cmd_mesa_oc.sru
forward
global type u_cen_2002_pr_form_centro_cmd_mesa_oc from datawindow
end type
end forward

global type u_cen_2002_pr_form_centro_cmd_mesa_oc from datawindow
integer width = 699
integer height = 352
string dataobject = "d_ambito_oculto"
event post_itemchange pbm_custom20
end type
global u_cen_2002_pr_form_centro_cmd_mesa_oc u_cen_2002_pr_form_centro_cmd_mesa_oc

type variables
String s_columna
int centro
DataWindowChild ddw_centro
DataWindowChild ddw_cmd
DataWindowChild ddw_mesa

// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
end variables

forward prototypes
public function integer fpr_filtro_mesa ()
public function integer fpr_crea_dddw ()
public function integer fpr_filtro_cmd ()
public function integer fnu_filtro_centro ()
public function integer fnu_insertar_datos (integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_mesa, integer pi_proteger)
public function integer fnu_devolver_cmd ()
public function integer fpr_insertar_datos (integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_mesa, integer pi_proteger)
public function string fnu_filtro_ambito (integer pi_centro, integer pi_cmd, integer pi_puesto)
public function integer fpr_habilitar_campos (boolean pb_cond)
public function string fnu_filtro_ambito_2 (integer pi_centro, integer pi_cmd, integer pi_puesto)
public subroutine fpr_hab_centro (ref datawindow pd_dw)
public subroutine fnu_deshab_centro (ref datawindow pd_dw)
public subroutine fnu_deshab_cmd (ref datawindow pd_dw)
public subroutine fnu_deshab_puesto (ref datawindow pd_dw)
public subroutine fnu_hab_puesto (ref datawindow pd_dw)
public subroutine fnu_hab_cmd (ref datawindow pd_dw)
public subroutine fpr_hab_cmd (ref datawindow pd_dw)
public subroutine fpr_hab_puesto (ref datawindow pd_dw)
public subroutine fpr_deshab_centro (ref datawindow pd_dw)
public subroutine fpr_deshab_cmd (ref datawindow pd_dw)
public subroutine fpr_deshab_puesto (ref datawindow pd_dw)
public function integer fnu_cargar_estructura (long pi_centro, long pi_cmd, long pi_puesto, ref datawindow pd_dw)
public function integer fpr_filtro_tito (ref datawindow pd_dw, integer pi_nro_centro)
public function integer fnu_filtro_mesa_nuevo (ref datawindow pd_dw, integer pi_nro_cmd)
public subroutine fnu_des_cmd ()
public subroutine fnu_des_puesto ()
public subroutine fnu_habi_cmd ()
public subroutine fnu_habi_puesto ()
public subroutine fnu_filtro_mesa_n ()
public function integer fnu_ini_filtro (ref datawindow pd_dw, integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_puesto)
public function string fnu_filtro_amb (integer pi_centro, integer pi_cmd, integer pi_puesto)
public subroutine fnu_filtro_cmd_n ()
public subroutine fnu_filtrar_cmd (ref datawindow pd_dw, integer pi_nro_centro)
public function integer f_insertar_fila ()
public function integer fnu_creo_ddw_sin_s ()
public subroutine fnu_filtro_cmd_out ()
public subroutine fnu_filtro_mesa_out ()
end prototypes

on post_itemchange;//int centro,cmd,mesa,li_sin_seleccionar
//
//
//SETNULL(li_sin_seleccionar)
//this.AcceptText()
//CHOOSE CASE s_columna
//	CASE "nro_centro"
//		centro=this.GetItemNumber(1,"nro_centro")
//		IF (centro<>99 AND Not IsNull(centro)) THEN
//			this.fpr_filtro_cmd()
//		ELSE
//			This.SetItem(1,"nro_cmd",li_sin_seleccionar)
//			This.SetItem(1,"nro_mesa",li_sin_seleccionar)
//		END IF
//
//	CASE "nro_cmd"
//		cmd=this.GetItemNumber(1,"nro_cmd")
//		IF (cmd<>li_sin_seleccionar AND cmd<>99) THEN
//			this.fpr_filtro_mesa()		
//		ELSE
//			This.SetItem(1,"nro_mesa",li_sin_seleccionar)
//		END IF
//		
//
//	CASE "nro_mesa"
////
//
//END CHOOSE
//
this.accepttext()
end on

public function integer fpr_filtro_mesa ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_filtro_mesa
// 
// Objetivo: Filtra los datos de la ddw_mesa en relacion al valor
//				 seleccionado en la ddw_cmd
//
// Ambito:	
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

int li_cmd

	ddw_mesa.SetFilter("")
	ddw_mesa.Filter()
	li_cmd=this.GetItemNumber(1,"nro_cmd")
	
	IF li_cmd<>0 AND Not ISNULL(li_cmd) THEN
		ddw_mesa.SetFilter("centro_resp = " + string(li_cmd)+" OR centro_resp = 0")
		ddw_mesa.Filter()
	END IF
	

Return 1




//int i_nro_cmd
//
//	ddw_mesa.SetFilter("")
//	ddw_mesa.Filter()
//	i_nro_cmd=this.GetItemNumber(1,"nro_cmd")
//	
//	IF i_nro_cmd=0 THEN
//		ddw_mesa.SetFilter("centro_resp = 0")
//	ELSE
//		ddw_cmd.SetFilter("centro_resp = " + string(i_nro_cmd)+"OR centro_reps = 0")
//		//ddw_mesa.SetFilter("centro_resp = "+string(i_nro_cmd)+"OR centro_resp = 99 or centro_resp = 0")	
//	END IF
//	
//	ddw_mesa.Filter()
//Return 1
//
//
end function

public function integer fpr_crea_dddw ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_crea_dddw
// 
// Objetivo: crea las drop down datawindows internas del user object.
//	
//
// Ambito:	
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
//int ii
//
//this.GetChild("nro_centro",ddw_centro)
//ii = ddw_centro_shared.sharedata(ddw_centro)
//
//
//this.GetChild("nro_cmd",ddw_cmd)
//ii = ddw_cmd_shared.sharedata(ddw_cmd)
//
//this.GetChild("nro_mesa",ddw_mesa)
//ii = ddw_mesa_shared.sharedata(ddw_mesa)
//
//
//

RETURN 1
end function

public function integer fpr_filtro_cmd ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_filtro_cmd
// 
// Objetivo: Filtra los datos de la ddw_cmd en relacion al valor
//				 seleccionado en la ddw_centro
//
// Ambito:	
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


integer li_centro
long aux
string xx
ddw_cmd.SetFilter("")
ddw_cmd.Filter()
li_centro=this.GetItemNumber(1,"nro_centro")
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	
	ddw_cmd.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
	aux=ddw_cmd.Filter()
	aux=ddw_cmd.Filteredcount()
END IF

		
Return 1


//integer i_nro_centro
//
//	ddw_cmd.SetFilter("")
//	ddw_cmd.Filter()
//	i_nro_centro=this.GetItemNumber(1,"nro_centro")
//	IF i_nro_centro=0 THEN
//		ddw_cmd.SetFilter("centro_resp = 0")
//	ELSE
//		ddw_cmd.SetFilter("centro_resp = " + string(i_nro_centro)+"OR  centro_reps = 0")
//		//ddw_cmd.SetFilter("centro_resp = " + string(i_nro_centro)+"OR centro_resp = 99 or centro_reps = 0")
//	END IF
//	ddw_cmd.Filter()
//		
//Return 1
end function

public function integer fnu_filtro_centro ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_filtro_centro
// 
// Objetivo: Filtra el centro TODOS de la ddw_centro 
//				 
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

//integer i_nro_centro
//
//	ddw_cmd.SetFilter("nro_centro <>99 ")
//	ddw_cmd.Filter()
//		
Return 1
end function

public function integer fnu_insertar_datos (integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_mesa, integer pi_proteger);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_inserta_datos
// 
// Objetivo: inserta datos de la ddw_cmd pasados por parametro
//				 
//
// Ambito:	
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  nro_centro
//				 nro_cmd
//				 nro_mesa
//				 proteger =1 habilitar , 0 deshabilitar
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


	This.SetItem(1,"nro_centro",pi_nro_centro)
	This.SetItem(1,"nro_cmd",pi_nro_cmd)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)

	IF pi_proteger =1 THEN
		This.Modify("nro_centro.protect=1")
		This.Modify("nro_cmd.protect=1")		
		This.Modify("nro_mesa.protect=1")
	ELSE
		This.Modify("nro_centro.protect=0")
		This.Modify("nro_cmd.protect=0")		
		This.Modify("nro_mesa.protect=0")
	END IF
Return 1
end function

public function integer fnu_devolver_cmd ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_cmd
// 
// Objetivo: Retorna campo nro de cmd  
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


Return this.GetItemNumber(1,"nro_cmd")
end function

public function integer fpr_insertar_datos (integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_mesa, integer pi_proteger);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_insertar_datos
// 
// Objetivo: Inserta los datos de la ddw_cmd pasados por parametro, y 
//				 habilita o n$$HEX2$$f3002000$$ENDHEX$$sus campos segun el valor del par. proteger.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  nro_centro
//				 nro_cmd
//				 nro_mesa
//				 proteger =1 habilitar , 0 deshabilitar
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	14/02/96			HMA		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_color_gris, ll_color_azul, ll_color_blanco

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ll_color_blanco=(65536*255+256*255+255)
//ll_color_gris=(65536*192+256*192+192)
ll_color_blanco = long(gs_blanco)
ll_color_gris = long(gs_gris)
// Fin. Sgo.
ll_color_azul=(65536*128)

This.SetItem(1,"nro_centro",pi_nro_centro)
This.SetItem(1,"nro_cmd",pi_nro_cmd)		
This.SetItem(1,"nro_mesa",pi_nro_mesa)

IF pi_proteger = 0 THEN
	This.Modify("nro_centro.protect=0")
	This.Modify("nro_centro.Background.Color=" + string(ll_color_blanco))
	This.Modify("nro_cmd.protect=0")		
	This.Modify("nro_cmd.Background.Color=" + string(ll_color_blanco))
	This.Modify("nro_mesa.protect=0")
	This.Modify("nro_mesa.Background.Color=" + string(ll_color_blanco))
ELSE
	This.Modify("nro_centro.protect=1")
	This.Modify("nro_centro.Background.Color=" + string(ll_color_gris))
	This.Modify("nro_centro.Color=" + string(ll_color_azul))
	This.Modify("nro_cmd.protect=1")		
	This.Modify("nro_cmd.Background.Color=" + string(ll_color_gris))
	This.Modify("nro_cmd.Color=" + string(ll_color_azul))
	This.Modify("nro_mesa.protect=1")
	This.Modify("nro_mesa.Background.Color=" + string(ll_color_gris))
	This.Modify("nro_mesa.Color=" + string(ll_color_azul))
END IF

RETURN 1
end function

public function string fnu_filtro_ambito (integer pi_centro, integer pi_cmd, integer pi_puesto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_ambito
// 
// Objetivo: Permite armar el filtro para un archivo en particular considerando 
//           ambito para ser usado en un where de una sentencia sql de una 
//				 datawindows.
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
//                      	
//
////////////////////////////////////////////////////////////////////////////////////////////////


// Permite armar el filtro para un archivo en particular considerando el ambito
// para ser usado en un where de una sentencia sql de una datawindow
String ls_filtro   //que es lo que voy a filtrar
//ls_filtro=" "
//if pi_centro<>fgci_todos() THEN
//	ls_filtro= "(avisos.nro_centro = " + string(pi_centro) + ")"
////	return ls_filtro
//end if
//if pi_cmd<>fgci_todos() THEN
//	ls_filtro=ls_filtro+" and (avisos.nro_cmd = " + string(pi_cmd)+ " )"
//end if
//if pi_puesto<>fgci_todos() THEN
//	ls_filtro=ls_filtro+"and (avisos.nro_mesa = " + string(pi_puesto) + ")"
//end if	
//return ls_filtro
//// Se evalua si viene informacion en centro,cmd,puesto
////	if  pi_centro <> 0 and pi_cmd <> 0 and pi_puesto <> 0  and pi_puesto <> fgci_sin_seleccionar() then
////	    
////		return "(avisos.nro_centro = " + string(pi_centro) + ") and (avisos.nro_cmd = " + string(pi_cmd)+ " ) and (avisos.nro_mesa = " + string(pi_puesto) + ")"
////	end if
////
////	if pi_centro <> 0 and pi_cmd <> 0 and pi_cmd <> fgci_sin_seleccionar() and pi_puesto = fgci_sin_seleccionar() then
////		return "(avisos.nro_centro = " + string(pi_centro) + ") and (avisos.nro_cmd = " + string(pi_cmd)+ " )" 
////	end if
////
////
////	if  pi_centro <> 0 and pi_centro <> fgci_sin_seleccionar() and pi_cmd =  fgci_sin_seleccionar() and pi_puesto = fgci_sin_seleccionar() then
////		return "(avisos.nro_centro = " + string(pi_centro) + ")" 
////	end if
////
////	
//
//
//	
//////// Se evalua si viene informmacion solo en centro y cmd
//////
////
////	if  pi_centro <> 0 and pi_cmd <> 0 and pi_puesto = gi_todos then
////		return "(avisos.nro_centro = " + string(pi_centro) + ") and (avisos.nro_cmd = " + string(pi_cmd)+ " ) and (avisos.nro_mesa = " + string(pi_puesto) + ")"
////	end if
////	if  this.getitemnumber(1,"nro_centro") <> 0 and this.getitemnumber(1,"nro_cmd") <> 0 and this.getitemnumber(1,"nro_mesa") = gi_todos then
////		return "(avisos.nro_centro = :a_nro_centro) and (avisos.nro_cmd = :a_nro_cmd)"
////	end if
////
//////// Se evalua si viene informacion solo en centro
//////
////	if   this.getitemnumber(1,"nro_centro") <> 0 and this.getitemnumber(1,"nro_cmd") = gi_todos and this.getitemnumber(1,"nro_mesa") = gi_todos then
////		return "(avisos.nro_centro = :a_nro_centro)"
////	end if

return "  "
end function

public function integer fpr_habilitar_campos (boolean pb_cond);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos en funci$$HEX1$$f300$$ENDHEX$$n del valor del par$$HEX1$$e100$$ENDHEX$$metro 
//					que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//					en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: pb_cond (boolean que indica si se hab. los campos o n$$HEX1$$f300$$ENDHEX$$)
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/03/96		HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF pb_cond THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.Modify("nro_centro.background.color=" + string(65536*255+256*255+255) +&
//			 "~t nro_cmd.background.color=" + string(65536*255+256*255+255) +&
//			 "~t nro_mesa.background.color=" + string(65536*255+256*255+255))
	this.Modify("nro_centro.background.color=" + gs_blanco +&
			 "~t nro_cmd.background.color=" + gs_blanco +&
			 "~t nro_mesa.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("nro_centro",10)
	this.SetTabOrder("nro_cmd",20)
	this.SetTabOrder("nro_mesa",40)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.Modify("nro_centro.background.color=" + string(65536*192+256*192+192) +&
//			 "~t nro_cmd.background.color=" + string(65536*192+256*192+192)+&
//			 "~t nro_mesa.background.color=" + string(65536*192+256*192+192))
	this.Modify("nro_centro.background.color=" + gs_gris +&
			 "~t nro_cmd.background.color=" + gs_gris +&
			 "~t nro_mesa.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("nro_centro",0)
	this.SetTabOrder("nro_cmd",0)
	this.SetTabOrder("nro_mesa",0)
END IF


RETURN 1
end function

public function string fnu_filtro_ambito_2 (integer pi_centro, integer pi_cmd, integer pi_puesto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_ambito_2
// 
// Objetivo: Permite armar el filtro para un archivo en particular considerando
//           el ambito para ser usado en un where de una sentencia sql de 
//           una datawindows.
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

// Permite armar el filtro para un archivo en particular considerando el ambito
// para ser usado en un where de una sentencia sql de una datawindow

int li_todos
//
//li_todos=fgci_todos()
//
//// Se evalua si viene informacion en centro,cmd,puesto
////segun el tipo de usuarios
//		//perfil de mantenimiento
//IF fgnu_tiene_perfil(fgci_perfil_mante_encargado_turno()) OR &
//	fgnu_tiene_perfil(fgci_perfil_mante_consulta()) OR &
//	fgnu_tiene_perfil(fgci_perfil_mante_gerente()) OR &
//	fgnu_tiene_perfil(fgci_perfil_mante_operador_alta()) OR &
//	fgnu_tiene_perfil(fgci_perfil_mante_operador_baja())  THEN
//
//		IF  pi_centro <> li_todos AND  pi_cmd <> li_todos AND  pi_puesto <> li_todos  THEN
//			RETURN "(incidencia.centro_mant = " + string(pi_centro) + ") and (incidencia.cmd_mant = " + string(pi_cmd)+ " ) and (incidencia.mesa_mant = " + string(pi_puesto) + ")"
//		END IF
//		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND  pi_puesto = li_todos OR IsNull(pi_puesto) THEN
//			RETURN "(incidencia.centro_mant = " + string(pi_centro) + ") and (incidencia.cmd_mant = " + string(pi_cmd)+ " ) " 
//		END IF
//		IF pi_centro <> li_todos AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
//			RETURN "(incidencia.centro_mant = " + string(pi_centro) + ")" 
//		END IF
//		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
//			RETURN "(incidencia.cmd_mant = " + string(pi_cmd)+ " ) and (incidencia.mesa_mant = " + string(pi_puesto) + ")"
//		END IF
//		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
//			RETURN "(incidencia.cmd_mant = " + string(pi_cmd) + ")"
//		END IF
//		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND pi_puesto <> li_todos THEN
//			RETURN "(incidencia.mesa_mant = " + string(pi_puesto) + ")"
//		END IF		
//
//ELSE
//		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
//			RETURN "(incidencia.nro_centro = " + string(pi_centro) + ") and (incidencia.nro_cmd = " + string(pi_cmd)+ " ) and (incidencia.nro_mesa = " + string(pi_puesto) + ")"
//		END IF
//	
//		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
//			RETURN "(incidencia.nro_centro = " + string(pi_centro) + ") and (incidencia.nro_cmd = " + string(pi_cmd)+ " ) " 
//		END IF
//
//		IF  pi_centro <> li_todos AND (pi_cmd =  li_todos OR IsNull(pi_cmd)) AND (pi_puesto = li_todos OR IsNull(pi_puesto))THEN
//			RETURN "(incidencia.nro_centro = " + string(pi_centro) + ")" 
//		END IF
//
//		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
//			RETURN "(incidencia.nro_cmd = " + string(pi_cmd)+ " ) and (incidencia.nro_mesa = " + string(pi_puesto) + ")"
//		END IF
//
//		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
//			RETURN "(incidencia.nro_cmd = " + string(pi_cmd)+ ")"
//		END IF
//
//		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND pi_puesto <> li_todos THEN
//			RETURN "(incidencia.nro_mesa = " + string(pi_puesto) + ")"
//		END IF		
//
//
//END IF
RETURN ""
end function

public subroutine fpr_hab_centro (ref datawindow pd_dw);pd_dw.modify("nro_centro.protect=0")
pd_dw.modify("nro_centro.background.color="+string(65536*255+256*255+255))


end subroutine

public subroutine fnu_deshab_centro (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_centro
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero de centro
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


pd_dw.modify("nro_centro.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_dw.modify("nro_centro.background.color="+string(65536*192+256*192+192))
pd_dw.modify("nro_centro.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public subroutine fnu_deshab_cmd (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_cmd
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero cmd
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


pd_dw.modify("nro_cmd.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_dw.modify("nro_cmd.background.color="+string(65536*192+256*192+192))
pd_dw.modify("nro_cmd.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public subroutine fnu_deshab_puesto (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_puesto
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero mesa.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
//////////////////////////////////////////////////////////////

pd_dw.modify("nro_mesa.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_dw.modify("nro_mesa.background.color="+string(65536*192+256*192+192))
pd_dw.modify("nro_mesa.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public subroutine fnu_hab_puesto (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_hab_puesto
//
// Objetivo: Habilito campo nro_mesa
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
// 
// Devuelve:
// 
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n 
// -----		-----------		---------
//
////////////////////////////////////////////////////////


pd_dw.modify("nro_mesa.protect=0")
pd_dw.modify("nro_mesa.background.color="+string(65536*255+256*255+255))


end subroutine

public subroutine fnu_hab_cmd (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_hab_cmd
//
// Objetivo: Habilito campo cmd
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
// 
// Devuelve:
// 
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n 
// -----		-----------		---------
//
////////////////////////////////////////////////////////



pd_dw.modify("nro_cmd.protect=0")
pd_dw.modify("nro_cmd.background.color="+string(65536*255+256*255+255))


end subroutine

public subroutine fpr_hab_cmd (ref datawindow pd_dw);pd_dw.modify("nro_cmd.protect=0")
pd_dw.modify("nro_cmd.background.color="+string(65536*255+256*255+255))


end subroutine

public subroutine fpr_hab_puesto (ref datawindow pd_dw);pd_dw.modify("nro_mesa.protect=0")
pd_dw.modify("nro_mesa.background.color="+string(65536*255+256*255+255))


end subroutine

public subroutine fpr_deshab_centro (ref datawindow pd_dw);pd_dw.modify("nro_centro.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_dw.modify("nro_centro.background.color="+string(65536*192+256*192+192))
pd_dw.modify("nro_centro.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public subroutine fpr_deshab_cmd (ref datawindow pd_dw);pd_dw.modify("nro_cmd.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_dw.modify("nro_cmd.background.color="+string(65536*192+256*192+192))
pd_dw.modify("nro_cmd.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public subroutine fpr_deshab_puesto (ref datawindow pd_dw);pd_dw.modify("nro_mesa.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_dw.modify("nro_mesa.background.color="+string(65536*192+256*192+192))
pd_dw.modify("nro_mesa.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public function integer fnu_cargar_estructura (long pi_centro, long pi_cmd, long pi_puesto, ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_estructura
// 
// Objetivo: Carga datos en la estructura.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  pi_centro, pi_cmd, pi_puesto, pd_dw
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pd_dw.setitem(1,"nro_centro",pi_centro)
pd_dw.setitem(1,"nro_cmd",pi_cmd)
pd_dw.setitem(1,"nro_mesa",pi_puesto)

Return 1
end function

public function integer fpr_filtro_tito (ref datawindow pd_dw, integer pi_nro_centro);integer li_centro
DataWindowChild dw_centro

long aux
string xx
pd_dw.getchild("nro_cmd",dw_centro)
dw_centro.retrieve()
//dw_centro.SetFilter("centro_resp >= 0")
//dw_centro.Filter()
li_centro=pi_nro_centro
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	
	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF

		
Return 1


end function

public function integer fnu_filtro_mesa_nuevo (ref datawindow pd_dw, integer pi_nro_cmd);//integer li_centro
//DataWindowChild dw_centro
//
//long aux
//string xx
//pd_dw.getchild("nro_mesa",dw_centro)
////dw_centro.SetFilter("")
////dw_centro.Filter()
//dw_centro.retrieve()
////li_centro=pd_dw.GetItemNumber(1,"nro_cmd")
//li_centro=pi_nro_cmd
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
//	aux=dw_centro.Filter()
//	aux=dw_centro.Filteredcount()
//END IF
return 1


end function

public subroutine fnu_des_cmd ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_cmd
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero cmd
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("nro_cmd.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//this.modify("nro_cmd.background.color="+string(65536*192+256*192+192))
this.modify("nro_cmd.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public subroutine fnu_des_puesto ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_cmd
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero cmd
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("nro_mesa.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//this.modify("nro_mesa.background.color="+string(65536*192+256*192+192))
this.modify("nro_mesa.background.color=" + gs_gris)
// Fin. Sgo.


end subroutine

public subroutine fnu_habi_cmd ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_cmd
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero cmd
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("nro_cmd.protect=0")
this.modify("nro_cmd.background.color="+string(65536*255+256*255+255))


end subroutine

public subroutine fnu_habi_puesto ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_cmd
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero cmd
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("nro_mesa.protect=0")
this.modify("nro_mesa.background.color="+string(65536*255+256*255+255))


end subroutine

public subroutine fnu_filtro_mesa_n ();//integer li_centro
//DataWindowChild dw_centro
//
//long aux
//string xx
//this.getchild("nro_mesa",dw_centro)
////dw_centro.SetFilter("")
////dw_centro.Filter()
//dw_centro.retrieve()
////li_centro=pd_dw.GetItemNumber(1,"nro_cmd")
//li_centro=Integer(this.gettext())
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
//	aux=dw_centro.Filter()
//	aux=dw_centro.Filteredcount()
//END IF
//
//
//
end subroutine

public function integer fnu_ini_filtro (ref datawindow pd_dw, integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_puesto);//this.fpr_filtro_tito(pd_dw,pi_nro_centro)
//this.fnu_filtro_mesa_nuevo(pd_dw,pi_nro_cmd)
return 1
end function

public function string fnu_filtro_amb (integer pi_centro, integer pi_cmd, integer pi_puesto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_amb
// 
// Objetivo: Permite armar el filtro para un archivo en particular considerando 
//           ambito para ser usado en un where de una sentencia sql de una 
//				 datawindows.
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
//                      	
//
////////////////////////////////////////////////////////////////////////////////////////////////


//// Permite armar el filtro para un archivo en particular considerando el ambito
//// para ser usado en un where de una sentencia sql de una datawindow
String ls_filtro   //que es lo que voy a filtrar
//ls_filtro=" "
//if pi_centro<>fgci_todos() THEN
//	ls_filtro= "(brigada.nro_centro = " + string(pi_centro) + ")"
////	return ls_filtro
//end if
//if pi_cmd<>fgci_todos() THEN
//	ls_filtro=ls_filtro+" and (brigada.nro_cmd = " + string(pi_cmd)+ " )"
//end if
//if pi_puesto<>fgci_todos() THEN
//	ls_filtro=ls_filtro+"and (brigada.nro_mesa = " + string(pi_puesto) + ")"
//end if	
return ls_filtro
end function

public subroutine fnu_filtro_cmd_n ();//integer li_centro
//DataWindowChild dw_centro
//
//long aux
//string xx
//this.getchild("nro_cmd",dw_centro)
//dw_centro.retrieve()
////dw_centro.SetFilter("centro_resp >= 0")
////dw_centro.Filter()
//li_centro=Integer(this.gettext())
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
//	aux=dw_centro.Filter()
//	aux=dw_centro.Filteredcount()
//END IF
//
		



end subroutine

public subroutine fnu_filtrar_cmd (ref datawindow pd_dw, integer pi_nro_centro);//integer li_centro
//DataWindowChild dw_centro
//
//long aux
//string xx
//pd_dw.getchild("nro_cmd",dw_centro)
//dw_centro.retrieve()
////dw_centro.SetFilter("centro_resp >= 0")
////dw_centro.Filter()
//li_centro=pi_nro_centro
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
//	aux=dw_centro.Filter()
//	aux=dw_centro.Filteredcount()
//END IF
//
//		
//
//
//
end subroutine

public function integer f_insertar_fila ();return this.insertrow(1)
end function

public function integer fnu_creo_ddw_sin_s ();//this.GetChild('nro_centro',ddw_centro)
//ddw_centro.SetTransObject(SQLCA)
//ddw_centro.Retrieve()
//
//this.GetChild('nro_cmd',ddw_cmd)
//ddw_cmd.SetTransObject(SQLCA)
//ddw_cmd.Retrieve()
//
//
//this.GetChild('nro_mesa',ddw_mesa)
//ddw_mesa.SetTransObject(SQLCA)
//ddw_mesa.Retrieve()
return 1
end function

public subroutine fnu_filtro_cmd_out ();//integer li_centro
//DataWindowChild dw_centro
//
//long aux
//string xx
//this.getchild("nro_cmd",dw_centro)
//dw_centro.retrieve()
////dw_centro.SetFilter("centro_resp >= 0")
////dw_centro.Filter()
//li_centro=this.getitemnumber(1,"nro_centro")
////li_centro=Integer(this.gettext())
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
//	aux=dw_centro.Filter()
//	aux=dw_centro.Filteredcount()
//END IF
//
//		
//
//
//
end subroutine

public subroutine fnu_filtro_mesa_out ();//integer li_centro
//DataWindowChild dw_centro
//
//long aux
//string xx
//this.getchild("nro_mesa",dw_centro)
////dw_centro.SetFilter("")
////dw_centro.Filter()
//dw_centro.retrieve()
//li_centro=this.GetItemNumber(1,"nro_cmd")
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
//	aux=dw_centro.Filter()
//	aux=dw_centro.Filteredcount()
//END IF
//
//

end subroutine

event itemchanged;//
////s_columna=this.GetColumnName()
////int centro,cmd,li_sin_seleccionar
////
////SetNull(li_sin_seleccionar)
////CHOOSE CASE s_columna
////	CASE "nro_centro"
////		centro=this.GetItemNumber(1,"nro_centro")
////		this.Modify("nro_cmd.protect=0")
////		this.SETITEM(1,"nro_cmd",li_sin_seleccionar)
////		this.SETITEM(1,"nro_mesa",li_sin_seleccionar)
////		this.PostEvent("post_itemchange")
////
//////		centro=this.GetItemNumber(1,"nro_centro")
//////		messagebox("centro",centro)
////
////	CASE "nro_cmd"
////		this.PostEvent("post_itemchange")
////		this.Modify("nro_mesa.protect=0")
////		this.SETITEM(1,"nro_mesa",li_sin_seleccionar)
////		
//////		cmd=this.GetItemNumber(1,"nro_cmd")
//////		messagebox("cmd",cmd)
////				
////	CASE "nro_mesa"
//////		centro=this.GetItemNumber(1,"nro_mesa")
//////		messagebox("mesa",centro)
//
//////
//////		
////
////END CHOOSE
////
//
//
//this.postevent("post_itemchange")
//
//int li_todos
//int li_valor
////This.AcceptText()
//This.SetRedraw(False)
//li_todos=fgci_todos
//String ls_columna
//ls_columna=this.getcolumnname()
//CHOOSE CASE ls_columna
//	CASE "nro_centro"
//				li_valor=Integer(this.gettext())
//				This.SetItem(1,"nro_cmd",li_todos)
//				This.SetItem(1,"nro_mesa",li_todos)
//				This.fnu_des_puesto()
//				If li_valor=li_todos THEN
//					This.fnu_des_cmd()
//				 	This.fnu_des_puesto()
//				ELSE
//					This.fnu_filtro_cmd_n()
//					This.fnu_habi_cmd()
//				END IF
//	 CASE "nro_cmd"
//			li_valor=Integer(this.gettext())
//			This.SetItem(1,"nro_mesa",li_todos)
//			If li_valor=li_todos THEN
//				This.fnu_des_puesto()
//			ELSE
//				This.fnu_filtro_mesa_n()
//				This.fnu_habi_puesto()
//			END IF
//		
//END CHOOSE
//This.SetRedraw(true)
//
//
//
end event

on u_cen_2002_pr_form_centro_cmd_mesa_oc.create
end on

on u_cen_2002_pr_form_centro_cmd_mesa_oc.destroy
end on


HA$PBExportHeader$u_cen_2001_pr_form_centro_cmd_mesa.sru
forward
global type u_cen_2001_pr_form_centro_cmd_mesa from datawindow
end type
end forward

global type u_cen_2001_pr_form_centro_cmd_mesa from datawindow
integer width = 1015
integer height = 236
string dataobject = "d_cen_2001_pr_form_centro_cmd_mesa_2"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationalways!
borderstyle borderstyle = styleshadowbox!
event post_itemchange pbm_custom20
event ue_post_itemchanged ( )
end type
global u_cen_2001_pr_form_centro_cmd_mesa u_cen_2001_pr_form_centro_cmd_mesa

type variables
String s_columna
int centro
DataWindowChild ddw_centro_2
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

integer ii_centro_entrada=0
integer ii_cmd_entrada=0

int ii_criterio

int ii_vigente = 1
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
public subroutine fnu_filtro_cmd_sin_todos (ref datawindow pd_dw, integer pi_nro_centro)
public subroutine fnu_filtro_mesa_sin_todos (ref datawindow pd_dw, integer pi_nro_cmd)
public function string fnu_filtro_ambito_2 (integer pi_centro, integer pi_cmd, integer pi_puesto, integer pi_mante)
public function integer f_resetear_filtros (ref datawindow pd_dw)
public function integer fnu_cargo_drop ()
public function integer fnu_cargo_drop_mesa ()
public function integer fnu_cargo_drop_cmd ()
public function integer fnu_cargo_drop_centro ()
public function string fnu_filtro_ambito_descargos (integer pi_centro, integer pi_cmd, integer pi_puesto)
public subroutine fnu_des_centro ()
public subroutine fnu_habi_centro ()
public subroutine fnu_habilitar_campos ()
public function string fnu_filtro_ambito_reenganche (integer pi_centro, integer pi_cmd, integer pi_puesto, integer pi_mante)
public subroutine of_acceso_por_ventana (string ps_nombre_ventana, ref string ps_acceso)
end prototypes

event ue_post_itemchanged();this.accepttext()
	
this.GetChild('nro_centro',ddw_centro_2)
ddw_centro_2.SetTransObject(SQLCA)
ddw_centro_2.Retrieve(ii_vigente)

this.GetChild('nro_cmd',ddw_cmd)
ddw_cmd.SetTransObject(SQLCA)
ddw_cmd.Retrieve(ii_vigente)

this.GetChild('nro_mesa',ddw_mesa)
ddw_mesa.SetTransObject(SQLCA)
ddw_mesa.Retrieve(ii_vigente)

w_shared.ds_centro_shared.retrieve(ii_vigente)
w_shared.ds_cmd_shared.retrieve(ii_vigente)
w_shared.ds_mesa_shared.retrieve(ii_vigente,ii_vigente)
end event

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
fnu_cargo_drop_mesa()
	ddw_mesa.SetFilter("")
	ddw_mesa.Filter()
	li_cmd=this.GetItemNumber(1,"nro_cmd")
	
	IF li_cmd<>0 AND Not ISNULL(li_cmd) THEN
		ddw_mesa.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_cmd)+" OR sgd_relacion_centro_centro_resp = 0")
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
//this.fnu_cargo_drop()
fnu_cargo_drop_centro()
fnu_cargo_drop_cmd()
fnu_cargo_drop_mesa()
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
fnu_cargo_drop_cmd()
ddw_cmd.SetFilter("")
ddw_cmd.Filter()
//li_centro=this.GetItemNumber(1,"nro_centro")
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	ddw_cmd.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
//	aux=ddw_cmd.Filter()
	aux=ddw_cmd.Filteredcount()
//END IF

		
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

integer i_nro_centro

	ddw_cmd.SetFilter("nro_centro <>99 ")
	ddw_cmd.Filter()
		
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
 
this.getchild("nro_mesa",ddw_centro_2)
fnu_cargo_drop_mesa()
ddw_centro_2.SetFilter("")
ddw_centro_2.Filter()

IF ii_criterio=0 or ii_criterio=3 or ii_criterio=6  then 

	This.SetItem(1,"nro_centro",pi_nro_centro)
	This.SetItem(1,"nro_cmd",pi_nro_cmd)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)
	//ddw_centro.SetFilter("(sgd_relacion_centro_centro_resp = " + string(pi_nro_centro) + " AND sgd_relacion_centro_tip_centro = 1) OR  sgd_relacion_centro_centro_resp = 0")
	//SMB 18/10/2007 Cambio este filtro para recuperar todos los sectores, no estaba bien.
	ddw_centro_2.SetFilter("sgd_relacion_centro_tip_centro = 1 OR  sgd_relacion_centro_centro_resp = 0")
	ddw_centro_2.Filter()
	if pi_nro_centro = fgci_todos and pi_nro_cmd = fgci_todos and pi_nro_mesa = fgci_todos then
		//fnu_des_puesto()  SMB 25/09/2007 Al cargar la ventana el campo sector esta habilitado
		fnu_habi_puesto()
	end if
elseif ii_criterio=1 THEN //or ii_criterio = 4 then
	This.SetItem(1,"nro_centro",pi_nro_centro)
	// Se traen todos los sectores de la zona (LFE)
	ddw_centro_2.SetFilter("(sgd_relacion_centro_centro_resp = " + string(pi_nro_centro) + " AND sgd_relacion_centro_tip_centro = 1) OR  sgd_relacion_centro_centro_resp = 0")
	ddw_centro_2.Filter()

	This.SetItem(1,"nro_cmd",pi_nro_cmd)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)
	
elseif ii_criterio=2 THEN //or ii_criterio = 5 then

	This.SetItem(1,"nro_centro",pi_nro_centro)
	This.SetItem(1,"nro_cmd",pi_nro_cmd)
	// Se traen todos los sectores del cmd (LFE)
	ddw_centro_2.SetFilter("(sgd_relacion_centro_centro_resp = " + string(pi_nro_cmd) + " AND sgd_relacion_centro_tip_centro = 2) OR  sgd_relacion_centro_centro_resp = 0")
	ddw_centro_2.Filter()
	This.SetItem(1,"nro_mesa",pi_nro_mesa)		

elseif ii_criterio = 4 then
	// Aqu$$HEX2$$ed002000$$ENDHEX$$se traen todos los sectores del cmd, ya que este es el que no se modifica (LFE)
	This.SetItem(1,"nro_centro",pi_nro_centro)
	ddw_centro_2.SetFilter("(sgd_relacion_centro_centro_resp = " + string(pi_nro_cmd) + " AND sgd_relacion_centro_tip_centro = 2) OR  sgd_relacion_centro_centro_resp = 0")
	ddw_centro_2.Filter()

	This.SetItem(1,"nro_cmd",pi_nro_cmd)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)

elseif ii_criterio = 5 then
	// Aqu$$HEX2$$ed002000$$ENDHEX$$se traen todos los sectores de la zona, ya que esta es la que no se modifica (LFE)
	This.SetItem(1,"nro_centro",pi_nro_centro)
	ddw_centro_2.SetFilter("(sgd_relacion_centro_centro_resp = " + string(pi_nro_centro) + " AND sgd_relacion_centro_tip_centro = 1) OR  sgd_relacion_centro_centro_resp = 0")
	ddw_centro_2.Filter()

	This.SetItem(1,"nro_cmd",pi_nro_cmd)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)

end if	


	IF pi_proteger =1 THEN
		This.modify("nro_centro.protect=1")
		This.modify("nro_cmd.protect=1")		
		This.modify("nro_mesa.protect=1")
		This.modify("nro_centro.background.color="+string(gs_gris))
		This.modify("nro_cmd.background.color="+string(gs_gris))
		This.modify("nro_mesa.background.color="+string(gs_gris))
//		This.modify("nro_centro.protect=0")
//		This.modify("nro_cmd.protect=0")		
//		This.modify("nro_mesa.protect=0")
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

IF ii_criterio=0 or ii_criterio=6 then 

	This.SetItem(1,"nro_centro",pi_nro_centro)
	This.SetItem(1,"nro_cmd",pi_nro_cmd)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)

elseif ii_criterio=1 or ii_criterio = 4 then
	
	This.SetItem(1,"nro_centro",pi_nro_centro)
	This.SetItem(1,"nro_cmd",0)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)

elseif ii_criterio=2 or ii_criterio = 5 then

	This.SetItem(1,"nro_centro",0)
	This.SetItem(1,"nro_cmd",pi_nro_cmd)		
	This.SetItem(1,"nro_mesa",pi_nro_mesa)		

end if	

//IF pi_proteger = 0 THEN
//	This.modify("nro_centro.protect=0")
//	This.modify("nro_centro.Background.Color=" + string(ll_color_blanco))
//	This.modify("nro_cmd.protect=0")		
//	This.modify("nro_cmd.Background.Color=" + string(ll_color_blanco))
//	This.modify("nro_mesa.protect=0")
//	This.modify("nro_mesa.Background.Color=" + string(ll_color_blanco))
//ELSE
//	This.modify("nro_centro.protect=1")
//	This.modify("nro_centro.Background.Color=" + string(ll_color_gris))
//	This.modify("nro_centro.Color=" + string(ll_color_azul))
//	This.modify("nro_cmd.protect=1")		
//	This.modify("nro_cmd.Background.Color=" + string(ll_color_gris))
//	This.modify("nro_cmd.Color=" + string(ll_color_azul))
//	This.modify("nro_mesa.protect=1")
//	This.modify("nro_mesa.Background.Color=" + string(ll_color_gris))
//	This.modify("nro_mesa.Color=" + string(ll_color_azul))
//END IF

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
ls_filtro=" "
if pi_centro <> fgci_todos THEN
	ls_filtro= "(gi_avisos.nro_centro = " + string(pi_centro) + ")"
//	return ls_filtro
end if
if pi_cmd <> fgci_todos THEN
	if pi_centro <> fgci_todos then
		ls_filtro=ls_filtro+" and (gi_avisos.nro_cmd = " + string(pi_cmd)+ " )"
	else
		ls_filtro=ls_filtro+" (gi_avisos.nro_cmd = " + string(pi_cmd)+ " )"
	end if
end if
if pi_puesto<>fgci_todos THEN
	ls_filtro=ls_filtro+"and (gi_avisos.nro_mesa = " + string(pi_puesto) + ")"
end if	
return ls_filtro
// Se evalua si viene informacion en centro,cmd,puesto
//	if  pi_centro <> 0 and pi_cmd <> 0 and pi_puesto <> 0  and pi_puesto <> fgci_sin_seleccionar() then
//	    
//		return "(gi_avisos.nro_centro = " + string(pi_centro) + ") and (gi_avisos.nro_cmd = " + string(pi_cmd)+ " ) and (gi_avisos.nro_mesa = " + string(pi_puesto) + ")"
//	end if
//
//	if pi_centro <> 0 and pi_cmd <> 0 and pi_cmd <> fgci_sin_seleccionar() and pi_puesto = fgci_sin_seleccionar() then
//		return "(gi_avisos.nro_centro = " + string(pi_centro) + ") and (gi_avisos.nro_cmd = " + string(pi_cmd)+ " )" 
//	end if
//
//
//	if  pi_centro <> 0 and pi_centro <> fgci_sin_seleccionar() and pi_cmd =  fgci_sin_seleccionar() and pi_puesto = fgci_sin_seleccionar() then
//		return "(gi_avisos.nro_centro = " + string(pi_centro) + ")" 
//	end if
//
//	


	
////// Se evalua si viene informmacion solo en centro y cmd
////
//
//	if  pi_centro <> 0 and pi_cmd <> 0 and pi_puesto = gi_todos then
//		return "(gi_avisos.nro_centro = " + string(pi_centro) + ") and (gi_avisos.nro_cmd = " + string(pi_cmd)+ " ) and (gi_avisos.nro_mesa = " + string(pi_puesto) + ")"
//	end if
//	if  this.getitemnumber(1,"nro_centro") <> 0 and this.getitemnumber(1,"nro_cmd") <> 0 and this.getitemnumber(1,"nro_mesa") = gi_todos then
//		return "(gi_avisos.nro_centro = :a_nro_centro) and (gi_avisos.nro_cmd = :a_nro_cmd)"
//	end if
//
////// Se evalua si viene informacion solo en centro
////
//	if   this.getitemnumber(1,"nro_centro") <> 0 and this.getitemnumber(1,"nro_cmd") = gi_todos and this.getitemnumber(1,"nro_mesa") = gi_todos then
//		return "(gi_avisos.nro_centro = :a_nro_centro)"
//	end if

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
	this.modify("nro_centro.background.color=" + gs_blanco +&
			 "~t nro_cmd.background.color=" + gs_blanco +&
			 "~t nro_mesa.background.color=" + gs_blanco)
	this.SetTabOrder("nro_centro",10)
	this.SetTabOrder("nro_cmd",20)
	this.SetTabOrder("nro_mesa",40)
ELSE
	this.modify("nro_centro.background.color=" + gs_gris +&
			 "~t nro_cmd.background.color=" + gs_gris +&
			 "~t nro_mesa.background.color=" + gs_gris)
	this.SetTabOrder("nro_centro",0)
	this.SetTabOrder("nro_cmd",0)
	this.SetTabOrder("nro_mesa",0)
END IF


RETURN 1
end function

public subroutine fpr_hab_centro (ref datawindow pd_dw);// solo dejo habilitar en el caso de que el perfil sea zona

if ii_criterio=1  or ii_criterio = 6 then
	
	pd_dw.modify("nro_centro.protect=0")
	pd_dw.modify("nro_centro.background.color="+gs_blanco)

end if
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
pd_dw.modify("nro_centro.background.color="+gs_gris)



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
pd_dw.modify("nro_cmd.background.color="+gs_gris)


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
pd_dw.modify("nro_mesa.background.color="+gs_gris)


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

// dejo habilitar siempre

if ii_criterio <> 0 then
	
	pd_dw.modify("nro_mesa.protect=1")
	pd_dw.modify("nro_mesa.background.color="+gs_blanco)

end if
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

// solo dejo habilitar en el caso de que el perfil sea cmd

if ii_criterio=2 or ii_criterio = 6 then

	pd_dw.modify("nro_cmd.protect=0")
	pd_dw.modify("nro_cmd.background.color="+gs_blanco)

end if
end subroutine

public subroutine fpr_hab_cmd (ref datawindow pd_dw);// solo dejo habilitar en el caso de que el perfil sea cmd

	
if ii_criterio=2  or ii_criterio = 6 then
	pd_dw.modify("nro_cmd.protect=0")
	pd_dw.modify("nro_cmd.background.color="+gs_blanco)
END IF

end subroutine

public subroutine fpr_hab_puesto (ref datawindow pd_dw);// solo dejo habilitar en el caso de que el perfil sea zona

if ii_criterio <> 0  or ii_criterio = 6 then

	pd_dw.modify("nro_mesa.protect=0")
	pd_dw.modify("nro_mesa.background.color="+gs_blanco)

END IF
end subroutine

public subroutine fpr_deshab_centro (ref datawindow pd_dw);pd_dw.modify("nro_centro.protect=1")
pd_dw.modify("nro_centro.background.color="+gs_gris)


end subroutine

public subroutine fpr_deshab_cmd (ref datawindow pd_dw);pd_dw.modify("nro_cmd.protect=1")
pd_dw.modify("nro_cmd.background.color="+gs_gris)


end subroutine

public subroutine fpr_deshab_puesto (ref datawindow pd_dw);pd_dw.modify("nro_mesa.protect=1")
pd_dw.modify("nro_mesa.background.color="+gs_gris)


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
//dw_centro.retrieve()
li_centro=pi_nro_centro
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	dw_centro.SetFilter("")
	aux=dw_centro.Filter()
	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF

		
Return 1


end function

public function integer fnu_filtro_mesa_nuevo (ref datawindow pd_dw, integer pi_nro_cmd);integer li_centro
DataWindowChild dw_centro

long aux
string xx
pd_dw.getchild("nro_mesa",dw_centro)
dw_centro.SetFilter("")
dw_centro.Filter()
//dw_centro.retrieve()
//li_centro=pd_dw.GetItemNumber(1,"nro_cmd")
li_centro=pi_nro_cmd
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	
	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF
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


this.modify("nro_cmd.protect=0")
this.modify("nro_cmd.background.color="+gs_blanco)


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


this.modify("nro_mesa.protect=0")
this.modify("nro_mesa.background.color="+gs_blanco)


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

// solo dejo habilitar en el caso de que el perfil sea cmd

if ii_criterio=2  or ii_criterio = 6 then
	
	this.modify("nro_cmd.protect=0")
	this.modify("nro_cmd.background.color="+gs_blanco)

end if

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

// Dejo habilitar siempre

if ii_criterio <> 0 then
	
	this.modify("nro_mesa.protect=0")
	this.modify("nro_mesa.background.color="+gs_blanco)

end if
end subroutine

public subroutine fnu_filtro_mesa_n ();integer li_centro
//DataWindowChild dw_centro
string ls_tipo_centro
string ls_tipo_centro2
long aux
string xx

this.getchild("nro_mesa",ddw_centro_2)
fnu_cargo_drop_mesa()
//
//dw_centro.retrieve()
li_centro=Integer(this.gettext())
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN SMB 17/10/2007 ahora tambien se filtra si es todos 'li_centro=0'
IF NOT IsNull(li_centro) THEN	
	ddw_centro_2.SetFilter("")
	aux=ddw_centro_2.Filter()
	// Hay que filtrar por el centro responsable, por lo que hay que capturar el 
	// centro responsable por el que filtramos: puede ser un centro o un cmd (LFE)
	IF This.getcolumnname() = 'nro_cmd' THEN
		ls_tipo_centro = " AND sgd_relacion_centro_tip_centro = 2 "
		ls_tipo_centro2 = " sgd_relacion_centro_tip_centro = 2 "		
	ELSEIF This.getcolumnname() = 'nro_centro'  THEN
		ls_tipo_centro = " AND sgd_relacion_centro_tip_centro = 1 "
		ls_tipo_centro2 = " sgd_relacion_centro_tip_centro = 1 "		
	ELSE
		ls_tipo_centro = " "
		ls_tipo_centro2 = " "		
	END IF
	IF li_centro <> 0 THEN //SMB 17/10/2007 el if es nuevo
	ddw_centro_2.SetFilter("(sgd_relacion_centro_centro_resp = " + string(li_centro) + ls_tipo_centro +") OR  sgd_relacion_centro_centro_resp = 0") //SMB 17/10/2007 esto es lo que habia antes
	ELSE // smb 17/10/2007 este parte del if es para mostrar todos los sectores
	ddw_centro_2.SetFilter(ls_tipo_centro2 +" OR  sgd_relacion_centro_centro_resp = 0") 
	END IF
	aux=ddw_centro_2.Filter()
	aux=ddw_centro_2.Filteredcount()	
END IF



end subroutine

public function integer fnu_ini_filtro (ref datawindow pd_dw, integer pi_nro_centro, integer pi_nro_cmd, integer pi_nro_puesto);this.fpr_filtro_tito(pd_dw,pi_nro_centro)
this.fnu_filtro_mesa_nuevo(pd_dw,pi_nro_cmd)
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


// Permite armar el filtro para un archivo en particular considerando el ambito
// para ser usado en un where de una sentencia sql de una datawindow
String ls_filtro   //que es lo que voy a filtrar
ls_filtro=" "
if pi_centro<>fgci_todos THEN
	ls_filtro= "(gi_brigada.nro_centro = " + string(pi_centro) + ")"
//	return ls_filtro
end if
if pi_cmd<>fgci_todos THEN
	if pi_centro<>fgci_todos then
		ls_filtro=ls_filtro+" and (gi_brigada.nro_cmd = " + string(pi_cmd)+ " )"
	else
		ls_filtro=ls_filtro+" (gi_brigada.nro_cmd = " + string(pi_cmd)+ " )"
	end if
end if
if pi_puesto<>fgci_todos THEN
	ls_filtro=ls_filtro+"and (gi_brigada.nro_mesa = " + string(pi_puesto) + ")"
end if	
return ls_filtro
end function

public subroutine fnu_filtro_cmd_n ();integer li_centro
//DataWindowChild dw_centro

long aux
string xx
fnu_cargo_drop_cmd()
this.getchild("nro_cmd",ddw_centro_2)
//
//dw_centro.retrieve()

//
//li_centro=Integer(this.gettext())
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	ddw_centro_2.SetFilter("")
	aux=ddw_centro_2.Filter()
//	ddw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
//	aux=ddw_centro.Filter()
	aux=ddw_centro_2.Filteredcount()
//END IF

		



end subroutine

public subroutine fnu_filtrar_cmd (ref datawindow pd_dw, integer pi_nro_centro);integer li_centro
DataWindowChild dw_centro

long aux
string xx
pd_dw.getchild("nro_cmd",dw_centro)
//dw_centro.retrieve()
dw_centro.SetFilter("")
dw_centro.Filter()
li_centro=pi_nro_centro
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
//	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
//END IF
//
		



end subroutine

public function integer f_insertar_fila ();return this.insertrow(1)
end function

public function integer fnu_creo_ddw_sin_s ();this.GetChild('nro_centro',ddw_centro_2)
ddw_centro_2.SetTransObject(SQLCA)
ddw_centro_2.Retrieve()

this.GetChild('nro_cmd',ddw_cmd)
ddw_cmd.SetTransObject(SQLCA)
ddw_cmd.Retrieve()

this.GetChild('nro_mesa',ddw_mesa)
ddw_mesa.SetTransObject(SQLCA)
ddw_mesa.Retrieve()

return 1
end function

public subroutine fnu_filtro_cmd_out ();integer li_centro
DataWindowChild dw_centro

long aux
string xx
this.getchild("nro_cmd",dw_centro)
//dw_centro.retrieve()
fnu_cargo_drop_cmd()
dw_centro.SetFilter("")
dw_centro.Filter()
//li_centro=this.getitemnumber(1,"nro_centro")
////li_centro=Integer(this.gettext())
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
//	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
//END IF

		



end subroutine

public subroutine fnu_filtro_mesa_out ();//integer li_centro
//DataWindowChild dw_centro
//
//long aux
//string xx
//this.getchild("nro_mesa",dw_centro)
////dw_centro.SetFilter("")
////dw_centro.Filter()
////dw_centro.retrieve()
//fnu_cargo_drop_mesa()
//li_centro=this.GetItemNumber(1,"nro_cmd")
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	
//	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
//	aux=dw_centro.Filter()
//	aux=dw_centro.Filteredcount()
//END IF

integer li_centro
DataWindowChild dw_centro

long aux
string xx
this.GetChild("nro_mesa",dw_centro)
fnu_cargo_drop_mesa()
dw_centro.SetFilter("")
dw_centro.Filter()
//dw_centro.retrieve()
li_centro=this.GetItemNumber(1,"nro_cmd")
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF




end subroutine

public subroutine fnu_filtro_cmd_sin_todos (ref datawindow pd_dw, integer pi_nro_centro);integer li_centro
DataWindowChild dw_centro

long aux
string xx
pd_dw.getchild("nro_cmd",dw_centro)
dw_centro.retrieve()
//dw_centro.SetFilter("centro_resp >= 0")
//dw_centro.Filter()
li_centro=pi_nro_centro
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	
	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro))
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF

		



end subroutine

public subroutine fnu_filtro_mesa_sin_todos (ref datawindow pd_dw, integer pi_nro_cmd);integer li_centro
DataWindowChild dw_centro

long aux
string xx
pd_dw.getchild("nro_mesa",dw_centro)
dw_centro.SetFilter("")
dw_centro.Filter()

//dw_centro.retrieve()

//li_centro=pd_dw.GetItemNumber(1,"nro_cmd")
li_centro=pi_nro_cmd
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	
	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro))
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF



end subroutine

public function string fnu_filtro_ambito_2 (integer pi_centro, integer pi_cmd, integer pi_puesto, integer pi_mante);////////////////////////////////////////////////////////////////////////////////////////////////
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

li_todos=fgci_todos

// Se evalua si viene informacion en centro,cmd,puesto
//segun el tipo de usuarios
		//perfil de mantenimiento
IF pi_mante = 1  THEN

		IF  pi_centro <> li_todos AND  pi_cmd <> li_todos AND  pi_puesto <> li_todos  THEN
			RETURN "(SGD_INCIDENCIA.centro_mant = " + string(pi_centro) + ") and (SGD_INCIDENCIA.cmd_mant = " + string(pi_cmd)+ " ) and (SGD_INCIDENCIA.mesa_mant = " + string(pi_puesto) + ")"
		END IF
		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND  pi_puesto = li_todos OR IsNull(pi_puesto) THEN
			RETURN "(SGD_INCIDENCIA.centro_mant = " + string(pi_centro) + ") and (SGD_INCIDENCIA.cmd_mant = " + string(pi_cmd)+ " ) " 
		END IF
		IF pi_centro <> li_todos AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_INCIDENCIA.centro_mant = " + string(pi_centro) + ")" 
		END IF
		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
			RETURN "(SGD_INCIDENCIA.cmd_mant = " + string(pi_cmd)+ " ) and (SGD_INCIDENCIA.mesa_mant = " + string(pi_puesto) + ")"
		END IF
		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_INCIDENCIA.cmd_mant = " + string(pi_cmd) + ")"
		END IF
		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND pi_puesto <> li_todos THEN
			RETURN "(SGD_INCIDENCIA.mesa_mant = " + string(pi_puesto) + ")"
		END IF		

ELSE
		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
			RETURN "(SGD_INCIDENCIA.nro_centro = " + string(pi_centro) + ") and (SGD_INCIDENCIA.nro_cmd = " + string(pi_cmd)+ " ) and (SGD_INCIDENCIA.nro_mesa = " + string(pi_puesto) + ")"
		END IF
	
		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_INCIDENCIA.nro_centro = " + string(pi_centro) + ") and (SGD_INCIDENCIA.nro_cmd = " + string(pi_cmd)+ " ) " 
		END IF

		IF  pi_centro <> li_todos AND (pi_cmd =  li_todos OR IsNull(pi_cmd)) AND (pi_puesto = li_todos OR IsNull(pi_puesto))THEN
			RETURN "(SGD_INCIDENCIA.nro_centro = " + string(pi_centro) + ")" 
		END IF

		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
			RETURN "(SGD_INCIDENCIA.nro_cmd = " + string(pi_cmd)+ " ) and (SGD_INCIDENCIA.nro_mesa = " + string(pi_puesto) + ")"
		END IF

		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_INCIDENCIA.nro_cmd = " + string(pi_cmd)+ ")"
		END IF

		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND pi_puesto <> li_todos THEN
			RETURN "(SGD_INCIDENCIA.nro_mesa = " + string(pi_puesto) + ")"
		END IF		


END IF
RETURN ""
end function

public function integer f_resetear_filtros (ref datawindow pd_dw);// Quita los filtros de cmd y de mesa.

ddw_cmd.SetFilter("")
ddw_cmd.Filter()

ddw_mesa.SetFilter("")
ddw_mesa.Filter()

return 1
end function

public function integer fnu_cargo_drop ();////////////////////////////////////////////////////////////////////////////////////////////////
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
fnu_cargo_drop_centro()
fnu_cargo_drop_cmd()
fnu_cargo_drop_mesa()
RETURN 1
end function

public function integer fnu_cargo_drop_mesa ();////////////////////////////////////////////////////////////////////////////////////////////////
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
int ii

int l_cantidad
int i_fila
int l_cantidad_shared
this.setredraw(false)
l_cantidad_shared=ddw_mesa_shared.rowcount() 
this.GetChild("nro_mesa",ddw_mesa)
ddw_mesa.reset()
for l_cantidad=1 to l_cantidad_shared
		i_fila=ddw_mesa.insertrow(0)
		ddw_mesa.setitem(i_fila,"sgd_centro_nro_centro",ddw_mesa_shared.getitemnumber(l_cantidad,"sgd_centro_nro_centro"))
		ddw_mesa.setitem(i_fila,"nombre",ddw_mesa_shared.getitemstring(l_cantidad,"nombre"))
		ddw_mesa.setitem(i_fila,"sgd_relacion_centro_centro_resp",ddw_mesa_shared.getitemnumber(l_cantidad,"sgd_relacion_centro_centro_resp"))
		ddw_mesa.setitem(i_fila,"sgd_relacion_centro_tip_centro",ddw_mesa_shared.getitemnumber(l_cantidad,"sgd_relacion_centro_tip_centro"))
next
this.setredraw(true)
RETURN 1
end function

public function integer fnu_cargo_drop_cmd ();////////////////////////////////////////////////////////////////////////////////////////////////
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
int ii

int l_cantidad
int i_fila

int i_cantidad_shared
i_cantidad_shared=ddw_cmd_shared.rowcount()
this.GetChild("nro_cmd",ddw_cmd)
ddw_cmd.reset()
this.setredraw(false)
for l_cantidad=1 to i_cantidad_shared
		i_fila=ddw_cmd.insertrow(0)
		ddw_cmd.setitem(i_fila,"sgd_centro_nro_centro",ddw_cmd_shared.getitemnumber(l_cantidad,"sgd_centro_nro_centro"))
		ddw_cmd.setitem(i_fila,"sgd_centro_nom_centro",ddw_cmd_shared.getitemstring(l_cantidad,"sgd_centro_nom_centro"))
		ddw_cmd.setitem(i_fila,"sgd_relacion_centro_centro_resp",ddw_cmd_shared.getitemnumber(l_cantidad,"sgd_relacion_centro_centro_resp"))
    
next
this.setredraw(true)

RETURN 1
end function

public function integer fnu_cargo_drop_centro ();////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_crea_dddw
// 
// Objetivo: crea las drop down datawindows internas del user object.
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
////////////////////////////////////////////////////////////////////////////////////////////////

int ii

int l_cantidad
int i_fila
int l_cantidad_shared

l_cantidad_shared=ddw_centro_shared.rowcount()
this.setredraw(false)
this.GetChild("nro_centro",ddw_centro_2)
ddw_centro_2.reset()	
for l_cantidad=1 to l_cantidad_shared
		i_fila=ddw_centro_2.insertrow(0)
		ddw_centro_2.setitem(i_fila,"sgd_centro_nro_centro",ddw_centro_shared.getitemnumber(l_cantidad,"sgd_centro_nro_centro"))
		ddw_centro_2.setitem(i_fila,"nombre",ddw_centro_shared.getitemstring(l_cantidad,"nombre"))
	    ddw_centro_2.setitem(i_fila,"sgd_relacion_centro_centro_resp",ddw_centro_shared.getitemnumber(l_cantidad,"sgd_relacion_centro_centro_resp"))
next
this.setredraw(true)
RETURN 1
end function

public function string fnu_filtro_ambito_descargos (integer pi_centro, integer pi_cmd, integer pi_puesto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_ambito_descargos
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
ls_filtro=" "
IF pi_centro<>fgci_todos THEN
	ls_filtro= "(~"SGD_INSTALACION~".~"NRO_CENTRO~" = " + string(pi_centro) + ")"
ELSE
	ls_filtro= "(~"SGD_INSTALACION~".~"NRO_CENTRO~" > 0 )"
END IF
IF pi_cmd<>fgci_todos THEN
	ls_filtro=ls_filtro+" and (~"SGD_INSTALACION~".~"NRO_CMD~" = " + string(pi_cmd)+ " )"
ELSE
	ls_filtro=ls_filtro+" and (~"SGD_INSTALACION~".~"NRO_CMD~" > 0 )"	
END IF
IF pi_puesto<>fgci_todos THEN
	ls_filtro=ls_filtro+"and (~"SGD_INSTALACION~".~"NRO_MESA~" = " + string(pi_puesto) + ")"
ELSE
	ls_filtro=ls_filtro+"and (~"SGD_INSTALACION~".~"NRO_MESA~" > 0 )"
END IF	
return ls_filtro

end function

public subroutine fnu_des_centro ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_centro
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero centro
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


this.modify("nro_centro.protect=0")
this.modify("nro_centro.background.color="+gs_blanco)


end subroutine

public subroutine fnu_habi_centro ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_habi_centro
//
// Objetivo: Habilito el centro
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

// solo dejo habilitar en el caso de que el perfil sea zona

if ii_criterio=1  or ii_criterio = 6 then

	this.modify("nro_centro.protect=1")
	this.modify("nro_centro.background.color="+gs_blanco)

end if
end subroutine

public subroutine fnu_habilitar_campos ();// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_habilitar_campos
// 
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n habilita los campos del filtro para los que el usuario tenga 
// 			 permiso de	acceso, seg$$HEX1$$fa00$$ENDHEX$$n su perfil. Se debe de usar cuando se ha modificado
//				 el acceso a los campos y se desea reestablecer el acceso seg$$HEX1$$fa00$$ENDHEX$$n el perfil
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
//	17/05/2000		LFE			Versi$$HEX1$$f300$$ENDHEX$$n Original
////////////////////////////////////////////////////////////////////////////////////////////////

// Se habilitan todos los campos
fnu_habi_centro()
fnu_habi_cmd()
fnu_habi_puesto()

// Se deshabilitan ahora los campos para los que el usuario no tiene acceso seg$$HEX2$$fa002000$$ENDHEX$$su perfil
CHOOSE CASE  II_CRITERIO

	CASE 1
		FNU_DES_CMD(THIS)
	CASE 2
		FNU_DES_CENTRO(THIS)
	CASE 4
		FNU_DES_CENTRO(THIS)
		FNU_DES_CMD(THIS)
	CASE 5
		FNU_DES_CENTRO(THIS)
		FNU_DES_CMD(THIS)
	CASE 0,3
		FNU_DES_CENTRO(THIS)
		FNU_DES_CMD(THIS)
		FNU_DES_PUESTO(THIS)
		
END CHOOSE
end subroutine

public function string fnu_filtro_ambito_reenganche (integer pi_centro, integer pi_cmd, integer pi_puesto, integer pi_mante);////////////////////////////////////////////////////////////////////////////////////////////////
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

li_todos=fgci_todos

// Se evalua si viene informacion en centro,cmd,puesto
//segun el tipo de usuarios
		//perfil de mantenimiento
IF pi_mante = 1  THEN

		IF  pi_centro <> li_todos AND  pi_cmd <> li_todos AND  pi_puesto <> li_todos  THEN
			RETURN "(SGD_REENGANCHES.zona_mant = " + string(pi_centro) + ") and (SGD_REENGANCHES.cmd_mant = " + string(pi_cmd)+ " ) and (SGD_REENGANCHES.sector_mant = " + string(pi_puesto) + ")"
		END IF
		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND  pi_puesto = li_todos OR IsNull(pi_puesto) THEN
			RETURN "(SGD_REENGANCHES.zona_mant = " + string(pi_centro) + ") and (SGD_REENGANCHES.cmd_mant = " + string(pi_cmd)+ " ) " 
		END IF
		IF pi_centro <> li_todos AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_REENGANCHES.zona_mant = " + string(pi_centro) + ")" 
		END IF
		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
			RETURN "(SGD_REENGANCHES.cmd_mant = " + string(pi_cmd)+ " ) and (SGD_REENGANCHES.sector_mant = " + string(pi_puesto) + ")"
		END IF
		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_REENGANCHES.cmd_mant = " + string(pi_cmd) + ")"
		END IF
		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND pi_puesto <> li_todos THEN
			RETURN "(SGD_REENGANCHES.sector_mant = " + string(pi_puesto) + ")"
		END IF		

ELSE
		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
			RETURN "(SGD_REENGANCHES.nro_zona = " + string(pi_centro) + ") and (SGD_REENGANCHES.nro_cmd = " + string(pi_cmd)+ " ) and (SGD_REENGANCHES.nro_sector = " + string(pi_puesto) + ")"
		END IF
	
		IF  pi_centro <> li_todos AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_REENGANCHES.nro_zona = " + string(pi_centro) + ") and (SGD_REENGANCHES.nro_cmd = " + string(pi_cmd)+ " ) " 
		END IF

		IF  pi_centro <> li_todos AND (pi_cmd =  li_todos OR IsNull(pi_cmd)) AND (pi_puesto = li_todos OR IsNull(pi_puesto))THEN
			RETURN "(SGD_REENGANCHES.nro_zona = " + string(pi_centro) + ")" 
		END IF

		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND pi_puesto <> li_todos THEN
			RETURN "(SGD_REENGANCHES.nro_cmd = " + string(pi_cmd)+ " ) and (SGD_REENGANCHES.nro_sector = " + string(pi_puesto) + ")"
		END IF

		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND pi_cmd <> li_todos AND (pi_puesto = li_todos OR IsNull(pi_puesto)) THEN
			RETURN "(SGD_REENGANCHES.nro_cmd = " + string(pi_cmd)+ ")"
		END IF

		IF (pi_centro = li_todos OR IsNull(pi_centro)) AND (pi_cmd = li_todos OR IsNull(pi_cmd)) AND pi_puesto <> li_todos THEN
			RETURN "(SGD_REENGANCHES.nro_sector = " + string(pi_puesto) + ")"
		END IF		


END IF
RETURN ""
end function

public subroutine of_acceso_por_ventana (string ps_nombre_ventana, ref string ps_acceso);// Devuelve el acceso de una ventana que contiene el objeto de ambito

CHOOSE CASE ps_nombre_ventana
	CASE "w_2270_lista_brigadas_centro", "w_2271_mante_brigadas_new"
		ps_acceso = "BRI_ACCESO"
	CASE "w_6201_asignacion_de_brigada"
		ps_acceso = "AMBITO"
	CASE "w_6203_mantenimiento_brigadistas"
		ps_acceso = "BRIGADISTA"
	CASE "w_con_0001_mant_contratas"
		ps_acceso = "CON_MANT"
	CASE "w_con_0002_ing_contratas"
		ps_acceso = "CON_MANT"
	CASE "w_7101_consulta_descargos"
		ps_acceso = "DES_ACCESO"
	CASE "w_co_salmt_ind"
		ps_acceso = "CON_SMT"
	CASE "w_ma_salmt_ind"
		ps_acceso = "SMT_MANT"
	CASE "w_datos_usuario_sgi"
		ps_acceso = "AMBITO"
	CASE "w_3107_lista_mante_instalaciones"
		ps_acceso = "AMBITO"
	CASE "w_3208_form_mante_instalaciones"
		ps_acceso = "AMBITO"
	CASE "w_gestion_trabajos"
		ps_acceso = "AMBITO"
	CASE "w_man_instalacion"
		ps_acceso = "RED_ACCESO"
	CASE "w_1105_avisos_con_alim"
		ps_acceso = "GAV_ACCESO"
	CASE "w_1234_seleccion_incidencias"
		ps_acceso = "INC_GENERAL"
	CASE "w_2309_reactivar_avisos"
		ps_acceso = "RAV_REACTIVAR"
	CASE "w_3201_mantenimiento_suministros_imp"
		ps_acceso = "SUM_IMP"
	CASE "w_reportes"
		ps_acceso = "REPORTES_P"
	CASE "w_reportes_new"
		ps_acceso = "REPORTES_P"
	CASE "w_1203_inf_aviso"
		ps_acceso = "AMBITO"
	CASE "w_1234_consulta_incidencias"
		ps_acceso = "INC_GENERAL"
	CASE "w_2303_consulta_de_reenganches"
		ps_acceso = "INC_GENERAL"
	CASE "w_2303_historico_de_reenganches"
		ps_acceso = "INC_GENERAL"
	CASE "w_agrupacion_incidencias"
		ps_acceso = "INC_GENERAL"
 	CASE "w_1233_consulta_avisos"
		ps_acceso = "CAV_GENERAL"
	CASE "w_2301_hist_inc_desc"
		
		if gu_comunic.is_comunic.programa_llamante = "Hist_Desc" then 
			ps_acceso = "DES_HIST"
		else
			ps_acceso = "INC_HIST"
		end if

		
	CASE ELSE
		ps_acceso = "AMBITO"
END CHOOSE


end subroutine

event itemchanged;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ITEMCHANGED
//
// Objetivo: SELECCIONA / HABILITA / DESHABILITA LAS DDDW.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 09/09/1999	    FDO
//		
/////////////////////////////////////////////////////////// 

int li_todos,li_conta,li_vigente
int li_valor

This.SetRedraw(False)
li_todos=fgci_todos
String ls_columna
ls_columna=this.getcolumnname()

long ll_nro_centro


CHOOSE CASE ls_columna
	CASE "nro_centro"
		li_valor=Integer(this.gettext())
		This.SetItem(1,"nro_cmd",li_todos)
		This.SetItem(1,"nro_mesa",li_todos)
		This.fnu_des_puesto()
		If li_valor=li_todos THEN
			This.fnu_HABI_cmd()
			//This.fnu_des_puesto()  SMB 25/09/2007 Al elegir 'Todos' en zona, el sector esta habilitado
			This.fnu_habi_puesto()
			This.fnu_filtro_cmd_n()
			This.fnu_filtro_mesa_n() // SMB 17/10/2007 mostramos todos los sectores
			this.object.nro_cmd[1] = li_todos					
		ELSE
			This.SetItem(1,"nro_cmd",li_todos)
			This.SetItem(1,"nro_mesa",li_todos)
			This.fnu_DES_cmd()
			This.fnu_filtro_mesa_n()
			This.fnu_habi_puesto()
			ii_centro_entrada=li_valor
			ii_cmd_entrada=li_todos
		END IF
				
	 CASE "nro_cmd"
		
		li_valor=Integer(this.gettext())
		If li_valor=li_todos THEN
			This.SetItem(1,"nro_mesa",li_todos)
			//This.fnu_des_puesto() SMB 17/10/2007 Si se selecciona todos en COR el sector esta habilitado
			this.fnu_habi_centro()
			This.fnu_filtro_mesa_n() // SMB 17/10/2007 mostramos todos los sectores			
			this.object.nro_centro[1] = li_todos
		ELSE
			This.SetItem(1,"nro_mesa",li_todos)
			this.object.nro_centro[1] = li_todos
			THIS.FNU_DES_CENTRO()
			This.fnu_filtro_mesa_n()
			This.fnu_habi_puesto()
			ii_centro_entrada=li_todos
			ii_cmd_entrada=li_valor
		END IF
			
	 CASE "nro_mesa"
		
		li_valor=Integer(this.gettext())

		if li_valor <> li_todos THEN

			THIS.FNU_HABI_CENTRO()
			THIS.FNU_HABI_CMD()
			
			// setea el centro
				
			SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
				INTO :ll_nro_centro  
				FROM "SGD_RELACION_CENTRO"  
			WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
					( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 1 ) AND 
					( "SGD_RELACION_CENTRO"."CENTRO_RESP" <> 98 );

			This.object.nro_centro[1]=ll_nro_centro
	
			// setea el CMD
				
			This.fnu_filtro_cmd_n()										
			
			SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
				INTO :ll_nro_centro  
				FROM "SGD_RELACION_CENTRO"  
			WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
					( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 2 ) AND
					( "SGD_RELACION_CENTRO"."CENTRO_RESP" <> 98 );

			This.object.nro_cmd[1]=ll_nro_centro
			
		else
			
			if ii_criterio = 1 then
				This.SetItem(1,"nro_centro",ii_centro_entrada)
			elseif ii_criterio = 2 then
				This.SetItem(1,"nro_cmd",ii_cmd_entrada)
			end if

			This.SetItem(1,"nro_mesa",li_todos)
			
			IF ii_criterio = 1 OR ii_criterio = 2 THEN
				if ii_cmd_entrada<>0 then 
					fnu_des_centro()
				elseif ii_centro_entrada<>0 then 
					fnu_des_cmd()
				else
					fnu_des_puesto()
				end if
			END IF

			

			
		end if
			
	CASE "vigente"
		
		this.postevent("ue_post_itemchanged")
		
		
END CHOOSE

This.SetRedraw(true)



end event

event constructor;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: Constructor
//
// Objetivo: Setea la variable ii_criterio, la cual habilita/dehabilita 
//				 opciones seg$$HEX1$$fa00$$ENDHEX$$n perfil
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 22/02/2000	     FDO
//		
/////////////////////////////////////////////////////////// 

int li_conta,li_cuenta_vigente
int li_criterio=0
string ls_array[3] = {"ACC_ZONA","ACC_CMD","ACC_SECTOR"}
powerobject lpb_padre
string ls_acceso


select count(*) into :li_cuenta_vigente from sgd_centro where vigente = 0;

lpb_padre = this.getparent()
////////////////////////////////////////////////
// Recupera seg$$HEX1$$fa00$$ENDHEX$$n perfil de usuario.
//
// ii_criterio = 1 Todas las Zonas
// ii_criterio = 2 Todos los CMD
// ii_criterio = 3 Como 0, no deja cambiar
// ii_criterio = 4 cmd fijo, se modifican sectores de ese cmd
// ii_criterio = 5 zona fija, se modifican sectores de esa zona
// ii_criterio = 6 Acceso total
// ii_criterio = 0 No deja Cambiar
//
/////////////////////////////////////////////FDO

IF lpb_padre.classname() = "w_ma_salmt_ind" or &
    lpb_padre.classname() =  "w_reportes" or &
    lpb_padre.classname() = "w_reportes_new" or &
    lpb_padre.classname() =  "w_2303_historico_de_reenganches" or &
    lpb_padre.classname() =  "w_1233_consulta_avisos" or &
    lpb_padre.classname() =  "w_7106_consulta_historicos" or &
    lpb_padre.classname() =  "w_2301_hist_inc_desc" or &
    lpb_padre.classname() =  "u_2030_ambito_estadisticas" THEN 
	ii_vigente = 0
	this.GetChild('nro_centro',ddw_centro_2)
	ddw_centro_2.SetTransObject(SQLCA)
	ddw_centro_2.Retrieve(ii_vigente)
    ddw_centro_2.selectrow( 0, TRUE)

	this.GetChild('nro_cmd',ddw_cmd)
	ddw_cmd.SetTransObject(SQLCA)
	ddw_cmd.Retrieve(ii_vigente)
	ddw_cmd.selectrow( 1, TRUE)

	this.GetChild('nro_mesa',ddw_mesa)
	ddw_mesa.SetTransObject(SQLCA)
	ddw_mesa.Retrieve(ii_vigente,ii_vigente)
	
	w_shared.ds_mesa_shared.retrieve(ii_vigente,ii_vigente)
	// GNU 15-6-2007. Mejora 1/419768
	w_shared.ds_cmd_shared.retrieve(ii_vigente)
	w_shared.ds_centro_shared.retrieve(ii_vigente) 
	// FIN GNU
ELSE
	ii_vigente = 1 
	this.GetChild('nro_centro',ddw_centro_2)
	ddw_centro_2.SetTransObject(SQLCA)
	ddw_centro_2.Retrieve(ii_vigente)

	this.GetChild('nro_cmd',ddw_cmd)
	ddw_cmd.SetTransObject(SQLCA)
	ddw_cmd.Retrieve(ii_vigente)

	this.GetChild('nro_mesa',ddw_mesa)
	ddw_mesa.SetTransObject(SQLCA)
	ddw_mesa.Retrieve(ii_vigente,ii_vigente)
	
     w_shared.ds_mesa_shared.retrieve(ii_vigente,ii_vigente)
	// GNU 15-6-2007. Mejora 1/419768
	w_shared.ds_cmd_shared.retrieve(ii_vigente)
	w_shared.ds_centro_shared.retrieve(ii_vigente)
	// FIN GNU
END IF


if lpb_padre.typeof() = window! then 
	of_acceso_por_ventana(lpb_padre.classname(),ls_acceso)
else

do while (lpb_padre.typeOf() <>Window! )
	lpb_padre = lpb_padre.Getparent()
loop
	
	if lpb_padre.typeof() = window! then // ESTABA DENTRO DE UN OBJETO
			of_acceso_por_ventana(lpb_padre.classname(),ls_acceso)
	else
		ls_acceso = "AMBITO"
	end if 
end if

FOR LI_CONTA=1 to 3 

	if gu_perfiles.of_acceso_perfil(gi_perfil,ls_Acceso,ls_array[li_conta]) =1 then
		ii_criterio = ii_criterio + li_conta
	end if	 

NEXT
CHOOSE CASE  II_CRITERIO

	CASE 1
		FNU_DES_CMD(THIS)
	CASE 2
		FNU_DES_CENTRO(THIS)
	CASE 4
		FNU_DES_CENTRO(THIS)
		FNU_DES_CMD(THIS)
	CASE 5
		FNU_DES_CENTRO(THIS)
		FNU_DES_CMD(THIS)
	CASE 0,3
		FNU_DES_CENTRO(THIS)
		FNU_DES_CMD(THIS)
		FNU_DES_PUESTO(THIS)
END CHOOSE

		
//***************************************
//**  OSGI 2001.1  	14/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("nro_cmd_t.Text = '" + fg_cor_dw("Cmd:", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	14/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


// A$$HEX1$$f100$$ENDHEX$$adido RCA (12/03/08) Incidencia: 0/557739. Si el pais es MOLDAVIA entonces cambio 
// las etiquetas del Ambito
if (gi_pais = 8) then
	This.Modify("nro_cmd_t.Text = 'Sector'")
	This.Modify("nro_mesa_t.Text = 'Filial'")
end if
// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (12/03/08)	
end event

event clicked;CHOOSE CASE  II_CRITERIO

//	CASE 1
//		this.object.nro_cmd[1]=fgci_todos
//	CASE 2
//		this.object.nro_centro[1]=fgci_todos
	CASE 4
//		this.object.nro_cmd[1]=fgci_todos
//		this.object.nro_centro[1]=gi_nro_centro
////		This.fnu_filtro_mesa_n()
		this.object.nro_cmd[1]=gi_nro_cmd
	CASE 5
//		this.object.nro_centro[1]=fgci_todos
//		this.object.nro_cmd[1]=gi_nro_cmd
		this.object.nro_centro[1]=gi_nro_centro


END CHOOSE
end event

on u_cen_2001_pr_form_centro_cmd_mesa.create
end on

on u_cen_2001_pr_form_centro_cmd_mesa.destroy
end on


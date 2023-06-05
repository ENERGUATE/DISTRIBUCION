HA$PBExportHeader$u_cen_2011_pr_form_centro_cmd_mesa.sru
forward
global type u_cen_2011_pr_form_centro_cmd_mesa from datawindow
end type
end forward

global type u_cen_2011_pr_form_centro_cmd_mesa from datawindow
int Width=1010
int Height=388
string DataObject="d_cen_2001_pr_form_centro_cmd_mesa"
event post_itemchange pbm_custom20
end type
global u_cen_2011_pr_form_centro_cmd_mesa u_cen_2011_pr_form_centro_cmd_mesa

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
public function integer fpr_filtro_cmd ()
public function integer fpr_habilitar_campos (boolean pb_cond)
public subroutine fnu_des_cmd ()
public subroutine fnu_des_puesto ()
public subroutine fnu_habi_cmd ()
public subroutine fnu_habi_puesto ()
public subroutine fnu_filtro_mesa_n ()
public subroutine fnu_filtro_cmd_n ()
public subroutine fnu_filtro_cmd_out ()
public subroutine fnu_filtro_mesa_out ()
public function integer fnu_cargo_drop ()
public function integer fnu_cargo_drop_mesa ()
public function integer fnu_cargo_drop_cmd ()
public function integer fnu_cargo_drop_centro ()
public subroutine fnu_des_centro ()
public function integer fnu_filtrar_cmd_2 (datawindow pd_dw, integer pi_nro_centro)
public function integer fnu_filtro_mesa_2 (datawindow pd_dw, integer pi_nro_cmd)
public subroutine fnu_habi_centro ()
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
fnu_cargo_drop_mesa()
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
	this.Modify("nro_centro.background.color=" + gs_blanco +&
			 "~t nro_cmd.background.color=" + gs_blanco +&
			 "~t nro_mesa.background.color=" + gs_blanco)
	this.SetTabOrder("nro_centro",10)
	this.SetTabOrder("nro_cmd",20)
	this.SetTabOrder("nro_mesa",40)
ELSE
	this.Modify("nro_centro.background.color=" + gs_gris +&
			 "~t nro_cmd.background.color=" + gs_gris +&
			 "~t nro_mesa.background.color=" + gs_gris)
	this.SetTabOrder("nro_centro",0)
	this.SetTabOrder("nro_cmd",0)
	this.SetTabOrder("nro_mesa",0)
END IF


RETURN 1
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
this.modify("nro_cmd.background.color="+gs_gris)


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
this.modify("nro_mesa.background.color="+gs_gris)


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
this.modify("nro_cmd.background.color="+gs_blanco)


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
this.modify("nro_mesa.background.color="+gs_blanco)


end subroutine

public subroutine fnu_filtro_mesa_n ();//integer li_centro
////DataWindowChild dw_centro
//
//long aux
//string xx
//this.getchild("nro_mesa",ddw_centro)
//fnu_cargo_drop_mesa()
////
////dw_centro.retrieve()
//li_centro=Integer(this.gettext())
//IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
//	ddw_centro.SetFilter("")
//	aux=ddw_centro.Filter()
//	ddw_centro.SetFilter("centro_resp = " + string(li_centro) + " OR  centro_resp = 0")
//	aux=ddw_centro.Filter()
//	aux=ddw_centro.Filteredcount()
//END IF

integer li_centro
//DataWindowChild dw_centro

long aux
string xx
this.getchild("nro_mesa",ddw_centro)
fnu_cargo_drop_mesa()
//
//dw_centro.retrieve()
li_centro=Integer(this.gettext())
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	ddw_centro.SetFilter("")
	aux=ddw_centro.Filter()
	ddw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
	aux=ddw_centro.Filter()
	aux=ddw_centro.Filteredcount()
END IF



end subroutine

public subroutine fnu_filtro_cmd_n ();integer li_centro
//DataWindowChild dw_centro

long aux
string xx
fnu_cargo_drop_cmd()
this.getchild("nro_cmd",ddw_centro)
//
//dw_centro.retrieve()
li_centro=Integer(this.gettext())
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	ddw_centro.SetFilter("")
	aux=ddw_centro.Filter()
	ddw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
	aux=ddw_centro.Filter()
	aux=ddw_centro.Filteredcount()
END IF

		



end subroutine

public subroutine fnu_filtro_cmd_out ();integer li_centro
DataWindowChild dw_centro

long aux
string xx
this.getchild("nro_cmd",dw_centro)
//dw_centro.retrieve()
fnu_cargo_drop_cmd()
dw_centro.SetFilter("")
dw_centro.Filter()
li_centro=this.getitemnumber(1,"nro_centro")
//li_centro=Integer(this.gettext())
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	
	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF

		



end subroutine

public subroutine fnu_filtro_mesa_out ();integer li_centro
DataWindowChild dw_centro

long aux
string xx
this.getchild("nro_mesa",dw_centro)
//dw_centro.SetFilter("")
//dw_centro.Filter()
//dw_centro.retrieve()
fnu_cargo_drop_mesa()
li_centro=this.GetItemNumber(1,"nro_cmd")
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	
	dw_centro.SetFilter("centro_resp = " + string(li_centro)+" OR  centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
END IF



end subroutine

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
int ii

int l_cantidad
int i_fila

//this.GetChild("nro_centro",ddw_centro)
//this.GetChild("nro_cmd",ddw_cmd)
//this.GetChild("nro_mesa",ddw_mesa)
//	
//for l_cantidad=1 to ddw_centro_shared.rowcount() 
//		i_fila=ddw_centro.insertrow(0)
//		ddw_centro.setitem(i_fila,"nro_centro",ddw_centro_shared.getitemnumber(l_cantidad,"nro_centro"))
//		ddw_centro.setitem(i_fila,"nom_centro",ddw_centro_shared.getitemstring(l_cantidad,"nom_centro"))
//		ddw_centro.setitem(i_fila,"relacion_centro_centro_resp",ddw_centro_shared.getitemnumber(l_cantidad,"relacion_centro_centro_resp"))
//next
//
//for l_cantidad=1 to ddw_cmd_shared.rowcount() 
//		i_fila=ddw_cmd.insertrow(0)
//		ddw_cmd.setitem(i_fila,"nro_centro",ddw_cmd_shared.getitemnumber(l_cantidad,"nro_centro"))
//		ddw_cmd.setitem(i_fila,"nom_centro",ddw_cmd_shared.getitemstring(l_cantidad,"nom_centro"))
//		ddw_cmd.setitem(i_fila,"centro_resp",ddw_cmd_shared.getitemnumber(l_cantidad,"centro_resp"))
//next
//
//for l_cantidad=1 to ddw_mesa_shared.rowcount() 
//		i_fila=ddw_mesa.insertrow(0)
//		ddw_mesa.setitem(i_fila,"nro_centro",ddw_mesa_shared.getitemnumber(l_cantidad,"nro_centro"))
//		ddw_mesa.setitem(i_fila,"nom_centro",ddw_mesa_shared.getitemstring(l_cantidad,"nom_centro"))
//		ddw_mesa.setitem(i_fila,"centro_resp",ddw_mesa_shared.getitemnumber(l_cantidad,"centro_resp"))
//
//next
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

this.GetChild("nro_mesa",ddw_mesa)
ddw_mesa.reset()
for l_cantidad=1 to ddw_mesa_shared.rowcount() 
		i_fila=ddw_mesa.insertrow(0)
		ddw_mesa.setitem(i_fila,"SGD_CENTRO_nro_centro",ddw_mesa_shared.getitemnumber(l_cantidad,"SGD_CENTRO_nro_centro"))
		ddw_mesa.setitem(i_fila,"SGD_CENTRO_nom_centro",ddw_mesa_shared.getitemstring(l_cantidad,"SGD_CENTRO_nom_centro"))
		ddw_mesa.setitem(i_fila,"SGD_RELACION_CENTRO_centro_resp",ddw_mesa_shared.getitemnumber(l_cantidad,"SGD_RELACION_CENTRO_centro_resp"))

next

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

this.GetChild("nro_cmd",ddw_cmd)
ddw_cmd.reset()

for l_cantidad=1 to ddw_cmd_shared.rowcount() 
		i_fila=ddw_cmd.insertrow(0)
		ddw_cmd.setitem(i_fila,"SGD_CENTRO_nro_centro",ddw_cmd_shared.getitemnumber(l_cantidad,"SGD_CENTRO_nro_centro"))
		ddw_cmd.setitem(i_fila,"SGD_CENTRO_nom_centro",ddw_cmd_shared.getitemstring(l_cantidad,"SGD_CENTRO_nom_centro"))
		ddw_cmd.setitem(i_fila,"SGD_RELACION_CENTRO_centro_resp",ddw_cmd_shared.getitemnumber(l_cantidad,"SGD_RELACION_CENTRO_centro_resp"))
next


RETURN 1
end function

public function integer fnu_cargo_drop_centro ();////////////////////////////////////////////////////////////////////////////////////////////////
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

this.GetChild("nro_centro",ddw_centro)
ddw_centro.reset()	
for l_cantidad=1 to ddw_centro_shared.rowcount() 
		i_fila=ddw_centro.insertrow(0)
		ddw_centro.setitem(i_fila,"SGD_CENTRO_nro_centro",ddw_centro_shared.getitemnumber(l_cantidad,"SGD_CENTRO_nro_centro"))
		ddw_centro.setitem(i_fila,"SGD_CENTRO_nom_centro",ddw_centro_shared.getitemstring(l_cantidad,"SGD_CENTRO_nom_centro"))
		ddw_centro.setitem(i_fila,"SGD_relacion_centro_centro_resp",ddw_centro_shared.getitemnumber(l_cantidad,"SGD_relacion_centro_centro_resp"))
next

RETURN 1
end function

public subroutine fnu_des_centro ();//////////////////////////////////////////////////////////
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


this.modify("nro_centro.protect=1")
this.modify("nro_centro.background.color="+gs_gris)


end subroutine

public function integer fnu_filtrar_cmd_2 (datawindow pd_dw, integer pi_nro_centro);/////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_filtrar_cmd_2
// 
// Objetivo: Filtrar datos Cmd para DDW. en funcion del Centro 
//           seleccionado
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//       Salida:  pi_nro_centro
//
// Devuelve: integer
//
// Fecha		   Responsable	 Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		   -----------	 ---------
// 04/09/1998  AG Matorra   Original(copia UO. 2001) (Brigadistas Inc. 3) 
////////////////////////////////////////////////////////////////////////
integer li_centro
DataWindowChild dw_centro

long aux
string xx
pd_dw.getchild("nro_cmd",dw_centro)
//dw_centro.retrieve()
dw_centro.SetFilter("centro_resp >= 0")
dw_centro.Filter()
li_centro=pi_nro_centro
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
	return 0
Else
	return -1
END IF

end function

public function integer fnu_filtro_mesa_2 (datawindow pd_dw, integer pi_nro_cmd);/////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_filtro_mesa_2
// 
// Objetivo: Filtrar datos del puesto para DDW. en funcion del Cmd ya 
//           seleccionado
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//       Salida:  pi_nro_centro
//
// Devuelve: integer
//
// Fecha		   Responsable	 Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		   -----------	 ---------
// 04/09/1998  AG Matorra   Original(copia UO. 2001) (Brigadistas Inc. 3) 
////////////////////////////////////////////////////////////////////////
integer li_centro
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
	return 0
Else
	return -1
END IF

end function

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


this.modify("nro_centro.protect=0")
this.modify("nro_centro.background.color="+gs_blanco)
end subroutine

event itemchanged;
//s_columna=this.GetColumnName()
//int centro,cmd,li_sin_seleccionar
//
//SetNull(li_sin_seleccionar)
//CHOOSE CASE s_columna
//	CASE "nro_centro"
//		centro=this.GetItemNumber(1,"nro_centro")
//		this.dwmodify("nro_cmd.protect=0")
//		this.SETITEM(1,"nro_cmd",li_sin_seleccionar)
//		this.SETITEM(1,"nro_mesa",li_sin_seleccionar)
//		this.PostEvent("post_itemchange")
//
////		centro=this.GetItemNumber(1,"nro_centro")
////		messagebox("centro",centro)
//
//	CASE "nro_cmd"
//		this.PostEvent("post_itemchange")
//		this.dwmodify("nro_mesa.protect=0")
//		this.SETITEM(1,"nro_mesa",li_sin_seleccionar)
//		
////		cmd=this.GetItemNumber(1,"nro_cmd")
////		messagebox("cmd",cmd)
//				
//	CASE "nro_mesa"
////		centro=this.GetItemNumber(1,"nro_mesa")
////		messagebox("mesa",centro)

////
////		
//
//END CHOOSE
//


////this.postevent("post_itemchange")
////
////int li_todos
////int li_valor
//////This.AcceptText()
////This.SetRedraw(False)
////li_todos=fgci_todos
////String ls_columna
////ls_columna=this.getcolumnname()
////CHOOSE CASE ls_columna
////	CASE "nro_centro"
////				li_valor=Integer(this.gettext())
////				This.SetItem(1,"nro_cmd",li_todos)
////				This.SetItem(1,"nro_mesa",li_todos)
////				This.fnu_des_puesto()
////				If li_valor=li_todos THEN
////					This.fnu_des_cmd()
////				 	This.fnu_des_puesto()
////				ELSE
////					This.fnu_filtro_cmd_n()
////					This.fnu_habi_cmd()
////				END IF
////	 CASE "nro_cmd"
////			li_valor=Integer(this.gettext())
////			This.SetItem(1,"nro_mesa",li_todos)
////			If li_valor=li_todos THEN
////				This.fnu_des_puesto()
////			ELSE
////				This.fnu_filtro_mesa_n()
////				This.fnu_habi_puesto()
////			END IF
////		
////END CHOOSE
////This.SetRedraw(true)
////


//////////////////////////////////////////////////////////
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



int li_todos
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
				 	This.fnu_des_puesto()
					This.fnu_filtro_cmd_n()
					this.object.nro_cmd[1] = li_todos					
				ELSE
					This.SetItem(1,"nro_cmd",li_todos)
					This.SetItem(1,"nro_mesa",li_todos)
					This.fnu_DES_cmd()
					This.fnu_filtro_mesa_n()
					This.fnu_habi_puesto()
				END IF
	 CASE "nro_cmd"
			li_valor=Integer(this.gettext())
			If li_valor=li_todos THEN
				This.SetItem(1,"nro_mesa",li_todos)
				This.fnu_des_puesto()
				this.fnu_habi_centro()
				this.object.nro_centro[1] = li_todos
			ELSE
				This.SetItem(1,"nro_mesa",li_todos)
				this.object.nro_centro[1] = li_todos
				THIS.FNU_DES_CENTRO()
				This.fnu_filtro_mesa_n()
				This.fnu_habi_puesto()
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
						( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 1 )   ;

				This.object.nro_centro[1]=ll_nro_centro
		
				// setea el CMD
					
				This.fnu_filtro_cmd_n()										
				
				SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
					INTO :ll_nro_centro  
					FROM "SGD_RELACION_CENTRO"  
				WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
						( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 2 )   ;

				This.object.nro_cmd[1]=ll_nro_centro
				
			else
				This.SetItem(1,"nro_cmd",li_todos)
				This.SetItem(1,"nro_mesa",li_todos)
				This.SetItem(1,"nro_centro",li_todos)
				THIS.FNU_DES_puesto()
			end if
END CHOOSE

This.SetRedraw(true)

end event


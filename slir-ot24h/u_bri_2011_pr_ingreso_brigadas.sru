HA$PBExportHeader$u_bri_2011_pr_ingreso_brigadas.sru
forward
global type u_bri_2011_pr_ingreso_brigadas from datawindow
end type
end forward

global type u_bri_2011_pr_ingreso_brigadas from datawindow
integer width = 1522
integer height = 612
string dataobject = "d_bri_2011_pr_ingreso_brigadas"
end type
global u_bri_2011_pr_ingreso_brigadas u_bri_2011_pr_ingreso_brigadas

forward prototypes
public subroutine fnu_deshab_nombre ()
public subroutine fnu_deshab_nro_brigada ()
public subroutine fnu_deshab_ind_disponible ()
public subroutine fnu_deshab_turno ()
public subroutine fnu_deshab_movil ()
public subroutine fpr_inicializo (integer pi_ind_disponible, integer pi_turno, integer pi_tip_brigada)
public subroutine fnu_deshab_tipo ()
end prototypes

public subroutine fnu_deshab_nombre ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_nombre
//
// Objetivo: Deshabilito campo nombre de brigada
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//
// Devuelve: --
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("nombre.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//this.modify("nombre.background.color="+string(65536*192+256*192+192))
this.modify("nombre.background.color="+gs_gris)
// Fin. Sgo.



end subroutine

public subroutine fnu_deshab_nro_brigada ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_nro_brigada
//
// Objetivo: Deshabilito campo n$$HEX1$$fa00$$ENDHEX$$mero de brigada
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//
// Devuelve: --
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("nro_brigada.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//this.modify("nro_brigada.background.color="+string(65536*192+256*192+192))
this.modify("nro_brigada.background.color="+gs_gris)
// Fin. Sgo.



end subroutine

public subroutine fnu_deshab_ind_disponible ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_ind_disponible
//
// Objetivo: Deshabilito campo indicacion de disponible
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//
// Devuelve: --
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("ind_disponible.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//this.modify("ind_disponible.background.color="+string(65536*192+256*192+192))
this.modify("ind_disponible.background.color="+gs_gris)
// Fin. Sgo.



end subroutine

public subroutine fnu_deshab_turno ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_turno
//
// Objetivo: Deshabilito campo turno
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//
// Devuelve: --
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


//this.modify("turno.protect=1")
//this.modify("turno.background.color="+string(65536*192+256*192+192))
//


end subroutine

public subroutine fnu_deshab_movil ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_movil
//
// Objetivo: Deshabilito campo movil
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//
// Devuelve: --
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("movil.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//this.modify("movil.background.color="+string(65536*192+256*192+192))
this.modify("movil.background.color="+gs_gris)
// Fin. Sgo.



end subroutine

public subroutine fpr_inicializo (integer pi_ind_disponible, integer pi_turno, integer pi_tip_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_inicializo
// 
// Objetivo: Carga datos en la estructura.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  pi_ind_diponible, pi_turno
//	Salida:   --
//						
// Devuelve:	integer
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	01/07/96
//

////////////////////////////////////////////////////////////////////////////////////////////////

this.setitem(1,"ind_disponible",pi_ind_disponible)
//this.setitem(1,"turno",pi_turno)
this.setitem(1,"tip_brigada",pi_tip_brigada)
end subroutine

public subroutine fnu_deshab_tipo ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_deshab_movil
//
// Objetivo: Deshabilito campo movil
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//
// Devuelve: --
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////


this.modify("TIP_BRIGADA.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//this.modify("TIP_BRIGADA.background.color="+string(65536*192+256*192+192))
this.modify("TIP_BRIGADA.background.color="+gs_gris)
// Fin. Sgo.



end subroutine

on u_bri_2011_pr_ingreso_brigadas.create
end on

on u_bri_2011_pr_ingreso_brigadas.destroy
end on


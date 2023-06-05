HA$PBExportHeader$u_ot_2001_pr_form_orden_de_trabajo.sru
$PBExportComments$UserObject para el formulario de ingreso de ordenes de trabajo.
forward
global type u_ot_2001_pr_form_orden_de_trabajo from u_ot_1001_pr_generico
end type
end forward

global type u_ot_2001_pr_form_orden_de_trabajo from u_ot_1001_pr_generico
int Width=2241
int Height=485
string DataObject="d_ot_2001_pr_form_orden_de_trabajo"
end type
global u_ot_2001_pr_form_orden_de_trabajo u_ot_2001_pr_form_orden_de_trabajo

forward prototypes
public function integer fpr_validar_ot_anulada ()
end prototypes

public function integer fpr_validar_ot_anulada ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_validar_ot_anulada
// 
// Objetivo: Retorna 1 si la ot esta anulada o cero en caso contrario
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/3/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF This.GetItemNumber(1,"est_ot")= fgci_ot_anulada THEN
	Return 1
ELSE
	Return 0
END IF
end function


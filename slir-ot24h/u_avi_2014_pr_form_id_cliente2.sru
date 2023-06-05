HA$PBExportHeader$u_avi_2014_pr_form_id_cliente2.sru
forward
global type u_avi_2014_pr_form_id_cliente2 from u_avi_1001_pr_generico
end type
end forward

global type u_avi_2014_pr_form_id_cliente2 from u_avi_1001_pr_generico
integer width = 1911
integer height = 292
string dataobject = "d_avi_2014_pr_form_id_cliente2"
end type
global u_avi_2014_pr_form_id_cliente2 u_avi_2014_pr_form_id_cliente2

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_cond)
end prototypes

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
//	this.Modify("nombre.background.color=" + string(65536*255+256*255+255) +&
//			 "~t ape1.background.color=" + string(65536*255+256*255+255) +&
//			 "~t ape2.background.color=" + string(65536*255+256*255+255) +&
//			 "~t tfno_cli.background.color=" + string(65536*255+256*255+255))
	this.Modify("nombre.background.color=" + string(65536*255+256*255+255) +&
			 "~t ape1.background.color=" + string(65536*255+256*255+255) +&
			 "~t ape2.background.color=" + string(65536*255+256*255+255) +&
			 "~t tfno_cli.background.color=" + string(65536*255+256*255+255))
// Fin. Sgo.
	this.SetTabOrder("ape1",10)
	this.SetTabOrder("ape2",20)
	this.SetTabOrder("nombre",30)
	this.SetTabOrder("tfno_cli",40)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.Modify("nombre.background.color=" + string(65536*192+256*192+192)+&
//			 "~t ape1.background.color=" + string(65536*192+256*192+192) +&
//			 "~t ape2.background.color=" + string(65536*192+256*192+192) +&
//			 "~t tfno_cli.background.color=" + string(65536*192+256*192+192))
	this.Modify("nombre.background.color=" + gs_gris +&
			 "~t ape1.background.color=" + gs_gris +&
			 "~t ape2.background.color=" + gs_gris +&
			 "~t tfno_cli.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("nombre",0)
	this.SetTabOrder("ape1",0)
	this.SetTabOrder("ape2",0)
	this.SetTabOrder("tfno_cli",0)
END IF


RETURN 1
end function

on u_avi_2014_pr_form_id_cliente2.create
call super::create
end on

on u_avi_2014_pr_form_id_cliente2.destroy
call super::destroy
end on


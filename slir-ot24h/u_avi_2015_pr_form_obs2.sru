HA$PBExportHeader$u_avi_2015_pr_form_obs2.sru
forward
global type u_avi_2015_pr_form_obs2 from u_avi_1001_pr_generico
end type
end forward

global type u_avi_2015_pr_form_obs2 from u_avi_1001_pr_generico
integer width = 2670
integer height = 828
string dataobject = "d_avi_2015_pr_form_obs2"
end type
global u_avi_2015_pr_form_obs2 u_avi_2015_pr_form_obs2

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_cond, boolean pb_cond2)
end prototypes

public function integer fpr_habilitar_campos (boolean pb_cond, boolean pb_cond2);////////////////////////////////////////////////////////////////////////////////////////////////
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
//				pb_cond2 (boolean que indica si se hab. el campo prioridad)
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
//	this.Modify("co_alcance.background.color=" + string(65536*255+256*255+255) +&
//			 "~t tip_aviso.background.color=" + string(65536*255+256*255+255) +&
//			 "~t nro_aviso.background.color=" + string(65536*255+256*255+255)+&
//			 "~t f_alta.background.color=" + string(65536*255+256*255+255) +&
//			 "~t nro_telefonista.background.color=" + string(65536*255+256*255+255) +&
//			 "~t obs_telegestiones.background.color=" + string(65536*255+256*255+255) +&
//			 "~t obs_cmd.background.color=" + string(65536*255+256*255+255))
	this.Modify("co_alcance.background.color=" + gs_blanco +&
			 "~t tip_aviso.background.color=" + gs_blanco +&
			 "~t nro_aviso.background.color=" + gs_blanco +&
			 "~t f_alta.background.color=" + gs_blanco +&
			 "~t nro_telefonista.background.color=" + gs_blanco +&
			 "~t obs_telegestiones.background.color=" + gs_blanco +&
			 "~t obs_cmd.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("co_alcance",10)
	this.SetTabOrder("tip_aviso",20)
	this.SetTabOrder("nro_aviso",30)
	this.SetTabOrder("f_alta",40)
	this.SetTabOrder("nro_telefonista",50)
	this.SetTabOrder("obs_telegestiones",70)
	this.SetTabOrder("obs_cmd",80)
ELSEIF NOT pb_cond THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.Modify("co_alcance.background.color=" + string(65536*192+256*192+192) +&
//			 "~t tip_aviso.background.color=" + string(65536*192+256*192+192) +&
//			 "~t nro_aviso.background.color=" + string(65536*192+256*192+192)+&
//			 "~t f_alta.background.color=" + string(65536*192+256*192+192) +&
//			 "~t nro_telefonista.background.color=" + string(65536*192+256*192+192) +&
//			 "~t obs_telegestiones.background.color=" + string(65536*192+256*192+192) +&
//			 "~t obs_cmd.background.color=" + string(65536*192+256*192+192))

	this.Modify("co_alcance.background.color=" + gs_gris +&
			 "~t tip_aviso.background.color=" + gs_gris +&
			 "~t nro_aviso.background.color=" + gs_gris +&
			 "~t f_alta.background.color=" + gs_gris +&
			 "~t nro_telefonista.background.color=" + gs_gris +&
			 "~t obs_telegestiones.background.color=" + gs_gris +&
			 "~t obs_cmd.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("co_alcance",0)
	this.SetTabOrder("tip_aviso",0)
	this.SetTabOrder("nro_aviso",0)
	this.SetTabOrder("f_alta",0)
	this.SetTabOrder("nro_telefonista",0)
	this.SetTabOrder("obs_telegestiones",0)
	this.SetTabOrder("obs_cmd",0)
END IF

IF pb_cond2 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.Modify("prioridad.background.color=" + string(65536*255+256*255+255))
	this.Modify("prioridad.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("prioridad",60)
ELSEIF NOT pb_cond2 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.Modify("prioridad.background.color=" + string(65536*192+256*192+192))
	this.Modify("prioridad.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("prioridad",0)
END IF


RETURN 1
end function

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("obs_cmd_t.Text = '" + fg_cor_dw("Observaciones CMD", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on u_avi_2015_pr_form_obs2.create
call super::create
end on

on u_avi_2015_pr_form_obs2.destroy
call super::destroy
end on


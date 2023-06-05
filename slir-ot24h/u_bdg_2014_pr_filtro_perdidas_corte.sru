HA$PBExportHeader$u_bdg_2014_pr_filtro_perdidas_corte.sru
forward
global type u_bdg_2014_pr_filtro_perdidas_corte from u_bdg_1001_pr_generico
end type
end forward

global type u_bdg_2014_pr_filtro_perdidas_corte from u_bdg_1001_pr_generico
int Width=2848
int Height=516
string DataObject="d_bdg_2014_pr_filtro_perdidas_corte"
end type
global u_bdg_2014_pr_filtro_perdidas_corte u_bdg_2014_pr_filtro_perdidas_corte

type variables
DataWindowChild ddw_brigada
DataWindowChild ddw_tipo_inc
DataWindowChild ddw_tension_inc
DataWindowChild ddw_material_averiado
DataWindowChild ddw_int_horario
int ii
end variables

forward prototypes
public function integer fpr_crea_dddw ()
end prototypes

public function integer fpr_crea_dddw ();//////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_crea_dddw
//// 
//// Objetivo: Crea (conecta) las Drop Down DataWindows internas 
////				 del user object.
////	
////
//// Ambito:	
////
//// Par$$HEX1$$e100$$ENDHEX$$metros: 
////	Entrada:  --
////	Salida:   --
////						
//// Devuelve:	
////
////  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ---------	-------		----------------------------------------
////	20/06/96		 HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
////
//////////////////////////////////////////////////////////////////////////////////////////////////
//
//int aux
//	aux=THIS.GetChild("pa_tipo_incidencia",ddw_tipo_inc)
////	ii = ddw_tipo_incidencia_t_shared.sharedata(ddw_tipo_inc)
//	ddw_tipo_inc.SetTransObject(SQLCA)
//	ddw_tipo_inc.Retrieve()
//   aux=THIS.GetChild("pa_tension_afectada",ddw_tension_inc)
////	ii = ddw_tension_incidencia_t_shared.sharedata(ddw_tension_inc)
//	ddw_tension_inc.SetTransObject(SQLCA)
//	ddw_tension_inc.Retrieve()
//   aux=THIS.GetChild("pa_material_averiado",ddw_material_averiado)
////	ii = ddw_material_averiado_shared.sharedata(ddw_material_averiado)
//	ddw_material_averiado.SetTransObject(SQLCA)
//	ddw_material_averiado.Retrieve()
//	
//	aux=THIS.GetChild("pa_int_horario",ddw_int_horario)
////   ii = ddw_int_horario_shared.sharedata(ddw_int_horario)
//	ddw_int_horario.SetTransObject(SQLCA)
//	ddw_int_horario.Retrieve()
//	
//	aux=THIS.GetChild("pa_brigada",ddw_brigada)
//	ii=ddw_brigada.SetTransObject(SQLCA)
//	aux=ddw_brigada.Retrieve()
//
RETURN 1


end function

on clicked;// No corresponde que se ejecute el script del padre !!!
end on

event constructor;// No corresponde que se ejecute el script del padre !!!

//***************************************
//**  OSGI 2001.1  	21/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("pa_zona_cmd.CheckBox.Text = '" + fg_cor_dw("Zona / Cmd", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	21/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event


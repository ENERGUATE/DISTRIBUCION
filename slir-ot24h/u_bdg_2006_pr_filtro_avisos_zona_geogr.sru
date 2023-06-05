HA$PBExportHeader$u_bdg_2006_pr_filtro_avisos_zona_geogr.sru
forward
global type u_bdg_2006_pr_filtro_avisos_zona_geogr from u_bdg_1001_pr_generico
end type
end forward

global type u_bdg_2006_pr_filtro_avisos_zona_geogr from u_bdg_1001_pr_generico
int Width=2848
int Height=492
string DataObject="d_bdg_2007_pr_filtro_avisos_zona_geogr"
end type
global u_bdg_2006_pr_filtro_avisos_zona_geogr u_bdg_2006_pr_filtro_avisos_zona_geogr

forward prototypes
public function integer fpr_crea_dddw ()
end prototypes

public function integer fpr_crea_dddw ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_crea_dddw
// 
// Objetivo: Crea (conecta) las Drop Down DataWindows internas 
//				 del user object.
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
// Fecha	  		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----			-----------		----------------------------------------
//	21/08/96		 	AD				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

DataWindowChild ddw_int_horario

This.GetChild('pa_int_horario',ddw_int_horario)
//ddw_int_horario_shared.ShareData(ddw_int_horario)
ddw_int_horario.SetTransObject ( SQLCA )
ddw_int_horario.Retrieve()
RETURN 1


end function

on clicked;// No corresponde que se ejecute el script del padre !!!
end on

event constructor;// No corresponde que se ejecute el script del padre !!!

//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("pa_zona_cmd.CheckBox.Text = '" + fg_cor_dw("Zona / Cmd", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event


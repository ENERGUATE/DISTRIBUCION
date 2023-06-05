HA$PBExportHeader$u_bdg_2001_pr_filtro_estadis_zona_geogr.sru
forward
global type u_bdg_2001_pr_filtro_estadis_zona_geogr from u_bdg_1001_pr_generico
end type
end forward

global type u_bdg_2001_pr_filtro_estadis_zona_geogr from u_bdg_1001_pr_generico
int Width=2848
int Height=492
string DataObject="d_bdg_2001_pr_filtro_estadis_zona_geogr"
end type
global u_bdg_2001_pr_filtro_estadis_zona_geogr u_bdg_2001_pr_filtro_estadis_zona_geogr

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
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/06/96		 HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

DataWindowChild ddw_tipo_incidencia_t, ddw_tension_incidencia, ddw_material_averiado, ddw_int_horario, ddw_causa_incidencia
string ls_filtro

This.GetChild('pa_tipo_incidencia',ddw_tipo_incidencia_t)
ddw_tipo_incidencia_t.SetTransObject(SQLCA)
ddw_tipo_incidencia_t.Retrieve()

IF this.DataObject = 'd_bdg_2001_pr_filtro_estadis_zona_geogr' THEN
  IF fgci_con_scada = 0 THEN
	  ls_filtro = "tip_incidencia NOT IN (" + string(fgci_incidencia_scada) + "," + string(fgci_incidencia_calidad) + ")"
  END IF
ELSE 
  IF fgci_con_scada = 0 THEN
	  ls_filtro = "tip_incidencia <>" + string(fgci_incidencia_scada)
  END IF
END IF
ddw_tipo_incidencia_t.SetFilter(ls_filtro)
ddw_tipo_incidencia_t.Filter()

This.GetChild('pa_tension_afectada',ddw_tension_incidencia)
ddw_tension_incidencia.SetTransObject(sqlca)
ddw_tension_incidencia.Retrieve()

This.GetChild('pa_material_averiado',ddw_material_averiado)
ddw_material_averiado.SetTransObject(sqlca)
ddw_material_averiado.Retrieve()

This.GetChild('pa_int_horario',ddw_int_horario)
ddw_int_horario.SetTransObject(sqlca)
ddw_int_horario.Retrieve()

This.GetChild('pa_causa',ddw_causa_incidencia)
ddw_causa_incidencia.SetTransObject(sqlca)
ddw_causa_incidencia.Retrieve()

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


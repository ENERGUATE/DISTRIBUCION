HA$PBExportHeader$u_bdg_2005_pr_criterio_seleccion.sru
forward
global type u_bdg_2005_pr_criterio_seleccion from u_bdg_1001_pr_generico
end type
end forward

global type u_bdg_2005_pr_criterio_seleccion from u_bdg_1001_pr_generico
int Width=2848
int Height=492
string DataObject="d_bdg_2005_pr_filtro_instal_afectadas"
end type
global u_bdg_2005_pr_criterio_seleccion u_bdg_2005_pr_criterio_seleccion

forward prototypes
public function integer fpr_cargar_alcance (integer pi_tipo_incidencia)
public function integer fpr_crea_dddw ()
end prototypes

public function integer fpr_cargar_alcance (integer pi_tipo_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
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

string ls_filtro, ls_tipos
DataWindowChild ddw_alcance

This.GetChild('pa_alcance',ddw_alcance)

CHOOSE CASE pi_tipo_incidencia
//CASE fgci_todos
//	ls_tipos = "("+string(fgci_todos)+")"
CASE fgci_incidencia_imprevista
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_de_suministro)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)+")"
CASE fgci_incidencia_programada
		ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)+")"
CASE fgci_incidencia_calidad
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_de_suministro)+","+string(fgci_incidencia_de_instalacion)+")"
 CASE fgci_incidencia_scada
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_reenganche)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)+")"		
END CHOOSE

ls_filtro = 'codigo in '+ ls_tipos
ddw_alcance.SetTransObject(sqlca)
ddw_alcance.Retrieve('IN_A')
ddw_alcance.SetFilter(ls_filtro)
ddw_alcance.Filter()

//ddw_tipo_incidencia_t_shared.shareData(ddw_tipo_incidencia_t)

RETURN 1


end function

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

string ls_filtro, ls_tipos
DataWindowChild ddw_t_tipo_instalacion, ddw_tipo_incidencia_t, ddw_alcance

This.GetChild('pa_tip_instalacion',ddw_t_tipo_instalacion)
ddw_t_tipo_instalacion.SetTransObject(sqlca)
ddw_t_tipo_instalacion.Retrieve()

This.GetChild('pa_tipo_incidencia',ddw_tipo_incidencia_t)
ddw_tipo_incidencia_t.SetTransObject(sqlca)
ddw_tipo_incidencia_t.retrieve()

IF fgci_con_scada = 1 THEN
	ls_filtro = "tip_incidencia <> " + string(fgci_incidencia_calidad)
ELSE
	ls_filtro = "tip_incidencia <> " + string(fgci_incidencia_calidad) + " and " + "tip_incidencia <> " + string(fgci_incidencia_scada)
END IF
ddw_tipo_incidencia_t.SetFilter(ls_filtro)
ddw_tipo_incidencia_t.Filter()

//ddw_tipo_incidencia_t_shared.shareData(ddw_tipo_incidencia_t)

RETURN 1


end function

event clicked;// No corresponde que se ejecute el script del padre !!!
end event

on constructor;// No corresponde que se ejecute el script del padre !!!
end on


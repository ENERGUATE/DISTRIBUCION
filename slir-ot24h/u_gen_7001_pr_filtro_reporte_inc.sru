HA$PBExportHeader$u_gen_7001_pr_filtro_reporte_inc.sru
forward
global type u_gen_7001_pr_filtro_reporte_inc from u_bdg_1001_pr_generico
end type
end forward

global type u_gen_7001_pr_filtro_reporte_inc from u_bdg_1001_pr_generico
integer width = 2391
integer height = 628
string dataobject = "d_bdg_7001_pr_filtro_reporte_incidencias"
end type
global u_gen_7001_pr_filtro_reporte_inc u_gen_7001_pr_filtro_reporte_inc

type variables
string is_alimentacion = " "
string is_estado = " "
string is_estado_mant = " "
string is_tipo = " "
string is_alcance = " "
string is_suministro = " "
string is_linea = " "

datawindowchild ddw_tipo_aviso
datawindowchild ddw_alcance_aviso
datawindowchild ddw_estado_incidencia_t
datawindowchild ddw_estado_mantenimiento_t
datawindowchild ddw_tipo_incidencia_t
datawindowchild ddw_tension_incid_t
//hjhgjgjgj
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
datawindowchild ddw_nom_ins_afectada
datawindowchild ddw_nom_ins_origen
datawindowchild ddw_tip_ins_afectada
datawindowchild ddw_tip_ins_origen
datawindowchild ddw_tension
datawindowchild ddw_estado_actual
datawindowchild ddw_brigada
datawindowchild ddw_ot
datawindowchild ddw_causa
datawindowchild ddw_material_averiado
s_incidencia is_incidencia


end variables

forward prototypes
public function integer fpr_crea_dddw ()
public subroutine fnu_cargar_dddw ()
public subroutine of_filtro_tipo_inc_ext ()
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

DataWindowChild ddw_tipo_incidencia_t, ddw_tension_incidencia, ddw_material_averiado ,ddw_causa_incidencia

This.GetChild('pa_tipo_incidencia',ddw_tipo_incidencia_t)
ddw_tipo_incidencia_t_shared.shareData(ddw_tipo_incidencia_t)
//ddw_tipo_incidencia_t.SetTransObject(sqlca)
//ddw_tipo_incidencia_t.Retrieve()
//

//if not gb_scada then 
//	ddw_tipo_incidencia_t.SetFilter("tip_incidencia <>"+string(fgci_incidencia_scada))
//	ddw_tipo_incidencia_t.Filter()
//end if 


//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
of_filtro_tipo_inc_ext()
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


This.GetChild('pa_tension_afectada',ddw_tension_incidencia)
ddw_tension_incidencia.SetTransObject(sqlca)
ddw_tension_incidencia.Retrieve()

This.GetChild('pa_material_averiado',ddw_material_averiado)
ddw_material_averiado.SetTransObject(sqlca)
ddw_material_averiado.Retrieve()
//This.GetChild('pa_material_averiado',ddw_material_averiado_shared)
//ddw_material_averiado_shared.SetTransObject(sqlca)
//ddw_material_averiado_shared.Retrieve()
//

This.GetChild('pa_int_horario',ddw_material_averiado)
ddw_material_averiado.SetTransObject(sqlca)
ddw_material_averiado.Retrieve()

//This.GetChild('pa_tipo_incidencia',ddw_material_averiado_shared)
//ddw_material_averiado_shared.shareData(ddw_material_averiado_shared)

This.GetChild('pa_causa',ddw_causa_incidencia)
ddw_causa_incidencia.SetTransObject(sqlca)
ddw_causa_incidencia.Retrieve()
//ddw_causa_incidencia.InsertRow(1)
//ddw_causa_incidencia.SetItem(1,"cod_causa",0)
RETURN 1


end function

public subroutine fnu_cargar_dddw ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
//
// Responsable: FDB .- Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: -- 
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int ii
this.GetChild("ai_estado",ddw_estado_incidencia_t)
ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)


//ddw_estado_incidencia_T.SetTransObject(SQLCA)
//ddw_estado_incidencia_t.Retrieve()

//ddw_estado_incidencia_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
//ddw_estado_incidencia_t.filter()



this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)


//ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
//ddw_estado_mantenimiento_t.Retrieve()
////ddw_estado_mantenimiento_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
////ddw_estado_mantenimiento_t.filter()
//


this.GetChild("ai_tipo",ddw_tipo_aviso)
ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
ddw_tipo_aviso.setsort("tip_aviso A")
ddw_tipo_aviso.sort()
//this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
//
//ii=ddw_tipo_incidencia_t_shared.sharedata(ddw_tipo_incidencia_t)

//this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
//ddw_tipo_incidencia_t.SetTransObject(SQLCA)
//ddw_tipo_incidencia_t.Retrieve()
//ddw_tipo_incidencia_t.setsort("tip_aviso A")
//ddw_tipo_incidencia_t.sort()
//
//  la linea de abajo es la que da el problema !!! //////////////////////////////

//
//This.GetChild("ai_alcance",ddw_tension_incid_t)
//ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)
//
//this.GetChild("ai_alcance",ddw_tension_incidencia_t)
//ddw_tension_incidencia_t.SetTransObject(SQLCA)
//ddw_tension_incidencia_t.Retrieve()
//ddw_tension_incidencia_t.setsort("co_alcance A")
//ddw_tension_incidencia_t.sort()
//
//
//




//this.GetChild("ai_estado",ddw_estado_aviso)
//ddw_estado_aviso.SetTransObject(SQLCA)
//ddw_estado_aviso.Retrieve()
//ddw_estado_aviso.setfilter("est_aviso <> " + string(fgci_aviso_resuelto))
//ddw_estado_Aviso.filter()


//this.GetChild("ai_tipo",ddw_tipo_aviso)
//ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
//ddw_tipo_aviso.setsort("tip_aviso A")
//ddw_tipo_aviso.sort()


this.GetChild("ai_alcance",ddw_alcance_aviso)
ddw_alcance_aviso_t_shared.shareData(ddw_alcance_aviso)
ddw_alcance_aviso.setsort("co_alcance A")
ddw_alcance_aviso.sort()
end subroutine

public subroutine of_filtro_tipo_inc_ext ();//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not fg_verifica_parametro('nuevos_tip_inc') /*Or &
	fg_verifica_parametro('not_nuevos_tip_inc') */Then

	If Not gb_scada Then
		fg_filtro_ext(This, "not_nuevos_tip_inc_consulta_scada", "ai_tipo")
	Else
		fg_filtro_ext(This, "not_nuevos_tip_inc_consulta", "ai_tipo")
	End If
End If
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

event clicked;// No corresponde que se ejecute el script del padre !!!
end event

on constructor;// No corresponde que se ejecute el script del padre !!!
end on

on u_gen_7001_pr_filtro_reporte_inc.create
call super::create
end on

on u_gen_7001_pr_filtro_reporte_inc.destroy
call super::destroy
end on


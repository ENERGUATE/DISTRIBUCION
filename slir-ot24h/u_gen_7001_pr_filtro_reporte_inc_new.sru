HA$PBExportHeader$u_gen_7001_pr_filtro_reporte_inc_new.sru
$PBExportComments$NUEVO UO 17/11/2000
forward
global type u_gen_7001_pr_filtro_reporte_inc_new from u_bdg_1001_pr_generico
end type
end forward

global type u_gen_7001_pr_filtro_reporte_inc_new from u_bdg_1001_pr_generico
int Width=3566
int Height=688
string DataObject="d_bdg_7001_pr_filtro_reporte_inci_news"
end type
global u_gen_7001_pr_filtro_reporte_inc_new u_gen_7001_pr_filtro_reporte_inc_new

type variables
string is_alimentacion = " "
string is_estado = " "
string is_estado_mant = " "
string is_tipo = " "
string is_alcance = " "
string is_suministro = " "
string is_linea = " "

//child incidencia
datawindowchild iddw_tipo_incidencia
datawindowchild iddw_voltaje_afectado
datawindowchild iddw_material_averiado
datawindowchild iddw_intervalo_tiempo
datawindowchild iddw_causa_incidencia
datawindowchild iddw_famcausa
datawindowchild iddw_tipo_instal_afec
datawindowchild iddw_agente
datawindowchild iddw_estado_incidencia
datawindowchild iddw_alcance


integer ii_filas_selec = 0

integer ii_selected_row

Boolean ib_fam_causa
end variables

forward prototypes
public subroutine fnu_cargar_dddw ()
public subroutine fpr_crea_dddw ()
public subroutine of_filtro_tipo_inc_ext ()
end prototypes

public subroutine fnu_cargar_dddw ();///////////////////////////////////////////////////////////////////////
////
//// Funcion: fnu_cargar_dddw
//// 
//// Objetivo:  Carga los datos de dropdown datawindow.
////	
////
//// Responsable: FDB .- Frank
////
//// Par$$HEX1$$e100$$ENDHEX$$metros:
////    Entrada: -- 
////		Salida : --
////
//// Devuelve:
////
//// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ------	   -----------   ---------
////
////
/////////////////////////////////////////////////////////
//
//int ii
//this.GetChild("ai_estado",ddw_estado_incidencia_t)
//ii = ddw_estado_incidencia_t_shared.sharedata(ddw_estado_incidencia_t)
//
//
////ddw_estado_incidencia_T.SetTransObject(SQLCA)
////ddw_estado_incidencia_t.Retrieve()
//
////ddw_estado_incidencia_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
////ddw_estado_incidencia_t.filter()
//
//
//
//this.GetChild("ai_estado_mant",ddw_estado_mantenimiento_t)
//ii=ddw_estado_mantenimiento_t_shared.sharedata(ddw_estado_mantenimiento_t)
//
//
////ddw_estado_mantenimiento_t.SetTransObject(SQLCA)
////ddw_estado_mantenimiento_t.Retrieve()
//////ddw_estado_mantenimiento_t.setfilter("estado_actual <> " + string(fgci_incidencia_resuelta))
//////ddw_estado_mantenimiento_t.filter()
////
//
//
//this.GetChild("ai_tipo",ddw_tipo_aviso)
//ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
//ddw_tipo_aviso.setsort("tip_aviso A")
//ddw_tipo_aviso.sort()
////this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
////
////ii=ddw_tipo_incidencia_t_shared.sharedata(ddw_tipo_incidencia_t)
//
////this.GetChild("ai_tipo",ddw_tipo_incidencia_t)
////ddw_tipo_incidencia_t.SetTransObject(SQLCA)
////ddw_tipo_incidencia_t.Retrieve()
////ddw_tipo_incidencia_t.setsort("tip_aviso A")
////ddw_tipo_incidencia_t.sort()
////
////  la linea de abajo es la que da el problema !!! //////////////////////////////
//
////
////This.GetChild("ai_alcance",ddw_tension_incid_t)
////ii=ddw_tension_incidencia_t_shared.sharedata(ddw_tension_incid_t)
////
////this.GetChild("ai_alcance",ddw_tension_incidencia_t)
////ddw_tension_incidencia_t.SetTransObject(SQLCA)
////ddw_tension_incidencia_t.Retrieve()
////ddw_tension_incidencia_t.setsort("co_alcance A")
////ddw_tension_incidencia_t.sort()
////
////
////
//
//
//
//
////this.GetChild("ai_estado",ddw_estado_aviso)
////ddw_estado_aviso.SetTransObject(SQLCA)
////ddw_estado_aviso.Retrieve()
////ddw_estado_aviso.setfilter("est_aviso <> " + string(fgci_aviso_resuelto))
////ddw_estado_Aviso.filter()
//
//
////this.GetChild("ai_tipo",ddw_tipo_aviso)
////ddw_tipo_aviso_t_shared.shareData(ddw_tipo_aviso)
////ddw_tipo_aviso.setsort("tip_aviso A")
////ddw_tipo_aviso.sort()
//
//
//this.GetChild("ai_alcance",ddw_alcance_aviso)
//ddw_alcance_aviso_t_shared.shareData(ddw_alcance_aviso)
//ddw_alcance_aviso.setsort("co_alcance A")
//ddw_alcance_aviso.sort()
end subroutine

public subroutine fpr_crea_dddw ();////////////////////////////////////////////////////////////////////////////////////////////////
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
//	20/11/2000	 JHE	 		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

this.Getchild('tip_incidencia',iddw_tipo_incidencia)
iddw_tipo_incidencia.SetTransObject(SQLCA)
iddw_tipo_incidencia.Retrieve()


If Not gb_scada Then
	iddw_tipo_incidencia.SetFilter("tip_incidencia <>"+string(fgci_incidencia_scada))
	iddw_tipo_incidencia.Filter()
End If 


//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
of_filtro_tipo_inc_ext()
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//this.Getchild('pa_tension_afectada',iddw_voltaje_afectado)
this.Getchild('tip_tension',iddw_voltaje_afectado)
iddw_voltaje_afectado.SetTransObject(SQLCA)
iddw_voltaje_afectado.Retrieve()

//this.Getchild('pa_material_averiado',iddw_material_averiado)
this.Getchild('mat_averiado',iddw_material_averiado)
iddw_material_averiado.SetTransObject(SQLCA)
iddw_material_averiado.Retrieve()

//this.Getchild('pa_int_horario',iddw_intervalo_tiempo)
this.Getchild('cod_horario',iddw_intervalo_tiempo)
iddw_intervalo_tiempo.SetTransObject(SQLCA)
iddw_intervalo_tiempo.Retrieve()

//this.Getchild('pa_causa',iddw_causa_incidencia)


//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//IF fg_verifica_parametro('CAUSAS') THEN
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
	this.Getchild('cod_causa',iddw_causa_incidencia)
	iddw_causa_incidencia.SetTransObject(SQLCA)
	iddw_causa_incidencia.Retrieve(0)
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//ELSE
//	this.Modify("cod_causa.dddw.Name='ddw_causa_sinfam_new'")
//	this.Modify("cod_causa.dddw.DataColumn='cod_causa'")
//	this.Modify("cod_causa.dddw.DisplayColumn='descripcion")
//
//	this.Getchild('cod_causa',iddw_causa_incidencia)
//	iddw_causa_incidencia.SetTransObject(SQLCA)
//	iddw_causa_incidencia.Retrieve()
//END IF
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//This.GetChild('pa_famcausa',iddw_famcausa)
//CAMBIO SUR13 *JHE 15/02/2001* 
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
IF fg_verifica_parametro('CAUSAS') THEN
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
	This.GetChild('fam_causa',iddw_famcausa)
	iddw_famcausa.SetTransObject(sqlca)
	iddw_famcausa.Retrieve(0)
ELSE
	this.Object.fam_causa.visible = 0
	this.Object.famcausa_t.visible = 0
END IF
//CAMBIO SUR13 *JHE 15/02/2001* 

//This.GetChild('pa_tipo_instal',iddw_tipo_instal_afec)
This.GetChild('tipo_instalacion',iddw_tipo_instal_afec)
iddw_tipo_instal_afec.SetTransObject(sqlca)
iddw_tipo_instal_afec.retrieve()

//This.GetChild('pa_agente',iddw_agente)
This.GetChild('agente',iddw_agente)
iddw_agente.SetTransObject(sqlca)
iddw_agente.retrieve()

//This.GetChild('pa_estado',iddw_estado_incidencia)
This.GetChild('est_actual',iddw_estado_incidencia)
iddw_estado_incidencia.SetTransObject(sqlca)
iddw_estado_incidencia.Retrieve()


//***************************************
//**  OSGI 2001.1  	26/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.GetChild('pa_alcance', iddw_alcance)
iddw_alcance.SetTransObject(SQLCA)
iddw_alcance.Retrieve('IN_A')
iddw_alcance.SetSort("codigo A")
iddw_alcance.Sort()
//***************************************
//**  OSGI 2001.1  	26/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public subroutine of_filtro_tipo_inc_ext ();//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not fg_verifica_parametro('nuevos_tip_inc') /*Or &
	fg_verifica_parametro('not_nuevos_tip_inc')*/ Then

	If Not gb_scada Then
		fg_filtro_ext(This, "not_nuevos_tip_inc_consulta_scada", "tip_incidencia")
	Else
		fg_filtro_ext(This, "not_nuevos_tip_inc_consulta", "tip_incidencia")
	End If
End If
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

on clicked;// No corresponde que se ejecute el script del padre !!!
end on

event constructor;// No corresponde que se ejecute el script del padre !!!



//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_fam_causa = fg_verifica_parametro('CAUSAS')
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event


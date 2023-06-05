HA$PBExportHeader$w_7106_consulta_historicos.srw
forward
global type w_7106_consulta_historicos from w_sgigenerica
end type
type dw_3 from datawindow within w_7106_consulta_historicos
end type
type cb_1 from commandbutton within w_7106_consulta_historicos
end type
type tab_1 from tab within w_7106_consulta_historicos
end type
type tabpage_1 from userobject within tab_1
end type
type dw_descargo from uo_7002_pr_mante_solicitud within tabpage_1
end type
type dw_2 from datawindow within tabpage_1
end type
type gb_6 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_descargo dw_descargo
dw_2 dw_2
gb_6 gb_6
end type
type tabpage_otros from userobject within tab_1
end type
type dw_descargo_otros from datawindow within tabpage_otros
end type
type tabpage_otros from userobject within tab_1
dw_descargo_otros dw_descargo_otros
end type
type tabpage_2 from userobject within tab_1
end type
type st_causa from statictext within tabpage_2
end type
type st_cxt_t from statictext within tabpage_2
end type
type st_cxt from statictext within tabpage_2
end type
type st_pxt from statictext within tabpage_2
end type
type st_pxt_t from statictext within tabpage_2
end type
type st_clientes_afec from statictext within tabpage_2
end type
type st_11 from statictext within tabpage_2
end type
type st_pot_afec from statictext within tabpage_2
end type
type st_10 from statictext within tabpage_2
end type
type st_9 from statictext within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type st_8 from statictext within tabpage_2
end type
type st_7 from statictext within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type tv_1 from uo_man_instalac within tabpage_2
end type
type dw_instalaciones from datawindow within tabpage_2
end type
type gb_4 from groupbox within tabpage_2
end type
type gb_3 from groupbox within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type gb_causa from groupbox within tabpage_2
end type
type dw_1 from datawindow within tabpage_2
end type
type st_4 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_causa st_causa
st_cxt_t st_cxt_t
st_cxt st_cxt
st_pxt st_pxt
st_pxt_t st_pxt_t
st_clientes_afec st_clientes_afec
st_11 st_11
st_pot_afec st_pot_afec
st_10 st_10
st_9 st_9
st_6 st_6
st_1 st_1
st_8 st_8
st_7 st_7
st_5 st_5
st_3 st_3
st_2 st_2
tv_1 tv_1
dw_instalaciones dw_instalaciones
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
gb_causa gb_causa
dw_1 dw_1
st_4 st_4
end type
type tabpage_int_simulacion from userobject within tab_1
end type
type dw_int_simulacion from u_info_int_descargo within tabpage_int_simulacion
end type
type tabpage_int_simulacion from userobject within tab_1
dw_int_simulacion dw_int_simulacion
end type
type tabpage_historial from userobject within tab_1
end type
type uo_historial from uo_historial_descargos within tabpage_historial
end type
type tabpage_historial from userobject within tab_1
uo_historial uo_historial
end type
type tabpage_instalaciones from userobject within tab_1
end type
type mle_observaciones from multilineedit within tabpage_instalaciones
end type
type gb_65 from groupbox within tabpage_instalaciones
end type
type tabpage_instalaciones from userobject within tab_1
mle_observaciones mle_observaciones
gb_65 gb_65
end type
type tabpage_accion from userobject within tab_1
end type
type dw_aprobar from datawindow within tabpage_accion
end type
type dw_informacion_extra from datawindow within tabpage_accion
end type
type dw_solicitud from datawindow within tabpage_accion
end type
type dw_instalacion from datawindow within tabpage_accion
end type
type tabpage_accion from userobject within tab_1
dw_aprobar dw_aprobar
dw_informacion_extra dw_informacion_extra
dw_solicitud dw_solicitud
dw_instalacion dw_instalacion
end type
type tab_1 from tab within w_7106_consulta_historicos
tabpage_1 tabpage_1
tabpage_otros tabpage_otros
tabpage_2 tabpage_2
tabpage_int_simulacion tabpage_int_simulacion
tabpage_historial tabpage_historial
tabpage_instalaciones tabpage_instalaciones
tabpage_accion tabpage_accion
end type
type sw_rama from structure within w_7106_consulta_historicos
end type
end forward

type sw_rama from structure
        long            fila
        long            codigo
end type

global type w_7106_consulta_historicos from w_sgigenerica
integer x = 23
integer y = 172
integer width = 3611
integer height = 2036
string title = "OPEN SGI - Consulta Descargo"
windowtype windowtype = response!
long backcolor = 79741120
string icon = "descargo.ico"
event ue_presentacion pbm_custom25
dw_3 dw_3
cb_1 cb_1
tab_1 tab_1
end type
global w_7106_consulta_historicos w_7106_consulta_historicos

type variables
//estructura de comunicaciones
u_generico_comunicaciones  lu_comunic
long il_nro_descargo 
boolean lb_tiene_perfil_oper
long il_handle, il_row
s_rama s_elemento
long ll_apertura = 0
integer ii_grabo = 0
integer ii_accion 
long il_error = 0
long il_nro_inst_padre
boolean ib_error
boolean ib_descargo_en_historico = false

boolean ib_new_tip_inc  // TIPO INCIDENCIA AMR
end variables

forward prototypes
public subroutine fw_inst_descargo ()
public function long fw_tiene_interrupcion (datawindow d_interrupcion, long codigo)
public subroutine fw_cargar_arbol (long co_nivel)
public function long fw_busqueda_arbol (long nro_padre)
public subroutine fw_deshabilita_tab_interrupciones ()
public subroutine fw_descargo_en_historico (long pl_nro_descargo)
end prototypes

event ue_presentacion;int li_Estado
datetime ldt_f_ini_aprob, ldt_f_fin_aprob
string ls_descripcion // GNU 2-8-2006. Mejora 1/426921

tab_1.tabpage_1.dw_descargo.SetTransObject(SQLCA)
if tab_1.tabpage_1.dw_descargo.retrieve(lu_comunic.is_comunic.longval1) > 0 then

	li_estado = this.tab_1.tabpage_1.dw_descargo.GetItemNumber (1,'estado')
	ldt_f_ini_aprob = this.tab_1.tabpage_1.dw_descargo.GetITemDateTime(1,'f_ini_aprobado')
	ldt_f_fin_aprob = this.tab_1.tabpage_1.dw_descargo.GetITemDateTime(1,'f_fin_aprobado')
	fw_descargo_en_historico(lu_comunic.is_comunic.longval1)
	// Si el descargo ya tiene fecha de aprobaci$$HEX1$$f300$$ENDHEX$$n en fecha inicio y fin del descargo
	// deben mostrarse las fechas de inicio y fin de aprobaci$$HEX1$$f300$$ENDHEX$$n
	IF (li_Estado = fgci_descargo_aprobado or li_estado = fgci_descargo_modificado or li_estado = fgci_descargo_activado  or &
		li_estado = fgci_descargo_no_activado or li_estado = fgci_descargo_finalizado or li_Estado = fgci_descargo_rechazado or &
		li_estado = fgci_descargo_anulado or li_estado = fgci_descargo_aplazado) and &
		Not IsNull(ldt_f_ini_aprob) and Not IsNull(ldt_f_fin_aprob) THEN
		
		tab_1.tabpage_1.dw_descargo.Modify("f_ini_solicitado.visible = false")
		tab_1.tabpage_1.dw_descargo.Modify("f_fin_solicitado.visible = false")	
		tab_1.tabpage_accion.dw_solicitud.Modify("f_ini_solicitado.visible = false")
		tab_1.tabpage_accion.dw_solicitud.Modify("f_fin_solicitado.visible = false")
		tab_1.tabpage_2.st_3.text = string(ldt_f_ini_aprob)
		tab_1.tabpage_2.st_5.text = string(ldt_f_fin_aprob)
	END IF
	
	fw_descargo_en_historico(lu_comunic.is_comunic.longval1)
	
	IF ib_descargo_en_historico THEN
		tab_1.tabpage_2.dw_instalaciones.dataObject = 'd_hist_descargos'
		tab_1.tabpage_historial.uo_historial.dw_historial.Dataobject = 'd_historial_descargos_hist'
		tab_1.tabpage_2.dw_1.Dataobject = 'dw_descargo_hist'
	ELSE
		this.tab_1.tabpage_2.dw_instalaciones.dataObject = 'd_hist_descargos_int'
		tab_1.tabpage_2.dw_1.Dataobject = 'dw_descargo'
		// GNU 17-5-2006. Incidencia 0/429152
		string ls_inst_descargar
		SELECT inst_descargar
		INTO :ls_inst_descargar
		FROM SGD_DESCARGOS
		WHERE nro_descargo= :il_nro_descargo;
//		tab_1.tabpage_instalaciones.mle_observaciones.text = tab_1.tabpage_1.dw_descargo.object.inst_descargar[1]
		tab_1.tabpage_instalaciones.mle_observaciones.text = ls_inst_descargar
		tab_1.tabpage_instalaciones.visible=true
		// FIN GNU
	END IF
	
// GNU 2-8-2006. Mejora 1/426921


	ls_descripcion= tab_1.tabpage_1.dw_descargo.GetItemString(1,'descripcion')

if fg_verifica_parametro("descripcion descargos") &
	and isNumber(ls_descripcion) then
//	and (il_nro_descargo >= long(ls_prim_desc)) then
//	ls_descripcion= tab_1.tabpage_1.dw_descargo.GetItemString(1,'descripcion')
	
//	SELECT descripcion
//	into :ls_descripcion
//	FROM sgd_valor
//	WHERE codif='DS_D'
//		AND codigo= :ls_descripcion ;

	SELECT descripcion
	into :ls_descripcion
	FROM gi_desc_descargos_hist
	WHERE codigo= :ls_descripcion;
		
	tab_1.tabpage_1.dw_descargo.SetItem (1,'descripcion',ls_descripcion)
end if
// FIN GNU
	
	
	tab_1.tabpage_historial.uo_historial.dw_historial.SetTransObject(SQLCA)
	tab_1.tabpage_historial.uo_historial.dw_historial.retrieve(lu_comunic.is_comunic.longval1)
	tab_1.tabpage_2.dw_instalaciones.setTransObject (SQLCA)
	tab_1.tabpage_2.dw_instalaciones.Retrieve(lu_comunic.is_comunic.longval1)
	tab_1.tabpage_2.dw_1.settransobject(sqlca)
	tab_1.tabpage_2.dw_1.retrieve(lu_comunic.is_comunic.longval1)
	
	//********************************************************************************************//
	//               Externalidad: Solicitud de descargos, informacion adicional                  //
	//               Luis Eduardo Ortiz   Mayo/2001                                               //
	//********************************************************************************************//
	If fg_verifica_parametro("solicitud_descargos_extra") Then
		If li_Estado = fgci_descargo_aprobado OR li_Estado = fgci_descargo_activado Then
			this.tab_1.tabpage_accion.Enabled = True
				
			tab_1.tabpage_accion.dw_instalacion.settransobject(sqlca)
			tab_1.tabpage_accion.dw_instalacion.retrieve(lu_comunic.is_comunic.decval1)
				
			tab_1.tabpage_accion.dw_solicitud.settransobject(sqlca)
			tab_1.tabpage_accion.dw_solicitud.insertrow(0)
			tab_1.tabpage_accion.dw_solicitud.setitem(1,"id_solicitante",tab_1.tabpage_1.dw_descargo.GetItemString(1,"id_solicitante"))
			tab_1.tabpage_accion.dw_solicitud.setitem(1,"f_ini_solicitado",tab_1.tabpage_1.dw_descargo.GetItemDateTime(1,"f_ini_solicitado"))
			tab_1.tabpage_accion.dw_solicitud.setitem(1,"f_fin_solicitado",tab_1.tabpage_1.dw_descargo.GetItemDateTime(1,"f_fin_solicitado"))
		
			tab_1.tabpage_accion.dw_aprobar.SetTransObject(SQLCA)
			tab_1.tabpage_accion.dw_aprobar.Retrieve(lu_comunic.is_comunic.longval1)
		
			this.tab_1.tabpage_accion.dw_aprobar.Modify("f_aprobado.protect=1")
	//		this.tab_1.tabpage_accion.dw_aprobar.Modify("obs_aprobado.protect=1")
			this.tab_1.tabpage_accion.dw_aprobar.Modify("obs_aprobado.Edit.DisplayOnly='Yes'")
				
			this.tab_1.tabpage_accion.dw_aprobar.Modify("f_aprobado.background.color="+gs_gris)
			this.tab_1.tabpage_accion.dw_aprobar.Modify("obs_aprobado.background.color="+gs_gris)
				
			this.tab_1.tabpage_accion.dw_aprobar.Modify("f_aprobado.color=8388608")
			this.tab_1.tabpage_accion.dw_aprobar.Modify("obs_aprobado.color=8388608")
			this.tab_1.tabpage_accion.dw_aprobar.Modify("id_aprobado.color=8388608")
				
			this.tab_1.tabpage_accion.dw_instalacion.Modify("nom_instalacion.color=8388608")
			
			this.tab_1.tabpage_accion.dw_solicitud.Modify("id_solicitante.color=8388608")
			this.tab_1.tabpage_accion.dw_solicitud.Modify("f_ini_solicitado.color=8388608")
			this.tab_1.tabpage_accion.dw_solicitud.Modify("f_fin_solicitado.color=8388608")
		End If
	
		this.tab_1.tabpage_otros.dw_descargo_otros.SetTransObject(SQLCA)
	
		If This.tab_1.tabpage_otros.dw_descargo_otros.retrieve(lu_comunic.is_comunic.longval1) <= 0 Then
			tab_1.tabpage_otros.dw_descargo_otros.InsertRow(0)
		End If
	
		this.tab_1.tabpage_otros.Visible = True
	
	//	If li_Estado = fgci_descargo_aprobado OR li_Estado = fgci_descargo_activado Then
			tab_1.tabpage_accion.dw_informacion_extra.settransobject(sqlca)
	
			If tab_1.tabpage_accion.dw_informacion_extra.retrieve(lu_comunic.is_comunic.longval1) <= 0 Then
				tab_1.tabpage_accion.dw_informacion_extra.InsertRow(0)
			End If
	
			tab_1.tabpage_2.gb_3.height = 528
			
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("agente.protect=1")
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_agente.protect=1")
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_aprueba.protect=1")
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("subest_movil.protect=1")
					
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("agente.background.color="+gs_gris)
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_agente.background.color="+gs_gris)
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_aprueba.background.color="+gs_gris)
			this.tab_1.tabpage_accion.dw_informacion_extra.Modify("subest_movil.background.color="+gs_gris)
			
	//	End if
		
		//***************************************
		//**  OSGI 2001.1  	08/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		Long 	 ll_nro_descargo
		String ls_duracion, ls_cxt, ls_pxt, ls_t
		String ls_c, ls_p
		
		tab_1.tabpage_2.st_pot_afec.Visible = True
		tab_1.tabpage_2.st_10.Visible = True
		tab_1.tabpage_2.st_clientes_afec.Visible = True
		tab_1.tabpage_2.st_11.Visible = True
	
		tab_1.tabpage_2.st_pxt_t.Visible = True
		tab_1.tabpage_2.st_cxt_t.Visible = True
		tab_1.tabpage_2.st_pxt.Visible = True
		tab_1.tabpage_2.st_cxt.Visible = True
	
	
		If tab_1.tabpage_1.dw_descargo.RowCount() < 1 Then Return
	
		ll_nro_descargo = tab_1.tabpage_1.dw_descargo.GetItemNumber(1 , "nro_descargo" )
		ls_duracion = fg_duracion_int_descargo(ll_nro_descargo)
		
		ls_cxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		ls_pxt = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		ls_c = Mid( ls_duracion, 1,  ( Pos( ls_duracion , "~t" ) - 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		ls_p = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		ls_duracion = Mid( ls_duracion, ( Pos( ls_duracion , "~t" ) + 1 ))
		
		
		If IsNumber(ls_cxt) Then
			tab_1.tabpage_2.st_cxt.Text = String(Long(ls_cxt), '#,##0')
		Else
			tab_1.tabpage_2.st_cxt.Text = ls_cxt
		End If
		
		If IsNumber(ls_pxt) Then
			tab_1.tabpage_2.st_pxt.Text = String(Double(ls_pxt), '#,##0.0')
		Else
			tab_1.tabpage_2.st_pxt.Text = ls_pxt
		End If
			
		If IsNumber(ls_c) Then
			tab_1.tabpage_2.st_clientes_afec.Text = String(Long(ls_c), '#,##0')
		Else
			tab_1.tabpage_2.st_clientes_afec.Text = ls_c
		End If
		
		If IsNumber(ls_p) Then
			tab_1.tabpage_2.st_pot_afec.Text = String(Double(ls_p), '#,##0.0')
		Else
			tab_1.tabpage_2.st_pot_afec.Text = ls_p
		End If
	
		//***************************************
		//**  OSGI 2001.1  	08/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	Else
		tab_1.tabpage_2.st_7.y = 176
		tab_1.tabpage_2.st_3.y = 176
		tab_1.tabpage_2.st_8.y = 288
		tab_1.tabpage_2.st_5.y = 288
		tab_1.tabpage_2.st_9.y = 400
		tab_1.tabpage_2.st_6.y = 400
	
		tab_1.tabpage_2.gb_3.Height = 464
	
		tab_1.tabpage_2.st_pot_afec.Visible = False
		tab_1.tabpage_2.st_10.Visible = False
		tab_1.tabpage_2.st_clientes_afec.Visible = False
		tab_1.tabpage_2.st_11.Visible = False
	
		tab_1.tabpage_2.st_pxt_t.Visible = False
		tab_1.tabpage_2.st_cxt_t.Visible = False
		tab_1.tabpage_2.st_pxt.Visible = False
		tab_1.tabpage_2.st_cxt.Visible = False

	End If
	
	//********************************************************************************************//
	//               Luis Eduardo Ortiz   Mayo/2001                                               //
	//********************************************************************************************//

// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Colombia. 12/07/2005.
//	If gi_pais = 7 Then
	If fg_verifica_parametro("Causa en descargos.")Then
		tab_1.tabpage_2.gb_1.Y = tab_1.tabpage_2.gb_1.Y + 180
		tab_1.tabpage_2.dw_1.Y = tab_1.tabpage_2.dw_1.Y + 180
		tab_1.tabpage_2.st_4.Y = tab_1.tabpage_2.st_4.Y + 180

		tab_1.tabpage_2.gb_causa.Visible = True
		tab_1.tabpage_2.st_causa.Visible = True
	End If
// Fin. Sgo.
	
else
	
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n" , " Los datos del descargo no est$$HEX1$$e100$$ENDHEX$$n en el hist$$HEX1$$f300$$ENDHEX$$rico",information!,ok!)
	close(this)

end if
end event

public subroutine fw_inst_descargo ();long ll_fila,ll_handle,ll_co_nivel, ll_codigo, ll_tipo, ll_icono, ll_nro_inst_padre
Int li_tension
string ls_nombre
treeviewitem le_elemento
sw_rama sl_rama

        //Obtengo el nombre, codigo de nivel
        
SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
		"SGD_INSTALACION"."CO_NIVEL", TIPO_INSTALACION, TENSION
INTO  :ls_nombre,   
		:ll_co_nivel  , :ll_tipo, :li_tension
FROM "SGD_INSTALACION"  
WHERE 		"SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre   
AND   "SGD_INSTALACION"."BDI_JOB" = 0;   // DSA 10/01/2000			


// Compruebo si existe interrupciones para la instalacion en ese descargo
ll_fila=fw_tiene_interrupcion(tab_1.tabpage_2.dw_1,il_nro_inst_padre)

// Se crea la rama de primer nivel
ll_icono = tab_1.tabpage_2.tv_1.f_icono_arbol(ll_tipo)
ll_handle = tab_1.tabpage_2.tv_1.insertitemsort(0,ls_nombre,ll_icono)
tab_1.tabpage_2.tv_1.getitem(ll_handle,le_elemento)
sl_rama.codigo = il_nro_inst_padre
sl_rama.fila = 0

// Si existe una interrupcion para esa instalacion se pone en negrilla
// Y se guarda el numero de fila donde se ha encontrado en interrupciones
if ll_fila > 0 then
	le_elemento.bold = true
	sl_rama.fila = ll_fila
end if

// Actualiza el elemento creado en el arbol
le_elemento.data = sl_rama
tab_1.tabpage_2.tv_1.setitem(ll_handle,le_elemento)

//Cargo el segundo nivel 

// GNU 18-4-2006
// Cargo mas niveles
IF not ib_descargo_en_historico THEN
DECLARE desc_inst_afect CURSOR FOR  
SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
		"SGD_INSTALACION"."CO_NIVEL",
		"SGD_INSTALACION"."TIPO_INSTALACION", 
		"SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION"
 FROM "SGD_INSTALACION" ,"SGD_DESCARGOS_INST_AFEC" 
WHERE 	"SGD_DESCARGOS_INST_AFEC"."NRO_DESCARGO" =  :il_nro_descargo 
		AND "SGD_INSTALACION"."BDI_JOB" = 0 
		AND "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION" 
		AND "SGD_INSTALACION"."NRO_INSTALACION" <> :il_nro_inst_padre; 

OPEN desc_inst_afect;

FETCH desc_inst_afect into  :ls_nombre, :ll_co_nivel, :ll_tipo,:ll_nro_inst_padre;
ELSE
	DECLARE desc_inst_afect_1 CURSOR FOR  
SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
		"SGD_INSTALACION"."CO_NIVEL",
		"SGD_INSTALACION"."TIPO_INSTALACION", 
		"GI_HIST_DESCARGOS_INST_AFEC"."NRO_INSTALACION"
 FROM "SGD_INSTALACION" ,"GI_HIST_DESCARGOS_INST_AFEC" 
WHERE 	"GI_HIST_DESCARGOS_INST_AFEC"."NRO_DESCARGO" =  :il_nro_descargo 
		AND "SGD_INSTALACION"."BDI_JOB" = 0 
		AND "SGD_INSTALACION"."NRO_INSTALACION" = "GI_HIST_DESCARGOS_INST_AFEC"."NRO_INSTALACION" 
		AND "SGD_INSTALACION"."NRO_INSTALACION" <> :il_nro_inst_padre; 
	
OPEN desc_inst_afect_1;

FETCH desc_inst_afect_1 into  :ls_nombre, :ll_co_nivel, :ll_tipo,:ll_nro_inst_padre;
END IF

DO WHILE sqlca.sqlcode = 0

	ll_fila = fw_tiene_interrupcion(tab_1.tabpage_2.dw_1,ll_nro_inst_padre)

	ll_icono = tab_1.tabpage_2.tv_1.f_icono_arbol(ll_tipo)
	ll_handle = tab_1.tabpage_2.tv_1.insertitemsort(0,ls_nombre,ll_icono)
	tab_1.tabpage_2.tv_1.getitem(ll_handle,le_elemento)
	sl_rama.codigo = ll_nro_inst_padre
	sl_rama.fila = 0

	// Si existe una interrupcion para esa instalacion se pone en negrilla
	// Y se guarda el numero de fila donde se ha encontrado en interrupciones

	if ll_fila > 0 then
		 le_elemento.bold = true
		 sl_rama.fila = ll_fila
	end if
	
	// Actualiza el elemento creado en el arbol
	
	le_elemento.data = sl_rama
	tab_1.tabpage_2.tv_1.setitem(ll_handle,le_elemento)			
	
IF not ib_descargo_en_historico THEN
	FETCH desc_inst_afect into  :ls_nombre, :ll_co_nivel, :ll_tipo,:ll_nro_inst_padre;
else
	FETCH desc_inst_afect_1 into  :ls_nombre, :ll_co_nivel, :ll_tipo,:ll_nro_inst_padre;
end if

LOOP

IF not ib_descargo_en_historico THEN
	CLOSE desc_inst_afect;
else
	CLOSE desc_inst_afect_1;
end if
//Cargo el segundo nivel 

// FIN GNU

if ll_fila > 0 then
	return
end if

IF gb_operaciones and li_tension <=gi_tension_nivel_min &
	AND ll_tipo <> fgci_tipo_ct then // LO TRATA OPERACIONES
	
	tab_1.tabpage_int_simulacion.visible = TRUE
	tab_1.tabpage_int_simulacion.dw_int_simulacion.SetTransObject(SQLCA)
	tab_1.tabpage_int_simulacion.dw_int_simulacion.Retrieve(il_nro_descargo)
ELSE
	fw_cargar_arbol(ll_co_nivel+1)  
//	fw_cargar_arbol(ll_co_nivel+2)  
END IF	 

end subroutine

public function long fw_tiene_interrupcion (datawindow d_interrupcion, long codigo);long ll_fila
        
        ll_fila = tab_1.tabpage_2.dw_1.find("cod_instalacion = " + string(codigo),1,tab_1.tabpage_2.dw_1.rowcount())

        if sqlca.sqlcode = 0 then
                return ll_fila
        else
                return 0
        end if

end function

public subroutine fw_cargar_arbol (long co_nivel);// Recive co_nivel con el nivel de la instalacion que ha de aparecer en
// el siguiente nivel de la rama que tenemos ya cargada


Treeviewitem le_elemento, le_busqueda
string ls_nombre, ls_nombre_anterior
long ll_handle, ll_fila, ll_codigo, ll_nro_padre, ll_handle_buscado, co_nivel_anterior, ll_tipo, ll_tipo2, ll_icono
sw_rama sl_rama

IF ib_descargo_en_historico THEN
	 DECLARE cu_nivel1 CURSOR FOR  
  		SELECT "SGD_INSTALACION"."NOM_INSTALACION",
                        "SGD_INSTALACION"."NRO_INSTALACION",
                        "SGD_INSTALACION"."NRO_INST_PADRE",sgd_instalacion. TIPO_INSTALACION
    	FROM "SGD_INSTALACION",   
      	  "GI_HIST_INTERRUPCION_DESCARGOS"  
   	WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = "GI_HIST_INTERRUPCION_DESCARGOS"."COD_INSTALACION" ) and  
         ( "GI_HIST_INTERRUPCION_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo);
			// GNU 28-03-2006. Incidencia Correo
			// and
       //  ( "SGD_INSTALACION"."CO_NIVEL" = :co_nivel ) AND ( "SGD_INSTALACION"."BDI_JOB" = 0 );  // DSA 10/01/2000			
		// FIN GNU	
		open cu_nivel1 ;


		fetch cu_nivel1 into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo;
			
	
ELSE

	 DECLARE cu_nivel CURSOR FOR  
  		SELECT "SGD_INSTALACION"."NOM_INSTALACION",
                        "SGD_INSTALACION"."NRO_INSTALACION",
                        "SGD_INSTALACION"."NRO_INST_PADRE", sgd_instalacion.TIPO_INSTALACION
		FROM "SGD_INSTALACION",   
				"SGD_INTERRUPCION_DESCARGO"  
		WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" ) and  
				( "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :il_nro_descargo); 
				// GNU 28-03-2006. Incidencia Correo
				// and
			//	( "SGD_INSTALACION"."CO_NIVEL" = :co_nivel ) AND ( "SGD_INSTALACION"."BDI_JOB" = 0 );  // DSA 10/01/2000			
			// FIN GNU
		open cu_nivel ;
		
		
		fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo;
				
END IF			
			



do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
        
        
        //  Busca en el arbol alguna instalacion, que tenga el codigo de instalacion
        //  padre del que estoy intentando insertar.
        
                        
        ll_handle_buscado = fw_busqueda_arbol(ll_nro_padre)
        
        // Si no existe el elemento buscado, solo puede ocurrir en tercer nivel
        // Busca el padre de la instalacion coge los datos
        // Interta la rama nueva y le dice el handle donde se ha insertado
        if ll_handle_buscado = -1 then
                
          SELECT "SGD_INSTALACION"."NOM_INSTALACION" , CO_NIVEL , TIPO_INSTALACION
            INTO :ls_nombre_anterior, :co_nivel_anterior, :ll_tipo2
         FROM "SGD_INSTALACION"  
           WHERE 		"SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_padre   
						AND ( "SGD_INSTALACION"."BDI_JOB" = 0 );  // DSA 10/01/2000			


                ll_icono = tab_1.tabpage_2.tv_1.f_icono_arbol(ll_tipo2)
                ll_handle_buscado = tab_1.tabpage_2.tv_1.insertitemsort(1,ls_nombre_anterior,ll_icono)
                tab_1.tabpage_2.tv_1.getitem(ll_handle_buscado, le_elemento)
                sl_rama.codigo = ll_nro_padre
                sl_rama.fila = 0
                le_elemento.data = sl_rama
                tab_1.tabpage_2.tv_1.setitem(ll_handle_buscado,le_elemento)
                
        end if
        ll_icono = tab_1.tabpage_2.tv_1.f_icono_arbol(ll_tipo)
        ll_handle = tab_1.tabpage_2.tv_1.insertitemsort(ll_handle_buscado,ls_nombre,ll_icono)
        tab_1.tabpage_2.tv_1.getitem(ll_handle, le_elemento)
        ll_fila = fw_tiene_interrupcion(tab_1.tabpage_2.dw_1,ll_codigo)
        sl_rama.codigo = ll_codigo
        sl_rama.fila = 0
        
        if ll_fila > 0 then
                le_elemento.bold = true
                sl_rama.fila = ll_fila
        end if

        le_elemento.data = sl_rama
        tab_1.tabpage_2.tv_1.setitem(ll_handle,le_elemento)
        IF ib_descargo_en_historico THEN
				fetch cu_nivel1 into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo;
		  ELSE
				fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo;
		  END IF
        
loop

IF ib_descargo_en_historico THEN
	close cu_nivel1 ;
ELSE
	close cu_nivel ;
END IF

end subroutine

public function long fw_busqueda_arbol (long nro_padre);Treeviewitem le_busqueda
long ll_handle_busqueda, ll_resultado
sw_rama sl_busqueda

ll_handle_busqueda = 1

DO

        ll_resultado = tab_1.tabpage_2.tv_1.getitem(ll_handle_busqueda, le_busqueda) 
        
        if ll_resultado = -1 then
                return -1
        end if
        
        sl_busqueda = le_busqueda.data
        if sl_busqueda.codigo = nro_padre then

                return ll_handle_busqueda
                
        end if

ll_handle_busqueda ++

LOOP WHILE ll_handle_busqueda = ll_handle_busqueda

end function

public subroutine fw_deshabilita_tab_interrupciones ();// Comprueba si las interrupciones marcadas estan en la tabla sgd_interrupcion_descarg o
// en sgd_interrupcion
// Si estan en sgd_interrupcion_descargo se deshabilita el tab de interrupciones ya que 
// no son las interrupciones reales
// Si estan en sgd_interrupciones el tab estar$$HEX2$$e1002000$$ENDHEX$$habilitado
// GSE 28/03/2001

long ll_nro_descargo, ll_nro_incidencia, ll_instalacion
Integer li_total_inst

ll_nro_descargo = tab_1.tabpage_1.dw_descargo.getitemnumber(1,"nro_descargo")

tab_1.tabpage_2.dw_1.settransobject(sqlca)
tab_1.tabpage_2.dw_1.retrieve(ll_nro_descargo)
fw_descargo_en_historico(lu_comunic.is_comunic.longval1)
IF ib_descargo_en_historico THEN
	
   SELECT "GI_HIST_DESCARGOS"."COD_INST_ORIGEN"
   INTO :ll_instalacion
   FROM "GI_HIST_DESCARGOS"  
   WHERE "GI_HIST_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo ;
	
	IF ll_instalacion = 0 OR (SQLCA.SQLCODE <> 0) THEN
		tab_1.tabpage_2.Enabled = false
	END IF
	
	SELECT Count("GI_HIST_INTERRUPCION_DESCARGOS"."COD_INSTALACION")
	INTO :li_total_inst
	FROM "GI_HIST_INTERRUPCION_DESCARGOS"
	WHERE "GI_HIST_INTERRUPCION_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;

	IF li_total_inst <= 0 OR (SQLCA.SQLCODE <> 0) THEN
		tab_1.tabpage_2.Enabled = false
	END IF
	
ELSE
	
   SELECT "SGD_DESCARGOS"."COD_INST_ORIGEN"
   INTO :ll_instalacion
   FROM "SGD_DESCARGOS"  
   WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo ;
	
	IF ll_instalacion = 0 OR (SQLCA.SQLCODE <> 0) THEN
		tab_1.tabpage_2.Enabled = false
	END IF
	
	SELECT Count("SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION")
	INTO :li_total_inst
	FROM "SGD_INTERRUPCION_DESCARGO"
	WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :ll_nro_descargo;

	IF li_total_inst <= 0 OR (SQLCA.SQLCODE <> 0) THEN
		tab_1.tabpage_2.Enabled = false
	END IF
END IF
	
	//buscar en la tabla de interrupciones descargos una interrupcion para ese descargo
	// si no la encuentra deshabilito el tab
	
	
//	SELECT "SGD_DESCARGOS"."NRO_INCIDENCIA"
//	INTO :ll_nro_incidencia
//	FROM "SGD_DESCARGOS"
//	WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo;
//	
//	IF IsNull(ll_nro_incidencia) OR (SQLCA.SQLCODE <> 0) THEN
//		tab_1.tabpage_2.Enabled = false
//	ELSE
//		SELECT "SGD_INTERRUPCION"."NRO_INSTALACION"
//		INTO :ll_instalacion
//		FROM "SGD_INTERRUPCION"
//		WHERE "SGD_INTERRUPCION"."NRO_INCIDENCIA" = :ll_nro_incidencia;
//		
//		IF NOT(IsNull(ll_instalacion)) AND (SQLCA.SQLCODE = 0) then
//			tab_1.tabpage_2.Enabled = true
//		END IF
//	END IF
end subroutine

public subroutine fw_descargo_en_historico (long pl_nro_descargo);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_descargo_en_historico
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que determina si un descargo ha sido pasado a hist$$HEX1$$f300$$ENDHEX$$ricos.
//				 El resultado de esta funci$$HEX1$$f300$$ENDHEX$$n se carga en la variable de instancia 
//				 ib_descargo_en_historicos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: pl_nro_descargo -> nro de descargo
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 21/06/2001	      GSE						Creaci$$HEX1$$f300$$ENDHEX$$n
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int li_hay_descargo

SELECT COUNT(*)
INTO :li_hay_descargo
FROM SGD_DESCARGOS
WHERE NRO_DESCARGO = :pl_nro_descargo AND
		(ESTADO = :fgci_descargo_anulado or ESTADO =:fgci_descargo_finalizado);

IF SQLCA.SQLCode = 0 THEN
	// La incidencia est$$HEX2$$e1002000$$ENDHEX$$en SGD_INCIDENCIA. Esto implica que sus datos no han pasado a los 
	// hist$$HEX1$$f300$$ENDHEX$$ricos.
	// Si la incidencia est$$HEX2$$e1002000$$ENDHEX$$en estado RS y en SGD_INCIDENCIA, $$HEX1$$fa00$$ENDHEX$$nicamente hay que cambiar
	// las datawindows que consultas SGD_INTERRUPCION, ya que tendr$$HEX1$$e100$$ENDHEX$$n que consultar 
	// SGD_INTERRUPCION y SGD_INTERRUPCION_RES
	IF li_hay_descargo > 0 THEN
		ib_descargo_en_historico = False
	
	ELSE
		// La incidencia no est$$HEX2$$e1002000$$ENDHEX$$en SGD_INCIDENCIA. Se mira entonces si est$$HEX2$$e1002000$$ENDHEX$$en GI_HIST_INCIDENCIAS
		SELECT COUNT(*)
		INTO :li_hay_descargo
		FROM GI_HIST_DESCARGOS
		WHERE NRO_DESCARGO = :pl_nro_descargo AND
			(ESTADO = :fgci_descargo_anulado) or (ESTADO =:fgci_descargo_finalizado);
		
		IF SQLCA.SQLCode = 0  THEN 
			// La incidencia est$$HEX2$$e1002000$$ENDHEX$$en los hist$$HEX1$$f300$$ENDHEX$$ricos
			IF li_hay_descargo > 0 THEN
				ib_descargo_en_historico = true
			END IF
		END IF
	END IF			
END IF


end subroutine

on w_7106_consulta_historicos.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.cb_1=create cb_1
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.tab_1
end on

on w_7106_consulta_historicos.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.cb_1)
destroy(this.tab_1)
end on

event open;call super::open;////////////////////////////////////////////////////
// EVENTO : OPEN
//      
//      entrada:
//              gu_comunic.is_cpomunic.longval1=nro_descargo
//
//      salida          
//
//
///////////////////////////////////////////////////
x=this.workspaceX()
//******************CREACION DE OBJETOS DE TRABAJO***********************
SetPointer(HourGlass!)
lu_comunic = create u_generico_comunicaciones 
lu_comunic.is_comunic=gu_comunic.is_comunic

//*****************EVALUA PRESENTACION**************************
//w_7102_mantenimiento_descargos.       tab_1.tabpage_1.dw_descargo.InsertRow(0)

//////////////////////////////////////////////////////////
// TIPO DE INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
//////////////////////////////////////////////////////////

ib_new_tip_inc = fg_verifica_parametro('nuevos_tip_inc')

if ib_new_tip_inc then
	 tab_1.tabpage_1.dw_descargo.modify("descargos_his_ind_obligada.visible=1")
else
	 tab_1.tabpage_1.dw_descargo.modify("descargos_his_ind_obligada.visible=0")
	 tab_1.tabpage_1.dw_descargo.modify("obs_solicitado.height = 368")
end if
//////////////////////////////////////////////////////////
THIS.TriggerEvent("ue_presentacion")

end event

event closequery;
tab_1.tabpage_1.dw_descargo.ShareDataOff()
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7106_consulta_historicos
end type

type dw_3 from datawindow within w_7106_consulta_historicos
boolean visible = false
integer x = 311
integer y = 76
integer width = 494
integer height = 360
integer taborder = 30
string dataobject = "d_descargos_hist_imp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_7106_consulta_historicos
integer x = 1600
integer y = 1744
integer width = 393
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_descargo
string ls_titulo, ls_observaciones
long ll_longitud

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Descargo'
ll_longitud = len (ls_titulo)*100
dw_3.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_3.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_3.getchild ("d_solicitud",dwc_descargo)
tab_1.tabpage_1.dw_descargo.sharedata(dwc_descargo)
lst_impresion.pa_todos[1]=tab_1.tabpage_1.dw_descargo
lst_impresion.pa_nombres[1]='d_solicitud'

// GNU 23-3-2007. Incidencia 0/495995
dw_3.object.inst_descargar_t.text = tab_1.tabpage_instalaciones.mle_observaciones.text
ls_observaciones = tab_1.tabpage_1.dw_descargo.object.obs_solicitado[1]
dw_3.modify("obs_t.Text = '" + ls_observaciones + "'")
// FIN GNU


lst_impresion.total = 1
//IF d_lista_brigada.RowCount() = 0 THEN
//	gnv_msg.f_mensaje( "AB02","","",OK!)
//	return
//END IF
//tab_1.tabpage_1.dw_2.SetTransObject(SQLCA)

//lst_impresion.pdw_datawindow = dw_1
//lst_impresion.pdw_lista = d_lista_brigada
lst_impresion.pdw_compuesto = dw_3
lst_impresion.compuesto = true
lst_impresion.zoom = 100
gf_impresion_preliminar (lst_impresion, True, 0)

	
	

end event

type tab_1 from tab within w_7106_consulta_historicos
event create ( )
event destroy ( )
integer x = 14
integer y = 40
integer width = 3451
integer height = 1672
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_otros tabpage_otros
tabpage_2 tabpage_2
tabpage_int_simulacion tabpage_int_simulacion
tabpage_historial tabpage_historial
tabpage_instalaciones tabpage_instalaciones
tabpage_accion tabpage_accion
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_otros=create tabpage_otros
this.tabpage_2=create tabpage_2
this.tabpage_int_simulacion=create tabpage_int_simulacion
this.tabpage_historial=create tabpage_historial
this.tabpage_instalaciones=create tabpage_instalaciones
this.tabpage_accion=create tabpage_accion
this.Control[]={this.tabpage_1,&
this.tabpage_otros,&
this.tabpage_2,&
this.tabpage_int_simulacion,&
this.tabpage_historial,&
this.tabpage_instalaciones,&
this.tabpage_accion}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_otros)
destroy(this.tabpage_2)
destroy(this.tabpage_int_simulacion)
destroy(this.tabpage_historial)
destroy(this.tabpage_instalaciones)
destroy(this.tabpage_accion)
end on

event selectionchanging;//datetime inicio_sol, final_sol, inicio, final, solicitado, d_aprobado
//string ls_obs_solicitud
//
//if double_click = false then
//      
//              if ii_accion = 1 then
//                      tab_1.tabpage_1.dw_descargo.AcceptText()
//              
//                      //Toma el campo observaciones solicitud fecha inicio, y fecha final para evaluacion
//                      ls_obs_solicitud = tab_1.tabpage_1.dw_descargo.getitemstring(1,"obs_solicitud")
//                      inicio_sol = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_ini_solicitado")
//                      final_sol = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_fin_solicitado")
//                      solicitado = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_solicitado")
//                      
//                      d_aprobado = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_aprobado") 
//                      if d_aprobado > datetime(today(),now()) then
//                              gnv_msg.f_mensaje("AD10","","",Ok!)
//                              //messagebox("Error","La fecha de Aprobaci$$HEX1$$f300$$ENDHEX$$n es superior a la actual")
//                              return 1
//                      end if
//                      if isnull(d_aprobado) then
//                              tab_1.tabpage_1.dw_descargo.setitem(1,"estado",1)
//                      else
//                              tab_1.tabpage_1.dw_descargo.setitem(1,"estado",3)
//                      end if
//                      tab_1.tabpage_1.dw_descargo.accepttext()
//                      
//                      
//                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.st_3.text = string(inicio_sol, 'dd/mm/yyyy hh:mm')
//                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.st_5.text = string (final_sol, 'dd/mm/yyyy hh:mm')
//              
//                      if oldindex = 1 then
//              
//              
//                                      
//                                      if isnull(inicio_sol) then
//                                              gnv_msg.f_mensaje("ED06","","",Ok!)
//                                              //messagebox("Error","La fecha de inicio de la solicitud no es valida")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//                                      
//                                      if isnull(final_sol) then
//                                              gnv_msg.f_mensaje("ED07","","",Ok!)
//                                              //messagebox("Error","La fecha de fin de la solicitud no es valida")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//                      
//                                      if isnull(solicitado) then
//                                              gnv_msg.f_mensaje("ED08","","",Ok!)
//                                              //messagebox("Error","La fecha de solicitud no es valida")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//                      
//                      
//                                      if final_sol < inicio_sol then
//                                              gnv_msg.f_mensaje("ED09","","",Ok!)
//                                              //messagebox("Error","La fecha final de la solicitud es menor que la fecha inicial de la solicitud")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//                                      
//                                      if solicitado > inicio_sol then
//                                              gnv_msg.f_mensaje("ED10","","",Ok!)
//                                              //messagebox("Error","La fecha final de inicio de la solicitud es menor que la fecha de solicitud")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//              
//              
//                                      if solicitado > final_sol then
//                                              gnv_msg.f_mensaje("ED11","","",Ok!)
//                                              //messagebox("Error","La fecha final de la solicitud es menor que la fecha de la solicitud")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//              
//                                      
//                                      if final_sol = inicio_sol then
//                                              gnv_msg.f_mensaje("ED12","","",Ok!)
//                                              //messagebox("Error","Las fechas inicio y final de la solicitud no pueden ser iguales")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//                              
//                                      if trim(ls_obs_solicitud) = "" or isnull(ls_obs_solicitud) then
//                                              gnv_msg.f_mensaje("ED13","","",Ok!)
//                                              //messagebox("Error","La observaciones de la solicitud no puede estar en blanco")
//                                              w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.setfocus()
//                                              return 1
//                                      end if
//              
//                      end if
//                      
//                      if oldindex = 2 then
//                              if w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.rowcount() < 1 then
//                                      return
//                              end if
//                              inicio = w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.getitemdatetime(1,"f_inicio")
//                              final = w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.getitemdatetime(1,"f_fin")
//              
//                              if inicio < inicio_sol then
//                                      gnv_msg.f_mensaje("ED14","","",Ok!)
//                                      //messagebox("Error","El inicio de la interrupcion es menor que el inicio solitado")
//                                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.setfocus()
//                                      return 1
//                              end if
//                              
//                              if final > final_sol then
//                                      gnv_msg.f_mensaje("ED15","","",Ok!)
//                                      //messagebox("Error","El final de la interrupcion es mayor que el final solitado")
//                                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.setfocus()  
//                                      return 1
//                              end if
//                              
//                              if final < inicio then
//                                      gnv_msg.f_mensaje("ED16","","",Ok!)
//                                      //messagebox("Error","El inicio de la interrupcion es mayor que el final de la interrupcion")
//                                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.setfocus()  
//                                      return 1
//                              end if
//                              
//              //              if isnull(inicio) then
//              //                      messagebox("Error","La fecha inicio de la interrupcion no es valida")
//              //                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.setfocus()  
//              //                      return 1
//              //              end if
//                              
//              //              if isnull(final) then
//              //                      messagebox("Error","La fecha final de la interrupcion no es valida")
//              //                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.setfocus()  
//              //                      return 1
//              //              end if
//                              
//                              if final = inicio then
//                                      gnv_msg.f_mensaje("ED17","","",Ok!)
//                                      //messagebox("Error","Las fechas de la interrupcion no pueden ser iguales")
//                                      w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.setfocus()  
//                                      return 1
//                              end if
//                              
//                      end if
//              
//              end if
//              
//      end if
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3415
integer height = 1544
long backcolor = 79741120
string text = "Descargo"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "descargo.bmp"
long picturemaskcolor = 553648127
dw_descargo dw_descargo
dw_2 dw_2
gb_6 gb_6
end type

on tabpage_1.create
this.dw_descargo=create dw_descargo
this.dw_2=create dw_2
this.gb_6=create gb_6
this.Control[]={this.dw_descargo,&
this.dw_2,&
this.gb_6}
end on

on tabpage_1.destroy
destroy(this.dw_descargo)
destroy(this.dw_2)
destroy(this.gb_6)
end on

type dw_descargo from uo_7002_pr_mante_solicitud within tabpage_1
integer x = 151
integer y = 284
integer width = 2619
integer height = 888
integer taborder = 13
string dataobject = "d_7002_mante_solicitud_historico"
end type

event retrieveend;call super::retrieveend;string setting
long ll_newrow, ll_dias, ll_resto, ll_horas, ll_minutos, ll_interrumpido
long ll_nro_instalacion
string ls_nom_instalacion
long ll_handle
treeviewitem le_elemento
long ll_numero
long ll_nro_descargo
long ll_cantidad
long ll_nro_ins
string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"
string ls_nom_ins, ls_tiempo
s_rama s_estructura
datetime ld_inicio, ld_fin,inicio_sol, final_sol, dt_ini, dt_fin

int li_subfamilia, li_familia, li_gpo_causa
string ls_descripcion

if lu_comunic.is_comunic.strval6 = "lista_descargos" then
    if this.rowcount() = 0 then return    
        Setpointer(HourGlass!)
		    
        inicio_sol = this.getitemdatetime(1,"f_ini_solicitado")
        final_sol = this.getitemdatetime(1,"f_fin_solicitado")
        w_7106_consulta_historicos.tab_1.tabpage_2.st_3.text = string(inicio_sol, 'dd/mm/yyyy hh:mm')
        w_7106_consulta_historicos.tab_1.tabpage_2.st_5.text = string (final_sol, 'dd/mm/yyyy hh:mm')
        ll_nro_descargo = this.getItemnumber(1,"nro_descargo")
        il_nro_inst_padre = gu_comunic.is_comunic.decval1
		  w_7106_consulta_historicos.tab_1.tabpage_2.st_1.enabled = false
        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.modify("f_inicio.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.modify("f_inicio.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.modify("f_fin.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.modify("f_fin.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.enabled = false
        
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("estado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("estado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("id_enviado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("id_enviado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_activado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_activado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("tipo_descargo.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("tipo_descargo.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_solicitado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_solicitado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_ini_solicitado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_ini_solicitado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_fin_solicitado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_fin_solicitado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("obs_solicitud.Edit.DisplayOnly='Yes'")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("obs_solicitud.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_aprobado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_aprobado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_ini_aprobado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_ini_aprobado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_fin_aprobado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("f_fin_aprobado.background.color="+gs_gris)
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("obs_aprobado.protect = 1")
        w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.modify("obs_aprobado.background.color="+gs_gris)

        

if dw_descargo.getitemnumber(1,"estado") = fgci_descargo_modificado then
        setting = dw_descargo.Describe("t_aprobado.Text")
        dw_descargo.Modify("t_aprobado.Text='Modificaci$$HEX1$$f300$$ENDHEX$$n'")
        setting = dw_descargo.Describe("cf_aprobado_t.Text")
        dw_descargo.Modify("cf_aprobado_t.Text='Modificado'")
        setting = dw_descargo.Describe("cf_ini_aprobado_t.Text")
        dw_descargo.Modify("cf_ini_aprobado_t.Text='Inicio Modificado'")
        setting = dw_descargo.Describe("cf_fin_aprobado_t.Text")
        dw_descargo.Modify("cf_fin_aprobado_t.Text='Fin Modificado'")
end if
        
if dw_descargo.getitemnumber(1,"estado") = fgci_descargo_rechazado then
        setting = dw_descargo.Describe("t_aprobado.Text")
        dw_descargo.Modify("t_aprobado.Text='Rechazado'")
        setting = dw_descargo.Describe("cf_aprobado_t.Text")
        dw_descargo.Modify("cf_aprobado_t.Text='Rechazado'")
        setting = dw_descargo.Describe("cf_ini_aprobado_t.Text")
        dw_descargo.Modify("cf_ini_aprobado_t.Text='Inicio Rechazado'")
        setting = dw_descargo.Describe("cf_fin_aprobado_t.Text")
        dw_descargo.Modify("cf_fin_aprobado_t.Text='Fin rechazado'")
end if
        
        
end if        
        
        
        
////______DSA INI 03/04/2000			
//long ll_ind_interrupcion
//u_desc_2030_rn_filtro_descargo	lu_desc_const
//
//lu_desc_const = Create u_desc_2030_rn_filtro_descargo;
//
//ll_ind_interrupcion = w_7106_consulta_historicos.tab_1.tabpage_1.dw_descargo.object.ind_interrupcion[1]
//if ll_ind_interrupcion = lu_desc_const.sin_interrupcion then
//		w_7106_consulta_historicos.tab_1.SetRedraw(FALSE)
//		w_7106_consulta_historicos.tab_1.tabpage_2.Visible = FALSE		
//		w_7106_consulta_historicos.tab_1.SetRedraw(TRUE)
//		Destroy (lu_desc_const)	
//		return
//else
//	fw_deshabilita_tab_interrupciones()
//end if	
//Destroy (lu_desc_const)	

ll_nro_ins= this.getitemnumber(1,"nro_instalacion")
il_nro_descargo = this.getitemnumber(1,"nro_descargo")
//
//Recupera el nombre de la inst de los descargos
fw_descargo_en_historico(ll_nro_descargo)

IF ib_descargo_en_historico THEN
   tab_1.tabpage_2.dw_1.Dataobject = 'dw_descargo_hist'
ELSE
   tab_1.tabpage_2.dw_1.Dataobject = 'dw_descargo'
END IF

tab_1.tabpage_2.dw_1.settransobject(sqlca)
tab_1.tabpage_2.dw_1.retrieve(il_nro_descargo)


int i
i = tab_1.tabpage_2.dw_1.rowcount()

SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
INTO :ls_nom_ins  
FROM "SGD_INSTALACION"  
WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_ins   
		AND ( "SGD_INSTALACION"."BDI_JOB" = 0 );  // DSA 10/01/2000			
	 
IF ib_descargo_en_historico THEN
	 // Conprueba el total del tiempo de interrupcion
	 
		SELECT min(f_inicio),max(f_fin)  
		 INTO :dt_ini, :dt_fin
		 FROM "GI_HIST_INTERRUPCION_DESCARGOS"  
		WHERE "GI_HIST_INTERRUPCION_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo ;
   
ELSE
	 // Conprueba el total del tiempo de interrupcion
	 
		SELECT min(f_inicio),max(f_fin)  
		 INTO :dt_ini, :dt_fin
		 FROM "SGD_INTERRUPCION_DESCARGO"  
		WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :il_nro_descargo ;
	
END IF

ll_interrumpido = fg_duracion_minutos(dt_ini,dt_fin) 

ll_dias = ll_interrumpido / 1440
ll_resto = mod(ll_interrumpido, 1440)
ll_horas = ll_resto / 60
ll_resto = mod(ll_resto, 60)
ll_minutos = ll_resto 


if ll_dias = 1 then ls_dias = " Dia"
if ll_horas = 1 then ls_horas = " Hora"
if ll_minutos = 1 then ls_minutos = " Minuto"
		 
if ll_dias > 0 then
		 
		 ls_tiempo = string(ll_dias) + ls_dias
		 
end if
if ll_horas > 0 then
		 
		 ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
		 
end if
if ll_minutos > 0 then

		 ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
		 
end if

tab_1.tabpage_2.st_6.text = ls_tiempo


tab_1.tabpage_2.st_2.text=ls_nom_ins  

fw_inst_descargo()

// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Colombia. 12/07/2005.
//If gi_pais = 7 or gi_pais = 9 Then
If fg_verifica_parametro("Causa en descargos.") then
	Int li_cod_causa
	String ls_desc_causa

	li_cod_causa = This.getitemnumber(1,"cod_causa")

	SELECT "GI_CAUSA"."DESCRIPCION"  
	 INTO :ls_desc_causa  
	 FROM "GI_CAUSA"  
	 WHERE "GI_CAUSA"."COD_CAUSA" = :li_cod_causa ;
	 
		// GNU 12-9-2007. Incidencia 0/525907
	IF fg_verifica_parametro('CAUSAS') THEN
		
			select gpo_causa,tipo, subtipo
			into :li_gpo_causa, :li_familia, :li_subfamilia 
			from gi_causa 
			where cod_causa = :li_cod_causa ;

	
	  SELECT "GI_SUBTIPOS"."DESCRIPCION" ||'-'|| "GI_SUBTIPO_CAUSA"."DESCRIPCION" 
	  into :ls_descripcion
    FROM "GI_SUBTIPOS",   
         "GI_SUBTIPO_CAUSA"
   WHERE ( "GI_SUBTIPOS"."TIPO" = "GI_SUBTIPO_CAUSA"."TIPO" ) and  
         ( "GI_SUBTIPOS"."SUBTIPO" = "GI_SUBTIPO_CAUSA"."SUBTIPO" ) 
		 AND "GI_SUBTIPO_CAUSA"."SUBTIPO"= :li_subfamilia 
		 AND "GI_SUBTIPO_CAUSA"."TIPO"= :li_familia
		 AND "GI_SUBTIPO_CAUSA"."GPO_CAUSA"=:li_gpo_causa;
		 ls_desc_causa= ls_descripcion + "-" + ls_desc_causa
		 //AHM(19/11/2007)
//		 tab_1.tabpage_2.st_causa.TEXTSIZE=3
	end if 

	tab_1.tabpage_2.st_causa.Text = ls_desc_causa
End If
// Fin. Sgo.

end event

event constructor;call super::constructor;// Parametrizacion: Luis Ortiz Mayo/2001

fg_ventana_parametro("identificador", This)
end event

type dw_2 from datawindow within tabpage_1
boolean visible = false
integer x = 306
integer y = 224
integer width = 1170
integer height = 800
integer taborder = 20
string dataobject = "d_descargos_imp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_6 from groupbox within tabpage_1
integer x = 91
integer y = 140
integer width = 2729
integer height = 1152
integer taborder = 32
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informaci$$HEX1$$f300$$ENDHEX$$n Descargo"
end type

type tabpage_otros from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3415
integer height = 1544
long backcolor = 79741120
string text = "    Otros"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom072!"
long picturemaskcolor = 553648127
dw_descargo_otros dw_descargo_otros
end type

on tabpage_otros.create
this.dw_descargo_otros=create dw_descargo_otros
this.Control[]={this.dw_descargo_otros}
end on

on tabpage_otros.destroy
destroy(this.dw_descargo_otros)
end on

type dw_descargo_otros from datawindow within tabpage_otros
integer x = 247
integer y = 132
integer width = 2857
integer height = 1184
integer taborder = 21
string dataobject = "d_7004_datos_solicitud_param_consulta"
boolean border = false
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3415
integer height = 1544
long backcolor = 79741120
string text = " Interrupcion"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Incorpor.bmp"
long picturemaskcolor = 553648127
st_causa st_causa
st_cxt_t st_cxt_t
st_cxt st_cxt
st_pxt st_pxt
st_pxt_t st_pxt_t
st_clientes_afec st_clientes_afec
st_11 st_11
st_pot_afec st_pot_afec
st_10 st_10
st_9 st_9
st_6 st_6
st_1 st_1
st_8 st_8
st_7 st_7
st_5 st_5
st_3 st_3
st_2 st_2
tv_1 tv_1
dw_instalaciones dw_instalaciones
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
gb_causa gb_causa
dw_1 dw_1
st_4 st_4
end type

on tabpage_2.create
this.st_causa=create st_causa
this.st_cxt_t=create st_cxt_t
this.st_cxt=create st_cxt
this.st_pxt=create st_pxt
this.st_pxt_t=create st_pxt_t
this.st_clientes_afec=create st_clientes_afec
this.st_11=create st_11
this.st_pot_afec=create st_pot_afec
this.st_10=create st_10
this.st_9=create st_9
this.st_6=create st_6
this.st_1=create st_1
this.st_8=create st_8
this.st_7=create st_7
this.st_5=create st_5
this.st_3=create st_3
this.st_2=create st_2
this.tv_1=create tv_1
this.dw_instalaciones=create dw_instalaciones
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_causa=create gb_causa
this.dw_1=create dw_1
this.st_4=create st_4
this.Control[]={this.st_causa,&
this.st_cxt_t,&
this.st_cxt,&
this.st_pxt,&
this.st_pxt_t,&
this.st_clientes_afec,&
this.st_11,&
this.st_pot_afec,&
this.st_10,&
this.st_9,&
this.st_6,&
this.st_1,&
this.st_8,&
this.st_7,&
this.st_5,&
this.st_3,&
this.st_2,&
this.tv_1,&
this.dw_instalaciones,&
this.gb_4,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.gb_causa,&
this.dw_1,&
this.st_4}
end on

on tabpage_2.destroy
destroy(this.st_causa)
destroy(this.st_cxt_t)
destroy(this.st_cxt)
destroy(this.st_pxt)
destroy(this.st_pxt_t)
destroy(this.st_clientes_afec)
destroy(this.st_11)
destroy(this.st_pot_afec)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_6)
destroy(this.st_1)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.tv_1)
destroy(this.dw_instalaciones)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_causa)
destroy(this.dw_1)
destroy(this.st_4)
end on

type st_causa from statictext within tabpage_2
boolean visible = false
integer x = 1627
integer y = 932
integer width = 1198
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean focusrectangle = false
end type

type st_cxt_t from statictext within tabpage_2
integer x = 1550
integer y = 516
integer width = 997
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Clientes x Tiempo (Clientes x Hora)"
boolean focusrectangle = false
end type

type st_cxt from statictext within tabpage_2
integer x = 2546
integer y = 516
integer width = 375
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type st_pxt from statictext within tabpage_2
integer x = 2469
integer y = 440
integer width = 375
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type st_pxt_t from statictext within tabpage_2
integer x = 1550
integer y = 440
integer width = 919
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Potencia x Tiempo (KVA x Hora)"
boolean focusrectangle = false
end type

type st_clientes_afec from statictext within tabpage_2
boolean visible = false
integer x = 2720
integer y = 364
integer width = 334
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type st_11 from statictext within tabpage_2
boolean visible = false
integer x = 2322
integer y = 364
integer width = 398
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Clientes Afec."
boolean focusrectangle = false
end type

type st_pot_afec from statictext within tabpage_2
boolean visible = false
integer x = 1957
integer y = 364
integer width = 352
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_2
boolean visible = false
integer x = 1550
integer y = 364
integer width = 411
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Potencia Afec."
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_2
integer x = 1550
integer y = 288
integer width = 731
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Tiempo Interrupci$$HEX1$$f300$$ENDHEX$$n Total"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_2
integer x = 2277
integer y = 288
integer width = 768
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_2
event clicked pbm_bnclicked
integer x = 1559
integer y = 636
integer width = 663
integer height = 76
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Mano.cur"
long backcolor = 67108864
string text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Descargo "
boolean focusrectangle = false
end type

event clicked;//Paso al objeto generico de comunicaciones el centro, cmd y mesa del usuario

if dw_1.rowcount() > 0 then
        gnv_msg.f_mensaje("ED29","","",Ok!)
//      messagebox("Error","Debe desmarcar las interrupciones")
        return
end if

tv_1.deleteitem(0)
st_2.text = ""
st_4.text = ""
gu_comunic.is_comunic.intval1=gi_nro_centro
gu_comunic.is_comunic.intval2=gi_nro_cmd
gu_comunic.is_comunic.intval3=gi_nro_puesto

//gu_comunic.is_comunic.intval4 = Criterio de Seleccion
        // 1 Solo para Centro,cmd y puesto solicitado
        // 2 Solo para el centro y cmd solicitado , trayendo todos los puestos
        // 3 Solo para el centro solicitado,trayendo todos los cmd y puestos del centro
        // otro para todos los centros
        
IF gb_usuario_mant THEN 
        gu_comunic.is_comunic.intval4 = 1 
ELSEIF gb_operador_cmd THEN 
        gu_comunic.is_comunic.intval4 = 2  
ELSE
        gu_comunic.is_comunic.intval4 = 4
end if

open(w_2120_identificacion_instalacion)

ll_apertura = 1

//Contruyo el arbol
tv_1.triggerevent('ue_cargar')

end event

type st_8 from statictext within tabpage_2
integer x = 1550
integer y = 212
integer width = 475
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Final Solicitado"
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_2
integer x = 1550
integer y = 136
integer width = 475
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Inicio Solicitado"
long bordercolor = 79741120
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_2
integer x = 2025
integer y = 212
integer width = 590
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean border = true
long bordercolor = 67108864
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_2
integer x = 2025
integer y = 136
integer width = 590
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean border = true
long bordercolor = 67108864
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_2
integer x = 1627
integer y = 724
integer width = 1198
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type tv_1 from uo_man_instalac within tabpage_2
event ue_cargar ( )
event doubleclicked pbm_tvndoubleclicked
event selectionchanged pbm_tvnselchanged
event ue_asigna ( )
event ue_desasigna ( )
integer x = 128
integer y = 132
integer width = 1115
integer height = 1212
integer taborder = 11
long textcolor = 33554432
long backcolor = 79741120
boolean linesatroot = true
string picturename[] = {"SUBEST.bmp","Sal_tra1.bmp","CT1.bmp","TRANSFOR.bmp","SALBAJ.bmp"}
integer ii_icono_trafo_pot_at_ind_oi = 100
integer ii_icono_banco_at_ind_oi = 200
integer ii_int_cabecera_at_ind_oi = 300
integer ii_icono_barra_mt_ind_oi = 500
integer ii_icono_celda_mt_ind_oi = 32628
integer ii_icono_interruptor_mt_ind_oi = 32628
integer ii_icono_int_cabecera_mt_ind_oi = 32628
integer ii_icono_banco_mt_ind_oi = 32628
integer ii_icono_sal_mt_mod = 32628
integer ii_icono_subestacion_mod = 32628
integer ii_icono_transformador_mod = 32628
integer ii_icono_sal_bt_mod = 32628
integer ii_icono_ct_mod = 32628
integer ii_icono_cr_mod = 32628
integer ii_icono_subestacion_alta_int = 32628
integer ii_icono_sal_mt_int = 32628
integer ii_icono_subestacion_int = 32628
integer ii_icono_transformador_int = 32628
integer ii_icono_sal_bt_int = 32628
integer ii_icono_sal_at_int = 32628
integer ii_icono_ct_int = 32628
integer ii_icono_cr_int = 32628
integer ii_icono_subramal_int = 32628
integer ii_icono_subestacion_alta_rep = 32628
integer ii_icono_sal_mt_rep = 32628
integer ii_icono_subestacion_rep = 32628
integer ii_icono_transformador_rep = 32628
integer ii_icono_sal_bt_rep = 32628
integer ii_icono_sal_at_rep = 32628
integer ii_icono_ct_rep = 32628
integer ii_icono_cr_rep = 32628
integer ii_icono_subramal_rep = 32628
integer ii_aviso_alumbrado_publico = 32628
integer ii_aviso_con_alimentacion = 32676
integer ii_aviso_de_ayuda = 32676
integer ii_aviso_sin_alimentacion = 32676
integer ii_aviso_de_calidad = 32676
integer ii_aviso_de_calidad_sin_alim = 32676
integer ii_aviso_de_calidad_con_alim = 32676
integer ii_cmd = 32676
integer ii_instalaciones_modificadas = 32676
integer ii_instalaciones_interrumpidas = 32676
integer ii_instalaciones_repuestas = 32676
integer ii_cmd_padre = 32676
integer ii_instalaciones_at = 32676
integer ii_instalaciondes_indisponibles = 32676
integer ii_instalaciones_indisponibles_oi = 32676
end type

event ue_cargar;//long ll_nro_instalacion
//string ls_nom_instalacion
//long ll_handle
//treeviewitem le_elemento
//long ll_numero
//long ll_nro_descargo
//Setpointer(HourGlass!)
//
//if gu_comunic1.is_comunic.decval1 = 0 then return
//
//il_nro_inst_padre = gu_comunic1.is_comunic.decval1
//
//parent.setredraw(false)
// DECLARE cu_arbol1 CURSOR FOR  
//  SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
//                 "SGD_INSTALACION"."NRO_INSTALACION"  
//    FROM "SGD_INSTALACION" 
//WHERE  "NRO_INSTALACION" =  :gu_comunic1.is_comunic.decval1 ;
//dw_1.visible = true 
//open cu_arbol1 ;
//fetch cu_arbol1 into  :ls_nom_instalacion, :ll_nro_instalacion;
//      ll_handle = tv_1.insertitemsort(0,ls_nom_instalacion,icono_arbol(ll_nro_instalacion))
//      tab_1.tabpage_2.tv_1.getitem(ll_handle, le_elemento)
//      s_elemento.codigo = ll_nro_instalacion
//      le_elemento.data = s_elemento
//      tab_1.tabpage_2.tv_1.setitem(ll_handle, le_elemento)
//close cu_arbol1;
//
//DECLARE cu_arbol2 CURSOR FOR  
//SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
//                "SGD_INSTALACION"."NRO_INSTALACION"  
//    FROM "SGD_INSTALACION" 
//WHERE "NRO_INST_PADRE" =  :ll_nro_instalacion ;
//       
//open cu_arbol2 ;
//fetch cu_arbol2 into  :ls_nom_instalacion, :ll_nro_instalacion;
//do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
//      ll_handle = tv_1.insertitemsort(1,ls_nom_instalacion,icono_arbol(ll_nro_instalacion))
//      tab_1.tabpage_2.tv_1.getitem(ll_handle, le_elemento)
//      s_elemento.codigo = ll_nro_instalacion
//      le_elemento.data = s_elemento
//      tab_1.tabpage_2.tv_1.setitem(ll_handle, le_elemento)
//      fetch cu_arbol2 into  :ls_nom_instalacion, :ll_nro_instalacion ;
//loop
//close cu_arbol2;
//
//ll_nro_descargo = w_7102_mantenimiento_descargos.     tab_1.tabpage_1.dw_descargo.getItemnumber(1,"nro_descargo")
//dw_1.retrieve(ll_nro_descargo)
//tv_1.selectitem(1)
//parent.setredraw(true)
//
end event

event selectionchanged;treeviewitem le_elemento
sw_rama sl_rama
tab_1.tabpage_2.dw_1.visible = false

this.getitem(newhandle,le_elemento)

if le_elemento.bold = true then
        sl_rama = le_elemento.data
        tab_1.tabpage_2.dw_1.scrolltorow(sl_rama.fila)
        
        datetime inicio, final, inicio_sol, final_sol
        long ll_interrumpido
        long ll_horas, ll_minutos, ll_dias, ll_resto
        string ls_tiempo
        string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"

        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.AcceptText()
        
        if dw_1.rowcount() < 1 then
                return
        end if
        
        inicio = tab_1.tabpage_2.dw_1.getitemdatetime(tab_1.tabpage_2.dw_1.getrow(),"f_inicio")
        final = tab_1.tabpage_2.dw_1.getitemdatetime(tab_1.tabpage_2.dw_1.getrow(),"f_fin")
        
        st_4.text = ""
        
        if isnull(inicio) or isnull(final) then
                return
        end if
        
        ll_interrumpido = fg_duracion_minutos(inicio,final)
        
        ll_dias = ll_interrumpido / 1440
        ll_resto = mod(ll_interrumpido, 1440)
        ll_horas = ll_resto / 60
        ll_resto = mod(ll_resto, 60)
        ll_minutos = ll_resto 

        
        if ll_dias = 1 then ls_dias = " Dia"
        if ll_horas = 1 then ls_horas = " Hora"
        if ll_minutos = 1 then ls_minutos = " Minuto"
                
        if ll_dias > 0 then
                
                ls_tiempo = string(ll_dias) + ls_dias
                
        end if
        if ll_horas > 0 then
                
                ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
                
        end if
        if ll_minutos > 0 then
        
                ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
                
        end if
        
        st_4.text = ls_tiempo
        
        st_4.visible = true
        
        tab_1.tabpage_2.dw_1.visible = true
else
	     st_4.visible = false
        
        tab_1.tabpage_2.dw_1.visible = false

end if
        




//treeviewitem le_elemento
//long ll_longitud, ll_codigo,ll_nro_instalacion, ll_fila
//long ll_interrumpido, ll_dias, ll_resto, ll_horas, ll_minutos
//string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos", ls_tiempo
//datetime inicio, final
//il_handle = newhandle
//s_rama s_estructura
//
//
//st_2.text = ""
//st_4.text = ""
//
//tab_1.tabpage_2.setredraw(false)
//tab_1.tabpage_2.tv_1.getitem(newhandle,le_elemento)
//
//s_estructura = le_elemento.data
//ll_codigo = s_estructura.codigo
//
//if le_elemento.bold = true then
//      ll_longitud = len(le_elemento.label)
//      st_2.text = Trim(left(le_elemento.label, ll_longitud - 1))
//else
//      st_2.text = le_elemento.label
//end if
//
//
////Si se ha cargado de una datawindow o se ha cargado de la tabla
//
//ll_fila = s_estructura.fila 
////if ll_fila < 1 then
////    ll_fila =       dw_1.find("cod_instalacion = " + string(ll_codigo),1, dw_1.rowcount())
////end if
//
//if ll_fila = 0 then
//      dw_1.visible = false
//else
//              dw_1.visible = true
//              dw_1.ScrollToRow(ll_fila)
//              inicio = dw_1.getitemdatetime(ll_fila,"f_inicio")
//              final = dw_1.getitemdatetime(ll_fila,"f_fin")
//
//              ll_interrumpido = fg_duracion_minutos(inicio,final)
//              
//              ll_dias = ll_interrumpido / 1440
//              ll_resto = mod(ll_interrumpido, 1440)
//              ll_horas = ll_resto / 60
//              ll_resto = mod(ll_resto, 60)
//              ll_minutos = ll_resto // 60
////            ll_resto = mod(ll_resto, 60)
//              
//              if ll_dias = 1 then ls_dias = " Dia"
//              if ll_horas = 1 then ls_horas = " Hora"
//              if ll_minutos = 1 then ls_minutos = " Minuto"
//                              
//              if ll_dias > 0 then
//                      
//                      ls_tiempo = string(ll_dias) + ls_dias
//                      
//              end if
//              if ll_horas > 0 then
//                      
//                      ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
//                      
//              end if
//              if ll_minutos > 0 then
//              
//                      ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
//                      
//              end if
//                      
//              st_4.text = ls_tiempo
//
//end if
//
//tab_1.tabpage_2.setredraw(true)
//
end event

event ue_asigna;//TreeviewItem le_elemento
//long ll_newrow
//s_rama s_estructura
//
//tv_1.getitem(il_handle, le_elemento)
//
//le_elemento.bold = true
//le_elemento.label = le_elemento.label + "    X"
//s_estructura = le_elemento.data
//tab_1.tabpage_1.dw_descargo.accepttext()
//ll_newrow = dw_1.InsertRow(0) 
//
//
//dw_1.ScrollToRow(ll_newrow)
//dw_1.setitem(ll_newrow,"cod_instalacion",long(s_estructura.codigo))
//dw_1.setitem(ll_newrow,"nro_descargo",tab_1.tabpage_1.dw_descargo.getitemnumber(1,"nro_descargo"))
//dw_1.setitem(ll_newrow,"f_alta",today())
//dw_1.setitem(ll_newrow,"programa",'DESCARGOS')
//dw_1.setitem(ll_newrow,"usuario",gs_usuario)
//tab_1.tabpage_1.dw_descargo.setitem(ll_newrow,"sgd_descargos_cod_inst_origen",il_nro_inst_padre)
//dw_1.visible = true
//s_estructura.fila = ll_newrow
//le_elemento.data = s_estructura
//tv_1.setitem(il_handle, le_elemento)
//dw_1.setfocus()
//
//
//w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_aprobado.protect = 0")
//w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_aprobado.background.color="+gs_blanco)
//w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("id_enviado.protect = 0")
//
////w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_ini_aprobado.protect = 0")
////w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_ini_aprobado.background.color="+gs_blanco)
////
////
////w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_fin_aprobado.protect = 0")
////w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_fin_aprobado.background.color="+gs_blanco)
////
//
//w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("obs_aprobado.protect = 0")
//w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("obs_aprobado.background.color="+gs_blanco)
//      
//
//
//
end event

event ue_desasigna;//TreeviewItem le_elemento
//long ll_longitud
//s_rama s_estructura
//
//st_2.text = ""
//st_4.text = ""
//tv_1.getitem(il_handle, le_elemento)
//le_elemento.bold = false
//s_estructura = le_elemento.data 
//ll_longitud = len(le_elemento.label)
//dw_1.deleterow(dw_1.getrow())
//s_estructura.fila = 0
//le_elemento.label = Trim(left(le_elemento.label, ll_longitud - 1))
//le_elemento.data = s_estructura
//tv_1.setitem(il_handle, le_elemento)
//dw_1.visible = false
end event

event rightclicked;//TreeviewItem le_elemento
//il_handle = handle
//if handle = 0 then return
//long ll_rama = 2
//
//if lu_comunic.is_comunic.strval6 = "lista_descargos" then return
//
//
//tv_1.getitem(handle,le_elemento)
//
//m_7102_mantenimiento_descargos NewMenu
//
//NewMenu = CREATE m_7102_mantenimiento_descargos
//
//if le_elemento.bold = true then
//      m_7102_mantenimiento_descargos.m_asigna.enabled = false
//else
//      m_7102_mantenimiento_descargos.m_desasigna.enabled = false
//end if
//
//tv_1.getitem(1,le_elemento)
//
//if handle > 1 and le_elemento.bold = true then
//      m_7102_mantenimiento_descargos.m_asigna.enabled = false
//end if
//
////Busca algun hijo que este activado
//
//if handle = 1 then
//      do while getitem(ll_rama,le_elemento) > 0
//              if le_elemento.bold = true then
//                      m_7102_mantenimiento_descargos.m_asigna.enabled = false
//                      exit
//              else
//                      ll_rama ++
//              end if
//      loop
//end if        
//
//m_7102_mantenimiento_descargos.PopMenu(PointerX(), PointerY())
end event

event selectionchanging;//if il_error = 1 then return 1
end event

type dw_instalaciones from datawindow within tabpage_2
event ue_versuministros ( )
integer x = 146
integer y = 140
integer width = 1088
integer height = 1200
integer taborder = 21
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event ue_versuministros;//////////////////////////////////////
// VERSION UNIFICADA AMR 05/08/2002
//////////////////////////////////////

s_grupo_int sw_datos
long ll_fila

sw_datos.nro_instalacion = this.getitemNumber(il_row,'nro_instalacion')
// GNU 1-08-2005
sw_datos.nro_instalacion_int[1] =this.getitemNumber(il_row,'nro_instalacion')
// Fin GNU

if isnull(sw_datos.nro_instalacion) then
	sw_datos.nro_instalacion = 0
	sw_datos.nro_instalacion_int[1] = 0 // GNU 1-08-2005
end if
sw_datos.inicio[1] = tab_1.tabpage_2.dw_1.getitemdatetime(il_row,'f_inicio')

if sw_datos.nro_instalacion <> 0 then
	OpenWithParm(w_ver_sum_importantes, sw_datos)
else
	messagebox('AVISO', 'El codigo de la instalaci$$HEX1$$f300$$ENDHEX$$n no esta correcto revise la selecci$$HEX1$$f300$$ENDHEX$$n')
end if










end event

event clicked;long ll_nro_instalacion
sw_rama sl_rama
tab_1.tabpage_2.dw_1.visible = false

IF row > 0  then
	
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)


	ll_nro_instalacion = this.getitemNumber(row,'nro_instalacion')

	        
        datetime inicio, final, inicio_sol, final_sol
        long ll_interrumpido
        long ll_horas, ll_minutos, ll_dias, ll_resto
        string ls_tiempo
        string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"

        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.AcceptText()
        
        if dw_1.rowcount() < 1 then
                return
        end if
		  
		  tab_1.tabpage_2.dw_1.Retrieve(il_nro_descargo)
        inicio = tab_1.tabpage_2.dw_1.getitemdatetime(row,"f_inicio")
        final = tab_1.tabpage_2.dw_1.getitemdatetime(row,"f_fin")
        
        st_4.text = ""
        
        if isnull(inicio) or isnull(final) then
                return
        end if
        
		  
        ll_interrumpido = fg_duracion_minutos(inicio,final)
        
        ll_dias = ll_interrumpido / 1440
        ll_resto = mod(ll_interrumpido, 1440)
        ll_horas = ll_resto / 60
        ll_resto = mod(ll_resto, 60)
        ll_minutos = ll_resto 

        
        if ll_dias = 1 then ls_dias = " Dia"
        if ll_horas = 1 then ls_horas = " Hora"
        if ll_minutos = 1 then ls_minutos = " Minuto"
                
        if ll_dias > 0 then
                
                ls_tiempo = string(ll_dias) + ls_dias
                
        end if
        if ll_horas > 0 then
                
                ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
                
        end if
        if ll_minutos > 0 then
        
                ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
                
        end if
        
        st_4.text = ls_tiempo
      
        st_4.visible = true
        
        tab_1.tabpage_2.dw_1.visible = true
		  tab_1.tabpage_2.dw_1.object.f_inicio[1] = inicio
		  tab_1.tabpage_2.dw_1.object.f_fin[1] = final
		  tab_1.tabpage_2.dw_1.Accepttext()
else
	     st_4.visible = false
        
        tab_1.tabpage_2.dw_1.visible = false

end if
        




//treeviewitem le_elemento
//long ll_longitud, ll_codigo, ll_fila
//long  ll_dias, ll_resto, ll_horas, ll_minutos
//
//datetime inicio, final
//il_handle = newhandle
//s_rama s_estructura
//
//
//st_2.text = ""
//st_4.text = ""
//
//tab_1.tabpage_2.setredraw(false)
//tab_1.tabpage_2.tv_1.getitem(newhandle,le_elemento)
//
//s_estructura = le_elemento.data
//ll_codigo = s_estructura.codigo
//
//if le_elemento.bold = true then
//      ll_longitud = len(le_elemento.label)
//      st_2.text = Trim(left(le_elemento.label, ll_longitud - 1))
//else
//      st_2.text = le_elemento.label
//end if
//
//
////Si se ha cargado de una datawindow o se ha cargado de la tabla
//
//ll_fila = s_estructura.fila 
////if ll_fila < 1 then
////    ll_fila =       dw_1.find("cod_instalacion = " + string(ll_codigo),1, dw_1.rowcount())
////end if
//
//if ll_fila = 0 then
//      dw_1.visible = false
//else
//              dw_1.visible = true
//              dw_1.ScrollToRow(ll_fila)
//              inicio = dw_1.getitemdatetime(ll_fila,"f_inicio")
//              final = dw_1.getitemdatetime(ll_fila,"f_fin")
//
//              ll_interrumpido = fg_duracion_minutos(inicio,final)
//              
//              ll_dias = ll_interrumpido / 1440
//              ll_resto = mod(ll_interrumpido, 1440)
//              ll_horas = ll_resto / 60
//              ll_resto = mod(ll_resto, 60)
//              ll_minutos = ll_resto // 60
////            ll_resto = mod(ll_resto, 60)
//              
//              if ll_dias = 1 then ls_dias = " Dia"
//              if ll_horas = 1 then ls_horas = " Hora"
//              if ll_minutos = 1 then ls_minutos = " Minuto"
//                              
//              if ll_dias > 0 then
//                      
//                      ls_tiempo = string(ll_dias) + ls_dias
//                      
//              end if
//              if ll_horas > 0 then
//                      
//                      ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
//                      
//              end if
//              if ll_minutos > 0 then
//              
//                      ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
//                      
//              end if
//                      
//              st_4.text = ls_tiempo
//
//end if
//
//tab_1.tabpage_2.setredraw(true)
//
end event

event itemfocuschanged;datetime inicio, final

inicio = tab_1.tabpage_2.dw_1.getitemdatetime(row,"f_inicio")
final = tab_1.tabpage_2.dw_1.getitemdatetime(row,"f_fin")
tab_1.tabpage_2.dw_1.object.f_inicio[1] = inicio
tab_1.tabpage_2.dw_1.object.f_fin[1] = final
tab_1.tabpage_2.dw_1.Accepttext()
end event

event rbuttondown;/////////////////////////////////////
// VERSION UNIFICADA AMR 05/08/2002
/////////////////////////////////////


IF row > 0  then
	
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	
   il_row = row
	
   gs_ventana_llamante = 'w_7106_consulta_historicos'
	
	m_7106_mantenimiento_descargos NewMenu
	
	NewMenu = CREATE m_7106_mantenimiento_descargos
	
	m_7106_mantenimiento_descargos.PopMenu(w_7106_consulta_historicos.PointerX(), w_7106_consulta_historicos.PointerY())
	
ELSE
	Return
END IF





end event

type gb_4 from groupbox within tabpage_2
integer x = 114
integer y = 72
integer width = 1157
integer height = 1292
integer taborder = 11
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Instalaciones Afectadas "
end type

type gb_3 from groupbox within tabpage_2
integer x = 1509
integer y = 76
integer width = 1568
integer height = 528
integer taborder = 12
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Descargo General "
end type

type gb_2 from groupbox within tabpage_2
integer x = 1509
integer y = 636
integer width = 1568
integer height = 208
integer taborder = 14
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within tabpage_2
integer x = 1509
integer y = 876
integer width = 1568
integer height = 488
integer taborder = 14
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = " Intervalo Horario "
end type

type gb_causa from groupbox within tabpage_2
boolean visible = false
integer x = 1509
integer y = 844
integer width = 1568
integer height = 208
integer taborder = 24
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = " Causa "
end type

type dw_1 from datawindow within tabpage_2
boolean visible = false
integer x = 1614
integer y = 952
integer width = 1362
integer height = 288
integer taborder = 13
boolean bringtotop = true
string dataobject = "dw_descargo"
boolean border = false
boolean livescroll = true
end type

event losefocus;//datetime inicio, final, inicio_sol, final_sol
//long ll_interrumpido
//long ll_horas, ll_minutos, ll_dias, ll_resto
//string ls_tiempo
//string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"
//this.AcceptText()
//inicio = this.getitemdatetime(1,"f_inicio")
//final = this.getitemdatetime(1,"f_fin")
//inicio_sol = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_ini_solicitado")
//final_sol = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_fin_solicitado")
//ib_error = true
//
//st_4.text = ""
//
//if double_click = false then
//
//      if inicio < inicio_sol then
//              messagebox("Error","El inicio de la interrupcion es menor que el inicio de la solitud")
//              dw_1.setfocus()
//              return
//      end if
//      
//      if final > final_sol then
//              messagebox("Error","El final de la interrupcion es mayor que el final solitado")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if final < inicio then
//              messagebox("Error","El inicio de la interrupcion es mayor que el final de la interrupcion")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if isnull(inicio) then
//              messagebox("Error","La fecha inicio de la interrupcion no es valida")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if isnull(final) then
//              messagebox("Error","La fecha final de la interrupcion no es valida")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if final = inicio then
//              messagebox("Error","Las fechas inicio y final de la interrupcion no pueden ser iguales")
//              dw_1.setfocus() 
//              return
//      end if
//
//end if
//
//ib_error = false
//
//il_error = 0 
//
//ll_interrumpido = fg_duracion_minutos(inicio,final)
//
//ll_dias = ll_interrumpido / 1440
//ll_resto = mod(ll_interrumpido, 1440)
//ll_horas = ll_resto / 60
//ll_resto = mod(ll_resto, 60)
//ll_minutos = ll_resto // / 60
//ll_resto = mod(ll_resto, 60)
//
//if ll_dias = 1 then ls_dias = " Dia"
//if ll_horas = 1 then ls_horas = " Hora"
//if ll_minutos = 1 then ls_minutos = " Minuto"
//      
//if ll_dias > 0 then
//      
//      ls_tiempo = string(ll_dias) + ls_dias
//      
//end if
//if ll_horas > 0 then
//      
//      ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
//      
//end if
//
//if ll_minutos > 0 then
//
//      ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
//      
//end if
//
//st_4.text = ls_tiempo
end event

event dberror;long ll_error,i_sql_ok
string msg_error

msg_error = sqlerrtext
ll_error = sqldbcode
  IF ll_error <> 0 THEN

                CHOOSE CASE ll_error
                        CASE 1407,1400
                                        gnv_msg.f_mensaje("EG05","la tabla sgd_interrupcion_descargos  ","",OK!)
                 CASE ELSE 
                                        MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
          END CHOOSE
                  gnu_u_transaction.uf_rollback();

                 RETURN 1
  END IF
end event

event rowfocuschanged;datetime inicio, final, inicio_sol, final_sol
long ll_interrumpido
long ll_horas, ll_minutos, ll_dias, ll_resto
string ls_tiempo
string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"
        
        st_4.text = ""

        w_7106_consulta_historicos.tab_1.tabpage_2.dw_1.AcceptText()
        
        if dw_1.rowcount() < 1 then
                return
        end if
        
        inicio = tab_1.tabpage_2.dw_1.getitemdatetime(tab_1.tabpage_2.dw_1.getrow(),"f_inicio")
        final = tab_1.tabpage_2.dw_1.getitemdatetime(tab_1.tabpage_2.dw_1.getrow(),"f_fin")
        

        
        if isnull(inicio) or isnull(final) then
                return
        end if
        
        ll_interrumpido = fg_duracion_minutos(inicio,final)
        
        ll_dias = ll_interrumpido / 1440
        ll_resto = mod(ll_interrumpido, 1440)
        ll_horas = ll_resto / 60
        ll_resto = mod(ll_resto, 60)
        ll_minutos = ll_resto 

        
        if ll_dias = 1 then ls_dias = " Dia"
        if ll_horas = 1 then ls_horas = " Hora"
        if ll_minutos = 1 then ls_minutos = " Minuto"
                
        if ll_dias > 0 then
                
                ls_tiempo = string(ll_dias) + ls_dias
                
        end if
        if ll_horas > 0 then
                
                ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
                
        end if
        if ll_minutos > 0 then
        
                ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
                
        end if
        
        st_4.text = ls_tiempo
        
        st_4.visible = true


end event

event retrieveend;
st_4.text = ""

end event

type st_4 from statictext within tabpage_2
integer x = 1650
integer y = 1236
integer width = 1307
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type tabpage_int_simulacion from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3415
integer height = 1544
long backcolor = 79741120
string text = "Interrupciones"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Incorpor.bmp"
long picturemaskcolor = 553648127
dw_int_simulacion dw_int_simulacion
end type

on tabpage_int_simulacion.create
this.dw_int_simulacion=create dw_int_simulacion
this.Control[]={this.dw_int_simulacion}
end on

on tabpage_int_simulacion.destroy
destroy(this.dw_int_simulacion)
end on

type dw_int_simulacion from u_info_int_descargo within tabpage_int_simulacion
integer x = 9
integer y = 16
integer width = 3374
integer height = 1508
integer taborder = 11
boolean bringtotop = true
end type

type tabpage_historial from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3415
integer height = 1544
long backcolor = 79741120
string text = "Historial"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ScriptYes!"
long picturemaskcolor = 553648127
uo_historial uo_historial
end type

on tabpage_historial.create
this.uo_historial=create uo_historial
this.Control[]={this.uo_historial}
end on

on tabpage_historial.destroy
destroy(this.uo_historial)
end on

type uo_historial from uo_historial_descargos within tabpage_historial
integer x = 178
integer y = 12
integer taborder = 34
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_historial.destroy
call uo_historial_descargos::destroy
end on

event constructor;call super::constructor;dw_historial.Modify("obs_estado.Edit.DisplayOnly=Yes")
mle_observaciones.DisplayOnly = TRUE
end event

type tabpage_instalaciones from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3415
integer height = 1544
long backcolor = 79741120
string text = "Instalaciones a descargar"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PasteStatement!"
long picturemaskcolor = 536870912
mle_observaciones mle_observaciones
gb_65 gb_65
end type

on tabpage_instalaciones.create
this.mle_observaciones=create mle_observaciones
this.gb_65=create gb_65
this.Control[]={this.mle_observaciones,&
this.gb_65}
end on

on tabpage_instalaciones.destroy
destroy(this.mle_observaciones)
destroy(this.gb_65)
end on

type mle_observaciones from multilineedit within tabpage_instalaciones
integer x = 174
integer y = 180
integer width = 2766
integer height = 1248
integer taborder = 31
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_65 from groupbox within tabpage_instalaciones
integer x = 123
integer y = 104
integer width = 2880
integer height = 1360
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Instalaciones a descargar:"
end type

type tabpage_accion from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3415
integer height = 1544
boolean enabled = false
long backcolor = 79741120
string text = "Aprobar"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom038!"
long picturemaskcolor = 553648127
dw_aprobar dw_aprobar
dw_informacion_extra dw_informacion_extra
dw_solicitud dw_solicitud
dw_instalacion dw_instalacion
end type

on tabpage_accion.create
this.dw_aprobar=create dw_aprobar
this.dw_informacion_extra=create dw_informacion_extra
this.dw_solicitud=create dw_solicitud
this.dw_instalacion=create dw_instalacion
this.Control[]={this.dw_aprobar,&
this.dw_informacion_extra,&
this.dw_solicitud,&
this.dw_instalacion}
end on

on tabpage_accion.destroy
destroy(this.dw_aprobar)
destroy(this.dw_informacion_extra)
destroy(this.dw_solicitud)
destroy(this.dw_instalacion)
end on

type dw_aprobar from datawindow within tabpage_accion
integer x = 1627
integer y = 208
integer width = 1550
integer height = 908
integer taborder = 34
string dataobject = "d_7002_mante_aprobar"
boolean border = false
boolean livescroll = true
end type

type dw_informacion_extra from datawindow within tabpage_accion
integer x = 82
integer y = 852
integer width = 1371
integer height = 572
integer taborder = 24
boolean enabled = false
string dataobject = "d_7002_mante_info_param"
boolean border = false
boolean livescroll = true
end type

type dw_solicitud from datawindow within tabpage_accion
integer x = 73
integer y = 296
integer width = 1390
integer height = 572
integer taborder = 24
boolean enabled = false
string dataobject = "d_7002_mante_solicitar"
boolean border = false
boolean livescroll = true
end type

type dw_instalacion from datawindow within tabpage_accion
integer x = 105
integer y = 68
integer width = 1353
integer height = 244
integer taborder = 21
boolean enabled = false
string dataobject = "d_7002_mante_instalacion"
boolean border = false
boolean livescroll = true
end type


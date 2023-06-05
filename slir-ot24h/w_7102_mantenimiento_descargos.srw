HA$PBExportHeader$w_7102_mantenimiento_descargos.srw
forward
global type w_7102_mantenimiento_descargos from w_sgigenerica
end type
type cb_1 from commandbutton within w_7102_mantenimiento_descargos
end type
type tab_1 from tab within w_7102_mantenimiento_descargos
end type
type tabpage_1 from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type st_98 from statictext within tabpage_1
end type
type dw_puesta_explotacion from u_sgt_instalaciones within tabpage_1
end type
type dw_desc_descargo from datawindow within tabpage_1
end type
type dw_descargo from uo_7002_pr_mante_solicitud within tabpage_1
end type
type gb_6 from groupbox within tabpage_1
end type
type dw_2 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_2 cb_2
st_98 st_98
dw_puesta_explotacion dw_puesta_explotacion
dw_desc_descargo dw_desc_descargo
dw_descargo dw_descargo
gb_6 gb_6
dw_2 dw_2
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
type cb_3 from commandbutton within tabpage_2
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
type tv_1 from uo_man_instalac within tabpage_2
end type
type gb_4 from groupbox within tabpage_2
end type
type gb_3 from groupbox within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type st_causa from statictext within tabpage_2
end type
type gb_causa from groupbox within tabpage_2
end type
type st_4 from statictext within tabpage_2
end type
type dw_1 from datawindow within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_3 cb_3
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
tv_1 tv_1
gb_4 gb_4
gb_3 gb_3
st_2 st_2
gb_2 gb_2
st_causa st_causa
gb_causa gb_causa
st_4 st_4
dw_1 dw_1
gb_1 gb_1
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
type gb_65 from groupbox within tabpage_instalaciones
end type
type mle_observaciones from multilineedit within tabpage_instalaciones
end type
type tabpage_instalaciones from userobject within tab_1
gb_65 gb_65
mle_observaciones mle_observaciones
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
type tab_1 from tab within w_7102_mantenimiento_descargos
tabpage_1 tabpage_1
tabpage_otros tabpage_otros
tabpage_2 tabpage_2
tabpage_int_simulacion tabpage_int_simulacion
tabpage_historial tabpage_historial
tabpage_instalaciones tabpage_instalaciones
tabpage_accion tabpage_accion
end type
type cb_consulta from commandbutton within w_7102_mantenimiento_descargos
end type
type sw_rama from structure within w_7102_mantenimiento_descargos
end type
end forward

type sw_rama from structure
        long            fila
        long            codigo
end type

global type w_7102_mantenimiento_descargos from w_sgigenerica
integer x = 133
integer y = 160
integer width = 3392
integer height = 2084
string title = "OPEN SGI - Consulta Descargo"
windowtype windowtype = response!
long backcolor = 79741120
string icon = "descargo.ico"
event ue_presentacion pbm_custom25
cb_1 cb_1
tab_1 tab_1
cb_consulta cb_consulta
end type
global w_7102_mantenimiento_descargos w_7102_mantenimiento_descargos

type variables
//estructura de comunicaciones
u_generico_comunicaciones  lu_comunic
long il_nro_descargo 
boolean lb_tiene_perfil_oper
long il_handle
s_rama s_elemento
long ll_apertura = 0
integer ii_grabo = 0
integer ii_accion 
long il_error = 0
long il_nro_inst_padre
boolean ib_error
long il_grande = 1
boolean ib_new_tip_inc // TIPO INCIDENCIA AMR
s_grupo_int  iw_datos //GNU 25-07-2005
end variables

forward prototypes
public subroutine fw_inst_descargo ()
public function long fw_tiene_interrupcion (datawindow d_interrupcion, long codigo)
public subroutine fw_cargar_arbol (long co_nivel)
public function long fw_busqueda_arbol (long nro_padre)
public subroutine fw_editar_campos (datawindow pdw_datos)
public subroutine fw_deshabilita_tab_interrupciones ()
public function string fw_calcular_estado (long pl_estado)
public subroutine fw_listar_treeview (ref integer indice, integer li_item_1)
public subroutine fnu_abrir_instalaciones ()
end prototypes

event ue_presentacion;int li_Estado
datetime ldt_f_ini_aprob, ldt_f_fin_aprob
string ls_estado

string ls_descripcion, ls_prim_desc // GNU 2-8-2006. Mejora 1/426921
datawindowchild ddw_desc_descargo

this.tab_1.tabpage_1.dw_descargo.SetTransObject(SQLCA)
this.tab_1.tabpage_1.dw_puesta_explotacion.SetTransObject(SQLCA)
this.tab_1.tabpage_historial.uo_historial.dw_historial.SetTransObject(SQLCA)
// GNU 18-1-2006. Incidencia pruebas integradas Nicaragua
this.tab_1.tabpage_1.dw_puesta_explotacion.Show()
// FIN GNU


this.tab_1.tabpage_1.dw_descargo.retrieve(lu_comunic.is_comunic.longval1)
this.tab_1.tabpage_1.dw_puesta_explotacion.retrieve(lu_comunic.is_comunic.longval1)
this.tab_1.tabpage_historial.uo_historial.dw_historial.retrieve(lu_comunic.is_comunic.longval1)

// GNU 2-8-2006. Mejora 1/426921
//SELECT valor
//INTO :ls_prim_desc
//FROM sgd_valor
//WHERE codif='DESC';
	
IF gu_comunic.is_comunic.accion_llamada = "Consulta" THEN
	ls_descripcion=tab_1.tabpage_1.dw_descargo.GetItemString (1,'descripcion')
	if fg_verifica_parametro("descripcion descargos") &
		AND isNumber(ls_descripcion) THEN
	
//		and (il_nro_descargo >= long(ls_prim_desc)) then
//		ls_descripcion= tab_1.tabpage_1.dw_descargo.GetItemString(1,'descripcion')
	
		SELECT descripcion
		into :ls_descripcion
		FROM sgd_valor
		WHERE codif='DS_D'
			AND codigo= :ls_descripcion ;
		
		tab_1.tabpage_1.dw_descargo.SetItem (1,'descripcion',ls_descripcion)
	end if
ELSE
	ls_descripcion=tab_1.tabpage_1.dw_descargo.GetItemString (1,'descripcion')

	if fg_verifica_parametro("descripcion descargos") &
		AND isNumber(ls_descripcion) THEN
//		and (il_nro_descargo >= long(ls_prim_desc)) then
		tab_1.tabpage_1.dw_desc_descargo.insertrow(0)
		tab_1.tabpage_1.dw_desc_descargo.visible=true
		tab_1.tabpage_1.dw_desc_descargo.GetChild('pi_desc_descargo',ddw_desc_descargo)
		ddw_desc_descargo.SetTransObject(SQLCA)
		ddw_desc_descargo.retrieve()
//		ls_descripcion= tab_1.tabpage_1.dw_descargo.GetItemString(1,'descripcion')
		tab_1.tabpage_1.dw_desc_descargo.setitem(1,"pi_desc_descargo",long(ls_descripcion))

	end if
END IF
// FIN GNU

li_estado = this.tab_1.tabpage_1.dw_descargo.GetItemNumber (1,'estado')
ls_estado = fw_calcular_estado(li_estado)
this.tab_1.tabpage_1.dw_descargo.Object.estado.text = ls_estado
ldt_f_ini_aprob = this.tab_1.tabpage_1.dw_descargo.GetITemDateTime(1,'f_ini_aprobado')
ldt_f_fin_aprob = this.tab_1.tabpage_1.dw_descargo.GetITemDateTime(1,'f_fin_aprobado')


if li_estado = fgci_descargo_aprobado  or  li_Estado = fgci_descargo_activado then 
	this.tab_1.tabpage_accion.enabled = true
	this.tab_1.tabpage_accion.dw_aprobar.dataobject = 'd_7002_mante_aprobar'
elseif  li_Estado = fgci_descargo_modificado  then
	this.tab_1.tabpage_accion.enabled = true
	this.tab_1.tabpage_accion.dw_aprobar.dataobject = 'd_7002_mante_modificar'
elseif  li_Estado = fgci_descargo_rechazado then
	this.tab_1.tabpage_accion.enabled = true
	this.tab_1.tabpage_accion.dw_aprobar.dataobject = 'd_7002_mante_rechazar'
else
	this.tab_1.tabpage_accion.enabled = false
end if

	this.tab_1.tabpage_2.st_3.text = string(ldt_f_ini_aprob)
	this.tab_1.tabpage_2.st_5.text = string(ldt_f_fin_aprob)
//END IF
tab_1.tabpage_instalaciones.mle_observaciones.text = tab_1.tabpage_1.dw_descargo.object.inst_descargar[1]

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

If li_Estado = fgci_descargo_aprobado OR li_Estado = fgci_descargo_activado or li_Estado = fgci_descargo_modificado or li_Estado = fgci_descargo_rechazado Then
	this.tab_1.tabpage_accion.Enabled = True
		
	tab_1.tabpage_accion.dw_instalacion.settransobject(sqlca)
	tab_1.tabpage_accion.dw_instalacion.retrieve(lu_comunic.is_comunic.decval1)
		
	tab_1.tabpage_accion.dw_solicitud.settransobject(sqlca)
	tab_1.tabpage_accion.dw_solicitud.insertrow(0)
	tab_1.tabpage_accion.dw_solicitud.setitem(1,"id_solicitante",tab_1.tabpage_1.dw_descargo.GetItemString(1,"id_solicitante"))
	tab_1.tabpage_accion.dw_solicitud.setitem(1,"f_ini_solicitado",tab_1.tabpage_1.dw_descargo.GetItemDateTime(1,"f_ini_solicitado"))
	tab_1.tabpage_accion.dw_solicitud.setitem(1,"f_fin_solicitado",tab_1.tabpage_1.dw_descargo.GetItemDateTime(1,"f_fin_solicitado"))

	IF li_estado = fgci_descargo_modificado then
		this.tab_1.tabpage_accion.dw_aprobar.Modify("f_ini_aprobado.background.color="+gs_gris)
		this.tab_1.tabpage_accion.dw_aprobar.Modify("f_fin_aprobado.background.color="+gs_gris)
		this.tab_1.tabpage_accion.dw_aprobar.object.f_ini_aprobado.protect = 1
		this.tab_1.tabpage_accion.dw_aprobar.object.f_fin_aprobado.protect = 1
	END IF

	tab_1.tabpage_accion.dw_aprobar.SetTransObject(SQLCA)
	tab_1.tabpage_accion.dw_aprobar.Retrieve(lu_comunic.is_comunic.longval1)

	this.tab_1.tabpage_accion.dw_aprobar.Modify("f_aprobado.protect=1")
//	this.tab_1.tabpage_accion.dw_aprobar.Modify("obs_aprobado.protect=1")
	this.tab_1.tabpage_accion.dw_aprobar.Modify("obs_aprobado.Edit.DisplayOnly=Yes")
		
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

If fg_verifica_parametro("solicitud_descargos_extra") Then
	this.tab_1.tabpage_otros.dw_descargo_otros.SetTransObject(SQLCA)
	this.tab_1.tabpage_otros.dw_descargo_otros.retrieve(lu_comunic.is_comunic.longval1)
	this.tab_1.tabpage_otros.Visible = True

	If li_Estado = fgci_descargo_aprobado OR li_Estado = fgci_descargo_activado Then
		tab_1.tabpage_accion.dw_informacion_extra.settransobject(sqlca)
		tab_1.tabpage_accion.dw_informacion_extra.retrieve(lu_comunic.is_comunic.longval1)

		tab_1.tabpage_2.gb_3.height = 528
		
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("agente.protect=1")
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_agente.protect=1")
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_aprueba.protect=1")
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("subest_movil.protect=1")
				
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("agente.background.color="+gs_gris)
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_agente.background.color="+gs_gris)
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_aprueba.background.color="+gs_gris)
		this.tab_1.tabpage_accion.dw_informacion_extra.Modify("subest_movil.background.color="+gs_gris)
		
	End if
	
	//***************************************
	//**  OSGI 2001.1  	08/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	Long 	 ll_nro_descargo
	String ls_duracion, ls_cxt, ls_pxt, ls_t
	String ls_c, ls_p
		
//	tab_1.tabpage_2.st_pot_afec.Visible = True
//	tab_1.tabpage_2.st_10.Visible = True
//	tab_1.tabpage_2.st_clientes_afec.Visible = True
//	tab_1.tabpage_2.st_11.Visible = True
//
//	tab_1.tabpage_2.st_pxt_t.Visible = True
//	tab_1.tabpage_2.st_cxt_t.Visible = True
//	tab_1.tabpage_2.st_pxt.Visible = True
//	tab_1.tabpage_2.st_cxt.Visible = True


	If tab_1.tabpage_1.dw_descargo.RowCount() < 1 Then Return

	ll_nro_descargo = il_nro_descargo
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

//Modificado por GNU 18/10/2005
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Colombia. 12/07/2005.
//If gi_pais = 7 Then
If fg_verifica_parametro("Causa en descargos.")Then
	tab_1.tabpage_2.gb_1.Y = tab_1.tabpage_2.gb_1.Y + 180
	tab_1.tabpage_2.dw_1.Y = tab_1.tabpage_2.dw_1.Y + 180
	tab_1.tabpage_2.st_4.Y = tab_1.tabpage_2.st_4.Y + 180

	tab_1.tabpage_2.gb_causa.Visible = True
	tab_1.tabpage_2.st_causa.Visible = True
	tab_1.tabpage_2.st_causa.show()
End If
// Fin. Sgo.
//Fin GNU
end event

public subroutine fw_inst_descargo ();long ll_fila,ll_handle,ll_co_nivel, ll_codigo, ll_tipo, ll_icono,ll_inst_afect,ll_nro_inst_padre
string ls_nombre,ls_matricula
Int li_tension
treeviewitem le_elemento
sw_rama sl_rama

//Obtengo el nombre, codigo de nivel
        
SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
       "SGD_INSTALACION"."CO_NIVEL", TIPO_INSTALACION,MATRICULA, TENSION 
INTO :ls_nombre,   
       :ll_co_nivel  , :ll_tipo,:ls_matricula, :li_tension
FROM "SGD_INSTALACION"  
WHERE 		"SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre   
AND   "SGD_INSTALACION"."BDI_JOB" = 0;   // DSA 10/01/2000			

IF gb_operaciones and li_tension <=gi_tension_nivel_min &
	AND ll_tipo <> fgci_tipo_ct then // LO TRATA OPERACIONES
	
	tab_1.tabpage_2.Text = 'Instalaciones'
	tab_1.tabpage_2.PictureName = "Regenerate!"
//	tab_1.tabpage_instalaciones.visible = FALSE
	tab_1.tabpage_2.gb_1.visible = False	
	tab_1.tabpage_2.gb_2.visible = False	
//	tab_1.tabpage_2.gb_3.visible = False	
//	tab_1.tabpage_2.st_7.visible = False	
//	tab_1.tabpage_2.st_3.visible = False	
//	tab_1.tabpage_2.st_8.visible = False	
//	tab_1.tabpage_2.st_5.visible = False	
//	tab_1.tabpage_2.st_9.visible = False	
//	tab_1.tabpage_2.st_6.visible = False	
//	tab_1.tabpage_2.st_10.visible = False	
//	tab_1.tabpage_2.st_pot_afec.visible = False	
//	tab_1.tabpage_2.st_11.visible = False	
//	tab_1.tabpage_2.st_clientes_afec.visible = False	
//	tab_1.tabpage_2.st_pxt_t.visible = False	
//	tab_1.tabpage_2.st_pxt.visible = False	
//	tab_1.tabpage_2.st_cxt_t.visible = False	
//	tab_1.tabpage_2.st_cxt.visible = False	
	tab_1.tabpage_2.st_1.visible = False	
	tab_1.tabpage_2.st_2.visible = False	
	tab_1.tabpage_int_simulacion.visible = True
//		tab_1.tabpage_instalaciones.visible = False // GNU 18-1-2006. Pruebas integradas Nicaragua ciclo 17
	tab_1.tabpage_int_simulacion.dw_int_simulacion.SetTransObject(SQLCA)
	tab_1.tabpage_int_simulacion.dw_int_simulacion.Retrieve(il_nro_descargo)
END IF
// Compruebo si existe interrupciones para la instalacion en ese descargo

ll_fila = fw_tiene_interrupcion(tab_1.tabpage_2.dw_1,il_nro_inst_padre)

// Se crea la rama de primer nivel

if not isnull(trim(ls_matricula)) and ll_tipo = fgci_tipo_ct then
	ls_nombre = ls_nombre + "; Mat.-" + ls_matricula
end if	  

ll_icono = tab_1.tabpage_2.tv_1.f_icono_arbol(ll_tipo)
ll_handle = tab_1.tabpage_2.tv_1.insertitemsort(0,ls_nombre,ll_icono)
tab_1.tabpage_2.tv_1.getitem(ll_handle,le_elemento)


sl_rama.codigo = il_nro_inst_padre

if ll_fila > 0 then
	le_elemento.bold = true
	sl_rama.fila = ll_fila
else
	sl_rama.fila = 0
end if


// Si existe una interrupcion para esa instalacion se pone en negrilla
// Y se guarda el numero de fila donde se ha encontrado en interrupciones

if ll_fila > 0 then sl_rama.fila = ll_fila

// Actualiza el elemento creado en el arbol
le_elemento.data = sl_rama
tab_1.tabpage_2.tv_1.setitem(ll_handle,le_elemento)

// Cargo mas niveles

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

FETCH desc_inst_afect into  :ls_nombre, :ll_co_nivel, :ll_tipo,:ll_nro_inst_padre;

LOOP

CLOSE desc_inst_afect;

//Cargo el segundo nivel 

if ll_fila > 0 then
	return
end if

IF NOT (gb_operaciones and li_tension <=gi_tension_nivel_min AND ll_tipo <> fgci_tipo_ct) THEN
	// NO LO TRATA OPERACIONES
	fw_cargar_arbol(ll_co_nivel+1)  
	//fw_cargar_arbol(ll_co_nivel+2)   -> Comnentado por LFE
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
string ls_nombre, ls_nombre_anterior,ls_matricula,ls_matr
long ll_handle, ll_fila, ll_codigo, ll_nro_padre, ll_handle_buscado, co_nivel_anterior, ll_tipo, ll_tipo2, ll_icono
sw_rama sl_rama

 
 DECLARE cu_nivel CURSOR FOR  
  SELECT "SGD_INSTALACION"."NOM_INSTALACION",
                        "SGD_INSTALACION"."NRO_INSTALACION",
                        "SGD_INSTALACION"."NRO_INST_PADRE", TIPO_INSTALACION,MATRICULA
    FROM "SGD_INSTALACION",   
         "SGD_INTERRUPCION_DESCARGO"  
   WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" ) and  
         ( "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :il_nro_descargo) and
         //( "SGD_INSTALACION"."CO_NIVEL" = :co_nivel ) AND 
			( "SGD_INSTALACION"."BDI_JOB" = 0 );

open cu_nivel ;


fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo, :ls_matr;

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
	IF fw_busqueda_arbol(ll_codigo) = -1 THEN       
        	if not isnull(trim(ls_matr)) and ll_tipo = fgci_tipo_ct  then
			ls_nombre = ls_nombre + "; Mat.-" + ls_matr
		end if	
        
        //  Busca en el arbol alguna instalacion, que tenga el codigo de instalacion
        //  padre del que estoy intentando insertar.
        
                        
        ll_handle_buscado = fw_busqueda_arbol(ll_nro_padre)
        
        // Si no existe el elemento buscado, solo puede ocurrir en tercer nivel
        // Busca el padre de la instalacion coge los datos
        // Interta la rama nueva y le dice el handle donde se ha insertado

        if ll_handle_buscado = -1 then
                
          SELECT "SGD_INSTALACION"."NOM_INSTALACION" , CO_NIVEL , TIPO_INSTALACION, MATRICULA, nro_inst_padre
            INTO :ls_nombre_anterior, :co_nivel_anterior, :ll_tipo2, :ls_matricula, :ll_nro_padre
         FROM "SGD_INSTALACION"  
           WHERE 		"SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_padre   
						AND ( "SGD_INSTALACION"."BDI_JOB" = 0 );  // DSA 10/01/2000			

		if not isnull(trim(ls_matricula)) and ll_tipo2 = fgci_tipo_ct  then
			ls_nombre_anterior = ls_nombre_anterior + "; Mat.-" + ls_matricula			  
		end if	  
		
                ll_icono = tab_1.tabpage_2.tv_1.f_icono_arbol(ll_tipo2)
					 ll_handle_buscado = fw_busqueda_arbol(ll_nro_padre) // GNU 17-5-2007. Incidencia 0/505983
                ll_handle_buscado = tab_1.tabpage_2.tv_1.insertitemsort(ll_handle_buscado,ls_nombre_anterior,ll_icono)
                tab_1.tabpage_2.tv_1.getitem(ll_handle_buscado, le_elemento)
                sl_rama.codigo = ll_nro_padre
                sl_rama.fila = 0
                le_elemento.data = sl_rama

                if tab_1.tabpage_2.dw_1.find("cod_instalacion = " + string(ll_codigo) + " and ind_oop = 0 ",1,tab_1.tabpage_2.dw_1.rowcount()) > 0 then
       			le_elemento.bold = true
       		  end if

                tab_1.tabpage_2.tv_1.setitem(ll_handle_buscado,le_elemento)			 
        end if
        ll_icono = tab_1.tabpage_2.tv_1.f_icono_arbol(ll_tipo)
        ll_handle = tab_1.tabpage_2.tv_1.insertitemsort(ll_handle_buscado,ls_nombre,ll_icono)
        tab_1.tabpage_2.tv_1.getitem(ll_handle, le_elemento)
        ll_fila = fw_tiene_interrupcion(tab_1.tabpage_2.dw_1,ll_codigo)
        sl_rama.codigo = ll_codigo
        sl_rama.fila = 0
        
       if tab_1.tabpage_2.dw_1.find("cod_instalacion = " + string(ll_codigo) + " and ind_oop = 0 ",1,tab_1.tabpage_2.dw_1.rowcount()) > 0 then
       	le_elemento.bold = true
       end if
	   if ll_fila > 0 then sl_rama.fila = ll_fila
		
        le_elemento.data = sl_rama
        tab_1.tabpage_2.tv_1.setitem(ll_handle,le_elemento)
	END IF      
	fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo, :ls_matr;
        
loop

close cu_nivel ;

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

public subroutine fw_editar_campos (datawindow pdw_datos);int li_codigo
string ls_estado

li_codigo = pdw_datos.GetItemNumber(1,'estado')
 
SELECT "SGD_VALOR"."DESCRIPCION"
INTO :ls_estado
FROM "SGD_VALOR"  
WHERE ( "SGD_VALOR"."CODIF" = 'ES_D' ) AND "SGD_VALOR"."CODIGO" =:li_codigo ;
 
tab_1.tabpage_1.dw_2.modify("estado_t.text='" + ls_estado + "'")
end subroutine

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

//	IF li_total_inst <= 0 OR (SQLCA.SQLCODE <> 0) THEN
//		tab_1.tabpage_2.Enabled = false
//	END IF
	
	

end subroutine

public function string fw_calcular_estado (long pl_estado);// Recupera la descripcion del estado 
string ls_estado

ls_estado = ''

SELECT "SGD_VALOR"."DESCRIPCION"
INTO :ls_estado
FROM "SGD_VALOR"  
WHERE ( "SGD_VALOR"."CODIF" = 'ES_D' ) AND "SGD_VALOR"."CODIGO" =:pl_estado ;

return ls_estado
end function

public subroutine fw_listar_treeview (ref integer indice, integer li_item_1);//GNU 25-07-2005
treeviewitem le_elemento
int li_item_2
long ll_fila
sw_rama ls_elemento

DO while li_item_1 <> -1
	tab_1.tabpage_2.tv_1.GetItem(li_item_1,le_elemento)
	ls_elemento= le_elemento.data
	iw_datos.nro_instalacion_int[indice]= ls_elemento.codigo
	indice ++
	li_item_2= tab_1.tabpage_2.tv_1.FindItem(ChildTreeItem!, le_elemento.itemhandle)
	fw_listar_treeview(indice,li_item_2)
	li_item_1= tab_1.tabpage_2.tv_1.FindItem(NextTreeItem!, le_elemento.itemhandle)
LOOP

end subroutine

public subroutine fnu_abrir_instalaciones ();// En Consulta de Descargos, en la lista de dichos descargos existe un campo llamado Advertencia,
// en el caso de que ese campo este clicado el descargo se abrir$$HEX2$$e1002000$$ENDHEX$$en la pesta$$HEX1$$f100$$ENDHEX$$a "Instalaciones a Descargar"
// para que la persona responsable de OT 24 Horas pueda a$$HEX1$$f100$$ENDHEX$$adir comentarios.
if Message.DoubleParm = 1 then
	Tab_1.SelectedTab = 6
	Tab_1.tabpage_instalaciones.mle_observaciones.DisplayOnly = FALSE
	Tab_1.SetFocus()
end if

end subroutine

on w_7102_mantenimiento_descargos.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.tab_1=create tab_1
this.cb_consulta=create cb_consulta
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.cb_consulta
end on

on w_7102_mantenimiento_descargos.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.tab_1)
destroy(this.cb_consulta)
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
	 tab_1.tabpage_1.dw_descargo.modify("sgd_descargos_ind_obligada.visible=1")
else
	 tab_1.tabpage_1.dw_descargo.modify("sgd_descargos_ind_obligada.visible=0")
	 tab_1.tabpage_1.dw_descargo.modify("obs_solicitud.height = 368")
	 tab_1.tabpage_1.cb_2.y = 1008
end if
//////////////////////////////////////////////////////////

il_nro_descargo=lu_comunic.is_comunic.longval1

THIS.TriggerEvent("ue_presentacion")

post fnu_abrir_instalaciones()
end event

event closequery;IF tab_1.tabpage_historial.uo_historial.mle_observaciones.visible THEN
	tab_1.tabpage_historial.uo_historial.cb_reducir.TriggerEvent("Clicked")
END IF
tab_1.tabpage_historial.uo_historial.dw_historial.AcceptText()

IF tab_1.tabpage_historial.uo_historial.ib_cambios THEN
	IF MessageBox("Aviso", "Ha introducido cambios en las Observaciones, $$HEX1$$bf00$$ENDHEX$$desea guardar los cambios", Question!, YesNo!) = 1 THEN
		tab_1.tabpage_historial.uo_historial.dw_historial.update()
	END IF
END IF

// A$$HEX1$$f100$$ENDHEX$$adido por RCA (10/04/2008) Hemos entrado a la ventana desde el campo Advert. de 
// 'Consulta de Descargos', por tanto hay que grabar las Instalaciones a Descargar.
if tab_1.tabpage_instalaciones.mle_observaciones.Displayonly = False Then
	//AHM (11/04/2011) ASUR 1015294
	UPDATE "SGD_DESCARGOS"  
	SET "INST_DESCARGAR" = :tab_1.tabpage_instalaciones.mle_observaciones.text,
	"IND_ADVERTENCIA"  = 1
	WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo   ;
	
	if sqlca.sqlcode<>0 then 
		 gnu_u_transaction.uf_rollback()
	ELSE
		gnu_u_transaction.uf_commit()
	end if 
end if
// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (10/04/2008)

tab_1.tabpage_1.dw_descargo.ShareDataOff()
sleep(1)



end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7102_mantenimiento_descargos
end type

type cb_1 from commandbutton within w_7102_mantenimiento_descargos
integer x = 1902
integer y = 1832
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
string ls_titulo
long ll_longitud
string ls_observaciones
//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Descargo'
ll_longitud = len (ls_titulo)*100
tab_1.tabpage_1.dw_2.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
tab_1.tabpage_1.dw_2.modify("titulo_t.Text = '" + ls_titulo + "'")
tab_1.tabpage_1.dw_2.getchild ("d_solicitud",dwc_descargo)

tab_1.tabpage_1.dw_descargo.sharedata(dwc_descargo)
lst_impresion.pa_todos[1]=tab_1.tabpage_1.dw_descargo
lst_impresion.pa_nombres[1]='d_solicitud'

tab_1.tabpage_1.dw_2.object.inst_descargar_t.text = tab_1.tabpage_instalaciones.mle_observaciones.text
ls_observaciones = tab_1.tabpage_1.dw_descargo.object.obs_solicitud[1]
tab_1.tabpage_1.dw_2.modify("obs_t.Text = '" + ls_observaciones + "'")


lst_impresion.total = 1

fw_editar_campos(tab_1.tabpage_1.dw_descargo)

lst_impresion.pdw_compuesto = tab_1.tabpage_1.dw_2
lst_impresion.compuesto = true
lst_impresion.zoom = 100
gf_impresion_preliminar (lst_impresion, True, 0)

	
	

end event

type tab_1 from tab within w_7102_mantenimiento_descargos
event create ( )
event destroy ( )
integer x = 50
integer y = 92
integer width = 3269
integer height = 1708
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

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3232
integer height = 1580
long backcolor = 79741120
string text = "Descargo"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "descargo.bmp"
long picturemaskcolor = 553648127
cb_2 cb_2
st_98 st_98
dw_puesta_explotacion dw_puesta_explotacion
dw_desc_descargo dw_desc_descargo
dw_descargo dw_descargo
gb_6 gb_6
dw_2 dw_2
end type

on tabpage_1.create
this.cb_2=create cb_2
this.st_98=create st_98
this.dw_puesta_explotacion=create dw_puesta_explotacion
this.dw_desc_descargo=create dw_desc_descargo
this.dw_descargo=create dw_descargo
this.gb_6=create gb_6
this.dw_2=create dw_2
this.Control[]={this.cb_2,&
this.st_98,&
this.dw_puesta_explotacion,&
this.dw_desc_descargo,&
this.dw_descargo,&
this.gb_6,&
this.dw_2}
end on

on tabpage_1.destroy
destroy(this.cb_2)
destroy(this.st_98)
destroy(this.dw_puesta_explotacion)
destroy(this.dw_desc_descargo)
destroy(this.dw_descargo)
destroy(this.gb_6)
destroy(this.dw_2)
end on

type cb_2 from commandbutton within tabpage_1
integer x = 1541
integer y = 916
integer width = 73
integer height = 60
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "->"
end type

event clicked;parent.setredraw(false)

IF il_grande = 1 THEN

	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.x = 64
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.y = 8
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.Width = 2345
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.Height = 844
	tab_1.tabpage_1.dw_descargo.object.ind_interrupcion.visible = false
	tab_1.tabpage_1.dw_descargo.object.trab_tension.visible = false
	tab_1.tabpage_1.dw_descargo.object.subest_movil.visible = false
	tab_1.tabpage_1.dw_descargo.object.ind_act_grafica.visible = false
	tab_1.tabpage_1.dw_descargo.object.f_ini_solicitado.visible = false

	tab_1.tabpage_1.dw_descargo.object.f_fin_solicitado.visible = false
	tab_1.tabpage_1.dw_descargo.object.f_solicitado.visible = false
	//AHM (16/12/2010) ASUR 837464
//	tab_1.tabpage_1.dw_descargo.object.id_solicitante.visible = false
	tab_1.tabpage_1.dw_descargo.object.nom_usuario.visible = false
	tab_1.tabpage_1.dw_descargo.object.nom_desc.visible = false
	tab_1.tabpage_1.dw_descargo.object.descripcion.visible = false
	tab_1.tabpage_1.dw_descargo.object.f_ini_solicitado_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.f_fin_solicitado_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.f_solicitado_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.id_solicitante_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.nom_desc_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.descripcion_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.estado.visible = false
	tab_1.tabpage_1.dw_descargo.object.estado_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.tipo_descargo.visible = false
	tab_1.tabpage_1.dw_descargo.object.tipo_descargo_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.agente.visible = false
	tab_1.tabpage_1.dw_descargo.object.agente_t.visible = false
	tab_1.tabpage_1.dw_descargo.object.f_ini_aprobado.visible = false
	tab_1.tabpage_1.dw_descargo.object.f_fin_aprobado.visible = false	
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud_t.visible = false	
	tab_1.tabpage_1.dw_descargo.object.gb_1.visible = false	
	tab_1.tabpage_1.dw_descargo.object.gb_2.visible = false	
	//AHM 14/02/2011 ASUR 923239
	IF gi_pais = 8 THEN		//S$$HEX1$$f300$$ENDHEX$$lo es necesario si es Moldavia
		dw_desc_descargo.visible = FALSE
	END IF
	
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
		tab_1.tabpage_1.dw_descargo.object.sgd_descargos_ind_obligada.visible = false
	end if
	////////////////////////////////////////////////////
	
	this.x = 2615
	this.y = 952
	
	this.text='<-'
	
	tab_1.tabpage_1.dw_descargo.setcolumn('obs_solicitud')
	tab_1.tabpage_1.dw_descargo.setfocus()
	
	il_grande = 0
	
ELSE
		
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.x = 69
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.y = 544
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.Width = 1170
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud.Height = 364
	tab_1.tabpage_1.dw_descargo.object.f_ini_solicitado.visible = true
	tab_1.tabpage_1.dw_descargo.object.f_fin_solicitado.visible = true
	tab_1.tabpage_1.dw_descargo.object.f_solicitado.visible = true
	//AHM (16/12/2010) ASUR 837464
//	tab_1.tabpage_1.dw_descargo.object.id_solicitante.visible = true
	tab_1.tabpage_1.dw_descargo.object.nom_usuario.visible = true
	tab_1.tabpage_1.dw_descargo.object.nom_desc.visible = true
	tab_1.tabpage_1.dw_descargo.object.ind_interrupcion.visible = true
	IF tab_1.tabpage_1.dw_descargo.object.ind_interrupcion[1] = 2 then
		tab_1.tabpage_1.dw_descargo.object.trab_tension.visible = true
	END IF
	tab_1.tabpage_1.dw_descargo.object.subest_movil.visible = true
	tab_1.tabpage_1.dw_descargo.object.ind_act_grafica.visible = true
	tab_1.tabpage_1.dw_descargo.object.descripcion.visible = true
	if isnull(tab_1.tabpage_1.dw_descargo.getitemdatetime(1,'f_ini_solicitado')) then
		tab_1.tabpage_1.dw_descargo.object.f_ini_solicitado_t.visible = false
		tab_1.tabpage_1.dw_descargo.object.f_fin_solicitado_t.visible = false
	else
		tab_1.tabpage_1.dw_descargo.object.f_ini_solicitado_t.visible = true
		tab_1.tabpage_1.dw_descargo.object.f_fin_solicitado_t.visible = true
	end if
	tab_1.tabpage_1.dw_descargo.object.f_solicitado_t.visible = true
	tab_1.tabpage_1.dw_descargo.object.id_solicitante_t.visible = true
	tab_1.tabpage_1.dw_descargo.object.nom_desc_t.visible = true
	tab_1.tabpage_1.dw_descargo.object.descripcion_t.visible = true
	tab_1.tabpage_1.dw_descargo.object.estado.visible = true
	tab_1.tabpage_1.dw_descargo.object.estado_t.visible = true
	tab_1.tabpage_1.dw_descargo.object.tipo_descargo.visible = true
	tab_1.tabpage_1.dw_descargo.object.tipo_descargo_t.visible = true
	tab_1.tabpage_1.dw_descargo.object.agente.visible = true
	tab_1.tabpage_1.dw_descargo.object.agente_t.visible = true
	if isnull(tab_1.tabpage_1.dw_descargo.getitemdatetime(1,'f_ini_aprobado')) then
		tab_1.tabpage_1.dw_descargo.object.f_ini_aprobado.visible = false
		tab_1.tabpage_1.dw_descargo.object.f_fin_aprobado.visible = false
	else
		tab_1.tabpage_1.dw_descargo.object.f_ini_aprobado.visible = true
		tab_1.tabpage_1.dw_descargo.object.f_fin_aprobado.visible = true
	end if
	tab_1.tabpage_1.dw_descargo.object.obs_solicitud_t.visible = true	
	tab_1.tabpage_1.dw_descargo.object.gb_1.visible = true	
	tab_1.tabpage_1.dw_descargo.object.gb_2.visible = true
	//AHM 14/02/2011 ASUR 923239
	IF gi_pais = 8 THEN
		dw_desc_descargo.visible = TRUE
	//dw_desc_descargo.BringToTop = TRUE
	END IF
	
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
	   tab_1.tabpage_1.dw_descargo.object.obs_solicitud.Height = 272
		tab_1.tabpage_1.dw_descargo.object.sgd_descargos_ind_obligada.visible = true
	end if
	///////////////////////////////////////////////////
	
	tab_1.tabpage_1.dw_descargo.setcolumn('obs_solicitud')
	tab_1.tabpage_1.dw_descargo.setfocus()
	this.x = 1454
	this.y = 1008
	
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
	   this.y = 916
	end if
	///////////////////////////////////////////////////
	
	il_grande = 1
	
	this.text='->'
	
END IF

this.show()

parent.setredraw(true)
end event

type st_98 from statictext within tabpage_1
integer x = 402
integer y = 1108
integer width = 2350
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 276856960
boolean enabled = false
string text = " Instalaciones a poner en explotaci$$HEX1$$f300$$ENDHEX$$n"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_puesta_explotacion from u_sgt_instalaciones within tabpage_1
integer x = 402
integer y = 1180
integer width = 2350
integer height = 312
integer taborder = 40
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_desc_descargo from datawindow within tabpage_1
boolean visible = false
integer x = 1746
integer y = 160
integer width = 1074
integer height = 96
integer taborder = 21
boolean enabled = false
string title = "none"
string dataobject = "d_desc_descargo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_descargo.setitem(1,'descripcion',data)
end event

type dw_descargo from uo_7002_pr_mante_solicitud within tabpage_1
integer x = 357
integer y = 136
integer width = 2437
integer height = 988
integer taborder = 10
end type

event dberror;call super::dberror;//long ll_error,i_sql_ok
//string msg_error
//
//msg_error = sqlerrtext
//ll_error = sqldbcode
//  IF ll_error <> 0 THEN
//
//              CHOOSE CASE ll_error
//
//                 CASE 1407,1400
//                                      gnv_msg.f_mensaje("EG05","la tabla sgd_descargos  ","",OK!)
//                 CASE ELSE 
//                                      MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
//        END CHOOSE
//                gnu_u_transaction.uf_rollback();
//
//               RETURN 1
//  END IF
//
//
end event

event getfocus;call super::getfocus;//ii_accion = 1
end event

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

// GNU 22/01/2007. Incidencia EPSA
If fg_verifica_parametro("Causa en descargos.") Then
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
			where cod_causa = :li_cod_causa;

	
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
		 //AHM (19/11/2007)
//		 tab_1.tabpage_2.st_causa.TEXTSIZE=3
	end if

	tab_1.tabpage_2.st_causa.Text = ls_desc_causa
End If
// FIN GNU


if lu_comunic.is_comunic.strval6 = "lista_descargos" then
        
        Setpointer(HourGlass!)
        inicio_sol = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_ini_solicitado")
        final_sol = tab_1.tabpage_1.dw_descargo.getitemdatetime(1,"f_fin_solicitado")
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.st_3.text = string(inicio_sol, 'dd/mm/yyyy hh:mm')
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.st_5.text = string (final_sol, 'dd/mm/yyyy hh:mm')
        ll_nro_descargo = w_7102_mantenimiento_descargos.       tab_1.tabpage_1.dw_descargo.getItemnumber(1,"nro_descargo")
        il_nro_inst_padre = gu_comunic.is_comunic.decval1
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.st_1.enabled = false
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.modify("f_inicio.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.modify("f_inicio.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.modify("f_fin.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.modify("f_fin.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.enabled = false
        
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("estado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("estado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("id_enviado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("id_enviado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_activado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_activado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("tipo_descargo.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("tipo_descargo.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_solicitado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_solicitado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_ini_solicitado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_ini_solicitado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_fin_solicitado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_fin_solicitado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("obs_solicitud.Edit.DisplayOnly='Yes'")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("obs_solicitud.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_aprobado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_aprobado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_ini_aprobado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_ini_aprobado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_fin_aprobado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("f_fin_aprobado.background.color="+gs_gris)
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("obs_aprobado.protect = 1")
        w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.modify("obs_aprobado.background.color="+gs_gris)

        

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
        
//______DSA INI 03/04/2000			
long ll_ind_interrupcion
u_desc_2030_rn_filtro_descargo	lu_desc_const

//______DSA FIN 03/04/2000			

ll_nro_ins= this.getitemnumber(1,"sgd_descargos_cod_inst_origen")
il_nro_descargo = this.getitemnumber(1,"nro_descargo")
//
//Recupera el nombre de la inst de los descargos

tab_1.tabpage_2.dw_1.settransobject(sqlca)
tab_1.tabpage_2.dw_1.retrieve(il_nro_descargo)

fw_inst_descargo()       

SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
 INTO :ls_nom_ins  
 FROM "SGD_INSTALACION"  
 WHERE 			"SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_ins   
			AND ( "SGD_INSTALACION"."BDI_JOB" = 0 );  // DSA 10/01/2000			
			
lu_desc_const = Create u_desc_2030_rn_filtro_descargo;

ll_ind_interrupcion = w_7102_mantenimiento_descargos.tab_1.tabpage_1.dw_descargo.object.ind_interrupcion[1]
if ll_ind_interrupcion = lu_desc_const.sin_interrupcion then
//		w_7102_mantenimiento_descargos.tab_1.SetRedraw(FALSE)
//		w_7102_mantenimiento_descargos.tab_1.tabpage_2.Visible = FALSE		
//		w_7102_mantenimiento_descargos.tab_1.SetRedraw(TRUE)
	tab_1.tabpage_2.st_2.text=ls_nom_ins
	tab_1.tabpage_2.Text = 'Instalaciones'
	tab_1.tabpage_2.PictureName = "Regenerate!"
//	tab_1.tabpage_instalaciones.visible = False // GNU 18-1-2006. Pruebas integradas Nicaragua ciclo 17
	Destroy (lu_desc_const)	
	return
else
	fw_deshabilita_tab_interrupciones()
end if	
Destroy (lu_desc_const)	

 
 // Conprueba el total del tiempo de interrupcion
 
   SELECT min(f_inicio),max(f_fin)  
    INTO :dt_ini, :dt_fin
    FROM "SGD_INTERRUPCION_DESCARGO"  
   WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :il_nro_descargo ;

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

// Modificado por GNU
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Colombia. 12/07/2005.
//If gi_pais = 7 Then



//If fg_verifica_parametro("Causa en descargos.") Then
//	Int li_cod_causa
//	String ls_desc_causa
//
//	li_cod_causa = This.getitemnumber(1,"cod_causa")
//
//	SELECT "GI_CAUSA"."DESCRIPCION"  
//	 INTO :ls_desc_causa  
//	 FROM "GI_CAUSA"  
//	 WHERE "GI_CAUSA"."COD_CAUSA" = :li_cod_causa ;
//
//	tab_1.tabpage_2.st_causa.Text = ls_desc_causa
//End If
// Fin. Sgo.
// Fin GNU

if Message.StringParm = "advertencia" then
	tab_1.selectedtab = 6
end if


end event

event constructor;call super::constructor;// Parametrizacion: Luis Ortiz Mayo/2001

fg_ventana_parametro("identificador", This)
end event

type gb_6 from groupbox within tabpage_1
integer x = 265
integer y = 40
integer width = 2661
integer height = 1500
integer taborder = 50
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

type dw_2 from datawindow within tabpage_1
boolean visible = false
integer x = 50
integer y = 44
integer width = 1170
integer height = 800
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_descargos_imp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_otros from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3232
integer height = 1580
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
integer width = 3232
integer height = 1580
long backcolor = 79741120
string text = " Interrupcion"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Incorpor.bmp"
long picturemaskcolor = 553648127
cb_3 cb_3
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
tv_1 tv_1
gb_4 gb_4
gb_3 gb_3
st_2 st_2
gb_2 gb_2
st_causa st_causa
gb_causa gb_causa
st_4 st_4
dw_1 dw_1
gb_1 gb_1
end type

on tabpage_2.create
this.cb_3=create cb_3
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
this.tv_1=create tv_1
this.gb_4=create gb_4
this.gb_3=create gb_3
this.st_2=create st_2
this.gb_2=create gb_2
this.st_causa=create st_causa
this.gb_causa=create gb_causa
this.st_4=create st_4
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
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
this.tv_1,&
this.gb_4,&
this.gb_3,&
this.st_2,&
this.gb_2,&
this.st_causa,&
this.gb_causa,&
this.st_4,&
this.dw_1,&
this.gb_1}
end on

on tabpage_2.destroy
destroy(this.cb_3)
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
destroy(this.tv_1)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.st_2)
destroy(this.gb_2)
destroy(this.st_causa)
destroy(this.gb_causa)
destroy(this.st_4)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_3 from commandbutton within tabpage_2
integer x = 256
integer y = 1420
integer width = 741
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Suministros Afectados"
end type

event clicked;// GNU 235-07-2005
int li_item, indice=1
li_item= tab_1.tabpage_2.tv_1.FindItem(RootTreeItem!,0)

fw_listar_treeview(indice,li_item)
OpenWithParm(w_ver_sum_importantes, iw_datos)
end event

type st_cxt_t from statictext within tabpage_2
integer x = 1550
integer y = 516
integer width = 955
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
integer width = 896
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
integer x = 2331
integer y = 364
integer width = 384
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
integer x = 1550
integer y = 364
integer width = 402
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
string text = "Potencia Afec."
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_2
integer x = 1550
integer y = 288
integer width = 677
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
integer x = 1563
integer y = 648
integer width = 677
integer height = 76
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Mano.cur"
long backcolor = 67108864
string text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Seleccionada"
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
integer width = 421
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
integer width = 430
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

type tv_1 from uo_man_instalac within tabpage_2
event ue_cargar ( )
event doubleclicked pbm_tvndoubleclicked
event selectionchanged pbm_tvnselchanged
event ue_asigna ( )
event ue_desasigna ( )
event ue_versuministros ( )
integer x = 137
integer y = 144
integer width = 1115
integer height = 1188
integer taborder = 11
long textcolor = 33554432
long backcolor = 79741120
boolean linesatroot = true
string picturename[] = {"SUBEST.bmp","Sal_tra1.bmp","CT1.bmp","TRANSFOR.bmp","SALBAJ.bmp"}
end type

event selectionchanged;treeviewitem le_elemento
sw_rama sl_rama
tab_1.tabpage_2.dw_1.visible = false

this.getitem(newhandle,le_elemento)
sl_rama = le_elemento.data

if  tab_1.tabpage_2.dw_1.find("cod_instalacion = " + string(sl_rama.codigo), 1,tab_1.tabpage_2.dw_1.rowcount()) > 0 then
        
        tab_1.tabpage_2.dw_1.scrolltorow(sl_rama.fila)
        
        datetime inicio, final, inicio_sol, final_sol
        long ll_interrumpido
        long ll_horas, ll_minutos, ll_dias, ll_resto
        string ls_tiempo
        string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"

        w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.AcceptText()
        
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
//        
//        tab_1.tabpage_2.dw_1.visible = false
//
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
      st_2.text = le_elemento.label
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

event ue_versuministros;/////////////////////////////////////
// VERSION UNIFICADA AMR 05/08/2002
/////////////////////////////////////
long ll_fila

TreeviewItem le_elemento

sw_rama ls_elemento
s_grupo_int sw_datos


tv_1.getItem(il_handle,le_elemento)

ls_elemento = le_elemento.data

// GNU 25-07-2005 lo inserto en la lista, de esta forma me sirven las modificaciones realizadas en "w_ver_sum_importantes" ("fw_open_clientes_afect")
sw_datos.nro_instalacion = ls_elemento.codigo
sw_datos.nro_instalacion_int[1] = ls_elemento.codigo

//If tab_1.tabpage_2.dw_1.rowcount() <= 0 then
//  sw_datos.inicio[1] = tab_1.tabpage_1.dw_descargo.GetItemDatetime(1,'f_ini_solicitado')
//else
//  ll_fila = tab_1.tabpage_2.dw_1.Find("cod_instalacion = " + string(ls_elemento.codigo) ,1, dw_1.RowCount( ))
//  
//  if isnull(ll_fila) or ll_fila = 0 then
//	 sw_datos.inicio[1] = tab_1.tabpage_1.dw_descargo.GetItemDatetime(1,'f_ini_solicitado')
//  else
//    sw_datos.inicio[1] = tab_1.tabpage_2.dw_1.getitemdatetime(ll_fila,'f_inicio')
//  end if
//end if

// Fin GNU

if isnull(ls_elemento.codigo) then
	Messagebox('AVISO', 'El codigo de la instalci$$HEX1$$f300$$ENDHEX$$n no esta correcto, revise la selecci$$HEX1$$f300$$ENDHEX$$n')
else
	OpenWithParm(w_ver_sum_importantes, sw_datos)
end if
end event

event rightclicked;/////////////////////////////////////
// VERSION UNIFICADA AMR 05/08/2002
/////////////////////////////////////


TreeviewItem le_elemento
il_handle = handle
sw_rama ls_elemento
	
	if handle = 0 then return
	
	gs_ventana_llamante = 'w_7102_mantenimiento_descargos'
	
	m_7106_mantenimiento_descargos NewMenu
	
	NewMenu = CREATE m_7106_mantenimiento_descargos
	
	m_7106_mantenimiento_descargos.PopMenu(w_7102_mantenimiento_descargos.PointerX(), w_7102_mantenimiento_descargos.PointerY())




//TreeviewItem le_elemento
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
integer y = 72
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

type st_causa from statictext within tabpage_2
boolean visible = false
integer x = 1627
integer y = 912
integer width = 1408
integer height = 120
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean focusrectangle = false
end type

type gb_causa from groupbox within tabpage_2
boolean visible = false
integer x = 1509
integer y = 848
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

type st_4 from statictext within tabpage_2
integer x = 1650
integer y = 1236
integer width = 1307
integer height = 64
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

type dw_1 from datawindow within tabpage_2
boolean visible = false
integer x = 1609
integer y = 952
integer width = 1362
integer height = 288
integer taborder = 13
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

        w_7102_mantenimiento_descargos.tab_1.tabpage_2.dw_1.AcceptText()
        
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

event retrieveend;//datetime inicio, final, inicio_sol, final_sol
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
st_4.text = ""
//
//if double_click = false then
//
//      if inicio < inicio_sol then
//              gnv_msg.f_mensaje("ED14","","",Ok!)
//              //messagebox("Error","El inicio de la interrupcion es menor que el inicio de la solitud")
//              dw_1.setfocus()
//              return
//      end if
//      
//      if final > final_sol then
//         gnv_msg.f_mensaje("ED15","","",Ok!)
//              //messagebox("Error","El final de la interrupcion es mayor que el final solicitado")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if final < inicio then
//              gnv_msg.f_mensaje("ED16","","",Ok!)
//              //messagebox("Error","El inicio de la interrupcion es mayor que el final de la interrupcion")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if isnull(inicio) then
//              gnv_msg.f_mensaje("ED14","","",Ok!)
//              messagebox("Error","La fecha inicio de la interrupcion no es valida")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if isnull(final) then
//              gnv_msg.f_mensaje("ED18","","",Ok!)
//              //messagebox("Error","La fecha final de la interrupcion no es valida")
//              dw_1.setfocus() 
//              return
//      end if
//      
//      if final = inicio then
//              gnv_msg.f_mensaje("ED17","","",Ok!)
//              //messagebox("Error","Las fechas inicio y final de la interrupcion no pueden ser iguales")
//              dw_1.setfocus() 
//              return
//      end if
//
//end if
//
////ib_error = false
////
////il_error = 0 
////
////ll_interrumpido = fg_duracion_minutos(inicio,final)
////
////ll_dias = ll_interrumpido / 1440
////ll_resto = mod(ll_interrumpido, 1440)
////ll_horas = ll_resto / 60
////ll_resto = mod(ll_resto, 60)
////ll_minutos = ll_resto // / 60
////ll_resto = mod(ll_resto, 60)
////
////if ll_dias = 1 then ls_dias = " Dia"
////if ll_horas = 1 then ls_horas = " Hora"
////if ll_minutos = 1 then ls_minutos = " Minuto"
////    
////if ll_dias > 0 then
////    
////    ls_tiempo = string(ll_dias) + ls_dias
////    
////end if
////if ll_horas > 0 then
////    
////    ls_tiempo = ls_tiempo + space(2) + string(ll_horas) + ls_horas
////    
////end if
////
////if ll_minutos > 0 then
////
////    ls_tiempo = ls_tiempo + space(2) + string(ll_minutos) + ls_minutos
////    
////end if
////
////st_4.text = ls_tiempo
end event

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

type tabpage_int_simulacion from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3232
integer height = 1580
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
integer y = 44
integer width = 3200
integer height = 1512
integer taborder = 11
boolean bringtotop = true
end type

type tabpage_historial from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3232
integer height = 1580
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
integer x = 82
integer y = 36
integer taborder = 24
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_historial.destroy
call uo_historial_descargos::destroy
end on

event constructor;call super::constructor;IF gu_comunic.is_comunic.accion_llamada = "Consulta" THEN
	dw_historial.Modify("obs_estado.Edit.DisplayOnly=Yes")
	mle_observaciones.DisplayOnly = TRUE
END IF
end event

type tabpage_instalaciones from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3232
integer height = 1580
long backcolor = 79741120
string text = "Instalaciones a Descargar"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PasteStatement!"
long picturemaskcolor = 553648127
gb_65 gb_65
mle_observaciones mle_observaciones
end type

on tabpage_instalaciones.create
this.gb_65=create gb_65
this.mle_observaciones=create mle_observaciones
this.Control[]={this.gb_65,&
this.mle_observaciones}
end on

on tabpage_instalaciones.destroy
destroy(this.gb_65)
destroy(this.mle_observaciones)
end on

type gb_65 from groupbox within tabpage_instalaciones
integer x = 123
integer y = 104
integer width = 2880
integer height = 1360
integer taborder = 10
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

type mle_observaciones from multilineedit within tabpage_instalaciones
integer x = 165
integer y = 180
integer width = 2802
integer height = 1248
integer taborder = 21
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 2000
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_accion from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3232
integer height = 1580
long backcolor = 79741120
string text = "Informaci$$HEX1$$f300$$ENDHEX$$n de la Gesti$$HEX1$$f300$$ENDHEX$$n."
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
string dataobject = "d_7002_mante_rechazar"
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

type cb_consulta from commandbutton within w_7102_mantenimiento_descargos
integer x = 905
integer y = 1832
integer width = 393
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "C&onsulta"
end type

event clicked;long ll_nro_instalacion, ll_nro_inst_origen
  
SELECT COD_INST_ORIGEN
INTO :ll_nro_inst_origen
FROM SGD_DESCARGOS 
WHERE NRO_DESCARGO = :il_nro_descargo;

IF SQLCA.SQLCode = 0 THEN
	SELECT NRO_INSTALACION  
	INTO :ll_nro_instalacion  
	FROM SGD_INSTALACION
	WHERE TIPO_INSTALACION = :fgci_tipo_subestacion AND BDI_JOB = 0
	START WITH NRO_INSTALACION = :ll_nro_inst_origen
	CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION;

	if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
   	gnv_msg.f_mensaje("AD09","","",ok!)
      //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Imposible encontrar referencias de la instalaci$$HEX1$$f300$$ENDHEX$$n o de otras instalaciones")
	else
		OpenWithParm(w_descargos_res, ll_nro_instalacion)
   end if
	

ELSE
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido determinar la instalaci$$HEX1$$f300$$ENDHEX$$n del descargo")
END IF


end event


HA$PBExportHeader$w_7106_solicitud_descargos_rechazados.srw
forward
global type w_7106_solicitud_descargos_rechazados from w_7106_solicitud_descargos
end type
end forward

global type w_7106_solicitud_descargos_rechazados from w_7106_solicitud_descargos
integer width = 3314
integer height = 1904
boolean minbox = false
boolean maxbox = false
end type
global w_7106_solicitud_descargos_rechazados w_7106_solicitud_descargos_rechazados

type variables
long il_sesion_operacion
int ii_estado_actual
int ii_habilitar_marcado_int = 0

int ii_new_tab=0
end variables

forward prototypes
public function string fw_calcular_estado (long pl_estado)
public function integer fnu_activar_aprobacion (integer li_item)
end prototypes

public function string fw_calcular_estado (long pl_estado);// Recupera la descripcion del estado 
string ls_estado

ls_estado = ''

SELECT "SGD_VALOR"."DESCRIPCION"
INTO :ls_estado
FROM "SGD_VALOR"  
WHERE ( "SGD_VALOR"."CODIF" = 'ES_D' ) AND "SGD_VALOR"."CODIGO" =:pl_estado ;

return ls_estado
end function

public function integer fnu_activar_aprobacion (integer li_item);treeviewitem le_elemento
int li_item_2, res

tab_1.tabpage_accion.enabled= False
DO while li_item <> -1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.bold = true THEN
		tab_1.tabpage_accion.enabled= True
		return -1
	ELSE
		li_item_2=	tab_1.tabpage_interrupciones.tv_1.FindItem(ChildTreeItem!, le_elemento.itemhandle) 
		IF li_item_2 <> -1 THEN 
			res=fnu_activar_aprobacion(li_item_2)
		END IF
		IF res <> -1 THEN
			li_item=tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem!, le_elemento.itemhandle) 
		ELSE
			tab_1.tabpage_accion.enabled= True
			return -1
		END IF
	END IF
LOOP
return 0

end function

on w_7106_solicitud_descargos_rechazados.create
int iCurrent
call super::create
end on

on w_7106_solicitud_descargos_rechazados.destroy
call super::destroy
end on

event open;string ls_nom_usuario , ls_modificacion, ls_clausula_where, ls_sql, ls_select
date ldt_fecha
int li_fila, li_con_interrupcion, li_tension, li_tipo
long ll_nro_Descargo,ll_ret
datetime ldt_ini_aprob, ldt_fin_aprob, ldt_ini_solicitado, ldt_fin_solicitado
datetime ldt_fecha_ini, ldt_fecha_fin
string ls_estado

string ls_descripcion//, ls_prim_desc // GNU 2-8-2006. Mejora 1/426921
datawindowchild ddw_desc_descargo

// Creaci$$HEX1$$f300$$ENDHEX$$n de los objetos de trabajo
SetPointer(HourGlass!)
is_ventana = 'Resolicitud'

tab_1.tabpage_historial.visible = True

IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN
	il_sesion_operacion = gu_rf_servidor_operacion.of_devuelve_sesion()
END IF

lu_comunic = create u_generico_comunicaciones 
lu_comunic.is_comunic=gu_comunic.is_comunic
// NUMERO DE DESCARGO EN LONGVAL1
il_nro_descargo = lu_comunic.is_comunic.longval2
// Conexi$$HEX1$$f300$$ENDHEX$$n a la base de datos
tab_1.tabpage_solicitud.dw_datos_solicitud.SetTransObject(SQLCA)
tab_1.tabpage_interrupciones.dw_interrupcion.SetTransObject(SQLCA)
tab_1.tabpage_historial.uo_historial.dw_historial.SetTransObject(SQLCA)



// Obtenci$$HEX1$$f300$$ENDHEX$$n del usuario que define el descargo
lb_tiene_perfil_oper=FALSE
ls_nom_usuario = This.fnu_obte_nom_usuario(gs_usuario)

tab_1.tabpage_interrupciones.st_1.enabled= false
tab_1.tabpage_interrupciones.st_1.italic= false
tab_1.tabpage_interrupciones.st_1.underline= false
// COMIENZO ALE

// Solo si no hay BDI se oculta el checkbox
IF not (gb_openbdi or gb_operaciones) THEN
        tab_1.tabpage_solicitud.dw_datos_solicitud.modify("ind_act_grafica.visible=0")
END IF
// FINAL

if lu_comunic.is_comunic.Programa_llamante="w_7101_interrupciones" then 
	ii_habilitar_marcado_int = 1
	fw_habilitar_Campos(tab_1.tabpage_solicitud.dw_datos_solicitud,false)
//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//
	fw_habilitar_Campos(tab_1.Tabpage_otros.dw_datos_solicitud_otros,False)
//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//
	
	tab_1.tabpage_solicitud.dw_datos_solicitud.enabled= false
	title = "OPEN SGI - Asignaci$$HEX1$$f300$$ENDHEX$$n de interrupciones del Descargo"
	//tab_1.tabpage_interrupciones.st_1.enabled= false
end if

// Controla el perfil del usuario que entr$$HEX2$$f3002000$$ENDHEX$$en el sistema
if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","")> 1  then // ALTA / SOLICITUD DE DESCARGOS
        lb_tiene_perfil_oper=TRUE
END IF

// Inicializa variables
ls_sql = tab_1.tabpage_solicitud.dw_datos_solicitud.describe("DataWindow.Table.Select")
ls_clausula_where =" WHERE NRO_DESCARGO = "+ string(il_nro_descargo)
ls_modificacion = "DataWindow.Table.Select=~" " + ls_sql + ls_clausula_where + "~""
ls_select= tab_1.tabpage_solicitud.dw_datos_solicitud.modify(ls_modificacion)


ls_sql = tab_1.tabpage_interrupciones.dw_interrupcion.describe("DataWindow.Table.Select")
//ls_clausula_where =" WHERE NRO_DESCARGO = "+ string(il_nro_descargo) + " AND IND_OOP = 0"
ls_clausula_where =" WHERE NRO_DESCARGO = "+ string(il_nro_descargo)
ls_modificacion = "DataWindow.Table.Select=~" " + ls_sql + ls_clausula_where + "~""
ls_select= tab_1.tabpage_interrupciones.dw_interrupcion.modify(ls_modificacion)

ll_ret = tab_1.tabpage_interrupciones.dw_interrupcion.retrieve()
tab_1.tabpage_solicitud.dw_datos_solicitud.retrieve()
tab_1.tabpage_historial.uo_historial.dw_historial.retrieve(il_nro_descargo)
li_fila= tab_1.tabpage_solicitud.dw_datos_solicitud.getrow()
tab_1.tabpage_solicitud.dw_puesta_explotacion.settransobject(sqlca)
tab_1.tabpage_solicitud.dw_puesta_explotacion.retrieve(il_nro_descargo)
// GNU 18-1-2006. Incidencia pruebas integradas Nicaragua
tab_1.tabpage_solicitud.dw_puesta_explotacion.Show()
// FIN GNU

// GNU 2-8-2006. Mejora 1/426921	

//SELECT valor
//INTO :ls_prim_desc
//FROM sgd_valor
//WHERE codif='DESC';

	ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')

IF gu_comunic.is_comunic.accion_llamada = "w_7101_interrupciones" THEN

	if fg_verifica_parametro("descripcion descargos") &
		and isNumber(ls_descripcion) then
//		and (il_nro_descargo >= long(ls_prim_desc)) then
//		ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')
	
		SELECT descripcion
		into :ls_descripcion
		FROM sgd_valor
		WHERE codif='DS_D'
			AND codigo= :ls_descripcion ;
		
		tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem (1,'descripcion',ls_descripcion)
	end if
ELSE

	if fg_verifica_parametro("descripcion descargos") &
		and isNumber(ls_descripcion) then
//		and (il_nro_descargo >= long(ls_prim_desc)) then
		tab_1.tabpage_solicitud.dw_desc_descargo.insertrow(0)
		tab_1.tabpage_solicitud.dw_desc_descargo.visible=true

		tab_1.tabpage_solicitud.dw_desc_descargo.move(1590,104)
		
		tab_1.tabpage_solicitud.dw_desc_descargo.GetChild('pi_desc_descargo',ddw_desc_descargo)
		ddw_desc_descargo.SetTransObject(SQLCA)
		ddw_desc_descargo.retrieve()
//		ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')
		tab_1.tabpage_solicitud.dw_desc_descargo.setitem(1,"pi_desc_descargo",long(ls_descripcion))

	end if
END IF
// FIN GNU



ldt_ini_aprob = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(li_fila,"f_ini_aprobado")
ldt_fin_aprob = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(li_fila,"f_fin_aprobado")

tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_solicitado[li_fila] = fgnu_fecha_actual()
ldt_ini_solicitado = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(li_fila,"f_ini_solicitado")
ldt_fin_solicitado = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(li_fila,"f_fin_solicitado")
tab_1.tabpage_instalaciones.mle_observaciones.text =  tab_1.tabpage_solicitud.dw_datos_solicitud.object.inst_descargar[1]

// GNU 8-3-2007. Incidencia m$$HEX1$$ed00$$ENDHEX$$a
IF isNull(ldt_ini_aprob) THEN
	gu_comunic.is_comunic.datval1=ldt_ini_solicitado
	gu_comunic.is_comunic.datval2=ldt_fin_solicitado
ELSE
	gu_comunic.is_comunic.datval1=ldt_ini_aprob
	gu_comunic.is_comunic.datval2=ldt_fin_aprob
END IF
// FIN GNU

tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_ini_aprobado",ldt_ini_aprob)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_fin_aprobado",ldt_fin_aprob)


s_descargos str_descargos
IF	lu_comunic.is_comunic.Programa_llamante="w_7101_consulta" and &
   lu_comunic.is_comunic.accion_llamada="Rechazo" THEN
	str_descargos = Message.PowerObjectParm
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_ini_solicitado",str_descargos.ldt_ini)
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_fin_solicitado",str_descargos.ldt_fin)	
ELSE
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_ini_solicitado",ldt_ini_solicitado)
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_fin_solicitado",ldt_fin_solicitado)	
END IF

//// Si estamos agrupando descargos cambio la informacion de la pantalla
//if isvalid(w_7005_agrupar_descargos) then
//        fw_agrupa_descargos(li_fila)
//end if
ls_estado = fw_calcular_estado (tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado[1])
ii_estado_actual = tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado[1]
tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado_o.text = ls_estado
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"estado",fgci_descargo_solicitado)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"programa","w_7104_r")
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_ini_aprobado",ldt_ini_aprob)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_fin_aprobado",ldt_fin_aprob)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_aprobado",ldt_fecha)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"obs_aprobado"," ")

// GNU 24-06-2005
IF ii_estado_actual= fgci_descargo_definido THEN
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"estado",fgci_descargo_definido)
	tab_1.tabpage_accion.visible= False
	tab_1.tabpage_interrupciones.st_1.enabled= True
	tab_1.tabpage_interrupciones.st_1.italic= True
	tab_1.tabpage_interrupciones.st_1.underline= True
	tab_1.tabpage_solicitud.dw_datos_solicitud.enabled= TRUE

//END IF

//FIN GNU
ELSE
//tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion.protect= 1
//tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion.color = rgb(128,128,128)
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_act_grafica.protect= 1
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_act_grafica.color = 8421504
END IF

tab_1.tabpage_solicitud.dw_datos_solicitud.SetFocus()
ib_abierta = true

gu_comunic.is_comunic.Programa_llamante="w_7101_consulta"

gu_comunic1.is_comunic.decval1  = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(li_fila,"cod_inst_origen")

il_instalacion_afect = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(li_fila,"cod_inst_origen")
il_nro_inst_padre = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(li_fila,"cod_inst_origen")

SELECT NVL(TENSION,0), NVL(TIPO_INSTALACION,0)
INTO :li_tension, :li_tipo
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :il_instalacion_afect AND
		BDI_JOB = 0;

IF SQLCA.SQLCode = 0 THEN
	gu_comunic1.is_comunic.intval6 = li_tension
	gu_comunic1.is_comunic.intval4 = li_tipo
END IF

IF (gb_operaciones and li_tension <=gi_tension_nivel_min AND li_tipo <> fgci_tipo_ct) then 
	//LO TRATA OPERACIONES
	ii_descargo_sgi = 0
	tab_1.tabpage_int_simulacion.visible = TRUE
	tab_1.tabpage_int_simulacion.dw_int_simulacion.SetTransObjecT(SQLCA)
	tab_1.tabpage_int_simulacion.dw_int_simulacion.Retrieve(il_nro_descargo)
ELSE
	ii_descargo_sgi = 1
END IF

tab_1.tabpage_interrupciones.tv_1.event ue_cargar(1)

//li_con_interrupcion=tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion[1]
//if li_con_interrupcion <> 1 then //off
//	tab_1.tabpage_interrupciones.Text = "Instalaciones"
//	tab_1.tabpage_interrupciones.PictureName = "Regenerate!"
//	ib_con_interrupcion = false
//ELSE
//	tab_1.tabpage_interrupciones.Text = "Interrupciones"	
//	tab_1.tabpage_interrupciones.PictureName = "Incorpor.bmp"
//	ib_con_interrupcion =true
//END IF

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

If fg_verifica_parametro("solicitud_descargos_extra") Then
	tab_1.tabpage_otros.Visible = True
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetTransObject(SQLCA)
	li_fila = tab_1.tabpage_otros.dw_datos_solicitud_otros.InsertRow(0)
//	tab_1.tabpage_otros.dw_datos_solicitud_otros.AcceptText()
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"jefe_trabajo",tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"jefe_trabajo"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"tel_trabajo",tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"tel_trabajo"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"tiempo_repos",tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"tiempo_repos"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"ubicacion",tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"ubicacion"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"plano",tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"plano"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"brigada",tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"brigada"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"trab_tension",tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"trab_tension"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"tel_solic",tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"tel_solic"))
	tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1,"unidad",tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"unidad"))
End If

// A$$HEX1$$f100$$ENDHEX$$adido por FDO Mejora Colombia. 12/07/2005.
If fg_verifica_parametro("Causa en descargos.") Then
	tab_1.tabpage_interrupciones.gb_causa.Visible = True
	tab_1.tabpage_interrupciones.gb_causa.Enabled = True
	tab_1.tabpage_interrupciones.st_sel_causa.Visible = True
	tab_1.tabpage_interrupciones.st_sel_causa.Enabled = True
	tab_1.tabpage_interrupciones.st_causa.Visible = True
End If

//IF upperbound(il_otras_inst[]) > 0 then 
//	tab_1.tabpage_interrupciones.cb_eliminar.visible = True
//END IF

//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

//AHM(14/05/2008)
tab_1.tabpage_instalaciones.visible = TRUE
tab_1.tabpage_instalaciones.enabled = TRUE
tab_1.tabpage_instalaciones.mle_observaciones.text =  tab_1.tabpage_solicitud.dw_datos_solicitud.object.inst_descargar[1]

end event

event ue_grabar;long ll_nro_descargo, ll_contador = 1, li_contador, ll_nro_instalacion, ll_ret
integer li_resp_1 ,li_ind_Act_grafica, li_cont
datetime ld_fecha, ldt_fecha_nula, ld_f_actual
treeviewitem le_elemento
//u_desc_2030_rn_filtro_descargo	lu_desc_const

//lu_desc_const = Create u_desc_2030_rn_filtro_descargo;

ld_f_actual = fgnu_fecha_actual()

tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"nro_descargo",il_nro_Descargo)

if ib_con_interrupcion then // DSA 03/04/2000
	do while ll_contador <= tab_1.tabpage_interrupciones.dw_interrupcion.rowcount()
        tab_1.tabpage_interrupciones.dw_interrupcion.Setitem(ll_contador,"nro_descargo",tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"nro_descargo"))
        ll_contador++
	loop
end if
//
//Destroy (lu_desc_const )
setNull(ldt_fecha_nula)

tab_1.tabpage_interrupciones.tv_1.getitem(1,le_elemento)
s_elemento = le_elemento.data
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(tab_1.tabpage_solicitud.dw_datos_solicitud.getrow(),"cod_inst_origen",s_elemento.codigo)
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"f_ini_aprobado",ldt_fecha_nula)
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"f_fin_aprobado",ldt_fecha_nula)
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"f_aprobado",ldt_fecha_nula)

tab_1.tabpage_solicitud.dw_datos_solicitud.object.inst_descargar[1] =  tab_1.tabpage_instalaciones.mle_observaciones.text
// GNU 2-2-2006. Incidencia 0/403296
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"usuario", gs_usuario)
// FIN GNU
//

//ll_ret = fw_comprobar_otros_desc(tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'), &
//								   	   tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'), &
//										   s_elemento.codigo) 
//
//IF ll_Ret > 0 THEN
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n.","Ya existe un descargo (" + string(ll_ret) + ") en esa instalaci$$HEX1$$f300$$ENDHEX$$n para ese periodo de tiempo.",information!,ok!)
//	gnu_u_transaction.uf_rollback();
//	ib_grabo = false
//	return -1
//END IF

if  tab_1.tabpage_solicitud.dw_puesta_explotacion.rowcount() > 0 then
	
	tab_1.tabpage_solicitud.dw_puesta_explotacion.accepttext()
	
	for li_contador = 1 to  tab_1.tabpage_solicitud.dw_puesta_explotacion.rowcount() 
		if isnull(trim(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.identificador_instalacion[li_contador])) then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un identificador de instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
			gnu_u_transaction.uf_rollback();
			return -1
		end if			

		if isnull(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.tipo_instalacion[li_contador]) then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un Tipo de Instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
			gnu_u_transaction.uf_rollback();
			return -1
		end if			
	next
end if

tab_1.tabpage_solicitud.dw_puesta_explotacion.update()
ll_nro_descargo = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"nro_descargo")
ld_fecha = datetime(today(),now())
tab_1.tabpage_solicitud.dw_datos_solicitud.accepttext()

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

If fg_verifica_parametro("solicitud_descargos_extra") Then
	tab_1.tabpage_otros.dw_datos_solicitud_otros.AcceptText()
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"jefe_trabajo",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"jefe_trabajo"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"tel_trabajo",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"tel_trabajo"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"tiempo_repos",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"tiempo_repos"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"ubicacion",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"ubicacion"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"plano",tab_1.tabpage_otros.dw_datos_solicitud_otros.getitemnumber(1,"plano"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"brigada",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"brigada"))
	//tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"trab_tension",tab_1.tabpage_otros.dw_datos_solicitud_otros.getitemnumber(1,"trab_tension"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"tel_solic",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"tel_solic"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"unidad",tab_1.tabpage_otros.dw_datos_solicitud_otros.getitemnumber(1,"unidad"))
End If

//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

tab_1.tabpage_interrupciones.dw_interrupcion.accepttext()
// GNU 20-12-2005. Incidencia correo colombia 16-12-2005
tab_1.tabpage_solicitud.dw_datos_solicitud.object.nro_descargo.update="no"
// FIN GNU
li_resp_1 = tab_1.tabpage_solicitud.dw_datos_solicitud.Update()
IF li_resp_1 < 0 THEN
	gnv_msg.f_mensaje("AM68","","",ok!)
	ib_grabo = false
   tab_1.SelectTab(1)
ELSE
	ib_grabo = true
END IF

//fg_mostrar_dw(tab_1.tabpage_solicitud.dw_datos_solicitud)

	if  li_resp_1 = 1 then
        ii_grabo = tab_1.tabpage_interrupciones.dw_interrupcion.Update()

  end if

li_ind_act_grafica = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"ind_act_grafica")

DELETE "SGD_DESCARGOS_INST_AFEC"
WHERE "SGD_DESCARGOS_INST_AFEC"."NRO_DESCARGO" = :il_nro_descargo
	 AND "SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION" <> :il_instalacion_afect;

IF sqlca.sqlcode <> 0 THEN 
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se ha producido el siguiente error: " + sqlca.sqlerrtext ,exclamation!,ok!)
	RETURN
END IF

If upperbound(il_otras_inst[]) > 0 then
	For li_contador = 1 to upperbound(il_otras_inst[])
		IF il_otras_inst[li_contador] <> 0 THEN
			INSERT INTO "SGD_DESCARGOS_INST_AFEC"  
				("USUARIO",  
				"PROGRAMA", 
				"F_ACTUAL", 
				"NRO_DESCARGO", 
				"NRO_INSTALACION") Values
				(:gs_usuario,'SGI',:ld_f_actual,:il_nro_descargo, :il_otras_inst[li_contador]);     
				
			IF sqlca.sqlcode <> 0 THEN 
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se ha producido el siguiente error: " + sqlca.sqlerrtext ,exclamation!,ok!)
				RETURN
			END IF
		END IF
	Next
	
	SELECT COUNT(*)
	INTO :li_cont
	FROM "SGD_DESCARGOS_INST_AFEC"
	WHERE "SGD_DESCARGOS_INST_AFEC"."NRO_DESCARGO" = :il_nro_descargo AND
			"SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION" = :il_instalacion_afect;
			
	IF SQLCA.SQLCode = 0 AND li_cont = 0 THEN
		INSERT INTO "SGD_DESCARGOS_INST_AFEC"  
			("USUARIO",  
			"PROGRAMA", 
			"F_ACTUAL", 
			"NRO_DESCARGO", 
			"NRO_INSTALACION") Values
			(:gs_usuario,'SGI',:ld_f_actual,:il_nro_descargo, :il_instalacion_afect);     
	
		IF sqlca.sqlcode <> 0 THEN 
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se ha producido el siguiente error: " + sqlca.sqlerrtext ,exclamation!,ok!)
			gnu_u_transaction.uf_rollback();
			RETURN
		END IF
	END IF
end if

IF ii_grabo = 1 THEN
	ii_grabo = tab_1.tabpage_historial.uo_historial.dw_historial.AcceptText()
	IF ii_grabo = 1 THEN
		ii_grabo = tab_1.tabpage_historial.uo_historial.dw_historial.update()
		IF ii_grabo <> 1 THEN
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido guardar la informaci$$HEX1$$f300$$ENDHEX$$n de los estados asociados al Descargo")
		END IF
	END IF
END IF

// GNU 24-06-2005 --> Si se est$$HEX2$$e1002000$$ENDHEX$$modificando un descargo definido, el estado sigue siendo definido
IF ii_estado_actual <> fgci_descargo_definido THEN
	if ii_grabo = 1 then
		ll_nro_instalacion = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemnumber(1, 'cod_inst_origen')
		IF ii_estado_actual <> fgci_descargo_solicitado THEN
			IF fg_insertar_estado_descargo(il_nro_descargo, &
										 fgci_descargo_solicitado, &
										 tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'), &
										 tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'), &
										 fgnu_fecha_actual(),&
										 tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'obs_solicitado'), &
										 ll_nro_instalacion) = FALSE THEN
				ii_grabo = 0
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido guardar la informaci$$HEX1$$f300$$ENDHEX$$n de los estados asociados al Descargo")
			END IF
		END IF

	if ii_grabo = 1 THEN
		if li_ind_act_grafica = 1 then
			UPDATE "SGD_TRABAJOS_BDI"  
		  	SET "ESTADO_TRABAJO" = :fgci_trabajo_solicitado  
			WHERE "SGD_TRABAJOS_BDI"."NRO_DESCARGO" = :ll_nro_descargo   ;
		end if
		gnu_u_transaction.uf_commit();	
	end if
	ELSE
		ib_grabo = False
	END IF
END IF // FIN GNU

end event

event closequery;long ll_respuesta,ll_ret
long ll_auxiliar
int ll_valida_solicitud, ll_valida_interr
string ls_desc, ls_ident

// SI  ES DE OPERACIONES ES NECESARIO COMPROBAR SI SE HA CAIDO EL SERVIDOR O
// HA HABIDO UN CORTE EN LA COMUNICACION, QUE PUEDA HACER QUE NO ESTE BLOQUEADA

// SI ES DE OPERACION entonces
IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN
	if gu_rf_servidor_operacion.of_actualiza_icono() = 0  then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que no se puede conectar con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gnu_u_transaction.uf_rollback()
		RETURN 0
		
	elseif gu_rf_servidor_operacion.of_devuelve_sesion() <> il_sesion_operacion then 
		// SE HA PRODUCIDO UN CORTE
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que se ha producido un corte en la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gnu_u_transaction.uf_rollback()
		RETURN 0
	end if
end if

if ib_error = true then
        return 1
end if
if ii_new_tab<>7 then
ll_respuesta = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 
if ll_respuesta = 1 then
	tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()
	ll_valida_solicitud = fnu_valida_solicitud (tab_1.tabpage_solicitud.dw_datos_solicitud)
	if ll_valida_solicitud = 1 then
		ii_grabo = 1
		This.TriggerEvent("ue_grabar")
		IF not ib_grabo THEN Return 1
	else
		Return 1
	end if
ELSEif ll_respuesta = 3 then
	Return 1
end if
end if

end event

type st_bloqueo from w_7106_solicitud_descargos`st_bloqueo within w_7106_solicitud_descargos_rechazados
end type

type tab_1 from w_7106_solicitud_descargos`tab_1 within w_7106_solicitud_descargos_rechazados
integer x = 37
integer y = 28
integer width = 3168
integer height = 1664
end type

event tab_1::selectionchanged;call super::selectionchanged;int li_fila
datetime lf_inicio, lf_fin
long ll_cod_instalacion_origen, ll_nro_descargo,ll_respuesta, ll_valida_solicitud
string ls_id_solicitante, ls_respuesta

if newindex= 7 then
	ii_new_tab=7
	ll_nro_descargo= gu_comunic.is_comunic.longval2
//	lf_inicio= gu_comunic.is_comunic.datval1
//	lf_fin= gu_comunic.is_comunic.datval2
	// GNU 30-4-2007. Incidencia 0/502336
//	ll_cod_instalacion_origen= gu_comunic.is_comunic.longval1
	lf_inicio= tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado[1]
	lf_fin= tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_fin_solicitado[1]
	ll_cod_instalacion_origen= il_nro_inst_padre
	// FIN GNU
	ls_id_solicitante= gu_comunic.is_comunic.strval1
	ll_respuesta = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 
if ll_respuesta = 1 then
	tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()
	ll_valida_solicitud = fnu_valida_solicitud (tab_1.tabpage_solicitud.dw_datos_solicitud)
	if ll_valida_solicitud = 1 then
		ii_grabo = 1
		parent.TriggerEvent("ue_grabar")
		IF not ib_grabo THEN Return 1
	else
		Return 1
	end if
ELSEif ll_respuesta = 3 then
	Return 1
end if
	close (this.getparent())
	setpointer(hourglass!)
       ls_respuesta = w_7101_consulta_descargos.fw_busca_int_padre(ll_nro_descargo)                                          
       if (ls_respuesta <> "" ) then
		setpointer(arrow!)
              messagebox("Aviso",ls_respuesta)
		gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo);
		return
	elseif ll_respuesta= 1 then
		gu_comunic.is_comunic.accion_llamada= "Aprobacion"
		gu_comunic.is_comunic.strval6 = "lista_descargos"
		gu_comunic.is_comunic.longval2= 	ll_nro_descargo
		gu_comunic.is_comunic.datval1= lf_inicio
		gu_comunic.is_comunic.datval2= lf_fin
		gu_comunic.is_comunic.longval1= ll_cod_instalacion_origen
		gu_comunic.is_comunic.strval1= ls_id_solicitante
		open(w_7106_mante_descargos)
		gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)
		setpointer(arrow!)
	end if
end if
end event

type tabpage_solicitud from w_7106_solicitud_descargos`tabpage_solicitud within tab_1
integer width = 3131
integer height = 1536
end type

type dw_desc_descargo from w_7106_solicitud_descargos`dw_desc_descargo within tabpage_solicitud
end type

event dw_desc_descargo::constructor;//datawindowchild ddw_desc_descargo
//
//if fg_verifica_parametro("descripcion descargos") and + &
//  gu_comunic.is_comunic.accion_llamada <> "w_7101_interrupciones" then
//	this.insertrow(0)
//	this.visible=true
//	this.GetChild('pi_desc_descargo',ddw_desc_descargo)
//	ddw_desc_descargo.SetTransObject(SQLCA)
//	ddw_desc_descargo.retrieve()
//	this.move(1590,104)
//end if
end event

type cb_menos from w_7106_solicitud_descargos`cb_menos within tabpage_solicitud
end type

type cb_mas from w_7106_solicitud_descargos`cb_mas within tabpage_solicitud
end type

type dw_puesta_explotacion from w_7106_solicitud_descargos`dw_puesta_explotacion within tabpage_solicitud
end type

type st_3 from w_7106_solicitud_descargos`st_3 within tabpage_solicitud
end type

type cb_1 from w_7106_solicitud_descargos`cb_1 within tabpage_solicitud
end type

type dw_datos_solicitud from w_7106_solicitud_descargos`dw_datos_solicitud within tabpage_solicitud
integer x = 174
integer height = 948
boolean livescroll = false
end type

event dw_datos_solicitud::itemchanged;call super::itemchanged;// Parametrizacion: Luis Ortiz Mayo/2001

fg_ventana_parametro("identificador", This)

end event

event dw_datos_solicitud::retrieveend;call super::retrieveend;long ll_causa
string ls_causa
int li_subfamilia, li_familia, li_gpo_causa
string ls_descripcion_causa

ll_causa = this.object.cod_causa[1]

string ls_descripcion//, ls_prim // GNU 2-8-2006. Mejora 1/426921
datawindowchild ddw_desc_descargo

if ll_causa > 0 then
	
	select descripcion 
	into :ls_causa 
	from gi_causa 
	where cod_causa = :ll_causa;
	
		// GNU 12-9-2007. Incidencia 0/525907
	IF fg_verifica_parametro('CAUSAS') THEN
		
			select gpo_causa,tipo, subtipo
			into :li_gpo_causa, :li_familia, :li_subfamilia 
			from gi_causa 
			where cod_causa = :ll_causa;

	
	  SELECT "GI_SUBTIPOS"."DESCRIPCION" ||'-'|| "GI_SUBTIPO_CAUSA"."DESCRIPCION" 
	  into :ls_descripcion_causa
    FROM "GI_SUBTIPOS",   
         "GI_SUBTIPO_CAUSA"
   WHERE ( "GI_SUBTIPOS"."TIPO" = "GI_SUBTIPO_CAUSA"."TIPO" ) and  
         ( "GI_SUBTIPOS"."SUBTIPO" = "GI_SUBTIPO_CAUSA"."SUBTIPO" ) 
		 AND "GI_SUBTIPO_CAUSA"."SUBTIPO"= :li_subfamilia 
		 AND "GI_SUBTIPO_CAUSA"."TIPO"= :li_familia
		 AND "GI_SUBTIPO_CAUSA"."GPO_CAUSA"=:li_gpo_causa;
		 ls_causa= ls_descripcion_causa + "-" + ls_causa
		 tab_1.tabpage_interrupciones.st_causa.TEXTSIZE=3
	end if

	tab_1.tabpage_interrupciones.st_causa.text = ls_causa
	
	
end if

//SELECT valor
//INTO :ls_prim
//FROM sgd_valor
//WHERE codif='DESC';

	ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')

	if fg_verifica_parametro("descripcion descargos") &
		and IsNumber(ls_Descripcion) then
//		and (il_nro_descargo >= long(ls_prim)) then
		tab_1.tabpage_solicitud.dw_desc_descargo.insertrow(0)
		tab_1.tabpage_solicitud.dw_desc_descargo.visible=true
		tab_1.tabpage_solicitud.dw_desc_descargo.GetChild('pi_desc_descargo',ddw_desc_descargo)
		ddw_desc_descargo.SetTransObject(SQLCA)
		ddw_desc_descargo.retrieve()
//		ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')
		tab_1.tabpage_solicitud.dw_desc_descargo.setitem(1,"pi_desc_descargo",long(ls_descripcion))

	end if
end event

type gb_solicitud_descargo from w_7106_solicitud_descargos`gb_solicitud_descargo within tabpage_solicitud
integer x = 96
integer y = 20
integer width = 2656
integer height = 1428
end type

type tabpage_otros from w_7106_solicitud_descargos`tabpage_otros within tab_1
integer width = 3131
integer height = 1536
end type

type dw_datos_solicitud_otros from w_7106_solicitud_descargos`dw_datos_solicitud_otros within tabpage_otros
end type

type tabpage_interrupciones from w_7106_solicitud_descargos`tabpage_interrupciones within tab_1
integer width = 3131
integer height = 1536
end type

type st_sel_causa from w_7106_solicitud_descargos`st_sel_causa within tabpage_interrupciones
end type

type st_causa from w_7106_solicitud_descargos`st_causa within tabpage_interrupciones
end type

type cb_otra from w_7106_solicitud_descargos`cb_otra within tabpage_interrupciones
boolean visible = true
end type

type dw_seleccion from w_7106_solicitud_descargos`dw_seleccion within tabpage_interrupciones
end type

type cb_desmarcar from w_7106_solicitud_descargos`cb_desmarcar within tabpage_interrupciones
end type

event cb_desmarcar::clicked;call super::clicked;long ll_tv1
IF ii_estado_actual<> fgci_descargo_definido THEN
	ll_tv1=tab_1.tabpage_interrupciones.tv_1.FindItem(roottreeitem!,0)
	fnu_activar_aprobacion(ll_tv1)	
END IF
end event

type cb_marcar from w_7106_solicitud_descargos`cb_marcar within tabpage_interrupciones
end type

event cb_marcar::clicked;int li_indice, li_contador, li_row, li_tipo
treeviewItem le_elemento
s_rama ls_elemento
datetime ldt_fecha

DataStore ldt_instalaciones, ldt_interrupciones
li_contador =0
li_row=0

if  NOT ib_con_interrupcion then return

ldt_fecha = Datetime(today(),now())
ldt_instalaciones = Create DataStore
ldt_interrupciones = Create DataStore
ldt_instalaciones.DataObject = 'dw_bloque_inst_desc'
ldt_interrupciones.DataObject = 'd_7004_fechas_interr'
ldt_instalaciones.SetTransObject(SQLCA)
SetPointer(HourGlass!)
tab_1.tabpage_solicitud.dw_datos_solicitud.AcceptText()
//ldt_instalaciones.Retrieve(il_nro_descargo)
ldt_interrupciones.Reset()
FOR li_indice = 1 TO il_item_hasta +1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,le_elemento)
	ls_elemento = le_elemento.data
	IF le_elemento.StatePictureIndex = 2 THEN
		
		li_row = ldt_instalaciones.find('cod_instalacion = ' + string(ls_elemento.codigo),1,ldt_instalaciones.RowCount())

		IF li_row = 0 AND sqlca.sqlcode <> -1 THEN
			
			SELECT "SGD_INSTALACION"."TIPO_INSTALACION"    
			INTO :li_tipo
			FROM "SGD_INSTALACION" 
			WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ls_elemento.codigo AND "SGD_INSTALACION"."BDI_JOB" =0;
			li_contador = ldt_instalaciones.InsertRow(0)
			ldt_instalaciones.SetItem(li_contador,'cod_instalacion',ls_elemento.codigo)
			ldt_instalaciones.SetItem(li_contador,'nro_descargo',il_nro_descargo)
			ldt_instalaciones.SetItem(li_contador,'nom_instalacion',le_elemento.label)
			ldt_instalaciones.SetItem(li_contador,'tipo_instalacion',li_tipo)
			ldt_instalaciones.SetITem(li_contador,'f_inicio',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'))
			ldt_instalaciones.SetITem(li_contador,'f_fin',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'))
			ldt_instalaciones.SetITem(li_contador,'ind_oop',0)
		ELSEIF li_row > 0 THEN 	
			ldt_instalaciones.SetITem(li_row,'f_inicio',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'))
			ldt_instalaciones.SetITem(li_row,'f_fin',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'))	
			ldt_instalaciones.SetITem(li_row,'ind_oop',0)
		END IF
	END IF
NEXT
ldt_instalaciones.AcceptText()
SetPointer(Arrow!)

OpenWithParm(w_7106_marcar_interrupcion, ldt_instalaciones)

// Recojo las interrupciones y deselecciono las instalaciones del arbol
ldt_interrupciones = Message.PowerObjectParm
IF ldt_interrupciones.RowCount() > 0 THEN
	FOR li_indice = 1 TO il_item_hasta +1
		tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,le_elemento)
		IF le_elemento.StatePictureIndex = 2 THEN
			le_elemento.StatePictureIndex = 1
			le_elemento.bold = true 
			tab_1.tabpage_interrupciones.tv_1.setitem(li_indice, le_elemento)
		
		END IF
	NEXT
	cb_marcar.enabled = false
	cb_desmarcar.enabled = false
END IF

long ll_cod_instalacion, li_fila

//LI = tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()

FOR li_indice = 1 TO ldt_interrupciones.RowCount()
	ll_cod_instalacion = ldt_interrupciones.GetITemNumber(li_indice,'cod_instalacion')
	li_row = tab_1.tabpage_interrupciones.dw_interrupcion.find('cod_instalacion = ' + string(ll_cod_instalacion),1,tab_1.tabpage_interrupciones.dw_interrupcion.RowCount())	
	IF li_row = 0 AND sqlca.sqlcode <> -1 THEN	
		li_fila=tab_1.tabpage_interrupciones.dw_interrupcion.InsertRow(0)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'nro_descargo',il_nro_descargo)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'cod_instalacion',ll_cod_instalacion)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_inicio',ldt_interrupciones.GetItemDateTime(li_indice,'f_inicio'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_fin',ldt_interrupciones.GetItemDatetime(li_indice,'f_fin'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_alta',ldt_fecha)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'programa','w_7106')
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'usuario',gs_usuario)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'ind_oop',0)
	ELSEIF li_row > 0 THEN
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_row,'f_inicio',ldt_interrupciones.GetItemDateTime(li_indice,'f_inicio'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_row,'f_fin',ldt_interrupciones.GetItemDatetime(li_indice,'f_fin'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_row,'f_alta',ldt_fecha)	
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_row,'ind_oop',0)
	END IF
NEXT

// GNU 24-06-2005
long ll_tv1
IF ii_estado_actual<> fgci_descargo_definido THEN
	ll_tv1=tab_1.tabpage_interrupciones.tv_1.FindItem(roottreeitem!,0)
	fnu_activar_aprobacion(ll_tv1)	
END IF	

// FIN GNU

//FOR li_indice = 1 TO ldt_interrupciones.RowCount()
//	
//	IF li_row = 0 AND sqlca.sqlcode <> -1 THEN
//		ldt_interrupciones.RowsCopy(li_indice,li_indice, Primary!, tab_1.tabpage_interrupciones.dw_interrupcion, tab_1.tabpage_interrupciones.dw_interrupcion.RowCount(), Primary!)
//	END IF		
//NEXT
//
//ldt_interrupciones.RowsCopy(1,ldt_interrupciones.RowCount(), Primary!, tab_1.tabpage_interrupciones.dw_interrupcion, 1, Primary!)
tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()


end event

type st_2 from w_7106_solicitud_descargos`st_2 within tabpage_interrupciones
end type

type st_1 from w_7106_solicitud_descargos`st_1 within tabpage_interrupciones
end type

type tv_1 from w_7106_solicitud_descargos`tv_1 within tabpage_interrupciones
integer y = 120
end type

event tv_1::doubleclicked;long ll_nro_instalacion, ll_handle, ll_fila
string ls_nom_instalacion
treeviewitem le_elemento
int li_tipo_inst, li_icono, li_tension
Setpointer(HourGlass!)

if handle = 0 then return

if NOT ib_con_interrupcion then return 

SELECT TIPO_INSTALACION, TENSION 
INTO :li_tipo_inst, :li_tension
FROM "SGD_INSTALACION"  
WHERE 		"SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre   
AND "SGD_INSTALACION"."ESTADO"=0 // GNU 10/01/2006. Incidencia 0/396487
AND   "SGD_INSTALACION"."BDI_JOB" = 0;   // DSA 10/01/2000			

IF gb_operaciones and li_tension <=gi_tension_nivel_min &
	AND li_tipo_inst <> fgci_tipo_ct then 
	// LO TRATA OPERACION, POR LO QUE NO SE DESPLIEGA EL $$HEX1$$c100$$ENDHEX$$RBOL
	Return	
END IF
	
tab_1.tabpage_interrupciones.tv_1.getitem(handle,le_elemento)
s_elemento = le_elemento.data
il_nro_inst_padre = s_elemento.codigo


if le_elemento.level = 3 then
        return
end if

IF le_elemento.expandedonce = true then
        return
end if

//messagebox("Nro Inst Padre",string(il_nro_inst_padre))

parent.setredraw(false)

// Hay que evaluar de que instalacion se ha abierto la rama
// Si se ha hecho un doble click sobre un ct el cursor que hay que declarar busca por cod_trafo en sgd_
// Evaluamos desde que ventana se ha abierto con el icono del arbol si es un 3 debe utilizar otro cursor

 DECLARE cu_arbol1 CURSOR FOR  
  SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
                 "SGD_INSTALACION"."NRO_INSTALACION",   
                 "SGD_INSTALACION"."TIPO_INSTALACION"    
    FROM "SGD_INSTALACION" 
WHERE   "NRO_INST_PADRE" =  :il_nro_inst_padre 
AND "SGD_INSTALACION"."ESTADO"=0 // GNU 10/01/2006. Incidencia 0/396487
AND "SGD_INSTALACION"."BDI_JOB" = 0;

// DECLARE cu_arbol2 CURSOR FOR  
//  SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
//                 "SGD_INSTALACION"."NRO_INSTALACION",   
//                 "SGD_INSTALACION"."TIPO_INSTALACION"    
//    FROM "SGD_INSTALACION" 
//WHERE  "CO_NIVEL" < 6 AND "NRO_INSTALACION" >= 65000000 and "NRO_INSTALACION" <= 65999999 and "NRO_INST_PADRE" =  :il_nro_inst_padre ;
//

//if le_elemento.pictureindex <> 3 then
        open cu_arbol1 ;
        fetch cu_arbol1 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst;
//else
//        open cu_arbol2;
//        fetch cu_arbol2 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst;
//end if

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
	li_icono = f_icono_arbol(li_tipo_inst)
	ll_handle = tab_1.tabpage_interrupciones.tv_1.insertitemsort(handle,ls_nom_instalacion,li_icono)
	tab_1.tabpage_interrupciones.tv_1.getitem(ll_handle, le_elemento)
   	s_elemento.codigo = ll_nro_instalacion
	s_elemento.fila = li_tipo_inst
	ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ll_nro_instalacion) + " and ind_oop = 0",1, dw_interrupcion.RowCount( ))
	//ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ll_nro_instalacion) ,1, dw_interrupcion.RowCount( ))
	if ll_fila>0  then le_elemento.bold = true
	le_elemento.data = s_elemento
	le_elemento.StatePictureIndex = 1
	tab_1.tabpage_interrupciones.tv_1.setitem(ll_handle, le_elemento)
	fetch cu_arbol1 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst;
loop

close cu_arbol1 ;

tab_1.tabpage_interrupciones.tv_1.selectitem(handle)
parent.setredraw(true)

end event

event tv_1::selectionchanged;call super::selectionchanged;treeviewitem le_elemento
long ll_longitud, ll_codigo,ll_nro_instalacion, ll_fila
long ll_interrumpido, ll_dias, ll_resto, ll_horas, ll_minutos
string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos", ls_tiempo
datetime inicio, final
il_handle = newhandle
s_rama s_estructura

tab_1.tabpage_interrupciones.tv_1.getitem(newhandle,le_elemento)

s_estructura = le_elemento.data
ll_codigo = s_estructura.codigo

ll_fila = s_estructura.fila 

ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ll_codigo) ,1, dw_interrupcion.RowCount( ))


if ll_fila > 0  then 
	tab_1.tabpage_interrupciones.dw_interrupcion.visible = true
	tab_1.tabpage_interrupciones.dw_interrupcion.ScrollToRow(ll_fila)
	inicio = tab_1.tabpage_interrupciones.dw_interrupcion.getitemdatetime(ll_fila,"f_inicio")
	final = tab_1.tabpage_interrupciones.dw_interrupcion.getitemdatetime(ll_fila,"f_fin")
else 
	tab_1.tabpage_interrupciones.dw_interrupcion.visible = false
end if

ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ll_codigo) + " and ind_oop = 0" ,1, dw_interrupcion.RowCount( ))

if ll_fila > 0  then 
	le_elemento.bold = true
	tab_1.tabpage_interrupciones.tv_1.setitem(il_handle, le_elemento)
end if 

IF ii_estado_actual <> fgci_descargo_definido THEN
if ii_habilitar_marcado_int = 0 then // Si no est$$HEX2$$e1002000$$ENDHEX$$habilitado el marcado de interrupciones
	cb_eliminar.visible = FALSE
	cb_otra.visible = FALSE
end if
END IF
end event

type gb_2 from w_7106_solicitud_descargos`gb_2 within tabpage_interrupciones
end type

type gb_4 from w_7106_solicitud_descargos`gb_4 within tabpage_interrupciones
integer x = 27
integer height = 1092
end type

type dw_interrupcion from w_7106_solicitud_descargos`dw_interrupcion within tabpage_interrupciones
integer width = 1312
end type

type gb_1 from w_7106_solicitud_descargos`gb_1 within tabpage_interrupciones
integer x = 1445
integer width = 1417
end type

type dw_seccionadores from w_7106_solicitud_descargos`dw_seccionadores within tabpage_interrupciones
end type

type cb_clientes from w_7106_solicitud_descargos`cb_clientes within tabpage_interrupciones
end type

type cb_eliminar from w_7106_solicitud_descargos`cb_eliminar within tabpage_interrupciones
end type

type gb_causa from w_7106_solicitud_descargos`gb_causa within tabpage_interrupciones
end type

type tabpage_int_simulacion from w_7106_solicitud_descargos`tabpage_int_simulacion within tab_1
integer width = 3131
integer height = 1536
end type

type dw_int_simulacion from w_7106_solicitud_descargos`dw_int_simulacion within tabpage_int_simulacion
end type

type tabpage_historial from w_7106_solicitud_descargos`tabpage_historial within tab_1
integer width = 3131
integer height = 1536
end type

type uo_historial from w_7106_solicitud_descargos`uo_historial within tabpage_historial
end type

event uo_historial::constructor;call super::constructor;Int li_tension, indice, li_par
String ls_desc, ls_aux
Boolean lb_sigo

if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_OBS","ACC_MANTEN")= 1 then
	// El usuario tiene acceso de mantenimiento.
	// Se comprueba el nivel de tensi$$HEX1$$f300$$ENDHEX$$n.
	SELECT NVL(TENSION,0)
	INTO :li_tension
	FROM SGD_INSTALACION, SGD_DESCARGOS
	WHERE SGD_DESCARGOS.NRO_DESCARGO = :gu_comunic.is_comunic.longval2  AND 
			SGD_INSTALACION.NRO_INSTALACION = SGD_DESCARGOS.COD_INST_ORIGEN AND
			SGD_INSTALACION.BDI_JOB = 0;
	
	ls_desc  = gu_perfiles.of_nivel_tension('DES_OBS')
	
	for indice = 1 to len(ls_desc)
		li_par =  mod (indice,2)
		IF li_par <> 0 then
			ls_aux = mid(ls_desc,indice,1)
			if ls_aux <> ',' and lb_sigo = true then
				if integer(ls_aux) = li_tension or ls_aux = '0' then
					lb_sigo = false
				end if
			end if
		end if
	next
	// No tiene permiso para ese nivel
	If lb_sigo = true then
		dw_historial.Modify("obs_estado.Edit.DisplayOnly=Yes")
		mle_observaciones.DisplayOnly = TRUE
	end if
	
	else
		dw_historial.Modify("obs_estado.Edit.DisplayOnly=Yes")
		mle_observaciones.DisplayOnly = TRUE
end if

end event

type tabpage_instalaciones from w_7106_solicitud_descargos`tabpage_instalaciones within tab_1
integer width = 3131
integer height = 1536
end type

type mle_observaciones from w_7106_solicitud_descargos`mle_observaciones within tabpage_instalaciones
integer x = 59
integer y = 120
end type

event mle_observaciones::constructor;call super::constructor;This.visible = fg_verifica_parametro("DESCARGOS OTRAS INST")
end event

type gb_6 from w_7106_solicitud_descargos`gb_6 within tabpage_instalaciones
end type

type tabpage_accion from w_7106_solicitud_descargos`tabpage_accion within tab_1
integer width = 3131
integer height = 1536
end type

type uo_1 from w_7106_solicitud_descargos`uo_1 within tabpage_accion
end type

type gb_5 from w_7106_solicitud_descargos`gb_5 within w_7106_solicitud_descargos_rechazados
end type


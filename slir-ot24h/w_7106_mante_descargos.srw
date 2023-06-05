HA$PBExportHeader$w_7106_mante_descargos.srw
forward
global type w_7106_mante_descargos from w_sgigenerica
end type
type cb_3 from commandbutton within w_7106_mante_descargos
end type
type cb_guardar from commandbutton within w_7106_mante_descargos
end type
type cb_1 from commandbutton within w_7106_mante_descargos
end type
type tab_1 from tab within w_7106_mante_descargos
end type
type tabpage_solicitud from userobject within tab_1
end type
type cb_menos from commandbutton within tabpage_solicitud
end type
type cb_mas from commandbutton within tabpage_solicitud
end type
type st_56 from statictext within tabpage_solicitud
end type
type dw_puesta_explotacion from u_sgt_instalaciones within tabpage_solicitud
end type
type dw_descargo from datawindow within tabpage_solicitud
end type
type gb_7 from groupbox within tabpage_solicitud
end type
type cb_2 from commandbutton within tabpage_solicitud
end type
type tabpage_solicitud from userobject within tab_1
cb_menos cb_menos
cb_mas cb_mas
st_56 st_56
dw_puesta_explotacion dw_puesta_explotacion
dw_descargo dw_descargo
gb_7 gb_7
cb_2 cb_2
end type
type tabpage_otros from userobject within tab_1
end type
type dw_descargo_otros from datawindow within tabpage_otros
end type
type tabpage_otros from userobject within tab_1
dw_descargo_otros dw_descargo_otros
end type
type tabpage_interrupcion from userobject within tab_1
end type
type st_causa from statictext within tabpage_interrupcion
end type
type st_6 from statictext within tabpage_interrupcion
end type
type st_5 from statictext within tabpage_interrupcion
end type
type st_3 from statictext within tabpage_interrupcion
end type
type st_2 from statictext within tabpage_interrupcion
end type
type st_9 from statictext within tabpage_interrupcion
end type
type st_8 from statictext within tabpage_interrupcion
end type
type st_7 from statictext within tabpage_interrupcion
end type
type st_interrupcion from statictext within tabpage_interrupcion
end type
type tv_1 from uo_man_instalac within tabpage_interrupcion
end type
type gb_4 from groupbox within tabpage_interrupcion
end type
type gb_2 from groupbox within tabpage_interrupcion
end type
type gb_3 from groupbox within tabpage_interrupcion
end type
type cb_marcar from commandbutton within tabpage_interrupcion
end type
type cb_clientes from commandbutton within tabpage_interrupcion
end type
type gb_5 from groupbox within tabpage_interrupcion
end type
type gb_causa from groupbox within tabpage_interrupcion
end type
type dw_1 from datawindow within tabpage_interrupcion
end type
type st_4 from statictext within tabpage_interrupcion
end type
type tabpage_interrupcion from userobject within tab_1
st_causa st_causa
st_6 st_6
st_5 st_5
st_3 st_3
st_2 st_2
st_9 st_9
st_8 st_8
st_7 st_7
st_interrupcion st_interrupcion
tv_1 tv_1
gb_4 gb_4
gb_2 gb_2
gb_3 gb_3
cb_marcar cb_marcar
cb_clientes cb_clientes
gb_5 gb_5
gb_causa gb_causa
dw_1 dw_1
st_4 st_4
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
type gb_8 from groupbox within tabpage_instalaciones
end type
type tabpage_instalaciones from userobject within tab_1
mle_observaciones mle_observaciones
gb_8 gb_8
end type
type tabpage_accion from userobject within tab_1
end type
type dw_informacion_extra from datawindow within tabpage_accion
end type
type dw_instalacion from u_tab_7002_instalacion_descargos within tabpage_accion
end type
type dw_rechaza from u_tab_7002_grabar_descargos within tabpage_accion
end type
type dw_solicitud from u_tab_7002_solicitar_descargos within tabpage_accion
end type
type tabpage_accion from userobject within tab_1
dw_informacion_extra dw_informacion_extra
dw_instalacion dw_instalacion
dw_rechaza dw_rechaza
dw_solicitud dw_solicitud
end type
type tabpage_trabajos from userobject within tab_1
end type
type dw_trabajos_bdi from datawindow within tabpage_trabajos
end type
type gb_6 from groupbox within tabpage_trabajos
end type
type tabpage_trabajos from userobject within tab_1
dw_trabajos_bdi dw_trabajos_bdi
gb_6 gb_6
end type
type tabpage_int_simulacion from userobject within tab_1
end type
type dw_int_simulacion from u_info_int_descargo within tabpage_int_simulacion
end type
type tabpage_int_simulacion from userobject within tab_1
dw_int_simulacion dw_int_simulacion
end type
type tab_1 from tab within w_7106_mante_descargos
tabpage_solicitud tabpage_solicitud
tabpage_otros tabpage_otros
tabpage_interrupcion tabpage_interrupcion
tabpage_historial tabpage_historial
tabpage_instalaciones tabpage_instalaciones
tabpage_accion tabpage_accion
tabpage_trabajos tabpage_trabajos
tabpage_int_simulacion tabpage_int_simulacion
end type
type sw_rama from structure within w_7106_mante_descargos
end type
end forward

type sw_rama from structure
        long            fila
        long            codigo
end type

global type w_7106_mante_descargos from w_sgigenerica
integer x = 247
integer y = 324
integer width = 3173
integer height = 2008
string title = "Aprobaci$$HEX1$$f300$$ENDHEX$$n del Descargo"
windowtype windowtype = response!
long backcolor = 79741120
boolean clientedge = true
event ue_presentacion pbm_custom25
event ue_rechazar ( )
cb_3 cb_3
cb_guardar cb_guardar
cb_1 cb_1
tab_1 tab_1
end type
global w_7106_mante_descargos w_7106_mante_descargos

type variables
u_generico_comunicaciones iu_comunic
boolean ib_guardo=false
long il_nom_inst_afectada, il_grande = 1
string is_nom_solicitante
datetime idt_fecha_ini
datetime idt_fecha_fin
int ii_estado
long il_nro_descargo
boolean ib_presionado = false
boolean ib_sin_interrup            // DSA 03/04/2000	
string is_txt, is_htm, is_ruta_txt, is_ruta_htm
//estructura de comunicaciones
u_generico_comunicaciones  lu_comunic
boolean lb_tiene_perfil_oper
long il_handle
s_rama s_elemento
long ll_apertura = 0
integer ii_grabo = 0
integer ii_accion 
long il_error = 0
long il_nro_inst_padre
long il_sesion_operacion
long il_item_hasta=0
boolean ib_error
boolean ib_new_tip_inc // TIPO INCIDENCIA AMR
treeviewitem le_elemento_click
end variables

forward prototypes
public function integer fw_guardar_cambios ()
public subroutine fw_inst_descargo ()
public function long fw_tiene_interrupcion (datawindow d_interrupcion, long codigo)
public subroutine fw_cargar_arbol (integer co_nivel)
public function long fw_busqueda_arbol (long nro_padre)
public subroutine fw_enviar_mail ()
public subroutine fw_armar_mail (string ps_email)
public function boolean fw_comprobar_interrupciones_previstas (long pl_descargo)
public subroutine fw_deshabilita_tab_interrupciones ()
public function integer fw_rechazar_trabajo (integer pi_nro_trabajo)
public function integer fw_validar_fechas ()
public function string fw_calcular_estado (long pl_estado)
public function integer fw_anade_registro ()
public function integer fw_comprueba_padres_hijos (treeviewitem pe_elemento)
public function integer fw_direccion (treeviewitem pe_elemento, treeviewitem pe_elemento_h)
public function long fw_puede_seleccionar (treeviewitem pe_elemento, integer pi_nivel)
public function long fw_buscar_hijos_marcados (treeviewitem pe_elemento)
public subroutine fw_habilitar_botones (treeviewitem pe_elemento)
public function long fw_comprobar_otros_desc (datetime pdt_fecha_ini, datetime pdt_fecha_fin, long pl_nro_instalacion)
public function integer fnu_poner_blanco (integer li_item)
public subroutine fw_fichero_trabajos_htm (long pi_nro_descargo, string ps_nombre_inst, string ps_observacion, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo)
public subroutine fw_fichero_trabajos_txt (long pi_nro_descargo, string ps_nombre_inst, string ps_observacion, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo)
public subroutine fw_fichero_txt (long pi_nro_descargo, string ps_nom_instalacion, datetime pdt_solicitado, datetime pdt_ini_descargo_sol, datetime pdt_fin_descargo_sol, string ps_observaciones, datetime pdt_ini_descargo_ap, datetime pdt_fin_descargo_ap)
public subroutine fw_fichero_htm (long pi_nro_descargo, string ps_nom_instalacion, datetime pdt_solicitado, datetime pdt_ini_descargo_sol, datetime pdt_fin_descargo_sol, string ps_observaciones, datetime pdt_ini_descargo_ap, datetime pdt_fin_descargo_ap)
end prototypes

event ue_presentacion;int li_Estado
datetime ldt_f_ini_aprob, ldt_f_fin_aprob
string ls_estado

w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.SetTransObject(SQLCA)
w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.retrieve(lu_comunic.is_comunic.longval2)
tab_1.tabpage_solicitud.dw_puesta_explotacion.SetTransObject(SQLCA)
tab_1.tabpage_solicitud.dw_puesta_explotacion.retrieve(lu_comunic.is_comunic.longval2)
// GNU 18-1-2006. Incidencia pruebas integradas Nicaragua
tab_1.tabpage_solicitud.dw_puesta_explotacion.Show()
// FIN GNU

IF iu_comunic.is_comunic.Accion_llamada = "Modificacion" or &
   iu_comunic.is_comunic.Accion_llamada = "Aprobacion" then
	
	IF tab_1.tabpage_solicitud.dw_descargo.GetItemNumber(1, 'ind_interrupcion') = 1 AND &
		fw_comprobar_interrupciones_previstas(il_nro_descargo) = FALSE THEN
		
		tab_1.tabpage_solicitud.dw_descargo.SetItem(1, 'ind_interrupcion', 2)
	END IF
END IF

li_estado = w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.GetItemNumber (1,'estado')
ldt_f_ini_aprob = w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.GetITemDateTime(1,'f_ini_aprobado')
ldt_f_fin_aprob = w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.GetITemDateTime(1,'f_ini_aprobado')
tab_1.tabpage_instalaciones.mle_observaciones.text=tab_1.tabpage_solicitud.dw_descargo.object.inst_descargar[1]
ls_estado = fw_calcular_estado (li_estado)
tab_1.tabpage_solicitud.dw_descargo.object.estado.text = ls_Estado
// Si el descargo ya tiene fecha de aprobaci$$HEX1$$f300$$ENDHEX$$n en fecha inicio y fin del descargo
// deben mostrarse las fechas de inicio y fin de aprobaci$$HEX1$$f300$$ENDHEX$$n
//IF (li_Estado = fgci_descargo_aprobado or li_estado = fgci_descargo_modificado or li_estado = fgci_descargo_activado  or &
//   li_estado = fgci_descargo_no_activado or li_estado = fgci_descargo_finalizado or li_estado = fgci_descargo_rechazado or &
//	li_estado = fgci_descargo_anulado or li_estado = fgci_descargo_aplazado) and &
//	Not IsNull(ldt_f_ini_aprob) and Not IsNull(ldt_f_fin_aprob) THEN
//	w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.Modify("f_ini_solicitado.visible = false")
//	w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.Modify("f_fin_solicitado.visible = false")	
//	w_7106_mante_descargos.tab_1.tabpage_accion.dw_solicitud.Modify("f_ini_solicitado.visible = false")
//	w_7106_mante_descargos.tab_1.tabpage_accion.dw_solicitud.Modify("f_fin_solicitado.visible = false")
	w_7106_mante_descargos.tab_1.tabpage_interrupcion.st_3.text = string(ldt_f_ini_aprob)
	w_7106_mante_descargos.tab_1.tabpage_interrupcion.st_5.text = string(ldt_f_fin_aprob)
//ELSE
//	w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.Modify("f_ini_solicitado.visible = true")
//	w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.Modify("f_fin_solicitado.visible = true")	
//END IF

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

w_7106_mante_descargos.tab_1.tabpage_otros.dw_descargo_otros.SetTransObject(SQLCA)
w_7106_mante_descargos.tab_1.tabpage_otros.dw_descargo_otros.retrieve(lu_comunic.is_comunic.longval2)

//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

end event

event ue_rechazar;int li_total, li_row, li_nro_trabajo, li_retorno,i, li_primera
Datetime ldt_f_ini, ldt_f_fin, ldt_f_cambio
Long ll_nro_instalacion

li_primera = 0
li_total = tab_1.tabpage_trabajos.dw_trabajos_bdi.RowCount()
do
	li_row= tab_1.tabpage_trabajos.dw_trabajos_bdi.GetSelectedRow(li_primera)
	IF li_row <> 0 then
		li_nro_trabajo = tab_1.tabpage_trabajos.dw_trabajos_bdi.GetItemNumber(li_row,'codigo')
		li_retorno = fw_rechazar_trabajo(li_nro_trabajo)
		IF li_retorno <> 0 THEN 
			messagebox("Aviso","No se ha podido rechazar los trabajos")
			gnu_u_transaction.uf_rollback()
			exit
		ELSE
			gnu_u_transaction.uf_commit(); 
		END IF	
	   li_primera = li_row
	
	END IF
loop while (li_row <> 0)

ldt_f_ini=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_ini_aprobado")
ldt_f_fin=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_fin_aprobado")
ldt_f_cambio = tab_1.tabpage_accion.dw_rechaza.GetItemDatetime(1, 'f_aprobado')

IF IsNull(ldt_f_ini) THEN
	ldt_f_ini = tab_1.tabpage_solicitud.dw_descargo.getitemdatetime(1,"f_ini_solicitado")
	ldt_f_fin = tab_1.tabpage_solicitud.dw_descargo.getitemdatetime(1,"f_fin_solicitado")
END IF

UPDATE "SGD_DESCARGOS"  
SET "ESTADO" = :fgci_descargo_rechazado_bdi
WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo;

if sqlca.sqlcode=0 then
	
	ll_nro_instalacion = tab_1.tabpage_solicitud.dw_descargo.GetItemnumber(1, 'sgd_descargos_cod_inst_origen')
	
	IF fg_insertar_estado_descargo(il_nro_descargo, fgci_descargo_rechazado_bdi, ldt_f_ini, &
										 ldt_f_fin, ldt_f_cambio, &
										 tab_1.tabpage_accion.dw_rechaza.GetItemString(1, 'obs_aprobado'), &
										 ll_nro_instalacion) = FALSE THEN
										 
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido actualizar el Descargo debido a que no se ha podido grabar la informaci$$HEX1$$f300$$ENDHEX$$n asociada a sus estados")
		gnu_u_transaction.uf_rollback()
	ELSE
		gnu_u_transaction.uf_commit()
	END IF
else
	gnv_msg.f_mensaje("AD04","","",Ok!)
   gnu_u_transaction.uf_rollback()
   //messagebox("Aviso","El descargo no pudo ser actualizado.")
end if				
end event

public function integer fw_guardar_cambios ();datetime ldt_f_cambio
datetime dt_fecha_aprob
datetime dt_f_ini_aprob, dt_f_ini_int, ldt_f_ini_descargo, ldt_f_peticion
datetime dt_f_fin_aprob, dt_f_fin_int, ldt_f_fin_descargo
string ls_obs
long ll_fila, ll_nro_instalacion, ll_i, ll_row, ll_fechas, ll_ret
int li_estado, li_nro_descargo, li_contador, li_ind_grafica =0
DateTime ldt_fecha_valida_ini, ldt_fecha_valida_fin

//d_interrupcion.accepttext() // DSA 03/04/2000	
//if not ib_sin_interrup then tab_1.tabpage_accion.d_interrupcion.accepttext()
tab_1.tabpage_accion.dw_rechaza.accepttext()
//************************************************************************//
// Parametrizacion: Informacion extra en descargos                        //
// Luis Eduardo Ortiz Mayo/2001                                           //
//************************************************************************//
tab_1.tabpage_accion.dw_informacion_extra.AcceptText()
//************************************************************************//
// Luis Eduardo Ortiz Mayo/2001                                           //
//************************************************************************//

dt_fecha_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_aprobado")
dt_f_ini_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_ini_aprobado")
dt_f_fin_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_fin_aprobado")
li_nro_descargo = tab_1.tabpage_solicitud.dw_descargo.GetItemNumber(1,"nro_descargo")
ldt_f_ini_descargo = tab_1.tabpage_solicitud.dw_descargo.GetItemDateTime(1,"f_ini_solicitado")
ldt_f_fin_descargo = tab_1.tabpage_solicitud.dw_descargo.GetItemDateTime(1,"f_fin_solicitado")
ldt_f_peticion = tab_1.tabpage_solicitud.dw_descargo.GetItemDateTime(1,"f_solicitado")
ls_obs=tab_1.tabpage_accion.dw_rechaza.getitemstring(1,"obs_aprobado")
tab_1.tabpage_solicitud.dw_descargo.object.inst_descargar[1] =  tab_1.tabpage_instalaciones.mle_observaciones.text

ll_fechas = 0	
IF iu_comunic.is_comunic.Accion_llamada = "Modificacion" then	
	ll_ret = fw_comprobar_otros_desc(dt_f_ini_aprob, dt_f_fin_aprob, &
												tab_1.tabpage_solicitud.dw_descargo.GetItemnumber(1, 'sgd_descargos_cod_inst_origen')) 

	IF ll_Ret > 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n.","Ya existe un descargo (" + string(ll_ret) + ") en esa instalaci$$HEX1$$f300$$ENDHEX$$n para ese periodo de tiempo.",information!,ok!)
		return -1
	END IF
	
	tab_1.tabpage_solicitud.dw_puesta_explotacion.accepttext()
	
	if  tab_1.tabpage_solicitud.dw_puesta_explotacion.rowcount() > 0 then
		for li_contador = 1 to  tab_1.tabpage_solicitud.dw_puesta_explotacion.rowcount() 
			if isnull(trim(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.identificador_instalacion[li_contador])) then
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un identificador de instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
				//gnu_u_transaction.uf_rollback();
				return -1
			end if			
			if isnull(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.nro_instalacion[li_contador]) then
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un N$$HEX1$$fa00$$ENDHEX$$mero de Instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
				//gnu_u_transaction.uf_rollback();
				return -1
			end if			
			if isnull(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.tipo_instalacion[li_contador]) then
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un Tipo de Instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
				//gnu_u_transaction.uf_rollback();
				return -1
			end if			
		next
	end if

	tab_1.tabpage_solicitud.dw_puesta_explotacion.update()

	// Valida las fechas de las interrupciones
	
	tab_1.tabpage_interrupcion.dw_1.setfilter("NRO_DESCARGO = " + string(li_nro_descargo))
	tab_1.tabpage_interrupcion.dw_1.filter()

	ll_row = tab_1.tabpage_interrupcion.dw_1.RowCount()

	
	For ll_i = 1 To ll_row
		 ldt_fecha_valida_ini = tab_1.tabpage_interrupcion.dw_1.GetItemDateTime(ll_i,"f_inicio")
		 ldt_fecha_valida_fin = tab_1.tabpage_interrupcion.dw_1.GetItemDateTime(ll_i,"f_fin")
		 If IsNull(ldt_fecha_valida_ini) Or Not IsDate(String(Date(ldt_fecha_valida_ini))) Then
			  gnv_msg.f_mensaje("AD28","","",ok!)
			 Return -1
		 End If
		 If IsNull(ldt_fecha_valida_fin) Or Not IsDate(String(Date(ldt_fecha_valida_fin))) Then
			 gnv_msg.f_mensaje("AD27","","",ok!)
			 Return -1
		 End If
		 
		 IF (dt_f_ini_aprob > ldt_fecha_valida_ini) or (dt_f_fin_aprob < ldt_fecha_valida_fin) then
			 ll_fechas = ll_fechas + 1
		 END IF
	Next
END IF

IF ll_fechas > 0  THEN 
	gnv_msg.f_mensaje("AM67","","",ok!)
	return -1
END IF


if isnull(dt_fecha_aprob) or dt_fecha_aprob > fgnu_fecha_actual() or &
   dt_fecha_aprob < ldt_f_peticion then
	choose case ii_estado
   	case fgci_descargo_modificado
      	gnv_msg.f_mensaje("AD11","","",ok!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de modificaci$$HEX1$$f300$$ENDHEX$$n no debe ser nula ni superior a la del dia")
         return -1
      case fgci_descargo_aprobado
      	gnv_msg.f_mensaje("AD12","","",ok!)
         //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de aprobaci$$HEX1$$f300$$ENDHEX$$n no debe ser nula ni superior a la del dia")
         return -1
      case fgci_descargo_rechazado
      	gnv_msg.f_mensaje("AD13","","",ok!)
         //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de rechazo no debe ser nula ni superior a la del dia")
         return -1
								
	end choose
else
// GNU 5-6-2007. Incidencia 0/508179
//	if ii_estado=fgci_descargo_modificado then
	if ii_estado=fgci_descargo_modificado or &
		ii_estado=fgci_descargo_aprobado then
// FIN GNU		
   	if isnull(dt_f_ini_aprob) or dt_f_ini_aprob < fgnu_fecha_actual() then
      	gnv_msg.f_mensaje("AD14","","",ok!)
        	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de descargo no debe ser nula ni inferior a la del dia")
         return -1
      else
      	if isnull(dt_f_fin_aprob) or dt_f_fin_aprob < fgnu_fecha_actual() then
         	gnv_msg.f_mensaje("AD15","","",ok!)
            //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de fin de descargo no debe ser nula ni inferior a la del dia")
            return -1
         else
         	if dt_f_ini_aprob > dt_f_fin_aprob then
            	gnv_msg.f_mensaje("AD16","","",ok!)
               //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de descargo no debe ser mayor que la fecha de fin")
               return -1
            end if
         end if 
     	end if
	end if
   
	if iu_comunic.is_comunic.Accion_llamada <> 'Rechazado BDI' AND &
			( isnull(ls_obs) or ls_obs="") then 
   	gnv_msg.f_mensaje("AD19","","",ok!)
      //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se deben ingresar observaciones")
      return -1
   end if
//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

	If fg_verifica_parametro("solicitud_descargos_extra") Then
		w_7106_mante_descargos.tab_1.tabpage_otros.Visible = True
		
		IF iu_comunic.is_comunic.Accion_llamada = "Aprobacion" then
			tab_1.tabpage_accion.dw_informacion_extra.Visible = True
		End If
	End If
//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

end if

SELECT "SGD_DESCARGOS"."IND_ACT_GRAFICA" 
INTO :li_ind_grafica
FROM "SGD_DESCARGOS"  
WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo  ;

if li_ind_grafica=1 then // TIENE TRABAJO ASOCIADO DE BDI
	IF iu_comunic.is_comunic.Accion_llamada = "Rechazo" THEN
		li_estado=fgci_trabajo_rechazado_alfa             
	elseif iu_comunic.is_comunic.Accion_llamada = "Aprobacion" THEN
		li_estado=fgci_trabajo_aprobado
	else 
		li_estado=fgci_trabajo_solicitado // Solicitado       
	END IF
	
	UPDATE "SGD_TRABAJOS_BDI"  
	SET "ESTADO_TRABAJO" = :li_estado
	WHERE "SGD_TRABAJOS_BDI"."NRO_DESCARGO" = :il_nro_descargo   ;
	
	if sqlca.sqlcode<>0 then 
		 gnv_msg.f_mensaje("AD21","","",ok!)
		 return -1 
	end if 
	
end if 
// GNU 2-2-2006. Incidencia 0/403296
tab_1.tabpage_solicitud.dw_descargo.setitem(1,"usuario", gs_usuario)
// FIN GNU
tab_1.tabpage_solicitud.dw_descargo.update()

IF tab_1.tabpage_accion.dw_rechaza.update()=1 THEN
	IF NOT ib_sin_interrup THEN
		IF tab_1.tabpage_interrupcion.dw_1.update() <> 1 THEN
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido grabar las fechas de las interrupciones")
			//gnu_u_transaction.uf_rollback();
			return -1
		END IF
	END IF
//		
//	  IF ii_estado=fgci_descargo_modificado THEN
//
//	  ELSE
	// Inicio*** Parametrizacion, Luis Ortiz Mayo/2001
	  IF fg_verifica_parametro("solicitud_descargos_extra") THEN
			IF iu_comunic.is_comunic.Accion_llamada = "Aprobacion" THEN
				IF tab_1.tabpage_accion.dw_informacion_extra.Update() <> 1 THEN
					//gnv_msg.f_mensaje("IA07","","",ok!)
					//messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El descargo ha quedado actualizado")
					//gnu_u_transaction.uf_commit()
					//Return 1
				//ELSE
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Imposible actualizar Informaci$$HEX1$$f300$$ENDHEX$$n Extra")
					//gnu_u_transaction.uf_rollback();
					return -1
				END IF
			END IF
		//ELSE
		// Fin**** Parametrizacion, Luis Ortiz Mayo/2001
		//	gnv_msg.f_mensaje("IA07","","",ok!)
			//messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El descargo ha quedado actualizado")
			//gnu_u_transaction.uf_commit();
		//	return 1
	//			END IF 

	END IF
ELSE
	gnv_msg.f_mensaje("AD21","","",ok!)
   return -1
   //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Imposible actualizar el Descargo")
END IF

IF tab_1.tabpage_historial.uo_historial.dw_historial.AcceptText() = 1 THEN
	IF tab_1.tabpage_historial.uo_historial.dw_historial.update() <> 1 THEN
		gnv_msg.f_mensaje("AD21","","",ok!)
		return -1
	END IF
ELSE
	return -1
END IF

IF IsNull(dt_f_ini_aprob) THEN
	dt_f_ini_aprob = ldt_f_ini_descargo
	dt_f_fin_aprob = ldt_f_fin_descargo
END IF

ldt_f_cambio = tab_1.tabpage_accion.dw_rechaza.GetItemDatetime(1, 'f_aprobado')
ll_nro_instalacion = tab_1.tabpage_solicitud.dw_descargo.GetItemnumber(1, 'sgd_descargos_cod_inst_origen')

IF fg_insertar_estado_descargo(li_nro_descargo, ii_estado, dt_f_ini_aprob, &
										 dt_f_fin_aprob, ldt_f_cambio,&
										 tab_1.tabpage_accion.dw_rechaza.GetItemString(1, 'obs_aprobado'), &
										 ll_nro_instalacion) = FALSE THEN
	
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido guardar la informaci$$HEX1$$f300$$ENDHEX$$n de los estados asociados al Descargo")
	return -1
ELSE
	gnv_msg.f_mensaje("IA07","","",ok!)
	//messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El descargo ha quedado actualizado")
	return 1
END IF
end function

public subroutine fw_inst_descargo ();long ll_fila,ll_handle,ll_co_nivel, ll_codigo, ll_tipo, ll_icono,ll_inst_afect,ll_nro_inst_padre,ll_array[]
string ls_nombre
Integer li_tension,li_permito,li_inst_oop=0
treeviewitem le_elemento
sw_rama sl_rama

//Obtengo el nombre, codigo de nivel
        
SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
       "SGD_INSTALACION"."CO_NIVEL", TIPO_INSTALACION, TENSION 
INTO :ls_nombre,   
       :ll_co_nivel  , :ll_tipo, :li_tension
FROM "SGD_INSTALACION"  
WHERE 		"SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre   
AND   "SGD_INSTALACION"."BDI_JOB" = 0;   // DSA 10/01/2000			


IF gb_operaciones = true and gb_operaciones_inst = true then	  
						
		// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	
		ll_array[2] = il_nro_inst_padre
		li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],ll_tipo)

		if (li_permito = 1 or li_permito = 2) then
			li_inst_oop = 1
		end if

ELSE
	IF (gb_operaciones and li_tension <=gi_tension_nivel_min &
		AND ll_tipo <> fgci_tipo_ct)  then // LO TRATA OPERACIONES
		
		li_inst_oop = 1
	END IF
END IF
 
if li_inst_oop = 1 then
	tab_1.tabpage_interrupcion.Text = 'Instalaciones'
	tab_1.tabpage_interrupcion.PictureName = "Regenerate!"
	tab_1.tabpage_interrupcion.gb_3.visible = False	
	tab_1.tabpage_interrupcion.gb_4.visible = False	
	tab_1.tabpage_interrupcion.gb_5.visible = False	
	tab_1.tabpage_interrupcion.st_7.visible = False	
	tab_1.tabpage_interrupcion.st_3.visible = False	
	tab_1.tabpage_interrupcion.st_8.visible = False	
	tab_1.tabpage_interrupcion.st_5.visible = False	
	tab_1.tabpage_interrupcion.st_9.visible = False	
	tab_1.tabpage_interrupcion.st_6.visible = False	
	tab_1.tabpage_interrupcion.st_2.visible = False	
	tab_1.tabpage_int_simulacion.visible = TRUE
	tab_1.tabpage_int_simulacion.dw_int_simulacion.SetTransObject(SQLCA)
	tab_1.tabpage_int_simulacion.dw_int_simulacion.Retrieve(il_nro_descargo)
end if
// Compruebo si existe interrupciones para la instalacion en ese descargo

ll_fila = fw_tiene_interrupcion(tab_1.tabpage_interrupcion.dw_1,il_nro_inst_padre)

// Se crea la rama de primer nivel
ll_icono = tab_1.tabpage_interrupcion.tv_1.f_icono_arbol(ll_tipo)
ll_handle = tab_1.tabpage_interrupcion.tv_1.insertitemsort(0,ls_nombre,ll_icono)
tab_1.tabpage_interrupcion.tv_1.getitem(ll_handle,le_elemento)
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
le_elemento.StatePictureIndex = 1
tab_1.tabpage_interrupcion.tv_1.setitem(ll_handle,le_elemento)

// Cargo mas niveles

DECLARE desc_inst_afect CURSOR FOR  
SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
		"SGD_INSTALACION"."CO_NIVEL",
		"SGD_INSTALACION"."TIPO_INSTALACION", 
		"SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION"
 FROM "SGD_INSTALACION" ,"SGD_DESCARGOS_INST_AFEC" 
WHERE 		"SGD_DESCARGOS_INST_AFEC"."NRO_DESCARGO" =  :il_nro_descargo 
		AND   "SGD_INSTALACION"."BDI_JOB" = 0 
		AND   "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION" 
		AND 	"SGD_INSTALACION"."NRO_INSTALACION" <> :il_nro_inst_padre ; 

OPEN desc_inst_afect;

FETCH desc_inst_afect into  :ls_nombre, :ll_co_nivel, :ll_tipo,:ll_nro_inst_padre;

DO WHILE sqlca.sqlcode = 0

	ll_fila = fw_tiene_interrupcion(tab_1.tabpage_interrupcion.dw_1,ll_nro_inst_padre)

	ll_icono = tab_1.tabpage_interrupcion.tv_1.f_icono_arbol(ll_tipo)
	ll_handle = tab_1.tabpage_interrupcion.tv_1.insertitemsort(0,ls_nombre,ll_icono)
	tab_1.tabpage_interrupcion.tv_1.getitem(ll_handle,le_elemento)
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
	le_elemento.StatePictureIndex = 1
	tab_1.tabpage_interrupcion.tv_1.setitem(ll_handle,le_elemento)			

FETCH desc_inst_afect into  :ls_nombre, :ll_co_nivel, :ll_tipo,:ll_nro_inst_padre;

LOOP

CLOSE desc_inst_afect;

//Cargo el segundo nivel 

if ll_fila > 0 then
	return
end if

IF li_inst_oop = 0 then
	//NO LO TRATA OPERACIONES
	fw_cargar_arbol(ll_co_nivel+1)  
	
	//fw_cargar_arbol(ll_co_nivel+2)  -> Comentado por LFE 
END IF

////// FDO


end subroutine

public function long fw_tiene_interrupcion (datawindow d_interrupcion, long codigo);long ll_fila
        
ll_fila = tab_1.tabpage_interrupcion.dw_1.find("cod_instalacion = " + string(codigo),1,d_interrupcion.rowcount())

return ll_fila

end function

public subroutine fw_cargar_arbol (integer co_nivel);// Recibe co_nivel con el nivel de la instalacion que ha de aparecer en
// el siguiente nivel de la rama que tenemos ya cargada


Treeviewitem le_elemento, le_busqueda
string ls_nombre, ls_nombre_anterior,ls_matricula,ls_matricula_ant
long ll_handle, ll_fila, ll_codigo, ll_nro_padre, ll_handle_buscado, ll_tipo, ll_icono, ll_tipo2
sw_rama sl_rama
 
 DECLARE cu_nivel CURSOR FOR  
  SELECT "SGD_INSTALACION"."NOM_INSTALACION",
                        "SGD_INSTALACION"."NRO_INSTALACION",
                        "SGD_INSTALACION"."NRO_INST_PADRE", 
					  "SGD_INSTALACION"."TIPO_INSTALACION",
					  "SGD_CT"."MATRICULA"
    FROM "SGD_INSTALACION",   
         "SGD_INTERRUPCION_DESCARGO",
		"SGD_CT"
   WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" ) and  
                        ( "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :il_nro_descargo) //and
//         ( "SGD_INSTALACION"."CO_NIVEL" = :co_nivel ) 
			AND "SGD_INSTALACION"."BDI_JOB" = 0 
			AND ("SGD_INTERRUPCION_DESCARGO"."IND_OOP" = 0 )
			AND "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_CT"."CODIGO"(+) ;
open cu_nivel ;


fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo, :ls_matricula;



do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
        
        
        //  Busca en el arbol alguna instalacion, que tenga el codigo de instalacion
        //  padre del que estoy intentando insertar.
	IF fw_busqueda_arbol(ll_codigo) = -1 THEN       
                        
        ll_handle_buscado = fw_busqueda_arbol(ll_nro_padre)

        // Si no existe el elemento buscado, solo puede ocurrir en tercer nivel
        // Busca el padre de la instalacion coge los datos
        // Interta la rama nueva y le dice el handle donde se ha insertado
        if ll_handle_buscado = -1  then
                
          SELECT "SGD_INSTALACION"."NOM_INSTALACION"  , TIPO_INSTALACION, CODIGO
            INTO :ls_nombre_anterior, :ll_tipo2, :ls_matricula_ant
         FROM "SGD_INSTALACION","SGD_CT"  
           WHERE	 "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_padre   
					AND "SGD_INSTALACION"."BDI_JOB" = 0
					AND "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_CT"."CODIGO"(+) ;
                // Pongo el signo + de indicacion de expandible
					 
			  if not isnull(ls_matricula_ant) then
				ls_nombre_anterior = ls_nombre_anterior + "; Mat.-" + ls_matricula_ant
			  end if
                tab_1.tabpage_interrupcion.tv_1.getitem(0,le_elemento)
                le_elemento.children = true
					 le_elemento.StatePictureIndex = 1
                tab_1.tabpage_interrupcion.tv_1.setitem(0,le_elemento)
                                
                ll_icono= tab_1.tabpage_interrupcion.tv_1.f_icono_arbol(ll_tipo2)
                ll_handle_buscado = tab_1.tabpage_interrupcion.tv_1.insertitemsort(1,ls_nombre_anterior,ll_icono)
                tab_1.tabpage_interrupcion.tv_1.getitem(ll_handle_buscado, le_elemento)
                // ll_fila = fw_tiene_interrupcion(d_interrupcion,ll_codigo)
                sl_rama.codigo = ll_nro_padre
                sl_rama.fila = 0
                le_elemento.data = sl_rama
					 le_elemento.StatePictureIndex = 1
                tab_1.tabpage_interrupcion.tv_1.setitem(ll_handle_buscado,le_elemento)
                
        end if
  	   if not isnull(ls_matricula) then
			ls_nombre = ls_nombre + "; Mat.-" + ls_matricula
	   end if
        ll_icono= tab_1.tabpage_interrupcion.tv_1.f_icono_arbol(ll_tipo)
        ll_handle = tab_1.tabpage_interrupcion.tv_1.insertitemsort(ll_handle_buscado,ls_nombre,ll_icono)
        tab_1.tabpage_interrupcion.tv_1.getitem(ll_handle, le_elemento)
        ll_fila = fw_tiene_interrupcion(tab_1.tabpage_interrupcion.dw_1,ll_codigo)
        sl_rama.codigo = ll_codigo
        sl_rama.fila = 0
        
        if ll_fila > 0 then
                le_elemento.bold = true
                sl_rama.fila = ll_fila
        end if

        le_elemento.data = sl_rama
		  le_elemento.StatePictureIndex = 1
        tab_1.tabpage_interrupcion.tv_1.setitem(ll_handle,le_elemento)
	END IF
        
	fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre , :ll_tipo, :ls_matricula;
        
loop

close cu_nivel ;

end subroutine

public function long fw_busqueda_arbol (long nro_padre);Treeviewitem le_busqueda
long ll_handle_busqueda, ll_resultado
sw_rama sl_busqueda

ll_handle_busqueda = 1

DO

        ll_resultado = tab_1.tabpage_interrupcion.tv_1.getitem(ll_handle_busqueda, le_busqueda) 
        
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

public subroutine fw_enviar_mail ();//15/07/99
//funcion que envia mail cuando la accion sobre el descargo es Aprobacion, Modficacion 
//o Rechazo

string ls_email

IF iu_comunic.is_comunic.Accion_llamada = "Aprobacion" OR &
   iu_comunic.is_comunic.Accion_llamada = "Modificacion" OR &
        iu_comunic.is_comunic.Accion_llamada = "Rechazo" OR &
		  iu_comunic.is_comunic.Accion_llamada = "Rechazado BDI" then
        
        
        //Selecciona el e-mail del cliente
        SELECT EMAIL 
        INTO   :ls_email
        FROM   GI_USUARIO_SGI U, SGD_DESCARGOS D
        WHERE  U.USUARIO = D.ID_SOLICITANTE AND
                 D.NRO_DESCARGO = :iu_comunic.is_comunic.longval2;
        IF SQLCA.SQLCODE <> 0 THEN
	      
			SELECT EMAIL 
   	     INTO   :ls_email
      	  FROM   GI_USUARIO_SGI U, SGD_DESCARGOS D
	        WHERE  U.USUARIO = D.USUARIO AND
             D.NRO_DESCARGO = :iu_comunic.is_comunic.longval2;
					
		  END  IF
        IF SQLCA.SQLCODE = 0 THEN
                //Verifica que no tenga null
                IF ls_email <> "" OR Not IsNull(ls_email) THEN
                        //Enviar mail
                        
                        //Funcion que arma el texto de acuerdo a la accion_llamada y lo envia
                        fw_armar_mail(ls_email)
					 ELSE
						 MessageBox("Envio Mail", 'No se pudo enviar el Mail')						
                END IF
		  ELSE
		   	MessageBox("Envio Mail", 'No se pudo enviar el Mail')					
        END IF

        
end if  
end subroutine

public subroutine fw_armar_mail (string ps_email);//variable local para la fecha de la solicitud - robert
datetime ldt_f_solicitado, ldt_ini_Descargo_sol, ldt_fin_descargo_sol, ldt_ini_descargo_ap
datetime ldt_fin_descargo_ap
int li_filenum
string ls_nom_instalacion, ls_observacion
//15/07/99
//Funcion que arma el texto del mail de acuerdo a la accion_llamada y lo envia
mailSession mSes 
mailReturnCode mRet  
mailMessage mMsg    

mSes = create mailSession
mRet = mSes.mailLogon(mailNewSession!)

IF mRet <> mailReturnSuccess! THEN  
        MessageBox("Mail", 'Error al conectarse.')  
        RETURN  
END IF    

//Carga el asunto del mail
mMsg.Subject = 'Gesti$$HEX1$$f300$$ENDHEX$$n Descargo N$$HEX3$$ba0020002000$$ENDHEX$$' + string(iu_comunic.is_comunic.longval2)

//Carga el email a enviar
mMsg.Recipient[1].name = ps_email

//Carga la fecha de la solicitud - robert
SELECT "SGD_DESCARGOS"."F_SOLICITADO"
INTO :ldt_f_solicitado
FROM "SGD_DESCARGOS"
WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :iu_comunic.is_comunic.longval2;

ls_nom_instalacion = tab_1.tabpage_accion.dw_instalacion.Object.nom_instalacion[1]
ldt_ini_descargo_sol = tab_1.tabpage_accion.dw_solicitud.Object.f_ini_solicitado[1]
ldt_fin_descargo_sol = tab_1.tabpage_accion.dw_solicitud.Object.f_fin_solicitado[1]
ldt_ini_descargo_ap = tab_1.tabpage_accion.dw_rechaza.Object.f_ini_aprobado[1]
ldt_fin_descargo_ap = tab_1.tabpage_accion.dw_rechaza.Object.f_fin_aprobado[1]
ls_observacion = tab_1.tabpage_accion.dw_rechaza.Object.obs_aprobado[1]

is_txt = 'descargo_' + string(iu_comunic.is_comunic.longval2) + '.txt'
is_htm = 'descargo_' + string(iu_comunic.is_comunic.longval2) + '.htm'
is_ruta_txt = 'c:\' + is_txt
is_ruta_htm = 'c:\' + is_htm

IF  iu_comunic.is_comunic.Accion_llamada = "Rechazado BDI" THEN
	fw_fichero_trabajos_htm(iu_comunic.is_comunic.longval2, ls_nom_instalacion,ls_observacion, &
					ldt_f_solicitado,ldt_ini_descargo_sol, ldt_fin_descargo_sol)

	fw_fichero_trabajos_txt(iu_comunic.is_comunic.longval2, ls_nom_instalacion,ls_observacion, &
					ldt_f_solicitado,ldt_ini_descargo_sol, ldt_fin_descargo_sol)
	
ELSE
	fw_fichero_htm(iu_comunic.is_comunic.longval2, ls_nom_instalacion, ldt_f_solicitado,&
				   ldt_ini_descargo_sol, ldt_fin_descargo_sol, ls_observacion, &
					ldt_ini_descargo_ap, ldt_fin_descargo_ap)

	fw_fichero_txt(iu_comunic.is_comunic.longval2, ls_nom_instalacion, ldt_f_solicitado,&
				   ldt_ini_descargo_sol, ldt_fin_descargo_sol, ls_observacion, &
					ldt_ini_descargo_ap, ldt_fin_descargo_ap)
END IF
mMsg.NoteText = ' '

//Fichero HTML
mMsg.AttachmentFile[1].filename	= is_htm
mMsg.AttachmentFile[1].PathName  = is_ruta_htm

//Fichero TXT
mMsg.AttachmentFile[2].filename	= is_txt
mMsg.AttachmentFile[2].PathName  = is_ruta_txt
               
mRet = mSes.mailSend(mMsg)    

IF mRet <> mailReturnSuccess! THEN  
   	MessageBox("Envio Mail", 'No se pudo enviar el Mail')  
		// GNU 29/01/2007. Incidencia 0/473623
		// Si no se pudo enviar el Mail booro los ficheros
		FileDelete (is_ruta_txt)
		FileDelete (is_ruta_htm)
		//FIN GNU
   	RETURN
ELSE 
		MessageBox("Envio Mail", "El Mail ha sido enviado")
END IF  

FileDelete (is_ruta_txt)
FileDelete (is_ruta_htm)

mSes.mailLogoff()
DESTROY mSes


end subroutine

public function boolean fw_comprobar_interrupciones_previstas (long pl_descargo);// Comprueba que el descargo tiene interrupciones previstas.
int li_contador =0
  SELECT count(*)  
    INTO :li_contador  
    FROM "SGD_INTERRUPCION_DESCARGO"  
   WHERE "NRO_DESCARGO" = :pl_descargo   ;
if li_contador > 0 then 
	return true
else 
	return false
end if
end function

public subroutine fw_deshabilita_tab_interrupciones ();// Comprueba si las interrupciones marcadas estan en la tabla sgd_interrupcion_descarg o
// en sgd_interrupcion
// Si estan en sgd_interrupcion_descargo se deshabilita el tab de interrupciones ya que 
// no son las interrupciones reales
// Si estan en sgd_interrupciones el tab estar$$HEX2$$e1002000$$ENDHEX$$habilitado
// GSE 28/03/2001

//long ll_nro_descargo, ll_nro_incidencia, ll_instalacion
//Integer li_total_inst
//
//ll_nro_descargo = tab_1.tabpage_solicitud.dw_descargo.getitemnumber(1,"nro_descargo")
//
//tab_1.tabpage_interrupcion.dw_1.settransobject(sqlca)
//tab_1.tabpage_interrupcion.dw_1.retrieve(ll_nro_descargo)
//
//   SELECT "SGD_DESCARGOS"."COD_INST_ORIGEN"
//   INTO :ll_instalacion
//   FROM "SGD_DESCARGOS"  
//   WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo ;
//	
//	IF ll_instalacion = 0 OR (SQLCA.SQLCODE <> 0) THEN
//		tab_1.tabpage_interrupcion.Enabled = false
//	END IF
//	
//	SELECT Count("SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION")
//	INTO :li_total_inst
//	FROM "SGD_INTERRUPCION_DESCARGO"
//	WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :ll_nro_descargo;

//	IF li_total_inst <= 0 OR (SQLCA.SQLCODE <> 0) THEN
//		tab_1.tabpage_interrupcion.Enabled = false
//	END IF
	
	

end subroutine

public function integer fw_rechazar_trabajo (integer pi_nro_trabajo);UPDATE SGD_TRABAJOS_BDI
SET ESTADO_TRABAJO=:fgci_trabajo_rechazado_bdi
WHERE CODIGO=:pi_nro_trabajo;
if sqlca.sqlcode = 0  THEN
	commit;
else
	rollback;
end if
return SQLCA.SQLCODE
end function

public function integer fw_validar_fechas ();datetime dt_fecha_aprob, dt_f_ini_aprob, dt_f_fin_aprob
int li_nro_descargo, li_Return
datetime ldt_f_ini_descargo, ldt_f_fin_descargo, ldt_f_peticion
string ls_obs
long ll_i, ll_row, ll_fechas
DateTime ldt_fecha_valida_ini, ldt_fecha_valida_fin
boolean lb_aviso = false

dt_fecha_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_aprobado")
dt_f_ini_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_ini_aprobado")
dt_f_fin_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_fin_aprobado")
li_nro_descargo = tab_1.tabpage_solicitud.dw_descargo.GetItemNumber(1,"nro_descargo")
ldt_f_ini_descargo = tab_1.tabpage_solicitud.dw_descargo.GetItemDateTime(1,"f_ini_solicitado")
ldt_f_fin_descargo = tab_1.tabpage_solicitud.dw_descargo.GetItemDateTime(1,"f_fin_solicitado")
ldt_f_peticion = tab_1.tabpage_solicitud.dw_descargo.GetItemDateTime(1,"f_solicitado")
ls_obs=tab_1.tabpage_accion.dw_rechaza.getitemstring(1,"obs_aprobado")

ll_fechas = 0	
IF iu_comunic.is_comunic.Accion_llamada = "Modificacion" then	
	// Valida las fechas de las interrupciones
	// GNU 25-10-2005. Incidencia 0/380345
//	ll_row = tab_1.tabpage_interrupcion.dw_1.RowCount()
	
	tab_1.tabpage_interrupcion.dw_1.setfilter("NRO_DESCARGO = " + string(li_nro_descargo))
	tab_1.tabpage_interrupcion.dw_1.filter()
	ll_row = tab_1.tabpage_interrupcion.dw_1.RowCount()
	// FIN GNU

	For ll_i = 1 To ll_row
		 ldt_fecha_valida_ini = tab_1.tabpage_interrupcion.dw_1.GetItemDateTime(ll_i,"f_inicio")
		 ldt_fecha_valida_fin = tab_1.tabpage_interrupcion.dw_1.GetItemDateTime(ll_i,"f_fin")
		 If IsNull(ldt_fecha_valida_ini) Or Not IsDate(String(Date(ldt_fecha_valida_ini))) Then
			  gnv_msg.f_mensaje("AD28","","",ok!)
			 Return -1
		 End If
		 If IsNull(ldt_fecha_valida_fin) Or Not IsDate(String(Date(ldt_fecha_valida_fin))) Then
			 gnv_msg.f_mensaje("AD27","","",ok!)
			 Return -1
		 End If
		 
		 IF (dt_f_ini_aprob > ldt_fecha_valida_ini) or (dt_f_fin_aprob < ldt_fecha_valida_fin) then
			//			 ll_fechas = ll_fechas + 1
			//			 li_return = -1
			// Se meten las fechas de inicio y fin del descargo como fechas de las interrupciones.
			 tab_1.tabpage_interrupcion.dw_1.object.f_inicio[ll_i] = dt_f_ini_aprob
 			 tab_1.tabpage_interrupcion.dw_1.object.f_fin[ll_i] =	dt_f_fin_aprob		
			 
			 lb_aviso = true
		 END IF
	Next
	
	
	
	if lb_aviso = true then 
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio y fin de la interrupcion han sido cambiadas por las fechas de inicio y fin del descargo.",information!,ok!)
	end if
	
END IF

IF ll_fechas > 0  THEN gnv_msg.f_mensaje("AM67","","",ok!)

if isnull(dt_fecha_aprob)  then
        choose case ii_estado
                case fgci_descargo_modificado
                       // gnv_msg.f_mensaje("AD11","","",ok!)
                       messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de modificaci$$HEX1$$f300$$ENDHEX$$n no debe ser nula.")
                        return -1
                case fgci_descargo_aprobado
                        //gnv_msg.f_mensaje("AD12","","",ok!)
                        messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de aprobaci$$HEX1$$f300$$ENDHEX$$n no debe ser nula.")
                        return -1
                case fgci_descargo_rechazado
                       // gnv_msg.f_mensaje("AD13","","",ok!)
                        messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de rechazo no debe ser nula.")
                        return -1
								
        end choose
else
        if ii_estado=fgci_descargo_modificado then
                if isnull(dt_f_ini_aprob) or dt_f_ini_aprob < fgnu_fecha_actual() then
                        gnv_msg.f_mensaje("AD14","","",ok!)
                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de descargo no debe ser nula ni inferior a la del dia")
                        return -1
                else
                        if isnull(dt_f_fin_aprob) or dt_f_fin_aprob < fgnu_fecha_actual() then
                                gnv_msg.f_mensaje("AD15","","",ok!)
                                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de fin de descargo no debe ser nula ni inferior a la del dia")
                                return -1
                        else
                                if dt_f_ini_aprob > dt_f_fin_aprob then
                                        gnv_msg.f_mensaje("AD16","","",ok!)
                                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de descargo no debe ser mayor que la fecha de fin")
                                        return -1
                                end if
                        end if 
                end if
        end if
END IF
return li_return
end function

public function string fw_calcular_estado (long pl_estado);// Recupera la descripcion del estado 
string ls_estado

ls_estado = ''

SELECT "SGD_VALOR"."DESCRIPCION"
INTO :ls_estado
FROM "SGD_VALOR"  
WHERE ( "SGD_VALOR"."CODIF" = 'ES_D' ) AND "SGD_VALOR"."CODIGO" =:pl_estado ;

return ls_estado
end function

public function integer fw_anade_registro ();int li_reg
datetime f_alta

li_reg = tab_1.tabpage_solicitud.dw_puesta_explotacion.insertrow(0)
f_alta = fgnu_fecha_actual()

tab_1.tabpage_solicitud.dw_puesta_explotacion.object.nro_descargo[li_reg] = il_nro_descargo
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.f_alta[li_reg] = f_alta
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.usuario[li_reg] = gs_usuario
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.programa[li_reg] = 'Ing_desc'
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.f_actual[li_reg] = f_alta
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.estado[li_reg] = 1
return 1

end function

public function integer fw_comprueba_padres_hijos (treeviewitem pe_elemento);treeviewitem le_elemento
int li_item

li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(ParentTreeItem! , pe_elemento.itemhandle)
DO WHILE li_item <> -1 
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		// hay papi
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(ParentTreeItem! ,le_elemento.itemhandle)
		// de momento no hay papi
	END IF
LOOP

li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(ChildTreeItem!, pe_elemento.itemhandle)

DO WHILE li_item <> -1 
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		// hay hijo
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(childTreeItem! ,le_elemento.itemhandle)
		// de momento no hay hijo
	END IF
LOOP

return 0
end function

public function integer fw_direccion (treeviewitem pe_elemento, treeviewitem pe_elemento_h);int li_item = 0
treeviewitem le_elemento

tab_1.tabpage_interrupcion.tv_1.getitem(pe_elemento_h.itemhandle,le_elemento)

do while li_item <> -1

	li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(previousTreeItem!,le_elemento.itemhandle)
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	
	if pe_elemento.label = le_elemento.label then
		return 0
		// hacia atras
	end if

loop

li_item = 0
tab_1.tabpage_interrupcion.tv_1.getitem(pe_elemento_h.itemhandle,le_elemento)

do while li_item <> -1

	li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(nextTreeItem!,le_elemento.itemhandle)
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	
	if pe_elemento.label = le_elemento.label then
		return 1
		// hacia delante
	end if

loop

// hacia ningun lado

return -1
end function

public function long fw_puede_seleccionar (treeviewitem pe_elemento, integer pi_nivel);treeviewItem le_elemento
int li_item
long ll_return = 0

// Compruebo si alguno de los padre del item seleccionado para marcar ya esta marcado
// en ese caso no deberia poder marcar

li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(ParentTreeItem! , pe_elemento.itemhandle)
DO WHILE li_item <> -1 
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(ParentTreeItem! ,le_elemento.itemhandle)
		ll_return = 0
	END IF
LOOP

// Compruebo si hay algun hijo por debajo de ese item que ya este seleccionado,
// en ese caso no dejo marcar

// Obtendo el primer hijo
li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(ChildTreeItem!  , pe_elemento.itemhandle)
DO WHILE li_item <> -1 and ll_return <> -1
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		ll_return = -1
	ELSE	
		ll_return = fw_buscar_hijos_marcados(le_elemento)	
		li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(NextTreeItem! ,le_elemento.itemhandle)
		tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	END IF
LOOP

return ll_return

end function

public function long fw_buscar_hijos_marcados (treeviewitem pe_elemento);int li_item
treeviewitem le_elemento

// Obtendo el primer hijo
li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(ChildTreeItem!  , pe_elemento.itemhandle)
DO WHILE li_item <> -1
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		return -1
	ELSE
		DO while li_item <> -1
			li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(NextTreeItem! ,le_elemento.itemhandle)
			tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento)
			IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
				return -1
			END IF
		LOOP
	END IF
LOOP
return 0
end function

public subroutine fw_habilitar_botones (treeviewitem pe_elemento);int li_indice
this.SetRedraw(false)
tab_1.tabpage_interrupcion.cb_marcar.enabled = false
//tab_1.tabpage_interrupcion.cb_desmarcar.enabled = false

FOR li_indice = 1 TO il_item_hasta
	tab_1.tabpage_interrupcion.tv_1.getitem(li_indice,pe_elemento)
	IF pe_elemento.StatePictureIndex = 2 THEN
		tab_1.tabpage_interrupcion.cb_marcar.enabled = true
		// inserto en la dw los datos necesarios para la interrupcion
		IF pe_elemento.bold = true THEN
//			tab_1.tabpage_interrupcion.cb_desmarcar.enabled = true
			li_indice = il_item_hasta
			// inserto en la dw los datos necesarios para la interrupcion
		END IF
	END IF
NEXT
this.SetRedraw(true)
end subroutine

public function long fw_comprobar_otros_desc (datetime pdt_fecha_ini, datetime pdt_fecha_fin, long pl_nro_instalacion);long ll_nro_descargo

SELECT NRO_DESCARGO
INTO :ll_nro_descargo
FROM SGD_DESCARGOS
WHERE COD_INST_ORIGEN = :pl_nro_instalacion
AND ( (F_INI_SOLICITADO<= :pdt_fecha_ini AND F_FIN_SOLICITADO> :pdt_fecha_ini) OR
		(F_INI_SOLICITADO<= :pdt_fecha_fin AND F_FIN_SOLICITADO> :pdt_fecha_fin) OR
		(F_INI_SOLICITADO>= :pdt_fecha_ini AND F_FIN_SOLICITADO<= :pdt_fecha_fin) ) AND 
	 ESTADO NOT IN (:fgci_descargo_anulado, :fgci_descargo_finalizado, :fgci_descargo_rechazado) AND
	 NRO_DESCARGO <> :il_nro_descargo AND
	 ROWNUM = 1;
	 

IF sqlca.sqlcode = 0 THEN 
	Return ll_nro_descargo
ELSE
	Return 0
END IF
end function

public function integer fnu_poner_blanco (integer li_item);treeviewitem le_elemento
int li_item_2

DO WHILE li_item <> -1
	tab_1.tabpage_interrupcion.tv_1.getitem (li_item, le_elemento)
	le_elemento.StatePictureIndex= 1
	tab_1.tabpage_interrupcion.tv_1.setitem(le_elemento.itemhandle, le_elemento)
	li_item_2= tab_1.tabpage_interrupcion.tv_1.FindItem (ChildTreeItem!, le_elemento.itemhandle)
	fnu_Poner_Blanco(li_item_2)
	li_item= tab_1.tabpage_interrupcion.tv_1.FindItem (NextTreeItem!, le_elemento.itemhandle)
LOOP

Return 1
end function

public subroutine fw_fichero_trabajos_htm (long pi_nro_descargo, string ps_nombre_inst, string ps_observacion, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo);integer li_FileNum, li_codigo
string ls_htm, ls_filas, ls_descripcion

DECLARE lcur_trabajos CURSOR FOR
	(SELECT CODIGO, DESCRIPCION
	 FROM SGD_TRABAJOS_BDI
	 WHERE NRO_DESCARGO = :pi_nro_descargo AND
	 ESTADO_TRABAJO = :fgci_trabajo_rechazado_bdi);
	 
	 
li_FileNum = FileOpen(is_ruta_htm,StreamMode!, Write!, LockWrite!, Replace!)	
ls_filas = ''
OPEN lcur_trabajos;
FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
DO
	ls_filas = ls_filas + '<TR><TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#ffffff" HEIGHT=15>' + &
    '<FONT FACE="Courier New" SIZE=2><P ALIGN="CENTER">' + string (li_codigo) + '</FONT></TD>' + &
    '<TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#ffffff" HEIGHT=15>' + &
    '<FONT FACE="Courier New" SIZE=2><P>' + ls_descripcion + '</FONT></TD>' + &
	 '</TR>'
	 FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
LOOP WHILE SQLCA.SQLCODE = 0 
CLOSE lcur_trabajos;

ls_htm = '<HTML>' + &
'<HEAD>' + &
'<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">' + &
'<TITLE>descargo_826</TITLE>' + &
'</HEAD>' + &
'<BODY LINK="#0000ff" VLINK="#800080" BGCOLOR="#ffffff">' + &
'<P>      &nbsp;<<B><FONT FACE="Arial" SIZE=4>EL DESCARGO N$$HEX2$$ba002000$$ENDHEX$$</FONT><FONT FACE="Arial" SIZE=4 COLOR="#800000">' + string(pi_nro_descargo) + ' </FONT><FONT FACE="Arial" SIZE=4>HA SIDO RECHAZADO BDI.</P><DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'</FONT><FONT FACE="Courier New"><P>&nbsp;</P></DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'<P>   Instalaci&oacute;n Afectada :</B>' + string(ps_nombre_inst) + ' </P>' + &
'<B><P>   Fecha Solicitud :</B>' + string (f_solicitado) + ' </P>' + &
'<B><P>   Fecha Inicio de Descargo :</B> ' + string (f_ini_descargo) + '</P>' + &
'<B><P>   Fecha Fin de Descargo :</B> ' + string (f_fin_descargo) + '</P>' + &
'<B><P>   Observaci&oacute;n :</B> ' + ps_observacion + '</P>' + &
'</FONT><B><I><FONT FACE="Arial"><P>&nbsp;</P>' + &
'</DIR>' + &
'</DIR>' + &
'</B></I></FONT>' + &
'<TABLE BORDER CELLSPACING=1 CELLPADDING=4 WIDTH=302 ALIGN="CENTER" >' +&
'<TR><TD VALIGN="TOP" COLSPAN=2 BGCOLOR="#000080">' +&
'<B><I><FONT FACE="Arial" COLOR="#ffffff"><P ALIGN="CENTER">TRABAJOS RECHAZADOS BDI</B></I></FONT></TD>' +&
'</TR>' +&
'<TR><TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#000080" HEIGHT=15>' +&
'<B><I><FONT FACE="Arial" COLOR="#ffffff"><P ALIGN="CENTER">CODIGO</B></I></FONT></TD>' +&
'<TD WIDTH="50%" VALIGN="TOP" BGCOLOR="#000080" HEIGHT=15>' +&
'<B><I><FONT FACE="Arial" COLOR="#ffffff"><P ALIGN="CENTER">DESCRIPCION</B></I></FONT></TD>' +&
'</TR>' + &
ls_filas + &
'</TABLE>' + &
'<B><I><FONT FACE="Arial"><P>&nbsp;</P><DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'</B></I></FONT><FONT FACE="Courier New" SIZE=2><P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<B><P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P>' + &
'<P>&nbsp;</P></DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'<P>Fecha :</B> ' + string (datetime(today(),now())) + '</P>' + &
'</FONT><FONT SIZE=2><P>&nbsp;</P></FONT></BODY>' + &
'</HTML>'

FileWrite(li_FileNum,ls_htm)
FileClose(li_FileNum)
end subroutine

public subroutine fw_fichero_trabajos_txt (long pi_nro_descargo, string ps_nombre_inst, string ps_observacion, datetime f_solicitado, datetime f_ini_descargo, datetime f_fin_descargo);integer li_FileNum, li_codigo
string ls_descripcion


DECLARE lcur_trabajos CURSOR FOR
	(SELECT CODIGO, DESCRIPCION
	 FROM SGD_TRABAJOS_BDI
	 WHERE NRO_DESCARGO = :pi_nro_descargo AND
	 ESTADO_TRABAJO = :fgci_trabajo_rechazado_bdi);

li_FileNum = FileOpen(is_ruta_txt,lineMode!, Write!, LockWrite!,Append!)

FileWrite(li_fileNum,'           '+ 'EL DESCARGO N$$HEX2$$ba002000$$ENDHEX$$' + string(pi_nro_descargo) + ' HA SIDO RECHAZADO BDI.')
FileWrite(li_fileNum,'Instalacion Afectada     : ' + ps_nombre_inst)
FileWrite(li_fileNum,'Fecha Solicitud          : ' + string(f_solicitado))
FileWrite(li_fileNum,'Fecha Inicio de Descargo : ' + string(f_ini_descargo))
FileWrite(li_fileNum,'Fecha Fin de Descargo    : ' + string(f_fin_descargo))
FileWrite(li_fileNum,'Observacion              : ' + ps_observacion)
FileWrite(li_fileNum,'           ' +'TRABAJOS RECHAZADOS BDI')
FileWrite(li_fileNum,'           ' +'-----------------------')
FileWrite(li_fileNum,'           ' +'  CODIGO  DESCRIPCION ')

OPEN lcur_trabajos;
FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
DO
	FileWrite(li_fileNum,'              ' + string(li_codigo) + '   ' + ls_Descripcion)
	FETCH lcur_trabajos INTO :li_codigo, :ls_descripcion;
LOOP WHILE SQLCA.SQLCODE = 0 
CLOSE lcur_trabajos;

FileWrite(li_fileNum,'fecha : ' + string (datetime(today(),now()))		)	
FileClose(li_FileNum)
end subroutine

public subroutine fw_fichero_txt (long pi_nro_descargo, string ps_nom_instalacion, datetime pdt_solicitado, datetime pdt_ini_descargo_sol, datetime pdt_fin_descargo_sol, string ps_observaciones, datetime pdt_ini_descargo_ap, datetime pdt_fin_descargo_ap);integer li_FileNum
string ls_hecho

li_FileNum = FileOpen(is_ruta_txt,lineMode!, Write!, LockWrite!,Append!)
CHOOSE CASE iu_comunic.is_comunic.Accion_llamada
	CASE "Aprobacion" 
		ls_hecho = "APROBADO"
	CASE "Modificacion" 
		ls_hecho = "MODIFICADO"
	CASE "Rechazo" 
		ls_hecho = "RECHAZADO"
END CHOOSE

FileWrite(li_fileNum,'           '+ 'EL DESCARGO N$$HEX2$$ba002000$$ENDHEX$$' + string(pi_nro_descargo) + ' HA SIDO ' + ls_hecho +'.')
FileWrite(li_fileNum,'Instalacion Afectada     : ' + ps_nom_instalacion)
FileWrite(li_fileNum,'Fecha Solicitud          : ' + string(pdt_solicitado))

CHOOSE CASE iu_comunic.is_comunic.Accion_llamada

        CASE "Aprobacion"
					FileWrite(li_fileNum,'Fecha Inicio de Descargo : ' + string(pdt_ini_descargo_sol))
					FileWrite(li_fileNum,'Fecha Fin de Descargo    : ' + string(pdt_fin_descargo_sol))
			CASE "Modificacion"
					FileWrite(li_fileNum,'Fecha Inicio de Descargo : ' + string(pdt_ini_descargo_ap))
					FileWrite(li_fileNum,'Fecha Fin de Descargo    : ' + string(pdt_fin_descargo_ap))
			CASE "Rechazo"
					FileWrite(li_fileNum,'Fecha Inicio de Descargo : ' + string(pdt_ini_descargo_sol))
					FileWrite(li_fileNum,'Fecha Fin de Descargo    : ' + string(pdt_fin_descargo_sol))
END CHOOSE

FileWrite(li_fileNum,'Observacion              : ' + ps_observaciones)
FileWrite(li_fileNum,'fecha : ' + string (datetime(today(),now()))		)	
FileClose(li_FileNum)
end subroutine

public subroutine fw_fichero_htm (long pi_nro_descargo, string ps_nom_instalacion, datetime pdt_solicitado, datetime pdt_ini_descargo_sol, datetime pdt_fin_descargo_sol, string ps_observaciones, datetime pdt_ini_descargo_ap, datetime pdt_fin_descargo_ap);integer li_FileNum
string ls_htm, ls_ini, ls_fin, ls_hecho

li_FileNum = FileOpen(is_ruta_htm,StreamMode!, Write!, LockWrite!, Replace!)	

CHOOSE CASE iu_comunic.is_comunic.Accion_llamada

        CASE "Aprobacion"
					ls_ini = string(pdt_ini_descargo_sol)
					ls_fin = string(pdt_fin_descargo_sol)
					ls_hecho = "APROBADO"
			CASE "Modificacion"
					ls_ini = string(pdt_ini_descargo_ap)
					ls_fin = string(pdt_fin_descargo_ap)
					ls_hecho = "MODIFICADO"
			CASE "Rechazo"
					ls_ini = string(pdt_ini_descargo_sol)
					ls_fin = string(pdt_fin_descargo_sol)
					ls_hecho = "RECHAZADO"
END CHOOSE

ls_htm = '<HTML>' + &
'<HEAD>' + &
'<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">' + &
'<META NAME="Generator" CONTENT="Microsoft Word 97">' + &
'<TITLE>descargo_826</TITLE>' + &
'<META NAME="Template" CONTENT="F:\win32app\MSOffice\Office\html.dot">' + &
'</HEAD>' + &
'<BODY LINK="#0000ff" VLINK="#800080" BGCOLOR="#ffffff">' + &
'<P>      &nbsp;<B><FONT FACE="Arial" SIZE=4>EL DESCARGO N$$HEX2$$ba002000$$ENDHEX$$</FONT><FONT FACE="Arial" SIZE=4 COLOR="#800000">' + string(pi_nro_descargo) + ' </FONT><FONT FACE="Arial" SIZE=4>HA SIDO ' + ls_hecho + '</P><DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'<DIR>' + &
'</FONT><FONT FACE="Courier New"><P>&nbsp;</P></DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'</DIR>' + &
'<P>Instalaci&oacute;n Afectada :</B> '+ ps_nom_instalacion + '</P>' + &
'<B><P>Fecha Solicitud :</B> ' + string(pdt_solicitado) + '</P>' + &
'<B><P>Fecha Inicio de Descargo :</B>' + ls_ini +'</P>' + &
'<B><P>Fecha Fin de Descargo :</B>' + ls_fin + '</P>' + &
'<B><P>Observaci&oacute;n :</B>' + ps_observaciones + '</P>' + &
'</FONT><B><FONT FACE="Courier New" SIZE=2><P>&nbsp;</P></DIR>' + &
'</DIR>' + &
'<P>Fecha :</B>' + + string (datetime(today(),now())) + '</P></FONT></BODY>' + &
'</HTML>' 

FileWrite(li_FileNum,ls_htm)
FileClose(li_FileNum)

end subroutine

on w_7106_mante_descargos.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_guardar=create cb_guardar
this.cb_1=create cb_1
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_guardar
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.tab_1
end on

on w_7106_mante_descargos.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_guardar)
destroy(this.cb_1)
destroy(this.tab_1)
end on

event open;call super::open;iu_comunic = create u_generico_comunicaciones
iu_comunic.is_comunic = gu_comunic.is_comunic
string ls_nombre
long ll_co_nivel,ll_fila, ll_handle, ll_total

treeviewitem le_elemento
sw_rama sl_rama
u_desc_2030_rn_filtro_descargo	lu_desc_const

lu_desc_const = Create u_desc_2030_rn_filtro_descargo;

//    RECUPERAR LAS VARIABLES QUE ME PASA LA VENTANA LLAMANTE

il_nom_inst_afectada = iu_comunic.is_comunic.longval1
is_nom_solicitante = iu_comunic.is_comunic.strval1
idt_fecha_ini = iu_comunic.is_comunic.datval1
idt_fecha_fin = iu_comunic.is_comunic.datval2
il_nro_descargo = iu_comunic.is_comunic.longval2

/////////////////// TAB DE TRABAJOS RECHAZADOS BDI ////////////////////////////////////////

tab_1.tabpage_trabajos.dw_trabajos_bdi.SetTransObject(SQLCA)
tab_1.tabpage_trabajos.dw_trabajos_bdi.Retrieve(il_nro_descargo)

ll_total = tab_1.tabpage_trabajos.dw_trabajos_bdi.RowCount()
IF ll_total = 0 OR iu_comunic.is_comunic.Accion_llamada <> "Rechazado BDI" then
	tab_1.tabpage_trabajos.Visible = false
else
	tab_1.tabpage_trabajos.Visible = true
end if
//    ACCION LLAMADA RECHAZADO BDI    

IF iu_comunic.is_comunic.Accion_llamada = "Rechazado BDI" then
        ii_estado=fgci_descargo_rechazado_bdi
        this.title="Rechazado BDI"
  		  this.icon="descargo.ico"
		  tab_1.tabpage_accion.Text = "Rechazar"
		  tab_1.tabpage_accion.Visible = false
END IF

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

If fg_verifica_parametro("solicitud_descargos_extra") Then
	w_7106_mante_descargos.tab_1.tabpage_otros.Visible = True
	IF iu_comunic.is_comunic.Accion_llamada = "Aprobacion"  or iu_comunic.is_comunic.Accion_llamada = "Suspension" then
		tab_1.tabpage_accion.dw_solicitud.y = 240
		tab_1.tabpage_accion.dw_instalacion.y = 12
		tab_1.tabpage_accion.dw_informacion_extra.Visible = True
		tab_1.tabpage_accion.dw_informacion_extra.settransobject(sqlca)
		tab_1.tabpage_accion.dw_informacion_extra.retrieve(il_nro_descargo)

		
		If iu_comunic.is_comunic.Accion_llamada = "Suspension" then
			tab_1.tabpage_accion.dw_informacion_extra.Modify("agente.enabled=0")
			tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_agente.enabled=0")
			tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_aprueba.enabled=0")
			tab_1.tabpage_accion.dw_informacion_extra.Modify("subest_movil.enabled=0")
				
			tab_1.tabpage_accion.dw_informacion_extra.Modify("agente.background.color="+gs_gris)
			tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_agente.background.color="+gs_gris)
			tab_1.tabpage_accion.dw_informacion_extra.Modify("tel_aprueba.background.color="+gs_gris)
			tab_1.tabpage_accion.dw_informacion_extra.Modify("subest_movil.background.color="+gs_gris)
		End If
		
	End If
End If

//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

/////////////////// TAB DE ACCION /////////////////////////////////////////////////////////

//    ACCION LLAMADA APROBACION 

IF iu_comunic.is_comunic.Accion_llamada = "Aprobacion" then
        tab_1.tabpage_accion.dw_rechaza.dataobject='d_7002_mante_aprobar'
        ii_estado=fgci_descargo_aprobado
        this.title="Aprobaci$$HEX1$$f300$$ENDHEX$$n de Descargos"
		  this.icon="descargo.ico"
		  tab_1.tabpage_accion.Text = "Aprobar"
		  tab_1.tabpage_solicitud.cb_mas.visible=false
		  tab_1.tabpage_solicitud.cb_menos.visible=false
		  // GNU 10-2-2006. Incidencia 0/396474
		If fg_verifica_parametro("Causa en descargos.") Then
			tab_1.tabpage_interrupcion.gb_5.Y = tab_1.tabpage_interrupcion.gb_5.Y + 180
			tab_1.tabpage_interrupcion.dw_1.Y = tab_1.tabpage_interrupcion.dw_1.Y + 180
			tab_1.tabpage_interrupcion.st_4.Y = tab_1.tabpage_interrupcion.st_4.Y + 180

			tab_1.tabpage_interrupcion.gb_causa.Visible = True
			tab_1.tabpage_interrupcion.st_causa.Visible = True
			tab_1.tabpage_interrupcion.gb_causa.Enabled = False
			tab_1.tabpage_interrupcion.st_causa.show()
		End If
		// FIN GNU
END IF

//    ACCION LLAMADA MODIFICACION    

IF iu_comunic.is_comunic.Accion_llamada = "Modificacion" then
        tab_1.tabpage_accion.dw_rechaza.dataobject='d_7002_mante_modificar'
        ii_estado=fgci_descargo_modificado
        this.title="Modificaci$$HEX1$$f300$$ENDHEX$$n de Descargos"
  		  this.icon="descargo.ico"
		  tab_1.tabpage_accion.Text = "Modificar"
		  tab_1.tabpage_interrupcion.dw_1.DataObject = 'd_7004_fechas_interr_descargo'
		  tab_1.tabpage_interrupcion.st_4.visible = false
		  tab_1.tabpage_instalaciones.mle_observaciones.displayonly=false

// GNU 10-2-2006. Incidencia 0/396474
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Colombia. 12/07/2005.
//		If gi_pais = 7 Then
		If fg_verifica_parametro("Causa en descargos.") Then
// FIN GNU
			tab_1.tabpage_interrupcion.gb_5.Y = tab_1.tabpage_interrupcion.gb_5.Y + 180
			tab_1.tabpage_interrupcion.dw_1.Y = tab_1.tabpage_interrupcion.dw_1.Y + 180
			tab_1.tabpage_interrupcion.st_4.Y = tab_1.tabpage_interrupcion.st_4.Y + 180

			tab_1.tabpage_interrupcion.gb_causa.Visible = True
			tab_1.tabpage_interrupcion.st_causa.Visible = True
		End If
// Fin. Sgo.
END IF

//    ACCION LLAMADA RECHAZO     

IF iu_comunic.is_comunic.Accion_llamada = "Rechazo" or iu_comunic.is_comunic.Accion_llamada = "Suspension" THEN
        tab_1.tabpage_accion.dw_rechaza.dataobject='d_7002_mante_rechazar'
        ii_estado=fgci_descargo_rechazado
        IF iu_comunic.is_comunic.Accion_llamada = "Rechazo" then 
			  this.title="Rechazo de Descargos"
			  tab_1.tabpage_accion.Text = "Rechazar"
		else
			  this.title="Suspensi$$HEX1$$f300$$ENDHEX$$n de Descargos"
			  iu_comunic.is_comunic.Accion_llamada = "Rechazo"
			  tab_1.tabpage_accion.Text = "Suspender"
		end if
		  this.icon="descargo.ico"
//        pb_1.visible = false
//        tab_1.tabpage_accion.gb_1.visible = false
//        p_1.visible = false
//        tab_1.tabpage_accion.d_interrupcion.visible = false
		  tab_1.tabpage_solicitud.cb_mas.visible=false
		  tab_1.tabpage_solicitud.cb_menos.visible=false
		  // GNU 10-2-2006. Incidencia 0/396474
		If fg_verifica_parametro("Causa en descargos.") Then
			tab_1.tabpage_interrupcion.gb_5.Y = tab_1.tabpage_interrupcion.gb_5.Y + 180
			tab_1.tabpage_interrupcion.dw_1.Y = tab_1.tabpage_interrupcion.dw_1.Y + 180
			tab_1.tabpage_interrupcion.st_4.Y = tab_1.tabpage_interrupcion.st_4.Y + 180

			tab_1.tabpage_interrupcion.gb_causa.Visible = True
			tab_1.tabpage_interrupcion.st_causa.Visible = True
			tab_1.tabpage_interrupcion.gb_causa.Enabled = False
			tab_1.tabpage_interrupcion.st_causa.Visible = True
			tab_1.tabpage_interrupcion.st_causa.show()
		End If
		// FIN GNU
END IF

//    INICIALIZACION DE OBJETOS

tab_1.tabpage_accion.dw_solicitud.settransobject(sqlca)
tab_1.tabpage_accion.dw_rechaza.settransobject(sqlca)
tab_1.tabpage_accion.dw_instalacion.settransobject(sqlca)
tab_1.tabpage_historial.uo_historial.dw_historial.settransobject(sqlca)

tab_1.tabpage_accion.dw_solicitud.insertrow(0)
tab_1.tabpage_accion.dw_rechaza.retrieve(il_nro_descargo)
tab_1.tabpage_historial.uo_historial.dw_historial.retrieve(il_nro_descargo)

//    PRESENTACION DE DATOS EN LA PANTALLA
IF iu_comunic.is_comunic.Accion_llamada = "Modificacion" or &
   iu_comunic.is_comunic.Accion_llamada = "Aprobacion" then
	
	IF tab_1.tabpage_accion.dw_rechaza.GetItemNumber(1, 'ind_interrupcion') = 1 AND &
		fw_comprobar_interrupciones_previstas(il_nro_descargo) = FALSE THEN
		
		tab_1.tabpage_accion.dw_rechaza.SetItem(1, 'ind_interrupcion', 2)
	END IF
END IF

tab_1.tabpage_accion.dw_instalacion.retrieve(il_nom_inst_afectada)
tab_1.tabpage_accion.dw_solicitud.setitem(1,"id_solicitante",is_nom_solicitante)
tab_1.tabpage_accion.dw_solicitud.setitem(1,"f_ini_solicitado",idt_fecha_ini)
tab_1.tabpage_accion.dw_solicitud.setitem(1,"f_fin_solicitado",idt_fecha_fin)
tab_1.tabpage_accion.dw_rechaza.setitem(1,"id_aprobacion",gs_usuario)
tab_1.tabpage_accion.dw_rechaza.setitem(1,"f_aprobado",fgnu_fecha_actual())
tab_1.tabpage_accion.dw_rechaza.setitem(1,"estado",ii_estado)
tab_1.tabpage_accion.dw_rechaza.setitem(1,"obs_aprobado","")

//    SI ENTRA POR MODIFICAR, CARGO LAS FECHAS QUE SOLICITO POR DEFECTO
if tab_1.tabpage_accion.dw_rechaza.object.ind_interrupcion[1] = lu_desc_const.sin_interrupcion then
	ib_sin_interrup = TRUE				
   //tab_1.tabpage_interrupcion.tv_1.visible = false
   tab_1.tabpage_interrupcion.st_interrupcion.visible=false
//   tab_1.tabpage_accion.d_interrupcion.visible = false
//	tab_1.tabpage_accion.gb_1.visible = FALSE
else
	ib_sin_interrup = FALSE
	// Es con interrupcion pero no estan marcadas todavia
	if fw_comprobar_interrupciones_previstas(il_nro_descargo)= false  then 
		ib_sin_interrup = TRUE				
		//tab_1.tabpage_interrupcion.tv_1.visible = false
		tab_1.tabpage_interrupcion.st_interrupcion.visible=false
//		tab_1.tabpage_accion.d_interrupcion.visible = false
	//	tab_1.tabpage_accion.gb_1.visible = FALSE		
	end if
end if

Destroy (lu_desc_const)

IF iu_comunic.is_comunic.Accion_llamada = "Modificacion" or &
        iu_comunic.is_comunic.Accion_llamada = "Aprobacion" then
        tab_1.tabpage_accion.dw_rechaza.setitem(1,"f_ini_aprobado",idt_fecha_ini)
        tab_1.tabpage_accion.dw_rechaza.setitem(1,"f_fin_aprobado",idt_fecha_fin)       
   	 
END IF

//IF not ib_sin_interrup and (iu_comunic.is_comunic.Accion_llamada = "Modificacion" or iu_comunic.is_comunic.Accion_llamada = "Aprobacion") then
//        tab_1.tabpage_accion.d_interrupcion.settransobject(sqlca)
//        tab_1.tabpage_accion.d_interrupcion.retrieve(il_nro_descargo)
//        tab_1.tabpage_accion.d_interrupcion.visible=false
//        fw_inst_descargo()
//end if

if iu_comunic.is_comunic.Accion_llamada = "Aprobacion" then
//        tab_1.tabpage_accion.d_interrupcion.Modify("f_inicio.BackGround.Color="+gs_gris)  
//        tab_1.tabpage_accion.d_interrupcion.Modify("f_fin.BackGround.Color="+gs_gris)  
//        tab_1.tabpage_accion.d_interrupcion.enabled = false               
end if

tab_1.tabpage_accion.dw_rechaza.setfocus()

////////////// TAB DE DESCARGOS Y DE INTERRUPCIONES ////////////////////////////////////////
x=this.workspaceX()
// CREACION DE OBJETOS DE TRABAJO
SetPointer(HourGlass!)
lu_comunic = create u_generico_comunicaciones 
lu_comunic.is_comunic=gu_comunic.is_comunic

//////////////////////////////////////////////////////////
// TIPO DE INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
//////////////////////////////////////////////////////////

ib_new_tip_inc = fg_verifica_parametro('nuevos_tip_inc')

if ib_new_tip_inc then
	 tab_1.tabpage_solicitud.dw_descargo.modify("sgd_descargos_ind_obligada.visible=1")
else
	 tab_1.tabpage_solicitud.dw_descargo.modify("sgd_descargos_ind_obligada.visible=0")
	 tab_1.tabpage_solicitud.dw_descargo.modify("obs_solicitud.height = 368")
    tab_1.tabpage_solicitud.cb_2.y = 970
end if
//////////////////////////////////////////////////////////

// EVALUA PRESENTACION
w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.InsertRow(0)
THIS.TriggerEvent("ue_presentacion")




end event

event closequery;
if ib_guardo=false then
	//if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea guardar los cambios?",information!,okcancel!)=1 then
	if gnv_msg.f_mensaje("CG12","","",YesNo!) = 1 then   
		if fw_guardar_cambios() < 0 then		
			gnu_u_transaction.uf_rollback();
         return
		else
      
			IF iu_comunic.is_comunic.Accion_llamada = "Rechazo" THEN
				fgnu_resetear_s_comunicaciones(gu_comunic)
				iu_comunic.is_comunic.programa_retorno = "w_mant"
				iu_comunic.is_comunic.accion_retorno = "rechazado"
			END IF
									
			gu_comunic.is_comunic = iu_comunic.is_comunic
			gnu_u_transaction.uf_commit();
		end if
	end if
else
	gnu_u_transaction.uf_rollback();
end if

tab_1.tabpage_solicitud.dw_descargo.ShareDataOff()
end event

event activate;yield()
int li_estado
 
IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN
	il_sesion_operacion = gu_rf_servidor_operacion.of_devuelve_sesion()
END IF

if gu_comunic2.is_comunic.programa_retorno = "w_descargos" and &
   gu_comunic2.is_comunic.intval1 = 1 then

	SELECT "SGD_DESCARGOS"."ESTADO"
	INTO :li_estado  
	FROM "SGD_DESCARGOS"  
	WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo   ;
	if sqlca.sqlcode=100 or sqlca.sqlcode=-1 then
		return
	else
	
		this.setredraw(false)
		if li_estado <> fgci_descargo_solicitado then
						
			//*******************    SI HA SIDO APROBADO     *********************//
			
			IF li_estado = fgci_descargo_aprobado then
				tab_1.tabpage_accion.dw_rechaza.dataobject='d_7002_mante_aprobar'
				ii_estado=fgci_descargo_aprobado
				this.title="Aprobaci$$HEX1$$f300$$ENDHEX$$n de descargos"
				this.icon="aprob_desc.ico"
			END IF
			
			//*****************    SI HA SIDO RECHAZADO    ********************//
			
			IF li_estado = fgci_descargo_RECHAZADO THEN
				tab_1.tabpage_accion.dw_rechaza.dataobject='d_7002_mante_rechazar'
				ii_estado=fgci_descargo_rechazado
				this.title="Rechazo de descargos"
				this.icon="desc_rech.ico"
			END IF
		
			cb_3.text="&Salir"
			tab_1.tabpage_accion.dw_rechaza.settransobject(sqlca)
			tab_1.tabpage_accion.dw_rechaza.reset()
			tab_1.tabpage_accion.dw_rechaza.retrieve(il_nro_descargo)
			tab_1.tabpage_accion.dw_rechaza.SetTabOrder("f_aprobado",0)
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//			tab_1.tabpage_accion.dw_rechaza.modify("f_aprobado.background.color=" + string(65536*192+256*192+192))
//			tab_1.tabpage_accion.dw_rechaza.SetTabOrder("f_ini_aprobado",0)
//			tab_1.tabpage_accion.dw_rechaza.modify("f_ini_aprobado.background.color=" + string(65536*192+256*192+192))
//			tab_1.tabpage_accion.dw_rechaza.SetTabOrder("f_fin_aprobado",0)
//			tab_1.tabpage_accion.dw_rechaza.modify("f_fin_aprobado.background.color=" + string(65536*192+256*192+192))
//			tab_1.tabpage_accion.dw_rechaza.SetTabOrder("obs_aprobado",0)
//			tab_1.tabpage_accion.dw_rechaza.modify("obs_aprobado.background.color=" + string(65536*192+256*192+192))

			tab_1.tabpage_accion.dw_rechaza.modify("f_aprobado.background.color=" + gs_gris)
			tab_1.tabpage_accion.dw_rechaza.SetTabOrder("f_ini_aprobado",0)
			tab_1.tabpage_accion.dw_rechaza.modify("f_ini_aprobado.background.color=" + gs_gris)
			tab_1.tabpage_accion.dw_rechaza.SetTabOrder("f_fin_aprobado",0)
			tab_1.tabpage_accion.dw_rechaza.modify("f_fin_aprobado.background.color=" + gs_gris)
			tab_1.tabpage_accion.dw_rechaza.SetTabOrder("obs_aprobado",0)
			tab_1.tabpage_accion.dw_rechaza.modify("obs_aprobado.background.color=" + gs_gris)
// Fin. Sgo.
			//                      d_interrupcion.visible=false
			cb_guardar.enabled=false
			ib_guardo=true
		end if
	end if
	fgnu_resetear_s_comunicaciones(gu_comunic2)
end if
this.setredraw(true)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7106_mante_descargos
end type

type cb_3 from commandbutton within w_7106_mante_descargos
integer x = 2400
integer y = 1760
integer width = 425
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;ib_guardo=true
close(parent)

end event

type cb_guardar from commandbutton within w_7106_mante_descargos
integer x = 1929
integer y = 1760
integer width = 425
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;long ll_nro_trabajo
int li_tipo,li_filas
int li_estado
integer li_valor = 0

// SI  ES DE OPERACIONES ES NECESARIO COMPROBAR SI SE HA CAIDO EL SERVIDOR O
// HA HABIDO UN CORTE EN LA COMUNICACION, QUE PUEDA HACER QUE NO ESTE BLOQUEADA

// SI ES DE OPERACION entonces
IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN
	if gu_rf_servidor_operacion.of_actualiza_icono() = 0  then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que no se puede conectar con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gnu_u_transaction.uf_rollback()
		ib_guardo=true
		Close(Parent)
		RETURN
		
	elseif gu_rf_servidor_operacion.of_devuelve_sesion() <> il_sesion_operacion then 
		// SE HA PRODUCIDO UN CORTE
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que se ha producido un corte en la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gnu_u_transaction.uf_rollback()
		ib_guardo=true
		close(Parent)
		RETURN
	end if
end if

tab_1.tabpage_solicitud.dw_descargo.accepttext()
 
IF tab_1.tabpage_solicitud.dw_descargo.object.nom_desc[1] = "" or isnull(tab_1.tabpage_solicitud.dw_descargo.object.nom_desc[1]) then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Es necesario un identificador para el descargo.")
	gnu_u_transaction.uf_rollback()
	return
END IF

IF iu_comunic.is_comunic.Accion_llamada = 'Rechazado BDI' THEN
	li_filas = tab_1.tabpage_trabajos.dw_trabajos_bdi.GetSelectedRow(0)
	IF li_filas = 0 THEN
		Messagebox("Aviso","Debe seleccionar al menos un trabajo")
		Return 1
	ELSE
		IF gnv_msg.f_mensaje("CG12","","",okCancel!) = 1 THEN
			w_7106_mante_descargos.triggerevent("ue_rechazar")
		   fw_enviar_mail()   
		END IF
		ib_guardo =true
	END IF
	Close(parent)
ELSE

	if fw_guardar_cambios()=1 then
		gnu_u_transaction.uf_commit(this);
				
		SELECT valor 
		INTO :li_valor
		FROM sgd_parametros
		WHERE cod_parametro = 9; //Enviar email =1  NO enviar = 0
		
		IF li_valor = 1  THEN
			 fw_enviar_mail()
		END IF  
		
		fgnu_resetear_s_comunicaciones(gu_comunic)
		iu_comunic.is_comunic.programa_retorno = "w_mant"
		iu_comunic.is_comunic.accion_retorno = iu_comunic.is_comunic.Accion_llamada
		gu_comunic.is_comunic = iu_comunic.is_comunic
		ib_guardo= true
		close(parent)
	else
		gnu_u_transaction.uf_rollback();
	end if
END IF
end event

type cb_1 from commandbutton within w_7106_mante_descargos
integer x = 1454
integer y = 1760
integer width = 425
integer height = 92
integer taborder = 10
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

type tab_1 from tab within w_7106_mante_descargos
integer x = 50
integer y = 28
integer width = 3072
integer height = 1668
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
tabpage_solicitud tabpage_solicitud
tabpage_otros tabpage_otros
tabpage_interrupcion tabpage_interrupcion
tabpage_historial tabpage_historial
tabpage_instalaciones tabpage_instalaciones
tabpage_accion tabpage_accion
tabpage_trabajos tabpage_trabajos
tabpage_int_simulacion tabpage_int_simulacion
end type

on tab_1.create
this.tabpage_solicitud=create tabpage_solicitud
this.tabpage_otros=create tabpage_otros
this.tabpage_interrupcion=create tabpage_interrupcion
this.tabpage_historial=create tabpage_historial
this.tabpage_instalaciones=create tabpage_instalaciones
this.tabpage_accion=create tabpage_accion
this.tabpage_trabajos=create tabpage_trabajos
this.tabpage_int_simulacion=create tabpage_int_simulacion
this.Control[]={this.tabpage_solicitud,&
this.tabpage_otros,&
this.tabpage_interrupcion,&
this.tabpage_historial,&
this.tabpage_instalaciones,&
this.tabpage_accion,&
this.tabpage_trabajos,&
this.tabpage_int_simulacion}
end on

on tab_1.destroy
destroy(this.tabpage_solicitud)
destroy(this.tabpage_otros)
destroy(this.tabpage_interrupcion)
destroy(this.tabpage_historial)
destroy(this.tabpage_instalaciones)
destroy(this.tabpage_accion)
destroy(this.tabpage_trabajos)
destroy(this.tabpage_int_simulacion)
end on

event selectionchanging;
IF oldindex > 0 THEN
	if This.control[oldindex] = tabpage_accion THEN
		tab_1.tabpage_accion.dw_rechaza.AcceptText()
		if fw_validar_fechas() = -1 then return 1
	end if
END IF
		
end event

type tabpage_solicitud from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
long backcolor = 79741120
string text = "Descargo"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "descargo.bmp"
long picturemaskcolor = 553648127
cb_menos cb_menos
cb_mas cb_mas
st_56 st_56
dw_puesta_explotacion dw_puesta_explotacion
dw_descargo dw_descargo
gb_7 gb_7
cb_2 cb_2
end type

on tabpage_solicitud.create
this.cb_menos=create cb_menos
this.cb_mas=create cb_mas
this.st_56=create st_56
this.dw_puesta_explotacion=create dw_puesta_explotacion
this.dw_descargo=create dw_descargo
this.gb_7=create gb_7
this.cb_2=create cb_2
this.Control[]={this.cb_menos,&
this.cb_mas,&
this.st_56,&
this.dw_puesta_explotacion,&
this.dw_descargo,&
this.gb_7,&
this.cb_2}
end on

on tabpage_solicitud.destroy
destroy(this.cb_menos)
destroy(this.cb_mas)
destroy(this.st_56)
destroy(this.dw_puesta_explotacion)
destroy(this.dw_descargo)
destroy(this.gb_7)
destroy(this.cb_2)
end on

type cb_menos from commandbutton within tabpage_solicitud
integer x = 2624
integer y = 1396
integer width = 78
integer height = 64
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "-"
end type

event clicked;if tab_1.tabpage_solicitud.dw_puesta_explotacion.getrow() > 0 then
	tab_1.tabpage_solicitud.dw_puesta_explotacion.deleterow(tab_1.tabpage_solicitud.dw_puesta_explotacion.getrow())
end if
end event

type cb_mas from commandbutton within tabpage_solicitud
integer x = 2624
integer y = 1320
integer width = 78
integer height = 64
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "+"
end type

event clicked;fw_anade_registro()
tab_1.tabpage_solicitud.dw_puesta_explotacion.setfocus()
end event

type st_56 from statictext within tabpage_solicitud
integer x = 261
integer y = 1076
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

type dw_puesta_explotacion from u_sgt_instalaciones within tabpage_solicitud
integer x = 261
integer y = 1148
integer width = 2350
integer height = 312
integer taborder = 90
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_descargo from datawindow within tabpage_solicitud
integer x = 210
integer y = 92
integer width = 2432
integer height = 960
integer taborder = 21
string dataobject = "d_7002_mante_solicitud"
boolean border = false
boolean livescroll = true
end type

event retrieveend;string setting
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
dec ldt_ind_interrupcion
u_desc_2030_rn_filtro_descargo	lu_desc_const

if lu_comunic.is_comunic.strval6 = "lista_descargos" then
        
        Setpointer(HourGlass!)
        inicio_sol = tab_1.tabpage_solicitud.dw_descargo.getitemdatetime(1,"f_ini_solicitado")
        final_sol = tab_1.tabpage_solicitud.dw_descargo.getitemdatetime(1,"f_fin_solicitado")
        tab_1.tabpage_interrupcion.st_3.text = string(inicio_sol, 'dd/mm/yyyy hh:mm') 
        tab_1.tabpage_interrupcion.st_5.text = string (final_sol, 'dd/mm/yyyy hh:mm') 
        ll_nro_descargo = tab_1.tabpage_solicitud.dw_descargo.getItemnumber(1,"nro_descargo")
        il_nro_inst_padre = gu_comunic.is_comunic.longval1
		  IF iu_comunic.is_comunic.Accion_llamada <> "Modificacion" then  
			  tab_1.tabpage_interrupcion.dw_1.modify("f_inicio.protect = 1")
			  tab_1.tabpage_interrupcion.dw_1.modify("f_inicio.background.color="+gs_gris)
			  tab_1.tabpage_interrupcion.dw_1.modify("f_fin.protect = 1")
			  tab_1.tabpage_interrupcion.dw_1.modify("f_fin.background.color="+gs_gris)		  			
			  tab_1.tabpage_interrupcion.dw_1.enabled = false
		  ELSE
   		  tab_1.tabpage_interrupcion.dw_1.enabled = true
		  END IF
        tab_1.tabpage_solicitud.dw_descargo.modify("estado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("estado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("id_enviado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("id_enviado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("f_activado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("f_activado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("tipo_descargo.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("tipo_descargo.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("f_solicitado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("f_solicitado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("f_ini_solicitado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("f_ini_solicitado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("f_fin_solicitado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("f_fin_solicitado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("obs_solicitud.Edit.DisplayOnly='Yes'")
        tab_1.tabpage_solicitud.dw_descargo.modify("obs_solicitud.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("f_aprobado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("f_aprobado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("f_ini_aprobado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("f_ini_aprobado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("f_fin_aprobado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("f_fin_aprobado.background.color="+gs_gris)
        tab_1.tabpage_solicitud.dw_descargo.modify("obs_aprobado.protect = 1")
        tab_1.tabpage_solicitud.dw_descargo.modify("obs_aprobado.background.color="+gs_gris)

if tab_1.tabpage_solicitud.dw_descargo.getitemnumber(1,"estado") = fgci_descargo_modificado then
        setting = tab_1.tabpage_solicitud.dw_descargo.Describe("t_aprobado.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("t_aprobado.Text='Modificaci$$HEX1$$f300$$ENDHEX$$n'")
        setting = tab_1.tabpage_solicitud.dw_descargo.Describe("cf_aprobado_t.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("cf_aprobado_t.Text='Modificado'")
        setting = tab_1.tabpage_solicitud.dw_descargo.Describe("cf_ini_aprobado_t.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("cf_ini_aprobado_t.Text='Inicio Modificado'")
        setting = tab_1.tabpage_solicitud.dw_descargo.Describe("cf_fin_aprobado_t.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("cf_fin_aprobado_t.Text='Fin Modificado'")
end if
        
if tab_1.tabpage_solicitud.dw_descargo.getitemnumber(1,"estado") = fgci_descargo_rechazado then
        setting = tab_1.tabpage_solicitud.dw_descargo.Describe("t_aprobado.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("t_aprobado.Text='Rechazado'")
        setting = tab_1.tabpage_solicitud.dw_descargo.Describe("cf_aprobado_t.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("cf_aprobado_t.Text='Rechazado'")
        setting = tab_1.tabpage_solicitud.dw_descargo.Describe("cf_ini_aprobado_t.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("cf_ini_aprobado_t.Text='Inicio Rechazado'")
        setting = dw_descargo.Describe("cf_fin_aprobado_t.Text")
        tab_1.tabpage_solicitud.dw_descargo.Modify("cf_fin_aprobado_t.Text='Fin rechazado'")
end if
        
end if        

if (iu_comunic.is_comunic.Accion_llamada = "Modificacion" or &
   iu_comunic.is_comunic.Accion_llamada = "Rechazo" or &
   iu_comunic.is_comunic.Accion_llamada = "Aprobacion") and &
   fg_verifica_parametro("id_descargo desde gestion") Then
	
	tab_1.tabpage_solicitud.dw_descargo.SetTabOrder ('nom_desc', 10 )
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc.BackGround.Color = gs_blanco
	tab_1.tabpage_solicitud.dw_descargo.modify("nom_desc.background.color='" + gs_blanco +"'")
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc.protect = 0 
	if ib_new_tip_inc then
		tab_1.tabpage_accion.dw_rechaza.modify("sgd_descargos_ind_obligada.background.color=" + string(gs_blanco))
		tab_1.tabpage_accion.dw_rechaza.modify("sgd_descargos_ind_obligada.protect = 0")
		tab_1.tabpage_solicitud.dw_descargo.SetTabOrder ('sgd_descargos_ind_obligada', 100 )
	end if	
else
	tab_1.tabpage_solicitud.dw_descargo.SetTabOrder ('nom_desc', 0 )
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc.BackGround.Color = gs_gris
	tab_1.tabpage_solicitud.dw_descargo.modify("nom_desc.background.color='" + gs_gris +"'")
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc.protect = 1 
end if

if (iu_comunic.is_comunic.Accion_llamada = "Modificacion" or &
   iu_comunic.is_comunic.Accion_llamada = "Rechazo" or &
   iu_comunic.is_comunic.Accion_llamada = "Aprobacion") and &
   fg_verifica_parametro("agente_descargo desde gestion") Then
	
	tab_1.tabpage_solicitud.dw_descargo.SetTabOrder ('agente', 10 )
	tab_1.tabpage_solicitud.dw_descargo.object.agente.BackGround.Color = gs_blanco
	tab_1.tabpage_solicitud.dw_descargo.modify("agente.background.color='" + gs_blanco +"'")
	tab_1.tabpage_solicitud.dw_descargo.object.agente.protect = 0 
else
	tab_1.tabpage_solicitud.dw_descargo.SetTabOrder ('agente', 0 )
	tab_1.tabpage_solicitud.dw_descargo.object.agente.BackGround.Color = gs_gris
	tab_1.tabpage_solicitud.dw_descargo.modify("agente.background.color='" + gs_gris +"'")
	tab_1.tabpage_solicitud.dw_descargo.object.agente.protect = 1 
end if

ll_nro_ins= this.getitemnumber(1,"sgd_descargos_cod_inst_origen")
il_nro_descargo = this.getitemnumber(1,"nro_descargo")
//
//Recupera el nombre de la inst de los descargos

tab_1.tabpage_interrupcion.dw_1.settransobject(sqlca)
tab_1.tabpage_interrupcion.dw_1.retrieve(il_nro_descargo)

SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
 INTO :ls_nom_ins  
 FROM "SGD_INSTALACION"  
 WHERE 			"SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_ins   
			AND ( "SGD_INSTALACION"."BDI_JOB" = 0 );  // DSA 10/01/2000			

		  
lu_desc_const = Create u_desc_2030_rn_filtro_descargo;

ldt_ind_interrupcion = w_7106_mante_descargos.tab_1.tabpage_solicitud.dw_descargo.GetItemDecimal(1,'ind_interrupcion')
if ldt_ind_interrupcion = lu_desc_const.sin_interrupcion then
//		w_7106_mante_descargos.tab_1.SetRedraw(FALSE)
//		w_7106_mante_descargos.tab_1.tabpage_interrupcion.Visible = FALSE		
//		w_7106_mante_descargos.tab_1.SetRedraw(TRUE)
	tab_1.tabpage_interrupcion.st_2.text=ls_nom_ins  
	tab_1.tabpage_interrupcion.Text = 'Instalaciones'
	tab_1.tabpage_interrupcion.PictureName = "Regenerate!"
	fw_inst_descargo()
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
        
        tab_1.tabpage_interrupcion.st_6.text = ls_tiempo
        tab_1.tabpage_interrupcion.st_4.text = ls_tiempo		  


tab_1.tabpage_interrupcion.st_2.text=ls_nom_ins  

fw_inst_descargo()
// GNU 10-2-2006. Incidencia 0/396474
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Colombia. 12/07/2005.
// If gi_pais = 7 Then
If fg_verifica_parametro("Causa en descargos.") Then
// FIN GNU
	Int li_cod_causa
	String ls_desc_causa

	li_cod_causa = This.getitemnumber(1,"cod_causa")

	SELECT "GI_CAUSA"."DESCRIPCION"  
	 INTO :ls_desc_causa  
	 FROM "GI_CAUSA"  
	 WHERE "GI_CAUSA"."COD_CAUSA" = :li_cod_causa ;
	 
	 int li_subfamilia, li_familia, li_gpo_causa
	 string ls_descripcion
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
		 tab_1.tabpage_interrupcion.st_causa.TEXTSIZE=3
	end if

	tab_1.tabpage_interrupcion.st_causa.Text = ls_desc_causa
End If
// Fin. Sgo.
end event

event constructor;// Parametrizacion: Luis Ortiz Mayo/2001

fg_ventana_parametro("identificador", This)
end event

type gb_7 from groupbox within tabpage_solicitud
integer x = 96
integer y = 32
integer width = 2661
integer height = 1464
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informacion Descargo"
end type

type cb_2 from commandbutton within tabpage_solicitud
integer x = 1371
integer y = 876
integer width = 101
integer height = 60
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "->"
end type

event clicked;// LFE: Incidencia 0/325553
tab_1.tabpage_solicitud.dw_descargo.AcceptText()
//////
parent.setredraw(false)

IF il_grande = 1 THEN

	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.x = 59
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.y = 4
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.Width = 2331
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.Height = 808
	tab_1.tabpage_solicitud.dw_descargo.object.ind_interrupcion.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.trab_tension.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.subest_movil.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.ind_act_grafica.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.f_ini_solicitado.visible = false

	tab_1.tabpage_solicitud.dw_descargo.object.f_fin_solicitado.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.f_solicitado.visible = false
	//AHM (16/12/2010) ASUR 837464
//	tab_1.tabpage_solicitud.dw_descargo.object.id_solicitante.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.nom_usuario.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.descripcion.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.f_ini_solicitado_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.f_fin_solicitado_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.f_solicitado_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.id_solicitante_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.descripcion_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.estado.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.estado_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.tipo_descargo.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.tipo_descargo_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.agente.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.agente_t.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.f_ini_aprobado.visible = false
	tab_1.tabpage_solicitud.dw_descargo.object.f_fin_aprobado.visible = false	
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud_t.visible = false	
	tab_1.tabpage_solicitud.dw_descargo.object.gb_1.visible = false	
	tab_1.tabpage_solicitud.dw_descargo.object.gb_2.visible = false	
	
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
		tab_1.tabpage_solicitud.dw_descargo.object.sgd_descargos_ind_obligada.visible = false
	end if
	////////////////////////////////////////////////////
	
	this.x = 2440
	this.y = 872
	
	this.text='<-'
	
	tab_1.tabpage_solicitud.dw_descargo.setcolumn('obs_solicitud')
	tab_1.tabpage_solicitud.dw_descargo.setfocus()
	
	il_grande = 0
	
ELSE
		
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.x = 59
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.y = 540
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.Width = 1198
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.Height = 372
	tab_1.tabpage_solicitud.dw_descargo.object.f_ini_solicitado.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.f_fin_solicitado.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.f_solicitado.visible = true
	//AHM (16/12/2010) ASUR 837464
//	tab_1.tabpage_solicitud.dw_descargo.object.id_solicitante.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.nom_usuario.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.ind_interrupcion.visible = true
	IF tab_1.tabpage_solicitud.dw_descargo.object.ind_interrupcion[1] = 2 then
		tab_1.tabpage_solicitud.dw_descargo.object.trab_tension.visible = true
	END IF
	tab_1.tabpage_solicitud.dw_descargo.object.subest_movil.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.ind_act_grafica.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.descripcion.visible = true
	if isnull(tab_1.tabpage_solicitud.dw_descargo.getitemdatetime(1,'f_ini_solicitado')) then
		tab_1.tabpage_solicitud.dw_descargo.object.f_ini_solicitado_t.visible = false
		tab_1.tabpage_solicitud.dw_descargo.object.f_fin_solicitado_t.visible = false
	else
		tab_1.tabpage_solicitud.dw_descargo.object.f_ini_solicitado_t.visible = true
		tab_1.tabpage_solicitud.dw_descargo.object.f_fin_solicitado_t.visible = true
	end if
	tab_1.tabpage_solicitud.dw_descargo.object.f_solicitado_t.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.id_solicitante_t.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.nom_desc_t.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.descripcion_t.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.estado.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.estado_t.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.tipo_descargo.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.tipo_descargo_t.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.agente.visible = true
	tab_1.tabpage_solicitud.dw_descargo.object.agente_t.visible = true
	if isnull(tab_1.tabpage_solicitud.dw_descargo.getitemdatetime(1,'f_ini_aprobado')) then
		tab_1.tabpage_solicitud.dw_descargo.object.f_ini_aprobado.visible = false
		tab_1.tabpage_solicitud.dw_descargo.object.f_fin_aprobado.visible = false
	else
		tab_1.tabpage_solicitud.dw_descargo.object.f_ini_aprobado.visible = true
		tab_1.tabpage_solicitud.dw_descargo.object.f_fin_aprobado.visible = true
	end if
	tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud_t.visible = true	
	tab_1.tabpage_solicitud.dw_descargo.object.gb_1.visible = true	
	tab_1.tabpage_solicitud.dw_descargo.object.gb_2.visible = true
	
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
	   tab_1.tabpage_solicitud.dw_descargo.object.obs_solicitud.Height = 272
		tab_1.tabpage_solicitud.dw_descargo.object.sgd_descargos_ind_obligada.visible = true
	end if
	///////////////////////////////////////////////////
	
	tab_1.tabpage_solicitud.dw_descargo.setcolumn('obs_solicitud')
	tab_1.tabpage_solicitud.dw_descargo.setfocus()
	this.x = 1300
	this.y = 970
	
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
		if ib_new_tip_inc then
		   this.y = 872
		end if
	///////////////////////////////////////////////////
	
	il_grande = 1
	
	this.text='->'
	
END IF

this.show()

parent.setredraw(true)
end event

type tabpage_otros from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
long backcolor = 79741120
string text = "   Otros    "
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
integer x = 96
integer y = 84
integer width = 2862
integer height = 1144
integer taborder = 60
string dataobject = "d_7004_datos_solicitud_param_consulta"
boolean border = false
boolean livescroll = true
end type

type tabpage_interrupcion from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
long backcolor = 79741120
string text = "Interrupcion"
long tabbackcolor = 79741120
string picturename = "Incorpor.bmp"
long picturemaskcolor = 553648127
st_causa st_causa
st_6 st_6
st_5 st_5
st_3 st_3
st_2 st_2
st_9 st_9
st_8 st_8
st_7 st_7
st_interrupcion st_interrupcion
tv_1 tv_1
gb_4 gb_4
gb_2 gb_2
gb_3 gb_3
cb_marcar cb_marcar
cb_clientes cb_clientes
gb_5 gb_5
gb_causa gb_causa
dw_1 dw_1
st_4 st_4
end type

on tabpage_interrupcion.create
this.st_causa=create st_causa
this.st_6=create st_6
this.st_5=create st_5
this.st_3=create st_3
this.st_2=create st_2
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_interrupcion=create st_interrupcion
this.tv_1=create tv_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_3=create gb_3
this.cb_marcar=create cb_marcar
this.cb_clientes=create cb_clientes
this.gb_5=create gb_5
this.gb_causa=create gb_causa
this.dw_1=create dw_1
this.st_4=create st_4
this.Control[]={this.st_causa,&
this.st_6,&
this.st_5,&
this.st_3,&
this.st_2,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_interrupcion,&
this.tv_1,&
this.gb_4,&
this.gb_2,&
this.gb_3,&
this.cb_marcar,&
this.cb_clientes,&
this.gb_5,&
this.gb_causa,&
this.dw_1,&
this.st_4}
end on

on tabpage_interrupcion.destroy
destroy(this.st_causa)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_interrupcion)
destroy(this.tv_1)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.cb_marcar)
destroy(this.cb_clientes)
destroy(this.gb_5)
destroy(this.gb_causa)
destroy(this.dw_1)
destroy(this.st_4)
end on

type st_causa from statictext within tabpage_interrupcion
boolean visible = false
integer x = 1591
integer y = 784
integer width = 1234
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_interrupcion
integer x = 2213
integer y = 368
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_interrupcion
integer x = 2213
integer y = 272
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_interrupcion
integer x = 2213
integer y = 176
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_interrupcion
integer x = 1591
integer y = 580
integer width = 1234
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_interrupcion
integer x = 1481
integer y = 364
integer width = 677
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Tiempo Interrupci$$HEX1$$f300$$ENDHEX$$n Total"
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_interrupcion
integer x = 1481
integer y = 276
integer width = 421
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
string text = "Final Solicitado"
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_interrupcion
integer x = 1477
integer y = 184
integer width = 430
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
string text = "Inicio Solicitado"
boolean focusrectangle = false
end type

type st_interrupcion from statictext within tabpage_interrupcion
integer x = 73
integer y = 108
integer width = 768
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean enabled = false
string text = "Instalaciones Afectadas"
boolean focusrectangle = false
end type

type tv_1 from uo_man_instalac within tabpage_interrupcion
event ue_cargar ( )
event ue_versuministros ( )
integer x = 69
integer y = 184
integer width = 1257
integer height = 948
integer taborder = 11
boolean bringtotop = true
fontcharset fontcharset = ansi!
long backcolor = 79741120
string picturename[] = {"subest.bmp","sal_tra1.bmp","ct1.bmp","TRANSFOR.bmp","salbaj.bmp"}
string statepicturename[] = {"OFF.BMP","ON.BMP"}
integer ii_instalaciones_modificadas = 0
integer ii_instalaciones_interrumpidas = 0
integer ii_instalaciones_repuestas = 0
integer ii_cmd_padre = 0
integer ii_instalaciones_at = 0
integer ii_instalaciondes_indisponibles = 100
integer ii_instalaciones_indisponibles_oi = 200
end type

event ue_cargar;//long ll_nro_instalacion
//string ls_nom_instalacion
//long ll_handle
//treeviewitem le_elemento
//long ll_numero, ll_cantdad_descargos = 1
//long ll_nro_descargo
//int li_tipo_inst
//int li_icono
//Setpointer(HourGlass!)
//
//// DSA INI 03/04/2000
////if gu_comunic1.is_comunic.decval1 = 0 then 	return
//
////if gu_comunic1.is_comunic.Accion_retorno = "No Seleccionada"  then 
////	ib_con_interrupcion= false
////	return
////else
////	ib_con_interrupcion= TRUE
////end if
//// DSA FIN 03/04/2000
//
//il_nro_inst_padre = gu_comunic1.is_comunic.decval1
//
//	
//	SELECT count(*) INTO :ll_cantdad_descargos FROM sgd_descargos
//	WHERE cod_inst_origen = :il_nro_inst_padre and ind_interrupcion = 2;
//	
//	if ll_cantdad_descargos > 0 then
//		messagebox('Aviso','La Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada ya tiene un descargo sin interrupci$$HEX1$$f300$$ENDHEX$$n')
//		return
//	end if
//	
//
//
//
// DECLARE cu_arbol1 CURSOR FOR  
//  SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
//                 "SGD_INSTALACION"."NRO_INSTALACION",   
//                 "SGD_INSTALACION"."TIPO_INSTALACION"    
//    FROM "SGD_INSTALACION" 
//WHERE  "CO_NIVEL" < :fgci_tipo_acometida AND "NRO_INSTALACION" =  :gu_comunic1.is_comunic.decval1 AND BDI_JOB=0;
////tab_1.tabpage_interrupcion.dw_interrupcion.visible = true 
//open cu_arbol1 ;
//fetch cu_arbol1 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst;		
//		parent.setredraw(false)
//		li_icono= f_icono_arbol(li_tipo_inst)
//      ll_handle = tab_1.tabpage_interrupcion.tv_1.insertitemsort(0,ls_nom_instalacion,li_icono)		
//      tab_1.tabpage_interrupcion.tv_1.getitem(ll_handle, le_elemento)
//      s_elemento.codigo = ll_nro_instalacion
//		s_elemento.fila = li_tipo_inst
//      le_elemento.data = s_elemento
//      tab_1.tabpage_interrupcion.tv_1.setitem(ll_handle, le_elemento)
//		close cu_arbol1;
//
//		tab_1.tabpage_interrupcion.tv_1.selectitem(1)
//		parent.setredraw(true)
end event

event ue_versuministros;/////////////////////////////////////
// VERSION UNIFICADA AMR 05/08/2002
/////////////////////////////////////

TreeviewItem le_elemento
sw_rama ls_elemento
s_grupo_int sw_datos
long ll_fila

tv_1.getItem(il_handle,le_elemento)

ls_elemento = le_elemento.data

sw_datos.nro_instalacion = ls_elemento.codigo

// GNU 1-08-2005
sw_datos.nro_instalacion_int[1] = ls_elemento.codigo

//If tab_1.tabpage_interrupcion.dw_1.rowcount() = 0 then
//   sw_datos.inicio[1] = tab_1.tabpage_solicitud.dw_descargo.GetItemDatetime(1,'f_ini_solicitado')
//else
//	ll_fila = tab_1.tabpage_interrupcion.dw_1.Find("cod_instalacion = " + string(ls_elemento.codigo) ,1, dw_1.RowCount( ))
//	if isnull(ll_fila) or ll_fila = 0 then
//		 sw_datos.inicio[1] = tab_1.tabpage_solicitud.dw_descargo.GetItemDatetime(1,'f_ini_solicitado')
//	else
//		 sw_datos.inicio[1] = tab_1.tabpage_interrupcion.dw_1.getitemdatetime(ll_fila,'f_inicio')
//	end if
//end if  
// Fin GNU

if isnull(ls_elemento.codigo) then
    messagebox('AVISO', 'El codigo de la instalaci$$HEX1$$f300$$ENDHEX$$n es incorrecto, revise la selecci$$HEX1$$f300$$ENDHEX$$n')
else
	OpenWithParm(w_ver_sum_importantes, sw_datos)
end if
end event

event selectionchanged;////treev-*iewitem le_elemento
////sw_rama sl_rama
//////tab_1.tabpage_accion.d_interrupcion.visible = false
////
////this.getitem(newhandle,le_elemento)
////
////if le_elemento.bold = true then
////        sl_rama = le_elemento.data
//////        tab_1.tabpage_accion.d_interrupcion.scrolltorow(sl_rama.fila)
//////        tab_1.tabpage_accion.d_interrupcion.visible = true
////end if
////        

treeviewitem le_elemento
sw_rama sl_rama
tab_1.tabpage_interrupcion.dw_1.visible = false

this.getitem(newhandle,le_elemento)
il_handle = newhandle

if le_elemento.bold = true then
        sl_rama = le_elemento.data
        tab_1.tabpage_interrupcion.dw_1.scrolltorow(sl_rama.fila)
        
        datetime inicio, final, inicio_sol, final_sol
        long ll_interrumpido
        long ll_horas, ll_minutos, ll_dias, ll_resto
        string ls_tiempo
        string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"

        w_7106_mante_descargos.tab_1.tabpage_interrupcion.dw_1.AcceptText()
        
        if dw_1.rowcount() < 1 then
                return
        end if
        
        inicio = tab_1.tabpage_interrupcion.dw_1.getitemdatetime(tab_1.tabpage_interrupcion.dw_1.getrow(),"f_inicio")
        final = tab_1.tabpage_interrupcion.dw_1.getitemdatetime(tab_1.tabpage_interrupcion.dw_1.getrow(),"f_fin")
        
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
        
        tab_1.tabpage_interrupcion.dw_1.visible = true
else
	     st_4.visible = false
        
        tab_1.tabpage_interrupcion.dw_1.visible = false

end if
end event

event selectionchanging;datetime dt_fecha_aprob
datetime dt_f_ini_aprob, dt_f_ini_int
datetime dt_f_fin_aprob, dt_f_fin_int
string ls_obs
long ll_fila

//tab_1.tabpage_accion.d_interrupcion.accepttext()
tab_1.tabpage_accion.dw_rechaza.accepttext()
dt_fecha_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_aprobado")
dt_f_ini_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_ini_aprobado")
dt_f_fin_aprob=tab_1.tabpage_accion.dw_rechaza.getitemdatetime(1,"f_fin_aprobado")
ls_obs=tab_1.tabpage_accion.dw_rechaza.getitemstring(1,"obs_aprobado")




end event

event rightclicked;call super::rightclicked;///////////////////////////////////////
//// VERSION UNIFICADA AMR 05/08/2002
///////////////////////////////////////
//
//
//TreeviewItem le_elemento
//il_handle = handle
//s_rama ls_elemento
//	
//	if handle = 0 then return
//	
//	gs_ventana_llamante = 'w_7106_mante_descargos'
//	
//	m_7106_mantenimiento_descargos NewMenu
//	
//	NewMenu = CREATE m_7106_mantenimiento_descargos
//	
//	m_7106_mantenimiento_descargos.PopMenu(w_7106_mante_descargos.PointerX(), w_7106_mante_descargos.PointerY())
//	

treeviewitem le_elemento,le_elemento_h,le_elemento_b
sw_rama ls_elemento
long ll_retorno, ll_fila
int li_item,li_item_sel, li_tv1

//if  NOT ib_con_interrupcion then return

if tab_1.tabpage_solicitud.dw_descargo.object.ind_interrupcion[1] <> 1 OR &
	iu_comunic.is_comunic.Accion_llamada <> "Modificacion" then
	return
END IF

tab_1.tabpage_interrupcion.tv_1.getitem(handle,le_elemento)

// Si la tecla de control est$$HEX2$$e1002000$$ENDHEX$$pinzada no se eliminan las selecciones anteriores en caso contrario si, siempre que el registro seleccionado se pueda marcar/desamarcar

//IF keyDown(KeyControl!) = FALSE AND handle > 0 AND fw_comprueba_padres_hijos(le_elemento) = 0 THEN
//
//	tab_1.tabpage_interrupcion.tv_1.getitem(il_item_hasta,le_elemento_b)
//	
//	do while li_item <> -1
//	
//		le_elemento_b.StatePictureIndex = 1
//		tab_1.tabpage_interrupcion.tv_1.setitem(le_elemento_b.itemhandle, le_elemento_b)
//		li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(previousTreeItem!,le_elemento_b.itemhandle)
//		tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento_b)
//		
//	loop
//	
//	li_item = 0
//	tab_1.tabpage_interrupcion.tv_1.getitem(il_item_hasta,le_elemento_b)
//	
//	do while li_item <> -1
//	
//		le_elemento_b.StatePictureIndex = 1
//		tab_1.tabpage_interrupcion.tv_1.setitem(le_elemento_b.itemhandle, le_elemento_b)
//		li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(nextTreeItem!,le_elemento_b.itemhandle)
//		tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento_b)	
//	loop
//
//END IF 

li_item = 0

// GNU 28-06-2005

IF (KeyDown(KeyControl!)= FALSE) AND (handle > 0) THEN
	li_tv1=tab_1.tabpage_interrupcion.tv_1.FindItem(roottreeitem!,0)
	fnu_Poner_Blanco(li_tv1)
END IF

//FIN GNU

// si est$$HEX2$$e1002000$$ENDHEX$$pulsando la tecla mayusculas puede seleccionar los hijos o puede selecionar un rango

IF keyDown(KeyShift!) AND handle > 0 THEN
	
	li_item_sel = 	tab_1.tabpage_interrupcion.tv_1.finditem(currenttreeitem!,0)
	
	tab_1.tabpage_interrupcion.tv_1.getitem(li_item_sel,	le_elemento_click)

	IF le_elemento.level = le_elemento_click.level and  tab_1.tabpage_interrupcion.tv_1.FindItem(parentTreeItem! , le_elemento_click.itemhandle) = tab_1.tabpage_interrupcion.tv_1.FindItem(parentTreeItem! , le_elemento.itemhandle) THEN
		
		tab_1.tabpage_interrupcion.tv_1.getitem(le_elemento_click.itemhandle,le_elemento_h)		
		
		  IF fw_direccion(le_elemento,le_elemento_h) = 0 then
		  
			DO WHILE (fw_direccion(le_elemento,le_elemento_h) = 0 or le_elemento.label = le_elemento_h.label) AND li_item <> -1
				
				// Comprueba padres hijos del elemento seleccionado

				IF il_item_hasta < le_elemento_h.itemHandle THEN
					il_item_hasta = le_elemento_h.itemHandle
				END IF
				
				IF fw_comprueba_padres_hijos(le_elemento_h) = 0 then
				
					le_elemento_h.StatePictureIndex = 2
					tab_1.tabpage_interrupcion.tv_1.setitem(le_elemento_h.itemhandle, le_elemento_h)
		
				END IF
				
				li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(previousTreeItem! , le_elemento_h.itemhandle)
				tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento_h)
				
			LOOP
		
		ELSE
			
			DO WHILE (fw_direccion(le_elemento,le_elemento_h) = 1 or le_elemento.label = le_elemento_h.label) AND li_item <> -1
				
				// Comprueba padres hijos del elemento seleccionado
				
				IF il_item_hasta < le_elemento_h.itemHandle THEN
					il_item_hasta = le_elemento_h.itemHandle
				END IF
				
				IF fw_comprueba_padres_hijos(le_elemento_h) = 0 then
				
					le_elemento_h.StatePictureIndex = 2
					tab_1.tabpage_interrupcion.tv_1.setitem(le_elemento_h.itemhandle, le_elemento_h)
		
				END IF
				
				li_item = tab_1.tabpage_interrupcion.tv_1.FindItem(NextTreeItem! , le_elemento_h.itemhandle)
				tab_1.tabpage_interrupcion.tv_1.getitem(li_item,le_elemento_h)
				
			
			LOOP
									
		END IF
		
	END IF

ELSEIF handle > 0 THEN
	
	IF le_elemento.StatePictureIndex = 1 THEN
		le_elemento.StatePictureIndex = 2
	ELSEIF le_elemento.StatePictureIndex = 2 THEN
		le_elemento.StatePictureIndex = 1
	END IF
	
	tab_1.tabpage_interrupcion.tv_1.setitem(handle, le_elemento)
	
	ll_retorno = fw_puede_seleccionar(le_elemento,le_elemento.level)
	IF ll_retorno = -1 THEN	
		le_elemento.StatePictureIndex = 1
		tab_1.tabpage_interrupcion.tv_1.setitem(handle, le_elemento)
		return
	END IF 
	
	IF il_item_hasta < le_elemento.itemHandle THEN
		il_item_hasta = le_elemento.itemHandle
	END IF
	
END IF 

fw_habilitar_botones(le_elemento)

IF handle > 0 THEN
	ls_elemento = le_elemento.data
	le_elemento_click = le_elemento

	if le_elemento.bold = false then
		tab_1.tabpage_interrupcion.dw_1.visible = false
	else
		ll_fila = tab_1.tabpage_interrupcion.dw_1.Find("cod_instalacion = " + string(ls_elemento.codigo) ,1, dw_1.RowCount( ))
		tab_1.tabpage_interrupcion.dw_1.visible = true
		tab_1.tabpage_interrupcion.dw_1.ScrollToRow(ll_fila)
	end if
END IF

end event

type gb_4 from groupbox within tabpage_interrupcion
integer x = 1435
integer y = 496
integer width = 1568
integer height = 200
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Descargo "
end type

type gb_2 from groupbox within tabpage_interrupcion
integer x = 18
integer y = 112
integer width = 1371
integer height = 1064
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within tabpage_interrupcion
integer x = 1435
integer y = 112
integer width = 1568
integer height = 352
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descargo General"
end type

type cb_marcar from commandbutton within tabpage_interrupcion
integer x = 55
integer y = 1228
integer width = 553
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Modificar Fechas"
end type

event clicked;int li_indice, li_contador, li_row, li_tipo
treeviewItem le_elemento
sw_rama ls_elemento
datetime ldt_fecha

DataStore ldt_instalaciones, ldt_interrupciones
li_contador =0
li_row=0

//if  NOT ib_con_interrupcion then return

if tab_1.tabpage_solicitud.dw_descargo.object.ind_interrupcion[1] <> 1 then return

ldt_fecha = Datetime(today(),now())
ldt_instalaciones = Create DataStore
ldt_interrupciones = Create DataStore
ldt_instalaciones.DataObject = 'dw_bloque_inst_desc'
ldt_interrupciones.DataObject = 'd_7004_fechas_interr'
ldt_instalaciones.SetTransObject(SQLCA)
SetPointer(HourGlass!)
//tab_1.tabpage_solicitud.dw_datos_solicitud.AcceptText()
//ldt_instalaciones.Retrieve(il_nro_descargo)
ldt_interrupciones.Reset()
FOR li_indice = 1 TO il_item_hasta +1
	tab_1.tabpage_interrupcion.tv_1.getitem(li_indice,le_elemento)
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
			ldt_instalaciones.SetITem(li_contador,'f_inicio',tab_1.tabpage_accion.dw_rechaza.GetItemDatetime(1,'f_ini_aprobado'))
			ldt_instalaciones.SetITem(li_contador,'f_fin',tab_1.tabpage_accion.dw_rechaza.GetItemDatetime(1,'f_fin_aprobado'))				
		ELSEIF li_row > 0 THEN 	
			ldt_instalaciones.SetITem(li_row,'f_inicio',tab_1.tabpage_accion.dw_rechaza.GetItemDatetime(1,'f_ini_aprobado'))
			ldt_instalaciones.SetITem(li_row,'f_fin',tab_1.tabpage_accion.dw_rechaza.GetItemDatetime(1,'f_fin_aprobado'))		
		END IF
	END IF
NEXT
ldt_instalaciones.AcceptText()
SetPointer(Arrow!)

OpenWithParm(w_7106_marcar_interrupcion, ldt_instalaciones)

//cb_clientes.enabled = false

// Recojo las interrupciones y deselecciono las instalaciones del arbol
ldt_interrupciones = Message.PowerObjectParm
IF ldt_interrupciones.RowCount() > 0 THEN
	FOR li_indice = 1 TO il_item_hasta +1
		tab_1.tabpage_interrupcion.tv_1.getitem(li_indice,le_elemento)
		IF le_elemento.StatePictureIndex = 2 THEN
			le_elemento.StatePictureIndex = 1
			le_elemento.bold = true 
			tab_1.tabpage_interrupcion.tv_1.setitem(li_indice, le_elemento)
		
		END IF
	NEXT
	cb_marcar.enabled = false
//	cb_desmarcar.enabled = false
END IF

long ll_cod_instalacion, li_fila

//LI = tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()

FOR li_indice = 1 TO ldt_interrupciones.RowCount()
	ll_cod_instalacion = ldt_interrupciones.GetITemNumber(li_indice,'cod_instalacion')
	li_row = tab_1.tabpage_interrupcion.dw_1.find('cod_instalacion = ' + string(ll_cod_instalacion),1,tab_1.tabpage_interrupcion.dw_1.RowCount())	
//	IF li_row = 0 AND sqlca.sqlcode <> -1 THEN	
//		li_fila=tab_1.tabpage_interrupciones.dw_1.InsertRow(0)
//		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'nro_descargo',il_nro_descargo)
//		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'cod_instalacion',ll_cod_instalacion)
//		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_inicio',ldt_interrupciones.GetItemDateTime(li_indice,'f_inicio'))
//		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_fin',ldt_interrupciones.GetItemDatetime(li_indice,'f_fin'))
//		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_alta',ldt_fecha)
//		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'programa','w_7106')
//		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'usuario',gs_usuario)
	IF li_row > 0 THEN
		tab_1.tabpage_interrupcion.dw_1.SetItem(li_row,'f_inicio',ldt_interrupciones.GetItemDateTime(li_indice,'f_inicio'))
		tab_1.tabpage_interrupcion.dw_1.SetItem(li_row,'f_fin',ldt_interrupciones.GetItemDatetime(li_indice,'f_fin'))
		tab_1.tabpage_interrupcion.dw_1.SetItem(li_row,'f_alta',ldt_fecha)		
	END IF
NEXT
		
		
//FOR li_indice = 1 TO ldt_interrupciones.RowCount()
//	
//	IF li_row = 0 AND sqlca.sqlcode <> -1 THEN
//		ldt_interrupciones.RowsCopy(li_indice,li_indice, Primary!, tab_1.tabpage_interrupciones.dw_interrupcion, tab_1.tabpage_interrupciones.dw_interrupcion.RowCount(), Primary!)
//	END IF		
//NEXT
//
//ldt_interrupciones.RowsCopy(1,ldt_interrupciones.RowCount(), Primary!, tab_1.tabpage_interrupciones.dw_interrupcion, 1, Primary!)
tab_1.tabpage_interrupcion.dw_1.AcceptText()


end event

type cb_clientes from commandbutton within tabpage_interrupcion
integer x = 795
integer y = 1228
integer width = 553
integer height = 108
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Suministros"
end type

event clicked;/////////////////////////////////////
// VERSION UNIFICADA AMR 05/08/2002
/////////////////////////////////////
gi_clientes_afec = 2
IF il_handle > 0 THEN
	tab_1.tabpage_interrupcion.tv_1.triggerevent('ue_versuministros')
END IF


end event

type gb_5 from groupbox within tabpage_interrupcion
integer x = 1435
integer y = 720
integer width = 1568
integer height = 456
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Intervalo Horario "
end type

type gb_causa from groupbox within tabpage_interrupcion
boolean visible = false
integer x = 1435
integer y = 700
integer width = 1568
integer height = 200
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Causa "
end type

type dw_1 from datawindow within tabpage_interrupcion
integer x = 1518
integer y = 784
integer width = 1445
integer height = 296
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_descargo"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;datetime inicio, final, inicio_sol, final_sol
long ll_interrumpido
long ll_horas, ll_minutos, ll_dias, ll_resto
string ls_tiempo
string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos"
        
        tab_1.tabpage_interrupcion.st_4.text = ""

        tab_1.tabpage_interrupcion.dw_1.AcceptText()
        
        if tab_1.tabpage_interrupcion.dw_1.rowcount() < 1 then
                return
        end if
        
        inicio = tab_1.tabpage_interrupcion.dw_1.getitemdatetime(tab_1.tabpage_interrupcion.dw_1.getrow(),"f_inicio")
        final = tab_1.tabpage_interrupcion.dw_1.getitemdatetime(tab_1.tabpage_interrupcion.dw_1.getrow(),"f_fin")
        

        
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
        
        tab_1.tabpage_interrupcion.st_4.text = ls_tiempo
  IF iu_comunic.is_comunic.Accion_llamada = "Modificacion" then      
        tab_1.tabpage_interrupcion.st_4.visible = false  
  ELSE
        tab_1.tabpage_interrupcion.st_4.visible = true
  END IF

end event

event itemerror;//long ll_error,i_sql_ok
//string msg_error
//
//msg_error = sqlerrtext
//ll_error = sqldbcode
//  IF ll_error <> 0 THEN
//
//                CHOOSE CASE ll_error
//                        CASE 1407,1400
//                                        gnv_msg.f_mensaje("EG05","la tabla sgd_interrupcion_descargos  ","",OK!)
//                 CASE ELSE 
//                                        MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
//          END CHOOSE
//                  gnu_u_transaction.uf_rollback();
//
//                 RETURN 1
//  END IF
end event

event retrieveend;tab_1.tabpage_interrupcion.st_4.text = ""
end event

type st_4 from statictext within tabpage_interrupcion
integer x = 1591
integer y = 1072
integer width = 1271
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type tabpage_historial from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
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
event destroy ( )
integer x = 9
integer y = 8
integer width = 3013
integer taborder = 30
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_historial.destroy
call uo_historial_descargos::destroy
end on

event constructor;call super::constructor;Int li_tension, indice, li_par
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

type tabpage_instalaciones from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
long backcolor = 79741120
string text = "Instalaciones a descargar"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PasteStatement!"
long picturemaskcolor = 553648127
mle_observaciones mle_observaciones
gb_8 gb_8
end type

on tabpage_instalaciones.create
this.mle_observaciones=create mle_observaciones
this.gb_8=create gb_8
this.Control[]={this.mle_observaciones,&
this.gb_8}
end on

on tabpage_instalaciones.destroy
destroy(this.mle_observaciones)
destroy(this.gb_8)
end on

type mle_observaciones from multilineedit within tabpage_instalaciones
integer x = 114
integer y = 156
integer width = 2802
integer height = 1248
integer taborder = 31
boolean bringtotop = true
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 2000
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_8 from groupbox within tabpage_instalaciones
integer x = 73
integer y = 80
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

type tabpage_accion from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
long backcolor = 79741120
string text = "Aprobar"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom038!"
long picturemaskcolor = 553648127
dw_informacion_extra dw_informacion_extra
dw_instalacion dw_instalacion
dw_rechaza dw_rechaza
dw_solicitud dw_solicitud
end type

on tabpage_accion.create
this.dw_informacion_extra=create dw_informacion_extra
this.dw_instalacion=create dw_instalacion
this.dw_rechaza=create dw_rechaza
this.dw_solicitud=create dw_solicitud
this.Control[]={this.dw_informacion_extra,&
this.dw_instalacion,&
this.dw_rechaza,&
this.dw_solicitud}
end on

on tabpage_accion.destroy
destroy(this.dw_informacion_extra)
destroy(this.dw_instalacion)
destroy(this.dw_rechaza)
destroy(this.dw_solicitud)
end on

type dw_informacion_extra from datawindow within tabpage_accion
boolean visible = false
integer x = 23
integer y = 776
integer width = 1358
integer height = 632
integer taborder = 90
string dataobject = "d_7002_mante_info_param"
boolean border = false
boolean livescroll = true
end type

type dw_instalacion from u_tab_7002_instalacion_descargos within tabpage_accion
integer x = 46
integer y = 216
integer width = 1349
integer height = 224
integer taborder = 20
boolean border = false
borderstyle borderstyle = stylebox!
end type

type dw_rechaza from u_tab_7002_grabar_descargos within tabpage_accion
integer x = 1371
integer y = 212
integer width = 1522
integer height = 1028
integer taborder = 40
string dataobject = "d_7002_mante_rechazar"
end type

event itemchanged;call super::itemchanged;ib_guardo=false
end event

event dberror;call super::dberror;return 1
end event

type dw_solicitud from u_tab_7002_solicitar_descargos within tabpage_accion
integer x = 14
integer y = 500
integer width = 1349
integer height = 564
integer taborder = 50
boolean border = false
borderstyle borderstyle = stylebox!
end type

type tabpage_trabajos from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
long backcolor = 79741120
string text = "Rechazar BDI"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "NotFound!"
long picturemaskcolor = 553648127
dw_trabajos_bdi dw_trabajos_bdi
gb_6 gb_6
end type

on tabpage_trabajos.create
this.dw_trabajos_bdi=create dw_trabajos_bdi
this.gb_6=create gb_6
this.Control[]={this.dw_trabajos_bdi,&
this.gb_6}
end on

on tabpage_trabajos.destroy
destroy(this.dw_trabajos_bdi)
destroy(this.gb_6)
end on

type dw_trabajos_bdi from datawindow within tabpage_trabajos
integer x = 201
integer y = 164
integer width = 2597
integer height = 928
integer taborder = 40
string dataobject = "d_trabajos_rechazados_bdi"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;if tab_1.tabpage_trabajos.dw_trabajos_bdi.getselectedrow(row - 1) = row then
        tab_1.tabpage_trabajos.dw_trabajos_bdi.selectrow(row, false)
else
        tab_1.tabpage_trabajos.dw_trabajos_bdi.selectrow(row, true)
end if
end event

type gb_6 from groupbox within tabpage_trabajos
integer x = 128
integer y = 80
integer width = 2688
integer height = 1064
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trabajos asociados al Descargo"
end type

type tabpage_int_simulacion from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3035
integer height = 1540
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
integer x = 18
integer y = 16
integer width = 2999
integer height = 1512
integer taborder = 11
boolean bringtotop = true
end type


HA$PBExportHeader$w_disponibilidad_activo.srw
forward
global type w_disponibilidad_activo from window
end type
type st_cambio_operatividad from statictext within w_disponibilidad_activo
end type
type ddlb_operatividad from dropdownlistbox within w_disponibilidad_activo
end type
type uo_activos from u_activos within w_disponibilidad_activo
end type
type st_instalacion_sel from statictext within w_disponibilidad_activo
end type
type dw_historico_disponibilidad from datawindow within w_disponibilidad_activo
end type
type gb_hist_disp from groupbox within w_disponibilidad_activo
end type
type dw_variacion_disponibilidad from datawindow within w_disponibilidad_activo
end type
type gb_variacion_disp from groupbox within w_disponibilidad_activo
end type
end forward

global type w_disponibilidad_activo from window
integer width = 3584
integer height = 1992
boolean titlebar = true
string title = "OPEN SGI - Operatividad de Activos"
string menuname = "m_disponibilidades"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_cambio_operatividad st_cambio_operatividad
ddlb_operatividad ddlb_operatividad
uo_activos uo_activos
st_instalacion_sel st_instalacion_sel
dw_historico_disponibilidad dw_historico_disponibilidad
gb_hist_disp gb_hist_disp
dw_variacion_disponibilidad dw_variacion_disponibilidad
gb_variacion_disp gb_variacion_disp
end type
global w_disponibilidad_activo w_disponibilidad_activo

type variables

long il_nro_instalacion
boolean ib_modificando_disponibilidad = FALSE
long il_modificado = 0

int ii_chequear_consignacion
int ii_chequear_activo_causante
int ii_chequear_f_instruccion, ii_tipo_movimiento

long il_registro_modificado

long il_row_historico

int ii_virgin_estado_operatividad
long il_virgin_disponibilidad

long il_nro_incidencia  = 0
boolean ib_desbloquear_indisponibilidad = false

end variables

forward prototypes
public function integer fw_grabar_disponibilidad ()
public subroutine fw_validaciones_disponibilidad ()
public subroutine fw_iniciar_modificacion_disponibilidad ()
public subroutine fw_finalizar_modificacion_disponibilidad ()
public function string uf_get_itemstatus (dwitemstatus pdwis_indisponibilidad)
public subroutine uf_set_estructura_causa (long pl_cod_causa)
public subroutine uf_proteger_consignacion (boolean pb_proteger)
public function boolean uf_verify_consignacion ()
public function boolean uf_verify_tipo_trafo (long pl_cod_activo)
public subroutine uf_verify_activo (long pl_nro_instalacion)
public subroutine fw_inicializar_activo ()
public function boolean uf_verify_operatividad ()
public subroutine uf_visualizar_campos (boolean pb_visualizar)
public function boolean uf_verify_campos ()
public function boolean uf_verify_textos ()
public function boolean uf_verify_fechas ()
public function boolean uf_verify_disponibilidad ()
public function boolean fw_grabar_indisponibilidad ()
end prototypes

public function integer fw_grabar_disponibilidad ();int li_status, li_return = 0
long ll_status, ll_disponibilidad,ll_operatividad, ll_tipo_movimiento
string ls_texto
dwItemStatus ldwis_variacion_disponibilidad


int ll_auxiliar, li_tipo_activo
boolean lb_auxiliar, lb_status_incidencia = true

dw_variacion_disponibilidad.AcceptText()

ll_auxiliar = dw_variacion_disponibilidad.object.nro_instalacion[1]

ldwis_variacion_disponibilidad = dw_variacion_disponibilidad.GetItemStatus(1,0, Primary!)
if not(ldwis_variacion_disponibilidad = notmodified!) then 	
	
	lb_auxiliar = uf_verify_campos()
	
	if lb_auxiliar = false then 
		li_return = -1 
	else				
		if isnull(dw_variacion_disponibilidad.GetItemNumber(1, "disponibilidad_act")) OR &
			dw_variacion_disponibilidad.GetItemNumber(1, "disponibilidad_act") > 100 OR &
			dw_variacion_disponibilidad.GetItemNumber(1, "disponibilidad_act") < 0  then 
			
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La Disponibilidad del Activo debe estar comprendida entre 0 y 100")	
			li_return = -1
		else 
			
			ll_tipo_movimiento = dw_variacion_disponibilidad.object.tipo_movimiento[1]
			if ll_tipo_movimiento = 5 then 
				SELECT TIPO_ACTIVO
				  INTO :li_tipo_activo
				  FROM SGD_INSTALACION_AT
				 WHERE NRO_INSTALACION = :il_nro_instalacion;
			
				//En el caso de bah$$HEX1$$ed00$$ENDHEX$$a el cambio de estado debe hacerse desde la propia indisponibilidad
				if li_tipo_activo <> 1 then 				
					lb_status_incidencia = fw_grabar_indisponibilidad()					
				end if
			end if
			
			if lb_status_incidencia then 
				ll_status = dw_variacion_disponibilidad.Update()
				if ll_status = 1 then 
					li_return = 0
					commit;
					
					if ib_desbloquear_indisponibilidad  then 				
						gnu_u_transaction.uf_commit(this,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(il_nro_incidencia), fgci_bloqueo_incidencia, il_nro_incidencia)
					end if
					
					commit;
		
					ldwis_variacion_disponibilidad = dw_variacion_disponibilidad.GetItemStatus(1,0, Primary!)
					
					fw_finalizar_modificacion_disponibilidad()
					
					this.SetRedraw(False)
					dw_variacion_disponibilidad.Reset()
					dw_variacion_disponibilidad.Retrieve(il_nro_instalacion)
					dw_historico_disponibilidad.Reset()
					dw_historico_disponibilidad.Retrieve(il_nro_instalacion)
					ll_disponibilidad = dw_variacion_disponibilidad.object.disponibilidad_act[1]
					uo_activos.uf_set_disponibilidad(ll_disponibilidad, il_registro_modificado)
					ll_operatividad = dw_variacion_disponibilidad.object.estado_operatividad[1]
					uo_activos.uf_set_operatividad(ll_operatividad, il_registro_modificado)
					
					ii_virgin_estado_operatividad = dw_variacion_disponibilidad.object.estado_operatividad[1]
					this.SetRedraw(True)
					
				else
					messagebox("Error al actualizar en la tabla SGD_DISPONIBILIDAD",sqlca.sqlerrtext)
					rollback;
					li_return = -1
				end if
				
			end if
		end if

	end if
end if
	

return li_return


end function

public subroutine fw_validaciones_disponibilidad ();



if dw_variacion_disponibilidad.RowCount() > 0 then 
	
	// Si est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Demora justificada maniobra' se habilita 
	// el campo 'Descripci$$HEX1$$f300$$ENDHEX$$n demora justificada maniobra'
	if dw_variacion_disponibilidad.GetItemNumber(1,'demora_justificada') = 0 then	
		dw_variacion_disponibilidad.Modify("descripcion_demora.protect=0")
		dw_variacion_disponibilidad.Modify("descripcion_demora.background.Color="+gs_blanco)		
	else
		dw_variacion_disponibilidad.Modify("descripcion_demora.protect=1")
		dw_variacion_disponibilidad.Modify("descripcion_demora.background.Color="+gs_gris)			
	end if
	
	
	// Si est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Consignaci$$HEX1$$f300$$ENDHEX$$n Nacional' se habilitan 
	// los campos 'N$$HEX1$$fa00$$ENDHEX$$mero', 'PSM' y 'Por fuera de PSM'
	if dw_variacion_disponibilidad.GetItemNumber(1,'consignacion_nac_check') = 0 then	
		dw_variacion_disponibilidad.Modify("consignacion_nacional.protect=0")
		dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_blanco)	
	else
		dw_variacion_disponibilidad.Modify("consignacion_nacional.protect=1")
		dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_gris)	
	end if
end if


end subroutine

public subroutine fw_iniciar_modificacion_disponibilidad ();
long ll_status, ll_null, ll_tipo_movimiento
string ls_mensaje
datetime ldt_null

setnull(ldt_null)
setnull(ll_null)

if ib_modificando_disponibilidad = false then 

	ll_status = gu_rf_servidor_operacion.of_bloquea("SGD_DISPONIBILIDAD", il_nro_instalacion, ls_mensaje)
	if ll_status = 0 then 
		messagebox("", ls_mensaje, Exclamation!, ok!)	
		dw_variacion_disponibilidad.Retrieve(il_nro_instalacion)
	else
		ib_modificando_disponibilidad = true
		il_virgin_disponibilidad = dw_variacion_disponibilidad.object.disponibilidad_act[1]
		
		dw_variacion_disponibilidad.object.tiempo_ocurrencia[1] = ldt_null
		dw_variacion_disponibilidad.Modify('tiempo_ocurrencia.protect = 0') 
		dw_variacion_disponibilidad.Modify("tiempo_ocurrencia.background.Color="+gs_blanco)

		dw_variacion_disponibilidad.object.tiempo_reporte[1] = ldt_null
		dw_variacion_disponibilidad.Modify('tiempo_reporte.protect = 0') 

		dw_variacion_disponibilidad.object.cod_causa[1] = ll_null
		dw_variacion_disponibilidad.object.familia_causa_t.Text = ''
		dw_variacion_disponibilidad.object.categoria_causa_t.Text = ''
		
		dw_variacion_disponibilidad.object.tiempo_instruccion.visible = FALSE
		dw_variacion_disponibilidad.object.tiempo_instruccion_t.visible = FALSE		

		dw_variacion_disponibilidad.object.nro_instalacion[1] = il_nro_instalacion
		ll_tipo_movimiento =  dw_variacion_disponibilidad.object.tipo_movimiento[1] 
		
		dw_variacion_disponibilidad.Modify('descripcion_demora.protect = 1') 
		dw_variacion_disponibilidad.Modify('descripcion_demora.background.Color='+gs_gris) 
		
		dw_variacion_disponibilidad.Modify('consignacion_nacional.protect = 0') 
		dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_blanco)
		dw_variacion_disponibilidad.Modify('tipo_psm.protect = 0') 
		dw_variacion_disponibilidad.Modify("tipo_psm.background.Color="+gs_blanco)
		dw_variacion_disponibilidad.Modify('observaciones.protect = 0') 
		dw_variacion_disponibilidad.Modify("observaciones.background.Color="+gs_blanco)
		
		
		dw_variacion_disponibilidad.object.activo_causante[1]= ll_null
			
		dw_variacion_disponibilidad.object.consignacion_nacional[1] = ''
		dw_variacion_disponibilidad.object.consignacion_nac_check[1] =0
		dw_variacion_disponibilidad.object.demora_justificada[1] =0
		dw_variacion_disponibilidad.object.descripcion_demora[1] =''
		dw_variacion_disponibilidad.object.tipo_psm[1] = -1
		dw_variacion_disponibilidad.object.observaciones[1] = ''
		
		dw_variacion_disponibilidad.Object.gb_consignacion_nacional.visible = 0
		dw_variacion_disponibilidad.Object.consignacion_nacional_t.visible = 0
		dw_variacion_disponibilidad.Object.consignacion_nacional.visible = 0
		dw_variacion_disponibilidad.Object.tipo_psm_t.visible = 0
		dw_variacion_disponibilidad.Object.tipo_psm.visible = 0
		dw_variacion_disponibilidad.Object.gb_activo_causante.visible = 0
		dw_variacion_disponibilidad.Object.activo_causante_t.visible = 0	
		dw_variacion_disponibilidad.Object.activo_causante.visible = 0	
				
		if ll_tipo_movimiento = 4 then 
			dw_variacion_disponibilidad.Modify('disponibilidad_act.protect = 1') 
			dw_variacion_disponibilidad.Modify("disponibilidad_act.background.Color="+gs_gris)
			dw_variacion_disponibilidad.object.tiempo_reporte_t.visible = 1			
			dw_variacion_disponibilidad.Modify('tiempo_reporte.visible = 1') 
			dw_variacion_disponibilidad.Modify("tiempo_reporte.background.Color="+gs_blanco)
			dw_variacion_disponibilidad.Modify('tiempo_reporte.protect = 0') 
		else
			dw_variacion_disponibilidad.Modify('disponibilidad_act.protect = 0') 
			dw_variacion_disponibilidad.Modify("disponibilidad_act.background.Color="+gs_blanco)
			dw_variacion_disponibilidad.object.tiempo_reporte_t.visible = 0	
			dw_variacion_disponibilidad.Modify('tiempo_reporte.visible = 0') 
			dw_variacion_disponibilidad.Modify("tiempo_reporte.background.Color="+gs_gris)
			dw_variacion_disponibilidad.Modify('tiempo_reporte.protect = 1') 
		end if
		
		dw_variacion_disponibilidad.object.tiempo_instruccion[1] = ldt_null
		dw_variacion_disponibilidad.Modify('tiempo_instruccion.protect = 0') 
		dw_variacion_disponibilidad.Modify("tiempo_instruccion.background.Color="+gs_blanco)	

	end if
end if


end subroutine

public subroutine fw_finalizar_modificacion_disponibilidad ();
long ll_status
string ls_mensaje

if ib_modificando_disponibilidad = true then 
	
	ib_modificando_disponibilidad = false
	
	ll_status = gu_rf_servidor_operacion.of_desbloquea("SGD_DISPONIBILIDAD", il_nro_instalacion, ls_mensaje)
	if ll_status = 0 and ls_mensaje <> 'Error. Disponibilidad no bloqueada' then 
		messagebox("", ls_mensaje, Exclamation!, ok!)
	end if
	
	dw_variacion_disponibilidad.Modify('disponibilida_act.protect = 1') 
	dw_variacion_disponibilidad.Modify("disponibilida_act.background.Color="+gs_gris)

	dw_variacion_disponibilidad.Modify('tiempo_ocurrencia.protect = 1') 
	dw_variacion_disponibilidad.Modify("tiempo_ocurrencia.background.Color="+gs_gris)

	dw_variacion_disponibilidad.Modify('tiempo_reporte.protect = 1') 
	dw_variacion_disponibilidad.Modify("tiempo_reporte.background.Color="+gs_gris)

	dw_variacion_disponibilidad.Modify('tiempo_instruccion.protect = 1') 
	dw_variacion_disponibilidad.Modify("tiempo_instruccion.background.Color="+gs_gris)

	dw_variacion_disponibilidad.Modify('demora_justificada.protect = 1') 
	dw_variacion_disponibilidad.Modify('descripcion_demora.protect = 1') 
	dw_variacion_disponibilidad.Modify("descripcion_demora.background.Color="+gs_gris)
	
	dw_variacion_disponibilidad.Modify('consignacion_nac_check.protect = 1') 
	dw_variacion_disponibilidad.Modify('consignacion_nacional.protect = 1') 
	dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_gris)
	
	dw_variacion_disponibilidad.Modify('tipo_psm.protect = 1') 
	dw_variacion_disponibilidad.Modify("tipo_psm.background.Color="+gs_gris)
	
	dw_variacion_disponibilidad.Modify('observaciones.protect = 1') 
	dw_variacion_disponibilidad.Modify("observaciones.background.Color="+gs_gris)
	
	
	//dw_variacion_disponibilidad.object.causa_t.enabled = false	
		
end if


end subroutine

public function string uf_get_itemstatus (dwitemstatus pdwis_indisponibilidad);
string 	ls_auxiliar

choose case pdwis_indisponibilidad
	case notmodified!
		ls_auxiliar = "NotModified"
	case datamodified!
		ls_auxiliar = "DataModified"
	case new!
		ls_auxiliar = "New"
	case newmodified!
		ls_auxiliar = "NewModified"
end choose

return ls_auxiliar
		
end function

public subroutine uf_set_estructura_causa (long pl_cod_causa);long ll_gpo_causa, ll_tipo, ll_subtipo, ll_activo, ll_tipo_movimiento
string ls_causa_categoria, ls_causa
long ll_null
datetime ldt_auxiliar
setnull(ll_null)

SELECT GPO_CAUSA, TIPO, SUBTIPO, ACTIVO
  INTO :ll_gpo_causa, :ll_tipo, :ll_subtipo, :ll_activo
  FROM GI_CAUSA
 WHERE COD_CAUSA = :pl_cod_causa;

SELECT DESCRIPCION 
  INTO :ls_causa_categoria
  FROM GI_SUBTIPO_CAUSA
 WHERE GPO_CAUSA = :ll_gpo_causa
   AND SUBTIPO =:ll_subtipo
	AND TIPO = :ll_tipo
   AND ACTIVO = :ll_activo;
	
SELECT DESCRIPCION, IND_CHEQUEAR_CONSIGNACION, IND_CHEQUEAR_CAUSANTE, IND_CHEQUEAR_F_INSTRUCCION
  INTO :ls_causa, :ii_chequear_consignacion, :ii_chequear_activo_causante, :ii_chequear_f_instruccion
  FROM GI_SUBTIPOS
 WHERE SUBTIPO =:ll_subtipo
	AND TIPO = :ll_tipo
   AND ACTIVO = :ll_activo;
	
	

dw_variacion_disponibilidad.object.cod_causa[1] = pl_cod_causa 
dw_variacion_disponibilidad.object.familia_causa_t.Text = ls_causa
dw_variacion_disponibilidad.object.categoria_causa_t.Text = ls_causa_categoria


if ii_chequear_consignacion = 1 then 
	dw_variacion_disponibilidad.Object.gb_consignacion_nacional.visible = 1
	dw_variacion_disponibilidad.Object.consignacion_nacional_t.visible = 1	
	dw_variacion_disponibilidad.Object.consignacion_nacional.visible = 1
	dw_variacion_disponibilidad.Object.tipo_psm_t.visible = 1
	dw_variacion_disponibilidad.Object.tipo_psm.visible = 1
else
	dw_variacion_disponibilidad.Object.gb_consignacion_nacional.visible = 0
	dw_variacion_disponibilidad.Object.consignacion_nacional_t.visible = 0
	dw_variacion_disponibilidad.Object.consignacion_nacional.visible = 0
	dw_variacion_disponibilidad.Object.tipo_psm_t.visible = 0
	dw_variacion_disponibilidad.Object.tipo_psm.visible = 0
end if
	
if ii_chequear_activo_causante = 1 then 	
	dw_variacion_disponibilidad.Object.gb_activo_causante.visible = 1
	dw_variacion_disponibilidad.Object.activo_causante_t.visible = 1	
	dw_variacion_disponibilidad.Object.activo_causante.visible = 1
else
	dw_variacion_disponibilidad.Object.gb_activo_causante.visible = 0
	dw_variacion_disponibilidad.Object.activo_causante_t.visible = 0	
	dw_variacion_disponibilidad.Object.activo_causante.visible = 0
end if


if ii_tipo_movimiento <> 1 and  ii_tipo_movimiento <> 4 then
	//No es maniobra ni es tipo de tab
	ii_chequear_f_instruccion = 0 
end if
	
dw_variacion_disponibilidad.Object.tiempo_instruccion.visible = ii_chequear_f_instruccion
dw_variacion_disponibilidad.Object.tiempo_instruccion_t.visible = ii_chequear_f_instruccion

if ii_chequear_f_instruccion = 0 then 
	setnull(ldt_auxiliar)
	dw_variacion_disponibilidad.object.tiempo_instruccion[1] = ldt_auxiliar
end if
	
	
end subroutine

public subroutine uf_proteger_consignacion (boolean pb_proteger);long ll_auxiliar

setnull(ll_auxiliar) 
if pb_proteger = true then 
	
	dw_variacion_disponibilidad.object.consignacion_nac_check[1] = 0	
	dw_variacion_disponibilidad.object.consignacion_nacional[1] = ''
	dw_variacion_disponibilidad.object.tipo_psm[1] = -1
	
	dw_variacion_disponibilidad.Modify("consignacion_nac_check.protect=1")
	dw_variacion_disponibilidad.Modify("consignacion_nacional.protect=1")
	dw_variacion_disponibilidad.Modify("tipo_psm.protect=1")
	
	dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_gris)	
	dw_variacion_disponibilidad.Modify("tipo_psm.background.Color="+gs_gris)	
	
else
	
	dw_variacion_disponibilidad.object.consignacion_nac_check[1] = 1	
	dw_variacion_disponibilidad.object.tipo_psm[1] = 1
	
	dw_variacion_disponibilidad.Modify("consignacion_nac_check.protect=0")
	dw_variacion_disponibilidad.Modify("consignacion_nacional.protect=0")
	dw_variacion_disponibilidad.Modify("tipo_psm.protect=0")
	
	dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_blanco)	
	dw_variacion_disponibilidad.Modify("tipo_psm.background.Color="+gs_blanco)	
	
end if
	

end subroutine

public function boolean uf_verify_consignacion ();


// Para las causas (familia de causas ser$$HEX1$$ed00$$ENDHEX$$a m$$HEX1$$e100$$ENDHEX$$s correcto) MANTENIMIENTO, MANTENIMIENTO MAYOR y EXPANSI$$HEX1$$d300$$ENDHEX$$N 
// debe verificarse que los campos consignacion_nacional, psm y descripcion_demora est$$HEX1$$e100$$ENDHEX$$n rellenos

boolean lb_return = true
string ls_texto_error, ls_consignacion



if ii_chequear_consignacion = 1 then 

	ls_texto_error = dw_variacion_disponibilidad.object.familia_causa_t.text

	if isnull(dw_variacion_disponibilidad.object.consignacion_nacional[1]) or dw_variacion_disponibilidad.object.consignacion_nacional[1] = ''  then
		ls_texto_error = "Se exige rellenar la consignaci$$HEX1$$f300$$ENDHEX$$n."
		lb_return = false
	else
		ls_consignacion = dw_variacion_disponibilidad.object.consignacion_nacional[1]
		if len(ls_consignacion) <> 8 then 
			ls_texto_error = 'El campo consignaci$$HEX1$$f300$$ENDHEX$$n debe tener 8 caracteres.'
			lb_return = false
		end if
	end if	
	
	if isnull(dw_variacion_disponibilidad.object.tipo_psm[1]) or  (dw_variacion_disponibilidad.object.tipo_psm[1] = -1 )then
		ls_texto_error = "Se exige rellenar el campo PSM."
		lb_return = false
	end if
	
	if isnull(dw_variacion_disponibilidad.object.observaciones[1]) or dw_variacion_disponibilidad.object.observaciones[1] = ''  then
		ls_texto_error = "Se exige rellenar el campo observaciones."
		lb_return = false
	end if

end if

if lb_return = false then 
	Messagebox("Cambio de operatividad", ls_texto_error, Exclamation!, OK!)
end if

return lb_return


end function

public function boolean uf_verify_tipo_trafo (long pl_cod_activo);
string ls_tipo_activo

SELECT trim(TIPO_ACTIVO)
  INTO :ls_tipo_activo
  FROM SGD_INSTALACION_AT
 WHERE NRO_INSTALACION = :pl_cod_activo;
 
//Si es trafo podr$$HEX2$$e1002000$$ENDHEX$$elegirse el cambio de TAP.

if ls_tipo_activo = '3' then 
	
	ddlb_operatividad.InsertItem('Cambio de TAP', 3)

end if
	
	
return true
end function

public subroutine uf_verify_activo (long pl_nro_instalacion);
long ll_rows

SELECT Count(*)
  INTO :ll_rows
  FROM SGD_INSTALACION_AT
 WHERE NRO_INSTALACION = :pl_nro_instalacion;
 
 
 if ll_rows <= 0 then 
	dw_variacion_disponibilidad.Modify("disponibilidad_act.protect=1")
	dw_variacion_disponibilidad.Modify("disponibilidad_act.background.Color="+gs_gris)		
else
	uf_verify_tipo_trafo(il_nro_instalacion)
end if


end subroutine

public subroutine fw_inicializar_activo ();

uo_activos.fw_select_fila(1)
uo_activos.TriggerEvent("ue_clicked")
end subroutine

public function boolean uf_verify_operatividad ();




boolean lb_return = true
int li_tipo_movimiento

li_tipo_movimiento = dw_variacion_disponibilidad.object.tipo_movimiento[1]

if li_tipo_movimiento = 5 then 
	//Si es un cambio de estado debe seleccionarse la causa y el activo causante

//	if isnull (dw_variacion_disponibilidad.object.cod_causa[1]) then 
//		messagebox("Cambio de operatividad", "No se ha seleccionado ninguna causa. No se grabar$$HEX1$$e100$$ENDHEX$$n las modificaciones.", Exclamation!, OK!)
//		lb_return = false
//	end if
	
	if ii_chequear_activo_causante = 1 and isnull (dw_variacion_disponibilidad.object.activo_causante[1]) then 
		messagebox("Cambio de operatividad", "Debe seleccionar el activo causante.", Exclamation!, OK!)
		lb_return = false
	end if

end if

return lb_return

end function

public subroutine uf_visualizar_campos (boolean pb_visualizar);
if ii_chequear_consignacion = 1 then 
	dw_variacion_disponibilidad.Object.gb_consignacion_nacional.visible = 1
	dw_variacion_disponibilidad.Object.consignacion_nacional_t.visible = 1	
	dw_variacion_disponibilidad.Object.consignacion_nacional.visible = 1
	dw_variacion_disponibilidad.Object.tipo_psm_t.visible = 1
	dw_variacion_disponibilidad.Object.tipo_psm.visible = 1
else
	dw_variacion_disponibilidad.Object.gb_consignacion_nacional.visible = 1
	dw_variacion_disponibilidad.Object.consignacion_nacional_t.visible = 1	
	dw_variacion_disponibilidad.Object.consignacion_nacional.visible = 1
	dw_variacion_disponibilidad.Object.tipo_psm_t.visible = 1
	dw_variacion_disponibilidad.Object.tipo_psm.visible = 1	
end if
	
if ii_chequear_activo_causante = 1 then 	
	dw_variacion_disponibilidad.Object.gb_activo_causante.visible = 1
	dw_variacion_disponibilidad.Object.activo_causante_t.visible = 1	
	dw_variacion_disponibilidad.Object.activo_causante.visible = 1
else
	dw_variacion_disponibilidad.Object.gb_activo_causante.visible = 0
	dw_variacion_disponibilidad.Object.activo_causante_t.visible = 0	
	dw_variacion_disponibilidad.Object.activo_causante.visible = 0
end if

	


end subroutine

public function boolean uf_verify_campos ();
boolean lb_return = true
int 	  li_auxiliar

//Verificar disponibilidad del activo
if isnull(dw_variacion_disponibilidad.object.cod_causa[1])  then 
	MessageBox("Cambio de operatividad", "Debe seleccionar una causa", Exclamation!, OK!)
	lb_return = false
else

	lb_return = uf_verify_disponibilidad()
	
	if lb_return then 
		lb_return = uf_verify_fechas()
		
		if lb_return then 
			if lb_return then 	
				lb_return = uf_verify_consignacion()
				
				if lb_return then 
					
					lb_return = uf_verify_operatividad()
						
					if lb_return  then 
						
						lb_return = uf_verify_textos()			
					end if
				end if
			end if	
		end if
	end if
end if

return lb_return
end function

public function boolean uf_verify_textos ();
long ll_auxiliar
boolean lb_status = true
string ls_texto

if  isnull(dw_variacion_disponibilidad.object.observaciones[1]) then 
	Messagebox("Cambio de operatividad", "El campo de observaciones no debe ser nulo", Exclamation!, Ok!)
	lb_status = false	
else
	ls_texto = dw_variacion_disponibilidad.object.observaciones[1]
	ll_auxiliar = gf_verify_texto_sin_comas(ls_texto)
	if ll_auxiliar > 0 then 
		lb_status = false
	end if
end if



return lb_status
end function

public function boolean uf_verify_fechas ();// Para las causas (familia de causas ser$$HEX1$$ed00$$ENDHEX$$a m$$HEX1$$e100$$ENDHEX$$s correcto) MANTENIMIENTO, MANTENIMIENTO MAYOR y EXPANSI$$HEX1$$d300$$ENDHEX$$N 
// debe verificarse que los campos consignacion_nacional, psm y descripcion_demora est$$HEX1$$e100$$ENDHEX$$n rellenos

boolean lb_return = true
DECIMAL{2} ldec_dias
datetime ldt_fecha_nula,  ldt_fecha_auxiliar, ldt_fecha_actual
long ll_tipo_reporte

ldt_fecha_actual = datetime(today(), now())

ldt_fecha_nula = datetime(date('2000-01-01'))


dw_variacion_disponibilidad.AcceptText()

//Verificamos las fechas.
if isnull(dw_variacion_disponibilidad.object.tiempo_ocurrencia[1] ) then
	Messagebox("Cambio de operatividad", "El tiempo de ocurrencia no debe ser nulo", Exclamation!, OK!)
	lb_return = false
	return lb_return
end if

ldt_fecha_auxiliar = dw_variacion_disponibilidad.object.tiempo_ocurrencia[1]



if ldt_fecha_auxiliar > ldt_fecha_actual then 
	Messagebox("Cambio de operatividad", "El tiempo de ocurrencia no debe superar la fecha actual", Exclamation!, OK!)
	lb_return = false
	return lb_return
end if


//Para cambios de tap hay que chequear el tiempo de reporte.
if dw_variacion_disponibilidad.object.tipo_movimiento[1]  = 4 then
	
	if isnull(dw_variacion_disponibilidad.object.tiempo_reporte[1] )  then
		Messagebox("Cambio de operatividad", "El tiempo de reporte no debe ser nulo", Exclamation!, OK!)
		lb_return = false
		return lb_return
	end if 
	
	if dw_variacion_disponibilidad.object.tiempo_reporte[1] <   dw_variacion_disponibilidad.object.tiempo_ocurrencia[1] then
		lb_return = false
		
		messagebox("Cambio de operatividad", "El tiempo de reporte debe ser posterior al de ocurrencia", Exclamation!, OK!)
		return lb_return
	end if
	
	ldt_fecha_auxiliar = dw_variacion_disponibilidad.object.tiempo_reporte[1]

	if ldt_fecha_auxiliar > ldt_fecha_actual then 
		Messagebox("Cambio de operatividad", "El tiempo de reporte no debe superar la fecha actual", Exclamation!, OK!)
		lb_return = false
		return lb_return
	end if
		
end if


if ii_chequear_f_instruccion = 1 then 
		 
	if isnull(dw_variacion_disponibilidad.object.tiempo_instruccion[1])  then 
		messagebox("", "El tiempo de instrucci$$HEX1$$f300$$ENDHEX$$n no debe ser nulo", Exclamation!, OK!)
	   lb_return = false		
		return false
	end if
	
	if dw_variacion_disponibilidad.object.tiempo_instruccion[1] >  dw_variacion_disponibilidad.object.tiempo_ocurrencia[1] then 
		messagebox("", "El tiempo de instrucci$$HEX1$$f300$$ENDHEX$$n no debe superar el tiempo de ocurrencia.", Exclamation!, OK!)
	   lb_return = false		
		return false
		
	end if

end if


return lb_return



end function

public function boolean uf_verify_disponibilidad ();




boolean lb_return = true
long ll_disponibilidad
int li_tipo_movimiento

ll_disponibilidad = dw_variacion_disponibilidad.object.disponibilidad_act[1]
		
li_tipo_movimiento = dw_variacion_disponibilidad.object.tipo_movimiento[1]

if ( (li_tipo_movimiento = 3) and (il_virgin_disponibilidad = ll_disponibilidad) ) then 
	// Si estamos ante un cambio de disponibilidad debe verificarse que se modifica la disponibilidad
	messagebox("Cambio de operatividad", "El valor de la disponibilidad del activo no ha variado. No se grabar$$HEX1$$e100$$ENDHEX$$n las modificaciones.", Exclamation!, OK!)
	lb_return = false
end if

return lb_return

end function

public function boolean fw_grabar_indisponibilidad ();
boolean lb_status = true
long ll_nro_incidencia, ll_nro_instalacion
long ll_tipo_movimiento, ll_cod_causa, ll_disponibilidad_act
long ll_tipo_psm, ll_activo_causante, ll_demora_justificada, ll_consignacion_nacional_check
long ll_cod_causa_m_c
datetime ldt_fecha_ocurrencia, ldt_f_alta, ldt_f_actual, ldt_f_reposicion, ldt_tiempo_reporte
string ls_observaciones, ls_descripcion_demora, ls_consignacion_nacional, ls_retorno
integer li_lock_status


		
	//Se comprueba que el cierre de la indisponibilidad no est$$HEX2$$e1002000$$ENDHEX$$activo. 
	
	
	SELECT F_ALTA, COD_CAUSA_M_C, nvl(NRO_INCIDENCIA, 0)
	  INTO :ldt_f_alta, :ll_cod_causa_m_c, :il_nro_incidencia
	  FROM SGD_INDISPONIBILIDAD
	 WHERE NRO_INSTALACION = :il_nro_instalacion
	   AND F_REPOSICION IS NULL;
	
	IF il_nro_incidencia <> 0  THEN 
		
		li_lock_status=gnu_u_transaction.uf_lock(this, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(il_nro_incidencia), fgci_bloqueo_incidencia, il_nro_incidencia)
		ib_desbloquear_indisponibilidad = true	
		
		IF li_lock_status = -1 or  li_lock_status = -54 THEN
			
			Messagebox("Cambio de operatividad", "No ha sido posible actualizar la indisponibilidad asociada a este activo. La incidencia est$$HEX2$$e1002000$$ENDHEX$$bloqueada", Exclamation!, OK!)
			lb_status = false
			gnu_u_transaction.uf_rollback(this,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(il_nro_incidencia), fgci_bloqueo_incidencia, il_nro_incidencia)
			ib_desbloquear_indisponibilidad = false
		ELSE	
			ll_cod_causa = dw_variacion_disponibilidad.object.cod_causa[1]
			ldt_fecha_ocurrencia = dw_variacion_disponibilidad.object.tiempo_ocurrencia[1]
			ls_observaciones = dw_variacion_disponibilidad.object.observaciones[1]
			ll_disponibilidad_act = dw_variacion_disponibilidad.object.disponibilidad_act[1]
			
			if isnull (dw_variacion_disponibilidad.object.tipo_psm[1]) then 
				setnull(ll_tipo_psm)
			else
				ll_tipo_psm = dw_variacion_disponibilidad.object.tipo_psm[1]
			end if
			
			if isnull (dw_variacion_disponibilidad.object.activo_causante[1]) then 
				setnull(ll_activo_causante)
			else
				ll_activo_causante = dw_variacion_disponibilidad.object.activo_causante[1]
			end if
			
			if NOT isnull (dw_variacion_disponibilidad.object.consignacion_nacional[1]) then 				
				ls_consignacion_nacional = dw_variacion_disponibilidad.object.consignacion_nacional[1]
			end if
			
			if NOT isnull (dw_variacion_disponibilidad.object.consignacion_nac_check[1]) then 				
				ll_consignacion_nacional_check = dw_variacion_disponibilidad.object.consignacion_nac_check[1]
			end if
			
			if NOT isnull (dw_variacion_disponibilidad.object.demora_justificada[1]) then 				
				ll_demora_justificada = dw_variacion_disponibilidad.object.demora_justificada[1]
			end if
			
			if NOT isnull (dw_variacion_disponibilidad.object.descripcion_demora[1]) then 				
				ls_descripcion_demora = dw_variacion_disponibilidad.object.descripcion_demora[1]
			end if
			
			ldt_tiempo_reporte = datetime(today(), now())
			dw_variacion_disponibilidad.object.tiempo_reporte[1] = datetime(today(), now())
			
			UPDATE SGD_INDISPONIBILIDAD
				SET TIPO_REPORTE_M_C = 5,	
					 TIEMPO_REPORTE = :ldt_tiempo_reporte,
					 COD_CAUSA_M_C = :ll_cod_causa,
					 F_REPOSICION = :ldt_fecha_ocurrencia,
					 OBSERVACIONES_M_C = :ls_observaciones,
					 DISPONIBILIDAD_ACT_M_C = :ll_disponibilidad_act, 
					 CI_ACTIVO_CAUSANTE_M_C = :ll_activo_causante,
					 CM_ACTIVO_CAUSANTE_M_C = 5555,
					 CONSIGNACION_NAC_CHECK_M_C = :ll_consignacion_nacional_check,
					 CONSIGNACION_NACIONAL_M_C= :ls_consignacion_nacional,
					 PSM_M_C = :ll_tipo_psm					 
			 WHERE NRO_INSTALACION = :il_nro_instalacion
				AND F_ALTA = :ldt_f_alta;
			
			
			if gu_rf_servidor_operacion.of_resuelve_indisponibilidad (il_nro_instalacion, ls_retorno) = 0 then
				messagebox("Atencion",ls_retorno,Exclamation!,ok!)
				
				lb_status = false
			end if
				
			END IF
	END IF

if lb_status then 
	dw_variacion_disponibilidad.object.ind_maniobra[1] = 1
end if

return lb_status	







// "SGD_DISPONIBILIDAD"."COD_CAUSA",   
//         "SGD_DISPONIBILIDAD"."FAM_CAUSA",   
//         "SGD_DISPONIBILIDAD"."NRO_INSTALACION",   
//         "SGD_DISPONIBILIDAD"."TIEMPO_OCURRENCIA",   
//         "SGD_DISPONIBILIDAD"."DISPONIBILIDAD_ACT",   
//         "SGD_DISPONIBILIDAD"."CONSIGNACION_NACIONAL",   
//         "SGD_DISPONIBILIDAD"."DEMORA_JUSTIFICADA",   
//         "SGD_DISPONIBILIDAD"."DESCRIPCION_DEMORA",   
//         "SGD_DISPONIBILIDAD"."CONSIGNACION_NAC_CHECK",   
//         "SGD_DISPONIBILIDAD"."SUBTIPO_CAUSA",   
//         "SGD_DISPONIBILIDAD"."OBSERVACIONES",   
//         "SGD_DISPONIBILIDAD"."TIPO_PSM",   
//         "SGD_DISPONIBILIDAD"."IND_MANIOBRA",   
//         "SGD_DISPONIBILIDAD"."TIPO_MOVIMIENTO",   
//         "SGD_DISPONIBILIDAD"."NOMBRE",   
//         0 AS CABECERA,   
//         "SGD_DISPONIBILIDAD"."ESTADO_OPERATIVIDAD",   
//         "SGD_DISPONIBILIDAD"."ACTIVO_CAUSANTE",   
//         "SGD_DISPONIBILIDAD"."TIEMPO_REPORTE",   
//         "SGD_DISPONIBILIDAD"."TIEMPO_INSTRUCCION" 
end function

on w_disponibilidad_activo.create
if this.MenuName = "m_disponibilidades" then this.MenuID = create m_disponibilidades
this.st_cambio_operatividad=create st_cambio_operatividad
this.ddlb_operatividad=create ddlb_operatividad
this.uo_activos=create uo_activos
this.st_instalacion_sel=create st_instalacion_sel
this.dw_historico_disponibilidad=create dw_historico_disponibilidad
this.gb_hist_disp=create gb_hist_disp
this.dw_variacion_disponibilidad=create dw_variacion_disponibilidad
this.gb_variacion_disp=create gb_variacion_disp
this.Control[]={this.st_cambio_operatividad,&
this.ddlb_operatividad,&
this.uo_activos,&
this.st_instalacion_sel,&
this.dw_historico_disponibilidad,&
this.gb_hist_disp,&
this.dw_variacion_disponibilidad,&
this.gb_variacion_disp}
end on

on w_disponibilidad_activo.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_cambio_operatividad)
destroy(this.ddlb_operatividad)
destroy(this.uo_activos)
destroy(this.st_instalacion_sel)
destroy(this.dw_historico_disponibilidad)
destroy(this.gb_hist_disp)
destroy(this.dw_variacion_disponibilidad)
destroy(this.gb_variacion_disp)
end on

event open;

il_modificado = 0

fw_inicializar_activo()

end event

event closequery;long ll_status

dwItemStatus ldwis_variacion_disponibilidad

ldwis_variacion_disponibilidad = dw_variacion_disponibilidad.GetItemStatus(1, 0, Primary!)

if ib_modificando_disponibilidad then 
	ll_status = messagebox("", "Ha habido cambios en la disponibilidad. $$HEX1$$bf00$$ENDHEX$$Desea salvarlos?", Exclamation!, YesNo!)
		
	if ll_status = 1 then 	
		ll_status = fw_grabar_disponibilidad()
	else 
		fw_finalizar_modificacion_disponibilidad()
	end if
end if


end event

type st_cambio_operatividad from statictext within w_disponibilidad_activo
integer x = 1719
integer y = 88
integer width = 809
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 8388608
long backcolor = 67108864
string text = "CAMBIO DE OPERATIVIDAD"
boolean focusrectangle = false
end type

type ddlb_operatividad from dropdownlistbox within w_disponibilidad_activo
integer x = 2619
integer y = 80
integer width = 805
integer height = 288
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
boolean vscrollbar = true
string item[] = {"Cambio de disponibilidad","Cambio de estado","Cambio de TAP",""}
borderstyle borderstyle = styleraised!
end type

event selectionchanged;
string ls_operatividad
int 	 li_estado_operativo

ls_operatividad = this.text
this.enabled = false
this.visible = false
st_cambio_operatividad.visible = false

dw_variacion_disponibilidad.enabled = true

CHOOSE CASE ls_operatividad
	
	CASE 'Cambio de disponibilidad'
		dw_variacion_disponibilidad.object.tipo_movimiento[1] = 3
	
	CASE 'Cambio de estado'
		dw_variacion_disponibilidad.object.tipo_movimiento[1] = 5		
		if ii_virgin_estado_operatividad = 1 then 
			dw_variacion_disponibilidad.object.estado_operatividad[1] = 0
		else
			dw_variacion_disponibilidad.object.estado_operatividad[1] = 1			
		end if
		
	CASE 'Cambio de TAP'
		dw_variacion_disponibilidad.object.tipo_movimiento[1] = 4

END CHOOSE

ii_tipo_movimiento = dw_variacion_disponibilidad.object.tipo_movimiento[1]
			
if ib_modificando_disponibilidad = false then 
	il_registro_modificado = uo_activos.uf_get_fila_seleccionada()
	fw_iniciar_modificacion_disponibilidad()
end if



this.SetRedraw(True)
end event

type uo_activos from u_activos within w_disponibilidad_activo
event destroy ( )
integer width = 1541
integer height = 1784
integer taborder = 40
boolean border = true
end type

on uo_activos.destroy
call u_activos::destroy
end on

event ue_clicked;call super::ue_clicked;


long ll_nro_instalacion, ll_null, ll_status= 0, ll_cod_causa
string ls_nombre_instalacion
int  li_grabacion_correcta = 0
int  li_disponibilidad
dwItemStatus ldwis_variacion_disponibilidad
string ls_dwItemStatus

ldwis_variacion_disponibilidad = dw_variacion_disponibilidad.GetItemStatus(1,0, Primary!)
ls_dwItemStatus = uf_get_itemstatus(ldwis_variacion_disponibilidad)

setnull(ll_null)

//if not(ldwis_variacion_disponibilidad = notmodified!) then 	
if ib_modificando_disponibilidad	 then 	
	ll_status = messagebox("", "Ha habido cambios en la disponibilidad. $$HEX1$$bf00$$ENDHEX$$Desea salvarlos?", Exclamation!, YesNo!)
		
	if ll_status = 1 then 	
		li_grabacion_correcta = fw_grabar_disponibilidad()
	else 
		fw_finalizar_modificacion_disponibilidad()
	end if	
end if

if li_grabacion_correcta = 0 then 
	parent.SetRedraw(False)
	
	ddlb_operatividad.Visible = true
	ddlb_operatividad.Enabled = true
	ddlb_operatividad.Text = ''
	ddlb_operatividad.Clear()
	ddlb_operatividad.Reset()
	ddlb_operatividad.InsertItem('Cambio de disponibilidad', 1)
	ddlb_operatividad.InsertItem('Cambio de estado', 2)
	st_cambio_operatividad.visible = TRUE
	
	il_nro_instalacion = uf_get_nro_instalacion()
	ls_nombre_instalacion = uf_get_nombre_instalacion()

	st_instalacion_sel.text = ls_nombre_instalacion
	
	dw_variacion_disponibilidad.Reset()
	dw_variacion_disponibilidad.Retrieve(il_nro_instalacion)
	
	ii_tipo_movimiento = dw_variacion_disponibilidad.object.tipo_movimiento[1]
	
	ll_cod_causa = dw_variacion_disponibilidad.object.cod_causa[1]
	uf_set_estructura_causa(ll_cod_causa)

	dw_variacion_disponibilidad.object.tipo_movimiento[1] = ll_null
	
	ii_virgin_estado_operatividad = dw_variacion_disponibilidad.object.estado_operatividad[1]
		
	dw_historico_disponibilidad.Reset()
	dw_historico_disponibilidad.Retrieve(il_nro_instalacion)
	
	uf_verify_tipo_trafo(il_nro_instalacion)
	
	parent.SetRedraw(True)
end if
	


end event

type st_instalacion_sel from statictext within w_disponibilidad_activo
integer x = 2295
integer y = 4
integer width = 1029
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_historico_disponibilidad from datawindow within w_disponibilidad_activo
integer x = 1618
integer y = 1332
integer width = 1874
integer height = 428
integer taborder = 80
string title = "none"
string dataobject = "d_historico_disponibilidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;
datawindowchild ldwc_causa, ldwc_tipo_psm

this.SetTransObject(SQLCA)

this.GetChild("cod_causa", ldwc_causa)
ldwc_causa.SetTransObject(SQLCA)
ldwc_causa.Retrieve()

this.GetChild("cod_causa", ldwc_tipo_psm)
ldwc_tipo_psm.SetTransObject(SQLCA)
ldwc_tipo_psm.Retrieve()


end event

event clicked;
long ll_fila_actual, ll_secuencial

IF row > 0 then 

	ll_fila_actual = row
	
	
	if ll_fila_actual <> il_row_historico then 
		dw_historico_disponibilidad.SelectRow(il_row_historico, false)
		dw_historico_disponibilidad.SelectRow(ll_fila_actual, true)
		il_row_historico = ll_fila_actual
	end if

	gu_comunic2 = create u_generico_comunicaciones
	gu_comunic2.is_comunic.longval4 = il_nro_instalacion
		
	ll_secuencial = dw_historico_disponibilidad.object.secuencial[row]
	OpenWithParm(w_disponibilidad_activo_historico_resp, ll_secuencial)
	
	dw_historico_disponibilidad.SetRedraw(False)
	dw_historico_disponibilidad.Reset()
	dw_historico_disponibilidad.Retrieve(il_nro_instalacion)
	dw_historico_disponibilidad.SelectRow(il_row_historico, true)
	dw_historico_disponibilidad.SetRedraw(True)
	
		
end if		


end event

type gb_hist_disp from groupbox within w_disponibilidad_activo
integer x = 1568
integer y = 1264
integer width = 1979
integer height = 520
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Hist$$HEX1$$f300$$ENDHEX$$rico de la Operatividad"
end type

type dw_variacion_disponibilidad from datawindow within w_disponibilidad_activo
integer x = 1618
integer y = 68
integer width = 1874
integer height = 1168
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "d_variacion_disponibilidad"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;string ls_naturaleza, ls_nombre
int li_tipo_movimiento
long ll_nro_instalacion


if dwo.name = "causa_t" then
	
	if ib_modificando_disponibilidad = true then
		gu_comunic2 = create u_generico_comunicaciones
			
		If fg_verifica_parametro('CAUSAS') Then
						
			li_tipo_movimiento = dw_variacion_disponibilidad.object.tipo_movimiento[1] 
		
			CHOOSE CASE li_tipo_movimiento
				CASE 3
					gu_comunic2.is_comunic.strval9 = 'CAMBIO DE DISPONIBILIDAD'
						
				CASE 4
					gu_comunic2.is_comunic.strval9 = 'MANIOBRA'
					
				CASE 5
					if ii_virgin_estado_operatividad = 1 then 
						//Originalmente est$$HEX2$$e1002000$$ENDHEX$$operativo. Luego el estado actual es NO OPERATIVO
						gu_comunic2.is_comunic.strval9 = 'ESTADO NO OPERATIVO'
					else
						gu_comunic2.is_comunic.strval9 = 'ESTADO OPERATIVO'
					end if
			END CHOOSE
			
			ls_naturaleza = gf_naturaleza_activo(il_nro_instalacion)

			if ls_naturaleza <> 'STR' then
				gu_comunic2.is_comunic.strval9 += ' STN'
			end if
			
			OpenWithParm(w_2301_sel_causa_x_tipo, 1)
		Else
				Open(w_2301_sel_causa)
		End If
			
		if gu_comunic2.is_comunic.longval4 > 0 then	
			dw_variacion_disponibilidad.setitem(1,"cod_causa",gu_comunic2.is_comunic.longval4)
			dw_variacion_disponibilidad.setitem(1,"subtipo_causa",gu_comunic2.is_comunic.longval5)
			uf_set_estructura_causa(gu_comunic2.is_comunic.longval4)
			il_modificado = 1
			yield()
		end if
		
		this.AcceptText()
	end if
end if

if dwo.name = "activo_causante_t" and  ib_modificando_disponibilidad = true  then
	
	open(w_seleccion_activo)
	
	ll_nro_instalacion = Message.DoubleParm
	
	if not isnull(ll_nro_instalacion) AND ll_nro_instalacion >= 0 then 
		dw_variacion_disponibilidad.object.activo_causante[1] = ll_nro_instalacion	
	end if
end if
end event

event itemchanged;
string ls_auxiliar
long   ll_auxiliar

setnull(ls_auxiliar)
setnull(ll_auxiliar)

this.AcceptText()


// Si est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Demora justificada maniobra' se habilita 
// el campo 'Descripci$$HEX1$$f300$$ENDHEX$$n demora justificada maniobra'
if dwo.name = "demora_justificada" then	
	if dw_variacion_disponibilidad.GetItemNumber(1,'demora_justificada') = 0 then	
		this.Modify("descripcion_demora.protect=0")
		this.Modify("descripcion_demora.background.Color="+gs_blanco)		
	else
		this.Modify("descripcion_demora.protect=1")
		this.Modify("descripcion_demora.background.Color="+gs_gris)			
	end if
end if


// Si est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Consignaci$$HEX1$$f300$$ENDHEX$$n Nacional' se habilitan 
// los campos 'N$$HEX1$$fa00$$ENDHEX$$mero', 'PSM' y 'Por fuera de PSM'
if dwo.name = "consignacion_nac_check" then	
	if dw_variacion_disponibilidad.GetItemNumber(1,'consignacion_nac_check') = 0 then			
		dw_variacion_disponibilidad.Modify("consignacion_nacional.protect=0")
		dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_blanco)
		
		dw_variacion_disponibilidad.Modify("tipo_psm.protect=0")
		
		dw_variacion_disponibilidad.object.tipo_psm[1] = 0
		
	else		
		dw_variacion_disponibilidad.Modify("consignacion_nacional.protect=1")
		dw_variacion_disponibilidad.Modify("consignacion_nacional.background.Color="+gs_gris)	

		dw_variacion_disponibilidad.Modify("tipo_psm.protect=1")
		setnull(ll_auxiliar)
		dw_variacion_disponibilidad.object.tipo_psm[1] = ll_auxiliar
		
	end if
end if



end event

event editchanged;this.accepttext()
end event

event constructor;
datawindowchild ldddw_causa, ldddw_activo

this.SetTransObject(SQLCA)

DataWindowChild ldw_child
this.GetChild ('cod_causa', ldddw_causa)
ldddw_causa.SetTransObject (SQLCA)
ldddw_causa.Retrieve()

this.GetChild('activo_causante', ldddw_activo)
ldddw_activo.SetTransObject(SQLCA)
ldddw_activo.Retrieve()
end event

event losefocus;this.accepttext()
end event

event doubleclicked;
string ls_cabecera

if dwo.name = "cabecera" then
	
	ls_cabecera = 'Movimiento de Tap de posici$$HEX1$$f300$$ENDHEX$$n ... a posici$$HEX1$$f300$$ENDHEX$$n ...'
	
	dw_variacion_disponibilidad.object.observaciones[1] = ls_cabecera
end if
	
	
	
end event

type gb_variacion_disp from groupbox within w_disponibilidad_activo
integer x = 1568
integer y = 4
integer width = 1975
integer height = 1256
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "      Modificaci$$HEX1$$f300$$ENDHEX$$n del activo                                                 "
end type


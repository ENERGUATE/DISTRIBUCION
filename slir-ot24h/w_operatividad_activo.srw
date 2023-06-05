HA$PBExportHeader$w_operatividad_activo.srw
forward
global type w_operatividad_activo from window
end type
type uo_activos from u_activos within w_operatividad_activo
end type
type st_instalacion_sel from statictext within w_operatividad_activo
end type
type dw_variacion_operatividad from datawindow within w_operatividad_activo
end type
type gb_variacion_disp from groupbox within w_operatividad_activo
end type
end forward

global type w_operatividad_activo from window
integer width = 3584
integer height = 1992
boolean titlebar = true
string title = "OPEN SGI - No operatividades de activos"
string menuname = "m_no_operatividad"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_activos uo_activos
st_instalacion_sel st_instalacion_sel
dw_variacion_operatividad dw_variacion_operatividad
gb_variacion_disp gb_variacion_disp
end type
global w_operatividad_activo w_operatividad_activo

type variables

long il_nro_instalacion
boolean ib_modificando_operatividad = FALSE
long il_modificado = 0

long il_disponibilidad_alta_inicial, il_disponibilidad_baja_inicial
long il_disponibilidad
long il_operatividad

long il_registro_modificado
int  ii_chequear_consignacion
end variables

forward prototypes
public function integer fw_grabar_operatividad ()
public subroutine fw_iniciar_modificacion_operatividad ()
public subroutine fw_finalizar_modificacion_operatividad ()
public function string uf_get_itemstatus (dwitemstatus pdwis_indisponibilidad)
public function long uf_verify_textos ()
public subroutine uf_verify_activo (long pl_nro_instalacion)
public subroutine fw_inicializar_activo ()
public subroutine uf_set_estructura_causa_alta (long pl_cod_causa)
public subroutine uf_set_estructura_causa_baja (long pl_cod_causa)
public function integer fw_validacion_operatividad ()
public subroutine fw_inicializar_datos_operatividad ()
public function integer fw_grabar_disponibilidad ()
end prototypes

public function integer fw_grabar_operatividad ();int li_status, li_return = 0
long ll_status, ll_disponibilidad
string ls_texto
dwItemStatus ldwis_variacion_operatividad


int ll_auxiliar
boolean lb_auxiliar

dw_variacion_operatividad.AcceptText()

ll_auxiliar = dw_variacion_operatividad.object.nro_instalacion[1]

ldwis_variacion_operatividad = dw_variacion_operatividad.GetItemStatus(1,0, Primary!)
if not(ldwis_variacion_operatividad = notmodified!) then 	
				
	li_return = fw_validacion_operatividad()
	
	if li_return = 0 then 	
		
		fw_grabar_disponibilidad()
		
		dw_variacion_operatividad.object.usuario[1] = gs_usuario
		dw_variacion_operatividad.object.f_actual[1] = datetime(today(), now())
		dw_variacion_operatividad.object.programa[1] = 'SGI-Grabar'
		
		ll_status = dw_variacion_operatividad.Update()
		if ll_status = 1 then 
			li_return = 0
			commit;
			
			ldwis_variacion_operatividad = dw_variacion_operatividad.GetItemStatus(1,0, Primary!)
			
			fw_finalizar_modificacion_operatividad()
			
			//Actualizamos, dado el caso, la disponibilidad del registro en el objeto de activos.
			if not isnull( dw_variacion_operatividad.object.disponibilidad_act_alta[1]) then 
				ll_disponibilidad =  dw_variacion_operatividad.object.disponibilidad_act_alta[1]
			end if
			
			if not isnull( dw_variacion_operatividad.object.disponibilidad_act_baja[1]) then 
				ll_disponibilidad =  dw_variacion_operatividad.object.disponibilidad_act_baja[1]
			end if
			
			if not isnull(ll_disponibilidad) then
				if ll_disponibilidad <> il_disponibilidad then 
					uo_activos.uf_set_disponibilidad(ll_disponibilidad, il_registro_modificado)
					il_disponibilidad = ll_disponibilidad
				end if
			end if
			
			if isnull(dw_variacion_operatividad.object.f_baja[1]) then 
				il_operatividad = 1
			else
				il_operatividad = 0
			end if
			uo_activos.uf_set_operatividad(il_operatividad, il_registro_modificado)
						
			this.SetRedraw(False)
			dw_variacion_operatividad.Reset()
			dw_variacion_operatividad.Retrieve(il_nro_instalacion)
			fw_inicializar_datos_operatividad()
			this.SetRedraw(True)
			
		else
			messagebox("Error al actualizar en la tabla SGD_NO_OPERATIVIDAD",sqlca.sqlerrtext)
			rollback;
			li_return = -1
		end if
	end if		
end if

return li_return


end function

public subroutine fw_iniciar_modificacion_operatividad ();
long ll_status, ll_null
string ls_mensaje
datetime ldt_null

setnull(ldt_null)
setnull(ll_null)

if ib_modificando_operatividad = false then 

	il_registro_modificado = uo_activos.uf_get_fila_seleccionada()

	ll_status = gu_rf_servidor_operacion.of_bloquea("SGD_DISPONIBILIDAD", il_nro_instalacion, ls_mensaje)
	if ll_status = 0 then 
		messagebox("", ls_mensaje, Exclamation!, ok!)	
		dw_variacion_operatividad.Retrieve(il_nro_instalacion)
	else
		ib_modificando_operatividad = true
		dw_variacion_operatividad.object.nro_instalacion[1] = il_nro_instalacion	
	end if
end if


end subroutine

public subroutine fw_finalizar_modificacion_operatividad ();
long ll_status
string ls_mensaje

if ib_modificando_operatividad = true then 
	
	ib_modificando_operatividad = false
	
	ll_status = gu_rf_servidor_operacion.of_desbloquea("SGD_DISPONIBILIDAD", il_nro_instalacion, ls_mensaje)
	if ll_status = 0 and ls_mensaje <> 'Error. Disponibilidad no bloqueada' then 
		messagebox("", ls_mensaje, Exclamation!, ok!)
	end if
	
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

public function long uf_verify_textos ();
long ll_auxiliar, ll_return = 0 
string ls_texto
if not isnull(dw_variacion_operatividad.object.observaciones_alta[1]) then 
	ls_texto = dw_variacion_operatividad.object.observaciones_alta[1]
	ll_auxiliar = gf_verify_texto_sin_comas(ls_texto)
	if ll_auxiliar > 0 then 
		ll_return = -1
	end if
end if

if ( ll_return = 0  and  &
     not isnull(dw_variacion_operatividad.object.observaciones_baja[1]) ) then 
	ls_texto = dw_variacion_operatividad.object.observaciones_baja[1]
	ll_auxiliar = gf_verify_texto_sin_comas(ls_texto)
	if ll_auxiliar > 0 then 
		ll_return = -1
	end if
end if


return ll_return
end function

public subroutine uf_verify_activo (long pl_nro_instalacion);
long ll_rows

SELECT Count(*)
  INTO :ll_rows
  FROM SGD_INSTALACION_AT
 WHERE NRO_INSTALACION = :pl_nro_instalacion;
 
 
// if ll_rows <= 0 then 
//	dw_variacion_operatividad.Modify("disponibilidad_act.protect=1")
//	dw_variacion_operatividad.Modify("disponibilidad_act.background.Color="+gs_gris)	
//	dw_variacion_operatividad.enabled = false
//
//end if


end subroutine

public subroutine fw_inicializar_activo ();

uo_activos.fw_select_fila(1)
uo_activos.TriggerEvent("ue_clicked")
end subroutine

public subroutine uf_set_estructura_causa_alta (long pl_cod_causa);long ll_gpo_causa, ll_tipo, ll_subtipo, ll_activo
string ls_causa_categoria, ls_causa, ls_causa_detallada

SELECT GPO_CAUSA, TIPO, SUBTIPO, ACTIVO, DESCRIPCION
  INTO :ll_gpo_causa, :ll_tipo, :ll_subtipo, :ll_activo, :ls_causa_detallada
  FROM GI_CAUSA
 WHERE COD_CAUSA = :pl_cod_causa;

SELECT DESCRIPCION 
  INTO :ls_causa_categoria
  FROM GI_SUBTIPO_CAUSA
 WHERE GPO_CAUSA = :ll_gpo_causa
   AND SUBTIPO =:ll_subtipo
	AND TIPO = :ll_tipo
   AND ACTIVO = :ll_activo;
	
SELECT DESCRIPCION, IND_CHEQUEAR_CONSIGNACION
  INTO :ls_causa, :ii_chequear_consignacion
  FROM GI_SUBTIPOS
 WHERE SUBTIPO =:ll_subtipo
	AND TIPO = :ll_tipo
   AND ACTIVO = :ll_activo;

dw_variacion_operatividad.object.causa_alta[1] = ls_causa
dw_variacion_operatividad.object.causa_categoria_alta[1] = ls_causa_categoria
dw_variacion_operatividad.object.causa_detallada_alta[1] = ls_causa_detallada 






end subroutine

public subroutine uf_set_estructura_causa_baja (long pl_cod_causa);long ll_gpo_causa, ll_tipo, ll_subtipo, ll_activo
string ls_causa_categoria, ls_causa, ls_causa_detallada

SELECT GPO_CAUSA, TIPO, SUBTIPO, ACTIVO, DESCRIPCION
  INTO :ll_gpo_causa, :ll_tipo, :ll_subtipo, :ll_activo, :ls_causa_detallada
  FROM GI_CAUSA
 WHERE COD_CAUSA = :pl_cod_causa;

SELECT DESCRIPCION 
  INTO :ls_causa_categoria
  FROM GI_SUBTIPO_CAUSA
 WHERE GPO_CAUSA = :ll_gpo_causa
   AND SUBTIPO =:ll_subtipo
	AND TIPO = :ll_tipo
   AND ACTIVO = :ll_activo;
	
SELECT DESCRIPCION, IND_CHEQUEAR_CONSIGNACION
  INTO :ls_causa, :ii_chequear_consignacion
  FROM GI_SUBTIPOS
 WHERE SUBTIPO =:ll_subtipo
	AND TIPO = :ll_tipo
   AND ACTIVO = :ll_activo;

dw_variacion_operatividad.object.causa_baja[1] = ls_causa
dw_variacion_operatividad.object.causa_categoria_baja[1] = ls_causa_categoria
dw_variacion_operatividad.object.causa_detallada_baja[1] = ls_causa_detallada 






end subroutine

public function integer fw_validacion_operatividad ();long ll_disponibilidad, ll_disponibilidad_alta, ll_disponibilidad_baja, ll_null
datetime ldt_fecha_alta, ldt_fecha_baja, ldt_null
long ll_status
string lds_null

setnull(ll_null)
setnull(ldt_null)
setnull(lds_null)
setnull(ll_disponibilidad)
setnull(ll_disponibilidad_alta)
setnull(ll_disponibilidad_baja)
setnull(ldt_fecha_alta)  
setnull(ldt_fecha_baja)


if uf_verify_textos() = -1 then 
	return -1
end if

if not isnull(dw_variacion_operatividad.object.f_alta[1]) then 
	ldt_fecha_alta = dw_variacion_operatividad.object.f_alta[1]
else
	Messagebox("Cambio de operatividad", "No existe fecha de alta de la no operatividad. El registro no se guarda", Exclamation!,OK!)
	return -1
end if

if not isnull(dw_variacion_operatividad.object.f_baja[1]) then
	ldt_fecha_baja = dw_variacion_operatividad.object.f_baja[1]

	select case when :ldt_fecha_alta <  :ldt_fecha_baja then 1 else -1 end 
	  into :ll_status
	 from dual;
//   where nro_instalacion = :il_nro_instalacion; 
	 
	if ll_status = -1 then 
		Messagebox("Cambio de operatividad", "La fecha de baja de la no operatividad debe ser mayor que la fecha de alta", Exclamation!,OK!)		
		return -1
	end if
else
	//Si no tenemos fecha de baja debemos anular la disponibilidad las observaciones y la causa.
	if not isnull(dw_variacion_operatividad.object.disponibilidad_act_baja[1]) or &
	   not isnull(dw_variacion_operatividad.object.cod_causa_baja[1]) or &
		not isnull(dw_variacion_operatividad.object.observaciones_baja[1]) then 
		
		ll_status = Messagebox("Cambio de operatividad", "La fecha de baja es nula. Se anular$$HEX1$$e100$$ENDHEX$$n los datos correspondientes a la baja. $$HEX1$$bf00$$ENDHEX$$Desea continuar?", Exclamation!,YesNo!)
		
		if ll_status = 1 then
			dw_variacion_operatividad.object.disponibilidad_act_baja[1] = ll_null
			dw_variacion_operatividad.object.cod_causa_baja[1] = ll_null
			dw_variacion_operatividad.object.observaciones_baja[1] = lds_null			
		else
			return -1
		end if
	end if
end if

if not isnull(dw_variacion_operatividad.object.disponibilidad_act_alta[1]) then
	ll_disponibilidad_alta = dw_variacion_operatividad.object.disponibilidad_act_alta[1]
	if ll_disponibilidad_alta > 100 OR &
		ll_disponibilidad_alta < 0  then 
		
		MessageBox("ALTA DE NO OPERATIVIDAD", "La Disponibilidad del Activo (en alta) debe estar comprendida entre 0 y 100")	
		return -1		
	end if
end if

if not isnull(dw_variacion_operatividad.object.disponibilidad_act_baja[1]) then
	ll_disponibilidad_baja = dw_variacion_operatividad.object.disponibilidad_act_baja[1]
	if ll_disponibilidad_baja > 100 OR &
		ll_disponibilidad_baja < 0  then 
		
		MessageBox("BAJA DE NO OPERATIVIDAD", "La Disponibilidad del Activo (en baja) debe estar comprendida entre 0 y 100")	
		return -1		
	end if
end if



return 0
	

   


end function

public subroutine fw_inicializar_datos_operatividad ();
long ll_causa_alta, ll_causa_baja
dwItemStatus ldwis_auxiliar, ldwis_auxiliar_inicial
string ls_dwitemstatus

ldwis_auxiliar_inicial = dw_variacion_operatividad.GetItemStatus(1,0, Primary!)

if dw_variacion_operatividad.rowcount() > 0 then 	
		
	if not isnull(dw_variacion_operatividad.object.cod_causa_alta[1]) then 
		ll_causa_alta = dw_variacion_operatividad.object.cod_causa_alta[1]
		uf_set_estructura_causa_alta(ll_causa_alta)
	end if

	if not isnull(dw_variacion_operatividad.object.cod_causa_baja[1]) then 
		ll_causa_baja = dw_variacion_operatividad.object.cod_causa_baja[1]
		uf_set_estructura_causa_alta(ll_causa_baja)
	end if
	
	
	if not isnull(dw_variacion_operatividad.object.disponibilidad_act_alta[1]) then 
		il_disponibilidad_alta_inicial = dw_variacion_operatividad.object.disponibilidad_act_alta[1]
	else
		il_disponibilidad_alta_inicial = il_disponibilidad
	end if
	
	if not isnull(dw_variacion_operatividad.object.disponibilidad_act_baja[1]) then 
		il_disponibilidad_baja_inicial = dw_variacion_operatividad.object.disponibilidad_act_baja[1]
	else
		il_disponibilidad_baja_inicial = il_disponibilidad
	end if	

end if		

IF (ldwis_auxiliar_inicial = NotModified!) then
	dw_variacion_operatividad.SetItemStatus(1, 0, Primary!, ldwis_auxiliar_inicial)
end if


end subroutine

public function integer fw_grabar_disponibilidad ();long ll_status, ll_disponibilidad, ll_disponibilidad_act_baja, ll_disponibilidad_act_alta


dw_variacion_operatividad.AcceptText()


if not isnull(dw_variacion_operatividad.object.disponibilidad_act_alta[1])  then 
	ll_disponibilidad_act_alta = dw_variacion_operatividad.object.disponibilidad_act_alta[1]
	
	if ll_disponibilidad_act_alta <> il_disponibilidad_alta_inicial and &
		ll_disponibilidad_act_alta <> il_disponibilidad then		
					
		UPDATE SGD_DISPONIBILIDAD
			SET DISPONIBILIDAD_ACT = :ll_disponibilidad_act_alta,
				 IND_MANIOBRA = 1
		 WHERE NRO_INSTALACION = :il_nro_instalacion;
		
	end if
end if

if not isnull(dw_variacion_operatividad.object.disponibilidad_act_baja[1])  then 
	ll_disponibilidad_act_baja = dw_variacion_operatividad.object.disponibilidad_act_baja[1]
	
	if ll_disponibilidad_act_baja <> il_disponibilidad_baja_inicial and &
		ll_disponibilidad_act_baja <> il_disponibilidad then		
		
		UPDATE SGD_DISPONIBILIDAD
			SET DISPONIBILIDAD_ACT = :ll_disponibilidad_act_baja,
				 IND_MANIOBRA = 1
		 WHERE NRO_INSTALACION = :il_nro_instalacion;
	end if
end if

return 0
end function

on w_operatividad_activo.create
if this.MenuName = "m_no_operatividad" then this.MenuID = create m_no_operatividad
this.uo_activos=create uo_activos
this.st_instalacion_sel=create st_instalacion_sel
this.dw_variacion_operatividad=create dw_variacion_operatividad
this.gb_variacion_disp=create gb_variacion_disp
this.Control[]={this.uo_activos,&
this.st_instalacion_sel,&
this.dw_variacion_operatividad,&
this.gb_variacion_disp}
end on

on w_operatividad_activo.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.uo_activos)
destroy(this.st_instalacion_sel)
destroy(this.dw_variacion_operatividad)
destroy(this.gb_variacion_disp)
end on

event open;

il_modificado = 0

fw_inicializar_activo()

end event

event closequery;long ll_status

dwItemStatus ldwis_variacion_operatividad

ldwis_variacion_operatividad = dw_variacion_operatividad.GetItemStatus(1, 0, Primary!)

if ib_modificando_operatividad then 
	ll_status = messagebox("", "Ha habido cambios en la operatividad. $$HEX1$$bf00$$ENDHEX$$Desea salvarlos?", Exclamation!, YesNo!)
		
	if ll_status = 1 then 	
		ll_status = fw_grabar_operatividad()
	else 
		fw_finalizar_modificacion_operatividad()
	end if
end if


end event

type uo_activos from u_activos within w_operatividad_activo
event destroy ( )
integer width = 1541
integer height = 1784
integer taborder = 20
boolean border = true
end type

on uo_activos.destroy
call u_activos::destroy
end on

event ue_clicked;call super::ue_clicked;


long ll_nro_instalacion, ll_null, ll_status= 0
string ls_nombre_instalacion
int  li_grabacion_correcta = 0
int  li_disponibilidad, li_count
dwItemStatus ldwis_variacion_operatividad
string ls_dwItemStatus
long ll_causa_alta, ll_causa_baja

ldwis_variacion_operatividad = dw_variacion_operatividad.GetItemStatus(1,0, Primary!)
ls_dwItemStatus = uf_get_itemstatus(ldwis_variacion_operatividad)

setnull(ll_null)

//if not(ldwis_variacion_operatividad = notmodified!) then 	
if ib_modificando_operatividad	 then 	
	ll_status = messagebox("", "Ha habido cambios en la operatividad. $$HEX1$$bf00$$ENDHEX$$Desea salvarlos?", Exclamation!, YesNo!)
		
	if ll_status = 1 then 	
		li_grabacion_correcta = fw_grabar_operatividad()
	else 
		fw_finalizar_modificacion_operatividad()
	end if	
end if

if li_grabacion_correcta = 0 then 
	parent.SetRedraw(False)
	
	il_nro_instalacion = uf_get_nro_instalacion()
	il_disponibilidad = uf_get_disponibilidad()
	ls_nombre_instalacion = uf_get_nombre_instalacion()	
	
	il_operatividad = uf_get_operatividad()

	st_instalacion_sel.text = ls_nombre_instalacion
	
	dw_variacion_operatividad.Reset()
	dw_variacion_operatividad.Retrieve(il_nro_instalacion)
	
	li_count = dw_variacion_operatividad.RowCount()
	if li_count = 0 then 
		dw_variacion_operatividad.InsertRow(0)
		dw_variacion_operatividad.object.nro_instalacion[1] = il_nro_instalacion	
	end if
	
	fw_inicializar_datos_operatividad()
	
	parent.SetRedraw(True)
end if
	


end event

type st_instalacion_sel from statictext within w_operatividad_activo
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

type dw_variacion_operatividad from datawindow within w_operatividad_activo
integer x = 1664
integer y = 80
integer width = 1806
integer height = 1656
integer taborder = 50
string title = "none"
string dataobject = "d_operatividad"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;
string ls_naturaleza_activo

if dwo.name = "causa_alta_t" or dwo.name = "causa_baja_t"then
	
	
	if ib_modificando_operatividad = false then
		fw_iniciar_modificacion_operatividad()
	end if
		
	gu_comunic2 = create u_generico_comunicaciones
		
	If fg_verifica_parametro('CAUSAS') Then
		
			gu_comunic2.is_comunic.strval9 = 'CAMBIO DE ESTADO'
						
			OpenWithParm(w_2301_sel_causa_x_tipo, 1)
	Else
			Open(w_2301_sel_causa)
	End If
		
	if gu_comunic2.is_comunic.longval4 > 0 then	
		
		if dwo.name = "causa_alta_t" then 
		
			dw_variacion_operatividad.setitem(1,"cod_causa_alta",gu_comunic2.is_comunic.longval4)
			uf_set_estructura_causa_alta(gu_comunic2.is_comunic.longval4)
		
		elseif dwo.name = "causa_baja_t" then 
		
			dw_variacion_operatividad.setitem(1,"cod_causa_baja",gu_comunic2.is_comunic.longval4)
			uf_set_estructura_causa_baja(gu_comunic2.is_comunic.longval4)
	
		end if
	
		il_modificado = 1
		ib_modificando_operatividad = true
		yield()
	end if

	this.AcceptText()

end if




end event

event itemchanged;
string ls_auxiliar
long ll_null, ll_status
string lds_null
datetime ldt_null

dw_variacion_operatividad.AcceptText()

if ib_modificando_operatividad = false then 
	fw_iniciar_modificacion_operatividad()
end if

ls_auxiliar = dwo.name

if dwo.name = 'f_alta' then 
	if isnull(dw_variacion_operatividad.object.disponibilidad_act_alta[1]) then 
		dw_variacion_operatividad.object.disponibilidad_act_alta[1] = il_disponibilidad
	end if
	
	if not isnull(dw_variacion_operatividad.object.f_baja[1]) then 
		
		ll_status = Messagebox("Cambio de operatividad", "La modificaci$$HEX1$$f300$$ENDHEX$$n de la fecha de alta inicializar$$HEX2$$e1002000$$ENDHEX$$los datos correspondientes a la baja.", Exclamation!,OK!)
		
		if ll_status = 1 then
			setnull(ll_null)
			setnull(lds_null)
			setnull(ldt_null)
			dw_variacion_operatividad.object.f_baja[1] = ldt_null
			dw_variacion_operatividad.object.disponibilidad_act_baja[1] = ll_null
			dw_variacion_operatividad.object.cod_causa_baja[1] = ll_null
			dw_variacion_operatividad.object.observaciones_baja[1] = lds_null		
			dw_variacion_operatividad.AcceptText()
		end if
	end if	
end if

if dwo.name = 'f_baja' then 
	if isnull(dw_variacion_operatividad.object.disponibilidad_act_baja[1]) then 
		dw_variacion_operatividad.object.disponibilidad_act_baja[1] = il_disponibilidad
	end if
end if
		

end event

event editchanged;this.accepttext()
end event

event constructor;
datawindowchild ldddw_causa

this.SetTransObject(SQLCA)

DataWindowChild ldw_child
this.GetChild ('cod_causa', ldddw_causa)
ldddw_causa.SetTransObject (SQLCA)
ldddw_causa.Retrieve()
end event

event losefocus;this.accepttext()
end event

event doubleclicked;
string ls_cabecera

if dwo.name = "cabecera" then
	
	ls_cabecera = 'Movimiento de Tap de posici$$HEX1$$f300$$ENDHEX$$n ... a posici$$HEX1$$f300$$ENDHEX$$n ...'
	
	dw_variacion_operatividad.object.observaciones[1] = ls_cabecera
end if
	
	
	
end event

type gb_variacion_disp from groupbox within w_operatividad_activo
integer x = 1568
integer y = 4
integer width = 1975
integer height = 1776
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "      Operatividad del activo                                                 "
end type


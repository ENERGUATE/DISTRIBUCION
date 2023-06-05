HA$PBExportHeader$w_disponibilidad_activo_historico_resp.srw
forward
global type w_disponibilidad_activo_historico_resp from window
end type
type cb_2 from commandbutton within w_disponibilidad_activo_historico_resp
end type
type dw_disponibilidad_historica from datawindow within w_disponibilidad_activo_historico_resp
end type
type cb_1 from commandbutton within w_disponibilidad_activo_historico_resp
end type
end forward

global type w_disponibilidad_activo_historico_resp from window
integer x = 1120
integer y = 388
integer width = 2021
integer height = 1856
boolean titlebar = true
string title = "OPENSGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Causa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_2 cb_2
dw_disponibilidad_historica dw_disponibilidad_historica
cb_1 cb_1
end type
global w_disponibilidad_activo_historico_resp w_disponibilidad_activo_historico_resp

type variables
long il_nro_instalacion
int  ii_chequear_consignacion = 0
int  ii_chequear_activo_causante = 0
int  ii_chequear_f_instruccion = 0

end variables

forward prototypes
public function integer uf_set_estructura_causa (long pl_cod_causa)
public function boolean uf_verify_consignacion ()
public subroutine wf_chequear_campos ()
public function boolean uf_verify_activo_causante ()
end prototypes

public function integer uf_set_estructura_causa (long pl_cod_causa);
long ll_gpo_causa, ll_tipo, ll_subtipo, ll_activo
string ls_causa_categoria, ls_causa

SELECT GPO_CAUSA, TIPO, SUBTIPO, ACTIVO
  INTO :ll_gpo_causa, :ll_tipo, :ll_subtipo, :ll_activo
  FROM GI_CAUSA
 WHERE COD_CAUSA = :pl_cod_causa;

SELECT TRIM(DESCRIPCION)
  INTO :ls_causa_categoria
  FROM GI_SUBTIPO_CAUSA
 WHERE GPO_CAUSA = :ll_gpo_causa
   AND SUBTIPO =:ll_subtipo
	AND TIPO = :ll_tipo
   AND ACTIVO = :ll_activo;
	


dw_disponibilidad_historica.object.cod_causa[1] = pl_cod_causa
//dw_atributos.object.causa_categoria[1] = ls_causa_categoria
//dw_atributos.object.causa_detallada[1] = pl_cod_causa 
//
//
//


return 1

end function

public function boolean uf_verify_consignacion ();
// Para las causas (familia de causas ser$$HEX1$$ed00$$ENDHEX$$a m$$HEX1$$e100$$ENDHEX$$s correcto) MANTENIMIENTO, MANTENIMIENTO MAYOR y EXPANSI$$HEX1$$d300$$ENDHEX$$N 
// debe verificarse que los campos consignacion_nacional, psm y observaciones est$$HEX1$$e100$$ENDHEX$$n rellenos

boolean lb_return = true



if ii_chequear_consignacion = 1 then 

	if isnull(dw_disponibilidad_historica.object.consignacion_nacional[1]) or dw_disponibilidad_historica.object.consignacion_nacional[1] = ''  then
		lb_return = false
	end if
	
	if isnull(dw_disponibilidad_historica.object.tipo_psm[1]) or  (dw_disponibilidad_historica.object.tipo_psm[1] = -1 )then
		lb_return = false
	end if
	
	if isnull(dw_disponibilidad_historica.object.observaciones[1]) or dw_disponibilidad_historica.object.observaciones[1] = ''  then
		lb_return = false
	end if

end if

if lb_return = false then 
	Messagebox("Modificaci$$HEX1$$f300$$ENDHEX$$n operatividad", "Los campos PSM, CONSIGNACION_NACIONAL y OBSERVACIONES no deben ser nulos con esta causa", Exclamation!, OK!)
end if

return lb_return

end function

public subroutine wf_chequear_campos ();
long ll_tipo_movimiento

dw_disponibilidad_historica.object.gb_consignacion_nacional.Visible = ii_chequear_consignacion
dw_disponibilidad_historica.object.consignacion_nacional_t.Visible = ii_chequear_consignacion
dw_disponibilidad_historica.object.consignacion_nacional.Visible = ii_chequear_consignacion
dw_disponibilidad_historica.object.tipo_psm.Visible = ii_chequear_consignacion
dw_disponibilidad_historica.object.tipo_psm_t.Visible = ii_chequear_consignacion

dw_disponibilidad_historica.object.gb_activo_causante.Visible = ii_chequear_activo_causante
dw_disponibilidad_historica.object.activo_causante_t.Visible = ii_chequear_activo_causante
dw_disponibilidad_historica.object.activo_causante.Visible = ii_chequear_activo_causante


ll_tipo_movimiento = dw_disponibilidad_historica.object.tipo_movimiento[1]

if ll_tipo_movimiento <> 1 and  ll_tipo_movimiento = 5 then 
	ii_chequear_f_instruccion = 0
end if

dw_disponibilidad_historica.object.tiempo_instruccion.Visible = ii_chequear_f_instruccion
dw_disponibilidad_historica.object.tiempo_instruccion_t.Visible = ii_chequear_f_instruccion




end subroutine

public function boolean uf_verify_activo_causante ();
boolean lb_return = true

//if li_tipo_movimiento = 5 then 
//	//Si es un cambio de estado debe seleccionarse la causa y el activo causante

	if isnull (dw_disponibilidad_historica.object.cod_causa[1]) then 
		messagebox("Modificaci$$HEX1$$f300$$ENDHEX$$n operatividad", "No se ha seleccionado ninguna causa.", Exclamation!, OK!)
		lb_return = false
	end if
	
	if ii_chequear_activo_causante = 1 and isnull (dw_disponibilidad_historica.object.activo_causante[1]) then 
		messagebox("Modificaci$$HEX1$$f300$$ENDHEX$$n operatividad", "No se ha seleccionado el activo causante.", Exclamation!, OK!)
		lb_return = false
	end if
	
	if isnull(dw_disponibilidad_historica.object.observaciones[1]) or dw_disponibilidad_historica.object.observaciones[1] = ''  then
		messagebox("Modificaci$$HEX1$$f300$$ENDHEX$$n operatividad", "Las observaciones no deben ser nulas.", Exclamation!, OK!)
		lb_return = false
	end if

//end if

return lb_return


end function

event open;

long ll_nro_instalacion, ll_secuencial, ll_cod_causa
string ls_nombre_familia_causa, ls_nombre_categoria_causa, ls_nombre_causa_detallada

il_nro_instalacion = gu_comunic2.is_comunic.longval4 
ll_secuencial = Message.DoubleParm  

dw_disponibilidad_historica.SetTransObject(SQLCA)
dw_disponibilidad_historica.Retrieve(il_nro_instalacion, ll_secuencial)


ll_cod_causa = dw_disponibilidad_historica.object.cod_causa[1]

gf_set_estructura_causa(ll_cod_causa, ls_nombre_familia_causa, &
								ls_nombre_categoria_causa, ls_nombre_causa_detallada, &
								ii_chequear_consignacion, ii_chequear_activo_causante, &
								ii_chequear_f_instruccion)
										
dw_disponibilidad_historica.object.familia_causa[1] = ls_nombre_familia_causa
dw_disponibilidad_historica.object.categoria_causa[1] = ls_nombre_categoria_causa	

wf_chequear_campos()
 
	



end event

on w_disponibilidad_activo_historico_resp.create
this.cb_2=create cb_2
this.dw_disponibilidad_historica=create dw_disponibilidad_historica
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_disponibilidad_historica,&
this.cb_1}
end on

on w_disponibilidad_activo_historico_resp.destroy
destroy(this.cb_2)
destroy(this.dw_disponibilidad_historica)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within w_disponibilidad_activo_historico_resp
integer x = 1234
integer y = 1632
integer width = 329
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Grabar"
end type

event clicked;
Boolean lb_status


lb_status = uf_verify_consignacion()

if lb_status then 
	
	lb_status = uf_verify_activo_causante()
	
	if lb_status = true then 
	
		dw_disponibilidad_historica.Update()
		
		close(parent)
		
	end if
end if
end event

type dw_disponibilidad_historica from datawindow within w_disponibilidad_activo_historico_resp
integer x = 37
integer y = 32
integer width = 1925
integer height = 1552
integer taborder = 10
string title = "none"
string dataobject = "d_variacion_disponibilidad_hist"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;

long ll_nro_instalacion, ll_codigo_activo, ll_cod_causa
string ls_nombre, ls_naturaleza_activo
string ls_nombre_familia_causa, ls_nombre_categoria_causa, ls_nombre_causa_detallada
int	 li_tipo_movimiento, li_operatividad
long   ll_null

setnull(ll_null) 
gu_comunic2 = create u_generico_comunicaciones

if dwo.name = "causa_t" then
	//gu_comunic2 = create u_generico_comunicaciones
		
	If fg_verifica_parametro('CAUSAS') Then
			
			li_tipo_movimiento = dw_disponibilidad_historica.object.tipo_movimiento[1]
			
			if li_tipo_movimiento = 5 then 
				li_operatividad = dw_disponibilidad_historica.object.estado_operatividad[1]
				
				if li_operatividad = 1 then 
					gu_comunic2.is_comunic.strval9  = 'ESTADO OPERATIVO'
				else
					gu_comunic2.is_comunic.strval9  = 'ESTADO NO OPERATIVO'
				end if
			else
				gu_comunic2.is_comunic.strval9  = 'CAMBIO DE DISPONIBILIDAD'
			end if
			
			ls_naturaleza_activo = gf_naturaleza_activo(il_nro_instalacion)				
			
			if ls_naturaleza_activo = "STN" then
				gu_comunic2.is_comunic.strval9  += ' STN'				
			end if

			OpenWithParm(w_2301_sel_causa_x_tipo, 1)
	Else
			Open(w_2301_sel_causa)
	End If
		
	if gu_comunic2.is_comunic.longval4 > 0 then	
		
		ll_cod_causa = gu_comunic2.is_comunic.longval4	
		
		gf_set_estructura_causa(ll_cod_causa, ls_nombre_familia_causa, &
										ls_nombre_categoria_causa, ls_nombre_causa_detallada, &
										ii_chequear_consignacion, ii_chequear_activo_causante, &
										ii_chequear_f_instruccion)
										
		dw_disponibilidad_historica.object.cod_causa[1] = ll_cod_causa
		dw_disponibilidad_historica.object.familia_causa[1] = ls_nombre_familia_causa
		dw_disponibilidad_historica.object.categoria_causa[1] = ls_nombre_categoria_causa	
		
		wf_chequear_campos()
				
		dw_disponibilidad_historica.object.activo_causante[1]= ll_null
			
		dw_disponibilidad_historica.object.consignacion_nacional[1] = ''
		dw_disponibilidad_historica.object.consignacion_nac_check[1] =0
		dw_disponibilidad_historica.object.tipo_psm[1] = -1
		
		dw_disponibilidad_historica.Modify("consignacion_nacional.protect=0")
		dw_disponibilidad_historica.Modify("consignacion_nacional.background.Color="+gs_blanco)	

		dw_disponibilidad_historica.Modify("tipo_psm.protect=0")
		dw_disponibilidad_historica.Modify("tipo_psm.background.Color="+gs_blanco)		
	
	end if	
end if

if dwo.name = "activo_causante_t" and ii_chequear_activo_causante = 1 then
	
	open(w_seleccion_activo)
	
	ll_nro_instalacion = Message.DoubleParm
	
	if not isnull(ll_nro_instalacion) then 
		dw_disponibilidad_historica.object.activo_causante[1] = ll_nro_instalacion	
	end if
end if


end event

event constructor;
datawindowchild ldddw_causa, ldddw_activo_causante

this.SetTransObject(SQLCA)

this.GetChild ('cod_causa', ldddw_causa)
ldddw_causa.SetTransObject (SQLCA)
ldddw_causa.Retrieve()

this.GetChild ('cod_causa', ldddw_activo_causante)
ldddw_activo_causante.SetTransObject (SQLCA)
ldddw_activo_causante.Retrieve()
end event

type cb_1 from commandbutton within w_disponibilidad_activo_historico_resp
integer x = 1632
integer y = 1632
integer width = 329
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;Close(parent)
end event


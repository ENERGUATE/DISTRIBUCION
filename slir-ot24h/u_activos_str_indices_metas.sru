HA$PBExportHeader$u_activos_str_indices_metas.sru
forward
global type u_activos_str_indices_metas from userobject
end type
type cb_1 from commandbutton within u_activos_str_indices_metas
end type
type cb_recuperar from commandbutton within u_activos_str_indices_metas
end type
type dw_filtro from datawindow within u_activos_str_indices_metas
end type
type cb_calcular from commandbutton within u_activos_str_indices_metas
end type
type cb_cierremensual from commandbutton within u_activos_str_indices_metas
end type
type cb_filtrar from commandbutton within u_activos_str_indices_metas
end type
type dw_activos from datawindow within u_activos_str_indices_metas
end type
type dw_periodo from datawindow within u_activos_str_indices_metas
end type
type gb_1 from groupbox within u_activos_str_indices_metas
end type
type gb_2 from groupbox within u_activos_str_indices_metas
end type
end forward

global type u_activos_str_indices_metas from userobject
integer width = 3511
integer height = 1784
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_clicked ( )
event ue_postopen ( )
cb_1 cb_1
cb_recuperar cb_recuperar
dw_filtro dw_filtro
cb_calcular cb_calcular
cb_cierremensual cb_cierremensual
cb_filtrar cb_filtrar
dw_activos dw_activos
dw_periodo dw_periodo
gb_1 gb_1
gb_2 gb_2
end type
global u_activos_str_indices_metas u_activos_str_indices_metas

type variables


string is_virgin_select
long   il_row

boolean ib_ind_update = false, ib_ind_find = false

n_calculos_indicadores inv_calculos_stn
end variables

forward prototypes
public subroutine uf_buscar_indicadores_en_bbdd ()
public subroutine uf_filtrar_activos ()
public subroutine uf_recuperar_indices ()
public function string uf_get_itemstatus (dwitemstatus pdwis_status)
public subroutine uf_filtrar_activos_str ()
end prototypes

event ue_postopen();
uf_recuperar_indices()
end event

public subroutine uf_buscar_indicadores_en_bbdd ();
boolean lb_instalacion = true, lb_tipo_activo = true,  lb_anio = true, lb_mes = true

long   ll_tipo_activo
string ls_instalacion
string ls_where_instalacion, ls_where_tipo_activo
string ls_where, ls_select, ls_find 

datastore lds_indicadores_stn

long ll_anio, ll_mes
long ll_cont, ll_rows, ll_fila
long ll_activo, ll_enr, ll_cnp, ll_ind_update
dec{2} ldec_mhaia, ldec_indice_disponibilidad, ldec_imr

dw_filtro.AcceptText()

lds_indicadores_stn = CREATE datastore

if isnull(dw_filtro.object.anio[1]) then 
	lb_anio = false
else
	ll_anio = dw_filtro.object.anio[1]
end if

if isnull(dw_filtro.object.mes[1]) then 
	ll_mes = 0	
else
	ll_mes = dw_filtro.object.mes[1]
end if

ib_ind_update = false

if lb_anio then 
	ib_ind_find = true
	lds_indicadores_stn.dataobject = 'd_stn_indicadores_ds'
	lds_indicadores_stn.SetTransObject(SQLCA)
	
	ls_select = lds_indicadores_stn.GetSQLSelect()
	ls_select += " WHERE ANIO = " + string(ll_anio)
	ls_select += "   AND MES  = " + string(ll_mes)

	lds_indicadores_stn.SetSQLSelect(ls_select) 
	lds_indicadores_stn.Retrieve()
	ll_rows = lds_indicadores_stn.RowCount()
	
	for ll_cont = 1 to ll_rows 
		ll_activo = lds_indicadores_stn.object.codigo_activo[ll_cont]
		ll_enr = lds_indicadores_stn.object.enr[ll_cont]
		ll_cnp= lds_indicadores_stn.object.cnp[ll_cont]
		ldec_mhaia = lds_indicadores_stn.object.mhaai[ll_cont]
		ldec_indice_disponibilidad = lds_indicadores_stn.object.indice_disponibilidad[ll_cont]
		ldec_imr = lds_indicadores_stn.object.imr[ll_cont]
		ll_ind_update = lds_indicadores_stn.object.ind_update[ll_cont]
		if ll_ind_update = 1 then 
			//El registro ha sido actualizado. No se puede efectuar un nuevo cierre mensual
			ib_ind_update = true
		end if
		
		ls_find = "ANIO = " + string(ll_anio) + " AND MES  = " + string(ll_mes)
		ll_fila = dw_activos.Find(ls_find, 1, ll_rows)
		
		if ll_fila > 0 then 
			dw_activos.object.enr[ll_fila] = ll_enr
			dw_activos.object.cnp[ll_fila] = ll_cnp
			dw_activos.object.mhaia[ll_fila] = ldec_mhaia
			dw_activos.object.id[ll_fila] = ldec_indice_disponibilidad
			dw_activos.object.imr[ll_fila] = ldec_imr
		end if
	end for
end if

dw_activos.SetRedraw(false)
dw_activos.Reset()
dw_activos.Retrieve()
dw_activos.SetRedraw(true)

DESTROY lds_indicadores_stn
		
end subroutine

public subroutine uf_filtrar_activos ();
boolean lb_instalacion = true, lb_tipo_activo = true 
string  ls_filter, ls_filter_activo
long    ll_tipo_activo


dw_filtro.AcceptText()

dw_activos.SetRedraw(False)

dw_activos.SetFilter("")
dw_activos.Filter()

if isnull(dw_filtro.object.tipo_activo[1]) or dw_filtro.object.tipo_activo[1] = 999 then 
	lb_tipo_activo = false
else
	ll_tipo_activo = dw_filtro.object.tipo_activo[1] 	
	ls_filter = "TIPO = " + string(ll_tipo_activo)	
end if


if isnull(dw_filtro.object.nombre_activo[1]) or dw_filtro.object.nombre_activo[1]= '' then 	
	lb_instalacion = false
else

	if lb_tipo_activo then ls_filter += ' AND '

	ls_filter += "DESCRIPCION LIKE '" + dw_filtro.object.nombre_activo[1] + "%'"
	
end if
		
dw_activos.SetFilter(ls_filter)
dw_activos.Filter()		
		
end subroutine

public subroutine uf_recuperar_indices ();
long ll_anio, ll_mes

dw_filtro.object.tipo_activo[1] = 999
dw_filtro.object.nombre_activo[1] = ''

dw_periodo.AcceptText()
uf_filtrar_activos()
		
ll_anio = dw_periodo.object.anio[1]
ll_mes = dw_periodo.object.mes[1]		

dw_activos.Reset()
dw_activos.Retrieve(ll_anio, ll_mes)

end subroutine

public function string uf_get_itemstatus (dwitemstatus pdwis_status);
string 	ls_auxiliar

choose case pdwis_status
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

public subroutine uf_filtrar_activos_str ();long ll_rows 
string ls_filter

ls_filter = 'naturaleza = "STR" '

dw_activos.SetFilter(ls_filter)
dw_activos.Filter()

ll_rows = dw_activos.RowCount()
ll_rows = 1
end subroutine

on u_activos_str_indices_metas.create
this.cb_1=create cb_1
this.cb_recuperar=create cb_recuperar
this.dw_filtro=create dw_filtro
this.cb_calcular=create cb_calcular
this.cb_cierremensual=create cb_cierremensual
this.cb_filtrar=create cb_filtrar
this.dw_activos=create dw_activos
this.dw_periodo=create dw_periodo
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_1,&
this.cb_recuperar,&
this.dw_filtro,&
this.cb_calcular,&
this.cb_cierremensual,&
this.cb_filtrar,&
this.dw_activos,&
this.dw_periodo,&
this.gb_1,&
this.gb_2}
end on

on u_activos_str_indices_metas.destroy
destroy(this.cb_1)
destroy(this.cb_recuperar)
destroy(this.dw_filtro)
destroy(this.cb_calcular)
destroy(this.cb_cierremensual)
destroy(this.cb_filtrar)
destroy(this.dw_activos)
destroy(this.dw_periodo)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event constructor;

inv_calculos_stn = CREATE n_calculos_indicadores

postevent("ue_postopen")



end event

event destructor;

DESTROY inv_calculos_stn
end event

type cb_1 from commandbutton within u_activos_str_indices_metas
integer x = 155
integer y = 1576
integer width = 421
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Generar &Fichero"
end type

event clicked;
STRING ls_auxiliar

ls_auxiliar = "c:\indicadores_compensaciones_STN"

dw_activos.SaveAs()// Excel!, TRUE)
end event

type cb_recuperar from commandbutton within u_activos_str_indices_metas
integer x = 878
integer y = 140
integer width = 421
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recuperar"
end type

event clicked;

long ll_anio, ll_mes
string ls_filter

dw_activos.SetRedraw(False)
dw_filtro.AcceptText()

uf_recuperar_indices()

uf_filtrar_activos_str()

dw_activos.SetRedraw(True)
end event

type dw_filtro from datawindow within u_activos_str_indices_metas
integer x = 1458
integer y = 48
integer width = 1371
integer height = 204
integer taborder = 30
string title = "none"
string dataobject = "d_indicadores_filtrar_activos"
boolean border = false
boolean livescroll = true
end type

event constructor;

long ll_rows
datawindowchild ldddw_tipo_activo

this.SetRedraw(False)

dw_filtro.InsertRow(0)

this.GetChild('tipo_activo', ldddw_tipo_activo)

ldddw_tipo_activo.SetTransObject(SQLCA)
ll_rows = ldddw_tipo_activo.Retrieve()

ll_rows = ldddw_tipo_activo.RowCount()

this.SetRedraw(True)
end event

type cb_calcular from commandbutton within u_activos_str_indices_metas
boolean visible = false
integer x = 2469
integer y = 1576
integer width = 421
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&C$$HEX1$$e100$$ENDHEX$$lculo  ID"
end type

event clicked;boolean lb_cierre_mensual= true
long ll_rows, ll_cont, ll_activo
long ll_anio, ll_mes, ll_anio_aux, ll_mes_aux
date ldate_fecha_hasta, ldate_fecha_desde
string ls_fecha_auxiliar, ls_dwis_auxiliar
decimal{4} ldec_indice_indisponibilidad, ldec_mida, ldec_auxiliar, ldec_imr, ldec_cte_imrt
dec{4} ldec_horas_a_compensar, ldec_horas_compensadas
long ll_mhaia, ll_sce, ll_cpsm, ll_enr, ll_dias_mes, ll_horas_mes
long ll_ind_indisp_mensual_tycn, ll_ind_mida = 0 
dec{4} ldec_coste_ens
dec{4} ldec_cano, ldec_cano_pendiente, ldec_ingresos, ldec_compensacion		
string ls_filter

dw_activos.SetRedraw(False)

dwitemstatus ldwis_auxiliar

uf_recuperar_indices()

if (isnull(dw_activos.object.ind_updated[1]) or dw_activos.object.ind_updated[1] = 0) then
	lb_cierre_mensual = false
end if

if lb_cierre_mensual then 
	Messagebox("Indices STN", "No se puede realizar el c$$HEX1$$e100$$ENDHEX$$lculo.Ya se ha hecho el cierre mensual de ese per$$HEX1$$ed00$$ENDHEX$$odo.", Exclamation!, ok!)
else	
	ll_rows = dw_activos.RowCount()
	ll_anio = dw_periodo.object.anio[1]
	ll_mes = dw_periodo.object.mes[1]

	ldate_fecha_desde = date('01/' + string(ll_mes, '00') + '/' + string(ll_anio, '0000'))
	
	ll_mes_aux = ll_mes + 1
	ll_anio_aux = ll_anio 	
	if ll_mes_aux = 13 then 
		ll_mes_aux = 1
		ll_anio_aux = ll_anio + 1	
	end if		
	ls_fecha_auxiliar = '01/' + string(ll_mes_aux, '00') + '/' + string(ll_anio_aux, '0000')
	ldate_fecha_hasta = date(ls_fecha_auxiliar)
	
	ll_dias_mes = daysafter(ldate_fecha_desde, ldate_fecha_hasta)
	ll_horas_mes = ll_dias_mes * 24
	
	inv_calculos_stn.uf_set_ipp(ldate_fecha_hasta)
	
	for ll_cont = 1 to ll_rows
		
		ldwis_auxiliar = dw_activos.GetItemStatus(ll_cont, 0, Primary!)
		dw_activos.SetItemStatus(ll_cont, 0, Primary!, New!)
		
		ll_activo = dw_activos.object.codigo[ll_cont]	
		
		dw_activos.object.ind_updated[ll_cont] = 1
		dw_activos.object.codigo_activo[ll_cont] = ll_activo
		dw_activos.object.anio[ll_cont] = ll_anio
		dw_activos.object.mes[ll_cont] = ll_mes
						
		inv_calculos_stn.uf_calcular_indice_disponibilidad(ll_activo, datetime(ldate_fecha_hasta), &
		                       ldec_indice_indisponibilidad, ll_sce, ll_cpsm, ll_enr, ldec_horas_compensadas)
		
		dw_activos.object.indice_disponibilidad[ll_cont] = ldec_indice_indisponibilidad		
		dw_activos.object.sce[ll_cont] = ll_sce		
		dw_activos.object.cpsm[ll_cont] = ll_cpsm		
		dw_activos.object.enr[ll_cont] = ll_enr	
		
		//C$$HEX1$$e100$$ENDHEX$$lculo de la Meta de $$HEX1$$cd00$$ENDHEX$$ndice de Disponibilidad Ajustada (MIDA)
		
		ll_mhaia = dw_activos.object.mhai[ll_cont]
		
		//ldec_auxiliar = (ll_mhaia - (0.5 * (ll_sce + ll_cpsm + ll_enr))) / 8760		
		//ldec_mida = (1 - ldec_auxiliar) * 100
		
		ldec_mida = (ll_mhaia - (0.5 * (ll_sce + ll_cpsm + ll_enr))) 
		
		dw_activos.object.mida[ll_cont] = ldec_mida	
		
		ldec_horas_a_compensar = ldec_indice_indisponibilidad - ldec_mida - ldec_horas_compensadas
		
		if ldec_horas_a_compensar < 0.0 then ldec_horas_a_compensar = 0.0
			
		dw_activos.object.horas_indisp_a_compensar[ll_cont] = ldec_horas_a_compensar		
		
		ldec_imr = inv_calculos_stn.uf_calcular_ingresomensualregulado(ll_activo, ldate_fecha_hasta)
		dw_activos.object.imr[ll_cont] = ldec_imr
		
		dw_activos.object.horas_mes[ll_cont] = ll_horas_mes
		
		ll_ind_indisp_mensual_tycn = inv_calculos_stn.uf_calcular_indisponibilidad_x_tycn(ll_activo, ldate_fecha_desde, ldate_fecha_hasta)
		dw_activos.object.ind_indisp_mensual_tycn[ll_cont] = ll_ind_indisp_mensual_tycn
		
		
		ldec_cte_imrt = inv_calculos_stn.uf_calcular_cte_imrt_tycn(ll_activo, ll_anio, ll_mes, ll_ind_indisp_mensual_tycn)
		
		dw_activos.object.imrt_compensacion_tycn[ll_cont] = ldec_cte_imrt
		
		if ldec_horas_a_compensar > 0 then 
			ll_ind_mida = 1
		else
			ll_ind_mida = 0 
		end if
			
		ldec_coste_ens = inv_calculos_stn.uf_calcular_compensacion_ens(ll_activo, ldate_fecha_desde, ldate_fecha_hasta, ldec_imr, ll_ind_mida)
		//El coste por ENS no debe superar el 60% de los ingresos mensuales regulados. El restante debe permanecer
		//en la bbdd y continuar asign$$HEX1$$e100$$ENDHEX$$ndose en los pr$$HEX1$$f300$$ENDHEX$$ximos meses
		ldec_ingresos = ldec_imr * ldec_cte_imrt * ldec_horas_a_compensar 
		
		//Miramos si hay CANO pendiente del mes anterior. 
		ll_mes_aux = ll_mes - 1
		ll_anio_aux = ll_anio 	
		if ll_mes_aux = 0 then 
			ll_mes_aux = 12
			ll_anio_aux = ll_anio - 1				
		end if	


		SELECT NVL(CANO_PENDIENTE, 0)
		  INTO :ldec_cano_pendiente
		  FROM GI_INDICADORES_STN
		 WHERE CODIGO_ACTIVO = :ll_activo
		   AND ANIO = :ll_anio
			AND MES = :ll_mes;
		
		if isnull(ldec_cano_pendiente) then ldec_cano_pendiente = 0.0
		
		ldec_compensacion = ldec_coste_ens + ldec_cano_pendiente 				
		ldec_auxiliar = 0.6 * ldec_ingresos
		
		if ldec_compensacion > ldec_auxiliar then 
			ldec_cano = ldec_auxiliar
			ldec_cano_pendiente = ldec_compensacion - ldec_cano
		end if
		
		dw_activos.object.cano[ll_cont] = ldec_cano		
		dw_activos.object.cano_pendiente[ll_cont] = ldec_cano_pendiente
				
	end for
	
	inv_calculos_stn.uf_calcular_indices_grupos_activos(dw_activos)

end if

uf_filtrar_activos_str()


dw_activos.SetRedraw(true)
end event

type cb_cierremensual from commandbutton within u_activos_str_indices_metas
boolean visible = false
integer x = 2935
integer y = 1576
integer width = 421
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cierre &Mensual"
end type

event clicked;
int li_status 
long ll_cont, ll_rows



li_status = dw_activos.Update()

if li_status = 1 then
	commit; 
else 
	rollback; 
end if
end event

type cb_filtrar from commandbutton within u_activos_str_indices_metas
integer x = 2994
integer y = 152
integer width = 421
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;

uf_filtrar_activos()
		
dw_activos.SetRedraw(True)		
		
end event

type dw_activos from datawindow within u_activos_str_indices_metas
integer x = 18
integer y = 292
integer width = 3442
integer height = 1260
integer taborder = 20
string title = "none"
string dataobject = "d_stn_indices_metas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;
long ll_row
string ls_select

date ldate_f_actual

this.SetTransObject(SQLCA)

is_virgin_select = this.GetSQLSelect()






end event

event clicked;
//
//long ll_fila_actual
//
//IF row > 0 then 
//
//	ll_fila_actual = row
//	
//	
//	if ll_fila_actual <> il_row then 
//		
//		dw_activos.SelectRow(il_row, false)
//		dw_activos.SelectRow(ll_fila_actual, true)
//		
//		il_row = ll_fila_actual
//		
//		Parent.PostEvent('ue_clicked')	
//		
//	end if
//		
//end if		
//
end event

event doubleclicked;
IF row > 0 then 
 openwithparm(w_stn_detalle_indicadores_response, dw_activos)
end if
end event

type dw_periodo from datawindow within u_activos_str_indices_metas
integer x = 55
integer y = 56
integer width = 709
integer height = 184
integer taborder = 20
string title = "none"
string dataobject = "d_indicadores_anio_mes"
boolean border = false
boolean livescroll = true
end type

event itemchanged;
long ll_null
setnull(ll_null)

this.AcceptText()

if dwo.name = 'anio' or dwo.name = 'mes' then 
	ib_ind_find = false
	this.object.nombre_activo[1] = ''
	this.object.tipo_activo[1] = ll_null
end if

this.AcceptText()	


end event

event constructor;

long ll_anio, ll_mes
long ll_anio_actual, ll_mes_actual

ll_anio_actual = year(today())
ll_mes_actual = month(today())

SELECT NVL(MAX(ANIO), :ll_anio_actual)
  INTO :ll_anio
  FROM GI_INDICADORES_STN;
  
SELECT NVL(MAX(MES), :ll_mes_actual)
  INTO :ll_mes
  FROM GI_INDICADORES_STN
 WHERE ANIO = :ll_anio;

dw_periodo.InsertRow(0)
dw_periodo.object.anio[1] = ll_anio
dw_periodo.object.mes[1]  = ll_mes




  
  
  

  
  
  
  
end event

type gb_1 from groupbox within u_activos_str_indices_metas
integer x = 1390
integer width = 2066
integer height = 276
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within u_activos_str_indices_metas
integer x = 14
integer width = 1321
integer height = 276
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type


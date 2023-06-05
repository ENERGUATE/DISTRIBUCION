HA$PBExportHeader$u_config_activos_datos_scic.sru
forward
global type u_config_activos_datos_scic from userobject
end type
type cb_grabar from commandbutton within u_config_activos_datos_scic
end type
type cb_cancelar from commandbutton within u_config_activos_datos_scic
end type
type dw_filtro from datawindow within u_config_activos_datos_scic
end type
type gb_1 from groupbox within u_config_activos_datos_scic
end type
type cb_buscar from commandbutton within u_config_activos_datos_scic
end type
type dw_activos from datawindow within u_config_activos_datos_scic
end type
end forward

global type u_config_activos_datos_scic from userobject
integer width = 2967
integer height = 1572
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_clicked ( )
cb_grabar cb_grabar
cb_cancelar cb_cancelar
dw_filtro dw_filtro
gb_1 gb_1
cb_buscar cb_buscar
dw_activos dw_activos
end type
global u_config_activos_datos_scic u_config_activos_datos_scic

type variables


string is_virgin_select
string is_select
long   il_row
end variables

forward prototypes
public subroutine uf_set_disponibilidad (long pl_disponibilidad, long pl_fila)
public function long uf_get_fila_seleccionada ()
public function long uf_get_nro_instalacion ()
public function string uf_get_nombre_instalacion ()
public subroutine uf_set_disponibilidad (long pl_disponibilidad)
public subroutine fw_select_fila (long pl_fila)
public function long uf_get_disponibilidad ()
public subroutine uf_set_operatividad (long pl_operatividad, long pl_fila)
public function long uf_get_operatividad ()
end prototypes

public subroutine uf_set_disponibilidad (long pl_disponibilidad, long pl_fila);
long ll_rows

ll_rows = dw_activos.RowCount()

if pl_fila <= ll_rows AND pl_fila > 0 then 
	
	dw_activos.object.disponibilidad_act[pl_fila] = pl_disponibilidad
	
end if
end subroutine

public function long uf_get_fila_seleccionada ();return il_row
end function

public function long uf_get_nro_instalacion ();return dw_activos.object.nro_instalacion[il_row]
end function

public function string uf_get_nombre_instalacion ();return dw_activos.object.nombre[il_row]
end function

public subroutine uf_set_disponibilidad (long pl_disponibilidad);
uf_set_disponibilidad(pl_disponibilidad, il_row)


end subroutine

public subroutine fw_select_fila (long pl_fila);
long ll_fila_actual

ll_fila_actual = dw_activos.GetRow()

if ll_fila_actual > 0 then 
	dw_activos.SelectRow(ll_fila_actual, false)
end if

dw_activos.SelectRow(pl_fila, true)

il_row = pl_fila
	
		

end subroutine

public function long uf_get_disponibilidad ();return dw_activos.object.disponibilidad_act[il_row]
end function

public subroutine uf_set_operatividad (long pl_operatividad, long pl_fila);
long ll_rows

ll_rows = dw_activos.RowCount()

if pl_fila <= ll_rows then 
	
	dw_activos.object.operatividad[pl_fila] = pl_operatividad
	
end if
end subroutine

public function long uf_get_operatividad ();return dw_activos.object.operatividad[il_row]
end function

on u_config_activos_datos_scic.create
this.cb_grabar=create cb_grabar
this.cb_cancelar=create cb_cancelar
this.dw_filtro=create dw_filtro
this.gb_1=create gb_1
this.cb_buscar=create cb_buscar
this.dw_activos=create dw_activos
this.Control[]={this.cb_grabar,&
this.cb_cancelar,&
this.dw_filtro,&
this.gb_1,&
this.cb_buscar,&
this.dw_activos}
end on

on u_config_activos_datos_scic.destroy
destroy(this.cb_grabar)
destroy(this.cb_cancelar)
destroy(this.dw_filtro)
destroy(this.gb_1)
destroy(this.cb_buscar)
destroy(this.dw_activos)
end on

type cb_grabar from commandbutton within u_config_activos_datos_scic
integer x = 2574
integer y = 1328
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Grabar"
end type

event clicked;
boolean lb_status = true
int li_status
long ll_rows, ll_cont

ll_rows = dw_activos.RowCount()

ll_cont = 0 

do while ( (ll_cont < ll_rows) and (lb_status = true) )

	ll_cont++
	
	if isnull(dw_activos.object.coste_reconocido[ll_cont]) or &
		isnull(dw_activos.object.tasa_retorno[ll_cont]) or &
		isnull(dw_activos.object.vida_util[ll_cont]) then 
		
		lb_status = false
		
		messagebox("","Error en el registro " + string( ll_cont) + ". Hay valores nulos", Exclamation!, ok!)
		
	end if
			
loop
 
if lb_status = true then 
	
	li_status = dw_activos.Update()
	
	if li_status <> 1 then
		messagebox("","Error al grabar en la base de datos. Consulte con el administrador", Exclamation!, ok!)
	else
		commit;		
	end if

end if
end event

type cb_cancelar from commandbutton within u_config_activos_datos_scic
integer x = 2574
integer y = 1444
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;
parent.SetRedraw(False)

dw_activos.Reset()
dw_activos.SetSQLSelect(is_select)

dw_activos.Retrieve()

parent.SetRedraw(True)



end event

type dw_filtro from datawindow within u_config_activos_datos_scic
integer x = 59
integer y = 56
integer width = 1563
integer height = 244
integer taborder = 20
string title = "none"
string dataobject = "d_config_filtro_activos_disponibilidades"
boolean border = false
boolean livescroll = true
end type

event constructor;
datawindowchild ldwch_zona

this.SetRedraw(False)
dw_filtro.InsertRow(0)

this.GetChild('cod_zona', ldwch_zona)

ldwch_zona.SetTransObject(SQLCA)
ldwch_zona.Retrieve()

ldwch_zona.InsertRow(1)
ldwch_zona.SetItem(1, 'cod_zona', 9999)
ldwch_zona.SetItem(1, 'nom_zona', 'Todos')


this.SetRedraw(True)
end event

type gb_1 from groupbox within u_config_activos_datos_scic
integer x = 37
integer width = 2277
integer height = 320
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

type cb_buscar from commandbutton within u_config_activos_datos_scic
integer x = 1975
integer y = 208
integer width = 306
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;
boolean lb_instalacion = true, lb_subestacion = true,  lb_zona = true

long ll_cod_zona
string ls_instalacion
string ls_where_subestacion, ls_where_instalacion, ls_where_zona
string ls_where, ls_from 

dw_filtro.AcceptText()

if isnull(dw_filtro.object.instalacion[1]) or dw_filtro.object.instalacion[1] = '' then 
	lb_instalacion = false
else
	ls_where_instalacion = " SGD_DISPONIBILIDAD.NOMBRE LIKE '" + dw_filtro.object.instalacion[1] + "%'"
end if

if isnull(dw_filtro.object.subestacion[1]) or dw_filtro.object.subestacion[1] = '' then 
	lb_subestacion = false
else
	ls_instalacion = "'" + dw_filtro.object.subestacion[1] + "%'"
	ls_from = ", VISTA_DISP_SUBESTACIONES"
	ls_where_subestacion  = " VISTA_DISP_SUBESTACIONES.NOM_SUBESTACION LIKE " + ls_instalacion
	ls_where_subestacion +=  " AND VISTA_DISP_SUBESTACIONES.CODIGO = SGD_DISPONIBILIDAD.NRO_INSTALACION "
end if

if isnull(dw_filtro.object.cod_zona[1]) or dw_filtro.object.cod_zona[1] = 9999 then 
	lb_zona = false
else
	ll_cod_zona = 	dw_filtro.object.cod_zona[1] 
	ls_from = ls_from + ', VISTA_DISP_ZONAS '
	ls_where_zona  = " VISTA_DISP_ZONAS.ZONA = " + STRING(ll_cod_zona)
	ls_where_zona += " AND VISTA_DISP_ZONAS.CODIGO = SGD_DISPONIBILIDAD.NRO_INSTALACION"	
end if

//Vamos a montar la where.	
if lb_instalacion or  lb_subestacion or lb_zona then 
	ls_where = " WHERE "
	if lb_instalacion then
		ls_where += ls_where_instalacion
	end if
	
	if lb_subestacion then 
		if lb_instalacion then ls_where += " AND "

		ls_where += ls_where_subestacion
	end if
	
	if lb_zona then 
		if lb_instalacion or lb_subestacion then ls_where += " AND "
		
		ls_where += ls_where_zona
	end if
end if
		
//if ls_subestacion <> '' or ls_instalacion <> '' then 
//	ls_where = ' WHERE '
//	
//	if ls_instalacion <> '' then 
//		ls_where += " NOMBRE LIKE '" + ls_instalacion + "%'"
//	end if
//	
//end if

is_select = is_virgin_select + ls_from + ls_where
is_select += ' ORDER BY SGD_DISPONIBILIDAD.NOMBRE'

dw_activos.SetRedraw(false)

dw_activos.Reset()
dw_activos.SetSQLSelect(is_select)

dw_activos.Retrieve()

dw_activos.SetRedraw(true)
		
end event

type dw_activos from datawindow within u_config_activos_datos_scic
integer x = 37
integer y = 352
integer width = 2496
integer height = 1188
integer taborder = 20
string title = "none"
string dataobject = "d_config_datos_lista_activos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;
long ll_row
string ls_select

this.SetTransObject(SQLCA)

is_virgin_select = this.GetSQLSelect()

is_select = is_virgin_select + " order by nombre"

this.SetSQLSelect(is_select)

this.Retrieve()




end event

event clicked;

long ll_fila_actual

IF row > 0 then 

	ll_fila_actual = row
	
	
	if ll_fila_actual <> il_row then 
		
		dw_activos.SelectRow(il_row, false)
		dw_activos.SelectRow(ll_fila_actual, true)
		
		il_row = ll_fila_actual
		
		Parent.PostEvent('ue_clicked')	
		
	end if
		
end if		

end event


HA$PBExportHeader$u_activos.sru
forward
global type u_activos from userobject
end type
type dw_filtro from datawindow within u_activos
end type
type gb_1 from groupbox within u_activos
end type
type cb_buscar from commandbutton within u_activos
end type
type dw_activos from datawindow within u_activos
end type
end forward

global type u_activos from userobject
integer width = 1550
integer height = 1780
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_clicked ( )
dw_filtro dw_filtro
gb_1 gb_1
cb_buscar cb_buscar
dw_activos dw_activos
end type
global u_activos u_activos

type variables


string is_virgin_select
long   il_row = 1
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
public subroutine uf_set_operatividad (long pl_operatividad)
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

public function long uf_get_nro_instalacion ();
return dw_activos.object.nro_instalacion[il_row]


//long ll_fila_actual
//
//ll_fila_actual = dw_activos.GetRow()
//
//if ll_fila_actual <= 0 then
//
//	return dw_activos.object.nro_instalacion[il_row]
//else 
//	return 0
//end if
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

//AHM (16/04/2010) Error en la busqueda y por equivocaci$$HEX1$$f300$$ENDHEX$$n se pulsa guardar
if pl_fila <= ll_rows AND pl_fila > 0 then 
	
	dw_activos.object.operatividad[pl_fila] = pl_operatividad
	
end if
end subroutine

public function long uf_get_operatividad ();return dw_activos.object.operatividad[il_row]
end function

public subroutine uf_set_operatividad (long pl_operatividad);
uf_set_operatividad(pl_operatividad, il_row)


end subroutine

on u_activos.create
this.dw_filtro=create dw_filtro
this.gb_1=create gb_1
this.cb_buscar=create cb_buscar
this.dw_activos=create dw_activos
this.Control[]={this.dw_filtro,&
this.gb_1,&
this.cb_buscar,&
this.dw_activos}
end on

on u_activos.destroy
destroy(this.dw_filtro)
destroy(this.gb_1)
destroy(this.cb_buscar)
destroy(this.dw_activos)
end on

type dw_filtro from datawindow within u_activos
integer x = 46
integer y = 56
integer width = 1431
integer height = 284
integer taborder = 20
string title = "none"
string dataobject = "d_filtro_activos_disponibilidades"
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

type gb_1 from groupbox within u_activos
integer x = 23
integer width = 1490
integer height = 404
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

type cb_buscar from commandbutton within u_activos
integer x = 1170
integer y = 288
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
string ls_where, ls_select, ls_from 

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

ls_select = is_virgin_select + ls_from + ls_where
ls_select += ' ORDER BY SGD_DISPONIBILIDAD.NOMBRE'

dw_activos.SetRedraw(false)

dw_activos.Reset()
dw_activos.SetSQLSelect(ls_select)

dw_activos.Retrieve()

dw_activos.SetRedraw(true)
		
end event

type dw_activos from datawindow within u_activos
integer x = 27
integer y = 408
integer width = 1490
integer height = 1348
integer taborder = 20
string title = "none"
string dataobject = "d_lista_activos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;
long ll_row
string ls_select

this.SetTransObject(SQLCA)

is_virgin_select = this.GetSQLSelect()

ls_select = is_virgin_select + " order by nombre"

this.SetSQLSelect(ls_select)

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


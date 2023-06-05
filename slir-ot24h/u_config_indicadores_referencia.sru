HA$PBExportHeader$u_config_indicadores_referencia.sru
forward
global type u_config_indicadores_referencia from userobject
end type
type cb_agregar from commandbutton within u_config_indicadores_referencia
end type
type ddlb_nivel_tension from dropdownlistbox within u_config_indicadores_referencia
end type
type ddlb_grupo_calidad from dropdownlistbox within u_config_indicadores_referencia
end type
type ddlb_anio from dropdownlistbox within u_config_indicadores_referencia
end type
type st_4 from statictext within u_config_indicadores_referencia
end type
type st_grupo_calidad from statictext within u_config_indicadores_referencia
end type
type st_2 from statictext within u_config_indicadores_referencia
end type
type st_1 from statictext within u_config_indicadores_referencia
end type
type ddlb_trimestre from dropdownlistbox within u_config_indicadores_referencia
end type
type dw_indicadores from datawindow within u_config_indicadores_referencia
end type
type cb_grabar from commandbutton within u_config_indicadores_referencia
end type
type cb_cancelar from commandbutton within u_config_indicadores_referencia
end type
type gb_1 from groupbox within u_config_indicadores_referencia
end type
type cb_buscar from commandbutton within u_config_indicadores_referencia
end type
end forward

global type u_config_indicadores_referencia from userobject
integer width = 3013
integer height = 1572
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_clicked ( )
cb_agregar cb_agregar
ddlb_nivel_tension ddlb_nivel_tension
ddlb_grupo_calidad ddlb_grupo_calidad
ddlb_anio ddlb_anio
st_4 st_4
st_grupo_calidad st_grupo_calidad
st_2 st_2
st_1 st_1
ddlb_trimestre ddlb_trimestre
dw_indicadores dw_indicadores
cb_grabar cb_grabar
cb_cancelar cb_cancelar
gb_1 gb_1
cb_buscar cb_buscar
end type
global u_config_indicadores_referencia u_config_indicadores_referencia

type variables


string is_virgin_select
string is_select
long   il_row

boolean ib_valor_modified
end variables

forward prototypes
public subroutine fw_select_fila (long pl_fila)
end prototypes

public subroutine fw_select_fila (long pl_fila);
long ll_fila_actual

ll_fila_actual = dw_indicadores.GetRow()

if ll_fila_actual > 0 then 
	dw_indicadores.SelectRow(ll_fila_actual, false)
end if

dw_indicadores.SelectRow(pl_fila, true)

il_row = pl_fila
	
		

end subroutine

on u_config_indicadores_referencia.create
this.cb_agregar=create cb_agregar
this.ddlb_nivel_tension=create ddlb_nivel_tension
this.ddlb_grupo_calidad=create ddlb_grupo_calidad
this.ddlb_anio=create ddlb_anio
this.st_4=create st_4
this.st_grupo_calidad=create st_grupo_calidad
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_trimestre=create ddlb_trimestre
this.dw_indicadores=create dw_indicadores
this.cb_grabar=create cb_grabar
this.cb_cancelar=create cb_cancelar
this.gb_1=create gb_1
this.cb_buscar=create cb_buscar
this.Control[]={this.cb_agregar,&
this.ddlb_nivel_tension,&
this.ddlb_grupo_calidad,&
this.ddlb_anio,&
this.st_4,&
this.st_grupo_calidad,&
this.st_2,&
this.st_1,&
this.ddlb_trimestre,&
this.dw_indicadores,&
this.cb_grabar,&
this.cb_cancelar,&
this.gb_1,&
this.cb_buscar}
end on

on u_config_indicadores_referencia.destroy
destroy(this.cb_agregar)
destroy(this.ddlb_nivel_tension)
destroy(this.ddlb_grupo_calidad)
destroy(this.ddlb_anio)
destroy(this.st_4)
destroy(this.st_grupo_calidad)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_trimestre)
destroy(this.dw_indicadores)
destroy(this.cb_grabar)
destroy(this.cb_cancelar)
destroy(this.gb_1)
destroy(this.cb_buscar)
end on

type cb_agregar from commandbutton within u_config_indicadores_referencia
integer x = 2597
integer y = 888
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

event clicked;


long ll_row, ll_rows, ll_new_row, ll_cont

ll_row = dw_indicadores.GetSelectedRow(0)
ll_rows = dw_indicadores.RowCount()

if ll_row > 0 then	
	
	ll_new_row = dw_indicadores.insertrow(ll_row +1)

	if not isnull(ddlb_anio.text) or ddlb_anio.text <> '' then 
		dw_indicadores.object.anio[ll_new_row] = long(ddlb_anio.text)
	end if
	
	if not isnull(ddlb_trimestre.text)  or ddlb_trimestre.text <> '' then  
		dw_indicadores.object.trimestre[ll_new_row] = long(ddlb_trimestre.text)
	end if

	if not isnull(ddlb_nivel_tension.text)  or ddlb_nivel_tension.text <> '' then  
		dw_indicadores.object.nivel_tension[ll_new_row] = long(ddlb_nivel_tension.text)
	end if
	
	if not isnull(ddlb_grupo_calidad.text)  or ddlb_grupo_calidad.text <> '' then  
		dw_indicadores.object.grupo_calidad[ll_new_row] = long(ddlb_grupo_calidad.text)
	end if
		
	ib_valor_modified = true
//	f_habilitar('GRABAR',TRUE)
	//f_habilitar('CANCELAR',TRUE)
	
else
	
	ll_row = dw_indicadores.InsertRow(0)
	dw_indicadores.ScrollToRow(ll_row)
	
	if not isnull(ddlb_anio.text)  then 
		dw_indicadores.object.anio[ll_row] = long(ddlb_anio.text)
	end if
	
	if not isnull(ddlb_trimestre.text)  then 
		dw_indicadores.object.trimestre[ll_row] = long(ddlb_trimestre.text)
	end if

	if not isnull(ddlb_nivel_tension.text)  then 
		dw_indicadores.object.nivel_tension[ll_row] = long(ddlb_nivel_tension.text)
	end if
	
	if not isnull(ddlb_grupo_calidad.text)  then 
		dw_indicadores.object.grupo_calidad[ll_row] = long(ddlb_grupo_calidad.text)
	end if
	
	ib_valor_modified = true
	//f_habilitar('GRABAR',TRUE)
	//f_habilitar('CANCELAR',TRUE)
		
end if


end event

type ddlb_nivel_tension from dropdownlistbox within u_config_indicadores_referencia
integer x = 78
integer y = 456
integer width = 329
integer height = 312
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean vscrollbar = true
string item[] = {"","1","2"}
borderstyle borderstyle = styleraised!
end type

type ddlb_grupo_calidad from dropdownlistbox within u_config_indicadores_referencia
integer x = 78
integer y = 632
integer width = 329
integer height = 348
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean vscrollbar = true
string item[] = {"","1","2","3","4"}
borderstyle borderstyle = styleraised!
end type

type ddlb_anio from dropdownlistbox within u_config_indicadores_referencia
integer x = 78
integer y = 104
integer width = 329
integer height = 440
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean vscrollbar = true
string item[] = {"2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025"}
borderstyle borderstyle = styleraised!
end type

type st_4 from statictext within u_config_indicadores_referencia
integer x = 78
integer y = 404
integer width = 471
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nivel de Tensi$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type st_grupo_calidad from statictext within u_config_indicadores_referencia
integer x = 78
integer y = 580
integer width = 475
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo de Calidad"
boolean focusrectangle = false
end type

type st_2 from statictext within u_config_indicadores_referencia
integer x = 78
integer y = 56
integer width = 187
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "A$$HEX1$$f100$$ENDHEX$$o"
boolean focusrectangle = false
end type

type st_1 from statictext within u_config_indicadores_referencia
integer x = 78
integer y = 228
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trimestre"
boolean focusrectangle = false
end type

type ddlb_trimestre from dropdownlistbox within u_config_indicadores_referencia
integer x = 78
integer y = 280
integer width = 329
integer height = 440
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean vscrollbar = true
string item[] = {"","1","2","3","4"}
borderstyle borderstyle = styleraised!
end type

type dw_indicadores from datawindow within u_config_indicadores_referencia
integer x = 622
integer y = 32
integer width = 1925
integer height = 1496
integer taborder = 30
string title = "none"
string dataobject = "d_config_indicadores_sdl_de_referencia"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;
long ll_row
string ls_select

this.SetTransObject(SQLCA)

is_virgin_select = this.GetSQLSelect()

is_select = is_virgin_select + " order by anio, trimestre, nivel_tension, grupo_calidad "

this.SetSQLSelect(is_select)

this.Retrieve()


end event

event clicked;

long ll_fila_actual

IF row > 0 then 

	ll_fila_actual = row
	
	
	if ll_fila_actual <> il_row then 
		
		this.SelectRow(il_row, false)
		this.SelectRow(ll_fila_actual, true)
		
		il_row = ll_fila_actual
		

	end if
		
end if		

end event

type cb_grabar from commandbutton within u_config_indicadores_referencia
integer x = 2597
integer y = 1320
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
long ll_rows, ll_cont, ll_count
long ll_anio,	ll_trimestre, ll_nivel_tension, ll_grupo_calidad
string ls_find
dwItemStatus ldwis_status

dw_indicadores.AcceptText()
ll_rows = dw_indicadores.RowCount()

ll_cont = 0 

do while ( (ll_cont < ll_rows) and (lb_status = true) )

	ll_cont++
	
	if isnull(dw_indicadores.object.anio[ll_cont]) or &
		isnull(dw_indicadores.object.trimestre[ll_cont]) or &
		isnull(dw_indicadores.object.nivel_tension[ll_cont]) or &
		isnull(dw_indicadores.object.grupo_calidad[ll_cont]) or &
		isnull(dw_indicadores.object.irg[ll_cont]) then 
		
		lb_status = false
		
		messagebox("","Error en el registro " + string( ll_cont) + ". Hay valores nulos", Exclamation!, ok!)
	else
		
		ldwis_status = dw_indicadores.GetItemStatus(ll_cont, 0, Primary!)
		
		if (ldwis_status = New! or ldwis_status = NewModified! ) then 
			
			ll_anio = dw_indicadores.object.anio[ll_cont]
			ll_trimestre = dw_indicadores.object.trimestre[ll_cont]
			ll_nivel_tension = dw_indicadores.object.nivel_tension[ll_cont]
			ll_grupo_calidad = dw_indicadores.object.grupo_calidad[ll_cont]
			
			
			ls_find  = ' ANIO = ' + string(ll_anio)
			ls_find += ' AND TRIMESTRE = ' + string(ll_trimestre)
			ls_find += ' AND NIVEL_TENSION = ' + string(ll_nivel_tension)
			ls_find += ' AND GRUPO_CALIDAD = ' + string(ll_grupo_calidad)
			
			ll_count = dw_indicadores.Find(ls_find, 1, (ll_cont - 1)) 
			
			if ll_count <> 0 then 
				lb_status = false
				messagebox("","Error en el registro " + string( ll_cont) + ". Coincide con el registro "+ string( ll_count), Exclamation!, ok!)
			
			else
				
				
				SELECT count(*)
				  INTO :ll_count
				  FROM GI_INDICADORES_SDL
				 WHERE ANIO = :ll_anio
					AND TRIMESTRE = :ll_trimestre
					AND NIVEL_TENSION = :ll_nivel_tension 
					AND GRUPO_CALIDAD =:ll_grupo_calidad;
					
				if ll_count > 0 then 
					lb_status = false
					messagebox("","Error en el registro " + string( ll_cont) + ". Se ha insertado un nuevo registro que ya existe en bbdd", Exclamation!, ok!)
				end if
			end if
		end if
		
	end if
			
loop
 
if lb_status = true then 
	
	li_status = dw_indicadores.Update()
	
	if li_status <> 1 then
		messagebox("","Error al grabar en la base de datos. Consulte con el administrador", Exclamation!, ok!)
	else
		commit;		
	end if

end if
end event

type cb_cancelar from commandbutton within u_config_indicadores_referencia
integer x = 2597
integer y = 1436
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

dw_indicadores.Reset()
dw_indicadores.SetSQLSelect(is_select)

dw_indicadores.Retrieve()

parent.SetRedraw(True)



end event

type gb_1 from groupbox within u_config_indicadores_referencia
integer x = 37
integer y = 4
integer width = 530
integer height = 1044
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

type cb_buscar from commandbutton within u_config_indicadores_referencia
integer x = 151
integer y = 888
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
boolean lb_where = false
boolean lb_anio = false
boolean lb_trimestre = false
boolean lb_grupo_calidad = false
boolean lb_nivel_tension = false

long ll_cod_zona
string ls_where_anio, ls_where_trimestre, ls_where_grupo_calidad, ls_where_nivel_tension
string ls_where


if ( not isnull(ddlb_anio.text) AND  (ddlb_anio.text <> '') )  then 
	lb_anio = true
	ls_where_anio = ' ANIO = ' + ddlb_anio.text 
end if

if ( not isnull(ddlb_trimestre.text) AND  (ddlb_trimestre.text <> '') ) then 
	lb_trimestre = true
	ls_where_trimestre = ' TRIMESTRE = ' + ddlb_trimestre.text 
end if

if ( not isnull(ddlb_nivel_tension.text) AND  (ddlb_nivel_tension.text <> '') ) then 
	lb_nivel_tension = true
	ls_where_nivel_tension = ' NIVEL_TENSION = ' + ddlb_nivel_tension.text 
end if

if ( not isnull(ddlb_grupo_calidad.text) AND  (ddlb_grupo_calidad.text <> '') ) then 
	lb_grupo_calidad = true
	ls_where_grupo_calidad = ' GRUPO_CALIDAD = ' + ddlb_grupo_calidad.text 
end if


//Vamos a montar la where.	
IF lb_anio OR lb_trimestre OR lb_nivel_tension OR lb_grupo_calidad then 
	ls_where = " WHERE "
	
	if lb_anio then
		ls_where += ls_where_anio
	end if
	
	if lb_trimestre then 
		if lb_anio then ls_where += " AND "
		ls_where += ls_where_trimestre
	end if
	
	if lb_nivel_tension then 
		if lb_anio or lb_trimestre then ls_where += " AND "
		ls_where += ls_where_nivel_tension
	end if	
	
	if lb_grupo_calidad then 
		if lb_anio or lb_trimestre or lb_nivel_tension then ls_where += " AND "
		ls_where += ls_where_grupo_calidad
	end if
	
end if
		
is_select = is_virgin_select + ls_where
is_select += ' ORDER BY ANIO, TRIMESTRE, NIVEL_TENSION, GRUPO_CALIDAD'

dw_indicadores.SetRedraw(false)

dw_indicadores.Reset()
dw_indicadores.SetSQLSelect(is_select)

dw_indicadores.Retrieve()

dw_indicadores.SetRedraw(true)
		
end event


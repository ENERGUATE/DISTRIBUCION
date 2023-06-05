HA$PBExportHeader$u_config_parametros_genericos_scic.sru
forward
global type u_config_parametros_genericos_scic from userobject
end type
type cb_editar from commandbutton within u_config_parametros_genericos_scic
end type
type cb_eliminar from commandbutton within u_config_parametros_genericos_scic
end type
type cb_agregar from commandbutton within u_config_parametros_genericos_scic
end type
type cb_cancelar from commandbutton within u_config_parametros_genericos_scic
end type
type cb_grabar from commandbutton within u_config_parametros_genericos_scic
end type
type dw_valores from datawindow within u_config_parametros_genericos_scic
end type
type dw_parametros from datawindow within u_config_parametros_genericos_scic
end type
end forward

global type u_config_parametros_genericos_scic from userobject
integer width = 2894
integer height = 1560
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_grabar ( )
cb_editar cb_editar
cb_eliminar cb_eliminar
cb_agregar cb_agregar
cb_cancelar cb_cancelar
cb_grabar cb_grabar
dw_valores dw_valores
dw_parametros dw_parametros
end type
global u_config_parametros_genericos_scic u_config_parametros_genericos_scic

type variables

long il_row_selected
boolean ib_valor_modified = FALSE, ib_editar = FALSE
string is_virgin_select
datastore ids_proceso

boolean ib_parametro_modified = FALSE
long il_new_parametro
end variables

forward prototypes
public subroutine f_habilitar_campos (boolean ab_habilitar)
public function long f_comprobar_valores ()
public subroutine f_grabar ()
public subroutine uf_grabar ()
public subroutine uf_agregar ()
public subroutine uf_cancelar ()
public subroutine uf_editar ()
public subroutine uf_eliminar ()
end prototypes

public subroutine f_habilitar_campos (boolean ab_habilitar);

//////////////////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n:	f_habilitar_campos
//// 
//// Objetivo:	habilita o inhabilita los campos seg$$HEX1$$fa00$$ENDHEX$$n la consulta
////	
//// Par$$HEX1$$e100$$ENDHEX$$metros: ab_habilitar--> Habilita o deshabilita
////						
//// Devuelve:	--
////
////	Fecha			Resp.								Actuaci$$HEX1$$f300$$ENDHEX$$n
////	-----			-----								---------
////
//////////////////////////////////////////////////////////////////////////
//// VARIABLES LOCALES
////


long ll_cont, ll_rows

ll_rows = dw_valores.RowCount()

if ll_rows < 1 then 
	return
end if


	
IF ab_habilitar THEN
		
		dw_valores.Modify("valor.Protect='1~t if(getrow()="+string(1)+",0,1)'")
		dw_valores.Modify("valor.Border='1~t if(getrow()="+string(1)+",5,0)'")
		dw_valores.Modify("valor.Background.Color='1~t if(getrow()="+string(1)+","+string(gs_blanco)+","+string(gs_gris)+")'")

		dw_valores.Modify("f_hasta.Protect='1~t if(getrow()="+string(1)+",0,1)'")
		dw_valores.Modify("f_hasta.Border='1~t if(getrow()="+string(1)+",5,0)'")
		dw_valores.Modify("f_hasta.Background.Color='1~t if(getrow()="+string(1)+","+string(gs_blanco)+","+string(gs_gris)+")'")

		
		dw_valores.SetColumn('f_desde')
		dw_valores.SetFocus()

ELSE
		dw_valores.Object.valor.Protect = 1
		dw_valores.Object.f_hasta.Protect = 1
		dw_valores.Object.f_desde.Protect = 1
		dw_valores.Object.valor.Border = 0
		dw_valores.Object.f_hasta.Border = 0
		dw_valores.Object.f_desde.Border = 0
		dw_valores.Object.valor.Background.Color = long(gs_gris)
		dw_valores.Object.f_desde.Background.Color = long(gs_gris)
		dw_valores.Object.f_hasta.Background.Color = long(gs_gris)
END IF
	
//END CHOOSE
end subroutine

public function long f_comprobar_valores ();



datetime ldate_f_desde, ldate_f_hasta

string ls_valor1
long ll_cont, ll_rows, ll_row, ll_return = 0

ll_rows = dw_valores.RowCount()
if ll_rows = 0 then
	return -1
end if

dw_valores.object.f_desde[1] = datetime(date('1/1/2000'))
dw_valores.object.f_hasta[ll_rows] = datetime(date('31/12/2999'))
dw_valores.AcceptText()

ll_cont = 0
do while ((ll_cont < ll_rows) and (ll_return >= 0))
	ll_cont++
	
	if ((isnull(dw_valores.object.valor[ll_cont])) )  then
		 
		messagebox("","El valor es nulo.", Exclamation!, OK!)		
		ll_return = -1
		
	end if		 	
	
	if ((isnull(dw_valores.object.f_desde[ll_cont])) or &
		 (isnull(dw_valores.object.f_hasta[ll_cont])) )   then
		 
		messagebox("","Error en los valores de fechas.", Exclamation!, OK!)		
		ll_return =  -1
		
	end if	
	
	if ((dw_valores.object.f_desde[ll_cont] = datetime(date('00/00/0000'))) or &
		 (dw_valores.object.f_hasta[ll_cont] = datetime(date('00/00/0000'))))   then
		 
		messagebox("","Error en los valores de fechas.", Exclamation!, OK!)		
		ll_return =  -1
		
	end if	
		
loop

for ll_cont = 2 to ll_rows
	dw_valores.object.f_hasta[ll_cont -1] = dw_valores.object.f_desde[ll_cont]
end for


if ((ll_return >= 0) and (ll_rows > 1)) then

	ldate_f_desde = dw_valores.object.f_desde[1]
	ldate_f_hasta = dw_valores.object.f_hasta[1]
	
	if ldate_f_desde >= ldate_f_hasta then
		messagebox("","La fecha DESDE debe ser mayor que la fecha HASTA", Exclamation!, OK!)
		ll_return = -1
	else
		ll_cont = 1
		DO WHILE ((ll_cont < ll_rows) and (ll_return >= 0))
			ll_cont ++
			
			ldate_f_desde = dw_valores.object.f_desde[ll_cont]
			ldate_f_hasta = dw_valores.object.f_hasta[ll_cont]
	
			if ldate_f_desde >= ldate_f_hasta then
				messagebox("","La fecha DESDE debe ser mayor que la fecha HASTA", Exclamation!, OK!)
				ll_return = -1
			end if
			
			if ldate_f_desde <> dw_valores.object.f_hasta[ll_cont - 1] then
				messagebox("","Existe un salto en las fechas", Exclamation!, OK!)
				ll_return = -1
			end if
		loop
	end if
end if

ll_rows = dw_parametros.RowCount()
for ll_cont=1 to ll_rows
	if ( isnull(dw_parametros.object.parametro[ll_cont]) or &
	     isnull(dw_parametros.object.descripcion[ll_cont]) ) then
		  messagebox("","Error en el alta de par$$HEX1$$e100$$ENDHEX$$metros", Exclamation!, OK!)
		  ll_return = -1
	end if
end for
	

return ll_return
end function

public subroutine f_grabar ();

long ll_status, ll_rows, ll_cont

dw_valores.AcceptText()
dw_parametros.AcceptText()

if ib_valor_modified = true then
	
//	ll_status = f_comprobar_valores()
	
	if ll_status >= 0 then
		if ib_parametro_modified = true then
			ll_status = dw_parametros.Update()
			if ll_status < 0 then
				messagebox("","No se han podido grabar las modificaciones efectuadas", Exclamation!, OK!)			
				rollback;
			end if
		end if
	end if
	
	if ll_status >= 0 then
		
		ib_parametro_modified = false
		ll_rows = dw_parametros.Rowcount()		
		for ll_cont = 1 to ll_rows			
			dw_parametros.object.switch_edicion[ll_cont] = 1
		end for
//		dw_parametros.f_seleccionar(0)
//		dw_parametros.f_seleccionar(1)
	
		ll_rows = dw_valores.Rowcount()
		for ll_cont = 1 to ll_rows
			dw_valores.object.f_actual[ll_cont] = DATETIME(today(), now())
			dw_valores.object.programa[ll_cont] = 'w_datos_scic'
			dw_valores.object.usuario[ll_cont] = gs_usuario
			dw_valores.object.switch_edicion[ll_cont] = 1
		end for
		
		
		ll_status =	dw_valores.Update()
		if ll_status >= 0 then			
			commit;
			
			ib_valor_modified = false			
			ll_rows = dw_valores.rowcount()
			for ll_cont = 1 to ll_rows
				dw_valores.object.switch_edicion[ll_cont] = 1
			end for
			
						
//			f_habilitar('GRABAR',false)
	//		f_habilitar('CANCELAR',false)
			
		else 
			messagebox("","No se han podido grabar las modificaciones efectuadas", Exclamation!, OK!)
			rollback;
		end if
	end if
end if
	


	
end subroutine

public subroutine uf_grabar ();

long ll_status, ll_rows, ll_cont

dw_valores.AcceptText()
dw_parametros.AcceptText()

if ib_valor_modified = true then
	
	ll_status = f_comprobar_valores()
	
	if ll_status >= 0 then
		if ib_parametro_modified = true then
			ll_status = dw_parametros.Update()
			if ll_status < 0 then
				messagebox("","No se han podido grabar las modificaciones efectuadas", Exclamation!, OK!)			
				rollback;
			end if
		end if
	end if
	
	if ll_status >= 0 then
		
		ib_parametro_modified = false
		ll_rows = dw_parametros.Rowcount()		
		for ll_cont = 1 to ll_rows			
			dw_parametros.object.switch_edicion[ll_cont] = 1
		end for
	
		ll_rows = dw_valores.Rowcount()
		for ll_cont = 1 to ll_rows
			dw_valores.object.f_actual[ll_cont] = DATETIME(today(), now())
			dw_valores.object.programa[ll_cont] = 'w_datos_scic'
			dw_valores.object.usuario[ll_cont] = gs_usuario
			dw_valores.object.switch_edicion[ll_cont] = 1
		end for
		
		
		ll_status =	dw_valores.Update()
		if ll_status >= 0 then			
			commit;
			
			ib_valor_modified = false			
			ll_rows = dw_valores.rowcount()
			for ll_cont = 1 to ll_rows
				dw_valores.object.switch_edicion[ll_cont] = 1
			end for
			
						
//			f_habilitar('GRABAR',false)
	//		f_habilitar('CANCELAR',false)
			
		else 
			messagebox("","No se han podido grabar las modificaciones efectuadas", Exclamation!, OK!)
			rollback;
		end if
	end if
end if
	


	
end subroutine

public subroutine uf_agregar ();


long ll_row, ll_rows, ll_new_row, ll_cont, ll_fila

ll_row = dw_valores.GetSelectedRow(0)
ll_rows = dw_valores.RowCount()

if ll_row > 0 then	
	
	ll_new_row = dw_valores.insertrow(ll_row +1)
	dw_valores.object.parametro[ll_new_row] = dw_valores.object.parametro[ll_row]
	dw_valores.object.f_desde[ll_new_row] = dw_valores.object.f_desde[ll_row]
	
	dw_valores.object.switch_edicion[ll_new_row] = 0
		
	if ll_row = ll_rows then
		dw_valores.object.f_hasta[ll_new_row] = Date("31/12/2999")
	else
		dw_valores.object.f_hasta[ll_new_row] = dw_valores.object.f_hasta[ll_row]		
	end if
	
	ib_valor_modified = true
//	f_habilitar('GRABAR',TRUE)
	//f_habilitar('CANCELAR',TRUE)
	
else
	ll_row = dw_parametros.GetSelectedRow(0)
	ll_fila = dw_valores.insertrow(0)
	dw_valores.object.parametro[ll_fila] = dw_parametros.object.parametro[ll_row]
	
	if ll_fila = 1 then 
		dw_valores.object.f_desde[ll_fila] = date("01/01/2000")
		dw_valores.object.f_hasta[ll_fila] = date("31/12/2999")
	else
		dw_valores.object.f_desde[ll_fila] = dw_valores.object.f_desde[(ll_fila - 1)]
		dw_valores.object.f_hasta[ll_fila] = date("31/12/2999")
   end if	
	

	dw_valores.object.switch_edicion[ll_fila] = 0
	
	ib_valor_modified = true
	//f_habilitar('GRABAR',TRUE)
	//f_habilitar('CANCELAR',TRUE)
		
end if

if ib_parametro_modified = true then
	ll_rows = dw_parametros.rowcount()
	for ll_cont = 1 to ll_rows
		dw_parametros.object.switch_edicion[ll_cont] = 1
	end for
//	dw_parametros.f_seleccionar(0)
//	dw_parametros.f_seleccionar(1)
	
end if

end subroutine

public subroutine uf_cancelar ();



string ls_parametro

ib_valor_modified = FALSE
//f_habilitar("CANCELAR", FALSE)
//f_habilitar("GRABAR", FALSE)

ls_parametro = dw_valores.object.parametro[1]

dw_valores.SetRedraw(FALSE)

dw_valores.Reset()
dw_valores.Retrieve(ls_parametro)

dw_valores.SetRedraw(TRUE)


end subroutine

public subroutine uf_editar ();
long ll_rows, ll_cont


ll_rows = dw_valores.RowCount()

for ll_cont = 1 to ll_rows
	dw_valores.object.switch_edicion[ll_cont] = 0
end for

end subroutine

public subroutine uf_eliminar ();



long ll_row , ll_rows

ll_row = dw_valores.getselectedrow(0)
ll_rows = dw_valores.RowCount()

if ll_rows > 1 then
	if ll_row = 1 then
		dw_valores.object.f_desde[2] = date('1/1/2000')
	else 
		if ll_row = ll_rows then
			dw_valores.object.f_hasta[ll_row - 1] = date('31/12/2999')
		else
			dw_valores.object.f_desde[ll_row + 1] = dw_valores.object.f_hasta[ll_row - 1] 
		end if
	end if
	dw_valores.deleterow(ll_row)
	
	ib_valor_modified = TRUE
	//f_habilitar('GRABAR',TRUE)
	//f_habilitar('CANCELAR',TRUE)
end if
	 



end subroutine

event constructor;
long ll_row
string ls_parametro

dw_valores.SetTransobject(SQLCA)
dw_parametros.SetTransobject(SQLCA)
dw_parametros.Retrieve()

ll_row = dw_parametros.RowCount()

if ll_row > 0 then
	dw_parametros.SelectRow(1, TRUE)
	ls_parametro =  dw_parametros.object.parametro[1]
	
	dw_valores.Reset()
	dw_valores.Retrieve(ls_parametro)
	ll_row = dw_valores.RowCount()
	if ll_row >0 then
		dw_valores.SelectRow(1, TRUE)
	end if
	
end if
end event

on u_config_parametros_genericos_scic.create
this.cb_editar=create cb_editar
this.cb_eliminar=create cb_eliminar
this.cb_agregar=create cb_agregar
this.cb_cancelar=create cb_cancelar
this.cb_grabar=create cb_grabar
this.dw_valores=create dw_valores
this.dw_parametros=create dw_parametros
this.Control[]={this.cb_editar,&
this.cb_eliminar,&
this.cb_agregar,&
this.cb_cancelar,&
this.cb_grabar,&
this.dw_valores,&
this.dw_parametros}
end on

on u_config_parametros_genericos_scic.destroy
destroy(this.cb_editar)
destroy(this.cb_eliminar)
destroy(this.cb_agregar)
destroy(this.cb_cancelar)
destroy(this.cb_grabar)
destroy(this.dw_valores)
destroy(this.dw_parametros)
end on

type cb_editar from commandbutton within u_config_parametros_genericos_scic
integer x = 2496
integer y = 692
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "E&ditar"
end type

event clicked;uf_editar()
end event

type cb_eliminar from commandbutton within u_config_parametros_genericos_scic
integer x = 2496
integer y = 804
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Eliminar"
end type

event clicked;uf_eliminar()
end event

type cb_agregar from commandbutton within u_config_parametros_genericos_scic
integer x = 2496
integer y = 572
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

event clicked;
uf_agregar()

end event

type cb_cancelar from commandbutton within u_config_parametros_genericos_scic
integer x = 2496
integer y = 1444
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;uf_cancelar()
end event

type cb_grabar from commandbutton within u_config_parametros_genericos_scic
integer x = 2496
integer y = 1328
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Grabar"
end type

event clicked;uf_grabar()
end event

type dw_valores from datawindow within u_config_parametros_genericos_scic
event ue_cancelar ( )
event ue_grabar ( )
event ue_editar ( )
event ue_eliminar ( )
integer x = 37
integer y = 568
integer width = 2304
integer height = 968
integer taborder = 20
string title = "none"
string dataobject = "d_config_parametros_scic"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event ue_grabar();

long ll_status, ll_rows, ll_cont

dw_valores.AcceptText()
dw_parametros.AcceptText()

if ib_valor_modified = true then
	
//	ll_status = f_comprobar_valores()
	
	if ll_status >= 0 then
		if ib_parametro_modified = true then
			ll_status = dw_parametros.Update()
			if ll_status < 0 then
				messagebox("","No se han podido grabar las modificaciones efectuadas", Exclamation!, OK!)			
				rollback;
			end if
		end if
	end if
	
	if ll_status >= 0 then
		
		ib_parametro_modified = false
		ll_rows = dw_parametros.Rowcount()		
		for ll_cont = 1 to ll_rows			
			dw_parametros.object.switch_edicion[ll_cont] = 1
		end for
//		dw_parametros.f_seleccionar(0)
//		dw_parametros.f_seleccionar(1)
	
		ll_rows = dw_valores.Rowcount()
		for ll_cont = 1 to ll_rows
			dw_valores.object.f_actual[ll_cont] = DATETIME(today(), now())
			dw_valores.object.programa[ll_cont] = 'w_datos_scic'
			dw_valores.object.usuario[ll_cont] = gs_usuario
			dw_valores.object.switch_edicion[ll_cont] = 1
		end for
		
		
		ll_status =	dw_valores.Update()
		if ll_status >= 0 then			
			commit;
			
			ib_valor_modified = false			
			ll_rows = dw_valores.rowcount()
			for ll_cont = 1 to ll_rows
				dw_valores.object.switch_edicion[ll_cont] = 1
			end for
			
						
//			f_habilitar('GRABAR',false)
	//		f_habilitar('CANCELAR',false)
			
		else 
			messagebox("","No se han podido grabar las modificaciones efectuadas", Exclamation!, OK!)
			rollback;
		end if
	end if
end if
	


	
end event

event itemchanged;
this.accepttext()

ib_valor_modified = TRUE

//parent.f_habilitar('grabar',TRUE)
//parent.f_habilitar('cancelar',TRUE)
end event

event clicked;		This.SelectRow(0, FALSE)
		This.SelectRow(row, TRUE)
		
end event

type dw_parametros from datawindow within u_config_parametros_genericos_scic
integer x = 37
integer y = 32
integer width = 2304
integer height = 524
integer taborder = 10
string title = "none"
string dataobject = "d_config_maestro_parametros_scic"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;

long  ll_row
string ls_parametro

if ib_parametro_modified = false or row <> il_new_parametro then

	if row > 0 then
		
		This.SelectRow(0, FALSE)
		This.SelectRow(row, TRUE)
		
		ls_parametro =  this.object.parametro[row]
		
		dw_valores.Reset()
		dw_valores.Retrieve(ls_parametro)	
		ll_row = dw_valores.GetSelectedRow(0)
		if ll_row >0 then
			dw_valores.SelectRow(ll_row, false)
		end if
		dw_valores.SelectRow(1, true)
		
	end if

else 
	messagebox("", "Debe grabar el nuevo par$$HEX1$$e100$$ENDHEX$$metro antes de seleccionar otro", Exclamation!, oK!)
end if

dw_valores.SetRedraw(TRUE)
end event


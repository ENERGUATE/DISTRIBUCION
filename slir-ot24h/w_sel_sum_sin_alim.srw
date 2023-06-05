HA$PBExportHeader$w_sel_sum_sin_alim.srw
forward
global type w_sel_sum_sin_alim from w_sgigenerica
end type
type st_titulo from statictext within w_sel_sum_sin_alim
end type
type cb_1 from commandbutton within w_sel_sum_sin_alim
end type
type cb_2 from commandbutton within w_sel_sum_sin_alim
end type
type dw_listado_sum from u_lista_sum_sin_alim within w_sel_sum_sin_alim
end type
end forward

global type w_sel_sum_sin_alim from w_sgigenerica
integer width = 1979
integer height = 1344
string title = "OPEN SGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Suministros"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 80269524
st_titulo st_titulo
cb_1 cb_1
cb_2 cb_2
dw_listado_sum dw_listado_sum
end type
global w_sel_sum_sin_alim w_sel_sum_sin_alim

type variables
Datastore ids_listado

Long il_ultima_fila = 0
end variables

on w_sel_sum_sin_alim.create
int iCurrent
call super::create
this.st_titulo=create st_titulo
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_listado_sum=create dw_listado_sum
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_titulo
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.dw_listado_sum
end on

on w_sel_sum_sin_alim.destroy
call super::destroy
destroy(this.st_titulo)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_listado_sum)
end on

event open;call super::open;//ids_listado = CREATE Datastore

ids_listado = Message.PowerObjectParm

This.PostEvent("ue_postopen")

end event

event ue_postopen;call super::ue_postopen;SetPointer(HourGlass!)
dw_listado_sum.retrieve()
SetPointer(Arrow!)
end event

event close;call super::close;CloseWithReturn(This, ids_listado)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_sel_sum_sin_alim
end type

type st_titulo from statictext within w_sel_sum_sin_alim
integer x = 32
integer y = 24
integer width = 1847
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 80269524
long backcolor = 276856960
boolean enabled = false
string text = "LISTADO DE SUMINISTROS SIN ALIMENTACI$$HEX1$$d300$$ENDHEX$$N"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_sel_sum_sin_alim
integer x = 421
integer y = 1092
integer width = 352
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;Long ll_fila, ll_fila_insertada

ll_fila = dw_listado_sum.GetSelectedRow(0)
SetPointer(HourGlass!)

dw_listado_sum.setredraw(false)

DO WHILE ll_fila > 0 
	dw_listado_sum.ScrollToRow(ll_fila)
	
	ll_fila_insertada = ids_listado.InsertRow(0)
	ids_listado.SetItem(ll_fila_insertada, 'nis_rad', dw_listado_sum.GetItemNumber(ll_fila, 'nis_rad'))
	
	dw_listado_sum.SelectRow(ll_fila, false)
			
	// Se selecciona la siguiente incidencia seleccionada
	ll_fila = dw_listado_sum.GetSelectedRow(0) // Es cero, porque se ha desmarcado la
															 // anterior seleccionada
LOOP

dw_listado_sum.setredraw(True)

SetPointer(Arrow!)

Close(Parent)
end event

type cb_2 from commandbutton within w_sel_sum_sin_alim
integer x = 1088
integer y = 1092
integer width = 352
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
boolean cancel = true
end type

type dw_listado_sum from u_lista_sum_sin_alim within w_sel_sum_sin_alim
integer x = 37
integer y = 96
integer width = 1838
integer height = 936
integer taborder = 10
boolean bringtotop = true
boolean vscrollbar = true
end type

event clicked;call super::clicked;long ll_contador, ll_inicio, ll_fin

IF row > 0 THEN
	IF keyDown(KeyShift!) AND il_ultima_fila > 0 THEN 
		IF row > il_ultima_fila THEN
			ll_inicio = il_ultima_fila
			ll_fin = row
		ELSE
			ll_inicio = row
			ll_fin = il_ultima_fila
		END IF
		SetPointer(HourGlass!)
		
		This.setredraw(false)
		
		FOR ll_contador = ll_inicio TO ll_fin
				This.SelectRow(ll_contador, TRUE)
		NEXT
		
		This.setredraw(true)
		
		This.ScrolltoRow(ll_contador)
		SetPointer(Arrow!)
	ELSEIF keyDown(KeyControl!) THEN
		IF IsSelected(row) THEN
			this.selectrow(row,false)
		ELSE
			this.selectrow(row,true)
		END IF
	ELSE
		This.SelectRow(0,False)
		this.selectrow(row,true)
	END IF
	
	il_ultima_fila = row
	
END IF


end event

event constructor;call super::constructor;This.SetTransobject(SQLCA)
end event


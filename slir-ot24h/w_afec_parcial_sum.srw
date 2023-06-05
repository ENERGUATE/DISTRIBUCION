HA$PBExportHeader$w_afec_parcial_sum.srw
forward
global type w_afec_parcial_sum from w_sgigenerica
end type
type dw_lista_sum from u_afec_parcial_sum within w_afec_parcial_sum
end type
type cb_cancelar from commandbutton within w_afec_parcial_sum
end type
type dw_filtros from datawindow within w_afec_parcial_sum
end type
type st_1 from statictext within w_afec_parcial_sum
end type
type st_2 from statictext within w_afec_parcial_sum
end type
type st_sum_sel from statictext within w_afec_parcial_sum
end type
type st_total from statictext within w_afec_parcial_sum
end type
type dw_sum_int from datawindow within w_afec_parcial_sum
end type
type cb_aceptar from commandbutton within w_afec_parcial_sum
end type
end forward

global type w_afec_parcial_sum from w_sgigenerica
int X=5
int Y=208
int Width=3657
int Height=2188
WindowType WindowType=response!
boolean TitleBar=true
string Title="Selecci$$HEX1$$f300$$ENDHEX$$n de Suministros"
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
dw_lista_sum dw_lista_sum
cb_cancelar cb_cancelar
dw_filtros dw_filtros
st_1 st_1
st_2 st_2
st_sum_sel st_sum_sel
st_total st_total
dw_sum_int dw_sum_int
cb_aceptar cb_aceptar
end type
global w_afec_parcial_sum w_afec_parcial_sum

type variables
datastore ids_int_sum_orig
int ii_accion_salida = 0
String is_accion_llamada
end variables

forward prototypes
public subroutine wf_modifica_suministro (long pl_fila, integer pi_accion)
end prototypes

public subroutine wf_modifica_suministro (long pl_fila, integer pi_accion);long ll_fila, ll_nis_rad

ll_nis_rad = dw_lista_sum.GetItemNumber(pl_fila, 'nis_rad')
IF pi_accion = 0 THEN
	ll_fila = dw_sum_int.find('nis_rad = ' + string(ll_nis_rad), 1, dw_sum_int.RowCount())
	IF ll_fila > 0 THEN
		dw_sum_int.deleterow(ll_fila)
	END IF
ELSEIF pi_accion = 1 THEN
	ll_fila = dw_sum_int.insertrow(0)
	dw_sum_int.SetItem(ll_fila, 'usuario', gs_usuario)
	dw_sum_int.SetItem(ll_fila, 'f_actual', fgnu_fecha_actual())
	dw_sum_int.SetItem(ll_fila, 'programa', 'w_afec_parcial')
	dw_sum_int.SetItem(ll_fila, 'nis_rad', dw_lista_sum.GetItemNumber(pl_fila, 'nis_rad'))
	dw_sum_int.SetItem(ll_fila, 'nro_incidencia', gu_comunic.is_comunic.longval2)
	dw_sum_int.SetItem(ll_fila, 'nro_instalacion', gu_comunic.is_comunic.longval1)
	dw_sum_int.SetItem(ll_fila, 'f_alta', gu_comunic.is_comunic.datval1)
	dw_sum_int.SetItem(ll_fila, 'medidor', dw_lista_sum.GetItemString(pl_fila, 'medidor' ))
	dw_sum_int.SetItem(ll_fila, 'nombre',dw_lista_sum.GetItemString(pl_fila, 'nombre' ))
	dw_sum_int.SetItem(ll_fila, 'ape1', dw_lista_sum.GetItemString(pl_fila, 'ape1' ))
	dw_sum_int.SetItem(ll_fila, 'ape2',dw_lista_sum.GetItemString(pl_fila, 'ape2' ))
	
END IF
end subroutine

on w_afec_parcial_sum.create
int iCurrent
call super::create
this.dw_lista_sum=create dw_lista_sum
this.cb_cancelar=create cb_cancelar
this.dw_filtros=create dw_filtros
this.st_1=create st_1
this.st_2=create st_2
this.st_sum_sel=create st_sum_sel
this.st_total=create st_total
this.dw_sum_int=create dw_sum_int
this.cb_aceptar=create cb_aceptar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lista_sum
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.dw_filtros
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_sum_sel
this.Control[iCurrent+7]=this.st_total
this.Control[iCurrent+8]=this.dw_sum_int
this.Control[iCurrent+9]=this.cb_aceptar
end on

on w_afec_parcial_sum.destroy
call super::destroy
destroy(this.dw_lista_sum)
destroy(this.cb_cancelar)
destroy(this.dw_filtros)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_sum_sel)
destroy(this.st_total)
destroy(this.dw_sum_int)
destroy(this.cb_aceptar)
end on

event open;call super::open;long ll_contador
long ll_fila, ll_nis_rad
long ll_sum_selec = 0

Datawindow lds_lista
is_accion_llamada = gu_comunic.is_comunic.strval1
ids_int_sum_orig = CREATE datastore

dw_filtros.insertrow(0)
dw_filtros.setitem(1, 'seleccionado', fgci_todos)
dw_lista_sum.SetTransObject(SQLCA)
dw_lista_sum.retrieve(gu_comunic.is_comunic.longval1)

ids_int_sum_orig.dataobject = 'd_sum_inter_bt'

lds_lista = Message.PowerObjectParm
lds_lista.ShareData ( dw_sum_int )

lds_lista.RowsCopy(1, lds_lista.RowCount(), Primary!, ids_int_sum_orig, 1, Primary!)

FOR ll_contador = 1 TO dw_sum_int.RowCount()
	ll_nis_rad = dw_sum_int.GetItemNumber(ll_contador, 'nis_rad')
	ll_fila = dw_lista_sum.find('nis_rad=' + string(ll_nis_rad), 1, dw_lista_sum.RowCount())
	IF ll_fila > 0 THEN
		dw_lista_sum.SetItem(ll_fila, 'seleccionado', 1)
	ELSE
		ll_fila = dw_lista_sum.InsertRow(0)
		dw_lista_sum.SetItem(ll_fila, 'nis_rad', dw_sum_int.GetItemNumber(ll_contador, 'nis_rad'))
		dw_lista_sum.SetItem(ll_fila, 'medidor', dw_sum_int.GetItemString(ll_contador, 'medidor'))
		dw_lista_sum.SetItem(ll_fila, 'nombre', dw_sum_int.GetItemString(ll_contador, 'nombre'))
		dw_lista_sum.SetItem(ll_fila, 'ape1', dw_sum_int.GetItemString(ll_contador, 'ape1'))
		dw_lista_sum.SetItem(ll_fila, 'ape2', dw_sum_int.GetItemString(ll_contador, 'ape2')) 
		dw_lista_sum.SetItem(ll_fila, 'seleccionado', 1)
		st_total.Text = string(Long(st_total.Text) + 1)
	END IF	
	ll_sum_selec ++
NEXT

st_sum_sel.Text = String(ll_sum_selec)

IF is_accion_llamada = 'Consulta' THEN
	dw_lista_sum.object.seleccionado.protect = '1'
END IF
end event

event close;call super::close;long ll_contador

IF ii_accion_salida = 0 THEN
	FOR ll_contador = dw_sum_int.RowCount() TO 1 step  -1
		dw_sum_int.deleterow(ll_contador)
	NEXT
	ids_int_sum_orig.RowsCopy(1, ids_int_sum_orig.RowCount(), Primary!, dw_sum_int, 1, Primary!)
END IF

dw_sum_int.sharedataoff()
Destroy ids_int_sum_orig
end event

type dw_lista_sum from u_afec_parcial_sum within w_afec_parcial_sum
int X=5
int Y=508
int Width=3630
int Height=1412
int TabOrder=20
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=false
boolean HSplitScroll=false
end type

event sqlpreview;//
end event

event rbuttondown;call super::rbuttondown;int li_seleccionar
long ll_fila, ll_num_sel 
m_btder_seleccion lmenu

IF is_accion_llamada <> 'Consulta' THEN
		
	ll_num_sel = long(st_sum_sel.Text)
	
	
	lmenu = Create m_btder_seleccion
	
	lmenu.m_opciones.popmenu(PointerX(),PointerY()+350)
	li_seleccionar = lmenu.ii_accion_retorno
	
	IF li_seleccionar <> -1 THEN
		This.SetRedraw(False)
		ll_fila = This.GetSelectedRow(0)
		DO WHILE (ll_fila > 0)
			IF This.GetitemNumber(ll_fila, 'seleccionado') <> li_seleccionar THEN
				IF li_seleccionar = 1 THEN
					ll_num_sel ++
					wf_modifica_suministro(ll_fila, 1)
				ELSE
					ll_num_sel --
					wf_modifica_suministro(ll_fila, 0)
				END IF
			END IF
			
			This.setitem(ll_fila, 'seleccionado', li_seleccionar)
			This.SelectRow(ll_fila, False)
			ll_fila = This.GetSelectedRow(0)
		LOOP
		This.SetRedraw(True)
	
	END IF
	
	st_sum_sel.Text = string(ll_num_sel)
	
	Destroy lmenu
END IF
end event

event clicked;call super::clicked;long ll_contador, ll_inicio, ll_fin

IF row > 0 AND is_accion_llamada <> 'Consulta' THEN
	IF keyDown(KeyShift!) AND il_ultima_fila > 0 THEN 
		IF row > il_ultima_fila THEN
			ll_inicio = il_ultima_fila
			ll_fin = row
		ELSE
			ll_inicio = row
			ll_fin = il_ultima_fila
		END IF
		SetPointer(HourGlass!)
		
		this.setredraw(false)
		
		FOR ll_contador = ll_inicio TO ll_fin
			//IF NOT This.IsSelected(ll_contador) THEN
				This.SelectRow(ll_contador, TRUE)
			//END IF
		NEXT
		
		this.setredraw(true)
		
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

event retrieveend;call super::retrieveend;st_total.Text=string(rowcount)
end event

event itemchanged;call super::itemchanged;long ll_num_sel

IF gu_comunic.is_comunic.strval1 = 'Consulta' THEN
	return 1
ELSE
	IF row > 0 AND dwo.name='seleccionado' THEN
		ll_num_sel = long(st_sum_sel.Text)
		IF long(data) = 0 THEN
			ll_num_sel --
			wf_modifica_suministro(row, 0)
		
		ELSE
			ll_num_sel ++
			wf_modifica_suministro(row, 1)
		END IF
		st_sum_sel.Text = string(ll_num_sel)
		
	END IF
END IF	

end event

type cb_cancelar from commandbutton within w_afec_parcial_sum
int X=2034
int Y=1940
int Width=352
int Height=108
int TabOrder=50
boolean BringToTop=true
string Text="&Cancelar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;ii_accion_salida = 0
Close(Parent)
end event

type dw_filtros from datawindow within w_afec_parcial_sum
int X=9
int Y=24
int Width=1298
int Height=432
int TabOrder=10
boolean BringToTop=true
string DataObject="d_filtro_afec_parcial_sum"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;string ls_filtro
long ll_nulo
string ls_nulo

Setnull(ll_nulo)
setnull(ls_nulo)
IF dwo.name = 'seleccionado' THEN
	CHOOSE CASE long(data)
		CASE 0 // muestra todos los suministros
			ls_filtro = ''
		CASE 1 // S$$HEX1$$f300$$ENDHEX$$lo muestra los seleccionados
			ls_filtro = 'seleccionado = 1'
			
		CASE -1 // S$$HEX1$$f300$$ENDHEX$$lo muestra los no seleccionados
			ls_filtro = 'seleccionado = 0'
		
	END CHOOSE
	dw_lista_sum.SetRedraw(False)
	dw_lista_sum.setfilter(ls_filtro)
	dw_lista_sum.filter()
	dw_lista_sum.SetRedraw(True)
	This.Setitem(1, 'nis_rad' ,ll_nulo)
	This.Setitem(1, 'medidor' ,ls_nulo)

END IF
end event

event editchanged;//messagebox(data,"")
string ls_busqueda, ls_nulo
long ll_fila, ll_nulo

setnull(ls_nulo)
setnull(ll_nulo)
IF dwo.name = 'nis_rad' THEN
	This.Setitem(1, 'medidor' ,ls_nulo)
	ls_busqueda = "'" + data + "' = Left(string(nis_rad), " + string(len(data)) + ")"
//	ls_busqueda = "match(string(nis_rad), '" + +data +"')" 
	ll_fila = dw_lista_sum.find(ls_busqueda, 1, dw_lista_sum.RowCount())
	
	IF ll_fila > 0 THEN
		dw_lista_sum.Scrolltorow(ll_fila)
		dw_lista_sum.SelectRow(0, False)
		dw_lista_sum.SelectRow(ll_fila, True)
	ELSE
		MessageboX("Atenci$$HEX1$$f300$$ENDHEX$$n", "No existe nig$$HEX1$$fa00$$ENDHEX$$n suministro que comience por el c$$HEX1$$f300$$ENDHEX$$digo " + data)
	END IF
ELSEIF dwo.name = 'medidor' THEN
	This.Setitem(1, 'nis_rad' ,ll_nulo)
	ls_busqueda = "'" + data + "' = Left(medidor, " + string(len(data)) + ")"
//	ls_busqueda = "match(string(nis_rad), '" + +data +"')" 
	ll_fila = dw_lista_sum.find(ls_busqueda, 1, dw_lista_sum.RowCount())
	
	IF ll_fila > 0 THEN
		dw_lista_sum.Scrolltorow(ll_fila)
		dw_lista_sum.SelectRow(0, False)
		dw_lista_sum.SelectRow(ll_fila, True)
	ELSE
		MessageboX("Atenci$$HEX1$$f300$$ENDHEX$$n", "No existe nig$$HEX1$$fa00$$ENDHEX$$n suministro cuyo medidor comience por el c$$HEX1$$f300$$ENDHEX$$digo " + data)
	END IF

END IF

end event

event losefocus;This.AcceptText()
end event

type st_1 from statictext within w_afec_parcial_sum
int X=1326
int Y=264
int Width=805
int Height=72
boolean Enabled=false
boolean BringToTop=true
string Text="Suministros Seleccionados: "
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_afec_parcial_sum
int X=1326
int Y=364
int Width=805
int Height=84
boolean Enabled=false
boolean BringToTop=true
string Text="Cant. total de suministros: "
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_sum_sel from statictext within w_afec_parcial_sum
int X=2130
int Y=260
int Width=247
int Height=84
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="0"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_total from statictext within w_afec_parcial_sum
int X=2130
int Y=356
int Width=247
int Height=84
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="0"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_sum_int from datawindow within w_afec_parcial_sum
int X=2395
int Y=76
int Width=1211
int Height=380
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
string DataObject="d_sum_inter_bt"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_aceptar from commandbutton within w_afec_parcial_sum
int X=1152
int Y=1940
int Width=352
int Height=108
int TabOrder=40
string Text="&Aceptar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF is_accion_llamada <> 'Consulta' THEN ii_accion_salida = 1

Close(Parent)
end event


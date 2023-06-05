HA$PBExportHeader$w_sel_instala.srw
forward
global type w_sel_instala from window
end type
type dw_1 from datawindow within w_sel_instala
end type
end forward

global type w_sel_instala from window
integer x = 677
integer y = 688
integer width = 2299
integer height = 1020
boolean titlebar = true
string title = "Seleccione una instalaci$$HEX1$$f300$$ENDHEX$$n"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_1 dw_1
end type
global w_sel_instala w_sel_instala

type variables
boolean bb_flag = false
boolean  fila_seleccionada=false
long il_class_mem
end variables

on w_sel_instala.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_sel_instala.destroy
destroy(this.dw_1)
end on

event open;//Recupera la lista con los valores seleccionados en la pantalla padre
if isvalid(onis) then
dw_1.settransObject(sqlca)
dw_1.retrieve( w_alfa_criterio.ls_nombre, w_alfa_criterio.ls_codigo, w_alfa_criterio.ls_matricula,w_alfa_criterio.ls_tipo,onis.il_centro,onis.il_cmd,onis.il_puesto,onis.trabajo,w_alfa_criterio.ls_ambito,fgci_tipo_transformador)
end if
end event

event closequery;if not fila_seleccionada then 
	closewithreturn(this,-1)
end if
end event

type dw_1 from datawindow within w_sel_instala
event enter_key pbm_dwnkey
integer x = 119
integer y = 104
integer width = 2053
integer height = 720
integer taborder = 1
string dataobject = "dw_instalacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enter_key;//Muestra la instalacion

If key = KEYENTER! Then
	this.triggerevent(DoubleClicked!)
	Return 1
ElseIf key = KEYESCAPE! Then
	Close(Parent)
End If
end event

event doubleclicked;//Selecciona la fila para mostrar 

Long ll_long
String ls_nombre

if isnull(row) then
	row=this.getselectedrow(0)
//	dwo= this.object
end if

if row > 0 then 
	il_class_mem=dw_1.getitemnumber(row,"nro_instalacion")
	fila_seleccionada=true
	closewithreturn(parent,il_class_mem)
end if






end event

event clicked;///////////////////////////////////////
//
//  Evento : clicked
//
//  Objetivos : Seleccionar un registro
//
//  By Javier Camacho Mart$$HEX1$$ed00$$ENDHEX$$nez
//
Long ll_old_row, ll_long
string ls_nombre


if row > 0 And Right(dwo.name,2) <> "_t" then
	SetRow(row)
	ll_old_row = GetSelectedRow(0)
	SelectRow(ll_old_row,False)
	SelectRow(row,True)
ElseIf Right(dwo.name,2) = "_t" then
	ll_long = Len (String(dwo.name))
	ls_nombre = Left(dwo.name, ll_long - 2)

	If bb_flag Then
		ls_nombre = ls_nombre + " A"
		bb_flag = False
	Else
		ls_nombre = ls_nombre + " D"
		bb_flag = True
	End If

	SetSort(ls_nombre)
	Sort()	
	
End If

end event

event rowfocuschanged;///////////////////////////////////////
//
//  Evento : rowfocuschanged
//
//  Objetivos : Es necesario utilizar tambi$$HEX1$$e900$$ENDHEX$$n este evento si se desea
//					 utilizar las teclas de navegaci$$HEX1$$f300$$ENDHEX$$n.
//
//  By Javier Camacho Mart$$HEX1$$ed00$$ENDHEX$$nez
//
Long ll_old_row

If currentrow > 0 Then
	SetRow(currentrow)
	ll_old_row = GetSelectedRow(0)
	SelectRow(ll_old_row,False)
	SelectRow(currentrow,True)
End If
end event


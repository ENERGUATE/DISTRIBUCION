HA$PBExportHeader$w_2301_sel_causa_subtipo.srw
forward
global type w_2301_sel_causa_subtipo from w_sgigenerica
end type
type cb_1 from commandbutton within w_2301_sel_causa_subtipo
end type
type dw_lista from datawindow within w_2301_sel_causa_subtipo
end type
end forward

global type w_2301_sel_causa_subtipo from w_sgigenerica
integer x = 1120
integer y = 388
integer width = 1431
integer height = 1628
string title = "OPENSGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Causa"
windowtype windowtype = response!
long backcolor = 79741120
cb_1 cb_1
dw_lista dw_lista
end type
global w_2301_sel_causa_subtipo w_2301_sel_causa_subtipo

on w_2301_sel_causa_subtipo.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_lista=create dw_lista
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_lista
end on

on w_2301_sel_causa_subtipo.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_lista)
end on

event open;call super::open;integer li_fila
string ls_subtipo, ls_desc_subtipo

ls_subtipo = Message.StringParm

dw_lista.SetTransObject(SQLCA)
dw_lista.retrieve(integer(ls_subtipo))




end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2301_sel_causa_subtipo
integer x = 635
end type

type cb_1 from commandbutton within w_2301_sel_causa_subtipo
integer x = 503
integer y = 1416
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

event clicked;
close(parent)
end event

type dw_lista from datawindow within w_2301_sel_causa_subtipo
integer x = 41
integer y = 32
integer width = 1285
integer height = 1356
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_2301_lista_causa_subtipo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_row
string ls_desc

This.AcceptText()

SETPOINTER( HOURGLASS! )

IF row = 0 THEN RETURN


	dw_lista.SelectRow ( 0, FALSE )
	li_row = row
	dw_lista.SelectRow ( li_row, TRUE )
	
	ls_desc = dw_lista.getitemString(li_row, "descripcion")
	
//	messagebox("",ls_desc)
	
	CloseWithReturn(parent, ls_desc)
end event


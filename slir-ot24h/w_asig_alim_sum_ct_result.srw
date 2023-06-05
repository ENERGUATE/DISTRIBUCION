HA$PBExportHeader$w_asig_alim_sum_ct_result.srw
forward
global type w_asig_alim_sum_ct_result from w_sgigenerica
end type
type dw_listado from datawindow within w_asig_alim_sum_ct_result
end type
type cb_export from commandbutton within w_asig_alim_sum_ct_result
end type
type cb_1 from commandbutton within w_asig_alim_sum_ct_result
end type
end forward

global type w_asig_alim_sum_ct_result from w_sgigenerica
integer width = 3159
integer height = 1392
string title = "OPEN SGI - Resultados del proceso"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 80269524
dw_listado dw_listado
cb_export cb_export
cb_1 cb_1
end type
global w_asig_alim_sum_ct_result w_asig_alim_sum_ct_result

on w_asig_alim_sum_ct_result.create
int iCurrent
call super::create
this.dw_listado=create dw_listado
this.cb_export=create cb_export
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_listado
this.Control[iCurrent+2]=this.cb_export
this.Control[iCurrent+3]=this.cb_1
end on

on w_asig_alim_sum_ct_result.destroy
call super::destroy
destroy(this.dw_listado)
destroy(this.cb_export)
destroy(this.cb_1)
end on

event open;call super::open;Datastore lds_listado

lds_listado = Message.PowerObjectParm

lds_listado.ShareData (dw_listado)
end event

event close;call super::close;dw_listado.ShareDataOff()
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_asig_alim_sum_ct_result
end type

type dw_listado from datawindow within w_asig_alim_sum_ct_result
integer x = 14
integer y = 24
integer width = 3086
integer height = 1056
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_listado_asig_sum"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_export from commandbutton within w_asig_alim_sum_ct_result
integer x = 951
integer y = 1148
integer width = 325
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Exportar"
boolean default = true
end type

event clicked;string ls_fullname, ls_filename
integer li_value

li_value = GetFileSaveName("Seleccione el Fichero", &
									+ ls_fullname, ls_filename, "", &
									+ "Text Files (*.TXT),*.TXT," &
									+ "All Files (*.*),*.*")

IF li_value = 1 THEN 
	dw_listado.SaveAs(ls_fullname, Text!, TRUE)
END IF
end event

type cb_1 from commandbutton within w_asig_alim_sum_ct_result
integer x = 1838
integer y = 1148
integer width = 325
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;Close(Parent)
end event


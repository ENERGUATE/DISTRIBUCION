HA$PBExportHeader$u_config_mhai_activos.sru
forward
global type u_config_mhai_activos from userobject
end type
type cb_cancelar from commandbutton within u_config_mhai_activos
end type
type cb_grabar from commandbutton within u_config_mhai_activos
end type
type dw_activos from datawindow within u_config_mhai_activos
end type
end forward

global type u_config_mhai_activos from userobject
integer width = 1513
integer height = 1416
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cancelar cb_cancelar
cb_grabar cb_grabar
dw_activos dw_activos
end type
global u_config_mhai_activos u_config_mhai_activos

on u_config_mhai_activos.create
this.cb_cancelar=create cb_cancelar
this.cb_grabar=create cb_grabar
this.dw_activos=create dw_activos
this.Control[]={this.cb_cancelar,&
this.cb_grabar,&
this.dw_activos}
end on

on u_config_mhai_activos.destroy
destroy(this.cb_cancelar)
destroy(this.cb_grabar)
destroy(this.dw_activos)
end on

type cb_cancelar from commandbutton within u_config_mhai_activos
integer x = 850
integer y = 1280
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancelar"
end type

event clicked;


dw_activos.Reset()
dw_activos.Retrieve()
end event

type cb_grabar from commandbutton within u_config_mhai_activos
integer x = 407
integer y = 1280
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Grabar"
end type

event clicked;

long ll_rows, ll_cont
int  li_status
boolean lb_status = true

ll_rows = dw_activos.RowCount()

if ll_rows > 0 then 
	for ll_cont = 1 to ll_rows
		if isnull(dw_activos.object.mhai[ll_cont]) then 
			lb_status = false
		end if
	end for
	
	if lb_status then
		li_status = dw_activos.Update()
		
		if li_status = 1 then 
			commit; 
		else
			messagebox("","Error al grabar en la base de datos. Consulte con el administrador", Exclamation!, ok!)
		end if
	end if
end if
			
end event

type dw_activos from datawindow within u_config_mhai_activos
integer x = 37
integer y = 32
integer width = 1431
integer height = 1192
integer taborder = 10
string dataobject = "d_config_mhai_activos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;
this.SetTransObject(SQLCA)
this.Retrieve()
end event


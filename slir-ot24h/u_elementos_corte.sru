HA$PBExportHeader$u_elementos_corte.sru
forward
global type u_elementos_corte from userobject
end type
type dw_elementos_corte from datawindow within u_elementos_corte
end type
type cb_mas from commandbutton within u_elementos_corte
end type
type cb_menos from commandbutton within u_elementos_corte
end type
end forward

global type u_elementos_corte from userobject
integer width = 1179
integer height = 508
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_elementos_corte dw_elementos_corte
cb_mas cb_mas
cb_menos cb_menos
end type
global u_elementos_corte u_elementos_corte

type variables
decimal idec_nro_instalacion_afectada
end variables

on u_elementos_corte.create
this.dw_elementos_corte=create dw_elementos_corte
this.cb_mas=create cb_mas
this.cb_menos=create cb_menos
this.Control[]={this.dw_elementos_corte,&
this.cb_mas,&
this.cb_menos}
end on

on u_elementos_corte.destroy
destroy(this.dw_elementos_corte)
destroy(this.cb_mas)
destroy(this.cb_menos)
end on

type dw_elementos_corte from datawindow within u_elementos_corte
integer x = 9
integer y = 8
integer width = 1147
integer height = 388
integer taborder = 10
string dataobject = "d_elementos_corte_inc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;dw_elementos_corte.settransobject(sqlca)
end event

event itemchanged;integer ii_tipo,li_conta
string ls_mat

this.accepttext()

ls_mat = "mat ='" + this.object.mat[row] + "'"

if dwo.name = 'matricula' then 
	ii_tipo = integer(right(string(this.object.matricula[row]),1))
	this.object.tipo[row] = ii_tipo
	if this.rowcount() > 1 then
		if this.Find (ls_mat, 1, this.rowcount() - 1) <> 0 then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Este elemento de corte ya se ha a$$HEX1$$f100$$ENDHEX$$adido anteriormente.",Information!,ok!)
			this.deleterow(row)
		end if
	end if
end if
	
end event

type cb_mas from commandbutton within u_elementos_corte
integer x = 14
integer y = 412
integer width = 114
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "+"
end type

event clicked;int li_reg
datetime f_alta
long ll_cant

if dw_elementos_corte.rowcount() = 0 then
	DataWindowChild dwc_eltos
	dw_elementos_corte.GetChild("matricula", dwc_eltos)
	dwc_eltos.SetTransObject(SQLCA)
	ll_cant = dwc_eltos.Retrieve(idec_nro_instalacion_afectada)
	if ll_cant = 0 then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No se han podido encontrar elementos de corte asociados a la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.",Information!,ok!)
		return
	end if
end if

li_reg = dw_elementos_corte.insertrow(0)

dw_elementos_corte.object.usuario[li_reg] = gs_usuario
dw_elementos_corte.object.programa[li_reg] = 'w_incidencias'
dw_elementos_corte.object.f_actual[li_reg] = fgnu_fecha_actual()
return 1


end event

type cb_menos from commandbutton within u_elementos_corte
integer x = 137
integer y = 412
integer width = 114
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "-"
end type

event clicked;if dw_elementos_corte.getrow() > 0 then
	dw_elementos_corte.deleterow(dw_elementos_corte.getrow())
end if
end event


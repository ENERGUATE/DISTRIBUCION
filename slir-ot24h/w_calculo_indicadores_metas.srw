HA$PBExportHeader$w_calculo_indicadores_metas.srw
forward
global type w_calculo_indicadores_metas from window
end type
type tab_1 from tab within w_calculo_indicadores_metas
end type
type tabpage_stn from userobject within tab_1
end type
type uo_indices_stn from u_stn_indices_metas within tabpage_stn
end type
type tabpage_stn from userobject within tab_1
uo_indices_stn uo_indices_stn
end type
type tabpage_3 from userobject within tab_1
end type
type uo_2 from u_activos_str_indices_metas within tabpage_3
end type
type tabpage_3 from userobject within tab_1
uo_2 uo_2
end type
type tabpage_1 from userobject within tab_1
end type
type uo_indices_str from u_str_indices_metas within tabpage_1
end type
type tabpage_1 from userobject within tab_1
uo_indices_str uo_indices_str
end type
type tabpage_2 from userobject within tab_1
end type
type uo_1 from u_energia_no_suministrada within tabpage_2
end type
type tabpage_2 from userobject within tab_1
uo_1 uo_1
end type
type tab_1 from tab within w_calculo_indicadores_metas
tabpage_stn tabpage_stn
tabpage_3 tabpage_3
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_calculo_indicadores_metas from window
integer width = 3584
integer height = 2012
boolean titlebar = true
string title = "OPEN SGI - C$$HEX1$$e100$$ENDHEX$$lculo de indicadores y compensaciones."
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_calculo_indicadores_metas w_calculo_indicadores_metas

type variables

long il_nro_instalacion
boolean ib_modificando_disponibilidad = FALSE
long il_modificado = 0

int ii_chequear_consignacion

long il_registro_modificado

long il_row_historico

end variables

forward prototypes
public function string uf_get_itemstatus (dwitemstatus pdwis_indisponibilidad)
end prototypes

public function string uf_get_itemstatus (dwitemstatus pdwis_indisponibilidad);
string 	ls_auxiliar

choose case pdwis_indisponibilidad
	case notmodified!
		ls_auxiliar = "NotModified"
	case datamodified!
		ls_auxiliar = "DataModified"
	case new!
		ls_auxiliar = "New"
	case newmodified!
		ls_auxiliar = "NewModified"
end choose

return ls_auxiliar
		
end function

on w_calculo_indicadores_metas.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_calculo_indicadores_metas.destroy
destroy(this.tab_1)
end on

event open;

//tab_1.tabpage_stn.uo_indices_stn.uf_recuperar_indices()
end event

event close;
ROLLBACK;
end event

type tab_1 from tab within w_calculo_indicadores_metas
event create ( )
event destroy ( )
integer y = 20
integer width = 3538
integer height = 1824
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_stn tabpage_stn
tabpage_3 tabpage_3
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_stn=create tabpage_stn
this.tabpage_3=create tabpage_3
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_stn,&
this.tabpage_3,&
this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_stn)
destroy(this.tabpage_3)
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_stn from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3502
integer height = 1708
long backcolor = 67108864
string text = "$$HEX1$$cd00$$ENDHEX$$ndices y metas STN"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_indices_stn uo_indices_stn
end type

on tabpage_stn.create
this.uo_indices_stn=create uo_indices_stn
this.Control[]={this.uo_indices_stn}
end on

on tabpage_stn.destroy
destroy(this.uo_indices_stn)
end on

type uo_indices_stn from u_stn_indices_metas within tabpage_stn
integer y = 8
integer width = 3497
integer height = 1692
integer taborder = 30
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_indices_stn.destroy
call u_stn_indices_metas::destroy
end on

event constructor;call super::constructor;
//uo_indices_stn.uf_recuperar_indices()

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3502
integer height = 1708
long backcolor = 67108864
string text = "$$HEX1$$cd00$$ENDHEX$$ndices y metas activos del STR"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_2 uo_2
end type

on tabpage_3.create
this.uo_2=create uo_2
this.Control[]={this.uo_2}
end on

on tabpage_3.destroy
destroy(this.uo_2)
end on

type uo_2 from u_activos_str_indices_metas within tabpage_3
integer x = 9
integer y = 16
integer taborder = 30
end type

on uo_2.destroy
call u_activos_str_indices_metas::destroy
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3502
integer height = 1708
long backcolor = 67108864
string text = "$$HEX1$$cd00$$ENDHEX$$ndices y metas grupos del STR"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_indices_str uo_indices_str
end type

on tabpage_1.create
this.uo_indices_str=create uo_indices_str
this.Control[]={this.uo_indices_str}
end on

on tabpage_1.destroy
destroy(this.uo_indices_str)
end on

type uo_indices_str from u_str_indices_metas within tabpage_1
integer y = 8
integer taborder = 40
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_indices_str.destroy
call u_str_indices_metas::destroy
end on

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3502
integer height = 1708
long backcolor = 67108864
string text = "Energ$$HEX1$$ed00$$ENDHEX$$a No Suministrada"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_1 uo_1
end type

on tabpage_2.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on tabpage_2.destroy
destroy(this.uo_1)
end on

type uo_1 from u_energia_no_suministrada within tabpage_2
integer taborder = 30
end type

on uo_1.destroy
call u_energia_no_suministrada::destroy
end on

event ue_grabar;call super::ue_grabar;

commit; 
end event


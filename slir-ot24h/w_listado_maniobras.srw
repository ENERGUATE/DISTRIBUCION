HA$PBExportHeader$w_listado_maniobras.srw
forward
global type w_listado_maniobras from window
end type
type cbx_2 from checkbox within w_listado_maniobras
end type
type cbx_1 from checkbox within w_listado_maniobras
end type
type cb_buscar from commandbutton within w_listado_maniobras
end type
type dw_fechas from u_inc_2013_pr_desde_hasta within w_listado_maniobras
end type
type cb_seleccionar from commandbutton within w_listado_maniobras
end type
type dw_maniobras from u_inc_2052_lista_maniobras within w_listado_maniobras
end type
type gb_1 from groupbox within w_listado_maniobras
end type
end forward

global type w_listado_maniobras from window
integer width = 3515
integer height = 1584
boolean titlebar = true
string title = "Listado de Maniobras"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_2 cbx_2
cbx_1 cbx_1
cb_buscar cb_buscar
dw_fechas dw_fechas
cb_seleccionar cb_seleccionar
dw_maniobras dw_maniobras
gb_1 gb_1
end type
global w_listado_maniobras w_listado_maniobras

type variables
long il_estado
end variables

on w_listado_maniobras.create
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_buscar=create cb_buscar
this.dw_fechas=create dw_fechas
this.cb_seleccionar=create cb_seleccionar
this.dw_maniobras=create dw_maniobras
this.gb_1=create gb_1
this.Control[]={this.cbx_2,&
this.cbx_1,&
this.cb_buscar,&
this.dw_fechas,&
this.cb_seleccionar,&
this.dw_maniobras,&
this.gb_1}
end on

on w_listado_maniobras.destroy
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_buscar)
destroy(this.dw_fechas)
destroy(this.cb_seleccionar)
destroy(this.dw_maniobras)
destroy(this.gb_1)
end on

event open;datetime ld_f_desde,ld_f_hasta


dw_maniobras.settransobject(sqlca)

ld_f_desde = gu_comunic2.is_comunic.datval1
//ld_f_hasta = fgnu_fecha_actual()
ld_f_hasta= gu_comunic2.is_comunic.datval2

il_estado= gu_comunic2.is_comunic.longval1
gu_comunic2.is_comunic.longval1=0

//AHM(15/03/2010)
cbx_1.checked = (il_estado = 1)
cbx_2.checked = (il_estado = 0)

//AHM(04/01/2008)
ld_f_desde = datetime(date(left((string(fgnu_fecha_actual())),10)))

dw_fechas.setItem(1, "desde", ld_f_desde)
//Fin AHM

dw_maniobras.retrieve(ld_f_desde,ld_f_hasta,il_estado)

//dw_fechas.modify("desde.protect="+String(1))
//dw_fechas.modify("desde.background.color =" + gs_gris)




end event

type cbx_2 from checkbox within w_listado_maniobras
integer x = 1129
integer y = 224
integer width = 690
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Maniobras de cierre"
end type

event clicked;//AHM(15/03/2010)
IF cbx_2.checked = TRUE THEN
	cbx_1.checked = FALSE
	il_estado = 0
ELSE
	cbx_1.checked = TRUE
	il_estado = 1
END IF
end event

type cbx_1 from checkbox within w_listado_maniobras
integer x = 1129
integer y = 124
integer width = 745
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Maniobras de apertura"
end type

event clicked;//AHM (15/03/2010)
IF cbx_1.checked = TRUE THEN
	cbx_2.checked = FALSE
	il_estado = 1
ELSE
	cbx_2.checked = TRUE
	il_estado = 0
END IF
end event

type cb_buscar from commandbutton within w_listado_maniobras
integer x = 2706
integer y = 1364
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Buscar"
end type

event clicked;dw_fechas.accepttext()

dw_maniobras.retrieve(dw_fechas.object.desde[1],dw_fechas.object.hasta[1],il_estado)

end event

type dw_fechas from u_inc_2013_pr_desde_hasta within w_listado_maniobras
integer x = 41
integer y = 28
integer height = 348
integer taborder = 10
boolean border = false
end type

event constructor;call super::constructor;this.insertrow(0)
this.object.deteccion_titulo.text = "Fecha Maniobra"
this.object.deteccion_titulo.width = 512

dw_fechas.setredraw(FALSE)
dw_fechas.setitem(1,"desde",gu_comunic2.is_comunic.datval1)
dw_fechas.setitem(1,"hasta",fgnu_fecha_actual())

dw_fechas.setredraw(TRUE)
end event

type cb_seleccionar from commandbutton within w_listado_maniobras
integer x = 3072
integer y = 1364
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Seleccionar"
end type

event clicked;// FDO - Modificacion de registros.

datetime ld_fecha_maniobra
long ll_maniobra_cierre

setnull(ld_fecha_maniobra)

u_generico_comunicaciones iu_gen_comunic

iu_gen_comunic = create u_generico_comunicaciones


if dw_maniobras.getselectedrow(0) > 0 then

	ld_fecha_maniobra = dw_maniobras.object.fecha_maniobra[dw_maniobras.getselectedrow(0)]
	ll_maniobra_cierre = dw_maniobras.object.cod_maniobra[dw_maniobras.getselectedrow(0)]


	iu_gen_comunic.is_comunic.datval2 = ld_fecha_maniobra
	iu_gen_comunic.is_comunic.longval1 = ll_maniobra_cierre
	iu_gen_comunic.is_comunic.programa_llamante = "w_listado_maniobras"

	gu_comunic2 = iu_gen_comunic
	
	close(parent)
ELSE 
	MESSAGEBOX("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar una maniobra de cierre.",information!,ok!)
end if


end event

type dw_maniobras from u_inc_2052_lista_maniobras within w_listado_maniobras
integer x = 46
integer y = 392
integer width = 3406
integer height = 912
integer taborder = 10
string dataobject = "d_inc_2051_lista_maniobras_at"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event clicked;call super::clicked;This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
end event

event doubleclicked;call super::doubleclicked;// FDO - Modificacion de registros.

datetime ld_fecha_maniobra
long ll_maniobra_cierre

setnull(ld_fecha_maniobra)

u_generico_comunicaciones iu_gen_comunic

iu_gen_comunic = create u_generico_comunicaciones


if dw_maniobras.getselectedrow(0) > 0 then

	ld_fecha_maniobra = dw_maniobras.object.fecha_maniobra[dw_maniobras.getselectedrow(0)]
	ll_maniobra_cierre = dw_maniobras.object.cod_maniobra[dw_maniobras.getselectedrow(0)]


	iu_gen_comunic.is_comunic.datval2 = ld_fecha_maniobra
	iu_gen_comunic.is_comunic.longval1 = ll_maniobra_cierre
	iu_gen_comunic.is_comunic.programa_llamante = "w_listado_maniobras"

	gu_comunic2 = iu_gen_comunic
	
	close(parent)

else
	MESSAGEBOX("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar una maniobra de cierre.",information!,ok!)
end if


end event

type gb_1 from groupbox within w_listado_maniobras
integer x = 1093
integer y = 32
integer width = 791
integer height = 316
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Estado "
end type


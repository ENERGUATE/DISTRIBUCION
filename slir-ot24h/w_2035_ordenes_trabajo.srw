HA$PBExportHeader$w_2035_ordenes_trabajo.srw
forward
global type w_2035_ordenes_trabajo from w_sgigenerica
end type
type d_lista_ordenes from u_ord_2004_pr_ordenes_trabajo within w_2035_ordenes_trabajo
end type
type dw_1 from datawindow within w_2035_ordenes_trabajo
end type
type cb_imprimir from commandbutton within w_2035_ordenes_trabajo
end type
end forward

global type w_2035_ordenes_trabajo from w_sgigenerica
integer x = 370
integer y = 576
integer width = 2921
integer height = 1368
string title = "OPEN SGI - Lista de Ordenes de Trabajo"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
d_lista_ordenes d_lista_ordenes
dw_1 dw_1
cb_imprimir cb_imprimir
end type
global w_2035_ordenes_trabajo w_2035_ordenes_trabajo

type variables
u_generico_comunicaciones iu_comunic
u_ord_2004_nu_ordenes_trabajo iu_ord_2004_nu

decimal {0} idec_nro_inst
end variables

event open;call super::open;DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

iu_comunic = CREATE u_generico_comunicaciones
iu_ord_2004_nu = CREATE u_ord_2004_nu_ordenes_trabajo
iu_comunic.is_comunic = gu_comunic.is_comunic
gu_comunic.f_titulo_ventana("w_2035","cons_ot")

IF iu_comunic.is_comunic.programa_llamante = "w_3107" and iu_comunic.is_comunic.accion_llamada = "Consulta"  THEN
		idec_nro_inst = iu_comunic.is_comunic.decval1
		d_lista_ordenes.SetTransObject(SQLCA)
		iu_ord_2004_nu.fnu_traer_datos(d_lista_ordenes,idec_nro_inst)
END IF

IF d_lista_ordenes.ROWCOUNT()=0 THEN
	gnv_msg.f_mensaje("AM44","","",ok!)
	//MESSAGEBOX("Aviso","No se encontraron Ordenes de Trabajo.")
	yield()
	close(this)
ELSE
	dw_1.modify("data_1.DataObject ='" + d_lista_ordenes.DataObject + "'")

	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista Ordenes de trabajo'
	ll_longitud = len (ls_titulo)*100
	
	dw_1.modify("nulo_desde.visible = '0")
	dw_1.modify("f_desde.visible='0'")
	dw_1.modify("desde.Visible='0'")
	dw_1.modify("nulo_hasta.visible = '0'")
	dw_1.modify("f_hasta.visible='0'")
	dw_1.modify("hasta.Visible='0'")
	
	// si no son nulas las inserto
	dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
	dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
	dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
	
//	d_lista_ordenes.ShareData(dw_datos)
	d_lista_ordenes.setredraw(true)
end if



end event

on w_2035_ordenes_trabajo.create
int iCurrent
call super::create
this.d_lista_ordenes=create d_lista_ordenes
this.dw_1=create dw_1
this.cb_imprimir=create cb_imprimir
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_ordenes
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_imprimir
end on

on w_2035_ordenes_trabajo.destroy
call super::destroy
destroy(this.d_lista_ordenes)
destroy(this.dw_1)
destroy(this.cb_imprimir)
end on

on close;call w_sgigenerica::close;DESTROY iu_comunic
DESTROY iu_ord_2004_nu
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;IF d_lista_ordenes.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_ordenes

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2035_ordenes_trabajo
end type

type d_lista_ordenes from u_ord_2004_pr_ordenes_trabajo within w_2035_ordenes_trabajo
integer x = 46
integer y = 68
integer width = 2743
integer height = 988
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

type dw_1 from datawindow within w_2035_ordenes_trabajo
boolean visible = false
integer x = 101
integer y = 276
integer width = 494
integer height = 360
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_2035_ordenes_trabajo
integer x = 1179
integer y = 1120
integer width = 475
integer height = 100
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event


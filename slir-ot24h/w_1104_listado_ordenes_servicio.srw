HA$PBExportHeader$w_1104_listado_ordenes_servicio.srw
forward
global type w_1104_listado_ordenes_servicio from w_sgigenerica
end type
type d_lista_os from u_ord_2001_pr_lista_ordenes within w_1104_listado_ordenes_servicio
end type
type cb_1 from commandbutton within w_1104_listado_ordenes_servicio
end type
type dw_1 from datawindow within w_1104_listado_ordenes_servicio
end type
end forward

global type w_1104_listado_ordenes_servicio from w_sgigenerica
integer x = 416
integer y = 776
integer width = 2821
integer height = 996
string title = "OPEN SGI - Listado de Ordenes de Servicio"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
d_lista_os d_lista_os
cb_1 cb_1
dw_1 dw_1
end type
global w_1104_listado_ordenes_servicio w_1104_listado_ordenes_servicio

type variables
u_ord_2001_nu_lista_ordenes	iu_ord_2001_nu

end variables

event open;call super::open;long ll_filas
DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

// Creo los objetos necesarios para obtener la inf. de la pantalla
iu_ord_2001_nu = CREATE u_ord_2001_nu_lista_ordenes	
//This.Title = gu_comunic.f_titulo_ventana ("w_1104","Listado de Ordenes")

// Conecto las D.D.D.W
ll_filas = iu_ord_2001_nu.fnu_conectar(d_lista_os,parnum1)

//
//IF ll_filas <= 1 THEN
//
//	Close(This)
//
//	Open(w_1207_form_orden_servicio)
//	
////	gu_comunic.fnu_abrir(w_1207_form_orden_servicio,"w_1207_form_orden_servicio",1,1,w_1104_listado_ordenes_servicio,"w_1104_listado_ordenes_servicio")	
//ELSE
	
	IF d_lista_os.RowCount() <> 0 THEN
		dw_1.modify("data_1.DataObject ='" + d_lista_os.DataObject + "'")
		//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//		dw_1.GetChild ("data_1",dw_datos)
		
		//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
		ls_titulo = 'Listado de Ordenes'
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
		
//		d_lista_os.ShareData(dw_datos)
		d_lista_os.setredraw(true)
	END IF

//END IF
end event

on close;call w_sgigenerica::close;DESTROY iu_ord_2001_nu 

end on

on w_1104_listado_ordenes_servicio.create
int iCurrent
call super::create
this.d_lista_os=create d_lista_os
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_os
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_1104_listado_ordenes_servicio.destroy
call super::destroy
destroy(this.d_lista_os)
destroy(this.cb_1)
destroy(this.dw_1)
end on

on deactivate;// NO
end on

on activate;// NO
end on

on timer;// NO
end on

on tomar_foco;// NO
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;IF d_lista_os.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_os

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1104_listado_ordenes_servicio
end type

type d_lista_os from u_ord_2001_pr_lista_ordenes within w_1104_listado_ordenes_servicio
integer x = 14
integer y = 12
integer width = 2770
integer height = 692
integer taborder = 10
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;SetPointer(HourGlass!)

parnum2 = This.GetItemNumber(This.GetRow(),"num_os")

OpenSheet(w_1207_form_orden_servicio,w_1104_listado_ordenes_servicio,4,Original!)

//gu_comunic.fnu_abrir(w_1207_form_orden_servicio,"w_1207_form_orden_servicio",1,1,w_1104_listado_ordenes_servicio,"w_1104_listado_ordenes_servicio")	

end event

on constructor;call u_ord_2001_pr_lista_ordenes::constructor;SetRowFocusIndicator(Hand!)
end on

type cb_1 from commandbutton within w_1104_listado_ordenes_servicio
integer x = 1189
integer y = 736
integer width = 421
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprirmir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_1104_listado_ordenes_servicio
boolean visible = false
integer x = 37
integer y = 128
integer width = 494
integer height = 360
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


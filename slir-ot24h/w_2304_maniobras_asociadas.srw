HA$PBExportHeader$w_2304_maniobras_asociadas.srw
forward
global type w_2304_maniobras_asociadas from w_sgigenerica
end type
type dw_1 from datawindow within w_2304_maniobras_asociadas
end type
type cb_imprimir from commandbutton within w_2304_maniobras_asociadas
end type
type dw_lista_maniobras from u_inc_2052_lista_maniobras within w_2304_maniobras_asociadas
end type
end forward

global type w_2304_maniobras_asociadas from w_sgigenerica
integer x = 123
integer y = 388
integer width = 3429
integer height = 1620
string title = "Otras maniobras de cierre."
windowtype windowtype = response!
long backcolor = 79741120
string icon = "maniobras.ico"
event ue_imprimir ( )
dw_1 dw_1
cb_imprimir cb_imprimir
dw_lista_maniobras dw_lista_maniobras
end type
global w_2304_maniobras_asociadas w_2304_maniobras_asociadas

event ue_imprimir();
DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN dw_lista_maniobras.ShareData(dw_datos)

IF dw_lista_maniobras.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_lista_maniobras
dw_1.modify("desde.visible = '0'")
dw_1.modify("hasta.visible='0'")
dw_1.modify("nulo_desde.visible = '0'")
dw_1.modify("f_desde.visible='0'")
dw_1.modify("nulo_hasta.visible = '0'")
dw_1.modify("f_hasta.visible='0'")
gf_impresion_preliminar (lst_impresion, True, 0)
end event

on w_2304_maniobras_asociadas.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_imprimir=create cb_imprimir
this.dw_lista_maniobras=create dw_lista_maniobras
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_imprimir
this.Control[iCurrent+3]=this.dw_lista_maniobras
end on

on w_2304_maniobras_asociadas.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_imprimir)
destroy(this.dw_lista_maniobras)
end on

event open;call super::open;string ls_titulo
long ll_longitud

dw_lista_maniobras.settransobject(sqlca)
dw_lista_maniobras.retrieve(Message.DoubleParm)

dw_1.modify("data_1.DataObject ='" + dw_lista_maniobras.DataObject + "'")

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Maniobras asociadas a la incidencia ' + string(Message.DoubleParm)
ll_longitud = len (ls_titulo)*100
	
//Inserto las fechas, si son nulas visualizo el texto 00/00/0000 00:00:00

dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")

DataWindowChild dw_a
//dw_1.GetChild ("data_1",dw_a)
//dw_lista_maniobras.ShareData(dw_a)
//	
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2304_maniobras_asociadas
end type

type dw_1 from datawindow within w_2304_maniobras_asociadas
boolean visible = false
integer x = 1394
integer y = 868
integer width = 1705
integer height = 360
integer taborder = 30
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_2304_maniobras_asociadas
integer x = 3131
integer y = 1368
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Imprimir"
end type

event clicked;parent.triggerevent("ue_imprimir")
end event

type dw_lista_maniobras from u_inc_2052_lista_maniobras within w_2304_maniobras_asociadas
integer x = 18
integer y = 48
integer width = 3360
integer height = 1264
integer taborder = 10
string dataobject = "d_inc_2052_otras_maniobras"
boolean hscrollbar = true
boolean vscrollbar = true
end type


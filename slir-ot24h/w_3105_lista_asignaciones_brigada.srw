HA$PBExportHeader$w_3105_lista_asignaciones_brigada.srw
forward
global type w_3105_lista_asignaciones_brigada from w_sgigenerica
end type
type d_lista from u_2005_pr_lista_asignaciones_brigadas within w_3105_lista_asignaciones_brigada
end type
type cb_1 from commandbutton within w_3105_lista_asignaciones_brigada
end type
type dw_1 from datawindow within w_3105_lista_asignaciones_brigada
end type
end forward

global type w_3105_lista_asignaciones_brigada from w_sgigenerica
integer x = 466
integer y = 804
integer width = 2738
integer height = 948
string title = "OPEN SGI - Brigadas asignadas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
string icon = "Open.ico"
d_lista d_lista
cb_1 cb_1
dw_1 dw_1
end type
global w_3105_lista_asignaciones_brigada w_3105_lista_asignaciones_brigada

type variables
u_generico_comunicaciones lu_comunic
u_bri_2005_nu_lista_asignaciones_brigada iu_bri_2005_nu
long il_fila

end variables

event open;call super::open;DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

// efectua la coneccion a la base de datos
d_lista.settransobject(sqlca)

// creo el objeto de nucleo y comunicaciones
iu_bri_2005_nu = create u_bri_2005_nu_lista_asignaciones_brigada
lu_comunic = create u_generico_comunicaciones
lu_comunic.is_comunic = gu_comunic.is_comunic

//Modifico la dw si viene de la localizacion grafica de brigadas
if lu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim_graf" then
	d_lista.dataobject='d_2005_pr_lista_asignaciones_brigadas_gr'
	//DSA INI 21/01/2000
	//	d_lista.settrans(sqlca) 
	d_lista.settransobject(sqlca)
	//DSA FIN 21/01/2000
	d_lista.retrieve(long(gu_comunic.is_comunic.strval9 ))
	if d_lista.rowcount() < 1 then
		gnv_msg.f_mensaje("EI37","","",OK!)
		close(this)
	end if
	return
end if

// Leo informaci$$HEX1$$f300$$ENDHEX$$n de la base de datos
if iu_bri_2005_nu.fnu_obtener_datos(d_lista) = 0 then
	// cierra por no existir registros 
	lu_comunic.is_comunic.longval1 = 0
	lu_comunic.is_comunic.longval2 = 0
	lu_comunic.is_comunic.decval1 = 0
	lu_comunic.is_comunic.accion_retorno = "No existen"
	lu_comunic.is_comunic.programa_retorno = "w_3105_lista_asignaciones_brigada"
	gnv_msg.f_mensaje("AI76","","",OK!)
	//messagebox("Aviso","No hay ninguna brigada asignada a ninguna OT")
	Close(this)
else
	
	dw_1.modify("data_1.DataObject ='" + d_lista.DataObject + "'")

	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista Asignaciones Brigada'
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
	
//	d_lista.ShareData(dw_datos)
	d_lista.setredraw(true)
end if
end event

on close;call w_sgigenerica::close;DESTROY lu_comunic
DESTROY iu_bri_2005_nu
end on

on closequery;call w_sgigenerica::closequery;//if lu_comunic.is_comunic.accion_llamada = "Consulta" then
//	lu_comunic.is_comunic.longval1 = 0
//	lu_comunic.is_comunic.longval2 = 0
//	lu_comunic.is_comunic.decval1 = 0
//	lu_comunic.is_comunic.accion_retorno = "Consulta"
//	lu_comunic.is_comunic.programa_retorno = "w_3105_lista_asignaciones_brigada"
//end if
//gu_comunic.is_comunic = lu_comunic.is_comunic




	
end on

on w_3105_lista_asignaciones_brigada.create
int iCurrent
call super::create
this.d_lista=create d_lista
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_3105_lista_asignaciones_brigada.destroy
call super::destroy
destroy(this.d_lista)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;
DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN d_lista.ShareData(dw_datos)

IF d_lista.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3105_lista_asignaciones_brigada
end type

type d_lista from u_2005_pr_lista_asignaciones_brigadas within w_3105_lista_asignaciones_brigada
integer x = 14
integer y = 12
integer width = 2697
integer height = 688
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event ue_key_down;call super::ue_key_down;IF Key = KeyLeftArrow! THEN
	IF this.getselectedrow(0) > 1 AND this.getselectedrow(0) < This.RowCount() THEN
		This.scrolltorow(this.getselectedrow(0)+1)
	END IF
	return
ELSEIF Key = KeyRightArrow! THEN
	IF this.getselectedrow(0)> 1 THEN
		This.scrolltorow(this.getselectedrow(0) - 1)
	END IF
	return
END IF

end event

type cb_1 from commandbutton within w_3105_lista_asignaciones_brigada
integer x = 1143
integer y = 736
integer width = 443
integer height = 104
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_3105_lista_asignaciones_brigada
boolean visible = false
integer x = 64
integer y = 192
integer width = 494
integer height = 360
integer taborder = 12
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


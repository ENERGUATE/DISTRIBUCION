HA$PBExportHeader$w_7003_calles_afectadas.srw
forward
global type w_7003_calles_afectadas from w_sgigenerica
end type
type dw_calles_afectadas from u_desc_7003_pr_calles_afectadas within w_7003_calles_afectadas
end type
type gb_1 from groupbox within w_7003_calles_afectadas
end type
type cb_1 from commandbutton within w_7003_calles_afectadas
end type
type dw_1 from datawindow within w_7003_calles_afectadas
end type
end forward

global type w_7003_calles_afectadas from w_sgigenerica
integer x = 370
integer y = 464
integer height = 1604
string title = "OPEN SGI - Calles Afectadas por el Descargo"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "descargo.ico"
dw_calles_afectadas dw_calles_afectadas
gb_1 gb_1
cb_1 cb_1
dw_1 dw_1
end type
global w_7003_calles_afectadas w_7003_calles_afectadas

type variables
u_generico_comunicaciones lu_comunic
datawindowchild d_provincias, d_municipios, d_localidades, d_deptos
end variables

on w_7003_calles_afectadas.create
int iCurrent
call super::create
this.dw_calles_afectadas=create dw_calles_afectadas
this.gb_1=create gb_1
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_calles_afectadas
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_1
end on

on w_7003_calles_afectadas.destroy
call super::destroy
destroy(this.dw_calles_afectadas)
destroy(this.gb_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;call super::open;
//////////////////////////////////////////////////////////////////////
//
//		VENTANA W_7003_CALLES_AFECTADAS
//
//	OBJETIVO:
// Muestra el menor y mayor nro. de puerata para las calles de las 
//	acometidas que alimentan las instalaciones que se intewrrumpiran
// para el descargo
//
//parametros 
//				entrada:
//						gu_comunic.is_comunic.longval1 = nro de descargo
//
//
////////////////////////////////////////////////////////////////////

long ll_aux
string ls_nombre // GNU 4-12-2006. EPSA


DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

long ll_instalacion_afectada,ll_instalacion_hija
integer li_retorno_funcion

//fg_colocar_ventana(w_7003_calles_afectadas)// DSA 03/04/2000	
lu_comunic = create u_generico_comunicaciones
lu_comunic.is_comunic = gu_comunic.is_comunic


dw_calles_afectadas.SetTransObject(SQLCA)

// GNU 4-12-2006. EPSA
IF fg_verifica_parametro ("GEO") THEN
	dw_calles_afectadas.Modify("nom_prov_t.text = '" + fg_geografica("1","Provincia") + "'")
	dw_calles_afectadas.Modify("nom_depto_t.text = '" + fg_geografica("2","Departamento") + "'")
	dw_calles_afectadas.Modify("nom_munic_t.text = '" + fg_geografica("3","Municipio") + "'")
	dw_calles_afectadas.Modify("nom_local_t.text = '" + fg_geografica("4","Localidad") + "'")
END IF
// FIN GNU

dw_calles_afectadas.Retrieve(lu_comunic.is_comunic.longval1)
dw_calles_afectadas.show()
	

IF dw_calles_afectadas.RowCount() <> 0 THEN
	dw_1.modify("data_1.DataObject ='" + dw_calles_afectadas.DataObject + "'")

	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista Calles Afectadas'
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
	
	dw_calles_afectadas.ShareData(dw_datos)
END IF

IF dw_calles_afectadas.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	close(this)	
END IF

end event

event close;call super::close;Destroy(lu_comunic)
end event

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN 
		dw_calles_afectadas.ShareData(dw_datos)
END IF

s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_calles_afectadas

gf_impresion_preliminar (lst_impresion, True, 0)


end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7003_calles_afectadas
end type

type dw_calles_afectadas from u_desc_7003_pr_calles_afectadas within w_7003_calles_afectadas
integer x = 82
integer y = 152
integer width = 2720
integer height = 1132
integer taborder = 10
boolean hscrollbar = true
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fg_ventana_parametro(Parent.ClassName(), dw_calles_afectadas)
//***************************************
//**  OSGI 2001.1  	11/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

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

event ue_as_need;//
end event

event sqlpreview;//
end event

type gb_1 from groupbox within w_7003_calles_afectadas
integer x = 50
integer y = 80
integer width = 2789
integer height = 1264
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = " Calles Afectadas por el Descargo "
end type

type cb_1 from commandbutton within w_7003_calles_afectadas
integer x = 1207
integer y = 1376
integer width = 393
integer height = 108
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

type dw_1 from datawindow within w_7003_calles_afectadas
boolean visible = false
integer x = 110
integer y = 416
integer width = 494
integer height = 360
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


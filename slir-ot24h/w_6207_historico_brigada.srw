HA$PBExportHeader$w_6207_historico_brigada.srw
forward
global type w_6207_historico_brigada from w_sgigenerica
end type
type gb_2 from groupbox within w_6207_historico_brigada
end type
type gb_1 from groupbox within w_6207_historico_brigada
end type
type st_brigadista from statictext within w_6207_historico_brigada
end type
type dw_2 from datawindow within w_6207_historico_brigada
end type
type cb_1 from commandbutton within w_6207_historico_brigada
end type
type dw_3 from datawindow within w_6207_historico_brigada
end type
type dw_1 from u_gen_0000_lista within w_6207_historico_brigada
end type
end forward

global type w_6207_historico_brigada from w_sgigenerica
integer x = 5
integer y = 488
integer width = 3666
integer height = 1536
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
string icon = "BRIGADA4.ico"
gb_2 gb_2
gb_1 gb_1
st_brigadista st_brigadista
dw_2 dw_2
cb_1 cb_1
dw_3 dw_3
dw_1 dw_1
end type
global w_6207_historico_brigada w_6207_historico_brigada

on w_6207_historico_brigada.create
int iCurrent
call super::create
this.gb_2=create gb_2
this.gb_1=create gb_1
this.st_brigadista=create st_brigadista
this.dw_2=create dw_2
this.cb_1=create cb_1
this.dw_3=create dw_3
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_2
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.st_brigadista
this.Control[iCurrent+4]=this.dw_2
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.dw_1
end on

on w_6207_historico_brigada.destroy
call super::destroy
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.st_brigadista)
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.dw_3)
destroy(this.dw_1)
end on

event open;call super::open;////////////////////////////////////////////////////////////
// Ventan w_2272_historico_brigadista
//
//Objetivo : mostrar en las brigadas y las fechas 
//				 respectivas en que trabajo ese brigadista
//
//
//	Entrada : 
//				geu_cominic.is_comunic
//
//					longval1 = nro_brigadista
//					strval1 = nombre del brigadista
//					programa_llamente  = "w_2272"
//					accion_llamada		 = "consulta"
//
//	Salida  :
//
/////////////////////////////////////////////////////////////////////

st_brigadista.Text = gu_comunic.is_comunic.strval1
long ll_cant_filas



DW_1.SetTransObject (SQLCA)

// DSA INI 09/08/2000
if gu_comunic.is_comunic.strval2 = 'CO' then
	string sqlselect
	
	This.Title = gu_comunic.f_titulo_ventana("w_6207","CO")
	sqlselect =  'SELECT "GI_OT"."IND_TRABAJO",   &
         "GI_OT"."NRO_OT",   &
         "GI_OT"."DESCRIPCION",   &
         "GI_CONTRATA_OT"."F_DESDE",   &
         "GI_CONTRATA_OT"."F_HASTA",   &
         "GI_OT"."NRO_AVISO",&
   		"GI_OT"."NRO_INSTALACION",&
         "SGD_INSTALACION"."NOM_INSTALACION",   &
         "GI_OT"."NRO_INCIDENCIA"    &
    FROM "GI_CONTRATA_OT",  &
         "GI_OT",&
			"SGD_INSTALACION"  &
   WHERE ( GI_CONTRATA_OT.nro_ot = gi_ot.nro_ot (+)) and  &
         ( "GI_CONTRATA_OT"."NRO_CONTRATA" = :pl_nro_brigada ) AND  &
         ( "GI_CONTRATA_OT"."EST_BRIGADA" = 3) AND&
			( "SGD_INSTALACION"."NRO_INSTALACION"(+) = "GI_OT"."NRO_INSTALACION" ) and&
         ( "SGD_INSTALACION"."BDI_JOB"(+) = 0 ) '

	this.Title 	= 	"Hist$$HEX1$$f300$$ENDHEX$$rico de Contrata"
	gb_1.Text   =  "Contrata"
	sqlselect	= 	fg_remplaza (sqlselect, "~"", "~~~"")
	sqlselect 	=	"Datawindow.table.select=~" "	+ sqlselect	+ " ~" "
	dw_1.Modify(sqlselect)
else
	This.Title = gu_comunic.f_titulo_ventana("w_6207","BR")
end if
// DSA FIN 09/08/2000

ll_cant_filas=DW_1.retrieve(gu_comunic.is_comunic.longval1)

IF ll_cant_filas > 0 THEN
	DW_1.ScrollToRow(1)
else 
	gnv_msg.f_mensaje("AG03","","",Ok!)
	close(this)
	return
END IF


dw_2.InsertRow(0)
dw_2.setitem(1,"tipo_trab",0)

dw_3.modify("data_1.DataObject ='" + dw_1.DataObject + "'")

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_3.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = this.Title
ll_longitud = len (ls_titulo)*100

dw_3.modify("nulo_desde.visible = '0")
dw_3.modify("f_desde.visible='0'")
dw_3.modify("desde.Visible='0'")
dw_3.modify("nulo_hasta.visible = '0'")
dw_3.modify("f_hasta.visible='0'")
dw_3.modify("hasta.Visible='0'")

// si no son nulas las inserto
dw_3.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_3.modify("titulo_t.Text = '" + ls_titulo + "'")
dw_3.modify("f_desde.text = '" + string(ldt_desde) + "'")
dw_3.modify("f_hasta.text = '" + string(ldt_hasta) + "'")

//dw_3.ShareData(dw_datos)
dw_3.setredraw(true)
									



end event

event ue_arch_imprimir;call super::ue_arch_imprimir;//IF dw_1.RowCount() = 0 THEN
//	messagebox("Atencion","No se han recuperado datos")
//	return
//END IF

dw_3.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_3
lst_impresion.pdw_lista = dw_1
lst_impresion.compuesto = false
gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_6207_historico_brigada
end type

type gb_2 from groupbox within w_6207_historico_brigada
integer x = 2414
integer y = 12
integer width = 1083
integer height = 200
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro de Tipos"
end type

type gb_1 from groupbox within w_6207_historico_brigada
integer x = 128
integer y = 12
integer width = 1120
integer height = 192
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Brigada"
end type

type st_brigadista from statictext within w_6207_historico_brigada
integer x = 151
integer y = 88
integer width = 1074
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_6207_historico_brigada
integer x = 2519
integer y = 76
integer width = 965
integer height = 116
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_tipo_trab"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string ls_sintaxis
ls_sintaxis = string(this.object.tipo_trab[1])
if this.object.tipo_trab[1] <> 0 then
	dw_1.setfilter("gi_ot_ind_trabajo= "+ ls_sintaxis)
	dw_1.filter()
else
	dw_1.setfilter("gi_ot_ind_trabajo <> 0")
	dw_1.filter()
end if
end event

event editchanged;//this.accepttext()
//string ls_sintaxis
//ls_sintaxis = string(this.object.tipo_trab[1])
//if this.object.tipo_trab[1] <> 0 then
//	dw_1.setfilter("gi_ot_ind_trabajo= "+ ls_sintaxis)
//	dw_1.filter()
//else
//	setnull(ls_sintaxis)
//	dw_1.setfilter(ls_sintaxis)
//	dw_1.filter()
//end if
end event

type cb_1 from commandbutton within w_6207_historico_brigada
integer x = 1573
integer y = 1280
integer width = 443
integer height = 108
integer taborder = 50
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

type dw_3 from datawindow within w_6207_historico_brigada
boolean visible = false
integer x = 169
integer y = 392
integer width = 494
integer height = 360
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_gen_0000_lista within w_6207_historico_brigada
integer x = 137
integer y = 284
integer width = 3369
integer height = 948
integer taborder = 10
string dataobject = "d_2273_lista_historico_brigada"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event ue_key_down;/////////////////////////////////////////////////////
//	Permite borrar o agregar incidencias desde el teclado
//	dependiendo de si el usuario presiono delete o insert
//
//
//////////////////////////////////////////////////////
long ll_row 

IF keyflags = 0 THEN  // Controlo que no haya presionado
							// control ni shift
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyUpArrow! and ll_row > 1 THEN
		this.selectrow(0,False)
		this.selectrow(ll_row - 1,true)

	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
		this.selectrow(0,False)
		this.selectrow(ll_row + 1,true)
	
	END IF

END IF
end event


HA$PBExportHeader$w_2034_avisos_por_telefon.srw
forward
global type w_2034_avisos_por_telefon from w_sgigenerica
end type
type dw_usuarios from u_avi_2034_pr_usuario_telegestiones within w_2034_avisos_por_telefon
end type
type st_usuario from statictext within w_2034_avisos_por_telefon
end type
type dw_fechas from ue_gen_filtro_fechas within w_2034_avisos_por_telefon
end type
type gb_1 from groupbox within w_2034_avisos_por_telefon
end type
type cb_buscar from commandbutton within w_2034_avisos_por_telefon
end type
type cb_cancelar from commandbutton within w_2034_avisos_por_telefon
end type
type st_seleccion from statictext within w_2034_avisos_por_telefon
end type
type gb_telefonista from groupbox within w_2034_avisos_por_telefon
end type
type gb_empresa from groupbox within w_2034_avisos_por_telefon
end type
type dw_avisos_telefonistas from u_gen_0000_lista within w_2034_avisos_por_telefon
end type
type dw_meses from u_gen_0000_lista within w_2034_avisos_por_telefon
end type
end forward

global type w_2034_avisos_por_telefon from w_sgigenerica
integer x = 5
integer y = 4
integer width = 3657
integer height = 2016
string title = "OPEN SGI - Calidad de Trabajo"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 79741120
string icon = "conttrab.ico"
event ue_obtener_avisos pbm_custom21
dw_usuarios dw_usuarios
st_usuario st_usuario
dw_fechas dw_fechas
gb_1 gb_1
cb_buscar cb_buscar
cb_cancelar cb_cancelar
st_seleccion st_seleccion
gb_telefonista gb_telefonista
gb_empresa gb_empresa
dw_avisos_telefonistas dw_avisos_telefonistas
dw_meses dw_meses
end type
global w_2034_avisos_por_telefon w_2034_avisos_por_telefon

type variables
boolean ib_cancel
end variables

event ue_obtener_avisos;STRING NRO_USUARIO
datetime ld_fecha_desde
datetime ld_fecha_hasta
long ll_usu,ll_numero,ll_contador,ll_cuenta
dec {2} ld_numero

ib_cancel=true
dw_avisos_telefonistas.dbcancel()
dw_meses.dbcancel()
ib_cancel=false

dw_avisos_telefonistas.reset()
dw_meses.reset()
dw_fechas.accepttext()

ld_fecha_desde=dw_fechas.getitemdatetime(1,"f_desde")

//DBE ini 1/03/2000
if isnull(ld_fecha_desde) then
	ld_fecha_desde=ld_fecha_hasta //year 01/01/1900
end if
ld_fecha_hasta=dw_fechas.getitemdatetime(1,"f_hasta")

if isnull(ld_fecha_hasta) then 
	gnv_msg.f_mensaje("EI27","","",OK!)
	ld_fecha_hasta=datetime(Today())
	dw_fechas.object.f_hasta[1] = ld_fecha_hasta
	RETURN
end if
//DBE fin 1/03/2000

NRO_USUARIO = DW_USUARIOS.GETITEMSTRING(DW_USUARIOS.GETROW(),"NRO_USUARIO")
//gb_empresa.visible=true
//iu_avi_2034_pr.fnu_despliego_datos(dw_avisos_telefonistas,nro_usuario,ld_fecha_desde,ld_fecha_hasta)

SELECT count(DISTINCT "GI_AVISOS"."USUARIO")
INTO :ll_usu 
FROM gi_avisos
where to_date(to_char("GI_AVISOS"."F_ALTA",'DD/MM/YYYY'),'DD/MM/YYYY') between NVL(:ld_fecha_desde, TO_DATE('01/01/1900','DD/MM/YYYY')) AND :ld_fecha_hasta;


//DBE 1/03/2000 ini
if not ll_usu>0 then 
gnv_msg.f_mensaje("IT01","","",OK!)
return
end if

//dw_avisos_telefonistas.settransobject(sqlca)
dw_avisos_telefonistas.retrieve(nro_usuario,ld_fecha_desde,ld_fecha_hasta)
//DBE 1/03/2000 fin

//dw_meses.settransobject(sqlca)
if dw_meses.retrieve(ld_fecha_desde,ld_fecha_hasta,ll_usu)<>0 then 
//	dw_meses.visible=true
//	dw_avisos_telefonistas.visible=true
//	st_2.visible=true
//	st_3.visible=true
//	st_4.visible=true
else
	gnv_msg.f_mensaje("IT01","","",OK!)
	//Messagebox("Aviso","No se encontraron Registros con los criterios seleccionados",information!,ok!)
end if
	

end event

event open;call super::open;//fg_colocar_ventana(w_2034_avisos_por_telefon)
//iu_avi_2034_pr = CREATE u_avi_2034_pr_avisos_telefonistas

//dw_meses.visible=false
//gb_empresa.visible=false

//st_2.visible=false
//st_3.visible=false
//st_4.visible=false
dw_avisos_telefonistas.settransobject(sqlca)
dw_meses.settransobject(sqlca)
dw_usuarios.insertrow(0)
dw_usuarios.fnu_crea_dropdown()
dw_usuarios.setitem(1,"nro_usuario",gs_usuario)
dw_fechas.insertrow(0)
dw_fechas.f_inicializar_actual()
//dw_meses.InsertRow(0)
//dw_avisos_telefonistas.InsertRow(0)

This.title = gu_comunic.f_titulo_ventana("w_2034","Aviso.Telefon.")
IF dw_usuarios.rowcount() > 0 THEN
	dw_usuarios.selectrow(0,FALSE)
END IF


dw_avisos_telefonistas.show()
dw_meses.show()
end event

on w_2034_avisos_por_telefon.create
int iCurrent
call super::create
this.dw_usuarios=create dw_usuarios
this.st_usuario=create st_usuario
this.dw_fechas=create dw_fechas
this.gb_1=create gb_1
this.cb_buscar=create cb_buscar
this.cb_cancelar=create cb_cancelar
this.st_seleccion=create st_seleccion
this.gb_telefonista=create gb_telefonista
this.gb_empresa=create gb_empresa
this.dw_avisos_telefonistas=create dw_avisos_telefonistas
this.dw_meses=create dw_meses
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_usuarios
this.Control[iCurrent+2]=this.st_usuario
this.Control[iCurrent+3]=this.dw_fechas
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.cb_buscar
this.Control[iCurrent+6]=this.cb_cancelar
this.Control[iCurrent+7]=this.st_seleccion
this.Control[iCurrent+8]=this.gb_telefonista
this.Control[iCurrent+9]=this.gb_empresa
this.Control[iCurrent+10]=this.dw_avisos_telefonistas
this.Control[iCurrent+11]=this.dw_meses
end on

on w_2034_avisos_por_telefon.destroy
call super::destroy
destroy(this.dw_usuarios)
destroy(this.st_usuario)
destroy(this.dw_fechas)
destroy(this.gb_1)
destroy(this.cb_buscar)
destroy(this.cb_cancelar)
destroy(this.st_seleccion)
destroy(this.gb_telefonista)
destroy(this.gb_empresa)
destroy(this.dw_avisos_telefonistas)
destroy(this.dw_meses)
end on

event closequery;call super::closequery;//DESTROY iu_avi_2034_pr
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2034_avisos_por_telefon
end type

type dw_usuarios from u_avi_2034_pr_usuario_telegestiones within w_2034_avisos_por_telefon
integer x = 2501
integer y = 196
integer width = 1065
integer height = 116
integer taborder = 20
boolean border = false
end type

on clicked;call u_avi_2034_pr_usuario_telegestiones::clicked;this.accepttext()
end on

type st_usuario from statictext within w_2034_avisos_por_telefon
integer x = 2267
integer y = 212
integer width = 261
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type dw_fechas from ue_gen_filtro_fechas within w_2034_avisos_por_telefon
integer x = 2405
integer y = 360
integer width = 1029
integer height = 200
integer taborder = 30
end type

event rbuttondown;m_der_fechas lm_gestion_avi
lm_gestion_avi = CREATE m_der_fechas
m_der_fechas.idw_dw=this
m_der_fechas.ii_tipo_uo =2

choose case dwo.name
       case 'f_desde'
lm_gestion_avi.PopMenu(this.x, this.y )
       case 'f_hasta'
lm_gestion_avi.PopMenu(this.x +600 , this.y )
end choose

destroy lm_gestion_avi

end event

type gb_1 from groupbox within w_2034_avisos_por_telefon
integer x = 2231
integer y = 36
integer width = 1371
integer height = 632
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_buscar from commandbutton within w_2034_avisos_por_telefon
integer x = 3099
integer y = 1108
integer width = 448
integer height = 112
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Buscar"
boolean default = true
end type

event clicked;parent.Postevent("ue_obtener_avisos")
end event

type cb_cancelar from commandbutton within w_2034_avisos_por_telefon
event clicked pbm_bnclicked
integer x = 3099
integer y = 1352
integer width = 448
integer height = 112
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;//dw_fechas.f_inicializar_actual()
//dw_usuarios.setitem(1,"nro_usuario",gs_usuario)
//dw_meses.visible=false
//dw_avisos_telefonistas.visible=false
////st_2.visible=false
//st_3.visible=false
//st_4.visible=false

Close (Parent)
end event

type st_seleccion from statictext within w_2034_avisos_por_telefon
integer x = 2258
integer y = 48
integer width = 823
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Selecci$$HEX1$$f300$$ENDHEX$$n del Telefonista"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_telefonista from groupbox within w_2034_avisos_por_telefon
integer x = 23
integer y = 36
integer width = 2190
integer height = 636
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Telefonista . Avisos recibidos"
end type

type gb_empresa from groupbox within w_2034_avisos_por_telefon
integer x = 41
integer y = 708
integer width = 2999
integer height = 1156
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Empresa . Avisos recibidos"
end type

type dw_avisos_telefonistas from u_gen_0000_lista within w_2034_avisos_por_telefon
integer x = 41
integer y = 96
integer width = 2153
integer height = 564
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_avi_2034_avisos_telefonista"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event itemchanged;call super::itemchanged;if ib_cancel then
	return 1
end if
end event

type dw_meses from u_gen_0000_lista within w_2034_avisos_por_telefon
integer x = 59
integer y = 776
integer width = 2962
integer height = 1068
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_avi_2034_estadistica_avisos_tel"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event retrieverow;call super::retrieverow;if ib_cancel then
	return 1
end if
end event


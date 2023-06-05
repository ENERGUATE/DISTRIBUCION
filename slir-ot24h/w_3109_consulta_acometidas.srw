HA$PBExportHeader$w_3109_consulta_acometidas.srw
forward
global type w_3109_consulta_acometidas from w_sgigenerica
end type
type cb_desasociar from u_cb within w_3109_consulta_acometidas
end type
type cb_suministros from u_cb within w_3109_consulta_acometidas
end type
type d_lista_acometidas from u_ins_2015_pr_lista_acometidas within w_3109_consulta_acometidas
end type
type cbx_1 from checkbox within w_3109_consulta_acometidas
end type
type cb_1 from commandbutton within w_3109_consulta_acometidas
end type
type dw_1 from datawindow within w_3109_consulta_acometidas
end type
end forward

global type w_3109_consulta_acometidas from w_sgigenerica
integer x = 393
integer y = 628
integer width = 2880
integer height = 1156
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_retrieve pbm_custom21
cb_desasociar cb_desasociar
cb_suministros cb_suministros
d_lista_acometidas d_lista_acometidas
cbx_1 cbx_1
cb_1 cb_1
dw_1 dw_1
end type
global w_3109_consulta_acometidas w_3109_consulta_acometidas

type variables
string is_where, is_seleccion
decimal{0} idec_nro_instal
int ii_cod_prov, ii_cod_depto, ii_cod_munic, ii_cod_loc, ii_cod_calle

u_generico_comunicaciones	iu_resetear 	 
u_generico_comunicaciones	iu_gen_comunic
u_ins_2015_nu_lista_acometidas iu_ins_2015_nu

int ii_fila_selec, ii_fila_selec_ant
boolean ib_mostrar
string is_accion_llamada
// constantes

//int fgci_perfil_oper_mante_red
//int fgci_tipo_transformador
//int fgci_tipo_estacion
//int fgci_cod_calle_ficticia
//int fgci_num_puerta_fictica
//int fgcs_duplicador_ficticio
//int fgci_tipo_salida_de_baja
end variables

event ue_retrieve;IF iu_gen_comunic.is_comunic.programa_llamante = "SinAlimentacion" THEN

	iu_ins_2015_nu.fnu_traer_datos(d_lista_acometidas)
ELSE
	
	iu_ins_2015_nu.fnu_traer_datos_inst(d_lista_acometidas,idec_nro_instal)
END IF

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
	
dw_1.modify("data_1.DataObject ='" + d_lista_acometidas.DataObject + "'")

//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("data_1",dw_datos)
	
//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista Acometidas'
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
	
//d_lista_acometidas.ShareData(dw_datos)
d_lista_acometidas.setredraw(true)
end event

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Abre la ventana con la lista de acometidas
//				 a mantener .
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        02/09/96   HMA
//
/////////////////////////////////////////////////////////////////////////

//fw_def_constantes()
long ll_calle
string ls_calle
int li_tipo_inst, li_opcion, li_tipo_param

// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//	iu_gen_comunic  --> para cargar la estructura local 


SetPointer(HourGlass!)


iu_resetear 	 = CREATE u_generico_comunicaciones
iu_gen_comunic  = CREATE u_generico_comunicaciones
iu_ins_2015_nu = CREATE u_ins_2015_nu_lista_acometidas

iu_gen_comunic.is_comunic = gu_comunic.is_comunic

idec_nro_instal   = iu_gen_comunic.is_comunic.decval1
is_accion_llamada = iu_gen_comunic.is_comunic.accion_llamada

IF iu_gen_comunic.is_comunic.accion_llamada = "Consulta" THEN

	cb_desasociar.Visible = False

	IF iu_gen_comunic.is_comunic.programa_llamante = "SinAlimentacion" THEN
		This.Title = iu_gen_comunic.f_titulo_ventana("w_3109","Form.Lista.Aco.Sin.")
	ELSE
		This.Title = iu_gen_comunic.f_titulo_ventana("w_3109","Form.Lista.Aco.Inst.")
	END IF
ELSEIF iu_gen_comunic.is_comunic.accion_llamada = "Actualizacion" THEN

	IF iu_gen_comunic.is_comunic.programa_llamante = "SinAlimentacion" THEN
		This.Title = iu_gen_comunic.f_titulo_ventana("w_3109","Form.Mante.Aco.Sin.")
	ELSE
	
		cb_desasociar.Visible = False
		This.Title = iu_gen_comunic.f_titulo_ventana("w_3109","Form.Lista.Aco.Inst.")
	END IF
END IF

d_lista_acometidas.SetTransObject(sqlca)

//*******************************************************************************//
// Parametrizacion Mantenimiento de instalaciones solo de consulta               //
// Luis Ortiz Junio/2001                                                         //
//*******************************************************************************//

If fg_verifica_parametro('mante_instalacion') Then
 if isvalid(w_man_instalacion_param)	then li_tipo_param = w_man_instalacion_param.ii_tipo
Else
 if isvalid(w_man_instalacion) then li_tipo_param = w_man_instalacion.ii_tipo
end If

If li_tipo_param = fgci_tipo_salida_de_baja Then
	ib_mostrar = TRUE
	cbx_1.visible = FALSE
END IF	

This.TriggerEvent("ue_retrieve")
// RKU
IF idec_nro_instal = 0 THEN
	cbx_1.Visible = FALSE
END IF	
IF d_lista_acometidas.rowcount()=0 THEN
	
//	IF w_man_instalacion.ii_tipo = 5 THEN
	If li_tipo_param = fgci_tipo_salida_de_baja Then
		yield()
		close(This)
	ELSE
		li_opcion = MessageBox("Acometidas", "No existe ninguna Acometida alimentada directamente por la Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada. ~n" + &
									 "$$HEX1$$bf00$$ENDHEX$$Desea mostrar todas las acometidas alimentadas indirectamente?", Question!, YesNo!)
		IF li_opcion = 1 THEN
			cbx_1.TriggerEvent("clicked")
			IF d_lista_acometidas.rowcount() = 0 THEN
				SetPointer(Arrow!)
				Close(This)
			END IF
		ELSE
			yield()
			close(This)
		END IF	
	END IF	
END IF
// RKU

end event

on close;call w_sgigenerica::close;DESTROY iu_gen_comunic
DESTROY iu_resetear

DESTROY iu_ins_2015_nu 
end on

on w_3109_consulta_acometidas.create
int iCurrent
call super::create
this.cb_desasociar=create cb_desasociar
this.cb_suministros=create cb_suministros
this.d_lista_acometidas=create d_lista_acometidas
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_desasociar
this.Control[iCurrent+2]=this.cb_suministros
this.Control[iCurrent+3]=this.d_lista_acometidas
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.dw_1
end on

on w_3109_consulta_acometidas.destroy
call super::destroy
destroy(this.cb_desasociar)
destroy(this.cb_suministros)
destroy(this.d_lista_acometidas)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

//dw_1.GetChild ("data_1",dw_datos)
//IF dw_datos.RowCount() = 0 THEN d_lista_acometidas.ShareData(dw_datos)

IF d_lista_acometidas.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_acometidas

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3109_consulta_acometidas
end type

type cb_desasociar from u_cb within w_3109_consulta_acometidas
integer x = 96
integer y = 916
integer width = 425
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Desasociar"
end type

type cb_suministros from u_cb within w_3109_consulta_acometidas
integer x = 1851
integer y = 916
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Suministros"
end type

event clicked;call super::clicked;SetPointer(HourGlass!)

ii_fila_selec = d_lista_acometidas.GetSelectedRow(0)
IF ii_fila_selec = 0 THEN return

gu_comunic.is_comunic.longval1 = d_lista_acometidas.GetItemNumber(ii_fila_selec,"codigo")

gu_comunic.is_comunic.programa_llamante = "w_3109"

IF is_accion_llamada = "Actualizacion" AND &
			gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
	gu_comunic.is_comunic.accion_llamada = "Actualizacion"
ELSE
	gu_comunic.is_comunic.accion_llamada = "Consulta"	
END IF


//OpenSheet(w_3112_lista_consulta_sum,w_3109_consulta_acometidas,4,Original!)
OPEN(w_3112_lista_consulta_sum)
end event

type d_lista_acometidas from u_ins_2015_pr_lista_acometidas within w_3109_consulta_acometidas
integer x = 59
integer y = 44
integer width = 2734
integer height = 820
integer taborder = 30
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;if isnull(row) then row = this.getselectedrow(0)

IF row > 0 THEN

	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.Setrow(row)
	IF is_accion_llamada = "Actualizacion" AND &
		gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
		
		cb_desasociar.Enabled = True
	END IF
	IF this.object.cant_cli[row] > 0 THEN
		cb_suministros.Enabled = True
	ELSE
		cb_suministros.enabled = false
	END IF
ELSE
	cb_suministros.Enabled = false//DSA 01/03/2000 
	cb_desasociar.Enabled = false	//DSA 01/03/2000 
END IF


end event

event doubleclicked;call super::doubleclicked;SetPointer(HourGlass!)

IF ii_fila_selec > 0 THEN
	gu_comunic.is_comunic.longval1 = GetItemNumber(ii_fila_selec,"codigo")
	
	gu_comunic.is_comunic.programa_llamante = "w_3109"
	
	IF is_accion_llamada = "Actualizacion" AND &
			gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
		
		gu_comunic.is_comunic.accion_llamada = "Actualizacion"
	ELSE
		gu_comunic.is_comunic.accion_llamada = "Consulta"	
	END IF
	
	//gu_comunic.fnu_abrir(w_3112_lista_consulta_sum, & 
	//"w_3112_lista_consulta_sum",1,1,w_3109_consulta_acometidas,"w_3109_consulta_acometidas")
	
	//OpenSheet(w_3112_lista_consulta_sum,w_3109_consulta_acometidas,4,Original!)
	OPEN(w_3112_lista_consulta_sum)
END IF
end event

event ue_key_down;/////////////////////////////////////////////////////
//	Permite moverse con los cursores desde el teclado
// GSE 18/05/2001
//
//////////////////////////////////////////////////////
long ll_row

IF keyflags = 0 and this.rowcount() > 1 THEN  
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyUpArrow! and ll_row > 1 THEN
		this.selectrow(0,False)
		ii_fila_selec = ll_row - 1
		this.selectrow(ii_fila_selec,true)
		IF this.object.cant_cli[ii_fila_selec] > 0 THEN
			cb_suministros.Enabled = True
		ELSE
			cb_suministros.enabled = false
		END IF
	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
		this.selectrow(0,False)
		ii_fila_selec = ll_row + 1
		this.selectrow(ii_fila_selec,true)
		IF this.object.cant_cli[ii_fila_selec] > 0 THEN
			cb_suministros.Enabled = True
		ELSE
			cb_suministros.enabled = false
		END IF
	ELSEIF Key = KeyLeftArrow! THEN
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

END IF

end event

type cbx_1 from checkbox within w_3109_consulta_acometidas
integer x = 549
integer y = 924
integer width = 1285
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas las acometidas afectadas por la Instalaci$$HEX1$$f300$$ENDHEX$$n"
boolean automatic = false
end type

event clicked;/////////////////////////////////////////////////////////////////////////////
//
// Muestra todas las acometidas afectadas por la instalacion seleccionada
//
// Autor: RK
//
// Fecha: 01.06.2000
//
/////////////////////////////////////////////////////////////////////////////
string ls_rc, ls_mod_string, ls_original_select, ls_original_select2, ls_where, ls_ref_dir

IF cbx_1.checked = TRUE THEN
	cbx_1.checked = FALSE
	Parent.TriggerEvent("ue_retrieve")
ELSE
	cbx_1.checked = TRUE
	ib_mostrar = TRUE
	SetPointer(HourGlass!)

	//AHM (07/06/2010) ASUR 608463
	ls_original_select  = " SELECT SGD_ACOMETIDA.PROGRAMA, SGD_ACOMETIDA.CODIGO, SGD_ACOMETIDA.INSTALACION_ORIGEN, SGD_ACOMETIDA.POT_CONTRATADA, SGD_ACOMETIDA.KWH, SGD_ACOMETIDA.NIF,  SGD_ACOMETIDA.CANT_CLI, SGD_ACOMETIDA.COD_DEPTO, SGD_ACOMETIDA.COD_LOC, SGD_ACOMETIDA.COD_PROV, SGD_ACOMETIDA.COD_MUNIC, SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.KWH_FACT, SGD_ACOMETIDA.COD_CALLE, SGD_ACOMETIDA.NUM_PUERTA, SGD_ACOMETIDA.DUPLICADOR, SGD_ACOMETIDA.F_ACTUAL, SGD_ACOMETIDA.USUARIO, SGD_ACOMETIDA.ONIS_STAT, SGD_ACOMETIDA.INSTALACION_ORIGEN_V10, SGD_ACOMETIDA.BDI_JOB, CALLEJERO.NOM_CALLE, fgnu_calle_referencia(callejero.nom_calle, sgd_acometida.num_puerta, sgd_acometida.duplicador, sgd_acometida.nif, sgd_acometida.cod_calle, 0, '', 0, '') cdireccion "
	ls_original_select2 = " FROM SGD_ACOMETIDA, CALLEJERO  WHERE ( SGD_ACOMETIDA.BDI_JOB = 0) AND ( SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE (+)) AND SGD_ACOMETIDA.INSTALACION_ORIGEN "
	ls_where = "  IN ( select nro_instalacion from sgd_instalacion where sgd_instalacion.tipo_instalacion = " + string(fgci_tipo_salida_de_baja) + " START WITH SGD_INSTALACION.NRO_INSTALACION = '" + String(idec_nro_instal) + "' CONNECT BY PRIOR  SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE )"

	ls_rc = d_lista_acometidas.Modify('DataWindow.Table.Select="' + ls_original_select + ls_original_select2 + ls_where + '"')

	IF ls_rc = "" THEN
		IF d_lista_acometidas.Retrieve(ls_ref_dir) = 0 THEN
			gnv_msg.f_mensaje("AM14","","",OK!)
		END IF
	END IF
END IF
end event

type cb_1 from commandbutton within w_3109_consulta_acometidas
integer x = 2345
integer y = 916
integer width = 411
integer height = 96
integer taborder = 40
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

type dw_1 from datawindow within w_3109_consulta_acometidas
boolean visible = false
integer x = 73
integer y = 224
integer width = 494
integer height = 360
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


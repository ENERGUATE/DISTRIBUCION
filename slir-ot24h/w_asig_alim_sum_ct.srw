HA$PBExportHeader$w_asig_alim_sum_ct.srw
forward
global type w_asig_alim_sum_ct from window
end type
type st_est_listado_bd from statictext within w_asig_alim_sum_ct
end type
type sle_fichero from singlelineedit within w_asig_alim_sum_ct
end type
type st_estado_aco_nueva from statictext within w_asig_alim_sum_ct
end type
type st_estado_sbt_nueva from statictext within w_asig_alim_sum_ct
end type
type st_estado_aco_nueva_t from statictext within w_asig_alim_sum_ct
end type
type st_estado_sbt_t from statictext within w_asig_alim_sum_ct
end type
type cb_1 from commandbutton within w_asig_alim_sum_ct
end type
type cb_sel_ct from commandbutton within w_asig_alim_sum_ct
end type
type rb_sel_ct from radiobutton within w_asig_alim_sum_ct
end type
type rb_ct_fichero from radiobutton within w_asig_alim_sum_ct
end type
type cb_sel_sum from commandbutton within w_asig_alim_sum_ct
end type
type rb_sum_bd from radiobutton within w_asig_alim_sum_ct
end type
type rb_sum_fichero from radiobutton within w_asig_alim_sum_ct
end type
type gb_ct from groupbox within w_asig_alim_sum_ct
end type
type gb_sum from groupbox within w_asig_alim_sum_ct
end type
type gb_criterio from groupbox within w_asig_alim_sum_ct
end type
type st_estado_aco_t from statictext within w_asig_alim_sum_ct
end type
type st_estado_sbt_nueva_t from statictext within w_asig_alim_sum_ct
end type
type st_estado_aco from statictext within w_asig_alim_sum_ct
end type
type st_estado_sbt from statictext within w_asig_alim_sum_ct
end type
type tv_actual from uo_man_instalac within w_asig_alim_sum_ct
end type
type gb_actual from groupbox within w_asig_alim_sum_ct
end type
type tv_nueva from uo_man_instalac within w_asig_alim_sum_ct
end type
type gb_nueva from groupbox within w_asig_alim_sum_ct
end type
end forward

global type w_asig_alim_sum_ct from window
integer x = 1056
integer y = 484
integer width = 2619
integer height = 1748
boolean titlebar = true
string title = "OPEN SGI - Asignaci$$HEX1$$f300$$ENDHEX$$n de Alimentaci$$HEX1$$f300$$ENDHEX$$n"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_est_listado_bd st_est_listado_bd
sle_fichero sle_fichero
st_estado_aco_nueva st_estado_aco_nueva
st_estado_sbt_nueva st_estado_sbt_nueva
st_estado_aco_nueva_t st_estado_aco_nueva_t
st_estado_sbt_t st_estado_sbt_t
cb_1 cb_1
cb_sel_ct cb_sel_ct
rb_sel_ct rb_sel_ct
rb_ct_fichero rb_ct_fichero
cb_sel_sum cb_sel_sum
rb_sum_bd rb_sum_bd
rb_sum_fichero rb_sum_fichero
gb_ct gb_ct
gb_sum gb_sum
gb_criterio gb_criterio
st_estado_aco_t st_estado_aco_t
st_estado_sbt_nueva_t st_estado_sbt_nueva_t
st_estado_aco st_estado_aco
st_estado_sbt st_estado_sbt
tv_actual tv_actual
gb_actual gb_actual
tv_nueva tv_nueva
gb_nueva gb_nueva
end type
global w_asig_alim_sum_ct w_asig_alim_sum_ct

type variables
u_sum_ct iuo_sum_ct
Boolean ib_hay_datos_arbol = False
Boolean ib_hay_lista_sum = False
Boolean ib_supervisor

Int ii_origen_sum = 1
Int ii_origen_ct = 2
end variables

on w_asig_alim_sum_ct.create
this.st_est_listado_bd=create st_est_listado_bd
this.sle_fichero=create sle_fichero
this.st_estado_aco_nueva=create st_estado_aco_nueva
this.st_estado_sbt_nueva=create st_estado_sbt_nueva
this.st_estado_aco_nueva_t=create st_estado_aco_nueva_t
this.st_estado_sbt_t=create st_estado_sbt_t
this.cb_1=create cb_1
this.cb_sel_ct=create cb_sel_ct
this.rb_sel_ct=create rb_sel_ct
this.rb_ct_fichero=create rb_ct_fichero
this.cb_sel_sum=create cb_sel_sum
this.rb_sum_bd=create rb_sum_bd
this.rb_sum_fichero=create rb_sum_fichero
this.gb_ct=create gb_ct
this.gb_sum=create gb_sum
this.gb_criterio=create gb_criterio
this.st_estado_aco_t=create st_estado_aco_t
this.st_estado_sbt_nueva_t=create st_estado_sbt_nueva_t
this.st_estado_aco=create st_estado_aco
this.st_estado_sbt=create st_estado_sbt
this.tv_actual=create tv_actual
this.gb_actual=create gb_actual
this.tv_nueva=create tv_nueva
this.gb_nueva=create gb_nueva
this.Control[]={this.st_est_listado_bd,&
this.sle_fichero,&
this.st_estado_aco_nueva,&
this.st_estado_sbt_nueva,&
this.st_estado_aco_nueva_t,&
this.st_estado_sbt_t,&
this.cb_1,&
this.cb_sel_ct,&
this.rb_sel_ct,&
this.rb_ct_fichero,&
this.cb_sel_sum,&
this.rb_sum_bd,&
this.rb_sum_fichero,&
this.gb_ct,&
this.gb_sum,&
this.gb_criterio,&
this.st_estado_aco_t,&
this.st_estado_sbt_nueva_t,&
this.st_estado_aco,&
this.st_estado_sbt,&
this.tv_actual,&
this.gb_actual,&
this.tv_nueva,&
this.gb_nueva}
end on

on w_asig_alim_sum_ct.destroy
destroy(this.st_est_listado_bd)
destroy(this.sle_fichero)
destroy(this.st_estado_aco_nueva)
destroy(this.st_estado_sbt_nueva)
destroy(this.st_estado_aco_nueva_t)
destroy(this.st_estado_sbt_t)
destroy(this.cb_1)
destroy(this.cb_sel_ct)
destroy(this.rb_sel_ct)
destroy(this.rb_ct_fichero)
destroy(this.cb_sel_sum)
destroy(this.rb_sum_bd)
destroy(this.rb_sum_fichero)
destroy(this.gb_ct)
destroy(this.gb_sum)
destroy(this.gb_criterio)
destroy(this.st_estado_aco_t)
destroy(this.st_estado_sbt_nueva_t)
destroy(this.st_estado_aco)
destroy(this.st_estado_sbt)
destroy(this.tv_actual)
destroy(this.gb_actual)
destroy(this.tv_nueva)
destroy(this.gb_nueva)
end on

event open;iuo_sum_ct = CREATE u_sum_ct

ib_supervisor = (gu_perfiles.of_acceso_perfil(gi_perfil, 'SUP_ALIM_SUM',"ACC_MANTEN") = 1)
rb_ct_fichero.enabled = ib_supervisor

iuo_sum_ct.of_origen_sum(2)
end event

event close;DESTROY iuo_sum_ct
end event

type st_est_listado_bd from statictext within w_asig_alim_sum_ct
integer x = 672
integer y = 340
integer width = 457
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
long textcolor = 128
long backcolor = 80269524
boolean enabled = false
string text = "No definido"
boolean focusrectangle = false
end type

type sle_fichero from singlelineedit within w_asig_alim_sum_ct
integer x = 443
integer y = 228
integer width = 727
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_estado_aco_nueva from statictext within w_asig_alim_sum_ct
integer x = 1605
integer y = 1256
integer width = 905
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean focusrectangle = false
end type

type st_estado_sbt_nueva from statictext within w_asig_alim_sum_ct
integer x = 1605
integer y = 1180
integer width = 905
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean focusrectangle = false
end type

type st_estado_aco_nueva_t from statictext within w_asig_alim_sum_ct
integer x = 82
integer y = 1256
integer width = 270
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 16777215
boolean enabled = false
string text = "Datos Aco.:"
boolean focusrectangle = false
end type

type st_estado_sbt_t from statictext within w_asig_alim_sum_ct
integer x = 82
integer y = 1188
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 16777215
boolean enabled = false
string text = "Datos SBT:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_asig_alim_sum_ct
integer x = 1138
integer y = 1508
integer width = 302
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Generar"
end type

event clicked;IF rb_ct_fichero.Checked THEN
	IF sle_fichero.Text <> "" THEN
		iuo_sum_ct.of_procesar_fichero(1)
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Proceso finalizado. Revise el fichero " + sle_fichero.Text + " para saber el estado en que se ha quedado cada suministro")
	ELSE
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar un fichero")
	END IF
ELSE
	IF ib_hay_datos_arbol THEN  // EL ct no est$$HEX2$$e1002000$$ENDHEX$$en fichero. Debe existir uno seleccionado en el $$HEX1$$e100$$ENDHEX$$rbol
		IF rb_sum_fichero.checked THEN
			// Los suministros proceden de fichero
			IF sle_fichero.Text <> "" THEN // El fichero est$$HEX2$$e1002000$$ENDHEX$$definido
				iuo_sum_ct.of_procesar_fichero(2)
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Proceso finalizado. Revise el fichero " + sle_fichero.Text + " para saber el estado en que se ha quedado cada suministro")
			ELSE // El usuario no ha definido ning$$HEX1$$fa00$$ENDHEX$$n fichero
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar un un fichero")
			END IF
	
		ELSE // Los suministros proceden de un listado seleccionado desde la aplicaci$$HEX1$$f300$$ENDHEX$$n
			IF ib_hay_lista_sum THEN // Se han seleccionado los suministros desde el fichero
				iuo_sum_ct.of_procesar_fichero(2)
				iuo_sum_ct.of_mostrar_resultado()
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Proceso finalizado.")
			ELSE
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar un listado de suministros")
			END IF
		END IF
	ELSE
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar un CT para alimentar a los suministros")
	END IF
END IF
end event

type cb_sel_ct from commandbutton within w_asig_alim_sum_ct
integer x = 1513
integer y = 428
integer width = 393
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Seleccionar"
end type

event clicked;String ls_error
string ls_nom_ct, ls_nom_salbt, ls_nom_aco
TreeviewItem le_elemento
Long ll_handle, ll_handle_ant

gu_comunic.is_comunic.intval1=gi_nro_centro
gu_comunic.is_comunic.intval2=gi_nro_cmd
gu_comunic.is_comunic.intval3=gi_nro_puesto

IF gb_operador_cmd THEN		// filtra por centro y cmd solo
	gu_comunic.is_comunic.intval4 = 2
ELSE
	gu_comunic.is_comunic.intval4 = 1
END IF

//gu_comunic.is_comunic.intval6 = tab_1.ii_tipo_incid

gu_comunic.is_comunic.Accion_Llamada="Seleccion"
gu_comunic.is_comunic.Programa_Retorno=" "
gu_comunic.is_comunic.Accion_Retorno=" "
gu_comunic.is_comunic.longval1=0
gu_comunic.is_comunic.longval2=0
gu_comunic.is_comunic.longval3=0
gu_comunic.is_comunic.strval1=""
gu_comunic.is_comunic.strval2=""
gu_comunic.is_comunic.intval5=0
gu_comunic.is_comunic.programa_llamante="w_asig_sum_ct"


OpenWithParm(w_2120_identificacion_instalacion, gu_comunic.is_comunic.programa_llamante)

IF not isnull(gu_comunic1.is_comunic.decval1) AND gu_comunic1.is_comunic.decval1 <> 0 THEN  
	// Instalaci$$HEX1$$f300$$ENDHEX$$n Seleccionada
	tv_actual.deleteitem(0)
	tv_nueva.deleteitem(0)
	IF gu_comunic1.is_comunic.strval9 = "" OR IsNull(gu_comunic1.is_comunic.strval9) THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El CT seleccionado no tiene asignado ninguna matr$$HEX1$$ed00$$ENDHEX$$cula")
	ELSE
	//	MessageBox("Instalacion", gu_comunic1.is_comunic.decval1)
		//iuo_sum_ct.of_set_datos(gu_comunic1.is_comunic.decval1, gu_comunic1.is_comunic.strval9)
		iuo_sum_ct.of_set_datos(gu_comunic1.is_comunic.strval9)
		ls_error = iuo_sum_ct.of_validaciones_ct()
		IF ls_error = "" THEN
			ls_error = iuo_sum_ct.of_obtener_datos_ct(ls_nom_ct)
			IF ls_error = "" THEN
				ls_error = iuo_sum_ct.of_obtener_datos_sbt(ls_nom_salbt)
			END IF
	
			IF ls_Error = "" THEN
				ls_error = iuo_sum_ct.of_obtener_datos_aco(ls_nom_aco)
			END IF
			
			IF ls_Error = "" THEN
				le_elemento.label = ls_nom_ct
				le_elemento.pictureindex = tv_actual.f_icono_Arbol(fgci_tipo_ct)
				le_elemento.selectedpictureindex = tv_actual.f_icono_Arbol(fgci_tipo_ct)
				ll_handle = tv_actual.insertitemsort(0,le_elemento)
				IF ll_handle > 0 THEN
					IF iuo_sum_ct.ii_estado_sbt = iuo_sum_ct.SUM_CT_OK OR &
						iuo_sum_ct.ii_estado_sbt = iuo_sum_ct.SUM_CT_DATOS_ALFA_ERROR THEN
	
						le_elemento.label = ls_nom_salbt
						le_elemento.pictureindex = tv_actual.f_icono_Arbol(fgci_tipo_salida_de_baja)
						le_elemento.selectedpictureindex = tv_actual.f_icono_Arbol(fgci_tipo_salida_de_baja)
						ll_handle_ant = ll_handle
						ll_handle = tv_actual.insertitemsort(ll_handle,le_elemento)
						tv_actual.ExpandItem(ll_handle_ant)
						
						IF ll_handle > 0 THEN
							IF iuo_sum_ct.ii_estado_aco = iuo_sum_ct.SUM_CT_OK OR &
								iuo_sum_ct.ii_estado_aco = iuo_sum_ct.SUM_CT_DATOS_ALFA_ERROR THEN
	
								le_elemento.label = ls_nom_aco
								le_elemento.pictureindex = tv_actual.f_icono_Arbol(fgci_tipo_acometida)
								le_elemento.selectedpictureindex = tv_actual.f_icono_Arbol(fgci_tipo_acometida)
								ll_handle_ant = ll_handle
								ll_handle = tv_actual.insertitemsort(ll_handle,le_elemento)
								tv_actual.ExpandItem(ll_handle_ant)
							END IF
	
						END IF 
					END IF 
					CHOOSE CASE iuo_sum_ct.ii_estado_sbt
						CASE iuo_sum_ct.SUM_CT_OK
							st_estado_sbt.Text = 'OK'
							st_estado_sbt_nueva.Text = 'Sin cambios'
						CASE iuo_sum_ct.SUM_CT_DATOS_ALFA_ERROR
							st_estado_sbt.Text = 'Datos Alfanum$$HEX1$$e900$$ENDHEX$$ricos Incorrectos'
							st_estado_sbt_nueva.Text = 'Corregidos datos alfanum$$HEX1$$e900$$ENDHEX$$ricos'
						CASE iuo_sum_ct.SUM_CT_SIN_DATOS
							st_estado_sbt.Text = 'No encontrada'
							st_estado_sbt_nueva.Text = 'Nueva instalaci$$HEX1$$f300$$ENDHEX$$n'
						CASE iuo_sum_ct.SUM_CT_ERROR_INDEFINIDO
							st_estado_sbt.Text = 'Con Errores'	
					END CHOOSE
					CHOOSE CASE iuo_sum_ct.ii_estado_aco
						CASE iuo_sum_ct.SUM_CT_OK
							st_estado_aco.Text = 'OK'
							st_estado_aco_nueva.Text = 'Sin cambios'
						CASE iuo_sum_ct.SUM_CT_DATOS_ALFA_ERROR
							st_estado_aco.Text = 'Datos Alfanum$$HEX1$$e900$$ENDHEX$$ricos Incorrectos'
							st_estado_aco_nueva.Text = 'Corregidos datos alfanum$$HEX1$$e900$$ENDHEX$$ricos'
						CASE iuo_sum_ct.SUM_CT_SIN_DATOS
							st_estado_aco.Text = 'No encontrada'
							st_estado_aco_nueva.Text = 'Nueva instalaci$$HEX1$$f300$$ENDHEX$$n'
						CASE iuo_sum_ct.SUM_CT_ERROR_INDEFINIDO
							st_estado_aco.Text = 'Con Errores'	
					END CHOOSE
				
					le_elemento.label = ls_nom_ct
					le_elemento.pictureindex = tv_actual.f_icono_Arbol(fgci_tipo_ct)
					le_elemento.selectedpictureindex = tv_actual.f_icono_Arbol(fgci_tipo_ct)
					ll_handle = tv_nueva.insertitemsort(0,le_elemento)
					
					IF iuo_sum_ct.ii_estado_sbt = iuo_sum_ct.SUM_CT_DATOS_ALFA_ERROR OR &
						iuo_sum_ct.ii_estado_sbt = iuo_sum_ct.SUM_CT_SIN_DATOS THEN
						ls_error = iuo_sum_ct.of_obtener_datos_sbt_nueva(ls_nom_salbt)
					END IF
					
					IF ls_Error = "" THEN
						le_elemento.label = ls_nom_salbt
						le_elemento.pictureindex = tv_nueva.f_icono_Arbol(fgci_tipo_salida_de_baja)
						le_elemento.selectedpictureindex = tv_nueva.f_icono_Arbol(fgci_tipo_salida_de_baja)
						ll_handle_ant = ll_handle
						ll_handle = tv_nueva.insertitemsort(ll_handle,le_elemento)
						tv_nueva.ExpandItem(ll_handle_ant)
						
						IF iuo_sum_ct.ii_estado_aco = iuo_sum_ct.SUM_CT_DATOS_ALFA_ERROR OR &
							iuo_sum_ct.ii_estado_aco = iuo_sum_ct.SUM_CT_SIN_DATOS THEN
							ls_error = iuo_sum_ct.of_obtener_datos_aco_nueva(ls_nom_aco)
						END IF
						
						IF ls_error = "" THEN
							le_elemento.label = ls_nom_aco
							le_elemento.pictureindex = tv_nueva.f_icono_Arbol(fgci_tipo_acometida)
							le_elemento.selectedpictureindex = tv_nueva.f_icono_Arbol(fgci_tipo_acometida)
							ll_handle_ant = ll_handle
							ll_handle = tv_nueva.insertitemsort(ll_handle,le_elemento)
							tv_nueva.ExpandItem(ll_handle_ant)
						END IF
					END IF
				END IF
			END IF
			
		END IF
		IF ls_error <> "" THEN
			ib_hay_datos_arbol = FALSE
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_Error)
		ELSE 
			ib_hay_datos_arbol = TRUE
		END IF
	END IF	
END IF

end event

type rb_sel_ct from radiobutton within w_asig_alim_sum_ct
integer x = 1298
integer y = 332
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionar CT"
boolean checked = true
end type

event clicked;IF ii_origen_ct <> 2 THEN
	cb_sel_ct.enabled = True
	sle_fichero.Text = ""
	iuo_sum_ct.of_origen_sum(2)
	ii_origen_ct = 2
END IF
end event

type rb_ct_fichero from radiobutton within w_asig_alim_sum_ct
integer x = 1298
integer y = 224
integer width = 754
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Extraer datos del fichero"
end type

event clicked;IF ii_origen_ct <> 1 THEN
	tv_actual.deleteitem(0)
	tv_nueva.deleteitem(0)
	st_estado_aco.Text = ''
	st_estado_aco_nueva.Text = ''
	st_estado_sbt.Text = ''
	st_estado_sbt_nueva.Text = ''
	cb_sel_ct.enabled = False
	ib_hay_datos_arbol = FALSE
	sle_fichero.Text = ""
	iuo_sum_ct.of_origen_sum(1)
	ii_origen_ct = 1
END IF
end event

type cb_sel_sum from commandbutton within w_asig_alim_sum_ct
integer x = 434
integer y = 424
integer width = 393
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Seleccionar"
end type

event clicked;string ls_nom_fichero
Long ll_ret

IF rb_sum_fichero.checked THEN
	ls_nom_fichero = iuo_sum_ct.of_cargar_sum_fichero()
	//IF ls_nom_fichero <> "" THEN
		sle_fichero.Text = ls_nom_fichero
	//END IF
ELSE
	ll_ret = iuo_sum_ct.of_seleccionar_sum_lista()
	ib_hay_lista_sum = (ll_ret > 0)
	IF ib_hay_lista_sum THEN 
		st_est_listado_bd.Text = 'Definido'
	ELSE
		st_est_listado_bd.Text = 'No definido'
	END IF
END IF
end event

type rb_sum_bd from radiobutton within w_asig_alim_sum_ct
integer x = 137
integer y = 332
integer width = 521
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base de Datos:"
end type

event clicked;IF ii_origen_sum <> 2 THEN
	cb_sel_ct.enabled = TRUE
	rb_sel_ct.checked = TRUE
	rb_ct_fichero.checked = False
	rb_ct_fichero.enabled = False
	sle_fichero.Text = ""
	iuo_sum_ct.of_origen_sum(2)
	ii_origen_sum = 2
	ii_origen_ct = 2
END IF
end event

type rb_sum_fichero from radiobutton within w_asig_alim_sum_ct
integer x = 137
integer y = 232
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fichero: "
boolean checked = true
end type

event clicked;IF ii_origen_sum <> 1 THEN
	rb_ct_fichero.enabled = ib_supervisor
	ib_hay_lista_sum = False
	IF rb_ct_fichero.Checked THEN
		iuo_sum_ct.of_origen_sum(1)
	ELSE
		iuo_sum_ct.of_origen_sum(2)
	END IF
	st_est_listado_bd.Text = 'No definido'
	ii_origen_sum = 1
END IF
end event

type gb_ct from groupbox within w_asig_alim_sum_ct
integer x = 1234
integer y = 132
integer width = 1042
integer height = 432
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos del CT "
end type

type gb_sum from groupbox within w_asig_alim_sum_ct
integer x = 105
integer y = 128
integer width = 1093
integer height = 432
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen de los Suministros"
end type

type gb_criterio from groupbox within w_asig_alim_sum_ct
integer x = 46
integer y = 32
integer width = 2295
integer height = 600
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio de Selecci$$HEX1$$f300$$ENDHEX$$n  "
end type

type st_estado_aco_t from statictext within w_asig_alim_sum_ct
integer x = 1344
integer y = 1252
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 16777215
boolean enabled = false
string text = "Datos Aco.:"
boolean focusrectangle = false
end type

type st_estado_sbt_nueva_t from statictext within w_asig_alim_sum_ct
integer x = 1344
integer y = 1184
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 16777215
boolean enabled = false
string text = "Datos SBT:"
boolean focusrectangle = false
end type

type st_estado_aco from statictext within w_asig_alim_sum_ct
integer x = 343
integer y = 1260
integer width = 896
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean focusrectangle = false
end type

type st_estado_sbt from statictext within w_asig_alim_sum_ct
integer x = 343
integer y = 1188
integer width = 896
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean focusrectangle = false
end type

type tv_actual from uo_man_instalac within w_asig_alim_sum_ct
integer x = 69
integer y = 820
integer width = 1175
integer height = 592
integer taborder = 50
fontcharset fontcharset = ansi!
boolean border = true
end type

type gb_actual from groupbox within w_asig_alim_sum_ct
integer x = 41
integer y = 724
integer width = 1230
integer height = 720
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jerarqu$$HEX1$$ed00$$ENDHEX$$a actual "
end type

type tv_nueva from uo_man_instalac within w_asig_alim_sum_ct
integer x = 1330
integer y = 820
integer width = 1184
integer height = 592
integer taborder = 60
fontcharset fontcharset = ansi!
boolean border = true
end type

type gb_nueva from groupbox within w_asig_alim_sum_ct
integer x = 1307
integer y = 724
integer width = 1230
integer height = 724
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jerarqu$$HEX1$$ed00$$ENDHEX$$a nueva"
end type


HA$PBExportHeader$w_2401_ayuda_materiales.srw
forward
global type w_2401_ayuda_materiales from w_sgigenerica
end type
type d_ale from datawindow within w_2401_ayuda_materiales
end type
type sle_mat_seleccionado from singlelineedit within w_2401_ayuda_materiales
end type
type st_1 from statictext within w_2401_ayuda_materiales
end type
type tv_lista_materiales from u_tv_generico within w_2401_ayuda_materiales
end type
type cb_buscar from commandbutton within w_2401_ayuda_materiales
end type
type cb_cancelar from commandbutton within w_2401_ayuda_materiales
end type
type cb_aceptar from commandbutton within w_2401_ayuda_materiales
end type
end forward

global type w_2401_ayuda_materiales from w_sgigenerica
integer x = 713
integer y = 512
integer width = 2235
integer height = 1380
string title = "OPEN SGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Materiales"
windowtype windowtype = response!
long backcolor = 79741120
d_ale d_ale
sle_mat_seleccionado sle_mat_seleccionado
st_1 st_1
tv_lista_materiales tv_lista_materiales
cb_buscar cb_buscar
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global w_2401_ayuda_materiales w_2401_ayuda_materiales

type variables
long il_registro
boolean ib_ultimo_nivel = False
string is_descripcion_material
string is_codigo_material
string is_unidad_medida
end variables

on w_2401_ayuda_materiales.create
int iCurrent
call super::create
this.d_ale=create d_ale
this.sle_mat_seleccionado=create sle_mat_seleccionado
this.st_1=create st_1
this.tv_lista_materiales=create tv_lista_materiales
this.cb_buscar=create cb_buscar
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_ale
this.Control[iCurrent+2]=this.sle_mat_seleccionado
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.tv_lista_materiales
this.Control[iCurrent+5]=this.cb_buscar
this.Control[iCurrent+6]=this.cb_cancelar
this.Control[iCurrent+7]=this.cb_aceptar
end on

on w_2401_ayuda_materiales.destroy
call super::destroy
destroy(this.d_ale)
destroy(this.sle_mat_seleccionado)
destroy(this.st_1)
destroy(this.tv_lista_materiales)
destroy(this.cb_buscar)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;call super::open;////////////////////////////////////
//	Abre la ventana de seleccion del material
//
//	No recibe ningun parametro.
//
//	Devuelve en gu_comunic.is_comunic.strval1 el codigo del material
//					gu_comunic.is_comunic.strval2 la descripcion
//					gu_comunic.is_comunic.strval3 la unidad_medida
//
//
//
//
//
////////////////////////////////////

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2401_ayuda_materiales
end type

type d_ale from datawindow within w_2401_ayuda_materiales
boolean visible = false
integer x = 1934
integer y = 668
integer width = 494
integer height = 360
integer taborder = 41
string dataobject = "d_inst_1"
boolean livescroll = true
end type

type sle_mat_seleccionado from singlelineedit within w_2401_ayuda_materiales
integer x = 773
integer y = 1140
integer width = 1390
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "Arrow!"
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_2401_ayuda_materiales
integer x = 50
integer y = 1148
integer width = 727
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Material Seleccionado:"
boolean focusrectangle = false
end type

type tv_lista_materiales from u_tv_generico within w_2401_ayuda_materiales
integer x = 55
integer y = 52
integer width = 1673
integer height = 1052
integer taborder = 10
integer indent = 0
boolean hasbuttons = false
boolean linesatroot = false
string picturename[] = {"CreateRuntime!","UserObject5!","Application5!"}
long statepicturemaskcolor = 0
end type

event constructor;call super::constructor;// Refrescar el treeview


This.of_SetNivel(1,"d_inc_2039_subfamilia_materiales","descripcion","")
// GNU 22-3-2006. Mejora materiales
//This.of_SetNivel(2,"d_inc_2040_clase_materiales","descripcion","")
This.of_SetNivel(2,"d_inc_2040_clase_materiales","descripcion","subfamilia_materiales")
// FIN GNU
This.of_SetNivel(3,"d_inc_2041_materiales","descripcion","clase_hijos")

This.of_Refrescar_Arbol()

This.ExpandItem(1)
end event

event doubleclicked;call super::doubleclicked;// Si estoy en el ultimo nivel cargo los parametros de salida
// y cierro la ventana

if ib_ultimo_nivel then 
	gu_comunic.is_comunic.strval1 = is_codigo_material
	gu_comunic.is_comunic.strval2 = is_descripcion_material
	gu_comunic.is_comunic.strval3 = is_unidad_medida
	
	Close(Parent)
end if
end event

event selectionchanged;call super::selectionchanged;// Recuperar el material seleccionado

TreeViewItem ltvi_This
long ll_registro
DataStore lds_DS

// Verifico si es un valor v$$HEX1$$e100$$ENDHEX$$lido
IF newhandle > 0 THEN
	// Recuperamos el Treeview
	IF This.GetItem(newhandle, ltvi_This) > 0 THEN
		// Si estoy en el ultimo nivel permito seleccionar
		IF ltvi_This.Level = 3 THEN
			// Recupero el registro seleccionado
			// Quiero recuperar el c$$HEX1$$f300$$ENDHEX$$digo de material y la descripcion
			ll_registro = This.of_Recuperar_Registro(lds_DS,ltvi_This)
			IF ll_registro > 0 THEN
				// Encontr$$HEX2$$f3002000$$ENDHEX$$el registro a utilizar
				// Muestro el registro en el single line edit
				il_registro = ll_registro
				is_codigo_material = lds_DS.Object.cod_material[ll_registro] // Ale
				is_descripcion_material = lds_DS.Object.descripcion[ll_registro]
				is_unidad_medida = lds_DS.Object.unidad_medida[ll_registro]
				sle_mat_seleccionado.Text = is_descripcion_material
				IF ltvi_This.Level = 3 THEN
					// Si estoy en el ultimo nivel del arbol prendo bandera para
					// recoger el dato desde el dobleclick
					ib_ultimo_nivel = TRUE
				ELSE
					ib_ultimo_nivel = FALSE
				END IF
			END IF
		ELSE
			ib_ultimo_nivel = FALSE
		END IF
	END IF
END IF


end event

type cb_buscar from commandbutton within w_2401_ayuda_materiales
integer x = 1801
integer y = 100
integer width = 293
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Buscar"
end type

event clicked;string ls_descripcion
boolean lb_case
boolean lb_completa
int li_handle

lb_case = False
lb_completa = False

// LLamo a la ventana de respuesta en la que el usuario ingresa
// el texto a buscar
open(w_2402_busqueda_materiales)

// Recogo la informacion devuelta por la ventana
ls_descripcion = gu_comunic.is_comunic.strval3
IF gu_comunic.is_comunic.intval3 = 1 THEN
	lb_case = TRUE
END IF

IF gu_comunic.is_comunic.intval4 = 1 THEN
	lb_completa = TRUE
END IF

// Si retorn$$HEX2$$f3002000$$ENDHEX$$un valor v$$HEX1$$e100$$ENDHEX$$lido
IF Len(Trim(ls_descripcion)) > 0 THEN
	// LLamo a la funcion del $$HEX1$$e100$$ENDHEX$$rbol que busca el item cuya descripcion coincida
	// con el texto recibido
	li_handle = tv_lista_materiales.of_Buscar("Label",ls_descripcion,0,3,lb_case,lb_completa)
	
	// Si no encontr$$HEX2$$e9002000$$ENDHEX$$el material, mensaje
	IF li_handle = 0 THEN
		gnv_msg.f_mensaje("AI99","","",OK!)
		tv_lista_materiales.Selectitem(1)
		ib_ultimo_nivel = FALSE
		//MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se encontr$$HEX2$$f3002000$$ENDHEX$$el material especificado.")
	// Si encontr$$HEX2$$e9002000$$ENDHEX$$el material
	ELSEIF li_handle > 0 THEN
		// expando el arbol y selecciono el material encontrado 
		tv_lista_materiales.SelectItem( li_handle )
		cb_aceptar.SetFocus()
	END IF
	
END IF

Parent.Setredraw(TRUE)
tv_lista_materiales.setredraw(true)
end event

type cb_cancelar from commandbutton within w_2401_ayuda_materiales
integer x = 1801
integer y = 372
integer width = 293
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;// Reseteo la estructura en la que devuelvo los parametros de retorno
// de la ventana y la cierro

gu_comunic.is_comunic.strval1 = ""
gu_comunic.is_comunic.strval2 = ""
gu_comunic.is_comunic.strval3 = ""


Close(Parent)
end event

type cb_aceptar from commandbutton within w_2401_ayuda_materiales
integer x = 1801
integer y = 256
integer width = 293
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;// Si estoy en el ultimo nivel del $$HEX1$$e100$$ENDHEX$$rbol cargo los 
// parametros en la estructura de salida y cierro la ventana, 
// si no envio mensaje indicando que se debe seleccionar
// un material antes


IF ib_ultimo_nivel THEN
	gu_comunic.is_comunic.strval1 = is_codigo_material
	gu_comunic.is_comunic.strval2 = is_descripcion_material
	gu_comunic.is_comunic.strval3 = is_unidad_medida
	Close(Parent)
ELSE
	gnv_msg.f_mensaje("AI100","","",OK!)
	//MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar un material")
END IF
end event


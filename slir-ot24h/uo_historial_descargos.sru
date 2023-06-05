HA$PBExportHeader$uo_historial_descargos.sru
forward
global type uo_historial_descargos from userobject
end type
type cb_reducir from commandbutton within uo_historial_descargos
end type
type mle_observaciones from multilineedit within uo_historial_descargos
end type
type dw_historial from datawindow within uo_historial_descargos
end type
end forward

global type uo_historial_descargos from userobject
integer width = 3026
integer height = 1540
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_reducir cb_reducir
mle_observaciones mle_observaciones
dw_historial dw_historial
end type
global uo_historial_descargos uo_historial_descargos

type variables
Boolean ib_cambios = False
end variables

on uo_historial_descargos.create
this.cb_reducir=create cb_reducir
this.mle_observaciones=create mle_observaciones
this.dw_historial=create dw_historial
this.Control[]={this.cb_reducir,&
this.mle_observaciones,&
this.dw_historial}
end on

on uo_historial_descargos.destroy
destroy(this.cb_reducir)
destroy(this.mle_observaciones)
destroy(this.dw_historial)
end on

type cb_reducir from commandbutton within uo_historial_descargos
boolean visible = false
integer x = 2825
integer y = 1432
integer width = 91
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<-"
end type

event clicked;dw_historial.enabled = TRUE

IF IsNull(mle_observaciones.text) THEN mle_observaciones.text = ""

IF (dw_historial.GetItemString(dw_historial.GetRow(), 'obs_estado') <> mle_observaciones.text) OR &
   (IsNull(dw_historial.GetItemString(dw_historial.GetRow(), 'obs_estado')) AND &
	 mle_observaciones.text <> "") THEN

	ib_cambios = True
	dw_historial.SetItem(dw_historial.GetRow(), 'obs_estado', mle_observaciones.text)
END IF

mle_observaciones.visible = False
cb_reducir.visible = False
dw_historial.SelectRow(dw_historial.GetRow(), False)
end event

type mle_observaciones from multilineedit within uo_historial_descargos
boolean visible = false
integer x = 814
integer y = 36
integer width = 2185
integer height = 1480
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
end type

type dw_historial from datawindow within uo_historial_descargos
integer y = 64
integer width = 2994
integer height = 1496
integer taborder = 10
string dataobject = "d_historial_descargos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;String ls_texto

/*SFP INI DEO14-00000245 DSU 12/03/2014 */

//	This.SetRow(row)
//	This.SetColumn('gi_usuario_sgi_nom_usuario')
// This.ScrollToRow(row)
//SE UTILIZA PARAMETRO NUMERICO EN VEZ DE NOMBRE DE
//LA COLUMNA gi_usuario_sgi_nom_usuario

	IF row > 0 THEN
		IF dwo.name = 'b_1' THEN
			
				this.SetRow(row)
				This.SetColumn(1)
	
				ls_texto = This.GetItemString(row, 'obs_estado')
				This.SelectRow(row, True)
				
				IF IsNull(ls_texto) THEN ls_texto = ""
					
				
				mle_observaciones.text = ls_texto
				
				mle_observaciones.visible = True
				cb_reducir.visible = True
				
				This.enabled = False
				
		END IF 		
	END IF

/*SFP-FIN DSU DEO14-00000245.*/
end event

event editchanged;ib_cambios = True
end event


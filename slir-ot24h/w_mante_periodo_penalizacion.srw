HA$PBExportHeader$w_mante_periodo_penalizacion.srw
forward
global type w_mante_periodo_penalizacion from w_sgigenerica
end type
type dw_periodos from u_periodo_penalizacion within w_mante_periodo_penalizacion
end type
type cb_agregar from commandbutton within w_mante_periodo_penalizacion
end type
type cb_eliminar from commandbutton within w_mante_periodo_penalizacion
end type
type cb_aceptar from commandbutton within w_mante_periodo_penalizacion
end type
type cb_cerrar from commandbutton within w_mante_periodo_penalizacion
end type
end forward

global type w_mante_periodo_penalizacion from w_sgigenerica
int Width=2853
WindowType WindowType=response!
boolean TitleBar=true
string Title="Mantenimiento de Periodos de Penalizaci$$HEX1$$f300$$ENDHEX$$n"
long BackColor=80269524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
dw_periodos dw_periodos
cb_agregar cb_agregar
cb_eliminar cb_eliminar
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
end type
global w_mante_periodo_penalizacion w_mante_periodo_penalizacion

on w_mante_periodo_penalizacion.create
int iCurrent
call super::create
this.dw_periodos=create dw_periodos
this.cb_agregar=create cb_agregar
this.cb_eliminar=create cb_eliminar
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_periodos
this.Control[iCurrent+2]=this.cb_agregar
this.Control[iCurrent+3]=this.cb_eliminar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.cb_cerrar
end on

on w_mante_periodo_penalizacion.destroy
call super::destroy
destroy(this.dw_periodos)
destroy(this.cb_agregar)
destroy(this.cb_eliminar)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
end on

event closequery;call super::closequery;long ll_respuesta

IF dw_periodos.ib_modificado THEN
	ll_respuesta = Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Existen cambios sin grabar, $$HEX1$$bf00$$ENDHEX$$desea grabar las modificaciones?", Question!, YesNoCancel!)
	IF ll_respuesta = 1 THEN
		cb_aceptar.TriggerEvent(Clicked!)
		IF dw_periodos.ib_modificado THEN // Se ha producido un error. No dejamos cerrar la ventana
			return 1
		END IF
		Return 0
	ELSEIF ll_respuesta = 2 THEN
		gnu_u_transaction.uf_rollback()
		return 0
	ELSE
		return 1
	END IF
ELSE
	return 0
END IF
end event

type dw_periodos from u_periodo_penalizacion within w_mante_periodo_penalizacion
int X=50
int Y=120
int Height=992
int TabOrder=10
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
end type

type cb_agregar from commandbutton within w_mante_periodo_penalizacion
int X=197
int Y=1192
int Width=398
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="&Agregar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_periodos.of_agregar()


end event

type cb_eliminar from commandbutton within w_mante_periodo_penalizacion
int X=910
int Y=1192
int Width=398
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="&Eliminar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_periodos.of_eliminar()
		
end event

type cb_aceptar from commandbutton within w_mante_periodo_penalizacion
int X=1614
int Y=1192
int Width=398
int Height=108
int TabOrder=40
boolean BringToTop=true
string Text="Ace&ptar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_periodos.of_aceptar()
end event

type cb_cerrar from commandbutton within w_mante_periodo_penalizacion
int X=2341
int Y=1192
int Width=398
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="&Cerrar"
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_periodos.AcceptText()
Close(Parent)

end event


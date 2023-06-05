HA$PBExportHeader$w_anular_incidencias.srw
forward
global type w_anular_incidencias from w_sgigenerica
end type
type dw_codigo from datawindow within w_anular_incidencias
end type
type cb_aceptar from commandbutton within w_anular_incidencias
end type
type cb_cancelar from commandbutton within w_anular_incidencias
end type
type mle_1 from multilineedit within w_anular_incidencias
end type
type gb_1 from groupbox within w_anular_incidencias
end type
end forward

global type w_anular_incidencias from w_sgigenerica
int X=631
int Y=640
int Width=2446
int Height=1252
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Anulaci$$HEX1$$f300$$ENDHEX$$n de incidencias"
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
dw_codigo dw_codigo
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
mle_1 mle_1
gb_1 gb_1
end type
global w_anular_incidencias w_anular_incidencias

type variables
 u_generico_comunicaciones iu_comunic
boolean ib_cambios = false
end variables

on w_anular_incidencias.create
int iCurrent
call super::create
this.dw_codigo=create dw_codigo
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.mle_1=create mle_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_codigo
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.mle_1
this.Control[iCurrent+5]=this.gb_1
end on

on w_anular_incidencias.destroy
call super::destroy
destroy(this.dw_codigo)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.mle_1)
destroy(this.gb_1)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : open
//
//  Argumentos : intval1 ---> Cod_motivo
//					  datval1 --> Fecha_anulacion
//					  strval1 --> Usuario Anulacion
//					  strval2 --> Descripcion anulacion
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Abre la ventana de Anulacion de incidencias dependiendo de Accion_llamada
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 17/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

iu_comunic = create u_generico_comunicaciones

iu_comunic.is_comunic = gu_comunic.is_comunic

datawindowchild ddw_codigo 

dw_codigo.GetChild('codigo_motivo',ddw_codigo)
ddw_codigo.SetTransObject(SQLCA)
ddw_codigo.Retrieve()
dw_codigo.insertrow(0)

if iu_comunic.is_comunic.Accion_llamada= "Consulta" then 
	
	dw_codigo.setitem(1,"codigo_motivo",iu_comunic.is_comunic.intval1)	
	dw_codigo.setitem(1,"usuario",iu_comunic.is_comunic.strval1)
	dw_codigo.setitem(1,"fecha_anulacion",iu_comunic.is_comunic.datval1)

	mle_1.text = iu_comunic.is_comunic.strval2
	mle_1.backcolor = long(gs_gris)
	mle_1.displayonly = true 
	dw_codigo.object.codigo_motivo.protect =1
	dw_codigo.object.codigo_motivo.background.color = gs_gris
	dw_codigo.enabled = false
	cb_aceptar.enabled = false
	cb_aceptar.visible = false
	cb_cancelar.text ="&Cerrar"
	cb_cancelar.default = true
	this.title = "OPEN SGI - Consulta de motivos de anulaci$$HEX1$$f300$$ENDHEX$$n"
	cb_cancelar.x = cb_cancelar.x - 250
else
//	mle_1.enabled = false
	dw_codigo.setitem(1,"usuario",iu_comunic.is_comunic.strval1)
	dw_codigo.setitem(1,"fecha_anulacion",iu_comunic.is_comunic.datval1)
end if
end event

event closequery;call super::closequery;/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : closequery
//
//  Argumentos : intval1 <-- Cod_motivo o -1 (sin cambios)
//					  datval1 <-- Fecha_anulacion
//					  strval1 <-- Usuario Anulacion
//					  strval2 <-- Descripcion anulacion
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Devuelve 
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 17/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int li_motivo
 
 


if iu_comunic.is_comunic.Accion_llamada<> "Consulta" then 
	if ib_cambios then
		dw_codigo.accepttext()
		li_motivo = dw_codigo.getitemnumber(1,"codigo_motivo")
		if isnull(li_motivo) then 
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", " Debe seleccionar el motivo de la anulaci$$HEX1$$f300$$ENDHEX$$n", Information!)
			ib_cambios = false
				return 1
		end if	
		iu_comunic.is_comunic.intval1 = li_motivo
		iu_comunic.is_comunic.strval1 = dw_codigo.getitemstring(1,"usuario")
		iu_comunic.is_comunic.datval1 = dw_codigo.getitemdatetime(1,"fecha_anulacion")
			iu_comunic.is_comunic.strval2 = mle_1.text
	else
		iu_comunic.is_comunic.intval1 =  -1  // SIN CAMBIOS
	end if
		gu_comunic.is_comunic = iu_comunic.is_comunic	
end if
	
destroy iu_comunic
end event

type dw_codigo from datawindow within w_anular_incidencias
int X=119
int Y=196
int Width=2176
int Height=272
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_codigo_motivo"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;//
//if dwo.name = "codigo_motivo" then
//	mle_1.text=""
//	if long(data) = fgci_cod_motivo_otros  then 
//		mle_1.enabled = true
//	else
//		mle_1.enabled = false
//	end if
//	
//	
//end if
end event

type cb_aceptar from commandbutton within w_anular_incidencias
int X=763
int Y=984
int Width=425
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="&Aceptar"
boolean Default=true
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;ib_cambios = true
close(parent)
end event

type cb_cancelar from commandbutton within w_anular_incidencias
int X=1253
int Y=984
int Width=425
int Height=108
int TabOrder=40
boolean BringToTop=true
string Text="&Cancelar"
boolean Cancel=true
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;ib_cambios= false
close(parent)
end event

type mle_1 from multilineedit within w_anular_incidencias
int X=119
int Y=464
int Width=2176
int Height=396
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean AutoHScroll=true
boolean AutoVScroll=true
boolean HideSelection=false
boolean IgnoreDefaultButton=true
int Limit=1023
long TextColor=8388608
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_anular_incidencias
int X=69
int Y=116
int Width=2281
int Height=788
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=81324524
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


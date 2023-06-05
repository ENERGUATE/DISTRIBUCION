HA$PBExportHeader$w_2272_historico_brigadista.srw
forward
global type w_2272_historico_brigadista from w_sgigenerica
end type
type dw_lista_historico_brigadista from u_bri_2272_pr_lista_historico_brigadista within w_2272_historico_brigadista
end type
type gb_1 from groupbox within w_2272_historico_brigadista
end type
type st_brigadista from statictext within w_2272_historico_brigadista
end type
end forward

global type w_2272_historico_brigadista from w_sgigenerica
int X=5
int Y=4
int Width=3653
int Height=2400
WindowType WindowType=response!
long BackColor=79741120
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
string Icon="brigadista.ico"
dw_lista_historico_brigadista dw_lista_historico_brigadista
gb_1 gb_1
st_brigadista st_brigadista
end type
global w_2272_historico_brigadista w_2272_historico_brigadista

on w_2272_historico_brigadista.create
int iCurrent
call super::create
this.dw_lista_historico_brigadista=create dw_lista_historico_brigadista
this.gb_1=create gb_1
this.st_brigadista=create st_brigadista
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lista_historico_brigadista
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.st_brigadista
end on

on w_2272_historico_brigadista.destroy
call super::destroy
destroy(this.dw_lista_historico_brigadista)
destroy(this.gb_1)
destroy(this.st_brigadista)
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
//FG_COLOCAR_VENTANA(w_2272_historico_brigadista)

st_brigadista.Text = gu_comunic.is_comunic.strval1
long ll_cant_filas

this.Title = "Hist$$HEX1$$f300$$ENDHEX$$rico de Brigadista"

dw_lista_historico_brigadista.SetTransObject (SQLCA)
dw_lista_historico_brigadista.retrieve(gu_comunic.is_comunic.longval1)
ll_cant_filas=dw_lista_historico_brigadista.RowCount()
IF ll_cant_filas > 0 THEN
	dw_lista_historico_brigadista.ScrollToRow(1)
else
	gnv_msg.f_mensaje("AG03","","",Ok!)
	close(this)
	return
END IF

end event

type dw_lista_historico_brigadista from u_bri_2272_pr_lista_historico_brigadista within w_2272_historico_brigadista
int X=197
int Y=380
int Width=3049
int Height=1448
int TabOrder=10
boolean HScrollBar=true
boolean VScrollBar=true
end type

event clicked;call super::clicked;This.SetRowFocusIndicator(Hand!)
This.ScrollToRow(row)
end event

type gb_1 from groupbox within w_2272_historico_brigadista
int X=206
int Y=116
int Width=1143
int Height=184
int TabOrder=20
string Text=" Brigadista "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_brigadista from statictext within w_2272_historico_brigadista
int X=251
int Y=196
int Width=1074
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


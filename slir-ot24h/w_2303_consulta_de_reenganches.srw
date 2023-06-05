HA$PBExportHeader$w_2303_consulta_de_reenganches.srw
forward
global type w_2303_consulta_de_reenganches from w_sgigenerica
end type
type st_cantidades from statictext within w_2303_consulta_de_reenganches
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2303_consulta_de_reenganches
end type
type rb_maniobras from radiobutton within w_2303_consulta_de_reenganches
end type
type rb_interrupciones from radiobutton within w_2303_consulta_de_reenganches
end type
type dw_datos_reenganche from datawindow within w_2303_consulta_de_reenganches
end type
type st_titulo from statictext within w_2303_consulta_de_reenganches
end type
type dw_lista_maniobras from u_inc_2052_lista_maniobras within w_2303_consulta_de_reenganches
end type
type gb_2 from groupbox within w_2303_consulta_de_reenganches
end type
type gb_1 from groupbox within w_2303_consulta_de_reenganches
end type
end forward

global type w_2303_consulta_de_reenganches from w_sgigenerica
int X=5
int Y=148
int Width=3657
int Height=2120
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Detalle de Reenganches"
string Icon="reenganche.ico"
st_cantidades st_cantidades
d_ambito d_ambito
rb_maniobras rb_maniobras
rb_interrupciones rb_interrupciones
dw_datos_reenganche dw_datos_reenganche
st_titulo st_titulo
dw_lista_maniobras dw_lista_maniobras
gb_2 gb_2
gb_1 gb_1
end type
global w_2303_consulta_de_reenganches w_2303_consulta_de_reenganches

type variables
u_generico_comunicaciones  iu_gen_comunic_w_2303

long il_nro_incidencia

long il_nro_interrupciones
end variables

on w_2303_consulta_de_reenganches.create
int iCurrent
call super::create
this.st_cantidades=create st_cantidades
this.d_ambito=create d_ambito
this.rb_maniobras=create rb_maniobras
this.rb_interrupciones=create rb_interrupciones
this.dw_datos_reenganche=create dw_datos_reenganche
this.st_titulo=create st_titulo
this.dw_lista_maniobras=create dw_lista_maniobras
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_cantidades
this.Control[iCurrent+2]=this.d_ambito
this.Control[iCurrent+3]=this.rb_maniobras
this.Control[iCurrent+4]=this.rb_interrupciones
this.Control[iCurrent+5]=this.dw_datos_reenganche
this.Control[iCurrent+6]=this.st_titulo
this.Control[iCurrent+7]=this.dw_lista_maniobras
this.Control[iCurrent+8]=this.gb_2
this.Control[iCurrent+9]=this.gb_1
end on

on w_2303_consulta_de_reenganches.destroy
call super::destroy
destroy(this.st_cantidades)
destroy(this.d_ambito)
destroy(this.rb_maniobras)
destroy(this.rb_interrupciones)
destroy(this.dw_datos_reenganche)
destroy(this.st_titulo)
destroy(this.dw_lista_maniobras)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: open w_2303_consulta_de_reenganches
//
// Objetivo: Recibo el c$$HEX1$$f300$$ENDHEX$$digo de reenganche como par$$HEX1$$e100$$ENDHEX$$metro y recupero los datos de los reenganches y las maniobras.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            	Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------        		------------------            	 --------------
// 13/12/2000	    	FDO
//		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////////

iu_gen_comunic_w_2303 = CREATE u_generico_comunicaciones 

iu_gen_comunic_w_2303.is_comunic  = gu_comunic.is_comunic

dw_lista_maniobras.settransobject(sqlca)

dw_lista_maniobras.reset()

il_nro_incidencia = iu_gen_comunic_w_2303.is_comunic.longval1

dw_lista_maniobras.retrieve(il_nro_incidencia)

dw_datos_reenganche.settransobject(sqlca)

dw_datos_reenganche.retrieve(il_nro_incidencia)

d_ambito.fpr_crea_dddw()
d_ambito.f_insertar_fila()

d_ambito.object.nro_centro[1] = dw_datos_reenganche.object.nro_zona[1]
d_ambito.object.nro_cmd[1] = dw_datos_reenganche.object.nro_cmd[1]
d_ambito.object.nro_mesa[1] = dw_datos_reenganche.object.nro_sector[1]

d_ambito.fnu_des_centro()
d_ambito.fnu_des_cmd()
d_ambito.fnu_des_puesto()

end event

type st_cantidades from statictext within w_2303_consulta_de_reenganches
int X=2981
int Y=880
int Width=594
int Height=60
boolean Enabled=false
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=79741120
long BackColor=8421504
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2303_consulta_de_reenganches
int X=2546
int Y=100
int TabOrder=30
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

type rb_maniobras from radiobutton within w_2303_consulta_de_reenganches
int X=2587
int Y=560
int Width=910
int Height=76
int TabOrder=60
string Text="Listado de maniobras"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_lista_maniobras.dataobject = 'd_inc_2051_lista_maniobras_reen'

dw_lista_maniobras.settransobject(sqlca)

dw_lista_maniobras.retrieve(il_nro_incidencia)

 st_titulo.text = ' Listado de maniobras.'
 
 st_cantidades.visible=false
end event

type rb_interrupciones from radiobutton within w_2303_consulta_de_reenganches
int X=2587
int Y=652
int Width=910
int Height=76
int TabOrder=50
string Text="Listado de interrupciones"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_lista_maniobras.dataobject= 'd_lista_interrupciones_operacion_reen'

dw_lista_maniobras.settransobject(sqlca)

dw_lista_maniobras.retrieve(il_nro_incidencia)

st_titulo.text = ' Listado de interrupciones.'
 
SELECT count(*) 
INTO :il_nro_interrupciones
FROM SGD_INTERRUPCION_REENGANCHE
WHERE NRO_INCIDENCIA = :il_nro_incidencia;

st_cantidades.text = "(" + string(dw_lista_maniobras.rowcount()) + " de " + string(il_nro_interrupciones) + ")"

st_cantidades.visible=true
end event

type dw_datos_reenganche from datawindow within w_2303_consulta_de_reenganches
int X=73
int Y=108
int Width=1906
int Height=704
int TabOrder=20
string DataObject="d_detalle_reenganches"
boolean Border=false
boolean LiveScroll=true
end type

type st_titulo from statictext within w_2303_consulta_de_reenganches
int X=32
int Y=872
int Width=3552
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text=" Listado de maniobras."
boolean FocusRectangle=false
long TextColor=79741120
long BackColor=8421504
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_lista_maniobras from u_inc_2052_lista_maniobras within w_2303_consulta_de_reenganches
int X=32
int Y=944
int Width=3557
int Height=1020
int TabOrder=30
string DataObject="d_inc_2051_lista_maniobras_reen"
boolean HScrollBar=true
boolean VScrollBar=true
end type

event scrollvertical;call super::scrollvertical;st_cantidades.text = "(" + string(dw_lista_maniobras.rowcount()) + " de " + string(il_nro_interrupciones) + ")"

end event

type gb_2 from groupbox within w_2303_consulta_de_reenganches
int X=2560
int Y=496
int Width=960
int Height=256
int TabOrder=40
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

type gb_1 from groupbox within w_2303_consulta_de_reenganches
int X=37
int Y=36
int Width=3547
int Height=804
int TabOrder=10
string Text="Datos del Reenganche"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


HA$PBExportHeader$w_id0107_areas.srw
forward
global type w_id0107_areas from w_sgigenerica
end type
type cb_2 from u_cb within w_id0107_areas
end type
type cb_1 from u_cb within w_id0107_areas
end type
type dw_1 from u_gen_id0104_a within w_id0107_areas
end type
type st_1 from statictext within w_id0107_areas
end type
type st_2 from statictext within w_id0107_areas
end type
type st_3 from statictext within w_id0107_areas
end type
type sle_1 from singlelineedit within w_id0107_areas
end type
type sle_2 from singlelineedit within w_id0107_areas
end type
type sle_3 from singlelineedit within w_id0107_areas
end type
type st_4 from statictext within w_id0107_areas
end type
end forward

global type w_id0107_areas from w_sgigenerica
int X=1047
int Y=728
int Width=2272
int Height=1252
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Lista de Calles de la Localidad"
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
st_1 st_1
st_2 st_2
st_3 st_3
sle_1 sle_1
sle_2 sle_2
sle_3 sle_3
st_4 st_4
end type
global w_id0107_areas w_id0107_areas

type variables
datawindowchild dddw_prov,dddw_depto,dddw_munic

int FilaSelecc

u_generico_comunicaciones		iu_gen_comunic 

long il_cod_prov,il_cod_depto
double id_cod_munic

string is_Area
long il_cod_area = 0
string is_poblacion 
end variables

event open;call super::open;int Fila, li_filas
long ll_cod_prov,ll_cod_depto,ll_cod_munic

Iu_gen_comunic = CREATE u_generico_comunicaciones

iu_gen_comunic.is_comunic = gu_comunic.is_comunic 

dw_1.SetTransObject(sqlca)

if not isnull(iu_gen_comunic.is_comunic.longval3) and iu_gen_comunic.is_comunic.longval3 > 0 then
	sle_1.text = iu_gen_comunic.is_comunic.strval1
	sle_2.text =  iu_gen_comunic.is_comunic.strval2
	sle_3.text =  iu_gen_comunic.is_comunic.strval3
	
	ll_cod_munic = iu_gen_comunic.is_comunic.longval3
	
	dw_1.retrieve( ll_cod_munic)
	
	IF dw_1.rowcount() = 0 then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No hay datos de Poblaciones para este Corregimiento.",information!,ok!)
		close(this)
	END IF
		
else
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Para seleccionar una poblaci$$HEX1$$f300$$ENDHEX$$n, debe tener seleccionado previamente una Provincia, Distrito y Corregimiento v$$HEX1$$e100$$ENDHEX$$lido.",information!,ok!)
	close(this)
end if
	
end event

on w_id0107_areas.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.sle_1=create sle_1
this.sle_2=create sle_2
this.sle_3=create sle_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.sle_1
this.Control[iCurrent+8]=this.sle_2
this.Control[iCurrent+9]=this.sle_3
this.Control[iCurrent+10]=this.st_4
end on

on w_id0107_areas.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.sle_3)
destroy(this.st_4)
end on

event close;DESTROY iu_gen_comunic
end event

type cb_2 from u_cb within w_id0107_areas
int X=1778
int Y=132
int TabOrder=50
string Text="&Cancelar"
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

event clicked;call super::clicked;////Evento Clicked para el bot$$HEX1$$f300$$ENDHEX$$n Salir
//
//SetNull(dir.gl_codcalle)

Close(parent)
end event

type cb_1 from u_cb within w_id0107_areas
int X=1778
int Y=12
int TabOrder=10
string Text="&Aceptar"
boolean Default=true
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

event clicked;call super::clicked;if  il_cod_area <> 0 then
	iu_gen_comunic.is_comunic.intval1 = il_cod_area
	iu_gen_comunic.is_comunic.strval4 = is_poblacion
	iu_gen_comunic.is_comunic.strval5 = is_area
	gu_comunic.is_comunic = iu_gen_comunic.is_comunic
 	close(parent)
else
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar una poblaci$$HEX1$$f300$$ENDHEX$$n",information!,ok!)
end if
end event

type dw_1 from u_gen_id0104_a within w_id0107_areas
int X=32
int Y=324
int Width=1605
int Height=676
int TabOrder=60
string DataObject="d_id0107_poblados"
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
end type

event clicked;call super::clicked;// Clicked Script para dw
if row > 0 then
	
	this.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila
	
	FilaSelecc = row
	
	
	IF FilaSelecc > 0 THEN 
		 this.SelectRow(FilaSelecc, TRUE)
		 il_cod_area = dw_1.object.cod_area[row]
	 	is_area = dw_1.object.nom_area[row]
	 	is_poblacion = dw_1.object.poblado[row]
	 	st_4.text = "Area Densidad: " + is_area
	END IF
		
	
end if
end event

event doubleclicked;call super::doubleclicked;// DoubleClicked Script for dw

//this.TriggerEvent(Clicked!)
if row > 0 then
	cb_1.TriggerEvent(Clicked!)
END IF
end event

event rowfocuschanged;call super::rowfocuschanged;
 IF currentrow > 0 and this.getselectedrow(0) = currentrow then
	 il_cod_area = dw_1.object.cod_area[currentrow]
	 is_area = dw_1.object.nom_area[currentrow]
	 is_poblacion = dw_1.object.poblado[currentrow]
	 st_4.text = "Area Densidad: " + is_area
END IF

end event

type st_1 from statictext within w_id0107_areas
int X=32
int Y=36
int Width=411
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Provincia:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_id0107_areas
int X=32
int Y=136
int Width=411
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Distrito:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_id0107_areas
int X=32
int Y=232
int Width=411
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Corregimiento:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_1 from singlelineedit within w_id0107_areas
int X=443
int Y=24
int Width=1189
int Height=84
int TabOrder=20
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_2 from singlelineedit within w_id0107_areas
int X=443
int Y=124
int Width=1189
int Height=84
int TabOrder=30
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_3 from singlelineedit within w_id0107_areas
int X=443
int Y=224
int Width=1189
int Height=84
int TabOrder=40
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_id0107_areas
int X=37
int Y=1020
int Width=1600
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="Area de densidad: "
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


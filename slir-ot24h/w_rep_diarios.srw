HA$PBExportHeader$w_rep_diarios.srw
forward
global type w_rep_diarios from w_sgigenerica
end type
type rb_1 from radiobutton within w_rep_diarios
end type
type rb_2 from radiobutton within w_rep_diarios
end type
type gb_fecha from groupbox within w_rep_diarios
end type
type gb_1 from groupbox within w_rep_diarios
end type
type em_1 from editmask within w_rep_diarios
end type
type st_1 from statictext within w_rep_diarios
end type
type cb_1 from commandbutton within w_rep_diarios
end type
type cb_2 from commandbutton within w_rep_diarios
end type
type em_2 from editmask within w_rep_diarios
end type
type st_2 from statictext within w_rep_diarios
end type
type cb_3 from commandbutton within w_rep_diarios
end type
type cb_4 from commandbutton within w_rep_diarios
end type
type cbx_historico from checkbox within w_rep_diarios
end type
type dw_datos from datawindow within w_rep_diarios
end type
end forward

global type w_rep_diarios from w_sgigenerica
int Width=3557
int Height=1980
boolean TitleBar=true
string Title="Reportes Diarios"
rb_1 rb_1
rb_2 rb_2
gb_fecha gb_fecha
gb_1 gb_1
em_1 em_1
st_1 st_1
cb_1 cb_1
cb_2 cb_2
em_2 em_2
st_2 st_2
cb_3 cb_3
cb_4 cb_4
cbx_historico cbx_historico
dw_datos dw_datos
end type
global w_rep_diarios w_rep_diarios

type variables
datetime  idt_f_historico
end variables

event open;call super::open;//dw_circ.SetTransObject(SQLCA)
//dw_circ2.SetTransObject(SQLCA)


em_1.text = string(fgnu_fecha_actual(),'dd/mm/yyyy')
em_2.text = string(fgnu_fecha_Actual(),'dd/mm/yyyy')

// OBTENEMOS EL NUMERO DE MESES DE PERMANENCIA DE LOS REGISTROS ANTES DE PASARLOS AL HISTORICO

select add_months(sysdate,- nvl(codigo,0)) into :idt_f_historico from sgd_valor where codif='BATC' and valor = 'HIS';

cbx_historico.text = " Datos historicos < "+ string(idt_f_historico,'mm/yyyy')






end event

on w_rep_diarios.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_fecha=create gb_fecha
this.gb_1=create gb_1
this.em_1=create em_1
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.em_2=create em_2
this.st_2=create st_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cbx_historico=create cbx_historico
this.dw_datos=create dw_datos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.gb_fecha
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.em_2
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cbx_historico
this.Control[iCurrent+14]=this.dw_datos
end on

on w_rep_diarios.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_fecha)
destroy(this.gb_1)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cbx_historico)
destroy(this.dw_datos)
end on

type rb_1 from radiobutton within w_rep_diarios
int X=46
int Y=1520
int Width=855
int Height=76
boolean BringToTop=true
string Text="Interrupciones de Circuitos "
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
boolean RightToLeft=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_1.enabled = true
cbx_historico.enabled = true

st_2.visible = rb_1.checked
em_2.visible =  rb_1.checked

cb_4.enabled = false
cb_3.enabled = false

dw_datos.Reset()


end event

type rb_2 from radiobutton within w_rep_diarios
int X=969
int Y=1520
int Width=731
int Height=76
boolean BringToTop=true
string Text="Instalaciones Abiertas"
BorderStyle BorderStyle=StyleLowered!
boolean RightToLeft=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;em_1.text = string(fgnu_fecha_actual(),'dd/mm/yyyy')
em_1.enabled = false
cbx_historico.enabled = false
cbx_historico.checked = false

cb_4.enabled = false
cb_3.enabled = false

st_2.visible = false
em_2.visible = false

dw_datos.Reset()


end event

type gb_fecha from groupbox within w_rep_diarios
int X=1760
int Y=1424
int Width=1723
int Height=220
int TabOrder=20
string Text="Fechas"
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

type gb_1 from groupbox within w_rep_diarios
int X=23
int Y=1424
int Width=1701
int Height=220
int TabOrder=10
string Text="Reportes"
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

type em_1 from editmask within w_rep_diarios
int X=2171
int Y=1512
int Width=398
int Height=80
int TabOrder=30
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy"
MaskDataType MaskDataType=DateMask!
boolean Spin=true
string MinMax="01/01/1901~~31/12/2030"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event rbuttondown;if string(date(this.text),'dd/mm/yyyy') = "01/01/1900"  then 
		this.text = string(fgnu_fecha_actual(),'dd/mm/yyyy')
	end if
end event

type st_1 from statictext within w_rep_diarios
int X=1870
int Y=1516
int Width=302
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Desde"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_rep_diarios
int X=1371
int Y=1704
int Width=379
int Height=108
int TabOrder=60
boolean BringToTop=true
string Text="Generar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;


if rb_1.checked = true then
	
	if string(date(em_2.text),'dd/mm/yyyy') = "01/01/1900"  then 
		Messagebox('Aviso', 'La fecha hasta no puede ser nula')
		return
	end if
	
	if string(date(em_1.text),'dd/mm/yyyy')  = "01/01/1900"  then 
		Messagebox('Aviso', 'La fecha desde no puede ser nula')
		return
	end if
	
	if date(em_1.text) >  date(em_2.text) then
		Messagebox('Aviso', 'La fecha desde no puede ser mayor que la fecha hasta')
		Return
	End if
	parent.setredraw(false)
	
	if cbx_historico.checked then
			dw_datos.DataObject = 'd_reporte_incidencia_hist'
		else
			dw_datos.DataObject = 'd_reporte_incidencia'
		end if
      dw_datos.SetTransObject(SQLCA)
		dw_datos.retrieve(date(em_1.text), date(em_2.text), gi_nro_centro)
else
		dw_datos.DataObject = 'd_circuitos_abiertos'
		dw_datos.SetTransObject(SQLCA)
		dw_datos.retrieve(gi_nro_centro)
	
end if
if dw_datos.rowcount() > 0 then
	dw_datos.Modify("Datawindow.Print.Preview=yes")
	dw_datos.Modify("Datawindow.Print.Preview.zoom=85")

	cb_3.enabled = true
	cb_4.enabled = true
else
	cb_3.enabled = false
	cb_4.enabled = false
end if

	parent.setredraw(true)

end event

type cb_2 from commandbutton within w_rep_diarios
int X=3099
int Y=1704
int Width=379
int Height=108
int TabOrder=80
boolean BringToTop=true
string Text="Cancelar"
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type em_2 from editmask within w_rep_diarios
int X=2939
int Y=1512
int Width=393
int Height=80
int TabOrder=40
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy"
MaskDataType MaskDataType=DateMask!
boolean Spin=true
string MinMax="01/01/1901~~31/12/2030"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event rbuttondown;if string(date(this.text),'dd/mm/yyyy') = "01/01/1900"  then 
		this.text = string(fgnu_fecha_actual(),'dd/mm/yyyy')
	end if
end event

type st_2 from statictext within w_rep_diarios
int X=2674
int Y=1516
int Width=265
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Hasta"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_3 from commandbutton within w_rep_diarios
int X=2523
int Y=1704
int Width=379
int Height=108
int TabOrder=90
boolean Enabled=false
boolean BringToTop=true
string Text="&Imprimir"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
dw_datos.print()
end event

type cb_4 from commandbutton within w_rep_diarios
int X=1947
int Y=1704
int Width=379
int Height=108
int TabOrder=70
boolean Enabled=false
boolean BringToTop=true
string Text="&Guardar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
dw_datos.SaveAS("", Excel!, True)
end event

type cbx_historico from checkbox within w_rep_diarios
int X=32
int Y=1700
int Width=1207
int Height=96
boolean BringToTop=true
string Text="Datos hist$$HEX1$$f300$$ENDHEX$$ricos"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if cbx_historico.checked then
	em_1.text = string(idt_f_historico, 'dd/mm/yyyy')
	em_2.text = string(idt_f_historico, 'dd/mm/yyyy')
else
	em_1.text = string(today())
   em_2.text = string(today())
end if

cb_4.enabled = false
cb_3.enabled = false

dw_datos.Reset()


end event

type dw_datos from datawindow within w_rep_diarios
int X=27
int Y=36
int Width=3470
int Height=1376
int TabOrder=50
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event retrieveend;string ls_cadena

if rb_1.checked then

	ls_cadena = fg_return_cad_mes(date(em_1.text), date(em_2.text))
	
   dw_datos.object.c_fecha_act.Expression = "'" + ls_cadena + "'"
	
end if
end event


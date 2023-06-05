HA$PBExportHeader$w_seleccion_capas2.srw
forward
global type w_seleccion_capas2 from Window
end type
type rb_3 from radiobutton within w_seleccion_capas2
end type
type rb_2 from radiobutton within w_seleccion_capas2
end type
type rb_1 from radiobutton within w_seleccion_capas2
end type
type lb_capas from listbox within w_seleccion_capas2
end type
type cb_cancelar from commandbutton within w_seleccion_capas2
end type
type cb_aceptar from commandbutton within w_seleccion_capas2
end type
type gb_1 from groupbox within w_seleccion_capas2
end type
end forward

global type w_seleccion_capas2 from Window
int X=1010
int Y=700
int Width=1641
int Height=988
boolean TitleBar=true
string Title="Selecci$$HEX1$$f300$$ENDHEX$$n de capas"
long BackColor=79741120
WindowType WindowType=response!
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
lb_capas lb_capas
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
gb_1 gb_1
end type
global w_seleccion_capas2 w_seleccion_capas2

on w_seleccion_capas2.create
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.lb_capas=create lb_capas
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.gb_1=create gb_1
this.Control[]={this.rb_3,&
this.rb_2,&
this.rb_1,&
this.lb_capas,&
this.cb_cancelar,&
this.cb_aceptar,&
this.gb_1}
end on

on w_seleccion_capas2.destroy
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.lb_capas)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.gb_1)
end on

event open;string capa
int contador=1
long posicion
string literal
string class_id
string cargado
boolean estado
capa=ProfileString("opensgi.ini","CAPAS","capa"+string(contador),"")
lb_capas.reset()
if capa="" or ISnull(capa) then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No existen capas definidas")
	closewithreturn(this,0)
	return 
else
DO WHILE Not Isnull(capa) and capa<>""
	posicion=pos(capa,"#")// PRIMER #
	cargado=mid(capa,1,posicion - 1)
	literal=mid(capa,posicion+1,len(capa))
	posicion=pos(literal,"#")//SEGUNDO #
	class_id=mid(literal,posicion,len(literal))
	literal=mid(literal,1,posicion - 1)
	
	posicion=lb_capas.Additem(literal+"                          "+class_id)
	if cargado="1" then 
		estado=true
	else
		estado=false
   end if
	lb_capas.SetState(posicion,estado)
	contador=contador+1
	capa=ProfileString("opensgi.ini","CAPAS","capa"+string(contador),"")
LOOP

end if	






end event

type rb_3 from radiobutton within w_seleccion_capas2
int X=960
int Y=184
int Width=283
int Height=76
int TabOrder=20
string Text="&Todas"
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;int contador, tama$$HEX1$$f100$$ENDHEX$$o
tama$$HEX1$$f100$$ENDHEX$$o=lb_capas.totalitems()
for contador=1 to tama$$HEX1$$f100$$ENDHEX$$o
  lb_capas.setstate(contador,true)
next
lb_capas.enabled=false
end event

type rb_2 from radiobutton within w_seleccion_capas2
int X=960
int Y=388
int Width=293
int Height=76
int TabOrder=40
string Text="&Varias"
boolean Checked=true
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;lb_capas.enabled=true
end event

type rb_1 from radiobutton within w_seleccion_capas2
int X=960
int Y=284
int Width=338
int Height=76
int TabOrder=30
string Text="&Ninguna"
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;int contador, tama$$HEX1$$f100$$ENDHEX$$o
tama$$HEX1$$f100$$ENDHEX$$o=lb_capas.totalitems()
for contador=1 to tama$$HEX1$$f100$$ENDHEX$$o
  lb_capas.setstate(contador,false)
next
lb_capas.enabled=false
end event

type lb_capas from listbox within w_seleccion_capas2
int X=123
int Y=76
int Width=535
int Height=592
int TabOrder=10
BorderStyle BorderStyle=StyleShadowBox!
boolean VScrollBar=true
boolean MultiSelect=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_cancelar from commandbutton within w_seleccion_capas2
int X=1166
int Y=688
int Width=329
int Height=108
int TabOrder=60
string Text="&Cancelar"
boolean Default=true
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;closewithreturn(parent,0)
end event

type cb_aceptar from commandbutton within w_seleccion_capas2
int X=782
int Y=688
int Width=302
int Height=108
int TabOrder=50
string Text="&Aceptar"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;int contador
string capa
string literal
string class_id
int posicion
for contador=1 to lb_capas.TotalItems()
if lb_capas.state(contador)=1 then
	capa="1#"
else
	capa="0#"
end if
	
	literal=lb_capas.text(contador)	
	posicion=pos(literal,"#")
	class_id=mid(literal,posicion,len(literal))	
	literal=trim(mid(literal,1,posicion -1))
	capa=capa+literal+class_id
	SetProfileString("opensgi.ini","CAPAS","capa"+string(contador),capa)
	
next
closewithReturn(parent,1)
end event

type gb_1 from groupbox within w_seleccion_capas2
int X=864
int Y=124
int Width=526
int Height=392
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


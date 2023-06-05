HA$PBExportHeader$u_propiedades.sru
forward
global type u_propiedades from UserObject
end type
type cbx_elim from checkbox within u_propiedades
end type
type cb_1 from commandbutton within u_propiedades
end type
type em_cant_av from editmask within u_propiedades
end type
type st_1 from statictext within u_propiedades
end type
type cbx_inst_dif from checkbox within u_propiedades
end type
end forward

global type u_propiedades from UserObject
int Width=1367
int Height=456
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
cbx_elim cbx_elim
cb_1 cb_1
em_cant_av em_cant_av
st_1 st_1
cbx_inst_dif cbx_inst_dif
end type
global u_propiedades u_propiedades

on u_propiedades.create
this.cbx_elim=create cbx_elim
this.cb_1=create cb_1
this.em_cant_av=create em_cant_av
this.st_1=create st_1
this.cbx_inst_dif=create cbx_inst_dif
this.Control[]={this.cbx_elim,&
this.cb_1,&
this.em_cant_av,&
this.st_1,&
this.cbx_inst_dif}
end on

on u_propiedades.destroy
destroy(this.cbx_elim)
destroy(this.cb_1)
destroy(this.em_cant_av)
destroy(this.st_1)
destroy(this.cbx_inst_dif)
end on

type cbx_elim from checkbox within u_propiedades
int X=55
int Y=140
int Width=1271
int Height=76
boolean BringToTop=true
string Text="Eliminar los avisos existentes para esta instalaci$$HEX1$$f300$$ENDHEX$$n."
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Comic Sans MS"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Script!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within u_propiedades
int X=1056
int Y=360
int Width=274
int Height=64
int TabOrder=30
string Text="Continuar"
int TextSize=-8
int Weight=400
string FaceName="Comic Sans MS"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Script!
FontPitch FontPitch=Variable!
end type

event clicked;
if long(em_cant_av.text)  > 0 then
	if w_callcenter.il_nro_instalacion > 0 then
		w_callcenter.cb_cont.visible=true
	end if
	w_callcenter.st_avisos2.text = em_cant_av.text
	w_callcenter.il_nro_Avisos = long(em_cant_av.text)
else
	 w_callcenter.cb_cont.visible= false
	 w_callcenter.st_avisos2.text =""
end if

parent.visible=false
end event

type em_cant_av from editmask within u_propiedades
int X=809
int Y=24
int Width=288
int Height=80
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="######"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Comic Sans MS"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Script!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within u_propiedades
int X=55
int Y=36
int Width=722
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Cantidad de Avisos a Generar:"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Comic Sans MS"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Script!
FontPitch FontPitch=Variable!
end type

type cbx_inst_dif from checkbox within u_propiedades
int X=55
int Y=248
int Width=1271
int Height=76
int TabOrder=20
boolean BringToTop=true
string Text="Instalaciones diferentes"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Comic Sans MS"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Script!
FontPitch FontPitch=Variable!
end type


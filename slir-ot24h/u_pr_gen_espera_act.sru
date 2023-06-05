HA$PBExportHeader$u_pr_gen_espera_act.sru
forward
global type u_pr_gen_espera_act from UserObject
end type
type p_1 from picture within u_pr_gen_espera_act
end type
type barra from u_gen_barra within u_pr_gen_espera_act
end type
type st_1 from statictext within u_pr_gen_espera_act
end type
type gb_1 from groupbox within u_pr_gen_espera_act
end type
end forward

global type u_pr_gen_espera_act from UserObject
int Width=1262
int Height=364
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
p_1 p_1
barra barra
st_1 st_1
gb_1 gb_1
end type
global u_pr_gen_espera_act u_pr_gen_espera_act

on u_pr_gen_espera_act.create
this.p_1=create p_1
this.barra=create barra
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.p_1,&
this.barra,&
this.st_1,&
this.gb_1}
end on

on u_pr_gen_espera_act.destroy
destroy(this.p_1)
destroy(this.barra)
destroy(this.st_1)
destroy(this.gb_1)
end on

type p_1 from picture within u_pr_gen_espera_act
int X=1061
int Y=248
int Width=87
int Height=76
boolean Visible=false
string PictureName="reloj1.bmp"
boolean FocusRectangle=false
end type

type barra from u_gen_barra within u_pr_gen_espera_act
int X=59
int Y=120
int Width=1125
int Height=120
int TabOrder=2
BorderStyle BorderStyle=StyleRaised!
long BackColor=79741120
end type

on barra.destroy
call u_gen_barra::destroy
end on

type st_1 from statictext within u_pr_gen_espera_act
int X=343
int Y=252
int Width=608
int Height=76
boolean Enabled=false
string Text="Espere unos instantes"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=79741120
long BorderColor=8388608
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within u_pr_gen_espera_act
int X=23
int Y=20
int Width=1207
int Height=324
int TabOrder=1
string Text="Actualizando Incidencia..."
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-9
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


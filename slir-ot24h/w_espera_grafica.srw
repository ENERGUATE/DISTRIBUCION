HA$PBExportHeader$w_espera_grafica.srw
forward
global type w_espera_grafica from Window
end type
type p_1 from picture within w_espera_grafica
end type
type cb_cancelar from commandbutton within w_espera_grafica
end type
type st_1 from statictext within w_espera_grafica
end type
end forward

global type w_espera_grafica from Window
int X=1134
int Y=992
int Width=1243
int Height=416
boolean TitleBar=true
string Title="OPEN SGI"
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
string Pointer="HourGlass!"
p_1 p_1
cb_cancelar cb_cancelar
st_1 st_1
end type
global w_espera_grafica w_espera_grafica

type variables
long il_bandera = 0
end variables

on w_espera_grafica.create
this.p_1=create p_1
this.cb_cancelar=create cb_cancelar
this.st_1=create st_1
this.Control[]={this.p_1,&
this.cb_cancelar,&
this.st_1}
end on

on w_espera_grafica.destroy
destroy(this.p_1)
destroy(this.cb_cancelar)
destroy(this.st_1)
end on

event timer;string ls_icono
string ls_maquina; string ls_comando; string ls_puerto
integer li_fnum = -1
long ll_inicio,ll_puerto
string nula
setnull(nula)

	ls_icono = p_1.picturename
	
	CHOOSE CASE ls_icono
		CASE "reloj1.bmp"
			p_1.picturename = "reloj2.bmp"

		CASE "reloj2.bmp"
			p_1.picturename = "reloj3.bmp"
		
		CASE "reloj3.bmp"
			p_1.picturename = "reloj4.bmp"
		
		CASE "reloj4.bmp"
			p_1.picturename = "reloj5.bmp"

		CASE "reloj5.bmp"
			p_1.picturename = "reloj6.bmp"

		CASE "reloj6.bmp"
			p_1.picturename = "reloj7.bmp"

		CASE "reloj7.bmp"
			p_1.picturename = "reloj8.bmp"

		CASE "reloj8.bmp"
			p_1.picturename = "reloj1.bmp"

	END CHOOSE

if il_bandera = 0 then
	il_bandera = 1
	return	
end if


il_bandera = 0


ls_maquina = ProfileString("OPENSGI.INI", "SIV_SERVER","maquina", "None")
ll_puerto=onis.puerto(ls_maquina,"/export/env/sgd/opensgi/tmp/siv_ses")

	ls_puerto = string(ll_puerto)
	if ls_puerto <> "0" and ls_puerto <> "" then
		timer(0)
		il_bandera = 3
	   close(this)
		return
	end if



il_bandera = 0

end event

event open;timer(5)
end event

event closequery;if il_bandera <> 3 then
	halt close
end if
end event

type p_1 from picture within w_espera_grafica
int X=82
int Y=60
int Width=87
int Height=76
string PictureName="reloj1.bmp"
boolean FocusRectangle=false
string Pointer="HourGlass!"
end type

type cb_cancelar from commandbutton within w_espera_grafica
int X=430
int Y=196
int Width=329
int Height=96
int TabOrder=1
string Text="&Cancelar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;timer(0)
halt close
end event

type st_1 from statictext within w_espera_grafica
int X=206
int Y=64
int Width=987
int Height=64
boolean Enabled=false
string Text="Esperando activaci$$HEX1$$f300$$ENDHEX$$n servidor gr$$HEX1$$e100$$ENDHEX$$fico"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
string Pointer="HourGlass!"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


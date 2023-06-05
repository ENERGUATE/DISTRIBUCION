HA$PBExportHeader$w_abc_usuarios_upd.srw
forward
global type w_abc_usuarios_upd from window
end type
type sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a from singlelineedit within w_abc_usuarios_upd
end type
type st_9 from statictext within w_abc_usuarios_upd
end type
type st_8 from statictext within w_abc_usuarios_upd
end type
type st_7 from statictext within w_abc_usuarios_upd
end type
type em_baja from editmask within w_abc_usuarios_upd
end type
type cb_2 from commandbutton within w_abc_usuarios_upd
end type
type cb_1 from commandbutton within w_abc_usuarios_upd
end type
type ddlb_permisos from dropdownlistbox within w_abc_usuarios_upd
end type
type em_alta from editmask within w_abc_usuarios_upd
end type
type ddlb_estado from dropdownlistbox within w_abc_usuarios_upd
end type
type sle_nombre from singlelineedit within w_abc_usuarios_upd
end type
type sle_usuario from singlelineedit within w_abc_usuarios_upd
end type
type st_6 from statictext within w_abc_usuarios_upd
end type
type st_5 from statictext within w_abc_usuarios_upd
end type
type st_4 from statictext within w_abc_usuarios_upd
end type
type st_3 from statictext within w_abc_usuarios_upd
end type
type st_2 from statictext within w_abc_usuarios_upd
end type
type st_1 from statictext within w_abc_usuarios_upd
end type
type gb_1 from groupbox within w_abc_usuarios_upd
end type
end forward

global type w_abc_usuarios_upd from window
integer x = 1326
integer y = 652
integer width = 3191
integer height = 2188
boolean titlebar = true
string title = "Actualizaci$$HEX1$$f300$$ENDHEX$$n de usuarios (w_abc_usuarios_upd)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 33554431
sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a
st_9 st_9
st_8 st_8
st_7 st_7
em_baja em_baja
cb_2 cb_2
cb_1 cb_1
ddlb_permisos ddlb_permisos
em_alta em_alta
ddlb_estado ddlb_estado
sle_nombre sle_nombre
sle_usuario sle_usuario
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global w_abc_usuarios_upd w_abc_usuarios_upd

type variables
datetime lo_hoy
end variables

on w_abc_usuarios_upd.create
this.sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a=create sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.em_baja=create em_baja
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_permisos=create ddlb_permisos
this.em_alta=create em_alta
this.ddlb_estado=create ddlb_estado
this.sle_nombre=create sle_nombre
this.sle_usuario=create sle_usuario
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a,&
this.st_9,&
this.st_8,&
this.st_7,&
this.em_baja,&
this.cb_2,&
this.cb_1,&
this.ddlb_permisos,&
this.em_alta,&
this.ddlb_estado,&
this.sle_nombre,&
this.sle_usuario,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_1}
end on

on w_abc_usuarios_upd.destroy
destroy(this.sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.em_baja)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_permisos)
destroy(this.em_alta)
destroy(this.ddlb_estado)
destroy(this.sle_nombre)
destroy(this.sle_usuario)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
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


/*****************centrar ventana**************/

string lo_usuario
string lo_usr, lo_nombre, lo_status, lo_permisos,lo_pass
datetime lo_alta, lo_baja

lo_usuario= Message.StringParm


select usuario,
	   nombre,
	   status,
	   alta,
	  baja,
	   permisos,
	   password
	   into :lo_usr, :lo_nombre, :lo_status, :lo_alta, :lo_baja, :lo_permisos,:lo_pass
from usuario
where usuario=:lo_usuario
using sqlca2;


if lo_status='A' then
	lo_status='(A) DE ALTA'
end if

if lo_status='B' then
	lo_status='(B) DE BAJA'
end if

if lo_permisos='SPV' then
	lo_permisos='SPV SUPERVISOR'
end if


if lo_permisos='OPR' then
	lo_permisos='OPR OPERADOR'
end if

if lo_permisos='CON' then
	lo_permisos='CON CONSULTOR'
end if



sle_usuario.text=lo_usr
sle_nombre.text=lo_nombre
ddlb_estado.text=lo_status
ddlb_permisos.text=lo_permisos
em_alta.text=string(lo_alta)
em_baja.text=string(lo_baja)
sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a.text=f_desencriptar(lo_pass)


select sysdate
	into :lo_hoy
	from dual
	using sqlca2;
	
	
	
	if sqlca2.sqlcode=0 then
			//em_baja.text=string(hoy)
			
	else	
		lo_hoy=datetime(today(),now())
	end if
	

end event

type sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a from singlelineedit within w_abc_usuarios_upd
integer x = 1115
integer y = 1504
integer width = 1111
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_abc_usuarios_upd
integer x = 585
integer y = 1524
integer width = 425
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contrase$$HEX1$$f100$$ENDHEX$$a:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_abc_usuarios_upd
integer x = 590
integer y = 1272
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Fecha de baja:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_abc_usuarios_upd
integer x = 329
integer y = 1332
integer width = 389
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type em_baja from editmask within w_abc_usuarios_upd
integer x = 1106
integer y = 1268
integer width = 1125
integer height = 124
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type cb_2 from commandbutton within w_abc_usuarios_upd
integer x = 1586
integer y = 1780
integer width = 343
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Cancel"
end type

event clicked;CLOSE(PARENT)
end event

type cb_1 from commandbutton within w_abc_usuarios_upd
integer x = 1179
integer y = 1776
integer width = 343
integer height = 144
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Grabar"
boolean default = true
end type

event clicked;int validacion
string mensaje
string lo_user2, lo_nombre, lo_estado, lo_credenciales,lo_contrase$$HEX1$$f100$$ENDHEX$$a
string lo_pass_new

validacion=0



if isnull(sle_usuario.text) or sle_usuario.text='' then
	validacion=1
	mensaje=mensaje+'~r~nIngrese ID de usuario'
end if


if isnull(sle_nombre.text) or sle_nombre.text='' then
	validacion=1
	mensaje=mensaje+'~r~nIngrese nombre de usuario'
end if




if validacion=1 then
	
	openwithparm(w_valida,mensaje)
else
	
	
	lo_user2=sle_usuario.text
	lo_estado=ddlb_estado.text
	lo_nombre=sle_nombre.text
	lo_contrase$$HEX1$$f100$$ENDHEX$$a=sle_nueva_contrase$$HEX1$$f100$$ENDHEX$$a.text  //Fase 4 OT24H
	lo_pass_new=f_encriptar(lo_contrase$$HEX1$$f100$$ENDHEX$$a)   //Fase 4 OT24H
	
	if lo_estado='(A) DE ALTA' then
		lo_estado='A'
	end if
	
	if lo_estado='(B) DE BAJA' then
		lo_estado='B'
	end if
	
	
		
	lo_credenciales=ddlb_permisos.text
	
	
	if lo_credenciales='SPV SUPERVISOR' then
		lo_credenciales='SPV'
	end if
	
	if lo_credenciales='OPR OPERADOR' then
		lo_credenciales='OPR'
	end if
	
	if lo_credenciales='CON CONSULTOR' then
		lo_credenciales='CON'
	end if
	
	if lo_credenciales='OCM OFICINA COMERCIAL' then
		lo_credenciales='OCM'
	end if
	
	
		
		
	    update usuario SET nombre=:lo_nombre,
	    status=:lo_estado,
	    permisos=:lo_credenciales,
	    baja=:lo_hoy,
	    password=:lo_pass_new
	    where usuario=:lo_user2
	    using sqlca2;

	
	IF SQLCA2.SQLCODE=0 THEN
			commit using sqlca2;
				 
		 insert into evento values(-1, -1, 'USR', -1, :g_cod_usuario, :lo_hoy, 'Modif de usuario '||:lo_user2)
		 using sqlca2;
		 
		 commit using sqlca2;
		 
		 messagebox('Info', 'Usuario modificado')
		 close(parent)
		 
		 
		 
		 
	ELSE
			messagebox(SQLca2.SQLERRTEXT, 'No se pudo modificar el usuario')
	end if
	
	
	
end if
end event

type ddlb_permisos from dropdownlistbox within w_abc_usuarios_upd
integer x = 1106
integer y = 848
integer width = 1125
integer height = 240
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"SPV SUPERVISOR","OPR OPERADOR","CON CONSULTOR","OCM OFICINA COMERCIAL"}
borderstyle borderstyle = stylelowered!
end type

type em_alta from editmask within w_abc_usuarios_upd
integer x = 1106
integer y = 660
integer width = 1125
integer height = 124
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type ddlb_estado from dropdownlistbox within w_abc_usuarios_upd
integer x = 1106
integer y = 1068
integer width = 1125
integer height = 240
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"(A) DE ALTA","(B) DE BAJA"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;datetime hoy
string seleccion

setnull(hoy)


seleccion=this.text

//messagebox('info', seleccion)

if seleccion = "(A) DE ALTA" then
	em_baja.text=''
end if

if seleccion = "(B) DE BAJA" then
	
  em_baja.text=string(lo_hoy)
end if

end event

type sle_nombre from singlelineedit within w_abc_usuarios_upd
integer x = 1106
integer y = 484
integer width = 1266
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type sle_usuario from singlelineedit within w_abc_usuarios_upd
integer x = 1106
integer y = 304
integer width = 859
integer height = 100
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_abc_usuarios_upd
integer x = 590
integer y = 844
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Permisos:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_abc_usuarios_upd
integer x = 590
integer y = 660
integer width = 393
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Fecha de alta:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_abc_usuarios_upd
integer x = 590
integer y = 1068
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Estado:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_abc_usuarios_upd
integer x = 590
integer y = 484
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Nombre:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_abc_usuarios_upd
integer x = 590
integer y = 304
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_abc_usuarios_upd
integer x = 73
integer y = 84
integer width = 667
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Modificaci$$HEX1$$f300$$ENDHEX$$n de usuarios"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_abc_usuarios_upd
integer x = 73
integer y = 164
integer width = 3067
integer height = 1896
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type


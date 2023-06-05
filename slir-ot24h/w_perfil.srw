HA$PBExportHeader$w_perfil.srw
forward
global type w_perfil from window
end type
type st_x3 from statictext within w_perfil
end type
type st_x2 from statictext within w_perfil
end type
type st_x1 from statictext within w_perfil
end type
type cb_4 from commandbutton within w_perfil
end type
type st_9 from statictext within w_perfil
end type
type sle_alta from singlelineedit within w_perfil
end type
type cb_3 from commandbutton within w_perfil
end type
type sle_passn2 from singlelineedit within w_perfil
end type
type st_8 from statictext within w_perfil
end type
type sle_permisos from singlelineedit within w_perfil
end type
type st_7 from statictext within w_perfil
end type
type st_6 from statictext within w_perfil
end type
type st_5 from statictext within w_perfil
end type
type st_4 from statictext within w_perfil
end type
type st_3 from statictext within w_perfil
end type
type st_2 from statictext within w_perfil
end type
type sle_passn from singlelineedit within w_perfil
end type
type sle_passa from singlelineedit within w_perfil
end type
type sle_nombre from singlelineedit within w_perfil
end type
type sle_codigo from singlelineedit within w_perfil
end type
type st_1 from statictext within w_perfil
end type
type gb_2 from groupbox within w_perfil
end type
type gb_1 from groupbox within w_perfil
end type
end forward

global type w_perfil from window
integer x = 1326
integer y = 652
integer width = 3205
integer height = 2432
boolean titlebar = true
string title = "Perfil de usuario (w_perfil)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 15793151
st_x3 st_x3
st_x2 st_x2
st_x1 st_x1
cb_4 cb_4
st_9 st_9
sle_alta sle_alta
cb_3 cb_3
sle_passn2 sle_passn2
st_8 st_8
sle_permisos sle_permisos
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
sle_passn sle_passn
sle_passa sle_passa
sle_nombre sle_nombre
sle_codigo sle_codigo
st_1 st_1
gb_2 gb_2
gb_1 gb_1
end type
global w_perfil w_perfil

type variables
integer cambiar
end variables

on w_perfil.create
this.st_x3=create st_x3
this.st_x2=create st_x2
this.st_x1=create st_x1
this.cb_4=create cb_4
this.st_9=create st_9
this.sle_alta=create sle_alta
this.cb_3=create cb_3
this.sle_passn2=create sle_passn2
this.st_8=create st_8
this.sle_permisos=create sle_permisos
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.sle_passn=create sle_passn
this.sle_passa=create sle_passa
this.sle_nombre=create sle_nombre
this.sle_codigo=create sle_codigo
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_x3,&
this.st_x2,&
this.st_x1,&
this.cb_4,&
this.st_9,&
this.sle_alta,&
this.cb_3,&
this.sle_passn2,&
this.st_8,&
this.sle_permisos,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.sle_passn,&
this.sle_passa,&
this.sle_nombre,&
this.sle_codigo,&
this.st_1,&
this.gb_2,&
this.gb_1}
end on

on w_perfil.destroy
destroy(this.st_x3)
destroy(this.st_x2)
destroy(this.st_x1)
destroy(this.cb_4)
destroy(this.st_9)
destroy(this.sle_alta)
destroy(this.cb_3)
destroy(this.sle_passn2)
destroy(this.st_8)
destroy(this.sle_permisos)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_passn)
destroy(this.sle_passa)
destroy(this.sle_nombre)
destroy(this.sle_codigo)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;string codigo, nombre, pass, credenciales, estado
datetime f_alta




select usuario,
	  password,
	  nombre,
	  status,
	  alta,
	  permisos
into :codigo, :pass, :nombre, :estado, :f_alta, :credenciales
 from usuario 
 where Upper(usuario)=Upper(:g_cod_usuario)
 and status='A'
using sqlca2;


if sqlca2.sqlcode <>0 then
     MessageBox (sqlca2.sqlerrtext,"Error al recuperar informaci$$HEX1$$f300$$ENDHEX$$n del usuario, se cerrar$$HEX2$$e1002000$$ENDHEX$$sesi$$HEX1$$f300$$ENDHEX$$n")
	  HALT CLOSE
else
	sle_codigo.text=codigo
	sle_nombre.text=nombre
	sle_alta.text=string(f_alta)
	sle_permisos.text=credenciales
	


end if


cambiar=0
st_x1.visible=false
st_x2.visible=false
st_x3.visible=false
end event

type st_x3 from statictext within w_perfil
integer x = 2514
integer y = 1716
integer width = 110
integer height = 128
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 15793151
boolean enabled = false
string text = "X"
boolean focusrectangle = false
end type

type st_x2 from statictext within w_perfil
integer x = 2514
integer y = 1548
integer width = 110
integer height = 128
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 15793151
boolean enabled = false
string text = "X"
boolean focusrectangle = false
end type

type st_x1 from statictext within w_perfil
integer x = 2514
integer y = 1384
integer width = 110
integer height = 128
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 15793151
boolean enabled = false
string text = "X"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_perfil
integer x = 1531
integer y = 2024
integer width = 343
integer height = 144
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Cancelar"
end type

event clicked;close(parent)
end event

type st_9 from statictext within w_perfil
integer x = 251
integer y = 884
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Fecha de Alta:"
boolean focusrectangle = false
end type

type sle_alta from singlelineedit within w_perfil
integer x = 686
integer y = 868
integer width = 887
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_perfil
integer x = 1065
integer y = 2024
integer width = 343
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Aceptar"
end type

event clicked;string passA, passN, passN2, nombre
string passcifrada, passdescifrada

passa=sle_passa.text
passN=sle_passn.text
passN2=sle_passn2.text

st_x1.visible=false
st_x2.visible=false
st_x3.visible=false


if cambiar=1 then
	
	
		passdescifrada=f_encriptar(passa)
		

		select  
			  nombre
		into :nombre 
		 from usuario 
		 where Upper(usuario)=Upper(:g_cod_usuario)
		 and upper(password)=Upper(:passdescifrada)
		 and status='A'
		using sqlca2;
		
		
		if sqlca2.sqlcode <>0 then
				st_x1.visible=true
			  MessageBox (sqlca2.sqlerrtext,"Contrase$$HEX1$$f100$$ENDHEX$$a actual incorrecta")
			  
		else
			
			if len(passN)<6 or isnull(passN) then
				st_x2.visible=true
				messagebox("Error","Contrase$$HEX1$$f100$$ENDHEX$$a nueva al menos de 6 caracteres")
				
			else
				
				if passN<>passN2 then
					st_x2.visible=true
					st_x3.visible=true
					messagebox("Error", "No coincide la contrase$$HEX1$$f100$$ENDHEX$$a nueva con su comprobaci$$HEX1$$f300$$ENDHEX$$n")
				else
					
					/*grabar*/
					passcifrada=f_encriptar(passN)
					
					update usuario
					set password=:passcifrada
					where usuario=:g_cod_usuario
					and status='A'
					using sqlca2;
					
					if sqlca2.sqlcode <>0 then
			 				 MessageBox (sqlca2.sqlerrtext,"No se pudo aplicar el cambio de contrase$$HEX1$$f100$$ENDHEX$$a.")
					else
									
						commit using sqlca2;
						messagebox("Info", "Se ha cambiado correctamente la contrase$$HEX1$$f100$$ENDHEX$$a")
						close(parent)
					end if
					
					
				end if //comprobaci$$HEX1$$f300$$ENDHEX$$n de contrase$$HEX1$$f100$$ENDHEX$$a
				
			end if //contrase$$HEX1$$f100$$ENDHEX$$a nueva menor a 6
			
		end if  //contrase$$HEX1$$f100$$ENDHEX$$a original incorrecta


else
	close(parent)

end if //cambiar


end event

type sle_passn2 from singlelineedit within w_perfil
integer x = 1307
integer y = 1736
integer width = 1189
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_perfil
integer x = 251
integer y = 1736
integer width = 777
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Confirmar nueva contrase$$HEX1$$f100$$ENDHEX$$a:"
boolean focusrectangle = false
end type

type sle_permisos from singlelineedit within w_perfil
integer x = 686
integer y = 712
integer width = 887
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_perfil
integer x = 251
integer y = 712
integer width = 393
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Credenciales: "
boolean focusrectangle = false
end type

type st_6 from statictext within w_perfil
integer x = 251
integer y = 1556
integer width = 512
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Nueva contrase$$HEX1$$f100$$ENDHEX$$a:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_perfil
integer x = 251
integer y = 1396
integer width = 512
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Contrase$$HEX1$$f100$$ENDHEX$$a actual:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_perfil
integer x = 133
integer y = 1184
integer width = 544
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 33554431
string text = "Cambiar contrase$$HEX1$$f100$$ENDHEX$$a"
boolean focusrectangle = false
end type

event clicked;if cambiar=0 then
	sle_passa.enabled=true
	sle_passN.enabled=true
	sle_passN2.enabled=true
	cambiar=1
else
	sle_passa.enabled=false
	sle_passN.enabled=false
	sle_passN2.enabled=false
	cambiar=0
	
end if
end event

type st_3 from statictext within w_perfil
integer x = 251
integer y = 552
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Nombre:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_perfil
integer x = 251
integer y = 388
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "ID Usuario:"
boolean focusrectangle = false
end type

type sle_passn from singlelineedit within w_perfil
integer x = 1307
integer y = 1556
integer width = 1189
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type sle_passa from singlelineedit within w_perfil
integer x = 1307
integer y = 1396
integer width = 1189
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type sle_nombre from singlelineedit within w_perfil
integer x = 686
integer y = 552
integer width = 1189
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_codigo from singlelineedit within w_perfil
integer x = 686
integer y = 392
integer width = 1189
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_perfil
integer x = 82
integer y = 116
integer width = 1627
integer height = 80
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "Actualizaci$$HEX1$$f300$$ENDHEX$$n de perfil de usuario"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_perfil
integer x = 133
integer y = 1288
integer width = 2853
integer height = 664
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
end type

type gb_1 from groupbox within w_perfil
integer x = 119
integer y = 296
integer width = 2862
integer height = 808
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
end type


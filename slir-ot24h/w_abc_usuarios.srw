HA$PBExportHeader$w_abc_usuarios.srw
forward
global type w_abc_usuarios from window
end type
type st_3 from statictext within w_abc_usuarios
end type
type st_2 from statictext within w_abc_usuarios
end type
type st_1 from statictext within w_abc_usuarios
end type
type p_del from picture within w_abc_usuarios
end type
type p_upd from picture within w_abc_usuarios
end type
type p_new from picture within w_abc_usuarios
end type
type tab_1 from tab within w_abc_usuarios
end type
type tabpage_none from userobject within tab_1
end type
type st_6 from statictext within tabpage_none
end type
type tabpage_none from userobject within tab_1
st_6 st_6
end type
type tabpage_crear from userobject within tab_1
end type
type st_x6 from statictext within tabpage_crear
end type
type st_x5 from statictext within tabpage_crear
end type
type st_x4 from statictext within tabpage_crear
end type
type st_x3 from statictext within tabpage_crear
end type
type st_x2 from statictext within tabpage_crear
end type
type st_x1 from statictext within tabpage_crear
end type
type ddlb_estado from dropdownlistbox within tabpage_crear
end type
type ddlb_credenciales from dropdownlistbox within tabpage_crear
end type
type st_estado from statictext within tabpage_crear
end type
type cb_2 from commandbutton within tabpage_crear
end type
type cb_1 from commandbutton within tabpage_crear
end type
type sle_confcontrasena from singlelineedit within tabpage_crear
end type
type sle_contrasena from singlelineedit within tabpage_crear
end type
type sle_nombre from singlelineedit within tabpage_crear
end type
type st_nombre from statictext within tabpage_crear
end type
type st_credenciales from statictext within tabpage_crear
end type
type st_confcontrasena from statictext within tabpage_crear
end type
type st_contarsena from statictext within tabpage_crear
end type
type st_usuario from statictext within tabpage_crear
end type
type gb_2 from groupbox within tabpage_crear
end type
type sle_usuario from singlelineedit within tabpage_crear
end type
type tabpage_crear from userobject within tab_1
st_x6 st_x6
st_x5 st_x5
st_x4 st_x4
st_x3 st_x3
st_x2 st_x2
st_x1 st_x1
ddlb_estado ddlb_estado
ddlb_credenciales ddlb_credenciales
st_estado st_estado
cb_2 cb_2
cb_1 cb_1
sle_confcontrasena sle_confcontrasena
sle_contrasena sle_contrasena
sle_nombre sle_nombre
st_nombre st_nombre
st_credenciales st_credenciales
st_confcontrasena st_confcontrasena
st_contarsena st_contarsena
st_usuario st_usuario
gb_2 gb_2
sle_usuario sle_usuario
end type
type tabpage_upd from userobject within tab_1
end type
type st_7 from statictext within tabpage_upd
end type
type cb_restablecer from commandbutton within tabpage_upd
end type
type cb_busqueda from commandbutton within tabpage_upd
end type
type st_4 from statictext within tabpage_upd
end type
type dw_upd from datawindow within tabpage_upd
end type
type sle_busqueda from singlelineedit within tabpage_upd
end type
type tabpage_upd from userobject within tab_1
st_7 st_7
cb_restablecer cb_restablecer
cb_busqueda cb_busqueda
st_4 st_4
dw_upd dw_upd
sle_busqueda sle_busqueda
end type
type tabpage_del from userobject within tab_1
end type
type st_5 from statictext within tabpage_del
end type
type tabpage_del from userobject within tab_1
st_5 st_5
end type
type tab_1 from tab within w_abc_usuarios
tabpage_none tabpage_none
tabpage_crear tabpage_crear
tabpage_upd tabpage_upd
tabpage_del tabpage_del
end type
type gb_1 from groupbox within w_abc_usuarios
end type
end forward

global type w_abc_usuarios from window
integer x = 1326
integer y = 652
integer width = 5381
integer height = 2812
boolean titlebar = true
string title = "Alta/Baja/Cambio Usuarios (w_abc_usuarios)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
st_3 st_3
st_2 st_2
st_1 st_1
p_del p_del
p_upd p_upd
p_new p_new
tab_1 tab_1
gb_1 gb_1
end type
global w_abc_usuarios w_abc_usuarios

forward prototypes
public function integer f_limpiar ()
end prototypes

public function integer f_limpiar ();tab_1.tabpage_crear.st_x1.visible=false
tab_1.tabpage_crear.st_x2.visible=false
tab_1.tabpage_crear.st_x3.visible=false
tab_1.tabpage_crear.st_x4.visible=false
tab_1.tabpage_crear.st_x5.visible=false
tab_1.tabpage_crear.st_x6.visible=false

tab_1.tabpage_crear.visible=false
tab_1.tabpage_upd.visible=false
tab_1.tabpage_del.visible=false

tab_1.tabpage_none.visible=true
tab_1.SelectTab("tabpage_none")


return 1
end function

on w_abc_usuarios.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.p_del=create p_del
this.p_upd=create p_upd
this.p_new=create p_new
this.tab_1=create tab_1
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.p_del,&
this.p_upd,&
this.p_new,&
this.tab_1,&
this.gb_1}
end on

on w_abc_usuarios.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_del)
destroy(this.p_upd)
destroy(this.p_new)
destroy(this.tab_1)
destroy(this.gb_1)
end on

event open;if g_credenciales<>'SPV' then
	messagebox('Denegado', 'Usuario no autorizado para esta aplicaci$$HEX1$$f300$$ENDHEX$$n')
	close(this)
else
	
f_limpiar()


Randomize (0) //semilla de la asignaci$$HEX1$$f300$$ENDHEX$$n aleatoria de las contrase$$HEX1$$f100$$ENDHEX$$as para usuarios nuevos

end if
end event

type st_3 from statictext within w_abc_usuarios
integer x = 165
integer y = 1200
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
string text = "Eliminar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_abc_usuarios
integer x = 165
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
long backcolor = 33554431
boolean enabled = false
string text = "Modificar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_abc_usuarios
integer x = 165
integer y = 508
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
string text = "Crear"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_del from picture within w_abc_usuarios
integer x = 247
integer y = 972
integer width = 183
integer height = 200
integer taborder = 50
string picturename = "pict\u_del.bmp"
boolean focusrectangle = false
end type

event clicked;f_limpiar()

tab_1.tabpage_none.visible=false
tab_1.tabpage_del.visible=true
tab_1.SelectTab("tabpage_del")

//tab_1.tabpage_del.dw_del.retrieve()
end event

type p_upd from picture within w_abc_usuarios
integer x = 247
integer y = 632
integer width = 183
integer height = 200
integer taborder = 40
string picturename = "pict\u_upd.bmp"
boolean focusrectangle = false
end type

event clicked;f_limpiar()

tab_1.tabpage_none.visible=false
tab_1.tabpage_upd.visible=true
tab_1.SelectTab("tabpage_upd")

tab_1.tabpage_upd.dw_upd.retrieve()
end event

type p_new from picture within w_abc_usuarios
integer x = 247
integer y = 300
integer width = 183
integer height = 200
integer taborder = 20
string picturename = "pict\u_new.bmp"
boolean focusrectangle = false
end type

event clicked;f_limpiar()

String ls_passval[31] = {'A','B','C','D','E','F','G','H', &
'J','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z',&
'1','2','3','4','5','6','7','8','9'}


string autopassword
integer mying


tab_1.tabpage_none.visible=false
tab_1.tabpage_crear.visible=true

tab_1.tabpage_crear.sle_usuario.text=''
tab_1.tabpage_crear.sle_nombre.text=''


tab_1.SelectTab("tabpage_crear")


	FOR mying = 1 TO 6
		IF mying = 1 THEN
		  autopassword =  ls_passval[rand(30)+1]
		ELSE
		  autopassword = autopassword + ls_passval[rand(30)+1]
		 END IF
		NEXT
	
		tab_1.tabpage_crear.sle_contrasena.text=autopassword
		tab_1.tabpage_crear.sle_confcontrasena.text=autopassword
		tab_1.tabpage_crear.ddlb_credenciales.text="OPR OPERADOR"
		tab_1.tabpage_crear.ddlb_estado.text="(A) DE ALTA"
end event

type tab_1 from tab within w_abc_usuarios
integer x = 640
integer y = 100
integer width = 4338
integer height = 2440
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long backcolor = 81324524
boolean raggedright = true
integer selectedtab = 1
tabpage_none tabpage_none
tabpage_crear tabpage_crear
tabpage_upd tabpage_upd
tabpage_del tabpage_del
end type

on tab_1.create
this.tabpage_none=create tabpage_none
this.tabpage_crear=create tabpage_crear
this.tabpage_upd=create tabpage_upd
this.tabpage_del=create tabpage_del
this.Control[]={this.tabpage_none,&
this.tabpage_crear,&
this.tabpage_upd,&
this.tabpage_del}
end on

on tab_1.destroy
destroy(this.tabpage_none)
destroy(this.tabpage_crear)
destroy(this.tabpage_upd)
destroy(this.tabpage_del)
end on

type tabpage_none from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4302
integer height = 2312
long backcolor = 81324524
string text = "usuarios"
long tabtextcolor = 128
long tabbackcolor = 81324524
long picturemaskcolor = 536870912
st_6 st_6
end type

on tabpage_none.create
this.st_6=create st_6
this.Control[]={this.st_6}
end on

on tabpage_none.destroy
destroy(this.st_6)
end on

type st_6 from statictext within tabpage_none
integer x = 119
integer y = 204
integer width = 1088
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
string text = "<<<---Seleccione una opci$$HEX1$$f300$$ENDHEX$$n del men$$HEX1$$fa00$$ENDHEX$$"
boolean focusrectangle = false
end type

type tabpage_crear from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4302
integer height = 2312
long backcolor = 15793151
string text = "Crear nuevo usuario"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
st_x6 st_x6
st_x5 st_x5
st_x4 st_x4
st_x3 st_x3
st_x2 st_x2
st_x1 st_x1
ddlb_estado ddlb_estado
ddlb_credenciales ddlb_credenciales
st_estado st_estado
cb_2 cb_2
cb_1 cb_1
sle_confcontrasena sle_confcontrasena
sle_contrasena sle_contrasena
sle_nombre sle_nombre
st_nombre st_nombre
st_credenciales st_credenciales
st_confcontrasena st_confcontrasena
st_contarsena st_contarsena
st_usuario st_usuario
gb_2 gb_2
sle_usuario sle_usuario
end type

on tabpage_crear.create
this.st_x6=create st_x6
this.st_x5=create st_x5
this.st_x4=create st_x4
this.st_x3=create st_x3
this.st_x2=create st_x2
this.st_x1=create st_x1
this.ddlb_estado=create ddlb_estado
this.ddlb_credenciales=create ddlb_credenciales
this.st_estado=create st_estado
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_confcontrasena=create sle_confcontrasena
this.sle_contrasena=create sle_contrasena
this.sle_nombre=create sle_nombre
this.st_nombre=create st_nombre
this.st_credenciales=create st_credenciales
this.st_confcontrasena=create st_confcontrasena
this.st_contarsena=create st_contarsena
this.st_usuario=create st_usuario
this.gb_2=create gb_2
this.sle_usuario=create sle_usuario
this.Control[]={this.st_x6,&
this.st_x5,&
this.st_x4,&
this.st_x3,&
this.st_x2,&
this.st_x1,&
this.ddlb_estado,&
this.ddlb_credenciales,&
this.st_estado,&
this.cb_2,&
this.cb_1,&
this.sle_confcontrasena,&
this.sle_contrasena,&
this.sle_nombre,&
this.st_nombre,&
this.st_credenciales,&
this.st_confcontrasena,&
this.st_contarsena,&
this.st_usuario,&
this.gb_2,&
this.sle_usuario}
end on

on tabpage_crear.destroy
destroy(this.st_x6)
destroy(this.st_x5)
destroy(this.st_x4)
destroy(this.st_x3)
destroy(this.st_x2)
destroy(this.st_x1)
destroy(this.ddlb_estado)
destroy(this.ddlb_credenciales)
destroy(this.st_estado)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_confcontrasena)
destroy(this.sle_contrasena)
destroy(this.sle_nombre)
destroy(this.st_nombre)
destroy(this.st_credenciales)
destroy(this.st_confcontrasena)
destroy(this.st_contarsena)
destroy(this.st_usuario)
destroy(this.gb_2)
destroy(this.sle_usuario)
end on

type st_x6 from statictext within tabpage_crear
integer x = 2665
integer y = 1252
integer width = 101
integer height = 104
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "x"
boolean focusrectangle = false
end type

type st_x5 from statictext within tabpage_crear
integer x = 2665
integer y = 1072
integer width = 101
integer height = 124
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "x"
boolean focusrectangle = false
end type

type st_x4 from statictext within tabpage_crear
integer x = 2665
integer y = 820
integer width = 101
integer height = 132
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "x"
boolean focusrectangle = false
end type

type st_x3 from statictext within tabpage_crear
integer x = 2665
integer y = 636
integer width = 101
integer height = 120
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "x"
boolean focusrectangle = false
end type

type st_x2 from statictext within tabpage_crear
integer x = 2665
integer y = 464
integer width = 101
integer height = 112
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "x"
boolean focusrectangle = false
end type

type st_x1 from statictext within tabpage_crear
integer x = 2665
integer y = 300
integer width = 101
integer height = 128
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "x"
boolean focusrectangle = false
end type

type ddlb_estado from dropdownlistbox within tabpage_crear
integer x = 1303
integer y = 836
integer width = 1339
integer height = 240
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
string item[] = {"(A) DE ALTA","(B) DE BAJA"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_credenciales from dropdownlistbox within tabpage_crear
integer x = 1303
integer y = 652
integer width = 1339
integer height = 244
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"SPV SUPERVISOR","OPR OPERADOR","CON CONSULTA","OCM OFICINA COMERCIAL",""}
borderstyle borderstyle = stylelowered!
end type

type st_estado from statictext within tabpage_crear
integer x = 288
integer y = 828
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Estado:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within tabpage_crear
integer x = 2007
integer y = 1540
integer width = 343
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Cancelar"
end type

event clicked;f_limpiar()
end event

type cb_1 from commandbutton within tabpage_crear
integer x = 1509
integer y = 1536
integer width = 343
integer height = 144
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Grabar"
end type

event clicked;int validacion
string mensaje, lo_user, lo_user2
string lo_nombre, lo_estado, lo_credenciales, lo_pass
datetime hoy, hoy2



validacion=0
mensaje=''
setnull(hoy2)

st_x1.visible=false
st_x2.visible=false
st_x3.visible=false
st_x4.visible=false
st_x5.visible=false
st_x6.visible=false



	
		


if isnull(sle_usuario.text) or sle_usuario.text='' then
	validacion=1
	mensaje=mensaje+'~r~nIngrese ID de usuario'
	st_x1.visible=true
end if

if pos(sle_usuario.text," ") > 0 then
	validacion=1
	mensaje=mensaje+'~r~nID de usuario no puede contener espacios'
	st_x1.visible=true
end if


if isnull(sle_nombre.text) or sle_nombre.text='' then
	validacion=1
	mensaje=mensaje+'~r~nIngrese nombre de usuario'
	st_x2.visible=true
else
	
	lo_user2=sle_usuario.text
	
	select usuario
	into :lo_user
	from usuario
	where usuario=:lo_user2
	using sqlca2;
	
	if sqlca2.sqlcode=0 then
		validacion=1
		mensaje=mensaje+'~r~nID USUARIO YA EXISTE!!!!'
		st_x1.visible=true
		validacion=1
	
		end if
	
	
	
end if


if isnull(ddlb_credenciales.text) or ddlb_credenciales.text='' then
	validacion=1
	mensaje=mensaje+'~r~nDefinir credenciales'
	st_x3.visible=true
end if

if isnull(ddlb_estado.text) or ddlb_estado.text='' then
	validacion=1
	mensaje=mensaje+'~r~nDefinir estado'
	st_x4.visible=true
end if

if len(sle_contrasena.text)< 6 then
	validacion=1
	mensaje=mensaje+'~r~nLongitud de contrase$$HEX1$$f100$$ENDHEX$$a al menos de 6 caracteres'
	st_x5.visible=true
end if


if sle_contrasena.text <> sle_confcontrasena.text then
	validacion=1
	mensaje=mensaje+'~r~nContrase$$HEX1$$f100$$ENDHEX$$as no coinciden'
	st_x6.visible=true
end if



		





if validacion=1 then
	
	openwithparm(w_valida,mensaje)
else
	
	
	select sysdate
	into :hoy
	from dual
	using sqlca2;
	
	
	
	if sqlca2.sqlcode=0 then
			/*nada*/
			
	else	
		hoy=datetime(today(),now())
	end if
	
	
	lo_pass=f_encriptar(sle_contrasena.text)
	lo_nombre=sle_nombre.text
	
	
	if ddlb_credenciales.text="SPV SUPERVISOR" then
		lo_credenciales='SPV'
	end if

	if ddlb_credenciales.text="OPR OPERADOR" then
		lo_credenciales='OPR'
	end if
	
	/*Agregado para FASE 4 Ot24h*/
	if ddlb_credenciales.text="CON CONSULTA" then
		lo_credenciales='CON'
	end if
	/*---------------------------------*/
	
	/*Nuevo perfil para Oficina Comercial*/
	if ddlb_credenciales.text="OCM OFICINA COMERCIAL" then
		lo_credenciales='OCM'
	end if
	/*---------------------------------*/



	insert into usuario values(:lo_user2, :lo_pass, :lo_nombre, 'A',:hoy, :hoy2, :hoy, 0, :lo_credenciales,:hoy)
	using sqlca2;
	

	
	
	IF SQLCA2.SQLCODE=0 THEN
			commit using sqlca2;
		 messagebox("Info", 'Usuario Creado:~r~n'+lo_user2+"/"+sle_contrasena.text+'~r~nEl Usuario debe cambiar su contrase$$HEX1$$f100$$ENDHEX$$a de inmediato')
		 
		 insert into evento values(-1, -1, 'USR', -1, :g_cod_usuario, :hoy, 'Alta de usuario '||:lo_user)
		 using sqlca2;
		 
		 commit using sqlca2;
		 
		 
		 
		 
	ELSE
			messagebox(SQLca2.SQLERRTEXT, 'No se pudo crear el usuario')
	end if
	
	
	f_limpiar()
	
		
	
end if //validacion
end event

type sle_confcontrasena from singlelineedit within tabpage_crear
integer x = 1303
integer y = 1252
integer width = 1330
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type sle_contrasena from singlelineedit within tabpage_crear
integer x = 1303
integer y = 1072
integer width = 1330
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type sle_nombre from singlelineedit within tabpage_crear
integer x = 1303
integer y = 424
integer width = 1330
integer height = 184
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

type st_nombre from statictext within tabpage_crear
integer x = 288
integer y = 424
integer width = 343
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Nombre:"
boolean focusrectangle = false
end type

type st_credenciales from statictext within tabpage_crear
integer x = 288
integer y = 652
integer width = 375
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Credenciales:"
boolean focusrectangle = false
end type

type st_confcontrasena from statictext within tabpage_crear
integer x = 288
integer y = 1252
integer width = 599
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Confirmar contrase$$HEX1$$f100$$ENDHEX$$a:"
boolean focusrectangle = false
end type

type st_contarsena from statictext within tabpage_crear
integer x = 288
integer y = 1072
integer width = 722
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Contrase$$HEX1$$f100$$ENDHEX$$a:"
boolean focusrectangle = false
end type

type st_usuario from statictext within tabpage_crear
integer x = 288
integer y = 296
integer width = 745
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "ID Usuario:"
boolean focusrectangle = false
end type

type gb_2 from groupbox within tabpage_crear
integer x = 146
integer y = 112
integer width = 3621
integer height = 1728
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
end type

type sle_usuario from singlelineedit within tabpage_crear
integer x = 1303
integer y = 296
integer width = 1330
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
boolean autohscroll = false
textcase textcase = upper!
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type tabpage_upd from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4302
integer height = 2312
long backcolor = 15793151
string text = "Modificar usuario"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
st_7 st_7
cb_restablecer cb_restablecer
cb_busqueda cb_busqueda
st_4 st_4
dw_upd dw_upd
sle_busqueda sle_busqueda
end type

on tabpage_upd.create
this.st_7=create st_7
this.cb_restablecer=create cb_restablecer
this.cb_busqueda=create cb_busqueda
this.st_4=create st_4
this.dw_upd=create dw_upd
this.sle_busqueda=create sle_busqueda
this.Control[]={this.st_7,&
this.cb_restablecer,&
this.cb_busqueda,&
this.st_4,&
this.dw_upd,&
this.sle_busqueda}
end on

on tabpage_upd.destroy
destroy(this.st_7)
destroy(this.cb_restablecer)
destroy(this.cb_busqueda)
destroy(this.st_4)
destroy(this.dw_upd)
destroy(this.sle_busqueda)
end on

type st_7 from statictext within tabpage_upd
integer x = 2098
integer y = 80
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 15793151
string text = "Busqueda"
boolean focusrectangle = false
end type

type cb_restablecer from commandbutton within tabpage_upd
integer x = 3488
integer y = 80
integer width = 402
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Restablecer"
end type

event clicked;sle_busqueda.text = ""
dw_upd.SetFilter("")
dw_upd.Filter()
tab_1.tabpage_upd.dw_upd.reset()
tab_1.tabpage_upd.dw_upd.retrieve()
end event

type cb_busqueda from commandbutton within tabpage_upd
integer x = 3090
integer y = 80
integer width = 402
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Busqueda"
end type

event clicked;//TDA-EDM-11
//REALIZAMOS UNA BUSQUEDA EN LA DATAWINDOWS

string busqueda

busqueda = ""

busqueda = upper(sle_busqueda.Text)

if busqueda = "" then
	dw_upd.SetFilter("")
	dw_upd.Filter()
	tab_1.tabpage_upd.dw_upd.reset()
	tab_1.tabpage_upd.dw_upd.retrieve()
else
	dw_upd.SetFilter("nombre like '%"+busqueda+ "%'")
	dw_upd.Filter()
end if	


/*
if Not IsNull(busqueda)then
	dw_upd.SetFilter("nombre like '%"+busqueda+ "%'")
	dw_upd.Filter()
else
	tab_1.tabpage_upd.dw_upd.reset()
	tab_1.tabpage_upd.dw_upd.retrieve()
end if	
*/
end event

type st_4 from statictext within tabpage_upd
integer x = 128
integer y = 160
integer width = 699
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
string text = "Doble click para modificar"
boolean focusrectangle = false
end type

type dw_upd from datawindow within tabpage_upd
integer x = 123
integer y = 264
integer width = 3758
integer height = 1572
integer taborder = 20
string dataobject = "dw_usuarios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca2)
end event

event doubleclicked;long fila
string registro


THIS.SelectRow(0, FALSE)

THIS.SeLECTRow(row, TRUE)


fila=this.getrow()
this.scrolltorow(fila)


if fila>0 then


		registro=this.object.usuario[fila]
		
		openwithparm(w_abc_usuarios_upd,registro)
		
		this.retrieve()

end if
end event

type sle_busqueda from singlelineedit within tabpage_upd
integer x = 2414
integer y = 80
integer width = 645
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type tabpage_del from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4302
integer height = 2312
long backcolor = 15793151
string text = "Eliminar usuario"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
st_5 st_5
end type

on tabpage_del.create
this.st_5=create st_5
this.Control[]={this.st_5}
end on

on tabpage_del.destroy
destroy(this.st_5)
end on

type st_5 from statictext within tabpage_del
integer x = 128
integer y = 160
integer width = 1815
integer height = 384
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "La eliminaci$$HEX1$$f300$$ENDHEX$$n de usuarios no es permitida. Para dar de baja al usuario por favor elija la opci$$HEX1$$f300$$ENDHEX$$n de ~"Modificar~" en el men$$HEX2$$fa002000$$ENDHEX$$de opciones."
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_abc_usuarios
integer x = 105
integer y = 76
integer width = 466
integer height = 2468
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
string text = "Opciones"
end type


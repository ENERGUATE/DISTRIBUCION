HA$PBExportHeader$w_arranque_bdg.srw
$PBExportComments$No borrar, cambios para BDG
forward
global type w_arranque_bdg from window
end type
type st_5 from statictext within w_arranque_bdg
end type
type p_2 from picture within w_arranque_bdg
end type
type st_4 from statictext within w_arranque_bdg
end type
type st_3 from statictext within w_arranque_bdg
end type
type st_2 from statictext within w_arranque_bdg
end type
type p_1 from picture within w_arranque_bdg
end type
type cb_3 from u_cb within w_arranque_bdg
end type
type cb_1 from u_cb within w_arranque_bdg
end type
type st_1 from statictext within w_arranque_bdg
end type
type oval_1 from oval within w_arranque_bdg
end type
type d_usuario from u_gen_2001_pr_ingreso_usuario within w_arranque_bdg
end type
end forward

global type w_arranque_bdg from window
integer x = 873
integer y = 600
integer width = 1920
integer height = 1184
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 128
st_5 st_5
p_2 p_2
st_4 st_4
st_3 st_3
st_2 st_2
p_1 p_1
cb_3 cb_3
cb_1 cb_1
st_1 st_1
oval_1 oval_1
d_usuario d_usuario
end type
global w_arranque_bdg w_arranque_bdg

type variables
//w_arranque iw_w_arranque
u_generico_comunicaciones iu_2102_comunic // local de trabajo con ventana
integer li_veces=0
end variables

event open;string ls_usuario
iu_2102_comunic = create u_generico_comunicaciones
//gu_perfiles = create u_perfil// DSA 09/08/2000

d_usuario.fnu_insertar_fila()
// DSA INI 09/08/2000
//d_usuario.setitem(1,"ps_usuario","IB011OET")
ls_usuario=ProfileString("opensgi.ini", "database", "Usuario_Sgi", "")
d_usuario.setitem(1,"ps_usuario",ls_usuario)
if ls_usuario <> '' then 
	SetFocus (d_usuario)
	d_usuario.SetColumn("ps_clave")
end if
// DSA FIN 09/08/2000


//***************************************
//**  OSGI 2001.1  	23/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If This.ClassName() <> "w_arranque_bdg_ext" Then
	If ProfileString("opensgi.ini","EXTERNALIDAD","ventana_inicio","N") = "S" Then
		Close(This)
		Open(w_arranque_bdg_ext)
		Return
	End If
End If
//***************************************
//**  OSGI 2001.1  	23/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on w_arranque_bdg.create
this.st_5=create st_5
this.p_2=create p_2
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.p_1=create p_1
this.cb_3=create cb_3
this.cb_1=create cb_1
this.st_1=create st_1
this.oval_1=create oval_1
this.d_usuario=create d_usuario
this.Control[]={this.st_5,&
this.p_2,&
this.st_4,&
this.st_3,&
this.st_2,&
this.p_1,&
this.cb_3,&
this.cb_1,&
this.st_1,&
this.oval_1,&
this.d_usuario}
end on

on w_arranque_bdg.destroy
destroy(this.st_5)
destroy(this.p_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.oval_1)
destroy(this.d_usuario)
end on

type st_5 from statictext within w_arranque_bdg
boolean visible = false
integer x = 50
integer y = 588
integer width = 1755
integer height = 212
integer textsize = -18
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Verificando clave de acceso"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_2 from picture within w_arranque_bdg
integer x = 1559
integer y = 52
integer width = 206
integer height = 180
string picturename = "logo_sgd_2.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_usuario
d_usuario.accepttext()
ls_usuario=d_usuario.getitemstring(1,"ps_usuario")
if not isnull(ls_usuario) and ls_usuario<>"" then
	d_usuario.setitem(1,"ps_clave",ls_usuario)
end if	
end event

type st_4 from statictext within w_arranque_bdg
boolean visible = false
integer x = 41
integer y = 580
integer width = 1755
integer height = 212
integer textsize = -18
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Conect$$HEX1$$e100$$ENDHEX$$ndose a la Base de Datos"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_arranque_bdg
integer x = 1513
integer y = 368
integer width = 41
integer height = 52
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "R"
boolean focusrectangle = false
end type

type st_2 from statictext within w_arranque_bdg
integer x = 389
integer y = 400
integer width = 1102
integer height = 100
integer textsize = -14
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Base de Datos de Gesti$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
long bordercolor = 32896
boolean focusrectangle = false
end type

type p_1 from picture within w_arranque_bdg
integer x = 50
integer y = 48
integer width = 329
integer height = 284
string picturename = "uf.bmp"
boolean focusrectangle = false
end type

type cb_3 from u_cb within w_arranque_bdg
integer x = 1079
integer y = 896
integer width = 411
integer height = 96
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Salir"
end type

on clicked;call u_cb::clicked;Close(Parent)
end on

type cb_1 from u_cb within w_arranque_bdg
integer x = 407
integer y = 892
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;call super::clicked;SetPointer(HourGlass!)
timer(0)
string ls_usuario,ls_usu,ls_nombre,ls_clave, ls_clave_introducida, ls_cifrada
int li_per,li_indice,li_cont, li_nro_aviso
datetime ldt_fecha_expiracion, ldt_fecha_actual

SetNull(ldt_fecha_expiracion)

////////////////////
// Desde aqui hay que comentar
//
li_veces= li_veces + 1
d_usuario.AcceptText()
ls_usuario = UPPER(d_usuario.getitemstring(1,"ps_usuario"))
ls_clave_introducida = UPPER(d_usuario.getitemstring(1,"ps_clave"))
st_5.visible = TRUE
cb_1.visible = FALSE
cb_3.visible = FALSE

// Abre la ventanita de la barra y la posiciona en pantalla
parent.setredraw(false)
open(w_barra_standart)


//***************************************
//**  OSGI 2001.1  	23/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	23/04/2001  w_barra_standart.x=270
//**  OSGI 2001.1  	23/04/2001  w_barra_standart.y=893
w_barra_standart.x=25
w_barra_standart.y=1050
//***************************************
//**  OSGI 2001.1  	23/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


w_barra_standart.ole_barra.object.forecolor = RGB(128,0,0)
parent.setredraw(true)
// FDO

// Hasta aqui hay que comentar
///////////////////

// La funcion fg_conexion_bd debe ser modificada para que acepte
// como parametros al usuario y la clave en vez de aceptar a la dw
IF fg_conexion_bd(d_usuario) = -1 THEN
	close(parent)
	return
END IF
gb_entre = true // variable global para indicar que me conecte a la base

//Obtiene el centro, cmd y puesto del usuario

SELECT "GI_USUARIO_SGI"."USUARIO",   
       "GI_USUARIO_SGI"."NRO_CENTRO",   
       "GI_USUARIO_SGI"."NRO_CMD",   
       "GI_USUARIO_SGI"."NRO_MESA",   
       "GI_USUARIO_SGI"."NOM_USUARIO", CLAVE  
INTO  
		:gs_usuario,
		:gi_nro_centro,
		:gi_nro_cmd,
		:gi_nro_puesto,
		:ls_nombre, :ls_clave

FROM "GI_USUARIO_SGI" 
WHERE "GI_USUARIO_SGI"."USUARIO" = :ls_usuario ;

w_barra_standart.ole_barra.object.value = 4 //FDO

IF sqlca.sqlcode <> 0 THEN
//	messagebox("Aviso","Usuario inexistente")
gnv_msg.f_mensaje("EG26","","",OK!)	
	if li_veces=3 then 
		HALT CLOSE
	else
		d_usuario.visible=true
		st_5.visible = false
		cb_1.visible = true
		cb_3.visible = TRUE
		st_4.visible= false
		close(w_barra_standart)
		disconnect;
		timer(0.08)
		return
	end if
END IF
gu_perfiles = create u_perfil// DSA 09/08/2000
gu_perfiles.of_cifra_clave(ls_clave_introducida,ls_cifrada)

if ls_cifrada<>ls_clave then // CLAVE DE USUARIO INCORRECTA
//	messagebox("Aviso","Clave Incorrecta")
gnv_msg.f_mensaje("EG27","","",OK!)	
	if li_veces=3 then 
		HALT CLOSE
	else
		d_usuario.visible=true
		st_5.visible = false
		cb_1.visible = true
		cb_3.visible = TRUE
		st_4.visible= false
		close(w_barra_standart)
		disconnect;
		timer(0.08)
		return
	end if
END IF

st_5.visible = FALSE
st_4.visible = TRUE



//SOLO TIENE UN PERFIL
SELECT "GI_USUARIO_PERFILES"."ID_USUARIO",   
       "GI_USUARIO_PERFILES"."PERFIL",
			"GI_USUARIO_PERFILES"."F_EXPIRACION",sysdate
INTO :ls_usu, :li_per, :ldt_fecha_expiracion, :ldt_fecha_actual 
FROM  "GI_USUARIO_PERFILES"  
WHERE "GI_USUARIO_PERFILES"."ID_USUARIO" = :ls_usuario ;
if sqlca.sqlcode<>0 then 
//		messagebox("Aviso","Usuario sin perfil o usuario con mas de un perfil")
		gnv_msg.f_mensaje("EG28","","",OK!)	
	if li_veces=3 then 
		HALT CLOSE
	else
		d_usuario.visible=true
		st_5.visible = false
		cb_1.visible = true
		cb_3.visible = TRUE
		st_4.visible= false
		close(w_barra_standart)
		disconnect;
		timer(0.08)
		return
	end if
end if	

if ldt_fecha_expiracion<ldt_fecha_actual then 
//	messagebox("Aviso","Usuario con perfil caducado")
	gnv_msg.f_mensaje("EG29","","",OK!)	
	if li_veces=3 then 
		HALT CLOSE
	else
		d_usuario.visible=true
		st_5.visible = false
		cb_1.visible = true
		cb_3.visible = TRUE
		st_4.visible= false
		close(w_barra_standart)
		disconnect;
		timer(0.08)
		return
	end if
end if

gi_perfil=li_per
w_barra_standart.ole_barra.object.value = 8 //FDO

gu_perfiles.of_recupera_datos_perfil(gi_perfil)

SELECT "SGD_PARAMETROS"."VALOR"
INTO :fgci_con_Operaciones
FROM "SGD_PARAMETROS"
WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = 11 AND "SGD_PARAMETROS"."SISTEMA" = 'SGI';

SELECT "SGD_PARAMETROS"."VALOR"
INTO :fgci_con_SCADA
FROM "SGD_PARAMETROS"
WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = 48 AND "SGD_PARAMETROS"."SISTEMA" = 'SGI';


//close c_usuario;
gs_programa_principal = "w_bdg"

Open(w_bdg)

Close(parent)

end event

type st_1 from statictext within w_arranque_bdg
integer x = 389
integer y = 188
integer width = 1102
integer height = 196
integer textsize = -36
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean italic = true
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "OPEN SGI"
alignment alignment = center!
boolean focusrectangle = false
end type

type oval_1 from oval within w_arranque_bdg
long linecolor = 16777215
integer linethickness = 4
long fillcolor = 128
integer x = 1495
integer y = 364
integer width = 73
integer height = 68
end type

type d_usuario from u_gen_2001_pr_ingreso_usuario within w_arranque_bdg
integer x = 498
integer y = 548
integer width = 983
integer height = 260
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_2001_pr_ingreso_usuario_bdg"
boolean border = false
end type


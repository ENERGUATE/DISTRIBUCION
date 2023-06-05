HA$PBExportHeader$w_arranque_operaciones_new.srw
forward
global type w_arranque_operaciones_new from window
end type
type st_8 from statictext within w_arranque_operaciones_new
end type
type st_7 from statictext within w_arranque_operaciones_new
end type
type st_6 from statictext within w_arranque_operaciones_new
end type
type st_3 from statictext within w_arranque_operaciones_new
end type
type p_1 from picture within w_arranque_operaciones_new
end type
type p_uf from picture within w_arranque_operaciones_new
end type
type st_2 from statictext within w_arranque_operaciones_new
end type
type cb_3 from u_cb within w_arranque_operaciones_new
end type
type cb_1 from u_cb within w_arranque_operaciones_new
end type
type st_1 from statictext within w_arranque_operaciones_new
end type
type oval_1 from oval within w_arranque_operaciones_new
end type
type st_5 from statictext within w_arranque_operaciones_new
end type
type st_4 from statictext within w_arranque_operaciones_new
end type
type d_usuario from u_gen_2001_pr_ingreso_usuario within w_arranque_operaciones_new
end type
type sle_nuevaclave from singlelineedit within w_arranque_operaciones_new
end type
end forward

global type w_arranque_operaciones_new from window
boolean visible = false
integer width = 1856
integer height = 1108
windowtype windowtype = response!
long backcolor = 8421376
st_8 st_8
st_7 st_7
st_6 st_6
st_3 st_3
p_1 p_1
p_uf p_uf
st_2 st_2
cb_3 cb_3
cb_1 cb_1
st_1 st_1
oval_1 oval_1
st_5 st_5
st_4 st_4
d_usuario d_usuario
sle_nuevaclave sle_nuevaclave
end type
global w_arranque_operaciones_new w_arranque_operaciones_new

type prototypes
Function long GetComputerNameA  (REF string Name ,REF long Length ) Library "kernel32.dll" alias for "GetComputerNameA;Ansi" 

//AHM Mejora 1/572035
Function ulong GetUserNameA(REF string lpBuffer, REF ulong nSize ) Library "advapi32.dll" alias for "GetUserNameA;Ansi" 


end prototypes

type variables
//w_arranque iw_w_arranque
u_generico_comunicaciones iu_2102_comunic // local de trabajo con ventana
integer i_vez =2
integer li_veces=0
boolean ib_subiendo=true
boolean ib_sin_ventana = false

//AHM (06/11/2009) Mejora 1/732525
boolean	ib_renovacionCont			//Indicador de si es necesario renovar la contrase$$HEX1$$f100$$ENDHEX$$a
int		ii_numeroIntentos			//N$$HEX1$$fa00$$ENDHEX$$mero de intentos de cambiar la clave
int		ii_numeroPasadas			//N$$HEX1$$fa00$$ENDHEX$$mero de veces que se ha pulsado la tecla clicked desde que se ha detectado que la clave se ha caducado, por intento
string	is_nuevaClave1				//Nueva clave primera vez que se introduce
string	is_nuevaClave2				//Nueva clave segunda vez que se introduce
end variables

forward prototypes
public function integer fnu_conectar_estado_incidencia (ref datawindow pd_dw)
public function integer fnu_o_datos_ubicacion ()
public subroutine fnu_centrar_ventana ()
public function integer fw_caducidadclave (string ps_fecharenovacion, ref long pl_ind_bloqueado, string ps_usuario)
end prototypes

public function integer fnu_conectar_estado_incidencia (ref datawindow pd_dw);//ds_estado_incidencia_t.sharedata(pd_dw)
return 1
end function

public function integer fnu_o_datos_ubicacion ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_o_datos_ubicacion
// 
// Objetivo: Obtengo datos centros y departamentos.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//	09/8/96		AFS			Modificacion
////////////////////////////////////////////////////////////////////////////////////////////////

int li_tipo

IF GI_NRO_CENTRO = fgci_todos AND GI_NRO_CMD = fgci_todos AND GI_NRO_PUESTO = fgci_todos THEN
	li_tipo = 1
ELSE
	li_tipo = 3
END IF

  SELECT "SGD_CENTRO"."COD_PROV",   
         "SGD_CENTRO"."COD_DEPTO",   
         "SGD_CENTRO"."COD_MUNIC",   
         "SGD_CENTRO"."COD_LOCAL",   
         "PROVINCIAS"."NOM_PROV",   
         "DEPTOS"."NOM_DEPTO",   
         "MUNICIPIOS"."NOM_MUNIC",   
         "LOCALIDADES"."NOM_LOCAL"  
    INTO 
         :gi_cod_provincia,   
         :gi_cod_departamento,   
         :gl_cod_municipio,   
         :gl_cod_localidad,   
         :gs_provincia,   
         :gs_departamento,
         :gs_municipio,   
         :gs_localidad  
    FROM "DEPTOS",   
         "LOCALIDADES",   
         "MUNICIPIOS",   
         "PROVINCIAS" ,
			"SGD_CENTRO" 
   WHERE ( "SGD_CENTRO"."COD_PROV" = "PROVINCIAS"."COD_PROV" ) and  
         ( "SGD_CENTRO"."COD_DEPTO" = "DEPTOS"."COD_DEPTO" ) and  
         ( "SGD_CENTRO"."COD_MUNIC" = "MUNICIPIOS"."COD_MUNIC" ) and  
         ( "SGD_CENTRO"."COD_LOCAL" = "LOCALIDADES"."COD_LOCAL" ) and  
			( "SGD_CENTRO"."TIP_CENTRO" = :li_tipo ) and  
         ( "SGD_CENTRO"."NRO_CENTRO" = :GI_NRO_PUESTO )    ;


//
//if sqlca.sqlcode <> 0 then
//		ii_centro_dep = gi_nro_centro
//		ii_cmd_dep = gi_nro_cmd
//		ii_puesto_dep = gi_nro_puesto
//end if
//
//IF sqlca.sqlcode <> 0 THEN
//	gnv_msg.f_mensaje("EG48","","",OK!)	
//	HALT CLOSE
//END IF

RETURN 1

end function

public subroutine fnu_centrar_ventana ();//////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fnu_centrar_ventana
//
// Objetivo: Centrar ventana de arranque del Sistema
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: --
//        Salida:   --
//
// Devuelve: --
//
// Fecha          	Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         	-----------             ---------
// 23/10			FDO			
//////////////////////////////////////////////////////////////////////////////

long tx,ty
environment le_env
	
getenvironment(le_env)

tx = pixelstounits(le_env.screenwidth,xpixelstounits!) / 2 - this.width /2
ty = pixelstounits(le_env.screenheight,ypixelstounits!)/ 2 - this.height / 2

this.y = ty
this.x = tx

end subroutine

public function integer fw_caducidadclave (string ps_fecharenovacion, ref long pl_ind_bloqueado, string ps_usuario);string	ls_fechaProximaRen		//Fecha de la pr$$HEX1$$f300$$ENDHEX$$xima renovaci$$HEX1$$f300$$ENDHEX$$n de la clave del usuario

//AHM 06/11/2009	Mejora (1/732525)
IF fg_verifica_parametro('CADUCIDAD DE LA CONTRASE$$HEX1$$d100$$ENDHEX$$A') THEN /*Comprueba si est$$HEX2$$e1002000$$ENDHEX$$activo la caducidad de la contrase$$HEX1$$f100$$ENDHEX$$a*/

	/*Obtenemos la fecha de la pr$$HEX1$$f300$$ENDHEX$$xima renovaci$$HEX1$$f300$$ENDHEX$$n*/
	SELECT MAX(valor)
	INTO :ls_fechaProximaRen
	FROM sgd_valor
	WHERE codif = 'F_CA'
	AND valor > :ps_fechaRenovacion
	AND valor <= to_char(sysdate, 'yyyymmdd');
	
	/*Comprobamos si se ha caducado la contrase$$HEX1$$f100$$ENDHEX$$a*/
	IF ps_fechaRenovacion < ls_fechaProximaRen THEN
		ii_numeroIntentos = pl_ind_bloqueado
		//Comprobamos que la renovaci$$HEX1$$f300$$ENDHEX$$n de la clave se ha intentado menos de 3 veces si no se bloquea al usuario		
		IF ii_numeroIntentos > 1 THEN
			IF ii_numeroPasadas = 0 THEN			//Comprueba que es la primera vez que entramos
				MessageBox ("Atenci$$HEX1$$f300$$ENDHEX$$n", "Clave caducada introduzca la clave nueva")
				ii_numeroPasadas = 1
				ib_renovacionCont = TRUE
				setredraw(FALSE)
				st_5.visible = FALSE
				d_usuario.visible=true
				cb_1.visible = TRUE
				cb_3.visible = TRUE
				st_7.visible = TRUE
				st_8.visible = TRUE
				sle_nuevaClave.visible = TRUE	
				d_usuario.enabled = FALSE
				sle_nuevaClave.setFocus()
				setredraw(TRUE)
				CLOSE(w_barra_standart)
				DISCONNECT;
				timer(0.08)
				RETURN 1
			ELSEIF ii_numeroPasadas = 1 THEN //Se introduce la clave la primera vez
				is_nuevaClave1 = sle_nuevaClave.text
				MessageBox ("Atenci$$HEX1$$f300$$ENDHEX$$n", "Introduzca de nuevo la clave nueva")
				ii_numeroPasadas = 2
				setredraw(FALSE)
				st_5.visible = FALSE
				d_usuario.visible=true
				cb_1.visible = TRUE
				cb_3.visible = TRUE
				st_7.visible = TRUE
				st_8.visible = TRUE
				sle_nuevaClave.visible = TRUE			
				sle_nuevaClave.setFocus()
				setredraw(TRUE)
				sle_nuevaClave.text = ""
				CLOSE(w_barra_standart)
				DISCONNECT;
				timer(0.08)
				RETURN 1
			ELSEIF ii_numeroPasadas	= 2 THEN //Se introduce la clave la segunda vez
				is_nuevaClave2 = sle_nuevaClave.text
				//Comprueba si se las dos claves introducidas son iguales
				IF (is_nuevaClave1 = is_nuevaClave2) AND ASC(is_nuevaClave1) > 0 THEN
					gu_perfiles.of_cifra_clave(is_nuevaClave1,is_nuevaClave2)
					
					UPDATE gi_usuario_sgi
					SET clave = :is_nuevaClave2,
					    f_ultima_renovacion = :ls_fechaProximaRen,
						 ind_bloqueado = 4
					WHERE usuario = :ps_usuario;
					
					
					COMMIT;
					
					st_5.visible = TRUE
					cb_1.visible = FALSE
					cb_3.visible = FALSE
					st_7.visible = FALSE
					st_8.visible = FALSE
					sle_nuevaClave.visible = FALSE
					w_barra_standart.visible = false
					
					MessageBox ("Atenci$$HEX1$$f300$$ENDHEX$$n", "La clave ha sido actualizada satisfactoriamente")
					 
					RETURN 0
					
				ELSE
					MessageBox ("Atenci$$HEX1$$f300$$ENDHEX$$n", "Las claves introducidas no coinciden")
					ii_numeroPasadas = 1
					setredraw(FALSE)
					st_5.visible = FALSE
					d_usuario.visible=true
					cb_1.visible = TRUE
					cb_3.visible = TRUE
					st_7.visible = TRUE
					st_8.visible = TRUE
					sle_nuevaClave.visible = TRUE			
					setredraw(TRUE)
					sle_nuevaClave.text = ""
					sle_nuevaClave.setFocus()
					ii_numeroIntentos = ii_numeroIntentos - 1
					IF ii_numeroIntentos = 1 THEN
						MessageBox ("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ya se han producido 3 intentos de renovaci$$HEX1$$f300$$ENDHEX$$n el usuario quedar$$HEX2$$e1002000$$ENDHEX$$bloqueado. Si desea desbloquearlo pongase en contacto con su soporte local")
			
						UPDATE gi_usuario_sgi
						SET ind_bloqueado = 1
						WHERE usuario = :ps_usuario;
						
						CLOSE(w_barra_standart)
						DISCONNECT;
						timer(0.08)
						
						RETURN -1
						
					ELSE
						pl_ind_bloqueado = pl_ind_bloqueado - 1
						
						UPDATE gi_usuario_sgi
						SET ind_bloqueado = :pl_ind_bloqueado
						WHERE usuario = :ps_usuario;
						
						COMMIT;
						
						setNull(is_nuevaClave1)
						setNull(is_nuevaClave2)
						setNull(sle_nuevaClave.text)
						CLOSE(w_barra_standart)
						DISCONNECT;
						timer(0.08)
						RETURN 1
					END IF
				END IF
			END IF				
		END IF
	END IF
END IF

RETURN 0
end function

event open;
int li_n, li_p 

fnu_centrar_ventana()

This.SetRedraw(False)

timer(0.08)

// Capturo los parametros pasados por la ventana OPEN SGD

string ls_argumentos, ls_usuario, ls_clave

ls_argumentos = CommandParm()

d_usuario.fnu_insertar_fila()

if ls_argumentos<>"" and  not isnull(ls_argumentos) then 
	li_n = Pos(ls_argumentos,"-n")
	li_p = pos(ls_argumentos,"-p")
	
	ls_usuario = trim(mid(ls_argumentos,li_n +2,(li_p  - (li_n + 2) )))
	ls_clave = trim(Mid(ls_argumentos,li_p +2))
	//messagebox("Aviso",ls_usuario+"/"+ls_clave)
	d_usuario.setitem(1,"ps_usuario",ls_usuario)
	d_usuario.setitem(1,"ps_clave",ls_clave)
	ib_sin_ventana = true
	This.SetRedraw(True)
   cb_1.TriggerEvent(Clicked!)
else  // SIN PARAMETROS
   this.visible = true
	This.SetRedraw(True)
	//Mejora 1/572035
//	ls_usuario=ProfileString("opensgi.ini", "database", "Usuario_Sgi", "")
	ulong l = 20
	GetUserNameA(ls_usuario, l)

	st_7.text=ProfileString("opensgi.ini", "database", "Database", "")
	d_usuario.setitem(1,"ps_usuario",upper(ls_usuario))
	IF ProfileString("opensgi.ini","EXPLICACION","Depurar","NO") = 'SI' THEN
		p_1.enabled = TRUE
	END IF
end if

//AHM (06/11/2009)
ii_numeroIntentos = 0		//Inicializaci$$HEX1$$f300$$ENDHEX$$n de la variable que indica el n$$HEX1$$fa00$$ENDHEX$$mero de intentos de renovaci$$HEX1$$f300$$ENDHEX$$n de la clave
ii_numeroPasadas = 0			//Inicializaci$$HEX1$$f300$$ENDHEX$$n de la variabla que indica el n$$HEX1$$fa00$$ENDHEX$$mero de veces que se ha pulsado la tecla clicked desde que se ha detectado que la clave se ha caducado, por intento
ib_renovacionCont = FALSE	//Inicializaci$$HEX1$$f300$$ENDHEX$$n del indicador de si es necesario renovar la contrase$$HEX1$$f100$$ENDHEX$$a
end event

on w_arranque_operaciones_new.create
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_3=create st_3
this.p_1=create p_1
this.p_uf=create p_uf
this.st_2=create st_2
this.cb_3=create cb_3
this.cb_1=create cb_1
this.st_1=create st_1
this.oval_1=create oval_1
this.st_5=create st_5
this.st_4=create st_4
this.d_usuario=create d_usuario
this.sle_nuevaclave=create sle_nuevaclave
this.Control[]={this.st_8,&
this.st_7,&
this.st_6,&
this.st_3,&
this.p_1,&
this.p_uf,&
this.st_2,&
this.cb_3,&
this.cb_1,&
this.st_1,&
this.oval_1,&
this.st_5,&
this.st_4,&
this.d_usuario,&
this.sle_nuevaclave}
end on

on w_arranque_operaciones_new.destroy
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_3)
destroy(this.p_1)
destroy(this.p_uf)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.oval_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.d_usuario)
destroy(this.sle_nuevaclave)
end on

event timer;	choose case i_vez
		case 1 
			 ib_subiendo=true
		case 2
			p_uf.picturename="ufw.bmp"
		case 3
			p_uf.picturename="ufv.bmp"
		case 4
			p_uf.picturename="uft.bmp"
		case 5
			p_uf.picturename="ufs.bmp"
		case 6
			p_uf.picturename="ufr.bmp"
		case 7
			p_uf.picturename="ufq.bmp"
		case 8
			p_uf.picturename="ufp.bmp"
		case 9
			p_uf.picturename="ufo.bmp"
		case 10
			p_uf.picturename="uf$$HEX1$$f100$$ENDHEX$$.bmp"
		case 11
			p_uf.picturename="ufn.bmp"
		case 12
			p_uf.picturename="ufm.bmp"	
		case 13
			p_uf.picturename="ufl.bmp"
		case 14
			p_uf.picturename="ufk.bmp"
		case 15
			p_uf.picturename="ufj.bmp"
		case 16
			p_uf.picturename="ufi.bmp"
		case 17
			p_uf.picturename="ufh.bmp"
		case 18
			p_uf.picturename="ufg.bmp"
		case 19
			p_uf.picturename="uff.bmp"
		case 20
			p_uf.picturename="ufe.bmp"
		case 21
			p_uf.picturename="ufd.bmp"
		case 22
			p_uf.picturename="ufc.bmp"
		case 23
			p_uf.picturename="ufb.bmp"
		case 24
			p_uf.picturename="ufab.bmp"
		case 25
			p_uf.picturename="ufa.bmp"
		CASE 26
  		  ib_subiendo=false
			timer(0.08)
	end choose
	
if ib_subiendo then	
	i_vez ++
else
	i_vez --
end if	

end event

type st_8 from statictext within w_arranque_operaciones_new
integer x = 224
integer y = 828
integer width = 494
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 8421376
string text = "Base de Datos:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_arranque_operaciones_new
integer x = 750
integer y = 828
integer width = 681
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 8421376
string text = "none"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_arranque_operaciones_new
integer x = 951
integer y = 464
integer width = 745
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
long textcolor = 8388608
long backcolor = 8421376
string text = "Versi$$HEX1$$f300$$ENDHEX$$n Unificada"
boolean focusrectangle = false
end type

type st_3 from statictext within w_arranque_operaciones_new
integer x = 1477
integer y = 316
integer width = 46
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "R"
alignment alignment = center!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type p_1 from picture within w_arranque_operaciones_new
integer x = 1531
integer y = 92
integer width = 206
integer height = 180
boolean enabled = false
string picturename = "logo_sgd_1.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_usuario
d_usuario.accepttext()
ls_usuario=d_usuario.getitemstring(1,"ps_usuario")
if not isnull(ls_usuario) and ls_usuario<>"" then
	d_usuario.setitem(1,"ps_clave",ls_usuario)
end if	
end event

type p_uf from picture within w_arranque_operaciones_new
integer x = 23
integer y = 20
integer width = 329
integer height = 288
boolean originalsize = true
string picturename = "ufw.bmp"
boolean focusrectangle = false
end type

type st_2 from statictext within w_arranque_operaciones_new
integer x = 279
integer y = 376
integer width = 1257
integer height = 88
integer textsize = -14
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean italic = true
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Sistema de Gesti$$HEX1$$f300$$ENDHEX$$n de Incidencias"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_3 from u_cb within w_arranque_operaciones_new
integer x = 1120
integer y = 944
integer width = 370
integer height = 100
integer taborder = 40
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Salir"
boolean cancel = true
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_1 from u_cb within w_arranque_operaciones_new
integer x = 421
integer y = 944
integer width = 370
integer height = 100
integer taborder = 30
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;
SetPointer(HourGlass!)
timer(0)
string ls_usuario,ls_usu,ls_nombre,ls_clave, ls_clave_introducida, ls_cifrada, ls_usuario_ini
string ls_fase
int li_per,li_indice,li_cont, li_nro_aviso
datetime ldt_fecha_expiracion, ldt_fecha_actual
long ll_ind_bloqueado

string ls_clave_sgd, ls_clave_sgi

string	ls_fechaRenovacion		//Fecha de la $$HEX1$$fa00$$ENDHEX$$ltima renovaci$$HEX1$$f300$$ENDHEX$$n de la clave del usuario
string	ls_fechaProximaRen		//Fecha de la pr$$HEX1$$f300$$ENDHEX$$xima renovaci$$HEX1$$f300$$ENDHEX$$n de la clave del usuario


ls_usuario_ini=ProfileString("opensgi.ini","database","usuario_sgi","SINUSUARIO")

SetNull(ldt_fecha_expiracion)
////////////////////
// Desde aqui hay que comentar
//
if ib_sin_ventana then
	li_veces = 3
else
	li_veces= li_veces + 1
end if

d_usuario.AcceptText()
ls_usuario = d_usuario.getitemstring(1,"ps_usuario")
ls_clave_introducida = d_usuario.getitemstring(1,"ps_clave")
//AHM 06/11/2009	Mejora (1/732525)
IF NOT(ib_renovacionCont) THEN
	st_5.visible = TRUE
	cb_1.visible = FALSE
	cb_3.visible = FALSE
	// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
	st_7.visible = FALSE
	st_8.visible = FALSE
END IF

// Abre la ventanita de la barra y la posiciona en pantalla
parent.setredraw(false)
open(w_barra_standart)

//AHM 06/11/2009	Mejora (1/732525)
IF ib_renovacionCont THEN w_barra_standart.visible = false

if ib_sin_ventana then w_barra_standart.visible = false

//***************************************
//**  OSGI 2001.1  	23/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Parent.ClassName() <> "w_arranque_operaciones_ext" Then
	w_barra_standart.x=270
	w_barra_standart.y=893
Else
	w_barra_standart.x=27
	w_barra_standart.y=1150
End If
//***************************************
//**  OSGI 2001.1  	23/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


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


//AHM 06/11/2009	Mejora (1/732525)
//Obtiene el centro, cmd, puesto del usuario y la fecha de la $$HEX1$$fa00$$ENDHEX$$ltima renovaci$$HEX1$$f300$$ENDHEX$$n de la clave

SELECT "GI_USUARIO_SGI"."USUARIO",   
       "GI_USUARIO_SGI"."NRO_CENTRO",   
       "GI_USUARIO_SGI"."NRO_CMD",   
       "GI_USUARIO_SGI"."NRO_MESA",   
       "GI_USUARIO_SGI"."NOM_USUARIO", 
		 GI_USUARIO_SGI.CLAVE, 
		 IND_BLOQUEADO, // DSA 07/06/2000	
		 to_char(f_ultima_renovacion, 'yyyymmdd')
INTO  
		:gs_usuario,
		:gi_nro_centro,
		:gi_nro_cmd,
		:gi_nro_puesto,
		:ls_nombre, :ls_clave_sgi,
		:ll_ind_bloqueado,
		:ls_fechaRenovacion
FROM "GI_USUARIO_SGI" 
WHERE "GI_USUARIO_SGI"."USUARIO" = :ls_usuario ;

//w_barra_standart.ole_barra.object.value = 4 //FDO

IF sqlca.sqlcode <> 0 THEN
//	messagebox("Aviso","Usuario inexistente")
gnv_msg.f_mensaje("EG26","","",OK!)
		d_usuario.visible=true
		st_5.visible = false
		cb_1.visible = true
		cb_3.visible = TRUE
		st_4.visible= false
		close(w_barra_standart)
		disconnect;
		timer(0.08)
		if ib_sin_ventana then halt close
		return
end if

//		
//if isnull(ls_clave) then
////	messagebox("Aviso","Usuario con clave nula")
//	gnv_msg.f_mensaje("EG52","","",OK!)		
//		d_usuario.visible=true
//		st_5.visible = false
//		cb_1.visible = true
//		cb_3.visible = TRUE
//		st_4.visible= false
//		close(w_barra_standart)
//		disconnect;
//		timer(0.08)
//		return
//end if
//
//
//
//
//


// COMPROBAMOS  LA CLAVE EN LA TABLA SGD


select clave_usuario into :ls_clave_sgd
from sgd_usuarios_generales where nombre_usuario = :ls_usuario and upper(permisos) like '%SGI%';

if sqlca.sqlcode <>0 then // NO EXISTE EL USUARIO EN LA TABLA

ls_clave = ls_clave_sgi

else

ls_clave = ls_clave_sgd

// comprobamos si son distintas

if ls_clave_sgi <> ls_clave_sgd then 
	update gi_usuario_sgi  set clave = :ls_clave_sgd where usuario = :ls_usuario;
	commit;
end if


end if

SetProfileString("opensgi.ini","database","usuario_sgi",ls_usuario)

//______DSA INI 07/06/2000			
if (ll_ind_bloqueado = 1) then
//	messagebox("Aviso","Acceso de este usuario esta bloqueado")
	gnv_msg.f_mensaje("EG49","","",OK!)		
	HALT CLOSE
end if
//______DSA FIN 07/06/2000			


gu_perfiles = create u_perfil

gu_perfiles.of_cifra_clave(ls_clave_introducida,ls_cifrada)


if ls_cifrada<>ls_clave  or isnull(ls_Clave) then // CLAVE DE USUARIO INCORRECTA
if ls_usuario<> ls_usuario_ini then li_veces=1
//	messagebox("Aviso","Clave Incorrecta")
gnv_msg.f_mensaje("EG27","","",OK!)	
	if li_veces=3 then 
		if not ib_sin_ventana then 
		//______DSA INI 07/06/2000			
			string ls_nom_ordenador
			long   nro_simbolos = 20
		
			ls_nom_ordenador = space(nro_simbolos)
			GetComputerNameA(ls_nom_ordenador, nro_simbolos)
			if Isnull(ls_nom_ordenador) then ls_nom_ordenador="Desconocido"
			UPDATE "GI_USUARIO_SGI" 
			SET   F_BLOQUEADO   = SYSDATE,
				IND_BLOQUEADO = 1,
				NOM_ORDENADOR = :ls_nom_ordenador				
			WHERE "GI_USUARIO_SGI"."USUARIO" = :ls_usuario;
			
			COMMIT;
		gnv_msg.f_mensaje("EG49","","",OK!)	
		end if 
		
		//______DSA FIN 07/06/2000			
		HALT CLOSE
	else
		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
		st_7.visible = TRUE
		st_8.visible = TRUE

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
		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
		st_7.visible = TRUE
		st_8.visible = TRUE

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
		// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
		st_7.visible = TRUE
		st_8.visible = TRUE

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

////AHM 10/11/2009	Mejora (1/732525)
CHOOSE CASE fw_caducidadClave(ls_fechaRenovacion, ll_ind_bloqueado, ls_usuario)
	CASE 1 
		RETURN
	CASE -1
		HALT CLOSE
END CHOOSE

gi_perfil=li_per
//w_barra_standart.ole_barra.object.value = 8 //FDO

fnu_o_datos_ubicacion()
gu_comunic.fnu_cargar_vector(w_shared,1,w_operaciones,"w_shared") 

//w_barra_standart.ole_barra.object.value = 12 //FDO

gu_perfiles.of_recupera_datos_perfil(gi_perfil)

		SELECT "VALOR"
		INTO :li_nro_aviso
		FROM "SGD_PARAMETROS"
		WHERE "COD_PARAMETRO" = 11 ;
		
		IF li_nro_aviso = 1 THEN
			gb_operaciones = TRUE
		ELSE
			gb_operaciones = FALSE
		END IF	


// Se obtiene de la BD el m$$HEX1$$ed00$$ENDHEX$$nimo nivel de tensi$$HEX1$$f300$$ENDHEX$$n con representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
SELECT "VALOR"
INTO :gi_tension_nivel_min
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 25;

IF SQLCA.SQLCode <> 0 THEN
	gnv_msg.f_mensaje("ER48","","",OK!)
	// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
	st_7.visible = TRUE
	st_8.visible = TRUE
	d_usuario.visible=true
	st_5.visible = false
	cb_1.visible = true
	cb_3.visible = TRUE
	st_4.visible= false
	close(w_barra_standart)
	disconnect;
	timer(0.08)
	return
END IF
// Se obtiene de la BD el m$$HEX1$$e100$$ENDHEX$$ximo nivel de tensi$$HEX1$$f300$$ENDHEX$$n con representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
SELECT "VALOR"
INTO :gi_tension_nivel_max
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 49;
IF SQLCA.SQLCode <> 0 THEN
	gnv_msg.f_mensaje("ER48","","",OK!)	
	// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
	st_7.visible = TRUE
	st_8.visible = TRUE
	d_usuario.visible=true
	st_5.visible = false
	cb_1.visible = true
	cb_3.visible = TRUE
	st_4.visible= false
	close(w_barra_standart)
	disconnect;
	timer(0.08)
	return
END IF

// Se obtiene de la BD si hay interfaz con SCADA
SELECT "VALOR"
INTO :li_nro_aviso
FROM "SGD_PARAMETROS"
WHERE "COD_PARAMETRO" = 48 ;
		

IF SQLCA.SQLCode <> 0 THEN
	gnv_msg.f_mensaje("ER48","","",OK!)
	// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
	st_7.visible = TRUE
	st_8.visible = TRUE
	d_usuario.visible=true
	st_5.visible = false
	cb_1.visible = true
	cb_3.visible = TRUE
	st_4.visible= false
	close(w_barra_standart)
	disconnect;
	timer(0.08)
	return
ELSE
	IF li_nro_aviso = 1 THEN
		gb_scada = TRUE
	ELSE
		gb_scada = FALSE
	END IF	
END IF

SELECT "VALOR"
INTO :li_nro_aviso
FROM "GI_PARAMETROS"
WHERE "COD_PARAMETRO" = 1;

SELECT "VALOR"
INTO :GI_PAIS
FROM "GI_PARAMETROS"
WHERE "COD_PARAMETRO" = 78;

IF SQLCA.SQLCode <> 0 THEN
	GI_PAIS = 0
END IF

SELECT DESCRIPCION
INTO :ls_fase
FROM SGD_VALOR 
WHERE CODIF = 'FASE'
		AND VALOR = '111';
		
IF SQLCA.SQLCode <> 0 THEN
	ls_fase = "ABC"
END IF
gs_fase_a = Mid(ls_fase, 1, 1)
gs_fase_b = Mid(ls_fase, 2, 1)
gs_fase_c = Mid(ls_fase, 3, 1)

IF SQLCA.SQLCode <> 0 THEN
	gnv_msg.f_mensaje("ER48","","",OK!)
	// A$$HEX1$$f100$$ENDHEX$$adido por RCA (27-03-2008)
st_7.visible = TRUE
st_8.visible = TRUE
	d_usuario.visible=true
	st_5.visible = false
	cb_1.visible = true
	cb_3.visible = TRUE
	st_4.visible= false
	close(w_barra_standart)
	disconnect;
	timer(0.08)
	return
ELSE
	IF li_nro_aviso = 1 THEN
		gb_red_trifasica = TRUE
	ELSE
		gb_red_trifasica = FALSE
	END IF	
END IF

Open(w_operaciones)

Close(PARENT)



end event

type st_1 from statictext within w_arranque_operaciones_new
integer x = 347
integer y = 188
integer width = 1102
integer height = 204
integer textsize = -36
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean italic = true
long textcolor = 8388608
long backcolor = 8421376
string text = "OPEN SGI"
alignment alignment = center!
boolean focusrectangle = false
end type

type oval_1 from oval within w_arranque_operaciones_new
long linecolor = 8388608
integer linethickness = 8
long fillcolor = 8421376
integer x = 1458
integer y = 304
integer width = 78
integer height = 72
end type

type st_5 from statictext within w_arranque_operaciones_new
boolean visible = false
integer x = 302
integer y = 568
integer width = 1198
integer height = 252
integer textsize = -18
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Verificando clave de acceso"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_arranque_operaciones_new
boolean visible = false
integer x = 302
integer y = 568
integer width = 1198
integer height = 252
integer textsize = -18
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 8388608
long backcolor = 8421376
boolean enabled = false
string text = "Conect$$HEX1$$e100$$ENDHEX$$ndose a la Base de Datos "
alignment alignment = center!
boolean focusrectangle = false
end type

type d_usuario from u_gen_2001_pr_ingreso_usuario within w_arranque_operaciones_new
integer x = 402
integer y = 540
integer width = 992
integer height = 280
integer taborder = 10
boolean bringtotop = true
boolean border = false
end type

type sle_nuevaclave from singlelineedit within w_arranque_operaciones_new
boolean visible = false
integer x = 1294
integer y = 688
integer width = 494
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 8421376
boolean password = true
borderstyle borderstyle = stylelowered!
end type


HA$PBExportHeader$w_cambio_clave.srw
forward
global type w_cambio_clave from w_sgigenerica
end type
type dw_clave from datawindow within w_cambio_clave
end type
type cb_2 from commandbutton within w_cambio_clave
end type
type cb_1 from commandbutton within w_cambio_clave
end type
type gb_clave from groupbox within w_cambio_clave
end type
end forward

global type w_cambio_clave from w_sgigenerica
int X=1134
int Y=776
int Width=1381
int Height=828
WindowType WindowType=response!
boolean TitleBar=true
string Title="Cambio de Claves de Usuario"
long BackColor=79741120
string Icon="clave.ico"
dw_clave dw_clave
cb_2 cb_2
cb_1 cb_1
gb_clave gb_clave
end type
global w_cambio_clave w_cambio_clave

type variables
string is_usuario

end variables

event open;call super::open;int li_contador

// COMPROBAMOS SI SE PUEDE O NO CAMBIAR LA CLAVE (USUARIO SGD)


//select count(*) into :li_contador from sgd_usuarios_generales where nombre_usuario = :gs_usuario and upper(permisos) like '%SGI%' using sqlcpropio;

//if li_contador > 0 then // ES USUARIO SGD NO PUEDE CAMBIAR LA PASSWORD
//	messagebox("Aviso", "El cambio de clave de este usuario solo se realizar desde la ventana de acceso conjunto",Information!)
//	close(this)
//	return
//end if

// COMPROBAMOS EL BLOQUEO DEL REGISTRO

dw_clave.settransobject(sqlca)


dw_clave.retrieve(gs_usuario)
dw_clave.object.clave[1] = ""

is_usuario= dw_clave.object.usuario[1]

gb_clave.text=gb_clave.text + " " + gs_usuario

dw_clave.setfocus()
end event

on w_cambio_clave.create
int iCurrent
call super::create
this.dw_clave=create dw_clave
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_clave=create gb_clave
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_clave
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.gb_clave
end on

on w_cambio_clave.destroy
call super::destroy
destroy(this.dw_clave)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_clave)
end on

type dw_clave from datawindow within w_cambio_clave
int X=101
int Y=168
int Width=1189
int Height=288
int TabOrder=10
string DataObject="d_cambio_clave"
boolean Border=false
boolean LiveScroll=true
end type

event itemfocuschanged;if  this.getcolumn()=2 then
	dw_clave.object.clave_t.color='0'
	dw_clave.object.clave2_t.color=rgb(128,128,128)
else
	dw_clave.object.clave_t.color=rgb(128,128,128)
	dw_clave.object.clave2_t.color='0'

end if
end event

type cb_2 from commandbutton within w_cambio_clave
int X=745
int Y=576
int Width=288
int Height=108
int TabOrder=30
string Text="Cancelar"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_cambio_clave
int X=329
int Y=576
int Width=288
int Height=108
int TabOrder=20
string Text="Aceptar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: clicked
//
// Objetivo: Evaluar si el cambio de clave ha sido correcto
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 09/06/2000	    FDO
//		
///////////////////////////////////////////////////////////

string ls_clave,ls_clave_cifrada

dw_clave.accepttext()

ls_clave= dw_clave.object.clave[1]

if ls_clave<>"" and not isnull(RightTrim(ls_clave)) then

	if ls_clave = dw_clave.object.clave2[1] then
		
		gu_perfiles.of_cifra_clave(ls_clave,ls_clave_cifrada)
		dw_clave.object.clave[1] = ls_clave_cifrada
		
		if dw_clave.update() = 1 then
			update sgd_usuarios_generales 
			set clave_usuario = :ls_clave_cifrada
			where nombre_usuario = :gs_usuario and upper(permisos) like '%SGI%';
			
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La clave fue cambiada con $$HEX1$$e900$$ENDHEX$$xito.")
			gnu_u_transaction.uf_commit()
			close(parent)
		end if
						
	else

		messagebox("Atencion","Las claves especificadas no coinciden.")
		dw_clave.object.clave[1]=""
		dw_clave.object.clave2[1]=""
		dw_clave.setfocus()
		dw_clave.SetColumn("clave")
	end if
else
	
	messagebox("Atencion","Debe especificar una clave.")
	dw_clave.object.clave[1]=""
	dw_clave.object.clave2[1]=""
	dw_clave.setfocus()
end if
end event

type gb_clave from groupbox within w_cambio_clave
int X=46
int Y=68
int Width=1289
int Height=448
int TabOrder=10
string Text="Usuario: "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


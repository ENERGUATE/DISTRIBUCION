HA$PBExportHeader$w_sgigenerica.srw
forward
global type w_sgigenerica from window
end type
type st_bloqueo from statictext within w_sgigenerica
end type
end forward

global type w_sgigenerica from window
integer width = 2930
integer height = 1472
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 81324524
event ue_arch_eliminar pbm_custom02
event ue_arch_grabar pbm_custom03
event ue_arch_imprimir pbm_custom04
event ue_arch_agregar pbm_custom01
event ue_opcion1 pbm_custom05
event ue_opcion2 pbm_custom06
event ue_opcion3 pbm_custom07
event ue_opcion4 pbm_custom08
event tomar_foco pbm_custom75
event prueba pbm_windowposchanging
event ue_postopen pbm_custom10
event type integer ue_preclose ( )
st_bloqueo st_bloqueo
end type
global w_sgigenerica w_sgigenerica

type prototypes
Function int MessageBox( long hwndOwner,string  lpszText,string lpszTitle,long fuStyle)  alias for "MessageBoxA;Ansi"  Library "user32.dll";

Function BOOLEAN Beep(long dwFreq, long dwDuration) Library "kernel32.dll"
end prototypes

type variables
boolean mensaje
STRING IS_RESPONSE_ACTIVA
STRING IS_RESPONSE_ACTIVA_ANTE

// - Common return value constants:
constant integer 		SUCCESS = 0
constant integer 		FAILURE = -1

Constant Integer	CHOICE_YES 		= 1
Constant Integer	CHOICE_NO 		= 2
Constant Integer	CHOICE_CANCEL                   = 3

Constant Integer	RESULT_TRUE 		=  1
Constant Integer	RESULT_FALSE 		=  0
Constant Integer	RESULT_ERROR                   = -1



Protected:
boolean			ib_isupdateable = TRUE
boolean			ib_disableclosequery = TRUE
boolean			ib_closestatus
boolean			ib_savestatus
string                                        is_programa
end variables

forward prototypes
public function integer fnu_cargar_vector ()
end prototypes

event tomar_foco;///////////////////////////////////////////////////////////////////////
//
//	Event:	tomar_foco for sgigenerica
//
///////////////////////////////////////////////////////////////////////

this.setfocus()

end event

event ue_preclose;RETURN 1
end event

public function integer fnu_cargar_vector ();gu_comunic.is_control[gi_ultima_posicion].ventana_a_abrir_puntero = handle(this) 
gu_comunic.is_control[gi_ultima_posicion].ventana_a_abrir = this
this.x=1
this.y=280
return 1
end function

on w_sgigenerica.create
this.st_bloqueo=create st_bloqueo
this.Control[]={this.st_bloqueo}
end on

on w_sgigenerica.destroy
destroy(this.st_bloqueo)
end on

event closequery;/////////////////////////////////////////////////////////////////////////
//	14/06/99			DSA		Agua modificaciones
/////////////////////////////////////////////////////////////////////////

Constant Integer	ALLOW_CLOSE = 0
Constant Integer	PREVENT_CLOSE = 1

int ll_choice, ll_ret



	// Check if the CloseQuery process has been disabled
	If ib_disableclosequery Then
		Return ALLOW_CLOSE
	End If


	// Prevent validation error messages from appearing while the window is closing
	// and allow others to check if the  CloseQuery process is in progress
	ib_closestatus = True
	
	
	ll_choice = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 
	
	IF ll_choice = CHOICE_YES THEN
				IF This.Event ue_arch_grabar (0,0) <> FAILURE	THEN
								ib_closestatus = False
								Return ALLOW_CLOSE
				END IF				
	ELSEIF ll_choice = CHOICE_NO then
				ib_closestatus = False
				RETURN ALLOW_CLOSE
	END IF

	ib_closestatus = False
	Return PREVENT_CLOSE
end event

event open;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: Open
//
// Objetivo: Colocaci$$HEX1$$f300$$ENDHEX$$n de Ventanas hijas
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
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 
// 03/06/2002	  LFE-FDO
//		
/////////////////////////////////////////////////////////// 

long px,py,pw,ph
long tx,ty
environment le_env

IF (This.WindowType <> Main!  and This.WindowType <> MDI!) and isvalid(w_genapp_frame) then

//	px = w_operaciones.x
//	py = w_operaciones.y
//	pw = w_operaciones.width
//	ph = w_operaciones.height

	px = w_genapp_frame.x
	py = w_genapp_frame.y
	pw = w_genapp_frame.width
	ph = w_genapp_frame.height
		
	getenvironment(le_env)
	
	if pw > this.width then
		tx =px +  (pw - this.width) / 2
	else
		tx =px - ( this.width - pw) / 2
	end if
	
	if ph > this.height then
		ty =py + (ph - this.height) / 2
	else
		ty =py - ( this.height - ph) / 2
	end if
	
	if unitstopixels(tx + this.width,Xunitstopixels!) > le_env.screenwidth then
		tx = pixelstounits(le_env.screenwidth,xpixelstounits!) - this.width
	end if
	
	if unitstopixels(ty + this.height,yunitstopixels!) > le_env.screenheight then
		ty = pixelstounits(le_env.screenheight,ypixelstounits!) - this.height
	end if

	
	if unitstopixels(tx,Xunitstopixels!) < 0 then
		tx = 0
	end if

	this.y = ty
	this.x = tx

End if

//messagebox(long(Handle(w_operaciones)) ,"PEPE","JUAN",2)
end event

type st_bloqueo from statictext within w_sgigenerica
boolean visible = false
integer x = 631
integer y = 432
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "bloqueo"
boolean focusrectangle = false
end type


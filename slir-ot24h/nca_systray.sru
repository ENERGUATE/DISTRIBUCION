HA$PBExportHeader$nca_systray.sru
$PBExportComments$Systray Utilities V2.0
forward
global type nca_systray from nonvisualobject
end type
end forward

type notifyicondata from structure
	long		cbsize
	long		hwnd
	long		uid
	long		uflags
	long		ucallbackmessage
	long		hicon
	character		sztip[ 64 ]
end type

global type nca_systray from nonvisualobject
end type
global nca_systray nca_systray

type prototypes
function long Shell_NotifyIcon ( long dwMessage, ref notifyicondata lpData ) library "shell32" alias for "Shell_NotifyIcon;Ansi"
function long LoadImageA ( long hInstance, string lpszName, long uType, long a, long  b, long  l ) library "user32" alias for "LoadImageA;Ansi"
function long LoadIconA( long hInstance, long lpcstr ) library "user32"
end prototypes

type variables
Private:
notifyicondata istr_lpdata
long il_semaforo_verde, il_semaforo_rojo

Protected:
window iw_win
boolean ib_SystemTrayExists

CONSTANT long NIF_MESSAGE=1
CONSTANT long NIF_ICON=2
CONSTANT long NIF_TIP=4

CONSTANT long NIM_ADD=0
CONSTANT long NIM_MODIFY=1
CONSTANT long NIM_DELETE=2
public:
int ii_id_icono

end variables

forward prototypes
public subroutine addicon (string as_iconname, string as_tiptext, window aw_win)
public subroutine delicon ()
public subroutine changeicon (string as_iconname)
public subroutine changetip (string as_tiptext)
public function boolean ib_systemtrayexists ()
public subroutine of_identificativo_icono (integer pi_identificador)
end prototypes

public subroutine addicon (string as_iconname, string as_tiptext, window aw_win);///////////////////////////////////////////////////////
// Funcion/Evento: addicon
// 
// Objetivo:  funcion utilizada para cargar los datos del icono
// Responsable: JHC
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: as_iconname string
//					as_tiptext	string
//					aw_win		windows
//    Salida : --
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 26/10/2000   	JHC
//
///////////////////////////////////////////////////////


IF ib_SystemTrayExists THEN RETURN

iw_Win = aw_Win
istr_lpData.szTip = as_TipText + Char ( 0 )
istr_lpData.uFlags = NIF_ICON + NIF_TIP + NIF_MESSAGE
istr_lpData.uID = 100 + ii_id_icono
istr_lpData.cbSize = 88
istr_lpData.hwnd = Handle ( iw_Win )
istr_lpData.uCallbackMessage = 1023 + ii_id_icono
if as_iconname="semafv.ico" then 
	istr_lpData.hIcon = il_semaforo_verde
else
	istr_lpData.hIcon = il_semaforo_rojo
end if



shell_notifyicon ( NIM_ADD, istr_lpData )

ib_SystemTrayExists = TRUE
end subroutine

public subroutine delicon ();///////////////////////////////////////////////////////
// Funcion/Evento: delicon
// 
// Objetivo:  funcion utilizada para borrar el icono de la barra
// Responsable: JHC
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//    Salida : --
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 26/10/2000   	JHC
//
///////////////////////////////////////////////////////


IF NOT ib_SystemTrayExists THEN RETURN

istr_lpData.uID = 100 + ii_id_icono
istr_lpData.cbSize = 88
istr_lpData.hwnd = Handle ( iw_Win )

shell_notifyicon ( NIM_DELETE, istr_lpData )

ib_SystemTrayExists = FALSE

end subroutine

public subroutine changeicon (string as_iconname);///////////////////////////////////////////////////////
// Funcion/Evento: changeicon
// 
// Objetivo:  funcion utilizada para cambiar el icono
// Responsable: JHC
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: as_iconname string
//    Salida : --
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 26/10/2000   	JHC
//
///////////////////////////////////////////////////////

IF NOT ib_SystemTrayExists THEN RETURN

if as_iconname="semafv.ico" then 
	istr_lpData.hIcon = il_semaforo_verde
else
	istr_lpData.hIcon = il_semaforo_rojo
end if

istr_lpData.uFlags = NIF_ICON

shell_notifyicon( NIM_MODIFY, istr_lpData )


end subroutine

public subroutine changetip (string as_tiptext);///////////////////////////////////////////////////////
// Funcion/Evento: changetip
// 
// Objetivo:  funcion utilizada para cambiar el tipo de texto del icono
// Responsable: JHC
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: as_tiptext string
//    Salida : --
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 26/10/2000   	JHC
//
///////////////////////////////////////////////////////

IF NOT ib_SystemTrayExists THEN RETURN

istr_lpData.szTip = as_TipText + Char ( 0 )
istr_lpData.uFlags = NIF_TIP

shell_notifyicon ( NIM_MODIFY, istr_lpData )

end subroutine

public function boolean ib_systemtrayexists ();///////////////////////////////////////////////////////
// Funcion/Evento: ib_systemtrayexists
// 
// Objetivo:  funci$$HEX1$$f300$$ENDHEX$$n utilizada para devolver el valor de si
//					existe ya el icono o no
// Responsable: JHC
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//    Salida : --
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 26/10/2000   	JHC
//
///////////////////////////////////////////////////////


RETURN ib_systemtrayexists
end function

public subroutine of_identificativo_icono (integer pi_identificador);ii_id_icono = pi_identificador
end subroutine

on nca_systray.create
TriggerEvent( this, "constructor" )
end on

on nca_systray.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;IF ib_SystemTrayExists THEN this.DelIcon()
end event

event constructor;il_semaforo_verde = LoadImageA( 0, "semafv.ico", 1, 0, 0, 80 )
il_semaforo_rojo = LoadImageA( 0, "semafr.ico", 1, 0, 0, 80 )
end event


HA$PBExportHeader$w_lista_alarma.srw
forward
global type w_lista_alarma from window
end type
type dw_lista from u_bdg_lista_alarmas within w_lista_alarma
end type
end forward

global type w_lista_alarma from window
integer x = 1134
integer y = 524
integer width = 1394
integer height = 1348
boolean titlebar = true
string title = "Gesti$$HEX1$$f300$$ENDHEX$$n de Alarmas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "alarma.ico"
dw_lista dw_lista
end type
global w_lista_alarma w_lista_alarma

type variables
long filaselecc
Boolean ib_sin_acc_mant_alar  //**  OSGI 2001.1  07/07/2001
end variables

on w_lista_alarma.create
this.dw_lista=create dw_lista
this.Control[]={this.dw_lista}
end on

on w_lista_alarma.destroy
destroy(this.dw_lista)
end on

event open;// Leemos los indicadores de alarmas para cada ventana

SetPointer(HourGlass!)

This.setRedraw(False)
dw_lista.SetTransObject(SQLCA)

dw_lista.of_obtener_datos()
This.setRedraw(True)

if filaselecc > 0 then
	dw_lista.SelectRow(0,False)
	dw_lista.SelectRow(filaselecc,True)
end if


//***************************************
//**  OSGI 2001.1  	07/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
IF gu_perfiles.of_acceso_perfil(gi_perfil, 'MANT_ALARMAS',"SIN_ACCESO") = 1 THEN
	ib_sin_acc_mant_alar = True
END IF
//***************************************
//**  OSGI 2001.1  	07/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event resize;IF this.windowstate=maximized! THEN
	this.windowstate=normal!
END IF

//IF this.windowstate=normal! THEN
//	this.width = 1125
//	this.height = 1470
//END IF
end event

type dw_lista from u_bdg_lista_alarmas within w_lista_alarma
integer x = 23
integer y = 4
integer width = 1344
integer height = 1348
end type

event doubleclicked;call super::doubleclicked;string ls_codigo

this.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila

FilaSelecc = row

IF Filaselecc >0 THEN
	this.SelectRow(FilaSelecc, TRUE)		// Se selecciona la fila nueva
	ls_codigo = string(this.GetITemNumber(filaselecc,"codigo"))

	//***************************************
	//**  OSGI 2001.1  	07/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	If ib_sin_acc_mant_alar Then Return
	//***************************************
	//**  OSGI 2001.1  	07/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

	OpenWithParm(w_mant_alarmas,ls_codigo)
END IF
end event


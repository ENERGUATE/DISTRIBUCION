HA$PBExportHeader$u_ord_0000_generico_ordenes.sru
forward
global type u_ord_0000_generico_ordenes from datawindow
end type
end forward

global type u_ord_0000_generico_ordenes from datawindow
int Width=2117
int Height=357
int TabOrder=1
boolean LiveScroll=true
event ue_shiftclicked pbm_custom70
event ue_ctrlclicked pbm_custom71
event ue_soltar_clicked pbm_dwnlbuttonup
event ue_pasar_borde pbm_dwnmousemove
end type
global u_ord_0000_generico_ordenes u_ord_0000_generico_ordenes

type variables
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row

string is_nomcab
int ii_orden
string is_nomcab_borde
end variables

forward prototypes
public subroutine f_seleccionar (integer pi_cant_filas)
public subroutine f_tabla_error (integer pi_tabla)
end prototypes

event ue_shiftclicked;//////////////////////////////////////////////////////////////////////
//
//	Evento:		ShiftClicked
//
//	Objetivo:	Este evento es triggeado por el RowFocusChanged
//					(si la dw permite seleccionar m$$HEX1$$e100$$ENDHEX$$s de una fila)
//					cuando el Shift es pulsado al mismo tiempo que el click
//					del rat$$HEX1$$f300$$ENDHEX$$n
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

int oldrow, newrow, i

oldrow = ii_selected_row
newrow = Getrow()

IF oldrow = 0 THEN oldrow =  newrow 

IF oldrow > newrow THEN
	FOR i = oldrow to newrow STEP -1
		this.SelectRow(i,true)
	NEXT
ELSE
	FOR i = oldrow to newrow
		this.SelectRow(i,true)
	NEXT
END IF


this.SetRow(newrow)
this.SetColumn(1)

end event

event ue_ctrlclicked;/////////////////////////////////////////////////////////////////////////
//
//	Evento:		CtrlClicked
//
//	Objetivo:	Este evento es triggeado por el RowFocusChanged
//					(si la dw permite seleccionar m$$HEX1$$e100$$ENDHEX$$s de una fila)
//					cuando el Ctrl es pulsado al mismo tiempo que el click
//					del rat$$HEX1$$f300$$ENDHEX$$n
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
/////////////////////////////////////////////////////////////////////////

int newrow

newrow=GetRow()

IF this.IsSelected(newrow) THEN
	this.SelectRow(newrow,False)
ELSE
	this.SelectRow(newrow,True)
END IF 

this.SetRow(newrow)
this.SetColumn(1)


end event

event ue_soltar_clicked;string ls_sint
ls_sint=is_nomcab_borde + ".Border='6'"
this.Modify(ls_sint)
end event

event ue_pasar_borde;string ls_cab
if dwo.name= "datawindow" then return 0
if isvalid(dwo) or not isnull(dwo) then
	ls_cab=string(dwo.band)
	if ls_cab = "header" then
		dwo.pointer="mano.cur"
	end if
end if
end event

public subroutine f_seleccionar (integer pi_cant_filas);//////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_seleccionar
//
//	Objetivo:	Indica la cantidad de filas que va a estar permitido
//					seleccionar.
//					Setea el valor de la variable ii_filas_selec donde se 
//					indica este hecho. 
//						0: no se seleccionar$$HEX1$$e100$$ENDHEX$$
//						1: una sola fila
//						2: una o m$$HEX1$$e100$$ENDHEX$$s filas
//					Por defecto, no permite seleccionar filas
//
//	Ambito:		P$$HEX1$$fa00$$ENDHEX$$blica
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pi_cant_filas
//					Salida:
//							
//	Devuelve:	Nada
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

integer	i_lim_sup = 2
integer	i_lim_inf = 0

IF IsNull(pi_cant_filas) OR (pi_cant_filas < i_lim_inf) OR &
			(pi_cant_filas > i_lim_sup) THEN
	ii_filas_selec = 0
ELSE
	ii_filas_selec = pi_cant_filas
END IF

RETURN

end subroutine

public subroutine f_tabla_error (integer pi_tabla);//////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_tabla_error
//
//	Objetivo:	Indica el n$$HEX1$$fa00$$ENDHEX$$mero de tabla de la que se deber$$HEX2$$e1002000$$ENDHEX$$desplegar su 
//					nombre en caso de producirse un error al grabar.
//
//	Ambito:		P$$HEX1$$fa00$$ENDHEX$$blica
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	ps_tabla
//					Salida:
//							
//	Devuelve:	Nada
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////


ii_tabla = pi_tabla

RETURN

end subroutine

on rowfocuschanged;////////////////////////////////////////////////////////////////////////
////
////	Evento:		RowFocusChanged
////
////	Objetivo:	Selecciona la fila que tiene el foco
////
////	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
////
////				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
////				-------------			--------			-----------
////				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
////
////////////////////////////////////////////////////////////////////////
//
//ii_selected_row = This.GetRow()
//
//IF ii_Selected_row > 0 THEN
//	CHOOSE CASE ii_filas_selec
//		CASE 1
//	 		This.SelectRow(0, FALSE)
//	 		This.SelectRow(This.GetRow(), TRUE)
//		CASE 2
//			IF keydown(keycontrol!) THEN      //Check if control key is pressed
//				This.TriggerEvent ("ue_ctrlclicked")
//			ELSEIF keydown(keyshift!) THEN	         
//				this.selectrow(0,false)			
//				This.TriggerEvent ("ue_shiftclicked")
//			ELSE
//				This.SelectRow(0, FALSE)
//				This.SelectRow(This.GetRow(), TRUE)
//			END IF
//	END CHOOSE
//END IF
//
//
//
//		
//
//
end on

event clicked;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Clicked
//
//	Objetivo:	Selecciona la fila clickeada 
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

int ii_rownum

ii_rownum = row

IF ii_rownum > 0 THEN
	CHOOSE CASE ii_filas_selec
		CASE 1
			This.SelectRow(0, FALSE)
			This.SelectRow(row, TRUE)
		CASE 2
			IF keydown(keycontrol!) THEN      //Check if control key is pressed
				This.TriggerEvent ("ue_ctrlclicked")
			ELSEIF keydown(keyshift!) THEN	         
				this.selectrow(0,false)			
				This.TriggerEvent ("ue_shiftclicked")
			ELSE
				This.SelectRow(0, FALSE)
				This.SelectRow(ii_rownum,TRUE)
			END IF
	END CHOOSE
END IF

ii_Selected_row = ii_rownum

string ls_nomcab
string ls_nomcol
string ls_tipo= " A"
string ls_sint
string ls_cab
if dwo.name= "datawindow" then return 0
if isvalid(dwo) or not isnull(dwo) then
	ls_cab=string(dwo.band)
	if ls_cab = "header" then	
		ls_nomcab=dwo.name
		ls_sint=ls_nomcab + ".Border='5'"
		this.Modify(ls_sint)
		is_nomcab_borde = ls_nomcab
		ls_nomcol=left(ls_nomcab,Pos(ls_nomcab,"_t",1) - 1)
		if is_nomcab = ls_nomcab and ii_orden=1 then
			ii_orden=2
			ls_tipo= " D"
			this.SetSort(ls_nomcol + ls_tipo)
		elseif is_nomcab = ls_nomcab and ii_orden=2 then
			ii_orden=1
			ls_tipo= " A"
			this.SetSort(ls_nomcol + ls_tipo)
		elseif is_nomcab <> ls_nomcab then
			ii_orden=1
			ls_tipo = " A"
			this.SetSort(ls_nomcol + ls_tipo)
	//		messagebox("1","nomcab=" + ls_nomcab + "nomcol=" + ls_nomcol + "tipo" + ls_tipo )
			is_nomcab=ls_nomcab
		end if
		this.sort()
	end if
end if
	


end event

on constructor;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Constructor
//
//	Objetivo:	Si se permite posocionar en una fila para modificaci$$HEX1$$f300$$ENDHEX$$n,
//					se indica con la mano a la izquierda de la dw
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////





end on

event dberror;//////////////////////////////////////////////////////////////////////
//
//	Evento:		DBerror
//
//	Objetivo:	Si hubo error al grabar la datawindow, se despliega un 
//					mensaje al usuario indicando en que tabla fue.
//					La tabla se setea a trav$$HEX1$$e900$$ENDHEX$$s de la funci$$HEX1$$f300$$ENDHEX$$n f_tabla_error(nro)
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					28/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

SQLCA.SQLCode = -1 
SQLCA.SQLDbCode = sqldbcode
SQLCA.SQLErrText = sqlerrtext
//gnv_msg.f_error(ii_tabla)

RETURN(1)
end event

on itemerror;//////////////////////////////////////////////////////////////////////
//
//	Evento:		Itemerror
//
//	Objetivo:	Si el dato ingresado no es correcto, despliega un mensaje
//					indic$$HEX1$$e100$$ENDHEX$$ndolo, y deja en el campo modioficado el valor 
//					anterior
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					27/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

string	ls_texto, ls_columna, ls_modstring, a

ls_texto = This.GetText()
ls_columna = This.GetColumnName()

This.Describe(This.GetColumnName()+".ValidationMsg")

ls_modstring = ls_columna + ".ValidationMsg='El item " + ls_texto &
					+ " no ha pasado las validaciones'"
a = This.Modify(ls_modstring)


end on


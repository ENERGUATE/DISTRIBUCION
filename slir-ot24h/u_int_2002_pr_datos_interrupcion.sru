HA$PBExportHeader$u_int_2002_pr_datos_interrupcion.sru
forward
global type u_int_2002_pr_datos_interrupcion from datawindow
end type
end forward

global type u_int_2002_pr_datos_interrupcion from datawindow
int Width=1271
int Height=1133
int TabOrder=1
string DataObject="d_int_2002_datos_interrupcion"
boolean LiveScroll=true
event ue_shiftclicked pbm_custom70
event ue_ctrlclicked pbm_custom71
end type
global u_int_2002_pr_datos_interrupcion u_int_2002_pr_datos_interrupcion

type variables
int ii_filas_selec
int ii_selected_row
end variables

forward prototypes
public function integer fnu_insertar_fila ()
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

int oldrow,newrow,i

oldrow = ii_selected_row
newrow = this.GetRow()

IF oldrow = 0 THEN oldrow = newrow 

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

public function integer fnu_insertar_fila ();return this.insertRow(1)
end function

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

//int ii_rownum
//ii_rownum = row

IF row > 0 THEN
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
				This.SelectRow(row,TRUE)
			END IF
	END CHOOSE
END IF

ii_Selected_row = row

	


end event

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

Return 1
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


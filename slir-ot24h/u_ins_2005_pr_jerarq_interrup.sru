HA$PBExportHeader$u_ins_2005_pr_jerarq_interrup.sru
forward
global type u_ins_2005_pr_jerarq_interrup from datawindow
end type
end forward

global type u_ins_2005_pr_jerarq_interrup from datawindow
int Width=1399
int Height=1129
string DragIcon="Application!"
string DataObject="d_ins_2005_jerarq_interrup"
boolean VScrollBar=true
end type
global u_ins_2005_pr_jerarq_interrup u_ins_2005_pr_jerarq_interrup

type prototypes

end prototypes

type variables
int ii_visible                     // campo que guarda "visible" segun la accion a realizar
int ii_expandido               //campo que guarda "expandido"
string is_filtro_visible = "visible = 1"   //filtro para visualizar los  niveles
string is_accion               //guarda el evento del objeto e_apertura o e_cierre
string is_filtro_secundario //filtro introducido por el usuario

decimal{0} il_nro_instal, il_nro_instal_padre
int ii_co_nivel_orig, ii_cant_av, ii_cant_av_pel 
int ii_cant_cli_imp, ii_co_nivel_actual
long  il_nro_ot

// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row

// Cantidad de filas con todas las instalaciones abiertas
long il_cant_filas

Protected:
int  ii_clicked_row = 0       //fila sobre la que actuamos
long  il_rownum 

end variables

forward prototypes
public subroutine uf_setear_clicked_row (integer p_fila)
public subroutine f_seleccionar (integer pi_cant_filas)
public subroutine f_tabla_error (integer pi_tabla)
public function integer fnu_insertar_fila ()
end prototypes

public subroutine uf_setear_clicked_row (integer p_fila);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	uf_setear_clicked_row
// 
// Objetivo:	Carga en la variable clicked row el valor deseado.
//					Se hace para poder abrir una rama sin clickear, por script
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  fila
//	Salida:   --
//						
// Devuelve:	--
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/09/95		SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

ii_clicked_row = p_fila

RETURN 
end subroutine

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

public function integer fnu_insertar_fila ();return this.insertrow(1)

end function

event doubleclicked;/////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  doubleclicked
//
// Objetivo: recoge la fila sobre la que hacemos dobleclick y 
//					se realiza el filtro correspondiente 
//          
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        20-2-96   JH
//
/////////////////////////////////////////////////////////////////////////

//
// Ponemos como puntero el reloj y tomamos en ii_clicked_row
// la fila sobre la que se produce el evento.
// Llamamos a un postevent para que se ejecute primero el c$$HEX1$$f300$$ENDHEX$$digo
// introducido por el programador en el evento doubleclicked de la dw.
//

this.SetRedraw(false)

pointer p_viejo
p_viejo = SetPointer(hourglass!)

ii_clicked_row = row


// Si se clickeo una fila v$$HEX1$$e100$$ENDHEX$$lida proceso

IF ii_clicked_row > 0 THEN

	//se mira si queremos abrir seg$$HEX1$$fa00$$ENDHEX$$n el valor de "expandido"
	//y se da valores a una serie de valores que utilizamos a posteriori
	
	IF This.GetItemNumber(ii_clicked_row,"expandido") = 1 THEN
		is_accion="e_cierre"    //establece el evento de usuario que se va a ejecutar
		ii_visible=0
		ii_expandido=0
	ELSE                                             
		is_accion="e_apertura"
		ii_visible=1
		ii_expandido=1
	END IF
	
	//
	// establecemos las fila que cumplen la condici$$HEX1$$f300$$ENDHEX$$n de cierre o apertura
	// seg$$HEX1$$fa00$$ENDHEX$$n lo establecido por el usuario
	//
	
	int i,i_cant_filas
	
	il_nro_instal = this.GetItemNumber(ii_clicked_row, "nro_instalacion")
	
	this.SetFilter("")
	this.Filter()
	
	this.Sort()
	
	//
	// recoge el filtro correspondiente y lo aplica
	//
	
	i_cant_filas = this.Rowcount()
	
	i = Find("nro_instalacion= " + string (il_nro_instal), 1, i_cant_filas) + 1 
	ii_co_nivel_orig = this.GetItemNumber(i - 1, "co_nivel")	
	
	IF is_accion = "e_apertura" THEN
	
		//Filtro para abrir un nivel determinado
	
		DO WHILE this.GetItemNumber(i, "co_nivel") = ii_co_nivel_orig +1
				
			this.SetItem(i, "visible", ii_visible)
			this.SetItemStatus (i,"visible", Primary!, NotModified!)
	
			this.SetItem(i, "expandido",0)
			
			this.SetItemStatus(i, "expandido", Primary!, NotModified!)
			this.SetItemStatus(i,0, Primary!, NotModified!)
			i++
			IF i > i_cant_filas THEN EXIT
		LOOP	

	ELSE 
		//Filtro para cerrar un nivel determinado
		DO WHILE this.GetItemNumber(i, "co_nivel") > ii_co_nivel_orig 
			this.SetItem(i, "visible", ii_visible)
			this.SetItemStatus (i,"visible", Primary!, NotModified!)
			
			this.SetItem(i, "expandido",0)
	
			this.SetItemStatus(i, "expandido", Primary!, NotModified!)
			this.SetItemStatus(i,0, Primary!, NotModified!)
			i++
			IF i > i_cant_filas THEN EXIT
		LOOP
	END IF
	
	this.AcceptText()     
	
	// primero se quita el filtro anterior 
		this.SetFilter("")
		this.Filter()
	
	// se aplica el filtro correspondiente
	// se conserva el filtro del usuario
	
		this.SetFilter(is_filtro_visible + is_filtro_secundario)
		this.Filter()
	
	//
	// ponemos el campo expandido con su valor en la fila que hemos tocado
	//
	
	This.SetItem(ii_clicked_row,"expandido",ii_expandido)
	This.SetItemStatus(ii_clicked_row,"expandido",Primary!,NotModified!)
	This.SetItemStatus(ii_clicked_row,0,Primary!,NotModified!)
	
	//
	// reestablecemos la fila 
	//
	
	This.ScrollToRow(ii_clicked_row)
	
	this.SetRedraw(true)
	SetPointer(p_viejo)
	
END IF	
	
	
						
end event

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Evento:  clicked
//
// Objetivo: recoge la fila sobre la que realizamos el click.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        26-1-95   ABZ
//
/////////////////////////////////////////////////////////////////////////

//
// recogemos la fila sobre la que se produce el click, en una variable 
// instance de uo_outliner_generico
//

ii_clicked_row = row
//
// MERC int ii_rownum
// MERC ii_rownum = row

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

on constructor;////////////////////////////////////////////////////////////////////////////////
//
// Evento:  constructor
//
// Objetivo: al construir el objeto uo_outliner,le asociamos un indicador
//           de fila por defecto.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        24-1-95   ABZ
//
/////////////////////////////////////////////////////////////////////////

This.SetRowFocusIndicator(Hand!)
end on

on retrieveend;/////////////////////////////////////////////////////////////////////////
//
// Evento:  retrieveend
//
// Objetivo: comentarios para el usuario de este objeto.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        26-1-95   ABZ
//
/////////////////////////////////////////////////////////////////////////

//Aviso al programador:
//para indentar los niveles debe construir el dwmodify en este evento

end on

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


HA$PBExportHeader$u_tv_generico.sru
$PBExportComments$Objeto (Tree - View) gen$$HEX1$$e900$$ENDHEX$$rico.
forward
global type u_tv_generico from treeview
end type
end forward

global type u_tv_generico from treeview
int Width=430
int Height=356
int TabOrder=1
BorderStyle BorderStyle=StyleLowered!
boolean LinesAtRoot=true
boolean HideSelection=false
int Indent=3
long PictureMaskColor=553648127
long StatePictureMaskColor=553648127
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
event type boolean esf_comparacion_buscar ( long al_handle,  string as_atributo,  any aa_buscar,  boolean ab_respetar_mayusculas,  boolean ab_comparacion_completa )
end type
global u_tv_generico u_tv_generico

type variables
datastore ids_niveles[]
datastore ids_buffer
string is_retrieve[]  // Guarda las columnas del nivel anterior
                             // por las que se debe hacer retrieve.

string is_nom_datastore[]  // Se guarda el nombre de los
                             // datastore de cada nivel.
string is_column_display[]  // Se guarda el nombre de las
                            // columnas a mostrar en cada nivel
Any la_Arg[20]
end variables

forward prototypes
public function integer of_desplegar_nivel (integer pi_nivel, long pl_handle_padre)
public function integer of_setnivel (integer pi_nivel, string ps_datawindow, string ps_columnas_display, string ps_retrieve)
public function integer of_refrescar_arbol ()
public function long of_refrescar_arbol (any pany_parametros[])
public subroutine of_expandir_todo ()
public subroutine of_expandir_nivel ()
private function string of_obtener_label_buffer (integer pi_indice, string ps_columna)
public function integer of_insertar_item ()
public function integer of_cambiar_picture (ref treeviewitem atv_treeview, boolean ab_expandir)
public subroutine of_refrescar_item (long al_handle)
public function long of_buscar (string as_atributo, any aa_buscar, long al_comienzo, integer ai_nivel, boolean ab_respetar_mayuscula, boolean ab_comparacion_completa)
public function long of_buscar_todo (string as_atributo, any aa_buscar, long al_comienzo, integer ai_nivel, boolean ab_respetar_mayusculas, boolean ab_comparacion_total)
public function long of_recuperar_registro (ref datastore ads_datastore, ref treeviewitem aitv_itemtreeview)
public function integer of_recuperar_argumentos (integer pi_nivel, ref treeviewitem pitem_treeview)
end prototypes

event esf_comparacion_buscar;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_searchcompare
//
//	Arguments:
//	al_Handle					The handle of the item being compared.
//	as_Atributo				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Buscar					A variable of type Any containg the search target.
//	ab_Respetar_Mayusculas			True - search is case sensitive,
//									False - search is not case sensitive.  Only used if the target
//									is a string.
//	ab_Comparacion_Completa			True - Label or Data and Target must be equal,
//									False - Label or Data can contain Target (uses POS() function).
//									Only used if the target is a string.
//
//	Returns:		Boolean
//					True - a match was found
//					False - no match
//
//	Description:	This event is triggered by the of_SearchChild function (which is called
//						by of_FindItem).  It does the actual comparison between a TreeView
//						item and the target being searched for.
//
//						If a more complex comparison is desired, this event should be overridden.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996 Powersoft Corporation.  All Rights Reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Powersoft is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

String				ls_Target, ls_Source
TreeViewItem		ltvi_Item

If GetItem(al_Handle, ltvi_Item) = -1 Then Return False


If Lower(as_Atributo) = "label" Then
	// Label Comparison
	If ab_Respetar_Mayusculas Then
		// Comparison is case-sensitive
		ls_Source = ltvi_Item.Label
		ls_Target = String(aa_Buscar)
	Else
		ls_Source = Upper(ltvi_Item.Label)
		ls_Target = Upper(String(aa_Buscar))
	End If

	If ab_Comparacion_Completa Then
		// Match whole words only
		If ls_Source = ls_Target Then Return True
	Else
		If Pos(ls_Source, ls_Target) > 0 Then Return True
	End If

Else
	// Data Comparison
	If ClassName(ltvi_Item.Data) = "string" Then
		// RespectCase and FullCompare boolean arguments are valid
		If ab_Respetar_Mayusculas Then
			// Comparison is case-sensitive
			ls_Source = String(ltvi_Item.Data)
			ls_Target = String(aa_Buscar)
		Else
			ls_Source = Upper(String(ltvi_Item.Data))
			ls_Target = Upper(String(aa_Buscar))
		End If

		If ab_Comparacion_Completa Then
			// Match whole words only
			If ls_Source = ls_Target Then Return True
		Else
			If Pos(ls_Source, ls_Target) > 0 Then Return True
		End If

	Else
		// Data is non-string
		If ltvi_Item.Data = aa_Buscar Then Return True
	End If
End If

Return False

end event

public function integer of_desplegar_nivel (integer pi_nivel, long pl_handle_padre);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_desplegar_nivel
// 
// Objetivo:  Despliega los datos en el nivel indicado del $$HEX1$$e100$$ENDHEX$$rbol
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  pi_nivel Nivel que va a ser desplegado
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//				               Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
//
Integer				li_Contador, li_Nuevos_regs, li_Regs, &
						li_Objects, li_Obj, li_Indice
//Any					la_Arg[20] comentado por pacho para la version 6.5, 
//                como esta variable esta definida como de instancia
//                y aqui como local, es posible que haya que resetearla 
//                al terminar el evento.....
TreeViewItem		ltvi_New, ltvi_Padre
//
//////////////////////////////////////////////////////////////////////////////////////////////////
// li_nuevos_regs-> Cantidad de nuevos registros del buffer.
//////////

SetPointer(Hourglass!)
// Se comprueba que se haya asociado un dw al nivel que se quiere 
// desplegar para ello se debe haber llamado previamene a la funci$$HEX1$$f300$$ENDHEX$$n 
// of_setnivel(), con ello se habr$$HEX2$$e1002000$$ENDHEX$$cargado el array is_nom_datastore[]
// con el nombre del mismo para el nivel pi_nivel

IF UPPERBOUND(ids_niveles[]) < pi_nivel THEN
	RETURN -1
END IF

// Obtiene los argumentos
If (pi_nivel - 1) > 0 Then
	GetItem (pl_handle_padre, ltvi_padre)
	of_recuperar_argumentos(pi_nivel, ltvi_padre)

	// Recupera los registros en el buffer temporal
	ids_Buffer.Reset()
	ids_Buffer.DataObject = ids_niveles[pi_nivel].DataObject
	ids_Buffer.SetTransObject(SQLCA)
	li_Nuevos_regs = ids_Buffer.Retrieve(la_Arg[1], la_Arg[2], &
									la_Arg[3],  la_Arg[4],  la_Arg[5], &
									la_Arg[6],  la_Arg[7],  la_Arg[8], &
									la_Arg[9],  la_Arg[10], la_Arg[11],&
									la_Arg[12], la_Arg[13], la_Arg[14],&
									la_Arg[15], la_Arg[16], la_Arg[17],&
									la_Arg[18], la_Arg[19], la_Arg[20]	)
End if

// A$$HEX1$$f100$$ENDHEX$$ade los registros.
li_Regs = ids_niveles[pi_nivel].RowCount()
ids_Buffer.RowsCopy(1, li_Nuevos_Regs, Primary!, ids_niveles[pi_nivel],&
								(li_Regs + 1), Primary!)

// Limpia el estado de los flags para los nuevos registros.
For li_Contador = (li_Regs + 1) To (li_Regs + li_Nuevos_Regs)
	ids_niveles[pi_nivel].SetItemStatus ( li_Contador, 0, &
														Primary!, DataModified!)
	ids_niveles[pi_nivel].SetItemStatus ( li_Contador, 0, &
														Primary!, NotModified!)
Next

// A$$HEX1$$f100$$ENDHEX$$ade los nodos al TreeView
For li_Contador = 1 To li_Nuevos_regs

	ltvi_New.Label = of_obtener_label_buffer (li_contador,is_column_display[pi_nivel])
	ltvi_New.Expanded = FALSE
	ltvi_New.PictureIndex = pi_nivel
	ltvi_New.SelectedPictureIndex = pi_nivel
	ltvi_New.Data = ids_Niveles[pi_nivel].Object.cc_clave[li_Regs + li_Contador]

//ltvi_New.Children = TRUE
	If UpperBound(ids_niveles) = pi_nivel Then
		ltvi_New.Children = FALSE
	Else
		ltvi_New.Children = TRUE
	End if

	this.InsertItemLast(pl_handle_padre, ltvi_New)
Next

Return li_Nuevos_regs

end function

public function integer of_setnivel (integer pi_nivel, string ps_datawindow, string ps_columnas_display, string ps_retrieve);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_setnivel
// 
// Objetivo:  Inicializa los valores de cada nivel del treeview, en 
//					las variables de instancia correspondientes.
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: pi_nivel
//				ps_datawindow
//				ps_columnas_display
//				ps_retrieve
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	26/12/96		JTF			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
/////////////////////////////////////////////////////////////////////////
ids_niveles[pi_nivel] = CREATE DataStore
ids_niveles[pi_nivel].DataObject = ps_datawindow
ids_niveles[pi_nivel].SetTransObject(SQLCA)

// Nombre del datawindow asociado al nivel
is_nom_datastore[pi_nivel] = ps_datawindow

// Columnas a desplegar en el tree
is_column_display[pi_nivel] = ps_columnas_display

// Columnas sobre las que se va ha hacer retrieve en el nivel.
is_retrieve[pi_nivel] = ps_retrieve

String	ls_Exp, ls_Obj[]
Integer	li_Obj, li_Cnt
Boolean	lb_First

ls_Exp = "expression='"
lb_First = True
li_Obj = INTEGER( ids_Niveles[pi_nivel].Describe("DataWindow.Column.Count") )

For li_Cnt = 1 To li_Obj
	If ids_Niveles[pi_nivel].Describe("#"+STRING(li_Cnt)+ ".key") = "yes" Then
		If Not lb_First Then
			ls_Exp = ls_Exp + " + "
		Else
			lb_First = False
		End if
		ls_Exp = ls_Exp + "String(#"+String(li_Cnt)+")"
	End if
Next

If lb_First Then
	// No existen columnas claves definidas.
	Return -1
Else
	ls_Exp = ls_Exp + "'"
End if

// Se crea un campo calculado que ser$$HEX2$$e1002000$$ENDHEX$$donde se guardar$$HEX1$$e100$$ENDHEX$$n los valores 
// de la clave por la que se va a recupera el siguiente nivel del $$HEX1$$e100$$ENDHEX$$rbol,
// es decir, el valor que van a tomar los argumentos.
ls_Exp = ids_Niveles[pi_nivel].Modify("create compute(band=detail x='0' y='0' " + &
								"height='0' width='0' name=cc_clave " + ls_Exp + ")")

Return 1

end function

public function integer of_refrescar_arbol ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_refrescar_arbol
// 
// Objetivo: Recupera los datos y despliega el primer nivel del $$HEX1$$e100$$ENDHEX$$rbol.
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  
//	Salida:   
//						
// Devuelve:	long ll_regs = n$$HEX1$$fa00$$ENDHEX$$mero de registros recuperados.
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/12/96		 JTF        Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
//
Long	ll_Regs
Integer li_nuevos_regs, li_regs, li_contador
TreeViewItem ltvi_new
long ll_tvi
//
//
////////////////////
// EXPLICACI$$HEX1$$d300$$ENDHEX$$N DE LAS VARIABLES
// ll_tvi -> Se utiliza como variable auxiliar para poder borrar todos
//					los $$HEX1$$ed00$$ENDHEX$$tems del $$HEX1$$e100$$ENDHEX$$rbol.
//
////////////////////

this.SetRedraw (FALSE)

// Se borran todos los elementos del $$HEX1$$e100$$ENDHEX$$rbol
ll_tvi = FindItem ( roottreeitem!, 0 )
DO WHILE ll_tvi <> -1
	DeleteItem ( ll_tvi )
	ll_tvi = FindItem ( roottreeitem!, 0 )
LOOP

// Recupera los registros en el buffer temporal
ids_Buffer.Reset()
ids_Buffer.DataObject = ids_niveles[1].DataObject
ids_Buffer.SetTransObject(SQLCA)
li_Nuevos_regs = ids_Buffer.Retrieve()

// A$$HEX1$$f100$$ENDHEX$$ade los registros.
li_Regs = ids_niveles[1].RowCount()
ids_Buffer.RowsCopy(1, li_Nuevos_Regs, Primary!, ids_niveles[1],&
								(li_Regs + 1), Primary!)

// Limpia el estado de los flags para los nuevos registros.
For li_Contador = (li_Regs + 1) To (li_Regs + li_Nuevos_Regs)
	ids_niveles[1].SetItemStatus ( li_Contador, 0, &
														Primary!, DataModified!)
	ids_niveles[1].SetItemStatus ( li_Contador, 0, &
														Primary!, NotModified!)
Next

// A$$HEX1$$f100$$ENDHEX$$ade los nodos al TreeView
FOR li_Contador = 1 TO li_Nuevos_regs
	
	ltvi_New.Label = of_obtener_label_buffer( li_contador, is_column_display[1])
	ltvi_New.Expanded = FALSE
	ltvi_New.PictureIndex = 1
	ltvi_New.SelectedPictureIndex = 1
	ltvi_New.Children = TRUE
	ltvi_New.Data = ids_Niveles[1].Object.cc_clave[li_Regs + li_Contador]
	this.InsertItemLast(0, ltvi_New)
	
NEXT

this.SetRedraw ( TRUE )

Return li_Nuevos_regs


end function

public function long of_refrescar_arbol (any pany_parametros[]);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_refrescar_arbol
// 
// Objetivo: Recupera los datos y despliega el primer nivel del $$HEX1$$e100$$ENDHEX$$rbol.
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  pany_parametros[] -> Array que contiene el valor 
//											de los argumentos
//	Salida:   
//						
// Devuelve:	long ll_regs = n$$HEX1$$fa00$$ENDHEX$$mero de registros recuperados.
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/12/96		 JTF        Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
//
Integer li_nuevos_regs, li_regs, li_contador
TreeViewItem ltvi_new, ltvi_padre
long ll_tvi
//
////////////////////
// EXPLICACI$$HEX1$$d300$$ENDHEX$$N DE LAS VARIABLES
// ll_tvi -> Se utiliza como variable auxiliar para poder borrar todos
//					los $$HEX1$$ed00$$ENDHEX$$tems del $$HEX1$$e100$$ENDHEX$$rbol.
//
////////////////////

this.SetRedraw (FALSE)

// Se borran todos los elementos del $$HEX1$$e100$$ENDHEX$$rbol
ll_tvi = FindItem ( roottreeitem!, 0 )
DO WHILE ll_tvi <> -1
	DeleteItem ( ll_tvi )
	ll_tvi = FindItem ( roottreeitem!, 0 )
LOOP

// Recupera los registros en el buffer temporal
//
// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que recupera el valor de los par$$HEX1$$e100$$ENDHEX$$metros
// Obtiene los argumentos
//GetItem (0, ltvi_padre)
//of_recuperar_argumentos(1, pany_parametros, ltvi_padre)

// Recupera los registros en el buffer temporal, pasando  tambi$$HEX1$$e900$$ENDHEX$$n los
// argumentos para recuperar los datos.
ids_Buffer.Reset()
ids_Buffer.DataObject = ids_niveles[1].DataObject
ids_Buffer.SetTransObject(SQLCA)
// Se recuperan los registro con los valores que se han pasado en el
// array pasado como par$$HEX1$$e100$$ENDHEX$$metro en la llamada a esta funci$$HEX1$$f300$$ENDHEX$$n.
li_Nuevos_regs = ids_Buffer.Retrieve(pany_parametros[1], pany_parametros[2], &
									pany_parametros[3],  pany_parametros[4],  pany_parametros[5], &
									pany_parametros[6],  pany_parametros[7],  pany_parametros[8], &
									pany_parametros[9],  pany_parametros[10], pany_parametros[11],&
									pany_parametros[12], pany_parametros[13], pany_parametros[14],&
									pany_parametros[15], pany_parametros[16], pany_parametros[17],&
									pany_parametros[18], pany_parametros[19], pany_parametros[20]	)


// A$$HEX1$$f100$$ENDHEX$$ade los registros.
li_Regs = ids_niveles[1].RowCount()
ids_Buffer.RowsCopy(1, li_Nuevos_Regs, Primary!, ids_niveles[1],&
								(li_Regs + 1), Primary!)

// Limpia el estado de los flags para los nuevos registros.
For li_Contador = (li_Regs + 1) To (li_Regs + li_Nuevos_Regs)
	ids_niveles[1].SetItemStatus ( li_Contador, 0, &
														Primary!, DataModified!)
	ids_niveles[1].SetItemStatus ( li_Contador, 0, &
														Primary!, NotModified!)
Next

// A$$HEX1$$f100$$ENDHEX$$ade los nodos al TreeView
FOR li_Contador = 1 TO li_Nuevos_regs
	// Se pone la etiqueta en el $$HEX1$$e100$$ENDHEX$$rbol.
	ltvi_New.label = of_obtener_label_buffer( li_Contador, is_column_display[1])
	ltvi_New.Expanded = FALSE
	ltvi_New.PictureIndex = 1
	ltvi_New.Children = TRUE
	ltvi_New.Data = ids_Niveles[1].Object.cc_clave[li_Regs + li_Contador]
	this.InsertItemLast(0, ltvi_New)
	
NEXT

this.SetRedraw ( TRUE )

Return li_Nuevos_regs


end function

public subroutine of_expandir_todo ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	
// Objetivo: Expande todos los niveles de un item seleccionado.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  
//	Salida:   
// Devuelve:	
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	26/12/96		JTF			 Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

this.ExpandAll(FindItem(CurrentTreeItem!,0))
end subroutine

public subroutine of_expandir_nivel ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_expandir_nivel
// Objetivo:	Expande el primer nivel siguiente al nivel seleccionado
// 				es decir, todos los hijos del item seleccionado.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  
//	Salida:   						
// Devuelve:	
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	26/12/96		JTF			Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

this.Expanditem(FindItem(CurrentTreeItem!,0))
end subroutine

private function string of_obtener_label_buffer (integer pi_indice, string ps_columna);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_obtener_label_buffer
// 
// Objetivo:
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	26/12/96		  JTF		   Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
//
//
////////////////////
String ls_tipo
Any ls_valor
//Recojo el tipo y luego lo meto en el array any de salida
ls_Tipo = ids_buffer.Describe(Trim(ps_columna) + ".coltype")
CHOOSE CASE ls_Tipo
	CASE "number"
		ls_valor= ids_buffer.GetItemNumber(pi_indice , ps_columna)
	CASE "date"
		ls_valor= ids_buffer.GetItemDate(pi_indice , ps_columna)
	CASE "time"
		ls_valor= ids_buffer.GetItemTime(pi_indice , ps_columna)
	CASE "datetime"
		ls_valor= ids_buffer.GetItemDateTime(pi_indice , ps_columna)
	CASE ELSE
		IF Left(ls_tipo,7)='decimal' THEN
			ls_valor= ids_buffer.GetItemDecimal(pi_indice , ps_columna)
		ELSEIF Left(ls_tipo,4)='char' THEN
			ls_valor= ids_buffer.GetItemString(pi_indice , ps_columna)
		ELSE
			RETURN String ( '' )
		END IF
END CHOOSE

Return String ( ls_valor )

end function

public function integer of_insertar_item ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_insertar_item
// 
// Objetivo:  Inserta un nuevo elemento encima del item seleccionado en
//					el treeview.
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	   Resp.		   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//				               Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
//
long ll_tvi, ll_tvparent
treeview tv_list  // lA DECLARACION DE ESTA VARIABLE NO ESTA EN EL EJEMPLO
//
////////////////////
ll_tvi = tv_list.FindItem(currenttreeitem! , 0)

ll_tvparent = tv_list.FindItem(parenttreeitem!, ll_tvi)
tv_list.InsertItem(ll_tvparent ,ll_tvi ,"Hindemith", 2)

Return 1
end function

public function integer of_cambiar_picture (ref treeviewitem atv_treeview, boolean ab_expandir);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_cambiar_picture para u_tv_generico
// 
// Objetivo:	 Se trata de cambiar el dibujo si est$$HEX2$$e1002000$$ENDHEX$$definido con uno nuevo cuando el
//				 item se expande o se contrae.
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	TreeViewItem atv_TreeView ( Item que se expande o contrae )
//					boolean ab_expandir ( indica si se expande o contrae )
//						
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	29/04/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n original.
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
integer li_Dimension
integer li_Nivel
integer li_Numero_Dibujos
integer li_Dibujo_Aplicar
//
//////////////////////////////////////////////////

li_Dimension = UPPERBOUND( ids_niveles[] )

IF li_Dimension > 0 THEN
	li_Nivel = atv_TreeView.Level
	li_Numero_Dibujos = UPPERBOUND(this.PictureName[])
	li_Dibujo_Aplicar = li_Nivel + li_Dimension
	IF li_Dibujo_Aplicar <= li_Numero_Dibujos THEN
		// Existen dibujos preparados para realizar el cambio de dibujo cuando se 
		// expande o contrae.
		IF ab_expandir THEN
			// Se expande
			atv_TreeView.PictureIndex = li_Dibujo_Aplicar
			atv_TreeView.SelectedPictureIndex = li_Dibujo_Aplicar
		ELSE
			// Se contrae
			atv_TreeView.PictureIndex = li_Nivel
			atv_TreeView.SelectedPictureIndex = li_Nivel
		END IF
	END IF
ELSE
	RETURN -1
END IF

RETURN 0
end function

public subroutine of_refrescar_item (long al_handle);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_refrescar_item para u_tv_generico
// 
// Objetivo:		Se trata de refrescar el item
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  long al_Handle  ( Handle del item a refrescar )
//						
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	30/04/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n original
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Guarda el treeviewitem referenciado
TreeViewItem ltvi_Actual
// Guarda el handle actual
long ll_Handle_Borrar
// Guarda la condicio$$HEX1$$f300$$ENDHEX$$n de salida
boolean lb_Salir = FALSE
// DataStore para eliminar el registro realmente
DataStore lds_DS
long ll_Registro
//
//////////////////////////////////////////////////

this.SetRedraw( FALSE )

DO 
	
	ll_Handle_Borrar = this.FINDITEM( CHILDTREEITEM!, al_Handle )
	IF ll_Handle_Borrar > 0 THEN
		this.GetItem( ll_Handle_Borrar, ltvi_Actual )
		ll_Registro = this.of_Recuperar_Registro(lds_DS, ltvi_Actual)
		IF ll_Registro > 0 THEN
			lds_DS.ROWSDISCARD( ll_Registro, ll_Registro, PRIMARY! )
			this.DeleteItem( ll_Handle_Borrar )
		END IF
	ELSE
		lb_Salir = TRUE
	END IF

LOOP UNTIL lb_Salir

// Se han borrado todos los items hijos
// Refrescamos
IF GetItem( al_Handle, ltvi_Actual ) > 0 THEN
	// Indicamos que no tiene hijos
	ltvi_Actual.Expanded = FALSE
	this.SetItem( al_Handle, ltvi_Actual )
	this.of_Desplegar_Nivel(ltvi_Actual.Level + 1, al_Handle )
	this.ExpandItem( al_Handle )
END IF

this.SetRedraw(TRUE )
end subroutine

public function long of_buscar (string as_atributo, any aa_buscar, long al_comienzo, integer ai_nivel, boolean ab_respetar_mayuscula, boolean ab_comparacion_completa);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  OF_BUSCAR
//
//	Access:  protected
//
//	Arguments:
//	as_Atributo					The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Buscar					A variable of type Any containg the search target.
//
//	al_Comienzo					The handle of the TreeView item to begin searching, if
//									0 entire tree will be searched.
//
//	ai_Nivel						The level to search, if 0 entire tree will be searched.
//
//	ab_Respetar_Mayuscula	True - search is case sensitive,
//									False - search is not case sensitive.  Only used if the target
//									is a string.
//
//	ab_Comparacion_Completa	True - Label or Data and Target must be equal,
//									False - Label or Data can contain Target (uses POS() function).
//									Only used if the target is a string.
//
//	Returns:		Long
//					The handle of the item whose Label or Data matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for the target in either the Label or Data attribute of the TreeView 
//						items..  This is a recursive function called by of_FindItem.  It will use the 
//						pfc_searchcompare event to actually perform the comparison.  Override 
//						this event if another comparison is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996 Powersoft Corporation.  All Rights Reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Powersoft is permitted.
//
//////////////////////////////////////////////////////////////////////////////

String				ls_Label, ls_Target
Integer				li_Level
Long					ll_Handle, ll_Found, ll_Parent
TreeViewItem		ltvi_Item

If al_Comienzo > 0 Then
	If GetItem(al_Comienzo, ltvi_Item) = -1 Then Return -1
	li_level = ltvi_Item.Level

	If ai_Nivel = 0 Or ai_Nivel = li_Level Then
		If Trigger Event esf_Comparacion_Buscar(al_Comienzo, as_Atributo, aa_Buscar, ab_Respetar_Mayuscula, &
															ab_Comparacion_Completa) Then Return al_Comienzo
	End If
Else
	li_Level = 0
End If

If ai_Nivel = 0 Or ai_Nivel > li_Level Then
	
	// Desplegar nivel del item padre.
	IF FINDITEM( CHILDTREEITEM!, al_Comienzo ) < 0 THEN
		this.of_Desplegar_Nivel( li_Level + 1, al_comienzo )
	END IF
	// Search children
	ll_Handle = FindItem(ChildTreeItem!, al_Comienzo)
	If ll_Handle > 0 Then
		ll_Found = of_Buscar(as_Atributo, aa_Buscar, ll_Handle, ai_Nivel, ab_Respetar_Mayuscula, ab_Comparacion_Completa)
		
		If ll_Found = -1 Then Return -1
		If ll_Found > 0 Then Return ll_Found
	End If
End If

If ai_Nivel = 0 Or ai_Nivel >= li_Level Then
	
	//Search next sibling
	ll_Handle = FindItem(NextTreeItem!, al_Comienzo)
	If ll_Handle > 0 Then
		ll_Found = of_Buscar(as_Atributo, aa_Buscar, ll_Handle, ai_Nivel, ab_Respetar_Mayuscula, ab_Comparacion_Completa)
		
		If ll_Found = -1 Then Return -1
		If ll_Found > 0 Then Return ll_Found
	End If
End If

Return 0

end function

public function long of_buscar_todo (string as_atributo, any aa_buscar, long al_comienzo, integer ai_nivel, boolean ab_respetar_mayusculas, boolean ab_comparacion_total);//this.ExpandAll(0)

RETURN this.of_Buscar(as_Atributo,aa_Buscar,al_Comienzo,ai_Nivel,ab_Respetar_Mayusculas,ab_Comparacion_Total)

end function

public function long of_recuperar_registro (ref datastore ads_datastore, ref treeviewitem aitv_itemtreeview);integer li_Nivel

li_Nivel = aitv_ItemTreeView.level
ads_datastore = ids_niveles[ li_Nivel ]

// Se recupera el registro del cual sacar los valores
RETURN ids_niveles[li_nivel].Find("cc_clave= '" + aitv_ItemTreeView.Data + "'",1,ids_niveles[li_Nivel].RowCount())

end function

public function integer of_recuperar_argumentos (integer pi_nivel, ref treeviewitem pitem_treeview);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_recuperar_argumentos
//
//	Access:  public
//
//	Argumentos:
//		ENTRADA 
//			la_Arg[] Array con los nombres de las columnas
//			pi_nivel nivel de la datastore padre
//			pitem_treeview
//
//		SALIDA
//			la_Arg Array tipo any que devuelve los valores de las columnas
//
//	Description:
// Hist"rico de cambios:
//
//  Fecha	   Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------	----------------------------------------
// 19/12/96		JAC		Versi$$HEX1$$f300$$ENDHEX$$n original
//
////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
integer li_num_Argumentos, &
		  li_contador = 1
string  ls_columnas[], &
		  ls_Tipo
long    ll_ult_pos, &
        ll_registro, &
		  ll_posicion = 1
/////////////////////////////

// Pasa el string a un array de string
IF Len (is_retrieve[pi_nivel]) > 0 THEN
	ll_ult_pos = ll_posicion
	DO WHILE ll_posicion > 0 
		ll_posicion= Pos (is_retrieve[pi_nivel],",",ll_ult_pos)
		IF ll_posicion > 0 THEN
			ls_columnas[li_contador] = Mid (is_retrieve[pi_nivel], &
														ll_ult_pos, ll_posicion - ll_ult_pos)
			li_contador ++
		ELSE
			ls_columnas[li_contador] = Mid (is_retrieve[pi_nivel], &
						ll_ult_pos, Len (is_retrieve[pi_nivel]) - ll_ult_pos + 1)
		END IF
		ll_ult_pos = ll_posicion + 1
	LOOP
END IF

// Se recupera el registro del cual sacar los valores
ll_registro = ids_niveles[pi_nivel - 1].Find("cc_clave= '" + pitem_treeview.Data + "'",1,ids_niveles[pi_nivel - 1].RowCount())

li_num_argumentos = UpperBound(ls_columnas)

FOR li_contador=1 TO li_num_argumentos
    //Recojo el tipo y luego lo meto en el array any de salida
	 ls_columnas[li_contador] = Trim ( ls_columnas [li_contador])
	 ls_Tipo = ids_niveles[pi_nivel - 1].Describe(ls_columnas[li_contador] + ".coltype")
    CHOOSE CASE ls_Tipo
		CASE "number"
			la_Arg[li_contador]= ids_niveles[pi_nivel - 1].GetItemNumber(ll_registro , ls_columnas[li_contador])
		CASE "date"
			la_Arg[li_contador]= ids_niveles[pi_nivel - 1].GetItemDate(ll_registro , ls_columnas[li_contador])
		CASE "time"
			la_Arg[li_contador]= ids_niveles[pi_nivel - 1].GetItemTime(ll_registro , ls_columnas[li_contador])
		CASE "datetime"
			la_Arg[li_contador]= ids_niveles[pi_nivel - 1].GetItemDateTime(ll_registro , ls_columnas[li_contador])
		CASE ELSE
			IF Left(ls_tipo,7)='decimal' THEN
				la_Arg[li_contador]= ids_niveles[pi_nivel - 1].GetItemDecimal(ll_registro , ls_columnas[li_contador])
			ELSEIF Left(ls_tipo,4)='char' THEN
				la_Arg[li_contador]= ids_niveles[pi_nivel - 1].GetItemString(ll_registro , ls_columnas[li_contador])
			ELSE
				RETURN -1
			END IF
	END CHOOSE
NEXT

RETURN 0

end function

event constructor;ids_Buffer = Create datastore

end event

event destructor;Integer	li_NumDS, li_Cnt

li_NumDS = UpperBound(ids_niveles)
For li_Cnt = 1 To li_NumDS
	If IsValid(ids_niveles[li_Cnt]) THEN
		Destroy ids_niveles[li_Cnt]
	End If
Next

Destroy ids_Buffer

end event

event itemexpanding;////////////////////////////////////////////////////////////////////////////////////////////////
// Evento: itemexpanding
//
// Objetivo: Mostrar todos los registros cuando se expande el nivel
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//  Fecha	   Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------	----------------------------------------
//  26/12/96	  JTF        Versi$$HEX1$$f300$$ENDHEX$$n original
// 
//
//////////////////////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
//
Integer	li_RC
TreeViewItem	ltvi_This
//
///////////////////////////////////

If FindItem(ChildTreeItem!, handle) = -1 Then
	// Si no tiene hijos anteriormente desplegados, los recupera y los
	// muestra por primera vez.
	IF GetItem(handle, ltvi_This) > 0 THEN
		li_RC = of_desplegar_nivel(ltvi_This.Level + 1, handle)
		// Si no despliega el siguiente nivel -> no tiene hijos.
		IF li_RC < 1 THEN
			ltvi_This.Children = False
			SetItem(handle, ltvi_This)
		ELSE
			this.of_cambiar_picture( ltvi_This, TRUE )
			SetItem(handle, ltvi_This)
		END IF
	END IF
ELSE
	IF GetItem(handle, ltvi_This) > 0 THEN
		this.of_cambiar_picture( ltvi_This, TRUE )
		SetItem(handle, ltvi_This)
	END IF
END IF
end event

event itemcollapsed;////////////////////////////////////////////////////////////////////////////////////////////////
// Evento: itemcollapsed
//
// Objetivo: Colocar el dibujo apropiado para el item
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//  Fecha	   Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------	----------------------------------------
//  26/12/96	  JTF        Versi$$HEX1$$f300$$ENDHEX$$n original
// 
//
//////////////////////////////////////////////////////////////////////////////////////////////
// DECLARACION DE VARIABLES
//
TreeViewItem	ltvi_This
//
///////////////////////////////////

IF GetItem(handle, ltvi_This) > 0 THEN
	this.of_cambiar_picture( ltvi_This, FALSE )
	SetItem(handle, ltvi_This)
END IF
end event


HA$PBExportHeader$w_generica_impresion_preliminar.srw
$PBExportComments$PM013.JCC. Ventana gen$$HEX1$$e900$$ENDHEX$$rica para impresi$$HEX1$$f300$$ENDHEX$$n preliminar.
forward
global type w_generica_impresion_preliminar from w_sgigenerica
end type
type st_4 from statictext within w_generica_impresion_preliminar
end type
type cb_imprimir from commandbutton within w_generica_impresion_preliminar
end type
type cbx_ajustar from checkbox within w_generica_impresion_preliminar
end type
type cb_horizontal from commandbutton within w_generica_impresion_preliminar
end type
type cb_vertical from commandbutton within w_generica_impresion_preliminar
end type
type sle_documento from singlelineedit within w_generica_impresion_preliminar
end type
type st_3 from statictext within w_generica_impresion_preliminar
end type
type em_2 from editmask within w_generica_impresion_preliminar
end type
type cb_2 from commandbutton within w_generica_impresion_preliminar
end type
type em_1 from editmask within w_generica_impresion_preliminar
end type
type cb_1 from commandbutton within w_generica_impresion_preliminar
end type
type pb_anterior from picturebutton within w_generica_impresion_preliminar
end type
type pb_siguiente from picturebutton within w_generica_impresion_preliminar
end type
type em_copias from editmask within w_generica_impresion_preliminar
end type
type st_1 from statictext within w_generica_impresion_preliminar
end type
type pb_cerrar from picturebutton within w_generica_impresion_preliminar
end type
type pb_imprimir_documento from picturebutton within w_generica_impresion_preliminar
end type
type st_2 from statictext within w_generica_impresion_preliminar
end type
type ddlb_zoom from dropdownlistbox within w_generica_impresion_preliminar
end type
type gb_3 from groupbox within w_generica_impresion_preliminar
end type
type gb_2 from groupbox within w_generica_impresion_preliminar
end type
type gb_1 from groupbox within w_generica_impresion_preliminar
end type
type dw_debajo from datawindow within w_generica_impresion_preliminar
end type
type dw_impresion from datawindow within w_generica_impresion_preliminar
end type
end forward

global type w_generica_impresion_preliminar from w_sgigenerica
integer x = 23
integer y = 36
integer width = 3616
integer height = 2336
string title = "Impresi$$HEX1$$f300$$ENDHEX$$n de Documentos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
st_4 st_4
cb_imprimir cb_imprimir
cbx_ajustar cbx_ajustar
cb_horizontal cb_horizontal
cb_vertical cb_vertical
sle_documento sle_documento
st_3 st_3
em_2 em_2
cb_2 cb_2
em_1 em_1
cb_1 cb_1
pb_anterior pb_anterior
pb_siguiente pb_siguiente
em_copias em_copias
st_1 st_1
pb_cerrar pb_cerrar
pb_imprimir_documento pb_imprimir_documento
st_2 st_2
ddlb_zoom ddlb_zoom
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
dw_debajo dw_debajo
dw_impresion dw_impresion
end type
global w_generica_impresion_preliminar w_generica_impresion_preliminar

type variables
// VARIABLES //
//
PRIVATE:
// Guarda los datawindows a imprimir
DataWindow idw_Datawindow
// Guarda el indice del datawindow mostrado 
// actualmente
integer ii_Indice = 1
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de p$$HEX1$$e100$$ENDHEX$$ginas totales del documento
// actual.
integer ii_Paginas = 1
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de p$$HEX1$$e100$$ENDHEX$$gina actualmente visualizandose
integer ii_Pagina_Actual = 1
//
//////////////////
s_impresion_preliminar ist_impresion
boolean ib_clicked = false

end variables

forward prototypes
public subroutine f_imprimir_documento ()
public subroutine f_refrescar_ayudas (ref datawindow pdw_datawindow)
private subroutine f_cambiar_datawindow (datawindow pdw_datos)
public subroutine f_imprimir_apaisado ()
public function long f_zoom (datawindow pdw_datawindow, long pi_hoja)
end prototypes

public subroutine f_imprimir_documento ();////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	f_imprimir_documento para w_generica_impresion_preliminar
// 
// Objetivo:	Se trata de imprimir el documento actualmente seleccionado
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
//	Fecha			Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----				-----				---------
//	9-10-96			JCC				PM013
//
////////////////////////////////////////////////////////////////////////


dw_debajo.MODIFY( "Datawindow.Print.Copies='"+em_copias.Text + "'" )
dw_debajo.MODIFY( "Datawindow.Print.DocumentName='SGI listados'" )
dw_debajo.MODIFY( "Datawindow.Print.Size='9'")
dw_debajo.MODIFY( "Datawindow.Print.Orientation='2'")





end subroutine

public subroutine f_refrescar_ayudas (ref datawindow pdw_datawindow);////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	f_refrescar_ayudas para w_generica_impresion_preliminar
// 
// Objetivo:	Se trata de refrescar aquellas columnas cuyo estilo de edici$$HEX1$$f300$$ENDHEX$$n es dropdowndatawindow.
//			Por tanto, cuando se realiza la creaci$$HEX1$$f300$$ENDHEX$$n del datawindow de presentaci$$HEX1$$f300$$ENDHEX$$n preliminar a
//			partir de la  sint$$HEX1$$e100$$ENDHEX$$xis del datawindow a imprimir y se comparten los datos correspondientes
//			al datawindow a imprimir no se comparten los datos de las ayudas.
//			Para solucionar este problema vamos a recorrernos las columnas del datawindow a
//			imprimir comprobando si el estilo es de tipo dropdowndatawindow, en tal caso, realizaremos
//			un sharedata con las ayudas.
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  datawindow pdw_Datawindow referencia
//	Salida:   
//						
// Devuelve:	--
//
//	Fecha			Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----				-----				---------
//	21-10-96		JCC				PM013
//
////////////////////////////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Guarda un $$HEX1$$ed00$$ENDHEX$$ndice para recorrer las columnas del datawindow y el n$$HEX1$$fa00$$ENDHEX$$mero de columnas
long ll_Indice, ll_Numero_Columnas
// Guardamos una referencia a la ayuda del datawindow a imprimir y al de la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
DataWindowChild ldw_Ayuda_Preliminar, ldw_Ayuda_Impresion
// Guarda el nombre de la columna
string ls_Columna
//
////////////////////////////////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas
ll_Numero_Columnas = LONG( pdw_Datawindow.Describe( "DataWindow.Column.Count" ) )

// Recorremos las columans del datawindow
FOR ll_Indice=1 TO ll_Numero_Columnas

	// Comprobamos si el estilo de edici$$HEX1$$f300$$ENDHEX$$n es dropdowndatawindow
	IF  pdw_DataWindow.Describe( "#" + STRING( ll_indice ) + ".dddw.Name" ) <> "?" THEN

		// Si tiene ayuda
		// Recuperamos el nombre de la columna
		ls_Columna = pdw_DataWindow.Describe( "#"+STRING( ll_indice ) +".Name" )
		// Recuperamos la ayuda de ambos datawindows
		pdw_DataWindow.GetChild( ls_Columna , ldw_Ayuda_Impresion )		
		dw_impresion.GetChild( ls_Columna, ldw_Ayuda_Preliminar )		

		// Compartimos los datos
		ldw_Ayuda_Impresion.ShareData( ldw_Ayuda_Preliminar )		

	END IF

NEXT

end subroutine

private subroutine f_cambiar_datawindow (datawindow pdw_datos);////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	f_cambiar_datawindow para w_generica_impresion_preliminar
// 
// Objetivo:	Se trata de colocar en el datawindow de presentaci$$HEX1$$f300$$ENDHEX$$n preliminar el datawindow con
//			el $$HEX1$$ed00$$ENDHEX$$ndice pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  integer pi_Indice ( Indice del array de datawindows )
//	Salida:   
//						
// Devuelve:	--
//
//	Fecha			Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----				-----				---------
//	8-10-96			JCC				PM013
//
////////////////////////////////////////////////////////////////////////
// VARIABLES LOCALES

long li_apaisado = 513810, li_normal = 363300, li_zoom
string ls_ultimo
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de p$$HEX1$$e100$$ENDHEX$$ginas del documento actual
integer li_Paginas_Documento, li_indice
// Guarda el $$HEX1$$ed00$$ENDHEX$$ndice para recorrer el n$$HEX1$$fa00$$ENDHEX$$mero de p$$HEX1$$e100$$ENDHEX$$ginas a cargar
integer li_Paginas
// Guarda la sintaxis del datawindow 
string ls_Sintaxis


//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
DataWindowChild ldwc_imp_child
//*********************************************
//**  OSGI 2001.2  	24/10/2002					**
//**  Jair Padilla / Soluziona PANAMA  		**
//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
//*********************************************
//
////////////////////////////////////////////////////////////////////////

// Cancelamos el redibujado del datawindow de impresi$$HEX1$$f300$$ENDHEX$$n
THIS.SetRedraw( FALSE )




// Colocamos el nuevo documento a mostrar y lo conectamos con su padre
// Recuperamos la sintaxis del datawindow
if ist_impresion.compuesto = false then
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	If Len(Trim(ist_impresion.modify)) > 0 Then
		idw_DataWindow.GetChild("data_1", ldwc_imp_child)
		ldwc_imp_child.Modify(ist_impresion.modify)
	End If
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************

	li_zoom = f_zoom(idw_DataWindow,li_normal)
	ls_Sintaxis = idw_DataWindow.Describe("DataWindow.Syntax")
	
	// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow pasado como par$$HEX1$$e100$$ENDHEX$$metro
	IF dw_impresion.Create( ls_Sintaxis ) < 0 THEN CLOSE( THIS )
	IF dw_debajo.Create( ls_Sintaxis ) < 0 THEN CLOSE( THIS )


	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  	dw_impresion.SetTransObject(SQLCA)
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  	dw_debajo.SetTransObject(SQLCA)


	If Len(Trim(ist_impresion.modify)) > 0 Then
		dw_impresion.GetChild("data_1", ldwc_imp_child)
		ldwc_imp_child.Modify(ist_impresion.modify)
	End If
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************



	//Cargo la lista que se visualiza con los datos de la ventana anterior
	li_zoom = f_zoom(dw_impresion,li_normal)


	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  	dw_impresion.SetTransObject(SQLCA)
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************


	DataWindowChild dwc_preliminar
	dw_impresion.getchild ("data_1",dwc_preliminar)
	pdw_datos.sharedata(dwc_preliminar)
	
	dw_debajo.SetTransObject(SQLCA)
	
	//Cargo la lista que se imprime con los datos de la ventana anterior
	DataWindowChild dwc_debajo
	dw_debajo.getChild("data_1",dwc_debajo)
	pdw_datos.sharedata(dwc_debajo)
	dw_debajo.Modify("DataWindow.Zoom='" + string (li_zoom) + "'")


	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	dwc_debajo.Modify(ist_impresion.modify)
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
else

	ls_Sintaxis = idw_DataWindow.Describe("DataWindow.Syntax")
	
	// Creamos un objeto datawindow a partir de la sintaxis actual del datawindow pasado como par$$HEX1$$e100$$ENDHEX$$metro
	IF dw_impresion.Create( ls_Sintaxis ) < 0 THEN CLOSE( THIS )
	
//	dw_impresion.SetTransObject(SQLCA)
//	dw_debajo.SetTransObject(SQLCA)
   idw_datawindow.RowsCopy(1,idw_datawindow.rowcount(),Primary!,dw_impresion,1,primary!)

	DataWindowChild dwc_datos
	FOR li_indice = 1 to ist_impresion.total
		dw_impresion.getchild (ist_impresion.pa_nombres[li_indice],dwc_datos)
		ist_impresion.pa_todos[li_indice].sharedata(dwc_datos)
	NEXT
	if ist_impresion.zoom > 0 then dw_impresion.Modify("DataWindow.Zoom='" + string(ist_impresion.zoom) + "'")
end if


// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de p$$HEX1$$e100$$ENDHEX$$ginas que forman el documento
ii_Paginas = Integer( dw_impresion.Describe( "Evaluate('PageCount()',1)") )
	
// Si solo hay una p$$HEX1$$e100$$ENDHEX$$gina se deshabilitan los botones de pasar p$$HEX1$$e100$$ENDHEX$$ginas
IF ii_Paginas = 1 THEN
	pb_anterior.ENABLED = FALSE
	pb_siguiente.ENABLED = FALSE
ELSE
	pb_anterior.ENABLED = FALSE
	pb_siguiente.ENABLED = TRUE
END IF
	
//// Seteamos el numero de pagina actual
//ii_pagina_actual = 1
//	
//// Colocamos el nuevo $$HEX1$$ed00$$ENDHEX$$ndice actual que mostramos.
//ii_Indice = 1
//	
//dw_impresion.VScrollBar = TRUE
//dw_impresion.HScrollBar = TRUE
//	
//// Seteamos el minimo y maximo numero de pagina para spin
//em_1.MinMax = ("1 ~~ " + String(ii_paginas))
//em_2.MinMax = ("1 ~~ " + String(ii_paginas))
//	
//// Seteamos el valor inicial para la pagina inicio y final
//em_1.Text = "1"
//em_2.Text = String(ii_paginas)
//
dw_impresion.Modify( "DataWindow.Print.Preview=yes" )
dw_debajo.Modify( "DataWindow.Print.Preview=yes" )
THIS.SetRedraw( TRUE )

end subroutine

public subroutine f_imprimir_apaisado ();////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	f_imprimir_apaisado para w_generica_impresion_preliminar
// 
// Objetivo:	Se trata de imprimir todos los documentos.
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
//	Fecha			Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----				-----				---------
//	9-10-96			JCC				PM013
//
////////////////////////////////////////////////////////////////////////
//
// Modificamos el datawindow para que imprima el n$$HEX1$$fa00$$ENDHEX$$mero de copias especificado
dw_debajo.MODIFY( "Datawindow.Print.Copies='"+em_copias.Text + "'" )
dw_debajo.MODIFY( "Datawindow.Print.DocumentName='SGI listados'" )
dw_debajo.MODIFY( "Datawindow.Print.Paper.Size='9'")
dw_debajo.MODIFY( "Datawindow.Print.Orientation='1'")


end subroutine

public function long f_zoom (datawindow pdw_datawindow, long pi_hoja);//
//Funcion que calcula el zoom que se debe aplicar a la dw para que se ajuste al papel
//

int li_margen_d, li_margen_i, li_total, li_ancho, li_columna, li_porcentaje
int li_coe_error = 5
string ls_margen_d, ls_margen_i, ls_columna, ls_wid, ls_visible, ls_nombre

DatawindowChild dwc_listado

//Obtengo los margenes del papel
ls_margen_d = pdw_DataWindow.Describe("DataWindow.Print.Margin.Left")
ls_margen_i = pdw_DataWindow.Describe("DataWindow.Print.Margin.Right")
li_margen_d = integer(ls_margen_d)
li_margen_i = integer(ls_margen_i)


//Obtengo la dw que contiene los datos
pdw_DataWindow.getchild("data_1", dwc_listado)



//Calculo el ancho de la dw
ls_columna = dwc_listado.describe("DataWindow.Column.Count")
li_total = integer(ls_columna)
li_ancho = 0

FOR li_columna = 1 TO li_total
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  	ls_visible = dwc_listado.Describe("#" + string(li_columna) + ".visible")

	ls_nombre = dwc_listado.Describe("#" + string(li_columna) + ".name")
	ls_visible = dwc_listado.Describe(ls_nombre + ".visible")
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	IF ls_visible <> '0' THEN
		ls_nombre=dwc_listado.Describe("#" + string(li_columna) + ".name")
		ls_wid = dwc_listado.Describe(ls_nombre + "_t" + ".width")
		li_ancho = li_ancho + integer(ls_wid)
	END IF
NEXT
if li_ancho > 0 then
	li_ancho = li_ancho + li_margen_i + li_margen_d


	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	If li_ancho > 9900 Then 
		If cbx_ajustar.Checked And ib_clicked Then
			li_coe_error += 1
		Else
			li_coe_error = 3
		End If
	End If
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************


	li_porcentaje = (pi_hoja / li_ancho) - li_coe_error
		
	pdw_datawindow.MODIFY("DataWindow.Zoom = '" + string(li_porcentaje) + "'")


	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  	pdw_DataWindow.Modify("d_1.Width= '9900'")


	pdw_DataWindow.Modify("data_1.Width= '25000'")
	//*********************************************
	//**  OSGI 2001.2  	24/10/2002					**
	//**  Jair Padilla / Soluziona PANAMA  		**
	//**  IMPRIMIR COLUMNAS DIMANICAS HIST INST  **
	//*********************************************
end if

if li_total= 0 then
	li_porcentaje=95
	pdw_datawindow.MODIFY("DataWindow.Zoom = '" + string(li_porcentaje) + "'")
	pdw_DataWindow.Modify("data_1.Width= '25000'")
end if

return li_porcentaje
end function

event open;call super::open;////////////////////////////////////////////////////////////////////////
//
// Evento:	open w_generica_impresion_preliminar
//
// Objetivo:	Recuperamos los valores pasados a la ventana
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		-----			---------
//						Versi$$HEX1$$f300$$ENDHEX$$n original
//
////////////////////////////////////////////////////////////////////////

// Recuperamos la estructura pasada
ist_Impresion = message.PowerObjectParm
dw_impresion.Reset()
dw_debajo.Reset()
// Colocamos el datawindow en su nueva posici$$HEX1$$f300$$ENDHEX$$n
dw_impresion.Width = THIS.Width - 40
dw_impresion.Height = THIS.Height -350

// Puedo imprimir un dw de tipo lista, un dw compuesto por varios dw, un dw grafico
if ist_impresion.compuesto = true then
	//Impresion de dw compuesta y dw grafico
	// Cargamos los valores de instancia
	idw_DataWindow = ist_impresion.pdw_compuesto
	
	// Habilitamos el datawindow a mostrar
	f_cambiar_datawindow(ist_impresion.pdw_compuesto)
	
	//En un dw compuesto o dw grafico la impresion siempre sera vertical
	cb_horizontal.enabled=false
	cb_vertical.enabled=false
	cbx_ajustar.enabled=false
	em_1.enabled = false
	em_2.enabled = false
	cb_2.enabled = false
else
	//Impresion de dw de tipo lista
	// Cargamos los valores de instancia
	idw_DataWindow = ist_impresion.pdw_datawindow
	
	// Habilitamos el datawindow a mostrar
	f_cambiar_datawindow(ist_impresion.pdw_lista)
end if

// Colocamos el n$$HEX1$$fa00$$ENDHEX$$mero de copias a 1
em_copias.text = "1"

// Asignamos el titulo del documento
sle_documento.text = idw_datawindow.describe("titulo_t.Text")
sle_documento.Enabled = False
end event

event resize;////////////////////////////////////////////////////////////////////////
//
// Evento:	RESIZE para W_GENERICA_IMPRESION_PRELIMINAR
//
// Objetivo:	Se trata de colocar el datawindow con el tama$$HEX1$$f100$$ENDHEX$$o m$$HEX1$$e100$$ENDHEX$$ximo de la ventana.
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	8-10-96		JCC				PM013
//
////////////////////////////////////////////////////////////////////////


end event

on w_generica_impresion_preliminar.create
int iCurrent
call super::create
this.st_4=create st_4
this.cb_imprimir=create cb_imprimir
this.cbx_ajustar=create cbx_ajustar
this.cb_horizontal=create cb_horizontal
this.cb_vertical=create cb_vertical
this.sle_documento=create sle_documento
this.st_3=create st_3
this.em_2=create em_2
this.cb_2=create cb_2
this.em_1=create em_1
this.cb_1=create cb_1
this.pb_anterior=create pb_anterior
this.pb_siguiente=create pb_siguiente
this.em_copias=create em_copias
this.st_1=create st_1
this.pb_cerrar=create pb_cerrar
this.pb_imprimir_documento=create pb_imprimir_documento
this.st_2=create st_2
this.ddlb_zoom=create ddlb_zoom
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_debajo=create dw_debajo
this.dw_impresion=create dw_impresion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.cb_imprimir
this.Control[iCurrent+3]=this.cbx_ajustar
this.Control[iCurrent+4]=this.cb_horizontal
this.Control[iCurrent+5]=this.cb_vertical
this.Control[iCurrent+6]=this.sle_documento
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.em_2
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.em_1
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.pb_anterior
this.Control[iCurrent+13]=this.pb_siguiente
this.Control[iCurrent+14]=this.em_copias
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.pb_cerrar
this.Control[iCurrent+17]=this.pb_imprimir_documento
this.Control[iCurrent+18]=this.st_2
this.Control[iCurrent+19]=this.ddlb_zoom
this.Control[iCurrent+20]=this.gb_3
this.Control[iCurrent+21]=this.gb_2
this.Control[iCurrent+22]=this.gb_1
this.Control[iCurrent+23]=this.dw_debajo
this.Control[iCurrent+24]=this.dw_impresion
end on

on w_generica_impresion_preliminar.destroy
call super::destroy
destroy(this.st_4)
destroy(this.cb_imprimir)
destroy(this.cbx_ajustar)
destroy(this.cb_horizontal)
destroy(this.cb_vertical)
destroy(this.sle_documento)
destroy(this.st_3)
destroy(this.em_2)
destroy(this.cb_2)
destroy(this.em_1)
destroy(this.cb_1)
destroy(this.pb_anterior)
destroy(this.pb_siguiente)
destroy(this.em_copias)
destroy(this.st_1)
destroy(this.pb_cerrar)
destroy(this.pb_imprimir_documento)
destroy(this.st_2)
destroy(this.ddlb_zoom)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_debajo)
destroy(this.dw_impresion)
end on

event close;int li_indice

if ist_impresion.compuesto = false then
	ist_impresion.pdw_lista.ShareDataOff()
	ist_impresion.pdw_datawindow.ShareDataOff()
else
	for li_indice = 1 to ist_impresion.total
	    ist_impresion.pa_todos[li_indice].ShareDataOff()
	next
end if

cb_vertical.TriggerEvent(clicked!)
this.setRedraw(true)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_generica_impresion_preliminar
end type

type st_4 from statictext within w_generica_impresion_preliminar
integer x = 2615
integer y = 96
integer width = 169
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Pag"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_generica_impresion_preliminar
integer x = 2350
integer y = 80
integer width = 238
integer height = 88
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;int indice
string ls_fin


if ist_impresion.compuesto = true then
	//Como no puedo cambiar la posicion del dw imprimo la que estoy viendo
	
	dw_impresion.setredraw(false)
//	dw_impresion.Modify("DataWindow.Print.Page.RangeInclude='1' ")
//	dw_impresion.Modify("DataWindow.Print.Page.Range=' (i.e. " + em_1.text + "-" + em_2.text + ")' ")
	dw_impresion.MODIFY( "Datawindow.Print.Copies='"+em_copias.Text + "'" )
//	dw_impresion.Modify( "DataWindow.Print.Preview.Zoom='100'" )
	dw_impresion.MODIFY( "Datawindow.Print.DocumentName='SGI listados'" )
	dw_impresion.Print()
else
	ls_fin = ''
	for indice=integer(em_1.text)	to integer(em_2.text)
		if indice = integer(em_2.text) then
			ls_fin = ls_fin +  string(indice)
		else
			ls_fin = ls_fin +  string(indice) + ',' 
		end if
	next
	
	if ls_fin <> '0' then
		dw_debajo.Modify("DataWindow.Print.Page.RangeInclude='0' ")
		dw_debajo.Modify("DataWindow.Print.Page.Range='" + ls_fin +  "'")
	end if
	
	dw_debajo.MODIFY( "Datawindow.Print.Copies='"+em_copias.Text + "'" )
	dw_debajo.MODIFY( "Datawindow.Print.DocumentName='SGI listados'" )
	dw_debajo.Print()
end if
end event

type cbx_ajustar from checkbox within w_generica_impresion_preliminar
integer x = 1659
integer y = 88
integer width = 242
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ajustar"
boolean checked = true
end type

event clicked;long ll_zoom

IF Ib_clicked THEN
	dw_impresion.MODIFY( "Datawindow.Print.Paper.Size='9'")
	dw_impresion.MODIFY( "Datawindow.Print.Orientation='1'")
	IF cbx_ajustar.checked THEN //ajusto a horizontal
		ll_zoom = f_zoom (dw_impresion,513810)
	ELSE
		ll_zoom = f_zoom (dw_impresion,363300)
	END IF
ELSE
	dw_impresion.MODIFY( "Datawindow.Print.Size='9'")
	dw_impresion.MODIFY( "Datawindow.Print.Orientation='2'")
	ll_zoom = f_zoom (dw_impresion,363300)
END IF
end event

type cb_horizontal from commandbutton within w_generica_impresion_preliminar
integer x = 1906
integer y = 80
integer width = 242
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = " &Horizontal "
end type

event clicked;long ll_zoom

ib_clicked = true

dw_impresion.SetRedraw(False)

dw_impresion.MODIFY( "Datawindow.Print.Paper.Size='9'")
dw_impresion.MODIFY( "Datawindow.Print.Orientation='1'")

IF cbx_ajustar.checked THEN //ajusto a horizontal
	ll_zoom = f_zoom (dw_impresion,513810)
	ll_zoom = f_zoom (dw_debajo,513810)
ELSE // No ajusto a horizontal
	ll_zoom = f_zoom (dw_impresion,363300)
	ll_zoom = f_zoom (dw_debajo,363300)
END IF

// Modificamos el datawindow para que se visualice apaisado
dw_debajo.MODIFY( "Datawindow.Print.Paper.Size='9'")
dw_debajo.MODIFY( "Datawindow.Print.Orientation='1'")

dw_impresion.SetRedraw(True)
end event

type cb_vertical from commandbutton within w_generica_impresion_preliminar
integer x = 2149
integer y = 80
integer width = 201
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Vertical"
end type

event clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	clicked para pb_imprimir_documento
//
// Objetivo:	Se trata de imprimir el documento VISUALIZADO actualmente
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	29/11/2000	  GSH					Creacion
//
////////////////////////////////////////////////////////////////////////
long ll_zoom

ib_clicked = false

dw_impresion.SetRedraw(False)

dw_impresion.MODIFY( "Datawindow.Print.Size='9'")
dw_impresion.MODIFY( "Datawindow.Print.Orientation='2'")

dw_debajo.MODIFY( "Datawindow.Print.Size='9'")
dw_debajo.MODIFY( "Datawindow.Print.Orientation='2'")

ll_zoom = f_zoom (dw_debajo,363300)
ll_zoom = f_zoom (dw_impresion,363300)

dw_impresion.SetRedraw(True)
end event

type sle_documento from singlelineedit within w_generica_impresion_preliminar
integer x = 174
integer y = 88
integer width = 718
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
boolean border = false
boolean autohscroll = false
end type

type st_3 from statictext within w_generica_impresion_preliminar
integer x = 2994
integer y = 100
integer width = 82
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "a"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_2 from editmask within w_generica_impresion_preliminar
integer x = 3077
integer y = 76
integer width = 215
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
string displaydata = ""
string minmax = "1~~99999"
end type

event modified;//// Va a cambiar el maximo valor permitido para spin de lo numero de pagina inicio
//
//Integer li_ultima_pagina
//
//li_ultima_pagina = Integer( em_2.text )
//
//em_1.MinMax = ("1 ~~ " + String(li_ultima_pagina))
//
//IF Integer(em_1.Text) > li_ultima_pagina THEN
//	em_1.Text = String(li_ultima_pagina)
//END IF
//
//IF Integer(em_2.Text) > Integer(em_1.Text) THEN
//	cb_2.Enabled = TRUE
//ELSE
//	cb_2.Enabled = FALSE
//END IF
//
end event

type cb_2 from commandbutton within w_generica_impresion_preliminar
boolean visible = false
integer x = 2629
integer y = 80
integer width = 174
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&P$$HEX1$$e100$$ENDHEX$$g."
end type

event clicked;//// guarda la dimensi$$HEX1$$f300$$ENDHEX$$n del array de documentos ( datawindows ) a imprimir y un indice para recorrerlo
//integer  li_cant_pag, li_cant_pag_fin
//
//li_cant_pag = Integer( em_1.text )
//li_cant_pag_fin = Integer( em_2.text )
//
//IF li_cant_pag > li_cant_pag_fin THEN RETURN
//
//dw_debajo.Modify("DataWindow.Print.Page.Range='"+string(li_cant_pag)+"-"+string(li_cant_pag_fin)+"'")
//dw_debajo.Print()
//
end event

type em_1 from editmask within w_generica_impresion_preliminar
integer x = 2784
integer y = 80
integer width = 215
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
string displaydata = ""
string minmax = "1~~99999"
end type

event modified;//// Va a cambiar el minimo valor permitido para spin de lo numero de pagina fin
//Integer li_primera_pagina
//
//li_primera_pagina = Integer( em_1.text )
//
//em_2.MinMax = (String(li_primera_pagina) + " ~~ " + String(ii_paginas))
//
//IF Integer(em_2.Text) < li_primera_pagina THEN
//	em_2.Text = String(li_primera_pagina)
//END IF
//
//IF Integer(em_2.Text) > Integer(em_1.Text) THEN
//	cb_2.Enabled = TRUE
//ELSE
//	cb_2.Enabled = FALSE
//END IF
//
end event

type cb_1 from commandbutton within w_generica_impresion_preliminar
boolean visible = false
integer x = 2386
integer y = 68
integer width = 183
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "$$HEX1$$da00$$ENDHEX$$ltima"
end type

event clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	Evento clicked del boton imprimir la ultima hoja
// 
// Objetivo:	Se trata de imprimir la ultima hoja.
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
//	Fecha			Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----				-----				---------
//	4/12/98
//
////////////////////////////////////////////////////////////////////////
// VARIABLES LOCALES
//
// guarda la dimensi$$HEX1$$f300$$ENDHEX$$n del array de documentos ( datawindows ) a imprimir y un indice para recorrerlo
integer li_Dimension, li_Indice, li_cant_pag
//
////////////////////////////////////////////////////////////////////////

// Abrimos el trabajo de impresi$$HEX1$$f300$$ENDHEX$$n, pasandole como nombre del documento a imprimir
// el nombre del documento pasado como par$$HEX1$$e100$$ENDHEX$$metro.

// Recuperamos el array de documentos a imprimir
//li_Dimension = UPPERBOUND( idw_DataWindow )


//FOR li_Indice = 1 TO li_Dimension
//	li_cant_pag = Integer( idw_DataWindow[ li_Indice ].Describe( "Evaluate('PageCount()',1)") )
//	// Modificamos el datawindow para que imprima el n$$HEX1$$fa00$$ENDHEX$$mero de copias especificado
//	idw_DataWindow[ li_Indice ].MODIFY( "Datawindow.Print.Copies="+em_copias.Text )
//
//	// Accedo a la ultima pagina
//	idw_DataWindow[ li_Indice ].Modify("DataWindow.Print.Page.Range='"+string(li_cant_pag)+"'")
//
//	// Imprimimos el datawindow actual
//	idw_DataWindow[ li_Indice ].Print()
//
//NEXT

li_cant_pag = Integer( dw_impresion.Describe( "Evaluate('PageCount()',1)") )
idw_DataWindow.Modify("DataWindow.Print.Page.Range='"+string(li_cant_pag)+"'")
idw_DataWindow.Print()
end event

type pb_anterior from picturebutton within w_generica_impresion_preliminar
boolean visible = false
integer x = 933
integer y = 80
integer width = 105
integer height = 88
integer taborder = 150
integer textsize = -11
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
string facename = "Wingdings"
string text = "$$HEX1$$e700$$ENDHEX$$"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	clicked para pb_anterior
//
// Objetivo:	Se ha seleccionado ir a la p$$HEX1$$e100$$ENDHEX$$gina anterior. 
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	21-10-96	JCC				PM013
//
////////////////////////////////////////////////////////////////////////

// Pasamos a la anterior p$$HEX1$$e100$$ENDHEX$$gina
dw_impresion.ScrollPriorPage()

// Indicamos el n$$HEX1$$fa00$$ENDHEX$$mero de p$$HEX1$$e100$$ENDHEX$$gina actual.
ii_Pagina_Actual --

// Si la p$$HEX1$$e100$$ENDHEX$$gina actual es 1 no se puede retroceder m$$HEX1$$e100$$ENDHEX$$s
IF ii_Pagina_Actual = 1 THEN
	THIS.ENABLED = FALSE
ELSE
	THIS.ENABLED = TRUE
END IF

// Si la pagina actual es la ultima no se puede ir adelante
IF ii_pagina_actual < ii_paginas THEN
	pb_siguiente.ENABLED = TRUE
ELSE
	pb_siguiente.ENABLED = FALSE
END IF

end event

type pb_siguiente from picturebutton within w_generica_impresion_preliminar
boolean visible = false
integer x = 1038
integer y = 80
integer width = 105
integer height = 88
integer taborder = 140
integer textsize = -11
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
string facename = "Wingdings"
string text = "$$HEX1$$e800$$ENDHEX$$"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	clicked para pb_siguiente
//
// Objetivo:	Se ha seleccionado ir a la p$$HEX1$$e100$$ENDHEX$$gina siguiente.  
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	21-10-96	JCC				PM013
//
////////////////////////////////////////////////////////////////////////

// Pasamos a la siguiente p$$HEX1$$e100$$ENDHEX$$gina
dw_impresion.ScrollNextPage()

// Indicamos el n$$HEX1$$fa00$$ENDHEX$$mero de p$$HEX1$$e100$$ENDHEX$$gina actual.
ii_Pagina_Actual ++

// Si la p$$HEX1$$e100$$ENDHEX$$gina actual es la $$HEX1$$fa00$$ENDHEX$$ltima p$$HEX1$$e100$$ENDHEX$$gina no se puede avanzar m$$HEX1$$e100$$ENDHEX$$s
IF ii_Pagina_Actual = ii_Paginas THEN
	THIS.ENABLED = FALSE
ELSE
	THIS.ENABLED = TRUE
END IF

// Si la pagina actual es la primera no se puede retroceder m$$HEX1$$e100$$ENDHEX$$s
IF ii_pagina_actual > 1 THEN
	pb_anterior.ENABLED = TRUE
ELSE
	pb_anterior.ENABLED = FALSE
END IF

end event

type em_copias from editmask within w_generica_impresion_preliminar
integer x = 1445
integer y = 80
integer width = 187
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "1~~999"
end type

type st_1 from statictext within w_generica_impresion_preliminar
integer x = 1216
integer y = 88
integer width = 233
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Copias:"
boolean focusrectangle = false
end type

type pb_cerrar from picturebutton within w_generica_impresion_preliminar
integer x = 3305
integer y = 80
integer width = 201
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cerrar"
end type

on clicked;CLOSE( PARENT )
end on

type pb_imprimir_documento from picturebutton within w_generica_impresion_preliminar
boolean visible = false
integer x = 2002
integer y = 84
integer width = 146
integer height = 88
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Doc."
boolean originalsize = true
end type

on clicked;////////////////////////////////////////////////////////////////////////
//
// Evento:	clicked para pb_imprimir_documento
//
// Objetivo:	Se trata de imprimir el documento VISUALIZADO actualmente
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	9-10-96		JCC				PM013
//
////////////////////////////////////////////////////////////////////////

f_imprimir_documento()
end on

type st_2 from statictext within w_generica_impresion_preliminar
integer x = 14
integer y = 88
integer width = 160
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Doc.:"
boolean focusrectangle = false
end type

type ddlb_zoom from dropdownlistbox within w_generica_impresion_preliminar
integer x = 891
integer y = 76
integer width = 329
integer height = 660
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
string text = "100"
boolean autohscroll = true
boolean vscrollbar = true
string item[] = {"200%","150%","100%"," 75%"," 50%"," 25%"," 10%"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;////////////////////////////////////////////////////////////////////////
//
// Evento:	selectionchanged para ddlb_zoom
//
// Objetivo:	Al modificarse el zoom se modifica el zoom que se presenta
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//	Fecha		Resp.			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----				---------
//	8-1096		JCC				PM013
//
////////////////////////////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Guarda el valor de zoom a realizar
string ls_Zoom
//
////////////////////////////////////////////////////////////////////////

// Recuperamos el valor de ZOOM a aplicar
ls_Zoom = TRIM( LEFT( this.Text, 3) )
dw_impresion.setredraw(true)
// Realizamos el ZOOM
dw_impresion.Modify( "DataWindow.Print.Preview.Zoom="+ls_Zoom )
end event

type gb_3 from groupbox within w_generica_impresion_preliminar
integer x = 1646
integer y = 16
integer width = 960
integer height = 180
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_generica_impresion_preliminar
integer x = 5
integer y = 16
integer width = 1641
integer height = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

type gb_1 from groupbox within w_generica_impresion_preliminar
integer x = 2606
integer y = 16
integer width = 923
integer height = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

type dw_debajo from datawindow within w_generica_impresion_preliminar
boolean visible = false
integer x = 14
integer y = 252
integer width = 763
integer height = 456
integer taborder = 70
borderstyle borderstyle = stylelowered!
end type

type dw_impresion from datawindow within w_generica_impresion_preliminar
integer y = 224
integer width = 763
integer height = 456
integer taborder = 60
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


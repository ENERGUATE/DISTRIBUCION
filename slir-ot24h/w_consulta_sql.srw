HA$PBExportHeader$w_consulta_sql.srw
forward
global type w_consulta_sql from window
end type
type tab_1 from tab within w_consulta_sql
end type
type tabpage_select from userobject within tab_1
end type
type dw_select from datawindow within tabpage_select
end type
type tabpage_select from userobject within tab_1
dw_select dw_select
end type
type tabpage_where from userobject within tab_1
end type
type dw_where from datawindow within tabpage_where
end type
type tabpage_where from userobject within tab_1
dw_where dw_where
end type
type tabpage_sintaxis from userobject within tab_1
end type
type mle_sintax from multilineedit within tabpage_sintaxis
end type
type tabpage_sintaxis from userobject within tab_1
mle_sintax mle_sintax
end type
type tab_1 from tab within w_consulta_sql
tabpage_select tabpage_select
tabpage_where tabpage_where
tabpage_sintaxis tabpage_sintaxis
end type
type st_1 from statictext within w_consulta_sql
end type
type dw_1 from datawindow within w_consulta_sql
end type
type st_4 from statictext within w_consulta_sql
end type
end forward

global type w_consulta_sql from window
integer x = 5
integer y = 4
integer width = 3790
integer height = 2460
boolean titlebar = true
string title = "OPEN SGI - Edici$$HEX1$$f300$$ENDHEX$$n de Informes"
string menuname = "m_consulta_sql"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 79741120
string icon = "sql.ico"
event ue_armar_sql ( )
event ue_eliminar_fila ( )
event ue_grabar_pref ( )
event ue_grabar_rep ( )
event ue_abrir_pref ( )
event ue_abrir_rep ( )
event ue_transferencia ( )
event ue_limpiar_pantalla ( )
event ue_imprimir ( )
event ue_agregar_fila ( )
event ue_abrir_parentesis ( )
event ue_cerrar_parentesis ( )
event ue_eliminar_par_abierto ( )
event ue_eliminar_par_cerrado ( )
event ue_exportar_excel ( )
tab_1 tab_1
st_1 st_1
dw_1 dw_1
st_4 st_4
end type
global w_consulta_sql w_consulta_sql

type variables
u_5001_nu_reportes iu_5001_nu
ds_5001_reportes iu_ds_reportes
u_generico_comunicaciones	iu_comunic

boolean ib_hay
end variables

forward prototypes
public function string fw_preparar_archivo ()
public function integer fw_interpretar_archivo (string ps_preferencia, integer pi_tipo)
public function integer wf_determinar_sentencia ()
public function boolean wf_tabla_no_repetida (string ps_tabla, integer pi_posicion)
public function integer wf_insertar_filas_claus_where ()
public function integer wf_opciones_menu ()
public function integer wf_inicializar_select ()
public function string wf_construye_group_by ()
public function integer wf_insertar_campos (integer pi_fila, string ps_tabla, string ps_display)
end prototypes

event ue_armar_sql;///////////////////////////////////////////////////////
//										
// Evento: ue_armar_sql
// 
// Objetivo: Evento que crea el informe a partir de la sentencia Select del usuario
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------  ---------
// 20/12/2000	LFE		    Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

setpointer(Hourglass!)
int li_fila, li_res, li_contacampos
long ll_conta
string ls_campo, ls_colcount
string ls_array_campos[] 
boolean lb_join


tab_1.tabpage_select.dw_select.AcceptText()

// El nombre de las cabeceras se obtiene de los campos seleccionados en dw_select. En caso de
// existir un alias para el campo seleccionado, se escoger$$HEX2$$e1002000$$ENDHEX$$como cabecer$$HEX2$$e1002000$$ENDHEX$$el alias, y en el 
// caso de no existir se escoger$$HEX2$$e1002000$$ENDHEX$$el nombre de la tabla
FOR li_fila = 1 to tab_1.tabpage_select.dw_select.RowCount()
	ls_campo = tab_1.tabpage_select.dw_select.GetItemString(li_fila, 'ps_alias')
	IF ls_campo = '' OR ls_campo = ' ' OR ISNULL(ls_campo) THEN
		// No existe alias, por consiguiente se coge el nombre del campo
		ls_campo = tab_1.tabpage_select.dw_select.GetItemString(li_fila, 'ps_columna')
	END IF
	ls_array_campos[li_fila] = ls_campo
NEXT

li_contacampos = tab_1.tabpage_select.dw_select.RowCount()
dw_1.visible=false

// Se construye la sentencia Select
IF wf_determinar_sentencia() = 0 THEN
	// Error: Alguna parte de la WHERE se encuentra sin datos
	gnv_msg.F_MENSAJE("MF05","","",ok!)
ELSE

	// Se construye el informe
	li_res=iu_5001_nu.fnu_obtener_datos_2(tab_1.tabpage_sintaxis.mle_sintax.Text,w_consulta_sql.dw_1,lb_join)
	if li_res > 0 then
		
		iu_5001_nu.fnu_cambio_nombres(ls_array_campos[],ls_array_campos[],&
												li_contacampos,w_consulta_sql.dw_1)
	
		iu_5001_nu.f_preparo_datawindow(w_consulta_sql.dw_1,ls_array_campos[])
	
		ls_colcount = dw_1.Object.DataWindow.Column.Count
		for ll_conta=1 to long(ls_colcount)
			dw_1.settaborder(ll_conta,0)
		next
			setpointer(Arrow!)
			gnv_msg.f_mensaje("IA09","","",ok!)
	else
		return	
	end if
	dw_1.visible=true
END IF

end event

event ue_eliminar_fila;////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_eliminar_fila
//
// Objetivo: Evento que elimina la fila seleccionada en dw_select si se est$$HEX2$$e1002000$$ENDHEX$$en el 
//				 tabpage Select, o se elimina de dw_where si se est$$HEX2$$e1002000$$ENDHEX$$en el tabpage Where
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 20/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

CHOOSE CASE tab_1.SelectedTab
	CASE 1  // tabpage Select
		// Se elimina la fila
		tab_1.tabpage_select.dw_select.SetRedraw(False)
		tab_1.tabpage_select.dw_select.Deleterow(tab_1.tabpage_select.dw_select.Getrow())
		tab_1.tabpage_select.dw_select.AcceptText()
		// Se actualiza el contenido de los operadores de la datawindow dw_where
		wf_insertar_filas_claus_where()
		tab_1.tabpage_select.dw_select.SetRedraw(True)
	CASE 2  // tabpage Where
		// Se elimina la fila
		tab_1.tabpage_where.dw_where.SetRedraw(False)
		tab_1.tabpage_where.dw_where.DeleteRow(tab_1.tabpage_where.dw_where.Getrow())
		tab_1.tabpage_where.dw_where.AcceptText()
		tab_1.tabpage_where.dw_where.SetRedraw(True)
END CHOOSE

wf_opciones_menu()

end event

event ue_grabar_pref;///////////////////////////////////////////////////////
//										
// Evento: ue_grabar_pref
// 
// Objetivo: Graba el fichero de preferencias que el
//           usuario ha escogido
//	
//
// Responsables:  FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_docname, ls_named, ls_documento
integer li_value, li_numfila
long ll_pos

li_value = GetFileSaveName("Grabar Preferencias",  & 
	ls_docname, ls_named, "PRC",  &
	"Archivos de Preferencias (*.PRC),*.PRC," +  &
	"Todos los Archivos (*.*), *.*")
	
ll_pos=pos(upper(ls_docname),".PRC")

ls_documento = fw_preparar_archivo() // trae el string del archivo
	
li_numfila=fileopen(ls_docname,StreamMode!,write!,LockReadWrite!,Replace!)
if li_numfila> 0 then
	if ll_pos>0 then	
		filewrite(li_numfila,ls_documento) //Graba un archivo por detras con configuraciones de la DW
		// mensage de archivo fue salvado con exito 
		gnv_msg.F_MENSAJE("CG06","","",ok!)
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	end if
	fileclose(li_numfila)
end if 



end event

event ue_grabar_rep();///////////////////////////////////////////////////////
//										
// Evento: ue_grabar_rep
// 
// Objetivo: Graba el reporte que el usuario ha generado
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_docname, ls_named, ls_documento, ls_data, ls_syntaxis, ls_contenido,&
		 ls_contenido_parcial, ls_cadena
integer li_value, li_numfila, li_retorno, li_numfich
long ll_pos, ll_num_car_escritos, ll_longitud, ll_num_car
Boolean lb_todo_escrito = FALSE

IF dw_1.rowcount() > 0 THEN

	li_value = GetFileSaveName("Grabar Informe SQL",  & 
		ls_docname, ls_named, "RPC",  &
		"Archivos de Informe SQL (*.RPC),*.RPC," +  &
		"Todos los Archivos (*.*), *.*")
		
	ll_pos=pos(upper(ls_docname),".RPC")

	ls_documento = fw_preparar_archivo() // trae el string del archivo
	
//	ls_data = "DATA%" + dw_1.Object.DataWindow.Data + "%" 
	ls_syntaxis= "Sintaxis~$$HEX1$$a500$$ENDHEX$$" + dw_1.Describe("DataWindow.Syntax") + "~$$HEX1$$a500$$ENDHEX$$"
//	ls_documento = ls_documento + ls_data + ls_syntaxis

	li_retorno = dw_1.SaveAs(ls_docname,Text!, False)

//	IF li_retorno = 1 THEN
		
//		li_numfila=fileopen(ls_named,StreamMode!,write!,LockReadWrite!,Append!)
//		IF li_numfila > 0 THEN 
//			if ll_pos>0 then	
//				DO
//					ll_num_car_escritos = filewrite(li_numfila,ls_syntaxis)
//					IF ll_num_car_escritos < Len(ls_syntaxis) THEN
//						ls_documento = Replace(ls_syntaxis, 1, Len(ls_syntaxis), Mid(ls_syntaxis, ll_num_car_escritos+1))
//					ELSE
//						lb_todo_escrito = TRUE
//					END IF
//				LOOP WHILE lb_todo_escrito = FALSE
//		
//				fileclose(li_numfila)		
//			ELSE
//				gnv_msg.F_MENSAJE("MF01","","",ok!)
//			END IF
//		ELSE
//			gnv_msg.F_MENSAJE("MF01","","",ok!)
//		END IF
//	END IF
//END IF

	ll_longitud = FileLength(ls_docname)
	li_numfich=fileopen(ls_docname,StreamMode!)
	IF ll_pos > 0 THEN
		ls_contenido = ''
		DO
			ll_num_car = fileread(li_numfich,ls_contenido_parcial)
			IF ll_num_car > 0 THEN
				ls_contenido = ls_contenido + ls_contenido_parcial
				ll_longitud = ll_longitud - ll_num_car
			ELSE
				ll_longitud = 0
			END IF
		LOOP WHILE ll_longitud > 0
		fileclose(li_numfich)	
	END IF
	
	li_numfila=fileopen(ls_named,StreamMode!,write!,LockReadWrite!,Replace!)
	IF li_numfila > 0 THEN
		ls_cadena = ls_documento + "DATA~$$HEX1$$de00$$ENDHEX$$" + ls_contenido + "~$$HEX1$$de00$$ENDHEX$$" + ls_syntaxis
		DO
			ll_num_car_escritos =filewrite(li_numfila, ls_cadena)
			IF ll_num_car_escritos < Len(ls_cadena) THEN
				ls_cadena = Replace(ls_cadena, 1, Len(ls_cadena), Mid(ls_cadena, ll_num_car_escritos+1))
			ELSE
				lb_todo_escrito = TRUE
			END IF
		LOOP WHILE lb_todo_escrito = FALSE
		fileclose(li_numfila)
		gnv_msg.F_MENSAJE("CG06","","",ok!)	
	END IF
END IF
end event

event ue_abrir_pref;///////////////////////////////////////////////////////
//										
// Evento: ue_abrir_pref
// 
// Objetivo: Abre el fichero de preferencias que el
//           usuario ha escogido
//	
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//					JAM
//
///////////////////////////////////////////////////////

string ls_docname, ls_named , ls_contenido
integer li_value,li_numfila, li_contador
boolean lb_fila_sel
long ll_pos

setpointer(HourGlass!)

li_value = GetFileOpenName("Abrir Preferencia SQL",  &
	+ ls_docname, ls_named, "PRC",  &
	+ "Archivos de Preferencias (*.PRC),*.PRC,"  &
	+ "Todos los Archivos (*.*),*.*")

ll_pos=pos(upper(ls_docname),".PRC")

IF li_value = 1 THEN 
	li_numfila=FileOpen(ls_docname,StreamMode!)
	IF LL_POS > 0 THEN
		fileread(li_numfila,ls_contenido)	
		LI_VALUE=fw_interpretar_archivo(ls_contenido,0)
		if li_value<>1 then
			gnv_msg.F_MENSAJE("MF01","","",ok!)
		end if
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	END IF
END IF
dw_1.visible=false
fileclose(li_numfila)
wf_determinar_sentencia()
setpointer(Arrow!)
end event

event ue_abrir_rep;/////////////////////////////////////////////////////////
////
//// Evento: ue_abrir_rep
//// 
//// Objetivo: Abre el reporte generado en Consulta SQL que el usuario seleccione
////
//// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ------	   -----------   ---------
////					JAM
/////////////////////////////////////////////////////////

string ls_docname,  ls_named , ls_contenido, ls_contenido_parcial
integer li_value,li_numfich, li_contador
boolean lb_fila_sel
long ll_pos, ll_num_car, ll_longitud

setpointer(HourGlass!)

li_value = GetFileOpenName("Abrir Informe SQL",  &
	+ ls_docname, ls_named, "RPC",  &
	+ "Archivos de Informes (*.RPC),*.RPC,"  &
	+ "Todos los Archivos (*.*),*.*")

ll_pos=pos(upper(ls_docname),".RPC")

IF li_value = 1 THEN 
	
	ll_longitud = FileLength(ls_docname)
	li_numfich=fileopen(ls_docname,StreamMode!)
	
	IF ll_pos > 0 THEN
		ls_contenido = ''
		DO
			ll_num_car = fileread(li_numfich,ls_contenido_parcial)
			IF ll_num_car > 0 THEN
				ls_contenido = ls_contenido + ls_contenido_parcial
				ll_longitud = ll_longitud - ll_num_car
			ELSE
				ll_longitud = 0
			END IF
		LOOP WHILE ll_longitud > 0
		
		LI_VALUE = fw_interpretar_archivo(ls_contenido, 1)
		if li_value <> 1 then
			gnv_msg.F_MENSAJE("MF01","","",ok!)
			This.SetRedraw(true)
		else
			dw_1.visible=true
			wf_determinar_sentencia()
		end if
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
		This.SetRedraw(true)
	END IF
	fileclose(li_numfich)
	
END IF

setpointer(Arrow!)

end event

event ue_transferencia;/////////////////////////////////////////////////////////
////										
//// Evento: ue_transferencia
//// 
//// Objetivo: Abre el fichero de preferencias que el
////           usuario ha escogido
////	
////
//// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ------	   -----------   ---------
////					JAM
////
/////////////////////////////////////////////////////////
//
//string	ls_from, ls_funcion_gen, ls_tabla_gen, ls_campo_gen
//string	ls_funcion, ls_tabla, ls_campo 
//integer 	li_pos_fin, li_pos_sig, li_pos, li_fila
//
//setpointer(HourGlass!)
//dw_select.setredraw(FALSE)
//
//ls_from = iu_comunic.is_comunic.strval1
//ls_funcion_gen = iu_comunic.is_comunic.strval2
//ls_tabla_gen = iu_comunic.is_comunic.strval3
//ls_campo_gen = iu_comunic.is_comunic.strval4
//
////Carga la columna funcion de dw_select
////li_pos_fin = len(ls_funcion_gen)
////li_fila = 0
////li_pos = 1
////DO WHILE li_pos+1 < li_pos_fin
////	li_fila ++
////	li_pos_sig = pos(ls_funcion_gen, "#", li_pos+1)
////	ls_funcion = mid(ls_funcion_gen, li_pos+1, (li_pos_sig -1) - (li_pos+1)) //quita el parentesis (
////	li_pos = li_pos_sig
////	dw_select.insertrow(0)
////	dw_select.Object.funcion[li_fila] = UPPER(ls_funcion)
////LOOP
//
////Carga la columna tabla de dw_select
//li_pos_fin = len(ls_tabla_gen)
//li_fila = 0
//li_pos = 1
//DO WHILE li_pos+1 < li_pos_fin
//	li_fila ++
//	li_pos_sig = pos(ls_tabla_gen, "#", li_pos+1)
//	ls_tabla = mid(ls_tabla_gen, li_pos+1, li_pos_sig - (li_pos+1))
//	li_pos = li_pos_sig
//	dw_select.Object.tabla[li_fila] = UPPER(ls_tabla)
//LOOP
//
////Carga la columna campo de dw_select
//li_pos_fin = len(ls_campo_gen)
//li_fila = 0
//li_pos = 1
//DO WHILE li_pos+1 < li_pos_fin
//	li_fila ++
//	li_pos_sig = pos(ls_campo_gen, "#", li_pos+1)
//	ls_campo = mid(ls_campo_gen, li_pos+1, li_pos_sig - (li_pos+1))
//	li_pos = li_pos_sig
//	dw_select.Object.campo[li_fila] = UPPER(ls_campo)
//LOOP
//
////Cargo el from en mle_from
//li_pos = pos (ls_from, "FROM")
//ls_from = mid (ls_from, li_pos)
//mle_from.text = UPPER(ls_from)
//
//dw_1.visible = false
//dw_select.setredraw(TRUE)
//setpointer(Arrow!)
end event

event ue_limpiar_pantalla;///////////////////////////////////////////////////////
//										
// Evento: ue_limpiar_pantalla
// 
// Objetivo: Resetea las DW y vacia el campo de edici$$HEX1$$f300$$ENDHEX$$n que contiene la select
//	
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//					LFE
//
///////////////////////////////////////////////////////

Int li_fila

dw_1.visible=False
tab_1.tabpage_select.dw_select.Reset()
tab_1.tabpage_where.dw_where.Reset()
tab_1.tabpage_sintaxis.mle_sintax.Text = ""

dw_1.Reset()

wf_opciones_menu()
wf_inicializar_select()
end event

event ue_imprimir;/////////////////////////////////////////////////////////////////////////
//
// Evento:   Imprimir
//
// Objetivo: Imprime reporte
//		
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                      				  5/11/1999  Juan Mas
//
/////////////////////////////////////////////////////////////////////////
//
//
//datawindow ldwa_impresora[]
//
//dw_1.Modify("Datawindow.Print.Orientation = 2")
//dw_1.Object.Datawindow.Print.DocumentName = "Reportes"
//datawindow ldwa_impresora[]
//ldwa_impresora = {dw_1}
//gf_impresion_preliminar (ldwa_impresora, True, 0)
//
//
str_print.dwprint=dw_1
str_print.titulo="Generaci$$HEX1$$f300$$ENDHEX$$n Sentencia SQL"
str_print.PARM1=true
OpenWithParm(w_print_dialog,str_print)

end event

event ue_agregar_fila;////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_agregar_fila
//
// Objetivo: Evento que a$$HEX1$$f100$$ENDHEX$$ade una nueva fila en dw_select si se est$$HEX2$$e1002000$$ENDHEX$$en el tabpage Select,
//				 o la a$$HEX1$$f100$$ENDHEX$$ade en dw_where si se est$$HEX2$$e1002000$$ENDHEX$$en el tabpage Where
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 20/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

int li_fila
DataWindowChild ldwch_nombre_tablas, ldwch_nombre_campos

This.SetRedraw(FALSE)
// Se comprueba el tabpage sobre el que hay que a$$HEX1$$f100$$ENDHEX$$adir una fila
CHOOSE CASE tab_1.SelectedTab
	CASE 1  // tabpage Select
		// Se a$$HEX1$$f100$$ENDHEX$$ade la fila nueva
		li_fila = tab_1.tabpage_select.dw_select.InsertRow(0)

		IF li_fila <> -1 THEN
			
			IF tab_1.tabpage_select.dw_select.RowCount() > 1 THEN
				// En el caso de que existan m$$HEX1$$e100$$ENDHEX$$s filas insertadas
				
				// Se a$$HEX1$$f100$$ENDHEX$$ade como nombre de tabla la tabla seleccionada en la fila anterior
				tab_1.tabpage_select.dw_select.SetItem(li_fila, 'ps_tabla', tab_1.tabpage_select.dw_select.GetItemString(li_fila - 1,'ps_tabla'))
				tab_1.tabpage_select.dw_select.GetChild('ps_columna', ldwch_nombre_campos)
				ldwch_nombre_campos.SetTransObject(SQLCA)
				// Se a$$HEX1$$f100$$ENDHEX$$aden los campos de la tabla
				ldwch_nombre_campos.Retrieve(tab_1.tabpage_select.dw_select.GetItemString(li_fila - 1,'ps_tabla'))
				tab_1.tabpage_select.dw_select.SetItem(li_fila, 'ps_columna', ldwch_nombre_campos.GetItemString(1,1))
				
			ELSEIF tab_1.tabpage_select.dw_select.RowCount() = 1 THEN
				// Se trata de la primera fila
				tab_1.tabpage_select.dw_select.GetChild('ps_tabla', ldwch_nombre_tablas)
				
				// Se a$$HEX1$$f100$$ENDHEX$$ade como nombre de la tabla el contenido del primer elemento de la lista de tablas
				tab_1.tabpage_select.dw_select.SetItem(li_fila, 'ps_tabla', ldwch_nombre_tablas.GetItemString(1,1))
				tab_1.tabpage_select.dw_select.GetChild('ps_columna', ldwch_nombre_campos)
				ldwch_nombre_campos.SetTransObject(SQLCA)
				// Se a$$HEX1$$f100$$ENDHEX$$aden los campos de la tabla
				ldwch_nombre_campos.Retrieve(ldwch_nombre_tablas.GetItemString(1,1))
				tab_1.tabpage_select.dw_select.SetItem(1, 'ps_columna', ldwch_nombre_campos.GetItemString(1,1))
		
			END IF
			// Se sit$$HEX1$$fa00$$ENDHEX$$a el cursor en la fila a$$HEX1$$f100$$ENDHEX$$adida
			tab_1.tabpage_select.dw_select.SetRow(li_fila)
			tab_1.tabpage_select.dw_select.ScrollToRow(li_fila)
		END IF
		
		CASE 2  // tabpage Where
			// Se a$$HEX1$$f100$$ENDHEX$$ade una fila nueva
			li_fila = tab_1.tabpage_where.dw_where.InsertRow(0)
			IF li_fila <> -1 THEN 
				
				tab_1.tabpage_where.dw_where.AcceptText()
				// Se a$$HEX1$$f100$$ENDHEX$$ade el contenido de los operadores
				wf_insertar_filas_claus_where()			
				tab_1.tabpage_where.dw_where.SetRow(li_fila)
				// Se sit$$HEX1$$fa00$$ENDHEX$$a el cursor en la fila a$$HEX1$$f100$$ENDHEX$$adida
				tab_1.tabpage_where.dw_where.ScrollToRow(li_fila)
			END IF
	END CHOOSE

wf_opciones_menu()

This.SetRedraw(TRUE)

end event

event ue_abrir_parentesis;////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_abrir_parentesis
//
// Objetivo: Evento que realiza la apertura de un par$$HEX1$$e900$$ENDHEX$$ntesis de la datawindow dw_where
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 21/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

int li_fila
string ls_parentesis

// Se obtiene la fila sobre la que hay que a$$HEX1$$f100$$ENDHEX$$adir par$$HEX1$$e900$$ENDHEX$$ntesis
li_fila = tab_1.tabpage_where.dw_where.GetRow()

IF li_fila > 0 THEN
	// Se obtienen los par$$HEX1$$e900$$ENDHEX$$ntesis anteriores
	ls_parentesis = tab_1.tabpage_where.dw_where.GetItemString(li_fila, 'ps_parentesis1')
	IF isnull(ls_parentesis) THEN
		// No hab$$HEX1$$ed00$$ENDHEX$$a ning$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e900$$ENDHEX$$ntesis, se trata del primero
		ls_parentesis = '('
	ELSE
		// Ya exist$$HEX1$$ed00$$ENDHEX$$an m$$HEX1$$e100$$ENDHEX$$s par$$HEX1$$e900$$ENDHEX$$ntesis, se a$$HEX1$$f100$$ENDHEX$$ade uno m$$HEX1$$e100$$ENDHEX$$s
		ls_parentesis = ls_parentesis + '('
	END IF
	// Se a$$HEX1$$f100$$ENDHEX$$aden los par$$HEX1$$e900$$ENDHEX$$ntesis a la datawindow
	tab_1.tabpage_where.dw_where.SetItem(li_fila, 'ps_parentesis1', ls_parentesis)
	tab_1.tabpage_where.dw_where.AcceptText()
END IF
end event

event ue_cerrar_parentesis;/////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_cerrar_parentesis
//
// Objetivo: Evento que efect$$HEX1$$fa00$$ENDHEX$$a el cierre de un par$$HEX1$$e900$$ENDHEX$$ntesis en la datawindow dw_where
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 21/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

int li_fila
string ls_parentesis

// Se obtiene la fila sobre la que hay que cerrar par$$HEX1$$e900$$ENDHEX$$ntesis
li_fila = tab_1.tabpage_where.dw_where.GetRow()

IF li_fila > 0 THEN
	// Se obtienen los par$$HEX1$$e900$$ENDHEX$$ntesis cerrados en esa fila
	ls_parentesis = tab_1.tabpage_where.dw_where.GetItemString(li_fila, 'ps_parentesis2')
	IF isnull(ls_parentesis) THEN
		// Se trata del primer par$$HEX1$$e900$$ENDHEX$$ntesis que se cierra
		ls_parentesis = ')'
	ELSE
		// Ya ha m$$HEX1$$e100$$ENDHEX$$s par$$HEX1$$e900$$ENDHEX$$ntesis que se cierran, se a$$HEX1$$f100$$ENDHEX$$ade uno m$$HEX1$$e100$$ENDHEX$$s cerrado
		ls_parentesis = ls_parentesis + ')'
	END IF
	// Se a$$HEX1$$f100$$ENDHEX$$aden los par$$HEX1$$e900$$ENDHEX$$ntesis cerrados a la datawindow
	tab_1.tabpage_where.dw_where.SetItem(li_fila, 'ps_parentesis2', ls_parentesis)
	tab_1.tabpage_where.dw_where.AcceptText()
END IF
end event

event ue_eliminar_par_abierto;////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_eliminar_par_abierto
//
// Objetivo: Evento que elimina un par$$HEX1$$e900$$ENDHEX$$ntesis abierto en la datawindow dw_where en la 
//				 fila seleccionada
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 21/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

int li_fila, li_num_parentesis, li_contador
string ls_parentesis, ls_parentesis_nuevo

// Se obtiene la fila seleccionada
li_fila = tab_1.tabpage_where.dw_where.GetRow()

IF li_fila > 0 THEN
	// Se obtienen los par$$HEX1$$e900$$ENDHEX$$ntesis abiertos
	ls_parentesis = tab_1.tabpage_where.dw_where.GetItemString(li_fila, 'ps_parentesis1')
	IF isnull(ls_parentesis) THEN
		// No hay par$$HEX1$$e900$$ENDHEX$$ntesis abiertos
		li_num_parentesis = 0
	ELSE
		// Se obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de par$$HEX1$$e100$$ENDHEX$$ntesis abiertos
		li_num_parentesis = Len(ls_parentesis)
	END IF
	
	IF li_num_parentesis > 0 THEN
		// Se elimina un par$$HEX1$$e900$$ENDHEX$$ntesis
		FOR li_contador=1 TO li_num_parentesis - 1 
			IF li_contador = 1 THEN
				ls_parentesis_nuevo = '('
			ELSE
				ls_parentesis_nuevo = ls_parentesis_nuevo + '('
			END IF
		NEXT
	END IF
	// Se a$$HEX1$$f100$$ENDHEX$$aden los par$$HEX1$$e900$$ENDHEX$$ntesis en la datawindow
	tab_1.tabpage_where.dw_where.SetItem(li_fila, 'ps_parentesis1', ls_parentesis_nuevo)
	tab_1.tabpage_where.dw_where.AcceptText()
END IF

end event

event ue_eliminar_par_cerrado;////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_eliminar_par_cerrado
//
// Objetivo: Evento que elimina un par$$HEX1$$e900$$ENDHEX$$ntesis cerrado en la datawindow dw_where en la 
//				 fila seleccionada
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 21/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

int li_fila, li_num_parentesis, li_contador
string ls_parentesis, ls_parentesis_nuevo

// Se obtiene la fila sobre la que hay que eliminar un par$$HEX1$$e900$$ENDHEX$$ntesis
li_fila = tab_1.tabpage_where.dw_where.GetRow()

IF li_fila > 0 THEN
	// Se obtienen los par$$HEX1$$e900$$ENDHEX$$ntesis cerrados
	ls_parentesis = tab_1.tabpage_where.dw_where.GetItemString(li_fila, 'ps_parentesis2')
	IF isnull(ls_parentesis) THEN
		// no hay par$$HEX1$$e900$$ENDHEX$$ntesis cerrados
		li_num_parentesis = 0
	ELSE
		// Se obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de par$$HEX1$$e900$$ENDHEX$$ntesis cerrados
		li_num_parentesis = Len(ls_parentesis)
	END IF
	
	IF li_num_parentesis > 0 THEN
		// Se elimina uno de los par$$HEX1$$e900$$ENDHEX$$ntesis cerrados
		FOR li_contador=1 TO li_num_parentesis - 1 
			IF li_contador = 1 THEN
				ls_parentesis_nuevo = ')'
			ELSE
				ls_parentesis_nuevo = ls_parentesis_nuevo + ')'
			END IF
		NEXT
	END IF
	// Se a$$HEX1$$f100$$ENDHEX$$aden los par$$HEX1$$e900$$ENDHEX$$ntesis cerrados a la datawindow
	tab_1.tabpage_where.dw_where.SetItem(li_fila, 'ps_parentesis2', ls_parentesis_nuevo)
	tab_1.tabpage_where.dw_where.AcceptText()
END IF
end event

event ue_exportar_excel();string ls_docname, ls_named, ls_documento, ls_data, ls_syntaxis, ls_contenido,&
		 ls_contenido_parcial, ls_cadena
integer li_value, li_numfila, li_retorno, li_numfich
long ll_pos, ll_num_car_escritos, ll_longitud, ll_num_car
Boolean lb_todo_escrito = FALSE

IF dw_1.rowcount() > 0 THEN

	li_value = GetFileSaveName("Grabar Informe SQL",  & 
		ls_docname, ls_named, "RPC",  &
		"Archivos de Informe SQL (*.XLS),*.XLS," +  &
		"Todos los Archivos (*.*), *.*")
		
	ll_pos=pos(upper(ls_docname),".XLS")

	ls_documento = fw_preparar_archivo() // trae el string del archivo
	
//	ls_data = "DATA%" + dw_1.Object.DataWindow.Data + "%" 
	ls_syntaxis= "Sintaxis~$$HEX1$$a500$$ENDHEX$$" + dw_1.Describe("DataWindow.Syntax") + "~$$HEX1$$a500$$ENDHEX$$"
//	ls_documento = ls_documento + ls_data + ls_syntaxis

	if dw_1.SaveAs(ls_docname,Text!, True)= -1 then
		gnv_msg.F_MENSAJE("EP04",ls_docname,"",Ok!) //No se ha podido grabar el archivo
	END IF
END IF
end event

public function string fw_preparar_archivo ();///////////////////////////////////////////////////////
//										
// Funcion: fw_preparar_archivo
// 
// Objetivo: Codifica Archivo de preferencias
//	
//
// Responsable: JAM
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : String con archivo de preferencias
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

STRING ls_select, ls_where, ls_arch

ls_select = tab_1.tabpage_select.dw_select.Object.DataWindow.Data
ls_where = tab_1.tabpage_where.dw_where.Object.DataWindow.Data

//ls_arch = "?SELECT#" + ls_select + "#FROM$" + ls_from + "$" 
ls_arch =  ls_select + "##WHERE~$$HEX1$$a400$$ENDHEX$$" + ls_where + "~$$HEX1$$a400$$ENDHEX$$" 

RETURN ls_arch
end function

public function integer fw_interpretar_archivo (string ps_preferencia, integer pi_tipo);///////////////////////////////////////////////////////
//										
// Funcion: f_interpretar_archivo
// 
// Objetivo: Decodifica el archivo de preferencia
//	
//
// Responsable: JAM
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_contenido , pi_tipo (0 - preferencia, 1 - reporte)
//		Salida : 
//
// Devuelve: 1 Ok, -1 error
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

w_consulta_sql.SETREDRAW(FALSE)

string ls_select, ls_where, ls_data, ls_syntaxis, ls_error_create
long ll_pos, ll_pos_final
int li_res

// Recogemos la select de la sentencia SQL
//ll_pos = pos(ps_preferencia, "#")
ll_pos_final = pos(ps_preferencia, "##", 1)
ls_select=mid(ps_preferencia, 1, ll_pos_final )

// Recogemos el from de la sentencia SQL 
ll_pos = pos(ps_preferencia, "~$$HEX1$$a400$$ENDHEX$$")
ll_pos_final = pos(ps_preferencia, "~$$HEX1$$a400$$ENDHEX$$", ll_pos+1)
ls_where=mid(ps_preferencia, ll_pos+1, ll_pos_final - (ll_pos+1))

//Cargamos en la dw_select
//w_consulta_sql.triggerevent("ue_eliminar")
tab_1.tabpage_select.dw_Select.reset()
li_res=tab_1.tabpage_select.dw_select.importstring(ls_select)

IF li_res < 0 then
	return -1
END IF

tab_1.tabpage_where.dw_where.reset()
li_res=tab_1.tabpage_where.dw_where.importstring(ls_where)

IF li_res < 0 then
	return -1
END IF

//Cargamos el campo from
//mle_from.text = ls_from
//
if pi_tipo = 1 then
	//Recupero los datos
	ll_pos = pos(ps_preferencia, "~$$HEX1$$de00$$ENDHEX$$")
	ll_pos_final = pos(ps_preferencia, "~$$HEX1$$de00$$ENDHEX$$", ll_pos+1)
	ls_data=mid(ps_preferencia, ll_pos+1, ll_pos_final - (ll_pos+1))
	
	//Recupero la syntaxis
	ll_pos = pos(ps_preferencia, "~$$HEX1$$a500$$ENDHEX$$")
	ll_pos_final = pos(ps_preferencia, "~$$HEX1$$a500$$ENDHEX$$", ll_pos+1)
	ls_syntaxis=mid(ps_preferencia, ll_pos+1, ll_pos_final - (ll_pos+1))
	
	//Genero y cargo dw_1
	dw_1.Create(ls_syntaxis, ls_error_create) //creo el objeto DW
	IF Len(ls_error_create) >0 THEN
		return -1
	END IF
	li_res=dw_1.importstring(ls_data)
	IF li_res < 0 then
		return -1
	END IF
end if
w_consulta_sql.SETREDRAW(TRUE)

return 1
end function

public function integer wf_determinar_sentencia ();/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_determinar_sentencia
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que construye la sentencia SELECT a partir de la selecci$$HEX1$$f300$$ENDHEX$$n del usuario
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 20/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string ls_campo, ls_funcion, ls_alias, ls_op1, ls_op2, ls_signo, ls_op_rel
string ls_select = "SELECT ~t"
string ls_from = "FROM ~t"
string ls_where = ""
string ls_group = " "
string ls_par_abierto, ls_par_cerrado, ls_tabla_data, ls_tabla_display
Boolean lb_hay_where = False
Boolean lb_hay_group = False
Boolean lb_primer_campo_group = True
int li_contador, li_retorno = 1, li_fila
datawindowchild ldtc_tabla

// Se valida el contenido de las datawindows empleadas para construir la Select
tab_1.tabpage_where.dw_where.AcceptText()
tab_1.tabpage_select.dw_select.AcceptText()

// Se accede a todos los campos a$$HEX1$$f100$$ENDHEX$$adidos por el usuario
FOR li_contador = 1 TO tab_1.tabpage_select.dw_select.RowCount()
	// Se a$$HEX1$$f100$$ENDHEX$$ade un salto de l$$HEX1$$ed00$$ENDHEX$$nea y un tabulador en la select a partir del segundo campo
	IF li_contador <> 1 THEN
		ls_select = ls_select + ",~r~n~t"
	END IF
	
	// Se obtienen todos los datos del campo
	ls_funcion = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_funcion')
	ls_tabla_data = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_tabla')

	tab_1.tabpage_select.dw_select.SetRow(li_contador)
	tab_1.tabpage_select.dw_select.SetColumn('ps_tabla')

	tab_1.tabpage_select.dw_select.GetChild('ps_tabla',ldtc_tabla)
	li_fila = ldtc_tabla.getrow()
	
	IF li_fila > 0 THEN
		ls_tabla_display = ldtc_tabla.getItemString(li_fila,'synonim')
	ELSE
		ls_tabla_display = ls_tabla_data
	END IF
//	messagebox(string(prueba.getrow()),ls_tabla)
	
	ls_campo = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_columna')
	ls_alias = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_alias')
	
	// Se comprueba si se ha selccionado alguna funci$$HEX1$$f300$$ENDHEX$$n
	IF ls_funcion <> "" AND ls_funcion <> " " THEN
		// se a$$HEX1$$f100$$ENDHEX$$ade la funci$$HEX1$$f300$$ENDHEX$$n a la select
		ls_select = ls_select +  ls_funcion + "("
//		IF ls_group = " " THEN
//			lb_hay_group = True
//		END IF
//	
//	ELSE
//		IF lb_hay_group = True THEN
//			IF lb_primer_campo_group = True THEN
//				ls_group = "GROUP BY "
//				lb_primer_campo_group = False
//			ELSE
//				ls_group = ls_group + ",~r~n~t"
//			END IF
//			ls_group = ls_group + ls_tabla + "." + ls_campo
//		END IF
	END IF
	
	// se a$$HEX1$$f100$$ENDHEX$$ade el nombre de la tabla y el campo a la select
	ls_select = ls_select + ls_tabla_display + "." + ls_campo
	
	IF ls_funcion <> "" AND ls_funcion <> " " THEN
		// Si se a$$HEX1$$f100$$ENDHEX$$adi$$HEX2$$f3002000$$ENDHEX$$una funci$$HEX1$$f300$$ENDHEX$$n se procede a cerrar el par$$HEX1$$e900$$ENDHEX$$ntesis
		ls_select = ls_select + ") "
	END IF
	
	// se comprueba si el usuario ha a$$HEX1$$f100$$ENDHEX$$adido un alias para el campo
	IF ls_alias <> "" AND ls_alias <> " " THEN
		// se a$$HEX1$$f100$$ENDHEX$$ade el alias entre comillas a la select
		ls_select = ls_select + " " + "~"" + ls_alias +"~""
	END IF
	
	// Si la tabla que pertenece al campo no estaba seleccionada con anterioridad
	// se a$$HEX1$$f100$$ENDHEX$$ade al FROM
	
	// Se comprueba si el nombre de la tabla ya se encuentra en el FROM
	IF wf_tabla_no_repetida(ls_tabla_data, li_contador) THEN
		// La tabla no est$$HEX1$$e100$$ENDHEX$$, hay que a$$HEX1$$f100$$ENDHEX$$adirla
		IF li_contador <> 1 THEN
			// Se a$$HEX1$$f100$$ENDHEX$$ade un salto de l$$HEX1$$ed00$$ENDHEX$$nea y un tabulador en el FROM a partir de la segunda tabla
			ls_from = ls_from + ",~r~n~t"
		END IF
		// Se a$$HEX1$$f100$$ENDHEX$$ade la tabla
		ls_from = ls_from + ls_tabla_display
	END IF
NEXT

// Se construye la cla$$HEX1$$fa00$$ENDHEX$$sula WHERE
// Se recorren todas las condiciones impuestas por el usuario
FOR li_contador = 1 TO tab_1.tabpage_where.dw_where.RowCount()
	// Se obtiene el primer operando
	ls_op1 = tab_1.tabpage_where.dw_where.GetItemString(li_contador, 'ps_operando1')
	// Se obtiene el operador
	ls_signo = tab_1.tabpage_where.dw_where.GetItemString(li_contador, 'ps_operador')
	// Se obtiene el segundo operando
	ls_op2 = tab_1.tabpage_where.dw_where.GetItemString(li_contador, 'ps_operando2')
	// Se obtienen los par$$HEX1$$e900$$ENDHEX$$ntesis abiertos
	ls_par_abierto = tab_1.tabpage_where.dw_where.GetItemString(li_contador, 'ps_parentesis1')
	IF isnull(ls_par_abierto) THEN
		ls_par_abierto = ""
	END IF

	// Se obtienen los par$$HEX1$$e900$$ENDHEX$$ntesis cerrados	
	ls_par_cerrado = tab_1.tabpage_where.dw_where.GetItemString(li_contador, 'ps_parentesis2')
	IF isnull(ls_par_cerrado) THEN
		ls_par_cerrado = ""
	END IF

	// Se comprueba que se puede construir la condici$$HEX1$$f300$$ENDHEX$$n. Para ello es condici$$HEX1$$f300$$ENDHEX$$n necesaria
	// que est$$HEX1$$e900$$ENDHEX$$n definidos los dos operandores y el operando. En caso de no poder construir 
	// la condici$$HEX1$$f300$$ENDHEX$$n, $$HEX1$$e900$$ENDHEX$$sta se ignora
	IF NOT isnull(ls_op1) AND NOT isnull(ls_op2) AND NOT isnull(ls_signo) THEN
		IF lb_hay_where = FALSE THEN
			// Primera condici$$HEX1$$f300$$ENDHEX$$n v$$HEX1$$e100$$ENDHEX$$lida. Se a$$HEX1$$f100$$ENDHEX$$ade la palabra WHERE
			ls_where = "WHERE ~t"
			lb_hay_where = TRUE
		ELSE
			// Ya hay condiciones a$$HEX1$$f100$$ENDHEX$$adidas a la Where. Se obtiene el operador relacional que 
			// une la condici$$HEX1$$f300$$ENDHEX$$n nueva con las anteriores
			ls_op_rel = tab_1.tabpage_where.dw_where.GetItemString(li_contador - 1, 'ps_op_logico')
			IF ISNULL(ls_op_rel) THEN
				// En caso de no existir operador relacional se a$$HEX1$$f100$$ENDHEX$$ade un AND
				tab_1.tabpage_where.dw_where.SetItem(li_contador - 1, 'ps_op_logico', 'AND')
				tab_1.tabpage_where.dw_where.AcceptText()
				ls_op_rel = 'AND'
			END IF
			// Se a$$HEX1$$f100$$ENDHEX$$ade a la Where el operador relacional
			ls_where = ls_where + " " + ls_op_rel + "~r~n~t"
		END IF
		// Se a$$HEX1$$f100$$ENDHEX$$ade la nueva condici$$HEX1$$f300$$ENDHEX$$n a la Where
		ls_where = ls_where + ls_par_abierto + ls_op1 + " " + ls_signo + " " + ls_op2 + ls_par_cerrado
	ELSE
		IF NOT isnull(ls_op1) OR NOT isnull(ls_op2) OR NOT isnull(ls_signo) THEN
			//messagebox("Error", "Alguna parte de la WHERE se encuentra sin datos")	
			li_retorno = 0 
			exit
		END IF
	END IF
NEXT

IF li_retorno <> 0 THEN
	ls_group = wf_construye_group_by()
	// Se a$$HEX1$$f100$$ENDHEX$$ade al tabpage que muestra la sintaxis la sentencia construida
	tab_1.tabpage_sintaxis.mle_sintax.Text = ls_select + "~r~n" + ls_from + "~r~n" + ls_where
	
	IF ls_where <> "" THEN
		tab_1.tabpage_sintaxis.mle_sintax.Text = tab_1.tabpage_sintaxis.mle_sintax.Text &
																+ "~r~n" + ls_group
	ELSE
		tab_1.tabpage_sintaxis.mle_sintax.Text = tab_1.tabpage_sintaxis.mle_sintax.Text + ls_group
	END IF
ELSE
	tab_1.tabpage_sintaxis.mle_sintax.Text = ""
END IF

return li_retorno
end function

public function boolean wf_tabla_no_repetida (string ps_tabla, integer pi_posicion);////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_tabla_no_repetida
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que indica si una tabla concreta se encuentra en dw_select
//				 en una fila anterior a la indicada en pi_posicion
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: ps_tabla -> nombre de la tabla
//						 pi_posicion -> posici$$HEX1$$f300$$ENDHEX$$n hasta la que hay que buscar
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 20/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

Boolean lb_tabla_no_repetida = TRUE
int li_num_filas, li_contador

li_num_filas = pi_posicion - 1 
li_contador = 1

// Se comprueba si existe en una fila anterior a pi_posici$$HEX1$$f300$$ENDHEX$$n la tabla. En caso de existir
// se devuelve FALSE, y en caso de no existir se devuelve TRUE
DO WHILE lb_tabla_no_repetida = TRUE AND li_contador <= li_num_filas
	// Se obtiene el nombre de la tabla con la que hay que comparar
	tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_tabla')
	IF ps_tabla = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_tabla') THEN
		// Tabla repetida
		lb_tabla_no_repetida = FALSE
	END IF
	
	li_contador ++
LOOP

return lb_tabla_no_repetida
end function

public function integer wf_insertar_filas_claus_where ();////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_insertar_filas_claus_where
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que actualiza el nombre de los campos que se pueden seleccionar como
// 			 operadores en la datwindow dw_where
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 21/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////


DatawindowChild ldwch_lista_campos1, ldwch_lista_campos2
DatawindowChild ldtc_tabla
int li_contador, li_fila
string ls_tabla, ls_tabla_display


tab_1.tabpage_where.dw_where.GetChild('ps_operando1', ldwch_lista_campos1)
tab_1.tabpage_where.dw_where.GetChild('ps_operando2', ldwch_lista_campos2)
// Se borra el contendido de la lista de los operadores, s$$HEX1$$f300$$ENDHEX$$lo permanence 
// el contenido seleccionado por el usuario
ldwch_lista_campos1.Reset()
ldwch_lista_campos2.Reset()

// Se vuelve a insertar el nuevo contenido en la lista de operadores: el nombre de todos
// los campos seleccionables por el usuario
FOR li_contador=1 TO tab_1.tabpage_select.dw_select.RowCount()
	
	ls_tabla = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_tabla')

	IF wf_tabla_no_repetida(ls_tabla, li_contador) THEN
		tab_1.tabpage_select.dw_select.SetRow(li_contador)
		tab_1.tabpage_select.dw_select.SetColumn('ps_tabla')
	
		tab_1.tabpage_select.dw_select.GetChild('ps_tabla',ldtc_tabla)
		li_fila = ldtc_tabla.getrow()
		
		IF li_fila > 0 THEN
			ls_tabla_display = ldtc_tabla.getItemString(li_fila,'synonim')
		ELSE
			ls_tabla_display = ls_tabla
		END IF
		
		wf_insertar_campos(li_contador,ls_tabla, ls_tabla_display)
	END IF
NEXT

Return 1


end function

public function integer wf_opciones_menu ();////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_opciones_menu
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que habilita y deshabilta opciones de men$$HEX2$$fa002000$$ENDHEX$$dependiendo del tabpage
//				 seleccionado por el usuario
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 21/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

Boolean lb_edicion, lb_insertar, lb_borrar

CHOOSE CASE tab_1.SelectedTab 
	CASE 1 // tabpage Select
		lb_edicion = False
		lb_insertar = True

		IF tab_1.tabpage_select.dw_select.RowCount() > 1 THEN
			lb_borrar = True
		ELSE
			lb_borrar = False
		END IF
		
	CASE 2 // tabpage Where
		lb_edicion = True
		lb_insertar = True
		
		IF tab_1.tabpage_where.dw_where.RowCount() > 1 THEN
			lb_borrar = True
		ELSE
			lb_borrar = False
		END IF

	CASE 3 // Tabpage Sintaxis
		lb_edicion = False
		lb_insertar = False
		lb_borrar = False
		
END CHOOSE

m_consulta_sql.m_edicion.m_abrirparntesis.Enabled = lb_edicion
m_consulta_sql.m_edicion.m_cerrarparntesis.Enabled = lb_edicion
m_consulta_sql.m_edicion.m_eliminaraperturaparntesis.Enabled = lb_edicion
m_consulta_sql.m_edicion.m_eliminarcierreparntesis.Enabled = lb_edicion
m_consulta_sql.m_edicion.m_insertar.Enabled = lb_insertar
m_consulta_sql.m_edicion.m_borrar.Enabled = lb_borrar

return 1
end function

public function integer wf_inicializar_select ();////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_inicializar_select
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que inicializa las datawindows que permiten construir la sentencia 
//				 SELECT
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 20/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////////////////////////////////////

DatawindowChild ldwch_nombre_tablas, ldwch_nombre_campos
Int li_fila

This.Setredraw(False)
// Se inicializa las datawindow desde donde se seleccionan los campos
// Se traen las tablas del sistema
tab_1.tabpage_select.dw_select.InsertRow(0)
tab_1.tabpage_select.dw_select.GetChild('ps_tabla', ldwch_nombre_tablas)
ldwch_nombre_tablas.SetTransObject(SQLCA)
ldwch_nombre_tablas.Retrieve()
tab_1.tabpage_select.dw_select.SetItem(1, 'ps_tabla', ldwch_nombre_tablas.GetItemString(1,1))

// Se traen los campos de la tabla seleccionada, en este caso los de la primera tabla
tab_1.tabpage_select.dw_select.GetChild('ps_columna', ldwch_nombre_campos)
ldwch_nombre_campos.SetTransObject(SQLCA)
ldwch_nombre_campos.Retrieve(ldwch_nombre_tablas.GetItemString(1,1))
tab_1.tabpage_select.dw_select.SetItem(1, 'ps_columna', ldwch_nombre_campos.GetItemString(1,1))

li_fila = tab_1.tabpage_where.dw_where.InsertRow(0)
tab_1.tabpage_where.dw_where.SetRow(li_fila)

// Se construye la datawindow de la clausula where
wf_insertar_filas_claus_where()

// Se construye la sentencia Select
wf_determinar_sentencia()

This.Setredraw(True)

return 1
end function

public function string wf_construye_group_by ();/////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_construye_group_by
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que construye el GROUP BY en el caso de que se aplique alguna funci$$HEX1$$f300$$ENDHEX$$n
//				 a alg$$HEX1$$fa00$$ENDHEX$$n campo
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 02/01/2001	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
////////////////////////////////////////////////////////////////////////////////

String ls_group_by = ""
String ls_funcion, ls_tabla_data, ls_tabla_display, ls_campo
Boolean lb_hay_funcion = False
Int li_contador, li_fila
datawindowchild ldtc_tabla
li_contador = 1

// Se comprueba si se aplica alguna funci$$HEX1$$f300$$ENDHEX$$n a alg$$HEX1$$fa00$$ENDHEX$$n campo
DO WHILE li_contador <= tab_1.tabpage_select.dw_select.RowCount() AND lb_hay_funcion = FALSE
	ls_funcion = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_funcion')
	IF NOT isnull(ls_funcion) AND ls_funcion <> "" AND ls_funcion <> " " THEN
		lb_hay_funcion = True
	END IF
	li_contador ++
LOOP

IF lb_hay_funcion = True THEN
	// Como existe una funci$$HEX1$$f300$$ENDHEX$$n aplicada a alg$$HEX1$$fa00$$ENDHEX$$n campo hay que construir el GROUP BY
	FOR li_contador = 1 TO tab_1.tabpage_select.dw_select.RowCount()
		ls_funcion = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_funcion')
		IF isnull(ls_funcion) OR ls_funcion = "" OR ls_funcion = " " THEN
			// Campo sin funci$$HEX1$$f300$$ENDHEX$$n aplicada. Tiene que formar parte del GROUP BY
			//ls_tabla = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_tabla')
			ls_tabla_data = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_tabla')

			tab_1.tabpage_select.dw_select.SetRow(li_contador)
			tab_1.tabpage_select.dw_select.SetColumn('ps_tabla')
		
			tab_1.tabpage_select.dw_select.GetChild('ps_tabla',ldtc_tabla)
			li_fila = ldtc_tabla.getrow()
			
			IF li_fila > 0 THEN
				ls_tabla_display = ldtc_tabla.getItemString(li_fila,'synonim')
			ELSE
				ls_tabla_display = ls_tabla_data
			END IF
			
			ls_campo = tab_1.tabpage_select.dw_select.GetItemString(li_contador, 'ps_columna')
			IF ls_group_by = "" THEN
				// Se trata del primer campo del GROUP BY
				ls_group_by = "GROUP BY " 
			ELSE
				ls_group_by = ls_group_by + ",~r~n~t"
			END IF
			// Se a$$HEX1$$f100$$ENDHEX$$ade el campo al GROUP BY
			ls_group_by = ls_group_by + ls_tabla_display + "." + ls_campo
		END IF
	NEXT
END IF

Return ls_group_by

end function

public function integer wf_insertar_campos (integer pi_fila, string ps_tabla, string ps_display);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: wf_insertar_campos
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que obtiene los campos de la tabla seleccionada en ps_tabla de 
//				 dw_select, y los a$$HEX1$$f100$$ENDHEX$$ade en ps_columna de dw_select y en los operandos de 
//				 dw_where. De esta forma el usuario puede construir
//				 la where $$HEX1$$fa00$$ENDHEX$$nicamente con los campos de las tablas de los campos seleccionados
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: pi_fila -> n$$HEX1$$fa00$$ENDHEX$$mero de fila en la datawindow dw_select donde hay que insertar
//									   los campos
//						 ps_tabla -> nombre de la tabla de la que hay que a$$HEX1$$f100$$ENDHEX$$adir los campos
//
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      -------------------      --------------
// 20/12/2000	    LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//DECLARE lc_campos_tabla CURSOR FOR
//	SELECT COLUMN_NAME 
//	FROM ALL_TAB_COLUMNS
//	WHERE TABLE_NAME = :ps_tabla AND
//			ALL_TAB_COLUMNS.OWNER IN (SELECT DISTINCT(TABLE_OWNER)
//											  FROM USER_SYNONYMS
//											  UNION
//											  SELECT USER FROM DUAL)
//	ORDER BY COLUMN_NAME;
//
String ls_campo
DatawindowChild ldwch_nombre_campos, ldwch_lista_campos1, ldwch_lista_campos2
int li_contador, li_fila, li_filas_where, li_row

// Nos situamos en la fila sobre la que hay que a$$HEX1$$f100$$ENDHEX$$adir los campos
tab_1.tabpage_select.dw_select.SetRow(pi_fila)
tab_1.tabpage_select.dw_select.GetChild('ps_columna', ldwch_nombre_campos)
ldwch_nombre_campos.SetTransObject(SQLCA)
// Se obtienen sobre ps_columna los campos de la tabla
ldwch_nombre_campos.Retrieve(ps_tabla)

tab_1.tabpage_where.dw_where.GetChild('ps_operando1', ldwch_lista_campos1)
tab_1.tabpage_where.dw_where.GetChild('ps_operando2', ldwch_lista_campos2)
// Se a$$HEX1$$f100$$ENDHEX$$aden los estos campos a la datawindow where acompa$$HEX1$$f100$$ENDHEX$$ados del nombre de la tabla
//FOR li_filas_where=1 TO tab_1.tabpage_where.dw_where.RowCount()
	FOR li_contador=1 TO ldwch_nombre_campos.RowCount()

		tab_1.tabpage_where.dw_where.SetRow(li_filas_where)
		ls_campo = ldwch_nombre_campos.GetItemString(li_contador,1)
				
		// Se a$$HEX1$$f100$$ENDHEX$$aden al operador 1
		li_row = ldwch_lista_campos1.Insertrow(0)	
		ldwch_lista_campos1.SetItem(li_row, 'ps_campo', ps_display + "." + ls_campo)
		// Se a$$HEX1$$f100$$ENDHEX$$aden al operador 2
		li_row = ldwch_lista_campos2.Insertrow(0)
		ldwch_lista_campos2.SetItem(li_row, 'ps_campo', ps_display + "." + ls_campo)
	NEXT
//NEXT


Return 1



end function

on w_consulta_sql.create
if this.MenuName = "m_consulta_sql" then this.MenuID = create m_consulta_sql
this.tab_1=create tab_1
this.st_1=create st_1
this.dw_1=create dw_1
this.st_4=create st_4
this.Control[]={this.tab_1,&
this.st_1,&
this.dw_1,&
this.st_4}
end on

on w_consulta_sql.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.st_4)
end on

event open;//this.width=3645
//this.Height=2400
//this.x=1
//this.y=1
//
//iu_comunic=Create u_generico_comunicaciones
DataWindowChild ldwch_nombre_tablas, ldwch_nombre_campos
int li_fila

iu_5001_nu=Create u_5001_nu_reportes
//iu_ds_reportes=Create ds_5001_reportes
//
//// Cargo la estructura local de comunicaciones
//iu_comunic.is_comunic = gu_comunic.is_comunic
//
////cuando abro desde el menu
//if iu_comunic.is_comunic.intval1 = 0 then//abro para una nueva consulta
//	this.triggerevent("ue_limpiar_pantalla")
//elseif iu_comunic.is_comunic.intval1 = 1 then //abro con consulta creada en w_reportes
//	this.triggerevent("ue_transferencia")
//end if
//

// Se construye la select inicial
wf_inicializar_select()


end event

event closequery;destroy iu_5001_nu
//destroy iu_comunic
//destroy iu_ds_reportes
////////
end event

type tab_1 from tab within w_consulta_sql
integer x = 87
integer y = 32
integer width = 3314
integer height = 832
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_select tabpage_select
tabpage_where tabpage_where
tabpage_sintaxis tabpage_sintaxis
end type

on tab_1.create
this.tabpage_select=create tabpage_select
this.tabpage_where=create tabpage_where
this.tabpage_sintaxis=create tabpage_sintaxis
this.Control[]={this.tabpage_select,&
this.tabpage_where,&
this.tabpage_sintaxis}
end on

on tab_1.destroy
destroy(this.tabpage_select)
destroy(this.tabpage_where)
destroy(this.tabpage_sintaxis)
end on

event selectionchanged;wf_opciones_menu()
IF newindex = 3 THEN
	tab_1.tabpage_select.dw_select.AcceptText()
	wf_determinar_sentencia()
END IF
end event

type tabpage_select from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3278
integer height = 716
long backcolor = 79741120
string text = "Select"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_select dw_select
end type

on tabpage_select.create
this.dw_select=create dw_select
this.Control[]={this.dw_select}
end on

on tabpage_select.destroy
destroy(this.dw_select)
end on

type dw_select from datawindow within tabpage_select
integer x = 110
integer y = 60
integer width = 3072
integer height = 608
integer taborder = 20
string dataobject = "d_sentencia_select"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;DatawindowChild ldwch_nombre_campos

IF dwo.name = 'ps_tabla' THEN
	This.SetRedraw(False)
	tab_1.tabpage_select.dw_select.GetChild('ps_columna', ldwch_nombre_campos)
	ldwch_nombre_campos.SetTransObject(SQLCA)
	if ldwch_nombre_campos.Retrieve(data) > 0 then 
		tab_1.tabpage_select.dw_select.SetItem(row, 'ps_columna', ldwch_nombre_campos.GetItemString(1,1))
		AcceptText()
		wf_insertar_filas_claus_where()
	else 
		messagebox("Aviso","El elemento seleccionado no es una tabla",Information!)		
		tab_1.tabpage_select.dw_select.SetItem(row, 'ps_tabla', tab_1.tabpage_select.dw_select.GetItemString(1,'ps_tabla'))
		This.SetRedraw(TRUE)
		return 2
	end if
	This.SetRedraw(TRUE)
END IF


end event

event clicked;DatawindowChild ldwch_nombre_campos
string ls_tabla

IF dwo.name = 'ps_columna' THEN
	This.SetRedraw(False)
	ls_tabla = tab_1.tabpage_select.dw_select.GetItemString(row, 'ps_tabla')
	
	tab_1.tabpage_select.dw_select.GetChild('ps_columna', ldwch_nombre_campos)
	ldwch_nombre_campos.SetTransObject(SQLCA)
	ldwch_nombre_campos.Reset()
	ldwch_nombre_campos.Retrieve(ls_tabla)
	This.SetRedraw(True)
	//tab_1.tabpage_select.dw_select.SetItem(row, 'ps_columna', ldwch_nombre_campos.GetItemString(1,1))
//	AcceptText()
//	wf_insertar_filas_claus_where()
END IF


end event

type tabpage_where from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3278
integer height = 716
long backcolor = 79741120
string text = "Where"
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_where dw_where
end type

on tabpage_where.create
this.dw_where=create dw_where
this.Control[]={this.dw_where}
end on

on tabpage_where.destroy
destroy(this.dw_where)
end on

type dw_where from datawindow within tabpage_where
integer x = 110
integer y = 60
integer width = 3072
integer height = 608
integer taborder = 30
string dataobject = "d_clausula_where"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type tabpage_sintaxis from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3278
integer height = 716
long backcolor = 79741120
string text = "Sintaxis"
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
mle_sintax mle_sintax
end type

on tabpage_sintaxis.create
this.mle_sintax=create mle_sintax
this.Control[]={this.mle_sintax}
end on

on tabpage_sintaxis.destroy
destroy(this.mle_sintax)
end on

type mle_sintax from multilineedit within tabpage_sintaxis
integer x = 73
integer y = 28
integer width = 3109
integer height = 640
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_consulta_sql
integer x = 87
integer y = 876
integer width = 3314
integer height = 88
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Informe generado"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_consulta_sql
event ue_clicked ( )
boolean visible = false
integer x = 105
integer y = 992
integer width = 3269
integer height = 724
integer taborder = 20
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event ue_clicked;

dw_1.Setredraw(False)
dw_1.selectrow(1, true)
dw_1.selectrow(0, False)
dw_1.Setredraw(True)
end event

event clicked;
IF ypos > 12 OR ypos < 4  then return 1
IF dwo.name <> 'datawindow' OR row > 0 THEN  return 1


end event

type st_4 from statictext within w_consulta_sql
integer x = 87
integer y = 968
integer width = 3314
integer height = 760
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type


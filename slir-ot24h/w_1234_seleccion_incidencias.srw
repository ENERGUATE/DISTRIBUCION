HA$PBExportHeader$w_1234_seleccion_incidencias.srw
forward
global type w_1234_seleccion_incidencias from w_sgigenerica
end type
type cbx_calidad from checkbox within w_1234_seleccion_incidencias
end type
type d_lista_aviso from u_inc_2021_pr_lista_incidencia within w_1234_seleccion_incidencias
end type
type cb_1 from commandbutton within w_1234_seleccion_incidencias
end type
type dw_1 from datawindow within w_1234_seleccion_incidencias
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1234_seleccion_incidencias
end type
type cb_buscar from commandbutton within w_1234_seleccion_incidencias
end type
type gb_1 from groupbox within w_1234_seleccion_incidencias
end type
type st_desde from statictext within w_1234_seleccion_incidencias
end type
type st_hasta from statictext within w_1234_seleccion_incidencias
end type
type em_incid_desde from editmask within w_1234_seleccion_incidencias
end type
type em_incid_hasta from editmask within w_1234_seleccion_incidencias
end type
type st_2 from statictext within w_1234_seleccion_incidencias
end type
type d_deteccion from u_inc_2013_pr_desde_hasta within w_1234_seleccion_incidencias
end type
end forward

global type w_1234_seleccion_incidencias from w_sgigenerica
integer x = 293
integer y = 400
integer width = 3173
integer height = 1596
string title = "OPEN SGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Incidencias"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
event ue_armar_sql pbm_custom74
event ue_retrieve pbm_custom46
event ue_post_open pbm_custom56
cbx_calidad cbx_calidad
d_lista_aviso d_lista_aviso
cb_1 cb_1
dw_1 dw_1
dw_ambito dw_ambito
cb_buscar cb_buscar
gb_1 gb_1
st_desde st_desde
st_hasta st_hasta
em_incid_desde em_incid_desde
em_incid_hasta em_incid_hasta
st_2 st_2
d_deteccion d_deteccion
end type
global w_1234_seleccion_incidencias w_1234_seleccion_incidencias

type variables
u_generico_comunicaciones lu_comunic // Variable local de trabajo de comunicacion
string is_select_original,is_clausula_where,is_modificacion
string retorno
long resultado
int fila_ant
long ll_fila_select
boolean ib_si_valido
long il_inc_seleccionada
int i
boolean ib_parametro_salmt //**  OSGI 2001.1  	06/04/2001
DateTime idt_fecha_desde, idt_fecha_hasta
end variables

forward prototypes
public function boolean fnu_w_valido_datos_recibidos (ref u_generico_comunicaciones ps_comunic)
public subroutine fpr_w_presentacion ()
public subroutine frn_w_inicializo_val_def ()
protected function boolean fw_valido_fechas ()
protected function string fw_filtro_desde_hasta ()
end prototypes

event ue_armar_sql;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_armar_sql
//
// Objetivo:
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
// 09/02/1999	    FDO
// 27/04/2000	    FDO					  Inc. Calidad
/////////////////////////////////////////////////////////// 

SetPointer(HourGlass!)
String l, ls_filtro_ambito="", ls_filtro_deteccion="", ls_filtro_desde_hasta=""

d_deteccion.AcceptText()
dw_ambito.AcceptText()

// Se valida el contenido del filtro del n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
If Long(em_incid_desde.Text) < 0 or Long(st_hasta) < 0  then 
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de incidencias no pueden ser menores que 0.")
	return
end if
If Long(em_incid_hasta.Text) = 0 and Long(em_incid_desde.Text) <> 0  then
   em_incid_hasta.Text =  em_incid_desde.Text
end if	
If Long(em_incid_desde.Text) = 0  and Long(em_incid_hasta.Text) <> 0  then
  	em_incid_desde.Text = em_incid_hasta.Text
end if	
If Long(em_incid_hasta.Text) - Long(em_incid_desde.Text) > 100 then
   em_incid_hasta.Text = String(Long(em_incid_desde.Text) + 100)
end if	
If Long(em_incid_hasta.Text) < Long(em_incid_desde.Text) then
	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de incidencias no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
	return
end if
// Reseteo las variables.

is_clausula_where = " "
is_modificacion=" "

// Miro por si se ha escogido calidad.
if cbx_calidad.checked=true then
	is_clausula_where =  &
		" AND SGD_INCIDENCIA.EST_ACTUAL 		<"  + String(fgci_incidencia_servicio_repuesto) + & 
		" AND SGD_INCIDENCIA.ALCANCE     	= "  + String(fgci_incidencia_de_instalacion) + & 
		" AND SGD_INCIDENCIA.TIP_INCIDENCIA = " + String(fgci_incidencia_calidad)
else
//***************************************
//**  OSGI 2001.1  	16/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	16/04/2001  	is_clausula_where =  &
//**  OSGI 2001.1  	16/04/2001  		" AND SGD_INCIDENCIA.EST_ACTUAL 		<= " + String(fgci_incidencia_servicio_repuesto) + & 
//**  OSGI 2001.1  	16/04/2001  		" AND SGD_INCIDENCIA.ALCANCE     	=  " + String(fgci_incidencia_con_interrupcion) + & 
//**  OSGI 2001.1  	16/04/2001  		" AND SGD_INCIDENCIA.TIP_INCIDENCIA <> " + String(fgci_incidencia_calidad) 
	is_clausula_where =  &
		" AND SGD_INCIDENCIA.EST_ACTUAL 		< " + String(fgci_incidencia_servicio_repuesto) + &
		" AND ( SGD_INCIDENCIA.ALCANCE     	=  " + String(fgci_incidencia_con_interrupcion) + &
		" OR SGD_INCIDENCIA.TIP_INCIDENCIA = " + String(fgci_incidencia_alum_pub) + ")" + &
		" AND SGD_INCIDENCIA.TIP_INCIDENCIA <> " + String(fgci_incidencia_calidad)
//***************************************
//**  OSGI 2001.1  	1604/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end if

// Se obtiene la parte de la WHERE que surje del filtro de n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
ls_filtro_desde_hasta = fw_filtro_desde_hasta() 

if trim(ls_filtro_desde_hasta) = ""  then
	// Si el contenido del filtro de n$$HEX1$$fa00$$ENDHEX$$mero de incidencia est$$HEX2$$e1002000$$ENDHEX$$vac$$HEX1$$ed00$$ENDHEX$$o se tiene en
	// cuenta el $$HEX1$$e100$$ENDHEX$$mbito y las fechas
	IF NOT fw_valido_fechas() THEN
		// Si las fechas no son correctas no se continua
		return
	ELSE
		ls_filtro_ambito = dw_ambito.fnu_filtro_ambito_2(dw_ambito.getitemnumber(1,"nro_centro"), & 
															 dw_ambito.getitemnumber(1,"nro_cmd") ,     &
															 dw_ambito.getitemnumber(1,"nro_mesa"),0) // Parte del where para el ambito
		ls_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_2(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) // Parte del where para deteccion
	END IF
end if

// Forma la cl$$HEX1$$e100$$ENDHEX$$usula where
if trim(ls_filtro_ambito) <> "" then
	is_clausula_where = is_clausula_where + " and " + ls_filtro_ambito 
end if

if trim(ls_filtro_deteccion) <> ""  then
	is_clausula_where = is_clausula_where +" AND "+ ls_filtro_deteccion 
end if

if trim(ls_filtro_desde_hasta) <> ""  then
	dw_ambito.fnu_insertar_datos(fgci_todos, fgci_todos, fgci_todos, 0)
	is_clausula_where = is_clausula_where +" AND "+ ls_filtro_desde_hasta
end if

is_modificacion = "DataWindow.table.Select=~"" + is_select_original + is_clausula_where + "~""

retorno = d_lista_aviso.modify(is_modificacion)

d_lista_aviso.settransobject(sqlca)

this.triggerevent("ue_retrieve")

IF d_lista_aviso.RowCount()>0 THEN
	d_lista_aviso.SelectRow(0,False)
	d_lista_aviso.SelectRow(1,True)
ELSE
	gnv_msg.f_mensaje("AI75","","",OK!)
END IF
end event

event ue_retrieve;int xx
DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

this.setredraw(false)
d_lista_aviso.setredraw(false)
xx = d_lista_aviso.fnu_obtener_datos()


//IF gb_operaciones AND cbx_calidad.checked=false THEN
//	d_lista_aviso.SetFilter('tip_tension > ' + string(gi_tension_nivel_min))
//	d_lista_aviso.Filter()
//END IF

d_lista_aviso.selectrow(0,False)
IF d_lista_aviso.rowcount()>0 THEN
	d_lista_aviso.selectrow(1,True)
	d_lista_aviso.setrow(1)
END IF

IF d_lista_aviso.RowCount() > 0 THEN
	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
		
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Listado de Incidencias'
	ll_longitud = len (ls_titulo)*100
		
	dw_1.modify("nulo_desde.visible = '0")
	dw_1.modify("f_desde.visible='0'")
	dw_1.modify("desde.Visible='0'")
	dw_1.modify("nulo_hasta.visible = '0'")
	dw_1.modify("f_hasta.visible='0'")
	dw_1.modify("hasta.Visible='0'")
		
	// si no son nulas las inserto
	dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
	dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
	dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
		
	//d_lista_aviso.ShareData(dw_datos)
END IF

d_lista_aviso.setredraw(true)	
this.setredraw(true)									
end event

event ue_post_open;ib_si_valido=True
this.setredraw(false)

// Variable de comunicacaciones es gu_comunic.

// Devuelve valores en 
// 	gu_comunic.is_comunic.longval1 // numero de incidencia seleccionada
//		gu_comunic.is_comunic.accion_retorno = "Seleccionada"
//															"No Seleccionada"
//		gu_comunic.is_comunic.strval1  // descripcion de la incidencia
				

//******************CREACION DE OBJETOS DE TRABAJO***********************
	lu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
	
	
//******************OBTENGO y VALIDO  PARAMETROS DE ENTRADA*************************
//
	lu_comunic.is_comunic = gu_comunic.is_comunic // Transfiero valores desde globales.

	if fnu_w_valido_datos_recibidos(lu_comunic)  then  // Validos los valores de los parametros
		gnv_msg.f_mensaje("EG17","","",OK!)
	end if

fpr_w_presentacion() // titulos ventana y crea dropdoun


////***************INICIALIZACION DE VALORES POR DEFECTO********************
	frn_w_inicializo_val_def() // Inicializo  valores por defecto

//****************EFECTUO EL RETRIEVE A LA BASE DE DATOS*******************
	// Obtengo la clausula select original de la datawindow.
	d_lista_aviso.settransobject(sqlca) // me conecto a la base para modificar
	is_select_original = d_lista_aviso.describe("datawindow.table.select")
	
	this.triggerevent("ue_armar_sql")
this.setredraw(true)	

end event

public function boolean fnu_w_valido_datos_recibidos (ref u_generico_comunicaciones ps_comunic);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_w_valido_datos_recibidos
// 
// Objetivo: Valida la informaci$$HEX1$$f300$$ENDHEX$$n recibida y la resetea con 
//           valores por defecto en caso de que exista incoherencia
//           en la misma.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: ps_comunic
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////


// VALIDO EL AMBITO PARA LA CONSULTA

	// Si el ambito no es valido para la consulta asume el ambito por defecto
	// del usuario que esta efectuando la consulta.

	if lu_comunic.is_comunic.intval1 = 0 then // Valido el ambito
			ps_comunic.is_comunic.intval1 = gi_nro_centro // Utilizo centro del usuario
			ps_comunic.is_comunic.intval2 = gi_nro_cmd    // Utilizo cmd del usuario
			ps_comunic.is_comunic.intval3 = gi_nro_puesto // Utilizo puesto del usuario
	end if


// VALIDACION DE PERIODO A CONSULTAR

datetime ld_fecha // variable temporal de fecha

	if ps_comunic.is_comunic.datval1 > ps_comunic.is_comunic.datval2 then // Si las fechas estan invertidas las cambio asumiendo de menor a mayor
			ld_fecha =	ps_comunic.is_comunic.datval1
			ps_comunic.is_comunic.datval1 = ps_comunic.is_comunic.datval2
			ps_comunic.is_comunic.datval2 = ld_fecha
	end if
	


return false
end function

public subroutine fpr_w_presentacion ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fpr_w_presentacion
// 
// Objetivo: Pone t$$HEX1$$ed00$$ENDHEX$$tulos a las ventanas dependiendo de la acci$$HEX1$$f300$$ENDHEX$$n
//           llamada , crea y habilita objetos de trabajo.
//          
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros
// 		Entrada: --
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////////////////




//********************TITULO DE LA VENTANA*******************************
//
	IF lu_comunic.is_comunic.Accion_Llamada = "Consulta" then
		this.title = fg_etiqueta(2000004)
	end if
	
	if lu_comunic.is_comunic.accion_llamada = "Seleccion" then
		this.title = fg_etiqueta(2000005)
	end if

	if lu_comunic.is_comunic.accion_llamada = "Actualizacion" then
		this.title = fg_etiqueta(2000006)
	end if


IF gb_operaciones AND gi_tension_nivel_min = fgci_baja_tension THEN
	cbx_calidad.checked=true
	cbx_calidad.enabled=false
END IF

end subroutine

public subroutine frn_w_inicializo_val_def ();
lu_comunic.is_comunic.longval1 = 0 // reseto para asegurar valor por defecto de 
													// incidencia seleccionada
	


end subroutine

protected function boolean fw_valido_fechas ();Boolean lb_retorno = TRUE

DateTime ldt_fecha_desde
DateTime ldt_fecha_hasta

ldt_fecha_desde=d_deteccion.getitemdatetime(1,"desde")
ldt_fecha_hasta=d_deteccion.getitemdatetime(1,"hasta")

IF NOT FGNU_ES_NULA(ldt_fecha_hasta) then
	IF ldt_fecha_desde > ldt_fecha_hasta THEN
		gnv_msg.f_mensaje("EI25","","",OK!)
		d_deteccion.setitem(1,"desde",idt_fecha_desde)
		d_deteccion.accepttext()
		d_deteccion.setcolumn("desde")
		d_deteccion.setfocus()
		lb_retorno = false
	END IF
END IF
////////////////////////////////////VALIDO FECHA HASTA////////////////
IF lb_retorno THEN
	IF FGNU_ES_NULA(ldt_fecha_hasta) THEN
		gnv_msg.f_mensaje("EI27","","",OK!)
		d_deteccion.setitem(1,"hasta",idt_fecha_hasta)
		d_deteccion.accepttext()
		d_deteccion.setcolumn("hasta")
		d_deteccion.setfocus()
		lb_retorno = FALSE
	END IF
END IF
IF lb_retorno THEN
	IF NOT FGNU_ES_NULA(ldt_fecha_desde) then
		IF ldt_fecha_hasta< ldt_fecha_desde THEN
			gnv_msg.f_mensaje("EI26","","",OK!)
			d_deteccion.setitem(1,"hasta",idt_fecha_hasta)
			d_deteccion.accepttext()
			d_deteccion.setcolumn("hasta")
			d_deteccion.setfocus()
			lb_retorno = FALSE
		END IF
	END IF
END IF

return lb_retorno
end function

protected function string fw_filtro_desde_hasta ();String ls_retorno = ""

IF Long(em_incid_desde.Text) > 0 THEN
	IF Long(em_incid_desde.Text) = Long(em_incid_hasta.Text) THEN
		ls_retorno = " SGD_INCIDENCIA.NRO_INCIDENCIA = " + em_incid_desde.Text  
	ELSE
		ls_retorno = " SGD_INCIDENCIA.NRO_INCIDENCIA >= " + em_incid_desde.Text  + &
						 " AND SGD_INCIDENCIA.NRO_INCIDENCIA <= " + em_incid_hasta.Text  
	END IF
END IF

return ls_retorno
end function

on close;call w_sgigenerica::close;lu_comunic.is_comunic.programa_retorno = "iw_1234"
gu_comunic.is_comunic = lu_comunic.is_comunic

//*********************CLOSE DE LOS OBJETOS UTILIZADOS**********************

DESTROY lu_comunic


end on

event open;call super::open;//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Visible = False
//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


l_grabo_inc=true
Yield()

// Se carga el filtro del $$HEX1$$e100$$ENDHEX$$mbito con el $$HEX1$$e100$$ENDHEX$$mbito del usuario
dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)

// Se carga el filtro de fechas
d_deteccion.insertrow(0)
d_deteccion.setitem(1,"desde",Date(fgnu_fecha_actual()))
d_deteccion.setitem(1,"hasta",fgnu_fecha_actual())

dw_1.modify("data_1.DataObject ='" + d_lista_aviso.DataObject + "'")

this.Postevent("ue_post_open")

//***************************************
//**  OSGI 2001.1  	14/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fg_ventana_parametro(This.ClassName(), d_lista_aviso)
fg_alto_texto(d_lista_aviso, d_lista_aviso.ClassName(), 0)
This.Visible = True
//***************************************
//**  OSGI 2001.1  	14/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

//if d_lista_aviso.rowcount()=0 then
//	gnv_msg.f_mensaje("AI75","","",OK!)
	//messagebox("Aviso","No se encuentra ninguna Incidencia disponible, para poder asociar a ella.")
	//close(this)
	//Return
//end if
end event

on w_1234_seleccion_incidencias.create
int iCurrent
call super::create
this.cbx_calidad=create cbx_calidad
this.d_lista_aviso=create d_lista_aviso
this.cb_1=create cb_1
this.dw_1=create dw_1
this.dw_ambito=create dw_ambito
this.cb_buscar=create cb_buscar
this.gb_1=create gb_1
this.st_desde=create st_desde
this.st_hasta=create st_hasta
this.em_incid_desde=create em_incid_desde
this.em_incid_hasta=create em_incid_hasta
this.st_2=create st_2
this.d_deteccion=create d_deteccion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_calidad
this.Control[iCurrent+2]=this.d_lista_aviso
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.dw_ambito
this.Control[iCurrent+6]=this.cb_buscar
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.st_desde
this.Control[iCurrent+9]=this.st_hasta
this.Control[iCurrent+10]=this.em_incid_desde
this.Control[iCurrent+11]=this.em_incid_hasta
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.d_deteccion
end on

on w_1234_seleccion_incidencias.destroy
call super::destroy
destroy(this.cbx_calidad)
destroy(this.d_lista_aviso)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.dw_ambito)
destroy(this.cb_buscar)
destroy(this.gb_1)
destroy(this.st_desde)
destroy(this.st_hasta)
destroy(this.em_incid_desde)
destroy(this.em_incid_hasta)
destroy(this.st_2)
destroy(this.d_deteccion)
end on

on closequery;if lu_comunic.is_comunic.longval1 = 0 then
	lu_comunic.is_comunic.accion_retorno = "No Seleccionada"
end if 

end on

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
//IF dw_datos.RowCount() = 0 THEN triggerevent("ue_armar_sql")

IF d_lista_aviso.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)

d_lista_aviso.sharedata(dw_datos)

s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_aviso

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1234_seleccion_incidencias
end type

type cbx_calidad from checkbox within w_1234_seleccion_incidencias
integer x = 2171
integer y = 424
integer width = 832
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
string text = "Incidencias de Calidad"
boolean lefttext = true
end type

event clicked;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: Clicked
//
// Objetivo: Lanzar el retrieve de la Datawindow de Calidad
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
// 27/04/2000	    FDO
//		
/////////////////////////////////////////////////////////// 
d_lista_aviso.setfocus()
parent.triggerevent("ue_armar_sql")

end event

type d_lista_aviso from u_inc_2021_pr_lista_incidencia within w_1234_seleccion_incidencias
integer x = 64
integer y = 540
integer width = 3008
integer height = 740
integer taborder = 70
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;
if row > 0 then
	CHOOSE CASE lu_comunic.is_comunic.accion_llamada
		CASE "Seleccion"
				//cuando entra con opcion seleecion simpre esta habilitada
		
					lu_comunic.is_comunic.longval1 = this.getitemnumber(this.getrow(),"nro_incidencia")
					IF lu_comunic.is_comunic.longval1 <> 0 THEN
						SetPointer(HourGlass!)
						lu_comunic.is_comunic.accion_retorno = "Seleccionada"
						lu_comunic.is_comunic.strval1 = this.getitemstring(this.getrow(),"desc_incidencia")
						lu_comunic.is_comunic.intval1 = this.getitemnumber(this.getrow(),"tip_incidencia")
						close(Parent)	

					END IF
					
		CASE "Consulta"
				//cuando entra con opcion seleecion simpre esta habilitada			
				SetPointer(HourGlass!)	
				gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
				gu_comunic.is_comunic.accion_llamada="Consulta"
				
				gu_comunic.is_comunic.longval3 =  this.getitemnumber(this.getrow(),"nro_incidencia")
				//IF gs_programa_principal = "w_operaciones" THEN
				gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
					//opensheet(w_2301_form_incidencia,w_operaciones,7,layered!)
				//ELSE
				//	opensheet(w_2301_form_incidencia,w_prin,4,layered!)
				//END IF


		CASE 	"Actualizacion"

		END CHOOSE

end if


end event

event clicked;call super::clicked;if row > 0 then
	this.selectrow(0,False)
	fila_ant = row
	this.selectrow(row,true)
end if


end event

on scrollvertical;call u_inc_2021_pr_lista_incidencia::scrollvertical;//asdfasdf
int a
a=1

end on

event retrieverow;call super::retrieverow;//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If ib_parametro_salmt And row > 0 Then
	This.SetItem(row, "c_nom_salmt", fg_salmt_inst_afectada(This.GetItemNumber(row, "nro_inst_afectada")))
	This.AcceptText()
End If
//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_parametro_salmt = fg_verifica_parametro(This.ClassName())
//***************************************
//**  OSGI 2001.1  	06/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event ue_key_down;call super::ue_key_down;IF Key = KeyLeftArrow! THEN
	IF this.getselectedrow(0) > 1 AND this.getselectedrow(0) < This.RowCount() THEN
		This.scrolltorow(this.getselectedrow(0)+1)
	END IF
	return
ELSEIF Key = KeyRightArrow! THEN
	IF this.getselectedrow(0)> 1 THEN
		This.scrolltorow(this.getselectedrow(0) - 1)
	END IF
	return
END IF

end event

type cb_1 from commandbutton within w_1234_seleccion_incidencias
integer x = 2683
integer y = 1320
integer width = 393
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_1234_seleccion_incidencias
boolean visible = false
integer x = 37
integer y = 256
integer width = 2034
integer height = 804
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_impresion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1234_seleccion_incidencias
integer x = 50
integer y = 20
integer width = 997
integer taborder = 10
boolean border = false
end type

type cb_buscar from commandbutton within w_1234_seleccion_incidencias
integer x = 2199
integer y = 1320
integer width = 393
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Buscar"
boolean default = true
end type

event clicked;d_lista_aviso.Reset()
Parent.TriggerEvent("ue_armar_sql")
end event

type gb_1 from groupbox within w_1234_seleccion_incidencias
integer x = 1157
integer y = 52
integer width = 878
integer height = 312
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "N$$HEX1$$fa00$$ENDHEX$$mero de Incidencia"
end type

type st_desde from statictext within w_1234_seleccion_incidencias
integer x = 1211
integer y = 148
integer width = 297
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 8388608
long backcolor = 79741120
string text = "Desde :"
boolean focusrectangle = false
end type

event doubleclicked;IF em_incid_desde.Text <> "" OR em_incid_hasta.Text <> "" THEN
	em_incid_desde.Text= ""
	em_incid_hasta.Text= ""
	d_deteccion.modify("desde.background.color ="+gs_blanco)
	d_deteccion.modify("hasta.background.color ="+gs_blanco)
	d_deteccion.enabled = true
END IF
end event

type st_hasta from statictext within w_1234_seleccion_incidencias
integer x = 1211
integer y = 252
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Hasta :"
boolean focusrectangle = false
end type

type em_incid_desde from editmask within w_1234_seleccion_incidencias
integer x = 1509
integer y = 132
integer width = 421
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##########"
boolean spin = true
double increment = 1
string minmax = "1~~"
end type

event modified;IF This.text <> "" then
	d_deteccion.modify("desde.background.color ="+gs_gris)
   d_deteccion.modify("hasta.background.color ="+gs_gris)
	d_deteccion.enabled = false
	
ELSEIF em_incid_hasta.Text = "" THEN
	d_deteccion.modify("desde.background.color ="+gs_blanco)
   d_deteccion.modify("hasta.background.color ="+gs_blanco)
   d_deteccion.enabled = true
END IF	
end event

type em_incid_hasta from editmask within w_1234_seleccion_incidencias
integer x = 1509
integer y = 240
integer width = 421
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##########"
boolean spin = true
double increment = 1
string minmax = "1~~"
end type

event modified;IF This.text <> "" then
	d_deteccion.modify("desde.background.color ="+gs_gris)
   d_deteccion.modify("hasta.background.color ="+gs_gris)
	d_deteccion.enabled = false
	
ELSEIF em_incid_desde.Text = "" THEN
	d_deteccion.modify("desde.background.color ="+gs_blanco)
   d_deteccion.modify("hasta.background.color ="+gs_blanco)
   d_deteccion.enabled = true
END IF	
end event

type st_2 from statictext within w_1234_seleccion_incidencias
integer x = 2162
integer y = 52
integer width = 443
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Detecci$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
boolean focusrectangle = false
end type

type d_deteccion from u_inc_2013_pr_desde_hasta within w_1234_seleccion_incidencias
event ue_cambio_desde pbm_custom45
event ue_cambio_hasta pbm_custom46
integer x = 2135
integer y = 48
integer width = 983
integer height = 344
integer taborder = 50
boolean border = false
end type

on ue_cambio_desde;call u_inc_2013_pr_desde_hasta::ue_cambio_desde;DateTime ldt_fecha_desde
d_deteccion.setitem(1,"desde",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"desde")))
d_deteccion.accepttext()

		


end on

on ue_cambio_hasta;call u_inc_2013_pr_desde_hasta::ue_cambio_hasta;DateTime ldt_fecha_hasta
d_deteccion.setitem(1,"hasta",fgnu_valido_fecha_nula(d_deteccion.getitemdatetime(1,"hasta")))
d_deteccion.accepttext()

end on

on dberror;//Para eliminar el scrip del padre
end on

on itemchanged;String ls_columna
Datetime ldt_fecha_desde
Datetime ldt_fecha_hasta
ls_columna=This.getcolumnname()
ib_si_valido=True
CHOOSE CASE ls_columna
	CASE "desde"
		idt_fecha_desde=this.getitemdatetime(1,"Desde")
	CASE "hasta"
		idt_fecha_hasta=this.getitemdatetime(1,"Hasta")	
END CHOOSE


end on

event rbuttondown;m_der_fechas lm_gestion_avi
lm_gestion_avi = CREATE m_der_fechas
m_der_fechas.idw_dw=this
lm_gestion_avi.PopMenu(xpos + 2000, ypos + 250)
destroy lm_gestion_avi

end event


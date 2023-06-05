HA$PBExportHeader$w_1234_seleccion_incidencias_resueltas.srw
forward
global type w_1234_seleccion_incidencias_resueltas from w_1234_seleccion_incidencias
end type
end forward

global type w_1234_seleccion_incidencias_resueltas from w_1234_seleccion_incidencias
end type
global w_1234_seleccion_incidencias_resueltas w_1234_seleccion_incidencias_resueltas

on w_1234_seleccion_incidencias_resueltas.create
call super::create
end on

on w_1234_seleccion_incidencias_resueltas.destroy
call super::destroy
end on

event ue_armar_sql;//***************************************
//**  OSGI 2001.1  	16/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
// OVERRIDE
// OVERRIDE
// OVERRIDE
// OVERRIDE
// OVERRIDE

//PONER OVERRIDE ESTE EVENTO
//PONER OVERRIDE ESTE EVENTO
//PONER OVERRIDE ESTE EVENTO
//PONER OVERRIDE ESTE EVENTO
//PONER OVERRIDE ESTE EVENTO


//////////////////////////////////////////////////////////
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
		" AND (SGD_INCIDENCIA.EST_ACTUAL 		="  + String(fgci_incidencia_resuelta) + & 
		" OR SGD_INCIDENCIA.EST_ACTUAL 		="  + String(fgci_incidencia_servicio_repuesto) + ")" + &
		" AND SGD_INCIDENCIA.ALCANCE     	= "  + String(fgci_incidencia_de_instalacion) + & 
		" AND SGD_INCIDENCIA.TIP_INCIDENCIA = " + String(fgci_incidencia_calidad)
else
	is_clausula_where =  &
		" AND (SGD_INCIDENCIA.EST_ACTUAL 		= " + String(fgci_incidencia_resuelta) + &
		" OR SGD_INCIDENCIA.EST_ACTUAL 		="  + String(fgci_incidencia_servicio_repuesto) + ")" + &
		" AND ( SGD_INCIDENCIA.ALCANCE     	=  " + String(fgci_incidencia_con_interrupcion) + &
		" OR SGD_INCIDENCIA.TIP_INCIDENCIA = " + String(fgci_incidencia_alum_pub) + ")" + &
		" AND SGD_INCIDENCIA.TIP_INCIDENCIA <> " + String(fgci_incidencia_calidad)
end if

// Se obtiene la parte de la WHERE que surje del filtro de n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
ls_filtro_desde_hasta = fw_filtro_desde_hasta()

if trim(ls_filtro_desde_hasta) = ""  then
	// Si el contenido del filtro de n$$HEX1$$fa00$$ENDHEX$$mero de incidencia est$$HEX2$$e1002000$$ENDHEX$$vac$$HEX1$$ed00$$ENDHEX$$o se tiene en
	// cuenta el $$HEX1$$e100$$ENDHEX$$mbito y las fechas
	IF NOT fw_valido_fechas() THEN
		// Si las fechas no son correctas no se contin$$HEX1$$fa00$$ENDHEX$$a
		return
	ELSE
	
		ls_filtro_ambito = dw_ambito.fnu_filtro_ambito_2(dw_ambito.getitemnumber(1,"nro_centro"), & 
															 dw_ambito.getitemnumber(1,"nro_cmd") ,     &
															 dw_ambito.getitemnumber(1,"nro_mesa"),0) // Parte del where para el ambito
		ls_filtro_deteccion = d_deteccion.fnu_filtro_deteccion_2(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) // Parte del where para deteccion
	END IF
end if

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

// Forma la cl$$HEX1$$e100$$ENDHEX$$usula where
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
//***************************************
//**  OSGI 2001.1  	16/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event open;call super::open;If IsValid(This) Then
	This.Title += ' Resueltas'
End If
end event

type cbx_calidad from w_1234_seleccion_incidencias`cbx_calidad within w_1234_seleccion_incidencias_resueltas
int X=2135
int Width=869
boolean BringToTop=true
end type

event d_lista_aviso::sqlpreview;call super::sqlpreview;//MessageBox("sqlsyntax", sqlsyntax)
end event

type cb_1 from w_1234_seleccion_incidencias`cb_1 within w_1234_seleccion_incidencias_resueltas
boolean BringToTop=true
end type

type dw_1 from w_1234_seleccion_incidencias`dw_1 within w_1234_seleccion_incidencias_resueltas
boolean BringToTop=true
end type

type cb_buscar from w_1234_seleccion_incidencias`cb_buscar within w_1234_seleccion_incidencias_resueltas
boolean BringToTop=true
end type

type st_desde from w_1234_seleccion_incidencias`st_desde within w_1234_seleccion_incidencias_resueltas
int X=1193
int Width=315
boolean BringToTop=true
end type

type st_hasta from w_1234_seleccion_incidencias`st_hasta within w_1234_seleccion_incidencias_resueltas
int X=1193
int Width=315
boolean BringToTop=true
end type

type em_incid_desde from w_1234_seleccion_incidencias`em_incid_desde within w_1234_seleccion_incidencias_resueltas
boolean BringToTop=true
end type

type em_incid_hasta from w_1234_seleccion_incidencias`em_incid_hasta within w_1234_seleccion_incidencias_resueltas
boolean BringToTop=true
end type


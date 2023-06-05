HA$PBExportHeader$u_2120_arbol_seleccion_instalacion.sru
$PBExportComments$Arbol para seleccion de instalacion en la ventana w_2120
forward
global type u_2120_arbol_seleccion_instalacion from uo_man_instalac
end type
end forward

global type u_2120_arbol_seleccion_instalacion from uo_man_instalac
integer width = 1230
integer height = 780
fontcharset fontcharset = ansi!
integer indent = 3
string picturename[] = {"subest.bmp","sal_tra1.bmp","ct1.bmp","Transf2.bmp","Library!","cl.bmp","cr.bmp","alumbrado.bmp","brigada1.bmp"}
integer statepicturewidth = 16
integer statepictureheight = 16
end type
global u_2120_arbol_seleccion_instalacion u_2120_arbol_seleccion_instalacion

type variables
// DataStore com los datos de instalacion
DataStore ids_datos

Boolean ib_usa_trafo  //**  OSGI 2001.1   14/07/2001

end variables

forward prototypes
public subroutine f_reset ()
public subroutine f_cargar_root ()
public subroutine f_cargar_root_por_cmd (integer pl_cmd)
public subroutine f_cargar_root_consulta_asoc ()
public subroutine f_cargar_hijos (long pl_handle, boolean pb_con_acom)
public function integer f_cargar_estructura (ref u_generico_comunicaciones ps_datos, ref datawindow pdw_fases)
public subroutine f_cargar_root_descargos ()
public subroutine f_cargar_root_por_cmd_descargos (integer pl_cmd)
public function long f_buscar_instalacion (string ps_nombre, integer pi_tipo, integer pi_tipo_busqueda)
end prototypes

public subroutine f_reset ();//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_reset
//
//	Objetivo:	Limpiar todos los elementos del arbol e de la DW de datos
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	---
//					Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias		Creacion
//
//////////////////////////////////////////////////////////////

// Declaracion de Variables

Long ll_fila, ll_handle

/////////////// INICIO DEL PROGRAMA /////////////////

// Para limpiarmos el arbol necesitamos eliminar los itens
// que son root, las subestaciones. Recorreremos la DW 
// buscando y eliminando todas ellas.

// Buscamos la primera subestacion
//ll_fila = ids_datos.Find("cn_tipo = 1", 0, ids_datos.RowCount())

// Modificado por AFE: El primer nivel puede ser cualquier tipo de instalacion
ll_fila = ids_datos.Find("cl_padre = " + string(fgcdec_aviso_con_alimentacion), 0, ids_datos.RowCount())


// Recorremos la DW 
Do While ll_fila <> 0
	
	// Eliminamos la subestacion
	ll_handle = ids_datos.GetItemNumber(ll_fila, "cl_handle")
	This.DeleteItem(ll_handle)
	
	// Proteccion contra loop infinito...
	If ll_fila = ids_datos.RowCount() Then Exit

	// Buscamos la proxima subestacion
	//ll_fila = ids_datos.Find("cn_tipo = 1", ll_fila+1, ids_datos.RowCount())
	ll_fila = ids_datos.Find("cl_padre = " + string(fgcdec_aviso_con_alimentacion), ll_fila+1, ids_datos.RowCount())
	
Loop

// Limpiamos la DW
ids_datos.Reset()

Return

end subroutine

public subroutine f_cargar_root ();//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:	f_cargar_root
//
//	Objetivo:	Cargar las subestaciones en el root del arbol.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	---
//					 Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias	 	Creacion
//		08/02/2005	LFE				Mejora Guatemala: alimentaci$$HEX1$$f300$$ENDHEX$$n suministro-CT
//////////////////////////////////////////////////////////////

// Declaracion de Variables

Long 	ll_handle, ll_nro_inst, ll_nro_padre, &
		ll_kwh, ll_centro, ll_cmd, ll_mesa, ll_calle, ll_puerta, &
		ll_cant_cli, ll_fila, ll_con_alim, ll_inst_eliminadas
Integer li_tipo_inst, li_nivel, li_tension
String ls_dup, ls_nombre, ls_calle, ls_desc

// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
String ls_matricula
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Decimal ll_pot_cont, ll_pot_inst
String ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst
//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

TreeViewItem ltvi_nuevo

//if gb_operaciones = TRUE THEN
//	CHOOSE CASE gi_tension_nivel_min
//			
//		CASE 1 // ALTA Tensi$$HEX1$$f300$$ENDHEX$$n. Hay que mostrar las subestaciones
//			li_tipo_instalacion = 1
//			ll_con_alim = fgcdec_aviso_con_alimentacion
//		CASE 2 // MEDIA TENSION. Hay que mostrar las salidas de baja
//			li_tipo_instalacion = 5
//			ll_con_alim = 0
//		CASE 3 // la ventana no debe abrirse con representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica en
//				// alta, media y baja tensi$$HEX1$$f300$$ENDHEX$$n
//			li_tipo_instalacion = 0
//			ll_con_alim = 0
//	END CHOOSE
//ELSE
//	li_tipo_instalacion = 1
	ll_con_alim = fgcdec_aviso_con_alimentacion
//END IF
// Declaracion de Cursores


ll_inst_eliminadas = fgcdec_instalacion_eliminadas


//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	14/07/2001  DECLARE cSubs CURSOR FOR  
//**  OSGI 2001.1  	14/07/2001    SELECT "SGD_INSTALACION"."NRO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TIPO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NOM_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CO_NIVEL",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TENSION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_INSTALADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_CONTRATADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."KWH",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_INST_PADRE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CENTRO",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_MESA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CMD",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."COD_CALLE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NUM_PUERTA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DUPLICADOR",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CANT_CLI",
//**  OSGI 2001.1  	14/07/2001  			' ',
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DESCRIPCION"
//**  OSGI 2001.1  	14/07/2001      FROM "SGD_INSTALACION"
//**  OSGI 2001.1  	14/07/2001     WHERE "SGD_INSTALACION"."NRO_INST_PADRE" = :ll_con_alim AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."BDI_JOB" = 0	AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."ESTADO" = 0
//**  OSGI 2001.1  	14/07/2001  ORDER BY "SGD_INSTALACION"."NOM_INSTALACION" ;

ls_select_inst = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
						" SGD_INSTALACION.TIPO_INSTALACION, " + &
						" SGD_INSTALACION.NOM_INSTALACION, " + &
						" SGD_INSTALACION.CO_NIVEL, " + &
						" SGD_INSTALACION.TENSION, " + &
						" SGD_INSTALACION.POT_INSTALADA, " + &
						" SGD_INSTALACION.POT_CONTRATADA, " + &
						" SGD_INSTALACION.KWH, " + &
						" SGD_INSTALACION.NRO_INST_PADRE, " + &
						" SGD_INSTALACION.NRO_CENTRO, " + &
						" SGD_INSTALACION.NRO_MESA, " + &
						" SGD_INSTALACION.NRO_CMD, " + &
						" SGD_INSTALACION.COD_CALLE, " + &
						" SGD_INSTALACION.NUM_PUERTA, " + &
						" SGD_INSTALACION.DUPLICADOR, " + &
						" SGD_INSTALACION.CANT_CLI, " + &
						" ' ', " + &
						" SGD_INSTALACION.DESCRIPCION, " /* LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT */ +&
						" SGD_INSTALACION.MATRICULA " 
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

ls_from_inst = " FROM SGD_INSTALACION "

ls_where_inst = " WHERE SGD_INSTALACION.NRO_INST_PADRE = " + String(ll_con_alim) + " AND " + &
						" SGD_INSTALACION.BDI_JOB = 0	AND " + &
						" SGD_INSTALACION.ESTADO = 0 "

ls_orden_inst = " ORDER BY SGD_INSTALACION.NOM_INSTALACION "


If ib_usa_trafo Then
	ls_select_inst =	fg_cursor_sql(1, ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst)
Else
	ls_select_inst = ls_select_inst + ls_from_inst + ls_where_inst + ls_orden_inst
End If

DECLARE cSubs DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_select_inst ;
OPEN DYNAMIC cSubs ;

//**  OSGI 2001.1  	14/07/2001  	Open cSubs;
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



///////////////////// INICIO DEL PROGRAMA ///////////////////////

SetPointer(HourGlass!)

// Abrimos el cursor de subestaciones


Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
						:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
						:ll_nro_padre, :ll_centro, :ll_mesa, :ll_cmd, 
						:ll_calle, :ll_puerta, :ls_dup, :ll_cant_cli, 
						:ls_calle, :ls_desc
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
						,:ls_matricula
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
						;
						
// Verificamos se esta tudo OK
If SQLCA.SqlCode = -1 Then
	//No fue posible acceder a la base de datos de instalaciones.
	gnv_msg.f_mensaje("EI01", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
ElseIf SQLCA.SqlCode = 100 Then
	gnv_msg.f_mensaje("AM62", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
End If

// Resetamos el arbol
This.SetRedraw(False)
This.f_reset()

// Recorremos el cursor insertando las instalaciones de primer nivel en el arbol
Do While SQLCA.SqlCode = 0 
	
	// Seteamos o TreeView Item
	ltvi_nuevo.label = ls_nombre
	ltvi_nuevo.Data = ll_nro_inst
	ltvi_nuevo.pictureindex = This.f_icono_arbol(li_tipo_inst)
	ltvi_nuevo.selectedpictureindex = ltvi_nuevo.pictureindex
	
	// Insertamos en el arbol
	ll_handle = This.InsertItemLast( 0, ltvi_nuevo)
	
	// Insertamos en la DW de datos
	ll_fila = ids_datos.InsertRow(0)
	
	ids_datos.SetItem(ll_fila, "cl_handle", ll_handle)
	ids_datos.SetItem(ll_fila, "cl_nro", ll_nro_inst)
	ids_datos.SetItem(ll_fila, "cn_tipo", li_tipo_inst)
	ids_datos.SetItem(ll_fila, "cl_padre", ll_nro_padre)
	ids_datos.SetItem(ll_fila, "cs_nombre", ls_nombre)
	ids_datos.SetItem(ll_fila, "cn_nivel", li_nivel)
	ids_datos.SetItem(ll_fila, "cn_tension", li_tension)
	ids_datos.SetItem(ll_fila, "cl_pot_instalada", ll_pot_inst)
	ids_datos.SetItem(ll_fila, "cl_pot_contratada", ll_pot_cont)
	ids_datos.SetItem(ll_fila, "cl_kwh", ll_kwh)
	ids_datos.SetItem(ll_fila, "cl_centro", ll_centro)
	ids_datos.SetItem(ll_fila, "cl_mesa", ll_mesa)
	ids_datos.SetItem(ll_fila, "cl_cmd", ll_cmd)
	ids_datos.SetItem(ll_fila, "cl_calle", ll_calle)
	ids_datos.SetItem(ll_fila, "cl_puerta", ll_puerta)
	ids_datos.SetItem(ll_fila, "cs_duplicador", ls_dup)
	ids_datos.SetItem(ll_fila, "cl_cant_cli", ll_cant_cli)
	ids_datos.SetItem(ll_fila, "cs_descripcion", ls_desc)
	ids_datos.SetItem(ll_fila, "cs_direccion", ls_calle)
	// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	ids_datos.SetItem(ll_fila, "cs_matricula", ls_matricula)
	// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	
	// Lemos el proximo registro
	
	Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
							:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
							:ll_nro_padre, :ll_centro, :ll_mesa, :ll_cmd, 
							:ll_calle, :ll_puerta, :ls_dup, :ll_cant_cli, 
							:ls_calle, :ls_desc
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
							,:ls_matricula
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
							;
	
Loop

// Cerramos el cursor e salimos

This.SetRedraw(True)

Close cSubs;

SetPointer(Arrow!)

Return
end subroutine

public subroutine f_cargar_root_por_cmd (integer pl_cmd);//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:	f_cargar_root_por_cmd
//
//	Objetivo:	Cargar las subestaciones del CMD informador en 
//					el root del arbol.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pl_cmd - CMD a cual se va a cargar las subestaciones
//					 Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias	 	Creacion
//
//////////////////////////////////////////////////////////////

// Declaracion de Variables

Long 	ll_handle, ll_nro_inst, ll_nro_padre, &
		ll_kwh, ll_centro, ll_mesa, ll_calle, ll_puerta, ll_cant_cli, &
		ll_fila, ll_con_alim, ll_inst_eliminadas
Integer li_tipo_inst, li_nivel, li_tension
String ls_dup, ls_nombre, ls_calle, ls_desc


//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Decimal ll_pot_cont, ll_pot_inst
String ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst
//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


TreeViewItem ltvi_nuevo

//if gb_operaciones = TRUE THEN
//	CHOOSE CASE gi_tension_nivel_min
//			
//		CASE 1 // ALTA Tensi$$HEX1$$f300$$ENDHEX$$n
//		CASE 2 
//			li_tipo_instalacion = 2
//		CASE 3
//			li_tipo_instalacion = 5
//	END CHOOSE
//ELSE
//	li_tipo_instalacion = 2
//END IF
// Declaracion de Cursores

ll_con_alim = fgcdec_aviso_con_alimentacion
ll_inst_eliminadas = fgcdec_instalacion_eliminadas



//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	14/07/2001  DECLARE cSubs CURSOR FOR  
//**  OSGI 2001.1  	14/07/2001    SELECT "SGD_INSTALACION"."NRO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TIPO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NOM_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CO_NIVEL",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TENSION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_INSTALADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_CONTRATADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."KWH",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_INST_PADRE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CENTRO",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_MESA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."COD_CALLE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NUM_PUERTA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DUPLICADOR",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CANT_CLI",  
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DESCRIPCION",
//**  OSGI 2001.1  	14/07/2001  			' '
//**  OSGI 2001.1  	14/07/2001      FROM "SGD_INSTALACION"
//**  OSGI 2001.1  	14/07/2001     WHERE "SGD_INSTALACION"."NRO_INST_PADRE" = :ll_con_alim AND 
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_CMD" = :pl_cmd AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."BDI_JOB" = 0 AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."ESTADO" = 0
//**  OSGI 2001.1  	14/07/2001  	ORDER BY "SGD_INSTALACION"."NOM_INSTALACION" ;
//**  OSGI 2001.1  	14/07/2001  	
//**  OSGI 2001.1  	14/07/2001  /* WHERE "SGD_INSTALACION"."TIPO_INSTALACION" = 1 And
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_CMD" = :pl_cmd AND (
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_INST_PADRE" > 99999997 OR
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_INST_PADRE" < 99999997 ) 
//**  OSGI 2001.1  	14/07/2001  ORDER BY "SGD_INSTALACION"."NOM_INSTALACION" ; */

ls_select_inst = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
						" SGD_INSTALACION.TIPO_INSTALACION, " + &
						" SGD_INSTALACION.NOM_INSTALACION, " + &
						" SGD_INSTALACION.CO_NIVEL, " + &
						" SGD_INSTALACION.TENSION, " + &
						" SGD_INSTALACION.POT_INSTALADA, " + &   
						" SGD_INSTALACION.POT_CONTRATADA, " + &
						" SGD_INSTALACION.KWH, " + &
						" SGD_INSTALACION.NRO_INST_PADRE, " + &
						" SGD_INSTALACION.NRO_CENTRO, " + &
						" SGD_INSTALACION.NRO_MESA, " + &
						" SGD_INSTALACION.COD_CALLE, " + &
						" SGD_INSTALACION.NUM_PUERTA, " + &
						" SGD_INSTALACION.DUPLICADOR, " + &
						" SGD_INSTALACION.CANT_CLI, " + &
						" SGD_INSTALACION.DESCRIPCION, " + &
						" ' '"

ls_from_inst = " FROM SGD_INSTALACION "
if pl_cmd = 0 then 
	
	ls_where_inst = " WHERE SGD_INSTALACION.NRO_INST_PADRE = " + String(ll_con_alim) + " AND " + &
						" SGD_INSTALACION.NRO_CMD > " + String(pl_cmd) + " AND " + &
						" SGD_INSTALACION.BDI_JOB = 0 AND " + &
						" SGD_INSTALACION.ESTADO = 0 "

	
else
ls_where_inst = " WHERE SGD_INSTALACION.NRO_INST_PADRE = " + String(ll_con_alim) + " AND " + &
						" SGD_INSTALACION.NRO_CMD = " + String(pl_cmd) + " AND " + &
						" SGD_INSTALACION.BDI_JOB = 0 AND " + &
						" SGD_INSTALACION.ESTADO = 0 "
	
	
end if

ls_orden_inst = " ORDER BY SGD_INSTALACION.NOM_INSTALACION "

If ib_usa_trafo Then
	ls_select_inst =	fg_cursor_sql(1, ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst)
Else
	ls_select_inst = ls_select_inst + ls_from_inst + ls_where_inst + ls_orden_inst
End If

DECLARE cSubs DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_select_inst ;
OPEN DYNAMIC cSubs ;

//**  OSGI 2001.1  	14/07/2001  	Open cSubs;
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
	
	
///////////////////// INICIO DEL PROGRAMA ///////////////////////

SetPointer(HourGlass!)

// Abrimos el cursor de subestaciones
Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
						:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
						:ll_nro_padre, :ll_centro, :ll_mesa, :ll_calle, 
						:ll_puerta, :ls_dup, :ll_cant_cli, :ls_desc, :ls_calle;


// Verificamos se esta tudo OK
If SQLCA.SqlCode = -1 Then
	//No fue posible acceder a la base de datos de instalaciones.
	gnv_msg.f_mensaje("EI01", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
ElseIf SQLCA.SqlCode = 100 Then
	gnv_msg.f_mensaje("AM62", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
End If

// Reseteamos el arbol y la DW
This.SetRedraw(False)
This.f_reset()

// Recorremos el cursor insertando las Subestaciones en el arbol
Do While SQLCA.SqlCode = 0 
	
	// Seteamos o TreeView Item
	ltvi_nuevo.label = ls_nombre
	ltvi_nuevo.Data = ll_nro_inst
	ltvi_nuevo.pictureindex = This.f_icono_arbol(li_tipo_inst)
	ltvi_nuevo.selectedpictureindex = ltvi_nuevo.pictureindex
	
	// Insertamos en el arbol
	ll_handle = This.InsertItemLast( 0, ltvi_nuevo)
	
	// Insertamos en la DW de datos
	ll_fila = ids_datos.InsertRow(0)
	
	ids_datos.SetItem(ll_fila, "cl_handle", ll_handle)
	ids_datos.SetItem(ll_fila, "cl_nro", ll_nro_inst)
	ids_datos.SetItem(ll_fila, "cn_tipo", li_tipo_inst)
	ids_datos.SetItem(ll_fila, "cl_padre", ll_nro_padre)
	ids_datos.SetItem(ll_fila, "cs_nombre", ls_nombre)
	ids_datos.SetItem(ll_fila, "cn_nivel", li_nivel)
	ids_datos.SetItem(ll_fila, "cn_tension", li_tension)
	ids_datos.SetItem(ll_fila, "cl_pot_instalada", ll_pot_inst)
	ids_datos.SetItem(ll_fila, "cl_pot_contratada", ll_pot_cont)
	ids_datos.SetItem(ll_fila, "cl_kwh", ll_kwh)
	ids_datos.SetItem(ll_fila, "cl_centro", ll_centro)
	ids_datos.SetItem(ll_fila, "cl_mesa", ll_mesa)
	ids_datos.SetItem(ll_fila, "cl_cmd", pl_cmd)
	ids_datos.SetItem(ll_fila, "cl_calle", ll_calle)
	ids_datos.SetItem(ll_fila, "cl_puerta", ll_puerta)
	ids_datos.SetItem(ll_fila, "cs_duplicador", ls_dup)
	ids_datos.SetItem(ll_fila, "cl_cant_cli", ll_cant_cli)
	ids_datos.SetItem(ll_fila, "cs_descripcion", ls_desc)
	ids_datos.SetItem(ll_fila, "cs_direccion", ls_calle)
	
	// Leemos el proximo registro
	
	Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
							:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
							:ll_nro_padre, :ll_centro, :ll_mesa, :ll_calle, 
							:ll_puerta, :ls_dup, :ll_cant_cli, :ls_desc, :ls_calle;
	
Loop

// Cerramos el cursor e salimos
Close cSubs;

SetPointer(Arrow!)

This.SetRedraw(True)

Return
end subroutine

public subroutine f_cargar_root_consulta_asoc ();//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:	f_cargar_root_consulta_asoc
//
//	Objetivo:	Cargar las instalaciones genericas "Con alimentacion" y 
//					"Sin alimentacion"en el root del arbol.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	---
//					 Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		18/02/1999		AFE	 		Creacion
//
//////////////////////////////////////////////////////////////

// Declaracion de Variables

Long 	ll_handle, ll_nro_inst, ll_nro_padre, &
		ll_kwh, ll_centro, ll_cmd, ll_mesa, ll_calle, ll_puerta, &
		ll_cant_cli, ll_fila
Integer li_tipo_inst, li_nivel, li_tension
String ls_dup, ls_nombre, ls_calle, ls_desc
TreeViewItem ltvi_nuevo


//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Decimal ll_pot_cont, ll_pot_inst
//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


///////////////////// INICIO DEL PROGRAMA ///////////////////////

SetPointer(HourGlass!)

// Resetamos el arbol
This.SetRedraw(False)
This.f_reset()

///// Inserto la instalacion generica "Con alimentacion"  ////

// Seteamos o TreeView Item
ltvi_nuevo.label = "CON ALIMENTACION"
ltvi_nuevo.Data = fgcdec_aviso_con_alimentacion
//ltvi_nuevo.pictureindex = ii_icono_con_alim gsh 02/08/00

ltvi_nuevo.selectedpictureindex = ltvi_nuevo.pictureindex

// Insertamos en el arbol
ll_handle = This.InsertItemLast( 0, ltvi_nuevo)

// Insertamos en la DW de datos
ll_fila = ids_datos.InsertRow(0)

ids_datos.SetItem(ll_fila, "cl_handle", ll_handle)
ids_datos.SetItem(ll_fila, "cl_nro", fgcdec_aviso_con_alimentacion)
ids_datos.SetItem(ll_fila, "cn_tipo", 0)
ids_datos.SetItem(ll_fila, "cl_padre", 0)
ids_datos.SetItem(ll_fila, "cs_nombre", "CON ALIMENTACION")
ids_datos.SetItem(ll_fila, "cn_nivel", 0)
ids_datos.SetItem(ll_fila, "cn_tension", 0)
ids_datos.SetItem(ll_fila, "cl_pot_instalada", 0)
ids_datos.SetItem(ll_fila, "cl_pot_contratada", 0)
ids_datos.SetItem(ll_fila, "cl_kwh", 0)
ids_datos.SetItem(ll_fila, "cl_centro", 0)
ids_datos.SetItem(ll_fila, "cl_mesa", 0)
ids_datos.SetItem(ll_fila, "cl_cmd", 0)
ids_datos.SetItem(ll_fila, "cl_calle", 0)
ids_datos.SetItem(ll_fila, "cl_puerta", 0)
ids_datos.SetItem(ll_fila, "cs_duplicador", " ")
ids_datos.SetItem(ll_fila, "cl_cant_cli", 0)
ids_datos.SetItem(ll_fila, "cs_descripcion", " ")
ids_datos.SetItem(ll_fila, "cs_direccion", " ")

////////// Inserto la instalacion generica "Sin Alimentacion"  ///////////

// Seteamos o TreeView Item
ltvi_nuevo.label = "SIN ALIMENTACION"
//ltvi_nuevo.pictureindex = ii_icono_sin_alim gsh 02/08/00


ltvi_nuevo.selectedpictureindex = ltvi_nuevo.pictureindex

// Insertamos en el arbol
ll_handle = This.InsertItemLast( 0, ltvi_nuevo)

// Insertamos en la DW de datos
ll_fila = ids_datos.InsertRow(0)

ids_datos.SetItem(ll_fila, "cl_handle", ll_handle)
ids_datos.SetItem(ll_fila, "cl_nro", fgcdec_aviso_sin_alimentacion)
ids_datos.SetItem(ll_fila, "cn_tipo", 0)
ids_datos.SetItem(ll_fila, "cl_padre", 0)
ids_datos.SetItem(ll_fila, "cs_nombre", "SIN ALIMENTACION")
ids_datos.SetItem(ll_fila, "cn_nivel", 0)
ids_datos.SetItem(ll_fila, "cn_tension", 0)
ids_datos.SetItem(ll_fila, "cl_pot_instalada", 0)
ids_datos.SetItem(ll_fila, "cl_pot_contratada", 0)
ids_datos.SetItem(ll_fila, "cl_kwh", 0)
ids_datos.SetItem(ll_fila, "cl_centro", 0)
ids_datos.SetItem(ll_fila, "cl_mesa", 0)
ids_datos.SetItem(ll_fila, "cl_cmd", 0)
ids_datos.SetItem(ll_fila, "cl_calle", 0)
ids_datos.SetItem(ll_fila, "cl_puerta", 0)
ids_datos.SetItem(ll_fila, "cs_duplicador", " ")
ids_datos.SetItem(ll_fila, "cl_cant_cli", 0)
ids_datos.SetItem(ll_fila, "cs_descripcion", " ")
ids_datos.SetItem(ll_fila, "cs_direccion", " ")

// Salimos
This.SetRedraw(True)


end subroutine

public subroutine f_cargar_hijos (long pl_handle, boolean pb_con_acom);
//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_cargar_hijos
//
//	Objetivo:	Carga los hijos de la instalacion en que se hizo
//					dobleclick en el arbol.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pl_handle - Handle de la instalacione cliqueada
//									en el arbol.
//					 Salida:	----
//
//	Devuelve: ----
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias		Creacion
//		08/02/2005	LFE				Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n suministro-CT
//////////////////////////////////////////////////////////////

// Declaracion de Variables

Long 	ll_click_inst, ll_nro, ll_kwh, &
		ll_centro, ll_mesa, ll_cmd, ll_calle, ll_puerta, ll_cant_cli, &
		ll_fila, ll_nueva_fila, ll_nuevo_handle, ll_inst_eliminadas,ll_inst_unificada,ll_encontrado = 0

Integer li_tipo, li_nivel, li_tension, li_subtipo_inst, li_estado_llave, li_tipo_inst

String ls_nombre, ls_dup, ls_desc, ls_calle
// LFE - Mejora Guatemala: alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
string ls_matricula
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

TreeViewItem ltvi_nuevo


//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Decimal ll_pot_inst, ll_pot_cont
String ls_select_inst, ls_from_inst, ls_where_inst
//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


// Declaracion de Cursores

ll_inst_eliminadas = fgcdec_instalacion_eliminadas
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	14/07/2001  DECLARE cHijos CURSOR FOR  
//**  OSGI 2001.1  	14/07/2001    SELECT "SGD_INSTALACION"."NRO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TIPO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NOM_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CO_NIVEL",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TENSION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_INSTALADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_CONTRATADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."KWH",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CENTRO",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_MESA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CMD",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."COD_CALLE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NUM_PUERTA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DUPLICADOR",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CANT_CLI",
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DESCRIPCION",
//**  OSGI 2001.1  	14/07/2001  			' '
//**  OSGI 2001.1  	14/07/2001      FROM "SGD_INSTALACION"
//**  OSGI 2001.1  	14/07/2001     WHERE ( "SGD_INSTALACION"."NRO_INST_PADRE" > :ll_inst_eliminadas OR
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_INST_PADRE" < :ll_inst_eliminadas ) AND 
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."BDI_JOB" = 0 AND
//**  OSGI 2001.1  	14/07/2001  			 "SGD_INSTALACION"."NRO_INST_PADRE" = :ll_click_inst AND 
//**  OSGI 2001.1  	14/07/2001  			 "SGD_INSTALACION"."TIPO_INSTALACION" < :fgci_tipo_acometida AND
//**  OSGI 2001.1  	14/07/2001  			 "SGD_INSTALACION"."ESTADO" = 0
//**  OSGI 2001.1  	14/07/2001  //Union
//**  OSGI 2001.1  	14/07/2001  ////SK 
//**  OSGI 2001.1  	14/07/2001  //SELECT "SGD_ACOMETIDA"."CODIGO",   
//**  OSGI 2001.1  	14/07/2001  //     	   Decode(SGD_ACOMETIDA.TIP_TENSION,1,:fgci_tipo_aco_at,2,:fgci_tipo_aco_mt,3,:fgci_tipo_aco_bt) tipo_instalacion,   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."DESCRIPCION",   
//**  OSGI 2001.1  	14/07/2001  //	   Decode(SGD_ACOMETIDA.TIP_TENSION,1,:fgci_tipo_aco_at,2,:fgci_tipo_aco_mt,3,:fgci_tipo_aco_bt) co_nivel,   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."TIP_TENSION",   
//**  OSGI 2001.1  	14/07/2001  //	   "SGD_ACOMETIDA"."POT_CONTRATADA",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."POT_CONTRATADA",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."KWH",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."NRO_CENTRO",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."NRO_MESA",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."NRO_CMD",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."COD_CALLE",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."NUM_PUERTA",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."DUPLICADOR",   
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."CANT_CLI",
//**  OSGI 2001.1  	14/07/2001  //         "SGD_ACOMETIDA"."DESCRIPCION",
//**  OSGI 2001.1  	14/07/2001  //			' '
//**  OSGI 2001.1  	14/07/2001  //    FROM "SGD_ACOMETIDA"
//**  OSGI 2001.1  	14/07/2001  //   WHERE ( "SGD_ACOMETIDA"."INSTALACION_ORIGEN" > :ll_inst_eliminadas OR
//**  OSGI 2001.1  	14/07/2001  //			"SGD_ACOMETIDA"."INSTALACION_ORIGEN" < :ll_inst_eliminadas ) AND 
//**  OSGI 2001.1  	14/07/2001  //			 "SGD_ACOMETIDA"."INSTALACION_ORIGEN" = :ll_click_inst ;
//**  OSGI 2001.1  	14/07/2001  
//**  OSGI 2001.1  	14/07/2001  ;
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


/////////////////////// INICIO DEL PROGRAMA ////////////////////
DECLARE lc_acometidas CURSOR FOR
SELECT "SGD_ACOMETIDA"."CODIGO",   
     	   :fgci_tipo_acometida tipo_instalacion,   
         "SGD_ACOMETIDA"."DESCRIPCION",   
	      :fgci_tipo_acometida co_nivel,   
         :fgci_baja_tension tip_tension,   
	      "SGD_ACOMETIDA"."POT_CONTRATADA",   
         "SGD_ACOMETIDA"."POT_CONTRATADA",   
         "SGD_ACOMETIDA"."KWH",   
         "SGD_ACOMETIDA"."NRO_CENTRO",   
         "SGD_ACOMETIDA"."NRO_MESA",   
         "SGD_ACOMETIDA"."NRO_CMD",   
         "SGD_ACOMETIDA"."COD_CALLE",   
         "SGD_ACOMETIDA"."NUM_PUERTA",   
         "SGD_ACOMETIDA"."DUPLICADOR",   
         "SGD_ACOMETIDA"."CANT_CLI",
          "SGD_ACOMETIDA"."DESCRIPCION",
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT 
			' ',
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
			' '
    FROM "SGD_ACOMETIDA"
   WHERE ( "SGD_ACOMETIDA"."INSTALACION_ORIGEN" > :ll_inst_eliminadas OR
			"SGD_ACOMETIDA"."INSTALACION_ORIGEN" < :ll_inst_eliminadas ) AND 
			"SGD_ACOMETIDA"."INSTALACION_ORIGEN" = :ll_click_inst AND
			"SGD_ACOMETIDA"."BDI_JOB" = 0;


SetPointer(HourGlass!)

// Buscamos la instalacion en la DW

ll_fila = ids_datos.Find("cl_handle = " + String(pl_handle), 1, ids_datos.RowCount() )

ll_click_inst = ids_datos.GetItemNumber(ll_fila, "cl_nro")

li_tipo_inst = ids_datos.GetItemNumber(ll_fila, "cn_tipo")

//If li_tipo = fgci_tipo_fase Then
//	// Si la instalacion selecionada es una fase, ella no tiene
//	// hijos. Entonces salimos sin abrir el cursor para no
//	// prejudicar la performance.
//	Return
//End If
	
// Abrimos el cursor de hijos
IF li_tipo_inst = fgci_tipo_salida_de_baja AND pb_con_acom THEN
	Open lc_acometidas;
	
	Fetch lc_acometidas Into :ll_nro, :li_tipo, :ls_nombre, :li_nivel, :li_tension,
						:ll_pot_inst, :ll_pot_cont, :ll_kwh, :ll_centro, 
						:ll_mesa, :ll_cmd, :ll_calle, :ll_puerta, :ls_dup, 
						:ll_cant_cli, :ls_desc, :ls_calle
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
						,:ls_matricula
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
						;


ELSE
	//***************************************
	//**  OSGI 2001.1  	14/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	ls_select_inst = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
							" SGD_INSTALACION.TIPO_INSTALACION, " + &
							" SGD_INSTALACION.NOM_INSTALACION, " + &
							" SGD_INSTALACION.CO_NIVEL, " + &
							" SGD_INSTALACION.TENSION, " + &
							" SGD_INSTALACION.POT_INSTALADA, " + &
							" SGD_INSTALACION.POT_CONTRATADA, " + &
							" SGD_INSTALACION.KWH, " + &
							" SGD_INSTALACION.NRO_CENTRO, " + &
							" SGD_INSTALACION.NRO_MESA, " + &
							" SGD_INSTALACION.NRO_CMD, " + &
							" SGD_INSTALACION.COD_CALLE, " + &
							" SGD_INSTALACION.NUM_PUERTA, " + &
							" SGD_INSTALACION.DUPLICADOR, " + &
							" SGD_INSTALACION.CANT_CLI, " + &
							" SGD_INSTALACION.DESCRIPCION, " + &
							" NVL(SGD_INSTALACION.NRO_INST_UNIFICADA,0), " + &
							" SGD_INSTALACION.MATRICULA, " /* LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT */ +& 
							" ' ' "

	ls_from_inst = " FROM SGD_INSTALACION "

	ls_where_inst = " WHERE ( SGD_INSTALACION.NRO_INST_PADRE > " + String(ll_inst_eliminadas) + " OR " + &
							" SGD_INSTALACION.NRO_INST_PADRE < " + String(ll_inst_eliminadas) + " ) AND " + &
							" SGD_INSTALACION.BDI_JOB = 0 AND " + &
							" SGD_INSTALACION.NRO_INST_PADRE = " + String(ll_click_inst) + " AND " + &
							" SGD_INSTALACION.ESTADO = 0 "

//							" SGD_INSTALACION.TIPO_INSTALACION < " + String(fgci_tipo_acometida) + " AND " + &

	If ib_usa_trafo Then
		ls_select_inst =	fg_cursor_sql(1, ls_select_inst, ls_from_inst, ls_where_inst, " ")
	Else
		ls_select_inst = ls_select_inst + ls_from_inst + ls_where_inst
	End If

	DECLARE cHijos DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_select_inst ;
	OPEN DYNAMIC cHijos ;

	//**  OSGI 2001.1  	14/07/2001  	Open cHijos;
	//***************************************
	//**  OSGI 2001.1  	14/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

	Fetch cHijos Into :ll_nro, :li_tipo, :ls_nombre, :li_nivel, :li_tension,
							:ll_pot_inst, :ll_pot_cont, :ll_kwh, :ll_centro, 
							:ll_mesa, :ll_cmd, :ll_calle, :ll_puerta, :ls_dup, 
							:ll_cant_cli, :ls_desc,:ll_inst_unificada, 
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
							:ls_matricula,
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT							
							:ls_calle;

END IF
// Verificamos se esta todo OK

If SQLCA.SqlCode = -1 Then
	// No fue posible acceder a la base de datos de instalaciones.
	gnv_msg.f_mensaje("EI01", "", "", OK!)
	IF li_tipo_inst = fgci_tipo_salida_de_baja AND pb_con_acom THEN
		Close lc_acometidas;
	ELSE
		Close cHijos;
	END IF
	Return
ElseIf SQLCA.SqlCode = 100 Then
	// No se han encontrado hijos
	IF li_tipo_inst = fgci_tipo_salida_de_baja AND pb_con_acom THEN
		Close lc_acometidas;
	ELSE
		Close cHijos;
	END IF
	Return
End If

// Recoremos el cursor de hijos, los insertando en el arbol

This.SetRedraw(False)

Do While SQLCA.SqlCode = 0
	
	ll_encontrado = ids_datos.find("cl_nro = " + string(ll_nro),1,ids_datos.rowcount())
	
	IF ll_inst_unificada > 0 and li_tipo <> fgci_tipo_salida_de_baja  and li_tipo <> fgci_tipo_salida_mt and gi_pais = 8 then // Comprueba inst fict en mold. La instalacion es ficticia.
		
		ll_encontrado = ids_datos.find("cl_nro = " + string(ll_inst_unificada),1,ids_datos.rowcount())
	
		IF ll_encontrado = 0 then // SI NO ENCUENTRA METEMOS EL ORIGINAL
			
				SELECT SGD_INSTALACION.NRO_INSTALACION,
				 SGD_INSTALACION.TIPO_INSTALACION,
				 SGD_INSTALACION.NOM_INSTALACION,
				 SGD_INSTALACION.CO_NIVEL,
				 SGD_INSTALACION.TENSION,
				 SGD_INSTALACION.POT_INSTALADA,
				 SGD_INSTALACION.POT_CONTRATADA,
				 SGD_INSTALACION.KWH,
				 SGD_INSTALACION.NRO_CENTRO,
				 SGD_INSTALACION.NRO_MESA,
				 SGD_INSTALACION.NRO_CMD,
				 SGD_INSTALACION.COD_CALLE, 
				 SGD_INSTALACION.NUM_PUERTA,
				 SGD_INSTALACION.DUPLICADOR, 
				 SGD_INSTALACION.CANT_CLI,
				 SGD_INSTALACION.DESCRIPCION, 
				 SGD_INSTALACION.MATRICULA,  // LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
				 ' '
			    Into :ll_nro, :li_tipo, :ls_nombre, :li_nivel, :li_tension,
							:ll_pot_inst, :ll_pot_cont, :ll_kwh, :ll_centro, 
							:ll_mesa, :ll_cmd, :ll_calle, :ll_puerta, :ls_dup, 
							:ll_cant_cli, :ls_desc, 
							:ls_matricula, // LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
							:ls_calle 
	 			FROM SGD_INSTALACION 
				WHERE ( SGD_INSTALACION.NRO_INSTALACION = :ll_inst_unificada AND
							 SGD_INSTALACION.ESTADO = 0) ;		
							 
				IF SQLCA.SQLCODE <> 0 THEN
					Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "No se encuentra la instalaci$$HEX1$$f300$$ENDHEX$$n unificada.")
					ll_encontrado = 1
				END IF
		END IF
	
	END IF
	
	
	IF ll_encontrado = 0 then
		// Seteamos o TreeViewItem
		ltvi_nuevo.label = ls_nombre
		ltvi_nuevo.Data = ll_nro
		
		ltvi_nuevo.pictureindex = This.f_icono_arbol(li_tipo)
		ltvi_nuevo.selectedpictureindex = ltvi_nuevo.pictureindex
		
		// Insertamos en el arbol
		ll_nuevo_handle = This.InsertItemSort(pl_handle, ltvi_nuevo)	
		
		// Insertamos en la DW de datos
		ll_nueva_fila = ids_datos.InsertRow(0)
		
		ids_datos.SetItem(ll_nueva_fila, "cl_handle", ll_nuevo_handle)
		ids_datos.SetItem(ll_nueva_fila, "cl_nro", ll_nro)
		ids_datos.SetItem(ll_nueva_fila, "cn_tipo", li_tipo)
		ids_datos.SetItem(ll_nueva_fila, "cl_padre", ll_click_inst)
		ids_datos.SetItem(ll_nueva_fila, "cs_nombre", ls_nombre)
		ids_datos.SetItem(ll_nueva_fila, "cn_nivel", li_nivel)
		ids_datos.SetItem(ll_nueva_fila, "cn_tension", li_tension)
		ids_datos.SetItem(ll_nueva_fila, "cl_pot_instalada", ll_pot_inst)
		ids_datos.SetItem(ll_nueva_fila, "cl_pot_contratada", ll_pot_cont)
		ids_datos.SetItem(ll_nueva_fila, "cl_kwh", ll_kwh)
		ids_datos.SetItem(ll_nueva_fila, "cl_centro", ll_centro)
		ids_datos.SetItem(ll_nueva_fila, "cl_mesa", ll_mesa)
		ids_datos.SetItem(ll_nueva_fila, "cl_cmd", ll_cmd)
		ids_datos.SetItem(ll_nueva_fila, "cl_calle", ll_calle)
		ids_datos.SetItem(ll_nueva_fila, "cl_puerta", ll_puerta)
		ids_datos.SetItem(ll_nueva_fila, "cs_duplicador", ls_dup)
		ids_datos.SetItem(ll_nueva_fila, "cl_cant_cli", ll_cant_cli)
		ids_datos.SetItem(ll_nueva_fila, "cs_descripcion", ls_desc)
		ids_datos.SetItem(ll_nueva_fila, "cs_direccion", ls_calle)
		// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
		ids_datos.SetItem(ll_nueva_fila, "cs_matricula", ls_matricula)
		// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
		
	END IF
	
	// Leemos lo proximo hijo
	IF li_tipo_inst = fgci_tipo_salida_de_baja AND pb_con_acom THEN
		Fetch lc_acometidas Into :ll_nro, :li_tipo, :ls_nombre, :li_nivel, :li_tension,
							:ll_pot_inst, :ll_pot_cont, :ll_kwh, :ll_centro, 
							:ll_mesa, :ll_cmd, :ll_calle, :ll_puerta, :ls_dup, 
							:ll_cant_cli, :ls_desc, :ls_calle
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
							,:ls_matricula
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT							
							;
	ELSE
	
		Fetch cHijos Into :ll_nro, :li_tipo, :ls_nombre, :li_nivel, :li_tension,
							:ll_pot_inst, :ll_pot_cont, :ll_kwh, :ll_centro, 
							:ll_mesa, :ll_cmd, :ll_calle, :ll_puerta, :ls_dup, 
							:ll_cant_cli, :ls_desc,:ll_inst_unificada, 
							:ls_matricula, // LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
							:ls_calle;
	END IF
	
Loop

// Cerramos lo cursor de hijos e salimos

This.SetRedraw(True)

IF li_tipo_inst = fgci_tipo_salida_de_baja AND pb_con_acom THEN
	Close lc_acometidas;
ELSE
	Close cHijos;
END IF

Return

end subroutine

public function integer f_cargar_estructura (ref u_generico_comunicaciones ps_datos, ref datawindow pdw_fases);//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n: 	f_cargar_estructura
//
//	Objetivo: 	Cargar los datos da instalacion actualmente seleccionada
//					en la estructura de comunicaciones passada como parametro.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	ps_datos - estructura del tipo u_generico_comunicaciones
//									passada por referencia, donde seran cargados
//									los datos de la instalacion.
//					Salida:	---
//
//	Devuelve: 	0 	: Structura cargada OK.
//				 	-1 : Erro al cargar estructura.
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		04/02/99		Marco Dias		Creacion
//		08/02/2005	LFE				Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n suministro-CT
//////////////////////////////////////////////////////////////

// Declaracion de Variaveis
Long ll_handle, ll_fila, ll_calle

// Descubrimos el item actual e buscamos en la DataStore
ll_handle = This.FindItem(CurrentTreeItem!, 0)

If ll_handle < 1 Then
	// Debe seleccionar una instalaci$$HEX1$$f300$$ENDHEX$$n
	gnv_msg.f_mensaje("AM04", "", "", OK!)
	Return -1
End If

ll_fila = ids_datos.Find("cl_handle = " + String(ll_handle), 0, ids_datos.RowCount() )

If ll_fila < 1 Then
	// Problema na DataStore
	// No se encontraron datos para esa instalaci$$HEX1$$f300$$ENDHEX$$n.
	gnv_msg.f_mensaje("AM63", "", "", OK!)
	Return -1
End If

// Cargamos la estructura
ps_datos.is_comunic.intval1 = ids_datos.GetItemNumber(ll_fila, "cl_centro")
ps_datos.is_comunic.intval2 = ids_datos.GetItemNumber(ll_fila, "cl_cmd")
ps_datos.is_comunic.intval3 = ids_datos.GetItemNumber(ll_fila, "cl_mesa")
ps_datos.is_comunic.intval4 = ids_datos.GetItemNumber(ll_fila, "cn_tipo")
ps_datos.is_comunic.intval5 = ids_datos.GetItemNumber(ll_fila, "cn_nivel")
ps_datos.is_comunic.intval6 = ids_datos.GetItemNumber(ll_fila, "cn_tension")

ps_datos.is_comunic.decval1 = ids_datos.GetItemNumber(ll_fila, "cl_nro")
ps_datos.is_comunic.decval2 = ids_datos.GetItemNumber(ll_fila, "cl_padre")

ps_datos.is_comunic.longval1 = ids_datos.GetItemNumber(ll_fila, "cl_pot_instalada")
ps_datos.is_comunic.longval2 = ids_datos.GetItemNumber(ll_fila, "cl_pot_contratada")
ps_datos.is_comunic.longval3 = ids_datos.GetItemNumber(ll_fila, "cl_cant_cli")
ps_datos.is_comunic.longval4 = 0 // Acometida
ps_datos.is_comunic.longval5 = ids_datos.GetItemNumber(ll_fila, "cl_kwh")

// Direccion = Nome Calle + Nro Puerta + Duplicador
ll_calle = ids_datos.GetItemNumber(ll_fila, "cl_calle")
Select NOM_CALLE into :ps_datos.is_comunic.strval1 FROM CALLEJERO WHERE COD_CALLE=:ll_calle; 
IF SQLCA.SQLCode <> 0 THEN ps_datos.is_comunic.strval1 = ''

//ps_datos.is_comunic.strval1 = ids_datos.GetItemString(ll_fila, "cs_direccion") + " " +&
//										String(ids_datos.GetItemNumber(ll_fila, "cl_puerta")) + " " +&
//										ids_datos.GetItemString(ll_fila, "cs_duplicador")
//
ps_datos.is_comunic.strval1 += " " + String(ids_datos.GetItemNumber(ll_fila, "cl_puerta")) + " " +&
										ids_datos.GetItemString(ll_fila, "cs_duplicador")

ps_datos.is_comunic.strval2 = ids_datos.GetItemString(ll_fila, "cs_nombre")

IF gb_red_trifasica = false AND gu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta'then
	ps_datos.is_comunic.strval4 = pdw_fases.GetItemString(1, "fase_A") + &
											pdw_fases.GetItemString(1, "fase_B") +  &
											pdw_fases.GetItemString(1, "fase_C")
END IF

ps_datos.is_comunic.strval10 = ids_datos.GetItemString(ll_fila, "cs_descripcion")
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
ps_datos.is_comunic.strval9 = ids_datos.GetItemString(ll_fila, "cs_matricula")
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

Return 0
end function

public subroutine f_cargar_root_descargos ();//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:	f_cargar_root_descargos
//
//	Objetivo:	Cargar las subestaciones en el root del arbol, pero no los grupos moviles.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	---
//					 Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias	 	Creacion
//
//////////////////////////////////////////////////////////////

// Declaracion de Variables
integer li_alta_tension
Long 	ll_handle, ll_nro_inst, ll_nro_padre, &
		ll_kwh, ll_centro, ll_cmd, ll_mesa, ll_calle, ll_puerta, &
		ll_cant_cli, ll_fila, ll_con_alim, ll_inst_eliminadas
Integer li_tipo_inst, li_nivel, li_tension
String ls_dup, ls_nombre, ls_calle, ls_desc

//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Decimal ll_pot_cont, ll_pot_inst
String ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst
//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

TreeViewItem ltvi_nuevo

//if gb_operaciones = TRUE THEN
//	CHOOSE CASE gi_tension_nivel_min
//			
//		CASE 1 // ALTA Tensi$$HEX1$$f300$$ENDHEX$$n. Hay que mostrar las subestaciones
//			li_tipo_instalacion = 1
//			ll_con_alim = fgcdec_aviso_con_alimentacion
//		CASE 2 // MEDIA TENSION. Hay que mostrar las salidas de baja
//			li_tipo_instalacion = 5
//			ll_con_alim = 0
//		CASE 3 // la ventana no debe abrirse con representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica en
//				// alta, media y baja tensi$$HEX1$$f300$$ENDHEX$$n
//			li_tipo_instalacion = 0
//			ll_con_alim = 0
//	END CHOOSE
//ELSE
//	li_tipo_instalacion = 1
	ll_con_alim = fgcdec_aviso_con_alimentacion
	li_alta_tension = 1  // TENSION DE LAS SUBESTACION DE MEDIA
//END IF
// Declaracion de Cursores


ll_inst_eliminadas = fgcdec_instalacion_eliminadas


//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	14/07/2001  DECLARE cSubs CURSOR FOR  
//**  OSGI 2001.1  	14/07/2001    SELECT "SGD_INSTALACION"."NRO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TIPO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NOM_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CO_NIVEL",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TENSION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_INSTALADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_CONTRATADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."KWH",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_INST_PADRE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CENTRO",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_MESA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CMD",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."COD_CALLE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NUM_PUERTA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DUPLICADOR",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CANT_CLI",
//**  OSGI 2001.1  	14/07/2001  			' ',
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DESCRIPCION"
//**  OSGI 2001.1  	14/07/2001      FROM "SGD_INSTALACION"
//**  OSGI 2001.1  	14/07/2001     WHERE "SGD_INSTALACION"."NRO_INST_PADRE" = :ll_con_alim AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."BDI_JOB" = 0	AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."ESTADO" = 0
//**  OSGI 2001.1  	14/07/2001  ORDER BY "SGD_INSTALACION"."NOM_INSTALACION" ;

ls_select_inst = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
						" SGD_INSTALACION.TIPO_INSTALACION, " + &
						" SGD_INSTALACION.NOM_INSTALACION, " + &
						" SGD_INSTALACION.CO_NIVEL, " + &
						" SGD_INSTALACION.TENSION, " + &
						" SGD_INSTALACION.POT_INSTALADA, " + &
						" SGD_INSTALACION.POT_CONTRATADA, " + &
						" SGD_INSTALACION.KWH, " + &
						" SGD_INSTALACION.NRO_INST_PADRE, " + &
						" SGD_INSTALACION.NRO_CENTRO, " + &
						" SGD_INSTALACION.NRO_MESA, " + &
						" SGD_INSTALACION.NRO_CMD, " + &
						" SGD_INSTALACION.COD_CALLE, " + &
						" SGD_INSTALACION.NUM_PUERTA, " + &
						" SGD_INSTALACION.DUPLICADOR, " + &
						" SGD_INSTALACION.CANT_CLI, " + &
						" ' ', " + &
						" SGD_INSTALACION.DESCRIPCION "

ls_from_inst = " FROM SGD_INSTALACION "

ls_where_inst = " WHERE SGD_INSTALACION.NRO_INST_PADRE = " + String(ll_con_alim) + " AND " + &
						" SGD_INSTALACION.BDI_JOB = 0	AND " + &
						" SGD_INSTALACION.ESTADO = 0  "

ls_orden_inst = " ORDER BY SGD_INSTALACION.NOM_INSTALACION "


If ib_usa_trafo Then
	ls_select_inst =	fg_cursor_sql(1, ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst)
Else
	ls_select_inst = ls_select_inst + ls_from_inst + ls_where_inst + ls_orden_inst
End If

DECLARE cSubs DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_select_inst ;
OPEN DYNAMIC cSubs ;

//**  OSGI 2001.1  	14/07/2001  	Open cSubs;
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



///////////////////// INICIO DEL PROGRAMA ///////////////////////

SetPointer(HourGlass!)

// Abrimos el cursor de subestaciones


Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
						:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
						:ll_nro_padre, :ll_centro, :ll_mesa, :ll_cmd, 
						:ll_calle, :ll_puerta, :ls_dup, :ll_cant_cli, 
						:ls_calle, :ls_desc;
						
// Verificamos se esta tudo OK
If SQLCA.SqlCode = -1 Then
	//No fue posible acceder a la base de datos de instalaciones.
	gnv_msg.f_mensaje("EI01", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
ElseIf SQLCA.SqlCode = 100 Then
	gnv_msg.f_mensaje("AM62", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
End If

// Resetamos el arbol
This.SetRedraw(False)
This.f_reset()

// Recorremos el cursor insertando las instalaciones de primer nivel en el arbol
Do While SQLCA.SqlCode = 0 
	
	// Seteamos o TreeView Item
	ltvi_nuevo.label = ls_nombre
	ltvi_nuevo.Data = ll_nro_inst
	ltvi_nuevo.pictureindex = This.f_icono_arbol(li_tipo_inst)
	ltvi_nuevo.selectedpictureindex = ltvi_nuevo.pictureindex
	
	// Insertamos en el arbol
	ll_handle = This.InsertItemLast( 0, ltvi_nuevo)
	
	// Insertamos en la DW de datos
	ll_fila = ids_datos.InsertRow(0)
	
	ids_datos.SetItem(ll_fila, "cl_handle", ll_handle)
	ids_datos.SetItem(ll_fila, "cl_nro", ll_nro_inst)
	ids_datos.SetItem(ll_fila, "cn_tipo", li_tipo_inst)
	ids_datos.SetItem(ll_fila, "cl_padre", ll_nro_padre)
	ids_datos.SetItem(ll_fila, "cs_nombre", ls_nombre)
	ids_datos.SetItem(ll_fila, "cn_nivel", li_nivel)
	ids_datos.SetItem(ll_fila, "cn_tension", li_tension)
	ids_datos.SetItem(ll_fila, "cl_pot_instalada", ll_pot_inst)
	ids_datos.SetItem(ll_fila, "cl_pot_contratada", ll_pot_cont)
	ids_datos.SetItem(ll_fila, "cl_kwh", ll_kwh)
	ids_datos.SetItem(ll_fila, "cl_centro", ll_centro)
	ids_datos.SetItem(ll_fila, "cl_mesa", ll_mesa)
	ids_datos.SetItem(ll_fila, "cl_cmd", ll_cmd)
	ids_datos.SetItem(ll_fila, "cl_calle", ll_calle)
	ids_datos.SetItem(ll_fila, "cl_puerta", ll_puerta)
	ids_datos.SetItem(ll_fila, "cs_duplicador", ls_dup)
	ids_datos.SetItem(ll_fila, "cl_cant_cli", ll_cant_cli)
	ids_datos.SetItem(ll_fila, "cs_descripcion", ls_desc)
	ids_datos.SetItem(ll_fila, "cs_direccion", ls_calle)
	
	// Lemos el proximo registro
	
	Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
							:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
							:ll_nro_padre, :ll_centro, :ll_mesa, :ll_cmd, 
							:ll_calle, :ll_puerta, :ls_dup, :ll_cant_cli, 
							:ls_calle, :ls_desc;
	
Loop

// Cerramos el cursor e salimos

This.SetRedraw(True)

Close cSubs;

SetPointer(Arrow!)

Return
end subroutine

public subroutine f_cargar_root_por_cmd_descargos (integer pl_cmd);//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:	f_cargar_root_por_cmd_descargos
//
//	Objetivo:	Cargar las subestaciones (no grupo moviles) del CMD informador en 
//					el root del arbol.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pl_cmd - CMD a cual se va a cargar las subestaciones
//					 Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias	 	Creacion
//
//////////////////////////////////////////////////////////////

// Declaracion de Variables

Long 	ll_handle, ll_nro_inst, ll_nro_padre, &
		ll_kwh, ll_centro, ll_mesa, ll_calle, ll_puerta, ll_cant_cli, &
		ll_fila, ll_con_alim, ll_inst_eliminadas
Integer li_tipo_inst, li_nivel, li_tension
String ls_dup, ls_nombre, ls_calle, ls_desc
integer li_alta_tension

//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Decimal ll_pot_cont, ll_pot_inst
String ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst
//***************************************
//**  OSGI 2001.1  	06/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


TreeViewItem ltvi_nuevo

//if gb_operaciones = TRUE THEN
//	CHOOSE CASE gi_tension_nivel_min
//			
//		CASE 1 // ALTA Tensi$$HEX1$$f300$$ENDHEX$$n
//		CASE 2 
//			li_tipo_instalacion = 2
//		CASE 3
//			li_tipo_instalacion = 5
//	END CHOOSE
//ELSE
//	li_tipo_instalacion = 2
//END IF
// Declaracion de Cursores

ll_con_alim = fgcdec_aviso_con_alimentacion
ll_inst_eliminadas = fgcdec_instalacion_eliminadas

li_alta_tension = 1

//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	14/07/2001  DECLARE cSubs CURSOR FOR  
//**  OSGI 2001.1  	14/07/2001    SELECT "SGD_INSTALACION"."NRO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TIPO_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NOM_INSTALACION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CO_NIVEL",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."TENSION",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_INSTALADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."POT_CONTRATADA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."KWH",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_INST_PADRE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_CENTRO",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NRO_MESA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."COD_CALLE",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."NUM_PUERTA",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DUPLICADOR",   
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."CANT_CLI",  
//**  OSGI 2001.1  	14/07/2001           "SGD_INSTALACION"."DESCRIPCION",
//**  OSGI 2001.1  	14/07/2001  			' '
//**  OSGI 2001.1  	14/07/2001      FROM "SGD_INSTALACION"
//**  OSGI 2001.1  	14/07/2001     WHERE "SGD_INSTALACION"."NRO_INST_PADRE" = :ll_con_alim AND 
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_CMD" = :pl_cmd AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."BDI_JOB" = 0 AND
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."ESTADO" = 0
//**  OSGI 2001.1  	14/07/2001  	ORDER BY "SGD_INSTALACION"."NOM_INSTALACION" ;
//**  OSGI 2001.1  	14/07/2001  	
//**  OSGI 2001.1  	14/07/2001  /* WHERE "SGD_INSTALACION"."TIPO_INSTALACION" = 1 And
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_CMD" = :pl_cmd AND (
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_INST_PADRE" > 99999997 OR
//**  OSGI 2001.1  	14/07/2001  			"SGD_INSTALACION"."NRO_INST_PADRE" < 99999997 ) 
//**  OSGI 2001.1  	14/07/2001  ORDER BY "SGD_INSTALACION"."NOM_INSTALACION" ; */

ls_select_inst = " SELECT SGD_INSTALACION.NRO_INSTALACION, " + &
						" SGD_INSTALACION.TIPO_INSTALACION, " + &
						" SGD_INSTALACION.NOM_INSTALACION, " + &
						" SGD_INSTALACION.CO_NIVEL, " + &
						" SGD_INSTALACION.TENSION, " + &
						" SGD_INSTALACION.POT_INSTALADA, " + &   
						" SGD_INSTALACION.POT_CONTRATADA, " + &
						" SGD_INSTALACION.KWH, " + &
						" SGD_INSTALACION.NRO_INST_PADRE, " + &
						" SGD_INSTALACION.NRO_CENTRO, " + &
						" SGD_INSTALACION.NRO_MESA, " + &
						" SGD_INSTALACION.COD_CALLE, " + &
						" SGD_INSTALACION.NUM_PUERTA, " + &
						" SGD_INSTALACION.DUPLICADOR, " + &
						" SGD_INSTALACION.CANT_CLI, " + &
						" SGD_INSTALACION.DESCRIPCION, " + &
						" ' '"

ls_from_inst = " FROM SGD_INSTALACION "

if pl_cmd = 0 then 
ls_where_inst = " WHERE SGD_INSTALACION.NRO_INST_PADRE = " + String(ll_con_alim) + " AND " + &
						" SGD_INSTALACION.NRO_CMD > " + String(pl_cmd) + " AND " + &
						" SGD_INSTALACION.BDI_JOB = 0 AND " + &
						" SGD_INSTALACION.ESTADO = 0 AND SGD_INSTALACION.TENSION = "  + String(li_alta_tension) 
else

ls_where_inst = " WHERE SGD_INSTALACION.NRO_INST_PADRE = " + String(ll_con_alim) + " AND " + &
						" SGD_INSTALACION.NRO_CMD = " + String(pl_cmd) + " AND " + &
						" SGD_INSTALACION.BDI_JOB = 0 AND " + &
						" SGD_INSTALACION.ESTADO = 0 AND SGD_INSTALACION.TENSION = "  + String(li_alta_tension) 
						
end if						
						

ls_orden_inst = " ORDER BY SGD_INSTALACION.NOM_INSTALACION "

If ib_usa_trafo Then
	ls_select_inst =	fg_cursor_sql(1, ls_select_inst, ls_from_inst, ls_where_inst, ls_orden_inst)
Else
	ls_select_inst = ls_select_inst + ls_from_inst + ls_where_inst + ls_orden_inst
End If

DECLARE cSubs DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_select_inst ;
OPEN DYNAMIC cSubs ;

//**  OSGI 2001.1  	14/07/2001  	Open cSubs;
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
	
	
///////////////////// INICIO DEL PROGRAMA ///////////////////////

SetPointer(HourGlass!)

// Abrimos el cursor de subestaciones
Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
						:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
						:ll_nro_padre, :ll_centro, :ll_mesa, :ll_calle, 
						:ll_puerta, :ls_dup, :ll_cant_cli, :ls_desc, :ls_calle;


// Verificamos se esta tudo OK
If SQLCA.SqlCode = -1 Then
	//No fue posible acceder a la base de datos de instalaciones.
	gnv_msg.f_mensaje("EI01", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
ElseIf SQLCA.SqlCode = 100 Then
	gnv_msg.f_mensaje("AM62", "", "", OK!)
	Close cSubs;
	SetPointer(Arrow!)
	Return
End If

// Reseteamos el arbol y la DW
This.SetRedraw(False)
This.f_reset()

// Recorremos el cursor insertando las Subestaciones en el arbol
Do While SQLCA.SqlCode = 0 
	
	// Seteamos o TreeView Item
	ltvi_nuevo.label = ls_nombre
	ltvi_nuevo.Data = ll_nro_inst
	ltvi_nuevo.pictureindex = This.f_icono_arbol(li_tipo_inst)
	ltvi_nuevo.selectedpictureindex = ltvi_nuevo.pictureindex
	
	// Insertamos en el arbol
	ll_handle = This.InsertItemLast( 0, ltvi_nuevo)
	
	// Insertamos en la DW de datos
	ll_fila = ids_datos.InsertRow(0)
	
	ids_datos.SetItem(ll_fila, "cl_handle", ll_handle)
	ids_datos.SetItem(ll_fila, "cl_nro", ll_nro_inst)
	ids_datos.SetItem(ll_fila, "cn_tipo", li_tipo_inst)
	ids_datos.SetItem(ll_fila, "cl_padre", ll_nro_padre)
	ids_datos.SetItem(ll_fila, "cs_nombre", ls_nombre)
	ids_datos.SetItem(ll_fila, "cn_nivel", li_nivel)
	ids_datos.SetItem(ll_fila, "cn_tension", li_tension)
	ids_datos.SetItem(ll_fila, "cl_pot_instalada", ll_pot_inst)
	ids_datos.SetItem(ll_fila, "cl_pot_contratada", ll_pot_cont)
	ids_datos.SetItem(ll_fila, "cl_kwh", ll_kwh)
	ids_datos.SetItem(ll_fila, "cl_centro", ll_centro)
	ids_datos.SetItem(ll_fila, "cl_mesa", ll_mesa)
	ids_datos.SetItem(ll_fila, "cl_cmd", pl_cmd)
	ids_datos.SetItem(ll_fila, "cl_calle", ll_calle)
	ids_datos.SetItem(ll_fila, "cl_puerta", ll_puerta)
	ids_datos.SetItem(ll_fila, "cs_duplicador", ls_dup)
	ids_datos.SetItem(ll_fila, "cl_cant_cli", ll_cant_cli)
	ids_datos.SetItem(ll_fila, "cs_descripcion", ls_desc)
	ids_datos.SetItem(ll_fila, "cs_direccion", ls_calle)
	
	// Leemos el proximo registro
	
	Fetch cSubs Into 	:ll_nro_inst, :li_tipo_inst, :ls_nombre, :li_nivel, 
							:li_tension, :ll_pot_inst, :ll_pot_cont, :ll_kwh, 
							:ll_nro_padre, :ll_centro, :ll_mesa, :ll_calle, 
							:ll_puerta, :ls_dup, :ll_cant_cli, :ls_desc, :ls_calle;
	
Loop

// Cerramos el cursor e salimos
Close cSubs;

SetPointer(Arrow!)

This.SetRedraw(True)

Return
end subroutine

public function long f_buscar_instalacion (string ps_nombre, integer pi_tipo, integer pi_tipo_busqueda);//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n :	f_buscar_instalacion
//
//	Objetivo:	Buscar la instalacion informada en el arbol.
//					Si la instalacion no esta en el arbol, buscamos
//					em la base de datos e cargamos las instalaciones
//					anteriores.
//
//	Ambito:		Publico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	ps_nombre - Nombre de la instalacion a buscar.
//								pi_tipo	 - Tipo da instalacao
//					 Salida:	---
//
//	Devuelve: ---
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		04/02/99		Marco Dias		Creacion
//		06/03/99		eyogo				No hace la busqueda por parte do nombre.
//											Retorna el numero de la instalacion.
//		30/04/99		Marco Dias		Buscar por tipo de instalacao
//		08/02/2005	LFE				Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n suministro-CT													
//
//////////////////////////////////////////////////////////////

// Declaracion de Variables

Long 	ll_fila, ll_fila_2, ll_handle, ll_nro_inst, ll_inst_actual, &
		ll_padres[], ll_padre_inst_eliminada, li_tipo, ll_acometida
		
Integer li_ind, li_index

String ls_nombre, ls_nombre_ant, ls_nombre_aux
// LFE - Mejora Guatemala: alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
String ls_campo
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
		
// Declaracion de Cursores
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
String ls_select_padre, ls_from_padre, ls_where_padre, ls_where_padre_conn
String ls_select_inst, ls_from_inst, ls_where_inst

TreeViewItem ltvi_actual

//**  OSGI 2001.1  	14/07/2001  DECLARE cPadres CURSOR FOR  
//**  OSGI 2001.1  	14/07/2001  SELECT "SGD_INSTALACION"."NRO_INSTALACION"
//**  OSGI 2001.1  	14/07/2001  FROM "SGD_INSTALACION"  
//**  OSGI 2001.1  	14/07/2001  WHERE ( "SGD_INSTALACION"."NRO_INST_PADRE" < :ll_padre_inst_eliminada OR
//**  OSGI 2001.1  	14/07/2001          "SGD_INSTALACION"."NRO_INST_PADRE" > :ll_padre_inst_eliminada ) AND
//**  OSGI 2001.1  	14/07/2001  		  "SGD_INSTALACION"."BDI_JOB" = 0 AND 
//**  OSGI 2001.1  	14/07/2001  		  "SGD_INSTALACION"."ESTADO" = 0 
//**  OSGI 2001.1  	14/07/2001  CONNECT BY PRIOR "NRO_INST_PADRE" = "NRO_INSTALACION"
//**  OSGI 2001.1  	14/07/2001  START WITH "NRO_INSTALACION" = :ll_nro_inst;
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


////////////////////// INICIO DEL PROGRAMA /////////////////////

SetPointer(HourGlass!)

// LFE - Mejora Guatemala: alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
IF pi_tipo_busqueda = 1 THEN // B$$HEX1$$fa00$$ENDHEX$$squeda por nombre
	ls_campo = "cs_nombre"
ELSE // B$$HEX1$$fa00$$ENDHEX$$squeda por matr$$HEX1$$ed00$$ENDHEX$$cula
	ls_campo = "cs_matricula"
END IF
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
ll_padre_inst_eliminada = fgcdec_instalacion_eliminadas

// Seteamos el nombre para mayusculas
ps_nombre = Upper(ps_nombre)

// Buscamos el nombre en la DataStore
// No hace la busqueda por nombre parcial pues mismo si ingressar
// lo nombre completo de uma llave abierta puede haber dos filas en la datastore

// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
// Comento este FIND
//ll_fila = ids_datos.Find("Pos(cs_nombre, '" + ps_nombre + "' ) > 0 and cn_tipo = " + string(pi_tipo) , 1, ids_datos.RowCount())
// Y a$$HEX1$$f100$$ENDHEX$$ado este otro
ll_fila = ids_datos.Find("Pos(" + ls_campo + ", '" + ps_nombre + "' ) > 0 and cn_tipo = " + string(pi_tipo) , 1, ids_datos.RowCount())
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

//ll_fila = ids_datos.Find("cs_nombre = '" + ps_nombre + "'", 1, ids_datos.RowCount()) //Comentado FDO

//// GNU 16-5-2007. Mejora 1/502971
////If ll_fila > 0 Then 
//If ll_fila > 0 and pi_tipo_busqueda <> 1 Then
//// FIN GNU
//	li_tipo = ids_datos.GetItemNumber(ll_fila, "cn_tipo")
//	If li_tipo = pi_tipo Then
//	
//		// Encontrado una instalacion en la DataStore, 
//		// Seleccionamos ella en el arbol
//		ll_handle = ids_datos.GetItemNumber(ll_fila, "cl_handle")
//	
//		This.SelectItem(ll_handle)
//	
//		This.SetFocus()
//
//		Return ids_datos.GetItemNumber(ll_fila, "cl_nro")
//		
//	End If
//End If

//
ll_handle=This.FindItem(CurrentTreeItem!, 0)
This.GetItem(ll_handle,ltvi_actual)
ls_nombre_ant=ltvi_actual.label
if isnull(ls_nombre_ant) or ls_nombre_ant='' then
	ls_nombre_ant=' '
end if

// GNU
IF pi_tipo_busqueda = 1 THEN
	if mid(ps_nombre,len(ps_nombre))= '%' then
		ls_nombre_aux= left(ps_nombre,len(ps_nombre)-1)
	else 
		ls_nombre_aux=ps_nombre
	end if	
	
	if mid(ls_nombre_aux,1,1)='%' then
		ls_nombre_aux=right(ls_nombre_aux, len(ls_nombre_aux)-1)
		ls_nombre="'%" +ls_nombre_aux + "'"
		long ll_pos
		ll_pos=lastpos(ls_nombre_ant,ls_nombre_aux)
		ll_pos=(len(ls_nombre_ant)-len(ls_nombre_aux)+1)
		if lastpos(ls_nombre_ant,ls_nombre_aux) <> (len(ls_nombre_ant)-len(ls_nombre_aux)+1) then
			ls_nombre_ant=' '
		end if
	else
		ls_nombre_aux=ls_nombre_aux
		ls_nombre="'"+ls_nombre_aux+ "%'" 
		if pos(ls_nombre_ant,ls_nombre_aux) <> 1 then
			ls_nombre_ant=' '
		end if
	end if
ELSE
	ls_nombre_aux=ps_nombre
	ls_nombre="'"+ps_nombre + "'"
	if pos(ls_nombre_ant,ls_nombre_aux) <> 1 then
		ls_nombre_ant=' '
	end if
END IF

//if pos(ls_nombre_ant,ls_nombre_aux) <> 1 then
//	ls_nombre_ant=' '
//end if

// FIN GNU

IF pi_tipo <> fgci_tipo_acometida THEN

	// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
//	IF pi_tipo_busqueda = 1 THEN
//		ls_nombre="'"+ls_nombre_aux+ "%'"
//	ELSE
//		ls_nombre="'"+ps_nombre + "'"
//	END IF


	// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	
	// Cargo un cursor pues puede devolver mas de un registro ---> FDO
	//***************************************
	//**  OSGI 2001.1  	14/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	14/07/2001  	DECLARE LC_INST CURSOR FOR
	//**  OSGI 2001.1  	14/07/2001  		SELECT "SGD_INSTALACION"."NRO_INSTALACION"  
	//**  OSGI 2001.1  	14/07/2001  		FROM "SGD_INSTALACION"  
	//**  OSGI 2001.1  	14/07/2001  		WHERE ( "SGD_INSTALACION"."NRO_INST_PADRE" > :ll_padre_inst_eliminada OR
	//**  OSGI 2001.1  	14/07/2001  				"SGD_INSTALACION"."NRO_INST_PADRE" < :ll_padre_inst_eliminada ) AND 
	//**  OSGI 2001.1  	14/07/2001  				"SGD_INSTALACION"."NOM_INSTALACION" LIKE :ls_nombre AND
	//**  OSGI 2001.1  	14/07/2001  				"SGD_INSTALACION"."BDI_JOB" = 0 AND
	//**  OSGI 2001.1  	14/07/2001  		"SGD_INSTALACION"."TIPO_INSTALACION" = :pi_tipo;

	ls_select_inst = " SELECT SGD_INSTALACION.NRO_INSTALACION "
	ls_from_inst = " FROM SGD_INSTALACION "
	ls_where_inst = " WHERE ( SGD_INSTALACION.NRO_INST_PADRE > " + String(ll_padre_inst_eliminada) + " OR " + &
							" SGD_INSTALACION.NRO_INST_PADRE < " + String(ll_padre_inst_eliminada) + " ) AND " 
	// LFE Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT							
	// Comento estas l$$HEX1$$ed00$$ENDHEX$$neas
	//							" SGD_INSTALACION.NOM_INSTALACION LIKE " + ls_nombre + " AND " + &
	//							" SGD_INSTALACION.BDI_JOB = 0 AND " + &
	//							" SGD_INSTALACION.TIPO_INSTALACION = " + String(pi_tipo)
	// Que se sustituye por este IF
	IF pi_tipo_busqueda = 1 THEN // B$$HEX1$$fa00$$ENDHEX$$squeda por nombre
		ls_where_inst += " SGD_INSTALACION.NOM_INSTALACION LIKE " + ls_nombre + " AND "
	ELSE // B$$HEX1$$fa00$$ENDHEX$$squeda por Matr$$HEX1$$ed00$$ENDHEX$$cula
		ls_where_inst += " SGD_INSTALACION.MATRICULA = " + ls_nombre + " AND "
	END IF
	ls_where_inst +=	" SGD_INSTALACION.BDI_JOB = 0 AND " + &
							" SGD_INSTALACION.TIPO_INSTALACION = " + String(pi_tipo) + " AND " + &
							" SGD_INSTALACION.ESTADO = 0 " + &
							" AND SGD_INSTALACION.NOM_INSTALACION > '" +ls_nombre_ant + "' " 
	// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

	If ib_usa_trafo Then
		ls_select_inst =	fg_cursor_sql(1, ls_select_inst, ls_from_inst, ls_where_inst, " ")
	Else
		ls_select_inst = ls_select_inst + ls_from_inst + ls_where_inst
	End If

	ls_select_inst =  ls_select_inst + " ORDER BY SGD_INSTALACION.NOM_INSTALACION "

	DECLARE LC_INST DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_select_inst ;
	OPEN DYNAMIC LC_INST ;
	
	//**  OSGI 2001.1  	14/07/2001  	OPEN LC_INST;
	//***************************************
	//**  OSGI 2001.1  	14/07/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	
	FETCH LC_INST INTO :ll_nro_inst;
	
	// GNU 16-5-2007. Mejora 1/502971
	// Hago un bucle para buscar todas las instalaciones que 
//	ll_fila = ids_datos.Find("cl_nro= " + string (ll_nro_inst) , 1, ids_datos.RowCount())
//	Do While SQLCA.SqlCode = 0 and ll_fila <> 0
//		FETCH LC_INST INTO :ll_nro_inst;
//		ll_fila = ids_datos.Find("cl_nro= " + string (ll_nro_inst)  , 1, ids_datos.RowCount())
//	Loop
//	// FIN GNU
	
	CLOSE LC_INST;

ELSE  // SE TRATA DE UNA ACOMETIDA
	
	SELECT CODIGO, INSTALACION_ORIGEN
	INTO :ll_acometida, :ll_nro_inst
	FROM SGD_ACOMETIDA
	WHERE ( INSTALACION_ORIGEN > :ll_padre_inst_eliminada OR
			INSTALACION_ORIGEN < :ll_padre_inst_eliminada ) AND 
			(DESCRIPCION = :ps_nombre OR TO_CHAR(CODIGO) =:ps_nombre) AND
			BDI_JOB = 0;
			
END IF

If SQLCA.SqlCode = -1 Then
// No hace busca por partes del nombre
	// Problemas. Probablemente la select retorn$$HEX2$$f3002000$$ENDHEX$$mas de una fila.
	// No fue encontrada ninguna instalaci$$HEX1$$f300$$ENDHEX$$n.
	gnv_msg.f_mensaje("AM62", "", "", OK!)
	Return -1
ElseIf SQLCA.SqlCode = 100 Then
	// Ninguna instalacion encontrada...
	gnv_msg.f_mensaje("AM62", "", "", OK!)
	Return -1
End If

// Encontro la instalacion. //

// Buscamos sus padres 

ll_fila = 0
li_ind = 0

IF pi_tipo = fgci_tipo_acometida THEN
	li_ind = li_ind + 1
	ll_padres[li_ind] = ll_acometida

	// Buscamos en la DataStore
	ll_fila = ids_datos.Find("cl_nro = " + String(ll_acometida), 1, ids_datos.RowCount() )
END IF




//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ls_select_padre = " SELECT SGD_INSTALACION.NRO_INSTALACION "
ls_from_padre = " FROM SGD_INSTALACION "
ls_where_padre = " WHERE ( SGD_INSTALACION.NRO_INST_PADRE  < " + String(ll_padre_inst_eliminada) + " OR " + &
						" SGD_INSTALACION.NRO_INST_PADRE > " + String(ll_padre_inst_eliminada) + " ) AND " + &
						" SGD_INSTALACION.BDI_JOB = 0 AND " + &
						" SGD_INSTALACION.ESTADO = 0 "
//AHM (26/01/2010) Incidencia 0/100144931
ls_where_padre_conn = " CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION " + &
							 " AND BDI_JOB = 0 " + &
							 " START WITH NRO_INSTALACION = " + String(ll_nro_inst)

If ib_usa_trafo Then
	ls_select_padre =	fg_cursor_sql(1, ls_select_padre, ls_from_padre, ls_where_padre, " ")

	ls_select_padre += ls_where_padre_conn
Else
	ls_where_padre += ls_where_padre_conn

	ls_select_padre = ls_select_padre + ls_from_padre + ls_where_padre
End If

DECLARE cPadres DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_select_padre ;
OPEN DYNAMIC cPadres ;

//**  OSGI 2001.1  	14/07/2001  	Open cPadres;
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

Fetch cPadres Into :ll_inst_actual;

If SQLCA.Sqlcode = -1 Or SQLCA.SqlCode = 100 Then
	// No fue posible acceder a la base de datos.
	gnv_msg.f_mensaje("EI01", "", "", OK!)
	Close cPadres;
	Return -1
End If

// Recorremos lo cursor hasta encontrar una instalacion que
// este en el arbol. Vamos a llenar un array con los 
// numeros de instalacion de los padres hasta lo ultimo padre
// que esta en el arbol. Recorreremos esto array al reves 
// para que insertamos los padres, en orden, en la TV.


Do While SQLCA.SqlCode = 0 and ll_fila = 0

	// Ponemos la instalacion en el array
	li_ind = li_ind + 1
	ll_padres[li_ind] = ll_inst_actual
	// Buscamos en la DataStore
	ll_fila = ids_datos.Find("cl_nro = " + String(ll_inst_actual), 1, ids_datos.RowCount() )

	Fetch cPadres Into :ll_inst_actual;
Loop

// Cerramos el cursor
Close cPadres;

If ll_fila = 0 Then
	// No encontramos ninguna instalacion que estaba en el arbol
	gnv_msg.f_mensaje("EI01", "", "", OK!)
	Return -1
End If

This.SetRedraw(False)

// Recorremos el array insertando las instalaciones en el arbol
// Lo hacemos al reves para seguier la orden
For li_index = li_ind To 2 Step -1
	
	// Buscamos la instalacion en la DataStore
	ll_fila = ids_datos.Find("cl_nro = " + String(ll_padres[li_index]), 1, ids_datos.RowCount() )

	// Insertamos el item en el arbol y en la Data Store
	// con la ayuda de la funcion f_cargar_hijos
	This.f_cargar_hijos( ids_datos.GetItemNumber(ll_fila, "cl_handle"), TRUE )
Next

This.SetRedraw(True)

// Seleccionamos la instalacion buscada
IF pi_tipo = fgci_tipo_acometida THEN
	ll_nro_inst = ll_acometida
END IF

ll_fila = ids_datos.Find("cl_nro = " +  String(ll_nro_inst), 1, ids_datos.RowCount() )

If ll_fila <> 0 Then
	This.SelectItem(ids_datos.GetItemNumber(ll_fila, "cl_handle") )
else
	// No fue encontrada ninguna instalaci$$HEX1$$f300$$ENDHEX$$n.
	gnv_msg.f_mensaje("AM62", "", "", OK!)
end if

This.SetFocus()

Return ll_nro_inst

end function

event constructor;call super::constructor;//////////////////////////////////////////////////////////////
//
//	Evento : 	Constructor
//
//	Objetivo: 	Hacer las declaraciones e iniciaciones necesarias
//					en el arbol.
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias		Creacion
//
//////////////////////////////////////////////////////////////

// Creamos la DataStore com los datos de instalacion
ids_datos = Create DataStore
ids_datos.DataObject = "d_2120_datos_arbol"
ids_datos.SetTransObject(SQLCA)


//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_usa_trafo = fg_verifica_parametro("usa_trafo")
//***************************************
//**  OSGI 2001.1  	14/07/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event destructor;//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n/Objeto: desctructor
//
//	Objetivo: Eliminar e destroyer elementos del arbol e datastore
//
//	Ambito:	Publico
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		04/02/99		Marco Dias		Creacion

//
//////////////////////////////////////////////////////////////

// Destroyemos la DataStore
Destroy ids_datos
end event

on u_2120_arbol_seleccion_instalacion.create
call super::create
end on

on u_2120_arbol_seleccion_instalacion.destroy
call super::destroy
end on


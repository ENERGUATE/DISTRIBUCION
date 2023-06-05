HA$PBExportHeader$u_gen_2002_nu_identificacion_instalacion.sru
forward
global type u_gen_2002_nu_identificacion_instalacion from nonvisualobject
end type
end forward

global type u_gen_2002_nu_identificacion_instalacion from nonvisualobject
end type
global u_gen_2002_nu_identificacion_instalacion u_gen_2002_nu_identificacion_instalacion

type variables
string select_original // Sentencia select de la datawindow
string Where_modificado // filtro a aplicar si corresponde
string select_nuevo // Nueva Sentencia
string rc
int  ii_fila
datawindowchild idwc_tipo_instalacion

// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
end variables

forward prototypes
public function integer fnu_conectar_bd (ref datawindow dw)
public function integer fnu_leer_bd_instalaciones2 (ref datawindow pd_dw, integer tipo, string nombre)
public function integer fnu_leer_bd_instalaciones (ref datawindow pdw_inst, ref integer pi_tipo, ref string ps_nombre, integer pi_centro, integer pi_cmd, integer pi_puesto)
end prototypes

public function integer fnu_conectar_bd (ref datawindow dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_conectar_bd
// 
// Objetivo: Realiza la conecci$$HEX1$$f300$$ENDHEX$$n con la base de datos.
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: dw
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/1/96		AQ			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

dw.SetTransObject(sqlca)
return 1
end function

public function integer fnu_leer_bd_instalaciones2 (ref datawindow pd_dw, integer tipo, string nombre);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_leer_bd_instalaciones2
// 
// Objetivo: Realiza el retrieve de la data window, 
//				seleccionandola previamente dependiendo del tipo de usuario  
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/07/96		HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

//string ls_nombre

IF IsNull(nombre) OR Len(LeftTrim(RightTrim(nombre))) = 1 THEN
	nombre = " " + "%"
END IF

pd_dw.Retrieve(tipo,nombre)

IF pd_dw.RowCount() = 0 THEN

	IF nombre = " " THEN
		gnv_msg.f_mensaje("EM24","","",OK!)
	ELSE
		gnv_msg.f_mensaje("EM10",nombre,"",OK!)
	END IF

	RETURN -1
END IF


RETURN 1
 

end function

public function integer fnu_leer_bd_instalaciones (ref datawindow pdw_inst, ref integer pi_tipo, ref string ps_nombre, integer pi_centro, integer pi_cmd, integer pi_puesto);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_leer_bd_instalaciones
// 
// Objetivo: Realiza el retrieve de la data window, 
//				seleccionandola previamente dependiendo del tipo de usuario  
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/07/96		HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_nombre, ls_select_original, ls_clausula_where, ls_mod_string, ls_modify

pdw_inst.SetTransObject(SQLCA)

ls_nombre = ps_nombre 

ls_select_original = pdw_inst.Describe("DataWindow.Table.Select")

ls_clausula_where  = " "

//IF pi_tipo = 1 THEN
//	pi_puesto = 0
//END IF

//IF pi_tipo > 0 THEN
//	ls_clausula_where = ls_clausula_where + " AND (TIPO_INSTALACION = " + String(pi_tipo) + ") " 		
//END IF
//
IF IsNull(ps_nombre) OR Len(Trim(ps_nombre)) = 0 THEN
// obtiene todos los datos
ELSE
	ls_nombre =ls_nombre + "%" 
	ls_clausula_where = ls_clausula_where + " AND (NOM_INSTALACION like " + char(039) +String(ls_nombre)+char(039)+ ") "
END IF

//IF pi_centro > 0 THEN
//	ls_clausula_where = ls_clausula_where + " AND (NRO_CENTRO = " + String(pi_centro) + ") "
//END IF
//
//IF pi_cmd > 0 THEN
//	ls_clausula_where = ls_clausula_where + " AND (NRO_CMD = " + String(pi_cmd) + ") "
//END IF
//
//IF pi_puesto > 0 THEN
//	ls_clausula_where = ls_clausula_where + " AND (NRO_MESA = " + String(pi_puesto) + ") "
//END IF
//

//SEBA
//Antiguamente llamava a una u otra funci$$HEX1$$f300$$ENDHEX$$n segun el perfil del usuario, para mostrar
//un puesto determinado o todos los puestos del cmd del usuario, pero ahora con el perfil 300
//tiene que poder mostrar todos los cmd de un cntro y si agregan otro perfil tiene que poder
//mostrar hasta todos los centros, segun el usuario se cargar$$HEX2$$e1002000$$ENDHEX$$el $$HEX1$$e100$$ENDHEX$$mbito antes de llamar a
//esta funci$$HEX1$$f300$$ENDHEX$$n.
IF pi_centro = 0 THEN
	ls_clausula_where = ls_clausula_where + " AND (NRO_CENTRO > 0) "
ELSE
	ls_clausula_where = ls_clausula_where + " AND (NRO_CENTRO = " + String(pi_centro) + ") "
END IF

IF pi_cmd = 0 THEN
	ls_clausula_where = ls_clausula_where + " AND (NRO_CMD > 0) "
ELSE
	ls_clausula_where = ls_clausula_where + " AND (NRO_CMD = " + String(pi_cmd) + ") "
END IF

IF pi_puesto = 0 THEN
	ls_clausula_where = ls_clausula_where + " AND (NRO_MESA > 0) "
ELSE
	ls_clausula_where = ls_clausula_where + " AND (NRO_MESA = " + String(pi_puesto) + ") "
END IF

ls_mod_string = 'DataWindow.Table.Select=" ' + ls_select_original + ls_clausula_where + ' " '

ls_modify = pdw_inst.Modify(ls_mod_string)

pdw_inst.Retrieve(pi_tipo)

ls_mod_string = 'DataWindow.Table.Select=" ' + ls_select_original + ' " '

ls_modify = pdw_inst.Modify(ls_mod_string)

IF pdw_inst.RowCount() = 0 THEN

	IF IsNull(ps_nombre) OR Len(LeftTrim(RightTrim(ps_nombre))) = 0 THEN
		gnv_msg.f_mensaje("EM24","","",OK!)
	ELSE
		gnv_msg.f_mensaje("EM10",ps_nombre,"",OK!)
	END IF
	RETURN -1
END IF


RETURN 1

end function

on u_gen_2002_nu_identificacion_instalacion.create
TriggerEvent( this, "constructor" )
end on

on u_gen_2002_nu_identificacion_instalacion.destroy
TriggerEvent( this, "destructor" )
end on


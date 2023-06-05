HA$PBExportHeader$u_inc_2021_pr_lista_incidencia.sru
forward
global type u_inc_2021_pr_lista_incidencia from u_gen_0000_lista
end type
end forward

global type u_inc_2021_pr_lista_incidencia from u_gen_0000_lista
int Width=2368
int Height=392
string DataObject="d_inc_2002_pr_lista_seleccion_incidencia"
end type
global u_inc_2021_pr_lista_incidencia u_inc_2021_pr_lista_incidencia

type variables
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row
datawindowchild ddw_nom_ins_afectada
datawindowchild ddw_nom_ins_origen
datawindowchild ddw_tip_ins_afectada
datawindowchild ddw_tip_ins_origen
datawindowchild ddw_tension
datawindowchild ddw_estado_actual
datawindowchild ddw_brigada
datawindowchild ddw_ot
datawindowchild ddw_causa
datawindowchild ddw_material_averiado
//
s_incidencia is_incidencia
//s_incid istr_incidencia
// constantes
//int fgci_perfil_oper_consulta
//int fgci_perfil_oper_alta_media
//int fgci_perfil_oper_baja
//int fgci_perfil_oper_encargado_turno
//int fgci_perfil_oper_gerente
//int fgci_tipo_direccion

String is_crit_ord = 'D'
end variables

forward prototypes
public function integer fnu_obtener_datos ()
public function string fnu_ordenar_direccion ()
public function string fnu_ordenar_fecha_res ()
public function string fnu_ordenar_peligro ()
public function string fnu_ordenar_por_cli_imp ()
public function string fnu_ordenar_por_duracion ()
public function string fnu_ordenar_por_nro_instalacion ()
public function string fnu_ordenar_por_prioridad ()
public function string fnu_jordenar_nro_incidencia ()
public function string fnu_ordenar_tip_incidencia ()
public function string fnu_ordenar_tip_tension ()
public function string fnu_ordenar_ccli_afec ()
public function string fnu_ordenar_pot_afectada ()
public function string fnu_ordenar_fecha_deteccion ()
public function string fnu_ordenar_estado_oper ()
public function string fnu_ordenar_estado_mant ()
public function string fnu_ordenar_instalacion ()
public function integer frn_filtrar_duracion (integer pi_duracion, string ps_operacion, integer pi_tiempo)
end prototypes

public function integer fnu_obtener_datos ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtener_datos 
//
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos y retrieve de la datawindow. 
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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


//this.settransobject(sqlca)
return this.retrieve()
 

end function

public function string fnu_ordenar_direccion ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_direcci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Ordena campos seg$$HEX1$$fa00$$ENDHEX$$n el tipo de direcci$$HEX1$$f300$$ENDHEX$$n.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
if fgci_tipo_direccion = 0 then
	xx = this.setsort("nom_calle " + is_crit_ord + ",num_puerta " + is_crit_ord)
	aa = this.sort()
else
	xx = this.setsort("aviso_esquina " + is_crit_ord)
	aa = this.sort()
end if

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF


return string(xx) + string(aa)



end function

public function string fnu_ordenar_fecha_res ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_fecha_res 
//
// Objetivo: Ordena por campo fecha de resoluci$$HEX1$$f300$$ENDHEX$$n
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("fec_resolucion " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_peligro ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_peligro
// 
// Objetivo: Establece orden por el campo indicativo de peligro.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("ind_peligro " + is_crit_ord + ",f_DETECCION A")
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)

end function

public function string fnu_ordenar_por_cli_imp ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_por_cli_imp
// 
// Objetivo: Establece orden por medio del campo cliente importante.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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


int xx,aa
xx = this.setsort("ind_cli_imp " + is_crit_ord + ",f_DETECCION A")
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_por_duracion ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_por_duraci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Establece orden por el campo duraci$$HEX1$$f300$$ENDHEX$$n
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
//xx = this.setsort("f_DETECCION A")
xx = this.setsort("dura_sr " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_por_nro_instalacion ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_por_nro_instalaci$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Establece orden por el campo n$$HEX1$$fa00$$ENDHEX$$mero de instalaci$$HEX1$$f300$$ENDHEX$$n.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa

xx = this.setsort("nro_instalacion " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_por_prioridad ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_por_prioridad
// 
// Objetivo: Establece orden por el campo  prioridad
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx ,aa
xx = this.setsort("Prioridad " + is_crit_ord + ",f_DETECCION A")
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)
end function

public function string fnu_jordenar_nro_incidencia ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_nro_incidencia
// 
// Objetivo: Establece orden por el campo n$$HEX1$$fa00$$ENDHEX$$mero de incidencia.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa

xx = this.setsort("nro_incidencia " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_tip_incidencia ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_tip_incidencia
// 
// Objetivo: Establece orden por el campo tipo de incidencia.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("compute0033 " + is_crit_ord + ",f_deteccion A")
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_tip_tension ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_tip_tensi$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Establece orden por el campo tipo de tensi$$HEX1$$f300$$ENDHEX$$n.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("tip_tension " + is_crit_ord + ",f_DETECCION A")
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_ccli_afec ();/////////////////////////////////////////////////////////////////////
// Funcion:  fnu_ordenar_ccli_afec
// 
// Objetivo: Establece orden por el campo clientes afectados
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("ccli_afec " + is_crit_ord + ", dura_sr " + is_crit_ord)
aa = this.sort()
IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)

end function

public function string fnu_ordenar_pot_afectada ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_pot_afectada
// 
// Objetivo: Establece orden por el campo potencia afectada.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("pot_afectada " + is_crit_ord + ", f_deteccion A")
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) +" "+ string(aa)


end function

public function string fnu_ordenar_fecha_deteccion ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_fecha_detecci$$HEX1$$f300$$ENDHEX$$n 
//
// Objetivo: Establece orden por el campo fecha_detecci$$HEX1$$f300$$ENDHEX$$n. 
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("f_deteccion " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function string fnu_ordenar_estado_oper ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_estado_oper 
//
// Objetivo: Establece orden por el campo incidencia del estado actual.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("est_actual " + is_crit_ord + ", dura_sr " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)

end function

public function string fnu_ordenar_estado_mant ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_estado_mant
// 
// Objetivo: Estable orden por medio del campo estado mantenimiento.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("estado_mantenimiento " + is_crit_ord + ", dura_sr " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)

end function

public function string fnu_ordenar_instalacion ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_instalacion
// 
// Objetivo: Establece orden por el campo instalacion.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
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

int xx,aa
xx = this.setsort("nombre_instalacion " + is_crit_ord + ",dura_sr " + is_crit_ord)
aa = this.sort()

IF is_crit_ord = 'D' THEN
	is_crit_ord = 'A'
ELSE
	is_crit_ord = 'D'
END IF

return string(xx) + string(aa)


end function

public function integer frn_filtrar_duracion (integer pi_duracion, string ps_operacion, integer pi_tiempo);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_filtrar_duracion
// 
// Objetivo: Permite filtrar la datawindow por el campo
//	          duraci$$HEX1$$f300$$ENDHEX$$n.
// 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_duracion
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int a
string ls_duracion

this.accepttext()
this.setfilter("")
this.filter()
ls_duracion= string(pi_duracion)
if pi_tiempo=2 then
	ls_duracion= string(pi_duracion*60)
elseif pi_tiempo=3 then
	ls_duracion= string(pi_duracion*60*24)
end if

if pi_duracion > 0 then 
	a=this.setfilter("cll_duracion " + ps_operacion + " " + ls_duracion)
	a=this.filter()
	a=this.filteredcount()
end if
return 1

end function

on constructor;//fnu_def_constantes()

end on


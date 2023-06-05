HA$PBExportHeader$u_inc_1001_pr_generico.sru
$PBExportComments$UserObject gen$$HEX1$$e900$$ENDHEX$$rico para la presentaci$$HEX1$$f300$$ENDHEX$$n de incidencia.
forward
global type u_inc_1001_pr_generico from u_inc_0000_generico_incidencia
end type
end forward

global type u_inc_1001_pr_generico from u_inc_0000_generico_incidencia
int Width=1793
int Height=893
end type
global u_inc_1001_pr_generico u_inc_1001_pr_generico

forward prototypes
public function integer fpr_posicion (integer pi_x, integer pi_y)
public function integer fpr_tamanio (integer pi_ancho, integer pi_alto)
public function string fnu_ordenar_direccion ()
public function string fnu_ordenar_fecha_res ()
public function string fnu_ordenar_peligro ()
public function string fnu_ordenar_por_cli_imp ()
public function string fnu_ordenar_por_duracion ()
public function string fnu_ordenar_por_nro_instalacion ()
public function string fnu_ordenar_por_prioridad ()
public function string fnu_jordenar_nro_incidencia ()
public function string fnu_ordenar_tip_incidencia ()
public function string fnu_ordenar_ind_suministro ()
public function string fnu_ordenar_tip_tension ()
public function string fnu_ordenar_ccli_afec ()
public function string fnu_ordenar_pot_afectada ()
public function string fnu_ordenar_fecha_deteccion ()
public function string fnu_ordenar_estado_oper ()
public function string fnu_ordenar_estado_mant ()
public function string fpr_estado_incidencia_bmp (integer pi_estado, string ps_estado, string ps_campo, ref datawindow pd_dw)
public function integer fnu_imprimir_registro (long pl_nro_aviso)
end prototypes

public function integer fpr_posicion (integer pi_x, integer pi_y);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_posici$$HEX1$$f300$$ENDHEX$$n
// 
// Objetivo: Ubica el objeto seg$$HEX1$$fa00$$ENDHEX$$n valores de par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:pi_x, pi_y
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

RETURN This.Move(pi_x,pi_y)
end function

public function integer fpr_tamanio (integer pi_ancho, integer pi_alto);/////////////////////////////////////////////////////////////////////
//
// Funcion: fpr_tamanio
// 
// Objetivo: Cambia el tama$$HEX1$$f100$$ENDHEX$$o del objeto seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_ancho, pi_alto
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

RETURN This.Resize(pi_ancho,pi_alto)
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
	xx = this.setsort("nom_calle,num_puerta D")
	aa = this.sort()
else
	xx = this.setsort("aviso_esquina D")
	aa = this.sort()
end if
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
xx = this.setsort("fec_resolucion D")
aa = this.sort()
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
xx = this.setsort("ind_peligro D,f_DETECCION A")
aa = this.sort()
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
xx = this.setsort("ind_cli_imp D,f_DETECCION A")
aa = this.sort()
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
xx = this.setsort("f_DETECCION A")
aa = this.sort()
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

xx = this.setsort("nro_instalacion D")
aa = this.sort()
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
xx = this.setsort("Prioridad A,f_DETECCION A")
aa = this.sort()
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

xx = this.setsort("nro_incidencia D")
aa = this.sort()
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
xx = this.setsort("tip_incidencia A,f_DETECCION A")
aa = this.sort()
return string(xx) + string(aa)


end function

public function string fnu_ordenar_ind_suministro ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_ind_suministro
// 
// Objetivo: Establece orden por el campo indicativo de suministro.
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
xx = this.setsort("ind_suministro D,f_DETECCION A")
aa = this.sort()
return string(xx)+" "+ string(aa)


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
xx = this.setsort("tip_tension A,f_DETECCION A")
aa = this.sort()
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
xx = this.setsort("ccli_afec D,f_DETECCION A")
aa = this.sort()
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
xx = this.setsort("pot_afectada D,f_DETECCION A")
aa = this.sort()
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
xx = this.setsort("f_deteccion D")
aa = this.sort()
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
xx = this.setsort("incidencia_est_actual A,f_deteccion D")
aa = this.sort()
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
xx = this.setsort("estado_mantenimiento A,f_DETECCION D")
aa = this.sort()
return string(xx) + string(aa)

end function

public function string fpr_estado_incidencia_bmp (integer pi_estado, string ps_estado, string ps_campo, ref datawindow pd_dw);////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_estado_incidencia_bmp
// 
// Objetivo: Retorna el camino de un bmp seg$$HEX1$$fa00$$ENDHEX$$n estado de la incidencia 
//           correspondiente.
//
// Ambito:	Global
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pi_estado
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	
//
/////////////////////////////////////////////////////////////////////

string ls_estado,ls_string,ls_pt,ls_eb,ls_cl,ls_er,ls_sr,ls_rs
ls_pt = "inci_pt.BMP"
ls_eb = "inci_eb.BMP"
ls_cl = "inci_cl.BMP"
ls_er = "inci_er.BMP"
ls_sr = "inci_sr.BMP"
ls_rs = "inci_rs.BMP"
ls_string = " "+ps_campo+".picturename="+ls_pt+"'~tif(incidencia_est_actual=2,ls_eb,ls_resulta) '"



return " "



end function

public function integer fnu_imprimir_registro (long pl_nro_aviso);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_imprimir_registro
// 
// Objetivo: Revisar esta en comentario, Imprime registro(nro_aviso) 
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pl_nro_aviso
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int resultado
//u_avi_2022_pr_impresion_aviso dw_ficticia
//dw_ficticia = create u_avi_2022_pr_impresion_aviso 
//resultado = dw_ficticia.fnu_impresion_aviso(dw_ficticia,pi_nro_aviso)
//destroy dw_ficticia
return resultado


end function

event dberror;// elimina padre
end event


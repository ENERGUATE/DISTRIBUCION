HA$PBExportHeader$u_avi_1001_pr_generico.sru
forward
global type u_avi_1001_pr_generico from u_avi_0000_generico_avisos
end type
end forward

global type u_avi_1001_pr_generico from u_avi_0000_generico_avisos
event ue_pasar_borde pbm_dwnmousemove
event ue_soltar_click pbm_dwnlbuttonup
end type
global u_avi_1001_pr_generico u_avi_1001_pr_generico

type variables
string is_nomcab
int ii_orden
string is_nomcab_borde
end variables

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
public function string fnu_ordenar_peligro2 ()
public function string fnu_ordenar_nro_aviso ()
public function string fnu_ordenar_est_aviso ()
public function integer fnu_imprimir_registro (long pl_nro_aviso)
end prototypes

event ue_pasar_borde;//string ls_cab
//if dwo.name= "datawindow" then return 0
//if isvalid(dwo) or not isnull(dwo) then
//	ls_cab=string(dwo.band)
//	if ls_cab = "header" then
//		dwo.pointer="mano.cur"
//	end if
//end if
end event

event ue_soltar_click;//string ls_sint
//ls_sint=is_nomcab_borde + ".Border='6'"
//this.Modify(ls_sint)
end event

public function integer fpr_posicion (integer pi_x, integer pi_y);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_posicion
//
// Objetivo: Ubica el objeto seg$$HEX1$$fa00$$ENDHEX$$n valores de par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada: pi_x, pi_y
//       Salida: --
// 
// Devuelve :
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////


RETURN This.Move(pi_x,pi_y)
end function

public function integer fpr_tamanio (integer pi_ancho, integer pi_alto);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_tamanio
//
// Objetivo: Cambia el tama$$HEX1$$f100$$ENDHEX$$o del objeto seg$$HEX1$$fa00$$ENDHEX$$n par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada: pi_ancho, pi_alto
//       Salida: --
// 
// Devuelve :
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////



RETURN This.Resize(pi_ancho,pi_alto)
end function

public function string fnu_ordenar_direccion ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_direccion
// 
// Objetivo: Establece orden seg$$HEX1$$fa00$$ENDHEX$$n el tipo de direcci$$HEX1$$f300$$ENDHEX$$n.
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
	xx = this.setsort("avisos_nom_calle A,num_puerta A,duplicador A")
	aa = this.sort()
else
	xx = this.setsort("aviso_esquina D , cduracion_int D")
	aa = this.sort()
end if
return string(xx) + string(aa)


end function

public function string fnu_ordenar_fecha_res ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_fecha_res
// 
// Objetivo: Establece orden por el campo fecha resuelta.
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
xx = this.setsort("fecha_res D , f_alta D")
aa = this.sort()
return string(xx) + string(aa)


end function

public function string fnu_ordenar_peligro ();
/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_ordenar_peligro
// 
// Objetivo: Establece orden por el campo peligro.
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
xx = this.setsort("ind_peligro D , cduracion_int D")
aa = this.sort()
return string(xx) + string(aa)

end function

public function string fnu_ordenar_por_cli_imp ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_por_cli_imp
// 
// Objetivo: Establece orden por el campo cliente importante.
//	
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
xx = this.setsort("ind_cli_imp D , cduracion_int D")
aa = this.sort()
return string(xx) + string(aa)


end function

public function string fnu_ordenar_por_duracion ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_por_duracion
// 
// Objetivo: Establece orden por el campo duraci$$HEX1$$f300$$ENDHEX$$n.
//	
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
//xx = this.setsort("f_alta A")
xx =this.setsort("cduracion_int D")
aa = this.sort()
return string(xx) + string(aa)


end function

public function string fnu_ordenar_por_nro_instalacion ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_por_nro_instalacion
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

xx = this.setsort("nro_instalacion D , f_alta D")
aa = this.sort()
return string(xx) + string(aa)


end function

public function string fnu_ordenar_por_prioridad ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_por_prioridad
// 
// Objetivo: Establece orden por el campo prioridad.
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
xx = this.setsort("Prioridad A , cduracion_int D")
aa = this.sort()
return string(xx) + string(aa)
end function

public function string fnu_jordenar_nro_incidencia ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_nro_incidencia
// 
// Objetivo: Establece orden por el campo n$$HEX1$$fa00$$ENDHEX$$mero de incidencia.
//	
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

xx = this.setsort("nro_incidencia D , cduracion_int D")
aa = this.sort()
return string(xx) + string(aa)


end function

public function string fnu_ordenar_peligro2 ();
/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_ordenar_peligro2
// 
// Objetivo: Establece orden por el campo peligro.
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
xx = this.setsort("avisos_ind_peligro D , cduracion_int D")
aa = this.sort()
return string(xx) + string(aa)

end function

public function string fnu_ordenar_nro_aviso ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ordenar_por_nro_aviso
// 
// Objetivo: Establece orden por el campo n$$HEX1$$fa00$$ENDHEX$$mero de aviso.
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

xx = this.setsort("nro_aviso A")
aa = this.sort()
return string(xx) + string(aa)

end function

public function string fnu_ordenar_est_aviso ();//
// Funcion:  fnu_ordenar_est_aviso
// 
// Objetivo: Establece orden por el campo estado del aviso.
//	
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
xx =this.setsort("est_aviso D")
aa = this.sort()
return string(xx) + string(aa)
end function

public function integer fnu_imprimir_registro (long pl_nro_aviso);/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_imprimir_registro
// 
// Objetivo: 
//	          
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_nro_aviso
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
u_avi_2022_pr_impresion_aviso dw_ficticia
dw_ficticia = create u_avi_2022_pr_impresion_aviso 
resultado = dw_ficticia.fnu_impresion_aviso(dw_ficticia,pl_nro_aviso)
destroy dw_ficticia
return resultado


end function

event clicked;call super::clicked;//string ls_nomcab
//string ls_nomcol
//string ls_tipo= " A"
//string ls_sint
//string ls_cab
//if dwo.name= "datawindow" then return 0
//if isvalid(dwo) or not isnull(dwo) then
//	ls_cab=string(dwo.band)
//	if ls_cab = "header" then	
//		ls_nomcab=dwo.name
//		ls_sint=ls_nomcab + ".Border='5'"
//		this.Modify(ls_sint)
//		is_nomcab_borde = ls_nomcab
//		ls_nomcol=left(ls_nomcab,Pos(ls_nomcab,"_t",1) - 1)
//		if is_nomcab = ls_nomcab and ii_orden=1 then
//			ii_orden=2
//			ls_tipo= " D"
//			this.SetSort(ls_nomcol + ls_tipo)
//		elseif is_nomcab = ls_nomcab and ii_orden=2 then
//			ii_orden=1
//			ls_tipo= " A"
//			this.SetSort(ls_nomcol + ls_tipo)
//		elseif is_nomcab <> ls_nomcab then
//			ii_orden=1
//			ls_tipo = " A"
//			this.SetSort(ls_nomcol + ls_tipo)
//	//		messagebox("1","nomcab=" + ls_nomcab + "nomcol=" + ls_nomcol + "tipo" + ls_tipo )
//			is_nomcab=ls_nomcab
//		end if
//		this.sort()
//	end if
//end if
end event


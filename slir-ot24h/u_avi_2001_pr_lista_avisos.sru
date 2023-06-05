HA$PBExportHeader$u_avi_2001_pr_lista_avisos.sru
$PBExportComments$Contiene la datawindow con la lista de avisos de una instalacion
forward
global type u_avi_2001_pr_lista_avisos from u_gen_0000_lista
end type
end forward

global type u_avi_2001_pr_lista_avisos from u_gen_0000_lista
integer width = 2025
integer height = 260
string dataobject = "d_avi_2001_pr_lista_avisos"
boolean vscrollbar = true
end type
global u_avi_2001_pr_lista_avisos u_avi_2001_pr_lista_avisos

type variables
int ii_fila_clickeada
int ii_filas_selec
// constantes
//int fgci_tipo_direccion
end variables

forward prototypes
public function string fnu_ordenar_direccion ()
public function string fnu_ordenar_por_duracion ()
public function string fnu_ordenar_por_prioridad ()
public function string fnu_ordenar_por_cli_imp ()
public function string fnu_ordenar_peligro2 ()
public function string fnu_ordenar_por_nro_instalacion ()
public function string fnu_ordenar_fecha_res ()
public subroutine f_seleccionar (integer pi_cant_filas)
public function string fnu_ordenar_est_aviso ()
public subroutine f_aplicar_formatos ()
end prototypes

public function string fnu_ordenar_direccion ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_ordenar_direccion
// 
// Objetivo: Establece el orden de los registros de la DW, 
//				 seg$$HEX1$$fa00$$ENDHEX$$n el valor de la direcci$$HEX1$$f300$$ENDHEX$$n. Y el tipo de la misma.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
//  Fecha      Responsable     Actuaci$$HEX1$$f300$$ENDHEX$$n
//  ------	   -----------   -------------
// 15/07/96			HMA		   Modificaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

int xx,aa

IF fgci_tipo_direccion = 0 THEN
	xx = This.SetSort("nom_calle A,num_puerta A,duplicador A")
	aa = This.Sort()
ELSE
	xx = This.SetSort("avisos_esquina D , f_alta D")
	aa = This.sort()
END IF

RETURN  String(xx) + String(aa)


end function

public function string fnu_ordenar_por_duracion ();//
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
xx =this.setsort("ci_duracion D")
aa = this.sort()
return string(xx) + string(aa)
end function

public function string fnu_ordenar_por_prioridad ();//
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
xx = this.setsort("Prioridad A , f_alta D")
aa = this.sort()
return string(xx) + string(aa)
end function

public function string fnu_ordenar_por_cli_imp ();//
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
xx = this.setsort("ind_cli_imp D , f_alta D")
aa = this.sort()
return string(xx) + string(aa)

end function

public function string fnu_ordenar_peligro2 ();/////////////////////////////////////////////////////////////////////
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
xx = this.setsort("avisos_ind_peligro D , f_alta D")
aa = this.sort()
return string(xx) + string(aa)

end function

public function string fnu_ordenar_por_nro_instalacion ();//
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

public function string fnu_ordenar_fecha_res ();//
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

public subroutine f_seleccionar (integer pi_cant_filas);//////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_seleccionar
//
//	Objetivo:	Indica la cantidad de filas que va a estar permitido
//					seleccionar.
//					Setea el valor de la variable ii_filas_selec donde se 
//					indica este hecho. 
//						0: no se seleccionar$$HEX1$$e100$$ENDHEX$$
//						1: una sola fila
//						2: una o m$$HEX1$$e100$$ENDHEX$$s filas
//					Por defecto, no permite seleccionar filas
//
//	Ambito:		P$$HEX1$$fa00$$ENDHEX$$blica
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pi_cant_filas
//					Salida:
//							
//	Devuelve:	Nada
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					26/9/95				EGF
//
//////////////////////////////////////////////////////////////////////

integer	i_lim_sup = 2
integer	i_lim_inf = 0

IF IsNull(pi_cant_filas) OR (pi_cant_filas < i_lim_inf) OR &
			(pi_cant_filas > i_lim_sup) THEN
	ii_filas_selec = 0
ELSE
	ii_filas_selec = pi_cant_filas
END IF

RETURN

end subroutine

public function string fnu_ordenar_est_aviso ();//
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
xx =this.setsort("est_aviso D")
aa = this.sort()
return string(xx) + string(aa)
end function

public subroutine f_aplicar_formatos ();//////////////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_aplicar_formatos
//
//	Objetivo:	Aplica color de fondo (Background.Color) a los avisos que pertenecen
// 				a una categor$$HEX1$$ed00$$ENDHEX$$a, tales como los (GRANDES CLIENTES).
//					Aplica color a los textos de las filas de los avisos.
//
//	Ambito:		P$$HEX1$$fa00$$ENDHEX$$blica
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	
//					Salida:
//							
//	Devuelve:	Nada
//
//	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
//				-------------			--------			-----------
//				Creaci$$HEX1$$f300$$ENDHEX$$n					03/08/17				TDA
//
//////////////////////////////////////////////////////////////////////

// Se obtiene una lista de objetos separados por TAB
// del DataWindows que contiene la lista de avisos
string 	ls_objects_dw_lista_avisos
ls_objects_dw_lista_avisos = this.Object.DataWindow.Objects

string ls_name_object, type_object, s
long ll_i, ll_len 
integer li_nro 
int li_posi

// Se obtiene la posici$$HEX1$$f300$$ENDHEX$$n donde se encuentra una tabulaci$$HEX1$$f300$$ENDHEX$$n
// En el caso que haya una tabulaci$$HEX1$$f300$$ENDHEX$$n en la cadena donde est$$HEX1$$e100$$ENDHEX$$n todos los controles del datawindow
// se procede a obtener el texto que est$$HEX2$$e1002000$$ENDHEX$$a la izquierda de ese simbolo (el cual equivale a un campo del datawindow)
// para luego modificar los colores del texto como del fondo de estos elementos.
do while pos(ls_objects_dw_lista_avisos , '~t') > 0
   li_posi = pos(ls_objects_dw_lista_avisos , '~t')
	ls_name_object =  left(ls_objects_dw_lista_avisos , li_posi - 1)
	
	// En el caso que los elementos del datawindow sean del tipo Column o Compute
	// se le aplicacan unos formatos de fuentes
	type_object = this.describe(ls_name_object + ".Type")
	if type_object = "column" or type_object = "compute" then
		this.modify(ls_name_object + ".Color = '8388608~tif ((activo = 1 and ind_peligro = 1),long(color),case( ind_red  when 0 then 128  when 1 then 8388608 when 2  then 8388608))'")
		this.modify(ls_name_object + ".Background.Color = '81324524~tif ((ind_cli_imp  <= 0 or cod_categoria <= 0 ),RGB(160,160,164),  long(cod_color_categoria))'")
	end if
	
   ls_objects_dw_lista_avisos = trim(mid(ls_objects_dw_lista_avisos , li_posi + 1, len(ls_objects_dw_lista_avisos)))
loop

end subroutine

on constructor;//fnu_def_constantes()
end on

on u_avi_2001_pr_lista_avisos.create
end on

on u_avi_2001_pr_lista_avisos.destroy
end on


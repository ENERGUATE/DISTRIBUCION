HA$PBExportHeader$u_avi_2021_pr_lista_avisos_cliente.sru
forward
global type u_avi_2021_pr_lista_avisos_cliente from u_avi_1001_pr_generico
end type
end forward

global type u_avi_2021_pr_lista_avisos_cliente from u_avi_1001_pr_generico
integer width = 4023
integer height = 620
string dataobject = "d_avi_2019_pr_lista_avisos_consulta"
event ue_key_down pbm_keydown
end type
global u_avi_2021_pr_lista_avisos_cliente u_avi_2021_pr_lista_avisos_cliente

forward prototypes
public function integer fnu_obtener_datos ()
public function integer frn_filtrar_duracion (integer pi_duracion, string ps_operacion, integer pi_tiempo)
end prototypes

event ue_key_down;/////////////////////////////////////////////////////
//	Permite moverse con los cursores desde el teclado
// GSE 18/05/2001
//
//////////////////////////////////////////////////////
long ll_row
string ls_dataobject


IF keyflags = 0 and this.rowcount() > 1 THEN  
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyUpArrow! and ll_row > 1 THEN
		this.selectrow(0,False)
		this.selectrow(ll_row - 1,true)
	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
		this.selectrow(0,False)
		this.selectrow(ll_row + 1,true)
	END IF

END IF

IF  KeyDown(KeyD!) AND KeyDown(KeyControl!)  then
		// reseteo la tabla para que coja la datawindow por default.
		
		if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Va a eliminar la configuraci$$HEX1$$f300$$ENDHEX$$n que tiene para esta lista. $$HEX1$$bf00$$ENDHEX$$Dese continuar?",information!,okcancel!) = 1 then
		
			ls_dataobject = this.dataobject
	
			delete from gi_sintaxis_usuario
			where usuario = :gs_usuario and 
					 datawindow = :ls_dataobject;
			
			gnu_u_transaction.uf_commit()
			
			this.dataobject = ls_dataobject
			this.settransobject(sqlca)
			
		end if
		
END IF
end event

public function integer fnu_obtener_datos ();/////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:  fnu_obtener_datos
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
	a=this.setfilter("cduracion_int " + ps_operacion + " " + ls_duracion)
	a=this.filter()
	a=this.filteredcount()
end if
return 1
end function

on u_avi_2021_pr_lista_avisos_cliente.create
call super::create
end on

on u_avi_2021_pr_lista_avisos_cliente.destroy
call super::destroy
end on


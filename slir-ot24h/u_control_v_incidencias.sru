HA$PBExportHeader$u_control_v_incidencias.sru
forward
global type u_control_v_incidencias from nonvisualobject
end type
type st_ventana from structure within u_control_v_incidencias
end type
end forward

type st_ventana from structure
	long		incidencia
	long		handle
	integer		ventana
	string		nombre_instalacion
	boolean		activado
	boolean		operacion
	character		modo
	boolean		incidencia_operacion
end type

global type u_control_v_incidencias from nonvisualobject autoinstantiate
end type

type variables
public st_ventana   ist_ventana[]
end variables

forward prototypes
public function integer of_cierra_ventana (long pl_incidencia, long pl_handle)
public subroutine of_actualiza_lista ()
public function integer of_abre_ventana (long pl_handle, window pw_w_main, integer pi_posicion)
public function integer of_recupera_padre (ref window pw_buscada, powerobject pbo_origen, string ps_clase)
public function window of_busca_ventana (long pl_incidencia, long pl_handle)
public function integer of_actualiza_nro_incidencia (long pl_handle, long pl_incidencia, string ps_nombre_instalacion)
public subroutine of_ventana_activada (long pl_handle, boolean pb_activacion)
public subroutine of_actualiza_operaciones (long pl_incidencia, boolean pb_activado, long pl_handle)
public function integer of_comprueba_llamante (string ps_llamante, ref long pl_incidencia)
public function window of_busca_hija (long pl_handle)
public function integer of_numero_ventanas ()
public function integer of_numero_ventanas_mante ()
public function integer of_abre_ventana (long pl_incidencia, long pl_handle, window pw_w_main, integer pi_posicion)
public function integer of_abre_ventana (long pl_incidencia, long pl_handle, window pw_w_main, integer pi_posicion, long pl_nis_rad, long pl_nro_aviso)
end prototypes

public function integer of_cierra_ventana (long pl_incidencia, long pl_handle);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_Cierra_ventana
//
//  Argumentos : pl_incidencia --> Numero de incidencia de la ventana que se quiera abrir
//					  pl_handle  --> Handle de la ventana que se quiere abrir
//				
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Elimina del array la referencia a la ventana solicitada.
//	
//
//  Valores de retorno :  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int li_numero_ventana


for li_numero_ventana= 1 to upperbound(ist_ventana)
	if ist_ventana[li_numero_ventana].incidencia=pl_incidencia or ist_ventana[li_numero_ventana].handle = pl_handle then 
		// ENCONTRADA --> PONEMOS A 0
		ist_ventana[li_numero_ventana].nombre_instalacion=""
		ist_ventana[li_numero_ventana].ventana=0
		ist_ventana[li_numero_ventana].incidencia_operacion = false
		of_actualiza_lista()
		exit
	end if
next

for li_numero_ventana= 1 to upperbound(ist_ventana)
	if ist_ventana[li_numero_ventana].ventana>0 then exit // HAY UNA ABIERTA
next	
//if li_numero_ventana > upperbound(ist_ventana) then  // ESTAN TODAS CERRADAS
	if isvalid(gu_operaciones) then gu_operaciones.of_borra_ip(pl_incidencia)
//end if
return 1

end function

public subroutine of_actualiza_lista ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualiza_lista
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Actualiza la lista de incidencias 
//	
//
//  Valores de retorno :
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////





int i,j 
long ll_handle, ll_handle_padre

boolean lb_hay_items= false

treeviewitem l_lvi
for i=1 to upperbound(this.ist_ventana)
	if (this.ist_ventana[i].ventana=1) then 
		lb_hay_items=true
		exit
	end if
next


/*if lb_hay_items and md_operaciones.m_editar.m_mostrar.enabled = false then 
	md_operaciones.m_editar.m_mostrar.enabled = true
end if*/
	
/*if not isvalid(w_lista_incidencia) and lb_hay_items and md_operaciones.m_editar.m_mostrar.checked then 
	open(w_lista_incidencia)
end if*/



if  isvalid(w_lista_incidencia) then 

w_lista_incidencia.tv_1.deleteitem(0)
w_lista_incidencia.tv_1.setredraw(false)	
l_lvi.label="Incidencias en curso"
l_lvi.pictureIndex=4
l_lvi.selectedpictureindex = 4

ll_handle_padre= w_lista_incidencia.tv_1.insertitemsort(0,l_lvi)
for i=1 to upperbound(this.ist_ventana)
	if (this.ist_ventana[i].ventana=1) then 
		lb_hay_items= true
		l_lvi.data=this.ist_ventana[i].handle
		if this.ist_ventana[i].nombre_instalacion="" or isnull(this.ist_ventana[i].nombre_instalacion) then 
			l_lvi.label="("+this.ist_ventana[i].modo+")  "+string(this.ist_ventana[i].incidencia) 
		else
			l_lvi.label="("+this.ist_ventana[i].modo+") "+string(this.ist_ventana[i].incidencia) + " (" +this.ist_ventana[i].nombre_instalacion +")"
		end if
		l_lvi.selectedpictureindex = 2
		if this.ist_ventana[i].operacion then
				l_lvi.pictureIndex=3
				l_lvi.selectedpictureindex = 3
		else
			if this.ist_ventana[i].activado then
				l_lvi.pictureIndex=2
				l_lvi.hasfocus = true
			else
				l_lvi.pictureIndex=1
  				l_lvi.hasfocus = false
			end if 
		end if
		ll_handle= w_lista_incidencia.tv_1.insertitemsort(ll_handle_padre,l_lvi)
		
	   if this.ist_ventana[i].activado then 	w_lista_incidencia.tv_1.SelectItem(ll_handle)			
	end if
next 
w_lista_incidencia.tv_1.expanditem(ll_handle_padre)
w_lista_incidencia.tv_1.setredraw(true)
	if not lb_hay_items then close(w_lista_incidencia)
end if

//if not lb_hay_items then 	md_operaciones.m_editar.m_mostrar.enabled = false




end subroutine

public function integer of_abre_ventana (long pl_handle, window pw_w_main, integer pi_posicion);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_abre_ventana
//
//  Argumentos : pl_handle  --> Handle de la ventana que se quiere abrir
//					  pw_w_main --> Ventana w_operacion
//					  pi_posicion --> Posici$$HEX1$$f300$$ENDHEX$$n
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Abre la ventana solicitada segun el handle.
//	
//
//  Valores de retorno :  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
///////////////////////////////////////////////////////////////////////////////
int li_numero_ventana
w_2301_form_incidencia  lw_ventana 


if not (pl_handle= -1)  then  // SI =-1 ventana nueva

for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=1) and  (ist_ventana[li_numero_ventana].handle = pl_handle) then 
		// ENCONTRADA VENTANA LA ABRIMOS
		lw_ventana = of_busca_hija(ist_ventana[li_numero_ventana].handle)
		OpenSheet(lw_ventana ,pw_w_main,pi_posicion, Layered!)
		ShowWindow  (ist_ventana[li_numero_ventana].handle, 1 )  
		return 1
	end if
next

end if

return 1

end function

public function integer of_recupera_padre (ref window pw_buscada, powerobject pbo_origen, string ps_clase);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_recupera_padre
//
//  Argumentos : ps_clase_ventana--> Nombre de la clase de ventana buscada
//					  pw_buscada --> Ventana encontrada 
//					  pbo_origen --> Objeto a partir del cual se inicia la busqueda
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Busca entre los padres de un objeto cual de ellos es una ventana  que se le pasa como 
//					parametro. Devuelve el objeto seleccionado en la variable pbo_buscado
//	
//
//  Valores de retorno :  0 --> No se ha encontrado.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

powerobject  lpo_origen

window ventana 

lpo_origen = pbo_origen

do while (lpo_origen.typeOf() <>Window! )
		lpo_origen = lpo_origen.Getparent()
loop

// Se encuentra una ventana miramos si es del tipo que nos interesa
if lpo_origen.typeOf()= Window! then 
	ventana = lpo_origen
	if ventana.classname()=ps_clase OR ventana.classname() = 'w_2301_hist_form_incidencia' then
		pw_buscada= ventana
   else
		return 0
	end if
else 
	return 0
end if
return 1
end function

public function window of_busca_ventana (long pl_incidencia, long pl_handle);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_Busca_ventana
//
//  Argumentos : pl_incidencia --> Numero de incidencia de la ventana que se quiera abrir

//					  pl_handle  --> Handle de la ventana que se quiere abrir
//					
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Busca la ventana solicitada bien por incidencia o por handle
//	
//
//  Valores de retorno :  ventana --> Correcto.
//								  Null --> No encontrada
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

w_2301_form_incidencia  lw_retorno
setnull(lw_retorno)
int li_numero_ventana
for li_numero_ventana= 1 to upperbound(ist_ventana[])
if (ist_ventana[li_numero_ventana].ventana=1) and &
 (ist_ventana[li_numero_ventana].incidencia=pl_incidencia or ist_ventana[li_numero_ventana].handle=pl_handle) then // ENCONTRADA
 
   lw_retorno=of_busca_hija(ist_ventana[li_numero_ventana].handle)
	exit
end if

next



return lw_retorno
end function

public function integer of_actualiza_nro_incidencia (long pl_handle, long pl_incidencia, string ps_nombre_instalacion);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualiza_nro_incidencia
//
//  Argumentos : pl_incidencia --> Numero de incidencia que se quiere actualizar
//					  pl_handle  --> Handle de la ventana 
//					
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Actualiza el numero de la incidencia asociada con la ventana que se quiere abrir
//	
//
//  Valores de retorno :  1 --> Correcto.
//								  0 ---> No encontrado
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int li_numero_ventana


for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=1) and  ( ist_ventana[li_numero_ventana].handle = pl_handle) then 
		// ENCONTRADA VENTANA
		 ist_ventana[li_numero_ventana].incidencia=pl_incidencia
		 ist_ventana[li_numero_ventana].nombre_instalacion=ps_nombre_instalacion
		return 1
	end if
next
return 0
end function

public subroutine of_ventana_activada (long pl_handle, boolean pb_activacion);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_ventana_Activada
//
//  Argumentos : pl_handle  --> Handle de la ventana 
//					
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Actualiza el flag de activacion 
//
//  Valores de retorno :  1 --> Correcto.
//								  0 ---> No encontrado
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int li_numero_ventana


for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=1) and  ( ist_ventana[li_numero_ventana].handle = pl_handle) then 
		// ENCONTRADA VENTANA
		 ist_ventana[li_numero_ventana].activado = pb_activacion

	end if
next
of_actualiza_lista()

end subroutine

public subroutine of_actualiza_operaciones (long pl_incidencia, boolean pb_activado, long pl_handle);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualiza_operaciones
//
//  Argumentos : pl_incidencia --> Numero de incidencia que se quiere actualizar
//					  pl_handle  --> Handle de la ventana 
//					  pb_activado --> Indica si debe cambiar o no el icono
//					
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Actualiza la ventana de incidencias segun lo que ha llegado de operaciones
//	
//
//  Valores de retorno :  
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int li_numero_ventana
w_2301_form_incidencia lw_ventana
	
for li_numero_ventana= 1 to upperbound(ist_ventana)

	if (ist_ventana[li_numero_ventana].ventana=1) and  (ist_ventana[li_numero_ventana].incidencia = pl_incidencia or ist_ventana[li_numero_ventana].handle = pl_handle) then 
		// ENCONTRADA VENTANA
		if pb_activado then // CAMBIAMOS EL ICONO  A OPERACIONES
			if not isvalid(w_lista_incidencia) then
				if md_operaciones.m_editar.m_notificar.checked = true then
					md_operaciones.m_editar.m_mostrar.checked=true
					fw_escribe_log(string(NOW()) + ":  abriendo w_lista_incidencia (u_control_v_incidencias,of_actualiza_operaciones)")
					open(w_lista_incidencia)
				end if
			end if 
			 ist_ventana[li_numero_ventana].operacion= true
		else // REFRESCA LA VENTANA

			if  ist_ventana[li_numero_ventana].operacion= true then 
				ist_ventana[li_numero_ventana].operacion= false
				lw_ventana=of_busca_hija(ist_ventana[li_numero_ventana].handle)
			//	messagebox("Aviso","Cambiar of_Actualiza_operaciones")
			
			if ist_ventana[li_numero_ventana].Modo='C' then // MODO CONSULTA
			 fw_escribe_log(string(NOW()) + ":  lanzando ue_refresca (u_control_v_incidencias,of_actualiza_operaciones)")
			 lw_ventana.triggerevent("ue_refresca")
			else
			 fw_escribe_log(string(NOW()) + ":  lanzando ue_refresca_mante (u_control_v_incidencias,of_actualiza_operaciones)")
			 lw_ventana.triggerevent("ue_refresca_mante")
			end if
			
			end if

		end if
	end if
next

//if isvalid(w_1105_avisos_con_alim) then
//	w_1105_avisos_con_alim.triggerevent("ue_refrescar",0,2)	
//end if
fw_escribe_log(string(NOW()) + ":  lanzando of_actualiza_lista (u_control_v_incidencias,of_actualiza_operaciones)")
of_actualiza_lista()
end subroutine

public function integer of_comprueba_llamante (string ps_llamante, ref long pl_incidencia);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_comprueba_llamante
//
//  Argumentos : ps_llamante --> Nombre de la ventana llamante
//					  pl_incidencia --> Numero de la Incidencia 
//					
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Comprueba si alguna de las incidencias han sido llamadas desde la ventana llamante
//	
//
//  Valores de retorno :  1 --> Correcto.
//								  0 ---> No encontrado
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int li_numero_ventana
w_2301_form_incidencia lw_ventana

for li_numero_ventana= 1 to upperbound(ist_ventana)
	if ist_ventana[li_numero_ventana].ventana=1  then 
		lw_ventana= of_busca_hija(ist_ventana[li_numero_ventana].handle)
	 if (lw_ventana.lu_comunic.is_comunic.programa_llamante = ps_llamante) then 
		// ENCONTRADA VENTANA
		 pl_incidencia = ist_ventana[li_numero_ventana].incidencia
		 return 1
   	end if
  end if
next

pl_incidencia=-1
return 0


end function

public function window of_busca_hija (long pl_handle);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_abre_ventana
//
//  Argumentos : ps_incidencia --> Numero de incidencia de la ventana que se quiera abrir
//					  pl_handle  --> Handle de la ventana que se quiere abrir
//					  pw_w_main --> Ventana w_operacion
//					  pi_posicion --> Posici$$HEX1$$f300$$ENDHEX$$n
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Abre la ventana solicita segun la incidencia o handle, si no la encuentra crea una nueva.
//	
//
//  Valores de retorno :  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
window lw_ventana
setnull(lw_ventana)

lw_ventana=w_genapp_frame.GetFirstSheet()

do while Isvalid(lw_ventana) 
if handle(lw_ventana) = pl_handle then return lw_ventana

lw_ventana=w_genapp_frame.GetNextSheet(lw_ventana)
loop



return lw_ventana
end function

public function integer of_numero_ventanas ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_numero_ventanas
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Calcula el numero de ventanas abiertas
//	
//
//  Valores de retorno :  Numero de ventanas
//
//  Realizado por Alfonso Coto
//
//  Fecha : 05/02/2002	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
///////////////////////////////////////////////////////////////////////////////
int li_numero_ventana

int li_cantidad_ventanas = 0 



for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=1)  then 
		// ENCONTRADA VENTANA LA ABRIMOS
			li_cantidad_ventanas ++
		end if
next


return  li_cantidad_ventanas
end function

public function integer of_numero_ventanas_mante ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_numero_ventanas
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Calcula el numero de ventanas abiertas
//	
//
//  Valores de retorno :  Numero de ventanas
//
//  Realizado por LFE
//
//  Fecha : 28/10/2002	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
///////////////////////////////////////////////////////////////////////////////
int li_numero_ventana
int li_cantidad_ventanas = 0 

for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=1) and (ist_ventana[li_numero_ventana].modo='M')   then 
	// ENCONTRADA VENTANA LA ABRIMOS
		li_cantidad_ventanas ++
	end if
next

return  li_cantidad_ventanas
end function

public function integer of_abre_ventana (long pl_incidencia, long pl_handle, window pw_w_main, integer pi_posicion);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_abre_ventana
//
//  Argumentos : ps_incidencia --> Numero de incidencia de la ventana que se quiera abrir
//					  pl_handle  --> Handle de la ventana que se quiere abrir
//					  pw_w_main --> Ventana w_operacion
//					  pi_posicion --> Posici$$HEX1$$f300$$ENDHEX$$n
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Abre la ventana solicita segun la incidencia o handle, si no la encuentra crea una nueva.
//	
//
//  Valores de retorno :  1 --> Correcto.
//                        0 --> La ventana se ha abierto antes en otro modo
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int li_numero_ventana
environment    lenv_env 
// Se declara una instancia de la ventana de incidencias
w_2301_form_incidencia  lw_ventana 
// Se declara una instancia de la ventana del hist$$HEX1$$f300$$ENDHEX$$rico de incidencias
w_2301_hist_form_incidencia lw_ventana2

if not (pl_incidencia=-1 and pl_handle= -1)  then  // SI =-1 ventana nueva

for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=1) and  (ist_ventana[li_numero_ventana].incidencia=pl_incidencia or ist_ventana[li_numero_ventana].handle = pl_handle) then 
		// ENCONTRADA VENTANA LA ABRIMOS
		lw_ventana = of_busca_hija(ist_ventana[li_numero_ventana].handle)
		if gu_comunic.is_comunic.accion_llamada<>lw_ventana.lu_comunic.is_comunic.accion_llamada then
			messagebox("Aviso","La incidencia solicitada ya se encuentra abierta en otra ventana")
			return 0
		else
   		OpenSheet(lw_ventana ,pw_w_main,pi_posicion, Layered!)
			ShowWindow  (ist_ventana[li_numero_ventana].handle, 1 )  
   		if lw_ventana.lu_comunic.is_comunic.accion_llamada<>"Consulta" then return -1
			return 1
		end if
	end if
next

end if

// SE DEBE VERIFICAR EL SISTEMA OPERATIVO YA QUE SOLO EN WINDOWS NT SE GARANTIZA QUE SE PUEDAN ABRIR MAS DE DOS VENTANAS DE INCIDENCIAS

GetEnvironment(lenv_env)
if isvalid (lenv_env) then 
	if  lenv_env.ostype<>windowsnt! then // si no es NT no se permite abrir mas de dos ventanas de incidencias
	  if  of_numero_ventanas()> 1 then 
			messagebox("Aviso","El sistema operativo instalado no permite abrir m$$HEX1$$e100$$ENDHEX$$s de dos ventanas de incidencias a la vez")
			return 0
		end if
	end if
end if 



// NO SE HA ENCONTRADO CREAMOS UNA NUEVA
for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=0) then // ESTA EL HUECO VACIO
		exit
	end if
next

// Se comprueba si la ventana que se va a abrir es el hist$$HEX1$$f300$$ENDHEX$$rico de incidencias o
// la normal de incidencias (LFE)
IF gu_comunic.is_comunic.programa_llamante="Hist_Inci" THEN
	
	// Se trata del hist$$HEX1$$f300$$ENDHEX$$rico de incidencias
	gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia"
	// Se abre la ventana del hist$$HEX1$$f300$$ENDHEX$$rico
	OpenSheet(lw_ventana2,pw_w_main,pi_posicion, Layered!)
	// Se aplica polimorfismo, lw_ventana se comportar$$HEX2$$e1002000$$ENDHEX$$como una ventana de tipo w_2301_hist_form_incidencia
	// Esto es necesario para que los hist$$HEX1$$f300$$ENDHEX$$ricos se contemplen como incidencias iconizadas (LFE)
	lw_ventana = lw_ventana2
ELSE
	// SI SE ABRE UNA VENTANA QUE NO SEA DEL HISTORICO SE INSERTA SU IP DE LA MAQUINA EN GI_IP_SGI
	if isvalid(gu_operaciones) then gu_operaciones.of_inserta_ip(pl_incidencia)
	
	OpenSheet(lw_ventana,pw_w_main,pi_posicion, Layered!)
END IF

ist_ventana[li_numero_ventana].ventana=1

if isvalid(lw_ventana) then
	
	if lw_ventana.lu_comunic.is_comunic.accion_llamada="Consulta" then
		ist_ventana[li_numero_ventana].Modo='C'
		
		if lw_ventana.fw_incidencia_de_operaciones() then 
		   ist_ventana[li_numero_ventana].incidencia_operacion = true
		else
		   ist_ventana[li_numero_ventana].incidencia_operacion = false
		end if
		
	else
		ist_ventana[li_numero_ventana].Modo='M'
	end if
	
	if pl_incidencia=-1 then 
		ist_ventana[li_numero_ventana].incidencia= lw_ventana.tab_1.il_nro_incidencia
	else
		ist_ventana[li_numero_ventana].incidencia= pl_incidencia
	end if
	
	if not isnull(lw_ventana.tab_1.tabpage_formulario.d_inf_general.object.nombre_instalacion[1]) then
	  ist_ventana[li_numero_ventana].nombre_instalacion = lw_ventana.tab_1.tabpage_formulario.d_inf_general.object.nombre_instalacion[1]
	else
		ist_ventana[li_numero_ventana].nombre_instalacion=""
	end if
	
	ist_ventana[li_numero_ventana].handle=handle(lw_ventana)
	ist_ventana[li_numero_ventana].activado=true
	of_actualiza_lista()

end if

return 1

end function

public function integer of_abre_ventana (long pl_incidencia, long pl_handle, window pw_w_main, integer pi_posicion, long pl_nis_rad, long pl_nro_aviso);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_abre_ventana
//
//  Argumentos : ps_incidencia --> Numero de incidencia de la ventana que se quiera abrir
//					  pl_handle  --> Handle de la ventana que se quiere abrir
//					  pw_w_main --> Ventana w_operacion
//					  pi_posicion --> Posici$$HEX1$$f300$$ENDHEX$$n
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Abre la ventana solicita segun la incidencia o handle, si no la encuentra crea una nueva.
//	
//
//  Valores de retorno :  1 --> Correcto.
//                        0 --> La ventana se ha abierto antes en otro modo
//
//  Realizado por Alfonso Coto
//
//  Fecha : 27/06/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int li_numero_ventana
environment    lenv_env 
// Se declara una instancia de la ventana de incidencias
w_2301_form_incidencia  lw_ventana 
// Se declara una instancia de la ventana del hist$$HEX1$$f300$$ENDHEX$$rico de incidencias
w_2301_hist_form_incidencia lw_ventana2

if not (pl_incidencia=-1 and pl_handle= -1)  then  // SI =-1 ventana nueva

for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=1) and  (ist_ventana[li_numero_ventana].incidencia=pl_incidencia or ist_ventana[li_numero_ventana].handle = pl_handle) then 
		// ENCONTRADA VENTANA LA ABRIMOS
		lw_ventana = of_busca_hija(ist_ventana[li_numero_ventana].handle)
		if gu_comunic.is_comunic.accion_llamada<>lw_ventana.lu_comunic.is_comunic.accion_llamada then
			messagebox("Aviso","La incidencia solicitada ya se encuentra abierta en otra ventana")
			return 0
		else
   		OpenSheet(lw_ventana ,pw_w_main,pi_posicion, Layered!)
			ShowWindow  (ist_ventana[li_numero_ventana].handle, 1 )  
   		if lw_ventana.lu_comunic.is_comunic.accion_llamada<>"Consulta" then return -1
			return 1
		end if
	end if
next

end if

// SE DEBE VERIFICAR EL SISTEMA OPERATIVO YA QUE SOLO EN WINDOWS NT SE GARANTIZA QUE SE PUEDAN ABRIR MAS DE DOS VENTANAS DE INCIDENCIAS

GetEnvironment(lenv_env)
if isvalid (lenv_env) then 
	if  lenv_env.ostype<>windowsnt! then // si no es NT no se permite abrir mas de dos ventanas de incidencias
	  if  of_numero_ventanas()> 1 then 
			messagebox("Aviso","El sistema operativo instalado no permite abrir m$$HEX1$$e100$$ENDHEX$$s de dos ventanas de incidencias a la vez")
			return 0
		end if
	end if
end if 



// NO SE HA ENCONTRADO CREAMOS UNA NUEVA
for li_numero_ventana= 1 to upperbound(ist_ventana)
	if (ist_ventana[li_numero_ventana].ventana=0) then // ESTA EL HUECO VACIO
		exit
	end if
next

// Se comprueba si la ventana que se va a abrir es el hist$$HEX1$$f300$$ENDHEX$$rico de incidencias o
// la normal de incidencias (LFE)
IF gu_comunic.is_comunic.programa_llamante="Hist_Inci" THEN
	
	// Se trata del hist$$HEX1$$f300$$ENDHEX$$rico de incidencias
	gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia"
	// Se abre la ventana del hist$$HEX1$$f300$$ENDHEX$$rico
	OpenSheet(lw_ventana2,pw_w_main,pi_posicion, Layered!)
	// Se aplica polimorfismo, lw_ventana se comportar$$HEX2$$e1002000$$ENDHEX$$como una ventana de tipo w_2301_hist_form_incidencia
	// Esto es necesario para que los hist$$HEX1$$f300$$ENDHEX$$ricos se contemplen como incidencias iconizadas (LFE)
	lw_ventana = lw_ventana2
ELSE
	// SI SE ABRE UNA VENTANA QUE NO SEA DEL HISTORICO SE INSERTA SU IP DE LA MAQUINA EN GI_IP_SGI
	if isvalid(gu_operaciones) then gu_operaciones.of_inserta_ip(pl_incidencia)
	//EDM-16-FASE-02
	st_params st_parametros

	st_parametros.l_nro_aviso = pl_nro_aviso
	st_parametros.l_nro_incidencia = pl_incidencia
	st_parametros.l_nis_rad = pl_nis_rad
	//OpenSheet(lw_ventana,pw_w_main,pi_posicion, Layered!)
	OpenSheetWithParm (w_consulta_incidencia,st_parametros, w_genapp_frame, menu, layered!)
END IF

ist_ventana[li_numero_ventana].ventana=1

if isvalid(lw_ventana) then
	
	if lw_ventana.lu_comunic.is_comunic.accion_llamada="Consulta" then
		ist_ventana[li_numero_ventana].Modo='C'
		
		if lw_ventana.fw_incidencia_de_operaciones() then 
		   ist_ventana[li_numero_ventana].incidencia_operacion = true
		else
		   ist_ventana[li_numero_ventana].incidencia_operacion = false
		end if
		
	else
		ist_ventana[li_numero_ventana].Modo='M'
	end if
	
	if pl_incidencia=-1 then 
		ist_ventana[li_numero_ventana].incidencia= lw_ventana.tab_1.il_nro_incidencia
	else
		ist_ventana[li_numero_ventana].incidencia= pl_incidencia
	end if
	
	if not isnull(lw_ventana.tab_1.tabpage_formulario.d_inf_general.object.nombre_instalacion[1]) then
	  ist_ventana[li_numero_ventana].nombre_instalacion = lw_ventana.tab_1.tabpage_formulario.d_inf_general.object.nombre_instalacion[1]
	else
		ist_ventana[li_numero_ventana].nombre_instalacion=""
	end if
	
	ist_ventana[li_numero_ventana].handle=handle(lw_ventana)
	ist_ventana[li_numero_ventana].activado=true
	of_actualiza_lista()

end if

return 1

end function

on u_control_v_incidencias.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_control_v_incidencias.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


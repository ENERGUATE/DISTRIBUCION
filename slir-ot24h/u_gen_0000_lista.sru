HA$PBExportHeader$u_gen_0000_lista.sru
$PBExportComments$Objeto gen$$HEX1$$e900$$ENDHEX$$rico del cual deberian heredar todas y cada una de las datawindows que contienen listas. Contiene eventos de ordenaci$$HEX1$$f300$$ENDHEX$$n por cabecera.
forward
global type u_gen_0000_lista from datawindow
end type
end forward

global type u_gen_0000_lista from datawindow
integer width = 494
integer height = 360
integer taborder = 1
string dragicon = "Rows.ico"
boolean minbox = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event ue_mover_borde pbm_dwnmousemove
event ue_soltar_clicked pbm_dwnlbuttonup
event ue_as_need ( )
event ue_key_down pbm_dwnkey
event ue_obtener_syntax ( )
end type
global u_gen_0000_lista u_gen_0000_lista

type variables
string is_nomcab
int ii_orden
int ii_transparente = 1
int ii_opaco = 0
int ii_sep_entre_campos = 18
int ii_cambia=0
string is_nomcab_borde
string is_cabeceras[]
string is_computados[]
string is_bitmap[]
string is_boton[] //PACHO
string is_dataobject = ""
string is_ventana = ""
string is_contenido_orig = ""
boolean ib_retasnedd=false
boolean ib_desplazar = False
boolean ib_moviendo_col = False
boolean ib_icono_desp = False
long il_scrollpos = 0
long il_scroll_max = 0
long il_desp_relativo = 0
long il_x_columna_mov = 0
long il_y_columna_mov = 0

boolean ib_permitido = true

// GNU 20-2-2006. Mejora
string is_sintaxis_new=""
string is_cabeceras_new[]
string is_computados_new[]
string is_bitmap_new[]
string is_boton_new[] //PACHO
// FIN GNU


end variables

forward prototypes
public function integer of_mover_col (long pl_desplazamiento)
public function long of_obtener_propiedad (string ps_propiedad)
public function integer of_agregar_linea ()
public function integer of_desplazar_columnas (long pl_x_pos)
public function integer of_cambiar_fondo_cabeceras (integer pi_fondo)
public function integer of_desplazamiento (string ps_campos[], long pl_ancho, long pl_x_acum, long pl_x_col_ultima, long pl_ancho_col_ultima, boolean pb_desp_derecha, long pl_x_pos)
public subroutine of_iniciar_campos (string ps_contenido)
public function string of_grabar_campos (string ps_campos[], boolean pb_crear_fichero, boolean pb_grabar)
public function integer settransobject (transaction t)
public subroutine of_obtener_campos (string ps_tipo_campo, ref string ps_campos[], string ls_syntax)
public function boolean of_buscar_campos (string ps_lista_1[], string ps_lista_2[])
end prototypes

event ue_mover_borde;//FDO - Evento que detecta el paso del cursor por encima//

string ls_cab, ls_nombre, ls_vacio[]
long val, desplaz, ll_anchura_ant, ll_x_ant

//IF ypos < 5 AND ib_moviendo_col THEN
//	// Si nos estamos saliendo de la dw simulamos que soltamos el bot$$HEX1$$f300$$ENDHEX$$n si  
//	// el usuario est$$HEX2$$e1002000$$ENDHEX$$moviendo un campo
//	This.Event ue_soltar_clicked(xpos,ypos,row,dwo)
//	return
//END IF

// Se comprueba si se ha producido alg$$HEX1$$fa00$$ENDHEX$$n cambio de dataobject. En caso de que haya cambiado
// se inicializan las cabeceras, los computados y los bitmap para volverlos a obtener
IF This.DataObject <> is_dataobject THEN
	is_dataobject = This.DataObject
	is_cabeceras = ls_vacio
	is_computados = ls_vacio
	is_bitmap = ls_vacio
	is_boton = ls_vacio
END IF

// GNU 20-2-2006. Mejora
//IF upperbound(is_cabeceras) = 0 THEN
//	// No se han obtenido todav$$HEX1$$ed00$$ENDHEX$$a las cabeceras. Se obtienen ahora junto con los computados
//	// y los bitmap
//	of_obtener_campos("text(" , is_cabeceras)
//	of_obtener_campos("compute(", is_computados)
//	of_obtener_campos("bitmap(", is_bitmap)
//	of_agregar_linea()
//END IF

IF upperbound(is_cabeceras) = 0 THEN
	// No se han obtenido todav$$HEX1$$ed00$$ENDHEX$$a las cabeceras. Se obtienen ahora junto con los computados
	// y los bitmap
	of_obtener_campos("text(" , is_cabeceras, This.Object.DataWindow.Syntax)
	of_obtener_campos("compute(", is_computados,This.Object.DataWindow.Syntax)
	of_obtener_campos("bitmap(", is_bitmap,This.Object.DataWindow.Syntax)
	of_obtener_campos("button(", is_boton,This.Object.DataWindow.Syntax)
	of_agregar_linea()
END IF
// FIN GNU

val = Pixelstounits(xpos, XPixelsTounits! ) + il_scrollpos

IF ib_moviendo_col THEN
	
	// Si estamos moviendo un campo, le movemos por la datawindow		
	ll_anchura_ant = Long(This.Describe(is_nomcab_borde + ".Width"))
	ll_x_ant = of_obtener_propiedad(is_nomcab_borde + ".X")
	desplaz = val - ll_x_ant - ll_anchura_ant/2
	
	ib_desplazar = FALSE
	This.Modify(is_nomcab_borde + ".X='" + string(ll_x_ant+desplaz) +"'")
END IF


if ib_desplazar then
	// Estamos cambiando de tama$$HEX1$$f100$$ENDHEX$$o un campo
	// Se calcula el desplzamiento relativo y se mueve la l$$HEX1$$ed00$$ENDHEX$$nea
	ll_anchura_ant = Long(This.Describe(is_nomcab_borde + ".Width"))
	ll_x_ant = of_obtener_propiedad(is_nomcab_borde + ".X")
	desplaz = val - ll_x_ant - ll_anchura_ant
	
	IF ll_anchura_ant + desplaz > 100 THEN
		il_desp_relativo = desplaz
		This.Modify("linea_desplazamiento.X1='" + string(ll_x_ant + ll_anchura_ant + desplaz) +"'")
		This.Modify("linea_desplazamiento.X2='" + string(ll_x_ant + ll_anchura_ant + desplaz) +"'")
		This.Modify("linea_desplazamiento.Y1='0'")
		This.Modify("linea_desplazamiento.Y2='1000'")
	END IF
	
	return
END IF

if dwo.name= "datawindow" then return 0

if isvalid(dwo) or not isnull(dwo) then
	ls_cab=string(dwo.band)
	ls_nombre = string(dwo.name)
	if isnull(ls_nombre) then ls_nombre = "nulo"
	
	if ls_cab = "header" THEN
		// El rat$$HEX1$$f300$$ENDHEX$$n se est$$HEX2$$e1002000$$ENDHEX$$desplazando por una cabecera. Se pone el icono de cambio de tama$$HEX1$$f100$$ENDHEX$$o
		// si el cursor se encuentra muy pr$$HEX1$$f300$$ENDHEX$$ximo al final de la cabecera.
		// En otro caso se pone como icono asociado al campo una mano
		IF of_obtener_propiedad(string(dwo.name) + ".X") + Long(dwo.width) - 15 <= val AND &
			val <= of_obtener_propiedad(string(dwo.name) + ".X") + Long(dwo.width) + 15 AND &
			This.Describe("DataWindow.Units") = '0' THEN
			
			dwo.pointer = "SizeWE!"
			// Indicamos al objeto que el usuario puede iniciar el cambio de tama$$HEX1$$f100$$ENDHEX$$o de un campo
			ib_icono_desp = True
		ELSE
			if dwo.pointer <> "mano.cur" then
				dwo.pointer = "mano.cur"
			end if
			ib_icono_desp = False
		END IF
	Else
		ib_icono_desp = FALSE
	end if
	
end if
end event

event ue_soltar_clicked;string ls_sint,ls_imagen = ""
Long ll_anchura_ant

ls_sint=is_nomcab_borde + ".Border='6'"
this.Modify(ls_sint)

IF ib_moviendo_col THEN
	// Si la columna se estaba moviendo se fija su nueva posici$$HEX1$$f300$$ENDHEX$$n y se desplazan todos
	// los campos afectados
	ib_moviendo_col = FALSE
	of_desplazar_columnas(Long(This.Describe(is_nomcab_borde + ".X")))
	// Se vuelven a poner opacas todas las cabeceras
	of_cambiar_fondo_cabeceras(ii_opaco)
	ib_desplazar = False
END IF

IF ib_desplazar THEN
	// Si la columna se estaba cambiando de tama$$HEX1$$f100$$ENDHEX$$o, se le cambia de tama$$HEX1$$f100$$ENDHEX$$o y se desplazan
	// todas las columnas afectadas
	This.setRedraw(False)
	ib_desplazar = False
	ll_anchura_ant = Long(This.Describe(is_nomcab_borde + ".Width"))
	ls_imagen = string(This.Describe(is_nomcab_borde + ".tag"))
	This.modify("linea_desplazamiento.visible='0'")
	if ls_imagen <> "bmp" then
		of_mover_col(il_desp_relativo)
	end if
	
	il_desp_relativo = 0
	This.setRedraw(True)
END IF

end event

event ue_as_need;boolean ib_compruebo
ib_compruebo=this.Object.DataWindow.Retrieve.AsNeeded= "Yes"
end event

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

event ue_obtener_syntax();// Evento que cambia la apariencia de la dw con la apariencia que tuvo en su $$HEX1$$fa00$$ENDHEX$$ltima 
// aparici$$HEX1$$f300$$ENDHEX$$n. No se puede ejecutar en el constructor porque no se tiene en ese momento
// la dw creada. 
// La informaci$$HEX1$$f300$$ENDHEX$$n con estas caracter$$HEX1$$ed00$$ENDHEX$$sticas se encuentra en un fichero llamado con
// el nombre de la ventana donde se encuentra la dw m$$HEX1$$e100$$ENDHEX$$s el nombre del dataobject
Long ll_tot 
integer  li_num_col
String ls_dataobject, ls_contenido="", ls_datos, ls_cols[]
powerobject  lpo_origen

This.setredraw(False)

// GNU 20-2-2006. Mejora
//IF upperbound(is_cabeceras[]) = 0 THEN
//	// No se han obtenido todav$$HEX1$$ed00$$ENDHEX$$a las cabeceras. Se obtienen ahora junto con los computados
//	// y los bitmap
//	of_obtener_campos("text(" , is_cabeceras)
//	of_obtener_campos("compute(", is_computados)
//	of_obtener_campos("bitmap(", is_bitmap)
//	of_agregar_linea()
//END IF

IF upperbound(is_cabeceras[]) = 0 THEN
	// No se han obtenido todav$$HEX1$$ed00$$ENDHEX$$a las cabeceras. Se obtienen ahora junto con los computados
	// y los bitmap
	of_obtener_campos("text(" , is_cabeceras_new,This.Object.DataWindow.Syntax)
	of_obtener_campos("compute(", is_computados_new, This.Object.DataWindow.Syntax)
	of_obtener_campos("bitmap(", is_bitmap_new, This.Object.DataWindow.Syntax)
	of_obtener_campos("button(", is_boton_new, This.Object.DataWindow.Syntax)
	of_agregar_linea()
END IF
// FIN GNU

// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los campos de cabecera
is_contenido_orig = of_grabar_campos(is_cabeceras, False, False)
// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los campos computados
is_contenido_orig = is_contenido_orig + of_grabar_campos(is_computados, False, False)
// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los campos bitmap
is_contenido_orig = is_contenido_orig + of_grabar_campos(is_bitmap, False, False)
// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los botones
is_contenido_orig = is_contenido_orig + of_grabar_campos(is_boton, False, False)

// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de las columnas
ll_tot = Long(This.Describe("DataWindow.Column.Count"))
FOR li_num_col = 1 TO ll_tot
	ls_cols[li_num_col] = "#" + string(li_num_col)
NEXT
is_contenido_orig = is_contenido_orig + of_grabar_campos(ls_cols, False, False)

// Se obtiene en primer lugar la ventana contenedora para componer el nmbre del fichero
lpo_origen = this

do while (lpo_origen.typeOf() <>Window! )
	lpo_origen = lpo_origen.Getparent()
	if not isvalid(lpo_origen) then exit
loop
	
// Se captura el nombre de la ventana
if isvalid(lpo_origen) then
	if lpo_origen.typeOf()= Window! then 
		is_ventana = string(lpo_origen.classname())
	end if
end if

// Se obtiene el nombre del dataobject
ls_Dataobject = This.Dataobject

This.Object.DataWindow.Syntax.Modified='no'

This.Setredraw(TRUE)

end event

public function integer of_mover_col (long pl_desplazamiento);// Funci$$HEX1$$f300$$ENDHEX$$n que se encarga de desplazar todos los campos que se ven afectados por el
// cambio de tama$$HEX1$$f100$$ENDHEX$$o de uno de ellos. 
// Los campos afectados ser$$HEX1$$e100$$ENDHEX$$n aquellos que se encuentren a la derecha del campo que se le
// ha cambiado el tama$$HEX1$$f100$$ENDHEX$$o
Boolean lb_mov_permitido = TRUE
int li_num_col 
string ls_nom_col, ls_cols[], ls_contenido = "",ls_imagen
long ll_x_ant, ll_coord_x, ll_ancho_ant, ll_ancho, ll_tot

// Se obtiene la especificaci$$HEX1$$f300$$ENDHEX$$n de todos los campos sobre la variable ls_contenido.
// Esto se hace por si el cambio de tama$$HEX1$$f100$$ENDHEX$$o no se puede efectuar, por lo que los campos
// que han cambiado de posici$$HEX1$$f300$$ENDHEX$$n deber$$HEX1$$e100$$ENDHEX$$n retomar su posici$$HEX1$$f300$$ENDHEX$$n original, que se encontrar$$HEX1$$e100$$ENDHEX$$
// en ls_contenido

// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los campos de cabecera
ls_contenido = of_grabar_campos(is_cabeceras, False, False)
// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los campos computados
ls_contenido = ls_contenido + of_grabar_campos(is_computados, False, False)
// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los campos bitmap
ls_contenido = ls_contenido + of_grabar_campos(is_bitmap, False, False)
// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de los botones
ls_contenido = ls_contenido + of_grabar_campos(is_boton, False, False)

// Se obtienen las caracter$$HEX1$$ed00$$ENDHEX$$sticas de las columnas
ll_tot = Long(This.Describe("DataWindow.Column.Count"))
FOR li_num_col = 1 TO ll_tot
	ls_cols[li_num_col] = "#" + string(li_num_col)
NEXT
ls_contenido = ls_contenido + of_grabar_campos(ls_cols, False, False)

//IF This.Describe("DataWindow.Units") <> '0' THEN
//	pl_desplazamiento = Pixelstounits(pl_desplazamiento, XPixelsTounits! ) 
//END IF

//This.Object.DataWindow.Syntax.Modified='Yes'

// Coordenada X de la columna que se quiere redimensionar
ll_coord_x = of_obtener_propiedad(is_nomcab_borde + ".X")
// Ancho de la columna que se quiere redimensionar
ll_ancho = Long(This.Describe(is_nomcab_borde + ".Width"))

// Se desplazan las cabeceras afectadas
FOR li_num_col = 1 TO upperbound(is_cabeceras[])
	ls_nom_col = is_cabeceras[li_num_col]
	ll_x_ant = of_obtener_propiedad(ls_nom_col + ".X")
	ll_ancho_ant = Long(This.Describe(ls_nom_col + ".Width"))
	// Se comprueba si la cabecera se encuentra a la derecha de la columna que se quiere desplazar
	IF ll_x_ant + ll_ancho_ant > ll_coord_x + ll_ancho THEN
		// La cabecera se encuentra a la derecha. Se desplaza hacia la derecha tanta 
		// distancia como sea el desplazamiento de la columna que cambia de tama$$HEX1$$f100$$ENDHEX$$o
		This.Modify(ls_nom_col + ".X='" + string(ll_x_ant + pl_desplazamiento) + "'")
	END IF
		
	IF ll_x_ant >= ll_coord_x AND ll_x_ant + ll_ancho_ant <= ll_coord_x + ll_ancho THEN 
		// Se trata de la columna que se desea cambiar de tama$$HEX1$$f100$$ENDHEX$$o
		ls_imagen = This.Describe(ls_nom_col + ".BitmapName")
		if ls_imagen <> "!" then
			of_iniciar_campos(ls_contenido)
			return 1
		end if

		This.Modify(ls_nom_col + ".Width='" + string(ll_ancho_ant + pl_desplazamiento) + "'")
	END IF
	
NEXT

ll_tot = Long(This.Describe("DataWindow.Column.Count"))
li_num_col = 1

// Se desplazan las columnas afectadas
DO WHILE li_num_col <= ll_tot AND lb_mov_permitido
	ls_nom_col = "#" + string(li_num_col)
	ll_x_ant = of_obtener_propiedad(ls_nom_col + ".X")
	ll_ancho_ant = Long(This.Describe(ls_nom_col + ".Width")) 

	// Se comprueba si la columna se encuentra a la derecha de la columna que se quiere desplazar
	IF ll_x_ant + ll_ancho_ant/2 > ll_coord_x + ll_ancho THEN
		// La columna se encuentra a la derecha. Se desplaza hacia la derecha tanta 
		// distancia como sea el desplazamiento de la columna que cambia de tama$$HEX1$$f100$$ENDHEX$$o
		This.Modify(ls_nom_col + ".X='" + string(ll_x_ant + pl_desplazamiento) + "'")
	END IF
	
	// Se comprueba si el campo se encuentra debajo de la columna que cambia de tama$$HEX1$$f100$$ENDHEX$$o
	IF ll_x_ant + ll_ancho_ant/2 >= ll_coord_x AND ll_x_ant + ll_ancho_ant/2 <= ll_coord_x + ll_ancho THEN 
		// El campo se encuentra debajo, por lo que cambia su ancho en la misma proporci$$HEX1$$f300$$ENDHEX$$n que
		// su cabecera
		IF ll_ancho_ant + pl_desplazamiento < 0 THEN 
			// Si el desplazamiento es negativo (hacia la izquierda) y este es superior a la
			// anchura del campo, no permitimos el desplazamiento de ning$$HEX1$$fa00$$ENDHEX$$n campo, ya que 
			// quedar$$HEX1$$ed00$$ENDHEX$$an campos con anchura negativa, que se comportan de manera no deseada
			lb_mov_permitido = False
		ELSE
			// El cambio del ancho es positivo
			This.Modify(ls_nom_col + ".Width='" + string(ll_ancho_ant + pl_desplazamiento) + "'")
		END IF
	END IF	
	
	li_num_col ++
LOOP

li_num_col = 1
// Se desplazan los campos computados afectados
DO WHILE li_num_col <= upperbound(is_computados[]) AND lb_mov_permitido
	ls_nom_col = is_computados[li_num_col]
	ll_x_ant = of_obtener_propiedad(ls_nom_col + ".X")
	ll_ancho_ant = Long(This.Describe(ls_nom_col + ".Width"))
	// Se comprueba si el campo se encuentra a la derecha de la columna que se quiere desplazar
	IF ll_x_ant + ll_ancho_ant/2 > ll_coord_x + ll_ancho THEN
		// El campo se encuentra a la derecha. Se desplaza hacia la derecha tanta 
		// distancia como sea el desplazamiento de la columna que cambia de tama$$HEX1$$f100$$ENDHEX$$o
		This.Modify(ls_nom_col + ".X='" + string(ll_x_ant + pl_desplazamiento) + "'")
	END IF
	
	// Se comprueba si el campo se encuentra debajo de la columna que cambia de tama$$HEX1$$f100$$ENDHEX$$o
	IF ll_x_ant + ll_ancho_ant/2 >= ll_coord_x AND ll_x_ant + ll_ancho_ant/2 <= ll_coord_x + ll_ancho THEN 
		// El campo se encuentra debajo, por lo que cambia su ancho en la misma proporci$$HEX1$$f300$$ENDHEX$$n que
		// su cabecera
		IF ll_ancho_ant + pl_desplazamiento < 0 THEN 
			// Si el desplazamiento es negativo (hacia la izquierda) y este es superior a la
			// anchura del campo, no permitimos el desplazamiento de ning$$HEX1$$fa00$$ENDHEX$$n campo, ya que 
			// quedar$$HEX1$$ed00$$ENDHEX$$an campos con anchura negativa, que se comportan de manera no deseada
			lb_mov_permitido = False
		ELSE
			This.Modify(ls_nom_col + ".Width='" + string(ll_ancho_ant + pl_desplazamiento) + "'")
		END IF
	END IF		
	
	li_num_col ++
	
LOOP

li_num_col = 1
// Se desplazan los bitmap computados afectados
DO WHILE li_num_col <= upperbound(is_bitmap[]) AND lb_mov_permitido
	ls_nom_col = is_bitmap[li_num_col]
	ll_x_ant = of_obtener_propiedad(ls_nom_col + ".X")
	ll_ancho_ant = Long(This.Describe(ls_nom_col + ".Width"))

	// Se comprueba si el campo se encuentra a la derecha de la columna que se quiere desplazar
	IF ll_x_ant + ll_ancho_ant/2 > ll_coord_x + ll_ancho THEN
		// El campo se encuentra a la derecha. Se desplaza hacia la derecha tanta 
		// distancia como sea el desplazamiento de la columna que cambia de tama$$HEX1$$f100$$ENDHEX$$o
		This.Modify(ls_nom_col + ".X='" + string(ll_x_ant + pl_desplazamiento) + "'")
	END IF
	
	IF ll_x_ant + ll_ancho_ant/2 >= ll_coord_x AND ll_x_ant + ll_ancho_ant/2 <= ll_coord_x + ll_ancho THEN 
		// El campo se encuentra debajo, por lo que cambia su ancho en la misma proporci$$HEX1$$f300$$ENDHEX$$n que
		// su cabecera
		IF ll_ancho_ant + pl_desplazamiento < 0 THEN 
			// Si el desplazamiento es negativo (hacia la izquierda) y este es superior a la
			// anchura del campo, no permitimos el desplazamiento de ning$$HEX1$$fa00$$ENDHEX$$n campo, ya que 
			// quedar$$HEX1$$ed00$$ENDHEX$$an campos con anchura negativa, que se comportan de manera no deseada
			lb_mov_permitido = False
		ELSE
			This.Modify(ls_nom_col + ".Width='" + string(ll_ancho_ant + pl_desplazamiento) + "'")
		END IF
	END IF
	
	li_num_col ++
	
LOOP		

IF lb_mov_permitido THEN
//	This.Modify(is_nomcab_borde + ".Width='" + string(ll_ancho + pl_desplazamiento) + "'")
	il_scroll_max += pl_desplazamiento
ELSE
	// Si el desplazamiento del campo no ha sido correcto, se deja la dw como estaba
	of_iniciar_campos(ls_contenido)
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede reducir a ese nivel el tama$$HEX1$$f100$$ENDHEX$$o del campo debido a que se quedar$$HEX1$$ed00$$ENDHEX$$an datos ocultos")
END IF

return 1

end function

public function long of_obtener_propiedad (string ps_propiedad);long ll_pos, ll_retorno = 0
string ls_contenido

ls_contenido = this.Describe(ps_propiedad)
ll_pos = Pos(ls_contenido, "~t")

IF NOT IsNull(ll_pos) THEN 
	IF ll_pos > 0 THEN
		ll_retorno = Long(Mid(ls_contenido, 2, ll_pos - 2))
		ls_contenido = Mid(ls_contenido, 2, ll_pos - 2)
	ELSE
		ll_retorno = Long(ls_contenido)
	END IF
END IF

return ll_retorno


end function

public function integer of_agregar_linea ();String ls_linea = "create line(band=detail name=linea_desplazamiento x1='-10' y1='0' x2='-10' y2='0'  pen.style='2' pen.width='5' pen.color='0'  background.mode='1' background.color='553648127' )"
string ls_patron_busqueda = "name=linea_desplazamiento"

//AHM (18/04/2010) IM117737
IF gi_pais = 6 THEN	//Estamos en EPSA
	sleep(0.2)
END IF

// Si la dw no tiene l$$HEX1$$ed00$$ENDHEX$$nea, se a$$HEX1$$f100$$ENDHEX$$ade una l$$HEX1$$ed00$$ENDHEX$$nea que ser$$HEX2$$e1002000$$ENDHEX$$la que se visualice a la hora
// de cambiar el tama$$HEX1$$f100$$ENDHEX$$o de un campo
IF Pos(this.Object.DataWindow.Syntax, ls_patron_busqueda) = 0 THEN
	il_scroll_max = Long(This.Object.DataWindow.HorizontalScrollMaximum)
	This.Modify(ls_linea)
END IF

return 1
end function

public function integer of_desplazar_columnas (long pl_x_pos);int li_num_col 
string ls_nom_col, ls_col_ultima, ls_campos[]
Long ll_x_acum = 0
long ll_x_ant, ll_ancho_ant, ll_ancho, ll_tot
Long ll_x_col_ultima=0, ll_ancho_col_ultima
Boolean lb_desp_derecha

This.Setredraw(False)

//This.Object.DataWindow.Syntax.Modified='Yes'

// Se obtiene el ancho de la columna que se ha cambiado de posici$$HEX1$$f300$$ENDHEX$$n
ll_ancho = Long(This.Describe(is_nomcab_borde + ".Width"))

// Se comprueba si la cebecera ha sobrepasado al menos un campo
IF NOT (pl_x_pos > il_x_columna_mov + ll_ancho OR &
		  il_x_columna_mov > pl_x_pos + ll_ancho ) THEN
	// La cabecera no ha sobrepasado de manera completa un campo, por lo que no se mueve
	This.Modify(is_nomcab_borde + ".X='" + string(il_x_columna_mov) +"'") 
ELSE
	// La cabecera ha sobrepasado al menos un campo. Se comprueba si el desplazamiento se 
	// realiza hacia la derecha o hacia la izquierda. Es necesario para realizar de manera
	// correcta los desplazamientos del resto de los campos afectados.
	IF pl_x_pos > il_x_columna_mov + ll_ancho THEN
		lb_desp_derecha = TRUE
	ELSE
		lb_desp_derecha = FALSE
	END IF
	
	// Esta variable almacenar$$HEX2$$e1002000$$ENDHEX$$el desplazamiento total que tiene que realizar la columna que 
	// se ha movido. Se inicializa con la coordenada X original de esta columna
	ll_x_acum = il_x_columna_mov //+ 20 
 	ll_x_col_ultima = il_x_columna_mov //GNU 6-7-2005
	
	// Se desplazan todas las cabeceras afectadas
	FOR li_num_col = 1 TO upperbound(is_cabeceras[])
		// Se obtiene el nombre de cada columna, as$$HEX2$$ed002000$$ENDHEX$$como la coordenada X y el ancho
		ls_nom_col = is_cabeceras[li_num_col]
		ll_x_ant = of_obtener_propiedad(ls_nom_col + ".X")
		ll_ancho_ant = Long(This.Describe(ls_nom_col + ".Width"))
		
		// Aqu$$HEX2$$ed002000$$ENDHEX$$se comprueba cu$$HEX1$$e100$$ENDHEX$$l es la columna sobre la que se suelta la columna desplazada.
		// Se va comprobando una a una hasta encontrar la columna en cuesti$$HEX1$$f300$$ENDHEX$$n.
		// Es necesario saberlo para poder mover todos los campos de esta columna.
		IF lb_desp_derecha THEN
			// Si el desplazamiento es hacia la derecha, la columna sobre la que se suelta la 
			// desplazada tiene que cumplir que su coordenada X sea menor que la coordenada X de 
			// la columna en movimiento, y esta coordenada X tiene que ser la mayor que cumpla 
			// la condici$$HEX1$$f300$$ENDHEX$$n descrita.
			IF pl_x_pos > ll_x_ant AND ll_x_ant > ll_x_col_ultima AND &
				ls_nom_col <> is_nomcab_borde THEN
				
				ls_col_ultima = ls_nom_col
				ll_x_col_ultima = ll_x_ant
				ll_ancho_col_ultima = ll_ancho_ant
			END IF
		ELSE
			// Si el desplazamiento es hacia la izquierda, la columna sobre la que se suelta la
			// desplazada tiene que cumplir que su coordenada X sea menor que la posici$$HEX1$$f300$$ENDHEX$$n final
			// de la columna en movimiento (coordenada X + ancho), y esta coordenada X tiene
			// que ser la mayor que cumpla esta condici$$HEX1$$f300$$ENDHEX$$n.   //GNU 30-06-2005 Modificado condiciones
			IF ll_x_ant + ll_ancho_ant > pl_x_pos + ll_ancho AND ll_x_ant < ll_x_col_ultima AND & 
				ls_nom_col <> is_nomcab_borde THEN
				
				ls_col_ultima = ls_nom_col
				ll_x_col_ultima = ll_x_ant
				ll_ancho_col_ultima = ll_ancho_ant
			END IF			
		END IF
		
		// A partir de aqu$$HEX2$$ed002000$$ENDHEX$$se comprueba si la columna obtenida tiene que ser desplazada
		// Si el desplazamiento es hacia la derecha, la columna se tiene que mover en el caso 
		// de que se encuentre entre la posici$$HEX1$$f300$$ENDHEX$$n anterior de la columna movida y su posici$$HEX1$$f300$$ENDHEX$$n
		// actual. El desplazamiento de esta columna ser$$HEX2$$e1002000$$ENDHEX$$hacia la izquierda, y se 
		// desplazar$$HEX2$$e1002000$$ENDHEX$$el ancho de la columna movida m$$HEX1$$e100$$ENDHEX$$s un factor que permite mantener la
		// distancia entre columnas consecutivas (tienen apariencia 3D, por lo que no est$$HEX1$$e100$$ENDHEX$$n
		// completamente pegadas)
		IF lb_desp_derecha AND ll_x_ant > il_x_columna_mov AND pl_x_pos > ll_x_ant AND &
			of_obtener_propiedad(ls_nom_col + ".Visible") = 1 AND &
			il_y_columna_mov + 10 > of_obtener_propiedad(ls_nom_col + ".Y") THEN
			
			This.Modify(ls_nom_col + ".X='" + string(ll_x_ant - ll_ancho - ii_sep_entre_campos )  + "'")
			
			// Se incrementa el desplazamiento total que va a tener la columna movida
			ll_x_acum += ll_ancho_ant + ii_sep_entre_campos 
	
		// Si el desplazamiento es hacia la izquierda, la columna se tiene que mover en el caso
		// de que se encuentre entre la pocici$$HEX1$$f300$$ENDHEX$$n nueva de la columna movida y su posici$$HEX1$$f300$$ENDHEX$$n 
		// original. El desplazamiento ser$$HEX2$$e1002000$$ENDHEX$$hacia la derecha, y se desplazar$$HEX2$$e1002000$$ENDHEX$$el ancho de la
		// columna movida m$$HEX1$$e100$$ENDHEX$$s un factor
		ELSEIF lb_desp_derecha = FALSE AND &
				 ll_x_ant + ll_ancho_ant > pl_x_pos + ll_ancho  AND ll_x_ant < il_x_columna_mov AND &
				 of_obtener_propiedad(ls_nom_col + ".Visible") = 1 AND &
				 il_y_columna_mov + 10 > of_obtener_propiedad(ls_nom_col + ".Y") THEN
				
			This.Modify(ls_nom_col + ".X='" + string(ll_x_ant + ll_ancho + ii_sep_entre_campos )  + "'")
			
			// Se decrementa el desplazamiento total que va a tener la columna movida
			ll_x_acum -= (ll_ancho_ant + ii_sep_entre_campos )
					
		END IF
		
	NEXT
	
	// Se fija la posici$$HEX1$$f300$$ENDHEX$$n de la columna movida
	This.Modify(is_nomcab_borde + ".X='" + string(ll_x_acum) + "'")
	
	// Se desplazan ahora los campos del detalle
	ll_tot = Long(This.Describe("DataWindow.Column.Count"))
	FOR li_num_col = 1 TO ll_tot
		ls_campos[li_num_col] = "#" + string(li_num_col)
	NEXT
	of_desplazamiento(ls_campos, ll_ancho, ll_x_acum, ll_x_col_ultima, ll_ancho_col_ultima, &
							lb_desp_derecha, pl_x_pos)
	
	// Se desplazan los campos computados
	of_desplazamiento(is_computados, ll_ancho, ll_x_acum, ll_x_col_ultima, ll_ancho_col_ultima, &
							lb_desp_derecha, pl_x_pos)
							
	// Se deplazan los campos bitmap
	of_desplazamiento(is_bitmap, ll_ancho, ll_x_acum, ll_x_col_ultima, ll_ancho_col_ultima, &
							lb_desp_derecha, pl_x_pos)

	// Se deplazan los campos boton
	of_desplazamiento(is_boton, ll_ancho, ll_x_acum, ll_x_col_ultima, ll_ancho_col_ultima, &
							lb_desp_derecha, pl_x_pos)
							
							
	il_x_columna_mov = 0	
END IF

This.Setredraw(True)

return 1

end function

public function integer of_cambiar_fondo_cabeceras (integer pi_fondo);int li_contador

// Se les cambia el fondo a todas las cabeceras
FOR li_contador=1 TO UpperBound(is_cabeceras)
	This.Modify(is_cabeceras[li_contador] + ".Background.Mode='" + string(pi_fondo) +"'")
NEXT

return 1

end function

public function integer of_desplazamiento (string ps_campos[], long pl_ancho, long pl_x_acum, long pl_x_col_ultima, long pl_ancho_col_ultima, boolean pb_desp_derecha, long pl_x_pos);int li_num_col
string ls_nom_col
long ll_x_ant, ll_ancho_ant


FOR li_num_col = 1 TO upperbound(ps_campos[])
	ls_nom_col = ps_campos[li_num_col]
	ll_x_ant = of_obtener_propiedad(ls_nom_col + ".X")
	ll_ancho_ant = Long(This.Describe(ls_nom_col + ".Width"))
		
	// Se comprueba si el campo en cuesti$$HEX1$$f300$$ENDHEX$$n se encuentra debajo de la cabecera desplazada.
	// En caso de ser as$$HEX2$$ed002000$$ENDHEX$$se desplazar$$HEX2$$e1002000$$ENDHEX$$en la misma proporci$$HEX1$$f300$$ENDHEX$$n que la cabecera movida.
	IF ll_x_ant + ll_ancho_ant/2  >= il_x_columna_mov AND ll_x_ant + ll_ancho_ant/ 2 <= il_x_columna_mov + pl_ancho THEN
		This.Modify(ls_nom_col + ".X='" + string(ll_x_ant - il_x_columna_mov + pl_x_acum) + "'")
	ELSE
		// El campo no est$$HEX2$$e1002000$$ENDHEX$$debajo. Se comprueba entonces si el campo pertenece a la 
		// columna sobre la que se ha soltado la columna desplazada.
		// En este caso el campo se desplaza, bien a la derecha, bien a la izquierda.
		IF	ll_x_ant + ll_ancho_ant/2 >= pl_x_col_ultima AND ll_x_ant + ll_ancho_ant/2 <= pl_x_col_ultima + pl_ancho_col_ultima THEN
			IF pb_desp_derecha THEN
				This.Modify(ls_nom_col + ".X='" + string(ll_x_ant - pl_ancho - ii_sep_entre_campos )  + "'")
			ELSE
				This.Modify(ls_nom_col + ".X='" + string(ll_x_ant + pl_ancho + ii_sep_entre_campos )  + "'")
			END IF
		ELSE
			// Si el desplazamiento es hacia la derecha, el campo se tiene que mover en el caso 
			// de que se encuentre entre la posici$$HEX1$$f300$$ENDHEX$$n anterior de la columna movida y su posici$$HEX1$$f300$$ENDHEX$$n
			// actual. El desplazamiento de este campo ser$$HEX2$$e1002000$$ENDHEX$$hacia la izquierda, y se 
			// desplazar$$HEX2$$e1002000$$ENDHEX$$el ancho de la columna movida m$$HEX1$$e100$$ENDHEX$$s un factor
			IF pb_desp_derecha AND ll_x_ant > il_x_columna_mov AND pl_x_pos > ll_x_ant AND &
				of_obtener_propiedad(ls_nom_col + ".Visible") = 1 AND &
				il_y_columna_mov + 10 > of_obtener_propiedad(ls_nom_col + ".Y") THEN
				
				This.Modify(ls_nom_col + ".X='" + string(ll_x_ant - pl_ancho - ii_sep_entre_campos )  + "'")
			
			// Si el desplazamiento es hacia la izquierda, el campo se tiene que mover en el caso
			// de que se encuentre entre la pocici$$HEX1$$f300$$ENDHEX$$n nueva de la columna movida y su posici$$HEX1$$f300$$ENDHEX$$n 
			// original. El desplazamiento ser$$HEX2$$e1002000$$ENDHEX$$hacia la derecha, y se desplazar$$HEX2$$e1002000$$ENDHEX$$el ancho de la
			// columna movida m$$HEX1$$e100$$ENDHEX$$s un factor
			ELSEIF pb_desp_derecha = FALSE AND &
					 ll_x_ant + ll_ancho_ant > pl_x_pos + pl_ancho AND ll_x_ant < il_x_columna_mov AND &
					 of_obtener_propiedad(ls_nom_col + ".Visible") = 1 AND &
					 il_y_columna_mov + 10 > of_obtener_propiedad(ls_nom_col + ".Y") THEN
					
				This.Modify(ls_nom_col + ".X='" + string(ll_x_ant + pl_ancho + ii_sep_entre_campos )  + "'")
								
			END IF
		END IF
	END IF
NEXT

return 1
end function

public subroutine of_iniciar_campos (string ps_contenido);
string ls_nombre 
long ll_start_pos = 1, ll_pos_final, ll_coord_x, ll_ancho

// Esta funci$$HEX1$$f300$$ENDHEX$$n cambia la posici$$HEX1$$f300$$ENDHEX$$n y el tama$$HEX1$$f100$$ENDHEX$$o de los campos conforme al contenido de la
// variable ps_contenido, en la que viene la nueva posici$$HEX1$$f300$$ENDHEX$$n y el tama$$HEX1$$f100$$ENDHEX$$o de todos
// los campos

// Se obtiene la primera aparici$$HEX1$$f300$$ENDHEX$$n de una campo
ll_start_pos = Pos(ps_contenido, "nombre=", ll_start_pos)

DO WHILE ll_start_pos > 0
	ll_pos_final = Pos(ps_contenido, " ", ll_start_pos)
	IF ll_pos_final > 0 THEN
		// Se obtiene el nombre
		ls_nombre = Mid(ps_contenido, ll_start_pos+7, ll_pos_final - ll_start_pos - 7)
	
		// Se busca la coordenada X
		ll_start_pos = Pos(ps_contenido, "x=", ll_start_pos)
		IF ll_start_pos > 0 THEN
			ll_pos_final = Pos(ps_contenido, " ", ll_start_pos)
			IF ll_pos_final > 0 THEN
				// Se obtiene la coordenada X
				ll_coord_x = Long(Mid(ps_contenido, ll_start_pos+2, ll_pos_final - ll_start_pos - 2))

				// Se busca el ancho del campo
				ll_start_pos = Pos(ps_contenido, "width=", ll_start_pos)
				IF ll_start_pos > 0 THEN
					ll_pos_final = Pos(ps_contenido, "~r~n", ll_start_pos)
					IF ll_pos_final > 0 THEN
						// Se obtiene el ancho del campo
						ll_ancho = Long(Mid(ps_contenido, ll_start_pos+6, ll_pos_final - ll_start_pos - 6))
						
						// Se modifica el campo con las nuevas caracter$$HEX1$$ed00$$ENDHEX$$sticas
						This.Modify(ls_nombre+".X='" + string(ll_coord_x) +"'")
						This.Modify(ls_nombre+".Width='" + string(ll_ancho) +"'")
					END IF
				END IF
			END IF
		END IF	
								
		ll_start_pos = ll_pos_final
		// Se busca la aparici$$HEX1$$f300$$ENDHEX$$n del siguiente campo
		ll_start_pos = Pos(ps_contenido, "nombre=", ll_start_pos)
	END IF

LOOP


end subroutine

public function string of_grabar_campos (string ps_campos[], boolean pb_crear_fichero, boolean pb_grabar);int li_num_col
string ls_contenido="", ls_dataobject

// Funci$$HEX1$$f300$$ENDHEX$$n que devuelve un listado con la coordenada X y el ancho de todos los campos  
// especificados en la variable ps_campos[]. 
// Si la variable pb_grabar es TRUE, se almacenar$$HEX2$$e1002000$$ENDHEX$$esta informaci$$HEX1$$f300$$ENDHEX$$n en un fichero.
IF upperbound(ps_campos) > 0 THEN
	FOR li_num_col = 1 TO upperbound(ps_campos[])
		IF li_num_col > 1 THEN
			ls_contenido = ls_contenido + "~r~n"
		END IF
		ls_contenido = ls_contenido + "nombre=" + ps_campos[li_num_col] + &  
							" x=" + this.describe(ps_campos[li_num_col] + ".X") + &
							" width=" + this.describe(ps_campos[li_num_col] + ".width")  
	NEXT
	IF pb_grabar = FALSE THEN
		// Si el fichero no se graba a disco, hay que a$$HEX1$$f100$$ENDHEX$$adir los caracteres "~r~n" al final 
		// por si se quiere continuar a$$HEX1$$f100$$ENDHEX$$adiendo informaci$$HEX1$$f300$$ENDHEX$$n
		ls_contenido = ls_contenido + "~r~n"
	END IF
	
END IF	

return ls_contenido  

end function

public function integer settransobject (transaction t);//Carga la sintaxis de la datawindow si la encuentra.

string ls_sintaxis,ls_dataobject,ls_select

// GNU 20-2-2006. Mejora
boolean lb_encontrado
lb_encontrado= true
// FIN GNU

ls_dataobject = this.dataobject

if ls_dataobject <> 'd_bri_2017_pr_datos_cons_ot' and &
   ls_dataobject <> 'd_bri_2002_pr_list_brigadas_ot' and &
   ls_dataobject <> 'd_bri_2017_pr_datos_orden_tarea_2' and &
   ls_dataobject <> 'd_bri_2002_pr_list_brigadas_ot' then 
	ib_permitido = true
else
	ib_permitido = false
end if

if ib_permitido = true then
	
	// Excluimos la lista de brigadas por q da problemas al cargarla si la antigua tiene protecciones o grises.
	
	select sintaxis 
	into :ls_sintaxis
	from gi_sintaxis_usuario
	where usuario = :gs_usuario and datawindow = :ls_dataobject;

	//GNU borrar dw. Compruebo los campos antes de cambiar la dw
	
	IF upperbound(is_cabeceras[]) = 0 THEN
	// No se han obtenido todav$$HEX1$$ed00$$ENDHEX$$a las cabeceras. Se obtienen ahora junto con los computados
	// y los bitmap
	of_obtener_campos("text(" , is_cabeceras_new,This.Object.DataWindow.Syntax)
	of_obtener_campos("compute(", is_computados_new, This.Object.DataWindow.Syntax)
	of_obtener_campos("bitmap(", is_bitmap_new, This.Object.DataWindow.Syntax)
	of_obtener_campos("button(", is_boton_new, This.Object.DataWindow.Syntax)
	of_obtener_campos("text(" , is_cabeceras, ls_sintaxis)
	of_obtener_campos("compute(", is_computados, ls_sintaxis)	
	of_obtener_campos("bitmap(", is_bitmap,  ls_sintaxis) // GNU 7-4-2006.Incidencia 0/420753
	of_obtener_campos("button(", is_boton, ls_sintaxis)
END IF

	lb_encontrado = of_buscar_campos (is_cabeceras_new,is_cabeceras)  and &
					of_buscar_campos (is_computados_new,is_computados) and &
					of_buscar_campos (is_bitmap_new,is_bitmap) and &
					of_buscar_campos (is_boton_new,is_boton)

	if not lb_encontrado then
		is_cabeceras= is_cabeceras_new
		is_computados= is_computados_new
		is_bitmap= is_bitmap_new
		is_boton = is_boton_new
	elseif sqlca.sqlcode = 0 and ls_sintaxis <> "" then // FIN GNU
		Of_Agregar_Linea ()
		ls_select = this.object.datawindow.table.Select
		this.Create(ls_sintaxis)
		this.object.datawindow.table.Select = ls_select
	end if

	//messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La datawindow ha sido cargada " + this.dataobject)
	
	il_scroll_max = Long(This.Object.DataWindow.HorizontalScrollMaximum)
	il_scrollpos = 0
	
	This.SetRedraw(False)
	This.PostEvent("ue_obtener_syntax")
	THIS.SETFILTER('')
end if


super::settransobject(t)


return 1
end function

public subroutine of_obtener_campos (string ps_tipo_campo, ref string ps_campos[], string ls_syntax);string ls_nombre 
long ll_start_pos = 1, ll_pos_final
int li_contador = 1

// GNU 20-2-2006. Mejora
//ls_syntax = this.Object.DataWindow.Syntax
// FIN GNU

ls_nombre = "name="

// Se obtiene la primera aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
ll_start_pos = Pos(ls_syntax, ps_tipo_campo, ll_start_pos)

DO WHILE ll_start_pos > 0
	// Si se est$$HEX2$$e1002000$$ENDHEX$$buscando un bitmap, con este IF se previene la aparici$$HEX1$$f300$$ENDHEX$$n de la palabra
	// bitmap en las expresiones de campos computados, ya que considerar$$HEX1$$ed00$$ENDHEX$$a el computado
	// como un bitmap
	IF	ll_start_pos > 2 AND ( ps_tipo_campo="bitmap(" OR ps_tipo_campo="button(" ) AND &
		Asc(Mid(ls_syntax, ll_start_pos - 2, 1)) <> 13 THEN

		ll_start_pos = Pos(ls_syntax, ps_tipo_campo, ll_start_pos + 1)
	ELSE
		ll_start_pos = Pos(ls_syntax, ls_nombre, ll_start_pos)
		IF ll_start_pos > 0 THEN
			ll_pos_final = Pos(ls_syntax, " ", ll_start_pos)
			ps_campos[li_contador] = Mid(ls_syntax, ll_start_pos+Len(ls_nombre), ll_pos_final - ll_start_pos - Len(ls_nombre))
			ll_start_pos = ll_pos_final
			li_contador ++
	
			// Se busca la siguiente aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
			ll_start_pos = Pos(ls_syntax, ps_tipo_campo, ll_start_pos)
		END IF
	END IF

LOOP

return
end subroutine

public function boolean of_buscar_campos (string ps_lista_1[], string ps_lista_2[]);long indice_1, indice_2, max_1, max_2
boolean encontrado

indice_1= 1
indice_2= 1

max_1= Upperbound (ps_lista_1)
max_2= Upperbound (ps_lista_2)

encontrado= true

DO WHILE encontrado and (indice_1 <= max_1)
	encontrado= false
	DO WHILE indice_2 <= max_2
		if  ps_lista_1[indice_1]  <>  ps_lista_2 [indice_2] then
			indice_2 ++
		else
			encontrado= true
			indice_2= max_2 + 1
		end if
	LOOP
	if not encontrado then
		indice_1= max_1 + 1
	else
		indice_1 ++
		indice_2= 1
	end if
LOOP

return encontrado

end function

event clicked;string ls_nomcab
string ls_nomcol
string ls_tipo= " A"
string ls_sint
string ls_cab

if dwo.name = "datawindow" then return 0
// GNU 6-2-2006. Incidencia pruebas integradas Nicaragua
if  this.dataobject='d_7001_lista_descargos' then
// GNU 11-1-2006. Incidencia 0/398800
	This.selectrow(0,FALSE)
// FIN GNU
end if
// FIN GNU

ii_cambia = 1
	
	// Si el click se efect$$HEX1$$fa00$$ENDHEX$$a en el extremo derecho de una de las cabeceras, se inicia la
	// secuencia de cambio de tama$$HEX1$$f100$$ENDHEX$$o.
	if isvalid(dwo) or not isnull(dwo) then
		
		if ib_permitido = true then
			
			if ib_desplazar = FALSE AND ib_icono_desp THEN 
		
				ib_desplazar = TRUE 
				ls_cab=string(dwo.band)
				if ls_cab = "header" then	
					is_nomcab_borde = dwo.name
				end if
				// Se a$$HEX1$$f100$$ENDHEX$$ade la l$$HEX1$$ed00$$ENDHEX$$nea a la dw
				of_agregar_linea()
				// Se posiciona la l$$HEX1$$ed00$$ENDHEX$$nea en el extremo de la cabecera y se hace visible
				This.Modify("linea_desplazamiento.X1='" + string(Long(dwo.x) + Long(dwo.width)) +"'")
				This.Modify("linea_desplazamiento.X2='" + string(Long(dwo.x) + Long(dwo.width)) +"'")
				This.Modify("linea_desplazamiento.Y1='0'")
				This.modify("linea_desplazamiento.visible='1'")
				
			END IF
			
		END IF
	
		// Si se est$$HEX2$$e1002000$$ENDHEX$$en el cambio de tama$$HEX1$$f100$$ENDHEX$$o de un campo no se realiza la ordenaci$$HEX1$$f300$$ENDHEX$$n
		IF ib_desplazar = TRUE Then return 0 
	
		//	En el caso de que se haga click en la cabecera, pero no en un extremo, se realiza
		// la ordenaci$$HEX1$$f300$$ENDHEX$$n del campo y se prepara a la dw para un posible desplazamiento
		ls_cab=string(dwo.band)
		// GNU 19-6-2007. Incidencia 0/506777
		// Si se est$$HEX2$$e1002000$$ENDHEX$$moviendo no permito que coja la nueva cabecera, contin$$HEX1$$fa00$$ENDHEX$$o con la antigua
		if ls_cab = "header" and ib_moviendo_col= false then	
//		if ls_cab = "header" then
		// FIN GNU
			
			ls_nomcab=dwo.name
			ls_sint=ls_nomcab + ".Border='5'"
			this.Modify(ls_sint)
			is_nomcab_borde = ls_nomcab
			
			if ib_permitido = true then
				ib_moviendo_col = TRUE
				// Se obtienen las coordenadas originales del campo que se puede llegar a desplazar
				il_x_columna_mov = of_obtener_propiedad(string(dwo.name) + ".X")
				il_y_columna_mov = of_obtener_propiedad(string(dwo.name) + ".Y")
				
				// Se ponen todas las cabeceras transparentes para que si se desplaza el campo, $$HEX1$$e900$$ENDHEX$$ste
				// no quede oculto por otra cabecera en su desplazamiento
				of_cambiar_fondo_cabeceras(ii_transparente)
			END IF
			
			ls_nomcol = Mid(ls_nomcab,1 ,len(ls_nomcab) - 2)
			if is_nomcab = ls_nomcab and ii_orden=1 then
				ii_orden=2
				ls_tipo= " D"
				this.SetSort(ls_nomcol + ls_tipo)
			elseif is_nomcab = ls_nomcab and ii_orden=2 then
				ii_orden=1
				ls_tipo= " A"
				this.SetSort(ls_nomcol + ls_tipo)
			elseif is_nomcab <> ls_nomcab then
				ii_orden=1
				ls_tipo = " A"
				this.SetSort(ls_nomcol + ls_tipo)
				is_nomcab=ls_nomcab
			end if
		
			this.sort()
			if ib_permitido = true then
				Drag(Begin!)
			end if
		end if
		
		This.SetSort("")
		This.Sort()
	end if

end event

event sqlpreview;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Sqlpreview
// 
// Objetivo: Pone a la Dw retrieve_as_need.   
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 25/11/98    FDO
//
///////////////////////////////////////////////////////

string ls_select,ls_realizado, ls_vacia
long ll_pos_inicio,ll_pos_fin,ll_cont_max
int li_realizado

ls_vacia = ""

if sqltype=PreviewSelect! then

//	this.setfilter(ls_vacia)
//	this.filter()
	
	ls_realizado=this.modify("DataWindow.Retrieve.AsNeeded=Yes")

	ls_select = sqlsyntax

	ll_pos_inicio= Pos ( ls_select, "SELECT")

//	ls_select = Replace ( ls_select, 1, ll_pos_inicio + 5, " SELECT ~047*+ FIRST_ROWS */ " ) 

	li_realizado=this.setsqlpreview(ls_select)

end if
end event

event scrollhorizontal;this.setredraw(false)

IF scrollpos > il_scroll_max THEN
	This.Object.DataWindow.HorizontalScrollPosition=il_scroll_max + 70
	il_scrollpos = il_scroll_max + 70
ELSE
	il_scrollpos = scrollpos
END IF


//IF scrollpos > il_scroll_max THEN
//	This.Object.DataWindow.HorizontalScrollMaximun=il_scroll_max
//	il_scrollpos = il_scroll_max
//ELSE
//	il_scrollpos = scrollpos
//END IF

this.setredraw(true)
end event

event losefocus;//IF ib_moviendo_col THEN
//	This.Modify(is_nomcab_borde + ".X='" + string(il_x_columna_mov) +"'") 
//	ib_moviendo_col = FALSE
//END IF
end event

event constructor;
if this.dataobject <> 'd_bri_2017_pr_datos_cons_ot' and &
   this.dataobject <> 'd_bri_2002_pr_list_brigadas_ot' and &
   this.dataobject <> 'd_bri_2017_pr_datos_orden_tarea_2' and &
   this.dataobject <> 'd_bri_2002_pr_list_brigadas_ot' then 
	ib_permitido = true
else
	ib_permitido = false
end if
end event

event destructor;//string ls_cols[]
//long ll_tot
//int li_num_col
//
//IF upperbound(is_cabeceras[]) > 0 AND This.Object.DataWindow.Syntax.Modified='yes' THEN
//	of_grabar_campos(is_cabeceras, True, True)
//	of_grabar_campos(is_computados, False, True)
//	of_grabar_campos(is_bitmap, False, True)
//	
//	ll_tot = Long(This.Describe("DataWindow.Column.Count"))
//	FOR li_num_col = 1 TO ll_tot
//		ls_cols[li_num_col] = "#" + string(li_num_col)
//	NEXT
//	of_grabar_campos(ls_cols, False, True)
//	
//END IF

string ls_sintaxis,ls_dataobject
int li_cantidad

ls_sintaxis = this.Object.DataWindow.Syntax
ls_dataobject= this.dataobject

select count(*) 
into :li_cantidad
from gi_sintaxis_usuario
where usuario = :gs_usuario and datawindow = :ls_dataobject;

if li_cantidad > 0 then
	update gi_sintaxis_usuario 
	set sintaxis = :ls_sintaxis
	where usuario = :gs_usuario and datawindow = :ls_dataobject;
else
	INSERT INTO GI_SINTAXIS_USUARIO  
         			( USUARIO,   
           		  DATAWINDOW,   
           		  SINTAXIS )  
  	VALUES ( :gs_usuario,   
           		  :ls_dataobject,   
           		  :ls_sintaxis )  ;
end if

gnu_u_transaction.uf_commit()


end event

event dragleave;//This.drag(end!)
//This.TriggerEvent("ue_soltar_clicked")
end event

event dragwithin;//messagebox ("hola", "dragwithin")

This.Event ue_mover_borde( UnitsToPixels(PointerX(),XUnitsToPixels!  ),  UnitsToPixels(PointerY(),YUnitsToPixels! ),row,dwo)
end event

on u_gen_0000_lista.create
end on

on u_gen_0000_lista.destroy
end on


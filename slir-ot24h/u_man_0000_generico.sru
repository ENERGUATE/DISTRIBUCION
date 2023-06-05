HA$PBExportHeader$u_man_0000_generico.sru
$PBExportComments$Lo aun necesito
forward
global type u_man_0000_generico from datawindow
end type
type estruct_objeto from structure within u_man_0000_generico
end type
end forward

type estruct_objeto from structure
    string obj_nombre
    long obj_x
    long obj_y
    long obj_ancho
    long obj_alto
end type

global type u_man_0000_generico from datawindow
integer width = 2597
integer height = 1048
string dataobject = "d_incidencias"
borderstyle borderstyle = styleraised!
event bot_izq_arriba pbm_lbuttonup
event ordena_dw pbm_custom47
event pone_cabecera pbm_custom41
end type
global u_man_0000_generico u_man_0000_generico

type prototypes
function unsignedlong GetSysColor (int que_color) library "user32.dll"
end prototypes

type variables
private string columna_picada
private boolean orden_asc
private long clicked_x
estruct_objeto estruct_col[64],estruct_cabec[64]
end variables

forward prototypes
private function boolean get_obj_info (ref estruct_objeto mystruct)
public function integer f_insertar_fila ()
public function integer f_habilitar_campos ()
public function integer f_agregar_registro ()
public function integer f_borrar_registro ()
public function integer f_obtener_registros ()
public function string f_titulo ()
public function string f_datawindow ()
public function integer f_tamanio2 ()
public function integer f_posicion ()
public function integer f_tamanio_win ()
public function integer f_tamanio (integer Ancho, integer Alto)
public function boolean set_obj_info ()
end prototypes

on bot_izq_arriba;string mi_columna, str_modifica

str_modifica = columna_picada + ".border = '6'"
this.modify(str_modifica)

if left(this.getbandatpointer(),4) <> 'head' then
        return
end if

mi_columna = this.getobjectatpointer()

// Si el nombre es mas corto que 2 caracteres, me voy.

//messagebox ("hola", "Largo y 2 ultimos " + mi_columna +","+ string(len(mi_columna)) +","+ mid(mi_columna,pos(mi_columna,"_t"),2))
if len(mi_columna) < 2 then
	return
end if

// Si no termina en _t, no es un nombre v$$HEX1$$e100$$ENDHEX$$lido y me voy.

if mid(mi_columna,pos(mi_columna,"_t"),2) <> '_t' then
	return
end if

mi_columna = left(mi_columna,pos(mi_columna,"~t") - 1)

/* check to make sure the column was not moved for grid style
        if moved don't sort */

if clicked_x <> long(this.describe(mi_columna + ".x")) then
        return
end if


if mi_columna = columna_picada then
        postevent("ordena_dw")
else
        return
end if


end on

on ordena_dw;string str_orden,mi_columna
int cod_retorno

mi_columna = left(columna_picada,len(columna_picada) - 2)

if orden_asc then
        str_orden = mi_columna + " A"
else
        str_orden = mi_columna + " D"
end if

cod_retorno = this.setsort(str_orden)
cod_retorno = this.sort()

end on

event pone_cabecera;int mylen,coldx,hddx,whylen,ndx

string holdstr, mi_string, str_modifica

long totcols

holdstr = this.describe("datawindow.objects")

mylen = 1

do while mylen > 0
        mylen = pos(holdstr,"~t")
        if mylen = 0 then
                coldx ++
                estruct_col[coldx].obj_nombre = holdstr
                get_obj_info(estruct_col[coldx])
                continue
        else
                mi_string = left(holdstr,mylen - 1)
                holdstr = right(holdstr,len(holdstr) - (mylen))
        end if
        whylen = pos(mi_string,"_t")
        if whylen > 0 then
                hddx ++
                estruct_cabec[hddx].obj_nombre = mi_string
                get_obj_info(estruct_cabec[hddx])
        else
                coldx ++
                estruct_col[coldx].obj_nombre = mi_string
                get_obj_info(estruct_col[coldx])
        end if
loop


//long buttoncolortouse
//environment whatenv

//getenvironment(whatenv)

//if whatenv.OSType = Windows! then
// 	      buttoncolortouse =  GetSysColor(15)  /* Windows SDK call */

//else
//        buttoncolortouse = 12632256   /*  Default value for light grey */
//end if

//set_obj_info(estruct_cabec[],estruct_col[])
set_obj_info()

str_modifica = "datawindow.header.height =" + string(estruct_cabec[1].obj_alto + 8) + " "

totcols = upperbound(estruct_cabec[])

//for ndx = 1 to totcols
//
//        str_modifica = str_modifica + estruct_cabec[ndx].obj_nombre + ".border='6' " + &
//                                estruct_cabec[ndx].obj_nombre + ".background.mode='0' " + &
//                                estruct_cabec[ndx].obj_nombre + ".background.color='" + string(buttoncolortouse) + "'"
//        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".x = '" + string(estruct_cabec[ndx].obj_x) + "' "
//        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".y = '" + string(estruct_cabec[ndx].obj_y) + "' "
//        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".width = '" + string(estruct_cabec[ndx].obj_ancho) + "' "
//        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".height = '" + string(estruct_cabec[ndx].obj_alto) + "' "
//        str_modifica = str_modifica + " " + estruct_col[ndx].obj_nombre + ".x = '" + string(estruct_col[ndx].obj_x) + "' "
//        str_modifica = str_modifica + " " + estruct_col[ndx].obj_nombre + ".width = '" + string(estruct_col[ndx].obj_ancho) + "' "
//
//next
//
//mi_string = this.modify(str_modifica)



end event

private function boolean get_obj_info (ref estruct_objeto mystruct);string myrtn,parsedstr
int mylen

myrtn = this.describe(mystruct.obj_nombre + ".x " + &
                mystruct.obj_nombre + ".y " + & 
                mystruct.obj_nombre + ".width " + &
                mystruct.obj_nombre + ".height")

if pos(myrtn,"~n") = 0 then
        return false
end if

mystruct.obj_x = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n"))
mystruct.obj_y = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n")) 
mystruct.obj_ancho = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n"))
mystruct.obj_alto = long(myrtn)

return true

end function

public function integer f_insertar_fila ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_insertar_fila
// 
// Objetivo: Inserta una fila en blanco en la dw
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//						SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


RETURN this.InsertRow(0)
end function

public function integer f_habilitar_campos ();//////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_habil_campos
//// 
//// Objetivo:	Habilita los campos del nombre o el documento en funci$$HEX1$$f300$$ENDHEX$$n del
//// valor de los par$$HEX1$$e100$$ENDHEX$$metros que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
////	en color blanco o gris.
////
//// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
////
//// Par$$HEX1$$e100$$ENDHEX$$metros:
////	Entrada: pb_nombre (boolean que indica si se hab. los campos del nombre)
////				pb_documento (boolean que indica si se hab. los campos del docum.)
////	Salida:  -- 
////						
//// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
////
////  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ---------	-------		----------------------------------------
////	17/7/95		SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
////
//////////////////////////////////////////////////////////////////////////////////////////////////
//
//IF pb_nombre THEN
//	this.dwmodify("nombre.background.color=" + string(rgb(255,255,255)) +&
//			 "~t ap1.background.color=" + string(rgb(255,255,255)) +&
//			 "~t ap2.background.color=" + string(rgb(255,255,255)))
//	this.SetTabOrder("nombre",10)
//	this.SetTabOrder("ap1",20)
//	this.SetTabOrder("ap2",30)
//ELSE
//	this.dwmodify("nombre.background.color=" + string(rgb(192,192,192)) +&
//			 "~t ap1.background.color=" + string(rgb(192,192,192)) +&
//			 "~t ap2.background.color=" + string(rgb(192,192,192)))
//	this.SetTabOrder("nombre",0)
//	this.SetTabOrder("ap1",0)
//	this.SetTabOrder("ap2",0)
//END IF
//
//IF pb_documento THEN
//	this.dwmodify("doc_id.background.color=" + string(rgb(255,255,255)) +&
//			 "~t tip_doc.background.color=" + string(rgb(255,255,255)) +&
//			 "~t co_pais.background.color=" + string(rgb(255,255,255)))
//	this.SetTabOrder("doc_id",40)
//	this.SetTabOrder("tip_doc",50)
//	this.SetTabOrder("co_pais",60)
//ELSE
//	this.dwmodify("doc_id.background.color=" + string(rgb(192,192,192)) +&
//			 "~t tip_doc.background.color=" + string(rgb(192,192,192)) +&
//			 "~t co_pais.background.color=" + string(rgb(192,192,192)))
//	this.SetTabOrder("doc_id",0)
//	this.SetTabOrder("tip_doc",0)
//	this.SetTabOrder("co_pais",0)
//END IF
//
RETURN 1
end function

public function integer f_agregar_registro ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_agregar_registro
//
// Objetivo:  Inserta una fila.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////


long ll_gris, ll_azul, ll_blanco


ll_azul =  (65536*128)
ll_blanco = (65536*255+256*255+255)

gi_fila_actual=this.insertrow(0)
this.scrolltorow(gi_fila_actual)
if gi_fila_actual=-1 then
	//MessageBox("Error", "No se pudo insertar fila", StopSign!, OK!, 1)
    gnv_msg.f_mensaje("EM16","","",OK!)
else
   this.SetFocus()
	this.SetRow(gi_fila_actual)
	this.SetColumn(1)
end if

return 1
end function

public function integer f_borrar_registro ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_borrar_registro
//
// Objetivo:  Elimina fila.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////

int mesa

//mesa = Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Esta seguro que desea eliminar el registro",Exclamation!,OKCancel!,2)
  mesa = gnv_msg.f_mensaje("CM05","","",YesNo!)
IF mesa = 1  THEN
	this.DeleteRow(0)
	//this.Update()
	this.SetFocus()
	this.SetRow(this.GetRow())
	this.SetColumn(1)
ELSE
  return 1
END IF

return 1
end function

public function integer f_obtener_registros ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_obtener_registros
//
// Objetivo:  Conecci$$HEX1$$f300$$ENDHEX$$n de la base de datos y retrieve de la datawindow.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////


 this.SetTransObject(sqlca)
 this.Retrieve()
 this.SetRowFocusIndicator(Hand!)
 this.SetFocus()


return 1
end function

public function string f_titulo ();RETURN ""
end function

public function string f_datawindow ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_datawindow
//
// Objetivo: Retorna ""
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////



return ""
end function

public function integer f_tamanio2 ();return 1
end function

public function integer f_posicion ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_posici$$HEX1$$f300$$ENDHEX$$n
//
// Objetivo:  Retorna un valor constante que representa posici$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada:--
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////



return 1
end function

public function integer f_tamanio_win ();return 1
end function

public function integer f_tamanio (integer Ancho, integer Alto);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_tama$$HEX1$$f100$$ENDHEX$$o
//
// Objetivo:  Retorna el tama$$HEX1$$f100$$ENDHEX$$o
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: ps_nis_rad
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////




this.resize(Ancho,Alto)

return 1
end function

public function boolean set_obj_info ();int totcols, ndx
long altura_max
totcols = upperbound(estruct_cabec[])

for ndx = 1 to totcols
        if estruct_cabec[ndx].obj_alto > altura_max then
                altura_max =        estruct_cabec[ndx].obj_alto
        end if
next

for ndx = 1 to totcols

        if estruct_cabec[ndx].obj_ancho >  estruct_col[ndx].obj_ancho then
                 estruct_col[ndx].obj_ancho = estruct_cabec[ndx].obj_ancho
        else
                estruct_cabec[ndx].obj_ancho =  estruct_col[ndx].obj_ancho
        end if

        estruct_cabec[ndx].obj_y = 4
        estruct_cabec[ndx].obj_alto = altura_max

next

for ndx = 1 to totcols

        if ndx = 1 then
                estruct_cabec[ndx].obj_x = 4
                 estruct_col[ndx].obj_x = 4
        else
                estruct_cabec[ndx].obj_x = (estruct_cabec[ndx - 1].obj_x + estruct_cabec[ndx - 1].obj_ancho ) + 8
                 estruct_col[ndx].obj_x = ( estruct_col[ndx - 1].obj_x +  estruct_col[ndx - 1].obj_ancho ) + 8
        end if

next

return true
end function

on itemerror;//MessageBox("Error","Dato incorrecto",StopSign!,OK!)
//
//this.SetActionCode(1)
end on

event itemchanged;//this.triggerevent("verificar")
string ls_codigo

choose case lower(dwo.name) //DBE 10/02/2000
	    case 'descripcion'

choose case this.dataobject
     	 case "d_man_2022_tip_avi"
			ls_codigo=string(this.getitemnumber(row,'tip_aviso'))
		case "d_man_2049_materiales"
			ls_codigo=this.getitemstring(row,'codigo')
			//23/10/2008  YAF
		case "d_man_5020_ocen_ser_ejec"
			ls_codigo=this.getitemstring(row,'codigo')
		case else
			ls_codigo=string(this.getitemnumber(row,'codigo'))
end choose			
			
			
			
if w_generica_mant.wf_si_duplicado(ls_codigo,data) then
	w_generica_mant.ib_duplicado=true
	return 2
end if

end choose

end event

event clicked;if left(this.getbandatpointer(),4) <> 'head' then
        return
end if

string mi_columna, str_modifica

mi_columna = this.getobjectatpointer()

columna_picada = left(mi_columna,pos(mi_columna,"~t") - 1)

str_modifica = columna_picada + ".border = '5'"

//this.modify(str_modifica)

clicked_x = long(this.describe(columna_picada + ".x"))

if keydown(KeyControl!) then
        orden_asc = false
else
        orden_asc = true
end if

end event

event constructor;this.SetSort("descripcion A") //DBE
this.Sort()


this.triggerevent("pone_cabecera")
end event

on u_man_0000_generico.create
end on

on u_man_0000_generico.destroy
end on


HA$PBExportHeader$u_sort_bdg.sru
forward
global type u_sort_bdg from u_gen_0000_lista
end type
end forward

type estruct_objeto from structure
    string obj_nombre
    long obj_x
    long obj_y
    long obj_ancho
    long obj_alto
end type

global type u_sort_bdg from u_gen_0000_lista
int Width=2597
int Height=1049
string DataObject="d_bdg_2005_pr_instal_afect"
event bot_izq_arriba pbm_lbuttonup
event ordena_dw pbm_custom47
event pone_cabecera pbm_custom41
end type
global u_sort_bdg u_sort_bdg

type prototypes
// function long GetSysColor (int que_color) library "user.exe"

function long GetSysColor (int que_color) library "user32.dll"
end prototypes

type variables
private string columna_picada
private boolean orden_asc
private long clicked_x
end variables

forward prototypes
private function boolean get_obj_info (ref estruct_objeto mystruct)
public function boolean set_obj_info (ref estruct_objeto head_struct[], ref estruct_objeto col_struct[])
end prototypes

event bot_izq_arriba;string mi_columna, str_modifica

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


end event

event ordena_dw;string str_orden,mi_columna
int cod_retorno

mi_columna = left(columna_picada,len(columna_picada) - 2)

if orden_asc then
        str_orden = mi_columna + " A"
else
        str_orden = mi_columna + " D"
end if

cod_retorno = this.setsort(str_orden)
cod_retorno = this.sort()

end event

event pone_cabecera;//
//estruct_objeto estruct_col[64],estruct_cabec[64]
//
//int mylen,coldx,hddx,whylen,ndx
//
//string holdstr, mi_string, str_modifica
//
//long totcols
//
//holdstr = this.describe("datawindow.objects")
//
//mylen = 1
//
//do while mylen > 0
//        mylen = pos(holdstr,"~t")
//        if mylen = 0 then
//                coldx ++
//                estruct_col[coldx].obj_nombre = holdstr
//                get_obj_info(estruct_col[coldx])
//                continue
//        else
//                mi_string = left(holdstr,mylen - 1)
//                holdstr = right(holdstr,len(holdstr) - (mylen))
//        end if
//        whylen = pos(mi_string,"_t")
//        if whylen > 0 then
//                hddx ++
//                estruct_cabec[hddx].obj_nombre = mi_string
//                get_obj_info(estruct_cabec[hddx])
//        else
//                coldx ++
//                estruct_col[coldx].obj_nombre = mi_string
//                get_obj_info(estruct_col[coldx])
//        end if
//loop
//
//long buttoncolortouse
//environment whatenv
//
//getenvironment(whatenv)
//
//if whatenv.OSType = Windows! then
//        buttoncolortouse = GetSysColor(15) /* Windows SDK call */
//else
//        buttoncolortouse = 12632256   /*  Default value for light grey */
//end if
//
//set_obj_info(estruct_cabec[],estruct_col[])
//
//str_modifica = "datawindow.header.height =" + string(estruct_cabec[1].obj_alto + 8) + " "
//
//totcols = upperbound(estruct_cabec[])
//
////for ndx = 1 to totcols
////
////        str_modifica = str_modifica + estruct_cabec[ndx].obj_nombre + ".border='6' " + &
////                                estruct_cabec[ndx].obj_nombre + ".background.mode='0' " + &
////                                estruct_cabec[ndx].obj_nombre + ".background.color='" + string(buttoncolortouse) + "'"
////        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".x = '" + string(estruct_cabec[ndx].obj_x) + "' "
////        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".y = '" + string(estruct_cabec[ndx].obj_y) + "' "
////        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".width = '" + string(estruct_cabec[ndx].obj_ancho) + "' "
////        str_modifica = str_modifica + " " + estruct_cabec[ndx].obj_nombre + ".height = '" + string(estruct_cabec[ndx].obj_alto) + "' "
////        str_modifica = str_modifica + " " + estruct_col[ndx].obj_nombre + ".x = '" + string(estruct_col[ndx].obj_x) + "' "
////        str_modifica = str_modifica + " " + estruct_col[ndx].obj_nombre + ".width = '" + string(estruct_col[ndx].obj_ancho) + "' "
////
////next
////
////mi_string = this.modify(str_modifica)
//
//
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

public function boolean set_obj_info (ref estruct_objeto head_struct[], ref estruct_objeto col_struct[]);int totcols, ndx
long altura_max
totcols = upperbound(head_struct[])

for ndx = 1 to totcols
        if head_struct[ndx].obj_alto > altura_max then
                altura_max =        head_struct[ndx].obj_alto
        end if
next

for ndx = 1 to totcols

        if head_struct[ndx].obj_ancho > col_struct[ndx].obj_ancho then
                col_struct[ndx].obj_ancho = head_struct[ndx].obj_ancho
        else
                head_struct[ndx].obj_ancho = col_struct[ndx].obj_ancho
        end if

        head_struct[ndx].obj_y = 4
        head_struct[ndx].obj_alto = altura_max

next

for ndx = 1 to totcols

        if ndx = 1 then
                head_struct[ndx].obj_x = 4
                col_struct[ndx].obj_x = 4
        else
                head_struct[ndx].obj_x = (head_struct[ndx - 1].obj_x + head_struct[ndx - 1].obj_ancho ) + 8
                col_struct[ndx].obj_x = (col_struct[ndx - 1].obj_x + col_struct[ndx - 1].obj_ancho ) + 8
        end if

next

return true
end function

event clicked;call super::clicked;if left(this.getbandatpointer(),4) <> 'head' then
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

event constructor;call super::constructor;// this.triggerevent("pone_cabecera")
end event

event rbuttondown;//override
end event

event rbuttonup;//override
end event


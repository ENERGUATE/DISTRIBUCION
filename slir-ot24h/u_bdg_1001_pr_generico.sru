HA$PBExportHeader$u_bdg_1001_pr_generico.sru
forward
global type u_bdg_1001_pr_generico from u_bdg_0000_generico
end type
type estruct_objeto from structure within u_bdg_1001_pr_generico
end type
end forward

type estruct_objeto from structure
    string obj_nombre
    long obj_x
    long obj_y
    long obj_ancho
    long obj_alto
end type

global type u_bdg_1001_pr_generico from u_bdg_0000_generico
event bot_izq_arriba pbm_custom70
event ordena_dw pbm_custom71
event pone_cabecera pbm_custom72
end type
global u_bdg_1001_pr_generico u_bdg_1001_pr_generico

type prototypes
function long GetSysColor (int que_color) library "user32.dll"
end prototypes

type variables
private string columna_picada
private boolean orden_asc
private long clicked_x
estruct_objeto estruct_col[100],estruct_cabec[100]
end variables

forward prototypes
public function boolean get_obj_info_col (long pl_number)
public function boolean get_obj_info_cab (long pl_number)
public function boolean set_obj_info ()
end prototypes

on bot_izq_arriba;call u_bdg_0000_generico::bot_izq_arriba;string mi_columna, str_modifica

str_modifica = columna_picada + ".border = '6'"
this.modify(str_modifica)

if left(this.getbandatpointer(),4) <> 'head' then
        return
end if

mi_columna = this.getobjectatpointer()

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

on ordena_dw;call u_bdg_0000_generico::ordena_dw;string str_orden,mi_columna
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

event pone_cabecera;
int mylen,coldx,hddx,whylen,ndx

string holdstr, mi_string, str_modifica

long totcols

holdstr = this.describe("datawindow.objects")

mylen = 1

do while mylen > 0
        mylen = pos(holdstr,"~t")
        if mylen = 0 then
                coldx ++
                estruct_col[coldx].obj_nombre = holdstr
                get_obj_info_col(coldx)
                continue
        else
                mi_string = left(holdstr,mylen - 1)
                holdstr = right(holdstr,len(holdstr) - (mylen))
        end if
        whylen = pos(mi_string,"_t")
        if whylen > 0 then
                hddx ++
                estruct_cabec[hddx].obj_nombre = mi_string
                get_obj_info_cab(hddx)
        else
                coldx ++
                estruct_col[coldx].obj_nombre = mi_string
                get_obj_info_col(coldx)
        end if
loop

long buttoncolortouse
environment whatenv

getenvironment(whatenv)

if whatenv.OSType = Windows! then
        buttoncolortouse = GetSysColor(15) /* Windows SDK call */
else
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//        buttoncolortouse = 12632256   /*  Default value for light grey */
        buttoncolortouse = 81324524   /*  Default value for light grey */
// Fin. Sgo.
end if

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

public function boolean get_obj_info_col (long pl_number);string myrtn,parsedstr
int mylen

myrtn = this.describe(estruct_col[pl_number].obj_nombre + ".x " + &
                estruct_col[pl_number].obj_nombre + ".y " + & 
                estruct_col[pl_number].obj_nombre + ".width " + &
                estruct_col[pl_number].obj_nombre + ".height")

if pos(myrtn,"~n") = 0 then
        return false
end if

estruct_col[pl_number].obj_x = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n"))
estruct_col[pl_number].obj_y = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n")) 
estruct_col[pl_number].obj_ancho = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n"))
estruct_col[pl_number].obj_alto = long(myrtn)

return true

end function

public function boolean get_obj_info_cab (long pl_number);string myrtn,parsedstr
int mylen

myrtn = this.describe(estruct_cabec[pl_number].obj_nombre + ".x " + &
                estruct_cabec[pl_number].obj_nombre + ".y " + & 
                estruct_cabec[pl_number].obj_nombre + ".width " + &
                estruct_cabec[pl_number].obj_nombre + ".height")

if pos(myrtn,"~n") = 0 then
        return false
end if

estruct_cabec[pl_number].obj_x = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n"))
estruct_cabec[pl_number].obj_y = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n")) 
estruct_cabec[pl_number].obj_ancho = long(left(myrtn,pos(myrtn,"~n") - 1))
myrtn = right(myrtn,len(myrtn) - pos(myrtn,"~n"))
estruct_cabec[pl_number].obj_alto = long(myrtn)

return true

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

        if estruct_cabec[ndx].obj_ancho > estruct_col[ndx].obj_ancho then
                estruct_col[ndx].obj_ancho = estruct_cabec[ndx].obj_ancho
        else
                estruct_cabec[ndx].obj_ancho = estruct_col[ndx].obj_ancho
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
                estruct_col[ndx].obj_x = (estruct_col[ndx - 1].obj_x + estruct_col[ndx - 1].obj_ancho ) + 8
        end if

next

return true
end function

on clicked;call u_bdg_0000_generico::clicked;if left(this.getbandatpointer(),4) <> 'head' then
        return
end if

string mi_columna, str_modifica

messagebox("",this.describe("datawindow.objects"))
mi_columna = this.getobjectatpointer()

columna_picada = left(mi_columna,pos(mi_columna,"~t") - 1)

str_modifica = columna_picada + ".border = '5'"

this.modify(str_modifica)

clicked_x = long(this.describe(columna_picada + ".x"))

if keydown(KeyControl!) then
        orden_asc = false
else
        orden_asc = true
end if

end on

on constructor;call u_bdg_0000_generico::constructor;this.triggerevent("pone_cabecera")
end on

on u_bdg_1001_pr_generico.create
call super::create
end on

on u_bdg_1001_pr_generico.destroy
call super::destroy
end on


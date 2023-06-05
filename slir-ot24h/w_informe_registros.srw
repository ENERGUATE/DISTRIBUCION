HA$PBExportHeader$w_informe_registros.srw
forward
global type w_informe_registros from window
end type
type st_6 from statictext within w_informe_registros
end type
type pa_agrupado from dropdownlistbox within w_informe_registros
end type
type cb_3 from commandbutton within w_informe_registros
end type
type sle_2 from singlelineedit within w_informe_registros
end type
type sle_1 from singlelineedit within w_informe_registros
end type
type st_5 from statictext within w_informe_registros
end type
type st_1 from statictext within w_informe_registros
end type
type st_4 from statictext within w_informe_registros
end type
type st_3 from statictext within w_informe_registros
end type
type cb_2 from commandbutton within w_informe_registros
end type
type cb_1 from commandbutton within w_informe_registros
end type
type st_2 from statictext within w_informe_registros
end type
type cbx_1 from checkbox within w_informe_registros
end type
type em_2 from editmask within w_informe_registros
end type
type em_1 from editmask within w_informe_registros
end type
type dw_index from datawindow within w_informe_registros
end type
type gb_1 from groupbox within w_informe_registros
end type
end forward

global type w_informe_registros from window
integer x = 1326
integer y = 652
integer width = 5467
integer height = 2988
boolean titlebar = true
string title = "Consulta de llamadas capturadas (w_informe_registros)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
st_6 st_6
pa_agrupado pa_agrupado
cb_3 cb_3
sle_2 sle_2
sle_1 sle_1
st_5 st_5
st_1 st_1
st_4 st_4
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
cbx_1 cbx_1
em_2 em_2
em_1 em_1
dw_index dw_index
gb_1 gb_1
end type
global w_informe_registros w_informe_registros

type variables
string busqueda1, busqueda2
string filtroAviso = '?'
int indexFiltro
end variables

forward prototypes
public function integer f_update ()
end prototypes

public function integer f_update ();string newSelect

openwithparm(w_msg,"Cargando...")



if cbx_1.checked=true then
	//dw_index.retrieve(g_cod_usuario, em_1.text, em_2.text)
	//deshabilitando opciones de filtro
	pa_agrupado.enabled = false
	dw_index.dataobject = "dw_informes_registros"
	dw_index.settransobject(sqlca2)
	dw_index.retrieve(g_cod_usuario, sle_1.text, sle_2.text, '?')
else
	//dw_index.retrieve('?',em_1.text, em_2.text)
	pa_agrupado.enabled = true
	
	if(indexFiltro = 2) then
		//OT24H
		dw_index.dataobject = "dw_informes_registros_aux"
	else
		dw_index.dataobject = "dw_informes_registros"
	end if
	
	dw_index.settransobject(sqlca2)
	dw_index.retrieve('?', sle_1.text, sle_2.text,filtroAviso )
			
end if
	
	


close(w_msg)

return 1


end function

on w_informe_registros.create
this.st_6=create st_6
this.pa_agrupado=create pa_agrupado
this.cb_3=create cb_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_5=create st_5
this.st_1=create st_1
this.st_4=create st_4
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.cbx_1=create cbx_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_index=create dw_index
this.gb_1=create gb_1
this.Control[]={this.st_6,&
this.pa_agrupado,&
this.cb_3,&
this.sle_2,&
this.sle_1,&
this.st_5,&
this.st_1,&
this.st_4,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.cbx_1,&
this.em_2,&
this.em_1,&
this.dw_index,&
this.gb_1}
end on

on w_informe_registros.destroy
destroy(this.st_6)
destroy(this.pa_agrupado)
destroy(this.cb_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_5)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_index)
destroy(this.gb_1)
end on

event open;//em_1.text=string(datetime(date('01/'+string(month(today()),'00') + '/'+string(year(today()),'0000')),time('00:00')),'dd/mm/yyyy hh:mm')+':00'

//em_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'


//sle_1.text=string(datetime(date('01/'+string(month(today()),'00') + '/'+string(year(today()),'0000')),time('00:00')),'dd/mm/yyyy hh:mm')+':00'



sle_1.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'00:00:00'
sle_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'


busqueda1=''
busqueda2='' /*variables para evitar llamadas a f_update en el evento others del sle_1*/

if g_credenciales<>'SPV' then
	messagebox('Denegado', 'Usuario no autorizado para esta aplicaci$$HEX1$$f300$$ENDHEX$$n')
	close(this)
else
	

//f_update()


end if



//dw_index.retrieve(g_cod_usuario,'?', em_1.text, em_2.text)

end event

type st_6 from statictext within w_informe_registros
integer x = 4539
integer y = 228
integer width = 581
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio de Selecci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

type pa_agrupado from dropdownlistbox within w_informe_registros
integer x = 4475
integer y = 328
integer width = 699
integer height = 352
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 3
string item[] = {"OT24H","Comercial","Todos"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if index = 1 then
	indexFiltro = 1
	filtroAviso = 'OCM'
else
	if  index = 2 then 
		indexFiltro = 2
		filtroAviso = 'OCM'
	else
		if index = 3 then
			indexFiltro = 3
			filtroAviso = '?'
		end if
	end if
end if
end event

event constructor;this.SelectItem (3)
indexFiltro = 3
end event

type cb_3 from commandbutton within w_informe_registros
integer x = 3899
integer y = 264
integer width = 343
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Excel"
end type

event clicked;openwithparm(w_msg,"Cargando...")

string docname, named
integer value

value = GetFileSaveName("Guardar Archivo", docname, named, "XLS", &
	"Excel Files (*.xls),*.xls," + &
	" Excel Files (*.XLS), *.XLS")


dw_index.SaveAs(docname, Excel8! , TRUE)
//dw_index.SaveAsAscii(docname, '~t', '')
CLOSE(w_msg)
end event

type sle_2 from singlelineedit within w_informe_registros
integer x = 2464
integer y = 316
integer width = 914
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_informe_registros
integer x = 1495
integer y = 316
integer width = 914
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_informe_registros
integer x = 4265
integer y = 256
integer width = 78
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "*"
boolean focusrectangle = false
end type

type st_1 from statictext within w_informe_registros
integer x = 1490
integer y = 440
integer width = 955
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_4 from statictext within w_informe_registros
integer x = 187
integer y = 572
integer width = 891
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Doble click para m$$HEX1$$e100$$ENDHEX$$s informaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type st_3 from statictext within w_informe_registros
integer x = 187
integer y = 76
integer width = 1911
integer height = 80
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 128
long backcolor = 33554431
boolean enabled = false
string text = "INFORME REGISTROS SLIR"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_informe_registros
boolean visible = false
integer x = 4357
integer y = 292
integer width = 343
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Excel"
end type

event clicked;//dw_index.SaveAs("",Excel!,TRUE)


integer li_ret
string docname, named
integer value
datawindow dwx

value = GetFileSaveName("Select File", docname, named, "XLS", &
	"Excel Files (*.xls),*.xls," + &
	" Excel Files (*.XLS), *.XLS")
	


//messagebox('info',docname + '<>'+named)
//
//CHOOSE CASE tab_1.selectedtab
//	CASE 1
//		dwx=tab_1.tabpage_1.dw_2
//	CASE 2
//		dwx=tab_1.tabpage_2.dw_3
//	CASE 3
//		dwx=tab_1.tabpage_3.dw_4
//END CHOOSE
//

dwx=dw_index

li_ret = f_aexcel(dwx, docname)
if li_ret = 1 then
    
else

messagebox('Info', 'No se pudo grabar '  + docname)

 end if
 
 setCurrentDirectoryA(ls_path)



end event

type cb_1 from commandbutton within w_informe_registros
integer x = 3502
integer y = 264
integer width = 343
integer height = 144
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
boolean default = true
end type

event clicked;f_update()
end event

type st_2 from statictext within w_informe_registros
integer x = 1495
integer y = 224
integer width = 1883
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Rango de b$$HEX1$$fa00$$ENDHEX$$squeda"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_informe_registros
integer x = 183
integer y = 304
integer width = 1161
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Ver solo mis datos"
boolean lefttext = true
end type

event clicked;f_update()
end event

type em_2 from editmask within w_informe_registros
boolean visible = false
integer x = 4343
integer y = 360
integer width = 946
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type em_1 from editmask within w_informe_registros
boolean visible = false
integer x = 4338
integer y = 244
integer width = 946
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type dw_index from datawindow within w_informe_registros
integer x = 178
integer y = 672
integer width = 5088
integer height = 2008
integer taborder = 10
string dataobject = "dw_informes_registros"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca2)
end event

event clicked;//THIS.SelectRow(0, FALSE)
//
//THIS.SeLECTRow(row, TRUE)
//
end event

event doubleclicked;long fila
string registro


THIS.SelectRow(0, FALSE)

THIS.SeLECTRow(row, TRUE)


fila=this.getrow()
this.scrolltorow(fila)


if fila>0 then


		registro=this.object.ticket[fila]
		
		openwithparm(w_consulta_det,registro)

end if
end event

type gb_1 from groupbox within w_informe_registros
integer x = 114
integer y = 8
integer width = 5243
integer height = 184
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type


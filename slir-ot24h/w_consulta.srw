HA$PBExportHeader$w_consulta.srw
forward
global type w_consulta from window
end type
type cbx_2 from checkbox within w_consulta
end type
type pa_agrupado from dropdownlistbox within w_consulta
end type
type st_8 from statictext within w_consulta
end type
type st_7 from singlelineedit within w_consulta
end type
type st_6 from singlelineedit within w_consulta
end type
type st_5 from statictext within w_consulta
end type
type st_4 from statictext within w_consulta
end type
type st_3 from statictext within w_consulta
end type
type cb_2 from commandbutton within w_consulta
end type
type cb_1 from commandbutton within w_consulta
end type
type st_2 from statictext within w_consulta
end type
type st_1 from statictext within w_consulta
end type
type cbx_1 from checkbox within w_consulta
end type
type sle_1 from singlelineedit within w_consulta
end type
type em_2 from editmask within w_consulta
end type
type em_1 from editmask within w_consulta
end type
type dw_index from datawindow within w_consulta
end type
type gb_1 from groupbox within w_consulta
end type
end forward

global type w_consulta from window
integer x = 1326
integer y = 652
integer width = 5467
integer height = 2888
boolean titlebar = true
string title = "Consulta de llamadas capturadas (w_consulta)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
cbx_2 cbx_2
pa_agrupado pa_agrupado
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
cbx_1 cbx_1
sle_1 sle_1
em_2 em_2
em_1 em_1
dw_index dw_index
gb_1 gb_1
end type
global w_consulta w_consulta

type variables
string busqueda1, busqueda2
string filtroAviso = '?'
int indexFiltro
end variables

forward prototypes
public function integer f_update ()
end prototypes

public function integer f_update ();string buscar, newSql

//openwithparm(w_msg,"Buscando...")

if sle_1.text='' /*or len(sle_1.text)<= 3*/ then 
	buscar='?' 
else
	buscar='%'+sle_1.text+'%'
	//messagebox('info', buscar)
end if

/*if cbx_1.checked=true then
	//dw_index.retrieve(g_cod_usuario,buscar, em_1.text, em_2.text)
	dw_index.retrieve(g_cod_usuario,buscar, st_6.text, st_7.text)
else
	//dw_index.retrieve('?',buscar, em_1.text, em_2.text)
	dw_index.retrieve('?',buscar, st_6.text, st_7.text)
	
end if
*/

// Checked para HIST$$HEX1$$d300$$ENDHEX$$RICO.
IF cbx_2.checked = TRUE THEN
	// Cambios para criterios de seleccion: Mostrar por Oficina Comercial, OT24H o Todos
	if cbx_1.checked=true then
		//deshabilitando opciones de filtro
		pa_agrupado.enabled = false
		dw_index.dataobject = "dw_consulta_idx_hist"
		dw_index.settransobject(sqlca2)
		dw_index.retrieve(g_cod_usuario,buscar, st_6.text, st_7.text,'?')
	else
		pa_agrupado.enabled = true
		
		if(indexFiltro = 2) then
			//OT24H
			dw_index.dataobject = "dw_consulta_idx_aux_hist"
		else
			dw_index.dataobject = "dw_consulta_idx_hist"
		end if
		
		dw_index.settransobject(sqlca2)
		dw_index.retrieve('?',buscar, st_6.text, st_7.text,filtroAviso)
	end if
ELSE
	// Cambios para criterios de seleccion: Mostrar por Oficina Comercial, OT24H o Todos
	if cbx_1.checked=true then
		//dw_index.retrieve(g_cod_usuario, em_1.text, em_2.text)
		//deshabilitando opciones de filtro
		pa_agrupado.enabled = false
		dw_index.dataobject = "dw_consulta_idx"
		dw_index.settransobject(sqlca2)
		dw_index.retrieve(g_cod_usuario,buscar, st_6.text, st_7.text,'?')
	else
		//dw_index.retrieve('?',em_1.text, em_2.text)
		pa_agrupado.enabled = true
		
		if(indexFiltro = 2) then
			//OT24H
			dw_index.dataobject = "dw_consulta_idx_aux"
		else
			dw_index.dataobject = "dw_consulta_idx"
		end if
		
		dw_index.settransobject(sqlca2)
		dw_index.retrieve('?',buscar, st_6.text, st_7.text,filtroAviso)
	end if
END IF

//close(w_msg)

return 1
end function

on w_consulta.create
this.cbx_2=create cbx_2
this.pa_agrupado=create pa_agrupado
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.cbx_1=create cbx_1
this.sle_1=create sle_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_index=create dw_index
this.gb_1=create gb_1
this.Control[]={this.cbx_2,&
this.pa_agrupado,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.cbx_1,&
this.sle_1,&
this.em_2,&
this.em_1,&
this.dw_index,&
this.gb_1}
end on

on w_consulta.destroy
destroy(this.cbx_2)
destroy(this.pa_agrupado)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.sle_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_index)
destroy(this.gb_1)
end on

event open;//em_1.text=string(datetime(date('01/'+string(month(today()),'00') + '/'+string(year(today()),'0000')),time('00:00')),'dd/mm/yyyy hh:mm')+':00'

//em_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'


//st_6.text=string(datetime(date('01/'+string(month(today()),'00') + '/'+string(year(today()),'0000')),time('00:00')),'dd/mm/yyyy hh:mm')+':00'

st_6.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'00:00:00'

st_7.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'


busqueda1=''
busqueda2='' /*variables para evitar llamadas a f_update en el evento others del sle_1*/


f_update()

//dw_index.retrieve(g_cod_usuario,'?', em_1.text, em_2.text)

end event

type cbx_2 from checkbox within w_consulta
integer x = 1134
integer y = 304
integer width = 887
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Hist$$HEX1$$f300$$ENDHEX$$rico"
boolean lefttext = true
end type

type pa_agrupado from dropdownlistbox within w_consulta
integer x = 4512
integer y = 328
integer width = 699
integer height = 460
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"Comercial","OT24H","Todos"}
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

type st_8 from statictext within w_consulta
integer x = 4558
integer y = 224
integer width = 581
integer height = 64
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

type st_7 from singlelineedit within w_consulta
integer x = 3035
integer y = 320
integer width = 864
integer height = 100
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_6 from singlelineedit within w_consulta
integer x = 2121
integer y = 324
integer width = 864
integer height = 100
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_consulta
integer x = 4091
integer y = 552
integer width = 69
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

type st_4 from statictext within w_consulta
integer x = 178
integer y = 760
integer width = 1280
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Haga doble click en un registro para ver m$$HEX1$$e100$$ENDHEX$$s informaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type st_3 from statictext within w_consulta
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
string text = "CONSULTA DE REGISTROS SLIR"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_consulta
integer x = 3698
integer y = 552
integer width = 343
integer height = 144
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Excel"
end type

event clicked;//dw_index.SaveAs("", Excel! , TRUE)




//dw_index.SaveAs("",Excel5!,TRUE)


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

type cb_1 from commandbutton within w_consulta
integer x = 3291
integer y = 556
integer width = 343
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
boolean default = true
end type

event clicked;f_update()
end event

type st_2 from statictext within w_consulta
integer x = 2117
integer y = 224
integer width = 1783
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

type st_1 from statictext within w_consulta
integer x = 187
integer y = 484
integer width = 1641
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "Ingrese un texto y luego presione el bot$$HEX1$$f300$$ENDHEX$$n ~"Buscar~":"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_consulta
integer x = 183
integer y = 304
integer width = 887
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
boolean checked = true
boolean lefttext = true
end type

event clicked;//f_update()
if cbx_1.checked=true then
	pa_agrupado.enabled = false
else
	pa_agrupado.enabled = true
end if
end event

type sle_1 from singlelineedit within w_consulta
integer x = 187
integer y = 572
integer width = 3026
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 15780518
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event other;//busqueda1=this.text
//
//if busqueda1<>busqueda2 then  /*solo ejecuta f_update() si la cadena ingresada en sle_1 ha cambiado*/
//	 f_update()
//	 busqueda2=busqueda1
//end if
//
end event

type em_2 from editmask within w_consulta
boolean visible = false
integer x = 4283
integer y = 400
integer width = 891
integer height = 108
integer taborder = 50
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

type em_1 from editmask within w_consulta
boolean visible = false
integer x = 4288
integer y = 280
integer width = 891
integer height = 108
integer taborder = 40
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

type dw_index from datawindow within w_consulta
integer x = 169
integer y = 848
integer width = 5088
integer height = 1792
integer taborder = 10
string dataobject = "dw_consulta_idx"
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
//THIS.SelectRow(0, FALSE)

GETFOCUS()

end event

event doubleclicked;long fila
string registro


THIS.SelectRow(0, FALSE)

THIS.SeLECTRow(row, TRUE)


fila=this.getrow()
this.scrolltorow(fila)


if fila>0 then


		registro=string(this.object.seq[fila])
		
		openwithparm(w_consulta_det,registro)

end if
end event

type gb_1 from groupbox within w_consulta
integer x = 114
integer y = 8
integer width = 5243
integer height = 184
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type


HA$PBExportHeader$w_defdepto.srw
forward
global type w_defdepto from window
end type
type st_3 from statictext within w_defdepto
end type
type dw_ofi from datawindow within w_defdepto
end type
type cb_3 from commandbutton within w_defdepto
end type
type sle_region from singlelineedit within w_defdepto
end type
type sle_ofi from singlelineedit within w_defdepto
end type
type sle_local from singlelineedit within w_defdepto
end type
type sle_munic from singlelineedit within w_defdepto
end type
type sle_depto from singlelineedit within w_defdepto
end type
type st_2 from statictext within w_defdepto
end type
type st_1 from statictext within w_defdepto
end type
type dw_dir from datawindow within w_defdepto
end type
type sle_1 from singlelineedit within w_defdepto
end type
type cb_1 from commandbutton within w_defdepto
end type
type gb_1 from groupbox within w_defdepto
end type
end forward

global type w_defdepto from window
integer x = 1326
integer y = 652
integer width = 2478
integer height = 2420
boolean titlebar = true
string title = "Buscar depto/municipio/localidad (w_defdepto)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
st_3 st_3
dw_ofi dw_ofi
cb_3 cb_3
sle_region sle_region
sle_ofi sle_ofi
sle_local sle_local
sle_munic sle_munic
sle_depto sle_depto
st_2 st_2
st_1 st_1
dw_dir dw_dir
sle_1 sle_1
cb_1 cb_1
gb_1 gb_1
end type
global w_defdepto w_defdepto

type variables
string input
end variables

on w_defdepto.create
this.st_3=create st_3
this.dw_ofi=create dw_ofi
this.cb_3=create cb_3
this.sle_region=create sle_region
this.sle_ofi=create sle_ofi
this.sle_local=create sle_local
this.sle_munic=create sle_munic
this.sle_depto=create sle_depto
this.st_2=create st_2
this.st_1=create st_1
this.dw_dir=create dw_dir
this.sle_1=create sle_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.dw_ofi,&
this.cb_3,&
this.sle_region,&
this.sle_ofi,&
this.sle_local,&
this.sle_munic,&
this.sle_depto,&
this.st_2,&
this.st_1,&
this.dw_dir,&
this.sle_1,&
this.cb_1,&
this.gb_1}
end on

on w_defdepto.destroy
destroy(this.st_3)
destroy(this.dw_ofi)
destroy(this.cb_3)
destroy(this.sle_region)
destroy(this.sle_ofi)
destroy(this.sle_local)
destroy(this.sle_munic)
destroy(this.sle_depto)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_dir)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event resize;// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )


end event

event open;input=''
end event

type st_3 from statictext within w_defdepto
integer x = 50
integer y = 1104
integer width = 1061
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
string text = "Hacer click para elegir oficina/regi$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

type dw_ofi from datawindow within w_defdepto
integer x = 37
integer y = 1188
integer width = 2327
integer height = 520
integer taborder = 30
string dataobject = "dw_ofi"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca2)
end event

event clicked;string l_ofi, l_region
long l_cod_oficina, l_cod_region


this.SelectRow(0, FALSE)
	this.setrow(row)
	this.SelectRow(row, FALSE)


this.accepttext()

if this.rowcount()>0 and row<= this.rowcount() and row>0 then

l_ofi=dw_ofi.object.oficina[row]
l_region=dw_ofi.object.nom_region[row]

l_cod_oficina=dw_ofi.object.cod_oficina[row]
l_cod_region=dw_ofi.object.cod_region[row]

/*actualizar campos ventana actual*/
sle_ofi.text=l_ofi
sle_region.text=l_region

/*actualizar variables globales*/

oficina=l_ofi
nom_region=l_region

cod_oficina=l_cod_oficina
cod_region=l_cod_region



	

This.SelectRow(0, FALSE)

This.SelectRow(row, TRUE)


end if



end event

type cb_3 from commandbutton within w_defdepto
integer x = 1234
integer y = 2048
integer width = 343
integer height = 144
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Cancelar"
end type

event clicked;closewithreturn(parent, "0")
end event

type sle_region from singlelineedit within w_defdepto
integer x = 1577
integer y = 1860
integer width = 754
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_ofi from singlelineedit within w_defdepto
integer x = 818
integer y = 1860
integer width = 754
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_local from singlelineedit within w_defdepto
integer x = 1582
integer y = 1752
integer width = 754
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_munic from singlelineedit within w_defdepto
integer x = 818
integer y = 1752
integer width = 754
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_depto from singlelineedit within w_defdepto
integer x = 41
integer y = 1752
integer width = 754
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_defdepto
integer x = 50
integer y = 252
integer width = 955
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Hacer click para elegir localidad:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_defdepto
integer x = 50
integer y = 48
integer width = 343
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
string text = "Buscar:"
boolean focusrectangle = false
end type

type dw_dir from datawindow within w_defdepto
integer x = 41
integer y = 348
integer width = 2350
integer height = 732
integer taborder = 20
string dataobject = "dw_direccion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca2)
end event

event clicked;
/***/

string d1, m1, l1
long depto

//messagebox('info',string(row))

this.accepttext()

if this.rowcount()>0 and row<= this.rowcount() and row>0 then
	
	
	this.SelectRow(0, FALSE)
	this.setrow(row)
	this.SelectRow(row, FALSE)
	
	sle_depto.text=this.object.nombre_dep2[row]
	sle_munic.text=this.object.nombre_mun2[row]
	sle_local.text=this.object.nombre_loc2[row]
	
	nom_depto=this.object.nombre_dep2[row]
	nom_muni=this.object.nombre_mun2[row]
	nom_local=this.object.nombre_loc2[row]
	
	cod_depto=long(this.object.c_depto2[row])
	cod_muni=long(this.object.c_muni2[row])
	cod_local=long(this.object.c_local2[row])
	
	
	
	
	depto=long(this.object.c_depto2[row])


//***recuperar oficina y region***/

dw_ofi.retrieve(depto)


/*actualizar campos ventana actual oficina y region*/
sle_ofi.text=""
sle_region.text=""

/*actualizar variables globales oficina y region*/

oficina=""
nom_region=""

cod_oficina=0
cod_region=0





end if	
//




This.SelectRow(0, FALSE)

This.SelectRow(row, TRUE)


end event

event doubleclicked;/*nothing*/
end event

type sle_1 from singlelineedit within w_defdepto
integer x = 50
integer y = 132
integer width = 2341
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event other;

if this.text <> input then

	if len(this.text)> 3 then
		
		dw_dir.retrieve('%'+this.text+'%')
		input=this.text
	else
		/*nothing*/
	end if
end if
end event

type cb_1 from commandbutton within w_defdepto
integer x = 768
integer y = 2048
integer width = 343
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Aceptar"
boolean default = true
end type

event clicked;closewithreturn(parent,"1")
end event

type gb_1 from groupbox within w_defdepto
integer x = 27
integer y = 1708
integer width = 2350
integer height = 548
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 15793151
end type


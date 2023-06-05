HA$PBExportHeader$w_resolucion.srw
forward
global type w_resolucion from window
end type
type pa_agrupado from dropdownlistbox within w_resolucion
end type
type st_5 from statictext within w_resolucion
end type
type sle_3 from singlelineedit within w_resolucion
end type
type sle_2 from singlelineedit within w_resolucion
end type
type st_4 from statictext within w_resolucion
end type
type st_3 from statictext within w_resolucion
end type
type cb_auto from commandbutton within w_resolucion
end type
type st_2 from statictext within w_resolucion
end type
type cb_excel from commandbutton within w_resolucion
end type
type cb_buscar from commandbutton within w_resolucion
end type
type st_1 from statictext within w_resolucion
end type
type cbx_1 from checkbox within w_resolucion
end type
type sle_1 from singlelineedit within w_resolucion
end type
type dw_resol from datawindow within w_resolucion
end type
type gb_1 from groupbox within w_resolucion
end type
end forward

global type w_resolucion from window
integer x = 1326
integer y = 652
integer width = 5467
integer height = 2888
boolean titlebar = true
string title = "Resoluci$$HEX1$$f300$$ENDHEX$$n de registros (w_resolucion)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 33554431
pa_agrupado pa_agrupado
st_5 st_5
sle_3 sle_3
sle_2 sle_2
st_4 st_4
st_3 st_3
cb_auto cb_auto
st_2 st_2
cb_excel cb_excel
cb_buscar cb_buscar
st_1 st_1
cbx_1 cbx_1
sle_1 sle_1
dw_resol dw_resol
gb_1 gb_1
end type
global w_resolucion w_resolucion

type variables
string busqueda1, busqueda2
string filtroAviso = '?'
int indexFiltro
end variables

forward prototypes
public function integer f_update ()
end prototypes

public function integer f_update ();string buscar

//openwithparm(w_msg,"Buscando...")

if sle_1.text='' /*or len(sle_1.text)<= 3*/ then 
	buscar='?' 
else
	buscar='%'+sle_1.text+'%'
	//messagebox('info', buscar)
end if

// Filtro por comercial, OT24H o todos.
if cbx_1.checked=true then
	pa_agrupado.enabled = false
	dw_resol.retrieve(g_cod_usuario, buscar, sle_2.text, sle_3.text, '?')
else
	pa_agrupado.enabled = true
	
	if(indexFiltro = 2) then
		//OT24H
		dw_resol.dataobject = "dw_resolucion_aux"
	ELSE
		dw_resol.dataobject = "dw_resolucion"
	end if
	
	dw_resol.settransobject(sqlca2)
	dw_resol.retrieve('?',buscar, sle_2.text, sle_3.text, filtroAviso)	
end if

close(w_msg)

return 1


end function

on w_resolucion.create
this.pa_agrupado=create pa_agrupado
this.st_5=create st_5
this.sle_3=create sle_3
this.sle_2=create sle_2
this.st_4=create st_4
this.st_3=create st_3
this.cb_auto=create cb_auto
this.st_2=create st_2
this.cb_excel=create cb_excel
this.cb_buscar=create cb_buscar
this.st_1=create st_1
this.cbx_1=create cbx_1
this.sle_1=create sle_1
this.dw_resol=create dw_resol
this.gb_1=create gb_1
this.Control[]={this.pa_agrupado,&
this.st_5,&
this.sle_3,&
this.sle_2,&
this.st_4,&
this.st_3,&
this.cb_auto,&
this.st_2,&
this.cb_excel,&
this.cb_buscar,&
this.st_1,&
this.cbx_1,&
this.sle_1,&
this.dw_resol,&
this.gb_1}
end on

on w_resolucion.destroy
destroy(this.pa_agrupado)
destroy(this.st_5)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_auto)
destroy(this.st_2)
destroy(this.cb_excel)
destroy(this.cb_buscar)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.sle_1)
destroy(this.dw_resol)
destroy(this.gb_1)
end on

event open;

if g_credenciales='SPV' then
	cbx_1.enabled=true
else
	cbx_1.enabled=false
end if 



busqueda1=''
busqueda2='' /*variables para evitar llamadas a f_update en el evento others del sle_1*/

sle_2.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'00:00:00'

sle_3.text=string(datetime(today(),now()),'dd/mm/yyyy ')+'23:59:59'

//f_update()

//dw_index.retrieve(g_cod_usuario,'?', em_1.text, em_2.text)

cb_buscar.TriggerEvent(Clicked!)

end event

type pa_agrupado from dropdownlistbox within w_resolucion
integer x = 4512
integer y = 320
integer width = 699
integer height = 460
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"Comercial","OT24H","Todos"}
end type

event constructor;this.SelectItem (3)
indexFiltro = 3
end event

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

type st_5 from statictext within w_resolucion
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

type sle_3 from singlelineedit within w_resolucion
integer x = 2386
integer y = 320
integer width = 864
integer height = 100
integer taborder = 50
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

type sle_2 from singlelineedit within w_resolucion
integer x = 1472
integer y = 320
integer width = 864
integer height = 100
integer taborder = 40
integer textsize = -11
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_resolucion
integer x = 1467
integer y = 224
integer width = 1783
integer height = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
boolean enabled = false
string text = "Rango de b$$HEX1$$fa00$$ENDHEX$$squeda"
boolean focusrectangle = false
end type

type st_3 from statictext within w_resolucion
integer x = 142
integer y = 768
integer width = 1399
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
string text = "Doble click sobre un registro para resoluci$$HEX1$$f300$$ENDHEX$$n manual"
boolean focusrectangle = false
end type

type cb_auto from commandbutton within w_resolucion
integer x = 3145
integer y = 576
integer width = 713
integer height = 144
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Auto-resolver con aviso"
end type

event clicked;long i
datetime f_alta, f_res, hoy
long nro_aviso, lo_id, lo_seq, lo_corre, lo_est_aviso
string lo_tipo
string buscar

if sle_1.text='' /*or len(sle_1.text)<= 3*/ then 
	buscar='?' 
else
	buscar='%'+sle_1.text+'%'
	//messagebox('info', buscar)
end if

openwithparm(w_msg,"Procesando...")

// Filtro por comercial, OT24H o todos.
if cbx_1.checked=true then
	pa_agrupado.enabled = false
	dw_resol.dataobject="dw_resolucion_auto"
	dw_resol.settransobject(sqlca2)
	dw_resol.retrieve(g_cod_usuario, buscar, sle_2.text, sle_3.text, '?')
else
	pa_agrupado.enabled = true
	
	if(indexFiltro = 2) then
		//OT24H
		dw_resol.dataobject="dw_resolucion_auto2"
	ELSE
		dw_resol.dataobject="dw_resolucion_auto"
	end if
	
	dw_resol.settransobject(sqlca2)
	dw_resol.retrieve('?',buscar, sle_2.text, sle_3.text, filtroAviso)	
end if


//dw_resol.dataobject="dw_resolucion_auto"
//dw_resol.settransobject(sqlca2)

this.enabled=false

//f_update()

for i = 1 to dw_resol.rowcount()	
	f_alta=dw_resol.object.fecha_alta[i]
	nro_aviso=long(dw_resol.object.no_aviso[i])	
	lo_id=long(dw_resol.object.id[i])
	lo_seq=long(dw_resol.object.seq2[i])
	lo_corre=long(dw_resol.object.correlativo[i])
	lo_tipo=dw_resol.object.tipo[i]
	
	dw_resol.object.mensaje[i]='Procesando...'	
	dw_resol.selectrow(0,false)
	dw_resol.selectrow(i,true)
	dw_resol.scrolltorow(i)
	dw_resol.setrow(i)	
	
	if nro_aviso>0 then
		
		select fecha_res, est_aviso
		into :f_res, :lo_est_aviso
		from gi_avisos
		where nro_aviso=:nro_aviso
		using sqlca;			
						
		if sqlca.sqlcode=0  then
			
			if not isnull(f_res) = true then
				
				if f_res>= f_alta then
					
					//if lo_est_aviso <> 6 then
			
						/*actualizar en base de datos*/
						update registro
						set fecha_resolucion=:f_res
						where id=:lo_id
						and tipo=:lo_tipo
						and seq=:lo_seq
						and correlativo=:lo_corre
						using sqlca2;
									
						if sqlca2.sqlcode=0 then
							
							commit using sqlca2;
							
							/*escribir en bit$$HEX1$$e100$$ENDHEX$$cora de eventos*/						
							/*select sysdate
							into :hoy
							from dual
							using sqlca;						
							if isnull(hoy) then
								hoy=datetime(today(),now())
							end if
							insert into evento values(:lo_id, :lo_seq, :lo_tipo, :lo_corre, :g_cod_usuario, :hoy, 'Resoluci$$HEX1$$f300$$ENDHEX$$n con aviso(auto)')
							using sqlca;
							commit using sqlca;*/
							
							dw_resol.object.mensaje[i]='Ok.'
							dw_resol.object.fecha_resolucion[i]=f_res				
						else													
							dw_resol.object.mensaje[i]=SQLCA2.SQLErrText+ '. Resolver manualmente'														
						end if							
					//else
						//dw_resol.object.mensaje[i]='Aviso marcado como improcedente. Resolver manual'	
					//end if //aviso improcedente										
				else
					dw_resol.object.mensaje[i]='Fecha resoluci$$HEX1$$f300$$ENDHEX$$n SGI menor a fecha de alta OT24. Resolver manual'	
				end if //fecha resolucion menor a fecha alta										
			else
				dw_resol.object.mensaje[i]='Aviso no resuelto en SGI. Resolver manualmente'									
			end if //aviso existe pero no tiene fecha de resoluci$$HEX1$$f300$$ENDHEX$$n							
		else
			dw_resol.object.mensaje[i]='Aviso no encontrado. Resolver manualmente'
		end if //aviso no existe
	else
		dw_resol.object.mensaje[i]='No tiene aviso asociado. Resolver manualmente'
	end if  //aviso >0 
						
						
next

close(w_msg)
messagebox('Info', 'Proceso conclu$$HEX1$$ed00$$ENDHEX$$do')




//
//dw_resol.dataobject="dw_resolucion"
//dw_resol.settransobject(sqlca)
//f_update()
end event

type st_2 from statictext within w_resolucion
integer x = 210
integer y = 80
integer width = 1774
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
string text = "RESOLUCI$$HEX1$$d300$$ENDHEX$$N DE REGISTROS SLIR"
boolean focusrectangle = false
end type

type cb_excel from commandbutton within w_resolucion
integer x = 3936
integer y = 572
integer width = 343
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Excel"
end type

event clicked;dw_resol.SaveAs("", Excel! , TRUE)
end event

type cb_buscar from commandbutton within w_resolucion
integer x = 2734
integer y = 580
integer width = 343
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Buscar"
boolean default = true
end type

event clicked;dw_resol.dataobject="dw_resolucion"
dw_resol.settransobject(sqlca2)


f_update()

cb_auto.enabled=true
end event

type st_1 from statictext within w_resolucion
integer x = 128
integer y = 512
integer width = 1445
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
string text = "Ingrese texto y luego presione el bot$$HEX1$$f300$$ENDHEX$$n ~"Buscar~":"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_resolucion
integer x = 119
integer y = 312
integer width = 1161
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
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

type sle_1 from singlelineedit within w_resolucion
integer x = 128
integer y = 596
integer width = 2578
integer height = 124
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

type dw_resol from datawindow within w_resolucion
integer x = 73
integer y = 860
integer width = 5166
integer height = 1860
integer taborder = 10
string dataobject = "dw_resolucion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca2)
end event

event doubleclicked;long fila
string registro

THIS.SelectRow(0, FALSE)

THIS.SeLECTRow(row, TRUE)



fila=this.getrow()
this.scrolltorow(fila)


if fila>0 then


		registro=this.object.seq[fila]
		
		openwithparm(w_resolucion_manual,registro)
		
		//f_update()
		
		if not isnull(devuelve) then
			this.object.fecha_resolucion[fila]=devuelve
		end if
		
		
end if
end event

event clicked;
//THIS.SelectRow(0, FALSE)

GETFOCUS()


end event

type gb_1 from groupbox within w_resolucion
integer x = 114
integer y = 8
integer width = 5243
integer height = 184
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type


HA$PBExportHeader$w_resolucion_manual.srw
forward
global type w_resolucion_manual from window
end type
type cb_close from commandbutton within w_resolucion_manual
end type
type tab_1 from tab within w_resolucion_manual
end type
type tabpage_det from userobject within tab_1
end type
type cb_aviso from commandbutton within tabpage_det
end type
type st_aviso from statictext within tabpage_det
end type
type em_aviso from editmask within tabpage_det
end type
type cb_manual from commandbutton within tabpage_det
end type
type st_fecha from statictext within tabpage_det
end type
type em_fechares from editmask within tabpage_det
end type
type st_resnormal from statictext within tabpage_det
end type
type st_resaviso from statictext within tabpage_det
end type
type dw_det from datawindow within tabpage_det
end type
type tabpage_det from userobject within tab_1
cb_aviso cb_aviso
st_aviso st_aviso
em_aviso em_aviso
cb_manual cb_manual
st_fecha st_fecha
em_fechares em_fechares
st_resnormal st_resnormal
st_resaviso st_resaviso
dw_det dw_det
end type
type tab_1 from tab within w_resolucion_manual
tabpage_det tabpage_det
end type
end forward

global type w_resolucion_manual from window
integer x = 1326
integer y = 652
integer width = 3607
integer height = 2616
boolean titlebar = true
string title = "Resoluci$$HEX1$$f300$$ENDHEX$$n de registro OT24h (w_resolucion_manual)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 33554431
cb_close cb_close
tab_1 tab_1
end type
global w_resolucion_manual w_resolucion_manual

type variables
string registro


end variables

on w_resolucion_manual.create
this.cb_close=create cb_close
this.tab_1=create tab_1
this.Control[]={this.cb_close,&
this.tab_1}
end on

on w_resolucion_manual.destroy
destroy(this.cb_close)
destroy(this.tab_1)
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

event open;string aviso
datetime hoy

setnull(devuelve)

registro = Message.StringParm

tab_1.tabpage_det.dw_det.retrieve(registro)

tab_1.tabpage_det.em_aviso.text=tab_1.tabpage_det.dw_det.object.no_aviso[1]


	select sysdate
	into :hoy
	from dual
	using sqlca2;
						
	if isnull(hoy) then
			hoy=datetime(today(),now())
	end if


	tab_1.tabpage_det.em_fechares.text=string(hoy)
end event

type cb_close from commandbutton within w_resolucion_manual
integer x = 3168
integer y = 2216
integer width = 343
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Cerrar"
end type

event clicked;close(Parent)
end event

type tab_1 from tab within w_resolucion_manual
integer x = 14
integer y = 28
integer width = 3566
integer height = 2424
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long backcolor = 67108864
boolean raggedright = true
integer selectedtab = 1
tabpage_det tabpage_det
end type

on tab_1.create
this.tabpage_det=create tabpage_det
this.Control[]={this.tabpage_det}
end on

on tab_1.destroy
destroy(this.tabpage_det)
end on

type tabpage_det from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3529
integer height = 2296
long backcolor = 81324524
string text = "Registro OT24h"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
long picturemaskcolor = 536870912
cb_aviso cb_aviso
st_aviso st_aviso
em_aviso em_aviso
cb_manual cb_manual
st_fecha st_fecha
em_fechares em_fechares
st_resnormal st_resnormal
st_resaviso st_resaviso
dw_det dw_det
end type

on tabpage_det.create
this.cb_aviso=create cb_aviso
this.st_aviso=create st_aviso
this.em_aviso=create em_aviso
this.cb_manual=create cb_manual
this.st_fecha=create st_fecha
this.em_fechares=create em_fechares
this.st_resnormal=create st_resnormal
this.st_resaviso=create st_resaviso
this.dw_det=create dw_det
this.Control[]={this.cb_aviso,&
this.st_aviso,&
this.em_aviso,&
this.cb_manual,&
this.st_fecha,&
this.em_fechares,&
this.st_resnormal,&
this.st_resaviso,&
this.dw_det}
end on

on tabpage_det.destroy
destroy(this.cb_aviso)
destroy(this.st_aviso)
destroy(this.em_aviso)
destroy(this.cb_manual)
destroy(this.st_fecha)
destroy(this.em_fechares)
destroy(this.st_resnormal)
destroy(this.st_resaviso)
destroy(this.dw_det)
end on

type cb_aviso from commandbutton within tabpage_det
integer x = 2194
integer y = 1540
integer width = 343
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Resolver"
end type

event clicked;long lo_aviso, lo_nis
datetime f_res, f_alta, hoy
long lo_id, lo_seq, lo_corre, lo_est_aviso
string lo_tipo


if tab_1.tabpage_det.dw_det.rowcount()>=1 then

f_alta=datetime(tab_1.tabpage_det.dw_det.object.fecha_alta[1])
lo_nis=long(tab_1.tabpage_det.dw_det.object.nis[1])
lo_id=long(tab_1.tabpage_det.dw_det.object.id[1])
lo_seq=long(tab_1.tabpage_det.dw_det.object.seq2[1])
lo_corre=long(tab_1.tabpage_det.dw_det.object.correlativo[1])
lo_tipo=(tab_1.tabpage_det.dw_det.object.tipo[1])

lo_aviso=long(em_aviso.text)

if not isnull(em_aviso) and len(em_aviso.text)>1 then
	select fecha_res, est_aviso
	into :f_res, :lo_est_aviso
		from gi_avisos
		where nro_aviso=:lo_aviso
		and nis_rad=:lo_nis
		using sqlca;

	
	if sqlca.sqlcode=0  then
		if not isnull(f_res) = true then
					if f_res>= f_alta then
						if lo_est_aviso<>6 then
							
								/*actualizar en base de datos*/
								update registro
									set fecha_resolucion=:f_res,
									no_aviso=:lo_aviso
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
									
									insert into evento values(:lo_id, :lo_seq, :lo_tipo, :lo_corre, :g_cod_usuario, :hoy, 'Resoluci$$HEX1$$f300$$ENDHEX$$n con aviso(manual)')
									using sqlca;
									
									commit using sqlca;*/
									
		
									tab_1.tabpage_det.dw_det.retrieve(registro)
									messagebox("Info", "Actualizaci$$HEX1$$f300$$ENDHEX$$n completa!")
									
									devuelve=f_res
									
								
								else
								
								
									messagebox(SQLCA2.SQLErrText, "Error. Intentar resolver de forma manual")
									
								end if
								
							else
					
								messagebox("Info", "Aviso marcado como improcedente. Resolver manual")
					
						end if //aviso improcedente

					
				else

					messagebox("Info", "Fecha resoluci$$HEX1$$f300$$ENDHEX$$n SGI es menor a fecha de alta OT24h. Resolver manualmente")
				end if //fecha resolucion menor a fecha alta
					
			else
//				dw_resol.object.mensaje[i]='Aviso no resuelto en SGI. Resolver manualmente'

			messagebox("Info", "Aviso no resuelto en SGI. Resolver manualmente")
				
		end if //aviso existe pero no tiene fecha de resoluci$$HEX1$$f300$$ENDHEX$$n
		
	else

			messagebox("Info", "Aviso no encontrado. Resolver manualmente")
		

	end if //aviso no existe
	
else
			messagebox("Info", "Indique el n$$HEX1$$fa00$$ENDHEX$$mero de aviso")
end if //numero de aviso

end if //query devuelve al menos un reegistro

end event

type st_aviso from statictext within tabpage_det
integer x = 741
integer y = 1568
integer width = 480
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "N$$HEX1$$fa00$$ENDHEX$$mero de aviso:"
boolean focusrectangle = false
end type

type em_aviso from editmask within tabpage_det
integer x = 1367
integer y = 1544
integer width = 658
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##########"
end type

type cb_manual from commandbutton within tabpage_det
integer x = 2203
integer y = 1908
integer width = 343
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Resolver"
end type

event clicked;long lo_aviso, lo_nis
datetime f_res, f_alta, hoy
long lo_id, lo_seq, lo_corre
string lo_tipo



if not isnull(em_fechares.text) then
	
	


		if tab_1.tabpage_det.dw_det.rowcount()>=1 then
		
				f_alta=datetime(tab_1.tabpage_det.dw_det.object.fecha_alta[1])
				lo_nis=long(tab_1.tabpage_det.dw_det.object.nis[1])
				lo_id=long(tab_1.tabpage_det.dw_det.object.id[1])
				lo_seq=long(tab_1.tabpage_det.dw_det.object.seq2[1])
				lo_corre=long(tab_1.tabpage_det.dw_det.object.correlativo[1])
				lo_tipo=(tab_1.tabpage_det.dw_det.object.tipo[1])
				
				em_fechares.getdata(f_res)
				
				
				if f_res>= f_alta then
						
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
							
							insert into evento values(:lo_id, :lo_seq, :lo_tipo, :lo_corre, :g_cod_usuario, :hoy, 'Resoluci$$HEX1$$f300$$ENDHEX$$n manual')
							using sqlca;
							
							commit using sqlca;*/
							

							tab_1.tabpage_det.dw_det.retrieve(registro)
							messagebox("Info", "Actualizaci$$HEX1$$f300$$ENDHEX$$n completa!")
							close(w_resolucion_manual)
							
							devuelve=f_res
							
						
						else
						
						
							messagebox(SQLCA2.SQLErrText, "Error al actualizar")
							
						end if

					
				else

					messagebox("Info", "Fecha resoluci$$HEX1$$f300$$ENDHEX$$n  es menor a fecha de alta OT24h. Revisar fecha de resoluci$$HEX1$$f300$$ENDHEX$$n")
				end if //fecha resolucion menor a fecha alta
				
		
		end if

else
	
	messagebox("Info", "Defina fecha/hora de resoluci$$HEX1$$f300$$ENDHEX$$n")
	
end if //no es nulo
end event

type st_fecha from statictext within tabpage_det
integer x = 741
integer y = 1940
integer width = 567
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Fecha de resoluci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

type em_fechares from editmask within tabpage_det
integer x = 1367
integer y = 1908
integer width = 658
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type st_resnormal from statictext within tabpage_det
integer x = 187
integer y = 1792
integer width = 475
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Resolver manual"
boolean focusrectangle = false
end type

type st_resaviso from statictext within tabpage_det
integer x = 192
integer y = 1480
integer width = 567
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Resolver con AVISO"
boolean focusrectangle = false
end type

type dw_det from datawindow within tabpage_det
integer x = 32
integer y = 20
integer width = 3392
integer height = 1344
integer taborder = 10
string dataobject = "dw_resol_manual"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca2)
end event


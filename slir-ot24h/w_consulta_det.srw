HA$PBExportHeader$w_consulta_det.srw
forward
global type w_consulta_det from window
end type
type tab_1 from tab within w_consulta_det
end type
type tabpage_det from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_det
end type
type cb_1 from commandbutton within tabpage_det
end type
type dw_det from datawindow within tabpage_det
end type
type tabpage_det from userobject within tab_1
cb_2 cb_2
cb_1 cb_1
dw_det dw_det
end type
type tabpage_sgi from userobject within tab_1
end type
type dw_sgi from datawindow within tabpage_sgi
end type
type tabpage_sgi from userobject within tab_1
dw_sgi dw_sgi
end type
type tabpage_sgc from userobject within tab_1
end type
type dw_sgc from datawindow within tabpage_sgc
end type
type tabpage_sgc from userobject within tab_1
dw_sgc dw_sgc
end type
type tab_1 from tab within w_consulta_det
tabpage_det tabpage_det
tabpage_sgi tabpage_sgi
tabpage_sgc tabpage_sgc
end type
end forward

global type w_consulta_det from window
integer x = 18
integer y = 40
integer width = 3607
integer height = 2740
boolean titlebar = true
string title = "Consulta de registros (w_consulta_det)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 33554431
tab_1 tab_1
end type
global w_consulta_det w_consulta_det

on w_consulta_det.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_consulta_det.destroy
destroy(this.tab_1)
end on

event open;string registro, aviso, u_usuario, reclamo



// Center a window based on the screen dimensions.

environment le_env
int screenheight, screenwidth
 
/* get screen measurements */
 
GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)
 
/* now position window */
 
this.Move( (ScreenWidth - this.Width) / 2, (ScreenHeight - this.Height) / 2 )











registro = Message.StringParm

tab_1.tabpage_det.dw_det.retrieve(registro)

if tab_1.tabpage_det.dw_det.rowcount()>0 then

	aviso=tab_1.tabpage_det.dw_det.object.no_aviso[1]

	if isnull(aviso) = false then
		
		tab_1.tabpage_sgi.dw_sgi.retrieve(aviso)
		
		if tab_1.tabpage_sgi.dw_sgi.rowcount()>0 then
				tab_1.tabpage_sgi.text='Aviso SGI ('+string(tab_1.tabpage_sgi.dw_sgi.rowcount())+')'
			else
				tab_1.tabpage_sgi.text='Aviso SGI'
		end if
	end if
	
	reclamo=tab_1.tabpage_det.dw_det.object.no_reclamo[1]
	
	
	if isnull(reclamo) = false then
		tab_1.tabpage_sgc.dw_sgc.retrieve(reclamo)
		
		if tab_1.tabpage_sgc.dw_sgc.rowcount()>0 then
				tab_1.tabpage_sgc.text='Reclamo SGC ('+string(tab_1.tabpage_sgc.dw_sgc.rowcount())+')'
			else
				tab_1.tabpage_sgc.text='Reclamo SGC'
		end if
	end if
	
	
	
	if g_credenciales='SPV' then
	
			tab_1.tabpage_det.cb_1.enabled=true
			tab_1.tabpage_det.dw_det.object.cod_causa.protect=0
			tab_1.tabpage_det.dw_det.object.observaciones.protect=0
			
		else
			
			tab_1.tabpage_det.dw_det.object.cod_causa.protect=1
			tab_1.tabpage_det.dw_det.object.observaciones.protect=1
			
			
			
			u_usuario=tab_1.tabpage_det.dw_det.object.cod_usuario[1]
			
			
			
			if u_usuario=g_cod_usuario then
				/*si el registro pertenece al mismo usuario, s$$HEX2$$ed002000$$ENDHEX$$puede habilitar bot$$HEX1$$f300$$ENDHEX$$n de grabar
				y campo de observaciones. Solo el supervisor puede cambiar la causa*/
				
				tab_1.tabpage_det.cb_1.enabled=true
				tab_1.tabpage_det.dw_det.object.observaciones.protect=0
				
			end if
			
	end if
	
	
	
	
end if
end event

type tab_1 from tab within w_consulta_det
integer x = 14
integer y = 28
integer width = 3502
integer height = 2584
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
tabpage_sgi tabpage_sgi
tabpage_sgc tabpage_sgc
end type

on tab_1.create
this.tabpage_det=create tabpage_det
this.tabpage_sgi=create tabpage_sgi
this.tabpage_sgc=create tabpage_sgc
this.Control[]={this.tabpage_det,&
this.tabpage_sgi,&
this.tabpage_sgc}
end on

on tab_1.destroy
destroy(this.tabpage_det)
destroy(this.tabpage_sgi)
destroy(this.tabpage_sgc)
end on

type tabpage_det from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3465
integer height = 2456
long backcolor = 81324524
string text = "Registro OT24h"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
long picturemaskcolor = 536870912
cb_2 cb_2
cb_1 cb_1
dw_det dw_det
end type

on tabpage_det.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_det=create dw_det
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_det}
end on

on tabpage_det.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_det)
end on

type cb_2 from commandbutton within tabpage_det
integer x = 2917
integer y = 2304
integer width = 343
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
string text = "Cerrar"
end type

event clicked;close(w_consulta_det)
end event

type cb_1 from commandbutton within tabpage_det
integer x = 1618
integer y = 2304
integer width = 343
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
boolean enabled = false
string text = "Grabar"
end type

event clicked;string s_observac, s_tipo, s_causa
long l_id, l_seq, l_corre, l_cod_causa
datetime hoy

if tab_1.tabpage_det.dw_det.rowcount()<> 1 then
	messagebox('SLIR', 'Error inesperado')
else
	
	tab_1.tabpage_det.dw_det.accepttext()
	
	
	s_observac=tab_1.tabpage_det.dw_det.object.observaciones[1]
	
	
	
	
	s_tipo=tab_1.tabpage_det.dw_det.object.tipo[1]
	l_id=tab_1.tabpage_det.dw_det.object.id[1]
	l_seq=tab_1.tabpage_det.dw_det.object.seq2[1]
	l_corre=tab_1.tabpage_det.dw_det.object.correlativo[1]
	l_cod_causa=tab_1.tabpage_det.dw_det.object.cod_causa[1]
	
	/*ir a traer descripcion de la causa*/
	
	select descripcion
	into :s_causa
	from causa
	where codigo=:l_cod_causa
	using sqlca2;
	
	
	
	
	//s_causa=tab_1.tabpage_det.dw_det.object.cod_causa[1]
	
	
	
	
	
	update registro
	set observaciones=:s_observac,
		 cod_causa=:l_cod_causa,
		 nom_causa=:s_causa
	where tipo=:s_tipo and
	id=:l_id and
	seq=:l_seq and
	correlativo=:l_corre
	using sqlca2;
	
	if sqlca2.sqlcode<>0 then
		messagebox(sqlca2.sqlerrtext, 'No se pudo actualizar')
	else
		commit using sqlca2;
		
		
							/*escribir en bit$$HEX1$$e100$$ENDHEX$$cora de eventos*/
							
							
							/*select sysdate
							into :hoy
							from dual
							using sqlca;
							
							if isnull(hoy) then
								hoy=datetime(today(),now())
							end if
							
							insert into evento values(:l_id, :l_seq, :s_tipo, :l_corre, :g_cod_usuario, :hoy, 'Modificaci$$HEX1$$f300$$ENDHEX$$n observaciones')
							using sqlca;
							
							commit using sqlca;*/
		
		
							messagebox('SLIR', 'Actualizado!')
	end if
	
	
	
end if
end event

type dw_det from datawindow within tabpage_det
integer x = 27
integer y = 12
integer width = 3392
integer height = 2272
integer taborder = 10
string dataobject = "dw_consulta_deta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca2)
end event

event itemchanged;this.accepttext()

end event

type tabpage_sgi from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3465
integer height = 2456
long backcolor = 81324524
string text = "Aviso SGI"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
long picturemaskcolor = 536870912
dw_sgi dw_sgi
end type

on tabpage_sgi.create
this.dw_sgi=create dw_sgi
this.Control[]={this.dw_sgi}
end on

on tabpage_sgi.destroy
destroy(this.dw_sgi)
end on

type dw_sgi from datawindow within tabpage_sgi
integer x = 32
integer y = 20
integer width = 3392
integer height = 2368
integer taborder = 20
string dataobject = "dw_avisos_6"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type tabpage_sgc from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3465
integer height = 2456
long backcolor = 81324524
string text = "Reclamo SGC"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
long picturemaskcolor = 536870912
dw_sgc dw_sgc
end type

on tabpage_sgc.create
this.dw_sgc=create dw_sgc
this.Control[]={this.dw_sgc}
end on

on tabpage_sgc.destroy
destroy(this.dw_sgc)
end on

type dw_sgc from datawindow within tabpage_sgc
integer x = 32
integer y = 20
integer width = 3392
integer height = 2368
integer taborder = 10
string dataobject = "dw_reclamos_con"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event


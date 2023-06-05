HA$PBExportHeader$w_2030_estadisticas.srw
forward
global type w_2030_estadisticas from w_sgigenerica
end type
type tab_1 from u_tab_2030_pr_estadisticas_por_aviso within w_2030_estadisticas
end type
type tab_1 from u_tab_2030_pr_estadisticas_por_aviso within w_2030_estadisticas
end type
end forward

global type w_2030_estadisticas from w_sgigenerica
integer x = 9
integer y = 4
integer width = 3529
integer height = 2104
string title = "OPEN SGI - Estadisticas de Avisos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 79741120
string icon = "estad.ico"
tab_1 tab_1
end type
global w_2030_estadisticas w_2030_estadisticas

type variables
u_generico_comunicaciones iuo_gen_comunic1
end variables

on w_2030_estadisticas.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_2030_estadisticas.destroy
call super::destroy
destroy(this.tab_1)
end on

event close;call super::close;Destroy tab_1.iu_gen_gra_nu
destroy iuo_gen_comunic1
end event

event open;call super::open;SETPOINTER(HOURGLASS!)

iuo_gen_comunic1 = CREATE u_generico_comunicaciones


this.title = iuo_gen_comunic1.f_titulo_ventana("w_2030","Estadistica")
tab_1.int_horario.em_fecha.text = String(Today())+" "
tab_1.int_horario.dw_tipo.insertrow(0)
//tab_1.int_horario.dw_tipo.setitem(1,'tipo_aviso',0)
tab_1.int_horario.dw_tipo.setitem(1,'tipo_alim',0)
// como se ha puesto como clase aviso:<Todos> , se deshabilita la alimentaci$$HEX1$$f300$$ENDHEX$$n
tab_1.int_horario.dw_tipo.object.tipo_alim.protect=1
tab_1.int_horario.dw_tipo.object.tipo_alim.background.color=gs_gris

tab_1.avisos_pendientes.dw_tipo_pend.insertrow(0)
//tab_1.avisos_pendientes.dw_tipo_pend.setitem(1,'tipo_aviso',0)
tab_1.avisos_pendientes.dw_tipo_pend.setitem(1,'tipo_alim',0)
// como se ha puesto como clase aviso:<Todos> , se deshabilita la alimentaci$$HEX1$$f300$$ENDHEX$$n
tab_1.avisos_pendientes.dw_tipo_pend.object.tipo_alim.protect=1
tab_1.avisos_pendientes.dw_tipo_pend.object.tipo_alim.background.color=gs_gris

tab_1.in_fila_ant = 1
tab_1.in_nro_nivel = 0
tab_1.in_open = 1
tab_1.id_fec_ant = Today()
tab_1.f_habilito_campos(tab_1.in_nro_nivel)
tab_1.int_horario.dw_esta_avisos.modify("Datawindow,grid.columnmove=NO")
triggerevent("ue_postopen")
tab_1.int_horario.gr_1.visible=false
tab_1.int_horario.em_fecha.setfocus()
tab_1.avisos_pendientes.gr_2.settransobject(sqlca)

// SMB 01/10/2007 Cambio la forma de rellenar el combo 'Clase de Aviso'
datawindowchild ldwch_clase_avi,ldwch_clase2_avi
tab_1.int_horario.dw_tipo.getchild('tipo_aviso',ldwch_clase_avi)
ldwch_clase_avi.settransobject(sqlca)
ldwch_clase_avi.retrieve('C_AV')
ldwch_clase_avi.insertrow(1)
ldwch_clase_avi.setitem(1,'codigo',101)
ldwch_clase_avi.setitem(1,'descripcion','<Todos>')
tab_1.int_horario.dw_tipo.setitem(1,'tipo_aviso',101)

tab_1.avisos_pendientes.dw_tipo_pend.getchild('tipo_aviso',ldwch_clase2_avi)
ldwch_clase2_avi.settransobject(sqlca)
ldwch_clase2_avi.retrieve('C_AV')
ldwch_clase2_avi.insertrow(1)
ldwch_clase2_avi.setitem(1,'codigo',101)
ldwch_clase2_avi.setitem(1,'descripcion','<Todos>')
tab_1.avisos_pendientes.dw_tipo_pend.setitem(1,'tipo_aviso',101)


x = 9
y = 4
//Certificaci$$HEX1$$f300$$ENDHEX$$n windows XP
//width = 3630
width = 3600
height = 2020

end event

event ue_postopen;call super::ue_postopen;//tab_1.int_horario.dw_esta_avisos.triggerevent("ue_primera_vez")
datawindowchild ddw_usuario_child,ddw_usuario_pend_child
tab_1.int_horario.dw_usuario.GetChild('usuario',ddw_usuario_child)
tab_1.avisos_pendientes.dw_usuario_DUR.GetChild('usuario',ddw_usuario_pend_child)
ddw_usuario_child.SetTransObject(sqlca)
ddw_usuario_child.Retrieve()
ddw_usuario_pend_child.SetTransObject(sqlca)
ddw_usuario_pend_child.Retrieve()
tab_1.int_horario.dw_usuario.insertrow(0)
tab_1.int_horario.dw_usuario.object.usuario.background.color=gs_gris
tab_1.avisos_pendientes.dw_usuario_DUR.insertrow(0)
tab_1.avisos_pendientes.dw_usuario_DUR.object.usuario.background.color=gs_gris
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2030_estadisticas
end type

type tab_1 from u_tab_2030_pr_estadisticas_por_aviso within w_2030_estadisticas
integer x = 27
integer y = 44
integer width = 3488
integer height = 1848
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
end type


HA$PBExportHeader$w_shared.srw
forward
global type w_shared from window
end type
type ds_estados_descargo_t from datawindow within w_shared
end type
type ds_estado_ot from datawindow within w_shared
end type
type ds_tension_inc_inc from datawindow within w_shared
end type
type ds_tipo_instalacion_t from datawindow within w_shared
end type
type ds_causa_incidencia_t from datawindow within w_shared
end type
type ds_prioridad_t from datawindow within w_shared
end type
type ds_estado_aviso_t from datawindow within w_shared
end type
type ds_alcance_aviso_t_shared from datawindow within w_shared
end type
type ds_tipo_aviso_t_shared from datawindow within w_shared
end type
type ds_int_horario_shared from datawindow within w_shared
end type
type ds_material_averiado_shared from datawindow within w_shared
end type
type ds_estado_incidencia_t_shared from datawindow within w_shared
end type
type ds_mesa_shared from datawindow within w_shared
end type
type ds_tipo_incidencia_t_shared from datawindow within w_shared
end type
type ds_tension_incidencia_t_shared from datawindow within w_shared
end type
type ds_estado_mantenimiento_t_shared from datawindow within w_shared
end type
type ds_estado_incidencia_t from datawindow within w_shared
end type
type ds_cmd_shared from datawindow within w_shared
end type
type ds_centro_shared from datawindow within w_shared
end type
type systemtime from structure within w_shared
end type
end forward

type systemtime from structure
	unsignedinteger		wyear
	unsignedinteger		wmonth
	unsignedinteger		wdayofweek
	unsignedinteger		wday
	unsignedinteger		whour
	unsignedinteger		wminute
	unsignedinteger		wsecond
	unsignedinteger		wmilliseconds
end type

global type w_shared from window
integer width = 3653
integer height = 2400
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 81324524
ds_estados_descargo_t ds_estados_descargo_t
ds_estado_ot ds_estado_ot
ds_tension_inc_inc ds_tension_inc_inc
ds_tipo_instalacion_t ds_tipo_instalacion_t
ds_causa_incidencia_t ds_causa_incidencia_t
ds_prioridad_t ds_prioridad_t
ds_estado_aviso_t ds_estado_aviso_t
ds_alcance_aviso_t_shared ds_alcance_aviso_t_shared
ds_tipo_aviso_t_shared ds_tipo_aviso_t_shared
ds_int_horario_shared ds_int_horario_shared
ds_material_averiado_shared ds_material_averiado_shared
ds_estado_incidencia_t_shared ds_estado_incidencia_t_shared
ds_mesa_shared ds_mesa_shared
ds_tipo_incidencia_t_shared ds_tipo_incidencia_t_shared
ds_tension_incidencia_t_shared ds_tension_incidencia_t_shared
ds_estado_mantenimiento_t_shared ds_estado_mantenimiento_t_shared
ds_estado_incidencia_t ds_estado_incidencia_t
ds_cmd_shared ds_cmd_shared
ds_centro_shared ds_centro_shared
end type
global w_shared w_shared

type prototypes
Function Long SetLocalTime  (SYSTEMTIME lpSystemTime) Library "kernel32.dll" alias for "SetLocalTime;Ansi"

end prototypes

type variables
u_generico_comunicaciones iu_2102_comunic // local de trabajo con ventana
end variables

forward prototypes
public function integer fnu_conectar_estado_incidencia (ref datawindow pd_dw)
end prototypes

public function integer fnu_conectar_estado_incidencia (ref datawindow pd_dw);ds_estado_incidencia_t.sharedata(pd_dw)
return 1
end function

event open;//datawindow ddw_tension_incidencia_t //ANG
long ll_sgt
string ls_filtro

datawindow dddw_estado_ot

gs_ventana_nombre="w_shared"

if NOT gu_comunic.fnu_cargar_vector_open(THIS,gs_ventana_nombre) then
//		close(THIS)
end if

ds_tipo_instalacion_t.settransobject(sqlca)
ds_tipo_instalacion_t.retrieve()
ddw_tipo_ins_t_shared = ds_tipo_instalacion_t

ds_estados_descargo_t.settransobject(sqlca)

// COMIENZO ALE
IF gb_openbdi or gb_operaciones THEN
	ll_sgt = 13
else
	ll_sgt = 9
end if
// FINAL ALE


if gb_openbdi or gb_operaciones  then  // EXISTE BDI
   ls_filtro = "CODIGO IN ("+string(fgci_descargo_activado) + ","+&
	string(fgci_descargo_actualizado_BDI ) + ","+ string(fgci_descargo_agrupado ) + ","+&
	string(fgci_descargo_anulado ) + ","+&
	string(fgci_descargo_aplazado) + ","+&
	string(fgci_descargo_aprobado ) + ","+&
	string(fgci_descargo_definido ) + ","+&
	string(fgci_descargo_finalizado) + ","+&
	string(fgci_descargo_modificado ) + ","+&
	string(fgci_descargo_no_activado ) + ","+& 
	string(fgci_descargo_pendiente_BDI ) + ","+&
	string(fgci_descargo_pendiente_pta_servicio ) + ","+&
	string(fgci_descargo_rechazado ) + ","+&
	string(fgci_descargo_rechazado_BDI ) + ","+&
	string(fgci_todos) + ","+&
	string(fgci_descargo_solicitado) +")"
else
  ls_filtro = "CODIGO IN ("+string(fgci_descargo_activado) + ","+&
	string(fgci_descargo_agrupado ) + ","+&
	string(fgci_descargo_anulado ) + ","+&
	string(fgci_descargo_aplazado) + ","+&
	string(fgci_descargo_aprobado ) + ","+&
	string(fgci_descargo_definido ) + ","+&
	string(fgci_descargo_finalizado) + ","+&
	string(fgci_descargo_modificado ) + ","+&
	string(fgci_descargo_no_activado ) + ","+& 
	string(fgci_todos) + ","+&
	string(fgci_descargo_rechazado ) + ","+&
	string(fgci_descargo_solicitado) +")"
end if

ds_estados_descargo_t.retrieve(20)
ds_estados_descargo_t.setfilter(ls_filtro)
ds_estados_descargo_t.filter()
ddw_estados_descargo_t_shared = ds_estados_descargo_t

//w_barra_standart.ole_barra.object.value = 24 // FDO

ds_causa_incidencia_t.settransobject(sqlca)
ds_causa_incidencia_t.retrieve()
ddw_causa_incidencia_t_shared = ds_causa_incidencia_t

//w_barra_standart.ole_barra.object.value = 28 // FDO

ds_tipo_aviso_t_shared.settransobject(sqlca)
ds_tipo_aviso_t_shared.retrieve()
ddw_tipo_aviso_t_shared = ds_tipo_aviso_t_shared

//w_barra_standart.ole_barra.object.value = 32 // FDO
	
ds_estado_aviso_t.settransobject(sqlca)
ds_estado_aviso_t.retrieve()
ddw_estado_aviso_t_shared = ds_estado_aviso_t

//w_barra_standart.ole_barra.object.value = 36 // FDO

ds_prioridad_t.settransobject(sqlca)
ds_prioridad_t.retrieve()
ddw_prioridad_t_shared = ds_prioridad_t

//w_barra_standart.ole_barra.object.value = 40 // FDO

ds_alcance_aviso_t_shared.settransobject(sqlca)
ds_alcance_aviso_t_shared.retrieve()
ddw_alcance_aviso_t_shared = ds_alcance_aviso_t_shared

//w_barra_standart.ole_barra.object.value = 44 // FDO

ds_material_averiado_shared.settransobject(sqlca)
ds_material_averiado_shared.retrieve()
ddw_material_averiado_shared = ds_material_averiado_shared

//w_barra_standart.ole_barra.object.value = 48 // FDO

ds_int_horario_shared.settransobject(sqlca)
ds_int_horario_shared.retrieve()
ddw_int_horario_shared = ds_int_horario_shared

//w_barra_standart.ole_barra.object.value = 52 // FDO

ds_estado_incidencia_t_shared.settransobject(sqlca)
ds_estado_incidencia_t_shared.retrieve()
ddw_estado_incidencia_t_shared = ds_estado_incidencia_t_shared

//w_barra_standart.ole_barra.object.value = 56 // FDO

ds_estado_mantenimiento_t_shared.settransobject(sqlca)
ds_estado_mantenimiento_t_shared.retrieve()
ddw_estado_mantenimiento_t_shared = ds_estado_mantenimiento_t_shared

//w_barra_standart.ole_barra.object.value = 60 // FDO

ds_tension_incidencia_t_shared.settransobject(sqlca)
ds_tension_incidencia_t_shared.retrieve()
ddw_tension_incidencia_t_shared = ds_tension_incidencia_t_shared

//w_barra_standart.ole_barra.object.value = 65 // FDO
	
ds_tension_inc_inc.settransobject(sqlca)
ds_tension_inc_inc.retrieve()
ddw_tension_incidencia_total = ds_tension_inc_inc

//w_barra_standart.ole_barra.object.value = 70 // FDO

ds_tipo_incidencia_t_shared.settransobject(sqlca)

ds_tipo_incidencia_t_shared.retrieve()
ddw_tipo_incidencia_t_shared = ds_tipo_incidencia_t_shared

//w_barra_standart.ole_barra.object.value = 75 // FDO
 
ds_centro_shared.settransobject(sqlca)
ds_centro_shared.retrieve(0)
ddw_centro_shared = ds_centro_shared

//w_barra_standart.ole_barra.object.value = 80 // FDO

ds_cmd_shared.settransobject(sqlca)
ds_cmd_shared.retrieve(1)
ddw_cmd_shared = ds_cmd_shared

//w_barra_standart.ole_barra.object.value = 85 // FDO

ds_mesa_shared.settransobject(sqlca)
ds_mesa_shared.retrieve(0,0)
ddw_mesa_shared = ds_mesa_shared

//w_barra_standart.ole_barra.object.value = 90 // FDO

ds_estado_ot.settransobject(sqlca)
ds_estado_ot.retrieve()
dddw_estado_ot = ds_estado_ot

//w_barra_standart.ole_barra.object.value = 95 // FDO

////THIS.VISIBLE = FALSE
//IF GS_PROGRAMA_PRINCIPAL = "w_operaciones" then
////	close(w_arranque_operaciones)
//	OPEN(W_OPERACIONES)
//else
//	if gs_programa_principal = "w_prin" then
////		close(w_arranque_telegestiones)
//		open(w_prin)
//	end if
//end if

this.visible = false

//Ajusta la hora local de la maquina respecto al servidor ORACLE

//string ls_programa
//ls_programa="Hora.Bat "+String(Time(ldt_fecha))
//run (ls_programa,minimized!)

//Version nueva de ajuste de hora, utiliza una funcion externa
systemtime fecha
datetime ldt_fecha

select sysdate into:ldt_fecha from dual;

fecha.wYear = year(date(ldt_fecha))
fecha.wMonth = month(date(ldt_fecha))
fecha.wDay = day(date(ldt_fecha))
fecha.wHour = hour(time(ldt_fecha))
fecha.wMinute = minute(time(ldt_fecha))
fecha.wSecond = second(time(ldt_fecha))
fecha.wMilliseconds = 0

SetLocalTime(fecha)

//w_barra_standart.ole_barra.object.value = 100 // FDO

close(w_barra_standart)
end event

on w_shared.create
this.ds_estados_descargo_t=create ds_estados_descargo_t
this.ds_estado_ot=create ds_estado_ot
this.ds_tension_inc_inc=create ds_tension_inc_inc
this.ds_tipo_instalacion_t=create ds_tipo_instalacion_t
this.ds_causa_incidencia_t=create ds_causa_incidencia_t
this.ds_prioridad_t=create ds_prioridad_t
this.ds_estado_aviso_t=create ds_estado_aviso_t
this.ds_alcance_aviso_t_shared=create ds_alcance_aviso_t_shared
this.ds_tipo_aviso_t_shared=create ds_tipo_aviso_t_shared
this.ds_int_horario_shared=create ds_int_horario_shared
this.ds_material_averiado_shared=create ds_material_averiado_shared
this.ds_estado_incidencia_t_shared=create ds_estado_incidencia_t_shared
this.ds_mesa_shared=create ds_mesa_shared
this.ds_tipo_incidencia_t_shared=create ds_tipo_incidencia_t_shared
this.ds_tension_incidencia_t_shared=create ds_tension_incidencia_t_shared
this.ds_estado_mantenimiento_t_shared=create ds_estado_mantenimiento_t_shared
this.ds_estado_incidencia_t=create ds_estado_incidencia_t
this.ds_cmd_shared=create ds_cmd_shared
this.ds_centro_shared=create ds_centro_shared
this.Control[]={this.ds_estados_descargo_t,&
this.ds_estado_ot,&
this.ds_tension_inc_inc,&
this.ds_tipo_instalacion_t,&
this.ds_causa_incidencia_t,&
this.ds_prioridad_t,&
this.ds_estado_aviso_t,&
this.ds_alcance_aviso_t_shared,&
this.ds_tipo_aviso_t_shared,&
this.ds_int_horario_shared,&
this.ds_material_averiado_shared,&
this.ds_estado_incidencia_t_shared,&
this.ds_mesa_shared,&
this.ds_tipo_incidencia_t_shared,&
this.ds_tension_incidencia_t_shared,&
this.ds_estado_mantenimiento_t_shared,&
this.ds_estado_incidencia_t,&
this.ds_cmd_shared,&
this.ds_centro_shared}
end on

on w_shared.destroy
destroy(this.ds_estados_descargo_t)
destroy(this.ds_estado_ot)
destroy(this.ds_tension_inc_inc)
destroy(this.ds_tipo_instalacion_t)
destroy(this.ds_causa_incidencia_t)
destroy(this.ds_prioridad_t)
destroy(this.ds_estado_aviso_t)
destroy(this.ds_alcance_aviso_t_shared)
destroy(this.ds_tipo_aviso_t_shared)
destroy(this.ds_int_horario_shared)
destroy(this.ds_material_averiado_shared)
destroy(this.ds_estado_incidencia_t_shared)
destroy(this.ds_mesa_shared)
destroy(this.ds_tipo_incidencia_t_shared)
destroy(this.ds_tension_incidencia_t_shared)
destroy(this.ds_estado_mantenimiento_t_shared)
destroy(this.ds_estado_incidencia_t)
destroy(this.ds_cmd_shared)
destroy(this.ds_centro_shared)
end on

type ds_estados_descargo_t from datawindow within w_shared
integer x = 1824
integer y = 496
integer width = 178
integer height = 148
integer taborder = 161
string dataobject = "dddw_estado_descargos"
boolean livescroll = true
end type

type ds_estado_ot from datawindow within w_shared
boolean visible = false
integer x = 983
integer y = 912
integer width = 494
integer height = 360
integer taborder = 20
string dataobject = "dddw_estado_ot"
boolean livescroll = true
end type

type ds_tension_inc_inc from datawindow within w_shared
boolean visible = false
integer x = 434
integer y = 928
integer width = 357
integer height = 256
integer taborder = 160
string dataobject = "ddw_tension_incidencia"
boolean livescroll = true
end type

type ds_tipo_instalacion_t from datawindow within w_shared
boolean visible = false
integer x = 37
integer y = 928
integer width = 311
integer height = 256
integer taborder = 150
string dataobject = "ddw_tipo_instalacion"
boolean livescroll = true
end type

type ds_causa_incidencia_t from datawindow within w_shared
boolean visible = false
integer x = 1723
integer y = 676
integer width = 302
integer height = 204
integer taborder = 140
string dataobject = "ddw_causa_incidencia"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type ds_prioridad_t from datawindow within w_shared
integer x = 1280
integer y = 656
integer width = 229
integer height = 200
integer taborder = 130
string dataobject = "ddw_prioridad"
boolean livescroll = true
end type

type ds_estado_aviso_t from datawindow within w_shared
integer x = 891
integer y = 648
integer width = 274
integer height = 208
integer taborder = 120
string dataobject = "ddw_estado_aviso"
boolean livescroll = true
end type

type ds_alcance_aviso_t_shared from datawindow within w_shared
boolean visible = false
integer x = 457
integer y = 648
integer width = 283
integer height = 212
integer taborder = 110
string dataobject = "ddw_alcance_aviso_t"
boolean border = false
boolean livescroll = true
end type

type ds_tipo_aviso_t_shared from datawindow within w_shared
boolean visible = false
integer x = 41
integer y = 648
integer width = 283
integer height = 212
integer taborder = 100
string dataobject = "ddw_tipo_aviso_t"
boolean border = false
boolean livescroll = true
end type

type ds_int_horario_shared from datawindow within w_shared
boolean visible = false
integer x = 1335
integer y = 32
integer width = 283
integer height = 212
integer taborder = 40
string dataobject = "ddw_int_horario"
boolean border = false
boolean livescroll = true
end type

type ds_material_averiado_shared from datawindow within w_shared
boolean visible = false
integer x = 41
integer y = 32
integer width = 283
integer height = 212
integer taborder = 50
string dataobject = "ddw_material_averiado_shared"
boolean border = false
boolean livescroll = true
end type

type ds_estado_incidencia_t_shared from datawindow within w_shared
boolean visible = false
integer x = 462
integer y = 32
integer width = 283
integer height = 212
integer taborder = 30
string dataobject = "ddw_estado_incidencia_t_shared"
boolean border = false
boolean livescroll = true
end type

type ds_mesa_shared from datawindow within w_shared
boolean visible = false
integer x = 462
integer y = 340
integer width = 283
integer height = 212
integer taborder = 90
string dataobject = "ddw_mesa"
boolean border = false
boolean livescroll = true
end type

type ds_tipo_incidencia_t_shared from datawindow within w_shared
boolean visible = false
integer x = 1723
integer y = 36
integer width = 283
integer height = 212
integer taborder = 60
string dataobject = "ddw_tipo_incidencia_t"
boolean border = false
boolean livescroll = true
end type

type ds_tension_incidencia_t_shared from datawindow within w_shared
boolean visible = false
integer x = 1298
integer y = 340
integer width = 283
integer height = 212
integer taborder = 70
string dataobject = "ddw_tension_incidencia_t"
boolean border = false
boolean livescroll = true
end type

type ds_estado_mantenimiento_t_shared from datawindow within w_shared
boolean visible = false
integer x = 891
integer y = 32
integer width = 283
integer height = 212
integer taborder = 80
string dataobject = "ddw_estado_mantenimiento_t"
boolean border = false
boolean livescroll = true
end type

type ds_estado_incidencia_t from datawindow within w_shared
boolean visible = false
integer x = 882
integer y = 340
integer width = 283
integer height = 212
integer taborder = 10
string dataobject = "ddw_estado_incidencia_t"
boolean border = false
boolean livescroll = true
end type

type ds_cmd_shared from datawindow within w_shared
boolean visible = false
integer x = 1723
integer y = 340
integer width = 283
integer height = 212
integer taborder = 170
string dataobject = "ddw_cmd"
boolean border = false
boolean livescroll = true
end type

type ds_centro_shared from datawindow within w_shared
boolean visible = false
integer x = 55
integer y = 340
integer width = 283
integer height = 212
integer taborder = 180
string dataobject = "ddw_centro"
boolean border = false
boolean livescroll = true
end type


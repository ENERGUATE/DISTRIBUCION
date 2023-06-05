HA$PBExportHeader$w_3202_mantenimiento_suministros_imp.srw
forward
global type w_3202_mantenimiento_suministros_imp from w_3201_mantenimiento_suministros_imp
end type
end forward

global type w_3202_mantenimiento_suministros_imp from w_3201_mantenimiento_suministros_imp
WindowType WindowType=response!
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
end type
global w_3202_mantenimiento_suministros_imp w_3202_mantenimiento_suministros_imp

on w_3202_mantenimiento_suministros_imp.create
call super::create
end on

on w_3202_mantenimiento_suministros_imp.destroy
call super::destroy
end on

event ue_arch_modificar;int li_lock_status
long ll_nis_rad
datetime  ld_f_desde 
SetPointer(HourGlass!)

ll_nis_rad = dw_mant_sum_imp.GetItemNumber(ii_fila_seleccionada, "nis_rad")
ld_f_desde=  dw_mant_sum_imp.GetItemDateTime(ii_fila_seleccionada, "f_desde")

if ii_fila_seleccionada > 0 then
	gu_comunic.is_comunic.longval1 = dw_mant_sum_imp.GetItemNumber(ii_fila_seleccionada,"nis_rad")	
	gu_comunic.is_comunic.datval1 = dw_mant_sum_imp.GetItemDateTime(ii_fila_seleccionada,"f_desde")
	open(w_3202_alta_suministros_imp)
END IF	
end event

type dw_vigente from w_3201_mantenimiento_suministros_imp`dw_vigente within w_3202_mantenimiento_suministros_imp
boolean BringToTop=true
end type

type dw_1 from w_3201_mantenimiento_suministros_imp`dw_1 within w_3202_mantenimiento_suministros_imp
boolean BringToTop=true
end type

type cb_imprimir from w_3201_mantenimiento_suministros_imp`cb_imprimir within w_3202_mantenimiento_suministros_imp
boolean BringToTop=true
end type

event cb_imprimir::constructor;call super::constructor;This.visible = False
end event


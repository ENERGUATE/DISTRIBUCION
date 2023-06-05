HA$PBExportHeader$ue_gen_filtro_fechas.sru
forward
global type ue_gen_filtro_fechas from datawindow
end type
end forward

global type ue_gen_filtro_fechas from datawindow
int Width=1079
int Height=212
int TabOrder=1
string DataObject="dw_gen_form_filtro_fechas"
boolean Border=false
boolean LiveScroll=true
end type
global ue_gen_filtro_fechas ue_gen_filtro_fechas

forward prototypes
public function integer fnu_habilitar_f_desde (boolean habi_true)
public function integer fnu_habi_f_hasta (boolean habi_true)
public function integer fnu_validar_fechas ()
public function string fnu_fecha1_numerica ()
public function string fnu_fecha2_numerica ()
public function integer f_inicializar_actual ()
end prototypes

public function integer fnu_habilitar_f_desde (boolean habi_true);If habi_true THEN
	This.Modify("f_desde.Protect=1")
	This.Modify("f_desde.background.color="+gs_gris)
ELSE
	This.Modify("f_desde.Protect=0")
	This.Modify("f_desde.background.color="+gs_blanco)
END IF

Return 1
end function

public function integer fnu_habi_f_hasta (boolean habi_true);If habi_true THEN
	This.Modify("f_hasta.protect=1")
	This.Modify("f_hasta.background.color="+gs_gris)
ELSE
	This.Modify("f_hasta.protect=0")
	This.Modify("f_hasta.background.color="+gs_blanco)
END IF

Return 1
end function

public function integer fnu_validar_fechas ();DateTime ldt_fecha1,ldt_fecha2

This.AcceptText()

ldt_Fecha1=this.GetItemDateTime(1,"f_desde")
ldt_Fecha2=this.GetItemDateTime(1,"f_hasta")

IF ldt_fecha1 > ldt_fecha2 THEN
		gnv_msg.f_mensaje("EG23","","",Ok!)
	Return 0
ELSE

	IF IsNull(ldt_fecha1) OR IsNull(ldt_fecha2) THEN
		gnv_msg.f_mensaje("EG23","","",Ok!)		
		Return 0
	END IF
END IF

Return 1
end function

public function string fnu_fecha1_numerica ();string ls_ano,ls_mes,ls_dia,ls_fecha_string
datetime ld_fecha

ld_fecha = this.GetItemDateTime(1,"f_desde")

ls_ano = string(Year(Date(ld_fecha)))
ls_mes = string(Month(Date(ld_fecha)))

IF LEN(ls_mes) = 1 THEN
	ls_mes = "0"+ls_mes
END IF

ls_dia = string(Day(Date(ld_fecha)))
IF LEN(ls_dia) = 1 THEN
	ls_dia = "0"+ls_dia
END IF

ls_fecha_string = ls_ano+ls_mes+ls_dia

Return ls_fecha_string
end function

public function string fnu_fecha2_numerica ();string ls_ano,ls_mes,ls_dia,ls_fecha_string
datetime ld_fecha

ld_fecha = this.GetItemDateTime(1,"f_hasta")

ls_ano = string(Year(Date(ld_fecha)))
ls_mes = string(Month(Date(ld_fecha)))

IF LEN(ls_mes) = 1 THEN
	ls_mes = "0"+ls_mes
END IF

ls_dia = string(Day(Date(ld_fecha)))
IF LEN(ls_dia) = 1 THEN
	ls_dia = "0"+ls_dia
END IF


ls_fecha_string = ls_ano+ls_mes+ls_dia

Return ls_fecha_string
end function

public function integer f_inicializar_actual ();dateTime ld_fecha_dia
date ld_f_dia

ld_fecha_dia = DateTime(today())
ld_f_dia = Date(ld_fecha_dia) 

This.setitem(1,"f_hasta",ld_f_dia)

return 1
end function

event rbuttondown;m_der_fechas lm_gestion_avi
lm_gestion_avi = CREATE m_der_fechas
m_der_fechas.idw_dw=this
m_der_fechas.ii_tipo_uo =2
lm_gestion_avi.PopMenu(PointerX(), PointerY()+600)
destroy lm_gestion_avi

end event


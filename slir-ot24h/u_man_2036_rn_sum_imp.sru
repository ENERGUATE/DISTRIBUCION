HA$PBExportHeader$u_man_2036_rn_sum_imp.sru
forward
global type u_man_2036_rn_sum_imp from nonvisualobject
end type
end forward

global type u_man_2036_rn_sum_imp from nonvisualobject
end type
global u_man_2036_rn_sum_imp u_man_2036_rn_sum_imp

forward prototypes
public function boolean frn_tiene_perfil_alta ()
public function boolean frn_tiene_perfil_modifica ()
public function boolean frn_validar_nulos (ref datawindow pd_dw)
public function string frn_validar_fechas (ref datawindow pd_dw)
public function long frn_ya_existe (long pl_nis)
public function long frn_ya_existe2 (long pl_nis, datetime pd_f_desde)
end prototypes

public function boolean frn_tiene_perfil_alta ();//debe fijarse si tiene perfil de alta y en ese caso retornar TRUE

return TRUE
end function

public function boolean frn_tiene_perfil_modifica ();//

return TRUE
end function

public function boolean frn_validar_nulos (ref datawindow pd_dw);DateTime ld_desde, ld_expira

ld_desde = pd_dw.GetItemDateTime(1,"f_desde")
ld_expira = pd_dw.GetItemDateTime(1,"f_expiracion")

IF ISNULL(ld_desde)  THEN
	pd_dw.SetColumn("f_desde")
	RETURN FALSE
END IF
//
//IF ISNULL(ld_expira) THEN
//	pd_dw.SetColumn("f_expiracion")
//	RETURN FALSE
//ELSE
	RETURN TRUE
//END IF
//
end function

public function string frn_validar_fechas (ref datawindow pd_dw);DateTime ld_desde, ld_hasta, ld_expira

ld_desde = pd_dw.GetItemDateTime(1,"f_desde")
//ld_hasta = pd_dw.GetItemDateTime(1,"f_fin")
ld_expira = pd_dw.GetItemDateTime(1,"f_expiracion")

//IF IsNull(ld_hasta) THEN
	IF ld_expira <= ld_desde OR IsNull(ld_expira) THEN
		RETURN "expira"
	ELSE
		RETURN "OK"
	END IF
//END IF

//IF NOT IsNull(ld_hasta) THEN

//	IF ld_hasta <= ld_desde THEN
//		pd_dw.setcolumn("f_fin")
//		RETURN "hasta"
//	END IF

//	RETURN "OK"
//END IF

end function

public function long frn_ya_existe (long pl_nis);long ll_total

SELECT COUNT(*)  INTO :ll_total FROM "GI_SUMINISTROS_IMP"
 	WHERE "GI_SUMINISTROS_IMP"."NIS_RAD" = :pl_nis 
	AND "GI_SUMINISTROS_IMP"."F_EXPIRACION" > sysdate ;

RETURN ll_total

 
end function

public function long frn_ya_existe2 (long pl_nis, datetime pd_f_desde);long ll_total

SELECT COUNT(*)  INTO :ll_total FROM "GI_SUMINISTROS_IMP"
 	WHERE "GI_SUMINISTROS_IMP"."NIS_RAD" = :pl_nis and "GI_SUMINISTROS_IMP"."F_DESDE" <> :pd_f_desde
	 AND "GI_SUMINISTROS_IMP"."F_EXPIRACION" > sysdate ;

RETURN ll_total

 
end function

on u_man_2036_rn_sum_imp.create
TriggerEvent( this, "constructor" )
end on

on u_man_2036_rn_sum_imp.destroy
TriggerEvent( this, "destructor" )
end on


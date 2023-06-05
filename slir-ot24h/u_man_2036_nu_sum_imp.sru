HA$PBExportHeader$u_man_2036_nu_sum_imp.sru
forward
global type u_man_2036_nu_sum_imp from nonvisualobject
end type
end forward

global type u_man_2036_nu_sum_imp from nonvisualobject
end type
global u_man_2036_nu_sum_imp u_man_2036_nu_sum_imp

forward prototypes
public function integer fnu_actualizar (ref datawindow pd_dw, long pl_nis)
public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_nis, datetime pd_fecha_desde)
public function integer fnu_actualizar_avisos_sum (long pl_nis)
end prototypes

public function integer fnu_actualizar (ref datawindow pd_dw, long pl_nis);pd_dw.SetItem(1,"nis_rad",pl_nis)
pd_dw.SetItem(1,"usuario",gs_usuario)
pd_dw.SetItem(1,"f_actual",fgcd_fecha_del_dia())
pd_dw.SetItem(1,"h_actual",fgcd_fecha_del_dia())
pd_dw.SetItem(1,"programa",gs_programa_principal)

//messagebox("nid_rad",string(pd_dw.GetItemNumber(1,"nis_rad")))
//messagebox("usuario",pd_dw.GetItemstring(1,"usuario"))
//messagebox("f_actual",string(pd_dw.GetItemdatetime(1,"f_actual")))
//messagebox("h_actual",string(pd_dw.GetItemDateTime(1,"h_actual")))
//messagebox("programa",pd_dw.GetItemstring(1,"programa"))
//messagebox("f_expiracion",string(pd_dw.GetItemdatetime(1,"f_expiracion")))
//messagebox("observacion",pd_dw.GetItemstring(1,"observacion"))
//messagebox("f_desde",string(pd_dw.GetItemDateTime(1,"f_desde")))
//messagebox("f_fin",string(pd_dw.GetItemDateTime(1,"f_fin")))
//messagebox("telefono",string(pd_dw.GetItemString(1,"telefono")))
//messagebox("contacto",string(pd_dw.GetItemString(1,"contacto")))
//messagebox("Cod_Cli",string(pd_dw.GetItemNumber(1,"cod_cli")))
//
pd_dw.Update()

IF fgnu_fecha_actual() >= pd_dw.GetItemDateTime(1,"f_desde") AND &
	fgnu_fecha_actual() <= pd_dw.GetItemDateTime(1,"f_expiracion") THEN
	
	IF fnu_actualizar_avisos_sum(pl_nis) = 1 THEN
		gnu_u_transaction.uf_commit()
	ELSE
		//messagebox("Error", "No se han podido actualizar los datos del suministro")
		gnv_msg.f_mensaje("EM62", "", "",OK!)
		gnu_u_transaction.uf_rollback()
	END IF
END IF

return 1
end function

public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_nis, datetime pd_fecha_desde);// Trae los datos de los suministros

pd_dw.retrieve(pl_nro_nis,pd_fecha_desde)
return 1
end function

public function integer fnu_actualizar_avisos_sum (long pl_nis);// Funci$$HEX1$$f300$$ENDHEX$$n que actualiza el $$HEX1$$e100$$ENDHEX$$rbol de avisos y/o los datos de la incidencia en el caso de
// que el suministro importante tenga dados de alta avisos (LFE)

long ll_nro_aviso, ll_nro_incidencia, ll_nro_instalacion
int li_ind_calidad, li_ind_inc_asoc, li_asoc, li_clase_aviso
datetime ldt_f_actual


// Se comprueba si el suministro tiene dado de alta alg$$HEX1$$fa00$$ENDHEX$$n aviso en estado menor que resuelto
DECLARE lcur_avisos CURSOR FOR 
 SELECT NRO_AVISO, 
 		  IND_CALIDAD,
		  IND_INC_ASOC,
		  NRO_INCIDENCIA
 FROM GI_AVISOS
 WHERE NIS_RAD = :pl_nis AND
 		 EST_AVISO < :fgci_aviso_resuelto;

OPEN lcur_avisos;

IF SQLCA.SQLCode = 0 THEN
	FETCH lcur_avisos INTO :ll_nro_aviso;
	
	ldt_f_actual = fgnu_fecha_actual()
	DO WHILE sqlca.sqlcode = 0 
		// Hay avisos no resueltos asociados a ese suministro
		// Se actualiza la tabla GI_AVISOS y se pone el indicativo de cliente importante
		// en los avisos de ese suministro
		UPDATE GI_AVISOS
		SET IND_CLI_IMP = 1 
		WHERE NRO_AVISO = :ll_nro_aviso;
		

	FETCH lcur_avisos INTO :ll_nro_aviso;
	LOOP
	
	CLOSE lcur_avisos;
	
ELSE
	return -1
END IF

return 1
end function

on u_man_2036_nu_sum_imp.create
TriggerEvent( this, "constructor" )
end on

on u_man_2036_nu_sum_imp.destroy
TriggerEvent( this, "destructor" )
end on


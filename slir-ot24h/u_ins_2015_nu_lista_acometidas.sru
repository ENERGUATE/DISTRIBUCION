HA$PBExportHeader$u_ins_2015_nu_lista_acometidas.sru
forward
global type u_ins_2015_nu_lista_acometidas from nonvisualobject
end type
end forward

global type u_ins_2015_nu_lista_acometidas from nonvisualobject
end type
global u_ins_2015_nu_lista_acometidas u_ins_2015_nu_lista_acometidas

forward prototypes
public function integer fnu_traer_datos_inst (ref datawindow pd_dw, decimal pdec_nro_instal)
public function integer fnu_traer_datos (ref datawindow pd_dw)
end prototypes

public function integer fnu_traer_datos_inst (ref datawindow pd_dw, decimal pdec_nro_instal);string ls_rc, ls_mod_string, ls_original_select, ls_original_select2, ls_where, ls_ref_dir

SetPointer(HourGlass!)

////AHM(07/06/2010) ASUR 608463 
//AHM(29/06/2009) Cambio de tipo de datos en el campo f_actual de la tabla sgd_acometida
ls_original_select  = " SELECT SGD_ACOMETIDA.PROGRAMA, SGD_ACOMETIDA.CODIGO, SGD_ACOMETIDA.INSTALACION_ORIGEN, SGD_ACOMETIDA.POT_CONTRATADA, SGD_ACOMETIDA.KWH, SGD_ACOMETIDA.NIF,  SGD_ACOMETIDA.CANT_CLI, SGD_ACOMETIDA.COD_DEPTO, SGD_ACOMETIDA.COD_LOC, SGD_ACOMETIDA.COD_PROV, SGD_ACOMETIDA.COD_MUNIC, SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.KWH_FACT, SGD_ACOMETIDA.COD_CALLE, SGD_ACOMETIDA.NUM_PUERTA, SGD_ACOMETIDA.DUPLICADOR, to_date(SGD_ACOMETIDA.F_ACTUAL, 'dd/mm/yyyy hh24:mi:ss'), SGD_ACOMETIDA.USUARIO, SGD_ACOMETIDA.ONIS_STAT, SGD_ACOMETIDA.INSTALACION_ORIGEN_V10, SGD_INSTALACION.NOM_INSTALACION,CALLEJERO.NOM_CALLE, fgnu_calle_referencia(callejero.nom_calle, sgd_acometida.num_puerta, sgd_acometida.duplicador, sgd_acometida.nif, sgd_acometida.cod_calle, 0, '', 0, '') cdireccion "
// DSA 10/01/2000	
//ls_original_select2 = " FROM sgd_acometida, SGD_INSTALACION, CALLEJERO WHERE ( SGD_ACOMETIDA.INSTALACION_ORIGEN = sgd_instalacion.nro_instalacion (+)) and ( SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE (+)) "
ls_original_select2 = " FROM sgd_acometida, SGD_INSTALACION, CALLEJERO WHERE ( SGD_ACOMETIDA.INSTALACION_ORIGEN = sgd_instalacion.nro_instalacion (+)) and ( SGD_INSTALACION.BDI_JOB(+) = 0 ) AND ( SGD_ACOMETIDA.BDI_JOB = 0) AND ( SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE (+)) "
// DSA 10/01/2000	
ls_where = " AND SGD_ACOMETIDA.INSTALACION_ORIGEN = '" + String(pdec_nro_instal) + "' "

ls_rc = pd_dw.Modify('DataWindow.Table.Select="' + ls_original_select + ls_original_select2 + ls_where + '"')


//ls_original_select = pd_dw.Describe("DataWindow.Table.Select")
//ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + ls_where + "'"
//ls_rc = pd_dw.Modify(ls_mod_string)

// RKU: ib_mostrar: variable de window w_3109_consulta_acometidas para no mostrar mensaje
// RKU: por primera vez

IF ls_rc = "" THEN
	IF pd_dw.Retrieve(ls_ref_dir) = 0 THEN
		IF w_3109_consulta_acometidas.ib_mostrar THEN
			gnv_msg.f_mensaje("AM14","","",OK!)
		END IF
	END IF

//	ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + "'" 
//	ls_rc = pd_dw.Modify(ls_mod_string)
ELSE

// solo para probar, sacarlo despues !!
//	MessageBox("Estado", "Modificaci$$HEX1$$f300$$ENDHEX$$n falla" + ls_rc)
END IF


RETURN 1


end function

public function integer fnu_traer_datos (ref datawindow pd_dw);string ls_rc, ls_mod_string, ls_original_select, ls_original_select2, ls_where, ls_ref_dir

SetPointer(HourGlass!)
 
//AHM(29/06/2009) Cambio de tipo de datos en el campo f_actual de la tabla sgd_acometida
ls_original_select  = " SELECT SGD_ACOMETIDA.PROGRAMA, SGD_ACOMETIDA.CODIGO, SGD_ACOMETIDA.INSTALACION_ORIGEN, SGD_ACOMETIDA.POT_CONTRATADA, SGD_ACOMETIDA.KWH, SGD_ACOMETIDA.NIF,  SGD_ACOMETIDA.CANT_CLI, SGD_ACOMETIDA.COD_DEPTO, SGD_ACOMETIDA.COD_LOC, SGD_ACOMETIDA.COD_PROV, SGD_ACOMETIDA.COD_MUNIC, SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.KWH_FACT, SGD_ACOMETIDA.COD_CALLE, SGD_ACOMETIDA.NUM_PUERTA, SGD_ACOMETIDA.DUPLICADOR, to_date(SGD_ACOMETIDA.F_ACTUAL, 'dd/mm/yyyy hh24:mi:ss'),  SGD_ACOMETIDA.USUARIO, SGD_INSTALACION.NOM_INSTALACION,CALLEJERO.NOM_CALLE, fgnu_calle_referencia(callejero.nom_calle, SGD_ACOMETIDA.num_puerta, SGD_ACOMETIDA.duplicador, SGD_ACOMETIDA.nif, SGD_ACOMETIDA.cod_calle, 0, '', 0, '') cdireccion "
// DSA INI 10/01/2000	
//ls_original_select2 = " FROM SGD_ACOMETIDA, SGD_INSTALACION, CALLEJERO WHERE ( SGD_ACOMETIDA.INSTALACION_ORIGEN = sgd_instalacion.nro_instalacion (+)) and ( SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE (+)) "   		
ls_original_select2 = " FROM SGD_ACOMETIDA, SGD_INSTALACION, CALLEJERO WHERE ( SGD_ACOMETIDA.INSTALACION_ORIGEN = sgd_instalacion.nro_instalacion (+)) and ( SGD_INSTALACION.BDI_JOB(+) = 0 ) AND ( SGD_ACOMETIDA.BDI_JOB=0) AND ( SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE (+)) "
// DSA FIN 10/01/2000	
ls_where = " AND SGD_ACOMETIDA.INSTALACION_ORIGEN = '" + String(gi_acometida_sin_alim) + "' "

ls_rc = pd_dw.Modify('DataWindow.Table.Select="' + ls_original_select + ls_original_select2 + ls_where + '"')


//ls_original_select = pd_dw.Describe("DataWindow.Table.Select")
//ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + ls_where + "'"
//ls_rc = pd_dw.Modify(ls_mod_string)


IF ls_rc = "" THEN
	IF pd_dw.Retrieve(ls_ref_dir) = 0 THEN
		gnv_msg.f_mensaje("AM16","","",OK!)
	END IF

//	ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + "'" 
//	ls_rc = pd_dw.Modify(ls_mod_string)

END IF


RETURN 1





end function

on u_ins_2015_nu_lista_acometidas.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_ins_2015_nu_lista_acometidas.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


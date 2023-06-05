HA$PBExportHeader$u_avi_2004_rn_form_inf_resumen.sru
$PBExportComments$UserObject de reglas del negocio de informaci$$HEX1$$f300$$ENDHEX$$n resumen del aviso, usado en recepci$$HEX1$$f300$$ENDHEX$$n de avisos..
forward
global type u_avi_2004_rn_form_inf_resumen from u_avi_1004_rn_generico
end type
end forward

global type u_avi_2004_rn_form_inf_resumen from u_avi_1004_rn_generico
end type
global u_avi_2004_rn_form_inf_resumen u_avi_2004_rn_form_inf_resumen

forward prototypes
public function integer frn_busco_localidad (long pl_nis)
end prototypes

public function integer frn_busco_localidad (long pl_nis);int li_cant, li_cod_loc

select "ACO_SUM"."COD_LOC" INTO :li_cod_loc from "ACO_SUM" where "ACO_SUM"."NIS_RAD" = :pl_nis;

IF sqlca.sqlcode = 100 THEN
	li_cant = 1
	Return li_cant
END IF

select count (*) into :li_cant from "GI_CENTRO_LOC"
where "GI_CENTRO_LOC"."COD_LOC" = :li_cod_loc;

return li_cant
end function


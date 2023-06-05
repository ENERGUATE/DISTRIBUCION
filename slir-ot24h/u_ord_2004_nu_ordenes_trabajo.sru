HA$PBExportHeader$u_ord_2004_nu_ordenes_trabajo.sru
forward
global type u_ord_2004_nu_ordenes_trabajo from nonvisualobject
end type
end forward

global type u_ord_2004_nu_ordenes_trabajo from nonvisualobject
end type
global u_ord_2004_nu_ordenes_trabajo u_ord_2004_nu_ordenes_trabajo

forward prototypes
public function integer fnu_traer_datos (ref datawindow pd_dw, decimal pdec_nro_inst)
end prototypes

public function integer fnu_traer_datos (ref datawindow pd_dw, decimal pdec_nro_inst);pd_dw.Retrieve(pdec_nro_inst)

IF sqlca.sqlcode <> 0 THEN
	Return -1
END IF

Return 1
end function


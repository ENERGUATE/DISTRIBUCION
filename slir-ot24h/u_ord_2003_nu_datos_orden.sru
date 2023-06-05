HA$PBExportHeader$u_ord_2003_nu_datos_orden.sru
forward
global type u_ord_2003_nu_datos_orden from nonvisualobject
end type
end forward

global type u_ord_2003_nu_datos_orden from nonvisualobject
end type
global u_ord_2003_nu_datos_orden u_ord_2003_nu_datos_orden

forward prototypes
public function integer fnu_conectar (ref datawindow pdw_datos_ord, long pl_nro_ord)
end prototypes

public function integer fnu_conectar (ref datawindow pdw_datos_ord, long pl_nro_ord);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_conectar
// 
// Objetivo:	Conecta las DropDownDW de la DW pasada como par$$HEX1$$e100$$ENDHEX$$metro, 
//					y la misma.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdw_datos_ord	(datawindow con la inf. de la orden de servicio)
//					pl_nro_ord 		(n$$HEX1$$fa00$$ENDHEX$$mero de la orden)
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/02/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datawindowchild	dwch_1, dwch_2, dwch_3

pdw_datos_ord.GetChild('est_os',dwch_1)
pdw_datos_ord.GetChild('tip_os',dwch_2)

dwch_1.SetTransObject(sqlca)
dwch_2.SetTransObject(sqlca)
pdw_datos_ord.SetTransObject(sqlca)

dwch_1.Retrieve("EO%")
dwch_2.Retrieve("TO%")
pdw_datos_ord.Retrieve(pl_nro_ord)

RETURN 1
end function


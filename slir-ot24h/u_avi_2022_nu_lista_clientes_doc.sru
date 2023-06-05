HA$PBExportHeader$u_avi_2022_nu_lista_clientes_doc.sru
forward
global type u_avi_2022_nu_lista_clientes_doc from u_avi_1002_nu_generico
end type
end forward

global type u_avi_2022_nu_lista_clientes_doc from u_avi_1002_nu_generico
end type
global u_avi_2022_nu_lista_clientes_doc u_avi_2022_nu_lista_clientes_doc

forward prototypes
public function integer fnu_conectar (ref datawindow pdw_list_cli)
end prototypes

public function integer fnu_conectar (ref datawindow pdw_list_cli);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_conectar
// 
// Objetivo:	Conecta las DropDownDW de la DW pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdw_list_cli (datawindow con la inf. de los clientes)
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/03/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datawindowchild	dwch_1, dwch_2

pdw_list_cli.GetChild('tip_doc',dwch_1)
pdw_list_cli.GetChild('co_pais',dwch_2)

dwch_1.SetTransObject(sqlca)
dwch_2.SetTransObject(sqlca)

dwch_1.Retrieve("TD%")
dwch_2.Retrieve("PD%")

RETURN 1
end function


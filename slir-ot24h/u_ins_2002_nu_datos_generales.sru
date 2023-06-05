HA$PBExportHeader$u_ins_2002_nu_datos_generales.sru
forward
global type u_ins_2002_nu_datos_generales from datawindow
end type
end forward

global type u_ins_2002_nu_datos_generales from datawindow
int Width=2725
int Height=517
end type
global u_ins_2002_nu_datos_generales u_ins_2002_nu_datos_generales

forward prototypes
public function integer fnu_activar_ddw ()
public function string fnu_obtener_direccion (decimal pl_nro_instalacion)
end prototypes

public function integer fnu_activar_ddw ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_activar_ddw
//
// Objetivo:  Activa DropDownDatawindow.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

DataWindowChild ddw
long RowsRetrieved

this.GetChild("nro_centro",ddw)
ddw.SetTransObject(SQLCA)
RowsRetrieved = ddw.Retrieve()

this.GetChild("nro_cmd",ddw)
ddw.SetTransObject(SQLCA)
RowsRetrieved = ddw.Retrieve()

this.GetChild("nro_mesa",ddw)
ddw.SetTransObject(SQLCA)
RowsRetrieved = ddw.Retrieve()

this.GetChild("tipo_inst",ddw)
ddw.SetTransObject(SQLCA)
RowsRetrieved = ddw.Retrieve()

Return 1
end function

public function string fnu_obtener_direccion (decimal pl_nro_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_direccion
// 
// Objetivo: Obtiene la direccion de una instalacion.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  nro_instalacion
//	Salida:   string con la direccion
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	8/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_num_puerta
string ls_duplicador, ls_nom_calle, ls_calle

//Obtencion de la de el numero de puerta , duplicador y nombre de la calle

SELECT A.num_puerta,A.duplicador,B.nom_calle 
			INTO :ll_num_puerta,:ls_duplicador,:ls_nom_calle
	FROM instalacion A, Callejero B
	WHERE A.cod_calle = B.Cod_Calle AND
			A.nro_instalacion=:pl_nro_instalacion;

ls_calle=ls_nom_calle+" "+String(ll_num_puerta)+" "+ls_duplicador

Return (ls_calle)
end function


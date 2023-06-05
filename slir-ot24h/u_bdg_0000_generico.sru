HA$PBExportHeader$u_bdg_0000_generico.sru
forward
global type u_bdg_0000_generico from datawindow
end type
end forward

global type u_bdg_0000_generico from datawindow
int Width=494
int Height=361
int TabOrder=1
boolean LiveScroll=true
end type
global u_bdg_0000_generico u_bdg_0000_generico

forward prototypes
public function integer f_insertar_fila ()
end prototypes

public function integer f_insertar_fila ();//////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_insertar_fila
// 
// Objetivo: Inserta una fila en blanco en la dw
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/06/96			HMA		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////


RETURN This.InsertRow(0)

end function


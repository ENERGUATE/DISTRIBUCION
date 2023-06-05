HA$PBExportHeader$u_dir_2001_pa_direccion_std.sru
$PBExportComments$tinavi
forward
global type u_dir_2001_pa_direccion_std from nonvisualobject
end type
end forward

global type u_dir_2001_pa_direccion_std from nonvisualobject
end type
global u_dir_2001_pa_direccion_std u_dir_2001_pa_direccion_std

forward prototypes
public function integer fpa_verificar_direccion (ref datawindow pdw_direccion)
end prototypes

public function integer fpa_verificar_direccion (ref datawindow pdw_direccion);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fpa_verificar_direccion
// 
// Objetivo: Obtiene y verifica si la direcci$$HEX1$$f300$$ENDHEX$$n es v$$HEX1$$e100$$ENDHEX$$lida.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pdw_direccion
//       Salida:
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////
pdw_direccion.AcceptText()
IF NOT IsValid(pdw_direccion) OR IsNull(pdw_direccion.GetItemString(pdw_direccion.GetRow(),"calle")) THEN
	RETURN 0
ELSE
	IF IsNull(pdw_direccion.GetItemString(1,"numero")) AND IsNull(pdw_direccion.GetItemString(1,"duplic")) THEN
		RETURN 1
	ELSE
		IF IsNull(pdw_direccion.GetItemString(1,"numero")) AND NOT IsNull(pdw_direccion.GetItemString(1,"duplic")) THEN		
			RETURN 0
		ELSEIF NOT IsNumber(pdw_direccion.GetItemString(1,"numero")) THEN
			RETURN 3
		ELSE
			RETURN 2
		END IF
	END IF
END IF



end function


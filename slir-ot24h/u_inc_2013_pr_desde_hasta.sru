HA$PBExportHeader$u_inc_2013_pr_desde_hasta.sru
forward
global type u_inc_2013_pr_desde_hasta from datawindow
end type
end forward

global type u_inc_2013_pr_desde_hasta from datawindow
integer width = 1001
integer height = 384
string dataobject = "d_inc_2013_pr_desde_hasta"
end type
global u_inc_2013_pr_desde_hasta u_inc_2013_pr_desde_hasta

forward prototypes
public subroutine fpr_titulo (integer pi_titulo)
public subroutine fnu_cargo_desde (datetime pd_fecha)
public subroutine fnu_cargo_hasta (datetime pd_fecha)
public subroutine frn_val_def_con_avi ()
public function string fnu_filtro_deteccion (datetime pd_desde, datetime pd_hasta)
public function string fnu_filtro_deteccion_2 (datetime pd_desde, datetime pd_hasta)
public function integer f_insertar_fila ()
public function string fnu_filtro_deteccion_descargo (datetime pd_desde, datetime pd_hasta)
public function string fnu_filtro_deteccion_reenganches (datetime pd_desde, datetime pd_hasta)
public function string fnu_filtro_deteccion_descargo_historico (datetime pd_desde, datetime pd_hasta)
public function string fnu_filtro_deteccion_descargo_historic_2 (datetime pd_desde, datetime pd_hasta)
end prototypes

public subroutine fpr_titulo (integer pi_titulo);if pi_titulo = 1 then
		//this.dwmodify("deteccion_titulo.text= "+ fg_etiqueta(1000001) )		
else
		//this.dwmodify("deteccion_titulo.text= "+ fg_etiqueta(1000002) )	
end if

	
end subroutine

public subroutine fnu_cargo_desde (datetime pd_fecha);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargo_desde
//
// Objetivo: Obtiene fecha
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_fecha
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


this.setitem(1,"desde",pd_fecha)

end subroutine

public subroutine fnu_cargo_hasta (datetime pd_fecha);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargo_hasta
//
// Objetivo: Obtengo fecha
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_fecha
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


this.setitem(1,"hasta",pd_fecha)

end subroutine

public subroutine frn_val_def_con_avi ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_val_def_con_avi
//
// Objetivo: Permite cargar por defecto los campos cuando los mismos no
//           son seteados por defecto.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: --
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


// Los valores por defecto para consulta de avisos son

//this.fnu_cargo_desde(datetime(today(),time("00:00:00"))) // con fecha del dia y primera hora
this.fnu_cargo_hasta(fgnu_fecha_actual())            // Con Fecha del Dia y hora actual
this.setcolumn("desde")
this.accepttext()
this.fpr_titulo(2)

end subroutine

public function string fnu_filtro_deteccion (datetime pd_desde, datetime pd_hasta);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_detecci$$HEX1$$f300$$ENDHEX$$n
//
// Objetivo: Filtra avisos que esten entre f_desde y f_hasta.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_desde, pd_hasta
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////
DateTime d_aux
DateTime d_desde
String a
String b
d_desde=DateTime(Date(pd_desde),Time(pd_desde))
d_aux=DateTime(Date("00/00/0000"),Time("00:00")) 
b=string(d_desde)
a=string(d_aux)
IF a=b then
	setnull(pd_desde)
END IF


IF ISNULL(pd_desde) THEN
	return "(gi_avisos.f_alta <= to_date(~'" &
								+ string(pd_hasta,"dd/mm/yyyy hh:mm:ss") + &
			"~',~'dd/mm/yyyy hh24:mi:ss~'))"

ELSE
	return "(gi_avisos.f_Alta >= to_date(~'"  &
 								+ string(pd_desde,"dd/mm/yyyy hh:mm:ss")+ &
			"~',~'dd/mm/yyyy hh24:mi:ss~')  ) and (gi_avisos.f_alta <= to_date(~'" &
								+ string(pd_hasta,"dd/mm/yyyy hh:mm:ss") + &
			"~',~'dd/mm/yyyy hh24:mi:ss~'))"
END IF
end function

public function string fnu_filtro_deteccion_2 (datetime pd_desde, datetime pd_hasta);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_deteccion_2
//
// Objetivo: Filtra datos comprendidos entre f_desde y f_hasta
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_desde, pd_hasta
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////
DateTime d_aux
DateTime d_desde
String a
String b
d_desde=DateTime(Date(pd_desde),Time(pd_desde))
d_aux=DateTime(Date("00/00/0000"),Time("00:00")) 
b=string(d_desde)
a=string(d_aux)
IF a=b then
	setnull(pd_desde)
END IF
	

IF ISNull(pd_desde) AND ISNULL(pd_hasta) THEN
	Return ""
 END IF

IF ISNULL(pd_desde) THEN
	pd_desde=DateTime(Date("01/01/1900"))
	// se asterisquearon las siguientes lineas para obligar que en la consulta 
	// se pregunte por una fecha

END IF

return "(SGD_INCIDENCIA.f_deteccion >= to_date(~'"  &
 								+ string(pd_desde,"dd/mm/yyyy hh:mm:ss")+ &
		"~',~'dd/mm/yyyy hh24:mi:ss~')  ) and (SGD_INCIDENCIA.f_deteccion <= to_date(~'" &
								+ string(pd_hasta,"dd/mm/yyyy hh:mm:ss") + &
		"~',~'dd/mm/yyyy hh24:mi:ss~'))"
end function

public function integer f_insertar_fila ();return this.insertrow(1)
end function

public function string fnu_filtro_deteccion_descargo (datetime pd_desde, datetime pd_hasta);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_deteccion_descargo
//
// Objetivo: Filtra datos comprendidos entre f_desde y f_hasta
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_desde, pd_hasta
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////
DateTime d_aux
DateTime d_desde
String a
String b
d_desde=DateTime(Date(pd_desde),Time(pd_desde))
d_aux=DateTime(Date("00/00/0000"),Time("00:00")) 
b=string(d_desde)
a=string(d_aux)
IF a=b then
	setnull(pd_desde)
END IF
	

IF ISNull(pd_desde) AND ISNULL(pd_hasta) THEN
	Return ""
 END IF

IF ISNULL(pd_desde) THEN
	pd_desde=DateTime(Date("01/01/1900"))
	
// se asterisquearon las siguientes lineas para obligar que en la consulta 
// se pregunte por una fecha

END IF

return "(~"SGD_DESCARGOS~".~"F_SOLICITADO~" >= to_date(~'"  &
 								+ string(pd_desde,'yyyymmdd hhmm24ss')+ &
		"~',~'dd/mm/yyyy hh24:mi:ss~')  ) and (~"SGD_DESCARGOS~".~"F_SOLICITADO~" <= to_date(~'" &
								+ string(pd_hasta,'yyyymmdd hhmm24ss') + &
		"~',~'dd/mm/yyyy hh24:mi:ss~'))"
end function

public function string fnu_filtro_deteccion_reenganches (datetime pd_desde, datetime pd_hasta);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_deteccion_2
//
// Objetivo: Filtra datos comprendidos entre f_desde y f_hasta
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_desde, pd_hasta
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////
DateTime d_aux
DateTime d_desde
String a
String b
d_desde=DateTime(Date(pd_desde),Time(pd_desde))
d_aux=DateTime(Date("00/00/0000"),Time("00:00")) 
b=string(d_desde)
a=string(d_aux)
IF a=b then
	setnull(pd_desde)
END IF
	

IF ISNull(pd_desde) AND ISNULL(pd_hasta) THEN
	Return ""
 END IF

IF ISNULL(pd_desde) THEN
	pd_desde=DateTime(Date("01/01/1900"))
	// se asterisquearon las siguientes lineas para obligar que en la consulta 
	// se pregunte por una fecha

END IF

return "(SGD_REENGANCHES.f_deteccion >= to_date(~'"  &
 								+ string(pd_desde,"dd/mm/yyyy hh:mm:ss")+ &
		"~',~'dd/mm/yyyy hh24:mi:ss~')  ) and (SGD_REENGANCHES.f_deteccion <= to_date(~'" &
								+ string(pd_hasta,"dd/mm/yyyy hh:mm:ss") + &
		"~',~'dd/mm/yyyy hh24:mi:ss~'))"
end function

public function string fnu_filtro_deteccion_descargo_historico (datetime pd_desde, datetime pd_hasta);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_deteccion_descargo_historico
//
// Objetivo: Filtra datos comprendidos entre f_desde y f_hasta
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_desde, pd_hasta
//        Salida : --
//
// Devuelve: 
//
// Fecha				Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----				-----------		---------
//	19/08/2005			SGO			Creacci$$HEX1$$f300$$ENDHEX$$n. 	Se olvid$$HEX2$$f3002000$$ENDHEX$$(LFE Mejora 1/275744: B$$HEX1$$fa00$$ENDHEX$$squeda Descargos (Hist$$HEX1$$f300$$ENDHEX$$rico). Se sustituye F_SOLICITADO por F_INI_SOLICITADO y por F_FIN_SOLICITADO)
///////////////////////////////////////////////////////////

DateTime d_aux, d_desde
String a, b

d_desde=DateTime(Date(pd_desde),Time(pd_desde))
d_aux=DateTime(Date("00/00/0000"),Time("00:00")) 
b=string(d_desde)
a=string(d_aux)
IF a=b then
	setnull(pd_desde)
END IF
	
IF ISNull(pd_desde) AND ISNULL(pd_hasta) THEN
	Return ""
 END IF

IF ISNULL(pd_desde) THEN
	pd_desde=DateTime(Date("01/01/1900"))
END IF

return "(SGD_DESCARGOS.F_INI_SOLICITADO >= to_date(~'"  &
 								+ string(pd_desde,'dd/mm/yyyy hh:mm:ss')+ &
		"~',~'dd/mm/yyyy hh24:mi:ss~')  ) and (SGD_DESCARGOS.F_FIN_SOLICITADO <= to_date(~'" &
								+ string(pd_hasta,'dd/mm/yyyy hh:mm:ss') + &
		"~',~'dd/mm/yyyy hh24:mi:ss~'))"

end function

public function string fnu_filtro_deteccion_descargo_historic_2 (datetime pd_desde, datetime pd_hasta);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_filtro_deteccion_descargo_historic_2
//
// Objetivo: Filtra datos comprendidos entre f_desde y f_hasta
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_desde, pd_hasta
//        Salida : --
//
// Devuelve: 
//
// Fecha				Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----				-----------		---------
//	19/08/2005			SGO			Creacci$$HEX1$$f300$$ENDHEX$$n. Mejora 1/370503 - Moldavia.
///////////////////////////////////////////////////////////

DateTime d_aux, d_desde
String a, b

d_desde=DateTime(Date(pd_desde),Time(pd_desde))
d_aux=DateTime(Date("00/00/0000"),Time("00:00")) 
b=string(d_desde)
a=string(d_aux)
IF a=b then
	setnull(pd_desde)
END IF
	
IF ISNull(pd_desde) AND ISNULL(pd_hasta) THEN
	Return ""
 END IF

IF ISNULL(pd_desde) THEN
	pd_desde=DateTime(Date("01/01/1900"))
END IF

Return "( ( SGD_DESCARGOS.F_INI_SOLICITADO <= to_date(~'"	+ String(pd_desde,'dd/mm/yyyy hh:mm:ss') + "~',~'dd/mm/yyyy hh24:mi:ss~') AND SGD_DESCARGOS.F_FIN_SOLICITADO >= to_date(~'"	+ String(pd_desde,'dd/mm/yyyy hh:mm:ss') + "~',~'dd/mm/yyyy hh24:mi:ss~') ) OR " + &
			"( SGD_DESCARGOS.F_INI_SOLICITADO < to_date(~'" + String(pd_hasta,'dd/mm/yyyy hh:mm:ss') + "~',~'dd/mm/yyyy hh24:mi:ss~') AND SGD_DESCARGOS.F_FIN_SOLICITADO > to_date(~'" + String(pd_hasta,'dd/mm/yyyy hh:mm:ss') + "~',~'dd/mm/yyyy hh24:mi:ss~') ) OR " + &
			"( SGD_DESCARGOS.F_INI_SOLICITADO >= to_date(~'"	+ String(pd_desde,'dd/mm/yyyy hh:mm:ss') + "~',~'dd/mm/yyyy hh24:mi:ss~') AND SGD_DESCARGOS.F_FIN_SOLICITADO < to_date(~'"	+ String(pd_hasta,'dd/mm/yyyy hh:mm:ss') + "~',~'dd/mm/yyyy hh24:mi:ss~') ) )"

end function

on itemchanged;String ls_columna
String ls_texto1
String ls_texto2

ls_columna=This.getcolumnname()
CHOOSE CASE ls_columna
	CASE "desde"
		ls_texto1=this.gettext()
				
		
	CASE "hasta"
		ls_texto2=this.gettext()

END CHOOSE

end on

on dberror;// para eliminar alpadre
end on

event rbuttondown;m_der_fechas lm_gestion_avi
lm_gestion_avi = CREATE m_der_fechas
m_der_fechas.idw_dw=this
lm_gestion_avi.PopMenu(PointerX(), PointerY()+600)
destroy lm_gestion_avi

end event

event itemerror;IF dwo.name = "desde" OR dwo.name = "hasta" THEN 
	MessageBox("Error", "La Fecha " + string(dwo.name) + " no es v$$HEX1$$e100$$ENDHEX$$lida.")
END IF

return 1
end event

on u_inc_2013_pr_desde_hasta.create
end on

on u_inc_2013_pr_desde_hasta.destroy
end on


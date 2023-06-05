HA$PBExportHeader$u_5001_nu_reportes.sru
forward
global type u_5001_nu_reportes from nonvisualobject
end type
end forward

global type u_5001_nu_reportes from nonvisualobject
end type
global u_5001_nu_reportes u_5001_nu_reportes

type variables
int ii_array_pos[]
boolean ib_hay
int ii_maximo

end variables

forward prototypes
public function string fnu_filtro_incidencia (ref datawindow pd_dw)
public function string fnu_filtro_aviso (ref datawindow pd_dw)
public function integer fnu_obtener_datos_2 (string ps_select, datawindow u_control_dw, boolean p_join)
public function string fnu_filtro_brigadas (ref datawindow pd_dw)
public function string fnu_filtro_instalaciones (ref datawindow pd_dw)
public function boolean fnu_cambio_nombres (string ps_campos[], string ps_nombres[], integer numero, datawindow pd_data)
public function integer f_preparo_datawindow (datawindow pd_data, string ps_nombres[])
public function string fnu_filtro_reenganche (ref datawindow pd_dw)
public function string fnu_filtro_descargos (ref datawindow pd_dw)
end prototypes

public function string fnu_filtro_incidencia (ref datawindow pd_dw);
int li_tension
int li_causa

int li_intervalo_horario, li_mat_averiado
int li_tipo,li_rango, li_alcance

datetime ld_fecha,ld_fecha_desde
string ls_operador_fecha
string ls_retorno,ls_mat_averiado
String ls_fecha_select
string ls_mes,ls_fecha_rango
string ls_causa

li_tension = pd_dw.GetItemNumber(1,"pa_tension_afectada")
li_causa = pd_dw.GetItemNumber(1,"pa_causa")
ls_causa = pd_dw.GetItemString (1,"ps_nom_causa")
//li_mat_averiado = pd_dw.GetItemString(1,"pa_material_averiado")

ls_mat_averiado = pd_dw.GetItemString(1,"pa_material_averiado")

ls_causa = pd_dw.GetItemString (1,"ps_nom_causa")
//li_intervalo_horario = pd_dw.GetItemNumber(1,"pa_int_horario")
li_tipo = pd_dw.GetItemNumber(1,"pa_tipo_incidencia")
li_alcance = pd_dw.GetItemNumber(1,"pa_alcance")
ld_fecha = pd_dw.GetItemDateTime(1,"pa_periodo")
ls_operador_fecha = pd_dw.GetItemString(1,"pa_operador_fecha")
ld_fecha_desde=pd_dw.GetItemDateTime(1,"pa_rango")

IF isnull(ld_fecha_desde) THEN
	ld_fecha_desde = Datetime(Date("01/01/1900"), Time(""))
END IF

ls_retorno = " "
li_rango=pd_dw.GetItemNumber(1,"rango")

IF li_tension <> 0 THEN
	ls_retorno = ls_retorno + " and sgd_incidencia.tip_tension = " + string(li_tension)
END IF

IF li_causa <> 0 THEN
	ls_retorno = ls_retorno + " and sgd_incidencia.cod_causa = " + string(li_causa)

END IF

IF len(ls_mat_Averiado) > 1 THEN
	ls_retorno = ls_retorno + " and sgd_incidencia.mat_averiado = " + ls_mat_averiado

END IF


//IF li_intervalo_horario <> 0 THEN
//	ls_retorno = ls_retorno + " and sgd_incidencia.cod_hor = " + string(li_intervalo_horario)
//
//END IF

IF li_tipo <> 0 THEN
	ls_retorno = ls_retorno + " and sgd_incidencia.tip_incidencia = " + string(li_tipo)
END IF

IF li_alcance <> 0 THEN //AND li_alcance <> 3 THEN
	ls_retorno = ls_retorno + " and sgd_incidencia.alcance = " + string(li_alcance)
END IF


ls_mes = string(Month(Date(ld_fecha)))
IF LEN(ls_mes) = 1 THEN
	ls_mes = "0" + ls_mes
END IF

ls_fecha_select = string(Year(Date(ld_fecha))) 
ls_fecha_select = ls_fecha_select + ls_mes
ls_fecha_select = ls_fecha_select + string(Day(Date(ld_fecha))) 


ls_fecha_select = " to_date( '" + ls_fecha_select  +"' ,'YYYYMMDD')" 

if li_rango=1 then
// GNU 20-7-2006. Incidencia fechas Oracle 9
//ls_retorno = ls_retorno + " and to_date(sgd_incidencia.f_deteccion ,'YYYYMMDD') " + ls_operador_fecha + &
ls_retorno = ls_retorno + " and to_date(to_char(sgd_incidencia.f_deteccion ,'YYYYMMDD') ,'YYYYMMDD') " + ls_operador_fecha + &
	ls_fecha_select
// FIN GNU
end if

if li_rango=0 then
	ls_mes = string(Month(Date(ld_fecha_desde)))
	IF LEN(ls_mes) = 1 THEN
		ls_mes = "0" + ls_mes
	END IF

	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
	ls_fecha_rango = ls_fecha_rango + ls_mes
	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
	ls_retorno = ls_retorno + " and to_date(to_char(sgd_incidencia.f_deteccion ,'YYYYMMDD') ,'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
	ls_fecha_select
end if

IF ld_fecha < ld_fecha_desde AND + &
	pd_dw.object.rango[1] = 0  THEN
	gnv_msg.f_mensaje("AP01","","",ok!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha de comienzo no debe ser mayor que la Fecha de fin.",information!,ok!)
	ls_retorno="cancel"
	return ls_retorno
end if

if (li_rango=1 and (ls_operador_fecha= "<" or ls_operador_fecha= "<>" or ls_operador_fecha= "<=")) & 
    or (li_rango=0 and DaysAfter(date(ld_fecha_desde),date(ld_fecha)) > 30) then
    //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n que ha seleccionado puede demorar varios minutos.",information!,okcancel!)=2 then
	 if gnv_msg.f_mensaje("CP01","","",OkCancel!) = 2 then
		ls_retorno="cancel"
		return ls_retorno
	 end if
END IF

Return ls_retorno
end function

public function string fnu_filtro_aviso (ref datawindow pd_dw);///////////////////////////////////////////////////////
//										
// Funcion: fnu_filtro_aviso
// 
// Objetivo: Establece la clausula Where para la sentencia
//           select
//	
//
// Responsables:  FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : String con la where
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int li_estado
int li_tipo
int li_alcance
int li_alimentacion,li_rango
int li_tipo_aviso, li_calidad1, li_calidad2
datetime ld_fecha,ld_fecha_desde
string ls_operador_fecha
string ls_retorno
String ls_fecha_select,ls_fecha_rango
string ls_mes
long ll_pp
long ll_nro, ll_nro2, ll_nro3
boolean distinto_todos=false    //para verificar si el filtro tipo de avisos esta en todos o se eligio algun tipo
//verdadero si se eligio algun tipo

li_estado = pd_dw.GetItemNumber(1,"ai_estado")
li_tipo = pd_dw.GetItemNumber(1,"ai_tipo")
li_alcance = pd_dw.GetItemNumber(1,"ai_alcance")
li_alimentacion= pd_dw.GetItemNumber(1,"ai_alimentacion")
li_tipo_aviso= pd_dw.GetItemNumber(1,"ai_tipo_aviso")
ld_fecha = pd_dw.GetItemDateTime(1,"pa_periodo")
ls_operador_fecha = pd_dw.GetItemString(1,"pa_operador_fecha")
ld_fecha_desde=pd_dw.GetItemDateTime(1,"pa_rango")

IF isnull(ld_fecha_desde) THEN
	ld_fecha_desde = Datetime(Date("01/01/1900"), Time(""))
END IF

ls_retorno = " "
li_rango=pd_dw.GetItemNumber(1,"rango")

IF li_estado <> 0 THEN
	ls_retorno = " and gi_avisos.est_aviso = " + string(li_estado)

END IF

IF li_tipo <> 0 THEN
	ls_retorno = ls_retorno + " and gi_avisos.tip_aviso = " + string(li_tipo)

END IF

IF li_alcance <> 0 THEN
	ls_retorno = ls_retorno + " and gi_avisos.co_alcance = " + string(li_alcance)

END IF

IF li_tipo_aviso <> 101 THEN // si el aviso es distinto de <Todos>
	CHOOSE CASE li_tipo_aviso
//		CASE 1  // <Normal>
//			ls_retorno = ls_retorno + " and gi_avisos.nro_instalacion <> " + string(fgcdec_aviso_sin_alimentacion) + " AND gi_avisos.nro_instalacion <> "+string(fgcdec_aviso_de_ayuda)+" AND gi_avisos.nro_instalacion <> "+string(fgcdec_aviso_alumbrado_publico)
//		CASE 2 
//			ls_retorno = ls_retorno + " and gi_avisos.nro_instalacion = " + string(fgcdec_aviso_sin_alimentacion)
//		CASE 3
//			ls_retorno = ls_retorno + " and gi_avisos.ind_ayuda = " + string(fgci_ayuda)
//		CASE 4
//			ls_retorno = " and gi_avisos.ind_ayuda = " + string(fgci_alumbrado_publico)
//		CASE 0
//			ls_retorno = ls_retorno + ""
//		CASE ELSE
//			ls_retorno = ls_retorno + ""
//	END CHOOSE
		case fgci_clase_avi_normal // Clase de Aviso: <Normal>
			choose case li_alimentacion
				case 0 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Todos>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1  
					ll_nro3= fgcdec_aviso_sin_alimentacion
				case 1 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Con alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1  
					ll_nro3=00000000
			
				case 2 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Sin alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=fgcdec_aviso_sin_alimentacion
					ll_nro2=fgcdec_aviso_sin_alimentacion
					ll_nro3=fgcdec_aviso_sin_alimentacion
			end choose
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case fgci_clase_avi_ayuda // Clase de Aviso: <Ayuda>
			ll_nro=fgcdec_aviso_de_ayuda
			ll_nro2=fgcdec_aviso_de_ayuda
			ll_nro3=fgcdec_aviso_de_ayuda
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case fgci_clase_avi_alum_publ // Clase de Aviso: <Alumbrado p$$HEX1$$fa00$$ENDHEX$$blico>
			ll_nro=fgcdec_aviso_alumbrado_publico
			ll_nro2=fgcdec_aviso_alumbrado_publico
			ll_nro3=fgcdec_aviso_alumbrado_publico
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case fgci_clase_avi_calidad // Clase de Aviso: <Calidad>
			choose case li_alimentacion
				case 0 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Todos>
					ll_nro=00000000
					ll_nro2 = fgcdec_aviso_de_calidad - 1  
					ll_nro3= fgcdec_aviso_de_calidad_sin_alim
				
				case 1 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Con alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1
					ll_nro3=00000000
			
				case 2 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Sin alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=fgcdec_aviso_de_calidad_sin_alim
					ll_nro2=fgcdec_aviso_de_calidad_sin_alim
					ll_nro3=fgcdec_aviso_de_calidad_sin_alim
			end choose
			li_calidad1 = 1
			li_calidad2 = 1 // los avisos son s$$HEX1$$f300$$ENDHEX$$lo de calidad
	END CHOOSE
	ls_retorno = ls_retorno + " (gi_avisos.nro_instalacion between " + string(ll_nro) + &
					 " and " + string(ll_nro2) + " OR gi_avisos.nro_instalacion = " + &
					 string(ll_nro3) + ") and gi_avisos.ind_calidad >= " + string(li_calidad1) + &
					 " and gi_avisos.ind_calidad <= " + string(li_calidad2)
	
distinto_todos=true
END IF


ls_mes = string(Month(Date(ld_fecha)))
IF LEN(ls_mes) = 1 THEN
	ls_mes = "0" + ls_mes
END IF

ls_fecha_select = string(Year(Date(ld_fecha))) 
ls_fecha_select = ls_fecha_select + ls_mes
ls_fecha_select = ls_fecha_select + string(Day(Date(ld_fecha))) 


ls_fecha_select = " to_date( '" + ls_fecha_select  +"' ,'YYYYMMDD')" 

if li_rango=1 then
	
///agregado
if distinto_todos then
     ls_retorno = ls_retorno + " and to_date(to_char(gi_avisos.f_alta,'YYYYMMDD'),'YYYYMMDD')"  + ls_operador_fecha + &
	ls_fecha_select
else	
    ls_retorno = ls_retorno + " to_date(to_char(gi_avisos.f_alta,'YYYYMMDD'),'YYYYMMDD')"  + ls_operador_fecha + &
	ls_fecha_select
end if
////

end if

if li_rango=0 then
	ls_mes = string(Month(Date(ld_fecha_desde)))
	IF LEN(ls_mes) = 1 THEN
		ls_mes = "0" + ls_mes
	END IF
//////Agregado
if distinto_todos then
	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
	ls_fecha_rango = ls_fecha_rango + ls_mes
	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
	ls_retorno = ls_retorno + " and  to_date(to_char(gi_avisos.f_alta,'YYYYMMDD'),'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
	ls_fecha_select
else
	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
	ls_fecha_rango = ls_fecha_rango + ls_mes
	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
	ls_retorno = ls_retorno + " to_date(to_char(gi_avisos.f_alta,'YYYYMMDD'),'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
	ls_fecha_select
  end if
  ///////
end if

IF ld_fecha < ld_fecha_desde AND + &
	pd_dw.object.rango[1] = 0 THEN
	gnv_msg.f_mensaje("AP01","","",Ok!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha de comienzo no debe ser mayor que la Fecha de fin.",information!,ok!)
	ls_retorno="cancel"
	return ls_retorno
end if
ll_pp=DaysAfter(date(ld_fecha_desde),date(ld_fecha))
if (li_rango=1 and (ls_operador_fecha= "<" or ls_operador_fecha= "<>" or ls_operador_fecha= "<=")) & 
    or (li_rango=0 and DaysAfter(date(ld_fecha_desde),date(ld_fecha)) > 30) then
	 //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n que ha seleccionado puede demorar varios minutos.",information!,okcancel!)=2 then
	 if gnv_msg.f_mensaje("CP01","","",OkCancel!)=2 then	
		ls_retorno="cancel"
		return ls_retorno
	 end if
END IF
Return ls_retorno

end function

public function integer fnu_obtener_datos_2 (string ps_select, datawindow u_control_dw, boolean p_join);string error_syntaxfromsql,error_create
string new_syntax
string ls_compruebo, ls_tipo
string ls_nombre
//string ls_modify
INT LI_CONT=1
long ll_pos1=0
long ll_poscom=0
string ls_nombretrucho= "gener"
string ls_cadena='" )'
long ls_situa=1 
INT LI_CONTAPOS

IF fg_verifica_parametro("w_reportes") AND &
	w_genapp_frame.GetActiveSheet() <> w_consulta_sql then 
	ls_tipo = "Tabular"
ELSE
	ls_tipo = "Grid"
END IF

li_contapos=0
ll_pos1=Pos(new_syntax, ls_cadena)
new_syntax = SQLCA.SyntaxFromSQL(ps_select,'Style(Type=' + ls_tipo + ')',error_syntaxfromsql)

ll_pos1=Pos(new_syntax, ls_cadena)
if ll_pos1 > 0 then
	ll_pos1 = 1
	ib_hay=true
	DO WHILE ll_pos1 > 0
		ls_nombretrucho='"  name=cgener' + string(LI_CONT) + "_t )"
		ll_pos1=Pos(new_syntax, ls_cadena, ll_pos1)
		do while (ls_situa < ll_pos1) and (ls_situa <> 0)
			ls_situa=pos(new_syntax, "_t )" , ls_situa +len("text(band"))
			li_contapos++
		loop	
		new_syntax=Replace(new_syntax, ll_pos1, len(ls_cadena),ls_nombretrucho)
		ll_pos1= pos(new_syntax,ls_cadena, ll_pos1 + len(ls_nombretrucho))
		II_ARRAY_POS[li_cont]=li_contapos
		ii_maximo=li_cont
		LI_CONT++
		ls_situa = 1
		li_contapos =0 
	LOOP
end if

//Putaditas de powerbuilder, si no se selecciona el primer campo no pone la C, soluci$$HEX1$$f300$$ENDHEX$$n a pelo
ll_pos1=1
//if p_join=false then
//	DO WHILE Pos(new_syntax, "name",ll_pos1+4) <>0 
//		ll_pos1=Pos(new_syntax, "name",ll_pos1+4)
//		ls_compruebo=Mid(new_syntax, ll_pos1 - 2,2)
//		if ls_compruebo<>"db" then
//			new_syntax = Replace(new_syntax, ll_pos1, 5, "name=c")
//		end if
//	LOOP 
//end if
	
IF Len(error_syntaxfromsql) > 0 THEN
	//gnv_msg.f_mensaje("EP01",error_syntaxfromsql,"",Ok!)
	messageBox("Error", "Se ha producido un error a la hora de generar el informe como consecuencia de un fallo de sintaxis de la sentencia SQL generada.")
	//MessageBox("Error de conexi$$HEX1$$f300$$ENDHEX$$n con la bd",error_syntaxfromsql)
	Return -1
ELSE
	u_control_dw.Create(new_syntax, error_create)
	IF Len(error_create) > 0 THEN
		gnv_msg.f_mensaje("EP02",error_create,"",Ok!)
		//MessageBox("Error en la creaci$$HEX1$$f300$$ENDHEX$$n de la 'Datawindow'",error_create)
		Return -1
	END IF
END IF

u_control_dw.SetTransObject(SQLCA)
IF u_control_dw.Retrieve() = -1 THEN
	Return -1
END IF
u_control_dw.GetSQLPreview()
Return 1
end function

public function string fnu_filtro_brigadas (ref datawindow pd_dw);int li_estado
int li_tipo
int li_intervalo_horario,li_rango
datetime ld_fecha,ld_fecha_desde
string ls_operador_fecha
string ls_retorno
String ls_fecha_select
string ls_mes,ls_fecha_rango

li_estado = pd_dw.GetItemNumber(1,"ai_estado")
li_tipo = pd_dw.GetItemNumber(1,"ai_tipo")
ld_fecha = pd_dw.GetItemDateTime(1,"pa_periodo")
ls_operador_fecha = pd_dw.GetItemString(1,"pa_operador_fecha")
ld_fecha_desde=pd_dw.GetItemDateTime(1,"pa_rango")
IF isnull(ld_fecha_desde) THEN
	ld_fecha_desde = Datetime(Date("01/01/1900"), Time(""))
END IF
ls_retorno = " "
li_rango=pd_dw.GetItemNumber(1,"rango")

IF li_tipo <> 0 THEN
	ls_retorno = " and gi_brigada.tip_brigada = " + string(li_tipo)
END IF

IF li_estado <> 99 THEN
	ls_retorno = ls_retorno + " and gi_brigada.ind_disponible = " + string(li_estado)
END IF

//IF li_turno <> 0 THEN
//	ls_retorno = ls_retorno + " and gi_brigada.turno = " + string(li_estado)
//END IF

ls_mes = string(Month(Date(ld_fecha)))

IF LEN(ls_mes) = 1 THEN
	ls_mes = "0" + ls_mes
END IF

ls_fecha_select = string(Year(Date(ld_fecha))) 
ls_fecha_select = ls_fecha_select + ls_mes
ls_fecha_select = ls_fecha_select + string(Day(Date(ld_fecha))) 


ls_fecha_select = " to_date( '" + ls_fecha_select  +"' ,'YYYYMMDD')" 

if li_rango=1 then
ls_retorno = ls_retorno + " and to_date( to_char(gi_brigada.f_actual ,'YYYYMMDD'),'YYYYMMDD')" + ls_operador_fecha + &
	ls_fecha_select
end if

if li_rango=0 then
	ls_mes = string(Month(Date(ld_fecha_desde)))
	IF LEN(ls_mes) = 1 THEN
		ls_mes = "0" + ls_mes
	END IF

	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
	ls_fecha_rango = ls_fecha_rango + ls_mes
	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
	ls_retorno = ls_retorno + " and to_date(to_char( gi_brigada.f_actual ,'YYYYMMDD'),'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
	ls_fecha_select
end if

IF ld_fecha < ld_fecha_desde AND + &
	pd_dw.object.rango[1] = 0  THEN
	gnv_msg.f_mensaje("AP01","","",ok!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha de comienzo no debe ser mayor que la Fecha de fin.",information!,ok!)
	ls_retorno="cancel"
	return ls_retorno
end if

if (li_rango=1 and (ls_operador_fecha= "<" or ls_operador_fecha= "<>" or ls_operador_fecha= "<=")) & 
    or (li_rango=0 and DaysAfter(date(ld_fecha_desde),date(ld_fecha)) > 30) then
    //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n que ha seleccionado puede demorar varios minutos.",information!,okcancel!)=2 then
	 if gnv_msg.f_mensaje("CP01","","",OkCancel!) = 2 then
		ls_retorno="cancel"
		return ls_retorno
	 end if
END IF

Return ls_retorno
end function

public function string fnu_filtro_instalaciones (ref datawindow pd_dw);long ll_tension
int li_tipo
int li_clientes_imp
int li_clientes
int li_intervalo_horario,li_rango
Decimal ll_pot
datetime ld_fecha,ld_fecha_desde
string ls_operador_fecha,ls_operador_cl_imp,ls_operador_cl,ls_operador_pot
string ls_retorno
String ls_fecha_select
string ls_mes,ls_fecha_rango

ll_tension = pd_dw.GetItemNumber(1,"ai_tension")
li_tipo = pd_dw.GetItemNumber(1,"ai_tipo")
li_clientes_imp = pd_dw.GetItemnumber(1,"ai_clientes_imp")
li_clientes = pd_dw.GetItemnumber(1,"ai_clientes")
ls_operador_cl_imp=pd_dw.GetItemString(1,"pa_operador_cl_imp")
ls_operador_cl=pd_dw.GetItemString(1,"pa_operador_cl")
ld_fecha = pd_dw.GetItemDateTime(1,"pa_periodo")
ls_operador_fecha = pd_dw.GetItemString(1,"pa_operador_fecha")
ls_operador_pot = pd_dw.GetItemString(1,"pa_operador_pot")
ld_fecha_desde=pd_dw.GetItemDateTime(1,"pa_rango")
IF isnull(ld_fecha_desde) THEN
	ld_fecha_desde = Datetime(Date("01/01/1900"), Time(""))
END IF
ll_pot=pd_dw.GetItemnumber(1,"pn_pot_inst")
ls_retorno = " "
li_rango=pd_dw.GetItemNumber(1,"rango")

IF li_tipo <> 0 THEN
	ls_retorno = " and sgd_instalacion.tipo_instalacion = " + string(li_tipo)
END IF

IF ll_tension <> 0 THEN
	ls_retorno = ls_retorno + " and sgd_instalacion.tension = " + string(ll_tension)
END IF

ls_mes = string(Month(Date(ld_fecha)))

IF LEN(ls_mes) = 1 THEN
	ls_mes = "0" + ls_mes
END IF

if li_clientes>0 or ls_operador_cl <> ">=" then
	ls_retorno=ls_retorno + " and sgd_instalacion.cant_cli " + ls_operador_cl + string(li_clientes)
end if

if li_clientes_imp>0 or ls_operador_cl_imp <> ">=" then
	ls_retorno=ls_retorno + " and sgd_instalacion.can_cli_imp " + ls_operador_cl_imp + string(li_clientes_imp)
end if

IF ll_pot >0 or ls_operador_pot <> ">="THEN
	ls_retorno = ls_retorno + " and sgd_instalacion.pot_instalada " + ls_operador_pot + string(ll_pot)
END IF
ls_fecha_select = string(Year(Date(ld_fecha))) 
ls_fecha_select = ls_fecha_select + ls_mes
ls_fecha_select = ls_fecha_select + string(Day(Date(ld_fecha))) 


ls_fecha_select = " to_date( '" + ls_fecha_select  +"' ,'YYYYMMDD')" 

if li_rango=1 then
ls_retorno = ls_retorno + " and to_date(to_char(sgd_instalacion.f_actual,'YYYYMMDD'),'YYYYMMDD')"  + ls_operador_fecha + &
	ls_fecha_select
end if

if li_clientes_imp = 0 and (ls_operador_cl_imp = "<=" or ls_operador_cl_imp = "<") then
gnv_msg.f_mensaje("AP07","","",Ok!)
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El n$$HEX1$$fa00$$ENDHEX$$mero de clientes importantes no puede ser negativo")
	ls_retorno="cancel"
	return ls_retorno
end if

if ll_pot = 0 and (ls_operador_pot = "<=" or ls_operador_pot = "<") then
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La cantidad de potencia no puede ser negativa")
gnv_msg.f_mensaje("AP08","","",Ok!)
	ls_retorno="cancel"
	return ls_retorno
end if

if li_clientes = 0 and (ls_operador_cl = "<=" or ls_operador_cl = "<") then
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El n$$HEX1$$fa00$$ENDHEX$$mero de clientes no puede ser negativo")
gnv_msg.f_mensaje("AP07","","",Ok!)
	ls_retorno="cancel"
	return ls_retorno
end if

if li_rango=0 then
	ls_mes = string(Month(Date(ld_fecha_desde)))
	IF LEN(ls_mes) = 1 THEN
		ls_mes = "0" + ls_mes
	END IF

	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
	ls_fecha_rango = ls_fecha_rango + ls_mes
	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
	ls_retorno = ls_retorno + " and to_date(to_char(sgd_instalacion.f_actual,'YYYYMMDD'),'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
	ls_fecha_select
end if

IF ld_fecha < ld_fecha_desde AND + &
	pd_dw.object.rango[1] = 0 THEN
	gnv_msg.f_mensaje("AP01","","",ok!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha de comienzo no debe ser mayor que la Fecha de fin.",information!,ok!)
	ls_retorno="cancel"
	return ls_retorno
end if

if (li_rango=1 and (ls_operador_fecha= "<" or ls_operador_fecha= "<>" or ls_operador_fecha= "<=")) & 
    or (li_rango=0 and DaysAfter(date(ld_fecha_desde),date(ld_fecha)) > 30) then
    //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n que ha seleccionado puede demorar varios minutos.",information!,okcancel!)=2 then
	 if gnv_msg.f_mensaje("CP01","","",OkCancel!) = 2 then
		ls_retorno="cancel"
		return ls_retorno
	 end if
END IF

Return ls_retorno
end function

public function boolean fnu_cambio_nombres (string ps_campos[], string ps_nombres[], integer numero, datawindow pd_data);
///////////////////////////////////////////////////////
//										
// Funcion: fnu_cambio_nombres
// 
// Objetivo: Repara los nombres de las cabeceras de la
// Datawindow DW_1 y Ajusta el tama$$HEX1$$f100$$ENDHEX$$o y posicion de las 
// cabeceras
//	
//
// Responsable: FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_campos[]
// 				ps_nombres[]
//					numero
//					pd_data
//		Salida : Boolean 
//					True - Si ocurrio
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////
string cad


int li_contador
STRING LS_CAMPOS
string ls_nombtrucho
integer li_conta2=1
long ll_largo_col
long ll_largo_col_antigua
long ll_sumas = 5
long ll_sumastemp=5
string ls_size_cab,setting
string ls_size_col
string ls_nom_col
string ls_nom_col_antigua
string ls_synt_columna
string ls_larg_campos

/////Compruebo si hay algun campo con join; si no hay ninguno el cabroncete de 
// powerbuilder no coloca una c delante de el nombre del campo en la sintaxis de la DW

for li_contador=1 to numero

	ls_nombtrucho="cgener" + string(li_conta2) + "_t"
	///Rutina para calcular el largo que debe tener el campo
	ll_largo_col=len(ps_nombres[li_contador])*32 
	///rutina para averiguar el nombre de la columna
	ls_nom_col= "#" + string(li_contador) + ".name"

	ls_nom_col=pd_data.describe(ls_nom_col)
	cad=ls_nom_col	
	///	

	if ib_hay = true then
		
		if li_contador=ii_array_pos[li_conta2] then
			//ls_size_cab= ls_nombtrucho + ".Width=" + string(ll_largo_col) //tama$$HEX1$$f100$$ENDHEX$$o
			LS_CAMPOS= ls_nombtrucho + ".text =' " + upper(ps_nombres[li_contador]) + "' "
			ls_nom_col_antigua=ls_nombtrucho + ".Width"
			ll_largo_col_antigua=long(pd_data.Describe(ls_nom_col_antigua)) 
			//ls_larg_campos=ls_nombtrucho + ".X="
			//ls_larg_campos="c" + ps_campos[li_contador] + "_t" + ".X=" //lfe
			//juan
			if ll_largo_col_antigua < ll_largo_col then
				//pd_data.Modify(ls_size_cab) //juan
				ls_synt_columna=ls_nombtrucho + ".Width=" + string(ll_largo_col) //juan
				pd_data.Modify(ls_synt_columna)
				ll_sumas=ll_sumas + ll_largo_col
			else
				ll_sumas=ll_sumas + ll_largo_col_antigua
			end if
				//ls_larg_campos = ls_larg_campos + string(ll_sumastemp) //juan
				//pd_data.Modify(ls_larg_campos) //juan
				ls_synt_columna=ls_nombtrucho + ".X=" + string(ll_sumastemp) //juan
				pd_data.Modify(ls_synt_columna)
				ll_sumastemp=ll_sumas

			if li_conta2< ii_maximo then
				li_conta2++
			end if
		else
			//ls_size_cab= "c" + ps_campos[li_contador] + "_t" + ".Width=" + string(ll_largo_col)//tama$$HEX1$$f100$$ENDHEX$$o
			//LS_CAMPOS="c" + ps_campos[li_contador] + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' "
			LS_CAMPOS=ls_nom_col + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' " //LFE
			ls_nom_col_antigua= ls_nom_col + "_t.Width"
			ll_largo_col_antigua=long(pd_data.Describe(ls_nom_col_antigua)) 
			//ls_larg_campos="c" + ps_campos[li_contador] + "_t.X="
			//juan
			if ll_largo_col_antigua < ll_largo_col then
				//pd_data.Modify(ls_size_cab) //juan
				ls_synt_columna=ls_nom_col + "_t.Width=" + string(ll_largo_col) //juan
				pd_data.Modify(ls_synt_columna)
				ll_sumas=ll_sumas + ll_largo_col
			else
				ll_sumas=ll_sumas + ll_largo_col_antigua
			end if
				//ls_larg_campos = ls_larg_campos + string(ll_sumastemp) //juan
				//pd_data.Modify(ls_larg_campos) //juan
				ls_synt_columna=ls_nom_col + "_t.X=" + string(ll_sumastemp) //juan
				pd_data.Modify(ls_synt_columna)
				ll_sumastemp=ll_sumas

		end if
	else
			//ls_size_cab= "c" + ps_campos[li_contador] + "_t" + ".Width=" + string(ll_largo_col)//tama$$HEX1$$f100$$ENDHEX$$o
			//LS_CAMPOS="c" + ps_campos[li_contador] + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' "
			LS_CAMPOS=ls_nom_col + "_t.text" + " =' " + upper(ps_nombres[li_contador]) + "' "  //LFE
			ls_nom_col_antigua= ls_nom_col + "_t.Width"
			//ls_nom_col_antigua="c" + ps_campos[li_contador] + "_t" + ".Width" //juan
			ll_largo_col_antigua=long(pd_data.Describe(ls_nom_col_antigua)) 
			//ls_larg_campos="c" + ps_campos[li_contador] + "_t" + ".X=" //juan
			//juan
			if ll_largo_col_antigua < ll_largo_col then
				//pd_data.Modify(ls_size_cab) //juan
				ls_synt_columna=ls_nom_col + "_t.Width=" + string(ll_largo_col) //juan
				pd_data.Modify(ls_synt_columna)
				ll_sumas=ll_sumas + ll_largo_col
			else
				ll_sumas=ll_sumas + ll_largo_col_antigua
			end if
				//ls_larg_campos = ls_larg_campos + string(ll_sumastemp) //juan
				//pd_data.Modify(ls_larg_campos) //juan
				ls_synt_columna=ls_nom_col + "_t.X=" + string(ll_sumastemp) //juan
				pd_data.Modify(ls_synt_columna)
				ll_sumastemp=ll_sumas

	end if
	pd_data.Modify(LS_CAMPOS)
	
	next

return true

end function

public function integer f_preparo_datawindow (datawindow pd_data, string ps_nombres[]);///////////////////////////////////////////////////////
//										
// Funcion: f_preparo_datawindow
// 
// Objetivo: Establece cabeceras, Bordes y Colores 
//           de la Datawindow
//	
//
// Responsable: FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_data
//					ps_nombres[]
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_colcount,ls_nombre,ls_nombre2,ls_nombre3
int li_n,li_f
string ls_nombtrucho,ls_nombre_pos,LS_NOMBRE4
integer li_conta2=1
long ll_posicion,LL_TAMA$$HEX1$$d100$$ENDHEX$$O
long ll_contador=0

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//pd_data.Modify("DataWindow.Color='12632256'")
pd_data.Modify("DataWindow.Color='81324524'")
// Fin. Sgo.

ls_colcount = pd_data.Object.DataWindow.Column.Count //juan
li_f=integer(ls_colcount)
for li_n=1 to li_f
	ls_nombtrucho="cgener" + string(li_conta2)
	ls_colcount= "#" + string(li_n) + ".name"
	ls_nombre = pd_data.Describe(ls_colcount)
	pd_data.Modify(ls_nombre + ".color=" + string(65536*128))
	if ib_hay = true then
		if li_n=ii_array_pos[li_conta2] then
			ls_nombre_pos= ls_nombtrucho + "_t.X"
			LS_NOMBRE4=ls_nombtrucho + "_t.Width"
			LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))
			ls_nombre4=ls_nombtrucho + "_t.Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o + 300)
			pd_data.Modify(ls_nombre4)
			ll_posicion=long(pd_data.describe(ls_nombre_pos))
			LS_nombre2=ls_nombtrucho + "_t.border='6'"
         LS_nombre3=ls_nombtrucho + "_t.Font.weight ='600'"
			if li_conta2< ii_maximo then
				li_conta2++
			end if
		else	
			LS_NOMBRE4=ls_nombre + "_t.Width"
			LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))   
			ls_nombre4=ls_nombre + "_t.Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o + 300)
			pd_data.Modify(ls_nombre4)	
			ls_nombre2= ls_nombre + "_t.Border='6'"
			LS_nombre3=ls_nombre + "_t.Font.weight ='600'"
			ls_nombre_pos=ls_nombre + "_t.X"
			ll_posicion=long(pd_data.describe(ls_nombre_pos))
	
		END IF

	else
		LS_NOMBRE4=ls_nombre + "_t.Width"
		LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))
		ls_nombre4=ls_nombre + "_t.Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o + 300)
		pd_data.Modify(ls_nombre4)
		LS_nombre3=ls_nombre + "_t.Font.weight ='600'"
		ls_nombre2= ls_nombre + "_t.Border='6'"
		ls_nombre_pos=ls_nombre + "_t.X"
		ll_posicion=long(pd_data.describe(ls_nombre_pos))
	end if
	pd_data.Modify(ls_nombre2)
	pd_data.Modify(ls_nombre3)

	if ll_posicion<>0 then
		long ll
		//LS_NOMBRE4=ls_nombre + ".Width"
		//LL_TAMA$$HEX1$$d100$$ENDHEX$$O=long(pd_data.describe(ls_NOMBRE4))
		//ll = long(pd_data.describe(ls_NOMBRE + "_t.Width"))
		ls_nombre4=ls_nombre + ".Width=" + string(ll_tama$$HEX1$$f100$$ENDHEX$$o+300)
		pd_data.Modify(ls_nombre4)
		ls_nombre_pos= ls_nombre_pos + "=" + string(ll_posicion + ll_contador) 
		ls_nombre_pos=pd_data.modify(ls_nombre_pos)
		ls_nombre=ls_nombre + ".X=" + string(ll_posicion + ll_contador)   
		ls_nombre_pos=pd_data.modify(ls_nombre)

	end if
	ll_contador= ll_contador + 120
next
if ib_hay = true then
	for li_n=1 to li_conta2
		ii_array_pos[li_n]=0
		ib_hay=false
	next
END IF
return 1

end function

public function string fnu_filtro_reenganche (ref datawindow pd_dw);
int li_tension
int li_rango
datetime ld_fecha,ld_fecha_desde
string ls_operador_fecha
string ls_retorno
String ls_fecha_select
string ls_mes,ls_fecha_rango

li_tension = pd_dw.GetItemNumber(1,"pa_tension_afectada")
ld_fecha = pd_dw.GetItemDateTime(1,"pa_periodo")
ls_operador_fecha = pd_dw.GetItemString(1,"pa_operador_fecha")
ld_fecha_desde=pd_dw.GetItemDateTime(1,"pa_rango")

IF isnull(ld_fecha_desde) THEN
	ld_fecha_desde = Datetime(Date("01/01/1900"), Time(""))
END IF

ls_retorno = " "
li_rango=pd_dw.GetItemNumber(1,"rango")

IF li_tension <> 0 THEN
	ls_retorno = " and sgd_reenganches.tip_tension = " + string(li_tension)

END IF

ls_mes = string(Month(Date(ld_fecha)))
IF LEN(ls_mes) = 1 THEN
	ls_mes = "0" + ls_mes
END IF

ls_fecha_select = string(Year(Date(ld_fecha))) 
ls_fecha_select = ls_fecha_select + ls_mes
ls_fecha_select = ls_fecha_select + string(Day(Date(ld_fecha))) 


ls_fecha_select = " to_date( '" + ls_fecha_select  +"' ,'YYYYMMDD')" 

if li_rango=1 then
ls_retorno = ls_retorno + " and to_date(to_char(sgd_reenganches.f_deteccion ,'YYYYMMDD'),'YYYYMMDD') " + ls_operador_fecha + &
	ls_fecha_select
end if

if li_rango=0 then
	ls_mes = string(Month(Date(ld_fecha_desde)))
	IF LEN(ls_mes) = 1 THEN
		ls_mes = "0" + ls_mes
	END IF

	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
	ls_fecha_rango = ls_fecha_rango + ls_mes
	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
	ls_retorno = ls_retorno + " and to_date(to_char(sgd_reenganches.f_deteccion,'YYYYMMDD'),'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
	ls_fecha_select
end if

IF ld_fecha < ld_fecha_desde AND + &
	pd_dw.object.rango[1] = 0  THEN
	gnv_msg.f_mensaje("AP01","","",ok!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha de comienzo no debe ser mayor que la Fecha de fin.",information!,ok!)
	ls_retorno="cancel"
	return ls_retorno
end if

if (li_rango=1 and (ls_operador_fecha= "<" or ls_operador_fecha= "<>" or ls_operador_fecha= "<=")) & 
    or (li_rango=0 and DaysAfter(date(ld_fecha_desde),date(ld_fecha)) > 30) then
    //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n que ha seleccionado puede demorar varios minutos.",information!,okcancel!)=2 then
	 if gnv_msg.f_mensaje("CP01","","",OkCancel!) = 2 then
		ls_retorno="cancel"
		return ls_retorno
	 end if
END IF

Return ls_retorno
end function

public function string fnu_filtro_descargos (ref datawindow pd_dw);int li_intervalo_horario, li_mat_averiado
int li_tipo,li_rango, li_alcance

datetime ld_fecha,ld_fecha_desde
string ls_operador_fecha
string ls_retorno,ls_mat_averiado
String ls_fecha_select
string ls_mes,ls_fecha_rango
string ls_causa

int li_tipo_fecha, li_estado_descargo, li_interrup
string ls_tipo_fecha

li_alcance = pd_dw.GetItemNumber(1,"ai_alcance")
ld_fecha = pd_dw.GetItemDateTime(1,"pa_periodo")
ls_operador_fecha = pd_dw.GetItemString(1,"pa_operador_fecha")
ld_fecha_desde=pd_dw.GetItemDateTime(1,"pa_rango")
li_tipo_fecha= pd_dw.GetItemNumber(1,"tipo_fecha")
li_estado_descargo= pd_dw.GetItemNumber(1,"ai_estado_descargo")
li_interrup= pd_dw.GetItemNumber(1,"ai_interrup")

IF isnull(ld_fecha_desde) THEN
	ld_fecha_desde = Datetime(Date("01/01/1900"), Time(""))
END IF

ls_retorno = " "
li_rango=pd_dw.GetItemNumber(1,"rango")

IF li_alcance <> 0 THEN
	ls_retorno = ls_retorno + " and sgd_instalacion.tension = " + string(li_alcance)
END IF

IF li_estado_descargo <> 0 THEN
	ls_retorno += " and sgd_descargos.estado= " + string (li_estado_descargo)
END IF

IF li_interrup <> 0 THEN
	ls_retorno += " and nvl(sgd_descargos.ind_interrupcion,1)= " + string(li_interrup) 
END IF

CHOOSE CASE li_tipo_fecha
	CASE 1
		ls_tipo_fecha= 'f_alta'	
	CASE 2
		ls_tipo_fecha= 'f_solicitado'
	CASE 3
		ls_tipo_fecha= 'f_ini_solicitado'		
	CASE 4
		ls_tipo_fecha= 'f_fin_solicitado'
	CASE 5
		ls_tipo_fecha= 'f_aprobado'
	CASE 6
		ls_tipo_fecha= 'f_ini_aprobado'
	CASE 7
		ls_tipo_fecha= 'f_fin_aprobado'
	CASE 8
		ls_tipo_fecha= 'f_activado'
END CHOOSE

ls_mes = string(Month(Date(ld_fecha)))
IF LEN(ls_mes) = 1 THEN
	ls_mes = "0" + ls_mes
END IF

ls_fecha_select = string(Year(Date(ld_fecha))) 
ls_fecha_select = ls_fecha_select + ls_mes
ls_fecha_select = ls_fecha_select + string(Day(Date(ld_fecha))) 


ls_fecha_select = " to_date( '" + ls_fecha_select  +"' ,'YYYYMMDD')" 

if li_rango=1 then
	ls_retorno = ls_retorno + " and to_date(to_char(sgd_descargos." + ls_tipo_fecha+ " ,'YYYYMMDD') ,'YYYYMMDD') " + ls_operador_fecha + &
		ls_fecha_select
end if

if li_rango=0 then
	ls_mes = string(Month(Date(ld_fecha_desde)))
	IF LEN(ls_mes) = 1 THEN
		ls_mes = "0" + ls_mes
	END IF

	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
	ls_fecha_rango = ls_fecha_rango + ls_mes
	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
	ls_retorno = ls_retorno + " and to_date(to_char(sgd_descargos." + ls_tipo_fecha+ " ,'YYYYMMDD') ,'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
	ls_fecha_select
end if

IF ld_fecha < ld_fecha_desde AND + &
	pd_dw.object.rango[1] = 0  THEN
	gnv_msg.f_mensaje("AP01","","",ok!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha de comienzo no debe ser mayor que la Fecha de fin.",information!,ok!)
	ls_retorno="cancel"
	return ls_retorno
end if

if (li_rango=1 and (ls_operador_fecha= "<" or ls_operador_fecha= "<>" or ls_operador_fecha= "<=")) & 
    or (li_rango=0 and DaysAfter(date(ld_fecha_desde),date(ld_fecha)) > 30) then
    //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La operaci$$HEX1$$f300$$ENDHEX$$n que ha seleccionado puede demorar varios minutos.",information!,okcancel!)=2 then
	 if gnv_msg.f_mensaje("CP01","","",OkCancel!) = 2 then
		ls_retorno="cancel"
		return ls_retorno
	 end if
END IF

Return ls_retorno
end function

on u_5001_nu_reportes.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_5001_nu_reportes.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


HA$PBExportHeader$u_bdg_2004_nu_inc_sum.sru
forward
global type u_bdg_2004_nu_inc_sum from u_bdg_1002_nu_generico
end type
end forward

global type u_bdg_2004_nu_inc_sum from u_bdg_1002_nu_generico
end type
global u_bdg_2004_nu_inc_sum u_bdg_2004_nu_inc_sum

forward prototypes
public function integer fnu_desplegar_tiepi (ref datawindow pd_dw)
public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, datawindow pd_dw)
public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_totales, integer pi_unidades, integer pi_zona, integer pi_cmd, integer pi_sector, date pd_periodo, integer pi_int_horario, string ps_mat_averiado, integer pi_tip_incidencia)
end prototypes

public function integer fnu_desplegar_tiepi (ref datawindow pd_dw);integer is_cont

for is_cont = 1 to pd_dw.rowCount()
	pd_dw.setItem(is_cont, "incidencia_bdg_tiepi_aport", pd_dw.getItemNumber(is_Cont, "incidencia_bdg_tiepi_aport_comp"))
	pd_dw.setItem(is_cont, "tiebt_aport", pd_dw.getItemNumber(is_Cont, "tiebt_aport_comp"))
	pd_dw.setItem(is_cont, "tiebt_propio", pd_dw.getItemNumber(is_Cont, "tiebt_propio_comp"))
	pd_dw.setItem(is_cont, "incidencia_bdg_tiepi", pd_dw.getItemNumber(is_Cont, "incidencia_bdg_tiepi_comp"))
next
return 1

	
end function

public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, datawindow pd_dw);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  fnu_mostrar_cabeceras_dw
//
// Objetivo: Hace visible e invisibles los campos centro, cmd, sector y fecha
//				 de la datawindow dependiendo de los criterios de selecci$$HEX1$$f300$$ENDHEX$$n de datos
//
//           
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       05/10/2000   GSH
//
/////////////////////////////////////////////////////////////////////////

IF pi_historicos = 1 THEN
// Si es historico se muestra la fecha y se oculta el resto	
	pd_dw.Modify("nom_puesto_t.Visible = 0")
	pd_dw.Modify("nom_cmd_t.Visible = 0")
	pd_dw.Modify("nom_centro_t.Visible = 0")

	pd_dw.Modify("nom_puesto.Visible = 0")
	pd_dw.Modify("nom_cmd.Visible = 0")
	pd_dw.Modify("nom_centro.Visible = 0")

	pd_dw.Modify("fecha.Visible = 1")
	pd_dw.Modify("fecha_t.Visible = 1")
	
ELSE
	// Si no es hist$$HEX1$$f300$$ENDHEX$$rico, oculta la fecha y se muestra el resto dependiendo 
	// del tipo de ambito
	
	pd_dw.Modify("fecha.Visible = 0")
	pd_dw.Modify("fecha_t.Visible = 0")

	CHOOSE CASE ps_tipo_ambito
		CASE "TODOSCMD"
			pd_dw.Modify("nom_puesto_t.Visible = 0")
			pd_dw.Modify("nom_cmd_t.Visible = 1")
			pd_dw.Modify("nom_centro_t.Visible = 0")
			
			pd_dw.Modify("nom_puesto.Visible = 0")
			pd_dw.Modify("nom_cmd.Visible = 1")
			pd_dw.Modify("nom_centro.Visible = 0")
	
		CASE "TODOS"
			pd_dw.Modify("nom_puesto_t.Visible = 0")
			pd_dw.Modify("nom_cmd_t.Visible = 0")
			pd_dw.Modify("nom_centro_t.Visible = 1")
			
			pd_dw.Modify("nom_puesto.Visible = 0")
			pd_dw.Modify("nom_cmd.Visible = 0")
			pd_dw.Modify("nom_centro.Visible = 1")
			
//		CASE "CENTRO"			
//			pd_dw.Modify("centro_nom_puesto_t.Visible = 0")
//			pd_dw.Modify("centro_nom_cmd_t.Visible = 1")
//			pd_dw.Modify("centro_nom_centro_t.Visible = 0")
//						
//			pd_dw.Modify("centro_nom_puesto.Visible = 0")
//			pd_dw.Modify("centro_nom_cmd.Visible = 1")
//			pd_dw.Modify("centro_nom_centro.Visible = 0")
						
		CASE  "MESA","CMD","CENTRO"
			pd_dw.Modify("nom_puesto_t.Visible = 1")
			pd_dw.Modify("nom_cmd_t.Visible = 0")
			pd_dw.Modify("nom_centro_t.Visible = 0")
			
			pd_dw.Modify("nom_puesto.Visible = 1")
			pd_dw.Modify("nom_cmd.Visible = 0")
			pd_dw.Modify("nom_centro.Visible = 0")

	END CHOOSE

END IF
end subroutine

public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_totales, integer pi_unidades, integer pi_zona, integer pi_cmd, integer pi_sector, date pd_periodo, integer pi_int_horario, string ps_mat_averiado, integer pi_tip_incidencia);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  fnu_armar_sql
//
// Objetivo: Configuraci$$HEX1$$f300$$ENDHEX$$n de la cadena Instrucci$$HEX1$$f300$$ENDHEX$$n <Select> dependiendo 
//           del criterio seleccionado por el usuario en los distintos 
//           objetos al efecto.
//
//           MATO: Validaci$$HEX1$$f300$$ENDHEX$$n fecha, por nro. mes. y nro. a$$HEX1$$f100$$ENDHEX$$o(yyyy).
//                 Filtro por $$HEX1$$c100$$ENDHEX$$mbito CMD. 
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1996   ALE
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   14/12/1998   MATO (Pruebas Vol.)
//													 08/05/2000	  DSA					
//								 Incluir el campo Tip_Incidencias para que 
//								 la ventana sirva a todos tipos de Incidencia de nivel suministro.
//																				
/////////////////////////////////////////////////////////////////////////

string ls_select1, ls_select2
string ls_fila_marcada, ls_val_promedio

string ls_max, ls_max_fecha, ls_signo_fecha_mes, ls_signo_fecha_anio
string ls_signo_centro, ls_signo_cmd, ls_signo_mesa
// Seteo si quiere las sumas o los promedios dependiendo de las unidades
// 1 Cantidades, 0 Porcentajes.
fnu_mostrar_cabeceras_dw(pi_historicos, ps_tip_ambito, pd_dw)

if pi_unidades = 1 then
	 ls_val_promedio = '0'
else
	 ls_val_promedio = '1'
end if

if pi_totales = 1 then
	 ls_fila_marcada = '1'
else
	 ls_fila_marcada = '0'
end if


if pi_historicos = 1 then
	ls_max = 'max'
	ls_max_fecha = ''
	ls_signo_fecha_mes = '<='
	ls_signo_fecha_anio = '<='
else
	ls_max =''
	ls_max_fecha = 'max'
	if pi_acumulado = 0 then
		ls_signo_fecha_mes = '='
		ls_signo_fecha_anio = '='
	else
		ls_signo_fecha_mes = '<='
		ls_signo_fecha_anio = '='
	end if

end if

CHOOSE CASE ps_tip_ambito
	CASE "TODOSCMD"
		ls_signo_centro = '='
		ls_signo_cmd = '>'
		ls_signo_mesa = '='
	CASE "TODOS"
		ls_signo_centro = '>'
		ls_signo_cmd = '='
		ls_signo_mesa = '='
	CASE "CENTRO"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '>'
	CASE "CMD"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '>'
	CASE "MESA"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '='
END CHOOSE

ls_select1 = ' SELECT ' + ls_max_fecha+ ' (GI_SUMINISTROS_BDG.FECHA),' + &
	           ls_max + '(GI_SUMINISTROS_BDG.CENTRO) CENTRO,' + &
		        ls_max + '(GI_SUMINISTROS_BDG.CMD) CMD,' + &   
		        ls_max + '(GI_SUMINISTROS_BDG.MESA) MESA,' + &   
		        ls_max + '(CENTRO_A.NOM_CENTRO),' + &   
		        ls_max + '(CENTRO_B.NOM_CENTRO),' + &   
		        ls_max + '(CENTRO_C.NOM_CENTRO),' + &   
		        'sum(GI_SUMINISTROS_BDG.CANT_INCIDENCIAS) CANT_INCIDENCIAS,' + &   
		        'ROUND(sum(GI_SUMINISTROS_BDG.DURACION_ENV_BRIGADA) / sum(GI_SUMINISTROS_BDG.CANT_INCIDENCIAS),2) DURACION_ENV_BRIGADA,' + &   
		        'ROUND(sum(GI_SUMINISTROS_BDG.DURACION_SR) / sum(GI_SUMINISTROS_BDG.CANT_INCIDENCIAS),2) DURACION_SR,' + &   
		        'ROUND(sum(GI_SUMINISTROS_BDG.DURACION_RS) / sum(GI_SUMINISTROS_BDG.CANT_INCIDENCIAS),2) DURACION_RS,' + &   
		        'sum(GI_SUMINISTROS_BDG.INC_MENOR_18) INC_MENOR_18,' + &   
		        'max(' + ls_fila_marcada + ') FILA_MARCADA,' + &   
				  'max(' + ls_val_promedio + ') SUMAS_PROMEDIO ' +&
				  'FROM GI_SUMINISTROS_BDG, SGD_CENTRO CENTRO_A, SGD_CENTRO CENTRO_B, SGD_CENTRO CENTRO_C '+ &
				  ' WHERE ( GI_SUMINISTROS_BDG.CENTRO = CENTRO_A.NRO_CENTRO ) and  ' + &
	        		'( GI_SUMINISTROS_BDG.CMD = CENTRO_B.NRO_CENTRO ) and  ' + &
		         '( GI_SUMINISTROS_BDG.MESA = CENTRO_C.NRO_CENTRO ) and  ' + &
   				'( CENTRO_C.TIP_CENTRO = 3 or centro_c.nro_centro=0) and (CENTRO_B.TIP_CENTRO = 2 or centro_B.nro_centro=0) and  (CENTRO_A.TIP_CENTRO = 1) and '+ & 
			      '( TO_NUMBER(SUBSTR(TO_CHAR(GI_SUMINISTROS_BDG.FECHA,~'DD/MM/YYYY HH24:MI:SS~'),4,2)) ' + ls_signo_fecha_mes + string(month(pd_periodo))  + ' ) AND ' + &
					'( TO_NUMBER(SUBSTR(TO_CHAR(GI_SUMINISTROS_BDG.FECHA,~'DD/MM/YYYY HH24:MI:SS~'),7,4)) ' + ls_signo_fecha_anio + string(year(pd_periodo))  + ' ) AND ' + &
					'( GI_SUMINISTROS_BDG.CENTRO' + ls_signo_centro + string(pi_zona) + ') AND ' + &
					'( GI_SUMINISTROS_BDG.CMD' + ls_signo_cmd + string(pi_cmd) + ' ) AND  ' + &
					'( GI_SUMINISTROS_BDG.MESA' + ls_signo_mesa + string(pi_sector) +') AND '  + &
					'( GI_SUMINISTROS_BDG.FAM_MAT_AVERIADO = ~'' + ps_mat_averiado + '~' ) AND  ' + &
					'( GI_SUMINISTROS_BDG.HORARIO = ' + string (pi_int_horario) + '  )  AND ' + &
					'( GI_SUMINISTROS_BDG.TIP_INCIDENCIA = ' + string (pi_tip_incidencia) + ' ) ' 		

//********************************************************************
if pi_historicos = 1 then
	ls_select2 = ' GROUP BY GI_SUMINISTROS_BDG.FECHA ORDER BY FECHA'
else
	ls_select2 = ' GROUP BY GI_SUMINISTROS_BDG.CENTRO, ' + &
		         'GI_SUMINISTROS_BDG.CMD, ' + &
		         'GI_SUMINISTROS_BDG.MESA, ' + &
		         'CENTRO_A.NOM_CENTRO, ' + &
		         'CENTRO_B.NOM_CENTRO, ' + &
		         'CENTRO_C.NOM_CENTRO  '
					//ORDER BY 5,6,7 '
end if
string i
//i = pd_dw.Modify("DataWindow.Table.Select=' " + ls_select1 + ls_select2 + "'")

pd_dw.Object.DataWindow.Table.Select= ls_select1 + ls_select2

return 1
end function


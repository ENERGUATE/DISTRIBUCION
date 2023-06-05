HA$PBExportHeader$u_bdg_2002_nu_est_zona_geo1.sru
forward
global type u_bdg_2002_nu_est_zona_geo1 from u_bdg_1002_nu_generico
end type
end forward

global type u_bdg_2002_nu_est_zona_geo1 from u_bdg_1002_nu_generico
end type
global u_bdg_2002_nu_est_zona_geo1 u_bdg_2002_nu_est_zona_geo1

forward prototypes
public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, ref datawindow pd_dw)
public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, string ps_tabla_bdg, integer pi_historicos, integer pi_zona, integer pi_cmd, integer pi_sector, long pl_tip_incidencia, integer pi_tension_afectada, string ps_material_aver, integer pi_int_horario, date pd_period)
end prototypes

public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  fnu_mostrar_cabeceras_dw
//
// Objetivo: Hace visible e invisibles los campos centro, cmd, sector y fecha
//				 de la datawindow dependiendo de los criterios de selecci$$HEX1$$f300$$ENDHEX$$n de datos
//
//           
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       25/09/2000   LFE GSH
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
	
		CASE "CENTRO", "CMD","MESA"
			pd_dw.Modify("nom_puesto_t.Visible = 1")
			pd_dw.Modify("nom_cmd_t.Visible = 0")
			pd_dw.Modify("nom_centro_t.Visible = 0")
			
			pd_dw.Modify("nom_puesto.Visible = 1")
			pd_dw.Modify("nom_cmd.Visible = 0")
			pd_dw.Modify("nom_centro.Visible = 0")
	
	END CHOOSE

END IF

end subroutine

public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, string ps_tabla_bdg, integer pi_historicos, integer pi_zona, integer pi_cmd, integer pi_sector, long pl_tip_incidencia, integer pi_tension_afectada, string ps_material_aver, integer pi_int_horario, date pd_period);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  u_bdg_2002_nu_est_zomna_geo1::fnu_armar_sql
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
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   09/12/1998   MATO (Pruebas Vol.)
//													 03/04/2000	  DSA   Incidencia programada puede ser 
//																				de dos tipos Con Interrupcion (2)		
//																								 Sin Interrupcion (3)	
//													 9/10/2000	  LFE   Redise$$HEX1$$f100$$ENDHEX$$o de la funci$$HEX1$$f300$$ENDHEX$$n
//
/////////////////////////////////////////////////////////////////////////

string ls_select1, ls_select2, ls_sum, ls_max, ls_signo_centro, ls_max_fecha,ls_p
string ls_signo_cmd, ls_signo_mesa, ls_signo_fecha_mes, ls_signo_fecha_anio

// Cambia el nombre de la primera columna de la cabecera : Ambito, fecha
fnu_mostrar_cabeceras_dw(pi_historicos, ps_tip_ambito, pd_dw)

//Cargo los signos de comparacion para la clausura where

IF pi_historicos = 1 THEN
	ls_max = 'max'
	ls_signo_fecha_mes = '<='
	ls_signo_fecha_anio = '<='
	ls_max_fecha =''
ELSE
	ls_max = ''
	ls_max_fecha = 'max'
	IF pi_acumulado = 0 THEN
		ls_signo_fecha_mes = '='
		ls_signo_fecha_anio = '='
	ELSE 
		ls_signo_fecha_mes = '<='
		ls_signo_fecha_anio = '='
	END IF
END IF

CHOOSE CASE ps_tip_ambito
	CASE "TODOSCMD"
		ls_signo_centro = '='
		ls_signo_cmd = '>'
		ls_signo_mesa = '='
	CASE "TODOS"
		ls_signo_centro = '>'
		ls_signo_cmd = '='
		ls_signo_mesa = '='
	CASE "CENTRO","CMD"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '>'
	CASE "MESA"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '='
END CHOOSE

ls_select1 = ' SELECT ' + ls_max + '(' + ps_tabla_bdg + '.NRO_CENTRO), ' + &
                          ls_max + '(' + ps_tabla_bdg + '.NRO_CMD), ' + &
								  ls_max + '(' + ps_tabla_bdg + '.NRO_MESA), ' + &
								  'sum(' + ps_tabla_bdg + '.CANT_INCIDENCIAS) CANT_INCIDENCIAS, ' + &
								  'ROUND((sum(' + ps_tabla_bdg + '.TIEM_REPUESTO) / sum(CANT_INCIDENCIAS)), 2) TIEM_REPUESTO, ' + &
								  'ROUND((sum(' + ps_tabla_bdg + '.TIEM_ENV_BRI) / sum(CANT_INCIDENCIAS)), 2) TIEM_ENV_BRI, ' + &
								  'sum(' + ps_tabla_bdg + '.INCIDENCIA_CLI) / 1000 INCIDENCIA_CLI, ' + &
							     ls_max + '(CENTRO_A.NOM_CENTRO) NOMCEN, ' + &
							 	  ls_max + '(CENTRO_B.NOM_CENTRO) NOMCMD, ' + &
								  ls_max + '(CENTRO_C.NOM_CENTRO) NOMMESA, ' + &
								  'sum(' + ps_tabla_bdg + '.PAXTC) PAXTC, ' + &
 								  'sum(' + ps_tabla_bdg + '.PCXTC) PCXTC, ' + &
	 							  'max(' + ps_tabla_bdg + '.POT_INSTALADA) POT_INSTALADA, ' + &
								  'ROUND((sum(' + ps_tabla_bdg + '.POT_AFECTADA) / sum(CANT_INCIDENCIAS)), 2) POT_AFECTADA, ' + &
								  'max(' + ps_tabla_bdg + '.POT_CONTRATADA) POT_CONTRATADA, '+ &
								  'max(' + ps_tabla_bdg + '.POT_INST_PADRE) POT_INST_PADRE, ' + &
								  'sum(' + ps_tabla_bdg + '.TIEPI_PROPIO) TIEPI_PROPIO, ' + &
								  'sum(' + ps_tabla_bdg + '.TIEPI_APORTADO) TIEPI_APORTADO, ' + &
								  'sum(' + ps_tabla_bdg + '.TIEBT_PROPIO) TIEBT_PROPIO, ' + &
								  'sum(' + ps_tabla_bdg + '.TIEBT_APORTADO) TIEBT_APORTADO, ' + &
								  'ROUND((sum(' + ps_tabla_bdg + '.SAIFI) / sum(CANT_INCIDENCIAS)), 5) SAIFI, ' + &
								  'ROUND((sum(' + ps_tabla_bdg + '.SAIDI) / sum(CANT_INCIDENCIAS)), 5) SAIDI, ' + &
								  'ROUND((sum(' + ps_tabla_bdg + '.CAIDI) / sum(CANT_INCIDENCIAS)), 5) CAIDI, ' + &
								  'ROUND((sum(' + ps_tabla_bdg + '.ASAI) / sum(CANT_INCIDENCIAS)), 2) ASAI, ' + &
								  'max(' + ps_tabla_bdg + '.POT_CONT_PADRE) POT_CONT_PADRE, ' + &
 					           ls_max + '(' + ps_tabla_bdg + '.TIP_TENSION), ' + &
								  ls_max + '(' + ps_tabla_bdg + '.MAT_AVERIADO), ' + &
								  ls_max + '(' + ps_tabla_bdg + '.TIP_INCIDENCIA), ' + &
								  ls_max + '(' + ps_tabla_bdg + '.HORARIO), ' +&
								  ls_max_fecha + '(' + ps_tabla_bdg + '.FECHA) FECHA, ' + &
								  ls_max + '(0) ACUMULADO, ' + &
								  ls_max + '(1) SUMAS_PROMEDIO, ' + &
								  ls_max + '(1) CLIENTES_POTENCIA, ' + &
								  ls_max + '(1) FILA_MARCADA, ' + &
								  ls_max + '(1) TIEPI_VISIBLE, ' + &
								  ls_max + '(1) TIEBT_VISIBLE, ' + &
								  ls_max + '(1) SAIFI_VISIBLE, ' + &
								  ls_max + '(1) SAIDI_VISIBLE, ' + &
								  ls_max + '(1) CAIDI_VISIBLE, ' + &
								  ls_max + '(1) ASAI_VISIBLE, ' + &
								  "SUM( incidencia_cli ) incidencia_cli_ext, " + &
							 	  "SUM( clientes_sist ) clientes_sist_ext, " + &
								  "SUM( duracion ) duracion_ext " + &
					' FROM ' + ps_tabla_bdg + ', SGD_CENTRO CENTRO_A,' +&
							 ' SGD_CENTRO CENTRO_B,' +&
							 ' SGD_CENTRO CENTRO_C ' +&
 	 	         ' WHERE (' + ps_tabla_bdg + '.NRO_CENTRO = CENTRO_A.NRO_CENTRO and ' + &
					  				 ps_tabla_bdg + '.NRO_CMD = CENTRO_B.NRO_CENTRO and ' + &
									 ps_tabla_bdg + '.NRO_MESA = CENTRO_C.NRO_CENTRO and  ' + &
									 ps_tabla_bdg + '.NRO_CENTRO ' + ls_signo_centro + string(pi_zona) + ' AND ' + &
									 ps_tabla_bdg + '.NRO_CMD ' + ls_signo_cmd + string(pi_cmd) + ' AND ' + & 
									 ps_tabla_bdg + '.NRO_MESA ' + ls_signo_mesa + string(pi_sector) + ' AND ' + &
									 ps_tabla_bdg + '.TIP_TENSION = ' + string(pi_tension_afectada) + ' AND ' + &
									 ps_tabla_bdg + '.MAT_AVERIADO = ' +ps_material_aver + ' AND ' + &
									 ps_tabla_bdg + '.HORARIO = ' +string(pi_int_horario) + '  AND ' + &
								  '(' + ps_tabla_bdg + '.TIP_INCIDENCIA = ' + string (pl_tip_incidencia)+ ') AND ' +& 
        						  '(CENTRO_C.TIP_CENTRO = 3 or centro_c.nro_centro=0) ' +&
									 'and (CENTRO_B.TIP_CENTRO = 2 or centro_B.nro_centro=0) ' + &
									 'and  (CENTRO_A.TIP_CENTRO = 1) and '+ & 
								  ' TO_NUMBER(SUBSTR(TO_CHAR('+ ps_tabla_bdg + '.FECHA, ~'DD/MM/YYYY HH24:MI:SS~'),4,2)) ' + ls_signo_fecha_mes + string(month(pd_period)) + ' AND ' +&
								  ' TO_NUMBER(SUBSTR(TO_CHAR('+ ps_tabla_bdg + '.FECHA, ~'DD/MM/YYYY HH24:MI:SS~'),7,4)) ' + ls_signo_fecha_anio + string(year(pd_period)) + ') ' 
	

IF pi_historicos = 1 THEN
	ls_select2 = ' GROUP BY ' + ps_tabla_bdg + '.FECHA ORDER BY ' + ps_tabla_bdg + '.FECHA'
ELSE 
	ls_select2 = ' GROUP BY ' + ps_tabla_bdg + '.NRO_CENTRO, ' + ps_tabla_bdg + '.NRO_CMD, ' + ps_tabla_bdg + '.NRO_MESA, CENTRO_A.NOM_CENTRO, CENTRO_B.NOM_CENTRO, CENTRO_C.NOM_CENTRO, ' + ps_tabla_bdg + '.TIP_TENSION, ' + ps_tabla_bdg + '.MAT_AVERIADO, ' + ps_tabla_bdg + '.TIP_INCIDENCIA, ' + ps_tabla_bdg + '.HORARIO ORDER BY CENTRO_A.NOM_CENTRO, CENTRO_B.NOM_CENTRO, CENTRO_C.NOM_CENTRO '
END IF
ls_p=ls_select1 + ls_select2

pd_dw.Object.DataWindow.Table.Select= ls_select1 + ls_select2

return 1

end function


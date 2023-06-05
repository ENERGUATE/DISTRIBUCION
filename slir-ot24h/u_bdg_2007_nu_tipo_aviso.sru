HA$PBExportHeader$u_bdg_2007_nu_tipo_aviso.sru
forward
global type u_bdg_2007_nu_tipo_aviso from nonvisualobject
end type
end forward

global type u_bdg_2007_nu_tipo_aviso from nonvisualobject
end type
global u_bdg_2007_nu_tipo_aviso u_bdg_2007_nu_tipo_aviso

forward prototypes
public function datetime fnu_recup_fecha ()
public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_unidades, integer pi_zona, integer pi_cmd, integer pi_sector, date pd_periodo, integer pi_int_horario)
public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, datawindow pd_dw)
end prototypes

public function datetime fnu_recup_fecha ();datetime pd_fecha_ok_bdg

// Recupera la $$HEX1$$fa00$$ENDHEX$$ltima fecha de corrida de la bdg.	
SELECT FECHA_OK INTO :pd_fecha_ok_bdg FROM GI_BDG_OK WHERE PROGRAMA = '4005';
RETURN(pd_fecha_ok_bdg)
end function

public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_unidades, integer pi_zona, integer pi_cmd, integer pi_sector, date pd_periodo, integer pi_int_horario);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  fnu_armar_sql
//
// Objetivo: Configuraci$$HEX1$$f300$$ENDHEX$$n de la cadena Instrucci$$HEX1$$f300$$ENDHEX$$n <Select> dependiendo 
//           del criterio seleccionado por el usuario en los distintos 
//           objetos al efecto.
//           MATO: Validaci$$HEX1$$f300$$ENDHEX$$n fecha, por nro. mes.
//                 Filtro por $$HEX1$$c100$$ENDHEX$$mbito CMD. 
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1996   ALE
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   14/12/1998   MATO (Pruebas Vol.)
//								 Modificaci$$HEX1$$f300$$ENDHEX$$n   02/10/2000   GSH (VERSION 2000.1)
/////////////////////////////////////////////////////////////////////////


string ls_select1, ls_select2, ls_max, ls_signo_centro, ls_max_fecha
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

// Compongo la select

ls_select1 = 'SELECT ' + ls_max + ' (GI_AVISOS_BDG.NRO_CENTRO), '+&
						ls_max + '(GI_AVISOS_BDG.NRO_CMD), '+&
						ls_max + '(GI_AVISOS_BDG.NRO_MESA), '+&
						ls_max + '(GI_AVISOS_BDG.COD_HOR), '+&
						ls_max_fecha + '(GI_AVISOS_BDG.FECHA) FECHA, '+&
						ls_max + '(CENTRO_A.NOM_CENTRO), '+&
						ls_max + '(CENTRO_B.NOM_CENTRO), '+&
						ls_max + '(CENTRO_C.NOM_CENTRO), '+&						
						'sum(GI_AVISOS_BDG.AVISO_C_ALIM_NORMAL) AVISO_C_ALIM_NORMAL, '+&  
						'sum(GI_AVISOS_BDG.AVISO_S_ALIM_AP) AVISO_S_ALIM_AP, ' +&
						'sum(GI_AVISOS_BDG.AVISO_S_ALIM_NORMAL) AVISO_S_ALIM_NORMAL, ' +&
						'sum(GI_AVISOS_BDG.AVISO_S_ALIM_AYUDA) AVISO_S_ALIM_AYUDA, ' +&
						'sum(GI_AVISOS_BDG.AVISO_C_ALIM_CALIDAD) AVISO_C_ALIM_CALIDAD, ' +&
						'sum(GI_AVISOS_BDG.AVISO_S_ALIM_CALIDAD) AVISO_S_ALIM_CALIDAD, ' +&
						'max(1) FILA_MARCADA '+&
				 'FROM GI_AVISOS_BDG, '+&
					   ' SGD_CENTRO CENTRO_A, '+&
					   ' SGD_CENTRO CENTRO_B, '+&
					   ' SGD_CENTRO CENTRO_C ' +&
				 'WHERE ( GI_AVISOS_BDG.NRO_CENTRO = CENTRO_A.NRO_CENTRO ) and  ' + & 
						'( GI_AVISOS_BDG.NRO_CMD = CENTRO_B.NRO_CENTRO ) and  ' + &
						'( CENTRO_C.NRO_CENTRO = GI_AVISOS_BDG.NRO_MESA ) and  ' + &
						 '(CENTRO_C.TIP_CENTRO = 3 or centro_c.nro_centro=0) and (CENTRO_B.TIP_CENTRO = 2 or centro_B.nro_centro=0) and  (CENTRO_A.TIP_CENTRO = 1) and '+ & 			  
						'( GI_AVISOS_BDG.NRO_CENTRO' + ls_signo_centro + string(pi_zona) + ') AND  ' + &
						'( GI_AVISOS_BDG.NRO_CMD' + ls_signo_cmd + string(pi_cmd) + ' ) AND  ' + &
						'( GI_AVISOS_BDG.NRO_MESA' + ls_signo_mesa + string(pi_sector) + ') AND  ' + &
						'( GI_AVISOS_BDG.COD_HOR =' + string(pi_int_horario) + ' ) AND  ' + &
						'( TO_NUMBER(SUBSTR(TO_CHAR(GI_AVISOS_BDG.FECHA,~'DD/MM/YYYY HH24:MI:SS~'),4,2)) ' + ls_signo_fecha_mes + string(month(pd_periodo)) + ' ) AND ' +&
						'( TO_NUMBER(SUBSTR(TO_CHAR(GI_AVISOS_BDG.FECHA,~'DD/MM/YYYY HH24:MI:SS~'),7,4)) ' + ls_signo_fecha_anio + string(year(pd_periodo)) + ' ) '				  

IF pi_historicos = 1 THEN
	ls_select2 = ' GROUP BY FECHA ORDER BY GI_AVISOS_BDG.FECHA '
ELSE
	ls_select2 = ' GROUP BY GI_AVISOS_BDG.NRO_CENTRO, GI_AVISOS_BDG.NRO_CMD, ' + &
					 'GI_AVISOS_BDG.NRO_MESA, GI_AVISOS_BDG.COD_HOR,' + &
					 'CENTRO_A.NOM_CENTRO,CENTRO_B.NOM_CENTRO,CENTRO_C.NOM_CENTRO '	
END IF

pd_dw.Object.DataWindow.Table.Select= ls_select1 + ls_select2

RETURN (1)
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
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       02/10/2000		GSH
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

on u_bdg_2007_nu_tipo_aviso.create
TriggerEvent( this, "constructor" )
end on

on u_bdg_2007_nu_tipo_aviso.destroy
TriggerEvent( this, "destructor" )
end on


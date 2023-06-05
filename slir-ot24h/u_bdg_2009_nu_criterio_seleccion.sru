HA$PBExportHeader$u_bdg_2009_nu_criterio_seleccion.sru
forward
global type u_bdg_2009_nu_criterio_seleccion from u_bdg_1002_nu_generico
end type
end forward

global type u_bdg_2009_nu_criterio_seleccion from u_bdg_1002_nu_generico
end type
global u_bdg_2009_nu_criterio_seleccion u_bdg_2009_nu_criterio_seleccion

type variables

end variables

forward prototypes
public function datetime fnu_recup_fecha ()
public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, datawindow pd_dw)
public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_unidades, integer pi_brigada, date pd_periodo, integer pi_tipo_incid, integer pi_int_horario, integer pi_centro, integer pi_cmd, integer pi_puesto, integer pi_alcance, integer pi_tipo_trabajo, integer pi_nombre_brigada, integer pi_tipo_brigada)
end prototypes

public function datetime fnu_recup_fecha ();datetime pd_fecha_ok_bdg

// Recupera la $$HEX1$$fa00$$ENDHEX$$ltima fecha de corrida de la bdg.	
SELECT FECHA_OK INTO :pd_fecha_ok_bdg FROM GI_BDG_OK WHERE PROGRAMA = '6203';
RETURN(pd_fecha_ok_bdg)
end function

public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, datawindow pd_dw);int li_ancho, li_resto
IF pi_historicos = 1 THEN
	pd_dw.Modify("fecha_t.Visible = 1")
	pd_dw.Modify("fecha.Visible = 1")

 	pd_dw.Modify("nom_cmd_t.Visible = 0")
	pd_dw.Modify("nom_puesto_t.Visible = 0")
	pd_dw.Modify("nom_centro_t.Visible = 0")
	pd_dw.Modify("gi_brigadas_bdg_nombre_t.Visible = 0")
	pd_dw.Modify("linea_b_c_t.Visible = 0")
	pd_dw.Modify("tipo_b_c_t.Visible = 0")
  
	pd_dw.Modify("nom_puesto.Visible = 0")
	pd_dw.Modify("nom_cmd.Visible = 0")
	pd_dw.Modify("nom_centro.Visible = 0")
	pd_dw.Modify("gi_brigadas_bdg_nombre.Visible = 0")
	pd_dw.Modify("compute_0019.Visible = 0")	
	
ELSE
	
	pd_dw.Modify("fecha.Visible = 0")
	pd_dw.Modify("fecha_t.Visible = 0")
		
	CHOOSE CASE ps_tipo_ambito
			CASE "TODOSCMD"
	
					pd_dw.modify("gi_brigadas_bdg_nombre.Visible=0")						
					pd_dw.Modify("compute_0019.Visible = 0")	
					pd_dw.modify("nom_puesto.Visible=0")						
					pd_dw.modify("nom_cmd.Visible=1")
					pd_dw.modify("nom_centro.Visible=0")
					pd_dw.modify("fecha.Visible=0")
	
					pd_dw.modify("gi_brigadas_bdg_nombre_t.Visible=0")
					pd_dw.Modify("linea_b_c_t.Visible = 0")
					pd_dw.Modify("tipo_b_c_t.Visible = 0")
					pd_dw.modify("nom_puesto_t.Visible=0")						
					pd_dw.modify("nom_cmd_t.Visible=1")
					pd_dw.modify("nom_centro_t.Visible=0")
					pd_dw.modify("fecha_t.Visible=0")
	
		
			CASE "TODOS"
				
					pd_dw.modify("gi_brigadas_bdg_nombre.Visible=0")						
					pd_dw.Modify("compute_0019.Visible = 0")	
					pd_dw.modify("nom_puesto.Visible=0")						
					pd_dw.modify("nom_cmd.Visible=0")
					pd_dw.modify("nom_centro.Visible=1")
					pd_dw.modify("fecha.Visible=0")
	
					pd_dw.modify("gi_brigadas_bdg_nombre_t.Visible=0")
					pd_dw.Modify("linea_b_c_t.Visible = 0")
					pd_dw.Modify("tipo_b_c_t.Visible = 0")
					pd_dw.modify("nom_puesto_t.Visible=0")						
					pd_dw.modify("nom_cmd_t.Visible=0")
					pd_dw.modify("nom_centro_t.Visible=1")
					pd_dw.modify("fecha_t.Visible=0")
	
			CASE "CENTRO"	, "CMD"
	
					pd_dw.modify("gi_brigadas_bdg_nombre.Visible=0")						
					pd_dw.Modify("compute_0019.Visible = 0")	
					pd_dw.modify("nom_puesto.Visible=1")						
					pd_dw.modify("nom_cmd.Visible=0")
					pd_dw.modify("nom_centro.Visible=0")
					pd_dw.modify("fecha.Visible=0")
	
					pd_dw.modify("gi_brigadas_bdg_nombre_t.Visible=0")		
					pd_dw.Modify("linea_b_c_t.Visible = 0")
					pd_dw.Modify("tipo_b_c_t.Visible = 0")
					pd_dw.modify("nom_puesto_t.Visible=1")						
					pd_dw.modify("nom_cmd_t.Visible=0")
					pd_dw.modify("nom_centro_t.Visible=0")
					pd_dw.modify("fecha_t.Visible=0")
	
			CASE "MESA"
								
    				pd_dw.modify("gi_brigadas_bdg_nombre.Visible=1")
					pd_dw.Modify("compute_0019.Visible = 1")	
					pd_dw.modify("nom_puesto.Visible=0")						
					pd_dw.modify("nom_cmd.Visible=0")
					pd_dw.modify("nom_centro.Visible=0")
					pd_dw.modify("fecha.Visible=0")
	
					pd_dw.modify("gi_brigadas_bdg_nombre_t.Visible=1")
					pd_dw.Modify("linea_b_c_t.Visible = 1")
					pd_dw.Modify("tipo_b_c_t.Visible = 1")
					pd_dw.modify("nom_puesto_t.Visible=0")						
					pd_dw.modify("nom_cmd_t.Visible=0")
					pd_dw.modify("nom_centro_t.Visible=0")
					pd_dw.modify("fecha_t.Visible=0")
					
					
	
	END CHOOSE
END IF

end subroutine

public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_unidades, integer pi_brigada, date pd_periodo, integer pi_tipo_incid, integer pi_int_horario, integer pi_centro, integer pi_cmd, integer pi_puesto, integer pi_alcance, integer pi_tipo_trabajo, integer pi_nombre_brigada, integer pi_tipo_brigada);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  u_bdg_2009_nu_criterio_seleccion::fnu_armar_sql
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
//								 Modificaci$$HEX1$$f300$$ENDHEX$$n   06/10/2000   GSH (Versi$$HEX1$$f300$$ENDHEX$$n 2000.1)
/////////////////////////////////////////////////////////////////////////

string ls_select1, ls_select2
string ls_fila_marcada, ls_val_promedio
int li_en_corte
string ls_max, ls_max_fecha, ls_signo_fecha_mes, ls_signo_fecha_anio
string ls_signo_centro, ls_signo_cmd, ls_signo_mesa, ls_signo_brigada,ls_signo_join_brigada
string ls_signo_tipo_brigada
pd_dw.AcceptText()

// Cambia el nombre de la primera columna de la cabecera : Ambito, fecha
fnu_mostrar_cabeceras_dw(pi_historicos, ps_tip_ambito, pd_dw)

// Seteo si quiere las sumas o los promedios dependiendo de las unidades
// 1 Cantidades, 0 Porcentajes.

if pi_unidades = 1 then
	 ls_val_promedio = '0'
else
	 ls_val_promedio = '1'
end if

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
		ls_signo_brigada = '='
		ls_signo_join_brigada = '>'		
	CASE "TODOS"
		ls_signo_centro = '>'
		ls_signo_cmd = '='
		ls_signo_mesa = '='
		ls_signo_brigada = '='
		ls_signo_join_brigada = '>'		
	CASE "CENTRO"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '>'
		ls_signo_brigada = '='
		ls_signo_join_brigada = '>'		
	CASE "CMD"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '>'
		ls_signo_brigada = '='
		ls_signo_join_brigada = '>'
	CASE "MESA"
		ls_signo_centro = '='
		ls_signo_cmd = '='
		ls_signo_mesa = '='
		IF pi_brigada = 0 THEN
			ls_signo_brigada = '>'
			ls_signo_join_brigada = '='
		ELSE
			ls_signo_brigada = '='
			ls_signo_join_brigada = '>'
		END IF
END CHOOSE

IF pi_tipo_brigada = 0 then
	ls_signo_tipo_brigada = '>'
ELSE
	ls_signo_tipo_brigada = '='
END IF

ls_select1 = ' SELECT ' + ls_max + '(GI_BRIGADAS_BDG.NOMBRE) NOM_BRIGADA, '+&   
    		    ls_max + ' (CENTRO_B.NOM_CENTRO) NOM_CENTRO, '+&   
        		 ls_max + ' (CENTRO_C.NOM_CENTRO) NOM_PUESTO, '+&   
        		 ls_max + ' (CENTRO_A.NOM_CENTRO) NOM_CMD, '+&   
        		 ls_max_fecha + ' (GI_BRIGADAS_BDG.FECHA) FECHA, '+& 
 				'max(GI_BRIGADAS_BDG.CENTRO) NRO_CENTRO ,  '+&
 				'max(GI_BRIGADAS_BDG.CMD) NRO_CMD ,  '+&
 				'max(GI_BRIGADAS_BDG.PUESTO) NRO_PUESTO ,  '+&
				'ROUND(sum(GI_BRIGADAS_BDG.OPER_PT_EB ),4) OPER_PT_EB, '+&   
        		'ROUND(sum(GI_BRIGADAS_BDG.OPER_EB_ER ),4) OPER_EB_ER, '+&   
        		'ROUND(sum(GI_BRIGADAS_BDG.OPER_ER_SR ),4) OPER_ER_SR, '+&   
        		'ROUND(sum(GI_BRIGADAS_BDG.OPER_SR_RS ),4) OPER_SR_RS, '+&   
        		'ROUND(sum(GI_BRIGADAS_BDG.OPER_RS_CE ),4) OPER_RS_CE, '+&   
	     		'ROUND(sum(GI_BRIGADAS_BDG.MANT_EM_CE ),4) MANT_EM_CE, '+&   
				'sum(GI_BRIGADAS_BDG.CANT_INCIDENCIAS ) CANT_INCIDENCIAS, '+&   
				'sum(GI_BRIGADAS_BDG.CANT_INC_MAN ) CANT_INC_MAN, '+&   
        		'max(1) FILA_MARCADA, '+&   
        		'max(' + ls_val_promedio + ') SUMAS_PROMEDIO, ' + &
				'max(DECODE(GI_BRIGADAS_BDG.BRIG_CONT,1,~'B~',DECODE(GI_BRIGADAS_BDG.BRIG_CONT,2,~'C~',~'~')))' + &
				' FROM GI_BRIGADAS_BDG, SGD_CENTRO CENTRO_A,  ' + &
				'SGD_CENTRO CENTRO_B, SGD_CENTRO CENTRO_C ' + &
				' WHERE ( GI_BRIGADAS_BDG.CMD = CENTRO_A.NRO_CENTRO ) and '+&  
		      '( GI_BRIGADAS_BDG.CENTRO = CENTRO_B.NRO_CENTRO ) and '+&    
      		'( GI_BRIGADAS_BDG.PUESTO = CENTRO_C.NRO_CENTRO ) and '+&    
         	'( GI_BRIGADAS_BDG.CENTRO ' + ls_signo_centro + string(pi_centro) + ' ) AND '+&    
        		'( GI_BRIGADAS_BDG.CMD  ' + ls_signo_cmd + string(pi_cmd) + ' ) AND '+&    
        		'( GI_BRIGADAS_BDG.PUESTO  ' + ls_signo_mesa + string(pi_puesto) + ' ) AND ' +&  
				'( CENTRO_C.TIP_CENTRO = 3 or centro_c.nro_centro=0) and (CENTRO_A.TIP_CENTRO = 2 or centro_A.nro_centro=0) and  (CENTRO_B.TIP_CENTRO = 1) and '+ & 
				'( GI_BRIGADAS_BDG.NRO_BRIGADA ' + ls_signo_brigada + 'NVL(' + string(pi_brigada) + ',0) ) AND ' +&  
         	'( TO_NUMBER(SUBSTR(TO_CHAR(GI_BRIGADAS_BDG.FECHA,~'DD/MM/YYYY HH24:MI:SS~'),4,2)) ' + ls_signo_fecha_mes + string(month(pd_periodo)) + ' ) AND ' +&    
				'( TO_NUMBER(SUBSTR(TO_CHAR(GI_BRIGADAS_BDG.FECHA,~'DD/MM/YYYY HH24:MI:SS~'),7,4)) ' + ls_signo_fecha_anio + string(year(pd_periodo)) + ' ) AND ' +&
         	'( GI_BRIGADAS_BDG.TIPO_INCIDENCIA = ' + string(pi_tipo_incid) + ') AND ' +&    
         	'( GI_BRIGADAS_BDG.INTERVALO_HORARIO = ' + string(pi_int_horario) + ') AND ' + &
				'( GI_BRIGADAS_BDG.ALCANCE = ' + string(pi_alcance) + ') AND ' + &
				'( GI_BRIGADAS_BDG.TIP_BRIGADA = ' + string(pi_tipo_trabajo) + ' ) AND ' + &
				'( GI_BRIGADAS_BDG.BRIG_CONT '+ ls_signo_tipo_brigada + string(pi_tipo_brigada) + ')'
IF pi_historicos = 1 THEN
	ls_select2 = ' GROUP BY GI_BRIGADAS_BDG.FECHA  ORDER BY FECHA'
ELSE
	ls_select2='GROUP BY CENTRO_A.NOM_CENTRO, ' +&      
							'CENTRO_B.NOM_CENTRO, ' +&      
							'CENTRO_C.NOM_CENTRO, ' +&
							'GI_BRIGADAS_BDG.NOMBRE'
END IF

pd_dw.Object.DataWindow.Table.Select= ls_select1 + ls_select2
Return 1
end function


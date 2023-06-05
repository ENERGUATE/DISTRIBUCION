HA$PBExportHeader$u_bdg_2014_nu_perdidas_corte.sru
forward
global type u_bdg_2014_nu_perdidas_corte from u_bdg_1002_nu_generico
end type
end forward

global type u_bdg_2014_nu_perdidas_corte from u_bdg_1002_nu_generico
end type
global u_bdg_2014_nu_perdidas_corte u_bdg_2014_nu_perdidas_corte

forward prototypes
public function integer fnu_aplicar_criterio (ref s_bdg pstr_bdg, ref datawindow pdw_lista_inf, integer pi_operacion)
public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, datawindow pd_dw)
public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_totales, integer pi_unidades, integer pi_operaciones)
end prototypes

public function integer fnu_aplicar_criterio (ref s_bdg pstr_bdg, ref datawindow pdw_lista_inf, integer pi_operacion);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  u_bdg_2014_nu_perdidas_corte::fnu_aplicar_criterio
//
// Objetivo: <Retrieve> sobre Dw.
//           MATO: Modif.: Tipo dato arg. para periodo(Nro. de mes)
//                         y nro A$$HEX1$$f100$$ENDHEX$$o(yyyy). 
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1996   ALE
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   14/12/1998   MATO (Pruebas Vol.)
//
/////////////////////////////////////////////////////////////////////////


string laSelect
int li_mes,li_A$$HEX1$$f100$$ENDHEX$$o, li_operacion

li_mes=month(pstr_bdg.gda_periodo)
li_A$$HEX1$$f100$$ENDHEX$$o=Year(pstr_bdg.gda_periodo)

//messagebox("centro",pstr_bdg.gi_centro)
//messagebox("centro",pstr_bdg.gi_cmd)
//messagebox("centro",pstr_bdg.gi_puesto)
//messagebox("centro",string(pstr_bdg.gda_periodo))

//pstr_bdg.gda_periodo = Date("01/"+String(Month(pstr_bdg.gda_periodo))+"/"+String(Year(pstr_bdg.gda_periodo)))

laSelect = pdw_lista_inf.describe("datawindow.table.select")

RETURN pdw_lista_inf.Retrieve(pstr_bdg.gi_centro, &
                              pstr_bdg.gi_cmd, &
										pstr_bdg.gi_puesto, &
										li_mes, &
										li_A$$HEX1$$f100$$ENDHEX$$o, &
										pi_operacion)




end function

public subroutine fnu_mostrar_cabeceras_dw (integer pi_historicos, string ps_tipo_ambito, datawindow pd_dw);
IF pi_historicos = 1 THEN

	pd_dw.Modify("nom_puesto_t.Visible = 0")
	pd_dw.Modify("nom_cmd_t.Visible = 0")
	pd_dw.Modify("nom_centro_t.Visible = 0")
	pd_dw.Modify("nom_instalacion_t.Visible = 0")

	pd_dw.Modify("nom_puesto.Visible = 0")
	pd_dw.Modify("nom_cmd.Visible = 0")
	pd_dw.Modify("nom_centro.Visible = 0")
	pd_dw.Modify("nom_instalacion.Visible = 0")

	pd_dw.Modify("csmo_puesto_t.Visible = 0")
	pd_dw.Modify("csmo_cmd_t.Visible = 0")
	pd_dw.Modify("csmo_centro_t.Visible = 1")

	pd_dw.Modify("fecha.Visible = 1")
	pd_dw.Modify("fecha_t.Visible = 1")

else
	
// Si no es Historico, escondo la fecha

pd_dw.Modify("fecha_t.Visible = 0")
pd_dw.Modify("fecha.Visible = 0")

	CHOOSE CASE ps_tipo_ambito
		CASE "TODOSCMD"
	
			pd_dw.Modify("nom_instalacion_t.Visible = 0")		
			pd_dw.Modify("nom_puesto_t.Visible = 0")
			pd_dw.Modify("nom_cmd_t.Visible = 1")
			pd_dw.Modify("nom_centro_t.Visible = 0")
			
			pd_dw.Modify("nom_instalacion.Visible = 0")
			pd_dw.Modify("nom_puesto.Visible = 0")
			pd_dw.Modify("nom_cmd.Visible = 1")
			pd_dw.Modify("nom_centro.Visible = 0")
	
			pd_dw.Modify("csmo_puesto_t.Visible = 0")
			pd_dw.Modify("csmo_cmd_t.Visible = 1")
			pd_dw.Modify("csmo_centro_t.Visible = ")
	
		CASE "TODOS"
	
			pd_dw.Modify("nom_instalacion_t.Visible = 0")		
			pd_dw.Modify("nom_puesto_t.Visible = 0")
			pd_dw.Modify("nom_cmd_t.Visible = 0")
			pd_dw.Modify("nom_centro_t.Visible = 1")
			
			pd_dw.Modify("nom_instalacion.Visible = 0")
			pd_dw.Modify("nom_puesto.Visible = 0")
			pd_dw.Modify("nom_cmd.Visible = 0")
			pd_dw.Modify("nom_centro.Visible = 1")
	
			pd_dw.Modify("csmo_puesto_t.Visible = 0")
			pd_dw.Modify("csmo_cmd_t.Visible = 0")
			pd_dw.Modify("csmo_centro_t.Visible = 1")
	
		CASE "CENTRO"			
	
			pd_dw.Modify("nom_instalacion_t.Visible = 0")
			pd_dw.Modify("nom_puesto_t.Visible = 1")
			pd_dw.Modify("nom_cmd_t.Visible = 0")
			pd_dw.Modify("nom_centro_t.Visible = 0")
			
			pd_dw.Modify("nom_instalacion.Visible = 0")		
			pd_dw.Modify("nom_puesto.Visible = 1")
			pd_dw.Modify("nom_cmd.Visible = 0")
			pd_dw.Modify("nom_centro.Visible = 0")
	
			pd_dw.Modify("csmo_puesto_t.Visible = 1")
			pd_dw.Modify("csmo_cmd_t.Visible = 0")
			pd_dw.Modify("csmo_centro_t.Visible = 0")
	
		CASE "CMD"
	
			pd_dw.Modify("nom_centro_t.Visible = 0")
			pd_dw.Modify("nom_cmd_t.Visible = 0")
			pd_dw.Modify("nom_puesto_t.Visible = 1")
			pd_dw.Modify("nom_instalacion_t.Visible = 0")		
				
			pd_dw.Modify("nom_centro.Visible = 0")
			pd_dw.Modify("nom_cmd.Visible = 0")
			pd_dw.Modify("nom_puesto.Visible = 1")
			pd_dw.Modify("nom_instalacion.Visible = 0")		
	
			pd_dw.Modify("csmo_puesto_t.Visible = 1")
			pd_dw.Modify("csmo_cmd_t.Visible = 0")
			pd_dw.Modify("csmo_centro_t.Visible = 0")
			
		CASE "MESA"
	
			pd_dw.Modify("nom_instalacion_t.Visible = 1")		
			pd_dw.Modify("nom_centro_t.Visible = 0")
			pd_dw.Modify("nom_cmd_t.Visible = 0")
			pd_dw.Modify("nom_puesto_t.Visible = 0")
				
			pd_dw.Modify("nom_centro.Visible = 0")
			pd_dw.Modify("nom_cmd.Visible = 0")
			pd_dw.Modify("nom_puesto.Visible = 0")
			pd_dw.Modify("nom_instalacion.Visible = 1")		  
			
			pd_dw.Modify("csmo_puesto_t.Visible = 1")
			pd_dw.Modify("csmo_cmd_t.Visible = 0")
			pd_dw.Modify("csmo_centro_t.Visible = 0")
			
	END CHOOSE
END IF
end subroutine

public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_totales, integer pi_unidades, integer pi_operaciones);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  fnu_armar_sql
//
// Objetivo: Configuraci$$HEX1$$f300$$ENDHEX$$n de la cadena Instrucci$$HEX1$$f300$$ENDHEX$$n <Select> dependiendo 
//           del criterio seleccionado por el usuario en los distintos 
//           objetos al efecto.
//           MATO: Validaci$$HEX1$$f300$$ENDHEX$$n fecha, por nro. mes. y nro. A$$HEX1$$f100$$ENDHEX$$o(yyyy)
//                 Filtro por $$HEX1$$c100$$ENDHEX$$mbito CMD. 
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1996   ALE
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   14/12/1998   MATO (Pruebas Vol.)
/////////////////////////////////////////////////////////////////////////


string ls_select1, ls_select2, ls_select3, ls_select4, ls_select5,sele
string ls_fila_marcada, ls_val_promedio
string ls_signo_centro, ls_signo_cmd, ls_signo_mesa, ls_max,ls_signo_fecha_mes
string ls_signo_fecha_anio,ls_max_fecha, ls_parte_from
string ls_tabla_A, ls_tabla_B, ls_tabla_C, ls_max_mesa, ls_sum
int li_csmo_nulo
string ls_tipo_ambito 

pd_dw.AcceptText()
fnu_mostrar_cabeceras_dw(pi_historicos, ps_tip_ambito, pd_dw)

ls_sum =''
if pi_historicos = 1 then
	ls_max = 'max'
	ls_max_mesa = 'max'
	ls_signo_fecha_mes = '<='
	ls_signo_fecha_anio = '<='
	ls_max_fecha = ''
	ls_tabla_A = '"CENTRO_A"."NRO_CENTRO"'
	ls_tabla_B = '"CENTRO_B"."NRO_CENTRO"'
	ls_tabla_C = '"CENTRO_C"."NRO_CENTRO"'
else
	ls_max = ''
	ls_max_fecha = 'max'
	ls_max_mesa = 'max'
	ls_tabla_A = '"GI_PERDIDAS_BDG"."NRO_CENTRO" '
	ls_tabla_B = '"GI_PERDIDAS_BDG"."NRO_CMD" '
	ls_tabla_C = '"GI_PERDIDAS_BDG"."NRO_MESA" '
	IF pi_acumulado = 0  THEN
		ls_signo_fecha_mes  = '='
		ls_signo_fecha_anio = '='
	ELSE
		 ls_signo_fecha_mes  = '<='
		 ls_signo_fecha_anio = '='
	END IF
end if 

CHOOSE CASE ps_tip_ambito
	CASE "TODOS","TODOSCMD"
		 ls_tipo_ambito = '1'
	CASE "CENTRO"			
		 ls_tipo_ambito = '2'
	CASE "CMD"
		 ls_tipo_ambito = '3'
	CASE "MESA"
		 ls_tipo_ambito = '3'
END CHOOSE

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
		if pi_historicos = 0 then
			ls_max ='sum'
			ls_sum='sum'
			ls_max_mesa = ''
		end if
END CHOOSE

setnull(li_csmo_nulo)

// Seteo si quiere las sumas o los promedios dependiendo de las unidades
// 1 Cantidades, 0 Porcentajes.
//
//IF pi_unidades = 1 THEN
//	 ls_val_promedio = '0'
//ELSE
//	 ls_val_promedio = '1'
//END IF
//
//IF pi_totales = 1 THEN
//	 ls_fila_marcada = '1'
//ELSE
//	 ls_fila_marcada = '0'
//END IF

ls_select1 =  'SELECT '+ ls_max_mesa + '("GI_PERDIDAS_BDG"."NOM_INSTALACION") "NRO_INSTALACION", '+&   
         'max("CENTRO_A"."NOM_CENTRO") "NOM_CENTRO", '+&   
         'max("CENTRO_B"."NOM_CENTRO") "NOM_CMD", '+&  
         'max("CENTRO_C"."NOM_CENTRO") "NOM_PUESTO", '+&  
         'ROUND(SUM("GI_PERDIDAS_BDG"."PERD_PROG"),2) "PERD_PROG", '+&  
         'ROUND(SUM("GI_PERDIDAS_BDG"."TIEMPO_PROG"),2) "TIEMPO_PROG", '+&  
         'ROUND(SUM("GI_PERDIDAS_BDG"."PERD_NO_PROG"),2) "PERD_NO_PROG", '+&  
         'ROUND(SUM("GI_PERDIDAS_BDG"."TIEMPO_NO_PROG"),2) "TIEMPO_NO_PROG", '+&  
         + ls_max_fecha + '("GI_PERDIDAS_BDG"."FECHA"), '+&  
         + ls_max +'("CENTRO_A"."CONSUMO") "CSMO_CENTRO", '+&  
         + ls_max +'("CENTRO_B"."CONSUMO") "CSMO_CMD", '+&  
         + ls_max +'("CENTRO_C"."CONSUMO") "CSMO_PUESTO", '+&  
         '(1) "FILA_MARCADA", '+&  
         '(1) "SUMAS_PROMEDIO", '+&
         + ls_max +'("GI_PERDIDAS_BDG"."NRO_CENTRO") "NRO_CENTRO", '+&  
         + ls_max +'("GI_PERDIDAS_BDG"."NRO_CMD") "NRO_CMD",  '+& 
         + ls_max +'("GI_PERDIDAS_BDG"."NRO_MESA") "NRO_MESA", '+&
			+ ls_max +'(' + ls_tipo_ambito + ') "TIPO_AMBITO" '+ &
		   ' FROM "GI_PERDIDAS_BDG",' + &
			'"SGD_CENTRO" "CENTRO_A",' + & 
			'"SGD_CENTRO" "CENTRO_B",' + & 
			'"SGD_CENTRO" "CENTRO_C" ' + & 
			+ ls_parte_from	+ &
			'WHERE ( "GI_PERDIDAS_BDG"."NRO_CENTRO" = "CENTRO_A"."NRO_CENTRO" ) and '+&  
         '( "GI_PERDIDAS_BDG"."NRO_CMD" = "CENTRO_B"."NRO_CENTRO" ) and  '+&  
         '( "GI_PERDIDAS_BDG"."NRO_MESA" = "CENTRO_C"."NRO_CENTRO" ) and   '+&  
			'(CENTRO_C.TIP_CENTRO = 3 or centro_c.nro_centro=0) and (CENTRO_B.TIP_CENTRO = 2 or centro_b.nro_centro=0) and  (CENTRO_A.TIP_CENTRO = 1) and '+ & 
			'(	(' + ls_tabla_A + ls_signo_centro + ':pi_centro ) AND  '+&
			'(' + ls_tabla_B + ls_signo_cmd + ':pi_cmd ) AND   '+&
         '(' + ls_tabla_C + ls_signo_mesa + ':pi_puesto ) AND  '+&
         '( TO_NUMBER(SUBSTR(TO_CHAR("GI_PERDIDAS_BDG"."FECHA"),5,2)) ' + ls_signo_fecha_mes + ':pda_periodo ) AND ' +&
			'( TO_NUMBER(SUBSTR(TO_CHAR("GI_PERDIDAS_BDG"."FECHA"),1,4)) ' + ls_signo_fecha_anio + ':pi_ano ) ) AND ' +&
			'( "GI_PERDIDAS_BDG"."IND_OPERACION" = :pi_operaciones) ' 
 			   

IF pi_historicos = 1 THEN 
	
	ls_select4 = ' GROUP BY "GI_PERDIDAS_BDG"."FECHA"'
	ls_select5 = ' ORDER BY "FECHA"'
	
else
	ls_select4=	' GROUP BY "GI_PERDIDAS_BDG"."NRO_CENTRO", '+&  
	    			'"GI_PERDIDAS_BDG"."NRO_CMD",  '+& 
        			'"GI_PERDIDAS_BDG"."NRO_MESA", '+&
			   	'"CENTRO_A"."CONSUMO", '+&  
			   	'"CENTRO_B"."CONSUMO", '+&  
			   	'"CENTRO_C"."CONSUMO"' 

	ls_select5 = ' ORDER BY "GI_PERDIDAS_BDG"."NRO_CENTRO", '+&  
				    '"GI_PERDIDAS_BDG"."NRO_CMD",  '+& 
        			 '"GI_PERDIDAS_BDG"."NRO_MESA" ' 

	IF ps_tip_ambito= "MESA" THEN
		ls_select4 = 'GROUP BY "GI_PERDIDAS_BDG"."NOM_INSTALACION"'
		ls_select5 = ''
	END IF
	
end if

pd_dw.Modify("DataWindow.Table.Select=' " + ls_select1 + ls_select4 + ls_select5 + "'")
return 1
end function


HA$PBExportHeader$u_bdg_2005_nu_instal_afect.sru
forward
global type u_bdg_2005_nu_instal_afect from u_bdg_1002_nu_generico
end type
end forward

global type u_bdg_2005_nu_instal_afect from u_bdg_1002_nu_generico
end type
global u_bdg_2005_nu_instal_afect u_bdg_2005_nu_instal_afect

forward prototypes
public function integer fnu_desplegar_tiepi (ref datawindow pd_dw)
public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_unidades, integer pi_nivel, string ps_tipo_inst, long pl_tip_incidencia, integer pi_operaciones, integer pi_alcance)
public function integer fnu_aplicar_criterio (ref datawindow pd_dataw, integer pi_centro, integer pi_cmd, integer pi_mesa, date pd_periodo, string ps_nro_inst_padre, integer pi_tipo_incid, string ps_tipo_inst, integer pi_operaciones, integer pi_alcance)
end prototypes

public function integer fnu_desplegar_tiepi (ref datawindow pd_dw);decimal ld_division
integer ls_cont

for ls_cont = 1 to pd_dw.rowCount()
	if pd_dw.getItemNumber(ls_Cont, "sum_pot_instalada")>0 then 
		ld_division = pd_dw.getItemNumber(ls_Cont, "sum_paxtc") / pd_dw.getItemNumber(ls_Cont, "sum_pot_instalada")
		pd_dw.setItem(ls_cont, "sum_tiepi_propio", round(ld_division,2))
   else 
		pd_dw.setItem(ls_cont, "sum_tiepi_propio", 0)
	end if	
next
return 1

	
end function

public function integer fnu_armar_sql (ref datawindow pd_dw, string ps_tip_ambito, integer pi_acumulado, integer pi_historicos, integer pi_unidades, integer pi_nivel, string ps_tipo_inst, long pl_tip_incidencia, integer pi_operaciones, integer pi_alcance);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  fnu_armar_sql
//
// Objetivo: Configuraci$$HEX1$$f300$$ENDHEX$$n de la cadena Instrucci$$HEX1$$f300$$ENDHEX$$n <Select> dependiendo 
//           del criterio seleccionado por el usuario en los distintos 
//           objetos al efecto.
//           MATO: Validaci$$HEX1$$f300$$ENDHEX$$n fecha, por nro. mes. y nro. a$$HEX1$$f100$$ENDHEX$$o(yyyy)
//                 A$$HEX1$$f100$$ENDHEX$$adido Filro por tipo Inst.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1996   ALE
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   14/12/1998   MATO (Pruebas Vol.)
//													 03/04/2000	  DSA   Incidencia programada puede ser 
//																				de dos tipos Con Interrupcion (2)		
//																								 Sin Interrupcion (3)	
//								 Modificado     02/02/2001   GSE	
/////////////////////////////////////////////////////////////////////////

string ls_val_promedio
string ls_tip_incidencia							
string ls_max, ls_signo_fecha_mes, ls_signo_fecha_anio, ls_max_fecha
string ls_signo_centro, ls_signo_cmd, ls_signo_mesa
string ls_select1, ls_select2, ls_select_f

if pi_historicos = 1 then
	ls_max = 'max'
	ls_signo_fecha_mes = '<='
	ls_signo_fecha_anio = '<='
	ls_max_fecha = ''
else
	ls_max = ''
	ls_max_fecha = 'max'
	IF pi_acumulado = 0  THEN
		ls_signo_fecha_mes  = '='
		ls_signo_fecha_anio = '='
	ELSE
		 ls_signo_fecha_mes  = '<='
		 ls_signo_fecha_anio = '='
	END IF
end if 

CHOOSE CASE ps_tip_ambito
	CASE 'TODOSCDM'
		ls_signo_centro = '='
		ls_signo_cmd    = '>'
		ls_signo_mesa   = '='
	CASE 'TODOS'
		ls_signo_centro = '>'
		ls_signo_cmd    = '='
		ls_signo_mesa   = '='
	CASE 'CENTRO','CMD'
		ls_signo_centro = '='
		ls_signo_cmd    = '='
		ls_signo_mesa   = '>'
	CASE 'MESA'
		ls_signo_centro = '='
		ls_signo_cmd    = '='
		ls_signo_mesa   = '='
END CHOOSE
	
//______DSA INI 03/04/2000			
	ls_tip_incidencia	= 	' AND ("GI_INST_AFECTADAS_BDG"."TIP_INCIDENCIA" = ' + &
													string (pl_tip_incidencia)+ ') '
//______DSA FIN 03/04/2000			

// Seteo si quiere las sumas o los promedios dependiendo de las unidades
// 1 Cantidades, 0 Porcentajes.

if pi_unidades = 1 then
	 ls_val_promedio = '0' 
else
	 ls_val_promedio = '1'
end if

ls_select1 = ''
ls_select2 = ''

ls_select1 = ' SELECT /*+ FIRST_ROWS */ ' + ls_max + '("GI_INST_AFECTADAS_BDG"."NRO_INSTALACION"),' +&
   ls_max + '("GI_INST_AFECTADAS_BDG"."NOM_INSTALACION"),' +&   
   ls_max + '("GI_INST_AFECTADAS_BDG"."NRO_INST_PADRE"),' +&   
   ' "GI_INST_AFECTADAS_BDG"."TIP_INSTALACION",' +&   
   ' ROUND(sum( "GI_INST_AFECTADAS_BDG"."CANT_INCIDENCIAS"),2) SUM_CANT_INCIDENCIAS,'+&
   ' ROUND(sum("GI_INST_AFECTADAS_BDG"."PAXTC"),2) SUM_PAXTC,' +&
   ' ROUND(sum("GI_INST_AFECTADAS_BDG"."TIEPI_PROPIO"),2) SUM_TIEPI_PROPIO,' +&
   ' ROUND(sum("GI_INST_AFECTADAS_BDG"."DURACION_RS") / sum( "GI_INST_AFECTADAS_BDG"."CANT_INCIDENCIAS"),2) AVG_DURACION_RS,' +&   
   ' ROUND(sum("GI_INST_AFECTADAS_BDG"."POT_AFECTADA") / sum( "GI_INST_AFECTADAS_BDG"."CANT_INCIDENCIAS"),2) AVG_POT_AFECTADA,' +&   
   ' ROUND(sum("GI_INST_AFECTADAS_BDG"."POT_INSTALADA"),2) SUM_POT_INSTALADA,' + &   
   ls_max_fecha + '("GI_INST_AFECTADAS_BDG"."FECHA"),' +&   
	' "GI_INST_AFECTADAS_BDG"."TIP_INCIDENCIA",' +& 
	' max(1) FILA_MARCADA, max(' + ls_val_promedio + ') SUMAS_PROMEDIO,' + &
	' ROUND(sum("GI_INST_AFECTADAS_BDG"."TIEBT_PROPIO"),2) SUM_TIEBT_PROPIO,' + &
	' ROUND(sum("GI_INST_AFECTADAS_BDG"."SAIFI") / sum( "GI_INST_AFECTADAS_BDG"."CANT_INCIDENCIAS"),4) SUM_SAIFI,' + &
	' ROUND(sum("GI_INST_AFECTADAS_BDG"."SAIDI") / sum( "GI_INST_AFECTADAS_BDG"."CANT_INCIDENCIAS"),4) SUM_SAIDI,' + &
	' ROUND(sum("GI_INST_AFECTADAS_BDG"."CAIDI") / sum( "GI_INST_AFECTADAS_BDG"."CANT_INCIDENCIAS"),4) SUM_CAIDI,' + &
	' ROUND(sum("GI_INST_AFECTADAS_BDG"."ASAI") / sum( "GI_INST_AFECTADAS_BDG"."CANT_INCIDENCIAS"),4) SUM_ASAI,' + &
	' max(1) TIEPI_VISIBLE,	' +&
	' max(1) TIEBT_VISIBLE,' +&
	' max(1) SAIFI_VISIBLE,' +&
	' max(1) SAIDI_VISIBLE,' +&
	' max(1) CAIDI_VISIBLE,' +&
	' max(1) ASAI_VISIBLE, ' + &
	' SUM( incidencia_cli ) incidencia_cli_ext, ' + &
	' SUM( clientes_sist ) clientes_sist_ext, ' + &
	' SUM( duracion ) duracion_ext ' + &
   ' FROM "GI_INST_AFECTADAS_BDG" ' + &
   ' WHERE (TO_NUMBER(SUBSTR(TO_CHAR("GI_INST_AFECTADAS_BDG"."FECHA"),5,2)) ' + ls_signo_fecha_mes + ':pda_periodo ) AND '  + &
	' (TO_NUMBER(SUBSTR(TO_CHAR("GI_INST_AFECTADAS_BDG"."FECHA"),1,4))' + ls_signo_fecha_anio + ':pi_ano ) AND ' + &
	' ("GI_INST_AFECTADAS_BDG"."NRO_CENTRO"' + ls_signo_centro + ':pi_centro ) AND ' + &
	' ("GI_INST_AFECTADAS_BDG"."NRO_CMD"' + ls_signo_cmd + ':pi_cmd ) AND ' + &
	' ("GI_INST_AFECTADAS_BDG"."NRO_MESA"' + ls_signo_mesa + ':pi_puesto )  AND ' + &
	' ( "GI_INST_AFECTADAS_BDG"."TIP_INSTALACION" = :pi_tipo_inst ) AND' + &
	' ("GI_INST_AFECTADAS_BDG"."IND_OPERACION" = :pi_operaciones ) AND '+ &
	' ( "GI_INST_AFECTADAS_BDG"."ALCANCE" = :pi_alcance)' + &
	ls_tip_incidencia

IF pi_historicos = 1 THEN

	pd_dw.Modify("fecha.Visible = 1")
	pd_dw.Modify("fecha_t.Visible = 1")
	pd_dw.Modify("nom_instalacion.Visible = 0")
	pd_dw.Modify("nom_instalacion_t.Visible = 0")
		
  	ls_select2 = ' GROUP BY FECHA, TIP_INSTALACION, TIP_INCIDENCIA '
else
	// Si no son datos hist$$HEX1$$f300$$ENDHEX$$ricos.
	pd_dw.Modify("fecha.Visible = 0")
	pd_dw.Modify("fecha_t.Visible = 0")
	pd_dw.Modify("nom_instalacion.Visible = 1")
	pd_dw.Modify("nom_instalacion_t.Visible = 1")
	
	ls_select2 =' GROUP BY "GI_INST_AFECTADAS_BDG"."NRO_INSTALACION",' + &
		' "GI_INST_AFECTADAS_BDG"."NOM_INSTALACION",' + &
		' "GI_INST_AFECTADAS_BDG"."NRO_INST_PADRE",' + &  
		' "GI_INST_AFECTADAS_BDG"."TIP_INSTALACION", ' + & 
		' "GI_INST_AFECTADAS_BDG"."TIP_INCIDENCIA" ' 

	if pi_nivel > 1 then
		ls_select1 = ls_select1  + ' AND ("GI_INST_AFECTADAS_BDG"."NRO_INST_PADRE" = :ps_nro_inst_padre )'
	end if

end if

ls_select_f = ls_select1 + ls_select2
pd_dw.Modify("DataWindow.Table.Select=' " + ls_select_f + " ' ")

return 1
end function

public function integer fnu_aplicar_criterio (ref datawindow pd_dataw, integer pi_centro, integer pi_cmd, integer pi_mesa, date pd_periodo, string ps_nro_inst_padre, integer pi_tipo_incid, string ps_tipo_inst, integer pi_operaciones, integer pi_alcance);/////////////////////////////////////////////////////////////////////////
//
// Evento/Funcion:  fnu_aplicar_criterio
//
// Objetivo: <Retrieve> sobre Dw.
//           MATO: Modif. tipo en arg. para periodo(Nro. de mes) 
//                 y a$$HEX1$$f100$$ENDHEX$$adir arg. para a$$HEX1$$f100$$ENDHEX$$o(YYYY).
//                 A$$HEX1$$f100$$ENDHEX$$adido Arg. para Filtro por Tipo Instalacion.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios: Creaci$$HEX1$$f300$$ENDHEX$$n       01/08/1996   ALE
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   14/12/1998   MATO (Pruebas Vol.)
//
/////////////////////////////////////////////////////////////////////////

string laSelect
int li_Mes, li_A$$HEX1$$f100$$ENDHEX$$o

li_Mes = Month(pd_periodo)
li_A$$HEX1$$f100$$ENDHEX$$o = year(pd_periodo)

laSelect = pd_dataw.describe("datawindow.table.select")

RETURN pd_dataw.Retrieve(pi_centro, &
                         pi_cmd, &
								 pi_mesa, &
								 li_Mes, &
								 li_A$$HEX1$$f100$$ENDHEX$$o, &
								 ps_nro_inst_padre, &
								 pi_tipo_incid, &
								 ps_tipo_inst, &
								 pi_operaciones,&
								 pi_alcance)



end function


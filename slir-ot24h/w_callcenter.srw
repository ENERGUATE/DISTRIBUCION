HA$PBExportHeader$w_callcenter.srw
forward
global type w_callcenter from w_sgigenerica
end type
type mle_2 from multilineedit within w_callcenter
end type
type st_estado from statictext within w_callcenter
end type
type cb_cont from commandbutton within w_callcenter
end type
type st_nro_avisos from statictext within w_callcenter
end type
type st_instalacion from statictext within w_callcenter
end type
type ole_estado from olecustomcontrol within w_callcenter
end type
type mle_1 from multilineedit within w_callcenter
end type
type p_1 from picture within w_callcenter
end type
type st_instalacion2 from statictext within w_callcenter
end type
type st_avisos2 from statictext within w_callcenter
end type
type gb_1 from groupbox within w_callcenter
end type
type uo_prop from u_propiedades within w_callcenter
end type
type clientes from structure within w_callcenter
end type
end forward

type clientes from structure
	long		nombre
	long		apellido1
	long		apellido2
end type

global type w_callcenter from w_sgigenerica
integer x = 914
integer y = 540
integer width = 1838
integer height = 1312
string title = "Simulador de Call Center."
windowtype windowtype = response!
long backcolor = 79741120
string icon = "consavi.ico"
mle_2 mle_2
st_estado st_estado
cb_cont cb_cont
st_nro_avisos st_nro_avisos
st_instalacion st_instalacion
ole_estado ole_estado
mle_1 mle_1
p_1 p_1
st_instalacion2 st_instalacion2
st_avisos2 st_avisos2
gb_1 gb_1
uo_prop uo_prop
end type
global w_callcenter w_callcenter

type variables
long il_nro_instalacion, il_nro_avisos, il_tipo_inst,il_cant_av,il_cod_calle,il_nis
long il_nro_suministros,il_cod_loc,il_cod_prov,il_cod_depto,il_cod_munic
long il_num_pta,il_nif,il_nro_acometida,il_codcli
string is_duplicador,is_cgv
end variables

forward prototypes
public subroutine fw_actualiza_visores (long pl_nro_total, long pl_nro_parcial)
public function integer fw_genera_avisos (long pl_nis)
public function long fw_genera_aleatorio (long pl_nro_max)
public function long fw_recupera_ultimo (string ps_tabla)
public function string fw_observacion (string ps_tipo)
public function s_aviso fw_recuperar_datos_aviso (s_aviso pstr_aviso)
public function s_aviso fw_recuperar_direccion (s_aviso pstr_aviso)
public function integer fw_insertar_datos_aviso (s_aviso pstr_aviso)
public function integer fw_o_inf_comple_sum (ref s_aviso pstr_aviso, ref long pl_instalaciones[])
public function integer fw_avisos_instalacion (long pl_instalaciones[], s_aviso pstr_aviso, long pl_fases[], long pl_salmt[])
public function integer fw_cambio_w (integer pi_tipo)
public function integer fw_genera_suministros (long pl_inst_padre)
public function integer fw_genera_clientes (long pl_acometida, integer pi_zona, integer pi_cmd, integer pi_sector)
public function integer fw_genera_sum ()
end prototypes

public subroutine fw_actualiza_visores (long pl_nro_total, long pl_nro_parcial);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_actualiza_visores 
// 
// Objetivo: Actualiza visores de seguimiento de la operaci$$HEX1$$f300$$ENDHEX$$n
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pl_nro_total
//				 pl_nro_parcial
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

integer il_nro
il_nro = Truncate(pl_nro_parcial*100/pl_nro_total, 0)
ole_estado.object.value= il_nro
end subroutine

public function integer fw_genera_avisos (long pl_nis);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_genera_datos_avisos
// 
// Objetivo: Generar Datos en Gi_avisos, Gi_avisos_instalacion
//
// Responsable: FDO 
//
// Parametros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuacion
// ------	   -----------   ---------
// 02/2002    FDO
//
///////////////////////////////////////////////////////

long ll_contador_prin=1,ll_cant_nis,ll_resto
long ll_instalaciones[]
string ls_etiq_vol_corto,ls_fase_suministro
datetime ld_fecha_incr
long ll_aleatorio5,ll_nro_ult_aviso,ll_nro_calles,ll_aleatorio6,ll_rad,ll_ct
int li_aleatorio_dias
s_aviso lstr_aviso

il_cant_av ++

ll_nro_ult_aviso=fw_recupera_ultimo("AVISOS")

lstr_aviso.ll_nis= pl_nis

lstr_aviso.ls_observacion=fw_observacion('AV')

lstr_aviso.ldt_f_actual = fgnu_fecha_actual()
lstr_aviso.ldt_f_problema = lstr_aviso.ldt_f_actual
ld_fecha_incr=fgnu_fecha_actual()
	
lstr_aviso.ll_nro_aviso = ll_contador_prin + ll_nro_ult_aviso

lstr_aviso.ls_usuario= gs_usuario

// Selecciona el tipo de aviso 
	
lstr_aviso.li_ayuda = 0
lstr_aviso.li_clase_aviso = 0
lstr_aviso.li_ind_calidad = 0

//		lstr_aviso.li_ind_calidad = 1
//		lstr_aviso.li_clase_aviso = 3

// Selecciona si es importante

select nis_rad into :ll_rad from gi_suministros_imp where nis_rad=:lstr_aviso.ll_nis;

if sqlca.sqlcode=100 then
	lstr_aviso.li_ind_imp=0
else
	lstr_aviso.li_ind_imp=1
end if

SELECT cod_cli into :lstr_aviso.ll_cod_cli from sumcon where nis_rad = :lstr_aviso.ll_nis;
		
// Recupera codigo de cliente

lstr_aviso = fw_recuperar_datos_aviso(lstr_aviso)
lstr_aviso = fw_recuperar_direccion (lstr_aviso)

lstr_aviso.ls_nom_calle = Left ( lstr_aviso.ls_nom_calle, 41)
lstr_aviso.ls_nom_prov = Left ( lstr_aviso.ls_nom_prov, 30)
lstr_aviso.ls_nom_depto = Left ( lstr_aviso.ls_nom_calle, 30)
lstr_aviso.ls_nom_munic = Left ( lstr_aviso.ls_nom_calle, 30)
lstr_aviso.ls_nom_loc = Left ( lstr_aviso.ls_nom_calle, 30)
lstr_aviso.ls_dupli = Left ( lstr_aviso.ls_dupli, 2)

fw_actualiza_visores(il_nro_avisos,il_cant_av)

lstr_aviso.ll_aleatorio1 = fw_genera_aleatorio(5)
lstr_aviso.ll_aleatorio2 = fw_genera_aleatorio(7)

if lstr_aviso.ll_aleatorio2 > 2 and lstr_aviso.ll_aleatorio2 < 7 then 
	lstr_aviso.li_ind_pel= 1 
	lstr_aviso.li_prior = 11
else
	lstr_aviso.li_ind_pel= 0
	lstr_aviso.li_prior = 21
end if

lstr_aviso.ll_aleatorio3 = fw_genera_aleatorio(3)
lstr_aviso.ll_aleatorio4 = fw_genera_aleatorio(3)

lstr_aviso.ls_etiq_vol= "CCSim"
lstr_aviso.ls_etiq_vol_corto= "CCSim" 

if len(string(lstr_aviso.ll_num_puerta)) >4 then
	lstr_aviso.ll_num_puerta=long(left(string(lstr_aviso.ll_num_puerta),4))
end if

IF fw_o_inf_comple_sum(lstr_aviso, ll_instalaciones) < 1 THEN
	return 0
END IF

if fw_insertar_datos_aviso(lstr_aviso) = -1 then
	messagebox("ATENCION","Error : " + sqlca.SQLErrText)
	return 0
end if

SELECT MAX(NRO_AVISO) 
INTO :lstr_aviso.ll_nro_aviso
FROM GI_AVISOS;

UPDATE "GI_T_ULTIMO"
	SET "ULTIMO" = :lstr_aviso.ll_nro_aviso
  WHERE "TABLA" = 'AVISOS'   ;

yield()

return 1
end function

public function long fw_genera_aleatorio (long pl_nro_max);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_genera_aleatorio
// 
// Objetivo: funi$$HEX1$$f300$$ENDHEX$$n que devuelve un n$$HEX1$$fa00$$ENDHEX$$mero aleatorio 
//           entre 1 y el nro m$$HEX1$$e100$$ENDHEX$$ximo
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//    Entrada: pl_nro_max
//		Salida : Resultado
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

long ll_aleatorio

ll_aleatorio=Rand(pl_nro_max)

return ll_aleatorio 
end function

public function long fw_recupera_ultimo (string ps_tabla);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_recupera_ultimo 
// 
// Objetivo: Recupera el ultimo dato grabado en la tabla 
//				 pasada como par$$HEX1$$e100$$ENDHEX$$metro
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_tabla
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

long ll_ultimo

SELECT "GI_T_ULTIMO"."ULTIMO"  
  INTO :ll_ultimo  
  FROM "GI_T_ULTIMO"  
  WHERE "GI_T_ULTIMO"."TABLA" = :ps_tabla   ;

return ll_ultimo
end function

public function string fw_observacion (string ps_tipo);string ls_observa
int li_aleatorio

li_aleatorio=fw_genera_aleatorio(10)

CHOOSE CASE ps_tipo
	CASE 'AV'
		if li_aleatorio=1 then
			ls_observa="El cliente sufri$$HEX2$$f3002000$$ENDHEX$$una descarga el$$HEX1$$e900$$ENDHEX$$ctrica."
		end if
		if li_aleatorio=2 then
			ls_observa="Algunos elementos el$$HEX1$$e900$$ENDHEX$$ctricos no funcionan."
		end if
		if li_aleatorio=3 then
			ls_observa="Se producen chispazos debidos a cables pelados."
		end if
		if li_aleatorio=4 then
			ls_observa="Los elementos el$$HEX1$$e900$$ENDHEX$$ctricos producen descargas."
		end if
		if li_aleatorio=5 then
			ls_observa="Salta el diferencial de todo el bloque."
		end if
		if li_aleatorio=6 then
			ls_observa="Algunos enchufes de la casa no tienen suministro."
		end if
		if li_aleatorio=7 then
			ls_observa="Se escucha un zumbido en la caja de contadores."
		end if
		if li_aleatorio=8 then
			ls_observa="La alarma salta debido a subidas en el nivel de tensi$$HEX1$$f300$$ENDHEX$$n."
		end if
		if li_aleatorio=9 then
			ls_observa="Las tuber$$HEX1$$ed00$$ENDHEX$$as de la casa producen descargas."
		end if
		if li_aleatorio=10 then
			ls_observa="Se quem$$HEX2$$f3002000$$ENDHEX$$la caja de contadores."
		end if
	CASE 'OT'
		if li_aleatorio=1 then
			ls_observa="La Brigada que estaba pensada en un principio, enferm$$HEX1$$f300$$ENDHEX$$."
		end if
		if li_aleatorio=2 then
			ls_observa="Seguir con la Ot es arriesgado."
		end if
		if li_aleatorio=3 then
			ls_observa="La brigada responsable ha comunicado el problema."
		end if
		if li_aleatorio=4 then
			ls_observa="La brigada tiene problemas para encontrar el problema."
		end if
		if li_aleatorio=5 then
			ls_observa="Debido a un derrumbamiento se restrasar$$HEX2$$e1002000$$ENDHEX$$la OT."
		end if
		if li_aleatorio=6 then
			ls_observa="La OT, est$$HEX2$$e1002000$$ENDHEX$$en esper$$HEX2$$e1002000$$ENDHEX$$del visto bueno del perito."
		end if
		if li_aleatorio=7 then
			ls_observa="La Ot implica obras en el subsuelo."
		end if
		if li_aleatorio=8 then
			ls_observa="La instalaci$$HEX1$$f300$$ENDHEX$$n ha quedado inundada."
		end if
		if li_aleatorio=9 then
			ls_observa="La brigada ha quedado atrapada en una zanja."
		end if
		if li_aleatorio=10 then
			ls_observa="Un veh$$HEX1$$ed00$$ENDHEX$$culo a colisionado con la instalaci$$HEX1$$f300$$ENDHEX$$n."
		end if
	CASE 'IN'
		if li_aleatorio=1 then
			ls_observa="Falta material para cubrir los da$$HEX1$$f100$$ENDHEX$$os ocasionados."
		end if
		if li_aleatorio=2 then
			ls_observa="La brigada no ha comunicado todas las acciones."
		end if
		if li_aleatorio=3 then
			ls_observa="La brigada responsable ha comunicado el problema."
		end if
		if li_aleatorio=4 then
			ls_observa="Seguir con la incidencia es arriesgado."
		end if
		if li_aleatorio=5 then
			ls_observa="No se pueden introducir todos los materiales."
		end if
		if li_aleatorio=6 then
			ls_observa="Unica incidencia con estas caracter$$HEX1$$ed00$$ENDHEX$$sticas"
		end if
		if li_aleatorio=7 then
			ls_observa="Exceso de materiales usado por parte de la brigada"
		end if
		if li_aleatorio=8 then
			ls_observa="Perdida de aceite aislante en bobinas."
		end if
		if li_aleatorio=9 then
			ls_observa="Reles de potencia producen altas descargas."
		end if
		if li_aleatorio=10 then
			ls_observa="Un rayo a ca$$HEX1$$ed00$$ENDHEX$$do sobre la instalaci$$HEX1$$f300$$ENDHEX$$n afectada."
		end if
CASE 'IN_DES'
		if li_aleatorio=1 then
			ls_observa="La incidencia recae sobre la instalaci$$HEX1$$f300$$ENDHEX$$n"
		end if
		if li_aleatorio=2 then
			ls_observa="Se quemaron los Transformadores."
		end if
		if li_aleatorio=3 then
			ls_observa="Subidas de potencia en la salida."
		end if
		if li_aleatorio=4 then
			ls_observa="Sobrecarga en la instalaci$$HEX1$$f300$$ENDHEX$$n."
		end if
		if li_aleatorio=5 then
			ls_observa="Elementos reactivos inutilizados."
		end if
		if li_aleatorio=6 then
			ls_observa="Tensi$$HEX1$$f300$$ENDHEX$$n de entrada baja."
		end if
		if li_aleatorio=7 then
			ls_observa="Rel$$HEX1$$e900$$ENDHEX$$s recalentados."
		end if
		if li_aleatorio=8 then
			ls_observa="Instalaci$$HEX1$$f300$$ENDHEX$$n destruida a causa de impacto."
		end if
		if li_aleatorio=9 then
			ls_observa="Fallo en la etapa de potencia."
		end if
		if li_aleatorio=10 then
			ls_observa="Fallo en los condensadores."
		end if
CASE 'IN_ACC'
		if li_aleatorio=1 then
			ls_observa="La acci$$HEX1$$f300$$ENDHEX$$n se ha realizado en plazo previsto."
		end if
		if li_aleatorio=2 then
			ls_observa="Brigadista recibi$$HEX2$$f3002000$$ENDHEX$$un cortocircuito."
		end if
		if li_aleatorio=3 then
			ls_observa="Material cortante hiri$$HEX2$$f3002000$$ENDHEX$$a un brigadista."
		end if
		if li_aleatorio=4 then
			ls_observa="Es conveniente revisar la acci$$HEX1$$f300$$ENDHEX$$n."
		end if
		if li_aleatorio=5 then
			ls_observa="Se tard$$HEX2$$f3002000$$ENDHEX$$mas de lo previsto."
		end if
		if li_aleatorio=6 then
			ls_observa="Llevada a cabo correctamente."
		end if
		if li_aleatorio=7 then
			ls_observa="Resoluci$$HEX1$$f300$$ENDHEX$$n complicada."
		end if
		if li_aleatorio=8 then
			ls_observa="Realizada varias veces."
		end if
		if li_aleatorio=9 then
			ls_observa="Se necesitan herramientas no disponibles."
		end if
		if li_aleatorio=10 then
			ls_observa="LLamar a la empresa fabricante."
		end if
CASE 'IN_EST'
		if li_aleatorio=1 then
			ls_observa="Tard$$HEX2$$f3002000$$ENDHEX$$mas en este estado."
		end if
		if li_aleatorio=2 then
			ls_observa="Correcto."
		end if
		if li_aleatorio=3 then
			ls_observa="Dificultades en este estado."
		end if
		if li_aleatorio=4 then
			ls_observa="Protestas por la resoluci$$HEX1$$f300$$ENDHEX$$n."
		end if
		if li_aleatorio=5 then
			ls_observa="Labor sobresaliente de la brigada."
		end if
		if li_aleatorio=6 then
			ls_observa="Llevada a cabo correctamente."
		end if
		if li_aleatorio=7 then
			ls_observa="Dif$$HEX1$$ed00$$ENDHEX$$cil acceso para realizar el estado."
		end if
		if li_aleatorio=8 then
			ls_observa="No garantizado."
		end if
		if li_aleatorio=9 then
			ls_observa="No localizado."
		end if
		if li_aleatorio=10 then
			ls_observa="En estado correcto."
		end if
	CASE 'DER'  //RECHAZO
		if li_aleatorio=1 then
			ls_observa="Obras de construccion de las nuevas instalaciones no iniciadas."
		end if
		if li_aleatorio=2 then
			ls_observa="Problemas burocraticos con el Ayuntamiento."
		end if
		if li_aleatorio=3 then
			ls_observa="Permiso denegado del propietario para el inicio de las obras. "
		end if
		if li_aleatorio=4 then
			ls_observa="Fechas no validas."
		end if
		if li_aleatorio=5 then
			ls_observa="Descargo mal definido."
		end if
		if li_aleatorio=6 then
			ls_observa="Sin determinar."
		end if
		if li_aleatorio=7 then
			ls_observa="Celebracion de una verbena en la zona."
		end if
		if li_aleatorio=8 then
			ls_observa="No hay disponibilidad de  material para realizar las obras."
		end if
		if li_aleatorio=9 then
			ls_observa="No hay personal disponible."
		end if
		if li_aleatorio=10 then
			ls_observa="Fuera de plazo."
		end if
	CASE 'DEM'  //MODIFICACIONES
		if li_aleatorio=1 then
			ls_observa="Fecha de inicio mal definida."
		end if
		if li_aleatorio=2 then
			ls_observa="Fecha de fin del descargo incorrecta"
		end if
		if li_aleatorio=3 then
			ls_observa="Periodo de corte muy extenso "
		end if
		if li_aleatorio=4 then
			ls_observa="Periodo de corte demasiado largo."
		end if
		if li_aleatorio=5 then
			ls_observa="Fecha fin  modificada por acontecimiento deportivo en el Vicente Calderon."
		end if
		if li_aleatorio=6 then
			ls_observa="Periodo de corte reducido por instalacion de un circo."
		end if
		if li_aleatorio=7 then
			ls_observa="Fechas retrasadas por festividad local."
		end if
		if li_aleatorio=8 then
			ls_observa="Descargo retrasado por retraso obras metro."
		end if
		if li_aleatorio=9 then
			ls_observa="No hay personal disponible en las fechas originales"
		end if
		if li_aleatorio=10 then
			ls_observa="No hay material para las obras de  ampliacion del aeropuerto."
		end if
CASE 'DES' //SOLICITUD
		 if li_aleatorio=1 then
			ls_observa="Enganche instalaciones nueva estacion del Metro."
		end if
		if li_aleatorio=2 then
			ls_observa="Enganche instalaciones nueva pista del aeropuerto."
		end if
		if li_aleatorio=3 then
			ls_observa="Enganche instalaciones nueva estacion de tren en Vicalvaro"
		end if
		if li_aleatorio=4 then
			ls_observa="Nuevas farolas en la calle Bail$$HEX1$$e900$$ENDHEX$$n."
		end if
		if li_aleatorio=5 then
			ls_observa="Subida de potencia en el estadio Vicente Calderon."
		end if
		if li_aleatorio=6 then
	  		ls_observa="Bajada de potencia en las instalaciones del Santiago Bernabeu."
		end if
		if li_aleatorio=7 then
			ls_observa="Obras de la acometida al nuevo edificio de la calle Orense 23."
		end if
		if li_aleatorio=8 then
			ls_observa="Enganche farolas nuevo tramo de la M-40."
		end if
		if li_aleatorio=9 then
			ls_observa="Nuevo tramo del tendido el$$HEX1$$e900$$ENDHEX$$ctrico."
		end if
		if li_aleatorio=10 then
			ls_observa="Aumento de la potencia a los suministros de la calle Cortezo."
		end if

	CASE 'DEA'  // APROBADO
		if li_aleatorio=1 then
			ls_observa="Correcto."
		end if
		if li_aleatorio=2 then
			ls_observa="Plazo correcto"
		end if
		if li_aleatorio=3 then
			ls_observa="Periodo de corte correcto"
		end if
		if li_aleatorio=4 then
			ls_observa="OK."
		end if
		if li_aleatorio=5 then
			ls_observa="Apto."
		end if
		if li_aleatorio=6 then
			ls_observa="No hay modificaciones."
		end if
		if li_aleatorio=7 then
			ls_observa="Aprobado Gerencia."
		end if
		if li_aleatorio=8 then
			ls_observa="Validado."
		end if
		if li_aleatorio=9 then
			ls_observa="Descargo aprobado."
		end if
		if li_aleatorio=10 then
			ls_observa="Sin observaciones"
		end if
END CHOOSE

return ls_observa

end function

public function s_aviso fw_recuperar_datos_aviso (s_aviso pstr_aviso);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_recuperar_datos_aviso
// 
// Objetivo: Recupera datos de las tablas CLIENTES,
//					ACO_SUM, SGD_ACOMETIDA, CALLEJERO.
//	
//
// Responsable: GSE
//
// Parametros:
//    Entrada: pstr_Aviso		s_aviso
//		Salida : pstr_Aviso		s_Aviso
//
// Devuelve:
//
// Fecha      Responsable   Actuacion
// ------	   -----------   ---------
// 14/11/2000		GSE
//
///////////////////////////////////////////////////////

// Recupera datos del cliente
SELECT "CLIENTES"."NOM_CLI",   
		"CLIENTES"."APE1_CLI",   
		"CLIENTES"."APE2_CLI",   
		"CLIENTES"."DOC_ID",   
		"CLIENTES"."TIP_DOC",   
		"CLIENTES"."CO_PAIS",   
		"CLIENTES"."TFNO_CLI",   
		"CLIENTES"."DUPLICADOR",   
		"CLIENTES"."NUM_PUERTA"  
 INTO :pstr_aviso.ls_nombre_cli,   
		:pstr_aviso.ls_ape1,   
		:pstr_aviso.ls_ape2,   
		:pstr_aviso.ls_doc_id,   
		:pstr_aviso.ls_tip_doc,   
		:pstr_aviso.ls_co_pais,   
		:pstr_aviso.ls_tlfno,   
		:pstr_aviso.ls_dupli,   
		:pstr_aviso.ll_num_puerta  
 FROM "CLIENTES"  
WHERE "CLIENTES"."COD_CLI" = :pstr_aviso.ll_cod_cli   ;

// Recupera datos del nis

SELECT "ACO_SUM"."COD_CALLE",   
		"ACO_SUM"."COD_DEPTO",   
		"ACO_SUM"."COD_LOC",   
		"ACO_SUM"."COD_PROV",   
		"ACO_SUM"."COD_MUNIC",   
		NVL("ACO_SUM"."CGV_SUM", ' '),
		"ACO_SUM"."NRO_ACOMETIDA"
 INTO :pstr_aviso.ll_calle,   
		:pstr_aviso.ll_depto,   
		:pstr_aviso.ll_coloc,   
	   :pstr_aviso.ll_cod_prov,   
		:pstr_aviso.ll_cod_munic,   
		:pstr_aviso.ls_cgv,
		:pstr_aviso.ll_nro_acometida  
 FROM "ACO_SUM"  
WHERE "ACO_SUM"."NIS_RAD" = :pstr_aviso.ll_nis   ;

// Recupera datos de la instalacion

SELECT "SGD_ACOMETIDA"."CODIGO" ,
		 "SGD_ACOMETIDA"."NRO_CENTRO",
		 "SGD_ACOMETIDA"."NRO_CMD",
		 "SGD_ACOMETIDA"."NRO_MESA"
 INTO :pstr_aviso.ll_nro_instalacion,
 		:pstr_aviso.li_nro_centro,
		:pstr_aviso.li_nro_cmd,
		:pstr_aviso.li_nro_mesa
 FROM "SGD_ACOMETIDA"  
 WHERE "SGD_ACOMETIDA"."CODIGO" = :pstr_aviso.ll_nro_acometida  AND
 		 "SGD_ACOMETIDA"."BDI_JOB" = 0;
	
if pstr_aviso.ll_nro_instalacion=0 and pstr_aviso.li_ind_calidad = 0 then
	pstr_aviso.ll_nro_instalacion = 88888888
elseif pstr_aviso.ll_nro_instalacion = 99999999 and pstr_aviso.li_ind_calidad = 1 then
	pstr_aviso.ll_nro_instalacion = 55555558
END IF
// Recupera datos del callejero
		
SELECT "CALLEJERO"."NOM_CALLE"  
 INTO :pstr_aviso.ls_nom_calle  
 FROM "CALLEJERO"  
 WHERE "CALLEJERO"."COD_CALLE" = :pstr_aviso.ll_calle and
		 "CALLEJERO"."COD_LOCAL" = :pstr_aviso.ll_coloc and
		 "CALLEJERO"."COD_MUNIC" = :pstr_aviso.ll_cod_munic and
		 "CALLEJERO"."COD_DEPTO" = :pstr_aviso.ll_depto and
		 "CALLEJERO"."COD_PROV" = :pstr_aviso.ll_cod_prov;
return pstr_aviso	 
end function

public function s_aviso fw_recuperar_direccion (s_aviso pstr_aviso);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_recuperar_direccion
// 
// Objetivo: Recupera datos de las tablas PROVINCIAS,
//					DEPTOS, MUNICIPIOS, LOCALIDADES.
//	
//
// Responsable: GSE
//
// Parametros:
//    Entrada: pstr_Aviso		s_aviso
//		Salida : pstr_Aviso		s_Aviso
//
// Devuelve:
//
// Fecha      Responsable   Actuacion
// ------	   -----------   ---------
// 14/11/2000		GSE
//
///////////////////////////////////////////////////////

// Recupera datos de provincias
		
SELECT "PROVINCIAS"."NOM_PROV"  
 INTO :pstr_aviso.ls_nom_prov  
 FROM "PROVINCIAS"  
 WHERE "PROVINCIAS"."COD_PROV" = :pstr_aviso.ll_cod_prov   ;
 
// Recupera datos de departamentos

SELECT "DEPTOS"."NOM_DEPTO"  
 INTO :pstr_aviso.ls_nom_depto  
 FROM "DEPTOS"  
 WHERE "DEPTOS"."COD_DEPTO" = :pstr_aviso.ll_depto and
		 "DEPTOS"."COD_PROV" = :pstr_aviso.ll_cod_prov;

// Recupera datos de municipios

SELECT "MUNICIPIOS"."NOM_MUNIC"  
 INTO :pstr_aviso.ls_nom_munic  
 FROM "MUNICIPIOS"  
 WHERE "MUNICIPIOS"."COD_MUNIC" = :pstr_aviso.ll_cod_munic and
		 "MUNICIPIOS"."COD_DEPTO" = :pstr_aviso.ll_depto and
		 "MUNICIPIOS"."COD_PROV" = :pstr_aviso.ll_cod_prov;

// Recupera localidades

SELECT "LOCALIDADES"."NOM_LOCAL"  
 INTO :pstr_aviso.ls_nom_loc  
 FROM "LOCALIDADES"  
 WHERE "LOCALIDADES"."COD_LOCAL" = :pstr_aviso.ll_coloc and
		 "LOCALIDADES"."COD_MUNIC" = :pstr_aviso.ll_cod_munic and
		 "LOCALIDADES"."COD_DEPTO" = :pstr_aviso.ll_depto and
		 "LOCALIDADES"."COD_PROV" = :pstr_aviso.ll_cod_prov;

return pstr_aviso
end function

public function integer fw_insertar_datos_aviso (s_aviso pstr_aviso);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_insertar_datos_Aviso
// 
// Objetivo: Inserta un registro en la tabla GI_aVISOS.
//
// Responsable: GSE
//
// Parametros:
//    Entrada: pstr_Aviso		s_aviso
//		Salida : pstr_Aviso		s_Aviso
//
// Devuelve:
//
// Fecha      Responsable   Actuacion
// ------	   -----------   ---------
// 14/11/2000		GSE
//
///////////////////////////////////////////////////////

//INSERTA_DATOS EN AVISOS
    	
  INSERT INTO "GI_AVISOS"  
         ( "NRO_AVISO",   
           "USUARIO",   
           "F_ACTUAL",   
           "H_ACTUAL",   
           "PROGRAMA",   
           "NIS_RAD",   
           "NOMBRE",   
           "APE1",   
           "APE2",   
           "DOC_ID",   
           "TIP_DOC",   
           "CO_PAIS",   
           "CO_ALCANCE",   
           "TIP_AVISO",   
           "IND_PELIGRO",   
           "PRIORIDAD",   
           "F_ALTA",   
           "H_ALTA",   
           "TFNO_CLI",   
           "EST_AVISO",   
           "OBS_TELEGESTIONES",   
           "OBS_CMD",   
           "IND_AYUDA",   
           "DUPLICADOR",   
           "NUM_PUERTA",   
           "COD_CALLE",   
           "COD_LOC",   
           "COD_MUNIC",   
           "COD_PROV",   
           "COD_DEPTO",   
           "NRO_OT",   
           "ESQUINA",   
           "CGV_SUM",   
           "NRO_CENTRO",   
           "NRO_TELEGESTIONES",   
           "NRO_INSTALACION",   
           "NRO_CMD",   
           "NRO_MESA",   
           "NRO_INCIDENCIA",   
           "IND_IMPROCEDENTE",   
           "IND_CLI_IMP",   
           "NRO_TELEFONISTA",   
           "NOM_CALLE",   
           "NOM_PROV",   
           "NOM_DEPTO",   
           "NOM_MUNIC",   
           "NOM_LOC",   
           "FECHA_RES",   
           "HORA_RES",   
           "REF_DIR",   
           "EB4005",   
           "FECHA_BATCH",   
           "COD_HORARIO",   
           "IND_INC_ASOC",   
           "NRO_LLAMADAS",
			  "IND_CALIDAD", FECHA_PROBLEMA)  
  VALUES ( :pstr_aviso.ll_nro_aviso,   
           :pstr_aviso.ls_usuario,   
           :pstr_aviso.ldt_f_actual,   
           :pstr_aviso.ldt_f_actual,   
           :pstr_aviso.ls_etiq_vol_corto,   
           :pstr_aviso.ll_nis,   
			  :pstr_aviso.ls_nombre_cli,   
           :pstr_aviso.ls_ape1,   
           :pstr_aviso.ls_ape2,   
           :pstr_aviso.ls_doc_id,   
           :pstr_aviso.ls_tip_doc,   
           :pstr_aviso.ls_co_pais, 
           :pstr_aviso.ll_aleatorio1,   
           :pstr_aviso.ll_aleatorio2,   
           :pstr_aviso.li_ind_pel,   
           :pstr_aviso.li_prior ,   
           :pstr_aviso.ldt_f_actual,   
           :pstr_aviso.ldt_f_actual,   
           :pstr_aviso.ls_tlfno,   
           :pstr_aviso.li_est_aviso,   
           :pstr_aviso.ls_observacion,   
           :pstr_aviso.ls_observacion,   
           :pstr_aviso.li_ayuda,   
           :pstr_aviso.ls_dupli,   
           :pstr_aviso.ll_num_puerta,  
			  :pstr_aviso.ll_calle, 
			  :pstr_aviso.ll_coloc,
			  :pstr_aviso.ll_cod_munic,
			  :pstr_aviso.ll_cod_prov,   
			  :pstr_aviso.ll_depto,  
           0,   
           :pstr_aviso.ls_etiq_vol,   
           :pstr_aviso.ls_cgv,   
           :pstr_aviso.li_nro_centro,   
           1,   
           :pstr_aviso.ll_nro_instalacion ,   
           :pstr_aviso.li_nro_cmd,   
           :pstr_aviso.li_nro_mesa,   
           :pstr_aviso.ll_incidencia,   
           0,   
           :pstr_aviso.li_ind_imp,   
           '5302034',   
           :pstr_aviso.ls_nom_calle,
			  :pstr_aviso.ls_nom_prov,
			  :pstr_aviso.ls_nom_depto,
			  :pstr_aviso.ls_nom_munic,
			  :pstr_aviso.ls_nom_loc,   
           null,   
           null,   
           null,   
           0,   
           null,   
           :pstr_aviso.ll_aleatorio3,   
           0,   
           :pstr_aviso.ll_aleatorio4,
			  :pstr_aviso.li_ind_calidad,:pstr_aviso.ldt_f_problema)  ;

	  			  
Return sqlca.sqlcode
end function

public function integer fw_o_inf_comple_sum (ref s_aviso pstr_aviso, ref long pl_instalaciones[]);long ll_nro_orden, ll_incidencia, ll_ot, ll_padre,ll_instalacion_aviso,ll_ct
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup,ldt_f_rep_fase_a,ldt_f_rep_fase_b,ldt_f_rep_fase_c,ldt_f_rep
string ls_t_interrupcion,ls_ci,ls_h_rep,ls_fase_suministro,ls_fase,ls_instalaciones,ls_fase_a,ls_fase_b,ls_fase_c
int li_centro, li_mesa, li_cmd ,li_fin_cursor,li_contador,li_tipo_instalacion,li_tiempo_espera,li_tipo_conexion,li_devuelve = 1,li_refaseo
long ll_instalacion, ll_inst_padre,ll_posicion_busqueda,ll_instalacion_referencia,ll_inst_comp,LL_FASE_REFASEO
boolean lb_inc_asoc = False
string ls_operador_b,ls_operador_c,ls_h_rep_a,ls_h_rep_b,ls_h_rep_c,ls_sql_statement
long ll_salida_mt[],ll_fases[],ll_inst_int
boolean lb_real , lb_conexion


ldt_fecha_actual = fgnu_fecha_actual()
pstr_aviso.li_est_aviso = fgci_aviso_pendiente
pstr_aviso.ll_incidencia = 0
		
SELECT "SGD_CODIGOS"."CIS"
INTO :ls_ci
FROM "SGD_CODIGOS"
WHERE "SGD_CODIGOS"."NOMBRE" = 'sgd_acometida';
						
SELECT "SGD_ACOMETIDA"."NRO_CENTRO",   
		  "SGD_ACOMETIDA"."NRO_MESA",   
		  "SGD_ACOMETIDA"."NRO_CMD"
INTO :li_centro, :li_mesa, :li_cmd
FROM "SGD_ACOMETIDA"  
WHERE "SGD_ACOMETIDA"."CODIGO" = :pstr_aviso.ll_nro_acometida AND "SGD_ACOMETIDA"."BDI_JOB" =0;

// Como el string que me llega lleva ' :' los elimino del string para hacer el casting
	
ll_posicion_busqueda = pos(ls_ci,":",1)		
do while ll_posicion_busqueda<> 0
	ls_ci= replace(ls_ci,ll_posicion_busqueda,1,'')
	ll_posicion_busqueda = pos(ls_ci,":",1)		
loop 

//	 Ahora que se dispone de los datos necesarios intento la conexi$$HEX1$$f300$$ENDHEX$$n con conectividad. 

IF gu_rf.of_jerarquia(long(ls_ci),pstr_aviso.ll_nro_acometida,pl_instalaciones,lb_real,ll_salida_mt,ll_fases,ll_ct,ls_fase_suministro,lb_conexion) = 1 THEN 

	// Si la clase del aviso es de calidad colgamos los avisos del tipo de avisos de calidad y 
	// si no colgamos los avisos del tipo avisos con alimentaci$$HEX1$$f300$$ENDHEX$$n.
	if  pstr_aviso.li_ind_calidad = 1 then 
		ll_instalacion_referencia = 55555559
	else
		ll_instalacion_referencia = 99999999
	end if
	// Insertamos en el array como elemento del que cuelgan todos el tipo que corresponda
	pl_instalaciones[upperbound(pl_instalaciones[]) + 1] = ll_instalacion_referencia
	
	if  pstr_aviso.li_ind_calidad = 1 then 
		pl_instalaciones[upperbound(pl_instalaciones[])+1] = 55555555
	end if
		
	// Funcion$$HEX2$$f3002000$$ENDHEX$$correctamente, verificamos la situaci$$HEX1$$f300$$ENDHEX$$n real de la red.	
	IF lb_real= true then
		pstr_aviso.gi_tipo_red = 1 // Se tratar$$HEX2$$e1002000$$ENDHEX$$de un aviso ingresado en el estado real de la red
	ELSE
		if lb_conexion = true then
		pstr_aviso.gi_tipo_red = 0 // En este caso el aviso ingresado es un aviso del estado normal de la red
	else
		pstr_aviso.gi_tipo_red = 2 // No hay conexion con conectividad
	end if
	END IF

ELSE 
	// No funcion$$HEX2$$f3002000$$ENDHEX$$correctamente, El aviso va a ser sin alimentacion
	IF pstr_aviso.li_ind_calidad = 1 THEN
		pstr_aviso.ll_nro_instalacion = 55555558
	ELSE
		pstr_aviso.ll_nro_instalacion = 88888888
	END IF
END IF

IF  pstr_aviso.ll_nro_instalacion <> 0 THEN
	
	FOR li_contador = 1 to upperbound(pl_instalaciones[])
		if ls_instalaciones = "" then
			ls_instalaciones = string(pl_instalaciones[li_contador])
		else 
			ls_instalaciones = ls_instalaciones + "," + string(pl_instalaciones[li_contador])
		end if
	NEXT
	
	DECLARE LC_INTERRUPCIONES DYNAMIC CURSOR FOR SQLSA;
	
	ls_sql_statement= "SELECT TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_A,'hh24:mi'), " + &
	"TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_B,'hh24:mi'), " + &
	"TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_C,'hh24:mi'), " + &
	"TO_CHAR(SGD_INTERRUPCION.F_REPOSICION,'hh24:mi'), " + &
	"SGD_INTERRUPCION.TIP_INTERRUPCION, " + &
	"SGD_INTERRUPCION.NRO_INCIDENCIA, " + &
	"SGD_INTERRUPCION.NRO_INSTALACION, " + &
	"SGD_INTERRUPCION.F_REPOSICION_FASE_A, " + &
	"SGD_INTERRUPCION.F_REPOSICION_FASE_B, " + &
	"SGD_INTERRUPCION.F_REPOSICION_FASE_C, " + &
	"SGD_INTERRUPCION.F_REPOSICION"

	ls_sql_statement= ls_sql_statement + &
	" FROM SGD_INTERRUPCION  " + &
	" WHERE SGD_INTERRUPCION.NRO_INSTALACION IN (" + ls_instalaciones + ") " 
	
	if gb_red_trifasica = FALSE then
	
		SELECT FASES_NUEVAS 
			INTO :LL_FASE_REFASEO
			FROM OOP_REFASEO
			WHERE CM = :LL_CT;
	
		IF sqlca.sqlcode = 100 OR sqlca.sqlcode = -1 then // si NO EXISTE OPERACION CASCARA then
			
			li_refaseo = 0	
			
			ls_fase_a = Mid(ls_fase_suministro, 1, 1)
			ls_fase_b = Mid(ls_fase_suministro, 2, 1)
			ls_fase_c = Mid(ls_fase_suministro, 3, 1)
			
		ELSE
			
			li_refaseo = 1
			
			SELECT FASE_STRING 
			INTO :ls_fase_suministro
			FROM GI_FASE_CHAR
			WHERE FASE_NUM = :ll_fase_refaseo;
			
			ls_fase_a = Mid(ls_fase_suministro, 3, 1)
			ls_fase_b = Mid(ls_fase_suministro, 2, 1)
			ls_fase_c = Mid(ls_fase_suministro, 1, 1)				
			
		END IF
		
		pstr_aviso.ls_fase=ls_fase_suministro			
		
		if ls_fase_a = "1"  then
			ls_operador_b = "OR"
		else 
			ls_operador_b = "AND ("
		end if
		
		if ls_fase_b = "1" or  ls_fase_a = "1" then
			ls_operador_c = "OR"
		else 
			ls_operador_c = "AND ("
		end if
		
		IF ls_fase_a = "1" then // El suministro engancha por la fase A
			ls_sql_statement= ls_sql_statement + &
			" AND (((SGD_INTERRUPCION.F_REPOSICION_FASE_A IS NULL AND SGD_INTERRUPCION.F_ALTA_FASE_A IS NOT NULL)) "
		END IF	

		IF ls_fase_b = "1" then // El suministro engancha por la fase B
			ls_sql_statement= ls_sql_statement + &
			ls_operador_b + " ((SGD_INTERRUPCION.F_REPOSICION_FASE_B IS NULL  AND SGD_INTERRUPCION.F_ALTA_FASE_B IS NOT NULL) ) "
		END IF	

		IF ls_fase_c = "1" then  // El suministro engancha por la fase C
			ls_sql_statement= ls_sql_statement + &
			ls_operador_c + " ((SGD_INTERRUPCION.F_REPOSICION_FASE_C IS NULL AND SGD_INTERRUPCION.F_ALTA_FASE_C IS NOT NULL)) "
		END IF	
		
		ls_sql_statement= ls_sql_statement + " )"

	ELSE
		
		ls_sql_statement= ls_sql_statement + &
		"AND ((SGD_INTERRUPCION.F_REPOSICION IS NULL AND SGD_INTERRUPCION.F_ALTA IS NOT NULL)) "

	END IF

	PREPARE SQLSA FROM :ls_sql_statement;
	
	OPEN DYNAMIC LC_INTERRUPCIONES ;

	FETCH LC_INTERRUPCIONES 
	INTO :ls_h_rep_a,
			 :ls_h_rep_b,
			 :ls_h_rep_c,
			 :ls_h_rep,
			 :ls_t_interrupcion,
			 :ll_incidencia,
			 :ll_inst_int,
			 :ldt_f_rep_fase_a,
			 :ldt_f_rep_fase_b,
			 :ldt_f_rep_fase_c,
			 :ldt_f_rep;
	
	DO WHILE SQLCA.SQLCODE = 0 
		
		IF isnull(ls_h_rep) and isnull(ls_h_rep_a) and isnull(ls_h_rep_b) and isnull(ls_h_rep_c)THEN
			// Esto significa que la interrupcion est$$HEX2$$e1002000$$ENDHEX$$abierta
			pstr_aviso.ll_incidencia = ll_incidencia
			pstr_aviso.li_est_aviso = fgci_aviso_asociado
			pstr_aviso.ll_instalacion_int = ll_inst_int

			CLOSE LC_INTERRUPCIONES;
			
			fw_avisos_instalacion(pl_instalaciones, pstr_aviso,ll_fases,ll_salida_mt)
			
			li_devuelve =  2
			
			RETURN li_devuelve
		
		end if	
		
		FETCH LC_INTERRUPCIONES 
		INTO :ls_h_rep_a,
				 :ls_h_rep_b,
				 :ls_h_rep_c,
				 :ls_h_rep,
				 :ls_t_interrupcion,
				 :ll_incidencia,
				 :ll_inst_int,
				 :ldt_f_rep_fase_a,
				 :ldt_f_rep_fase_b,
				 :ldt_f_rep_fase_c,
				 :ldt_f_rep;
	
	LOOP
	
END IF

CLOSE LC_INTERRUPCIONES;

fw_avisos_instalacion(pl_instalaciones, pstr_aviso,ll_fases,ll_salida_mt)

RETURN 1
end function

public function integer fw_avisos_instalacion (long pl_instalaciones[], s_aviso pstr_aviso, long pl_fases[], long pl_salmt[]);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fpr_avisos_instalacion
//
// Objetivo:    Implementa una conexi$$HEX1$$f300$$ENDHEX$$n con conectividad para 
//				  que devuelva la jerarqu$$HEX1$$ed00$$ENDHEX$$a en el Estado Real de la red.
//				  Dicha jerarqu$$HEX1$$ed00$$ENDHEX$$a se grabara en la tabla gi_avisos_instalacion.
//				  Si no grabara la jerarqu$$HEX1$$ed00$$ENDHEX$$a real, grabar$$HEX2$$e1002000$$ENDHEX$$la normal.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:     Pi_clase_aviso
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  	Fecha         Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// 	---------    			-------         	----------------------------------------
//	24/01/2001		FDO			Creaci$$HEX1$$f300$$ENDHEX$$n.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_incidencia,ll_instalacion,ll_posicion_busqueda,ll_instalacion_referencia,ll_padre,ll_ind_incidencia=0,ll_ind_ot=0,ll_ct,ll_cant_avisos
datetime  ldt_fecha_actual
string ls_ci,ls_nombre_instalacion,ls_nom_ct,ls_fase,ls_mensaje
int li_contador,li_tipo_instalacion,li_centro,li_mesa,li_cmd,li_ind_red,li_tipo_inst,li_ind_smt,li_ind_instal

ldt_fecha_actual = fgnu_fecha_actual()
ll_instalacion = pstr_aviso.ll_nro_instalacion   

IF gb_red_trifasica = TRUE then
	
	pstr_aviso.ls_fase = '111'
	
ELSE
	
	IF 	ll_instalacion = fgcdec_aviso_sin_alimentacion OR &
		ll_instalacion = fgcdec_aviso_de_ayuda OR &
		ll_instalacion = fgcdec_aviso_alumbrado_publico OR &
		ll_instalacion = fgcdec_aviso_de_calidad_sin_alim THEN
		
		pstr_aviso.ls_fase = '111'
		
	END IF
	
END IF

// Puntero a "reloj de arena"
SetPointer(HourGlass!)

//	 Ahora que se dispone de los datos necesarios intento la conexi$$HEX1$$f300$$ENDHEX$$n con conectividad. 
//   Primero chequeamos Si el aviso es con alimentaci$$HEX1$$f300$$ENDHEX$$n. Ya sea de Calidad o Normal.

IF ll_instalacion <> fgcdec_aviso_sin_alimentacion AND &
	ll_instalacion <> fgcdec_aviso_de_ayuda AND &
	ll_instalacion <> fgcdec_aviso_alumbrado_publico AND &
	ll_instalacion <> fgcdec_aviso_de_calidad_sin_alim THEN //DBE 03/03/2000

	ls_nombre_instalacion = "ACOMETIDA - " + string(ll_instalacion)
	
	// Ingresamos la acometida que no devuelve la funci$$HEX1$$f300$$ENDHEX$$n dentro de la tabla Gi_avisos_instalacion
	
	  INSERT INTO "GI_AVISOS_INSTALACION"  
				( "F_ACTUAL",   
				  "USUARIO",   
				  "PROGRAMA",   
				  "TIPO_INSTALACION",   
				  "NRO_AVISO",   
				  "NRO_INSTALACION",   
				  "NRO_INST_PADRE",  
				  "EST_AVISO",   
				  "TIPO_AVISO",   
				  "NRO_ZONA",   
				  "NRO_CMD",   
				  "NRO_SECTOR",   
				  "F_ALTA",   
				  "IND_RED",   
				  "FASE",   
				  "CLASE_AVISO",   
				  "NOM_INSTALACION" )  
	  VALUES ( 
				  :ldt_fecha_actual,   
				  :gs_usuario,   
				  'w_1201',   
				  :fgci_tipo_acometida,   
				  :pstr_aviso.ll_nro_aviso,   
				  :ll_instalacion,   
				  :pl_instalaciones[1],   
				  :pstr_aviso.li_est_aviso,   
				  :pstr_aviso.li_clase_aviso,   
				  :pstr_aviso.li_nro_centro,
				  :pstr_aviso.li_nro_cmd,     
				  :pstr_aviso.li_nro_mesa,   
				  :ldt_fecha_actual,   
				  :pstr_aviso.gi_tipo_red,   
				  :pstr_aviso.ls_fase,   
				  :pstr_aviso.li_clase_aviso,
				  :ls_nombre_instalacion)  ;

	IF sqlca.sqlcode<> 0 then
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ingresar la informaci$$HEX1$$f300$$ENDHEX$$n de la acometida: " + sqlca.sqlerrtext ,information!,ok!)
		Return -1
	END IF
	
ELSE
	
	pl_instalaciones[Upperbound(pl_instalaciones[]) +1] = ll_instalacion
		
	IF ll_instalacion = fgcdec_aviso_de_calidad_sin_alim THEN
		pl_instalaciones[Upperbound(pl_instalaciones[]) +1] = fgcdec_aviso_de_calidad
	END IF

END IF

For li_contador = 1 to Upperbound(pl_instalaciones[]) 
	
	
	IF  pstr_aviso.li_ind_calidad = 1 then
	
	  SELECT MIN("SGD_INCIDENCIA"."NRO_INCIDENCIA")  
    		INTO :ll_ind_incidencia
    		FROM "SGD_INCIDENCIA"  
   		WHERE ( "SGD_INCIDENCIA"."EST_ACTUAL" < :fgci_incidencia_servicio_repuesto ) AND  
        				( "SGD_INCIDENCIA"."TIP_INCIDENCIA" = :fgci_incidencia_calidad ) AND  
         			( "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :pl_instalaciones[li_contador] )   ;
						
	ELSE
		
	  SELECT MIN("SGD_INCIDENCIA"."NRO_INCIDENCIA")  
    		INTO :ll_ind_incidencia
    		FROM "SGD_INCIDENCIA"  
   		WHERE ( "SGD_INCIDENCIA"."EST_ACTUAL" < :fgci_incidencia_servicio_repuesto ) AND  
        				( "SGD_INCIDENCIA"."TIP_INCIDENCIA" <> :fgci_incidencia_calidad ) AND  
         			( "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :pl_instalaciones[li_contador] )   ;

	END IF

	IF NOT ISNULL(ll_ind_incidencia) then
		ll_ind_incidencia = 1
	ELSE
		ll_ind_incidencia = 0
	END IF
	
	IF pl_instalaciones[li_contador] = pstr_aviso.ll_instalacion_int THEN
		li_ind_instal = 1 
	ELSE
		li_ind_instal = 0
	END IF
	
	SELECT MIN("GI_OT"."NRO_OT")  
   		INTO :ll_ind_ot
    		FROM "GI_OT"  
   		WHERE ( "GI_OT"."EST_OT" < 3 ) AND  
        				( "GI_OT"."NRO_INCIDENCIA" = 0 ) AND  
         			( "GI_OT"."NRO_INSTALACION" = :pl_instalaciones[li_contador] )   ;
	
	IF NOT ISNULL(ll_ind_ot) then
		ll_ind_ot = 1
	ELSE
		ll_ind_ot = 0
	END IF
	
	IF li_contador = (Upperbound(pl_instalaciones[]))  then 
		ll_padre = 0
		ELSE
		ll_padre= pl_instalaciones[li_contador + 1]
	END IF
	
	// Trabajamos con la Situaci$$HEX1$$f300$$ENDHEX$$n Real de la Red
	
	SELECT "SGD_INSTALACION"."TIPO_INSTALACION",
				"SGD_INSTALACION"."NOM_INSTALACION",
				"SGD_INSTALACION"."NRO_CENTRO",
				"SGD_INSTALACION"."NRO_CMD",
				"SGD_INSTALACION"."NRO_MESA"
	INTO :li_tipo_instalacion,:ls_nombre_instalacion,:li_centro,:li_cmd,:li_mesa
	FROM "SGD_INSTALACION"
	WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :pl_instalaciones[li_contador];
	
	IF li_tipo_instalacion = fgci_tipo_ct and pstr_aviso.li_est_aviso = fgci_aviso_pendiente then
		ll_ct = pl_instalaciones[li_contador]
		
		select count(*) 
		into :ll_cant_avisos
		from gi_avisos_instalacion 
		where nro_instalacion = :ll_ct;
		
		IF gb_operaciones =  true and ll_cant_avisos = 0 then
		
			// Sacamos el CI de la acometida
			
			SELECT "SGD_CODIGOS"."CIS"
			INTO :ls_ci
			FROM "SGD_CODIGOS"
			WHERE "SGD_CODIGOS"."NOMBRE" = 'sgd_ct';
			
			IF sqlca.SqlCode <> 0 THEN
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el identificador de clase.")
				return -1
			END IF
			
			// Como el string que me llega lleva ' :' los elimino del string para hacer el casting
		
			ll_posicion_busqueda = pos(ls_ci,":",1)		
				
			do while ll_posicion_busqueda<> 0
								
				ls_ci= replace(ls_ci,ll_posicion_busqueda,1,'')
				ll_posicion_busqueda = pos(ls_ci,":",1)		
					
			loop 
					
			gu_rf_servidor_operacion.of_tool_aviso(ll_ct,ldt_fecha_actual,1,ls_mensaje,integer(ls_ci))
			
			IF ls_mensaje <> "" then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo dar de alta el tool en Operaci$$HEX1$$f300$$ENDHEX$$n. Se ingresa el aviso: " + ls_mensaje,information!,ok!)
			END IF	

		END IF
		
		ls_nom_ct = ls_nombre_instalacion
		if Upperbound(pl_salmt[])> 1 then 
			li_ind_smt = 1
		else
			setnull(li_ind_smt)
		end if
	ELSE
		setnull(li_ind_smt)
	END IF
	
	INSERT INTO "GI_AVISOS_INSTALACION"  
		( "F_ACTUAL",   
		  "USUARIO",   
		  "PROGRAMA",   
		  "TIPO_INSTALACION",   
		  "NRO_AVISO",   
		  "NRO_INSTALACION",   
		  "NRO_INST_PADRE",  
		  "EST_AVISO",   
		  "TIPO_AVISO",   
		  "NRO_ZONA",   
		  "NRO_CMD",   
		  "NRO_SECTOR",   
		  "F_ALTA",   
		  "IND_RED",   
		  "FASE",   
		  "CLASE_AVISO",   
		  "NOM_INSTALACION",
		  "IND_INCIDENCIA",
		  "NRO_OT",
		  "IND_OTRAS_SMT",
		  "INSTALACION_CON_INT")  
  VALUES ( 
			  :ldt_fecha_actual,   
			  :gs_usuario,   
			  'w_1201',   
			  :li_tipo_instalacion,   
			  :pstr_aviso.ll_nro_aviso,   
			  :pl_instalaciones[li_contador],   
			  :ll_padre,   
			  :pstr_aviso.li_est_aviso,   
			  :pstr_aviso.li_clase_aviso,   
			  :pstr_aviso.li_nro_centro,   
			  :pstr_aviso.li_nro_cmd,
			  :pstr_aviso.li_nro_mesa,  
			  :ldt_fecha_actual,   
			  :pstr_aviso.gi_tipo_red,   
			  :pstr_aviso.ls_fase,   
			  :pstr_aviso.li_clase_aviso,   
			  :ls_nombre_instalacion,
			  :ll_ind_incidencia,
			  :ll_ind_ot,
			  :li_ind_smt,
			  :li_ind_instal)  ;
			  
	IF sqlca.sqlcode<> 0 then
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ingresar la informaci$$HEX1$$f300$$ENDHEX$$n de las instalaciones: " + sqlca.sqlerrtext ,information!,ok!)
		Return -1
	END IF	
	
Next

// Salvamos los datos de otras salidas de media

IF  Upperbound(pl_salmt[]) > 1 then
	For li_contador = 1 to Upperbound(pl_salmt[]) 
	
		// Recuperamos el nombre de la instalacion
		
		SELECT "SGD_INSTALACION"."NOM_INSTALACION","SGD_INSTALACION"."TIPO_INSTALACION"
		INTO :ls_nombre_instalacion,:li_tipo_inst
		FROM "SGD_INSTALACION"
		WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :pl_salmt[li_contador];
		
		// Recuperamos la fase de la salida de media tensi$$HEX1$$f300$$ENDHEX$$n en formato varchar2
	
		SELECT "GI_FASE_CHAR"."FASE_NOM"  
		INTO :ls_fase  
		FROM "GI_FASE_CHAR"  
		WHERE "GI_FASE_CHAR"."FASE_NUM" =  :pl_fases[li_contador];
					
		// Nos saltamos el primero ya que es la propia salida de media del CT
		
		  INSERT INTO "GI_AVISOS_OTRAS_INSTAL"  
				( "USUARIO",   
				  "PROGRAMA",   
				  "F_ACTUAL",   
				  "COD_SMT",   
				  "COD_CT",   
				  "NOM_INSTALACION",
			  "TIPO_INSTALACION",
			  "FASE")  
		  VALUES ( :gs_usuario,  
					  'w_1201',   
					  :ldt_fecha_actual,   
					  :pl_salmt[li_contador],
					  :ll_ct,
					  :ls_nombre_instalacion,
					  :li_tipo_inst,
					  :ls_fase)  ;
					  
		// Es posible que aqu$$HEX2$$ed002000$$ENDHEX$$devuelva el sqlca primary key violated. En ese caso no pasa nada ya que los registros
		// Pueden estar de otro aviso
	Next
end if

RETURN 1
	
				
end function

public function integer fw_cambio_w (integer pi_tipo);long	il_wx,il_wy,il_wh,il_ww,il_gbh,il_gbw,il_olex,il_oley,il_stx,il_sty

if pi_tipo=1 then
	
	il_wx = this.x 
	il_wy = this.y
	il_wh = this.height
	il_ww = this.width
	
	il_gbh = gb_1.height
	il_gbw = gb_1.width
	
	il_olex = ole_estado.x
	il_oley = ole_estado.y
	il_stx = st_estado.x
	il_sty = st_estado.y
	
	this.x = 1070
	this.y = 524
	this.height =340
	this.width = 1180
	
	gb_1.height =  212
	gb_1.width = 1083
	
	ole_estado.x = 59
	ole_estado.y = 64
	st_estado.x = 59
	st_estado.y = 139
	
	st_estado.show()
	p_1.visible=false
	mle_2.visible=false
	
else
	
	this.x = il_wx
	this.y = il_wy
	this.height = il_wh 
	this.width = il_ww
	
	gb_1.height = il_gbh
	gb_1.width = il_gbw
	
	ole_estado.x = il_olex
	ole_estado.y = il_oley
	p_1.visible=true
	mle_2.visible=true
	
	st_estado.x = il_stx
	st_estado.y = il_sty
	
end if

this.setredraw(true)

yield()

return 1
end function

public function integer fw_genera_suministros (long pl_inst_padre);/////////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_genera_suministros
// 
// Objetivo: Generar Datos en SGD_ACOMETIDA,ACO_SUM,SUMCON,CLIENTES
//	
// Responsable: FDO 
//
// Parametros:
//    Entrada:  Salida de Baja o CT.
//		Salida : 
//
// Devuelve:1 Si funciona 
//			   0 Si no funciona
//
// Fecha      Responsable   Actuacion
// ------	   -----------   ---------
// 1/04/02    FDO
///////////////////////////////////////////////////////

////////// VARIABLES ACOMETIDAS //////////
long ll_nro_salidas,ll_aleatorio1,ll_aleatorio3,ll_aleatorio2,ll_aleatorio4,ll_contador,ll_num_puerta,ll_nro_instalacion
long ll_ct,ll_pot_contratada,ll_cant_clientes,ll_cant_cli_imp
int li_bandera,li_nro_centro,li_nro_cmd,li_nro_mesa
string ls_etiq_vol,ls_etiq_vol_corto,ls_duplicador,LS_NOM_ACOMETIDA,ls_propiedad
datetime ldt_f_actual
//////////////////////////////////////////////////////////////


// Recupera la ultima acometida

SELECT CODIGO
INTO :il_nro_acometida
from SGD_CODIGOS
	WHERE upper(NOMBRE) like upper('sgd_acom%');

	if SQLCA.sqlcode<>0 then	
		messagebox("ATENCION", "NO SE ENCONTRO LA ULTIMA ACOMETIDA")
		li_bandera=1
	end if		
		
if il_tipo_inst <= fgci_tipo_ct then

	// Recupera las Salidas de Baja.
	select count(*) 
	into : ll_nro_salidas
	from sgd_instalacion 
	where tipo_instalacion between :fgci_tipo_ct and :fgci_tipo_salida_de_baja 
		and BDI_JOB = 0 
	connect by prior nro_instalacion = nro_inst_padre 
		start with nro_instalacion = :pl_inst_padre;

else
	ll_nro_salidas = 1
end if

ll_aleatorio1 = fw_genera_aleatorio(10000)
ll_aleatorio3 = fw_genera_aleatorio(100)
	
st_estado.text= " Generando Acometida"

il_nro_acometida++

UPDATE SGD_CODIGOS
SET CODIGO = :il_nro_acometida
	WHERE upper(NOMBRE) like upper('sgd_acom%');

if SQLCA.sqlcode<>0 then	
	messagebox("ATENCION", "NO SE ACTUALIZO LA ULTIMA ACOMETIDA")
	li_bandera=1
end if		

ls_duplicador= left(ls_duplicador,2)

ll_aleatorio2 = fw_genera_aleatorio(ll_nro_salidas) 

select nro_instalacion,cod_prop_inst,NRO_CENTRO,NRO_CMD,NRO_MESA,nro_inst_padre
into :ll_nro_instalacion,:ls_propiedad,:li_nro_centro,:li_nro_cmd,:li_nro_mesa,:ll_ct
from sgd_instalacion 
where tipo_instalacion between :fgci_tipo_ct and :fgci_tipo_salida_de_baja 
	and BDI_JOB = 0 AND
		 rowid in (select max(rowid) from 
					 sgd_instalacion WHERE tipo_instalacion between :fgci_tipo_ct and :fgci_tipo_salida_de_baja and BDI_JOB = 0 AND rownum <= :ll_aleatorio2 
					 connect by prior nro_instalacion = nro_inst_padre start with nro_instalacion = :pl_inst_padre)
connect by prior nro_instalacion = nro_inst_padre 
	start with nro_instalacion = :pl_inst_padre;


ll_pot_contratada = fw_genera_aleatorio(500) + 500
ll_cant_clientes =  ll_cant_clientes + 1
ll_cant_cli_imp = 0

if isnull(ls_propiedad) then
	ls_propiedad = "UF"
end if

if isnull(li_nro_centro) then
	li_nro_centro = 1
end if

ll_aleatorio3 = fw_genera_aleatorio(100) + 100
ll_aleatorio4 = fw_genera_aleatorio(100)

LS_NOM_ACOMETIDA='ACOMETIDA ' + STRING(il_nro_acometida)
//AHU Error al insertar acometida
INSERT INTO "SGD_ACOMETIDA"  
		( "USUARIO",   
		  "F_ACTUAL",   
		  "PROGRAMA",   
		  "INSTALACION_ORIGEN",   
		  "CODIGO",   
		  "BDI_JOB",   
		  "POT_CONTRATADA",   
		  "KWH",   
		  "NIF",   
		  "CANT_CLI",   
		  "COD_CALLE",   
		  "COD_DEPTO",   
		  "COD_LOC",   
		  "COD_PROV",   
		  "COD_MUNIC",   
		  "NUM_PUERTA",   
		  "DESCRIPCION",   
		  "DUPLICADOR",   
		  "KWH_FACT",   
		  "NRO_CENTRO",   
		  "NRO_CMD",   
		  "NRO_MESA",   
		  "CANT_CLIENTES_IMP",   
		  "PROPIEDAD",   
		  "POTENCIA_MAX",   
		  "ESTA_EN",   
		  "ESTA_EN1",   
		  "LONGITUD",   
		  "TENSION",   
		  "TIP_PROTECCION",   
		  "TIP_ACOMETIDA",   
		  "REF_DIR",   
		  "CLASS_ID",   
		  "STATFLG",   
		  "NRO_ACO_SUM",
		  "ONIS_VER",
		  "ONIS_STAT")  
VALUES ('SGI',   
		  :ldt_f_actual,   
		  'S_CALL',    
		  :ll_nro_instalacion,   
		  :il_nro_acometida,  
		  0, 
		  :ll_pot_contratada,   
		  0,   
		  0,   
		  :ll_cant_clientes,   
		  0,   
		  0,   
		  0,   
		  0,   
		  0,   
		  0,      
		  :LS_NOM_ACOMETIDA,   
		  :ls_duplicador,   
		  :ll_aleatorio4,   
		  :li_nro_centro,   
		  :li_nro_cmd,   
		  :li_nro_mesa,   
		  :ll_cant_cli_imp,   
		  :ls_propiedad,   
		  100,   
		  0,
		  :ll_ct,
		  3,
		  220,
		  null,
		  'B',
		  :ls_etiq_vol,
		  1037,
		  0,
		  null, 
		  '0',
		  '0');
		  
if SQLCA.sqlcode<>0 then	
	messagebox("ATENCION", SQLCA.SQLERRTEXT)
	li_bandera=1
end if		

ll_contador++

if li_bandera=1 then 
	rollback;
	return -1
end if

// Una vez generada la acometida dispongo de su c$$HEX1$$f300$$ENDHEX$$digo. Ahora se genera un cliente.
st_estado.text= " Generando Cliente."

IF fw_genera_clientes(ll_nro_instalacion,li_nro_centro,li_nro_cmd,li_nro_mesa) = -1 THEN
	rollback;
	return -1	
END IF

IF fw_genera_sum() = -1 THEN
	rollback;
	return -1	
END IF

commit;

return 1
end function

public function integer fw_genera_clientes (long pl_acometida, integer pi_zona, integer pi_cmd, integer pi_sector);long ll_num_clientes,ll_cod_calle
long ll_cantcod,ll_contapuertas,ll_max_callejero,ll_ale_callejero,ll_codloc
string ls_nom,ls_ape,ls_ape2,ls_nombre[],ls_dupli[4],ls_num_clientes,ls_tip_doc,ls_cadena
int li_bandera=0
datetime dt_fechas
long ll_cliente,LL_MAX,ll_cantcalles

ls_nombre={"MANUEL", "FEDERICO", "SEBASTIAN", "FRANCISCO", "JAVIER", &
				"LUIS", "ALFREDO", "MARIO", "GUSTAVO", "JESUS", &
				"ALFONSO", "RAUL", "HUGO", "PABLO", "ELOY",&
				"HECTOR", "NECTOR","FELIPE",&
				"ANTONIO", "JOSE M$$HEX1$$aa00$$ENDHEX$$", "VICTOR", "ALEJANDRO" , "JUAN", &
				"ALBERTO", "RAMON", "PATXI", "GABRIEL", "ISRAEL", &
				"MARIA", "CRISTINA", "REBECA", "LUISA", "ANGEL", &
				"MERCEDES","JOSE", "HUMBERTO","FERNANDO","ANA", &
				"MAGDALENA","CARLOS","ROBERTO","ENRIQUE","PEDRO",'ENCABO',&
				'ENRIQUE JORGE','FERNANDEZ','FERNANDO','FERNANDO JORGE','GALLARDO',&
				'GARCIA','GIL','GLORIA','GRINCHE','HELDER MANUEL','HELENA MARIA','HENCHE',&
				'HERNANDEZ','HERNANDO','HERREROS','HUELVES','HUERTES','JAIME',&
				'JAVALOYES','JOAQUIM','JOAQUIM JOSE','JORGE','JOSE','JOSE AUGUSTO',&
				'JOSE JOAQUIN','LAFITE','LAFONT','LAZARO','LEZA','LLORENS','LOIZU','LOPEZ',&
				'LUCIANA MARIA','LUIS ALBERTO','LUNA','MADRIGAL','MANUEL','MANZANO',&
				'MARIA','TERESA','MARTIN','MILLAN','MORA','MU$$HEX1$$d100$$ENDHEX$$OZ','NICOLAS','NI$$HEX1$$d100$$ENDHEX$$EZ','NORES',&
				'NORIEGA','OLIVAN','PARDO','PASCUAL','PE$$HEX1$$d100$$ENDHEX$$A','PEREZ','PONCE','RENEDO','SERNA',&
				"LOPEZ", "ARRANZ", "GONZALEZ", "SERNA", "SANCHEZ", &
				"GUTIERREZ", "VARGAS", "BERMEJO", "AMBOHADES", "SAEZ", &
				"DIAZ", "ESTIBARIZ", "MAESTRO", "CUSTODIO", "MARQUEZ", &
				"DONATO", "COTO", "CAMACHO", "PALLARES", "MATORRA", &
				"RUIZ", "ORTEGA", "SANTAMARIA", "LOBO", "DEL POZO", &
				"AZNAR", "SUAREZ", "GAMMA", "JURADO", "BARRERO",'ABAIXO','ADONIS','ALMEIDA',&
				'ANDRE','BAPTISTA','BAROSA','BARREIA','BERNARDES','BERNARDINO',&
				'BERNARDO','BORGES','CABECO','BENCH','CALADO','CARDOSO','CARVALHO',&
				'CASEIRO','CASTANHEIRA','CLARO','COSTA','CRESPO','CUNHA','DE OLIVEIRA',&
				'DOMINGOS','DOMINGUES','DOS SANTOS','DUARTE','FAZENDEIRO',&
				'FERREIRA','FREITAS','GARDINHO','GONCALVES','GOUVEIA',&
				'GUERRA','GUTERRES','GUTIERREZ','LADIRO','LAINS','LEAL','LEIRIA',&
				'LEIT$$HEX1$$d100$$ENDHEX$$O','MACHADO','MALAQUIAS','MARQUES','MARTINS','MATIAS','MATOS',&
				'MENINO','MESQUITA','MIRALDO','MONTEIRO','MORGAD','MOTEIRO',&
				'NEVES','NOGUEIRA','NUNES','OLIVEIRA','PASTO','EDROSA','PEREIRA','PIMENTEL',&
				'PINA','PINTO','PIRES','PONT$$HEX1$$d100$$ENDHEX$$O','RATO','REI','RIBEIRO','RINO','ROCHA','RODRIGUES',&
				'ROSA','RUIVO','SALES','SANGUE','SANTOS','SARDO','SARMENTO','SERRANO','SILVA',&
				'SILVERIO','SOARES','SOUSA','TEIXEIRA','TELES','VENANCIO','VICENTE','VIDAL','VIEIRA'}

dt_fechas=fgnu_fecha_Actual()

ls_dupli = {'A','B','C','D'}
ls_nom = ls_nombre[fw_genera_aleatorio(upperbound(ls_nombre))]
ls_ape = ls_nombre[fw_genera_aleatorio(upperbound(ls_nombre))]
ls_ape2 = ls_nombre[fw_genera_aleatorio(upperbound(ls_nombre))]

select count(cod_loc)
into :ll_cantcod
from gi_centro_loc
where nro_cmd = :pi_cmd and
		nro_puesto = :pi_sector and
		nro_centro = :pi_zona;
		
if ll_cantcod > 1 then
	ll_cantcod = fw_genera_aleatorio(ll_cantcod)
else
	ll_cantcod = 1
end if

select cod_local,cod_prov,cod_depto,cod_munic
into :il_cod_loc,:il_cod_prov,:il_cod_depto,:il_cod_munic
from localidades
where rowid in (select max(rowid) from 
						 localidades WHERE rownum <= :ll_cantcod);
IF sqlca.sqlcode = -1 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ubicar geogr$$HEX1$$e100$$ENDHEX$$ficamente ",Information!,OK!)
	rollback;
	return -1
END IF

select count(*)
into :ll_cantcalles
from callejero
where cod_local = :il_cod_loc 
and cod_prov = :il_cod_prov 
and cod_depto = :il_cod_depto 
and cod_munic  = :il_cod_munic;

if ll_cantcalles > 1 then
	
	ll_cantcalles = fw_genera_aleatorio(ll_cantcalles)
	
	select cod_calle 
	into :il_cod_calle 
	from callejero where
	rowid in (select max(rowid) from callejero 
		where cod_local = :il_cod_loc 
			and cod_prov = :il_cod_prov 
			and cod_depto = :il_cod_depto 
			and cod_munic  = :il_cod_munic and rownum <= :ll_cantcalles);
	
	IF sqlca.sqlcode = -1 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ubicar geogr$$HEX1$$e100$$ENDHEX$$ficamente ",Information!,OK!)
		rollback;
		return -1
	END IF

else

	select count(*)
	into :ll_cantcalles
	from callejero;

	select cod_calle , cod_local ,cod_prov ,cod_depto ,cod_munic
	into :il_cod_calle , :il_cod_loc,:il_cod_prov ,:il_cod_depto , :il_cod_munic 
	from callejero
	where rowid in (select max(rowid) from 
							 callejero WHERE rownum <= :ll_cantcalles);
	
	IF sqlca.sqlcode = -1 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ubicar geogr$$HEX1$$e100$$ENDHEX$$ficamente ",Information!,OK!)
		rollback;
		return -1
	END IF
	
	
end if

ls_tip_doc = 'TD004'

select max(cod_cli)
into :il_codcli
from clientes;

il_codcli ++

il_num_pta = fw_genera_aleatorio(999)

is_duplicador = ls_dupli[fw_genera_aleatorio(4)]

ls_num_clientes = string(il_num_pta)

is_cgv= string(fw_genera_aleatorio(7))

INSERT INTO "CLIENTES"  
         ( "USUARIO","F_ACTUAL","PROGRAMA","COD_CLI","APE1_CLI","APE2_CLI","NOM_CLI",   
           "TFNO_CLI","COD_CALLE","NUM_PUERTA","DUPLICADOR","CGV_CLI","DOC_ID","TIP_DOC",   
           "CO_PAIS","TIP_CLI","F_ALTA","F_BAJA","NRH","NRH_FAV","NRH_PEN","FAX_CLI",   
           "PERS_CONTACTO","CO_COND_FISCAL","SOUNDEX_AP1","SOUNDEX_AP2","REF_DIR","CUALIF_CLI",   
           "NUM_DEV_CHEQ","CANT_LETRAS_IMPAGAS","NUM_FISCAL",
			  "USR_NUMBER1", "USR_NUMBER2", "USR_NUMBER3", "USR_VARCHAR1", "USR_VARCHAR2", "USR_VARCHAR3",
			  "USR_DATETIME1", "USR_DATETIME2")
  VALUES ( 'SGI',:dt_fechas,'S_CALL',:il_codcli,:ls_ape,:ls_ape2,:ls_nom,   
           :il_codcli, :il_cod_calle,:il_num_pta,:is_duplicador,:is_cgv,:ls_num_clientes,:ls_tip_doc,   
           'PD001','TC093',:dt_fechas,:DT_FECHAS,1,1,1,'1',' ','FC500',' ',' ',' ',' ',
           1,1,:ls_num_clientes,
			  0, 0, 0, ' ', ' ', ' ',
			  to_date('31/12/2999','dd/mm/yyyy'), to_date('31/12/2999','dd/mm/yyyy'));
	  
if sqlca.sqlcode= -1 then
	messagebox("ATENCION","Error : " + sqlca.SQLErrText)
	return -1
end if

Select max(nif) into :il_nif  from fincas;

il_nif ++

INSERT INTO "FINCAS"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "NIF",   
           "COD_CALLE",   
           "NUM_PUERTA",   
           "DUPLICADOR",   
           "COD_OFICOM",   
           "ACC_FINCA",   
           "EST_FIN",   
           "TIP_FIN",   
           "F_INST",   
           "EST_INST",   
			  "F_BAJA",
			  "F_REV",
           "T_FINCA",   
           "T_CL_FINCA",   
           "T_FINCA_ANT",   
           "REF_DIR",   
           "NUMERO_AUX",   
           "COD_AREA",   
           "NUM_PADRON",
			  "USR_NUMBER1", "USR_NUMBER2", "USR_NUMBER3", "USR_VARCHAR1", "USR_VARCHAR2", "USR_VARCHAR3",
			  "USR_DATETIME1", "USR_DATETIME2", "PAN_NOMBRE_FINCA")  
  VALUES ( 'SGI',   
           sysdate,   
           'S_CALL',   
           :il_nif,   
           :il_cod_calle,   
           :il_num_pta,   
           :is_duplicador,   
           0,   
           ' ',   
           ' ',   
           ' ',   
           Sysdate,   
           ' ',   
			  to_date('31/12/2999','dd/mm/yyyy'),
			  to_date('31/12/2999','dd/mm/yyyy'),
           0,   
           0,   
           0,   
           ' ',   
           ' ',   
           0,   
           ' ',
			  0, 0, 0, ' ', ' ', ' ',
			  to_date('31/12/2999','dd/mm/yyyy'), to_date('31/12/2999','dd/mm/yyyy'), ' ');

IF sqlca.sqlcode = -1 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo ingresar la finca " + sqlca.sqlerrtext,Information!,OK!)
	rollback;
	return -1
END IF

commit;

return 1
end function

public function integer fw_genera_sum ();/////////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_genera_datos_suministros
// 
// Objetivo: Generar Datos en Sumcon, aco_ins y aco_sum
//	
// Responsable: FDO 
//
// Parametros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuacion
// ------	   -----------   ---------
// 15/09/98    FDO
///////////////////////////////////////////////////////

// Definicion de las variables que cambian para sumcon

long ll_contador,ll_contafin,li_bandera=0,ll_nro_instalacion,ll_nro_acometida
long ll_nro_reg_clientes,ll_cod_calle,ll_num_puerta,ll_cod_depto,ll_cod_loc,ll_nro_trafos
long ll_cod_prov,ll_cod_munic,ll_aleatorio1,ll_aleatorio2,ll_aleatorio3,ll_nro_salidas
long ll_aleatorio4,ll_aleatorio5,ll_aleatorio6,ll_max_callejero,ll_ale_callejero
long ll_pot_contratada=0,ll_cant_clientes=0,ll_cant_cli_imp,ll_cant_acometidas,ll_salbaj,ll_trafo,ll_ct,LL_SALMT,LL_SUBESTAC
datetime ldt_f_actual
string ls_duplicador, ls_tipcli = 'TC051', ls_etiq_vol, ls_etiq_vol_corto, ls_propiedad
string ls_codigo
int li_contestacion,li_nro_centro,li_nro_cmd,li_nro_mesa

select max(nis_rad) into :il_nis from sumcon;

il_nis ++

ldt_f_actual = fgnu_fecha_actual()
ll_contador=1
		
ll_aleatorio1 = fw_genera_aleatorio(50)
ll_aleatorio3 = fw_genera_aleatorio(100)
	
// Genera aleatorio entre el nro de clientes
	
ll_aleatorio2 = fw_genera_aleatorio(ll_nro_reg_clientes)

// genera aleatorio para ver estado del suministro

ll_aleatorio6 = fw_genera_aleatorio(3)

choose case ll_aleatorio6
	case 1
		ls_codigo="EC012"
	case 2
		ls_codigo="EC013"
	case 3
		ls_codigo="EC023"
end choose
	
  INSERT INTO "SUMCON"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "NIS_RAD",   
           "SEC_NIS",   
           "EST_SUM",   
           "COD_CLI",   
           "SEC_CTA",   
           "POT",   
           "COD_TAR",   
           "GR_CONCEPTO",   
           "F_MOD_CONT",   
           "TIP_CONTR",   
           "SEC_MOD",   
           "F_BAJA",   
           "IND_LVTO",   
           "F_CORTE",   
           "POT_VALLE",   
           "CSMO_FIJO",   
           "HORA_UTIL",   
           "TIP_PER_FACT",   
           "DURAC_CONT",   
           "NUM_CORT",   
           "CONT_LECT_DIF",   
           "ESTM_ANUAL",   
           "ESTM_CONS",   
           "NUM_PLZA",   
           "IMP_FIAN",   
           "F_DVOL_FIAN",   
           "AUS_CONS",   
           "IND_MODIF_CONT",   
           "F_RES_CONT",   
           "CONT_TRANS_POT",   
           "CO_RECAR_FP",   
           "F_TRANS_POT",   
           "COD_CNAE",   
           "NIS_SOLIDARIO",   
           "COD_CLI_SOLIDARIO",   
           "SEC_NIS_SOLIDARIO",   
           "IND_AN_NODET",   
           "IND_BONIF",   
           "IND_BONIF_REACT",   
           "POT_PUNTA",   
           "POT_LLANO",   
           "CO_ESTM",   
           "CONT_LECT_REP",   
           "TIP_MULTA",   
           "TASA_MULTA",   
           "TIP_RECARGO",   
           "TASA_RECARGO",   
           "GRUPO_FAMIL",   
           "F_ALTA_CONT",   
           "CGV_SUM",   
           "NIF",   
           "F_ALTA",   
           "NUM_EXP",   
           "TIP_TENSION",   
           "TIP_FASE",   
           "POT_MAX_ADMIS",   
           "TIP_CONEXION",   
           "COD_TAR_REC",   
           "TIP_SUMINISTRO",   
           "TIP_PER_LECT",   
           "TIP_ASOC",   
           "IMP_DERECHOS_CONEX",   
           "KWH_DEPOSITO_FIANZA",   
           "COD_UNICOM",
		  "CO_AN_VIP",
		  "NUM_IDENT_SIPO",
		  "IND_LECT_CONTROL",
		  "SEC_FACTURA",
		  "TIP_DISTR_ANTICIPOS",
		  "CO_ASIGNACION",
		  "DIAMETRO_CONEXION")  
  VALUES ( 'SGI',   
           :ldt_f_actual,   
           'S_CALL',   
           :il_nis,   
           1,   
           :ls_codigo,  
           :il_codcli,   
           0,   
           5,   
           '1B',   
           1,   
           :ldt_f_actual,   
           'PC011',   
           1,   
           :ldt_f_actual,   
           2,   
           :ldt_f_actual,
           0,   
           0,   
           0,   
           'RU012',   
           0,   
           0,
           0,   
           0,
           0,
           ' ',
           0,
		  :ldt_f_actual,
		  0,
		  2,
		  :ldt_f_actual,
		  0,
		  'RP001',
		  :ldt_f_actual,
		  '0000',
		  0,
		  0,
		  0,
		  2,
		  2,
		  2,
		  0,
		  0,
		  'ME000',
		  0,
		  'MU001',
		  0,
		  'RC001',
		  0,
		  0,
		  :ldt_f_actual,
		  '1/101',
		  :il_nif,
		  :ldt_f_actual,
		  ' ',
		  'TT001',
		  'FA002',
		  6600,
		  'CX110',
		  'B',
		  'SU011',
		  'RU012',
		  'IA000',
		  0,
		  0,
		  2111,
		  'VP999',
		  '8234567890',
		  2,
		  8,
		  'DA000',
		  'CA000',
		  0)  ;

	st_estado.text= " Generando Suministro"	

	if SQLCA.sqlcode<>0 then	
		messagebox("ATENCION", "2: " + SQLCA.SQLERRTEXT)
		return -1
	end if		

//Generando acometida en tabla aco_sum
	
	  INSERT INTO "ACO_SUM"  
         ( "NRO_ACOMETIDA",   
           "USUARIO",   
           "F_ACTUAL",   
           "H_ACTUAL",   
           "PROGRAMA",   
           "NIS_RAD",   
           "POT_CONTRATADA",   
           "COD_CALLE",   
           "COD_DEPTO",   
           "COD_LOC",   
           "COD_PROV",   
           "COD_MUNIC",   
           "NUM_PUERTA",   
           "DUPLICADOR",   
           "KWH",   
           "CGV_SUM",   
           "NIF",   
           "TIP_CLIENTE",   
           "KWH_FACT",   
           "REF_DIR",
		  "PAN_NOMBRE_FINCA" )  
  VALUES ( :il_nro_acometida,   
           'SGI',   
           :ldt_f_actual,   
           :ldt_f_actual,   
           'S_CALL',   
           :il_nis,   
           :ll_aleatorio1,   
           :il_cod_calle,   
           :il_cod_depto,   
           :il_cod_loc,   
           :il_cod_prov,   
           :il_cod_munic,   
           :il_num_pta,   
           :is_duplicador,   
           :ll_aleatorio3,   
           :is_cgv,   
           :il_nif,   
           :ls_tipcli,   
           :ll_aleatorio3,   
           ' ',
		  0)  ;

	if SQLCA.sqlcode<>0 then	
		messagebox("ATENCION", "3: " + SQLCA.SQLERRTEXT)
		return -1
	end if		

commit;

return 1
end function

on w_callcenter.create
int iCurrent
call super::create
this.mle_2=create mle_2
this.st_estado=create st_estado
this.cb_cont=create cb_cont
this.st_nro_avisos=create st_nro_avisos
this.st_instalacion=create st_instalacion
this.ole_estado=create ole_estado
this.mle_1=create mle_1
this.p_1=create p_1
this.st_instalacion2=create st_instalacion2
this.st_avisos2=create st_avisos2
this.gb_1=create gb_1
this.uo_prop=create uo_prop
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_2
this.Control[iCurrent+2]=this.st_estado
this.Control[iCurrent+3]=this.cb_cont
this.Control[iCurrent+4]=this.st_nro_avisos
this.Control[iCurrent+5]=this.st_instalacion
this.Control[iCurrent+6]=this.ole_estado
this.Control[iCurrent+7]=this.mle_1
this.Control[iCurrent+8]=this.p_1
this.Control[iCurrent+9]=this.st_instalacion2
this.Control[iCurrent+10]=this.st_avisos2
this.Control[iCurrent+11]=this.gb_1
this.Control[iCurrent+12]=this.uo_prop
end on

on w_callcenter.destroy
call super::destroy
destroy(this.mle_2)
destroy(this.st_estado)
destroy(this.cb_cont)
destroy(this.st_nro_avisos)
destroy(this.st_instalacion)
destroy(this.ole_estado)
destroy(this.mle_1)
destroy(this.p_1)
destroy(this.st_instalacion2)
destroy(this.st_avisos2)
destroy(this.gb_1)
destroy(this.uo_prop)
end on

event closequery;if il_nro_avisos <> il_cant_av then
	if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea mantener los avisos que han sido dados de alta?",information!,yesno!) = 1 then
		commit;
	else
		rollback;
		w_1105_avisos_con_alim.triggerevent("ue_refrescar",0,1)	
	end if
end if
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_callcenter
end type

type mle_2 from multilineedit within w_callcenter
integer x = 1129
integer y = 100
integer width = 539
integer height = 124
integer taborder = 20
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
boolean italic = true
long textcolor = 8388608
long backcolor = 67108864
string text = "Open SGI"
boolean border = false
alignment alignment = center!
end type

type st_estado from statictext within w_callcenter
boolean visible = false
integer x = 64
integer y = 1124
integer width = 1006
integer height = 52
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type cb_cont from commandbutton within w_callcenter
boolean visible = false
integer x = 1490
integer y = 1052
integer width = 265
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
string text = "Continuar"
boolean default = true
end type

event clicked;string ls_sql_statement,ls_from,ls_where,ls_sql,ls_where_sin_av,ls_lista_ct
long ll_nis,li_conta,li_salto,ll_posicion,ll_cant_nis,ll_nis_sumcon,ll_ct[],ll_conta=1
boolean lb_crea_sum = false

st_estado.visible=true
st_avisos2.setfocus()

Declare lc_cts cursor for 
select nro_instalacion from sgd_instalacion 
where tipo_instalacion = :fgci_tipo_ct
start with nro_instalacion = :il_nro_instalacion
connect by prior nro_instalacion = nro_inst_padre ;


if il_tipo_inst < fgci_tipo_ct and uo_prop.cbx_inst_dif.checked = true then
	
	open lc_cts;
	
	fetch lc_cts into :ll_ct[ll_conta];
	
	ls_lista_ct = string(ll_ct[ll_conta])
	
	do while sqlca.sqlcode = 0
		
		fetch lc_cts into :ll_ct[ll_conta];
	
		ls_lista_ct = ls_lista_ct + "," + string(ll_ct[ll_conta])
		
		ll_conta++

	loop
	
	close lc_cts;
	
end if

ll_conta = 1

ls_sql_statement=	"select count(*) NIS " 

ls_from = " from aco_sum, sgd_acometida"

ls_where = " where aco_sum.nro_acometida = sgd_acometida.codigo and instalacion_origen in " + &
			   " (select nro_instalacion from sgd_instalacion start with nro_instalacion = ? " + &
				" connect by prior nro_instalacion = nro_inst_padre )"

//ls_where_sin_av = " and aco_sum.nis_rad not in (select nis_rad from gi_avisos where est_aviso <= 3 and ind_improcedente = 0 ) and aco_sum.nis_rad = sumcon.nis_rad and sumcon.cod_cli = clientes.cod_cli "
// Chequea si hay aviso generado para este nis. y que exista cliente para este nis, y ademas que est$$HEX2$$e9002000$$ENDHEX$$en sumcon.

st_estado.text= "Buscando Suministros existentes..."

ls_sql = ls_sql_statement + ls_from + ls_where 

setpointer(Hourglass!)

DECLARE lc_nis_rad DYNAMIC CURSOR FOR SQLSA; 

PREPARE SQLSA FROM :ls_sql;

OPEN DYNAMIC lc_nis_rad using :il_nro_instalacion;
	
FETCH lc_nis_rad 
INTO :ll_cant_nis;

if sqlca.sqlcode=0 then
	
	CLOSE lc_nis_rad;
	
	if uo_prop.cbx_elim.checked = true then
		
		if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n.","Antes de generar los avisos se eliminar$$HEX1$$e100$$ENDHEX$$n los que existen actualmente sobre " + st_instalacion2.text,information!,okcancel!) = 1 then
			
			// Borrar avisos existentes
			
			setpointer(Hourglass!)
			
			st_estado.text= "Eliminando Av. en " + st_instalacion2.text + "..."
			
			ls_sql_statement=	"select aco_sum.nis_rad NIS " 
			
			ls_where_sin_av = " and aco_sum.nis_rad in (select nis_rad from gi_avisos where est_aviso <= 3 and ind_improcedente = 0 ) "

			ls_sql = ls_sql_statement + ls_from + ls_where  + ls_where_sin_av

			DECLARE lc_nis_av DYNAMIC CURSOR FOR SQLSA; 
			
			PREPARE SQLSA FROM :ls_sql;
			
			if il_tipo_inst < fgci_tipo_ct and uo_prop.cbx_inst_dif.checked = true then
				OPEN DYNAMIC lc_nis_av using :ll_ct[ll_conta];
			else
				OPEN DYNAMIC lc_nis_av using :il_nro_instalacion;
			end if
							
			FETCH lc_nis_av 
			INTO :ll_nis;
			
			Do while sqlca.sqlcode = 0
				
				DELETE from gi_avisos_instalacion 
						where nro_aviso in (SELECT nro_aviso 
												from gi_Avisos 
												where nis_rad= :ll_nis and 
													est_aviso <= 3 and
													ind_improcedente = 0);
				
				DELETE from gi_avisos 
						where nis_rad = :ll_nis and
						ind_improcedente = 0 and
						est_aviso <=3;
				
				if ll_conta = upperbound(ll_ct) then
					ll_conta = 1
				else
					ll_conta ++
				end if
				
				FETCH lc_nis_av 
				INTO :ll_nis;
			
			loop
			
			COMMIT;
			
			CLOSE lc_nis_av;
			
		end if

	end if
		
//	if ll_cant_nis >= il_nro_avisos or uo_prop.cbx_gen.checked = true then
		
		if ll_cant_nis >= 1 and  uo_prop.cbx_inst_dif.checked = false then
			
			setpointer(Hourglass!)
			
			ls_sql_statement=	"select aco_sum.nis_rad NIS " 
			
			st_estado.text= "Generando Avisos en " + st_instalacion2.text + "..."
			
			ls_where_sin_av = "  and aco_sum.nis_rad = sumcon.nis_rad "
			
			ls_from = ls_from + ", sumcon "
			
			ls_sql = ls_sql_statement + ls_from + ls_where + ls_where_sin_av
	
			DECLARE lc_nis_avisos DYNAMIC CURSOR FOR SQLSA; 
			
			PREPARE SQLSA FROM :ls_sql;
			
//			if il_tipo_inst < fgci_tipo_ct and uo_prop.cbx_inst_dif.checked = true then
//				OPEN DYNAMIC lc_nis_avisos using :ll_ct[ll_conta];
//			else
				OPEN DYNAMIC lc_nis_avisos using :il_nro_instalacion;
//			end if
				
			FETCH lc_nis_avisos 
			INTO :ll_nis;
			
			if sqlca.sqlcode = 100 then lb_crea_sum = true
			
			fw_cambio_w(1)
			
			setpointer(Hourglass!)
			
			w_1105_avisos_con_alim.triggerevent("ue_refrescar",0,2)	
			
			if not isvalid(w_callcenter) then return
			
			for li_conta = 1 to il_nro_avisos
				
				// MOD _ PACHO - PERFORMANCE \\
				
				Do 
					
					Select nis_rad 
					into :ll_nis_sumcon 
					from sumcon,clientes
					where nis_rad not in (select nis_rad from gi_avisos where est_aviso <= 3 and ind_improcedente = 0 )
							and sumcon.cod_cli = clientes.cod_cli 
							and nis_rad = :ll_nis;
				
					if isnull(ll_nis_sumcon) or ll_nis_sumcon = 0 or sqlca.sqlcode = 100 then
						
						FETCH lc_nis_avisos
						INTO :ll_nis;
						
					else
						st_estado.text= "Generando Avisos en " + st_instalacion2.text + "..."
					end if
					
					if sqlca.sqlcode = 100 or sqlca.sqlcode = -1 then
						lb_crea_sum = true 
					else
						lb_crea_sum = false
					end if
					
				loop until ll_nis_sumcon > 0  or lb_crea_sum = true
				
				if lb_crea_sum = true then
//					if il_tipo_inst < fgci_tipo_ct and uo_prop.cbx_inst_dif.checked = true then
//						if fw_genera_suministros(ll_ct[ll_conta]) = -1 then return;
//					else
						if fw_genera_suministros(il_nro_instalacion) = -1 then return;
//					end if
					ll_nis=il_nis
				end if
								
				ole_estado.visible=true
				
				st_estado.text= "Generando Aviso en " + st_instalacion2.text + "..."
				
				fw_genera_avisos(ll_nis)
					
				if not isvalid(w_callcenter) then return
					
//				if ll_conta = upperbound(ll_ct) then
//					ll_conta = 1
//				else
//					ll_conta ++
//				end if

				FETCH lc_nis_avisos 
				INTO :ll_nis;
				
				if sqlca.sqlcode = 100 or sqlca.sqlcode = -1 then
					lb_crea_sum = true 
				else
					lb_crea_sum = false
				end if
				
				w_1105_avisos_con_alim.triggerevent("ue_refrescar",0,2)		
				if not isvalid(w_callcenter) then return
				
			next
	
			commit;
			
			CLOSE lc_nis_avisos;
			
		else
			

				fw_cambio_w(1)
				yield()
				for li_conta = 1 to il_nro_avisos	
					
					ole_estado.visible=true	
					
					if il_tipo_inst < fgci_tipo_ct and uo_prop.cbx_inst_dif.checked = true then
						if fw_genera_suministros(ll_ct[ll_conta]) = -1 then return;
					else
						if fw_genera_suministros(il_nro_instalacion) = -1 then return;
					end if

					if fw_genera_avisos(il_nis) = -1 then return
					w_1105_avisos_con_alim.triggerevent("ue_refrescar",0,2)		
					
					commit;	
					
					if ll_conta = upperbound(ll_ct) then
						ll_conta = 1
					else
						ll_conta ++
					end if
					
				next
	
			
		end if
		
		fw_cambio_w(2)
		
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Los avisos fueron ingresados en el sistema.",information!,ok!)
		
		if not isvalid(w_callcenter) then return
		
		close(parent)
		
	else
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n.","No hay suficientes suministros para dar de alta los avisos.",exclamation!,ok!)
		return
	end if
//end if

CLOSE lc_nis_rad;
end event

type st_nro_avisos from statictext within w_callcenter
integer x = 1047
integer y = 972
integer width = 718
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
boolean underline = true
string pointer = "Mano6.cur"
long textcolor = 8388608
long backcolor = 79741120
string text = "Cantidad de Avisos a Generar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;uo_prop.visible = true
end event

type st_instalacion from statictext within w_callcenter
integer x = 1065
integer y = 828
integer width = 667
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
boolean underline = true
string pointer = "Mano6.cur"
long textcolor = 8388608
long backcolor = 79741120
string text = "Instalaci$$HEX1$$f300$$ENDHEX$$n Padre Afectada."
boolean focusrectangle = false
end type

event clicked;string ls_nom_instalacion

setpointer(hourglass!)

gu_comunic.is_comunic.programa_llamante = 'w_reportes'
openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)

il_nro_instalacion = gu_comunic1.is_comunic.decval1
il_tipo_inst = gu_comunic1.is_comunic.intval4

SELECT "SGD_INSTALACION"."NOM_INSTALACION"
INTO :ls_nom_instalacion	
FROM "SGD_INSTALACION" 
WHERE "NRO_INSTALACION" = :il_nro_instalacion AND BDI_JOB=0;

IF sqlca.sqlcode = 0 then
	st_instalacion2.text = ls_nom_instalacion
	st_instalacion2.textcolor = 0
	if il_nro_Avisos > 0 then
		cb_cont.visible = true
	end if
ELSE
	cb_cont.visible = false
END IF
end event

type ole_estado from olecustomcontrol within w_callcenter
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
boolean visible = false
integer x = 82
integer y = 496
integer width = 1001
integer height = 64
integer taborder = 60
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_callcenter.win"
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type mle_1 from multilineedit within w_callcenter
integer x = 1184
integer y = 244
integer width = 448
integer height = 284
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
boolean italic = true
long textcolor = 8388608
long backcolor = 67108864
string text = "Simulador de Call-Center"
boolean border = false
alignment alignment = center!
end type

type p_1 from picture within w_callcenter
integer x = 50
integer y = 52
integer width = 1211
integer height = 1072
string picturename = "fototel.bmp"
boolean focusrectangle = false
end type

type st_instalacion2 from statictext within w_callcenter
integer x = 1051
integer y = 904
integer width = 718
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 8388608
long backcolor = 79741120
boolean focusrectangle = false
end type

event doubleclicked;string ls_nom_instalacion

gu_comunic.is_comunic.programa_llamante = 'w_reportes'
openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)

il_nro_instalacion = gu_comunic1.is_comunic.decval1

SELECT "SGD_INSTALACION"."NOM_INSTALACION"
INTO :ls_nom_instalacion	
FROM "SGD_INSTALACION" 
WHERE "NRO_INSTALACION" = :il_nro_instalacion AND BDI_JOB=0;

IF sqlca.sqlcode = 0 then
	st_instalacion2.text = ls_nom_instalacion
	st_instalacion2.textcolor = 0
END IF
end event

event dragenter;messagebox("Hola","PEPE")
end event

event dragleave;messagebox("Hola","PEPE2")
end event

type st_avisos2 from statictext within w_callcenter
integer x = 1061
integer y = 1048
integer width = 407
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 79741120
boolean focusrectangle = false
end type

event doubleclicked;string ls_nom_instalacion

gu_comunic.is_comunic.programa_llamante = 'w_reportes'
openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)

il_nro_instalacion = gu_comunic1.is_comunic.decval1

SELECT "SGD_INSTALACION"."NOM_INSTALACION"
INTO :ls_nom_instalacion	
FROM "SGD_INSTALACION" 
WHERE "NRO_INSTALACION" = :il_nro_instalacion AND BDI_JOB=0;

IF sqlca.sqlcode = 0 then
	st_instalacion2.text = ls_nom_instalacion
	st_instalacion2.textcolor = 0
END IF
end event

event dragenter;messagebox("Hola","PEPE")
end event

event dragleave;messagebox("Hola","PEPE2")
end event

type gb_1 from groupbox within w_callcenter
integer x = 27
integer width = 1765
integer height = 1204
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type uo_prop from u_propiedades within w_callcenter
boolean visible = false
integer x = 251
integer y = 596
integer taborder = 50
boolean bringtotop = true
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

on uo_prop.destroy
call u_propiedades::destroy
end on


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Aw_callcenter.bin 
2200000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000005fffffffe00000004fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000ec06a04001ca37a100000003000003800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000028f00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004f86ff34511ceee4a7d9cfc9d19c9b23700000000ec06a04001ca37a1ec06a04001ca37a1000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000bfffffffe0000000dfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
20ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f0043007900700069007200680067002000740063002800200029003900310036003900470020006d0061007300650061006d0020006e006e0049002e00630000fffe00020105f86ff34511ceee4a7d9cfc9d19c9b23700000001fb8f0821101b01640008ed8413c72e2b000000300000025f000000090000010000000050000001010000005800000102000000600000010300000068000001040000007000000105000001b400000106000001bc00000107000001c400000000000001cc000000030001000000000003000016a200000003000001a700000003000000440000004b000001390000fffe000101050be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c000000020000ffff0000000300c0c0c000000003008000000000000900000000000000010001030000000c0074735f00706b636f73706f720001060000000a00636162006c6f636b0700726f0a000001660000006365726f726f6c6f000101000000090078655f00746e65740105007800060000617600000065756c00000102000000097478655f79746e6500010400000005006e6f66000100007400090000765f00006973726500006e6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000016a2000001a700000044e3520300ce8f910b00e39d11b84b00aa00000151c0019000040001d4766c654800ffff01000064000100000000c0c0c0008000000080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000c0000004c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Aw_callcenter.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point

HA$PBExportHeader$u_modificar_atributos.sru
forward
global type u_modificar_atributos from userobject
end type
type ddlb_cambio_operatividad from dropdownlistbox within u_modificar_atributos
end type
type rb_maniobra from radiobutton within u_modificar_atributos
end type
type rb_evento from radiobutton within u_modificar_atributos
end type
type st_tipo_reporte from statictext within u_modificar_atributos
end type
type dw_atributos from datawindow within u_modificar_atributos
end type
type cambio_operatividad_t from statictext within u_modificar_atributos
end type
end forward

global type u_modificar_atributos from userobject
integer width = 2811
integer height = 1856
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ddlb_cambio_operatividad ddlb_cambio_operatividad
rb_maniobra rb_maniobra
rb_evento rb_evento
st_tipo_reporte st_tipo_reporte
dw_atributos dw_atributos
cambio_operatividad_t cambio_operatividad_t
end type
global u_modificar_atributos u_modificar_atributos

type variables

int ii_chequear_consignacion = 0
int ii_chequear_activo_causante = 0
int ii_chequear_f_instruccion = 0
long il_virgin_disponibilidad
int ii_virgin_estado_operatividad

long il_tipo_reporte = 0

boolean ib_despeje_aterrizaje = false

//AHM (16/03/2010)
int		ii_fecInstManiobCierre	//Indicador de si la fecha de instrucci$$HEX1$$f300$$ENDHEX$$n para maniobras de cierre es obligatorio
string	is_tipoModificacion		//Indicador del tipo de modificaci$$HEX1$$f300$$ENDHEX$$n
end variables

forward prototypes
public subroutine uf_set_atributos (str_atributos_str_ext pstr_atributos)
public subroutine uf_set_estructura_causa (long pl_cod_causa)
public function datawindow uf_get_atributos ()
public function boolean uf_verify_consignacion ()
public subroutine uf_proteger_consignacion (boolean pb_proteger)
public subroutine uf_set_tipo_reporte (integer pl_tipo_reporte)
public function integer uf_get_maniobra_updated (ref datastore pds_maniobra)
public function integer uf_get_indisponibilidad_cierre_updated (ref datawindow pdw_indisponibilidad, long pl_row)
public function integer uf_kk_debug_maniobras (datawindow pdw_atributos, datastore pds_maniobra)
public function integer uf_fill_activo (long pl_activo)
public function integer uf_kk_debug_indisponibilidades (datawindow pdw_atributos, datawindow pdw_indisponibilidad)
public function integer uf_kk_debug_indisponibilidades_cierre (datawindow pdw_atributos, datawindow pdw_indisponibilidad)
public function integer uf_get_cambio_disponibilidad (ref datawindow pdw_indisponibilidad, long pl_row)
public function integer uf_fill_activo_causante (long pl_cm_activo_causante)
public function boolean uf_verify_fechas ()
public function any uf_get_indisponibilidad_apertura_updated (ref datawindow pdw_indisponibilidad, long pl_row)
public function long uf_verify_textos ()
public function boolean uf_verificacion_campos_correctos ()
public function boolean uf_verify_activo_causante ()
public subroutine uf_update_sgd_disponibilidad ()
public function boolean uf_verify_disponibilidad_activo ()
public function boolean uf_verify_causa ()
public subroutine uf_set_despeje_aterrizaje (long pl_activo)
public subroutine uf_asignartipomodificacion (string ps_tipo)
end prototypes

public subroutine uf_set_atributos (str_atributos_str_ext pstr_atributos);
datetime ldt_fecha_nula

setnull(ldt_fecha_nula)

if not isnull(pstr_atributos.pl_tipo_movimiento) then 
	dw_atributos.object.tipo_movimiento[1] = pstr_atributos.pl_tipo_movimiento				
end if  



if not isnull(pstr_atributos.pl_tipo_reporte) then 
	il_tipo_reporte = pstr_atributos.pl_tipo_reporte
	if il_tipo_reporte > 0 and il_tipo_reporte < 6 then 
		dw_atributos.object.tipo_reporte[1] = pstr_atributos.pl_tipo_reporte	
		
		//AHM (06/04/2010) No se muestran los tiempos de despeje y tierra
		IF NOT isnull(pstr_atributos.pl_activo) THEN// AND is_tipoModificacion = 'INDISPONIBILIDAD' THEN
			dw_atributos.object.activo[1] = pstr_atributos.pl_activo 	
			uf_fill_activo(pstr_atributos.pl_activo)
		END IF  
		
		uf_set_tipo_reporte(il_tipo_reporte)
	end if
end if  


if not isnull(pstr_atributos.pl_codigo_evento) then 
	dw_atributos.object.codigo_evento[1] = string(pstr_atributos.pl_codigo_evento)
end if  

CHOOSE CASE gi_pais 
	CASE 6
		dw_atributos.object.agente[1] = 'EPSA'	
	CASE 7 
		dw_atributos.object.agente[1] = 'ELECTROCARIBE'	
END CHOOSE
 
if not isnull(pstr_atributos.pl_activo) then 
	dw_atributos.object.activo[1] = pstr_atributos.pl_activo 	
	uf_fill_activo(pstr_atributos.pl_activo)
end if  

//if not isnull(pstr_atributos.pl_subestacion ) then 
//	dw_atributos.object.subestacion[1] = pstr_atributos.pl_subestacion 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pl_tipo_activo) then 
//	dw_atributos.object.tipo_activo[1] = pstr_atributos.pl_tipo_activo 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  

//AHM (08/04/2010) Duplicidad de los registros en los informes
if not isnull(pstr_atributos.pdt_tiempo_ocurrencia) AND string(pstr_atributos.pdt_tiempo_ocurrencia) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_ocurrencia[1] = pstr_atributos.pdt_tiempo_ocurrencia 	 
else
	dw_atributos.object.tiempo_ocurrencia[1] = ldt_fecha_nula
end if
 
if not isnull(pstr_atributos.pdt_tiempo_reporte) AND string(pstr_atributos.pdt_tiempo_reporte) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_reporte[1] = pstr_atributos.pdt_tiempo_reporte 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.tiempo_reporte[1] = ldt_fecha_nula
end if 

if not isnull(pstr_atributos.pdt_tiempo_instruccion) AND string(pstr_atributos.pdt_tiempo_instruccion) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_instruccion[1] = pstr_atributos.pdt_tiempo_instruccion 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
else
	dw_atributos.object.tiempo_instruccion[1] = ldt_fecha_nula
end if  
//if not isnull(pstr_atributos.pl_disponibilidad_act) then 
//	dw_atributos.object.disponibilidad_act[1] = pstr_atributos.pl_disponibilidad_act 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//end if  
if not isnull(pstr_atributos.pl_causa_detallada) then 
	uf_set_estructura_causa(pstr_atributos.pl_causa_detallada)
end if  
//AHM (08/04/2010) Duplicidad de los registros en los informes
if not isnull(pstr_atributos.pdt_fecha_causa) AND string(pstr_atributos.pdt_fecha_causa) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.fecha_causa [1] = pstr_atributos.pdt_fecha_causa 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.fecha_causa[1] = ldt_fecha_nula
end if  
if not isnull(pstr_atributos.pl_consignacion_nac_check) then 
	dw_atributos.object.consignacion_nac_check[1] = pstr_atributos.pl_consignacion_nac_check 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
end if  
if not isnull(pstr_atributos.ps_consignacion_nacional) then 
	dw_atributos.object.consignacion_nacional[1] = pstr_atributos.ps_consignacion_nacional 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
end if  
if not isnull(pstr_atributos.pl_psm) then 
	dw_atributos.object.psm[1] = pstr_atributos.pl_psm 			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
end if  
if not isnull(pstr_atributos.pl_demora_justificada) then 
	dw_atributos.object.demora_justificada[1] = pstr_atributos.pl_demora_justificada 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
end if  
if not isnull(pstr_atributos.ps_descripcion_demora) and pstr_atributos.ps_descripcion_demora <> '' then 
	dw_atributos.object.descripcion_demora[1] = pstr_atributos.ps_descripcion_demora 	
	dw_atributos.object.demora_justificada[1] = 1 		
end if  
if not isnull(pstr_atributos.pl_activo_causante) then 
	dw_atributos.object.cm_activo_causante[1] = (pstr_atributos.pl_activo_causante)
	uf_fill_activo_causante(dw_atributos.object.cm_activo_causante[1])
end if  
if not isnull(pstr_atributos.ps_observaciones) then 
	dw_atributos.object.observaciones[1] = pstr_atributos.ps_observaciones 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
end if  
if not isnull(pstr_atributos.ps_observaciones_cabecera) then 
	dw_atributos.object.observaciones_cabecera[1] = pstr_atributos.ps_observaciones_cabecera 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
end if  
//AHM (08/04/2010) Duplicidad de los registros en los informes
if not isnull(pstr_atributos.pdt_fecha_bypass) AND string(pstr_atributos.pdt_fecha_bypass) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.fecha_bypass [1] = pstr_atributos.pdt_fecha_bypass 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.fecha_bypass[1] = ldt_fecha_nula
end if	  

//AHM (08/04/2010) Duplicidad de los registros en los informes
//JME 01/02/2010
if not isnull(pstr_atributos.pdt_tiempo_instruccion_despeje) AND string(pstr_atributos.pdt_tiempo_instruccion_despeje) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_instruccion_despeje [1] = pstr_atributos.pdt_tiempo_instruccion_despeje 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.tiempo_instruccion_despeje[1] = ldt_fecha_nula
end if	  

if not isnull(pstr_atributos.pdt_tiempo_ocurrencia_despeje) AND string(pstr_atributos.pdt_tiempo_ocurrencia_despeje) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_ocurrencia_despeje [1] = pstr_atributos.pdt_tiempo_ocurrencia_despeje 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.tiempo_ocurrencia_despeje[1] = ldt_fecha_nula
end if	  

if not isnull(pstr_atributos.pdt_tiempo_reporte_despeje) AND string(pstr_atributos.pdt_tiempo_reporte_despeje) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_reporte_despeje [1] = pstr_atributos.pdt_tiempo_reporte_despeje 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.tiempo_reporte_despeje[1] = ldt_fecha_nula
end if	  

if not isnull(pstr_atributos.pdt_tiempo_instruccion_tierra) AND string(pstr_atributos.pdt_tiempo_instruccion_tierra) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_instruccion_tierra [1] = pstr_atributos.pdt_tiempo_instruccion_tierra 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.tiempo_instruccion_tierra[1] = ldt_fecha_nula
end if	  

if not isnull(pstr_atributos.pdt_tiempo_ocurrencia_tierra) AND string(pstr_atributos.pdt_tiempo_ocurrencia_tierra) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_ocurrencia_tierra [1] = pstr_atributos.pdt_tiempo_ocurrencia_tierra 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.tiempo_ocurrencia_tierra[1] = ldt_fecha_nula
end if	  

if not isnull(pstr_atributos.pdt_tiempo_reporte_tierra) AND string(pstr_atributos.pdt_tiempo_reporte_tierra) <> '01/01/1900 00:00:00' then 
	dw_atributos.object.tiempo_reporte_tierra [1] = pstr_atributos.pdt_tiempo_reporte_tierra 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
else
	dw_atributos.object.tiempo_reporte_tierra[1] = ldt_fecha_nula
end if	  

//JME 23/07/09
// Si est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Demora justificada' se habilita 
// el campo 'Descripci$$HEX1$$f300$$ENDHEX$$n demora justificada maniobra'
if dw_atributos.GetItemNumber(1,'demora_justificada') = 1 then
	dw_atributos.Modify("descripcion_demora.protect=0")
	dw_atributos.Modify("descripcion_demora.background.Color="+gs_blanco)	
else
	dw_atributos.object.descripcion_demora[1] = ''
	dw_atributos.Modify("descripcion_demora.protect=1")
	dw_atributos.Modify("descripcion_demora.background.Color="+gs_gris)	
end if


end subroutine

public subroutine uf_set_estructura_causa (long pl_cod_causa);
long ll_gpo_causa, ll_tipo, ll_subtipo, ll_activo, ll_count
long ll_tipo_reporte, li_visualizar_f_instruccion
string ls_causa_categoria, ls_causa 
datetime ldt_auxiliar

SELECT count(*)
  INTO :ll_count
  FROM GI_CAUSA
 WHERE COD_CAUSA = :pl_cod_causa;
 
 if ll_count > 0 then 
	
	SELECT GPO_CAUSA, TIPO, SUBTIPO, ACTIVO
	  INTO :ll_gpo_causa, :ll_tipo, :ll_subtipo, :ll_activo
	  FROM GI_CAUSA
	 WHERE COD_CAUSA = :pl_cod_causa;
	
	SELECT TRIM(DESCRIPCION)
	  INTO :ls_causa_categoria
	  FROM GI_SUBTIPO_CAUSA
	 WHERE GPO_CAUSA = :ll_gpo_causa
		AND SUBTIPO =:ll_subtipo
		AND TIPO = :ll_tipo
		AND ACTIVO = :ll_activo;
		
	SELECT TRIM(DESCRIPCION), NVL(IND_CHEQUEAR_CONSIGNACION, 0), 
			 NVL(IND_CHEQUEAR_CAUSANTE, 0), NVL(IND_CHEQUEAR_F_INSTRUCCION, 0), NVL(IND_FEC_INSTR_MANIOB_CIERRE, 0)
	  INTO :ls_causa, :ii_chequear_consignacion, 
	  	    :ii_chequear_activo_causante, :ii_chequear_f_instruccion, :ii_fecInstManiobCierre
	  FROM GI_SUBTIPOS
	 WHERE SUBTIPO =:ll_subtipo
		AND TIPO = :ll_tipo
		AND ACTIVO = :ll_activo;
	
	dw_atributos.object.causa[1] = ls_causa
	dw_atributos.object.causa_categoria[1] = ls_causa_categoria
	dw_atributos.object.causa_detallada[1] = pl_cod_causa 

else	
	setnull(pl_cod_causa) 
	ls_causa_categoria = ''
	ls_causa = ''
	ii_chequear_activo_causante = 0
	ii_chequear_consignacion = 0
end if

dw_atributos.object.causa[1] = ls_causa
dw_atributos.object.causa_categoria[1] = ls_causa_categoria
dw_atributos.object.causa_detallada[1] = pl_cod_causa 

dw_atributos.object.gb_activo_causante.visible = ii_chequear_activo_causante
//dw_atributos.object.activo_causante_t.visible = ii_chequear_activo_causante
dw_atributos.object.activo_causante.visible = ii_chequear_activo_causante
	
dw_atributos.object.gb_consignacion_nacional.visible = ii_chequear_consignacion
dw_atributos.object.consignacion_nacional_t.visible = ii_chequear_consignacion
dw_atributos.object.consignacion_nacional.visible = ii_chequear_consignacion
dw_atributos.object.psm_t.visible = ii_chequear_consignacion
dw_atributos.object.psm.visible = ii_chequear_consignacion

dw_atributos.object.consignacion_nac_check[1] = ii_chequear_consignacion

if ii_chequear_activo_causante = 1 then 
	dw_atributos.object.ci_activo_causante[1] = 5555	
else
	dw_atributos.object.ci_activo_causante[1] = 0
	dw_atributos.object.cm_activo_causante[1] = 0
	dw_atributos.object.activo_causante[1] = ''
end if

//AHM(04/12/2009) Problemas con fecha no se hace visible cuando se seleccionan determinadas causas
//if ll_tipo_reporte <>  1 and  ll_tipo_reporte <> 4 then 
//	ii_chequear_f_instruccion = 0 
//end if


//AHM (15/03/2010)
dw_atributos.object.tiempo_instruccion.visible = ii_chequear_f_instruccion = 1 OR (dw_atributos.object.tipo_movimiento[1]=0 AND ii_fecInstManiobCierre=1 AND (il_tipo_reporte = 2 OR rb_maniobra.checked = TRUE))
dw_atributos.object.tiempo_instruccion_t.visible = ii_chequear_f_instruccion = 1 OR (dw_atributos.object.tipo_movimiento[1]=0 AND ii_fecInstManiobCierre=1 AND (il_tipo_reporte = 2 OR rb_maniobra.checked = TRUE))

if ii_chequear_f_instruccion = 0  AND NOT(dw_atributos.object.tipo_movimiento[1]=0 AND ii_fecInstManiobCierre=1 AND (il_tipo_reporte = 2 OR rb_maniobra.checked = TRUE)) then 
	setnull(ldt_auxiliar)
	dw_atributos.object.tiempo_instruccion[1] = ldt_auxiliar
end if
	

// JME 15/12/2009 Si se elige la causa ESTADO NO OPERATIVO o FINALIZA ESTADO NO OPERATIVO debemos 
// el campo ESTADO_OPERATIVO de SGD_DISPONIBILIDAD. Hasta ahora s$$HEX1$$f300$$ENDHEX$$lo se est$$HEX2$$e1002000$$ENDHEX$$haciendo cuando se 
// efect$$HEX1$$fa00$$ENDHEX$$a un CAMBIO DE ESTADO y ahora hay que ampliarlo a MANIOBRA o EVENTO. 

IF ls_causa = "ESTADO NO OPERATIVO" THEN  
	dw_atributos.object.estado_operatividad[1] = 0
ELSEIF ls_causa = "FINALIZA ESTADO NO OPERATIVO" THEN  
	dw_atributos.object.estado_operatividad[1] = 1
END IF

end subroutine

public function datawindow uf_get_atributos ();
return dw_atributos

////ll_row = istr_atributos.pl_row
//
//dw_atributos.AcceptText()
//
//if not isnull(dw_atributos.object.cod_causa[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.cod_causa[ll_row]) and &
//		dw_atributos.object.cod_causa[1] <> istr_atributos.pdw_indisponibilidad.object.cod_causa[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.cod_causa[ll_row] = dw_atributos.object.cod_causa[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//
//if not isnull(dw_atributos.object.fecha_causa[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.fecha_causa[ll_row]) and &	
//	 	dw_atributos.object.fecha_causa[1] <> istr_atributos.pdw_indisponibilidad.object.fecha_causa[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.fecha_causa[ll_row] = dw_atributos.object.fecha_causa[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//	
//if not isnull(dw_atributos.object.tipo_reporte[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.tipo_reporte[ll_row]) and &
//	 dw_atributos.object.tipo_reporte[1] <> istr_atributos.pdw_indisponibilidad.object.tipo_reporte[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.tipo_reporte[ll_row] = dw_atributos.object.tipo_reporte[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.tiempo_reporte[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.tiempo_reporte[ll_row]) and &
//	   dw_atributos.object.tiempo_reporte[1] <> istr_atributos.pdw_indisponibilidad.object.tiempo_reporte[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.tiempo_reporte[ll_row] = dw_atributos.object.tiempo_reporte[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.tiempo_instruccion[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.tiempo_instruccion[ll_row]) and &
//	 dw_atributos.object.tiempo_instruccion[1] <> istr_atributos.pdw_indisponibilidad.object.tiempo_instruccion[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.tiempo_instruccion[ll_row] = dw_atributos.object.tiempo_instruccion[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.consignacion_nacional[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.consignacion_nacional[ll_row]) and &
//	 dw_atributos.object.consignacion_nacional[1] <> istr_atributos.pdw_indisponibilidad.object.consignacion_nacional[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.consignacion_nacional[ll_row] = dw_atributos.object.consignacion_nacional[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.demora_justificada[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.demora_justificada[ll_row]) and &
//	 dw_atributos.object.demora_justificada[1] <> istr_atributos.pdw_indisponibilidad.object.demora_justificada[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.demora_justificada[ll_row] = dw_atributos.object.demora_justificada[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.descripcion_demora[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.descripcion_demora[ll_row]) and &
//	 dw_atributos.object.descripcion_demora[1] <> istr_atributos.pdw_indisponibilidad.object.descripcion_demora[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.descripcion_demora[ll_row] = dw_atributos.object.descripcion_demora[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.fecha_bypass[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.fecha_bypass[ll_row]) and &
//	 dw_atributos.object.fecha_bypass[1] <> istr_atributos.pdw_indisponibilidad.object.fecha_bypass[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.fecha_bypass[ll_row] = dw_atributos.object.fecha_bypass[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//
//if not isnull(dw_atributos.object.consignacion_nac_check[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.consignacion_nac_check[ll_row]) and &
//	 dw_atributos.object.consignacion_nac_check[1] <> istr_atributos.pdw_indisponibilidad.object.consignacion_nac_check[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.consignacion_nac_check[ll_row] = dw_atributos.object.consignacion_nac_check[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.psm[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.psm[ll_row]) and &
//	 dw_atributos.object.psm[1] <> istr_atributos.pdw_indisponibilidad.object.psm[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.psm[ll_row] = dw_atributos.object.psm[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.activo_causante[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.activo_causante[ll_row]) and &
//	 dw_atributos.object.activo_causante[1] <> istr_atributos.pdw_indisponibilidad.object.activo_causante[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.activo_causante[ll_row] = dw_atributos.object.activo_causante[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//if not isnull(dw_atributos.object.disponibilidad_act[1]) then
//	if not isnull(istr_atributos.pdw_indisponibilidad.object.disponibilidad_act[ll_row]) and &
//	 dw_atributos.object.disponibilidad_act[1] <> istr_atributos.pdw_indisponibilidad.object.disponibilidad_act[ll_row] then 
//		istr_atributos.pdw_indisponibilidad.object.disponibilidad_act[ll_row] = dw_atributos.object.disponibilidad_act[1]
//		istr_atributos.pb_ind_modificaciones = true
//	end if
//end if
//	
//
//
//
//
//
//if not isnull(dw_atributos.object.pl_codigo_evento[1]) then 
//	 pstr_atributos.pl_codigo_evento =dw_atributos.object.codigo_evento[1] 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.ps_agente ) then 
//	dw_atributos.object.agente[1] = pstr_atributos.ps_agente 			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pl_subestacion ) then 
//	dw_atributos.object.subestacion[1] = pstr_atributos.pl_subestacion 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pl_tipo_activo) then 
//	dw_atributos.object.tipo_activo[1] = pstr_atributos.pl_tipo_activo 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pl_activo) then 
//	dw_atributos.object.activo[1] = pstr_atributos.pl_activo 			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pl_tipo_movimiento) then 
//	dw_atributos.object.tipo_movimiento[1] = pstr_atributos.pl_tipo_movimiento 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pdt_tiempo_ocurrencia) then 
//	dw_atributos.object.tiempo_ocurrencia[1] = pstr_atributos.pdt_tiempo_ocurrencia 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pdt_tiempo_reporte) then 
//	dw_atributos.object.tiempo_reporte[1] = pstr_atributos.pdt_tiempo_reporte 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pdt_tiempo_instruccion) then 
//	dw_atributos.object.tiempo_instruccion[1] = pstr_atributos.pdt_tiempo_instruccion 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//end if  
//if not isnull(pstr_atributos.pl_disponibilidad_act) then 
//	dw_atributos.object.disponibilidad_act[1] = pstr_atributos.pl_disponibilidad_act 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//end if  
//if not isnull(pstr_atributos.pl_causa) then 
//	dw_atributos.object.causa[1] = pstr_atributos.pl_causa 	
//	uf_set_estructura_causa(pstr_atributos.pl_causa)
//end if  
//if not isnull(pstr_atributos.pdt_fecha_causa) then 
//	dw_atributos.object.fecha_causa [1] = pstr_atributos.pdt_fecha_causa 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pl_consignacion_nac_check) then 
//	dw_atributos.object.consignacion_nac_check[1] = pstr_atributos.pl_consignacion_nac_check 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.ps_consignacion_nacional) then 
//	dw_atributos.object.consignacion_nacional[1] = pstr_atributos.ps_consignacion_nacional 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//end if  
//if not isnull(pstr_atributos.pl_psm) then 
//	dw_atributos.object.psm[1] = pstr_atributos.pl_psm 			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//end if  
//if not isnull(pstr_atributos.pl_demora_justificada) then 
//	dw_atributos.object.demora_justificada[1] = pstr_atributos.pl_demora_justificada 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//end if  
//if not isnull(pstr_atributos.ps_descripcion_demora) then 
//	dw_atributos.object.descripcion_demora[1] = pstr_atributos.ps_descripcion_demora 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//end if  
//if not isnull(pstr_atributos.pl_activo_causante) then 
//	dw_atributos.object.activo_causante[1] = pstr_atributos.pl_activo_causante 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.ps_observaciones) then 
//	dw_atributos.object.observaciones[1] = pstr_atributos.ps_observaciones 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.ps_observaciones_cabecera) then 
//	dw_atributos.object.observaciones_cabecera[1] = pstr_atributos.ps_observaciones_cabecera 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if  
//if not isnull(pstr_atributos.pdt_fecha_bypass) then 
//	dw_atributos.object.fecha_bypass [1] = pstr_atributos.pdt_fecha_bypass 		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//end if	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
//
end function

public function boolean uf_verify_consignacion ();
// Para las causas (familia de causas ser$$HEX1$$ed00$$ENDHEX$$a m$$HEX1$$e100$$ENDHEX$$s correcto) MANTENIMIENTO, MANTENIMIENTO MAYOR y EXPANSI$$HEX1$$d300$$ENDHEX$$N 
// debe verificarse que los campos consignacion_nacional, psm y observaciones est$$HEX1$$e100$$ENDHEX$$n rellenos

boolean lb_return = true
string ls_texto_error, ls_consignacion


if ii_chequear_consignacion = 1 then 

	if isnull(dw_atributos.object.consignacion_nacional[1]) or dw_atributos.object.consignacion_nacional[1] = ''  then
		ls_texto_error = "La causa " + dw_atributos.object.causa[1] + " exige rellenar la consignaci$$HEX1$$f300$$ENDHEX$$n"
		lb_return = false
	else
		ls_consignacion = dw_atributos.object.consignacion_nacional[1]
		if len(ls_consignacion) <> 8 then 
			ls_texto_error = 'El campo consignaci$$HEX1$$f300$$ENDHEX$$n debe tener 8 caracteres'
			lb_return = false
		end if
	end if
	
	if isnull(dw_atributos.object.psm[1]) or  (dw_atributos.object.psm[1] = -1 )then
		ls_texto_error = "La causa " + dw_atributos.object.causa[1] + " exige rellenar el campo PSM."
		lb_return = false
	end if
	
	if isnull(dw_atributos.object.observaciones[1]) or dw_atributos.object.observaciones[1] = ''  then
		ls_texto_error = "La causa " + dw_atributos.object.causa[1] + " exige rellenar el campo observaciones"
		lb_return = false
	end if

end if

if lb_return = false then 
	messagebox("Actualizar atributos", ls_texto_error, Exclamation!, OK!)
end if
	
return lb_return



end function

public subroutine uf_proteger_consignacion (boolean pb_proteger);long ll_auxiliar

setnull(ll_auxiliar) 
if pb_proteger = true then 
	
	dw_atributos.object.consignacion_nac_check[1] = 0	
	dw_atributos.object.consignacion_nacional[1] = ''
	dw_atributos.object.psm[1] = -1
	
	dw_atributos.Modify("consignacion_nac_check.protect=1")
	dw_atributos.Modify("consignacion_nacional.protect=1")
	dw_atributos.Modify("psm.protect=1")
	
	dw_atributos.Modify("consignacion_nacional.background.Color="+gs_gris)	
	dw_atributos.Modify("psm.background.Color="+gs_gris)	
	
else
	
	dw_atributos.object.consignacion_nac_check[1] = 0	
	dw_atributos.object.psm[1] = 0
	
	dw_atributos.Modify("consignacion_nac_check.protect=0")
	dw_atributos.Modify("consignacion_nacional.protect=0")
	dw_atributos.Modify("psm.protect=0")
	
	dw_atributos.Modify("consignacion_nacional.background.Color="+gs_blanco)	
	dw_atributos.Modify("psm.background.Color="+gs_blanco)	
	
end if
	

end subroutine

public subroutine uf_set_tipo_reporte (integer pl_tipo_reporte);



//if pl_tipo_reporte = 1 or pl_tipo_reporte = 2 or pl_tipo_reporte = 3 then 
	dw_atributos.Enabled = true
	st_tipo_reporte.visible = True

	rb_maniobra.Visible=False
	rb_evento.Visible=False
	cambio_operatividad_t.visible = false
	ddlb_cambio_operatividad.visible = false
//	rb_cambio_disponibilidad.Visible=False
	
	dw_atributos.object.tipo_reporte[1] = pl_tipo_reporte
	
	CHOOSE CASE pl_tipo_reporte 
		CASE  1 
			st_tipo_reporte.Text = "EVENTO"
			dw_atributos.object.tiempo_instruccion.visible = false
			dw_atributos.object.tiempo_instruccion_t.visible = false
		CASE 2
			st_tipo_reporte.Text = "MANIOBRA"
			dw_atributos.object.tiempo_instruccion.visible = true
			dw_atributos.object.tiempo_instruccion_t.visible = true
		CASE 3
			//Cambio de disponibilidad
			st_tipo_reporte.Text = "CAMBIO DE OPERATIVIDAD"
			dw_atributos.object.tiempo_instruccion.visible = FALSE
			dw_atributos.object.tiempo_instruccion_t.visible = FALSE
			dw_atributos.object.tiempo_reporte.visible = FALSE
			dw_atributos.object.tiempo_reporte_t.visible = FALSE			
			dw_atributos.object.tiempo_reporte[1] = datetime(today(), now())
			dw_atributos.object.tipo_movimiento[1] = 3
			
		CASE 4
			//Cambio de tap
			st_tipo_reporte.Text = "CAMBIO DE OPERATIVIDAD"
			dw_atributos.object.tiempo_instruccion.visible = FALSE
			dw_atributos.object.tiempo_instruccion_t.visible = FALSE
						
			dw_atributos.object.tipo_movimiento[1] = 4
			dw_atributos.object.observaciones_cabecera[1] = "Movimiento de tap de posici$$HEX1$$f300$$ENDHEX$$n ... a posici$$HEX1$$f300$$ENDHEX$$n ..."

		CASE 5
			//Cambio de estado
			st_tipo_reporte.Text = "CAMBIO DE OPERATIVIDAD"
			dw_atributos.object.tiempo_instruccion.visible = FALSE
			dw_atributos.object.tiempo_instruccion_t.visible = FALSE
			dw_atributos.object.tiempo_reporte.visible = FALSE
			dw_atributos.object.tiempo_reporte_t.visible = FALSE
			dw_atributos.object.tiempo_reporte[1] = datetime(today(), now())
			
			dw_atributos.object.tipo_movimiento[1] = 5
					
								
	END CHOOSE

//JME 29/01/2010
if pl_tipo_reporte = 2 and dw_atributos.object.tipo_movimiento[1] = 1 then 
	uf_set_despeje_aterrizaje(dw_atributos.object.activo[1] )
end if
	
		
dw_atributos.object.gb_interruptor.visible = ib_despeje_aterrizaje

dw_atributos.object.gb_despeje.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_instruccion_despeje.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_instruccion_despeje_t.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_ocurrencia_despeje.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_ocurrencia_despeje_t.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_reporte_despeje.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_reporte_despeje_t.visible = ib_despeje_aterrizaje

dw_atributos.object.gb_tierra.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_instruccion_tierra.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_instruccion_tierra_t.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_ocurrencia_tierra.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_ocurrencia_tierra_t.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_reporte_tierra.visible = ib_despeje_aterrizaje
dw_atributos.object.tiempo_reporte_tierra_t.visible = ib_despeje_aterrizaje

if ib_despeje_aterrizaje then 
	dw_atributos.object.observaciones_cabecera_t.x = 1285
	dw_atributos.object.observaciones_cabecera.x = 1285
	dw_atributos.object.observaciones_cabecera.width = 1454
	
	dw_atributos.object.observaciones_t.x = 1285
	dw_atributos.object.observaciones.x = 1285
	dw_atributos.object.observaciones.width = 1454
	
	dw_atributos.object.demora_justificada.x = 1285
	dw_atributos.object.descripcion_demora.x = 1285
	dw_atributos.object.descripcion_demora.width = 1454
	
else
	dw_atributos.object.observaciones_cabecera_t.x = 114
	dw_atributos.object.observaciones_cabecera.x = 114
	dw_atributos.object.observaciones_cabecera.width = 2625
	
	dw_atributos.object.observaciones_t.x = 114
	dw_atributos.object.observaciones.x = 114
	dw_atributos.object.observaciones.width = 2625
	
	dw_atributos.object.demora_justificada.x = 114
	dw_atributos.object.descripcion_demora.x = 114
	dw_atributos.object.descripcion_demora.width = 2625	
	
end if
	
	
end subroutine

public function integer uf_get_maniobra_updated (ref datastore pds_maniobra);

//Devuelve -1 si ha habido alg$$HEX1$$fa00$$ENDHEX$$n error. La consignaci$$HEX1$$f300$$ENDHEX$$n tiene campos nulos 
//          0 no ha habido cambios
//				1 se ha modificado la maniobra.

int li_return = 0
boolean lb_status
long ll_setnull
string ls_setnull, ls_observaciones, ls_auxiliar



setnull(ll_setnull)
setnull(ls_setnull)

dw_atributos.AcceptText()

//lb_status = uf_verify_consignacion()
//
//if lb_status = false then 
//	ls_auxiliar = "La causa " + dw_atributos.object.causa[1] + " exige rellenar la consignaci$$HEX1$$f300$$ENDHEX$$n y las observaciones"
//	messagebox("", ls_auxiliar, Exclamation!, OK!)
//	li_return = -1
//else
	
	if not isnull(dw_atributos.object.tipo_reporte[1]) then 
		if isnull(pds_maniobra.object.tipo_evento[1]) or   &
			dw_atributos.object.tipo_reporte[1] <> pds_maniobra.object.tipo_evento[1] then 
			pds_maniobra.object.tipo_evento[1] = dw_atributos.object.tipo_reporte[1]
			li_return = 1
		end if
	end if
		
	
	if (not isnull(dw_atributos.object.tiempo_ocurrencia[1])) then 
		if isnull(pds_maniobra.object.fecha_maniobra[1]) or  &
			(dw_atributos.object.tiempo_ocurrencia[1]) <> (pds_maniobra.object.fecha_maniobra[1])  then 
			pds_maniobra.object.fecha_maniobra[1] = dw_atributos.object.tiempo_ocurrencia[1]
			li_return = 1	
		end if
	end if
	
	if not isnull(dw_atributos.object.tiempo_reporte[1]) then 
		if isnull(pds_maniobra.object.fecha_reporte_cnd[1]) or  &
			dw_atributos.object.tiempo_reporte[1] <> pds_maniobra.object.fecha_reporte_cnd[1] then 
			pds_maniobra.object.fecha_reporte_cnd[1] = dw_atributos.object.tiempo_reporte[1]
			li_return = 1
		end if
	end if
	
	if not isnull(dw_atributos.object.tiempo_instruccion[1]) then 
		if isnull(pds_maniobra.object.fecha_instruccion_cnd[1]) or &
			dw_atributos.object.tiempo_instruccion[1] <> pds_maniobra.object.fecha_instruccion_cnd[1] then 
			pds_maniobra.object.fecha_instruccion_cnd[1] = dw_atributos.object.tiempo_instruccion[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.disponibilidad_act[1]) then 
		if isnull(pds_maniobra.object.disponibilidad[1]) or &
			dw_atributos.object.disponibilidad_act[1] <> pds_maniobra.object.disponibilidad[1] then 
			pds_maniobra.object.disponibilidad[1] = dw_atributos.object.disponibilidad_act[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.causa_detallada[1]) then 
		if isnull(pds_maniobra.object.cod_causa[1]) or &
			dw_atributos.object.causa_detallada[1] <> pds_maniobra.object.cod_causa[1] then 
			pds_maniobra.object.cod_causa[1] = dw_atributos.object.causa_detallada[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.fecha_causa[1]) then 
		if isnull(pds_maniobra.object.fec_causa[1]) or &
			dw_atributos.object.fecha_causa[1] <> pds_maniobra.object.fec_causa[1] then 
			pds_maniobra.object.fec_causa[1] = dw_atributos.object.fecha_causa[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.consignacion_nac_check[1]) then 
		if isnull(pds_maniobra.object.consignacion[1]) or &
			dw_atributos.object.consignacion_nac_check[1] <> pds_maniobra.object.consignacion[1] then 
			pds_maniobra.object.consignacion[1] = dw_atributos.object.consignacion_nac_check[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.consignacion_nacional[1]) then 
		if isnull(pds_maniobra.object.numero[1]) or  &
			dw_atributos.object.consignacion_nacional[1] <> pds_maniobra.object.numero[1] then 
			pds_maniobra.object.numero[1] = dw_atributos.object.consignacion_nacional[1]
			li_return = 1	
		end if
	end if
		
	if not isnull(dw_atributos.object.psm[1]) then 
		if isnull(pds_maniobra.object.tipo_psm[1]) or  &
			dw_atributos.object.psm[1] <> pds_maniobra.object.tipo_psm[1] then 
			pds_maniobra.object.tipo_psm[1] = dw_atributos.object.psm[1]
			li_return = 1		
		end if
	end if
		
	if not isnull(dw_atributos.object.demora_justificada[1]) then 
		if isnull(pds_maniobra.object.demora[1]) or &
			dw_atributos.object.demora_justificada[1] <> pds_maniobra.object.demora[1] then 
			pds_maniobra.object.demora[1] = dw_atributos.object.demora_justificada[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.descripcion_demora[1]) then 
		if isnull(pds_maniobra.object.descripcion_demora[1]) or &
			dw_atributos.object.descripcion_demora[1] <> pds_maniobra.object.descripcion_demora[1] then 
			pds_maniobra.object.descripcion_demora[1] = dw_atributos.object.descripcion_demora[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.cm_activo_causante[1]) then 
		if isnull(pds_maniobra.object.cm_activo_causante[1]) or &
			dw_atributos.object.cm_activo_causante[1] <> pds_maniobra.object.cm_activo_causante[1] then 
			pds_maniobra.object.cm_activo_causante[1] = dw_atributos.object.cm_activo_causante[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.ci_activo_causante[1]) then 
		if isnull(pds_maniobra.object.ci_activo_causante[1]) or &
			dw_atributos.object.ci_activo_causante[1] <> pds_maniobra.object.ci_activo_causante[1] then 
			pds_maniobra.object.ci_activo_causante[1] = dw_atributos.object.ci_activo_causante[1]
			li_return = 1
		end if
	end if
		
		
//	if not isnull(dw_atributos.object.observaciones_cabecera[1]) then 
//		ls_observaciones = dw_atributos.object.observaciones_cabecera[1]
//	end if
	
	if not isnull(dw_atributos.object.observaciones[1]) then 
	// JME 10/11/2009 Debe eliminarse el espacio.
	// ls_observaciones = " " + dw_atributos.object.observaciones[1]
		ls_observaciones = dw_atributos.object.observaciones[1]
	end if
		
	
	if not isnull(ls_observaciones) then 
		if isnull(pds_maniobra.object.observaciones[1]) or &
			ls_observaciones <> pds_maniobra.object.observaciones[1] then 
			pds_maniobra.object.observaciones[1] = ls_observaciones
			li_return = 1
		end if
	end if
		
	
	if not isnull(dw_atributos.object.fecha_bypass[1]) then 
		if isnull(pds_maniobra.object.fecha_bypass[1]) or &
			dw_atributos.object.fecha_bypass[1] <> pds_maniobra.object.fecha_bypass[1] then 
			pds_maniobra.object.fecha_bypass[1] = dw_atributos.object.fecha_bypass[1]
			li_return = 1
		end if
	end if

//end if	


uf_update_sgd_disponibilidad()

return li_return







end function

public function integer uf_get_indisponibilidad_cierre_updated (ref datawindow pdw_indisponibilidad, long pl_row);

//Devuelve -1 si ha habido alg$$HEX1$$fa00$$ENDHEX$$n error. La consignaci$$HEX1$$f300$$ENDHEX$$n tiene campos nulos 
//          0 no ha habido cambios
//				1 se ha modificado la maniobra.

int li_return = 0, li_status
boolean lb_status
long ll_setnull
string ls_setnull, ls_observaciones, ls_auxiliar

setnull(ll_setnull)
setnull(ls_setnull)

dw_atributos.AcceptText()

//lb_status = uf_verify_consignacion()
//
////uf_kk_debug_indisponibilidades_cierre(dw_atributos, pdw_indisponibilidad)
//
//if lb_status = false then 
//	ls_auxiliar = "La causa " + dw_atributos.object.causa[1] + " exige rellenar la consignaci$$HEX1$$f300$$ENDHEX$$n y las observaciones"
//	messagebox("", ls_auxiliar, Exclamation!, OK!)
//	li_return = -1
//else
	
	if not isnull(dw_atributos.object.tipo_reporte[1]) then 
		if isnull(pdw_indisponibilidad.object.tipo_reporte_m_c[pl_row]) or   &
			dw_atributos.object.tipo_reporte[1] <> pdw_indisponibilidad.object.tipo_reporte_m_c[pl_row] then 
			pdw_indisponibilidad.object.tipo_reporte_m_c[pl_row] = dw_atributos.object.tipo_reporte[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.tiempo_reporte[1]) then 
		if isnull(pdw_indisponibilidad.object.tiempo_reporte_m_c[pl_row]) or   &
			dw_atributos.object.tiempo_reporte[1] <> pdw_indisponibilidad.object.tiempo_reporte_m_c[pl_row] then 
			pdw_indisponibilidad.object.tiempo_reporte_m_c[pl_row] = dw_atributos.object.tiempo_reporte[1]
			li_return = 1
		end if
	end if

	if not isnull(dw_atributos.object.tiempo_instruccion[1]) then 
		if isnull(pdw_indisponibilidad.object.tiempo_instruccion_m_c[pl_row]) or   &
			dw_atributos.object.tiempo_instruccion[1] <> pdw_indisponibilidad.object.tiempo_instruccion_m_c[pl_row] then 
			pdw_indisponibilidad.object.tiempo_instruccion_m_c[pl_row] = dw_atributos.object.tiempo_instruccion[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.disponibilidad_act[1]) then 
		if isnull(pdw_indisponibilidad.object.disponibilidad_act_m_c[pl_row]) or   &
			dw_atributos.object.disponibilidad_act[1] <> pdw_indisponibilidad.object.disponibilidad_act_m_c[pl_row] then 
			pdw_indisponibilidad.object.disponibilidad_act_m_c[pl_row] = dw_atributos.object.disponibilidad_act[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.causa_detallada[1]) then 
		if isnull(pdw_indisponibilidad.object.cod_causa_m_c[pl_row]) or   &
			dw_atributos.object.causa_detallada[1] <> pdw_indisponibilidad.object.cod_causa_m_c[pl_row] then 
			pdw_indisponibilidad.object.cod_causa_m_c[pl_row] = dw_atributos.object.causa_detallada[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.fecha_causa[1]) then 
		if isnull(pdw_indisponibilidad.object.fecha_causa_m_c[pl_row]) or   &
			dw_atributos.object.fecha_causa[1] <> pdw_indisponibilidad.object.fecha_causa_m_c[pl_row] then 
			pdw_indisponibilidad.object.fecha_causa_m_c[pl_row] = dw_atributos.object.fecha_causa[1]
			li_return = 1
		end if
	end if

	if not isnull(dw_atributos.object.consignacion_nac_check[1]) then 
		if isnull(pdw_indisponibilidad.object.consignacion_nac_check_m_c[1]) or &
			dw_atributos.object.consignacion_nac_check[1] <> pdw_indisponibilidad.object.consignacion_nac_check_m_c[1] then 
			pdw_indisponibilidad.object.consignacion_nac_check_m_c[1] = dw_atributos.object.consignacion_nac_check[1]
			li_return = 1
		end if
	end if		
		
	if not isnull(dw_atributos.object.consignacion_nacional[1]) then 
		if isnull(pdw_indisponibilidad.object.consignacion_nacional[pl_row]) or   &
			dw_atributos.object.consignacion_nacional[1] <> pdw_indisponibilidad.object.consignacion_nacional_m_c[pl_row] then 
			pdw_indisponibilidad.object.consignacion_nacional_m_c[pl_row] = dw_atributos.object.consignacion_nacional[1]
			li_return = 1
			end if
	end if
		
	if not isnull(dw_atributos.object.psm[1]) then 
		if isnull(pdw_indisponibilidad.object.psm[pl_row]) or   &
			dw_atributos.object.psm[1] <> pdw_indisponibilidad.object.psm_m_c[pl_row] then 
			pdw_indisponibilidad.object.psm_m_c[pl_row] = dw_atributos.object.psm[1]
			li_return = 1	
		end if
	end if
		
		
	if not isnull(dw_atributos.object.demora_justificada[1]) then 
		if isnull(pdw_indisponibilidad.object.demora_justificada[pl_row]) or   &
			dw_atributos.object.demora_justificada[1] <> pdw_indisponibilidad.object.demora_justificada_m_c[pl_row] then 
			pdw_indisponibilidad.object.demora_justificada_m_c[pl_row] = dw_atributos.object.demora_justificada[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.descripcion_demora[1]) then 
		if isnull(pdw_indisponibilidad.object.descripcion_demora_m_c[pl_row]) or   &
			dw_atributos.object.descripcion_demora[1] <> pdw_indisponibilidad.object.descripcion_demora_m_c[pl_row] then 
			pdw_indisponibilidad.object.descripcion_demora_m_c[pl_row] = dw_atributos.object.descripcion_demora[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.activo_causante[1]) then 
		if isnull(pdw_indisponibilidad.object.activo_causante_m_c[pl_row]) or   &
			dw_atributos.object.activo_causante[1] <> pdw_indisponibilidad.object.activo_causante_m_c[pl_row] then 
			pdw_indisponibilidad.object.activo_causante_m_c[pl_row] = dw_atributos.object.activo_causante[1]
			li_return = 1
		end if
	end if
	
	if not isnull(dw_atributos.object.cm_activo_causante[1]) then 
		if isnull(pdw_indisponibilidad.object.cm_activo_causante_m_c[pl_row]) or   &
			dw_atributos.object.cm_activo_causante[1] <> pdw_indisponibilidad.object.cm_activo_causante_m_c[pl_row] then 
			pdw_indisponibilidad.object.cm_activo_causante_m_c[pl_row] = dw_atributos.object.cm_activo_causante[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.ci_activo_causante[1]) then 
		if isnull(pdw_indisponibilidad.object.ci_activo_causante_m_c[pl_row]) or   &
			dw_atributos.object.ci_activo_causante[1] <> pdw_indisponibilidad.object.ci_activo_causante_m_c[pl_row] then 
			pdw_indisponibilidad.object.ci_activo_causante_m_c[pl_row] = dw_atributos.object.ci_activo_causante[1]
			li_return = 1
		end if
	end if
	
	
//	if not isnull(dw_atributos.object.observaciones_cabecera[1]) then 
//		ls_observaciones = dw_atributos.object.observaciones_cabecera[1]
//	end if
	
	if not isnull(dw_atributos.object.observaciones[1]) then 
	// JME 10/11/2009 Debe eliminarse el espacio.
	// ls_observaciones = " " + dw_atributos.object.observaciones[1]
		ls_observaciones = dw_atributos.object.observaciones[1]
	end if
		
			
	if not isnull(ls_observaciones) then 
		if isnull(pdw_indisponibilidad.object.observaciones_m_c[pl_row]) or   &
			ls_observaciones <> pdw_indisponibilidad.object.observaciones_m_c[pl_row] then 
			pdw_indisponibilidad.object.observaciones_m_c[pl_row] = ls_observaciones
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.fecha_bypass[1]) then 
		if isnull(pdw_indisponibilidad.object.fecha_bypass_m_c[pl_row]) or   &
			dw_atributos.object.fecha_bypass[1] <> pdw_indisponibilidad.object.fecha_bypass_m_c[pl_row] then 
			pdw_indisponibilidad.object.fecha_bypass_m_c[pl_row] = dw_atributos.object.fecha_bypass[1]
			li_return = 1
		end if
	end if

//end if

uf_update_sgd_disponibilidad()


return li_return







end function

public function integer uf_kk_debug_maniobras (datawindow pdw_atributos, datastore pds_maniobra);
int li_return 
string  ls_auxiliar
long   ll_auxiliar
datetime ldt_auxiliar



dw_atributos.AcceptText()


ldt_auxiliar = dw_atributos.object.tiempo_ocurrencia[1]
ldt_auxiliar = pds_maniobra.object.fecha_maniobra[1] 
	
ldt_auxiliar = pds_maniobra.object.fecha_reporte_cnd[1] 
ldt_auxiliar = dw_atributos.object.tiempo_reporte[1]
	
ldt_auxiliar		= pds_maniobra.object.fecha_instruccion_cnd[1] 
ldt_auxiliar		= dw_atributos.object.tiempo_instruccion[1]

ll_auxiliar		= pds_maniobra.object.disponibilidad[1] 
ll_auxiliar		= dw_atributos.object.disponibilidad_act[1]
		
ll_auxiliar		= pds_maniobra.object.cod_causa[1] 
ll_auxiliar		= dw_atributos.object.causa_detallada[1]
		
ldt_auxiliar		= pds_maniobra.object.fec_causa[1] 
ldt_auxiliar		= dw_atributos.object.fecha_causa[1]
		
ll_auxiliar		= pds_maniobra.object.consignacion[1] 
ll_auxiliar		= dw_atributos.object.consignacion_nac_check[1]
		
ls_auxiliar		= pds_maniobra.object.numero[1] 
ls_auxiliar		= dw_atributos.object.consignacion_nacional[1]
		
ll_auxiliar		= pds_maniobra.object.tipo_psm[1] 
ll_auxiliar		= dw_atributos.object.psm[1]
		
ll_auxiliar		= pds_maniobra.object.demora[1] 
ll_auxiliar		= dw_atributos.object.demora_justificada[1]
		
ls_auxiliar		= pds_maniobra.object.descripcion_demora[1] 
ls_auxiliar		= dw_atributos.object.descripcion_demora[1]
		
ls_auxiliar		= pds_maniobra.object.cm_activo_causante[1] 
ls_auxiliar		= dw_atributos.object.activo_causante[1]
		
ls_auxiliar		= dw_atributos.object.observaciones[1]
ls_auxiliar		= pds_maniobra.object.observaciones[1]

ldt_auxiliar = pds_maniobra.object.fecha_bypass[1] 
ldt_auxiliar = dw_atributos.object.fecha_bypass[1]

return li_return







end function

public function integer uf_fill_activo (long pl_activo);
string ls_nombre, ls_tipo_activo,ls_nombre_subestacion
long ll_disponibilidad, ll_subestacion
int  li_operatividad



SELECT NOMBRE, DISPONIBILIDAD_ACT, ESTADO_OPERATIVIDAD
  INTO :ls_nombre, :ll_disponibilidad, :ii_virgin_estado_operatividad
  FROM SGD_DISPONIBILIDAD
 WHERE NRO_INSTALACION = :pl_activo;
 
 SELECT TRIM(TIPO_ACTIVO)
  INTO :ls_tipo_activo
  FROM SGD_INSTALACION_AT 
 WHERE NRO_INSTALACION = :pl_activo;
 
SELECT NOM_SUBESTACION, COD_ESQ
  INTO :ls_nombre_subestacion, :ll_subestacion
  FROM VISTA_DISP_SUBESTACIONES
 WHERE CODIGO = :pl_activo; 
 
dw_atributos.object.tipo_activo[1] = ls_tipo_activo
dw_atributos.object.subestacion[1] = ll_subestacion
dw_atributos.object.nombre_subestacion_t.text = ls_nombre_subestacion
dw_atributos.object.nombre_activo_t.text = ls_nombre
dw_atributos.object.disponibilidad_act[1] = ll_disponibilidad
il_virgin_disponibilidad  = ll_disponibilidad
dw_atributos.object.estado_operatividad[1] = ii_virgin_estado_operatividad


ddlb_cambio_operatividad.Clear()
ddlb_cambio_operatividad.Reset()
ddlb_cambio_operatividad.InsertItem('Cambio de disponibilidad', 1)
ddlb_cambio_operatividad.InsertItem('Cambio de estado', 2)

//JME 20/10/09 Se elimina porque aqu$$HEX2$$ed002000$$ENDHEX$$accedemos a trav$$HEX1$$e900$$ENDHEX$$s de una maniobra o un evento. 
//El cambio de TAP tiene sentido s$$HEX1$$f300$$ENDHEX$$lo desde la ventana de cambio de operatividad. 
//Si es trafo podr$$HEX2$$e1002000$$ENDHEX$$elegirse el cambio de TAP.
//if ls_tipo_activo = '3' then 	
//	ddlb_cambio_operatividad.InsertItem('Cambio de TAP', 3)
//end if


//JME 20/10/09 Si es trafo o l$$HEX1$$ed00$$ENDHEX$$nea s$$HEX1$$f300$$ENDHEX$$lo puede haber cambio de operatividad.

if ls_tipo_activo = '3' or ls_tipo_activo = '2' then 
	if  ( (il_tipo_reporte < 3) or (il_tipo_reporte > 5 ) ) then 
		//Si el tipo de reporte es CAMBIO DE OPERATIVIDAD se deja como est$$HEX2$$e1002000$$ENDHEX$$pero si no es as$$HEX1$$ed00$$ENDHEX$$
		//debe seleccionarse el cambio de operatividad y el usuario seleccionar entre 
		//cambio de estado y cambio de maniobra
		
		dw_atributos.Enabled = False	

		st_tipo_reporte.visible = False
		rb_maniobra.visible = false
		rb_evento.visible = false
				
		cambio_operatividad_t.visible = True
		ddlb_cambio_operatividad.visible = True
		
	end if 
end if
	


return 1 
 
 
 
// 
//SELECT TRIM(TIPO_ACTIVO)
//  INTO :ls_tipo_activo
//  FROM SGD_INSTALACION_AT 
// WHERE NRO_INSTALACION = :pl_activo;
//
////Se determina la subestaci$$HEX1$$f300$$ENDHEX$$n.
////Los c$$HEX1$$f300$$ENDHEX$$digos de activos se obtienend de SGD_MAESTRO
////1 	BAHIA
////2	LINEA
////3	TRAFO
////4 	BARRA	
////5	Equipos de compensaci$$HEX1$$f300$$ENDHEX$$n
//
// CHOOSE CASE ls_tipo_activo
//	CASE '3' 
//					SELECT NVL(S.DESCRIPCION , ' '), T.INSTALACION_ORIGEN
//					  INTO :ls_nombre_subestacion, :ll_subestacion
//					  FROM SGD_SUBESTAC S, SGD_TRAFO_POT T
//					 WHERE S.CODIGO = T.INSTALACION_ORIGEN
//						AND T.CODIGO = :pl_activo; 
//	 
// 	CASE '2' 
//					SELECT NVL(S.DESCRIPCION , ' '), B.INSTALACION_ORIGEN
//					  INTO :ls_nombre_subestacion, :ll_subestacion
//					  FROM SGD_SUBESTAC S, BDI_BARRA B
//					 WHERE S.CODIGO = B.INSTALACION_ORIGEN
//						AND B.CODIGO = :pl_activo; 
//						
// 	CASE '1' 
//					SELECT NVL(S.DESCRIPCION , ' '), C.INSTALACION_ORIGEN
//					  INTO :ls_nombre_subestacion, :ll_subestacion
//					  FROM SGD_SUBESTAC S, BDIV10_BAHIA_CORTE B, BDI_CELDA_AT C
//					 WHERE S.CODIGO = C.INSTALACION_ORIGEN
//						AND C.CODIGO = SUBSTR(B.CELDA, 4, 10)
//					 	AND B.CODIGO = :pl_activo; 
//	CASE ELSE						
//		 ls_nombre_subestacion = STRING(pl_activo)
//END CHOOSE 
end function

public function integer uf_kk_debug_indisponibilidades (datawindow pdw_atributos, datawindow pdw_indisponibilidad);
int li_return 
string  ls_auxiliar
long   ll_auxiliar
datetime ldt_auxiliar



dw_atributos.AcceptText()


ldt_auxiliar = dw_atributos.object.tiempo_ocurrencia[1]
ldt_auxiliar = pdw_indisponibilidad.object.f_alta[1] 
	
ldt_auxiliar = pdw_indisponibilidad.object.tiempo_reporte[1] 
ldt_auxiliar = dw_atributos.object.tiempo_reporte[1]
	
ldt_auxiliar		= pdw_indisponibilidad.object.tiempo_instruccion[1] 
ldt_auxiliar		= dw_atributos.object.tiempo_instruccion[1]

ll_auxiliar		= pdw_indisponibilidad.object.disponibilidad_act[1] 
ll_auxiliar		= dw_atributos.object.disponibilidad_act[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.cod_causa[1] 
ll_auxiliar		= dw_atributos.object.causa_detallada[1]
		
ldt_auxiliar		= pdw_indisponibilidad.object.fecha_causa[1] 
ldt_auxiliar		= dw_atributos.object.fecha_causa[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.consignacion_nac_check[1] 
ll_auxiliar		= dw_atributos.object.consignacion_nac_check[1]
		
ls_auxiliar		= pdw_indisponibilidad.object.consignacion_nacional[1] 
ls_auxiliar		= dw_atributos.object.consignacion_nacional[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.psm[1] 
ll_auxiliar		= dw_atributos.object.psm[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.demora_justificada[1] 
ll_auxiliar		= dw_atributos.object.demora_justificada[1]
		
ls_auxiliar		= pdw_indisponibilidad.object.descripcion_demora[1] 
ls_auxiliar		= dw_atributos.object.descripcion_demora[1]
		
ls_auxiliar		= pdw_indisponibilidad.object.activo_causante[1] 
ls_auxiliar		= dw_atributos.object.activo_causante[1]
		
ls_auxiliar		= dw_atributos.object.observaciones[1]
ls_auxiliar		= pdw_indisponibilidad.object.observaciones[1]

ldt_auxiliar = pdw_indisponibilidad.object.fecha_bypass[1] 
ldt_auxiliar = dw_atributos.object.fecha_bypass[1]

return li_return







end function

public function integer uf_kk_debug_indisponibilidades_cierre (datawindow pdw_atributos, datawindow pdw_indisponibilidad);
int li_return 
string  ls_auxiliar
long   ll_auxiliar
datetime ldt_auxiliar



dw_atributos.AcceptText()


ldt_auxiliar = dw_atributos.object.tiempo_ocurrencia[1]
ldt_auxiliar = pdw_indisponibilidad.object.f_alta[1] 
	
ldt_auxiliar = pdw_indisponibilidad.object.tiempo_reporte_m_c[1] 
ldt_auxiliar = dw_atributos.object.tiempo_reporte[1]
	
ldt_auxiliar		= pdw_indisponibilidad.object.tiempo_instruccion_m_c[1] 
ldt_auxiliar		= dw_atributos.object.tiempo_instruccion[1]

ll_auxiliar		= pdw_indisponibilidad.object.disponibilidad_act_m_c[1] 
ll_auxiliar		= dw_atributos.object.disponibilidad_act[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.cod_causa_m_c[1] 
ll_auxiliar		= dw_atributos.object.causa_detallada[1]
		
ldt_auxiliar		= pdw_indisponibilidad.object.fecha_causa_m_c[1] 
ldt_auxiliar		= dw_atributos.object.fecha_causa[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.consignacion_nac_check_m_c[1] 
ll_auxiliar		= dw_atributos.object.consignacion_nac_check[1]
		
ls_auxiliar		= pdw_indisponibilidad.object.consignacion_nacional_m_c[1] 
ls_auxiliar		= dw_atributos.object.consignacion_nacional[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.psm_m_c[1] 
ll_auxiliar		= dw_atributos.object.psm[1]
		
ll_auxiliar		= pdw_indisponibilidad.object.demora_justificada_m_c[1] 
ll_auxiliar		= dw_atributos.object.demora_justificada[1]
		
ls_auxiliar		= pdw_indisponibilidad.object.descripcion_demora_m_c[1] 
ls_auxiliar		= dw_atributos.object.descripcion_demora[1]
		
ls_auxiliar		= pdw_indisponibilidad.object.activo_causante_m_c[1] 
ls_auxiliar		= dw_atributos.object.activo_causante[1]
		
ls_auxiliar		= dw_atributos.object.observaciones[1]
ls_auxiliar		= pdw_indisponibilidad.object.observaciones_m_c[1]

ldt_auxiliar = pdw_indisponibilidad.object.fecha_bypass_m_c[1] 
ldt_auxiliar = dw_atributos.object.fecha_bypass[1]

return li_return







end function

public function integer uf_get_cambio_disponibilidad (ref datawindow pdw_indisponibilidad, long pl_row);

//Devuelve -1 si ha habido alg$$HEX1$$fa00$$ENDHEX$$n error. La consignaci$$HEX1$$f300$$ENDHEX$$n tiene campos nulos 
//          0 no ha habido cambios
//				1 se ha modificado la maniobra.

int li_return = 0
boolean lb_status
long ll_setnull, ll_activo
string ls_setnull, ls_observaciones, ls_auxiliar

setnull(ll_setnull)
setnull(ls_setnull)

dw_atributos.AcceptText()

//uf_kk_debug_indisponibilidades(dw_atributos, pdw_indisponibilidad)


lb_status = uf_verify_consignacion()

if lb_status = false then 
	ls_auxiliar = "La causa " + dw_atributos.object.causa[1] + " exige rellenar la consignaci$$HEX1$$f300$$ENDHEX$$n y las observaciones"
	messagebox("", ls_auxiliar, Exclamation!, OK!)
	li_return = -1
else
	
	if not isnull(dw_atributos.object.tipo_reporte[1]) then 
		if isnull(pdw_indisponibilidad.object.tipo_reporte[1]) or   &
			dw_atributos.object.tipo_reporte[1] <> pdw_indisponibilidad.object.tipo_reporte[pl_row] then 
			pdw_indisponibilidad.object.tipo_reporte[pl_row] = dw_atributos.object.tipo_reporte[1]
			li_return = 1
		end if
	end if
		
		
	if not isnull(dw_atributos.object.tiempo_reporte[1]) then 
		if isnull(pdw_indisponibilidad.object.tiempo_reporte[1]) or   &
			dw_atributos.object.tiempo_reporte[1] <> pdw_indisponibilidad.object.tiempo_reporte[pl_row] then 
			pdw_indisponibilidad.object.tiempo_reporte[pl_row] = dw_atributos.object.tiempo_reporte[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.tiempo_instruccion[1]) then 
		if isnull(pdw_indisponibilidad.object.tiempo_instruccion[1]) or   &
			dw_atributos.object.tiempo_instruccion[1] <> pdw_indisponibilidad.object.tiempo_instruccion[pl_row] then 
			pdw_indisponibilidad.object.tiempo_instruccion[pl_row] = dw_atributos.object.tiempo_instruccion[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.disponibilidad_act[1]) then 
		if isnull(pdw_indisponibilidad.object.disponibilidad_act[1]) or   &
			dw_atributos.object.disponibilidad_act[1] <> pdw_indisponibilidad.object.disponibilidad_act[pl_row] then 
			pdw_indisponibilidad.object.disponibilidad_act[pl_row] = dw_atributos.object.disponibilidad_act[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.causa_detallada[1]) then 
		if isnull(pdw_indisponibilidad.object.cod_causa[1]) or   &
			dw_atributos.object.causa_detallada[1] <> pdw_indisponibilidad.object.cod_causa[pl_row] then 
			pdw_indisponibilidad.object.cod_causa[pl_row] = dw_atributos.object.causa_detallada[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.fecha_causa[1]) then 
		if isnull(pdw_indisponibilidad.object.fecha_causa[1]) or   &
			dw_atributos.object.fecha_causa[1] <> pdw_indisponibilidad.object.fecha_causa[pl_row] then 
			pdw_indisponibilidad.object.fecha_causa[pl_row] = dw_atributos.object.fecha_causa[1]
			li_return = 1
		end if
	end if
		
		if not isnull(dw_atributos.object.consignacion_nacional[1]) then 
	if isnull(pdw_indisponibilidad.object.consignacion_nacional[1]) or   &
			dw_atributos.object.consignacion_nacional[1] <> pdw_indisponibilidad.object.consignacion_nacional[pl_row] then 
			pdw_indisponibilidad.object.consignacion_nacional[pl_row] = dw_atributos.object.consignacion_nacional[1]
			li_return = 1
			end if
	end if
		
	if not isnull(dw_atributos.object.psm[1]) then 
		if isnull(pdw_indisponibilidad.object.psm[1]) or   &
			dw_atributos.object.psm[1] <> pdw_indisponibilidad.object.psm[pl_row] then 
			pdw_indisponibilidad.object.psm[pl_row] = dw_atributos.object.psm[1]
			li_return = 1	
		end if
	end if
		
		
	if not isnull(dw_atributos.object.demora_justificada[1]) then 
		if isnull(pdw_indisponibilidad.object.demora_justificada[1]) or   &
			dw_atributos.object.demora_justificada[1] <> pdw_indisponibilidad.object.demora_justificada[pl_row] then 
			pdw_indisponibilidad.object.demora_justificada[pl_row] = dw_atributos.object.demora_justificada[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.descripcion_demora[1]) then 
		if isnull(pdw_indisponibilidad.object.descripcion_demora[1]) or   &
			dw_atributos.object.descripcion_demora[1] <> pdw_indisponibilidad.object.descripcion_demora[pl_row] then 
			pdw_indisponibilidad.object.descripcion_demora[pl_row] = dw_atributos.object.descripcion_demora[1]
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.activo_causante[1]) then 
		if isnull(pdw_indisponibilidad.object.activo_causante[1]) or   &
			dw_atributos.object.activo_causante[1] <> pdw_indisponibilidad.object.activo_causante[pl_row] then 
			pdw_indisponibilidad.object.activo_causante[pl_row] = dw_atributos.object.activo_causante[1]
			li_return = 1
		end if
	end if
		
//	if not isnull(dw_atributos.object.observaciones_cabecera[1]) then 
//		ls_observaciones = dw_atributos.object.observaciones_cabecera[1]
//	end if
	
	if not isnull(dw_atributos.object.observaciones[1]) then 
	//	JME 10/11/2009
	//	ls_observaciones = " " + dw_atributos.object.observaciones[1]
		ls_observaciones = dw_atributos.object.observaciones[1]
	end if
		
			
	if not isnull(ls_observaciones) then 
		if isnull(pdw_indisponibilidad.object.observaciones[1]) or   &
			ls_observaciones <> pdw_indisponibilidad.object.observaciones[pl_row] then 
			pdw_indisponibilidad.object.observaciones[pl_row] = ls_observaciones
			li_return = 1
		end if
	end if
		
	if not isnull(dw_atributos.object.fecha_bypass[1]) then 
		if isnull(pdw_indisponibilidad.object.fecha_bypass[1]) or   &
			dw_atributos.object.fecha_bypass[1] <> pdw_indisponibilidad.object.fecha_bypass[pl_row] then 
			pdw_indisponibilidad.object.fecha_bypass[pl_row] = dw_atributos.object.fecha_bypass[1]
			li_return = 1
		end if
	end if

end if	

uf_update_sgd_disponibilidad()

return li_return







end function

public function integer uf_fill_activo_causante (long pl_cm_activo_causante);
string ls_nombre, ls_null
long ll_disponibilidad, ll_subestacion

SELECT nombre
  INTO :ls_nombre
  FROM SGD_DISPONIBILIDAD
 WHERE NRO_INSTALACION = :pl_cm_activo_causante;
 
if isnull(ls_nombre) then 
	dw_atributos.object.activo_causante[1] = ''
else
	dw_atributos.object.activo_causante[1] = ls_nombre
end if
 
return 1 

end function

public function boolean uf_verify_fechas ();// Para las causas (familia de causas ser$$HEX1$$ed00$$ENDHEX$$a m$$HEX1$$e100$$ENDHEX$$s correcto) MANTENIMIENTO, MANTENIMIENTO MAYOR y EXPANSI$$HEX1$$d300$$ENDHEX$$N 
// debe verificarse que los campos consignacion_nacional, psm y descripcion_demora est$$HEX1$$e100$$ENDHEX$$n rellenos

boolean lb_return = true
datetime ldt_fecha_nula
long ll_tipo_reporte

ldt_fecha_nula = datetime(date('2000-01-01'))

dw_atributos.AcceptText()

if isnull(dw_atributos.object.tiempo_reporte[1]) or &
	dw_atributos.object.tiempo_reporte[1] <   dw_atributos.object.tiempo_ocurrencia[1] then
	lb_return = false
	
	messagebox("", "El tiempo de reporte es err$$HEX1$$f300$$ENDHEX$$neo. Por favor, verif$$HEX1$$ed00$$ENDHEX$$quelo", Exclamation!, OK!)
end if

ll_tipo_reporte = dw_atributos.object.tipo_reporte[1]
//AHM (16/03/2010)
//Si es una maniobra de cierre y la familia de la causa tiene marcado el indicador de fecha de instrucci$$HEX1$$f300$$ENDHEX$$n en maniobras de cierre hay que comprobar la fecha de instrucci$$HEX1$$f300$$ENDHEX$$n 
if ii_chequear_f_instruccion = 1 OR &
(dw_atributos.object.tipo_movimiento[1]=0 AND ii_fecInstManiobCierre=1 AND (il_tipo_reporte = 2 OR rb_maniobra.checked = TRUE)) then 
		 
	if isnull(dw_atributos.object.tiempo_instruccion[1]) or &
		dw_atributos.object.tiempo_instruccion[1] >  dw_atributos.object.tiempo_ocurrencia[1] or &
		dw_atributos.object.tiempo_instruccion[1] < ldt_fecha_nula then
		lb_return = false
		messagebox("", "El tiempo de instrucci$$HEX1$$f300$$ENDHEX$$n es err$$HEX1$$f300$$ENDHEX$$neo. Por favor, verif$$HEX1$$ed00$$ENDHEX$$quelo", Exclamation!, OK!)
	
	end if

end if

return lb_return



end function

public function any uf_get_indisponibilidad_apertura_updated (ref datawindow pdw_indisponibilidad, long pl_row);

//Devuelve -1 si ha habido alg$$HEX1$$fa00$$ENDHEX$$n error. La consignaci$$HEX1$$f300$$ENDHEX$$n tiene campos nulos 
//          0 no ha habido cambios
//				1 se ha modificado la maniobra.

int li_return = 0
boolean lb_status
long ll_setnull, ll_activo
string ls_setnull, ls_observaciones, ls_auxiliar

setnull(ll_setnull)
setnull(ls_setnull)

dw_atributos.AcceptText()

//uf_kk_debug_indisponibilidades(dw_atributos, pdw_indisponibilidad)


if not isnull(dw_atributos.object.tipo_reporte[1]) then 
	if isnull(pdw_indisponibilidad.object.tipo_reporte[pl_row]) or   &
		dw_atributos.object.tipo_reporte[1] <> pdw_indisponibilidad.object.tipo_reporte[pl_row] then 
		pdw_indisponibilidad.object.tipo_reporte[pl_row] = dw_atributos.object.tipo_reporte[1]
		li_return = 1
	end if
end if
	
	
if not isnull(dw_atributos.object.tiempo_reporte[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_reporte[pl_row]) or   &
		dw_atributos.object.tiempo_reporte[1] <> pdw_indisponibilidad.object.tiempo_reporte[pl_row] then 
		pdw_indisponibilidad.object.tiempo_reporte[pl_row] = dw_atributos.object.tiempo_reporte[1]
		li_return = 1
	end if
end if
	
if not isnull(dw_atributos.object.tiempo_instruccion[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_instruccion[pl_row]) or   &
		dw_atributos.object.tiempo_instruccion[1] <> pdw_indisponibilidad.object.tiempo_instruccion[pl_row] then 
		pdw_indisponibilidad.object.tiempo_instruccion[pl_row] = dw_atributos.object.tiempo_instruccion[1]
		li_return = 1
	end if
end if
	
if not isnull(dw_atributos.object.disponibilidad_act[1]) then 
	if isnull(pdw_indisponibilidad.object.disponibilidad_act[pl_row]) or   &
		dw_atributos.object.disponibilidad_act[1] <> pdw_indisponibilidad.object.disponibilidad_act[pl_row] then 
		pdw_indisponibilidad.object.disponibilidad_act[pl_row] = dw_atributos.object.disponibilidad_act[1]
		li_return = 1
	end if
end if
	
if not isnull(dw_atributos.object.causa_detallada[1]) then 
	if isnull(pdw_indisponibilidad.object.cod_causa[pl_row]) or   &
		dw_atributos.object.causa_detallada[1] <> pdw_indisponibilidad.object.cod_causa[pl_row] then 
		pdw_indisponibilidad.object.cod_causa[pl_row] = dw_atributos.object.causa_detallada[1]
		li_return = 1
	end if
end if
	
if not isnull(dw_atributos.object.fecha_causa[1]) then 
	if isnull(pdw_indisponibilidad.object.fecha_causa[pl_row]) or   &
		dw_atributos.object.fecha_causa[1] <> pdw_indisponibilidad.object.fecha_causa[pl_row] then 
		pdw_indisponibilidad.object.fecha_causa[pl_row] = dw_atributos.object.fecha_causa[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.consignacion_nac_check[1]) then 
	if isnull(pdw_indisponibilidad.object.consignacion_nac_check[1]) or &
		dw_atributos.object.consignacion_nac_check[1] <> pdw_indisponibilidad.object.consignacion_nac_check[1] then 
		pdw_indisponibilidad.object.consignacion_nac_check[1] = dw_atributos.object.consignacion_nac_check[1]
		li_return = 1
	end if
end if
		
if not isnull(dw_atributos.object.consignacion_nacional[1]) then 
	if isnull(pdw_indisponibilidad.object.consignacion_nacional[pl_row]) or   &
		dw_atributos.object.consignacion_nacional[1] <> pdw_indisponibilidad.object.consignacion_nacional[pl_row] then 
		pdw_indisponibilidad.object.consignacion_nacional[pl_row] = dw_atributos.object.consignacion_nacional[1]
		li_return = 1
		end if
end if
	
if not isnull(dw_atributos.object.psm[1]) then 
	if isnull(pdw_indisponibilidad.object.psm[pl_row]) or   &
		dw_atributos.object.psm[1] <> pdw_indisponibilidad.object.psm[pl_row] then 
		pdw_indisponibilidad.object.psm[pl_row] = dw_atributos.object.psm[1]
		li_return = 1	
	end if
end if
	
	
if not isnull(dw_atributos.object.demora_justificada[1]) then 
	if isnull(pdw_indisponibilidad.object.demora_justificada[pl_row]) or   &
		dw_atributos.object.demora_justificada[1] <> pdw_indisponibilidad.object.demora_justificada[pl_row] then 
		pdw_indisponibilidad.object.demora_justificada[pl_row] = dw_atributos.object.demora_justificada[1]
		li_return = 1
	end if
end if
	
if not isnull(dw_atributos.object.descripcion_demora[1]) then 
	if isnull(pdw_indisponibilidad.object.descripcion_demora[pl_row]) or   &
		dw_atributos.object.descripcion_demora[1] <> pdw_indisponibilidad.object.descripcion_demora[pl_row] then 
		pdw_indisponibilidad.object.descripcion_demora[pl_row] = dw_atributos.object.descripcion_demora[1]
		li_return = 1
	end if
end if
	
if not isnull(dw_atributos.object.activo_causante[1]) then 
	if isnull(pdw_indisponibilidad.object.activo_causante[pl_row]) or   &
		dw_atributos.object.activo_causante[1] <> pdw_indisponibilidad.object.activo_causante[pl_row] then 
		pdw_indisponibilidad.object.activo_causante[pl_row] = dw_atributos.object.activo_causante[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.cm_activo_causante[1]) then 
	if isnull(pdw_indisponibilidad.object.cm_activo_causante[pl_row]) or   &
		dw_atributos.object.cm_activo_causante[1] <> pdw_indisponibilidad.object.cm_activo_causante[pl_row] then 
		pdw_indisponibilidad.object.cm_activo_causante[pl_row] = dw_atributos.object.cm_activo_causante[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.ci_activo_causante[1]) then 
	if isnull(pdw_indisponibilidad.object.ci_activo_causante[pl_row]) or   &
		dw_atributos.object.ci_activo_causante[1] <> pdw_indisponibilidad.object.cm_activo_causante[pl_row] then 
		pdw_indisponibilidad.object.ci_activo_causante[pl_row] = dw_atributos.object.ci_activo_causante[1]
		li_return = 1
	end if
end if


//if not isnull(dw_atributos.object.observaciones_cabecera[1]) then 
//	ls_observaciones = dw_atributos.object.observaciones_cabecera[1]
//end if

if not isnull(dw_atributos.object.observaciones[1]) then 
// JME 10/11/2009 Debe eliminarse el espacio.
// ls_observaciones = " " + dw_atributos.object.observaciones[1]
	ls_observaciones = dw_atributos.object.observaciones[1]
end if
	
		
if not isnull(ls_observaciones) then 
	if isnull(pdw_indisponibilidad.object.observaciones[pl_row]) or   &
		ls_observaciones <> pdw_indisponibilidad.object.observaciones[pl_row] then 
		pdw_indisponibilidad.object.observaciones[pl_row] = ls_observaciones
		li_return = 1
	end if
end if
	
if not isnull(dw_atributos.object.fecha_bypass[1]) then 
	if isnull(pdw_indisponibilidad.object.fecha_bypass[pl_row]) or   &
		dw_atributos.object.fecha_bypass[1] <> pdw_indisponibilidad.object.fecha_bypass[pl_row] then 
		pdw_indisponibilidad.object.fecha_bypass[pl_row] = dw_atributos.object.fecha_bypass[1]
		li_return = 1
	end if
end if

//AHM (06/04/2010) No aparecen los tiempos de despeje y de tierra
if not isnull(dw_atributos.object.tiempo_instruccion_despeje[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_instruccion_despeje[pl_row]) or   &
		dw_atributos.object.tiempo_instruccion_despeje[1] <> pdw_indisponibilidad.object.tiempo_instruccion_despeje[pl_row] then 
		pdw_indisponibilidad.object.tiempo_instruccion_despeje[pl_row] = dw_atributos.object.tiempo_instruccion_despeje[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.tiempo_ocurrencia_despeje[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_ocurrencia_despeje[pl_row]) or   &
		dw_atributos.object.tiempo_ocurrencia_despeje[1] <> pdw_indisponibilidad.object.tiempo_ocurrencia_despeje[pl_row] then 
		pdw_indisponibilidad.object.tiempo_ocurrencia_despeje[pl_row] = dw_atributos.object.tiempo_ocurrencia_despeje[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.tiempo_reporte_despeje[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_reporte_despeje[pl_row]) or   &
		dw_atributos.object.tiempo_reporte_despeje[1] <> pdw_indisponibilidad.object.tiempo_reporte_despeje[pl_row] then 
		pdw_indisponibilidad.object.tiempo_reporte_despeje[pl_row] = dw_atributos.object.tiempo_reporte_despeje[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.tiempo_instruccion_tierra[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_instruccion_tierra[pl_row]) or   &
		dw_atributos.object.tiempo_instruccion_tierra[1] <> pdw_indisponibilidad.object.tiempo_instruccion_tierra[pl_row] then 
		pdw_indisponibilidad.object.tiempo_instruccion_tierra[pl_row] = dw_atributos.object.tiempo_instruccion_tierra[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.tiempo_ocurrencia_tierra[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_ocurrencia_tierra[pl_row]) or   &
		dw_atributos.object.tiempo_ocurrencia_tierra[1] <> pdw_indisponibilidad.object.tiempo_ocurrencia_tierra[pl_row] then 
		pdw_indisponibilidad.object.tiempo_ocurrencia_tierra[pl_row] = dw_atributos.object.tiempo_ocurrencia_tierra[1]
		li_return = 1
	end if
end if

if not isnull(dw_atributos.object.tiempo_reporte_tierra[1]) then 
	if isnull(pdw_indisponibilidad.object.tiempo_reporte_tierra[pl_row]) or   &
		dw_atributos.object.tiempo_reporte_tierra[1] <> pdw_indisponibilidad.object.tiempo_reporte_tierra[pl_row] then 
		pdw_indisponibilidad.object.tiempo_reporte_tierra[pl_row] = dw_atributos.object.tiempo_reporte_tierra[1]
		li_return = 1
	end if
end if

uf_update_sgd_disponibilidad()

return li_return







end function

public function long uf_verify_textos ();
long ll_auxiliar, ll_return = 0 
string ls_texto

//AHM (04/12/2009) Campo observaciones obligatorio
if isnull(dw_atributos.object.observaciones[1]) OR (dw_atributos.object.observaciones[1] = "") then 
	messageBox("Aviso", "El campo observaciones es obligatorio")
	ll_return = -1
ELSE
	ls_texto = dw_atributos.object.observaciones[1]
	ll_auxiliar = gf_verify_texto_sin_comas(ls_texto)
	if ll_auxiliar > 0 then 
		ll_return = -1
	end if
end if


return ll_return
end function

public function boolean uf_verificacion_campos_correctos ();


boolean lb_return = true
long ll_status
long ll_disponibilidad
int  li_tipo_reporte

lb_return = uf_verify_causa()
if lb_return = false then 
	return false
end if

lb_return = uf_verify_disponibilidad_activo()
if lb_return = false then 
	return false
end if

ll_status = uf_verify_textos()
if ll_status <> 0 then 
	return false
end if

lb_return = uf_verify_fechas() 	
if lb_return = false then 
	return false
end if

lb_return = uf_verify_consignacion() 	
if lb_return = false then 
	return false
end if

lb_return = uf_verify_activo_causante() 	
if lb_return = false then 
	return false
end if



return lb_return 
end function

public function boolean uf_verify_activo_causante ();

boolean lb_return = true


if ii_chequear_activo_causante = 1 then 

	if isnull(dw_atributos.object.cm_activo_causante[1])   then
		messagebox("Actualizar atributos", 'Debe seleccionar el activo causante', Exclamation!, OK!)
		lb_return = false
	end if
	
	if isnull(dw_atributos.object.observaciones[1]) or dw_atributos.object.observaciones[1] = ''  then
		messagebox("Actualizar atributos", 'Debe rellenar el campo observaciones', Exclamation!, OK!)
		lb_return = false
	end if

end if
	
return lb_return



end function

public subroutine uf_update_sgd_disponibilidad ();
Long ll_disponibilidad, ll_activo, ll_count
int  li_operatividad, li_tipo_reporte
long ll_cod_causa, ll_activo_causante, ll_tipo_psm, ll_demora_justificada
string ls_observaciones, ls_descripcion_demora, ls_consignacion_nacional
datetime ldt_tiempo_instruccion, ldt_tiempo_ocurrencia, ldt_tiempo_reporte

int li_null
long ll_null
string ls_null

setnull(li_null)
setnull(ll_null)
setnull(ls_null)


ll_activo = dw_atributos.object.activo[1]

ll_disponibilidad = dw_atributos.object.disponibilidad_act[1]
li_operatividad = dw_atributos.object.estado_operatividad[1]

if (ll_disponibilidad <> il_virgin_disponibilidad) or (li_operatividad <> ii_virgin_estado_operatividad) then 
	
	SELECT COUNT(*)
	  INTO :ll_count
	  FROM SGD_DISPONIBILIDAD
	 WHERE NRO_INSTALACION = :ll_activo;	 
	
	if ll_count > 0 then 
		
		ll_cod_causa = dw_atributos.object.causa_detallada[1]
		ldt_tiempo_ocurrencia = dw_atributos.object.tiempo_ocurrencia[1]
		
		if not isnull(dw_atributos.object.consignacion_nacional[1]) then 
			ls_consignacion_nacional = dw_atributos.object.consignacion_nacional[1]
		else
			setnull(ls_consignacion_nacional)
		end if
		
		if not isnull(dw_atributos.object.demora_justificada[1]) then 
			ll_demora_justificada = dw_atributos.object.demora_justificada[1]
		else
			setnull(ll_demora_justificada)
		end if
		
		if not isnull(dw_atributos.object.descripcion_demora[1]) then 
			ls_descripcion_demora = dw_atributos.object.descripcion_demora[1]
		else
			setnull(ls_descripcion_demora)
		end if
		
		if not isnull(dw_atributos.object.psm[1]) then 
			ll_tipo_psm = dw_atributos.object.psm[1]
		else
			setnull(ll_tipo_psm)
		end if
		
		if not isnull(dw_atributos.object.observaciones[1]) then 
			ls_observaciones = dw_atributos.object.observaciones[1]
		else
			setnull(ls_observaciones)
		end if		
			
		if not isnull(dw_atributos.object.cm_activo_causante[1]) then 
			ll_activo_causante = dw_atributos.object.cm_activo_causante[1]
		else
			setnull(ll_activo_causante)
		end if

		li_tipo_reporte = dw_atributos.object.tipo_reporte[1]
		
		if not isnull(dw_atributos.object.cm_activo_causante[1]) then 
			ll_activo_causante = dw_atributos.object.cm_activo_causante[1]
		else
			setnull(ll_activo_causante)
		end if
		
		li_tipo_reporte = dw_atributos.object.tipo_reporte[1]
				
		//Se trata de un cambio de estado.
		ldt_tiempo_instruccion = dw_atributos.object.tiempo_instruccion[1]
		ldt_tiempo_reporte = dw_atributos.object.tiempo_reporte[1]
				
		UPDATE SGD_DISPONIBILIDAD
			SET DISPONIBILIDAD_ACT = :ll_disponibilidad,
				 COD_CAUSA = :ll_cod_causa,
				 TIEMPO_OCURRENCIA = :ldt_tiempo_ocurrencia,
				 CONSIGNACION_NACIONAL = :ls_consignacion_nacional,
				 DEMORA_JUSTIFICADA = :ll_demora_justificada,
				 DESCRIPCION_DEMORA = :ls_descripcion_demora,
				 TIPO_PSM = :ll_tipo_psm,
				 IND_MANIOBRA = 1, 
				 OBSERVACIONES = :ls_observaciones,
				 TIPO_MOVIMIENTO = :li_tipo_reporte,
				 ESTADO_OPERATIVIDAD = :li_operatividad,
				 ACTIVO_CAUSANTE = :ll_activo_causante,
				 TIEMPO_INSTRUCCION = :ldt_tiempo_instruccion, 
				 TIEMPO_REPORTE = :ldt_tiempo_reporte
		 WHERE NRO_INSTALACION = :ll_activo;			
	end if
end if
		


//
//Long ll_disponibilidad, ll_activo, ll_count
//int  li_operatividad, li_tipo_reporte
//long ll_cod_causa, ll_activo_causante
//string ls_observaciones
//datetime ldt_tiempo_instruccion
//
//ll_activo = dw_atributos.object.activo[1]
//
//ll_disponibilidad = dw_atributos.object.disponibilidad_act[1]
//li_operatividad = dw_atributos.object.estado_operatividad[1]
//
//if (ll_disponibilidad <> il_virgin_disponibilidad) or (li_operatividad <> ii_virgin_estado_operatividad) then 
//	
//	SELECT COUNT(*)
//	  INTO :ll_count
//	  FROM SGD_DISPONIBILIDAD
//	 WHERE NRO_INSTALACION = :ll_activo;	 
//	
//	if ll_count > 0 then 
//		
//		li_tipo_reporte = dw_atributos.object.tipo_reporte[1]
//		
//		if li_tipo_reporte <> 5 then 
//			
//			UPDATE SGD_DISPONIBILIDAD
//				SET DISPONIBILIDAD_ACT = :ll_disponibilidad,
//					 IND_MANIOBRA = 1
//			 WHERE NRO_INSTALACION = :ll_activo;
//			 
//		else
//			//Se trata de un cambio de estado.
//			ls_observaciones = dw_atributos.object.observaciones[1]
//			ldt_tiempo_instruccion = dw_atributos.object.tiempo_instruccion[1]
//			
//			ll_cod_causa = dw_atributos.object.causa_detallada[1]
//			
//			if not isnull(dw_atributos.object.cm_activo_causante[1]) then 
//				ll_activo_causante = dw_atributos.object.cm_activo_causante[1]
//			else
//				setnull(ll_activo_causante)
//			end if
//				
//			UPDATE SGD_DISPONIBILIDAD
//				SET DISPONIBILIDAD_ACT = :ll_disponibilidad,
//					 IND_MANIOBRA = 1, 
//					 TIPO_MOVIMIENTO = 5,
//					 ESTADO_OPERATIVIDAD = :li_operatividad,
//					 COD_CAUSA = :ll_cod_causa,
//					 OBSERVACIONES = :ls_observaciones,
//					 ACTIVO_CAUSANTE = :ll_activo_causante						 
//			 WHERE NRO_INSTALACION = :ll_activo;	
//				 
//		end if
//	end if
//end if
//		
end subroutine

public function boolean uf_verify_disponibilidad_activo ();
long ll_disponibilidad
int  li_tipo_reporte
boolean lb_return = true

//Verificar disponibilidad del activo
if isnull(dw_atributos.object.disponibilidad_act[1]) OR &
	dw_atributos.object.disponibilidad_act[1] > 100 OR &
	dw_atributos.object.disponibilidad_act[1] < 0  then 
	
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La Disponibilidad del Activo debe estar comprendida entre 0 y 100")	
	lb_return = false
end if

ll_disponibilidad = dw_atributos.object.disponibilidad_act[1]
li_tipo_reporte = dw_atributos.object.tipo_reporte[1]


if ( (li_tipo_reporte = 3) and (ll_disponibilidad =  il_virgin_disponibilidad) ) then 
	messagebox("Actualizar atributos", 'El valor de la disponibilidad no ha sido modificado', Exclamation!, OK!)
	lb_return = false
end if

return lb_return
end function

public function boolean uf_verify_causa ();
boolean 	lb_return = true
long		ll_causaGenerica				//C$$HEX1$$f300$$ENDHEX$$digo de la causa gen$$HEX1$$e900$$ENDHEX$$rica

//Verificar disponibilidad del activo
if isnull(dw_atributos.object.causa[1])  then 
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar una causa", Exclamation!, OK!)
	lb_return = false
end if

//AHM(08/04/2010) No permite grabar si la causa seleccionada es la gen$$HEX1$$e900$$ENDHEX$$rica
SELECT TO_NUMBER(valor)
INTO  :ll_causaGenerica
FROM   sgd_valor
WHERE  codif = 'C_GN';	

IF ll_causaGenerica = long(dw_atributos.object.causa_detallada[1]) THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar una causa que no sea la gen$$HEX1$$e900$$ENDHEX$$rica", Exclamation!, OK!)
	lb_return = FALSE
END IF

return lb_return
end function

public subroutine uf_set_despeje_aterrizaje (long pl_activo);
boolean lb_return = FALSE
long ll_rows

datawindowchild ldwch_auxiliar_causa, ldwch_auxiliar_psm, ldwch_auxiliar_activo


SELECT count(*)
  INTO :ll_rows
  FROM BDIV10_ACTIVOS 
 WHERE TIPO = 1
	AND NATURALEZA = 'STN'
	AND ONIS_VER NOT LIKE '%.%' 
	AND ONIS_STAT = 0
	and CODIGO = :pl_activo; 

if ll_rows <> 1 then 
	
	SELECT count(*)
	  INTO :ll_rows
	  FROM BDIV10_ACTIVOS a1, BDIV10_ACTIVOS a2
	 WHERE a1.TIPO = 1
		AND a2.TIPO = 3
		AND a1.GRUPO_ACTIVOS_V10 = a2.GRUPO_ACTIVOS_V10
		AND a1.ONIS_VER NOT LIKE '%.%' 
		AND a1.ONIS_STAT = 0
		and a1.CODIGO = :pl_activo; 
end if	

if ll_rows > 0 then 
	ib_despeje_aterrizaje = TRUE
	
	
//	
//
////parent.SetRedraw(False)
//dw_atributos.dataobject = 'd_atributos_str_ext_despeje_aterrizaje'
//dw_atributos.SetTransObject(SQLCA)
//dw_atributos.InsertRow(0)
//
//dw_atributos.GetChild('causa_detallada', ldwch_auxiliar_causa)
//ldwch_auxiliar_causa.SetTransObject(SQLCA)
//ldwch_auxiliar_causa.Retrieve()
//
//dw_atributos.GetChild('psm', ldwch_auxiliar_psm)
//ldwch_auxiliar_psm.SetTransObject(SQLCA)
//ldwch_auxiliar_psm.Retrieve()
//
//dw_atributos.GetChild('tipo_activo', ldwch_auxiliar_activo)
//ldwch_auxiliar_activo.SetTransObject(SQLCA)
//ldwch_auxiliar_activo.Retrieve()



//dw_atributos.SetRedraw(True)


end if

//AHM(05/04/2010) El tiempo de despeje y aterrizaje no se debe visualizar en las maniobras
IF is_tipoModificacion = 'MANIOBRA' THEN
	ib_despeje_aterrizaje = FALSE
END IF

end subroutine

public subroutine uf_asignartipomodificacion (string ps_tipo);/*********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n:	Asigna el tipo de modificaci$$HEX1$$f300$$ENDHEX$$n (maniobra o indisponibilidad)	*/
/* Argumentos :	ps_tipo -> tipo de modificaci$$HEX1$$f300$$ENDHEX$$n											*/
/* Devuelve   :	-																					*/
/* 				Autor						Fecha						Acci$$HEX1$$f300$$ENDHEX$$n						*/
/*					AHM					06/04/2010					Creaci$$HEX1$$f300$$ENDHEX$$n						*/
/*********************************************************************************/
is_tipoModificacion = ps_tipo
end subroutine

on u_modificar_atributos.create
this.ddlb_cambio_operatividad=create ddlb_cambio_operatividad
this.rb_maniobra=create rb_maniobra
this.rb_evento=create rb_evento
this.st_tipo_reporte=create st_tipo_reporte
this.dw_atributos=create dw_atributos
this.cambio_operatividad_t=create cambio_operatividad_t
this.Control[]={this.ddlb_cambio_operatividad,&
this.rb_maniobra,&
this.rb_evento,&
this.st_tipo_reporte,&
this.dw_atributos,&
this.cambio_operatividad_t}
end on

on u_modificar_atributos.destroy
destroy(this.ddlb_cambio_operatividad)
destroy(this.rb_maniobra)
destroy(this.rb_evento)
destroy(this.st_tipo_reporte)
destroy(this.dw_atributos)
destroy(this.cambio_operatividad_t)
end on

type ddlb_cambio_operatividad from dropdownlistbox within u_modificar_atributos
integer x = 1993
integer y = 16
integer width = 672
integer height = 324
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"Cambio de disponibilidad","Cambio de estado",""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
string ls_operatividad

rb_maniobra.checked = false
rb_evento.checked = false
//rb_cambio_disponibilidad.checked = false



ls_operatividad = UPPER(ddlb_cambio_operatividad.text)

CHOOSE CASE ls_operatividad
	CASE 'CAMBIO DE DISPONIBILIDAD'
		uf_set_tipo_reporte(3)
		
	CASE 'CAMBIO DE TAP'
		uf_set_tipo_reporte(4)
		
	CASE 'CAMBIO DE ESTADO'
		uf_set_tipo_reporte(5)
END CHOOSE
end event

type rb_maniobra from radiobutton within u_modificar_atributos
integer x = 1006
integer y = 32
integer width = 343
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Maniobra"
end type

event clicked;
boolean lb_boolean

rb_evento.checked = not(this.checked)
//rb_cambio_disponibilidad.checked = not(this.checked)

uf_set_tipo_reporte(2)
end event

type rb_evento from radiobutton within u_modificar_atributos
integer x = 617
integer y = 32
integer width = 343
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Evento"
end type

event clicked;
boolean lb_boolean

rb_maniobra.checked = not(this.checked)
//rb_cambio_disponibilidad.checked = not(this.checked)

uf_set_tipo_reporte(1)


end event

type st_tipo_reporte from statictext within u_modificar_atributos
boolean visible = false
integer x = 165
integer y = 24
integer width = 1335
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "MANIOBRA"
boolean focusrectangle = false
end type

type dw_atributos from datawindow within u_modificar_atributos
integer x = 37
integer width = 3049
integer height = 2132
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "d_atributos_str_ext_despeje_aterrizaje"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long ll_cod_causa, ll_auxiliar

dw_atributos.AcceptText()
dw_atributos.SetRedraw(False)

// Si est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Maniobra' habilito la Consignaci$$HEX1$$f300$$ENDHEX$$n Nacional
if dwo.name = "tipo_reporte"   then
	if dw_atributos.GetItemNumber(1,'tipo_reporte') = 1 then
		dw_atributos.Modify("consignacion_nac_check.protect=1")
		dw_atributos.Modify("consignacion_nacional.protect=1")
		
		dw_atributos.object.tipo_movimiento[1] = 0
		dw_atributos.Modify("tipo_movimiento.protect=1")
		
		dw_atributos.Modify("tiempo_instruccion.visible =0")
		
	else
		dw_atributos.Modify("consignacion_nac_check.protect=0")	
		if dw_atributos.GetItemNumber(1,'consignacion_nac_check') = 0 then				
			dw_atributos.Modify("consignacion_nacional.protect=1")
		else
			dw_atributos.Modify("consignacion_nacional.protect=0")
		end if
		
		dw_atributos.Modify("tipo_movimiento.protect=0")
		dw_atributos.Modify("tiempo_instruccion.visible =1")
		
	end if
end if


// Si est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Demora justificada maniobra' se habilita 
// el campo 'Descripci$$HEX1$$f300$$ENDHEX$$n demora justificada maniobra'
if dwo.name = "demora_justificada" then	
	if dw_atributos.GetItemNumber(1,'demora_justificada') = 0 then
		dw_atributos.Modify("descripcion_demora.protect=0")
		dw_atributos.Modify("descripcion_demora.background.Color="+gs_blanco)	
	else
		dw_atributos.object.descripcion_demora[1] = ''
		dw_atributos.Modify("descripcion_demora.protect=1")
		dw_atributos.Modify("descripcion_demora.background.Color="+gs_gris)	
	end if
end if

// Si se est$$HEX2$$e1002000$$ENDHEX$$chequeado 'Consignaci$$HEX1$$f300$$ENDHEX$$n Nacional' se habilitan 
// los campos 'N$$HEX1$$fa00$$ENDHEX$$mero',  pero solo cuando se ha
// chequeado previamente Maniobra

if dwo.name = "consignacion_nac_check" then	
	if dw_atributos.GetItemNumber(1,'consignacion_nac_check') = 1 then
		dw_atributos.object.consignacion_nacional[1] = ''
		dw_atributos.Modify("consignacion_nacional.protect=1")
		dw_atributos.Modify("consignacion_nacional.background.Color="+gs_gris)	
		dw_atributos.Modify("psm.protect=1")
		dw_atributos.Modify("psm.background.Color="+gs_gris)	
		setnull(ll_auxiliar)
		dw_atributos.object.psm[1] = -1
	else
		dw_atributos.Modify("consignacion_nacional.protect=0")
		dw_atributos.Modify("consignacion_nacional.background.Color="+gs_blanco)
		dw_atributos.Modify("psm.protect=0")
		dw_atributos.Modify("psm.background.Color="+gs_blanco)	
		dw_atributos.object.psm[1] = 0
	end if				
end if



dw_atributos.SetRedraw(True)
	
end event

event clicked;
long ll_cod_causa, ll_gpo_causa, ll_tipo, ll_subtipo, ll_tipo_reporte
long ll_nro_instalacion, ll_codigo_activo
string ls_nombre, ls_naturaleza_activo, ls_operatividad

gu_comunic2 = create u_generico_comunicaciones

if dwo.name = "causa_t" then
	//gu_comunic2 = create u_generico_comunicaciones
		
	If fg_verifica_parametro('CAUSAS') Then
			
			ll_tipo_reporte = dw_atributos.object.tipo_reporte[1]
						
			CHOOSE CASE ll_tipo_reporte
				CASE 1  
					gu_comunic2.is_comunic.strval9 = 'EVENTO'
				
				CASE 2, 4
					gu_comunic2.is_comunic.strval9  = 'MANIOBRA'
	
				CASE 3
					gu_comunic2.is_comunic.strval9  = 'CAMBIO DE DISPONIBILIDAD'
					
				CASE 5
					
					//Si el estado es OPERATIVO y hay un cambio de estado hay que pasarlo a no operativo					
					if ii_virgin_estado_operatividad = 0 then 
						dw_atributos.object.estado_operatividad[1] = 1
						gu_comunic2.is_comunic.strval9  = 'ESTADO OPERATIVO'
					else
						dw_atributos.object.estado_operatividad[1] = 0
						gu_comunic2.is_comunic.strval9  = 'ESTADO NO OPERATIVO'
					end if
					
			END CHOOSE			

			ll_codigo_activo = dw_atributos.object.activo[1]
			ls_naturaleza_activo = gf_naturaleza_activo(ll_codigo_activo)
			
			if ls_naturaleza_activo = "STN" then	
				gu_comunic2.is_comunic.strval9 += ' STN'
			end if
				
				
			OpenWithParm(w_2301_sel_causa_x_tipo, 1)
	Else
			Open(w_2301_sel_causa)
	End If
		
	if gu_comunic2.is_comunic.longval4 > 0 then	
		
		ll_cod_causa = gu_comunic2.is_comunic.longval4		
		uf_set_estructura_causa(ll_cod_causa)
		dw_atributos.object.fecha_causa[1] = datetime(today(), now())		 
		
		//istr_atributos.ps_nombre_causa_modificada = gu_comunic2.is_comunic.strval9 
	end if
	
end if


if dwo.name = "activo_causante_t" or dwo.name = "gb_activo_causante" then
	
	open(w_seleccion_activo)
	
	ll_nro_instalacion = Message.DoubleParm
	
	if not isnull(ll_nro_instalacion) and ll_nro_instalacion <> 0 then 
		dw_atributos.object.cm_activo_causante[1] = ll_nro_instalacion
		
		select nombre
		  into :ls_nombre
		  from sgd_disponibilidad
		 where nro_instalacion = :ll_nro_instalacion;
		 
		dw_atributos.object.activo_causante[1] = ls_nombre
	end if
end if



end event

event constructor;



datawindowchild ldwch_auxiliar_causa, ldwch_auxiliar_psm, ldwch_auxiliar_activo

this.SetRedraw(False)

dw_atributos.InsertRow(0)

dw_atributos.GetChild('causa_detallada', ldwch_auxiliar_causa)
ldwch_auxiliar_causa.SetTransObject(SQLCA)
ldwch_auxiliar_causa.Retrieve()

dw_atributos.GetChild('psm', ldwch_auxiliar_psm)
ldwch_auxiliar_psm.SetTransObject(SQLCA)
ldwch_auxiliar_psm.Retrieve()

dw_atributos.GetChild('tipo_activo', ldwch_auxiliar_activo)
ldwch_auxiliar_activo.SetTransObject(SQLCA)
ldwch_auxiliar_activo.Retrieve()



dw_atributos.SetRedraw(True)



end event

event doubleclicked;

string ls_auxiliar

if dwo.name = 'observaciones_cabecera' then
	
	ls_auxiliar = dw_atributos.object.observaciones_cabecera[1]
	dw_atributos.object.observaciones[1] = ls_auxiliar
		
end if
end event

type cambio_operatividad_t from statictext within u_modificar_atributos
integer x = 1454
integer y = 36
integer width = 521
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cambio de operatividad"
boolean focusrectangle = false
end type


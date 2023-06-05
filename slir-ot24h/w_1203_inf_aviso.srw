HA$PBExportHeader$w_1203_inf_aviso.srw
$PBExportComments$Ventana tipo response usada para desplegar los datos de un aviso pendiente.
forward
global type w_1203_inf_aviso from w_sgigenerica
end type
type d_cliente from u_avi_2014_pr_form_id_cliente2 within w_1203_inf_aviso
end type
type d_direccion from u_dir_2011_pr_direccion_std within w_1203_inf_aviso
end type
type p_ord_corte from picture within w_1203_inf_aviso
end type
type st_inc_asign from statictext within w_1203_inf_aviso
end type
type st_ord_corte from statictext within w_1203_inf_aviso
end type
type st_nom_inc from statictext within w_1203_inf_aviso
end type
type st_esencial from statictext within w_1203_inf_aviso
end type
type st_avi_peligro from statictext within w_1203_inf_aviso
end type
type p_inc_asign from picture within w_1203_inf_aviso
end type
type d_aviso from u_avi_2015_pr_form_obs2 within w_1203_inf_aviso
end type
type sle_esq_cond from singlelineedit within w_1203_inf_aviso
end type
type st_1 from statictext within w_1203_inf_aviso
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1203_inf_aviso
end type
type p_avi_calidad from picture within w_1203_inf_aviso
end type
type st_avi_calidad from statictext within w_1203_inf_aviso
end type
type p_sin_alim from picture within w_1203_inf_aviso
end type
type p_de_alumbrado from picture within w_1203_inf_aviso
end type
type st_sin_alim from statictext within w_1203_inf_aviso
end type
type st_de_alumbrado from statictext within w_1203_inf_aviso
end type
type cb_obs_improc from commandbutton within w_1203_inf_aviso
end type
type st_ubicacion_t from statictext within w_1203_inf_aviso
end type
type p_de_ayuda from picture within w_1203_inf_aviso
end type
type p_brig_enviada from picture within w_1203_inf_aviso
end type
type p_aviso_anulado from picture within w_1203_inf_aviso
end type
type st_de_ayuda from statictext within w_1203_inf_aviso
end type
type p_area from picture within w_1203_inf_aviso
end type
type st_tiempo from statictext within w_1203_inf_aviso
end type
type dw_1 from datawindow within w_1203_inf_aviso
end type
type dw_indices from datawindow within w_1203_inf_aviso
end type
type cb_2 from commandbutton within w_1203_inf_aviso
end type
type st_brig_enviada from statictext within w_1203_inf_aviso
end type
type st_aviso_anulado from statictext within w_1203_inf_aviso
end type
type st_ubicacion from multilineedit within w_1203_inf_aviso
end type
type cb_1 from commandbutton within w_1203_inf_aviso
end type
type p_dir_electrica from picture within w_1203_inf_aviso
end type
type st_dir_elec_t from statictext within w_1203_inf_aviso
end type
type p_2 from picture within w_1203_inf_aviso
end type
type p_1 from picture within w_1203_inf_aviso
end type
type p_avi_peligro from picture within w_1203_inf_aviso
end type
type p_esencial from picture within w_1203_inf_aviso
end type
type st_cli_imp from statictext within w_1203_inf_aviso
end type
type gb_1 from groupbox within w_1203_inf_aviso
end type
type p_cli_imp from picture within w_1203_inf_aviso
end type
end forward

global type w_1203_inf_aviso from w_sgigenerica
integer x = 5
integer y = 192
integer width = 3657
integer height = 2276
string title = "OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n detallada de un Aviso"
event ue_o_datos pbm_custom69
d_cliente d_cliente
d_direccion d_direccion
p_ord_corte p_ord_corte
st_inc_asign st_inc_asign
st_ord_corte st_ord_corte
st_nom_inc st_nom_inc
st_esencial st_esencial
st_avi_peligro st_avi_peligro
p_inc_asign p_inc_asign
d_aviso d_aviso
sle_esq_cond sle_esq_cond
st_1 st_1
d_ambito d_ambito
p_avi_calidad p_avi_calidad
st_avi_calidad st_avi_calidad
p_sin_alim p_sin_alim
p_de_alumbrado p_de_alumbrado
st_sin_alim st_sin_alim
st_de_alumbrado st_de_alumbrado
cb_obs_improc cb_obs_improc
st_ubicacion_t st_ubicacion_t
p_de_ayuda p_de_ayuda
p_brig_enviada p_brig_enviada
p_aviso_anulado p_aviso_anulado
st_de_ayuda st_de_ayuda
p_area p_area
st_tiempo st_tiempo
dw_1 dw_1
dw_indices dw_indices
cb_2 cb_2
st_brig_enviada st_brig_enviada
st_aviso_anulado st_aviso_anulado
st_ubicacion st_ubicacion
cb_1 cb_1
p_dir_electrica p_dir_electrica
st_dir_elec_t st_dir_elec_t
p_2 p_2
p_1 p_1
p_avi_peligro p_avi_peligro
p_esencial p_esencial
st_cli_imp st_cli_imp
gb_1 gb_1
p_cli_imp p_cli_imp
end type
global w_1203_inf_aviso w_1203_inf_aviso

type variables
u_dir_2001_nu_direccion_std		iu_dir_2001_nu

u_generico_comunicaciones		iu_gen_comunic 


s_avisos istr_avisos
datawindowchild ldwch_co_alc, ldwch_tip_avi, ldwch_prioridad,ldwch_est_aviso
int pb_dir_global,pb_dir_particular
int pb_avi_cond,pb_avi_cond2
int pb_cond

// Agregados por AFS al pasar de PLSQL a f(x) en PB5
datetime idt_f_deteccion
string is_desc_incidencia, is_retorno
long il_retorno, il_nro_orden
// Fin de agregados por AFS

boolean ib_hubo_cambios

string is_area
end variables

forward prototypes
public function integer fpr_cambiar_atributos ()
public function integer fpr_habilito_campos ()
public function integer fnu_o_datos_aviso (long pl_nro_aviso)
public subroutine fw_editar_campos (datawindow dw_datos)
public function integer fw_evalua_tipo_area (integer pi_area)
public subroutine fw_bloqueardw ()
public function integer fw_a_importante (long pl_nis)
end prototypes

event ue_o_datos;d_aviso.GetChild('co_alcance',ldwch_co_alc)
d_aviso.GetChild('tip_aviso',ldwch_tip_avi)
d_aviso.GetChild('prioridad',ldwch_prioridad)
d_aviso.GetChild('est_aviso',ldwch_est_aviso)

// GNU 23-8-2007. Incidencia 0/523077
/*ddw_alcance_aviso_t_shared.sharedata(ldwch_co_alc)
ddw_tipo_aviso_t_shared.sharedata(ldwch_tip_avi)
ddw_prioridad_t_shared.sharedata(ldwch_prioridad)
ddw_estado_aviso_t_shared.sharedata(ldwch_est_aviso)*/
// FIN GNU



end event

public function integer fpr_cambiar_atributos ();//////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_cambiar_atributos
//
// Objetivo: Actualiza los atributos de la ventana.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
// 		Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////
RETURN 1
end function

public function integer fpr_habilito_campos ();/////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_habilito_campos
//
// Objetivo: Habilita y Deshabilita campo
// 
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada: --
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////



IF iu_gen_comunic.is_comunic.longval5 = 1 THEN
	p_inc_asign.enabled = FALSE
Else
	p_inc_asign.enabled = TRUE
END IF
RETURN 1
end function

public function integer fnu_o_datos_aviso (long pl_nro_aviso);long pl_nis_rad, pgl_nro_aviso, pgl_nro_ot, pgl_nro_instalacion, pgl_nro_incidencia
long pl_nro_orden, pgl_nro_llamadas
int pgi_tip_aviso, pgi_ind_peligro, pgi_prioridad, pgi_est_aviso, pgi_ind_ayuda
int pgi_num_puerta, pgi_ind_improcedente, pgi_ind_cli_imp, pgi_co_alcance
int pgi_nro_centro, pgi_nro_cmd, pgi_nro_mesa,pgi_nro_area
string pgs_nombre, pgs_ape1, pgs_ape2, pgs_doc_id, pgs_tip_doc, pgs_tfno_cli
string pgs_obs_telegestiones, pgs_duplicador, pgs_esquina, pgs_nom_calle, pgs_cgv_sum
string pgs_nom_prov, pgs_nom_depto, pgs_nom_munic, pgs_nom_loc, pgs_co_pais
string pgs_nro_telefonista, pgs_obs_cmd, pgs_desc_incidencia, pretorno,pgs_poblacion
datetime pldt_f_alta, pd_f_deteccion

long lnro_incidencia
long lnis_rad
 
 DECLARE INF_AVISO CURSOR FOR  
SELECT 
       GI_AVISOS.NIS_RAD,
       GI_AVISOS.NOMBRE,   
       GI_AVISOS.APE1,   
       GI_AVISOS.APE2,   
       GI_AVISOS.DOC_ID,   
       GI_AVISOS.TIP_DOC,   
       GI_AVISOS.TIP_AVISO,   
       GI_AVISOS.IND_PELIGRO,   
       GI_AVISOS.PRIORIDAD,   
       GI_AVISOS.TFNO_CLI,   
       GI_AVISOS.EST_AVISO,   
       GI_AVISOS.OBS_TELEGESTIONES,   
       GI_AVISOS.IND_AYUDA,   
       GI_AVISOS.DUPLICADOR,   
       GI_AVISOS.NUM_PUERTA,   
       GI_AVISOS.ESQUINA,   
       GI_AVISOS.IND_IMPROCEDENTE,   
       GI_AVISOS.IND_CLI_IMP,   
       GI_AVISOS.NOM_CALLE,   
       GI_AVISOS.NOM_PROV,   
       GI_AVISOS.NOM_DEPTO,   
       GI_AVISOS.NOM_MUNIC,   
       GI_AVISOS.NOM_LOC,   
       GI_AVISOS.CO_ALCANCE,   
       GI_AVISOS.CO_PAIS,
       GI_AVISOS.NRO_AVISO,
       GI_AVISOS.NRO_TELEFONISTA,
       GI_AVISOS.F_ALTA,
       GI_AVISOS.NRO_OT,       
       GI_AVISOS.NRO_CENTRO,
       GI_AVISOS.NRO_CMD,
       GI_AVISOS.NRO_MESA,
       GI_AVISOS.NRO_INSTALACION,
       GI_AVISOS.NRO_INCIDENCIA,
       GI_AVISOS.OBS_CMD,
	  GI_AVISOS.NRO_LLAMADAS,
	  GI_AVISOS.AREA_REP,
	  GI_AVISOS.POBLACION,
	  GI_AVISOS.CGV_SUM     // LFE 03/08/2004
FROM GI_AVISOS  
WHERE GI_AVISOS.NRO_AVISO = :pl_nro_aviso;

DECLARE  INF_INCIDENCIA CURSOR FOR
 SELECT DESC_INCIDENCIA, F_DETECCION                   
  FROM SGD_INCIDENCIA
        WHERE NRO_INCIDENCIA = :lnro_incidencia;
DECLARE INF_OS CURSOR FOR
SELECT  ORDENES.NUM_OS  FROM ORDENES  
WHERE (( "ORDENES"."NIS_RAD" = :lnis_rad ) AND  
      (( "ORDENES"."TIP_OS" = 'TO501' ) OR  
       ( "ORDENES"."TIP_OS" = 'TO504' )) AND  
      (( "ORDENES"."EST_OS" = 'EO001' ) OR  
       ( "ORDENES"."EST_OS" = 'EO004' ) OR  
       ( "ORDENES"."EST_OS" = 'EO009' )) AND ROWNUM=1) ORDER BY "ORDENES"."F_GEN" ;

//WHERE (( ORDENES.NIS_RAD = :lnis_rad ) AND  (( ORDENES.TIP_OS = 'TO501' ) OR &
//	( ORDENES.TIP_OS = 'TO504' ) OR ( ORDENES.TIP_OS = 'TO515' ) OR &
//	( ORDENES.TIP_OS = 'TO516' ) OR ( ORDENES.TIP_OS = 'TO526' ) OR &
//	( ORDENES.TIP_OS = 'TO528' ) OR ( ORDENES.TIP_OS = 'TO530' ) OR &
//	( ORDENES.TIP_OS = 'TO533' )) AND  (( ORDENES.EST_OS = 'EO001' ) OR &
//	( ORDENES.EST_OS = 'EO004' ) OR  ( ORDENES.EST_OS = 'EO009' ) OR &
//	( ORDENES.EST_OS = 'EO011')) AND ROWNUM=1) ORDER BY ORDENES.F_GEN; 
//

    OPEN INF_AVISO;
 FETCH INF_AVISO INTO
       :lnis_rad, 
       :pgs_nombre,   
       :pgs_ape1,   
       :pgs_ape2,   
       :pgs_doc_id,   
       :pgs_tip_doc,   
       :pgi_tip_aviso,   
       :pgi_ind_peligro,   
       :pgi_prioridad,   
       :pgs_tfno_cli,   
       :pgi_est_aviso,   
       :pgs_obs_telegestiones,   
       :pgi_ind_ayuda,   
       :pgs_duplicador,   
       :pgi_num_puerta,   
       :pgs_esquina,   
       :pgi_ind_improcedente,   
       :pgi_ind_cli_imp,  
       :pgs_nom_calle,   
       :pgs_nom_prov,   
       :pgs_nom_depto,   
       :pgs_nom_munic,   
       :pgs_nom_loc,   
       :pgi_co_alcance,   
       :pgs_co_pais,
       :pgl_nro_aviso,
       :pgs_nro_telefonista,
       :pldt_f_alta,
       :pgl_nro_ot,
       :pgi_nro_centro,
       :pgi_nro_cmd,
       :pgi_nro_mesa,
       :pgl_nro_instalacion,
       :lnro_incidencia,
       :pgs_obs_cmd,
	   :pgl_nro_llamadas,
		:pgi_nro_area,
		:pgs_poblacion,
		:pgs_cgv_sum
		 ;


if sqlca.sqlcode <> 0 THEN
//        pretorno = 'ER11'
        is_retorno = 'ER11'
END IF
close INF_AVISO;

pgl_nro_incidencia = lnro_incidencia
pl_nis_rad = lnis_rad
OPEN INF_INCIDENCIA;
FETCH INF_INCIDENCIA INTO :is_desc_incidencia, :idt_f_deteccion;
CLOSE INF_INCIDENCIA;
OPEN INF_OS;
 FETCH INF_OS INTO :il_nro_orden;
CLOSE INF_OS;

////////////////////////////////////////////////////////////////////
open inf_aviso;
 fetch inf_aviso into &
			:istr_avisos.gl_nis_rad , &
			:istr_avisos.gs_nombre , &
			:istr_avisos.gs_ape1 , &
			:istr_avisos.gs_ape2  , &
			:istr_avisos.gs_doc_id , &
 			:istr_avisos.gs_tip_doc, &
			:istr_avisos.gi_tip_aviso , &
			:istr_avisos.gi_ind_peligro , &
			:istr_avisos.gi_prioridad   , &
			:istr_avisos.gs_tfno_cli   , &
			:istr_avisos.gi_est_aviso   , &
			:istr_avisos.gs_obs_telegestiones   , &
			:istr_avisos.gi_ind_ayuda, &
			:istr_avisos.gs_duplicador , &
			:istr_avisos.gl_num_puerta  , &
			:istr_avisos.gs_esquina  , &
			:istr_avisos.gi_ind_improcedente , &
			:istr_avisos.gi_ind_cli_imp   , &
			:istr_avisos.gs_nom_calle   , &
			:istr_avisos.gs_nom_prov   , &
			:istr_avisos.gs_nom_depto  , &
			:istr_avisos.gs_nom_munic  , &
			:istr_avisos.gs_nom_loc     , &
			:istr_avisos.gi_co_alcance   , &
			:istr_avisos.gs_co_pais   , &
			:istr_avisos.gl_nro_aviso   , &
			:istr_avisos.gs_nro_telefonista  , &
			:istr_avisos.gd_f_alta   , &
			:istr_avisos.gl_nro_ot    , &
			:istr_avisos.gi_nro_centro  , &
			:istr_avisos.gi_nro_cmd    , &
			:istr_avisos.gi_nro_mesa    , &
			:istr_avisos.gl_nro_instalacion    , &
			:istr_avisos.gl_nro_incidencia     , &
			:istr_avisos.gs_obs_cmd    ,&
			:istr_avisos.gl_nro_llamadas,&
			:istr_avisos.gi_nro_area     , &
			:istr_avisos.gs_poblacion, &  
			:istr_avisos.gs_cgv_sum;

close inf_aviso;

return 1
end function

public subroutine fw_editar_campos (datawindow dw_datos);// Recupero las descripciones para los campos, estado, alcance,tipo y prioridad
// de los cuales conozco el c$$HEX1$$f300$$ENDHEX$$digo, inserto estas descripciones en un text para 
// poder verlas en la opcion de impresion

int li_codigo, li_centro, li_cmd, li_mesa
string ls_estado, ls_alcance, ls_aviso, ls_prioridad
string ls_centro, ls_cmd, ls_mesa

li_codigo = dw_datos.GetItemNumber (1,'est_aviso')
SELECT DESCRIPCION
INTO :ls_estado
FROM SGD_VALOR
WHERE CODIF ='E_AV' AND CODIGO = :li_codigo;

li_codigo = dw_datos.GetItemNumber(1,'co_alcance')
SELECT DESCRIPCION
INTO :ls_alcance
FROM SGD_VALOR 
WHERE CODIF = 'ALC' AND CODIGO = :li_codigo;

li_codigo = dw_datos.GetItemNumber(1,'tip_aviso')
SELECT DESCRIPCION
INTO :ls_aviso
FROM GI_T_TIP_AVISO
WHERE TIP_AVISO = :li_codigo;

li_codigo = dw_datos.GetItemNumber(1,'prioridad')
SELECT DESCRIPCION
INTO :ls_prioridad
FROM SGD_VALOR 
WHERE CODIF = 'PRI' AND CODIGO = :li_codigo;

li_centro = d_ambito.GetItemNumber(1,'nro_centro')
SELECT  NOM_CENTRO
INTO :ls_centro
FROM  SGD_CENTRO
WHERE ( NRO_CENTRO = :li_centro) AND 
	   ( TIP_CENTRO  = 1   );
         
li_cmd = d_ambito.GetItemNumber(1,'nro_cmd')			
SELECT NOM_CENTRO
INTO :ls_cmd
FROM SGD_CENTRO
WHERE ( NRO_CENTRO = :li_cmd) AND
      ( TIP_CENTRO = 2   ) ;
		 
li_mesa = d_ambito.GetItemNumber(1,'nro_mesa')		 
SELECT  NOM_CENTRO
INTO :ls_mesa
FROM SGD_CENTRO  
WHERE ( TIP_CENTRO = 3   ) AND    
      ( NRO_CENTRO = :li_mesa)  ;	
		
//Inserto las descripciones obtenidas en los campos de tipo TEXT que he pegado en el dw
dw_1.modify("estado_t.text = '" + ls_estado + "'")
dw_1.modify("alcance_t.text = '" + ls_alcance + "'")
dw_1.modify("tipo_t.text = '" + ls_aviso + "'")
dw_1.modify("prioridad_t.text = '" + ls_prioridad + "'")
dw_1.modify("zona_t.text= '" + ls_centro + "'")
dw_1.modify("cmd_t.text = '" + ls_cmd + "'")
dw_1.modify("sector_t.text = '" + ls_mesa + "'")

end subroutine

public function integer fw_evalua_tipo_area (integer pi_area);string ls_tiempo

select valor,
descripcion
into :ls_tiempo,
:is_area
from sgd_valor 
where codif = 'ARE' and codigo = :pi_area;

if pi_area > 0 then 
	p_area.visible = true
	st_tiempo.visible = true
end if

choose case pi_area
	case 1 
		p_area.PictureName = "muy_alta_densidad.bmp"
		st_tiempo.text = ls_tiempo + " horas"
	case 2
		p_area.PictureName = "alta_densidad.bmp"
		st_tiempo.text = ls_tiempo + " horas"
	case 3
		p_area.PictureName = "densidad_intermedia.bmp"
		st_tiempo.text = ls_tiempo + " horas"
	case 4
		p_area.PictureName = "baja_densidad.bmp"
		st_tiempo.text = ls_tiempo + " horas"
	case 5
		p_area.PictureName = "muy_baja_densidad.bmp"
		st_tiempo.text = ls_tiempo + " horas"
end choose

return 1
end function

public subroutine fw_bloqueardw ();/*
Descripci$$HEX1$$f300$$ENDHEX$$n	:	Bloquea los dw de la ventana
Par$$HEX1$$e100$$ENDHEX$$metros	:	-
Devuelve		:	-
Autor			:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas Miguel$$HEX2$$e100f100$$ENDHEX$$ez
Fecha			:	11/01/2008
*/

d_direccion.enabled = FALSE
st_ubicacion.enabled = FALSE
d_ambito.enabled = FALSE
d_aviso.enabled = FALSE
end subroutine

public function integer fw_a_importante (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fw_a_importante
//
// Objetivo:    Verifico si el cliente al que pertenece el suministro
//                                      pasado como par$$HEX1$$e100$$ENDHEX$$metro es importante.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nis (id. del suministro del cliente)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (cliente importante o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//  11/11/2014                LSH                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
/*** LSH *** INI *** DDAG-845- *** 11/11/2014 */


SetPointer(HourGlass!)

string ls_tipo, ls_carga, ls_img_carga

SELECT "GI_SUMINISTROS_IMP"."CARGA_ES", "GI_SUMINISTROS_IMP"."TIPO_CARGA_ES", "SGD_VALOR"."DESCRIPCION"
INTO :ls_carga, :ls_tipo, :ls_img_carga
FROM "GI_SUMINISTROS_IMP",   "SGD_VALOR"
WHERE "GI_SUMINISTROS_IMP"."NIS_RAD" = :pl_nis AND
		"GI_SUMINISTROS_IMP"."F_EXPIRACION" > sysdate AND
		"SGD_VALOR"."CODIF"(+) = 'ESEN' AND 
		"SGD_VALOR"."VALOR"(+) = "GI_SUMINISTROS_IMP"."TIPO_CARGA_ES"
USING sqlca;

IF sqlca.SqlCode = 0 THEN
	IF ls_carga = 'N' THEN
		istr_avisos.gi_ind_cli_esen = 0
	ELSEIF ls_carga = 'S' THEN
		istr_avisos.gi_ind_cli_esen = 1
		istr_avisos.gs_tip_carga = ls_tipo
		istr_avisos.gs_img_carga = ls_img_carga 
	END IF
ELSEIF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER05","","",OK!)
	RETURN -1
ELSE
	istr_avisos.gi_ind_cli_imp = 0
	RETURN 0
END IF

RETURN 1

/*** LSH *** FIN *** DDAG-845- *** 11/11/2014 */


end function

event ue_arch_grabar;datetime ldt_f_actual
int a
d_aviso.AcceptText()

istr_avisos.gi_prioridad = d_aviso.GetItemNumber(1,"prioridad")
istr_avisos.gs_obs_cmd = d_aviso.GetItemString(1,"obs_cmd")
istr_avisos.gs_obs_telegestiones = d_aviso.GetItemString(1,"obs_telegestiones")
    
d_ambito.AcceptText()
	
	
istr_avisos.gi_nro_centro = d_ambito.GetItemNumber(1,"nro_centro")
istr_avisos.gi_nro_cmd = d_ambito.GetItemNumber(1,"nro_cmd")
istr_avisos.gi_nro_mesa = d_ambito.GetItemNumber(1,"nro_mesa")

//END IF


 ldt_f_actual = fgnu_fecha_actual()

UPDATE GI_AVISOS
SET USUARIO = :gs_usuario,
    F_ACTUAL = :ldt_f_actual,
    PROGRAMA = 'w_inf_aviso',
    PRIORIDAD = :istr_avisos.gi_prioridad,
    OBS_CMD = NVL(:istr_avisos.gs_obs_cmd,' '),
    OBS_TELEGESTIONES = NVL(:istr_avisos.gs_obs_telegestiones,' '),
    NRO_CENTRO = :istr_avisos.gi_nro_centro,
    NRO_CMD = :istr_avisos.gi_nro_cmd ,
    NRO_MESA =  :istr_avisos.gi_nro_mesa
 WHERE NRO_AVISO = :istr_avisos.gl_nro_aviso  ;


if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
	//rollback;
	gnu_u_transaction.uf_rollback()
	gnv_msg.f_mensaje("AR19","","",OK!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al actualizar el aviso.")
//if isnull(ls_retorno) then ls_retorno ="NULL"
// messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",ls_retorno)
//
else
	
UPDATE GI_AVISOS_INSTALACION
SET USUARIO = :gs_usuario,
    F_ACTUAL = :ldt_f_actual,
    PROGRAMA = 'w_inf_aviso',
    NRO_ZONA = :istr_avisos.gi_nro_centro,
    NRO_CMD = :istr_avisos.gi_nro_cmd ,
    NRO_SECTOR =  :istr_avisos.gi_nro_mesa,
	 ind_aviso_consultado = 1
WHERE NRO_AVISO =:istr_avisos.gl_nro_aviso  ;	
	
	if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
		gnu_u_transaction.uf_rollback()
		gnv_msg.f_mensaje("AR19","","",OK!)
	else
		gnu_u_transaction.uf_commit()
	end if

end if

gnu_u_transaction.uf_desbloquea_avisos(istr_avisos.gl_nro_aviso,1)

end event

event open;call super::open;
//////////////////////////////////////////////////////////////////////////
//  
// Estoy suponiendo que el perfil del usuario es operador !!!
// O sea que no paso, ni eval$$HEX1$$fa00$$ENDHEX$$o el perfil.
//
//
// variables de comunicaciones
// gu_comunic.is_comunic.longval1  = numero de aviso
// gu_comunic.is_comunic.longval5  = 1 ni habilito ver incidencia 0  habilito
// gu_comunic.is_comunic.Programa_llamante
// gu_comunic.is_comunic.Accion_llamada = Consulta
//													 = Actualizacion
// gu_comunic.is_comunic.intval5 = Tipo de aviso
//
//
//Variable de Retorno
//
// gu_comunic.is_comunic.Accion_retorno 
//
//
// recibo estructura de comunicaciones
//
////////////////////////////////////////////////////////////////////////

//string t1,t2,t3,t4,t5
//t1 = string(datetime(today(),now()))

//fg_colocar_ventana(w_1203_inf_aviso)
string ls_color_gris, ls_color_blanco //, ls_desc_incidencia 
long ll_nis, ll_nro_orden, ll_nic
datetime 	ldt_f_deteccion
string ls_medidor // GNU 12/12/2006. Mejora 1/327511
datetime ldt_f_actual
long ll_res_bloqueo //GNU 18/01/2007. Mejora 1/311530

//LSH INI 01/01/2014 correctivo DEO13-00000184
datetime ld_f_elim_inc
datetime ld_f_elim_aviso
integer li_f_elim_aviso
datetime ldt_null
setnull(ldt_null)
//LSH FIN 01/01/2014 correctivo DEO13-00000184

/*** LSH *** INI *** DDAG-845- *** 11/11/2014 */
integer li_imp
/*** LSH *** FIN *** DDAG-845- *** 11/11/2014 */

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.

iu_gen_comunic = CREATE u_generico_comunicaciones

iu_gen_comunic.is_comunic = gu_comunic.is_comunic
cb_2.visible = fg_verifica_parametro('INDICADORES_RUR') OR fg_verifica_parametro('INDICADORES_URB')
//fg_colocar_ventana(w_1203_inf_aviso)

// GNU 21-09-2005 Se ha puesto aqu$$HEX2$$ed002000$$ENDHEX$$por cuestiones de herencia
d_aviso.settransobject(sqlca)
// Fin GNU

// Creo los objetos necesarios para obtener la inf. de la pantalla
//istr_avisos 	= CREATE s_avisos

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("iw_1203","Inf.Aviso")


// El puntero del mouse toma la forma del reloj de arena

//SetPointer(HourGlass!)


// Obtengo el valor del par$$HEX1$$e100$$ENDHEX$$metro pasado


// Si no viene el nro. de aviso, mensaje y cierro ventana
IF iu_gen_comunic.is_comunic.longval1 <= 0 THEN
	Close(This)
	return //DBE 07/03/2000
END IF

//t2 = string(datetime(today(),now()))
// Cargo estructura con datos del aviso
string ls_retorno
long ll_nro_aviso
ll_nro_aviso = iu_gen_comunic.is_comunic.longval1
// DECLARE inf_aviso PROCEDURE FOR SGI.PNU_INF_AVISO(:ll_nro_aviso); 
// DECLARE inf_aviso PROCEDURE FOR pnu_inf_aviso(:ll_nro_aviso); // Ale
// execute inf_aviso;
This.fnu_o_datos_aviso(ll_nro_aviso)
// fetch inf_aviso into &
//			:istr_avisos.gl_nis_rad , &
//			:istr_avisos.gs_nombre , &
//			:istr_avisos.gs_ape1 , &
//			:istr_avisos.gs_ape2  , &
//			:istr_avisos.gs_doc_id , &
// 			:istr_avisos.gs_tip_doc, &
//			:istr_avisos.gi_tip_aviso , &
//			:istr_avisos.gi_ind_peligro , &
//			:istr_avisos.gi_prioridad   , &
//			:istr_avisos.gs_tfno_cli   , &
//			:istr_avisos.gi_est_aviso   , &
//			:istr_avisos.gs_obs_telegestiones   , &
//			:istr_avisos.gi_ind_ayuda, &
//			:istr_avisos.gs_duplicador , &
//			:istr_avisos.gi_num_puerta  , &
//			:istr_avisos.gs_esquina  , &
//			:istr_avisos.gi_ind_improcedente , &
//			:istr_avisos.gi_ind_cli_imp   , &
//			:istr_avisos.gs_nom_calle   , &
//			:istr_avisos.gs_nom_prov   , &
//			:istr_avisos.gs_nom_depto  , &
//			:istr_avisos.gs_nom_munic  , &
//			:istr_avisos.gs_nom_loc     , &
//			:istr_avisos.gi_co_alcance   , &
//			:istr_avisos.gs_co_pais   , &
//			:istr_avisos.gl_nro_aviso   , &
//			:istr_avisos.gs_nro_telefonista  , &
//			:istr_avisos.gd_f_alta   , &
//			:istr_avisos.gl_nro_ot    , &
//			:istr_avisos.gi_nro_centro  , &
//			:istr_avisos.gi_nro_cmd    , &
//			:istr_avisos.gi_nro_mesa    , &
//			:istr_avisos.gl_nro_instalacion    , &
//			:istr_avisos.gl_nro_incidencia     , &
//			:istr_avisos.gs_obs_cmd, &
//			:ls_desc_incidencia  ,  &
//			:ldt_f_deteccion  , &
//			:ll_nro_orden , &
//			:ls_retorno  ;
//

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ls_color_gris   = string(65536*192+256*192+192)
//ls_color_blanco = string(65536*255+256*255+255)
ls_color_gris   = gs_gris
ls_color_blanco = gs_blanco
// Fin. Sgo.

SetRedraw(False)

// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
d_ambito.fpr_crea_dddw()
d_ambito.insertrow(0)


//LSH INI 08/09/2013 evolutivo DEO12-00000263
//Se inicializan los campos para que sean invisibles
d_aviso.modify("f_elim_peligro.Visible='0'")
d_aviso.modify("t_9.Visible='0'")
//LSH FIN 08/09/2013 evolutivo DEO12-00000263

//d_ambito.SetItem(1,"nro_centro",istr_avisos.gi_nro_centro)
//d_ambito.fnu_filtro_cmd_out()
//d_ambito.SetItem(1,"nro_cmd",istr_avisos.gi_nro_cmd)
//d_ambito.fnu_filtro_mesa_out()
//d_ambito.SetItem(1,"nro_mesa",istr_avisos.gi_nro_mesa)

// Habilito los campos de los user-object,
// de acuerdo a la accion de llamada.
IF iu_gen_comunic.is_comunic.accion_llamada = "Consulta" OR  istr_avisos.gi_est_aviso = fgci_aviso_resuelto THEN
	d_ambito.fnu_insertar_datos(istr_avisos.gi_nro_centro,istr_avisos.gi_nro_cmd,istr_avisos.gi_nro_mesa,1)
	d_ambito.Show()
//	d_direccion.fpr_habilitar_campos(False,False)
	pb_dir_global = 0
	pb_dir_particular = 0
   d_direccion.triggerevent("ue_habilitar_campos")

	fpr_habilitar_campo_sle(sle_esq_cond,False)
	pb_cond = 0
	d_cliente.triggerevent("ue_habilitar_campos")

//	d_cliente.fpr_habilitar_campos(False)


	pb_avi_cond = 0
	pb_avi_cond2 = 0
	d_aviso.triggerevent("ue_habilitar_campos")

//	d_aviso.fpr_habilitar_campos(False,False)

//	d_ambito.fpr_habilitar_campos(False) // LFE - comentado para ambito

//	d_aviso.SetTabOrder("obs_telegestiones",0)
	d_aviso.SetTabOrder("obs_cmd",20)
	
	d_aviso.Modify("obs_telegestiones.Edit.DisplayOnly = true")
	d_aviso.Modify("obs_telegestiones.Background.Color = "+ls_color_gris)

	d_aviso.Modify("obs_cmd.Edit.DisplayOnly = true")
	d_aviso.Modify("obs_cmd.Background.Color= "+ls_color_gris)


ELSEIF iu_gen_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
	d_ambito.fnu_insertar_datos(istr_avisos.gi_nro_centro,istr_avisos.gi_nro_cmd,istr_avisos.gi_nro_mesa,0)
	d_ambito.Show()
	pb_dir_global = 0
	pb_dir_particular = 0
   //d_direccion.triggerevent("ue_habilitar_campos")----------------------------------------------------------------------------------
	fpr_habilitar_campo_sle(sle_esq_cond,False)
	pb_cond = 0
	d_cliente.triggerevent("ue_habilitar_campos")
//	d_cliente.fpr_habilitar_campos(False)
	pb_avi_cond = 0
	pb_avi_cond2 = 1
	d_aviso.triggerevent("ue_habilitar_campos")
//	d_aviso.fpr_habilitar_campos(False,True)

	//d_ambito.fpr_habilitar_campos(True)///////
	d_ambito.fnu_des_centro()   
// Modificado por Sgo. Mejora 1/295697 - Moldavia. 04/07/2005.
//	d_ambito.fnu_des_cmd()		 
	If gi_pais <> 8 Then
		d_ambito.fnu_des_cmd()
	End If
// Fin. Sgo.

	//d_ambito.modify("nro_centro.protect=1")  // LFE - comentado para ambito
	//d_ambito.modify("nro_centro.background.color="+gs_gris)  // LFE - comentado para ambito

//	d_aviso.SetTabOrder("obs_telegestiones",0)
	d_aviso.SetTabOrder("obs_cmd",10)
	
	IF fg_verifica_parametro("Modificacion obs_teleg consulta avisos") then
		d_aviso.Modify("obs_telegestiones.Background.Color = "+ls_color_blanco)
		d_aviso.Modify("obs_telegestiones.Edit.DisplayOnly = false")
		d_aviso.SetTabOrder("obs_telegestiones",20)
	ELSE
		d_aviso.Modify("obs_telegestiones.Edit.DisplayOnly = true")
		d_aviso.Modify("obs_telegestiones.Background.Color = "+ls_color_gris)
	END IF
	
	d_aviso.Modify("obs_cmd.Edit.DisplayOnly =false")
	d_aviso.Modify("obs_cmd.Background.Color= "+ls_color_blanco)

END IF

// Inserto un registro en los user-object de trabajo

// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n del aviso y conecto las D.D.D.W
triggerevent("ue_o_datos")
d_direccion.insertrow(0)
d_cliente.insertrow(0)
// GNU 21-09-2005 se ha puesto al principio por cuestiones de herencia
//d_aviso.settransobject(sqlca)
// Fin GNU
d_aviso.retrieve(istr_avisos.gl_nro_aviso)

//d_aviso.insertrow(0)
//
//
//d_aviso.setitem(1,'co_alcance',istr_avisos.gi_co_alcance)
//d_aviso.setitem(1,'tip_aviso',istr_avisos.gi_tip_aviso )
//d_aviso.setitem(1,'prioridad',istr_avisos.gi_prioridad )
//d_aviso.setitem(1,'obs_telegestiones',istr_avisos.gs_obs_telegestiones )
//d_aviso.setitem(1,'nro_aviso',istr_avisos.gl_nro_aviso)
//d_aviso.setitem(1,'f_alta',istr_avisos.gd_f_alta)
//d_aviso.setitem(1,'nro_telefonista',istr_avisos.gs_nro_telefonista )
//d_aviso.setitem(1,'obs_cmd',istr_avisos.gs_obs_cmd )
//d_aviso.setitem(1,'nro_llamadas',istr_avisos.gl_nro_llamadas )
//d_aviso.setitem(1,'ind_improcedente',istr_avisos.gi_ind_improcedente )
//d_aviso.setitem(1,'est_aviso', istr_avisos.gi_est_aviso)
//

//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_ubicacion_t.Visible = False
st_ubicacion.Visible = False

If fg_verifica_parametro('referencia_recepcion_avisos') Then
	st_ubicacion.Text = istr_avisos.gs_esquina
	
	st_ubicacion_t.Visible = True
	st_ubicacion.Visible = True
	// GNU. 21-12-2005. Incidencia referencia avisos
	//d_direccion.Height += 64
	d_direccion.Height += 120
End If
//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


d_cliente.setitem(1,"ape1",istr_avisos.gs_ape1)
d_cliente.setitem(1,"ape2",istr_avisos.gs_ape2)
d_cliente.setitem(1,"nombre",istr_avisos.gs_nombre)
d_cliente.setitem(1,"tfno_cli",istr_avisos.gs_tfno_cli)
 //GNU 26-10-2005. Mejora: 1/335502
if fg_verifica_parametro('NIC') then
	SELECT "NIC"
	INTO :ll_nic
	FROM SUMCON
	WHERE NIS_RAD=: istr_avisos.gl_nis_rad;
	d_cliente.object.nis_rad_t.text='NIC'
	d_cliente.setitem(1,"nis_rad",ll_nic)
else
	d_cliente.setitem(1,"nis_rad",istr_avisos.gl_nis_rad) 
end if
// Fin GNU

// GNU 12/12/2006. Mejora 1/327511
IF fg_verifica_parametro("avisos por medidor") THEN
	// GNU 18-4-2007.Mejora 1/485502
//	SELECT NIF_APA
	SELECT NUM_APA
	INTO :ls_medidor
	FROM APMEDIDA_AP
	WHERE NIS_RAD= :istr_avisos.gl_nis_rad; 
	IF sqlca.sqlcode=0 THEN
		d_cliente.Modify ("medidor.text='" + ls_medidor + "'")
	END IF
END IF
// FIN GNU
d_direccion.SetItem(1,"provincia",istr_avisos.gs_nom_prov)
d_direccion.SetItem(1,"municipio",istr_avisos.gs_nom_munic)
d_direccion.SetItem(1,"localidad",istr_avisos.gs_nom_loc)
d_direccion.SetItem(1,"depto",istr_avisos.gs_nom_depto)
d_direccion.SetItem(1,"calle",istr_avisos.gs_nom_calle)
d_direccion.SetItem(1,"numero",string(istr_avisos.gl_num_puerta))
d_direccion.SetItem(1,"duplic",istr_avisos.gs_duplicador)
d_direccion.SetItem(1,"cgv",istr_avisos.gs_cgv_sum) // LFE 03/08/2004

fpr_llenar_campo_sle(sle_esq_cond,string(istr_avisos.gs_esquina))

//AHM (15/06/2009) Mejora 1/372585
// Verifico y prendo los indicativos
IF (istr_avisos.gi_ind_peligro = 1 AND ( gi_pais <> 8 OR (gi_pais = 8 AND istr_avisos.gi_tip_aviso = 5))) THEN
	p_avi_peligro.Show()
	st_avi_peligro.Show()
	//LSH INI 08/09/2013 evolutivo DEO12-00000263
	d_aviso.modify("f_elim_peligro.Visible='1'")
	d_aviso.modify("t_9.Visible='1'")
	//LSH FIN 08/09/2013 evolutivo DEO12-00000263
ELSEIF (istr_avisos.gi_ind_peligro = 1 AND gi_pais = 8 AND istr_avisos.gi_tip_aviso = 4) THEN
	p_2.Show()
	st_avi_peligro.Show()
ELSEIF (istr_avisos.gi_ind_peligro = 1 AND gi_pais = 8 AND istr_avisos.gi_tip_aviso = 9) THEN
	p_1.Show()
	st_avi_peligro.Show()
END IF


/*** LSH *** INI *** DDAG-845- *** 11/11/2014 */
li_imp = fw_a_importante(istr_avisos.gl_nis_rad)

//li_imp = d_inf_resumen.fpr_v_importante(is_direccion.gl_nis)
 
IF  li_imp = 1 THEN
	IF istr_avisos.gi_ind_cli_esen = 1 THEN
		// Es cliente importante, entonces muestro indicativo
		p_cli_imp.Hide()
		st_cli_imp.Hide()	
		
		p_esencial.PictureName = ".\recursos\" + istr_avisos.gs_img_carga
		p_esencial.show()
		st_esencial.Show()
		
	ELSE
		p_cli_imp.Show()
		st_cli_imp.Show()
	END IF
	
ELSEIF li_imp = -1 THEN
	//ib_error = True
	RETURN
ELSE
	p_esencial.Hide()
	st_esencial.Hide()

	p_cli_imp.Hide()
	st_cli_imp.Hide()
END IF
/*** LSH *** FIN *** DDAG-845- *** 11/11/2014 */


IF istr_avisos.gl_nro_incidencia <> 0 THEN
	
	// Obtiene los datos de la incidencia asociada

//	st_fecha_det.Text = String(ldt_f_deteccion)
	st_nom_inc.Text = is_desc_incidencia
//	st_fecha_det.Show()
	st_nom_inc.Show()
	p_inc_asign.Show()
	st_inc_asign.Show()
END IF


// Tengo que hacer un select a Suministros para verificar orden de
// servicio de corte.


IF il_nro_orden <> 0 THEN
	p_ord_corte.Show()
	st_ord_corte.Show()
END IF
IF istr_avisos.gl_nro_ot <> 0 THEN
	// GNU 2-5-2006. Mejora 1/339429
	p_brig_enviada.enabled=true
	// FIN GNU
	
	p_brig_enviada.Show()
	IF istr_avisos.gi_est_aviso = fgci_aviso_resuelto THEN
		st_brig_enviada.text="Resuelto por Brigada"
	END IF
	st_brig_enviada.Show()
END IF

IF istr_avisos.gi_est_aviso = fgci_estado_anulado THEN
	p_aviso_anulado.Show()
	st_aviso_anulado.Show()
END IF

// LFE - Mejora 1/262335
IF istr_avisos.gl_nro_instalacion = fgcdec_aviso_sin_alimentacion OR istr_avisos.gl_nro_instalacion = fgcdec_aviso_de_ayuda OR &
	istr_avisos.gl_nro_instalacion = fgcdec_aviso_alumbrado_publico OR istr_avisos.gl_nro_instalacion = fgcdec_aviso_de_calidad_sin_alim THEN
	
	d_aviso.object.saifi_t.visible=0
	d_aviso.object.saidi_t.visible=0
	d_aviso.object.saifi_oc.visible=0
	d_aviso.object.saidi_oc.visible=0
	d_aviso.object.gb_indicadores.visible=0
	cb_2.visible = False
END IF
// LFE - Fin Mejora 1/262335


/*
 Se a$$HEX1$$f100$$ENDHEX$$ade esta SELECT para identificar si el tipo de aviso
 es de Calidad para que se muestre el BMP
 de calidad. ACA Incidencia por correo del 15 feb 2006
*/

  int li_clase_aviso

		SELECT CLASE_AVISO
		INTO :li_clase_aviso
		FROM GI_AVISOS
		WHERE NRO_AVISO = :ll_nro_aviso;


IF istr_avisos.gl_nro_instalacion = fgcdec_aviso_sin_alimentacion THEN
	p_sin_alim.Show()
	st_sin_alim.Show()
ELSEIF istr_avisos.gl_nro_instalacion = fgcdec_aviso_de_ayuda THEN
	p_de_ayuda.Show()
	st_de_ayuda.Show()
ELSEIF istr_avisos.gl_nro_instalacion = fgcdec_aviso_alumbrado_publico THEN
	p_de_alumbrado.Show()
	st_de_alumbrado.Show()
ELSEIF li_clase_aviso=3 THEN// ACA 15/02/2006
	p_avi_calidad.Show()
	st_avi_calidad.Show()	
END IF

fw_evalua_tipo_area(istr_avisos.gi_nro_area)

//************************************************************************************************//
//   Externalidad: Avisos de ayuda y alumbrado publico solo provincia, distrito,...               //
//   Luis Eduardo Ortiz  Mayo/2001                                                                //
//************************************************************************************************//

If fg_verifica_parametro("avisos_ayuda_ap_prov_dist_corr_barrio") Then
	If istr_avisos.gl_nro_instalacion = fgcdec_aviso_alumbrado_publico OR istr_avisos.gl_nro_instalacion = fgcdec_aviso_de_ayuda Then
		d_direccion.Modify("calle_t.Visible=0") 
		//d_direccion.Modify("calle.Visible=0")
		//d_direccion.Modify("numero.Visible=0")
		//d_direccion.Modify("duplic.Visible=0")
	End If
End If

//************************************************************************************************//
//   Luis Eduardo Ortiz  Mayo/2001                                                                //
//************************************************************************************************//


//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//d_direccion.Modify("prov.Text='"+fg_ident_geo('1')+"'") 
//d_direccion.Modify("depto_t.Text='"+fg_ident_geo('2')+"'")
//d_direccion.Modify("municipio_t.Text='"+fg_ident_geo('3')+"'")
//d_direccion.Modify("localidad_t.Text='"+fg_ident_geo('4')+"'")


//fg_parametros_ext( fg_ventana_parametro("GEO", "NIVEL1"), 2, d_direccion)
//fg_parametros_ext( fg_ventana_parametro("GEO", "NIVEL2"), 2, d_direccion)
//fg_parametros_ext( fg_ventana_parametro("GEO", "NIVEL3"), 1, d_direccion)
//fg_parametros_ext( fg_ventana_parametro("GEO", "NIVEL4"), 1, d_direccion)


//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//fg_ventana_parametro(This.ClassName(), d_direccion)-------------------------------------------------------------------
//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

If istr_avisos.gi_est_aviso = fgci_aviso_improcedente Then 
	cb_obs_improc.Visible = True
	cb_1.x = 1211
END IF
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 12/06/2002  **
//**************************************************
fg_datos_tipo_calle(d_direccion, 0, ll_nro_aviso)
//**************************************************
//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 12/06/2002  **
//**************************************************
 
// LFE - Mejora 1/262335
IF gi_pais = 4 THEN dw_indices.Retrieve(ll_nro_aviso)
// LFE - Fin Mejora 1/262335

// GNU 22-2-2007. Mejora 1/438281, 1/485522
IF fg_verifica_parametro("direccion electrica") THEN
	st_dir_elec_t.visible= true
	p_dir_electrica.visible= true
ELSE
	st_dir_elec_t.visible= false
	p_dir_electrica.visible= false
END IF
SetRedraw(True)
//close inf_aviso;
//t4= string(datetime(today(),now()))

//messagebox("t1",t1)
//messagebox("t2",t2)
//messagebox("t3",t3)
//messagebox("t4",t4)
//messagebox("t5",t5)

//LSH INI 30/09/2013 evolutivo DEO12-00000263
SELECT COUNT(F_ELIM_PELIGRO)
INTO :li_f_elim_aviso
FROM GI_OT WHERE NRO_AVISO = :istr_avisos.gl_nro_aviso;

SELECT F_ELIM_PELIGRO
INTO :ld_f_elim_inc
FROM SGD_INCIDENCIA 
WHERE NRO_INCIDENCIA = :istr_avisos.gl_nro_incidencia;

//LSH INI 01/01/2014 correctivo DEO13-00000184
IF date(ld_f_elim_inc) = date("01/01/1900") THEN
	ld_f_elim_inc = ldt_null
END IF
//LSH FIN 01/01/2014 correctivo DEO13-00000184

IF li_f_elim_aviso = 0 THEN
	d_aviso.setitem(1,'f_elim_peligro', ld_f_elim_inc)
END IF
//LSH FIN 30/09/2013 evolutivo DEO12-00000263

end event

event close;call super::close;// Elimino los objetos creados
DESTROY iu_dir_2001_nu 
//DESTROY istr_avisos
//
//AHM 30/09/2009 Mejora 1/535253
IF gu_comunic.is_comunic.programa_llamante = "w_2307_consulta_aviso" THEN
	gu_comunic.is_comunic.programa_llamante = "w_1203_inf_aviso"
END IF
end event

event closequery;call super::closequery;// DECLARE Untitled PROCEDURE FOR AVISOS.PNU_A_AVISO  ;
//dwitemstatus pp
IF iu_gen_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
	d_ambito.accepttext()
	d_aviso.accepttext()
	
	
	if ib_hubo_cambios then
		if d_ambito.getitemnumber(1,"nro_centro") <> fgci_todos and &
		   d_ambito.getitemnumber(1,"nro_cmd") <> fgci_todos and &
			d_ambito.getitemnumber(1,"nro_mesa") <> fgci_todos then
			CHOOSE CASE gnv_msg.f_mensaje('CG001',"","",YesNoCancel!)
				CASE 1
			
					iu_gen_comunic.is_comunic = gu_comunic.is_comunic
					iu_gen_comunic.is_comunic.accion_retorno = "Actualizado"
					iu_gen_comunic.is_comunic.programa_retorno = "w_1203"
					gu_comunic.is_comunic = iu_gen_comunic.is_comunic			
					This.TriggerEvent("ue_arch_grabar")
				CASE 2
					iu_gen_comunic.is_comunic = gu_comunic.is_comunic
					iu_gen_comunic.is_comunic.accion_retorno = "Sin Actualizar"						
					iu_gen_comunic.is_comunic.programa_retorno = "w_1203"
					gu_comunic.is_comunic = iu_gen_comunic.is_comunic
					// GNU 18/01/2007. Mejora 1/311530
					gnu_u_transaction.uf_desbloquea_avisos(istr_avisos.gl_nro_aviso,1)
				CASE 3, -1
					Message.ReturnValue=1
//					gnu_u_transaction.uf_desbloquea_avisos(istr_avisos.gl_nro_aviso,1)
			END CHOOSE
		else
			gnv_msg.f_mensaje("EA20","","",OK!)
			message.returnvalue = 1
		end if
	// GNU 18/01/2007. Mejora 1/311530
	ELSEIF iu_gen_comunic.is_comunic.programa_llamante="w_1105_avi" or &
			 iu_gen_comunic.is_comunic.programa_llamante="w_1233_consulta_aviso" THEN
		iu_gen_comunic.is_comunic = gu_comunic.is_comunic
		iu_gen_comunic.is_comunic.accion_retorno = "Sin Actualizar"						
		iu_gen_comunic.is_comunic.programa_retorno = "w_1203"
		gu_comunic.is_comunic = iu_gen_comunic.is_comunic	
		gnu_u_transaction.uf_desbloquea_avisos(istr_avisos.gl_nro_aviso,1)
	// FIN GNU	
END IF

end if
end event

on w_1203_inf_aviso.create
int iCurrent
call super::create
this.d_cliente=create d_cliente
this.d_direccion=create d_direccion
this.p_ord_corte=create p_ord_corte
this.st_inc_asign=create st_inc_asign
this.st_ord_corte=create st_ord_corte
this.st_nom_inc=create st_nom_inc
this.st_esencial=create st_esencial
this.st_avi_peligro=create st_avi_peligro
this.p_inc_asign=create p_inc_asign
this.d_aviso=create d_aviso
this.sle_esq_cond=create sle_esq_cond
this.st_1=create st_1
this.d_ambito=create d_ambito
this.p_avi_calidad=create p_avi_calidad
this.st_avi_calidad=create st_avi_calidad
this.p_sin_alim=create p_sin_alim
this.p_de_alumbrado=create p_de_alumbrado
this.st_sin_alim=create st_sin_alim
this.st_de_alumbrado=create st_de_alumbrado
this.cb_obs_improc=create cb_obs_improc
this.st_ubicacion_t=create st_ubicacion_t
this.p_de_ayuda=create p_de_ayuda
this.p_brig_enviada=create p_brig_enviada
this.p_aviso_anulado=create p_aviso_anulado
this.st_de_ayuda=create st_de_ayuda
this.p_area=create p_area
this.st_tiempo=create st_tiempo
this.dw_1=create dw_1
this.dw_indices=create dw_indices
this.cb_2=create cb_2
this.st_brig_enviada=create st_brig_enviada
this.st_aviso_anulado=create st_aviso_anulado
this.st_ubicacion=create st_ubicacion
this.cb_1=create cb_1
this.p_dir_electrica=create p_dir_electrica
this.st_dir_elec_t=create st_dir_elec_t
this.p_2=create p_2
this.p_1=create p_1
this.p_avi_peligro=create p_avi_peligro
this.p_esencial=create p_esencial
this.st_cli_imp=create st_cli_imp
this.gb_1=create gb_1
this.p_cli_imp=create p_cli_imp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_cliente
this.Control[iCurrent+2]=this.d_direccion
this.Control[iCurrent+3]=this.p_ord_corte
this.Control[iCurrent+4]=this.st_inc_asign
this.Control[iCurrent+5]=this.st_ord_corte
this.Control[iCurrent+6]=this.st_nom_inc
this.Control[iCurrent+7]=this.st_esencial
this.Control[iCurrent+8]=this.st_avi_peligro
this.Control[iCurrent+9]=this.p_inc_asign
this.Control[iCurrent+10]=this.d_aviso
this.Control[iCurrent+11]=this.sle_esq_cond
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.d_ambito
this.Control[iCurrent+14]=this.p_avi_calidad
this.Control[iCurrent+15]=this.st_avi_calidad
this.Control[iCurrent+16]=this.p_sin_alim
this.Control[iCurrent+17]=this.p_de_alumbrado
this.Control[iCurrent+18]=this.st_sin_alim
this.Control[iCurrent+19]=this.st_de_alumbrado
this.Control[iCurrent+20]=this.cb_obs_improc
this.Control[iCurrent+21]=this.st_ubicacion_t
this.Control[iCurrent+22]=this.p_de_ayuda
this.Control[iCurrent+23]=this.p_brig_enviada
this.Control[iCurrent+24]=this.p_aviso_anulado
this.Control[iCurrent+25]=this.st_de_ayuda
this.Control[iCurrent+26]=this.p_area
this.Control[iCurrent+27]=this.st_tiempo
this.Control[iCurrent+28]=this.dw_1
this.Control[iCurrent+29]=this.dw_indices
this.Control[iCurrent+30]=this.cb_2
this.Control[iCurrent+31]=this.st_brig_enviada
this.Control[iCurrent+32]=this.st_aviso_anulado
this.Control[iCurrent+33]=this.st_ubicacion
this.Control[iCurrent+34]=this.cb_1
this.Control[iCurrent+35]=this.p_dir_electrica
this.Control[iCurrent+36]=this.st_dir_elec_t
this.Control[iCurrent+37]=this.p_2
this.Control[iCurrent+38]=this.p_1
this.Control[iCurrent+39]=this.p_avi_peligro
this.Control[iCurrent+40]=this.p_esencial
this.Control[iCurrent+41]=this.st_cli_imp
this.Control[iCurrent+42]=this.gb_1
this.Control[iCurrent+43]=this.p_cli_imp
end on

on w_1203_inf_aviso.destroy
call super::destroy
destroy(this.d_cliente)
destroy(this.d_direccion)
destroy(this.p_ord_corte)
destroy(this.st_inc_asign)
destroy(this.st_ord_corte)
destroy(this.st_nom_inc)
destroy(this.st_esencial)
destroy(this.st_avi_peligro)
destroy(this.p_inc_asign)
destroy(this.d_aviso)
destroy(this.sle_esq_cond)
destroy(this.st_1)
destroy(this.d_ambito)
destroy(this.p_avi_calidad)
destroy(this.st_avi_calidad)
destroy(this.p_sin_alim)
destroy(this.p_de_alumbrado)
destroy(this.st_sin_alim)
destroy(this.st_de_alumbrado)
destroy(this.cb_obs_improc)
destroy(this.st_ubicacion_t)
destroy(this.p_de_ayuda)
destroy(this.p_brig_enviada)
destroy(this.p_aviso_anulado)
destroy(this.st_de_ayuda)
destroy(this.p_area)
destroy(this.st_tiempo)
destroy(this.dw_1)
destroy(this.dw_indices)
destroy(this.cb_2)
destroy(this.st_brig_enviada)
destroy(this.st_aviso_anulado)
destroy(this.st_ubicacion)
destroy(this.cb_1)
destroy(this.p_dir_electrica)
destroy(this.st_dir_elec_t)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.p_avi_peligro)
destroy(this.p_esencial)
destroy(this.st_cli_imp)
destroy(this.gb_1)
destroy(this.p_cli_imp)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1203_inf_aviso
integer x = 590
integer y = 376
end type

type d_cliente from u_avi_2014_pr_form_id_cliente2 within w_1203_inf_aviso
event ue_habilitar_campos pbm_custom47
integer x = 14
integer y = 840
integer width = 2885
integer height = 232
integer taborder = 70
borderstyle borderstyle = styleraised!
end type

event ue_habilitar_campos;
IF pb_cond  = 1 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("nombre.background.color=" + string(65536*255+256*255+255) +&
//			 "~t ape1.background.color=" + string(65536*255+256*255+255) +&
//			 "~t ape2.background.color=" + string(65536*255+256*255+255) +&
//			 "~t tfno_cli.background.color=" + string(65536*255+256*255+255))
	this.modify("nombre.background.color=" + gs_blanco +&
			 "~t ape1.background.color=" + gs_blanco +&
			 "~t ape2.background.color=" + gs_blanco +&
			 "~t tfno_cli.background.color=" + gs_blanco +&
			 "~t nis_rad.background.color=" + gs_blanco) // GNU 26-10-2005. Mejora: 1/335502 
// Fin. Sgo.
	this.SetTabOrder("ape1",10)
	this.SetTabOrder("ape2",20)
	this.SetTabOrder("nombre",30)
	this.SetTabOrder("tfno_cli",40)
	this.SetTabOrder("nis_rad",50) // GNU 26-10-2005. Mejora: 1/335502 
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("nombre.background.color=" + string(65536*192+256*192+192) +&
//			 "~t ape1.background.color=" + string(65536*192+256*192+192) +&
//			 "~t ape2.background.color=" + string(65536*192+256*192+192) +&
//			 "~t tfno_cli.background.color=" + string(65536*192+256*192+192))
	this.modify("nombre.background.color=" + gs_gris +&
			 "~t ape1.background.color=" + gs_gris +&
			 "~t ape2.background.color=" + gs_gris +&
			 "~t tfno_cli.background.color=" + gs_gris +&
			  "~t nis_rad.background.color=" + gs_gris) // GNU 26-10-2005. Mejora: 1/335502 
// Fin. Sgo.
	this.SetTabOrder("nombre",0)
	this.SetTabOrder("ape1",0)
	this.SetTabOrder("ape2",0)
	this.SetTabOrder("tfno_cli",0)
	this.SetTabOrder("nis_rad",0) // GNU 26-10-2005. Mejora: 1/335502 
END IF

end event

type d_direccion from u_dir_2011_pr_direccion_std within w_1203_inf_aviso
event ue_habilitar_campos pbm_custom17
integer x = 9
integer y = 36
integer width = 2885
integer height = 488
integer taborder = 10
borderstyle borderstyle = styleraised!
end type

event ue_habilitar_campos;IF pb_dir_global = 1 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//    this.modify("Provincia.background.color= " + string(65536*255+256*255+255))
//	 this.modify("depto.background.color= " + string(65536*255+256*255+255))
//	 this.modify("Municipio.background.color= " + string(65536*255+256*255+255))
//	 this.modify("Localidad.background.color= " + string(65536*255+256*255+255))
    this.modify("Provincia.background.color= " + gs_blanco)
	 this.modify("depto.background.color= " + gs_blanco)
	 this.modify("Municipio.background.color= " + gs_blanco)
	 this.modify("Localidad.background.color= " + gs_blanco)
// Fin. Sgo.
    this.SetTabOrder("Provincia",10)
    this.SetTabOrder("depto",20)
    this.SetTabOrder("Municipio",30)
    this.SetTabOrder("Localidad",40)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("Provincia.background.color=" + string(65536*192+256*192+192) +&
//			 "~t depto.background.color=" + string(65536*192+256*192+192) +&
//			 "~t Municipio.background.color=" + string(65536*192+256*192+192)+&
//			 "~t Localidad.background.color=" + string(65536*192+256*192+192))
	this.modify("Provincia.background.color=" + gs_gris +&
			 "~t depto.background.color=" + gs_gris +&
			 "~t Municipio.background.color=" + gs_gris +&
			 "~t Localidad.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("Provincia",0)
	this.SetTabOrder("depto",0)
	this.SetTabOrder("Municipio",0)
	this.SetTabOrder("Localidad",0)
END IF

IF pb_dir_particular = 1 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("calle.background.color=" + string(65536*255+256*255+255) +&
//			"~t numero.background.color=" + string(65536*255+256*255+255) +&
//			"~t duplic.background.color=" + string(65536*255+256*255+255)+&
//			"~t cgv.background.color=" + string(65536*255+256*255+255))
	this.modify("calle.background.color=" + gs_blanco +&
			"~t numero.background.color=" + gs_blanco +&
			"~t duplic.background.color=" + gs_blanco +&
			"~t cgv.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("calle",50)
	this.SetTabOrder("numero",60)
	this.SetTabOrder("duplic",70)
	this.SetTabOrder("cgv",80)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("calle.background.color=" + string(65536*192+256*192+192) +&
//			"~t numero.background.color=" + string(65536*192+256*192+192) +&
//			"~t duplic.background.color=" + string(65536*192+256*192+192) +&
//			"~t cgv.background.color=" + string(65536*192+256*192+192))
	this.modify("calle.background.color=" + gs_gris +&
			"~t numero.background.color=" + gs_gris +&
			"~t duplic.background.color=" + gs_gris +&
			"~t cgv.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("calle",0)
	this.SetTabOrder("numero",0)
	this.SetTabOrder("duplic",0)
	this.SetTabOrder("cgv",0)
END IF
end event

type p_ord_corte from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3013
integer y = 184
integer width = 128
integer height = 100
integer taborder = 90
boolean enabled = false
string picturename = ".\recursos\SEMAF2.BMP"
boolean focusrectangle = false
end type

type st_inc_asign from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 288
integer width = 407
integer height = 48
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Incidencia Asociada"
boolean focusrectangle = false
end type

type st_ord_corte from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 200
integer width = 407
integer height = 60
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Orden de Corte"
boolean focusrectangle = false
end type

type st_nom_inc from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 348
integer width = 407
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Incid.:"
boolean focusrectangle = false
end type

type st_esencial from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3154
integer y = 632
integer width = 320
integer height = 60
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Carga Esencial"
boolean focusrectangle = false
end type

type st_avi_peligro from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 724
integer width = 407
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Aviso de Peligro"
boolean focusrectangle = false
end type

type p_inc_asign from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3017
integer y = 292
integer width = 123
integer height = 104
integer taborder = 110
string pointer = "MANOOK.CUR"
boolean enabled = false
string picturename = ".\recursos\SEMAF2.BMP"
boolean focusrectangle = false
end type

event constructor;This.enabled = (gu_comunic.is_comunic.programa_llamante = "w_1233_consulta_aviso") or &
				   (gu_comunic.is_comunic.programa_llamante = "w_1201_avi")
end event

event doubleclicked;char ll_tip_int
int li_est_incidencia
SetPointer(HourGlass!)

//ll_tip_int = iu_avi_2004_nu.fnu_v_interrup_total(iu_avi_2004_nu.&
//					is_avisos.gl_nro_incidencia) 
//
//IF ll_tip_int = fgcs_interrupcion_ultimo_nivel() OR &
//		ll_tip_int = fgcs_interrupcion_total() THEN

	gu_comunic.is_comunic.programa_llamante = "w_1203"
	gu_comunic.is_comunic.accion_llamada = "Consulta"

	gu_comunic.is_comunic.longval3 = istr_avisos.gl_nro_incidencia 
	
	SELECT EST_ACTUAL
	INTO :li_est_incidencia
	FROM (SELECT EST_ACTUAL FROM SGD_INCIDENCIA WHERE NRO_INCIDENCIA = :gu_comunic.is_comunic.longval3 
			UNION
			SELECT EST_ACTUAL FROM GI_HIST_INCIDENCIAS WHERE NRO_INCIDENCIA = :gu_comunic.is_comunic.longval3);
			
	IF SQLCA.SQLCode <> 0 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido determinar la incidencia")
	ELSE
		IF li_est_incidencia = fgci_incidencia_resuelta THEN
			gu_comunic.is_comunic.programa_llamante="Hist_Inci"
		END IF
//	gu_comunic.is_comunic.decval1  = istr_avisos.gl_nro_instalacion

//	Open(w_2301_form_incidencia)
//	gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",0,1,w_1203_inf_aviso,"w_1203_inf_aviso")	

//OpenSheet(w_2301_form_incidencia,w_1203_inf_aviso,4,Original!)
		//gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
		OpenSheet (w_2301_form_incidencia, w_genapp_frame, menu, layered!)
	END IF

//ELSE
//	pardec1 = istr_avisos.gl_nro_instalacion
//	Open(w_1108_list_incid_afectan)
//END IF

end event

type d_aviso from u_avi_2015_pr_form_obs2 within w_1203_inf_aviso
event ue_habilitar_campos pbm_custom22
integer x = 9
integer y = 1104
integer width = 3538
integer height = 1040
integer taborder = 60
borderstyle borderstyle = styleraised!
end type

event ue_habilitar_campos;IF pb_avi_cond = 1 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("co_alcance.background.color=" + string (65536*255+256*255+255) +&
//			 "~t tip_aviso.background.color=" + string(65536*255+256*255+255) +&
//			 "~t nro_aviso.background.color=" + string(65536*255+256*255+255) +&
//			 "~t f_alta.background.color=" + string(65536*255+256*255+255) +&
//			 "~t est_aviso.background.color=" + string(65536*255+256*255+255) +&
//			 "~t obs_telegestiones.background.color=" + string(65536*192+256*192+192)+&
//			 "~t obs_cmd.background.color=" + string(65536*192+256*192+192)+&
//			 "~t nro_llamadas.background.color=" + string(65536*255+256*255+255) +&
//			 "~t ind_improcedente.background.color=" + string(65536*255+256*255+255))
	this.modify("co_alcance.background.color=" + gs_blanco +&
			 "~t tip_aviso.background.color=" + gs_blanco +&
			 "~t nro_aviso.background.color=" + gs_blanco +&
			 "~t f_alta.background.color=" + gs_blanco +&
			 "~t est_aviso.background.color=" + gs_blanco +&
			 "~t obs_telegestiones.background.color=" + gs_gris +&
			 "~t obs_cmd.background.color=" + gs_gris +&
			 "~t nro_llamadas.background.color=" + gs_blanco +&
			 "~t ind_improcedente.background.color=" + gs_blanco +&
			 "~t fecha_ultimo_aviso.background.color=" + gs_blanco) // A$$HEX1$$f100$$ENDHEX$$adido por GNU.
// Fin. Sgo.
	this.SetTabOrder("co_alcance",10)
	this.SetTabOrder("tip_aviso",20)
	this.SetTabOrder("nro_aviso",30)
	this.SetTabOrder("f_alta",40)
	this.SetTabOrder("est_aviso",50)
	this.SetTabOrder("obs_telegestiones",70)
	This.Modify("obs_telegestiones.Edit.DisplayOnly = no")
	this.SetTabOrder("obs_cmd",80)
	This.Modify("obs_cmd.Edit.DisplayOnly = no")
	this.SetTabOrder("nro_llamadas",90)
	this.SetTabOrder("ind_improcedente",100)
	this.SetTabOrder("fecha_ultimo_aviso",110) // A$$HEX1$$f100$$ENDHEX$$adido por GNU.
ELSEIF NOT pb_avi_cond = 1 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("co_alcance.background.color=" + string(65536*192+256*192+192) +&
//			 "~t tip_aviso.background.color=" + string(65536*192+256*192+192) +&
//			 "~t nro_aviso.background.color=" + string(65536*192+256*192+192) +&
//			 "~t f_alta.background.color=" + string(65536*192+256*192+192) +&
//			 "~t est_aviso.background.color=" + string(65536*192+256*192+192) +&
//			 "~t obs_telegestiones.background.color=" + string(65536*255+256*255+255) +&
//			 "~t obs_cmd.background.color=" + string(65536*255+256*255+255) +&
//			 "~t nro_llamadas.background.color=" + string(65536*192+256*192+192)+&
//			 "~t ind_improcedente.background.color=" + string(65536*192+256*192+192))
	this.modify("co_alcance.background.color=" + gs_gris +&
			 "~t tip_aviso.background.color=" + gs_gris +&
			 "~t nro_aviso.background.color=" + gs_gris +&
			 "~t f_alta.background.color=" + gs_gris +&
			 "~t est_aviso.background.color=" + gs_gris +&
			 "~t obs_telegestiones.background.color=" + gs_blanco +&
			 "~t obs_cmd.background.color=" + gs_blanco +&
			 "~t nro_llamadas.background.color=" + gs_gris +&
			 "~t ind_improcedente.background.color=" + gs_gris +&
			 "~t fecha_ultimo_aviso.background.color=" + gs_gris) // A$$HEX1$$f100$$ENDHEX$$adido por GNU.
// Fin. Sgo.
	this.SetTabOrder("co_alcance",0)
	this.SetTabOrder("tip_aviso",0)
	this.SetTabOrder("nro_aviso",0)
	this.SetTabOrder("f_alta",0)
	this.SetTabOrder("est_aviso",0)
//	this.SetTabOrder("obs_telegestiones",0)
   This.Modify("obs_telegestiones.Edit.DisplayOnly = yes")
//	this.SetTabOrder("obs_cmd",0)
	 This.Modify("obs_cmd.Edit.DisplayOnly = yes")
	this.SetTabOrder("nro_llamadas",0)
	this.SetTabOrder("ind_improcedente",0)
	this.SetTabOrder("fecha_ultimo_aviso",0) // A$$HEX1$$f100$$ENDHEX$$adido por GNU.
END IF

IF pb_avi_cond2 = 1 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("prioridad.background.color=" + string(65536*255+256*255+255))
	this.modify("prioridad.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("prioridad",60)
ELSEIF NOT pb_avi_cond2 = 1 THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("prioridad.background.color=" + string(65536*192+256*192+192))
	this.modify("prioridad.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("prioridad",0)
END IF

// Parametrizo el n$$HEX1$$fa00$$ENDHEX$$mero de aviso //MERC

IF gl_nro_aviso_visible THEN
	This.Object.Nro_Aviso.Visible = 1
ELSE
	This.Object.Nro_Aviso.Visible = 0
	This.Object.st_nro_aviso.Visible = 0
END IF

//***************************************
//**  OSGI 2001.1  	05/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.SetTabOrder("obs_telegestiones",70)
//***************************************
//**  OSGI 2001.1  	05/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event itemchanged;call super::itemchanged;ib_hubo_cambios=true
end event

event ue_soltar_click;//
end event

event ue_soltar_clicked;//
end event

event constructor;call super::constructor;IF fg_verifica_parametro('INDICADORES_RUR')=FALSE AND fg_verifica_parametro('INDICADORES_URB')=FALSE THEN
	this.object.saifi_t.visible=0
	this.object.saidi_t.visible=0
	this.object.saifi_oc.visible=0
	this.object.saidi_oc.visible=0
	this.object.gb_indicadores.visible=0
END IF


//inc = tabpage_formulario.d_inf_general.GetItemDatetime(1, 'f_alta')

///MessageBox("mensaje",string(This.GetItemDateTime(1, 'F_ULTIMO_AVISO')))
end event

type sle_esq_cond from singlelineedit within w_1203_inf_aviso
integer x = 850
integer y = 368
integer width = 1586
integer height = 84
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_1203_inf_aviso
integer x = 142
integer y = 380
integer width = 709
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Esquina/Condominio:"
boolean focusrectangle = false
end type

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_1203_inf_aviso
integer x = 41
integer y = 1128
integer width = 1001
integer taborder = 20
boolean bringtotop = true
boolean border = false
end type

event itemchanged;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ITEMCHANGED
//
// Objetivo: SELECCIONA / HABILITA / DESHABILITA LAS DDDW.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 
//		
/////////////////////////////////////////////////////////// 

// No se ejecuta el script del padre porque nunca se habilitar$$HEX1$$e100$$ENDHEX$$n el cdm o la zona -> s$$HEX1$$f300$$ENDHEX$$lo
// se podr$$HEX2$$e1002000$$ENDHEX$$modificar el sector en caso de que el usuario tenga permisos. (LFE)

int li_todos,li_conta
int li_valor

ib_hubo_cambios=true

This.SetRedraw(False)
li_todos=fgci_todos
String ls_columna
ls_columna=this.getcolumnname()

long ll_nro_centro


IF ls_columna = "nro_mesa" THEN
		
	li_valor=Integer(this.gettext())

	if li_valor <> li_todos THEN

		//THIS.FNU_HABI_CENTRO()
		//THIS.FNU_HABI_CMD()
				
		// setea el centro
					
		SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
		INTO :ll_nro_centro  
		FROM "SGD_RELACION_CENTRO"  
		WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
				( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 1 ) AND 
				( "SGD_RELACION_CENTRO"."CENTRO_RESP" <> 98 );

		This.object.nro_centro[1]=ll_nro_centro
		
		// setea el CMD
					
		This.fnu_filtro_cmd_n()										
				
		SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
		INTO :ll_nro_centro  
		FROM "SGD_RELACION_CENTRO"  
		WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
				( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 2 ) AND
				( "SGD_RELACION_CENTRO"."CENTRO_RESP" <> 98 );

		This.object.nro_cmd[1]=ll_nro_centro
				
	else
		if ii_criterio = 1 then
			This.SetItem(1,"nro_centro",ii_centro_entrada)
		elseif ii_criterio = 2 then
			This.SetItem(1,"nro_cmd",ii_cmd_entrada)
		end if

		This.SetItem(1,"nro_mesa",li_todos)
				
		IF ii_criterio = 1 OR ii_criterio = 2 THEN
			if ii_cmd_entrada<>0 then 
				fnu_des_centro()
			elseif ii_centro_entrada<>0 then 
				fnu_des_cmd()
			else
				fnu_des_puesto()
			end if
		END IF
	END IF
elseif ls_columna = "nro_cmd" then
		
		li_valor=Integer(this.gettext())
		If li_valor=li_todos THEN
			This.SetItem(1,"nro_mesa",li_todos)
			This.fnu_des_puesto()
			this.fnu_habi_centro()
			this.object.nro_centro[1] = li_todos
		ELSE
			This.SetItem(1,"nro_mesa",li_todos)
			this.object.nro_centro[1] = li_todos
			THIS.FNU_DES_CENTRO()
			This.fnu_filtro_mesa_n()
			This.fnu_habi_puesto()
			ii_centro_entrada=li_todos
			ii_cmd_entrada=li_valor
		END IF
end if

This.SetRedraw(true)



end event

type p_avi_calidad from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3003
integer y = 784
integer width = 96
integer height = 72
boolean enabled = false
string picturename = ".\recursos\ACTIV_IM.BMP"
boolean focusrectangle = false
end type

type st_avi_calidad from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 800
integer width = 407
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Aviso de Calidad"
boolean focusrectangle = false
end type

type p_sin_alim from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3017
integer y = 436
integer width = 110
integer height = 92
boolean enabled = false
string picturename = ".\recursos\COR_PRO1.BMP"
boolean focusrectangle = false
end type

type p_de_alumbrado from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3031
integer y = 436
integer width = 73
integer height = 64
boolean enabled = false
string picturename = ".\recursos\alumbrado.bmp"
boolean focusrectangle = false
end type

type st_sin_alim from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 472
integer width = 407
integer height = 60
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Sin Alimentaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type st_de_alumbrado from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 420
integer width = 407
integer height = 96
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Alumbrado P$$HEX1$$fa00$$ENDHEX$$blico"
boolean focusrectangle = false
end type

type cb_obs_improc from commandbutton within w_1203_inf_aviso
boolean visible = false
integer x = 1934
integer y = 1788
integer width = 722
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Gesti$$HEX1$$f300$$ENDHEX$$n Improcedente"
end type

event clicked;//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
string ls_observaciones
long ll_nro_aviso

ll_nro_aviso = d_aviso.GetItemNumber(d_aviso.GetRow(), "nro_aviso")
// TDA.INI.EDM-3.19052017

//SELECT "GI_AVISOS"."OBS_IMPROC"  
//  INTO :ls_observaciones  
//  FROM "GI_AVISOS"  
// WHERE "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso   ;

// Se manda como parametro al a ventana el nro de aviso
OpenWithParm(w_mensaje_improcedente, string(ll_nro_aviso))
// TDA.FIN.EDM-3.19052017
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type st_ubicacion_t from statictext within w_1203_inf_aviso
integer x = 41
integer y = 680
integer width = 320
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Referencia:"
boolean focusrectangle = false
end type

type p_de_ayuda from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3031
integer y = 436
integer width = 73
integer height = 64
string picturename = ".\recursos\ACUERDO.BMP"
boolean focusrectangle = false
end type

type p_brig_enviada from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3013
integer y = 512
integer width = 128
integer height = 108
integer taborder = 100
string pointer = "MANOOK.CUR"
boolean enabled = false
string picturename = ".\recursos\MANTE3.BMP"
boolean focusrectangle = false
end type

event doubleclicked;// GNU 2-5-2006. Mejora 1/339429
u_avi_1002_nu_generico u_avi_1002_nu
u_avi_2004_pr_form_inf_resumen u_avi_2004_pr
long ll_nro_instalacion, ll_ind_cli_imp, ll_ind_peligro
datetime ldt_f_actual
long ll_res_bloqueo
long ll_tipo_aviso

//ldt_f_actual=fgnu_fecha_actual()

	
ll_tipo_aviso=d_aviso.getitemnumber(1,"tip_aviso")
if iu_gen_comunic.is_comunic.programa_llamante <> "w_1105_avi" THEN
	SELECT "GI_AVISOS"."F_ACTUAL"
	INTO :ldt_f_actual
	FROM "GI_AVISOS"  
	WHERE "GI_AVISOS"."NRO_AVISO" = : iu_gen_comunic.is_comunic.longval1;	
	
//	ll_res_bloqueo=gnu_u_transaction.uf_bloquea_avisos( ldt_f_actual, fgci_bloq_ot_suministro, iu_gen_comunic.is_comunic.longval1)
end if

select nro_ot, f_alta, nro_instalacion, ind_cli_imp, ind_peligro
into :gu_comunic1.is_comunic.longval2, :gu_comunic1.is_comunic.datval1, :ll_nro_instalacion, :ll_ind_cli_imp, :ll_ind_peligro
from gi_avisos
where nro_aviso = :iu_gen_comunic.is_comunic.longval1;

// GNU 12-7-2007. Mejora 23 (Avisos)
IF d_aviso.getitemnumber(1,"est_aviso")<>fgci_aviso_resuelto THEN
	ll_res_bloqueo=gnu_u_transaction.uf_lock(parent, "GI_OT", "NRO_OT=" + string(gu_comunic1.is_comunic.longval2),fgci_bloqueo_ot,gu_comunic1.is_comunic.longval2)
	if ll_res_bloqueo<>0 or &
		d_aviso.getitemnumber(1,"est_aviso")<>fgci_aviso_enviado_brigada or &
		((gu_perfiles.of_acceso_perfil(gi_perfil,'CONS_OT','ACC_MANTEN')<> 1) OR &
		(gu_perfiles.of_acceso_perfil(gi_perfil,'GAV_C_INC_SUM','ACC_MANTEN') = 0)) then
		gu_comunic1.is_comunic.accion_llamada = "Consulta"
	else
		gu_comunic1.is_comunic.accion_llamada = "Modificacion"
	end if
ELSE
	gu_comunic1.is_comunic.accion_llamada = "Consulta"
end if

gu_comunic1.is_comunic.longval3 =iu_gen_comunic.is_comunic.longval1;
gu_comunic1.is_comunic.intval3 = gi_nro_centro
gu_comunic1.is_comunic.intval4 = gi_nro_cmd
gu_comunic1.is_comunic.intval5 = gi_nro_puesto
gu_comunic1.is_comunic.programa_llamante = "w_1203_inf_aviso"
					
OPEN(w_6201_asignacion_de_brigada)
gnu_u_transaction.uf_commit( parent, "GI_OT", "NRO_OT=" + STRING(gu_comunic1.is_comunic.longval2),fgci_bloqueo_ot,gu_comunic1.is_comunic.longval2)
if iu_gen_comunic.is_comunic.programa_llamante <> "w_1105_avi" THEN
	ldt_f_actual=fgnu_fecha_actual()
	UPDATE "GI_AVISOS"
	SET "F_ACTUAL"=:ldt_f_actual  
	WHERE "GI_AVISOS"."NRO_AVISO" = : iu_gen_comunic.is_comunic.longval1;
	gnu_u_transaction.uf_desbloquea_avisos( iu_gen_comunic.is_comunic.longval1, 1) //Commit
end if

u_avi_1002_nu = CREATE u_avi_1002_nu_generico
u_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen
IF gu_comunic1.is_comunic.accion_retorno = "Asignada" THEN
	u_avi_1002_nu.fnu_asignar_brigada_avi(gu_comunic1.is_comunic.longval2,iu_gen_comunic.is_comunic.longval1)
ELSEIF gu_comunic1.is_comunic.accion_retorno = "Finalizada" THEN
	d_aviso.setitem(1,"est_aviso", fgci_aviso_resuelto)
	u_avi_1002_nu.fnu_asignar_brigada_avi(gu_comunic1.is_comunic.longval2, iu_gen_comunic.is_comunic.longval1)
	u_avi_2004_pr.fpr_act_avi_por_fin_ot(iu_gen_comunic.is_comunic.longval1, ll_nro_instalacion,ll_ind_cli_imp, ll_ind_peligro)
END IF

DESTROY u_avi_1002_nu
DESTROY u_avi_2004_pr
	
				

end event

type p_aviso_anulado from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3017
integer y = 520
integer width = 105
integer height = 88
boolean enabled = false
string picturename = "anulado.bmp"
boolean invert = true
boolean focusrectangle = false
end type

type st_de_ayuda from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3136
integer y = 472
integer width = 398
integer height = 60
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Aviso de Ayuda"
boolean focusrectangle = false
end type

type p_area from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3017
integer y = 88
integer width = 96
integer height = 84
boolean bringtotop = true
boolean originalsize = true
string picturename = ".\recursos\muy_alta_densidad.bmp"
boolean focusrectangle = false
end type

event clicked;messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El Area Representativa para el aviso es: " + is_area + ", y pertenece al Poblado: " + istr_avisos.gs_poblacion )
end event

type st_tiempo from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 100
integer width = 407
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "6 Horas"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_1203_inf_aviso
boolean visible = false
integer x = 96
integer y = 1148
integer width = 1829
integer height = 776
integer taborder = 120
string dataobject = "d_inf_aviso_imp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_indices from datawindow within w_1203_inf_aviso
boolean visible = false
integer x = 2341
integer y = 812
integer width = 1166
integer height = 444
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_indicadores_aviso"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;// LFE - Mejora 1/262335

This.SetTransObject(SQLCA)
end event

event retrieveend;// Se obtienen y se insertan los valores l$$HEX1$$ed00$$ENDHEX$$mite en la dw
// teniendo en cuanta la fecha de alta.

Datetime ldt_f_alta
long ll_saifi_limite, ll_nro_instalacion
Double ldb_saidi_limite
String ls_tipo_area_sum

IF rowcount > 0 THEN
	ldt_f_alta = This.GetItemDatetime(1, 'f_alta')
	ll_nro_instalacion = This.GetItemNumber(1, 'nro_instalacion')
	
	// Se determina el $$HEX1$$e100$$ENDHEX$$rea del suministro
	SELECT FGNU_TIPO_AREA(SGD_ACOMETIDA.INSTALACION_ORIGEN)
	INTO :ls_tipo_area_sum
	FROM SGD_ACOMETIDA
	WHERE CODIGO = :ll_nro_instalacion AND BDI_JOB = 0;

	IF SQLCA.SQLCOde = 0 THEN
		IF ls_tipo_area_sum = 'U' OR ls_tipo_area_sum = 'C' THEN
			ls_tipo_area_sum = 'U'
		END IF
	END IF
	
	SELECT SAIFI_LIMITE, SAIDI_LIMITE
	INTO :ll_saifi_limite, :ldb_saidi_limite
	FROM GI_PERIODOS_PENALIZACION 
	WHERE F_INICIO <= TO_DATE(TO_CHAR(:ldt_f_alta, 'DD/MM/YYYY'), 'DD/MM/YYYY') AND
			F_FIN >= TO_DATE(TO_CHAR(:ldt_f_alta, 'DD/MM/YYYY'), 'DD/MM/YYYY') AND 
			TIPO_AREA = :ls_tipo_area_sum;
			
	IF SQLCA.SQLCode = 0 THEN
		This.SetItem(1, 'limite_saifi', ll_saifi_limite)
		This.SetItem(1, 'limite_saidi', ldb_saidi_limite)
	END IF
	
END IF
end event

type cb_2 from commandbutton within w_1203_inf_aviso
integer x = 3136
integer y = 1524
integer width = 375
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Desglose"
end type

event clicked;IF dw_indices.visible = FAlSE THEN
	dw_indices.visible = TRUE
	This.Text = '&Ocultar'
ELSE
	dw_indices.visible = FALSE
	This.Text = '&Desglose'
END IF
	
end event

event constructor;// LFE - Mejora 1/262335

//This.visible = fg_verifica_parametro('INDICADORES_RUR') OR fg_verifica_parametro('INDICADORES_URB')
end event

type st_brig_enviada from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3136
integer y = 552
integer width = 398
integer height = 64
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Brigada trabajando"
boolean focusrectangle = false
end type

type st_aviso_anulado from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 544
integer width = 407
integer height = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Aviso Anulado"
boolean focusrectangle = false
end type

type st_ubicacion from multilineedit within w_1203_inf_aviso
integer x = 370
integer y = 668
integer width = 1600
integer height = 156
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "none"
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_1203_inf_aviso
integer x = 1541
integer y = 2016
integer width = 393
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_direccion, dwc_cliente, dwc_aviso, dwc_ambito
// LFE - Mejora 1/262335
DataWindowChild dwc_ind
// LFE - Fin Mejora 1/262335
string ls_titulo, ls_calle, ls_tipo_via
long ll_longitud
string ls_syntax

/*** LSH *** INI *** DDAG-845- *** 11/11/2014 */
integer li_imp
/*** LSH *** FIN *** DDAG-845- *** 11/11/2014 */

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Aviso'
ll_longitud = len (ls_titulo)*100
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_1.getchild ("d_direccion_imp",dwc_direccion)
//d_direccion.sharedata(dwc_direccion)// GNU 23-8-2007. Incidencia 0/523077
//ahm (13/05/2009) Incidencia 0/100070213
//If gb_tipos_de_via Then
If gb_tipos_de_via AND dwc_direccion.rowcount() > 0 Then
	ls_calle = dwc_direccion.getitemString(1,"calle")
	ls_tipo_via = dwc_direccion.getitemString(1,"c_desc_tipo")
	dwc_direccion.setitem(1, "calle", dwc_direccion.getitemString(1,"c_tipo_via_t"))
	dwc_direccion.setitem(1, "c_desc_tipo", '')	
End If

// GNU 17-1-2006. Incidencia 1/399301
If fg_verifica_parametro('GEO') and gi_pais = 4 Then 
	dw_1.object.d_direccion_imp.x=85
	dw_1.Modify("depto_t.visible= '1'")
	dw_1.Modify("localidad_t.visible =  '1'")
	dw_1.Modify("municipio_t.visible = '1'")
	dw_1.SetPosition("depto_t", "", TRUE)
	dw_1.SetPosition("localidad_t", "", TRUE)
	dw_1.SetPosition("municipio_t", "", TRUE)
End If
// FIN GNU

lst_impresion.pa_todos[1]=d_direccion
lst_impresion.pa_nombres[1]='d_direccion_imp'

dw_1.getchild ("d_cliente_imp",dwc_cliente)
//d_cliente.sharedata(dwc_cliente)// GNU 23-8-2007. Incidencia 0/523077
lst_impresion.pa_todos[2]=d_cliente
lst_impresion.pa_nombres[2]='d_cliente_imp'

dw_1.getchild ("d_avi_imp",dwc_aviso)
//d_aviso.sharedata(dwc_aviso)// GNU 23-8-2007. Incidencia 0/523077
lst_impresion.pa_todos[3]=d_aviso
lst_impresion.pa_nombres[3]='d_avi_imp'
dwc_aviso.modify("co_alcance.visible='0'")
dwc_aviso.modify("tip_aviso.visible='0'")
dwc_aviso.modify("prioridad.visible='0'")

dw_1.getchild ("d_ambito_imp",dwc_ambito)
//d_ambito.sharedata(dwc_ambito)// GNU 23-8-2007. Incidencia 0/523077
lst_impresion.pa_todos[4]=d_ambito
lst_impresion.pa_nombres[4]='d_ambito_imp'
dwc_ambito.modify("nro_centro.visible='0'")
dwc_ambito.modify("nro_cmd.visible='0'")
dwc_ambito.modify("nro_mesa.visible='0'")

// LFE - Mejora 1/262335
dw_1.getchild ("d_indicadores",dwc_ind)
//dw_indices.sharedata(dwc_ind)// GNU 23-8-2007. Incidencia 0/523077
lst_impresion.pa_todos[5]=dw_indices
lst_impresion.pa_nombres[5]='d_indicadores'
// LFE - Fin Mejora 1/262335

// Verifico y prendo los indicativos
IF istr_avisos.gi_ind_peligro = 1 THEN
	dw_1.modify("p_avi_peligro.Visible='1'")
	dw_1.modify("st_avi_peligro.Visible='1'")
END IF

/*** LSH *** INI *** DDAG-845- *** 11/11/2014 */
//IF istr_avisos.gi_ind_cli_imp = 1 THEN
//	dw_1.modify("p_cli_imp.Visible='1'")
//	dw_1.modify("st_cli_imp.Visible='1'")
//END IF
li_imp = fw_a_importante(istr_avisos.gl_nis_rad)

//li_imp = d_inf_resumen.fpr_v_importante(is_direccion.gl_nis)
 
IF  li_imp = 1 THEN
	IF istr_avisos.gi_ind_cli_esen = 1 THEN
		// Es cliente importante, entonces muestro indicativo
		//p_cli_imp.Hide()
		//st_cli_imp.Hide()	
		
		dw_1.modify("p_cli_imp.Visible='0'")
		dw_1.modify("st_cli_imp.Visible='0'")
		
		//p_esencial.PictureName = ".\recursos\" + istr_avisos.gs_img_carga
		dw_1.Modify("p_esencial.Filename='.\recursos\" + istr_avisos.gs_img_carga + "'")
		
		//p_esencial.show()
		//st_esencial.Show()
		
		dw_1.modify("p_esencial.Visible='1'")
		dw_1.modify("st_esencial.Visible='1'")
		
	ELSE
		//p_cli_imp.Show()
		//st_cli_imp.Show()
		dw_1.modify("p_cli_imp.Visible='1'")
		dw_1.modify("st_cli_imp.Visible='1'")
	END IF
	
ELSEIF li_imp = -1 THEN
	//ib_error = True
	RETURN
ELSE
	//p_esencial.Hide()
	//st_esencial.Hide()
	dw_1.modify("p_esencial.Visible='0'")
	dw_1.modify("st_esencial.Visible='0'")

	//p_cli_imp.Hide()
	//st_cli_imp.Hide()
	dw_1.modify("p_cli_imp.Visible='0'")
	dw_1.modify("st_cli_imp.Visible='0'")
END IF
/*** LSH *** FIN *** DDAG-845- *** 11/11/2014 */






IF istr_avisos.gl_nro_incidencia <> 0 THEN
	
	// Obtiene los datos de la incidencia asociada

//	st_fecha_det.Text = String(ldt_f_deteccion)
	dw_1.modify("st_nom_inc.Text = '" + is_desc_incidencia + "'")
//	st_fecha_det.Show()
	dw_1.modify("st_nom_inc.Visible='1'")
	dw_1.modify("p_inc_asign.Visible='1'")
	dw_1.modify("st_inc_asign.Visible='1'")
END IF

if lefttrim(st_ubicacion.text) <> "" then
	dw_1.object.st_referencia.text = 'Ref. : ' + st_ubicacion.text 
	dw_1.object.st_referencia.visible = true
end if


IF istr_avisos.gl_nro_instalacion = fgcdec_aviso_sin_alimentacion THEN
	dw_1.modify("p_sin_alim.Visible='1'")
	dw_1.modify("st_sin_alim.Visible='1'")
ELSEIF istr_avisos.gl_nro_instalacion = fgcdec_aviso_de_ayuda THEN
	dw_1.modify("p_de_ayuda.Visible='1'")
	dw_1.modify("st_de_ayuda.Visible='1'")
ELSEIF istr_avisos.gl_nro_instalacion = fgcdec_aviso_alumbrado_publico THEN
	dw_1.modify("p_de_alumbrado.Visible='1'")
	dw_1.modify("st_de_alumbrado.Visible='1'")
ELSEIF iu_gen_comunic.is_comunic.intval5 =  fgci_clase_avi_calidad THEN// DBE 31/03/2000 14:36
	dw_1.modify("p_avi_calidad.Visible='1'")
	dw_1.modify("st_avi_calidad.Visible='1'")
END IF

IF istr_avisos.gi_est_aviso = fgci_estado_anulado THEN
	dw_1.modify("p_anulado.Visible='1'")
	dw_1.modify("st_anulado.Visible='1'")
END IF

// LFE - Mejora 1/262335
 lst_impresion.total = 4
IF (fg_verifica_parametro('INDICADORES_RUR') OR fg_verifica_parametro('INDICADORES_URB') ) AND &
	(istr_avisos.gl_nro_instalacion <> fgcdec_aviso_sin_alimentacion AND istr_avisos.gl_nro_instalacion <> fgcdec_aviso_de_ayuda AND &
	istr_avisos.gl_nro_instalacion <> fgcdec_aviso_alumbrado_publico AND istr_avisos.gl_nro_instalacion <> fgcdec_aviso_de_calidad_sin_alim) THEN

	lst_impresion.total = 5
	dw_1.modify("r_bloque1.visible='0'")
ELSE 
	dw_1.modify("d_indicadores.visible='0'")
	lst_impresion.total = 4
END IF
// LFE - Fin Mejora 1/262335

dw_1.modify("gb_1.visible='0'")

//IF d_lista_brigada.RowCount() = 0 THEN
//	gnv_msg.f_mensaje( "AB02","","",OK!)
//	return
//END IF
fw_editar_campos(d_aviso)

dw_1.SetTransObject(SQLCA)

//lst_impresion.pdw_datawindow = dw_1
//lst_impresion.pdw_lista = d_lista_brigada



lst_impresion.pdw_compuesto = dw_1
lst_impresion.compuesto = true

// Esto es para intentar solucionar un problema en Colombia.
// De momento no eliminar. LFE
dw_1.modify("estado_t.visible='0'")
dw_1.modify("alcance_t.visible='0'")
dw_1.modify("tipo_t.visible='0'")
dw_1.modify("prioridad_t.visible='0'")
dw_1.modify("zona_t.visible='0'")
dw_1.modify("cmd_t.visible='0'")
dw_1.modify("sector_t.visible='0'")

dw_1.modify("estado_t.visible='1'")
dw_1.modify("alcance_t.visible='1'")
dw_1.modify("tipo_t.visible='1'")
dw_1.modify("prioridad_t.visible='1'")
dw_1.modify("zona_t.visible='1'")
dw_1.modify("cmd_t.visible='1'")
dw_1.modify("sector_t.visible='1'")


	
//gf_impresion_preliminar (lst_impresion, True, 0)
OpenWithParm ( w_generica_impresion_preliminar,  lst_impresion)	

If gb_tipos_de_via Then
	d_direccion.setitem(1, "calle", ls_calle)
	d_direccion.setitem(1, "c_desc_tipo", ls_tipo_via)	
END IF	
	

end event

type p_dir_electrica from picture within w_1203_inf_aviso
integer x = 3360
integer y = 1388
integer width = 146
integer height = 128
boolean bringtotop = true
string pointer = "HyperLink!"
string picturename = ".\recursos\SALBAJ.bmp"
boolean focusrectangle = false
end type

event clicked;gu_comunic.is_comunic.longval2=istr_avisos.gl_nis_rad
open (w_direccion_electrica)
end event

type st_dir_elec_t from statictext within w_1203_inf_aviso
integer x = 3141
integer y = 1404
integer width = 219
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n el$$HEX1$$e900$$ENDHEX$$ctrica"
boolean focusrectangle = false
end type

type p_2 from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3013
integer y = 716
integer width = 73
integer height = 64
integer taborder = 140
boolean enabled = false
string picturename = ".\recursos\er.bmp"
boolean focusrectangle = false
end type

type p_1 from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3013
integer y = 716
integer width = 73
integer height = 64
integer taborder = 140
boolean enabled = false
string picturename = ".\recursos\cortocircuito.bmp"
boolean focusrectangle = false
end type

type p_avi_peligro from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3013
integer y = 712
integer width = 73
integer height = 68
integer taborder = 140
boolean enabled = false
string picturename = ".\recursos\PELIGRO1.BMP"
boolean focusrectangle = false
end type

type p_esencial from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3003
integer y = 620
integer width = 96
integer height = 96
boolean bringtotop = true
string picturename = "hospital.gif"
boolean focusrectangle = false
end type

type st_cli_imp from statictext within w_1203_inf_aviso
boolean visible = false
integer x = 3131
integer y = 636
integer width = 407
integer height = 60
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Cliente Importante"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_1203_inf_aviso
integer x = 2921
integer width = 622
integer height = 832
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Alarmas"
borderstyle borderstyle = styleraised!
end type

type p_cli_imp from picture within w_1203_inf_aviso
boolean visible = false
integer x = 3013
integer y = 620
integer width = 73
integer height = 64
integer taborder = 130
boolean dragauto = true
boolean bringtotop = true
boolean enabled = false
string picturename = ".\recursos\CLIIMP.BMP"
boolean focusrectangle = false
end type


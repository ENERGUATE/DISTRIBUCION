HA$PBExportHeader$w_1203_inf_aviso_hist.srw
$PBExportComments$Ventana tipo response usada para desplegar los datos de un aviso pendiente.
forward
global type w_1203_inf_aviso_hist from w_1203_inf_aviso
end type
end forward

global type w_1203_inf_aviso_hist from w_1203_inf_aviso
integer x = 9
integer y = 280
end type
global w_1203_inf_aviso_hist w_1203_inf_aviso_hist

type variables
long il_cod_calle

end variables

forward prototypes
public function integer fnu_o_datos_aviso (long pl_nro_aviso)
end prototypes

public function integer fnu_o_datos_aviso (long pl_nro_aviso);long pl_nis_rad, pgl_nro_aviso, pgl_nro_ot, pgl_nro_instalacion, pgl_nro_incidencia
long pl_nro_orden, pgl_nro_llamadas
int pgi_tip_aviso, pgi_ind_peligro, pgi_prioridad, pgi_est_aviso, pgi_ind_ayuda
int pgi_num_puerta, pgi_ind_improcedente, pgi_ind_cli_imp, pgi_co_alcance
int pgi_nro_centro, pgi_nro_cmd, pgi_nro_mesa
string pgs_nombre, pgs_ape1, pgs_ape2, pgs_doc_id, pgs_tip_doc, pgs_tfno_cli
string pgs_obs_telegestiones, pgs_duplicador, pgs_esquina, pgs_nom_calle
string pgs_nom_prov, pgs_nom_depto, pgs_nom_munic, pgs_nom_loc, pgs_co_pais
string pgs_nro_telefonista, pgs_obs_cmd, pgs_desc_incidencia, pretorno
datetime pldt_f_alta, pd_f_deteccion

long lnro_incidencia
long lnis_rad
 //AHM (0/10000945)
 DECLARE INF_AVISO CURSOR FOR  
SELECT 
       GI_HIST_AVISOS.NIS_RAD,
       GI_HIST_AVISOS.NOMBRE,   
       GI_HIST_AVISOS.APE1,   
       GI_HIST_AVISOS.APE2,   
       GI_HIST_AVISOS.DOC_ID,   
       GI_HIST_AVISOS.TIP_DOC,   
       GI_HIST_AVISOS.TIP_AVISO,   
       GI_HIST_AVISOS.IND_PELIGRO,   
       GI_HIST_AVISOS.PRIORIDAD,   
       GI_HIST_AVISOS.TFNO_CLI,   
       GI_HIST_AVISOS.EST_AVISO,   
       GI_HIST_AVISOS.OBS_TELEGESTIONES,   
       GI_HIST_AVISOS.IND_AYUDA,   
       GI_HIST_AVISOS.DUPLICADOR,   
       GI_HIST_AVISOS.NUM_PUERTA,   
       GI_HIST_AVISOS.ESQUINA,   
       GI_HIST_AVISOS.IND_IMPROCEDENTE,   
       GI_HIST_AVISOS.IND_CLI_IMP,   
       GI_HIST_AVISOS.NOM_CALLE,   
       GI_HIST_AVISOS.NOM_PROV,   
       GI_HIST_AVISOS.NOM_DEPTO,   
       GI_HIST_AVISOS.NOM_MUNIC,   
       GI_HIST_AVISOS.NOM_LOC,   
       GI_HIST_AVISOS.CO_ALCANCE,   
       GI_HIST_AVISOS.CO_PAIS,
       GI_HIST_AVISOS.NRO_AVISO,
       GI_HIST_AVISOS.NRO_TELEFONISTA,
       GI_HIST_AVISOS.F_ALTA,
       GI_HIST_AVISOS.NRO_OT,       
       GI_HIST_AVISOS.NRO_CENTRO,
       GI_HIST_AVISOS.NRO_CMD,
       GI_HIST_AVISOS.NRO_MESA,
       GI_HIST_AVISOS.NRO_INSTALACION,
       GI_HIST_AVISOS.NRO_INCIDENCIA,
       GI_HIST_AVISOS.OBS_CMD,
		 GI_HIST_AVISOS.NRO_LLAMADAS,
		 GI_HIST_AVISOS.COD_CALLE

FROM GI_HIST_AVISOS  
WHERE GI_HIST_AVISOS.NRO_AVISO = :pl_nro_aviso
UNION ALL
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
		 GI_AVISOS.COD_CALLE
FROM GI_AVISOS  
WHERE GI_AVISOS.NRO_AVISO = :pl_nro_aviso;

DECLARE  INF_INCIDENCIA CURSOR FOR
 SELECT DESC_INCIDENCIA, F_DETECCION                   
  FROM SGD_INCIDENCIA
        WHERE NRO_INCIDENCIA = :lnro_incidencia;
DECLARE INF_OS CURSOR FOR
SELECT  ORDENES.NUM_OS  FROM ORDENES  
WHERE (( ORDENES.NIS_RAD = :lnis_rad ) AND  (( ORDENES.TIP_OS = 'TO501' ) OR &
	( ORDENES.TIP_OS = 'TO504' ) OR ( ORDENES.TIP_OS = 'TO515' ) OR &
	( ORDENES.TIP_OS = 'TO516' ) OR ( ORDENES.TIP_OS = 'TO526' ) OR &
	( ORDENES.TIP_OS = 'TO528' ) OR ( ORDENES.TIP_OS = 'TO530' ) OR &
	( ORDENES.TIP_OS = 'TO533' )) AND  (( ORDENES.EST_OS = 'EO001' ) OR &
	( ORDENES.EST_OS = 'EO004' ) OR  ( ORDENES.EST_OS = 'EO009' ) OR &
	( ORDENES.EST_OS = 'EO011')) AND ROWNUM=1) ORDER BY ORDENES.F_GEN; 


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
		 :pgl_nro_llamadas;


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
			:istr_avisos.gl_nro_llamadas,
			:il_cod_calle;

close inf_aviso;

return 1
end function

on w_1203_inf_aviso_hist.create
call super::create
end on

on w_1203_inf_aviso_hist.destroy
call super::destroy
end on

event open;
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

string ls_color_gris, ls_color_blanco //, ls_desc_incidencia 
long ll_nis, ll_nro_orden, ll_nic
datetime 	ldt_f_deteccion
string ls_medidor // GNU 12/12/2006. Mejora 1/327511

/*** LSH *** INI *** DDAG-845- *** 11/11/2014 */
integer li_imp
/*** LSH *** FIN *** DDAG-845- *** 11/11/2014 */

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.

iu_gen_comunic = CREATE u_generico_comunicaciones

iu_gen_comunic.is_comunic = gu_comunic.is_comunic
//if iu_gen_comunic.is_comunic.programa_llamante = 'w_1201_avi' then 
//	fg_colocar_ventana_main(w_1203_inf_aviso)
//else
//	fg_colocar_ventana(w_1203_inf_aviso)
//end if	


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
//	d_aviso.SetTabOrder("obs_cmd",0)
	d_aviso.Modify("obs_telegestiones.Edit.DisplayOnly = true")
	d_aviso.Modify("obs_telegestiones.Background.Color = "+ls_color_gris)
	d_aviso.Modify("obs_cmd.Edit.DisplayOnly = true")
	d_aviso.Modify("obs_cmd.Background.Color= "+ls_color_gris)

ELSEIF iu_gen_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
	d_ambito.fnu_insertar_datos(istr_avisos.gi_nro_centro,istr_avisos.gi_nro_cmd,istr_avisos.gi_nro_mesa,0)
	d_ambito.Show()
	pb_dir_global = 0
	pb_dir_particular = 0
   d_direccion.triggerevent("ue_habilitar_campos")
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
	d_aviso.Modify("obs_telegestiones.Edit.DisplayOnly = true")
	d_aviso.SetTabOrder("obs_telegestiones",0)
	d_aviso.Modify("obs_telegestiones.Background.Color = "+ls_color_gris)
	d_aviso.Modify("obs_cmd.Edit.DisplayOnly =false")
	d_aviso.Modify("obs_cmd.Background.Color= "+ls_color_blanco)

END IF

// Inserto un registro en los user-object de trabajo

// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n del aviso y conecto las D.D.D.W
triggerevent("ue_o_datos")
d_direccion.insertrow(0)
d_cliente.insertrow(0)


d_aviso.settransobject(sqlca)
d_aviso.retrieve(istr_avisos.gl_nro_aviso)
//d_aviso.insertrow(0)


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
	// GNU 21-12-2005. Incidencia referencia avisos
	// d_direccion.Height += 64
	d_direccion.height += 120
	// FIN GNU
End If
//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


d_cliente.setitem(1,"ape1",istr_avisos.gs_ape1)
d_cliente.setitem(1,"ape2",istr_avisos.gs_ape2)
d_cliente.setitem(1,"nombre",istr_avisos.gs_nombre)
d_cliente.setitem(1,"tfno_cli",istr_avisos.gs_tfno_cli)
// GNU 26-10-2005. Mejora 1/335502
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
	// GNU 18-4-2007. Incidencia Panam$$HEX1$$e100$$ENDHEX$$
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

fpr_llenar_campo_sle(sle_esq_cond,string(istr_avisos.gs_esquina))

//AHM (15/06/2009) Mejora 1/372585
// Verifico y prendo los indicativos
IF (istr_avisos.gi_ind_peligro = 1 AND ( gi_pais <> 8 OR (gi_pais = 8 AND istr_avisos.gi_tip_aviso = 5))) THEN
	p_avi_peligro.Show()
	st_avi_peligro.Show()
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
//IF istr_avisos.gi_ind_cli_imp = 1 THEN
//	p_cli_imp.Show()
//	st_cli_imp.Show()
//END IF
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

IF istr_avisos.gl_nro_instalacion = fgcdec_aviso_sin_alimentacion THEN
	p_sin_alim.Show()
	st_sin_alim.Show()
ELSEIF istr_avisos.gl_nro_instalacion = fgcdec_aviso_de_ayuda THEN
	p_de_ayuda.Show()
	st_de_ayuda.Show()
ELSEIF istr_avisos.gl_nro_instalacion = fgcdec_aviso_alumbrado_publico THEN
	p_de_alumbrado.Show()
	st_de_alumbrado.Show()
ELSEIF iu_gen_comunic.is_comunic.intval5 =  fgci_clase_avi_calidad THEN// DBE 31/03/2000 14:36
	p_avi_calidad.Show()
	st_avi_calidad.Show()	
END IF

//************************************************************************************************//
//   Externalidad: Avisos de ayuda y alumbrado publico solo provincia, distrito,...               //
//   Luis Eduardo Ortiz  Mayo/2001                                                                //
//************************************************************************************************//

If fg_verifica_parametro("avisos_ayuda_ap_prov_dist_corr_barrio") Then
	If istr_avisos.gl_nro_instalacion = fgcdec_aviso_alumbrado_publico OR istr_avisos.gl_nro_instalacion = fgcdec_aviso_de_ayuda Then
		d_direccion.Modify("calle_t.Visible=0")
		d_direccion.Modify("calle.Visible=0")
		d_direccion.Modify("numero.Visible=0")
		d_direccion.Modify("duplic.Visible=0")
	End If
End If

// GNU 5-12-2005. Copio este trozo de w_1203_inf_aviso para que no se muestren los indicadores
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
// FIN GNU

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
fg_ventana_parametro(This.ClassName(), d_direccion)
//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


If istr_avisos.gi_est_aviso = fgci_aviso_improcedente Then cb_obs_improc.Visible = True
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

fg_datos_tipo_calle(d_direccion, il_cod_calle, 0)

SetRedraw(True)
//close inf_aviso;
//t4= string(datetime(today(),now()))

//messagebox("t1",t1)
//messagebox("t2",t2)
//messagebox("t3",t3)
//messagebox("t4",t4)
//messagebox("t5",t5)
end event

event close;call super::close;//AHM 30/09/2009 Mejora 1/535253
IF gu_comunic.is_comunic.programa_llamante = "w_2307_consulta_aviso" THEN
	gu_comunic.is_comunic.programa_llamante = "w_1203_inf_aviso_hist"
END IF
end event

type st_bloqueo from w_1203_inf_aviso`st_bloqueo within w_1203_inf_aviso_hist
end type

type d_cliente from w_1203_inf_aviso`d_cliente within w_1203_inf_aviso_hist
end type

event d_cliente::constructor;call super::constructor;This.dataobject = 'd_avi_2014_pr_form_id_cliente2_hist'
end event

type d_direccion from w_1203_inf_aviso`d_direccion within w_1203_inf_aviso_hist
end type

type p_ord_corte from w_1203_inf_aviso`p_ord_corte within w_1203_inf_aviso_hist
integer x = 3058
integer width = 119
end type

type st_inc_asign from w_1203_inf_aviso`st_inc_asign within w_1203_inf_aviso_hist
end type

type st_ord_corte from w_1203_inf_aviso`st_ord_corte within w_1203_inf_aviso_hist
end type

type st_nom_inc from w_1203_inf_aviso`st_nom_inc within w_1203_inf_aviso_hist
end type

type st_esencial from w_1203_inf_aviso`st_esencial within w_1203_inf_aviso_hist
end type

type st_avi_peligro from w_1203_inf_aviso`st_avi_peligro within w_1203_inf_aviso_hist
end type

type p_inc_asign from w_1203_inf_aviso`p_inc_asign within w_1203_inf_aviso_hist
end type

type d_aviso from w_1203_inf_aviso`d_aviso within w_1203_inf_aviso_hist
end type

event d_aviso::constructor;call super::constructor;This.dataobject = 'd_avi_2015_pr_form_obs2_hist'

// LFE - Mejora 1/262335
IF fg_verifica_parametro('INDICADORES_RUR')=FALSE AND fg_verifica_parametro('INDICADORES_URB')=FALSE THEN
	this.object.saifi_t.visible=0
	this.object.saidi_t.visible=0
	this.object.saifi_oc.visible=0
	this.object.saidi_oc.visible=0
	this.object.gb_indicadores.visible=0
END IF
// LFE - Fin Mejora 1/262335
end event

event d_aviso::ue_habilitar_campos;// GNU 1-12-2005. Mejora 1/311271
// He copiado el c$$HEX1$$f300$$ENDHEX$$digo que hab$$HEX1$$ed00$$ENDHEX$$a en w_1203_inf_aviso porque como $$HEX1$$e900$$ENDHEX$$ste no tiene el campo fecha_ultimo_aviso daba error
IF pb_avi_cond = 1 THEN
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
			 "~t ind_improcedente.background.color=" + gs_blanco)
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
			 "~t ind_improcedente.background.color=" + gs_gris) 
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
// FIN GNU
end event

type sle_esq_cond from w_1203_inf_aviso`sle_esq_cond within w_1203_inf_aviso_hist
end type

type st_1 from w_1203_inf_aviso`st_1 within w_1203_inf_aviso_hist
end type

type d_ambito from w_1203_inf_aviso`d_ambito within w_1203_inf_aviso_hist
integer width = 992
end type

type p_avi_calidad from w_1203_inf_aviso`p_avi_calidad within w_1203_inf_aviso_hist
end type

type st_avi_calidad from w_1203_inf_aviso`st_avi_calidad within w_1203_inf_aviso_hist
end type

type p_sin_alim from w_1203_inf_aviso`p_sin_alim within w_1203_inf_aviso_hist
end type

type p_de_alumbrado from w_1203_inf_aviso`p_de_alumbrado within w_1203_inf_aviso_hist
end type

type st_sin_alim from w_1203_inf_aviso`st_sin_alim within w_1203_inf_aviso_hist
end type

type st_de_alumbrado from w_1203_inf_aviso`st_de_alumbrado within w_1203_inf_aviso_hist
end type

type cb_obs_improc from w_1203_inf_aviso`cb_obs_improc within w_1203_inf_aviso_hist
end type

type st_ubicacion_t from w_1203_inf_aviso`st_ubicacion_t within w_1203_inf_aviso_hist
end type

type p_de_ayuda from w_1203_inf_aviso`p_de_ayuda within w_1203_inf_aviso_hist
end type

type p_brig_enviada from w_1203_inf_aviso`p_brig_enviada within w_1203_inf_aviso_hist
end type

type p_aviso_anulado from w_1203_inf_aviso`p_aviso_anulado within w_1203_inf_aviso_hist
end type

type st_de_ayuda from w_1203_inf_aviso`st_de_ayuda within w_1203_inf_aviso_hist
end type

type p_area from w_1203_inf_aviso`p_area within w_1203_inf_aviso_hist
end type

type st_tiempo from w_1203_inf_aviso`st_tiempo within w_1203_inf_aviso_hist
end type

type dw_1 from w_1203_inf_aviso`dw_1 within w_1203_inf_aviso_hist
boolean bringtotop = true
end type

type dw_indices from w_1203_inf_aviso`dw_indices within w_1203_inf_aviso_hist
end type

event dw_indices::constructor;call super::constructor;// LFE - Mejora 1/262335
This.Dataobject = 'd_indicadores_aviso_hist'
This.SetTransObject(SQLCA)
// LFE - Mejora 1/262335
end event

type cb_2 from w_1203_inf_aviso`cb_2 within w_1203_inf_aviso_hist
end type

event cb_2::constructor;call super::constructor;//AHU 16/04/2009 Incidencia 0/122262465
This.visible = fg_verifica_parametro('INDICADORES_RUR') OR fg_verifica_parametro('INDICADORES_URB')
end event

type st_brig_enviada from w_1203_inf_aviso`st_brig_enviada within w_1203_inf_aviso_hist
end type

type st_aviso_anulado from w_1203_inf_aviso`st_aviso_anulado within w_1203_inf_aviso_hist
end type

type st_ubicacion from w_1203_inf_aviso`st_ubicacion within w_1203_inf_aviso_hist
end type

type cb_1 from w_1203_inf_aviso`cb_1 within w_1203_inf_aviso_hist
end type

type p_dir_electrica from w_1203_inf_aviso`p_dir_electrica within w_1203_inf_aviso_hist
end type

type st_dir_elec_t from w_1203_inf_aviso`st_dir_elec_t within w_1203_inf_aviso_hist
end type

type p_2 from w_1203_inf_aviso`p_2 within w_1203_inf_aviso_hist
end type

type p_1 from w_1203_inf_aviso`p_1 within w_1203_inf_aviso_hist
end type

type p_avi_peligro from w_1203_inf_aviso`p_avi_peligro within w_1203_inf_aviso_hist
end type

type p_esencial from w_1203_inf_aviso`p_esencial within w_1203_inf_aviso_hist
end type

type st_cli_imp from w_1203_inf_aviso`st_cli_imp within w_1203_inf_aviso_hist
end type

type gb_1 from w_1203_inf_aviso`gb_1 within w_1203_inf_aviso_hist
end type

type p_cli_imp from w_1203_inf_aviso`p_cli_imp within w_1203_inf_aviso_hist
end type


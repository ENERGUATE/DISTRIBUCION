HA$PBExportHeader$u_avi_2004_nu_form_inf_resumen.sru
$PBExportComments$UserObject de n$$HEX1$$fa00$$ENDHEX$$cleo de informaci$$HEX1$$f300$$ENDHEX$$n resumen del aviso, usado en recepci$$HEX1$$f300$$ENDHEX$$n de avisos..
forward
global type u_avi_2004_nu_form_inf_resumen from nonvisualobject
end type
end forward

global type u_avi_2004_nu_form_inf_resumen from nonvisualobject
end type
global u_avi_2004_nu_form_inf_resumen u_avi_2004_nu_form_inf_resumen

type variables
s_avisos        is_avisos

end variables

forward prototypes
public function integer fnu_c_cgv_y_cods (ref s_direccion_cliente pstr_dir_cli)
public function integer fnu_g_aviso ()
public function integer fnu_v_posib_de_grabar ()
public function integer fnu_v_importante (long pl_nis)
public function integer fnu_o_centro_cmd_mesa (ref integer pi_centro, ref integer pi_cmd, ref integer pi_mesa, integer pi_cod_loc)
public function s_avisos fnu_o_datos_aviso (long pl_nis)
public function integer fnu_o_indice_de_peligro (integer pi_tip_aviso)
public function character fnu_v_interrup_total (long pl_nro_incid)
public function datawindowchild fnu_conectar (ref datawindow pdw_inf_resumen)
public function integer fnu_o_datos (ref datawindow pdw_aviso, long pl_nro_avi)
public function integer fnu_o_inf_comple_sum2 (ref long pl_ord_servicio, ref long pl_nro_incid, long pl_nis, decimal pl_nro_inst)
public function long fnu_v_os (long pl_nis)
public function s_avisos fnu_o_datos_aviso2 (long pl_nro_aviso)
public function integer fnu_v_aviso_pendiente (ref long pl_ex_avi_pend, long pl_nis)
public function integer fnu_a_aviso (ref s_avisos pstr_aviso)
public subroutine fnu_cargo_imp (ref datawindow pd_dw)
public function integer fnu_o_inf_comple_sum (ref long pl_ord_servicio, ref long pl_nro_incid, long pl_nis, boolean pb_en_petsum)
public function integer fnu_insertar_incidencia (long pl_nro_inc, ref datawindow pd_dw)
public function integer fnu_o_inc_nis (ref datawindow pd_dw, long pl_nro_nis)
public function integer fnu_o_incid (ref datawindow pd_dw, long pl_nro_nis, ref datawindow p_interrupciones, string ps_select_original)
public function integer fnu_c_estruc_dir_por_nis (ref s_direccion_cliente pstr_dir_cli, long nro_aviso)
public function integer fnu_c_estructura_avisos (s_direccion_cliente psrt_dir_cli, long pl_nro_aviso, ref datawindow pdw_inf_resumen)
public function integer fnu_v_aviso_ayuda (ref datawindow pdw_cli, ref datawindow pdw_dir, ref datawindow pdw_avi, singlelineedit psle_esq, singlelineedit psle_tel, long pl_nro_aviso, integer pi_clase_avi)
public function long fnu_o_nro_aviso ()
end prototypes

public function integer fnu_c_cgv_y_cods (ref s_direccion_cliente pstr_dir_cli);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_c_cgv_y_cods
// 
// Objetivo:    Carga en la estructura de avisos los c$$HEX1$$f300$$ENDHEX$$digos de la direcci$$HEX1$$f300$$ENDHEX$$n
//                                      que est$$HEX1$$e100$$ENDHEX$$n en la estructura pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pstr_dir_cli (estructura con toda la informaci$$HEX1$$f300$$ENDHEX$$n del cliente)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_fecha

IF IsNull(pstr_dir_cli.gs_pisodpto) THEN
        This.is_avisos.gs_cgv_sum = " "
ELSE
        This.is_avisos.gs_cgv_sum = pstr_dir_cli.gs_pisodpto
END IF
This.is_avisos.gl_cod_calle = pstr_dir_cli.gl_codcalle
This.is_avisos.gl_cod_loc = pstr_dir_cli.gl_codloc
This.is_avisos.gl_cod_munic =pstr_dir_cli.gl_codmun
This.is_avisos.gi_cod_prov = pstr_dir_cli.gl_codprov
This.is_avisos.gi_cod_depto = pstr_dir_cli.gl_coddepto
This.is_avisos.gs_co_pais = pstr_dir_cli.gs_co_pais

ldt_fecha   = fgnu_fecha_actual()
is_avisos.gi_cod_hor = fgrn_intervalo_horario(ldt_fecha)

IF is_avisos.gi_cod_hor = -1 THEN
        gnv_msg.f_mensaje("ER59","","",OK!)
        RETURN -1
END IF


RETURN 1


end function

public function integer fnu_g_aviso ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_g_aviso
// 
// Objetivo:    Graba los datos del aviso contenidos en la estructura.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

INSERT INTO "GI_AVISOS"  
   ("NRO_AVISO" ,"USUARIO" ,"F_ACTUAL" ,"H_ACTUAL" ,"PROGRAMA" ,"NIS_RAD" ,   
    "NOMBRE" ,"APE1" ,"APE2" ,"DOC_ID" ,        "TIP_DOC" ,     "CO_PAIS" ,"CO_ALCANCE" ,   
    "TIP_AVISO" ,"IND_PELIGRO" ,"PRIORIDAD","F_ALTA" ,"TFNO_CLI" ,   
    "EST_AVISO" ,"OBS_TELEGESTIONES" ,"OBS_CMD" ,"IND_AYUDA" ,"DUPLICADOR" ,   
    "NUM_PUERTA" ,"COD_CALLE" , "COD_LOC" ,"COD_MUNIC" ,"COD_PROV" ,"COD_DEPTO" ,   
    "NRO_OT" ,"ESQUINA" ,"CGV_SUM" ,"NRO_CENTRO" ,"NRO_TELEGESTIONES" ,   
    "NRO_INSTALACION" ,"NRO_CMD" ,"NRO_MESA" ,"NRO_INCIDENCIA" ,"IND_IMPROCEDENTE" ,   
    "IND_CLI_IMP" ,"NRO_TELEFONISTA" ,"NOM_CALLE" ,"NOM_PROV" ,"NOM_DEPTO" ,
    "NOM_MUNIC" ,"NOM_LOC", "FECHA_RES", "HORA_RES", "REF_DIR", "EB4005",
         "FECHA_BATCH", "COD_HORARIO", "IND_INC_ASOC", "NRO_LLAMADAS")
VALUES
        (:is_avisos.gl_nro_aviso, :is_avisos.gs_usuario, :is_avisos.gd_f_actual,   
    :is_avisos.gt_h_actual, :is_avisos.gs_programa, :is_avisos.gl_nis_rad,   
    :is_avisos.gs_nombre, :is_avisos.gs_ape1, :is_avisos.gs_ape2,   
    :is_avisos.gs_doc_id, :is_avisos.gs_tip_doc, :is_avisos.gs_co_pais,   
    :is_avisos.gi_co_alcance, :is_avisos.gi_tip_aviso, :is_avisos.gi_ind_peligro,   
    :is_avisos.gi_prioridad, :is_avisos.gd_f_alta, :is_avisos.gs_tfno_cli, 
         :is_avisos.gi_est_aviso, :is_avisos.gs_obs_telegestiones, :is_avisos.gs_obs_cmd,   
    :is_avisos.gi_ind_ayuda, :is_avisos.gs_duplicador, :is_avisos.gl_num_puerta,   
    :is_avisos.gl_cod_calle, :is_avisos.gl_cod_loc, :is_avisos.gl_cod_munic,   
    :is_avisos.gi_cod_prov, :is_avisos.gi_cod_depto, :is_avisos.gl_nro_brigada,   
    :is_avisos.gs_esquina, :is_avisos.gs_cgv_sum, :is_avisos.gi_nro_centro,   
    :is_avisos.gi_nro_telegestiones, :is_avisos.gl_nro_instalacion,   
         :is_avisos.gi_nro_cmd, :is_avisos.gi_nro_mesa, :is_avisos.gl_nro_incidencia,   
    :is_avisos.gi_ind_improcedente, :is_avisos.gi_ind_cli_imp,   
    :is_avisos.gs_nro_telefonista, :is_avisos.gs_nom_calle,
         :is_avisos.gs_nom_prov, :is_avisos.gs_nom_depto, 
         :is_avisos.gs_nom_munic, :is_avisos.gs_nom_loc, :is_avisos.gdt_f_res,
         :is_avisos.gdt_h_res, :is_avisos.gs_ref_dir, :is_avisos.gi_est_batch,
         :is_avisos.gdt_f_batch, :is_avisos.gi_cod_hor, :is_avisos.gi_inc_asoc, :is_avisos.gl_nro_llamadas)  
USING sqlca;
  

IF SQLCA.SQLCode = -1 then
        gnv_msg.f_mensaje("ER03","~n"+sqlca.SqlErrText,"",OK!)
        RETURN -1
END IF

RETURN 1

 
end function

public function integer fnu_v_posib_de_grabar ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_v_posib_de_grabar
//
// Objetivo:    Verifico que si el aviso est$$HEX2$$e1002000$$ENDHEX$$en corte, el mismo sea de 
//                                      peligro, sino no se puede grabar.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (se puede grabar o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF This.is_avisos.gi_tip_aviso = 0 THEN
        RETURN 0
END IF

RETURN 1


end function

public function integer fnu_v_importante (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_v_importante
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
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Leo Suministros_Imp por Nis_Rad
// Si S_I.fecha_expiracion >= Today()
//      est:importante = 1.

SetPointer(HourGlass!)

datetime ldt_f_expiracion

SELECT "GI_SUMINISTROS_IMP"."F_EXPIRACION"  
INTO :ldt_f_expiracion  
FROM "GI_SUMINISTROS_IMP"  
WHERE "GI_SUMINISTROS_IMP"."NIS_RAD" = :pl_nis
USING sqlca;

IF sqlca.SqlCode = 0 THEN
        is_avisos.gi_ind_cli_imp = 1
//      IF ldt_f_expiracion >= fgnu_fecha_actual() OR IsNull(ldt_f_expiracion) THEN
//              is_avisos.gi_ind_cli_imp = 1
//              RETURN 1
//      ELSE
//              is_avisos.gi_ind_cli_imp = 0
//              RETURN 0
//      END IF
ELSEIF sqlca.SqlCode = -1 THEN
        gnv_msg.f_mensaje("ER05","","",OK!)
        RETURN -1
ELSE
        is_avisos.gi_ind_cli_imp = 0
        RETURN 0
END IF




end function

public function integer fnu_o_centro_cmd_mesa (ref integer pi_centro, ref integer pi_cmd, ref integer pi_mesa, integer pi_cod_loc);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_centro_cmd_mesa
// Objetivo:    Obtiene el nro. de centro, nro. de cmd y nro. de mesa, 
//                                      de la tabla 'Centro_Loc' por el c$$HEX1$$f300$$ENDHEX$$digo de localidad.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pi_centro       (donde retorno el cod_centro)
//                                      pi_cmd          (donde retorno el cod_cmd)
//                                      pi_mesa         (donde retorno el cod_mesa)
//                                      pi_cod_loc      (me pasa el valor del c$$HEX1$$f300$$ENDHEX$$digo de localidad)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

///////////////DBE 24/03/2000 12:33
int li_centro, li_cmd, li_mesa

		 DECLARE centros_locos CURSOR FOR  
			SELECT "GI_CENTRO_LOC"."NRO_CENTRO",   
       "GI_CENTRO_LOC"."NRO_CMD",   
       "GI_CENTRO_LOC"."NRO_PUESTO"  
       FROM "GI_CENTRO_LOC"  
       WHERE "GI_CENTRO_LOC"."COD_LOC" = :pi_cod_loc
		 and rownum<3;


		open centros_locos;
	
		fetch centros_locos into :li_centro,   :li_cmd,   :li_mesa;

			

 pi_centro=li_centro
 pi_cmd=li_cmd
 pi_mesa=li_mesa

IF sqlca.SqlCode = 0 THEN
	fetch centros_locos into :li_centro,   :li_cmd,   :li_mesa;
	     choose case  sqlca.SqlCode
			      case 0 //Hay registros mas que uno
						pi_mesa=0
					case 100 //Solo uno
				
					case else //Malo
					close centros_locos;
					gnv_msg.f_mensaje("ER10","","",OK!)
					RETURN -1	
		  end choose
		  
		  close centros_locos;
        RETURN 1
ELSEIF sqlca.SqlCode = 100 THEN
      	close centros_locos;
        gnv_msg.f_mensaje("AR10","","",OK!)
        RETURN 0
ELSE
        close centros_locos;
        gnv_msg.f_mensaje("ER10","","",OK!)
        RETURN -1
END IF
/////////////// DBE 24/03/2000 12:33
end function

public function s_avisos fnu_o_datos_aviso (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_datos_aviso
// Objetivo:    Cargo en la estructura de avisos los datos que obtengo de la
//                                      tabla 'Avisos' por el nis_rad.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nis  (nis_rad, por el cual se realiza el select)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    estructura de avisos
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime        ldt_f_alta, ldt_h_alta


SetPointer(HourGlass!)


SELECT "GI_AVISOS"."NOMBRE",   
       "GI_AVISOS"."APE1",   
       "GI_AVISOS"."APE2",   
       "GI_AVISOS"."DOC_ID",   
       "GI_AVISOS"."TIP_DOC",   
       "GI_AVISOS"."TIP_AVISO",   
       "GI_AVISOS"."IND_PELIGRO",   
       "GI_AVISOS"."PRIORIDAD",   
       "GI_AVISOS"."TFNO_CLI",   
       "GI_AVISOS"."EST_AVISO",   
       "GI_AVISOS"."OBS_TELEGESTIONES",   
       "GI_AVISOS"."IND_AYUDA",   
       "GI_AVISOS"."DUPLICADOR",   
       "GI_AVISOS"."NUM_PUERTA",   
       "GI_AVISOS"."ESQUINA",   
       "GI_AVISOS"."IND_IMPROCEDENTE",   
       "GI_AVISOS"."IND_CLI_IMP",   
       "GI_AVISOS"."NOM_CALLE",   
       "GI_AVISOS"."NOM_PROV",   
       "GI_AVISOS"."NOM_DEPTO",   
       "GI_AVISOS"."NOM_MUNIC",   
       "GI_AVISOS"."NOM_LOC",   
       "GI_AVISOS"."CO_ALCANCE",   
       "GI_AVISOS"."CO_PAIS",
       "GI_AVISOS"."NRO_AVISO",
       "GI_AVISOS"."NRO_TELEFONISTA",
       "GI_AVISOS"."F_ALTA",
       "GI_AVISOS"."NRO_OT",       
       "GI_AVISOS"."NRO_CENTRO",
       "GI_AVISOS"."NRO_CMD",
       "GI_AVISOS"."NRO_MESA",
                 "GI_AVISOS"."NRO_INCIDENCIA",
                 "GI_AVISOS"."NRO_LLAMADAS"
INTO   :is_avisos.gs_nombre,   
       :is_avisos.gs_ape1,   
       :is_avisos.gs_ape2,   
       :is_avisos.gs_doc_id,   
       :is_avisos.gs_tip_doc,   
       :is_avisos.gi_tip_aviso,   
       :is_avisos.gi_ind_peligro,   
       :is_avisos.gi_prioridad,   
       :is_avisos.gs_tfno_cli,   
       :is_avisos.gi_est_aviso,   
       :is_avisos.gs_obs_telegestiones,   
       :is_avisos.gi_ind_ayuda,   
       :is_avisos.gs_duplicador,   
       :is_avisos.gl_num_puerta,   
       :is_avisos.gs_esquina,   
       :is_avisos.gi_ind_improcedente,   
       :is_avisos.gi_ind_cli_imp,  
       :is_avisos.gs_nom_calle,   
       :is_avisos.gs_nom_prov,   
       :is_avisos.gs_nom_depto,   
       :is_avisos.gs_nom_munic,   
       :is_avisos.gs_nom_loc,   
       :is_avisos.gi_co_alcance,   
       :is_avisos.gs_co_pais,
       :is_avisos.gl_nro_aviso,
       :is_avisos.gs_nro_telefonista,
       :ldt_f_alta,
       :is_avisos.gl_nro_ot,
       :is_avisos.gi_nro_centro,
       :is_avisos.gi_nro_cmd,
       :is_avisos.gi_nro_mesa,
                 :is_avisos.gl_nro_incidencia,
                 :is_avisos.gl_nro_llamadas
FROM "GI_AVISOS"  
WHERE "GI_AVISOS"."NIS_RAD" = :pl_nis;

IF sqlca.SqlCode <> 0 THEN
        gnv_msg.f_mensaje("ER11","","",OK!)
//      SetNull(is_avisos)

        setnull(is_avisos.gl_nro_aviso)
        setnull(is_avisos.gs_usuario)
        setnull(is_avisos.gd_f_actual)
        setnull(is_avisos.gt_h_actual)
        setnull(is_avisos.gs_programa)
        setnull(is_avisos.gl_nis_rad)
        setnull(is_avisos.gs_nombre)
        setnull(is_avisos.gs_ape1)
        setnull(is_avisos.gs_ape2)
        setnull(is_avisos.gs_doc_id)
        setnull(is_avisos.gs_tip_doc)
        setnull(is_avisos.gs_co_pais)
        setnull(is_avisos.gi_co_alcance)
        setnull(is_avisos.gi_tip_aviso)
        setnull(is_avisos.gi_ind_peligro)
        setnull(is_avisos.gi_prioridad)
        setnull(is_avisos.gd_f_alta)
        setnull(is_avisos.gt_h_alta)
        setnull(is_avisos.gs_tfno_cli)
        setnull(is_avisos.gi_est_aviso)
        setnull(is_avisos.gs_obs_telegestiones)
        setnull(is_avisos.gs_obs_cmd)
        setnull(is_avisos.gi_ind_ayuda)
        setnull(is_avisos.gs_duplicador)
        setnull(is_avisos.gl_num_puerta)
        setnull(is_avisos.gl_cod_calle)
        setnull(is_avisos.gl_cod_loc)
        setnull(is_avisos.gl_cod_munic)
        setnull(is_avisos.gi_cod_prov)
        setnull(is_avisos.gi_cod_depto)
        setnull(is_avisos.gl_nro_brigada)
        setnull(is_avisos.gs_esquina)
        setnull(is_avisos.gs_cgv_sum)
        setnull(is_avisos.gi_nro_centro)
        setnull(is_avisos.gi_nro_telegestiones)
        setnull(is_avisos.gl_nro_instalacion)
        setnull(is_avisos.gi_nro_cmd)
        setnull(is_avisos.gi_nro_mesa)
        setnull(is_avisos.gl_nro_incidencia)
        setnull(is_avisos.gi_ind_improcedente)
        setnull(is_avisos.gs_nro_telefonista)
        setnull(is_avisos.gs_nom_calle)
        setnull(is_avisos.gi_ind_cli_imp)
        setnull(is_avisos.gs_nom_prov)
        setnull(is_avisos.gs_nom_depto)
        setnull(is_avisos.gs_nom_munic)
        setnull(is_avisos.gs_nom_loc)
        setnull(is_avisos.gl_nro_ot)
        setnull(is_avisos.gdt_f_res)
        setnull(is_avisos.gdt_h_res)
        setnull(is_avisos.gs_ref_dir)
        setnull(is_avisos.gi_est_batch)
        setnull(is_avisos.gdt_f_batch)
        setnull(is_avisos.gi_cod_hor)
        setnull(is_avisos.gi_inc_asoc)
        setnull(is_avisos.gl_nro_llamadas)

//
//
//

        RETURN is_avisos
ELSE
        is_avisos.gd_f_alta = ldt_f_alta
        RETURN is_avisos
END IF

end function

public function integer fnu_o_indice_de_peligro (integer pi_tip_aviso);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_indice_de_peligro
//
// Objetivo:    Obtengo el valor del $$HEX1$$ed00$$ENDHEX$$ndice de peligro para el tipo
//                                      de aviso pasado como par$$HEX1$$e100$$ENDHEX$$metro, de la tabla 'T_Tip_Aviso'
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pi_tip_aviso (por el que busco el indice de peligro)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    indice de peligro
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_ind_peligro

SetPointer(HourGlass!)

SELECT "GI_T_TIP_AVISO"."IND_PELIGRO"  
INTO :li_ind_peligro  
FROM "GI_T_TIP_AVISO"  
WHERE "GI_T_TIP_AVISO"."TIP_AVISO" = :pi_tip_aviso   
USING sqlca;

IF sqlca.SqlCode = 0 THEN
        RETURN li_ind_peligro
ELSE
        gnv_msg.f_mensaje("ER12","","",OK!)
        RETURN -1
END IF

end function

public function character fnu_v_interrup_total (long pl_nro_incid);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_v_interrup_total
//
// Objetivo:    Verifico si el nro. de incidencia pasado como par$$HEX1$$e100$$ENDHEX$$metro 
//                                      tiene una instalaci$$HEX1$$f300$$ENDHEX$$n asociada en la tabla 'Interrupci$$HEX1$$f300$$ENDHEX$$n'.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nro_incid (nro. de incidencia asignada a la inst.)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    tipo de instalaci$$HEX1$$f300$$ENDHEX$$n
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

char lc_tipo_inst

SELECT "SGD_INTERRUPCION"."TIP_INTERRUPCION"  
INTO :lc_tipo_inst  
FROM "SGD_INTERRUPCION"  
WHERE ( "SGD_INTERRUPCION"."NRO_INCIDENCIA" = :pl_nro_incid );

IF sqlca.SqlCode = 0 THEN
        RETURN lc_tipo_inst 
ELSEIF sqlca.SqlCode = 100 THEN
        RETURN "X"
ELSE
        gnv_msg.f_mensaje("ER17","","",OK!)
        RETURN "-1"
END IF
                
end function

public function datawindowchild fnu_conectar (ref datawindow pdw_inf_resumen);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_conectar
// 
// Objetivo:    Conecta las DropDownDW de la DW pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pdw_inf_resumen (datawindow con la inf. resumen del aviso)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datawindowchild ldwch_co_alc, ldwch_tip_avi

pdw_inf_resumen.GetChild('co_alcance',ldwch_co_alc)
pdw_inf_resumen.GetChild('tip_aviso',ldwch_tip_avi)

ldwch_co_alc.SetTransObject(sqlca)
ldwch_tip_avi.SetTransObject(sqlca)

ldwch_co_alc.Retrieve()
ldwch_tip_avi.Retrieve()

ldwch_co_alc.SetFilter("co_alcance <> 0")
ldwch_tip_avi.SetFilter("tip_aviso <> 0")

ldwch_co_alc.Filter()
ldwch_tip_avi.Filter()

RETURN ldwch_tip_avi
end function

public function integer fnu_o_datos (ref datawindow pdw_aviso, long pl_nro_avi);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_datos
// 
// Objetivo:    Realiza la conexi$$HEX1$$f300$$ENDHEX$$n de la D.W. a la B.D. y trae los datos
//                                      filtrados por el valor del par$$HEX1$$e100$$ENDHEX$$metro pasado. (pl_nro_avi)
//                                      Conecta las DropDownDW de la DW pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pdw_aviso (datawindow con la inf. resumen del aviso)
//                                      pl_nro_avi (nro. del aviso por el cual quiero filtrar)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/03/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datawindowchild ldwch_co_alc, ldwch_tip_avi, ldwch_prioridad,ldwch_est_aviso

//pdw_aviso.SetTransObject(sqlca)
//pdw_aviso.Retrieve(pl_nro_avi)


pdw_aviso.GetChild('co_alcance',ldwch_co_alc)
pdw_aviso.GetChild('tip_aviso',ldwch_tip_avi)
pdw_aviso.GetChild('prioridad',ldwch_prioridad)
pdw_aviso.GetChild('est_aviso',ldwch_est_aviso)


ddw_alcance_aviso_t_shared.sharedata(ldwch_co_alc)
ddw_tipo_aviso_t_shared.sharedata(ldwch_tip_avi)
ddw_prioridad_t_shared.sharedata(ldwch_prioridad)
ddw_estado_aviso_t_shared.sharedata(ldwch_est_aviso)



//ldwch_co_alc.SetTransObject(sqlca)
//ldwch_tip_avi.SetTransObject(sqlca)
//ldwch_prioridad.SetTransObject(sqlca)
//ldwch_est_aviso.settransobject(sqlca)
//
//ldwch_co_alc.Retrieve()
//ldwch_tip_avi.Retrieve()
//ldwch_prioridad.Retrieve()
//ldwch_est_aviso.retrieve()

ldwch_co_alc.SetFilter("co_alcance <> 0")
ldwch_tip_avi.SetFilter("tip_aviso <> 0")

ldwch_co_alc.Filter()
ldwch_tip_avi.Filter()

RETURN 1
end function

public function integer fnu_o_inf_comple_sum2 (ref long pl_ord_servicio, ref long pl_nro_incid, long pl_nis, decimal pl_nro_inst);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_inf_comple_sum2
//
// Objetivo:    Obtengo el resto de la informaci$$HEX1$$f300$$ENDHEX$$n sobre el suministro,
//                                      necesaria para completar los datos del aviso.
//                                      Esta funci$$HEX1$$f300$$ENDHEX$$n realiza la mayor parte del procesamiento en
//                                      lo a la obtenci$$HEX1$$f300$$ENDHEX$$n de la inf. anterior se refiere.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_ord_servicio (cargo la orden de servicio del sum.)
//                                      pl_nro_incid     (cargo la incidencia del sum.)
//                                      pl_nis                   (nis_rad para obtener los datos restantes)
//                                      pl_nro_inst              (nro_instalacion para obtener los datos restantes)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      20/03/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      24/04/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_orden,  ll_incidencia
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup
string ls_t_interrupcion
int li_centro, li_mesa, li_cmd ,li_fin_cursor
boolean lb_inc_asoc = False

decimal{0} ll_instalacion, ll_inst_padre  



// Puntero a "reloj de arena"
SetPointer(HourGlass!)

// Leo "Ordenes de Servicio" por Nis_Rad, tipo y estado
// Si tipo de O/S es de corte y est$$HEX2$$e1002000$$ENDHEX$$pendiente
// est:O/S = ord:numero de orden

pl_ord_servicio = This.fnu_v_os(pl_nis)
IF pl_ord_servicio > 0 THEN
        is_avisos.gi_ind_improcedente = 1
ELSE
        is_avisos.gi_ind_improcedente = 0
END IF


ll_instalacion = pl_nro_inst

SELECT "SGD_INSTALACION"."NRO_CENTRO",   
       "SGD_INSTALACION"."NRO_MESA",   
       "SGD_INSTALACION"."NRO_CMD"  
INTO :li_centro, :li_mesa, :li_cmd  
FROM "SGD_INSTALACION"  
WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_instalacion
and "SGD_INSTALACION"."BDI_JOB" = 0 //DBE 10/01/2000
USING sqlca;
IF sqlca.SqlCode = 0 THEN
        is_avisos.gl_nro_instalacion = ll_instalacion
        is_avisos.gi_nro_centro = li_centro  
        is_avisos.gi_nro_cmd            = li_cmd  
        is_avisos.gi_nro_mesa   = li_mesa 
ELSEIF sqlca.SqlCode = -1 THEN
        gnv_msg.f_mensaje("ER19","","",OK!)
ELSE
        is_avisos.gl_nro_instalacion = 0
END IF


// Si est:instalacion <> 0
//      Leo "Interrupciones" por Int:instalacion = est:instalacion
//      Si Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
//              Si Int:seleccion = "X" (Marcado)
//                              est:incidencia_confirmada = Int:incidencia
//      SinoSi Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
//              Si Int:seleccion = "P" (Marcado)
//                              posible_incid_asoc = Verdadero
//              Sino
//                      Leo "Instalaciones" por est:instalacion
//                      padre = Ins:instalacion_padre
//              FinSi
// FinSi
//      Verifico_Instalacion_Padre(padre)

is_avisos.gl_nro_incidencia = 0
pl_nro_incid = 0
ldt_fecha_actual = fgnu_fecha_actual()

IF      is_avisos.gl_nro_instalacion <> 0 THEN

        // Declaro y cargo cursor con todas las instalaciones de la jerarqu$$HEX1$$ed00$$ENDHEX$$a
        DECLARE lc_cur_jerar_inst CURSOR FOR
        (SELECT "SGD_INSTALACION"."NRO_INSTALACION"
        FROM "SGD_INSTALACION"
        START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :ll_instalacion 
		  and "SGD_INSTALACION"."BDI_JOB" = 0 //DBE 10/01/2000
        CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION"
		  and "SGD_INSTALACION"."BDI_JOB" = 0 )//DBE 10/01/2000
        USING sqlca;

        OPEN lc_cur_jerar_inst;

        FETCH lc_cur_jerar_inst INTO :ll_instalacion ;
        
        li_fin_cursor = 0

        DO
                // Declaro y cargo cursor con todas las instalaciones de la jerarqu$$HEX1$$ed00$$ENDHEX$$a
                DECLARE lc_cur_interrup CURSOR FOR
                (SELECT "SGD_INTERRUPCION"."F_REPOSICION",
                                "SGD_INTERRUPCION"."TIP_INTERRUPCION",
                                "SGD_INTERRUPCION"."NRO_INCIDENCIA",
                                "SGD_INTERRUPCION"."F_ALTA"
           FROM "SGD_INTERRUPCION"  
        WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" = :ll_instalacion)
                USING sqlca;

                OPEN lc_cur_interrup;

                FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
                                :ll_incidencia, :ldt_f_alta_interrup ;
        
                DO 
                        IF sqlca.SqlCode = 0 THEN
                                IF IsNull(Date(ldt_f_reposicion)) AND&
                                                ldt_fecha_actual >= ldt_f_alta_interrup AND&
                                                ls_t_interrupcion ="X" THEN
        
                                        // Asigno el nro. de incidencia asociado a la interrupci$$HEX1$$f300$$ENDHEX$$n
                                        is_avisos.gl_nro_incidencia = ll_incidencia
                                        pl_nro_incid = ll_incidencia
                                        gnv_msg.f_mensaje("AR01",string(ll_incidencia),"",OK!)
        
                                ELSEIF IsNull(Date(ldt_f_reposicion)) AND&
                                                ldt_fecha_actual >= ldt_f_alta_interrup AND&
                                                ls_t_interrupcion ="P" AND NOT lb_inc_asoc THEN
        
                                        pl_nro_incid = ll_incidencia
                                        lb_inc_asoc  = True
                                        gnv_msg.f_mensaje("AR02","","",OK!)
                                        
                                END IF
//                      ELSEIF sqlca.SqlCode = -1 THEN
//                              gnv_msg.f_mensaje("ER14","","",OK!)
//                              CLOSE lc_cur_jerar_inst ;
//                              CLOSE lc_cur_interrup;
//                              RETURN -1
                        END IF
        
                LOOP UNTIL (IsNull(Date(ldt_f_reposicion)) AND&
                                ldt_fecha_actual >= ldt_f_alta_interrup AND&
                                ls_t_interrupcion = "X") OR&
                                (sqlca.SqlCode <> 0)                            

                CLOSE lc_cur_interrup;

                FETCH lc_cur_jerar_inst INTO :ll_instalacion;
                IF (sqlca.SqlCode <> 0) THEN
                        CLOSE lc_cur_jerar_inst ;
                        li_fin_cursor = 1
                END IF

        LOOP UNTIL (li_fin_cursor = 1) OR (IsNull(Date(ldt_f_reposicion)) AND&
                        ldt_fecha_actual >= ldt_f_alta_interrup AND&
                        ls_t_interrupcion = "X")

END IF
        
RETURN 1


end function

public function long fnu_v_os (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_v_os
//
// Objetivo:    Verifico si el suministro pasado como par$$HEX1$$e100$$ENDHEX$$metro tiene
//                                      una orden de servicio asignada y esta es de corte. En caso 
//                                      afirmativo devuelvo el c$$HEX1$$f300$$ENDHEX$$digo de la orden.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nis (n$$HEX1$$fa00$$ENDHEX$$mero del suministro)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    c$$HEX1$$f300$$ENDHEX$$digo de orden de servicio o 0
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/03/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
// 14/08/96             HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_orden
datetime ldt_fec_o_s
SELECT "ORDENES"."NUM_OS" ,"ORDENES"."F_GEN"
INTO :ll_nro_orden  , :ldt_fec_o_s
FROM "ORDENES"  
WHERE (( "ORDENES"."NIS_RAD" = :pl_nis ) AND  
      (( "ORDENES"."TIP_OS" = 'TO501' ) OR ( "ORDENES"."TIP_OS" = 'TO504' ) OR 
                ( "ORDENES"."TIP_OS" = 'TO515' ) OR ( "ORDENES"."TIP_OS" = 'TO516' ) OR 
                ( "ORDENES"."TIP_OS" = 'TO526' ) OR ( "ORDENES"."TIP_OS" = 'TO528' ) OR
                ( "ORDENES"."TIP_OS" = 'TO530' ) OR ( "ORDENES"."TIP_OS" = 'TO533' )) AND  
      (( "ORDENES"."EST_OS" = 'EO001' ) OR ( "ORDENES"."EST_OS" = 'EO004' ) OR  
      ( "ORDENES"."EST_OS" = 'EO009' ) OR ("ORDENES"."EST_OS" = 'EO011')) AND ROWNUM=1) ORDER BY "ORDENES"."F_GEN" 
USING sqlca;

IF sqlca.SqlCode = 0 THEN
        RETURN ll_nro_orden
ELSEIF sqlca.SqlCode = 100 THEN
        RETURN 0
ELSE
        gnv_msg.f_mensaje("ER18","","",OK!)
        RETURN -1
END IF


end function

public function s_avisos fnu_o_datos_aviso2 (long pl_nro_aviso);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_datos_aviso2
//
// Objetivo:    Cargo en la estructura de avisos los datos que obtengo de la
//                                      tabla 'Avisos' por el nis_rad.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nis  (nis_rad, por el cual se realiza el select)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    estructura de avisos
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      24/04/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime        ldt_f_alta, ldt_h_alta


SetPointer(HourGlass!)


SELECT "GI_AVISOS"."NOMBRE",   
       "GI_AVISOS"."APE1",   
       "GI_AVISOS"."APE2",   
       "GI_AVISOS"."DOC_ID",   
       "GI_AVISOS"."TIP_DOC",   
       "GI_AVISOS"."TIP_AVISO",   
       "GI_AVISOS"."IND_PELIGRO",   
       "GI_AVISOS"."PRIORIDAD",   
       "GI_AVISOS"."TFNO_CLI",   
       "GI_AVISOS"."EST_AVISO",   
       "GI_AVISOS"."OBS_TELEGESTIONES",   
       "GI_AVISOS"."IND_AYUDA",   
       "GI_AVISOS"."DUPLICADOR",   
       "GI_AVISOS"."NUM_PUERTA",   
       "GI_AVISOS"."ESQUINA",   
       "GI_AVISOS"."IND_IMPROCEDENTE",   
       "GI_AVISOS"."IND_CLI_IMP",   
       "GI_AVISOS"."NOM_CALLE",   
       "GI_AVISOS"."NOM_PROV",   
       "GI_AVISOS"."NOM_DEPTO",   
       "GI_AVISOS"."NOM_MUNIC",   
       "GI_AVISOS"."NOM_LOC",   
       "GI_AVISOS"."CO_ALCANCE",   
       "GI_AVISOS"."CO_PAIS",
       "GI_AVISOS"."NRO_AVISO",
       "GI_AVISOS"."NRO_TELEFONISTA",
       "GI_AVISOS"."F_ALTA",
       "GI_AVISOS"."NRO_OT",       
       "GI_AVISOS"."NRO_CENTRO",
       "GI_AVISOS"."NRO_CMD",
       "GI_AVISOS"."NRO_MESA",
       "GI_AVISOS"."NRO_INSTALACION",
                 "GI_AVISOS"."NRO_INCIDENCIA",
                 "GI_AVISOS"."NRO_LLAMADAS"
INTO   :is_avisos.gs_nombre,   
       :is_avisos.gs_ape1,   
       :is_avisos.gs_ape2,   
       :is_avisos.gs_doc_id,   
       :is_avisos.gs_tip_doc,   
       :is_avisos.gi_tip_aviso,   
       :is_avisos.gi_ind_peligro,   
       :is_avisos.gi_prioridad,   
       :is_avisos.gs_tfno_cli,   
       :is_avisos.gi_est_aviso,   
       :is_avisos.gs_obs_telegestiones,   
       :is_avisos.gi_ind_ayuda,   
       :is_avisos.gs_duplicador,   
       :is_avisos.gl_num_puerta,   
       :is_avisos.gs_esquina,   
       :is_avisos.gi_ind_improcedente,   
       :is_avisos.gi_ind_cli_imp,  
       :is_avisos.gs_nom_calle,   
       :is_avisos.gs_nom_prov,   
       :is_avisos.gs_nom_depto,   
       :is_avisos.gs_nom_munic,   
       :is_avisos.gs_nom_loc,   
       :is_avisos.gi_co_alcance,   
       :is_avisos.gs_co_pais,
       :is_avisos.gl_nro_aviso,
       :is_avisos.gs_nro_telefonista,
       :ldt_f_alta,
       :is_avisos.gl_nro_ot,
       :is_avisos.gi_nro_centro,
       :is_avisos.gi_nro_cmd,
       :is_avisos.gi_nro_mesa,
       :is_avisos.gl_nro_instalacion,
                 :is_avisos.gl_nro_incidencia,
                 :is_avisos.gl_nro_llamadas
FROM "GI_AVISOS"  
WHERE "GI_AVISOS"."NRO_AVISO" = :pl_nro_aviso;

IF sqlca.SqlCode <> 0 THEN
        gnv_msg.f_mensaje("ER11","","",OK!)
//      SetNull(is_avisos)

        setnull(is_avisos.gl_nro_aviso)
        setnull(is_avisos.gs_usuario)
        setnull(is_avisos.gd_f_actual)
        setnull(is_avisos.gt_h_actual)
        setnull(is_avisos.gs_programa)
        setnull(is_avisos.gl_nis_rad)
        setnull(is_avisos.gs_nombre)
        setnull(is_avisos.gs_ape1)
        setnull(is_avisos.gs_ape2)
        setnull(is_avisos.gs_doc_id)
        setnull(is_avisos.gs_tip_doc)
        setnull(is_avisos.gs_co_pais)
        setnull(is_avisos.gi_co_alcance)
        setnull(is_avisos.gi_tip_aviso)
        setnull(is_avisos.gi_ind_peligro)
        setnull(is_avisos.gi_prioridad)
        setnull(is_avisos.gd_f_alta)
        setnull(is_avisos.gt_h_alta)
        setnull(is_avisos.gs_tfno_cli)
        setnull(is_avisos.gi_est_aviso)
        setnull(is_avisos.gs_obs_telegestiones)
        setnull(is_avisos.gs_obs_cmd)
        setnull(is_avisos.gi_ind_ayuda)
        setnull(is_avisos.gs_duplicador)
        setnull(is_avisos.gl_num_puerta)
        setnull(is_avisos.gl_cod_calle)
        setnull(is_avisos.gl_cod_loc)
        setnull(is_avisos.gl_cod_munic)
        setnull(is_avisos.gi_cod_prov)
        setnull(is_avisos.gi_cod_depto)
        setnull(is_avisos.gl_nro_brigada)
        setnull(is_avisos.gs_esquina)
        setnull(is_avisos.gs_cgv_sum)
        setnull(is_avisos.gi_nro_centro)
        setnull(is_avisos.gi_nro_telegestiones)
        setnull(is_avisos.gl_nro_instalacion)
        setnull(is_avisos.gi_nro_cmd)
        setnull(is_avisos.gi_nro_mesa)
        setnull(is_avisos.gl_nro_incidencia)
        setnull(is_avisos.gi_ind_improcedente)
        setnull(is_avisos.gs_nro_telefonista)
        setnull(is_avisos.gs_nom_calle)
        setnull(is_avisos.gi_ind_cli_imp)
        setnull(is_avisos.gs_nom_prov)
        setnull(is_avisos.gs_nom_depto)
        setnull(is_avisos.gs_nom_munic)
        setnull(is_avisos.gs_nom_loc)
        setnull(is_avisos.gl_nro_ot)
        setnull(is_avisos.gdt_f_res)
        setnull(is_avisos.gdt_h_res)
        setnull(is_avisos.gs_ref_dir)
        setnull(is_avisos.gi_est_batch)
        setnull(is_avisos.gdt_f_batch)
        setnull(is_avisos.gi_cod_hor)
        setnull(is_avisos.gi_inc_asoc)
        setnull(is_avisos.gl_nro_llamadas)






//
        RETURN is_avisos
ELSE
        is_avisos.gd_f_alta = ldt_f_alta
        RETURN is_avisos
END IF

end function

public function integer fnu_v_aviso_pendiente (ref long pl_ex_avi_pend, long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_v_aviso_pendiente
//
// Objetivo:    Verifico la existencia de un aviso pendiente para el
//                                      suministro pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pi_ex_avi_pend (cargo si existe aviso pendiente o n$$HEX1$$f300$$ENDHEX$$)
//                                      pl_nis                  (id. del suministro a verificar)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (existe aviso pendiente o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      22/04/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Leo Avisos por Nis_Rad
// Si Avisos.estado = Pendiente (1)
// est:Existe_Aviso_Pendiente = 1
// Y guardo el nro. del aviso

int li_avi_res


SetPointer(HourGlass!)


li_avi_res = fgci_aviso_resuelto

SELECT DISTINCT "GI_AVISOS"."NRO_AVISO"
INTO :pl_ex_avi_pend
FROM "GI_AVISOS"
WHERE ( "GI_AVISOS"."NIS_RAD" = :pl_nis ) AND  
      NOT ( "GI_AVISOS"."EST_AVISO" = :li_avi_res )
USING sqlca;

IF sqlca.SqlCode = 0 THEN
        RETURN pl_ex_avi_pend
ELSEIF sqlca.SqlCode = 100 THEN
        RETURN 0
ELSE
        gnv_msg.f_mensaje("ER04","","",OK!)
        RETURN -1
END IF


 
end function

public function integer fnu_a_aviso (ref s_avisos pstr_aviso);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_a_aviso
// 
// Objetivo:    Actualiza los datos del aviso modificados;
//                                      (Centro, CMD y Puesto), observaciones CMD y prioridad;
//                                      en las tablas que corresponden, es decir:
//                                      "avisos","avisos_instalacion".
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:  pstr_aviso (estructura de avisos, con los datos.)
//              Entrada:                
//
//              Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      17/05/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_f_actual

SetPointer(HourGlass!)


ldt_f_actual = fgnu_fecha_actual()

UPDATE "GI_AVISOS"  
SET "USUARIO" = :gs_usuario,   
    "F_ACTUAL" = :ldt_f_actual,   
    "PROGRAMA" = 'w_inf_aviso',   
    "PRIORIDAD" = :pstr_aviso.gi_prioridad,   
    "OBS_CMD" = :pstr_aviso.gs_obs_cmd,   
    "NRO_CENTRO" = :pstr_aviso.gi_nro_centro,   
    "NRO_CMD" = :pstr_aviso.gi_nro_cmd,   
    "NRO_MESA" = :pstr_aviso.gi_nro_mesa  
WHERE "NRO_AVISO" = :pstr_aviso.gl_nro_aviso  ;

IF sqlca.SqlCode <> 0 THEN
        gnv_msg.f_mensaje("EA04","","",OK!)
        RETURN -1
END IF


UPDATE "GI_AVISOS_INSTALACION"  
SET "USUARIO" = :gs_usuario,   
    "F_ACTUAL" = :ldt_f_actual,   
    "PROGRAMA" = 'w_inf_aviso',   
    "NRO_ZONA" = :pstr_aviso.gi_nro_centro,   
    "NRO_CMD" = :pstr_aviso.gi_nro_cmd,   
    "NRO_SECTOR" = :pstr_aviso.gi_nro_mesa  
WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pstr_aviso.gl_nro_aviso;

IF sqlca.SqlCode <> 0 THEN
        gnv_msg.f_mensaje("EA05","","",OK!)
        RETURN -1
END IF

RETURN 1


end function

public subroutine fnu_cargo_imp (ref datawindow pd_dw);string ls_direccion
String ls_apellidos

pd_dw.InsertRow(0)

pd_dw.setitem(1,"nro_aviso",is_avisos.gl_nro_aviso)
//pd_dw.setitem(1,"provincia",is_avisos.gs_nom_prov)
//pd_dw.setitem(1,"municipio",is_avisos.gs_nom_munic)
//pd_dw.setitem(1,"departamente",is_avisos.gs_nom_depto)
//pd_dw.setitem(1,"localidad",is_avisos.gs_nom_loc)
ls_direccion=is_avisos.gs_nom_calle+" "+string(is_avisos.gl_num_puerta)+" "+is_avisos.gs_duplicador
pd_dw.setitem(1,"direccion",ls_direccion)
pd_dw.setitem(1,"esquina",is_avisos.gs_esquina)
//ls_apellidos=is_avisos.gs_ape1+" "+is_avisos.gs_ape2
//pd_dw.setitem(1,"apellidos",ls_apellidos)
//pd_dw.setitem(1,"nombres",is_avisos.gs_nombre)
//pd_dw.setitem(1,"documento",is_avisos.gs_doc_id)
//pd_dw.setitem(1,"tipo_doc",is_avisos.gs_tip_doc)
pd_dw.setitem(1,"telefono",is_avisos.gs_tfno_cli)
//pd_dw.setitem(1,"pais",is_avisos.gs_co_pais)
//pd_dw.setitem(1,"alaramas","Pendiente   Peligro")
pd_dw.setitem(1,"tip_aviso",String(is_avisos.gi_tip_aviso))
//pd_dw.setitem(1,"observaciones",is_avisos.gs_obs_telegestiones)




end subroutine

public function integer fnu_o_inf_comple_sum (ref long pl_ord_servicio, ref long pl_nro_incid, long pl_nis, boolean pb_en_petsum);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_inf_comple_sum
//
// Objetivo:    Obtengo el resto de la informaci$$HEX1$$f300$$ENDHEX$$n sobre el suministro,
//                                      necesaria para completar los datos del aviso.
//                                      Esta funci$$HEX1$$f300$$ENDHEX$$n realiza la mayor parte del procesamiento en
//                                      lo que a la obtenci$$HEX1$$f300$$ENDHEX$$n de la inf. anterior se refiere.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_ord_servicio (cargo la orden de servicio del sum.)
//                                      pl_nro_incid             (cargo la instalaci$$HEX1$$f300$$ENDHEX$$n del sum.)
//                                      pl_nis                   (nis_rad para obtener los datos restantes)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_orden, ll_incidencia  
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup
string ls_t_interrupcion 
int li_centro, li_mesa, li_cmd ,li_fin_cursor   
decimal{0} ll_instalacion, ll_inst_padre
boolean lb_inc_asoc = False

// Puntero a "reloj de arena"
SetPointer(HourGlass!)

// Si el Suministro no est$$HEX2$$e1002000$$ENDHEX$$en PetSum:
// Leo "Ordenes de Servicio" por Nis_Rad, tipo y estado
// Si tipo de O/S es de corte y est$$HEX2$$e1002000$$ENDHEX$$pendiente
// est:O/S = ord:numero de orden

IF NOT pb_en_petsum THEN

        pl_ord_servicio = This.fnu_v_os(pl_nis)
//      IF pl_ord_servicio > 0 THEN
//              is_avisos.gi_ind_improcedente = 1
//      ELSE
//              is_avisos.gi_ind_improcedente = 0
//      END IF
//ELSE
//      is_avisos.gi_ind_improcedente = 1
END IF

// Leo "Aco_Sum" por Nis_Rad
// Leo "SGD_ACOMETIDA" por clave_aco = Aco_Sum:clave_aco
// est:instalacion = SGD_ACOMETIDA.instalacion
SELECT "SGD_ACOMETIDA"."INSTALACION_ORIGEN"  
INTO :ll_instalacion  
FROM "SGD_ACOMETIDA"  
WHERE 
"SGD_ACOMETIDA"."BDI_JOB" = 0 and //DBE 11/01/2000
"SGD_ACOMETIDA"."CODIGO" = (SELECT "ACO_SUM"."NRO_ACOMETIDA"  
                                   FROM "ACO_SUM"  
                                   WHERE "ACO_SUM"."NIS_RAD" = :pl_nis)
USING sqlca;

IF sqlca.SqlCode = 0 THEN
        SELECT "SGD_INSTALACION"."NRO_CENTRO",   
          "SGD_INSTALACION"."NRO_MESA",   
          "SGD_INSTALACION"."NRO_CMD"  
   INTO :li_centro, :li_mesa, :li_cmd  
   FROM "SGD_INSTALACION"  
   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_instalacion
	and "SGD_INSTALACION"."BDI_JOB" = 0 //DBE 10/01/2000
        USING sqlca;
        IF sqlca.SqlCode = 0 THEN
                is_avisos.gl_nro_instalacion = ll_instalacion
                is_avisos.gi_nro_centro = li_centro  
                is_avisos.gi_nro_cmd            = li_cmd  
                is_avisos.gi_nro_mesa   = li_mesa 
        ELSEIF sqlca.SqlCode = -1 THEN
                gnv_msg.f_mensaje("ER19","","",OK!)
                RETURN -1
        ELSE
                is_avisos.gl_nro_instalacion = 0
        END IF
ELSEIF sqlca.SqlCode = 100 THEN
        is_avisos.gl_nro_instalacion = 0
ELSE
        gnv_msg.f_mensaje("ER20","","",OK!)
        RETURN -1
END IF


// Si est:instalacion <> 0
//      Leo "Interrupciones" por Int:instalacion = est:instalacion
//      Si Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
//              Si Int:seleccion = "X" (Marcado)
//                              est:incidencia_confirmada = Int:incidencia
//      SinoSi Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
//              Si Int:seleccion = "P" (Marcado)
//                              posible_incid_asoc = Verdadero
//              Sino
//                      Leo "Instalaciones" por est:instalacion
//                      padre = Ins:instalacion_padre
//              FinSi
// FinSi
//      Verifico_Instalacion_Padre(padre)

is_avisos.gl_nro_incidencia = 0
pl_nro_incid = 0
ldt_fecha_actual = fgnu_fecha_actual()

IF      is_avisos.gl_nro_instalacion <> 0 THEN

        // Declaro y cargo cursor con todas las instalaciones de la jerarqu$$HEX1$$ed00$$ENDHEX$$a
        DECLARE lc_cur_interrup CURSOR FOR
        (SELECT "SGD_INTERRUPCION"."F_REPOSICION",
                                "SGD_INTERRUPCION"."TIP_INTERRUPCION",
                                "SGD_INTERRUPCION"."NRO_INCIDENCIA",
                                "SGD_INTERRUPCION"."F_ALTA"
   FROM "SGD_INTERRUPCION"  
        WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" = :ll_instalacion)
        USING sqlca;

        // Declaro y cargo cursor con todas las instalaciones de la jerarqu$$HEX1$$ed00$$ENDHEX$$a
        DECLARE lc_cur_jerar_inst CURSOR FOR
        (SELECT "SGD_INSTALACION"."NRO_INSTALACION"
        FROM "SGD_INSTALACION"
        START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :ll_instalacion 
		  and "SGD_INSTALACION"."BDI_JOB" = 0 //DBE 10/01/2000
        CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION"
		  and "SGD_INSTALACION"."BDI_JOB" = 0 )//DBE 10/01/2000
        USING sqlca;

        OPEN lc_cur_jerar_inst;

        FETCH lc_cur_jerar_inst INTO :ll_instalacion ;
        
        li_fin_cursor = 0

        DO

                OPEN lc_cur_interrup;

//              FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
//                              :ll_incidencia, :ldt_f_alta_interrup ;
        
                DO 

                        FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
                                        :ll_incidencia, :ldt_f_alta_interrup ;

                        IF sqlca.SqlCode = 0 THEN
                                IF IsNull(Date(ldt_f_reposicion)) AND&
                                                ldt_fecha_actual >= ldt_f_alta_interrup AND&
                                                ls_t_interrupcion ="X" THEN
        
                                        // Asigno el nro. de incidencia asociado a la interrupci$$HEX1$$f300$$ENDHEX$$n
                                        is_avisos.gl_nro_incidencia = ll_incidencia
                                        pl_nro_incid = ll_incidencia
                                        CLOSE lc_cur_jerar_inst ;
                                        EXIT
        
//                              ELSEIF IsNull(Date(ldt_f_reposicion)) AND&
//                                              ldt_fecha_actual >= ldt_f_alta_interrup AND&
//                                              ls_t_interrupcion ="P" AND NOT lb_inc_asoc THEN
//      
//                                      pl_nro_incid = ll_incidencia
//                                      lb_inc_asoc  = True
                                        
                                END IF

//                              FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
//                                              :ll_incidencia, :ldt_f_alta_interrup ;
//
//                        ELSEIF sqlca.SqlCode = -1 THEN
//                              gnv_msg.f_mensaje("ER14","","",OK!)
//                              CLOSE lc_cur_interrup;
//                              CLOSE lc_cur_jerar_inst ;
//                              RETURN -1
                        END IF

                LOOP UNTIL (IsNull(Date(ldt_f_reposicion)) AND &
                                ldt_fecha_actual >= ldt_f_alta_interrup AND&
                                ls_t_interrupcion = "X") OR (sqlca.SqlCode <> 0)                                

                CLOSE lc_cur_interrup;

                FETCH lc_cur_jerar_inst INTO :ll_instalacion;

                IF (sqlca.SqlCode <> 0) THEN
                        CLOSE lc_cur_jerar_inst ;
                        li_fin_cursor = 1
                END IF

        LOOP UNTIL (li_fin_cursor = 1) OR (IsNull(Date(ldt_f_reposicion)) AND&
                        ldt_fecha_actual >= ldt_f_alta_interrup AND&
                        ls_t_interrupcion = "X")

END IF
        

RETURN 1



end function

public function integer fnu_insertar_incidencia (long pl_nro_inc, ref datawindow pd_dw);//NO SE USA 
//DBE 10/02/2000


////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_insertar_incidencia
//
// Objetivo:    Insertar en la datawindow toda la informaci$$HEX1$$f300$$ENDHEX$$n referente
//                                      a la incidencia pasada como parametro
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pd_dw (datawindow)
//      Entrada:         pl_nro_inc (numero de incidencia)
//                              
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      11/05/96                AAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
//String ls_desc_incidencia
//DateTime ldt_f_deteccion , ldt_f_resol
//Int li_nro_centro
//Int li_nro_cmd
//Int li_nro_mesa
//Long ll_pot_afectada
//String ls_nombre_instalacion
//Decimal ldec_nro_inst_afectada
//Long ll_pot_contratada
//Long ll_ccli_afec
//Int li_tip_tension
//Int li_est_actual
//Int li_estado_mantenimiento
//DateTime ldt_h_deteccion
//Long ll_nro_incidencia
//DateTime ldt_f_est_res
//Int li_tip_incidencia
//Int li_ind_suministro
//Int li_resuelve_mant
//Long li_nro_row
//SELECT "SGD_INCIDENCIA"."DESC_INCIDENCIA",
//                 "SGD_INCIDENCIA"."F_DETECCION",
//                 "SGD_INCIDENCIA"."NRO_CENTRO",
//                 "SGD_INCIDENCIA"."NRO_CMD", 
//                 "SGD_INCIDENCIA"."NRO_MESA",
//                 "SGD_INCIDENCIA"."POT_AFECTADA",
//                 "SGD_INCIDENCIA"."NRO_INST_AFECTADA", 
//                 "SGD_INCIDENCIA"."POT_CONTRATADA",
//                 "SGD_INCIDENCIA"."CCLI_AFEC",
//                 "SGD_INCIDENCIA"."TIP_TENSION",
//                 "SGD_INCIDENCIA"."EST_ACTUAL",
//                 "SGD_INCIDENCIA"."ESTADO_MANTENIMIENTO",
//                 "SGD_INCIDENCIA"."H_DETECCION", 
//                 "SGD_INCIDENCIA"."NRO_INCIDENCIA",
//                 "SGD_INCIDENCIA"."F_EST_RES",
//                 "SGD_INCIDENCIA"."TIP_INCIDENCIA",
//                 "SGD_INCIDENCIA"."FEC_RESOLUCION",
//                 "SGD_INCIDENCIA"."IND_SUMINISTRO", 
//                 "SGD_INCIDENCIA"."RESUELVE_MANT"    INTO
//                         :ls_desc_incidencia,
//                        :ldt_f_deteccion,
//                        :li_nro_centro,
//                        :li_nro_cmd,
//                        :li_nro_mesa,
//                        :ll_pot_afectada,
//                        :ldec_nro_inst_afectada,
//                        :ll_pot_contratada,
//                        :ll_ccli_afec,
//                        :li_tip_tension,
//                        :li_est_actual,
//                        :li_estado_mantenimiento,
//                        :ldt_h_deteccion,
//                        :ll_nro_incidencia,
//                        :ldt_f_est_res,
//                        :li_tip_incidencia,
//                        :ldt_f_resol,
//                        :li_ind_suministro,
//                        :li_resuelve_mant
//        FROM "SGD_INCIDENCIA" 
//        WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_inc;
//IF SQLCA.SQLCODE=0 THEN
//li_nro_row = pd_dw.insertrow(0);
////li_nro_row = pd_dw.rowcount();
//pd_dw.SETITEM(li_nro_row,"INCIDENCIA_DESC_INCIDENCIA",ls_desc_incidencia)
//pd_dw.SETITEM(li_nro_row,"F_DETECCION",ldt_f_deteccion)
//pd_dw.SETITEM(li_nro_row,"NRO_CENTRO",li_nro_centro)
//pd_dw.SETITEM(li_nro_row,"NRO_CMD",li_nro_cmd)
//pd_dw.SETITEM(li_nro_row,"NRO_MESA",li_nro_mesa)
//pd_dw.SETITEM(li_nro_row,"POT_AFECTADA",ll_pot_afectada)
//pd_dw.SETITEM(li_nro_row,"NRO_INST_AFECTADA",ldec_nro_inst_afectada)
//pd_dw.SETITEM(li_nro_row,"POT_CONTRATADA",ll_pot_afectada)
//pd_dw.SETITEM(li_nro_row,"CCLI_AFEC",ll_ccli_afec)
//pd_dw.SETITEM(li_nro_row,"TIP_TENSION",li_tip_tension)
//pd_dw.SETITEM(li_nro_row,"INCIDENCIA_EST_ACTUAL",li_est_actual)
//pd_dw.SETITEM(li_nro_row,"ESTADO_MANTENIMIENTO",li_estado_mantenimiento)
//pd_dw.SETITEM(li_nro_row,"H_DETECCION",ldt_h_deteccion)
//pd_dw.SETITEM(li_nro_row,"NRO_INCIDENCIA",ll_nro_incidencia)
//pd_dw.SETITEM(li_nro_row,"F_EST_RES",ldt_f_est_res)
//pd_dw.SETITEM(li_nro_row,"TIP_INCIDENCIA",li_tip_incidencia)
//pd_dw.SETITEM(li_nro_row,"FEC_RESOLUCION",ldt_f_resol)
//pd_dw.SETITEM(li_nro_row,"IND_SUMINISTRO",li_ind_suministro)
//pd_dw.SETITEM(li_nro_row,"RESUELVE_MANT",li_ind_suministro)      
//SELECT NOM_INSTALACION into :ls_nombre_instalacion FROM SGD_INSTALACION WHERE NRO_INSTALACION=:ldec_nro_inst_afectada;
//pd_dw.SETITEM(li_nro_row,"INSTALACION_NOM_INSTALACION",ls_nombre_instalacion)
//END IF
return 1
end function

public function integer fnu_o_inc_nis (ref datawindow pd_dw, long pl_nro_nis);//NO SE USA 
//DBE 10/02/2000

////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_inc_nis
//
// Objetivo:    Obtener todas las incidencias sobre el nis
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pd_dw (data windows)
//      Entrada:         pl_nro_nis (numero de instalacion)
//                              
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      11/05/96                AAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


//
//long ll_nro_orden, ll_incidencia  
//long ll_nro_incid
//datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup
//string ls_t_interrupcion 
//int li_centro, li_mesa, li_cmd ,li_fin_cursor   
//decimal{0} ll_instalacion, ll_inst_padre
//decimal{0} ld_nro_inst
//boolean lb_inc_asoc = False
//
//// Puntero a "reloj de arena"
//SetPointer(HourGlass!)
//
//// Leo "Ordenes de Servicio" por Nis_Rad, tipo y estado
//// Si tipo de O/S es de corte y est$$HEX2$$e1002000$$ENDHEX$$pendiente
//// est:O/S = ord:numero de orden
//
//// Leo "Aco_Sum" por Nis_Rad
//// Leo "SGD_ACOMETIDA" por clave_aco = Aco_Sum:clave_aco
//// est:instalacion = SGD_ACOMETIDA.instalacion
//
//SetNull(ll_instalacion)
//
//SELECT "SGD_ACOMETIDA"."INSTALACION_ORIEGEN"  
//INTO :ld_nro_inst  
//FROM "SGD_ACOMETIDA"  
//WHERE "SGD_ACOMETIDA"."CODIGO" = (  SELECT "ACO_SUM"."NRO_ACOMETIDA"  
//                                     FROM "ACO_SUM"  
//                                     WHERE "ACO_SUM"."NIS_RAD" = :pl_nro_nis)
//USING sqlca;
//
//
////**********************************************************************
//
//IF sqlca.SqlCode = 0 THEN
//        SELECT "SGD_INSTALACION"."NRO_CENTRO",   
//          "SGD_INSTALACION"."NRO_MESA",   
//          "SGD_INSTALACION"."NRO_CMD"  
//   INTO :li_centro, :li_mesa, :li_cmd  
//   FROM "SGD_INSTALACION"  
//   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ld_nro_inst
//        USING sqlca;
//        IF sqlca.SqlCode = 0 THEN
//                is_avisos.gl_nro_instalacion = ld_nro_inst
//        ELSEIF sqlca.SqlCode = -1 THEN
//                gnv_msg.f_mensaje("ER19","","",OK!)
//                RETURN -1
//        ELSE
//                is_avisos.gl_nro_instalacion = 0
//        END IF
//ELSEIF sqlca.SqlCode = 100 THEN
//        is_avisos.gl_nro_instalacion = 0
//ELSE
//        gnv_msg.f_mensaje("ER20","","",OK!)
//        RETURN -1
//END IF
//
//
//// Si est:instalacion <> 0
////      Leo "Interrupciones" por Int:instalacion = est:instalacion
////      Si Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
////              Si Int:seleccion = "X" (Marcado)
////                              est:incidencia_confirmada = Int:incidencia
////      SinoSi Int:fecha_reposicion = nulo Y fecha_aviso >= fecha_alta_interrup
////              Si Int:seleccion = "P" (Marcado)
////                              posible_incid_asoc = Verdadero
////              Sino
////                      Leo "Instalaciones" por est:instalacion
////                      padre = Ins:instalacion_padre
////              FinSi
//// FinSi
////      Verifico_Instalacion_Padre(padre)
//
//is_avisos.gl_nro_incidencia = 0
//ll_nro_incid = 0
//ldt_fecha_actual = fgnu_fecha_actual()
//
//IF      is_avisos.gl_nro_instalacion <> 0 THEN
//
//        // Declaro y cargo cursor con todas las instalaciones de la jerarqu$$HEX1$$ed00$$ENDHEX$$a
//        DECLARE lc_cur_jerar_inst CURSOR FOR
//        (SELECT "SGD_INSTALACION"."NRO_INSTALACION"
//        FROM "SGD_INSTALACION"
//        START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :ld_nro_inst
//        CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION")
//        USING sqlca;
//
//        OPEN lc_cur_jerar_inst;
//
//        FETCH lc_cur_jerar_inst INTO :ll_instalacion ;
//        
//        li_fin_cursor = 0
//
//        DO
//
//                // Declaro y cargo cursor con todas las interrupciones sobre la instalacion
//                DECLARE lc_cur_interrup CURSOR FOR
//                (SELECT  "SGD_INTERRUPCION"."F_REPOSICION",
//                                        "SGD_INTERRUPCION"."TIP_INTERRUPCION",
//                                        "SGD_INTERRUPCION"."NRO_INCIDENCIA",
//                                        "SGD_INTERRUPCION"."F_ALTA"
//           FROM "SGD_INTERRUPCION"  
//        WHERE "SGD_INTERRUPCION"."NRO_INSTALACION" = :ll_instalacion)
//                USING sqlca;
//
//                OPEN lc_cur_interrup;
//
//                SetNull(ldt_f_reposicion);
//
//                FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
//                                :ll_incidencia, :ldt_f_alta_interrup ;
//        
//                DO 
//                        IF sqlca.SqlCode = 0 THEN
//                                IF NOT IsNull(Date(ldt_f_reposicion)) AND&
//                                                ldt_fecha_actual >= ldt_f_alta_interrup AND&
//                                                ls_t_interrupcion ="X" THEN
//
//                                        int li_estado                                           
//
//                                        SELECT "SGD_INCIDENCIA"."EST_ACTUAL"  
//                                        INTO :li_estado  
//                                        FROM "SGD_INCIDENCIA"  
//                                        WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :ll_incidencia   ;
//
//                                        IF li_estado = fgci_incidencia_resuelta THEN
//
//                                                // INSERTO EN LA DATAWINDOWS LA INFORMACION DE LA INCIDENCIA
//                                                This.fnu_insertar_incidencia(ll_incidencia,pd_dw)
//                                        END IF
//                                END IF
//
//                                SetNull(ldt_f_reposicion);
//        
//                                FETCH lc_cur_interrup INTO :ldt_f_reposicion, :ls_t_interrupcion,&
//                                                :ll_incidencia, :ldt_f_alta_interrup ;
//                        END IF
//                LOOP UNTIL (sqlca.SqlCode <> 0)                         
//
//                CLOSE lc_cur_interrup;
//
//                FETCH lc_cur_jerar_inst INTO :ll_instalacion;
//
//                IF (sqlca.SqlCode <> 0) THEN
//                        li_fin_cursor = 1
//                END IF
//
//        LOOP UNTIL (li_fin_cursor = 1) 
//
////OR (IsNull(Date(ldt_f_reposicion)) AND&
////                      ldt_fecha_actual >= ldt_f_alta_interrup AND&
////                      ls_t_interrupcion = "X")
//
//        CLOSE lc_cur_jerar_inst ;
//END IF
//


RETURN 1

end function

public function integer fnu_o_incid (ref datawindow pd_dw, long pl_nro_nis, ref datawindow p_interrupciones, string ps_select_original);//NO SE USA
//DBE 10/01/2000

////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_incid
//
// Objetivo:    Obtener todas las incidencias sobre el nis
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: pd_dw (data windows)
//      Entrada:         pl_nro_nis (numero de instalacion)
//                              
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//  -----               -----------   ----------------------------------------
//  26/09/96         Ad         Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

//long ll_nro_orden, ll_incidencia  
//long ll_nro_incid
//datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup
//string ls_t_interrupcion, ls_clausula_where, ls_modificacion
//int li_centro, li_mesa, li_cmd ,li_fin_cursor   
//decimal{0} ll_instalacion, ll_inst_padre
//decimal{0} ld_nro_inst
//boolean lb_inc_asoc = False
//
//// Puntero a "reloj de arena"
//SetPointer(HourGlass!)
//
//// Leo "Ordenes de Servicio" por Nis_Rad, tipo y estado
//// Si tipo de O/S es de corte y est$$HEX2$$e1002000$$ENDHEX$$pendiente
//// est:O/S = ord:numero de orden
//
//// Leo "Aco_Sum" por Nis_Rad
//// Leo "SGD_ACOMETIDA" por clave_aco = Aco_Sum:clave_aco
//// est:instalacion = SGD_ACOMETIDA.instalacion
//
//
//ls_clausula_where =     "  WHERE SGD_INSTALACION.NRO_INSTALACION = INCIDENCIA.NRO_INST_AFECTADA AND "+ &
//                                                                "       NRO_INCIDENCIA IN ( SELECT NRO_INCIDENCIA " + &
//                                                                "       FROM INTERRUPCION WHERE NRO_INSTALACION IN ( " + & 
//                                                                "       SELECT NRO_INSTALACION FROM SGD_INSTALACION START WITH "+ & 
//                                                                "       NRO_INSTALACION = ( " + & 
//                                                                "       SELECT SGD_ACOMETIDA.INSTALACION_ORIGEN FROM SGD_ACOMETIDA " + & 
//                                                                "       WHERE SGD_ACOMETIDA.CODIGO = ( " + & 
//                                                                "       SELECT ACO_SUM.NRO_ACOMETIDA FROM ACO_SUM " + & 
//                                                                "       WHERE ACO_SUM.NIS_RAD = " + String(pl_nro_nis) + & 
//                                                                "       )) CONNECT      BY PRIOR NRO_INST_PADRE = NRO_INSTALACION ) ) "
//ls_modificacion = "DataWindow.table.Select=~"" + ps_select_original + ls_clausula_where + "~""
//
//ls_modificacion = pd_dw.Modify(ls_modificacion)
//pd_dw.Retrieve()
RETURN 1

end function

public function integer fnu_c_estruc_dir_por_nis (ref s_direccion_cliente pstr_dir_cli, long nro_aviso);////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_c_estruc_dir_por_nis
// 
// Objetivo: Cargar estructura direcci$$HEX1$$f300$$ENDHEX$$n con los valores de las tablas correspondientes,
//           accediendo por el nis.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//                      Entrada: pstr_dir_cli
//       Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

int li_sqlca_code
long ll_nif, ll_cod_cli
string ls_cgv, ls_est_sum
datetime ldt_f_enganche, ldt_f_corte, ldt_f_actual

ldt_f_actual = fgnu_fecha_actual()
SetNull(ldt_f_enganche)
SetNull(ldt_f_corte)

// Verifico si el suministro existe en la tabla 'Suministros',
// y traigo, en caso afirmativo, el 'NIF' correspondiente.

//SELECT SUMINISTROS.NIF, SUMINISTROS.CGV_SUM
//INTO :ll_nif, :ls_cgv
//FROM SUMINISTROS
//WHERE SUMINISTROS.NIS_RAD = :pstr_dir_cli.gl_nis;

//IF sqlca.SqlCode = 0 THEN

        // Si el suministro existe en la tabla 'Suministros',
        // verifico su existencia en 'SumCon' y/o 'PetSum'.
        // En caso afirmativo proceso, sino despliego mensaje,
        // explicando que el sum. no tiene contrato vigente.

        SELECT SUMCON.COD_CLI, SUMCON.EST_SUM, SUMCON.NIF, SUMCON.CGV_SUM
        INTO :ll_cod_cli, :ls_est_sum, :ll_nif, :ls_cgv
        FROM SUMCON
        WHERE   (SUMCON.NIS_RAD = :pstr_dir_cli.gl_nis);

        IF sqlca.SqlCode = 100 THEN

                SELECT PETSUM.COD_CLI, PETSUM.F_ENGANCHE , PETSUM.F_CORTE
                INTO :ll_cod_cli, :ldt_f_enganche, :ldt_f_corte
                FROM PETSUM
                WHERE (PETSUM.NIS_RAD = :pstr_dir_cli.gl_nis);

                IF sqlca.SqlCode < 0 THEN
                        gnv_msg.f_mensaje("ER31","","",OK!)
                        RETURN -1
                END IF
					 
        ELSEIF sqlca.SqlCode = -1 THEN
                gnv_msg.f_mensaje("ER31","","",OK!)
                RETURN -1
        END IF

        // Si encontre al suministro, y est$$HEX2$$e1002000$$ENDHEX$$en 'sumcon' con un estado
        // v$$HEX1$$e100$$ENDHEX$$lido, o lo fu$$HEX2$$ed002000$$ENDHEX$$a buscar a 'petsum'
        // Si la fecha actual est$$HEX2$$e1002000$$ENDHEX$$entre las fechas de:
        // enganche y corte, del suministro en 'petsum'
        IF sqlca.SqlCode = 0 AND (ls_est_sum = "EC011" OR ls_est_sum = "EC012"&
                         OR ls_est_sum = "EC013" OR ls_est_sum = "EC014" OR &
                        (ldt_f_actual >= ldt_f_enganche AND ldt_f_actual <= ldt_f_corte)) THEN

                // Si el suministro existe en las tres tablas, traigo toda la 
                // inf. necesaria para el aviso y la cargo en la estructura.
                
                SELECT COD_CALLE, NUM_PUERTA, DUPLICADOR, COD_LOCAL, COD_MUNIC,   
              COD_PROV, COD_DEPTO, NOM_CLI, APE1_CLI, APE2_CLI, TO_CHAR(TFNO_CLI),   
              DOC_ID, TIP_DOC, CO_PAIS, NOM_CALLE, NOM_DEPTO, NOM_PROV,
              NOM_LOCAL, NOM_MUNIC, DESC_COD
                INTO  :pstr_dir_cli.gl_codcalle, :pstr_dir_cli.gl_numero,
                                :pstr_dir_cli.gs_duplic, 
                                :pstr_dir_cli.gl_codloc, :pstr_dir_cli.gl_codmun,
                                :pstr_dir_cli.gl_codprov, :pstr_dir_cli.gl_coddepto,
                                :pstr_dir_cli.gs_nom, :pstr_dir_cli.gs_ape1,
                                :pstr_dir_cli.gs_ape2,  :pstr_dir_cli.gs_telefono, :pstr_dir_cli.gs_doc,
                                :pstr_dir_cli.gs_tipo_doc,      :pstr_dir_cli.gs_co_pais,
                                :pstr_dir_cli.gs_calle, :pstr_dir_cli.gs_depto,
                                :pstr_dir_cli.gs_prov, :pstr_dir_cli.gs_local,
                                :pstr_dir_cli.gs_munic, :pstr_dir_cli.gs_pais   
                FROM  AVISO_POR_NIS 
                WHERE  NIF = :ll_nif AND COD_CLI = :ll_cod_cli ;
        
                IF sqlca.SqlCode = 0 THEN
                        pstr_dir_cli.gs_pisodpto = ls_cgv
                          IF ls_est_sum = "EC013" THEN
                                gnv_msg.f_mensaje("AR15","","",OK!)
                                RETURN 3
                        ELSE
                                RETURN 1
                        END IF
                ELSEIF sqlca.SqlCode = 100 THEN
                        RETURN 0
                ELSE
                        gnv_msg.f_mensaje("ER31","","",OK!)
                        RETURN -1
                END IF
        ELSE
                RETURN 2
        END IF
//ELSEIF sqlca.SqlCode = 100 THEN
//      RETURN 0
//ELSE
//      gnv_msg.f_mensaje("ER31","","",OK!)
//      RETURN -1
//END IF



end function

public function integer fnu_c_estructura_avisos (s_direccion_cliente psrt_dir_cli, long pl_nro_aviso, ref datawindow pdw_inf_resumen);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_c_estructura_avisos
// 
// Objetivo:    Carga en la estructura de avisos los datos que traen
//                                      cargados los par$$HEX1$$e100$$ENDHEX$$metros, y algunos que calcula en base a 
//                                      los anteriores.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pstr_dir_cli     (estructura con toda la informaci$$HEX1$$f300$$ENDHEX$$n del cliente)
//                                      pi_nro_aviso     (nro. del aviso)       
//                                      pdw_inf_resumen (datawindow con la inf. resumen del aviso)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      24/02/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_fecha
string  ls_programa

SetPointer(HourGlass!)


ldt_fecha   = fgnu_fecha_actual()
ls_programa = "c_estruc_avi"

// Acepto el texto ingresado en inf. resumen del aviso
pdw_inf_resumen.AcceptText()

// Cargo estructura de avisos
is_avisos.gl_nro_aviso = pl_nro_aviso
is_avisos.gs_usuario = gs_usuario
is_avisos.gd_f_actual = ldt_fecha
is_avisos.gs_programa = ls_programa

IF NOT IsNull(psrt_dir_cli.gl_nis) THEN
        is_avisos.gl_nis_rad = psrt_dir_cli.gl_nis
END IF
IF NOT IsNull(psrt_dir_cli.gs_nom) THEN
        is_avisos.gs_nombre = psrt_dir_cli.gs_nom
END IF
IF NOT IsNull(psrt_dir_cli.gs_ape1) THEN
        is_avisos.gs_ape1 = psrt_dir_cli.gs_ape1
END IF
IF NOT IsNull(psrt_dir_cli.gs_ape2) AND psrt_dir_cli.gs_ape2 <> "" AND &
                psrt_dir_cli.gs_ape2 <> " " THEN
        is_avisos.gs_ape2 = psrt_dir_cli.gs_ape2
ELSE
        is_avisos.gs_ape2 = " "
END IF
IF NOT IsNull(psrt_dir_cli.gs_doc) THEN
        is_avisos.gs_doc_id = psrt_dir_cli.gs_doc
END IF
IF NOT IsNull(psrt_dir_cli.gs_tipo_doc) THEN
        is_avisos.gs_tip_doc = psrt_dir_cli.gs_tipo_doc
END IF
// Mercedes Ind_cliente_Importante
// Fin Ind_cliente_Importante
IF NOT IsNull(pdw_inf_resumen.GetItemNumber(1,"co_alcance")) THEN
        is_avisos.gi_co_alcance = pdw_inf_resumen.GetItemNumber(1,"co_alcance")
ELSE
        is_avisos.gi_co_alcance = 1
END IF
IF NOT IsNull(pdw_inf_resumen.GetItemNumber(1,"tip_aviso")) THEN
        is_avisos.gi_tip_aviso = pdw_inf_resumen.GetItemNumber(1,"tip_aviso")
ELSE
        is_avisos.gi_tip_aviso = 1
END IF
is_avisos.gi_ind_peligro = fnu_o_indice_de_peligro(is_avisos.gi_tip_aviso)
IF is_avisos.gi_ind_peligro = 1 THEN
        is_avisos.gi_prioridad = fgci_prioridad_media
ELSEIF is_avisos.gi_ind_peligro = 0 THEN
        is_avisos.gi_prioridad = fgci_prioridad_baja
END IF
is_avisos.gd_f_alta = ldt_fecha
IF NOT IsNull(psrt_dir_cli.gs_telefono) AND psrt_dir_cli.gs_telefono <> ""&
                AND psrt_dir_cli.gs_telefono <> " " THEN
        is_avisos.gs_tfno_cli = psrt_dir_cli.gs_telefono
ELSE
        is_avisos.gs_tfno_cli = "0"
END IF
IF is_avisos.gl_nro_incidencia = 0 THEN
        is_avisos.gi_est_aviso = fgci_aviso_pendiente
        is_avisos.gi_inc_asoc  = 0
ELSE
        is_avisos.gi_est_aviso = fgci_aviso_asociado
        is_avisos.gi_inc_asoc  = 1
END IF
IF NOT IsNull(pdw_inf_resumen.GetItemString(1,"obs_telegestiones")) AND& 
                pdw_inf_resumen.GetItemString(1,"obs_telegestiones") <> "" AND& 
                pdw_inf_resumen.GetItemString(1,"obs_telegestiones") <> " " THEN
        is_avisos.gs_obs_telegestiones = pdw_inf_resumen.GetItemString(1,"obs_telegestiones")
ELSE
        is_avisos.gs_obs_telegestiones = " "
END IF
is_avisos.gs_obs_cmd = " "
is_avisos.gi_ind_ayuda = 0
IF NOT IsNull(psrt_dir_cli.gs_duplic) AND psrt_dir_cli.gs_duplic <> ""&
                AND psrt_dir_cli.gs_duplic <> " " THEN
        is_avisos.gs_duplicador = psrt_dir_cli.gs_duplic
ELSE
        is_avisos.gs_duplicador = " "
END IF
IF NOT IsNull(psrt_dir_cli.gl_numero) THEN
        is_avisos.gl_num_puerta = psrt_dir_cli.gl_numero
ELSE
        is_avisos.gl_num_puerta = 0
END IF
IF NOT IsNull(psrt_dir_cli.gs_calle) AND psrt_dir_cli.gs_calle <> "" AND&
                psrt_dir_cli.gs_calle <> " " THEN
        is_avisos.gs_nom_calle = LeftTrim(psrt_dir_cli.gs_calle)                        // Calle sin espacios al principio
ELSE
        is_avisos.gs_nom_calle = " "
END IF
is_avisos.gl_nro_brigada = 0
IF NOT IsNull(psrt_dir_cli.gs_esq_cond) AND psrt_dir_cli.gs_esq_cond <> ""&
                AND psrt_dir_cli.gs_esq_cond <> " " THEN
        is_avisos.gs_esquina = psrt_dir_cli.gs_esq_cond
ELSE
        is_avisos.gs_esquina = " "
END IF


// Si se tiene instalaci$$HEX1$$f300$$ENDHEX$$n que alimente al suministro nos quedamos con
// los valores obtenidos del registro de la misma.
// Sino se obtienen de la tabla de localidad por cod_local.

IF is_avisos.gl_nro_instalacion = 0 THEN

        IF This.fnu_o_centro_cmd_mesa(is_avisos.gi_nro_centro,is_avisos.gi_nro_cmd,&
                        is_avisos.gi_nro_mesa,is_avisos.gl_cod_loc) = 0 THEN
                RETURN 0
        END IF
END IF

is_avisos.gi_nro_telegestiones = gi_nro_centro
is_avisos.gs_nro_telefonista = gs_usuario

IF NOT IsNull(psrt_dir_cli.gs_prov) THEN
        is_avisos.gs_nom_prov  = psrt_dir_cli.gs_prov  
END IF
IF NOT IsNull(psrt_dir_cli.gs_depto) THEN
        is_avisos.gs_nom_depto = psrt_dir_cli.gs_depto
END IF
IF NOT IsNull(psrt_dir_cli.gs_munic) THEN
        is_avisos.gs_nom_munic = psrt_dir_cli.gs_munic
END IF
IF NOT IsNull(psrt_dir_cli.gs_local) THEN
        is_avisos.gs_nom_loc   = psrt_dir_cli.gs_local
END IF


SetNull(is_avisos.gdt_f_res)
SetNull(is_avisos.gdt_h_res)

is_avisos.gs_ref_dir = " "

//is_avisos.gi_est_batch
//is_avisos.gdt_f_batch

is_avisos.gi_cod_hor = fgrn_intervalo_horario(ldt_fecha)
IF is_avisos.gi_cod_hor = -1 THEN
        gnv_msg.f_mensaje("ER59","","",OK!)
        RETURN -1
END IF


RETURN 1


end function

public function integer fnu_v_aviso_ayuda (ref datawindow pdw_cli, ref datawindow pdw_dir, ref datawindow pdw_avi, singlelineedit psle_esq, singlelineedit psle_tel, long pl_nro_aviso, integer pi_clase_avi);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_v_aviso_ayuda
//
// Objetivo:    Carga en la estructura de avisos los datos que traen
//                                      cargados los par$$HEX1$$e100$$ENDHEX$$metros, y algunos que calcula en base a 
//                                      los anteriores, valid$$HEX1$$e100$$ENDHEX$$ndolos.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pdw_cli (datawindow con la informaci$$HEX1$$f300$$ENDHEX$$n del cliente)
//                                      pdw_dir (datawindow con la inf. de la direcci$$HEX1$$f300$$ENDHEX$$n)        
//                                      pdw_avi (datawindow con la inf. resumen del aviso)
//                                      psle_esq (Campo con la Esquina/Condominio)
//                                      psle_tel (Campo con el tel$$HEX1$$e900$$ENDHEX$$fono del cliente)
//                                      pi_nro_aviso (Nro. del aviso asignado)
//
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (correcto o err$$HEX1$$f300$$ENDHEX$$neo)
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//      14/04/96                HMA                     Modificaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_prov, ls_munic, ls_local, ls_depto, ls_programa
decimal{0} ldec_nro_inst_ayu, ldec_nro_inst_alum
datetime ldt_fecha
int li_ccm

SetPointer(HourGlass!)


ldt_fecha                        = fgnu_fecha_actual()
ls_programa                      = "v_avi_ayuda"
ldec_nro_inst_ayu  = fgcdec_aviso_de_ayuda
ldec_nro_inst_alum = fgcdec_aviso_alumbrado_publico


is_avisos.gs_nom_prov  = pdw_dir.GetItemString(1,"provincia")
is_avisos.gs_nom_depto = pdw_dir.GetItemString(1,"depto")
is_avisos.gs_nom_munic = pdw_dir.GetItemString(1,"municipio")
is_avisos.gs_nom_loc      = pdw_dir.GetItemString(1,"localidad")

IF Len(String(parnum2)) <= 3 THEN
        is_avisos.gi_cod_prov   = parnum2
END IF

is_avisos.gi_cod_depto  = parnum3
is_avisos.gl_cod_munic  = parnum4
is_avisos.gl_cod_loc            = parnum5

IF NOT IsNull(pdw_dir.GetItemString(1,"duplic")) AND&
                pdw_dir.GetItemString(1,"duplic") <> "" THEN
        is_avisos.gs_duplicador = pdw_dir.GetItemString(1,"duplic")
ELSE
        is_avisos.gs_duplicador = " "
END IF
IF NOT IsNull(pdw_dir.GetItemString(1,"numero")) AND&
                pdw_dir.GetItemString(1,"numero") <> "" THEN
        is_avisos.gl_num_puerta = Integer(pdw_dir.GetItemString(1,"numero"))
ELSE
        is_avisos.gl_num_puerta = 0
END IF
IF NOT IsNull(pdw_dir.GetItemString(1,"calle")) AND&
                pdw_dir.GetItemString(1,"calle") <> "" THEN
        is_avisos.gs_nom_calle = pdw_dir.GetItemString(1,"calle")
ELSE
        is_avisos.gs_nom_calle = " "
END IF
IF NOT psle_esq.text = "" THEN
        is_avisos.gs_esquina = psle_esq.text
ELSE
        is_avisos.gs_esquina = " "
END IF

is_avisos.gl_nro_aviso = pl_nro_aviso
is_avisos.gs_usuario = gs_usuario
is_avisos.gd_f_actual = ldt_fecha
is_avisos.gs_programa = ls_programa
is_avisos.gl_nis_rad = 0
is_avisos.gl_nro_brigada = 0

IF NOT IsNull(pdw_cli.GetItemString(1,"nombre")) AND&
                pdw_cli.GetItemString(1,"nombre") <> "" THEN
        is_avisos.gs_nombre = pdw_cli.GetItemString(1,"nombre")
ELSE
        is_avisos.gs_nombre = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"ap1")) AND&
                pdw_cli.GetItemString(1,"ap1") <> "" THEN
        is_avisos.gs_ape1 = pdw_cli.GetItemString(1,"ap1")
ELSE
        is_avisos.gs_ape1 = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"ap2")) AND&
                pdw_cli.GetItemString(1,"ap2") <> "" THEN
        is_avisos.gs_ape2 = pdw_cli.GetItemString(1,"ap2")
ELSE
        is_avisos.gs_ape2 = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"doc_id")) AND&
                pdw_cli.GetItemString(1,"doc_id") <> "" THEN
        is_avisos.gs_doc_id = pdw_cli.GetItemString(1,"doc_id")
ELSE
        is_avisos.gs_doc_id = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"tip_doc")) AND&
                pdw_cli.GetItemString(1,"tip_doc") <> "" THEN
        is_avisos.gs_tip_doc = pdw_cli.GetItemString(1,"tip_doc")
ELSE
        is_avisos.gs_tip_doc = " "
END IF
IF NOT IsNull(pdw_cli.GetItemString(1,"co_pais")) AND&
                pdw_cli.GetItemString(1,"co_pais") <> "" THEN
        is_avisos.gs_co_pais = pdw_cli.GetItemString(1,"co_pais")
ELSE
        is_avisos.gs_co_pais = " "
END IF
IF NOT IsNull(psle_tel.text) AND psle_tel.text <> "" THEN
        is_avisos.gs_tfno_cli = psle_tel.text
ELSE
        is_avisos.gs_tfno_cli = "0"
END IF
IF NOT IsNull(pdw_avi.GetItemNumber(1,"co_alcance")) THEN
        is_avisos.gi_co_alcance = pdw_avi.GetItemNumber(1,"co_alcance")
ELSE
        is_avisos.gi_co_alcance = 1
END IF
IF NOT IsNull(pdw_avi.GetItemNumber(1,"tip_aviso")) THEN
        is_avisos.gi_tip_aviso = pdw_avi.GetItemNumber(1,"tip_aviso")
ELSE
        is_avisos.gi_tip_aviso = 1
END IF
IF NOT IsNull(pdw_avi.GetItemString(1,"obs_telegestiones")) THEN
        is_avisos.gs_obs_telegestiones = pdw_avi.GetItemString(1,"obs_telegestiones")
ELSE
        is_avisos.gs_obs_telegestiones = " "
END IF
is_avisos.gi_ind_peligro = fnu_o_indice_de_peligro(is_avisos.gi_tip_aviso)
IF is_avisos.gi_ind_peligro = 1 THEN
        is_avisos.gi_prioridad = fgci_prioridad_media
ELSEIF is_avisos.gi_ind_peligro = 0 THEN
        is_avisos.gi_prioridad = fgci_prioridad_baja
END IF
is_avisos.gd_f_alta = ldt_fecha
is_avisos.gi_est_aviso = fgci_aviso_pendiente
is_avisos.gs_obs_cmd = " "
is_avisos.gi_ind_ayuda = pi_clase_avi
IF pi_clase_avi = 1 THEN
        is_avisos.gl_nro_instalacion = ldec_nro_inst_ayu  
ELSEIF pi_clase_avi = 2 THEN
        is_avisos.gl_nro_instalacion = ldec_nro_inst_alum
END IF
is_avisos.gs_cgv_sum = " "
is_avisos.gi_ind_cli_imp = 0
is_avisos.gl_nro_incidencia = 0

li_ccm = This.fnu_o_centro_cmd_mesa(is_avisos.gi_nro_centro,is_avisos.gi_nro_cmd,&
                is_avisos.gi_nro_mesa,is_avisos.gl_cod_loc) 
IF li_ccm = 0 THEN
        RETURN 0
ELSEIF li_ccm = -1 THEN
        RETURN -1
END IF

is_avisos.gi_nro_telegestiones = gi_nro_centro
is_avisos.gi_ind_improcedente = 0
is_avisos.gs_nro_telefonista = gs_usuario


is_avisos.gi_cod_hor = fgrn_intervalo_horario(ldt_fecha)
IF is_avisos.gi_cod_hor = -1 THEN
        gnv_msg.f_mensaje("ER59","","",OK!)
        RETURN -1
END IF
SetNull(is_avisos.gdt_f_res)

RETURN 1
end function

public function long fnu_o_nro_aviso ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     fnu_o_nro_aviso
//
// Objetivo:    Obtengo el n$$HEX1$$fa00$$ENDHEX$$mero de aviso siguiente al $$HEX1$$fa00$$ENDHEX$$ltimo dado
//                                      de alta.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:        --      
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    nro. de aviso
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      15/02/96                HMA                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_aviso
string ls_tabla = "AVISOS"

// Tomo el $$HEX1$$fa00$$ENDHEX$$ltimo valor de nro. de aviso
SELECT "GI_T_ULTIMO"."ULTIMO"  
INTO :ll_nro_aviso  
FROM "GI_T_ULTIMO"  
WHERE "GI_T_ULTIMO"."TABLA" = :ls_tabla
FOR UPDATE
USING sqlca;

// Controlo la carrectitud de la operaci$$HEX1$$f300$$ENDHEX$$n anterior
IF sqlca.SqlCode = 0 THEN
        ll_nro_aviso = ll_nro_aviso + 1
ELSEIF sqlca.SqlCode = 100 THEN
        // Primer registro

        ll_nro_aviso = 1
ELSE
        gnv_msg.f_mensaje("ER01","","",OK!)
        RETURN -1
END IF

// Actualizo el archivo "t_ultimo"
// NO estoy actualizando todos los campos de la tabla
UPDATE "GI_T_ULTIMO"  
SET "ULTIMO" = :ll_nro_aviso  
WHERE "GI_T_ULTIMO"."TABLA" = :ls_tabla
USING sqlca;

// Controlo la carrectitud de la operaci$$HEX1$$f300$$ENDHEX$$n anterior
IF sqlca.SqlCode = -1 THEN
        gnv_msg.f_mensaje("ER02","","",OK!)
        gnu_u_transaction.uf_rollback();
        RETURN -1
ELSE
        gnu_u_transaction.uf_commit();
END IF

RETURN ll_nro_aviso
end function

on u_avi_2004_nu_form_inf_resumen.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_avi_2004_nu_form_inf_resumen.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


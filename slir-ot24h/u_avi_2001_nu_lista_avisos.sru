HA$PBExportHeader$u_avi_2001_nu_lista_avisos.sru
forward
global type u_avi_2001_nu_lista_avisos from nonvisualobject
end type
end forward

global type u_avi_2001_nu_lista_avisos from nonvisualobject
end type
global u_avi_2001_nu_lista_avisos u_avi_2001_nu_lista_avisos

type variables
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
integer ii_selected_row

// Data window de tipo de aviso
DataWindowChild ddw_tipo_aviso

s_avisos		is_avisos
end variables

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public function integer fnu_obtener_filas (ref datawindow pdw_lista_avi)
public function integer fnu_asociar_aviso (long pl_nro_aviso, long pl_nro_incidencia, integer pi_ind_cli_imp, integer pi_ind_avi_pel, datetime pdt_f_alta)
public function integer fnu_g_sum_imp (long pl_nis, long pl_nro_incid)
public function integer fnu_estado_incid (long pl_nro_inc)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw);////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos
//
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos y retrieve de la datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
//////////////////////////////////////////////////////////////

pd_dw.SetTransObject(sqlca)

RETURN pd_dw.Retrieve(0)

end function

public function integer fnu_obtener_filas (ref datawindow pdw_lista_avi);////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_obtener_filas
//
// Objetivo: Obtiene la fila de los datos de avisos  .
//          
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pdw_lista_avi
//			Salida : --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////////


long ll_fila

DECLARE lc_cur_avi CURSOR FOR
SELECT "GI_AVISOS"."NRO_CENTRO",   
       "GI_AVISOS"."NRO_CMD",   
       "GI_AVISOS"."NRO_MESA",   
       "GI_AVISOS"."NOM_CALLE",   
       "GI_AVISOS"."NUM_PUERTA",   
       "GI_AVISOS"."DUPLICADOR",   
       "GI_AVISOS"."ESQUINA",   
       "GI_AVISOS"."IND_CLI_IMP",   
       "GI_AVISOS"."IND_PELIGRO"  
FROM "GI_AVISOS"  
WHERE ( "GI_AVISOS"."NRO_INSTALACION" = 0 ) OR  
      ( "GI_AVISOS"."IND_AYUDA" = 1 )
USING sqlca;

OPEN lc_cur_avi ;

FETCH lc_cur_avi INTO :is_avisos.gi_nro_centro,   
     :is_avisos.gi_nro_cmd,   
     :is_avisos.gi_nro_mesa,   
     :is_avisos.gs_nom_calle,   
     :is_avisos.gl_num_puerta,   
     :is_avisos.gs_duplicador,   
     :is_avisos.gs_esquina,   
     :is_avisos.gi_ind_cli_imp,   
     :is_avisos.gi_ind_peligro  ;

pdw_lista_avi.SetRedraw(False)

DO
	ll_fila = pdw_lista_avi.InsertRow(0)
	IF ll_fila > 0 THEN

		pdw_lista_avi.SetItem(ll_fila,"avisos_nom_calle",is_avisos.gs_nom_calle)
		pdw_lista_avi.SetItem(ll_fila,"avisos_num_puerta",is_avisos.gl_num_puerta)
		pdw_lista_avi.SetItem(ll_fila,"avisos_esquina",is_avisos.gs_esquina)
		pdw_lista_avi.SetItem(ll_fila,"avisos_duplicador",is_avisos.gs_duplicador)
		pdw_lista_avi.SetItem(ll_fila,"duracion",1)
		pdw_lista_avi.SetItem(ll_fila,"ind_pel",is_avisos.gi_ind_peligro)
		pdw_lista_avi.SetItem(ll_fila,"cliente_imp",is_avisos.gi_ind_cli_imp)
		pdw_lista_avi.SetItem(ll_fila,"avisos_nro_centro",is_avisos.gi_nro_centro)
		pdw_lista_avi.SetItem(ll_fila,"avisos_nro_cmd",is_avisos.gi_nro_cmd)
		pdw_lista_avi.SetItem(ll_fila,"avisos_nro_mesa",is_avisos.gi_nro_mesa)

	END IF


	FETCH lc_cur_avi INTO :is_avisos.gi_nro_centro,   
     :is_avisos.gi_nro_cmd,   
     :is_avisos.gi_nro_mesa,   
     :is_avisos.gs_nom_calle,   
     :is_avisos.gl_num_puerta,   
     :is_avisos.gs_duplicador,   
     :is_avisos.gs_esquina,   
     :is_avisos.gi_ind_cli_imp,   
     :is_avisos.gi_ind_peligro  ;

LOOP UNTIL sqlca.SqlCode <> 0

CLOSE lc_cur_avi;

pdw_lista_avi.SetRedraw(True)

RETURN 1
end function

public function integer fnu_asociar_aviso (long pl_nro_aviso, long pl_nro_incidencia, integer pi_ind_cli_imp, integer pi_ind_avi_pel, datetime pdt_f_alta);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_asociar_aviso
// Objetivo:	Actualiza en 'Avisos', 'Aviso_Instalacion' los 
//					registros correspondientes, de acuerdo con la jerarqu$$HEX1$$ed00$$ENDHEX$$a de 
//					instalaciones, que corresponden al suministro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//		Entrada:	pl_nro_aviso, pl_nro_incidencia, pi_ind_cli_imp, 	
//             pi_ind_avi_pel, pdt_f_alta
//		Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	09/04/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//	24/04/96		HMA 			Modificaci$$HEX1$$f300$$ENDHEX$$n
//  
////////////////////////////////////////////////////////////////////////////////////////////////

datetime ldt_fecha

decimal{0} ldec_nro_instalacion
int li_cant_avisos, li_cant_cli_imp, li_cant_avi_pel,li_clase_aviso,li_cant_avisos_calidad
int li_avi_asoc, li_incid_pend, li_inc_asoc, li_ind_improc,li_ind_calidad, li_est_incidencia
datetime	ld_f_detec,ld_f_resol
string ls_programa,ls_mensaje
long ll_cant_avi
long ll_nro_aviso,ll_ct,ll_cant_av_ct
SetPointer(HourGlass!)

// Cargo en la var. fecha y hora actuales.
ldt_fecha = fgnu_fecha_actual()

ls_programa   = "asociar_aviso"

SELECT "SGD_INCIDENCIA"."EST_ACTUAL",
		   "SGD_ESTADO_OPER"."F_ALTA"
INTO :li_est_incidencia,:ld_f_resol
FROM "SGD_INCIDENCIA", "SGD_ESTADO_OPER"
WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_incidencia
AND "SGD_INCIDENCIA"."NRO_INCIDENCIA" = "SGD_ESTADO_OPER"."NRO_INCIDENCIA" (+) 
AND  "SGD_ESTADO_OPER"."COD_ESTADO" (+)  = :FGCI_INCIDENCIA_SERVICIO_REPUESTO;

IF sqlca.sqlcode = 0 THEN
	IF li_est_incidencia = fgci_incidencia_servicio_repuesto OR li_est_incidencia = fgci_incidencia_resuelta THEN
		li_avi_asoc = fgci_aviso_resuelto
	ELSE
		li_avi_asoc   = fgci_aviso_asociado
	END IF
ELSE
	li_avi_asoc   = fgci_aviso_asociado
END IF

li_incid_pend = fgci_incidencia_pendiente

// Actualizo avisos 

SELECT  "GI_AVISOS"."NRO_AVISO", 
			 "GI_AVISOS"."IND_INC_ASOC",
			 "GI_AVISOS"."IND_IMPROCEDENTE",
			 "GI_AVISOS"."IND_CALIDAD"
INTO :ll_nro_aviso, :li_inc_asoc, :li_ind_improc, :li_ind_calidad
FROM "GI_AVISOS"  
WHERE "GI_AVISOS"."NRO_AVISO" = :pl_nro_aviso FOR UPDATE NOWAIT;

SELECT DISTINCT  "GI_AVISOS_INSTALACION"."CLASE_AVISO"
INTO :li_clase_aviso
FROM "GI_AVISOS_INSTALACION"
WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_aviso;

IF sqlca.SqlCode <> 0 THEN
	gnv_msg.f_mensaje("EA09","","",OK!)
	RETURN -1
END IF

IF pl_nro_incidencia <> 0 THEN		

	IF SQLCA.SQLCODE <> 0 THEN
		gnv_msg.f_mensaje("AA15","","",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El aviso est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado por otro usuario")
		RETURN -1
	END IF
		
	IF li_inc_asoc = 1 then
 		gnv_msg.f_mensaje("AA16","","",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El aviso ha sido previamente asociado a otra incidencia")
		RETURN -1
	END IF
	
	IF li_ind_improc = 1 then
		gnv_msg.f_mensaje("AA17","","",OK!)
//		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El aviso ha sido previamente considerado como improcedente")
		RETURN -1
	END IF
	
	IF li_est_incidencia = fgci_incidencia_servicio_repuesto OR li_est_incidencia = fgci_incidencia_resuelta THEN
			UPDATE "GI_AVISOS"  
			SET "USUARIO" = :gs_usuario,   
				 "F_ACTUAL" = :ldt_fecha,
				 "PROGRAMA" = :ls_programa,
				 "EST_AVISO" = :li_avi_asoc,  
				 "NRO_INCIDENCIA" = :pl_nro_incidencia,
				 "IND_INC_MANUAL" = 1,
				 "FECHA_RES" = :ld_f_resol
			WHERE "GI_AVISOS"."NRO_AVISO" = :pl_nro_aviso ;
	ELSE
			UPDATE "GI_AVISOS"  
			SET "USUARIO" = :gs_usuario,   
				 "F_ACTUAL" = :ldt_fecha,
				 "PROGRAMA" = :ls_programa,
				 "EST_AVISO" = :li_avi_asoc,  
				 "NRO_INCIDENCIA" = :pl_nro_incidencia,
				 "IND_INC_MANUAL" = 1  
			WHERE "GI_AVISOS"."NRO_AVISO" = :pl_nro_aviso ;		
	END IF
	
	IF li_est_incidencia = fgci_incidencia_servicio_repuesto OR li_est_incidencia = fgci_incidencia_resuelta THEN
		li_avi_asoc = fgci_aviso_resuelto
	ELSE
		li_avi_asoc   = fgci_aviso_asociado
	END IF	
	// Obtengo el valor del campo que contiene la cantidad de 
	// avisos asociado a la incidencia, y lo actualizo 
	// incrementado en 1.
	
	SELECT "SGD_INCIDENCIA"."CANT_AVISOS"  
	INTO :ll_cant_avi
	FROM "SGD_INCIDENCIA"  
	WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_incidencia ;
	
	IF sqlca.SqlCode <> 0 THEN
		gnv_msg.f_mensaje("EA09","","",OK!)
		RETURN -1
	END IF
						
	ll_cant_avi ++
	
	UPDATE "SGD_INCIDENCIA"  
	SET "CANT_AVISOS" = :ll_cant_avi  
	WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_incidencia;
	
	IF sqlca.SqlCode <> 0 THEN
		gnv_msg.f_mensaje("EA10","","",OK!)
		RETURN -1
	END IF
END IF

//AHM (09/07/2009) Mejora (1/446555)
long 	ll_codigo		//Valor del SQLCODE anterior

ll_codigo = sqlca.sqlcode
IF fg_verifica_parametro ('CARGA AUTOMATICA OBSERVACIONES SEGUIMIENTO') THEN
	
	UPDATE sgd_estado_oper
	SET observacion =  subStr(observacion || ';' || (SELECT obs_telegestiones FROM gi_avisos WHERE nro_aviso = :pl_nro_aviso), 1, 2000)
	WHERE nro_incidencia = :pl_nro_incidencia AND cod_estado = 1;
	
END IF
sqlca.sqlcode = ll_codigo


IF pl_nro_incidencia <> 0 THEN	
IF sqlca.SqlCode = 0 THEN

	// Comunico la tool a operacion
	
	IF gb_operaciones =  true and li_clase_aviso = fgci_clase_avi_normal then

			SELECT "GI_AVISOS_INSTALACION"."NRO_INSTALACION"  
				INTO :ll_ct
				FROM "GI_AVISOS_INSTALACION"  
				WHERE ( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_aviso ) AND  
							( "GI_AVISOS_INSTALACION"."TIPO_INSTALACION" = :fgci_tipo_ct )   ;
	
			IF sqlca.SqlCode < 0 THEN
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el CT del aviso.")
			END IF
		
			SELECT COUNT(distinct NRO_AVISO)  
				INTO :ll_cant_av_ct
				FROM "GI_AVISOS_INSTALACION"  
				WHERE ( "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :ll_ct and  "GI_AVISOS_INSTALACION"."EST_AVISO" = :fgci_aviso_pendiente  ) ;
							
			IF sqlca.SqlCode < 0 THEN
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pueden contabilizar los avisos")
			END IF				
								
		IF ll_cant_av_ct = 1 then // Como vamos a dar de baja el $$HEX1$$fa00$$ENDHEX$$nico aviso del ct, generamos una tool de baja de aviso.
							
//			gu_rf_servidor_operacion.of_tool_aviso(ll_ct,fgnu_fecha_actual(),0,ls_mensaje,gi_ci_ct)
						
			IF ls_mensaje <> "" then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al dar de alta el tool: " + ls_mensaje,information!,ok!)
			END IF	
							
		END IF
	
	END IF
	//
	
	IF li_avi_asoc = fgci_aviso_resuelto THEN
		// Aviso asociado a una incidencia resuelta
		DELETE "GI_AVISOS_INSTALACION"
		WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_aviso;
		IF sqlca.SqlCode <> 0 THEN
			gnv_msg.f_mensaje("EA06","","",OK!)
			RETURN -1
		END IF
		
	ELSE
		// Actualizo 'Avisos_Res'
		UPDATE "GI_AVISOS_INSTALACION"  
		SET "USUARIO" = :gs_usuario,   
			 "F_ACTUAL" = :ldt_fecha,   
			 "PROGRAMA" = 'ASOC_MAN',   
			 "EST_AVISO" = :li_avi_asoc
		WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :pl_nro_aviso; 
	
		IF sqlca.SqlCode <> 0 THEN
			gnv_msg.f_mensaje("EA06","","",OK!)
			RETURN -1
		END IF
	END IF
END IF
END IF

RETURN 1
end function

public function integer fnu_g_sum_imp (long pl_nis, long pl_nro_incid);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_g_sum_imp
//
// Objetivo: Inserta datos en suministros importantes seg$$HEX1$$fa00$$ENDHEX$$n valores.
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: pl_nro_inc, pl_nis
//			Salida : --
//
// Ambito : P$$HEX1$$fa00$$ENDHEX$$blico
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		-----------		---------
//
//////////////////////////////////////////////////////////////


// FUNCION OBSOLETA, YA NO SE INGRESAN DATOS EN GI_SUM_IMP
				
RETURN 1


end function

public function integer fnu_estado_incid (long pl_nro_inc);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_estado_incid
//
// Objetivo: Obtiene el campo estado actual de la incidencia.
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: pl_nro_inc
//			Salida : --
//
// Ambito : P$$HEX1$$fa00$$ENDHEX$$blico
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		-----------		---------
//
//////////////////////////////////////////////////////////////


int li_est_inc

SELECT "SGD_INCIDENCIA"."EST_ACTUAL"  
INTO :li_est_inc  
FROM "SGD_INCIDENCIA"  
WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_inc;

IF sqlca.SqlCode <> 0 THEN
	gnv_msg.f_mensaje("EI10","","",OK!)
	HALT
END IF

RETURN li_est_inc
end function

on u_avi_2001_nu_lista_avisos.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_avi_2001_nu_lista_avisos.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


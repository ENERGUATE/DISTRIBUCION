HA$PBExportHeader$u_inc_2004_nu_form_inf_general.sru
forward
global type u_inc_2004_nu_form_inf_general from nonvisualobject
end type
end forward

global type u_inc_2004_nu_form_inf_general from nonvisualobject
end type
global u_inc_2004_nu_form_inf_general u_inc_2004_nu_form_inf_general

type variables
w_2301_form_incidencia iw_contenedora
end variables

forward prototypes
public function integer fnu_devolver_estado_mant (ref datawindow pd_dw)
public function long fnu_actualizo_ot ()
public function integer fnu_obt_tens (ref datawindow pd_dw, decimal pdec_nro_inst)
public function long fnu_actualizar_aviso (long pl_nro_aviso, datetime pdt_fec_res)
public function integer fnu_actualizar_ot (long pl_nro_ot, datetime pdt_fec_res)
public function integer fnu_resolver_avisos (long pl_nro_incidencia, datetime pdt_fec_res)
public function integer fnu_resolver_ot (long pl_nro_incidencia, datetime pdt_fec_res)
public function integer fnu_eliminar_seguimiento (ref datawindow pd_dw, long pl_nro_incidencia, integer pi_est_aviso)
public function integer fnu_actualizar_aviso_viejo (ref datawindow pd_dw)
public subroutine fnu_actualizar_seguimiento (long pl_nro_incidencia, integer pl_cod_estado, datetime pdt_fecha)
public function integer fnu_devolver_material (ref datawindow pd_dw)
public function integer fnu_eliminar_interrupciones (long pl_nro_incidencia)
public function integer fnu_eliminar_incidencia (long pl_nro_incidencia)
public function integer fnu_eliminar_seg_inc (long pl_nro_incidencia)
public function integer fnu_eliminar_ot_inc (long pl_nro_incidencia)
public function integer fnu_eliminar_avisos_inc (long pl_nro_incidencia, ref datawindow d_lista_aviso, long ll_nro_aviso, decimal ld_nro_instalacion)
public function integer fnu_eliminar_accion_inc (long pl_nro_incidencia)
public function integer fnu_eliminar_materiales (long pl_nro_incidencia)
public function integer fnu_liberar_brigada (long pl_nro_incidencia, boolean pb_ind_disponible)
end prototypes

public function integer fnu_devolver_estado_mant (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_estado_mant
// 
// Objetivo: Retorna el estado de la incidencia en mantenimiento
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: datawindow
//		Salida:  gi_est_actual_mant 
//						
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	13/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


gi_est_mant=pd_dw.GetItemNumber(1,"estado_mantenimiento")
IF ISNULL(gi_est_mant) THEN
	gi_est_mant=0
END IF
return gi_est_mant
end function

public function long fnu_actualizo_ot ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizo_ot
//
// Objetivo: Actualizo el $$HEX1$$fa00$$ENDHEX$$ltimo valor de ot.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada:
//        Salida :
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


long ll_nro_ot



//Obtengo la ultima ot 
select cod_ot.nextval into :ll_nro_ot from dual;
Return ll_nro_ot
end function

public function integer fnu_obt_tens (ref datawindow pd_dw, decimal pdec_nro_inst);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obt_tens
//
// Objetivo: Obtiene la tensi$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, pdec_nro_inst
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


int li_tension
select tension into :li_tension from sgd_instalacion where nro_instalacion = :pdec_nro_inst
and sgd_instalacion.bdi_job = 0; //DBE 11/01/2000

pd_dw.setitem(1,"tension",li_tension)
return 1
end function

public function long fnu_actualizar_aviso (long pl_nro_aviso, datetime pdt_fec_res);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizar_aviso
//
// Objetivo:  Actualiza el estado del aviso.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_aviso, pdt_fec_res
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


Int li_est_aviso
li_est_aviso=fgci_aviso_resuelto
UPDATE GI_AVISOS SET EST_AVISO =:li_est_Aviso,FECHA_RES =:pdt_fec_res WHERE
	NRO_AVISO=:pl_nro_aviso;
RETURN SQLCA.SQLCODE
end function

public function integer fnu_actualizar_ot (long pl_nro_ot, datetime pdt_fec_res);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizar_ot
//
// Objetivo:  Actualizo orden de trabajo
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_ot, pdt_fec_res
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


Int li_est_ot
li_est_ot = fgci_ot_resuelta
UPDATE "GI_OT" SET EST_OT =:li_est_ot,F_HASTA =:pdt_fec_res WHERE
	NRO_OT=:pl_nro_ot;
RETURN SQLCA.SQLCODE
end function

public function integer fnu_resolver_avisos (long pl_nro_incidencia, datetime pdt_fec_res);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_resolver_avisos
// 
// Objetivo: Resuelve los avisos pendientes con la fecha pasada como
// 			 par$$HEX1$$e100$$ENDHEX$$metro.
//				
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pd_fec_res (d$$HEX1$$ed00$$ENDHEX$$a de resoluci$$HEX1$$f300$$ENDHEX$$n), pl_nro_incidencia 
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/6/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Int lc_cur_est
Int l_fin_cursor
Long ll_nro_aviso
Int li_est_Aviso


// Elimina los posibles registros de la tabla auxiliar de estadisticas de
// avisos que tengan el mismo usuario con el que estoy trabajando

li_est_aviso=fgci_aviso_resuelto
UPDATE GI_AVISOS SET EST_AVISO =:li_est_Aviso,FECHA_RES =:pdt_fec_res
WHERE "GI_AVISOS"."EST_AVISO"<>:li_est_Aviso AND 	
		"GI_AVISOS"."NRO_INCIDENCIA"=:pl_nro_incidencia;
RETURN SQLCA.SQLCODE


li_est_aviso=fgci_aviso_resuelto

Declare lc_cur_est CURSOR FOR
	(SELECT "GI_AVISOS"."NRO_AVISO"	FROM "GI_AVISOS" WHERE "GI_AVISOS"."EST_AVISO"<>:li_est_Aviso and "GI_AVISOS"."NRO_INCIDENCIA"=:pl_nro_incidencia)
	Using sqlca;
OPEN lc_cur_est;
l_fin_cursor=0
FETCH lc_cur_est INTO: ll_Nro_Aviso;
DO 
	IF sqlca.sqlcode = 0 THEN
		fnu_Actualizar_Aviso(ll_nro_aviso,pdt_fec_res)
	ELSEIF sqlca.sqlcode = -1 THEN
		// MENSAJE DE ERROR
		HALT
	END IF
	FETCH lc_cur_est INTO: ll_Nro_Aviso;
	IF sqlca.sqlcode <> 0 THEN
		l_fin_cursor = 1
	END IF
LOOP UNTIL (l_fin_Cursor = 1)
CLOSE lc_cur_est;
Return 1

end function

public function integer fnu_resolver_ot (long pl_nro_incidencia, datetime pdt_fec_res);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_resolver_ot
// 
// Objetivo: Resuelve las ordenes de trabajo que estan trabajando con la
//           fecha pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//				
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
// 		Entrada: pd_fec_res (d$$HEX1$$ed00$$ENDHEX$$a de resoluci$$HEX1$$f300$$ENDHEX$$n), pl_nro_incidencia
//			Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/6/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Int lc_cur_est
Int l_fin_cursor

Long ll_nro_ot
Int li_est_ot_tr
Int li_est_ot_pe



li_est_ot_tr=fgci_ot_trabajando
li_est_ot_pe=fgci_ot_pendiente

Declare lc_cur_est CURSOR FOR SELECT "GI_OT"."NRO_OT"	FROM "GI_OT" WHERE "GI_OT"."EST_OT"=:li_est_ot_tr or "GI_OT"."EST_OT"=:li_est_ot_pe and "GI_OT"."NRO_INCIDENCIA"=:pl_nro_incidencia;
OPEN lc_cur_est;
l_fin_cursor=0
FETCH lc_cur_est INTO: ll_Nro_OT;
DO 
	IF sqlca.sqlcode = 0 THEN
		fnu_Actualizar_ot(ll_nro_ot,pdt_fec_res)
	ELSEIF sqlca.sqlcode = -1 THEN
		// MENSAJE DE ERROR
		HALT
	END IF
	FETCH lc_cur_est INTO: ll_Nro_Ot;
	IF sqlca.sqlcode <> 0 THEN
		l_fin_cursor = 1
	END IF
LOOP UNTIL (l_fin_Cursor = 1)
CLOSE lc_cur_est;  


// ACTUALIZO LAS BRIGADAS DE LA OT
// PONIENDO LA FECHA DE FINALIZACION DE LAS BRIGADAS COMO LA FECHA DE RESUELTA LA INCIDENCIA

	  UPDATE "GI_BRIGADA"  
     SET "IND_DISPONIBLE" = 1  ,"OT" = 0
   WHERE "GI_BRIGADA"."OT" =: ll_nro_ot   ;

  UPDATE "GI_BRIGADA_OT"  
	    SET "F_HASTA" =:pdt_fec_res
   WHERE "GI_BRIGADA_OT"."F_HASTA" is null AND "GI_BRIGADA_OT"."NRO_OT"=:ll_nro_ot ;

Return 1

end function

public function integer fnu_eliminar_seguimiento (ref datawindow pd_dw, long pl_nro_incidencia, integer pi_est_aviso);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_eliminar_seguimiento
//
// Objetivo:  Elimina datos de estado operaciones.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada:
//        Salida :
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


long linull
string lsnull
setnull(linull)
Delete from "SGD_ESTADO_OPER" WHERE "NRO_INCIDENCIA"=:pl_nro_incidencia and "COD_ESTADO"=:pi_est_aviso ;
pd_dw.setitem(1,"ot",linull)
pd_dw.setitem(1,"brigada",linull)
pd_dw.setitem(1,"brigada_mant",linull)
pd_dw.setitem(1,"estado_actual",fgci_incidencia_pendiente)
pd_dw.setitem(1,"causa",linull)
//pd_dw.modify("causa.protect=1")
iw_contenedora.tab_1.tabpage_formulario.st_1.visible = false
pd_dw.modify("causa.background.color="+gs_gris)
pd_dw.accepttext()
RETURN 1

end function

public function integer fnu_actualizar_aviso_viejo (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizar_aviso_viejo
//
// Objetivo:  Actualiza el estado del aviso mas viejo en la incidencia.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


Long ll_nro_aviso;
Long ll_nro_incidencia;
ll_nro_incidencia=pd_dw.getitemnumber(1,"nro_incidencia")
SELECT A.NRO_AVISO into :ll_nro_aviso FROM GI_AVISOS A WHERE A.NRO_INCIDENCIA = :ll_nro_incidencia and A.F_ALTA = (SELECT MIN(B.F_ALTA) FROM GI_AVISOS B WHERE B.NRO_INCIDENCIA = :ll_nro_incidencia);
IF sqlca.sqlcode=0 THEN
	pd_dw.setitem(1,"primer_aviso",ll_nro_aviso)
	pd_dw.accepttext()
END IF
return 1
	
end function

public subroutine fnu_actualizar_seguimiento (long pl_nro_incidencia, integer pl_cod_estado, datetime pdt_fecha);///////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_actualizar_seguimiento
//
// Objetivo: crea un registro en la tabla estado_oper segun el estado de la
//			   incidencia. Si dicho registro ya existia lo que hace es actualizar el registro con la 
//			   fecha que se recibe como parametro.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros : 
//     Entrada: pl_nro_incidencia
//				    pl_cod_estado
//				    pdt_fecha
//     Salida: --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
///////////////////////////////////////////////////////////  

datetime ldt_fecha
datetime ldt_fecha_actual
string ls_programa
string ls_observacion
ldt_fecha_actual = fgnu_fecha_actual()
ls_programa="iw_2301"
ls_observacion=" "


SELECT "F_ALTA" into :ldt_fecha from SGD_ESTADO_OPER where nro_incidencia=:pl_nro_incidencia and cod_estado=:pl_cod_estado using sqlca;
IF sqlca.sqlcode = 0 THEN
	UPDATE "SGD_ESTADO_OPER" SET F_ALTA=:pdt_fecha WHERE NRO_INCIDENCIA=:pl_nro_incidencia and cod_estado=:pl_cod_estado;
//Else 	
//	INSERT INTO "SGD_ESTADO_OPER" ("COD_ESTADO","USUARIO","F_ACTUAL","H_ACTUAL","PROGRAMA","OBSERVACION","F_ALTA","H_ALTA","NRO_INCIDENCIA")
//		VALUES(:pl_cod_estado,:gs_usuario,:ldt_fecha_actual,:ldt_fecha_actual,:ls_programa,:ls_observacion,:pdt_fecha,:pdt_fecha,:pl_nro_incidencia);
END IF

IF pl_cod_estado = fgci_incidencia_servicio_repuesto THEN
	pl_cod_estado= fgci_incidencia_en_reposicion
	SELECT "F_ALTA" into :ldt_fecha from SGD_ESTADO_OPER where nro_incidencia=:pl_nro_incidencia and cod_estado=:pl_cod_estado using sqlca;
	IF sqlca.sqlcode <> 0 THEN
		INSERT INTO "SGD_ESTADO_OPER" ("COD_ESTADO","USUARIO","F_ACTUAL","H_ACTUAL","PROGRAMA","OBSERVACION","F_ALTA","H_ALTA","NRO_INCIDENCIA")
		VALUES(:pl_cod_estado,:gs_usuario,:ldt_fecha_actual,:ldt_fecha_actual,:ls_programa,:ls_observacion,:pdt_fecha,:pdt_fecha,:pl_nro_incidencia);
	END IF
END IF

//IF sqlca.sqlcode<>0 THEN
//	gnv_msg.f_mensaje("EA11","","",Ok!)
//	Halt 
//END IF

end subroutine

public function integer fnu_devolver_material (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_material
//
// Objetivo:  Retornar el campo material averiado.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////

return (pd_dw.getitemnumber(1,"material_averiado"))
end function

public function integer fnu_eliminar_interrupciones (long pl_nro_incidencia);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_eliminar_interrupciones
//
// Objetivo:  Borra de interrupciones.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////



delete from sgd_interrupcion where nro_incidencia=:pl_nro_incidencia;
IF SQLCA.SQLCODE=-1 THEN
	RETURN 0
END IF
return 1
end function

public function integer fnu_eliminar_incidencia (long pl_nro_incidencia);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_eliminar_incidencia
//
// Objetivo: Elimina incidencias.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////



delete from SGD_INCIDENCIA where nro_incidencia=:pl_nro_incidencia;
IF SQLCA.SQLCODE=-1 THEN
	RETURN 0
END IF
return 1
end function

public function integer fnu_eliminar_seg_inc (long pl_nro_incidencia);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_eliminar_seg_inc
//
// Objetivo: Elimina datos de estado de operaciones y estado mantenimiento.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////



delete from SGD_ESTADO_OPER where nro_incidencia=:pl_nro_incidencia;
IF SQLCA.SQLCODE=-1 THEN
	return 0
END IF
delete from SGD_ESTADO_MANT where nro_incidencia=:pl_nro_incidencia;
IF SQLCA.SQLCODE=-1 THEN
	return 0
END IF
return 1
end function

public function integer fnu_eliminar_ot_inc (long pl_nro_incidencia);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_eliminar_ot_inc
//
// Objetivo: Elimina datos de ordenes de trabajo y de brigada.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia
//        Salida: --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////



Long ll_nro_ot
Select ot into :ll_nro_ot from SGD_incidencia where nro_incidencia=:pl_nro_incidencia;
delete from GI_OT where nro_incidencia=:pl_nro_incidencia;
IF sqlca.sqlcode=-1 THEN
	return 0
END IF
IF not isnull(ll_nro_ot) THEN
	delete from GI_BRIGADA_OT where nro_ot=:ll_nro_ot;
	IF sqlca.sqlcode=-1 THEN
		return 0
	END IF
END IF
RETURN 1



end function

public function integer fnu_eliminar_avisos_inc (long pl_nro_incidencia, ref datawindow d_lista_aviso, long ll_nro_aviso, decimal ld_nro_instalacion);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_eliminar_avisos_inc
//
// Objetivo: Libera avisos, avisos ins, avisos res. 
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia, d_lista_aviso, ll_nro_aviso, ld_nro_instalacion
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
// 06/04/2001 FDO		Creaci$$HEX1$$f300$$ENDHEX$$n
///////////////////////////////////////////////////////////

Datetime ldt_f_Actual

ldt_f_Actual = FGNU_FECHA_ACTUAL()

//Como la llamada es por aviso.

  UPDATE "GI_AVISOS"  
     SET "NRO_INCIDENCIA" = 0,   
         "EST_AVISO" = 1,  
		"F_ACTUAL" = :ldt_f_Actual
   WHERE "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso   ;
	
// 

  UPDATE "GI_AVISOS_INSTALACION"  
     SET "IND_INCIDENCIA" = 0,   
         "EST_AVISO" = 1,  
		"F_ACTUAL" = :ldt_f_Actual
   WHERE "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso   ;
	
return 1

end function

public function integer fnu_eliminar_accion_inc (long pl_nro_incidencia);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_eliminar_accion_inc
//
// Objetivo: Elimina datos de acciones sobre la incidencia
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia
//        Salida: --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////

Delete from gi_accion_inc where nro_incidencia=:pl_nro_incidencia;
IF SQLCA.SQLCODE=-1 THEN
	RETURN 0
END IF
return 1

end function

public function integer fnu_eliminar_materiales (long pl_nro_incidencia);delete from gi_materiales where nro_incidencia=:pl_nro_incidencia;
IF sqlca.sqlcode=-1 THEN
	return 0
END IF
return 1
end function

public function integer fnu_liberar_brigada (long pl_nro_incidencia, boolean pb_ind_disponible);//////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_liberar_brigadas
// 
// Objetivo: Pone las brigadas que estaban asignadas 
//				a la incidencia pasada como par$$HEX1$$e100$$ENDHEX$$metro disponibles o 
//				no disponibles seg$$HEX1$$fa00$$ENDHEX$$n el par$$HEX1$$e100$$ENDHEX$$metro pb_ind_disponible.
//				Adem$$HEX1$$e100$$ENDHEX$$s si las brigadas est$$HEX1$$e100$$ENDHEX$$n asignadas a otra OT
//				en estado "Pendiente" o "Trabajando" no las libera.
//				 
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: nro de incidencia
//					boolean que indica si quiero poner
//					a las brigadas disponibles o no disponibles.
//		Salida:   --
//						
// Devuelve: 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	28/4/97		AFS			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
///////////////////////////////////////////////////////////////////////////////////////////

int li_disponible
long ll_nro_ot
long ll_nro_brigada
int li_fin_cursor
int li_veces_asignada
int li_estado_brigada
//IF pb_ind_disponible THEN
//	li_disponible =1
//ELSE
//	li_disponible = 0
//END IF

SELECT "SGD_INCIDENCIA"."OT"  
 INTO :ll_nro_ot  
 FROM "SGD_INCIDENCIA"  
 WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_incidencia ;

// Declaro cursor con las brigadas asignadas a la OT correspondiente
//	a la incidencia pasada como par$$HEX1$$e100$$ENDHEX$$metro.

DECLARE  lc_cur_brigadas CURSOR FOR 
	(SELECT NRO_BRIGADA,EST_BRIGADA FROM GI_BRIGADA_OT WHERE NRO_OT = :ll_nro_ot) ;
OPEN lc_cur_brigadas;
li_fin_cursor = 0

// recorro el cursor con las brigadas asignadas a esa OT y para cada una
// me fijo si est$$HEX2$$e1002000$$ENDHEX$$asignada a otra OT que no est$$HEX2$$e9002000$$ENDHEX$$resuelta (es decir con
// fecha_hasta no nula) y en ese caso no la libero, en caso contrario si
	
FETCH lc_cur_brigadas INTO :ll_nro_brigada , :li_estado_brigada;	
	DO 
		if sqlca.sqlcode = 0 then
			
			if li_estado_brigada = 1 then
				UPDATE "GI_BRIGADA"  
  			   SET "IND_PREVISTO" = "IND_PREVISTO" - 1
  			   WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;
			end if
			
			if li_estado_brigada = 2 then
				UPDATE gi_brigada SET ind_disponible= 1 
				WHERE nro_brigada=:ll_nro_brigada;
			end if
			
//				SELECT COUNT(*) INTO :li_veces_asignada
//			FROM GI_BRIGADA_OT
//			WHERE ((GI_BRIGADA_OT.F_HASTA) is null) AND 
//			NRO_OT <> :ll_nro_ot AND
//			NRO_BRIGADA = :ll_nro_brigada;
//			
//			IF li_veces_asignada = 0 THEN
//				UPDATE gi_brigada SET ind_disponible=:li_disponible 
//				WHERE nro_brigada=:ll_nro_brigada;
//			END IF
//
			FETCH lc_cur_brigadas INTO :ll_nro_brigada , :li_estado_brigada;
		
			IF sqlca.sqlcode <> 0 THEN
				li_fin_cursor = 1
			END IF 
		else
			li_fin_cursor = 1
		end if
		
	LOOP UNTIL (li_fin_cursor = 1)

CLOSE lc_cur_brigadas;
		
RETURN 1
end function

on u_inc_2004_nu_form_inf_general.create
TriggerEvent( this, "constructor" )
end on

on u_inc_2004_nu_form_inf_general.destroy
TriggerEvent( this, "destructor" )
end on


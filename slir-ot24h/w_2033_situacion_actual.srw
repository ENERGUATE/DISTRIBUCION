HA$PBExportHeader$w_2033_situacion_actual.srw
forward
global type w_2033_situacion_actual from w_sgigenerica
end type
type cbx_3 from checkbox within w_2033_situacion_actual
end type
type st_centro from statictext within w_2033_situacion_actual
end type
type u_amb from u_2030_ambito_estadisticas within w_2033_situacion_actual
end type
type dw_1 from datawindow within w_2033_situacion_actual
end type
type cb_buscar from u_cb within w_2033_situacion_actual
end type
type st_3 from statictext within w_2033_situacion_actual
end type
type p_avanzar from picturebutton within w_2033_situacion_actual
end type
type pb_1 from picturebutton within w_2033_situacion_actual
end type
type st_2 from statictext within w_2033_situacion_actual
end type
type p_retroceder from picturebutton within w_2033_situacion_actual
end type
type gb_2 from groupbox within w_2033_situacion_actual
end type
type cbx_centro_cmd from checkbox within w_2033_situacion_actual
end type
type cb_1 from commandbutton within w_2033_situacion_actual
end type
type dw_2 from datawindow within w_2033_situacion_actual
end type
type dw_situacion_actual from u_avi_2033_pr_situacion_actual within w_2033_situacion_actual
end type
type dw_3 from datawindow within w_2033_situacion_actual
end type
end forward

global type w_2033_situacion_actual from w_sgigenerica
integer x = 14
integer y = 4
integer width = 3474
integer height = 2032
string title = "OPEN SGI - Situaci$$HEX1$$f300$$ENDHEX$$n Actual del Centro Responsable"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 79741120
string icon = "sitact.ico"
cbx_3 cbx_3
st_centro st_centro
u_amb u_amb
dw_1 dw_1
cb_buscar cb_buscar
st_3 st_3
p_avanzar p_avanzar
pb_1 pb_1
st_2 st_2
p_retroceder p_retroceder
gb_2 gb_2
cbx_centro_cmd cbx_centro_cmd
cb_1 cb_1
dw_2 dw_2
dw_situacion_actual dw_situacion_actual
dw_3 dw_3
end type
global w_2033_situacion_actual w_2033_situacion_actual

type variables
//u_avi_2033_nu_situacion_actual iu_avi_2033_nu
u_avi_2033_pr_situacion_actual iu_avi_2033_pr
Date id_fec_ant
Int in_fila_ant
Int in_nro_nivel
Int in_padre1
Int in_padre2
Int in_padre3
Int in_prim_vez
boolean ib_p_retroceder
boolean ib_p_avanzar
boolean ib_pb_1
boolean ib_ambito_abierto
long il_nro_centro
long il_nro_cmd
long il_nro_mesa

long il_todos_ambitos //DBE 25/01/2000
end variables

forward prototypes
public function integer f_habilito_campos (integer n_nro_nivel)
public function string f_nombre_nivel (integer pn_nro_nivel)
public function integer fnu_obtengo_datos ()
public function integer fw_calcula_estadistica (integer pi_nro_centro, integer pi_tipo_centro)
public subroutine fw_busca_centros_cmd_puestos (ref integer pi_centros_hijos[], ref integer pi_contador, integer pi_tipo_centro, ref integer pi_array_tipos[], integer pi_tip_centro_padre)
end prototypes

public function integer f_habilito_campos (integer n_nro_nivel);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_habilito_campos
// 
// Objetivo: Habilita y Deshabilita campos.
//	 		
//       
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: n_nro_nivel
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE n_nro_nivel
	case 1
		p_retroceder.enabled = False
		p_avanzar.enabled = TRUE

//	case 3
//		p_retroceder.enabled = True
//		p_avanzar.enabled = false

	case 2
		p_retroceder.enabled = True
		p_avanzar.enabled = false
//		p_retroceder.enabled = True
//		p_avanzar.enabled = True

	case 0
		p_retroceder.enabled = False
		p_avanzar.enabled = False

END CHOOSE
Return 1
end function

public function string f_nombre_nivel (integer pn_nro_nivel);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_nombre_nivel
// 
// Objetivo: Modifica el texto recibido de estadistica avisos.
//	 	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pn_nro_nivel
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE pn_nro_nivel
	CASE 1
		
		if cbx_centro_cmd.checked = false then
			dw_situacion_actual.modify("nombre.Visible = true")
			dw_situacion_actual.modify("cmd.Visible = false")
			dw_situacion_actual.modify("sector.Visible = false")
		else
			//***************************************
			//**  OSGI 2001.1  	19/03/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			dw_situacion_actual.modify("cmd.text=~"" + fg_cor_dw("CMD", "CMD") + "~"")
			dw_situacion_Actual.modify("nombre.visible = false")
			dw_situacion_actual.modify("cmd.visible = true")
			dw_situacion_actual.modify("sector.visible = false")
			//***************************************
			//**  OSGI 2001.1  	19/03/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		end if
		
		RETURN "1"
	CASE 2
		
		dw_situacion_actual.modify("sector.visible = true")
		dw_situacion_actual.modify("cmd.visible = false")
		dw_situacion_actual.modify("nombre.visible = false")
		RETURN "1"
END CHOOSE
	
end function

public function integer fnu_obtengo_datos ();//////////////////////////////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtengo_datos_2033
// 
// Objetivo: Obtiene todas las incidencias pendientes, y los avisos pendientes
//
// Ambito:	Publico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//	Entrada:  gs_usuario
//	Salida:  -- 
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuacion
// ---------	-------		----------------------------------------
//	11/5/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
// 14/4/97		AFS			Modificacion: pasaje de PLSQL
//									a funci$$HEX1$$f300$$ENDHEX$$n de PB5
//
////////////////////////////////////////////////////////////////////////////////////////////////
//create or replace procedure obtengo_datos_2033(ls_fecha IN VARCHAR2,gs_usuario IN VARCHAR2) is
datetime ld_alta //date;
datetime lh_alta //date;
date ld_fecha //date;
//datetime d_fecha_aux //date;
datetime ldt_fecha_actual
datetime ldt_fecha_trunc

ldt_fecha_actual = fgnu_fecha_actual()
ld_fecha = date(ldt_fecha_actual)
ldt_fecha_trunc = datetime(ld_fecha)
declare lc_cur_est  CURSOR  for //IS
    SELECT SGD_INCIDENCIA.NRO_CENTRO,SGD_INCIDENCIA.NRO_CMD,SGD_INCIDENCIA.NRO_MESA,SGD_INCIDENCIA.EST_ACTUAL
    FROM SGD_INCIDENCIA WHERE (EST_ACTUAL = 6 
     AND FEC_RESOLUCION >= :ldt_fecha_trunc and  FEC_RESOLUCION < :ldt_fecha_trunc + 1 )  or EST_ACTUAL < 6 ; 
        
//AND FEC_RESOLUCION >= trunc(sysdate) and FEC_RESOLUCION < trunc(sysdate)+1 )  or EST_ACTUAL<6;
declare lc_cur_avi_pen CURSOR for //IS
     SELECT GI_AVISOS.NRO_CENTRO,GI_AVISOS.NRO_CMD,GI_AVISOS.NRO_MESA,GI_AVISOS.F_ALTA,
            GI_AVISOS.FECHA_RES,GI_AVISOS.IND_PELIGRO,GI_AVISOS.IND_CLI_IMP
     FROM GI_AVISOS
     WHERE GI_AVISOS.EST_AVISO < 5;
datetime lh_resuelto //date;
string lsNomUsu_Est //VARCHAR2(10);
int ln_Nro_Centro //NUMBER;
int ln_Nro_Cmd //NUMBER;
int ln_Nro_Mesa //NUMBER;
long ll_est_actual //NUMBER;
long l_fin_cursor //NUMBER;
int li_ind_peligro //NUMBER;
int li_ind_cli_imp //NUMBER;
//BEGIN
// ld_fecha=to_date(ls_fecha,'YYYYMMDD');
//  d_fecha_aux := trunc(sysdate);
// conversion de fecha 
	
// Obtengo las incidencias que no fueron resueltas o 
// las que fueron resueltas en el d$$HEX1$$ed00$$ENDHEX$$a de hoy
  OPEN lc_cur_est;
  FETCH lc_cur_est INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :ll_est_actual;
//  WHILE lc_cur_est%FOUND LOOP
do while sqlca.sqlcode = 0
	DECLARE actu_centro PROCEDURE FOR Actualizo_centro_2033(:ln_nro_centro,:ll_est_actual,:gs_usuario);
	EXECUTE actu_centro;
	DECLARE actu_cmd PROCEDURE FOR Actualizo_centro_2033(:ln_nro_cmd,:ll_est_actual,:gs_usuario);
	EXECUTE actu_cmd;
	DECLARE actu_mesa PROCEDURE FOR Actualizo_centro_2033(:ln_nro_mesa,:ll_est_actual,:gs_usuario);
	EXECUTE actu_mesa;

//     Actualizo_centro_2033(ln_nro_centro,ll_est_actual,gs_usuario);
//     Actualizo_centro_2033(ln_nro_cmd,ll_est_actual,gs_usuario);
//     Actualizo_centro_2033(ln_nro_mesa,ll_est_actual,gs_usuario);
     FETCH lc_cur_est INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :ll_est_actual;
loop
//  END LOOP;
  CLOSE lc_cur_est;

//  Obtengo los avisos que estan pendientes

  OPEN lc_cur_avi_pen;
  FETCH lc_cur_avi_pen INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta, &
  :lh_resuelto, :li_ind_peligro, :li_ind_cli_imp;
DO WHILE sqlca.sqlcode = 0
//  WHILE lc_cur_avi_pen%FOUND LOOP
	DECLARE actu_centro2 PROCEDURE FOR Actualizo_centro2_2033(:ln_nro_centro,:li_ind_peligro,:li_ind_cli_imp,:gs_usuario);
	EXECUTE actu_centro2;
	DECLARE actu_cmd2 PROCEDURE FOR Actualizo_centro2_2033(:ln_nro_cmd,:li_ind_peligro,:li_ind_cli_imp,:gs_usuario);
	EXECUTE actu_cmd2;
	DECLARE actu_mesa2 PROCEDURE FOR Actualizo_centro2_2033(:ln_nro_mesa,:li_ind_peligro,:li_ind_cli_imp,:gs_usuario);
	EXECUTE actu_mesa2;

//     Actualizo_centro2_2033(ln_nro_centro,li_ind_peligro,li_ind_cli_imp, gs_usuario);
//     Actualizo_centro2_2033(ln_nro_cmd,li_ind_peligro,li_ind_cli_imp, gs_usuario);
//     Actualizo_centro2_2033(ln_nro_mesa,li_ind_peligro,li_ind_cli_imp, gs_usuario);
     FETCH lc_cur_avi_pen INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta, &
                               :lh_resuelto, :li_ind_peligro, :li_ind_cli_imp;
loop
//  END LOOP;
  CLOSE lc_cur_avi_pen;
  //Commit;
  gnu_u_transaction.uf_commit(THIS)
//END;

return 1
end function

public function integer fw_calcula_estadistica (integer pi_nro_centro, integer pi_tipo_centro);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_calcula estadistica
// 
// Objetivo: Calcula la estad$$HEX1$$ed00$$ENDHEX$$stica e introduce los datos en la tabla.
// 	Los datos relativos al n$$HEX1$$fa00$$ENDHEX$$mero de incidencias por estado se calcular$$HEX1$$e100$$ENDHEX$$n de la siguiente
//  	manera, se tienen las inicidencias que transitan por los siguientes estados : (PT,
//		EB, ER, SR, RS).
//    	- ll_valor[1] contendr$$HEX2$$e1002000$$ENDHEX$$en n$$HEX2$$ba002000$$ENDHEX$$de incidencias en estado PT
//    	- ll_valor[2] contendr$$HEX2$$e1002000$$ENDHEX$$en n$$HEX2$$ba002000$$ENDHEX$$de incidencias en estado EB
//    	- ll_valor[3] contendr$$HEX2$$e1002000$$ENDHEX$$en n$$HEX2$$ba002000$$ENDHEX$$de incidencias en estado ER
//    	- ll_valor[4] contendr$$HEX2$$e1002000$$ENDHEX$$en n$$HEX2$$ba002000$$ENDHEX$$de incidencias en estado SR
//    	- ll_valor[5] contendr$$HEX2$$e1002000$$ENDHEX$$en n$$HEX2$$ba002000$$ENDHEX$$de incidencias en estado RS    
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_nro_centro,
//					pi_tipo_centro
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98      FDO
// 24/04/2000    LFE         Adaptaci$$HEX1$$f300$$ENDHEX$$n para las incidencias sin interrupci$$HEX1$$f300$$ENDHEX$$n
// 25/08/2000    GSH			  Modificaci$$HEX1$$f300$$ENDHEX$$n, eliminacion del dw para incidencias sin interrupci$$HEX1$$f300$$ENDHEX$$n
////////////////////////////////////////////////////////////////////////////////////////////////


int l_fin_cursor
long ll_valor[10],ll_nro_inc,ll_tipo_inc
datetime ldt_fecha_actual
string ls_select, ls_where
int li_estado_est, li_estado

ldt_fecha_actual=fgnu_fecha_actual()

if cbx_centro_cmd.checked=false then
	li_estado_est=1
else
	li_estado_est=2
end if

choose case pi_tipo_centro
		
	case 1
		select count(*)
		into :ll_valor[10]
		from SGD_INCIDENCIA 
		where nro_centro = :pi_nro_centro;
		
		if ll_valor[10]=0 then return 0

	case 2
		//El DECODE es para no tener en cuenta las incidencias agrupadas
		select count(*)
		into :ll_valor[10]
		from SGD_INCIDENCIA 
		where nro_cmd =:pi_nro_centro ;
		
		if ll_valor[10]=0 then return 0

	case 3
		select count(*)
		into :ll_valor[10]
		from SGD_INCIDENCIA 
		where nro_mesa = :pi_nro_centro ;
		
		if ll_valor[10]=0 then return 0
	
end choose

// Si el Tipo de centro es un centro (valga la redundancia) 

if pi_tipo_centro = 1 then
	// Se ejecutan el bucle para obtener las incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n.
	
	// Este bucle trae el n$$HEX2$$ba002000$$ENDHEX$$de incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n para cada uno de 
	// los cinco estados (PT, EB, ER, SR, RS). (LFE)

	li_estado = fgci_incidencia_pendiente 
	// se recorren las incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n(aquellas a las que se les puede asociar 
	// una interrupci$$HEX1$$f300$$ENDHEX$$n)
	DO 
//		select count(*) into :ll_nro_inc
//		from SGD_INCIDENCIA 
//		where nro_centro = :pi_nro_centro AND
//				est_actual = :li_estado AND
//				ind_calidad = 0 AND 
//				ind_suministro = 2;  

		select count(*) into :ll_nro_inc
		from SGD_INCIDENCIA 
		where nro_centro = :pi_nro_centro AND
				est_actual = :li_estado ;  
		
		ll_valor[li_estado]=ll_nro_inc		
		li_estado++

	LOOP UNTIL (li_estado > fgci_incidencia_resuelta OR sqlca.sqlcode < 0)

// 25/08/2000 a partir de ahora no se tendran en cuenta las incidencias sin interrupcion
// ni el campo CL de las incidencias con interrupcion.GSH.

//	// Este segundo bucle trae el n$$HEX2$$ba002000$$ENDHEX$$de incidencias sin interrupci$$HEX1$$f300$$ENDHEX$$n para cada uno de 
//	// los cinco estados (PT, EB, TR, OF, RS).
//	li_estado = 1
//			
//	DO 
////		select count(*) into :ll_nro_inc
////		from SGD_INCIDENCIA 
////		where nro_centro = :pi_nro_centro AND
////				est_actual = :li_estado AND
////				(ind_calidad = 1 OR    // si ind_calidad $$HEX2$$f3002000$$ENDHEX$$ind_suministro es 1 o la
////				ind_suministro = 1);	  // incidencia es sin interrupci$$HEX1$$f300$$ENDHEX$$n
//
//		select count(*) into :ll_nro_inc
//		from SGD_INCIDENCIA 
//		where nro_centro = :pi_nro_centro AND
//				est_actual = :li_estado AND
//				(tip_incidencia = 3 OR
//				 alcance = 4 OR
//				 alcance = 1);
//
//		IF li_estado > 3 THEN // a partir del estado n$$HEX2$$ba002000$$ENDHEX$$4 los valores se a$$HEX1$$f100$$ENDHEX$$aden en la posici$$HEX1$$f300$$ENDHEX$$n
//									 // siguiente al n$$HEX2$$ba002000$$ENDHEX$$de estado. Ver explicaci$$HEX1$$f300$$ENDHEX$$n del comienzo
//			ll_valor[li_estado+1]=ll_valor[li_estado+1] + ll_nro_inc		
//		ELSE
//			ll_valor[li_estado]=ll_valor[li_estado] + ll_nro_inc		
//		END IF
//		
//		li_estado++
//	LOOP UNTIL (li_estado = 6 OR sqlca.sqlcode < 0)
//
end if	

// Si el Tipo de centro es un cmd

if pi_tipo_centro = 2 then
	// Se ejecutan el bucle para obtener las incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n.  
	
	// Este bucle trae el n$$HEX2$$ba002000$$ENDHEX$$de incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n para cada uno de 
	// los cinco estados (PT, EB, ER, SR, RS).

	li_estado = fgci_incidencia_pendiente
	// se recorren las incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n(aquellas a las que se les puede asociar 
	// una interrupci$$HEX1$$f300$$ENDHEX$$n)
	DO 
//		select count(*) into :ll_nro_inc
//		from SGD_INCIDENCIA 
//		where nro_cmd = :pi_nro_centro AND
//				est_actual = :li_estado AND
//				ind_calidad = 0 AND 
//				ind_suministro = 2;  

		select count(*) into :ll_nro_inc
		from SGD_INCIDENCIA 
		where nro_cmd = :pi_nro_centro AND
				est_actual = :li_estado ;  
				
		ll_valor[li_estado]=ll_nro_inc		
		li_estado++

	LOOP UNTIL (li_estado > fgci_incidencia_resuelta OR sqlca.sqlcode < 0)
	
// 25/08/200 a partir de ahora no se tendran en cuenta las incidencias sin interrupciones asi
// como el estado CL de las incidencias con interrupciones.GSH

//	// Este segundo bucle trae el n$$HEX2$$ba002000$$ENDHEX$$de incidencias sin interrupci$$HEX1$$f300$$ENDHEX$$n para cada uno de 
//	// los cinco estados (PT, EB, TR, OF, RS).
//	li_estado = 1
//			
//	DO 
////		select count(*) into :ll_nro_inc
////		from SGD_INCIDENCIA 
////		where nro_cmd = :pi_nro_centro AND
////				est_actual = :li_estado AND
////				(ind_calidad = 1 OR    // si ind_calidad $$HEX2$$f3002000$$ENDHEX$$ind_suministro es 1 o la
////				ind_suministro = 1);	  // incidencia es sin interrupci$$HEX1$$f300$$ENDHEX$$n	
//		select count(*) into :ll_nro_inc
//		from SGD_INCIDENCIA 
//		where nro_cmd = :pi_nro_centro AND
//				est_actual = :li_estado AND
//				(tip_incidencia = 3 OR
//				 alcance = 1 OR
//				 alcance = 4);  
//				 
//		IF li_estado > 3 THEN // a partir del estado n$$HEX2$$ba002000$$ENDHEX$$4 los valores se a$$HEX1$$f100$$ENDHEX$$aden en la posici$$HEX1$$f300$$ENDHEX$$n
//									 // siguiente al n$$HEX2$$ba002000$$ENDHEX$$de estado. Ver explicaci$$HEX1$$f300$$ENDHEX$$n del comienzo
//			ll_valor[li_estado+1]=ll_valor[li_estado+1] + ll_nro_inc		
//		ELSE
//			ll_valor[li_estado]=ll_valor[li_estado] + ll_nro_inc		
//		END IF
//		
//		li_estado++
//	LOOP UNTIL (li_estado = 6 OR sqlca.sqlcode < 0)

end if	

// Si el Tipo de centro es una mesa

if pi_tipo_centro = 3 then
	// Se ejecutan el bucle para obtener las incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n.
	
	// Este bucle trae el n$$HEX2$$ba002000$$ENDHEX$$de incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n para cada uno de 
	// los cinco estados (PT, EB, ER, SR, RS).

	li_estado = fgci_incidencia_pendiente
	// se recorren las incidencias con interrupci$$HEX1$$f300$$ENDHEX$$n(aquellas a las que se les puede asociar 
	// una interrupci$$HEX1$$f300$$ENDHEX$$n)
	DO 
//		select count(*) into :ll_nro_inc
//		from SGD_INCIDENCIA 
//		where nro_mesa = :pi_nro_centro AND
//				est_actual = :li_estado AND
//				ind_calidad = 0 AND 
//				ind_suministro = 2;  
		select count(*) into :ll_nro_inc
		from SGD_INCIDENCIA 
		where nro_mesa = :pi_nro_centro AND
				est_actual = :li_estado ;  		
				
		ll_valor[li_estado]=ll_nro_inc		
		li_estado++

	LOOP UNTIL (li_estado > fgci_incidencia_resuelta OR sqlca.sqlcode < 0)
	
// 25/08/2000 a partir de ahora no se tendran en cuenta las incidencias sin interrupciones asi
// como el estado CL de las incidencias con interrupciones.GSH.

//	// Este segundo bucle trae el n$$HEX2$$ba002000$$ENDHEX$$de incidencias sin interrupci$$HEX1$$f300$$ENDHEX$$n para cada uno de 
//	// los cinco estados (PT, EB, TR, OF, RS).
//	li_estado = 1
//			
//	DO 
////		select count(*) into :ll_nro_inc
////		from SGD_INCIDENCIA 
////		where nro_mesa = :pi_nro_centro AND
////				est_actual = :li_estado AND
////				(ind_calidad = 1 OR    // si ind_calidad $$HEX2$$f3002000$$ENDHEX$$ind_suministro es 1 o la
////				ind_suministro = 1);	  // incidencia es sin interrupci$$HEX1$$f300$$ENDHEX$$n	
//		select count(*) into :ll_nro_inc
//		from SGD_INCIDENCIA 
//		where nro_mesa = :pi_nro_centro AND
//				est_actual = :li_estado AND
//				(tip_incidencia = 3 OR
//				 alcance = 1 OR
//				 alcance = 4);  		
//
//		IF li_estado > 3 THEN // a partir del estado n$$HEX2$$ba002000$$ENDHEX$$4 los valores se a$$HEX1$$f100$$ENDHEX$$aden en la posici$$HEX1$$f300$$ENDHEX$$n
//									 // siguiente al n$$HEX2$$ba002000$$ENDHEX$$de estado. Ver explicaci$$HEX1$$f300$$ENDHEX$$n del comienzo
//			ll_valor[li_estado+1]=ll_valor[li_estado+1] + ll_nro_inc		
//		ELSE
//			ll_valor[li_estado]=ll_valor[li_estado] + ll_nro_inc		
//		END IF
//		
//		li_estado++
//	LOOP UNTIL (li_estado = 6 OR sqlca.sqlcode < 0)

end if	

choose case pi_tipo_centro
	case 1
		select count(*) 
		into :ll_valor[7] 
		from gi_avisos 
		where est_aviso=1 and
				nro_centro = :pi_nro_centro ;
	case 2
		select count(*) 
		into :ll_valor[7] 
		from gi_avisos 
		where est_aviso=1 and
				nro_cmd =:pi_nro_centro ;
	case 3
		select count(*) 
		into :ll_valor[7] 
		from gi_avisos 
		where est_aviso=1 and
				nro_mesa = :pi_nro_centro ;
end choose	

choose case pi_tipo_centro
	case 1
		select count(*) 
		into :ll_valor[8] 
		from gi_avisos 
		where ind_peligro=1 and
				nro_centro = :pi_nro_centro ;
	case 2
		select count(*) 
		into :ll_valor[8] 
		from gi_avisos 
		where ind_peligro=1 and
				nro_cmd =:pi_nro_centro ;
	case 3
		select count(*) 
		into :ll_valor[8] 
		from gi_avisos 
		where ind_peligro=1 and
				nro_mesa = :pi_nro_centro;
end choose	

choose case pi_tipo_centro
	case 1
		select count(*) 
		into :ll_valor[9] 
		from gi_avisos 
		where ind_cli_imp=1 and
				nro_centro = :pi_nro_centro ;
	case 2
		select count(*) 
		into :ll_valor[9] 
		from gi_avisos 
		where ind_cli_imp=1 and
				nro_cmd =:pi_nro_centro ;
	case 3
		select count(*) 
		into :ll_valor[9] 
		from gi_avisos 
		where ind_cli_imp=1 and
				nro_mesa = :pi_nro_centro;
	end choose

   INSERT INTO "GI_EST_AVISO"  
         ( "NRO_CENTRO",   
           "INT1",   
           "INT2",   
           "INT3",   
           "INT4",   
           "INT5",   
           "INT6",   
           "INT7",   
           "INT8",   
           "INT9",   
           "INT10",   
           "INT11",   
           "INT12",   
           "TOT_INT",   
           "USUARIO_EST",   
           "TIPO_REG",   
           "USUARIO",   
           "F_ACTUAL",   
           "INT13",   
           "INT14",   
           "INT15",   
           "INT16",   
           "INT17",   
           "TIPO_DE_CONSULTA",
			  "F_ESTADISTICA",
			  "CLASE_AVISO",  //DBE 25/01/2000
			  "TODOS_AMBITOS", //DBE 25/01/2000
			  "TIP_CENTRO"
			  )  
  VALUES ( :pi_nro_centro,   
           :ll_valor[1],   
           :ll_valor[2],  
           :ll_valor[3],    
           :ll_valor[4],   
           :ll_valor[5],   
           :ll_valor[6],     
           :ll_valor[7],    
           :ll_valor[8],     
           :ll_valor[9],     
           :ll_valor[10],  
           null,   
           null,   
           null, 
           :gs_usuario,   
           :li_estado_est,   
           :gs_usuario,   
           :ldt_fecha_actual,   
           null,   
           null,   
           null,   
           null,   
           null,   
           3,
			  trunc(:ldt_fecha_actual),//DBE 25/01/2000
			  0,                       //DBE 25/01/2000
			  :il_todos_ambitos,       //DBE 25/01/2000
			  :pi_tipo_centro
			  )  ;

	//commit;
//	gnu_u_transaction.uf_commit(THIS) //DBE 04/02/2000
return 1

end function

public subroutine fw_busca_centros_cmd_puestos (ref integer pi_centros_hijos[], ref integer pi_contador, integer pi_tipo_centro, ref integer pi_array_tipos[], integer pi_tip_centro_padre);///////////////////////////////////////////////////////////////////////////// 
//
// FW_BUSCA_CENTROS_CMD_PUESTOS
//
// FUNCION ALGORITMICA RECURSIVA QUE BUSCA LOS CENTROS ASOCIADOS DE UN
// DETERMINADO CENTRO GENERICO
//
// RECIBE:
//        pi_centros_hijos[] :   ARRAY QUE CONTIENE LOS CENTROS ENCONTRADOS
//											(POR REFERENCIA)
//			 pi_contador        :   CONTADOR DEL ARRAY.
//			 pi_tipo_centro     :	TIPO DE CENTRO, CMD O PUESTO
//			 pi_array_tipos[]   :	ARRAY CON LOS TIPOS DE CENTROS ENCONTRADOS
//
//
// RESPONSABLE: FDO
////////////////////////////////////////////////////////////////////////////

LONG LL_CODIGO
int li_centro_resp

if pi_contador=0 then 
	li_centro_resp = fg_padre_centros
else
	li_centro_resp = pi_centros_hijos[pi_contador]
end if

CHOOSE CASE pi_tipo_centro

	CASE 1

		DECLARE lc_centro_resp1 CURSOR FOR  
		 SELECT "SGD_RELACION_CENTRO"."CENTRO_DEPEN"   
		 FROM "SGD_RELACION_CENTRO"  
		WHERE "SGD_RELACION_CENTRO"."CENTRO_RESP" = :li_centro_resp
		and "SGD_RELACION_CENTRO"."TIP_CENTRO" = 1 ;

	  	OPEN lc_centro_resp1;

	  	FETCH lc_centro_resp1 INTO :LL_CODIGO;
	
		  DO WHILE sqlca.sqlcode=0

				pi_contador++
				pi_centros_hijos[pi_contador]=LL_CODIGO
				pi_array_tipos[pi_contador]=1
	 			FW_BUSCA_centros_cmd_puestos(pi_centros_hijos,pi_contador,3,pi_array_tipos,1)
   		   FETCH lc_centro_resp1 INTO :LL_CODIGO;	
				
		  LOOP
	  
 		close lc_centro_resp1;

	CASE 2
		
		DECLARE lc_cmd_resp CURSOR FOR  
		 SELECT "SGD_RELACION_CENTRO"."CENTRO_DEPEN"  
		 FROM "SGD_RELACION_CENTRO"  
		WHERE "SGD_RELACION_CENTRO"."CENTRO_RESP" = :li_centro_resp 
		and "SGD_RELACION_CENTRO"."TIP_CENTRO" = 2;

	  	OPEN lc_cmd_resp;

	  	FETCH lc_cmd_resp INTO :LL_CODIGO;
	
		  DO WHILE sqlca.sqlcode=0

				pi_contador++
				pi_centros_hijos[pi_contador]=LL_CODIGO
				pi_array_tipos[pi_contador]=2
	 			FW_BUSCA_centros_cmd_puestos(pi_centros_hijos,pi_contador,3,pi_array_tipos,2)
   		   FETCH lc_cmd_resp INTO :LL_CODIGO;	
				
		  LOOP
	  
 		close lc_cmd_resp;

		 
	CASE 3

		DECLARE lc_centro_resp3 CURSOR FOR  
		 SELECT "SGD_RELACION_CENTRO"."CENTRO_DEPEN"  
		 FROM "SGD_RELACION_CENTRO"  
		WHERE "SGD_RELACION_CENTRO"."CENTRO_RESP" = :li_centro_resp and
			 	"SGD_RELACION_CENTRO"."TIP_CENTRO" = :pi_tip_centro_padre;

	  	OPEN lc_centro_resp3;

	  	FETCH lc_centro_resp3 INTO :LL_CODIGO;
	
		  DO WHILE sqlca.sqlcode=0

				pi_contador++
				pi_centros_hijos[pi_contador]=LL_CODIGO
				pi_array_tipos[pi_contador]=3
			   FETCH lc_centro_resp3 INTO :LL_CODIGO;		
		  LOOP
 		close lc_centro_resp3;
		 
end choose
end subroutine

event open;call super::open;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Open 
// 
// Objetivo: Triguea el evento de la Dw. ue_primera vez
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

//fg_colocar_ventana(w_2033_situacion_actual)
SETPOINTER(HOURGLASS!)
dw_situacion_actual.setTransObject(sqlca)
in_fila_ant = 0
in_nro_nivel = 0 
in_prim_vez = 1
This.title = gu_comunic.f_titulo_ventana("w_2033","Situacion")
f_habilito_campos(in_nro_nivel)
DW_1.settransobject(sqlca)
//dw_situacion_actual.triggerevent("ue_primera_vez")

x = 9
y = 4
//Certificaci$$HEX1$$f300$$ENDHEX$$n windows XP
//width = 3630
//height = 2032
width = 3600
height = 2022

//***************************************
//**  OSGI 2001.1  	02/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
cbx_centro_cmd.Text = fg_cor_dw("  Estad$$HEX1$$ed00$$ENDHEX$$stica por CMD.", "CMD")
//***************************************
//**  OSGI 2001.1  	02/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on w_2033_situacion_actual.create
int iCurrent
call super::create
this.cbx_3=create cbx_3
this.st_centro=create st_centro
this.u_amb=create u_amb
this.dw_1=create dw_1
this.cb_buscar=create cb_buscar
this.st_3=create st_3
this.p_avanzar=create p_avanzar
this.pb_1=create pb_1
this.st_2=create st_2
this.p_retroceder=create p_retroceder
this.gb_2=create gb_2
this.cbx_centro_cmd=create cbx_centro_cmd
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_situacion_actual=create dw_situacion_actual
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_3
this.Control[iCurrent+2]=this.st_centro
this.Control[iCurrent+3]=this.u_amb
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.cb_buscar
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.p_avanzar
this.Control[iCurrent+8]=this.pb_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.p_retroceder
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.cbx_centro_cmd
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.dw_2
this.Control[iCurrent+15]=this.dw_situacion_actual
this.Control[iCurrent+16]=this.dw_3
end on

on w_2033_situacion_actual.destroy
call super::destroy
destroy(this.cbx_3)
destroy(this.st_centro)
destroy(this.u_amb)
destroy(this.dw_1)
destroy(this.cb_buscar)
destroy(this.st_3)
destroy(this.p_avanzar)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.p_retroceder)
destroy(this.gb_2)
destroy(this.cbx_centro_cmd)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_situacion_actual)
destroy(this.dw_3)
end on

event close;call super::close; //
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2033_situacion_actual
end type

type cbx_3 from checkbox within w_2033_situacion_actual
event clicked pbm_bnclicked
integer x = 23
integer y = 84
integer width = 846
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Seleccionar Ambito"
end type

event clicked;ib_p_avanzar=p_avanzar.enabled
ib_p_retroceder=p_retroceder.enabled
ib_pb_1=pb_1.enabled
ib_ambito_abierto=true
u_amb.visible=true
p_avanzar.enabled=false
p_retroceder.enabled=false
pb_1.enabled=false
dw_situacion_actual.enabled=false
cb_buscar.enabled=false
this.checked=true
cbx_centro_cmd.enabled=false
u_amb.is_ventana = "Situacion_actual"

if cbx_centro_cmd.checked=false then
	u_amb.dw_ambito.fnu_deshab_puesto(u_amb.dw_ambito)
//	u_amb.dw_ambito.fnu_deshab_cmd(u_amb.dw_ambito)
else
	u_amb.dw_ambito.fnu_deshab_puesto(u_amb.dw_ambito)
//	u_amb.dw_ambito.fnu_deshab_centro(u_amb.dw_ambito)
end if
end event

type st_centro from statictext within w_2033_situacion_actual
boolean visible = false
integer x = 2734
integer y = 76
integer width = 709
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
boolean enabled = false
string text = "<Todos>"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type u_amb from u_2030_ambito_estadisticas within w_2033_situacion_actual
event constructor pbm_constructor
event destroy ( )
boolean visible = false
integer x = 1271
integer y = 596
integer taborder = 50
borderstyle borderstyle = styleraised!
end type

event constructor;// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
u_amb.dw_ambito.reset()
u_amb.dw_ambito.show()
u_amb.dw_ambito.f_insertar_fila()

//Conecto las DDDW del objeto "ambito"
// filtro todos sus campos y seteo a los mismos con todos

u_amb.dw_ambito.fpr_crea_dddw()
u_amb.dw_ambito.fnu_filtro_centro()
u_amb.dw_ambito.setitem(1,"nro_centro",fgci_todos)
u_amb.dw_ambito.fpr_filtro_cmd()
u_amb.dw_ambito.setitem(1,"nro_cmd",fgci_todos)
u_amb.dw_ambito.fnu_HABI_cmd()
u_amb.dw_ambito.fpr_filtro_mesa()
u_amb.dw_ambito.setitem(1,"nro_mesa",fgci_todos)

u_amb.dw_ambito.setcolumn("nro_centro")

end event

on u_amb.destroy
call u_2030_ambito_estadisticas::destroy
end on

type dw_1 from datawindow within w_2033_situacion_actual
boolean visible = false
integer y = 224
integer width = 3442
integer height = 1436
integer taborder = 60
string dataobject = "d_avi_2033_graf_situacion_actual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_buscar from u_cb within w_2033_situacion_actual
event clicked pbm_bnclicked
integer x = 59
integer y = 1764
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Buscar"
boolean default = true
end type

event clicked;in_fila_ant = 1
in_nro_nivel = 0 
in_prim_vez = 1
boolean lb_cambiar = false
BOOLEAN A = TRUE

parent.setredraw(false) //GSE  3/05/2001
IF dw_1.Visible = true THEN
	dw_1.visible=false
	dw_situacion_actual.visible=True
	lb_cambiar = true
end if

dw_situacion_actual.triggerevent("ue_primera_vez")

IF dw_situacion_actual.rowcount()>0 THEN
	in_nro_nivel = 1
	f_habilito_campos(in_nro_nivel)
	if lb_cambiar then
		dw_1.Show()
		dw_situacion_actual.visible=false
		dw_1.visible=true
	end if
	pb_1.enabled = True
ELSE
		pb_1.enabled = False
		in_nro_nivel = 0
		f_habilito_campos(in_nro_nivel)
		gnv_msg.f_mensaje("IA01","","",OK!) //DBE 26/01/2000
end if
//ELSE
//	dw_esta_avisos.reset()
//	pb_1.enabled=FALSE
//	p_retrocede.ENABLED=FALSE
//	p_avanza.enabled = False
//	gnv_msg.f_mensaje("IA01","","",OK!)
//END IF
//
//	pb_2.visible=false
//	gr_1.width=2702
//	gr_1.height=729
//	gr_1.x=51
//	gr_1.y=229
//	ib_zoom=false
// 	pb_2.picturename="lupa3.bmp"

parent.setredraw(true)
end event

type st_3 from statictext within w_2033_situacion_actual
integer x = 658
integer y = 1776
integer width = 393
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Anterior"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_avanzar from picturebutton within w_2033_situacion_actual
integer x = 1623
integer y = 1756
integer width = 137
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "avanzar.bmp"
string disabledname = "avan_1.bmp"
vtextalign vtextalign = vcenter!
end type

on clicked;if in_nro_nivel = 0 THEN
	dw_situacion_actual.triggerevent("ue_primera_vez")
ELSE
	dw_situacion_actual.triggerevent("ue_avan_nivel")
END IF

end on

type pb_1 from picturebutton within w_2033_situacion_actual
event clicked pbm_bnclicked
integer x = 3200
integer y = 1748
integer width = 160
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = " "
string picturename = "grafico.bmp"
string disabledname = "graf_dis.bmp"
alignment htextalign = left!
end type

event clicked;IF DW_1.VISIBLE=tRUE THEN
	cbx_centro_cmd.enabled = TRUE
	cbx_3.enabled = TRUE

   cb_buscar.enabled=true
	f_habilito_campos(in_nro_nivel) //DBE 26/01/2000
	PARENT.SETREDRAW(FALSE)
	this.picturename="grafico.bmp"
	DW_1.visible=False
	dw_situacion_actual.visible=True
	PARENT.SETREDRAW(TRUE)
ELSE
	cbx_centro_cmd.enabled = FALSE
	cbx_3.enabled = FALSE
   cb_buscar.enabled=false
	p_retroceder.enabled = False//DBE 26/01/2000
	p_avanzar.enabled = false//DBE 26/01/2000
	PARENT.SETREDRAW(FALSE)
	this.picturename="dw.bmp"
	dw_situacion_actual.Hide()
	dw_1.Show()
	PARENT.SETREDRAW(TRUE)
END IF



end event

type st_2 from statictext within w_2033_situacion_actual
integer x = 1792
integer y = 1776
integer width = 393
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Siguiente"
boolean focusrectangle = false
end type

type p_retroceder from picturebutton within w_2033_situacion_actual
integer x = 1088
integer y = 1756
integer width = 137
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "retroced.bmp"
string disabledname = "retro_1.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;int ln_nro_centro, li_cmd_checked
string ls_tit
string ls_centro
//iu_avi_2033_pr = CREATE u_avi_2033_pr_situacion_actual

IF in_nro_nivel = 3 THEN
	ln_nro_centro = in_padre2
ELSEIF in_nro_nivel = 2 THEN
	ln_nro_centro = fg_padre_centros
//	ln_nro_centro = in_padre1
ELSEIF in_nro_nivel = 1 THEN
	ln_nro_centro = fg_padre_centros
END IF
SETPOINTER(HOURGLASS!)

if parent.cbx_centro_cmd.checked=false then
	li_cmd_checked = 1
else
	li_cmd_checked = 2
end if

  //DBE ini 25/01/2000
	if il_nro_centro + il_nro_cmd + il_nro_mesa > 0 then
	   choose case li_cmd_checked 
		   case 1 //centro
			ls_centro = string(il_nro_centro)
		   case 2 //cmd
			ls_centro = string(il_nro_cmd)
	   end choose
   else
	ls_centro = '%'
   end if	
	//DBE fin 25/01/2000

dw_situacion_actual.fnu_despliego_datos(dw_situacion_actual,ln_nro_centro,gs_usuario, li_cmd_checked,&
il_todos_ambitos,ls_centro,li_cmd_checked,0) //DBE  25/01/2000

//dw_1.retrieve(gs_usuario,ln_nro_centro)

            dw_1.reset()
				dw_situacion_actual.RowsCopy &
				(1, dw_situacion_actual.RowCount(), Primary!, DW_1, 1, Primary!)//DBE 21/01/2000


IF dw_situacion_actual.RowCount()>0 THEN
	dw_situacion_actual.SelectRow(in_fila_ant,False)    //elimino la marcar anterior
	dw_situacion_actual.SelectRow(1,True)  // marco el seleccionado
	in_fila_ant = 1
	pb_1.enabled=true
END IF
SETPOINTER(ARROW!)
in_nro_nivel = in_nro_nivel -1
ls_tit = f_nombre_nivel(in_nro_nivel)
f_habilito_campos(in_nro_nivel)
//Destroy iu_avi_2033_pr
end event

type gb_2 from groupbox within w_2033_situacion_actual
integer x = 9
integer y = 1696
integer width = 3433
integer height = 200
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cbx_centro_cmd from checkbox within w_2033_situacion_actual
integer x = 873
integer y = 84
integer width = 869
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Estad$$HEX1$$ed00$$ENDHEX$$stica por CMD."
end type

event clicked;cb_buscar.triggerevent(Clicked!)
end event

type cb_1 from commandbutton within w_2033_situacion_actual
integer x = 2373
integer y = 1764
integer width = 411
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
boolean default = true
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_situacion
string ls_titulo
long ll_longitud

CHOOSE CASE in_nro_nivel
	CASE 1
		
		if cbx_centro_cmd.checked = false then
			dw_2.modify("nombre.text = 'Zona'")
		else
			dw_2.modify("nombre.text='" + fg_cor_dw("CMD", "CMD") + "'" )
		end if
		
	CASE 2
		dw_2.modify("nombre.text = 'Sector'")
END CHOOSE

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Estadistica de la Situacion Actual'
ll_longitud = len (ls_titulo)*50
IF dw_1.visible = false then
	dw_2.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_2.modify("titulo_t.Text = '" + ls_titulo + "'")
	
	dw_2.getchild ("d_situacion_imp",dwc_situacion)
	dw_situacion_actual.sharedata(dwc_situacion)
	lst_impresion.pa_todos[1]=dw_situacion_actual
	lst_impresion.pa_nombres[1]='d_situacion_imp'
	
	lst_impresion.total = 1
	IF dw_situacion_actual.RowCount() = 0 THEN
		gnv_msg.f_mensaje( "AB02","","",OK!)
		return
	END IF
	dw_2.SetTransObject(SQLCA)
	lst_impresion.grafica = false
	lst_impresion.pdw_compuesto = dw_2
else
	dw_3.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_3.modify("titulo_t.Text = '" + ls_titulo + "'")
	
	dw_3.getchild ("d_situacion_imp",dwc_situacion)
	dw_situacion_actual.sharedata(dwc_situacion)
	lst_impresion.pa_todos[1]=dw_situacion_actual
	lst_impresion.pa_nombres[1]='d_situacion_imp'
	
	lst_impresion.total = 1
	IF dw_situacion_actual.RowCount() = 0 THEN
		gnv_msg.f_mensaje( "AB02","","",OK!)
		return
	END IF
	dw_3.SetTransObject(SQLCA)
	
	lst_impresion.pdw_compuesto = dw_3
	lst_impresion.grafica = true

end if
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)
lst_impresion.pdw_compuesto.ShareDataOff()
IF dw_1.visible = false then
	dw_2.ShareDataOff()		
else
	dw_1.ShareDataOff()	
end if


end event

type dw_2 from datawindow within w_2033_situacion_actual
boolean visible = false
integer x = 110
integer y = 512
integer width = 3218
integer height = 640
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_situacion_actual_imp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_situacion_actual from u_avi_2033_pr_situacion_actual within w_2033_situacion_actual
event ue_primera_vez pbm_custom72
event ue_avan_nivel pbm_custom73
integer y = 224
integer width = 3442
integer height = 1408
integer taborder = 20
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event ue_primera_vez;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Ue_primera_vez 
// 
// Objetivo: Genera la estadistica en la tabla gi_est_aviso. 
//           El procedimiento para realizarla es una b$$HEX1$$fa00$$ENDHEX$$squeda de los cen-
//				 tros asociados mediante una funcion autorecursiva, esta funcion
//				 devuelve dos arrays, uno con el tipo de centro y otro con
//				 el centro asociado. Despues llama a una funcion que recupera
//				 y graba los datos de la estad$$HEX1$$ed00$$ENDHEX$$stica para el centro en cuestion.
//				 Posteriormente se muestran los datos por medio de la Dw.	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

String ls_tit,ls_mensaje,ls_zona_cmd,ls_zona_cmd_msg,ls_fecha_actual
INT li_centros[]
int li_tipos[]
int li_contador=0
int li_bucle,li_ampliacion,li_estado_est
boolean lb_generar,lb_hay_datos=true
long ll_select
int li_tipo_reg

//DBE 25/01/2000
long ll_centro 
string ls_centro
int li_gener
DateTime ldt_f_actual
int li_count, li_repite, li_start


SETPOINTER(HOURGLASS!)

//DECLARE OBT_DATOS PROCEDURE FOR OBTENGO_DATOS_2033(:gs_usuario);
//EXECUTE OBT_DATOS;

// Anteriormente ejecutaba este PLSQL, al realizar las pruebas de 
// volumen se comprob$$HEX2$$f3002000$$ENDHEX$$que no se pueden asumir sus tiempos y se ha
// cambiado la manera de generar la estad$$HEX1$$ed00$$ENDHEX$$stica.

if cbx_centro_cmd.checked=false then
	li_estado_est=1
	ls_zona_cmd= "ZONA"
	ls_zona_cmd_msg= "la ZONA"
else
	li_estado_est=2
	ls_zona_cmd="CMD"
	ls_zona_cmd_msg= "el CMD"
end if

//DBE ini 19/01/2000

if (il_nro_centro + il_nro_cmd + il_nro_mesa)>0 then

	if il_nro_cmd>=0 and il_nro_mesa>0 then
		li_start=2
		li_repite=0
		ll_centro=il_nro_mesa
	elseif il_nro_mesa=0 and il_nro_cmd>=0 then
		li_start=1
		li_repite=0
		choose case li_estado_est
			case 1
		ll_centro=il_nro_centro
	      case 2
		ll_centro=il_nro_cmd
      end choose
	end if
	
	
	
	for li_count=li_start to li_repite step -1
	select max(f_actual) into :ldt_f_actual
	from GI_EST_AVISO 
   WHERE USUARIO_EST=:GS_USUARIO 
	AND TIPO_DE_CONSULTA = 3 
	AND TIPO_REG = :li_estado_est 
	and nro_centro = :ll_centro
	and todos_ambitos = :li_count
   ;
	
	if year(date(ldt_f_actual))>1900 then
		il_todos_ambitos=li_count
		exit
	end if
	
next


else
	il_todos_ambitos=0
	select max(f_actual) into :ldt_f_actual
	from GI_EST_AVISO 
	WHERE USUARIO_EST=:GS_USUARIO 
	AND TIPO_DE_CONSULTA = 3 
	AND TIPO_REG = :li_estado_est	
	and todos_ambitos = 0
   ;
end if

ls_mensaje= "Existe una estad$$HEX1$$ed00$$ENDHEX$$stica generada el " +string(ldt_f_actual)+"~n que se ajusta para este criterio de seleccion" 

//
//if is_usuario = "TODOS" then
//else
//ls_mensaje=	ls_mensaje +"~n, el usuario " + is_usuario
//end if
//
if  il_nro_mesa > 0 then 
	ls_mensaje=	ls_mensaje +"~n, Sector " + st_centro.Text
elseif il_nro_cmd > 0 then
	ls_mensaje=	ls_mensaje +"~n, CMD " + st_centro.Text
elseif il_nro_centro > 0 then 
	ls_mensaje=	ls_mensaje +"~n, Zona " + st_centro.Text
end if 

// DSA 7/08/2000
//ls_mensaje=ls_mensaje+ &
//".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."

// si encuentra una estad$$HEX1$$ed00$$ENDHEX$$stica anterior, pregunta al usuario si desea con-
// servar esta o generar una nueva.
if not isnull(ldt_f_actual) and  year(date(ldt_f_actual))>1900  then
	
	//	li_gener=gnv_msg.f_mensaje("AA18",ls_mensaje,"",OkCancel!)
	// DSA INI 7/08/2000 	Si no tiene el pergil mostrar lo que existe
	//li_gener=gnv_msg.f_mensaje("AA18",ls_mensaje,"",OkCancel!)
	if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_SITUACION','ACC_MANTEN') =1 THEN			
		ls_mensaje=ls_mensaje+ &
		".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."	
		li_gener=gnv_msg.f_mensaje("AA18",ls_mensaje,"",OkCancel!)		
	else
		gnv_msg.f_mensaje("AA18",ls_mensaje,"",Ok!)
		li_gener	= 1 	
	end if
	// DSA FIN 7/08/2000

	choose case li_gener	
		    case 1
			if (il_nro_centro + il_nro_cmd + il_nro_mesa)>0 then			
	
				select max(f_actual) into :ldt_f_actual
				from GI_EST_AVISO 
				WHERE USUARIO_EST=:GS_USUARIO 
				AND TIPO_DE_CONSULTA = 3 
				AND TIPO_REG = :li_estado_est 
				and nro_centro = :ll_centro
				and todos_ambitos = :il_todos_ambitos;

	
			else
	
				select max(f_actual) into :ldt_f_actual
				from GI_EST_AVISO 
				WHERE USUARIO_EST=:GS_USUARIO 
				AND TIPO_DE_CONSULTA = 3 
				AND TIPO_REG = :li_estado_est	
				and todos_ambitos = :il_todos_ambitos;

			end if
			
			if not isnull(ldt_f_actual) and  year(date(ldt_f_actual))>1900  then
				lb_generar=false
      	else
     			lb_generar=true
		   end if
			
		case 2
			lb_generar=true
	end choose
else
	// DSA INI 7/08/2000	Si no tiene el pergil mostrar lo que existe
	//lb_generar=true
	if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_SITUACION','ACC_MANTEN') =1 THEN		
		lb_generar=true
	else
		lb_generar=false
	end if
	// DSA FIN 7/08/2000

end if


//DBE fin 19/01/2000



////DBE ini comentado 25/01/2000
//
//select distinct(to_char(f_actual,'DD/MM/YY')) 
//into :ls_fecha_actual
//from GI_EST_AVISO 
//WHERE USUARIO_EST=:GS_USUARIO 
//	AND TIPO_DE_CONSULTA = 3 
//	AND TIPO_REG = :li_estado_est; 
//
//// si encuentra una estad$$HEX1$$ed00$$ENDHEX$$stica anterior, pregunta al usuario si desea con-
//// servar esta o generar una nueva.
//
//ls_mensaje="Existe una estad$$HEX1$$ed00$$ENDHEX$$stica generada por Ud. por " + ls_zona_cmd +", para el d$$HEX1$$ed00$$ENDHEX$$a " + ls_fecha_actual + &
//				  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva." 
//
//if sqlca.sqlcode = 0 then
//	if gnv_msg.f_mensaje("AA18",ls_mensaje,"",Okcancel!)= 2  then
////		messagebox("Aviso","Existe una estad$$HEX1$$ed00$$ENDHEX$$stica del d$$HEX1$$ed00$$ENDHEX$$a " + string(ldt_f_actual)+ &
////				  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva.",information!,okcancel!)=2 then
//	
//	lb_generar=true
//		lb_hay_datos=false
//	end if
//else
//	lb_generar=true
//	lb_hay_datos=false
//end if
//
//
///// DBE fin comentado 25/01/2000
//


if lb_generar=true then
	li_ampliacion=0
	OPEN(W_BARRA)
	W_BARRA.uo_barra.barra.f_resetea_barra()
	W_BARRA.UO_BARRA.gb_1.text="Buscando Zonas Asociadas"
	W_BARRA.UO_BARRA.BARRA.visible=true
	W_BARRA.uo_barra.barra.f_amplia(li_ampliacion)
	
//	DELETE GI_EST_AVISO WHERE USUARIO_EST=:GS_USUARIO AND TIPO_DE_CONSULTA=3; 
	//DBE ini 25/01/2000

if (il_nro_centro + il_nro_cmd + il_nro_mesa)>0 then

	               choose case li_estado_est
                         case 1
                              ll_centro=il_nro_centro
                        case 2
                              ll_centro=il_nro_cmd
                  end choose

	               if il_nro_cmd>=0 and il_nro_mesa>0 then
	               	il_todos_ambitos=2
							
	               DELETE GI_EST_AVISO 
	               WHERE
						USUARIO_EST=:GS_USUARIO AND TIPO_DE_CONSULTA=3
	               and tipo_reg=:li_estado_est
	               and (nro_centro in (:il_nro_centro , :il_nro_cmd , :il_nro_mesa) or
						             nro_centro in (
                       select SGD_RELACION_CENTRO.CENTRO_DEPEN
                         from SGD_RELACION_CENTRO where 
                              SGD_RELACION_CENTRO.CENTRO_RESP = :ll_centro and 
                              SGD_RELACION_CENTRO.TIP_CENTRO =:li_estado_est and 
                              SGD_RELACION_CENTRO.CENTRO_RESP not in (98,99)))
	               and todos_ambitos = :il_todos_ambitos
                  ;

	               elseif il_nro_mesa=0 and il_nro_cmd>=0 then
                     il_todos_ambitos=1
//	               choose case li_estado_est
//                         case 1
//                              ll_centro=il_nro_centro
//                        case 2
//                              ll_centro=il_nro_cmd
//                  end choose

	               DELETE GI_EST_AVISO 
	               WHERE 
						USUARIO_EST=:GS_USUARIO AND TIPO_DE_CONSULTA=3
	               and tipo_reg=:li_estado_est
                 and  (nro_centro=:ll_centro or
	                  nro_centro in (
                       select SGD_RELACION_CENTRO.CENTRO_DEPEN
                         from SGD_RELACION_CENTRO where 
                              SGD_RELACION_CENTRO.CENTRO_RESP = :ll_centro and 
                              SGD_RELACION_CENTRO.TIP_CENTRO =:li_estado_est and 
                              SGD_RELACION_CENTRO.CENTRO_RESP not in (98,99)))
	               and todos_ambitos = :il_todos_ambitos
                  ;
  
                  end if
	            
else
	il_todos_ambitos=0
	DELETE GI_EST_AVISO 
	WHERE USUARIO_EST=:GS_USUARIO AND TIPO_DE_CONSULTA=3 
	and tipo_reg=:li_estado_est
	and todos_ambitos = :il_todos_ambitos
   ;
	
end if
	
//DBE fin 19/01/2000	

	
	
	
	
	//commit;
//	gnu_u_transaction.uf_commit(THIS) //DBE 04/02/2000
	
	IF SQLCA.SQLCODE <>0 THEN
//		MESSAGEBOX("Atencion","Error al intentar borrar")
		gnv_msg.f_mensaje("AA20","","",Ok!)
		return 0
	end if

//	//commit;
//	gnu_u_transaction.uf_commit(THIS) //DBE 04/02/2000
	
	IF IL_NRO_CENTRO=0 AND IL_NRO_CMD=0 and cbx_centro_cmd.checked=false THEN
		
		FW_BUSCA_CENTROS_CMD_PUESTOS(li_centros[],li_contador,1,li_tipos[],1)
		
	ELSEIF (IL_NRO_CMD<>0 or cbx_centro_cmd.checked=true) and IL_NRO_MESA=0 THEN
		
		IF IL_NRO_CMD<>0 THEN
			li_centros[1] = IL_NRO_CMD
			li_tipos[1] = 2
			LI_CONTADOR=1
			FW_BUSCA_CENTROS_CMD_PUESTOS(li_centros[],li_contador,3,li_tipos[],2)
		ELSE
			FW_BUSCA_CENTROS_CMD_PUESTOS(li_centros[],li_contador,2,li_tipos[],2)
		end if
		
	ELSEIF IL_NRO_MESA=0 THEN
	
		li_centros[1] = IL_NRO_CENTRO
		li_tipos[1] = 1
		LI_CONTADOR=1
		FW_BUSCA_CENTROS_CMD_PUESTOS(li_centros[],li_contador,3,li_tipos[],1)
				
	ELSE
		if IL_NRO_CENTRO = 0 then
			li_centros[1] = IL_NRO_CMD
			li_tipos[1] = 2
		else
			li_centros[1] = IL_NRO_CENTRO
			li_tipos[1] = 1
		end if
		
		li_centros[2] = IL_NRO_MESA
		li_tipos[2] = 3
		LI_CONTADOR=2

	END IF
	
	for li_bucle= 1 to li_contador
		
		if li_tipos[li_bucle]=1 then W_BARRA.UO_BARRA.gb_1.text="Datos para la Zona " + string(li_centros[li_bucle])
		if li_tipos[li_bucle]=2 then W_BARRA.UO_BARRA.gb_1.text="Datos para el CMD " + string(li_centros[li_bucle])
		if li_tipos[li_bucle]=3 then W_BARRA.UO_BARRA.gb_1.text="Datos para el Sector " + string(li_centros[li_bucle])

		li_ampliacion= truncate((li_bucle*100)/li_contador,0)
		
		W_BARRA.uo_barra.barra.f_amplia(li_ampliacion)
		
		if fw_calcula_estadistica(li_centros[li_bucle],li_tipos[li_bucle]) >0 then
			lb_hay_datos =true
		end if
		
	next
		//DBE 04/02/2000 ini
	   gnu_u_transaction.uf_commit(PARENT) 
		IF SQLCA.SQLCODE <>0 THEN
//		MESSAGEBOX("Atencion","Error al intentar grabar")
		gnv_msg.f_mensaje("AA19","","",Ok!)
	   end if
	   //DBE 04/02/2000 fin

	
end if

if isvalid(w_barra) then
	W_BARRA.uo_barra.barra.f_amplia(100)
	close(w_barra)
end if

if lb_hay_datos=false then
	gnv_msg.f_mensaje("AI22"," "," ",OK!)
//	close(parent)
	return
end if

//DBE ini 25/01/2000
if il_nro_centro + il_nro_cmd + il_nro_mesa > 0 then
	choose case li_estado_est
		case 1 //centro
			ls_centro = string(il_nro_centro)
		case 2 //cmd
			ls_centro = string(il_nro_cmd)
	end choose
	
//		this.triggerevent('ue_avan_nivel',0,ll_centro)
//		RETURN	

else
	ls_centro = '%'
end if	
//DBE fin 25/01/2000

dw_situacion_actual.fnu_despliego_datos &
(dw_situacion_actual,fg_padre_centros,gs_usuario,li_estado_est,il_todos_ambitos,ls_centro,li_estado_est,0) //DBE 

//DW_1.RETRIEVE(gs_usuario,fg_padre_centros)
            dw_1.reset()
				dw_situacion_actual.RowsCopy &
				(1, dw_situacion_actual.RowCount(), Primary!, DW_1, 1, Primary!)//DBE 21/01/2000
				
SETPOINTER(ARROW!)
in_padre1 = fg_padre_centros
in_nro_nivel = 1

IF dw_situacion_actual.rowcount()=0 THEN
	If in_prim_vez > 1 THEN
		gnv_msg.f_mensaje("AI23"," "," ",OK!)
	END IF
ELSE
	
//	if il_nro_cmd<> 0 then
//		
//		select count(*) 
//		into :ll_select 
//		from gi_est_aviso
//		where TIPO_DE_CONSULTA=3 and
//				nro_centro=:il_nro_mesa;
//				
//		if  ll_select=0 or isnull(ll_select)  then 		
////			Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Hay datos del Centro especificado pero del CMD o el Puesto elegido no hay.")		
//			gnv_msg.f_mensaje("AA21","","",Ok!)
//		end if
//		
	if il_nro_mesa<>0 then
		
	
		select count(*) 
		into :ll_select 
		from gi_est_aviso
//		where TIPO_DE_CONSULTA=3 and
//				nro_centro=:il_nro_cmd; 
       WHERE USUARIO_EST=:GS_USUARIO 
	AND TIPO_DE_CONSULTA = 3 
	AND TIPO_REG = :li_estado_est 
	and nro_centro = :il_nro_mesa
	and todos_ambitos = :il_todos_ambitos;


				
//		MESSAGEBOX("mESA" + STRING(IL_NRO_MESA),"CMD" + STRING(IL_NRO_CMD))
				
		if  ll_select=0 or isnull(ll_select)  then 
//			Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Hay datos de " + ls_zona_cmd_msg + " especificado pero del Sector elegido no hay.")
			gnv_msg.f_mensaje("IA11",ls_zona_cmd_msg,"",Ok!)
		end if
		
	end if
	
	dw_situacion_actual.SelectRow(in_fila_ant,False)    //elimino la marcar anterior
	dw_situacion_actual.SelectRow(1,True)  // marco el seleccionado
	in_fila_ant = 1

END IF

ls_tit = f_nombre_nivel(1)
end event

event ue_avan_nivel;////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: ue_avanzo_nivel
// 
// Objetivo:Carga los datos correspondiente al proximo nivel
//				en caso de no encontrar datos despliega mensaje de error
// PARAMETROS  
//	Entrada:  
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	11/5/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////
string ls_tit
int li_origen
IF in_nro_nivel < 2 THEN  // Si no estoy en el ultimo nivel
	IF dw_situacion_actual.Rowcount() > 0 THEN
		int ln_nro_centro
//		iu_avi_2033_pr = CREATE u_avi_2033_pr_situacion_actual
		IF in_fila_ant > 0 THEN	 // Si tengo uno marcado
			IF NOT ISNULL(dw_situacion_actual.getitemnumber(in_fila_ant,"NRO_CENTRO")) THEN
				if (cbx_centro_cmd.checked = TRUE) THEN
					li_origen = 2
				else
					li_origen = 1
				end if
				ln_nro_centro = dw_situacion_actual.getitemnumber(in_fila_ant,"NRO_CENTRO")
				SETPOINTER(HOURGLASS!)
//				DW_1.RETRIEVE(gs_usuario,ln_nro_centro)//DBE 21/01/2000
   			dw_situacion_actual.fnu_despliego_datos(dw_situacion_actual,ln_nro_centro,gs_usuario,3,&
				il_todos_ambitos,'%', li_origen, 0)//DBE 21/01/2000
				
		      dw_1.reset()
				dw_situacion_actual.RowsCopy &
				(1, dw_situacion_actual.RowCount(), Primary!, DW_1, 1, Primary!)//DBE 21/01/2000
				
				
				SETPOINTER(ARROW!)
				in_nro_nivel = in_nro_nivel + 1
				IF in_nro_nivel = 2 THEN	
					in_padre2 = ln_nro_centro
				Else
					in_padre3 = ln_nro_centro
				END IF
				ls_tit = f_nombre_nivel(in_nro_nivel)
				f_habilito_campos(in_nro_nivel)
				IF dw_situacion_actual.RowCount()>0 THEN
					dw_situacion_actual.SelectRow(in_fila_ant,False)    //elimino la marcar anterior
					dw_situacion_actual.SelectRow(1,True)  // marco el seleccionado
					in_fila_ant = 1
				END IF
			END IF
		END IF 
//		Destroy iu_avi_2033_pr
	END IF
Else
	gnv_msg.f_mensaje("AI22"," "," ",Ok!)
END IF

IF dw_situacion_actual.Rowcount() <= 0 THEN
	PARENT.SETREDRAW(TRUE)
	gnv_msg.f_mensaje("AI22"," "," ",Ok!)
	p_avanzar.enabled=false
	pb_1.enabled=false
end if
end event

on doubleclicked;call u_avi_2033_pr_situacion_actual::doubleclicked;dw_situacion_actual.Triggerevent("ue_avan_nivel")
end on

event clicked;call super::clicked;iF row > 0 THEN
	this.SelectRow(0,False)    //elimino la marca anterior
	this.SelectRow(row,True)  // marco el seleccionado
	in_fila_ant=row
END IF
end event

type dw_3 from datawindow within w_2033_situacion_actual
boolean visible = false
integer x = 329
integer y = 608
integer width = 494
integer height = 360
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_situacion_actual_graf_imp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


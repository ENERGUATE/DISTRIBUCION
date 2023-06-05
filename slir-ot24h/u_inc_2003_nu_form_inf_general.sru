HA$PBExportHeader$u_inc_2003_nu_form_inf_general.sru
forward
global type u_inc_2003_nu_form_inf_general from nonvisualobject
end type
end forward

global type u_inc_2003_nu_form_inf_general from nonvisualobject
end type
global u_inc_2003_nu_form_inf_general u_inc_2003_nu_form_inf_general

type variables
u_inc_2003_rn_form_inf_general iu_inc_2003_rn
u_inc_2004_rn_form_inf_general iu_inc_2004_rn
int ii_nulo
long il_nulo
string is_nulo
datetime id_nulo
decimal idec_nulo
w_2301_form_incidencia iw_contenedora
end variables

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_incidencia)
public function u_generico_comunicaciones fnu_obtener_centro_cmd_puesto (ref datawindow pd_dw, u_generico_comunicaciones pu_comunic)
public function long fnu_actualizar_ultima_inc ()
public function datetime fnu_devolver_fecha_det (ref datawindow pd_dw)
public function datetime fnu_devolver_hora_det (ref datawindow pd_dw)
public function integer fnu_devolver_resuelve_mant (ref datawindow pd_dw)
public function long fnu_devolver_nro_incidencia (ref datawindow pd_dw)
public function string fnu_devolver_observacion (ref datawindow pd_dw)
public function long fnu_devolver_nro_ot (ref datawindow pd_dw)
public function decimal fnu_devolver_nro_instalacion (ref datawindow pd_dw)
public function integer fnu_devolver_nro_nivel_inst (ref datawindow pd_dw)
public function integer fnu_borrar_seguimiento_inc (long pl_nro_incidencia)
public function integer fnu_inicializo_valores (ref datawindow pd_dw, string ps_accion_llamada, ref u_generico_comunicaciones pu_comunic, ref u_generico_comunicaciones pu_comunic1)
public function integer fnu_act_observacion (ref datawindow pd_dw, string ps_observacion)
public function integer fnu_mostrarse_accion_perfil (ref datawindow d_incidencia, ref datawindow d_ambito, string ps_accion_llamada)
public function integer fnu_m_accion_perfil_pactivate_ot (long pl_nro_incidencia, ref datawindow pd_dw, ref u_generico_comunicaciones pu_comunic, ref u_generico_comunicaciones pu_seguimiento, ref u_generico_comunicaciones pu_id_instalacion, ref u_generico_comunicaciones pu_interrupciones, ref u_generico_comunicaciones pu_ot)
public function integer fnu_m_accion_perfil_itemchange_cl (long pl_nro_incidencia, ref datawindow pd_dw, ref u_generico_comunicaciones pu_comunic, ref u_generico_comunicaciones pu_seguimiento, ref u_generico_comunicaciones pu_id_instalacion, ref u_generico_comunicaciones pu_interrupciones, ref u_generico_comunicaciones pu_ot)
public function boolean fnu_grabar_incidencia (ref datawindow pd_dw, string ps_accion_llamada)
public function integer fnu_cargar_centro_cmd_puesto (ref datawindow pd_dw, integer pi_centro, integer pi_cmd, integer pi_puesto)
public function integer fnu_perfil_post_interrup (ref datawindow pd_dw, u_generico_comunicaciones pu_interrupt)
public function datetime fnu_devolver_fecha_causa (ref datawindow pd_dw)
public function datetime fnu_devolver_fec_der (ref datawindow pd_dw)
public function boolean fnu_actualizar_aviso (long pl_nro_aviso, long pl_nro_incidencia)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos
// 
// Objetivo: Obtiene los datos de la incidencia
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: DataWindow
//                                      pl_nro_incidencia
//              Salida:  
//                                              
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//                                              
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_row
long ll_cod_calle
long ll_nro_brigada
long ll_tipo

decimal{0} ld_nro_instalacion
String ls_numero_puerta
String ls_duplicador
String ls_direccion
String ls_nombre
String ls_tipo
String ls_calle
String ls_nom_brigada
pd_dw.SetTransObject(SQLCA)
ll_row = pd_dw.Retrieve(pl_nro_incidencia)
IF ll_row=0 THEN
	gnv_msg.f_mensaje("AI33","","",OK!)
	return 0
END IF
IF ISNULL(pd_dw.getitemnumber(1,"pot_afectada")) THEN
	pd_dw.setitem(1,"pot_afectada",0)
	pd_dw.setitem(1,"pot_contratada",0)
END IF
IF pd_dw.getitemnumber(1,"alcance")<>fgci_incidencia_de_suministro THEN
	IF NOT ISNULL(pd_dw.getitemdecimal(1,"nombre_ins")) THEN
			ld_nro_instalacion=pd_dw.getitemdecimal(1,"nombre_ins")
			Select NOM_INSTALACION,COD_CALLE,NUM_PUERTA,DUPLICADOR,TIPo_INSTALACION into :ls_nombre,:ll_cod_calle,:ls_numero_puerta,:ls_duplicador,:ll_tipo 
			from SGD_INSTALACION where NRO_INSTALACION=:ld_nro_instalacion
			and SGD_INSTALACION.BDI_JOB = 0 //DBE 11/01/2000
			;
			
			Select NOM_CALLE into :ls_calle FROM CALLEJERO WHERE COD_CALLE=:ll_cod_calle;  
			
			SELECT valor INTO :ls_tipo FROM SGD_VALOR &
				WHERE codif = 'T_IN' AND codigo = :ll_tipo;
			
			ll_nro_brigada=pd_dw.getitemnumber(1,"brigada")
			Select NOMBRE into :ls_nom_brigada FROM GI_BRIGADA WHERE NRO_BRIGADA=:ll_nro_brigada;
			ls_direccion = ls_calle
			ls_direccion = ls_direccion+" "+Trim(ls_numero_puerta)+" "+Trim(ls_duplicador)
			pd_dw.setitem(1,"nomb_tipo",ls_tipo)

			pd_dw.setitem(1,"dir_instalacion",ls_direccion)
			pd_dw.setitem(1,"nombre_instalacion",ls_nombre)
			pd_dw.accepttext()
	END IF
END IF
	ll_nro_brigada=pd_dw.getitemnumber(1,"brigada")
	IF NOT ISNULL(ll_nro_brigada) THEN
		Select NOMBRE into :ls_nom_brigada FROM GI_BRIGADA WHERE NRO_BRIGADA=:ll_nro_brigada;
		pd_dw.setitem(1,"nom_brigada",ls_nom_brigada)
		pd_dw.accepttext()
	END IF
Return 1
end function

public function u_generico_comunicaciones fnu_obtener_centro_cmd_puesto (ref datawindow pd_dw, u_generico_comunicaciones pu_comunic);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_centro_cmd_mesa
// 
// Objetivo: Obtiene el centro, el cmd y el puesto de la incidencia que se quiere
//           modificar para poder insertar los datos en el objeto de ambito
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada:  datawindow, pu_comunic
//                               
//              Salida:   lu_comunic
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      13/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pu_comunic.is_comunic.intval3=pd_dw.GetItemNumber(1,"nro_centro")
pu_comunic.is_comunic.intval4=pd_dw.GetItemNumber(1,"nro_cmd")
pu_comunic.is_comunic.intval5=pd_dw.GetItemNumber(1,"nro_mesa")


Return pu_comunic
end function

public function long fnu_actualizar_ultima_inc ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizar_ultima_inc
// 
// Objetivo: Incrementa en uno el nro de la ultima incidencia que se dio de alta
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: --
//              Salida:  --
//                                              
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      13/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_inc

//Obtengo la ultima Incidencia
//Obtengo la ultima ot 
select cod_incidencia.nextval into :ll_nro_inc from dual;
 
Return ll_nro_inc
end function

public function datetime fnu_devolver_fecha_det (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_fecha_det
//
// Objetivo:
//         Retorna la fecha de detecci$$HEX1$$f300$$ENDHEX$$n
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

datetime fecha
fecha=pd_dw.GetItemDateTime(1,"f_deteccion") 

Return fecha 
end function

public function datetime fnu_devolver_hora_det (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_hora_det
//
// Objetivo:
//         Obtiene la hora de detecci$$HEX1$$f300$$ENDHEX$$n 
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

datetime fecha
fecha=pd_dw.GetItemDateTime(1,"h_deteccion") 

Return fecha
end function

public function integer fnu_devolver_resuelve_mant (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_resuelve_mant
//
// Objetivo:
//         Retorna el valor de resuelve mantenimiento
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

return pd_dw.GetItemNumber(1,"resuelve_mant")
end function

public function long fnu_devolver_nro_incidencia (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_nro_incidencia
//
// Objetivo:
//         Retorna el n$$HEX1$$fa00$$ENDHEX$$mero de incidencia
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

return pd_dw.GetItemNumber(1,"nro_incidencia")
end function

public function string fnu_devolver_observacion (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_observacion
//
// Objetivo:
//         Retorna campo Observaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

Return pd_dw.GetItemstring(1,"observacion")
end function

public function long fnu_devolver_nro_ot (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_nro_ot
//
// Objetivo:
//         Retorna el n$$HEX1$$fa00$$ENDHEX$$mero de orden de trabajo.
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

Return pd_dw.GetItemNumber(1,"ot") 
 
end function

public function decimal fnu_devolver_nro_instalacion (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_nro_instalacion
//
// Objetivo:
//        Retorna el nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

Return pd_dw.GetItemDecimal(1,"nombre_ins")
end function

public function integer fnu_devolver_nro_nivel_inst (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_nro_nivel_inst
//
// Objetivo:
//         Retorna n$$HEX1$$fa00$$ENDHEX$$mero de nivel de la instalaci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

Return integer(pd_dw.GetItemString(1,"tipo_instalacion"))
end function

public function integer fnu_borrar_seguimiento_inc (long pl_nro_incidencia);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_borrar_seguimiento_inc
//
// Objetivo: Anula estado de operaci$$HEX1$$f300$$ENDHEX$$n y estado mantenimiento 
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

DELETE estado_oper WHERE nro_incidencia=:pl_nro_incidencia;
IF SQLCA.SQLCODE<0 THEN
	gnv_msg.f_error(28)
	//RollBack;
	gnu_u_transaction.uf_rollback()
END IF  
DELETE estado_mant WHERE nro_incidencia=:pl_nro_incidencia;
IF SQLCA.SQLCODE<0 THEN
	gnv_msg.f_error(29)
	
END IF  
Return 1
end function

public function integer fnu_inicializo_valores (ref datawindow pd_dw, string ps_accion_llamada, ref u_generico_comunicaciones pu_comunic, ref u_generico_comunicaciones pu_comunic1);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_inicializo_valores
//
// Objetivo:
//        Se inicializan valores por defecto
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, ps_accion_llamada, pu_comunic, pu_comunic1
//        Salida:  --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 
return 1
end function

public function integer fnu_act_observacion (ref datawindow pd_dw, string ps_observacion);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_act_observacion
//
// Objetivo: Se obtiene campo observaci$$HEX1$$f300$$ENDHEX$$n
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, ps_observacion
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

pd_dw.setitem(1,"observacion",ps_observacion)
return 1
end function

public function integer fnu_mostrarse_accion_perfil (ref datawindow d_incidencia, ref datawindow d_ambito, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_mostrarse_accion_perfil
//
// Objetivo: Controla que el perfil del usuario pueda ejecutar
//               el evento open si el mismo est$$HEX2$$e1002000$$ENDHEX$$autorizado a abrir la
//           ventana en las condiciones en que fue llamda.
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: d_incidencia, d_ambito, ps_accion_llamada
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 
return 1

end function

public function integer fnu_m_accion_perfil_pactivate_ot (long pl_nro_incidencia, ref datawindow pd_dw, ref u_generico_comunicaciones pu_comunic, ref u_generico_comunicaciones pu_seguimiento, ref u_generico_comunicaciones pu_id_instalacion, ref u_generico_comunicaciones pu_interrupciones, ref u_generico_comunicaciones pu_ot);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_m_accion_perfil_pactivate_ot
//
// Objetivo:
//        Habilita campo orden de trabajo seg$$HEX1$$fa00$$ENDHEX$$n la acci$$HEX1$$f300$$ENDHEX$$n llamada 
//        para el evento open de la ventana.
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia, pd_dw, pu_comunic, pu_seguimiento
//                 pu_id_instalacion, pu_interrupciones, pu_ot
//        Salida:  --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 


//inicializa y habilita campos para el evento open de la ventana

u_inc_2003_rn_form_inf_general lu_inc_2003_rn
u_inc_2004_nu_form_inf_general lu_inc_2004_nu
//lu_inc_2003_rn = create u_inc_2003_rn_form_inf_general
lu_inc_2004_nu = create u_inc_2004_nu_form_inf_general
lu_inc_2003_rn.iw_contenedora= this.iw_contenedora
string ls_resultado
ls_resultado = " "
// COMENTARIO GENERAL

// pu_comunic - es la variable de comunicaciones de la ventana de inform
//                                       macion general de la incidencia
//                                      pu_comunic.is_comunic.accion_llamada representa la accion
//                                      original con que fue abierta la ventana y puede valer
//                                              - "Alta"
//                                              - "Alta nivel instalacion"
//                                              - "Alta nivel Suministro"
//                                              - "Modificacion"
//                                              - "Consulta"




//----------------------------------------------------------------------

// orden de trabajo
// pu_ot.is_comunic.longval2 representa el n$$HEX1$$fa00$$ENDHEX$$mero de ot enviado por la
// ventana de gestion de ot
// su valor en el open en un alta nueva depende de si fue o no llamada
// esta ventana. sino valdr$$HEX2$$e1002000$$ENDHEX$$0

lu_inc_2003_rn.frn_ini_ot(pd_dw,pu_ot.is_comunic.longval2)

ls_resultado =pd_dw.modify("ot.protect="+string(lu_inc_2003_rn.frn_hab_ot()))
lu_inc_2004_nu.fnu_actualizar_seguimiento(pd_dw.getitemnumber(1,"nro_incidencia"),fgci_incidencia_enviado_brigada,pu_ot.is_comunic.datval1)

//----------------------------------------------------------------------
// brigada
// idem ot

lu_inc_2003_rn.frn_ini_brigada(pd_dw,pu_ot.is_comunic.intval1)

ls_resultado =pd_dw.modify("brigada.protect="+string(lu_inc_2003_rn.frn_hab_brigada()))



//----------------------------------------------------------------------
	
// Estado de la Incidencia
// pu_interrupciones.is_comunic.intval1 - representa el estado de las
// interrupciones seg$$HEX1$$fa00$$ENDHEX$$n lo devuelto por la venta de interrupciones
// puede valer
//                                      - 0 Ninguna interrupcion seleccionada
//                                      - 1 Interrupciones seleccionada pero ninguna repuesta
//                                      - 2 Por lo menos una interrupcione repuesta pero no todas
//                                      - 3 Todas las interrupciones repuestas
// Para el evento open , este valor deber$$HEX2$$e1002000$$ENDHEX$$valer siempre 0 ya que solamente
// lo modifica la ventana de interrupciones.

lu_inc_2003_rn.frn_ini_estado_operaciones &
								(pd_dw,pu_comunic.is_comunic.accion_llamada,&
								pu_interrupciones.is_comunic.intval1,&
								pu_seguimiento.is_comunic.intval7,pu_interrupciones.is_comunic.datval2,pu_interrupciones.is_comunic.datval3)

ls_resultado =pd_dw.modify("estado_actual.protect="+string(lu_inc_2003_rn.frn_hab_numero_incidencia()))

// causa de la incidencia

lu_inc_2003_rn.frn_ini_causa(pd_dw)
IF Not isnull(pd_dw.getitemnumber(1,"ot")) and (pd_dw.getitemnumber(1,"ot")<>0) THEN
	pd_dw.modify("tipo_incidencia.protect=1")
END IF

//destroy lu_inc_2003_rn 
destroy lu_inc_2004_nu

return 1
end function

public function integer fnu_m_accion_perfil_itemchange_cl (long pl_nro_incidencia, ref datawindow pd_dw, ref u_generico_comunicaciones pu_comunic, ref u_generico_comunicaciones pu_seguimiento, ref u_generico_comunicaciones pu_id_instalacion, ref u_generico_comunicaciones pu_interrupciones, ref u_generico_comunicaciones pu_ot);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_m_accion_perfil_itemchange_cl
//
// Objetivo:
//        Inicializa y Habilita campos para el evento open de la
//                       ventana.
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pl_nro_incidencia, pd_dw, pu_comunic, pu_seguimiento
//                 pu_id_instalacion, pu_interrupciones, pu_ot
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 
// variables de instancia
u_inc_2003_rn_form_inf_general lu_inc_2003_rn
//lu_inc_2003_rn = create u_inc_2003_rn_form_inf_general

string ls_resultado = " "
lu_inc_2003_rn.iw_contenedora= this.iw_contenedora
lu_inc_2003_rn.frn_ini_estado_operaciones &
								(pd_dw,pu_comunic.is_comunic.accion_llamada,&
								pu_interrupciones.is_comunic.intval1,&
								pu_seguimiento.is_comunic.intval7,pu_interrupciones.is_comunic.datval2,pu_interrupciones.is_comunic.datval3)

ls_resultado =pd_dw.modify("estado_actual.protect="+string(lu_inc_2003_rn.frn_hab_numero_incidencia()))
ls_resultado =pd_dw.modify&
("tip_tension.protect="+string(lu_inc_2003_rn.frn_hab_tip_tension(pd_dw,pu_comunic.is_comunic.accion_llamada)))

if lu_inc_2003_rn.frn_hab_tip_tension&
(pd_dw,pu_comunic.is_comunic.accion_llamada) = 1 then
	pd_dw.modify("tip_tension.background.color=" + gs_gris)
else
	pd_dw.modify&
("tip_tension.background.color=" + gs_blanco)
end if
//destroy lu_inc_2003_rn 

return 1
end function

public function boolean fnu_grabar_incidencia (ref datawindow pd_dw, string ps_accion_llamada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_grabar_incidencia
// 
// Objetivo: Graba en la tabla de incidenica los datos de la incidencia 
//				 dada de alta o modificada
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//      Entrada: DataWindow
//        		  ps_accion_llamada     Modificacion
//                                                     Alta_nivel_suministro
//                                                     Alta_nivel_instalacion
//                                                     Alta
//      Salida:  --
//                                              
//
//  	Fecha         	Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
//  	-----    		-----------   	----------------------------------------
//  	13/02/96       	SAB      	Versi$$HEX1$$f300$$ENDHEX$$n Original
//	 	25/09/96				AD				Se inicializan los campos eb4007_est y kwh_estimado
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_incidencia,ll_ot, ll_nro_brigada
string ls_usuario,ls_programa,ls_desc_incidencia,ls_observacion
datetime ld_f_actual,ld_h_actual,ld_f_deteccion,ld_h_deteccion,ld_f_est_res,ld_h_est_res,ld_f_alta,ld_h_alta
decimal ld_prim_aviso,ld_inst_afectada,ld_inst_origen,ld_pot_afectada,ld_pot_contratada
datetime ldt_fec_ser_rep
int li_est_actual,li_tip_tension,li_cod_causa,li_nro_centro,li_nro_cmd,li_nro_mesa,li_ccli_afec,li_brigada_mant,li_ind_suministro,li_cod_est_clima,li_estado_mantenimiento,li_centro_alta,li_cmd_alta,li_puesto_alta,li_cant_avisos,li_cant_cli,li_resuelve_mant
int li_fam_causa, li_int_horario

string ls_mat_averiado

//int li_fam_mat_aver
//int li_mat_aver
int li_causa
int resultado
DateTime ldt_fecha_aux
long result
long ll_incid
long ll_cantidad
long ll_cant_cli_imp
long ll_cant_cli_afect
dec{0} ld_nombre_ins

setnull(ii_nulo)
setnull(il_nulo)
setnull(is_nulo)
setnull(id_nulo)
setnull(idec_nulo)
setnull(ldt_fecha_aux)

iu_inc_2004_rn = create u_inc_2004_rn_form_inf_general
//iu_inc_2003_rn = create u_inc_2003_rn_form_inf_general
ll_nro_incidencia = pd_dw.getitemnumber(1,"nro_incidencia")
ll_cantidad = 0
iu_inc_2003_rn.iw_contenedora= this.iw_contenedora
////////////////////////////NOMBRE DE INSTALACION //////////////////////

pd_dw.setitem(1,"h_deteccion",pd_dw.getitemdatetime(1,"f_deteccion"))
IF pd_dw.getitemnumber(1,"alcance")=fgci_incidencia_de_suministro THEN 
	ld_nombre_ins = fgcdec_incidencia_de_suministro
	pd_dw.setitem(1,"nombre_ins",ld_nombre_ins)
END IF

///////////////////////// NUMERO DE INCIDENCIA///////////////////////////
IF not iu_inc_2003_rn.frn_validar_numero_incidencia(pd_dw) THEN
		gnv_msg.f_mensaje("AI36","","",OK!)
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
/////////////////////INDICATIVO DE SUMINISTRO/////////////////////////////
IF not iu_inc_2003_rn.frn_validar_ind_suministro(pd_dw,ll_cantidad) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
/////////////////////// INSTALACION AFECTADA///////////////////////////
IF not iu_inc_2003_rn.frn_validar_instalacion_afectada(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
/////////////////////// FECHA DE DETECCION//////////////////////////////
IF ps_accion_llamada="Alta" or ps_accion_llamada="Alta_nivel_instalacion" or ps_accion_llamada="Alta_nivel_suministro" THEN
	IF not iu_inc_2004_rn.frn_evaluo_f_deteccion(pd_dw,pd_dw.getitemdatetime(1,"f_deteccion"),ldt_fecha_aux) then 
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
	END IF
END IF
/////////////////////// OBSERVACIONES//////////////////////////////////
IF not iu_inc_2003_rn.frn_validar_observaciones(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
/////////////////////// DESCRIPCION /////////////////////////////////////
If gi_pais <> 8 Then // A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Moldavia. 14/06/2005.
	IF not iu_inc_2003_rn.frn_validar_des(pd_dw) THEN
	//		destroy iu_inc_2003_rn
			destroy iu_inc_2004_rn
			return false
	END IF
End If // A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Moldavia. 14/06/2005.

/////////////////////////////// ESTADO ACTUAL //////////////////////////
IF not iu_inc_2003_rn.frn_validar_estado_actual(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
//////////////////////////////// CAUSA//////////////////////////////////
IF not iu_inc_2003_rn.frn_validar_causa(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
ELSE
	IF NOT ISNULL(pd_dw.GetItemnumber(1,"causa")) THEN
		li_cod_causa = pd_dw.GetItemnumber(1,"causa")
		
		if gi_pais = 6 or gi_pais = 7 or gi_pais = 9 then
			Select subtipo
			into :li_fam_causa 
			from GI_CAUSA
			where GI_CAUSA.COD_CAUSA =: li_cod_causa ;
		else
			Select GPO_CAUSA 
			into :li_fam_causa 
			from GI_CAUSA
			where GI_CAUSA.COD_CAUSA =: li_cod_causa ;
		end if
		
		pd_dw.setitem(1,"incidencia_fam_causa",li_fam_causa)
		pd_dw.accepttext()
	END IF
END IF
////////////////////////// POTENCIA CONTRATADA//////////////////////////
IF not iu_inc_2003_rn.frn_validar_potencia_contratada(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
//----------------------------------------------------------------------
//////////////////////////////POTENCIA AFECTADA//////////////////////////
IF not iu_inc_2003_rn.frn_validar_potencia_afectada(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
/////////////////////////////MATERIAL AVERIADO//////////////////////////
//IF not iu_inc_2003_rn.frn_validar_material_averiado(pd_dw) THEN
////		destroy iu_inc_2003_rn
//		destroy iu_inc_2004_rn
//		return false
//END IF
//IF NOT ISNULL(pd_dw.getitemstring(1,"material_averiado")) THEN
//	ls_mat_averiado = pd_dw.getitemstring(1,"material_averiado")
////	Select "IND_FAMILIA" into : li_fam_mat_aver from "T_MATERIAL_AVERIADO" where "MAT_AVERIADO" =: li_mat_averiado;
////	if li_fam_mat_aver=99 THEN
////		li_fam_mat_aver=li_mat_averiado
////	END IF
//	pd_dw.setitem(1,"incidencia_fam_mant_aver",ls_mat_averiado)
//	pd_dw.accepttext()
//END IF
/////////////////////////////////CENTRO DE ALTA////////////////////////
IF not iu_inc_2003_rn.frn_validar_centro_alta(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
////////////////////////////////////CMD DE ALTA/////////////////////////
IF not iu_inc_2003_rn.frn_validar_cmd_alta(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
/////////////////////////////////////PUESTO DE ALTA//////////////////////
IF not iu_inc_2003_rn.frn_validar_puesto_alta(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
//////////////////////////////////// PROGRAMA ///////////////////////////

pd_dw.SetItem(1,"programa","iw_2301")

/////////////////////////////////// HORA ACTUAL/////////////////////////

pd_dw.SetItem(1,"h_actual",fgnu_fecha_actual())

/////////////////////////////////// FECHA ACTUAL/////////////////////////

pd_dw.SetItem(1,"f_actual",fgnu_fecha_actual())

////////////////////////////////// RESUELVE MANTENIMIENTO////////////////
// solamente se controla que no sea nulo y se resetea a 0 en caso de que sea

//IF ISNULL(pd_dw.GetItemNumber(1,"resuelve_mant")) then
//	pd_dw.SetItem(1,"resuelve_mant",0)
//END IF

///////////// CANTIDAD DE CLIENTES AFECTADOS POR LA INCIDENCIA////////////

IF not iu_inc_2003_rn.frn_validar_cant_cli(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF

////////////////////////// CANTIDAD DE AVISOS////////////////////////////
// se calcula la cantidad de avisos asociados a la incidencia

select count(*) into :ll_cantidad  from gi_avisos where gi_avisos.nro_incidencia = :ll_nro_incidencia;
pd_dw.SetItem(1,"cant_avisos",ll_cantidad)
IF not iu_inc_2003_rn.frn_validar_cant_avisos(pd_dw,ll_cantidad) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF

////////////////////////////// ESTADO MANTENIMIENTO///////////////////////
IF not iu_inc_2003_rn.frn_validar_estado_mant(pd_dw) THEN
//		destroy iu_inc_2003_rn
		destroy iu_inc_2004_rn
		return false
END IF
/////////////////////////// HORA DE ALTA DE LA INCIDENCIA///////////////
IF ISNULL(pd_dw.GetItemdatetime(1,"h_alta")) THEN
	pd_dw.SetItem(1,"h_alta",fgnu_fecha_actual())
END IF
////////////////////////// FECHA DE ALTA DE LA INCIDENCIA///////////////
ld_f_alta = pd_dw.GetItemdatetime(1,"f_alta")
IF ISNULL(ld_f_alta) THEN
	ld_f_alta = fgnu_fecha_actual()
	pd_dw.SetItem(1,"f_alta",ld_f_alta)
END IF

/////// CANTIDAD DE CLIENTES IMPORTANTES, AFECTADOS POR LA INCIDENCIA//////
SELECT SUM(CAN_CLI_IMP)
INTO :ll_cant_cli_imp
FROM SGD_INSTALACION, SGD_INTERRUPCION
WHERE SGD_INTERRUPCION.NRO_INCIDENCIA = :ll_nro_incidencia AND
		SGD_INTERRUPCION.NRO_INSTALACION = SGD_INSTALACION.NRO_INSTALACION AND
		SGD_INSTALACION.BDI_JOB = 0;


pd_dw.SetItem(1,"Cant_cli",ll_cant_cli_imp)

////////////////////////////// CODIGO DE ESTADO DEL CLIMA/////////////////
int li_estado_clima
li_nro_cmd = pd_dw.GetItemNumber(1,"nro_cmd")
SELECT "GI_SIT_CLIMA"."COD_EST_CLIMA"  
  INTO :li_estado_clima  
  FROM "GI_SIT_CLIMA"  
  WHERE ( "GI_SIT_CLIMA"."NRO_CMD" = :li_nro_cmd ) AND  
        ( "GI_SIT_CLIMA"."FECHA" = :ld_f_alta )   ;


pd_dw.SetItem(1,"est_clima",li_estado_clima)

////////////////////////////INTERVALO HORARIO//////////////////////////
//li_hora=Hour(Time(pd_dw.getitemdatetime(1,"f_deteccion")))
//SELECT COD_HOR into :li_int_horario from GI_T_INT_HORARIO WHERE DESDE <=:li_hora and HASTa > :lI_hora;
//pd_dw.setitem(1,"cod_hor",li_int_horario)

//SELECT COD_HOR into :li_int_horario from GI_T_INT_HORARIO WHERE TO_CHAR(DESDE,'HH24:MI:SS') <= :ls_hora and TO_CHAR(HASTA,'HH24:MI:SS') > :ls_hora;
li_int_horario = fgrn_intervalo_horario(pd_dw.getitemdatetime(1,"f_deteccion"))

pd_dw.setitem(1,"cod_hor",li_int_horario)

////////////////////////// HORA ESTIMADA DE RESOLUCION/////////////////

pd_dw.SetItem(1,"h_est_res",fgnu_fecha_actual())

///////////////////////////////////// USUARIO/////////////////////////

pd_dw.SetItem(1,"usuario",gs_usuario)

/////////////////////////////////////DURACIONES ENTRE ESTADOS /////////
// Por defecto pongo ceros, si la incidencia esta resuelta el evento 
// ue_grabar de la w_2301_form_incidencias se encarga de calcularlos y ponerlos
//pd_dw.SetItem(1,"corte_st_al",0)
//pd_dw.SetItem(1,"corte_eb_al",0)
//pd_dw.SetItem(1,"corte_sr",0)
//pd_dw.SetItem(1,"sincorte_st_al",0)
//pd_dw.SetItem(1,"sincorte_eb_al",0)
//pd_dw.SetItem(1,"sincorte_sr",0)
//pd_dw.SetItem(1,"duracion_eb_cl",0)
//pd_dw.SetItem(1,"duracion_cl_sr",0)

/////////////////   CENTRO CMD Y MESA MANTENIMIENTO
//IF NOT gb_usuario_mant THEN
//	pd_dw.SetItem(1,"incidencia_centro_mant",gi_nro_centro_dep)
//	pd_dw.SetItem(1,"incidencia_cmd_mant",gi_nro_cmd_dep)
//	pd_dw.SetItem(1,"incidencia_mesa_mant",gi_nro_puesto_dep)
//END IF
//////////////////////////////////

//	iu_inc_2004_rn.frn_obtener_duraciones(pd_dw)
//	iu_inc_2004_rn.fnu_procesar_interr(pd_dw,pd_dw.getitemnumber(1,"nro_incidencia"))

//////////////////////////////MARCO ESTADO BATCH
if isnull(pd_dw.getitemnumber(1,"estado_batch")) THEN
	pd_dw.setitem(1,"estado_batch",0)
	pd_dw.setitem(1,"eb6203",0)
	pd_dw.setitem(1,"eb4001",0)
	pd_dw.setitem(1,"eb4002",0)
	pd_dw.setitem(1,"eb4003",0)
	pd_dw.setitem(1,"eb4004",0)
	pd_dw.setitem(1,"eb4007",0)
	pd_dw.setitem(1, "eb4007_est", 0)
	pd_dw.setitem(1, "kwh_estimado", 0)
END IF
if pd_dw.getitemnumber(1,"alcance")=fgci_incidencia_de_suministro THEN
	pd_dw.setitem(1,"nro_centro",pd_dw.getitemnumber(1,"centro_alta"))
	pd_dw.setitem(1,"nro_cmd",pd_dw.getitemnumber(1,"cmd_alta"))
	pd_dw.setitem(1,"nro_mesa",pd_dw.getitemnumber(1,"puesto_alta"))
END IF
//////////////////////////////RESOLUCION DE AVISOS/////////////////////

pd_dw.AcceptText()

// Comentado a posta
//long li_resultado
//li_resultado = pd_dw.Update()

return true
end function

public function integer fnu_cargar_centro_cmd_puesto (ref datawindow pd_dw, integer pi_centro, integer pi_cmd, integer pi_puesto);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_centro_cmd_puesto
//
// Objetivo: Setea los campos centro , cmd y puesto
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, pi_centro, pi_cmd, pi_puesto
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

pd_dw.SetItem(1,"nro_centro",pi_centro)
pd_dw.SetItem(1,"nro_cmd",pi_cmd)
pd_dw.SetItem(1,"nro_mesa",pi_puesto)

Return 1
end function

public function integer fnu_perfil_post_interrup (ref datawindow pd_dw, u_generico_comunicaciones pu_interrupt);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_perfil_post_interrup
//
// Objetivo: Inicializa campos seg$$HEX1$$fa00$$ENDHEX$$n valores en la pantalla 
//           interrupciones.
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, pu_interrupt
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

string ls_resultado
u_inc_2003_rn_form_inf_general lu_inc_2003_rn
//lu_inc_2003_rn = create u_inc_2003_rn_form_inf_general
lu_inc_2003_rn.iw_contenedora= this.iw_contenedora
lu_inc_2003_rn.frn_ini_interrupcion(pd_dw,pu_interrupt.is_comunic.longval1,pu_interrupt.is_comunic.longval2,pu_interrupt.is_comunic.longval3,pu_interrupt.is_comunic.longval4,pu_interrupt.is_comunic.datval1,pu_interrupt.is_comunic.decval1,pu_interrupt.is_comunic.decval2,pu_interrupt.is_comunic.decval3,pu_interrupt.is_comunic.decval4)
lu_inc_2003_rn.frn_ini_estado_operaciones(pd_dw,pu_interrupt.is_comunic.accion_llamada,pu_interrupt.is_comunic.intval1,pu_interrupt.is_comunic.intval7,pu_interrupt.is_comunic.datval2,pu_interrupt.is_comunic.datval3)
							    //interrup.  //seguimiento           
//destroy lu_inc_2003_rn                                                         
Return 1
end function

public function datetime fnu_devolver_fecha_causa (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_fecha_causa
//
// Objetivo:
//         Retorna fecha de causa.
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

return(pd_dw.getitemdatetime(1,"fec_causa"))
end function

public function datetime fnu_devolver_fec_der (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_fec_der
//
// Objetivo:
//         Retorna fecha de derivacion a mantenimiento, en caso de que la incidencia se derivo.
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//      
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 
DateTime ldt_fecha_der
Long li_estado
Long ll_nro_incidencia
ll_nro_incidencia=pd_dw.getitemnumber(1,"nro_incidencia")
li_estado=1
If Not IsNull(pd_dw.getitemnumber(1,"estado_mantenimiento")) then
		If pd_dw.getitemnumber(1,"estado_mantenimiento")>0 THEN
			SELECT F_ALTA INTO :ldt_fecha_der from Estado_Mant where nro_incidencia=:ll_nro_incidencia and cod_estado=:li_estado;   
		ELSE
			SetNull(ldt_fecha_der)
		END IF
ELSE
	SetNull(ldt_fecha_der)
END IF
return(ldt_fecha_der)
end function

public function boolean fnu_actualizar_aviso (long pl_nro_aviso, long pl_nro_incidencia);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizar_aviso
//
// Objetivo: Se Actualiza Avisos
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada:  pl_nro_aviso, pl_nro_incidencia
//        Salida:
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 



UPDATE "GI_AVISOS" SET NRO_INCIDENCIA= :pl_nro_incidencia WHERE "NRO_AVISO"= :pl_nro_aviso;
IF SQLCA.SQLCODE<>0 THEN
	RETURN FALSE
ELSE
	RETURN TRUE
END IF

end function

on u_inc_2003_nu_form_inf_general.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_inc_2003_nu_form_inf_general.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


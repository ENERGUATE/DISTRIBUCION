HA$PBExportHeader$u_lista_reporte.sru
forward
global type u_lista_reporte from datawindow
end type
end forward

global type u_lista_reporte from datawindow
integer width = 869
integer height = 848
integer taborder = 1
string dataobject = "d_lista_reporte"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type
global u_lista_reporte u_lista_reporte

type variables

end variables

forward prototypes
public function integer fpr_lista_incidencia ()
public function boolean fpr_puedo_aplicar (string ps_aplica, string ps_tipo)
public function integer fpr_lista_aviso ()
public function integer fpr_lista_brigada ()
public function integer fpr_lista_instalaciones ()
public function integer fpr_lista_reenganche ()
public function integer fpr_lista_descargos ()
public function integer fpr_lista_aviso_2 ()
end prototypes

public function integer fpr_lista_incidencia ();//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Integer li_a = 1



If Not fg_verifica_parametro(Parent.ClassName()) Then
//AHM (8/01/2008)
	IF gi_pais = 8 THEN		//Comprueba si es Moldavia
		This.insertrow(0)
		This.SetItem(li_a,"nombre","Incidencia")
		This.SetItem(li_a,"campo","nro_incidencia")
		This.SetItem(li_a,"tabla","sgd_incidencia")
		This.SetItem(li_a,"join","")
		This.SetItem(li_a,"campo_inc","nro_incidencia")
		This.SetItem(li_a,"tipo","N")
		This.Setitem(li_a,"habilitado","")
		This.Setitem(li_a,"sinonimo","")
		li_a += 1
	END IF
	
//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Instalaci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","nom_instalacion")
	This.SetItem(li_a,"tabla","sgd_instalacion")
	//This.SetItem(1,"join","sgd_incidencia.nro_inst_afectada = sgd_instalacion.nro_instalacion")
	This.SetItem &
	(li_a,"join","sgd_incidencia.nro_inst_afectada = sgd_instalacion.nro_instalacion(+)" +&
	" and sgd_instalacion.bdi_job(+) = 0") //DBE 11/01/2000
	This.SetItem(li_a,"campo_inc","nro_inst_afectada")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Descripci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","desc_incidencia")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","desc_incidencia")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Fecha Detecci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","f_deteccion")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","f_deteccion")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Fecha Resoluci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","fec_resolucion")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","fec_resolucion")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Fecha Causa Localizada")
	This.SetItem(li_a,"campo","fec_causa")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","fec_causa")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Causa")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","gi_causa")
	This.SetItem(li_a,"join","sgd_incidencia.cod_causa = gi_causa.cod_causa(+)")
	This.SetItem(li_a,"campo_inc","cod_causa")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Estado Actual")
	This.SetItem(li_a,"campo","PL_fgnu_est_inc(sgd_incidencia.est_Actual,sgd_incidencia.alcance,sgd_incidencia.tip_incidencia)")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","est_actual")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
	This.SetItem(li_a,"campo","nom_centro")
	This.SetItem(li_a,"tabla","sgd_centro")
	This.SetItem(li_a,"join","sgd_incidencia.nro_mesa = sgd_centro.nro_centro and sgd_centro.tip_centro = 3")
	This.SetItem(li_a,"campo_inc","nro_mesa")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Material Averiado")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_materiales")
	This.SetItem(li_a,"join","sgd_incidencia.mat_averiado = sgd_materiales.cod_material(+)")
	This.SetItem(li_a,"campo_inc","mat_averiado")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Cantidad Clientes")
	This.SetItem(li_a,"campo","can_cli")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","can_cli")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Brigada Responsable")
	This.SetItem(li_a,"campo","nombre")
	This.SetItem(li_a,"tabla","gi_brigada")
	This.SetItem(li_a,"join","sgd_incidencia.nro_brigada = gi_brigada.nro_brigada(+)")
	This.SetItem(li_a,"campo_inc","nro_brigada")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Tipo de Incidencia")
	// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
	This.SetItem(li_a,"campo","descripcion as aa")
	This.SetItem(li_a,"tabla","sgd_valor")
	This.SetItem(li_a,"join","sgd_incidencia.tip_incidencia = sgd_valor.codigo and sgd_valor.codif='INC'")
	This.SetItem(li_a,"campo_inc","tip_incidencia")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **

//***************************************
// GNU 17-4-2007. Mejora 1/485502
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Observaciones")
	This.SetItem(li_a,"campo","observacion")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","observacion")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")

	IF fg_verifica_parametro('CAUSAS') THEN //CAMBIO SUR13 *JHE 01/02/2001*
		li_a += 1
		This.insertrow(0)
		This.SetItem(li_a,"nombre","Familia de Causa")
		This.SetItem(li_a,"campo","descripcion")
		This.SetItem(li_a,"tabla","gi_familia_causas")
		This.SetItem(li_a,"join", "(sgd_incidencia.fam_causa = gi_familia_causas.gpo_causa (+))")
		This.SetItem(li_a,"campo_inc","fam_causa")
		This.SetItem(li_a,"tipo","S")
		This.Setitem(li_a,"habilitado","")
		This.Setitem(li_a,"sinonimo","")
		
		li_a += 1
		This.insertrow(0)
		This.SetItem(li_a,"nombre","Subtipo de Causa")
		This.SetItem(li_a,"campo","descripcion")
		This.SetItem(li_a,"tabla","gi_subtipo_causa")
		This.SetItem(li_a,"join","gi_subtipo_causa.tipo=gi_causa.tipo" + &
								 " and gi_subtipo_causa.subtipo=gi_causa.subtipo" + &
								 " and gi_subtipo_causa.gpo_causa=gi_causa.gpo_causa" + &
								 " and gi_causa.cod_causa=sgd_incidencia.cod_causa")
		This.SetItem(li_a,"campo_inc","cod_causa")
		This.SetItem(li_a,"tipo","S")
		This.SetItem(li_a,"habilitado","")
		This.SetItem(li_a,"sinonimo","")
		
		li_a += 1
		This.insertrow(0)
		This.SetItem(li_a,"nombre","Tipo de Causa")
		This.SetItem(li_a,"campo","descripcion")
		This.SetItem(li_a,"tabla","gi_subtipos")
		This.SetItem(li_a,"join","gi_subtipos.tipo=gi_causa.tipo" + &
								 " and gi_subtipos.subtipo=gi_causa.subtipo" + &
								 " and gi_causa.cod_causa=sgd_incidencia.cod_causa")
		This.SetItem(li_a,"campo_inc","cod_causa")
		This.SetItem(li_a,"tipo","S")
		This.SetItem(li_a,"habilitado","")
		This.SetItem(li_a,"sinonimo","")
		
		// FIN GNU
	END IF  //CAMBIO SUR13 *JHE 15/02/2001*

Else
	
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Incidencia")
	This.SetItem(li_a,"campo","nro_incidencia")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","nro_incidencia")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Instalaci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","nom_instalacion")
	This.SetItem(li_a,"tabla","sgd_instalacion")
	//This.SetItem(li_a,"join","sgd_incidencia.nro_inst_afectada = sgd_instalacion.nro_instalacion")
	This.SetItem &
	(li_a,"join","sgd_incidencia.nro_inst_afectada = sgd_instalacion.nro_instalacion" +&
	" and sgd_instalacion.bdi_job = 0") //DBE 11/01/2000
	This.SetItem(li_a,"campo_inc","nro_inst_afectada")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Descripci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","desc_incidencia")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","desc_incidencia")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Fecha Detecci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","f_deteccion")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","f_deteccion")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
//	li_a += 1
//	This.insertrow(0)
//	This.SetItem(li_a,"nombre","Fecha Causa Localizada")
//	This.SetItem(li_a,"campo","fec_causa")
//	This.SetItem(li_a,"tabla","sgd_incidencia")
//	This.SetItem(li_a,"join","")
//	This.SetItem(li_a,"campo_inc","fec_causa")
//	This.SetItem(li_a,"tipo","D")
//	This.Setitem(li_a,"habilitado","")
//	This.Setitem(li_a,"sinonimo","")
//	
//	li_a += 1
//	This.insertrow(0)
//	This.SetItem(li_a,"nombre","Fecha Ini. Prev. Brigada.")
//	This.SetItem(li_a,"campo","f_ini_prev")
//	This.SetItem(li_a,"tabla","gi_ot")
//	This.SetItem(li_a,"join","gi_ot.nro_incidencia = sgd_incidencia.nro_incidencia")
//	This.SetItem(li_a,"campo_inc","f_ini_prev")
//	This.SetItem(li_a,"tipo","D")
//	This.Setitem(li_a,"habilitado","")
//	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.InsertRow(0)
	This.SetItem(li_a,"nombre","Fecha Env$$HEX1$$ed00$$ENDHEX$$o de Brigada")
	This.SetItem(li_a,"campo","f_desde")
	This.SetItem(li_a,"tabla","gi_ot")
	This.SetItem(li_a,"join","gi_ot.nro_incidencia = sgd_incidencia.nro_incidencia")
	This.SetItem(li_a,"campo_inc","f_desde")
	This.SetItem(li_a,"tipo","D")
	This.SetItem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.InsertRow(0)
	This.SetItem(li_a,"nombre","Fecha Servicio Repuesto")
	This.SetItem(li_a,"campo","f_alta")
	This.SetItem(li_a,"tabla","sgd_estado_oper")
	This.SetItem(li_a,"join","sgd_estado_oper.nro_incidencia = sgd_incidencia.nro_incidencia and sgd_estado_oper.cod_estado =  " + String(fgci_incidencia_servicio_repuesto) + " ")
	This.SetItem(li_a,"campo_inc","f_alta")
	This.SetItem(li_a,"tipo","D")
	This.SetItem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Fecha Resoluci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","fec_resolucion")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","fec_resolucion")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Brigada Responsable")
	This.SetItem(li_a,"campo","nombre")
	This.SetItem(li_a,"tabla","gi_brigada")
	This.SetItem(li_a,"join","sgd_incidencia.nro_brigada = gi_brigada.nro_brigada(+)")
	This.SetItem(li_a,"campo_inc","nro_brigada")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	IF fg_verifica_parametro('CAUSAS') THEN //CAMBIO SUR13 *JHE 01/02/2001*
	li_a += 1
		This.insertrow(0)
		This.SetItem(li_a,"nombre","Familia de Causa")
		This.SetItem(li_a,"campo","descripcion")
		This.SetItem(li_a,"tabla","gi_familia_causas")
		This.SetItem(li_a,"join", "(sgd_incidencia.fam_causa = gi_familia_causas.gpo_causa (+))")
		This.SetItem(li_a,"campo_inc","fam_causa")
		This.SetItem(li_a,"tipo","S")
		This.Setitem(li_a,"habilitado","")
		This.Setitem(li_a,"sinonimo","")
		
		// GNU 17-4-2007. Mejora 1/485502
		li_a += 1
		This.insertrow(0)
		This.SetItem(li_a,"nombre","Subtipo de Causa")
		This.SetItem(li_a,"campo","descripcion")
		This.SetItem(li_a,"tabla","gi_subtipo_causa")
		This.SetItem(li_a,"join","gi_subtipo_causa.tipo=gi_causa.tipo" + &
								 " and gi_subtipo_causa.subtipo=gi_causa.subtipo" + &
								 " and gi_subtipo_causa.gpo_causa=gi_causa.gpo_causa" + &
								 " and gi_causa.cod_causa=sgd_incidencia.cod_causa")
		This.SetItem(li_a,"campo_inc","cod_causa")
		This.SetItem(li_a,"tipo","S")
		This.SetItem(li_a,"habilitado","")
		This.SetItem(li_a,"sinonimo","")
		
		li_a += 1
		This.insertrow(0)
		This.SetItem(li_a,"nombre","Tipo de Causa")
		This.SetItem(li_a,"campo","descripcion")
		This.SetItem(li_a,"tabla","gi_subtipos")
		This.SetItem(li_a,"join","gi_subtipos.tipo=gi_causa.tipo" + &
								 " and gi_subtipos.subtipo=gi_causa.subtipo" + &
								 " and gi_causa.cod_causa=sgd_incidencia.cod_causa")
		This.SetItem(li_a,"campo_inc","cod_causa")
		This.SetItem(li_a,"tipo","S")
		This.SetItem(li_a,"habilitado","")
		This.SetItem(li_a,"sinonimo","")
		
		// FIN GNU
	END IF  //CAMBIO SUR13 *JHE 15/02/2001*
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Causa")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","gi_causa")
	This.SetItem(li_a,"join","sgd_incidencia.cod_causa = C.cod_causa(+)")
	This.SetItem(li_a,"campo_inc","cod_causa")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","C")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Estado Actual")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_valor")
	This.SetItem(li_a,"join","sgd_incidencia.est_actual = B.codigo and B.codif='E_OP'")
	This.SetItem(li_a,"campo_inc","est_actual")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","B")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
	This.SetItem(li_a,"campo","nom_centro")
	This.SetItem(li_a,"tabla","sgd_centro")
	This.SetItem(li_a,"join","sgd_incidencia.nro_mesa = sgd_centro.nro_centro")
	This.SetItem(li_a,"campo_inc","nro_mesa")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Material Averiado")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_materiales")
	This.SetItem(li_a,"join","sgd_incidencia.mat_averiado = sgd_materiales.cod_material(+)")
	This.SetItem(li_a,"campo_inc","mat_averiado")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Tipo de Incidencia")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_valor")
	This.SetItem(li_a,"join","sgd_incidencia.tip_incidencia = sgd_valor.codigo and sgd_valor.codif='INC'")
	This.SetItem(li_a,"campo_inc","tip_incidencia")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	// GNU 17-4-2007. Mejora 1/485502
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Observaciones")
	This.SetItem(li_a,"campo","observacion")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","observacion")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	// FIN GNU
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Duraci$$HEX1$$f300$$ENDHEX$$n EB")
	This.SetItem(li_a,"campo","duracion_env_brigada")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","duracion_env_brigada")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
//	li_a += 1
//	This.insertrow(0)
//	This.SetItem(li_a,"nombre","Duraci$$HEX1$$f300$$ENDHEX$$n CL")
//	This.SetItem(li_a,"campo","duracion_cl")
//	This.SetItem(li_a,"tabla","sgd_incidencia")
//	This.SetItem(li_a,"join","")
//	This.SetItem(li_a,"campo_inc","duracion_cl")
//	This.SetItem(li_a,"tipo","N")
//	This.Setitem(li_a,"habilitado","")
//	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Duraci$$HEX1$$f300$$ENDHEX$$n SR")
	This.SetItem(li_a,"campo","duracion_sr")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","duracion_sr")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Duraci$$HEX1$$f300$$ENDHEX$$n RS")
	This.SetItem(li_a,"campo","duracion_rs")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","duracion_rs")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Duraci$$HEX1$$f300$$ENDHEX$$n CE")
	This.SetItem(li_a,"campo","duracion_ce")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","duracion_ce")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Cantidad Clientes")
	This.SetItem(li_a,"campo","ccli_afec")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","ccli_afec")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Potencia")
	This.SetItem(li_a,"campo",'pot_afectada')
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","pot_afectada")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Potencia por tiempo")
	This.SetItem(li_a,"campo","paxtc")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","paxtc")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Agente")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_valor")
	This.SetItem(li_a,"join","sgd_incidencia.agente = A.codigo AND A.codif ='TAGT'" )
	This.SetItem(li_a,"campo_inc","agente")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","A")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Tension Origen")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_valor")
	This.SetItem(li_a,"join","sgd_incidencia.tension_origen = E.codigo AND E.codif = 'TTEN'")
	This.SetItem(li_a,"campo_inc","tension_origen")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","E")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Tension Afectada")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_valor")
	This.SetItem(li_a,"join","sgd_incidencia.tension_afectada = D.codigo AND D.codif = 'TTEN'")
	This.SetItem(li_a,"campo_inc","tension_efectada")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","D")

	//LSH INI 08/09/2013 evolutivo DEO12-00000263
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","F. Elim. del Peligro")
	This.SetItem(li_a,"campo","f_elim_peligro")
	This.SetItem(li_a,"tabla","sgd_incidencia")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","f_elim_peligro")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	//LSH FIN 08/09/2013 evolutivo DEO12-00000263
		
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Cantidad de Datos")
	This.SetItem(li_a,"campo","cantidad")
	This.SetItem(li_a,"tabla","")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","cantidad")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")

End If
//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

return 1
end function

public function boolean fpr_puedo_aplicar (string ps_aplica, string ps_tipo);

IF ps_aplica = ps_tipo OR ps_aplica = "T" THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF

end function

public function integer fpr_lista_aviso ();Integer li_a = 1

This.insertrow(0)
This.SetItem(li_a,"nombre","N.I.S.")
This.SetItem(li_a,"campo","nis_rad")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nis_rad")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

// GNU 17-4-2007. Mejora 1/343671
IF fg_verifica_parametro('NIC') THEN
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","N.I.C.")
	This.SetItem(li_a,"campo","nic")
	This.SetItem(li_a,"tabla","sumcon")
	This.SetItem(li_a,"join","sumcon.nis_rad(+)=gi_avisos.nis_rad")
	This.SetItem(li_a,"campo_inc","nic")
	This.SetItem(li_a,"tipo","S")
	This.SetItem(li_a,"habilitado","")
END IF
// FIN GNU

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nombre")
This.SetItem(li_a,"campo","nombre")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nombre")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Apellido (1)")
This.SetItem(li_a,"campo","ape1")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","ape1")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Apellido (2)")
This.SetItem(li_a,"campo","ape2")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","ape2")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Documento I.D.")
This.SetItem(li_a,"campo","Doc_id")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","Doc_id")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

//This.insertrow(0)
//This.SetItem(6,"nombre","Tipo de Doc.")
//This.SetItem(6,"campo","descripcion")
//This.SetItem(6,"tabla","sgd_valor")
//This.SetItem(6,"join","gi_avisos.tip_doc = sgd_valor.codigo and sgd_valor.codif = 'TIPO' ")
//This.SetItem(6,"campo_inc","tip_doc")
//This.SetItem(6,"tipo","S")
//This.Setitem(6,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Tipo de Doc.")
This.SetItem(li_a,"campo","tip_doc")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","tip_doc")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Telefono Cli.")
This.SetItem(li_a,"campo","tfno_cli")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","tfno_cli")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
This.SetItem(li_a,"campo","nom_sector")
This.SetItem(li_a,"tabla","sgd_sector")
This.SetItem(li_a,"join","gi_avisos.nro_mesa=sgd_sector.cod_sector")
This.SetItem(li_a,"campo_inc","nom_sector")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Tipo de Aviso")
This.SetItem(li_a,"campo","descripcion")
This.SetItem(li_a,"tabla","gi_t_tip_aviso")
This.SetItem(li_a,"join","gi_avisos.tip_aviso = gi_t_tip_aviso.tip_aviso")
This.SetItem(li_a,"campo_inc","tip_aviso")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Alcance")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
This.SetItem(li_a,"campo","descripcion as aa")
This.SetItem(li_a,"tabla","sgd_valor")
This.SetItem(li_a,"join","gi_avisos.co_alcance = sgd_valor.codigo and sgd_valor.codif = 'ALC' ")
This.SetItem(li_a,"campo_inc","descripcion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha de Alta")
This.SetItem(li_a,"campo","f_alta")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_alta")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Estado del Aviso")
// GNU 20-09-2005 Incidencia 0/372611
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
//This.SetItem(12,"campo","descripcion as bb")
//This.SetItem(12,"tabla","sgd_valor")
//This.SetItem(12,"join","gi_avisos.est_aviso = sgd_valor.codigo and sgd_valor.codif='E_AV'")
This.SetItem(li_a,"campo","est_aviso")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
//Fin GNU
This.SetItem(li_a,"campo_inc","est_aviso")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Observaciones CMD") // GNU 17-4-2007. Mejora 1/485502
This.SetItem(li_a,"campo","obs_cmd")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","obs_cmd")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
// GNU 17-4-2007. Mejora 1/485502
This.insertrow(0)
This.SetItem(li_a,"nombre","Observaciones Telegestiones")
This.SetItem(li_a,"campo","obs_telegestiones")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","obs_telegestiones")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")
// FIN GNU

//\\// PM_U003 TIPOS VIAS AMR 13/06/2002 
// \/ Agregar tabla tipos para colocar el tipo de calle esto esta ligado al cambio en el
//    evento ue_armar_sql ventana w_reportes

//This.insertrow(0)
//This.SetItem(14,"nombre","Nom. Calle")
//This.SetItem(14,"campo","nom_calle")
//This.SetItem(14,"tabla","gi_avisos")
//This.SetItem(14,"join","")
//This.SetItem(14,"campo_inc","nom_calle")
//This.SetItem(14,"tipo","S")
//This.Setitem(14,"habilitado","")

IF gb_tipos_de_via THEN
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Nom. Calle")
	This.SetItem(li_a,"campo","desc_tipo ||' '|| gi_avisos.nom_calle AS nom_calle")
	This.SetItem(li_a,"tabla","tipos")
	This.SetItem(li_a,"join","(callejero.tip_via = tipos.tipo (+)) AND (gi_avisos.cod_calle = callejero.cod_calle (+))")
	This.SetItem(li_a,"campo_inc","nom_calle")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
ELSE
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Nom. Calle")
	This.SetItem(li_a,"campo","nom_calle")
	This.SetItem(li_a,"tabla","gi_avisos")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","nom_calle")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
END IF	
	
// /\
////\\ PM_U003 TIPOS VIAS AMR 13/06//2002 
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Num. Puerta")
This.SetItem(li_a,"campo","num_puerta")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","num_puerta")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Duplicador")
This.SetItem(li_a,"campo","duplicador")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","duplicador")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha de Resoluci$$HEX1$$f300$$ENDHEX$$n")
This.SetItem(li_a,"campo","fecha_res")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","fecha_res")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

//HLA.INI.DDAG-4995.01/03/2016
//li_a += 1
//This.insertrow(0)
//This.SetItem(li_a,"nombre","Codigo de Horario")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
//This.SetItem(li_a,"campo","descripcion as cc")
//This.SetItem(li_a,"tabla","sgd_valor")
//This.SetItem(li_a,"join","gi_avisos.cod_horario = sgd_valor.codigo and sgd_valor.codif='HORA'")
//This.SetItem(li_a,"campo_inc","descripcion")
//This.SetItem(li_a,"tipo","S")
//This.Setitem(li_a,"habilitado","")
//HLA.FIN.DDAG-4995.01/03/2016

li_a += 1
// GNU 1-12-2006. EPSA
This.insertrow(0)
This.SetItem(li_a,"nombre","Nro. Aviso")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
This.SetItem(li_a,"campo","nro_aviso")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_aviso")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")
// FIN GNU

li_a += 1
// GNU 17-4-2007. Mejora 1/485502
This.insertrow(0)
This.SetItem(li_a,"nombre","Departamento")
This.SetItem(li_a,"campo","nom_depto")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_depto")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021   ** INI    ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Depto")
This.SetItem(li_a,"campo","cod_depto")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_depto")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Localidad")
This.SetItem(li_a,"campo","nom_loc")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_loc")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021   ** INI    ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Local")
This.SetItem(li_a,"campo","cod_loc")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_loc")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Municipio")
This.SetItem(li_a,"campo","nom_munic")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_munic")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** INI       ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Munic")
This.SetItem(li_a,"campo","cod_munic")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_munic")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

IF fg_verifica_parametro('GEO') and gi_pais= 4 THEN
	This.SetItem(li_a - 2,"nombre","Distrito")
	This.SetItem(li_a - 1,"nombre","Barrio")
	This.SetItem(li_a,"nombre","Corregimiento")
END IF

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Provincia")
This.SetItem(li_a,"campo","nom_prov")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_prov")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")
// FIN GNU

/*-------------------------------     TDA - MEJORA 01/2021 ** INI       ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Prov")
This.SetItem(li_a,"campo","cod_prov")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_prov")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

// GNU 17-4-2007. Mejora 1/343671
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","OT")
This.SetItem(li_a,"campo","nro_ot")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_ot")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nro. Incidencia")
This.SetItem(li_a,"campo","nro_incidencia")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_incidencia")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")*/
// FIN GNU

//AHM (24/11/2009) Mejora 1/668221
/*li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Sum. Asociados")
This.SetItem(li_a,"campo","(select count(*) from aco_sum where aco_sum.nis_rad = gi_avisos.nis_rad)")
This.SetItem(li_a,"tabla","")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")*/

//LSH INI 08/09/2013 evolutivo DEO12-00000263
/*li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","F. Elim. del Peligro")
This.SetItem(li_a,"campo","f_elim_peligro")
This.SetItem(li_a,"tabla","sgd_incidencia")
This.SetItem(li_a,"join","sgd_incidencia.nro_incidencia = gi_avisos.nro_incidencia")
This.SetItem(li_a,"campo_inc","f_elim_peligro")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")*/

////3ra Etapa///////////////
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Clase de Aviso")
This.SetItem(li_a,"campo","descripcion")
This.SetItem(li_a,"tabla","sgd_valor")
This.SetItem(li_a,"join","sgd_valor.codigo=gi_avisos.clase_aviso and sgd_valor.codif='C_AV'")
This.SetItem(li_a,"campo_inc","descripcion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")
////////////////////////////

//HLA.INI.DDAG-4995.01/03/2016
//li_a += 1
//This.insertrow(0)
//This.SetItem(li_a,"nombre","F. Envio Brigada OT")
//This.SetItem(li_a,"campo","f_desde")
//This.SetItem(li_a,"tabla","gi_brigada_ot")
//This.SetItem(li_a,"join","sgd_incidencia.nro_incidencia = gi_avisos.nro_incidencia and sgd_incidencia.ot = gi_brigada_ot.nro_ot")
//This.SetItem(li_a,"campo_inc","f_desde")
//This.SetItem(li_a,"tipo","D")
//This.Setitem(li_a,"habilitado","")
//LSH FIN 08/09/2013 evolutivo DEO12-00000263
//HLA.FIN.DDAG-4995.01/03/2016


/*-------------------------------     TDA - MEJORA 09/2019       ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Causa")
This.SetItem(li_a,"campo","descripcion")
This.SetItem(li_a,"tabla","causa")
This.SetItem(li_a,"join","causa.codigo (+) = gi_avisos.ot_causa")
This.SetItem(li_a,"campo_inc","descripcion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")


li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Usuario")
This.SetItem(li_a,"campo","us_registro")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","us_registro")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nombre de Usuario")
This.SetItem(li_a,"campo","nombre")
This.SetItem(li_a,"tabla","usuario")
This.SetItem(li_a,"join","usuario.usuario (+) = gi_avisos.us_registro")
This.SetItem(li_a,"campo_inc","nombre")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Generaci$$HEX1$$f300$$ENDHEX$$n de Aviso")
This.SetItem(li_a,"campo","case when gi_avisos.US_REGISTRO IN (SELECT USR2.USUARIO FROM USUARIO USR2 WHERE PERMISOS LIKE 'OCM') then 'Oficina Comercial' else 'OT24' end generacion")
This.SetItem(li_a,"tabla","")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")




return 1
end function

public function integer fpr_lista_brigada ();If Not fg_verifica_parametro(Parent.ClassName()) Then
	This.insertrow(0)
	This.SetItem(1,"nombre","Nombre de Brigada")
	This.SetItem(1,"campo","nombre")
	This.SetItem(1,"tabla","gi_brigada")
	This.SetItem(1,"join","")
	This.SetItem(1,"campo_inc","nombre")
	This.SetItem(1,"tipo","S")
	This.Setitem(1,"habilitado","")

	This.insertrow(0)
	This.SetItem(2,"nombre","N$$HEX1$$fa00$$ENDHEX$$mero de Brigada")
	This.SetItem(2,"campo","nro_brigada")
	This.SetItem(2,"tabla","gi_brigada")
	This.SetItem(2,"join","")
	This.SetItem(2,"campo_inc","nro_brigada")
	This.SetItem(2,"tipo","N")
	This.Setitem(2,"habilitado","")

	This.insertrow(0)
	This.SetItem(3,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
	This.SetItem(3,"campo","nom_centro")
	This.SetItem(3,"tabla","sgd_centro")
	This.SetItem(3,"join","gi_brigada.nro_mesa=sgd_centro.nro_centro and sgd_centro.tip_centro = 3")
	This.SetItem(3,"campo_inc","nro_mesa")
	This.SetItem(3,"tipo","S")
	This.Setitem(3,"habilitado","")

	This.insertrow(0)
	This.SetItem(4,"nombre","Disponibilidad")
	// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
	This.SetItem(4,"campo","descripcion as aa")
	This.SetItem(4,"tabla","sgd_valor")
	This.SetItem(4,"join","gi_brigada.ind_disponible = sgd_valor.codigo and sgd_valor.codif='DISP'")
	This.SetItem(4,"campo_inc","ind_disponible")
	This.SetItem(4,"tipo","S")
	This.Setitem(4,"habilitado","")

	This.insertrow(0)
	This.SetItem(5,"nombre","Trabajando en Inst.")
	This.SetItem(5,"campo","nom_instalacion")
	This.SetItem(5,"tabla","sgd_instalacion")
	//This.SetItem(5,"join","gi_brigada.ot=gi_ot.nro_ot(+) and gi_ot.nro_instalacion=sgd_instalacion.nro_instalacion(+)")
	This.SetItem &
	(5,"join","gi_brigada.ot=gi_ot.nro_ot(+)"+ &
	" and gi_ot.nro_instalacion=sgd_instalacion.nro_instalacion(+)"+ &
	" and NVL(sgd_instalacion.bdi_job,0) = 0") //DBE 11/01/2000
	This.SetItem(5,"campo_inc","ot")
	This.SetItem(5,"tipo","S")

	This.Setitem(5,"habilitado","")

	This.insertrow(0)
	This.SetItem(6,"nombre","Trab. en OT Aviso")
	This.SetItem(6,"campo","nom_calle")
	This.SetItem(6,"tabla","gi_avisos")
	This.SetItem(6,"join","gi_brigada.ot=gi_ot.nro_ot(+) and gi_ot.nro_aviso=gi_avisos.nro_aviso(+)")
	This.SetItem(6,"campo_inc","ot")
	This.SetItem(6,"tipo","S")
	This.Setitem(6,"habilitado","")

	This.insertrow(0)
	This.SetItem(7,"nombre","Trab. en Inc. Aviso")
	This.SetItem(7,"campo","dir_aviso")
	This.SetItem(7,"tabla","sgd_incidencia")
	This.SetItem(7,"join","gi_brigada.ot=sgd_incidencia.ot(+)")
	This.SetItem(7,"campo_inc","ot")
	This.SetItem(7,"tipo","S")
	This.Setitem(7,"habilitado","")

//This.insertrow(0)
//This.SetItem(8,"nombre","Turno")
//This.SetItem(8,"campo","descripcion")
//This.SetItem(8,"tabla","sgd_valor")
//This.SetItem(8,"join","gi_brigada.turno = sgd_valor.codigo and sgd_valor.codif='HORA'")
//This.SetItem(8,"campo_inc","turno")
//This.SetItem(8,"tipo","S")
//This.Setitem(8,"habilitado","")

	This.insertrow(0)
	This.SetItem(8,"nombre","Veh$$HEX1$$ed00$$ENDHEX$$culo")
	This.SetItem(8,"campo","movil")
	This.SetItem(8,"tabla","gi_brigada")
	This.SetItem(8,"join","")
	This.SetItem(8,"campo_inc","movil")
	This.SetItem(8,"tipo","S")
	This.Setitem(8,"habilitado","")

	This.insertrow(0)
	This.SetItem(9,"nombre","Frec. Radio")
	This.SetItem(9,"campo","frec_radio")
	This.SetItem(9,"tabla","gi_brigada")
	This.SetItem(9,"join","")
	This.SetItem(9,"campo_inc","frec_radio")
	This.SetItem(9,"tipo","N")
	This.Setitem(9,"habilitado","")

	This.insertrow(0)
	This.SetItem(10,"nombre","Tipo de Brigada")
	// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
	This.SetItem(10,"campo","descripcion as bb")
	This.SetItem(10,"tabla","sgd_valor")
	This.SetItem(10,"join","gi_brigada.tip_brigada = sgd_valor.codigo and sgd_valor.codif='T_BR'")
	This.SetItem(10,"campo_inc","tip_brigada")
	This.SetItem(10,"tipo","S")
	This.Setitem(10,"habilitado","")

//This.insertrow(0)
//This.SetItem(11,"nombre","Trabajos Previstos")
//This.SetItem(11,"campo","ind_previsto")
//This.SetItem(11,"tabla","gi_brigada")
//This.SetItem(11,"join","")
//This.SetItem(11,"campo_inc","ind_previsto")
//This.SetItem(11,"tipo","N")
//This.Setitem(11,"habilitado","")

	This.insertrow(0)
	This.SetItem(11,"nombre","Fecha de Alta")
	This.SetItem(11,"campo","f_actual")
	This.SetItem(11,"tabla","gi_brigada")
	This.SetItem(11,"join","")
	This.SetItem(11,"campo_inc","f_actual")
	This.SetItem(11,"tipo","D")
	This.Setitem(11,"habilitado","")

ELSE

	This.insertrow(0)
	This.SetItem(1,"nombre","Nombre de Brigada")
	This.SetItem(1,"campo","nombre")
	This.SetItem(1,"tabla","gi_brigada")
	This.SetItem(1,"join","")
	This.SetItem(1,"campo_inc","nombre")
	This.SetItem(1,"tipo","S")
	This.Setitem(1,"habilitado","")
	This.Setitem(1,"sinonimo","")

	This.insertrow(0)
	This.SetItem(2,"nombre","N$$HEX1$$fa00$$ENDHEX$$mero de Brigada")
	This.SetItem(2,"campo","nro_brigada")
	This.SetItem(2,"tabla","gi_brigada")
	This.SetItem(2,"join","")
	This.SetItem(2,"campo_inc","nro_brigada")
	This.SetItem(2,"tipo","N")
	This.Setitem(2,"habilitado","")
	This.Setitem(2,"sinonimo","")

	This.insertrow(0)
	This.SetItem(3,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
	This.SetItem(3,"campo","nom_centro")
	This.SetItem(3,"tabla","sgd_centro")
	This.SetItem(3,"join","gi_brigada.nro_mesa=sgd_centro.nro_centro and sgd_centro.tip_centro = 3")
	This.SetItem(3,"campo_inc","nro_mesa")
	This.SetItem(3,"tipo","S")
	This.Setitem(3,"habilitado","")
	This.Setitem(3,"sinonimo","")

	This.insertrow(0)
	This.SetItem(4,"nombre","Disponibilidad")
	// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
	This.SetItem(4,"campo","descripcion")
	This.SetItem(4,"tabla","sgd_valor")
	This.SetItem(4,"join","gi_brigada.ind_disponible = A.codigo and A.codif='DISP'")
	This.SetItem(4,"campo_inc","ind_disponible")
	This.SetItem(4,"tipo","S")
	This.Setitem(4,"habilitado","")
	This.Setitem(4,"sinonimo","A")

	This.insertrow(0)
	This.SetItem(5,"nombre","Trabajando en Inst.")
	This.SetItem(5,"campo","nom_instalacion")
	This.SetItem(5,"tabla","sgd_instalacion")
	//This.SetItem(5,"join","gi_brigada.ot=gi_ot.nro_ot(+) and gi_ot.nro_instalacion=sgd_instalacion.nro_instalacion(+)")
	This.SetItem &
	(5,"join","gi_brigada.ot=gi_ot.nro_ot(+)"+ &
	" and gi_ot.nro_instalacion=sgd_instalacion.nro_instalacion(+)"+ &
	" and NVL(sgd_instalacion.bdi_job,0) = 0") //DBE 11/01/2000
	This.SetItem(5,"campo_inc","ot")
	This.SetItem(5,"tipo","S")
	This.Setitem(5,"habilitado","")
	This.Setitem(5,"sinonimo","")

	This.insertrow(0)
	This.SetItem(6,"nombre","Trab. en OT Aviso")
	This.SetItem(6,"campo","nom_calle")
	This.SetItem(6,"tabla","gi_avisos")
	This.SetItem(6,"join","gi_brigada.ot=gi_ot.nro_ot(+) and gi_ot.nro_aviso=gi_avisos.nro_aviso(+)")
	This.SetItem(6,"campo_inc","ot")
	This.SetItem(6,"tipo","S")
	This.Setitem(6,"habilitado","")
	This.Setitem(6,"sinonimo","")

	This.insertrow(0)
	This.SetItem(7,"nombre","Trab. en Inc. Aviso")
	This.SetItem(7,"campo","dir_aviso")
	This.SetItem(7,"tabla","sgd_incidencia")
	This.SetItem(7,"join","gi_brigada.ot=sgd_incidencia.ot(+)")
	This.SetItem(7,"campo_inc","ot")
	This.SetItem(7,"tipo","S")
	This.Setitem(7,"habilitado","")
	This.Setitem(7,"sinonimo","")

//This.insertrow(0)
//This.SetItem(8,"nombre","Turno")
//This.SetItem(8,"campo","descripcion")
//This.SetItem(8,"tabla","sgd_valor")
//This.SetItem(8,"join","gi_brigada.turno = sgd_valor.codigo and sgd_valor.codif='HORA'")
//This.SetItem(8,"campo_inc","turno")
//This.SetItem(8,"tipo","S")
//This.Setitem(8,"habilitado","")

	This.insertrow(0)
	This.SetItem(8,"nombre","Veh$$HEX1$$ed00$$ENDHEX$$culo")
	This.SetItem(8,"campo","movil")
	This.SetItem(8,"tabla","gi_brigada")
	This.SetItem(8,"join","")
	This.SetItem(8,"campo_inc","movil")
	This.SetItem(8,"tipo","S")
	This.Setitem(8,"habilitado","")
	This.Setitem(8,"sinonimo","")

	This.insertrow(0)
	This.SetItem(9,"nombre","Frec. Radio")
	This.SetItem(9,"campo","frec_radio")
	This.SetItem(9,"tabla","gi_brigada")
	This.SetItem(9,"join","")
	This.SetItem(9,"campo_inc","frec_radio")
	This.SetItem(9,"tipo","N")
	This.Setitem(9,"habilitado","")
	This.Setitem(9,"sinonimo","")

	This.insertrow(0)
	This.SetItem(10,"nombre","Tipo de Brigada")
	// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
	This.SetItem(10,"campo","descripcion")
	This.SetItem(10,"tabla","sgd_valor")
	This.SetItem(10,"join","gi_brigada.tip_brigada = B.codigo and B.codif='T_BR'")
	This.SetItem(10,"campo_inc","tip_brigada")
	This.SetItem(10,"tipo","S")
	This.Setitem(10,"habilitado","")
	This.Setitem(10,"sinonimo","B")

//This.insertrow(0)
//This.SetItem(11,"nombre","Trabajos Previstos")
//This.SetItem(11,"campo","ind_previsto")
//This.SetItem(11,"tabla","gi_brigada")
//This.SetItem(11,"join","")
//This.SetItem(11,"campo_inc","ind_previsto")
//This.SetItem(11,"tipo","N")
//This.Setitem(11,"habilitado","")

	This.insertrow(0)
	This.SetItem(11,"nombre","Fecha de Alta")
	This.SetItem(11,"campo","f_actual")
	This.SetItem(11,"tabla","gi_brigada")
	This.SetItem(11,"join","")
	This.SetItem(11,"campo_inc","f_actual")
	This.SetItem(11,"tipo","D")
	This.Setitem(11,"habilitado","")
	This.Setitem(11,"sinonimo","")

// GNU 24-4-2007. Mejora 1/343671
	This.insertrow(0)
	This.SetItem(12,"nombre","Cantidad de Datos")
	This.SetItem(12,"campo","cantidad")
	This.SetItem(12,"tabla","")
	This.SetItem(12,"join","")
	This.SetItem(12,"campo_inc","cantidad")
	This.SetItem(12,"tipo","N")
	This.Setitem(12,"habilitado","")
	This.Setitem(12,"sinonimo","")
// FIN GNU
END IF
return 1
end function

public function integer fpr_lista_instalaciones ();This.insertrow(0)
This.SetItem(1,"nombre","Nombre de Inst.")
This.SetItem(1,"campo","nom_instalacion")
This.SetItem(1,"tabla","sgd_instalacion")
This.SetItem(1,"join","")
This.SetItem(1,"campo_inc","nom_instalacion")
This.SetItem(1,"tipo","S")
This.Setitem(1,"habilitado","")

This.insertrow(0)
This.SetItem(2,"nombre","N$$HEX1$$fa00$$ENDHEX$$mero de Instalaci$$HEX1$$f300$$ENDHEX$$n")
This.SetItem(2,"campo","nro_instalacion")
This.SetItem(2,"tabla","sgd_instalacion")
This.SetItem(2,"join","")
This.SetItem(2,"campo_inc","nro_instalacion")
This.SetItem(2,"tipo","N")
This.Setitem(2,"habilitado","")

This.insertrow(0)
This.SetItem(3,"nombre","Zona-CMD-Sector")
This.SetItem(3,"campo","nom_centro")
This.SetItem(3,"tabla","sgd_centro")
This.SetItem(3,"join","sgd_instalacion.nro_mesa=sgd_centro.nro_centro(+) and sgd_centro.tip_centro (+) = 3 ")
This.SetItem(3,"campo_inc","nom_centro")
This.SetItem(3,"tipo","S")
This.Setitem(3,"habilitado","")

This.insertrow(0)
This.SetItem(4,"nombre","Tipo de Inst.")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
This.SetItem(4,"campo","descripcion as aa")
This.SetItem(4,"tabla","sgd_valor")
This.SetItem(4,"join","sgd_instalacion.tipo_instalacion = sgd_valor.codigo and sgd_valor.codif='T_IN'")
This.SetItem(4,"campo_inc","Descripcion")
This.SetItem(4,"tipo","S")
This.Setitem(4,"habilitado","")

This.insertrow(0)
This.SetItem(5,"nombre","Tensi$$HEX1$$f300$$ENDHEX$$n")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
This.SetItem(5,"campo","descripcion as bb")
This.SetItem(5,"tabla","sgd_valor")
This.SetItem(5,"join","sgd_instalacion.tension = sgd_valor.codigo and sgd_valor.codif='TENS'")
This.SetItem(5,"campo_inc","Descripcion")
This.SetItem(5,"tipo","S")
This.Setitem(5,"habilitado","")

This.insertrow(0)
This.SetItem(6,"nombre","Potencia Instalada")
This.SetItem(6,"campo","pot_instalada")
This.SetItem(6,"tabla","sgd_instalacion")
This.SetItem(6,"join","")
This.SetItem(6,"campo_inc","pot_instalada")
This.SetItem(6,"tipo","N")
This.Setitem(6,"habilitado","")

This.insertrow(0)
This.SetItem(7,"nombre","Potencia Contratada")
This.SetItem(7,"campo","pot_contratada")
This.SetItem(7,"tabla","sgd_instalacion")
This.SetItem(7,"join","")
This.SetItem(7,"campo_inc","pot_contratada")
This.SetItem(7,"tipo","N")
This.Setitem(7,"habilitado","")

This.insertrow(0)
This.SetItem(8,"nombre","KWH")
This.SetItem(8,"campo","KWH")
This.SetItem(8,"tabla","sgd_instalacion")
This.SetItem(8,"join","")
This.SetItem(8,"campo_inc","KWH")
This.SetItem(8,"tipo","N")
This.Setitem(8,"habilitado","")

This.insertrow(0)
This.SetItem(9,"nombre","Calle")
This.SetItem(9,"campo","nom_calle")
This.SetItem(9,"tabla","callejero")
This.SetItem(9,"join","sgd_instalacion.cod_calle=callejero.cod_Calle(+)")
This.SetItem(9,"campo_inc","cod_calle")
This.SetItem(9,"tipo","S")
This.Setitem(9,"habilitado","")

This.insertrow(0)
This.SetItem(10,"nombre","N$$HEX1$$fa00$$ENDHEX$$m. Puerta")
This.SetItem(10,"campo","num_puerta")
This.SetItem(10,"tabla","sgd_instalacion")
This.SetItem(10,"join","")
This.SetItem(10,"campo_inc","num_puerta")
This.SetItem(10,"tipo","N")
This.Setitem(10,"habilitado","")

This.insertrow(0)
This.SetItem(11,"nombre","Letra")
This.SetItem(11,"campo","duplicador")
This.SetItem(11,"tabla","sgd_instalacion")
This.SetItem(11,"join","")
This.SetItem(11,"campo_inc","duplicador")
This.SetItem(11,"tipo","S")
This.Setitem(11,"habilitado","")

This.insertrow(0)
This.SetItem(12,"nombre","Cant. de Clientes")
This.SetItem(12,"campo","cant_cli")
This.SetItem(12,"tabla","sgd_instalacion")
This.SetItem(12,"join","")
This.SetItem(12,"campo_inc","cant_cli")
This.SetItem(12,"tipo","N")
This.Setitem(12,"habilitado","")

This.insertrow(0)
This.SetItem(13,"nombre","Cant. Cli. Importantes")
This.SetItem(13,"campo","can_cli_imp")
This.SetItem(13,"tabla","sgd_instalacion")
This.SetItem(13,"join","")
This.SetItem(13,"campo_inc","can_cli_imp")
This.SetItem(13,"tipo","N")
This.Setitem(13,"habilitado","")

This.insertrow(0)
This.SetItem(14,"nombre","Km. Lin. A$$HEX1$$e900$$ENDHEX$$reas")
This.SetItem(14,"campo","km_laereas")
This.SetItem(14,"tabla","sgd_instalacion")
This.SetItem(14,"join","")
This.SetItem(14,"campo_inc","km_laereas")
This.SetItem(14,"tipo","N")
This.Setitem(14,"habilitado","")

This.insertrow(0)
This.SetItem(15,"nombre","Km. Lin. Subt.")
This.SetItem(15,"campo","km_lsubterraneas")
This.SetItem(15,"tabla","sgd_instalacion")
This.SetItem(15,"join","")
This.SetItem(15,"campo_inc","km_lsubterraneas")
This.SetItem(15,"tipo","N")
This.Setitem(15,"habilitado","")

This.insertrow(0)
This.SetItem(16,"nombre","Acometidas Alim.")
This.SetItem(16,"campo","CODIGO")
This.SetItem(16,"tabla","SGD_ACOMETIDA")
//This.SetItem(16,"join","sgd_instalacion.nro_instalacion=SGD_ACOMETIDA.INSTALACION_ORIGEN(+)")
This.SetItem &
(16,"join","sgd_instalacion.nro_instalacion=SGD_ACOMETIDA.INSTALACION_ORIGEN (+) ")
This.SetItem(16,"campo_inc","CODIGO")
This.SetItem(16,"tipo","N")
This.Setitem(16,"habilitado","")

This.insertrow(0)
This.SetItem(17,"nombre","Fecha de Alta")
This.SetItem(17,"campo","f_actual")
This.SetItem(17,"tabla","sgd_instalacion")
This.SetItem(17,"join","")
This.SetItem(17,"campo_inc","f_actual")
This.SetItem(17,"tipo","D")
This.Setitem(17,"habilitado","")
return 1
end function

public function integer fpr_lista_reenganche ();//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Integer li_a = 1



If Not fg_verifica_parametro(Parent.ClassName()) Then
//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
	This.insertrow(0)
	This.SetItem(1,"nombre","Reenganche")
	This.SetItem(1,"campo","nro_incidencia")
	This.SetItem(1,"tabla","sgd_reenganches")
	This.SetItem(1,"join","")
	This.SetItem(1,"campo_inc","nro_incidencia")
	This.SetItem(1,"tipo","N")
	This.Setitem(1,"habilitado","")
	This.Setitem(1,"sinonimo","")

	This.insertrow(0)
	This.SetItem(2,"nombre","Instalaci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(2,"campo","nom_instalacion")
	This.SetItem(2,"tabla","sgd_instalacion")
	//This.SetItem(1,"join","sgd_incidencia.nro_inst_afectada = sgd_instalacion.nro_instalacion")
	This.SetItem &
	(2,"join","sgd_reenganches.nro_inst_afectada = sgd_instalacion.nro_instalacion(+)" +&
	" and sgd_instalacion.bdi_job(+) = 0") //DBE 11/01/2000
	This.SetItem(2,"campo_inc","nro_inst_afectada")
	This.SetItem(2,"tipo","S")
	This.Setitem(2,"habilitado","")
	

	This.insertrow(0)
	This.SetItem(3,"nombre","Fecha Detecci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(3,"campo","f_deteccion")
	This.SetItem(3,"tabla","sgd_reenganches")
	This.SetItem(3,"join","")
	This.SetItem(3,"campo_inc","f_deteccion")
	This.SetItem(3,"tipo","D")
	This.Setitem(3,"habilitado","")
	
	This.insertrow(0)
	This.SetItem(4,"nombre","Fecha Resoluci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(4,"campo","fec_resolucion")
	This.SetItem(4,"tabla","sgd_reenganches")
	This.SetItem(4,"join","")
	This.SetItem(4,"campo_inc","fec_resolucion")
	This.SetItem(4,"tipo","D")
	This.Setitem(4,"habilitado","")
	
	
	This.insertrow(0)
	This.SetItem(5,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
	This.SetItem(5,"campo","nom_centro")
	This.SetItem(5,"tabla","sgd_centro")
	This.SetItem(5,"join","sgd_reenganches.nro_sector = sgd_centro.nro_centro and sgd_centro.tip_centro = 3")
	This.SetItem(5,"campo_inc","nro_mesa")
	This.SetItem(5,"tipo","S")
	This.Setitem(5,"habilitado","")
	
	
//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Else
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Reenganche")
	This.SetItem(li_a,"campo","nro_incidencia")
	This.SetItem(li_a,"tabla","sgd_reenganches")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","nro_incidencia")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Instalaci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","nom_instalacion")
	This.SetItem(li_a,"tabla","sgd_instalacion")
	//This.SetItem(li_a,"join","sgd_incidencia.nro_inst_afectada = sgd_instalacion.nro_instalacion")
	This.SetItem &
	(li_a,"join","sgd_reenganches.nro_inst_afectada = sgd_instalacion.nro_instalacion" +&
	" and sgd_instalacion.bdi_job = 0") //DBE 11/01/2000
	This.SetItem(li_a,"campo_inc","nro_inst_afectada")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Fecha Detecci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","f_deteccion")
	This.SetItem(li_a,"tabla","sgd_reenganches")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","f_deteccion")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Fecha Resoluci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","fec_resolucion")
	This.SetItem(li_a,"tabla","sgd_reenganches")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","fec_resolucion")
	This.SetItem(li_a,"tipo","D")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
		
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
	This.SetItem(li_a,"campo","nom_centro")
	This.SetItem(li_a,"tabla","sgd_centro")
	This.SetItem(li_a,"join","sgd_reenganches.nro_sector = sgd_centro.nro_centro")
	This.SetItem(li_a,"campo_inc","nro_sector")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
	
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Cantidad de Datos")
	This.SetItem(li_a,"campo","cantidad")
	This.SetItem(li_a,"tabla","")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","cantidad")
	This.SetItem(li_a,"tipo","N")
	This.Setitem(li_a,"habilitado","")
	This.Setitem(li_a,"sinonimo","")
End If
//***************************************
//**  OSGI 2001.1  	03/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

return 1
end function

public function integer fpr_lista_descargos ();Integer li_a = 1

This.insertrow(0)
This.SetItem(li_a,"nombre","Nro. descargo")
This.SetItem(li_a,"campo","nro_descargo")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_descargo")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","ID. descargo")
This.SetItem(li_a,"campo","nom_desc")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_desc")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

IF fg_verifica_parametro("descripcion descargos") THEN
	
	//REVISAR, HAY QUE VER QU$$HEX2$$c9002000$$ENDHEX$$HACEMOS CON LOS VALORES QUE TODAV$$HEX1$$cd00$$ENDHEX$$A NO SON NUM$$HEX1$$c900$$ENDHEX$$RICOS
	//SI NO DA FALLO $$HEX4$$a100a100a100a100$$ENDHEX$$INVALID NUMBER!!!!
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Descripci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","PL_fgnu_descripcion_desc(sgd_descargos.descripcion)")
	This.SetItem(li_a,"tabla","sgd_descargos")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","descripcion")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
ELSE
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Descripci$$HEX1$$f300$$ENDHEX$$n")
	This.SetItem(li_a,"campo","descripcion")
	This.SetItem(li_a,"tabla","sgd_descargos")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","descripcion")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
END IF

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Instalaci$$HEX1$$f300$$ENDHEX$$n afectada")
This.SetItem(li_a,"campo","nom_instalacion")
This.SetItem(li_a,"tabla","sgd_instalacion")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_instalacion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1

This.insertrow(0)
This.SetItem(li_a,"nombre","Solicitante")
This.SetItem(li_a,"campo","ID_solicitante")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","ID_solicitante")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha Solicitado")
This.SetItem(li_a,"campo","f_solicitado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_solicitado")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha Inicio Solicitado")
This.SetItem(li_a,"campo","f_ini_solicitado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_ini_solicitado")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha Fin Solicitado")
This.SetItem(li_a,"campo","f_fin_solicitado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_fin_solicitado")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha Aprobado")
This.SetItem(li_a,"campo","f_aprobado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_aprobado")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha Inicio Aprobado")
This.SetItem(li_a,"campo","f_ini_aprobado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_ini_aprobado")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha Fin Aprobado")
This.SetItem(li_a,"campo","f_fin_aprobado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_fin_aprobado")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Duraci$$HEX1$$f300$$ENDHEX$$n")
//AHM (15/02/2008)
//This.SetItem(li_a,"campo","PL_fgnu_duracion_str(sgd_descargos.f_ini_aprobado, sgd_descargos.f_fin_aprobado) as duracion")
This.SetItem(li_a,"campo","fgnu_duracion_str(sgd_descargos.f_ini_aprobado, sgd_descargos.f_fin_aprobado) as duracion")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","duracion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha Activado") 
This.SetItem(li_a,"campo","f_activado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_activado")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Estado")
This.SetItem(li_a,"campo","descripcion as bb")
This.SetItem(li_a,"tabla","sgd_valor")
This.SetItem(li_a,"join","sgd_valor.codigo= sgd_descargos.estado and sgd_valor.CODIF = 'ES_D'")
This.SetItem(li_a,"campo_inc","descripcion")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Ind. Interrupci$$HEX1$$f300$$ENDHEX$$n")
This.SetItem(li_a,"campo","ind_interrupcion")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","ind_interrupcion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")
	
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Act. BDI")
This.SetItem(li_a,"campo","ind_act_grafica")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","ind_act_grafica")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Obs. Solicitado")
This.SetItem(li_a,"campo","obs_solicitado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","obs_solicitado")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Obs. Aprobado")
This.SetItem(li_a,"campo","obs_aprobado")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","obs_aprobado")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Id. Aprobado")
This.SetItem(li_a,"campo","id_aprobacion")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","id_aprobacion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Trab. Tension")
This.SetItem(li_a,"campo","trab_tension")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","trab_tension")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nro. Incidencia")
This.SetItem(li_a,"campo","nro_incidencia")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_incidencia")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Brigada")
This.SetItem(li_a,"campo","brigada")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","brigada")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Inst. Descargar")
This.SetItem(li_a,"campo","inst_descargar")
This.SetItem(li_a,"tabla","sgd_descargos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","inst_descargar")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Causa")
This.SetItem(li_a,"campo","descripcion")
This.SetItem(li_a,"tabla","gi_causa")
This.SetItem(li_a,"join","sgd_descargos.cod_causa = gi_causa.cod_causa(+)")
This.SetItem(li_a,"campo_inc","cod_causa")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

IF fg_verifica_parametro('CAUSAS') THEN //CAMBIO SUR13 *JHE 01/02/2001*
	This.insertrow(0)
	This.SetItem(13,"nombre","Familia de Causa")
	This.SetItem(13,"campo","descripcion")
	This.SetItem(13,"tabla","gi_familia_causas")
	This.SetItem(13,"join", "(sgd_descargos.fam_causa = gi_familia_causas.gpo_causa (+))")
	This.SetItem(13,"campo_inc","fam_causa")
	This.SetItem(13,"tipo","S")
	This.Setitem(13,"habilitado","")
	This.Setitem(13,"sinonimo","")
		
	This.insertrow(0)
	This.SetItem(14,"nombre","Subtipo de Causa")
	This.SetItem(14,"campo","descripcion")
	This.SetItem(14,"tabla","gi_subtipo_causa")
	This.SetItem(14,"join","gi_subtipo_causa.tipo=gi_causa.tipo" + &
						 		  " and gi_subtipo_causa.subtipo=gi_causa.subtipo" + &
						 		  " and gi_subtipo_causa.gpo_causa=gi_causa.gpo_causa" + &
						 		  " and gi_causa.cod_causa=sgd_descargos.cod_causa")
	This.SetItem(14,"campo_inc","cod_causa")
	This.SetItem(14,"tipo","S")
	This.SetItem(14,"habilitado","")
	This.SetItem(14,"sinonimo","")
	
	This.insertrow(0)
	This.SetItem(15,"nombre","Tipo de Causa")
	This.SetItem(15,"campo","descripcion")
	This.SetItem(15,"tabla","gi_subtipos")
	This.SetItem(15,"join","gi_subtipos.tipo=gi_causa.tipo" + &
			 					  " and gi_subtipos.subtipo=gi_causa.subtipo" + &
						 		  " and gi_causa.cod_causa=sgd_descargos.cod_causa")
	This.SetItem(15,"campo_inc","cod_causa")
	This.SetItem(15,"tipo","S")
	This.SetItem(15,"habilitado","")
	This.SetItem(15,"sinonimo","")
		
END IF 

return 1
end function

public function integer fpr_lista_aviso_2 ();Integer li_a = 1

This.insertrow(0)
This.SetItem(li_a,"nombre","N.I.S.")
This.SetItem(li_a,"campo","nis_rad")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nis_rad")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

// GNU 17-4-2007. Mejora 1/343671
IF fg_verifica_parametro('NIC') THEN
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","N.I.C.")
	This.SetItem(li_a,"campo","nic")
	This.SetItem(li_a,"tabla","sumcon")
	This.SetItem(li_a,"join","sumcon.nis_rad(+)=gi_avisos.nis_rad")
	This.SetItem(li_a,"campo_inc","nic")
	This.SetItem(li_a,"tipo","S")
	This.SetItem(li_a,"habilitado","")
END IF
// FIN GNU

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nombre")
This.SetItem(li_a,"campo","nombre")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nombre")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Apellido (1)")
This.SetItem(li_a,"campo","ape1")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","ape1")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Apellido (2)")
This.SetItem(li_a,"campo","ape2")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","ape2")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Documento I.D.")
This.SetItem(li_a,"campo","Doc_id")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","Doc_id")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

//This.insertrow(0)
//This.SetItem(6,"nombre","Tipo de Doc.")
//This.SetItem(6,"campo","descripcion")
//This.SetItem(6,"tabla","sgd_valor")
//This.SetItem(6,"join","gi_avisos.tip_doc = sgd_valor.codigo and sgd_valor.codif = 'TIPO' ")
//This.SetItem(6,"campo_inc","tip_doc")
//This.SetItem(6,"tipo","S")
//This.Setitem(6,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Tipo de Doc.")
This.SetItem(li_a,"campo","tip_doc")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","tip_doc")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Telefono Cli.")
This.SetItem(li_a,"campo","tfno_cli")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","tfno_cli")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","$$HEX1$$c100$$ENDHEX$$mbito")
This.SetItem(li_a,"campo","nom_sector")
This.SetItem(li_a,"tabla","sgd_sector")
This.SetItem(li_a,"join","gi_avisos.nro_mesa=sgd_sector.cod_sector")
This.SetItem(li_a,"campo_inc","nom_sector")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Tipo de Aviso")
This.SetItem(li_a,"campo","descripcion")
This.SetItem(li_a,"tabla","gi_t_tip_aviso")
This.SetItem(li_a,"join","gi_avisos.tip_aviso = gi_t_tip_aviso.tip_aviso")
This.SetItem(li_a,"campo_inc","tip_aviso")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Alcance")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
This.SetItem(li_a,"campo","descripcion as aa")
This.SetItem(li_a,"tabla","sgd_valor")
This.SetItem(li_a,"join","gi_avisos.co_alcance = sgd_valor.codigo and sgd_valor.codif = 'ALC' ")
This.SetItem(li_a,"campo_inc","descripcion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha de Alta")
This.SetItem(li_a,"campo","f_alta")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","f_alta")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Estado del Aviso")
// GNU 20-09-2005 Incidencia 0/372611
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
//This.SetItem(12,"campo","descripcion as bb")
//This.SetItem(12,"tabla","sgd_valor")
//This.SetItem(12,"join","gi_avisos.est_aviso = sgd_valor.codigo and sgd_valor.codif='E_AV'")
This.SetItem(li_a,"campo","est_aviso")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
//Fin GNU
This.SetItem(li_a,"campo_inc","est_aviso")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Observaciones CMD") // GNU 17-4-2007. Mejora 1/485502
This.SetItem(li_a,"campo","obs_cmd")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","obs_cmd")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
// GNU 17-4-2007. Mejora 1/485502
This.insertrow(0)
This.SetItem(li_a,"nombre","Observaciones Telegestiones")
This.SetItem(li_a,"campo","obs_telegestiones")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","obs_telegestiones")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")
// FIN GNU

//\\// PM_U003 TIPOS VIAS AMR 13/06/2002 
// \/ Agregar tabla tipos para colocar el tipo de calle esto esta ligado al cambio en el
//    evento ue_armar_sql ventana w_reportes

//This.insertrow(0)
//This.SetItem(14,"nombre","Nom. Calle")
//This.SetItem(14,"campo","nom_calle")
//This.SetItem(14,"tabla","gi_avisos")
//This.SetItem(14,"join","")
//This.SetItem(14,"campo_inc","nom_calle")
//This.SetItem(14,"tipo","S")
//This.Setitem(14,"habilitado","")

IF gb_tipos_de_via THEN
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Nom. Calle")
	This.SetItem(li_a,"campo","desc_tipo ||' '|| gi_avisos.nom_calle AS nom_calle")
	This.SetItem(li_a,"tabla","tipos")
	This.SetItem(li_a,"join","(callejero.tip_via = tipos.tipo (+)) AND (gi_avisos.cod_calle = callejero.cod_calle (+))")
	This.SetItem(li_a,"campo_inc","nom_calle")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
	
ELSE
	li_a += 1
	This.insertrow(0)
	This.SetItem(li_a,"nombre","Nom. Calle")
	This.SetItem(li_a,"campo","nom_calle")
	This.SetItem(li_a,"tabla","gi_avisos")
	This.SetItem(li_a,"join","")
	This.SetItem(li_a,"campo_inc","nom_calle")
	This.SetItem(li_a,"tipo","S")
	This.Setitem(li_a,"habilitado","")
END IF	
	
// /\
////\\ PM_U003 TIPOS VIAS AMR 13/06//2002 
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Num. Puerta")
This.SetItem(li_a,"campo","num_puerta")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","num_puerta")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Duplicador")
This.SetItem(li_a,"campo","duplicador")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","duplicador")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Fecha de Resoluci$$HEX1$$f300$$ENDHEX$$n")
This.SetItem(li_a,"campo","fecha_res")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","fecha_res")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

//HLA.INI.DDAG-4995.01/03/2016
//li_a += 1
//This.insertrow(0)
//This.SetItem(li_a,"nombre","Codigo de Horario")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
//This.SetItem(li_a,"campo","descripcion as cc")
//This.SetItem(li_a,"tabla","sgd_valor")
//This.SetItem(li_a,"join","gi_avisos.cod_horario = sgd_valor.codigo and sgd_valor.codif='HORA'")
//This.SetItem(li_a,"campo_inc","descripcion")
//This.SetItem(li_a,"tipo","S")
//This.Setitem(li_a,"habilitado","")
//HLA.FIN.DDAG-4995.01/03/2016

li_a += 1
// GNU 1-12-2006. EPSA
This.insertrow(0)
This.SetItem(li_a,"nombre","Nro. Aviso")
// Modificado por LFE, para corregir un problema del SyntaxFromSQL de Power 8
This.SetItem(li_a,"campo","nro_aviso")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_aviso")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")
// FIN GNU

li_a += 1
// GNU 17-4-2007. Mejora 1/485502
This.insertrow(0)
This.SetItem(li_a,"nombre","Departamento")
This.SetItem(li_a,"campo","nom_depto")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_depto")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021   ** INI    ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Depto")
This.SetItem(li_a,"campo","cod_depto")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_depto")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Localidad")
This.SetItem(li_a,"campo","nom_loc")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_loc")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021   ** INI    ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Local")
This.SetItem(li_a,"campo","cod_loc")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_loc")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Municipio")
This.SetItem(li_a,"campo","nom_munic")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_munic")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** INI       ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Munic")
This.SetItem(li_a,"campo","cod_munic")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_munic")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

IF fg_verifica_parametro('GEO') and gi_pais= 4 THEN
	This.SetItem(li_a - 2,"nombre","Distrito")
	This.SetItem(li_a - 1,"nombre","Barrio")
	This.SetItem(li_a,"nombre","Corregimiento")
END IF

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Provincia")
This.SetItem(li_a,"campo","nom_prov")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nom_prov")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")
// FIN GNU

/*-------------------------------     TDA - MEJORA 01/2021 ** INI       ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","C$$HEX1$$f300$$ENDHEX$$digo Prov")
This.SetItem(li_a,"campo","cod_prov")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","cod_prov")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

/*-------------------------------     TDA - MEJORA 01/2021 ** FIN     ----------------------------------*/

// GNU 17-4-2007. Mejora 1/343671
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","OT")
This.SetItem(li_a,"campo","nro_ot")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_ot")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")

/*li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nro. Incidencia")
This.SetItem(li_a,"campo","nro_incidencia")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","nro_incidencia")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")*/
// FIN GNU

//AHM (24/11/2009) Mejora 1/668221
/*li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Sum. Asociados")
This.SetItem(li_a,"campo","(select count(*) from aco_sum where aco_sum.nis_rad = gi_avisos.nis_rad)")
This.SetItem(li_a,"tabla","")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","")
This.SetItem(li_a,"tipo","S")
This.SetItem(li_a,"habilitado","")*/

//LSH INI 08/09/2013 evolutivo DEO12-00000263
/*li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","F. Elim. del Peligro")
This.SetItem(li_a,"campo","f_elim_peligro")
This.SetItem(li_a,"tabla","sgd_incidencia")
This.SetItem(li_a,"join","sgd_incidencia.nro_incidencia = gi_avisos.nro_incidencia")
This.SetItem(li_a,"campo_inc","f_elim_peligro")
This.SetItem(li_a,"tipo","D")
This.Setitem(li_a,"habilitado","")*/

////3ra Etapa///////////////
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Clase de Aviso")
This.SetItem(li_a,"campo","descripcion")
This.SetItem(li_a,"tabla","sgd_valor")
This.SetItem(li_a,"join","sgd_valor.codigo=gi_avisos.clase_aviso and sgd_valor.codif='C_AV'")
This.SetItem(li_a,"campo_inc","descripcion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")
////////////////////////////

//HLA.INI.DDAG-4995.01/03/2016
//li_a += 1
//This.insertrow(0)
//This.SetItem(li_a,"nombre","F. Envio Brigada OT")
//This.SetItem(li_a,"campo","f_desde")
//This.SetItem(li_a,"tabla","gi_brigada_ot")
//This.SetItem(li_a,"join","sgd_incidencia.nro_incidencia = gi_avisos.nro_incidencia and sgd_incidencia.ot = gi_brigada_ot.nro_ot")
//This.SetItem(li_a,"campo_inc","f_desde")
//This.SetItem(li_a,"tipo","D")
//This.Setitem(li_a,"habilitado","")
//LSH FIN 08/09/2013 evolutivo DEO12-00000263
//HLA.FIN.DDAG-4995.01/03/2016


/*-------------------------------     TDA - MEJORA 09/2019       ----------------------------------*/

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Causa")
This.SetItem(li_a,"campo","descripcion")
This.SetItem(li_a,"tabla","causa")
This.SetItem(li_a,"join","causa.codigo (+) = gi_avisos.ot_causa")
This.SetItem(li_a,"campo_inc","descripcion")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")


li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Usuario")
This.SetItem(li_a,"campo","us_registro")
This.SetItem(li_a,"tabla","gi_avisos")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","us_registro")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nombre de Usuario")
This.SetItem(li_a,"campo","nombre")
This.SetItem(li_a,"tabla","usuario")
This.SetItem(li_a,"join","usuario.usuario (+) = gi_avisos.us_registro")
This.SetItem(li_a,"campo_inc","nombre")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Generaci$$HEX1$$f300$$ENDHEX$$n de Aviso")
This.SetItem(li_a,"campo","case when gi_avisos.US_REGISTRO IN (SELECT USR2.USUARIO FROM USUARIO USR2 WHERE PERMISOS LIKE 'OCM') then 'Oficina Comercial' else 'OT24' end generacion")
This.SetItem(li_a,"tabla","")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")
//nuevos campos de incidencia
li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Nro. Incidencia")
This.SetItem(li_a,"campo","nro_incidencia")
This.SetItem(li_a,"tabla","")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")

li_a += 1
This.insertrow(0)
This.SetItem(li_a,"nombre","Causa Incidencia")
This.SetItem(li_a,"campo","nom_causa")
This.SetItem(li_a,"tabla","")
This.SetItem(li_a,"join","")
This.SetItem(li_a,"campo_inc","")
This.SetItem(li_a,"tipo","S")
This.Setitem(li_a,"habilitado","")
return 1
end function

on u_lista_reporte.create
end on

on u_lista_reporte.destroy
end on


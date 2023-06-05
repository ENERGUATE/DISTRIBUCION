HA$PBExportHeader$w_2301_hist_form_incidencia.srw
$PBExportComments$Ventana que muestra el hist$$HEX1$$f300$$ENDHEX$$rico de una incidencia
forward
global type w_2301_hist_form_incidencia from w_2301_form_incidencia
end type
type dw_1 from u_hist_interrupcion within w_2301_hist_form_incidencia
end type
type cb_historicos from commandbutton within w_2301_hist_form_incidencia
end type
end forward

global type w_2301_hist_form_incidencia from w_2301_form_incidencia
dw_1 dw_1
cb_historicos cb_historicos
end type
global w_2301_hist_form_incidencia w_2301_hist_form_incidencia

type variables
Boolean ib_incidencia_en_historicos = False

boolean consulta_hecha_historicos=false // nos dira si ya hicimos alguna consulta

String is_select_inf_general = " "
String is_select_datos_ot = " "
String is_select_materiales = " "
String is_select_int_op = " "
String is_select_acometidas = " "
String is_select_datos_inte = " "
String is_select_acciones = " "
String is_select_afec_par = " "

String is_select_list_bri	= " "


end variables

forward prototypes
public subroutine fw_iniciar_dw_incidencia_rs (long pl_nro_incidencia)
public subroutine fw_buscar_incidencia_en_hist (long pl_nro_incidencia)
public subroutine fw_cambiar_ot_tipo (string mode)
public subroutine fw_cambiar_select_d_lista_brigadas_ot ()
public subroutine fw_cambiar_select_d_materiales ()
public subroutine fw_cambiar_select_dw_lista_int_operacion ()
public subroutine fw_cambiar_select_dw_lista_acometidas ()
public subroutine fw_cambiar_select_d_datos_interrup ()
public subroutine fw_cambiar_select_d_seg_operaciones ()
public subroutine fw_hist_evaluo_inc_calidad (integer pi_tipo_incidencia, boolean pb_ya_generada, integer pi_alcance)
public subroutine fw_cambiar_select_d_seg_mantenimiento ()
public subroutine fw_cambiar_select_d_lista_acciones ()
public subroutine fw_cambiar_select_dw_maniobras ()
public subroutine fw_union_select_dw_lista_int_operacion ()
public subroutine fw_union_select_dw_lista_acometidas ()
public subroutine fw_union_select_d_datos_interrup ()
public function integer fw_cambiar_select_dw_otros ()
public subroutine fw_union_select_d_lista_otras_inst_ant ()
public subroutine fw_cambiar_select_dw_afec_parcial_sum ()
public subroutine fw_cambiar_select_dw_datos_indisp ()
public subroutine fw_cambiar_select_dw_lista_indisp ()
public subroutine fw_cambiar_select_d_inf_general ()
public subroutine fw_cambiar_select_d_datos_ot ()
public subroutine fw_select_original ()
end prototypes

public subroutine fw_iniciar_dw_incidencia_rs (long pl_nro_incidencia);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_iniciar_dw_incidencia_rs
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia cambia las datawindows en el caso de que la incidencia que se
//				 desea consultar se encuentre en incidencias. Los cambios en las datawindows son
//				 necesarios debido a que las tablas que hay que consultar son distintas
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 19/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

IF ib_incidencia_en_historicos = TRUE THEN
	fw_cambiar_select_d_inf_general()
	fw_cambiar_select_d_datos_ot()
	fw_cambiar_select_d_materiales()
	fw_cambiar_select_dw_lista_int_operacion()
	fw_cambiar_select_dw_lista_acometidas()
	fw_cambiar_select_d_datos_interrup()
	//fw_cambiar_select_d_seg_operaciones() // se le llama desde fw_hist_evaluo_inc_calidad()
	fw_cambiar_select_d_lista_acciones()
	fw_cambiar_select_dw_maniobras()
	fw_cambiar_select_dw_otros()	
	fw_cambiar_select_dw_afec_parcial_sum()
	//lu_inc_rs.of_cambiar_select_d_lista_brigadas_ot(tab_1.tabpage_ot.d_lista_brigadas_ot)
ELSE
	fw_union_select_dw_lista_int_operacion()
	fw_union_select_dw_lista_acometidas()
	fw_union_select_d_datos_interrup()
	//fw_union_select_d_lista_otras_inst_ant() No se visualiza nunca
END IF
end subroutine

public subroutine fw_buscar_incidencia_en_hist (long pl_nro_incidencia);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_buscar_incidencia_en_hist
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que determina si una incidencia resuelta ha sido pasada a hist$$HEX1$$f300$$ENDHEX$$ricos.
//				 El resultado de esta funci$$HEX1$$f300$$ENDHEX$$n se carga en la variable de instancia 
//				 ib_incidencia_en_historicos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: pl_nro_incidencia -> nro de incidencia 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 19/01/2001	      LFE							Creaci$$HEX1$$f300$$ENDHEX$$n
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int li_hay_incidencia

SELECT COUNT(*)
INTO :li_hay_incidencia
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
		(EST_ACTUAL = :fgci_incidencia_resuelta OR
		 EST_ACTUAL = :fgci_estado_anulado);

IF SQLCA.SQLCode = 0 OR SQLCA.SQLCode = 100 THEN
	// La incidencia est$$HEX2$$e1002000$$ENDHEX$$en SGD_INCIDENCIA. Esto implica que sus datos no han pasado a los 
	// hist$$HEX1$$f300$$ENDHEX$$ricos.
	// Si la incidencia est$$HEX2$$e1002000$$ENDHEX$$en estado RS y en SGD_INCIDENCIA, $$HEX1$$fa00$$ENDHEX$$nicamente hay que cambiar
	// las datawindows que consultas SGD_INTERRUPCION, ya que tendr$$HEX1$$e100$$ENDHEX$$n que consultar 
	// SGD_INTERRUPCION y SGD_INTERRUPCION_RES
	IF li_hay_incidencia > 0 THEN
		ib_incidencia_en_historicos = False
		// 
	ELSE
		// La incidencia no est$$HEX2$$e1002000$$ENDHEX$$en SGD_INCIDENCIA. Se mira entonces si est$$HEX2$$e1002000$$ENDHEX$$en GI_HIST_INCIDENCIAS
		SELECT COUNT(*)
		INTO :li_hay_incidencia
		FROM GI_HIST_INCIDENCIAS
		WHERE NRO_INCIDENCIA = :pl_nro_incidencia AND
			(EST_ACTUAL = :fgci_incidencia_resuelta OR
			 EST_ACTUAL = :fgci_estado_anulado);
		
		IF SQLCA.SQLCode = 0  THEN 
			// La incidencia est$$HEX2$$e1002000$$ENDHEX$$en los hist$$HEX1$$f300$$ENDHEX$$ricos
			IF li_hay_incidencia > 0 THEN
				ib_incidencia_en_historicos = true
			END IF
		END IF
	END IF			
END IF


end subroutine

public subroutine fw_cambiar_ot_tipo (string mode);////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_cambiar_ot_tipo
//
// Objetivo: Cambiar el tabpage OT para utilizar las contratas or las brigadas
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
// 23/02/2000     DSA				Introducir las contratas
//	19/01/2001	   LFE				Adaptaci$$HEX1$$f300$$ENDHEX$$n de la funci$$HEX1$$f300$$ENDHEX$$n a la ventana de hist$$HEX1$$f300$$ENDHEX$$ricos
//
////////////////////////////////////////////////////////////////////////////////////////////////

if mode = 'CO' then
	tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2
	tab_1.tabpage_ot.bmp_brigada_responsable.Visible = FALSE
	tab_1.iw_contenedora.dw_brigadas_calendario_rango.DataObject = 'd_contratas_calendario_rango_fechas'
	dw_brigadas_calendario_rango.SetTransObject(SQLCA)
	tab_1.tabpage_ot.d_lista_brigadas_ot.dataobject = 'd_con_2002_pr_list_contratas_ot'
	tab_1.tabpage_ot.d_lista_brigadas_ot.SetTransObject(SQLCA)
//	tab_1.sqlcontratas = tab_1.tabpage_ot.dw_lista_contratas.GetSqlSelect()
	tab_1.tipo_ot = 'CO'
	tab_1.tabpage_ot.d_crit_seleccion.object.pi_tipo_brigada_t.Text = 'Tipo Cont:'
	tab_1.tabpage_ot.d_crit_seleccion.object.pi_brigadas_en_turno.CheckBox.Text = 'Contratas en turno'
	tab_1.tabpage_ot.tab_lista_brigadas.Hide()
	tab_1.tabpage_ot.dw_lista_contratas.Show()
	tab_1.tabpage_ot.rb_2.Checked = TRUE
else
	// DSA INI 29/03/2000	
	tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 1
	tab_1.tipo_ot = 'BR'
	tab_1.tabpage_ot.tab_lista_brigadas.Show()
	tab_1.tabpage_ot.dw_lista_contratas.Hide()
	dw_brigadas_calendario_rango.DataObject = 'd_brigadas_calendario_rango_fechas'
	dw_brigadas_calendario_rango.SetTransObject(SQLCA)
	tab_1.tabpage_ot.d_lista_brigadas_ot.dataobject = 'd_bri_2002_pr_list_brigadas_ot'
	tab_1.tabpage_ot.d_lista_brigadas_ot.SetTransObject(SQLCA)
	tab_1.tabpage_ot.d_crit_seleccion.object.pi_tipo_brigada_t.Text = 'Tipo Brig:'
	tab_1.tabpage_ot.d_crit_seleccion.object.pi_brigadas_en_turno.CheckBox.Text = 'Brigadas en turno'
	tab_1.tabpage_ot.rb_1.Checked = TRUE	
end if
end subroutine

public subroutine fw_cambiar_select_d_lista_brigadas_ot ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_lista_brigadas_ot
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_lista_brigadas_ot para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////


string ls_select, ls_estado

//IF tab_1.tabpage_ot.d_lista_brigadas_ot.dataobject = 'd_bri_2002_pr_list_brigadas_ot' THEN
	// La ot tiene asociadas brigadas 
	
	ls_Select = ' SELECT GI_HIST_BRIGADA_OT.H_DESDE,  ' + &
				'GI_HIST_BRIGADA_OT.F_DESDE,   ' + &
				'GI_HIST_BRIGADA_OT.F_HASTA,   ' + &
				'GI_HIST_BRIGADA_OT.H_HASTA,   ' + &
				'GI_HIST_BRIGADA_OT.NOMBRE,   ' + &
				'GI_HIST_BRIGADA_OT.MOVIL,   ' + &
				'GI_HIST_BRIGADA_OT.ID_REPONSABLE,   ' + &
				'0,   ' + &
				'GI_HIST_BRIGADA_OT.NRO_OT,   ' + &
				'GI_HIST_BRIGADA_OT.PROGRAMA,   ' + &
				'GI_HIST_BRIGADA_OT.H_ACTUAL,   ' + &
				'GI_HIST_BRIGADA_OT.F_ACTUAL,   ' + &
				'GI_HIST_BRIGADA_OT.USUARIO,   ' + &
				'GI_HIST_BRIGADA_OT.NRO_BRIGADA,  ' + &
				'GI_HIST_BRIGADA_OT.FREC_RADIO,  ' + &
				'GI_HIST_BRIGADA_OT.EST_BRIGADA, ' + &
				'0 TIP_BRIGADA, ' + &
				'~'Brig.~' TIPO,  ' +&
				'~'0~' TRABAJO_RESUELTO ' +&
		' FROM GI_HIST_BRIGADA_OT ' +&
		'WHERE ( GI_HIST_BRIGADA_OT.NRO_OT = :pi_nro_ot ) '   + &
	' UNION ALL ' +&
		'SELECT GI_HIST_CONTRATA_OT.F_DESDE,  ' +& 
				'GI_HIST_CONTRATA_OT.F_DESDE,   ' +&
				'GI_HIST_CONTRATA_OT.F_HASTA,   ' +&
				'GI_HIST_CONTRATA_OT.F_HASTA,   ' +&
				'GI_HIST_CONTRATA_OT.NOMBRE,   ' +&
				'~' ~',  ' +&
				'0,   ' +&
				'0,   ' +&
				'GI_HIST_CONTRATA_OT.NRO_OT,   ' +&
				'GI_HIST_CONTRATA_OT.PROGRAMA,   ' +&
				'GI_HIST_CONTRATA_OT.F_ACTUAL,   ' +&
				'GI_HIST_CONTRATA_OT.F_ACTUAL,   ' +&
				'GI_HIST_CONTRATA_OT.USUARIO,   ' +&
				'GI_HIST_CONTRATA_OT.NRO_CONTRATA,  ' +& 
				'~' ~',   ' +&
				'GI_HIST_CONTRATA_OT.EST_BRIGADA, ' +&
				'0 TIP_BRIGADA, ' + &
				'~'Cont.~' TIPO,  ' +&
				'~'0~' TRABAJO_RESUELTO ' +&
		 'FROM GI_HIST_CONTRATA_OT   ' +&
		'WHERE ( GI_HIST_CONTRATA_OT.NRO_OT = :pi_nro_ot )  '
	

//ELSE
//	// La ot tiene asociadas contratas
//	
//	ls_select = 'SELECT  GI_HIST_CONTRATA_OT.F_DESDE,   ' +&
//				'		GI_HIST_CONTRATA_OT.F_HASTA,     ' +&       
//				'		GI_HIST_CONTRATA_OT.NOMBRE,   ' +&
//				'		GI_HIST_CONTRATA_OT.TELEFONO,   ' +&
//				'		GI_HIST_CONTRATA_OT.PERS_CONTACTO,  ' +& 
//				'		GI_HIST_CONTRATA_OT.NRO_OT,   ' +&
//				'		GI_HIST_CONTRATA_OT.PROGRAMA,   ' +&
//				'		GI_HIST_CONTRATA_OT.F_ACTUAL,   ' +&
//				'		GI_HIST_CONTRATA_OT.USUARIO,   ' +&
//				'		GI_HIST_CONTRATA_OT.NRO_CONTRATA,  ' +& 
//				'		GI_HIST_CONTRATA_OT.EST_BRIGADA , ' +&
//				'		2 						ESTADO, ' +&
//				'		0						CANTIDAD_OT,' +&
//				'		0						CANTIDAD_TP,' +&
//				'		0						IND_RESPONSABLE,' +&
//				'		0						IND_DISPONIBLE			' +&
//				' FROM GI_HIST_CONTRATA_OT,   ' +&
//				' WHERE ( GI_HIST_CONTRATA_OT.NRO_OT = :PI_NRO_OT) ' 
//END IF				
//
tab_1.tabpage_ot.d_lista_brigadas_ot.Object.DataWindow.Table.Select = ls_select				

end subroutine

public subroutine fw_cambiar_select_d_materiales ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_materiales
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_materiales para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////


string ls_select, ls_estado

ls_Select = ' SELECT GI_HIST_MATERIALES.MATERIAL,   ' + &
         'GI_HIST_MATERIALES.CANTIDAD,   ' + &
         'GI_HIST_MATERIALES.NRO_INCIDENCIA,  ' + & 
         'GI_HIST_MATERIALES.USUARIO,   ' + &
         'GI_HIST_MATERIALES.F_ACTUAL,   ' + &
         'GI_HIST_MATERIALES.PROGRAMA,   ' + &
         'GI_HIST_MATERIALES.IND_OPER,   ' + &
         'GI_HIST_MATERIALES.DESCRIPCION,   ' + &
         'GI_HIST_MATERIALES.UNIDAD_MEDIDA ,' + &
			'1 TIPO_USUARIO ' + &
    'FROM GI_HIST_MATERIALES, ' + &  
    '     SGD_MATERIALES  ' + &
   'WHERE ( SGD_MATERIALES.COD_MATERIAL = GI_HIST_MATERIALES.MATERIAL ) and  ' + &
    '     ( GI_HIST_MATERIALES.NRO_INCIDENCIA = :pl_nro_incidencia )    '   


tab_1.tabpage_cuadrillas.d_materiales.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_dw_lista_int_operacion ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_dw_lista_int_operaciones
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow dw_lista_int_operaciones para que
//				 traiga los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado, ls_fechas


//AHM (13/07/2009) No se ven las interrupciones una vez que has sido procesadas
IF gi_tension_nivel_min < fgci_baja_tension  THEN
	
	ls_fechas = 'GI_HIST_INTERRUPCION.F_ALTA, ' + &
					'GI_HIST_INTERRUPCION.F_REPOSICION ' 
					
	
ELSE
	ls_fechas = 'TO_DATE(NULL) F_ALTA, ' + &
					'TO_DATE(NULL) F_REPOSICION ' 
					
	
END IF


	ls_Select = 'SELECT ' + &
			'DISTINCT(GI_HIST_INTERRUPCION.CODIGO_CT),  ' + &
		   'GI_HIST_INTERRUPCION.NOMBRE_CT, ' + &
		   'NVL(SUM(GI_HIST_INTERRUPCION.CCLI_AFEC),0) CANT_CLIENTES_AFECTADOS, ' + &
		   'NVL(GI_HIST_INTERRUPCION.CANT_CLIENTES_CT,0), ' + &
		   'NVL(GI_HIST_INTERRUPCION.POTENCIA_INSTALADA_CT,0), ' + &
		   'NVL(SUM(GI_HIST_INTERRUPCION.POT_INST_AFEC),0) POT_INST_AFEC,' + &
		   'NVL(GI_HIST_INTERRUPCION.POTENCIA_CONTRATADA_CT,0), ' + &
		   'NVL(SUM(GI_HIST_INTERRUPCION.POT_CONTR_AFEC),0) POT_CONTR_AFEC,' + &
			'GI_HIST_INTERRUPCION.NOMBRE_SALMT, ' + &
			'GI_HIST_INTERRUPCION.FASE_CT, ' +&
			ls_fechas +&
			', MAX(GI_HIST_INTERRUPCION.FASE_AFECTADA) DESCRIPCION ' +&
		'FROM GI_HIST_INTERRUPCION  ' + &
		'WHERE GI_HIST_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia ' + &
		'GROUP BY GI_HIST_INTERRUPCION.CODIGO_CT, ' + &
		'	   GI_HIST_INTERRUPCION.NOMBRE_CT, ' + &
		'	   GI_HIST_INTERRUPCION.CANT_CLIENTES_CT, ' + &
		'	   GI_HIST_INTERRUPCION.POTENCIA_INSTALADA_CT, ' + &
		'	   GI_HIST_INTERRUPCION.POTENCIA_CONTRATADA_CT, ' + &
		'		GI_HIST_INTERRUPCION.NOMBRE_SALMT, ' +&
		'	   GI_HIST_INTERRUPCION.FASE_CT,  ' +&
		ls_fechas    + &
		'UNION ALL' + &
		 ' SELECT ' + &
			'DISTINCT(sgd_interrupcion_rs.CODIGO_CT),  ' + &
		   'sgd_interrupcion_rs.NOMBRE_CT, ' + &
		   'NVL(SUM(sgd_interrupcion_rs.CCLI_AFEC),0) CANT_CLIENTES_AFECTADOS, ' + &
		   'NVL(sgd_interrupcion_rs.CANT_CLIENTES_CT,0), ' + &
		   'NVL(sgd_interrupcion_rs.POTENCIA_INSTALADA_CT,0), ' + &
		   'NVL(SUM(sgd_interrupcion_rs.POT_INST_AFEC),0) POT_INST_AFEC,' + &
		   'NVL(sgd_interrupcion_rs.POTENCIA_CONTRATADA_CT,0), ' + &
		   'NVL(SUM(sgd_interrupcion_rs.POT_CONTR_AFEC),0) POT_CONTR_AFEC,' + &
			'sgd_interrupcion_rs.NOMBRE_SALMT, ' + &
			'sgd_interrupcion_rs.FASE_CT, ' +&
			fg_remplaza(ls_fechas, 'GI_HIST_INTERRUPCION', 'sgd_interrupcion_rs') +&
			', MAX(SGD_INTERRUPCION_RS.FASE_AFECTADA) DESCRIPCION ' +&
		'FROM sgd_interrupcion_rs  ' + &
		'WHERE sgd_interrupcion_rs.NRO_INCIDENCIA = :pl_nro_incidencia ' + &
		'GROUP BY sgd_interrupcion_rs.CODIGO_CT, ' + &
		'	   sgd_interrupcion_rs.NOMBRE_CT, ' + &
		'	   sgd_interrupcion_rs.CANT_CLIENTES_CT, ' + &
		'	   sgd_interrupcion_rs.POTENCIA_INSTALADA_CT, ' + &
		'	   sgd_interrupcion_rs.POTENCIA_CONTRATADA_CT, ' + &
		'		sgd_interrupcion_rs.NOMBRE_SALMT, ' +&
		'	   sgd_interrupcion_rs.FASE_CT,  ' +&
			fg_remplaza(ls_fechas, 'GI_HIST_INTERRUPCION', 'sgd_interrupcion_rs')
		
		
	
	// Si operaciones da de alta CT's se agranda la datawindow que muestra los CT's
	IF gi_tension_nivel_min < fgci_baja_tension  THEN
		tab_1.tabpage_interrupciones.dw_lista_int_operaciones.height = 1535
		tab_1.tabpage_interrupciones.dw_lista_acometidas.visible = FALSE
	END IF
	

	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Object.DataWindow.Table.Select = ls_select
	


end subroutine

public subroutine fw_cambiar_select_dw_lista_acometidas ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_dw_lista_acometidas
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow dw_lista_acometidas para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////


string ls_select, ls_estado

ls_Select = 'SELECT DISTINCT(GI_HIST_INTERRUPCION.NRO_INSTALACION), ' + &
							'NVL(GI_HIST_INTERRUPCION.NOM_INSTALACION, GI_HIST_INTERRUPCION.NRO_INSTALACION) NOM_ACOMETIDA,' + &
							'GI_HIST_INTERRUPCION.DIR_INSTALACION, ' + &
							'GI_HIST_INTERRUPCION.FASE_INSTALACION ' +&
					'FROM GI_HIST_INTERRUPCION ' + &
					'WHERE GI_HIST_INTERRUPCION.CODIGO_CT = :pl_codigo_ct ' + &
						 ' AND GI_HIST_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia '


tab_1.tabpage_interrupciones.dw_lista_acometidas.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_d_datos_interrup ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_datos_interrup
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_datos_interrup para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 19/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

//string ls_select, ls_estado

string ls_select, ls_estado, ls_fechas

// GNU 30-6-2006. Incidencia 0/439862

IF gi_tension_nivel_min < fgci_baja_tension  THEN
	ls_fechas = 'GI_HIST_INTERRUPCION.F_ALTA, ' + &
					'GI_HIST_INTERRUPCION.F_REPOSICION ' 
ELSE
	ls_fechas = 'TO_DATE(NULL) F_ALTA, ' + &
					'TO_DATE(NULL) F_REPOSICION ' 
END IF
// FIN GNU

IF tab_1.tabpage_interrupciones.d_datos_interrup.dataobject='d_ins_datos_acometida_int' AND &
 (gi_tension_nivel_min >= fgci_baja_tension &
			OR tab_1.is_tipo_ventana <> 'w_2301_hist')  THEN 

  ls_select = 'SELECT A.VALOR,   ' + &
         'GI_HIST_INTERRUPCION.F_REPOSICION,    ' + &
		 	'GI_HIST_INTERRUPCION.F_REPOSICION_FASE_A, ' + &
		 	'GI_HIST_INTERRUPCION.F_REPOSICION_FASE_B, ' + &
		 	'GI_HIST_INTERRUPCION.F_REPOSICION_FASE_C, ' + &
       	'GI_HIST_INTERRUPCION.F_ALTA,    ' + &
		 	'GI_HIST_INTERRUPCION.F_ALTA_FASE_A, ' + &
		 	'GI_HIST_INTERRUPCION.F_ALTA_FASE_B, ' + &
		 	'GI_HIST_INTERRUPCION.F_ALTA_FASE_C,		  ' + &
         'NVL(GI_HIST_INTERRUPCION.CCLI_AFEC,0),  ' + &
			'NVL(GI_HIST_INTERRUPCION.CANT_CLI,0),   ' + &
         'NVL(GI_HIST_INTERRUPCION.POT_INST_AFEC,0),    ' + &
         'NVL(GI_HIST_INTERRUPCION.POT_CONTR_AFEC,0),  ' + &
			'NVL(GI_HIST_INTERRUPCION.POT_INSTALADA,0),    ' + &
         'NVL(GI_HIST_INTERRUPCION.POT_CONTRATADA,0),   ' + &
         'GI_HIST_INTERRUPCION.H_REPOSICION,    ' + &
         'GI_HIST_INTERRUPCION.NRO_INCIDENCIA,    ' + &
         'GI_HIST_INTERRUPCION.NRO_INSTALACION,    ' + &
         'GI_HIST_INTERRUPCION.TIEMPO_INTERRUPCION, ' + &
			'GI_HIST_INTERRUPCION.FASE_AFECTADA, ' + &
			'0 FASE_SELECCIONADA,  ' + &
			'GI_HIST_INTERRUPCION.AFEC_PARCIAL, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'0 As c_cant_cli_original ' + /*  OSGI 2001.1 29/05/2001  */ & 
    'FROM GI_HIST_INTERRUPCION,    ' + &
         'SGD_VALOR A ' + &
   'WHERE ( GI_HIST_INTERRUPCION.tipo_instalacion = A.codigo (+)) and   ' + &
         '( A.CODIF = ~'T_IN~') AND   ' + &
         '( GI_HIST_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incid ) AND ' + &
    		'( GI_HIST_INTERRUPCION.NRO_INSTALACION = :pl_nro_instalacion ) '
//	 		' ORDER BY GI_HIST_INTERRUPCION.CODIGO_CT, ' + &
//			'	   GI_HIST_INTERRUPCION.NOMBRE_CT'
	

ELSE

	 ls_select = 'SELECT A.VALOR,   ' + &
         'GI_HIST_INTERRUPCION.F_REPOSICION,   ' + &   
         'GI_HIST_INTERRUPCION.F_ALTA,      ' + &
         'NVL(GI_HIST_INTERRUPCION.POTENCIA_INSTALADA_CT,0),      ' + &
         'NVL(GI_HIST_INTERRUPCION.POTENCIA_CONTRATADA_CT,0),      ' + &
         'NVL(GI_HIST_INTERRUPCION.KWH,0),      ' + &
         'NVL(GI_HIST_INTERRUPCION.CCLI_AFEC,0),      ' + &
         'NVL(GI_HIST_INTERRUPCION.POT_INST_AFEC,0),      ' + &
         'NVL(GI_HIST_INTERRUPCION.POT_CONTR_AFEC,0),      ' + &
         'NVL(GI_HIST_INTERRUPCION.CANT_CLIENTES_CT,0),      ' + &
         'GI_HIST_INTERRUPCION.USUARIO,      ' + &
         'GI_HIST_INTERRUPCION.F_ACTUAL,      ' + &
         'GI_HIST_INTERRUPCION.H_ACTUAL,      ' + &
         'GI_HIST_INTERRUPCION.PROGRAMA,      ' + &
         'GI_HIST_INTERRUPCION.TIP_INTERRUPCION,      ' + &
         'GI_HIST_INTERRUPCION.IND_OTRAS_INS,      ' + &
         'GI_HIST_INTERRUPCION.H_REPOSICION,      ' + &
         'GI_HIST_INTERRUPCION.NRO_INCIDENCIA,      ' + &
         'GI_HIST_INTERRUPCION.IND_ULT_NIVEL,      ' + &
         'GI_HIST_INTERRUPCION.IND_FICTICIO,      ' + &
         'GI_HIST_INTERRUPCION.NRO_INSTALACION,      ' + &
         'GI_HIST_INTERRUPCION.NRO_PADRE,      ' + &
         'GI_HIST_INTERRUPCION.TIPO_INSTALACION,      ' + &
         'GI_HIST_INTERRUPCION.CO_NIVEL,      ' + &
         'GI_HIST_INTERRUPCION.TIPO_INSTALACION_PADRE,      ' + &
         'GI_HIST_INTERRUPCION.CO_NIVEL_PADRE,      ' + &
         'NVL(GI_HIST_INTERRUPCION.KWH_ESTIMADO,0),      ' + &
         'GI_HIST_INTERRUPCION.TIEMPO_INTERRUPCION,   ' + &
		 	'GI_HIST_INTERRUPCION.FASE_AFECTADA,   ' + &
			'GI_HIST_INTERRUPCION.F_ALTA_FASE_A,   ' + &
			'GI_HIST_INTERRUPCION.F_REPOSICION_FASE_A,   ' + &
			'GI_HIST_INTERRUPCION.F_ALTA_FASE_B,   ' + &
			'GI_HIST_INTERRUPCION.F_REPOSICION_FASE_B,   ' + &
			'GI_HIST_INTERRUPCION.F_ALTA_FASE_C,   ' + &
			'GI_HIST_INTERRUPCION.F_REPOSICION_FASE_C,   ' + &
			'0, ' + &
			'GI_HIST_INTERRUPCION.FASE_AFECTADA,   ' + &
		   '0 FASE_SELECCIONADA,  ' + &
			'GI_HIST_INTERRUPCION.AFEC_PARCIAL, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'0 As c_cant_cli_original, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'GI_HIST_INTERRUPCION.POT_INST_AFEC_CIU, ' + &
			'GI_HIST_INTERRUPCION.POT_INST_AFEC_RUR, ' + &
			'GI_HIST_INTERRUPCION.POT_INST_AFEC_URB, ' + &
			'GI_HIST_INTERRUPCION.CCLI_AFEC_CIU, ' + &
			'GI_HIST_INTERRUPCION.CCLI_AFEC_RUR, ' + &
			'GI_HIST_INTERRUPCION.CCLI_AFEC_URB, ' + &
			'GI_HIST_INTERRUPCION.POT_INTERRUMPIDA ' + &
    'FROM GI_HIST_INTERRUPCION,      ' + &
         'SGD_VALOR A   ' + &
   'WHERE ( GI_HIST_INTERRUPCION.tipo_instalacion = A.codigo (+)) and     ' + &
         '( A.CODIF = ~'T_IN~') AND     ' + &
         '( GI_HIST_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incid )  ' 
//			' ORDER BY GI_HIST_INTERRUPCION.CODIGO_CT, ' + &
//			'	   GI_HIST_INTERRUPCION.NOMBRE_CT'

END IF

//AHM (13/06/2009) No se ven las interrupciones una vez procesadas
ls_select = ls_select + ' UNION ALL ' + fg_remplaza(ls_select, "GI_HIST_INTERRUPCION", "SGD_INTERRUPCION_RS")

tab_1.tabpage_interrupciones.d_datos_interrup.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_d_seg_operaciones ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_seg_operaciones
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_seguimiento_operaciones para que
//				 traiga los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado

ls_Select = 'SELECT DISTINCT  SGD_VALOR.VALOR , ' +&
           'GI_HIST_ESTADO_OPER.H_ALTA ,' +&
           'GI_HIST_ESTADO_OPER.F_ALTA ,' +&
           'GI_HIST_ESTADO_OPER.OBSERVACION ,' +&
           'GI_HIST_ESTADO_OPER.COD_ESTADO ,' +&
           'GI_HIST_ESTADO_OPER.USUARIO ,' +&
           'GI_HIST_ESTADO_OPER.F_ACTUAL ,' +&
           'GI_HIST_ESTADO_OPER.H_ACTUAL ,' +&
           'GI_HIST_ESTADO_OPER.PROGRAMA ,' +&
           'GI_HIST_ESTADO_OPER.NRO_INCIDENCIA ,' +&
           'GI_HIST_ESTADO_OPER.IND_ENV_MANT     ' +&
        'FROM GI_HIST_ESTADO_OPER ,' +&
         '  SGD_VALOR     ' +&
        'WHERE ( GI_HIST_ESTADO_OPER.COD_ESTADO = SGD_VALOR.CODIGO ) and ' +&
		  '	( SGD_VALOR.CODIF = ~'E_OP~' ) and ' +&
        '   ( GI_HIST_ESTADO_OPER.NRO_INCIDENCIA = :pi_nro_incidencia ) and ' +&
        '  ( GI_HIST_ESTADO_OPER.COD_ESTADO <> 99 )  ' +&
        ' ORDER BY GI_HIST_ESTADO_OPER.COD_ESTADO          ASC  '

tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_hist_evaluo_inc_calidad (integer pi_tipo_incidencia, boolean pb_ya_generada, integer pi_alcance);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_hist_evaluo_inc_calidad
//
// Objetivo: Realiza las opciones de entrada dependiendo del tipo de incidencia que sea
//			   (Normal, Descargo) o bien (Calidad, Suministro, Descargo sin interrupci$$HEX1$$f300$$ENDHEX$$n) y teniendo en cuenta que
//               la incidencia ha sido abierta desde Gesti$$HEX1$$f300$$ENDHEX$$n de avisos o est$$HEX2$$e1002000$$ENDHEX$$siendo abierta o
//			   por el contrario est$$HEX2$$e1002000$$ENDHEX$$siendo generada desde Incidencias, la funci$$HEX1$$f300$$ENDHEX$$n se comportar$$HEX2$$e1002000$$ENDHEX$$de distinta
//			   manera. 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: pi_tipo_incidencia -> 0 = Normal
//												1 = Calidad, Suministro, Descargo sin interrupci$$HEX1$$f300$$ENDHEX$$n.
//					 pi_ind_suministro -> 1 = Incidencia de suministro
//												2 = Incidencia normal
//
//					 pb_ya_generada -> true, deshabilita el poder elegir
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------      ------------------       --------------
// 07/04/2000	    FDO
//	22/01/2001		 LFE								Adaptaci$$HEX1$$f300$$ENDHEX$$n a la ventana de hist$$HEX1$$f300$$ENDHEX$$ricos	
//		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string ls_est_op,ls_select,ls_rc,ls_mod_string, ls_filtro_estados
int li_valido

li_valido = tab_1.tabpage_formulario.d_inf_general.GetChild ( "estado_actual",ddch_estado )

li_valido = ddch_estado.settransobject(sqlca)

// Setea la dropdown del datawindows general de la incidencia y la variable del tab, siempre que la incidencia
// no sea de suministro

tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1]=pi_tipo_incidencia
tab_1.ii_tipo_incid = pi_tipo_incidencia

if pi_tipo_incidencia = fgci_incidencia_calidad  &
	or pi_alcance = fgci_incidencia_de_suministro &
	or pi_alcance = fgci_incidencia_sin_interrupcion &
	or pi_alcance = fgci_incidencia_reenganche then
	// La incidencia es de Calidad, Suministro, Imprevista, de Scada o Descargo sin interrupci$$HEX1$$f300$$ENDHEX$$n,
	// o un reenganche de Scada
	
	// Setea el seguimiento como incidencias de Calidad, Suministro, Descargo.
	tab_1.tabpage_seguimiento.chk_resolucion_mant.visible=false
	
	if pi_alcance <> fgci_incidencia_sin_interrupcion AND &
		NOT (pi_tipo_incidencia = fgci_incidencia_calidad AND pi_alcance = fgci_incidencia_de_instalacion) THEN
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible=FALSE	
	ELSE
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible=gb_mantenimiento &
			AND pi_tipo_incidencia <> fgci_incidencia_programada
	END IF
	
	tab_1.tabpage_seguimiento.d_estados_operaciones.visible=false
	tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible=false
	tab_1.tabpage_interrupciones.visible = false

	IF (pi_tipo_incidencia = fgci_incidencia_imprevista OR pi_tipo_incidencia = fgci_incidencia_scada) &
		AND pi_alcance = fgci_incidencia_sin_interrupcion &
		AND fw_incidencia_de_operaciones() then
		// Incidencia imprevista sin p$$HEX1$$e900$$ENDHEX$$rdida dada de alta desde operaciones
		// El tabpage de maniobras se hace visible
		tab_1.tabpage_maniobras.visible = TRUE
	ELSE
		tab_1.tabpage_maniobras.visible = FALSE
	END IF
	  
//	tab_1.tabpage_ot.d_crit_seleccion.enabled=false
//	tab_1.tabpage_ot.d_crit_seleccion.object.pi_tipo_brig.background.color=gs_gris
//	tab_1.tabpage_ot.d_crit_seleccion.object.pdt_fecha_turno.background.color=gs_gris
//	tab_1.tabpage_ot.d_crit_seleccion.object.pi_brigadas_en_turno.background.color=gs_gris
//	tab_1.tabpage_ot.tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.enabled=false
//	tab_1.tabpage_ot.tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.enabled=false
//	tab_1.tabpage_ot.dw_lista_contratas.enabled = false
	
	// Cambio el dataobject y posiciono la datawindows en la ventana
	if (pi_tipo_incidencia = fgci_incidencia_calidad AND pi_alcance = fgci_incidencia_de_suministro) &
		or pi_alcance = fgci_incidencia_de_suministro & 
		or pi_alcance = fgci_incidencia_reenganche &
		or pi_tipo_incidencia = fgci_incidencia_programada &
		or	gb_mantenimiento = False then 
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seg_sin_int'
	else
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seguimiento_operacion'
	end if
//	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.x=142
//	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.y=184
//	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.width=3410
//	tab_1.tabpage_seguimiento.d_seguimiento_operaciones.height=1248
	
else
	
	// Setea el seguimiento como incidencias normales
	tab_1.tabpage_interrupciones.visible = TRUE
	IF fw_incidencia_de_operaciones() THEN
		
		tab_1.tabpage_maniobras.visible = TRUE
	END IF
	IF pi_tipo_incidencia = fgci_incidencia_programada OR gb_mantenimiento = FALSE THEN 
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = FALSE
		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seg_sin_int'
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.x=142
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.y=184
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.width=3410
//		tab_1.tabpage_seguimiento.d_seguimiento_operaciones.height=1248
		
	ELSE
		tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = gb_mantenimiento
		//tab_1.tabpage_seguimiento.d_seguimiento_operaciones.dataobject='d_eop_2001_pr_list_seguimiento_operacion'
	END IF
	
end if

tab_1.tabpage_seguimiento.d_seguimiento_operaciones.settransobject(sqlca)

if pb_ya_generada then
	
	// Deshabilita la drop para elegir el tipo de incidencia

	tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.background.color=gs_gris
	tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.protect=1

end if
	
ls_est_op="'E_OP'"
li_valido = ddch_estado.retrieve('E_OP')
if pi_tipo_incidencia=fgci_incidencia_calidad OR pi_alcance = fgci_incidencia_sin_interrupcion then	
	ddch_estado.SetFilter("codigo <> " + string(fgci_incidencia_en_reposicion) )
	ddch_estado.Filter()
end if

if pi_tipo_incidencia = fgci_incidencia_calidad &
	or pi_alcance = fgci_incidencia_de_suministro &
	or pi_alcance = fgci_incidencia_sin_interrupcion &
	or pi_alcance = fgci_incidencia_reenganche then
	
	ls_filtro_estados = " AND SGD_VALOR.CODIF = 'E_OP' AND SGD_VALOR.CODIGO <> " + STRING(fgci_incidencia_en_reposicion) 
	
	IF (pi_tipo_incidencia <> fgci_incidencia_scada) THEN
		ls_filtro_estados =	ls_filtro_estados + " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_resuelta)
	ELSE // incidencia de scada sin interrupci$$HEX1$$f300$$ENDHEX$$n. Hay que comprobar si hay interfaz con mantenimiento
		IF gb_mantenimiento = TRUE AND pi_alcance <> fgci_incidencia_reenganche THEN
			ls_filtro_estados = ls_filtro_estados + " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_cerrada) + " AND SGD_VALOR.CODIF = 'E_OP' "
		ELSE
			ls_filtro_estados = ls_filtro_estados + " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_resuelta) + " AND SGD_VALOR.CODIF = 'E_OP' "
		END IF
	END IF
else
	if gb_mantenimiento = TRUE and pi_tipo_incidencia <> fgci_incidencia_programada then
		ls_filtro_estados = " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_cerrada) + " AND SGD_VALOR.CODIF = 'E_OP' "
	else
		ls_filtro_estados = " AND SGD_VALOR.CODIGO <= " + string(fgci_incidencia_resuelta) + " AND SGD_VALOR.CODIF = 'E_OP' "
	end if
end if

// Si la incidencia es programada, entonces no tendr$$HEX2$$e1002000$$ENDHEX$$estado pendiente
if pi_tipo_incidencia = fgci_incidencia_programada then
		ls_filtro_estados = ls_filtro_estados + "AND SGD_VALOR.CODIGO <> " + string(fgci_incidencia_pendiente) +  " "
end if	
//if gb_mantenimiento = true then
//	ls_select = " SELECT  SGD_VALOR.VALOR, SGD_VALOR.CODIGO " + &
//					" FROM SGD_VALOR " + &      
//					" WHERE SGD_VALOR.CODIGO <> 0 AND SGD_VALOR.CODIGO <> 99 AND SGD_VALOR.CODIGO < 8 AND SGD_VALOR.CODIF = " + ls_est_op + ls_filtro_estados + " " + &
//					" ORDER BY SGD_VALOR.CODIGO"  	
//
//else
//	
//	ls_select = " SELECT  SGD_VALOR.VALOR, SGD_VALOR.CODIGO " + &
//					" FROM SGD_VALOR " + &      
//					" WHERE SGD_VALOR.CODIGO <> 0 AND SGD_VALOR.CODIGO <> 99 " + ls_filtro_estados + " AND SGD_VALOR.CODIF = " + ls_est_op + " " + &
//					" ORDER BY SGD_VALOR.CODIGO"  	
//end if

ls_select = " SELECT  SGD_VALOR.VALOR, SGD_VALOR.CODIGO " + &
				" FROM SGD_VALOR " + &      
				" WHERE SGD_VALOR.CODIGO <> 0 AND SGD_VALOR.CODIGO <> 99 " + ls_filtro_estados + " " + &
				" ORDER BY SGD_VALOR.CODIGO"  	

ls_mod_string = "DataWindow.Table.Select=~" " + ls_select + "~""

ls_rc = tab_1.tabpage_seguimiento.d_estados_operaciones.Modify(ls_mod_string)

IF ls_rc <> "" THEN
	MessageBox("Status", "Modify Failed" + ls_rc)
END IF

iu_eop_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_operaciones,tab_1.ii_tipo_incid)
//tab_1.fnu_obte_estados_oper()

IF ib_incidencia_en_historicos = TRUE THEN
	fw_cambiar_select_d_seg_operaciones()
	fw_cambiar_select_d_seg_mantenimiento()
END IF
tab_1.fnu_obte_estados_oper()
//tab_1.tabpage_seguimiento.d_seguimiento_operaciones.SetSort('f_alta A, est_oper A')
//tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Sort()

//tab_1.tabpage_seguimiento.d_seguimiento_operaciones.Retrieve(tab_1.il_nro_incidencia)
IF gb_mantenimiento = TRUE THEN
	tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.Retrieve(tab_1.il_nro_incidencia)
END IF


end subroutine

public subroutine fw_cambiar_select_d_seg_mantenimiento ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_seg_mantenimiento
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_seguimiento_mantenimiento para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado

ls_Select = 'SELECT  GI_HIST_ESTADO_MANT.F_ALTA , ' +&
					  'GI_HIST_ESTADO_MANT.H_ALTA ,' +&
					  'SGD_VALOR.VALOR ,' +&
					  'SGD_VALOR.DESCRIPCION ,' +&
					  'GI_HIST_ESTADO_MANT.OBSERVACION ,' +&
					  'GI_HIST_ESTADO_MANT.COD_ESTADO ,' +&
					  'GI_HIST_ESTADO_MANT.USUARIO ,' +&
					  'GI_HIST_ESTADO_MANT.PROGRAMA ,' +&
					  'GI_HIST_ESTADO_MANT.H_ACTUAL ,' +&
					  'GI_HIST_ESTADO_MANT.F_ACTUAL ,' +&
					  'GI_HIST_ESTADO_MANT.NRO_INCIDENCIA ,' +&
					  'GI_HIST_ESTADO_MANT.IND_ENV_MANT     ' +&
				  'FROM GI_HIST_ESTADO_MANT ,' +&
					  'SGD_VALOR     ' +&
				  'WHERE ( GI_HIST_ESTADO_MANT.COD_ESTADO = SGD_VALOR.CODIGO ) and ' +&
						'( SGD_VALOR.CODIF = ~'E_MA~' ) and ' +&
					 '( GI_HIST_ESTADO_MANT.COD_ESTADO <> 99 ) and ' +&
					 '( GI_HIST_ESTADO_MANT.COD_ESTADO > 0 ) and ' +&
					 '( ( GI_HIST_ESTADO_MANT.NRO_INCIDENCIA = :pi_nro_incidencia ) )  ' +&
				  'ORDER BY GI_HIST_ESTADO_MANT.COD_ESTADO          ASC '

tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_d_lista_acciones ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_lista_acciones
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_lista_acciones para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////


string ls_select, ls_estado

ls_Select = ' SELECT  SGD_VALOR.DESCRIPCION , ' +&
					  'GI_HIST_ACCION_INC.NRO_INCIDENCIA ,' +&
					  'GI_HIST_ACCION_INC.PROGRAMA ,' +&
					  'GI_HIST_ACCION_INC.H_ACTUAL ,' +&
					  'GI_HIST_ACCION_INC.F_ACTUAL ,' +&
					  'GI_HIST_ACCION_INC.USUARIO ,' +&
					  'GI_HIST_ACCION_INC.COD_ACCION ,' +&
					  'GI_HIST_ACCION_INC.OBSERVACION ,' +&
					  'GI_HIST_ACCION_INC.F_ALTA ,' +&
					  'GI_HIST_ACCION_INC.TIP_ACCION  ' +&   
				 ' FROM SGD_VALOR ,' +&
					'  GI_HIST_ACCION_INC     ' +&
				  'WHERE ( GI_HIST_ACCION_INC.COD_ACCION = SGD_VALOR.CODIGO ) and ' +&
					'	( SGD_VALOR.CODIF = ~'ACC~' ) and ' +&
					' ( ( GI_HIST_ACCION_INC.NRO_INCIDENCIA = :pl_nro_incidencia ) ) ' +&
				  'ORDER BY GI_HIST_ACCION_INC.F_ALTA          DESC  '

tab_1.tabpage_acciones.d_lista_acciones_incidencia.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_dw_maniobras ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_dw_maniobras
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow dw_maniobras para que
//				 traiga los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado
//AHM
tab_1.tabpage_maniobras.dw_maniobras.DataObject = 'd_inc_2051_lista_maniobras_historico'

/*ls_select =  " SELECT  GI_HIST_MANIOBRA.COD_MANIOBRA, " + &
			 "  GI_HIST_MANIOBRA.TIPO_MANIOBRA, " + &   
		 "  GI_HIST_MANIOBRA.COD_ELEMENTO, " + &  
       "  GI_HIST_MANIOBRA.COD_INSTALACION,  " + &  
      "   GI_HIST_MANIOBRA.FECHA_MANIOBRA,   " + & 
       "  GI_HIST_MANIOBRA.ESTADO, " + &
			"NVL(SGD_INSTALACION.NOM_INSTALACION,GI_HIST_MANIOBRA.COD_INSTALACION) NOM_INSTALACION , " + &
			"Fgci_Nombre_BrigCont_Maniobra(GI_HIST_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT, " + &
			"A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO, " + &
	"SGD_FUSIB.MATRICULA " + &
   " FROM GI_HIST_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_FUSIB " + &
	"WHERE GI_HIST_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND " + &
			"SGD_INSTALACION.BDI_JOB (+) = 0 AND " + &
			"GI_HIST_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND " + &
			"A.CODIF (+) = 'T_IN' AND " + &
			"A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND " + &
			"B.CODIF (+) = 'FASE' AND " + &
			"B.VALOR (+) = GI_HIST_MANIOBRA.FASES AND " + &
			"C.CODIF (+) = 'T_MA' AND " + &
			"C.CODIGO (+) = GI_HIST_MANIOBRA.TIPO_MANIOBRA AND " + &
			"SGD_FUSIB.CODIGO= GI_HIST_MANIOBRA.COD_ELEMENTO  " + &
"UNION " + &
 "SELECT  GI_HIST_MANIOBRA.COD_MANIOBRA, " + &
			   "GI_HIST_MANIOBRA.TIPO_MANIOBRA,    " + &
		   "GI_HIST_MANIOBRA.COD_ELEMENTO,    " + &
         "GI_HIST_MANIOBRA.COD_INSTALACION,   " + & 
        " GI_HIST_MANIOBRA.FECHA_MANIOBRA,    " + &
         "GI_HIST_MANIOBRA.ESTADO, " + &
	"		NVL(SGD_INSTALACION.NOM_INSTALACION,GI_HIST_MANIOBRA.COD_INSTALACION) NOM_INSTALACION , " + &
		"	Fgci_Nombre_BrigCont_Maniobra(GI_HIST_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT, " + &
		"	A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO, " + &
"	SGD_INTERR.MATRICULA " + &
 "   FROM GI_HIST_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C,SGD_INTERR " + &
"	WHERE GI_HIST_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND " + &
"			SGD_INSTALACION.BDI_JOB (+) = 0 AND " + &
"			GI_HIST_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND " + &
"			A.CODIF (+) = 'T_IN' AND " + &
"			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND " + &
"			B.CODIF (+) = 'FASE' AND " + &
"			B.VALOR (+) = GI_HIST_MANIOBRA.FASES AND " + &
"			C.CODIF (+) = 'T_MA' AND " + &
"			C.CODIGO (+) = GI_HIST_MANIOBRA.TIPO_MANIOBRA AND " + &
"			SGD_INTERR.CODIGO= GI_HIST_MANIOBRA.COD_ELEMENTO  " + &
"UNION " + &
" SELECT  GI_HIST_MANIOBRA.COD_MANIOBRA, " + &
"			   GI_HIST_MANIOBRA.TIPO_MANIOBRA,    " + &
"		   GI_HIST_MANIOBRA.COD_ELEMENTO,    " + &
 "        GI_HIST_MANIOBRA.COD_INSTALACION,    " + &
  "       GI_HIST_MANIOBRA.FECHA_MANIOBRA,    " + &
   "      GI_HIST_MANIOBRA.ESTADO, " + &
"			NVL(SGD_INSTALACION.NOM_INSTALACION,GI_HIST_MANIOBRA.COD_INSTALACION) NOM_INSTALACION , " + &
"			Fgci_Nombre_BrigCont_Maniobra(GI_HIST_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT, " + &
"			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO, " + &
"	SGD_SECCI.MATRICULA " + &
"    FROM GI_HIST_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C,SGD_SECCI " + &
"	WHERE GI_HIST_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND " + &
"			SGD_INSTALACION.BDI_JOB (+) = 0 AND " + &
"			GI_HIST_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND " + &
"			A.CODIF (+) = 'T_IN' AND " + &
"			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND " + &
"			B.CODIF (+) = 'FASE' AND " + &
"			B.VALOR (+) = GI_HIST_MANIOBRA.FASES AND " + &
"			C.CODIF (+) = 'T_MA' AND " + &
"			C.CODIGO (+) = GI_HIST_MANIOBRA.TIPO_MANIOBRA AND " + &
"			SGD_SECCI.CODIGO= GI_HIST_MANIOBRA.COD_ELEMENTO  " + &
"UNION ALL " + &
"SELECT  0,0, " + &
"		 CLASS_MEMB,  " + &
"		 CLASS_MEMB, " + &
"		 FECHA_ALTA, " + &
"		 4, " + &
"		 TEXTO, " + &
"		 '', " + &
"		 '', " + &
"		 '', " + &
"		 'Alta Inst. Temp', " + &
"		'' " + &
"FROM OOP_ELTOS_TMP_HIST " + &
"where cod_inc_alta = :pl_nro_incidencia " + &
"UNION ALL " + &
"SELECT  0,0, " + &
"		 CLASS_MEMB,  " + &
"		 CLASS_MEMB, " + &
"		 FECHA_BAJA, " + &
"		 3, " + &
"		 TEXTO, " + &
"		 '', " + &
"		 '', " + &
"		 '', " + &
"		 'Baja Inst. Temp', " + &
"		'' " + &
"FROM OOP_ELTOS_TMP_HIST " + &
"where cod_inc_baja = :pl_nro_incidencia " + &
"UNION ALL " + &
"SELECT  GI_HIST_MANIOBRA.COD_MANIOBRA,  " + &
"			   GI_HIST_MANIOBRA.TIPO_MANIOBRA,  " + &
"		   GI_HIST_MANIOBRA.COD_ELEMENTO,  " + &
"        GI_HIST_MANIOBRA.COD_INSTALACION,  " + &
"         GI_HIST_MANIOBRA.FECHA_MANIOBRA,  " + &
"         GI_HIST_MANIOBRA.ESTADO,  " + &
"			NVL(SGD_INSTALACION.NOM_INSTALACION,GI_HIST_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  " + &
"			Fgci_Nombre_BrigCont_Maniobra(GI_HIST_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  " + &
"			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  " + &
"	NVL(SGD_TRAMO.MATRICULA,SGD_TRAMO.COD_DOC)  " + &
 "   FROM GI_HIST_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_TRAMO  " + &
"	WHERE GI_HIST_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  " + &
"			SGD_INSTALACION.BDI_JOB (+) = 0 AND  " + &
"			GI_HIST_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND  " + &
"			A.CODIF (+) = 'T_IN' AND  " + &
"			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  " + &
"			B.CODIF (+) = 'FASE' AND  " + &
"			B.VALOR (+) = GI_HIST_MANIOBRA.FASES AND  " + &
"			C.CODIF (+) = 'T_MA' AND  " + &
"			C.CODIGO (+) = GI_HIST_MANIOBRA.TIPO_MANIOBRA AND  " + &
"			SGD_TRAMO.CODIGO= GI_HIST_MANIOBRA.COD_ELEMENTO " + &
" UNION ALL " + &
"SELECT  GI_HIST_MANIOBRA.COD_MANIOBRA,  " + &
"			   GI_HIST_MANIOBRA.TIPO_MANIOBRA,  " + &
"		   GI_HIST_MANIOBRA.COD_ELEMENTO,  " + &
"         GI_HIST_MANIOBRA.COD_INSTALACION,  " + &
"         GI_HIST_MANIOBRA.FECHA_MANIOBRA,  " + &
"         GI_HIST_MANIOBRA.ESTADO,  " + &
"			NVL(SGD_INSTALACION.NOM_INSTALACION,GI_HIST_MANIOBRA.COD_INSTALACION) NOM_INSTALACION ,  " + &
"			Fgci_Nombre_BrigCont_Maniobra(GI_HIST_MANIOBRA.COD_MANIOBRA) NOM_BRIG_CONT,  " + &
"			A.DESCRIPCION,B.DESCRIPCION FASE,C.DESCRIPCION TIPO,  " + &
"	SGD_DISYUN.MATRICULA " + &
 "   FROM GI_HIST_MANIOBRA,SGD_INSTALACION, SGD_VALOR A, SGD_VALOR B, SGD_VALOR C, SGD_DISYUN  " + &
"	WHERE GI_HIST_MANIOBRA.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION (+) AND  " + &
"			SGD_INSTALACION.BDI_JOB (+) = 0 AND  " + &
"			GI_HIST_MANIOBRA.NRO_INCIDENCIA = :PL_NRO_INCIDENCIA  AND  " + &
"			A.CODIF (+) = 'T_IN' AND  " + &
"			A.CODIGO (+) = SGD_INSTALACION.TIPO_INSTALACION AND  " + &
"			B.CODIF (+) = 'FASE' AND  " + &
"			B.VALOR (+) = GI_HIST_MANIOBRA.FASES AND  " + &
"			C.CODIF (+) = 'T_MA' AND  " + &
"			C.CODIGO (+) = GI_HIST_MANIOBRA.TIPO_MANIOBRA AND  " + &
"			SGD_DISYUN.CODIGO= GI_HIST_MANIOBRA.COD_ELEMENTO " 


tab_1.tabpage_maniobras.dw_maniobras.Object.DataWindow.Table.Select = ls_select*/

end subroutine

public subroutine fw_union_select_dw_lista_int_operacion ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_union_select_d_lista_int_operacion
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow dw_lista_int_operaciones para que
//				 traiga los datos de la tabla temporal de interrupciones y de la tabla normal
//				 de interrupciones
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado

//IF tab_1.tabpage_interrupciones.d_datos_interrup.DataObject = 'd_ins_datos_acometidas_int' THEN
	// Si operaciones da de alta CT's se agranda la datawindow que muestra los CT's
	IF gi_tension_nivel_min < fgci_baja_tension  THEN
		
		tab_1.tabpage_interrupciones.dw_lista_int_operaciones.height = 1535
		tab_1.tabpage_interrupciones.dw_lista_acometidas.visible = FALSE
		
		// Como operaciones ha dado de alta CT's, no se puede tirar de la vista INTERUPCION_RS,
		// ya que $$HEX1$$e900$$ENDHEX$$sta vista es v$$HEX1$$e100$$ENDHEX$$lida para cuando operaciones vuelca acometidas.
		// Con la siguiente select se traen los datos de los CT's interrumpidos
		//		ls_select = 'SELECT DISTINCT(SGD_INSTALACION.NRO_INSTALACION),  ' +&
//						'			SGD_INSTALACION.NOM_INSTALACION,  ' +&
//						'			COUNT(ACO_SUM.NIS_RAD), ' +&
//						'			NVL(SGD_INSTALACION.CANT_CLI,0),  ' +&
//						'			NVL(SGD_INSTALACION.POT_INSTALADA,0), ' +&
//						'			NVL(SUM(ACO_SUM.POT_CONTRATADA),0),  ' +&
//						'			NVL(SGD_INSTALACION.POT_CONTRATADA,0), ' +&
//						'			NVL(SUM(ACO_SUM.POT_CONTRATADA),0), ' +&
//						'			SGD_INTERRUPCION.NOMBRE_SALMT,  ' +&
//						'        MAX(NVL(FGCI_FASE_INSTALACION(SGD_INSTALACION.TIPO_CONEXION), ~'No determinada~')), ' +&
//						'			SGD_INTERRUPCION.F_ALTA,  ' +&
//						'			SGD_INTERRUPCION.F_REPOSICION  ' +&
//						'FROM SGD_INTERRUPCION, SGD_INSTALACION, SGD_ACOMETIDA,ACO_SUM, SGD_SALBT   ' +&
//						'WHERE SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia  ' +&
//						'  AND SGD_INTERRUPCION.NRO_INSTALACION = SGD_INSTALACION.NRO_INSTALACION  ' +&
//						'  AND SGD_INSTALACION.BDI_JOB = 0 ' +&
//						'  AND SGD_SALBT.INSTALACION_ORIGEN (+) = SGD_INSTALACION.NRO_INSTALACION ' +&
//						'  AND SGD_SALBT.BDI_JOB (+) =0 ' +&
//						'  AND SGD_ACOMETIDA.INSTALACION_ORIGEN (+) = SGD_SALBT.CODIGO ' +&
//						'  AND SGD_ACOMETIDA.BDI_JOB (+) = 0 ' +&
//						'  AND ACO_SUM.NRO_ACOMETIDA (+) = SGD_ACOMETIDA.CODIGO ' +&
//						'  AND FGNU_FASE_AFECTADA(NVL(SGD_ACOMETIDA.TIPO_CONEXION,0), NVL(SGD_INTERRUPCION.FASE_AFECTADA,~'111~'))=1 ' +&
//						'GROUP BY ' +&
//						'		SGD_INSTALACION.NRO_INSTALACION,   ' +&
//						'		SGD_INSTALACION.NOM_INSTALACION,  ' +&
//						'		SGD_INSTALACION.CANT_CLI,  ' +&
//						'		SGD_INSTALACION.POT_INSTALADA, ' +&
//						'		SGD_INSTALACION.POT_CONTRATADA, ' +&
//						'		SGD_INTERRUPCION.NOMBRE_SALMT,  ' +&
//						'		SGD_INTERRUPCION.F_ALTA,  ' +&
//						'		SGD_INTERRUPCION.F_REPOSICION  ' +&
//					'UNION  ALL  ' +&
//					'	SELECT	DISTINCT(SGD_INTERRUPCION_RS.CODIGO_CT),  ' +&
//					'		SGD_INTERRUPCION_RS.NOMBRE_CT,  ' +&
//					'		NVL(SGD_INTERRUPCION_RS.CCLI_AFEC,0), ' +&
//					'		NVL(SGD_INTERRUPCION_RS.CANT_CLIENTES_CT,0),  ' +&
//					'		NVL(SGD_INTERRUPCION_RS.POTENCIA_INSTALADA_CT,0), ' +& 
//					'		NVL(SGD_INTERRUPCION_RS.POT_INST_AFEC,0),  ' +&
//					'		NVL(SGD_INTERRUPCION_RS.POTENCIA_CONTRATADA_CT,0),  ' +&
//					'		NVL(SGD_INTERRUPCION_RS.POT_CONTR_AFEC,0),  ' +&
//					'		SGD_INTERRUPCION_RS.NOMBRE_SALMT,  ' +&
//					'		SGD_INTERRUPCION_RS.FASE_CT FASE,  ' +&
//					'		SGD_INTERRUPCION_RS.F_ALTA,  ' +&
//					'		SGD_INTERRUPCION_RS.F_REPOSICION  ' +&
//					'	FROM SGD_INTERRUPCION_RS ' +&
//					'  WHERE SGD_INTERRUPCION_RS.NRO_INCIDENCIA = :pl_nro_incidencia  '




//AHM
		/*ls_select = ' SELECT DISTINCT(SGD_INSTALACION.NRO_INSTALACION),  ' +&
						'			SGD_INSTALACION.NOM_INSTALACION,  ' +&
						'			NVL(SGD_INTERRUPCION.CCLI_AFEC, 0), ' +&
						'			NVL(SGD_INSTALACION.CANT_CLI,0),  ' +&
						'			NVL(SGD_INSTALACION.POT_INSTALADA,0), ' +&
						'			NVL(SGD_INTERRUPCION.POT_INST_AFEC,0),  ' +&
						'			NVL(SGD_INSTALACION.POT_CONTRATADA,0), ' +&
						'			NVL(SGD_INTERRUPCION.POT_CONTR_AFEC,0), ' +&
						'			SGD_INTERRUPCION.NOMBRE_SALMT,  ' +&
						'        NVL(FGCI_FASE_INSTALACION(SGD_INSTALACION.TIPO_CONEXION), ~'No determinada~'), ' +&
						'			SGD_INTERRUPCION.F_ALTA,  ' +&
						'			SGD_INTERRUPCION.F_REPOSICION  ' +&
						'FROM SGD_INTERRUPCION, SGD_INSTALACION   ' +&
						'WHERE SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia  ' +&
						'  AND SGD_INTERRUPCION.NRO_INSTALACION = SGD_INSTALACION.NRO_INSTALACION  ' +&
						'  AND SGD_INSTALACION.BDI_JOB = 0 ' + &
						'UNION  ALL  ' +&
					'	SELECT	DISTINCT(SGD_INTERRUPCION_RS.CODIGO_CT),  ' +&
					'		SGD_INTERRUPCION_RS.NOMBRE_CT,  ' +&
					'		NVL(SGD_INTERRUPCION_RS.CCLI_AFEC,0), ' +&
					'		NVL(SGD_INTERRUPCION_RS.CANT_CLIENTES_CT,0),  ' +&
					'		NVL(SGD_INTERRUPCION_RS.POTENCIA_INSTALADA_CT,0), ' +& 
					'		NVL(SGD_INTERRUPCION_RS.POT_INST_AFEC,0),  ' +&
					'		NVL(SGD_INTERRUPCION_RS.POTENCIA_CONTRATADA_CT,0),  ' +&
					'		NVL(SGD_INTERRUPCION_RS.POT_CONTR_AFEC,0),  ' +&
					'		SGD_INTERRUPCION_RS.NOMBRE_SALMT,  ' +&
					'		SGD_INTERRUPCION_RS.FASE_CT FASE,  ' +&
					'		SGD_INTERRUPCION_RS.F_ALTA,  ' +&
					'		SGD_INTERRUPCION_RS.F_REPOSICION  ' +&
					'	FROM SGD_INTERRUPCION_RS ' +&
					'  WHERE SGD_INTERRUPCION_RS.NRO_INCIDENCIA = :pl_nro_incidencia  '*/
	
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.DataObject = 'd_lista_interrupciones_operacion_rs'
	ELSE
		// Operaciones ha interrumpido acometidas. Se obtienen los datos de los CT's afectados
		// a trav$$HEX1$$e900$$ENDHEX$$s de la siguiente select
		ls_Select = ' SELECT ' + &
							'INTERRUPCION_RS.CODIGO_CT,  ' + &
							'INTERRUPCION_RS.NOMBRE_CT, ' + &
							'SUM(INTERRUPCION_RS.CCLI_AFEC) CANT_CLIENTES_AFECTADOS, ' + &
							'NVL(INTERRUPCION_RS.CANT_CLIENTES_CT,0) CANT_CLIENTES,' + &
							'NVL(INTERRUPCION_RS.POTENCIA_INSTALADA_CT,0) POTENCIA_INSTALADA_CT,' + &
							'SUM(INTERRUPCION_RS.POT_INST_AFEC) POT_INST_AFEC,' + &
							'NVL(INTERRUPCION_RS.POTENCIA_CONTRATADA_CT,0) POTENCIA_CONTRATADA_CT, ' + &
							'SUM(INTERRUPCION_RS.POT_CONTR_AFEC) POT_CONTR_AFEC,' + &
							'INTERRUPCION_RS.NOMBRE_SALMT, ' + &
							'INTERRUPCION_RS.FASE, ' +&
							'TO_DATE(NULL) F_ALTA, ' + &
							'TO_DATE(NULL) F_REPOSICION, ' + &
						'FROM INTERRUPCION_RS ' + &
						'WHERE INTERRUPCION_RS.NRO_INCIDENCIA = :pl_nro_incidencia ' + &
						'GROUP BY INTERRUPCION_RS.CODIGO_CT, ' + &
						'	   INTERRUPCION_RS.NOMBRE_CT, ' + &
						'	   INTERRUPCION_RS.CANT_CLIENTES_CT, ' + &
						'	   INTERRUPCION_RS.POTENCIA_INSTALADA_CT, ' + &
						'	   INTERRUPCION_RS.POTENCIA_CONTRATADA_CT, ' + &
						'		INTERRUPCION_RS.NOMBRE_SALMT, ' +&
						'		INTERRUPCION_RS.FASE '
	
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Object.DataWindow.Table.Select = ls_select
	
	END IF
	
/*	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Object.DataWindow.Table.Select = ls_select*/
//END IF

end subroutine

public subroutine fw_union_select_dw_lista_acometidas ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_union_select_dw_lista_acometidas
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow dw_lista_acometidas para que
//				 traiga los datos de la tabla temporal de interrupciones y de la tabla normal
//				 de interrupciones
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////
string ls_select, ls_estado

ls_Select = 'SELECT DISTINCT(SGD_ACOMETIDA.CODIGO) CODIGO,' +&
				'		NVL(SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.CODIGO) NOM_ACOMETIDA,' +&
				'		fgnu_calle_referencia(callejero.nom_calle, SGD_ACOMETIDA.num_puerta, SGD_ACOMETIDA.duplicador, SGD_ACOMETIDA.nif, SGD_ACOMETIDA.cod_calle, 0, ~'~', 0, ~'~') CDIRECCION, ' +&
				'     NVL(FGCI_FASE_INSTALACION(SGD_ACOMETIDA.TIPO_CONEXION), ~'No determinada~') ' +&
				'FROM SGD_ACOMETIDA,' +&
				'	 SGD_SALBT,' +&
				'	 SGD_INTERRUPCION,' +&
				'	 CALLEJERO ' +&
				'WHERE SGD_SALBT.INSTALACION_ORIGEN = :pl_codigo_ct ' +&
				'	  AND SGD_SALBT.BDI_JOB = 0 ' +&
				'	  AND SGD_SALBT.CODIGO = SGD_INTERRUPCION.CABECERA_BT ' +&
				'	  AND SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incidencia ' +&
				'	  AND SGD_INTERRUPCION.NRO_INSTALACION = SGD_ACOMETIDA.CODIGO ' +&
				'	  AND SGD_ACOMETIDA.BDI_JOB = 0 ' +&
				'	  AND	SGD_ACOMETIDA.COD_CALLE = CALLEJERO.COD_CALLE ' +&
		'UNION ' +&
				'SELECT DISTINCT(SGD_INTERRUPCION_RS.NRO_INSTALACION) CODIGO, ' +&
						'NVL(SGD_INTERRUPCION_RS.NOM_INSTALACION, SGD_INTERRUPCION_RS.NRO_INSTALACION) NOM_ACOMETIDA,' +&
						'SGD_INTERRUPCION_RS.DIR_INSTALACION CDIRECCION, ' +&
						'NVL(SGD_INTERRUPCION_RS.FASE_INSTALACION, ~'No determinada~') ' +&
				'FROM SGD_INTERRUPCION_RS ' +&
				'WHERE SGD_INTERRUPCION_RS.CODIGO_CT = :pl_codigo_ct ' +&
					 ' AND SGD_INTERRUPCION_RS.NRO_INCIDENCIA = :pl_nro_incidencia '

tab_1.tabpage_interrupciones.dw_lista_acometidas.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_union_select_d_datos_interrup ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_union_select_d_datos_interrup
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_datos_interrup para que
//				 traiga los datos de la tabla temporal de interrupciones y de la tabla normal
//				 de interrupciones
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado

IF tab_1.tabpage_interrupciones.d_datos_interrup.dataobject='d_ins_datos_acometida_int' AND &
   (gi_tension_nivel_min >= fgci_baja_tension &
			OR tab_1.is_tipo_ventana <> "w_2301_hist")  THEN

	ls_Select = ' SELECT A.VALOR,   ' +&
         'SGD_INTERRUPCION.F_REPOSICION,   ' +&
         'SGD_INTERRUPCION.F_ALTA,   ' +&
         'NVL(SGD_INTERRUPCION.CCLI_AFEC,0),   ' +&
         'NVL(SGD_INTERRUPCION.POT_INST_AFEC,0),   ' +&
         'NVL(SGD_INTERRUPCION.POT_CONTR_AFEC,0),   ' +&
         'SGD_INTERRUPCION.H_REPOSICION,   ' +&
         'SGD_INTERRUPCION.H_ALTA,   ' +&
         'SGD_INTERRUPCION.NRO_INCIDENCIA,   ' +&
         'SGD_INTERRUPCION.NRO_INSTALACION,   ' +&
         'SGD_INTERRUPCION.TIEMPO_INTERRUPCION,  ' +&
			'B.DESCRIPCION,  ' + &
			'SGD_INTERRUPCION.AFEC_PARCIAL, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'0 As c_cant_cli_original ' + /*  OSGI 2001.1 29/05/2001  */ & 
    'FROM SGD_INTERRUPCION,   ' +&
    '     SGD_VALOR A, SGD_VALOR B  ' +&
   'WHERE ( SGD_INTERRUPCION.tipo_instalacion = A.codigo (+)) and  ' +&
         '( A.CODIF = ~'T_IN~') AND  ' +&
         '( SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incid ) AND ' +&
    		'( SGD_INTERRUPCION.NRO_INSTALACION = :pl_nro_instalacion ) AND' +&
			'( B.CODIF = ~'FASE~' ) AND ' +&
			'( B.VALOR = SGD_INTERRUPCION.FASE_AFECTADA )' +&
' UNION ' +&
	' SELECT SGD_VALOR.VALOR,   ' +&
				'SGD_INTERRUPCION_RS.F_REPOSICION,   ' +&
				'SGD_INTERRUPCION_RS.F_ALTA,   ' +&
				'NVL(SGD_INTERRUPCION_RS.CCLI_AFEC,0),   ' +&
				'NVL(SGD_INTERRUPCION_RS.POT_INST_AFEC,0),   ' +&
				'NVL(SGD_INTERRUPCION_RS.POT_CONTR_AFEC,0),   ' +&
				'SGD_INTERRUPCION_RS.H_REPOSICION,   ' +&
				'SGD_INTERRUPCION_RS.H_ALTA,   ' +&
				'SGD_INTERRUPCION_RS.NRO_INCIDENCIA,   ' +&
				'SGD_INTERRUPCION_RS.NRO_INSTALACION,   ' +&
				'SGD_INTERRUPCION_RS.TIEMPO_INTERRUPCION,  ' +&
				'SGD_INTERRUPCION_RS.FASE_AFECTADA,  ' + &
				'SGD_INTERRUPCION_RS.AFEC_PARCIAL, ' + /*  OSGI 2001.1 29/05/2001  */ & 
				'0 As c_cant_cli_original ' + /*  OSGI 2001.1 29/05/2001  */ & 
		 'FROM SGD_INTERRUPCION_RS,   ' +&
		 '     SGD_VALOR  ' +&
		'WHERE ( SGD_INTERRUPCION_RS.tipo_instalacion = sgd_valor.codigo (+)) and  ' +&
				'( SGD_VALOR.CODIF = ~'T_IN~') AND  ' +&
				'( SGD_INTERRUPCION_RS.NRO_INCIDENCIA = :pl_nro_incid ) AND ' +&
				'( SGD_INTERRUPCION_RS.NRO_INSTALACION = :pl_nro_instalacion ) '
ELSE
	
	 ls_select = 'SELECT A.VALOR,   ' + &
         'SGD_INTERRUPCION.F_REPOSICION,   ' + &   
         'SGD_INTERRUPCION.F_ALTA,      ' + &
         'NVL(SGD_INTERRUPCION.POT_INSTALADA,0),      ' + &
         'NVL(SGD_INTERRUPCION.POT_CONTRATADA,0),      ' + &
         'NVL(SGD_INTERRUPCION.KWH,0),      ' + &
         'NVL(SGD_INTERRUPCION.CCLI_AFEC,0),      ' + &
         'NVL(SGD_INTERRUPCION.POT_INST_AFEC,0),      ' + &
         'NVL(SGD_INTERRUPCION.POT_CONTR_AFEC,0),      ' + &
         'NVL(SGD_INTERRUPCION.CANT_CLI,0),      ' + &
         'SGD_INTERRUPCION.USUARIO,      ' + &
         'SGD_INTERRUPCION.F_ACTUAL,      ' + &
         'SGD_INTERRUPCION.H_ACTUAL,      ' + &
         'SGD_INTERRUPCION.PROGRAMA,      ' + &
         'SGD_INTERRUPCION.TIP_INTERRUPCION,      ' + &
         'SGD_INTERRUPCION.IND_OTRAS_INS,      ' + &
         'SGD_INTERRUPCION.H_REPOSICION,      ' + &
         'SGD_INTERRUPCION.NRO_INCIDENCIA,      ' + &
         'SGD_INTERRUPCION.IND_ULT_NIVEL,      ' + &
         'SGD_INTERRUPCION.IND_FICTICIO,      ' + &
         'SGD_INTERRUPCION.NRO_INSTALACION,      ' + &
         'SGD_INTERRUPCION.NRO_PADRE,      ' + &
         'SGD_INTERRUPCION.TIPO_INSTALACION,      ' + &
         'SGD_INTERRUPCION.CO_NIVEL,      ' + &
         'SGD_INTERRUPCION.TIPO_INSTALACION_PADRE,      ' + &
         'SGD_INTERRUPCION.CO_NIVEL_PADRE,      ' + &
         'NVL(SGD_INTERRUPCION.KWH_ESTIMADO,0),      ' + &
         'SGD_INTERRUPCION.TIEMPO_INTERRUPCION,   ' + &
		 	'SGD_INTERRUPCION.FASE_AFECTADA,   ' + &
			'SGD_INTERRUPCION.F_ALTA_FASE_A,   ' + &
			'SGD_INTERRUPCION.F_REPOSICION_FASE_A,   ' + &
			'SGD_INTERRUPCION.F_ALTA_FASE_B,   ' + &
			'SGD_INTERRUPCION.F_REPOSICION_FASE_B,   ' + &
			'SGD_INTERRUPCION.F_ALTA_FASE_C,   ' + &
			'SGD_INTERRUPCION.F_REPOSICION_FASE_C,   ' + &
			'0, ' + &
			'B.DESCRIPCION,   ' + &
		   '0 FASE_SELECCIONADA,  ' + &
			'SGD_INTERRUPCION.AFEC_PARCIAL, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'0 As c_cant_cli_original, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'SGD_INTERRUPCION.POT_INST_AFEC_CIU, ' + &
			'SGD_INTERRUPCION.POT_INST_AFEC_RUR, ' + &
			'SGD_INTERRUPCION.POT_INST_AFEC_URB, ' + &
			'SGD_INTERRUPCION.CCLI_AFEC_CIU, ' + &
			'SGD_INTERRUPCION.CCLI_AFEC_RUR, ' + &
			'SGD_INTERRUPCION.CCLI_AFEC_URB, ' + &
			'SGD_INTERRUPCION.POT_INTERRUMPIDA ' + &
    'FROM SGD_INTERRUPCION,      ' + &
         'SGD_VALOR A,   ' + &
			'SGD_VALOR B     ' + &
   'WHERE ( SGD_INTERRUPCION.tipo_instalacion = A.codigo (+)) and     ' + &
         '( A.CODIF = ~'T_IN~') AND     ' + &
         '( SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incid ) AND   ' + &
			'(B.CODIF (+) = ~'FASE~') AND   ' + &
			'(B.VALOR (+) = SGD_INTERRUPCION.FASE_AFECTADA)      '+ &
		'UNION ' + &
		'SELECT A.VALOR,   ' + &
         'SGD_INTERRUPCION_RS.F_REPOSICION,   ' + &   
         'SGD_INTERRUPCION_RS.F_ALTA,      ' + &
         'NVL(SGD_INTERRUPCION_RS.POTENCIA_INSTALADA_CT,0),      ' + &
         'NVL(SGD_INTERRUPCION_RS.POTENCIA_CONTRATADA_CT,0),      ' + &
         'NVL(SGD_INTERRUPCION_RS.KWH,0),      ' + &
         'NVL(SGD_INTERRUPCION_RS.CCLI_AFEC,0),      ' + &
         'NVL(SGD_INTERRUPCION_RS.POT_INST_AFEC,0),      ' + &
         'NVL(SGD_INTERRUPCION_RS.POT_CONTR_AFEC,0),      ' + &
         'NVL(SGD_INTERRUPCION_RS.CANT_CLIENTES_CT,0),      ' + &
         'SGD_INTERRUPCION_RS.USUARIO,      ' + &
         'SGD_INTERRUPCION_RS.F_ACTUAL,      ' + &
         'SGD_INTERRUPCION_RS.H_ACTUAL,      ' + &
         'SGD_INTERRUPCION_RS.PROGRAMA,      ' + &
         'SGD_INTERRUPCION_RS.TIP_INTERRUPCION,      ' + &
         'SGD_INTERRUPCION_RS.IND_OTRAS_INS,      ' + &
         'SGD_INTERRUPCION_RS.H_REPOSICION,      ' + &
         'SGD_INTERRUPCION_RS.NRO_INCIDENCIA,      ' + &
         'SGD_INTERRUPCION_RS.IND_ULT_NIVEL,      ' + &
         'SGD_INTERRUPCION_RS.IND_FICTICIO,      ' + &
         'SGD_INTERRUPCION_RS.NRO_INSTALACION,      ' + &
         'SGD_INTERRUPCION_RS.NRO_PADRE,      ' + &
         'SGD_INTERRUPCION_RS.TIPO_INSTALACION,      ' + &
         'SGD_INTERRUPCION_RS.CO_NIVEL,      ' + &
         'SGD_INTERRUPCION_RS.TIPO_INSTALACION_PADRE,      ' + &
         'SGD_INTERRUPCION_RS.CO_NIVEL_PADRE,      ' + &
         'NVL(SGD_INTERRUPCION_RS.KWH_ESTIMADO,0),      ' + &
         'SGD_INTERRUPCION_RS.TIEMPO_INTERRUPCION,   ' + &
		 	'SGD_INTERRUPCION_RS.FASE_AFECTADA,   ' + &
			'SGD_INTERRUPCION_RS.F_ALTA_FASE_A,   ' + &
			'SGD_INTERRUPCION_RS.F_REPOSICION_FASE_A,   ' + &
			'SGD_INTERRUPCION_RS.F_ALTA_FASE_B,   ' + &
			'SGD_INTERRUPCION_RS.F_REPOSICION_FASE_B,   ' + &
			'SGD_INTERRUPCION_RS.F_ALTA_FASE_C,   ' + &
			'SGD_INTERRUPCION_RS.F_REPOSICION_FASE_C,   ' + &
			'0, ' + &
			'SGD_INTERRUPCION_RS.FASE_AFECTADA,   ' + &
		   '0 FASE_SELECCIONADA,  ' + &
			'SGD_INTERRUPCION_RS.AFEC_PARCIAL, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'0 As c_cant_cli_original, ' + /*  OSGI 2001.1 29/05/2001  */ & 
			'SGD_INTERRUPCION_RS.POT_INST_AFEC_CIU, ' + &
			'SGD_INTERRUPCION_RS.POT_INST_AFEC_RUR, ' + &
			'SGD_INTERRUPCION_RS.POT_INST_AFEC_URB, ' + &
			'SGD_INTERRUPCION_RS.CCLI_AFEC_CIU, ' + &
			'SGD_INTERRUPCION_RS.CCLI_AFEC_RUR, ' + &
			'SGD_INTERRUPCION_RS.CCLI_AFEC_URB, ' + &
			'SGD_INTERRUPCION_RS.POT_INTERRUMPIDA ' + &
    'FROM SGD_INTERRUPCION_RS,      ' + &
         'SGD_VALOR A   ' + &
   'WHERE ( SGD_INTERRUPCION_RS.tipo_instalacion = A.codigo (+)) and     ' + &
         '( A.CODIF = ~'T_IN~') AND     ' + &
         '( SGD_INTERRUPCION_RS.NRO_INCIDENCIA = :pl_nro_incid )  '
			
END IF

tab_1.tabpage_interrupciones.d_datos_interrup.Object.DataWindow.Table.Select = ls_select

end subroutine

public function integer fw_cambiar_select_dw_otros ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_dw_otros
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow dw_otros para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 27/07/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////


string ls_select

//ls_select = 'SELECT TENSION_ORIGEN, '  + &
//					'TENSION_AFECTADA, '  + &
//					'AGENTE, '  + &
//					'TENSION_ORIGEN AS ac, '  + &
//					'AREA_AFEC, '  + &
//					'NVL(PAXTC, 0), '  + &
//					'NVL(DURACION, 0) '  + &
//    			'FROM GI_HIST_INCIDENCIAS '  + &
//   			'WHERE GI_HIST_INCIDENCIAS.NRO_INCIDENCIA = :nro_incidencia   '
//
//tab_1.tabpage_otros.dw_otros.Object.DataWindow.Table.Select = ls_select

//tab_1.tabpage_otros.dw_otros.dataobject = 'd_hist_inc_2051_otros'
tab_1.tabpage_formulario.dw_informe_tecnico.dataobject = 'd_hist_inc_2051_otros'  //TDA 11/01/2019

return 1

end function

public subroutine fw_union_select_d_lista_otras_inst_ant ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_union_select_d_lista_otras_inst_ant
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_lista_otras_inst_ant para que
//				 traiga los datos de la tabla temporal de interrupciones y de la tabla normal
//				 de interrupciones
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 22/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado

ls_Select = 'SELECT INSTALACION_A.NOM_INSTALACION || DECODE(INSTALACION_A.TIPO_INSTALACION, ' +&
				'	  		TRUNC(:pi_tipo_ct,0), DECODE(INSTALACION_A.TIPO_AREA, ~'C~', ~' (Ciudad)~', ' +&
				'																						 ~'U~', ~' (Urbano)~', ' +&
 				'																						 ~'R~', ~' (Rural)~', ~'~' ), ~'~') NOM_INSTALACION,  ' +& 
         	'		  INSTALACION_A.TIPO_INSTALACION, ' +&
         	'		  INSTALACION_A.NRO_INSTALACION,  ' +& 
				'		  FGCI_FASE_INSTALACION(NVL(INSTALACION_A.TIPO_CONEXION,15)) FASE_INSTALACION, ' +&
         	'		  INSTALACION_B.NOM_INSTALACION, ' +&
				'		  INSTALACION_B.NRO_INSTALACION, ' +&
				'		  SGD_INTERRUPCION.F_ALTA,   ' +&
         	'		  SGD_INTERRUPCION.F_REPOSICION, ' +&
				'		  :pfgci_tipo_subestacion_at ctipo_subestacion_at, ' +&
				'		  :pfgci_tipo_salida_at ctipo_salida_at, ' +&
				'		  :pfgci_tipo_subestacion ctipo_subestacion, ' +&
				'		  :pfgci_tipo_salida_mt ctipo_salida_mt, ' +&
				'		  :pfgci_tipo_ct ctipo_ct, ' +&
				'		  :pfgci_tipo_transformador ctipo_transformador, ' +&
				'		  :pfgci_tipo_salida_de_baja ctipo_salida_de_baja ' +&
    			'FROM SGD_INSTALACION INSTALACION_A,   ' +&
         	'		SGD_INTERRUPCION,   ' +&
         	'		SGD_INSTALACION INSTALACION_B  ' +&
   			'WHERE ( INSTALACION_A.NRO_INSTALACION = SGD_INTERRUPCION.NRO_INSTALACION ) and ' +&
         	'		 ( INSTALACION_A.BDI_JOB = 0 ) and ' +&
         	'		 ( INSTALACION_A.NRO_INST_PADRE = INSTALACION_B.NRO_INSTALACION ) and  ' +&
         	'		 ( INSTALACION_B.BDI_JOB = 0 ) and ' +&
         	'		 ( ( SGD_INTERRUPCION.IND_OTRAS_INS = 1 ) AND  ' +&
         	'	( SGD_INTERRUPCION.NRO_INCIDENCIA = :pl_nro_incid ) ) ' +&
				' UNION ' + &
				'SELECT INSTALACION_A.NOM_INSTALACION || DECODE(INSTALACION_A.TIPO_INSTALACION, ' +&
				'	  		TRUNC(:pi_tipo_ct,0), DECODE(INSTALACION_A.TIPO_AREA, ~'C~', ~' (Ciudad)~', ' +&
				'																						 ~'U~', ~' (Urbano)~', ' +&
 				'																						 ~'R~', ~' (Rural)~', ~'~' ), ~'~') NOM_INSTALACION,  ' +& 
         	'		  INSTALACION_A.TIPO_INSTALACION, ' +&
         	'		  INSTALACION_A.NRO_INSTALACION,  ' +& 
				'		  FGCI_FASE_INSTALACION(NVL(INSTALACION_A.TIPO_CONEXION,15)) FASE_INSTALACION, ' +&
         	'		  INSTALACION_B.NOM_INSTALACION, ' +&
				'		  INSTALACION_B.NRO_INSTALACION, ' +&
				'		  SGD_INTERRUPCION_RS.F_ALTA,   ' +&
         	'		  SGD_INTERRUPCION_RS.F_REPOSICION, ' +&
				'		  :pfgci_tipo_subestacion_at ctipo_subestacion_at, ' +&
				'		  :pfgci_tipo_salida_at ctipo_salida_at, ' +&
				'		  :pfgci_tipo_subestacion ctipo_subestacion, ' +&
				'		  :pfgci_tipo_salida_mt ctipo_salida_mt, ' +&
				'		  :pfgci_tipo_ct ctipo_ct, ' +&
				'		  :pfgci_tipo_transformador ctipo_transformador, ' +&
				'		  :pfgci_tipo_salida_de_baja ctipo_salida_de_baja ' +&
    			'FROM SGD_INSTALACION INSTALACION_A,   ' +&
         	'		SGD_INTERRUPCION_RS,   ' +&
         	'		SGD_INSTALACION INSTALACION_B  ' +&
   			'WHERE ( INSTALACION_A.NRO_INSTALACION = SGD_INTERRUPCION_RS.NRO_INSTALACION ) and ' +&
         	'		 ( INSTALACION_A.BDI_JOB = 0 ) and ' +&
         	'		 ( INSTALACION_A.NRO_INST_PADRE = INSTALACION_B.NRO_INSTALACION ) and  ' +&
         	'		 ( INSTALACION_B.BDI_JOB = 0 ) and ' +&
         	'		 ( ( SGD_INTERRUPCION_RS.IND_OTRAS_INS = 1 ) AND  ' +&
         	'	( SGD_INTERRUPCION_RS.NRO_INCIDENCIA = :pl_nro_incid ) )    '


tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_dw_afec_parcial_sum ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_dw_afec_parcial_sum
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow dw_afec_parcial_sum para que
//				 traiga los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 18/11/2003	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////

string ls_select, ls_estado

ls_Select = ' SELECT USUARIO,   ' +&
				'		F_ACTUAL,   ' +&
				'		PROGRAMA,   ' +&
				'		NIS_RAD,   ' +&
				'		NRO_INCIDENCIA, ' +&   
				'		NRO_INSTALACION,   ' +&
				'		F_ALTA,   ' +&
				'		MEDIDOR,   ' +&
				'		NOMBRE,   ' +&
				'		APE1,   ' +&
				'		APE2  ' +&
				' FROM GI_HIST_AFEC_PARCIAL_SUM   ' +&
				' WHERE NRO_INCIDENCIA = :pl_nro_incidencia'

tab_1.tabpage_interrupciones.dw_afec_parcial_sum.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_dw_datos_indisp ();string ls_select
/*AHM
ls_select=  "SELECT GI_HIST_INDISPONIBILIDAD.USUARIO," +&   
         " GI_HIST_INDISPONIBILIDAD.NRO_INSTALACION," +&   
         " GI_HIST_INDISPONIBILIDAD.PROGRAMA," +&   
         " GI_HIST_INDISPONIBILIDAD.F_REPOSICION," +&   
         " GI_HIST_INDISPONIBILIDAD.F_ALTA," +&  
         " GI_HIST_INDISPONIBILIDAD.NRO_INCIDENCIA," +&   
         " GI_HIST_INDISPONIBILIDAD.TIP_INTERRUPCION," +&   
         " GI_HIST_INDISPONIBILIDAD.MANUAL," +&   
         " GI_HIST_INDISPONIBILIDAD.MANIOBRADO," +&   
         " GI_HIST_INDISPONIBILIDAD.CLASS_ID," +&   
         " GI_HIST_INDISPONIBILIDAD.COD_CAUSA," +&   
         " GI_HIST_INDISPONIBILIDAD.FAM_CAUSA" +&  
    " FROM GI_HIST_INDISPONIBILIDAD" +&  
   " WHERE nro_incidencia = :pl_nro_incidencia"    
	
tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.Object.DataWindow.Table.Select = ls_select	*/
tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.DataObject = 'dw_datos_indisponibilidades_historico'

end subroutine

public subroutine fw_cambiar_select_dw_lista_indisp ();string ls_select
  
ls_select=" SELECT GI_HIST_INDISPONIBILIDAD.NRO_INSTALACION," +&
			" fg_obten_nombre(GI_HIST_INDISPONIBILIDAD.CLASS_ID,NRO_INSTALACION) NOMBRE," +&   
         " GI_HIST_INDISPONIBILIDAD.F_ALTA," +&   
         " GI_HIST_INDISPONIBILIDAD.F_REPOSICION," +&   
         " GI_HIST_INDISPONIBILIDAD.MANIOBRA_APERTURA," +&   
         " GI_HIST_INDISPONIBILIDAD.MANIOBRA_CIERRE," +&
         " SGD_ENTIDADES.ENTIDAD," +&   
         " GI_HIST_INDISPONIBILIDAD.CLASS_ID," +&   
         " GI_HIST_INDISPONIBILIDAD.TIP_INTERRUPCION," +&   
         " '0' MODIFICADO," +&   
         " GI_HIST_INDISPONIBILIDAD.F_ACTUAL," +&   
         " GI_HIST_INDISPONIBILIDAD.MANUAL" +&  
    " FROM  GI_HIST_INDISPONIBILIDAD," +&   
         " SGD_ENTIDADES" +& 
   " WHERE (( GI_HIST_INDISPONIBILIDAD.CLASS_ID = SGD_ENTIDADES.CLASS_ID ) OR " +&
         " ( GI_HIST_INDISPONIBILIDAD.CLASS_ID = SGD_ENTIDADES.CLASS_ID_ESQ )) and " +& 
         " ( GI_HIST_INDISPONIBILIDAD.NRO_INCIDENCIA = :pl_nro_incidencia )"  
			
tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.Object.DataWindow.Table.Select = ls_select	
			
end subroutine

public subroutine fw_cambiar_select_d_inf_general ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_inf_general
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_inf_general para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 19/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////


string ls_select


/*AHM 1/693011 27/05/2009*/
//TDA-EDM1-24-04-2017
ls_select=  'SELECT GI_HIST_INCIDENCIAS.NRO_INCIDENCIA, '+&
         'GI_HIST_INCIDENCIAS.USUARIO,    '+&
         'GI_HIST_INCIDENCIAS.F_ACTUAL,    '+&
         'GI_HIST_INCIDENCIAS.H_ACTUAL,    '+&
         'GI_HIST_INCIDENCIAS.PROGRAMA,    '+&
         'GI_HIST_INCIDENCIAS.PRIMER_AVISO,    '+&
         'GI_HIST_INCIDENCIAS.DESC_INCIDENCIA,    '+&
         'GI_HIST_INCIDENCIAS.EST_ACTUAL,    '+&
         'GI_HIST_INCIDENCIAS.F_DETECCION,    '+&
         'GI_HIST_INCIDENCIAS.H_DETECCION,    '+&
         'GI_HIST_INCIDENCIAS.F_EST_RES,    '+&
         'GI_HIST_INCIDENCIAS.H_EST_RES,    '+&
         'GI_HIST_INCIDENCIAS.TIP_INCIDENCIA,   '+& 
         'GI_HIST_INCIDENCIAS.COD_CAUSA,    '+&
         'GI_HIST_INCIDENCIAS.F_ALTA,    '+&
         'GI_HIST_INCIDENCIAS.H_ALTA,    '+&
         'GI_HIST_INCIDENCIAS.NRO_CENTRO,    '+&
         'GI_HIST_INCIDENCIAS.NRO_CMD,    '+&
         'GI_HIST_INCIDENCIAS.NRO_MESA,    '+&
         'GI_HIST_INCIDENCIAS.NRO_INST_AFECTADA,    '+&
         'GI_HIST_INCIDENCIAS.NRO_INST_ORIGEN,    '+&
         'GI_HIST_INCIDENCIAS.POT_AFECTADA,    '+&
         'GI_HIST_INCIDENCIAS.POT_CONTRATADA,    '+&
         'GI_HIST_INCIDENCIAS.CCLI_AFEC,    '+&
         'GI_HIST_INCIDENCIAS.MAT_AVERIADO,    '+&
         'GI_HIST_INCIDENCIAS.NRO_BRIGADA,    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.ALCANCE,    '+&
         'GI_HIST_INCIDENCIAS.OBSERVACION,    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.TIP_TENSION,    '+&
         'GI_HIST_OT.DESCRIPCION,   ' + &  
         'GI_HIST_OT.F_DESDE,   ' + &  
         'GI_HIST_OT.F_HASTA,   ' + &  
         'GI_HIST_INCIDENCIAS.OT,    '+&
         'GI_HIST_INCIDENCIAS.COD_EST_CLIMA,    '+&
         'GI_HIST_INCIDENCIAS.CANT_AVISOS,    '+&
         'GI_HIST_INCIDENCIAS.CAN_CLI,    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.ESTADO_MANTENIMIENTO,    '+&
         'GI_HIST_INCIDENCIAS.CENTRO_ALTA,    '+&
         'GI_HIST_INCIDENCIAS.CMD_ALTA,    '+&
         'GI_HIST_INCIDENCIAS.PUESTO_ALTA,    '+&
         'GI_HIST_INCIDENCIAS.FAM_MANT_AVER,    '+&
         'GI_HIST_INCIDENCIAS.FAM_CAUSA,    '+&
         'GI_HIST_INCIDENCIAS.TIEMPO_MANT,    '+&
         'GI_HIST_INCIDENCIAS.TIEMPO_OPER,    '+&
         'GI_HIST_INCIDENCIAS.DURACION_SR,    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.FEC_CAUSA,    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.FEC_RESOLUCION,    '+&
         'GI_HIST_INCIDENCIAS.DIR_AVISO,    '+&
         'GI_HIST_INCIDENCIAS.IND_ALUM_PUB,     '+&
         'GI_HIST_INCIDENCIAS.DURACION_RS,    '+&
         'GI_HIST_INCIDENCIAS.DURACION_ER,    '+&
         'GI_HIST_INCIDENCIAS.DER_MANT_EN_CORTE,  '+&  
         'GI_HIST_INCIDENCIAS.DURACION_ENV_BRIGADA,   '+& 
         'GI_HIST_INCIDENCIAS.PAXTC,    '+&
         'GI_HIST_INCIDENCIAS.PCXTC,    '+&
         'GI_HIST_INCIDENCIAS.DURACION_MANT,    '+&
         'GI_HIST_INCIDENCIAS.DURACION_MANT_CORTE,  '+&  
         '~' ~',    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.ESTADO_BATCH,    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.COD_HOR,    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.EB6203,    '+&
         'GI_HIST_INCIDENCIAS.EB4001,    '+&
         'GI_HIST_INCIDENCIAS.EB4002,    '+&
         'GI_HIST_INCIDENCIAS.EB4003,    '+&
         'GI_HIST_INCIDENCIAS.EB4004,    '+&
         'GI_HIST_INCIDENCIAS.EB4007,    '+&
         'GI_HIST_INCIDENCIAS.EB4007_EST,    '+&
         'GI_HIST_INCIDENCIAS.KWH_ESTIMADO,    '+&
         'GI_HIST_INCIDENCIAS.TIEPI,    '+&
         'GI_HIST_INCIDENCIAS.TIEBT,    '+&
         '~' ~',    '+&
         '~' ~',    '+&
         'GI_HIST_INCIDENCIAS.INSTALACION_ORIGEN,    '+&
         'GI_HIST_INCIDENCIAS.OBSERV_MTO,    '+&
         'GI_HIST_INCIDENCIAS.NOM_DOC,    '+&
         'GI_HIST_INCIDENCIAS.TIEPI_APORTADO,    '+&
         'GI_HIST_INCIDENCIAS.TIEBT_APORTADO,    '+&
         'GI_HIST_INCIDENCIAS.SAIFI,    '+&
         'GI_HIST_INCIDENCIAS.SAIDI,    '+&
         'GI_HIST_INCIDENCIAS.CAIDI,    '+&
         'GI_HIST_INCIDENCIAS.ASAI,    '+&
         'GI_HIST_INCIDENCIAS.DURACION_EB_ER,    '+&
         'GI_HIST_INCIDENCIAS.DURACION_ER_SR, '+&
  			'GI_HIST_INCIDENCIAS.NRO_AGRUPACION, '+&
			'GI_HIST_INCIDENCIAS.FASE_SUGERIDA, '+&
			'GI_HIST_INCIDENCIAS.TIPO_LUMINARIA, '+&
			'GI_HIST_INCIDENCIAS.LUM_REPARADAS, '+&
			'GI_HIST_INCIDENCIAS.COD_TENSION_ORIGEN, '+&
			'GI_HIST_INCIDENCIAS.COD_TENSION_AFECTADA, '+&
			'GI_HIST_INCIDENCIAS.COD_AGENTE, '+&
			'GI_HIST_INCIDENCIAS.AREA_AFEC, '+&
			'GI_HIST_INCIDENCIAS.DURACION, '+&
			'NVL(GI_HIST_INCIDENCIAS.PAXTC, 0) AS C_EXT_PAXTC, '+&
			'NVL(GI_HIST_INCIDENCIAS.DURACION, 0) AS C_EXT_DURACION, '+&
			'GI_HIST_INCIDENCIAS.IND_SCADA, '+&
			'GI_HIST_INCIDENCIAS.IND_OBLIGADA, '+&
			'fg_pendiente_bdi(GI_HIST_INCIDENCIAS.NRO_INCIDENCIA, '+&
			'						  GI_HIST_INCIDENCIAS.TIP_INCIDENCIA, '+&
			'						  GI_HIST_INCIDENCIAS.EST_ACTUAL) AS c_pendiente_bdi, '+&
			'GI_HIST_INCIDENCIAS.ESTADO_RED ,'+&			
			'GI_HIST_INCIDENCIAS.USUARIO_AGENTE, '+&		
			'GI_HIST_INCIDENCIAS.F_ELIM_PELIGRO, '+ /*  LSH 15/10/2013 Mejora DEO12-00000263  */ &
			'GI_HIST_INCIDENCIAS.COD_ACCION_INC, '+ /*  NCA-INICIO.DDAG-1783.20150512. */ &
			'GI_HIST_INCIDENCIAS.COD_CAUSA_SUBTIPO, '+ /*  HLA.DDAG-6453.22/09/2016 */ &
			'GI_HIST_INCIDENCIAS.COD_ELEM_OPERADO, '+ /*  HLA.DDAG-6453.22/09/2016 */ &
			'GI_HIST_INCIDENCIAS.COD_ELEM_FALLADO, '+ /*  HLA.DDAG-6453.22/09/2016 */ &	
			'GI_HIST_INCIDENCIAS.REP_RED, '+&	
			'GI_HIST_INCIDENCIAS.ORIGEN_INCIDENCIA '+&
    'FROM GI_HIST_OT,   ' + &  
         'SGD_VALOR,   ' + & 
			'SGD_VALOR B,   ' + & 
         'GI_HIST_INCIDENCIAS  ' + &  
   'WHERE ( GI_HIST_OT.nro_ot (+) = GI_HIST_INCIDENCIAS.ot) and  ' + &  
         '( SGD_VALOR.CODIGO = GI_HIST_INCIDENCIAS.EST_ACTUAL ) and  ' + &  
         '( SGD_VALOR.CODIF = ~'E_OP~' ) AND  ' + &  
			'( B.CODIGO = GI_HIST_INCIDENCIAS.TIP_INCIDENCIA ) and  ' + &  
         '( B.CODIF = ~'INC~' ) AND  ' + &  
         '( ( GI_HIST_INCIDENCIAS.NRO_INCIDENCIA = :pi_nro_incidencia ) )    '   

tab_1.tabpage_formulario.d_inf_general.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_cambiar_select_d_datos_ot ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: fw_cambiar_select_d_datos_ot
//
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que cambia la select de la datawindow d_datos_ot para que traiga 
//  			 los datos de los hist$$HEX1$$f300$$ENDHEX$$ricos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//
//        Salida:
//
// Devuelve: 
//
//   Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------       -------------------       --------------
// 19/01/2001	      LFE								Creaci$$HEX1$$f300$$ENDHEX$$n
//		
//////////////////////////////////////////////////////////////////////////////////////////////


string ls_select

ls_Select = 'SELECT GI_HIST_OT.DESCRIPCION,   ' + &
         'GI_HIST_OT.NRO_OT,   ' + &
         'GI_HIST_OT.EST_OT,   ' + &
         'GI_HIST_OT.F_DESDE,   ' + &
         'GI_HIST_OT.H_DESDE,   ' + &
         'GI_HIST_OT.NRO_AVISO,   ' + &
         'GI_HIST_OT.NRO_INSTALACION,  ' + & 
         'GI_HIST_OT.NRO_INCIDENCIA,   ' + &
         'GI_HIST_OT.F_HASTA,   ' + &
         'GI_HIST_OT.H_HASTA,   ' + &
         'GI_HIST_OT.F_ALTA,   ' + &
         'GI_HIST_OT.H_ALTA,   ' + &
         'GI_HIST_OT.ULT_BRIGADA,   ' + &
         'GI_HIST_OT.NRO_CENTRO,   ' + &
         'GI_HIST_OT.NRO_CMD,   ' + &
         'GI_HIST_OT.NRO_MESA,   ' + &
         'GI_HIST_OT.USUARIO,   ' + &
         'GI_HIST_OT.F_ACTUAL,   ' + &
         'GI_HIST_OT.H_ACTUAL,   ' + &
         'GI_HIST_OT.PROGRAMA,   ' + &
         'GI_HIST_OT.IND_TRABAJO,   ' + &
         'GI_HIST_OT.TIP_BRIGADA,  ' + &
			'GI_HIST_OT.PREPARACION_LM,  ' + &
			'GI_HIST_OT.F_ELIM_PELIGRO  ' + /*  LSH 15/10/2013 Mejora DEO12-00000263  */ &
    'FROM GI_HIST_OT  ' + &
   'WHERE ( GI_HIST_OT.NRO_OT = :pi_nro_ot )    '



tab_1.tabpage_ot.d_datos_ot.Object.DataWindow.Table.Select = ls_select

end subroutine

public subroutine fw_select_original ();IF is_select_inf_general = " " THEN
	is_select_inf_general = tab_1.tabpage_formulario.d_inf_general.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_formulario.d_inf_general.Object.DataWindow.Table.Select = is_select_inf_general 
END IF

IF is_select_list_bri = " " THEN
	is_select_list_bri = tab_1.tabpage_ot.d_lista_brigadas_ot.Object.DataWindow.Table.Select
ELSE 
	tab_1.tabpage_ot.d_lista_brigadas_ot.Object.DataWindow.Table.Select = is_select_list_bri	
END IF

IF is_select_datos_ot = " " THEN
	is_select_datos_ot = tab_1.tabpage_ot.d_datos_ot.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_ot.d_datos_ot.Object.DataWindow.Table.Select = is_select_datos_ot
END IF

IF is_select_materiales = " " THEN
	is_select_materiales = tab_1.tabpage_cuadrillas.d_materiales.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_cuadrillas.d_materiales.Object.DataWindow.Table.Select = is_select_materiales
END IF

IF is_select_int_op = " " THEN
	is_select_int_op = tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.Object.DataWindow.Table.Select = is_select_int_op
END IF

IF is_select_acometidas = " " THEN
	is_select_acometidas = tab_1.tabpage_interrupciones.dw_lista_acometidas.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_interrupciones.dw_lista_acometidas.Object.DataWindow.Table.Select = is_select_acometidas
END IF

IF is_select_datos_inte = " " THEN
	is_select_datos_inte = tab_1.tabpage_interrupciones.d_datos_interrup.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_interrupciones.d_datos_interrup.Object.DataWindow.Table.Select = is_select_datos_inte
END IF

IF is_select_acciones = " " THEN
	is_select_acciones = tab_1.tabpage_acciones.d_lista_acciones_incidencia.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_acciones.d_lista_acciones_incidencia.Object.DataWindow.Table.Select = is_select_acciones
END IF

IF is_select_afec_par = " " THEN
	is_select_afec_par = tab_1.tabpage_interrupciones.dw_afec_parcial_sum.Object.DataWindow.Table.Select
ELSE
	tab_1.tabpage_interrupciones.dw_afec_parcial_sum.Object.DataWindow.Table.Select = is_select_afec_par
END IF



end subroutine

on w_2301_hist_form_incidencia.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_historicos=create cb_historicos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_historicos
end on

on w_2301_hist_form_incidencia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.cb_historicos)
end on

event ue_open;long ll_incidencia_existente = 0, ll_codigo
string  ls_nom_instalacion, ls_dir_aviso
long ll_codigo_aco,ll_incid,ll_nro_incidencia
md_ingreso_incidencias lm_menu
long ll_fila // GNU 31-10-2006. Mejora EPSA
int	li_numeroIndisponibilidades		//N$$HEX1$$fa00$$ENDHEX$$mero de indisponibilidades de la incidencia
////AHM (12/02/2008)
//IF gi_pais=8 then
//	tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_mold'
//END IF

l_si_valido = True
ib_primera_vez = TRUE 
iu_inc_2003_rn.iw_contenedora= this
lm_menu = This.MenuId
//uo_barra.barra.f_resetea_barra()
cb_1.visible=false /// Ocultar el boton de Incidencias de la otra ventana
cb_1.enabled=false
estamos_historicos=true //Ponemos en true la variable para indicar que estamos en historicos
gu_comunic1.is_comunic.intval9=1 // GNU 2-11-2006. Mejora EPSA
cbx_historicos.checked=true
///OPEN(W_BARRA,this)
//W_BARRA.UO_BARRA.gb_1.text="Abriendo Incidencia..."
//W_BARRA.UO_BARRA.BARRA.visible=true
//W_BARRA.uo_barra.barra.f_amplia(3)

//Maneja las variables globales:
//			gu_comunic para trabajo y para comunicarse con la ventana llamante 
//			gu_comunic1 para comunicarse con la ventana iw_6201(asignacion de brigada) 
//			gu_comunic2 para comunicarse con la ventana iw_2120 (seleccion_insts)

//Parametros de entrada:
//			Decval1 = nro instalacion afectada 
//			longval2 = nro_aviso
//			longval3 = nro_incidencia
//			strval1 = direccion del aviso			
//			intval1 = tipo de instalacion
//			intval2 = tipo de tension
//			intval3 = centro			
//			intval4 = cmd
//			intval5 = puesto
//			intval6 = co-nivel
//			datval1 = fecha de alta del aviso 			
//			datval2 = hora de alta del aviso
//			programa_llamante = nombre de la venta o opcion del menu
//			accion_llamada		= Alta nivel suministro
//									  Alta nivel instalacion
//									  Alta							 
//									  Modificacion 
//
//		Parametros de salida
//				intval9 = estado de la incidencia (utilizado por la w_1105_avisos_con_alim
//															para refrescar el arbol o no.)
//
//

is_title=this.title
SetPointer(HourGlass!)
this.setredraw(false)
tab_1.tabpage_formulario.d_inf_general.SetRedraw(False)
openwithparm(w_msg,"Cargando...")

//W_BARRA.uo_barra.barra.f_amplia(10)

//////////////////////// CREACION DE OBJETOS////////////////////////////

this.fnu_crea_objetos(this)
//W_BARRA.uo_barra.barra.f_amplia(15)

tab_1.tabpage_seguimiento.Enabled=false

//////////////////CARGA LOS DATOS DE COMUNICACIONES //////////////////
/////////////////////A LA ESTRUCTURA DE TRABAJO				////////////

//lu_comunic.is_comunic = gu_comunic.is_comunic 

//lu_comunic.is_comunic.longval3=auxiliar_nro_incidencia_historico  //Mejora TDA 09-01-2019
//em_incidencia.text=string(auxiliar_nro_incidencia_historico)  //Mejora TDA 09-01-2019

//W_BARRA.uo_barra.barra.f_amplia(20)
//fw_buscar_incidencia_en_hist(lu_comunic.is_comunic.longval3)

//W_BARRA.uo_barra.barra.f_amplia(28)
// Seteo las variables de instancia del tab
//tab_1.is_accion_llamada = lu_comunic.is_comunic.accion_llamada

////////////////ACTIVO LAS DATAWINDOWS DE INF GENERAL//////////////////
tab_1.is_tipo_ventana ="w_2301_hist"		
tab_1.tabpage_formulario.d_inf_general.fnu_crea_dddw() 

fw_iniciar_dw_incidencia_rs(lu_comunic.is_comunic.longval3)

tab_1.tabpage_formulario.d_inf_general.f_insertar_fila()
tab_1.ii_nro_cmd=gi_nro_cmd
d_ambito.f_insertar_fila() 
//W_BARRA.uo_barra.barra.f_amplia(30)
ib_hubo_cambios = FALSE
dw_brigadas_calendario_rango.SetTransObject(SQLCA)
dw_brigadas_calendario_rango.Retrieve(Datetime(Date(fgnu_fecha_actual())), fgnu_fecha_actual())

//////////////// PREPARO LA PRESENTACION SEGUN LA ACCION LLAMADA/////////
// Se deshabilita el checkbox de 'BlackOut'
tab_1.tabpage_formulario.cbx_blackout.Enabled = False

SETNULL(idt_fec_prim_aviso)
//W_BARRA.uo_barra.barra.f_amplia(32)

// Recupero la lista de acciones
tab_1.tabpage_acciones.d_lista_acciones.Retrieve()

//W_BARRA.uo_barra.barra.f_amplia(55)

tab_1.tabpage_formulario.d_inf_general.setitem(1,"alcance",tab_1.ii_alcance)

this.title="Informaci$$HEX1$$f300$$ENDHEX$$n Incidencia Historicos"	
is_title=this.title

tab_1.tabpage_formulario.d_inf_general.SetRedraw(True)
/*
  tab_1.il_nro_incidencia = lu_comunic.is_comunic.longval3
  i_hay_datos=iu_inc_2003_nu.fnu_obtener_datos(tab_1.tabpage_formulario.d_inf_general,lu_comunic.is_comunic.longval3)
  tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
  tab_1.ii_tipo_incid	= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")		
  tab_1.of_iniciar_estados_oper() */
//COMIENZO ALE		
/*IF i_hay_datos=0 THEN
	if isvalid(W_BARRA) then
		close(W_BARRA)
	end if
	CLOSE(THIS)
	RETURN
	//FINAL ALE
ELSE
	ll_codigo = this.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")
	SELECT nom_instalacion into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_codigo
	and sgd_instalacion.bdi_job = 0 //DBE 11/01/2000
	;
	ls_nom_instalacion = fg_remplaza(ls_nom_instalacion, '"', ' ')	
	this.tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ls_nom_instalacion
	
	tab_1.of_iniciar_estados_oper()		
	fw_hist_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.tabpage_formulario.d_inf_general.object.alcance[1]) 
	IF fw_incidencia_de_operaciones() THEN
		fw_inst_afectadas_operaciones()
	END IF
	tab_1.tabpage_formulario.d_inf_general.fpr_habilitar_campos(lu_comunic.is_comunic.Accion_llamada) 
	tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")

END IF

//W_BARRA.uo_barra.barra.f_amplia(63)
tab_1.il_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia")
*/ //Agregar mas tarde
//W_BARRA.uo_barra.barra.f_amplia(65)
	
//  CARGO DE DROPDOWN CON LOS TIPOS DE INCIDENCIAS,
//	 PROGRAMADA INCLUIDA
/*DataWindowChild ldw_child
tab_1.tabpage_formulario.d_inf_general.GetChild ('tipo_incidencia', ldw_child)
ldw_child.SetTransObject (SQLCA)
ldw_child.Retrieve (0) //Con parametro 0 para sacar todos tipos
tab_1.ii_estado_mant = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"estado_mantenimiento")
*/ //Agregar mas tarde
//gi_est_mant = tab_1.ii_estado_mant
	
//W_BARRA.uo_barra.barra.f_amplia(67)
/*tab_1.ii_tipo_incid = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")
tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"ot")
tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
tab_1.of_iniciar_estados_oper()*/ //Agregar mas tarde
//W_BARRA.uo_barra.barra.f_amplia(69)
/*
IF tab_1.ii_alcance = fgci_incidencia_de_suministro THEN
	ls_dir_aviso =  tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"incidencia_dir_aviso") 
	
	tab_1.tabpage_formulario.d_inf_general.SetItem(1,"nombre_instalacion",ls_dir_aviso)
	tab_1.tabpage_formulario.d_inf_general.SetItem(1,"dir_instalacion",ls_dir_aviso)
	il_aviso_sum = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"primer_aviso")
	
	// Inicializo la incidencia como incidencia de Suministro.

	fw_hist_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.ii_alcance) 
		
END IF
//W_BARRA.uo_barra.barra.f_amplia(70)

IF ib_incidencia_en_historicos = TRUE THEN
	fw_cambiar_select_d_lista_brigadas_ot()
	fw_cambiar_select_d_datos_ot()
END IF

// Se recuperan los datos de todos los tabpages
tab_1.tabpage_ot.d_datos_ot.Retrieve( &
		tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))
	
// DSA INI 29/03/2000	
if tab_1.tabpage_ot.d_datos_ot.RowCount() > 0 then
	if tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2 then
		tab_1.fnu_cambiar_ot_tipo('CO')
	else								
		tab_1.fnu_cambiar_ot_tipo('BR')
	end if
else
	tab_1.fnu_cambiar_ot_tipo('BR')		
end if

if tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot") > 0 and not isnull(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot")) then
	tab_1.tabpage_ot.d_lista_brigadas_ot.&
				Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))	
end if	

tab_1.tabpage_cuadrillas.d_materiales.Retrieve(tab_1.il_nro_incidencia)
tab_1.tabpage_acciones.d_lista_acciones_incidencia.Retrieve(tab_1.il_nro_incidencia)
IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
	tab_1.tabpage_interrupciones.dw_afec_parcial_sum.retrieve(tab_1.il_nro_incidencia)
END IF*/ //Agregar mas tarde
//W_BARRA.uo_barra.barra.f_amplia(72)
/*
IF tab_1.tabpage_cuadrillas.d_materiales.rowcount() > 0 THEN
	gi_con_material_averiado = 1
ELSE
	gi_con_material_averiado = 0
END IF
	
this.tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount()
*/	//Agregar mas tarde
//W_BARRA.uo_barra.barra.f_amplia(74)

/////////////////   INTERRUPCIONES   ////////////////
/*
tab_1.of_componer_dw_interrupciones()
IF ib_incidencia_en_historicos = TRUE THEN
	fw_cambiar_select_d_datos_interrup()
ELSE
	fw_union_select_d_datos_interrup()
END IF
*/ //Agregar mas tarde
/*
IF fw_incidencia_de_operaciones() THEN
	IF tab_1.tabpage_interrupciones.dw_lista_acometidas.RowCount() > 0 AND &
		(gi_tension_nivel_min >= fgci_baja_tension ) THEN
		ll_codigo_aco = tab_1.tabpage_interrupciones.dw_lista_acometidas.GetItemNumber(1,"codigo")
		tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,ll_codigo_aco)
		IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 1 THEN
			tab_1.tabpage_interrupciones.pb_avanzar.visible = True
			tab_1.tabpage_interrupciones.pb_avanzar.enabled = True
			tab_1.tabpage_interrupciones.pb_anterior.visible = True
			tab_1.tabpage_interrupciones.pb_anterior.enabled = False
		ELSE
			tab_1.tabpage_interrupciones.pb_avanzar.visible = False
			tab_1.tabpage_interrupciones.pb_anterior.visible = False
		END IF
	END IF
	
ELSE
	tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia)
END IF

//W_BARRA.uo_barra.barra.f_amplia(83)

tab_1.l_si_valido=0*/ //Agregar mas tarde
//tab_1.ib_primera_vez_interrupciones = False

//W_BARRA.uo_barra.barra.f_amplia(85)

/*tab_1.tabpage_formulario.d_inf_general.Modify("f_deteccion.background.color = " + gs_gris)

tab_1.tabpage_observaciones.mle_observaciones.displayonly = True
tab_1.tabpage_observaciones.mle_observaciones.pointer = "Arrow!"
tab_1.tabpage_interrupciones.d_datos_interrup.enabled=false

//W_BARRA.uo_barra.barra.f_amplia(90)
// Carga las datawindows de seguimiento con los estado existentes
// El 1 es porque desde el open de la ventana no se si resuelve mant, le paso 1 por 
// defecto y en el selectionchanged del tabpage lo evaluo
iu_ema_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_mantenimientos,0)
// Si no existe mantenimiento borra el estado cerrada

tab_1.fnu_obte_estados_mant()*/ //Agregar mas tarde
//W_BARRA.uo_barra.barra.f_amplia(93)

//AHM (02/04/08)
/*
IF fg_verifica_parametro("indisponibilidades activas") THEN								//El par$$HEX1$$e100$$ENDHEX$$metro de indisponibilidades activas est$$HEX2$$e1002000$$ENDHEX$$activo
	tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible = TRUE	//Se visibiliza el tab de indisponibilidades	
	IF ib_incidencia_en_historicos THEN
			fw_cambiar_select_dw_datos_indisp()
			fw_cambiar_select_dw_lista_indisp()
		END IF
		
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.InsertRow(0)
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.SetTransobject(sqlca)
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
		
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.InsertRow(0)
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTransObject(sqlca)
		li_numeroIndisponibilidades = tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.retrieve(tab_1.il_nro_incidencia)

		tab_1.of_cargar_indisponibilidad(ll_codigo)
		ll_fila=tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.find("nro_incidencia= " + string(ll_codigo),0,tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.RowCount()) 
		if ll_fila> 0 then
			tab_1.tabpage_indisponibilidades.dw_Datos_indisponibilidades.SetRow(ll_fila)
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.ScrollToRow(ll_fila)
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
		else
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
		end if
		tab_1.tabpage_indisponibilidades.visible=true
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTabOrder("tip_interrupcion",0)
//		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.visible=false
		tab_1.tabpage_indisponibilidades.tv_2.visible=true
		tab_1.tabpage_indisponibilidades.p_1.visible=true
		tab_1.tabpage_indisponibilidades.p_2.visible=true
		tab_1.tabpage_indisponibilidades.p_3.visible=true
		tab_1.tabpage_indisponibilidades.p_4.visible=true
		tab_1.tabpage_indisponibilidades.p_5.visible=true
		tab_1.tabpage_indisponibilidades.p_6.visible=true
		tab_1.tabpage_indisponibilidades.p_7.visible=true
		tab_1.tabpage_indisponibilidades.p_8.visible=true
		tab_1.tabpage_indisponibilidades.p_9.visible=true
		tab_1.tabpage_indisponibilidades.p_10.visible=true
		tab_1.tabpage_indisponibilidades.st_5.visible=true
		tab_1.tabpage_indisponibilidades.st_6.visible=true
		tab_1.tabpage_indisponibilidades.st_7.visible=true
		tab_1.tabpage_indisponibilidades.st_8.visible=true
		tab_1.tabpage_indisponibilidades.st_9.visible=true
		tab_1.tabpage_indisponibilidades.st_10.visible=true
		tab_1.tabpage_indisponibilidades.st_11.visible=true
		tab_1.tabpage_indisponibilidades.st_12.visible=true
		tab_1.tabpage_indisponibilidades.st_13.visible=true
		tab_1.tabpage_indisponibilidades.st_14.visible=true
		tab_1.tabpage_indisponibilidades.cb_maniobras.visible = TRUE		
		tab_1.tabpage_indisponibilidades.cb_maniobras.enabled = FALSE
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.enabled=false
		tab_1.tabpage_indisponibilidades.em_1.enabled=false
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible = TRUE
		
		
		if ib_incidencia_en_historicos then
			select ENR
			INTO :tab_1.il_ENR
			FROM GI_HIST_INCIDENCIAS
			WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
			using sqlca;
		else
			select ENR
			INTO :tab_1.il_ENR
			FROM SGD_INCIDENCIA
			WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
			using sqlca;
		end if
		
		IF sqlca.sqlcode<0 then
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido obtener datos de la incidencia")
		ELSE
			tab_1.tabpage_indisponibilidades.em_1.text= string(tab_1.il_ENR)
		END IF		
		
		tab_1.tabpage_indisponibilidades.st_16.enabled=FALSE
		if li_numeroIndisponibilidades = 0 then						//Comprueba si hay indisponibilidades
				tab_1.tabpage_indisponibilidades.enabled = FALSE	//Se invisibiliza el tab de indisponibilidades	
		end if
ELSE
	tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible = FALSE	//Se invisibiliza el tab de indisponibilidades	
END IF
*/
//// GNU 31-10-2006. Mejora EPSA
//if fg_verifica_parametro("indisponibilidades activas") and & 
//	tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension")= fgci_alta_tension then
//	if fw_incidencia_de_operaciones() then
//	//poner el c$$HEX1$$f300$$ENDHEX$$digo
//	else
//		
//		IF ib_incidencia_en_historicos THEN
//			fw_cambiar_select_dw_datos_indisp()
//			fw_cambiar_select_dw_lista_indisp()
//		END IF
//		
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.InsertRow(0)
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.SetTransobject(sqlca)
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
//		
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.InsertRow(0)
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTransObject(sqlca)
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
//
//		tab_1.of_cargar_indisponibilidad(ll_codigo)
//		ll_fila=tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.find("nro_incidencia= " + string(ll_codigo),0,tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.RowCount()) 
//		if ll_fila> 0 then
//			tab_1.tabpage_indisponibilidades.dw_Datos_indisponibilidades.SetRow(ll_fila)
//			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.ScrollToRow(ll_fila)
//			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
//		else
//			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
//		end if
//		tab_1.tabpage_indisponibilidades.visible=true
//		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTabOrder("tip_interrupcion",0)
//		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.visible=false
//		tab_1.tabpage_indisponibilidades.tv_2.visible=true
//		tab_1.tabpage_indisponibilidades.p_1.visible=true
//		tab_1.tabpage_indisponibilidades.p_2.visible=true
//		tab_1.tabpage_indisponibilidades.p_3.visible=true
//		tab_1.tabpage_indisponibilidades.p_4.visible=true
//		tab_1.tabpage_indisponibilidades.p_5.visible=true
//		tab_1.tabpage_indisponibilidades.p_6.visible=true
//		tab_1.tabpage_indisponibilidades.p_7.visible=true
//		tab_1.tabpage_indisponibilidades.p_8.visible=true
//		tab_1.tabpage_indisponibilidades.p_9.visible=true
//		tab_1.tabpage_indisponibilidades.p_10.visible=true
//		tab_1.tabpage_indisponibilidades.st_5.visible=true
//		tab_1.tabpage_indisponibilidades.st_6.visible=true
//		tab_1.tabpage_indisponibilidades.st_7.visible=true
//		tab_1.tabpage_indisponibilidades.st_8.visible=true
//		tab_1.tabpage_indisponibilidades.st_9.visible=true
//		tab_1.tabpage_indisponibilidades.st_10.visible=true
//		tab_1.tabpage_indisponibilidades.st_11.visible=true
//		tab_1.tabpage_indisponibilidades.st_12.visible=true
//		tab_1.tabpage_indisponibilidades.st_13.visible=true
//		tab_1.tabpage_indisponibilidades.st_14.visible=true
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.enabled=false
//		
//		if ib_incidencia_en_historicos then
//			select ENR
//			INTO :tab_1.il_ENR
//			FROM GI_HIST_INCIDENCIAS
//			WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
//			using sqlca;
//		else
//			select ENR
//			INTO :tab_1.il_ENR
//			FROM SGD_INCIDENCIA
//			WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
//			using sqlca;
//		end if
//		
//		IF sqlca.sqlcode<0 then
//			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido obtener datos de la incidencia")
//		ELSE
//			tab_1.tabpage_indisponibilidades.em_1.text= string(tab_1.il_ENR)
//		END IF		
//		
//		tab_1.tabpage_indisponibilidades.st_16.enabled=false
//	end if
//end if
		
//FIN GNU


// Si estoy dando de alta una incidencia sobre una instalacion 
// que ya tiene una OT asignada, seteo los estados en operaciones
// Esto se debe hacer aqui porque ya cargue la dw de seguimiento

//W_BARRA.uo_barra.barra.f_amplia(96)		

// Cargo las fechas de los estados 
/*
IF tab_1.ii_tipo_incid <> fgci_incidencia_programada THEN
	tab_1.idt_fec_deteccion = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_pendiente,"f_alta")
END IF

IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
	tab_1.idt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_enviado_brigada,"f_alta")
END IF

IF tab_1.ii_alcance = fgci_incidencia_de_suministro or tab_1.ii_tipo_incid = fgci_incidencia_calidad &
	or (tab_1.ii_alcance = fgci_incidencia_sin_interrupcion AND tab_1.ii_tipo_incid <> fgci_incidencia_imprevista) THEN
	// Deshabilito la opcion de marcar interrupciones
	tab_1.of_iniciar_estados_oper()
	tab_1.tabpage_interrupciones.visible = False
END IF
*/ //Agregar mas tarde
//if tab_1.ii_alcance=fgci_incidencia_con_interrupcion then // si es incidencia con p$$HEX1$$e900$$ENDHEX$$rdida
//	tab_1.idt_fecha_er = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_en_reposicion,"f_alta")
//	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
//	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
//else
//	tab_1.idt_fecha_sr = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_servicio_repuesto,"f_alta")
//	tab_1.idt_fecha_resuelta = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_resuelta,"f_alta")
//	SetNull(tab_1.idt_fecha_er)
//end if

//W_BARRA.uo_barra.barra.f_amplia(98)

// Cargo fechas de estados mantenimiento
/*
tab_1.idec_nro_instalacion_afectada = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins")
//tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot")

tab_1.frn_habilitar_obs_accion(False)

// Solo para eliminar el problema de que aparece el formulario en blanco
tab_1.tabpage_formulario.d_inf_general.SetRedraw(true)*/ //Agregar mas tarde
//W_BARRA.uo_barra.barra.f_amplia(99)

// Pregunto por si la incidencia viene del m$$HEX1$$f300$$ENDHEX$$dulo de descargos
/*
if tab_1.ii_tipo_incid=fgci_incidencia_programada then
	tab_1.fnu_inc_descargos()
end if

if lu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim" then
	lm_menu.m_consultar.m_instalacionafectada.enabled=false
end if

tab_1.tabpage_observaciones.mle_observaciones.Text = tab_1.f_devolver_observaciones(tab_1.tabpage_formulario.d_inf_general)	
tab_1.tabpage_observaciones.mle_observaciones_mnto.Text = tab_1.f_devolver_observaciones_mnto(tab_1.tabpage_formulario.d_inf_general)	
*/ //Agregar mas tarde
//if tab_1.ii_estado_oper >= fgci_incidencia_enviado_brigada &
//	and NOT isnull(tab_1.tabpage_formulario.d_inf_general.object.st_causa.text) &
//	and tab_1.tabpage_formulario.d_inf_general.object.st_causa.text <> "" &
//	and lu_comunic.is_comunic.Accion_llamada<> "Consulta" then
//	
//	tab_1.tabpage_formulario.st_2.visible = true
//end if
//

/////////////////////////////////////////////////////////////////////////////////////
//HLA.INI.DEO-000000641 SE MODIFICA PARA MOSTRAR MANIOBRAS DE HISTORICOS(07/11/2013)
/*		ll_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia")
		
		SELECT "GI_HIST_INCIDENCIAS"."NRO_INCIDENCIA"
		INTO  :ll_incid
      FROM   GI_HIST_INCIDENCIAS
      WHERE  NRO_INCIDENCIA = :ll_nro_incidencia;*/ //Agregar mas tarde


//Solo muestro el TAB de Maniobras cuando exista alguna y este OPERACION integrado
/*if fw_incidencia_de_operaciones() then

      //AHM Incidencia 0/100168086 (11/02/2010)
      //if tab_1.ii_alcance = fgci_incidencia_con_interrupcion then
         tab_1.tabpage_maniobras.visible = true
      //END IF
				
//AHM(22/05/2008)
	if fg_verifica_parametro("Indisponibilidades activas") = true then
		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_causa_nuevo'
	else
		IF ll_incid = 0 THEN 
			
				tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_nuevo'
				//	fw_maniobras(ll_nro_incidencia)
				fw_maniobras(tab_1.il_nro_incidencia)
		ELSE
				
			tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_nuevo_hi'	
			
			end if
	END IF


//	fw_maniobras(tab_1.il_nro_incidencia)														//Se modifica la sql del dw de maniobras para que aparezcan las maniobras que correspondan en cada pais
	tab_1.tabpage_maniobras.dw_maniobras.settransobject(Sqlca) // FDO
//		tab_1.tabpage_maniobras.dw_maniobras.retrieve(tab_1.il_nro_incidencia) //FDO
//AHM
IF ib_incidencia_en_historicos = TRUE THEN
	
	tab_1.tabpage_maniobras.dw_maniobras.retrieve(ll_nro_incidencia)
	
ELSE
		tab_1.tabpage_maniobras.dw_maniobras.retrieve()
END IF
//Fin AHM	
//HLA.FIN.DEO-000000641	(07/11/2013)	

		
		
//		tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Retrieve(tab_1.il_nro_incidencia, fgci_tipo_ct, &
//													fgci_tipo_subestacion_at,fgci_tipo_salida_at, fgci_tipo_subestacion, &
//													fgci_tipo_salida_mt,fgci_tipo_ct,fgci_tipo_transformador,fgci_tipo_salida_de_baja)

		tab_1.tabpage_maniobras.enabled = true
end if*/ //Agregar mas tarde

///////////////////////////////////////////////////////////////////////////////////////
/*IF ib_incidencia_en_historicos THEN
	iu_inc_2005_nu.fnu_cargo_det_interr_rs_hist(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  
ELSE
	iu_inc_2005_nu.fnu_cargo_det_interr_rs(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  
END IF

if tab_1.f_inserta_datos_brig() = false then
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=0")
else
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=1")
end if*/ //Agregar mas tarde
/*
if gb_mantenimiento = true and tab_1.ii_tipo_incid<>fgci_incidencia_calidad &
	and tab_1.ii_tipo_incid<>fgci_incidencia_programada &
	and tab_1.ii_alcance <> fgci_incidencia_de_suministro and &
	tab_1.ii_alcance <> fgci_incidencia_reenganche then
	
	tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible = true
	tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = true
end if*/  //Agregar mas tarde

boolean bEnabled 
bEnabled  = tab_1.tabpage_interrupciones.Enabled 
tab_1.f_deshab_tabs(true)
bEnabled  = tab_1.tabpage_interrupciones.Enabled 

//if gb_operaciones = true and tab_1.ii_estado_oper = fgci_incidencia_enviado_brigada and tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension") = 2 then
//		lm_menu.m_archivo.m_grabar.enabled = false
//end if

//HLA.INI.DDAG-6453.22/09/2016
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.protect=1")
tab_1.tabpage_formulario.st_18.enabled = false
//HLA.FIN.DDAG-6453.22/09/2016

//TDA-EDM1-24-04-2017
tab_1.tabpage_formulario.d_inf_general.modify("rep_red.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("rep_red.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.protect=1")
//END-TDA-EDM1-24-04-2017
tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("desc.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("desc.protect=0")
tab_1.tabpage_formulario.d_inf_general.modify("desc.edit.displayonly=yes")
tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.protect=1")
tab_1.tabpage_formulario.st_1.visible= false
tab_1.tabpage_formulario.st_2.visible= false
lm_menu.m_consultar.m_instalacionafectada.enabled = false
lm_menu.m_archivo.m_grabar.enabled = false
tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.protect=1")
tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.background.color="+gs_gris)
tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.protect=1")
tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.background.color="+gs_gris)
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//tab_1.tabpage_observaciones.mle_observaciones.backcolor = rgb(192,192,192)
tab_1.tabpage_observaciones.mle_observaciones.backcolor = long(gs_gris)
// Fin. Sgo.
tab_1.tabpage_observaciones.mle_observaciones.textcolor = rgb(0,0,255)
tab_1.tabpage_ot.rb_1.enabled = FALSE
tab_1.tabpage_ot.rb_2.enabled = FALSE
tab_1.tabpage_formulario.d_inf_general.Modify("fase_sugerida_t.Visible=false")
tab_1.tabpage_formulario.d_inf_general.Modify("fase_sugerida.Visible=false")
// Se comprueba si se trata de una incidencia agrupada con p$$HEX1$$e900$$ENDHEX$$rdida en estado RS. En caso
// de ser as$$HEX2$$ed002000$$ENDHEX$$se hace visible la opci$$HEX1$$f300$$ENDHEX$$n de men$$HEX2$$fa002000$$ENDHEX$$que permite consultar las incidencias
// agrupadas
IF tab_1.ii_alcance = fgci_incidencia_con_interrupcion &
	AND tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"sgd_incidencia_nro_agrupacion") > 0 THEN 
	
	lm_menu.m_consultar.m_incidenciasagrupadas.visible = TRUE
	lm_menu.m_consultar.m_incidenciasagrupadas.toolbaritemvisible = true
ELSE
	lm_menu.m_consultar.m_incidenciasagrupadas.visible = FALSE
	lm_menu.m_consultar.m_incidenciasagrupadas.toolbaritemvisible = FALSE
END IF

//lm_menu.m_consultar.m_interrupcionesdeldescargo.visible = (tab_1.ii_tipo_incid=fgci_incidencia_programada)
//lm_menu.m_consultar.m_interrupcionesdeldescargo.toolbaritemvisible = (tab_1.ii_tipo_incid=fgci_incidencia_programada)
//lm_menu.m_consultar.m_interrupcionesdeldescargo.enabled = (tab_1.ii_tipo_incid=fgci_incidencia_programada)
lm_menu.m_consultar.m_descargoasociado.visible = (tab_1.ii_tipo_incid=fgci_incidencia_programada)
lm_menu.m_consultar.m_descargoasociado.toolbaritemvisible = (tab_1.ii_tipo_incid=fgci_incidencia_programada)
lm_menu.m_consultar.m_descargoasociado.enabled = (tab_1.ii_tipo_incid=fgci_incidencia_programada)

//***************************************
//**  OSGI 2001.1  	08/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Double ld_pxt, ld_cxt


//If tab_1.ib_pestana_otros Then
//	tab_1.tabpage_otros.dw_otros.SetTransObject(SQLCA)
//
//	If tab_1.tabpage_otros.dw_otros.Retrieve(tab_1.il_nro_incidencia) <= 0 Then
//		tab_1.tabpage_otros.dw_otros.InsertRow(0)
//	End If
//		
//	tab_1.fu_perfil_consulta(tab_1.tabpage_otros.dw_otros)
//	//AHU  0/100038003 (17/02/2009)
//	IF gi_pais = 8 THEN			//Comprobamos que estamos en Moldavia
//		tab_1.tabpage_otros.dw_otros.object.agente_t.text = 'Soluci$$HEX1$$f300$$ENDHEX$$n:'
//		tab_1.tabpage_otros.dw_otros.modify("t_area.text = 'Descripci$$HEX1$$f300$$ENDHEX$$n Medidas:'")
//	END IF
//	//Fin AHU
//End If

//***************************************
//**                   TDA 11/01/2019			                  **
//***************************************
/*
If tab_1.ib_pestana_otros Then
	tab_1.tabpage_formulario.dw_informe_tecnico.SetTransObject(SQLCA)

	If tab_1.tabpage_formulario.dw_informe_tecnico.Retrieve(tab_1.il_nro_incidencia) <= 0 Then
		tab_1.tabpage_formulario.dw_informe_tecnico.InsertRow(0)
	End If
		
	tab_1.fu_perfil_consulta(tab_1.tabpage_formulario.dw_informe_tecnico)
	//AHU  0/100038003 (17/02/2009)
	IF gi_pais = 8 THEN			//Comprobamos que estamos en Moldavia
		tab_1.tabpage_formulario.dw_informe_tecnico.object.agente_t.text = 'Soluci$$HEX1$$f300$$ENDHEX$$n:'
		tab_1.tabpage_formulario.dw_informe_tecnico.modify("t_area.text = 'Descripci$$HEX1$$f300$$ENDHEX$$n Medidas:'")
	END IF
	//Fin AHU
End If
*/ //agregar mas tarde


//If tab_1.ib_nuevos_tip_inc Then
//	fw_aviso_alum_pub()
//
//	If tab_1.ii_tipo_incid <> fgci_incidencia_alum_pub Then
//		tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia.Protect = 0
//		fg_filtro_ext(tab_1.tabpage_formulario.d_inf_general, "nuevos_tip_inc", "tipo_incidencia")
//	End If
//Else
//	fg_filtro_ext(tab_1.tabpage_formulario.d_inf_general, "not_nuevos_tip_inc", "tipo_incidencia")
//End If

/*
If tab_1.ib_pxt_cxt And Lower(This.ClassName()) = 'w_2301_hist_form_incidencia' Then
	ld_pxt = Round(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, "c_ext_paxtc") / 60, 1)
	ld_cxt = Round(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, "c_ext_duracion") / 60, 1)

	tab_1.tabpage_formulario.st_pxt_valor.Text = String(ld_pxt, "###,##0.0")
	tab_1.tabpage_formulario.st_cxt_valor.Text = String(ld_cxt, "###,##0.0")
End If*/ //Agregar mas tarde

//***************************************
//**  OSGI 2001.1  	08/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
/*
this.setredraw(true)
this.setfocus()

IF ib_incidencia_en_historicos THEN
	dw_1.dataObject ='d_hist_interrupcion'
ELSE
	dw_1.dataObject = 'd_interrupcion_rs'
END IF*/ //Agregar mas tarde
/*
dw_1.setTransObject (SQLCA)
dw_1.Retrieve(lu_comunic.is_comunic.longval3)

IF NOT gb_red_trifasica AND tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 	then
	tab_1.tabpage_interrupciones.d_datos_interrup.setItem (1, 'fase_seleccionada', 1)
END IF

tab_1.tabpage_formulario.st_fases.visible=False
tab_1.tabpage_ot.dw_ambito.visible = False
*/ //Agregar mas tarde
//W_BARRA.uo_barra.barra.f_amplia(100)
//w_barra.visible=false
//CLOSE (W_BARRA)
// GNU 3-8-2006
/*
IF tab_1.tabpage_interrupciones.dw_lista_int_operaciones.RowCount() > 0 THEN
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.event rowfocuschanged(1)
END IF*/  //Agregar mas tarde 

//AHM
/*
IF gi_pais = 8 THEN
	tab_1.tabpage_ot.d_datos_ot.Object.est_ot_t.text = 'Prepara LM'
	tab_1.tabpage_ot.d_datos_ot.Object.est_ot.visible = FALSE
	tab_1.tabpage_ot.d_datos_ot.Object.f_prepara_lm.visible = TRUE
END IF*/ //Agregar mas tarde



//AHM (10/06/2009) OCEN -> La comunicaci$$HEX1$$f300$$ENDHEX$$n de los estados de los descargos se realiza mediante un batch
//long ll_nro_descargo
//
//// A$$HEX1$$f100$$ENDHEX$$adido por RCA (09-06-2008) 
//SELECT count(*)
//INTO :ll_nro_descargo
//FROM "SGD_DESCARGOS"  
//WHERE "SGD_DESCARGOS"."NRO_INCIDENCIA" = :lu_comunic.is_comunic.longval3 and 
//      "SGD_DESCARGOS"."NRO_OT_OCEN" IS NOT NULL;
//
//// Compruebo si se han enviado los ultimos estados del descargo, si no es asi ha habido algun
//// error en el servidor o en la conexion, por eso abrimos la ventana de envio de estado del descargo
//if ll_nro_descargo <> 0 then
//	
//	SELECT NVL("SGD_DESCARGOS"."NRO_DESCARGO",0)
//   INTO :ll_nro_descargo
//   FROM "SGD_DESCARGOS"  
//   WHERE "SGD_DESCARGOS"."NRO_INCIDENCIA" = :lu_comunic.is_comunic.longval3 and 
//         "SGD_DESCARGOS"."NRO_OT_OCEN" IS NOT NULL;
//	
//	openwithparm(w_7107_envio_estado_descargo_ocen, ll_nro_descargo)
//end if
//// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (09-06-2008)

//AHM (03/12/2008)
/*
IF gi_pais = 8 THEN	//Es Moldavia
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.modify("cant_cli_t.text= '   NIS activ actual'")
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.modify("cant_clientes_afectados_t.text= 'NIS total actual'")
	tab_1.tabpage_interrupciones.d_datos_interrup.modify("ccant_cli_t.text= 'NIS activ descon'")
	tab_1.tabpage_interrupciones.d_datos_interrup.modify("cccli_afec_t.text= 'NIS total descon'")
	//AHU  0/100038003 (17/02/2009)
	tab_1.tabpage_otros.Text = 'SEC'
	//Fin AHU
END IF*/  //Agregar mas tarde

//AHM (23/07/2009) Mejora1/578447
/*IF fg_verifica_parametro ('CAMBIO CAUSA INCIDENCIA RESUELTA') THEN
	
	tab_1.tabpage_formulario.st_1.visible = TRUE
	
END IF*/ //Agregar mas tarde

//AHM (03/11/2011) Integracion OSGI - OSGM
/*IF isNull(tab_1.tabpage_formulario.d_inf_general.getItemNumber(1, "estado_mantenimiento")) THEN
	tab_1.tabpage_formulario.d_inf_general.setItem(1, "estado_mantenimiento", 1)
END IF*/ //Agregar mas tarde

tab_1.tabpage_interrupciones.dw_lista_int_operaciones.visible=false
tab_1.tabpage_interrupciones.visible=false
tab_1.tabpage_maniobras.visible=false
tab_1.tabpage_acciones.enabled=true

close(w_msg)


end event

event ue_suministros_importantes;long ll_nro_incidencia
int li_cantidad   //cantidad de sum_imp afectados por la incidencia

SetPointer(HourGlass!)
ll_nro_incidencia=tab_1.il_nro_incidencia

IF ib_incidencia_en_historicos THEN	
	
	fgnu_resetear_s_comunicaciones(gu_comunic)	
	gu_comunic.is_comunic.longval1=ll_nro_incidencia
	gu_comunic.is_comunic.programa_llamante="iw_1234"
	gu_comunic.is_comunic.intval1=tab_1.ii_nro_centro
	gu_comunic.is_comunic.intval2=tab_1.ii_nro_cmd
	gu_comunic.is_comunic.intval3=tab_1.ii_nro_mesa
	gu_comunic.is_comunic.Accion_llamada="Consulta"
	ib_incidencia_en_historicos = TRUE
	IF ib_incidencia_en_historicos = TRUE THEN
		//chequeo si existen suministros importantes afectados por la incidencia en hist$$HEX1$$f300$$ENDHEX$$ricos
		SELECT COUNT(*) 
		into :li_cantidad 
		FROM GI_HIST_SUM_IMP 
		WHERE NRO_INCIDENCIA=:ll_nro_incidencia;
		
		if li_cantidad>0 THEN
			Open(w_3202_hist_mant_suministros_imp)
		ELSE
			gnv_msg.f_mensaje("EI31","","",OK!)
		END IF
	
	END IF
	
ELSE

	fgnu_resetear_s_comunicaciones(gu_comunic)	
	gu_comunic.is_comunic.longval1=ll_nro_incidencia
	gu_comunic.is_comunic.Datval1 = tab_1.tabpage_formulario.d_inf_general.GetItemDateTime(1, 'f_deteccion')
	gu_comunic.is_comunic.programa_llamante="iw_1234"
	gu_comunic.is_comunic.intval1=tab_1.ii_nro_centro
	gu_comunic.is_comunic.intval2=tab_1.ii_nro_cmd
	gu_comunic.is_comunic.intval3=tab_1.ii_nro_mesa
	gu_comunic.is_comunic.Accion_llamada="Consulta"
	Open(w_3202_mantenimiento_suministros_imp)

END IF

end event

event ue_consulta_avisos;long ll_cantidad = 0

SetPointer(HourGlass!)

gu_comunic.is_comunic.longval1=0
gu_comunic.is_comunic.longval2=tab_1.il_nro_incidencia
//gu_comunic.is_comunic.programa_llamante="iw_1234"

gu_comunic.is_comunic.Accion_llamada=lu_comunic.is_comunic.Accion_llamada

IF ib_incidencia_en_historicos THEN
	SELECT count(*) INTO :ll_cantidad FROM gi_hist_avisos WHERE nro_incidencia=:tab_1.il_nro_incidencia;
ELSE
	SELECT count(*) INTO :ll_cantidad FROM gi_avisos WHERE nro_incidencia=:tab_1.il_nro_incidencia;
END IF

IF ll_cantidad>0 THEN
	gu_comunic.is_comunic.strval1 = "historico"
	
	open(w_2307_consulta_avisos)
	
	//gu_comunic.is_comunic.strval1 = ""
ELSE
	gnv_msg.f_mensaje("AI26"," "," ",OK!)
END IF

end event

event ue_descargos;long ll_nro_descargo,ll_nro_instalacion
string ls_nombre_inst

SELECT SGD_DESCARGOS.NRO_DESCARGO,
			SGD_DESCARGOS.COD_INST_ORIGEN,
			SGD_INSTALACION.NOM_INSTALACION
INTO :ll_nro_descargo,:ll_nro_instalacion,:ls_nombre_inst
FROM SGD_DESCARGOS,SGD_INSTALACION
WHERE SGD_DESCARGOS.NRO_INCIDENCIA = :tab_1.il_nro_incidencia and
			SGD_INSTALACION.NRO_INSTALACION = SGD_DESCARGOS.COD_INST_ORIGEN;

IF SQLCA.SQLCode < 0 THEN
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido determinar el descargo asociado a la incidencia")
	return
ELSEIF SQLCA.SQLCode = 100 THEN
	
	SELECT GI_HIST_DESCARGOS.NRO_DESCARGO,
			GI_HIST_DESCARGOS.COD_INST_ORIGEN,
			SGD_INSTALACION.NOM_INSTALACION
	INTO :ll_nro_descargo,:ll_nro_instalacion,:ls_nombre_inst
	FROM GI_HIST_DESCARGOS,SGD_INSTALACION
	WHERE GI_HIST_DESCARGOS.NRO_INCIDENCIA = :tab_1.il_nro_incidencia and
			SGD_INSTALACION.NRO_INSTALACION = GI_HIST_DESCARGOS.COD_INST_ORIGEN;
			
	IF SQLCA.SQLCode <> 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido determinar el descargo asociado a la incidencia")
		return
	END IF
END IF


//gu_comunic.is_comunic.accion_llamada="modificacion" // Accion a ejecutar
gu_comunic.is_comunic.longval1 = ll_nro_descargo
gu_comunic.is_comunic.decval1 = ll_nro_instalacion
gu_comunic.is_comunic.strval5 = ls_nombre_inst
gu_comunic.is_comunic.strval6 = "lista_descargos"

Open(w_7106_consulta_historicos)
end event

event close;call super::close;long 	ll_causa					//C$$HEX1$$f300$$ENDHEX$$digo de la causa que ha producido la incidencia
long	ll_respuesta

//AHM (15/06/2010) ASUR 723151
int	li_registros			//N$$HEX1$$fa00$$ENDHEX$$mero de registros encontrados
long	ll_familia				//Familia de la causa

IF isValid(gu_comunic1) THEN
	gu_comunic1.is_comunic.intval9=0
END IF

//AHM(23/07/2009) Mejora 1/578447
IF fg_verifica_parametro('CAMBIO CAUSA INCIDENCIA RESUELTA') THEN
	ll_respuesta = messageBox("Aviso", "$$HEX1$$bf00$$ENDHEX$$Desea guardar las modificaciones realizadas?", question!, YesNo!)
	
	IF ll_respuesta = 1 THEN
		
		tab_1.tabpage_formulario.d_inf_general.acceptText()
		ll_causa = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"causa")
		//AHM (15/06/2010) ASUR 723151
		if gi_pais = 6 or gi_pais = 7 or gi_pais = 9 then
			Select subtipo
			into :ll_familia
			from GI_CAUSA
			where GI_CAUSA.COD_CAUSA =: ll_causa ;
		else
			Select GPO_CAUSA 
			into :ll_familia
			from GI_CAUSA
			where GI_CAUSA.COD_CAUSA =: ll_causa ;
		end if
		
		SELECT count(*)
		INTO 	:li_registros
		FROM sgd_incidencia
		WHERE nro_incidencia = :tab_1.il_nro_incidencia;
		
		IF SQLCA.sqlcode = 0 and li_registros > 0 THEN
			
			UPDATE sgd_incidencia
			SET cod_causa = :ll_causa,
			fam_causa = :ll_familia,
			programa = 'iw_2301_hist',
			usuario = :gs_usuario,
			f_actual = sysdate
			WHERE nro_incidencia = :tab_1.il_nro_incidencia;
		ELSE
			UPDATE gi_hist_incidencias
			SET cod_causa = :ll_causa,
			fam_causa = :ll_familia,
			programa = 'iw_2301_hist',
			usuario = :gs_usuario,
			f_actual = sysdate
			WHERE nro_incidencia = :tab_1.il_nro_incidencia;
		END IF
		
		COMMIT;
		
	
	END IF
	
END IF
end event

event open;call super::open;
if(bandera) then
	numeroIncidencia = st_parametros.l_nro_incidencia
	em_incidencia.text = String(numeroIncidencia)
	if st_parametros.historico then
		cb_historicos.triggerevent(Clicked!)
	end if
end if

end event

type st_bloqueo from w_2301_form_incidencia`st_bloqueo within w_2301_hist_form_incidencia
end type

type d_ambito from w_2301_form_incidencia`d_ambito within w_2301_hist_form_incidencia
integer taborder = 40
end type

type dw_brigadas_calendario_rango from w_2301_form_incidencia`dw_brigadas_calendario_rango within w_2301_hist_form_incidencia
integer taborder = 50
end type

type uo_barra from w_2301_form_incidencia`uo_barra within w_2301_hist_form_incidencia
integer taborder = 30
end type

type tab_1 from w_2301_form_incidencia`tab_1 within w_2301_hist_form_incidencia
integer x = 571
end type

event tab_1::selectionchanged;call super::selectionchanged;int li_tension

li_tension = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tip_tension")

IF tab_1.control[newindex]=tab_1.tabpage_interrupciones THEN
	IF NOT fw_incidencia_de_operaciones() THEN
		dw_1.visible=true
		dw_1.height=996
		tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.visible=false
		tab_1.tabpage_interrupciones.dw_lista_acometidas.visible = false
		tab_1.tabpage_interrupciones.d_lista_otras_inst.visible=false
		tab_1.tabpage_interrupciones.st_otras_inst.visible=false
		tab_1.tabpage_interrupciones.rb_otras_inc.visible=false
		tab_1.tabpage_interrupciones.rb_misma_inc.visible=false
		tab_1.tabpage_interrupciones.uo_eltos_corte.x= 1134
		tab_1.tabpage_interrupciones.uo_eltos_corte.y= 1008
		tab_1.tabpage_interrupciones.cb_1.x=1842
		tab_1.tabpage_interrupciones.cb_1.y=1532
	ELSE
		dw_1.visible=false	
	END IF
//	tab_1.tabpage_interrupciones.tv_1.Visible = false
ELSE 
	dw_1.visible=false
END IF

// Hago invisible el boton de otras maniobras
IF tab_1.control[newindex]=tab_1.tabpage_maniobras THEN
	tab_1.tabpage_maniobras.cb_otras_man.visible=false
END IF

IF dw_1.visible = true THEN
	IF gb_red_trifasica =true THEN
		dw_1.Modify("fase_afectada.Visible=false")
	ELSE
		dw_1.Modify("fase_afectada.Visible=true")
	END IF
END IF

if tab_1.control[newindex]=tab_1.tabpage_ocen then
	tab_1.tabpage_ocen.uo_ot_ocen.il_incidencia_nro=il_nro_incidencia
	tab_1.tabpage_ocen.uo_ot_ocen.ii_estado_incidencia=ii_estado_oper
	tab_1.tabpage_ocen.uo_ot_ocen.il_validacion=fnu_valida_sr()
	tab_1.tabpage_ocen.uo_ot_ocen.is_descripcion=tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"desc")   
   tab_1.tabpage_ocen.uo_ot_ocen.il_nro_instalacion=idec_nro_instalacion_afectada
	tab_1.tabpage_ocen.uo_ot_ocen.triggerEvent("ue_carga_datos")
end if

end event

type cb_1 from w_2301_form_incidencia`cb_1 within w_2301_hist_form_incidencia
end type

type em_incidencia from w_2301_form_incidencia`em_incidencia within w_2301_hist_form_incidencia
end type

event em_incidencia::click_enter;call super::click_enter;if estamos_historicos=true then
IF KeyDown(KeyEnter!)=true then
           cb_historicos.postevent('clicked')
end if

IF consulta_hecha_historicos=true THEN
    IF KeyDown(KeyBack!)=true then
	     if len(this.text)=1 then
			 limpiar_data_window_incidencia(1)
		 end if
    end if
END IF
end if
end event

type st_1 from w_2301_form_incidencia`st_1 within w_2301_hist_form_incidencia
end type

type cbx_historicos from w_2301_form_incidencia`cbx_historicos within w_2301_hist_form_incidencia
end type

event cbx_historicos::clicked;call super::clicked;if this.checked=false then
	OpenSheet (w_2301_form_incidencia, w_genapp_frame, menu, layered!)	
     this.checked=true
	
end if
end event

type gb_1 from w_2301_form_incidencia`gb_1 within w_2301_hist_form_incidencia
end type

type dw_1 from u_hist_interrupcion within w_2301_hist_form_incidencia
boolean visible = false
integer x = 608
integer y = 168
integer width = 4128
integer height = 1624
integer taborder = 20
string dragicon = "DataWindow5!"
boolean bringtotop = true
boolean vscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;long ll_instalacion, ll_fila
datetime ldt_f_actual

this.selectrow(0,false)
this.selectrow(currentrow,true)

IF currentrow > 0 then
	tab_1.tabpage_interrupciones.st_datos_interrup.visible=true
		
	IF tab_1.tabpage_interrupciones.d_datos_interrup.visible = FALSE THEN
			// Es para evitar que se haga un setredraw
		tab_1.tabpage_interrupciones.d_datos_interrup.visible = TRUE
		tab_1.tabpage_interrupciones.st_duracion.visible =FALSE // Se hace visible m$$HEX1$$e100$$ENDHEX$$s abajo. Esto se hace para evitar 
												// que la datawindow se quede por encima y no se muestre
												// la duraci$$HEX1$$f300$$ENDHEX$$n
	END IF
		
	tab_1.tabpage_interrupciones.d_datos_interrup.SetRedraw(FALSE)
	tab_1.tabpage_interrupciones.dw_sin_interrupcion.visible = FALSE
	tab_1.tabpage_interrupciones.st_datos_interrup.text=" Datos de la interrupci$$HEX1$$f300$$ENDHEX$$n."
	tab_1.tabpage_interrupciones.st_durac.visible = TRUE
		
	tab_1.tabpage_interrupciones.st_duracion.visible =True
	
	ll_instalacion = this.GetItemNumber(currentrow,'nro_instalacion')
	ldt_f_actual = this.GetItemDatetime(currentrow,'f_actual')
	
	string test
	test = "nro_instalacion = " + string(ll_instalacion) + " and f_actual = datetime('" + string(ldt_f_actual) + "')"
	int endt 
	endt = tab_1.tabpage_interrupciones.d_datos_interrup.rowcount()
	ll_fila = tab_1.tabpage_interrupciones.d_datos_interrup.find("nro_instalacion = " + string(ll_instalacion) + " and f_actual = datetime('" + string(ldt_f_actual) + "')" &
																					,1,tab_1.tabpage_interrupciones.d_datos_interrup.rowcount())

	tab_1.tabpage_interrupciones.st_durac.text="Duraci$$HEX1$$f300$$ENDHEX$$n Int.:"

	IF ll_fila > 0 THEN
		tab_1.of_mostrar_fases_int(ll_fila, this.GetItemString(currentrow,'fase_afectada'))
		IF NOT gb_red_trifasica THEN
			//tab_1.tabpage_interrupciones.d_datos_interrup.SetItem(ll_fila, 'fase_seleccionada', 1)
		END IF

		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_a.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_a.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_b.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_b.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_reposicion_fase_c.background.color = gs_gris
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.protect = 1
		tab_1.tabpage_interrupciones.d_datos_interrup.object.f_alta_fase_c.background.color = gs_gris
		
		tab_1.tabpage_interrupciones.d_datos_interrup.SetRow(ll_fila)
		tab_1.tabpage_interrupciones.d_datos_interrup.scrolltorow(ll_fila)
		tab_1.tabpage_interrupciones.d_datos_interrup.SetRedraw(TRUE)
	END IF

	IF gb_red_trifasica = false THEN
		tab_1.tabpage_interrupciones.d_datos_interrup.Enabled=true
	END IF

	tab_1.of_validaciones_sbt(ll_fila, tab_1.tabpage_interrupciones.d_datos_interrup)
	
//	ELSE
//		tab_1.tabpage_interrupciones.cbx_fase_a.visible = False
//		tab_1.tabpage_interrupciones.cbx_fase_b.visible = False
//		tab_1.tabpage_interrupciones.cbx_fase_c.visible = False
//		tab_1.tabpage_interrupciones.st_fases_afect.visible = FALSE
//		messagebox("fila",string(currentrow))
//		ll_instalacion = this.GetItemNumber(currentrow,'nro_instalacion')
//		
//		ll_fila = tab_1.tabpage_interrupciones.dw_sin_interrupcion.find("nro_instalacion = " + string(ll_instalacion),1,tab_1.tabpage_interrupciones.dw_sin_interrupcion.rowcount())
//		
//		if ll_fila=0 then
//		
//			tab_1.fnu_carga_sin_interrup(ll_instalacion,this.getitemnumber(currentrow,'tipo_instalacion'))
//			
//		end if
//		
//		ll_fila = tab_1.tabpage_interrupciones.dw_sin_interrupcion.find("nro_instalacion = " + string(ll_instalacion),1,tab_1.tabpage_interrupciones.dw_sin_interrupcion.rowcount())
//		if ll_fila>0 then	
//			tab_1.tabpage_interrupciones.dw_sin_interrupcion.visible = TRUE
//			tab_1.tabpage_interrupciones.dw_sin_interrupcion.scrolltorow(ll_fila)
//		end if
//		tab_1.tabpage_interrupciones.st_datos_interrup.text=" Datos de la instalaci$$HEX1$$f300$$ENDHEX$$n."
//		tab_1.tabpage_interrupciones.d_datos_interrup.visible = FALSE
//		tab_1.tabpage_interrupciones.st_durac.visible = FALSE
//		tab_1.tabpage_interrupciones.st_duracion.visible = FALSE
//		tab_1.tabpage_interrupciones.st_durac_total.visible = FALSE
//		tab_1.tabpage_interrupciones.st_duracion_total.visible = FALSE			
//		tab_1.tabpage_interrupciones.st_datos_interrup.visible=true
//	
	END IF




end event

type cb_historicos from commandbutton within w_2301_hist_form_incidencia
integer x = 73
integer y = 336
integer width = 416
integer height = 104
integer taborder = 23
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;//***************************************
//**                   TDA 11/01/2019			                  **
//***************************************

int existe_nro_incidencia_hist
long ll_incidencia_existente = 0, ll_codigo
string  ls_nom_instalacion, ls_dir_aviso
long ll_codigo_aco,ll_incid,ll_nro_incidencia
md_ingreso_incidencias lm_menu
long ll_fila // GNU 31-10-2006. Mejora EPSA
int	li_numeroIndisponibilidades		//N$$HEX1$$fa00$$ENDHEX$$mero de indisponibilidades de la incidencia

select count(*)
into :existe_nro_incidencia_hist
from sgd_incidencia 
where nro_incidencia=:em_incidencia.text
AND (EST_ACTUAL = 5 OR EST_ACTUAL = 11)
using sqlca;	

IF existe_nro_incidencia_hist=0 THEN
	
select count(*)
into :existe_nro_incidencia_hist
from GI_HIST_INCIDENCIAS 
where nro_incidencia=:em_incidencia.text
using sqlca;

END IF

if existe_nro_incidencia_hist>0 then
	/////////////////Realizar consulta en historicos
	//cbx_historicos.enabled=false
	openwithparm(w_msg,"Realizando Consulta...")
	
	IF tab_1.SelectedTab <> 1 then
		tab_1.SelectedTab = 1
	END IF
	parent.fw_inicializar_componentes()
	parent.fw_limpiar_variables()
	parent.fw_bloquear_dw()
	fw_select_original()
	
	tab_1.tabpage_acciones.d_lista_acciones_incidencia.Reset()
	tab_1.il_nro_incidencia =  Long(em_incidencia.text)
	consulta_hecha_historicos=true
	tab_1.tabpage_formulario.d_inf_general.SetRedraw(False)
	
	fw_buscar_incidencia_en_hist(long(em_incidencia.text))
	
     tab_1.is_tipo_ventana ="w_2301_hist"		
     tab_1.tabpage_formulario.d_inf_general.fnu_crea_dddw() 
	
	tab_1.tabpage_formulario.d_inf_general.f_insertar_fila()
     tab_1.ii_nro_cmd=gi_nro_cmd
     d_ambito.f_insertar_fila()
	
    ib_hubo_cambios = FALSE
    dw_brigadas_calendario_rango.SetTransObject(SQLCA)
    dw_brigadas_calendario_rango.Retrieve(Datetime(Date(fgnu_fecha_actual())), fgnu_fecha_actual())
	 
    fw_iniciar_dw_incidencia_rs(long(em_incidencia.text))
	
    SETNULL(idt_fec_prim_aviso)
	
    tab_1.tabpage_acciones.d_lista_acciones.Retrieve()
	 
    tab_1.tabpage_formulario.d_inf_general.setitem(1,"alcance",tab_1.ii_alcance)
	
   
   tab_1.il_nro_incidencia = long(em_incidencia.text)
   i_hay_datos=iu_inc_2003_nu.fnu_obtener_datos(tab_1.tabpage_formulario.d_inf_general,long(em_incidencia.text))
   tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
   tab_1.ii_tipo_incid	= tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")		
   tab_1.of_iniciar_estados_oper()
	
IF i_hay_datos=0 THEN
	
ELSE
	tab_1.il_nro_incidencia = long(em_incidencia.text)
	IF tab_1.SelectedTab <> 1 then
		tab_1.SelectedTab = 1
	END IF
	tab_1.tabpage_acciones.d_lista_acciones_incidencia.Reset()
	ll_codigo = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")
	SELECT nom_instalacion into :ls_nom_instalacion from sgd_instalacion where nro_instalacion = :ll_codigo
	and sgd_instalacion.bdi_job = 0 //DBE 11/01/2000
	;
	ls_nom_instalacion = fg_remplaza(ls_nom_instalacion, '"', ' ')	
	tab_1.tabpage_formulario.d_inf_general.object.st_instalacion_origen.text = ls_nom_instalacion
	
	tab_1.of_iniciar_estados_oper()		
	fw_hist_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.tabpage_formulario.d_inf_general.object.alcance[1]) 
	IF fw_incidencia_de_operaciones() THEN
		fw_inst_afectadas_operaciones()
	END IF
	tab_1.tabpage_formulario.d_inf_general.fpr_habilitar_campos(lu_comunic.is_comunic.Accion_llamada) 
	tab_1.ii_estado_oper = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"estado_actual")
END IF

tab_1.il_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia")

//  CARGO DE DROPDOWN CON LOS TIPOS DE INCIDENCIAS,
//	 PROGRAMADA INCLUIDA
DataWindowChild ldw_child
tab_1.tabpage_formulario.d_inf_general.GetChild ('tipo_incidencia', ldw_child)
ldw_child.SetTransObject (SQLCA)
ldw_child.Retrieve (0) //Con parametro 0 para sacar todos tipos
tab_1.ii_estado_mant = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"estado_mantenimiento")

tab_1.ii_tipo_incid = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"tipo_incidencia")
tab_1.il_nro_ot = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"ot")
tab_1.ii_alcance = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"alcance")
tab_1.of_iniciar_estados_oper()

IF tab_1.ii_alcance = fgci_incidencia_de_suministro THEN
	ls_dir_aviso =  tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"incidencia_dir_aviso") 
	
	tab_1.tabpage_formulario.d_inf_general.SetItem(1,"nombre_instalacion",ls_dir_aviso)
	tab_1.tabpage_formulario.d_inf_general.SetItem(1,"dir_instalacion",ls_dir_aviso)
	il_aviso_sum = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"primer_aviso")
	
	// Inicializo la incidencia como incidencia de Suministro.
	fw_hist_evaluo_inc_calidad(tab_1.tabpage_formulario.d_inf_general.object.tipo_incidencia[1],true,tab_1.ii_alcance) 
END IF

IF ib_incidencia_en_historicos = TRUE THEN
	fw_cambiar_select_d_lista_brigadas_ot()
	fw_cambiar_select_d_datos_ot()
END IF

// Se recuperan los datos de todos los tabpages
tab_1.tabpage_ot.d_datos_ot.Retrieve( &
		tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))
		
// DSA INI 29/03/2000	
if tab_1.tabpage_ot.d_datos_ot.RowCount() > 0 then
	if tab_1.tabpage_ot.d_datos_ot.object.tip_brigada[1] = 2 then
		tab_1.fnu_cambiar_ot_tipo('CO')
	else								
		tab_1.fnu_cambiar_ot_tipo('BR')
	end if
else
	tab_1.fnu_cambiar_ot_tipo('BR')		
end if

if tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot") > 0 and not isnull(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot")) then
	tab_1.tabpage_ot.d_lista_brigadas_ot.&
				Retrieve(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ot"))	
end if	

tab_1.tabpage_cuadrillas.d_materiales.Retrieve(tab_1.il_nro_incidencia)
tab_1.tabpage_acciones.d_lista_acciones_incidencia.Retrieve(tab_1.il_nro_incidencia)
IF fg_verifica_parametro('AFEC_PARCIAL_SUM') THEN
	tab_1.tabpage_interrupciones.dw_afec_parcial_sum.retrieve(tab_1.il_nro_incidencia)
END IF


IF tab_1.tabpage_cuadrillas.d_materiales.rowcount() > 0 THEN
	gi_con_material_averiado = 1
ELSE
	gi_con_material_averiado = 0
END IF
	
tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount()


/////////////////   INTERRUPCIONES   ////////////////

tab_1.of_componer_dw_interrupciones()
IF ib_incidencia_en_historicos = TRUE THEN
	fw_cambiar_select_d_datos_interrup()
ELSE
	fw_union_select_d_datos_interrup()
END IF


IF fw_incidencia_de_operaciones() THEN
	IF tab_1.tabpage_interrupciones.dw_lista_acometidas.RowCount() > 0 AND &
		(gi_tension_nivel_min >= fgci_baja_tension ) THEN
		ll_codigo_aco = tab_1.tabpage_interrupciones.dw_lista_acometidas.GetItemNumber(1,"codigo")
		tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia,ll_codigo_aco)
		IF tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 1 THEN
			tab_1.tabpage_interrupciones.pb_avanzar.visible = True
			tab_1.tabpage_interrupciones.pb_avanzar.enabled = True
			tab_1.tabpage_interrupciones.pb_anterior.visible = True
			tab_1.tabpage_interrupciones.pb_anterior.enabled = False
		ELSE
			tab_1.tabpage_interrupciones.pb_avanzar.visible = False
			tab_1.tabpage_interrupciones.pb_anterior.visible = False
		END IF
	END IF
	
ELSE
	tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve( Long(em_incidencia.text))
//	tab_1.tabpage_interrupciones.d_datos_interrup.Retrieve(tab_1.il_nro_incidencia)
END IF

tab_1.l_si_valido=0

tab_1.tabpage_formulario.d_inf_general.Modify("f_deteccion.background.color = " + gs_gris)

tab_1.tabpage_observaciones.mle_observaciones.displayonly = True
tab_1.tabpage_observaciones.mle_observaciones.pointer = "Arrow!"
tab_1.tabpage_interrupciones.d_datos_interrup.enabled=false

// Carga las datawindows de seguimiento con los estado existentes
// El 1 es porque desde el open de la ventana no se si resuelve mant, le paso 1 por 
// defecto y en el selectionchanged del tabpage lo evaluo
iu_ema_2002_nu.fnu_obtener_datos(tab_1.tabpage_seguimiento.d_estados_mantenimientos,0)
// Si no existe mantenimiento borra el estado cerrada

tab_1.fnu_obte_estados_mant()

//AHM (02/04/08)
IF fg_verifica_parametro("indisponibilidades activas") THEN								//El par$$HEX1$$e100$$ENDHEX$$metro de indisponibilidades activas est$$HEX2$$e1002000$$ENDHEX$$activo
	tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible = TRUE	//Se visibiliza el tab de indisponibilidades	
	IF ib_incidencia_en_historicos THEN
			fw_cambiar_select_dw_datos_indisp()
			fw_cambiar_select_dw_lista_indisp()
		END IF
		
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.InsertRow(0)
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.SetTransobject(sqlca)
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.retrieve(tab_1.il_nro_incidencia)
		
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.InsertRow(0)
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTransObject(sqlca)
     	li_numeroIndisponibilidades = tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.retrieve(tab_1.il_nro_incidencia)

		tab_1.of_cargar_indisponibilidad(ll_codigo)
		ll_fila=tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.find("nro_incidencia= " + string(ll_codigo),0,tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.RowCount()) 
		if ll_fila> 0 then
			tab_1.tabpage_indisponibilidades.dw_Datos_indisponibilidades.SetRow(ll_fila)
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.ScrollToRow(ll_fila)
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=true
		else
			tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible=false
		end if
		tab_1.tabpage_indisponibilidades.visible=true
		tab_1.tabpage_indisponibilidades.dw_lista_indisponibilidades.SetTabOrder("tip_interrupcion",0)
//		tab_1.tabpage_indisponibilidades.dw_filtro_indisponibilidades.visible=false
		tab_1.tabpage_indisponibilidades.tv_2.visible=true
		tab_1.tabpage_indisponibilidades.p_1.visible=true
		tab_1.tabpage_indisponibilidades.p_2.visible=true
		tab_1.tabpage_indisponibilidades.p_3.visible=true
		tab_1.tabpage_indisponibilidades.p_4.visible=true
		tab_1.tabpage_indisponibilidades.p_5.visible=true
		tab_1.tabpage_indisponibilidades.p_6.visible=true
		tab_1.tabpage_indisponibilidades.p_7.visible=true
		tab_1.tabpage_indisponibilidades.p_8.visible=true
		tab_1.tabpage_indisponibilidades.p_9.visible=true
		tab_1.tabpage_indisponibilidades.p_10.visible=true
		tab_1.tabpage_indisponibilidades.st_5.visible=true
		tab_1.tabpage_indisponibilidades.st_6.visible=true
		tab_1.tabpage_indisponibilidades.st_7.visible=true
		tab_1.tabpage_indisponibilidades.st_8.visible=true
		tab_1.tabpage_indisponibilidades.st_9.visible=true
		tab_1.tabpage_indisponibilidades.st_10.visible=true
		tab_1.tabpage_indisponibilidades.st_11.visible=true
		tab_1.tabpage_indisponibilidades.st_12.visible=true
		tab_1.tabpage_indisponibilidades.st_13.visible=true
		tab_1.tabpage_indisponibilidades.st_14.visible=true
		tab_1.tabpage_indisponibilidades.cb_maniobras.visible = TRUE		
		tab_1.tabpage_indisponibilidades.cb_maniobras.enabled = FALSE
		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.enabled=false
		tab_1.tabpage_indisponibilidades.em_1.enabled=false
//		tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible = TRUE
		
		
		if ib_incidencia_en_historicos then
			select ENR
			INTO :tab_1.il_ENR
			FROM GI_HIST_INCIDENCIAS
			WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
			using sqlca;
		else
			select ENR
			INTO :tab_1.il_ENR
			FROM SGD_INCIDENCIA
			WHERE NRO_INCIDENCIA= :tab_1.il_nro_incidencia
			using sqlca;
		end if
		
		IF sqlca.sqlcode<0 then
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido obtener datos de la incidencia")
		ELSE
			tab_1.tabpage_indisponibilidades.em_1.text= string(tab_1.il_ENR)
		END IF		
		
		tab_1.tabpage_indisponibilidades.st_16.enabled=FALSE
     	if li_numeroIndisponibilidades = 0 then						//Comprueba si hay indisponibilidades
				tab_1.tabpage_indisponibilidades.enabled = FALSE	//Se invisibiliza el tab de indisponibilidades	
		end if
ELSE
	tab_1.tabpage_indisponibilidades.dw_datos_indisponibilidades.visible = FALSE	//Se invisibiliza el tab de indisponibilidades	
END IF



IF tab_1.ii_tipo_incid <> fgci_incidencia_programada THEN
	tab_1.idt_fec_deteccion = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_pendiente,"f_alta")
END IF

IF tab_1.ii_incidencia_enviado_brigada > 0 THEN
	tab_1.idt_fecha_eb = tab_1.tabpage_seguimiento.d_seguimiento_operaciones.GetItemDateTime(tab_1.ii_incidencia_enviado_brigada,"f_alta")
END IF

IF tab_1.ii_alcance = fgci_incidencia_de_suministro or tab_1.ii_tipo_incid = fgci_incidencia_calidad &
	or (tab_1.ii_alcance = fgci_incidencia_sin_interrupcion AND tab_1.ii_tipo_incid <> fgci_incidencia_imprevista) THEN
	// Deshabilito la opcion de marcar interrupciones
	tab_1.of_iniciar_estados_oper()
	tab_1.tabpage_interrupciones.visible = False
END IF


tab_1.idec_nro_instalacion_afectada = tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"nombre_ins")

tab_1.frn_habilitar_obs_accion(False)

// Solo para eliminar el problema de que aparece el formulario en blanco
tab_1.tabpage_formulario.d_inf_general.SetRedraw(True)

// Pregunto por si la incidencia viene del m$$HEX1$$f300$$ENDHEX$$dulo de descargos
if tab_1.ii_tipo_incid=fgci_incidencia_programada then
	tab_1.fnu_inc_descargos()
end if


tab_1.tabpage_observaciones.mle_observaciones.Text = tab_1.f_devolver_observaciones(tab_1.tabpage_formulario.d_inf_general)	
tab_1.tabpage_observaciones.mle_observaciones_mnto.Text = tab_1.f_devolver_observaciones_mnto(tab_1.tabpage_formulario.d_inf_general)	

/////////////////////////////////////////////////////////////////////////////////////
//HLA.INI.DEO-000000641 SE MODIFICA PARA MOSTRAR MANIOBRAS DE HISTORICOS(07/11/2013)
ll_nro_incidencia = tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia")
		
SELECT "GI_HIST_INCIDENCIAS"."NRO_INCIDENCIA"
INTO  :ll_incid
FROM   GI_HIST_INCIDENCIAS
WHERE  NRO_INCIDENCIA = :ll_nro_incidencia;


//Solo muestro el TAB de Maniobras cuando exista alguna y este OPERACION integrado
if fw_incidencia_de_operaciones() then

      //AHM Incidencia 0/100168086 (11/02/2010)
      //if tab_1.ii_alcance = fgci_incidencia_con_interrupcion then
         tab_1.tabpage_maniobras.visible = true
      //END IF
				
//AHM(22/05/2008)
	if fg_verifica_parametro("Indisponibilidades activas") = true then
		tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_causa_nuevo'
	else
		IF ll_incid = 0 THEN 
			
				tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_nuevo'
				//	fw_maniobras(ll_nro_incidencia)
				fw_maniobras(tab_1.il_nro_incidencia)
		ELSE
				
			tab_1.tabpage_maniobras.dw_maniobras.dataobject= 'd_inc_2051_lista_maniobras_nuevo_hi'	
			
			end if
	END IF


//	fw_maniobras(tab_1.il_nro_incidencia)														//Se modifica la sql del dw de maniobras para que aparezcan las maniobras que correspondan en cada pais
	tab_1.tabpage_maniobras.dw_maniobras.settransobject(Sqlca) // FDO
//	tab_1.tabpage_maniobras.dw_maniobras.retrieve(tab_1.il_nro_incidencia) //FDO
//AHM
IF ib_incidencia_en_historicos = TRUE THEN
	
	tab_1.tabpage_maniobras.dw_maniobras.retrieve(ll_nro_incidencia)
	
ELSE
		tab_1.tabpage_maniobras.dw_maniobras.retrieve()
END IF
//Fin AHM	
//HLA.FIN.DEO-000000641	(07/11/2013)	
	
//		tab_1.tabpage_interrupciones.d_lista_otras_inst_ant.Retrieve(tab_1.il_nro_incidencia, fgci_tipo_ct, &
//													fgci_tipo_subestacion_at,fgci_tipo_salida_at, fgci_tipo_subestacion, &
//													fgci_tipo_salida_mt,fgci_tipo_ct,fgci_tipo_transformador,fgci_tipo_salida_de_baja)

		tab_1.tabpage_maniobras.enabled = true
end if

///////////////////////////////////////////////////////////////////////////////////////
IF ib_incidencia_en_historicos THEN
	iu_inc_2005_nu.fnu_cargo_det_interr_rs_hist(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  
ELSE
	iu_inc_2005_nu.fnu_cargo_det_interr_rs(tab_1.tabpage_formulario.dw_detalle_interr,tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"nro_incidencia"),tab_1.tabpage_formulario.dw_1,tab_1.tabpage_formulario.dw_2,tab_1.tabpage_formulario.dw_3,tab_1.tabpage_formulario.d_inf_general,tab_1.tabpage_formulario.dw_detalle_interr)  
END IF

if tab_1.f_inserta_datos_brig() = false then
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=0")
else
	tab_1.tabpage_formulario.d_inf_general.Modify("ot.visible=1")
end if

if gb_mantenimiento = true and tab_1.ii_tipo_incid<>fgci_incidencia_calidad &
	and tab_1.ii_tipo_incid<>fgci_incidencia_programada &
	and tab_1.ii_alcance <> fgci_incidencia_de_suministro and &
	tab_1.ii_alcance <> fgci_incidencia_reenganche then
	
	tab_1.tabpage_seguimiento.d_estados_mantenimientos.visible = true
	tab_1.tabpage_seguimiento.d_seguimiento_mantenimiento.visible = true
end if

boolean bEnabled 
bEnabled  = tab_1.tabpage_interrupciones.Enabled 
tab_1.f_deshab_tabs(true)
bEnabled  = tab_1.tabpage_interrupciones.Enabled 

//HLA.INI.DDAG-6453.22/09/2016
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_operado.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("cod_elem_fallado.protect=1")
tab_1.tabpage_formulario.st_18.enabled = false
//HLA.FIN.DDAG-6453.22/09/2016

//TDA-EDM1-24-04-2017
tab_1.tabpage_formulario.d_inf_general.modify("rep_red.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("rep_red.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("origen_incidencia.protect=1")
//END-TDA-EDM1-24-04-2017
tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("desc.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("desc.protect=0")
tab_1.tabpage_formulario.d_inf_general.modify("desc.edit.displayonly=yes")
tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("fec_causa.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("f_deteccion.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("f_est_res.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("tipo_luminaria.protect=1")
tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.background.color="+gs_gris)
tab_1.tabpage_formulario.d_inf_general.modify("lum_reparadas.protect=1")
tab_1.tabpage_formulario.st_1.visible= false
tab_1.tabpage_formulario.st_2.visible= false
//lm_menu.m_consultar.m_instalacionafectada.enabled = false
//lm_menu.m_archivo.m_grabar.enabled = false
tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.protect=1")
tab_1.tabpage_ot.d_crit_seleccion.modify("pi_brigadas_en_turno.background.color="+gs_gris)
tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.protect=1")
tab_1.tabpage_ot.d_crit_seleccion.modify("pdt_fecha_turno.background.color="+gs_gris)
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//tab_1.tabpage_observaciones.mle_observaciones.backcolor = rgb(192,192,192)
tab_1.tabpage_observaciones.mle_observaciones.backcolor = long(gs_gris)
// Fin. Sgo.
tab_1.tabpage_observaciones.mle_observaciones.textcolor = rgb(0,0,255)
tab_1.tabpage_ot.rb_1.enabled = FALSE
tab_1.tabpage_ot.rb_2.enabled = FALSE
tab_1.tabpage_formulario.d_inf_general.Modify("fase_sugerida_t.Visible=false")
tab_1.tabpage_formulario.d_inf_general.Modify("fase_sugerida.Visible=false")


Double ld_pxt, ld_cxt

If tab_1.ib_pestana_otros Then
	tab_1.tabpage_formulario.dw_informe_tecnico.SetTransObject(SQLCA)

	If tab_1.tabpage_formulario.dw_informe_tecnico.Retrieve(tab_1.il_nro_incidencia) <= 0 Then
		tab_1.tabpage_formulario.dw_informe_tecnico.InsertRow(0)
	End If
		
	tab_1.fu_perfil_consulta(tab_1.tabpage_formulario.dw_informe_tecnico)
	//AHU  0/100038003 (17/02/2009)
	IF gi_pais = 8 THEN			//Comprobamos que estamos en Moldavia
		tab_1.tabpage_formulario.dw_informe_tecnico.object.agente_t.text = 'Soluci$$HEX1$$f300$$ENDHEX$$n:'
		tab_1.tabpage_formulario.dw_informe_tecnico.modify("t_area.text = 'Descripci$$HEX1$$f300$$ENDHEX$$n Medidas:'")
	END IF
	//Fin AHU
End If


If tab_1.ib_pxt_cxt And Lower(This.ClassName()) = 'w_2301_hist_form_incidencia' Then
	ld_pxt = Round(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, "c_ext_paxtc") / 60, 1)
	ld_cxt = Round(tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1, "c_ext_duracion") / 60, 1)

	tab_1.tabpage_formulario.st_pxt_valor.Text = String(ld_pxt, "###,##0.0")
	tab_1.tabpage_formulario.st_cxt_valor.Text = String(ld_cxt, "###,##0.0")
End If


this.setredraw(true)
this.setfocus()

IF ib_incidencia_en_historicos THEN
	dw_1.dataObject ='d_hist_interrupcion'
ELSE
	dw_1.dataObject = 'd_interrupcion_rs'
END IF



dw_1.setTransObject (SQLCA)
dw_1.Retrieve(long(em_incidencia.text))

IF NOT gb_red_trifasica AND tab_1.tabpage_interrupciones.d_datos_interrup.RowCount() > 0 	then
	tab_1.tabpage_interrupciones.d_datos_interrup.setItem (1, 'fase_seleccionada', 1)
END IF

tab_1.tabpage_formulario.st_fases.visible=False
tab_1.tabpage_ot.dw_ambito.visible = False

//W_BARRA.uo_barra.barra.f_amplia(100)
//w_barra.visible=false
//CLOSE (W_BARRA)
// GNU 3-8-2006
IF tab_1.tabpage_interrupciones.dw_lista_int_operaciones.RowCount() > 0 THEN
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.event rowfocuschanged(1)
END IF

//AHM
IF gi_pais = 8 THEN
	tab_1.tabpage_ot.d_datos_ot.Object.est_ot_t.text = 'Prepara LM'
	tab_1.tabpage_ot.d_datos_ot.Object.est_ot.visible = FALSE
	tab_1.tabpage_ot.d_datos_ot.Object.f_prepara_lm.visible = TRUE
END IF

//AHM (03/12/2008)
IF gi_pais = 8 THEN	//Es Moldavia
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.modify("cant_cli_t.text= '   NIS activ actual'")
	tab_1.tabpage_interrupciones.dw_lista_int_operaciones.modify("cant_clientes_afectados_t.text= 'NIS total actual'")
	tab_1.tabpage_interrupciones.d_datos_interrup.modify("ccant_cli_t.text= 'NIS activ descon'")
	tab_1.tabpage_interrupciones.d_datos_interrup.modify("cccli_afec_t.text= 'NIS total descon'")
	//AHU  0/100038003 (17/02/2009)
	tab_1.tabpage_otros.Text = 'SEC'
	//Fin AHU
END IF


//AHM (23/07/2009) Mejora1/578447
IF fg_verifica_parametro ('CAMBIO CAUSA INCIDENCIA RESUELTA') THEN
	
	tab_1.tabpage_formulario.st_1.visible = TRUE
	
END IF

//AHM (03/11/2011) Integracion OSGI - OSGM
IF isNull(tab_1.tabpage_formulario.d_inf_general.getItemNumber(1, "estado_mantenimiento")) THEN
	tab_1.tabpage_formulario.d_inf_general.setItem(1, "estado_mantenimiento", 1)
END IF

tab_1.tabpage_ot.tab_lista_brigadas.visible=false



close(w_msg)
///////////////////////Fin de consulta de Historicos
else 
     messagebox("Atencion","El nro Incidencia no existe",StopSign!)
end if





end event


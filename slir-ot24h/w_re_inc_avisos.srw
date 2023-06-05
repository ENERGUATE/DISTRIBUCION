HA$PBExportHeader$w_re_inc_avisos.srw
forward
global type w_re_inc_avisos from Window
end type
type dw_reporte from datawindow within w_re_inc_avisos
end type
type gb_reporte from groupbox within w_re_inc_avisos
end type
end forward

global type w_re_inc_avisos from Window
int X=1056
int Y=484
int Width=3003
int Height=1512
boolean Visible=false
boolean TitleBar=true
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
dw_reporte dw_reporte
gb_reporte gb_reporte
end type
global w_re_inc_avisos w_re_inc_avisos

type variables
boolean ib_param_nic
end variables

forward prototypes
public subroutine fw_visible_tensiones (readonly integer ai_parametro)
end prototypes

public subroutine fw_visible_tensiones (readonly integer ai_parametro);///////////////////////////////////////////////////////
//
// Funcion/Evento: fw_visible_tensiones
// 
// Objetivo: Coloca visible o no los campos de tensiones y agente
//				 dependiendo del parametro #2 de gi_parametro.
//
// Responsable: JPE
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: string as_cadena,
//					string as_replace,
//					string as_replace_with
//
//    Salida : string as_cadena
//
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------       -----------   ---------
// 29/04/2000   JPE
//
///////////////////////////////////////////////////////
fg_ejecuta_parametro(dw_reporte, "c_tension_origen", 2, ai_parametro)
fg_ejecuta_parametro(dw_reporte, "c_tension_afect", 2, ai_parametro)
fg_ejecuta_parametro(dw_reporte, "c_agente", 2, ai_parametro)

fg_ejecuta_parametro(dw_reporte, "tension_origen_t", 2, ai_parametro)
fg_ejecuta_parametro(dw_reporte, "tension_afectada_t", 2, ai_parametro)
fg_ejecuta_parametro(dw_reporte, "agente_t", 2, ai_parametro)
end subroutine

event resize;gb_reporte.Height = This.Height - 140
dw_reporte.Height = gb_reporte.Height - 65


gb_reporte.Width = This.Width - 75
dw_reporte.Width = gb_reporte.Width - 42
end event

on w_re_inc_avisos.create
this.dw_reporte=create dw_reporte
this.gb_reporte=create gb_reporte
this.Control[]={this.dw_reporte,&
this.gb_reporte}
end on

on w_re_inc_avisos.destroy
destroy(this.dw_reporte)
destroy(this.gb_reporte)
end on

event open;String ls_sql, ls_sql_original, ls_sql_historico, ls_mod_string, ls_cmd_cor
Integer li_parametro_tensiones
Boolean lb_otros
s_reporte_inc_aviso lstr_reporte_inc_aviso



lstr_reporte_inc_aviso = Message.PowerObjectParm

CHOOSE CASE lstr_reporte_inc_aviso.i_reporte
	CASE 1
		This.Title = 'Reporte de Incidencias'

		ls_cmd_cor = fg_cor_dw("Cmd:", "CMD")

		lb_otros = fg_verifica_parametro('pestana_otros')


		If lb_otros Then
			li_parametro_tensiones = 1
		Else
			li_parametro_tensiones = 0
		End If			


		//*****************************************
		//** SOLO PARA HISTORICO DE INCIDENCIAS  **
		//*****************************************
		If lstr_reporte_inc_aviso.s_opcion_menu = "Hist_Inci" Then
			dw_reporte.DataObject = "dw_re_inc_rep_hist"
			dw_reporte.SetTransObject(SQLCA)

			fw_visible_tensiones(li_parametro_tensiones)

			dw_reporte.Modify("cmd_t.Text = '" + ls_cmd_cor + "'")

			If dw_reporte.Retrieve(lstr_reporte_inc_aviso.l_nro_inc_aviso) > 0 Then
//				dw_reporte.AcceptText()
//				dw_reporte.Print()
			End If
		End If
		//*****************************************
		//** SOLO PARA HISTORICO DE INCIDENCIAS  **
		//*****************************************
		
		dw_reporte.DataObject = "dw_re_inc_rep"
		dw_reporte.Modify("cmd_t.Text = '" + ls_cmd_cor + "'")

	CASE 2
		ib_param_nic = fg_verifica_parametro('NIC')

		This.Title = 'Reporte de Avisos'
		ls_cmd_cor = fg_cor_dw(" Observaciones CMD", "CMD")

		dw_reporte.DataObject = "dw_re_avi_rep"

		dw_reporte.Modify("provincia_t.Text='"+fg_geografica('1', 'Provincia')+"'") 
		dw_reporte.Modify("depto_t.Text='"+fg_geografica('2', 'Departamento')+"'")
		dw_reporte.Modify("municipio_t.Text='"+fg_geografica('3', 'Municipio')+"'")
		dw_reporte.Modify("localidad_t.Text='"+fg_geografica('4', 'Localidad')+"'")
		
		dw_reporte.Modify("cmd_t.Text = '" + ls_cmd_cor + "'")

		If ib_param_nic Then
			ib_param_nic = fg_verifica_parametro(This.ClassName() + '_NIC')
			
			If ib_param_nic Then
				fg_ventana_parametro(This.ClassName() + '_NIC', dw_reporte)
			End If
		End If

//		//************************************
//		//**  PMS 2000 DOM II PM016 AVISOS  **
//		//************************************
//		If Not gb_ver_potcontratada Then
//			dw_reporte.Modify("aco_sum_pot_contratada_t.Visible=0")
//			dw_reporte.Modify("aco_sum_pot_contratada.Visible=0")
//		End If
//		//************************************
//		//**  PMS 2000 DOM II PM016 AVISOS  **
//		//************************************
END CHOOSE

dw_reporte.SetTransObject(SQLCA)
fw_visible_tensiones(li_parametro_tensiones)




If dw_reporte.Retrieve(lstr_reporte_inc_aviso.l_nro_inc_aviso) > 0 Then
//	dw_reporte.AcceptText()
//	dw_reporte.Print()
End If

//Close(This)
end event

type dw_reporte from datawindow within w_re_inc_avisos
int X=37
int Y=44
int Width=2825
int Height=1224
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event retrieveend;Long ll_nro_instalacion, &
	  ll_nro_centro, &
	  ll_nro_cmd, &
	  ll_nro_mesa, &
	  ll_tension_origen, &
	  ll_tension_afectada, &
	  ll_agente, &
	  ll_i, &
	  ll_row, &
	  ll_nis_rad, &
	  ll_nic, &
	  ll_contador

	  
String ls_nom_inst_afect, &
		 ls_nom_inst_origen, &
		 ls_nom_centro, &
		 ls_nom_cmd, &
		 ls_nom_mesa, &
		 ls_tension_origen, &
		 ls_tension_afectada, &
		 ls_agente, &
		 ls_cadena, &
		 ls_observacion_orig, &
		 ls_observacion, &
		 ls_tabla

ll_row = This.RowCount()

For ll_i = 1 To ll_row
	IF Lower(This.DataObject) = "dw_re_inc_rep_hist" Or Lower(This.DataObject) = "dw_re_inc_rep" Then
		IF Lower(This.DataObject) = "dw_re_inc_rep_hist" THEN
			ls_tabla = 'gi_hist_incidencias'
		ELSE
			ls_tabla = 'sgd_incidencia'
		END IF
		ls_observacion_orig = This.GetItemString(ll_i, ls_tabla + "_observacion")
		ls_observacion_orig = fg_remplaza(ls_observacion_orig, '~r~n', ' ')
		ls_observacion_orig = fg_remplaza(ls_observacion_orig, '~t', ' ')
		
		ll_contador = 0
		ls_observacion = ""
		DO WHILE Mid(ls_observacion_orig, (ll_contador * 100) + 1, 100) <> ""
			ls_observacion += Mid(ls_observacion_orig, (ll_contador * 100) +1, 100) + "~r~n"
			ll_contador ++
		LOOP
		This.SetItem(ll_i, ls_tabla + "_observacion", ls_observacion)
	END IF
	
	If Lower(This.DataObject) = "dw_re_inc_rep" Then
		ll_nro_instalacion = This.GetItemNumber(ll_i, "sgd_incidencia_nro_inst_afectada")
		ll_tension_origen = This.GetItemNumber(ll_i, "sgd_incidencia_tension_origen")
		ll_tension_afectada = This.GetItemNumber(ll_i, "sgd_incidencia_tension_afectada")
		ll_agente = This.GetItemNumber(ll_i, "sgd_incidencia_agente")
			
		//*********************
		//**  INSTALACIONES  **
		//*********************
		SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
		  INTO :ls_nom_inst_afect
		  FROM "SGD_INSTALACION"  
		 WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_instalacion AND
				 NVL("SGD_INSTALACION"."BDI_JOB", 0) = 0   ;
		
		ll_nro_instalacion = This.GetItemNumber(ll_i, "sgd_incidencia_instalacion_origen")
		
		SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
		  INTO :ls_nom_inst_origen
		  FROM "SGD_INSTALACION"  
		 WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_instalacion AND
				 NVL("SGD_INSTALACION"."BDI_JOB", 0) = 0   ;
		//*********************
		//**  INSTALACIONES  **
		//*********************
	
		//*************
		//**  OTROS  **
		//*************
		SELECT "SGD_VALOR"."DESCRIPCION"  
		  INTO :ls_tension_origen
		  FROM "SGD_VALOR"  
		 WHERE ( Upper("SGD_VALOR"."CODIF") = 'TTEN' ) AND  
				 ( "SGD_VALOR"."CODIGO" = :ll_tension_origen )   ;
		
		SELECT "SGD_VALOR"."DESCRIPCION"  
		  INTO :ls_tension_afectada
		  FROM "SGD_VALOR"  
		 WHERE ( Upper("SGD_VALOR"."CODIF") = 'TTEN' ) AND  
				 ( "SGD_VALOR"."CODIGO" = :ll_tension_afectada )   ;
		
		SELECT "SGD_VALOR"."DESCRIPCION"  
		  INTO :ls_agente
		  FROM "SGD_VALOR"  
		 WHERE ( Upper("SGD_VALOR"."CODIF") = 'TAGT' ) AND  
				 ( "SGD_VALOR"."CODIGO" = :ll_agente )   ;
		//*************
		//**  OTROS  **
		//*************
	
		This.SetItem(ll_i, "c_nom_inst_afect", Trim(ls_nom_inst_afect))
		This.SetItem(ll_i, "c_nom_inst_origen", Trim(ls_nom_inst_origen))
		This.SetItem(ll_i, "c_tension_origen", Trim(ls_tension_origen))
		This.SetItem(ll_i, "c_tension_afect", Trim(ls_tension_afectada))
		This.SetItem(ll_i, "c_agente", Trim(ls_agente))
	End If
	
	
	
	//**************
	//**  CENTRO  **
	//**************
	If Lower(This.DataObject) = "dw_re_inc_rep_hist" Or Lower(This.DataObject) = "dw_re_inc_rep" Then
		ll_nro_centro = This.GetItemNumber(ll_i, "nro_centro")
		ll_nro_cmd = This.GetItemNumber(ll_i, "nro_cmd")
		ll_nro_mesa = This.GetItemNumber(ll_i, "nro_mesa")
	
		SELECT "SGD_CENTRO"."NOM_CENTRO"
		  INTO :ls_nom_centro
		  FROM "SGD_CENTRO"
		 WHERE "SGD_CENTRO"."NRO_CENTRO" = :ll_nro_centro AND
				 NVL("SGD_CENTRO"."TIP_CENTRO", 1) = 1 ;
	
		SELECT "SGD_CENTRO"."NOM_CENTRO"
		  INTO :ls_nom_cmd
		  FROM "SGD_CENTRO"
		 WHERE "SGD_CENTRO"."NRO_CENTRO" = :ll_nro_cmd AND
				 NVL("SGD_CENTRO"."TIP_CENTRO", 2) = 2 ;
	
		SELECT "SGD_CENTRO"."NOM_CENTRO"
		  INTO :ls_nom_mesa
		  FROM "SGD_CENTRO"
		 WHERE "SGD_CENTRO"."NRO_CENTRO" = :ll_nro_mesa AND
				 NVL("SGD_CENTRO"."TIP_CENTRO", 3) = 3 ;
	
		This.SetItem(ll_i, "c_nom_centro1", Trim(ls_nom_centro))
		This.SetItem(ll_i, "c_nom_centro2", Trim(ls_nom_cmd))
		This.SetItem(ll_i, "c_nom_centro3", Trim(ls_nom_mesa))
	End If
	//**************
	//**  CENTRO  **
	//**************

	//***************
	//**  NIS NIC  **
	//***************
	If Lower(This.DataObject) = "dw_re_avi_rep" And ib_param_nic Then
		ll_nis_rad = This.GetItemNumber(ll_i, "nis_rad")

		ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad)
		
		DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
		PREPARE SQLSA FROM :ls_cadena ;
		OPEN DYNAMIC my_cursor ;
		FETCH my_cursor INTO :ll_nic ;

		If sqlca.sqlcode <> 0 Or IsNull(ll_nic) Or ll_nic <= 0 Then
			ll_nic = 0
		End If

		CLOSE my_cursor;

		This.SetItem(ll_i, "nis_rad", ll_nic)
	End If
	//***************
	//**  NIS NIC  **
	//***************
Next

This.AcceptText()

If This.RowCount() > 0 Then This.Print()

If Lower(This.DataObject) = "dw_re_inc_rep" Or Lower(This.DataObject) = "dw_re_avi_rep" Then
	Close(Parent)
End If
end event

type gb_reporte from groupbox within w_re_inc_avisos
int X=18
int Width=2875
int Height=1312
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


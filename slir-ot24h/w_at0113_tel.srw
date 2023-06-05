HA$PBExportHeader$w_at0113_tel.srw
$PBExportComments$Identificaci$$HEX1$$f300$$ENDHEX$$n del cliente.
forward
global type w_at0113_tel from w_sgigenerica
end type
type cb_cancelar from u_cb within w_at0113_tel
end type
type cb_aceptar from u_cb within w_at0113_tel
end type
type dw_1 from datawindow within w_at0113_tel
end type
type st_telef from statictext within w_at0113_tel
end type
type cb_1 from commandbutton within w_at0113_tel
end type
type em_tfno_cli from editmask within w_at0113_tel
end type
end forward

global type w_at0113_tel from w_sgigenerica
boolean visible = false
integer x = 663
integer y = 564
integer width = 2336
integer height = 1388
string title = "OPEN SGI - Identificaci$$HEX1$$f300$$ENDHEX$$n del Cliente"
windowtype windowtype = response!
event ue_post_event ( )
event ue_post_open ( )
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_1 dw_1
st_telef st_telef
cb_1 cb_1
em_tfno_cli em_tfno_cli
end type
global w_at0113_tel w_at0113_tel

type variables
Long ii_FilaSelecc, il_opcion
s_direccion_cliente istr_cliente
Boolean ib_cierre_con_boton = FALSE
String is_argumento_sqlpreview
end variables

forward prototypes
public function integer frn_validar_telefono (string ps_nro_telefono)
end prototypes

event ue_post_open();Long ll_pos


This.enabled = False
This.Visible = True

is_argumento_sqlpreview = Message.StringParm


//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
fg_ventana_parametro(This.ClassName(), dw_1)


ll_pos = Pos(is_argumento_sqlpreview, "~t")
il_opcion = Long(Mid(is_argumento_sqlpreview, ll_pos + 1))


is_argumento_sqlpreview = Mid(is_argumento_sqlpreview, 1, ll_pos - 1)


If il_opcion = 1 Then
	em_tfno_cli.Visible = True
	st_telef.Visible = True
	cb_1.Visible = True
	cb_1.Enabled = True

	em_tfno_cli.Text = is_argumento_sqlpreview
//Else
//	dw_1.DataObject = "d_at0113_1_ext"
End If

dw_1.SetTransObject(SQLCA)

If fg_valida_nic_tip_serv() = 1 Then
	fg_ventana_parametro(This.ClassName() + "_NIC", dw_1)  //**  INSERTA COLUMNAS ADICIONALES AL DW  **
	
//	If IsNull(is_argumento_sqlpreview) Or Not IsNumber(is_argumento_sqlpreview) And il_opcion = 2 Then
//		is_argumento_sqlpreview = "0"
//	End If
End If

//If il_opcion = 1 Then
	dw_1.Retrieve()
//Else
//	dw_1.Retrieve(Long(is_argumento_sqlpreview))
//End If
//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************


ii_FilaSelecc = 1

If dw_1.RowCount() = 1 Then
	This.enabled = TRUE
	cb_aceptar.PostEvent(Clicked!)
ElseIf dw_1.RowCount() <= 0 Then
	This.enabled = TRUE
// ACA Llamada al mensaje E64 si no encuentra el n$$HEX1$$fa00$$ENDHEX$$mero de tel$$HEX1$$e900$$ENDHEX$$fono. 22/03/2006	
	gnv_msg.f_mensaje("EM64","","",OK!)
////////	
	cb_cancelar.TriggerEvent(Clicked!)	
Else
	This.enabled = TRUE
	cb_aceptar.Enabled = True
End If
end event

public function integer frn_validar_telefono (string ps_nro_telefono);IF NOT IsNumber(ps_nro_telefono) OR IsNull(ps_nro_telefono) THEN
	gnv_msg.f_mensaje("EM40","","",OK!)
	Return -1
END IF

Return 1

end function

on w_at0113_tel.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_1=create dw_1
this.st_telef=create st_telef
this.cb_1=create cb_1
this.em_tfno_cli=create em_tfno_cli
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.st_telef
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.em_tfno_cli
end on

on w_at0113_tel.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_1)
destroy(this.st_telef)
destroy(this.cb_1)
destroy(this.em_tfno_cli)
end on

event open;call super::open;This.PostEvent("ue_post_open")
end event

event close;
IF NOT ib_cierre_con_boton THEN
	//Clicked Script para Bot$$HEX1$$f300$$ENDHEX$$n Anular
	s_cliente str_cliente_vacio
	s_direccion_cliente ls_direccion_vacia
	
	parmstr1 = ""
	parmstr2 = ""
	parmstr3 = ""
	parnum2  = 1
	
	parnum1 = 0  //No se seleccion$$HEX2$$f3002000$$ENDHEX$$un cliente
	
	CloseWithReturn(This, ls_direccion_vacia)
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_at0113_tel
end type

type cb_cancelar from u_cb within w_at0113_tel
integer x = 1897
integer y = 132
integer width = 352
integer height = 92
integer taborder = 20
integer textsize = -8
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;call super::clicked;//Clicked Script para Bot$$HEX1$$f300$$ENDHEX$$n Anular
s_cliente str_cliente_vacio
s_direccion_cliente ls_direccion_vacia

parmstr1 = ""
parmstr2 = ""
parmstr3 = ""
parnum2  = 1

parnum1 = 0  //No se seleccion$$HEX2$$f3002000$$ENDHEX$$un cliente

ib_cierre_con_boton = TRUE


SetNull(ls_direccion_vacia.gl_nis)


CloseWithReturn(Parent, ls_direccion_vacia)
end event

type cb_aceptar from u_cb within w_at0113_tel
integer x = 1897
integer y = 28
integer width = 352
integer height = 92
integer taborder = 10
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Aceptar"
end type

event clicked;call super::clicked;//Clicked Script para cb_1

long ll_cod_cli
string ls_est_sum
datetime ldt_f_enganche, ldt_f_corte, ldt_f_actual
Long ll_nif  //**  OSGI 2001.1  	21/06/2001




ldt_f_actual = fgnu_fecha_actual()
SetNull(ldt_f_enganche)
SetNull(ldt_f_corte)


IF ii_FilaSelecc = 0 THEN
	gnv_msg.f_mensaje("ER47", "", "",OK!)
	Return
END IF

istr_cliente.gl_nis = dw_1.GetItemNumber(ii_FilaSelecc, "nis_rad")		//Nis Rad

// Si el suministro existe en la tabla 'Suministros',
// verifico su existencia en 'SumCon' y/o 'PetSum'.
// En caso afirmativo proceso, sino despliego mensaje,
// explicando que el sum. ni tiene contrato vigente.
	
SELECT SUMCON.COD_CLI, SUMCON.EST_SUM, SUMCON.NIF  /*  OSGI 2001.1  21/06/2001  (, SUMCON.NIF)  */
INTO :ll_cod_cli, :ls_est_sum, :ll_nif					/*  OSGI 2001.1  21/06/2001  (, :ll_nif)  */
FROM SUMCON
WHERE	(SUMCON.NIS_RAD = :istr_cliente.gl_nis);

IF sqlca.SqlCode = 100 THEN

	SELECT PETSUM.COD_CLI, PETSUM.F_ENGANCHE , PETSUM.F_CORTE
	INTO :ll_cod_cli, :ldt_f_enganche, :ldt_f_corte
	FROM PETSUM
	WHERE (PETSUM.NIS_RAD = :istr_cliente.gl_nis);

	IF sqlca.SqlCode < 0 THEN
		gnv_msg.f_mensaje("ER31", "", "",OK!)
		Close(Parent)
	END IF

ELSEIF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER31", "", "",OK!)
	Close(Parent)
END IF


// Si encontre al suministro, y est$$HEX2$$e1002000$$ENDHEX$$en 'sumcon' con un estado
// v$$HEX1$$e100$$ENDHEX$$lido, o lo fu$$HEX2$$ed002000$$ENDHEX$$a buscar a 'petsum'
// Si la fecha actual est$$HEX2$$e1002000$$ENDHEX$$entre las fechas de:
// enganche y corte, del suministro en 'petsum'
IF sqlca.SqlCode = 0 AND (ls_est_sum = "EC011" OR ls_est_sum = "EC012"&
		 OR ls_est_sum = "EC013" OR ls_est_sum = "EC014" OR ls_est_sum = "EC023" OR &
		(ldt_f_actual >= ldt_f_enganche AND ldt_f_actual <= ldt_f_corte)) THEN

	// Si el suministro existe en las tres tablas, 
	// cargo la inf. en la estructura.
			
	// Carga de la estructura dir para el SGI
	istr_cliente.gl_cod_cli  = dw_1.GetItemNumber(ii_FilaSelecc, "clientes_cod_cli")			//C$$HEX1$$f300$$ENDHEX$$digo del Cliente
	istr_cliente.gs_ape1  	 = dw_1.GetItemString(ii_FilaSelecc, "clientes_ape1_cli")		//Apellido1
	istr_cliente.gs_ape2  	 = dw_1.GetItemString(ii_FilaSelecc, "clientes_ape2_cli")		//Apellido2
	istr_cliente.gs_nom	 	 = dw_1.GetItemString(ii_FilaSelecc, "clientes_nom_cli")			//Nombre
	istr_cliente.gl_codcalle = dw_1.GetItemNumber(ii_FilaSelecc, "callejero_cod_calle")		//Cod Calle
	istr_cliente.gl_numero   = dw_1.GetItemNumber(ii_FilaSelecc, "clientes_num_puerta")		//Numero
	istr_cliente.gs_duplic	 = dw_1.GetItemString(ii_FilaSelecc, "clientes_duplicador")		//Duplic
	istr_cliente.gs_pisodpto = dw_1.GetItemString(ii_FilaSelecc, "sumcon_cgv_sum")			//Cgv
	istr_cliente.gl_codloc	 = dw_1.GetItemNumber(ii_FilaSelecc, "callejero_cod_local")		//Cod Loc
	istr_cliente.gl_codmun	 = dw_1.GetItemNumber(ii_FilaSelecc, "callejero_cod_munic")		//Cod Munic
	istr_cliente.gl_codprov	 = dw_1.GetItemNumber(ii_FilaSelecc, "callejero_cod_prov")		//Cod Prov
	istr_cliente.gl_coddepto = dw_1.GetItemNumber(ii_FilaSelecc, "callejero_cod_depto")		//Cod Depto
	istr_cliente.gs_doc		 = dw_1.GetItemString(ii_FilaSelecc, "clientes_doc_id")			//Doc Id
	istr_cliente.gs_tipo_doc = dw_1.GetItemString(ii_FilaSelecc, "clientes_tip_doc")			//Tip Doc 
	istr_cliente.gs_co_pais	 = dw_1.GetItemString(ii_FilaSelecc, "clientes_co_pais")			//Co Pa$$HEX1$$ed00$$ENDHEX$$s
	istr_cliente.gs_calle	 = dw_1.GetItemString(ii_FilaSelecc, "callejero_nom_calle")		//Calle 
	istr_cliente.gs_depto	 = dw_1.GetItemString(ii_FilaSelecc, "deptos_nom_depto")			//Depto
	istr_cliente.gs_prov		 = dw_1.GetItemString(ii_FilaSelecc, "provincias_nom_prov")		//Provincia 
	istr_cliente.gs_local	 = dw_1.GetItemString(ii_FilaSelecc, "localidades_nom_local")	//Localidad 
	istr_cliente.gs_munic	 = dw_1.GetItemString(ii_FilaSelecc, "municipios_nom_munic")	//Municipio 
	istr_cliente.gs_pais		 = dw_1.GetItemString(ii_FilaSelecc, "codigos_desc_cod")			//Pa$$HEX1$$ed00$$ENDHEX$$s 
	
	parnum1 = 1										//Salida OK


	istr_cliente.gs_telefono = fg_tfno_cli_type(istr_cliente.gl_cod_cli, "")	//Tel$$HEX1$$e900$$ENDHEX$$fono	


	//***************************************
	//**  OSGI 2001.1  	21/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	istr_cliente.gs_ref = fg_referencia(istr_cliente.gl_codloc, ll_nif, istr_cliente.gs_ref)
	//***************************************
	//**  OSGI 2001.1  	21/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


	IF ls_est_sum = "EC013" THEN
		gu_comunic.is_comunic.intval10 = 1
	ELSEIF ls_est_sum = "EC023" THEN
		gu_comunic.is_comunic.intval10 = 2
	ELSE
		gu_comunic.is_comunic.intval10 = 0
	END IF

	ib_cierre_con_boton = TRUE

// Cierro la ventana, pasando como par$$HEX1$$e100$$ENDHEX$$m. la estructura con los datos 

	CloseWithReturn(Parent, istr_cliente)
ELSE
	gnv_msg.f_mensaje("AR13", "", "",OK!)
	parnum1 = 0	
	Close(Parent)
END IF



//////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Objetivo: Se devuelven los datos del cliente seleccionado
////	Se mantienen las dos versiones, con las variables globales y con la
////	estructura local
////
//// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
////
////  Fecha		Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ---------	-------	----------------------------------------
//// 				SAS		Versi$$HEX1$$f300$$ENDHEX$$n original
////
//////////////////////////////////////////////////////////////////////////////////////////////////
//
//SetPointer(HourGlass!)
//
//IF ii_FilaSelecc = 0 THEN
//	gnv_msg.f_mensaje("ER34", "", "",OK!)
//	Return
//END IF
//
////Versi$$HEX1$$f300$$ENDHEX$$n nueva
//str_cliente.gl_cod_cli 	= dw_1.GetItemNumber(ii_FilaSelecc,8)	//Cod. Cliente
//str_cliente.gs_ape1_cli = dw_1.GetItemString(ii_FilaSelecc,2)	//Ape 1	
//str_cliente.gs_ape2_cli = dw_1.GetItemString(ii_FilaSelecc,3)	//Ape 2
//str_cliente.gs_nom_cli	= dw_1.GetItemString(ii_FilaSelecc,1)	//Nombre
//
////Versi$$HEX1$$f300$$ENDHEX$$n Open I
//parmstr1 = dw_1.GetItemString(ii_FilaSelecc,2)	//Ape 1	
//Parmstr2 = dw_1.GetItemString(ii_FilaSelecc,3)	//Ape 2
//parmstr3 = dw_1.GetItemString(ii_FilaSelecc,1)	//Nombre
//parnum2  = dw_1.GetItemNumber(ii_FilaSelecc,8)	//Cod. Cliente
//
//parnum1 = 1   //Termino bien
//
////CloseWithReturn(Parent, str_cliente)
//
////Versi$$HEX1$$f300$$ENDHEX$$n SGI
//istr_cliente.gs_ape1 = 	 parmstr1	//Ape 1	
//istr_cliente.gs_ape2 = 	 parmstr2	//Ape 2
//istr_cliente.gs_nom  =   parmstr3	//Nombre
//
//
//// Abro ventana para identificar el suministro
//Open(w_re0500_ss)
//
//
////gu_comunic.fnu_abrir(w_re0500_ss, "w_re0500_ss",1,1,w_at0113, "w_at0113")
//
//// Si no encontr$$HEX2$$f3002000$$ENDHEX$$el suministro
//IF parnum1 = 0 THEN
//	istr_cliente.gl_nis = 0
//END IF
//
//ib_cierre_con_boton = TRUE
//// Cierro la ventana, pasando como par$$HEX1$$e100$$ENDHEX$$m. la estructura con los datos 
//CloseWithReturn(Parent, dir)
//
//
//

//////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Objetivo: Se devuelven los datos del cliente seleccionado
////	Se mantienen las dos versiones, con las variables globales y con la
////	estructura local
////
//// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
////
////  Fecha		Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ---------	-------	----------------------------------------
//// 				SAS		Versi$$HEX1$$f300$$ENDHEX$$n original
////
//////////////////////////////////////////////////////////////////////////////////////////////////
//
//SetPointer(HourGlass!)
//
//IF ii_FilaSelecc = 0 THEN
//	gnv_msg.f_mensaje("ER34","","",OK!)
//	Return
//END IF
//
////Versi$$HEX1$$f300$$ENDHEX$$n nueva
//str_cliente.gl_cod_cli 	= dw_1.GetItemNumber(ii_FilaSelecc,8)	//Cod. Cliente
//str_cliente.gs_ape1_cli = dw_1.GetItemString(ii_FilaSelecc,2)	//Ape 1	
//str_cliente.gs_ape2_cli = dw_1.GetItemString(ii_FilaSelecc,3)	//Ape 2
//str_cliente.gs_nom_cli	= dw_1.GetItemString(ii_FilaSelecc,1)	//Nombre
//
////Versi$$HEX1$$f300$$ENDHEX$$n Open I
//parmstr1 = dw_1.GetItemString(ii_FilaSelecc,2)	//Ape 1	
//Parmstr2 = dw_1.GetItemString(ii_FilaSelecc,3)	//Ape 2
//parmstr3 = dw_1.GetItemString(ii_FilaSelecc,1)	//Nombre
//parnum2  = dw_1.GetItemNumber(ii_FilaSelecc,8)	//Cod. Cliente
//
//parnum1 = 1   //Termino bien
//
////CloseWithReturn(Parent, str_cliente)
//
////Versi$$HEX1$$f300$$ENDHEX$$n SGI
//istr_cliente.gs_ape1 = 	 parmstr1	//Ape 1	
//istr_cliente.gs_ape2 = 	 parmstr2	//Ape 2
//istr_cliente.gs_nom  =   parmstr3	//Nombre
//
//
//// Abro ventana para identificar el suministro
//Open(w_re0500_ss)
//
//
////gu_comunic.fnu_abrir(w_re0500_ss,"w_re0500_ss",1,1,w_at0113,"w_at0113")
//
//// Si no encontr$$HEX2$$f3002000$$ENDHEX$$el suministro
//IF parnum1 = 0 THEN
//	istr_cliente.gl_nis = 0
//END IF
//
//ib_cierre_con_boton = TRUE
//// Cierro la ventana, pasando como par$$HEX1$$e100$$ENDHEX$$m. la estructura con los datos 
//CloseWithReturn(Parent, dir)
//
//
//
end event

type dw_1 from datawindow within w_at0113_tel
integer x = 32
integer y = 352
integer width = 2222
integer height = 864
integer taborder = 30
string dataobject = "d_at0113_a1_tel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieverow;SetPointer(HourGlass!)
end event

event doubleclicked;// DoubleClicked Script for dw_1

cb_aceptar.TriggerEvent(Clicked!)
end event

on dberror;//SQLCA.SQLCode = -1
//SQLCA.SQLDbCode = this.DbErrorCode()
////ErrorDb("sgi")
//This.SetActionCode(1)
end on

event clicked;dw_1.SelectRow(0, FALSE)  // Se deselecciona la fila

ii_FilaSelecc = row

IF ii_FilaSelecc > 0 THEN dw_1.SelectRow(ii_FilaSelecc, TRUE)  // Se selecciona la fila nueva


end event

event sqlpreview;//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
String ls_syntax, ls_where



ls_syntax = sqlsyntax

If fg_valida_nic_tip_serv() = 1 Then
	fg_replace_text(ls_syntax, "0 AS C_NIC", ' SUMCON.NIC AS C_NIC ')
	fg_replace_text(ls_syntax, "'     ' AS C_TIP_SERV", ' SUMCON.TIP_SERV AS C_TIP_SERV ')

	ls_syntax += fg_tip_serv()

	If il_opcion = 2 And Not IsNull(is_argumento_sqlpreview) And IsNumber(is_argumento_sqlpreview) Then
		If	Long(is_argumento_sqlpreview) > 0 Then
			ls_where = " AND NIC = " + String(is_argumento_sqlpreview) + " "
		End If
	End If
End If

If il_opcion = 1 Then
	ls_where = fg_tfno_cli_type(0, is_argumento_sqlpreview)
End If

If IsNull(ls_where) Then
	ls_where = " AND ROWNUM = 0 "
End If

ls_syntax += ls_where
//MessageBox("ls_syntax", ls_syntax)
This.SetSQLPreview(ls_syntax)
//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
end event

event retrieveend;SetPointer(Arrow!)

end event

type st_telef from statictext within w_at0113_tel
boolean visible = false
integer x = 37
integer y = 144
integer width = 535
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "N$$HEX2$$ba002000$$ENDHEX$$de Tel$$HEX1$$e900$$ENDHEX$$fono"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_at0113_tel
boolean visible = false
integer x = 1897
integer y = 236
integer width = 352
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Consultar"
boolean default = true
end type

event clicked;is_argumento_sqlpreview = em_tfno_cli.Text

dw_1.Retrieve()
end event

type em_tfno_cli from editmask within w_at0113_tel
boolean visible = false
integer x = 571
integer y = 136
integer width = 1134
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type


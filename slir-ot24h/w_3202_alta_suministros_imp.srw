HA$PBExportHeader$w_3202_alta_suministros_imp.srw
forward
global type w_3202_alta_suministros_imp from w_sgigenerica
end type
type r_3 from rectangle within w_3202_alta_suministros_imp
end type
type r_1 from rectangle within w_3202_alta_suministros_imp
end type
type st_2 from statictext within w_3202_alta_suministros_imp
end type
type sle_esq_cond from singlelineedit within w_3202_alta_suministros_imp
end type
type st_1 from statictext within w_3202_alta_suministros_imp
end type
type sle_telefono from singlelineedit within w_3202_alta_suministros_imp
end type
type d_desde_hasta from u_man_2036_pr_sum_imp within w_3202_alta_suministros_imp
end type
type cb_confirmar from u_cb within w_3202_alta_suministros_imp
end type
type cb_cancelar from u_cb within w_3202_alta_suministros_imp
end type
type st_3 from statictext within w_3202_alta_suministros_imp
end type
type pb_1 from picturebutton within w_3202_alta_suministros_imp
end type
type st_doc2 from statictext within w_3202_alta_suministros_imp
end type
type st_ape from statictext within w_3202_alta_suministros_imp
end type
type r_2 from rectangle within w_3202_alta_suministros_imp
end type
type d_cliente from u_cli_2001_pr_cliente_std within w_3202_alta_suministros_imp
end type
type st_dir from statictext within w_3202_alta_suministros_imp
end type
type d_direccion from u_dir_2001_pr_direccion_std within w_3202_alta_suministros_imp
end type
type dw_1 from datawindow within w_3202_alta_suministros_imp
end type
type cb_imprimir from commandbutton within w_3202_alta_suministros_imp
end type
type st_nic from statictext within w_3202_alta_suministros_imp
end type
type st_nis from statictext within w_3202_alta_suministros_imp
end type
type st_nis2 from statictext within w_3202_alta_suministros_imp
end type
type d_nis_rad from u_nis_2001_pr_nis_rad within w_3202_alta_suministros_imp
end type
type st_dir2 from statictext within w_3202_alta_suministros_imp
end type
type st_ape2 from statictext within w_3202_alta_suministros_imp
end type
type st_doc from statictext within w_3202_alta_suministros_imp
end type
end forward

global type w_3202_alta_suministros_imp from w_sgigenerica
integer x = 626
integer y = 436
integer width = 2999
integer height = 1860
string title = "OPEN SGI - Suministros Importantes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_buscar pbm_custom40
event ue_nuevo pbm_custom42
event ue_proc_sum pbm_custom43
event ue_limpiar_campos pbm_custom51
r_3 r_3
r_1 r_1
st_2 st_2
sle_esq_cond sle_esq_cond
st_1 st_1
sle_telefono sle_telefono
d_desde_hasta d_desde_hasta
cb_confirmar cb_confirmar
cb_cancelar cb_cancelar
st_3 st_3
pb_1 pb_1
st_doc2 st_doc2
st_ape st_ape
r_2 r_2
d_cliente d_cliente
st_dir st_dir
d_direccion d_direccion
dw_1 dw_1
cb_imprimir cb_imprimir
st_nic st_nic
st_nis st_nis
st_nis2 st_nis2
d_nis_rad d_nis_rad
st_dir2 st_dir2
st_ape2 st_ape2
st_doc st_doc
end type
global w_3202_alta_suministros_imp w_3202_alta_suministros_imp

type variables
//u_dir_2001_nu_direccion_std		iu_dir_2001_nu
//u_dir_2001_rn_direccion_std	iu_dir_2001_rn
u_avi_2004_pr_form_inf_resumen	iu_avi_2004_pr
u_generico_comunicaciones		lu_comunic
u_man_2036_nu_sum_imp                   iu_man_2036_nu
u_man_2036_rn_sum_imp                    iu_man_2036_rn
s_direccion_cliente			is_direccion
s_direccion_cliente			is_dir_reset
s_avisos				is_avi_reset

long	il_ord_servicio, il_nro_incid, il_ex_avi_pendiente, ii_nis
string	is_prov, is_depto, is_munic, is_local
boolean ib_valido, ib_en_corte, ib_error

//u_avi_2004_nu_form_inf_resumen iu_avi_2004_nu
int ii_fila_ant
string is_clausula_where
string is_modificacion
string is_select_original
string retorno
//u_avi_2004_nu_form_inf_resumen lu_avi_2004_nu
int il_trajo_datos
datetime idt_f_desde
datetime idt_f_desde_inicial
datetime idt_f_expira

datetime idt_f_desde_inicio
datetime idt_f_expira_inicio

string is_columna


Boolean ib_param_nic  //**  OSGI 2001.1  15/06/2001
end variables

forward prototypes
public subroutine fw_editar_campos (datawindow pdw_datos)
public subroutine fw_visible_enabled_nic (readonly boolean ab_estado)
public function integer fw_nic ()
public function integer fw_nis ()
end prototypes

event ue_buscar;call super::ue_buscar;//int li_v_doc
//
//SetPointer(HourGlass!)
//
//// Valido Nis_Rad
//is_direccion.gl_nis = long(iu_nis_2001_pr.fpr_v_nis_rad(d_nis_rad))
//
//IF  (Len(string(is_direccion.gl_nis)) = 7) THEN
//// Cargo en la estructura el resto de los datos necesarios
//	IF iu_nis_2001_pr.fpr_c_estruc_dir_por_nis(is_direccion) = 1 THEN
//
//		//	Procedimiento Almacenado Datos_suministro ???
//
//		This.TriggerEvent("ue_proc_sum")
//
//		// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
//		st_doc.Hide()
//
//	ELSE
//		gnv_msg.f_mensaje("AR03","","",OK!)
//	END IF
//ELSE
//	IF is_direccion.gl_nis = long("0") THEN
//		gnv_msg.f_mensaje("ER32","","",OK!)
//	END IF
//
//	// Valido el Documento
//	d_cliente.AcceptText()
//	is_direccion.gs_doc = d_cliente.fpr_v_documento(d_cliente) 
//	IF is_direccion.gs_doc <> " " THEN
//
//		// Cargo en la estructura el resto de los datos necesarios
//		li_v_doc = iu_cli_2001_pr.fpr_c_estruc_dir_por_doc(is_direccion) 
//		IF li_v_doc = 1 THEN
//
//			//	Procedimiento Almacenado Datos_suministro ???
//
//			This.TriggerEvent("ue_proc_sum")					
//
//			// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
//			st_nis.Show()
//
//		ELSEIF li_v_doc = 0 THEN
//			gnv_msg.f_mensaje("AR04","","",OK!)
//		END IF
//	ELSEIF is_direccion.gl_nis = long("-1") THEN
//		gnv_msg.f_mensaje("AR05","","",OK!)
//	END IF
//END IF




end event

on ue_nuevo;call w_sgigenerica::ue_nuevo;//s_direccion_cliente ls_direccion
//
//SetRedraw(False)
//
//// Limpio los campos
//
//d_nis_rad.fpr_limpiar_campos()
//d_cliente.fpr_limpiar_campos()
//d_direccion.fpr_limpiar_campos()
//fpr_limpiar_campo_sle(sle_telefono)
//fpr_limpiar_campo_sle(sle_esq_cond)
//d_nis_rad.fpr_habilitar_campos(False)
//d_nis_rad.accepttext()
//d_cliente.accepttext()
//d_direccion.accepttext()
//
//// Habilito los campos de los user-object que utilizo
//
//d_nis_rad.fpr_habilitar_campos(True)
//d_direccion.fpr_habilitar_campos(False,True)
//fpr_habilitar_campo_sle(sle_telefono,True)
//fpr_habilitar_campo_sle(sle_esq_cond,True)
//d_cliente.fpr_habilitar_campos(True,True)
//
//// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
//st_nis2.Show()
//st_dir.Show()
//st_ape.Show()
//st_doc2.Show()
//
//// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
//d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)
//
//SetRedraw(True)
//
//// Me paro en el campo nis_rad
//d_nis_rad.SetFocus()
//
//// Limpio la estructura de trabajo 
//is_direccion = ls_direccion


end on

event ue_proc_sum;int li_imp, li_pend, li_posib, ll_nis_rad
long ll_ya_existe
string ls_nulo

SetPointer(HourGlass!)

SetRedraw(False)

IF lu_comunic.is_comunic.accion_llamada = "Alta" THEN
	ib_error = False

	ll_ya_existe = iu_man_2036_rn.frn_ya_existe(is_direccion.gl_nis)
	IF ll_ya_existe > 0 THEN
		SetRedraw(TRue)	
		gnv_msg.f_mensaje("EM20","","",OK!)
//		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ya existe este suministro importante")
		SetRedraw(FALSE)	
		SetNull(ls_nulo)

		// Limpio los campos

		d_nis_rad.fpr_limpiar_campos()
		d_cliente.fpr_limpiar_campos()
		d_direccion.fpr_limpiar_campos()
		fpr_limpiar_campo_sle(sle_esq_cond)
		d_nis_rad.fpr_habilitar_campos(False)
		d_desde_hasta.fpr_llenar_campos(is_direccion.gl_cod_cli)
		d_desde_hasta.SetItem(1,"observacion",ls_nulo)

		// Habilito los campos de los user-object que utilizo

		d_nis_rad.fpr_habilitar_campos(True)
		d_direccion.fpr_habilitar_campos(False,True)
		fpr_habilitar_campo_sle(sle_esq_cond,True)
		d_cliente.fpr_habilitar_campos(True,True)

		// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
		st_nis2.Show()
		st_dir.Show()
		st_ape.Show()
		st_doc2.Show()

		// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
		d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)
		parnum2 = lu_comunic.is_comunic.intval1					// Cod. Prov.
		parnum3 = lu_comunic.is_comunic.intval2  					// Cod. Depto.
		parnum4 = lu_comunic.is_comunic.longval4					// Cod. Munic.
		parnum5 = lu_comunic.is_comunic.longval5					// Cod. Loc.
		SetRedraw(True)

		// Me paro en el campo nis_rad
		d_nis_rad.SetFocus()

		is_direccion = is_dir_reset
		iu_avi_2004_pr.is_avisos = is_avi_reset

		ib_error = True
//		ib_en_corte = False

		cb_confirmar.enabled = False


		//******************************************
		//**  OSGI 2001.2  	14/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************
		SetNull(ll_nis_rad)
		d_nis_rad.SetItem(d_nis_rad.GetRow(), "nis_rad", ll_nis_rad)
		d_nis_rad.AcceptText()
		//******************************************
		//**  OSGI 2001.2  	14/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************


		RETURN
	END IF
	d_desde_hasta.fpr_llenar_campos(is_direccion.gl_cod_cli)	
END IF

// Oculto las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
st_nis2.Hide()
st_dir.Hide()
st_ape.Hide()
st_doc2.Hide()

cb_confirmar.enabled = TRUE

// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de la ventana
// y cargo la estructura de avisos

d_nis_rad.fpr_llenar_campos(is_direccion.gl_nis)
//SetRedraw(TRUE)
//IF d_nis_rad.fpr_llenar_campos(is_direccion.gl_nis) = 0 THEN
//		ib_bloqueado = true;
//		return
//END IF
//
d_cliente.fpr_llenar_campos(is_direccion)
d_direccion.fpr_llenar_campos(is_direccion)

// Deshabilito campos de user-object Nis_Rad,direcci$$HEX1$$f300$$ENDHEX$$n y cliente
// y habilito los campos de d_desde_hasta

d_nis_rad.fpr_habilitar_campos(False)
d_direccion.fpr_habilitar_campos(False,False)
d_cliente.fpr_habilitar_menos_ape(FALSE)

CHOOSE CASE lu_comunic.is_comunic.accion_llamada
	CASE "Alta"
		d_desde_hasta.fpr_habilitar_campos(d_desde_hasta,TRUE)
	CASE "Modifica"
		d_desde_hasta.fpr_habilitar_campos(d_desde_hasta,TRUE)
	CASE "Consulta"
		d_desde_hasta.fpr_habilitar_campos(d_desde_hasta,false)
END CHOOSE

// Cargo la clave geogr$$HEX1$$e100$$ENDHEX$$fica vertical y c$$HEX1$$f300$$ENDHEX$$digos en la estructura
iu_avi_2004_pr.fpr_c_cgv_y_cods(is_direccion)

SetRedraw(True)

end event

on ue_limpiar_campos;call w_sgigenerica::ue_limpiar_campos;//d_cliente.fpr_limpiar_campos()
//d_direccion.fpr_limpiar_campos_2()
//d_nis_rad.fpr_limpiar_campos()
//d_desde_hasta.fpr_limpiar_campos()
//
//// Habilito/deshabilito los campos de los user-object que utilizo
//d_nis_rad.fpr_habilitar_campos(True)
//d_direccion.fpr_habilitar_campos(False,True)
//d_cliente.fpr_habilitar_menos_ape(True)
//d_desde_hasta.fpr_habilitar_campos(d_desde_hasta,False)
end on

public subroutine fw_editar_campos (datawindow pdw_datos);string ls_documento, ls_pais, ls_codigo, ls_tipo

ls_codigo = pdw_datos.GetItemString(1,'co_pais')
SELECT "CODIGOS"."DESC_COD"
INTO :ls_pais
FROM "CODIGOS" 
WHERE "CODIGOS"."COD" = :ls_codigo ;

ls_tipo = pdw_datos.GetItemString(1,'tip_doc')
SELECT  "TIPOS"."DESC_TIPO"  
INTO :ls_documento
FROM "TIPOS"  
WHERE "TIPOS"."TIPO" = :ls_tipo  ;

dw_1.Modify("tip_doc_t.text = '" + ls_documento + "'")
dw_1.Modify("co_pais_t.text ='" + ls_pais + "'")
end subroutine

public subroutine fw_visible_enabled_nic (readonly boolean ab_estado);//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not ab_estado Or Not ib_param_nic Then
	st_nic.Visible = False
Else
	st_nic.Visible = True
End If
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public function integer fw_nic ();//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_nis_rad, ll_nic, ll_reg
Integer li_return
String ls_cadena
Boolean lb_abrio_cur


li_return = 1

If ib_param_nic And d_nis_rad.RowCount() > 0 Then
	d_nis_rad.AcceptText()
	ll_nic = d_nis_rad.GetItemNumber(d_nis_rad.GetRow(), "nis_rad")
	st_nic.Text = String(ll_nic)



	//******************************************
	//**  OSGI 2001.2  	09/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	ls_cadena = "SELECT NIS_RAD FROM SUMCON WHERE NIC = " + String(ll_nic)

	ls_cadena = "SELECT MAX(NIS_RAD), COUNT(*) FROM SUMCON WHERE NIC = " + String(ll_nic) + fg_tip_serv()
	//******************************************
	//**  OSGI 2001.2  	09/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************



	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_cadena ;
	OPEN DYNAMIC my_cursor ;

	If sqlca.sqlcode = 0 Then lb_abrio_cur = True

	FETCH my_cursor INTO :ll_nis_rad, :ll_reg ;

	//******************************************
	//**  OSGI 2001.2  	02/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	If sqlca.sqlcode <> 0 Or IsNull(ll_nis_rad) Then
		ll_nis_rad = 0
		ll_reg = 0
		li_return = 0
	End If

	If ll_reg > 1 Then
		OpenWithParm(w_at0113_tel, String(ll_nic) + "~t2")

		is_direccion = Message.PowerObjectParm
		
		// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
		IF (Len(string(is_direccion.gl_nis)) = 7) THEN
			ll_nis_rad = is_direccion.gl_nis
			li_return = 1
		Else
			If IsNull(is_direccion.gl_nis) Then
				li_return = -1
				SetNull(ll_nis_rad)
			Else
				li_return = 0
				ll_nis_rad = 0
			End If
		END IF
	End If
	//******************************************
	//**  OSGI 2001.2  	02/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************

	If li_return = 1 Then
		fw_visible_enabled_nic(True)
	Else
		st_nic.Text = ""
	End If
	
	d_nis_rad.SetItem(d_nis_rad.GetRow(), "nis_rad", ll_nis_rad)
	d_nis_rad.AcceptText()

	If lb_abrio_cur Then
		CLOSE my_cursor;
	End If
End If

Return li_return
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

public function integer fw_nis ();//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_nis_rad, ll_nic
Integer li_return
String ls_cadena
Boolean lb_abrio_cur


li_return = 1

If ib_param_nic And d_nis_rad.RowCount() > 0 Then
	d_nis_rad.AcceptText()
	
	
	IF lu_comunic.is_comunic.accion_llamada <> "Alta" THEN
		ll_nis_rad = lu_comunic.is_comunic.longval1
	Else
		ll_nis_rad = d_nis_rad.GetItemNumber(d_nis_rad.GetRow(), "nis_rad")
	End If
	
	
	If IsNull(ll_nis_rad) Or ll_nis_rad <= 0 Then
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El NIC solicitado no cuenta con ningun suministro asociado.")
		li_return = 0
		cb_confirmar.enabled = False
	Else
		//******************************************
		//**  OSGI 2001.2  	14/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad)

		ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad) + fg_tip_serv()
		//******************************************
		//**  OSGI 2001.2  	14/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************


		DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
		PREPARE SQLSA FROM :ls_cadena ;
		OPEN DYNAMIC my_cursor ;

		If sqlca.sqlcode = 0 Then lb_abrio_cur = True

		FETCH my_cursor INTO :ll_nic ;


		If sqlca.sqlcode <> 0 Or IsNull(ll_nic) Or ll_nic <= 0 Then
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La informaci$$HEX1$$f300$$ENDHEX$$n solicitada no cuenta con ningun contrato asociado.")
			li_return = 0
			cb_confirmar.enabled = False
		Else
			st_nic.Text = String(ll_nic)

			fw_visible_enabled_nic(True)
			li_return = 1
		End If
	End If

	If lb_abrio_cur Then
		CLOSE my_cursor;
	End If
End If

Return li_return
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

event close;call super::close;gnu_u_transaction.uf_rollback(w_3201_mantenimiento_suministros_imp)
//IF	gu_comunic.is_comunic.accion_llamada <> "Consulta" THEN
//	//ROLLBACK;
//	gnu_u_transaction.uf_rollback(THIS)
//END IF
//
fgnu_resetear_s_comunicaciones(gu_comunic)
gu_comunic.is_comunic = lu_comunic.is_comunic

// Destruyo los objetos creados en la ventana

DESTROY iu_avi_2004_pr
DESTROY lu_comunic  
DESTROY iu_man_2036_nu
DESTROY iu_man_2036_rn
end event

event open;call super::open;// El puntero del mouse toma la forma del reloj de arena
SetPointer(HourGlass!)

This.SetRedraw(False)

lu_comunic = CREATE u_generico_comunicaciones
iu_man_2036_rn = CREATE u_man_2036_rn_sum_imp
iu_man_2036_nu = CREATE u_man_2036_nu_sum_imp

lu_comunic.is_comunic = gu_comunic.is_comunic

d_desde_hasta.SetTransObject(SQLCA)

// Creo los objetos con los que trabajar$$HEX2$$e1002000$$ENDHEX$$esta ventana, y no pertenecen 
// a la misma (no fueron creados en el painter).

iu_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen

// Conecto las D.D.D.W
d_cliente.fpr_conectar(d_cliente)

// Obtener los atributos para abrir la ventana
is_prov  = lu_comunic.is_comunic.strval1
is_depto = lu_comunic.is_comunic.strval2
is_munic = lu_comunic.is_comunic.strval3
is_local = lu_comunic.is_comunic.strval4

parnum2 = lu_comunic.is_comunic.intval1			// Cod. Prov.
parnum3 = lu_comunic.is_comunic.intval2  			// Cod. Depto.
parnum4 = lu_comunic.is_comunic.longval4			// Cod. Munic.
parnum5 = lu_comunic.is_comunic.longval5			// Cod. Loc.

// Habilito/deshabilito los campos de los user-object que utilizo
d_nis_rad.fpr_habilitar_campos(True)
d_direccion.fpr_habilitar_campos(False,True)
d_cliente.fpr_habilitar_campos(True,True)
d_desde_hasta.fpr_habilitar_campos(d_desde_hasta,FALSE)
if lu_comunic.is_comunic.accion_llamada <> "Consulta" then
	//Deshabilito el boton confirmar
	cb_confirmar.enabled = FALSE
	
	// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
	st_nis2.Show()
	st_dir.Show()
	st_ape.Show()
	st_doc2.Show()
else
	cb_confirmar.enabled = FALSE
	cb_cancelar.enabled = false
	cb_confirmar.visible = FALSE
	cb_cancelar.visible = false

end if
// Inserto un registro en los user-object de trabajo
d_nis_rad.f_insertar_fila()
d_direccion.f_insertar_fila()
d_cliente.f_insertar_fila()
d_desde_hasta.fpr_insertar_fila()

// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

IF lu_comunic.is_comunic.accion_llamada <> "Alta" THEN
	iu_man_2036_nu.fnu_obtener_datos(d_desde_hasta,lu_comunic.is_comunic.longval1,lu_comunic.is_comunic.datval1)
//	d_desde_hasta.SetItem(1,"f_fin",fgnu_valido_fecha_nula(d_desde_hasta.getitemdatetime(1,"")))
	d_desde_hasta.SetItem(1,"f_desde",fgnu_valido_fecha_nula(d_desde_hasta.getitemdatetime(1,"f_desde")))
	d_desde_hasta.SetItem(1,"f_expiracion",fgnu_valido_fecha_nula(d_desde_hasta.getitemdatetime(1,"f_expiracion")))
	d_desde_hasta.AcceptText()
	pb_1.enabled = False
	cb_imprimir.enabled = True
	st_nis2.TriggerEvent("doubleclicked")
ELSE
	pb_1.enabled = True
	cb_imprimir.enabled = False
END IF

idt_f_desde_inicio = d_desde_hasta.object.f_desde[1]
idt_f_expira_inicio = d_desde_hasta.object.f_expiracion[1]

// Setea el atributo para salir de la ventana de Identificaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica
lu_comunic.is_comunic.intval10 = 1

This.SetReDraw(True)

ib_error = False
ib_en_corte = False



//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fg_ventana_parametro(This.ClassName(), d_direccion)
//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_param_nic = fg_verifica_parametro('NIC')

If ib_param_nic Then
	st_nis2.Text = 'NIC:'
	st_nis.Text = 'NIC:'
End If
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on activate;call w_sgigenerica::activate;d_nis_rad.SetFocus()
end on

on w_3202_alta_suministros_imp.create
int iCurrent
call super::create
this.r_3=create r_3
this.r_1=create r_1
this.st_2=create st_2
this.sle_esq_cond=create sle_esq_cond
this.st_1=create st_1
this.sle_telefono=create sle_telefono
this.d_desde_hasta=create d_desde_hasta
this.cb_confirmar=create cb_confirmar
this.cb_cancelar=create cb_cancelar
this.st_3=create st_3
this.pb_1=create pb_1
this.st_doc2=create st_doc2
this.st_ape=create st_ape
this.r_2=create r_2
this.d_cliente=create d_cliente
this.st_dir=create st_dir
this.d_direccion=create d_direccion
this.dw_1=create dw_1
this.cb_imprimir=create cb_imprimir
this.st_nic=create st_nic
this.st_nis=create st_nis
this.st_nis2=create st_nis2
this.d_nis_rad=create d_nis_rad
this.st_dir2=create st_dir2
this.st_ape2=create st_ape2
this.st_doc=create st_doc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_3
this.Control[iCurrent+2]=this.r_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.sle_esq_cond
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.sle_telefono
this.Control[iCurrent+7]=this.d_desde_hasta
this.Control[iCurrent+8]=this.cb_confirmar
this.Control[iCurrent+9]=this.cb_cancelar
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.st_doc2
this.Control[iCurrent+13]=this.st_ape
this.Control[iCurrent+14]=this.r_2
this.Control[iCurrent+15]=this.d_cliente
this.Control[iCurrent+16]=this.st_dir
this.Control[iCurrent+17]=this.d_direccion
this.Control[iCurrent+18]=this.dw_1
this.Control[iCurrent+19]=this.cb_imprimir
this.Control[iCurrent+20]=this.st_nic
this.Control[iCurrent+21]=this.st_nis
this.Control[iCurrent+22]=this.st_nis2
this.Control[iCurrent+23]=this.d_nis_rad
this.Control[iCurrent+24]=this.st_dir2
this.Control[iCurrent+25]=this.st_ape2
this.Control[iCurrent+26]=this.st_doc
end on

on w_3202_alta_suministros_imp.destroy
call super::destroy
destroy(this.r_3)
destroy(this.r_1)
destroy(this.st_2)
destroy(this.sle_esq_cond)
destroy(this.st_1)
destroy(this.sle_telefono)
destroy(this.d_desde_hasta)
destroy(this.cb_confirmar)
destroy(this.cb_cancelar)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.st_doc2)
destroy(this.st_ape)
destroy(this.r_2)
destroy(this.d_cliente)
destroy(this.st_dir)
destroy(this.d_direccion)
destroy(this.dw_1)
destroy(this.cb_imprimir)
destroy(this.st_nic)
destroy(this.st_nis)
destroy(this.st_nis2)
destroy(this.d_nis_rad)
destroy(this.st_dir2)
destroy(this.st_ape2)
destroy(this.st_doc)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3202_alta_suministros_imp
end type

type r_3 from rectangle within w_3202_alta_suministros_imp
integer linethickness = 4
long fillcolor = 81324524
integer x = 32
integer y = 20
integer width = 640
integer height = 116
end type

type r_1 from rectangle within w_3202_alta_suministros_imp
integer linethickness = 4
long fillcolor = 81324524
integer x = 32
integer y = 168
integer width = 2898
integer height = 464
end type

type st_2 from statictext within w_3202_alta_suministros_imp
boolean visible = false
integer x = 69
integer y = 896
integer width = 293
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Tel No.:"
boolean focusrectangle = false
end type

type sle_esq_cond from singlelineedit within w_3202_alta_suministros_imp
boolean visible = false
integer x = 649
integer y = 468
integer width = 1490
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_3202_alta_suministros_imp
boolean visible = false
integer x = 46
integer y = 484
integer width = 603
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Esquina/Condominio:"
boolean focusrectangle = false
end type

type sle_telefono from singlelineedit within w_3202_alta_suministros_imp
boolean visible = false
integer x = 361
integer y = 884
integer width = 416
integer height = 84
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type d_desde_hasta from u_man_2036_pr_sum_imp within w_3202_alta_suministros_imp
event ue_itemchanged pbm_custom21
integer x = 32
integer y = 1112
integer width = 2898
integer height = 396
integer taborder = 30
boolean border = true
boolean righttoleft = true
end type

event ue_itemchanged;boolean lb_valido
string ls_valido
DateTime ldt_desde, ldt_hasta, ldt_expira

ib_valido = True

ldt_desde = This.GetItemDateTime(1,"f_desde")
//ldt_hasta = This.GetItemDateTime(1,"f_fin")
ldt_expira = This.GetItemDateTime(1,"f_expiracion")

ldt_desde = fgnu_valido_fecha_nula(ldt_desde)
ldt_hasta = fgnu_valido_fecha_nula(ldt_hasta)
ldt_expira = fgnu_valido_fecha_nula(ldt_expira)

This.SetItem(1,"f_desde",ldt_desde)
//This.SetItem(1,"f_fin",ldt_hasta)
This.SetItem(1,"f_expiracion",ldt_expira)

lb_valido = iu_man_2036_rn.frn_validar_nulos(d_desde_hasta)

IF lb_valido = FALSE THEN
	ib_valido = False
	gnv_msg.f_mensaje("EM18","","",OK!)
	CHOOSE CASE is_columna
//	CASE "f_fin"
//		this.setcolumn("f_fin")
//		this.setitem(1,"f_fin",idt_f_fin)
	CASE "f_desde"
		this.setcolumn("f_desde")
		this.setitem(1,"f_desde",idt_f_desde)
	CASE "f_expiracion"
		this.setcolumn("f_expiracion")
		this.setitem(1,"f_expiracion",idt_f_expira)
	END CHOOSE
//	this.accepttext()
	RETURN
END IF

ls_valido = iu_man_2036_rn.frn_validar_fechas(d_desde_hasta)

IF ls_valido <> "OK" THEN
	ib_valido = False
	CHOOSE CASE is_columna
//	CASE "f_fin"
//		gnv_msg.f_mensaje("EM19", "", "", OK!)
//		This.setcolumn("f_fin")
//		This.setitem(1,"f_fin",idt_f_fin)
	CASE "f_desde"
		This.setcolumn("f_desde")
		This.setitem(1,"f_desde",idt_f_desde)
	CASE "f_expiracion"
		gnv_msg.f_mensaje("EM17", "", "", OK!)
		This.setcolumn("f_expiracion")
		This.setitem(1,"f_expiracion",idt_f_expira)
	END CHOOSE
This.SetFocus()
RETURN
END IF

end event

event itemchanged;int li_lock_status
//
//IF gu_comunic.is_comunic.accion_llamada = "Modifica" THEN
//	li_lock_status = gnu_u_transaction.uf_lock(Parent, "GI_SUMINISTROS_IMP", "NIS_RAD = " + string(gu_comunic.is_comunic.longval1))
//	IF li_lock_status <> 0 THEN
//		ib_valido = false
//		return 2
//	END IF
//END IF
//idt_f_fin=this.getitemdatetime(1,"f_fin")
idt_f_desde=this.getitemdatetime(1,"f_desde")
idt_f_expira=this.getitemdatetime(1,"f_expiracion")
is_columna=this.getcolumnname()
This.postevent("ue_itemchanged")

end event

event dberror;call super::dberror;IF SQLDBCode = 1 THEN
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Otro usuario acaba de dar de alta a este suministro")
	gnv_msg.f_mensaje("EM58","","",OK!)
END IF
return 1
end event

type cb_confirmar from u_cb within w_3202_alta_suministros_imp
integer x = 622
integer y = 1536
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;call super::clicked;string ls_valido,ls_mensaje
int li_confirmo,li_tipo
long ll_nis,ll_cod_cli, ll_control, ll_ya_existe
long ll_instalacion,ll_nro_ct
boolean lb_valido
datetime ld_f_expiracion, ld_f_desde, ld_f_actual

setpointer(hourglass!)
ib_valido = true

d_desde_hasta.AcceptText()
Yield()

IF ib_valido = False THEN
	d_desde_hasta.SetFocus()
	Return
END IF

ld_f_actual = fgnu_fecha_actual()
ld_f_expiracion= d_desde_hasta.GetItemDateTime(1,"f_expiracion")
ld_f_desde = d_desde_hasta.GetItemDateTime(1,"f_desde")

lu_comunic.is_comunic.programa_retorno = "w_3202_sumin_imp"

lu_comunic.is_comunic.accion_retorno="Actualizacion"

ll_nis = d_nis_rad.GetItemNumber(1,"nis_rad")

IF lu_comunic.is_comunic.accion_llamada <> "Alta" THEN
	ll_ya_existe = iu_man_2036_rn.frn_ya_existe2(is_direccion.gl_nis,lu_comunic.is_comunic.datval1)
	IF ll_ya_existe>0  and ld_f_expiracion> datetime(Today(),Now()) THEN
		gnv_msg.f_mensaje("EM20","","",OK!)
		d_desde_hasta.SetFocus()
		Return
	end if
end if

// Recuperamos el CT que alimenta al VIP

select nro_instalacion
into :ll_nro_ct
from sgd_instalacion
where tipo_instalacion = :fgci_tipo_ct
start with nro_instalacion = (select instalacion_origen from sgd_acometida,aco_sum where nis_rad=:ll_nis and codigo=nro_acometida)
connect by prior nro_inst_padre = nro_instalacion;

d_desde_hasta.object.nro_instalacion[1] = ll_nro_ct

// Actualizamos los datos
iu_man_2036_nu.fnu_actualizar(d_desde_hasta,ll_nis)
gnu_u_transaction.uf_commit(w_3201_mantenimiento_suministros_imp)

// Comunicamos la tool al Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n

if  gb_operaciones=true then 
	
	if lu_comunic.is_comunic.accion_llamada = "Alta" or (lu_comunic.is_comunic.accion_llamada = "Modifica" and idt_f_expira_inicio <= ld_f_actual) then  // ALTA
		li_tipo = 1
	//	messagebox("Hola","Alta")
	elseif lu_comunic.is_comunic.accion_llamada = "Modifica" then  // MOD
		li_tipo = 2
	//	messagebox("Hola","Modifico")
	end if
	
	if ld_f_expiracion < ld_f_actual then 	
		li_tipo = 0
	end if
	
	if isvalid(gu_operaciones) then 	
		
		if gu_rf_servidor_operacion.of_tool_vip(ll_nro_ct,ld_f_desde,li_tipo,ls_mensaje,gi_ci_ct,ld_f_expiracion,ll_nis)=1 then 
			Close(Parent)
			return
		else  // ERROR AL ENVIAR A OPERACIONES
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Error al enviar la tool VIP a Operaci$$HEX1$$f300$$ENDHEX$$n: " + ls_mensaje,information!,okcancel!)
			Close(Parent)
			return
		end if
	else 		// OPERACIONES PERO OBJETO INVALIDO
		Close(Parent)
		return
	end if 
 
end if

Close(Parent)
return
end event

type cb_cancelar from u_cb within w_3202_alta_suministros_imp
integer x = 1353
integer y = 1536
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;call super::clicked;gnu_u_transaction.uf_rollback(w_3201_mantenimiento_suministros_imp)
Close(Parent)
end event

type st_3 from statictext within w_3202_alta_suministros_imp
integer x = 1861
integer y = 44
integer width = 599
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Deshacer"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_3202_alta_suministros_imp
integer x = 1746
integer y = 36
integer width = 96
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "undo3.bmp"
string disabledname = "undo3dis.bmp"
end type

event clicked;string ls_nulo

//gnu_u_transaction.uf_rollback(PARENT)
SetRedraw(False)


SetNull(ls_nulo)

// Limpio los campos

d_nis_rad.fpr_limpiar_campos()
d_cliente.fpr_limpiar_campos()
d_direccion.fpr_limpiar_campos()
fpr_limpiar_campo_sle(sle_esq_cond)
d_nis_rad.fpr_habilitar_campos(False)
d_desde_hasta.fpr_llenar_campos(is_direccion.gl_cod_cli)
d_desde_hasta.SetItem(1,"observacion",ls_nulo)

// Habilito los campos de los user-object que utilizo

d_nis_rad.fpr_habilitar_campos(True)
d_direccion.fpr_habilitar_campos(False,True)
fpr_habilitar_campo_sle(sle_esq_cond,True)
d_cliente.fpr_habilitar_campos(True,True)


// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
st_nis2.Show()
st_dir.Show()
st_ape.Show()
//st_nis.Hide()
st_doc2.Show()


// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

parnum2 = lu_comunic.is_comunic.intval1					// Cod. Prov.
parnum3 = lu_comunic.is_comunic.intval2  					// Cod. Depto.
parnum4 = lu_comunic.is_comunic.longval4					// Cod. Munic.
parnum5 = lu_comunic.is_comunic.longval5				   // Cod. Loc.
  

SetRedraw(True)


// Me paro en el campo nis_rad
d_nis_rad.SetFocus()


is_direccion = is_dir_reset
iu_avi_2004_pr.is_avisos = is_avi_reset

ib_error = False
ib_en_corte = False

cb_confirmar.enabled = False


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_nic.Text = ''

fw_visible_enabled_nic(False)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type st_doc2 from statictext within w_3202_alta_suministros_imp
integer x = 1161
integer y = 736
integer width = 338
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "ID No.:"
boolean focusrectangle = false
end type

event doubleclicked;int li_v_doc
string ls_doc

SetPointer(HourGlass!)

// Valido el Documento
d_cliente.AcceptText()

is_direccion.gs_doc = d_cliente.fpr_v_documento(d_cliente)
is_direccion.gs_tipo_doc = d_cliente.getItemString(1,"tip_doc")
is_direccion.gs_pais = d_cliente.getItemString(1,"co_pais")

if is_direccion.gs_doc = " " or isNull(is_direccion.gs_tipo_doc) or is_direccion.gs_tipo_doc = "" or isNull(is_direccion.gs_pais ) or is_direccion.gs_pais = "" then
	gnv_msg.f_mensaje("ER41","","",OK!)	
	RETURN
end if

IF is_direccion.gs_doc <> " " THEN
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(True)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


	// Abro ventana con lista de clientes con dicho documento
	OpenWithParm(w_1109_list_clientes_por_doc,is_direccion)
	IF parnum1 = 1 THEN

		is_direccion.gl_cod_cli = Message.DoubleParm

		// Cargo en la estructura el resto de los datos necesarios
		li_v_doc = d_cliente.fpr_c_estruc_dir_por_doc(is_direccion) 
		IF li_v_doc = 1 THEN
	
			//	Procedimiento Almacenado Datos_suministro ???
	
			Parent.TriggerEvent("ue_proc_sum")
//			IF ib_bloqueado=TRUE THEN 
//				ib_bloqueado=FALSE
//				Parent.pb_1.TriggerEvent("clicked")
//				return
//			END IF
			// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
			st_doc.Show()
			st_doc2.Hide()
			st_nis.Hide()
			st_nis2.Hide()
			st_ape.Hide()
			st_ape2.Hide()
			st_dir2.Hide()
			st_dir.Hide()


			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			fw_nis()
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		ELSEIF li_v_doc = 0 THEN
			gnv_msg.f_mensaje("AR04","","",OK!)
		END IF

	END IF

ELSEIF is_direccion.gl_nis = long("-1") THEN
	gnv_msg.f_mensaje("ER51","","",OK!)
END IF



end event

type st_ape from statictext within w_3202_alta_suministros_imp
integer x = 46
integer y = 732
integer width = 302
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Apellidos:"
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)

// Lo inhabilito
This.Enabled = False

// Cargo datos ingresados en las var. globales corresp.
d_cliente.AcceptText()
parmstr1 = d_cliente.GetItemString(1,"ap1")
parmstr2 = d_cliente.GetItemString(1,"ap2")
parmstr3 = d_cliente.GetItemString(1,"nombre")


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_visible_enabled_nic(True)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


if d_cliente.fpr_cargarDatosCliente(parmstr3,parmstr1,parmstr2) then

	// Abro ventana para identificar el suministro

	Open(w_re0500_ss)
	W_operaciones.SetFocus()
	Parent.SetFocus()

	// Si no encontr$$HEX2$$f3002000$$ENDHEX$$el suministro

	IF parnum1 = 0 THEN
		dir.gl_nis = 0
	END IF

	// Cierro la ventana, pasando como par$$HEX1$$e100$$ENDHEX$$m. la estructura con los datos 

	//CloseWithReturn(Parent, dir)

	is_direccion = dir
	
else
	// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
	Open(w_at0113)

	//gu_comunic.fnu_abrir(w_at0113,"w_at0113",1,1,w_3202_alta_suministros_imp,"w_3202_alta_suministros_imp")	


	// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n
	// de cliente
	is_direccion = Message.PowerObjectParm
end if

// Lo habilito
This.Enabled = True

SetPointer(HourGlass!)

// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
IF (Len(string(is_direccion.gl_nis)) = 7) THEN
	
	lu_comunic.is_comunic = gu_comunic.is_comunic

	IF lu_comunic.is_comunic.intval10 = 1 THEN
		ib_en_corte = True
		gnv_msg.f_mensaje("AR15","","",OK!)
		RETURN
	ELSEIF lu_comunic.is_comunic.intval10 = 0 THEN
		ib_en_corte = False
	END IF

	Parent.TriggerEvent("ue_proc_sum")
//	IF ib_bloqueado=TRUE THEN 
//		ib_bloqueado=FALSE
//		Parent.pb_1.TriggerEvent("clicked")
//		return
//	END IF
	SetRedraw(False)
	
	// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
	st_doc.Hide()
	st_doc2.Hide()
	st_nis.Hide()
	st_nis2.Hide()
	st_ape.Hide()
	st_ape2.Show()
	st_dir2.Hide()
	st_dir.Hide()


	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_nis()
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


	SetRedraw(True)
	
ELSE
	
	//	Cargar estructura de comunicaciones con mensaje de error.
	
END IF


end event

type r_2 from rectangle within w_3202_alta_suministros_imp
integer linethickness = 4
long fillcolor = 81324524
integer x = 37
integer y = 668
integer width = 2898
integer height = 404
end type

type d_cliente from u_cli_2001_pr_cliente_std within w_3202_alta_suministros_imp
event ue_enter pbm_dwnkey
integer x = 50
integer y = 672
integer width = 2286
integer height = 396
integer taborder = 80
boolean border = false
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////
long ll_row
AcceptText()

IF KeyDown(KeyEnter!) AND lu_comunic.is_comunic.accion_llamada <> "Consulta" AND &
	st_ape.visible THEN
	ll_row=RowCount()
	AcceptText()
		IF NOT IsNull(GetItemString(ll_row,"doc_id")) AND IsNull(GetItemString(ll_row,"ap1")) THEN
			st_doc2.TriggerEvent("doubleclicked")
		ELSE
			st_ape.TriggerEvent("doubleclicked")
		END IF
		
END IF
end event

type st_dir from statictext within w_3202_alta_suministros_imp
integer x = 46
integer y = 492
integer width = 334
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)
string ls_nulo

SetNull(ls_nulo)
// Limpio la estructura
//SetNull(is_direccion)
SetNull(is_direccion.gs_prov)
SetNull(is_direccion.gs_depto)
SetNull(is_direccion.gs_munic)
SetNull(is_direccion.gs_local)
SetNull(is_direccion.gs_calle)
SetNull(is_direccion.gl_numero)
SetNull(is_direccion.gs_duplic)
SetNull(is_direccion.gs_pisodpto)
SetNull(is_direccion.gl_codcalle)
SetNull(is_direccion.gl_codloc)
SetNull(is_direccion.gl_codmun)
SetNull(is_direccion.gl_codprov)
SetNull(is_direccion.gl_coddepto)
SetNull(is_direccion.gl_nis)
SetNull(is_direccion.gl_nif)
SetNull(is_direccion.gs_esq_cond)
SetNull(is_direccion.gs_ape1)
SetNull(is_direccion.gs_ape2)
SetNull(is_direccion.gs_nom)
SetNull(is_direccion.gs_doc)
SetNull(is_direccion.gs_tipo_doc)
SetNull(is_direccion.gs_pais)
SetNull(is_direccion.gs_telefono)
SetNull(is_direccion.gs_co_pais)
SetNull(is_direccion.gl_cod_cli)
SetNull(is_direccion.gs_ref)

//


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_visible_enabled_nic(True)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


// Acepto los datos ingresados
d_direccion.AcceptText() 

// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n ingresada, carg$$HEX1$$e100$$ENDHEX$$ndola en la est. de comunic.
d_direccion.fpr_c_datos(lu_comunic,sle_esq_cond)

// Cargo en la est. el valor que corresponde para llamar a la ventana
// de ident. geogr$$HEX1$$e100$$ENDHEX$$fica.
lu_comunic.is_comunic.strval10 = "Nis_imp"

	// Se obtiene del usuario
	gu_comunic.is_comunic.intval1=gi_cod_provincia
	gu_comunic.is_comunic.intval2=gi_cod_departamento
	gu_comunic.is_comunic.longval4=gl_cod_municipio
	gu_comunic.is_comunic.longval5=gl_cod_localidad
	gu_comunic.is_comunic.strval1=gs_provincia
	gu_comunic.is_comunic.strval2=gs_departamento	
	gu_comunic.is_comunic.strval3=gs_municipio
	gu_comunic.is_comunic.strval4=gs_localidad
	parmstr6=""
	parmstr7=""
	parmstr8=""


	parnum2 = gu_comunic.is_comunic.intval1
	parnum3 = gu_comunic.is_comunic.intval2
	parnum4 = gu_comunic.is_comunic.longval4
	parnum5 = gu_comunic.is_comunic.longval5
	
	gu_comunic.is_comunic.programa_llamante = 'w_3202'

// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica
OpenWithParm(w_id0100,lu_comunic,w_3202_alta_suministros_imp)

// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n
// geogr$$HEX1$$e100$$ENDHEX$$fica (estructura "s_direcci$$HEX1$$f300$$ENDHEX$$n")
is_direccion = Message.PowerObjectParm

// Cargo los datos que trajo de la pantalla de Identificaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica
d_direccion.fpr_llenar_campos(is_direccion)
lu_comunic.is_comunic.intval1 = is_direccion.gl_codprov
lu_comunic.is_comunic.intval2 = is_direccion.gl_coddepto
lu_comunic.is_comunic.longval4 = is_direccion.gl_codmun
lu_comunic.is_comunic.longval5 = is_direccion.gl_codloc
lu_comunic.is_comunic.strval1 = is_direccion.gs_prov
lu_comunic.is_comunic.strval2 = is_direccion.gs_depto
lu_comunic.is_comunic.strval3 = is_direccion.gs_munic
lu_comunic.is_comunic.strval4 = is_direccion.gs_local

// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica
IF (Len(string(is_direccion.gl_nis)) = 7) THEN
	
	lu_comunic.is_comunic = gu_comunic.is_comunic

	IF lu_comunic.is_comunic.intval10 = 1 THEN
		ib_en_corte = True
		gnv_msg.f_mensaje("AR15","","",OK!)
		RETURN
	ELSEIF lu_comunic.is_comunic.intval10 = 0 THEN
		ib_en_corte = False
	END IF

	Parent.TriggerEvent("ue_proc_sum")
//	IF ib_bloqueado=TRUE THEN 
//		ib_bloqueado=FALSE
//		Parent.pb_1.TriggerEvent("clicked")
//		return
//	END IF
	// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
	st_doc.Hide()
	st_doc2.Hide()
	st_nis.Hide()
	st_nis2.Hide()
	st_ape.Hide()
	st_ape2.Hide()
	st_dir2.Show()
	st_dir.Hide()
	
ELSE
	
	//	Cargar estructura de comunicaciones con mensaje de error.
	
	//	Cargar estructura de comunicaciones con mensaje de error.
		// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de direcci$$HEX1$$f300$$ENDHEX$$n 
      //d_direccion.fpr_llenar_campos(is_direccion)
		d_direccion.Setitem(1,"calle",ls_nulo)	
		//Mato
		d_direccion.object.calle[1] = ""
		d_direccion.object.numero[1] = ""
		d_direccion.object.duplic[1] = ""
		gu_comunic.is_comunic.strval4 = d_direccion.GetItemString(1,"localidad")

	IF NOT IsNull(is_direccion.gs_esq_cond) THEN
		fpr_llenar_campo_sle(sle_esq_cond,string(is_direccion.gs_esq_cond))
	END IF

END IF


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_nis()
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type d_direccion from u_dir_2001_pr_direccion_std within w_3202_alta_suministros_imp
event ue_enter pbm_dwnkey
integer x = 37
integer y = 176
integer width = 2848
integer height = 420
integer taborder = 60
boolean border = false
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) AND lu_comunic.is_comunic.accion_llamada <> "Consulta" AND &
	st_dir.visible THEN  
	st_dir.TriggerEvent("doubleclicked")
END IF
end event

type dw_1 from datawindow within w_3202_alta_suministros_imp
boolean visible = false
integer x = 114
integer y = 188
integer width = 1646
integer height = 448
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_consulta_sum_impr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_3202_alta_suministros_imp
integer x = 2048
integer y = 1536
integer width = 411
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_direccion, dwc_cliente, dwc_nis, dwc_desde
string ls_titulo
long ll_longitud

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Suministro Importante'
ll_longitud = len (ls_titulo)*100
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_1.getchild ("d_direccion_imp",dwc_direccion)
d_direccion.sharedata(dwc_direccion)
lst_impresion.pa_todos[1]=d_direccion
lst_impresion.pa_nombres[1]='d_direccion_imp'

dw_1.getchild ("d_cliente_imp",dwc_cliente)
d_cliente.sharedata(dwc_cliente)
lst_impresion.pa_todos[2]=d_cliente
lst_impresion.pa_nombres[2]='d_cliente_imp'

dw_1.getchild ("d_avi_imp",dwc_nis)
d_nis_rad.sharedata(dwc_nis)
lst_impresion.pa_todos[3]=d_nis_rad
lst_impresion.pa_nombres[3]='d_avi_imp'

dw_1.getchild ("d_desde_hasta_imp",dwc_desde)
d_desde_hasta.sharedata(dwc_desde)
lst_impresion.pa_todos[4]=d_desde_hasta
lst_impresion.pa_nombres[4]='d_desde_hasta_imp'


lst_impresion.total = 4
IF d_nis_rad.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF
fw_editar_campos(d_cliente)

dw_1.SetTransObject(SQLCA)

//lst_impresion.pdw_datawindow = dw_1
//lst_impresion.pdw_lista = d_lista_brigada
lst_impresion.pdw_compuesto = dw_1
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)

	
	

end event

type st_nic from statictext within w_3202_alta_suministros_imp
boolean visible = false
integer x = 279
integer y = 40
integer width = 347
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_nis from statictext within w_3202_alta_suministros_imp
integer x = 50
integer y = 48
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Nis:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nis2 from statictext within w_3202_alta_suministros_imp
event ue_enter pbm_keydown
boolean visible = false
integer x = 50
integer y = 48
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Nis:"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_enter;IF KeyDown(KeyEnter!) THEN TriggerEvent("doubleclicked")
end event

event doubleclicked;int li_v_doc, li_res_c_estr, li_return_nic

SetPointer(HourGlass!)


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
IF lu_comunic.is_comunic.accion_llamada <> "Alta" THEN
	fw_nis()
	li_return_nic = 1
Else
	li_return_nic = fw_nic()
End If
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


IF lu_comunic.is_comunic.accion_llamada <> "Alta" THEN
	is_direccion.gl_nis = lu_comunic.is_comunic.longval1
ELSE
	is_direccion.gl_nis = long(d_nis_rad.fpr_v_nis_rad(d_nis_rad))
END IF

IF  (Len(string(is_direccion.gl_nis)) = 7) And li_return_nic = 1 THEN
	// Cargo en la estructura el resto de los datos necesarios


	ib_en_corte = False

	IF lu_comunic.is_comunic.accion_llamada = "Alta" THEN
	
		li_res_c_estr = d_nis_rad.fpr_c_estruc_dir_por_nis(is_direccion) 

			IF li_res_c_estr = 3 THEN
				ib_en_corte = True
			END IF

	ELSE
		li_res_c_estr = d_nis_rad.fpr_c_estruc_dir_por_nis_3(is_direccion) 
	END IF


	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	st_nic.BackColor = Long(d_nis_rad.Describe("nis_rad.BackGround.Color"))
	st_nic.TextColor = Long(d_nis_rad.Describe("nis_rad.Color"))
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************


			IF li_res_c_estr = 1 THEN						//OR li_res_c_estr = 3 
	
			//	Procedimiento Almacenado Datos_suministro ???
	
			Parent.TriggerEvent("ue_proc_sum")
	
			IF ib_error THEN
				//***************************************
				//**  OSGI 2001.1  	15/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				fw_visible_enabled_nic(False)
				//***************************************
				//**  OSGI 2001.1  	15/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************

				Return
			END IF

			// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
			st_doc.Hide()
			st_doc2.Hide()
			st_nis.Show()
			st_nis2.Hide()
			st_ape.Hide()
			st_ape2.Hide()
			st_dir2.Hide()
			st_dir.Hide()
	
		ELSEIF li_res_c_estr = 0 THEN
			gnv_msg.f_mensaje("AR03","","",OK!)

			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			fw_visible_enabled_nic(False)
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		ELSEIF li_res_c_estr = 2 THEN
			gnv_msg.f_mensaje("AR13","","",OK!)

			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			fw_visible_enabled_nic(False)
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************

			cb_confirmar.enabled = False
			Return
			
		ELSEIF li_res_c_estr = -1 THEN
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			fw_visible_enabled_nic(False)
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************

			ib_error = True

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			//md_ing_avisos.f_habilitar("GRABAR",false)

			RETURN
		END IF
ELSE
	If li_return_nic = 0 Then gnv_msg.f_mensaje("ER32","","",OK!)

	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_nic.BackColor = Long(d_nis_rad.Describe("nis_rad.BackGround.Color"))
st_nic.TextColor = Long(d_nis_rad.Describe("nis_rad.Color"))
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type d_nis_rad from u_nis_2001_pr_nis_rad within w_3202_alta_suministros_imp
event ue_enter pbm_dwnkey
integer x = 37
integer y = 24
integer width = 631
integer height = 108
integer taborder = 40
boolean border = false
end type

event ue_enter;call super::ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) THEN  st_nis2.TriggerEvent("doubleclicked")
end event

event editchanged;// En este evento se controla que el usuario no introduzca como primer caracter del
// Nis, el signo negativo.   (GVE)
string ls_nis

ls_nis = d_nis_rad.GetText()
if ls_nis = "-" then
	d_nis_rad.SetText("")
end if
end event

type st_dir2 from statictext within w_3202_alta_suministros_imp
integer x = 46
integer y = 492
integer width = 334
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

type st_ape2 from statictext within w_3202_alta_suministros_imp
integer x = 59
integer y = 728
integer width = 302
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
string text = "Apellidos:"
boolean focusrectangle = false
end type

type st_doc from statictext within w_3202_alta_suministros_imp
integer x = 1170
integer y = 736
integer width = 343
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "ID No.:"
boolean focusrectangle = false
end type


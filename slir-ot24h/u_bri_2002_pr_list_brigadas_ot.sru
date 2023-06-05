HA$PBExportHeader$u_bri_2002_pr_list_brigadas_ot.sru
forward
global type u_bri_2002_pr_list_brigadas_ot from u_gen_0000_lista
end type
end forward

global type u_bri_2002_pr_list_brigadas_ot from u_gen_0000_lista
int Width=2117
int Height=512
string DataObject="d_bri_2002_pr_list_brigadas_ot"
end type
global u_bri_2002_pr_list_brigadas_ot u_bri_2002_pr_list_brigadas_ot

type variables
u_bri_2002_nu_lista_brigadas_ot iu_bri_2002_nu 
w_2301_form_incidencia iw_contenedora
end variables

forward prototypes
public function integer fnu_quitar_brigada (long click_row)
public function boolean fpr_validar_fechas (integer pi_fila_dw, datetime pdt_f_vieja, datetime pdt_f_nueva, string ps_columna)
end prototypes

public function integer fnu_quitar_brigada (long click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_quitar_brigadas
// 
// Objetivo: Borra de la datawindow la fila seleccionada
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: --
//			Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

this.DeleteRow(click_row)

Return 1
end function

public function boolean fpr_validar_fechas (integer pi_fila_dw, datetime pdt_f_vieja, datetime pdt_f_nueva, string ps_columna);
This.Drag(end!)
IF iw_contenedora.tab_1.ii_tipo_incid = fgci_incidencia_imprevista THEN
	IF pdt_f_nueva > fgnu_fecha_actual() THEN
		gnv_msg.f_mensaje("AI93","","",OK!)
		//MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha ingresada no puede ser mayor que la fecha actual.")
		This.SetItem(pi_fila_dw,ps_columna,pdt_f_vieja)
		This.AcceptText()
		This.SetColumn(ps_columna)
		
		Return False
	
	ELSE
	
		Return True
	END IF
END IF

Return True

end function

on rbuttondown;//md_lista_brigadas lm_accion
//
//lm_accion = create md_lista_brigadas
//lm_accion.m_opcion.Popmenu(PointerX(),PointerY())
end on

event constructor;SetRowFocusIndicator(Hand!)
gu_control_v_incidencias.of_recupera_padre(iw_contenedora,this,"w_2301_form_incidencia")


//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fg_ventana_parametro(This.DataObject, This)
//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event


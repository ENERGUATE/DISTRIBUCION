HA$PBExportHeader$u_gen_id0106.sru
forward
global type u_gen_id0106 from u_gen_0000_lista
end type
end forward

global type u_gen_id0106 from u_gen_0000_lista
integer width = 2501
integer height = 716
string dataobject = "d_id0106"
boolean hscrollbar = true
boolean vscrollbar = true
end type
global u_gen_id0106 u_gen_id0106

event sqlpreview;call super::sqlpreview;//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
String ls_syntax



If fg_valida_nic_tip_serv() = 1 Then 
	ls_syntax = sqlsyntax
	
	fg_replace_text(ls_syntax, "0 AS C_NIC", ' "NIC" AS C_NIC ')
	fg_replace_text(ls_syntax, "'     ' AS C_TIP_SERV", ' "SUMCON"."TIP_SERV" AS C_TIP_SERV ')

	ls_syntax += fg_tip_serv()

	This.SetSQLPreview(ls_syntax)
End If
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
end event

event retrievestart;call super::retrievestart;//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
If fg_valida_nic_tip_serv() = 1 Then fg_ventana_parametro(Parent.ClassName() + "_NIC", This)  //**  INSERTA COLUMNAS ADICIONALES AL DW  **
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
end event

on u_gen_id0106.create
call super::create
end on

on u_gen_id0106.destroy
call super::destroy
end on


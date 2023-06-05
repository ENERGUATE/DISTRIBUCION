HA$PBExportHeader$u_gen_at0113_1.sru
forward
global type u_gen_at0113_1 from u_gen_0000_lista
end type
end forward

global type u_gen_at0113_1 from u_gen_0000_lista
string DataObject="d_at0113_1"
end type
global u_gen_at0113_1 u_gen_at0113_1

event constructor;call super::constructor;//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
fg_ventana_parametro(Parent.ClassName(), This)

If fg_valida_nic_tip_serv() = 1 Then fg_ventana_parametro(Parent.ClassName() + "_NIC", This)  //**  INSERTA COLUMNAS ADICIONALES AL DW  **
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
// + "_" + This.DataObject
fg_ventana_parametro(Parent.ClassName(), This)

If fg_valida_nic_tip_serv() = 1 Then fg_ventana_parametro(Parent.ClassName() + "_NIC", This)  //**  INSERTA COLUMNAS ADICIONALES AL DW  **
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
end event

event sqlpreview;call super::sqlpreview;//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
String ls_syntax


If fg_valida_nic_tip_serv() = 1 Then 
	ls_syntax = sqlsyntax
	
	fg_replace_text(ls_syntax, "0 AS C_NIC", ' SUMCON.NIC AS C_NIC ')
	fg_replace_text(ls_syntax, "'     ' AS C_TIP_SERV", ' SUMCON.TIP_SERV AS C_TIP_SERV ')

	ls_syntax += fg_tip_serv()

	//MessageBox(This.DataObject, Parent.ClassName())
	This.SetSQLPreview(ls_syntax)
End If
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
end event


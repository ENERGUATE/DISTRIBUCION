HA$PBExportHeader$u_bdg_2002_pr_est_zona_geo1.sru
forward
global type u_bdg_2002_pr_est_zona_geo1 from u_gen_0000_lista
end type
end forward

global type u_bdg_2002_pr_est_zona_geo1 from u_gen_0000_lista
int Width=2555
string DataObject="d_bdg_2002_pr_est_zonas_geo1"
end type
global u_bdg_2002_pr_est_zona_geo1 u_bdg_2002_pr_est_zona_geo1

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("nom_cmd_t.Text = '" + fg_cor_dw("CMD", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event


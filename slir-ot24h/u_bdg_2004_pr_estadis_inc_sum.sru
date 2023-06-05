HA$PBExportHeader$u_bdg_2004_pr_estadis_inc_sum.sru
forward
global type u_bdg_2004_pr_estadis_inc_sum from u_gen_0000_lista
end type
end forward

global type u_bdg_2004_pr_estadis_inc_sum from u_gen_0000_lista
int Width=2482
int Height=904
string DataObject="d_bdg_2004_pr_estadis_inc_sum"
end type
global u_bdg_2004_pr_estadis_inc_sum u_bdg_2004_pr_estadis_inc_sum

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


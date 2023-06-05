HA$PBExportHeader$u_bdg_2008_pr_energ_perd_corte.sru
forward
global type u_bdg_2008_pr_energ_perd_corte from u_bdg_1001_pr_generico
end type
end forward

global type u_bdg_2008_pr_energ_perd_corte from u_bdg_1001_pr_generico
int Width=2377
int Height=904
string DataObject="d_bdg_2008_pr_energ_perd_corte"
end type
global u_bdg_2008_pr_energ_perd_corte u_bdg_2008_pr_energ_perd_corte

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("nom_cmd_t.Text = '" + fg_cor_dw("CMD", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	18/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event


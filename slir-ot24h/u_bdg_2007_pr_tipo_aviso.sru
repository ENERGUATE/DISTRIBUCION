HA$PBExportHeader$u_bdg_2007_pr_tipo_aviso.sru
forward
global type u_bdg_2007_pr_tipo_aviso from u_gen_0000_lista
end type
end forward

global type u_bdg_2007_pr_tipo_aviso from u_gen_0000_lista
int Width=2377
int Height=904
string DataObject="d_bdg_2007_pr_tipo_aviso"
end type
global u_bdg_2007_pr_tipo_aviso u_bdg_2007_pr_tipo_aviso

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


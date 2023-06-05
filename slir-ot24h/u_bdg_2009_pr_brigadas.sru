HA$PBExportHeader$u_bdg_2009_pr_brigadas.sru
forward
global type u_bdg_2009_pr_brigadas from u_gen_0000_lista
end type
end forward

global type u_bdg_2009_pr_brigadas from u_gen_0000_lista
int Width=2450
int Height=904
string DataObject="d_bdg_2009_pr_brigadas"
end type
global u_bdg_2009_pr_brigadas u_bdg_2009_pr_brigadas

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


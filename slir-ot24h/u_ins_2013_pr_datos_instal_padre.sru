HA$PBExportHeader$u_ins_2013_pr_datos_instal_padre.sru
forward
global type u_ins_2013_pr_datos_instal_padre from datawindow
end type
end forward

global type u_ins_2013_pr_datos_instal_padre from datawindow
int Width=2314
string DataObject="d_ins_2013_datos_instal_padre"
end type
global u_ins_2013_pr_datos_instal_padre u_ins_2013_pr_datos_instal_padre

forward prototypes
public function integer fnu_insertar_fila ()
end prototypes

public function integer fnu_insertar_fila ();return this.insertrow(0)

end function


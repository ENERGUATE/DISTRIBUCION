HA$PBExportHeader$u_ins_2012_pr_lista_instal_hijas.sru
forward
global type u_ins_2012_pr_lista_instal_hijas from u_gen_0000_lista
end type
end forward

global type u_ins_2012_pr_lista_instal_hijas from u_gen_0000_lista
int Width=2030
string DataObject="d_ins_2012_lista_instal_hijas"
end type
global u_ins_2012_pr_lista_instal_hijas u_ins_2012_pr_lista_instal_hijas

forward prototypes
public function integer fnu_insertar_fila ()
end prototypes

public function integer fnu_insertar_fila ();RETURN THIS.INSERTROW(0)

end function


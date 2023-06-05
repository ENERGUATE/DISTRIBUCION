HA$PBExportHeader$u_ins_2011_pr_lista_instal_por_tipo.sru
forward
global type u_ins_2011_pr_lista_instal_por_tipo from u_gen_0000_lista
end type
end forward

global type u_ins_2011_pr_lista_instal_por_tipo from u_gen_0000_lista
int Width=1921
string DataObject="d_ins_2011_lista_instal_por_tipo"
end type
global u_ins_2011_pr_lista_instal_por_tipo u_ins_2011_pr_lista_instal_por_tipo

forward prototypes
public function integer fnu_insertar_fila ()
end prototypes

public function integer fnu_insertar_fila ();return this.insertrow(0)

end function


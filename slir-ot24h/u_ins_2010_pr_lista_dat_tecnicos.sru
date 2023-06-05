HA$PBExportHeader$u_ins_2010_pr_lista_dat_tecnicos.sru
forward
global type u_ins_2010_pr_lista_dat_tecnicos from u_gen_0000_lista
end type
end forward

global type u_ins_2010_pr_lista_dat_tecnicos from u_gen_0000_lista
int Width=1792
int Height=1092
string DataObject="d_ins_2010_pr_lista_dat_tecnicos"
end type
global u_ins_2010_pr_lista_dat_tecnicos u_ins_2010_pr_lista_dat_tecnicos

type variables
Long il_nro_instalacion
end variables

forward prototypes
public function integer fnu_insertar_fila ()
end prototypes

public function integer fnu_insertar_fila ();return this.insertrow(1)

end function


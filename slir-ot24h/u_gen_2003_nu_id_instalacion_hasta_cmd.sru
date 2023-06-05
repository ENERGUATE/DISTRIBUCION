HA$PBExportHeader$u_gen_2003_nu_id_instalacion_hasta_cmd.sru
forward
global type u_gen_2003_nu_id_instalacion_hasta_cmd from datawindow
end type
end forward

global type u_gen_2003_nu_id_instalacion_hasta_cmd from datawindow
int Width=1825
string DataObject="d_gen_2004_ident_ins_padres"
end type
global u_gen_2003_nu_id_instalacion_hasta_cmd u_gen_2003_nu_id_instalacion_hasta_cmd

forward prototypes
public function integer fnu_insertar_fila ()
end prototypes

public function integer fnu_insertar_fila ();return this.insertrow(0)

end function


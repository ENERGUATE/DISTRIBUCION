HA$PBExportHeader$u_ins_2011_rn_lista_instal_por_tipo.sru
forward
global type u_ins_2011_rn_lista_instal_por_tipo from nonvisualobject
end type
end forward

global type u_ins_2011_rn_lista_instal_por_tipo from nonvisualobject
end type
global u_ins_2011_rn_lista_instal_por_tipo u_ins_2011_rn_lista_instal_por_tipo

forward prototypes
public function integer frn_o_nivel_y_tipo (ref integer pi_tipo, ref integer pi_nivel)
public function integer frn_o_tipo_ant (ref integer pi_tipo)
end prototypes

public function integer frn_o_nivel_y_tipo (ref integer pi_tipo, ref integer pi_nivel);pi_tipo ++
pi_nivel ++

RETURN 1
end function

public function integer frn_o_tipo_ant (ref integer pi_tipo);pi_tipo --

RETURN 1
end function


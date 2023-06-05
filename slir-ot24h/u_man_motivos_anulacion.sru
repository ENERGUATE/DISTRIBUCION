HA$PBExportHeader$u_man_motivos_anulacion.sru
forward
global type u_man_motivos_anulacion from u_man_0000_generico
end type
end forward

global type u_man_motivos_anulacion from u_man_0000_generico
string DataObject="d_man_motivos_anulacion"
end type
global u_man_motivos_anulacion u_man_motivos_anulacion

forward prototypes
public function string f_datawindow ()
public function string f_msg_oracle (long pl_nro_error)
public function integer f_posicion ()
public function integer f_tamanio_win ()
public function integer f_tamanio2 ()
public function string f_titulo ()
end prototypes

public function string f_datawindow ();return("d_man_motivos_anulacion")
end function

public function string f_msg_oracle (long pl_nro_error);string msg_error
MSG_ERROR="ERROR EN LOS DATOS"
CHOOSE CASE pl_nro_error
CASE 1
     msg_error="  Duplicated record "
CASE 2
     msg_error="Error , record cannot be inserted in the table "
CASE 3
     msg_error="Error , record cannot be inserted in the table "
CASE 14
     msg_error= "You tried to save a not null field "
END CHOOSE

return msg_error
end function

public function integer f_posicion ();w_generica_mant.Move(322,200)

return 1
end function

public function integer f_tamanio_win ();w_generica_mant.Resize(2210,1225)

return 11
end function

public function integer f_tamanio2 ();this.resize(1950,860)

return 1
end function

public function string f_titulo ();return("OPEN SGI - Mantenimiento de Motivos de Anulaci$$HEX1$$f300$$ENDHEX$$n de Incidencias")
end function


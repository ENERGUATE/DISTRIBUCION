HA$PBExportHeader$u_man_2048_pr_turno.sru
forward
global type u_man_2048_pr_turno from u_man_0000_generico
end type
end forward

global type u_man_2048_pr_turno from u_man_0000_generico
int Width=2049
string DataObject="d_man_2048_turno"
boolean VScrollBar=true
end type
global u_man_2048_pr_turno u_man_2048_pr_turno

forward prototypes
public function string f_datawindow ()
public function integer f_tamanio_win ()
public function integer f_posicion ()
public function integer f_tamanio2 ()
public function string f_titulo ()
public function string f_msg_oracle (long pl_nro_error)
end prototypes

public function string f_datawindow ();return("d_man_2048_turno")
end function

public function integer f_tamanio_win ();w_generica_mant.Resize(2010,1125)

return 1
end function

public function integer f_posicion ();w_generica_mant.Move(422,321)

return 1
end function

public function integer f_tamanio2 ();this.resize(1980,1025)

return 1
end function

public function string f_titulo ();return("OPEN SGI - Mantenimiento de Turnos")
end function

public function string f_msg_oracle (long pl_nro_error);string msg_error
MSG_ERROR="ERROR DESCONOCIDO"
CHOOSE CASE pl_nro_error
CASE 1
     msg_error=" Duplicated record "
CASE 2
     msg_error="Error , record cannot be inserted in the table "
CASE 3
     msg_error="Error , record cannot be inserted in the table "
CASE 14
     msg_error= "You tried to save a not null field "
END CHOOSE

return msg_error
end function

event itemchanged;call super::itemchanged;//agrega los campos que estan ocultos en la datawindow
 
this.SetItem(this.getrow(),"usuario",gs_usuario)
this.SetItem(this.getrow(),"f_actual",fgcd_fecha_del_dia())
//this.SetItem(this.getrow(),"h_actual",fgcd_fecha_del_dia())
this.SetItem(this.getrow(),"programa",gs_programa)

end event

event dberror;call super::dberror;long ll_error
string msg_error

msg_error = sqlerrtext
ll_error = sqldbcode
  IF ll_error <> 0 THEN
	  msg_error=f_msg_oracle(ll_error)
	  gnv_msg.f_mensaje("EG21",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",ok!)
     //messagebox("ERROR SQL", "Error "+ string(ll_error) + msg_error ,StopSign!)
     RETURN 1
  END IF

end event


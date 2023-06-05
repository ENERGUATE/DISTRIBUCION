HA$PBExportHeader$u_man_2040_pr_accion.sru
forward
global type u_man_2040_pr_accion from u_man_0000_generico
end type
end forward

global type u_man_2040_pr_accion from u_man_0000_generico
int Width=2350
int Height=977
string DataObject="d_man_2040_accion"
boolean VScrollBar=true
end type
global u_man_2040_pr_accion u_man_2040_pr_accion

forward prototypes
public function string f_datawindow ()
public function integer f_posicion ()
public function integer f_tamanio_win ()
public function integer f_tamanio2 ()
public function string f_titulo ()
public function string f_msg_oracle (long pl_nro_error)
end prototypes

public function string f_datawindow ();return("d_man_2040_accion")
end function

public function integer f_posicion ();w_generica_mant.Move(322,200)

return 1
end function

public function integer f_tamanio_win ();w_generica_mant.Resize(2210,1225)

return 1
end function

public function integer f_tamanio2 ();this.resize(1950,860)

return 1
end function

public function string f_titulo ();return("OPEN SGI -  Mantenimiento de Acciones")
end function

public function string f_msg_oracle (long pl_nro_error);string msg_error
MSG_ERROR="ERROR EN LOS DATOS"
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

event dberror;call super::dberror;long ll_error,i_sql_ok
string msg_error

msg_error = sqlerrtext
ll_error =sqldbcode
  IF ll_error <> 0 THEN

                CHOOSE CASE ll_error

                        CASE 100
                                gnv_msg.f_mensaje("EG13","","",OK!)
                        CASE 1407,1400
                                gnv_msg.f_mensaje("EG05","la tabla SGD_VALOR ","",OK!)
              CASE  1,-1
                                gnv_msg.f_mensaje("EG06","la tabla SGD_VALOR ","",OK!)
                        CASE 2291
                                gnv_msg.f_mensaje("EG07","la tabla SGD_VALOR ","",OK!)
                CASE 2292       
                        gnv_msg.f_mensaje("EG08","la tabla SGD_VALOR ","",OK!)
         CASE ELSE 
                                gnv_msg.f_mensaje("EG21",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",ok!)
                                //MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
          END CHOOSE
                  gnu_u_transaction.uf_rollback();

                 RETURN 1
  END IF
end event

on constructor;call u_man_0000_generico::constructor;This.SetSort("cod_accion A")
This.Sort()
end on

event itemchanged;call super::itemchanged;//agrega los campos que estan ocultos en la datawindow
 
this.SetItem(this.getrow(),"usuario",gs_usuario)
this.SetItem(this.getrow(),"f_actual",fgcd_fecha_del_dia())
//this.SetItem(this.getrow(),"h_actual",fgcd_fecha_del_dia())
this.SetItem(this.getrow(),"programa",gs_programa)
this.SetItem(this.getrow(),"CODIF",'ACC')

end event


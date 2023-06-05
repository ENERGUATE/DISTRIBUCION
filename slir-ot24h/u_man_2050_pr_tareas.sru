HA$PBExportHeader$u_man_2050_pr_tareas.sru
forward
global type u_man_2050_pr_tareas from u_man_0000_generico
end type
end forward

global type u_man_2050_pr_tareas from u_man_0000_generico
int Width=2112
int Height=896
string DataObject="d_man_2050_tareas"
boolean VScrollBar=true
end type
global u_man_2050_pr_tareas u_man_2050_pr_tareas

forward prototypes
public function string f_titulo ()
end prototypes

public function string f_titulo ();return "OPEN SGI - Mantenimiento de Tareas."
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

event itemchanged;call super::itemchanged;//agrega los campos que estan ocultos en la datawindow

this.SetItem(this.getrow(),"usuario",gs_usuario)
this.SetItem(this.getrow(),"f_actual",fgcd_fecha_del_dia())
this.SetItem(this.getrow(),"programa",gs_programa)
this.SetItem(this.getrow(),"codif",'TARE')
end event

event constructor;call super::constructor;This.SetSort("nro_tarea A")
This.Sort()
end event


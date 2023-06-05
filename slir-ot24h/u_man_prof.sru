HA$PBExportHeader$u_man_prof.sru
forward
global type u_man_prof from u_man_0000_generico
end type
end forward

type s_sgi_alcance_aviso from structure
    integer co_alcance
    string usuario
    date f_actual
    time h_actual
    string programa
    string descripcion
end type

global type u_man_prof from u_man_0000_generico
int Width=1943
int Height=685
string DataObject="d_man_prof"
boolean VScrollBar=true
end type
global u_man_prof u_man_prof

forward prototypes
public function string f_titulo ()
public function string f_datawindow ()
public function integer f_tamanio2 ()
public function integer f_posicion ()
public function integer f_tamanio_win ()
public function boolean f_anulo ()
public function string f_msg_oracle (long pl_nro_error)
public function integer f_borrar_registro ()
end prototypes

public function string f_titulo ();RETURN ("OPEN SGI - Mantenimiento de Profesiones de Brigadistas")
end function

public function string f_datawindow ();return("d_man_2020_alc_avi")
end function

public function integer f_tamanio2 ();this.resize(1950,860)

return 1
end function

public function integer f_posicion ();w_generica_mant.Move(322,200)

return 1
end function

public function integer f_tamanio_win ();w_generica_mant.Resize(2210,1225)

return 1
end function

public function boolean f_anulo ();return true
end function

public function string f_msg_oracle (long pl_nro_error);string msg_error
MSG_ERROR="ERROR EN LOS DATOS"
CHOOSE CASE pl_nro_error
CASE 1
     msg_error="  Duplicated record"
CASE 2
     msg_error="Error , record cannot be inserted in the table "
CASE 3
     msg_error="Error , record cannot be inserted in the table "
CASE 14
     msg_error="You tried to save a not null field" 
END CHOOSE

return msg_error
end function

public function integer f_borrar_registro ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_borrar_registro
//
// Objetivo:  Elimina fila.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//                      Entrada: --
//                      Salida: --
//  
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////

int mesa, li_codigo
long ll_cantidad

SetPointer(HourGlass!)

li_codigo = This.GetItemNumber(This.GetRow(), "codigo")

select count(*) into :ll_cantidad from gi_brigadista 
where cod_profesion = :li_codigo;


IF ll_cantidad > 0 THEN
        gnv_msg.f_mensaje("EM27", "la profesi$$HEX1$$f300$$ENDHEX$$n", "gi_brigadista", Ok!)
        RETURN (-1)
END IF

//mesa = Messagebox("Attention","Are you sure that you wish to delete the record",Exclamation!,OKCancel!,2)
  mesa = gnv_msg.f_mensaje("CM05","","",YesNo!)
IF mesa = 1  THEN
        this.DeleteRow(0)
        //this.Update()
        this.SetFocus()
        this.SetRow(this.GetRow())
        this.SetColumn(1)
ELSE
  return 1
END IF

return 1
end function

event dberror;call super::dberror;long ll_error,i_sql_ok
string msg_error

msg_error = sqlerrtext
ll_error = sqldbcode
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

//this.settaborder(1,0) 
this.SetItem(this.getrow(),"usuario",gs_usuario)
this.SetItem(this.getrow(),"f_actual",fgcd_fecha_del_dia())
//this.SetItem(this.getrow(),"h_actual",fgcd_fecha_del_dia())
this.SetItem(this.getrow(),"programa",gs_programa)
this.SetItem(this.getrow(),"codif",'PROF')





end event

event constructor;call super::constructor;This.SetSort("co_alcance A")
This.Sort()
end event


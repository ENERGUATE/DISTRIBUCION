HA$PBExportHeader$u_man_2023_pr_causa_inc.sru
forward
global type u_man_2023_pr_causa_inc from u_man_0000_generico
end type
end forward

type s_sgi_causa_incidencia from structure
    integer cod_causa
    string usuario
    date f_actual
    time h_actual
    string programa
    string descripcion
    integer ind_familia
end type

global type u_man_2023_pr_causa_inc from u_man_0000_generico
int Width=2003
int Height=685
string DataObject="d_man_2023_causa_inc"
boolean VScrollBar=true
end type
global u_man_2023_pr_causa_inc u_man_2023_pr_causa_inc

forward prototypes
public function string f_titulo ()
public function string f_datawindow ()
public function integer f_tamanio2 ()
public function integer f_posicion ()
public function integer f_tamanio_win ()
public function string f_msg_oracle (long pl_nro_error)
public function long f_verif_ref ()
end prototypes

public function string f_titulo ();RETURN ("OPEN SGI - Mantenimiento de las Causas de Incidencias")
end function

public function string f_datawindow ();return("d_man_2023_causa_inc")
end function

public function integer f_tamanio2 ();this.Resize(1950,860)

return 1
end function

public function integer f_posicion ();w_generica_mant.Move(322,200)

return 1
end function

public function integer f_tamanio_win ();w_generica_mant.Resize(2210,1225)

return 1
end function

public function string f_msg_oracle (long pl_nro_error);string msg_error
MSG_ERROR="ERROR EN LOS DATOS"
CHOOSE CASE pl_nro_error
CASE 1
     msg_error=" duplicated Record "
CASE 2
     msg_error="Error , record cannot be inserted in the table "
CASE 3
     msg_error="Error , record cannot be inserted in the table "
CASE 14
     msg_error= "You tried to save a not null field"
END CHOOSE

return msg_error
end function

public function long f_verif_ref ();string      ls_dato
long            ll_filaenc, ll_causainc, ll_basura
ll_causainc = This.GetItemNumber(This.GetRow(), 'codigo')

  SELECT count(*)  
    INTO :ll_basura
    FROM "SGD"."SGD_INCIDENCIA"  
   WHERE SGD."SGD_INCIDENCIA"."COD_CAUSA" = :ll_causainc   ;

//ls_dato = "ind_familia = " + string(ll_causainc)
//ll_filaenc = This.Find(ls_dato, 1, This.RowCount())
RETURN(ll_basura)
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
                        gnv_msg.f_mensaje("EG05","la tabla sgd_valor  ","",OK!)
                   CASE  1,-1
                           gnv_msg.f_mensaje("EG06","la tabla sgd_valor  ","",OK!)
                        CASE 2291
                           gnv_msg.f_mensaje("EG07","la tabla sgd_valor  ","",OK!)
                CASE 2292       
                        gnv_msg.f_mensaje("EG08","la tabla sgd_valor  ","",OK!)
         CASE ELSE 
                                gnv_msg.f_mensaje("EG21",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",ok!)
                                //MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
          END CHOOSE
                  gnu_u_transaction.uf_rollback();

                 RETURN 1
  END IF
end event

event itemchanged;call super::itemchanged;int i_nulo

SetNull(i_nulo)

CHOOSE CASE This.GetColumnName()
        CASE "ind_familia2"
                IF Integer(This.GetText()) = 0 THEN
                        This.SetItem(This.GetRow(), "ind_familia", 0)
                ELSE
                        This.SetItem(This.GetRow(), "ind_familia", i_nulo)
                END IF
END CHOOSE

//agrega los campos que estan ocultos en la datawindow
this.SetItem(this.getrow(),"usuario",gs_usuario)
this.SetItem(this.getrow(),"f_actual",fgcd_fecha_del_dia())
//this.SetItem(this.getrow(),"h_actual",fgcd_fecha_del_dia())
this.SetItem(this.getrow(),"programa",gs_programa)
this.SetItem(this.getrow(),"codif",'CAU')

end event

event constructor;call super::constructor;This.SetSort("co_causa A")
This.Sort()
end event


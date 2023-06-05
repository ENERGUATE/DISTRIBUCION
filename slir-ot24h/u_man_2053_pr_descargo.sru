HA$PBExportHeader$u_man_2053_pr_descargo.sru
forward
global type u_man_2053_pr_descargo from u_man_0000_generico
end type
end forward

global type u_man_2053_pr_descargo from u_man_0000_generico
integer width = 2423
integer height = 804
string dataobject = "d_man_2053_descargo"
boolean vscrollbar = true
end type
global u_man_2053_pr_descargo u_man_2053_pr_descargo

forward prototypes
public function string f_datawindow ()
public function integer f_posicion ()
public function integer f_tamanio_win ()
public function integer f_tamanio2 ()
public function string f_titulo ()
end prototypes

public function string f_datawindow ();return("d_man_2053_descargo")
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

public function string f_titulo ();return("OPEN SGI - Mantenimiento de Tipo Descargo")
end function

on u_man_2053_pr_descargo.create
call super::create
end on

on u_man_2053_pr_descargo.destroy
call super::destroy
end on

event dberror;call super::dberror;long ll_error,i_sql_ok
string msg_error

msg_error = sqlerrtext
ll_error = sqldbcode
  IF ll_error <> 0 THEN
//	  msg_error=f_msg_oracle(ll_error)
//     messagebox("ERROR SQL", "Error "+ string(ll_error) + msg_error ,StopSign!)

		CHOOSE CASE ll_error

			CASE 100
				gnv_msg.f_mensaje("EG13","","",OK!)
			CASE 1407,1400
  				gnv_msg.f_mensaje("EG05","","",OK!)
		   CASE  1,-1
	   		gnv_msg.f_mensaje("EG06","","",OK!)
			CASE 2291
	   		gnv_msg.f_mensaje("EG07","","",OK!)
	   	CASE 2292	
   			gnv_msg.f_mensaje("EG08","the table T_prioridad ","",OK!)
         CASE ELSE 
				gnv_msg.f_mensaje("EG21",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",ok!)
		   	//MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
	  END CHOOSE
	    gnu_u_transaction.uf_rollback();
		 RETURN 1
  END IF
end event

event itemchanged;call super::itemchanged;//this.SetItem(this.getrow(),"usuario",gs_usuario)
//this.SetItem(this.getrow(),"f_actual",fgcd_fecha_del_dia())
//this.SetItem(this.getrow(),"programa",gs_programa)

this.SetItem(this.getrow(),"usuario",gs_usuario)
this.SetItem(this.getrow(),"f_actual",fgcd_fecha_del_dia())
//this.SetItem(this.getrow(),"h_actual",fgcd_fecha_del_dia())
this.SetItem(this.getrow(),"programa",gs_programa)
this.SetItem(this.getrow(),"CODIF",'ACC')

end event

event constructor;call super::constructor;This.SetSort("codigo A")
This.Sort()
end event


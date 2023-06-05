HA$PBExportHeader$u_eop_2001_pr_seguimiento_operaciones.sru
forward
global type u_eop_2001_pr_seguimiento_operaciones from datawindow
end type
end forward

global type u_eop_2001_pr_seguimiento_operaciones from datawindow
int Width=1454
int Height=505
string DataObject="d_eop_2001_pr_list_seguimiento_operacion"
BorderStyle BorderStyle=StyleLowered!
end type
global u_eop_2001_pr_seguimiento_operaciones u_eop_2001_pr_seguimiento_operaciones

forward prototypes
public function integer fpr_anulacion_oper (integer pi_salida)
public function integer fpr_marcar_entrada_oper (integer pi_est_actual)
public function integer fpr_marcar_salida_oper (long pl_click_row)
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public function integer f_insertar_fila ()
end prototypes

public function integer fpr_anulacion_oper (integer pi_salida);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_marcar_salida_oper
// 
// Objetivo: apaga el bmp segun el estado pasado como parametro
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: 1 salida
//				2 entrada
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_cant_row,ll_contador
int li_estado

ll_cant_row = this.RowCount()
FOR ll_contador = 1 TO ll_cant_row 

	li_estado=this.GetItemDecimal(ll_contador,"Ind_env_mant")     
	IF li_estado=pi_salida THEN  //si fue enviada 
		this.SetItem(ll_contador,"Ind_env_mant",0)
	END IF
	
	IF li_estado=3 THEN //Si fue enviada y retorno en el mismo estado
		this.SetItem(ll_contador,"Ind_env_mant",1)
	END IF
NEXT
Return 1
end function

public function integer fpr_marcar_entrada_oper (integer pi_est_actual);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_marcar_entrada_oper
// 
// Objetivo: Marca los bmp de entrada a operaciones
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: pi_est_actual
//				
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_estado
long ll_row

ll_row = this.find("est_oper = "+string(pi_est_actual),0,this.RowCount())
IF ll_row>0 THEN
	li_estado=this.GetItemDecimal(ll_row,"ind_env_mant")
	IF li_estado=1 THEN 
		this.SetItem(ll_row,"ind_env_mant",3)
	ELSE
		this.SetItem(ll_row,"ind_env_mant",2)
	END IF
END IF

Return 1
end function

public function integer fpr_marcar_salida_oper (long pl_click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_marcar_salida_oper
// 
// Objetivo: Prende el bmp de salida de operaciones
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pl_click_row
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	
//
////////////////////////////////////////////////////////////////////////////////////////////////

this.SetItem(pl_click_row,"ind_env_mant",1)

Return 1
end function

public function integer fnu_obtener_datos (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_obtener_datos
//
// Objetivo: Conecta a la base de datos y retrieve de la datawindow.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.SetTransObject(SQLCA)
pd_dw.Retrieve()

Return 1
end function

public function integer f_insertar_fila ();return this.insertrow(0)

end function


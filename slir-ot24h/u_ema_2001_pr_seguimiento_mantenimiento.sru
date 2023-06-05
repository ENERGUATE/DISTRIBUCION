HA$PBExportHeader$u_ema_2001_pr_seguimiento_mantenimiento.sru
forward
global type u_ema_2001_pr_seguimiento_mantenimiento from datawindow
end type
end forward

global type u_ema_2001_pr_seguimiento_mantenimiento from datawindow
int Width=101
int Height=397
string DataObject="d_ema_2001_pr_list_seguimiento_mant"
end type
global u_ema_2001_pr_seguimiento_mantenimiento u_ema_2001_pr_seguimiento_mantenimiento

forward prototypes
public function integer fpr_anulacion_entrada_mant (long pl_click_mant)
public function integer fpr_anulacion_mant (integer pi_estado, long pl_click_mant)
public function integer fpr_marcar_salida_mant (long pl_click_mant)
public function integer fnu_obtener_datos (ref datawindow pd_dw)
public function integer f_insertar_fila ()
public function integer fpr_marcar_entrada_mant (datetime pdt_fecha_derivada)
end prototypes

public function integer fpr_anulacion_entrada_mant (long pl_click_mant);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_anulacion_entrada_mant
// 
// Objetivo: Apaga el bmp que indica en que estado entro a mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pl_click_mant
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_cant_row,ll_contador
datetime ld_f_alta

SetNull(ld_f_alta)
this.SetItem(pl_click_mant,"f_alta",ld_f_alta)

ll_cant_row = this.RowCount()
FOR ll_contador = 1 TO ll_cant_row
	this.SetItem(ll_contador,"ind_env_mant",0)		
NEXT

Return 1
end function

public function integer fpr_anulacion_mant (integer pi_estado, long pl_click_mant);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_anulacion_mant
// 
// Objetivo: Anula el proceso de dragueo para mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: estado
//				nro de la line en que se dio el click
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
long ll_cant_row,ll_contador
datetime ld_f_alta

SetNull(ld_f_alta)

ll_cant_row = this.RowCount()
FOR ll_contador = 1 TO ll_cant_row
	li_estado=this.GetItemDecimal(ll_contador,"ind_env_mant")
	IF li_estado=pi_estado THEN
		this.SetItem(ll_contador,"ind_env_mant",0)		
		this.SetItem(pl_click_mant,"f_alta",ld_f_alta)
		this.SetItem(ll_contador,"observacion","")	
	END IF
NEXT
	 this.AcceptText()
Return 1
end function

public function integer fpr_marcar_salida_mant (long pl_click_mant);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_marcar_salida_mant
// 
// Objetivo:Marca los bmp de entrada a operaciones
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pl_click_mant
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

	this.SetItem(pl_click_mant,"ind_env_mant",2)

Return 1
end function

public function integer fnu_obtener_datos (ref datawindow pd_dw);
pd_dw.SetTransObject(SQLCA)
pd_dw.Retrieve()

Return 1
end function

public function integer f_insertar_fila ();return this.insertrow(0)
end function

public function integer fpr_marcar_entrada_mant (datetime pdt_fecha_derivada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_marcar_entrada_mant
// 
// Objetivo: Prende el bmp que indica en que estado entro a mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: data window
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_row

this.SetRow(1)
this.SetItem(1,"usuario",gs_usuario)
this.SetItem(1,"Ind_env_mant",1)
this.SetItem(1,"f_alta",pdt_fecha_derivada)
this.SetItem(1,"h_alta",pdt_fecha_derivada)
this.SetItem(1,"observacion"," ")

this.SetFocus()
this.Accepttext()

Return 1
end function


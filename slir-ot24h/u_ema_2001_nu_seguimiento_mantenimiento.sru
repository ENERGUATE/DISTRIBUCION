HA$PBExportHeader$u_ema_2001_nu_seguimiento_mantenimiento.sru
forward
global type u_ema_2001_nu_seguimiento_mantenimiento from nonvisualobject
end type
end forward

global type u_ema_2001_nu_seguimiento_mantenimiento from nonvisualobject
end type
global u_ema_2001_nu_seguimiento_mantenimiento u_ema_2001_nu_seguimiento_mantenimiento

forward prototypes
public function integer fnu_guardar_datos (ref datawindow pd_dw)
public function integer fnu_cargar_seguimiento_mant (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_nro_incidencia)
public function boolean fnu_env_operaciones (ref datawindow pd_dw)
public function integer fnu_obtener_estado_mant (ref datawindow pd_dw1, ref datawindow pd_dw2, long pl_incidencia)
public function boolean fnu_fecha_solo_en_st (ref datawindow pd_dw)
end prototypes

public function integer fnu_guardar_datos (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_guardar_datos
// 
// Objetivo: Actualiza la datawindow
//	Ambito:	 P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: Data window
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


	pd_dw.Update()

Return 1
end function

public function integer fnu_cargar_seguimiento_mant (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_nro_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_seguimiento_mant
// 
// Objetivo: Carga en la estructura los datos sebre el seguimiento en mantenimiento estructura seguimiento_mant
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: data window de seguimiento de mantenimiento
//						data window 2 de estados de mantenimiento
//
//			Salida: retorna el el estado en que quedo mantenimiento
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_contador
datetime ld_f_actual,ld_h_actual,ld_f_alta,ld_h_alta
int li_cod_estado,li_estado_actual,li_ind_env_mant
string ls_usuario,ls_programa,ls_observacion

pd_dw.AcceptText()
			//borra los datos a ingresar
  DELETE FROM "ESTADO_MANT"  
   WHERE ( "ESTADO_MANT"."NRO_INCIDENCIA" = :pl_nro_incidencia );
		IF sqlca.sqlcode<0 THEN
			gnv_msg.f_mensaje ("EI11","","",OK!)
			//rollback;
			gnu_u_transaction.uf_rollback()
			HALT
		END IF
FOR ll_contador=1 TO pd_dw2.RowCount()

	ld_f_alta=pd_dw.GetItemDateTime(ll_contador,"f_alta")
	IF NOT ISNULL(ld_f_alta) THEN
			

					//valida h_alta no nula
		ld_h_alta=pd_dw.GetItemDateTime(ll_contador,"h_alta")
		IF ISNULL(ld_h_alta) THEN
			pd_dw.SetItem(ll_contador,"h_alta",fgnu_fecha_actual())
			ld_h_alta=pd_dw.GetItemDateTime(ll_contador,"h_alta")
		END IF 
						//valida codigo de estado
		li_cod_estado=pd_dw2.GetItemdecimal(ll_contador,"cod_estado")
		pd_dw.SetItem(ll_contador,"est_mant",li_cod_estado)
		
				//valida usuario no nulo
		ls_usuario=pd_dw.GetItemString(ll_contador,"usuario")
		IF ISNULL(ls_usuario) OR ls_usuario="" THEN
			pd_dw.SetItem(ll_contador,"usuario",gs_usuario)
			ls_usuario=pd_dw.GetItemString(ll_contador,"usuario")
		END IF 
					//valida fecha actual no nula
		ld_f_actual=pd_dw.GetItemDateTime(ll_contador,"f_actual")
		ld_h_actual=pd_dw.GetItemDateTime(ll_contador,"h_actual")
		IF ISNULL(ld_f_actual) THEN
			pd_dw.SetItem(ll_contador,"f_actual",fgcd_fecha_del_dia())
			pd_dw.SetItem(ll_contador,"h_actual",fgcd_fecha_del_dia())
			ld_f_actual=pd_dw.GetItemDateTime(ll_contador,"f_actual")
			ld_h_actual=pd_dw.GetItemDateTime(ll_contador,"h_actual")
		END IF 
					//valida progama no nulo
		ls_programa=pd_dw.GetItemString(ll_contador,"programa")
		IF ISNULL(ls_programa) OR ls_programa="" THEN
			pd_dw.SetItem(ll_contador,"programa","w_2301")
			ls_programa=pd_dw.GetItemString(ll_contador,"programa")
		END IF 		
				//valida observacion no nulo
		ls_observacion=pd_dw.GetItemString(ll_contador,"observacion")
		IF ISNULL(ls_observacion) OR ls_observacion="" THEN
			pd_dw.SetItem(ll_contador,"observacion"," ")
			ls_observacion=pd_dw.GetItemString(ll_contador,"observacion")
		END IF		

				//valida ind_env_mant no nulo
		li_ind_env_mant=pd_dw.GetItemNumber(ll_contador,"ind_env_mant")
		IF ISNULL(li_ind_env_mant) THEN
			pd_dw.SetItem(ll_contador,"ind_env_mant",0)
			li_ind_env_mant=pd_dw.GetItemNumber(ll_contador,"ind_env_mant")
		END IF		
			//cargo el estado para pasarlo como parametro a la ventana de
			// incidencias para que actualice el ultimo estado de mantenimiento
		li_estado_actual=li_cod_estado
				
		
			//Cargo en la tabla de
			
  			INSERT INTO "ESTADO_MANT" 
         	( "COD_ESTADO", "USUARIO", "F_ACTUAL", "H_ACTUAL", "PROGRAMA",   
           		"NRO_INCIDENCIA", "F_ALTA", "H_ALTA", "OBSERVACION", "IND_ENV_MANT" )  
		  	VALUES ( :li_cod_estado, :ls_usuario, :ld_f_actual, :ld_h_actual,  :ls_programa,   
         		  :pl_nro_incidencia, :ld_f_alta, :ld_h_alta, :ls_observacion , :li_ind_env_mant ); 
			
			IF sqlca.sqlcode<0 THEN
				gnv_msg.f_mensaje("EI11","","",OK!)
				//rollback;
				gnu_u_transaction.uf_rollback()
				HALT
			END IF
		END IF
NEXT
	
Return li_estado_actual


	
end function

public function boolean fnu_env_operaciones (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_env_operaciones
// 
// Objetivo: Retorna, si retorno de mantenimiento a operaciones 
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: Data window
//					marcar o desmarcar
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


long ll_row

ll_row=pd_dw.Find("ind_env_mant= 2",0,pd_dw.RowCount()) 
IF ll_row=0 THEN
	return  False  //NO se retorno a operaciones
ELSE
	return True	//se retorno a operaciones
END IF
end function

public function integer fnu_obtener_estado_mant (ref datawindow pd_dw1, ref datawindow pd_dw2, long pl_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_estado_mant
// 
// Objetivo: Realiza el retrieve de los datos de la datawindow
//				 para mostrar el estado de la incidencia en mantenimiento
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_contador,ll_tope
int li_resuelve_mant
string ls_estado


pd_dw1.SetTransObject(SQLCA)
pd_dw1.Retrieve(pl_incidencia)

// Carga en la datwindow tantos registros como estados falten entre el 
// estado actual de la incidencia y los estados definidos para 
//mantenimiento

FOR ll_contador=1 TO pd_dw1.RowCount()
	ls_estado=pd_dw2.GetItemstring(ll_contador,"nomenclatura")
	pd_dw1.SetItem(ll_contador,"nomenclatura",ls_estado)
NEXT

		// muestra los datos de estados de la incidencia
FOR ll_contador=pd_dw1.RowCount()+1 TO pd_dw2.RowCount()
	pd_dw1.InsertRow(0)
	pd_dw1.SetItem(ll_contador,"nomenclatura",pd_dw2.GetItemString(ll_contador,"Nomenclatura"))
NEXT

Return 1
end function

public function boolean fnu_fecha_solo_en_st (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_fecha_solo_en_st
//
// Objetivo: Obtengo fecha de alta si la encuentro
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

boolean lb_no_encontre
long ll_contador

lb_no_encontre=true
FOR ll_contador=2 TO pd_dw.RowCount()
	IF NOT ISNULL(pd_dw.GetItemDateTime(ll_contador,"f_alta")) THEN
		lb_no_encontre=False
	END IF
NEXT

Return lb_no_encontre
end function

on u_ema_2001_nu_seguimiento_mantenimiento.create
TriggerEvent( this, "constructor" )
end on

on u_ema_2001_nu_seguimiento_mantenimiento.destroy
TriggerEvent( this, "destructor" )
end on


HA$PBExportHeader$u_eop_2001_nu_seguimiento_operaciones.sru
forward
global type u_eop_2001_nu_seguimiento_operaciones from nonvisualobject
end type
end forward

global type u_eop_2001_nu_seguimiento_operaciones from nonvisualobject
end type
global u_eop_2001_nu_seguimiento_operaciones u_eop_2001_nu_seguimiento_operaciones

type variables
integer istiti
end variables

forward prototypes
public function integer fnu_guardar_datos (ref datawindow pd_dw)
public function integer fnu_cargar_seguimiento_oper (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_nro_incidencia)
public function integer fnu_cargar_oper_mant (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_nro_incidencia)
public function datetime fnu_f_derivacion (datawindow pd_dw, long pl_click_oper)
public function boolean fnu_devolver_env_mant (ref datawindow pd_dw)
public function integer fnu_obtener_estado_oper (ref datawindow pd_estado, ref datawindow pd_estado_inc, long pl_incidencia, integer pi_estado_oper, datetime pd_fecha_deteccion)
public function integer fnu_cargar_fechas_resolucion (ref datawindow pd_dw, integer pi_estado_oper)
end prototypes

public function integer fnu_guardar_datos (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_guardar_datos
//
// Objetivo: Realiza datawindow update
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

	pd_dw.Update()

Return 1
end function

public function integer fnu_cargar_seguimiento_oper (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_nro_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_seguimiento_oper
// 
// Objetivo: Carga en la estructura los datos sebre el seguimiento en mantenimiento estructura seguimiento_oper
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: data window de seguimiento de operacones
//				data window 2 de estados de operaciones
//			Salida:   --
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
int li_cod_estado,li_ind_env_mant
string ls_usuario,ls_programa,ls_observacion

pd_dw.AcceptText()

			//borra los datos a ingresar
  DELETE FROM "ESTADO_OPER"  
   WHERE ( "ESTADO_OPER"."NRO_INCIDENCIA" = :pl_nro_incidencia );
		IF sqlca.sqlcode<0 THEN
			gnv_msg.f_mensaje("EI11","","",OK!)
			//rollback;
			gnu_u_transaction.uf_rollback()
			HALT
		END IF
	

				//Verifica los datos cargados en la datawindows
FOR ll_contador=1 TO pd_dw2.RowCount()

	ld_f_alta=pd_dw.GetItemDateTime(ll_contador,"f_alta")
	IF NOT (ISNULL(ld_f_alta)) THEN
			
						//valida h_alta no nula
		ld_h_alta=ld_f_alta

						//valida codigo de estado
		li_cod_estado=pd_dw2.GetItemdecimal(ll_contador,"cod_estado")
		pd_dw.SetItem(ll_contador,"est_oper",li_cod_estado)				
				
						//valida usuario no nulo
		ls_usuario=pd_dw.GetItemString(ll_contador,"usuario")
		IF ISNULL(ls_usuario) OR (ls_usuario="") THEN
			pd_dw.SetItem(ll_contador,"usuario",gs_usuario)
			ls_usuario=pd_dw.GetItemString(ll_contador,"usuario")
		END IF 
						//valida fecha actual no nula
		ld_f_actual=pd_dw.GetItemDateTime(ll_contador,"f_actual")
		ld_h_actual=pd_dw.GetItemDateTime(ll_contador,"h_actual")
		IF ISNULL(ld_f_actual) THEN
			pd_dw.SetItem(ll_contador,"f_actual",fgnu_fecha_actual())
			pd_dw.SetItem(ll_contador,"h_actual",fgnu_fecha_actual())
			ld_f_actual=pd_dw.GetItemDateTime(ll_contador,"f_actual")
			ld_h_actual=pd_dw.GetItemDateTime(ll_contador,"h_actual")
		END IF 
					//valida progama actual no nulo
		ls_programa=pd_dw.GetItemString(ll_contador,"programa")
		IF ISNULL(ls_programa) OR ls_programa="" THEN
			pd_dw.SetItem(ll_contador,"programa","w_2301")
			ls_programa=pd_dw.GetItemString(ll_contador,"programa")
		END IF 		
				//valida observacion nula
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
			
			//Cargo en la tabla de
			
  			INSERT INTO "ESTADO_OPER" 
         	( "COD_ESTADO","USUARIO", "F_ACTUAL", "H_ACTUAL", "PROGRAMA",   
           		"NRO_INCIDENCIA", "F_ALTA", "H_ALTA", "OBSERVACION","IND_ENV_MANT" )  
		  	VALUES ( :li_cod_estado, :ls_usuario, :ld_f_actual, :ld_h_actual,  :ls_programa,   
         		  :pl_nro_incidencia, :ld_f_alta, :ld_h_alta, :ls_observacion, :li_ind_env_mant); 

			IF sqlca.sqlcode<0 THEN
				gnv_msg.f_mensaje("EI11","","",OK!)
				//rollback;
				gnu_u_transaction.uf_rollback()
				HALT
			END IF
		END IF
NEXT			

		

	
Return li_cod_estado


	
end function

public function integer fnu_cargar_oper_mant (ref datawindow pd_dw, ref datawindow pd_dw2, long pl_nro_incidencia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_oper_mant
// 
// Objetivo: Carga en la tabla los datos sebre el seguimiento de la incidencia
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: data window de seguimiento de operaciones
//					data window 2 de seguimiento de mantenimiento
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	30/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_contador,ll_row_oper,ll_row_mant
datetime ld_f_actual,ld_h_actual
int li_cod_oper,li_cod_mant,li_ind_enviado_mant
string ls_usuario,ls_programa

pd_dw.AcceptText()
			//borra los datos a ingresar
  DELETE  oper_mant
   WHERE ( "NRO_INCIDENCIA" = :pl_nro_incidencia );
		
	IF sqlca.sqlcode<0 THEN
		gnv_msg.f_mensaje("EI11","","",OK!)
		//rollback;
		gnu_u_transaction.uf_rollback()
		HALT
	END IF
		
	ll_row_oper=pd_dw.Find("ind_env_mant="+string(fgci_salida)+" OR ind_env_mant="+string(fgci_entrada_salida),0,pd_dw.RowCount())
	ll_row_mant=pd_dw2.Find("ind_env_mant="+string(fgci_salida),0,pd_dw.RowCount())

	IF ll_row_oper<>0 AND ll_row_mant<>0 THEN		
				//Obtien los datos de la datawindow
		
		li_cod_oper=pd_dw.GetItemdecimal(ll_row_oper,"est_oper")
		li_cod_mant=pd_dw2.GetItemdecimal(ll_row_mant,"est_mant")
		ls_usuario=pd_dw.GetItemString(ll_row_oper,"usuario")
		ld_f_actual=pd_dw.GetItemDateTime(ll_row_oper,"f_actual")
		ld_h_actual=pd_dw.GetItemDateTime(ll_row_oper,"h_actual")
		ls_programa=pd_dw.GetItemString(ll_row_oper,"programa")
		li_ind_enviado_mant=pd_dw.GetItemdecimal(ll_row_oper,"ind_env_mant")

			//carga la tabla oper_mant
		
  			INSERT INTO "OPER_MANT" 
         	( "EST_OPER",
				  "EST_MANT",
				  "USUARIO",
				  "F_ACTUAL",
				  "H_ACTUAL",
				  "PROGRAMA",
				  "NRO_INCIDENCIA",
				  "IND_ENVIADO_MANT"  )  
		  	VALUES ( :li_cod_oper,
					   :li_cod_mant, 
						:ls_usuario, 
						:ld_f_actual,
						:ld_h_actual,  
						:ls_programa, 
						:pl_nro_incidencia,
						:li_ind_enviado_mant); 
			
			IF sqlca.sqlcode<0 THEN
				gnv_msg.f_mensaje("EI11","","",OK!)
         	//rollback;
				gnu_u_transaction.uf_rollback()
				HALT
			END IF


		ll_row_oper=pd_dw.Find("ind_env_mant= "+string(fgci_entrada)+" OR ind_env_mant="+string(fgci_entrada_salida),0,pd_dw.RowCount())
		ll_row_mant=pd_dw2.Find("ind_env_mant="+string(fgci_entrada),0,pd_dw.RowCount())
		IF ll_row_oper<>0 AND ll_row_mant<>0 THEN

	
		li_cod_oper=pd_dw.GetItemdecimal(ll_row_oper,"est_oper")
		li_cod_mant=pd_dw2.GetItemdecimal(ll_row_mant,"est_mant")
		ls_usuario=pd_dw.GetItemString(ll_row_oper,"usuario")
		ld_f_actual=pd_dw.GetItemDateTime(ll_row_oper,"f_actual")
		ld_h_actual=pd_dw.GetItemDateTime(ll_row_oper,"h_actual")
		ls_programa=pd_dw.GetItemString(ll_row_oper,"programa")
		li_ind_enviado_mant=pd_dw.GetItemdecimal(ll_row_oper,"ind_env_mant")
			
  			INSERT INTO "OPER_MANT" 
         	( "EST_OPER", 
				  "EST_MANT", 
				  "USUARIO", 
				  "F_ACTUAL",
				  "H_ACTUAL", 
				  "PROGRAMA", 
     			  "NRO_INCIDENCIA", 
				  "IND_ENVIADO_MANT"  )  
		  	VALUES ( :li_cod_oper, 
						:li_cod_mant ,
						:ls_usuario, 
						:ld_f_actual,
						:ld_h_actual,  
						:ls_programa, 
						:pl_nro_incidencia,
						:li_ind_enviado_mant); 
			
			IF sqlca.sqlcode<0 THEN
				gnv_msg.f_mensaje("EI11","","",OK!)
				//rollback;
				gnu_u_transaction.uf_rollback()
				HALT
			END IF
		END IF
	END IF	
Return 1


	
end function

public function datetime fnu_f_derivacion (datawindow pd_dw, long pl_click_oper);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_f_derivaci$$HEX1$$f300$$ENDHEX$$n
//
// Objetivo: Obtiene fecha de alta
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pl_click_oper
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

Return pd_dw.GetItemDateTime(pl_click_oper,"f_alta")
end function

public function boolean fnu_devolver_env_mant (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:fnu_devolver_env_mant
//
// Objetivo: Obtiene enviado de mantenimiento
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

long ll_row
ll_row=pd_dw.Find("ind_env_mant=1",0,pd_dw.RowCount())

IF ll_row <> 0 THEN
	return TRUE
ELSE
	Return FALSE
END IF
end function

public function integer fnu_obtener_estado_oper (ref datawindow pd_estado, ref datawindow pd_estado_inc, long pl_incidencia, integer pi_estado_oper, datetime pd_fecha_deteccion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_estado_oper
// 
// Objetivo: Realiza el retrieve de los datos de la datawindow
//				 para el estado de las incidencia en operaciones
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: pd_dw1 referencia a estados de operaciones
//						pd_dw2 estados de la incidencia en operaciones
//			Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_contador,ll_row,ll_tope
string ls_estado

pd_estado_inc.SetTransObject(SQLCA)
ll_row=pd_estado_inc.Retrieve(pl_incidencia)

IF ll_row=0 THEN
	pd_estado_inc.InsertRow(0)
	pd_estado_inc.SetItem(1,"usuario",gs_usuario)
	pd_estado_inc.SetItem(1,"f_actual",fgnu_fecha_actual())
	pd_estado_inc.SetItem(1,"h_actual",fgnu_fecha_actual())
	pd_estado_inc.SetItem(1,"f_alta",pd_fecha_deteccion)
	pd_estado_inc.SetItem(1,"h_alta",pd_fecha_deteccion)
	pd_estado_inc.SetItem(1,"programa","iw_2301")
	pd_estado_inc.SetItem(1,"est_oper",fgci_incidencia_pendiente)
	pd_estado_inc.SetItem(1,"ind_env_mant",0) 		//no enviado
	pd_estado_inc.SetItem(1,"nomenclatura",fgcs_nomenclatura_pt)
	pd_estado_inc.AcceptText()
END IF

// carga en la datwindow tantos registros como estados falten entre el 
// estado actual de la incidencia y los estados definidos para 
//operaciones
IF pd_estado_inc.RowCount()>0 THEN
	FOR ll_contador=1 TO pd_estado_inc.RowCount()
		ls_estado=pd_estado.GetItemString(ll_contador,"nomenclatura")
		pd_estado_inc.SetItem(ll_contador,"nomenclatura",ls_estado)
	NEXT
END IF

FOR ll_contador=pd_estado_inc.RowCount()+1 TO pd_estado.RowCount()
	pd_estado_inc.InsertRow(0)
	ls_estado=pd_estado.GetItemString(ll_contador,"nomenclatura")
	pd_estado_inc.SetItem(ll_contador,"nomenclatura",ls_estado)
NEXT
//

IF NOT gi_resuelve_mant=fgci_resuelve_mantenimiento THEN	
	IF ls_estado=fgcs_nomenclatura_sr THEN
		pd_estado_inc.SetItem(fgci_incidencia_resuelta,"usuario",gs_usuario)
	END IF
END IF

//habilita los estado que fueron modificados desde la ultima grabacion

FOR ll_contador =1 TO pi_estado_oper
	IF ISNULL(pd_estado_inc.GetItemDateTime(ll_contador,"f_alta")) THEN
		pd_estado_inc.SetItem(ll_contador,"usuario",gs_usuario)
	END IF
NEXT
		
Return 1


end function

public function integer fnu_cargar_fechas_resolucion (ref datawindow pd_dw, integer pi_estado_oper);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_fechas_resoluci$$HEX1$$f300$$ENDHEX$$n
//
// Objetivo: Carga la fecha de resoluci$$HEX1$$f300$$ENDHEX$$n para incidencias de mantenimiento resueltas
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_estado_oper
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

long ll_contador

pd_dw.AcceptText()
IF pi_estado_oper=fgci_incidencia_mant_resuelta_mant THEN
	FOR ll_contador=1 TO pd_dw.RowCount()
		IF ISNULL(pd_dw.GetItemDateTime(ll_contador,"f_alta")) THEN
			pd_dw.SetItem(ll_contador,"f_alta",fgcd_fecha_del_dia())
		END IF
	NEXT
END IF

Return 1
end function

on u_eop_2001_nu_seguimiento_operaciones.create
TriggerEvent( this, "constructor" )
end on

on u_eop_2001_nu_seguimiento_operaciones.destroy
TriggerEvent( this, "destructor" )
end on


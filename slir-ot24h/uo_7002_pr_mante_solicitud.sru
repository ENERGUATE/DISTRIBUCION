HA$PBExportHeader$uo_7002_pr_mante_solicitud.sru
forward
global type uo_7002_pr_mante_solicitud from datawindow
end type
end forward

global type uo_7002_pr_mante_solicitud from datawindow
int Width=2857
int Height=1264
int TabOrder=1
string DataObject="d_7002_mante_solicitud"
boolean Border=false
boolean LiveScroll=true
end type
global uo_7002_pr_mante_solicitud uo_7002_pr_mante_solicitud

type variables
datawindowchild ddw_estado_descargo_t
end variables

forward prototypes
public function integer fpr_habilitar_campos (string ps_accion_llamada, boolean pb_perfil_oper)
public subroutine fnu_cargar_dddw ()
public function boolean fnu_validar_datos (string ps_accion_llamada, boolean pb_perfil_oper)
end prototypes

public function integer fpr_habilitar_campos (string ps_accion_llamada, boolean pb_perfil_oper);//si accion de alta
IF ps_accion_llamada ="alta" THEN
	//si es usuario de operaciones y puede solicitar y aprobar 
	IF pb_perfil_oper THEN
		 //si el usuario de operaciones solicita y aprueba
		 //todo habilitado
	ELSE
	//deshabilita la pocion de aprobar	
		THIS.Modify("estado.Protect = 1")
		This.Modify("estado.background.Color="+gs_gris)
		THIS.Modify("f_aprobado.Protect = 1")
		This.Modify("f_aprobado.background.Color="+gs_gris)
		THIS.Modify("f_ini_apro.Protect = 1")
		This.Modify("f_ini_apro.background.Color="+gs_gris)
		THIS.Modify("f_fin_apro.Protect = 1")
		This.Modify("f_fin_apro.background.Color="+gs_gris)
		THIS.Modify("obs_aprobado.Protect = 1")
		This.Modify("obs_aprobado.background.Color="+gs_gris)
	END IF	
ELSE		
	//accion  mantenimiento	
	// si perfil de operaciones
	IF pb_perfil_oper THEN
		// el estado es mayor de solicitud 
		//no puede modificar la solictud
		IF this.GetItemNumber(1,"estado") > fgci_descargo_solicitado THEN
			//se deshabilita solicitud
			THIS.Modify("f_activado.Protect = 1")
			This.Modify("f_activado..background.Color="+gs_gris)
			THIS.Modify("estado.Protect = 1")
			This.Modify("estado.background.Color="+gs_gris)
			
			THIS.Modify("f_solicitado.Protect = 1")
			This.Modify("f_solicitado..background.Color="+gs_gris)
			THIS.Modify("f_ini_solicitado.Protect = 1")
			This.Modify("f_ini_solicitado.background.Color="+gs_gris)	
			THIS.Modify("f_fin_solicitado.Protect = 1")
			This.Modify("f_fin_solicitado.background.Color="+gs_gris)	
			THIS.Modify("obs_solicitado.Protect = 1")
			This.Modify("obs_solicitado.background.Color="+gs_gris)			
		//si usurio aprobador <> al usuario solictante y 
		// el estado es = de solicitud 
		//no puede solamente modificar la solictud
		ELSEIF gs_usuario <> this.GetItemString(1,"id_solicitante") THEN
			//se deshabilita solicitud
			THIS.Modify("f_activado.Protect = 1")
			This.Modify("f_activado..background.Color="+gs_gris)
			THIS.Modify("estado.Protect = 1")
			This.Modify("estado.background.Color="+gs_gris)
			
			THIS.Modify("f_solicitado.Protect = 1")
			This.Modify("f_solicitado..background.Color="+gs_gris)
			THIS.Modify("f_ini_solicitado.Protect = 1")
			This.Modify("f_ini_solicitado.background.Color="+gs_gris)	
			THIS.Modify("f_fin_solicitado.Protect = 1")
			This.Modify("f_fin_solicitado.background.Color="+gs_gris)	
			THIS.Modify("obs_solicitado.Protect = 1")
			This.Modify("obs_solicitado.background.Color="+gs_gris)
		END IF
	// usuario que no es de operaciones
	ELSE	
		// si esta en estado solicitud deja modificar la solictud
		//y deshabilita aprobacion
		IF this.GetItemNumber(1,"estado") = fgci_descargo_solicitado THEN
			THIS.Modify("f_activado.Protect = 1")
			This.Modify("f_activado..background.Color="+gs_gris)
			THIS.Modify("estado.Protect = 1")
			This.Modify("estado.background.Color="+gs_gris)

			
			THIS.Modify("f_aprobado.Protect = 1")
			This.Modify("f_aprobado.background.Color="+gs_gris)
			THIS.Modify("f_ini_apro.Protect = 1")
			This.Modify("f_ini_apro.background.Color="+gs_gris)
			THIS.Modify("f_fin_apro.Protect = 1")
			This.Modify("f_fin_apro.background.Color="+gs_gris)
			THIS.Modify("obs_aprobado.Protect = 1")
			This.Modify("obs_aprobado.background.Color="+gs_gris)				
		//si estado > a solicitud deshabilita todo
		ELSE
			THIS.Modify("estado.Protect = 1")
			This.Modify("estado.background.Color="+gs_gris)
			THIS.Modify("f_activado.Protect = 1")
			This.Modify("f_activado..background.Color="+gs_gris)
			THIS.Modify("f_solicitado.Protect = 1")
			This.Modify("f_solicitado..background.Color="+gs_gris)
			THIS.Modify("f_ini_solicitado.Protect = 1")
			This.Modify("f_ini_solicitado.background.Color="+gs_gris)	
			THIS.Modify("f_fin_solicitado.Protect = 1")
			This.Modify("f_fin_solicitado.background.Color="+gs_gris)	
			THIS.Modify("obs_solicitado.Protect = 1")
			This.Modify("obs_solicitado.background.Color="+gs_gris)
	
			THIS.Modify("f_aprobado.Protect = 1")
			This.Modify("f_aprobado.background.Color="+gs_gris)
			THIS.Modify("f_ini_apro.Protect = 1")
			This.Modify("f_ini_apro.background.Color="+gs_gris)
			THIS.Modify("f_fin_apro.Protect = 1")
			This.Modify("f_fin_apro.background.Color="+gs_gris)			
			THIS.Modify("obs_aprobado.Protect = 1")
			This.Modify("obs_aprobado.background.Color="+gs_gris)
		END IF
	END IF	
END IF		
		

return 1
end function

public subroutine fnu_cargar_dddw ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_cargar_dddw
// 
// Objetivo:  Carga los datos de dropdown datawindow.
//	
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: -- 
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

int ii

This.GetChild("ai_estado_descargo",ddw_estado_descargo_t)
ii=ddw_estados_descargo_t_shared.sharedata(ddw_estado_descargo_t)

end subroutine

public function boolean fnu_validar_datos (string ps_accion_llamada, boolean pb_perfil_oper);datetime ldt_activado,ldt_solicitado,ldt_ini_solicitado,ldt_fin_solicitado 
string ls_obs_solicitud
datetime ldt_aprobado ,ldt_ini_apro ,ldt_fin_apro 
string ls_obs_aprobado
int li_estado 

This.AcceptText()

//messageBox("nro_descargo",string(this.GetItemNumber(1,"nro_descargo" )))

li_estado = this.GetItemNumber(1,"estado")
ldt_activado = this.GetItemDateTime(1,"f_activado")
ldt_solicitado = this.GetItemDateTime(1,"f_solicitado")
ldt_ini_solicitado = this.GetItemDateTime(1,"f_ini_solicitado")
ldt_fin_solicitado = this.GetItemDateTime(1,"f_fin_solicitado")
ls_obs_solicitud = this.GetItemString(1,"obs_solicitud")

ldt_aprobado = this.GetItemDateTime(1,"f_aprobado")
ldt_ini_apro = this.GetItemDateTime(1,"f_ini_apro")
ldt_fin_apro = this.GetItemDateTime(1,"f_fin_apro")
ls_obs_aprobado = this.GetItemString(1,"obs_aprobado")
		
			

//si accion de alta
IF ps_accion_llamada ="alta" THEN
	//si es usuario de operaciones y puede solicitar y aprobar 

	IF IsNull(ldt_ini_solicitado) OR IsNull(ldt_fin_solicitado) OR &	
		IsNull(ldt_solicitado) THEN
	   gnv_msg.f_mensaje("ED01","","",Ok!)
		//MessageBox("Error","Las fechas de Solicitud del Descargo no son validas.")		
		Return False
	END IF
	
	IF ldt_solicitado > ldt_ini_solicitado OR &
		ldt_ini_solicitado >ldt_fin_solicitado THEN
		gnv_msg.f_mensaje("ED02","","",Ok!)
		//MessageBox("Error","Las fechas de Solicitud del Descargo son incorrectas.")
					
		Return False
	END IF
	
	IF ls_obs_solicitud= " " OR IsNull(ls_obs_solicitud) THEN
		gnv_msg.f_mensaje("ED03","","",Ok!)
		//MessageBox("Error","La Observaci$$HEX1$$f300$$ENDHEX$$n de la Solicitud es requerida")
		Return False
	END IF

ELSE
	IF pb_perfil_oper THEN
		//valida tambien las fechas de aprobacion
		IF  IsNull(ldt_aprobado) OR  IsNull(ldt_ini_apro) OR &
		    IsNull(ldt_fin_apro)  THEN
		   gnv_msg.f_mensaje("ED04","","",Ok!)
			//MessageBox("Error","Las fechas de Aprobaci$$HEX1$$f300$$ENDHEX$$n del Descargo no son correctas.")
		END IF

		IF ldt_solicitado > ldt_aprobado OR &
			ldt_ini_apro > ldt_aprobado   OR &
			ldt_ini_apro > ldt_fin_apro THEN
         gnv_msg.f_mensaje("ED05","","",Ok!) 
		   //MessageBox("Error","Error en secuencia de las fechas de Aprobaci$$HEX1$$f300$$ENDHEX$$n del Descargo")
			Return False
		END IF			
		
		IF ls_obs_aprobado= " " OR IsNull(ls_obs_solicitud)  AND &
			pb_perfil_oper THEN
			gnv_msg.f_mensaje("ED03","","",Ok!)
			//MessageBox("Error","La Observaci$$HEX1$$f300$$ENDHEX$$n de la Solicitud es requerida")
			Return False
		END IF
	END IF

END IF

		

return True
end function


HA$PBExportHeader$u_inc_2003_rn_form_inf_general.sru
$PBExportComments$UserObject para la informaci$$HEX1$$f300$$ENDHEX$$n general de la incidencia.
forward
global type u_inc_2003_rn_form_inf_general from nonvisualobject
end type
end forward

global type u_inc_2003_rn_form_inf_general from nonvisualobject autoinstantiate
end type

type variables
long il_nro_aviso
long il_nro_ultima_incidencia
string is_dir_prim_aviso
int li_nulo
long ll_nulo
string ls_nulo
// ,,,,,,,
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
integer ii_tabla  = 1
		     
// Nro. de la Fila seleccionada
integer ii_selected_row
datawindowchild ddw_nom_ins_afectada
datawindowchild ddw_nom_ins_origen
datawindowchild ddw_tip_ins_afectada
datawindowchild ddw_tip_ins_origen
datawindowchild ddw_tension
datawindowchild ddw_estado_actual
datawindowchild ddw_brigada
datawindowchild ddw_ot
datawindowchild ddw_causa
datawindowchild ddw_material_averiado
//
s_incidencia is_incidencia
//s_incid istr_incidencia
w_2301_form_incidencia iw_contenedora
end variables

forward prototypes
public function long frn_ini_campos_por_defecto (ref datawindow pw_dw, u_generico_comunicaciones pu_comunic)
public function integer frn_hab_numero_incidencia ()
public function integer frn_hab_ot ()
public function integer frn_hab_brigada ()
public subroutine frn_ini_tipo_incidencia (ref datawindow pd_dw, string ps_accion_llamada)
public function integer frn_hab_causa (ref datawindow pd_dw)
public function integer frn_hab_tip_tension (ref datawindow pd_dw, string ps_accion_llamada)
public subroutine frn_ini_ot (ref datawindow pdw_incidencia, long pl_ot)
public function boolean frn_validar_numero_incidencia (ref datawindow pd_dw)
public function boolean frn_validar_centro_alta (ref datawindow pd_dw)
public function boolean frn_validar_puesto_alta (ref datawindow pd_dw)
public function boolean frn_validar_cmd_alta (ref datawindow pd_dw)
public function boolean frn_validar_brigada (ref datawindow pd_dw)
public function boolean frn_validar_instalacion_afectada (ref datawindow pd_dw)
public function boolean frn_validar_observaciones (ref datawindow pd_dw)
public function boolean frn_validar_ind_suministro (ref datawindow pd_dw, long pl_cantidad_avisos)
public function boolean frn_validar_cant_avisos (ref datawindow pd_dw, long pl_cantidad_avisos)
public function boolean frn_validar_cant_cli (ref datawindow pd_dw)
public function boolean frn_validar_estado_mant (ref datawindow pd_dw)
public function boolean frn_validar_potencia_contratada (ref datawindow pd_dw)
public function boolean frn_validar_potencia_afectada (ref datawindow pd_dw)
public function boolean frn_validar_causa (ref datawindow pd_dw)
public function boolean frn_validar_estado_actual (ref datawindow pd_dw)
public function boolean frn_validar_material_averiado (ref datawindow pd_dw)
public function boolean frn_menu_hab_instalacion_afectada (ref datawindow pd_dw, string ps_accion_llamada)
public subroutine frn_hab_ind_suministro (ref datawindow pd_dw, string ps_accion_llamada)
public subroutine frn_ini_ind_suministro (ref datawindow pd_dw, string ps_accion_llamada)
public subroutine frn_ini_causa (ref datawindow pd_dw)
public subroutine fnu_ini_centros_alta (ref datawindow pd_dw)
public function boolean frn_validar_des (ref datawindow pd_dw)
public subroutine frn_ini_estado_operaciones (ref datawindow pd_dw, string ps_accion_llamada, integer pi_interrupciones, integer pi_estado_operaciones, datetime pdt_fec_en_reposicion, datetime pdt_fec_serv_rep)
public subroutine frn_ini_brigada (ref datawindow pdw_incidencia, long pl_brigada)
public function boolean frn_validar_ot (datawindow pd_dw)
public subroutine frn_ini_interrupcion (ref datawindow pd_dw, double pl_pot_inst_afec, double pl_pot_cont_afec, long pl_cli_afect, long pl_primer_aviso, datetime pd_f_deteccion, decimal pd_paxtc, decimal pd_pcxtc, decimal pd_paxtc_mant, decimal pd_pcxtc_mant)
end prototypes

public function long frn_ini_campos_por_defecto (ref datawindow pw_dw, u_generico_comunicaciones pu_comunic);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_campos_por_defecto
// 
// Objetivo: Pone en valores predefinidos dependiendo sea alta o de  
//                              que ventana es llamada.
//      
// Ambito:      
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//      Entrada:  d_inf_general (DataWindow)
//                objeto de comunicaciones con la estructura de trabajo de la ventana
//      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	    -------      ----------------------------------------
//  21/1/96         SAB         Versi$$HEX1$$f300$$ENDHEX$$n Original
//  14/9/97         AFS         Modificacion
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_est_ot = 0			// DSA 29/03/2000
string ls_dir_instalacion
long il_ult_inc
long il_nro_brigada
int li_tension
long ll_cod_calle
long ll_tipo
boolean lb_asocio
decimal{0} ld_nro_instalacion
string ls_nombre
string ls_tipo
string ls_nro_incidencia

DateTime ldt_fec_brigada
DateTime ldt_fec_deteccion

datetime ldt_fecha_nula
setnull(ldt_fecha_nula)

u_avi_2001_nu_lista_avisos lu_avi_2001_nu
u_ins_2002_nu_datos_generales lu_ins_1002_nu
u_inc_2003_nu_form_inf_general lu_inc_2003_nu 

u_inc_2004_nu_form_inf_general lu_inc_2004_nu

							//CREACION USER OBJECT DE GENERICO DE INSTALACION
lu_ins_1002_nu = CREATE u_ins_2002_nu_datos_generales        
lu_avi_2001_nu = CREATE u_avi_2001_nu_lista_avisos
							//CREACION USER OBJECT DE INF GENERAL DE NU
lu_inc_2003_nu = CREATE u_inc_2003_nu_form_inf_general
lu_inc_2004_nu = CREATE u_inc_2004_nu_form_inf_general
ls_nro_incidencia=" ("+String(pw_dw.getitemnumber(1,"nro_incidencia"))+" )"

// Inicializo los campos que son independientes de la accion llamada
pw_dw.SetItem(1,"usuario",gs_usuario)
pw_dw.SetItem(1,"f_actual",fgnu_fecha_actual())
pw_dw.SetItem(1,"h_actual",ldt_fecha_nula)
pw_dw.SetItem(1,"programa","w_2301")

lu_inc_2003_nu.iw_contenedora= this.iw_contenedora

//************************ALTA_NIVEL_INSTALACION******************//

IF pu_comunic.is_comunic.accion_llamada="Alta_nivel_instalacion" THEN

	IF (pu_comunic.is_comunic.DecVal1=0) THEN

		gnv_msg.f_mensaje("AI37","","",OK!)
	END IF

	il_ult_inc=pw_dw.getitemnumber(1,"nro_incidencia")
	pw_dw.setitem(1,"incidencia_ind_alum_pub",0)
	pw_dw.SetItem(1,"alcance",fgci_incidencia_con_interrupcion)  //incidencia con interrupci$$HEX1$$f300$$ENDHEX$$n                   
	pw_dw.SetItem(1,"tipo_incidencia",fgci_incidencia_imprevista)   //incidencia  imprevista
	pw_dw.SetItem(1,"nombre_ins",pu_comunic.is_comunic.Decval1)       //instalacion

	ls_dir_instalacion = lu_ins_1002_nu.fnu_obtener_direccion(pu_comunic.is_comunic.decval1)                                

	pw_dw.SetItem(1,"dir_instalacion",ls_dir_instalacion)//dir instalacion
	pw_dw.SetItem(1,"tipo_instalacion",String(pu_comunic.is_comunic.intval7))//tipo de instalacion

	pw_dw.SetItem(1,"co_nivel",pu_comunic.is_comunic.intval6)  // co-nivel

	if ISNULL(pu_comunic.is_comunic.intval2) OR (pu_comunic.is_comunic.intval2=0) THEN
			select tension into :li_tension from sgd_instalacion where nro_instalacion = :pu_comunic.is_comunic.decval1
                       			and sgd_instalacion.bdi_job =0 	; //DBE 11/01/2000
			pw_dw.setitem(1,"tip_tension",li_tension)
	ELSE
		li_tension=pu_comunic.is_comunic.intval2
		pw_dw.SetItem(1,"tip_tension",pu_comunic.is_comunic.intval2)     //tipo de tension
	END IF

	// Busco los datos de la instalacion.

	ld_nro_instalacion=pu_comunic.is_comunic.decval1

	pw_dw.setitem(1,"nombre_instalacion",pu_comunic.is_comunic.strval1)

	pw_dw.SetItem(1,"estado_actual",fgci_incidencia_pendiente)                    //estado_pendiente
		
	pw_dw.SetItem(1,"f_deteccion",pu_comunic.is_comunic.datval1)    // fecha del primer aviso
	
	pw_dw.SetItem(1,"h_deteccion",pu_comunic.is_comunic.datval1)    // hora del primer aviso

// AFS
//	pw_dw.SetItem(1,"f_est_res",fgnu_fecha_actual())               //f_resolucion = sistema
	pw_dw.SetItem(1,"f_est_res",ldt_fecha_nula) 							//obtiene dir primer aviso

//	pw_dw.SetItem(1,"desc",pu_comunic.is_comunic.strval2+ls_nro_incidencia)  //muestra direccion primer aviso                 
	pw_dw.SetItem(1,"centro_alta",gi_nro_centro)
	pw_dw.SetItem(1,"cmd_alta",gi_nro_cmd)
	pw_dw.SetItem(1,"puesto_alta",gi_nro_puesto)
	pw_dw.SetItem(1,"observacion"," ")
	
	IF pu_comunic.is_comunic.longval4<>0 THEN  // si viene una ot

			this.frn_ini_ot(pw_dw,pu_comunic.is_comunic.longval4) 

			SELECT "GI_OT"."ULT_BRIGADA", "GI_OT"."F_ALTA", "EST_OT"  into :il_nro_brigada,:ldt_fec_brigada, :ll_est_ot FROM "GI_OT" WHERE "GI_OT"."NRO_OT" =:pu_comunic.is_comunic.longval4;
			if ll_est_ot > 1 then // DSA 29/03/2000
				this.frn_ini_brigada(pw_dw,il_nro_brigada)
				pw_dw.setitem(1,"estado_actual",fgci_incidencia_enviado_brigada)
				lu_inc_2004_nu.fnu_actualizar_seguimiento(pw_dw.getitemnumber(1,"nro_incidencia"),fgci_incidencia_enviado_brigada,ldt_fec_brigada)
//				pw_dw.Modify("causa.protect=0")
//				w_2301_form_incidencia.tab_1.tabpage_formulario.st_1.visible = true
//				pw_dw.Modify("causa.background.color="+gs_blanco)
			End if
		End if

END IF

//*************************ALTA_NIVEL_SUMINISTRO**********************//

IF pu_comunic.is_comunic.accion_llamada="Alta_nivel_suministro" THEN
	pw_dw.Modify("tipo_incidencia.protect=1 f_deteccion.protect=1 f_deteccion.background.color="+gs_gris)

	pw_dw.SetItem(1,"alcance",fgci_incidencia_de_suministro)                  //inidencia de suministro	
	pw_dw.SetItem(1,"tipo_incidencia",fgci_incidencia_imprevista)            //incidecnica en imprevista
	pw_dw.SetItem(1,"estado_actual",fgci_incidencia_pendiente)  //estado_pendiente
	il_ult_inc = pw_dw.getitemnumber(1,"nro_incidencia")		
	pw_dw.SetItem(1,"f_deteccion",pu_comunic.is_comunic.datval1)    // fecha del aviso
	pw_dw.SetItem(1,"h_deteccion",pu_comunic.is_comunic.datval2)    // hora del aviso
//	pw_dw.SetItem(1,"f_est_res",fgnu_fecha_actual())                //f_resolucion = sistema
	pw_dw.SetItem(1,"f_est_res",ldt_fecha_nula) // AFS
														//obtiene dir primer aviso
	pw_dw.SetItem(1,"primer_aviso",pu_comunic.is_comunic.longval2)  // n$$HEX1$$fa00$$ENDHEX$$mero de aviso que viene como par$$HEX1$$e100$$ENDHEX$$metros
//	pw_dw.SetItem(1,"desc",pu_comunic.is_comunic.strval2+ls_nro_incidencia)      //direccion del aviso                
	pw_dw.setItem(1,"incidencia_dir_aviso",pu_comunic.is_comunic.strval2) // direccion del primer aviso
	pw_dw.setItem(1,"nombre_instalacion",pu_comunic.is_comunic.strval2) // direccion del primer aviso
	pw_dw.SetItem(1,"centro_alta",pu_comunic.is_comunic.intval3)
	pw_dw.SetItem(1,"cmd_alta",pu_comunic.is_comunic.intval4)
	pw_dw.SetItem(1,"puesto_alta",pu_comunic.is_comunic.intval5)

//	lb_asocio = lu_inc_2003_nu.fnu_actualizar_aviso(pu_comunic.is_comunic.longval2,pw_dw.getitemnumber(1,"nro_incidencia"))

	il_ult_inc=pw_dw.getitemnumber(1,"nro_incidencia")

//	lu_inc_2004_nu.fnu_actualizar_seguimiento(il_ult_inc,fgci_incidencia_pendiente,pu_comunic.is_comunic.datval1) 
	// Esta es la parte que carga los datos en la DW_inf_general
	IF pu_comunic.is_comunic.longval4<>0 THEN  // si viene una ot
	
			this.frn_ini_ot(pw_dw,pu_comunic.is_comunic.longval4)

			SELECT "GI_OT"."ULT_BRIGADA", "GI_OT"."F_ALTA", "EST_OT"  into :il_nro_brigada,:ldt_fec_brigada, :ll_est_ot FROM "GI_OT" WHERE "GI_OT"."NRO_OT" =:pu_comunic.is_comunic.longval4;

			if ll_est_ot > 1 then // DSA 29/03/2000
				pw_dw.modify("ot.Protect="+string(this.frn_hab_ot()))
				this.frn_ini_brigada(pw_dw,il_nro_brigada)
				pw_dw.modify("brigada.protect="+string(this.frn_hab_brigada()))         
//				pw_dw.setitem(1,"estado_actual",fgci_incidencia_enviado_brigada)
				lu_inc_2004_nu.fnu_actualizar_seguimiento(pw_dw.getitemnumber(1,"nro_incidencia"),fgci_incidencia_enviado_brigada,ldt_fec_brigada)
//				pw_dw.Modify("causa.protect=0")
//				w_2301_form_incidencia.tab_1.tabpage_formulario.st_1.visible = true
//				pw_dw.Modify("fec_causa.protect=1")
//				pw_dw.Modify("fec_causa.background.color="+gs_gris)
			End if
	End if
//	lu_avi_2001_nu.fnu_asociar_aviso(pu_comunic.is_comunic.longval2,0,pu_comunic.is_comunic.intval6,pu_comunic.is_comunic.intval7,pu_comunic.is_comunic.datval1)    
	IF pu_comunic.is_comunic.intval6 = fgci_incidencia_de_suministro THEN  //INDICATIVO DE SUMINISTRO IMPORTANTE
		lu_avi_2001_nu.fnu_g_sum_imp(pu_comunic.is_comunic.longval3,pw_dw.getitemnumber(1,"nro_incidencia"))
	END IF

	pw_dw.setitem(1,"co_nivel",0)		
		
	///////////////
	// Agregado por AFS para setear el nombre y tipo de instalacion
	pw_dw.setitem(1,"tipo_instalacion",0)
	pw_dw.setitem(1,"nombre_ins",0)
	pw_dw.setitem(1,"tip_tension",0)
	pw_dw.setitem(1,"dir_instalacion",pu_comunic.is_comunic.strval2)
	pw_dw.setitem(1,"incidencia_ind_alum_pub",fgci_alumbrado_publico)
END IF

//******************************  ALTA ********************************//

IF pu_comunic.is_comunic.accion_llamada="Alta" THEN

	pw_dw.SetItem(1,"alcance", fgci_incidencia_con_interrupcion)    //sobre instalacion
	pw_dw.SetItem(1,"tipo_incidencia",fgci_incidencia_imprevista)            //incidecnica en imprevista
	pw_dw.SetItem(1,"estado_actual",fgci_incidencia_pendiente)//estado_pendiente
	ldt_fec_deteccion=fgnu_fecha_actual()
	pw_dw.SetItem(1,"f_deteccion",ldt_fec_deteccion)        // fecha sistema        
	pw_dw.SetItem(1,"h_deteccion",ldt_fec_deteccion)        // hora del aviso
//	pw_dw.SetItem(1,"f_est_res",ldt_fec_deteccion)
	pw_dw.SetItem(1,"f_est_res",ldt_fecha_nula)  // AFS
	pw_dw.SetItem(1,"centro_alta",gi_nro_centro) // centro de alta
	pw_dw.SetItem(1,"cmd_alta",gi_nro_cmd) // cmd alta
	pw_dw.SetItem(1,"puesto_alta",gi_nro_puesto)  //puesto de alta          
//	pw_dw.SetItem(1,"desc",ls_nro_incidencia)
	pw_dw.Accepttext()
//	il_ult_inc = pw_dw.getitemnumber(1,"nro_incidencia")
//	lu_inc_2004_nu.fnu_actualizar_seguimiento(il_ult_inc,fgci_incidencia_pendiente,ldt_fec_deteccion)                     
//	pw_dw.Modify("fec_causa.protect=1")

END IF

//DESTRUCCION DEL OBJETOS

DESTROY lu_ins_1002_nu
DESTROY lu_inc_2003_nu
DESTROY lu_inc_2004_nu
DESTROY lu_avi_2001_nu
Return il_ult_inc
end function

public function integer frn_hab_numero_incidencia ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hab_numero_incidencia
//
// Objetivo: Habilitar campo numero de incidencia.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: --
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 


return 1 // siempre debe estar protegido
end function

public function integer frn_hab_ot ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hab_ot
//
// Objetivo:
//         Habilita campo orden de trabajo
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: --
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

// 1 protegido
// 0 habilitado

// Siempre esta deshabilitada es meramente informativa

return 1



end function

public function integer frn_hab_brigada ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hab_brigada
//
// Objetivo:
//           Habilita brigada.
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: --
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

// 1 protegido
// 0 habilitado

// Siempre esta desabilita ya que se carga por medio de una ventana

return 1



end function

public subroutine frn_ini_tipo_incidencia (ref datawindow pd_dw, string ps_accion_llamada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_tipo_incidencia
// 
// Objetivo: Inicializa el campo tipo de incidencia puede ser:
//           Imprevista o programada
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada:  datawindow
//                                       accion (seleccionada)
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      
//
////////////////////////////////////////////////////////////////////////////////////////////////


// Si estoy en un Alta a nivel de Instalacion o Alta a nivel de suministro
// siempre tiene que ser imprevista

if ps_accion_llamada = "Alta nivel instalacion" or ps_accion_llamada= "Alta nivel suministro" then
	IF ISNULL(pd_dw.getitemnumber(1,"tipo_incidencia")) THEN
		pd_dw.setitem(1,"tipo_incidencia",1)
	END IF
end if

// Si la Accion es alta normal debe venir cargada por defecto como imprevista

if ps_accion_llamada = "Alta" then
	IF ISNULL(pd_dw.getitemnumber(1,"tipo_incidencia")) THEN
		pd_dw.setitem(1,"tipo_incidencia",1)
	END IF
end if

// Una vez que se grab$$HEX2$$f3002000$$ENDHEX$$la incidencia esto no se puede modificar.



end subroutine

public function integer frn_hab_causa (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hab_causa
//
// Objetivo: Habilita el campo causa     
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

// 1 protegido
// 0 habilitado

// si la incidencia no tiene brigada no puede estar habilitado

pd_dw.accepttext() // se asegura de que esten actualizados todos los campos

if pd_dw.getitemnumber(1,"estado_actual") >= fgci_incidencia_enviado_brigada or not isnull(pd_dw.getitemnumber(1,"ot")) then
	return 0
end if

return 1



end function

public function integer frn_hab_tip_tension (ref datawindow pd_dw, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_hab_tip_tension
//
// Objetivo:
//          Habilitar campo tipo de tensi$$HEX1$$f300$$ENDHEX$$n
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada:pd_dw, ps_accion_llamada
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

// 1- Protegido
// 0 - Desabilitado
int li_tipo_instalacion
pd_dw.accepttext()


// Si es una incidencia de suministro siempre est$$HEX2$$e1002000$$ENDHEX$$deshabilitado

if pd_dw.getitemnumber(1,"alcance") = fgci_incidencia_de_suministro then
	return 1
end if

// se mantiene deshabilitado mientras no haya instalaci$$HEX1$$f300$$ENDHEX$$n afectada seleccionada.
// una vez que exista instalaci$$HEX1$$f300$$ENDHEX$$n afectada seleccionada, contendr$$HEX2$$e1002000$$ENDHEX$$la tension 
// de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada, pero podr$$HEX2$$e1002000$$ENDHEX$$ser modificada por el usuario.


if isnull(pd_dw.getitemdecimal(1,"nombre_ins")) or pd_dw.getitemnumber(1,"estado_actual") >= fgci_incidencia_enviado_brigada then
	return 1
end if
li_tipo_instalacion=integer(pd_dw.getitemstring(1,"tipo_instalacion"))
IF li_tipo_instalacion < gi_frontera_tipo_inst THEN  
		return 1
END IF
return 0

end function

public subroutine frn_ini_ot (ref datawindow pdw_incidencia, long pl_ot);
//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_ot
//
// Objetivo: Inicializa el campo orden de trabajo.
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pdw_incidencia, pl_ot
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

// pdw_incidencia datawindow que gestiona la incidencia


// pi_brigada representa la brigada devuelta por la ventana de gestion de ot
// para asignarle al campo brigada de la incidencia

// la brigada siempre debe coincidir con la ultima brigada asiganada en la ot que este a cargo.
// que puede o no es un momento determinado estar asignado a la incidencia.
// Este control es hecho por la ventana de gestion de ot, que garantiza el 
// valor de la brigada.

// Si se esta dando un alta o modificacion de cualquier tipo y la incidencia est$$HEX2$$e1002000$$ENDHEX$$en
// pediente debe ser 0
long ll_ot
setnull(ll_ot)
pdw_incidencia.accepttext()

if pdw_incidencia.getitemnumber(1,"estado_actual") = fgci_incidencia_pendiente then
	pdw_incidencia.setitem(1,"ot",ll_ot)   // no puede haber brigada asignada
end if

// si vale 0 y el campo de ot es distinto de 0 debo actualizar con lo
// devuelto por la ventana de ot

if isnull(pdw_incidencia.getitemnumber(1,"ot")) and pl_ot <> 0 then 
	pdw_incidencia.setitem(1,"ot",pl_ot) 
end if
		
	

	



end subroutine

public function boolean frn_validar_numero_incidencia (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funcion: frn_validar_numero_incidencia
//
// Objetivo: Validar campo n$$HEX1$$fa00$$ENDHEX$$mero de incidencia a efectos de permitir 
//           grabaci$$HEX1$$f300$$ENDHEX$$n de incidencia.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada: pd_dw
//                      Salida:  --
//
// Devuelve:
//
//      Fecha           Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
//////////////////////////////////////////////////////////



// El n$$HEX1$$fa00$$ENDHEX$$mero de incidencia no puede ser n$$HEX1$$fa00$$ENDHEX$$lo y no puede estar duplicado
// en el archvio.
// Esta validaci$$HEX1$$f300$$ENDHEX$$n se realiza por base de datos , por lo cual aqui solo
// se valida que no sea nulo

// verdadedor pas$$HEX2$$f3002000$$ENDHEX$$la validacion
// false existe un error

IF isnull(pd_dw.getitemnumber(1,"nro_incidencia")) THEN
	gnv_msg.f_mensaje("AI39","","",OK!)
	RETURN FALSE
END IF
RETURN TRUE
end function

public function boolean frn_validar_centro_alta (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funcion: frn_validar_centro_alta
//
// Objetivo: 
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada: pd_dw
//                      Salida:
//
// Devuelve:
//
//      Fecha           Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
//////////////////////////////////////////////////////////

// Valida la integrigidad del campo n$$HEX1$$fa00$$ENDHEX$$mero de incidencia a efectos de 
// permitir la grabacion de la incidencia


return true
end function

public function boolean frn_validar_puesto_alta (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_puesto_alta
//
// Objetivo: Valida  la integridad del campo puesto alta.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw
//      Salida:  --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////


// este campo siempre debe coincidir con el del usuario que esta
// dando de alta o actualizando la incidencia


//
//if isnull(pd_dw.getitemnumber(1,"puesto_alta")) then
//      messagebox("Puesto_alta","El puesto es nulo")
//      return false
//end if
return true
end function

public function boolean frn_validar_cmd_alta (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funcion: frn_validar_cmd_alta
//
// Objetivo: Valida la integridad del centro de alta este campo 
//           siempre debe coincidir con el usuario que esta dando 
//           de alta o actualizando la incidencia.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada: pd_dw
//                      Salida: --
//
// Devuelve:
//
//      Fecha           Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
//////////////////////////////////////////////////////////


//if isnull(pd_dw.getitemnumber(1,"cmd_alta")) then
//      messagebox("cmd-alta","es nulo")
//      return false
//end if
return true
end function

public function boolean frn_validar_brigada (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_brigada
//
// Objetivo: Valida campo brigada
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw
//      Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////


long ll_cantidad
long ll_nro_incidencia


ll_nro_incidencia = pd_dw.getitemnumber(1,"nro_incidencia")
ll_cantidad = 0

IF pd_dw.getitemnumber(1,"Estado_actual") >= fgci_incidencia_enviado_brigada &
	and isnull(pd_dw.getitemnumber(1,"ot") ) THEN
	gnv_msg.f_mensaje("AI44","","",OK!)
	RETURN FALSE
END IF
RETURN TRUE
end function

public function boolean frn_validar_instalacion_afectada (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_instalacion_afectada
//
// Objetivo: Valida campo instalaci$$HEX1$$f300$$ENDHEX$$n afectada
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw
//      Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////


// Si la incidencia no es de suministro debe existir siempre instalacion
// afectada


IF pd_dw.getitemnumber(1,"alcance") <> fgci_incidencia_de_suministro and isnull(pd_dw.getitemnumber(1,"nombre_ins")) THEN 
	gnv_msg.f_mensaje("AI45","","",OK!)
	RETURN FALSE
END IF

RETURN TRUE

end function

public function boolean frn_validar_observaciones (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_observaciones
//
// Objetivo: Valida las observaciones que no pueden ser nulas en 
//           cualquier estado.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw
//      Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////

if ((pd_dw.getitemnumber(1,"estado_actual")) >= fgci_incidencia_enviado_brigada) THEN
	if gb_obs_obligatorias = true then
		IF Isnull(pd_dw.getitemstring(1,"observacion")) or len(pd_dw.getitemstring(1,"observacion"))=0 then
			gnv_msg.f_mensaje("AI46","","",OK!)
			RETURN FALSE
		END IF
	end if
END IF
RETURN TRUE
end function

public function boolean frn_validar_ind_suministro (ref datawindow pd_dw, long pl_cantidad_avisos);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_ind_suministro
//
// Objetivo: Valida que si el indicativo de suministro es 0, la incidencia
//           tenga instalaci$$HEX1$$f300$$ENDHEX$$n afectada, si es 1 que no tenga instalaci$$HEX1$$f300$$ENDHEX$$n afectada
//           ni m$$HEX1$$e100$$ENDHEX$$s de un aviso asociado.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw, pl_cantidad_avisos
//      Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////



long ll_cantidad
long ll_nro_incidencia
dec{0}  ld_nombre_ins

ll_nro_incidencia = pd_dw.getitemnumber(1,"nro_incidencia")
ll_cantidad = 0


IF (pd_dw.getitemnumber(1,"alcance")) = fgci_incidencia_de_suministro THEN // Incidencia de suministro

	IF not isnull(pd_dw.getitemnumber(1,"nombre_ins")) THEN
		ld_nombre_ins=pd_dw.getitemdecimal(1,"nombre_ins")
		IF (ld_nombre_ins <> fgcdec_incidencia_de_suministro) THEN
			gnv_msg.f_mensaje("AI47"," "," ",OK!)
			RETURN FALSE
		END IF
	END IF
ELSE
	IF isnull(pd_dw.getitemnumber(1,"nombre_ins")) THEN
		gnv_msg.f_mensaje("AI48","","",OK!)
		RETURN FALSE
	END IF
END IF
RETURN TRUE
end function

public function boolean frn_validar_cant_avisos (ref datawindow pd_dw, long pl_cantidad_avisos);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_cant_avisos
//
// Objetivo: Valida campo cantidad de aviso
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw, pl_cantidad_avisos
//      Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////


// el mismo no puede ser 0 a partir del momento que existan avisos 
// asociados a la incidencia
// no se valida ya que se recalcula en el momento de grabar.

//if pl_cantidad_avisos = 0 then
//      return false
//end if



return true
end function

public function boolean frn_validar_cant_cli (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_cant_cli
//
// Objetivo: 
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw
//      Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////


// Contiene la cantidad de clientes afectados por la incidencia que son
//importantes
// este campo no debe ser 0 a partir del momento en que existen interrupciones
// marcadas y una de ellas est$$HEX2$$e1002000$$ENDHEX$$repuesta , es decir de er para adelante
// si la incidencia es de suministro siempre debe valer distinto de 0")



return true
end function

public function boolean frn_validar_estado_mant (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_estado_mant
//
// Objetivo: Valida campo estado en mantenimiento.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw
//      Salida: --
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////

// El estado en mantenimiento puede ser nulo o 0 si la misma no fue deribada
// asimismo puede valer cualquier valor durante su pasaje por mantenimiento
// pero si el estado de la incidencia es resuelto , entonces deber$$HEX2$$e1002000$$ENDHEX$$valer 
// pr o rm dependiendo si est$$HEX2$$e1002000$$ENDHEX$$o no autorizado a resolver por mantenimiento

/*AHU estados mantenimiento OCEN
IF not isnull(pd_dw.getitemnumber(1,"Estado_mantenimiento")) and pd_dw.getitemnumber(1,"Estado_mantenimiento") <> 0 and pd_dw.getitemnumber(1,"estado_actual") = fgci_incidencia_resuelta THEN
		IF pd_dw.getitemnumber(1,"resuelve_mant") = 0 THEN
			IF pd_dw.getitemnumber(1,"Estado_mantenimiento") <> fgci_incidencia_mant_para_resolucion THEN
				gnv_msg.f_mensaje("AI49","","",OK!)
				RETURN FALSE
			END IF
		ELSE
			IF pd_dw.getitemnumber(1,"estado_mantenimiento") <> fgci_incidencia_mant_resuelta_mant THEN
				gnv_msg.f_mensaje("AI50","","",OK!)
				return false
			END IF
		END IF
END IF*/
RETURN TRUE
end function

public function boolean frn_validar_potencia_contratada (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_potencia_contratada
//
// Objetivo: Valida la potencia contratada.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada:  pd_dw
//        Salida :   --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
///////////////////////////////////////////////////////////




// validar el material averiado

// no puede ser nulo cuando la incidencia est$$HEX2$$e1002000$$ENDHEX$$de sr en adelante

//IF isnull(pd_dw.getitemnumber(1,"material_averiado")) and pd_dw.getitemnumber(1,"estado_actual") = fgci_incidencia_servicio_repuesto() THEN
//      RETURN FALSE
//END IF
RETURN TRUE

end function

public function boolean frn_validar_potencia_afectada (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_potencia_afectada
//
// Objetivo: Valida la potencia afectada y basta que exista interrupcion.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada:  pd_dw
//        Salida :   --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
///////////////////////////////////////////////////////////


Long ll_cantidad
Long ll_nro_incidencia
// no puede ser nulo cuando existen interrupciones marcadas,es decir cuando
// la incidencia esta con estado mayor o igual a causa localizada
// si la incidencia es de suministro, no se valida la potencia afectada

IF pd_dw.getitemnumber(1,"alcance") = fgci_incidencia_de_suministro or &
    pd_dw.getitemnumber(1,"tipo_incidencia") = fgci_incidencia_calidad or &
	 pd_dw.getitemnumber(1,"alcance") = fgci_incidencia_reenganche or &
    pd_dw.getitemnumber(1,"alcance") = fgci_incidencia_sin_interrupcion THEN
	RETURN TRUE
ELSE    
	//IF iw_contenedora.fw_incidencia_de_operaciones() THEN
			
	//	RETURN TRUE
	//ELSE
		pd_dw.accepttext()
		ll_nro_incidencia=pd_dw.getitemnumber(1,"nro_incidencia")
		//IF pd_dw.getitemnumber(1,"estado_actual") >= fgci_incidencia_causa_localizada and pd_dw.getitemnumber(1,"estado_actual") < fgci_incidencia_servicio_repuesto THEN
		IF pd_dw.getitemnumber(1,"estado_actual") = fgci_incidencia_resuelta AND & 
			(iw_contenedora.tab_1.ii_tipo_incid <> fgci_incidencia_programada and (iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen") < 1 &
			or isnull(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen")))) THEN
		
			gnv_msg.f_mensaje("AI140","","",OK!)
			return false
		END IF		
		
//		IF pd_dw.getitemnumber(1,"estado_actual") < fgci_incidencia_servicio_repuesto and &
//			pd_dw.getitemnumber(1,"estado_actual") > fgci_incidencia_pendiente THEN
//			//SELECT COUNT(*) INTO :ll_cantidad FROM "INTERRUPCION" WHERE "NRO_INCIDENCIA" =:ll_nro_incidencia;
//			// Se comprueba la generacion de interrupciones
//			ll_cantidad = iw_contenedora.tab_1.tabpage_interrupciones.d_datos_interrup.RowCount()
//			IF ll_cantidad > 0 THEN
//	//			//Se comprueba que se haya seleccionado el material averiado
//	//			if len(trim(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"material_averiado"))) = 0 or isnull(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemstring(1,"material_averiado")) then
//	//				gnv_msg.f_mensaje("AI141","","",OK!)
//	//				return false
//	//			else
//				// Se comprueba la seleccion de la instalacion origen del problema 
//				if iw_contenedora.tab_1.ii_tipo_incid <> fgci_incidencia_programada and (iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen") < 1 &
//					or isnull(iw_contenedora.tab_1.tabpage_formulario.d_inf_general.getitemnumber(1,"instalacion_origen"))) then
//					
//					gnv_msg.f_mensaje("AI140","","",OK!)
//					return false
//	//			end if
//				END IF
//			END IF
//		END IF
//	END IF
end if
RETURN TRUE

end function

public function boolean frn_validar_causa (ref datawindow pd_dw);// validar el material averiado

// no puede ser nulo cuando la incidencia est$$HEX2$$e1002000$$ENDHEX$$de sr en adelante

//if  pd_dw.getitemnumber(1,"estado_actual") >= fgci_incidencia_servicio_repuesto then
//      return false
//end if
return true

end function

public function boolean frn_validar_estado_actual (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_estado_actual
//
// Objetivo: Valida el estado actual de la incidencia.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
///////////////////////////////////////////////////////////



//// Validaciones para el estado de PT
//IF pd_dw.getitemnumber(1,"tipo_incidencia") = fgci_incidencia_programada THEN
//	IF pd_dw.getitemnumber(1,"estado_actual") < fgci_incidencia_enviado_brigada THEN
//			gnv_msg.f_mensaje("AI53","","",OK!)
//			RETURN FALSE
//	END IF
//END IF 
RETURN TRUE

end function

public function boolean frn_validar_material_averiado (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_material_averiado
//
// Objetivo: Valida material averiado.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
///////////////////////////////////////////////////////////


// no puede ser nulo cuando existen interrupciones marcada,es decir cuando
// la incidencia esta con estado mayor o igual a causa localizada

IF isnull(pd_dw.GetItemString(1,"material_averiado")) and pd_dw.getitemnumber(1,"estado_actual") >= fgci_incidencia_servicio_repuesto THEN
	gnv_msg.f_mensaje("AI56","","",OK!)
	RETURN FALSE
END IF
RETURN TRUE

end function

public function boolean frn_menu_hab_instalacion_afectada (ref datawindow pd_dw, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_menu_hab_instalacion_afectada
//
// Objetivo: Evalua el estado de la incidencia y la acci$$HEX1$$f300$$ENDHEX$$n llamada para 
//           habilitar o deshabilitar la acci$$HEX1$$f300$$ENDHEX$$n del menu de instalaci$$HEX1$$f300$$ENDHEX$$n
//           afectada.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, ps_accion_llamada
//        Salida : --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
///////////////////////////////////////////////////////////
Long ll_nro_incidencia
Long ll_cantidad

IF ps_accion_llamada = "Consulta" or ps_accion_llamada="Mantenimiento"  THEN
	return false
END IF
IF ps_accion_llamada = "Alta_nivel_instalacion" or ps_accion_llamada="Modificacion" then//paxho
	return false
END IF
IF pd_dw.getitemnumber(1,"alcance") = fgci_incidencia_de_suministro THEN
	return false   // SI es una incidencia de suministro no se selecciona instalaci$$HEX1$$f300$$ENDHEX$$n
END IF
IF NOT isnull(pd_dw.getitemdecimal(1,"nombre_ins")) THEN
	IF pd_dw.getitemnumber(1,"estado_actual") = fgci_incidencia_pendiente THEN
		ll_nro_incidencia=pd_dw.getitemnumber(1,"nro_incidencia")
		Select count(*) into :ll_cantidad FROM SGD_INTERRUPCION WHERE NRO_INCIDENCIA=:ll_nro_incidencia;
		IF ll_cantidad > 0 THEN
			RETURN FALSE
		ELSE
			RETURN TRUE
		END IF
	ELSE
		RETURN FALSE
	END IF
END IF
RETURN TRUE



end function

public subroutine frn_hab_ind_suministro (ref datawindow pd_dw, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funcion: frn_hab_ind_suministro
//
// Objetivo: Habilitar campo indicativo de suministro.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//       Entrada: pd_dw, ps_accion_llamada
//                      Salida: --
//
// Devuelve:
//
//      Fecha           Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
//////////////////////////////////////////////////////////



// 1-protegido
// 0-habilitado

// Siempre debe estar protegido ya que se carga su valor por defecto dependiendo
// de la forma en que se el alta
pd_dw.modify("alcance.protect=1")
pd_dw.modify("alcance.background.color="+gs_gris)


end subroutine

public subroutine frn_ini_ind_suministro (ref datawindow pd_dw, string ps_accion_llamada);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_indentificaci$$HEX1$$f300$$ENDHEX$$n de suministro.
//
// Objetivo:
//         Inicializar campo identificacion de suministro.
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, ps_accion_llamada
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 



if ps_accion_llamada = "Alta nivel suministro" then
	pd_dw.setitem(1,"alcance",fgci_incidencia_de_suministro)
else
	pd_dw.setitem(1,"alcance",fgci_incidencia_con_interrupcion)
end if

end subroutine

public subroutine frn_ini_causa (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_causa
// 
// Objetivo: Pone valores predefinidos y habilita  asegurando que esten
//                               actualizados todos los campos.
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: pd_dw          
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      
//
////////////////////////////////////////////////////////////////////////////////////////////////


// pdw_incidencia datawindo de control de incidencia


// debe valver 0 mientras la incidencia este en pt
// 
int li_null
setnull(li_null)

pd_dw.accepttext()  
IF pd_dw.getitemnumber(1,"estado_actual") >= fgci_incidencia_enviado_brigada and pd_dw.getitemnumber(1,"estado_actual") <= fgci_incidencia_resuelta THEN
	pd_dw.modify ("causa.protect=0")
	pd_dw.modify("causa.background.color="+gs_blanco)
ELSE
	pd_dw.setitem(1,"causa",li_null)
//	pd_dw.modify ("causa.protect=1")
	iw_contenedora.tab_1.tabpage_formulario.st_1.visible = false
	pd_dw.modify("causa.background.color="+gs_gris)
END IF










end subroutine

public subroutine fnu_ini_centros_alta (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_ini_centros_alta
//
// Objetivo:  Inicializa centros de alta.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
///////////////////////////////////////////////////////////




pd_dw.SetItem(1,"centro_alta",gi_nro_centro)
pd_dw.SetItem(1,"cmd_alta",gi_nro_cmd)
pd_dw.SetItem(1,"puesto_alta",gi_nro_puesto)
end subroutine

public function boolean frn_validar_des (ref datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_des
//
// Objetivo: Valida que la descripci$$HEX1$$f300$$ENDHEX$$n no sea nula.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw
//        Salida : --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
///////////////////////////////////////////////////////////


IF isnull(pd_dw.getitemstring(1,"desc")) or Len(pd_dw.getitemstring(1,"desc"))=0 then
		gnv_msg.f_mensaje("AI59","","",OK!)
		RETURN FALSE
END IF
RETURN TRUE
end function

public subroutine frn_ini_estado_operaciones (ref datawindow pd_dw, string ps_accion_llamada, integer pi_interrupciones, integer pi_estado_operaciones, datetime pdt_fec_en_reposicion, datetime pdt_fec_serv_rep);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_estado_operaciones
//
// Objetivo:  Pone valores predefinidos y habilita  asegurando que esten
//            actualizados todos los campos seg$$HEX1$$fa00$$ENDHEX$$n estado de operaciones.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, ps_accion_llamada, pi_interrupciones,
//                 pi_estado_operaciones, pdt_fec_en_reposicion
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
//////////////////////////////////////////////////////////
// pdw_incidencia datawindow de control de incidencia
// ps_accion_llamada accion con que fue llamada la incidencia

// pi_interrupciones  representa el estado de las interrupciones
// -1 - No se salvo en la pantalla de interrupciones.Queda como estaba.
// 0 - Ninguna Interrupcion seleccionada
// 1 - Interrupciones seleccionadas pero ninguna repuesta
// 2 - Una interrupci$$HEX1$$f300$$ENDHEX$$n repuesta pero no todas
// 3 - Todas las interrupciones repuestas

// comienzo poniendo el estado de la incidencia en pt como si fuese
// alta de cualquier tipo
int linull
datetime ldt_fecha_nula
setnull(linull)
setnull(ldt_fecha_nula)
IF pi_interrupciones = - 1 THEN   
	Return
END IF

u_inc_2004_nu_form_inf_general lu_inc_2004_nu
lu_inc_2004_nu = Create u_inc_2004_nu_form_inf_general

setnull(li_nulo)
setnull(ll_nulo)

pd_dw.accepttext()

// Analisis del estado de Pendiente

// 1.- Cuando se da de alta o se modifica  la incidencia
// 1.1.- No existe ning$$HEX1$$fa00$$ENDHEX$$n otra informaci$$HEX1$$f300$$ENDHEX$$n que condicione el cambio de estado
	if isnull(pd_dw.getitemnumber(1,"ot")) then
				pd_dw.setitem(1,"estado_actual",fgci_incidencia_pendiente) // Pendiente
	end if



// Analisis del Estado EB
// 1. Debe estar en EB cuando  existe ot
	if Not isnull(pd_dw.getitemnumber(1,"ot")) and pd_dw.getitemnumber(1,"estado_actual") < fgci_incidencia_enviado_brigada then 
		pd_dw.setitem(1,"estado_actual",fgci_incidencia_enviado_brigada)
	end if

// Analisis del Estado CL
// 1. Debe campo causa localizada debe ser distinto de nulo
//if (not isnull(pd_dw.getitemnumber(1,"causa")) and pd_dw.getitemnumber(1,"causa") <> fgci_sin_seleccionar) and pd_dw.getitemnumber(1,"estado_actual") < fgci_incidencia_causa_localizada then
//	pd_dw.setitem(1,"estado_actual",fgci_incidencia_causa_localizada)
//end if
//
	
// Analisis del Estado ER

//IF (pi_interrupciones = fgci_ninguna_interrupcion_seleccionada or pi_interrupciones=fgci_ninguna_interrupcion_repuesta) THEN
//	pd_dw.setitem(1,"estado_actual",fgci_incidencia_causa_localizada)
//END IF

//IF (pi_interrupciones = fgci_ninguna_interrupcion_seleccionada) THEN
//	pd_dw.modify("tip_incidencia.protect=1")
//	pd_dw.modify("tip_incidencia.background.color="+gs_gris)
//ELSE
//	pd_dw.modify("tip_incidencia.protect=0")
//	pd_dw.modify("tip_incidencia.background.color="+gs_blanco)
//END IF  

// 1. Cuando existe por lo menos una interrupcione repuesta pero no todas
//IF pi_interrupciones = fgci_alguna_interrupcion_repuesta and pd_dw.getitemnumber(1,"estado_actual") <= fgci_incidencia_en_reposicion THEN
IF pi_interrupciones = fgci_alguna_interrupcion_repuesta  THEN
	lu_inc_2004_nu.fnu_actualizar_seguimiento(pd_dw.getitemnumber(1,"nro_incidencia"),fgci_incidencia_en_reposicion,pdt_fec_en_reposicion)
	pd_dw.setitem(1,"estado_actual",fgci_incidencia_en_reposicion)
	pd_dw.setitem(1,"material_averiado",linull)
	pd_dw.modify("material_averiado.protect=1")
	pd_dw.modify("material_averiado.background.color="+gs_gris)
	pd_dw.accepttext()
END IF

// Analisis del Estado SR
// 1.- Cuando est$$HEX1$$e100$$ENDHEX$$n todas las interrupciones repuestas
IF pi_interrupciones = fgci_todas_interrupcion_repuesta THEN
		lu_inc_2004_nu.fnu_actualizar_seguimiento(pd_dw.getitemnumber(1,"nro_incidencia"),fgci_incidencia_servicio_repuesto,pdt_fec_serv_rep)		// AFS        
		lu_inc_2004_nu.fnu_actualizar_seguimiento(pd_dw.getitemnumber(1,"nro_incidencia"),fgci_incidencia_en_reposicion,pdt_fec_en_reposicion)		// AFS 
		lu_inc_2004_nu.fnu_actualizar_seguimiento(pd_dw.getitemnumber(1,"nro_incidencia"),fgci_incidencia_resuelta,ldt_fecha_nula)
		pd_dw.setitem(1,"estado_actual",fgci_incidencia_servicio_repuesto)
		pd_dw.modify("material_averiado.protect=0")
		pd_dw.modify("material_averiado.background.color="+gs_blanco)
END IF


// Analisis del Estado RS

if pi_estado_operaciones = fgci_incidencia_resuelta and pd_dw.getitemnumber(1,"estado_actual") < fgci_incidencia_resuelta then
	pd_dw.setitem(1,"estado_actual",fgci_incidencia_resuelta)
end if

DESTROY lu_inc_2004_nu
end subroutine

public subroutine frn_ini_brigada (ref datawindow pdw_incidencia, long pl_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_brigada
// 
// Objetivo: Pone en valores predefinidos dependiendo sea alta o de  
//                              que ventana es llamada.
//      
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada:  pdw_incidencia, datawindow que gestiona la incidencia.
//              pi_brigada, representa la brigada devuelta por la ventana de gestion de 
//                          orden de trabajo para asignarle al campo brigada de la incidencia.
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      
//
////////////////////////////////////////////////////////////////////////////////////////////////




setnull(li_nulo)
string ls_nom_brigada
// la brigada siempre debe coincidir con la ultima brigada asiganada en la ot que este a cargo.
// que puede o no es un momento determinado estar asignado a la incidencia.
// Este control es hecho por la ventana de gestion de ot, que garantiza el 
// valor de la brigada.

// Si se esta dando un alta o modificacion de cualquier tipo y la incidencia est$$HEX2$$e1002000$$ENDHEX$$en
// pediente debe ser 0

pdw_incidencia.accepttext()
	if isnull(pdw_incidencia.getitemnumber(1,"ot")) then
		pdw_incidencia.setitem(1,"brigada",li_nulo)   // no puede haber brigada asignada
	end if

	// si vale 0 y el campo de brigadaes distinto de 0 debo actualizar con lo
	// devuelto por la ventana de ot

if isnull(pdw_incidencia.getitemnumber(1,"brigada")) then
		pdw_incidencia.setitem(1,"nom_brigada"," ")
end if
if pl_brigada <> 0 then 
			pdw_incidencia.setitem(1,"brigada",pl_brigada) 
			select nombre into :ls_nom_brigada from gi_brigada where nro_brigada=:pl_brigada;          
			pdw_incidencia.setitem(1,"nom_brigada",ls_nom_brigada)
			pdw_Incidencia.modify("causa.background.color="+gs_blanco)
else
		pdw_incidencia.setitem(1,"nom_brigada","")
	end if



end subroutine

public function boolean frn_validar_ot (datawindow pd_dw);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_ot
//
// Objetivo: Valida campo ordenes de trabajo.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pd_dw
//      Salida:  ---
//
// Devuelve:
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
////////////////////////////////////////////////////////////

long ll_cantidad
long ll_nro_incidencia
dec{0} ld_nombre_ins

ll_nro_incidencia = pd_dw.getitemnumber(1,"nro_incidencia")
ll_cantidad = 0


IF (pd_dw.getitemnumber(1,"alcance")) = fgci_incidencia_de_suministro THEN

	IF not isnull(pd_dw.getitemnumber(1,"nombre_ins")) THEN
		ld_nombre_ins=pd_dw.getitemnumber(1,"nombre_ins")
		IF ld_nombre_ins<>fgcdec_incidencia_de_suministro THEN
			gnv_msg.f_mensaje("AI40","","",OK!)
			RETURN FALSE
		END IF
	ELSE
		select Count(*) into :ll_cantidad  from gi_avisos where gi_avisos.nro_incidencia = :ll_nro_incidencia;
		IF ll_cantidad = 0 THEN
				gnv_msg.f_mensaje("AI41","","",OK!)
				RETURN FALSE
		ELSE
			IF ll_cantidad > 1 THEN
				gnv_msg.f_mensaje("AI42","","",OK!)
				RETURN FALSE
			END IF
		END IF
	END IF
	
ELSE
	IF isnull(pd_dw.getitemnumber(1,"nombre_ins")) THEN
		gnv_msg.f_mensaje("AI43","","",OK!)
		RETURN FALSE
	END IF
END IF
RETURN TRUE
end function

public subroutine frn_ini_interrupcion (ref datawindow pd_dw, double pl_pot_inst_afec, double pl_pot_cont_afec, long pl_cli_afect, long pl_primer_aviso, datetime pd_f_deteccion, decimal pd_paxtc, decimal pd_pcxtc, decimal pd_paxtc_mant, decimal pd_pcxtc_mant);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_interrupcion
//
// Objetivo:
//         Inicializar campo interrupci$$HEX1$$f300$$ENDHEX$$n.
//
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pd_dw, pl_pot_inst_afec, pl_pot_cont_afec, pl_cli_afect
//                 pl_primer_aviso, pd_f_deteccion.
//        Salida: --
//
// Devuelve: 
//
// Fecha                Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----                -----------             ---------
//
/////////////////////////////////////////////////////////// 

int li_cantidad
long ll_nro_incidencia
IF not isNull(pl_pot_inst_afec) THEN
	pd_dw.setitem(1,"pot_afectada",pl_pot_inst_afec)
END IF
IF not isNull(pl_pot_cont_afec) THEN
	pd_dw.setitem(1,"pot_contratada",pl_pot_cont_afec)
END IF
IF not isNull(pl_cli_afect) THEN
	pd_dw.setitem(1,"ccli_afec",pl_cli_afect)
END IF
IF not isNull(pl_primer_aviso) THEN
	pd_dw.setItem(1,"primer_aviso",pl_primer_aviso)
END IF
IF not IsNull(pd_f_deteccion) THEN
	IF not isNull(pd_dw.getitemdatetime(1,"f_deteccion")) THEN
		If pd_f_deteccion<pd_dw.getitemdatetime(1,"f_deteccion") THEN
			pd_dw.setItem(1,"f_deteccion",pd_f_deteccion)
			pd_dw.setItem(1,"h_deteccion",pd_f_deteccion)
		END IF
	ELSE    
		pd_dw.setItem(1,"f_deteccion",pd_f_deteccion)
		pd_dw.setItem(1,"h_deteccion",pd_f_deteccion)
	END IF
	pd_dw.modify("f_deteccion.protect=1")
	pd_dw.modify("f_deteccion.background.color="+gs_gris)
Else
	ll_nro_incidencia=pd_dw.getitemnumber(1,"nro_incidencia")
	SELECT COUNT(*) INTO :li_cantidad from sgd_interrupcion where nro_incidencia=:ll_nro_incidencia;
	IF li_cantidad=0 THEN   
		pd_dw.modify("f_deteccion.protect=0")
		pd_dw.modify("f_deteccion.background.color="+gs_blanco)
//		pd_dw.modify("tipo_incidencia.protect=0")
	ELSE
		pd_dw.modify("f_deteccion.protect=1")
		pd_dw.modify("f_deteccion.background.color="+gs_gris)
//		pd_dw.modify("tipo_incidencia.protect=1")
	END IF
END IF
pd_dw.setItem(1,"paxtc",pd_paxtc)
pd_dw.setItem(1,"pcxtc",pd_pcxtc)
pd_dw.setItem(1,"paxtc_mant",pd_paxtc_mant)
pd_dw.setItem(1,"pcxtc_mant",pd_pcxtc_mant)

pd_dw.accepttext()
end subroutine

on u_inc_2003_rn_form_inf_general.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_inc_2003_rn_form_inf_general.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


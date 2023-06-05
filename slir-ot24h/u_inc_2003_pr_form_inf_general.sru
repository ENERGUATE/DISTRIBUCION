HA$PBExportHeader$u_inc_2003_pr_form_inf_general.sru
$PBExportComments$UserObject para la informaci$$HEX1$$f300$$ENDHEX$$n general de la incidencia.
forward
global type u_inc_2003_pr_form_inf_general from u_inc_1001_pr_generico
end type
end forward

global type u_inc_2003_pr_form_inf_general from u_inc_1001_pr_generico
integer width = 3323
integer height = 1356
string dataobject = "d_inc_2003_pr_form_inf_general"
end type
global u_inc_2003_pr_form_inf_general u_inc_2003_pr_form_inf_general

type variables
// cant. de filas que se pueden seleccionar: 
// 0: ninguna   1: una   2: una o m$$HEX1$$e100$$ENDHEX$$s filas
// MERC integer ii_filas_selec = 0

// tabla asociada a la datawindow y de la cual se des-
// pliega su nombre si hay error al grabar
// MERC integer ii_tabla  = 1
                     
// Nro. de la Fila seleccionada
// MERC integer ii_selected_row

// MERC datawindowchild ddw_tension
datawindowchild ddw_tension_incidencia
// MERC datawindowchild ddw_estado_actual
datawindowchild ddw_estado_incidencia
// MERC datawindowchild ddw_causa
datawindowchild ddw_causa_incidencia
// MERC datawindowchild ddw_material_averiado
datawindowchild ddw_tipo_instalacion
datawindowchild dddw_tipo_incidencia
w_2301_form_incidencia iw_contenedora
end variables

forward prototypes
public function integer fnu_crea_dddw ()
public function integer fpr_c_inidencia (ref userobject pu_ambito)
public function integer fpr_habilitar_campos (string ps_accion)
public function u_generico_comunicaciones fpr_devolver_fyh_deteccion ()
public function integer fpr_deshabilitar ()
public function integer fpr_devolver_estado_actual ()
public function boolean fpr_devolver_resuelve_mantenimiento ()
end prototypes

public function integer fnu_crea_dddw ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crea_dddw
// 
// Objetivo: Crea las drop down datawindows internas del user object.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
datawindowchild ddw_causa_incidencia_sin_todos


this.GetChild('estado_actual',ddw_estado_actual)
//ddw_estado_incidencia_t_shared.sharedata(ddw_estado_actual)
ddw_estado_actual.settransobject(sqlca)
ddw_estado_actual.retrieve('E_OP')

this.GetChild('tipo_instalacion',ddw_tipo_instalacion)
ddw_tipo_ins_t_shared.sharedata(ddw_tipo_instalacion)

this.GetChild('tip_tension',ddw_tension)
ddw_tension_incidencia_total.sharedata(ddw_tension)  // Ale

This.GetChild('causa',ddw_causa_incidencia_sin_todos)
ddw_causa_incidencia_sin_todos.SetTransObject(sqlca)
ddw_causa_incidencia_sin_todos.Retrieve()

this.GetChild("material_averiado",ddw_material_averiado)
ddw_material_averiado_shared.sharedata(ddw_material_averiado)

this.GetChild('tipo_incidencia',dddw_tipo_incidencia)
//ddw_estado_incidencia_t_shared.sharedata(ddw_estado_actual)
dddw_tipo_incidencia.settransobject(sqlca)
dddw_tipo_incidencia.retrieve(2)


Return 1
end function

public function integer fpr_c_inidencia (ref userobject pu_ambito);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_c_incidencia
// 
// Objetivo: Carga en la estructura de incidencias los datos 
//           de la ventana
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  user object de ambito (con el centro,cmd y mesa de alta) 
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_nro_brigada

//	is_incidencia.gstr_nro_incidencia = this.getItemNumber(1,"nro_incidencia") 
//	is_incidencia.gstr_programa = "u_inc_2003_pr_form_inf_general"
//	is_incidencia.gstr_usuario  = gs_usuario 
//	is_incidencia.gstr_f_actual = DATETIME(Today(),Now()) 
//	is_incidencia.gstr_programa = "u_bri_2001_nu"
//
//	is_incidencia.gstr_f_alta = 
//	is_incidencia.gstr_h_alta = 

Return 1
end function

public function integer fpr_habilitar_campos (string ps_accion);////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_habilitar_campos
// 
// Objetivo: Habilitar o Deshabilitar los campos de la data window 
//          
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: accion segun la cual se habiliatran los campos(string)
//
//	Entrada:  ps_accion
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF (ps_accion="Alta") THEN
	this.Modify("estado_actual.protect=1")
// DSA INI 8/08/2000
//	gi_perfil_ok = {fgci_perfil_oper_alta_media,0}
//	IF fgnu_tiene_perfil(0) THEN		//habilita segun el tipo del usuario
//		this.Modify("tip_tension.protect=0")
//	ELSE
		this.Modify("tip_tension.protect=1")
//	END IF
// DSA FIN 8/08/2000
	this.Modify("f_deteccion.protect=0")
	this.Modify("h_deteccion.protect=1")
	this.Modify("f_est_res.protect=0")
	//LSH INI 08/09/2013 evolutivo DEO12-00000263
	this.Modify("f_elim_peligro.protect=0")
	//LSH FIN 08/09/2013 evolutivo DEO12-00000263
	this.Modify("h_est_res.protect=0")
	this.Modify("desc.protect=0")
	this.Modify("brigada.protect=1")
//	this.Modify("causa.protect=1")
	iw_contenedora.tab_1.tabpage_formulario.st_1.visible = false
	this.Modify("fec_causa.protect=1")
	this.Modify("fec_causa.background.color="+gs_gris)

	this.Modify("material_averiado.protect=1")

END IF
IF (ps_accion="Modificacion") THEN
// DSA INI 8/08/2000	
//	gi_perfil_ok = {fgci_perfil_mante_operador_alta,&
//						fgci_perfil_mante_encargado_turno,&
//						fgci_perfil_mante_operador_baja,0}
//	IF (fgnu_tiene_perfil(0)) THEN
//
////		this.dwmodify("fec_causa.protect=1 causa.protect=1 brigada.protect=1 Ind_suministro.protect=1 tipo_incidencia.protect=1 estado_actual.protect=1 tip_tension.protect=1 tip_tension.background.color="+gs_gris+" f_deteccion.protect=1 h_deteccion.protect=1 f_est_res.protect=0 h_est_res.protect=0 desc.protect=0 desc.background.color="+gs_blanco+" causa.background.color="+gs_gris+" fec_causa.background.color="+gs_gris)
//
//		IF this.getitemnumber(1,"estado_actual")>=fgci_incidencia_servicio_repuesto THEN
//			this.Modify("material_averiado.protect=0")
//			this.Modify("material_averiado.background.color="+gs_blanco)
//		END IF
//
//	ELSE
		this.Modify("f_deteccion.protect=1 f_deteccion.background.color="+gs_gris)
		IF this.getitemnumber(1,"estado_actual")>=fgci_incidencia_enviado_brigada THEN
//			this.Modify("causa.protect=0 causa.background.color="+gs_blanco)
			iw_contenedora.tab_1.tabpage_formulario.st_1.visible = true
			this.Modify("fec_causa.protect=0 fec_causa.background.color="+gs_blanco)
		END IF
		
		// Agregado por AFS 
		IF this.getitemnumber(1,"estado_actual") <= fgci_incidencia_servicio_repuesto AND &
				this.getitemnumber(1,"estado_actual") >= fgci_incidencia_causa_localizada THEN
			this.Modify("material_averiado.protect=0")
			this.Modify("material_averiado.background.color="+gs_blanco)
		END IF
		// Fin de agregado

//	END IF
// DSA INI 8/08/2000
END IF
IF ps_Accion = "Consulta" THEN	
		//NCA-INICIO.DDAG-1783.20150305.			 
		  this.Modify("cod_accion_inc.protect=1 cod_accion_inc.background.color="+gs_gris)	
		//NCA-FIN.DDAG-1783.20150305.
		
		//LSH INI 08/09/2013 evolutivo DEO12-00000263
		//this.Modify("tip_tension.protect=1 f_deteccion.protect=1 f_deteccion.background.color="+gs_gris+" f_est_res.protect=1 f_est_res.background.color="+gs_gris+" desc.protect=1 desc.background.color="+gs_gris)
		this.Modify("tip_tension.protect=1 f_deteccion.protect=1 f_deteccion.background.color="+gs_gris+" f_est_res.protect=1 f_est_res.background.color="+gs_gris+" f_elim_peligro.protect=1 f_f_elim_peligro.background.color="+gs_gris+" desc.protect=1 desc.background.color="+gs_gris)
		//LSH FIN 08/09/2013 evolutivo DEO12-00000263
		Yield()
END IF
//Si Selecciona una OT
IF (ps_accion)="Mantenimiento" THEN
		this.Modify("tip_tension.protect=1")
		this.Modify("f_deteccion.protect=1")
		this.Modify("f_est_res.protect=1")
		this.Modify("f_est_res.background.color="+gs_gris)
		//LSH INI 08/09/2013 evolutivo DEO12-00000263
		this.Modify("f_elim_peligro.protect=1")
		this.Modify("f_elim_peligro.background.color="+gs_gris)
		//LSH FIN 08/09/2013 evolutivo DEO12-00000263
		this.Modify("desc.protect=1")
		this.Modify("desc.background.color="+gs_gris)
		Yield()
END IF
IF (ps_accion="Asignada") THEN
//	this.Modify("causa.protect=0")
	iw_contenedora.tab_1.tabpage_formulario.st_1.visible = true
	this.Modify("material_averiado.protect=0")	
END IF
this.accepttext()
return 1
end function

public function u_generico_comunicaciones fpr_devolver_fyh_deteccion ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_ovtener_fyh_deteccion
// 
// Objetivo:Obtiene la fecha y la hora de deteccion de la datawindow 
//           
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada: --
//	Salida:  UserObject con al estructura que retorna en DetVal1 la fecha
//				y en datval2 la hora
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	12/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
u_generico_comunicaciones lu_estructura

lu_estructura=CREATE u_generico_comunicaciones

DATETIME AUX1,AUX2
AUX1= this.GetItemdatetime(1,"F_deteccion")
lu_estructura.is_comunic.datval1 =AUX1
AUX2=this.GetItemdatetime(1,"H_deteccion")
lu_estructura.is_comunic.datval2 = AUX2

Return (lu_estructura)
end function

public function integer fpr_deshabilitar ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_deshabilitar
//
// Objetivo:
//         Deshabilita campos
//
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: --
//        Salida: --
// 
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////// 

long ll_color_gris,ll_color_azul

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//ll_color_gris=(65536*192+256*192+192)
ll_color_gris= long(gs_gris)
// Fin. Sgo.
ll_color_azul=(65536*128)

This.Modify("tipo_instalacion.Background.Color=" + string(ll_color_gris))
This.Modify("tipo_instalacion.Color=" + string(ll_color_azul))
This.Modify("nombre_ins.Background.Color=" + string(ll_color_gris))
This.Modify("nombre_ins.Text.Color=" + string(ll_color_azul))
This.Modify("dir_instalacion.Background.Color=" + string(ll_color_gris))
This.Modify("dir_instalacion.Color=" + string(ll_color_azul))
This.Modify("nro_incidencia.Background.Color=" + string(ll_color_gris))
This.Modify("nro_incidencia.Color=" + string(ll_color_azul))
This.Modify("ot.Background.Color=" + string(ll_color_gris))
This.Modify("ot.Text.Color=" + string(ll_color_azul))
This.Modify("estado_actual.Background.Color=" + string(ll_color_gris))
This.Modify("estado_actual.Color=" + string(ll_color_azul))
This.Modify("tip_tension.Background.Color=" + string(ll_color_gris))
This.Modify("tip_tension.Color=" + string(ll_color_azul))
This.Modify("f_deteccion.Background.Color=" + string(ll_color_gris))
This.Modify("f_deteccion.Color=" + string(ll_color_azul))
This.Modify("h_deteccion.Background.Color=" + string(ll_color_gris))
This.Modify("h_deteccion.Color=" + string(ll_color_azul))
This.Modify("f_est_res.Background.Color=" + string(ll_color_gris))
This.Modify("f_est_res.Color=" + string(ll_color_azul))
//LSH INI 08/09/2013 evolutivo DEO12-00000263
This.Modify("f_elim_peligro.Background.Color=" + string(ll_color_gris))
This.Modify("f_elim_peligro.Color=" + string(ll_color_azul))
//LSH FIN 08/09/2013 evolutivo DEO12-00000263
This.Modify("h_est_res.Background.Color=" + string(ll_color_gris))
This.Modify("h_est_res.Color=" + string(ll_color_azul))
This.Modify("desc.Background.Color=" + string(ll_color_gris))
This.Modify("desc.Color=" + string(ll_color_azul))
This.Modify("brigada.Background.Color=" + string(ll_color_gris))
This.Modify("brigada.Color=" + string(ll_color_azul))
This.Modify("causa.Background.Color=" + string(ll_color_gris))
This.Modify("causa.Color=" + string(ll_color_azul))
This.Modify("material_averiado.Background.Color=" + string(ll_color_gris))
This.Modify("material_averiado.Color=" + string(ll_color_azul))

This.Enabled = False

RETURN 1
end function

public function integer fpr_devolver_estado_actual ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_devolver_estado_actual
// 
// Objetivo: Retorna el estado de la incidencia
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


Return this.GetItemDecimal(1,"Estado_actual")
end function

public function boolean fpr_devolver_resuelve_mantenimiento ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_devuelve_mantenimiento
// 
// Objetivo: Retorna si la incidencia debe ser resuelta por mantenimiento
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:  True si resuelve mantenimiento
//				False si resuelve operaciones    
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF This.GetItemDecimal(1,"resuelve_mant")=1 THEN
	gi_resuelve_mant=fgci_resuelve_mantenimiento
	Return TRUE
ELSE
	gi_resuelve_mant=0
	Return FALSE
END IF
end function

event constructor;call super::constructor;gu_control_v_incidencias.of_recupera_padre(iw_contenedora,this,"w_2301_form_incidencia")
end event

on u_inc_2003_pr_form_inf_general.create
call super::create
end on

on u_inc_2003_pr_form_inf_general.destroy
call super::destroy
end on


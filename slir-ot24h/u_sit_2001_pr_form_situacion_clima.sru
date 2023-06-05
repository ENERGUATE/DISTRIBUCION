HA$PBExportHeader$u_sit_2001_pr_form_situacion_clima.sru
forward
global type u_sit_2001_pr_form_situacion_clima from u_sit_0000_generico_situacion_clima
end type
end forward

global type u_sit_2001_pr_form_situacion_clima from u_sit_0000_generico_situacion_clima
integer width = 2784
integer height = 788
string dataobject = "d_sit_2001_pr_form_situacion_clima"
end type
global u_sit_2001_pr_form_situacion_clima u_sit_2001_pr_form_situacion_clima

forward prototypes
public function integer fpr_cambio_color ()
public function integer fpr_habilitar_campos ()
end prototypes

public function integer fpr_cambio_color ();////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_cambio_color
// 
// Objetivo: Cambia el color del texto y de los fondos de los textos de la datawindow
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_color_gris,ll_color_azul,ll_color_bordeaux

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ll_color_gris=(65536*192+256*192+192)
	ll_color_gris= long(gs_gris)
// Fin. Sgo.
	ll_color_azul=(65536*128)
	ll_color_bordeaux=(128)

//Color del Fondo
	this.Modify("nro_cmd.Background.Color=" + string(ll_color_gris))
	this.Modify("fecha.Background.Color=" + string(ll_color_gris))
	this.Modify("hora.Background.Color=" + string(ll_color_gris))
	this.Modify("temp_max.Background.Color=" + string(ll_color_gris))
	this.Modify("temp_min.Background.Color=" + string(ll_color_gris))
	this.Modify("humedad.Background.Color=" + string(ll_color_gris))
	this.Modify("est_clima.Background.Color=" + string(ll_color_gris))
	this.Modify("viento_dir.Background.Color=" + string(ll_color_gris))
	this.Modify("viento_vel.Background.Color=" + string(ll_color_gris))
	this.Modify("observacion.Background.Color=" + string(ll_color_gris))



//Color del Texto
	this.Modify("nro_cmd.Color=" + string(ll_color_azul))
	this.Modify("fecha.Color=" + string(ll_color_azul))
	this.Modify("hora.Color=" + string(ll_color_azul))
	this.Modify("temp_max.Color=" + string(ll_color_azul))
	this.Modify("temp_min.Color=" + string(ll_color_azul))
	this.Modify("humedad.Color=" + string(ll_color_azul))
	this.Modify("est_clima.Color=" + string(ll_color_azul))
	this.Modify("viento_dir.Color=" + string(ll_color_azul))
	this.Modify("viento_vel.Color=" + string(ll_color_azul))
	this.Modify("observacion.Color=" + string(ll_color_azul))

Return 1
end function

public function integer fpr_habilitar_campos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_habilitar_campos
// 
// Objetivo: Habilita o deshabilita los campos de la data window 
//          
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	6/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

	this.Modify("nro_cmd.protect=1")
	this.Modify("fecha.protect=1")
	this.Modify("hora.protect=1")
	this.Modify("temp_max.protect=1")
	this.Modify("humedad.protect=1")
	this.Modify("est_clima.protect=1")
	this.Modify("viento_dir.protect=1")
	this.Modify("viento_vel.protect=1")
	this.Modify("observacion.protect=1")

Return 1
end function

event constructor;//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("nro_cmd_t.Text = '" + fg_cor_dw("CMD:", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on u_sit_2001_pr_form_situacion_clima.create
call super::create
end on

on u_sit_2001_pr_form_situacion_clima.destroy
call super::destroy
end on

event destructor;//
end event


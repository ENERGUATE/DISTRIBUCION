HA$PBExportHeader$u_sit_2001_nu_form_situacion_clima.sru
forward
global type u_sit_2001_nu_form_situacion_clima from nonvisualobject
end type
end forward

global type u_sit_2001_nu_form_situacion_clima from nonvisualobject
end type
global u_sit_2001_nu_form_situacion_clima u_sit_2001_nu_form_situacion_clima

forward prototypes
public function integer fnu_obtener_datos_clima (ref u_generico_comunicaciones pu_estructura)
public function long fnu_obtener_datos (datawindow pd_dw, integer pi_cmd, datetime pd_fecha)
public function integer fnu_bloquear_registro (integer pi_cmd, datetime pdt_fecha)
end prototypes

public function integer fnu_obtener_datos_clima (ref u_generico_comunicaciones pu_estructura);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos_clima
// 
// Objetivo: Obtiene los datos referentes a el clima en un cmd para una fecha y hora dada
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: estructura conteniendo:
//													intval1=cmd
//													datval1=fecha
//													datval2=hora
//			Salida:  la misma estructura conteniendo:
//												intval2=temp_max
//												intval3=temp_min
//												intval4=Humedad
//												intval5=Viento_vel
//												strval1=est_clima
//												strval2=viento_dir
//												strval3=observacion
//						
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	8/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////



int li_cmd,li_temp_max,li_temp_min,li_humedad,li_viento_vel
string ls_est_clima,ls_viento_dir,ls_observacion
datetime ld_fecha,ld_hora

//Obtencion de la de el numero de puerta , duplicador y nombre de la calle

li_cmd=pu_estructura.is_comunic.intval1
ld_fecha=pu_estructura.is_comunic.datval1
ld_hora=pu_estructura.is_comunic.datval1


SELECT temp_max,temp_min,humedad,descripcion,
		 viento_vel,viento_dir,observacion 
	INTO :li_temp_max,:li_temp_min,:li_humedad,
		  :ls_est_clima,:ls_viento_dir,:li_viento_vel,:ls_observacion
	FROM Sit_clima ,t_est_clima
	WHERE nro_cmd = :li_cmd AND fecha=:ld_fecha AND hora=:ld_hora 
			AND Sit_clima.cod_est_clima=t_est_clima.cod_est_clima;

pu_estructura.is_comunic.intval1=li_cmd
pu_estructura.is_comunic.datval1=ld_fecha
pu_estructura.is_comunic.datval1=ld_hora
pu_estructura.is_comunic.intval2=li_temp_max
pu_estructura.is_comunic.intval3=li_temp_min
pu_estructura.is_comunic.intval4=li_humedad
pu_estructura.is_comunic.strval1=ls_est_clima
pu_estructura.is_comunic.strval2=ls_viento_dir
pu_estructura.is_comunic.intval5=li_viento_vel
pu_estructura.is_comunic.strval3=ls_observacion

//Return (pu_estructura)
return 1
end function

public function long fnu_obtener_datos (datawindow pd_dw, integer pi_cmd, datetime pd_fecha);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_datos
// 
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos y retrieve de la datawindow.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: DataWindow
//				intval1=cmd
//				datval1=fechahora
//		Salida:  --
//						
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	12/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

//pd_dw.SetTransObject(SQLCA)

Return pd_dw.retrieve(pi_cmd,pd_fecha)

end function

public function integer fnu_bloquear_registro (integer pi_cmd, datetime pdt_fecha);int in_cmd

SELECT NRO_CMD INTO :in_cmd FROM GI_SIT_CLIMA  WHERE NRO_CMD=:pi_cmd  AND FECHA=:pdt_fecha	 FOR UPDATE NOWAIT;
IF SQLCA.SQLCODE=-1 THEN
	gnv_msg.f_mensaje("EM23","","",OK!) 
	Return 0
END IF

Return 1
end function

on u_sit_2001_nu_form_situacion_clima.create
TriggerEvent( this, "constructor" )
end on

on u_sit_2001_nu_form_situacion_clima.destroy
TriggerEvent( this, "destructor" )
end on


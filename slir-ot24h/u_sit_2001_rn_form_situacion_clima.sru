HA$PBExportHeader$u_sit_2001_rn_form_situacion_clima.sru
forward
global type u_sit_2001_rn_form_situacion_clima from nonvisualobject
end type
end forward

global type u_sit_2001_rn_form_situacion_clima from nonvisualobject
end type
global u_sit_2001_rn_form_situacion_clima u_sit_2001_rn_form_situacion_clima

forward prototypes
public function integer frn_ini_campos_por_defecto (ref datawindow pw_dw, datetime pd_fecha, datetime pd_hora, integer pi_cmd)
public function integer frn_color (boolean pb_color, ref datawindow pd_dw)
public function integer frn_habilitar_campos (boolean pb_accion, ref datawindow pd_dw)
public function integer frn_habilitar_campos_alta (boolean pb_accion, ref datawindow pd_dw)
public function string frn_validar (ref datawindow pd_dw, string ps_columna)
end prototypes

public function integer frn_ini_campos_por_defecto (ref datawindow pw_dw, datetime pd_fecha, datetime pd_hora, integer pi_cmd);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_ini_campos_por_defecto
// 
// Objetivo: Pone en valores predefinidos dependiendo sea alta o de  
//				 que ventana es llamada.
//	
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  d_inf_general (DataWindow)
//					 objeto de comunicaciones con la estructura de trabajo de la ventana
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	21/1/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

u_generico_comunicaciones lu_datos_clima

								//CREACION USER OBJECT DE NUCLEO PARA SIT. CLIMATOLOGICA
//iu_sit_1002_nu_gen = CREATE u_ins_1002_nu_generico		



	pw_dw.SetItem(1,"nro_cmd",pi_cmd)	//cmd para el cual se registro el estado del clima
	lu_datos_clima.is_comunic.longval1=pi_cmd				

	pw_dw.SetItem(1,"fecha",pd_fecha)		//fecha para la cual se registro el estado del clima
	lu_datos_clima.is_comunic.datval1 = pd_fecha

	pw_dw.SetItem(1,"hora",pd_hora) 	  //hora para la cual se registro el estado del clima
	lu_datos_clima.is_comunic.datval2=pd_hora

											//obtencion de los datos del clima para los tres datos anteriores									
	//iu_ins_1002_nu_gen.fnu_obtener_sit_clima(pi_cmd,pd_fecha,pd_hora)		
			
	pw_dw.SetItem(1,"temp_max",lu_datos_clima.is_comunic.intval2)  //dir instalacion
	pw_dw.SetItem(1,"temp_min",lu_datos_clima.is_comunic.intval3)//tipo de instalacion

	pw_dw.SetItem(1,"humedad",lu_datos_clima.is_comunic.intval4)     //tipo de tension

	pw_dw.SetItem(1,"est_clima",lu_datos_clima.is_comunic.strval1)  			//estado_pendiente
		
	pw_dw.SetItem(1,"viento_dir",lu_datos_clima.is_comunic.strval2)	// fecha del primer aviso
   	
	pw_dw.SetItem(1,"viento_vel",lu_datos_clima.is_comunic.intval5)	// hora del primer aviso

	pw_dw.SetItem(1,"observacion",lu_datos_clima.is_comunic.strval3)		//f_resolucion = sistema

									//DESTRUCCION DEL OBJETOS
//DESTROY iu_ins_1002_nu_gen
//
		
Return 1
end function

public function integer frn_color (boolean pb_color, ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_color
// 
// Objetivo: Cambia el color de los campos
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pb_color, pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF pb_color= True THEN
	pd_dw.Modify("Nro_Cmd.Color="+STRING(65536*128))	//azul
	pd_dw.Modify("Fecha.Color="+STRING(65536*128))	//azul
	pd_dw.Modify("temp_max.Color="+STRING(65536*128))	//azul
	pd_dw.Modify("temp_min.Color="+STRING(65536*128))	//azul
	pd_dw.Modify("humedad.Color="+STRING(65536*128))	//azul
	pd_dw.Modify("est_clima.Color="+STRING(65536*128))	//azul
	pd_dw.Modify("viento_dir.Color="+STRING(65536*128))	//azul
	pd_dw.Modify("viento_vel.Color="+STRING(65536*128))   //azul
	pd_dw.Modify("observacion.Color="+STRING(65536*128))	//azul

ELSE 
	pd_dw.Modify("nro_cmd.background.Color="+STRING(0))
	pd_dw.Modify("Fecha.background.Color="+STRING(0))	//GRIS
	pd_dw.Modify("temp_max.background.Color="+STRING(0))	
	pd_dw.Modify("temp_min.background.Color="+STRING(0))	
	pd_dw.Modify("humedad.background.Color="+STRING(0))	
	pd_dw.Modify("est_clima.background.Color="+STRING(0))	
	pd_dw.Modify("viento_dir.background.Color="+STRING(0))	
	pd_dw.Modify("viento_vel.background.Color="+STRING(0))
	pd_dw.Modify("observacion.background.Color="+STRING(0))
END IF
Return 1
end function

public function integer frn_habilitar_campos (boolean pb_accion, ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_habilitar_campos
//
// Objetivo: Habilitar o Deshabilitar seg$$HEX1$$fa00$$ENDHEX$$n la acci$$HEX1$$f300$$ENDHEX$$n llamada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pb_accion, pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF pb_accion=True THEN
	pd_dw.Modify("Fecha.Protect=1")
	pd_dw.Modify("Fecha.BackGround.Color="+gs_gris) 
	IF gi_nro_cmd <> fgci_todos THEN
		pd_dw.Modify("nro_cmd.Protect=1")
		pd_dw.Modify("nro_cmd.BackGround.Color="+gs_gris)
	END IF
	
	pd_dw.Modify("temp_max.Protect=0")
	pd_dw.Modify("temp_min.Protect=0")
	pd_dw.Modify("humedad.Protect=0")
	pd_dw.Modify("est_clima.Protect=0")
	pd_dw.Modify("viento_dir.Protect=0")
	pd_dw.Modify("viento_vel.Protect=0")
	pd_dw.Modify("observacion.Protect=0")
	
	
ELSE
	pd_dw.Modify("Fecha.Protect=1")
	pd_dw.Modify("nro_cmd.Protect=1")
	pd_dw.Modify("temp_max.Protect=1")
	pd_dw.Modify("temp_min.Protect=1")
	pd_dw.Modify("humedad.Protect=1")
	pd_dw.Modify("est_clima.Protect=1")
	pd_dw.Modify("viento_vel.Protect=1")
	pd_dw.Modify("viento_dir.Protect=1")
	pd_dw.Modify("observacion.Protect=1")

	pd_dw.Modify("Fecha.BackGround.Color="+gs_gris) 
	pd_dw.Modify("nro_cmd.BackGround.Color="+gs_gris)
	pd_dw.Modify("temp_max.BackGround.Color="+gs_gris)
	pd_dw.Modify("temp_min.BackGround.Color="+gs_gris)
	pd_dw.Modify("humedad.BackGround.Color="+gs_gris)
	pd_dw.Modify("est_clima.BackGround.Color="+gs_gris)
	pd_dw.Modify("viento_vel.BackGround.Color="+gs_gris)
	pd_dw.Modify("viento_dir.BackGround.Color="+gs_gris)
	pd_dw.Modify("observacion.BackGround.Color="+gs_gris)

   
END IF

Return 1

end function

public function integer frn_habilitar_campos_alta (boolean pb_accion, ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: frn_habilitar_campos_alta
//
// Objetivo: Habilita o Deshabilita campos seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pb_accion, pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF pb_accion=True THEN
	pd_dw.Modify("Fecha.Protect=0")
	IF gi_nro_cmd <> fgci_todos THEN
		pd_dw.Modify("nro_cmd.Protect=1")
		pd_dw.Modify("nro_cmd.BackGround.Color="+gs_gris)
	END IF
	
	pd_dw.Modify("temp_max.Protect=0")
	pd_dw.Modify("temp_min.Protect=0")
	pd_dw.Modify("humedad.Protect=0")
	pd_dw.Modify("est_clima.Protect=0")
	pd_dw.Modify("viento_dir.Protect=0")
	pd_dw.Modify("viento_vel.Protect=0")
	pd_dw.Modify("observacion.Protect=0")
ELSE
	pd_dw.Modify("Fecha.Protect=1")
	pd_dw.Modify("nro_cmd.Protect=1")
	pd_dw.Modify("temp_max.Protect=1")
	pd_dw.Modify("temp_min.Protect=1")
	pd_dw.Modify("humedad.Protect=1")
	pd_dw.Modify("est_clima.Protect=1")
	pd_dw.Modify("viento_vel.Protect=1")
	pd_dw.Modify("viento_dir.Protect=1")
	pd_dw.Modify("observacion.Protect=1")

	pd_dw.Modify("Fecha.BackGround.Color="+gs_gris) 
	pd_dw.Modify("nro_cmd.BackGround.Color="+gs_gris)
	pd_dw.Modify("temp_max.BackGround.Color="+gs_gris)
	pd_dw.Modify("temp_min.BackGround.Color="+gs_gris)
	pd_dw.Modify("humedad.BackGround.Color="+gs_gris)
	pd_dw.Modify("est_clima.BackGround.Color="+gs_gris)
	pd_dw.Modify("viento_vel.BackGround.Color="+gs_gris)
	pd_dw.Modify("viento_dir.BackGround.Color="+gs_gris)
	pd_dw.Modify("observacion.BackGround.Color="+gs_gris)

END IF

Return 1

end function

public function string frn_validar (ref datawindow pd_dw, string ps_columna);
string ls_valor, ls_modstring
int li_temp_max, li_nulo
SetNull (li_nulo)

CHOOSE CASE ps_columna
	CASE "temp_max"
		ls_valor = pd_dw.GetText()
		IF ls_valor ="" THEN
			Return ls_modstring
		ELSE
			IF NOT IsNumber(ls_valor) THEN
//				pd_dw.SetItem(1,"temp_max", li_nulo)
				ls_modstring = "La Temperatura no es correcta"
			END IF
		END IF

	CASE "temp_min"
		ls_valor = pd_dw.GetText()
		li_temp_max = pd_dw.GetItemNumber(1,"temp_max")
		IF ls_valor = "" THEN
			RETURN ls_modstring
		ELSE
			IF NOT IsNumber(ls_valor) THEN
//				pd_dw.SetItem(1,"temp_min", li_nulo)
				ls_modstring = "La Temperatura no es correcta"
			END IF
			IF Integer(ls_valor) > li_temp_max THEN
//				pd_dw.SetItem(1,"temp_max", li_nulo)
//				pd_dw.SetItem(1,"temp_min", li_nulo)
				ls_modstring = "La Temperatura m$$HEX1$$e100$$ENDHEX$$xima es menor que la Temperatura m$$HEX1$$ed00$$ENDHEX$$nima"
			END IF
		END IF

	CASE "humedad"
		ls_valor = pd_dw.GetText()
		IF ls_valor = "" THEN
			RETURN ls_modstring
		ELSE
			IF NOT IsNumber(ls_valor) THEN
//				pd_dw.SetItem(1,"humedad", li_nulo)
				ls_modstring = "La Humedad no es correcta"
			ELSEIF INTEGER (ls_valor) < 0 OR INTEGER(ls_valor) > 100 THEN
				ls_modstring = "El porcentaje de Humedad no puede ser menor que cero ni mayor que 100"
//				pd_dw.SetItem(1,"humedad", li_nulo)
			END IF
		END IF

	CASE "viento_vel"
		ls_valor = pd_dw.GetText()
		IF ls_valor = "" THEN
			RETURN ls_modstring
		ELSE
			IF NOT IsNumber(ls_valor) OR (IsNumber(ls_valor) AND INTEGER(ls_valor) < 0) THEN
				ls_modstring = "La Velocidad del Viento no es correcta"
			END IF
		END IF

END CHOOSE

Return ls_modstring
end function

on u_sit_2001_rn_form_situacion_clima.create
TriggerEvent( this, "constructor" )
end on

on u_sit_2001_rn_form_situacion_clima.destroy
TriggerEvent( this, "destructor" )
end on


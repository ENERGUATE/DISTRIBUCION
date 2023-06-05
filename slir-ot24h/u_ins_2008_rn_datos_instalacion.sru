HA$PBExportHeader$u_ins_2008_rn_datos_instalacion.sru
forward
global type u_ins_2008_rn_datos_instalacion from nonvisualobject
end type
end forward

global type u_ins_2008_rn_datos_instalacion from nonvisualobject
end type
global u_ins_2008_rn_datos_instalacion u_ins_2008_rn_datos_instalacion

forward prototypes
public function integer frn_v_tension (integer pi_tipo_inst)
public function string frn_v_instalacion (ref datawindow pdw_instal, integer pi_tipo, string ps_accion)
end prototypes

public function integer frn_v_tension (integer pi_tipo_inst);IF pi_tipo_inst <= fgci_tipo_subestacion THEN
	RETURN fgci_media_tension
ELSE
	RETURN fgci_baja_tension
END IF
end function

public function string frn_v_instalacion (ref datawindow pdw_instal, integer pi_tipo, string ps_accion);string ls_valor, ls_modstring

// Esta funcion se modifico para que compruebe todos los campos de la 
// datawindow y no solo el campo que tiene el foco, excepto el campo 
// potencia instalada que se verifica solo si tiene el foco 
// debido a que solo se puede modificar este campo si se trata
// de un transformador.
// AFS


//CHOOSE CASE pdw_instal.GetColumnName()
//	CASE "nom_instalacion"

		decimal{0} ldec_nro_inst

		IF pi_tipo = 1 THEN
			ls_valor = pdw_instal.GetText()
		ELSE
			ls_valor = pdw_instal.GetITemString(1,"nom_instalacion")
		END IF

		IF IsNull(ls_valor) OR Len(LeftTrim(RightTrim(ls_valor))) = 0 THEN

			ls_modstring = "El nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n no puede ser nulo."
			pdw_instal.SetColumn("nom_instalacion")
		END IF

		IF ps_accion = "Alta" THEN

			SELECT nro_instalacion 
			INTO :ldec_nro_inst
			FROM instalacion
			WHERE nom_instalacion = :ls_valor;
	
			IF Sqlca.SqlCode = 0 THEN
	
				ls_modstring = "Ya existe una instalaci$$HEX1$$f300$$ENDHEX$$n con ese nombre ."							
				pdw_instal.SetColumn("nom_instalacion")
			END IF
		END IF

//	CASE "pot_instalada"
// Modificado por AFS 

IF pdw_instal.GetColumnName() = "pot_instalada" THEN // Ale
		IF pi_tipo = 1 THEN
			ls_valor = pdw_instal.GetText()
		ELSE
			ls_valor = String(pdw_instal.GetITemNumber(1,"pot_instalada"))
		END IF

		IF IsNull(ls_valor) OR Len(LeftTrim(RightTrim(ls_valor))) = 0 THEN

			ls_modstring = "La potencia instalada en el transformador no puede ser nula."
			pdw_instal.SetItem(1,"pot_instalada",0)
			pdw_instal.SetColumn("pot_instalada")
		ELSEIF Integer(ls_valor) < 0 OR NOT IsNumber(ls_valor) THEN

			ls_modstring = "La potencia instalada debe ser un n$$HEX1$$fa00$$ENDHEX$$mero mayor o igual a cero"
			pdw_instal.SetItem(1,"pot_instalada",0)
			pdw_instal.SetColumn("pot_instalada")
		END IF
END IF //Ale
//	CASE "descripcion"

		IF pi_tipo = 1 THEN
			ls_valor = pdw_instal.GetText()
		ELSE
			ls_valor = pdw_instal.GetITemString(1,"descripcion")
		END IF

		IF IsNull(ls_valor) OR Len(LeftTrim(RightTrim(ls_valor))) = 0 THEN

			ls_modstring = "La descripci$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n no puede ser nula."
			pdw_instal.SetColumn("descripcion")
		END IF

//END CHOOSE


RETURN ls_modstring


end function

on u_ins_2008_rn_datos_instalacion.create
TriggerEvent( this, "constructor" )
end on

on u_ins_2008_rn_datos_instalacion.destroy
TriggerEvent( this, "destructor" )
end on


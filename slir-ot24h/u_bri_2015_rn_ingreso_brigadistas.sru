HA$PBExportHeader$u_bri_2015_rn_ingreso_brigadistas.sru
forward
global type u_bri_2015_rn_ingreso_brigadistas from nonvisualobject
end type
end forward

global type u_bri_2015_rn_ingreso_brigadistas from nonvisualobject
end type
global u_bri_2015_rn_ingreso_brigadistas u_bri_2015_rn_ingreso_brigadistas

forward prototypes
public function string frn_valido (ref datawindow pd_dw)
public function string frn_validar_brigadista (ref datawindow pd_dw, string ps_string, integer li_tipo)
end prototypes

public function string frn_valido (ref datawindow pd_dw);string  ls_valor, ls_modstring

ls_valor = pd_dw.GetText()
ls_modstring = ""

CHOOSE CASE pd_dw.GetColumnName()
	CASE "nombre"
		IF IsNull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 THEN
			ls_modstring = "Debe introducir un nombre v$$HEX1$$e100$$ENDHEX$$lido"
//			gnv_msg.f_mensaje("EM03","","",OK!)
//			pd_dw.SetColumn("nombre")
//			pd_dw.setfocus()
		END IF
	CASE "ape1"
		IF isnull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 THEN
			ls_modstring = "Debe introducir un apellido v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
	CASE "ape2"
		IF isnull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 THEN
			ls_modstring = "Debe introducir un apellido v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
	CASE "nro_contrata"
		IF isnull(ls_valor) OR &
				Integer(ls_valor) = 0  OR &
				NOT IsNumber(ls_valor) THEN
			ls_modstring = "Debe introducir un n$$HEX1$$fa00$$ENDHEX$$mero de contrato v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
	CASE "doc_id"	
		IF isnull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 THEN
			ls_modstring = "Debe introducir un documento de identidad v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
END CHOOSE

RETURN ls_modstring 
end function

public function string frn_validar_brigadista (ref datawindow pd_dw, string ps_string, integer li_tipo);string  ls_valor, ls_modstring, ls_nulo
SetNull(ls_nulo)

ls_modstring = ""

IF li_tipo = 1 THEN

	CHOOSE CASE ps_string
		CASE "nombre"
			ls_valor = pd_dw.GetText()
			IF isnull(ls_valor) OR  ls_valor = "" OR ISNUMBER(ls_valor) THEN
				ls_modstring = "Debe introducir un nombre v$$HEX1$$e100$$ENDHEX$$lido"
			END IF

		CASE "ape1"
			ls_valor = pd_dw.GetText()
			IF isnull(ls_valor) OR  ls_valor = "" OR ISNUMBER(ls_valor) THEN
				ls_modstring = "Debe introducir un apellido v$$HEX1$$e100$$ENDHEX$$lido"
			END IF

		CASE "ape2"
			ls_valor = pd_dw.GetText()
			IF isnull(ls_valor) OR  ls_valor = "" OR ISNUMBER(ls_valor) THEN
				ls_modstring = "Debe introducir un segundo apellido v$$HEX1$$e100$$ENDHEX$$lido"
			END IF
//			pd_dw.SetItem(1, "ape2", " ")
//			ls_valor = " "

		CASE "doc_id"
			ls_valor = pd_dw.GetText()
			IF isnull(ls_valor) OR  ls_valor = "" THEN
				ls_modstring = "Debe introducir un documento de identidad v$$HEX1$$e100$$ENDHEX$$lido"
			END IF

	END CHOOSE

END IF

IF li_tipo = 2 THEN
		IF ISNULL(pd_dw.GetItemString(1,"nombre")) THEN
		SETNULL(ls_valor)
	ELSE
		ls_valor=pd_dw.GetItemString(1,"nombre")
	END IF
	IF isnull(ls_valor) OR  ls_valor = "" OR ISNUMBER(ls_valor)THEN
		ls_modstring = "Debe introducir un nombre v$$HEX1$$e100$$ENDHEX$$lido"
		pd_dw.SetColumn("nombre")
		RETURN ls_modstring
	END IF


	IF ISNULL(pd_dw.GetItemString(1,"ape1")) THEN
		SETNULL(ls_valor)
	ELSE
		ls_valor=pd_dw.GetItemString(1,"ape1")
	END IF
	IF isnull(ls_valor) OR  ls_valor = "" OR ISNUMBER(ls_valor) THEN
		ls_modstring = "Debe introducir un apellido v$$HEX1$$e100$$ENDHEX$$lido"
		pd_dw.SetColumn("ape1")
		RETURN ls_modstring
	END IF


	IF ISNULL(pd_dw.GetItemString(1,"ape2")) THEN
		SETNULL(ls_valor)
	ELSE
		ls_valor=pd_dw.GetItemString(1,"ape2")
	END IF
	IF isnull(ls_valor) OR  ls_valor = "" OR ISNUMBER(ls_valor) THEN
		ls_modstring = "Debe introducir un segundo apellido v$$HEX1$$e100$$ENDHEX$$lido"
		pd_dw.SetColumn("ape2")
		RETURN ls_modstring
	END IF

	IF ISNULL(pd_dw.GetItemString(1,"doc_id")) THEN
		SETNULL(ls_valor)
	ELSE
		ls_valor=pd_dw.GetItemString(1,"doc_id")
	END IF
	IF isnull(ls_valor) OR  ls_valor = "" THEN
		ls_modstring = "Debe introducir un documento de identidad v$$HEX1$$e100$$ENDHEX$$lido"
		pd_dw.SetColumn("doc_id")
		RETURN ls_modstring
	END IF

END IF

RETURN ls_modstring



end function

on u_bri_2015_rn_ingreso_brigadistas.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2015_rn_ingreso_brigadistas.destroy
TriggerEvent( this, "destructor" )
end on


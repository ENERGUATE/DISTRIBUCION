HA$PBExportHeader$u_ins_2014_rn_lista_mante_trafos.sru
forward
global type u_ins_2014_rn_lista_mante_trafos from nonvisualobject
end type
end forward

global type u_ins_2014_rn_lista_mante_trafos from nonvisualobject
end type
global u_ins_2014_rn_lista_mante_trafos u_ins_2014_rn_lista_mante_trafos

forward prototypes
public function string frn_validar (ref datawindow pd_dw, integer pi_tipo, integer pi_fila)
end prototypes

public function string frn_validar (ref datawindow pd_dw, integer pi_tipo, integer pi_fila);string  ls_valor, ls_modstring, ls_columna
int li_columna, li_ultimo, li_cont, li_inicio

SetNull(ls_modstring)

IF pi_tipo = 3 THEN
	li_ultimo = pd_dw.RowCount()
	li_inicio = 1
ELSE
	li_ultimo = pi_fila
	li_inicio = pi_fila
END IF	

//IF pi_tipo = 2 THEN
FOR li_cont=li_inicio TO li_ultimo
	
	ls_valor=String(pd_dw.GetItemNumber(li_cont,"nro_transformador"))
	IF isnull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 OR ls_valor = "0" THEN
		pd_dw.setcolumn("nro_transformador")
		pd_dw.SetRow(li_cont)
		ls_modstring = "Se debe ingresar un N$$HEX1$$fa00$$ENDHEX$$mero de Transformador v$$HEX1$$e100$$ENDHEX$$lido"
		Return ls_modstring
	END IF

	ls_valor=pd_dw.GetItemString(li_cont,"fabricante")
	IF IsNull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 THEN
		pd_dw.setcolumn("fabricante")
		pd_dw.SetRow(li_cont)
		ls_modstring = "Se debe ingresar un Fabricante"
		Return ls_modstring
	END IF

	ls_valor=pd_dw.GetItemString(li_cont,"tipo")
	IF IsNull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 THEN
		pd_dw.setcolumn("tipo")
		pd_dw.SetRow(li_cont)
		ls_modstring = "Se debe ingresar un Tipo de Transformador"
		Return ls_modstring
	END IF	

	ls_valor=String(pd_dw.GetItemNumber(li_cont,"potencia"))
	IF isnull(ls_valor) OR Len(LeftTrim(Righttrim(ls_valor)))=0 or ls_valor='0' or pd_dw.GetItemNumber(li_cont,"potencia") = 0 THEN
		pd_dw.setcolumn("potencia")
		pd_dw.SetRow(li_cont)
		ls_modstring = "Se debe ingresar una Potencia v$$HEX1$$e100$$ENDHEX$$lida"
		Return ls_modstring
	END IF


NEXT
Return ls_modstring


end function

on u_ins_2014_rn_lista_mante_trafos.create
TriggerEvent( this, "constructor" )
end on

on u_ins_2014_rn_lista_mante_trafos.destroy
TriggerEvent( this, "destructor" )
end on


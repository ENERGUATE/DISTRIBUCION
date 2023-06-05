HA$PBExportHeader$u_periodo_penalizacion.sru
forward
global type u_periodo_penalizacion from u_gen_0000_lista
end type
end forward

global type u_periodo_penalizacion from u_gen_0000_lista
int Width=2693
int Height=528
string DataObject="d_periodo_penalizacion"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type
global u_periodo_penalizacion u_periodo_penalizacion

type variables
Boolean ib_modificado = False
end variables

forward prototypes
public function boolean of_valida_periodos ()
public subroutine of_agregar ()
public subroutine of_eliminar ()
public subroutine of_aceptar ()
end prototypes

public function boolean of_valida_periodos ();Boolean lb_retorno = True
long ll_fila, ll_encontrado
Datetime ldt_f_desde, ldt_f_hasta
String ls_area, ls_campo = ' '

IF This.RowCount() > 0 THEN
	IF ib_modificado THEN
		FOR ll_fila = 1 TO This.Rowcount()
			IF isNull(This.GetItemDatetime(ll_fila, 'f_inicio')) THEN ls_campo = 'Fecha de Inicio'
			IF isNull(This.GetItemDatetime(ll_fila, 'f_fin')) THEN ls_campo = 'Fecha de Fin'
			IF isNull(This.GetItemString(ll_fila, 'tipo_area')) THEN ls_campo = 'Tipo de $$HEX1$$c100$$ENDHEX$$rea'
			IF isNull(This.GetItemNumber(ll_fila, 'saifi_limite')) THEN ls_campo = 'SAIFI L$$HEX1$$ed00$$ENDHEX$$mite'
			IF isNull(This.GetItemDecimal(ll_fila, 'saidi_limite')) THEN ls_campo = 'SAIDI L$$HEX1$$ed00$$ENDHEX$$mite'
			
			IF ls_campo = ' ' THEN
			
				ldt_f_desde = This.GetItemDatetime(ll_fila, 'f_inicio')
				ldt_f_hasta = This.GetItemDatetime(ll_fila, 'f_fin')
				ls_area = This.GetItemstring(ll_fila, 'tipo_area')
				
				IF ldt_f_desde > ldt_f_hasta THEN
					lb_retorno = FALSE
					Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La Fecha de Inicio del periodo debe ser inferior a la Fecha de Fin para el rango (" + string(Date(ldt_f_desde)) + ", " + string(Date(ldt_f_hasta)) + ")" )
					ll_fila = This.RowCount()
				ELSE
					
					IF ll_fila < This.Rowcount() THEN
						ll_encontrado = This.Find("(f_inicio <= Datetime('" + string(ldt_f_desde) +"') and f_fin >= Datetime('" + string(ldt_f_desde) +"') and tipo_area='"+ls_area+"' ) or " + &
														  "(f_inicio >= Datetime('" + string(ldt_f_desde) +"') and f_inicio <= Datetime('" + string(ldt_f_hasta) +"') and tipo_area='"+ls_area+"')" , ll_fila + 1, This.RowCount())
				
					  
						IF ll_encontrado > 0 THEN
							lb_retorno = False
							Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El rango de fechas (" + string(Date(ldt_f_desde)) + "," + string(Date(ldt_f_hasta)) +") se solapa con el rango de fechas " +&
														  " (" + string(Date(This.GetitemDatetime(ll_encontrado, 'f_inicio'))) + "," + string(Date(This.GetitemDatetime(ll_encontrado, 'f_fin'))) + ")")
							ll_fila = This.RowCount()
						END IF
					END IF
				END IF
			ELSE
				lb_retorno = FALSE
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe definir un valor para el campo " + ls_campo)
				ll_fila = This.RowCount()
			END IF
		NEXT
	END IF
END IF		

return lb_retorno

end function

public subroutine of_agregar ();long ll_fila

ll_fila = This.InsertRow(0)

This.SetItem(ll_fila, 'usuario', gs_usuario)
This.SetItem(ll_fila, 'programa', 'w_mante_period')
This.SetItem(ll_fila, 'f_actual', fgnu_fecha_actual())
This.ib_modificado = TRUE
end subroutine

public subroutine of_eliminar ();IF This.GetRow() > 0 THEN
	IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Desea eliminar el periodo de penalizaci$$HEX1$$f300$$ENDHEX$$n seleccionado?", Question!, YesNo!) = 1 THEN
		This.ib_modificado = True
		This.deleterow(This.GetRow())
	END IF
END IF
end subroutine

public subroutine of_aceptar ();IF This.ib_modificado THEN
	IF This.AcceptText() = 1 THEN
		IF This.of_valida_periodos() THEN
			IF This.update() = 1 THEN
				This.ib_modificado = FALSE
				gnu_u_transaction.uf_commit();
			END IF
		END IF
	END IF
END IF
end subroutine

event itemchanged;call super::itemchanged;ib_modificado = TRUE
end event

event constructor;call super::constructor;This.SetTransObject(SQLCA)
This.Retrieve()
end event

event editchanged;call super::editchanged;This.ib_modificado = True
end event


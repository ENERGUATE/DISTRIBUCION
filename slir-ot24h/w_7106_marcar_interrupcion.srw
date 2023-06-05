HA$PBExportHeader$w_7106_marcar_interrupcion.srw
forward
global type w_7106_marcar_interrupcion from w_sgigenerica
end type
type dw_lista from u_gen_0000_lista within w_7106_marcar_interrupcion
end type
type dw_interrupcion from datawindow within w_7106_marcar_interrupcion
end type
type gb_1 from groupbox within w_7106_marcar_interrupcion
end type
end forward

global type w_7106_marcar_interrupcion from w_sgigenerica
integer x = 466
integer y = 688
integer width = 2738
integer height = 1036
string title = "OPEN SGI - Marcar Interrupcion"
windowtype windowtype = response!
long backcolor = 79741120
string icon = "interrup.ico"
dw_lista dw_lista
dw_interrupcion dw_interrupcion
gb_1 gb_1
end type
global w_7106_marcar_interrupcion w_7106_marcar_interrupcion

type variables
datetime idt_inicio
datetime idt_fin
end variables

forward prototypes
public function integer fw_validar_fechas ()
public function integer fw_comprobar_otras_int_desc (long pl_nro_instalacion, datetime pdt_f_ini, datetime pdt_f_fin)
public function integer fw_cargar_interrupciones ()
end prototypes

public function integer fw_validar_fechas ();datetime ldt_f_ini, ldt_f_fin, ldt_ini_desc, ldt_fin_desc

dw_interrupcion.AcceptText()
ldt_f_ini = dw_interrupcion.GetItemDateTime (1,'f_inicio')
ldt_f_fin = dw_interrupcion.GetItemDateTime (1,'f_fin')
ldt_ini_desc = dw_lista.GetItemDateTime (1,'f_inicio')
ldt_fin_desc = dw_lista.GetItemDateTime (1,'f_fin')

IF ldt_f_ini < ldt_ini_desc OR ldt_f_fin > ldt_fin_desc THEN
	messagebox("","mal")
	return -1
ELSE
	return 0
END IF
end function

public function integer fw_comprobar_otras_int_desc (long pl_nro_instalacion, datetime pdt_f_ini, datetime pdt_f_fin);//// VALIDACION DE INTERRUPCIONES

long ll_nro_descargo

ll_nro_descargo = dw_lista.GetItemNumber(1,'nro_descargo')

SELECT SGD_INTERRUPCION_DESCARGO.NRO_DESCARGO
INTO :ll_nro_descargo
FROM SGD_INTERRUPCION_DESCARGO,SGD_DESCARGOS
WHERE COD_INSTALACION = :pl_nro_instalacion
AND ( (F_INICIO <= :pdt_f_ini AND F_FIN > :pdt_f_ini) OR
		 (F_INICIO >= :pdt_f_ini AND F_FIN <= :pdt_f_fin) OR
		( F_INICIO <= :pdt_f_fin AND F_FIN > :pdt_f_fin)) and
	 ESTADO NOT IN (:fgci_descargo_anulado, :fgci_descargo_finalizado, :fgci_descargo_rechazado) AND
	 SGD_DESCARGOS.NRO_DESCARGO = SGD_INTERRUPCION_DESCARGO.NRO_DESCARGO AND 
	 SGD_DESCARGOS.NRO_DESCARGO <> :ll_nro_descargo AND
	 ROWNUM = 1;
	 
IF sqlca.sqlcode = 0 THEN 
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Alguna de las interrupciones que se han definido en el descargo, est$$HEX2$$e1002000$$ENDHEX$$definida previamente en otro descargo.",Exclamation!,ok!)	 
	Return ll_nro_descargo
ELSE
	Return 0
END IF

end function

public function integer fw_cargar_interrupciones ();int li_return, li_indice
datetime ldt_ini, ldt_fin, ldt_fecha
long ll_nro_descargo, ll_nro_instalacion

li_return = fw_validar_fechas()

IF li_return = 0 THEN
	
	ldt_fecha = datetime(today(),now())
	ldt_ini = dw_interrupcion.GetItemDateTime(1,'f_inicio')
	ldt_fin = dw_interrupcion.GetItemDateTime(1,'f_fin')
	ll_nro_descargo = dw_lista.GetItemNumber(1,'nro_descargo')
	dw_interrupcion.Reset()
	
	FOR li_indice = 1 TO dw_lista.rowcount()
		
		IF fw_comprobar_otras_int_desc(ll_nro_instalacion,ldt_ini,ldt_fin) <> 0 THEN
			dw_interrupcion.RESET()
			RETURN -1
		END IF
		
		ll_nro_instalacion = dw_lista.GetItemDecimal(li_indice,'cod_instalacion')
		dw_interrupcion.InsertRow(li_indice)
		dw_interrupcion.SetITem(li_indice,'nro_descargo',ll_nro_descargo)
		dw_interrupcion.SetItem(li_indice,'cod_instalacion',ll_nro_instalacion)
		dw_interrupcion.SetITem(li_indice,'f_inicio',ldt_ini)
		dw_interrupcion.SetITem(li_indice,'f_fin',ldt_fin)		
		dw_interrupcion.SetItem(li_indice,'usuario',gs_usuario)	
		dw_interrupcion.SetItem(li_indice,'programa','w_7106')
		dw_interrupcion.SetItem(li_indice,'f_alta',ldt_fecha)
		
	NEXT
	
END IF

return li_return





end function

on w_7106_marcar_interrupcion.create
int iCurrent
call super::create
this.dw_lista=create dw_lista
this.dw_interrupcion=create dw_interrupcion
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lista
this.Control[iCurrent+2]=this.dw_interrupcion
this.Control[iCurrent+3]=this.gb_1
end on

on w_7106_marcar_interrupcion.destroy
call super::destroy
destroy(this.dw_lista)
destroy(this.dw_interrupcion)
destroy(this.gb_1)
end on

event open;call super::open;DataStore ldt_lista
int li_indice

SetPointer(HourGlass!)
ldt_lista = Message.PowerObjectParm
dw_interrupcion.InsertRow(0)
dw_lista.SetTransObject(SQLCA)

FOR li_indice = 1 TO ldt_lista.rowcount()
	dw_lista.InsertRow(0)
	dw_lista.SetItem(li_indice,'nom_instalacion',ldt_lista.GetItemString(li_indice,'nom_instalacion'))
	dw_lista.SetItem(li_indice,'nro_descargo',ldt_lista.GetItemNumber(li_indice,'nro_descargo'))
	dw_lista.SetItem(li_indice,'tipo_instalacion',ldt_lista.GetItemNumber(li_indice,'tipo_instalacion'))	
	dw_lista.SetItem(li_indice,'cod_instalacion',ldt_lista.GetItemDecimal(li_indice,'cod_instalacion'))
NEXT

dw_interrupcion.SetItem(1,'f_inicio',ldt_lista.GetItemDateTime(1,'f_inicio'))
dw_interrupcion.SetItem(1,'f_fin',ldt_lista.GetItemDateTime(1,'f_fin'))
idt_inicio = dw_interrupcion.GetItemDatetime (1,'f_inicio')
idt_fin = dw_interrupcion.GetItemDatetime (1,'f_fin')
dw_lista.AcceptText()
dw_interrupcion.AcceptText()
SetPointer(Arrow!)
end event

event closequery;int li_respuesta, li_return
datetime ldt_ini, ldt_fin

dw_interrupcion.AcceptText()
ldt_ini = dw_interrupcion.GetItemDatetime(1,'f_inicio')
ldt_fin = dw_interrupcion.GetItemDatetime(1,'f_fin')

if isnull(ldt_ini) then
	gnv_msg.f_mensaje("AD27","","",ok!)
	return 1
end if

if isnull(ldt_fin) then
	gnv_msg.f_mensaje("AD28","","",ok!)
	return 1
end if
	
if ldt_ini > ldt_fin then
	gnv_msg.f_mensaje("AD50","","",ok!)
	dw_interrupcion.SetItem(1,'f_inicio',idt_inicio)
	dw_interrupcion.SetItem(1,'f_fin',idt_fin)
	return 1
end if

if ldt_ini = ldt_fin then
	gnv_msg.f_mensaje("AD51","","",ok!)
	dw_interrupcion.SetItem(1,'f_inicio',idt_inicio)
	dw_interrupcion.SetItem(1,'f_fin',idt_fin)
	return 1
end if

if (ldt_ini < idt_inicio) or (ldt_fin > idt_fin) then
	gnv_msg.f_mensaje("AD52","","",ok!)
	dw_interrupcion.SetItem(1,'f_inicio',idt_inicio)
	dw_interrupcion.SetItem(1,'f_fin',idt_fin)
	return 1
end if
	
if fw_cargar_interrupciones() = 0 then
	li_respuesta = Messagebox("Atencion","Desea guardar los cambios?",Question!,YesNo!)
	IF li_respuesta <> 1 THEN
		dw_interrupcion.Reset()
	END IF
else
	dw_interrupcion.Reset()
end if
end event

event close;DataStore ldw_interrupcion
int li_indice, li_total
datetime ldt_ini, ldt_fin

ldw_interrupcion = Create DataStore
ldw_interrupcion.DataObject = 'd_7004_fechas_interr'
li_total = dw_interrupcion.rowcount()
IF li_total>0 THEN
	ldt_ini = dw_interrupcion.GetItemDatetime(1,'f_inicio')
	ldt_fin = dw_interrupcion.GetItemDatetime(1,'f_fin')
	
	FOR li_indice = 1 TO li_total
		ldw_interrupcion.InsertRow(0)
		ldw_interrupcion.SetItem(li_indice,'nro_descargo',dw_interrupcion.GetItemNumber(li_indice,'nro_descargo'))
		ldw_interrupcion.SetItem(li_indice,'cod_instalacion',dw_interrupcion.GetItemDecimal(li_indice,'cod_instalacion'))
		ldw_interrupcion.SetItem(li_indice,'f_inicio',ldt_ini)	
		ldw_interrupcion.SetItem(li_indice,'f_fin',ldt_fin)
		ldw_interrupcion.SetItem(li_indice,'f_alta',dw_interrupcion.GetItemDatetime(li_indice,'f_alta'))
		ldw_interrupcion.SetItem(li_indice,'usuario',dw_interrupcion.GetItemString(li_indice,'usuario'))
		ldw_interrupcion.SetItem(li_indice,'programa',dw_interrupcion.GetItemString(li_indice,'programa'))
	NEXT
END IF
CloseWithReturn(w_7106_marcar_interrupcion,ldw_interrupcion)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7106_marcar_interrupcion
end type

type dw_lista from u_gen_0000_lista within w_7106_marcar_interrupcion
integer x = 9
integer y = 20
integer width = 1211
integer height = 896
integer taborder = 10
string dataobject = "dw_bloque_inst_desc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = false
end type

type dw_interrupcion from datawindow within w_7106_marcar_interrupcion
integer x = 1294
integer y = 356
integer width = 1362
integer height = 260
integer taborder = 20
string dataobject = "d_7004_fechas_interr"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_7106_marcar_interrupcion
integer x = 1257
integer y = 292
integer width = 1440
integer height = 368
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Intervalo Horario"
end type


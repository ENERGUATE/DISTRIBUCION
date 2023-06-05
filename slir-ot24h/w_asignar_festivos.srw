HA$PBExportHeader$w_asignar_festivos.srw
forward
global type w_asignar_festivos from w_sgigenerica
end type
type dw_festivos from u_cal_festivos within w_asignar_festivos
end type
type cb_borrar from commandbutton within w_asignar_festivos
end type
type cb_agregar from commandbutton within w_asignar_festivos
end type
type st_1 from statictext within w_asignar_festivos
end type
type sle_descripcion from singlelineedit within w_asignar_festivos
end type
type cb_cancelar from commandbutton within w_asignar_festivos
end type
type cb_aceptar from commandbutton within w_asignar_festivos
end type
type st_5 from statictext within w_asignar_festivos
end type
type ole_calendario from olecustomcontrol within w_asignar_festivos
end type
end forward

global type w_asignar_festivos from w_sgigenerica
integer x = 9
integer y = 272
integer width = 2903
integer height = 1412
windowtype windowtype = response!
long backcolor = 79741120
event ue_cambio_mes ( )
dw_festivos dw_festivos
cb_borrar cb_borrar
cb_agregar cb_agregar
st_1 st_1
sle_descripcion sle_descripcion
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
st_5 st_5
ole_calendario ole_calendario
end type
global w_asignar_festivos w_asignar_festivos

type variables
integer ii_month
integer ii_year
integer ii_dia_inicio=0
integer ii_dia_fin=0

boolean ib_dias[31]
boolean ib_hay_cambios = false

constant long il_rojo = RGB(255,0,0)
constant long ilk_activado = 15780518

datetime idt_primer_dia_mes
datetime idt_ultimo_dia_mes
end variables

forward prototypes
public subroutine fw_inicializar_calendario ()
public function integer fw_insertar_festivo (datetime pdt_dia_festivo)
public function integer fw_cargar_festivos ()
public subroutine fw_pintar_festivos ()
public function integer fw_borrar_festivo (datetime pdt_fecha)
public function boolean fw_es_festivo (datetime pdt_fecha)
public function string fw_obtener_descripcion (datetime pdt_fecha)
public subroutine fw_habilitar_botones ()
end prototypes

event ue_cambio_mes;IF ib_hay_cambios THEN
	IF gnv_msg.f_mensaje("CG01","","",YESNO!)=1 THEN
		cb_aceptar.TriggerEvent(clicked!)
	END IF
	ib_hay_cambios = FALSE
END IF

ii_dia_inicio = 0
ii_dia_fin = 0
	
fw_cargar_festivos()
	
ii_month = ole_calendario.Object.Month 
ii_year = ole_calendario.Object.Year 
	

end event

public subroutine fw_inicializar_calendario ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_inicializar_calendario
// 
// Objetivo: Suprime los colores pintados en el calendario, se desmarcan todos los d$$HEX1$$ed00$$ENDHEX$$as y
//				 se inicializan algunos objetos
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: 1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int li_dia

// se inicializa el calendario
ole_calendario.Object.ClearDays()
ii_dia_fin = 0
ii_dia_inicio = 0

FOR li_dia = 1 TO 31 
	ib_dias[li_dia] = FALSE
NEXT
end subroutine

public function integer fw_insertar_festivo (datetime pdt_dia_festivo);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_insertar_festivo
// 
// Objetivo: Inserta en la dw dw_festivos el d$$HEX1$$ed00$$ENDHEX$$a festivo seleccionado por el usuario
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: 1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_busqueda
int li_fila


IF fw_es_festivo(pdt_dia_festivo) THEN

	ls_busqueda = "fecha_fiesta = "	+ "(Datetime('" + string(pdt_dia_festivo) + "'))"
	li_fila = dw_festivos.Find(ls_busqueda,0, dw_festivos.RowCount())
	IF li_fila > 0 THEN
		dw_festivos.SetItem(li_fila,"desc_fiesta",sle_descripcion.Text)
	END IF
	
ELSE
	li_fila = dw_festivos.InsertRow(0)
	
	dw_festivos.SetItem(li_fila,"fecha_fiesta", pdt_dia_festivo)
	dw_festivos.SetItem(li_fila,"desc_fiesta",sle_descripcion.Text)
	dw_festivos.SetItem(li_fila,"usuario",gs_usuario)
	dw_festivos.SetItem(li_fila,"f_actual",fgnu_fecha_actual())
	dw_festivos.SetItem(li_fila,"programa","w_2271")
END IF

return 1
end function

public function integer fw_cargar_festivos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_cargar_festivos
// 
// Objetivo: Trae los festivos del mes seleccionado a la dw dw_festivos.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: 1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

date		ld_fecha
string	ls_fecha

ls_fecha = "01/" + String(ole_calendario.Object.Month) + "/" + &
				String(ole_calendario.Object.Year)

ld_fecha = fg_fecha_primer_dia_mes(Datetime(Date(ls_fecha)))
idt_primer_dia_mes = DateTime(ld_fecha, Time("00:00:00"))

ld_fecha = fg_fecha_ultimo_dia_mes(Datetime(Date(ls_fecha)))
idt_ultimo_dia_mes = DateTime(ld_fecha, Time("23:59:59"))
dw_festivos.Reset()
dw_festivos.Retrieve(idt_primer_dia_mes, idt_ultimo_dia_mes)

fw_pintar_festivos()
return 1

end function

public subroutine fw_pintar_festivos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_pintar_festivos
// 
// Objetivo: Pinta de color rojo en el calendario los d$$HEX1$$ed00$$ENDHEX$$as festivos que est$$HEX2$$e1002000$$ENDHEX$$en la dw dw_festivos
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: 1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int li_total_dias, li_cont, li_dia
Datetime ldt_fecha

li_total_dias = dw_festivos.RowCount()

IF li_total_dias <= 0 THEN
	Return 
END IF

// Cargo los dias
FOR li_cont = 1 TO li_total_dias // se recorren todos los intervalos
	// Se obtiene los extremos de cada intervalo
	ldt_fecha = dw_festivos.GetItemDateTime(li_cont,"fecha_fiesta")
	li_dia = Day(Date(ldt_fecha))
	
	// se pintan de verde todos los d$$HEX1$$ed00$$ENDHEX$$as del intervalo
	ole_calendario.Object.DayColor[li_dia] = RGB(128,128,0)
NEXT

Return 

end subroutine

public function integer fw_borrar_festivo (datetime pdt_fecha);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_borrar_festivo
// 
// Objetivo: Borra de la dw dw_festivos el d$$HEX1$$ed00$$ENDHEX$$a festivo seleccionado por el usuario
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: 1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_busqueda
int li_fila

ls_busqueda = "fecha_fiesta = "	+ "(Datetime('" + string(pdt_fecha) + "'))"

li_fila = dw_festivos.Find(ls_busqueda,0, dw_festivos.RowCount())

IF li_fila > 0 THEN
	dw_festivos.DeleteRow(li_fila)
END IF

return 1
end function

public function boolean fw_es_festivo (datetime pdt_fecha);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_es_festivo
// 
// Objetivo: Indica si el d$$HEX1$$ed00$$ENDHEX$$a pasado como argumento es festivo
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: true  -  si el d$$HEX1$$ed00$$ENDHEX$$a es festivo
//				 false -  si el d$$HEX1$$ed00$$ENDHEX$$a no es festivo
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	24/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
string ls_busqueda
int li_fila

ls_busqueda = "fecha_fiesta = "	+ "(Datetime('" + string(pdt_fecha) + "'))"
li_fila = dw_festivos.Find(ls_busqueda,0, dw_festivos.RowCount())

Return li_fila > 0 
end function

public function string fw_obtener_descripcion (datetime pdt_fecha);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_obtener_descripcion
// 
// Objetivo: Devuelve en str_ret la descripci$$HEX1$$f300$$ENDHEX$$n del d$$HEX1$$ed00$$ENDHEX$$a festivo
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pdt_fecha
//		Salida:   --
//						
// Devuelve: str_ret
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	27/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string str_ret=""
string ls_busqueda
int li_fila

ls_busqueda = "fecha_fiesta = "	+ "(Datetime('" + string(pdt_fecha) + "'))"

li_fila = dw_festivos.Find(ls_busqueda,0, dw_festivos.RowCount())

IF li_fila > 0 THEN
	str_ret=dw_festivos.GetItemString(li_fila, 'desc_fiesta')
END IF

return str_ret
end function

public subroutine fw_habilitar_botones ();//////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_habilitar_botones
// 
// Objetivo: Habilita o deshabilita el bot$$HEX1$$f300$$ENDHEX$$n de borrar dependiendo de los d$$HEX1$$ed00$$ENDHEX$$as
//				 que el usuario ha seleccionado. Si todos los d$$HEX1$$ed00$$ENDHEX$$as seleccionados son festivos
// 			 entonces se habilita, si no se deshabilita
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: 1
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	27/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////////////////////////////////////////////////////

String ls_fecha
int li_indice, li_mes, li_a$$HEX1$$f100$$ENDHEX$$o, li_dias_marcados
Boolean lb_habilitado = TRUE

li_dias_marcados = 0
li_mes = ole_calendario.Object.Month
li_a$$HEX1$$f100$$ENDHEX$$o = ole_calendario.Object.Year
	
li_indice = 1
DO WHILE li_indice <=31 AND lb_habilitado
	IF ib_dias[li_indice] = TRUE THEN
		ls_fecha= String(li_indice)+"/"+String(li_mes)+"/"+String(li_a$$HEX1$$f100$$ENDHEX$$o)
		IF NOT fw_es_festivo(Datetime(Date(ls_fecha))) THEN
			lb_habilitado = FALSE
		END IF
		li_dias_marcados++
	END IF
	li_indice++
LOOP

cb_borrar.enabled = lb_habilitado AND li_dias_marcados > 0
IF li_dias_marcados = 0 THEN
	cb_agregar.enabled = FALSE
END IF
	
end subroutine

on w_asignar_festivos.create
int iCurrent
call super::create
this.dw_festivos=create dw_festivos
this.cb_borrar=create cb_borrar
this.cb_agregar=create cb_agregar
this.st_1=create st_1
this.sle_descripcion=create sle_descripcion
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.st_5=create st_5
this.ole_calendario=create ole_calendario
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_festivos
this.Control[iCurrent+2]=this.cb_borrar
this.Control[iCurrent+3]=this.cb_agregar
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.sle_descripcion
this.Control[iCurrent+6]=this.cb_cancelar
this.Control[iCurrent+7]=this.cb_aceptar
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.ole_calendario
end on

on w_asignar_festivos.destroy
call super::destroy
destroy(this.dw_festivos)
destroy(this.cb_borrar)
destroy(this.cb_agregar)
destroy(this.st_1)
destroy(this.sle_descripcion)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.st_5)
destroy(this.ole_calendario)
end on

event open;call super::open;int li_cont

dw_festivos.SetTransObject(SQLCA)

FOR li_cont = 1 to 31
	ib_dias[li_cont] = False
NEXT

//Hago que el calendario muestre la fecha actual
ole_calendario.Object.Today
ole_calendario.object.year = year(today())

ole_calendario.Object.WeekendColor = il_rojo
ii_month = ole_calendario.Object.Month 
fw_cargar_festivos()

if gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_MANTEN')=0 THEN
	This.Title = "Consulta de D$$HEX1$$ed00$$ENDHEX$$as Festivos"
	cb_aceptar.visible = FALSE
	cb_agregar.visible = FALSE
	cb_borrar.visible = FALSE
	cb_cancelar.visible = FALSE
	st_1.visible = FALSE
	sle_descripcion.visible = FALSE
ELSE
	This.Title = "Mantenimiento de D$$HEX1$$ed00$$ENDHEX$$as Festivos"
END IF
	
end event

event close;IF ib_hay_cambios THEN
	IF gnv_msg.f_mensaje("CG01","","",YESNO!)=1 THEN
		cb_aceptar.TriggerEvent(clicked!)
	END IF
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_asignar_festivos
end type

type dw_festivos from u_cal_festivos within w_asignar_festivos
integer x = 1230
integer y = 196
integer width = 1550
integer height = 556
integer taborder = 20
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event dberror;call super::dberror;return 1
end event

type cb_borrar from commandbutton within w_asignar_festivos
integer x = 1650
integer y = 1140
integer width = 352
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Borrar"
end type

event clicked;
Integer	li_index, li_fila_borrada = 1
DateTime	ldt_fecha
String	ls_fecha
long ll_nro_brigada

IF gnv_msg.f_mensaje("CM18","","",YESNO!) = 1 THEN

	ib_hay_cambios = TRUE
	// Se obtiene la brigada para la que queremos borrar los d$$HEX1$$ed00$$ENDHEX$$as
	
	FOR li_index = 1 TO 31 // se recorren todos los d$$HEX1$$ed00$$ENDHEX$$as del mes
		IF ib_dias[li_index] THEN // este d$$HEX1$$ed00$$ENDHEX$$a est$$HEX2$$e1002000$$ENDHEX$$marcado para borrar
			ls_fecha = String(li_index) + '/' + &
						  String(ole_calendario.Object.Month) + '/' + &
						  String(ole_calendario.Object.Year)
			
			IF IsDate(ls_fecha) THEN
				ldt_fecha = DateTime(Date(ls_fecha))
			ELSE
				EXIT
			END IF
			// Borramos todos los el d$$HEX1$$ed00$$ENDHEX$$a festivo
			fw_borrar_festivo(ldt_fecha)
		END IF
	NEXT
	
	ii_dia_inicio = 0
	ii_dia_fin = 0
	
	// se inicializa el calendario
	fw_inicializar_calendario()
	// se pinta el calendario
	fw_pintar_festivos()
	cb_agregar.enabled = FALSE
	sle_descripcion.Text = ""
END IF
end event

type cb_agregar from commandbutton within w_asignar_festivos
integer x = 905
integer y = 1140
integer width = 375
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "A&gregar"
end type

event clicked;string ls_fecha_festivo
Datetime ldt_f_festivo
int li_cont

FOR li_cont = 1 TO 31 // se recorren todos los d$$HEX1$$ed00$$ENDHEX$$as del mes
	IF ib_dias[li_cont] THEN // si el d$$HEX1$$ed00$$ENDHEX$$a est$$HEX2$$e1002000$$ENDHEX$$marcado por el usuario
		ls_fecha_festivo = String(li_cont) + '/' + &
							 String(ole_calendario.Object.Month) + '/' + &
							 String(ole_calendario.Object.Year)
		
		IF IsDate(ls_fecha_festivo) THEN
			ldt_f_festivo = DateTime(Date(ls_fecha_festivo))
			fw_insertar_festivo(ldt_f_festivo)
		END IF
	END IF
NEXT

ii_dia_fin = 0
ii_dia_inicio = 0
ib_hay_cambios = TRUE
cb_agregar.enabled = FALSE
cb_borrar.enabled = FALSE
sle_descripcion.Text = ""

fw_pintar_festivos()
end event

type st_1 from statictext within w_asignar_festivos
integer x = 1239
integer y = 832
integer width = 370
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Descripci$$HEX1$$f300$$ENDHEX$$n :"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_descripcion from singlelineedit within w_asignar_festivos
integer x = 1673
integer y = 816
integer width = 1102
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_asignar_festivos
integer x = 2363
integer y = 1140
integer width = 361
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cerrar"
end type

event clicked;gnu_u_transaction.uf_rollback(Parent)

Close(Parent)
end event

type cb_aceptar from commandbutton within w_asignar_festivos
integer x = 114
integer y = 1140
integer width = 370
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;IF dw_festivos.update()=-1 THEN
	gnv_msg.f_mensaje("EM61","","",OK!)
	gnu_u_transaction.uf_rollback()
ELSE
	gnu_u_transaction.uf_commit()
END IF
ib_hay_cambios = FALSE
end event

type st_5 from statictext within w_asignar_festivos
integer x = 1230
integer y = 112
integer width = 1550
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 67108864
long backcolor = 8421504
boolean enabled = false
string text = "D$$HEX1$$ed00$$ENDHEX$$as festivos para el mes actual"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type ole_calendario from olecustomcontrol within w_asignar_festivos
event datechange ( ref integer ndow,  ref integer nday,  ref integer nmonth,  ref integer nyear )
event click ( )
event dblclick ( )
event keydown ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event keyup ( ref integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
integer x = 114
integer y = 112
integer width = 1074
integer height = 800
integer taborder = 10
borderstyle borderstyle = stylelowered!
string binarykey = "w_asignar_festivos.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

event keydown;IF KeyDown(KeyDownArrow!) OR KeyDown(KeyUpArrow!) OR &
	KeyDown(KeyLeftArrow!) OR KeyDown(KeyRightArrow!) OR &
	KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!) OR &
	KeyDown(KeyEnd!) OR KeyDown(KeyHome!) THEN
	
	This.Event mousedown(1,0,0,0)
END IF
end event

event mousedown;integer li_indice, li_maxdias, li_dia, li_mes, li_a$$HEX1$$f100$$ENDHEX$$o
string ls_fecha

//	shift:
//		1 -> shift
//		2 -> control
//		3 ->
//		4 -> alt

// Se quitan los colores del calendario
ole_calendario.Object.ClearDays
// Se obtiene el d$$HEX1$$ed00$$ENDHEX$$a, el mes y el a$$HEX1$$f100$$ENDHEX$$o, del d$$HEX1$$ed00$$ENDHEX$$a que ha pinchado el usuario
li_dia = ole_calendario.Object.Day
li_mes = ole_calendario.Object.Month
li_a$$HEX1$$f100$$ENDHEX$$o = ole_calendario.Object.Year
	
IF button = 1 THEN // Se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo del rat$$HEX1$$f300$$ENDHEX$$n
	ls_fecha= String(li_dia)+"/"+String(li_mes)+"/"+String(li_a$$HEX1$$f100$$ENDHEX$$o)
	cb_agregar.enabled = TRUE
	// Se comprueba la validez de la fecha
	IF NOT IsDate(ls_fecha) THEN
		RETURN
	END IF
	IF ii_month <> li_mes OR li_a$$HEX1$$f100$$ENDHEX$$o <> ii_year THEN // Hay cambio de mes
		Parent.TriggerEvent("ue_cambio_mes")
		Return
	END IF
	if gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_MANTEN')=1 THEN
	// Comprobamos si la pulsaci$$HEX1$$f300$$ENDHEX$$n del rat$$HEX1$$f300$$ENDHEX$$n va acompa$$HEX1$$f100$$ENDHEX$$ada de alguna tecla
		CHOOSE CASE shift
			CASE 0 // se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo del rat$$HEX1$$f300$$ENDHEX$$n sin nada m$$HEX1$$e100$$ENDHEX$$s.
				// Se inicializa el calendario
				fw_inicializar_calendario()
				IF DayName(Date(ls_fecha)) <> "Saturday" AND DayName(Date(ls_fecha)) <> "Sunday" THEN 
				// El d$$HEX1$$ed00$$ENDHEX$$a pulsado no es festivo 
					// Se habilita el bot$$HEX1$$f300$$ENDHEX$$n de borrar en el caso de que el d$$HEX1$$ed00$$ENDHEX$$a seleccionado
					// ya tuviera asignado un horario
					IF fw_es_festivo(DateTime(Date(ls_fecha)) ) THEN
						cb_borrar.enabled = TRUE
						sle_descripcion.Text = fw_obtener_descripcion(DateTime(Date(ls_fecha)) )
					ELSE
						cb_borrar.enabled = FALSE
						sle_descripcion.Text = ""
					END IF
					ii_dia_inicio = li_dia
					ib_dias[li_dia] = TRUE
					
				ELSE
					cb_borrar.enabled = FALSE
					cb_agregar.enabled = FALSE
					sle_descripcion.Text = ""
				END IF
								
			CASE 1 // se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo y la tecla shift
				// se marcan los d$$HEX1$$ed00$$ENDHEX$$as nuevos seleccionados
				sle_descripcion.Text =""
				IF ii_dia_inicio > 0 THEN
					// Ya se ha marcado un d$$HEX1$$ed00$$ENDHEX$$a con anterioridad
					
					// Se captura la regi$$HEX1$$f300$$ENDHEX$$n
					IF ii_dia_inicio < li_dia THEN
						ii_dia_fin = li_dia
					ELSE 
						ii_dia_fin = ii_dia_inicio
						ii_dia_inicio = li_dia
					END IF
					
					// En este bucle se marcan los d$$HEX1$$ed00$$ENDHEX$$as seleccionados. Si se pasa por un s$$HEX1$$e100$$ENDHEX$$bado o domingo
					// el d$$HEX1$$ed00$$ENDHEX$$a no se marca.
					FOR li_indice=1 TO 31 // Se recorren todos los d$$HEX1$$ed00$$ENDHEX$$as del calendario
						IF li_indice >= ii_dia_inicio AND li_indice <= ii_dia_fin THEN
							// El d$$HEX1$$ed00$$ENDHEX$$a se encuentra entre los seleccionados
							ls_fecha= String(li_indice)+"/"+String(li_mes)+"/"+String(li_a$$HEX1$$f100$$ENDHEX$$o)
							IF DayName(Date(ls_fecha)) <> "Saturday" AND DayName(Date(ls_fecha)) <> "Sunday" THEN
								// Se marca el d$$HEX1$$ed00$$ENDHEX$$a para pintarlo posteriormente
								ib_dias[li_indice] = TRUE
							ELSE
								// Este d$$HEX1$$ed00$$ENDHEX$$a no es de los seleccionados
								ib_dias[li_indice] = FALSE
							END IF
						ELSE
							// Este d$$HEX1$$ed00$$ENDHEX$$a no es de los seleccionados
							ib_dias[li_indice] = FALSE
						END IF
					NEXT
					fw_habilitar_botones()
				ELSE
					// Este es el primer d$$HEX1$$ed00$$ENDHEX$$a que se marca, a$$HEX1$$fa00$$ENDHEX$$n no hay regi$$HEX1$$f300$$ENDHEX$$n
					IF DayName(Date(ls_fecha)) <> "Saturday" AND DayName(Date(ls_fecha)) <> "Sunday" THEN
						// El d$$HEX1$$ed00$$ENDHEX$$a marcado es v$$HEX1$$e100$$ENDHEX$$lido 
						ii_dia_inicio = li_dia
						ib_dias[li_dia] = TRUE
						fw_habilitar_botones()
						//cb_borrar.enabled = fw_es_festivo(DateTime(Date(ls_fecha)) )
					ELSE
						cb_borrar.enabled = FALSE
						cb_agregar.enabled = FALSE
						sle_descripcion.Text = ""
					END IF
					
				END IF
				
			CASE 2 // se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo y la tecla control
				// En este caso se van marcando los d$$HEX1$$ed00$$ENDHEX$$a individualmente, no se marcan regiones
				sle_descripcion.Text = ""
				IF DayName(Date(ls_fecha)) <> "Saturday" AND DayName(Date(ls_fecha)) <> "Sunday" THEN
					// El d$$HEX1$$ed00$$ENDHEX$$a marcado es v$$HEX1$$e100$$ENDHEX$$lido
					ii_dia_inicio = li_dia
					// Si el d$$HEX1$$ed00$$ENDHEX$$a estaba seleccionado, se deselecciona, y si no lo estaba se selecciona
					ib_dias[li_dia] = NOT ib_dias[li_dia]
					//Se comprueba si se pueden habilitar los botones de borrar y agregar
					fw_habilitar_botones()
				END IF
			
		END CHOOSE
	END IF
END IF

// Se pintan de verde los d$$HEX1$$ed00$$ENDHEX$$a que tienen horario
fw_pintar_festivos()

// Se pintan de azul los d$$HEX1$$ed00$$ENDHEX$$as seleccionados. Si los festivos no est$$HEX1$$e100$$ENDHEX$$n seleccionados se pintan de rojo
For li_indice=1 To 31
	IF ib_dias[li_indice] = TRUE THEN
		ole_calendario.Object.DayColor[li_indice] = ilk_activado 
	END IF
Next
This.SetRedraw(True)

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
04w_asignar_festivos.bin 
2F00001000e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe0000000400000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003b97bd7001c4b20400000003000005c00000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000044200000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000048caeadc011cf25b57d9cfe9d19c9b237000000003b8e95b001c4b2043b97bd7001c4b204000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012fffffffe000000140000001500000016fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f0043007900700069007200680067002000740063002800200029003900310036003900470020006d0061007300650061006d0020006e006e0049002e00630000fffe000201058caeadc011cf25b57d9cfe9d19c9b23700000001fb8f0821101b01640008ed8413c72e2b00000030000004120000001300000100000000a000000101000000a800000102000000b000000103000000b800000104000000c00000010500000204000001060000020c0000010700000214000001080000021c00000109000002240000010a0000022c0000010b000002340000010c0000023c0000010d000002440000010e0000024c0000010f00000254000001100000025c000001110000027400000000000002d80000000300010000000000030000184a00000003000014ac00000003000000640000004b000001390000fffe000101050be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001de84000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c00000003000006d3000000020000000e000000020000000a00000002000007700000000200000000000000020000000000000002000000000000000200000000000000020000000300000002000000010000000b0000ffff000000080000000e2c4c2c442c582c4d2c562c4a00000053000000080000005a72656e4565462c6f72657262614d2c6f2c6f7a7269726241614d2c6c4a2c6f796f696e756c754a2c412c6f6974736f6765532c6f656974706572626d634f202c726275746f4e2c656d6569762c6572626963694472626d65000000650000001300000000000000010001100000000a0079616400646165680a0072650c0000016c0000006c6576657366666f0e00746509000001660000007473726900796164000001060000000400796164000001030000000c6f74735f72706b630073706f000001110000000b746e6f6d6d616e680b0073650a0000016400000078657461657a6973000109000000070074636100006e6f690000010c0000000a657461647a697379010f0065000d00006f6d00006268746e6f7474750100736e090000015f000000657478650078746e0000010700000006746e6f6d0102006800090000655f00006e657478080079740500000179000000007261650000010d0000000b6574616464726f6204007265050000016600000000746e6f00000100000000097265765f6e6f6973000105000000050074616400006e00650073007600720063006c006f0000006c00620070005f006d006200730062006e0074006f006f00740000006d00620070005f006d006200730064006e000100000000184a000014ac00000064e3520300ce8f910b00e39d11b84b00aa0000015184019000040001de766c6548c00100000000c0c000000000ff000000ffffffff0000000080000000d30080800e00000670000a000000000700000000020000000100030002000000010101004c2c440d582c4d2c562c4a2c4559532c6f72656e6265462c6f72657272614d2c412c6f7a6c69726279614d2c754a2c6f2c6f696e696c754a67412c6f6f74736f7065532c6d6569742c65726274634f2065726275766f4e2c626d6569442c6572656963696572626d0000006e00620070005f006d00620073006c006e006e0069007500650000007000620070005f006d006200730070006e00670061006400650077006f0000006e00620070005f006d006200730070006e00670061007500650000007000620070005f006d00620073006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000013000000d8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14w_asignar_festivos.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
